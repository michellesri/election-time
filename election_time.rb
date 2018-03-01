candidates = [
  {
    "name" => "Donald Duck",
    "votes" => 0
  },
  {
    "name" => "Minnie Mouse",
    "votes" => 0
  },
  {
    "name" => "Goofy",
    "votes" => 0
  }
]

def election_time(max_votes, candidates)
  total_votes = 0

  puts "Welcome to my election voting program."
  puts "Election candidates are: " + combine_candidates_into_str(candidates)

  while total_votes < max_votes
    display_votes = total_votes + 1
    print "Vote #" + display_votes.to_s + ": "
    user_vote = gets.chomp.downcase.strip

    valid_candidates = false
    candidates.each do |candidate|
      if user_vote == candidate["name"].downcase
        valid_candidates = true
        candidate["votes"] += 1
      end
    end

    if valid_candidates
      total_votes += 1
    else
      puts "please vote for a valid candidate"
    end
  end

  results_str = "ELECTION RESULTS....\nVote Summary: \n"
  candidates.each do |candidate|
    results_str += candidate["name"] + " - " + candidate["votes"].to_s + " vote(s)\n"
  end

  puts results_str

  top_candidates = []
  candidates.each do |candidate|
    if top_candidates.length == 0
      top_candidates.push(candidate)
    elsif top_candidates[0]["votes"] < candidate["votes"]
      top_candidates = [candidate]
    elsif top_candidates[0]["votes"] == candidate["votes"]
      top_candidates.push(candidate)
    end
  end

  puts "WINNER(s): " + combine_candidates_into_str(top_candidates)
end

def combine_candidates_into_str(candidates)
  str = ""
  candidates.each_with_index do |candidate, index|
    if index != candidates.length - 1
      str += candidate["name"] + ", "
    else
      str += candidate["name"] + "."
    end
  end
  return str
end

election_time(5, candidates)
