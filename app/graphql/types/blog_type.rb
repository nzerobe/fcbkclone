# module Types
#   class BlogType < Types::BaseObject
#     field :id, ID, null: false
#     field :title, String, null: false
#     field :text, String, null: false
#   end
# end

module Types
  class BlogType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :content, String, null: false
  end
end