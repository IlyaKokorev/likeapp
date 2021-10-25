class LikesController < ApplicationController
  # GET /likes
  def index
    Counter.transaction(isolation: :serializable) do
      counter = Counter.first!
      counter.slots_taken.increment
      write_to_file(counter.slots_taken.value)
    end
    # CounterStatJob.perform_later(counter)
    # Counter.connection.execute("SET SESSION TRANSACTION ISOLATION LEVEL SERIALIZABLE")
    # counter = Counter.first
    # CounterStatJob.perform_later(counter)
    #
    # begin
    #   Counter.transaction(isolation: :serializable) do
    #     counter = Counter.first
    #     CounterStatJob.perform_later(counter)
    #   end
    # rescue ActiveRecord::StatementInvalid => e
    #   sleep rand / 10
    #   retry
    # end
  end

  def write_to_file(value)
    file = File.new("./file.txt", "a:UTF-8")
    file.print("#{value}\n")
    file.close
  end

  # POST /likes
  def create
    AddLikeJob.perform_later(like_param)
  end

  private

  def like_param
    params.require(:like).permit(:user_id, :post_id)
  end
end
