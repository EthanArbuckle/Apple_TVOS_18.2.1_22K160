@interface MSDCDNServerRequest
- (BOOL)isValid;
- (MSDFileDownloadCredentials)downloadCredentials;
- (NSString)originServer;
- (void)setDownloadCredentials:(id)a3;
- (void)setOriginServer:(id)a3;
@end

@implementation MSDCDNServerRequest

- (BOOL)isValid
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MSDCDNServerRequest;
  if (!-[MSDServerRequest isValid](&v6, "isValid")) {
    return 0;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCDNServerRequest downloadCredentials](self, "downloadCredentials"));
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (MSDFileDownloadCredentials)downloadCredentials
{
  return (MSDFileDownloadCredentials *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setDownloadCredentials:(id)a3
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