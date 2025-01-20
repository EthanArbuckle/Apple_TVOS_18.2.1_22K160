@interface OpusMarimbaProducer_MPAssetKeyDelegate
- (CGSize)resolutionForAssetKey:(id)a3;
- (OKPresentationLookupDelegate)lookupDelegate;
- (id)absolutePathForAssetKey:(id)a3;
- (id)absolutePathForAssetKey:(id)a3 andSize:(CGSize)a4;
- (id)absolutePathForStillAssetAtPath:(id)a3 andSize:(CGSize)a4;
- (id)mediaItemForAssetPath:(id)a3;
- (id)updatedAssetPathForAssetPath:(id)a3;
- (id)urlForAssetKey:(id)a3;
- (void)setLookupDelegate:(id)a3;
@end

@implementation OpusMarimbaProducer_MPAssetKeyDelegate

- (id)absolutePathForAssetKey:(id)a3
{
  if (OFLoggerLevel >= 4) {
    +[OFLogger logMessageWithLevel:file:line:andFormat:]( &OBJC_CLASS___OFLogger,  "logMessageWithLevel:file:line:andFormat:",  4LL,  "/Library/Caches/com.apple.xbs/Sources/SlideshowKit/OpusKitPlugins/OpusProducers/OpusMarimbaProducer/OpusMarimbaProducer.m",  965LL,  @"OpusMarimbaProducer_MPAssetKeyDelegate: absolutePathForAssetKey:%@",  a3);
  }
  id v5 = -[OpusMarimbaProducer_MPAssetKeyDelegate mediaItemForAssetPath:](self, "mediaItemForAssetPath:", a3);
  if (v5) {
    return objc_msgSend(objc_msgSend(v5, "resourceURL"), "path");
  }
  else {
    return a3;
  }
}

- (id)absolutePathForAssetKey:(id)a3 andSize:(CGSize)a4
{
  if (OFLoggerLevel >= 4) {
    +[OFLogger logMessageWithLevel:file:line:andFormat:]( &OBJC_CLASS___OFLogger,  "logMessageWithLevel:file:line:andFormat:",  4LL,  "/Library/Caches/com.apple.xbs/Sources/SlideshowKit/OpusKitPlugins/OpusProducers/OpusMarimbaProducer/OpusMarimbaProducer.m",  976LL,  @"OpusMarimbaProducer_MPAssetKeyDelegate: absolutePathForAssetKey:%@ andSize:%@",  a3,  NSStringFromCGSize(a4));
  }
  return -[OpusMarimbaProducer_MPAssetKeyDelegate absolutePathForAssetKey:](self, "absolutePathForAssetKey:", a3);
}

- (id)absolutePathForStillAssetAtPath:(id)a3 andSize:(CGSize)a4
{
  if (OFLoggerLevel >= 4) {
    +[OFLogger logMessageWithLevel:file:line:andFormat:]( &OBJC_CLASS___OFLogger,  "logMessageWithLevel:file:line:andFormat:",  4LL,  "/Library/Caches/com.apple.xbs/Sources/SlideshowKit/OpusKitPlugins/OpusProducers/OpusMarimbaProducer/OpusMarimbaProducer.m",  982LL,  @"OpusMarimbaProducer_MPAssetKeyDelegate: absolutePathForStillAssetAtPath:%@ andSize:@",  a3,  NSStringFromCGSize(a4));
  }
  return -[OpusMarimbaProducer_MPAssetKeyDelegate absolutePathForAssetKey:](self, "absolutePathForAssetKey:", a3);
}

- (CGSize)resolutionForAssetKey:(id)a3
{
  id v3 = -[OpusMarimbaProducer_MPAssetKeyDelegate mediaItemForAssetPath:](self, "mediaItemForAssetPath:", a3);
  if (v3)
  {
    objc_msgSend(objc_msgSend(v3, "metadata"), "resolution");
  }

  else
  {
    double width = CGSizeZero.width;
    double height = CGSizeZero.height;
  }

  result.double height = height;
  result.double width = width;
  return result;
}

- (id)updatedAssetPathForAssetPath:(id)a3
{
  id v4 = -[OpusMarimbaProducer_MPAssetKeyDelegate mediaItemForAssetPath:](self, "mediaItemForAssetPath:");
  if (v4) {
    return objc_msgSend(objc_msgSend(v4, "uniqueURL"), "absoluteString");
  }
  else {
    return a3;
  }
}

- (id)mediaItemForAssetPath:(id)a3
{
  id result = -[OKPresentationLookupDelegate mediaItemForURL:]( self->_lookupDelegate,  "mediaItemForURL:",  -[OpusMarimbaProducer_MPAssetKeyDelegate urlForAssetKey:](self, "urlForAssetKey:", a3));
  if (!result) {
    return 0LL;
  }
  return result;
}

- (id)urlForAssetKey:(id)a3
{
  if ([a3 hasPrefix:@"iphoto://"])
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___NSURLComponents);
    id v5 = v4;
    v6 = @"iphoto";
LABEL_5:
    -[NSURLComponents setScheme:](v4, "setScheme:", v6);
    -[NSURLComponents setHost:](v5, "setHost:", [a3 lastPathComponent]);
    v7 = -[NSURLComponents URL](v5, "URL");

    return v7;
  }

  if ([a3 hasPrefix:@"aperture://"])
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___NSURLComponents);
    id v5 = v4;
    v6 = @"aperture";
    goto LABEL_5;
  }

  return +[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", a3);
}

- (OKPresentationLookupDelegate)lookupDelegate
{
  return self->_lookupDelegate;
}

- (void)setLookupDelegate:(id)a3
{
  self->_lookupDelegate = (OKPresentationLookupDelegate *)a3;
}

@end