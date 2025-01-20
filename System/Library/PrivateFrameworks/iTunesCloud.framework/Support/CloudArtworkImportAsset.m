@interface CloudArtworkImportAsset
- (CloudArtworkImportAsset)initWithAssertURL:(id)a3 artworkMediaType:(unsigned int)a4 artworkType:(int64_t)a5 artworkToken:(id)a6;
- (NSString)artworkToken;
- (NSURL)assetURL;
- (int64_t)artworkType;
- (unsigned)artworkMediaType;
@end

@implementation CloudArtworkImportAsset

- (CloudArtworkImportAsset)initWithAssertURL:(id)a3 artworkMediaType:(unsigned int)a4 artworkType:(int64_t)a5 artworkToken:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___CloudArtworkImportAsset;
  v13 = -[CloudArtworkImportAsset init](&v16, "init");
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_assetURL, a3);
    v14->_artworkMediaType = a4;
    v14->_artworkType = a5;
    objc_storeStrong((id *)&v14->_artworkToken, a6);
  }

  return v14;
}

- (NSURL)assetURL
{
  return self->_assetURL;
}

- (unsigned)artworkMediaType
{
  return self->_artworkMediaType;
}

- (int64_t)artworkType
{
  return self->_artworkType;
}

- (NSString)artworkToken
{
  return self->_artworkToken;
}

- (void).cxx_destruct
{
}

@end