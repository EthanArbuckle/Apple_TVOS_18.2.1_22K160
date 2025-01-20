@interface NEProviderAppConfigurationClient
- (BOOL)createConfigurationWithParameters:(id)a3 errorStr:(id *)a4;
- (BOOL)enabled;
- (BOOL)isAlwaysOn;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)onDemandEnabled;
- (BOOL)setPasswordWithParameters:(id)a3 errorStr:(id *)a4;
- (BOOL)setProtocolWithParameters:(id)a3 errorStr:(id *)a4;
- (BOOL)setProviderTypeWithParameters:(id)a3 errorStr:(id *)a4;
- (BOOL)setSharedSecretWithParameters:(id)a3 errorStr:(id *)a4;
- (BOOL)unsetPasswordWithParameters:(id)a3 errorStr:(id *)a4;
- (BOOL)unsetSharedSecretWithParameters:(id)a3 errorStr:(id *)a4;
- (NEProviderAppConfigurationClient)initWithClientName:(id)a3;
- (id)dnsProxyConfiguration;
- (id)dnsSettingsBundle;
- (id)filterConfiguration;
- (id)listenerEndpoint;
- (id)onDemandRules;
- (id)protocolForParameters:(id)a3;
- (uint64_t)deleteKeychainItemWithPersistentReference:(uint64_t)a1;
- (uint64_t)setKeychainItemData:(void *)a3 withName:(uint64_t *)a4 persistentReference:;
- (void)handleCommand:(int)a3 forConfigWithName:(id)a4 withParameters:(id)a5 completionHandler:(id)a6;
- (void)handleConfigChanged:(id)a3;
- (void)loadAllWithCompletionHandler:(void *)a1;
- (void)setEnabled:(BOOL)a3;
- (void)setOnDemandEnabled:(BOOL)a3;
- (void)setOnDemandRules:(id)a3;
@end

@implementation NEProviderAppConfigurationClient

- (NEProviderAppConfigurationClient)initWithClientName:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NEProviderAppConfigurationClient;
  v5 = -[NEUtilConfigurationClient initInternalWithClientName:](&v10, sel_initInternalWithClientName_, v4);
  if (v5)
  {
    [v4 componentsSeparatedByString:@":"];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)[v6 count] < 2)
    {
      v7 = (NSString *)v4;
    }

    else
    {
      [v6 objectAtIndexedSubscript:1];
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    }

    targetAppBundleID = v5->_targetAppBundleID;
    v5->_targetAppBundleID = v7;
  }

  return v5;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6F63A0];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setExportedInterface:v8];

  [v7 setExportedObject:self];
  objc_initWeak(&location, self);
  uint64_t v9 = MEMORY[0x1895F87A8];
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __71__NEProviderAppConfigurationClient_listener_shouldAcceptNewConnection___block_invoke;
  v14[3] = &unk_18A08FAC8;
  objc_copyWeak(&v15, &location);
  [v7 setInvalidationHandler:v14];
  v12[0] = v9;
  v12[1] = 3221225472LL;
  v12[2] = __71__NEProviderAppConfigurationClient_listener_shouldAcceptNewConnection___block_invoke_2;
  v12[3] = &unk_18A08FAC8;
  objc_copyWeak(&v13, &location);
  [v7 setInterruptionHandler:v12];
  [v7 resume];
  if (self) {
    objc_setProperty_atomic(self, v10, v7, 136LL);
  }
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return 1;
}

- (void)handleConfigChanged:(id)a3
{
  if (self) {
    objc_setProperty_atomic(self, a2, 0LL, 120LL);
  }
}

- (BOOL)enabled
{
  if (self)
  {
    v2 = self;
    v3 = &OBJC_IVAR___NEProviderAppConfigurationClient__filterManager;
    if (!objc_getProperty(self, a2, 88LL, 1))
    {
      v3 = &OBJC_IVAR___NEProviderAppConfigurationClient__dnsProxyManager;
      if (!objc_getProperty(v2, v4, 96LL, 1))
      {
        v3 = &OBJC_IVAR___NEProviderAppConfigurationClient__dnsSettingsManager;
        if (!objc_getProperty(v2, v4, 104LL, 1)) {
          v3 = &OBJC_IVAR___NEProviderAppConfigurationClient__currentManager;
        }
      }
    }

    self = (NEProviderAppConfigurationClient *)objc_getProperty(v2, v4, *v3, 1);
  }

  return -[NEProviderAppConfigurationClient isEnabled](self, "isEnabled");
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (self)
  {
    id v4 = self;
    v5 = &OBJC_IVAR___NEProviderAppConfigurationClient__filterManager;
    if (!objc_getProperty(self, a2, 88LL, 1))
    {
      v5 = &OBJC_IVAR___NEProviderAppConfigurationClient__dnsProxyManager;
      if (!objc_getProperty(v4, v6, 96LL, 1))
      {
        v5 = &OBJC_IVAR___NEProviderAppConfigurationClient__dnsSettingsManager;
        if (!objc_getProperty(v4, v6, 104LL, 1)) {
          v5 = &OBJC_IVAR___NEProviderAppConfigurationClient__currentManager;
        }
      }
    }

    self = (NEProviderAppConfigurationClient *)objc_getProperty(v4, v6, *v5, 1);
  }

  -[NEProviderAppConfigurationClient setEnabled:](self, "setEnabled:", v3);
}

- (BOOL)onDemandEnabled
{
  if (self) {
    self = (NEProviderAppConfigurationClient *)objc_getProperty(self, a2, 80LL, 1);
  }
  return -[NEProviderAppConfigurationClient isOnDemandEnabled](self, "isOnDemandEnabled");
}

- (void)setOnDemandEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (self) {
    self = (NEProviderAppConfigurationClient *)objc_getProperty(self, a2, 80LL, 1);
  }
  -[NEProviderAppConfigurationClient setOnDemandEnabled:](self, "setOnDemandEnabled:", v3);
}

- (id)onDemandRules
{
  if (self) {
    self = (NEProviderAppConfigurationClient *)objc_getProperty(self, a2, 80LL, 1);
  }
  return -[NEProviderAppConfigurationClient onDemandRules](self, "onDemandRules");
}

- (void)setOnDemandRules:(id)a3
{
  id v6 = (id)[a3 copy];
  if (self) {
    id Property = objc_getProperty(self, v4, 80LL, 1);
  }
  else {
    id Property = 0LL;
  }
  [Property setOnDemandRules:v6];
}

- (BOOL)isAlwaysOn
{
  return 0;
}

- (id)protocolForParameters:(id)a3
{
  if (self) {
    self = (NEProviderAppConfigurationClient *)objc_getProperty(self, a2, 80LL, 1);
  }
  return (id)-[NEProviderAppConfigurationClient protocolConfiguration](self, "protocolConfiguration", a3);
}

- (id)filterConfiguration
{
  if (self) {
    self = (NEProviderAppConfigurationClient *)objc_getProperty(self, a2, 88LL, 1);
  }
  return (id)-[NEProviderAppConfigurationClient providerConfiguration](self, "providerConfiguration");
}

