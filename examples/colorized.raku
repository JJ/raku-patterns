#!/usr/bin/env raku

use Colorizable;
for ^10 -> $κ {
    my $ಕ = ($κ but uniname(~$κ)) but Colorizable;
    (given $ಕ mod 3 {
        when 0 { $ಕ.colorize(:fg(red)) }
        when 1 { $ಕ.colorize(:fg(yellow)) }
        when 2 { $ಕ.colorize(:fg(blue)) }
    }).say
};
