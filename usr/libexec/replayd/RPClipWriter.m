@interface RPClipWriter
- (RPClipWriter)initWithWindowSize:(CGSize)a3;
- (id)dispatchClipWriterQueue;
- (void)appendAudio1SampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)appendAudio2SampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)appendVideoSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)exportClipToURL:(id)a3 duration:(double)a4 completionHandler:(id)a5;
- (void)flushClipBuffer;
- (void)queueAndWaitForSample:(int)a3 withAssetInput:(id)a4 withBuffer:(id)a5 didAppendIdleFrame:(BOOL)a6;
- (void)setupAssetWriter;
- (void)updateLatestSampleTime:(opaqueCMSampleBuffer *)a3;
- (void)waitForCompletionAndFinishWriting:(id *)a3 withHandler:(id)a4;
@end

@implementation RPClipWriter

- (RPClipWriter)initWithWindowSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v20 = "-[RPClipWriter initWithWindowSize:]";
    __int16 v21 = 1024;
    int v22 = 60;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d ",  buf,  0x12u);
  }

  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___RPClipWriter;
  v6 = -[RPClipWriter init](&v18, "init");
  if (v6)
  {
    id v7 = -[RPClipBuffer initForVideo:](objc_alloc(&OBJC_CLASS___RPClipBuffer), "initForVideo:", 1LL);
    v8 = (void *)*((void *)v6 + 1);
    *((void *)v6 + 1) = v7;

    id v9 = -[RPClipBuffer initForVideo:](objc_alloc(&OBJC_CLASS___RPClipBuffer), "initForVideo:", 0LL);
    v10 = (void *)*((void *)v6 + 2);
    *((void *)v6 + 2) = v9;

    id v11 = -[RPClipBuffer initForVideo:](objc_alloc(&OBJC_CLASS___RPClipBuffer), "initForVideo:", 0LL);
    v12 = (void *)*((void *)v6 + 3);
    *((void *)v6 + 3) = v11;

    dispatch_group_t v13 = dispatch_group_create();
    v14 = (void *)*((void *)v6 + 4);
    *((void *)v6 + 4) = v13;

    dispatch_queue_t v15 = dispatch_queue_create("com.apple.ReplayKit.RPClipWriterQueue", 0LL);
    v16 = (void *)*((void *)v6 + 5);
    *((void *)v6 + 5) = v15;

    *((CGFloat *)v6 + 7) = width;
    *((CGFloat *)v6 + 8) = height;
    *(_OWORD *)(v6 + 120) = *(_OWORD *)&kCMTimeNegativeInfinity.value;
    *((void *)v6 + 17) = kCMTimeNegativeInfinity.epoch;
  }

  return (RPClipWriter *)v6;
}

