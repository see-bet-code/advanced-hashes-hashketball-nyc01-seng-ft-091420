# Write your code below game_hash

require 'pry'

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

# Write code here
def num_points_scored(player_name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      return player[:points] if player[:player_name] == player_name
    end
  end
end

def shoe_size(player_name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      return player[:shoe] if player[:player_name] == player_name
    end
  end
end

def team_colors(team_name)
  game_hash.each do |location, team_data|
    return team_data[:colors] if team_data[:team_name] == team_name
  end
end

def team_names
  teams = []
  game_hash.each do |location, team_data|
    teams << team_data[:team_name]
  end
  teams
end

def player_numbers(team_name)
  nums = []
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      nums << player[:number] if team_data[:team_name] == team_name
    end
  end
  nums
end

def player_stats(player_name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      return player if player[:player_name] == player_name
    end
  end
end

def big_shoe_rebounds
  max = 0
  rebounds = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      if player[:shoe] > max
        max = player[:shoe]
        rebounds = player[:rebounds]
      end
    end
  end
  rebounds
end

def most_points_scored
  max = 0
  name = ""
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      if player[:points] > max
        max = player[:points]
        name = player[:player_name]
      end
    end
  end
  name
end

def player_with_longest_name
  longest = 0
  name = ""
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      len = player[:player_name].length
      if len > longest
        longest = len
        name = player[:player_name]
      end
    end
  end
  name
end

def long_name_steals_a_ton?
  longest = 0
  most_steals = 0
  len_name = ""
  steal_name = ""
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      len = player[:player_name].length
      steals = player[:steals]
      if len > longest
        longest = len
        len_name = player[:player_name]
      end
      if steals > most_steals
        most_steals = steals
        steal_name = player[:player_name]
      end
    end
  end
  puts len_name == steal_name
  len_name == steal_name
end

def winning_team
  team_points = {}
  game_hash.each do |location, team_data|
    total = 0
    team_data[:players].each do |player|
      total += player[:points]
    end
    team_points[team_data[:team_name]] = total
  end
  winner = team_points.key(team_points.values.max)
  puts winner
  team_points.key(team_points.values.max)
end

winning_team
