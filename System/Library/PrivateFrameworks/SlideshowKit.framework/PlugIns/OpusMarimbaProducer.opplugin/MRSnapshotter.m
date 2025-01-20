@interface MRSnapshotter
+ (id)snapshotterWithDocument:(id)a3;
- (BOOL)ignoresFadeInAndOut;
- (BOOL)isFlipped;
- (CGColorSpace)colorSpace;
- (CGImage)CGImageSnapshotAtState:(id)a3;
- (CGImage)CGImageSnapshotAtTime:(double)a3;
- (CGImage)_CGImageSnapshot;
- (CGSize)size;
- (MRSnapshotter)initWithMontage:(id)a3 andAssetManagementDelegate:(id)a4 isReadOnly:(BOOL)a5;
- (double)fadeOutDuration;
- (double)fadeOutStartTime;
- (double)timeQuantum;
- (void)_snapshotToBuffer:(unsigned int *)a3 withBytesPerRow:(unsigned int)a4;
- (void)dealloc;
- (void)setFadeOutDuration:(double)a3;
- (void)setFadeOutStartTime:(double)a3;
- (void)setIgnoresFadeInAndOut:(BOOL)a3;
- (void)setIsFlipped:(BOOL)a3;
- (void)setSize:(CGSize)a3;
- (void)setTimeQuantum:(double)a3;
- (void)snapshotToBuffer:(unsigned int *)a3 withBytesPerRow:(unsigned int)a4 atTime:(double)a5;
@end

@implementation MRSnapshotter

+ (id)snapshotterWithDocument:(id)a3
{
  return  -[MRSnapshotter initWithMontage:andAssetManagementDelegate:isReadOnly:]( [MRSnapshotter alloc],  "initWithMontage:andAssetManagementDelegate:isReadOnly:",  [a3 montage],  a3,  1);
}

- (MRSnapshotter)initWithMontage:(id)a3 andAssetManagementDelegate:(id)a4 isReadOnly:(BOOL)a5
{
  BOOL v5 = a5;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MRSnapshotter;
  v8 = -[MRSnapshotter init](&v11, "init");
  if (v8)
  {
    v9 = -[MRRenderer initWithParameters:]( objc_alloc(&OBJC_CLASS___MRRenderer),  "initWithParameters:",  +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v5),  @"readonly",  &__kCFBooleanTrue,  @"noAudio",  0LL));
    v8->_renderer = v9;
    -[MRRenderer setMontage:](v9, "setMontage:", a3);
    -[MRRenderer setAssetManagementDelegate:](v8->_renderer, "setAssetManagementDelegate:", a4);
    -[MRRenderer setMode:](v8->_renderer, "setMode:", 1LL);
    -[MRRenderer setAllowsThumbnails:](v8->_renderer, "setAllowsThumbnails:", 0LL);
    -[MRRenderer setTimeQuantum:](v8->_renderer, "setTimeQuantum:", 0.0166666667);
  }

  return v8;
}

- (void)dealloc
{
  self->_renderer = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRSnapshotter;
  -[MRSnapshotter dealloc](&v3, "dealloc");
}

- (void)setSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (a3.width != self->_size.width || a3.height != self->_size.height)
  {
    if (self->_texture)
    {
      -[MRRenderer setEAGLContext:](self->_renderer, "setEAGLContext:", 0LL);

      self->_texture = 0LL;
      self->_context = 0LL;
    }

    self->_size.double width = width;
    self->_size.double height = height;
    if (width >= 1.0 && height >= 1.0)
    {
      self->_context = -[EAGLContext initWithAPI:](objc_alloc(&OBJC_CLASS___EAGLContext), "initWithAPI:", 2LL);
      v8 = -[MRTexture initFBOWithSize:inGLContext:options:]( objc_alloc(&OBJC_CLASS___MRTexture),  "initFBOWithSize:inGLContext:options:",  self->_size.width | ((unint64_t)self->_size.height << 32),  self->_context,  0LL);
      self->_texture = v8;
      -[MRTexture setLabel:](v8, "setLabel:", @"Marimba Snapshotter");
      -[MRRenderer setEAGLContext:]( self->_renderer,  "setEAGLContext:",  -[MRTexture glContext](self->_texture, "glContext"));
      -[MRContext setIsFlipped:](-[MRRenderer context](self->_renderer, "context"), "setIsFlipped:", 1LL);
      -[MRRenderer setSize:](self->_renderer, "setSize:", self->_size.width, self->_size.height);
    }
  }

