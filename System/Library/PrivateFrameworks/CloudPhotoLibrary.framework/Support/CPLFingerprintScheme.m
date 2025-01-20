@interface CPLFingerprintScheme
+ (void)configureAssetTransferOptionsForCKAsset:(id)a3 fromReference:(id)a4 scopeProvider:(id)a5;
- (void)configureAssetTransferOptionsForCKAsset:(id)a3 scopeProvider:(id)a4;
@end

@implementation CPLFingerprintScheme

- (void)configureAssetTransferOptionsForCKAsset:(id)a3 scopeProvider:(id)a4
{
  id v5 = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___CKAssetTransferOptions);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[CPLFingerprintScheme isMMCSv2](self, "isMMCSv2")));
  [v7 setUseMMCSEncryptionV2:v6];

  [v5 setAssetTransferOptions:v7];
}

+ (void)configureAssetTransferOptionsForCKAsset:(id)a3 fromReference:(id)a4 scopeProvider:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue([v7 fingerprintContext]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v8 fileSignature]);

  id v12 = (id)objc_claimAutoreleasedReturnValue([v10 fingerprintSchemeForSignature:v11]);
  [v12 configureAssetTransferOptionsForCKAsset:v9 scopeProvider:v7];
}

@end