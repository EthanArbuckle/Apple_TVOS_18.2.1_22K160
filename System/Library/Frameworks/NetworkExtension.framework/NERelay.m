@interface NERelay
+ (BOOL)supportsSecureCoding;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)identityDataImported;
- (NEIdentityKeychainItem)identity;
- (NEKeychainItem)identityDataPasswordKeychainItem;
- (NERelay)init;
- (NERelay)initWithCoder:(id)a3;
- (NSArray)certificateReferences;
- (NSArray)rawPublicKeys;
- (NSData)identityDataHash;
- (NSData)identityDataInternal;
- (NSData)identityReferenceInternal;
- (NSDictionary)additionalHTTPHeaderFields;
- (NSString)identityDataPassword;
- (NSString)syntheticDNSAnswerIPv4Prefix;
- (NSString)syntheticDNSAnswerIPv6Prefix;
- (NSURL)HTTP2RelayURL;
- (NSURL)HTTP3RelayURL;
- (NSURL)dnsOverHTTPSURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (void)clearKeychainItemsInDomain:(int64_t)a3 removeItems:(BOOL)a4;
- (void)copyPasswordsFromKeychainInDomain:(int64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAdditionalHTTPHeaderFields:(NSDictionary *)additionalHTTPHeaderFields;
- (void)setCertificateReferences:(id)a3;
- (void)setDnsOverHTTPSURL:(NSURL *)dnsOverHTTPSURL;
- (void)setHTTP2RelayURL:(NSURL *)HTTP2RelayURL;
- (void)setHTTP3RelayURL:(NSURL *)HTTP3RelayURL;
- (void)setIdentity:(id)a3;
- (void)setIdentityData:(NSData *)identityData;
- (void)setIdentityDataHash:(id)a3;
- (void)setIdentityDataImported:(BOOL)a3;
- (void)setIdentityDataInternal:(id)a3;
- (void)setIdentityDataPassword:(NSString *)identityDataPassword;
- (void)setIdentityDataPasswordKeychainItem:(id)a3;
- (void)setIdentityReferenceInternal:(id)a3;
- (void)setIdentityWithKey:(id)a3 keyRef:(id)a4;
- (void)setRawPublicKeys:(NSArray *)rawPublicKeys;
- (void)setSyntheticDNSAnswerIPv4Prefix:(NSString *)syntheticDNSAnswerIPv4Prefix;
- (void)setSyntheticDNSAnswerIPv6Prefix:(NSString *)syntheticDNSAnswerIPv6Prefix;
- (void)syncWithKeychainInDomainCommon:(int64_t)a3;
@end

@implementation NERelay

- (NERelay)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NERelay;
  result = -[NERelay init](&v3, sel_init);
  if (result) {
    result->_keychainDomain = 0LL;
  }
  return result;
}