- (id)dnsProxyConfiguration
{
  if (self) {
    self = (NEProviderAppConfigurationClient *)objc_getProperty(self, a2, 96LL, 1);
  }
  return (id)-[NEProviderAppConfigurationClient providerProtocol](self, "providerProtocol");
}

- (id)dnsSettingsBundle
{
  if (self)
  {
    self = (NEProviderAppConfigurationClient *)objc_getProperty(self, a2, 104LL, 1);
    if (self) {
      self = (NEProviderAppConfigurationClient *)objc_getProperty(self, v2, 40LL, 1);
    }
  }

  BOOL v3 = self;
  -[NEProviderAppConfigurationClient dnsSettings](v3, "dnsSettings");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)createConfigurationWithParameters:(id)a3 errorStr:(id *)a4
{
  id v6 = a3;
  [v6 objectForKeyedSubscript:@"name"];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 objectForKeyedSubscript:@"type"];
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ([v8 isEqualToString:@"lite"])
  {
    +[NEVPNManager sharedManager](&OBJC_CLASS___NEVPNManager, "sharedManager");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 setLocalizedDescription:v7];

    +[NEVPNManager sharedManager](&OBJC_CLASS___NEVPNManager, "sharedManager");
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v10;
    if (self)
    {
      objc_setProperty_atomic(self, v11, v10, 80LL);

      if (!objc_getProperty(self, v13, 112LL, 1))
      {
        id v15 = objc_alloc_init(MEMORY[0x189603FA8]);
        objc_setProperty_atomic(self, v16, v15, 112LL);
      }

- (BOOL)setProtocolWithParameters:(id)a3 errorStr:(id *)a4
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (self) {
    id Property = objc_getProperty(self, v6, 80LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v9 = Property;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0
    || (!self ? (id v12 = 0LL) : (id v12 = objc_getProperty(self, v11, 80LL, 1)),
        id v13 = v12,
        objc_opt_class(),
        char v14 = objc_opt_isKindOfClass(),
        v13,
        (v14 & 1) != 0))
  {
    if ([v7 isEqualToString:@"provider"])
    {
      SEL v16 = (objc_class *)&OBJC_CLASS___NETunnelProviderProtocol;
LABEL_9:
      id v18 = objc_alloc_init(v16);
      if (self) {
        id v19 = objc_getProperty(self, v17, 80LL, 1);
      }
      else {
        id v19 = 0LL;
      }
      [v19 setProtocolConfiguration:v18];

      goto LABEL_12;
    }

    BOOL v20 = 0;
    SEL v21 = @"Invalid protocol type, valid type is \"provider\"";
LABEL_14:
    *a4 = v21;
    goto LABEL_15;
  }

  if (self) {
    id v23 = objc_getProperty(self, v15, 80LL, 1);
  }
  else {
    id v23 = 0LL;
  }
  id v24 = v23;
  objc_opt_class();
  char v25 = objc_opt_isKindOfClass();

  if ((v25 & 1) != 0)
  {
    if ([v7 isEqualToString:@"ikev1"])
    {
      v27 = off_18A087F58;
    }

    else
    {
      if (([v7 isEqualToString:@"ikev2"] & 1) == 0)
      {
        BOOL v20 = 0;
        SEL v21 = @"Invalid protocol type, valid types are \"ikev1\" and \"ikev2\"";
        goto LABEL_14;
      }

      v27 = off_18A087F50;
    }

    SEL v16 = (objc_class *)*v27;
    goto LABEL_9;
  }

  if (self)
  {
    if (objc_getProperty(self, v26, 88LL, 1))
    {
      if (([v7 isEqualToString:@"provider"] & 1) == 0)
      {
        BOOL v20 = 0;
        SEL v21 = @"Invalid filter type, valid type is \"provider\"";
        goto LABEL_14;
      }

      v29 = objc_alloc_init(&OBJC_CLASS___NEFilterProviderConfiguration);
      BOOL v20 = 1;
      objc_msgSend(objc_getProperty(self, v30, 88, 1), "setProviderConfiguration:", v29);
    }

    else
    {
      BOOL v20 = 1;
      if (!objc_getProperty(self, v28, 96LL, 1)) {
        goto LABEL_15;
      }
      if (([v7 isEqualToString:@"provider"] & 1) == 0)
      {
        BOOL v20 = 0;
        SEL v21 = @"Invalid DNS proxy type, valid type is \"provider\"";
        goto LABEL_14;
      }

      v29 = objc_alloc_init(&OBJC_CLASS___NEDNSProxyProviderProtocol);
      objc_msgSend(objc_getProperty(self, v31, 96, 1), "setProviderProtocol:", v29);
    }

    goto LABEL_15;
  }

- (BOOL)setPasswordWithParameters:(id)a3 errorStr:(id *)a4
{
  id v6 = a3;
  -[NEProviderAppConfigurationClient protocolForParameters:](self, "protocolForParameters:", v6);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 objectForKeyedSubscript:@"password"];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  int v9 = isa_nsstring(v8);

  if (v9)
  {
    [v7 passwordReference];
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 objectForKeyedSubscript:@"password"];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 dataUsingEncoding:4];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();

    char v14 = (void *)NSString;
    if (self) {
      id Property = objc_getProperty(self, v13, 80LL, 1);
    }
    else {
      id Property = 0LL;
    }
    [Property localizedDescription];
    SEL v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 stringWithFormat:@"%@.PASSWORD", v16];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    id v22 = v10;
    uint64_t v18 = -[NEProviderAppConfigurationClient setKeychainItemData:withName:persistentReference:]( self,  v12,  v17,  (uint64_t *)&v22);
    id v19 = v22;

    BOOL v20 = (_DWORD)v18 == 0;
    if ((_DWORD)v18)
    {
      objc_msgSend( NSString,  "stringWithFormat:",  @"Failed to set the password in the keychain: %d",  v18);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      [v7 setPasswordReference:v19];
    }
  }

  else
  {
    BOOL v20 = 1;
  }

  return v20;
}

- (BOOL)unsetPasswordWithParameters:(id)a3 errorStr:(id *)a4
{
  id v6 = a3;
  -[NEProviderAppConfigurationClient protocolForParameters:](self, "protocolForParameters:", v6);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 objectForKeyedSubscript:@"password"];
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v6) = isa_nsstring(v8);
  if ((_DWORD)v6
    && ([v7 passwordReference], int v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, v9)
    && ([v7 passwordReference],
        objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(),
        uint64_t v11 = -[NEProviderAppConfigurationClient deleteKeychainItemWithPersistentReference:]((uint64_t)self, v10),
        v10,
        (_DWORD)v11))
  {
    objc_msgSend( NSString,  "stringWithFormat:",  @"Failed to delete the password keychain item: %d",  v11);
    BOOL v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    BOOL v12 = 1;
  }

  return v12;
}

