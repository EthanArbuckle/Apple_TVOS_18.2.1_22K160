@interface MRImageManager
+ (void)cleanupPictureCache;
+ (void)initialize;
- (CGImage)CGImageWithData:(id)a3 withOriginalSize:(CGSize)a4 forSize:(CGSize)a5 orientation:(char *)a6;
- (CGImage)CGImageWithMoviePath:(id)a3 withOriginalSize:(CGSize)a4 forSize:(CGSize)a5 atTime:(double)a6 orientation:(char *)a7;
- (CGImage)CGImageWithPath:(id)a3 withOriginalSize:(CGSize)a4 forSize:(CGSize)a5 orientation:(char *)a6;
- (EAGLContext)imageGLContext;
- (MRContext)baseContext;
- (MRImageManager)initWithBaseContext:(id)a3;
- (id)_lockedMasterForAssetAtPath:(id)a3 withOptions:(id)a4;
- (id)_textureWithSize:(id)a3 isFBO:(BOOL)a4 options:(id *)a5;
- (id)fboTextureWithSize:(id)a3;
- (id)optimizedPath:(id)a3 forSize:(CGSize)a4;
- (id)retainedByUserImageWithCGContext:(CGContext *)a3;
- (id)retainedByUserImageWithSize:(CGSize)a3 andColor:(const float *)a4;
- (id)retainedByUserPlayerForAssetAtPath:(id)a3 size:(CGSize)a4 andOptions:(id)a5;
- (id)retainedByUserThumbnailForAssetAtPath:(id)a3;
- (id)textureWithSize:(id)a3 options:(id *)a4;
- (void)dealloc;
- (void)purgeResources:(BOOL)a3;
- (void)recycleTexture:(id)a3;
@end

@implementation MRImageManager

+ (void)initialize
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___MRImageManager;
  objc_msgSendSuper2(&v2, "initialize");
  if ((byte_2AE668 & 1) == 0)
  {
    byte_2AE668 = 1;
    -[NSUserDefaults BOOLForKey:]( +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"),  "BOOLForKey:",  @"MRDrawROIs");
  }

- (MRImageManager)initWithBaseContext:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MRImageManager;
  v4 = -[MRImageManager init](&v7, "init");
  v5 = v4;
  if (v4)
  {
    v4->mBaseContext = (MRContext *)a3;
    v4->mImageGLContext = -[EAGLContext initWithAPI:sharegroup:]( [EAGLContext alloc],  "initWithAPI:sharegroup:",  2,  objc_msgSend(objc_msgSend(a3, "glContext"), "sharegroup"));
    v5->mTextures = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v5->mAvailableTextures = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    v5->mRecyclableTextures = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    v5->_assetMasters = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }

  return v5;
}

- (void)dealloc
{
  self->mBaseContext = 0LL;
  mImageGLContext = self->mImageGLContext;
  if (mImageGLContext)
  {

    self->mImageGLContext = 0LL;
  }

  self->mTextures = 0LL;
  self->mAvailableTextures = 0LL;

  self->mRecyclableTextures = 0LL;
  self->_assetMasters = 0LL;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MRImageManager;
  -[MRImageManager dealloc](&v4, "dealloc");
}

