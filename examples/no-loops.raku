#!/usr/bin/env raku

sub factors( $num ) {
    my @these-primes = (^($num/2)).grep: *.is-prime;
    say "Factors for $num → ", @these-primes.grep( ! ($num mod *) );
}

factors( $_ )  for 2..5000;
