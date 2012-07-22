#!/usr/bin/perl

# Copyright 2011 BibLibre SARL
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

=head1 NAME

itemrecorddisplay.pl

=head1 DESCRIPTION

Return a HTML form for Item record modification or creation.
It uses PrepareItemrecordDisplay

=cut

use strict;
use warnings;

use CGI;
use C4::Auth;
use C4::Output;
use C4::Items;

my $input = new CGI;
my ($template, $loggedinuser, $cookie, $flags) = get_template_and_user( {
    template_name   => 'services/itemrecorddisplay.tmpl',
    query           => $input,
    type            => 'intranet',
    authnotrequired => 1,
} );

my $biblionumber = $input->param('biblionumber') || '';
my $itemnumber = $input->param('itemnumber') || '';
my $frameworkcode = $input->param('frameworkcode') || '';

my $result = PrepareItemrecordDisplay($biblionumber, $itemnumber, undef, $frameworkcode);
unless($result) {
    $result = PrepareItemrecordDisplay($biblionumber, $itemnumber, undef, '');
}

$template->param(%$result);

output_html_with_http_headers $input, $cookie, $template->output;
