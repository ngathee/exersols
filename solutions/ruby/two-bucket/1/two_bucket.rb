class TwoBucket 
  attr_reader :goal_bucket, :other_bucket 
  
  def initialize(capacity1, capacity2, target, start_bucket) 
    @capacity1 = capacity1
    @capacity2 = capacity2
    @target = target 
    @start_bucket = start_bucket  
  end 

  def moves 
    count = 0 
    bucket_state = [0, 0] 

    until bucket_state[0] == target || bucket_state[1] == target 
      if start_bucket == "one"
        if capacity2 == target 
          count += 2 
          bucket_state[0] = capacity1 
          bucket_state[1] = capacity2 
          break 
        end 
        
        if bucket_state[0].zero? 
          bucket_state[0] = capacity1 
          count += 1 
        else 
          if bucket_state[1] == capacity2 
            bucket_state[1] = 0
            count += 1 
          else
            pour_amount = [capacity2 - bucket_state[1], bucket_state[0]].min 
            bucket_state[0] -= pour_amount 
            bucket_state[1] += pour_amount 
            count += 1
          end 
        end         
      else 
        if bucket_state[1].zero? 
          bucket_state[1] = capacity2 
          count += 1 
        else 
          if bucket_state[0] == capacity1
            bucket_state[0] = 0
            count += 1 
          else 
            pour_amount = [capacity1 - bucket_state[0], bucket_state[1]].min 
            bucket_state[0] += pour_amount 
            bucket_state[1] -= pour_amount 
            count += 1 
          end 
        end 
      end
    end 
    
    if bucket_state[0] == target 
      @goal_bucket = "one"
      @other_bucket = bucket_state[1] 
    else 
      @goal_bucket = "two" 
      @other_bucket = bucket_state[0]
    end
    
    count 
  end 
  private 
  attr_reader :capacity1, :capacity2, :target, :start_bucket 
end 

