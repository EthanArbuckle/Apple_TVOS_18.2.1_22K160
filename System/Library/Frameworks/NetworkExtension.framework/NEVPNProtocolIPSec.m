@interface NEVPNProtocolIPSec
+ (BOOL)supportsSecureCoding;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)extendedAuthPasswordPrompt;
- (BOOL)needToUpdateKeychain;
- (BOOL)useExtendedAuthentication;
- (NEKeychainItem)sharedSecretKeychainItem;
- (NEVPNIKEAuthenticationMethod)authenticationMethod;
- (NEVPNProtocolIPSec)init;
- (NEVPNProtocolIPSec)initWithCoder:(id)a3;
- (NEVPNProtocolIPSec)initWithType:(int64_t)a3;
- (NSArray)legacyExchangeMode;
- (NSArray)legacyProposals;
- (NSData)sharedSecretReference;
- (NSString)localIdentifier;
- (NSString)remoteIdentifier;
- (__SCNetworkInterface)createInterface;
- (id)copyLegacyDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)initFromLegacyDictionary:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)migratePasswordsFromPreferences:(__SCPreferences *)a3;
- (void)removeKeychainItemsInDomain:(int64_t)a3 keepIdentity:(BOOL)a4;
- (void)setAuthenticationMethod:(NEVPNIKEAuthenticationMethod)authenticationMethod;
- (void)setExtendedAuthPasswordPrompt:(BOOL)a3;
- (void)setLegacyExchangeMode:(id)a3;
- (void)setLegacyProposals:(id)a3;
- (void)setLocalIdentifier:(NSString *)localIdentifier;
- (void)setRemoteIdentifier:(NSString *)remoteIdentifier;
- (void)setSharedSecretKeychainItem:(id)a3;
- (void)setSharedSecretReference:(NSData *)sharedSecretReference;
- (void)setUseExtendedAuthentication:(BOOL)useExtendedAuthentication;
- (void)syncWithKeychainInDomain:(int64_t)a3 configuration:(id)a4 suffix:(id)a5;
@end

@implementation NEVPNProtocolIPSec

- (NEVPNProtocolIPSec)init
{
  return -[NEVPNProtocolIPSec initWithType:](self, "initWithType:", 1LL);
}

- (NEVPNProtocolIPSec)initWithType:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NEVPNProtocolIPSec;
  v3 = -[NEVPNProtocol initWithType:](&v6, sel_initWithType_, a3);
  v4 = v3;
  if (v3)
  {
    v3->super._keychainDomain = 0LL;
    -[NEVPNProtocol setDisconnectOnWake:](v3, "setDisconnectOnWake:", 1LL);
    v4->_authenticationMethod = 0LL;
    v4->_useExtendedAuthentication = 1;
    v4->_extendedAuthPasswordPrompt = 0;
  }

  return v4;
}

