@interface CSMockRemoteDevice
+ (id)opusAudioFormat;
- (AVAudioFormat)format;
- (BOOL)isRecording;
- (CSMockRemoteDevice)initWithDeviceName:(id)a3;
- (CSMockRemotePlugin)plugin;
- (NSArray)supportedFormats;
- (NSString)deviceIdentifier;
- (NSString)deviceName;
- (NSString)identifier;
- (NSUUID)uuid;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)audioFeedTimer;
- (OS_os_log)logger;
- (OpaqueAudioFileID)audioFile;
- (id)audioInputBlock;
- (id)deviceUUID;
- (unint64_t)totalAudioPacketCount;
- (unsigned)readAudioPacketCount;
- (void)_readAudioBufferAndFeed;
- (void)_startAudioFeedingTimer;
- (void)injectAudioWithURL:(id)a3;
- (void)invalidate;
- (void)setAudioFeedTimer:(id)a3;
- (void)setAudioFile:(OpaqueAudioFileID *)a3;
- (void)setAudioInputBlock:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setFormat:(id)a3;
- (void)setIsRecording:(BOOL)a3;
- (void)setLogger:(id)a3;
- (void)setPlugin:(id)a3;
- (void)setQueue:(id)a3;
- (void)setReadAudioPacketCount:(unsigned int)a3;
- (void)setSupportedFormats:(id)a3;
- (void)setTotalAudioPacketCount:(unint64_t)a3;
- (void)speakAudio:(id)a3 playbackStarted:(id)a4 completion:(id)a5;
- (void)startRecordingWithCompletionBlock:(id)a3;
- (void)stopRecordingWithCompletionBlock:(id)a3;
@end

@implementation CSMockRemoteDevice

- (CSMockRemoteDevice)initWithDeviceName:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___CSMockRemoteDevice;
  v6 = -[CSMockRemoteDevice init](&v17, "init");
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("CSMockRemoteDevice", 0LL);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    os_log_t v9 = os_log_create("com.apple.corespeech", "remote_mock_device");
    logger = v6->_logger;
    v6->_logger = v9;

    objc_storeStrong((id *)&v6->_deviceName, a3);
    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uuid = v6->_uuid;
    v6->_uuid = (NSUUID *)v11;
  }

  -[CSMockRemoteDevice setIsRecording:](v6, "setIsRecording:", 0LL);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[CSMockRemoteDevice opusAudioFormat](&OBJC_CLASS___CSMockRemoteDevice, "opusAudioFormat"));
  v18 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));
  -[CSMockRemoteDevice setSupportedFormats:](v6, "setSupportedFormats:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[CSMockRemoteDevice opusAudioFormat](&OBJC_CLASS___CSMockRemoteDevice, "opusAudioFormat"));
  -[CSMockRemoteDevice setFormat:](v6, "setFormat:", v15);

  return v6;
}

- (void)speakAudio:(id)a3 playbackStarted:(id)a4 completion:(id)a5
{
  os_log_t v9 = (void (**)(id, void))a5;
  v8 = (void (**)(id, void))a4;
  -[CSMockRemoteDevice injectAudioWithURL:](self, "injectAudioWithURL:", a3);
  v8[2](v8, 0LL);

  v9[2](v9, 0LL);
}

- (void)injectAudioWithURL:(id)a3
{
  id v4 = a3;
  logger = self->_logger;
  BOOL v6 = os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT);
  if (!v4)
  {
    if (!v6) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    v15 = "URL was nil";
    v16 = logger;
    uint32_t v17 = 2;
LABEL_9:
    _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
    goto LABEL_14;
  }

  if (v6)
  {
    dispatch_queue_t v7 = logger;
    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 path]);
    *(_DWORD *)buf = 138412290;
    unint64_t v25 = (unint64_t)v8;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Trying to open url: %@", buf, 0xCu);
  }

  OSStatus v9 = AudioFileOpenURL((CFURLRef)v4, kAudioFileReadPermission, 0, &self->_audioFile);
  if (v9)
  {
    OSStatus v10 = v9;
    uint64_t v11 = self->_logger;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue([v4 path]);
      *(_DWORD *)buf = 138412546;
      unint64_t v25 = (unint64_t)v13;
      __int16 v26 = 1024;
      OSStatus v27 = v10;
      v14 = "Error opening file : %@ : %d";
LABEL_13:
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, v14, buf, 0x12u);

      goto LABEL_14;
    }

    goto LABEL_14;
  }

  UInt32 ioDataSize = 8;
  p_totalAudioPacketCount = &self->_totalAudioPacketCount;
  OSStatus Property = AudioFileGetProperty(self->_audioFile, 0x70636E74u, &ioDataSize, &self->_totalAudioPacketCount);
  v20 = self->_logger;
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
  if (!Property)
  {
    if (!v21) {
      goto LABEL_14;
    }
    unint64_t v22 = *p_totalAudioPacketCount;
    *(_DWORD *)buf = 134217984;
    unint64_t v25 = v22;
    v15 = "total packet count : %llu";
    v16 = v20;
    uint32_t v17 = 12;
    goto LABEL_9;
  }

  if (v21)
  {
    v12 = v20;
    v13 = (void *)objc_claimAutoreleasedReturnValue([v4 path]);
    *(_DWORD *)buf = 138412546;
    unint64_t v25 = (unint64_t)v13;
    __int16 v26 = 1024;
    OSStatus v27 = Property;
    v14 = "Error getting packet count for file : %@ : %d";
    goto LABEL_13;
  }

- (NSString)deviceName
{
  return self->_deviceName;
}

- (id)deviceUUID
{
  return self->_uuid;
}

