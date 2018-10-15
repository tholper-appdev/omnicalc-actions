class WordCountController < ApplicationController
  def word_count
    @text = params.fetch("user_text").downcase
    @special_word = params.fetch("user_word").downcase

    # ================================================================================
    # Your code goes below.
    # The text the user input is in the string @text.
    # The special word the user input is in the string @special_word.
    # ================================================================================

    @word_count = @text.split(" ").length.to_s
    
    @character_count_with_spaces = @text.size.to_s

    @character_count_without_spaces = @text.gsub(/\s+/, "").size.to_s

    @occurrences = @text.scan(/(?=#{@special_word})/).count
  
    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("word_count_templates/word_count.html.erb")
  end

  def word_count_form
    render("word_count_templates/word_count_form.html.erb")
  end
end
