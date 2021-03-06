module GabbaGMP
  class GabbaGMP
    module Event
      # Public: Record an event in Google Analytics
      # (https://developers.google.com/analytics/devguides/collection/protocol/v1/devguide)
      #
      # category::  
      # action::    
      # label::     
      # value::     
      # options::   Optional. Any additional parameters to send with the page view
      #
      # Example:
      #
      #   g.event("Videos", "Play", "ID", "123")
      #
      def event(category, action, label = nil, value = nil, options = {})
        send(event_params(category, action, label, value, options))
      end

      private
      # Private: Renders event params data in the format needed for GA
      # Called before actually sending the data along to GA in GabbaGMP#event
      def event_params(category, action, label, value, event_options)
        options = {
          hit_type: "event",
          event_category: category,
          event_action: action
        }
        options[:event_label] = label unless label.to_s.empty?
        options[:event_value] = value unless value.to_s.empty?
        @sessionopts.merge(options).merge!(event_options)
      end
    end
  end
end