- (NEVPNProtocolIPSec)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___NEVPNProtocolIPSec;
  v5 = -[NEVPNProtocol initWithCoder:](&v25, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_authenticationMethod = (int)[v4 decodeInt32ForKey:@"AuthenticationMethod"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SharedSecret"];
    sharedSecretKeychainItem = v5->_sharedSecretKeychainItem;
    v5->_sharedSecretKeychainItem = (NEKeychainItem *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SharedSecretReference"];
    sharedSecretReference = v5->_sharedSecretReference;
    v5->_sharedSecretReference = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LocalIdentifier"];
    localIdentifier = v5->_localIdentifier;
    v5->_localIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RemoteIdentifier"];
    remoteIdentifier = v5->_remoteIdentifier;
    v5->_remoteIdentifier = (NSString *)v12;

    v5->_useExtendedAuthentication = [v4 decodeBoolForKey:@"UseExtendedAuthentication"];
    v14 = (void *)MEMORY[0x189604010];
    uint64_t v15 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"LegacyProposals"];
    legacyProposals = v5->_legacyProposals;
    v5->_legacyProposals = (NSArray *)v17;

    v19 = (void *)MEMORY[0x189604010];
    uint64_t v20 = objc_opt_class();
    objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v22 = [v4 decodeObjectOfClasses:v21 forKey:@"LegacyExchangeMode"];
    legacyExchangeMode = v5->_legacyExchangeMode;
    v5->_legacyExchangeMode = (NSArray *)v22;

    v5->_extendedAuthPasswordPrompt = [v4 decodeBoolForKey:@"ExtendedAuthPasswordPrompt"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NEVPNProtocolIPSec;
  id v4 = a3;
  -[NEVPNProtocol encodeWithCoder:](&v11, sel_encodeWithCoder_, v4);
  objc_msgSend( v4,  "encodeInt32:forKey:",  -[NEVPNProtocolIPSec authenticationMethod](self, "authenticationMethod", v11.receiver, v11.super_class),  @"AuthenticationMethod");
  v5 = -[NEVPNProtocolIPSec sharedSecretKeychainItem](self, "sharedSecretKeychainItem");
  [v4 encodeObject:v5 forKey:@"SharedSecret"];

  -[NEVPNProtocolIPSec sharedSecretReference](self, "sharedSecretReference");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"SharedSecretReference"];
  v7 = -[NEVPNProtocolIPSec localIdentifier](self, "localIdentifier");
  [v4 encodeObject:v7 forKey:@"LocalIdentifier"];

  -[NEVPNProtocolIPSec remoteIdentifier](self, "remoteIdentifier");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v8 forKey:@"RemoteIdentifier"];

  objc_msgSend( v4,  "encodeBool:forKey:",  -[NEVPNProtocolIPSec useExtendedAuthentication](self, "useExtendedAuthentication"),  @"UseExtendedAuthentication");
  v9 = -[NEVPNProtocolIPSec legacyProposals](self, "legacyProposals");
  [v4 encodeObject:v9 forKey:@"LegacyProposals"];

  -[NEVPNProtocolIPSec legacyExchangeMode](self, "legacyExchangeMode");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v10 forKey:@"LegacyExchangeMode"];

  objc_msgSend( v4,  "encodeBool:forKey:",  -[NEVPNProtocolIPSec extendedAuthPasswordPrompt](self, "extendedAuthPasswordPrompt"),  @"ExtendedAuthPasswordPrompt");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NEVPNProtocolIPSec;
  id v4 = -[NEVPNProtocol copyWithZone:](&v12, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setAuthenticationMethod:", -[NEVPNProtocolIPSec authenticationMethod](self, "authenticationMethod"));
  v5 = -[NEVPNProtocolIPSec sharedSecretKeychainItem](self, "sharedSecretKeychainItem");
  [v4 setSharedSecretKeychainItem:v5];

  -[NEVPNProtocolIPSec sharedSecretReference](self, "sharedSecretReference");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setSharedSecretReference:v6];
  v7 = -[NEVPNProtocolIPSec localIdentifier](self, "localIdentifier");
  [v4 setLocalIdentifier:v7];

  -[NEVPNProtocolIPSec remoteIdentifier](self, "remoteIdentifier");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setRemoteIdentifier:v8];

  objc_msgSend( v4,  "setUseExtendedAuthentication:",  -[NEVPNProtocolIPSec useExtendedAuthentication](self, "useExtendedAuthentication"));
  v9 = -[NEVPNProtocolIPSec legacyProposals](self, "legacyProposals");
  [v4 setLegacyProposals:v9];

  -[NEVPNProtocolIPSec legacyExchangeMode](self, "legacyExchangeMode");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setLegacyExchangeMode:v10];

  objc_msgSend( v4,  "setExtendedAuthPasswordPrompt:",  -[NEVPNProtocolIPSec extendedAuthPasswordPrompt](self, "extendedAuthPasswordPrompt"));
  return v4;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___NEVPNProtocolIPSec;
  BOOL v5 = -[NEVPNProtocol checkValidityAndCollectErrors:](&v13, sel_checkValidityAndCollectErrors_, v4);
  if (-[NEVPNProtocolIPSec authenticationMethod](self, "authenticationMethod"))
  {
    if (-[NEVPNProtocolIPSec authenticationMethod](self, "authenticationMethod") == NEVPNIKEAuthenticationMethodCertificate)
    {
      -[NEVPNProtocol identityReferenceInternal](self, "identityReferenceInternal");
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {

        goto LABEL_12;
      }

      -[NEVPNProtocol identityDataInternal](self, "identityDataInternal");
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8
        || -[NEVPNProtocolIPSec useExtendedAuthentication](self, "useExtendedAuthentication")
        && -[NEVPNProtocol type](self, "type") == 5)
      {

        goto LABEL_12;
      }

      uint64_t v10 = -[NEVPNProtocol extensibleSSOProvider](self, "extensibleSSOProvider");
      if (!v10 || (v11 = (void *)v10, int64_t v12 = -[NEVPNProtocol type](self, "type"), v11, v12 != 5))
      {
        v7 = @"Missing identity";
        goto LABEL_9;
      }
    }
  }

  else if (-[NEVPNProtocol type](self, "type") == 1 {
         || -[NEVPNProtocol type](self, "type") == 5
  }
         && !-[NEVPNProtocolIPSec useExtendedAuthentication](self, "useExtendedAuthentication"))
  {
    v7 = @"Unsupported authenticationMethod";
LABEL_9:
    +[NEConfiguration addError:toList:]((uint64_t)&OBJC_CLASS___NEConfiguration, v7, v4);
    BOOL v5 = 0;
  }

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc(MEMORY[0x189607940]);
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___NEVPNProtocolIPSec;
  -[NEVPNProtocol descriptionWithIndent:options:](&v21, sel_descriptionWithIndent_options_, v5, a4);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)[v7 initWithString:v8];

  if (-[NEVPNProtocolIPSec authenticationMethod](self, "authenticationMethod") == NEVPNIKEAuthenticationMethodNone)
  {
    unint64_t v10 = a4 | 8;
    objc_super v11 = @"none";
    goto LABEL_7;
  }

  if (-[NEVPNProtocolIPSec authenticationMethod](self, "authenticationMethod") == NEVPNIKEAuthenticationMethodCertificate)
  {
    unint64_t v10 = a4 | 8;
    objc_super v11 = @"certificate";
LABEL_7:
    [v9 appendPrettyObject:v11 withName:@"authenticationMethod" andIndent:v5 options:v10];
    goto LABEL_8;
  }

  unint64_t v10 = a4 | 8;
  if (-[NEVPNProtocolIPSec authenticationMethod](self, "authenticationMethod") == NEVPNIKEAuthenticationMethodSharedSecret)
  {
    objc_super v11 = @"shared-secret";
    goto LABEL_7;
  }