- (void)purgeResources:(BOOL)a3
{
  BOOL v3 = a3;
  assetMasters = self->_assetMasters;
  objc_sync_enter(assetMasters);
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id v6 = -[NSMutableDictionary objectEnumerator](self->_assetMasters, "objectEnumerator");
  id v7 = [v6 countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v7)
  {
    v8 = 0LL;
    uint64_t v9 = *(void *)v38;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v38 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)i);
        if ([v11 purgeResources])
        {
          if (!v8) {
            v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          }
          -[NSMutableArray addObject:](v8, "addObject:", [v11 path]);
        }
      }

      id v7 = [v6 countByEnumeratingWithState:&v37 objects:v43 count:16];
    }

    while (v7);
    if (v8)
    {
      -[NSMutableDictionary removeObjectsForKeys:](self->_assetMasters, "removeObjectsForKeys:", v8);
    }
  }

  objc_sync_exit(assetMasters);
  objc_sync_enter(self);
  if (v3)
  {
    -[NSMutableSet removeAllObjects](self->mAvailableTextures, "removeAllObjects");
    -[NSMutableSet removeAllObjects](self->mRecyclableTextures, "removeAllObjects");
    -[NSMutableDictionary removeAllObjects](self->mTextures, "removeAllObjects");
  }

  else
  {
    double v12 = MRGetCurrentTime();
    id v13 = -[NSMutableSet copy](self->mAvailableTextures, "copy");
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    id v14 = [v13 countByEnumeratingWithState:&v33 objects:v42 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v34;
      do
      {
        for (j = 0LL; j != v14; j = (char *)j + 1)
        {
          if (*(void *)v34 != v15) {
            objc_enumerationMutation(v13);
          }
          v17 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)j);
          [v17 timestamp];
          if (v18 < v12 + -60.0)
          {
            if ([v17 isFBO])
            {
              v19 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"f.%dx%d",  [v17 size],  (unint64_t)objc_msgSend(v17, "size") >> 32);
            }

            else
            {
              id v20 = [v17 size];
              unint64_t v21 = (unint64_t)[v17 size];
              unsigned int v22 = [v17 pixelFormat];
              uint64_t v23 = 4LL;
              if (v22 == 40) {
                uint64_t v23 = 1LL;
              }
              v19 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"t.%dx%dx%d",  v20,  HIDWORD(v21),  v23);
            }

            id v24 = -[NSMutableDictionary objectForKey:](self->mTextures, "objectForKey:", v19);
            objc_sync_enter(v24);
            [v24 removeObject:v17];
            objc_sync_exit(v24);
            -[NSMutableSet removeObject:](self->mAvailableTextures, "removeObject:", v17);
          }
        }

        id v14 = [v13 countByEnumeratingWithState:&v33 objects:v42 count:16];
      }

      while (v14);
    }

    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    mRecyclableTextures = self->mRecyclableTextures;
    id v26 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( mRecyclableTextures,  "countByEnumeratingWithState:objects:count:",  &v29,  v41,  16LL);
    if (v26)
    {
      uint64_t v27 = *(void *)v30;
      do
      {
        for (k = 0LL; k != v26; k = (char *)k + 1)
        {
          if (*(void *)v30 != v27) {
            objc_enumerationMutation(mRecyclableTextures);
          }
          [*(id *)(*((void *)&v29 + 1) + 8 * (void)k) setTimestamp:v12];
        }

        id v26 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( mRecyclableTextures,  "countByEnumeratingWithState:objects:count:",  &v29,  v41,  16LL);
      }

      while (v26);
    }

    -[NSMutableSet unionSet:](self->mAvailableTextures, "unionSet:", self->mRecyclableTextures);
    -[NSMutableSet removeAllObjects](self->mRecyclableTextures, "removeAllObjects");
  }

  objc_sync_exit(self);
}

- (id)_textureWithSize:(id)a3 isFBO:(BOOL)a4 options:(id *)a5
{
  BOOL v6 = a4;
  if (a4)
  {
    uint64_t v9 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"f.%dx%d", a3, a3.var1, v23);
  }

  else
  {
    if (a5->var3) {
      uint64_t v10 = 1LL;
    }
    else {
      uint64_t v10 = 4LL;
    }
    uint64_t v9 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"t.%dx%dx%d",  a3,  a3.var1,  v10);
  }

  v11 = v9;
  objc_sync_enter(self);
  double v12 = (NSMutableArray *)-[NSMutableDictionary objectForKey:](self->mTextures, "objectForKey:", v11);
  id v13 = v12;
  if (!v12)
  {
    id v13 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    -[NSMutableDictionary setObject:forKey:](self->mTextures, "setObject:forKey:", v13, v11);

    objc_sync_exit(self);
LABEL_21:
    double v18 = objc_alloc(&OBJC_CLASS___MRTexture);
    mImageGLContext = self->mImageGLContext;
    if (v6) {
      id v20 = -[MRTexture initFBOWithSize:inGLContext:options:]( v18,  "initFBOWithSize:inGLContext:options:",  a3,  mImageGLContext,  a5);
    }
    else {
      id v20 = -[MRTexture initWithSize:inGLContext:options:]( v18,  "initWithSize:inGLContext:options:",  a3,  mImageGLContext,  a5);
    }
    v17 = v20;
    if (v20)
    {
      -[MRTexture setIsShared:](v20, "setIsShared:", 1LL);
      if (v6) {
        unint64_t v21 = @"Marimba FBO";
      }
      else {
        unint64_t v21 = @"Marimba Texture";
      }
      -[MRTexture setLabel:](v17, "setLabel:", v21);
      objc_sync_enter(v13);
      -[NSMutableArray addObject:](v13, "addObject:", v17);
      objc_sync_exit(v13);
    }

    return v17;
  }

  objc_sync_enter(v12);
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v24,  v28,  16LL);
  if (v14)
  {
    uint64_t v15 = *(void *)v25;
    while (2)
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(v13);
        }
        v17 = *(MRTexture **)(*((void *)&v24 + 1) + 8LL * (void)i);
        if (-[NSMutableSet containsObject:](self->mAvailableTextures, "containsObject:", v17))
        {
          -[NSMutableSet removeObject:](self->mAvailableTextures, "removeObject:", v17);
          goto LABEL_18;
        }
      }

      id v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v24,  v28,  16LL);
      if (v14) {
        continue;
      }
      break;
    }
  }

  v17 = 0LL;
