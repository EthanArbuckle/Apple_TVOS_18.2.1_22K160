@interface TVSSSimpleCameraSession
- (AVCaptureDevice)device;
- (AVCaptureSession)avSession;
- (BOOL)hasFailed;
- (BOOL)hasReceivedFirstFrame;
- (OS_dispatch_queue)sessionQueue;
- (TVSSSimpleCameraSession)init;
- (TVSSSimpleCameraSessionDelegate)delegate;
- (void)_fail;
- (void)_handleDeviceDisconnected:(id)a3;
- (void)_handleInterruption:(id)a3;
- (void)_handleRuntimeError:(id)a3;
- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5;
- (void)dealloc;
- (void)setAvSession:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDevice:(id)a3;
- (void)setSessionQueue:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation TVSSSimpleCameraSession

- (TVSSSimpleCameraSession)init
{
  SEL v21 = a2;
  id v22 = 0LL;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___TVSSSimpleCameraSession;
  v10 = -[TVSSSimpleCameraSession init](&v20, "init");
  id v22 = v10;
  objc_storeStrong(&v22, v10);
  if (!v10) {
    goto LABEL_14;
  }
  id v19 = objc_alloc_init(&OBJC_CLASS___TVSSSensorActivityController);
  id v18 = -[TVSSVideoMicBackingStore initWithSensorActivityController:]( objc_alloc(&OBJC_CLASS___TVSSVideoMicBackingStore),  "initWithSensorActivityController:",  v19);
  if ([v18 cameraIsAvailableForTVSystemUI])
  {
    id v16 = objc_alloc_init(&OBJC_CLASS___AVCaptureSession);
    id v15 =  +[AVCaptureDevice defaultDeviceWithMediaType:]( &OBJC_CLASS___AVCaptureDevice,  "defaultDeviceWithMediaType:",  AVMediaTypeVideo);
    id v14 = 0LL;
    v2 = objc_alloc(&OBJC_CLASS___AVCaptureDeviceInput);
    id obj = v14;
    v9 = -[AVCaptureDeviceInput initWithDevice:error:](v2, "initWithDevice:error:", v15, &obj);
    objc_storeStrong(&v14, obj);
    id v13 = v9;
    if (!v9) {
      goto LABEL_7;
    }
    if ([v16 canAddInput:v13])
    {
      [v16 addInput:v13];
      id v11 = objc_alloc_init(&OBJC_CLASS___AVCaptureVideoDataOutput);
      id v7 = v22;
      v8 = &_dispatch_main_q;
      objc_msgSend(v11, "setSampleBufferDelegate:queue:", v7);

      if ([v16 canAddOutput:v11])
      {
        [v16 addOutput:v11];
        objc_storeStrong((id *)v22 + 4, v15);
        objc_storeStrong((id *)v22 + 2, v16);
        v6 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INITIATED, 0);
        dispatch_queue_t v3 = dispatch_queue_create("com.apple.TVSystemUIService.AVCapturePreview", v6);
        v4 = (void *)*((void *)v22 + 5);
        *((void *)v22 + 5) = v3;

        int v17 = 0;
      }

      else
      {
        v23 = 0LL;
        int v17 = 1;
      }

      objc_storeStrong(&v11, 0LL);
    }

    else
    {
LABEL_7:
      v23 = 0LL;
      int v17 = 1;
    }

    objc_storeStrong(&v13, 0LL);
    objc_storeStrong(&v14, 0LL);
    objc_storeStrong(&v15, 0LL);
    objc_storeStrong(&v16, 0LL);
  }

  else
  {
    v23 = 0LL;
    int v17 = 1;
  }

  objc_storeStrong(&v18, 0LL);
  objc_storeStrong(&v19, 0LL);
  if (!v17)
  {
LABEL_14:
    v23 = (TVSSSimpleCameraSession *)v22;
    int v17 = 1;
  }

  objc_storeStrong(&v22, 0LL);
  return v23;
}

- (void)dealloc
{
  v4 = self;
  v3[1] = (id)a2;
  v3[0] = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  [v3[0] removeObserver:v4 name:AVCaptureSessionRuntimeErrorNotification object:v4->_avSession];
  objc_msgSend(v3[0], "removeObserver:name:object:", v4, AVCaptureSessionWasInterruptedNotification);
  [v3[0] removeObserver:v4 name:AVCaptureDeviceWasDisconnectedNotification object:0];
  objc_storeStrong(v3, 0LL);
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVSSSimpleCameraSession;
  -[TVSSSimpleCameraSession dealloc](&v2, "dealloc");
}

