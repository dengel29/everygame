class SaveGames < Actor
  input :games_to_save

  def call
    games_to_save
  end
end