@interface GEOBackgroundDirectionsRequestConfig
- (BOOL)usesBackgroundURL;
- (GEOBackgroundDirectionsRequestConfig)initWithRequest:(id)a3 requestPriority:(id)a4;
- (unint64_t)urlType;
@end

@implementation GEOBackgroundDirectionsRequestConfig

- (GEOBackgroundDirectionsRequestConfig)initWithRequest:(id)a3 requestPriority:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___GEOBackgroundDirectionsRequestConfig;
  return -[GEODirectionsRequestConfig initWithRequest:requestPriority:](&v5, "initWithRequest:requestPriority:", a3, a4);
}

- (unint64_t)urlType
{
  return 33LL;
}

- (BOOL)usesBackgroundURL
{
  return 1;
}

@end