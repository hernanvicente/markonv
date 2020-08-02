class Markonv
  def initialize(markdown)
    @markdown = markdown
    @result = nil
  end

  def parse
    prepare
    convert_paragraphs
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

  def remove_empty_lines
    @result.gsub!(/^[\n]/, '')
  end
end
