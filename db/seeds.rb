user_1 = User.create!(email: 'bobo@gmail.com', password: '123')
user_2 = User.create!(email: 'bobo1@gmail.com', password: '456')
user_3 = User.create!(email: 'bobo2@gmail.com', password: '789')
user_4 = User.create!(email: 'bobo3@gmail.com', password: '101')
user_5 = User.create!(email: 'yoyo@gmail.com', password: '101')

friendship_1 = Friendship.create(follower_id: user_1.id, followee_id: user_2.id)
friendship_2 = Friendship.create(follower_id: user_3.id, followee_id: user_2.id)
friendship_3 = Friendship.create(follower_id: user_4.id, followee_id: user_2.id)
# user_2 has 3 followers
# users 1, 3, 4 have one followee and no followers

party_1 = Party.create(user_id: user_2.id, movie_title: 'The Lorax', duration: 120, date: '9999-12-31', start_time: "13:00:00")
viewing_party_guests_1 = ViewingPartyGuest.create(user_id: user_1.id, party_id: party_1.id)
viewing_party_guests_2 = ViewingPartyGuest.create(user_id: user_3.id, party_id: party_1.id)
viewing_party_guests_3 = ViewingPartyGuest.create(user_id: user_4.id, party_id: party_1.id)
