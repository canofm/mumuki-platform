require 'spec_helper'

feature 'Login Flow' do
  let!(:exercise) { create(:exercise) }

  scenario 'login from home' do
    visit '/'

    click_on 'Sign in with Github'

    expect(page).to have_text('testuser')
    expect(page).to have_text('Mumuki is a simple, open and collaborative platform')
  end

  scenario 'login from home, localized' do
    visit '/es'

    click_on 'Iniciá sesion con Github'

    expect(page).to have_text('testuser')
    expect(page).to have_text('Mumuki es una plataforma simple, abierta y colaborativa')
  end


  scenario 'login on authentication request' do
    visit "/en/exercises/#{exercise.id}"

    expect(page).to have_text(exercise.title)

    within '.actions' do
      click_on 'Sign in with Github'
    end
    expect(page).to have_text('Sign Out')
  end
end
