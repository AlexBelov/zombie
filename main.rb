class Game
	def initialize
		file = IO.read('./lib/words.txt')
		words = Array.new file.split "\n"
		@word = words[rand(0..words.size)]
		@secret = ""
		@word.size.times  {@secret << "_"}
		@errors = 0
	end

	def play
		while @errors < 7 and @secret != @word
			system("clear")
			draw
			puts @secret
			char = gets.chomp
			select char
		end
		system("clear")
		if @secret == @word
			puts "WIN!"
		else
			puts "FAILED!"
			puts "The word was #{@word}"
		end
	end

	def select char
		i = 0
		if not @word.split("").index char
			@errors += 1
			return
		end
		@word.split("").each do |sym|
			@secret[i] = @word[i] if char == @word[i]
			i -= 1
		end
	end

	def draw
		file = IO.read("./img/image_#{@errors}")
		puts file.split "\n"
	end

end

game = Game.new
game.play
