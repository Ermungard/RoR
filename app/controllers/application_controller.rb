class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true

  def meta_title(title)
    ['Блог', title].reject(&:empty?).join(' - ')
  end
end
