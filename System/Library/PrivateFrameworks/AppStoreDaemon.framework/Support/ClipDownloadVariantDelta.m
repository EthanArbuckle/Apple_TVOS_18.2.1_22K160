@interface ClipDownloadVariantDelta
- (BOOL)deltaUpdate;
- (NSString)assetToken;
- (NSString)description;
- (NSString)md5;
- (NSURL)assetURL;
@end

@implementation ClipDownloadVariantDelta

- (BOOL)deltaUpdate
{
  return 1;
}

- (NSString)description
{
  v10[0] = @"assetToken";
  v10[1] = @"assetURL";
  assetURL = self->_assetURL;
  assetToken = (const __CFString *)self->_assetToken;
  if (!assetToken) {
    assetToken = @"<null>";
  }
  if (!assetURL) {
    assetURL = (NSURL *)@"<null>";
  }
  v11[0] = assetToken;
  v11[1] = assetURL;
  v10[2] = @"md5";
  v10[3] = @"fromAssetToken";
  md5 = (const __CFString *)self->_md5;
  fromAssetToken = (const __CFString *)self->_fromAssetToken;
  if (!md5) {
    md5 = @"<null>";
  }
  if (!fromAssetToken) {
    fromAssetToken = @"<null>";
  }
  v11[2] = md5;
  v11[3] = fromAssetToken;
  v10[4] = @"previousExternalVersionId";
  previousExternalVersionID = self->_previousExternalVersionID;
  if (!previousExternalVersionID) {
    previousExternalVersionID = (NSNumber *)@"<null>";
  }
  v11[4] = previousExternalVersionID;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v10,  5LL));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 description]);

  return (NSString *)v8;
}

- (NSURL)assetURL
{
  return (NSURL *)objc_getProperty(self, a2, 8LL, 1);
}

- (NSString)assetToken
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSString)md5
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void).cxx_destruct
{
}

@end