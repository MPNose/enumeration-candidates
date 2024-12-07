require 'active_support/all'
require './candidates'



def experienced?(candidate) 
  candidate[:years_of_experience] >= 2
end

def language?(candidate)
  candidate[:languages].include?('Python') || candidate[:language].include?('Ruby')
end

candidate =  {
  id: 5,
  years_of_experience: 4,
  github_points: 293,
  languages: ['C', 'Ruby', 'Python', 'Clojure'],
  date_applied: 5.days.ago.to_date,
  age: 26
}


puts language?(candidate)

#puts experienced?(candidate)