# frozen_string_literal: true

class PagesController < ApplicationController
  skip_before_action :authenticate_user
  before_action :authenticate_non_user

  def hello; end

  def hi; end
end
