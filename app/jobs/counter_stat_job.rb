class CounterStatJob < ApplicationJob
  queue_as :up_counter

  def perform(counter)
    ActiveRecord::Base.transaction do
      counter.nil? ? Counter.create!(count: 1) : counter.update(count: counter.count += 1)
    end
  end
end
