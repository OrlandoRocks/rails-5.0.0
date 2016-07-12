# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class UsersChannel < ApplicationCable::Channel
  def self.broadcast(hash)
    broadcast_to 'list',
                 key: hash[:key],
                 user: UsersController.render(partial: 'users/user', locals: { user: hash[:object] }),
                 id: hash[:object]&.id
  end

  def subscribed
    # stream_for User.last
    stream_from 'users:list'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
