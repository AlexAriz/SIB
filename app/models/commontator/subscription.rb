# == Schema Information
#
# Table name: commontator_subscriptions
#
#  id              :integer          not null, primary key
#  subscriber_type :string(255)      not null
#  subscriber_id   :integer          not null
#  thread_id       :integer          not null
#  created_at      :datetime
#  updated_at      :datetime
#
# Indexes
#
#  index_commontator_subscriptions_on_s_id_and_s_type_and_t_id  (subscriber_id,subscriber_type,thread_id) UNIQUE
#  index_commontator_subscriptions_on_thread_id                 (thread_id)
#
module Commontator
  class Subscription < ActiveRecord::Base
    belongs_to :subscriber, :polymorphic => true
    belongs_to :thread

    validates_presence_of :subscriber, :thread
    validates_uniqueness_of :thread_id, :scope => [:subscriber_type, :subscriber_id]

    def self.comment_created(comment)
      recipients = comment.thread.subscribers.reject{|s| s == comment.creator}
      return if recipients.empty?

      mail = SubscriptionsMailer.comment_created(comment, recipients)
      mail.respond_to?(:deliver_later) ? mail.deliver_later : mail.deliver
    end

    def unread_comments
      created_at = Comment.arel_table[:created_at]
      thread.filtered_comments.where(created_at.gt(updated_at))
    end
  end
end
