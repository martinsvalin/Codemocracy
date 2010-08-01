module Rack
  module Utils
    def unescape(s)
      result = s.tr('+', ' ').gsub(/((?:%[0-9a-fA-F]{2})+)/n){
        [$1.delete('%')].pack('H*')
      }
      result = result.force_encoding(Encoding.default_external) if RUBY_VERSION >= "1.9"
      result
    end
    module_function :unescape
  end
end