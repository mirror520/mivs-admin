# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Codec seed
h264 = Codec.create(codec: 'H264')
h265 = Codec.create(codec: 'HEVC')
jpeg = Codec.create(codec: 'JPEG')
raw = Codec.create(codec: 'RAW')

# Protocol seed
http = Protocol.create(protocol: 'HTTP')
rtsp = Protocol.create(protocol: 'RTSP')
rtmp = Protocol.create(protocol: 'RTMP')
file = Protocol.create(protocol: 'FILE')
dev = Protocol.create(protocol: 'DEV')
sdk = Protocol.create(protocol: 'SDK')
mp4 = Protocol.create(protocol: 'MP4')
m3u8 = Protocol.create(protocol: 'M3U8')

# VideoFormat seed
h264.protocols = [http, rtsp, rtmp, file, dev, sdk, mp4, m3u8]
h265.protocols = [rtsp, file, mp4, sdk]
jpeg.protocols = [http, file]
raw.protocols = [dev]

# CameraType seed
webcam = CameraType.create(name: 'Webcam')
ipcam = CameraType.create(name: 'IPCam')
cctv = CameraType.create(name: 'CCTV')
file = CameraType.create(name: 'File')

# CameraBrand seed
# H264_OVER_DEV = VideoFormat.joins(:codec, :protocol).where('codecs:codec': 'H264').where('protocols:protocol': 'DEV')
H264_OVER_DEV = VideoFormat.find_by(format: 'H264_OVER_DEV')
RAW_OVER_DEV = VideoFormat.find_by(format: 'RAW_OVER_DEV')
H264_OVER_RTSP = VideoFormat.find_by(format: 'H264_OVER_RTSP')
H264_OVER_RTMP = VideoFormat.find_by(format: 'H264_OVER_RTMP')
H264_OVER_SDK = VideoFormat.find_by(format: 'H264_OVER_SDK')

c920 = CameraBrand.create(
    brand: 'Logitech', model: 'c920', 
    is_ptz_available: false, is_sound_available: true, is_infrared_available: false, is_flash_available: false, 
    max_resolution_width: 1920, max_resolution_height: 1080, camera_type: webcam)
c920.video_formats = [H264_OVER_DEV, RAW_OVER_DEV]

lilin = CameraBrand.create(
    brand: 'LILIN', model: 'LR7022E4', 
    is_ptz_available: false, is_sound_available: false, is_infrared_available: true, is_flash_available: false, 
    max_resolution_width: 1920, max_resolution_height: 1080, camera_type: ipcam)
lilin.video_formats = [H264_OVER_RTSP]

icatch = CameraBrand.create(
    brand: 'iCatch', model: 'DVR', 
    is_ptz_available: false, is_sound_available: true, is_infrared_available: true, is_flash_available: true, 
    max_resolution_width: 1920, max_resolution_height: 1080, camera_type: cctv)
icatch.video_formats = [H264_OVER_RTSP, H264_OVER_RTMP, H264_OVER_SDK]

# Location seed
ncut = Location.create(
    location: '勤益科技大學', 
    address: '臺中市太平區坪林里中山路二段57號', 
    map: nil)

management = LocationBuilding.create(
    building: '管理學院',
    local_x: 0, local_y: 0,
    location: ncut
)
6.times do |i| 
    LocationBuildingFloor.create(
        layout: nil, 
        floor: i + 1, 
        location_building: management)
end

mis_4f = management.floors.find_by(floor: 4)
mis_5f = management.floors.find_by(floor: 5)

mis_4f_outside = LocationArea.create(
    area: '資管系4樓走廊', 
    layout: nil, floor_x: 0, floor_y: 0, 
    location_building_floor: mis_4f)
mis_5f_outside = LocationArea.create(
    area: '資管系5樓走廊', 
    layout: nil, floor_x: 0, floor_y: 0, 
    location_building_floor: mis_5f)
mis_409_room = LocationArea.create(
    area: '資管系409教室', 
    layout: nil, floor_x: 0, floor_y: 0, 
    location_building_floor: mis_4f)
mis_503_room = LocationArea.create(
    area: '資管系503教室', 
    layout: nil, floor_x: 0, floor_y: 0, 
    location_building_floor: mis_5f)

# Camera seed
camera1 = Camera.create(
    name: 'Logitech C920', address: "/dev/video0", 
    output_width: 1920, output_height: 1080, 
    x: 0, y: 0, is_record_enabled: true, is_enabled: true, 
    camera_brand: c920, 
    camera_video_format: CameraVideoFormat.where(camera_brand: c920, video_format: H264_OVER_DEV).first, 
    location_area: mis_5f_outside)

camera2 = Camera.create(
    name: 'Logitech C920', address: "/dev/video1", 
    output_width: 1920, output_height: 1080, 
    x: 0, y: 0, is_record_enabled: true, is_enabled: true, 
    camera_brand: c920, 
    camera_video_format: CameraVideoFormat.where(camera_brand: c920, video_format: H264_OVER_DEV).first, 
    location_area: mis_5f_outside)

# Server seed
dvr1 = Dvr.create(account: 'admin', password: '123456', channel_num: 8)
          .create_server(name: 'MIS DVR-1', address: '192.168.0.100', port: 80, location_area: mis_5f_outside)
dvr2 = Dvr.create(account: 'admin', password: '123456', channel_num: 8)
          .create_server(name: 'MIS DVR-2', address: '192.168.0.110', port: 80, location_area: mis_5f_outside)

dvr1.cameras = [camera1, camera2]