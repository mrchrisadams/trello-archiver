require 'pry'
require 'csv'

def createcsv(board, filenamestub="productbacklogbackup", includecomments=true)
  lists = board.lists
  CSV.open("#{DateTime.now.strftime "%Y%m%dT%H%M"}_#{filenamestub}.csv", "wb") do |csv|

    csv << ["Title", "List", "Description"]

    lists.each do |list|
      puts list.name
      cards = list.cards
      cards.each do |card|
        puts "Downloading #{card.name}"
        csv << ["#{card.name}", "#{card.list.name}", "#{card.description}"]
      end
    end
  end
end
