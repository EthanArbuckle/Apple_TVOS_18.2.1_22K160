@interface MRAssetPlayerMovie
- (BOOL)isMuted;
- (BOOL)isPlaying;
- (BOOL)newImageIsAvailable;
- (MRAssetPlayerMovie)initWithPath:(id)a3 size:(CGSize)a4 master:(id)a5 andOptions:(id)a6;
- (double)duration;
- (double)fadeInDuration;
- (double)fadeOutDuration;
- (double)startTime;
- (double)time;
- (double)volume;
- (id)_posterImage:(BOOL)a3;
- (id)retainedByUserImageAtTime:(double)a3 displayLinkTimestamp:(double)a4;
- (void)_finishLoadingAsset:(id)a3 andVideoTrack:(id)a4 forTime:(double)a5;
- (void)_finishLoadingAsset:(id)a3 forTime:(double)a4 completion:(id)a5;
- (void)dealloc;
- (void)loadForTime:(double)a3;
- (void)outputMediaDataWillChange:(id)a3;
- (void)setDuration:(double)a3;
- (void)setFadeInDuration:(double)a3;
- (void)setFadeOutDuration:(double)a3;
- (void)setIsMuted:(BOOL)a3;
- (void)setIsPlaying:(BOOL)a3;
- (void)setStartTime:(double)a3;
- (void)setTime:(double)a3;
- (void)setVolume:(double)a3;
@end

@implementation MRAssetPlayerMovie

- (MRAssetPlayerMovie)initWithPath:(id)a3 size:(CGSize)a4 master:(id)a5 andOptions:(id)a6
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MRAssetPlayerMovie;
  v6 = -[MRAssetPlayer initWithPath:size:master:andOptions:]( &v8,  "initWithPath:size:master:andOptions:",  a3,  a5,  a6,  a4.width,  a4.height);
  if (v6)
  {
    v6->_semaphore = -[NSConditionLock initWithCondition:]( objc_alloc(&OBJC_CLASS___NSConditionLock),  "initWithCondition:",  0LL);
    v6->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("MRAssetPlayerMovie", 0LL);
  }

  return v6;
}

- (void)dealloc
{
  self->super._image = 0LL;
  cvTextureCache = self->_cvTextureCache;
  if (cvTextureCache) {
    CVOpenGLESTextureCacheFlush(cvTextureCache, 0LL);
  }
  -[AVPlayerItemVideoOutput setDelegate:queue:](self->_videoOutput, "setDelegate:queue:", 0LL, 0LL);
  avPlayer = self->_avPlayer;
  playerItem = self->_playerItem;
  videoOutput = self->_videoOutput;
  v7 = self->_cvTextureCache;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10DCA8;
  block[3] = &unk_24E5E8;
  block[4] = avPlayer;
  block[5] = playerItem;
  block[6] = videoOutput;
  block[7] = v7;
  dispatch_async(dispatchQueue, block);
  self->_cvTextureCache = 0LL;
  self->_videoOutput = 0LL;
  self->_playerItem = 0LL;
  self->_avPlayer = 0LL;
  dispatch_release((dispatch_object_t)self->_dispatchQueue);
  self->_dispatchQueue = 0LL;

  self->_semaphore = 0LL;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MRAssetPlayerMovie;
  -[MRAssetPlayer dealloc](&v9, "dealloc");
}

- (double)time
{
  return self->super._time;
}

