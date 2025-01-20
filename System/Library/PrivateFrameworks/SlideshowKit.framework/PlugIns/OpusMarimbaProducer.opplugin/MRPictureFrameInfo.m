@interface MRPictureFrameInfo
- (NSString)aspectRatio;
- (void)dealloc;
- (void)setAspectRatio:(id)a3;
@end

@implementation MRPictureFrameInfo

- (void)dealloc
{
  self->aspectRatio = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRPictureFrameInfo;
  -[MRPictureFrameInfo dealloc](&v3, "dealloc");
}

- (NSString)aspectRatio
{
  return self->aspectRatio;
}

- (void)setAspectRatio:(id)a3
{
}

@end