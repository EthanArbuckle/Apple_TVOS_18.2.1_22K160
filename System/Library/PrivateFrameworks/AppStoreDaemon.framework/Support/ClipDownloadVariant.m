@interface ClipDownloadVariant
- (BOOL)deltaUpdate;
- (NSString)assetToken;
- (NSString)description;
- (NSString)md5;
- (NSURL)assetURL;
@end

@implementation ClipDownloadVariant

- (BOOL)deltaUpdate
{
  return 0;
}

- (NSString)description
{
  v11[0] = @"assetToken";
  v11[1] = @"assetURL";
  assetURL = self->_assetURL;
  assetToken = (const __CFString *)self->_assetToken;
  if (!assetToken) {
    assetToken = @"<null>";
  }
  if (!assetURL) {
    assetURL = (NSURL *)@"<null>";
  }
  v12[0] = assetToken;
  v12[1] = assetURL;
  v11[2] = @"md5";
  v11[3] = @"variantDescriptors";
  md5 = (const __CFString *)self->_md5;
  variantDeltas = self->_variantDeltas;
  if (!md5) {
    md5 = @"<null>";
  }
  variantDescriptors = self->_variantDescriptors;
  if (!variantDescriptors) {
    variantDescriptors = (NSArray *)@"<null>";
  }
  v12[2] = md5;
  v12[3] = variantDescriptors;
  v11[4] = @"variantDeltas";
  if (variantDeltas) {
    v7 = (const __CFString *)variantDeltas;
  }
  else {
    v7 = @"<null>";
  }
  v12[4] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  5LL));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 description]);

  return (NSString *)v9;
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