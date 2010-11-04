class ActicEvent < SubComponent
    include Actic::SubComponent::Event
    belongs_to :calendar
end
