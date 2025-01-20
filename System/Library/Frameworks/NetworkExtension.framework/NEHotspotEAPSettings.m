@interface NEHotspotEAPSettings
+ (BOOL)supportsSecureCoding;
- (BOOL)isTLSClientCertificateRequired;
- (BOOL)setIdentity:(SecIdentityRef)identity;
- (BOOL)setTrustedServerCertificates:(NSArray *)certificates;
- (NEHotspotConfigurationEAPTLSVersion)preferredTLSVersion;
- (NEHotspotConfigurationTTLSInnerAuthenticationType)ttlsInnerAuthenticationType;
- (NEHotspotEAPSettings)initWithCoder:(id)a3;
- (NSArray)clientTrustChainReference;
- (NSArray)supportedEAPTypes;
- (NSArray)trustedServerCertificateReferences;
- (NSArray)trustedServerNames;
- (NSData)identityReference;
- (NSString)outerIdentity;
- (NSString)password;
- (NSString)username;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setClientTrustChainReference:(id)a3;
- (void)setIdentityReference:(id)a3;
- (void)setOuterIdentity:(NSString *)outerIdentity;
- (void)setPassword:(NSString *)password;
- (void)setPreferredTLSVersion:(NEHotspotConfigurationEAPTLSVersion)preferredTLSVersion;
- (void)setSupportedEAPTypes:(NSArray *)supportedEAPTypes;
- (void)setTlsClientCertificateRequired:(BOOL)tlsClientCertificateRequired;
- (void)setTrustedServerCertificateReferences:(id)a3;
- (void)setTrustedServerNames:(NSArray *)trustedServerNames;
- (void)setTtlsInnerAuthenticationType:(NEHotspotConfigurationTTLSInnerAuthenticationType)ttlsInnerAuthenticationType;
- (void)setUsername:(NSString *)username;
@end

@implementation NEHotspotEAPSettings

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x189607940]);
  v4 = -[NEHotspotEAPSettings supportedEAPTypes](self, "supportedEAPTypes");
  [v3 appendPrettyObject:v4 withName:@"Supported EAP Types" andIndent:0 options:0];
  v5 = -[NEHotspotEAPSettings username](self, "username");
  uint64_t v6 = [v5 length];

  if (v6)
  {
    v7 = -[NEHotspotEAPSettings username](self, "username");
    [v3 appendPrettyObject:v7 withName:@"Username" andIndent:0 options:0];
  }
  v8 = -[NEHotspotEAPSettings password](self, "password");
  uint64_t v9 = [v8 length];

  if (v9)
  {
    v10 = -[NEHotspotEAPSettings password](self, "password");
    [v3 appendPrettyObject:v10 withName:@"Password" andIndent:0 options:3];
  }
  v11 = -[NEHotspotEAPSettings outerIdentity](self, "outerIdentity");
  uint64_t v12 = [v11 length];

  if (v12)
  {
    v13 = -[NEHotspotEAPSettings outerIdentity](self, "outerIdentity");
    [v3 appendPrettyObject:v13 withName:@"Outer Identity" andIndent:0 options:0];
  }
  v14 = -[NEHotspotEAPSettings trustedServerNames](self, "trustedServerNames");
  if (v14)
  {
    v15 = -[NEHotspotEAPSettings trustedServerNames](self, "trustedServerNames");
    [v3 appendPrettyObject:v15 withName:@"Trusted Server Names" andIndent:0 options:0];
  }

  if (-[NEHotspotEAPSettings isTLSClientCertificateRequired](self, "isTLSClientCertificateRequired")) {
    v16 = @"YES";
  }
  else {
    v16 = @"NO";
  }
  [v3 appendPrettyObject:v16 withName:@"TLS Client Certificate Required" andIndent:0 options:0];
  NEHotspotConfigurationEAPTLSVersion v17 = -[NEHotspotEAPSettings preferredTLSVersion](self, "preferredTLSVersion");
  else {
    v18 = off_18A08C868[v17];
  }
  [v3 appendPrettyObject:v18 withName:@"Preferred TLS Version" andIndent:0 options:0];
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = -[NEHotspotEAPSettings init]( +[NEHotspotEAPSettings allocWithZone:](&OBJC_CLASS___NEHotspotEAPSettings, "allocWithZone:", a3),  "init");
  -[NEHotspotEAPSettings setSupportedEAPTypes:](v4, "setSupportedEAPTypes:", self->_supportedEAPTypes);
  -[NEHotspotEAPSettings setUsername:](v4, "setUsername:", self->_username);
  -[NEHotspotEAPSettings setOuterIdentity:](v4, "setOuterIdentity:", self->_outerIdentity);
  -[NEHotspotEAPSettings setTtlsInnerAuthenticationType:]( v4,  "setTtlsInnerAuthenticationType:",  self->_ttlsInnerAuthenticationType);
  -[NEHotspotEAPSettings setPassword:](v4, "setPassword:", self->_password);
  -[NEHotspotEAPSettings setIdentityReference:](v4, "setIdentityReference:", self->_identityReference);
  -[NEHotspotEAPSettings setClientTrustChainReference:]( v4,  "setClientTrustChainReference:",  self->_clientTrustChainReference);
  -[NEHotspotEAPSettings setTrustedServerNames:](v4, "setTrustedServerNames:", self->_trustedServerNames);
  -[NEHotspotEAPSettings setTrustedServerCertificateReferences:]( v4,  "setTrustedServerCertificateReferences:",  self->_trustedServerCertificateReferences);
  -[NEHotspotEAPSettings setTlsClientCertificateRequired:]( v4,  "setTlsClientCertificateRequired:",  self->_tlsClientCertificateRequired);
  -[NEHotspotEAPSettings setPreferredTLSVersion:](v4, "setPreferredTLSVersion:", self->_preferredTLSVersion);
  return v4;
}

