@interface RPMovieWriter
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastAudio1PresentationTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastAudio2PresentationTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastVideoPresentationTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)trimVideoPresentationTime;
- (AVAssetWriter)assetWriter;
- (AVAssetWriterInput)audioInput1;
- (AVAssetWriterInput)audioInput2;
- (AVAssetWriterInput)videoInput;
- (BOOL)appendInitialSampleBuffer:(opaqueCMSampleBuffer *)a3 withTransform:(CGAffineTransform *)a4;
- (BOOL)appendVideoSampleBuffer:(opaqueCMSampleBuffer *)a3 withWindowTransform:(CGAffineTransform *)a4;
- (BOOL)didProcessFirstSample;
- (BOOL)dispatchedAppendVideoSampleBuffer:(opaqueCMSampleBuffer *)a3 withWindowTransform:(CGAffineTransform *)a4;
- (BOOL)isFinishingWriting;
- (BOOL)systemRecording;
- (CGSize)windowSize;
- (NSString)originalOutputPath;
- (NSString)outputPath;
- (NSString)videoCodecType;
- (NSURL)outputURL;
- (OS_dispatch_queue)movieSaveQueue;
- (OS_dispatch_queue)movieWriterQueue;
- (RPBroadcastConfiguration)broadcastConfig;
- (RPMovieWriter)initWithWindowSize:(CGSize)a3 outputPath:(id)a4;
- (RPMovieWriter)initWithWindowSize:(CGSize)a3 outputPath:(id)a4 videoCodecType:(id)a5;
- (double)durationInSeconds;
- (id)averageVideoBitrate;
- (id)createAssetURLFromPhotosIdentifier:(id)a3;
- (int)assetWriterStartCount;
- (opaqueCMBufferQueue)audioBufferQueue1;
- (opaqueCMBufferQueue)audioBufferQueue2;
- (opaqueCMBufferQueue)videoBufferQueue;
- (void)appendAudio1SampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)appendAudio2SampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)dealloc;
- (void)dispatchedAppendAudio1SampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)dispatchedAppendAudio2SampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)finishWritingAndSaveToCameraRollWithSessionID:(id)a3 mixAudioTracks:(BOOL)a4 handler:(id)a5;
- (void)finishWritingWithHandler:(id)a3;
- (void)notifyRecordingMayBeStopped;
- (void)notifyRecordingResumed;
- (void)saveVideoToCameraRoll:(id)a3 sessionID:(id)a4 handler:(id)a5;
- (void)saveVideoToCameraRoll:(id)a3 sessionID:(id)a4 mixAudioTracks:(BOOL)a5 handler:(id)a6;
- (void)setAssetWriter:(id)a3;
- (void)setAssetWriterStartCount:(int)a3;
- (void)setAudioBufferQueue1:(opaqueCMBufferQueue *)a3;
- (void)setAudioBufferQueue2:(opaqueCMBufferQueue *)a3;
- (void)setAudioInput1:(id)a3;
- (void)setAudioInput2:(id)a3;
- (void)setBroadcastConfig:(id)a3;
- (void)setDidProcessFirstSample:(BOOL)a3;
- (void)setDurationInSeconds:(double)a3;
- (void)setIsFinishingWriting:(BOOL)a3;
- (void)setLastAudio1PresentationTime:(id *)a3;
- (void)setLastAudio2PresentationTime:(id *)a3;
- (void)setLastVideoPresentationTime:(id *)a3;
- (void)setOriginalOutputPath:(id)a3;
- (void)setOutputPath:(id)a3;
- (void)setSystemRecording:(BOOL)a3;
- (void)setTrimVideoPresentationTime:(id *)a3;
- (void)setUpAssetWriterWithHandler:(id)a3;
- (void)setVideoBufferQueue:(opaqueCMBufferQueue *)a3;
- (void)setVideoCodecType:(id)a3;
- (void)setVideoInput:(id)a3;
- (void)setWindowSize:(CGSize)a3;
- (void)startWritingHandler:(id)a3;
- (void)trimMovieWithURL:(id)a3 startClipDuration:(double)a4 endClipDuration:(double)a5 outputFileURL:(id)a6 handler:(id)a7;
- (void)updateOutputPath;
@end

@implementation RPMovieWriter

- (RPMovieWriter)initWithWindowSize:(CGSize)a3 outputPath:(id)a4
{
  return -[RPMovieWriter initWithWindowSize:outputPath:videoCodecType:]( self,  "initWithWindowSize:outputPath:videoCodecType:",  a4,  AVVideoCodecTypeH264,  a3.width,  a3.height);
}

- (RPMovieWriter)initWithWindowSize:(CGSize)a3 outputPath:(id)a4 videoCodecType:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  id v9 = a4;
  id v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___RPMovieWriter;
  v11 = -[RPMovieWriter init](&v24, "init");
  if (v11)
  {
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136447234;
      v26 = "-[RPMovieWriter initWithWindowSize:outputPath:videoCodecType:]";
      __int16 v27 = 1024;
      int v28 = 119;
      __int16 v29 = 2048;
      v30 = v11;
      __int16 v31 = 2048;
      double v32 = width;
      __int16 v33 = 2048;
      double v34 = height;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %p window size width %.1f x height:%.1f",  buf,  0x30u);
    }

    -[RPMovieWriter setOutputPath:](v11, "setOutputPath:", v9);
    -[RPMovieWriter setOriginalOutputPath:](v11, "setOriginalOutputPath:", v9);
    -[RPMovieWriter setAssetWriterStartCount:](v11, "setAssetWriterStartCount:", 0LL);
    -[RPMovieWriter setWindowSize:](v11, "setWindowSize:", width, height);
    -[RPMovieWriter setDidProcessFirstSample:](v11, "setDidProcessFirstSample:", 0LL);
    -[RPMovieWriter setIsFinishingWriting:](v11, "setIsFinishingWriting:", 0LL);
    __int128 v22 = *(_OWORD *)&kCMTimeInvalid.value;
    CMTimeEpoch epoch = kCMTimeInvalid.epoch;
    -[RPMovieWriter setTrimVideoPresentationTime:](v11, "setTrimVideoPresentationTime:", &v22);
    -[RPMovieWriter setVideoCodecType:](v11, "setVideoCodecType:", v10);
    CallbacksForUnsortedSampleBuffers = CMBufferQueueGetCallbacksForUnsortedSampleBuffers();
    CMBufferQueueCreate(kCFAllocatorDefault, 0LL, CallbacksForUnsortedSampleBuffers, &v11->_audioBufferQueue1);
    v13 = CMBufferQueueGetCallbacksForUnsortedSampleBuffers();
    CMBufferQueueCreate(kCFAllocatorDefault, 0LL, v13, &v11->_audioBufferQueue2);
    v14 = CMBufferQueueGetCallbacksForUnsortedSampleBuffers();
    CMBufferQueueCreate(kCFAllocatorDefault, 0LL, v14, &v11->_videoBufferQueue);
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.ReplayKit.RPMovieWriterQueue", 0LL);
    movieWriterQueue = v11->_movieWriterQueue;
    v11->_movieWriterQueue = (OS_dispatch_queue *)v15;

    dispatch_queue_attr_t v17 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INTERACTIVE, 0);
    v18 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v17);
    dispatch_queue_t v19 = dispatch_queue_create("com.apple.ReplayKit.movieSaveQueue", v18);
    movieSaveQueue = v11->_movieSaveQueue;
    v11->_movieSaveQueue = (OS_dispatch_queue *)v19;
  }

  return v11;
}

