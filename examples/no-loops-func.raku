#!/usr/bin/env raku

constant MAX-NUM = 10_000;
my @these-primes = (^(MAX-NUM/2)).grep: *.is-prime;
sub is-mod( $n, $b ) { ! ($n mod $b ) } 
my @modders = @these-primes.map: -> $b { ( -> $c { is-mod( $c, $b ) } ) but $b };

for 2..5000 -> $n {
    say $n, " ", ($_.Int ~ " " for @modders.grep: { $_($n) } ).join( ", " );
}
