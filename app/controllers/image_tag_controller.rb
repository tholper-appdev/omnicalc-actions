class ImageTagController < ApplicationController
  def image_tag
    input = {
      image: params.fetch("image_url")
    }

    client = Algorithmia.client('simtssusGxD8cl6mWJ0YkIivFb81')
    algo = client.algo('deeplearning/IllustrationTagger/0.4.0')

    @original_image_url = params.fetch("image_url")
    @tag_hashes = algo.pipe(input).result

    render("image_tag_templates/image_tag.html.erb")
  end

  def image_tag_form
    render("image_tag_templates/image_tag_form.html.erb")
  end
end
