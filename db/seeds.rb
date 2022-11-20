#initial criation of seeds
puts "Creating seeds..."
puts "Creating actors..."
actors =  [
  {
    name: "Jhonny Depp",
    email: "jhonnydepp@gmail.com",
    year: "1963"
  },
  {
    name: "Leonardo DiCaprio",
    email: "Leionardo@gmail.com",
    year: "1998"
  },
  {
    name: "Julianna Margulies",
    email: "juliemarques@gmail.com",
    year: "1993"  
  },
  {
    name: "Tom Hanks",
    email: "tomhanks@gmail.com",
    year: "1994"
  },
]

actors.each do |actor|
  Actor.find_or_create_by!(actor)
end

puts "Creating movies..."
movies = [
  {
    title: "The Godfather",
    year: "1983",
    actor: actors[0]
  },
  {
    title: "The Shawshank Redemption",
    year: "1994",
    actor: actors[1]

  },
  {
    title: "The Dark Knight",
    year: "2008",
    actor: actors[2]

  },
  {
    title: "The Godfather: Part II",
    year: "1984",
    actor: actors[3]

  },
  {
    title: "Harry Potter and the Chamber of Secrets",
    year: "2006",
    actor: actors[0]

  },
]

movies.each do |movie|
  moviee = Movie.new(title:movie[:title], year:movie[:year])
  moviee.actors << Actor.find_by(name: movie[:actor][:name])
  moviee.save!
end


puts "Creating Comments..."
comments =  [
  {
    body: "òtimo filme!",
    approved: true,
    movie: movies[0]
  },
  {
    body: "òtimo recomendo!",
    approved: true,
    movie: movies[0]
  },
  {
    body: "Final inesperado!",
    approved: true,
    movie: movies[1]
  },
  {
    body: "Filme Ruim!",
    approved: true,
    movie: movies[2]
  },
  {
    body: "O livro é melhor!",
    approved: true,
    movie: movies[3]
  },
  {
    body: "De longe o melhor filme já feito!",
    approved: true,
    movie: movies[4]
  },
  {
    body: "Devia ter mais arcos e histórias",
    approved: true,
    movie: movies[4]
  },
]

comments.each do |comment|
  commentt = Comment.new(body:comment[:body], approved:comment[:approved])
  commentt.movie_id = Movie.find_by(title: comment[:movie][:title]).id

  commentt.save!
end

puts "Banco Criado com sucesso!"