- (NERelay)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[NERelay init](self, "init");
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HTTP3RelayURL"];
    HTTP3RelayURL = v5->_HTTP3RelayURL;
    v5->_HTTP3RelayURL = (NSURL *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HTTP2RelayURL"];
    HTTP2RelayURL = v5->_HTTP2RelayURL;
    v5->_HTTP2RelayURL = (NSURL *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DNSOverHTTPSURL"];
    dnsOverHTTPSURL = v5->_dnsOverHTTPSURL;
    v5->_dnsOverHTTPSURL = (NSURL *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SyntheticIPv4Prefix"];
    syntheticDNSAnswerIPv4Prefix = v5->_syntheticDNSAnswerIPv4Prefix;
    v5->_syntheticDNSAnswerIPv4Prefix = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SyntheticIPv6Prefix"];
    syntheticDNSAnswerIPv6Prefix = v5->_syntheticDNSAnswerIPv6Prefix;
    v5->_syntheticDNSAnswerIPv6Prefix = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Identity"];
    identity = v5->_identity;
    v5->_identity = (NEIdentityKeychainItem *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"IdentityData"];
    identityDataInternal = v5->_identityDataInternal;
    v5->_identityDataInternal = (NSData *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"IdentityDataPassword"];
    identityDataPassword = v5->_identityDataPassword;
    v5->_identityDataPassword = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"IdentityDataPasswordKeychainItem"];
    identityDataPasswordKeychainItem = v5->_identityDataPasswordKeychainItem;
    v5->_identityDataPasswordKeychainItem = (NEKeychainItem *)v22;

    v5->_identityDataImported = [v4 decodeBoolForKey:@"IdentityDataImported"];
    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"IdentityDataHash"];
    identityDataHash = v5->_identityDataHash;
    v5->_identityDataHash = (NSData *)v24;

    v26 = (void *)MEMORY[0x189604010];
    uint64_t v27 = objc_opt_class();
    objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v29 = [v4 decodeObjectOfClasses:v28 forKey:@"Certificates"];
    certificates = v5->_certificates;
    v5->_certificates = (NSArray *)v29;

    v31 = (void *)MEMORY[0x189604010];
    uint64_t v32 = objc_opt_class();
    objc_msgSend(v31, "setWithObjects:", v32, objc_opt_class(), 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v34 = [v4 decodeObjectOfClasses:v33 forKey:@"AdditionalHTTPHeaders"];
    additionalHTTPHeaderFields = v5->_additionalHTTPHeaderFields;
    v5->_additionalHTTPHeaderFields = (NSDictionary *)v34;

    v36 = (void *)MEMORY[0x189604010];
    uint64_t v37 = objc_opt_class();
    objc_msgSend(v36, "setWithObjects:", v37, objc_opt_class(), 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v39 = [v4 decodeObjectOfClasses:v38 forKey:@"RawPublicKeys"];
    rawPublicKeys = v5->_rawPublicKeys;
    v5->_rawPublicKeys = (NSArray *)v39;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v20 = a3;
  -[NERelay HTTP3RelayURL](self, "HTTP3RelayURL");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 encodeObject:v4 forKey:@"HTTP3RelayURL"];
  v5 = -[NERelay HTTP2RelayURL](self, "HTTP2RelayURL");
  [v20 encodeObject:v5 forKey:@"HTTP2RelayURL"];

  -[NERelay dnsOverHTTPSURL](self, "dnsOverHTTPSURL");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 encodeObject:v6 forKey:@"DNSOverHTTPSURL"];
  v7 = -[NERelay syntheticDNSAnswerIPv4Prefix](self, "syntheticDNSAnswerIPv4Prefix");
  [v20 encodeObject:v7 forKey:@"SyntheticIPv4Prefix"];

  -[NERelay syntheticDNSAnswerIPv6Prefix](self, "syntheticDNSAnswerIPv6Prefix");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 encodeObject:v8 forKey:@"SyntheticIPv6Prefix"];
  v9 = -[NERelay identity](self, "identity");
  [v20 encodeObject:v9 forKey:@"Identity"];

  -[NERelay identityDataInternal](self, "identityDataInternal");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 encodeObject:v10 forKey:@"IdentityData"];
  v11 = -[NERelay identityDataPassword](self, "identityDataPassword");
  [v20 encodeObject:v11 forKey:@"IdentityDataPassword"];

  -[NERelay identityDataPasswordKeychainItem](self, "identityDataPasswordKeychainItem");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 encodeObject:v12 forKey:@"IdentityDataPasswordKeychainItem"];

  objc_msgSend( v20,  "encodeBool:forKey:",  -[NERelay identityDataImported](self, "identityDataImported"),  @"IdentityDataImported");
  v13 = -[NERelay identityDataHash](self, "identityDataHash");
  [v20 encodeObject:v13 forKey:@"IdentityDataHash"];

  if (self)
  {
    objc_msgSend(v20, "encodeObject:forKey:", objc_getProperty(self, v14, 96, 1), @"Certificates");
    v15 = -[NERelay additionalHTTPHeaderFields](self, "additionalHTTPHeaderFields");
    [v20 encodeObject:v15 forKey:@"AdditionalHTTPHeaders"];

    -[NERelay rawPublicKeys](self, "rawPublicKeys");
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 encodeObject:v16 forKey:@"RawPublicKeys"];
    v17 = -[NERelay HTTP3RelayURL](self, "HTTP3RelayURL");
    if (v17)
    {
      self = 0LL;
    }

    else
    {
      -[NERelay HTTP2RelayURL](self, "HTTP2RelayURL");
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      self = (NERelay *)(v18 != 0LL);
    }
  }

  else
  {
    [v20 encodeObject:0 forKey:@"Certificates"];
    [0 additionalHTTPHeaderFields];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 encodeObject:v19 forKey:@"AdditionalHTTPHeaders"];

    [0 rawPublicKeys];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 encodeObject:v17 forKey:@"RawPublicKeys"];
  }

  [v20 encodeBool:self forKey:@"HTTP2Only"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[NERelay HTTP3RelayURL](self, "HTTP3RelayURL");
  [v4 setHTTP3RelayURL:v5];

  -[NERelay HTTP2RelayURL](self, "HTTP2RelayURL");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setHTTP2RelayURL:v6];
  v7 = -[NERelay dnsOverHTTPSURL](self, "dnsOverHTTPSURL");
  [v4 setDnsOverHTTPSURL:v7];

  -[NERelay syntheticDNSAnswerIPv4Prefix](self, "syntheticDNSAnswerIPv4Prefix");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setSyntheticDNSAnswerIPv4Prefix:v8];
  v9 = -[NERelay syntheticDNSAnswerIPv6Prefix](self, "syntheticDNSAnswerIPv6Prefix");
  [v4 setSyntheticDNSAnswerIPv6Prefix:v9];

  -[NERelay identity](self, "identity");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setIdentity:v10];
  v11 = -[NERelay identityDataInternal](self, "identityDataInternal");
  [v4 setIdentityDataInternal:v11];

  -[NERelay identityDataPassword](self, "identityDataPassword");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setIdentityDataPassword:v12];
  v13 = -[NERelay identityDataPasswordKeychainItem](self, "identityDataPasswordKeychainItem");
  [v4 setIdentityDataPasswordKeychainItem:v13];

  objc_msgSend(v4, "setIdentityDataImported:", -[NERelay identityDataImported](self, "identityDataImported"));
  -[NERelay identityDataHash](self, "identityDataHash");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setIdentityDataHash:v14];

  if (!self)
  {
    id Property = 0LL;
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  id Property = objc_getProperty(self, v15, 96LL, 1);
  if (v4) {
LABEL_3:
  }
    objc_setProperty_atomic(v4, v15, Property, 96LL);
LABEL_4:
  v17 = -[NERelay additionalHTTPHeaderFields](self, "additionalHTTPHeaderFields", Property);
  [v4 setAdditionalHTTPHeaderFields:v17];

  -[NERelay rawPublicKeys](self, "rawPublicKeys");
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setRawPublicKeys:v18];

  return v4;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v5 = -[NERelay HTTP3RelayURL](self, "HTTP3RelayURL");
  if (v5)
  {

LABEL_4:
    LOBYTE(v6) = 1;
    goto LABEL_5;
  }

  -[NERelay HTTP2RelayURL](self, "HTTP2RelayURL");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6) {
    goto LABEL_4;
  }
  +[NEConfiguration addError:toList:]((uint64_t)&OBJC_CLASS___NEConfiguration, @"Missing relay URL", v4);
