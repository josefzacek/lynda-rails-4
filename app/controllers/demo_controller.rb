class DemoController < ApplicationController
  def index
  end

  def text_helpers
    @text = Demo.text
  end

  def number_helpers
  end

  def date_time_helpers
  end

  def custom_helpers
  end

  def sanitize_helpers
  end
end