LABEL_18:
  objc_sync_exit(v13);
  objc_sync_exit(self);
  if (!v17) {
    goto LABEL_21;
  }
  return v17;
}

- (id)textureWithSize:(id)a3 options:(id *)a4
{
  return -[MRImageManager _textureWithSize:isFBO:options:](self, "_textureWithSize:isFBO:options:", a3, 0LL, a4);
}

- (id)fboTextureWithSize:(id)a3
{
  return -[MRImageManager _textureWithSize:isFBO:options:](self, "_textureWithSize:isFBO:options:", a3, 1LL, 0LL);
}

- (void)recycleTexture:(id)a3
{
}

- (id)_lockedMasterForAssetAtPath:(id)a3 withOptions:(id)a4
{
  if (!a3) {
    return 0LL;
  }
  assetMasters = self->_assetMasters;
  objc_sync_enter(assetMasters);
  v8 = (MRAssetMaster *)-[NSMutableDictionary objectForKey:](self->_assetMasters, "objectForKey:", a3);
  if (v8) {
    goto LABEL_11;
  }
  uint64_t v9 = -[MRContext assetManager](self->mBaseContext, "assetManager");
  id v10 = [a4 isEmbeddedAsset];
  if ((_DWORD)v10)
  {
    [a4 resolutionIfEmbeddedAsset];
    double v12 = v11;
    double v14 = v13;
    id v15 = 0LL;
  }

  else
  {
    if ([a3 isEqualToString:@"liveCamera"])
    {
      double v14 = 720.0;
      double v12 = 1280.0;
    }

    else
    {
      -[MZMediaManagement resolutionForAssetAtPath:](v9, "resolutionForAssetAtPath:", a3);
      double v12 = v16;
      double v14 = v17;
    }

    id v15 = -[MZMediaManagement isSupportedMovieForAssetAtPath:](v9, "isSupportedMovieForAssetAtPath:", a3);
  }

  v8 = -[MRAssetMaster initWithPath:originalSize:isEmbeddedAsset:isSupportedMovie:andImageManager:]( objc_alloc(&OBJC_CLASS___MRAssetMaster),  "initWithPath:originalSize:isEmbeddedAsset:isSupportedMovie:andImageManager:",  a3,  v10,  v15,  self,  v12,  v14);
  -[MRAssetMaster setTimestamp:](v8, "setTimestamp:", 0.0);
  -[NSMutableDictionary setObject:forKey:](self->_assetMasters, "setObject:forKey:", v8, a3);

  if (v8) {
LABEL_11:
  }
    objc_sync_enter(v8);
  objc_sync_exit(assetMasters);
  return v8;
}

- (id)retainedByUserPlayerForAssetAtPath:(id)a3 size:(CGSize)a4 andOptions:(id)a5
{
  if (!a3) {
    return 0LL;
  }
  double height = a4.height;
  double width = a4.width;
  id v8 = -[MRImageManager _lockedMasterForAssetAtPath:withOptions:](self, "_lockedMasterForAssetAtPath:withOptions:");
  if (!v8) {
    return 0LL;
  }
  uint64_t v9 = v8;
  id v10 = objc_msgSend(v8, "retainedByUserPlayerForSize:andOptions:", a5, width, height);
  objc_sync_exit(v9);
  return v10;
}