- (BOOL)setSharedSecretWithParameters:(id)a3 errorStr:(id *)a4
{
  id v6 = a3;
  -[NEProviderAppConfigurationClient protocolForParameters:](self, "protocolForParameters:", v6);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 objectForKeyedSubscript:@"shared-secret"];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  int v9 = isa_nsstring(v8);

  if (v9)
  {
    [v7 sharedSecretReference];
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 objectForKeyedSubscript:@"shared-secret"];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 dataUsingEncoding:4];
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();

    char v14 = (void *)NSString;
    if (self) {
      id Property = objc_getProperty(self, v13, 80LL, 1);
    }
    else {
      id Property = 0LL;
    }
    [Property localizedDescription];
    SEL v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 stringWithFormat:@"%@.SHAREDSECRET", v16];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    id v22 = v10;
    uint64_t v18 = -[NEProviderAppConfigurationClient setKeychainItemData:withName:persistentReference:]( self,  v12,  v17,  (uint64_t *)&v22);
    id v19 = v22;

    BOOL v20 = (_DWORD)v18 == 0;
    if ((_DWORD)v18)
    {
      objc_msgSend( NSString,  "stringWithFormat:",  @"Failed to set the shared secret in the keychain: %d",  v18);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      [v7 setSharedSecretReference:v19];
    }
  }

  else
  {
    BOOL v20 = 1;
  }

  return v20;
}

- (BOOL)unsetSharedSecretWithParameters:(id)a3 errorStr:(id *)a4
{
  id v6 = a3;
  -[NEProviderAppConfigurationClient protocolForParameters:](self, "protocolForParameters:", v6);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 objectForKeyedSubscript:@"shared-secret"];
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v6) = isa_nsstring(v8);
  if ((_DWORD)v6
    && ([v7 sharedSecretReference], int v9 = (void *)objc_claimAutoreleasedReturnValue(),
                                                   v9,
                                                   v9)
    && ([v7 sharedSecretReference],
        objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(),
        uint64_t v11 = -[NEProviderAppConfigurationClient deleteKeychainItemWithPersistentReference:]((uint64_t)self, v10),
        v10,
        (_DWORD)v11))
  {
    objc_msgSend( NSString,  "stringWithFormat:",  @"Failed to delete the shared secret keychain item: %d",  v11);
    BOOL v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    BOOL v12 = 1;
  }

  return v12;
}

- (BOOL)setProviderTypeWithParameters:(id)a3 errorStr:(id *)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5) {
    *a4 = @"The provider type cannot be specified for this configuration type";
  }
  return v5 == 0LL;
}

- (void)handleCommand:(int)a3 forConfigWithName:(id)a4 withParameters:(id)a5 completionHandler:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = a4;
  id v11 = a5;
  id v13 = a6;
  if (self && self->_isServerMode)
  {
    if ((_DWORD)v8 == 31)
    {
      id v28 = objc_alloc_init(MEMORY[0x189603FA8]);
      v44[0] = MEMORY[0x1895F87A8];
      v44[1] = 3221225472LL;
      v44[2] = __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_2_133;
      v44[3] = &unk_18A08FD58;
      v44[4] = self;
      id v45 = v28;
      id v46 = v13;
      id v29 = v28;
      -[NEProviderAppConfigurationClient loadAllWithCompletionHandler:](self, v44);

      SEL v30 = v45;
    }

    else
    {
      if ((_DWORD)v8 != 30 || [v10 length])
      {
        uint64_t v18 = (void *)MEMORY[0x1895F87A8];
        v38[0] = MEMORY[0x1895F87A8];
        v38[1] = 3221225472LL;
        v38[2] = __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_3;
        v38[3] = &unk_18A08F9B8;
        id v39 = v10;
        int v43 = v8;
        id v42 = v13;
        v40 = self;
        id v41 = v11;
        id v19 = v39;
        BOOL v20 = v38;
        location[0] = v18;
        location[1] = (id)3221225472LL;
        location[2] = __80__NEProviderAppConfigurationClient_loadConfigurationWithName_completionHandler___block_invoke;
        location[3] = &unk_18A08FD58;
        location[4] = self;
        id v21 = v19;
        id v57 = v21;
        id v22 = v20;
        id v58 = v22;
        -[NEProviderAppConfigurationClient loadAllWithCompletionHandler:](self, location);

        goto LABEL_22;
      }

      id v37 = objc_alloc_init(MEMORY[0x189603FA8]);
      v47[0] = MEMORY[0x1895F87A8];
      v47[1] = 3221225472LL;
      v47[2] = __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_128;
      v47[3] = &unk_18A08FD58;
      v47[4] = self;
      id v48 = v37;
      id v49 = v13;
      id v29 = v37;
      -[NEProviderAppConfigurationClient loadAllWithCompletionHandler:](self, v47);

      SEL v30 = v48;
    }

    goto LABEL_22;
  }

  if ((_DWORD)v8 == 102 || (_DWORD)v8 == 36)
  {
    -[NEUtilConfigurationClient clientName](self, "clientName");
    char v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[NEUtilConfigurationClient removeClientWithName:]( &OBJC_CLASS___NEUtilConfigurationClient,  "removeClientWithName:",  v14);

    if (self)
    {
      objc_msgSend(objc_getProperty(self, v15, 136, 1), "invalidate");
      objc_setProperty_atomic(self, v16, 0LL, 136LL);
      objc_setProperty_atomic(self, v17, 0LL, 144LL);
    }

    else
    {
      [0 invalidate];
    }

    (*((void (**)(id, void))v13 + 2))(v13, MEMORY[0x189604A58]);
  }

  else if (self {
         && (id v23 = objc_getProperty(self, v12, 136LL, 1)) != 0LL
  }
         && (char v25 = v23, v26 = objc_getProperty(self, v24, 144LL, 1), v25, v26))
  {
    objc_msgSend( objc_getProperty(self, v27, 144, 1),  "handleCommand:forConfigWithName:withParameters:completionHandler:",  v8,  v10,  v11,  v13);
  }

  else
  {
    objc_initWeak(location, self);
    +[NEConfigurationManager sharedManager](&OBJC_CLASS___NEConfigurationManager, "sharedManager");
    id v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (self) {
      id Property = objc_getProperty(self, v31, 128LL, 1);
    }
    else {
      id Property = 0LL;
    }
    id v34 = Property;
    uint64_t v35 = MEMORY[0x1895F8AE0];
    id v36 = MEMORY[0x1895F8AE0];
    v50[0] = MEMORY[0x1895F87A8];
    v50[1] = 3221225472LL;
    v50[2] = __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke;
    v50[3] = &unk_18A08F968;
    objc_copyWeak(&v54, location);
    int v55 = v8;
    id v51 = v10;
    id v52 = v11;
    id v53 = v13;
    [v32 fetchClientListenerWithBundleID:v34 completionQueue:v35 handler:v50];

    objc_destroyWeak(&v54);
    objc_destroyWeak(location);
  }

- (void).cxx_destruct
{
}

