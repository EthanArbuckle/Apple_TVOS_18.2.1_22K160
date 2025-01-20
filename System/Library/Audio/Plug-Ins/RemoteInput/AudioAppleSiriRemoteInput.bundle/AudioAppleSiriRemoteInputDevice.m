@interface AudioAppleSiriRemoteInputDevice
- (AVAudioFormat)format;
- (AudioAppleSiriRemoteInputDevice)initWithInfo:(id)a3;
- (AudioAppleSiriRemoteInputPlugin)plugin;
- (NSArray)supportedFormats;
- (NSString)codec;
- (NSString)deviceIdentifier;
- (NSString)identifier;
- (NSString)remoteInputDeviceName;
- (NSString)resolvedDeviceIdentifier;
- (__CFDictionary)getMatchingDict:(int64_t)a3;
- (id)_audioBufferForFrame:(id)a3;
- (id)_audioTimeForFrame:(id)a3;
- (id)_gainForDoapFrame:(id)a3;
- (id)_gainForFrame:(id)a3;
- (id)_gainForTVRemoteFrame:(id)a3;
- (id)_qualityForSpeexFrame:(id)a3;
- (id)_supportedFormats;
- (id)audioInputBlock;
- (id)startCompletionBlock;
- (id)statusChangeBlock;
- (id)stopCompletionBlock;
- (int)frameLength;
- (int)frameLengthOffset;
- (int)rmsOffset;
- (int)timeOffset;
- (int64_t)deviceType;
- (unsigned)deviceCategory;
- (unsigned)doapCodecType;
- (unsigned)pidNum;
- (void)_processAudioFrame:(id)a3;
- (void)handleAudioFrameMsg:(id)a3;
- (void)handleStreamDidCancelMsg:(id)a3;
- (void)handleTransportDidStartMsg:(id)a3;
- (void)handleTransportDidStopMsg:(id)a3;
- (void)invalidate;
- (void)setAudioInputBlock:(id)a3;
- (void)setDeviceType:(int64_t)a3;
- (void)setDoapCodecType:(unsigned __int8)a3;
- (void)setFormat:(id)a3;
- (void)setFrameLength:(int)a3;
- (void)setFrameLengthOffset:(int)a3;
- (void)setPidNum:(unsigned __int16)a3;
- (void)setPlugin:(id)a3;
- (void)setResolvedDeviceIdentifier:(id)a3;
- (void)setRmsOffset:(int)a3;
- (void)setStartCompletionBlock:(id)a3;
- (void)setStatusChangeBlock:(id)a3;
- (void)setStopCompletionBlock:(id)a3;
- (void)setSupportedFormats:(id)a3;
- (void)setTimeOffset:(int)a3;
- (void)startRecordingWithCompletionBlock:(id)a3;
- (void)stopRecordingWithCompletionBlock:(id)a3;
@end

@implementation AudioAppleSiriRemoteInputDevice

- (AudioAppleSiriRemoteInputDevice)initWithInfo:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)&OBJC_CLASS___AudioAppleSiriRemoteInputDevice;
  v5 = -[AudioAppleSiriRemoteInputDevice init](&v35, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"kMsgDeviceType"]);
    v5->_int64_t deviceType = (int64_t)[v6 integerValue];

    uint64_t v7 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"kMsgArgIdentifier"]);
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    switch(v5->_deviceType)
    {
      case 1LL:
        v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"kMsgPidNum"]);
        v5->_int pidNum = (unsigned __int16)[v9 unsignedShortValue];

        int pidNum = v5->_pidNum;
        if (pidNum == 614)
        {
          codec = v5->_codec;
          int v12 = 76;
          int v13 = 74;
          v5->_codec = (NSString *)@"speex";
          int v14 = 70;
          uint64_t v15 = 3LL;
          uint64_t v16 = 20LL;
          uint64_t v17 = 12LL;
          goto LABEL_15;
        }

        v33 = v5->_codec;
        v5->_codec = (NSString *)@"unknown";

        if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_ERROR)) {
          sub_5058();
        }
        goto LABEL_24;
      case 2LL:
