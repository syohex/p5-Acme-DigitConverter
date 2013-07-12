#!perl
use strict;
use warnings;
use utf8;

use lib qw(../lib);

use Acme::DigitConverter;

binmode STDOUT, ":utf8";

my $converter = Acme::DigitConverter->new(
    [0..9, 'a'..'z', 'A'..'Z'],
);

print $converter->to(98798798735665662), "\n";
print $converter->from("7iuYfThXxc"), "\n";


$converter = Acme::DigitConverter->new(
    [qw/☆ ★ ♪ △ ▼ ○ ● ◎/],
);

print $converter->to(987987987), "\n";
print $converter->from("◎♪◎☆◎☆☆☆♪△"), "\n";