- (NEHotspotEAPSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[NEHotspotEAPSettings init](self, "init");
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x189604010];
    uint64_t v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"SupportedEAPTypes"];
    supportedEAPTypes = v5->_supportedEAPTypes;
    v5->_supportedEAPTypes = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UserName"];
    username = v5->_username;
    v5->_username = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"OuterIdentity"];
    outerIdentity = v5->_outerIdentity;
    v5->_outerIdentity = (NSString *)v13;

    v5->_ttlsInnerAuthenticationType = [v4 decodeInt64ForKey:@"TTLSInnerAuthenticationType"];
    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UserPassword"];
    password = v5->_password;
    v5->_password = (NSString *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"IdentityReference"];
    identityReference = v5->_identityReference;
    v5->_identityReference = (NSData *)v17;

    v19 = (void *)MEMORY[0x189604010];
    uint64_t v20 = objc_opt_class();
    objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v22 = [v4 decodeObjectOfClasses:v21 forKey:@"ClientTrustChainReference"];
    clientTrustChainReference = v5->_clientTrustChainReference;
    v5->_clientTrustChainReference = (NSArray *)v22;

    v24 = (void *)MEMORY[0x189604010];
    uint64_t v25 = objc_opt_class();
    objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v27 = [v4 decodeObjectOfClasses:v26 forKey:@"TrustedServerNames"];
    trustedServerNames = v5->_trustedServerNames;
    v5->_trustedServerNames = (NSArray *)v27;

    v29 = (void *)MEMORY[0x189604010];
    uint64_t v30 = objc_opt_class();
    objc_msgSend(v29, "setWithObjects:", v30, objc_opt_class(), 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v32 = [v4 decodeObjectOfClasses:v31 forKey:@"TrustedServerCertificateRefs"];
    trustedServerCertificateReferences = v5->_trustedServerCertificateReferences;
    v5->_trustedServerCertificateReferences = (NSArray *)v32;

    v5->_tlsClientCertificateRequired = [v4 decodeBoolForKey:@"TLSIsCertificateRequiredKey"];
    v5->_preferredTLSVersion = [v4 decodeInt64ForKey:@"PreferredTLSVersion"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v12 = a3;
  -[NEHotspotEAPSettings supportedEAPTypes](self, "supportedEAPTypes");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 encodeObject:v4 forKey:@"SupportedEAPTypes"];
  v5 = -[NEHotspotEAPSettings username](self, "username");
  [v12 encodeObject:v5 forKey:@"UserName"];

  -[NEHotspotEAPSettings outerIdentity](self, "outerIdentity");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 encodeObject:v6 forKey:@"OuterIdentity"];

  objc_msgSend( v12,  "encodeInt64:forKey:",  -[NEHotspotEAPSettings ttlsInnerAuthenticationType](self, "ttlsInnerAuthenticationType"),  @"TTLSInnerAuthenticationType");
  -[NEHotspotEAPSettings password](self, "password");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 encodeObject:v7 forKey:@"UserPassword"];
  v8 = -[NEHotspotEAPSettings identityReference](self, "identityReference");
  [v12 encodeObject:v8 forKey:@"IdentityReference"];

  -[NEHotspotEAPSettings clientTrustChainReference](self, "clientTrustChainReference");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 encodeObject:v9 forKey:@"ClientTrustChainReference"];
  v10 = -[NEHotspotEAPSettings trustedServerNames](self, "trustedServerNames");
  [v12 encodeObject:v10 forKey:@"TrustedServerNames"];

  -[NEHotspotEAPSettings trustedServerCertificateReferences](self, "trustedServerCertificateReferences");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 encodeObject:v11 forKey:@"TrustedServerCertificateRefs"];

  objc_msgSend( v12,  "encodeBool:forKey:",  -[NEHotspotEAPSettings isTLSClientCertificateRequired](self, "isTLSClientCertificateRequired"),  @"TLSIsCertificateRequiredKey");
  objc_msgSend( v12,  "encodeInt64:forKey:",  -[NEHotspotEAPSettings preferredTLSVersion](self, "preferredTLSVersion"),  @"PreferredTLSVersion");
}

