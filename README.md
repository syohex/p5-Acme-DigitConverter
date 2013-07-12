# NAME

Acme::DigitConverter - Perl Port of digit\_convert

# SYNOPSIS

    use Acme::DigitConverter;

    my $converter = Acme::DigitConverter->new(
        [0..9, 'a'..'z', 'A'..'Z'],
    );

    print $converter->to(98798798735665662), "\n";
    print $converter->from("7iuYfThXxc"), "\n";

# DESCRIPTION

Acme::DigitConverter is Perl port of Ruby's digit\_converter

# LICENSE

Copyright (C) Syohei YOSHIDA.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

Syohei YOSHIDA <syohex@gmail.com>