LABEL_5:
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  v7 = -[NERelay additionalHTTPHeaderFields](self, "additionalHTTPHeaderFields", 0LL);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0LL; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (isa_nsstring(v12))
        {
          v13 = -[NERelay additionalHTTPHeaderFields](self, "additionalHTTPHeaderFields");
          [v13 objectForKeyedSubscript:v12];
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
          char v15 = isa_nsstring(v14);

          if ((v15 & 1) != 0) {
            continue;
          }
        }

        +[NEConfiguration addError:toList:]((uint64_t)&OBJC_CLASS___NEConfiguration, @"Invalid HTTP headers", v4);
        LOBYTE(v6) = 0;
        goto LABEL_16;
      }

      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v7 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithCapacity:0];
  unint64_t v8 = a4 & 0xFFFFFFFFFFFFFFF7LL;
  -[NERelay HTTP3RelayURL](self, "HTTP3RelayURL");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v10 = a4 | 9;
  [v7 appendPrettyObject:v9 withName:@"HTTP3RelayURL" andIndent:v5 options:a4 | 9];
  v11 = -[NERelay HTTP2RelayURL](self, "HTTP2RelayURL");
  [v7 appendPrettyObject:v11 withName:@"HTTP2RelayURL" andIndent:v5 options:a4 | 9];

  -[NERelay dnsOverHTTPSURL](self, "dnsOverHTTPSURL");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v12 withName:@"dnsOverHTTPSURL" andIndent:v5 options:a4 | 9];
  v13 = -[NERelay syntheticDNSAnswerIPv4Prefix](self, "syntheticDNSAnswerIPv4Prefix");
  [v7 appendPrettyObject:v13 withName:@"syntheticDNSAnswerIPv4Prefix" andIndent:v5 options:a4 | 9];

  -[NERelay syntheticDNSAnswerIPv6Prefix](self, "syntheticDNSAnswerIPv6Prefix");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v14 withName:@"syntheticDNSAnswerIPv6Prefix" andIndent:v5 options:a4 | 9];

  -[NERelay identity](self, "identity");
  char v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v15 withName:@"identity" andIndent:v5 options:a4 & 0xFFFFFFFFFFFFFFF7];

  -[NERelay identityDataInternal](self, "identityDataInternal");
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    __int128 v17 = (void *)NSString;
    -[NERelay identityDataInternal](self, "identityDataInternal");
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", @"%lu bytes", objc_msgSend(v18, "length"));
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v20 = a4 | 8;
    [v7 appendPrettyObject:v19 withName:@"identityData" andIndent:v5 options:v20];
  }

  else
  {
    unint64_t v20 = a4 | 8;
    [v7 appendPrettyObject:0 withName:@"identityData" andIndent:v5 options:v20];
  }

  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NERelay identityDataImported](self, "identityDataImported"),  @"identityDataImported",  v5,  v8);
  v21 = -[NERelay identityDataHash](self, "identityDataHash");
  [v7 appendPrettyObject:v21 withName:@"identityDataHash" andIndent:v5 options:v8];

  -[NERelay identityDataPasswordKeychainItem](self, "identityDataPasswordKeychainItem");
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v22 withName:@"identityDataPassword" andIndent:v5 options:v8];
  v23 = -[NERelay identityReference](self, "identityReference");
  [v7 appendPrettyObject:v23 withName:@"identityReference" andIndent:v5 options:v20];

  -[NERelay identityDataPassword](self, "identityDataPassword");
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v24 withName:@"identityDataPassword" andIndent:v5 options:v10];

  if (self) {
    id Property = objc_getProperty(self, v25, 96LL, 1);
  }
  else {
    id Property = 0LL;
  }
  [v7 appendPrettyObject:Property withName:@"certificates" andIndent:v5 options:v8];
  -[NERelay additionalHTTPHeaderFields](self, "additionalHTTPHeaderFields");
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v27 withName:@"additionalHTTPHeaderFields" andIndent:v5 options:v8];
  v28 = -[NERelay rawPublicKeys](self, "rawPublicKeys");
  [v7 appendPrettyObject:v28 withName:@"rawPublicKeys" andIndent:v5 options:v8];

  return v7;
}

