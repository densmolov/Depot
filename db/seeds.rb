# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.delete_all
Product.create!(title: 'The Catcher in the Rye', author: 'J.D. Salinger',
  description: 
    %{<p>
        The hero-narrator of THE CATCHER IN THE RYE is an ancient child of sixteen, a native New Yorker named Holden Caulfield. Through circumstances that tend to preclude adult, secondhand description, he leaves his prep school in Pennsylvania and goes underground in New York City for three days. The boy himself is at once too simple and too complex for us to make any final comment about him or his story. Perhaps the safest thing we can say about Holden is that he was born in the world not just strongly attracted to beauty but, almost, hopelessly impaled on it. There are many voices in this novel: children's voices, adult voices, underground voices-but Holden's voice is the most eloquent of all. Transcending his own vernacular, yet remaining marvelously faithful to it, he issues a perfectly articulated cry of mixed pain and pleasure. However, like most lovers and clowns and poets of the higher orders, he keeps most of the pain to, and for, himself. The pleasure he gives away, or sets aside, with all his heart. It is there for the reader who can handle it to keep.
      </p>},
  image_url:   'catcher.jpg',    
  price: 36.00)

Product.create!(title: 'First Blood', author: 'David Morrell',
  description:
    %{<p>
        First came the man: a young wanderer in a fatigue coat and long hair. Then came the legend, as John Rambo sprang from the pages of FIRST BLOOD to take his place in the American cultural landscape. This remarkable novel pits a young Vietnam veteran against a small-town cop who doesn't know whom he's dealing with -- or how far Rambo will take him into a life-and-death struggle through the woods, hills, and caves of rural Kentucky. Millions saw the Rambo movies, but those who haven't read the book that started it all are in for a surprise -- a critically acclaimed story of character, action, and compassion.
      </p>},
  image_url: 'firstblood.jpg',
  price: 49.95)

Product.create!(title: '1984 (Signet Classics)', author: 'George Orwell',
  description: 
    %{<p>
        Written in 1948, 1984 was George Orwell’s chilling prophecy about the future. And while 1984 has come and gone, Orwell’s narrative is timelier than ever. 1984 presents a startling and haunting vision of the world, so powerful that it is completely convincing from start to finish. No one can deny the power of this novel, its hold on the imaginations of multiple generations of readers, or the resiliency of its admonitions—a legacy that seems only to grow with the passage of time.
      </p>},
  image_url: '1984.jpg',
  price: 34.95)

PayType.delete_all
PayType.create(:id => 1, :name => "Check")
PayType.create(:id => 2, :name => "Credit card")
PayType.create(:id => 3, :name => "Purchase order")