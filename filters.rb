# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
    @candidates.find { |candidate| candidate[:id] == id}
  end
  
  def experienced?(candidate) 
      candidate[:years_of_experience] >= 2
  end
  
def high_points?(candidate)
  candidate[:github_points] >= 100
end

def age?(candidate)
  candidate[:age] > 17
end

def recent?(candidate)
  candidate[:date_applied] >= 15.days.ago.to_date
end

def language?(candidate)
  candidate[:languages].include?('Python') || candidate[:languages].include?('Ruby')
end


  def qualified_candidates(candidates)
    qualified = []
    candidates.each do |candidate| 
      if experienced?(candidate) && high_points?(candidate) && age?(candidate) && recent?(candidate) && language?(candidate) 
         qualified.push(candidate)
      end
    end
  return qualified
  end
  
  # More methods will go below

  def ordered_by_qualifications(candidates)
    sorted_candidates = candidates.sort do |a, b|
      experience_comparison = b[:years_of_experience] <=> a[:years_of_experience]
      if experience_comparison == 0
        b[:github_points] <=> a[:github_points]
      else
        experience_comparison
      end
    end
    
    sorted_candidates
  end