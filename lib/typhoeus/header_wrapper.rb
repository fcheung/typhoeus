module Typhoeus
  class HeaderWrapper
    def initialize
      @headers = {}
    end
    
    def [](key)
      @headers[key.downcase]
    end
    
    def []=(key, value)
      canonical_key = key.downcase
      if @headers.has_key?(canonical_key)
        @headers[canonical_key] << ', ' << value
      else
        @headers[canonical_key] = value
      end
    end
    
    def each
      @headers.each {|k,v| yield k,v}
    end
  end
end