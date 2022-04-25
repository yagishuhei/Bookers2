class Book < ApplicationRecord
  has_one_attached :image
  belongs_to :user


  validates:title, presence:true
  validates:body, allow_blank: true, length: { minimum: 0, maximum: 200 }

   def get_image
     unless image.attached?
       file_path = Rails.root.join('app/assets/images/profile_image.jpeg')
       image.attach(io: File.open(file_path),filename: 'default-image.jpg',content_type: 'image/jpeg')
     end
     image
   end
end
