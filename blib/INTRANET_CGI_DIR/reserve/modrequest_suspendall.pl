#!/usr/bin/perl

#script to modify reserves/requests
#written 2/1/00 by chris@katipo.oc.nz
#last update 27/1/2000 by chris@katipo.co.nz


# Copyright 2000-2002 Katipo Communications
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
use CGI;
use C4::Output;
use C4::Reserves;
use C4::Auth;

my $query = new CGI;
my ( $template, $loggedinuser, $cookie ) = get_template_and_user(
    {
        template_name   => "about.tmpl",
        query           => $query,
        type            => "intranet",
        authnotrequired => 0,
        flagsrequired   => { catalogue => 1 },
        debug           => 1,
    }
);

my $borrowernumber = $query->param('borrowernumber');
my $suspend        = $query->param('suspend');
my $suspend_until  = $query->param('suspend_until');

SuspendAll( borrowernumber => $borrowernumber, suspend_until => $suspend_until, suspend => $suspend );

my $from = $query->param('from');
$from ||= q{};
if ( $from eq 'borrower'){
    print $query->redirect("/cgi-bin/koha/members/moremember.pl?borrowernumber=$borrowernumber");
} elsif ( $from eq 'circ'){
    print $query->redirect("/cgi-bin/koha/circ/circulation.pl?borrowernumber=$borrowernumber");
} else {
    print $query->redirect("/cgi-bin/koha/circ/circulation.pl?borrowernumber=$borrowernumber");
}