- (id)copyLegacyDictionary
{
  uint64_t v63 = *MEMORY[0x1895F89C0];
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  -[NEVPNProtocol serverAddress](self, "serverAddress");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NEVPNProtocol serverAddress](self, "serverAddress");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v5 forKeyedSubscript:*MEMORY[0x18960C670]];
  }

  if (-[NEVPNProtocolIPSec authenticationMethod](self, "authenticationMethod") == NEVPNIKEAuthenticationMethodCertificate)
  {
    uint64_t v6 = (void *)MEMORY[0x18960CAC8];
  }

  else
  {
    if (-[NEVPNProtocolIPSec authenticationMethod](self, "authenticationMethod") != NEVPNIKEAuthenticationMethodSharedSecret) {
      goto LABEL_8;
    }
    uint64_t v6 = (void *)MEMORY[0x18960CAD0];
  }

  [v3 setObject:*v6 forKeyedSubscript:*MEMORY[0x18960C650]];
LABEL_8:
  -[NEVPNProtocol username](self, "username");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NEVPNProtocol username](self, "username");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v8 forKeyedSubscript:*MEMORY[0x18960C690]];
  }
  v9 = -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
  if (v9)
  {
    -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
    unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 password];
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
    unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_super v13 = v12;
    if (v11)
    {
      uint64_t v14 = [v12 password];

      objc_super v13 = (void *)v14;
      if (!v14) {
        goto LABEL_19;
      }
      goto LABEL_13;
    }

    uint64_t v15 = [v12 identifier];
    if (!v15) {
      goto LABEL_18;
    }
    unint64_t v16 = (void *)v15;
    -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 persistentReference];
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
      [v19 identifier];
      objc_super v13 = (void *)objc_claimAutoreleasedReturnValue();

      [v3 setObject:*MEMORY[0x18960CAE8] forKeyedSubscript:*MEMORY[0x18960C6A0]];
      if (v13)
      {
LABEL_13:
        [v3 setObject:v13 forKeyedSubscript:*MEMORY[0x18960C698]];
LABEL_18:
      }
    }
  }

