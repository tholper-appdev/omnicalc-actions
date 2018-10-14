class StatsController < ApplicationController
  def stats
    @numbers = params.fetch("list_of_numbers").gsub(",", "").split.map(&:to_f)

    # ================================================================================
    # Your code goes below.
    # The numbers the user input are in the array @numbers.
    # ================================================================================

    @sorted_numbers = @numbers.sort

    @count = @numbers.size

    @minimum = @numbers.at(0)
    @maximum = @numbers.at(0)
  
    @numbers.each do |num|
                                
      if (num < @minimum)
        @minimum = num
      end
      
      if (num > @maximum)
        @maximum = num
      end
    
    end

    @range = @maximum - @minimum

    # median
    if @count.odd? == true
      @median = @sorted_numbers.at((@count - 1)/2)
    elsif
      @med_low = @sorted_numbers.at(((@count)/2 - 1))
      @med_high = @sorted_numbers.at(((@count)/2))
      @median = (@med_low + @med_high) / 2
    end

    # sum
    @sum = 0
    @numbers.each do |num|
      @sum = @sum + num
    end

    # mean
    @mean = @sum / @numbers.size


    # variance
    # to find the variance of a set,
    #  - we find the mean of the set
    #  - for each number in the set,
    #    - we find the difference between the number and the mean
    #    - we square the difference
    #  - the variance is the mean of the squared differences  
    
    @sum_diff = 0
    @numbers.each do |num|
      @sum_diff = (@sum_diff + (num - @mean)**2)
    end  
  
    @variance = @sum_diff/@numbers.size
  
    # standard deviation
    # ==================
    # To find the standard deviation of a set,
    #  - take the square root of the variance
    @standard_deviation = Math.sqrt(@variance)
  

    # mode
    # initialize vars
    @current_num = @numbers.at(0)
    @current_record_count = 1
    @max_num = @numbers.at(0)
    @max_record_count = 1
   
    @sorted_numbers.each do |num|
      
      if (num == @current_num)
        @current_record_count = @current_record_count + 1
        
        if (@current_record_count > @max_record_count)
          @max_record_count = @current_record_count
          @max_num = @current_num
        end
      else
        @current_record_count = 1
        @current_num = num    
      end
      
    end
    
    @mode = @max_num

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("stats_templates/stats.html.erb")
  end

  def stats_form
    render("stats_templates/stats_form.html.erb")
  end
  
end
