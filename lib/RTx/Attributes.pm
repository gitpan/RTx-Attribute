# $File: //member/autrijus/RTx-Attribute/lib/RTx/Attributes.pm $ $Author: autrijus $
# $Revision: #2 $ $Change: 8032 $ $DateTime: 2003/09/10 09:37:30 $

use strict;


=head1 NAME

  RTx::Attributes -- Class Description
 
=head1 SYNOPSIS

  use RTx::Attributes

=head1 DESCRIPTION


=head1 METHODS

=cut

package RTx::Attributes;

use RT::SearchBuilder;
use RTx::Attribute;

use vars qw( @ISA );
@ISA= qw(RT::SearchBuilder);


sub _Init {
    my $self = shift;
    $self->{'table'} = 'Attributes';
    $self->{'primary_key'} = 'id';


    return ( $self->SUPER::_Init(@_) );
}


=head2 NewItem

Returns an empty new RTx::Attribute item

=cut

sub NewItem {
    my $self = shift;
    return(RTx::Attribute->new($self->CurrentUser));
}

        eval "require RTx::Attributes_Overlay";
        if ($@ && $@ !~ qr{^Can't locate RT/Attributes_Overlay.pm}) {
            die $@;
        };

        eval "require RTx::Attributes_Vendor";
        if ($@ && $@ !~ qr{^Can't locate RT/Attributes_Vendor.pm}) {
            die $@;
        };

        eval "require RTx::Attributes_Local";
        if ($@ && $@ !~ qr{^Can't locate RT/Attributes_Local.pm}) {
            die $@;
        };




=head1 SEE ALSO

This class allows "overlay" methods to be placed
into the following files _Overlay is for a System overlay by the original author,
_Vendor is for 3rd-party vendor add-ons, while _Local is for site-local customizations.  

These overlay files can contain new subs or subs to replace existing subs in this module.

If you'll be working with perl 5.6.0 or greater, each of these files should begin with the line 

   no warnings qw(redefine);

so that perl does not kick and scream when you redefine a subroutine or variable in your overlay.

RTx::Attributes_Overlay, RTx::Attributes_Vendor, RTx::Attributes_Local

=cut


1;
