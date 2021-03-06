# Keep all the record creation needed to seed the database with its default values
# Run db:seed command when necessary

# Destroy all records to have a blank slate - so we can run seed command as many times as we want.
Comment.destroy_all
Item.destroy_all
Band.destroy_all
User.destroy_all

# Create seeds for items, users and bands.
users = User.create([
    {
        email: "bruce@gmail.com",
        password: "bruceblue",
        name: "Bruce Blue",
        bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sed dapibus elit. Aenean sed nunc volutpat, vulputate metus sed, interdum nisi. Morbi efficitur, augue et tincidunt iaculis, ligula lorem pellentesque metus, consequat euismod lectus tellus in neque. Maecenas fringilla efficitur mi ac porta. Vestibulum id orci tortor. Fusce cursus, leo.",
        genres: "Rock, Punk"
    }, 
    {
        email: "mary@gmail.com",
        password: "marymauve",
        name: "Mary Mauve",
        bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sed dapibus elit. Aenean sed nunc volutpat, vulputate metus sed, interdum nisi. Morbi efficitur, augue et tincidunt iaculis, ligula lorem pellentesque metus, consequat euismod lectus tellus in neque. Maecenas fringilla efficitur mi ac porta. Vestibulum id orci tortor. Fusce cursus, leo.",
        genres: "Indie, Pop" 
    },
    {
        email: "lars@gmail.com",
        password: "larslavender",
        name: "Lars Lavender",
        bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sed dapibus elit. Aenean sed nunc volutpat, vulputate metus sed, interdum nisi. Morbi efficitur, augue et tincidunt iaculis, ligula lorem pellentesque metus, consequat euismod lectus tellus in neque. Maecenas fringilla efficitur mi ac porta. Vestibulum id orci tortor. Fusce cursus, leo.",
        genres: "Heavy Metal" 
    },
    {
        email: "georgia@gmail.com",
        password: "georgiagreen",
        name: "Georgia Green",
        bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sed dapibus elit. Aenean sed nunc volutpat, vulputate metus sed, interdum nisi. Morbi efficitur, augue et tincidunt iaculis, ligula lorem pellentesque metus, consequat euismod lectus tellus in neque. Maecenas fringilla efficitur mi ac porta. Vestibulum id orci tortor. Fusce cursus, leo.",
        genres: "Folk" 
    },
    {
        email: "owen@gmail.com",
        password: "owenorange",
        name: "Owen Orange",
        bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sed dapibus elit. Aenean sed nunc volutpat, vulputate metus sed, interdum nisi. Morbi efficitur, augue et tincidunt iaculis, ligula lorem pellentesque metus, consequat euismod lectus tellus in neque. Maecenas fringilla efficitur mi ac porta. Vestibulum id orci tortor. Fusce cursus, leo.",
        genres: "Blues, Alternative"
    }
])

seed_users=User.all
seed_users[4].add_role(:admin)

items = Item.create([
    {
        user_id: seed_users[1].id,
        brand: "Ibanez",
        model: "RGA320",
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sed dapibus elit. Aenean sed nunc volutpat, vulputate metus sed, interdum nisi. Morbi efficitur, augue et tincidunt iaculis, ligula lorem pellentesque metus, consequat euismod lectus tellus in neque. Maecenas fringilla efficitur mi ac porta. Vestibulum id orci tortor. Fusce cursus, leo.",
        for_sale: false,
        price: 0.00
    }, 
    {
        user_id: seed_users[2].id,
        brand: "Pearl",
        model: "Demon Drive Pedals",
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sed dapibus elit. Aenean sed nunc volutpat, vulputate metus sed, interdum nisi. Morbi efficitur, augue et tincidunt iaculis, ligula lorem pellentesque metus, consequat euismod lectus tellus in neque. Maecenas fringilla efficitur mi ac porta. Vestibulum id orci tortor. Fusce cursus, leo.",
        for_sale: false,
        price: 0.00
    },
    {
        user_id: seed_users[3].id,
        brand: "Pearl",
        model: "EXPORT EXL",
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sed dapibus elit. Aenean sed nunc volutpat, vulputate metus sed, interdum nisi. Morbi efficitur, augue et tincidunt iaculis, ligula lorem pellentesque metus, consequat euismod lectus tellus in neque. Maecenas fringilla efficitur mi ac porta. Vestibulum id orci tortor. Fusce cursus, leo.",
        for_sale: true,
        price: 1000.00
    },
    {
        user_id: seed_users[4].id,
        brand: "Shure",
        model: "SM-58",
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sed dapibus elit. Aenean sed nunc volutpat, vulputate metus sed, interdum nisi. Morbi efficitur, augue et tincidunt iaculis, ligula lorem pellentesque metus, consequat euismod lectus tellus in neque. Maecenas fringilla efficitur mi ac porta. Vestibulum id orci tortor. Fusce cursus, leo.",
        for_sale: true,
        price: 50.00
    },
    {
        user_id: seed_users[1].id,
        brand: "Warwick",
        model: "Thumb NT 1988",
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sed dapibus elit. Aenean sed nunc volutpat, vulputate metus sed, interdum nisi. Morbi efficitur, augue et tincidunt iaculis, ligula lorem pellentesque metus, consequat euismod lectus tellus in neque. Maecenas fringilla efficitur mi ac porta. Vestibulum id orci tortor. Fusce cursus, leo.",
        for_sale: true,
        price: 950.00
    }
])

