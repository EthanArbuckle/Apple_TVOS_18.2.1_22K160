@interface MAManifestStorageServiceOverrides
- (NSDictionary)commitErrorsBySelector;
- (NSNumber)assetTypeSupportedResult;
- (NSNumber)infoPlistVerificationResult;
- (NSNumber)manifestVerificationResult;
- (NSString)repositoryPath;
- (void)setAssetTypeSupportedResult:(id)a3;
- (void)setCommitErrorsBySelector:(id)a3;
- (void)setInfoPlistVerificationResult:(id)a3;
- (void)setManifestVerificationResult:(id)a3;
- (void)setRepositoryPath:(id)a3;
@end

@implementation MAManifestStorageServiceOverrides

- (NSString)repositoryPath
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setRepositoryPath:(id)a3
{
}

- (NSNumber)manifestVerificationResult
{
  return (NSNumber *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setManifestVerificationResult:(id)a3
{
}

- (NSNumber)infoPlistVerificationResult
{
  return (NSNumber *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setInfoPlistVerificationResult:(id)a3
{
}

- (NSNumber)assetTypeSupportedResult
{
  return (NSNumber *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setAssetTypeSupportedResult:(id)a3
{
}

- (NSDictionary)commitErrorsBySelector
{
  return (NSDictionary *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setCommitErrorsBySelector:(id)a3
{
}

- (void).cxx_destruct
{
}

@end