- (void)setupAssetWriter
{
  videoInput = self->_videoInput;
  self->_videoInput = 0LL;

  audioInput1 = self->_audioInput1;
  self->_audioInput1 = 0LL;

  audioInput2 = self->_audioInput2;
  self->_audioInput2 = 0LL;

  v6 = objc_alloc(&OBJC_CLASS___AVAssetWriter);
  outputURL = self->_outputURL;
  id v24 = 0LL;
  v8 = -[AVAssetWriter initWithURL:fileType:error:](v6, "initWithURL:fileType:error:", outputURL, AVFileTypeMPEG4, &v24);
  id v9 = v24;
  assetWriter = self->_assetWriter;
  self->_assetWriter = v8;

  if (v9)
  {
  }

  else
  {
    id v11 = -[AVAssetWriterInput initWithMediaType:outputSettings:sourceFormatHint:]( objc_alloc(&OBJC_CLASS___AVAssetWriterInput),  "initWithMediaType:outputSettings:sourceFormatHint:",  AVMediaTypeVideo,  0LL,  -[RPClipBuffer getFormatDescription](self->_clipBufferVideo, "getFormatDescription"));
    v12 = self->_videoInput;
    self->_videoInput = v11;

    -[AVAssetWriterInput setExpectsMediaDataInRealTime:](self->_videoInput, "setExpectsMediaDataInRealTime:", 0LL);
    -[AVAssetWriter addInput:](self->_assetWriter, "addInput:", self->_videoInput);
    uint64_t v21 = 0LL;
    uint64_t v20 = 0LL;
    int v23 = 0;
    uint64_t v22 = 0LL;
    int v19 = 6619138;
    v25[0] = AVFormatIDKey;
    v25[1] = AVNumberOfChannelsKey;
    v26[0] = &off_100075478;
    v26[1] = &off_100075490;
    v26[2] = &off_1000754E8;
    v25[2] = AVSampleRateKey;
    v25[3] = AVChannelLayoutKey;
    dispatch_group_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v19, 32LL));
    v25[4] = AVEncoderBitRateKey;
    v26[3] = v13;
    v26[4] = &off_1000754A8;
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v26,  v25,  5LL));

    dispatch_queue_t v15 = -[AVAssetWriterInput initWithMediaType:outputSettings:]( objc_alloc(&OBJC_CLASS___AVAssetWriterInput),  "initWithMediaType:outputSettings:",  AVMediaTypeAudio,  v14);
    v16 = self->_audioInput1;
    self->_audioInput1 = v15;

    -[AVAssetWriterInput setExpectsMediaDataInRealTime:](self->_audioInput1, "setExpectsMediaDataInRealTime:", 0LL);
    -[AVAssetWriter addInput:](self->_assetWriter, "addInput:", self->_audioInput1);
    if (self->_enableMic)
    {
      v17 = -[AVAssetWriterInput initWithMediaType:outputSettings:]( objc_alloc(&OBJC_CLASS___AVAssetWriterInput),  "initWithMediaType:outputSettings:",  AVMediaTypeAudio,  v14);
      objc_super v18 = self->_audioInput2;
      self->_audioInput2 = v17;

      -[AVAssetWriterInput setExpectsMediaDataInRealTime:](self->_audioInput2, "setExpectsMediaDataInRealTime:", 0LL);
      -[AVAssetWriter addInput:](self->_assetWriter, "addInput:", self->_audioInput2);
    }
  }
}