- (void)startWritingHandler:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter movieWriterQueue](self, "movieWriterQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100007528;
  v7[3] = &unk_100070DC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (BOOL)appendVideoSampleBuffer:(opaqueCMSampleBuffer *)a3 withWindowTransform:(CGAffineTransform *)a4
{
  uint64_t v15 = 0LL;
  v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  char v18 = 1;
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter movieWriterQueue](self, "movieWriterQueue"));
  block[1] = 3221225472LL;
  __int128 v8 = *(_OWORD *)&a4->c;
  __int128 v12 = *(_OWORD *)&a4->a;
  block[0] = _NSConcreteStackBlock;
  block[2] = sub_1000077D4;
  block[3] = &unk_100070DE8;
  block[4] = self;
  block[5] = &v15;
  block[6] = a3;
  __int128 v9 = *(_OWORD *)&a4->tx;
  __int128 v13 = v8;
  __int128 v14 = v9;
  dispatch_sync(v7, block);

  LOBYTE(a4) = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  return (char)a4;
}

- (void)appendAudio1SampleBuffer:(opaqueCMSampleBuffer *)a3
{
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter movieWriterQueue](self, "movieWriterQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000078A0;
  v6[3] = &unk_100070E10;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(v5, v6);
}

- (void)appendAudio2SampleBuffer:(opaqueCMSampleBuffer *)a3
{
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter movieWriterQueue](self, "movieWriterQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100007924;
  v6[3] = &unk_100070E10;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(v5, v6);
}

- (void)finishWritingWithHandler:(id)a3
{
  id v4 = a3;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v10 = "-[RPMovieWriter finishWritingWithHandler:]";
    __int16 v11 = 1024;
    int v12 = 188;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d ",  buf,  0x12u);
  }

  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter movieWriterQueue](self, "movieWriterQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100007A6C;
  v7[3] = &unk_100070DC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)finishWritingAndSaveToCameraRollWithSessionID:(id)a3 mixAudioTracks:(BOOL)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    uint64_t v17 = "-[RPMovieWriter finishWritingAndSaveToCameraRollWithSessionID:mixAudioTracks:handler:]";
    __int16 v18 = 1024;
    int v19 = 263;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d ",  buf,  0x12u);
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100008188;
  v12[3] = &unk_100070E60;
  id v13 = v8;
  id v14 = v9;
  v12[4] = self;
  BOOL v15 = a4;
  id v10 = v8;
  id v11 = v9;
  -[RPMovieWriter finishWritingWithHandler:](self, "finishWritingWithHandler:", v12);
}

- (void)trimMovieWithURL:(id)a3 startClipDuration:(double)a4 endClipDuration:(double)a5 outputFileURL:(id)a6 handler:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  BOOL v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter movieWriterQueue](self, "movieWriterQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100008558;
  block[3] = &unk_100070EB0;
  id v21 = v12;
  id v22 = v14;
  id v20 = v13;
  double v23 = a4;
  double v24 = a5;
  id v16 = v12;
  id v17 = v14;
  id v18 = v13;
  dispatch_async(v15, block);
}

- (void)dealloc
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    id v8 = "-[RPMovieWriter dealloc]";
    __int16 v9 = 1024;
    int v10 = 346;
    __int16 v11 = 2048;
    id v12 = self;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %p",  buf,  0x1Cu);
  }

  audioBufferQueue1 = self->_audioBufferQueue1;
  if (audioBufferQueue1) {
    CFRelease(audioBufferQueue1);
  }
  audioBufferQueue2 = self->_audioBufferQueue2;
  if (audioBufferQueue2) {
    CFRelease(audioBufferQueue2);
  }
  videoBufferQueue = self->_videoBufferQueue;
  if (videoBufferQueue) {
    CFRelease(videoBufferQueue);
  }
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___RPMovieWriter;
  -[RPMovieWriter dealloc](&v6, "dealloc");
}

- (NSURL)outputURL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter outputPath](self, "outputPath"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v2));

  return (NSURL *)v3;
}

- (void)updateOutputPath
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter originalOutputPath](self, "originalOutputPath"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v3));

  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 pathExtension]);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v4 URLByDeletingPathExtension]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@_%d.%@",  v7,  -[RPMovieWriter assetWriterStartCount](self, "assetWriterStartCount"),  v5));
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v9 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter outputPath](self, "outputPath"));
    *(_DWORD *)buf = 136447234;
    __int16 v11 = "-[RPMovieWriter updateOutputPath]";
    __int16 v12 = 1024;
    int v13 = 362;
    __int16 v14 = 2112;
    BOOL v15 = v9;
    __int16 v16 = 2112;
    id v17 = v8;
    __int16 v18 = 1024;
    unsigned int v19 = -[RPMovieWriter assetWriterStartCount](self, "assetWriterStartCount");
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Updating the AVAssetWriter path from %@ to %@ with start count of %d",  buf,  0x2Cu);
  }

  -[RPMovieWriter setOutputPath:](self, "setOutputPath:", v8);
}

