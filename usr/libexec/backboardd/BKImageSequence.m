@interface BKImageSequence
- (BKImageSequence)initWithBasename:(id)a3 bundle:(id)a4 imageCount:(int64_t)a5 scale:(double)a6;
- (CGImage)_createImageForIndex:(unint64_t)a3 basename:(id)a4 scale:(double)a5 idiom:(id)a6 bundle:(id)a7;
- (CGImage)_imageAtIndex:(int64_t)a3;
- (NSBundle)bundle;
- (NSPointerArray)images;
- (NSString)basename;
- (NSString)idiomSuffix;
- (double)scale;
- (id)_idiomSuffix;
- (id)allImages;
- (int64_t)maximumImageCount;
- (void)_loadAllImages;
- (void)setBasename:(id)a3;
- (void)setBundle:(id)a3;
- (void)setIdiomSuffix:(id)a3;
- (void)setImages:(id)a3;
@end

@implementation BKImageSequence

- (BKImageSequence)initWithBasename:(id)a3 bundle:(id)a4 imageCount:(int64_t)a5 scale:(double)a6
{
  id v10 = a3;
  id v11 = a4;
  v21.receiver = self;
  v21.super_class = [BKImageSequence class];
  BKImageSequence *v12 = [[BKImageSequence alloc] init];
  v13 = v12;
  if (v12)
  {
    v12->_maximumImageCount = a5;
    v12->_scale = a6;
    v14 = (NSString *)[v10 copy];
    basename = v13->_basename;
    v13->_basename = v14;

    v13->_bundle = a4;
    uint64_t v16 = [NSPointerArray pointerArrayWithOptions:0LL];
    images = v13->_images;
    v13->_images = (NSPointerArray *)v16;

    [v13->_images setCount:a5];
    uint64_t v18 = [v13 _idiomSuffix];
    idiomSuffix = v13->_idiomSuffix;
    v13->_idiomSuffix = (NSString *)v18;
  }

  return v13;
}

- (id)allImages
{
  return [self->_images allObjects];
}

- (CGImage)_createImageForIndex:(unint64_t)a3 basename:(id)a4 scale:(double)a5 idiom:(id)a6 bundle:(id)a7
{
  id v11 = a4;
  id v12 = a6;
  id v13 = a7;
  id v14 = sub_10003F0B0();
  v15 = v14;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)v30 = a3;
    *(_WORD *)&v30[4] = 2114;
    *(void *)&v30[6] = v11;
    *(_WORD *)&v30[14] = 2048;
    *(double *)&v30[16] = a5;
    __int16 v31 = 2114;
    id v32 = v12;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "loading image:%d for basename:%{public}@ scale:%g idiom:%{public}@",  buf,  0x26u);
  }

  if (a5 <= 1.0)
  {
    v17 = [NSString stringWithFormat:@"%@%d%@%@", v11, a3, &stru_1000BB628, v12];
  }

  else
  {
    uint64_t v16 = [NSString stringWithFormat:@"@%dx", (int)a5];
    v17 = [NSString stringWithFormat:@"%@%d%@%@", v11, a3, v16, v12];
  }

  uint64_t v18 = (const __CFURL *)[v13 URLForResource:v17 withExtension:@".png"];
  v19 = v18;
  if (v18 && (CGImageSourceRef v20 = CGImageSourceCreateWithURL(v18, 0LL)) != 0LL)
  {
    objc_super v21 = v20;
    id v22 = sub_10003F0B0();
    v23 = v22;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)v30 = v17;
      _os_log_debug_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "Loaded: %{public}@", buf, 0xCu);
    }

    ImageAtIndex = CGImageSourceCreateImageAtIndex(v21, 0LL, 0LL);
    CFRelease(v21);
  }

  else
  {
    id v25 = sub_10003F0B0();
    os_log_s *v26 = v25;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      v28 = [v13 bundlePath];
      *(_DWORD *)buf = 138543618;
      *(void *)v30 = v17;
      *(_WORD *)&v30[8] = 2114;
      *(void *)&v30[10] = v28;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEBUG,  "Can't find requested image: %{public}@ in %{public}@",  buf,  0x16u);
    }

    ImageAtIndex = 0LL;
  }

  return ImageAtIndex;
}

- (id)_idiomSuffix
{
  return &stru_1000BB628;
}

- (CGImage)_imageAtIndex:(int64_t)a3
{
  if (self->_maximumImageCount <= a3)
  {
    id v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"imageIndex < _maximumImageCount"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      id v13 = NSStringFromSelector(a2);
      v14 = v13;
      uint64_t v16 = (objc_class *)[self class];
      v17 = NSStringFromClass(v16);
      uint64_t v18 = v17;
      *(_DWORD *)buf = 138544642;
      *(void *)CGImageSourceRef v20 = v14;
      *(_WORD *)&v20[8] = 2114;
      *(void *)&v20[10] = v18;
      *(_WORD *)&v20[18] = 2048;
      *(void *)&v20[20] = self;
      __int16 v21 = 2114;
      id v22 = @"BKImageSequence.m";
      __int16 v23 = 1024;
      int v24 = 116;
      __int16 v25 = 2114;
      v26 = v12;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
    }

    _bs_set_crash_log_message([v12 UTF8String]);
    __break(0);
    JUMPOUT(0x100028EE8LL);
  }

  id v5 = [self->_images pointerAtIndex:];
  if (!v5)
  {
    v5 = [self _createImageForIndex:a3 basename:self->_basename scale:self->_idiomSuffix bundle:self->_bundle];
    if (v5
      || -[NSString length](self->_idiomSuffix, "length")
      && (v5 = -[BKImageSequence _createImageForIndex:basename:scale:idiom:bundle:]( self,  "_createImageForIndex:basename:scale:idiom:bundle:",  a3,  self->_basename,  &stru_1000BB628,  self->_bundle,  self->_scale)) != 0LL)
    {
      [self->_images replacePointerAtIndex:a3 withPointer:v5];
      CGImageRelease(v5);
    }

    else
    {
      id v6 = sub_10003F0B0();
      os_log_s *v7 = [v6 autorelease];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        basename = self->_basename;
        double scale = self->_scale;
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)CGImageSourceRef v20 = &index;
        *(_WORD *)&v20[4] = 2114;
        *(void *)&v20[6] = basename;
        *(_WORD *)&v20[14] = 2048;
        *(double *)&v20[16] = scale;
        _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "missing image index:%d basename:%{public}@ scale:%g",  buf,  0x1Cu);
      }

      return 0LL;
    }
  }

  return v5;
}

- (void)_loadAllImages
{
  if (self->_maximumImageCount >= 1)
  {
    int64_t v3 = 0LL;
    do
      [self _imageAtIndex:v3++];
    while (v3 < self->_maximumImageCount);
  }

- (int64_t)maximumImageCount
{
  return self->_maximumImageCount;
}

- (double)scale
{
  return self->_scale;
}

- (NSPointerArray)images
{
  return self->_images;
}

- (void)setImages:(id)a3
{
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (void)setBundle:(id)a3
{
}

- (NSString)basename
{
  return self->_basename;
}

- (void)setBasename:(id)a3
{
}

- (NSString)idiomSuffix
{
  return self->_idiomSuffix;
}

- (void)setIdiomSuffix:(id)a3
{
}

- (void).cxx_destruct
{
}

@end