LABEL_7:
        int v14 = 0;
        codec = v5->_codec;
        int v12 = 4;
        v5->_codec = (NSString *)@"opus";
        goto LABEL_14;
      case 3LL:
        v18 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"kMsgCodecType"]);
        v5->_doapCodecType = [v18 unsignedShortValue];

        codec = v5->_codec;
        if (v5->_doapCodecType == 7) {
          goto LABEL_13;
        }
        v5->_codec = (NSString *)@"unknown";

        if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_ERROR)) {
          goto LABEL_10;
        }
        goto LABEL_24;
      case 4LL:
        v19 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"kMsgCodecType"]);
        v5->_doapCodecType = [v19 unsignedShortValue];

        codec = v5->_codec;
        if (v5->_doapCodecType == 7)
        {
LABEL_13:
          int v14 = 0;
          v5->_codec = (NSString *)@"opus";
          int v12 = 4;
LABEL_14:
          int v13 = 2;
          uint64_t v15 = 2LL;
          uint64_t v16 = 24LL;
          uint64_t v17 = 20LL;
LABEL_15:

          *(_DWORD *)((char *)&v5->super.isa + v17) = v14;
          *(_DWORD *)((char *)&v5->super.isa + v16) = v13;
          LODWORD((&v5->super.isa)[v15]) = v12;
          uint64_t v20 = objc_claimAutoreleasedReturnValue(-[AudioAppleSiriRemoteInputDevice _supportedFormats](v5, "_supportedFormats"));
          supportedFormats = v5->supportedFormats;
          v5->supportedFormats = (NSArray *)v20;

          v22 = (void *)objc_claimAutoreleasedReturnValue(-[AudioAppleSiriRemoteInputDevice supportedFormats](v5, "supportedFormats"));
          uint64_t v23 = objc_claimAutoreleasedReturnValue([v22 objectAtIndexedSubscript:0]);
          format = v5->format;
          v5->format = (AVAudioFormat *)v23;

          v25 = (void *)qword_D420;
          if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_DEFAULT))
          {
            int64_t deviceType = v5->_deviceType;
            v28 = v5->_identifier;
            v27 = v5->_codec;
            v29 = v25;
            v30 = (void *)objc_claimAutoreleasedReturnValue([v4 description]);
            *(_DWORD *)buf = 134218754;
            int64_t v37 = deviceType;
            __int16 v38 = 2112;
            v39 = v27;
            __int16 v40 = 2112;
            v41 = v28;
            __int16 v42 = 2112;
            v43 = v30;
            _os_log_impl( &dword_0,  v29,  OS_LOG_TYPE_DEFAULT,  "Initialized AudioAppleSiriRemoteInputDevice type %lu, %@ codec with identifier %@, info %@",  buf,  0x2Au);
          }

          goto LABEL_17;
        }

        v5->_codec = (NSString *)@"unknown";

        if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_ERROR)) {
LABEL_10:
        }
          sub_50BC();
LABEL_24:
        v31 = 0LL;
        break;
      default:
        v32 = (void *)qword_D420;
        if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_ERROR)) {
          sub_4FD8(v32);
        }
        goto LABEL_24;
    }
  }

  else
  {
LABEL_17:
    v31 = v5;
  }

  return v31;
}

- (__CFDictionary)getMatchingDict:(int64_t)a3
{
  if (a3 == 1)
  {
    id v4 = IOServiceMatching("IOHIDEventDriver");
    CFDictionarySetValue(v4, @"DeviceUsagePage", &off_8558);
    CFDictionarySetValue(v4, @"DeviceUsage", &off_8570);
  }

  else if (a3)
  {
    if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_ERROR)) {
      sub_5120();
    }
    return 0LL;
  }

  else
  {
    id v4 = IOServiceMatching("AppleEmbeddedBluetoothButtons");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AudioAppleSiriRemoteInputDevice identifier](self, "identifier"));
    CFDictionarySetValue(v4, @"PhysicalDeviceUniqueID", v5);
  }

  return v4;
}

