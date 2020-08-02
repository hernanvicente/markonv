require 'minitest/autorun'
require_relative 'markonv'

class MarkonvTest < Minitest::Test
  def setup
    @markdown = <<~MARKDOWN
      And **strong** and **bold** are strong tags.

      And this is the second paragraph

      And this is the third paragraph and a list:

      * One
      * Two

      A final paragraph
    MARKDOWN
  end

  def test_markdown
    markonv = Markonv.new(@markdown)
    assert_equal @markdown, markonv.parse
  end
end
