@interface NEVPNProtocolL2TP
+ (BOOL)supportsSecureCoding;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)needToUpdateKeychain;
- (BOOL)setServiceProtocolsInService:(__SCNetworkService *)a3;
- (BOOL)updateWithServiceProtocolsFromService:(__SCNetworkService *)a3;
- (NEKeychainItem)sharedSecretKeychainItem;
- (NEVPNProtocolL2TP)init;
- (NEVPNProtocolL2TP)initWithCoder:(id)a3;
- (NSArray)userPreferences;
- (NSData)machineIdentityReference;
- (NSData)sharedSecretReference;
- (NSString)localIdentifier;
- (__SCNetworkInterface)createInterface;
- (id)copyLegacyIPSecDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (int64_t)machineAuthenticationMethod;
- (void)encodeWithCoder:(id)a3;
- (void)migratePasswordsFromPreferences:(__SCPreferences *)a3;
- (void)removeKeychainItemsInDomain:(int64_t)a3 keepIdentity:(BOOL)a4;
- (void)setIPSecSettingsFromLegacyDictionary:(id)a3;
- (void)setLocalIdentifier:(id)a3;
- (void)setMachineAuthenticationMethod:(int64_t)a3;
- (void)setMachineIdentityReference:(id)a3;
- (void)setSharedSecretKeychainItem:(id)a3;
- (void)setSharedSecretReference:(id)a3;
- (void)setUserPreferences:(id)a3;
- (void)syncWithKeychainInDomain:(int64_t)a3 configuration:(id)a4 suffix:(id)a5;
@end

@implementation NEVPNProtocolL2TP

- (NEVPNProtocolL2TP)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NEVPNProtocolL2TP;
  return -[NEVPNProtocolPPP initWithType:](&v3, sel_initWithType_, 2LL);
}

