class CounterStatJob < ApplicationJob
  queue_as :default

  def perform(counter)
    ActiveRecord::Base.transaction do
      counter.update(count: counter.count += 1)
    end
  end
end
