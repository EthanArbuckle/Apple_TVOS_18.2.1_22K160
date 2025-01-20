@interface CPLFingerprintSchemeV2
- (void)configureAssetTransferOptionsForCKAsset:(id)a3 scopeProvider:(id)a4;
@end

@implementation CPLFingerprintSchemeV2

- (void)configureAssetTransferOptionsForCKAsset:(id)a3 scopeProvider:(id)a4
{
  id v7 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___CKAssetTransferOptions);
  [v5 setUseMMCSEncryptionV2:&__kCFBooleanTrue];
  if (qword_100296300 != -1) {
    dispatch_once(&qword_100296300, &stru_100241028);
  }
  if (byte_100296308 || ([v7 isReference] & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLFingerprintSchemeV2 boundaryKey](self, "boundaryKey"));
    [v7 setBoundaryKey:v6];
  }

  [v7 setAssetTransferOptions:v5];
}

@end