- (id)initFromLegacyDictionary:(id)a3
{
  uint64_t v85 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [v4 objectForKeyedSubscript:@"__NEVPNProtocolIdentifier"];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  int v6 = isa_nsuuid(v5);

  if (v6)
  {
    [v4 objectForKeyedSubscript:@"__NEVPNProtocolIdentifier"];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = -[NEVPNProtocol initWithProtocolIdentifier:](self, "initWithProtocolIdentifier:", v7);

    if (!v8) {
      goto LABEL_53;
    }
  }

  else
  {
    uint64_t v8 = -[NEVPNProtocolIPSec init](self, "init");
    if (!v8) {
      goto LABEL_53;
    }
  }

  uint64_t v9 = *MEMORY[0x18960C670];
  [v4 objectForKeyedSubscript:*MEMORY[0x18960C670]];
  unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  int v11 = isa_nsstring(v10);

  if (v11)
  {
    [v4 objectForKeyedSubscript:v9];
    unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEVPNProtocol setServerAddress:](v8, "setServerAddress:", v12);
  }

  uint64_t v13 = *MEMORY[0x18960C690];
  [v4 objectForKeyedSubscript:*MEMORY[0x18960C690]];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  int v15 = isa_nsstring(v14);

  if (v15)
  {
    [v4 objectForKeyedSubscript:v13];
    unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEVPNProtocol setUsername:](v8, "setUsername:", v16);

    -[NEVPNProtocolIPSec setUseExtendedAuthentication:](v8, "setUseExtendedAuthentication:", 1LL);
  }

  [v4 objectForKeyedSubscript:*MEMORY[0x18960C6A0]];
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v18 = *MEMORY[0x18960C698];
  [v4 objectForKeyedSubscript:*MEMORY[0x18960C698]];
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  int v20 = isa_nsstring(v19);

  if (v20)
  {
    if (isa_nsstring(v17) && [v17 isEqualToString:*MEMORY[0x18960CAE8]])
    {
      objc_super v21 = objc_alloc(&OBJC_CLASS___NEKeychainItem);
      [v4 objectForKeyedSubscript:v18];
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
      int64_t keychainDomain = v8->super._keychainDomain;
      id v25 = objc_getProperty(v8, v24, 88LL, 1);
      v26 = -[NEKeychainItem initWithLegacyIdentifier:domain:accessGroup:]( v21,  "initWithLegacyIdentifier:domain:accessGroup:",  v22,  keychainDomain,  v25);
      -[NEVPNProtocol setPasswordKeychainItem:](v8, "setPasswordKeychainItem:", v26);
    }
    v27 = -[NEVPNProtocol passwordKeychainItem](v8, "passwordKeychainItem");
    if (!v27)
    {
      v28 = objc_alloc(&OBJC_CLASS___NEKeychainItem);
      [v4 objectForKeyedSubscript:v18];
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      int64_t v30 = v8->super._keychainDomain;
      id v32 = objc_getProperty(v8, v31, 88LL, 1);
      v33 = -[NEKeychainItem initWithPassword:domain:accessGroup:]( v28,  "initWithPassword:domain:accessGroup:",  v29,  v30,  v32);
      -[NEVPNProtocol setPasswordKeychainItem:](v8, "setPasswordKeychainItem:", v33);
    }

    -[NEVPNProtocolIPSec setUseExtendedAuthentication:](v8, "setUseExtendedAuthentication:", 1LL);
  }

  [v4 objectForKeyedSubscript:@"PasswordReference"];
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  int v35 = isa_nsdata(v34);

  if (v35)
  {
    [v4 objectForKeyedSubscript:@"PasswordReference"];
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEVPNProtocol setPasswordReference:](v8, "setPasswordReference:", v36);
  }

  uint64_t v37 = *MEMORY[0x18960C688];
  [v4 objectForKeyedSubscript:*MEMORY[0x18960C688]];
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  int v39 = isa_nsnumber(v38);

  if (v39)
  {
    [v4 objectForKeyedSubscript:v37];
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEVPNProtocolIPSec setUseExtendedAuthentication:]( v8,  "setUseExtendedAuthentication:",  [v40 BOOLValue]);
  }

  uint64_t v41 = *MEMORY[0x18960C658];
  [v4 objectForKeyedSubscript:*MEMORY[0x18960C658]];
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  int v43 = isa_nsdata(v42);

  if (v43)
  {
    [v4 objectForKeyedSubscript:v41];
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEVPNProtocol setIdentityReferenceInternal:](v8, "setIdentityReferenceInternal:", v44);
  }

  uint64_t v45 = *MEMORY[0x18960C678];
  [v4 objectForKeyedSubscript:*MEMORY[0x18960C678]];
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  int v47 = isa_nsstring(v46);

  if (v47)
  {
    v48 = objc_alloc(&OBJC_CLASS___NEKeychainItem);
    [v4 objectForKeyedSubscript:v45];
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    int64_t v50 = v8->super._keychainDomain;
    id v52 = objc_getProperty(v8, v51, 88LL, 1);
    uint64_t v53 = -[NEKeychainItem initWithLegacyIdentifier:domain:accessGroup:]( v48,  "initWithLegacyIdentifier:domain:accessGroup:",  v49,  v50,  v52);
    sharedSecretKeychainItem = v8->_sharedSecretKeychainItem;
    v8->_sharedSecretKeychainItem = (NEKeychainItem *)v53;
  }

  uint64_t v55 = *MEMORY[0x18960C660];
  [v4 objectForKeyedSubscript:*MEMORY[0x18960C660]];
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  int v57 = isa_nsstring(v56);

  if (v57)
  {
    [v4 objectForKeyedSubscript:v55];
    __int128 v58 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v59 = [v58 copy];
    localIdentifier = v8->_localIdentifier;
    v8->_localIdentifier = (NSString *)v59;
  }

  uint64_t v61 = *MEMORY[0x18960C650];
  [v4 objectForKeyedSubscript:*MEMORY[0x18960C650]];
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  int v63 = isa_nsstring(v62);

  if (v63)
  {
    [v4 objectForKeyedSubscript:v61];
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v64 isEqualToString:*MEMORY[0x18960CAD0]])
    {
      uint64_t v65 = 2LL;
    }

    else
    {
      if (![v64 isEqualToString:*MEMORY[0x18960CAC8]])
      {
LABEL_36:

        goto LABEL_37;
      }

      uint64_t v65 = 1LL;
    }

    v8->_authenticationMethod = v65;
    goto LABEL_36;
  }

  v8->_authenticationMethod = 0LL;
