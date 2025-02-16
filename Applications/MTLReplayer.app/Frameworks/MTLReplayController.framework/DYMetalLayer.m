@interface DYMetalLayer
- (BOOL)framebufferOnly;
- (BOOL)wantsExtendedDynamicRangeContent;
- (CATransform3D)transform;
- (CGColorSpace)colorspace;
- (CGPoint)anchorPoint;
- (CGRect)bounds;
- (CGSize)drawableSize;
- (MTLDevice)device;
- (double)contentsScale;
- (id)nextDrawable;
- (id)nextDrawableWithTextureResourceIndex:(unint64_t)a3;
- (unint64_t)pixelFormat;
- (void)setAnchorPoint:(CGPoint)a3;
- (void)setBounds:(CGRect)a3;
- (void)setColorspace:(CGColorSpace *)a3;
- (void)setContentsScale:(double)a3;
- (void)setDevice:(id)a3;
- (void)setDrawableSize:(CGSize)a3;
- (void)setFramebufferOnly:(BOOL)a3;
- (void)setPixelFormat:(unint64_t)a3;
- (void)setTransform:(CATransform3D *)a3;
- (void)setWantsExtendedDynamicRangeContent:(BOOL)a3;
@end

@implementation DYMetalLayer

- (id)nextDrawable
{
  unint64_t v3 = -[DYMetalLayer pixelFormat](self, "pixelFormat");
  -[DYMetalLayer drawableSize](self, "drawableSize");
  unint64_t v5 = (unint64_t)(v4 + 0.5);
  -[DYMetalLayer drawableSize](self, "drawableSize");
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[MTLTextureDescriptor texture2DDescriptorWithPixelFormat:width:height:mipmapped:]( &OBJC_CLASS___MTLTextureDescriptor,  "texture2DDescriptorWithPixelFormat:width:height:mipmapped:",  v3,  v5,  (unint64_t)(v6 + 0.5),  0LL));
  if (-[DYMetalLayer framebufferOnly](self, "framebufferOnly")) {
    uint64_t v8 = 4LL;
  }
  else {
    uint64_t v8 = 0LL;
  }
  [v7 setUsage:v8];
  [v7 setIsDrawable:1];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DYMetalLayer device](self, "device"));
  id v10 = [v9 newTextureWithDescriptor:v7];

  [v10 setLabel:@"CAMetalLayer Drawable"];
  v11 = -[DYMetalDrawable initWithTexture:](objc_alloc(&OBJC_CLASS___DYMetalDrawable), "initWithTexture:", v10);

  return v11;
}

- (id)nextDrawableWithTextureResourceIndex:(unint64_t)a3
{
  unint64_t v5 = -[DYMetalLayer pixelFormat](self, "pixelFormat");
  -[DYMetalLayer drawableSize](self, "drawableSize");
  unint64_t v7 = (unint64_t)(v6 + 0.5);
  -[DYMetalLayer drawableSize](self, "drawableSize");
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[MTLTextureDescriptor texture2DDescriptorWithPixelFormat:width:height:mipmapped:]( &OBJC_CLASS___MTLTextureDescriptor,  "texture2DDescriptorWithPixelFormat:width:height:mipmapped:",  v5,  v7,  (unint64_t)(v8 + 0.5),  0LL));
  if (-[DYMetalLayer framebufferOnly](self, "framebufferOnly")) {
    uint64_t v10 = 4LL;
  }
  else {
    uint64_t v10 = 0LL;
  }
  [v9 setUsage:v10];
  [v9 setIsDrawable:1];
  [v9 setResourceIndex:a3];
  [v9 setForceResourceIndex:1];
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DYMetalLayer device](self, "device"));
  id v12 = [v11 newTextureWithDescriptor:v9];

  [v12 setLabel:@"CAMetalLayer Drawable"];
  v13 = -[DYMetalDrawable initWithTexture:](objc_alloc(&OBJC_CLASS___DYMetalDrawable), "initWithTexture:", v12);

  return v13;
}

- (MTLDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (CATransform3D)transform
{
  __int128 v3 = *(_OWORD *)&self[1].m31;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&self[1].m23;
  *(_OWORD *)&retstr->m33 = v3;
  __int128 v4 = *(_OWORD *)&self[1].m41;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&self[1].m33;
  *(_OWORD *)&retstr->m43 = v4;
  __int128 v5 = *(_OWORD *)&self[1].m11;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self->m43;
  *(_OWORD *)&retstr->m13 = v5;
  __int128 v6 = *(_OWORD *)&self[1].m21;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&self[1].m13;
  *(_OWORD *)&retstr->m23 = v6;
  return self;
}

- (void)setTransform:(CATransform3D *)a3
{
  __int128 v3 = *(_OWORD *)&a3->m11;
  __int128 v4 = *(_OWORD *)&a3->m13;
  __int128 v5 = *(_OWORD *)&a3->m23;
  *(_OWORD *)&self->_transform.m21 = *(_OWORD *)&a3->m21;
  *(_OWORD *)&self->_transform.m23 = v5;
  *(_OWORD *)&self->_transform.m11 = v3;
  *(_OWORD *)&self->_transform.m13 = v4;
  __int128 v6 = *(_OWORD *)&a3->m31;
  __int128 v7 = *(_OWORD *)&a3->m33;
  __int128 v8 = *(_OWORD *)&a3->m43;
  *(_OWORD *)&self->_transform.m41 = *(_OWORD *)&a3->m41;
  *(_OWORD *)&self->_transform.m43 = v8;
  *(_OWORD *)&self->_transform.m31 = v6;
  *(_OWORD *)&self->_transform.m33 = v7;
}

- (unint64_t)pixelFormat
{
  return self->_pixelFormat;
}

- (void)setPixelFormat:(unint64_t)a3
{
  self->_pixelFormat = a3;
}

- (CGSize)drawableSize
{
  double width = self->_drawableSize.width;
  double height = self->_drawableSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setDrawableSize:(CGSize)a3
{
  self->_drawableSize = a3;
}

- (CGPoint)anchorPoint
{
  double x = self->_anchorPoint.x;
  double y = self->_anchorPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setAnchorPoint:(CGPoint)a3
{
  self->_anchorPoint = a3;
}

- (BOOL)framebufferOnly
{
  return self->_framebufferOnly;
}

- (void)setFramebufferOnly:(BOOL)a3
{
  self->_framebufferOnldouble y = a3;
}

- (BOOL)wantsExtendedDynamicRangeContent
{
  return self->_wantsExtendedDynamicRangeContent;
}

- (void)setWantsExtendedDynamicRangeContent:(BOOL)a3
{
  self->_wantsExtendedDynamicRangeContent = a3;
}

- (CGRect)bounds
{
  double x = self->_bounds.origin.x;
  double y = self->_bounds.origin.y;
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  self->_bounds = a3;
}

- (double)contentsScale
{
  return self->_contentsScale;
}

- (void)setContentsScale:(double)a3
{
  self->_contentsScale = a3;
}

- (CGColorSpace)colorspace
{
  return self->_colorspace;
}

- (void)setColorspace:(CGColorSpace *)a3
{
  self->_colorspace = a3;
}

- (void).cxx_destruct
{
}

@end