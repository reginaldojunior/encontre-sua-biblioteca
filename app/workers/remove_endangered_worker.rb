# frozen_string_literal: true

class RemoveEndangeredWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform
    Endangered.destroy_all
  end
end