- (id)averageVideoBitrate
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"RPBitRateOverride"]);

  if (v4)
  {
    id v5 = v4;
  }

  else
  {
    -[RPMovieWriter windowSize](self, "windowSize");
    double v7 = v6 * 11.4;
    -[RPMovieWriter windowSize](self, "windowSize");
    else {
      unint64_t v9 = (uint64_t)(v7 * v8);
    }
    if (-[NSString isEqualToString:](self->_videoCodecType, "isEqualToString:", AVVideoCodecTypeHEVC)) {
      unint64_t v10 = 15000000LL;
    }
    else {
      unint64_t v10 = 25000000LL;
    }
    if (v9 <= v10)
    {
      unint64_t v10 = v9;
    }

    else if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      videoCodecType = self->_videoCodecType;
      int v14 = 136447234;
      BOOL v15 = "-[RPMovieWriter averageVideoBitrate]";
      __int16 v16 = 1024;
      int v17 = 381;
      __int16 v18 = 2048;
      unint64_t v19 = v9;
      __int16 v20 = 2048;
      unint64_t v21 = v10;
      __int16 v22 = 2112;
      double v23 = videoCodecType;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d bitrate=%ld exceed maxBitrate=%ld for videoCodecType=%@, cap at max",  (uint8_t *)&v14,  0x30u);
    }

    id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v10));
  }

  __int16 v12 = v5;

  return v12;
}

- (void)setUpAssetWriterWithHandler:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v64 = "-[RPMovieWriter setUpAssetWriterWithHandler:]";
    LOWORD(v65) = 1024;
    *(_DWORD *)((char *)&v65 + 2) = 388;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d ",  buf,  0x12u);
  }

  -[RPMovieWriter updateOutputPath](self, "updateOutputPath");
  CMBufferQueueReset(self->_videoBufferQueue);
  CMBufferQueueReset(self->_audioBufferQueue1);
  CMBufferQueueReset(self->_audioBufferQueue2);
  __int128 v59 = *(_OWORD *)&kCMTimeInvalid.value;
  __int128 v52 = v59;
  CMTimeEpoch epoch = kCMTimeInvalid.epoch;
  CMTimeEpoch v5 = epoch;
  -[RPMovieWriter setLastVideoPresentationTime:](self, "setLastVideoPresentationTime:", &v59);
  __int128 v57 = v52;
  CMTimeEpoch v58 = v5;
  -[RPMovieWriter setLastAudio1PresentationTime:](self, "setLastAudio1PresentationTime:", &v57);
  __int128 v55 = v52;
  CMTimeEpoch v56 = v5;
  -[RPMovieWriter setLastAudio2PresentationTime:](self, "setLastAudio2PresentationTime:", &v55);
  double v6 = objc_alloc(&OBJC_CLASS___AVAssetWriter);
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter outputURL](self, "outputURL"));
  id v54 = 0LL;
  double v8 = -[AVAssetWriter initWithURL:fileType:error:](v6, "initWithURL:fileType:error:", v7, AVFileTypeMPEG4, &v54);
  id v9 = v54;
  -[RPMovieWriter setAssetWriter:](self, "setAssetWriter:", v8);

  if (!v9)
  {
    __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(+[AVMutableMetadataItem metadataItem](&OBJC_CLASS___AVMutableMetadataItem, "metadataItem"));
    [v11 setKeySpace:AVMetadataKeySpaceQuickTimeMetadata];
    [v11 setKey:AVMetadataQuickTimeMetadataKeyAuthor];
    [v11 setValue:@"ReplayKitRecording"];
    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v11, 0LL));
    int v13 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter assetWriter](self, "assetWriter"));
    [v13 setMetadata:v12];

    int v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter averageVideoBitrate](self, "averageVideoBitrate"));
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = [v15 integerValue];
      *(_DWORD *)buf = 136446722;
      v64 = "-[RPMovieWriter setUpAssetWriterWithHandler:]";
      uint64_t v65 = 0x800000001AF0400LL;
      id v66 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d bit rate set to %ld",  buf,  0x1Cu);
    }

    int v17 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter videoCodecType](self, "videoCodecType"));
    unsigned __int8 v18 = [v17 isEqualToString:AVVideoCodecTypeH264];

    if ((v18 & 1) != 0)
    {
      unint64_t v19 = (id *)&AVVideoProfileLevelH264HighAutoLevel;
    }

    else
    {
      __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter videoCodecType](self, "videoCodecType"));
      unsigned int v21 = [v20 isEqualToString:AVVideoCodecTypeHEVC];

      if (!v21)
      {
        id v22 = 0LL;
LABEL_18:
        v70[0] = AVVideoExpectedSourceFrameRateKey;
        v70[1] = AVVideoProfileLevelKey;
        v71[0] = &off_100075280;
        v71[1] = v22;
        v51 = v22;
        v70[2] = AVVideoAverageBitRateKey;
        v70[3] = AVVideoMaxKeyFrameIntervalKey;
        v53 = v15;
        v71[2] = v15;
        v71[3] = &off_100075280;
        double v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v71,  v70,  4LL));
        [v14 addEntriesFromDictionary:v23];

        double v24 = (void *)objc_claimAutoreleasedReturnValue( -[RPBroadcastConfiguration videoCompressionProperties]( self->_broadcastConfig,  "videoCompressionProperties"));
        if (v24)
        {
          if (dword_100084688 <= 1
            && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446466;
            v64 = "-[RPMovieWriter setUpAssetWriterWithHandler:]";
            LOWORD(v65) = 1024;
            *(_DWORD *)((char *)&v65 + 2) = 448;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d using custom video compression properties",  buf,  0x12u);
          }

          v25 = (void *)objc_claimAutoreleasedReturnValue( -[RPBroadcastConfiguration videoCompressionProperties]( self->_broadcastConfig,  "videoCompressionProperties"));
          [v14 addEntriesFromDictionary:v25];
        }

        -[RPMovieWriter windowSize](self, "windowSize");
        else {
          uint64_t v27 = (uint64_t)v26 + 2;
        }
        double v28 = (double)(uint64_t)(v27 & 0xFFFFFFFFFFFFFFFELL);
        -[RPMovieWriter windowSize](self, "windowSize");
        else {
          uint64_t v30 = (uint64_t)v29 + 2;
        }
        double v31 = (double)(uint64_t)(v30 & 0xFFFFFFFFFFFFFFFELL);
        v68[0] = AVVideoCodecKey;
        double v32 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter videoCodecType](self, "videoCodecType"));
        v69[0] = v32;
        v68[1] = AVVideoWidthKey;
        __int16 v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v28));
        v69[1] = v33;
        v68[2] = AVVideoHeightKey;
        double v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v31));
        v68[3] = AVVideoCompressionPropertiesKey;
        v69[2] = v34;
        v69[3] = v14;
        v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v69,  v68,  4LL));

        v36 = -[AVAssetWriterInput initWithMediaType:outputSettings:]( objc_alloc(&OBJC_CLASS___AVAssetWriterInput),  "initWithMediaType:outputSettings:",  AVMediaTypeVideo,  v35);
        -[RPMovieWriter setVideoInput:](self, "setVideoInput:", v36);

        v37 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter videoInput](self, "videoInput"));
        [v37 setExpectsMediaDataInRealTime:1];

        v38 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter assetWriter](self, "assetWriter"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter videoInput](self, "videoInput"));
        [v38 addInput:v39];

        uint64_t v65 = 0LL;
        v64 = 0LL;
        id v66 = 0LL;
        int v67 = 0;
        *(_DWORD *)buf = 6619138;
        v61[0] = AVFormatIDKey;
        v61[1] = AVNumberOfChannelsKey;
        v62[0] = &off_100075298;
        v62[1] = &off_1000752B0;
        v62[2] = &off_1000754D8;
        v61[2] = AVSampleRateKey;
        v61[3] = AVChannelLayoutKey;
        v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", buf, 32LL));
        v61[4] = AVEncoderBitRateKey;
        v62[3] = v40;
        v62[4] = &off_1000752C8;
        v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v62,  v61,  5LL));

        v42 = -[AVAssetWriterInput initWithMediaType:outputSettings:]( objc_alloc(&OBJC_CLASS___AVAssetWriterInput),  "initWithMediaType:outputSettings:",  AVMediaTypeAudio,  v41);
        -[RPMovieWriter setAudioInput1:](self, "setAudioInput1:", v42);

        v43 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter audioInput1](self, "audioInput1"));
        [v43 setExpectsMediaDataInRealTime:1];

        v44 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter assetWriter](self, "assetWriter"));
        v45 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter audioInput1](self, "audioInput1"));
        [v44 addInput:v45];

        v46 = -[AVAssetWriterInput initWithMediaType:outputSettings:]( objc_alloc(&OBJC_CLASS___AVAssetWriterInput),  "initWithMediaType:outputSettings:",  AVMediaTypeAudio,  v41);
        -[RPMovieWriter setAudioInput2:](self, "setAudioInput2:", v46);

        v47 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter audioInput2](self, "audioInput2"));
        [v47 setExpectsMediaDataInRealTime:1];

        v48 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter assetWriter](self, "assetWriter"));
        v49 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter audioInput2](self, "audioInput2"));
        [v48 addInput:v49];

        if (v4)
        {
          v50 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter assetWriter](self, "assetWriter"));
          if (v50) {
            unint64_t v10 = 0LL;
          }
          else {
            unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError _rpUserErrorForCode:userInfo:]( &OBJC_CLASS___NSError,  "_rpUserErrorForCode:userInfo:",  -5824LL,  0LL));
          }

          goto LABEL_34;
        }

        goto LABEL_35;
      }

      unint64_t v19 = (id *)&kVTProfileLevel_HEVC_Main_AutoLevel;
    }

    id v22 = *v19;
    goto LABEL_18;
  }

  if (dword_100084688 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100042418(v9);
    if (!v4) {
      goto LABEL_35;
    }
    goto LABEL_8;
  }

  if (v4)
  {
LABEL_8:
    unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError _rpUserErrorForCode:userInfo:]( &OBJC_CLASS___NSError,  "_rpUserErrorForCode:userInfo:",  -5824LL,  0LL));