seed_items = Item.all

comments = Comment.create([
    {
        description: "I love Ibanez.",
        user_id: seed_users[1].id,
        item_id: seed_items[1].id,
        flagged: false
    },
    {
        description: "Shure mic's are the sure way to go!",
        user_id: seed_users[2].id,
        item_id: seed_items[4].id,
        flagged: false
    },
    {
        description: "Pearl makes me pearl!",
        user_id: seed_users[3].id,
        item_id: seed_items[3].id,
        flagged: false
    },
    {
        description: "Remeber Warwick Cappa?",
        user_id: seed_users[4].id,
        item_id: seed_items[0].id,
        flagged: false
    },
    {
        description: "Ibanabanez. LOL!",
        user_id: seed_users[0].id,
        item_id: seed_items[1].id,
        flagged: false
    },
    {
        description: "Shurely you've got to be kidding!",
        user_id: seed_users[1].id,
        item_id: seed_items[4].id,
        flagged: false
    },
    {
        description: "I had one of these as my first drumkit!",
        user_id: seed_users[2].id,
        item_id: seed_items[3].id,
        flagged: false
    },
    {
        description: "Or Warwick Davies?",
        user_id: seed_users[3].id,
        item_id: seed_items[0].id,
        flagged: true
    }
])

bands = Band.create([
    {
        name: "Apple Band",
        bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sed dapibus elit. Aenean sed nunc volutpat, vulputate metus sed, interdum nisi. Morbi efficitur, augue et tincidunt iaculis, ligula lorem pellentesque metus, consequat euismod lectus tellus in neque. Maecenas fringilla efficitur mi ac porta. Vestibulum id orci tortor. Fusce cursus, leo.",
        genre: "Punk",
        status: true,
        users: [seed_users[1], seed_users[4], seed_users[0]]
    },
    {
        name: "Blueberry Band",
        bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sed dapibus elit. Aenean sed nunc volutpat, vulputate metus sed, interdum nisi. Morbi efficitur, augue et tincidunt iaculis, ligula lorem pellentesque metus, consequat euismod lectus tellus in neque. Maecenas fringilla efficitur mi ac porta. Vestibulum id orci tortor. Fusce cursus, leo.",
        genre: "Blues, Alternative",
        status: true,
        users: [seed_users[2], seed_users[3], seed_users[4]]
    },
    {
        name: "Banana Band",
        bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sed dapibus elit. Aenean sed nunc volutpat, vulputate metus sed, interdum nisi. Morbi efficitur, augue et tincidunt iaculis, ligula lorem pellentesque metus, consequat euismod lectus tellus in neque. Maecenas fringilla efficitur mi ac porta. Vestibulum id orci tortor. Fusce cursus, leo.",
        genre: "Rock",
        status: false,
        users: [seed_users[3], seed_users[4], seed_users[0]]
    },
    {
        name: "Strawberry Band",
        bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sed dapibus elit. Aenean sed nunc volutpat, vulputate metus sed, interdum nisi. Morbi efficitur, augue et tincidunt iaculis, ligula lorem pellentesque metus, consequat euismod lectus tellus in neque. Maecenas fringilla efficitur mi ac porta. Vestibulum id orci tortor. Fusce cursus, leo.",
        genre: "Indie, Pop",
        status: true,
        users: [seed_users[1], seed_users[2], seed_users[3]]
    },
    {
        name: "Mango Band",
        bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sed dapibus elit. Aenean sed nunc volutpat, vulputate metus sed, interdum nisi. Morbi efficitur, augue et tincidunt iaculis, ligula lorem pellentesque metus, consequat euismod lectus tellus in neque. Maecenas fringilla efficitur mi ac porta. Vestibulum id orci tortor. Fusce cursus, leo.",
        genre: "Heavy Metal",
        status: false,
        users: [seed_users[2], seed_users[3], seed_users[0]]
    }
])

# Prints number of items, users & bands created
p "Created #{Item.count} items"
p "Created #{User.count} users"
p "Created #{Band.count} bands"
p "Created #{Comment.count} comments"

# Try using rails runner commands, e.g.:
    # rails runner "p Item.pluck :brand" => an array of item brands
    # rails runner "p User.pluck :email" => an array of user emails
    # rails runner "p Band.pluck :name" => an array of band names