- (void)appendVideoSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  if (!dword_100084688 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v8 = "-[RPClipWriter appendVideoSampleBuffer:]";
    __int16 v9 = 1024;
    int v10 = 109;
    __int16 v11 = 2048;
    v12 = self;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [DEBUG] %{public}s:%d %p",  buf,  0x1Cu);
  }

  CFRetain(a3);
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[RPClipWriter dispatchClipWriterQueue](self, "dispatchClipWriterQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000392A4;
  v6[3] = &unk_100070E10;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

- (void)appendAudio1SampleBuffer:(opaqueCMSampleBuffer *)a3
{
  if (!dword_100084688 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v8 = "-[RPClipWriter appendAudio1SampleBuffer:]";
    __int16 v9 = 1024;
    int v10 = 133;
    __int16 v11 = 2048;
    v12 = self;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [DEBUG] %{public}s:%d %p",  buf,  0x1Cu);
  }

  CFRetain(a3);
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[RPClipWriter dispatchClipWriterQueue](self, "dispatchClipWriterQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100039474;
  v6[3] = &unk_100070E10;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

- (void)appendAudio2SampleBuffer:(opaqueCMSampleBuffer *)a3
{
  if (!dword_100084688 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v8 = "-[RPClipWriter appendAudio2SampleBuffer:]";
    __int16 v9 = 1024;
    int v10 = 143;
    __int16 v11 = 2048;
    v12 = self;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [DEBUG] %{public}s:%d %p",  buf,  0x1Cu);
  }

  CFRetain(a3);
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[RPClipWriter dispatchClipWriterQueue](self, "dispatchClipWriterQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000395E0;
  v6[3] = &unk_100070E10;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

- (void)updateLatestSampleTime:(opaqueCMSampleBuffer *)a3
{
  CMTime latestCMSamplePresentationTime = (CMTime)self->_latestCMSamplePresentationTime;
  double Seconds = CMTimeGetSeconds(&latestCMSamplePresentationTime);
  CMTime latestCMSamplePresentationTime = v6;
  if (Seconds < CMTimeGetSeconds(&latestCMSamplePresentationTime)) {
    self->_CMTime latestCMSamplePresentationTime = ($95D729B680665BEAEFA1D6FCA8238556)v6;
  }
}

- (void)queueAndWaitForSample:(int)a3 withAssetInput:(id)a4 withBuffer:(id)a5 didAppendIdleFrame:(BOOL)a6
{
  id v10 = a4;
  id v11 = a5;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    *(void *)&uint8_t buf[4] = "-[RPClipWriter queueAndWaitForSample:withAssetInput:withBuffer:didAppendIdleFrame:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 160;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d ",  buf,  0x12u);
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000LL;
  v27[0] = 0LL;
  v27[1] = v27;
  v27[2] = 0x2020000000LL;
  v27[3] = 0LL;
  v25[0] = 0LL;
  v25[1] = v25;
  v25[2] = 0x2020000000LL;
  char v26 = 0;
  id v12 = [v11 count];
  *(void *)(*(void *)&buf[8] + 24LL) = v12;
  dispatch_group_enter((dispatch_group_t)self->_clipWriterDispatchGroup);
  clipWriterQueue = self->_clipWriterQueue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000398D4;
  v16[3] = &unk_100071D30;
  int v23 = a3;
  uint64_t v20 = v27;
  uint64_t v21 = buf;
  id v14 = v10;
  id v17 = v14;
  uint64_t v22 = v25;
  id v15 = v11;
  id v18 = v15;
  int v19 = self;
  BOOL v24 = a6;
  [v14 requestMediaDataWhenReadyOnQueue:clipWriterQueue usingBlock:v16];

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(v27, 8);
  _Block_object_dispose(buf, 8);
}

- (void)waitForCompletionAndFinishWriting:(id *)a3 withHandler:(id)a4
{
  id v6 = a4;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v15 = "-[RPClipWriter waitForCompletionAndFinishWriting:withHandler:]";
    __int16 v16 = 1024;
    int v17 = 212;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d ",  buf,  0x12u);
  }

  clipWriterDispatchGroup = self->_clipWriterDispatchGroup;
  clipWriterQueue = (dispatch_queue_s *)self->_clipWriterQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100039F38;
  block[3] = &unk_100071D58;
  __int128 v12 = *(_OWORD *)&a3->var0;
  int64_t var3 = a3->var3;
  block[4] = self;
  id v11 = v6;
  id v9 = v6;
  dispatch_group_notify((dispatch_group_t)clipWriterDispatchGroup, clipWriterQueue, block);
}

- (void)flushClipBuffer
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    id v6 = "-[RPClipWriter flushClipBuffer]";
    __int16 v7 = 1024;
    int v8 = 231;
    __int16 v9 = 2048;
    id v10 = self;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %p",  buf,  0x1Cu);
  }

  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[RPClipWriter dispatchClipWriterQueue](self, "dispatchClipWriterQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003A1D4;
  block[3] = &unk_100070D30;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)exportClipToURL:(id)a3 duration:(double)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf.value) = 136446466;
    *(int64_t *)((char *)&buf.value + 4) = (int64_t)"-[RPClipWriter exportClipToURL:duration:completionHandler:]";
    LOWORD(buf.flags) = 1024;
    *(unsigned int *)((char *)&buf.flags + 2) = 240;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d ",  (uint8_t *)&buf,  0x12u);
  }

  __int128 v39 = *(_OWORD *)&self->_latestCMSamplePresentationTime.value;
  int64_t epoch = self->_latestCMSamplePresentationTime.epoch;
  $95D729B680665BEAEFA1D6FCA8238556 buf = self->_latestCMSamplePresentationTime;
  double Seconds = CMTimeGetSeconds((CMTime *)&buf);
  objc_storeStrong((id *)&self->_outputURL, a3);
  buf.value = 0LL;
  *(void *)&buf.timescale = &buf;
  buf.int64_t epoch = 0x3032000000LL;
  v43 = sub_10003A75C;
  v44 = sub_10003A76C;
  id v45 = 0LL;
  uint64_t v33 = 0LL;
  v34 = &v33;
  uint64_t v35 = 0x3032000000LL;
  v36 = sub_10003A75C;
  v37 = sub_10003A76C;
  id v38 = 0LL;
  uint64_t v27 = 0LL;
  v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  v30 = sub_10003A75C;
  v31 = sub_10003A76C;
  id v32 = 0LL;
  __int128 v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[RPClipWriter dispatchClipWriterQueue](self, "dispatchClipWriterQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003A774;
  block[3] = &unk_100071D80;
  block[4] = self;
  void block[5] = &buf;
  block[6] = &v33;
  block[7] = &v27;
  dispatch_sync(v12, block);

  self->_enableMic = [(id)v28[5] getTotalNumberOfSamples] != 0;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10003A7EC;
  v21[3] = &unk_100071DA8;
  p_$95D729B680665BEAEFA1D6FCA8238556 buf = &buf;
  BOOL v24 = &v33;
  v25 = &v27;
  id v13 = v10;
  id v22 = v13;
  id v14 = objc_retainBlock(v21);
  if (-[RPClipBuffer getTotalNumberOfSamples](self->_clipBufferVideo, "getTotalNumberOfSamples"))
  {
    -[RPClipWriter setupAssetWriter](self, "setupAssetWriter");
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[AVMutableMetadataItem metadataItem](&OBJC_CLASS___AVMutableMetadataItem, "metadataItem"));
    [v15 setKeySpace:AVMetadataKeySpaceQuickTimeMetadata];
    [v15 setKey:AVMetadataQuickTimeMetadataKeyAuthor];
    [v15 setValue:@"ReplayKitRecording"];
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v15, 0LL));
    -[AVAssetWriter setMetadata:](self->_assetWriter, "setMetadata:", v16);

    -[AVAssetWriter startWriting](self->_assetWriter, "startWriting");
    float v17 = Seconds;
    self->_didAppendFirstSample = 0;
    if (self->_videoInput)
    {
      id v18 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 0LL);
      -[RPClipWriter queueAndWaitForSample:withAssetInput:withBuffer:didAppendIdleFrame:]( self,  "queueAndWaitForSample:withAssetInput:withBuffer:didAppendIdleFrame:",  0,  self->_videoInput,  v18,  [*(id *)(*(void *)&buf.timescale + 40) getSamplesForDuration:v18 latestSeconds:a4 withOutputArray:v17]);
    }

    if (self->_audioInput1)
    {
      int v19 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 0LL);
      -[RPClipWriter queueAndWaitForSample:withAssetInput:withBuffer:didAppendIdleFrame:]( self,  "queueAndWaitForSample:withAssetInput:withBuffer:didAppendIdleFrame:",  1,  self->_audioInput1,  v19,  [(id)v34[5] getSamplesForDuration:v19 latestSeconds:a4 withOutputArray:v17]);
    }

    if (self->_audioInput2)
    {
      uint64_t v20 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 0LL);
      -[RPClipWriter queueAndWaitForSample:withAssetInput:withBuffer:didAppendIdleFrame:]( self,  "queueAndWaitForSample:withAssetInput:withBuffer:didAppendIdleFrame:",  2,  self->_audioInput2,  v20,  [(id)v28[5] getSamplesForDuration:v20 latestSeconds:a4 withOutputArray:v17]);
    }

    *(_OWORD *)v41 = v39;
    *(void *)&v41[16] = epoch;
    -[RPClipWriter waitForCompletionAndFinishWriting:withHandler:]( self,  "waitForCompletionAndFinishWriting:withHandler:",  v41,  v14);
  }

  else
  {
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v41 = 136446466;
      *(void *)&v41[4] = "-[RPClipWriter exportClipToURL:duration:completionHandler:]";
      *(_WORD *)&v41[12] = 1024;
      *(_DWORD *)&v41[14] = 313;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d No video samples found",  v41,  0x12u);
    }

    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError _rpUserErrorForCode:userInfo:]( &OBJC_CLASS___NSError,  "_rpUserErrorForCode:userInfo:",  -5822LL,  0LL));
    ((void (*)(void *, void *))v14[2])(v14, v15);
  }

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&buf, 8);
}

- (id)dispatchClipWriterQueue
{
  if (qword_100084830 != -1) {
    dispatch_once(&qword_100084830, &stru_100071DC8);
  }
  return (id)qword_100084828;
}

- (void).cxx_destruct
{
}

@end