void __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke( uint64_t a1,  void *a2)
{
  v24[1] = *MEMORY[0x1895F89C0];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!v3 || (MEMORY[0x1895ADD58](v3) == MEMORY[0x1895F9260] ? (BOOL v6 = WeakRetained == 0LL) : (BOOL v6 = 1), v6))
  {
    id v7 = (void *)NSString;
    if (WeakRetained) {
      id Property = objc_getProperty(WeakRetained, v4, 128LL, 1);
    }
    else {
      id Property = 0LL;
    }
    [v7 stringWithFormat:@"Failed to establish an IPC connection to target app %@", Property];
    int v9 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v9;
    [MEMORY[0x189603F18] arrayWithObjects:v24 count:1];
    id v10 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }

  else
  {
    id v10 = objc_alloc_init(MEMORY[0x189607B58]);
    [v10 _setEndpoint:v3];
    id v11 = (void *)[objc_alloc(MEMORY[0x189607B30]) initWithListenerEndpoint:v10];
    objc_setProperty_atomic(WeakRetained, v12, v11, 136LL);

    [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6F63A0];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(objc_getProperty(WeakRetained, v14, 136, 1), "setRemoteObjectInterface:", v13);

    id v16 = objc_getProperty(WeakRetained, v15, 136LL, 1);
    v22[0] = MEMORY[0x1895F87A8];
    v22[1] = 3221225472LL;
    v22[2] = __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_2;
    v22[3] = &unk_18A0907E8;
    id v17 = WeakRetained;
    id v23 = v17;
    [v16 remoteObjectProxyWithErrorHandler:v22];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setProperty_atomic(v17, v19, v18, 144LL);

    objc_msgSend(objc_getProperty(v17, v20, 136, 1), "resume");
    objc_msgSend( objc_getProperty(v17, v21, 144, 1),  "handleCommand:forConfigWithName:withParameters:completionHandler:",  *(unsigned int *)(a1 + 64),  *(void *)(a1 + 32),  *(void *)(a1 + 40),  *(void *)(a1 + 48));
  }
}

void __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_128( uint64_t a1,  void *a2)
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, v3, 120LL, 1);
  }
  id v6 = Property;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v29;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(a1 + 40);
        [NSString stringWithFormat:@"%@\n", *(void *)(*((void *)&v28 + 1) + 8 * v10)];
        SEL v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v11 addObject:v12];

        ++v10;
      }

      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }

    while (v8);
  }

  id v14 = *(id *)(a1 + 32);
  if (v14) {
    id v14 = objc_getProperty(v14, v13, 112LL, 1);
  }
  if ([v14 count])
  {
    [*(id *)(a1 + 40) addObject:@"Newly-created (unsaved) configurations:\n"];
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    id v16 = *(id *)(a1 + 32);
    if (v16) {
      id v16 = objc_getProperty(v16, v15, 112LL, 1);
    }
    id v17 = v16;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v25;
      do
      {
        uint64_t v21 = 0LL;
        do
        {
          if (*(void *)v25 != v20) {
            objc_enumerationMutation(v17);
          }
          id v22 = *(void **)(a1 + 40);
          [NSString stringWithFormat:@"%@\n", *(void *)(*((void *)&v24 + 1) + 8 * v21)];
          id v23 = (void *)objc_claimAutoreleasedReturnValue();
          [v22 addObject:v23];

          ++v21;
        }

        while (v19 != v21);
        uint64_t v19 = [v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }

      while (v19);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

- (void)loadAllWithCompletionHandler:(void *)a1
{
  id v3 = a2;
  if (objc_getProperty(a1, v4, 120LL, 1))
  {
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __65__NEProviderAppConfigurationClient_loadAllWithCompletionHandler___block_invoke_7;
    block[3] = &unk_18A090940;
    id v8 = v3;
    dispatch_async(MEMORY[0x1895F8AE0], block);
    v5 = v8;
  }

  else
  {
    +[NEVPNManager sharedManager](&OBJC_CLASS___NEVPNManager, "sharedManager");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = __65__NEProviderAppConfigurationClient_loadAllWithCompletionHandler___block_invoke;
    v9[3] = &unk_18A090968;
    v9[4] = a1;
    id v10 = v3;
    [v6 loadFromPreferencesWithCompletionHandler:v9];

    v5 = v10;
  }
}

void __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_2_133( uint64_t a1,  void *a2)
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  id Property = *(id *)(a1 + 32);
  uint64_t v34 = v4;
  if (Property) {
    id Property = objc_getProperty(Property, v3, 120LL, 1);
  }
  id v6 = Property;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v40;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v40 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v39 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          SEL v12 = *(void **)(a1 + 40);
          id v13 = (void *)NSString;
          [v11 localizedDescription];
          id v14 = (void *)objc_claimAutoreleasedReturnValue();
          [v13 stringWithFormat:@"%@ (filter)", v14, v34];
        }

        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            SEL v12 = *(void **)(a1 + 40);
            SEL v15 = (void *)NSString;
            [v11 localizedDescription];
            id v14 = (void *)objc_claimAutoreleasedReturnValue();
            [v15 stringWithFormat:@"%@ (app-proxy)", v14, v34];
          }

          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              SEL v12 = *(void **)(a1 + 40);
              id v16 = (void *)NSString;
              [v11 localizedDescription];
              id v14 = (void *)objc_claimAutoreleasedReturnValue();
              [v16 stringWithFormat:@"%@ (packet-tunnel)", v14, v34];
            }

            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                SEL v12 = *(void **)(a1 + 40);
                id v17 = (void *)NSString;
                [v11 localizedDescription];
                id v14 = (void *)objc_claimAutoreleasedReturnValue();
                [v17 stringWithFormat:@"%@ (lite)", v14, v34];
              }

              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  SEL v12 = *(void **)(a1 + 40);
                  uint64_t v18 = (void *)NSString;
                  [v11 localizedDescription];
                  id v14 = (void *)objc_claimAutoreleasedReturnValue();
                  [v18 stringWithFormat:@"%@ (dns-proxy)", v14, v34];
                }

                else
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0) {
                    goto LABEL_21;
                  }
                  SEL v12 = *(void **)(a1 + 40);
                  uint64_t v19 = (void *)NSString;
                  [v11 localizedDescription];
                  id v14 = (void *)objc_claimAutoreleasedReturnValue();
                  [v19 stringWithFormat:@"%@ (dns-settings)", v14, v34];
                }
              }
            }
          }
        }

        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
        [v12 addObject:v20];

