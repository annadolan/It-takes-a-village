class Seed

  def self.start
    seed = Seed.new
    seed.create_categories
  end

  def create_categories
    (%w(Parent Organizer Villager)).each do |category|
      category = Category.create!(name: category)
      puts "Creating category: #{category.name}"
    end
  end

  Seed.start
end
