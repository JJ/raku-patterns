#!/usr/bin/env raku

sub factors( $num ) {
    my @these-primes = (^($num/2)).grep: *.is-prime;
    print "\nFactors for $num →";
    loop ( my $i = 1; $i < @these-primes.elems; $i++ ) {
        (@these-primes[$i]~" ").print unless $num mod @these-primes[$i];
    }
}

factors( $_ )  for 2..5000;
