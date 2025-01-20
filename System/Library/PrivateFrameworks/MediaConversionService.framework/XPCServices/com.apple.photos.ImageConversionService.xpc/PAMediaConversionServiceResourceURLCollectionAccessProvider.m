@interface PAMediaConversionServiceResourceURLCollectionAccessProvider
- (BOOL)isBlastDoorAccessRequired;
- (NSDictionary)blastDoorMainSourceProperties;
- (NSError)error;
- (NSURL)blastDoorSourceURL;
- (PAMediaConversionServiceResourceURLCollection)collection;
- (PAMediaConversionServiceResourceURLCollectionAccessProvider)initWithOptions:(id)a3;
- (id)propertiesForVideoComplementURL:(id)a3;
- (id)validateAccessForURL:(id)a3 role:(id)a4;
- (void)setBlastDoorAccessRequired:(BOOL)a3;
- (void)setBlastDoorMainSourceProperties:(id)a3;
- (void)setCollection:(id)a3;
- (void)setError:(id)a3;
@end

@implementation PAMediaConversionServiceResourceURLCollectionAccessProvider

- (PAMediaConversionServiceResourceURLCollectionAccessProvider)initWithOptions:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PAMediaConversionServiceResourceURLCollectionAccessProvider;
  return -[PAMediaConversionServiceResourceURLCollectionAccessProvider init](&v4, "init", a3);
}

- (NSURL)blastDoorSourceURL
{
  return 0LL;
}

- (id)validateAccessForURL:(id)a3 role:(id)a4
{
  return a3;
}

- (id)propertiesForVideoComplementURL:(id)a3
{
  return 0LL;
}

- (BOOL)isBlastDoorAccessRequired
{
  return self->_blastDoorAccessRequired;
}

- (void)setBlastDoorAccessRequired:(BOOL)a3
{
  self->_blastDoorAccessRequired = a3;
}

- (NSDictionary)blastDoorMainSourceProperties
{
  return (NSDictionary *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setBlastDoorMainSourceProperties:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setError:(id)a3
{
}

- (PAMediaConversionServiceResourceURLCollection)collection
{
  return (PAMediaConversionServiceResourceURLCollection *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setCollection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end