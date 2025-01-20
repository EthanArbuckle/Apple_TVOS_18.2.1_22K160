@interface CloudArtworkImportRequest
- (BOOL)allowsCellularData;
- (CloudArtworkImportRequest)init;
- (CloudArtworkImportRequest)initWithClientIdentity:(id)a3;
- (NSString)token;
- (OS_tcc_identity)clientIdentity;
- (id)completionHandler;
- (int64_t)artworkType;
- (unint64_t)cloudID;
- (unsigned)mediaType;
- (void)setAllowsCellularData:(BOOL)a3;
- (void)setArtworkType:(int64_t)a3;
- (void)setClientIdentity:(id)a3;
- (void)setCloudID:(unint64_t)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setMediaType:(unsigned int)a3;
- (void)setToken:(id)a3;
@end

@implementation CloudArtworkImportRequest

- (CloudArtworkImportRequest)init
{
  uint64_t v3 = MSVTCCIdentityForCurrentProcess(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = -[CloudArtworkImportRequest initWithClientIdentity:](self, "initWithClientIdentity:", v4);

  return v5;
}

- (CloudArtworkImportRequest)initWithClientIdentity:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CloudArtworkImportRequest;
  v6 = -[CloudArtworkImportRequest init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_clientIdentity, a3);
    v7->_allowsCellularData = 1;
  }

  return v7;
}

- (unint64_t)cloudID
{
  return self->_cloudID;
}

- (void)setCloudID:(unint64_t)a3
{
  self->_cloudID = a3;
}

- (NSString)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
}

- (unsigned)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(unsigned int)a3
{
  self->_mediaType = a3;
}

- (int64_t)artworkType
{
  return self->_artworkType;
}

- (void)setArtworkType:(int64_t)a3
{
  self->_artworkType = a3;
}

- (BOOL)allowsCellularData
{
  return self->_allowsCellularData;
}

- (void)setAllowsCellularData:(BOOL)a3
{
  self->_allowsCellularData = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (OS_tcc_identity)clientIdentity
{
  return self->_clientIdentity;
}

- (void)setClientIdentity:(id)a3
{
}

- (void).cxx_destruct
{
}

@end