- (NEVPNProtocolL2TP)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___NEVPNProtocolL2TP;
  v5 = -[NEVPNProtocolPPP initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_machineAuthenticationMethod = (int)[v4 decodeInt32ForKey:@"MachineAuthenticationMethod"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SharedSecret"];
    sharedSecretKeychainItem = v5->_sharedSecretKeychainItem;
    v5->_sharedSecretKeychainItem = (NEKeychainItem *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MachineIdentity"];
    machineIdentity = v5->_machineIdentity;
    v5->_machineIdentity = (NEIdentityKeychainItem *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MachineIdentityData"];
    machineIdentityDataInternal = v5->_machineIdentityDataInternal;
    v5->_machineIdentityDataInternal = (NSData *)v10;

    v5->_machineIdentityDataImported = [v4 decodeBoolForKey:@"MachineIdentityDataImported"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LocalIdentifier"];
    localIdentifier = v5->_localIdentifier;
    v5->_localIdentifier = (NSString *)v12;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NEVPNProtocolL2TP;
  -[NEVPNProtocolPPP encodeWithCoder:](&v10, sel_encodeWithCoder_, v4);
  objc_msgSend( v4,  "encodeInt32:forKey:",  -[NEVPNProtocolL2TP machineAuthenticationMethod](self, "machineAuthenticationMethod"),  @"MachineAuthenticationMethod");
  v5 = -[NEVPNProtocolL2TP sharedSecretKeychainItem](self, "sharedSecretKeychainItem");
  [v4 encodeObject:v5 forKey:@"SharedSecret"];

  if (self)
  {
    objc_msgSend(v4, "encodeObject:forKey:", objc_getProperty(self, v6, 248, 1), @"MachineIdentity");
    objc_msgSend(v4, "encodeObject:forKey:", objc_getProperty(self, v7, 256, 1), @"MachineIdentityData");
    BOOL machineIdentityDataImported = self->_machineIdentityDataImported;
  }

  else
  {
    [v4 encodeObject:0 forKey:@"MachineIdentity"];
    [v4 encodeObject:0 forKey:@"MachineIdentityData"];
    BOOL machineIdentityDataImported = 0LL;
  }

  [v4 encodeBool:machineIdentityDataImported forKey:@"MachineIdentityDataImported"];
  v9 = -[NEVPNProtocolL2TP localIdentifier](self, "localIdentifier");
  [v4 encodeObject:v9 forKey:@"LocalIdentifier"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___NEVPNProtocolL2TP;
  id v4 = -[NEVPNProtocolPPP copyWithZone:](&v13, sel_copyWithZone_, a3);
  objc_msgSend( v4,  "setMachineAuthenticationMethod:",  -[NEVPNProtocolL2TP machineAuthenticationMethod](self, "machineAuthenticationMethod"));
  v5 = -[NEVPNProtocolL2TP sharedSecretKeychainItem](self, "sharedSecretKeychainItem");
  [v4 setSharedSecretKeychainItem:v5];

  if (self)
  {
    id Property = objc_getProperty(self, v6, 248LL, 1);
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  id Property = 0LL;
  if (v4) {
LABEL_3:
  }
    objc_setProperty_atomic(v4, v6, Property, 248LL);
LABEL_4:
  if (self)
  {
    id v8 = objc_getProperty(self, v6, 256LL, 1);
    if (!v4) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }

  id v8 = 0LL;
  if (v4) {
LABEL_6:
  }
    objc_setProperty_atomic_copy(v4, v6, v8, 256LL);
LABEL_7:
  if (!self)
  {
    BOOL machineIdentityDataImported = 0;
    if (!v4) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }

  BOOL machineIdentityDataImported = self->_machineIdentityDataImported;
  if (v4) {
LABEL_9:
  }
    v4[208] = machineIdentityDataImported;
LABEL_10:
  -[NEVPNProtocolL2TP localIdentifier](self, "localIdentifier", v8);
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setLocalIdentifier:v10];
  v11 = -[NEVPNProtocolL2TP userPreferences](self, "userPreferences");
  [v4 setUserPreferences:v11];

  return v4;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___NEVPNProtocolL2TP;
  unsigned int v6 = -[NEVPNProtocolPPP checkValidityAndCollectErrors:](&v19, sel_checkValidityAndCollectErrors_, v4);
  if (self
    && ((id v7 = objc_getProperty(self, v5, 248LL, 1)) != 0LL
     || (id v7 = objc_getProperty(self, v8, 256LL, 1)) != 0LL))
  {
  }

  else if (-[NEVPNProtocolL2TP machineAuthenticationMethod](self, "machineAuthenticationMethod") == 2)
  {
    +[NEConfiguration addError:toList:]((uint64_t)&OBJC_CLASS___NEConfiguration, @"Missing machine identity", v4);
    unsigned int v6 = 0;
  }

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  v9 = -[NEVPNProtocolL2TP userPreferences](self, "userPreferences", 0LL);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      for (uint64_t i = 0LL; i != v11; ++i)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        v6 &= [*(id *)(*((void *)&v15 + 1) + 8 * i) checkValidityAndCollectErrors:v4];
      }

      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }

    while (v11);
  }

  return v6;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc(MEMORY[0x189607940]);
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___NEVPNProtocolL2TP;
  -[NEVPNProtocolPPP descriptionWithIndent:options:](&v16, sel_descriptionWithIndent_options_, v5, a4);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)[v7 initWithString:v8];

  objc_msgSend( v9,  "appendPrettyInt:withName:andIndent:options:",  -[NEVPNProtocolL2TP machineAuthenticationMethod](self, "machineAuthenticationMethod"),  @"machineAuthenticationMethod",  v5,  a4);
  -[NEVPNProtocolL2TP sharedSecretKeychainItem](self, "sharedSecretKeychainItem");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 appendPrettyObject:v10 withName:@"sharedSecretReference" andIndent:v5 options:a4];

  if (self)
  {
    objc_msgSend( v9,  "appendPrettyObject:withName:andIndent:options:",  objc_getProperty(self, v11, 248, 1),  @"machineIdentity",  v5,  a4);
    objc_msgSend( v9,  "appendPrettyObject:withName:andIndent:options:",  objc_getProperty(self, v12, 256, 1),  @"machineIdentityDataInternal",  v5,  a4);
    BOOL machineIdentityDataImported = self->_machineIdentityDataImported;
  }

  else
  {
    [v9 appendPrettyObject:0 withName:@"machineIdentity" andIndent:v5 options:a4];
    [v9 appendPrettyObject:0 withName:@"machineIdentityDataInternal" andIndent:v5 options:a4];
    BOOL machineIdentityDataImported = 0LL;
  }

  [v9 appendPrettyBOOL:machineIdentityDataImported withName:@"machineIdentityDataImported" andIndent:v5 options:a4];
  v14 = -[NEVPNProtocolL2TP localIdentifier](self, "localIdentifier");
  [v9 appendPrettyObject:v14 withName:@"localIdentifier" andIndent:v5 options:a4 | 1];

  return v9;
}