- (BOOL)isFlipped
{
  return -[MRContext isFlipped](-[MRRenderer context](self->_renderer, "context"), "isFlipped");
}

- (void)setIsFlipped:(BOOL)a3
{
}

- (double)timeQuantum
{
  return result;
}

- (void)setTimeQuantum:(double)a3
{
}

- (CGColorSpace)colorSpace
{
  return -[MRContext colorSpace](-[MRRenderer context](self->_renderer, "context"), "colorSpace");
}

- (void)setIgnoresFadeInAndOut:(BOOL)a3
{
  self->_ignoresFadeInAndOut = a3;
  renderer = self->_renderer;
  if (a3) {
    -[MRRenderer disableFadeInAndOut](renderer, "disableFadeInAndOut");
  }
  else {
    -[MRRenderer resetFadeInAndOut](renderer, "resetFadeInAndOut");
  }
}

- (double)fadeOutDuration
{
  return result;
}

- (void)setFadeOutDuration:(double)a3
{
}

- (double)fadeOutStartTime
{
  return result;
}

- (void)setFadeOutStartTime:(double)a3
{
}

- (void)_snapshotToBuffer:(unsigned int *)a3 withBytesPerRow:(unsigned int)a4
{
  if (self->_texture)
  {
    -[MRRenderer requestRendering:](self->_renderer, "requestRendering:", 1LL, *(void *)&a4);
    v6 = -[MRRenderer renderDispatchQueue](self->_renderer, "renderDispatchQueue");
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_A650;
    v7[3] = &unk_24D3B8;
    v7[4] = self;
    v7[5] = a3;
    dispatch_sync((dispatch_queue_t)v6, v7);
  }

- (CGImage)_CGImageSnapshot
{
  if (!self->_texture) {
    return 0LL;
  }
  size_t v3 = 4 * self->_size.width;
  size_t v4 = v3 * self->_size.height;
  BOOL v5 = malloc(v4);
  -[MRSnapshotter _snapshotToBuffer:withBytesPerRow:](self, "_snapshotToBuffer:withBytesPerRow:", v5, v3);
  v6 = CGDataProviderCreateWithData(0LL, v5, v4, (CGDataProviderReleaseDataCallback)MyCGImageBufferReleaseCallback);
  CGImageRef v7 = CGImageCreate( (unint64_t)self->_size.width,  (unint64_t)self->_size.height,  8uLL,  0x20uLL,  v3,  -[MRContext colorSpace](-[MRRenderer context](self->_renderer, "context"), "colorSpace"),  1u,  v6,  0LL,  0,  kCGRenderingIntentDefault);
  CGDataProviderRelease(v6);
  return v7;
}

- (void)snapshotToBuffer:(unsigned int *)a3 withBytesPerRow:(unsigned int)a4 atTime:(double)a5
{
  uint64_t v5 = *(void *)&a4;
  -[MRRenderer setTime:](self->_renderer, "setTime:", a5);
  -[MRSnapshotter _snapshotToBuffer:withBytesPerRow:](self, "_snapshotToBuffer:withBytesPerRow:", a3, v5);
}

- (CGImage)CGImageSnapshotAtTime:(double)a3
{
  return -[MRSnapshotter _CGImageSnapshot](self, "_CGImageSnapshot");
}

- (CGImage)CGImageSnapshotAtState:(id)a3
{
  return -[MRSnapshotter _CGImageSnapshot](self, "_CGImageSnapshot");
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)ignoresFadeInAndOut
{
  return self->_ignoresFadeInAndOut;
}

@end