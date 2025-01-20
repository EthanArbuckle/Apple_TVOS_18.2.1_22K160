@interface MRFrame
+ (id)retainedFrameWithFrameID:(id)a3 forSlideProvider:(id)a4;
- (BOOL)isAlphaFriendly;
- (BOOL)isInfinite;
- (BOOL)isLoadedForTime:(double)a3;
- (BOOL)isNative3D;
- (BOOL)isOpaque;
- (BOOL)isRetainedBySlideProvider;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (CGSize)pixelSize;
- (MRFrame)initWithFrameID:(id)a3;
- (MRImage)inputImage;
- (NSDictionary)attributes;
- (NSString)frameID;
- (id)patchworkAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (id)retainedByUserRenderedImageAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)cleanup;
- (void)dealloc;
- (void)releaseBySlideProvider:(id)a3;
- (void)retainBySlideProvider:(id)a3;
- (void)setAttributes:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setPixelSize:(CGSize)a3;
- (void)unload;
@end

@implementation MRFrame

+ (id)retainedFrameWithFrameID:(id)a3 forSlideProvider:(id)a4
{
  id v5 = objc_msgSend( +[MRFrameManager sharedManager](MRFrameManager, "sharedManager"),  "frameWithFrameID:",  a3);
  [v5 retainBySlideProvider:a4];
  return v5;
}

- (MRFrame)initWithFrameID:(id)a3
{
  v4 = -[MRFrame init](self, "init");
  if (v4)
  {
    v4->mFrameID = (NSString *)[a3 copy];
    v4->mDescription = (NSDictionary *) objc_msgSend( +[MPFrameManager sharedManager]( MPFrameManager,  "sharedManager"),  "descriptionForFrameID:",  v4->mFrameID);
    v4->mAttributes = 0LL;
    v4->mInputImage = 0LL;
    v4->mOutputImage = 0LL;
    v4->mPixelSize = CGSizeZero;
  }

  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRFrame;
  -[MRFrame dealloc](&v3, "dealloc");
}

- (void)cleanup
{
  if (self->mSlideProvider) {
    -[MRFrame releaseBySlideProvider:](self, "releaseBySlideProvider:");
  }

  self->mFrameID = 0LL;
  self->mDescription = 0LL;
}

- (void)retainBySlideProvider:(id)a3
{
  self->mSlideProvider = (MRSlideProvider *)a3;
}

- (void)releaseBySlideProvider:(id)a3
{
  self->mSlideProvider = 0LL;

  self->mAttributes = 0LL;
  self->mFlattenedAttributes = 0LL;
  -[MRFrame unload](self, "unload");
  objc_msgSend(+[MRFrameManager sharedManager](MRFrameManager, "sharedManager"), "recycleFrame:", self);
}

- (BOOL)isRetainedBySlideProvider
{
  return self->mSlideProvider != 0LL;
}

- (void)setInputImage:(id)a3
{
  mInputImage = self->mInputImage;
  if (mInputImage != a3)
  {
    -[MRImage releaseByUser](mInputImage, "releaseByUser");
    self->mInputImage = (MRImage *)[a3 retainByUser];
    -[MRImage releaseByUser](self->mOutputImage, "releaseByUser");
    self->mOutputImage = 0LL;
  }

- (void)setAttributes:(id)a3
{
  if (self->mAttributes != a3)
  {

    id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v6 = objc_msgSend( +[MPFrameManager sharedManager](MPFrameManager, "sharedManager"),  "attributesForFrameID:andPresetID:",  self->mFrameID,  objc_msgSend(a3, "objectForKey:", @"PresetID"));
    if (v6) {
      -[NSMutableDictionary addEntriesFromDictionary:](v5, "addEntriesFromDictionary:", v6);
    }
    id v7 = [a3 objectForKey:@"specificAttributes"];
    if (v7) {
      -[NSMutableDictionary addEntriesFromDictionary:](v5, "addEntriesFromDictionary:", v7);
    }
    self->mFlattenedAttributes = &v5->super;
  }

- (void)setPixelSize:(CGSize)a3
{
  if (a3.width != self->mPixelSize.width || a3.height != self->mPixelSize.height)
  {
    self->mPixelSize = a3;
    -[MRFrame unload](self, "unload");
  }

- (BOOL)isLoadedForTime:(double)a3
{
  return 1;
}

- (void)unload
{
  self->mInputImage = 0LL;
  -[MRImage releaseByUser](self->mOutputImage, "releaseByUser");
  self->mOutputImage = 0LL;
}

- (BOOL)isNative3D
{
  return objc_msgSend( -[NSDictionary objectForKey:](self->mDescription, "objectForKey:", @"isNative3D"),  "BOOLValue");
}

- (BOOL)isOpaque
{
  return objc_msgSend( -[NSDictionary objectForKey:](self->mDescription, "objectForKey:", @"isOpaque"),  "BOOLValue");
}

- (BOOL)isAlphaFriendly
{
  if (-[NSDictionary objectForKey:](self->mDescription, "objectForKey:", @"isAlphaFriendly")) {
    return objc_msgSend( -[NSDictionary objectForKey:]( self->mDescription,  "objectForKey:",  @"isAlphaFriendly"),  "BOOLValue");
  }
  else {
    return 1;
  }
}

- (BOOL)isInfinite
{
  return 0;
}

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  return 0;
}

- (id)retainedByUserRenderedImageAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  return 0LL;
}

- (id)patchworkAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (self->mPixelSize.width <= 0.0 || self->mPixelSize.height <= 0.0) {
    return 0LL;
  }
  id v6 = -[MRFrame retainedByUserRenderedImageAtTime:inContext:withArguments:]( self,  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a4,  a5,  a3);
  [a4 localAspectRatio];
  v8 = -[NSDictionary initWithObjectsAndKeys:]( [NSDictionary alloc],  "initWithObjectsAndKeys:",  [v6 insertingInCollection],  @"image",  +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", -1.0, 2.0 / v7 * -0.5, 2.0, 2.0 / v7),  @"rectangle",  0);
  v9 = +[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v8);

  [v6 releaseByUser];
  return v9;
}

- (MRImage)inputImage
{
  return self->mInputImage;
}

- (NSString)frameID
{
  return self->mFrameID;
}

- (NSDictionary)attributes
{
  return self->mAttributes;
}

- (CGSize)pixelSize
{
  double width = self->mPixelSize.width;
  double height = self->mPixelSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

@end