- (void)setSharedSecretReference:(id)a3
{
  id v12 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  -[NEVPNProtocolL2TP sharedSecretKeychainItem](v4, "sharedSecretKeychainItem");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NEVPNProtocolL2TP sharedSecretKeychainItem](v4, "sharedSecretKeychainItem");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [v6 setPersistentReference:v12];
  }

  else
  {
    id v8 = objc_alloc(&OBJC_CLASS___NEKeychainItem);
    if (v4)
    {
      int64_t keychainDomain = v4->super.super._keychainDomain;
      id Property = objc_getProperty(v4, v7, 88LL, 1);
    }

    else
    {
      int64_t keychainDomain = 0LL;
      id Property = 0LL;
    }

    id v6 = Property;
    uint64_t v11 = -[NEKeychainItem initWithPersistentReference:domain:accessGroup:]( v8,  "initWithPersistentReference:domain:accessGroup:",  v12,  keychainDomain,  v6);
    -[NEVPNProtocolL2TP setSharedSecretKeychainItem:](v4, "setSharedSecretKeychainItem:", v11);
  }

  objc_sync_exit(v4);
}

- (NSData)sharedSecretReference
{
  v2 = self;
  objc_sync_enter(v2);
  -[NEVPNProtocolL2TP sharedSecretKeychainItem](v2, "sharedSecretKeychainItem");
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NEVPNProtocolL2TP sharedSecretKeychainItem](v2, "sharedSecretKeychainItem");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 persistentReference];
    objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_sync_exit(v2);

  return (NSData *)v3;
}

- (void)setMachineIdentityReference:(id)a3
{
  id v14 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  if (v14)
  {
    if (v4 && objc_getProperty(v4, v5, 248LL, 1))
    {
      id v7 = objc_getProperty(v4, v6, 248LL, 1);
      [v7 setPersistentReference:v14];
    }

    else
    {
      v9 = objc_alloc(&OBJC_CLASS___NEIdentityKeychainItem);
      if (v4)
      {
        int64_t keychainDomain = v4->super.super._keychainDomain;
        id Property = objc_getProperty(v4, v8, 88LL, 1);
      }

      else
      {
        int64_t keychainDomain = 0LL;
        id Property = 0LL;
      }

      id v7 = Property;
      objc_super v13 = -[NEKeychainItem initWithPersistentReference:domain:accessGroup:]( v9,  "initWithPersistentReference:domain:accessGroup:",  v14,  keychainDomain,  v7);
      if (v4) {
        objc_setProperty_atomic(v4, v12, v13, 248LL);
      }
    }
  }

  else if (v4)
  {
    objc_setProperty_atomic(v4, v5, 0LL, 248LL);
  }

  objc_sync_exit(v4);
}

- (NSData)machineIdentityReference
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2 && objc_getProperty(v2, v3, 248LL, 1))
  {
    id v5 = objc_getProperty(v2, v4, 248LL, 1);
    [v5 persistentReference];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v6 = 0LL;
  }

  objc_sync_exit(v2);

  return (NSData *)v6;
}