- (id)retainedByUserThumbnailForAssetAtPath:(id)a3
{
  if (!a3) {
    return 0LL;
  }
  id v3 = -[MRImageManager _lockedMasterForAssetAtPath:withOptions:]( self,  "_lockedMasterForAssetAtPath:withOptions:",  a3,  0LL);
  if (!v3) {
    return 0LL;
  }
  objc_super v4 = v3;
  id v5 = objc_msgSend(objc_msgSend(v3, "thumbnail"), "retainByUser");
  objc_sync_exit(v4);
  return v5;
}

- (id)retainedByUserImageWithCGContext:(CGContext *)a3
{
  objc_super v4 = -[MRTextureSource initWithCGContext:imageManager:]( objc_alloc(&OBJC_CLASS___MRTextureSource),  "initWithCGContext:imageManager:",  a3,  self);
  id v5 = objc_alloc(&OBJC_CLASS___MRImage);
  double Width = (double)CGBitmapContextGetWidth(a3);
  id v7 = -[MRImage initWithTextureSource:andSize:]( v5,  "initWithTextureSource:andSize:",  v4,  Width,  (double)CGBitmapContextGetHeight(a3));

  -[MRImage setLabel:]( v7,  "setLabel:",  +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"Marimba CGContext"));
  return v7;
}

- (id)retainedByUserImageWithSize:(CGSize)a3 andColor:(const float *)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = -[MRTextureSource initWithSize:andColor:imageManager:]( objc_alloc(&OBJC_CLASS___MRTextureSource),  "initWithSize:andColor:imageManager:",  a3.width | ((unint64_t)a3.height << 32),  a4,  self);
  id v8 = -[MRImage initWithTextureSource:andSize:]( objc_alloc(&OBJC_CLASS___MRImage),  "initWithTextureSource:andSize:",  v7,  width,  height);

  if (a4) {
    uint64_t v9 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Marimba Color %.2f %.2f %.2f %.2f",  *a4,  a4[1],  a4[2],  a4[3]);
  }
  else {
    uint64_t v9 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Marimba",  v11,  v12,  v13,  v14);
  }
  -[MRImage setLabel:](v8, "setLabel:", v9);

  return v8;
}

- (MRContext)baseContext
{
  return self->mBaseContext;
}

- (EAGLContext)imageGLContext
{
  return self->mImageGLContext;
}

- (id)optimizedPath:(id)a3 forSize:(CGSize)a4
{
  if (a4.width < a4.height) {
    a4.double width = a4.height;
  }
  if (a4.width >= 361.984) {
    return a3;
  }
  else {
    return +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:]( &OBJC_CLASS___NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  a3,  @"%d",  0LL,  256LL);
  }
}

- (CGImage)CGImageWithPath:(id)a3 withOriginalSize:(CGSize)a4 forSize:(CGSize)a5 orientation:(char *)a6
{
  double height = a5.height;
  double width = a5.width;
  double v8 = a4.height;
  double v9 = a4.width;
  id v10 = -[MRImageManager optimizedPath:forSize:](self, "optimizedPath:forSize:", a3, a6, a5.width, a5.height);
  CGImageSourceRef v11 = CGImageSourceCreateWithURL( (CFURLRef)+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v10),  0LL);
  if (v11)
  {
    uint64_t v12 = v11;
    double v13 = v9 / width;
    if (v9 / width >= v8 / height) {
      double v13 = v8 / height;
    }
    uint64_t v14 = (uint64_t)v13;
    id v15 = -[NSMutableDictionary initWithObjectsAndKeys:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithObjectsAndKeys:",  &__kCFBooleanTrue,  @"kCGImageSourceShouldPreferRGB32",  0LL);
    if (v14 >= 2) {
      -[NSMutableDictionary setObject:forKey:]( v15,  "setObject:forKey:",  +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v14),  @"kCGImageSourceSubsampleFactor");
    }
    -[NSMutableDictionary setObject:forKey:]( v15,  "setObject:forKey:",  kCFBooleanTrue,  kCGImageSourceCreateThumbnailWithTransform);
    -[NSMutableDictionary setObject:forKey:]( v15,  "setObject:forKey:",  kCFBooleanTrue,  kCGImageSourceCreateThumbnailFromImageAlways);
    if (width >= height) {
      double v16 = width;
    }
    else {
      double v16 = height;
    }
    -[NSMutableDictionary setObject:forKey:]( v15,  "setObject:forKey:",  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", (int)v16),  kCGImageSourceThumbnailMaxPixelSize);
    CGImageRef ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(v12, 0LL, (CFDictionaryRef)v15);

    CFRelease(v12);
  }

  else
  {
    NSLog(@"Error creating image source for path '%@'.", v10);
    CGImageRef ThumbnailAtIndex = 0LL;
  }

  return ThumbnailAtIndex;
}