- (void)start
{
  SEL v21 = self;
  v20[1] = (id)a2;
  if (!-[AVCaptureSession isRunning](self->_avSession, "isRunning"))
  {
    v23[0] = AVControlCenterVideoEffectCenterStage;
    v23[1] = AVControlCenterVideoEffectBackgroundBlur;
    v23[2] = AVControlCenterVideoEffectStudioLighting;
    v23[3] = AVControlCenterVideoEffectReactions;
    v23[4] = AVControlCenterVideoEffectGestures;
    v20[0] = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v23, 5LL);
    memset(__b, 0, sizeof(__b));
    id obj = v20[0];
    id v8 = [obj countByEnumeratingWithState:__b objects:v22 count:16];
    if (v8)
    {
      uint64_t v4 = *(void *)__b[2];
      uint64_t v5 = 0LL;
      id v6 = v8;
      while (1)
      {
        uint64_t v3 = v5;
        if (*(void *)__b[2] != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(__b[1] + 8 * v5);
        unsigned __int8 v17 = AVControlCenterVideoEffectsModuleIsEffectEnabledForBundleID(v19, @"com.apple.facetime") & 1;
        AVControlCenterVideoEffectsModuleSetEffectEnabledForBundleID(v19, v17, @"com.apple.TVSystemUIService");
        ++v5;
        if (v3 + 1 >= (unint64_t)v6)
        {
          uint64_t v5 = 0LL;
          id v6 = [obj countByEnumeratingWithState:__b objects:v22 count:16];
          if (!v6) {
            break;
          }
        }
      }
    }

    id v16 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter addObserver:selector:name:object:]( v16,  "addObserver:selector:name:object:",  v21,  "_handleRuntimeError:",  AVCaptureSessionRuntimeErrorNotification,  v21->_avSession);
    -[NSNotificationCenter addObserver:selector:name:object:]( v16,  "addObserver:selector:name:object:",  v21,  "_handleInterruption:",  AVCaptureSessionWasInterruptedNotification);
    -[NSNotificationCenter addObserver:selector:name:object:]( v16,  "addObserver:selector:name:object:",  v21,  "_handleDeviceDisconnected:",  AVCaptureDeviceWasDisconnectedNotification,  0LL);
    objc_initWeak(&location, v21);
    queue = (dispatch_queue_s *)v21->_sessionQueue;
    v9 = _NSConcreteStackBlock;
    int v10 = -1073741824;
    int v11 = 0;
    v12 = sub_1000CF884;
    id v13 = &unk_1001B75D0;
    objc_copyWeak(&v14, &location);
    dispatch_async(queue, &v9);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
    objc_storeStrong((id *)&v16, 0LL);
    objc_storeStrong(v20, 0LL);
  }

- (void)stop
{
  int v11 = self;
  v10[1] = (id)a2;
  if (-[AVCaptureSession isRunning](self->_avSession, "isRunning"))
  {
    v10[0] = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    [v10[0] removeObserver:v11 name:AVCaptureSessionRuntimeErrorNotification object:v11->_avSession];
    objc_msgSend(v10[0], "removeObserver:name:object:", v11, AVCaptureSessionWasInterruptedNotification);
    [v10[0] removeObserver:v11 name:AVCaptureDeviceWasDisconnectedNotification object:0];
    objc_initWeak(&location, v11);
    queue = (dispatch_queue_s *)v11->_sessionQueue;
    uint64_t v3 = _NSConcreteStackBlock;
    int v4 = -1073741824;
    int v5 = 0;
    id v6 = sub_1000CFA48;
    id v7 = &unk_1001B75D0;
    objc_copyWeak(&v8, &location);
    dispatch_async(queue, &v3);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
    objc_storeStrong(v10, 0LL);
  }

- (void)_handleRuntimeError:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  uint64_t v3 = (AVCaptureSession *)[location[0] object];
  BOOL v4 = v3 == v6->_avSession;

  if (v4) {
    -[TVSSSimpleCameraSession _fail](v6, "_fail");
  }
  objc_storeStrong(location, 0LL);
}

- (void)_handleInterruption:(id)a3
{
  BOOL v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSSSimpleCameraSession _fail](v4, "_fail");
  objc_storeStrong(location, 0LL);
}

- (void)_handleDeviceDisconnected:(id)a3
{
  int v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v3 = [location[0] object];
  if (v3 == v5->_device) {
    -[TVSSSimpleCameraSession _fail](v5, "_fail");
  }
  objc_storeStrong(&v3, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_fail
{
  self->_failed = 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained connectionFailed];
}

- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  int v10 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v8[1] = a4;
  v8[0] = 0LL;
  objc_storeStrong(v8, a5);
  if (!v10->_receivedFirstFrame)
  {
    v10->_receivedFirstFrame = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&v10->_delegate);
    [WeakRetained didReceiveFirstFrame];
  }

  objc_storeStrong(v8, 0LL);
  objc_storeStrong(location, 0LL);
}

- (AVCaptureSession)avSession
{
  return self->_avSession;
}

- (void)setAvSession:(id)a3
{
}

- (TVSSSimpleCameraSessionDelegate)delegate
{
  return (TVSSSimpleCameraSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)hasReceivedFirstFrame
{
  return self->_receivedFirstFrame;
}

- (BOOL)hasFailed
{
  return self->_failed;
}

- (AVCaptureDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (OS_dispatch_queue)sessionQueue
{
  return self->_sessionQueue;
}

- (void)setSessionQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end