- (void)syncWithKeychainInDomain:(int64_t)a3 configuration:(id)a4 suffix:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = v9;
  if (v9)
  {
    [v9 stringByAppendingString:@".SS"];
    uint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v11 = @"SS";
  }

  v35.receiver = self;
  v35.super_class = (Class)&OBJC_CLASS___NEVPNProtocolL2TP;
  -[NEVPNProtocol syncWithKeychainInDomain:configuration:suffix:]( &v35,  sel_syncWithKeychainInDomain_configuration_suffix_,  a3,  v8,  v10);
  if (self)
  {
    id v13 = objc_getProperty(self, v12, 248LL, 1);
    if (v13)
    {
      __int128 v15 = v13;
      uint64_t v16 = objc_msgSend(objc_getProperty(self, v14, 248, 1), "domain");

      if (v16 == a3) {
        objc_msgSend(objc_getProperty(self, v17, 248, 1), "sync");
      }
    }
  }

  if (-[NEVPNProtocolL2TP machineAuthenticationMethod](self, "machineAuthenticationMethod") == 1)
  {
    -[NEVPNProtocolL2TP sharedSecretKeychainItem](self, "sharedSecretKeychainItem");
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      objc_super v19 = (void *)NSString;
      [v8 identifier];
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v20 UUIDString];
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v19 stringWithFormat:@"%@.%@", v21, v11];
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = objc_alloc(&OBJC_CLASS___NEKeychainItem);
      if (self)
      {
        int64_t keychainDomain = self->super.super._keychainDomain;
        id Property = objc_getProperty(self, v23, 88LL, 1);
      }

      else
      {
        int64_t keychainDomain = 0LL;
        id Property = 0LL;
      }

      id v27 = Property;
      v28 = -[NEKeychainItem initWithIdentifier:domain:accessGroup:]( v24,  "initWithIdentifier:domain:accessGroup:",  v22,  keychainDomain,  v27);
      -[NEVPNProtocolL2TP setSharedSecretKeychainItem:](self, "setSharedSecretKeychainItem:", v28);
    }
  }

  uint64_t v29 = -[NEVPNProtocolL2TP sharedSecretKeychainItem](self, "sharedSecretKeychainItem");
  if (v29)
  {
    v30 = (void *)v29;
    v31 = -[NEVPNProtocolL2TP sharedSecretKeychainItem](self, "sharedSecretKeychainItem");
    uint64_t v32 = [v31 domain];

    if (v32 == a3)
    {
      v33 = -[NEVPNProtocolL2TP sharedSecretKeychainItem](self, "sharedSecretKeychainItem");
      v34 = -[NEVPNProtocolL2TP localIdentifier](self, "localIdentifier");
      [v33 syncUsingConfiguration:v8 accountName:v34 passwordType:2 identifierSuffix:v11];
    }
  }
}

- (BOOL)needToUpdateKeychain
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NEVPNProtocolL2TP;
  if (-[NEVPNProtocol needToUpdateKeychain](&v10, sel_needToUpdateKeychain)) {
    return 1;
  }
  -[NEVPNProtocolL2TP sharedSecretKeychainItem](self, "sharedSecretKeychainItem");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NEVPNProtocolL2TP sharedSecretKeychainItem](self, "sharedSecretKeychainItem");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 password];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[NEVPNProtocolL2TP sharedSecretKeychainItem](self, "sharedSecretKeychainItem");
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 password];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v3 = [v8 length] != 0;
    }

    else
    {
      BOOL v3 = 0;
    }
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
  v11.super_class = (Class)&OBJC_CLASS___NEVPNProtocolL2TP;
  -[NEVPNProtocol removeKeychainItemsInDomain:keepIdentity:]( &v11,  sel_removeKeychainItemsInDomain_keepIdentity_,  a3,  a4);
  uint64_t v6 = -[NEVPNProtocolL2TP sharedSecretKeychainItem](self, "sharedSecretKeychainItem");
  if (v6)
  {
    id v7 = (void *)v6;
    -[NEVPNProtocolL2TP sharedSecretKeychainItem](self, "sharedSecretKeychainItem");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v8 domain];

    if (v9 == a3)
    {
      -[NEVPNProtocolL2TP sharedSecretKeychainItem](self, "sharedSecretKeychainItem");
      objc_super v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 setIdentifier:0];
    }
  }

- (void)migratePasswordsFromPreferences:(__SCPreferences *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NEVPNProtocolL2TP;
  -[NEVPNProtocol migratePasswordsFromPreferences:](&v6, sel_migratePasswordsFromPreferences_);
  -[NEVPNProtocolL2TP sharedSecretKeychainItem](self, "sharedSecretKeychainItem");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 migrateFromPreferences:a3];
}

