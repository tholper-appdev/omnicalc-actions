class ColorizeController < ApplicationController
  def colorize
    input = {
      image: params.fetch("image_url")
    }

    client = Algorithmia.client('simtssusGxD8cl6mWJ0YkIivFb81')
    algo = client.algo('deeplearning/ColorfulImageColorization/1.1.13')
    result = algo.pipe(input).result
    
    @original_image_url = params.fetch("image_url")
    @colorized_image_url = "https://algorithmia.com/v1/data/.algo/deeplearning/ColorfulImageColorization/temp/grantpark-1.0.png"

    render("colorize_templates/colorize.html.erb")
  end

  def colorize_form
    render("colorize_templates/colorize_form.html.erb")
  end
end
