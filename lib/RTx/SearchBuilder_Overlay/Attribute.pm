# $File: //member/autrijus/RTx-Attribute/lib/RTx/SearchBuilder_Overlay/Attribute.pm $ $Author: autrijus $
# $Revision: #1 $ $Change: 8032 $ $DateTime: 2003/09/10 09:37:30 $

package RT::SearchBuilder;
no warnings 'redefine';

# {{{ sub LimitAttribute

=head2 LimitAttribute PARAMHASH

Takes NAME, OPERATOR and VALUE to find records that has the
matching Attribute.

=cut

sub LimitAttribute {
    my ($self, %args) = @_;
    
    my $alias = $self->Join(
	TYPE   => 'left',
	ALIAS1 => 'main',
	FIELD1 => 'id',
	TABLE2 => 'Attributes',
	FIELD2 => 'ObjectId'
    );

    my $type = ref($self);
    $type =~ s/(?:s|Collection)$//; # XXX - Hack!

    $self->Limit(
	ALIAS	   => $alias,
	FIELD      => 'ObjectType',
	OPERATOR   => '=',
	VALUE      => $type,
    );
    $self->Limit(
	ALIAS	   => $alias,
	FIELD      => 'Name',
	OPERATOR   => '=',
	VALUE      => $args{NAME},
    ) if exists $args{NAME};

    return unless exists $args{VALUE};

    $self->Limit(
	ALIAS	   => $alias,
	FIELD      => 'Description',
	OPERATOR   => ($args{OPERATOR} || '='),
	VALUE      => $args{VALUE},
	ENTRYAGGREGATOR => 'OR',
    );

    $self->Limit(
	ALIAS	   => $alias,
	FIELD      => 'Description',
	OPERATOR   => '=',
	VALUE      => '0',
	ENTRYAGGREGATOR => 'OR',
    ) if $args{EMPTY};
}
# }}}

1;
