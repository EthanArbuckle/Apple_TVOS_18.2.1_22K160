@interface MRShiftingTilesRenderable
- (MRCroppingSprite)sprite;
- (MRImage)slide;
- (void)dealloc;
- (void)setSlide:(id)a3;
- (void)setSprite:(id)a3;
@end

@implementation MRShiftingTilesRenderable

- (void)dealloc
{
  self->slide = 0LL;
  self->sprite = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRShiftingTilesRenderable;
  -[MRShiftingTilesRenderable dealloc](&v3, "dealloc");
}

- (void)setSlide:(id)a3
{
  slide = self->slide;
  if (slide != a3)
  {
    -[MRImage releaseByUser](slide, "releaseByUser");
    self->slide = (MRImage *)[a3 retainByUser];
  }

- (MRImage)slide
{
  return self->slide;
}

- (MRCroppingSprite)sprite
{
  return self->sprite;
}

- (void)setSprite:(id)a3
{
}

@end