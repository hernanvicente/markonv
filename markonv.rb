class Markonv
  def initialize(markdown)
    @markdown = markdown
  end

  def parse
    prepare
    @markdown
  end

  private

  def prepare
    @markdown.strip!
  end
end