LABEL_21:
        ++v10;
      }

      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v39 objects:v44 count:16];
    }

    while (v8);
  }

  id v22 = *(id *)(a1 + 32);
  if (v22) {
    id v22 = objc_getProperty(v22, v21, 112LL, 1);
  }
  if ([v22 count])
  {
    [*(id *)(a1 + 40) addObject:@"Newly-created (unsaved) configurations:\n"];
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    id v24 = *(id *)(a1 + 32);
    if (v24) {
      id v24 = objc_getProperty(v24, v23, 112LL, 1);
    }
    id v25 = v24;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v36;
      do
      {
        uint64_t v29 = 0LL;
        do
        {
          if (*(void *)v36 != v28) {
            objc_enumerationMutation(v25);
          }
          __int128 v30 = *(void **)(a1 + 40);
          __int128 v31 = (void *)NSString;
          [*(id *)(*((void *)&v35 + 1) + 8 * v29) localizedDescription];
          id v32 = (void *)objc_claimAutoreleasedReturnValue();
          [v31 stringWithFormat:@"%@ (packet-tunnel)\n", v32];
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          [v30 addObject:v33];

          ++v29;
        }

        while (v27 != v29);
        uint64_t v27 = [v25 countByEnumeratingWithState:&v35 objects:v43 count:16];
      }

      while (v27);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_3( uint64_t a1,  void *a2,  void *a3)
{
  v165[1] = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  uint64_t v158 = 0LL;
  v159 = &v158;
  uint64_t v160 = 0x3032000000LL;
  v161 = __Block_byref_object_copy__19891;
  v162 = __Block_byref_object_dispose__19892;
  id v163 = 0LL;
  id v8 = objc_alloc_init(MEMORY[0x189603FA8]);
  if (v6)
  {
    uint64_t v9 = [NSString stringWithFormat:@"Failed to load configuration %@: %@", *(void *)(a1 + 32), v6];
    uint64_t v10 = (void *)v159[5];
    v159[5] = v9;

    uint64_t v11 = *(void *)(a1 + 56);
    v165[0] = v159[5];
    [MEMORY[0x189603F18] arrayWithObjects:v165 count:1];
    SEL v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
    goto LABEL_3;
  }

  if (!v5 && *(_DWORD *)(a1 + 64) != 1)
  {
    uint64_t v23 = [NSString stringWithFormat:@"Configuration with name %@ does not exist", *(void *)(a1 + 32)];
    id v24 = (void *)v159[5];
    v159[5] = v23;

    uint64_t v25 = *(void *)(a1 + 56);
    uint64_t v164 = v159[5];
    [MEMORY[0x189603F18] arrayWithObjects:&v164 count:1];
    SEL v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v25 + 16))(v25, v12);
    goto LABEL_3;
  }

  id v13 = *(void **)(a1 + 40);
  if (v13)
  {
    objc_setProperty_atomic(v13, v7, 0LL, 80LL);
    SEL v15 = *(void **)(a1 + 40);
    if (v15)
    {
      objc_setProperty_atomic(v15, v14, 0LL, 88LL);
      id v17 = *(void **)(a1 + 40);
      if (v17)
      {
        objc_setProperty_atomic(v17, v16, 0LL, 96LL);
        uint64_t v19 = *(void **)(a1 + 40);
        if (v19) {
          objc_setProperty_atomic(v19, v18, 0LL, 104LL);
        }
      }
    }
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    uint64_t v21 = *(void **)(a1 + 40);
    if (!v21) {
      goto LABEL_25;
    }
    id v22 = &OBJC_IVAR___NEProviderAppConfigurationClient__currentManager;
    goto LABEL_24;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    uint64_t v21 = *(void **)(a1 + 40);
    if (!v21) {
      goto LABEL_25;
    }
    id v22 = &OBJC_IVAR___NEProviderAppConfigurationClient__filterManager;
    goto LABEL_24;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    uint64_t v21 = *(void **)(a1 + 40);
    if (!v21) {
      goto LABEL_25;
    }
    id v22 = &OBJC_IVAR___NEProviderAppConfigurationClient__dnsProxyManager;
    goto LABEL_24;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    uint64_t v21 = *(void **)(a1 + 40);
    if (v21)
    {
      id v22 = &OBJC_IVAR___NEProviderAppConfigurationClient__dnsSettingsManager;
LABEL_24:
      objc_setProperty_atomic(v21, v20, v5, *v22);
    }
  }

void __80__NEProviderAppConfigurationClient_loadConfigurationWithName_completionHandler___block_invoke( void *a1,  void *a2)
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id Property = (id)a1[4];
  id v24 = v4;
  if (Property) {
    id Property = objc_getProperty(Property, v3, 120LL, 1);
  }
  id v6 = Property;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v30;
LABEL_5:
    uint64_t v10 = 0LL;
    while (1)
    {
      if (*(void *)v30 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void **)(*((void *)&v29 + 1) + 8 * v10);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          objc_opt_isKindOfClass();
        }
      }

      [v11 localizedDescription];
      SEL v12 = (void *)objc_claimAutoreleasedReturnValue();
      char v13 = [v12 isEqualToString:a1[5]];

      if ((v13 & 1) != 0) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v29 objects:v34 count:16];
        if (v8) {
          goto LABEL_5;
        }
        goto LABEL_14;
      }
    }

    id v16 = v11;

    SEL v15 = v24;
    if (v16) {
      goto LABEL_29;
    }
  }

  else
  {
LABEL_14:

    SEL v15 = v24;
  }

  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v17 = (id)a1[4];
  if (v17) {
    id v17 = objc_getProperty(v17, v14, 112LL, 1);
  }
  id v18 = v17;
  id v16 = (id)[v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v16)
  {
    uint64_t v19 = *(void *)v26;
    while (2)
    {
      for (i = 0LL; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(v18);
        }
        uint64_t v21 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
        [v21 localizedDescription];
        id v22 = (void *)objc_claimAutoreleasedReturnValue();
        int v23 = [v22 isEqualToString:a1[5]];

        if (v23)
        {
          id v16 = v21;
          goto LABEL_28;
        }
      }

      id v16 = (id)[v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }

void __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_152( void *a1,  void *a2)
{
  v12[1] = *MEMORY[0x1895F89C0];
  id v4 = a2;
  if (v4)
  {
    uint64_t v5 = [NSString stringWithFormat:@"Failed to remove configuration %@: %@", a1[4], v4];
    uint64_t v6 = *(void *)(a1[7] + 8LL);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }

  else
  {
    id Property = (id)a1[5];
    if (Property) {
      id Property = objc_getProperty(Property, v3, 120LL, 1);
    }
    id v9 = Property;
    +[NEFilterManager sharedManager](&OBJC_CLASS___NEFilterManager, "sharedManager");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 removeObjectIdenticalTo:v7];
  }

  uint64_t v10 = a1[6];
  if (*(void *)(*(void *)(a1[7] + 8LL) + 40LL))
  {
    v12[0] = *(void *)(*(void *)(a1[7] + 8LL) + 40LL);
    [MEMORY[0x189603F18] arrayWithObjects:v12 count:1];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);
  }

  else
  {
    (*(void (**)(void, void))(v10 + 16))(a1[6], 0LL);
  }
}

void __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_2_155( void *a1,  void *a2)
{
  v12[1] = *MEMORY[0x1895F89C0];
  id v4 = a2;
  if (v4)
  {
    uint64_t v5 = [NSString stringWithFormat:@"Failed to remove configuration %@: %@", a1[4], v4];
    uint64_t v6 = *(void *)(a1[7] + 8LL);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }

  else
  {
    id Property = (id)a1[5];
    if (Property) {
      id Property = objc_getProperty(Property, v3, 120LL, 1);
    }
    id v9 = Property;
    +[NEDNSProxyManager sharedManager](&OBJC_CLASS___NEDNSProxyManager, "sharedManager");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 removeObjectIdenticalTo:v7];
  }

  uint64_t v10 = a1[6];
  if (*(void *)(*(void *)(a1[7] + 8LL) + 40LL))
  {
    v12[0] = *(void *)(*(void *)(a1[7] + 8LL) + 40LL);
    [MEMORY[0x189603F18] arrayWithObjects:v12 count:1];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);
  }

  else
  {
    (*(void (**)(void, void))(v10 + 16))(a1[6], 0LL);
  }
}

