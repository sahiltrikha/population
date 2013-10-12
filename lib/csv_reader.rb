class CSVReader
	attr_accessor :fname, :headers=

	def initialize(filename)
		@fname = filename
	end

	def headers=(string)
		@headers = string.split(',')
		
		@headers.map! do |h|
			h.gsub!('"','')
			h.strip!
			h.underscore.to_sym
		end

	def create_hash(values)
		h = {}
		@headers.each_with_index do |header, i|
		value = values[i].strip.gsub('"', '')
		h[header] = value unless value.empty?
		end
		h
	end

end

class String

  def underscore
    self.gsub(/::/, '/').
    gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
    gsub(/([a-z\d])([A-Z])/,'\1_\2').
    tr("-", "_").
    downcase
  end

end