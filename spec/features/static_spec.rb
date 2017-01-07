# frozen_string_literal: true
require 'rails_helper'

feature 'navigate' do
  describe 'homepage' do
    scenario 'can be reached successfully' do
      visit root_path
      expect(status_code).to eq 200
    end
  end
end
