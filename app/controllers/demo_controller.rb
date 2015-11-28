class DemoController < ApplicationController
  def index
  end

  def text_helpers
    @text = "This is some long sample text. It includes line breaks\n and double-line breaks.\n\n It rambles on and on and on. \n\n Until we get to last line."
  end

  def number_helpers
  end
end
