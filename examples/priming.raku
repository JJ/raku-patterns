#!/usr/bin/env ralu

sub priming( UInt $num where * --> Array[UInt] ) {
    my @these-primes = (^($num/2)).grep: *.is-prime;
    my UInt @factors = @these-primes.grep: !( $num mod * );
    if ( (1,|@factors).sum == $num ) {
        return @factors but "👑";
    } elsif !@factors {
        return @factors but "🍅";
    } else {
        return @factors;
    }
}

for ^1000 -> $n {
    my $result = priming($n);
    say $n, ", ", ~$result;
}
