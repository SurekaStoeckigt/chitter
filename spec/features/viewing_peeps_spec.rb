feature 'displays peeps' do
  scenario 'user can view peeps in reverse chronological order' do
    connection = PG.connect(dbname: 'chitter_test')

    Peep.create(body: 'Test peep from database')
    Peep.create(body: 'Second test peep from database')
    # connection.exec("INSERT INTO peeps1 VALUES(1, 'Test peep from database');")
    # connection.exec("INSERT INTO peeps1 VALUES(2, 'Second test peep from database');")

    visit('/peeps')

    expect(page).to have_content "Test peep from database"
    expect(page).to have_content "Second test peep from database"
  end
end