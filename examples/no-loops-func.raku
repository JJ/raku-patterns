#!/usr/bin/env raku

constant MAX-NUM = 5_000;
my @these-primes = (^(MAX-NUM/2)).grep: *.is-prime;
sub is-mod( $n, $b ) { ! ($n mod $b ) }
my @modders = @these-primes.map: -> $b { ( -> $c { is-mod( $c, $b ) } ) but $b };

(2..MAX-NUM).race.map: -> $n {
    say $n, " ", @modders.grep( *.Int <= $n/2).grep( { $_($n) } ).map( *.Int ~ " " ).join( ", " ) || '🍅';
;}