- (NSString)deviceIdentifier
{
  if ((char *)-[AudioAppleSiriRemoteInputDevice deviceType](self, "deviceType") - 1 >= (_BYTE *)&dword_0 + 2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[AudioAppleSiriRemoteInputDevice identifier](self, "identifier"));
    return (NSString *)v3;
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[AudioAppleSiriRemoteInputDevice resolvedDeviceIdentifier](self, "resolvedDeviceIdentifier"));

  if (v4) {
    goto LABEL_13;
  }
  uint64_t v5 = 0LL;
  char v6 = 1;
  while (1)
  {
    char v7 = v6;
    io_service_t MatchingService = IOServiceGetMatchingService( kIOMainPortDefault,  -[AudioAppleSiriRemoteInputDevice getMatchingDict:](self, "getMatchingDict:", v5));
    if (MatchingService) {
      break;
    }
LABEL_8:
    char v6 = 0;
    uint64_t v5 = 1LL;
    if ((v7 & 1) == 0) {
      goto LABEL_13;
    }
  }

  io_object_t v9 = MatchingService;
  uint64_t entryID = 0LL;
  if (IORegistryEntryGetRegistryEntryID(MatchingService, &entryID))
  {
    IOObjectRelease(v9);
    goto LABEL_8;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  entryID));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 stringValue]);
  -[AudioAppleSiriRemoteInputDevice setResolvedDeviceIdentifier:](self, "setResolvedDeviceIdentifier:", v11);

  int v12 = (void *)qword_D420;
  if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = v12;
    int v14 = (void *)objc_claimAutoreleasedReturnValue(-[AudioAppleSiriRemoteInputDevice identifier](self, "identifier"));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[AudioAppleSiriRemoteInputDevice resolvedDeviceIdentifier](self, "resolvedDeviceIdentifier"));
    *(_DWORD *)buf = 138412546;
    v21 = v14;
    __int16 v22 = 2112;
    uint64_t v23 = v15;
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Device with identifier %@ resolved to %@", buf, 0x16u);
  }

  IOObjectRelease(v9);
LABEL_13:
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[AudioAppleSiriRemoteInputDevice resolvedDeviceIdentifier](self, "resolvedDeviceIdentifier"));

  if (!v16)
  {
    uint64_t v17 = (void *)qword_D420;
    if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_ERROR)) {
      sub_518C(v17);
    }
  }

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AudioAppleSiriRemoteInputDevice resolvedDeviceIdentifier](self, "resolvedDeviceIdentifier"));
  return (NSString *)v3;
}

- (unsigned)deviceCategory
{
  else {
    return 1919510644;
  }
}

- (NSString)remoteInputDeviceName
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%d",  -[AudioAppleSiriRemoteInputDevice pidNum](self, "pidNum"));
}

- (void)startRecordingWithCompletionBlock:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[AudioAppleSiriRemoteInputDevice plugin](self, "plugin"));
  char v7 = @"kMsgArgIdentifier";
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[AudioAppleSiriRemoteInputDevice identifier](self, "identifier"));
  v8 = v5;
  char v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));
  [v4 sendMsg:@"StartStream" args:v6];
}

- (void)stopRecordingWithCompletionBlock:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[AudioAppleSiriRemoteInputDevice plugin](self, "plugin"));
  char v7 = @"kMsgArgIdentifier";
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[AudioAppleSiriRemoteInputDevice identifier](self, "identifier"));
  v8 = v5;
  char v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));
  [v4 sendMsg:@"StopStream" args:v6];
}

