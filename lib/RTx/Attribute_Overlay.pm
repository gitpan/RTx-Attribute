# $File: //member/autrijus/RTx-Attribute/lib/RTx/Attribute_Overlay.pm $ $Author: autrijus $
# $Revision: #2 $ $Change: 8032 $ $DateTime: 2003/09/10 09:37:30 $

use strict;
no warnings qw(redefine);
use RTx::SearchBuilder_Overlay::Attribute;

=head1 NAME

  RTx::Attribute_Overlay 

=head1 DESCRIPTION

=head2 Create PARAMHASH

Create takes a hash of values and creates a row in the database:

  varchar(200) 'Name'.
  varchar(255) 'Description'.
  varchar(64) 'ObjectType'.
  int(11) 'ObjectId'.

You may pass a C<Object> instead of C<ObjectType> and C<ObjectId>.

=cut




sub Create {
    my $self = shift;
    my %args = ( 
                Name => '',
                Description => '',
                ObjectType => '',
                ObjectId => '0',
		  @_);

    if ($args{Object} and UNIVERSAL::can($args{Object}, 'Id')) {
	$args{ObjectType} = ref($args{Object});
	$args{ObjectId} = $args{Object}->Id;
    }

    $self->SUPER::Create(
                         Name => $args{'Name'},
                         Description => $args{'Description'},
                         ObjectType => $args{'ObjectType'},
                         ObjectId => $args{'ObjectId'},
);

}


# {{{ sub LoadByNameAndObject

=head2  LoadByNameAndObject (Object => OBJECT, Name => NAME)

Loads the Attribute named NAME for Object OBJECT.

=cut

sub LoadByNameAndObject {
    my $self = shift;
    my %args = (
        Object => undef,
        Name  => undef,
        @_,
    );

    return (
	$self->LoadByCols(
	    Name => $args{'Name'},
	    ObjectType => ref($args{'Object'}),
	    ObjectId => $args{'Object'}->Id,
	)
    );

}

# }}}

1;
