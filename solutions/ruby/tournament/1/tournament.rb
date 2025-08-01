require 'ostruct'

module Tournament 
  def self.tally(input) 
    header =  "Team".ljust(31) + "| MP |  W |  D |  L |  P\n"
    row = "" 
    scores = []
    
    tournaments = input.strip!.lines 
    tournaments.map(&:strip!)
    if tournaments.any? 
      scores = initialize_scores(tournaments)

      tournaments.each do |tournament|
        team1, team2, outcome = tournament.split(";")
        update_scores(scores, team1, team2, outcome)
      end 

      scores.sort_by! {|score| score.name }
      scores.sort_by! {|score| -score.p }
      debug "Scores: #{scores}"
      
      scores.each do |score|
        row += "#{score.name.ljust(31)}" 
        row += "|  #{score.mp} |  #{score.w} |  #{score.d} |  #{score.l} | " + "#{score.p}".rjust(2) + "\n"
      end
    end
    row.empty? ? header : header + row 
  end

  private 
  def self.initialize_scores(tournaments)
    scores = [] 
    teams = Set.new 
    tournaments.each do |tournament| 
      team1, team2, _ = tournament.split(";")
      teams.add(team1).add(team2)
    end
    
    teams.each do |team| 
      scores.append(OpenStruct.new({name: team, mp: 0, w: 0, d: 0, l: 0, p: 0}))
    end
    scores 
  end
  
  def self.update_scores(scores, team1_name, team2_name, outcome)
    team1 = scores.find {|team| team.name == team1_name}
    team2 = scores.find {|team| team.name == team2_name}

    case outcome
    when "win"
      team1.w += 1
      team2.l += 1
    when "draw" 
      team1.d += 1 
      team2.d += 1
    when "loss"
      team1.l += 1 
      team2.w += 1 
    end

    team1.mp += 1 
    team2.mp += 1 
    team1.p = team1.w * 3 + team1.d 
    team2.p = team2.w * 3 + team2.d 
  end
end








