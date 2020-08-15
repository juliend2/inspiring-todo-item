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

module Todoist
  module Misc
    class Items < Todoist::Service
      def add_item(content, optional_params = {})
        params = {content: content}
        if optional_params["project"]
          params["project_id"] = project.id
          optional_params.delete("project")
        end

        if optional_params["labels"]
          labels = optional_params["labels"]
          labels_param = labels.collect { |label| label.id }
          params["labels"] = labels_param.to_json
          optional_params.delete("labels")
        end

        params.merge!(optional_params)
        result = @client.api_helper.get_response(Config::TODOIST_ITEMS_ADD_COMMAND, params)
        item = ParseHelper.make_object(result)
        return item
      end
    end
  end
end

day_of_month = Time.now.day

quotes = [
  "Ce que tu ne sais pas te coûte de l'argent. ce que tu sais te fait gagner de l'argent.",
  "Le succès n'est pas dans le fait dans l'atteinte d'un but, mais dans le fait d'avoir un système en marche vers ta vision/mission.",
  "Est-ce que tu marche vers ta vision, aujourd'hui ?",
  "_Memento Mori_: Un jour, tu va mourir.",
  "\"Je suis le cep, vous êtes les sarments. Celui qui demeure en moi et en qui je demeure porte beaucoup de fruit, car sans moi vous ne pouvez rien faire.\" -- Jean 15.5",
  "Is there something unnecessary that I do? If so, I need to stop doing it.",
  "Faire une chose à la fois. sur plusieurs années, est mieux que de faire plusieurs choses en même temps. Apprends à dire non à certaines de tes idées.",
  "\"It's better to have a bad plan than no plan\" -- Peter Thiel",
]

quote = "ERROR: no quote was found for today"
modulo = day_of_month % quotes.size
quote = quotes[ modulo ]

@client = Todoist::Client.create_client_by_token(token)
item = @client.misc_items.add_item("✨  **#{quote}**", priority: P3, date_string: 'tomorrow @ 10am')

pp item

