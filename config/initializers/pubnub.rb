require 'pubnub'
$pubnub = Pubnub.new(
   subscribe_key: :rtcomments,
   publish_key: :rtcomments
)