class Markonv
  def initialize(markdown)
    @markdown = markdown
    @result = nil
  end

  def parse
    prepare
    convert_lists
    convert_paragraphs
    convert_strongs
    convert_emphasis
    remove_empty_lines
    @result
  end

  private

  def prepare
    @result = @markdown.strip!
  end

  def convert_paragraphs
    @result.gsub!(/[^\r\n]+((\r|\n|\r\n)[^\r\n]+)*/) do |match|
      match =~ /^<ul>/ ? match : "<p>#{match.strip}</p>"
    end
  end

  def convert_strongs
    @result.gsub!(/(\*{2}|_{2})(.*?)\1/) do |match|
      "<strong>#{match.gsub(/\*{2}|_{2}/, '')}</strong>"
    end
  end

  def convert_emphasis
    @result.gsub!(/(\*|_)(.*?)\1/) do |match|
      "<em>#{match.gsub(/\*|_/, '')}</em>"
    end
  end

  def convert_lists
    @result.gsub!(/^((\*|-|\+)\s.*)+((\r|\n|\r\n)[^\r\n]+)*/) do |match|
      elems = match.gsub(/^(\*|-|\+)\s?(...)[^\r\n]*/) do |elem|
        "<li>#{elem.gsub(/(\*|-|\+)\s/, '').strip}</li>"
      end
      "<ul>\n#{elems}\n</ul>"
    end
  end

  def remove_empty_lines
    @result.gsub!(/^[\n]/, '')
  end
end
