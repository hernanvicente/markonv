class Markonv
  def initialize(markdown)
    @markdown = markdown
    @result = nil
  end

  def parse
    prepare
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
    @result = @result.gsub(/[^\r\n]+((\r|\n|\r\n)[^\r\n]+)*/) do |match|
      "<p>#{match.strip}</p>"
    end
  end

  def convert_strongs
    @result = @result.gsub(/(\*{2}|_{2})(.*?)\1/) do |match|
      content = match.gsub(/\*{2}|_{2}/, '')
      "<strong>#{content}</strong>"
    end
  end

  def convert_emphasis
    @result = @result.gsub(/(\*|_)(.*?)\1/) do |match|
      content = match.gsub(/\*|_/, '')
      "<em>#{content}</em>"
    end
  end

  def remove_empty_lines
    @result.gsub!(/^[\n]/, '')
  end
end
