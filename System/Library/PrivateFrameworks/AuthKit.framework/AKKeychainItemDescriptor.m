@interface AKKeychainItemDescriptor
+ (id)pcsAuthDescriptor;
- (AKKeychainItemDescriptor)initWithAttributes:(id)a3;
- (BOOL)isInvisible;
- (BOOL)isSynchronizable;
- (BOOL)shouldUseDataProtection;
- (NSString)accessGroup;
- (NSString)account;
- (NSString)label;
- (NSString)securityDomain;
- (NSString)server;
- (NSString)service;
- (id)_keychainAccessibleWithAccessible:(unint64_t)a3;
- (id)_keychainClassWithClass:(unint64_t)a3;
- (id)attributes;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)_accessibleWithKeychainAccessible:(id)a3;
- (unint64_t)_classWithKeychainClass:(id)a3;
- (unint64_t)itemAccessible;
- (unint64_t)itemClass;
- (void)setAccessGroup:(id)a3;
- (void)setAccount:(id)a3;
- (void)setInvisible:(BOOL)a3;
- (void)setItemAccessible:(unint64_t)a3;
- (void)setItemClass:(unint64_t)a3;
- (void)setLabel:(id)a3;
- (void)setSecurityDomain:(id)a3;
- (void)setServer:(id)a3;
- (void)setService:(id)a3;
- (void)setSynchronizable:(BOOL)a3;
- (void)setUseDataProtection:(BOOL)a3;
@end

@implementation AKKeychainItemDescriptor

- (AKKeychainItemDescriptor)initWithAttributes:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___AKKeychainItemDescriptor;
  v5 = -[AKKeychainItemDescriptor init](&v27, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kSecClass]);
    v5->_itemClass = -[AKKeychainItemDescriptor _classWithKeychainClass:](v5, "_classWithKeychainClass:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kSecAttrAccessible]);
    v5->_itemAccessible = -[AKKeychainItemDescriptor _accessibleWithKeychainAccessible:]( v5,  "_accessibleWithKeychainAccessible:",  v7);

    uint64_t v8 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kSecAttrAccount]);
    account = v5->_account;
    v5->_account = (NSString *)v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kSecAttrService]);
    service = v5->_service;
    v5->_service = (NSString *)v10;

    uint64_t v12 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kSecAttrServer]);
    server = v5->_server;
    v5->_server = (NSString *)v12;

    uint64_t v14 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kSecAttrSecurityDomain]);
    securityDomain = v5->_securityDomain;
    v5->_securityDomain = (NSString *)v14;

    uint64_t v16 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kSecAttrLabel]);
    label = v5->_label;
    v5->_label = (NSString *)v16;

    uint64_t v18 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kSecAttrAccessGroup]);
    accessGroup = v5->_accessGroup;
    v5->_accessGroup = (NSString *)v18;

    uint64_t v20 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kSecAttrIsInvisible]);
    invisible = v5->_invisible;
    v5->_invisible = (NSNumber *)v20;

    uint64_t v22 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kSecAttrSynchronizable]);
    synchronizable = v5->_synchronizable;
    v5->_synchronizable = (NSNumber *)v22;

    uint64_t v24 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kSecUseDataProtectionKeychain]);
    useDataProtection = v5->_useDataProtection;
    v5->_useDataProtection = (NSNumber *)v24;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___AKKeychainItemDescriptor);
  v4->_itemClass = self->_itemClass;
  v4->_itemAccessible = self->_itemAccessible;
  v5 = (NSString *)-[NSString copy](self->_account, "copy");
  account = v4->_account;
  v4->_account = v5;

  v7 = (NSString *)-[NSString copy](self->_service, "copy");
  service = v4->_service;
  v4->_service = v7;

  v9 = (NSString *)-[NSString copy](self->_server, "copy");
  server = v4->_server;
  v4->_server = v9;

  v11 = (NSString *)-[NSString copy](self->_securityDomain, "copy");
  securityDomain = v4->_securityDomain;
  v4->_securityDomain = v11;

  v13 = (NSString *)-[NSString copy](self->_label, "copy");
  label = v4->_label;
  v4->_label = v13;

  v15 = (NSString *)-[NSString copy](self->_accessGroup, "copy");
  accessGroup = v4->_accessGroup;
  v4->_accessGroup = v15;

  v17 = (NSNumber *)-[NSNumber copy](self->_invisible, "copy");
  invisible = v4->_invisible;
  v4->_invisible = v17;

  v19 = (NSNumber *)-[NSNumber copy](self->_synchronizable, "copy");
  synchronizable = v4->_synchronizable;
  v4->_synchronizable = v19;

  v21 = (NSNumber *)-[NSNumber copy](self->_useDataProtection, "copy");
  useDataProtection = v4->_useDataProtection;
  v4->_useDataProtection = v21;

  return v4;
}

- (BOOL)isInvisible
{
  return -[NSNumber BOOLValue](self->_invisible, "BOOLValue");
}

- (void)setInvisible:(BOOL)a3
{
  id v4 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  invisible = self->_invisible;
  self->_invisible = v4;
}