LABEL_37:
  [v4 objectForKeyedSubscript:@"ExchangeMode"];
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  int v67 = isa_nsarray(v66);

  if (v67)
  {
    [v4 objectForKeyedSubscript:@"ExchangeMode"];
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEVPNProtocolIPSec setLegacyExchangeMode:](v8, "setLegacyExchangeMode:", v68);
  }

  [v4 objectForKeyedSubscript:@"Proposals"];
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  int v70 = isa_nsarray(v69);

  if (v70)
  {
    [MEMORY[0x189603FA8] array];
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 objectForKeyedSubscript:@"Proposals"];
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v80 = 0u;
    __int128 v81 = 0u;
    __int128 v82 = 0u;
    __int128 v83 = 0u;
    uint64_t v73 = [v72 countByEnumeratingWithState:&v80 objects:v84 count:16];
    if (v73)
    {
      uint64_t v74 = v73;
      uint64_t v75 = *(void *)v81;
      do
      {
        for (uint64_t i = 0LL; i != v74; ++i)
        {
          if (*(void *)v81 != v75) {
            objc_enumerationMutation(v72);
          }
          id v77 = -[NEVPNIKEv1ProposalParameters initFromLegacyDictionary:]( objc_alloc(&OBJC_CLASS___NEVPNIKEv1ProposalParameters),  "initFromLegacyDictionary:",  *(void *)(*((void *)&v80 + 1) + 8 * i));
          if (v77) {
            [v71 addObject:v77];
          }
        }

        uint64_t v74 = [v72 countByEnumeratingWithState:&v80 objects:v84 count:16];
      }

      while (v74);
    }

    if ([v71 count]) {
      -[NEVPNProtocolIPSec setLegacyProposals:](v8, "setLegacyProposals:", v71);
    }
  }

  -[NEVPNProtocol initDisconnectOptions:](v8, "initDisconnectOptions:", v4);
  v78 = v8;

LABEL_53:
  return v8;
}

- (__SCNetworkInterface)createInterface
{
  return SCNetworkInterfaceCreateWithInterface( (SCNetworkInterfaceRef)*MEMORY[0x18960C5B8],  (CFStringRef)*MEMORY[0x18960C5C0]);
}

