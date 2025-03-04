# Write your code here!
require "pry"

def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    binding.pry
    team_data.each do |attribute, data|
      #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
      binding.pry
 
      #what is 'data' at each loop throughout .each block? when will the following line of code work and when will it break?
      data.each do |data_item|
          binding.pry
      end
    end
  end
end

def game_hash
{
    home:{
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        {player_name: "Alan Anderson",
         number: 0,
         shoe: 16,
         points: 22,
         rebounds: 12,
         assists: 12,
         steals: 3,
         blocks: 1,
         slam_dunks: 1},
        {player_name: "Reggie Evans",
         number: 30,
         shoe: 14,
         points: 12,
         rebounds: 12,
         assists: 12,
         steals: 12,
         blocks: 12,
         slam_dunks: 7},
        {player_name: "Brook Lopez",
         number: 11,
         shoe: 17,
         points: 17,
         rebounds: 19,
         assists: 10,
         steals: 3,
         blocks: 1,
         slam_dunks: 15},
        {player_name: "Mason Plumlee",
         number: 1,
         shoe: 19,
         points: 26,
         rebounds: 11,
         assists: 6,
         steals: 3,
         blocks: 8,
         slam_dunks: 5},
        {player_name: "Jason Terry",
         number: 31,
         shoe: 15,
         points: 19,
         rebounds: 2,
         assists: 2,
         steals: 4,
         blocks: 11,
         slam_dunks: 1}]
         },
    away:{ 
      :team_name => 'Charlotte Hornets',
      :colors => ["Turquoise", "Purple"],
      :players => [
        { player_name: 'Jeff Adrien',
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2 },
        { player_name: 'Bismack Biyombo',
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10 },
        { player_name: 'DeSagna Diop',
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5 },
        { player_name: 'Ben Gordon',
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0 },
        { player_name: 'Kemba Walker',
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12 }
            ] }
  }
end 

def num_points_scored (get_player_name)
  game_hash.each do |_place, team|
    team.each do |attribute, data|
      next unless attribute == :players
      data.each do |player|
        return player[:points] if player[:player_name] == get_player_name
      end
    end
  end
end

def shoe_size (get_player_name)
  game_hash.each do |_place, team|
    team.each do |attribute, data|
      next unless attribute == :players
      data.each do |player|
        return player[:shoe] if player[:player_name] == get_player_name
      end
    end
  end
end

def team_colors (team_name)
  game_hash.each do |place, team|
    return game_hash[place][:colors] if team[:team_name] == team_name
  end 
end 

def team_names
  game_hash.collect do |_place, team|
    team[:team_name]
  end 
end

def player_numbers (team_name)
  nums = []
  game_hash.each do |_place, team|
    next unless team[:team_name] == team_name
    team.each do |attribute, data|
      next unless attribute == :players
      data.each do |data|
        nums.push(data[:number])
      end 
    end
  end 
  nums
end 

def player_stats (get_player_name)
  stats = {}
  game_hash.collect do |place, team|
    team.each do |attribute, _data|
      next unless attribute == :players 
      game_hash[place][attribute].each do |player|
        next unless player[:player_name] == get_player_name
        stats = player.delete_if do |k, _v|
          k == :player_name
        end
      end
    end
  end
  stats
end 

def big_shoe_rebounds
  biggest_shoe = 0 
  num_rebounds = 0 
  game_hash.each do |_team, game_data|
    game_data[:players].each do |player|
      if player[:shoe] > biggest_shoe
        biggest_shoe = player[:shoe]
        num_rebounds = player[:rebounds]
      end 
    end 
  end 
  num_rebounds
end 

def player_with_most_of (statistic)
  player_name = nil 
  amount_of_stat = 0 
  game_hash.each do |_team, game_data|
    game_data[:players].each do |player|
      if player[statistic].is_a? String
        if player[statistic].length > amount_of_stat
          amount_of_stat = player[statistic].length
          player_name = player[:player_name]
        end 
        elsif player[statistic] > amount_of_stat
        amount_of_stat = player[statistic]
        player_name = player[:player_name]
      end 
    end 
  end 
  player_name
end 

def most_points_scored
  player_with_most_of(:points)
end 

def winning_team
  scores = { 'Brooklyn Nets' => 0, 'Charlotte Hornets' => 0 }
  game_hash.each do |_team, game_data|
    game_data[:players].each do |player|
      scores[game_data[:team_name]] += (player[:player_name], :points)
    end
  end
  scores.max_by { |_k, v| v }.first
end


def player_with_longest_name
  player_with_most_of(:player_name)
end 

def long_name_steals_a_ton?
  player_with_most_of(:steals) == player_with_most_of(:player_name)
end 