- (void)setIdentityReferenceInternal:(id)a3
{
  id v12 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  if (v12)
  {
    -[NERelay identity](v4, "identity");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[NERelay identity](v4, "identity");
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      [v6 setPersistentReference:v12];
    }

    else
    {
      unint64_t v8 = objc_alloc(&OBJC_CLASS___NEIdentityKeychainItem);
      if (v4)
      {
        int64_t keychainDomain = v4->_keychainDomain;
        id Property = objc_getProperty(v4, v7, 88LL, 1);
      }

      else
      {
        int64_t keychainDomain = 0LL;
        id Property = 0LL;
      }

      id v6 = Property;
      v11 = -[NEKeychainItem initWithPersistentReference:domain:accessGroup:]( v8,  "initWithPersistentReference:domain:accessGroup:",  v12,  keychainDomain,  v6);
      -[NERelay setIdentity:](v4, "setIdentity:", v11);
    }
  }

  else
  {
    -[NERelay setIdentity:](v4, "setIdentity:", 0LL);
  }

  objc_sync_exit(v4);
}

- (void)setIdentityWithKey:(id)a3 keyRef:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  uint64_t v9 = objc_alloc(&OBJC_CLASS___NEIdentityKeychainItem);
  if (v7)
  {
    int64_t keychainDomain = v7->_keychainDomain;
    id Property = objc_getProperty(v7, v8, 88LL, 1);
  }

  else
  {
    int64_t keychainDomain = 0LL;
    id Property = 0LL;
  }

  id v12 = Property;
  v13 = -[NEKeychainItem initWithPersistentReference:keyReference:isModernSystem:domain:accessGroup:]( v9,  "initWithPersistentReference:keyReference:isModernSystem:domain:accessGroup:",  v14,  v6,  1LL,  keychainDomain,  v12);
  -[NERelay setIdentity:](v7, "setIdentity:", v13);

  objc_sync_exit(v7);
}