- (BOOL)setTrustedServerCertificates:(NSArray *)certificates
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  id v4 = certificates;
  v5 = v4;
  CFTypeRef result = 0LL;
  if (v4 && -[NSArray count](v4, "count") && -[NSArray count](v5, "count") < 0xB)
  {
    objc_msgSend(MEMORY[0x189603FC8], "dictionaryWithObjectsAndKeys:", *MEMORY[0x189604DE8], *MEMORY[0x18960BE28], 0);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    id v6 = objc_alloc_init(MEMORY[0x189603FA8]);
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    v10 = v5;
    uint64_t v11 = -[NSArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v30,  v39,  16LL);
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v31;
      uint64_t v14 = *MEMORY[0x18960BE88];
      v29 = self;
LABEL_10:
      uint64_t v15 = 0LL;
      while (1)
      {
        if (*(void *)v31 != v13) {
          objc_enumerationMutation(v10);
        }
        v16 = *(const void **)(*((void *)&v30 + 1) + 8 * v15);
        CFTypeID v17 = CFGetTypeID(v16);
        if (v17 != SecCertificateGetTypeID()) {
          break;
        }
        [v9 setObject:v16 forKeyedSubscript:v14];
        OSStatus v18 = SecItemCopyMatching((CFDictionaryRef)v9, &result);
        if (v18)
        {
          OSStatus v24 = v18;
          ne_log_obj();
          uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            uint64_t v25 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138412546;
            id v36 = v25;
            __int16 v37 = 1024;
            OSStatus v38 = v24;
            id v22 = v25;
            v23 = "%@ failed to find persistent reference for trusted server certificate. status = %d";
            v26 = v20;
            uint32_t v27 = 18;
            goto LABEL_30;
          }

- (BOOL)setIdentity:(SecIdentityRef)identity
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  CFTypeRef result = 0LL;
  if (identity)
  {
    objc_msgSend( MEMORY[0x189603FC8],  "dictionaryWithObjectsAndKeys:",  *MEMORY[0x18960BE88],  *MEMORY[0x189604DE8],  *MEMORY[0x18960BE28],  0);
    id v4 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    OSStatus v5 = SecItemCopyMatching(v4, &result);
    if (v5)
    {
      OSStatus v6 = v5;
      ne_log_obj();
      identityReference = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(identityReference, OS_LOG_TYPE_ERROR)) {
        goto LABEL_4;
      }
      uint64_t v15 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412546;
      id v19 = v15;
      __int16 v20 = 1024;
      OSStatus v21 = v6;
      id v11 = v15;
      uint64_t v12 = "%@ failed to find persistent reference for identity. status = %d";
      uint64_t v13 = identityReference;
      uint32_t v14 = 18;
    }

    else
    {
      if (result)
      {
        identityReference = (os_log_s *)self->_identityReference;
        self->_identityReference = (NSData *)result;
        BOOL v8 = 1;
        goto LABEL_10;
      }

      ne_log_obj();
      identityReference = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(identityReference, OS_LOG_TYPE_ERROR))
      {
LABEL_4:
        BOOL v8 = 0;
LABEL_10:

        goto LABEL_11;
      }

      v10 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      id v19 = v10;
      id v11 = v10;
      uint64_t v12 = "%@ found nil persistent reference for identity";
      uint64_t v13 = identityReference;
      uint32_t v14 = 12;
    }

    _os_log_error_impl(&dword_1876B1000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);

    goto LABEL_4;
  }

  ne_log_obj();
  id v4 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = (id)objc_opt_class();
    id v16 = v19;
    _os_log_error_impl(&dword_1876B1000, v4, OS_LOG_TYPE_ERROR, "%@ invalid input data for identity", buf, 0xCu);
  }

  BOOL v8 = 0;
