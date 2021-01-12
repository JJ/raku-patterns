#!/usr/bin/env raku

grammar Measurements {
    token TOP      { <quantity> \h* <unit>? }
    token quantity { <:N>+ }
    token unit     { ["g" | "tbsp" | "clove" | "cup" ] s? }
}

for "3 tbsps", "½ cup", "𐄩 cloves" -> $m {
    say Measurements.parse( $m );
}
