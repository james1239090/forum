module ApplicationHelper

  class HTMLwithPygments < Redcarpet::Render::HTML

    def block_code(code, language)
      Pygments.highlight(code, lexer: language)
    end
  end

  def markdown(content)
    renderer = HTMLwithPygments.new(filter_html: true, hard_wrap: true)
    options = {
      autolink: true,
      no_intra_emphasis: true,
      highlight: true,
      disable_indented_code_blocks: true,
      fenced_code_blocks: true,
      lax_html_blocks: true,
      strikethrough: true, #刪除線

      space_after_headers: true,
      superscript: true,
      underline: true,
      footnotes: true,
    }
    Redcarpet::Markdown.new(renderer, options).render(content).html_safe
  end

end
