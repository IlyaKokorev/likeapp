class CounterStatJob < ApplicationJob
  queue_as :default

  def perform(counter)
    counter.with_lock do
      counter.increment!(:count)
      counter.save!
    end
  end
end
