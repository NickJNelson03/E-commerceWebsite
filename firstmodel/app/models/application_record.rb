class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  

  def pickRandom(int,bigClass)
    randObjs=Array.new
    usedIds=[self.id]
    ids=bigClass.ids
    int=[int, ids.length].min
    for i in 0...int
      candidate=ids[rand(ids.length)]
      while usedIds.include? candidate
        candidate=ids[rand(ids.length)]
      end
      usedIds.push(candidate)
      randObjs.push(bigClass.find(candidate))
    end
    return randObjs
  end
        
end
