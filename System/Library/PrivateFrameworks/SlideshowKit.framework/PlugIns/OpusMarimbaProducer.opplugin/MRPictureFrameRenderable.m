@interface MRPictureFrameRenderable
+ ($C3997F145DA9CFB88D7C332041F986CA)poolInfo;
- (MRImage)image;
- (NSString)where;
- (void)dealloc;
- (void)purge;
- (void)setImage:(id)a3;
- (void)setWhere:(id)a3;
@end

@implementation MRPictureFrameRenderable

+ ($C3997F145DA9CFB88D7C332041F986CA)poolInfo
{
  return ($C3997F145DA9CFB88D7C332041F986CA *)&unk_2B05D0;
}

- (void)purge
{
  self->next = 0LL;

  self->image = 0LL;
  self->where = 0LL;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRPictureFrameRenderable;
  -[MRPictureFrameRenderable dealloc](&v3, "dealloc");
}

- (MRImage)image
{
  return self->image;
}

- (void)setImage:(id)a3
{
}

- (NSString)where
{
  return self->where;
}

- (void)setWhere:(id)a3
{
}

@end