void __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_3_156( void *a1,  void *a2)
{
  v12[1] = *MEMORY[0x1895F89C0];
  id v4 = a2;
  if (v4)
  {
    uint64_t v5 = [NSString stringWithFormat:@"Failed to remove configuration %@: %@", a1[4], v4];
    uint64_t v6 = *(void *)(a1[7] + 8LL);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }

  else
  {
    id Property = (id)a1[5];
    if (Property) {
      id Property = objc_getProperty(Property, v3, 120LL, 1);
    }
    id v9 = Property;
    +[NEDNSSettingsManager sharedManager](&OBJC_CLASS___NEDNSSettingsManager, "sharedManager");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 removeObjectIdenticalTo:v7];
  }

  uint64_t v10 = a1[6];
  if (*(void *)(*(void *)(a1[7] + 8LL) + 40LL))
  {
    v12[0] = *(void *)(*(void *)(a1[7] + 8LL) + 40LL);
    [MEMORY[0x189603F18] arrayWithObjects:v12 count:1];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);
  }

  else
  {
    (*(void (**)(void, void))(v10 + 16))(a1[6], 0LL);
  }
}

void __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_4( void *a1,  void *a2)
{
  v20[1] = *MEMORY[0x1895F89C0];
  id v4 = a2;
  if (v4)
  {
    uint64_t v5 = [NSString stringWithFormat:@"Failed to remove configuration %@: %@", a1[4], v4];
    uint64_t v6 = *(void *)(a1[7] + 8LL);
    id v7 = *(id *)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }

  else
  {
    id Property = (id)a1[5];
    if (Property) {
      id Property = objc_getProperty(Property, v3, 112LL, 1);
    }
    id v10 = Property;
    uint64_t v11 = (void *)a1[5];
    if (v11) {
      id v12 = objc_getProperty(v11, v9, 80LL, 1);
    }
    else {
      id v12 = 0LL;
    }
    [v10 removeObjectIdenticalTo:v12];

    id v14 = (id)a1[5];
    if (v14) {
      id v14 = objc_getProperty(v14, v13, 120LL, 1);
    }
    id v7 = v14;
    id v16 = (void *)a1[5];
    if (v16) {
      id v17 = objc_getProperty(v16, v15, 80LL, 1);
    }
    else {
      id v17 = 0LL;
    }
    [v7 removeObjectIdenticalTo:v17];
  }

  uint64_t v18 = a1[6];
  if (*(void *)(*(void *)(a1[7] + 8LL) + 40LL))
  {
    v20[0] = *(void *)(*(void *)(a1[7] + 8LL) + 40LL);
    [MEMORY[0x189603F18] arrayWithObjects:v20 count:1];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v19);
  }

  else
  {
    (*(void (**)(void, void))(v18 + 16))(a1[6], 0LL);
  }
}

void __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_5( void *a1,  void *a2)
{
  v11[1] = *MEMORY[0x1895F89C0];
  id v4 = a2;
  if (v4)
  {
    uint64_t v5 = [NSString stringWithFormat:@"Failed to save configuration %@: %@", a1[4], v4];
    uint64_t v6 = *(void *)(a1[7] + 8LL);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }

  uint64_t v8 = (void *)a1[5];
  if (v8) {
    objc_setProperty_atomic(v8, v3, 0LL, 120LL);
  }
  uint64_t v9 = a1[6];
  if (*(void *)(*(void *)(a1[7] + 8LL) + 40LL))
  {
    v11[0] = *(void *)(*(void *)(a1[7] + 8LL) + 40LL);
    [MEMORY[0x189603F18] arrayWithObjects:v11 count:1];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
  }

  else
  {
    (*(void (**)(void, void))(v9 + 16))(a1[6], 0LL);
  }
}

void __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_6( void *a1,  void *a2)
{
  v11[1] = *MEMORY[0x1895F89C0];
  id v4 = a2;
  if (v4)
  {
    uint64_t v5 = [NSString stringWithFormat:@"Failed to save configuration %@: %@", a1[4], v4];
    uint64_t v6 = *(void *)(a1[7] + 8LL);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }

  uint64_t v8 = (void *)a1[5];
  if (v8) {
    objc_setProperty_atomic(v8, v3, 0LL, 120LL);
  }
  uint64_t v9 = a1[6];
  if (*(void *)(*(void *)(a1[7] + 8LL) + 40LL))
  {
    v11[0] = *(void *)(*(void *)(a1[7] + 8LL) + 40LL);
    [MEMORY[0x189603F18] arrayWithObjects:v11 count:1];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
  }

  else
  {
    (*(void (**)(void, void))(v9 + 16))(a1[6], 0LL);
  }
}

void __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_7( void *a1,  void *a2)
{
  v11[1] = *MEMORY[0x1895F89C0];
  id v4 = a2;
  if (v4)
  {
    uint64_t v5 = [NSString stringWithFormat:@"Failed to save configuration %@: %@", a1[4], v4];
    uint64_t v6 = *(void *)(a1[7] + 8LL);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }

  uint64_t v8 = (void *)a1[5];
  if (v8) {
    objc_setProperty_atomic(v8, v3, 0LL, 120LL);
  }
  uint64_t v9 = a1[6];
  if (*(void *)(*(void *)(a1[7] + 8LL) + 40LL))
  {
    v11[0] = *(void *)(*(void *)(a1[7] + 8LL) + 40LL);
    [MEMORY[0x189603F18] arrayWithObjects:v11 count:1];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
  }

  else
  {
    (*(void (**)(void, void))(v9 + 16))(a1[6], 0LL);
  }
}

void __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_8( void *a1,  void *a2)
{
  v16[1] = *MEMORY[0x1895F89C0];
  id v4 = a2;
  if (v4)
  {
    uint64_t v5 = [NSString stringWithFormat:@"Failed to save configuration %@: %@", a1[4], v4];
    uint64_t v6 = *(void *)(a1[7] + 8LL);
    id v7 = *(id *)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }

  else
  {
    id Property = (id)a1[5];
    if (Property) {
      id Property = objc_getProperty(Property, v3, 112LL, 1);
    }
    id v7 = Property;
    id v10 = (void *)a1[5];
    if (v10) {
      id v11 = objc_getProperty(v10, v9, 80LL, 1);
    }
    else {
      id v11 = 0LL;
    }
    [v7 removeObjectIdenticalTo:v11];
  }

  char v13 = (void *)a1[5];
  if (v13) {
    objc_setProperty_atomic(v13, v12, 0LL, 120LL);
  }
  uint64_t v14 = a1[6];
  if (*(void *)(*(void *)(a1[7] + 8LL) + 40LL))
  {
    v16[0] = *(void *)(*(void *)(a1[7] + 8LL) + 40LL);
    [MEMORY[0x189603F18] arrayWithObjects:v16 count:1];
    SEL v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);
  }

  else
  {
    (*(void (**)(void, void))(v14 + 16))(a1[6], 0LL);
  }
}

