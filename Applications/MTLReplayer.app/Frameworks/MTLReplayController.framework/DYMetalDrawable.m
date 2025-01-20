@interface DYMetalDrawable
- (DYMetalDrawable)initWithTexture:(id)a3;
- (MTLTexture)texture;
- (void)setTexture:(id)a3;
@end

@implementation DYMetalDrawable

- (DYMetalDrawable)initWithTexture:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___DYMetalDrawable;
  v5 = -[DYMetalDrawable init](&v8, "init");
  v6 = v5;
  if (v5) {
    -[DYMetalDrawable setTexture:](v5, "setTexture:", v4);
  }

  return v6;
}

- (MTLTexture)texture
{
  return self->_texture;
}

- (void)setTexture:(id)a3
{
}

- (void).cxx_destruct
{
}

@end