class Download < ActiveRecord::Base
  belongs_to :submission

  has_attached_file :file
  validates_attachment :file, :size => { :less_than => 50.megabytes }, :content_type => { :content_type => SUPPORTED_CONTENTS }

  SUPPORTED_CONTENTS = [
    # Images
    'image/jpeg',
    'image/gif',
    'image/png',
    'application/pdf',
    'image/vnd.dxf',
    'image/vnd.xiff',
    'application/x-latex',
    'image/vnd.adobe.photoshop',
    'image/png',
    'image/svg+xml',
    'image/tiff',
    'image/webp',

    # 3D
    'model/vnd.collada+xml',

    # Audio
    'audio/x-aiff',
    'application/x-bzip',
    'application/x-bzip2',
    'audio/x-ms-wma',
    'application/ogg',
    'audio/ogg',

    # Video
    'video/x-flv',
    'video/h264',
    'application/java-archive',
    'video/x-m4v',
    'video/mpeg',
    'video/mp4',
    'video/ogg',
    'video/quicktime',

    # Code
    'text/plain',
    'text/x-c',
    'text/css',
    'application/x-sh',
    'text/csv',
    'application/ecmascript',
    'text/tab-separated-values',
    'application/x-tcl',
    'application/xml',
    'text/yaml',

    # Office
    'application/vnd.ms-excel',
    'application/vnd.openxmlformats-officedocument.presentationml.presentation',
    'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
    'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
    'application/msword',
    'application/vnd.ms-xpsdocument',
    'application/vnd.oasis.opendocument.presentation',
    'application/vnd.oasis.opendocument.spreadsheet',
    'application/vnd.oasis.opendocument.text',
    'application/rtf',

    # Fonts
    'application/x-font-otf',
    'application/x-font-ttf',
    'application/x-font-woff',

    # Compressed files
    'application/x-rar-compressed',
    'application/zip',
    'application/x-7z-compressed',

    # Executables
    'application/x-shockwave-flash',
    'application/vnd.adobe.air-application-installer-package+zip',
    'application/vnd.android.package-archive',
    'application/vnd.apple.installer+xml',
    'application/x-msdownload',
    'application/x-rar-compressed',
    'application/x-tar',
    'application/vnd.unity'
  ]
end