- (void)setTime:(double)a3
{
  if (self->super._time != a3) {
    -[AVPlayer cancelPendingPrerolls](self->_avPlayer, "cancelPendingPrerolls");
  }
  self->super._time = a3;
  BOOL v5 = a3 >= 0.0 && self->_movieDuration > a3;
  self->_isPlaying &= v5;
  if (self->_movieIsReadyToPlay)
  {
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10DE0C;
    v7[3] = &unk_24D3B8;
    v7[4] = self;
    *(double *)&v7[5] = a3;
    dispatch_sync(dispatchQueue, v7);
  }

- (void)setIsPlaying:(BOOL)a3
{
  if (self->_isPlaying != a3)
  {
    self->_isPlaying = a3;
    if (self->_movieIsReadyToPlay)
    {
      dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10DF5C;
      block[3] = &unk_24D5B0;
      block[4] = self;
      dispatch_sync(dispatchQueue, block);
    }
  }

- (void)setIsMuted:(BOOL)a3
{
  self->_isMuted = a3;
}

- (BOOL)newImageIsAvailable
{
  uint64_t v7 = 0LL;
  objc_super v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  char v10 = 0;
  if (self->_movieIsReadyToPlay)
  {
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10E0C8;
    v6[3] = &unk_24E610;
    v6[4] = self;
    v6[5] = &v7;
    dispatch_sync(dispatchQueue, v6);
  }

  BOOL v4 = self->_newImageIsAvailable || *((_BYTE *)v8 + 24) != 0;
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)loadForTime:(double)a3
{
  if (!self->_avPlayer)
  {
    BOOL v5 = -[MRAssetMaster imageManager](self->super._master, "imageManager");
    unsigned __int8 v6 = -[MRAssetMaster isEmbeddedAsset](self->super._master, "isEmbeddedAsset");
    if ((v6 & 1) != 0) {
      uint64_t v7 = 0LL;
    }
    else {
      uint64_t v7 = -[MRContext assetManager](-[MRImageManager baseContext](v5, "baseContext"), "assetManager");
    }
    objc_super v8 = (AVURLAsset *)-[MZMediaManagement avAssetForAssetAtPath:]( v7,  "avAssetForAssetAtPath:",  -[MRAssetMaster path](self->super._master, "path"));
    if (!v8)
    {
      uint64_t v9 = -[MRAssetMaster path](self->super._master, "path");
      if ((v6 & 1) == 0) {
        uint64_t v9 = (NSString *)-[MZMediaManagement absolutePathForAssetAtPath:andSize:]( v7,  "absolutePathForAssetAtPath:andSize:",  v9,  self->super._size.width,  self->super._size.height);
      }
      if (-[NSString isAbsolutePath](v9, "isAbsolutePath")) {
        char v10 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v9);
      }
      else {
        char v10 = +[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v9);
      }
      objc_super v8 = +[AVURLAsset URLAssetWithURL:options:](&OBJC_CLASS___AVURLAsset, "URLAssetWithURL:options:", v10, 0LL);
    }

    v11 = dispatch_semaphore_create(0LL);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10E2C0;
    v13[3] = &unk_24E5E8;
    v13[4] = self;
    v13[5] = v8;
    *(double *)&v13[7] = a3;
    v13[6] = v11;
    -[AVURLAsset loadValuesAsynchronouslyForKeys:completionHandler:]( v8,  "loadValuesAsynchronouslyForKeys:completionHandler:",  &off_26FA80,  v13);
    dispatch_time_t v12 = dispatch_time(0LL, 60000000000LL);
    dispatch_semaphore_wait(v11, v12);
    dispatch_release(v11);
  }

- (void)_finishLoadingAsset:(id)a3 forTime:(double)a4 completion:(id)a5
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10E3C8;
  v5[3] = &unk_24E638;
  v5[4] = self;
  v5[5] = a3;
  *(double *)&v5[8] = a4;
  v5[7] = a5;
  objc_msgSend( objc_msgSend(objc_msgSend(a3, "tracksWithMediaType:", AVMediaTypeVideo), "lastObject"),  "loadValuesAsynchronouslyForKeys:completionHandler:",  &off_26FA98,  v5);
}

- (void)_finishLoadingAsset:(id)a3 andVideoTrack:(id)a4 forTime:(double)a5
{
  id v6 = a4;
  if (a4)
  {
    [a4 preferredTransform];
  }

  else
  {
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v24 = 0u;
  }

  if (self->_startTime > 0.0)
  {
    int32_t v9 = [v6 naturalTimeScale];
    char v10 = objc_alloc_init(&OBJC_CLASS___AVMutableComposition);
    double startTime = self->_startTime;
    time.value = 0LL;
    CMTimeMake(&start, (uint64_t)(startTime * (double)v9), v9);
    CMTimeMake(&duration, (uint64_t)(self->_duration * (double)v9), v9);
    CMTimeRangeMake(&v23, &start, &duration);
    CMTime v20 = kCMTimeZero;
    if (!-[AVMutableComposition insertTimeRange:ofAsset:atTime:error:]( v10,  "insertTimeRange:ofAsset:atTime:error:",  &v23,  a3,  &v20,  &time)) {
      NSLog(@"%@", time.value);
    }
    id v6 = -[NSArray lastObject]( -[AVMutableComposition tracksWithMediaType:](v10, "tracksWithMediaType:", AVMediaTypeVideo),  "lastObject");
    if (v10) {
      goto LABEL_8;
    }
LABEL_10:
    memset(&v20, 0, sizeof(v20));
    goto LABEL_11;
  }

  char v10 = (AVMutableComposition *)a3;
  if (!a3) {
    goto LABEL_10;
  }
LABEL_8:
  -[AVMutableComposition duration](v10, "duration");
LABEL_11:
  dispatch_time_t v12 = +[AVPlayerItem playerItemWithAsset:](&OBJC_CLASS___AVPlayerItem, "playerItemWithAsset:", v10);
  self->_playerItem = v12;
  if (v12)
  {
    -[AVPlayerItem duration](v12, "duration");
    if ((time.flags & 1) != 0 && (time.flags & 0x1C) == 0 && time.value >= 1) {
      CMTime v20 = time;
    }
  }

  self->_avPlayer = -[AVPlayer initWithPlayerItem:]( objc_alloc(&OBJC_CLASS___AVPlayer),  "initWithPlayerItem:",  self->_playerItem);
  CMTime time = v20;
  self->_movieDuration = CMTimeGetSeconds(&time);
  CFStringRef v29 = kCVOpenGLESTextureCacheMaximumTextureAgeKey;
  v30 = &off_26FB00;
  v13 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v30,  &v29,  1LL);
  v14 = -[EAGLContext initWithAPI:sharegroup:]( objc_alloc(&OBJC_CLASS___EAGLContext),  "initWithAPI:sharegroup:",  2LL,  -[EAGLContext sharegroup]( -[MRImageManager imageGLContext]( -[MRAssetMaster imageManager](self->super._master, "imageManager"),  "imageGLContext"),  "sharegroup"));
  self->_textureCacheContext = v14;
  CVOpenGLESTextureCacheCreate(kCFAllocatorDefault, (CFDictionaryRef)v13, v14, 0LL, &self->_cvTextureCache);

  v28[0] = &__kCFBooleanTrue;
  v27[0] = kCVPixelFormatOpenGLESCompatibility;
  v27[1] = kCVPixelBufferPixelFormatTypeKey;
  v28[1] = +[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", 1111970369LL);
  v27[2] = kCVPixelBufferWidthKey;
  v28[2] = +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  (unint64_t)self->super._size.width);
  v27[3] = kCVPixelBufferHeightKey;
  v28[3] = +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  (unint64_t)self->super._size.height);
  v15 = -[AVPlayerItemVideoOutput initWithPixelBufferAttributes:]( objc_alloc(&OBJC_CLASS___AVPlayerItemVideoOutput),  "initWithPixelBufferAttributes:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v28,  v27,  4LL));
  self->_videoOutput = v15;
  -[AVPlayerItemVideoOutput setDelegate:queue:](v15, "setDelegate:queue:", self, self->_dispatchQueue);
  -[AVPlayerItemVideoOutput requestNotificationOfMediaDataChangeWithAdvanceInterval:]( self->_videoOutput,  "requestNotificationOfMediaDataChangeWithAdvanceInterval:",  0.0);
  -[AVPlayerItem addOutput:](self->_playerItem, "addOutput:", self->_videoOutput);
  if (v6)
  {
    if (*(double *)&v24 == 1.0)
    {
      else {
        unsigned __int8 v16 = 4;
      }
LABEL_29:
      self->_orientation = v16;
      goto LABEL_30;
    }

    if (*(double *)&v24 == -1.0)
    {
      BOOL v17 = *((double *)&v25 + 1) == 1.0;
      unsigned __int8 v16 = 3;
      char v18 = 2;
      goto LABEL_27;
    }

    if (*((double *)&v24 + 1) == 1.0)
    {
      BOOL v17 = *(double *)&v25 == 1.0;
      unsigned __int8 v16 = 6;
      char v18 = 5;
      goto LABEL_27;
    }

    if (*((double *)&v24 + 1) == -1.0)
    {
      BOOL v17 = *(double *)&v25 == 1.0;
      unsigned __int8 v16 = 7;
      char v18 = 8;
LABEL_27:
      if (v17) {
        unsigned __int8 v16 = v18;
      }
      goto LABEL_29;
    }
  }

- (id)retainedByUserImageAtTime:(double)a3 displayLinkTimestamp:(double)a4
{
  uint64_t v23 = 0LL;
  __int128 v24 = &v23;
  uint64_t v25 = 0x3052000000LL;
  __int128 v26 = sub_10EB94;
  v27 = sub_10EBA4;
  uint64_t v28 = 0LL;
  semaphore = self->_semaphore;
  if (!semaphore) {
    goto LABEL_13;
  }
  if ((!self->super._image || self->_imageIsThumbnail) && !self->super._thumbnailIsOK)
  {
    if (-[NSConditionLock lockWhenCondition:beforeDate:]( semaphore,  "lockWhenCondition:beforeDate:",  1LL,  +[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 1.0)))
    {
LABEL_8:
      -[NSConditionLock unlock](self->_semaphore, "unlock");

      self->_semaphore = 0LL;
LABEL_13:
      if (a4 < 0.0
        || (videoOutput = self->_videoOutput) == 0LL
        || (-[AVPlayerItemVideoOutput itemTimeForHostTime:](videoOutput, "itemTimeForHostTime:", a4),
            CMTimeEpoch epoch = v22.epoch,
            CMTimeValue value = v22.value,
            CMTimeFlags flags = v22.flags,
            CMTimeScale timescale = v22.timescale,
            (v22.flags & 1) == 0))
      {
        CMTimeMake(&v22, (uint64_t)(a3 * 1000000.0), 1000000);
        CMTimeValue value = v22.value;
        CMTimeFlags flags = v22.flags;
        CMTimeScale timescale = v22.timescale;
        CMTimeEpoch epoch = v22.epoch;
      }

      dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_10EBB0;
      v18[3] = &unk_24E660;
      *(double *)&v18[6] = a3;
      v18[7] = value;
      CMTimeScale v19 = timescale;
      CMTimeFlags v20 = flags;
      CMTimeEpoch v21 = epoch;
      v18[4] = self;
      v18[5] = &v23;
      dispatch_sync(dispatchQueue, v18);
      goto LABEL_18;
    }

    semaphore = self->_semaphore;
  }

  if (-[NSConditionLock tryLockWhenCondition:](semaphore, "tryLockWhenCondition:", 1LL)) {
    goto LABEL_8;
  }
  if ((char *)-[AVPlayer status](self->_avPlayer, "status") == (char *)&dword_0 + 1 && self->_isPlaying)
  {
    LODWORD(v8) = 1.0;
    -[AVPlayer setRate:](self->_avPlayer, "setRate:", v8);
  }

  if (!self->_semaphore) {
    goto LABEL_13;
  }
LABEL_18:
  if (v24[5])
  {
    BOOL v13 = 0;
  }

  else
  {
    if (self->super._image
      || (id v16 = objc_msgSend( -[MRAssetMaster thumbnailForFlagsMonochromatic:mipmap:powerOfTwo:]( self->super._master,  "thumbnailForFlagsMonochromatic:mipmap:powerOfTwo:",  self->super._isMonochromatic,  self->super._generatesMipmap,  self->super._usesPowerOfTwo),  "retainByUser"),  (v24[5] = (uint64_t)v16) == 0)
      && (id v17 = -[MRContext retainedByUserBlackImage]( -[MRImageManager baseContext]( -[MRAssetMaster imageManager](self->super._master, "imageManager"),  "baseContext"),  "retainedByUserBlackImage"),  (v24[5] = (uint64_t)v17) == 0))
    {
      id v14 = -[MRImage retainByUser](self->super._image, "retainByUser");
      v24[5] = (uint64_t)v14;
      goto LABEL_23;
    }

    BOOL v13 = 1;
  }

  objc_sync_enter(self);
  -[MRImage releaseByUser](self->super._image, "releaseByUser");
  self->super._image = (MRImage *)[(id)v24[5] retainByUser];
  self->_imageIsThumbnail = v13;
  objc_sync_exit(self);
  id v14 = (id)v24[5];
LABEL_23:
  _Block_object_dispose(&v23, 8);
  return v14;
}

- (void)outputMediaDataWillChange:(id)a3
{
  self->_newImageIsAvailable = 1;
  if (self->_movieIsReadyToPlay) {
    goto LABEL_7;
  }
  self->_movieIsReadyToPlay = 1;
  double time = self->super._time;
  if (time > 0.001)
  {
    avPlayer = self->_avPlayer;
    CMTimeMake(&v8, (uint64_t)(time * 1000000.0), 1000000);
    -[AVPlayer seekToTime:](avPlayer, "seekToTime:", &v8);
    -[AVPlayerItemVideoOutput requestNotificationOfMediaDataChangeWithAdvanceInterval:]( self->_videoOutput,  "requestNotificationOfMediaDataChangeWithAdvanceInterval:",  0.0);
    self->_newImageIsAvailable = 0;
  }

  -[AVPlayerItem setAudioTimePitchAlgorithm:]( self->_playerItem,  "setAudioTimePitchAlgorithm:",  AVAudioTimePitchAlgorithmVarispeed);
  if (self->_isPlaying)
  {
    LODWORD(v6) = 1.0;
    -[AVPlayer setRate:](self->_avPlayer, "setRate:", v6);
  }

  -[NSConditionLock lock](self->_semaphore, "lock");
  -[NSConditionLock unlockWithCondition:](self->_semaphore, "unlockWithCondition:", 1LL);
  if (self->_newImageIsAvailable)
  {
LABEL_7:
    -[MRAssetPlayerDelegate imageIsAvailableFromAssetPlayer:]( self->super._delegate,  "imageIsAvailableFromAssetPlayer:",  self);
    if (!self->_isPlaying)
    {
      LODWORD(v7) = 1.0;
      -[AVPlayer prerollAtRate:completionHandler:](self->_avPlayer, "prerollAtRate:completionHandler:", 0LL, v7);
    }
  }

- (id)_posterImage:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = -[MRAssetMaster imageManager](self->super._master, "imageManager");
  if (-[MRAssetMaster isEmbeddedAsset](self->super._master, "isEmbeddedAsset")) {
    double v6 = 0LL;
  }
  else {
    double v6 = -[MRContext assetManager](-[MRImageManager baseContext](v5, "baseContext"), "assetManager");
  }
  double v7 = -[MRAssetMaster path](self->super._master, "path");
  BOOL v8 = v3 || !self->super._thumbnailIsOK;
  id result = -[MZMediaManagement CGImageForAssetAtPath:andSize:orientation:thumbnailIfPossible:now:]( v6,  "CGImageForAssetAtPath:andSize:orientation:thumbnailIfPossible:now:",  v7,  &self->_orientation,  v3,  v8,  self->super._size.width,  self->super._size.height);
  if (result)
  {
    char v10 = -[MRTextureSource initWithCGImage:textureSize:orientation:imageManager:monochromatic:]( objc_alloc(&OBJC_CLASS___MRTextureSource),  "initWithCGImage:textureSize:orientation:imageManager:monochromatic:",  result,  self->super._size.width | ((unint64_t)self->super._size.height << 32),  0LL,  v5,  self->super._isMonochromatic);
    v11 =  -[MRImage initWithTextureSource:andSize:]( objc_alloc(&OBJC_CLASS___MRImage),  "initWithTextureSource:andSize:",  v10,  self->super._size.width,  self->super._size.height);

    return v11;
  }

  return result;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_double startTime = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_CMTime duration = a3;
}

- (BOOL)isPlaying
{
  return self->_isPlaying;
}

- (double)fadeInDuration
{
  return self->_fadeInDuration;
}

- (void)setFadeInDuration:(double)a3
{
  self->_fadeInDuration = a3;
}

- (double)fadeOutDuration
{
  return self->_fadeOutDuration;
}

- (void)setFadeOutDuration:(double)a3
{
  self->_fadeOutDuration = a3;
}

- (double)volume
{
  return self->_volume;
}

- (void)setVolume:(double)a3
{
  self->_volume = a3;
}

- (BOOL)isMuted
{
  return self->_isMuted;
}

@end