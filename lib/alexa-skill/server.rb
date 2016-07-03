require 'sinatra/base'
require 'sinatra/json'
require 'alexa_skills_ruby'

require 'alexa-skill/registry'

module AlexaSkill
  class Handler < AlexaSkillsRuby::Handler
    AlexaSkill::Registry.list.each do |name, intent|
      on_intent name do
        slots = request.intent.slots
        response.set_output_speech_text( intent.response.call(slots) )
      end
    end
  end

  class Server < Sinatra::Base
    post '/' do
      content_type :json

      handler = Handler.new(application_id: ENV['APPLICATION_ID'], logger: logger)

      begin
        handler.handle(request.body.read)
      rescue AlexaSkillsRuby::InvalidApplicationId => e
        logger.error e.to_s
        403
      end

    end

    get '/schema.json' do
      content_type :json
      json AlexaSkill::Registry.schema
    end

    get '/types.txt' do
      (AlexaSkill::Registry.types[params[:type]] || []).join("\n")
    end


    get '/utterances.txt' do
      content_type 'text/plain'
      AlexaSkill::Registry.utterances.join("\n")
    end
  end
end