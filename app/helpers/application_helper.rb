module ApplicationHelper

  def markdown(text)
    render_options = {
      # will remove from the output HTML tags inputted by user
      filter_html: true,
      # will insert <br /> tags in paragraphs where are newlines
      # (ignored by default)
      hard_wrap: true,
      # hash for extra link options, for example 'nofollow'
      # link_attributes: { rel: 'nofollow' }
      # more
      # will remove <img> tags from output
      # no_images: true
      # will remove <a> tags from output
      # no_links: true
      # will remove <style> tags from output
      # no_styles: true
      # generate links for only safe protocols
      # safe_links_only: true
      # and more ... (prettify, with_toc_data, xhtml)
    }
    renderer = Redcarpet::Render::HTML.new(render_options)

    extensions = {
      #will parse links without need of enclosing them
      autolink: true,
      # blocks delimited with 3 ` or ~ will be considered as code block.
      # No need to indent.  You can provide language name too.
      # ```ruby
      # block of code
      # ```
      fenced_code_blocks: true,
      # will ignore standard require for empty lines surrounding HTML blocks
      lax_spacing: true,
      # will not generate emphasis inside of words, for example no_emph_no
      no_intra_emphasis: true,
      # will parse strikethrough from ~~, for example: ~~bad~~
      strikethrough: true,
      # will parse superscript after ^, you can wrap superscript in ()
      superscript: true
      # will require a space after # in defining headers
      # space_after_headers: true
    }
    Redcarpet::Markdown.new(renderer, extensions).render(text).html_safe
  end

  def place_type_form_options

    [
      ['Present', Place::PRESENT],
      ['Past', Place::PAST]
    ]

  end

  def static_google_map_image_for(street)

    image = 'https://maps.googleapis.com/maps/api/staticmap?size=280x250&scale=2'
    image += '&path=color:0x0000ff|weight:5|'
    image += street.path_image_string

    return tag('img', src: image, alt: street.name, width: 280, height: 250)

  end


  def attachment_url(file, style = :original)
    "#{request.protocol}#{request.host_with_port}#{file.url(style)}"
  end

end