void __65__NEProviderAppConfigurationClient_loadAllWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 connection];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 status];

  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x189603FA8]);
    +[NEVPNManager sharedManager](&OBJC_CLASS___NEVPNManager, "sharedManager");
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = (void *)objc_msgSend(v5, "initWithObjects:", v6, 0);
    uint64_t v9 = *(void **)(a1 + 32);
    if (v9) {
      objc_setProperty_atomic(v9, v7, v8, 120LL);
    }
  }

  +[NEFilterManager sharedManager](&OBJC_CLASS___NEFilterManager, "sharedManager");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  void v12[2] = __65__NEProviderAppConfigurationClient_loadAllWithCompletionHandler___block_invoke_2;
  v12[3] = &unk_18A090968;
  id v11 = *(void **)(a1 + 40);
  void v12[4] = *(void *)(a1 + 32);
  id v13 = v11;
  [v10 loadFromPreferencesWithCompletionHandler:v12];
}

uint64_t __65__NEProviderAppConfigurationClient_loadAllWithCompletionHandler___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __65__NEProviderAppConfigurationClient_loadAllWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 providerConfiguration];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    id v5 = *(void **)(a1 + 32);
    if (v5 && objc_getProperty(v5, v4, 120LL, 1))
    {
      id Property = *(id *)(a1 + 32);
      if (Property) {
        id Property = objc_getProperty(Property, v6, 120LL, 1);
      }
      id v8 = Property;
      +[NEFilterManager sharedManager](&OBJC_CLASS___NEFilterManager, "sharedManager");
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 addObject:v9];
    }

    else
    {
      id v10 = objc_alloc(MEMORY[0x189603FA8]);
      +[NEFilterManager sharedManager](&OBJC_CLASS___NEFilterManager, "sharedManager");
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      id v8 = (id)objc_msgSend(v10, "initWithObjects:", v9, 0);
      id v12 = *(void **)(a1 + 32);
      if (v12) {
        objc_setProperty_atomic(v12, v11, v8, 120LL);
      }
    }
  }

  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __65__NEProviderAppConfigurationClient_loadAllWithCompletionHandler___block_invoke_3;
  v14[3] = &unk_18A0908F0;
  id v13 = *(void **)(a1 + 40);
  void v14[4] = *(void *)(a1 + 32);
  id v15 = v13;
  +[NETunnelProviderManager loadAllFromPreferencesWithCompletionHandler:]( &OBJC_CLASS___NETunnelProviderManager,  "loadAllFromPreferencesWithCompletionHandler:",  v14);
}

void __65__NEProviderAppConfigurationClient_loadAllWithCompletionHandler___block_invoke_3( uint64_t a1,  void *a2)
{
  id v3 = a2;
  if ([v3 count])
  {
    id v5 = *(void **)(a1 + 32);
    if (v5 && objc_getProperty(v5, v4, 120LL, 1))
    {
      id Property = *(id *)(a1 + 32);
      if (Property) {
        id Property = objc_getProperty(Property, v6, 120LL, 1);
      }
      [Property addObjectsFromArray:v3];
    }

    else
    {
      uint64_t v9 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithArray:v3];
      id v10 = *(void **)(a1 + 32);
      if (v10) {
        objc_setProperty_atomic(v10, v8, v9, 120LL);
      }
    }
  }

  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  void v12[2] = __65__NEProviderAppConfigurationClient_loadAllWithCompletionHandler___block_invoke_4;
  v12[3] = &unk_18A0908F0;
  id v11 = *(void **)(a1 + 40);
  void v12[4] = *(void *)(a1 + 32);
  id v13 = v11;
  +[NEAppProxyProviderManager loadAllFromPreferencesWithCompletionHandler:]( &OBJC_CLASS___NEAppProxyProviderManager,  "loadAllFromPreferencesWithCompletionHandler:",  v12);
}

void __65__NEProviderAppConfigurationClient_loadAllWithCompletionHandler___block_invoke_4( uint64_t a1,  void *a2)
{
  id v3 = a2;
  if ([v3 count])
  {
    id v5 = *(void **)(a1 + 32);
    if (v5 && objc_getProperty(v5, v4, 120LL, 1))
    {
      id Property = *(id *)(a1 + 32);
      if (Property) {
        id Property = objc_getProperty(Property, v6, 120LL, 1);
      }
      [Property addObjectsFromArray:v3];
    }

    else
    {
      uint64_t v9 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithArray:v3];
      id v10 = *(void **)(a1 + 32);
      if (v10) {
        objc_setProperty_atomic(v10, v8, v9, 120LL);
      }
    }
  }

  +[NEDNSProxyManager sharedManager](&OBJC_CLASS___NEDNSProxyManager, "sharedManager");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __65__NEProviderAppConfigurationClient_loadAllWithCompletionHandler___block_invoke_5;
  v13[3] = &unk_18A090968;
  id v12 = *(void **)(a1 + 40);
  v13[4] = *(void *)(a1 + 32);
  id v14 = v12;
  [v11 loadFromPreferencesWithCompletionHandler:v13];
}

void __65__NEProviderAppConfigurationClient_loadAllWithCompletionHandler___block_invoke_5( uint64_t a1,  void *a2)
{
  id v4 = a2;
  id v5 = *(void **)(a1 + 32);
  if (v5 && objc_getProperty(v5, v3, 120LL, 1))
  {
    id Property = *(id *)(a1 + 32);
    if (Property) {
      id Property = objc_getProperty(Property, v6, 120LL, 1);
    }
    id v8 = Property;
    +[NEDNSProxyManager sharedManager](&OBJC_CLASS___NEDNSProxyManager, "sharedManager");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 addObject:v9];
  }

  else
  {
    id v10 = objc_alloc(MEMORY[0x189603FA8]);
    +[NEDNSProxyManager sharedManager](&OBJC_CLASS___NEDNSProxyManager, "sharedManager");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    id v8 = (id)objc_msgSend(v10, "initWithObjects:", v9, 0);
    id v12 = *(void **)(a1 + 32);
    if (v12) {
      objc_setProperty_atomic(v12, v11, v8, 120LL);
    }
  }

  +[NEDNSSettingsManager sharedManager](&OBJC_CLASS___NEDNSSettingsManager, "sharedManager");
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __65__NEProviderAppConfigurationClient_loadAllWithCompletionHandler___block_invoke_6;
  v15[3] = &unk_18A090968;
  id v14 = *(void **)(a1 + 40);
  v15[4] = *(void *)(a1 + 32);
  id v16 = v14;
  [v13 loadFromPreferencesWithCompletionHandler:v15];
}