LABEL_34:
    v4[2](v4, v10);
  }

- (BOOL)dispatchedAppendVideoSampleBuffer:(opaqueCMSampleBuffer *)a3 withWindowTransform:(CGAffineTransform *)a4
{
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter assetWriter](self, "assetWriter"));
  double v8 = v7;
  if (!a3 || !v7)
  {

    return 1;
  }

  unsigned __int8 v9 = -[RPMovieWriter isFinishingWriting](self, "isFinishingWriting");

  if ((v9 & 1) == 0)
  {
    unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter assetWriter](self, "assetWriter"));
    if ([v10 status] == (id)1)
    {
      unsigned int v11 = -[RPMovieWriter didProcessFirstSample](self, "didProcessFirstSample");

      if (v11)
      {
        if (CMBufferQueueGetBufferCount(self->_videoBufferQueue) >= 5)
        {
          if (dword_100084688 <= 1
            && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf[0].value) = 136446466;
            *(CMTimeValue *)((char *)&buf[0].value + 4) = (CMTimeValue)"-[RPMovieWriter dispatchedAppendVideoSampleBuffer"
                                                                       ":withWindowTransform:]";
            LOWORD(buf[0].flags) = 1024;
            *(CMTimeFlags *)((char *)&buf[0].flags + 2) = 503;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Dropping oldest sample buffer from video buffer queue",  (uint8_t *)buf,  0x12u);
          }

          CMBufferRef v12 = CMBufferQueueDequeueAndRetain(self->_videoBufferQueue);
          if (v12) {
            CFRelease(v12);
          }
        }

        if (CMBufferQueueEnqueue(self->_videoBufferQueue, a3))
        {
        }

        else
        {
          id v22 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter videoInput](self, "videoInput"));
          if ([v22 isReadyForMoreMediaData])
          {
            p_lastVideoPresentationTime = &self->_lastVideoPresentationTime;
            *(void *)&__int128 v23 = 136446722LL;
            __int128 v33 = v23;
            while (1)
            {
              BOOL v25 = CMBufferQueueIsEmpty(self->_videoBufferQueue) == 0;

              if (!v25) {
                break;
              }
              double v26 = (opaqueCMSampleBuffer *)CMBufferQueueDequeueAndRetain(self->_videoBufferQueue);
              if (v26)
              {
                *(_OWORD *)&buf[0].CMTimeValue value = *(_OWORD *)&p_lastVideoPresentationTime->value;
                buf[0].CMTimeEpoch epoch = self->_lastVideoPresentationTime.epoch;
                CMTime time2 = kCMTimeInvalid;
                if (CMTimeCompare(buf, &time2))
                {
                  CMTimeValue value = p_lastVideoPresentationTime->value;
                  CMSampleBufferGetPresentationTimeStamp(&v44, v26);
                  if (value >= v44.value)
                  {
                    if (dword_100084688 <= 1
                      && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                    {
                      LODWORD(buf[0].value) = 136446466;
                      *(CMTimeValue *)((char *)&buf[0].value + 4) = (CMTimeValue)"-[RPMovieWriter dispatchedAppendVideoSa"
                                                                                 "mpleBuffer:withWindowTransform:]";
                      LOWORD(buf[0].flags) = 1024;
                      *(CMTimeFlags *)((char *)&buf[0].flags + 2) = 520;
                      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d discarding video sample buffer due to timestamp earlier than previous",  (uint8_t *)buf,  0x12u);
                    }

                    CFRelease(v26);
                    return 1;
                  }
                }

                else
                {
                  float v28 = sub_10003D0D4(a3);
                  if (dword_100084688 <= 1)
                  {
                    float v29 = v28;
                    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                    {
                      LODWORD(buf[0].value) = v33;
                      *(CMTimeValue *)((char *)&buf[0].value + 4) = (CMTimeValue)"-[RPMovieWriter dispatchedAppendVideoSa"
                                                                                 "mpleBuffer:withWindowTransform:]";
                      LOWORD(buf[0].flags) = 1024;
                      *(CMTimeFlags *)((char *)&buf[0].flags + 2) = 526;
                      WORD1(buf[0].epoch) = 2048;
                      *(double *)((char *)&buf[0].epoch + 4) = v29;
                      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d video first sample received at time %.3f",  (uint8_t *)buf,  0x1Cu);
                    }
                  }
                }

                CMSampleBufferGetPresentationTimeStamp(&v43, v26);
                CMTime v42 = v43;
                -[RPMovieWriter setLastVideoPresentationTime:](self, "setLastVideoPresentationTime:", &v42);
                if (dword_100084688 <= 1
                  && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  -[RPMovieWriter lastVideoPresentationTime](self, "lastVideoPresentationTime");
                  CMTimeEpoch v30 = v41;
                  -[RPMovieWriter lastVideoPresentationTime](self, "lastVideoPresentationTime");
                  int v31 = v40;
                  CMSampleBufferGetDuration(&v39, v26);
                  LODWORD(buf[0].value) = 136447234;
                  *(CMTimeValue *)((char *)&buf[0].value + 4) = (CMTimeValue)"-[RPMovieWriter dispatchedAppendVideoSample"
                                                                             "Buffer:withWindowTransform:]";
                  LOWORD(buf[0].flags) = 1024;
                  *(CMTimeFlags *)((char *)&buf[0].flags + 2) = 530;
                  WORD1(buf[0].epoch) = 2048;
                  *(CMTimeEpoch *)((char *)&buf[0].epoch + 4) = v30;
                  WORD2(buf[1].value) = 1024;
                  *(_DWORD *)((char *)&buf[1].value + 6) = v31;
                  HIWORD(buf[1].timescale) = 2048;
                  *(void *)&buf[1].flags = v39.value;
                  _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d appending video sample with timestamp:%lld scale:%d duration:%lld",  (uint8_t *)buf,  0x2Cu);
                }

                double v32 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter videoInput](self, "videoInput", v33));
                [v32 appendSampleBuffer:v26];

                CFRelease(v26);
              }

              id v22 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter videoInput](self, "videoInput", v33));
            }
          }

          else
          {
LABEL_40:
          }
        }

        return 1;
      }
    }

    else
    {
    }

    time2.CMTimeValue value = 0LL;
    *(void *)&time2.timescale = &time2;
    time2.CMTimeEpoch epoch = 0x2020000000LL;
    int v13 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter assetWriter](self, "assetWriter"));
    BOOL v14 = [v13 status] == (id)3;

    if (v14)
    {
      if (-[RPMovieWriter didProcessFirstSample](self, "didProcessFirstSample"))
      {
        BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        id v16 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter outputURL](self, "outputURL"));
        [v15 _srRemoveFile:v16 completion:&stru_100070ED0];
      }

      v34[1] = 3221225472LL;
      __int128 v17 = *(_OWORD *)&a4->c;
      __int128 v35 = *(_OWORD *)&a4->a;
      v34[0] = _NSConcreteStackBlock;
      v34[2] = sub_100009E94;
      v34[3] = &unk_100070EF8;
      v34[4] = self;
      v34[5] = &time2;
      v34[6] = a3;
      __int128 v18 = *(_OWORD *)&a4->tx;
      __int128 v36 = v17;
      __int128 v37 = v18;
      -[RPMovieWriter setUpAssetWriterWithHandler:](self, "setUpAssetWriterWithHandler:", v34);
    }

    else
    {
      __int128 v19 = *(_OWORD *)&a4->c;
      *(_OWORD *)&buf[0].CMTimeValue value = *(_OWORD *)&a4->a;
      *(_OWORD *)&buf[0].CMTimeEpoch epoch = v19;
      *(_OWORD *)&buf[1].timescale = *(_OWORD *)&a4->tx;
      unsigned __int8 v20 = -[RPMovieWriter appendInitialSampleBuffer:withTransform:]( self,  "appendInitialSampleBuffer:withTransform:",  a3,  buf);
      *(_BYTE *)(*(void *)&time2.timescale + 24LL) = v20;
    }

    _Block_object_dispose(&time2, 8);
  }

  return 1;
}

