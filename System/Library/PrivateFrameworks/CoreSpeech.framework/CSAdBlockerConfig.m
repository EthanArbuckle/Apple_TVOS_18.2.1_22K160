@interface CSAdBlockerConfig
- (CSAdBlockerConfig)initWithCatalog:(id)a3 withMaxFingerprintBufferSize:(float)a4 shouldResetAdsDic:(id)a5 withAssetVersion:(id)a6;
- (NSDictionary)shouldResetAdsDictionary;
- (NSString)assetVersion;
- (SHCustomCatalog)shazamCatalog;
- (float)maxFingerprintBufferSize;
@end

@implementation CSAdBlockerConfig

- (CSAdBlockerConfig)initWithCatalog:(id)a3 withMaxFingerprintBufferSize:(float)a4 shouldResetAdsDic:(id)a5 withAssetVersion:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___CSAdBlockerConfig;
  v14 = -[CSAdBlockerConfig init](&v17, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_shazamCatalog, a3);
    v15->_maxFingerprintBufferSize = a4;
    objc_storeStrong((id *)&v15->_shouldResetAdsDictionary, a5);
    objc_storeStrong((id *)&v15->_assetVersion, a6);
  }

  return v15;
}

- (SHCustomCatalog)shazamCatalog
{
  return self->_shazamCatalog;
}

- (float)maxFingerprintBufferSize
{
  return self->_maxFingerprintBufferSize;
}

- (NSDictionary)shouldResetAdsDictionary
{
  return self->_shouldResetAdsDictionary;
}

- (NSString)assetVersion
{
  return self->_assetVersion;
}

- (void).cxx_destruct
{
}

@end