- (NSString)deviceIdentifier
{
  return self->_deviceName;
}

- (void)startRecordingWithCompletionBlock:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_578C;
  v7[3] = &unk_8470;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (void)_startAudioFeedingTimer
{
  v3 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_queue);
  audioFeedTimer = self->_audioFeedTimer;
  self->_audioFeedTimer = v3;

  dispatch_source_set_timer((dispatch_source_t)self->_audioFeedTimer, 0LL, 0x26259FFuLL, 0x5F5E100uLL);
  -[CSMockRemoteDevice setIsRecording:](self, "setIsRecording:", 1LL);
  self->_readAudioPacketCount = 0;
  objc_initWeak(&location, self);
  id v5 = self->_audioFeedTimer;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_5760;
  v6[3] = &unk_8498;
  objc_copyWeak(&v7, &location);
  dispatch_source_set_event_handler((dispatch_source_t)v5, v6);
  dispatch_resume((dispatch_object_t)self->_audioFeedTimer);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)stopRecordingWithCompletionBlock:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_5714;
  v7[3] = &unk_8470;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (void)_readAudioBufferAndFeed
{
  UInt32 ioNumBytes = 100;
  UInt32 ioNumPackets = 1;
  AudioFileReadPacketData( self->_audioFile,  1u,  &ioNumBytes,  &outPacketDescriptions,  self->_readAudioPacketCount,  &ioNumPackets,  outBuffer);
  unint64_t v3 = self->_readAudioPacketCount + ioNumPackets;
  if (self->_totalAudioPacketCount <= v3) {
    LODWORD(v3) = 0;
  }
  self->_readAudioPacketCount = v3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSMockRemoteDevice audioInputBlock](self, "audioInputBlock"));
  if (v4)
  {
    BOOL isRecording = self->_isRecording;

    if (isRecording)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  outBuffer,  ioNumBytes));
      uint64_t v7 = ioNumBytes;
      id v8 = objc_alloc(&OBJC_CLASS___AVAudioCompressedBuffer);
      OSStatus v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSMockRemoteDevice format](self, "format"));
      OSStatus v10 = -[AVAudioCompressedBuffer initWithFormat:packetCapacity:maximumPacketSize:]( v8,  "initWithFormat:packetCapacity:maximumPacketSize:",  v9,  1LL,  94LL);

      objc_msgSend(v6, "getBytes:range:", -[AVAudioCompressedBuffer data](v10, "data"), 0, (int)v7);
      uint64_t v11 = -[AVAudioCompressedBuffer packetDescriptions](v10, "packetDescriptions");
      *uint64_t v11 = outPacketDescriptions;
      -[AVAudioCompressedBuffer setPacketCount:](v10, "setPacketCount:", ioNumPackets);
      -[AVAudioCompressedBuffer setByteLength:](v10, "setByteLength:", v7);
      uint64_t v18 = AVAudioRemoteInputBufferGainKey;
      v19 = &off_8538;
      v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));
      v13 = -[AVAudioTime initWithHostTime:]( objc_alloc(&OBJC_CLASS___AVAudioTime),  "initWithHostTime:",  mach_absolute_time());
      v14 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue( -[CSMockRemoteDevice audioInputBlock]( self,  "audioInputBlock"));
      ((void (**)(void, AVAudioCompressedBuffer *, AVAudioTime *, void *))v14)[2](v14, v10, v13, v12);
    }
  }

- (void)invalidate
{
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_0, logger, OS_LOG_TYPE_DEFAULT, "Invalidate MockRemoteDevice", v5, 2u);
  }

  audioFile = self->_audioFile;
  if (audioFile) {
    AudioFileClose(audioFile);
  }
  -[CSMockRemoteDevice setPlugin:](self, "setPlugin:", 0LL);
}

- (id)audioInputBlock
{
  return self->audioInputBlock;
}

- (void)setAudioInputBlock:(id)a3
{
}

- (NSArray)supportedFormats
{
  return self->supportedFormats;
}

- (void)setSupportedFormats:(id)a3
{
}

- (AVAudioFormat)format
{
  return self->format;
}

- (void)setFormat:(id)a3
{
}

- (CSMockRemotePlugin)plugin
{
  return (CSMockRemotePlugin *)objc_loadWeakRetained((id *)&self->_plugin);
}

- (void)setPlugin:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_os_log)logger
{
  return self->_logger;
}

- (void)setLogger:(id)a3
{
}

- (OpaqueAudioFileID)audioFile
{
  return self->_audioFile;
}

- (void)setAudioFile:(OpaqueAudioFileID *)a3
{
  self->_audioFile = a3;
}

- (unint64_t)totalAudioPacketCount
{
  return self->_totalAudioPacketCount;
}

- (void)setTotalAudioPacketCount:(unint64_t)a3
{
  self->_totalAudioPacketCount = a3;
}

- (unsigned)readAudioPacketCount
{
  return self->_readAudioPacketCount;
}

- (void)setReadAudioPacketCount:(unsigned int)a3
{
  self->_readAudioPacketCount = a3;
}

- (BOOL)isRecording
{
  return self->_isRecording;
}

- (void)setIsRecording:(BOOL)a3
{
  self->_BOOL isRecording = a3;
}

- (OS_dispatch_source)audioFeedTimer
{
  return self->_audioFeedTimer;
}

- (void)setAudioFeedTimer:(id)a3
{
}

- (void)setDeviceName:(id)a3
{
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void).cxx_destruct
{
}

+ (id)opusAudioFormat
{
  return  -[AVAudioFormat initWithStreamDescription:]( objc_alloc(&OBJC_CLASS___AVAudioFormat),  "initWithStreamDescription:",  &unk_D288);
}

@end