- (NSData)identityReferenceInternal
{
  v2 = self;
  objc_sync_enter(v2);
  -[NERelay identity](v2, "identity");
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NERelay identity](v2, "identity");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 persistentReference];
    objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_sync_exit(v2);

  return (NSData *)v3;
}

- (void)setIdentityData:(NSData *)identityData
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  id v4 = identityData;
  -[NERelay setIdentityDataInternal:](self, "setIdentityDataInternal:", v4);
  if (v4)
  {
    CC_SHA1_Init(&c);
    uint64_t v5 = v4;
    CC_SHA1_Update(&c, -[NSData bytes](v5, "bytes"), -[NSData length](v5, "length"));
    CC_SHA1_Final(md, &c);
    [MEMORY[0x189603F48] dataWithBytes:md length:20];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NERelay setIdentityDataHash:](self, "setIdentityDataHash:", v6);
  }

  else
  {
    -[NERelay setIdentityDataHash:](self, "setIdentityDataHash:", 0LL);
  }
}

- (void)setCertificateReferences:(id)a3
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  if (v4)
  {
    id newValue = objc_alloc_init(MEMORY[0x189603FA8]);
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v22;
      do
      {
        uint64_t v10 = 0LL;
        do
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8 * v10);
          v13 = objc_alloc(&OBJC_CLASS___NEKeychainItem);
          if (v5)
          {
            int64_t keychainDomain = v5->_keychainDomain;
            id Property = objc_getProperty(v5, v12, 88LL, 1);
          }

          else
          {
            int64_t keychainDomain = 0LL;
            id Property = 0LL;
          }

          id v16 = Property;
          __int128 v17 = -[NEKeychainItem initWithPersistentReference:domain:accessGroup:]( v13,  "initWithPersistentReference:domain:accessGroup:",  v11,  keychainDomain,  v16);

          if (v17) {
            [newValue addObject:v17];
          }

          ++v10;
        }

        while (v8 != v10);
        uint64_t v18 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
        uint64_t v8 = v18;
      }

      while (v18);
    }

    if (v5) {
      objc_setProperty_atomic(v5, v19, newValue, 96LL);
    }
  }

  else if (v5)
  {
    objc_setProperty_atomic(v5, v6, 0LL, 96LL);
  }

  objc_sync_exit(v5);
}

- (NSArray)certificateReferences
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  v2 = self;
  objc_sync_enter(v2);
  if (v2 && objc_getProperty(v2, v3, 96LL, 1))
  {
    id v4 = objc_alloc_init(MEMORY[0x189603FA8]);
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    id v6 = objc_getProperty(v2, v5, 96LL, 1);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0LL;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v9), "persistentReference", (void)v12);
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10) {
            [v4 addObject:v10];
          }

          ++v9;
        }

        while (v7 != v9);
        uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }

      while (v7);
    }
  }

  else
  {
    id v4 = 0LL;
  }

  objc_sync_exit(v2);

  return (NSArray *)v4;
}

- (void)syncWithKeychainInDomainCommon:(int64_t)a3
{
  uint64_t v5 = -[NERelay identity](self, "identity");
  if (v5)
  {
    id v6 = (void *)v5;
    -[NERelay identity](self, "identity");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 domain];

    if (v8 == a3)
    {
      -[NERelay identity](self, "identity");
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 sync];
    }
  }

  if (!a3) {
    -[NERelay setIdentityDataPassword:](self, "setIdentityDataPassword:", 0LL);
  }
}

