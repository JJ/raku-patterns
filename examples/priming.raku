#!/usr/bin/env ralu


constant one-mil = 1_000_000;
my UInt @primes = (^one-mil).grep: *.is-prime;
sub priming( UInt $num where * < one-mil--> Array[UInt] ) {
    my @these-primes = @primes.grep: * <= $num/2;
    my UInt @factors = @these-primes.grep: !( $num mod * );
    if ( (1,|@factors).sum == $num ) {
        return @factors but "👑";
    } elsif !@factors {
        return @factors but "🍅";
    } else {
        return @factors;
    }
}

for ^100 -> $n {
    my $result = priming($n);
    say $n, ", ", ~$result;
}