- (BOOL)isSynchronizable
{
  return -[NSNumber BOOLValue](self->_synchronizable, "BOOLValue");
}

- (void)setSynchronizable:(BOOL)a3
{
  id v4 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  synchronizable = self->_synchronizable;
  self->_synchronizable = v4;
}

- (BOOL)shouldUseDataProtection
{
  return -[NSNumber BOOLValue](self->_useDataProtection, "BOOLValue");
}

- (void)setUseDataProtection:(BOOL)a3
{
  id v4 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  useDataProtection = self->_useDataProtection;
  self->_useDataProtection = v4;
}

- (id)attributes
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[AKKeychainItemDescriptor _keychainClassWithClass:]( self,  "_keychainClassWithClass:",  self->_itemClass));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, kSecClass);

  v5 = (void *)objc_claimAutoreleasedReturnValue( -[AKKeychainItemDescriptor _keychainAccessibleWithAccessible:]( self,  "_keychainAccessibleWithAccessible:",  self->_itemAccessible));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, kSecAttrAccessible);

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  self->_account,  kSecAttrAccount);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  self->_service,  kSecAttrService);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", self->_server, kSecAttrServer);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  self->_securityDomain,  kSecAttrSecurityDomain);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", self->_label, kSecAttrLabel);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  self->_accessGroup,  kSecAttrAccessGroup);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  self->_invisible,  kSecAttrIsInvisible);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  self->_synchronizable,  kSecAttrSynchronizable);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  self->_useDataProtection,  kSecUseDataProtectionKeychain);
  id v6 = -[NSMutableDictionary copy](v3, "copy");

  return v6;
}

- (id)_keychainClassWithClass:(unint64_t)a3
{
  if (a3 == 1)
  {
    v3 = (id *)&kSecClassGenericPassword;
  }

  else
  {
    if (a3 != 2) {
      return 0LL;
    }
    v3 = (id *)&kSecClassInternetPassword;
  }

  return *v3;
}

- (unint64_t)_classWithKeychainClass:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:kSecClassGenericPassword])
  {
    unint64_t v4 = 1LL;
  }

  else if ([v3 isEqualToString:kSecClassInternetPassword])
  {
    unint64_t v4 = 2LL;
  }

  else
  {
    unint64_t v4 = 0LL;
  }

  return v4;
}

- (id)_keychainAccessibleWithAccessible:(unint64_t)a3
{
  if (a3 - 1 > 4) {
    return 0LL;
  }
  else {
    return *(id *)*(&off_1001C77B8 + a3 - 1);
  }
}

- (unint64_t)_accessibleWithKeychainAccessible:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:kSecAttrAccessibleWhenUnlocked])
  {
    unint64_t v4 = 1LL;
  }

  else if ([v3 isEqualToString:kSecAttrAccessibleAfterFirstUnlock])
  {
    unint64_t v4 = 2LL;
  }

  else if ([v3 isEqualToString:kSecAttrAccessibleWhenPasscodeSetThisDeviceOnly])
  {
    unint64_t v4 = 3LL;
  }

  else if ([v3 isEqualToString:kSecAttrAccessibleWhenUnlockedThisDeviceOnly])
  {
    unint64_t v4 = 4LL;
  }

  else if ([v3 isEqualToString:kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly])
  {
    unint64_t v4 = 5LL;
  }

  else
  {
    unint64_t v4 = 0LL;
  }

  return v4;
}

- (unint64_t)itemClass
{
  return self->_itemClass;
}

- (void)setItemClass:(unint64_t)a3
{
  self->_itemClass = a3;
}

- (unint64_t)itemAccessible
{
  return self->_itemAccessible;
}

- (void)setItemAccessible:(unint64_t)a3
{
  self->_itemAccessible = a3;
}

- (NSString)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (NSString)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (NSString)server
{
  return self->_server;
}

- (void)setServer:(id)a3
{
}

- (NSString)securityDomain
{
  return self->_securityDomain;
}

- (void)setSecurityDomain:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (NSString)accessGroup
{
  return self->_accessGroup;
}

- (void)setAccessGroup:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)pcsAuthDescriptor
{
  v2 = objc_alloc_init(&OBJC_CLASS___AKKeychainItemDescriptor);
  -[AKKeychainItemDescriptor setService:](v2, "setService:", @"com.apple.akd.pcsauth.keychain_service");
  -[AKKeychainItemDescriptor setAccessGroup:](v2, "setAccessGroup:", @"com.apple.akd.pcsauth");
  -[AKKeychainItemDescriptor setItemClass:](v2, "setItemClass:", 1LL);
  -[AKKeychainItemDescriptor setItemAccessible:](v2, "setItemAccessible:", 0LL);
  -[AKKeychainItemDescriptor setInvisible:](v2, "setInvisible:", 1LL);
  -[AKKeychainItemDescriptor setSynchronizable:](v2, "setSynchronizable:", 0LL);
  -[AKKeychainItemDescriptor setUseDataProtection:](v2, "setUseDataProtection:", 1LL);
  return v2;
}

@end