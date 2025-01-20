@interface PKPlugInRecordProxy
- (LSApplicationExtensionRecord)lsRecord;
- (NSString)bundleIdentifier;
- (NSString)bundleVersion;
- (NSString)localizedName;
- (NSString)localizedShortName;
- (NSUUID)uniqueIdentifier;
- (PKPlugInProxy)compatibilityObject;
- (PKPlugInRecordProxy)initWithBundleIdentifier:(id)a3 error:(id *)a4;
- (PKPlugInRecordProxy)initWithUUID:(id)a3 error:(id *)a4;
- (PKPropertyList)entitlements;
- (void)setLsRecord:(id)a3;
@end

@implementation PKPlugInRecordProxy

- (PKPlugInRecordProxy)initWithUUID:(id)a3 error:(id *)a4
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___PKPlugInRecordProxy;
  id v5 = a3;
  v6 = -[PKPlugInRecordProxy init](&v14, sel_init);
  id v7 = objc_alloc(MEMORY[0x189605720]);
  uint64_t v10 = objc_msgSend_initWithUUID_error_(v7, v8, (uint64_t)v5, (uint64_t)a4, v9, v14.receiver, v14.super_class);

  lsRecord = v6->_lsRecord;
  v6->_lsRecord = (LSApplicationExtensionRecord *)v10;

  if (v6->_lsRecord) {
    v12 = v6;
  }
  else {
    v12 = 0LL;
  }

  return v12;
}

- (PKPlugInRecordProxy)initWithBundleIdentifier:(id)a3 error:(id *)a4
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___PKPlugInRecordProxy;
  id v5 = a3;
  v6 = -[PKPlugInRecordProxy init](&v14, sel_init);
  id v7 = objc_alloc(MEMORY[0x189605720]);
  uint64_t v10 = objc_msgSend_initWithBundleIdentifier_error_( v7,  v8,  (uint64_t)v5,  (uint64_t)a4,  v9,  v14.receiver,  v14.super_class);

  lsRecord = v6->_lsRecord;
  v6->_lsRecord = (LSApplicationExtensionRecord *)v10;

  if (v6->_lsRecord) {
    v12 = v6;
  }
  else {
    v12 = 0LL;
  }

  return v12;
}

- (NSString)localizedName
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localizedName(v5, v6, v7, v8, v9);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (NSString)localizedShortName
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localizedShortName(v5, v6, v7, v8, v9);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (NSString)bundleIdentifier
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bundleIdentifier(v5, v6, v7, v8, v9);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (NSString)bundleVersion
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bundleVersion(v5, v6, v7, v8, v9);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (NSUUID)uniqueIdentifier
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_uniqueIdentifier(v5, v6, v7, v8, v9);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v10;
}

- (PKPlugInProxy)compatibilityObject
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_compatibilityObject(v5, v6, v7, v8, v9);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKPlugInProxy *)v10;
}

- (PKPropertyList)entitlements
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_entitlements(v5, v6, v7, v8, v9);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKPropertyList *)v10;
}

- (LSApplicationExtensionRecord)lsRecord
{
  return self->_lsRecord;
}

- (void)setLsRecord:(id)a3
{
}

- (void).cxx_destruct
{
}

@end