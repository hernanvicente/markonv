require 'minitest/autorun'
require_relative 'markonv'

class MarkonvTest < Minitest::Test
  def setup
    @markdown = <<~MARKDOWN
      And **strong** and __bold__ are strong tags.

      But *emphasis* and _emphasis_ are emphasis tags.

      And this is the second paragraph

      And this is the third paragraph and a list:

      * One
      * Two

      A final paragraph
    MARKDOWN

    @html = <<~HTML.strip
      <p>And <strong>strong</strong> and <strong>bold</strong> are strong tags.</p>
      <p>But <em>emphasis</em> and <em>emphasis</em> are emphasis tags.</p>
      <p>And this is the second paragraph</p>
      <p>And this is the third paragraph and a list:</p>
      <p>* One
      * Two</p>
      <p>A final paragraph</p>
    HTML
  end

  def test_markdown
    markonv = Markonv.new(@markdown)
    assert_equal @html, markonv.parse
  end
end
