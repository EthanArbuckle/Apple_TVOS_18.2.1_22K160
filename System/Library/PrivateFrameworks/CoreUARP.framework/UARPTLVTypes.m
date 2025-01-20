@interface UARPTLVTypes
+ (id)sharedInstance;
- (UARPAssetTag)hsModel4cc;
- (unint64_t)hsModelDownloaded;
- (unint64_t)hsModelEngineCompact;
- (unint64_t)hsModelEngineNormal;
- (unint64_t)hsModelFallback;
- (unint64_t)hsModelPreInstalled;
- (unint64_t)hsModelPrimary;
- (unint64_t)hsModelTlvModelCertificate;
- (unint64_t)hsModelTlvModelDigest;
- (unint64_t)hsModelTlvModelEngineType;
- (unint64_t)hsModelTlvModelEngineVersion;
- (unint64_t)hsModelTlvModelHash;
- (unint64_t)hsModelTlvModelLocale;
- (unint64_t)hsModelTlvModelRole;
- (unint64_t)hsModelTlvModelSignature;
- (unint64_t)hsModelTlvModelType;
@end

@implementation UARPTLVTypes

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __30__UARPTLVTypes_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_once != -1) {
    dispatch_once(&sharedInstance_once, block);
  }
  return (id)sharedInstance_sharedInstance;
}

void __30__UARPTLVTypes_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v1;
}

- (UARPAssetTag)hsModel4cc
{
  v2 = (char *)uarpAssetTagStructHeySiriModel();
  return  -[UARPAssetTag initWithChar1:char2:char3:char4:]( objc_alloc(&OBJC_CLASS___UARPAssetTag),  "initWithChar1:char2:char3:char4:",  *v2,  v2[1],  v2[2],  v2[3]);
}

- (unint64_t)hsModelTlvModelType
{
  return 1619725824LL;
}

- (unint64_t)hsModelTlvModelLocale
{
  return 1619725825LL;
}

- (unint64_t)hsModelTlvModelHash
{
  return 1619725826LL;
}

- (unint64_t)hsModelTlvModelRole
{
  return 1619725827LL;
}

- (unint64_t)hsModelTlvModelDigest
{
  return 1619725828LL;
}

- (unint64_t)hsModelTlvModelSignature
{
  return 1619725829LL;
}

- (unint64_t)hsModelTlvModelCertificate
{
  return 1619725830LL;
}

- (unint64_t)hsModelTlvModelEngineVersion
{
  return 1619725831LL;
}

- (unint64_t)hsModelTlvModelEngineType
{
  return 1619725832LL;
}

- (unint64_t)hsModelEngineCompact
{
  return 0LL;
}

- (unint64_t)hsModelEngineNormal
{
  return 1LL;
}

- (unint64_t)hsModelDownloaded
{
  return 0LL;
}

- (unint64_t)hsModelPreInstalled
{
  return 1LL;
}

- (unint64_t)hsModelPrimary
{
  return 0LL;
}

- (unint64_t)hsModelFallback
{
  return 1LL;
}

@end