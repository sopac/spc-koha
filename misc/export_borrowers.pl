#!/usr/bin/perl

# Copyright 2011 BibLibre
#
# This file is part of Koha.
#
# Koha is free software; you can redistribute it and/or modify it under the
# terms of the GNU General Public License as published by the Free Software
# Foundation; either version 2 of the License, or (at your option) any later
# version.
#
# Koha is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with Koha; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

# Script to export borrowers

use Modern::Perl;
use Text::CSV;
use Getopt::Long qw(:config no_ignore_case);

use C4::Context;
use C4::Members;

use encoding 'utf8';

sub print_usage {
    ( my $basename = $0 ) =~ s|.*/||;
    print <<USAGE;

$basename
    Export patron informations in CSV format.
    It prints to standard output. Use redirection to save CSV in a file.

Usage:
$0 [--field=FIELD [--field=FIELD [...]]] [--show-header]
$0 -h

    -f, --field=FIELD       Field to export. It is repeatable and has to match
                            keys returned by the GetMemberDetails function.
                            If no field is specified, then all fields will be
                            exported.
    -H, --show-header       Print field names on first row
    -h, --help              Show this help

USAGE
}

# Getting parameters
my @fields;
my $show_header;
my $help;

GetOptions(
    'field|f=s'     => \@fields,
    'show-header|H' => \$show_header,
    'help|h'        => \$help
) or print_usage, exit 1;

if ($help) {
    print_usage;
    exit;
}

# Getting borrowers
my $dbh   = C4::Context->dbh;
my $query = "SELECT borrowernumber FROM borrowers ORDER BY borrowernumber";
my $sth   = $dbh->prepare($query);
$sth->execute;

my $csv = Text::CSV->new( { binary => 1 } );

# If the user did not specify any field to export, we assume he wants them all
# We retrieve the first borrower informations to get field names
my ($borrowernumber) = $sth->fetchrow_array;
my $member = GetMemberDetails($borrowernumber);
@fields = keys %$member unless (@fields);

if ($show_header) {
    $csv->combine(@fields);
    print $csv->string . "\n";
}

$csv->combine(
    map {
        ( defined $member->{$_} and !ref $member->{$_} )
          ? $member->{$_}
          : ''
      } @fields
);
die "Invalid character at borrower $borrowernumber: ["
  . $csv->error_input . "]\n"
  if ( !defined( $csv->string ) );
print $csv->string . "\n";

while ( my $borrowernumber = $sth->fetchrow_array ) {
    $member = GetMemberDetails($borrowernumber);
    $csv->combine(
        map {
            ( defined $member->{$_} and !ref $member->{$_} )
              ? $member->{$_}
              : ''
          } @fields
    );
    die "Invalid character at borrower $borrowernumber: ["
      . $csv->error_input . "]\n"
      if ( !defined( $csv->string ) );
    print $csv->string . "\n";
}
