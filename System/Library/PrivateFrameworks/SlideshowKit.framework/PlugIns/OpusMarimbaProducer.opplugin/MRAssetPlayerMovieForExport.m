@interface MRAssetPlayerMovieForExport
- (BOOL)isMuted;
- (BOOL)isPlaying;
- (MRAssetPlayerMovieForExport)initWithPath:(id)a3 size:(CGSize)a4 master:(id)a5 andOptions:(id)a6;
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
- (void)setDuration:(double)a3;
- (void)setFadeInDuration:(double)a3;
- (void)setFadeOutDuration:(double)a3;
- (void)setIsMuted:(BOOL)a3;
- (void)setIsPlaying:(BOOL)a3;
- (void)setStartTime:(double)a3;
- (void)setTime:(double)a3;
- (void)setVolume:(double)a3;
@end

@implementation MRAssetPlayerMovieForExport

- (MRAssetPlayerMovieForExport)initWithPath:(id)a3 size:(CGSize)a4 master:(id)a5 andOptions:(id)a6
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MRAssetPlayerMovieForExport;
  v6 = -[MRAssetPlayer initWithPath:size:master:andOptions:]( &v8,  "initWithPath:size:master:andOptions:",  a3,  a5,  a6,  a4.width,  a4.height);
  if (v6)
  {
    v6->_loadingSemaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(0LL);
    v6->_nextSampleBufferTimestamp = -1.0;
  }

  return v6;
}

- (void)dealloc
{
  self->super._image = 0LL;
  cvTextureCache = self->_cvTextureCache;
  if (cvTextureCache)
  {
    CVOpenGLESTextureCacheFlush(cvTextureCache, 0LL);
    CFRelease(self->_cvTextureCache);
    self->_cvTextureCache = 0LL;
  }

  trackOutput = self->_trackOutput;
  objc_sync_enter(trackOutput);

  self->_trackOutput = 0LL;
  nextSampleBuffer = self->_nextSampleBuffer;
  if (nextSampleBuffer)
  {
    CFRelease(nextSampleBuffer);
    self->_nextSampleBuffer = 0LL;
  }

  objc_sync_exit(trackOutput);

  self->_assetReader = 0LL;
  loadingSemaphore = (dispatch_object_s *)self->_loadingSemaphore;
  if (loadingSemaphore)
  {
    dispatch_release(loadingSemaphore);
    self->_loadingSemaphore = 0LL;
  }

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MRAssetPlayerMovieForExport;
  -[MRAssetPlayer dealloc](&v7, "dealloc");
}

- (double)time
{
  return self->super._time;
}

- (void)setTime:(double)a3
{
  self->super._time = a3;
}

- (void)loadForTime:(double)a3
{
  v5 = -[MRAssetMaster imageManager](self->super._master, "imageManager");
  unsigned __int8 v6 = -[MRAssetMaster isEmbeddedAsset](self->super._master, "isEmbeddedAsset");
  if ((v6 & 1) != 0) {
    objc_super v7 = 0LL;
  }
  else {
    objc_super v7 = -[MRContext assetManager](-[MRImageManager baseContext](v5, "baseContext"), "assetManager");
  }
  objc_super v8 = (AVURLAsset *)-[MZMediaManagement avAssetForAssetAtPath:]( v7,  "avAssetForAssetAtPath:",  -[MRAssetMaster path](self->super._master, "path"));
  if (!v8)
  {
    v9 = -[MRAssetMaster path](self->super._master, "path");
    if ((v6 & 1) == 0) {
      v9 = (NSString *)-[MZMediaManagement absolutePathForAssetAtPath:andSize:]( v7,  "absolutePathForAssetAtPath:andSize:",  v9,  self->super._size.width,  self->super._size.height);
    }
    if (-[NSString isAbsolutePath](v9, "isAbsolutePath")) {
      v10 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v9);
    }
    else {
      v10 = +[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v9);
    }
    objc_super v8 = +[AVURLAsset URLAssetWithURL:options:](&OBJC_CLASS___AVURLAsset, "URLAssetWithURL:options:", v10, 0LL);
  }

  v11 = dispatch_semaphore_create(0LL);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10F4B8;
  v13[3] = &unk_24E5E8;
  v13[4] = self;
  v13[5] = v8;
  *(double *)&v13[7] = a3;
  v13[6] = v11;
  -[AVURLAsset loadValuesAsynchronouslyForKeys:completionHandler:]( v8,  "loadValuesAsynchronouslyForKeys:completionHandler:",  &off_26FAB0,  v13);
  dispatch_time_t v12 = dispatch_time(0LL, 60000000000LL);
  dispatch_semaphore_wait(v11, v12);
  dispatch_release(v11);
}