- (id)copyLegacyIPSecDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  -[NEVPNProtocolL2TP machineIdentityReference](self, "machineIdentityReference");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (self) {
      id Property = objc_getProperty(self, v5, 248LL, 1);
    }
    else {
      id Property = 0LL;
    }
    [Property persistentReference];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v7 forKeyedSubscript:*MEMORY[0x18960C658]];

    id v8 = (void *)MEMORY[0x18960CAC8];
  }

  else
  {
    id v8 = (void *)MEMORY[0x18960CAD0];
  }

  [v3 setObject:*v8 forKeyedSubscript:*MEMORY[0x18960C650]];
  -[NEVPNProtocolL2TP sharedSecretKeychainItem](self, "sharedSecretKeychainItem");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[NEVPNProtocolL2TP sharedSecretKeychainItem](self, "sharedSecretKeychainItem");
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 password];
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[NEVPNProtocolL2TP sharedSecretKeychainItem](self, "sharedSecretKeychainItem");
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    id v13 = v12;
    if (v11)
    {
      uint64_t v14 = [v12 password];
    }

    else
    {
      [v12 identifier];
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15) {
        goto LABEL_13;
      }
      -[NEVPNProtocolL2TP sharedSecretKeychainItem](self, "sharedSecretKeychainItem");
      id v13 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v14 = [v13 identifier];
    }

    uint64_t v16 = (void *)v14;

    if (v16)
    {
      [v3 setObject:v16 forKeyedSubscript:*MEMORY[0x18960C678]];
      [v3 setObject:*MEMORY[0x18960CAE0] forKeyedSubscript:*MEMORY[0x18960C680]];
    }
  }

- (void)setIPSecSettingsFromLegacyDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x18960C678];
  id v29 = v4;
  [v4 objectForKeyedSubscript:*MEMORY[0x18960C678]];
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue();
  int v7 = isa_nsstring(v6);

  if (v7)
  {
    id v8 = objc_alloc(&OBJC_CLASS___NEKeychainItem);
    [v29 objectForKeyedSubscript:v5];
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
    {
      int64_t keychainDomain = self->super.super._keychainDomain;
      id Property = objc_getProperty(self, v9, 88LL, 1);
    }

    else
    {
      int64_t keychainDomain = 0LL;
      id Property = 0LL;
    }

    id v13 = Property;
    uint64_t v14 = -[NEKeychainItem initWithLegacyIdentifier:domain:accessGroup:]( v8,  "initWithLegacyIdentifier:domain:accessGroup:",  v10,  keychainDomain,  v13);
    -[NEVPNProtocolL2TP setSharedSecretKeychainItem:](self, "setSharedSecretKeychainItem:", v14);

    uint64_t v15 = 1LL;
  }

  else
  {
    uint64_t v16 = *MEMORY[0x18960C658];
    [v29 objectForKeyedSubscript:*MEMORY[0x18960C658]];
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
    int v18 = isa_nsdata(v17);

    if (!v18) {
      goto LABEL_8;
    }
    [v29 objectForKeyedSubscript:v16];
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEVPNProtocolL2TP setMachineIdentityReference:](self, "setMachineIdentityReference:", v10);
    uint64_t v15 = 2LL;
  }

  -[NEVPNProtocolL2TP setMachineAuthenticationMethod:](self, "setMachineAuthenticationMethod:", v15);
LABEL_8:
  uint64_t v19 = *MEMORY[0x18960C660];
  [v29 objectForKeyedSubscript:*MEMORY[0x18960C660]];
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  int v21 = isa_nsstring(v20);

  if (v21)
  {
    [v29 objectForKeyedSubscript:v19];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)[v22 copy];
    -[NEVPNProtocolL2TP setLocalIdentifier:](self, "setLocalIdentifier:", v23);
  }

  uint64_t v24 = *MEMORY[0x18960C650];
  [v29 objectForKeyedSubscript:*MEMORY[0x18960C650]];
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  int v26 = isa_nsstring(v25);

  if (v26)
  {
    [v29 objectForKeyedSubscript:v24];
    id v27 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v27 isEqualToString:*MEMORY[0x18960CAD0]])
    {
      uint64_t v28 = 1LL;
    }

    else
    {
      if (![v27 isEqualToString:*MEMORY[0x18960CAC8]])
      {
LABEL_16:

        goto LABEL_17;
      }

      uint64_t v28 = 2LL;
    }

    -[NEVPNProtocolL2TP setMachineAuthenticationMethod:](self, "setMachineAuthenticationMethod:", v28);
    goto LABEL_16;
  }

