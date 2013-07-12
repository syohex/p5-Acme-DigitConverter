package Acme::DigitConverter;
use 5.008005;
use strict;
use warnings;

our $VERSION = "0.01";

sub new {
    my ($class, $chars) = @_;

    my $size = scalar @{$chars};
    my $index = 0;
    my %chars_hash;
    for my $char (@{$chars}) {
        $chars_hash{$char} = $index++;
    }

    bless {
        size       => $size,
        chars      => $chars,
        chars_hash => \%chars_hash,
    }, $class;
}

sub to {
    my ($self, $i) = @_;
    my @digits;

    while ($i > 0) {
        my $mod = $i % $self->{size};
        $i = int($i / $self->{size});

        push @digits, $self->{chars}->[$mod];
    }

    return join '', reverse @digits;
}

sub from {
    my ($self, $str) = @_;
    my @chars = split //, $str;
    my $i = scalar(@chars) - 1;

    my $index = 0;
    my $ret = 0;
    for my $char (@chars) {
        $ret += ($self->{size} ** ($i - $index)) * $self->{chars_hash}->{$char};
        $index++;
    }

    return $ret;
}

1;
__END__

=encoding utf-8

=head1 NAME

Acme::DigitConverter - Perl Port of digit_convert

=head1 SYNOPSIS

    use Acme::DigitConverter;

    my $converter = Acme::DigitConverter->new(
        [0..9, 'a'..'z', 'A'..'Z'],
    );

    print $converter->to(98798798735665662), "\n";
    print $converter->from("7iuYfThXxc"), "\n";

=head1 DESCRIPTION

Acme::DigitConverter is Perl port of Ruby's digit_converter

=head1 LICENSE

Copyright (C) Syohei YOSHIDA.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

Syohei YOSHIDA E<lt>syohex@gmail.comE<gt>

=cut