- (void)clearKeychainItemsInDomain:(int64_t)a3 removeItems:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v26 = *MEMORY[0x1895F89C0];
  uint64_t v7 = -[NERelay identityDataPasswordKeychainItem](self, "identityDataPasswordKeychainItem");
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    -[NERelay identityDataPasswordKeychainItem](self, "identityDataPasswordKeychainItem");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v9 domain];

    if (v10 == a3)
    {
      -[NERelay identityDataPasswordKeychainItem](self, "identityDataPasswordKeychainItem");
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 setIdentifier:0];
    }
  }

  if (v4)
  {
    -[NERelay identity](self, "identity");
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 remove];

    -[NERelay setIdentityData:](self, "setIdentityData:", 0LL);
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    if (self) {
      id Property = objc_getProperty(self, v13, 96LL, 1);
    }
    else {
      id Property = 0LL;
    }
    id v15 = Property;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v22;
      do
      {
        for (uint64_t i = 0LL; i != v17; ++i)
        {
          if (*(void *)v22 != v18) {
            objc_enumerationMutation(v15);
          }
          objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "remove", (void)v21);
        }

        uint64_t v17 = [v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }

      while (v17);
    }
  }

  else
  {
    -[NERelay setIdentityData:](self, "setIdentityData:", 0LL);
  }

  if (self) {
    objc_setProperty_atomic(self, v20, 0LL, 96LL);
  }
}

- (void)copyPasswordsFromKeychainInDomain:(int64_t)a3
{
  if (!a3)
  {
    -[NERelay identityDataPasswordKeychainItem](self, "identityDataPasswordKeychainItem");
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[NERelay identityDataPasswordKeychainItem](self, "identityDataPasswordKeychainItem");
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v5 = (void *)[v6 copyPassword];
      -[NERelay setIdentityDataPassword:](self, "setIdentityDataPassword:", v5);
    }
  }

- (id)description
{
  return -[NERelay descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0LL, 0LL);
}

- (NSURL)HTTP3RelayURL
{
  return (NSURL *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setHTTP3RelayURL:(NSURL *)HTTP3RelayURL
{
}

- (NSURL)HTTP2RelayURL
{
  return (NSURL *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setHTTP2RelayURL:(NSURL *)HTTP2RelayURL
{
}

- (NSURL)dnsOverHTTPSURL
{
  return (NSURL *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setDnsOverHTTPSURL:(NSURL *)dnsOverHTTPSURL
{
}

- (NSString)syntheticDNSAnswerIPv4Prefix
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setSyntheticDNSAnswerIPv4Prefix:(NSString *)syntheticDNSAnswerIPv4Prefix
{
}

- (NSString)syntheticDNSAnswerIPv6Prefix
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setSyntheticDNSAnswerIPv6Prefix:(NSString *)syntheticDNSAnswerIPv6Prefix
{
}

- (NSDictionary)additionalHTTPHeaderFields
{
  return (NSDictionary *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setAdditionalHTTPHeaderFields:(NSDictionary *)additionalHTTPHeaderFields
{
}

- (NSArray)rawPublicKeys
{
  return (NSArray *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setRawPublicKeys:(NSArray *)rawPublicKeys
{
}

- (NSString)identityDataPassword
{
  return (NSString *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setIdentityDataPassword:(NSString *)identityDataPassword
{
}

- (NSData)identityDataInternal
{
  return (NSData *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setIdentityDataInternal:(id)a3
{
}

- (BOOL)identityDataImported
{
  return self->_identityDataImported;
}

- (void)setIdentityDataImported:(BOOL)a3
{
  self->_identityDataImported = a3;
}

- (NSData)identityDataHash
{
  return (NSData *)objc_getProperty(self, a2, 112LL, 1);
}

- (void)setIdentityDataHash:(id)a3
{
}

- (NEKeychainItem)identityDataPasswordKeychainItem
{
  return (NEKeychainItem *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setIdentityDataPasswordKeychainItem:(id)a3
{
}

- (NEIdentityKeychainItem)identity
{
  return (NEIdentityKeychainItem *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setIdentity:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end