- (__SCNetworkInterface)createInterface
{
  result = SCNetworkInterfaceCreateWithInterface( (SCNetworkInterfaceRef)*MEMORY[0x18960C5B8],  (CFStringRef)*MEMORY[0x18960C5C8]);
  if (result)
  {
    id v3 = result;
    id v4 = SCNetworkInterfaceCreateWithInterface(result, (CFStringRef)*MEMORY[0x18960C5D0]);
    CFRelease(v3);
    return v4;
  }

  return result;
}

- (BOOL)setServiceProtocolsInService:(__SCNetworkService *)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___NEVPNProtocolL2TP;
  BOOL v5 = -[NEVPNProtocolPPP setServiceProtocolsInService:](&v17, sel_setServiceProtocolsInService_);
  if (v5)
  {
    SCNetworkInterfaceRef Interface = SCNetworkServiceGetInterface(a3);
    if (Interface)
    {
      int v7 = Interface;
      id v8 = (const __CFString *)*MEMORY[0x18960C5C0];
      uint64_t v9 = -[NEVPNProtocolL2TP copyLegacyIPSecDictionary](self, "copyLegacyIPSecDictionary");
      LODWORD(v7) = SCNetworkInterfaceSetExtendedConfiguration(v7, v8, v9);

      if ((_DWORD)v7)
      {
        LOBYTE(v5) = 1;
        return v5;
      }

      ne_log_obj();
      objc_super v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
      {
LABEL_8:

        LOBYTE(v5) = 0;
        return v5;
      }

      int v14 = SCError();
      uint64_t v15 = SCErrorString(v14);
      *(_DWORD *)buf = 136315138;
      uint64_t v19 = v15;
      objc_super v11 = "SCNetworkInterfaceSetExtendedConfiguration failed: %s";
      id v12 = (os_log_s *)v10;
      uint32_t v13 = 12;
    }

    else
    {
      ne_log_obj();
      objc_super v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR)) {
        goto LABEL_8;
      }
      *(_WORD *)buf = 0;
      objc_super v11 = "Cannot set IPSec settings in service, interface is NULL";
      id v12 = (os_log_s *)v10;
      uint32_t v13 = 2;
    }

    _os_log_error_impl(&dword_1876B1000, v12, OS_LOG_TYPE_ERROR, v11, buf, v13);
    goto LABEL_8;
  }

  return v5;
}

- (BOOL)updateWithServiceProtocolsFromService:(__SCNetworkService *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NEVPNProtocolL2TP;
  BOOL v5 = -[NEVPNProtocolPPP updateWithServiceProtocolsFromService:](&v9, sel_updateWithServiceProtocolsFromService_);
  if (v5)
  {
    SCNetworkInterfaceRef Interface = SCNetworkServiceGetInterface(a3);
    if (Interface)
    {
      CFDictionaryRef ExtendedConfiguration = SCNetworkInterfaceGetExtendedConfiguration(Interface, (CFStringRef)*MEMORY[0x18960C5C0]);
      if (ExtendedConfiguration) {
        -[NEVPNProtocolL2TP setIPSecSettingsFromLegacyDictionary:]( self,  "setIPSecSettingsFromLegacyDictionary:",  ExtendedConfiguration);
      }
    }
  }

  return v5;
}

- (int64_t)machineAuthenticationMethod
{
  return self->_machineAuthenticationMethod;
}

- (void)setMachineAuthenticationMethod:(int64_t)a3
{
  self->_machineAuthenticationMethod = a3;
}

- (NEKeychainItem)sharedSecretKeychainItem
{
  return (NEKeychainItem *)objc_getProperty(self, a2, 224LL, 1);
}

- (void)setSharedSecretKeychainItem:(id)a3
{
}

- (NSString)localIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 232LL, 1);
}

- (void)setLocalIdentifier:(id)a3
{
}

- (NSArray)userPreferences
{
  return (NSArray *)objc_getProperty(self, a2, 240LL, 1);
}

- (void)setUserPreferences:(id)a3
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