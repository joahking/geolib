# -*- coding: utf-8 -*-
module Geolib
  class Coord

    # instantiates a new coordinate by parsing the passed string
    # @param [String] dms_coord a Degrees Minutes Seconds coordinate (D° M' S")
    def initialize(dms_coord)
      @lat, @lon = dms_coord.split(',') #TODO parse it properly
    end

    # source http://maptech.mytopo.com/support/doc.cfm?docid=650&plid=31

    # How do I convert between formats?

    # To convert from Degrees Minutes Seconds (D° M' S") to Decimal Degrees (D.D°)

    # Use the following formula:
    # Degrees + (Minutes divided by 60) + (Seconds divided by 3600) = Decimal Degrees
    # - or -
    # D + (M/60) + (S/3600) = D.D°
    # For example, a latitude of 45 degrees 46 minutes 52 seconds would translate to:
    # 45 + (46/60) + (52/3600) = 45.7811111°

    def to_dd(decimals = 4)
      degrees, mins, secs = @lat.split
      sign = if secs[-1].is_a? String
               secs[-1].upcase == "N" ? 1 : -1
             end
      dec = degrees.to_f + (mins.to_f/60) + (secs.to_f/3600)
      dec *= sign if sign
      [("%.#{decimals}f" % dec).to_f] if dec
    end
  end

  # To convert from Degrees Minutes Seconds (D° M' S") to Decimal Minutes (D° M.M')

  # Use the following formula:
  # Degrees and Minutes + (Seconds divided by 60) = Decimal Minutes
  # - or -
  # D and M + (S/60) = Decimal Minutes
  # For example, a latitude of 45 degrees 46 minutes 52 seconds would translate to:
  # 45 and 46 + (52/60) = 45° 46.86666'

  # To convert from Decimal Degrees (D.D°) to Decimal Minutes (D° M.M')

  # Use the following formula:
  # Degrees = Integer Portion of D.D°
  # Minutes = Decimal Portion of D.D° (including the decimal point) * 60
  # - or -
  # Int(D) = D°
  # (D - Int(D)) * 60 = M.M'
  # For example, a latitude of 45.781111 degrees would translate to:
  # Int(45.781111) and (45.781111 - Int(45.781111)) * 60 = 45° 46.86666'

  # To convert from Decimal Degrees (D.D°) to Decimal Degrees (D.D°)

  # Use the following formula:
  # Degrees = Integer Portion of D.D°
  # Minutes = The Integer Portion of the Decimal Portion of D.D° (including the decimal
  # point) * 60
  # Seconds = The Decimal Portion of M.M (including the decimal point) * 60
  # - or -
  # Int(D) = D°
  # Int((D - Int(D)) * 60) = M'
  # (((D - Int(D)) * 60) - Int((D - Int(D)) * 60)) * 60 = S"
  # For example, a latitude of 45.781111 degrees would translate to:
  # Int(45.781111) and Int(45.781111 - Int(45.781111)) * 60 and (((45.781111 - Int(45.781111))
  # * 60) - Int((45.781111 - Int(45.781111)) * 60)) * 60 = 45° 46' 52"

  # A Note About Sign and North, South, East West

  # Generally speaking, Latitude/Longitude is followed by an indication of hemisphere. For example 45° 46' 52" N indicates the Northern Hemisphere (North of the equator.) 108° 30' 14" W indicates an area West of the Prime Meridian. When noting this numerically (especially in Decimal Degrees), positive and negative values are sometimes used. A positive value for North and East, a negative value for South and West. Thus, in our example, when noting 45° 46' 52" N 108° 30' 14" W in Decimal Degrees, it may appear as 45.7811111 -108.5038888 when represented numerically. This is the case within Terrain Navigator various file formats for import/export of layers, such as routes, tracks, markers, etc.

end
