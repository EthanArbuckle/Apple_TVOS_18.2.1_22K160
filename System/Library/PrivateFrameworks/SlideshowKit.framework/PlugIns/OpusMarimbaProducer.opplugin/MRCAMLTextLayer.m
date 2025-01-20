@interface MRCAMLTextLayer
- (MRImage)textImage;
- (MRTextRenderer)textRenderer;
- (void)dealloc;
- (void)setTextImage:(id)a3;
- (void)setTextRenderer:(id)a3;
@end

@implementation MRCAMLTextLayer

- (void)dealloc
{
  self->textImage = 0LL;
  -[MRCAMLTextLayer setTextRenderer:](self, "setTextRenderer:", 0LL);
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRCAMLTextLayer;
  -[MRCAMLLayer dealloc](&v3, "dealloc");
}

- (void)setTextImage:(id)a3
{
  textImage = self->textImage;
  if (textImage != a3)
  {
    -[MRImage releaseByUser](textImage, "releaseByUser");
    self->textImage = (MRImage *)[a3 retainByUser];
  }

- (MRImage)textImage
{
  return self->textImage;
}

- (MRTextRenderer)textRenderer
{
  return self->textRenderer;
}

- (void)setTextRenderer:(id)a3
{
}

@end