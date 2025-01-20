@interface MRFlipupRenderable
+ ($C3997F145DA9CFB88D7C332041F986CA)poolInfo;
- (MRCroppingSprite)reflectionSprite;
- (MRCroppingSprite)sprite;
- (MRImage)slide;
- (void)dealloc;
- (void)purge;
- (void)setReflectionSprite:(id)a3;
- (void)setSlide:(id)a3;
- (void)setSprite:(id)a3;
@end

@implementation MRFlipupRenderable

+ ($C3997F145DA9CFB88D7C332041F986CA)poolInfo
{
  return ($C3997F145DA9CFB88D7C332041F986CA *)&unk_2B0490;
}

- (void)purge
{
  self->slide = 0LL;

  self->sprite = 0LL;
  self->reflectionSprite = 0LL;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRFlipupRenderable;
  -[MRFlipupRenderable dealloc](&v3, "dealloc");
}

- (MRImage)slide
{
  return self->slide;
}

- (void)setSlide:(id)a3
{
}

- (MRCroppingSprite)sprite
{
  return self->sprite;
}

- (void)setSprite:(id)a3
{
}

- (MRCroppingSprite)reflectionSprite
{
  return self->reflectionSprite;
}

- (void)setReflectionSprite:(id)a3
{
}

@end