class Counter < ApplicationRecord
  include Redis::Objects

  counter :slots_taken
  counter :current_counter
end
