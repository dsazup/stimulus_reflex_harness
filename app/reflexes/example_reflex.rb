# frozen_string_literal: true

class ExampleReflex < ApplicationReflex
  delegate :uuid, to: :connection

  before_reflex do
    session[:rows] ||= []
  end

  def add
    session[:rows] << {id: rand(1..100000)}
  end

  def remove
    session[:rows] = session[:rows].reject {|row| row[:id] == element.dataset.id.to_i }
  end
end