- (void)_finishLoadingAsset:(id)a3 forTime:(double)a4 completion:(id)a5
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10F5C0;
  v5[3] = &unk_24E638;
  v5[4] = self;
  v5[5] = a3;
  *(double *)&v5[8] = a4;
  v5[7] = a5;
  objc_msgSend( objc_msgSend(objc_msgSend(a3, "tracksWithMediaType:", AVMediaTypeVideo), "lastObject"),  "loadValuesAsynchronouslyForKeys:completionHandler:",  &off_26FAC8,  v5);
}

- (void)_finishLoadingAsset:(id)a3 andVideoTrack:(id)a4 forTime:(double)a5
{
  id v5 = a4;
  if (a4)
  {
    objc_msgSend(a4, "preferredTransform", a5);
  }

  else
  {
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v25 = 0u;
  }

  if (self->_startTime <= 0.0)
  {
    v9 = (AVMutableComposition *)a3;
  }

  else
  {
    int32_t v8 = [v5 naturalTimeScale];
    v9 = objc_alloc_init(&OBJC_CLASS___AVMutableComposition);
    double startTime = self->_startTime;
    uint64_t v24 = 0LL;
    CMTimeMake(&start, (uint64_t)(startTime * (double)v8), v8);
    CMTimeMake(&duration, (uint64_t)(self->_duration * (double)v8), v8);
    CMTimeRangeMake(&v23, &start, &duration);
    __int128 v19 = *(_OWORD *)&kCMTimeZero.value;
    CMTimeEpoch epoch = kCMTimeZero.epoch;
    if (!-[AVMutableComposition insertTimeRange:ofAsset:atTime:error:]( v9,  "insertTimeRange:ofAsset:atTime:error:",  &v23,  a3,  &v19,  &v24)) {
      NSLog(@"%@", v24);
    }
    id v5 = -[NSArray lastObject]( -[AVMutableComposition tracksWithMediaType:](v9, "tracksWithMediaType:", AVMediaTypeVideo),  "lastObject");
  }

  CFStringRef v30 = kCVOpenGLESTextureCacheMaximumTextureAgeKey;
  v31 = &off_26FB00;
  v11 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v31,  &v30,  1LL);
  dispatch_time_t v12 = -[EAGLContext initWithAPI:sharegroup:]( objc_alloc(&OBJC_CLASS___EAGLContext),  "initWithAPI:sharegroup:",  2LL,  -[EAGLContext sharegroup]( -[MRImageManager imageGLContext]( -[MRAssetMaster imageManager](self->super._master, "imageManager"),  "imageGLContext"),  "sharegroup"));
  self->_textureCacheContext = v12;
  CVOpenGLESTextureCacheCreate(kCFAllocatorDefault, (CFDictionaryRef)v11, v12, 0LL, &self->_cvTextureCache);

  v29[0] = &__kCFBooleanTrue;
  v28[0] = kCVPixelFormatOpenGLESCompatibility;
  v28[1] = kCVPixelBufferPixelFormatTypeKey;
  v29[1] = +[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", 1111970369LL);
  v28[2] = kCVPixelBufferWidthKey;
  v29[2] = +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  (unint64_t)self->super._size.width);
  v28[3] = kCVPixelBufferHeightKey;
  v29[3] = +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  (unint64_t)self->super._size.height);
  v13 = -[AVAssetReaderTrackOutput initWithTrack:outputSettings:]( objc_alloc(&OBJC_CLASS___AVAssetReaderTrackOutput),  "initWithTrack:outputSettings:",  v5,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v29,  v28,  4LL));
  self->_trackOutput = v13;
  -[AVAssetReaderTrackOutput setAlwaysCopiesSampleData:](v13, "setAlwaysCopiesSampleData:", 0LL);
  v14 = -[AVAssetReader initWithAsset:error:](objc_alloc(&OBJC_CLASS___AVAssetReader), "initWithAsset:error:", v9, 0LL);
  self->_assetReader = v14;
  -[AVAssetReader addOutput:](v14, "addOutput:", self->_trackOutput);
  -[AVAssetReader startReading](self->_assetReader, "startReading");
  if (v5)
  {
    if (*(double *)&v25 == 1.0)
    {
      BOOL v15 = *((double *)&v26 + 1) == 1.0;
      unsigned __int8 v16 = 4;
    }

    else
    {
      if (*(double *)&v25 != -1.0)
      {
        if (*((double *)&v25 + 1) == 1.0)
        {
          BOOL v17 = *(double *)&v26 == 1.0;
          unsigned __int8 v16 = 6;
          char v18 = 5;
        }

        else
        {
          BOOL v17 = *(double *)&v26 == 1.0;
          unsigned __int8 v16 = 7;
          char v18 = 8;
        }

        if (v17) {
          unsigned __int8 v16 = v18;
        }
        goto LABEL_17;
      }

      BOOL v15 = *((double *)&v26 + 1) == 2.0;
      unsigned __int8 v16 = 3;
    }

    if (v15) {
      unsigned __int8 v16 = 1;
    }
LABEL_17:
    self->_orientation = v16;
  }

