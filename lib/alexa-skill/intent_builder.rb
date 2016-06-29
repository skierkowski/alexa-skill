require './lib/alexa-skill-kit/intent'

module AlexaSkill
  class IntentBuilder
    attr_reader :slots, :card_response, :response, :utterances
    def initialize(&block)
      @slots = {}
      @utterances = []
      self.instance_eval(&block)
    end

    def slot(name, options=[])
      @slots[name] = options
    end

    def card(&block)
      @card_response = block
    end

    def respond(&block)
      @response = block
    end

    def utterance(value)
      @utterances << value
    end

    def self.build(builder)
      intent = AlexaSkill::Intent.new
      intent.slots      = builder.slots
      intent.utterances = builder.utterances
      intent.response   = builder.response
      intent.card       = builder.card_response
      intent
    end
  end
end