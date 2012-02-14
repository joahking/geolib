# Geolib, a ruby library of geo functions and helpers

a collection of goodies suited to work with geo data

## Coord class

(coord is a less typing version of 'coordinate')

This class lets you parse and transform coordinates between different geo systems.

Examples:

Transform from Degrees Minutes Seconds notation to Decimal Degrees

    Geolib::Coord.new("45 46 52").to_dd    # => 45.7811
    Geolib::Coord.new("45 46 52").to_dd(2) # => 45.78
    Geolib::Coord.new("45 46 52 S").to_dd  # => -45.7811
    Geolib::Coord.new("45 46 52 W").to_dd  # => -45.7811

