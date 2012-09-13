package C4::Barcodes::EAN13;

# Copyright 2012 Koha Development team
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

use strict;
use warnings;

use C4::Context;
use C4::Debug;

use Algorithm::CheckDigits;

use vars qw($VERSION @ISA);
use vars qw($debug $cgi_debug);	# from C4::Debug, of course

BEGIN {
    $VERSION = 0.01;
    @ISA = qw(C4::Barcodes);
}

sub parse {
    my $self = shift;
    my $barcode = (@_) ? shift : $self->value;
    my $ean = CheckDigits('ean');
    if ( $ean->is_valid($barcode) ) {
        return ( '', $ean->basenumber($barcode), $ean->checkdigit($barcode) );
    } else {
        die "$barcode not valid EAN-13 barcode";
    }
}

sub process_tail {
    my ( $self,$tail,$whole,$specific ) = @_;
    my $ean = CheckDigits('ean');
    my $full = $ean->complete($whole);
    my $chk  = $ean->checkdigit($full);
    $debug && warn "# process_tail $tail -> $chk [$whole -> $full] $specific";
    return $chk;
}

1;
__END__
