@interface MSDDownloadManifestResponse
- (NSDictionary)manifestInfo;
- (NSString)fileName;
- (NSString)originServer;
- (void)setFileName:(id)a3;
- (void)setManifestInfo:(id)a3;
- (void)setOriginServer:(id)a3;
@end

@implementation MSDDownloadManifestResponse

- (NSString)fileName
{
  return self->_fileName;
}

- (void)setFileName:(id)a3
{
}

- (NSString)originServer
{
  return self->_originServer;
}

- (void)setOriginServer:(id)a3
{
}

- (NSDictionary)manifestInfo
{
  return self->_manifestInfo;
}

- (void)setManifestInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end