- (void)syncWithKeychainInDomain:(int64_t)a3 configuration:(id)a4 suffix:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  unint64_t v10 = v9;
  if (v9)
  {
    [v9 stringByAppendingString:@".XAUTH"];
    int v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    [v10 stringByAppendingString:@".SS"];
    unint64_t v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    [v10 stringByAppendingString:@".IDDATA"];
    uint64_t v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    unint64_t v12 = @"SS";
    int v11 = @"XAUTH";
    uint64_t v13 = @"IDDATA";
  }

  v58.receiver = self;
  v58.super_class = (Class)&OBJC_CLASS___NEVPNProtocolIPSec;
  -[NEVPNProtocol syncWithKeychainInDomainCommon:](&v58, sel_syncWithKeychainInDomainCommon_, a3);
  uint64_t v14 = -[NEVPNProtocol username](self, "username");
  if (v14)
  {
    int v15 = (void *)v14;
    -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
    unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      v56 = v13;
      uint64_t v17 = (void *)NSString;
      [v8 identifier];
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      [v18 UUIDString];
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v17 stringWithFormat:@"%@.%@", v19, v11];
      int v20 = (void *)objc_claimAutoreleasedReturnValue();

      uint64_t v22 = objc_alloc(&OBJC_CLASS___NEKeychainItem);
      if (self)
      {
        int64_t keychainDomain = self->super._keychainDomain;
        id Property = objc_getProperty(self, v21, 88LL, 1);
      }

      else
      {
        int64_t keychainDomain = 0LL;
        id Property = 0LL;
      }

      id v25 = Property;
      v26 = -[NEKeychainItem initWithIdentifier:domain:accessGroup:]( v22,  "initWithIdentifier:domain:accessGroup:",  v20,  keychainDomain,  v25);
      -[NEVPNProtocol setPasswordKeychainItem:](self, "setPasswordKeychainItem:", v26);

      uint64_t v13 = v56;
    }
  }

  uint64_t v27 = -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
  if (v27)
  {
    v28 = (void *)v27;
    v29 = -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
    uint64_t v30 = [v29 domain];

    if (v30 == a3)
    {
      -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
      SEL v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEVPNProtocol username](self, "username");
      id v32 = (void *)objc_claimAutoreleasedReturnValue();
      [v31 syncUsingConfiguration:v8 accountName:v32 passwordType:1 identifierSuffix:v11];
    }
  }

  if (-[NEVPNProtocolIPSec authenticationMethod](self, "authenticationMethod") == NEVPNIKEAuthenticationMethodSharedSecret)
  {
    v33 = -[NEVPNProtocolIPSec sharedSecretKeychainItem](self, "sharedSecretKeychainItem");
    if (!v33)
    {
      int v57 = v13;
      v34 = (void *)NSString;
      [v8 identifier];
      int v35 = (void *)objc_claimAutoreleasedReturnValue();
      [v35 UUIDString];
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      [v34 stringWithFormat:@"%@.%@", v36, v12];
      uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();

      int v39 = objc_alloc(&OBJC_CLASS___NEKeychainItem);
      if (self)
      {
        int64_t v40 = self->super._keychainDomain;
        id v41 = objc_getProperty(self, v38, 88LL, 1);
      }

      else
      {
        int64_t v40 = 0LL;
        id v41 = 0LL;
      }

      id v42 = v41;
      int v43 = -[NEKeychainItem initWithIdentifier:domain:accessGroup:]( v39,  "initWithIdentifier:domain:accessGroup:",  v37,  v40,  v42);
      -[NEVPNProtocolIPSec setSharedSecretKeychainItem:](self, "setSharedSecretKeychainItem:", v43);

      uint64_t v13 = v57;
    }
  }

  uint64_t v44 = -[NEVPNProtocolIPSec sharedSecretKeychainItem](self, "sharedSecretKeychainItem");
  if (v44)
  {
    uint64_t v45 = (void *)v44;
    v46 = -[NEVPNProtocolIPSec sharedSecretKeychainItem](self, "sharedSecretKeychainItem");
    uint64_t v47 = [v46 domain];

    if (v47 == a3)
    {
      v48 = -[NEVPNProtocolIPSec sharedSecretKeychainItem](self, "sharedSecretKeychainItem");
      v49 = -[NEVPNProtocolIPSec localIdentifier](self, "localIdentifier");
      [v48 syncUsingConfiguration:v8 accountName:v49 passwordType:2 identifierSuffix:v12];
    }
  }

  uint64_t v50 = -[NEVPNProtocol identityDataPasswordKeychainItem](self, "identityDataPasswordKeychainItem");
  if (v50)
  {
    SEL v51 = (void *)v50;
    -[NEVPNProtocol identityDataPasswordKeychainItem](self, "identityDataPasswordKeychainItem");
    id v52 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v53 = [v52 domain];

    if (v53 == a3)
    {
      v54 = -[NEVPNProtocol identityDataPasswordKeychainItem](self, "identityDataPasswordKeychainItem");
      -[NEVPNProtocolIPSec localIdentifier](self, "localIdentifier");
      uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue();
      [v54 syncUsingConfiguration:v8 accountName:v55 passwordType:3 identifierSuffix:v13];
    }
  }
}