- (void)handleTransportDidStartMsg:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[AudioAppleSiriRemoteInputDevice startCompletionBlock](self, "startCompletionBlock"));

  if (v5)
  {
    char v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"kMsgArgError"]);
    if (v6)
    {
      char v7 = -[NSKeyedUnarchiver initForReadingFromData:error:]( objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver),  "initForReadingFromData:error:",  v6,  0LL);
      id v8 = -[NSKeyedUnarchiver decodeObjectOfClass:forKey:]( v7,  "decodeObjectOfClass:forKey:",  objc_opt_class(&OBJC_CLASS___NSError),  @"kMsgArgError");
      io_object_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    }

    else
    {
      io_object_t v9 = 0LL;
    }

    v11 = (void (**)(void, void))objc_claimAutoreleasedReturnValue( -[AudioAppleSiriRemoteInputDevice startCompletionBlock]( self,  "startCompletionBlock"));
    ((void (**)(void, void *))v11)[2](v11, v9);

    int v12 = (os_log_s *)qword_D420;
    if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      int v14 = v9;
      _os_log_impl( &dword_0,  v12,  OS_LOG_TYPE_DEFAULT,  "startCompletionBlock is successfully invoked with error %@",  (uint8_t *)&v13,  0xCu);
    }

    -[AudioAppleSiriRemoteInputDevice setStartCompletionBlock:](self, "setStartCompletionBlock:", 0LL);
  }

  else
  {
    v10 = (os_log_s *)qword_D420;
    if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "startCompletionBlock is nil", (uint8_t *)&v13, 2u);
    }
  }
}

- (void)handleTransportDidStopMsg:(id)a3
{
  id v10 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[AudioAppleSiriRemoteInputDevice stopCompletionBlock](self, "stopCompletionBlock"));

  if (v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"kMsgArgError"]);
    if (v5)
    {
      char v6 = -[NSKeyedUnarchiver initForReadingFromData:error:]( objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver),  "initForReadingFromData:error:",  v5,  0LL);
      id v7 = -[NSKeyedUnarchiver decodeObjectOfClass:forKey:]( v6,  "decodeObjectOfClass:forKey:",  objc_opt_class(&OBJC_CLASS___NSError),  @"kMsgArgError");
      id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    }

    else
    {
      id v8 = 0LL;
    }

    io_object_t v9 = (void (**)(void, void))objc_claimAutoreleasedReturnValue( -[AudioAppleSiriRemoteInputDevice stopCompletionBlock]( self,  "stopCompletionBlock"));
    ((void (**)(void, void *))v9)[2](v9, v8);

    -[AudioAppleSiriRemoteInputDevice setStopCompletionBlock:](self, "setStopCompletionBlock:", 0LL);
  }

  -[AudioAppleSiriRemoteInputDevice setStatusChangeBlock:](self, "setStatusChangeBlock:", 0LL);
}

- (void)handleAudioFrameMsg:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"kMsgArgData"]);
  -[AudioAppleSiriRemoteInputDevice _processAudioFrame:](self, "_processAudioFrame:", v4);
}

- (void)handleStreamDidCancelMsg:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[AudioAppleSiriRemoteInputDevice statusChangeBlock](self, "statusChangeBlock", a3));

  if (v4)
  {
    uint64_t v5 = (os_log_s *)qword_D420;
    if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "handle stream Cancel message", v7, 2u);
    }

    char v6 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue( -[AudioAppleSiriRemoteInputDevice statusChangeBlock]( self,  "statusChangeBlock"));
    v6[2](v6, 1919115630LL, 0LL);

    -[AudioAppleSiriRemoteInputDevice setStatusChangeBlock:](self, "setStatusChangeBlock:", 0LL);
  }

- (void)invalidate
{
}

