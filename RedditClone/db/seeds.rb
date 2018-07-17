# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ActiveRecord::Base.transaction do 
User.destroy_all
Sub.destroy_all 
Post.destroy_all 
PostSub.destroy_all
u1 = User.create(username:'A', password:'123456')
u2 = User.create(username:'b', password:'123456')

sub1 = Sub.create(title: "ReddditSub1", description: "i'm a description", moderator_id:u1.id)
sub2 = Sub.create(title: "ReddditSub122222",description: "i'm a description",  moderator_id:u1.id)

post1 = Post.create(title: 'post1', author_id: u1.id, sub_ids:[sub1.id, sub2.id])
# post1.sub_ids=[sub1.id, sub2.id]
# post1.save!
# post_sub1 = PostSub.create(sub_ids: [sub1.id,sub2.id], post_id: post1.id)

end