- (BOOL)needToUpdateKeychain
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NEVPNProtocolIPSec;
  if (-[NEVPNProtocol needToUpdateKeychain](&v8, sel_needToUpdateKeychain)) {
    return 1;
  }
  -[NEVPNProtocolIPSec sharedSecretKeychainItem](self, "sharedSecretKeychainItem");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NEVPNProtocolIPSec sharedSecretKeychainItem](self, "sharedSecretKeychainItem");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 password];
    int v6 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v3 = [v6 length] != 0;
  }

  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (void)removeKeychainItemsInDomain:(int64_t)a3 keepIdentity:(BOOL)a4
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NEVPNProtocolIPSec;
  -[NEVPNProtocol removeKeychainItemsInDomain:keepIdentity:]( &v11,  sel_removeKeychainItemsInDomain_keepIdentity_,  a3,  a4);
  uint64_t v6 = -[NEVPNProtocolIPSec sharedSecretKeychainItem](self, "sharedSecretKeychainItem");
  if (v6)
  {
    id v7 = (void *)v6;
    -[NEVPNProtocolIPSec sharedSecretKeychainItem](self, "sharedSecretKeychainItem");
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v8 domain];

    if (v9 == a3)
    {
      -[NEVPNProtocolIPSec sharedSecretKeychainItem](self, "sharedSecretKeychainItem");
      unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 setIdentifier:0];
    }
  }

- (void)migratePasswordsFromPreferences:(__SCPreferences *)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 migrateFromPreferences:a3];

  -[NEVPNProtocolIPSec sharedSecretKeychainItem](self, "sharedSecretKeychainItem");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 migrateFromPreferences:a3];
}

- (NEVPNIKEAuthenticationMethod)authenticationMethod
{
  return self->_authenticationMethod;
}

- (void)setAuthenticationMethod:(NEVPNIKEAuthenticationMethod)authenticationMethod
{
  self->_authenticationMethod = authenticationMethod;
}

- (BOOL)useExtendedAuthentication
{
  return self->_useExtendedAuthentication;
}

- (void)setUseExtendedAuthentication:(BOOL)useExtendedAuthentication
{
  self->_useExtendedAuthentication = useExtendedAuthentication;
}

- (NSData)sharedSecretReference
{
  return (NSData *)objc_getProperty(self, a2, 176LL, 1);
}

- (void)setSharedSecretReference:(NSData *)sharedSecretReference
{
}

- (NSString)localIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 200LL, 1);
}

- (void)setLocalIdentifier:(NSString *)localIdentifier
{
}

- (NSString)remoteIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 208LL, 1);
}

- (void)setRemoteIdentifier:(NSString *)remoteIdentifier
{
}

- (NEKeychainItem)sharedSecretKeychainItem
{
  return (NEKeychainItem *)objc_getProperty(self, a2, 216LL, 1);
}

- (void)setSharedSecretKeychainItem:(id)a3
{
}

- (NSArray)legacyProposals
{
  return (NSArray *)objc_getProperty(self, a2, 224LL, 1);
}

- (void)setLegacyProposals:(id)a3
{
}

- (NSArray)legacyExchangeMode
{
  return (NSArray *)objc_getProperty(self, a2, 232LL, 1);
}

- (void)setLegacyExchangeMode:(id)a3
{
}

- (BOOL)extendedAuthPasswordPrompt
{
  return self->_extendedAuthPasswordPrompt;
}

- (void)setExtendedAuthPasswordPrompt:(BOOL)a3
{
  self->_extendedAuthPasswordPrompt = a3;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end