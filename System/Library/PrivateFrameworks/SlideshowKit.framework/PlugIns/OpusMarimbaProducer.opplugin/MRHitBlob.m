@interface MRHitBlob
- (BOOL)isEqualToHitBlob:(id)a3;
- (CGSize)innerResolution;
- (MRLayer)outerLayer;
- (MRLayerEffect)effectLayer;
- (MRSlidePositionSupport)proxyForSlide;
- (NSString)elementID;
- (NSString)innerPath;
- (NSString)mediaType;
- (double)aspectRatio;
- (id)clientObject;
- (unsigned)currentLayoutIndex;
- (void)setClientObject:(id)a3;
- (void)setCurrentLayoutIndex:(unsigned __int8)a3;
- (void)setEffectLayer:(id)a3;
- (void)setElementID:(id)a3;
- (void)setInnerPath:(id)a3;
- (void)setOuterLayer:(id)a3;
- (void)setProxyForSlide:(id)a3;
@end

@implementation MRHitBlob

- (double)aspectRatio
{
  double v4 = v3;
  -[MRLayer pixelSize](self->_outerLayer, "pixelSize");
  return v4 / v5;
}

- (CGSize)innerResolution
{
  result.height = v3;
  result.width = v2;
  return result;
}

- (NSString)mediaType
{
  double v3 = @"image";
  if (!-[NSString hasPrefix:](self->_elementID, "hasPrefix:", @"image"))
  {
    double v3 = @"text";
    if (!-[NSString hasPrefix:](self->_elementID, "hasPrefix:", @"text")) {
      return 0LL;
    }
  }

  return &v3->isa;
}

- (BOOL)isEqualToHitBlob:(id)a3
{
  id clientObject = self->_clientObject;
  if (clientObject != [a3 clientObject]) {
    return 0;
  }
  innerPath = self->_innerPath;
  if (innerPath) {
    return -[NSString isEqualToString:](innerPath, "isEqualToString:", [a3 innerPath]);
  }
  else {
    return 1;
  }
}

- (MRLayer)outerLayer
{
  return (MRLayer *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setOuterLayer:(id)a3
{
}

- (MRLayerEffect)effectLayer
{
  return (MRLayerEffect *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setEffectLayer:(id)a3
{
}

- (NSString)innerPath
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setInnerPath:(id)a3
{
}

- (NSString)elementID
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setElementID:(id)a3
{
}

- (id)clientObject
{
  return objc_getProperty(self, a2, 48LL, 1);
}

- (void)setClientObject:(id)a3
{
}

- (MRSlidePositionSupport)proxyForSlide
{
  return self->_proxyForSlide;
}

- (void)setProxyForSlide:(id)a3
{
  self->_proxyForSlide = (MRSlidePositionSupport *)a3;
}

- (unsigned)currentLayoutIndex
{
  return self->_currentLayoutIndex;
}

- (void)setCurrentLayoutIndex:(unsigned __int8)a3
{
  self->_currentLayoutIndex = a3;
}

@end