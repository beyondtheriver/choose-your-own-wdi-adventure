class Game
   def start
      @game_running = true
      @level = 1
      puts "Hello, what is your name?"
      user_name = gets.chomp
      @user = User.new(user_name)
      puts "Hello #{@user.name}, welcome to the Feb-April cohort of NYCDA's Web Development Intensive..."
      run_game
   end
   def run_game
      while @game_running
         if (@level == 1)
            run_level_one
         else
            run_level_two
         end
      end
      puts "Game Over"
   end
   def run_level_one
      #two paths
      puts "It's the first day, and Constance has arranged a Lunch & Learn with an employee of Comcast. Do you go - yes or no?"
      invalid_answer = true
      while invalid_answer
         answer = gets.chomp
         if answer.downcase != "yes" && answer.downcase != "no"
            puts "Please enter yes or no"
         else
            invalid_answer = false
         end
      end
      if answer.downcase == "yes"
         comcast_lady = Comcast_lady.new("Kristy")
         puts "You go to the Lunch & Learn, and you meet #{comcast_lady.name}. #{comcast_lady.attack}. The sound of her voice causes your soul to leave your body. You get a job with Comcast. You might as well be dead."
         @game_running = false
      else
         puts "Good idea. Comcast is evil and if you work there you forfeit your soul. Maybe something better will happen on your second day."
         @level = 2
      end
   end
   def run_level_two
      puts "It's your second day - you heard that the Comcast lady, Kristy, was kind of a psycho, but Constance has someone better. A tech-recruiter is coming for another Lunch & Learn at 12:30pm. Do you go - yes or no?"
      invalid_answer = true
      while invalid_answer
         answer = gets.chomp
         if answer.downcase != "yes" && answer.downcase != "no"
            puts "Please enter yes or no"
         else
            invalid_answer = false
         end
      end
      if answer.downcase == "yes"
         dmitri = Dmitri.new("Dmitri")
         puts "You go to the Lunch & Learn. You see #{dmitri.name}. #{dmitri.attack}. You're his bitch now."
      else
         puts "You skip the Lunch & Learn and do your homework instead. You won't get kicked out."
      end
      @game_running = false
   end
end
class Monster
   attr_accessor :name
   def attack
      "#{@name} says, #{speak()} and attacks you"
   end
end
class Dmitri < Monster
   def initialize(name)
      @name = name
   end
   def speak
      "'You sign this paper and you're fucked (excuse my language)...'"
   end
end
class Comcast_lady < Monster
   def initialize(name)
      @name = name
   end
   def speak
      "EXCUSE ME!!!!!"
   end
end
class User
   attr_accessor :name
   def initialize(name)
      @name = name
   end
end
game = Game.new
game.start
