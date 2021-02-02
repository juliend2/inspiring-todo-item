require 'todoist'
require 'pp'

P1 = 4
P2 = 3
P3 = 2
P4 = 1

begin
  token = File.open("token.string", "r").read
rescue
  puts "Please create a file called token.string and have the first line be your Todoist auth token."
  exit  
end

day_of_month = Time.now.day

quotes = [
  "Ce que tu ne sais pas te coûte de l'argent. ce que tu sais te fait gagner de l'argent.",
  "Le succès n'est pas dans le fait dans l'atteinte d'un but, mais dans le fait d'avoir un système en marche vers ta vision/mission.",
  "Subdiviser les grosses tâches intimidantes en sous-tâches pour contourner la procrastination.",
  "Good enough now is better than perfect too late.",
  "Optimize your efficiency by accelerating your feedback loops.",
  "_Memento Mori_: Un jour, tu va mourir.",
  "\"Je suis le cep, vous êtes les sarments. Celui qui demeure en moi et en qui je demeure porte beaucoup de fruit, car sans moi vous ne pouvez rien faire.\" -- Jean 15.5",
  "Faire une chose à la fois. sur plusieurs années, est mieux que de faire plusieurs choses en même temps. Apprends à dire non à certaines de tes idées.",
  "\"It's better to have a bad plan than no plan\" -- Peter Thiel",
  "Toujours s'arranger pour être libre financièrement; ça laisse un levier lors de négociations.",
  "Prends en compte la valeur de ton temps lorsque les divertissements demandent beaucoup de temps. Laisser passer 24h avant décider si tu veux vraiment commencer une nouvelle série télévisée.",
  "\"Are you starting with a big share of a small market?\" -- The Monopoly question, from 'Zero to One', Peter Thiel",
]

quote = "ERROR: no quote was found for today"
modulo = day_of_month % quotes.size
quote = quotes[ modulo ]

@client = Todoist::Client.create_client_by_token(token)
item = @client.misc_items.add_item("✨  **#{quote}**", priority: P3, date_string: 'tomorrow @ 10am')

pp item

