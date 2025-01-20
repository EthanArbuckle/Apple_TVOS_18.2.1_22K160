@interface RPAppAudioCaptureManager
+ ($06BEC8FB4B7E784B04C621BFFEAAD98D)audioCaptureConfigForSystemRecording:(BOOL)a3 processID:(int)a4 contextID:(id)a5;
+ (AudioStreamBasicDescription)audioStreamBasicDescriptionWithStereo:(SEL)a3;
- (BOOL)handleStartAudioQueueFailed:(int)a3 didFailHandler:(id)a4;
- (RPAppAudioCaptureManager)init;
- (id)newAudioTapForAudioCaptureConfig:(id)a3;
- (void)resumeWithConfig:(id)a3;
- (void)startWithConfig:(id)a3 outputHandler:(id)a4 didStartHandler:(id)a5;
- (void)stop;
@end

@implementation RPAppAudioCaptureManager

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

- (RPAppAudioCaptureManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___RPAppAudioCaptureManager;
  v2 = -[RPAppAudioCaptureManager init](&v10, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.ReplayKit.AppAudioCaptureQueue", 0LL);
    UInt32 v4 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v3;

    UInt32 v5 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = 0LL;

    +[RPAppAudioCaptureManager audioStreamBasicDescriptionWithStereo:]( &OBJC_CLASS___RPAppAudioCaptureManager,  "audioStreamBasicDescriptionWithStereo:",  1LL);
    *(_OWORD *)(v2 + 56) = v7;
    *(_OWORD *)(v2 + 72) = v8;
    *((void *)v2 + 11) = v9;
  }

  return (RPAppAudioCaptureManager *)v2;
}

- (BOOL)handleStartAudioQueueFailed:(int)a3 didFailHandler:(id)a4
{
  UInt32 v5 = (void (**)(id, void *))a4;
  if (a3)
  {
    if (dword_100084688 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100045770();
      if (!v5) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }

    if (v5)
    {
LABEL_5:
      v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError _rpUserErrorForCode:userInfo:]( &OBJC_CLASS___NSError,  "_rpUserErrorForCode:userInfo:",  -5803LL,  0LL));
      v5[2](v5, v6);
    }
  }

- (void)startWithConfig:(id)a3 outputHandler:(id)a4 didStartHandler:(id)a5
{
  id var2 = a3.var2;
  uint64_t v7 = *(void *)&a3.var0;
  id v9 = a4;
  id v10 = a5;
  audioDispatchQueue = (dispatch_queue_s *)self->_audioDispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3254779904LL;
  block[2] = sub_10002F374;
  block[3] = &unk_100071A68;
  block[4] = self;
  id v16 = v9;
  id v17 = v10;
  uint64_t v18 = v7;
  id v19 = var2;
  id v12 = var2;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(audioDispatchQueue, block);
}

- (void)resumeWithConfig:(id)a3
{
  self->_resumed = 1;
  -[RPAppAudioCaptureManager startWithConfig:outputHandler:didStartHandler:]( self,  "startWithConfig:outputHandler:didStartHandler:",  *(void *)&a3.var0,  a3.var2,  self->_appAudioOutputHandler,  &stru_100071A98);
}

- (void)stop
{
  audioDispatchQueue = (dispatch_queue_s *)self->_audioDispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002FDB4;
  block[3] = &unk_100070D30;
  block[4] = self;
  dispatch_sync(audioDispatchQueue, block);
}

+ ($06BEC8FB4B7E784B04C621BFFEAAD98D)audioCaptureConfigForSystemRecording:(BOOL)a3 processID:(int)a4 contextID:(id)a5
{
  uint64_t v5 = *(void *)&a4 << 32;
  v6 = 0LL;
  result.id var2 = v6;
  result.var0 = v5;
  result.var1 = HIDWORD(v5);
  return result;
}

- (id)newAudioTapForAudioCaptureConfig:(id)a3
{
  id var2 = a3.var2;
  unint64_t v4 = *(void *)&a3.var0;
  uint64_t v5 = -[AVAudioFormat initWithStreamDescription:]( objc_alloc(&OBJC_CLASS___AVAudioFormat),  "initWithStreamDescription:",  &self->_audioBasicDescription);
  if (!v5)
  {
    goto LABEL_15;
  }

  if ((_DWORD)v4 == 2)
  {
    id v6 = [[ATAudioTapDescription alloc] initScreenSharingTapWithFormat:v5];
  }

  else if ((_DWORD)v4 == 1)
  {
    if (!var2)
    {
      goto LABEL_15;
    }

    id v6 = [[ATAudioTapDescription alloc] initPreSpatialSceneIdentifierTapWithFormat:v5 sceneIdentifier:var2];
  }

  else
  {
    if ((_DWORD)v4)
    {
LABEL_12:
LABEL_15:
      uint64_t v7 = 0LL;
LABEL_16:
      id v10 = 0LL;
      goto LABEL_17;
    }

    id v6 = [[ATAudioTapDescription alloc] initProcessTapWithFormat:v5 PID:HIDWORD(v4)];
  }

  uint64_t v7 = v6;
  if (!v6) {
    goto LABEL_12;
  }
  id v8 = [[ATAudioTap alloc] initWithTapDescription:v6];
  id v9 = v8;
  if (!v8)
  {
    goto LABEL_16;
  }

  [v8 setScreenSharingHost:1];
  id v10 = v9;
LABEL_17:

  return v10;
}

- (void).cxx_destruct
{
}

@end