require 'sinatra'

class Caesar
	def initialize(shift, alphabet = ('a'..'z').to_a.join)
		i = shift % alphabet.size
		@decrypt = alphabet
		@encrypt = alphabet[i..-1] + alphabet[0...i]
	end

	def encrypt(string)
		string.downcase.tr(@decrypt, @encrypt)
	end

	def decrypt(string)
		string.downcase.tr(@encrypt, @decrypt)
	end
end

get '/' do 
	originalMessage = params["stringToEncode"].to_s
	shift = params["shift"].to_i
	aMessage = Caesar.new(shift)
	encodedMessage = aMessage.encrypt(originalMessage)
	dMessage = aMessage.decrypt(encodedMessage)
	erb :index, :locals => { :originalMessage => originalMessage, :encodedMessage => encodedMessage, :dMessage => dMessage}
end