- (id)_supportedFormats
{
  __int128 v14 = 0u;
  LODWORD(v14) = 1936745848;
  DWORD2(v14) = 70;
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[AudioAppleSiriRemoteInputDevice codec]( self,  "codec",  0x40CF400000000000LL,  1869641075LL,  0LL,  0x100000000LL,  0LL,  0x40CF400000000000LL,  v14,  0x100000000LL,  0LL));
  unsigned __int8 v4 = [v3 isEqualToString:@"opus"];

  if ((v4 & 1) != 0)
  {
    uint64_t v5 = &v12;
  }

  else
  {
    char v6 = (void *)objc_claimAutoreleasedReturnValue(-[AudioAppleSiriRemoteInputDevice codec](self, "codec"));
    unsigned __int8 v7 = [v6 isEqualToString:@"speex"];

    if ((v7 & 1) != 0)
    {
      uint64_t v5 = &v13;
    }

    else
    {
      id v8 = (void *)qword_D420;
      if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_ERROR)) {
        sub_520C(v8);
      }
      uint64_t v5 = 0LL;
    }
  }

  io_object_t v9 = -[AVAudioFormat initWithStreamDescription:]( objc_alloc(&OBJC_CLASS___AVAudioFormat),  "initWithStreamDescription:",  v5);
  uint64_t v15 = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));

  return v10;
}

- (void)_processAudioFrame:(id)a3
{
  id v4 = a3;
  if (-[AudioAppleSiriRemoteInputDevice pidNum](self, "pidNum") == 621)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[AudioAppleSiriRemoteInputDevice _audioBufferForFrame:](self, "_audioBufferForFrame:", v4));
    char v6 = (void *)objc_claimAutoreleasedReturnValue(-[AudioAppleSiriRemoteInputDevice _audioTimeForFrame:](self, "_audioTimeForFrame:", v4));
    unsigned __int8 v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[AudioAppleSiriRemoteInputDevice _gainForFrame:](self, "_gainForFrame:", v4));
    -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v8, AVAudioRemoteInputBufferGainKey);

    io_object_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[AudioAppleSiriRemoteInputDevice codec](self, "codec"));
    unsigned int v10 = [v9 isEqualToString:@"speex"];

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[AudioAppleSiriRemoteInputDevice _qualityForSpeexFrame:](self, "_qualityForSpeexFrame:", v4));
      -[NSMutableDictionary setObject:forKey:]( v7,  "setObject:forKey:",  v11,  AVAudioRemoteInputBufferSpeexFrameQualitiesKey);
    }

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[AudioAppleSiriRemoteInputDevice audioInputBlock](self, "audioInputBlock"));

    if (v12)
    {
      uint64_t v13 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue( -[AudioAppleSiriRemoteInputDevice audioInputBlock]( self,  "audioInputBlock"));
      ((void (**)(void, void *, void *, NSMutableDictionary *))v13)[2](v13, v5, v6, v7);
    }

    goto LABEL_31;
  }

  id v14 = [v4 length];
  uint64_t v16 = (uint64_t)v14;
  uint64_t v40 = 0LL;
  uint64_t v17 = 0LL;
  uint64_t v39 = AVAudioRemoteInputBufferGainKey;
  uint64_t v38 = AVAudioRemoteInputBufferSpeexFrameQualitiesKey;
  *(void *)&__int128 v15 = 134217984LL;
  __int128 v37 = v15;
  while (1)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[AudioAppleSiriRemoteInputDevice codec](self, "codec", v37));
    unsigned __int8 v19 = [v18 isEqualToString:@"speex"];

    if ((v19 & 1) != 0)
    {
      uint64_t v20 = 78LL;
      goto LABEL_15;
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[AudioAppleSiriRemoteInputDevice codec](self, "codec"));
    unsigned int v22 = [v21 isEqualToString:@"opus"];

    uint64_t v20 = v40;
    if (v22) {
      break;
    }
