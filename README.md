# Geolib, a ruby library of geo functions and helpers

## Coord class

(coord is a less typing version of 'coordinate')

This class lets you parse and transform coordinates between different geo systems.

Example:

Transform from Degrees Minutes Seconds notation to Decimal Degrees

    Geolib::Coord.new("45 46 52").to_dd # returns => 45.7811