- (BOOL)appendInitialSampleBuffer:(opaqueCMSampleBuffer *)a3 withTransform:(CGAffineTransform *)a4
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter assetWriter](self, "assetWriter"));
    LODWORD(buf.value) = 136446722;
    *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)"-[RPMovieWriter appendInitialSampleBuffer:withTransform:]";
    LOWORD(buf.flags) = 1024;
    *(CMTimeFlags *)((char *)&buf.flags + 2) = 578;
    WORD1(buf.epoch) = 1024;
    HIDWORD(buf.epoch) = [v7 status];
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d asset writer status %d",  (uint8_t *)&buf,  0x18u);
  }

  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter assetWriter](self, "assetWriter"));
  if ([v8 status] == (id)1)
  {

    goto LABEL_11;
  }

  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter assetWriter](self, "assetWriter"));
  id v10 = [v9 status];

  if (v10 == (id)3)
  {
LABEL_11:
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter assetWriter](self, "assetWriter"));
    id v18 = [v17 status];

    if (v18 == (id)1)
    {
      CMSampleBufferGetPresentationTimeStamp(&buf, a3);
      if ((buf.flags & 1) == 0)
      {
        goto LABEL_35;
      }

      double v26 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter assetWriter](self, "assetWriter"));
      CMTime v38 = buf;
      [v26 startSessionAtSourceTime:&v38];

      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter videoInput](self, "videoInput"));
      unsigned int v28 = [v27 isReadyForMoreMediaData];

      if (v28)
      {
        float v29 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter videoInput](self, "videoInput"));
        unsigned int v30 = [v29 appendSampleBuffer:a3];

        -[RPMovieWriter setDidProcessFirstSample:](self, "setDidProcessFirstSample:", 1LL);
        if (!v30)
        {
          goto LABEL_35;
        }

        if (dword_100084688 > 1 || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
LABEL_35:
          LOBYTE(v32) = 1;
          return v32;
        }

        LODWORD(v38.value) = 136446466;
        *(CMTimeValue *)((char *)&v38.value + 4) = (CMTimeValue)"-[RPMovieWriter appendInitialSampleBuffer:withTransform:]";
        LOWORD(v38.flags) = 1024;
        *(CMTimeFlags *)((char *)&v38.flags + 2) = 603;
        int v31 = " [INFO] %{public}s:%d asset writer appended first sample";
      }

      else
      {
        LODWORD(v38.value) = 136446466;
        *(CMTimeValue *)((char *)&v38.value + 4) = (CMTimeValue)"-[RPMovieWriter appendInitialSampleBuffer:withTransform:]";
        LOWORD(v38.flags) = 1024;
        *(CMTimeFlags *)((char *)&v38.flags + 2) = 608;
        int v31 = " [INFO] %{public}s:%d asset writer started but video input not ready for data";
      }

      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  v31,  (uint8_t *)&v38,  0x12u);
      goto LABEL_35;
    }

    goto LABEL_24;
  }

  __int128 v11 = *(_OWORD *)&a4->c;
  __int128 v35 = *(_OWORD *)&a4->a;
  __int128 v36 = v11;
  __int128 v37 = *(_OWORD *)&a4->tx;
  CMBufferRef v12 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter videoInput](self, "videoInput"));
  v34[0] = v35;
  v34[1] = v36;
  v34[2] = v37;
  [v12 setTransform:v34];

  int v13 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter assetWriter](self, "assetWriter"));
  unsigned __int8 v14 = [v13 startWriting];

  if ((v14 & 1) != 0)
  {
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter assetWriter](self, "assetWriter"));
      unsigned int v16 = [v15 status];
      LODWORD(buf.value) = 136446722;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)"-[RPMovieWriter appendInitialSampleBuffer:withTransform:]";
      LOWORD(buf.flags) = 1024;
      *(CMTimeFlags *)((char *)&buf.flags + 2) = 585;
      WORD1(buf.epoch) = 1024;
      HIDWORD(buf.epoch) = v16;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d asset writer started with status %d",  (uint8_t *)&buf,  0x18u);
    }

    goto LABEL_11;
  }

  if (dword_100084688 > 2)
  {
LABEL_27:
    LOBYTE(v32) = 0;
    return v32;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100042790(self);
  }
