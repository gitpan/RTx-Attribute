# $File: //member/autrijus/RTx-Attribute/lib/RTx/Attributes_Overlay.pm $ $Author: autrijus $
# $Revision: #2 $ $Change: 8032 $ $DateTime: 2003/09/10 09:37:30 $

=head1 NAME

  RTx::Attributes - collection of RTx::Attribute objects

=head1 SYNOPSIS

  use RTx::Attributes;
my $Attributes = new RTx::Attributes($CurrentUser);

=head1 DESCRIPTION


=head1 METHODS

=begin testing

ok(require RTx::Attributes);

=end testing

=cut

use strict;
no warnings qw(redefine);


=head2 Next

Hand out the next Attribute that was found

=cut


# {{{ LimitToObject 

=head2 LimitToObject $object

Limit the Attributes to rights for the object $object. It needs to be an RT::Record class.

=cut

sub LimitToObject {
    my $self = shift;
    my $obj = shift;
    unless (defined($obj) && ref($obj) && UNIVERSAL::can($obj, 'id')) {
    return undef;
    }
    $self->Limit(FIELD => 'ObjectType', OPERATOR=> '=', VALUE => ref($obj), ENTRYAGGREGATOR => 'OR');
    $self->Limit(FIELD => 'ObjectId', OPERATOR=> '=', VALUE => $obj->id, ENTRYAGGREGATOR => 'OR', QUOTEVALUE => 0);

}

# }}}

1;
