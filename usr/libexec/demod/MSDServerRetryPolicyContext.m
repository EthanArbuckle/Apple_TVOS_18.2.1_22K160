@interface MSDServerRetryPolicyContext
- (BOOL)tryCachingHub;
- (MSDFileDownloadCredentials)fdc;
- (NSString)cachedLocalURL;
- (NSString)originServer;
- (void)setCachedLocalURL:(id)a3;
- (void)setFdc:(id)a3;
- (void)setOriginServer:(id)a3;
- (void)setTryCachingHub:(BOOL)a3;
@end

@implementation MSDServerRetryPolicyContext

- (BOOL)tryCachingHub
{
  return self->_tryCachingHub;
}

- (void)setTryCachingHub:(BOOL)a3
{
  self->_tryCachingHub = a3;
}

- (MSDFileDownloadCredentials)fdc
{
  return (MSDFileDownloadCredentials *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setFdc:(id)a3
{
}

- (NSString)cachedLocalURL
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setCachedLocalURL:(id)a3
{
}

- (NSString)originServer
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setOriginServer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end