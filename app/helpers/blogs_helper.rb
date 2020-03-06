module BlogsHelper
	
  def user_gravatar(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "http://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name)
  end

	class CodeRayify < Redcarpet::Render::HTML
		def block_code(code, language)
			CodeRay.scan(code, language).div
		end
	end

	def markdown(text)
		coderayified = CodeRayify.new(filter_html: true, hard_wrap: true)

		options =  {
		fenced_code_blocks: true,
		no_intra_emphasis: true,
		autolink: true,
		lax_html_blocks: true,
		}

		markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
		markdown_to_html.render(text).html_safe
	end

	def blog_status_color blog
		'color: red;' if blog.draft?
	end

end
