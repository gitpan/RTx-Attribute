# $File: //member/autrijus/RTx-Attribute/lib/RTx/Attribute.pm $ $Author: autrijus $
# $Revision: #2 $ $Change: 8032 $ $DateTime: 2003/09/10 09:37:30 $

use strict;


=head1 NAME

RTx::Attribute


=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 METHODS

=cut

package RTx::Attribute;
$RTx::Attribute::VERSION = '0.00_01';
use RT::Record; 


use vars qw( @ISA );
@ISA= qw( RT::Record );

sub _Init {
  my $self = shift; 

  $self->Table('Attributes');
  $self->SUPER::_Init(@_);
}





=head2 Create PARAMHASH

Create takes a hash of values and creates a row in the database:

  varchar(200) 'Name'.
  varchar(255) 'Description'.
  varchar(64) 'ObjectType'.
  int(11) 'ObjectId'.

=cut




sub Create {
    my $self = shift;
    my %args = ( 
                Name => '',
                Description => '',
                ObjectType => '',
                ObjectId => '',

		  @_);
    $self->SUPER::Create(
                         Name => $args{'Name'},
                         Description => $args{'Description'},
                         ObjectType => $args{'ObjectType'},
                         ObjectId => $args{'ObjectId'},
);

}



=head2 id

Returns the current value of id. 
(In the database, id is stored as int(11).)


=cut


=head2 Name

Returns the current value of Name. 
(In the database, Name is stored as varchar(200).)



=head2 SetName VALUE


Set Name to VALUE. 
Returns (1, 'Status message') on success and (0, 'Error Message') on failure.
(In the database, Name will be stored as a varchar(200).)


=cut


=head2 Description

Returns the current value of Description. 
(In the database, Description is stored as varchar(255).)



=head2 SetDescription VALUE


Set Description to VALUE. 
Returns (1, 'Status message') on success and (0, 'Error Message') on failure.
(In the database, Description will be stored as a varchar(255).)


=cut


=head2 ObjectType

Returns the current value of ObjectType. 
(In the database, ObjectType is stored as varchar(64).)



=head2 SetObjectType VALUE


Set ObjectType to VALUE. 
Returns (1, 'Status message') on success and (0, 'Error Message') on failure.
(In the database, ObjectType will be stored as a varchar(64).)


=cut


=head2 ObjectId

Returns the current value of ObjectId. 
(In the database, ObjectId is stored as int(11).)



=head2 SetObjectId VALUE


Set ObjectId to VALUE. 
Returns (1, 'Status message') on success and (0, 'Error Message') on failure.
(In the database, ObjectId will be stored as a int(11).)


=cut



sub _ClassAccessible {
    {
     
        id =>
		{read => 1, type => 'int(11)', default => ''},
        Name => 
		{read => 1, write => 1, type => 'varchar(200)', default => ''},
        Description => 
		{read => 1, write => 1, type => 'varchar(255)', default => ''},
        ObjectType => 
		{read => 1, write => 1, type => 'varchar(64)', default => ''},
        ObjectId => 
		{read => 1, write => 1, type => 'int(11)', default => ''},

 }
};


        eval "require RTx::Attribute_Overlay";
        if ($@ && $@ !~ qr{^Can't locate RTx/Attribute_Overlay.pm}) {
            die $@;
        };

        eval "require RTx::Attribute_Vendor";
        if ($@ && $@ !~ qr{^Can't locate RTx/Attribute_Vendor.pm}) {
            die $@;
        };

        eval "require RTx::Attribute_Local";
        if ($@ && $@ !~ qr{^Can't locate RTx/Attribute_Local.pm}) {
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

RTx::Attribute_Overlay, RTx::Attribute_Vendor, RTx::Attribute_Local

=cut


1;
