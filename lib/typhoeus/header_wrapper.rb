module Typhoeus
  class HeaderWrapper
    def initialize
      @headers = {}
    end
    
    def [](key)
      @headers[canonicalize_header_name(key)]
    end
    
    def []=(key, value)
      canonical_key = canonicalize_header_name(key)
      if @headers.has_key?(canonical_key)
        @headers[canonical_key] << ', ' << value
      else
        @headers[canonical_key] = value
      end
    end
    
    def each
      @headers.each {|k,v| yield k,v}
    end
    
    def canonicalize_header_name raw
      raw.split('-').collect {|part| part.capitalize}.join('-')
    end
  end
end