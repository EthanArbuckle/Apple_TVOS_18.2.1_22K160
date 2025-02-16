@interface GTMTLTextureRenderEncoderCommand
- (BOOL)depthStencil;
- (BOOL)overlay;
- (BOOL)shrinkToFit;
- (CATransform3D)transform;
- (CGPoint)anchor;
- (CGRect)bounds;
- (GTMTLTextureRenderEncoderCommand)init;
- (MTLTexture)texture;
- (double)contentsScale;
- (id)copyWithZone:(_NSZone *)a3;
- (unsigned)rgb;
- (void)setAnchor:(CGPoint)a3;
- (void)setBounds:(CGRect)a3;
- (void)setContentsScale:(double)a3;
- (void)setDepthStencil:(BOOL)a3;
- (void)setOverlay:(BOOL)a3;
- (void)setRgb:(unsigned int)a3;
- (void)setShrinkToFit:(BOOL)a3;
- (void)setTexture:(id)a3;
- (void)setTransform:(CATransform3D *)a3;
@end

@implementation GTMTLTextureRenderEncoderCommand

- (GTMTLTextureRenderEncoderCommand)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___GTMTLTextureRenderEncoderCommand;
  v2 = -[GTMTLTextureRenderEncoderCommand init](&v11, "init");
  v3 = (GTMTLTextureRenderEncoderCommand *)v2;
  if (v2)
  {
    __int128 v4 = *(_OWORD *)&CATransform3DIdentity.m33;
    *(_OWORD *)(v2 + 72) = *(_OWORD *)&CATransform3DIdentity.m31;
    *(_OWORD *)(v2 + 88) = v4;
    __int128 v5 = *(_OWORD *)&CATransform3DIdentity.m43;
    *(_OWORD *)(v2 + 104) = *(_OWORD *)&CATransform3DIdentity.m41;
    *(_OWORD *)(v2 + 120) = v5;
    __int128 v6 = *(_OWORD *)&CATransform3DIdentity.m13;
    *(_OWORD *)(v2 + 8) = *(_OWORD *)&CATransform3DIdentity.m11;
    *(_OWORD *)(v2 + 24) = v6;
    __int128 v7 = *(_OWORD *)&CATransform3DIdentity.m23;
    *(_OWORD *)(v2 + 40) = *(_OWORD *)&CATransform3DIdentity.m21;
    *(_OWORD *)(v2 + 56) = v7;
    CGPoint origin = CGRectZero.origin;
    *(CGSize *)(v2 + 152) = CGRectZero.size;
    *(CGPoint *)(v2 + 136) = origin;
    *(CGPoint *)(v2 + 168) = CGPointZero;
    v9 = (void *)*((void *)v2 + 23);
    *((void *)v2 + 23) = 0LL;

    v3->_contentsScale = 1.0;
    v3->_rgb = -1;
    *(_WORD *)&v3->_depthStencil = 0;
  }

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  __int128 v4 = objc_alloc_init(&OBJC_CLASS___GTMTLTextureRenderEncoderCommand);
  __int128 v5 = *(_OWORD *)&self->_transform.m33;
  v10[4] = *(_OWORD *)&self->_transform.m31;
  v10[5] = v5;
  __int128 v6 = *(_OWORD *)&self->_transform.m43;
  v10[6] = *(_OWORD *)&self->_transform.m41;
  v10[7] = v6;
  __int128 v7 = *(_OWORD *)&self->_transform.m13;
  v10[0] = *(_OWORD *)&self->_transform.m11;
  v10[1] = v7;
  __int128 v8 = *(_OWORD *)&self->_transform.m23;
  v10[2] = *(_OWORD *)&self->_transform.m21;
  v10[3] = v8;
  -[GTMTLTextureRenderEncoderCommand setTransform:](v4, "setTransform:", v10);
  -[GTMTLTextureRenderEncoderCommand setBounds:]( v4,  "setBounds:",  self->_bounds.origin.x,  self->_bounds.origin.y,  self->_bounds.size.width,  self->_bounds.size.height);
  -[GTMTLTextureRenderEncoderCommand setAnchor:](v4, "setAnchor:", self->_anchor.x, self->_anchor.y);
  -[GTMTLTextureRenderEncoderCommand setTexture:](v4, "setTexture:", self->_texture);
  -[GTMTLTextureRenderEncoderCommand setContentsScale:](v4, "setContentsScale:", self->_contentsScale);
  -[GTMTLTextureRenderEncoderCommand setRgb:](v4, "setRgb:", self->_rgb);
  -[GTMTLTextureRenderEncoderCommand setDepthStencil:](v4, "setDepthStencil:", self->_depthStencil);
  -[GTMTLTextureRenderEncoderCommand setOverlay:](v4, "setOverlay:", self->_overlay);
  -[GTMTLTextureRenderEncoderCommand setShrinkToFit:](v4, "setShrinkToFit:", self->_shrinkToFit);
  return v4;
}

- (CATransform3D)transform
{
  return result;
}

- (void)setTransform:(CATransform3D *)a3
{
}

- (CGRect)bounds
{
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_bounds, &v3, 32LL, 1, 0);
}

- (CGPoint)anchor
{
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setAnchor:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->_anchor, &v3, 16LL, 1, 0);
}

- (MTLTexture)texture
{
  return (MTLTexture *)objc_getProperty(self, a2, 184LL, 1);
}

- (void)setTexture:(id)a3
{
}

- (double)contentsScale
{
  return self->_contentsScale;
}

- (void)setContentsScale:(double)a3
{
  self->_contentsScale = a3;
}

- (unsigned)rgb
{
  return self->_rgb;
}

- (void)setRgb:(unsigned int)a3
{
  self->_rgb = a3;
}

- (BOOL)depthStencil
{
  return self->_depthStencil;
}

- (void)setDepthStencil:(BOOL)a3
{
  self->_depthStencil = a3;
}

- (BOOL)overlay
{
  return self->_overlay;
}

- (void)setOverlay:(BOOL)a3
{
  self->_overlay = a3;
}

- (BOOL)shrinkToFit
{
  return self->_shrinkToFit;
}

- (void)setShrinkToFit:(BOOL)a3
{
  self->_shrinkToFit = a3;
}

- (void).cxx_destruct
{
}

@end