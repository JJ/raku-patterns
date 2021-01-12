#!/usr/bin/env raku

my @unit-types=<g tbsp clove cup sp pinch>;
my @products=<lentils apple egg garlic>;

role Measures {
    token quantity { <:N>+ }
    token unit     { @unit-types s? }
}

grammar Measured-Ingredients does Measures {
    token TOP { <measured-ingredient> }
    token measured-ingredient { [ <quantity> \h* <unit> \h+ <product> || <quantity> \h+ <product>] s? }
    token product {:i @products }
}

for "1 cup lentils", "½ clove garlic", "2 eggs" -> $m {
    say Measured-Ingredients.parse( $m );
}