LABEL_24:
  BOOL v32 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (v32)
  {
    sub_100042714();
    goto LABEL_27;
  }

  return v32;
}

- (void)dispatchedAppendAudio1SampleBuffer:(opaqueCMSampleBuffer *)a3
{
  CMTimeEpoch v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter assetWriter](self, "assetWriter"));
  if (!a3 || !v5) {
    goto LABEL_11;
  }
  uint64_t v21 = v5;
  unsigned __int8 v6 = -[RPMovieWriter isFinishingWriting](self, "isFinishingWriting");

  if ((v6 & 1) != 0) {
    return;
  }
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter assetWriter](self, "assetWriter"));
  if ([v22 status] != (id)1)
  {
    CMTimeEpoch v5 = v22;
LABEL_11:

    return;
  }

  unsigned int v7 = -[RPMovieWriter didProcessFirstSample](self, "didProcessFirstSample");

  if (v7)
  {
    if (CMBufferQueueEnqueue(self->_audioBufferQueue1, a3))
    {
    }

    else
    {
      double v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter audioInput1](self, "audioInput1"));
      if ([v8 isReadyForMoreMediaData])
      {
        p_lastAudio1PresentationTime = &self->_lastAudio1PresentationTime;
        *(void *)&__int128 v9 = 136446722LL;
        __int128 v20 = v9;
        while (1)
        {
          int IsEmpty = CMBufferQueueIsEmpty(self->_audioBufferQueue1);

          if (IsEmpty) {
            break;
          }
          CMBufferRef v12 = (opaqueCMSampleBuffer *)CMBufferQueueDequeueAndRetain(self->_audioBufferQueue1);
          if (v12)
          {
            int v13 = v12;
            *(_OWORD *)time1 = *(_OWORD *)&p_lastAudio1PresentationTime->value;
            *(void *)&time1[16] = self->_lastAudio1PresentationTime.epoch;
            CMTime time2 = kCMTimeInvalid;
            if (CMTimeCompare((CMTime *)time1, &time2))
            {
              CMTimeValue value = p_lastAudio1PresentationTime->value;
              CMSampleBufferGetPresentationTimeStamp(&v28, v13);
              if (value >= v28.value)
              {
                if (dword_100084688 <= 1
                  && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)time1 = 136446466;
                  *(void *)&time1[4] = "-[RPMovieWriter dispatchedAppendAudio1SampleBuffer:]";
                  *(_WORD *)&time1[12] = 1024;
                  *(_DWORD *)&time1[14] = 640;
                  _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d discarding audio 1 sample buffer due to timestamp earlier than previous",  time1,  0x12u);
                }

                CFRelease(v13);
                return;
              }
            }

            else
            {
              float v15 = sub_10003D0D4(a3);
              if (dword_100084688 <= 1)
              {
                float v16 = v15;
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)time1 = v20;
                  *(void *)&time1[4] = "-[RPMovieWriter dispatchedAppendAudio1SampleBuffer:]";
                  *(_WORD *)&time1[12] = 1024;
                  *(_DWORD *)&time1[14] = 646;
                  *(_WORD *)&time1[18] = 2048;
                  *(double *)&time1[20] = v16;
                  _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d audio first sample received at time %.3f",  time1,  0x1Cu);
                }
              }
            }

            CMSampleBufferGetPresentationTimeStamp(&v27, v13);
            CMTime v26 = v27;
            -[RPMovieWriter setLastAudio1PresentationTime:](self, "setLastAudio1PresentationTime:", &v26);
            if (dword_100084688 <= 1
              && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              -[RPMovieWriter lastAudio1PresentationTime](self, "lastAudio1PresentationTime");
              uint64_t v17 = v25;
              -[RPMovieWriter lastAudio1PresentationTime](self, "lastAudio1PresentationTime");
              int v18 = v24;
              CMSampleBufferGetDuration(&v23, v13);
              *(_DWORD *)time1 = 136447234;
              *(void *)&time1[4] = "-[RPMovieWriter dispatchedAppendAudio1SampleBuffer:]";
              *(_WORD *)&time1[12] = 1024;
              *(_DWORD *)&time1[14] = 650;
              *(_WORD *)&time1[18] = 2048;
              *(void *)&time1[20] = v17;
              __int16 v31 = 1024;
              int v32 = v18;
              __int16 v33 = 2048;
              CMTimeValue v34 = v23.value;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d appending app audio sample with timestamp:%lld scale:%d duration:%lld",  time1,  0x2Cu);
            }

            uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter audioInput1](self, "audioInput1", v20));
            [v19 appendSampleBuffer:v13];

            CFRelease(v13);
          }

          double v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter audioInput1](self, "audioInput1", v20));
        }
      }

      else
      {
LABEL_27:
      }
    }
  }