LABEL_15:
    uint64_t v23 = (os_log_s *)qword_D420;
    if (v16 < (unint64_t)(unsigned __int16)v20)
    {
      if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_ERROR)) {
        sub_528C(v20, v16, v23);
      }
      goto LABEL_31;
    }

    if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v43 = v16;
      __int16 v44 = 1024;
      int v45 = (unsigned __int16)v20;
      _os_log_debug_impl(&dword_0, v23, OS_LOG_TYPE_DEBUG, "Received BufferLength %ld, FrameLength %d", buf, 0x12u);
    }

    uint64_t v40 = v20;
    uint64_t v41 = v16;
    uint64_t v24 = (unsigned __int16)v20;
    id v25 = v4;
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subdataWithRange:", v17, (unsigned __int16)v20));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[AudioAppleSiriRemoteInputDevice _audioBufferForFrame:](self, "_audioBufferForFrame:", v26));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[AudioAppleSiriRemoteInputDevice _audioTimeForFrame:](self, "_audioTimeForFrame:", v26));
    v29 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[AudioAppleSiriRemoteInputDevice _gainForFrame:](self, "_gainForFrame:", v26));
    -[NSMutableDictionary setObject:forKey:](v29, "setObject:forKey:", v30, v39);

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[AudioAppleSiriRemoteInputDevice codec](self, "codec"));
    unsigned __int8 v32 = [v31 isEqualToString:@"speex"];

    if ((v32 & 1) != 0)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[AudioAppleSiriRemoteInputDevice _qualityForSpeexFrame:](self, "_qualityForSpeexFrame:", v26));
      -[NSMutableDictionary setObject:forKey:](v29, "setObject:forKey:", v33, v38);
    }

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[AudioAppleSiriRemoteInputDevice audioInputBlock](self, "audioInputBlock"));

    if (v34)
    {
      objc_super v35 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue( -[AudioAppleSiriRemoteInputDevice audioInputBlock]( self,  "audioInputBlock"));
      ((void (**)(void, void *, void *, NSMutableDictionary *))v35)[2](v35, v27, v28, v29);
    }

    id v4 = v25;
    uint64_t v16 = v41 - v24;
    if (v41 - v24 < 0)
    {
      v36 = (os_log_s *)qword_D420;
      if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v37;
        uint64_t v43 = v41 - v24;
        _os_log_error_impl(&dword_0, v36, OS_LOG_TYPE_ERROR, "Buffer length should be negative value %ld", buf, 0xCu);
      }
    }

    v17 += v24;

    if (v16 <= 5) {
      goto LABEL_31;
    }
  }

  buf[0] = 0;
  objc_msgSend(v4, "getBytes:range:", buf, v17 + self->_frameLengthOffset, 1);
  if (buf[0] < 0x5Fu)
  {
    if (!buf[0]) {
      goto LABEL_31;
    }
    uint64_t v20 = buf[0] + 5;
    goto LABEL_15;
  }

  if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_ERROR)) {
    sub_5308();
  }
LABEL_31:
}

- (id)_audioBufferForFrame:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[AudioAppleSiriRemoteInputDevice codec](self, "codec"));
  unsigned int v6 = [v5 isEqualToString:@"opus"];

  if (v6)
  {
    unsigned __int8 v15 = 0;
    objc_msgSend(v4, "getBytes:range:", &v15, self->_frameLengthOffset, 1);
    uint64_t v7 = v15;
    id v8 = objc_alloc(&OBJC_CLASS___AVAudioCompressedBuffer);
    io_object_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[AudioAppleSiriRemoteInputDevice format](self, "format"));
    unsigned int v10 = -[AVAudioCompressedBuffer initWithFormat:packetCapacity:maximumPacketSize:]( v8,  "initWithFormat:packetCapacity:maximumPacketSize:",  v9,  1LL,  94LL);

    objc_msgSend( v4,  "getBytes:range:",  -[AVAudioCompressedBuffer data](v10, "data"),  self->_frameLengthOffset + 1,  v7);
    v11 = -[AVAudioCompressedBuffer packetDescriptions](v10, "packetDescriptions");
    v11->mStartOffset = 0LL;
    v11->mVariableFramesInPacket = 0;
    v11->mDataByteSize = v7;
  }

  else
  {
    uint64_t v12 = objc_alloc(&OBJC_CLASS___AVAudioCompressedBuffer);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[AudioAppleSiriRemoteInputDevice format](self, "format"));
    unsigned int v10 = -[AVAudioCompressedBuffer initWithFormat:packetCapacity:](v12, "initWithFormat:packetCapacity:", v13, 1LL);

    objc_msgSend(v4, "getBytes:length:", -[AVAudioCompressedBuffer data](v10, "data"), self->_frameLength);
  }

  -[AVAudioCompressedBuffer setPacketCount:](v10, "setPacketCount:", 1LL);
  return v10;
}