LABEL_11:

  return v8;
}

- (NSArray)supportedEAPTypes
{
  return (NSArray *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setSupportedEAPTypes:(NSArray *)supportedEAPTypes
{
}

- (NSString)username
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setUsername:(NSString *)username
{
}

- (NSString)outerIdentity
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setOuterIdentity:(NSString *)outerIdentity
{
}

- (NEHotspotConfigurationTTLSInnerAuthenticationType)ttlsInnerAuthenticationType
{
  return self->_ttlsInnerAuthenticationType;
}

- (void)setTtlsInnerAuthenticationType:(NEHotspotConfigurationTTLSInnerAuthenticationType)ttlsInnerAuthenticationType
{
  self->_ttlsInnerAuthenticationType = ttlsInnerAuthenticationType;
}

- (NSString)password
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setPassword:(NSString *)password
{
}

- (NSArray)trustedServerNames
{
  return (NSArray *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setTrustedServerNames:(NSArray *)trustedServerNames
{
}

- (BOOL)isTLSClientCertificateRequired
{
  return self->_tlsClientCertificateRequired;
}

- (void)setTlsClientCertificateRequired:(BOOL)tlsClientCertificateRequired
{
  self->_tlsClientCertificateRequired = tlsClientCertificateRequired;
}

- (NEHotspotConfigurationEAPTLSVersion)preferredTLSVersion
{
  return self->_preferredTLSVersion;
}

- (void)setPreferredTLSVersion:(NEHotspotConfigurationEAPTLSVersion)preferredTLSVersion
{
  self->_preferredTLSVersion = preferredTLSVersion;
}

- (NSArray)clientTrustChainReference
{
  return (NSArray *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setClientTrustChainReference:(id)a3
{
}

- (NSData)identityReference
{
  return (NSData *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setIdentityReference:(id)a3
{
}

- (NSArray)trustedServerCertificateReferences
{
  return (NSArray *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setTrustedServerCertificateReferences:(id)a3
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