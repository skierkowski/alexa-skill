
module AlexaSkill
  INTENTS = {}

  class Registry
    def self.register(name, intent)
      INTENTS[name] = intent
    end

    def self.list
      INTENTS
    end

    def self.utterances
      response = []
      INTENTS.each do |name, intent|
        intent.utterances.each do |utter|
          response << "#{name} #{utter}"
        end
      end
      response
    end

    def self.schema
      response = {intents:[]}
      INTENTS.each do |name, intent|
        intent_schema = {intent: name, slots: []}
        intent.slots.each do |slot, properties|
          if properties.is_a?(String)
            slot_type = properties
          elsif properties.is_a?(Array)
            slot_type = "LIST_OF_#{slot.upcase}"
          else
            raise ArgumentError, "Property '#{properties}` not recognized"
          end

          intent_schema[:slots] << {
            name: slot,
            type: slot_type
          }
        end
        response[:intents] << intent_schema
      end
      response
    end

    def self.types
      response = {}
      INTENTS.each do |name, intent|
        intent.slots.each do |slot, properties|
          if properties.is_a?(Array)
            slot_type = "LIST_OF_#{slot.upcase}"
            response[slot_type] = properties
          end
        end
      end
      response
    end
  end
end