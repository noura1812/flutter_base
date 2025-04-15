class ValueMapper {
  static const Map<int, String> _statusMap = {
    0: "Accepted",
    1: "Sent",
    2: "Delivered",
    3: "Received",
    4: "Read",
    5: "Deleted",
    6: "Failed",
    7: "Warning",
  };

  static const Map<int, String> _fileTypeMap = {
    1: "Image",
    2: "Video",
    3: "Document",
    4: "Audio",
    5: "Sticker",
  };

  static const Map<int, String> _channelMap = {
    1: "WhatsApp",
    2: "Messenger",
    3: "Instagram",
  };

  static String? getStatus(int value) => _statusMap[value];
  static String? getFileType(int value) => _fileTypeMap[value];
  static String? getChannel(int value) => _channelMap[value];
}
