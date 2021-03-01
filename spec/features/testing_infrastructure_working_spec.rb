feature 'infrastructure' do
  scenario 'works' do
    visit('/')
    expect(page).to have_content('wordle')
  end
end
