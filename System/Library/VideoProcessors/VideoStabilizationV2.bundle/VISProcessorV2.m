@interface VISProcessorV2
- (BOOL)flipHorizontalOrientationEnabled;
- (BOOL)longPressModeEnabled;
- (MTLCommandQueue)metalCommandQueue;
- (NSDictionary)cameraInfoByPortType;
- (NSDictionary)tuningParameters;
- (VISConfiguration)configuration;
- (VISProcessorDelegate)delegate;
- (VISProcessorV2)init;
- (int)finishProcessing;
- (int)prewarm;
- (int)resetState;
- (int)setup;
- (void)dealloc;
- (void)didCompleteProcessingOfBuffer:(opaqueCMSampleBuffer *)a3 withStatus:(int)a4;
- (void)setCameraInfoByPortType:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFlipHorizontalOrientationEnabled:(BOOL)a3;
- (void)setLongPressModeEnabled:(BOOL)a3;
- (void)setMetalCommandQueue:(id)a3;
- (void)setTuningParameters:(id)a3;
- (void)willStartProcessingBuffer:(opaqueCMSampleBuffer *)a3 withStatus:(int)a4;
@end

@implementation VISProcessorV2

- (VISProcessorV2)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___VISProcessorV2;
  v2 = -[VISProcessorV2 init](&v7, "init");
  if (v2
    && (v3 = objc_alloc_init(&OBJC_CLASS___VISWrapper),
        visWrapper = v2->_visWrapper,
        v2->_visWrapper = v3,
        visWrapper,
        v2->_visWrapper))
  {
    v5 = v2;
  }

  else
  {
    v5 = 0LL;
  }

  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___VISProcessorV2;
  -[VISProcessorV2 dealloc](&v3, "dealloc");
}

- (int)finishProcessing
{
  int v4 = -[VISWrapper finishProcessing](self->_visWrapper, "finishProcessing");
  if (v4)
  {
    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3("%s assert: %s at %s (%s:%d) - %s%s(err=%d)", v4, v2, v6, v7, v8, v9, vars0, vars8);
  }

  else
  {
    self->_buffersEnqueued = 0;
  }

  return v4;
}

- (int)setup
{
  return 0;
}

- (int)prewarm
{
  objc_super v3 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self, a2));
  int v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (VISConfiguration *)objc_opt_new([v4 classNamed:@"VISConfigurationV2"]);
  configuration = self->_configuration;
  self->_configuration = v5;

  -[VISConfiguration setTransformPlatform:](self->_configuration, "setTransformPlatform:", 0LL);
  -[VISConfiguration setSmoothingMethod:](self->_configuration, "setSmoothingMethod:", 1LL);
  CFStringRef v7 = kCVPixelBufferWidthKey;
  CFStringRef v8 = kCVPixelBufferHeightKey;
  v18[0] = kCVPixelBufferWidthKey;
  v18[1] = kCVPixelBufferHeightKey;
  v19[0] = &off_39660;
  v19[1] = &off_39660;
  v18[2] = kCVPixelBufferPixelFormatTypeKey;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", 875704422LL));
  v19[2] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v19,  v18,  3LL));
  -[VISConfiguration setInputPixelBufferAttributes:](self->_configuration, "setInputPixelBufferAttributes:", v10);

  v16[0] = v7;
  v16[1] = v8;
  v17[0] = &off_39660;
  v17[1] = &off_39660;
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v17,  v16,  2LL));
  -[VISConfiguration setOutputPixelBufferAttributes:](self->_configuration, "setOutputPixelBufferAttributes:", v11);

  -[VISConfiguration setBlurBorderPixels:](self->_configuration, "setBlurBorderPixels:", 1LL);
  uint64_t v14 = kFigCaptureSensorIDDictionaryKey_VideoStabilizationRenderMethod;
  v15 = &off_39678;
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));
  -[VISConfiguration setSensorIDDict:](self->_configuration, "setSensorIDDict:", v12);

  -[VISConfiguration setMetalCommandQueue:](self->_configuration, "setMetalCommandQueue:", self->_metalCommandQueue);
  -[VISProcessorV2 prepareToProcess:](self, "prepareToProcess:", 0LL);

  return 0;
}

- (int)resetState
{
  return 0;
}

- (void)willStartProcessingBuffer:(opaqueCMSampleBuffer *)a3 withStatus:(int)a4
{
  if (self->_shouldCallStartProcessingBufferDelegate)
  {
    uint64_t v4 = *(void *)&a4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained willStartProcessingBuffer:a3 withStatus:v4];
  }

- (void)didCompleteProcessingOfBuffer:(opaqueCMSampleBuffer *)a3 withStatus:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained didCompleteProcessingOfBuffer:a3 withStatus:v4];
}

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v6 = a3;
  id v5 = objc_storeWeak((id *)p_delegate, v6);
  LOBYTE(p_delegate) = objc_opt_respondsToSelector(v6, "willStartProcessingBuffer:withStatus:");

  self->_shouldCallStartProcessingBufferDelegate = p_delegate & 1;
}

- (VISProcessorDelegate)delegate
{
  return (VISProcessorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSDictionary)tuningParameters
{
  return self->_tuningParameters;
}

- (void)setTuningParameters:(id)a3
{
}

- (MTLCommandQueue)metalCommandQueue
{
  return self->_metalCommandQueue;
}

- (void)setMetalCommandQueue:(id)a3
{
}

- (NSDictionary)cameraInfoByPortType
{
  return self->_cameraInfoByPortType;
}

- (void)setCameraInfoByPortType:(id)a3
{
}

- (BOOL)longPressModeEnabled
{
  return self->_longPressModeEnabled;
}

- (void)setLongPressModeEnabled:(BOOL)a3
{
  self->_longPressModeEnabled = a3;
}

- (BOOL)flipHorizontalOrientationEnabled
{
  return self->_flipHorizontalOrientationEnabled;
}

- (void)setFlipHorizontalOrientationEnabled:(BOOL)a3
{
  self->_flipHorizontalOrientationEnabled = a3;
}

- (VISConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
}

@end