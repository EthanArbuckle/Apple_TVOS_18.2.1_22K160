@interface PKPlugInProxy
- (BOOL)isOnSystemPartition;
- (NSArray)launchPersonas;
- (NSDate)registrationDate;
- (NSDictionary)infoPlist;
- (NSDictionary)pluginKitDictionary;
- (NSNumber)platform;
- (NSString)originalIdentifier;
- (NSString)pluginIdentifier;
- (NSUUID)pluginUUID;
- (PKBundleProxy)containingBundle;
- (PKExtensionPointProxy)extensionPoint;
- (PKPlugInProxy)initWithLSPlugInKitProxy:(id)a3;
- (PKPlugInProxy)initWithURL:(id)a3;
- (PKPlugInProxy)initWithUUID:(id)a3;
- (id)objectForInfoDictionaryKey:(id)a3 ofClass:(Class)a4 inScope:(unint64_t)a5;
@end

@implementation PKPlugInProxy

- (PKPlugInProxy)initWithURL:(id)a3
{
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___PKPlugInProxy;
    self = -[PKBundleProxy initWithLSBundleProxy:](&v9, sel_initWithLSBundleProxy_, v6);
    v7 = self;
  }

  else
  {
    v7 = 0LL;
  }

  return v7;
}

- (PKPlugInProxy)initWithUUID:(id)a3
{
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___PKPlugInProxy;
    self = -[PKBundleProxy initWithLSBundleProxy:](&v9, sel_initWithLSBundleProxy_, v6);
    v7 = self;
  }

  else
  {
    v7 = 0LL;
  }

  return v7;
}

- (PKPlugInProxy)initWithLSPlugInKitProxy:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PKPlugInProxy;
  return -[PKBundleProxy initWithLSBundleProxy:](&v4, sel_initWithLSBundleProxy_, a3);
}

- (NSUUID)pluginUUID
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pluginUUID(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v10;
}

- (PKBundleProxy)containingBundle
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containingBundle(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKBundleProxy *)v10;
}

- (NSString)pluginIdentifier
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pluginIdentifier(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (NSDate)registrationDate
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_registrationDate(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v10;
}

- (BOOL)isOnSystemPartition
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  char v10 = objc_msgSend_isOnSystemPartition(v5, v6, v7, v8, v9);

  return v10;
}

- (NSString)originalIdentifier
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_originalIdentifier(v5, v6, v7, v8, v9);
  char v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (NSDictionary)infoPlist
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_infoPlist(v5, v6, v7, v8, v9);
  char v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v10;
}

- (NSNumber)platform
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_platform(v5, v6, v7, v8, v9);
  char v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v10;
}

- (PKExtensionPointProxy)extensionPoint
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_extensionPoint(v5, v6, v7, v8, v9);
  char v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKExtensionPointProxy *)v10;
}

- (NSArray)launchPersonas
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_launchPersonas(v5, v6, v7, v8, v9);
  char v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v10;
}

- (NSDictionary)pluginKitDictionary
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pluginKitDictionary(v5, v6, v7, v8, v9);
  char v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v10;
}

- (id)objectForInfoDictionaryKey:(id)a3 ofClass:(Class)a4 inScope:(unint64_t)a5
{
  id v8 = a3;
  objc_msgSend_lsObject(self, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForInfoDictionaryKey_ofClass_inScope_(v13, v14, (uint64_t)v8, (uint64_t)a4, a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

@end