- (id)retainedByUserImageAtTime:(double)a3 displayLinkTimestamp:(double)a4
{
  loadingSemaphore = self->_loadingSemaphore;
  if (loadingSemaphore)
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)loadingSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release((dispatch_object_t)self->_loadingSemaphore);
    self->_loadingSemaphore = 0LL;
  }

  if ((char *)-[AVAssetReader status](self->_assetReader, "status", a3, a4) == (char *)&dword_0 + 1)
  {
    trackOutput = self->_trackOutput;
    objc_sync_enter(trackOutput);
    if (self->_nextSampleBufferTimestamp <= a3)
    {
      nextSampleBuffer = 0LL;
      while (1)
      {
        if (nextSampleBuffer) {
          CFRelease(nextSampleBuffer);
        }
        nextSampleBuffer = self->_nextSampleBuffer;
        v9 = (opaqueCMSampleBuffer *)-[AVAssetReaderTrackOutput copyNextSampleBuffer]( self->_trackOutput,  "copyNextSampleBuffer");
        self->_nextSampleBuffer = v9;
        if (!v9) {
          goto LABEL_18;
        }
        uint64_t SampleTimingInfo = CMSampleBufferGetSampleTimingInfo(v9, 0LL, &timingInfoOut);
        if ((_DWORD)SampleTimingInfo || timingInfoOut.presentationTimeStamp.timescale < 1)
        {
          NSLog( @"CMSampleBufferGetSampleTimingInfo() returned error %d for valid sample %@",  SampleTimingInfo,  self->_nextSampleBuffer);
          double v11 = 1.0e100;
        }

        else
        {
          double v11 = (double)timingInfoOut.presentationTimeStamp.value
              / (double)timingInfoOut.presentationTimeStamp.timescale;
        }

        self->_nextSampleBufferTimestamp = v11;
        if (v11 > a3) {
          goto LABEL_19;
        }
      }

      self->_nextSampleBuffer = 0LL;
LABEL_18:
      self->_nextSampleBufferTimestamp = 1.0e100;
LABEL_19:
      objc_sync_exit(trackOutput);
      if (nextSampleBuffer)
      {
        ImageBuffer = CMSampleBufferGetImageBuffer(nextSampleBuffer);
        if (ImageBuffer)
        {
          v13 = ImageBuffer;
          unsigned int Width = CVPixelBufferGetWidth(ImageBuffer);
          unsigned int Height = CVPixelBufferGetHeight(v13);
          CVOpenGLESTextureCacheFlush(self->_cvTextureCache, 0LL);
          timingInfoOut.duration.value = 0LL;
          CVOpenGLESTextureCacheCreateTextureFromImage( kCFAllocatorDefault,  self->_cvTextureCache,  v13,  0LL,  0xDE1u,  6408,  Width,  Height,  0x80E1u,  0x1401u,  0LL,  (CVOpenGLESTextureRef *)&timingInfoOut);
          unsigned __int8 v16 = objc_alloc(&OBJC_CLASS___MRTextureSource);
          BOOL v17 = -[MRTextureSource initWithCVTexture:size:orientation:imageManager:monochromatic:]( v16,  "initWithCVTexture:size:orientation:imageManager:monochromatic:",  timingInfoOut.duration.value,  Width | ((unint64_t)Height << 32),  self->_orientation,  -[MRAssetMaster imageManager](self->super._master, "imageManager"),  0LL);
          CVBufferRelease((CVBufferRef)timingInfoOut.duration.value);
          char v18 = -[MRImage initWithTextureSource:andSize:]( objc_alloc(&OBJC_CLASS___MRImage),  "initWithTextureSource:andSize:",  v17,  self->super._size.width,  self->super._size.height);

          CFRelease(nextSampleBuffer);
          if (v18) {
            goto LABEL_28;
          }
        }

        else
        {
          CFRelease(nextSampleBuffer);
        }
      }
    }

    else
    {
      objc_sync_exit(trackOutput);
    }
  }

  image = self->super._image;
  if (!image)
  {
    char v18 = (MRImage *)objc_msgSend( -[MRAssetMaster thumbnailForFlagsMonochromatic:mipmap:powerOfTwo:]( self->super._master,  "thumbnailForFlagsMonochromatic:mipmap:powerOfTwo:",  self->super._isMonochromatic,  self->super._generatesMipmap,  self->super._usesPowerOfTwo),  "retainByUser");
    if (!v18)
    {
      char v18 = -[MRContext retainedByUserBlackImage]( -[MRImageManager baseContext]( -[MRAssetMaster imageManager](self->super._master, "imageManager"),  "baseContext"),  "retainedByUserBlackImage");
      if (!v18)
      {
        image = self->super._image;
        return -[MRImage retainByUser](image, "retainByUser");
      }
    }

- (id)_posterImage:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = -[MRAssetMaster imageManager](self->super._master, "imageManager");
  if (-[MRAssetMaster isEmbeddedAsset](self->super._master, "isEmbeddedAsset")) {
    unsigned __int8 v6 = 0LL;
  }
  else {
    unsigned __int8 v6 = -[MRContext assetManager](-[MRImageManager baseContext](v5, "baseContext"), "assetManager");
  }
  objc_super v7 = -[MRAssetMaster path](self->super._master, "path");
  BOOL v8 = v3 || !self->super._thumbnailIsOK;
  id result = -[MZMediaManagement CGImageForAssetAtPath:andSize:orientation:thumbnailIfPossible:now:]( v6,  "CGImageForAssetAtPath:andSize:orientation:thumbnailIfPossible:now:",  v7,  &self->_orientation,  v3,  v8,  self->super._size.width,  self->super._size.height);
  if (result)
  {
    v10 = -[MRTextureSource initWithCGImage:textureSize:orientation:imageManager:monochromatic:]( objc_alloc(&OBJC_CLASS___MRTextureSource),  "initWithCGImage:textureSize:orientation:imageManager:monochromatic:",  result,  self->super._size.width | ((unint64_t)self->super._size.height << 32),  0LL,  v5,  self->super._isMonochromatic);
    double v11 =  -[MRImage initWithTextureSource:andSize:]( objc_alloc(&OBJC_CLASS___MRImage),  "initWithTextureSource:andSize:",  v10,  self->super._size.width,  self->super._size.height);

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

- (void)setIsPlaying:(BOOL)a3
{
  self->_isPlaying = a3;
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

- (void)setIsMuted:(BOOL)a3
{
  self->_isMuted = a3;
}

@end