- (CGImage)CGImageWithData:(id)a3 withOriginalSize:(CGSize)a4 forSize:(CGSize)a5 orientation:(char *)a6
{
  double height = a5.height;
  double width = a5.width;
  double v9 = a4.height;
  double v10 = a4.width;
  CGImageSourceRef v11 = CGImageSourceCreateWithData((CFDataRef)a3, 0LL);
  if (v11)
  {
    uint64_t v12 = v11;
    CFDictionaryRef v13 = CGImageSourceCopyPropertiesAtIndex(v11, 0LL, 0LL);
    if (v13)
    {
      CFDictionaryRef v14 = v13;
      *a6 = objc_msgSend( -[__CFDictionary objectForKey:](v13, "objectForKey:", kCGImagePropertyOrientation),  "intValue");
    }

    double v15 = v10 / width;
    if (v10 / width >= v9 / height) {
      double v15 = v9 / height;
    }
    uint64_t v16 = (uint64_t)v15;
    double v17 = -[NSMutableDictionary initWithObjectsAndKeys:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithObjectsAndKeys:",  &__kCFBooleanTrue,  @"kCGImageSourceShouldPreferRGB32",  0LL);
    if (v16 >= 2) {
      -[NSMutableDictionary setObject:forKey:]( v17,  "setObject:forKey:",  +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v16),  @"kCGImageSourceSubsampleFactor");
    }
    -[NSMutableDictionary setObject:forKey:]( v17,  "setObject:forKey:",  kCFBooleanTrue,  kCGImageSourceCreateThumbnailWithTransform);
    -[NSMutableDictionary setObject:forKey:]( v17,  "setObject:forKey:",  kCFBooleanTrue,  kCGImageSourceCreateThumbnailFromImageAlways);
    if (width >= height) {
      double v18 = width;
    }
    else {
      double v18 = height;
    }
    -[NSMutableDictionary setObject:forKey:]( v17,  "setObject:forKey:",  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", (int)v18),  kCGImageSourceThumbnailMaxPixelSize);
    CGImageRef ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(v12, 0LL, (CFDictionaryRef)v17);

    CFRelease(v12);
  }

  else
  {
    NSLog(@"Error creating image source from data.");
    CGImageRef ThumbnailAtIndex = 0LL;
  }

  return ThumbnailAtIndex;
}

- (CGImage)CGImageWithMoviePath:(id)a3 withOriginalSize:(CGSize)a4 forSize:(CGSize)a5 atTime:(double)a6 orientation:(char *)a7
{
  double height = a5.height;
  double width = a5.width;
  double v10 = +[AVURLAsset URLAssetWithURL:options:]( &OBJC_CLASS___AVURLAsset,  "URLAssetWithURL:options:",  +[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", a3, a7, a4.width, a4.height),  0LL);
  CGImageSourceRef v11 = -[AVAssetImageGenerator initWithAsset:](objc_alloc(&OBJC_CLASS___AVAssetImageGenerator), "initWithAsset:", v10);
  uint64_t v12 = v11;
  if (a6 >= 0.0)
  {
    __int128 v36 = *(_OWORD *)&kCMTimeZero.value;
    __int128 v22 = v36;
    CMTimeEpoch epoch = kCMTimeZero.epoch;
    CMTimeEpoch v13 = epoch;
    -[AVAssetImageGenerator setRequestedTimeToleranceBefore:](v11, "setRequestedTimeToleranceBefore:", &v36);
    __int128 v34 = v22;
    CMTimeEpoch v35 = v13;
    -[AVAssetImageGenerator setRequestedTimeToleranceAfter:](v12, "setRequestedTimeToleranceAfter:", &v34);
  }

  -[AVAssetImageGenerator setMaximumSize:](v12, "setMaximumSize:", width, height);
  -[AVAssetImageGenerator setAppliesPreferredTrackTransform:](v12, "setAppliesPreferredTrackTransform:", 1LL);
  id v33 = 0LL;
  if (v10)
  {
    -[AVURLAsset duration](v10, "duration");
    int32_t v14 = timescale[0];
    uint64_t v15 = v30;
  }

  else
  {
    uint64_t v15 = 0LL;
    int32_t v14 = 0;
    uint64_t v30 = 0LL;
    *(void *)timescale = 0LL;
    uint64_t v32 = 0LL;
  }

  double v16 = (double)v14 * a6;
  if (a6 < 0.0) {
    double v16 = 0.0;
  }
  else {
    int64_t v17 = (uint64_t)v16;
  }
  CMTimeMake(&v29, v17, v14);
  double v18 = -[AVAssetImageGenerator copyCGImageAtTime:actualTime:error:]( v12,  "copyCGImageAtTime:actualTime:error:",  &v29,  0LL,  &v33);
  if (v33)
  {
    id v19 = [v33 code];
    if (a6 >= 0.0 && v19 == (id)-11832LL)
    {
      __int128 v27 = *(_OWORD *)&kCMTimePositiveInfinity.value;
      __int128 v23 = v27;
      CMTimeEpoch v28 = kCMTimePositiveInfinity.epoch;
      CMTimeEpoch v20 = v28;
      -[AVAssetImageGenerator setRequestedTimeToleranceBefore:](v12, "setRequestedTimeToleranceBefore:", &v27);
      __int128 v25 = v23;
      CMTimeEpoch v26 = v20;
      -[AVAssetImageGenerator setRequestedTimeToleranceAfter:](v12, "setRequestedTimeToleranceAfter:", &v25);
      if (v18) {
        CGImageRelease(v18);
      }
      CMTimeMake(&v24, v17, timescale[0]);
      double v18 = -[AVAssetImageGenerator copyCGImageAtTime:actualTime:error:]( v12,  "copyCGImageAtTime:actualTime:error:",  &v24,  0LL,  &v33);
    }
  }

  return v18;
}

+ (void)cleanupPictureCache
{
  objc_super v2 = objc_autoreleasePoolPush();
  +[NSThread setThreadPriority:](&OBJC_CLASS___NSThread, "setThreadPriority:", 0.1);
  id v3 = +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults");
  if (-[NSUserDefaults objectForKey:](v3, "objectForKey:", @"MRImageManagerMaxUntouchedAgeForCachedPictures"))
  {
    -[NSUserDefaults doubleForKey:](v3, "doubleForKey:", @"MRImageManagerMaxUntouchedAgeForCachedPictures");
    double v5 = v4;
  }

  else
  {
    double v5 = 3000000.0;
  }

  if (-[NSUserDefaults objectForKey:]( v3,  "objectForKey:",  @"MRImageManagerTimeToWaitBeforeCleaningUpPictureCache"))
  {
    -[NSUserDefaults doubleForKey:](v3, "doubleForKey:", @"MRImageManagerTimeToWaitBeforeCleaningUpPictureCache");
    unsigned int v7 = v6;
  }

  else
  {
    unsigned int v7 = 300;
  }

  sleep(v7);
  double v8 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
  id v9 = objc_msgSend( -[NSArray lastObject](NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1), "lastObject"),  "stringByAppendingPathComponent:",  @"com.apple.iLifeSlideshow/Pictures");
  -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( v8,  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  v9,  1LL,  0LL,  0LL);
  double v10 = -[NSFileManager subpathsOfDirectoryAtPath:error:](v8, "subpathsOfDirectoryAtPath:error:", v9, 0LL);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v11 = -[NSArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      int32_t v14 = 0LL;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = [v9 stringByAppendingPathComponent:*(void *)(*((void *)&v17 + 1) + 8 * (void)v14)];
        objc_msgSend( -[NSDictionary objectForKey:]( -[NSFileManager attributesOfItemAtPath:error:](v8, "attributesOfItemAtPath:error:", v15, 0),  "objectForKey:",  NSFileModificationDate),  "timeIntervalSinceNow");
        if (v5 < -v16) {
          -[NSFileManager removeItemAtPath:error:](v8, "removeItemAtPath:error:", v15, 0LL);
        }
        int32_t v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = -[NSArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
    }

    while (v12);
  }

  objc_autoreleasePoolPop(v2);
  pthread_setname_np("");
}

@end