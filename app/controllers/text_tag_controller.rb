require 'algorithmia'

class TextTagController < ApplicationController
  def text_tag
    @text = params.fetch("text")
    client = Algorithmia.client('simtssusGxD8cl6mWJ0YkIivFb81')
    algo = client.algo('nlp/AutoTag/1.0.1')
    @tags = algo.pipe(@text).result

    render("text_tag_templates/text_tag.html.erb")
  end

  def text_tag_form
    render("text_tag_templates/text_tag_form.html.erb")
  end
end
