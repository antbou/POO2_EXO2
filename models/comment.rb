class Comment < ActiveRecord::Base
    belongs_to :target, polymorphic: true
    belongs_to :author, :class_name => 'Client',foreign_key: 'author_id'

    def to_s
        "#{content} => #{target_type}"
    end
end