void __65__NEProviderAppConfigurationClient_loadAllWithCompletionHandler___block_invoke_6( uint64_t a1,  void *a2)
{
  id v13 = a2;
  id v4 = *(void **)(a1 + 32);
  if (v4 && objc_getProperty(v4, v3, 120LL, 1))
  {
    id Property = *(id *)(a1 + 32);
    if (Property) {
      id Property = objc_getProperty(Property, v5, 120LL, 1);
    }
    id v7 = Property;
    +[NEDNSSettingsManager sharedManager](&OBJC_CLASS___NEDNSSettingsManager, "sharedManager");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 addObject:v8];
  }

  else
  {
    id v9 = objc_alloc(MEMORY[0x189603FA8]);
    +[NEDNSSettingsManager sharedManager](&OBJC_CLASS___NEDNSSettingsManager, "sharedManager");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v7 = (id)objc_msgSend(v9, "initWithObjects:", v8, 0, v13);
    id v11 = *(void **)(a1 + 32);
    if (v11) {
      objc_setProperty_atomic(v11, v10, v7, 120LL);
    }
  }

  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, void))(v12 + 16))(v12, 0LL);
  }
}

void __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_2( uint64_t a1,  void *a2)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  ne_log_obj();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v9 = 138412290;
    id v10 = v3;
    _os_log_error_impl( &dword_1876B1000,  v4,  OS_LOG_TYPE_ERROR,  "Got an error on the connection with the app: %@",  (uint8_t *)&v9,  0xCu);
  }

  uint64_t v6 = *(void **)(a1 + 32);
  if (v6)
  {
    objc_setProperty_atomic(v6, v5, 0LL, 136LL);
    id v8 = *(void **)(a1 + 32);
    if (v8) {
      objc_setProperty_atomic(v8, v7, 0LL, 144LL);
    }
  }
}

- (uint64_t)deleteKeychainItemWithPersistentReference:(uint64_t)a1
{
  v10[2] = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  uint64_t v2 = *MEMORY[0x18960BB48];
  uint64_t v3 = *MEMORY[0x18960BE80];
  v9[0] = *MEMORY[0x18960BB38];
  v9[1] = v3;
  v10[0] = v2;
  v10[1] = a2;
  id v4 = (void *)MEMORY[0x189603F68];
  id v5 = a2;
  [v4 dictionaryWithObjects:v10 forKeys:v9 count:2];
  uint64_t v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  uint64_t v7 = SecItemDelete(v6);
  return v7;
}

- (uint64_t)setKeychainItemData:(void *)a3 withName:(uint64_t *)a4 persistentReference:
{
  v40[3] = *MEMORY[0x1895F89C0];
  id v7 = a2;
  id v9 = a3;
  if (a1)
  {
    uint64_t v10 = *a4;
    uint64_t v11 = *MEMORY[0x189604DE8];
    uint64_t v12 = *MEMORY[0x18960BE70];
    unint64_t v13 = 0x189603000uLL;
    if (!*a4) {
      goto LABEL_5;
    }
    uint64_t v14 = *MEMORY[0x18960BE18];
    v39[0] = *MEMORY[0x18960BE80];
    v39[1] = v14;
    v40[0] = v10;
    v40[1] = v11;
    v39[2] = v12;
    v40[2] = v11;
    [MEMORY[0x189603F68] dictionaryWithObjects:v40 forKeys:v39 count:3];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    CFTypeRef result = 0LL;
    if (SecItemCopyMatching((CFDictionaryRef)v15, &result))
    {

      goto LABEL_5;
    }

    __int128 v27 = (id)result;
    int v28 = isa_nsdictionary(v27);
    if (v28)
    {
      id v35 = v9;
      id v29 = objc_alloc_init(MEMORY[0x189603FC8]);
      [v29 setObject:*MEMORY[0x18960BB48] forKeyedSubscript:*MEMORY[0x18960BB38]];
      uint64_t v30 = *MEMORY[0x18960BA88];
      [v27 objectForKeyedSubscript:*MEMORY[0x18960BA88]];
      int v34 = v28;
      __int128 v31 = (void *)objc_claimAutoreleasedReturnValue();
      [v29 setObject:v31 forKeyedSubscript:v30];

      [v29 setObject:v11 forKeyedSubscript:v12];
      __int128 v32 = (void *)[v27 mutableCopy];
      [v32 setObject:v7 forKeyedSubscript:*MEMORY[0x18960BE78]];
      uint64_t v24 = SecItemUpdate((CFDictionaryRef)v29, (CFDictionaryRef)v32);

      int v28 = v34;
      id v9 = v35;
      if ((_DWORD)v24 != -25300)
      {

LABEL_14:
        goto LABEL_15;
      }
    }

    unint64_t v13 = 0x189603000LL;
    if (((*a4 != 0) & ~v28) == 0)
    {
LABEL_5:
      v37[0] = *MEMORY[0x18960BA88];
      id v16 = (void *)NSString;
      objc_msgSend(objc_getProperty(a1, v8, 80, 1), "localizedDescription");
      id v17 = (void *)objc_claimAutoreleasedReturnValue();
      [v16 stringWithFormat:@"%@.PASSWORD", v17];
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v19 = *MEMORY[0x18960BE78];
      v38[0] = v18;
      v38[1] = v7;
      uint64_t v20 = *MEMORY[0x18960B828];
      v37[1] = v19;
      v37[2] = v20;
      uint64_t v21 = *MEMORY[0x18960BB38];
      uint64_t v22 = *MEMORY[0x18960BB48];
      v38[2] = *MEMORY[0x18960B830];
      v38[3] = v22;
      uint64_t v23 = *MEMORY[0x18960BE28];
      v37[3] = v21;
      v37[4] = v23;
      v37[5] = v12;
      void v38[4] = v11;
      v38[5] = v11;
      [*(id *)(v13 + 3944) dictionaryWithObjects:v38 forKeys:v37 count:6];
      id v15 = (void *)objc_claimAutoreleasedReturnValue();

      CFTypeRef result = 0LL;
      uint64_t v24 = SecItemAdd((CFDictionaryRef)v15, &result);
      if (!(_DWORD)v24)
      {
        __int128 v25 = (id)result;
        if (isa_nsdata(v25))
        {
          id v26 = v25;
          *a4 = (uint64_t)v26;
        }

        else
        {

          uint64_t v24 = 4294965226LL;
        }
      }

      goto LABEL_14;
    }
  }

  uint64_t v24 = 0LL;
LABEL_15:

  return v24;
}

void __71__NEProviderAppConfigurationClient_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  self = objc_loadWeakRetained((id *)(a1 + 32));
  if (self)
  {
    objc_setProperty_atomic(self, v1, 0LL, 80LL);
    objc_setProperty_atomic(self, v2, 0LL, 120LL);
    objc_setProperty_atomic(self, v3, 0LL, 112LL);
  }
}

void __71__NEProviderAppConfigurationClient_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  self = objc_loadWeakRetained((id *)(a1 + 32));
  if (self)
  {
    objc_setProperty_atomic(self, v1, 0LL, 80LL);
    objc_setProperty_atomic(self, v2, 0LL, 120LL);
    objc_setProperty_atomic(self, v3, 0LL, 112LL);
  }
}

- (id)listenerEndpoint
{
  if (a1)
  {
    objc_msgSend(objc_getProperty(a1, a2, 72, 1), "endpoint");
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return a1;
}

@end