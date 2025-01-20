@interface HomeKitSiriRemoteInputDevice
- (AVAudioFormat)format;
- (HomeKitSiriRemoteInputDevice)initWithInfo:(id)a3;
- (HomeKitSiriRemoteInputPlugin)plugin;
- (NSArray)supportedFormats;
- (NSNumber)deviceType;
- (NSString)codec;
- (NSString)deviceIdentifier;
- (id)_audioBufferForFrame:(id)a3;
- (id)_supportedFormats;
- (id)audioInputBlock;
- (id)startCompletionBlock;
- (id)statusChangeBlock;
- (id)stopCompletionBlock;
- (unsigned)deviceCategory;
- (void)handleAudioFrameWithArgs:(id)a3;
- (void)handleTransportDidStartWithArgs:(id)a3;
- (void)handleTransportDidStopWithArgs:(id)a3;
- (void)invalidate;
- (void)setAudioInputBlock:(id)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setDeviceType:(id)a3;
- (void)setFormat:(id)a3;
- (void)setPlugin:(id)a3;
- (void)setStartCompletionBlock:(id)a3;
- (void)setStatusChangeBlock:(id)a3;
- (void)setStopCompletionBlock:(id)a3;
- (void)setSupportedFormats:(id)a3;
- (void)startRecordingWithCompletionBlock:(id)a3;
- (void)stopRecordingWithCompletionBlock:(id)a3;
@end

@implementation HomeKitSiriRemoteInputDevice

- (HomeKitSiriRemoteInputDevice)initWithInfo:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___HomeKitSiriRemoteInputDevice;
  v5 = -[HomeKitSiriRemoteInputDevice init](&v19, "init");
  v6 = v5;
  if (v5)
  {
    codec = v5->_codec;
    v5->_codec = (NSString *)@"opus";

    uint64_t v8 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"kMsgArgIdentifier"]);
    deviceIdentifier = v6->_deviceIdentifier;
    v6->_deviceIdentifier = (NSString *)v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"kDeviceType"]);
    deviceType = v6->_deviceType;
    v6->_deviceType = (NSNumber *)v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[HomeKitSiriRemoteInputDevice _supportedFormats](v6, "_supportedFormats"));
    -[HomeKitSiriRemoteInputDevice setSupportedFormats:](v6, "setSupportedFormats:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HomeKitSiriRemoteInputDevice supportedFormats](v6, "supportedFormats"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectAtIndexedSubscript:0]);
    -[HomeKitSiriRemoteInputDevice setFormat:](v6, "setFormat:", v14);

    v15 = (os_log_s *)qword_CFB0;
    if (os_log_type_enabled((os_log_t)qword_CFB0, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v6->_deviceIdentifier;
      format = v6->format;
      *(_DWORD *)buf = 138412546;
      v21 = v16;
      __int16 v22 = 2112;
      v23 = format;
      _os_log_impl( &dword_0,  v15,  OS_LOG_TYPE_DEFAULT,  "Initialized HomeKit Plugin Device with identifier %@ and format %@",  buf,  0x16u);
    }
  }

  return v6;
}

- (unsigned)deviceCategory
{
  unsigned int v3 = 1919513718;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[HomeKitSiriRemoteInputDevice deviceType](self, "deviceType"));
  unsigned int v5 = [v4 intValue];

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HomeKitSiriRemoteInputDevice deviceType](self, "deviceType"));
    unsigned int v7 = [v6 intValue];

    if (v7 == 1)
    {
      return 1920101746;
    }

    else
    {
      uint64_t v8 = (void *)qword_CFB0;
      if (os_log_type_enabled((os_log_t)qword_CFB0, OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = v8;
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[HomeKitSiriRemoteInputDevice deviceType](self, "deviceType"));
        int v12 = 138412290;
        v13 = v11;
        _os_log_error_impl( &dword_0,  v10,  OS_LOG_TYPE_ERROR,  "HomeKit Plugin has unexpected device type %@.",  (uint8_t *)&v12,  0xCu);
      }
    }
  }

  return v3;
}

- (void)startRecordingWithCompletionBlock:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[HomeKitSiriRemoteInputDevice plugin](self, "plugin"));
  unsigned int v7 = @"kMsgArgIdentifier";
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[HomeKitSiriRemoteInputDevice deviceIdentifier](self, "deviceIdentifier"));
  uint64_t v8 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));
  [v4 sendMessage:@"StartStream" args:v6];
}

