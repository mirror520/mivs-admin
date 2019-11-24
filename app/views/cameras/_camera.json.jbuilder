json.extract! camera,
    :id, :name, :address,
    :output_width, :output_height, 
    :x, :y, :is_record_enabled, :is_enabled
json.url camera_url(camera, format: :json)
