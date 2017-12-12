json.extract! order_attachment, :id, :order_id, :avatar, :created_at, :updated_at
json.url order_attachment_url(order_attachment, format: :json)
