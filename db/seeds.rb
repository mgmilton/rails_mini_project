Idea.destroy_all
Category.destroy_all

IDEAS = ["Eat more vegetables", "Use a daily planner", "Automation", "Play with your dog more", "Hike Mt. Evans", "Ride bike to Red Rocks", "Neural Network", "Genetic Algorithm", "Unsupervised Learning", "Read more"]
CATEGORIES = ["Organization", "Recreation", "Blog Post", "Goals"]

CATEGORIES.each do |name|
  Category.create!(name: name)
end

idea_cycle = IDEAS.cycle

10.times do |num|
    Category.all.sample.ideas.create!(title: idea_cycle.next, description: "What a great idea!")
end