- (void)stopRecordingWithCompletionBlock:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[HomeKitSiriRemoteInputDevice plugin](self, "plugin"));
  unsigned int v7 = @"kMsgArgIdentifier";
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[HomeKitSiriRemoteInputDevice deviceIdentifier](self, "deviceIdentifier"));
  uint64_t v8 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));
  [v4 sendMessage:@"StopStream" args:v6];
}

- (void)handleTransportDidStartWithArgs:(id)a3
{
  id v14 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[HomeKitSiriRemoteInputDevice startCompletionBlock](self, "startCompletionBlock"));

  unsigned int v5 = v14;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"kMsgArgError"]);
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSData);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0) {
      uint64_t v8 = v6;
    }
    else {
      uint64_t v8 = 0LL;
    }
    id v9 = v8;

    if (v9)
    {
      uint64_t v10 = -[NSKeyedUnarchiver initForReadingFromData:error:]( objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver),  "initForReadingFromData:error:",  v9,  0LL);
      id v11 = -[NSKeyedUnarchiver decodeObjectOfClass:forKey:]( v10,  "decodeObjectOfClass:forKey:",  objc_opt_class(&OBJC_CLASS___NSError),  @"kMsgArgError");
      int v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    }

    else
    {
      int v12 = 0LL;
    }

    v13 = (void (**)(void, void))objc_claimAutoreleasedReturnValue( -[HomeKitSiriRemoteInputDevice startCompletionBlock]( self,  "startCompletionBlock"));
    ((void (**)(void, void *))v13)[2](v13, v12);

    -[HomeKitSiriRemoteInputDevice setStartCompletionBlock:](self, "setStartCompletionBlock:", 0LL);
    unsigned int v5 = v14;
  }
}

- (void)handleTransportDidStopWithArgs:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[HomeKitSiriRemoteInputDevice stopCompletionBlock](self, "stopCompletionBlock"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"kMsgArgError"]);
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSData);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0) {
      uint64_t v8 = v6;
    }
    else {
      uint64_t v8 = 0LL;
    }
    id v9 = v8;

    if (v9)
    {
      uint64_t v10 = -[NSKeyedUnarchiver initForReadingFromData:error:]( objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver),  "initForReadingFromData:error:",  v9,  0LL);
      id v11 = -[NSKeyedUnarchiver decodeObjectOfClass:forKey:]( v10,  "decodeObjectOfClass:forKey:",  objc_opt_class(&OBJC_CLASS___NSError),  @"kMsgArgError");
      int v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    }

    else
    {
      int v12 = 0LL;
    }

    v16 = (void (**)(void, void))objc_claimAutoreleasedReturnValue( -[HomeKitSiriRemoteInputDevice stopCompletionBlock]( self,  "stopCompletionBlock"));
    ((void (**)(void, void *))v16)[2](v16, v12);

    -[HomeKitSiriRemoteInputDevice setStopCompletionBlock:](self, "setStopCompletionBlock:", 0LL);
  }

  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HomeKitSiriRemoteInputDevice statusChangeBlock](self, "statusChangeBlock"));

    if (v13)
    {
      id v14 = (void *)qword_CFB0;
      if (os_log_type_enabled((os_log_t)qword_CFB0, OS_LOG_TYPE_ERROR))
      {
        v17 = v14;
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[HomeKitSiriRemoteInputDevice deviceIdentifier](self, "deviceIdentifier"));
        int v19 = 138412290;
        v20 = v18;
        _os_log_error_impl( &dword_0,  v17,  OS_LOG_TYPE_ERROR,  "Transport stopped for %@ without being requested - reporting the state change.",  (uint8_t *)&v19,  0xCu);
      }

      v15 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue( -[HomeKitSiriRemoteInputDevice statusChangeBlock]( self,  "statusChangeBlock"));
      v15[2](v15, 1919115630LL, 0LL);
    }
  }
}

