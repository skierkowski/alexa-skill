require 'alexa-skill/intent_builder'
require 'alexa-skill/registry'

def intent(name, &block)
  builder = AlexaSkill::IntentBuilder.new(&block)
  intent  = AlexaSkill::IntentBuilder.build(builder)
  AlexaSkill::Registry.register(name, intent)
end