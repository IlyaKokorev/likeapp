class CounterStatJob < ApplicationJob
  queue_as :default

  def perform(counter)
    counter.nil? ? Counter.create!(count: 1) : counter.update(count: counter.count += 1)
  end
end
