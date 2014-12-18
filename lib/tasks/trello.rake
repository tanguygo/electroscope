require 'trello'

namespace :trello do
  desc "List all board and list ids"
  task boards: :environment do
    Trello::Board.all.each do |board|
      puts "# #{board.name}"
      board.lists.each do |list|
        puts "  #{list.id} - #{list.name}"
      end
      puts ""
    end
  end
end