- (id)_audioTimeForFrame:(id)a3
{
  unsigned __int16 v5 = 0;
  objc_msgSend(a3, "getBytes:range:", &v5, self->_timeOffset, 2);
  v3 = objc_alloc(&OBJC_CLASS___AVAudioTime);
  return -[AVAudioTime initWithSampleTime:atRate:](v3, "initWithSampleTime:atRate:", v5, 1.0);
}

- (id)_gainForFrame:(id)a3
{
  id v4 = a3;
  int64_t v5 = -[AudioAppleSiriRemoteInputDevice deviceType](self, "deviceType");
  if ((unint64_t)(v5 - 1) < 2)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue(-[AudioAppleSiriRemoteInputDevice _gainForTVRemoteFrame:](self, "_gainForTVRemoteFrame:", v4));
  }

  else
  {
    if (v5 != 3 && v5 != 4)
    {
      unsigned int v6 = (void *)qword_D420;
      if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_ERROR)) {
        sub_5380(v6);
      }
    }

    uint64_t v7 = objc_claimAutoreleasedReturnValue(-[AudioAppleSiriRemoteInputDevice _gainForDoapFrame:](self, "_gainForDoapFrame:", v4));
  }

  id v8 = (void *)v7;

  return v8;
}

- (id)_gainForTVRemoteFrame:(id)a3
{
  __int16 v5 = 0;
  objc_msgSend(a3, "getBytes:range:", &v5, self->_rmsOffset, 2);
  LOWORD(v3) = v5;
  return (id)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  (double)v3 * 0.0000305175781));
}

- (id)_gainForDoapFrame:(id)a3
{
  __int16 v4 = 0;
  objc_msgSend(a3, "getBytes:range:", &v4, self->_rmsOffset, 2);
  return (id)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  &v4,  2LL));
}

- (id)_qualityForSpeexFrame:(id)a3
{
  __int16 v5 = 0;
  objc_msgSend(a3, "getBytes:range:", &v5, 72, 2);
  LOWORD(v3) = v5;
  return (id)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  (double)v3 * 0.00048828125));
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

- (id)statusChangeBlock
{
  return self->statusChangeBlock;
}

- (void)setStatusChangeBlock:(id)a3
{
}

- (AudioAppleSiriRemoteInputPlugin)plugin
{
  return (AudioAppleSiriRemoteInputPlugin *)objc_loadWeakRetained((id *)&self->_plugin);
}

- (void)setPlugin:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)codec
{
  return self->_codec;
}

- (NSString)resolvedDeviceIdentifier
{
  return self->_resolvedDeviceIdentifier;
}

- (void)setResolvedDeviceIdentifier:(id)a3
{
}

- (int)frameLength
{
  return self->_frameLength;
}

- (void)setFrameLength:(int)a3
{
  self->_frameLength = a3;
}

- (int)frameLengthOffset
{
  return self->_frameLengthOffset;
}

- (void)setFrameLengthOffset:(int)a3
{
  self->_frameLengthOffset = a3;
}

- (int)rmsOffset
{
  return self->_rmsOffset;
}

- (void)setRmsOffset:(int)a3
{
  self->_rmsOffset = a3;
}

- (int)timeOffset
{
  return self->_timeOffset;
}

- (void)setTimeOffset:(int)a3
{
  self->_timeOffset = a3;
}

- (unsigned)pidNum
{
  return self->_pidNum;
}

- (void)setPidNum:(unsigned __int16)a3
{
  self->_int pidNum = a3;
}

- (unsigned)doapCodecType
{
  return self->_doapCodecType;
}

- (void)setDoapCodecType:(unsigned __int8)a3
{
  self->_doapCodecType = a3;
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(int64_t)a3
{
  self->_int64_t deviceType = a3;
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