- (void)handleAudioFrameWithArgs:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[HomeKitSiriRemoteInputDevice audioInputBlock](self, "audioInputBlock"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"kMsgArgData"]);
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSData);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0) {
      uint64_t v8 = v6;
    }
    else {
      uint64_t v8 = 0LL;
    }
    id v9 = v8;

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"kSeqNum"]);
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0) {
      int v12 = v10;
    }
    else {
      int v12 = 0LL;
    }
    id v13 = v12;

    id v14 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"kGain"]);
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0) {
      v16 = v14;
    }
    else {
      v16 = 0LL;
    }
    id v17 = v16;

    if (v9 && v13 && v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[HomeKitSiriRemoteInputDevice _audioBufferForFrame:](self, "_audioBufferForFrame:", v9));
      int v19 = -[AVAudioTime initWithSampleTime:atRate:]( [AVAudioTime alloc],  "initWithSampleTime:atRate:",  [v13 integerValue],  1.0);
      v20 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      -[NSMutableDictionary setObject:forKey:](v20, "setObject:forKey:", v17, AVAudioRemoteInputBufferGainKey);
      v21 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue( -[HomeKitSiriRemoteInputDevice audioInputBlock]( self,  "audioInputBlock"));
      ((void (**)(void, void *, AVAudioTime *, NSMutableDictionary *))v21)[2](v21, v18, v19, v20);
    }

    else
    {
      __int16 v22 = (os_log_s *)qword_CFB0;
      if (os_log_type_enabled((os_log_t)qword_CFB0, OS_LOG_TYPE_ERROR))
      {
        v23[0] = 67109632;
        v23[1] = v9 != 0LL;
        __int16 v24 = 1024;
        BOOL v25 = v13 != 0LL;
        __int16 v26 = 1024;
        BOOL v27 = v17 != 0LL;
        _os_log_error_impl( &dword_0,  v22,  OS_LOG_TYPE_ERROR,  "HomeKit Plugin received frames missing expected keys (frame=%d/seqNum=%d/gain=%d).",  (uint8_t *)v23,  0x14u);
      }
    }
  }
}

- (void)invalidate
{
}

- (id)_supportedFormats
{
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  uint64_t v6 = 0x40CF400000000000LL;
  LODWORD(v7) = 1869641075;
  DWORD1(v8) = 1;
  v2 = -[AVAudioFormat initWithStreamDescription:]( objc_alloc(&OBJC_CLASS___AVAudioFormat),  "initWithStreamDescription:",  &v6);
  if (!v2) {
    __assert_rtn( "-[HomeKitSiriRemoteInputDevice _supportedFormats]",  "HomeKitSiriRemoteInputDevice.m",  164,  "defaultFormat");
  }
  unsigned int v3 = v2;
  id v9 = v2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));

  return v4;
}

- (id)_audioBufferForFrame:(id)a3
{
  id v4 = a3;
  unsigned int v5 = objc_alloc(&OBJC_CLASS___AVAudioCompressedBuffer);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[HomeKitSiriRemoteInputDevice format](self, "format"));
  __int128 v7 = -[AVAudioCompressedBuffer initWithFormat:packetCapacity:maximumPacketSize:]( v5,  "initWithFormat:packetCapacity:maximumPacketSize:",  v6,  1LL,  94LL);

  unsigned int v8 = [v4 length];
  if (v8 >= 0x5FuLL)
  {
    id v9 = (void *)qword_CFB0;
    unsigned int v8 = 0;
    if (os_log_type_enabled((os_log_t)qword_CFB0, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = v9;
      v13[0] = 67109376;
      v13[1] = [v4 length];
      __int16 v14 = 1024;
      int v15 = 94;
      _os_log_impl( &dword_0,  v10,  OS_LOG_TYPE_DEFAULT,  "HomeKit Plugin received %u bytes but had max of %u; truncating to zero bytes.",
        (uint8_t *)v13,
        0xEu);

      unsigned int v8 = 0;
    }
  }

  objc_msgSend(v4, "getBytes:length:", -[AVAudioCompressedBuffer data](v7, "data"), objc_msgSend(v4, "length"));
  uint64_t v11 = -[AVAudioCompressedBuffer packetDescriptions](v7, "packetDescriptions");
  v11->mStartOffset = 0LL;
  v11->mVariableFramesInPacket = 0;
  v11->mDataByteSize = v8;
  -[AVAudioCompressedBuffer setPacketCount:](v7, "setPacketCount:", 1LL);

  return v7;
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

- (HomeKitSiriRemoteInputPlugin)plugin
{
  return (HomeKitSiriRemoteInputPlugin *)objc_loadWeakRetained((id *)&self->_plugin);
}

- (void)setPlugin:(id)a3
{
}

- (NSString)codec
{
  return self->_codec;
}

- (id)statusChangeBlock
{
  return self->_statusChangeBlock;
}

- (void)setStatusChangeBlock:(id)a3
{
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
}

- (NSNumber)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(id)a3
{
}

- (id)startCompletionBlock
{
  return self->_startCompletionBlock;
}

- (void)setStartCompletionBlock:(id)a3
{
}

- (id)stopCompletionBlock
{
  return self->_stopCompletionBlock;
}

- (void)setStopCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end