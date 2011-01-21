module RMeetup
  module Type
    
    # == RMeetup::Type::City
    #
    # Data wraper for a City fethcing response
    # Used to access result attributes as well
    # as progammatically fetch relative data types
    # based on this city.
    
    # Edited by Jason Berlinsky on 1/20/11 to allow for arbitrary data access
    # See http://www.meetup.com/meetup_api/docs/cities/ for available fields
    
    class City
      
      attr_accessor :city
      
      def initialize(city = {})
        self.city = city
      end
      
      def method_missing(id, *args)
        return city[id.id2name].toutf8
      end
      
      # Special accessors that need typecasting or other parsing
      
      def lat
        return city['lat'].to_f
      end
      def lon
        return city['lon'].to_f
      end
      def members
        return city['members'].to_i
      end
    end
  end
end