- (void)dispatchedAppendAudio2SampleBuffer:(opaqueCMSampleBuffer *)a3
{
  CMTimeEpoch v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter assetWriter](self, "assetWriter"));
  if (!a3 || !v5) {
    goto LABEL_11;
  }
  uint64_t v21 = v5;
  unsigned __int8 v6 = -[RPMovieWriter isFinishingWriting](self, "isFinishingWriting");

  if ((v6 & 1) != 0) {
    return;
  }
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter assetWriter](self, "assetWriter"));
  if ([v22 status] != (id)1)
  {
    CMTimeEpoch v5 = v22;
LABEL_11:

    return;
  }

  unsigned int v7 = -[RPMovieWriter didProcessFirstSample](self, "didProcessFirstSample");

  if (v7)
  {
    if (CMBufferQueueEnqueue(self->_audioBufferQueue2, a3))
    {
    }

    else
    {
      double v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter audioInput2](self, "audioInput2"));
      if ([v8 isReadyForMoreMediaData])
      {
        p_lastAudio2PresentationTime = &self->_lastAudio2PresentationTime;
        *(void *)&__int128 v9 = 136446722LL;
        __int128 v20 = v9;
        while (1)
        {
          int IsEmpty = CMBufferQueueIsEmpty(self->_audioBufferQueue2);

          if (IsEmpty) {
            break;
          }
          CMBufferRef v12 = (opaqueCMSampleBuffer *)CMBufferQueueDequeueAndRetain(self->_audioBufferQueue2);
          if (v12)
          {
            int v13 = v12;
            *(_OWORD *)time1 = *(_OWORD *)&p_lastAudio2PresentationTime->value;
            *(void *)&time1[16] = self->_lastAudio2PresentationTime.epoch;
            CMTime time2 = kCMTimeInvalid;
            if (CMTimeCompare((CMTime *)time1, &time2))
            {
              CMTimeValue value = p_lastAudio2PresentationTime->value;
              CMSampleBufferGetPresentationTimeStamp(&v28, v13);
              if (value >= v28.value)
              {
                if (dword_100084688 <= 1
                  && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)time1 = 136446466;
                  *(void *)&time1[4] = "-[RPMovieWriter dispatchedAppendAudio2SampleBuffer:]";
                  *(_WORD *)&time1[12] = 1024;
                  *(_DWORD *)&time1[14] = 684;
                  _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d discarding audio 2 sample buffer due to timestamp earlier than previous",  time1,  0x12u);
                }

                CFRelease(v13);
                return;
              }
            }

            else
            {
              float v15 = sub_10003D0D4(a3);
              if (dword_100084688 <= 1)
              {
                float v16 = v15;
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)time1 = v20;
                  *(void *)&time1[4] = "-[RPMovieWriter dispatchedAppendAudio2SampleBuffer:]";
                  *(_WORD *)&time1[12] = 1024;
                  *(_DWORD *)&time1[14] = 690;
                  *(_WORD *)&time1[18] = 2048;
                  *(double *)&time1[20] = v16;
                  _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d mic first sample received at time %.3f",  time1,  0x1Cu);
                }
              }
            }

            CMSampleBufferGetPresentationTimeStamp(&v27, v13);
            CMTime v26 = v27;
            -[RPMovieWriter setLastAudio2PresentationTime:](self, "setLastAudio2PresentationTime:", &v26);
            if (dword_100084688 <= 1
              && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              -[RPMovieWriter lastAudio2PresentationTime](self, "lastAudio2PresentationTime");
              uint64_t v17 = v25;
              -[RPMovieWriter lastAudio2PresentationTime](self, "lastAudio2PresentationTime");
              int v18 = v24;
              CMSampleBufferGetDuration(&v23, v13);
              *(_DWORD *)time1 = 136447234;
              *(void *)&time1[4] = "-[RPMovieWriter dispatchedAppendAudio2SampleBuffer:]";
              *(_WORD *)&time1[12] = 1024;
              *(_DWORD *)&time1[14] = 694;
              *(_WORD *)&time1[18] = 2048;
              *(void *)&time1[20] = v17;
              __int16 v31 = 1024;
              int v32 = v18;
              __int16 v33 = 2048;
              CMTimeValue v34 = v23.value;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d appending mic audio sample with timestamp:%lld scale:%d duration:%lld",  time1,  0x2Cu);
            }

            uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter audioInput2](self, "audioInput2", v20));
            [v19 appendSampleBuffer:v13];

            CFRelease(v13);
          }

          double v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPMovieWriter audioInput2](self, "audioInput2", v20));
        }
      }

      else
      {
LABEL_27:
      }
    }
  }

