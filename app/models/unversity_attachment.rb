class UnversityAttachment < ApplicationRecord
   mount_uploader :attachment, AttachmentUploader
   belongs_to :university, optional: true
end
