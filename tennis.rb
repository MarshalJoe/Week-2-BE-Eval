module Tennis
  class Game
    attr_accessor :player1, :player2

    def initialize
      @player1 = Player.new
      @player2 = Player.new

      @player1.opponent = @player2
      @player2.opponent = @player1
    end

    # Records a win for a ball in a game.
    #
    # winner - The Integer (1 or 2) representing the winning player.
    #
    # Returns the score of the winning player. 
    def wins_ball(winner)
      # TODO: Think it's gross to pass an integer instead of a player object?
      # Then reimplement this method!
      
      # need the first part to start with game but reference the player1 object
      # Game.winner.record_won_ball!

      if winner == 1
        @player1.record_won_ball!
      else
        @player2.record_won_ball!
      end

    end
  end

  class Player
    attr_accessor :points, :opponent

    def initialize
      @points = 0
    end

    # Increments the score by 1.
    #
    # Returns the integer new score.
    def record_won_ball!
      @points += 1
    end

    # Returns the String score for the player or the status of the game.
    def score
      return 'deuce' if deuce?
      return 'win' if win?
      return 'advantage' if advantage? && !win?
      return 'love' if @points == 0
      return 'fifteen' if @points == 1
      return 'thirty' if @points == 2
      return 'forty' if @points == 3
    end

    def advantage?
      (@points >= 3 && @opponent.points >=3) && (@points - @opponent.points) == 1
    #(@points >= 3 && @opponent.points >=3) && @points > @opponent.points
    end

    def deuce?
      (@points >= 3 && @opponent.points >=3) && @points == @opponent.points
    end

    def win?
      if advantage? == false && (@points >= 3 && ((@points - @opponent) >= 2))
        true
      else
        false
      end
    end


  end
end