- (void)saveVideoToCameraRoll:(id)a3 sessionID:(id)a4 handler:(id)a5
{
}

- (void)saveVideoToCameraRoll:(id)a3 sessionID:(id)a4 mixAudioTracks:(BOOL)a5 handler:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  movieSaveQueue = (dispatch_queue_s *)self->_movieSaveQueue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10000ACE4;
  v14[3] = &unk_100070F48;
  BOOL v17 = a5;
  v14[4] = self;
  id v15 = v9;
  id v16 = v10;
  id v12 = v10;
  id v13 = v9;
  dispatch_async(movieSaveQueue, v14);
}

- (id)createAssetURLFromPhotosIdentifier:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PHObject uuidFromLocalIdentifier:](&OBJC_CLASS___PHObject, "uuidFromLocalIdentifier:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"photos://asset?uuid=%@&albumname=camera-roll",  v3));
  CMTimeEpoch v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v4));

  return v5;
}

- (void)notifyRecordingMayBeStopped
{
  __int128 v3 = v5;
  uint64_t v4 = v6;
  -[RPMovieWriter setTrimVideoPresentationTime:](self, "setTrimVideoPresentationTime:", &v3);
}

- (void)notifyRecordingResumed
{
  __int128 v2 = *(_OWORD *)&kCMTimeInvalid.value;
  CMTimeEpoch epoch = kCMTimeInvalid.epoch;
  -[RPMovieWriter setTrimVideoPresentationTime:](self, "setTrimVideoPresentationTime:", &v2);
}

- (RPBroadcastConfiguration)broadcastConfig
{
  return self->_broadcastConfig;
}

- (void)setBroadcastConfig:(id)a3
{
}

- (BOOL)systemRecording
{
  return self->_systemRecording;
}

- (void)setSystemRecording:(BOOL)a3
{
  self->_systemRecording = a3;
}

- (OS_dispatch_queue)movieWriterQueue
{
  return self->_movieWriterQueue;
}

- (OS_dispatch_queue)movieSaveQueue
{
  return self->_movieSaveQueue;
}

- (AVAssetWriter)assetWriter
{
  return self->_assetWriter;
}

- (void)setAssetWriter:(id)a3
{
}

- (AVAssetWriterInput)videoInput
{
  return self->_videoInput;
}

- (void)setVideoInput:(id)a3
{
}

- (AVAssetWriterInput)audioInput1
{
  return self->_audioInput1;
}

- (void)setAudioInput1:(id)a3
{
}

- (AVAssetWriterInput)audioInput2
{
  return self->_audioInput2;
}

- (void)setAudioInput2:(id)a3
{
}

- (NSString)outputPath
{
  return self->_outputPath;
}

- (void)setOutputPath:(id)a3
{
}

- (NSString)originalOutputPath
{
  return self->_originalOutputPath;
}

- (void)setOriginalOutputPath:(id)a3
{
}

- (int)assetWriterStartCount
{
  return self->_assetWriterStartCount;
}

- (void)setAssetWriterStartCount:(int)a3
{
  self->_assetWriterStartCount = a3;
}

- (CGSize)windowSize
{
  double width = self->_windowSize.width;
  double height = self->_windowSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setWindowSize:(CGSize)a3
{
  self->_windowSize = a3;
}

- (NSString)videoCodecType
{
  return self->_videoCodecType;
}

- (void)setVideoCodecType:(id)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastVideoPresentationTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[6];
  return self;
}

- (void)setLastVideoPresentationTime:(id *)a3
{
  __int128 v3 = *(_OWORD *)&a3->var0;
  self->_lastVideoPresentationTime.CMTimeEpoch epoch = a3->var3;
  *(_OWORD *)&self->_lastVideoPresentationTime.CMTimeValue value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastAudio1PresentationTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[7];
  return self;
}

- (void)setLastAudio1PresentationTime:(id *)a3
{
  __int128 v3 = *(_OWORD *)&a3->var0;
  self->_lastAudio1PresentationTime.CMTimeEpoch epoch = a3->var3;
  *(_OWORD *)&self->_lastAudio1PresentationTime.CMTimeValue value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastAudio2PresentationTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[8];
  return self;
}

- (void)setLastAudio2PresentationTime:(id *)a3
{
  __int128 v3 = *(_OWORD *)&a3->var0;
  self->_lastAudio2PresentationTime.CMTimeEpoch epoch = a3->var3;
  *(_OWORD *)&self->_lastAudio2PresentationTime.CMTimeValue value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)trimVideoPresentationTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[9];
  return self;
}

- (void)setTrimVideoPresentationTime:(id *)a3
{
  __int128 v3 = *(_OWORD *)&a3->var0;
  self->_trimVideoPresentationTime.CMTimeEpoch epoch = a3->var3;
  *(_OWORD *)&self->_trimVideoPresentationTime.CMTimeValue value = v3;
}

- (opaqueCMBufferQueue)audioBufferQueue1
{
  return self->_audioBufferQueue1;
}

- (void)setAudioBufferQueue1:(opaqueCMBufferQueue *)a3
{
  self->_audioBufferQueue1 = a3;
}

- (opaqueCMBufferQueue)audioBufferQueue2
{
  return self->_audioBufferQueue2;
}

- (void)setAudioBufferQueue2:(opaqueCMBufferQueue *)a3
{
  self->_audioBufferQueue2 = a3;
}

- (opaqueCMBufferQueue)videoBufferQueue
{
  return self->_videoBufferQueue;
}

- (void)setVideoBufferQueue:(opaqueCMBufferQueue *)a3
{
  self->_videoBufferQueue = a3;
}

- (BOOL)didProcessFirstSample
{
  return self->_didProcessFirstSample;
}

- (void)setDidProcessFirstSample:(BOOL)a3
{
  self->_didProcessFirstSample = a3;
}

- (BOOL)isFinishingWriting
{
  return self->_isFinishingWriting;
}

- (void)setIsFinishingWriting:(BOOL)a3
{
  self->_isFinishingWriting = a3;
}

- (double)durationInSeconds
{
  return self->_durationInSeconds;
}

- (void)setDurationInSeconds:(double)a3
{
  self->_durationInSeconds = a3;
}

- (void).cxx_destruct
{
}

  ;
}

@end