[![Code Climate](https://codeclimate.com/github/skierkowski/alexa-skill/badges/gpa.svg)](https://codeclimate.com/github/skierkowski/alexa-skill)
[![Dependency Status](https://gemnasium.com/badges/github.com/skierkowski/alexa-skill.svg)](https://gemnasium.com/github.com/skierkowski/alexa-skill)


# Alexa Skill 
A Ruby based DSL to create new Alexa Skills 

First, install the gem
```bash
gem install alexa-skill
```

Now we'll create a simple hello world app
**app.rb**
```ruby
require 'alexa-skill/app'

intent 'MyApp' do
  utterance 'my name is {name}'
  slot 'name', ['michelle', 'rich', 'stacie', 'tim', 'emma']

  respond do |slots|
    "Hi, #{slots['name']}"
  end
end
```

This sets up Rackup to run the app, just like running a Sinatra app
**config.ru**
```ruby
require './app'
require 'alexa-skill/server'

run AlexaSkill::Server
```

Now we can start the server
```bash
rackup
```

Now we can configure the server in the Alexa Developer Portal.
```bash
curl http://localhost:9292/utterances.txt
curl http://localhost:9292/schema.json
curl http://localhost:9292/types.txt?type=LIST_OF_NAME
```
