@interface RPMicAudioCaptureManager
+ (AudioStreamBasicDescription)audioStreamBasicDescriptionWithStereo:(SEL)a3;
- (RPMicAudioCaptureManager)init;
- (void)dealloc;
- (void)dispatchedDidStartHandler;
- (void)handleAudioSessionInterruption:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)startMicrophoneCaptureWithOutput:(id)a3 didStartHandler:(id)a4;
- (void)stopAllCapture;
- (void)stopMicrophoneCapture;
@end

@implementation RPMicAudioCaptureManager

+ (AudioStreamBasicDescription)audioStreamBasicDescriptionWithStereo:(SEL)a3
{
  retstr->mSampleRate = 44100.0;
  *(void *)&retstr->mFormatID = 0xE6C70636DLL;
  if (a4) {
    UInt32 v4 = 4;
  }
  else {
    UInt32 v4 = 2;
  }
  if (a4) {
    UInt32 v5 = 2;
  }
  else {
    UInt32 v5 = 1;
  }
  retstr->mBytesPerFrame = v4;
  retstr->mChannelsPerFrame = v5;
  retstr->mBytesPerPacket = v4;
  retstr->mFramesPerPacket = 1;
  *(void *)&retstr->mBitsPerChannel = 16LL;
  return result;
}

- (void)handleAudioSessionInterruption:(id)a3
{
  UInt32 v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  UInt32 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:AVAudioSessionInterruptionTypeKey]);
  id v6 = [v5 unsignedIntegerValue];

  if (v6)
  {
    if (v6 == (id)1)
    {
      if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 136446466;
        v8 = "-[RPMicAudioCaptureManager handleAudioSessionInterruption:]";
        __int16 v9 = 1024;
        int v10 = 83;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d AVAudioSessionInterruptionTypeBegan",  (uint8_t *)&v7,  0x12u);
      }

      self->_micInterrupted = 1;
    }
  }

  else if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446466;
    v8 = "-[RPMicAudioCaptureManager handleAudioSessionInterruption:]";
    __int16 v9 = 1024;
    int v10 = 87;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d AVAudioSessionInterruptionTypeEnded",  (uint8_t *)&v7,  0x12u);
  }

- (RPMicAudioCaptureManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___RPMicAudioCaptureManager;
  v2 = -[RPMicAudioCaptureManager init](&v13, "init");
  if (v2)
  {
    +[RPMicAudioCaptureManager audioStreamBasicDescriptionWithStereo:]( &OBJC_CLASS___RPMicAudioCaptureManager,  "audioStreamBasicDescriptionWithStereo:",  0LL);
    uint64_t v3 = v12;
    __int128 v4 = v11;
    *(_OWORD *)(v2 + 24) = v10;
    *(_OWORD *)(v2 + 40) = v4;
    *((void *)v2 + 7) = v3;
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.ReplayKit.MicAudioCaptureQueue", 0LL);
    id v6 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v5;

    int v7 = (void *)*((void *)v2 + 9);
    *((void *)v2 + 9) = 0LL;

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v8 addObserver:v2 selector:"handleAudioSessionInterruption:" name:AVAudioSessionInterruptionNotification object:0];
  }

  return (RPMicAudioCaptureManager *)v2;
}

- (void)dealloc
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self name:AVAudioSessionInterruptionNotification object:0];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___RPMicAudioCaptureManager;
  -[RPMicAudioCaptureManager dealloc](&v4, "dealloc");
}

- (void)stopAllCapture
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446466;
    id v6 = "-[RPMicAudioCaptureManager stopAllCapture]";
    __int16 v7 = 1024;
    int v8 = 134;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d ",  (uint8_t *)&v5,  0x12u);
  }

  -[RPMicAudioCaptureManager stopCaptureSession](self, "stopCaptureSession");
  -[RPMicAudioCaptureManager stopMicrophoneCapture](self, "stopMicrophoneCapture");
  id microphoneOutputHandler = self->_microphoneOutputHandler;
  self->_id microphoneOutputHandler = 0LL;

  lastMicAudioDate = self->_lastMicAudioDate;
  self->_lastMicAudioDate = 0LL;
}

- (void)startMicrophoneCaptureWithOutput:(id)a3 didStartHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446466;
    __int16 v9 = "-[RPMicAudioCaptureManager startMicrophoneCaptureWithOutput:didStartHandler:]";
    __int16 v10 = 1024;
    int v11 = 142;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d ",  (uint8_t *)&v8,  0x12u);
  }

  dispatch_async((dispatch_queue_t)self->_audioDispatchQueue, &stru_100070CE8);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([v9 isEqualToString:@"running"])
  {
    -[RPMicAudioCaptureManager dispatchedDidStartHandler](self, "dispatchedDidStartHandler");
    [v10 removeObserver:self forKeyPath:@"running"];
  }
}

- (void)stopMicrophoneCapture
{
}

- (void)dispatchedDidStartHandler
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v6 = "-[RPMicAudioCaptureManager dispatchedDidStartHandler]";
    __int16 v7 = 1024;
    int v8 = 274;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d ",  buf,  0x12u);
  }

  audioDispatchQueue = (dispatch_queue_s *)self->_audioDispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000718C;
  block[3] = &unk_100070D30;
  block[4] = self;
  dispatch_async(audioDispatchQueue, block);
}

- (void).cxx_destruct
{
}

@end