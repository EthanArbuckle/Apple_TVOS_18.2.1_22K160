@interface MRAPInputDevice
- (AVAudioFormat)format;
- (MRAPInputDevice)initWithInputDevice:(void *)a3;
- (NSArray)supportedFormats;
- (NSString)description;
- (NSString)deviceIdentifier;
- (id)audioInputBlock;
- (unsigned)mediaRemoteDeviceID;
- (void)_setRecordingState:(unsigned int)a3 withCompletion:(id)a4;
- (void)dealloc;
- (void)inputDevice;
- (void)processVoiceDataWithBuffer:(void *)a3 time:(id)a4 gain:(float)a5;
- (void)setAudioInputBlock:(id)a3;
- (void)setFormat:(id)a3;
- (void)setSupportedFormats:(id)a3;
- (void)startRecordingWithCompletionBlock:(id)a3;
- (void)stopRecordingWithCompletionBlock:(id)a3;
@end

@implementation MRAPInputDevice

- (MRAPInputDevice)initWithInputDevice:(void *)a3
{
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___MRAPInputDevice;
  v4 = -[MRAPInputDevice init](&v25, "init");
  if (v4)
  {
    v4->_inputDevice = (void *)CFRetain(a3);
    uint64_t Descriptor = MRVirtualVoiceInputDeviceGetDescriptor();
    if (Descriptor)
    {
      uint64_t v6 = Descriptor;
      v7 = (void *)MRVirtualVoiceInputDeviceDescriptorCopySupportedFormats();
      v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      id v9 = v7;
      id v10 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v22;
        do
        {
          v13 = 0LL;
          do
          {
            if (*(void *)v22 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)v13);
            v15 = objc_alloc(&OBJC_CLASS___AVAudioFormat);
            v16 = -[AVAudioFormat initWithSettings:](v15, "initWithSettings:", v14, (void)v21);
            -[NSMutableArray addObject:](v8, "addObject:", v16);

            v13 = (char *)v13 + 1;
          }

          while (v11 != v13);
          id v11 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
        }

        while (v11);
      }

      objc_storeStrong((id *)&v4->_supportedFormats, v8);
      v17 = (void *)MRVirtualVoiceInputDeviceDescriptorCopyDefaultFormat(v6);
      if (v17)
      {
        v18 = -[AVAudioFormat initWithSettings:](objc_alloc(&OBJC_CLASS___AVAudioFormat), "initWithSettings:", v17);
        format = v4->_format;
        v4->_format = v18;
      }
    }
  }

  return v4;
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ %p inputDevice = %@>",  v5,  self,  self->_inputDevice));

  return (NSString *)v6;
}

- (void)dealloc
{
  inputDevice = self->_inputDevice;
  if (inputDevice) {
    CFRelease(inputDevice);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MRAPInputDevice;
  -[MRAPInputDevice dealloc](&v4, "dealloc");
}

- (id)audioInputBlock
{
  return objc_retainBlock(self->_audioInputBlock);
}

- (void)setAudioInputBlock:(id)a3
{
  id v4 = [a3 copy];
  id audioInputBlock = self->_audioInputBlock;
  self->_id audioInputBlock = v4;
}

- (NSArray)supportedFormats
{
  return self->_supportedFormats;
}

- (void)setSupportedFormats:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  supportedFormats = self->_supportedFormats;
  self->_supportedFormats = v4;
}

- (AVAudioFormat)format
{
  return self->_format;
}

- (void)setFormat:(id)a3
{
}

- (NSString)deviceIdentifier
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%llu",  -[MRAPInputDevice mediaRemoteDeviceID](self, "mediaRemoteDeviceID"));
}

- (unsigned)mediaRemoteDeviceID
{
  inputDevice = self->_inputDevice;
  if (inputDevice) {
    LODWORD(inputDevice) = MRVirtualVoiceInputDeviceGetUniqueIdentifier(inputDevice, a2);
  }
  return inputDevice;
}

- (void)startRecordingWithCompletionBlock:(id)a3
{
  id v4 = a3;
  uint64_t v6 = _MRLogForCategory(5LL, v5);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_6230((uint64_t)self, v7, v8, v9, v10, v11, v12, v13);
  }

  -[MRAPInputDevice _setRecordingState:withCompletion:](self, "_setRecordingState:withCompletion:", 1LL, v4);
}

- (void)stopRecordingWithCompletionBlock:(id)a3
{
  id v4 = a3;
  uint64_t v6 = _MRLogForCategory(5LL, v5);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_6298((uint64_t)self, v7, v8, v9, v10, v11, v12, v13);
  }

  -[MRAPInputDevice _setRecordingState:withCompletion:](self, "_setRecordingState:withCompletion:", 2LL, v4);
}

- (void)processVoiceDataWithBuffer:(void *)a3 time:(id)a4 gain:(float)a5
{
  if (self->_audioInputBlock)
  {
    double var1 = a4.var1;
    double var0 = a4.var0;
    if (a3) {
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([a3 buffer]);
    }
    else {
      uint64_t v9 = 0LL;
    }
    uint64_t v11 = -[AVAudioTime initWithHostTime:sampleTime:atRate:]( objc_alloc(&OBJC_CLASS___AVAudioTime),  "initWithHostTime:sampleTime:atRate:",  +[AVAudioTime hostTimeForSeconds:](&OBJC_CLASS___AVAudioTime, "hostTimeForSeconds:", var0),  0LL,  var1);
    v15 = @"Gain";
    *(float *)&double v12 = a5;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v12));
    v16 = v13;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));

    (*((void (**)(void))self->_audioInputBlock + 2))();
  }

  else
  {
    uint64_t v10 = _MRLogForCategory(5LL, a2);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_6300(v9);
    }
  }
}

- (void)_setRecordingState:(unsigned int)a3 withCompletion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v7 = a4;
  inputDevice = self->_inputDevice;
  if (inputDevice)
  {
    uint64_t UniqueIdentifier = MRVirtualVoiceInputDeviceGetUniqueIdentifier(inputDevice, v6);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_529C;
    v11[3] = &unk_82F8;
    id v12 = v7;
    MRVirtualVoiceInputSetRecordingState(UniqueIdentifier, v4, &_dispatch_main_q, v11);
  }

  else
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError mrap_errorWithCode:](&OBJC_CLASS___NSError, "mrap_errorWithCode:", 1LL));
    (*((void (**)(id, void *))v7 + 2))(v7, v10);
  }
}

- (void)inputDevice
{
  return self->_inputDevice;
}

- (void).cxx_destruct
{
}

@end