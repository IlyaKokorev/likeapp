class CounterStatJob < ApplicationJob
  queue_as :default

  def perform(counter)
    counter.increment!(:count)
  end
end
