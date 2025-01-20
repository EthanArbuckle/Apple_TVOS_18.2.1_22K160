@interface DYCAMetalLayerWrapper
- (DYCAMetalLayerWrapper)init;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)nextDrawable;
- (id)nextDrawableWithTextureResourceIndex:(unint64_t)a3;
@end

@implementation DYCAMetalLayerWrapper

- (DYCAMetalLayerWrapper)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___DYCAMetalLayerWrapper;
  v2 = -[DYCAMetalLayerWrapper init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___CAMetalLayer);
    layer = v2->_layer;
    v2->_layer = v3;
  }

  return v2;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_layer;
}

- (id)nextDrawable
{
  return -[CAMetalLayer nextDrawable](self->_layer, "nextDrawable");
}

- (id)nextDrawableWithTextureResourceIndex:(unint64_t)a3
{
  MTLPixelFormat v5 = -[CAMetalLayer pixelFormat](self->_layer, "pixelFormat");
  -[CAMetalLayer drawableSize](self->_layer, "drawableSize");
  unint64_t v7 = (unint64_t)(v6 + 0.5);
  -[CAMetalLayer drawableSize](self->_layer, "drawableSize");
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[MTLTextureDescriptor texture2DDescriptorWithPixelFormat:width:height:mipmapped:]( &OBJC_CLASS___MTLTextureDescriptor,  "texture2DDescriptorWithPixelFormat:width:height:mipmapped:",  v5,  v7,  (unint64_t)(v8 + 0.5),  0LL));
  if (-[CAMetalLayer framebufferOnly](self->_layer, "framebufferOnly")) {
    uint64_t v10 = 4LL;
  }
  else {
    uint64_t v10 = 0LL;
  }
  [v9 setUsage:v10];
  [v9 setResourceIndex:a3];
  [v9 setForceResourceIndex:1];
  [v9 setIsDrawable:1];
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CAMetalLayer nextDrawable](self->_layer, "nextDrawable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 texture]);
  id v13 = [v12 iosurface];

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CAMetalLayer device](self->_layer, "device"));
  id v15 = [v14 newTextureWithDescriptor:v9 iosurface:v13 plane:0];

  [v15 setLabel:@"CAMetalLayer Drawable"];
  v16 = -[DYMetalDrawable initWithTexture:](objc_alloc(&OBJC_CLASS___DYMetalDrawable), "initWithTexture:", v15);

  return v16;
}

- (void).cxx_destruct
{
}

@end