class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :username, :connected, :channel
  attribute :rooms do |user|
    user.rooms.uniq
  end
end
