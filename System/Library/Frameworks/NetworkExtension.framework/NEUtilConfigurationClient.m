@interface NEUtilConfigurationClient
+ (id)allClients;
+ (id)clientWithName:(id)a3;
+ (void)removeClientWithName:(id)a3;
- (BOOL)addOnDemandRuleWithParameters:(id)a3 errorStr:(id *)a4;
- (BOOL)addRelayWithParameters:(id)a3 errorStr:(id *)a4;
- (BOOL)createConfigurationWithParameters:(id)a3 errorStr:(id *)a4;
- (BOOL)disconnectOnDemandEnabled;
- (BOOL)enabled;
- (BOOL)isAlwaysOn;
- (BOOL)onDemandEnabled;
- (BOOL)onDemandUserOverrideDisabled;
- (BOOL)removeOnDemandRuleWithParameters:(id)a3 errorStr:(id *)a4;
- (BOOL)removeRelayWithParameters:(id)a3 errorStr:(id *)a4;
- (BOOL)setAppPushParameters:(id)a3 errorStr:(id *)a4;
- (BOOL)setCommonParameters:(id)a3 errorStr:(id *)a4;
- (BOOL)setDNSParameters:(id)a3 errorStr:(id *)a4;
- (BOOL)setDNSProxyWithParameters:(id)a3 errorStr:(id *)a4;
- (BOOL)setFilterPluginWithParameters:(id)a3 errorStr:(id *)a4;
- (BOOL)setIPSecParameters:(id)a3 errorStr:(id *)a4;
- (BOOL)setPasswordWithParameters:(id)a3 errorStr:(id *)a4;
- (BOOL)setProtocolWithParameters:(id)a3 errorStr:(id *)a4;
- (BOOL)setProviderTypeWithParameters:(id)a3 errorStr:(id *)a4;
- (BOOL)setProxyParameters:(id)a3 errorStr:(id *)a4;
- (BOOL)setProxyServer:(id)a3 errorStr:(id *)a4;
- (BOOL)setRelayConditionsWithParameters:(id)a3 errorStr:(id *)a4;
- (BOOL)setSharedSecretWithParameters:(id)a3 errorStr:(id *)a4;
- (BOOL)unsetAppPushParameters:(id)a3 errorStr:(id *)a4;
- (BOOL)unsetCommonParameters:(id)a3 errorStr:(id *)a4;
- (BOOL)unsetDNSParameters:(id)a3 errorStr:(id *)a4;
- (BOOL)unsetDNSProxyWithParameters:(id)a3 errorStr:(id *)a4;
- (BOOL)unsetFilterPluginParameters:(id)a3 errorStr:(id *)a4;
- (BOOL)unsetIPSecParameters:(id)a3 errorStr:(id *)a4;
- (BOOL)unsetPasswordWithParameters:(id)a3 errorStr:(id *)a4;
- (BOOL)unsetProxyParameters:(id)a3 errorStr:(id *)a4;
- (BOOL)unsetProxyServer:(id)a3 errorStr:(id *)a4;
- (BOOL)unsetRelayConditionsWithParameters:(id)a3 errorStr:(id *)a4;
- (BOOL)unsetSharedSecretWithParameters:(id)a3 errorStr:(id *)a4;
- (NEAppPush)appPush;
- (NEDNSProxyProviderProtocol)dnsProxyConfiguration;
- (NEDNSSettingsBundle)dnsSettingsBundle;
- (NEFilterProviderConfiguration)filterConfiguration;
- (NEUtilConfigurationClient)initWithClientName:(id)a3;
- (NSArray)onDemandRules;
- (NSString)clientName;
- (id)initInternalWithClientName:(id)a3;
- (id)protocolForParameters:(id)a3;
- (id)relayConfiguration;
- (void)addAppRuleWithParameters:(void *)a3 errorStr:;
- (void)addPathRuleWithParameters:(const __CFString *)a3 errorStr:;
- (void)dealloc;
- (void)handleCommand:(int)a3 forConfigWithName:(id)a4 withParameters:(id)a5 completionHandler:(id)a6;
- (void)loadConfigurationsForceRefresh:(void *)a3 completionHandler:;
- (void)removeAppRuleWithParameters:(void *)a3 errorStr:;
- (void)removePathRuleWithParameters:(void *)a3 errorStr:;
- (void)setAlwaysOnParameters:(const __CFString *)a3 errorStr:;
- (void)setDisconnectOnDemandEnabled:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setOnDemandEnabled:(BOOL)a3;
- (void)setOnDemandRules:(id)a3;
- (void)setOnDemandUserOverrideDisabled:(BOOL)a3;
- (void)setPPPParameters:(void *)a3 errorStr:;
- (void)setPathControllerWithParameters:(void *)a3 errorStr:;
- (void)swapConfigurationTypeWithParameters:(void *)a3 errorStr:;
- (void)unsetAlwaysOnParameters:(const __CFString *)a3 errorStr:;
- (void)unsetPPPParameters:(void *)a3 errorStr:;
@end

@implementation NEUtilConfigurationClient

- (id)initInternalWithClientName:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NEUtilConfigurationClient;
  v5 = -[NEUtilConfigurationClient init](&v9, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    clientName = v5->_clientName;
    v5->_clientName = (NSString *)v6;
  }

  return v5;
}

- (NEUtilConfigurationClient)initWithClientName:(id)a3
{
  id v4 = a3;
  v5 = -[NEUtilConfigurationClient initInternalWithClientName:](self, "initInternalWithClientName:", v4);
  if (v5)
  {
    if (geteuid())
    {
      uint64_t v6 = objc_alloc_init(&OBJC_CLASS___NEConfigurationManager);
    }

    else
    {
      +[NEConfigurationManager sharedManagerForAllUsers]( &OBJC_CLASS___NEConfigurationManager,  "sharedManagerForAllUsers");
      uint64_t v6 = (NEConfigurationManager *)objc_claimAutoreleasedReturnValue();
    }

    manager = v5->_manager;
    v5->_manager = v6;

    objc_initWeak(&location, v5);
    v8 = v5->_manager;
    uint64_t v9 = MEMORY[0x1895F8AE0];
    id v10 = MEMORY[0x1895F8AE0];
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __48__NEUtilConfigurationClient_initWithClientName___block_invoke;
    v12[3] = &unk_18A08FD30;
    objc_copyWeak(&v13, &location);
    -[NEConfigurationManager setChangedQueue:andHandler:](v8, "setChangedQueue:andHandler:", v9, v12);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___NEUtilConfigurationClient;
  -[NEUtilConfigurationClient dealloc](&v2, sel_dealloc);
}

- (BOOL)enabled
{
  objc_super v2 = self;
  if (self) {
    self = (NEUtilConfigurationClient *)objc_getProperty(self, a2, 56LL, 1);
  }
  v3 = -[NEUtilConfigurationClient VPN](self, "VPN");
  if (v3)
  {
    if (v2) {
      id Property = objc_getProperty(v2, v4, 56LL, 1);
    }
    else {
      id Property = 0LL;
    }
    [Property VPN];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_43:
    v31 = v6;
    char v32 = [v6 isEnabled];

    return v32;
  }

  if (v2) {
    id v7 = objc_getProperty(v2, v4, 56LL, 1);
  }
  else {
    id v7 = 0LL;
  }
  [v7 appVPN];
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (v2) {
      id v10 = objc_getProperty(v2, v9, 56LL, 1);
    }
    else {
      id v10 = 0LL;
    }
    [v10 appVPN];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_43;
  }

  if (v2) {
    id v11 = objc_getProperty(v2, v9, 56LL, 1);
  }
  else {
    id v11 = 0LL;
  }
  [v11 contentFilter];
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    if (v2) {
      id v14 = objc_getProperty(v2, v13, 56LL, 1);
    }
    else {
      id v14 = 0LL;
    }
    [v14 contentFilter];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_43;
  }

  if (v2) {
    id v15 = objc_getProperty(v2, v13, 56LL, 1);
  }
  else {
    id v15 = 0LL;
  }
  [v15 alwaysOnVPN];
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    if (v2) {
      id v18 = objc_getProperty(v2, v17, 56LL, 1);
    }
    else {
      id v18 = 0LL;
    }
    [v18 alwaysOnVPN];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_43;
  }

  if (v2) {
    id v19 = objc_getProperty(v2, v17, 56LL, 1);
  }
  else {
    id v19 = 0LL;
  }
  [v19 dnsProxy];
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    if (v2) {
      id v22 = objc_getProperty(v2, v21, 56LL, 1);
    }
    else {
      id v22 = 0LL;
    }
    [v22 dnsProxy];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_43;
  }

  if (v2) {
    id v23 = objc_getProperty(v2, v21, 56LL, 1);
  }
  else {
    id v23 = 0LL;
  }
  [v23 dnsSettings];
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    if (v2) {
      id v26 = objc_getProperty(v2, v25, 56LL, 1);
    }
    else {
      id v26 = 0LL;
    }
    [v26 dnsSettings];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_43;
  }

  if (v2) {
    id v27 = objc_getProperty(v2, v25, 56LL, 1);
  }
  else {
    id v27 = 0LL;
  }
  [v27 relay];
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    if (v2) {
      id v30 = objc_getProperty(v2, v29, 56LL, 1);
    }
    else {
      id v30 = 0LL;
    }
    [v30 relay];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_43;
  }

  return 0;
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = self;
  if (self) {
    self = (NEUtilConfigurationClient *)objc_getProperty(self, a2, 56LL, 1);
  }
  v5 = -[NEUtilConfigurationClient VPN](self, "VPN");
  if (v5)
  {
    if (v4) {
      id Property = objc_getProperty(v4, v6, 56LL, 1);
    }
    else {
      id Property = 0LL;
    }
    [Property VPN];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_49:
    id v37 = v8;
    [v8 setEnabled:v3];

    return;
  }

  if (v4) {
    id v9 = objc_getProperty(v4, v6, 56LL, 1);
  }
  else {
    id v9 = 0LL;
  }
  [v9 appVPN];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (v4) {
      id v12 = objc_getProperty(v4, v11, 56LL, 1);
    }
    else {
      id v12 = 0LL;
    }
    [v12 appVPN];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_49;
  }

  if (v4) {
    id v13 = objc_getProperty(v4, v11, 56LL, 1);
  }
  else {
    id v13 = 0LL;
  }
  [v13 contentFilter];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    if (v4) {
      id v16 = objc_getProperty(v4, v15, 56LL, 1);
    }
    else {
      id v16 = 0LL;
    }
    [v16 contentFilter];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_49;
  }

  if (v4) {
    id v17 = objc_getProperty(v4, v15, 56LL, 1);
  }
  else {
    id v17 = 0LL;
  }
  [v17 alwaysOnVPN];
  id v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    if (v4) {
      id v20 = objc_getProperty(v4, v19, 56LL, 1);
    }
    else {
      id v20 = 0LL;
    }
    [v20 alwaysOnVPN];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_49;
  }

  if (v4) {
    id v21 = objc_getProperty(v4, v19, 56LL, 1);
  }
  else {
    id v21 = 0LL;
  }
  [v21 dnsSettings];
  id v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    if (v4) {
      id v24 = objc_getProperty(v4, v23, 56LL, 1);
    }
    else {
      id v24 = 0LL;
    }
    [v24 dnsSettings];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_49;
  }

  if (v4) {
    id v25 = objc_getProperty(v4, v23, 56LL, 1);
  }
  else {
    id v25 = 0LL;
  }
  [v25 dnsProxy];
  id v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    if (v4) {
      id v28 = objc_getProperty(v4, v27, 56LL, 1);
    }
    else {
      id v28 = 0LL;
    }
    [v28 dnsProxy];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_49;
  }

  if (v4) {
    id v29 = objc_getProperty(v4, v27, 56LL, 1);
  }
  else {
    id v29 = 0LL;
  }
  [v29 pathController];
  id v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    if (v4) {
      id v32 = objc_getProperty(v4, v31, 56LL, 1);
    }
    else {
      id v32 = 0LL;
    }
    [v32 pathController];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_49;
  }

  if (v4) {
    id v33 = objc_getProperty(v4, v31, 56LL, 1);
  }
  else {
    id v33 = 0LL;
  }
  [v33 relay];
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    if (v4) {
      id v36 = objc_getProperty(v4, v35, 56LL, 1);
    }
    else {
      id v36 = 0LL;
    }
    [v36 relay];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_49;
  }

- (BOOL)onDemandEnabled
{
  objc_super v2 = self;
  if (self) {
    self = (NEUtilConfigurationClient *)objc_getProperty(self, a2, 56LL, 1);
  }
  -[NEUtilConfigurationClient VPN](self, "VPN");
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (v2) {
      id Property = objc_getProperty(v2, v4, 56LL, 1);
    }
    else {
      id Property = 0LL;
    }
    [Property VPN];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
    id v11 = v6;
    char v12 = [v6 isOnDemandEnabled];

    return v12;
  }

  if (v2) {
    id v7 = objc_getProperty(v2, v4, 56LL, 1);
  }
  else {
    id v7 = 0LL;
  }
  [v7 appVPN];
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (v2) {
      id v10 = objc_getProperty(v2, v9, 56LL, 1);
    }
    else {
      id v10 = 0LL;
    }
    [v10 appVPN];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }

  return 0;
}

- (void)setOnDemandEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = self;
  if (self) {
    self = (NEUtilConfigurationClient *)objc_getProperty(self, a2, 56LL, 1);
  }
  v5 = -[NEUtilConfigurationClient VPN](self, "VPN");
  if (v5)
  {
    if (v4) {
      id Property = objc_getProperty(v4, v6, 56LL, 1);
    }
    else {
      id Property = 0LL;
    }
    [Property VPN];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
    id v13 = v8;
    [v8 setOnDemandEnabled:v3];

    return;
  }

  if (v4) {
    id v9 = objc_getProperty(v4, v6, 56LL, 1);
  }
  else {
    id v9 = 0LL;
  }
  [v9 appVPN];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (v4) {
      id v12 = objc_getProperty(v4, v11, 56LL, 1);
    }
    else {
      id v12 = 0LL;
    }
    [v12 appVPN];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }

- (BOOL)onDemandUserOverrideDisabled
{
  objc_super v2 = self;
  if (self) {
    self = (NEUtilConfigurationClient *)objc_getProperty(self, a2, 56LL, 1);
  }
  -[NEUtilConfigurationClient VPN](self, "VPN");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (v2) {
      id Property = objc_getProperty(v2, v3, 56LL, 1);
    }
    else {
      id Property = 0LL;
    }
    uint64_t v6 = [Property VPN];
  }

  else
  {
    if (v2) {
      id v7 = objc_getProperty(v2, v3, 56LL, 1);
    }
    else {
      id v7 = 0LL;
    }
    uint64_t v6 = [v7 appVPN];
  }

  v8 = (void *)v6;

  char v9 = [v8 isOnDemandUserOverrideDisabled];
  return v9;
}

- (void)setOnDemandUserOverrideDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = self;
  if (self) {
    self = (NEUtilConfigurationClient *)objc_getProperty(self, a2, 56LL, 1);
  }
  -[NEUtilConfigurationClient VPN](self, "VPN");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (v4) {
      id Property = objc_getProperty(v4, v5, 56LL, 1);
    }
    else {
      id Property = 0LL;
    }
    uint64_t v8 = [Property VPN];
  }

  else
  {
    if (v4) {
      id v9 = objc_getProperty(v4, v5, 56LL, 1);
    }
    else {
      id v9 = 0LL;
    }
    uint64_t v8 = [v9 appVPN];
  }

  id v11 = (id)v8;

  id v10 = v11;
  if (v11)
  {
    [v11 setOnDemandUserOverrideDisabled:v3];
    id v10 = v11;
  }
}

- (BOOL)disconnectOnDemandEnabled
{
  objc_super v2 = self;
  if (self) {
    self = (NEUtilConfigurationClient *)objc_getProperty(self, a2, 56LL, 1);
  }
  -[NEUtilConfigurationClient VPN](self, "VPN");
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (v2) {
      id Property = objc_getProperty(v2, v4, 56LL, 1);
    }
    else {
      id Property = 0LL;
    }
    [Property VPN];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
    id v11 = v6;
    char v12 = [v6 isDisconnectOnDemandEnabled];

    return v12;
  }

  if (v2) {
    id v7 = objc_getProperty(v2, v4, 56LL, 1);
  }
  else {
    id v7 = 0LL;
  }
  [v7 appVPN];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (v2) {
      id v10 = objc_getProperty(v2, v9, 56LL, 1);
    }
    else {
      id v10 = 0LL;
    }
    [v10 appVPN];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }

  return 0;
}

- (void)setDisconnectOnDemandEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = self;
  if (self) {
    self = (NEUtilConfigurationClient *)objc_getProperty(self, a2, 56LL, 1);
  }
  v5 = -[NEUtilConfigurationClient VPN](self, "VPN");
  if (v5)
  {
    if (v4) {
      id Property = objc_getProperty(v4, v6, 56LL, 1);
    }
    else {
      id Property = 0LL;
    }
    [Property VPN];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
    id v13 = v8;
    [v8 setDisconnectOnDemandEnabled:v3];

    return;
  }

  if (v4) {
    id v9 = objc_getProperty(v4, v6, 56LL, 1);
  }
  else {
    id v9 = 0LL;
  }
  [v9 appVPN];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (v4) {
      id v12 = objc_getProperty(v4, v11, 56LL, 1);
    }
    else {
      id v12 = 0LL;
    }
    [v12 appVPN];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }

- (NSArray)onDemandRules
{
  objc_super v2 = self;
  if (self) {
    self = (NEUtilConfigurationClient *)objc_getProperty(self, a2, 56LL, 1);
  }
  -[NEUtilConfigurationClient VPN](self, "VPN");
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (v2) {
      id Property = objc_getProperty(v2, v4, 56LL, 1);
    }
    else {
      id Property = 0LL;
    }
    [Property VPN];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:
    id v15 = v6;
    [v6 onDemandRules];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();

    return (NSArray *)v12;
  }

  if (v2) {
    id v7 = objc_getProperty(v2, v4, 56LL, 1);
  }
  else {
    id v7 = 0LL;
  }
  [v7 appVPN];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (v2) {
      id v10 = objc_getProperty(v2, v9, 56LL, 1);
    }
    else {
      id v10 = 0LL;
    }
    [v10 appVPN];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }

  if (v2) {
    id v11 = objc_getProperty(v2, v9, 56LL, 1);
  }
  else {
    id v11 = 0LL;
  }
  [v11 dnsSettings];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    if (v2) {
      id v14 = objc_getProperty(v2, v13, 56LL, 1);
    }
    else {
      id v14 = 0LL;
    }
    [v14 dnsSettings];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }

  return (NSArray *)v12;
}

- (void)setOnDemandRules:(id)a3
{
  id v22 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 56LL, 1);
  }
  else {
    id Property = 0LL;
  }
  [Property VPN];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    id v9 = (void *)[v22 copy];
    if (self) {
      id v10 = objc_getProperty(self, v8, 56LL, 1);
    }
    else {
      id v10 = 0LL;
    }
    [v10 VPN];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:
    id v21 = v11;
    [v11 setOnDemandRules:v9];

    goto LABEL_20;
  }

  if (self) {
    id v12 = objc_getProperty(self, v7, 56LL, 1);
  }
  else {
    id v12 = 0LL;
  }
  [v12 appVPN];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    id v9 = (void *)[v22 copy];
    if (self) {
      id v16 = objc_getProperty(self, v15, 56LL, 1);
    }
    else {
      id v16 = 0LL;
    }
    [v16 appVPN];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }

  if (self) {
    id v17 = objc_getProperty(self, v14, 56LL, 1);
  }
  else {
    id v17 = 0LL;
  }
  [v17 dnsSettings];
  id v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    id v9 = (void *)[v22 copy];
    if (self) {
      id v20 = objc_getProperty(self, v19, 56LL, 1);
    }
    else {
      id v20 = 0LL;
    }
    [v20 dnsSettings];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }

- (id)protocolForParameters:(id)a3
{
  id v5 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 56LL, 1);
  }
  else {
    id Property = 0LL;
  }
  [Property VPN];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (self) {
      id v9 = objc_getProperty(self, v8, 56LL, 1);
    }
    else {
      id v9 = 0LL;
    }
    [v9 VPN];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
    id v15 = v10;
    [v10 protocol];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }

  if (self) {
    id v11 = objc_getProperty(self, v8, 56LL, 1);
  }
  else {
    id v11 = 0LL;
  }
  [v11 appVPN];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    if (self) {
      id v14 = objc_getProperty(self, v13, 56LL, 1);
    }
    else {
      id v14 = 0LL;
    }
    [v14 appVPN];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }

  if (self) {
    id v18 = objc_getProperty(self, v13, 56LL, 1);
  }
  else {
    id v18 = 0LL;
  }
  [v18 alwaysOnVPN];
  id v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    id v16 = 0LL;
    goto LABEL_15;
  }

  [v5 objectForKeyedSubscript:@"interface-name"];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    if (self) {
      id v21 = objc_getProperty(self, v20, 56LL, 1);
    }
    else {
      id v21 = 0LL;
    }
    [v21 alwaysOnVPN];
    id v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v22 interfaceProtocolMapping];
    id v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v23 objectForKeyedSubscript:v15];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v16 = 0LL;
  }

- (NEFilterProviderConfiguration)filterConfiguration
{
  if (self) {
    self = (NEUtilConfigurationClient *)objc_getProperty(self, a2, 56LL, 1);
  }
  -[NEUtilConfigurationClient contentFilter](self, "contentFilter");
  objc_super v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 provider];
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NEFilterProviderConfiguration *)v3;
}

- (NEDNSProxyProviderProtocol)dnsProxyConfiguration
{
  if (self) {
    self = (NEUtilConfigurationClient *)objc_getProperty(self, a2, 56LL, 1);
  }
  -[NEUtilConfigurationClient dnsProxy](self, "dnsProxy");
  objc_super v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 protocol];
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NEDNSProxyProviderProtocol *)v3;
}

- (NEDNSSettingsBundle)dnsSettingsBundle
{
  if (self) {
    self = (NEUtilConfigurationClient *)objc_getProperty(self, a2, 56LL, 1);
  }
  return (NEDNSSettingsBundle *)-[NEUtilConfigurationClient dnsSettings](self, "dnsSettings");
}

- (NEAppPush)appPush
{
  if (self) {
    self = (NEUtilConfigurationClient *)objc_getProperty(self, a2, 56LL, 1);
  }
  return -[NEUtilConfigurationClient appPush](self, "appPush");
}

- (BOOL)createConfigurationWithParameters:(id)a3 errorStr:(id *)a4
{
  id v6 = a3;
  [v6 objectForKeyedSubscript:@"name"];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 objectForKeyedSubscript:@"type"];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 objectForKeyedSubscript:@"grade"];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && ([v9 isEqualToString:@"enterprise"] & 1) == 0)
  {
    if ([v9 isEqualToString:@"personal"])
    {
      uint64_t v10 = 2LL;
    }

    else
    {
      if (([v9 isEqualToString:@"system"] & 1) == 0)
      {
        [NSString stringWithFormat:@"Invalid configuration grade: %@", v9];
        BOOL v13 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_32;
      }

      uint64_t v10 = 3LL;
    }
  }

  else
  {
    uint64_t v10 = 1LL;
  }

  id v11 = -[NEConfiguration initWithName:grade:]( objc_alloc(&OBJC_CLASS___NEConfiguration),  "initWithName:grade:",  v7,  v10);
  if ([v8 isEqualToString:@"vpn"])
  {
    id v12 = objc_alloc_init(&OBJC_CLASS___NEVPN);
    -[NEConfiguration setVPN:](v11, "setVPN:", v12);
  }

  else if ([v8 isEqualToString:@"aovpn"])
  {
    id v12 = objc_alloc_init(&OBJC_CLASS___NEAOVPN);
    -[NEConfiguration setAlwaysOnVPN:](v11, "setAlwaysOnVPN:", v12);
  }

  else if ([v8 isEqualToString:@"appvpn"])
  {
    id v12 = objc_alloc_init(&OBJC_CLASS___NEVPNApp);
    -[NEConfiguration setAppVPN:](v11, "setAppVPN:", v12);
  }

  else if ([v8 isEqualToString:@"contentfilter"])
  {
    id v12 = objc_alloc_init(&OBJC_CLASS___NEContentFilter);
    -[NEConfiguration setContentFilter:](v11, "setContentFilter:", v12);
  }

  else if ([v8 isEqualToString:@"pathcontroller"])
  {
    id v12 = objc_alloc_init(&OBJC_CLASS___NEPathController);
    -[NEConfiguration setPathController:](v11, "setPathController:", v12);
  }

  else if ([v8 isEqualToString:@"dnsproxy"])
  {
    id v12 = objc_alloc_init(&OBJC_CLASS___NEDNSProxy);
    -[NEConfiguration setDnsProxy:](v11, "setDnsProxy:", v12);
  }

  else if ([v8 isEqualToString:@"dnssettings"])
  {
    id v12 = objc_alloc_init(&OBJC_CLASS___NEDNSSettingsBundle);
    -[NEConfiguration setDnsSettings:](v11, "setDnsSettings:", v12);
  }

  else if ([v8 isEqualToString:@"appPush"])
  {
    id v12 = objc_alloc_init(&OBJC_CLASS___NEAppPush);
    -[NEConfiguration setAppPush:](v11, "setAppPush:", v12);
  }

  else
  {
    if (![v8 isEqualToString:@"relay"])
    {
      [NSString stringWithFormat:@"Invalid configuration type: %@", v8];
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      BOOL v13 = 0;
      goto LABEL_32;
    }

    id v12 = objc_alloc_init(&OBJC_CLASS___NERelayConfiguration);
    -[NEConfiguration setRelay:](v11, "setRelay:", v12);
  }

  if (self)
  {
    if (!objc_getProperty(self, v14, 32LL, 1))
    {
      id v16 = objc_alloc_init(MEMORY[0x189603FA8]);
      objc_setProperty_atomic(self, v17, v16, 32LL);
    }

    id Property = objc_getProperty(self, v15, 32LL, 1);
  }

  else
  {

    id Property = 0LL;
  }

  [Property addObject:v11];
  currentConfiguration = self->_currentConfiguration;
  self->_currentConfiguration = v11;
  id v20 = v11;

  BOOL v13 = 1;
LABEL_32:

  return v13;
}

- (BOOL)setProtocolWithParameters:(id)a3 errorStr:(id *)a4
{
  id v6 = a3;
  [v6 objectForKeyedSubscript:@"type"];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v7 isEqualToString:@"ikev1"])
  {
    uint64_t v8 = &OBJC_CLASS___NEVPNProtocolIPSec;
    goto LABEL_8;
  }

  if (![v7 isEqualToString:@"ikev2"])
  {
    if ([v7 isEqualToString:@"l2tp"])
    {
      uint64_t v8 = &OBJC_CLASS___NEVPNProtocolL2TP;
      goto LABEL_8;
    }

    if (![v7 isEqualToString:@"aovpn"])
    {
      if ([v7 isEqualToString:@"plugin"])
      {
        uint64_t v50 = [v6 objectForKeyedSubscript:@"plugin-type"];
        if (v50)
        {
          v51 = (void *)v50;
          uint64_t v10 = -[NETunnelProviderProtocol initWithPluginType:]( objc_alloc(&OBJC_CLASS___NETunnelProviderProtocol),  "initWithPluginType:",  v50);

          if (self) {
            goto LABEL_9;
          }
          goto LABEL_57;
        }

        BOOL v34 = 0;
        v69 = @"Missing plugin type";
      }

      else
      {
        BOOL v34 = 0;
        v69 = @"Invalid protocol type";
      }

      *a4 = v69;
      goto LABEL_53;
    }
  }

  uint64_t v8 = &OBJC_CLASS___NEVPNProtocolIKEv2;
LABEL_8:
  uint64_t v10 = (NETunnelProviderProtocol *)objc_alloc_init(v8);
  if (self)
  {
LABEL_9:
    id Property = objc_getProperty(self, v9, 56LL, 1);
    goto LABEL_10;
  }

- (BOOL)setFilterPluginWithParameters:(id)a3 errorStr:(id *)a4
{
  id v6 = a3;
  -[NEUtilConfigurationClient filterConfiguration](self, "filterConfiguration");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    [v6 objectForKeyedSubscript:@"organization"];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      [v6 objectForKeyedSubscript:@"organization"];
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 setOrganization:v9];
    }

    [v6 objectForKeyedSubscript:@"filter-browsers"];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      [v6 objectForKeyedSubscript:@"filter-browsers"];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setFilterBrowsers:", objc_msgSend(v11, "BOOLValue"));
    }

    [v6 objectForKeyedSubscript:@"filter-sockets"];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      [v6 objectForKeyedSubscript:@"filter-sockets"];
      BOOL v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setFilterSockets:", objc_msgSend(v13, "BOOLValue"));
    }

    [v6 objectForKeyedSubscript:@"filter-packets"];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      [v6 objectForKeyedSubscript:@"filter-packets"];
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setFilterPackets:", objc_msgSend(v15, "BOOLValue"));
    }

    [v6 objectForKeyedSubscript:@"disable-default-drop"];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      [v6 objectForKeyedSubscript:@"disable-default-drop"];
      id v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setDisableDefaultDrop:", objc_msgSend(v17, "BOOLValue"));
    }

    [v6 objectForKeyedSubscript:@"preserve-existing-connections"];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      [v6 objectForKeyedSubscript:@"preserve-existing-connections"];
      id v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setPreserveExistingConnections:", objc_msgSend(v19, "BOOLValue"));
    }

    [v6 objectForKeyedSubscript:@"vendor-config"];
    id v20 = (void *)objc_claimAutoreleasedReturnValue();
    int v21 = isa_nsdictionary(v20);

    if (v21)
    {
      [v6 objectForKeyedSubscript:@"vendor-config"];
      id v22 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 setVendorConfiguration:v22];
    }

    [v6 objectForKeyedSubscript:@"provider-bundle-identifier"];
    id v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      [v6 objectForKeyedSubscript:@"provider-bundle-identifier"];
      id v24 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 setFilterDataProviderBundleIdentifier:v24];
    }

    [v6 objectForKeyedSubscript:@"designated-requirement"];
    id v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      [v6 objectForKeyedSubscript:@"designated-requirement"];
      id v26 = (void *)objc_claimAutoreleasedReturnValue();
      [v26 stringByRemovingPercentEncoding];
      id v27 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 setDataProviderDesignatedRequirement:v27];
    }

    [v6 objectForKeyedSubscript:@"packet-provider-bundle-identifier"];
    id v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      [v6 objectForKeyedSubscript:@"packet-provider-bundle-identifier"];
      id v29 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 setFilterPacketProviderBundleIdentifier:v29];
    }

    [v6 objectForKeyedSubscript:@"packet-provider-designated-requirement"];
    id v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      [v6 objectForKeyedSubscript:@"packet-provider-designated-requirement"];
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      [v31 stringByRemovingPercentEncoding];
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 setPacketProviderDesignatedRequirement:v32];
    }
  }

  else
  {
    *a4 = @"Filter plugin type has not been set yet";
  }

  return v7 != 0LL;
}

- (BOOL)unsetFilterPluginParameters:(id)a3 errorStr:(id *)a4
{
  id v5 = a3;
  -[NEUtilConfigurationClient filterConfiguration](self, "filterConfiguration");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 objectForKeyedSubscript:@"organization"];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7) {
    [v6 setOrganization:0];
  }
  [v5 objectForKeyedSubscript:@"vendor-config"];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8) {
    [v6 setVendorConfiguration:0];
  }
  [v5 objectForKeyedSubscript:@"designated-requirement"];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9) {
    [v6 setDataProviderDesignatedRequirement:0];
  }

  return 1;
}

- (BOOL)setDNSProxyWithParameters:(id)a3 errorStr:(id *)a4
{
  id v6 = a3;
  -[NEUtilConfigurationClient dnsProxyConfiguration](self, "dnsProxyConfiguration");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    [v6 objectForKeyedSubscript:@"vendor-config"];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    int v9 = isa_nsdictionary(v8);

    if (v9)
    {
      [v6 objectForKeyedSubscript:@"vendor-config"];
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 setProviderConfiguration:v10];
    }

    [v6 objectForKeyedSubscript:@"designated-requirement"];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      [v6 objectForKeyedSubscript:@"designated-requirement"];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 stringByRemovingPercentEncoding];
      BOOL v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 setDesignatedRequirement:v13];
    }
  }

  else
  {
    *a4 = @"DNS Proxy plugin type has not been set yet";
  }

  return v7 != 0LL;
}

- (BOOL)unsetDNSProxyWithParameters:(id)a3 errorStr:(id *)a4
{
  id v5 = a3;
  -[NEUtilConfigurationClient dnsProxyConfiguration](self, "dnsProxyConfiguration");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 objectForKeyedSubscript:@"vendor-config"];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  int v8 = isa_nsdictionary(v7);

  if (v8) {
    [v6 setProviderConfiguration:0];
  }
  [v5 objectForKeyedSubscript:@"designated-requirement"];
  int v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9) {
    [v6 setDesignatedRequirement:0];
  }

  return 1;
}

- (BOOL)setCommonParameters:(id)a3 errorStr:(id *)a4
{
  id v6 = a3;
  -[NEUtilConfigurationClient protocolForParameters:](self, "protocolForParameters:", v6);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEUtilConfigurationClient filterConfiguration](self, "filterConfiguration");
  int v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NEUtilConfigurationClient isAlwaysOn](self, "isAlwaysOn"))
  {
    [v6 objectForKeyedSubscript:@"interface-name"];
    int v9 = (void *)objc_claimAutoreleasedReturnValue();
    char v10 = isa_nsstring(v9);

    if ((v10 & 1) == 0)
    {
      BOOL v17 = 0;
      id v18 = @"Missing interface name";
      goto LABEL_9;
    }
  }

  [v6 objectForKeyedSubscript:@"enabled"];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    [v6 objectForKeyedSubscript:@"enabled"];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEUtilConfigurationClient setEnabled:](self, "setEnabled:", [v12 BOOLValue]);
  }

  [v6 objectForKeyedSubscript:@"server-address"];
  BOOL v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    if (v7)
    {
      [v6 objectForKeyedSubscript:@"server-address"];
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 stringByRemovingPercentEncoding];
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      id v16 = v7;
    }

    else
    {
      if (!v8) {
        goto LABEL_13;
      }
      [v6 objectForKeyedSubscript:@"server-address"];
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 stringByRemovingPercentEncoding];
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      id v16 = v8;
    }

    [v16 setServerAddress:v15];
  }

- (BOOL)setPasswordWithParameters:(id)a3 errorStr:(id *)a4
{
  id v5 = a3;
  -[NEUtilConfigurationClient protocolForParameters:](self, "protocolForParameters:", v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 objectForKeyedSubscript:@"password"];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    [v6 passwordKeychainItem];
    int v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      [v5 objectForKeyedSubscript:@"password"];
      int v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 passwordKeychainItem];
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      [v10 setPassword:v9];
    }

    else
    {
      id v11 = objc_alloc(&OBJC_CLASS___NEKeychainItem);
      [v5 objectForKeyedSubscript:@"password"];
      int v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        uint64_t v13 = v6[10];
        id Property = objc_getProperty(v6, v12, 88LL, 1);
      }

      else
      {
        uint64_t v13 = 0LL;
        id Property = 0LL;
      }

      id v10 = Property;
      id v15 = -[NEKeychainItem initWithPassword:domain:accessGroup:]( v11,  "initWithPassword:domain:accessGroup:",  v9,  v13,  v10);
      [v6 setPasswordKeychainItem:v15];
    }
  }

  return 1;
}

- (BOOL)setProviderTypeWithParameters:(id)a3 errorStr:(id *)a4
{
  id v6 = a3;
  -[NEUtilConfigurationClient protocolForParameters:](self, "protocolForParameters:", v6);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 objectForKeyedSubscript:@"provider-type"];
  int v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
LABEL_16:
    BOOL v20 = 1;
    goto LABEL_17;
  }

  if (self) {
    id Property = objc_getProperty(self, v9, 56LL, 1);
  }
  else {
    id Property = 0LL;
  }
  uint64_t v11 = [Property appVPN];
  if (v11)
  {
    id v12 = (void *)v11;
    uint64_t v13 = [v7 type];

    if (v13 == 4)
    {
      [v6 objectForKeyedSubscript:@"provider-type"];
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v14 isEqualToString:@"app-proxy"])
      {
        if (self) {
          id v16 = objc_getProperty(self, v15, 56LL, 1);
        }
        else {
          id v16 = 0LL;
        }
        [v16 appVPN];
        BOOL v17 = (void *)objc_claimAutoreleasedReturnValue();
        id v18 = v17;
        uint64_t v19 = 2LL;
      }

      else
      {
        if (![v14 isEqualToString:@"packet-tunnel"])
        {
          [NSString stringWithFormat:@"Invalid %@, must be either \"app-proxy\" or \"packet-tunnel\", @"provider-type""];
          *a4 = (id)objc_claimAutoreleasedReturnValue();

          BOOL v20 = 0;
          goto LABEL_17;
        }

        if (self) {
          id v22 = objc_getProperty(self, v21, 56LL, 1);
        }
        else {
          id v22 = 0LL;
        }
        [v22 appVPN];
        BOOL v17 = (void *)objc_claimAutoreleasedReturnValue();
        id v18 = v17;
        uint64_t v19 = 1LL;
      }

      [v17 setTunnelType:v19];

      goto LABEL_16;
    }
  }

  [NSString stringWithFormat:@"Provider type can only be set for plugin-based per-app VPN configurations"];
  BOOL v20 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:

  return v20;
}

- (BOOL)unsetCommonParameters:(id)a3 errorStr:(id *)a4
{
  id v6 = a3;
  -[NEUtilConfigurationClient protocolForParameters:](self, "protocolForParameters:", v6);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NEUtilConfigurationClient isAlwaysOn](self, "isAlwaysOn"))
  {
    [v6 objectForKeyedSubscript:@"enabled"];
    int v8 = (void *)objc_claimAutoreleasedReturnValue();
    char v9 = isa_nsstring(v8);

    if ((v9 & 1) == 0)
    {
      BOOL v26 = 0;
      uint64_t v27 = @"Missing interface name";
      goto LABEL_46;
    }
  }

  if (!v7)
  {
    BOOL v26 = 0;
    uint64_t v27 = @"Missing protocol";
    goto LABEL_46;
  }

  [v6 objectForKeyedSubscript:@"enabled"];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10) {
    -[NEUtilConfigurationClient setEnabled:](self, "setEnabled:", 0LL);
  }
  [v6 objectForKeyedSubscript:@"server-address"];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11) {
    [v7 setServerAddress:0];
  }
  [v6 objectForKeyedSubscript:@"username"];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12) {
    [v7 setUsername:0];
  }
  if (!-[NEUtilConfigurationClient unsetPasswordWithParameters:errorStr:]( self,  "unsetPasswordWithParameters:errorStr:",  v6,  a4))
  {
    BOOL v26 = 0;
    goto LABEL_47;
  }

  [v6 objectForKeyedSubscript:@"disconnect-on-idle-timeout"];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13) {
    [v7 setDisconnectOnIdleTimeout:0];
  }
  [v6 objectForKeyedSubscript:@"disconnect-on-sleep"];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14) {
    [v7 setDisconnectOnSleep:0];
  }
  [v6 objectForKeyedSubscript:@"identity"];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15) {
    [v7 setIdentityReferenceInternal:0];
  }
  [v6 objectForKeyedSubscript:@"provider-bundle-identifier"];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v26 = 0;
      uint64_t v27 = @"provider-bundle-identifier can only be specified for provider-based configurations";
      goto LABEL_46;
    }

    [v7 setProviderBundleIdentifier:0];
  }

  [v6 objectForKeyedSubscript:@"designated-requirement"];
  BOOL v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      [v7 setDesignatedRequirement:0];
      goto LABEL_24;
    }

    BOOL v26 = 0;
    uint64_t v27 = @"designated-requirement can only be specified for provider-based configurations";
LABEL_46:
    *a4 = v27;
    goto LABEL_47;
  }

- (BOOL)unsetPasswordWithParameters:(id)a3 errorStr:(id *)a4
{
  id v5 = a3;
  -[NEUtilConfigurationClient protocolForParameters:](self, "protocolForParameters:", v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 objectForKeyedSubscript:@"password"];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    [v6 passwordKeychainItem];
    int v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      [v6 passwordKeychainItem];
      char v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 setIdentifier:0];
    }
  }

  return 1;
}

- (BOOL)setIPSecParameters:(id)a3 errorStr:(id *)a4
{
  id v6 = a3;
  -[NEUtilConfigurationClient protocolForParameters:](self, "protocolForParameters:", v6);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NEUtilConfigurationClient isAlwaysOn](self, "isAlwaysOn"))
  {
    [v6 objectForKeyedSubscript:@"interface-name"];
    int v8 = (void *)objc_claimAutoreleasedReturnValue();
    char v9 = isa_nsstring(v8);

    if ((v9 & 1) == 0)
    {
      BOOL v13 = 0;
      uint64_t v14 = @"Missing interface name";
      goto LABEL_10;
    }
  }

  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    BOOL v13 = 0;
    uint64_t v14 = @"Configuration VPN type is not IPSec";
LABEL_10:
    *a4 = v14;
    goto LABEL_11;
  }

  [v6 objectForKeyedSubscript:@"authentication-method"];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    [v6 objectForKeyedSubscript:@"authentication-method"];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v11 isEqualToString:@"none"])
    {
      uint64_t v12 = 0LL;
    }

    else if ([v11 isEqualToString:@"certificate"])
    {
      uint64_t v12 = 1LL;
    }

    else
    {
      if (([v11 isEqualToString:@"shared-secret"] & 1) == 0)
      {
        [NSString stringWithFormat:@"Invalid %@, valid values are \"none\", \"certificate\", and \"shared-secret\", @"authentication-method""];
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_84;
      }

      uint64_t v12 = 2LL;
    }

    [v7 setAuthenticationMethod:v12];
  }

  if (!-[NEUtilConfigurationClient setSharedSecretWithParameters:errorStr:]( self,  "setSharedSecretWithParameters:errorStr:",  v6,  a4))
  {
LABEL_84:
    BOOL v13 = 0;
    goto LABEL_11;
  }

  [v6 objectForKeyedSubscript:@"certificate-type"];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16 && [v7 type] == 5)
  {
    [v6 objectForKeyedSubscript:@"certificate-type"];
    BOOL v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v17 isEqualToString:@"RSA"])
    {
      uint64_t v18 = 1LL;
    }

    else if ([v17 isEqualToString:@"ECDSA256"])
    {
      uint64_t v18 = 2LL;
    }

    else if ([v17 isEqualToString:@"ECDSA384"])
    {
      uint64_t v18 = 3LL;
    }

    else if ([v17 isEqualToString:@"ECDSA521"])
    {
      uint64_t v18 = 4LL;
    }

    else
    {
      if (([v17 isEqualToString:@"Ed25519"] & 1) == 0)
      {
        [NSString stringWithFormat:@"Invalid %@, valid values are \"RSA\", \"ECDSA256\", \"ECDSA384\", \"ECDSA521\", and \"Ed25519\", @"certificate-type"", v87, v88, v89, v90, v91, v92, v93];
        goto LABEL_83;
      }

      uint64_t v18 = 5LL;
    }

    [v7 setCertificateType:v18];
  }

  [v6 objectForKeyedSubscript:@"use-internal-ip-subnet"];
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19 && [v7 type] == 5)
  {
    [v6 objectForKeyedSubscript:@"use-internal-ip-subnet"];
    BOOL v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setUseConfigurationAttributeInternalIPSubnet:", objc_msgSend(v20, "BOOLValue"));
  }

  [v6 objectForKeyedSubscript:@"disable-mobike"];
  int v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21 && [v7 type] == 5)
  {
    [v6 objectForKeyedSubscript:@"disable-mobike"];
    id v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDisableMOBIKE:", objc_msgSend(v22, "BOOLValue"));
  }

  [v6 objectForKeyedSubscript:@"disable-redirect"];
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23 && [v7 type] == 5)
  {
    [v6 objectForKeyedSubscript:@"disable-redirect"];
    id v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDisableRedirect:", objc_msgSend(v24, "BOOLValue"));
  }

  [v6 objectForKeyedSubscript:@"enable-pfs"];
  id v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25 && [v7 type] == 5)
  {
    [v6 objectForKeyedSubscript:@"enable-pfs"];
    BOOL v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEnablePFS:", objc_msgSend(v26, "BOOLValue"));
  }

  [v6 objectForKeyedSubscript:@"enable-revocation-check"];
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    if ([v7 type] == 5)
    {
      [v6 objectForKeyedSubscript:@"enable-revocation-check"];
      id v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setEnableRevocationCheck:", objc_msgSend(v28, "BOOLValue"));

      if (([v7 enableRevocationCheck] & 1) == 0) {
        [v7 setStrictRevocationCheck:0];
      }
    }
  }

  [v6 objectForKeyedSubscript:@"strict-revocation-check"];
  id v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29 && [v7 type] == 5 && objc_msgSend(v7, "enableRevocationCheck"))
  {
    [v6 objectForKeyedSubscript:@"strict-revocation-check"];
    id v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setStrictRevocationCheck:", objc_msgSend(v30, "BOOLValue"));
  }

  [v6 objectForKeyedSubscript:@"tls-minimum-version"];
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31 && [v7 type] == 5)
  {
    uint64_t v32 = @"tls-minimum-version";
    [v6 objectForKeyedSubscript:@"tls-minimum-version"];
    BOOL v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v17 isEqualToString:@"1.0"])
    {
      uint64_t v33 = 1LL;
    }

    else if ([v17 isEqualToString:@"1.1"])
    {
      uint64_t v33 = 2LL;
    }

    else
    {
      if (([v17 isEqualToString:@"1.2"] & 1) == 0) {
        goto LABEL_82;
      }
      uint64_t v33 = 3LL;
    }

    [v7 setMinimumTLSVersion:v33];
  }

  [v6 objectForKeyedSubscript:@"tls-maximum-version"];
  BOOL v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34 && [v7 type] == 5)
  {
    uint64_t v32 = @"tls-maximum-version";
    [v6 objectForKeyedSubscript:@"tls-maximum-version"];
    BOOL v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v17 isEqualToString:@"1.0"])
    {
      uint64_t v35 = 1LL;
LABEL_69:
      [v7 setMaximumTLSVersion:v35];

      goto LABEL_70;
    }

    if ([v17 isEqualToString:@"1.1"])
    {
      uint64_t v35 = 2LL;
      goto LABEL_69;
    }

    if ([v17 isEqualToString:@"1.2"])
    {
      uint64_t v35 = 3LL;
      goto LABEL_69;
    }

- (BOOL)setSharedSecretWithParameters:(id)a3 errorStr:(id *)a4
{
  id v5 = a3;
  -[NEUtilConfigurationClient protocolForParameters:](self, "protocolForParameters:", v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 objectForKeyedSubscript:@"shared-secret"];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    [v6 sharedSecretKeychainItem];
    int v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      [v5 objectForKeyedSubscript:@"shared-secret"];
      char v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 sharedSecretKeychainItem];
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      [v10 setPassword:v9];
    }

    else
    {
      uint64_t v11 = objc_alloc(&OBJC_CLASS___NEKeychainItem);
      [v5 objectForKeyedSubscript:@"shared-secret"];
      char v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        uint64_t v13 = v6[10];
        id Property = objc_getProperty(v6, v12, 88LL, 1);
      }

      else
      {
        uint64_t v13 = 0LL;
        id Property = 0LL;
      }

      id v10 = Property;
      id v15 = -[NEKeychainItem initWithPassword:domain:accessGroup:]( v11,  "initWithPassword:domain:accessGroup:",  v9,  v13,  v10);
      [v6 setSharedSecretKeychainItem:v15];
    }
  }

  return 1;
}

- (BOOL)unsetIPSecParameters:(id)a3 errorStr:(id *)a4
{
  id v6 = a3;
  -[NEUtilConfigurationClient protocolForParameters:](self, "protocolForParameters:", v6);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NEUtilConfigurationClient isAlwaysOn](self, "isAlwaysOn"))
  {
    [v6 objectForKeyedSubscript:@"interface-name"];
    int v8 = (void *)objc_claimAutoreleasedReturnValue();
    char v9 = isa_nsstring(v8);

    if ((v9 & 1) == 0)
    {
      BOOL v17 = 0;
      uint64_t v18 = @"Missing interface name";
      goto LABEL_27;
    }
  }

  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    BOOL v17 = 0;
    uint64_t v18 = @"Configuration VPN type is not IPSec";
LABEL_27:
    *a4 = v18;
    goto LABEL_28;
  }

  [v6 objectForKeyedSubscript:@"authentication-method"];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10) {
    [v7 setAuthenticationMethod:0];
  }
  [v6 objectForKeyedSubscript:@"certificate-type"];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 && [v7 type] == 5) {
    [v7 setCertificateType:1];
  }
  [v6 objectForKeyedSubscript:@"use-internal-ip-subnet"];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 && [v7 type] == 5) {
    [v7 setUseConfigurationAttributeInternalIPSubnet:0];
  }
  [v6 objectForKeyedSubscript:@"disable-mobike"];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13 && [v7 type] == 5) {
    [v7 setDisableMOBIKE:0];
  }
  [v6 objectForKeyedSubscript:@"disable-redirect"];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14 && [v7 type] == 5) {
    [v7 setDisableRedirect:0];
  }
  [v6 objectForKeyedSubscript:@"enable-pfs"];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15 && [v7 type] == 5) {
    [v7 setEnablePFS:0];
  }
  [v6 objectForKeyedSubscript:@"enable-revocation-check"];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    if ([v7 type] == 5)
    {
      [v7 setEnableRevocationCheck:0];
LABEL_31:
      [v7 setStrictRevocationCheck:0];
    }
  }

  else
  {
    [v6 objectForKeyedSubscript:@"strict-revocation-check"];
    BOOL v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20 && [v7 type] == 5) {
      goto LABEL_31;
    }
  }

  [v6 objectForKeyedSubscript:@"tls-minimum-version"];
  int v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21 && [v7 type] == 5) {
    [v7 setMinimumTLSVersion:0];
  }
  [v6 objectForKeyedSubscript:@"tls-maximum-version"];
  id v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22 && [v7 type] == 5) {
    [v7 setMaximumTLSVersion:0];
  }
  if (!-[NEUtilConfigurationClient unsetSharedSecretWithParameters:errorStr:]( self,  "unsetSharedSecretWithParameters:errorStr:",  v6,  a4))
  {
    BOOL v17 = 0;
    goto LABEL_28;
  }

  [v6 objectForKeyedSubscript:@"local-identifier"];
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23) {
    [v7 setLocalIdentifier:0];
  }
  [v6 objectForKeyedSubscript:@"remote-identifier"];
  id v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24) {
    [v7 setRemoteIdentifier:0];
  }
  [v6 objectForKeyedSubscript:@"use-extended-authentication"];
  id v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25) {
    [v7 setUseExtendedAuthentication:0];
  }
  BOOL v26 = @"dead-peer-detection-rate";
  [v6 objectForKeyedSubscript:@"dead-peer-detection-rate"];
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    if ([v7 type] != 5) {
      goto LABEL_83;
    }
    [v7 setDeadPeerDetectionRate:0];
  }

  [v6 objectForKeyedSubscript:@"server-CA-name"];
  id v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28 && [v7 type] == 5) {
    [v7 setServerCertificateIssuerCommonName:0];
  }
  [v6 objectForKeyedSubscript:@"server-cert-name"];
  id v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29 && [v7 type] == 5) {
    [v7 setServerCertificateCommonName:0];
  }
  BOOL v26 = @"encryption-algorithm";
  [v6 objectForKeyedSubscript:@"encryption-algorithm"];
  id v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    if ([v7 type] != 5) {
      goto LABEL_83;
    }
    [v7 IKESecurityAssociationParameters];
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    [v31 setEncryptionAlgorithm:4];
  }

  BOOL v26 = @"integrity-algorithm";
  [v6 objectForKeyedSubscript:@"integrity-algorithm"];
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    if ([v7 type] != 5) {
      goto LABEL_83;
    }
    [v7 IKESecurityAssociationParameters];
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
    [v33 setIntegrityAlgorithm:3];
  }

  BOOL v26 = @"diffie-hellman-group";
  [v6 objectForKeyedSubscript:@"diffie-hellman-group"];
  BOOL v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    if ([v7 type] != 5) {
      goto LABEL_83;
    }
    [v7 IKESecurityAssociationParameters];
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
    [v35 setDiffieHellmanGroup:14];
  }

  BOOL v26 = @"life-time";
  [v6 objectForKeyedSubscript:@"life-time"];
  unint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    if ([v7 type] != 5) {
      goto LABEL_83;
    }
    [v7 IKESecurityAssociationParameters];
    id v37 = (void *)objc_claimAutoreleasedReturnValue();
    [v37 setLifetimeMinutes:10];
  }

  BOOL v26 = @"child-encryption-algorithm";
  [v6 objectForKeyedSubscript:@"child-encryption-algorithm"];
  id v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    if ([v7 type] != 5) {
      goto LABEL_83;
    }
    [v7 childSecurityAssociationParameters];
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    [v39 setEncryptionAlgorithm:4];
  }

  BOOL v26 = @"child-integrity-algorithm";
  [v6 objectForKeyedSubscript:@"child-integrity-algorithm"];
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    if ([v7 type] != 5) {
      goto LABEL_83;
    }
    [v7 childSecurityAssociationParameters];
    unint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
    [v41 setIntegrityAlgorithm:3];
  }

  BOOL v26 = @"child-diffie-hellman-group";
  [v6 objectForKeyedSubscript:@"child-diffie-hellman-group"];
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    if ([v7 type] != 5) {
      goto LABEL_83;
    }
    [v7 childSecurityAssociationParameters];
    id v43 = (void *)objc_claimAutoreleasedReturnValue();
    [v43 setDiffieHellmanGroup:14];
  }

  BOOL v26 = @"child-life-time";
  [v6 objectForKeyedSubscript:@"child-life-time"];
  uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v44) {
    goto LABEL_78;
  }
  if ([v7 type] != 5)
  {
LABEL_83:
    [NSString stringWithFormat:@"%@ is only available for the IKEv2 protocol", v26];
    BOOL v17 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }

  [v7 childSecurityAssociationParameters];
  uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();
  [v45 setLifetimeMinutes:10];

LABEL_78:
  [v6 objectForKeyedSubscript:@"enable-fallback"];
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46 && [v7 type] == 5) {
    [v7 setEnableFallback:0];
  }
  BOOL v17 = 1;
LABEL_28:

  return v17;
}

- (BOOL)unsetSharedSecretWithParameters:(id)a3 errorStr:(id *)a4
{
  id v5 = a3;
  -[NEUtilConfigurationClient protocolForParameters:](self, "protocolForParameters:", v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 objectForKeyedSubscript:@"shared-secret"];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    [v6 sharedSecretKeychainItem];
    int v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      [v6 sharedSecretKeychainItem];
      char v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 setIdentifier:0];
    }
  }

  return 1;
}

- (BOOL)addOnDemandRuleWithParameters:(id)a3 errorStr:(id *)a4
{
  v42[1] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  [v6 objectForKeyedSubscript:@"action"];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v7 isEqualToString:@"connect"])
  {
    int v8 = off_18A087D98;
  }

  else if ([v7 isEqualToString:@"disconnect"])
  {
    int v8 = off_18A087DA0;
  }

  else if ([v7 isEqualToString:@"ignore"])
  {
    int v8 = off_18A087DB0;
  }

  else
  {
    if (([v7 isEqualToString:@"evaluateconnection"] & 1) == 0)
    {
      BOOL v38 = 0;
      *a4 = @"Invalid action";
      goto LABEL_36;
    }

    int v8 = off_18A087DA8;
  }

  id v9 = objc_alloc_init(*v8);
  [v6 objectForKeyedSubscript:@"dns-search-domain-match"];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  uint64_t v12 = [v6 objectForKeyedSubscript:@"dns-search-domain-match"];
  uint64_t v13 = (void *)v12;
  if ((isKindOfClass & 1) != 0)
  {
    v42[0] = v12;
    [MEMORY[0x189603F18] arrayWithObjects:v42 count:1];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 setDNSSearchDomainMatch:v14];
  }

  else
  {
    [v9 setDNSSearchDomainMatch:v12];
  }

  [v6 objectForKeyedSubscript:@"dns-server-match"];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  char v16 = objc_opt_isKindOfClass();

  uint64_t v17 = [v6 objectForKeyedSubscript:@"dns-server-match"];
  uint64_t v18 = (void *)v17;
  if ((v16 & 1) != 0)
  {
    uint64_t v41 = v17;
    [MEMORY[0x189603F18] arrayWithObjects:&v41 count:1];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 setDNSServerAddressMatch:v19];
  }

  else
  {
    [v9 setDNSServerAddressMatch:v17];
  }

  [v6 objectForKeyedSubscript:@"interface-type"];
  BOOL v20 = (void *)objc_claimAutoreleasedReturnValue();
  int v21 = v20;
  if (v20 && ([v20 isEqualToString:@"ethernet"] & 1) == 0)
  {
    if ([v21 isEqualToString:@"cellular"])
    {
      uint64_t v22 = 3LL;
LABEL_21:
      [v9 setInterfaceTypeMatch:v22];
      goto LABEL_22;
    }

    if ([v21 isEqualToString:@"wifi"])
    {
      uint64_t v22 = 2LL;
      goto LABEL_21;
    }
  }

- (BOOL)removeOnDemandRuleWithParameters:(id)a3 errorStr:(id *)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v7 = [v6 integerValue];
  -[NEUtilConfigurationClient onDemandRules](self, "onDemandRules");
  int v8 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v9 = [v8 count];

  if (v7 >= v9)
  {
    *a4 = @"No rule present with given index";
  }

  else
  {
    -[NEUtilConfigurationClient onDemandRules](self, "onDemandRules");
    id v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      id v11 = objc_alloc(MEMORY[0x189603FA8]);
      -[NEUtilConfigurationClient onDemandRules](self, "onDemandRules");
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      id v13 = (id)[v11 initWithArray:v12];
    }

    else
    {
      id v13 = objc_alloc_init(MEMORY[0x189603FA8]);
    }

    [v13 removeObjectAtIndex:v7];
    uint64_t v14 = [v13 count];
    if (v14) {
      id v15 = v13;
    }
    else {
      id v15 = 0LL;
    }
    -[NEUtilConfigurationClient setOnDemandEnabled:](self, "setOnDemandEnabled:", v14 != 0);
    -[NEUtilConfigurationClient setOnDemandRules:](self, "setOnDemandRules:", v15);
  }

  return v7 < v9;
}

- (BOOL)setDNSParameters:(id)a3 errorStr:(id *)a4
{
  v33[1] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  uint64_t v7 = -[NEUtilConfigurationClient protocolForParameters:](self, "protocolForParameters:", v6);
  uint64_t v8 = -[NEUtilConfigurationClient dnsSettingsBundle](self, "dnsSettingsBundle");
  BOOL v9 = (v8 | v7) != 0;
  if (v8 | v7)
  {
    [v6 objectForKeyedSubscript:@"protocol"];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 objectForKeyedSubscript:@"servers"];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    id v30 = v10;
    if (v11)
    {
      uint64_t v12 = v11;
      if (isa_nsstring(v11))
      {
        v33[0] = v12;
        uint64_t v13 = [MEMORY[0x189603F18] arrayWithObjects:v33 count:1];

        uint64_t v12 = (void *)v13;
      }

      if ([v10 isEqualToString:@"tls"])
      {
        uint64_t v14 = &OBJC_CLASS___NEDNSOverTLSSettings;
      }

      else if ([v10 isEqualToString:@"https"])
      {
        uint64_t v14 = &OBJC_CLASS___NEDNSOverHTTPSSettings;
      }

      else
      {
        uint64_t v14 = &OBJC_CLASS___NEDNSSettings;
      }

      id v16 = (id)[[v14 alloc] initWithServers:v12];
    }

    else
    {
      if ([v10 isEqualToString:@"tls"])
      {
        id v15 = &OBJC_CLASS___NEDNSOverTLSSettings;
      }

      else if ([v10 isEqualToString:@"https"])
      {
        id v15 = &OBJC_CLASS___NEDNSOverHTTPSSettings;
      }

      else
      {
        id v15 = &OBJC_CLASS___NEDNSSettings;
      }

      id v16 = objc_alloc_init(v15);
      uint64_t v12 = 0LL;
    }

    [v6 objectForKeyedSubscript:@"search-domains"];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = v17;
    if (v17)
    {
      if (isa_nsarray(v17))
      {
        [v16 setSearchDomains:v18];
      }

      else if (isa_nsstring(v18))
      {
        id v32 = v18;
        [MEMORY[0x189603F18] arrayWithObjects:&v32 count:1];
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
        [v16 setSearchDomains:v19];
      }
    }

    [v6 objectForKeyedSubscript:@"match-domains"];
    BOOL v20 = (void *)objc_claimAutoreleasedReturnValue();
    int v21 = v20;
    if (v20)
    {
      if (isa_nsarray(v20))
      {
        [v16 setMatchDomains:v21];
      }

      else if (isa_nsstring(v21))
      {
        v31 = v21;
        [MEMORY[0x189603F18] arrayWithObjects:&v31 count:1];
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
        [v16 setMatchDomains:v22];
      }
    }

    [v6 objectForKeyedSubscript:@"domain-name"];
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 objectForKeyedSubscript:@"server-name"];
    char v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (isa_nsstring(v24))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0) {
        [v16 setServerName:v24];
      }
    }

    [v6 objectForKeyedSubscript:@"url-path"];
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (isa_nsstring(v24))
    {
      if (isa_nsstring(v25))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          uint64_t v27 = (void *)MEMORY[0x189604030];
          [NSString stringWithFormat:@"https://%@%@", v24, v25];
          id v29 = (void *)objc_claimAutoreleasedReturnValue();
          [v27 URLWithString:v29];
          id v28 = (void *)objc_claimAutoreleasedReturnValue();
          [v16 setServerURL:v28];
        }
      }
    }

    if (v8)
    {
      [(id)v8 setSettings:v16];
    }

    else if (v7)
    {
      [(id)v7 setDNSSettings:v16];
    }

    BOOL v9 = (v8 | v7) != 0;
  }

  else
  {
    *a4 = @"Missing DNS settings or VPN protocol";
  }

  return v9;
}

- (BOOL)unsetDNSParameters:(id)a3 errorStr:(id *)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEUtilConfigurationClient dnsSettingsBundle](self, "dnsSettingsBundle");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = v7;
  if (v7)
  {
    [v7 setSettings:0];
  }

  else
  {
    if (!v6)
    {
      BOOL v9 = 0;
      *a4 = @"Missing DNS settings or VPN protocol";
      goto LABEL_6;
    }

    [v6 setDNSSettings:0];
  }

  BOOL v9 = 1;
LABEL_6:

  return v9;
}

- (BOOL)setAppPushParameters:(id)a3 errorStr:(id *)a4
{
  v17[1] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  -[NEUtilConfigurationClient appPush](self, "appPush");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    [v6 objectForKeyedSubscript:@"match-ssids"];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v9 = v8;
    if (v8)
    {
      if (isa_nsarray(v8))
      {
        [v7 setMatchSSIDs:v9];
      }

      else if (isa_nsstring(v9))
      {
        v17[0] = v9;
        [MEMORY[0x189603F18] arrayWithObjects:v17 count:1];
        id v11 = (void *)objc_claimAutoreleasedReturnValue();
        [v7 setMatchSSIDs:v11];
      }

      [v6 objectForKeyedSubscript:@"vendor-config"];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v13 = v12;
      if (v12 && isa_nsdictionary(v12))
      {
        [v6 objectForKeyedSubscript:@"vendor-config"];
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
        [v7 setProviderConfiguration:v14];

        [v6 objectForKeyedSubscript:@"plugin-type"];
        id v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15) {
          [v7 setPluginType:v15];
        }

        BOOL v10 = 1;
      }

      else
      {
        BOOL v10 = 0;
        *a4 = @"Missing app push provider configuration dictionary";
      }
    }

    else
    {
      BOOL v10 = 0;
      *a4 = @"Missing matching SSIDs in the input parameters";
    }
  }

  else
  {
    BOOL v10 = 0;
    *a4 = @"Missing app push provider configuration";
  }

  return v10;
}

- (BOOL)unsetAppPushParameters:(id)a3 errorStr:(id *)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NEUtilConfigurationClient appPush](self, "appPush");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 setMatchSSIDs:0];

    -[NEUtilConfigurationClient appPush](self, "appPush");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 setProviderConfiguration:0];

    -[NEUtilConfigurationClient appPush](self, "appPush");
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 setPluginType:0];
  }

  else
  {
    *a4 = @"Missing app push provider configuration";
  }

  return v6 != 0LL;
}

- (BOOL)addRelayWithParameters:(id)a3 errorStr:(id *)a4
{
  v48[1] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  -[NEUtilConfigurationClient relayConfiguration](self, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    uint64_t v45 = a4;
    BOOL v9 = objc_alloc_init(&OBJC_CLASS___NERelay);
    [v6 objectForKeyedSubscript:@"http3-url"];
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v10 stringByRemovingPercentEncoding];

    if (v11)
    {
      [MEMORY[0x189604030] URLWithString:v11];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NERelay setHTTP3RelayURL:](v9, "setHTTP3RelayURL:", v12);
    }

    id v47 = (void *)v11;
    [v6 objectForKeyedSubscript:@"http2-url"];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v13 stringByRemovingPercentEncoding];

    if (v14)
    {
      [MEMORY[0x189604030] URLWithString:v14];
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NERelay setHTTP2RelayURL:](v9, "setHTTP2RelayURL:", v15);
    }

    v46 = (void *)v14;
    [v6 objectForKeyedSubscript:@"doh-url"];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 stringByRemovingPercentEncoding];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      [MEMORY[0x189604030] URLWithString:v17];
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NERelay setDnsOverHTTPSURL:](v9, "setDnsOverHTTPSURL:", v18);
    }

    [v6 objectForKeyedSubscript:@"raw-public-key"];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 stringByRemovingPercentEncoding];
    BOOL v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      dispatch_data_t v21 = dispatch_data_create((const void *)[v20 UTF8String], objc_msgSend(v20, "length"), 0, 0);
      uint64_t v22 = (void *)dispatch_data_create_with_transform();

      if (v22)
      {
        v48[0] = v22;
        [MEMORY[0x189603F18] arrayWithObjects:v48 count:1];
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[NERelay setRawPublicKeys:](v9, "setRawPublicKeys:", v23);
      }
    }

    else
    {
      uint64_t v22 = 0LL;
    }

    [v6 objectForKeyedSubscript:@"identity"];
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      [v6 objectForKeyedSubscript:@"identity"];
      BOOL v26 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t v27 = [v26 integerValue];

      if (!self
        || (id v29 = objc_getProperty(self, v28, 48LL, 1)) == 0LL
        || (v31 = v29, unint64_t v32 = objc_msgSend(objc_getProperty(self, v30, 48, 1), "count"), v31, v27 >= v32))
      {
        [NSString stringWithFormat:@"Invalid %@ index, use the list-identities command to obtain a list of available identities and their indicies", @"identity"];
        BOOL v24 = 0;
        *uint64_t v45 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_27;
      }

      objc_msgSend(objc_getProperty(self, v33, 48, 1), "objectAtIndexedSubscript:", v27);
      id v34 = (void *)objc_claimAutoreleasedReturnValue();
      [v34 objectForKeyedSubscript:@"domain"];
      uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v36 = [v35 integerValue];

      if (v36)
      {
        [NSString stringWithFormat:@"Invalid %@, an identity in the %s keychain is required", @"identity", "system"];
        *uint64_t v45 = (id)objc_claimAutoreleasedReturnValue();

        BOOL v24 = 0;
LABEL_27:

        goto LABEL_28;
      }

      [v34 objectForKeyedSubscript:@"persistent-reference"];
      unint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[NERelay setIdentityReference:](v9, "setIdentityReference:", v37);
    }

    id v38 = objc_alloc(MEMORY[0x189603FA8]);
    [v8 relays];
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v40 = (void *)[v38 initWithArray:v39];

    [v6 objectForKeyedSubscript:@"index"];
    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v42 = [v40 count];
    if (v41) {
      unint64_t v42 = [v41 integerValue];
    }
    unint64_t v43 = v42;
    if (v42 >= [v40 count]) {
      [v40 addObject:v9];
    }
    else {
      [v40 insertObject:v9 atIndex:v43];
    }
    [v8 setRelays:v40];

    BOOL v24 = 1;
    goto LABEL_27;
  }

  BOOL v24 = 0;
  *a4 = @"Missing relay configuration";
LABEL_28:

  return v24;
}

- (BOOL)removeRelayWithParameters:(id)a3 errorStr:(id *)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v7 = [v6 integerValue];
  -[NEUtilConfigurationClient relayConfiguration](self, v8);
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v10 = v9;
  if (!v9)
  {
    BOOL v16 = 0;
    uint64_t v17 = @"Missing relay configuration";
LABEL_6:
    *a4 = v17;
    goto LABEL_7;
  }

  [v9 relays];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v12 = [v11 count];

  if (v7 >= v12)
  {
    BOOL v16 = 0;
    uint64_t v17 = @"No relay configuration present with given index";
    goto LABEL_6;
  }

  id v13 = objc_alloc(MEMORY[0x189603FA8]);
  [v10 relays];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  id v15 = (void *)[v13 initWithArray:v14];

  [v15 removeObjectAtIndex:v7];
  [v10 setRelays:v15];

  BOOL v16 = 1;
LABEL_7:

  return v16;
}

- (BOOL)setRelayConditionsWithParameters:(id)a3 errorStr:(id *)a4
{
  v15[1] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  -[NEUtilConfigurationClient relayConfiguration](self, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    [v6 objectForKeyedSubscript:@"match-domains"];
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (isa_nsarray(v9))
    {
      [v8 setMatchDomains:v9];
    }

    else if (isa_nsstring(v9))
    {
      v15[0] = v9;
      [MEMORY[0x189603F18] arrayWithObjects:v15 count:1];
      BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 setMatchDomains:v10];
    }

    [v6 objectForKeyedSubscript:@"excluded-domains"];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (isa_nsarray(v11))
    {
      [v8 setExcludedDomains:v11];
    }

    else if (isa_nsstring(v11))
    {
      uint64_t v14 = v11;
      [MEMORY[0x189603F18] arrayWithObjects:&v14 count:1];
      unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 setExcludedDomains:v12];
    }
  }

  else
  {
    *a4 = @"Missing relay configuration";
  }

  return v8 != 0LL;
}

- (BOOL)unsetRelayConditionsWithParameters:(id)a3 errorStr:(id *)a4
{
  id v6 = a3;
  -[NEUtilConfigurationClient relayConfiguration](self, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    [v6 objectForKeyedSubscript:@"match-domains"];
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9) {
      [v8 setMatchDomains:0];
    }
    [v6 objectForKeyedSubscript:@"excluded-domains"];
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10) {
      [v8 setExcludedDomains:0];
    }
  }

  else
  {
    *a4 = @"Missing relay configuration";
  }

  return v8 != 0LL;
}

- (BOOL)setProxyParameters:(id)a3 errorStr:(id *)a4
{
  v31[1] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  -[NEUtilConfigurationClient protocolForParameters:](self, "protocolForParameters:", v6);
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = v7;
  if (!v7)
  {
    *a4 = @"Missing protocol";
    goto LABEL_24;
  }

  [v7 proxySettings];
  BOOL v9 = (NEProxySettings *)objc_claimAutoreleasedReturnValue();
  if (!v9) {
    BOOL v9 = objc_alloc_init(&OBJC_CLASS___NEProxySettings);
  }
  [v6 objectForKeyedSubscript:@"auto-proxy-discovery"];
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    [v6 objectForKeyedSubscript:@"auto-proxy-discovery"];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEProxySettings setAutoProxyDiscovery:](v9, "setAutoProxyDiscovery:", [v11 BOOLValue]);
  }

  [v6 objectForKeyedSubscript:@"auto-config-url"];
  unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[NEProxySettings setAutoProxyConfigurationEnabled:](v9, "setAutoProxyConfigurationEnabled:", 1LL);
    id v13 = (void *)MEMORY[0x189604030];
    [v6 objectForKeyedSubscript:@"auto-config-url"];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 URLWithString:v14];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEProxySettings setProxyAutoConfigurationURL:](v9, "setProxyAutoConfigurationURL:", v15);
  }

  [v6 objectForKeyedSubscript:@"exclude-simple-hostnames"];
  BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    [v6 objectForKeyedSubscript:@"exclude-simple-hostnames"];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEProxySettings setExcludeSimpleHostnames:](v9, "setExcludeSimpleHostnames:", [v17 BOOLValue]);
  }

  [v6 objectForKeyedSubscript:@"exception-list"];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    [v6 objectForKeyedSubscript:@"exception-list"];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    int v20 = isa_nsstring(v19);

    [v6 objectForKeyedSubscript:@"exception-list"];
    dispatch_data_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v22 = v21;
    if (v20)
    {
      v31[0] = v21;
      [MEMORY[0x189603F18] arrayWithObjects:v31 count:1];
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEProxySettings setExceptionList:](v9, "setExceptionList:", v23);

LABEL_16:
      goto LABEL_17;
    }

    int v24 = isa_nsarray(v21);

    if (v24)
    {
      [v6 objectForKeyedSubscript:@"exception-list"];
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEProxySettings setExceptionList:](v9, "setExceptionList:", v22);
      goto LABEL_16;
    }
  }

- (BOOL)unsetProxyParameters:(id)a3 errorStr:(id *)a4
{
  id v6 = a3;
  -[NEUtilConfigurationClient protocolForParameters:](self, "protocolForParameters:", v6);
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = v7;
  if (v7)
  {
    [v7 proxySettings];
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      [v6 objectForKeyedSubscript:@"auto-proxy-discovery"];
      BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10) {
        [v9 setAutoProxyDiscovery:0];
      }
      [v6 objectForKeyedSubscript:@"auto-config-url"];
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        [v9 setAutoProxyConfigurationEnabled:0];
        [v9 setProxyAutoConfigURL:0];
      }

      [v6 objectForKeyedSubscript:@"exclude-simple-hostnames"];
      unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12) {
        [v9 setExcludeSimpleHostnames:0];
      }
      [v6 objectForKeyedSubscript:@"exception-list"];
      id v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13) {
        [v9 setExceptionList:0];
      }
      [v6 objectForKeyedSubscript:@"use-passive-ftp"];
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14) {
        [v9 setUsePassiveFTP:0];
      }
      [v6 objectForKeyedSubscript:@"match-domains"];
      id v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15) {
        [v9 setMatchDomains:0];
      }
    }
  }

  else
  {
    BOOL v9 = 0LL;
    *a4 = @"Missing protocol";
  }

  return v8 != 0LL;
}

- (BOOL)setProxyServer:(id)a3 errorStr:(id *)a4
{
  id v6 = a3;
  [v6 objectForKeyedSubscript:@"type"];
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEUtilConfigurationClient protocolForParameters:](self, "protocolForParameters:", v6);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v9 = v8;
  if (!v8)
  {
    BOOL v12 = 0;
    *a4 = @"Missing protocol";
    goto LABEL_35;
  }

  [v8 proxySettings];
  BOOL v10 = (NEProxySettings *)objc_claimAutoreleasedReturnValue();
  if (!v10) {
    BOOL v10 = objc_alloc_init(&OBJC_CLASS___NEProxySettings);
  }
  if ([v7 isEqualToString:@"http"])
  {
    uint64_t v11 = 1LL;
  }

  else if ([v7 isEqualToString:@"https"])
  {
    uint64_t v11 = 2LL;
  }

  else if ([v7 isEqualToString:@"ftp"])
  {
    uint64_t v11 = 3LL;
  }

  else if ([v7 isEqualToString:@"rtsp"])
  {
    uint64_t v11 = 4LL;
  }

  else if ([v7 isEqualToString:@"gopher"])
  {
    uint64_t v11 = 6LL;
  }

  else
  {
    if (([v7 isEqualToString:@"socks"] & 1) == 0)
    {
      [NSString stringWithFormat:@"Invalid proxy type: %@, valid values are \"http\", \"https\", \"ftp\", \"rtsp\", \"gopher\", and \"socks\"", v7];
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_28;
    }

    uint64_t v11 = 5LL;
  }

  id v13 = objc_alloc(&OBJC_CLASS___NEProxyServer);
  [v6 objectForKeyedSubscript:@"address"];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 objectForKeyedSubscript:@"port"];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v16 = -[NEProxyServer initWithType:address:port:]( v13,  "initWithType:address:port:",  v11,  v14,  (int)[v15 intValue]);

  [v6 objectForKeyedSubscript:@"authentication-required"];
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    [v6 objectForKeyedSubscript:@"authentication-required"];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEProxyServer setAuthenticationRequired:](v16, "setAuthenticationRequired:", [v18 BOOLValue]);
  }

  if (!-[NEProxyServer authenticationRequired](v16, "authenticationRequired")) {
    goto LABEL_23;
  }
  [v6 objectForKeyedSubscript:@"username"];
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    uint64_t v23 = @"Authentication is required, but username is missing";
LABEL_27:
    *a4 = v23;

LABEL_28:
    BOOL v12 = 0;
    goto LABEL_35;
  }

  [v6 objectForKeyedSubscript:@"username"];
  int v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEProxyServer setUsername:](v16, "setUsername:", v20);

  [v6 objectForKeyedSubscript:@"password"];
  dispatch_data_t v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
    uint64_t v23 = @"Authentication is required, but password is missing";
    goto LABEL_27;
  }

  [v6 objectForKeyedSubscript:@"password"];
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEProxyServer setPassword:](v16, "setPassword:", v22);

LABEL_23:
  switch(v11)
  {
    case 1LL:
      -[NEProxySettings setHTTPServer:](v10, "setHTTPServer:", v16);
      -[NEProxySettings setHTTPEnabled:](v10, "setHTTPEnabled:", 1LL);
      break;
    case 2LL:
      -[NEProxySettings setHTTPSServer:](v10, "setHTTPSServer:", v16);
      -[NEProxySettings setHTTPSEnabled:](v10, "setHTTPSEnabled:", 1LL);
      break;
    case 3LL:
      -[NEProxySettings setFTPServer:](v10, "setFTPServer:", v16);
      -[NEProxySettings setFTPEnabled:](v10, "setFTPEnabled:", 1LL);
      break;
    case 4LL:
      -[NEProxySettings setRTSPServer:](v10, "setRTSPServer:", v16);
      -[NEProxySettings setRTSPEnabled:](v10, "setRTSPEnabled:", 1LL);
      break;
    case 5LL:
      -[NEProxySettings setSOCKSServer:](v10, "setSOCKSServer:", v16);
      -[NEProxySettings setSOCKSEnabled:](v10, "setSOCKSEnabled:", 1LL);
      break;
    case 6LL:
      -[NEProxySettings setGopherServer:](v10, "setGopherServer:", v16);
      -[NEProxySettings setGopherEnabled:](v10, "setGopherEnabled:", 1LL);
      break;
    default:
      break;
  }

  [v9 setProxySettings:v10];

  BOOL v12 = 1;
LABEL_35:

  return v12;
}

- (BOOL)unsetProxyServer:(id)a3 errorStr:(id *)a4
{
  id v6 = a3;
  [v6 objectForKeyedSubscript:@"type"];
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEUtilConfigurationClient protocolForParameters:](self, "protocolForParameters:", v6);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    uint64_t v9 = [v8 proxySettings];
    if (v9)
    {
      BOOL v10 = (void *)v9;
      if ([v7 isEqualToString:@"http"])
      {
        [v10 setHTTPServer:0];
        [v10 setHTTPEnabled:0];
      }

      else if ([v7 isEqualToString:@"https"])
      {
        [v10 setHTTPSServer:0];
        [v10 setHTTPSEnabled:0];
      }

      else if ([v7 isEqualToString:@"ftp"])
      {
        [v10 setFTPServer:0];
        [v10 setFTPEnabled:0];
      }

      else if ([v7 isEqualToString:@"rtsp"])
      {
        [v10 setRTSPServer:0];
        [v10 setRTSPEnabled:0];
      }

      else if ([v7 isEqualToString:@"gopher"])
      {
        [v10 setGopherServer:0];
        [v10 setGopherEnabled:0];
      }

      else
      {
        if (![v7 isEqualToString:@"socks"])
        {
          [NSString stringWithFormat:@"Invalid proxy type: %@, valid values are \"http\", \"https\", \"ftp\", \"rtsp\", \"gopher\", and \"socks\"", v7];
          *a4 = (id)objc_claimAutoreleasedReturnValue();

          BOOL v11 = 0;
          goto LABEL_18;
        }

        [v10 setSOCKSServer:0];
        [v10 setSOCKSEnabled:0];
      }
    }

    BOOL v11 = 1;
  }

  else
  {
    BOOL v11 = 0;
    *a4 = @"Missing protocol";
  }

- (void)handleCommand:(int)a3 forConfigWithName:(id)a4 withParameters:(id)a5 completionHandler:(id)a6
{
  uint64_t v105 = *MEMORY[0x1895F89C0];
  id v76 = a4;
  id v77 = a5;
  id v10 = a6;
  BOOL v11 = (void (**)(void, void))v10;
  if (a3 == 37)
  {
    uint64_t v13 = MEMORY[0x1895F87A8];
    v90[0] = MEMORY[0x1895F87A8];
    v90[1] = 3221225472LL;
    v90[2] = __94__NEUtilConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke;
    v90[3] = &unk_18A0908C8;
    v90[4] = self;
    uint64_t v14 = (void (**)(void, void))v10;
    id v91 = v10;
    BOOL v16 = v90;
    if (self)
    {
      objc_setProperty_atomic(self, v15, 0LL, 48LL);
      id Property = objc_getProperty(self, v17, 24LL, 1);
      *(void *)buf = v13;
      *(void *)&buf[8] = 3221225472LL;
      *(void *)&buf[16] = __69__NEUtilConfigurationClient_reloadIdentityListWithCompletionHandler___block_invoke;
      v99 = &unk_18A08FD80;
      v100 = self;
      v101 = v16;
      [Property copyIdentities:0 fromDomain:0 withCompletionQueue:MEMORY[0x1895F8AE0] handler:buf];
    }

    goto LABEL_32;
  }

  if (a3 != 36)
  {
    if ((a3 & 0xFFFFFFFE) == 0x1E)
    {
      uint64_t v74 = (void (**)(void, void))v10;
      [v77 objectForKeyedSubscript:@"configuration-file-path"];
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = v19;
      int v20 = v19;
      BOOL v11 = v74;
      if (v19)
      {
        if (([v19 hasPrefix:@"/"] & 1) == 0)
        {
          objc_msgSend( MEMORY[0x189603F18],  "arrayWithObjects:",  @"Configuration file path must be an absolute file path.",  0);
          uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(void, void *))v74)[2](v74, v41);

LABEL_70:
          BOOL v11 = v74;
          goto LABEL_33;
        }

        v83[0] = MEMORY[0x1895F87A8];
        v83[1] = 3221225472LL;
        v84 = __94__NEUtilConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_2;
        v85 = &unk_18A08FDA8;
        int v89 = a3;
        id v86 = v76;
        uint64_t v87 = self;
        uint64_t v88 = v74;
        id v69 = v20;
        id v75 = v86;
        id v68 = v83;
        if (!self)
        {
LABEL_69:

          goto LABEL_70;
        }

        v72 = (void *)[objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:0];
        id v71 = v69;
        [MEMORY[0x1896078A8] defaultManager];
        dispatch_data_t v21 = (void *)objc_claimAutoreleasedReturnValue();
        int v22 = [v21 isReadableFileAtPath:v71];

        if (!v22)
        {
          [MEMORY[0x1896078A8] defaultManager];
          unint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
          int v43 = [v42 fileExistsAtPath:v71];

          if ((v43 & 1) != 0) {
            [NSString stringWithFormat:@"File %@ is unreadable\n", v71];
          }
          else {
            [NSString stringWithFormat:@"File %@ not found\n", v71];
          }
          uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();
          id v45 = 0LL;
          uint64_t v70 = 0LL;
          id v67 = 0LL;
          goto LABEL_47;
        }

        v96[0] = 0LL;
        [MEMORY[0x189603F48] dataWithContentsOfFile:v71 options:0 error:v96];
        uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue();
        id v64 = v96[0];
        if (!v65)
        {
          ne_log_obj();
          v46 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)&buf[4] = self;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v71;
            _os_log_error_impl(&dword_1876B1000, v46, OS_LOG_TYPE_ERROR, "%@ Failed to read data from %@", buf, 0x16u);
          }

          [NSString stringWithFormat:@"Failed to read data from %@\n", v71];
          uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();
          id v67 = 0LL;

          id v45 = 0LL;
          uint64_t v70 = 0LL;
          goto LABEL_47;
        }

        uint64_t v23 = (void *)[objc_alloc(MEMORY[0x189607908]) initForReadingFromData:v65 error:0];
        [v23 setClass:objc_opt_class() forClassName:@"NEVPNAppRule"];
        [v23 setClass:objc_opt_class() forClassName:@"NEVPNProtocolPlugin"];
        uint64_t v63 = [v23 decodeInt64ForKey:@"Version"];
        int v24 = (void *)MEMORY[0x189604010];
        uint64_t v25 = objc_opt_class();
        uint64_t v26 = objc_opt_class();
        uint64_t v27 = objc_opt_class();
        uint64_t v28 = objc_opt_class();
        objc_msgSend(v24, "setWithObjects:", v25, v26, v27, v28, objc_opt_class(), 0);
        id v29 = (void *)objc_claimAutoreleasedReturnValue();
        [v23 decodeObjectOfClasses:v29 forKey:@"Index"];
        uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue();
        id v66 = v23;

        if (!v70 || v63)
        {
LABEL_46:

          id v45 = v66;
          uint64_t v44 = 0LL;
          id v67 = v45;
LABEL_47:
          id v47 = v44;

          v48 = (__CFString *)v47;
          id v49 = v45;
          if (v48)
          {
            uint64_t v50 = 0LL;
            v51 = 0LL;
          }

          else
          {
            if (v70)
            {
              [v70 objectForKeyedSubscript:@"AppGroupMap"];
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              __int128 v94 = 0u;
              __int128 v95 = 0u;
              __int128 v92 = 0u;
              __int128 v93 = 0u;
              [v70 objectForKeyedSubscript:@"ConfigurationProperties"];
              id v52 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v53 = [v52 countByEnumeratingWithState:&v92 objects:buf count:16];
              if (v53)
              {
                uint64_t v54 = *(void *)v93;
LABEL_52:
                uint64_t v55 = 0LL;
                while (1)
                {
                  if (*(void *)v93 != v54) {
                    objc_enumerationMutation(v52);
                  }
                  id v56 = *(id *)(*((void *)&v92 + 1) + 8 * v55);
                  id v57 = v49;
                  uint64_t v58 = objc_opt_class();
                  [v56 UUIDString];
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  [v57 decodeObjectOfClass:v58 forKey:v59];
                  uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v50)
                  {
                    if (!v75
                      || ![v75 length]
                      || ([v50 name],
                          id v60 = (void *)objc_claimAutoreleasedReturnValue(),
                          int v61 = [v75 isEqualToString:v60],
                          v60,
                          v61))
                    {
                      [v50 identifier];
                      SEL v62 = (void *)objc_claimAutoreleasedReturnValue();
                      [v72 setObject:v50 forKeyedSubscript:v62];

                      if ([v75 length]) {
                        break;
                      }
                    }
                  }

                  if (v53 == ++v55)
                  {
                    uint64_t v53 = [v52 countByEnumeratingWithState:&v92 objects:buf count:16];
                    if (v53) {
                      goto LABEL_52;
                    }
                    goto LABEL_62;
                  }
                }
              }

              else
              {
LABEL_62:
                uint64_t v50 = 0LL;
              }

              v48 = 0LL;
            }

            else
            {
              ne_log_obj();
              id v52 = (void *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled((os_log_t)v52, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&buf[4] = self;
                _os_log_impl(&dword_1876B1000, (os_log_t)v52, OS_LOG_TYPE_INFO, "%@ empty configurations", buf, 0xCu);
              }

              uint64_t v50 = 0LL;
              v51 = 0LL;
              v48 = @"Empty configuration";
            }
          }

          v84((uint64_t)v68, v48, v72, v50, v51);

          goto LABEL_69;
        }

        __int128 v94 = 0u;
        __int128 v95 = 0u;
        __int128 v92 = 0u;
        __int128 v93 = 0u;
        id v30 = v70;
        uint64_t v31 = [v30 countByEnumeratingWithState:&v92 objects:buf count:16];
        if (v31)
        {
          unint64_t v32 = 0LL;
          id v33 = 0LL;
          uint64_t v34 = *(void *)v93;
          do
          {
            for (uint64_t i = 0LL; i != v31; ++i)
            {
              if (*(void *)v93 != v34) {
                objc_enumerationMutation(v30);
              }
              uint64_t v36 = *(void *)(*((void *)&v92 + 1) + 8 * i);
              if (!v32)
              {
                [v30 objectForKeyedSubscript:*(void *)(*((void *)&v92 + 1) + 8 * i)];
                unint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
              }

              [v32 allKeys];
              unint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v33) {
                id v33 = objc_alloc_init(MEMORY[0x189603FC8]);
              }
              [v33 setObject:v37 forKeyedSubscript:v36];
            }

            uint64_t v31 = [v30 countByEnumeratingWithState:&v92 objects:buf count:16];
          }

          while (v31);

          if (!v32 || !v33)
          {
            uint64_t v70 = v30;
            goto LABEL_45;
          }

          v97[0] = @"ConfigurationProperties";
          v97[1] = @"UserMap";
          *(void *)v103 = v32;
          id v104 = v33;
          [MEMORY[0x189603F68] dictionaryWithObjects:v103 forKeys:v97 count:2];
          uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          id v33 = 0LL;
          unint64_t v32 = 0LL;
          uint64_t v70 = v30;
        }

LABEL_45:
        goto LABEL_46;
      }
    }

    uint64_t v38 = MEMORY[0x1895F87A8];
    v78[0] = MEMORY[0x1895F87A8];
    v78[1] = 3221225472LL;
    v78[2] = __94__NEUtilConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_3;
    v78[3] = &unk_18A08FE78;
    uint64_t v14 = v11;
    uint64_t v81 = v11;
    v78[4] = self;
    int v82 = a3;
    id v79 = v77;
    id v80 = v76;
    id v39 = v80;
    uint64_t v40 = v78;
    if (self)
    {
      *(void *)buf = v38;
      *(void *)&buf[8] = 3221225472LL;
      *(void *)&buf[16] = __73__NEUtilConfigurationClient_loadConfigurationWithName_completionHandler___block_invoke;
      v99 = &unk_18A08FD58;
      v100 = self;
      v101 = v39;
      v102 = v40;
      -[NEUtilConfigurationClient loadConfigurationsForceRefresh:completionHandler:](self, 0, buf);
    }

LABEL_32:
    BOOL v11 = v14;
    goto LABEL_33;
  }

  -[NEUtilConfigurationClient clientName](self, "clientName");
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[NEUtilConfigurationClient removeClientWithName:]( &OBJC_CLASS___NEUtilConfigurationClient,  "removeClientWithName:",  v12);

  v11[2](v11, MEMORY[0x189604A58]);
LABEL_33:
}

- (NSString)clientName
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (BOOL)isAlwaysOn
{
  return self->_isAlwaysOn;
}

- (void).cxx_destruct
{
}

void __94__NEUtilConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke( uint64_t a1)
{
  v22[1] = *MEMORY[0x1895F89C0];
  dispatch_data_t v21 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189607940]),  "initWithFormat:",  @"%-5s %-100s %-9s %-6s\n",  "ID",  "Subject Summary",  "Validity",  "Domain");
  unint64_t v3 = 0LL;
  id v4 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  while (1)
  {
    id Property = *(id *)(a1 + 32);
    if (Property) {
      id Property = objc_getProperty(Property, v2, 48LL, 1);
    }
    if (v3 >= [Property count]) {
      break;
    }
    id v7 = *(id *)(a1 + 32);
    if (v7) {
      id v7 = objc_getProperty(v7, v6, 48LL, 1);
    }
    [v7 objectAtIndexedSubscript:v3];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 objectForKeyedSubscript:@"certificate-data"];
    uint64_t v9 = (const __CFData *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      SecCertificateRef v10 = SecCertificateCreateWithData(v4, v9);
      if (v10)
      {
        BOOL v11 = v10;
        int IsValid = NECertificateDateIsValid((uint64_t)v10);
        [v8 objectForKeyedSubscript:@"domain"];
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        int v14 = [v13 intValue];

        id v15 = (__CFString *)SecCertificateCopySubjectSummary(v11);
        BOOL v16 = v15;
        if (v15)
        {
          uint64_t v17 = -[__CFString UTF8String](v15, "UTF8String");
          uint64_t v18 = "user";
          if (!v14) {
            uint64_t v18 = "system";
          }
          objc_msgSend( v21,  "appendFormat:",  @"%-5lu %-100s %-9s %-6s\n",  v3,  v17,  off_18A08FF38[IsValid - 1],  v18);
        }

        CFRelease(v11);
      }
    }

    ++v3;
  }

  uint64_t v19 = *(void *)(a1 + 40);
  v22[0] = v21;
  [MEMORY[0x189603F18] arrayWithObjects:v22 count:1];
  int v20 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v20);
}

void __94__NEUtilConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_2( uint64_t a1,  void *a2,  void *a3,  void *a4,  void *a5)
{
  uint64_t v52 = *MEMORY[0x1895F89C0];
  uint64_t v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = objc_alloc_init(MEMORY[0x189603FA8]);
  if (v9) {
    goto LABEL_2;
  }
  int v14 = *(_DWORD *)(a1 + 56);
  if (v14 != 31)
  {
    if (v14 != 30)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Unsupported command", v38);
      goto LABEL_21;
    }

    id v15 = *(void **)(a1 + 32);
    if (v15 && [v15 length])
    {
      if (v11)
      {
        [v11 description];
        uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_2:
        [v13 addObject:v9];

        goto LABEL_3;
      }

      [NSString stringWithFormat:@"Configuration '%@' not found", *(void *)(a1 + 32)];
LABEL_21:
      uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (!v9) {
        goto LABEL_3;
      }
      goto LABEL_2;
    }

    if ([v12 count])
    {
      if (*(void *)(a1 + 40))
      {
        uint64_t v25 = (objc_class *)MEMORY[0x189607940];
        id v26 = v12;
        uint64_t v27 = (void *)[[v25 alloc] initWithCapacity:0];
        [v27 appendString:@"{"];
        [v27 appendPrettyObject:v26 withName:@"app-group-map" andIndent:0 options:0];

        [v27 appendString:@"\n}"];
      }

      else
      {
        uint64_t v27 = 0LL;
      }

      [NSString stringWithFormat:@"%@\n", v27];
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 addObject:v28];
    }

    if (!v10 || ![v10 count])
    {
      uint64_t v9 = @"Unreadable or empty file";
      goto LABEL_2;
    }

    id v39 = v12;
    id v40 = v11;
    uint64_t v41 = a1;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    id v29 = v10;
    id v30 = v10;
    uint64_t v31 = [v30 countByEnumeratingWithState:&v46 objects:v51 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v47;
      do
      {
        for (uint64_t i = 0LL; i != v32; ++i)
        {
          if (*(void *)v47 != v33) {
            objc_enumerationMutation(v30);
          }
          uint64_t v35 = (void *)NSString;
          [v30 objectForKeyedSubscript:*(void *)(*((void *)&v46 + 1) + 8 * i)];
          uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
          [v35 stringWithFormat:@"%@\n", v36];
          unint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
          [v13 addObject:v37];
        }

        uint64_t v32 = [v30 countByEnumeratingWithState:&v46 objects:v51 count:16];
      }

      while (v32);
    }

    id v10 = v29;
LABEL_37:
    id v11 = v40;
    a1 = v41;
    id v12 = v39;
    goto LABEL_3;
  }

  if (v10 && [v10 count])
  {
    id v39 = v12;
    id v40 = v11;
    uint64_t v41 = a1;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    id v16 = v10;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v42 objects:v50 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v43;
      do
      {
        for (uint64_t j = 0LL; j != v18; ++j)
        {
          if (*(void *)v43 != v19) {
            objc_enumerationMutation(v16);
          }
          [v16 objectForKeyedSubscript:*(void *)(*((void *)&v42 + 1) + 8 * j)];
          dispatch_data_t v21 = (void *)objc_claimAutoreleasedReturnValue();
          int v22 = (void *)NSString;
          [v21 name];
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
          [v22 stringWithFormat:@"%@\n", v23];
          int v24 = (void *)objc_claimAutoreleasedReturnValue();
          [v13 addObject:v24];
        }

        uint64_t v18 = [v16 countByEnumeratingWithState:&v42 objects:v50 count:16];
      }

      while (v18);
    }

    goto LABEL_37;
  }

void __94__NEUtilConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_3( uint64_t a1,  void *a2,  void *a3)
{
  v286[1] = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  uint64_t v276 = 0LL;
  v277 = &v276;
  uint64_t v278 = 0x3032000000LL;
  v279 = __Block_byref_object_copy__21516;
  v280 = __Block_byref_object_dispose__21517;
  id v281 = 0LL;
  id v8 = objc_alloc_init(MEMORY[0x189603FA8]);
  id newValue = v5;
  if (v6)
  {
    uint64_t v9 = *(void *)(a1 + 56);
    v286[0] = v6;
    [MEMORY[0x189603F18] arrayWithObjects:v286 count:1];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

    goto LABEL_176;
  }

  id v11 = *(void **)(a1 + 32);
  if (v11) {
    objc_setProperty_atomic(v11, v7, v5, 56LL);
  }
  switch(*(_DWORD *)(a1 + 64))
  {
    case 1:
      if (v5)
      {
        uint64_t v12 = [NSString stringWithFormat:@"Configuration with name %@ already exists", *(void *)(a1 + 48)];
        id v13 = (void *)v277[5];
        v277[5] = v12;
      }

      else
      {
        v174 = *(void **)(a1 + 32);
        uint64_t v175 = *(void *)(a1 + 40);
        v176 = (id *)(v277 + 5);
        id v275 = (id)v277[5];
        [v174 createConfigurationWithParameters:v175 errorStr:&v275];
        objc_storeStrong(v176, v275);
      }

      goto LABEL_173;
    case 2:
      if (!v5) {
        goto LABEL_105;
      }
      id v29 = *(void **)(a1 + 32);
      uint64_t v30 = *(void *)(a1 + 40);
      uint64_t v31 = (id *)(v277 + 5);
      id v267 = (id)v277[5];
      [v29 setProtocolWithParameters:v30 errorStr:&v267];
      objc_storeStrong(v31, v267);
      goto LABEL_173;
    case 3:
      if (!v5) {
        goto LABEL_105;
      }
      uint64_t v32 = *(void **)(a1 + 32);
      uint64_t v33 = *(void *)(a1 + 40);
      uint64_t v34 = (id *)(v277 + 5);
      id v266 = (id)v277[5];
      [v32 setFilterPluginWithParameters:v33 errorStr:&v266];
      objc_storeStrong(v34, v266);
      goto LABEL_173;
    case 4:
      if (!v5) {
        goto LABEL_105;
      }
      uint64_t v35 = *(void **)(a1 + 32);
      uint64_t v36 = *(void *)(a1 + 40);
      unint64_t v37 = (id *)(v277 + 5);
      id v265 = (id)v277[5];
      [v35 unsetFilterPluginParameters:v36 errorStr:&v265];
      objc_storeStrong(v37, v265);
      goto LABEL_173;
    case 5:
      if (!v5) {
        goto LABEL_105;
      }
      uint64_t v38 = *(void **)(a1 + 32);
      uint64_t v39 = *(void *)(a1 + 40);
      id v40 = (id *)(v277 + 5);
      id v264 = (id)v277[5];
      [v38 setDNSProxyWithParameters:v39 errorStr:&v264];
      objc_storeStrong(v40, v264);
      goto LABEL_173;
    case 6:
      if (!v5) {
        goto LABEL_105;
      }
      uint64_t v41 = *(void **)(a1 + 32);
      uint64_t v42 = *(void *)(a1 + 40);
      __int128 v43 = (id *)(v277 + 5);
      id v263 = (id)v277[5];
      [v41 unsetDNSProxyWithParameters:v42 errorStr:&v263];
      objc_storeStrong(v43, v263);
      goto LABEL_173;
    case 7:
      if (!v5) {
        goto LABEL_105;
      }
      __int128 v44 = *(void **)(a1 + 32);
      uint64_t v45 = *(void *)(a1 + 40);
      __int128 v46 = (id *)(v277 + 5);
      id v262 = (id)v277[5];
      [v44 setCommonParameters:v45 errorStr:&v262];
      objc_storeStrong(v46, v262);
      goto LABEL_173;
    case 8:
      if (!v5) {
        goto LABEL_105;
      }
      __int128 v47 = *(void **)(a1 + 32);
      uint64_t v48 = *(void *)(a1 + 40);
      __int128 v49 = (id *)(v277 + 5);
      id v261 = (id)v277[5];
      [v47 unsetCommonParameters:v48 errorStr:&v261];
      objc_storeStrong(v49, v261);
      goto LABEL_173;
    case 9:
      if (!v5) {
        goto LABEL_105;
      }
      uint64_t v50 = *(void **)(a1 + 32);
      uint64_t v51 = *(void *)(a1 + 40);
      uint64_t v52 = (id *)(v277 + 5);
      id v260 = (id)v277[5];
      [v50 setIPSecParameters:v51 errorStr:&v260];
      objc_storeStrong(v52, v260);
      goto LABEL_173;
    case 0xA:
      if (!v5) {
        goto LABEL_105;
      }
      uint64_t v53 = *(void **)(a1 + 32);
      uint64_t v54 = *(void *)(a1 + 40);
      uint64_t v55 = (id *)(v277 + 5);
      id v259 = (id)v277[5];
      [v53 unsetIPSecParameters:v54 errorStr:&v259];
      objc_storeStrong(v55, v259);
      goto LABEL_173;
    case 0xB:
      if (!v5) {
        goto LABEL_105;
      }
      id v56 = *(void **)(a1 + 32);
      id v57 = *(void **)(a1 + 40);
      uint64_t v58 = (id *)(v277 + 5);
      id v258 = (id)v277[5];
      -[NEUtilConfigurationClient setPPPParameters:errorStr:](v56, v57, &v258);
      objc_storeStrong(v58, v258);
      goto LABEL_173;
    case 0xC:
      if (!v5) {
        goto LABEL_105;
      }
      v59 = *(void **)(a1 + 32);
      id v60 = *(void **)(a1 + 40);
      int v61 = (id *)(v277 + 5);
      id v257 = (id)v277[5];
      -[NEUtilConfigurationClient unsetPPPParameters:errorStr:](v59, v60, &v257);
      objc_storeStrong(v61, v257);
      goto LABEL_173;
    case 0xD:
      if (!v5) {
        goto LABEL_105;
      }
      SEL v62 = *(void **)(a1 + 32);
      uint64_t v63 = *(void *)(a1 + 40);
      id v64 = (id *)(v277 + 5);
      id v256 = (id)v277[5];
      [v62 addOnDemandRuleWithParameters:v63 errorStr:&v256];
      objc_storeStrong(v64, v256);
      goto LABEL_173;
    case 0xE:
      if (!v5) {
        goto LABEL_105;
      }
      uint64_t v65 = *(void **)(a1 + 32);
      uint64_t v66 = *(void *)(a1 + 40);
      id v67 = (id *)(v277 + 5);
      id v255 = (id)v277[5];
      [v65 removeOnDemandRuleWithParameters:v66 errorStr:&v255];
      objc_storeStrong(v67, v255);
      goto LABEL_173;
    case 0xF:
      if (!v5) {
        goto LABEL_105;
      }
      id v68 = *(void **)(a1 + 32);
      uint64_t v69 = *(void *)(a1 + 40);
      uint64_t v70 = (id *)(v277 + 5);
      id v224 = (id)v277[5];
      [v68 setProxyParameters:v69 errorStr:&v224];
      objc_storeStrong(v70, v224);
      goto LABEL_173;
    case 0x10:
      if (!v5) {
        goto LABEL_105;
      }
      id v71 = *(void **)(a1 + 32);
      uint64_t v72 = *(void *)(a1 + 40);
      v73 = (id *)(v277 + 5);
      id v223 = (id)v277[5];
      [v71 unsetProxyParameters:v72 errorStr:&v223];
      objc_storeStrong(v73, v223);
      goto LABEL_173;
    case 0x11:
      if (!v5) {
        goto LABEL_105;
      }
      uint64_t v74 = *(void **)(a1 + 32);
      uint64_t v75 = *(void *)(a1 + 40);
      id v76 = (id *)(v277 + 5);
      id v222 = (id)v277[5];
      [v74 setProxyServer:v75 errorStr:&v222];
      objc_storeStrong(v76, v222);
      goto LABEL_173;
    case 0x12:
      if (!v5) {
        goto LABEL_105;
      }
      id v77 = *(void **)(a1 + 32);
      uint64_t v78 = *(void *)(a1 + 40);
      id v79 = (id *)(v277 + 5);
      id v221 = (id)v277[5];
      [v77 unsetProxyServer:v78 errorStr:&v221];
      objc_storeStrong(v79, v221);
      goto LABEL_173;
    case 0x13:
      if (!v5) {
        goto LABEL_105;
      }
      id v80 = *(void **)(a1 + 32);
      uint64_t v81 = *(void *)(a1 + 40);
      int v82 = (id *)(v277 + 5);
      id v226 = (id)v277[5];
      [v80 setDNSParameters:v81 errorStr:&v226];
      objc_storeStrong(v82, v226);
      goto LABEL_173;
    case 0x14:
      if (!v5) {
        goto LABEL_105;
      }
      v83 = *(void **)(a1 + 32);
      uint64_t v84 = *(void *)(a1 + 40);
      v85 = (id *)(v277 + 5);
      id v225 = (id)v277[5];
      [v83 unsetDNSParameters:v84 errorStr:&v225];
      objc_storeStrong(v85, v225);
      goto LABEL_173;
    case 0x19:
      if (!v5) {
        goto LABEL_105;
      }
      uint64_t v88 = *(void **)(a1 + 32);
      int v89 = *(void **)(a1 + 40);
      uint64_t v90 = (id *)(v277 + 5);
      id v250 = (id)v277[5];
      -[NEUtilConfigurationClient addAppRuleWithParameters:errorStr:](v88, v89, &v250);
      objc_storeStrong(v90, v250);
      goto LABEL_173;
    case 0x1A:
      if (!v5) {
        goto LABEL_105;
      }
      id v91 = *(void **)(a1 + 32);
      __int128 v92 = *(void **)(a1 + 40);
      __int128 v93 = (id *)(v277 + 5);
      id v249 = (id)v277[5];
      -[NEUtilConfigurationClient removeAppRuleWithParameters:errorStr:](v91, v92, &v249);
      objc_storeStrong(v93, v249);
      goto LABEL_173;
    case 0x1B:
      if (!v5) {
        goto LABEL_105;
      }
      __int128 v94 = *(void **)(a1 + 32);
      __int128 v95 = *(void **)(a1 + 40);
      v96 = (id *)(v277 + 5);
      id v248 = (id)v277[5];
      -[NEUtilConfigurationClient setPathControllerWithParameters:errorStr:](v94, v95, &v248);
      objc_storeStrong(v96, v248);
      goto LABEL_173;
    case 0x1C:
      if (!v5) {
        goto LABEL_105;
      }
      v97 = *(void **)(a1 + 32);
      v98 = *(void **)(a1 + 40);
      v99 = (id *)(v277 + 5);
      id v247 = (id)v277[5];
      -[NEUtilConfigurationClient addPathRuleWithParameters:errorStr:](v97, v98, (const __CFString **)&v247);
      objc_storeStrong(v99, v247);
      goto LABEL_173;
    case 0x1D:
      if (!v5) {
        goto LABEL_105;
      }
      v100 = *(void **)(a1 + 32);
      v101 = *(void **)(a1 + 40);
      v102 = (id *)(v277 + 5);
      id v246 = (id)v277[5];
      -[NEUtilConfigurationClient removePathRuleWithParameters:errorStr:](v100, v101, &v246);
      objc_storeStrong(v102, v246);
      goto LABEL_173;
    case 0x1E:
      if (v5)
      {
        [v5 description];
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 addObject:v103];
      }

      else
      {
        v179 = (void *)NSString;
        id Property = *(id *)(a1 + 32);
        if (Property) {
          id Property = objc_getProperty(Property, v7, 24LL, 1);
        }
        id v181 = Property;
        [v181 debugDescription];
        v182 = (void *)objc_claimAutoreleasedReturnValue();
        [v179 stringWithFormat:@"%@\n", v182];
        v183 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 addObject:v183];

        v185 = *(void **)(a1 + 32);
        if (v185)
        {
          id v186 = objc_getProperty(v185, v184, 40LL, 1);
          if (v186)
          {
            v188 = v186;
            id v189 = *(id *)(a1 + 32);
            if (v189) {
              id v189 = objc_getProperty(v189, v187, 40LL, 1);
            }
            id v190 = v189;
            BOOL v191 = [v190 count] == 0;

            if (!v191)
            {
              __int128 v244 = 0u;
              __int128 v245 = 0u;
              __int128 v242 = 0u;
              __int128 v243 = 0u;
              id v192 = *(id *)(a1 + 32);
              if (v192) {
                id v192 = objc_getProperty(v192, v187, 40LL, 1);
              }
              id v193 = v192;
              uint64_t v194 = [v193 countByEnumeratingWithState:&v242 objects:v285 count:16];
              if (v194)
              {
                uint64_t v195 = *(void *)v243;
                do
                {
                  for (uint64_t i = 0LL; i != v194; ++i)
                  {
                    if (*(void *)v243 != v195) {
                      objc_enumerationMutation(v193);
                    }
                    [NSString stringWithFormat:@"%@\n", *(void *)(*((void *)&v242 + 1) + 8 * i)];
                    v197 = (void *)objc_claimAutoreleasedReturnValue();
                    [v8 addObject:v197];
                  }

                  uint64_t v194 = [v193 countByEnumeratingWithState:&v242 objects:v285 count:16];
                }

                while (v194);
              }
            }
          }

          v198 = *(void **)(a1 + 32);
          if (v198)
          {
            id v199 = objc_getProperty(v198, v187, 32LL, 1);
            if (v199)
            {
              v201 = v199;
              id v202 = *(id *)(a1 + 32);
              if (v202) {
                id v202 = objc_getProperty(v202, v200, 32LL, 1);
              }
              id v203 = v202;
              BOOL v204 = [v203 count] == 0;

              if (!v204)
              {
                [v8 addObject:@"New Configurations:\n"];
                __int128 v240 = 0u;
                __int128 v241 = 0u;
                __int128 v238 = 0u;
                __int128 v239 = 0u;
                id v206 = *(id *)(a1 + 32);
                if (v206) {
                  id v206 = objc_getProperty(v206, v205, 32LL, 1);
                }
                id v207 = v206;
                uint64_t v208 = [v207 countByEnumeratingWithState:&v238 objects:v284 count:16];
                if (v208)
                {
                  uint64_t v209 = *(void *)v239;
                  do
                  {
                    for (uint64_t j = 0LL; j != v208; ++j)
                    {
                      if (*(void *)v239 != v209) {
                        objc_enumerationMutation(v207);
                      }
                      [NSString stringWithFormat:@"%@\n", *(void *)(*((void *)&v238 + 1) + 8 * j)];
                      v211 = (void *)objc_claimAutoreleasedReturnValue();
                      [v8 addObject:v211];
                    }

                    uint64_t v208 = [v207 countByEnumeratingWithState:&v238 objects:v284 count:16];
                  }

                  while (v208);
                }
              }
            }
          }
        }
      }

      goto LABEL_173;
    case 0x1F:
      +[NEConfigurationManager sharedManagerForAllUsers]( &OBJC_CLASS___NEConfigurationManager,  "sharedManagerForAllUsers");
      int v14 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v15 = MEMORY[0x1895F8AE0];
      id v16 = MEMORY[0x1895F8AE0];
      v235[0] = MEMORY[0x1895F87A8];
      v235[1] = 3221225472LL;
      v235[2] = __94__NEUtilConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_2_650;
      v235[3] = &unk_18A08FDF8;
      v235[4] = *(void *)(a1 + 32);
      id v236 = v8;
      id v237 = *(id *)(a1 + 56);
      [v14 loadIndexWithFilter:0 completionQueue:v15 handler:v235];

      goto LABEL_176;
    case 0x20:
      if (!v5) {
        goto LABEL_105;
      }
      id v104 = *(id *)(a1 + 32);
      if (v104) {
        id v104 = objc_getProperty(v104, v7, 24LL, 1);
      }
      id v105 = v104;
      uint64_t v106 = MEMORY[0x1895F8AE0];
      id v107 = MEMORY[0x1895F8AE0];
      v229[0] = MEMORY[0x1895F87A8];
      v229[1] = 3221225472LL;
      v229[2] = __94__NEUtilConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_3_662;
      v229[3] = &unk_18A08FE20;
      id v230 = *(id *)(a1 + 48);
      id v108 = v8;
      uint64_t v109 = *(void *)(a1 + 32);
      id v231 = v108;
      uint64_t v232 = v109;
      id v233 = v5;
      id v234 = *(id *)(a1 + 56);
      [v105 saveConfiguration:v233 withCompletionQueue:v106 handler:v229];

      goto LABEL_176;
    case 0x21:
      if (!v5) {
        goto LABEL_105;
      }
      id v110 = *(id *)(a1 + 32);
      if (v110) {
        id v110 = objc_getProperty(v110, v7, 24LL, 1);
      }
      id v111 = v110;
      uint64_t v112 = MEMORY[0x1895F8AE0];
      id v113 = MEMORY[0x1895F8AE0];
      v268[0] = MEMORY[0x1895F87A8];
      v268[1] = 3221225472LL;
      v268[2] = __94__NEUtilConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_644;
      v268[3] = &unk_18A08FDD0;
      v273 = &v276;
      id v114 = *(id *)(a1 + 48);
      uint64_t v115 = *(void *)(a1 + 32);
      id v269 = v114;
      uint64_t v270 = v115;
      id v271 = v5;
      id v272 = *(id *)(a1 + 56);
      [v111 removeConfiguration:v271 withCompletionQueue:v112 handler:v268];

      goto LABEL_176;
    case 0x22:
      [*(id *)(a1 + 40) objectForKeyedSubscript:@"profile-file-path"];
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      ne_log_obj();
      v117 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v117, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v283 = v116;
        _os_log_debug_impl(&dword_1876B1000, v117, OS_LOG_TYPE_DEBUG, "process ingestion command, path %@", buf, 0xCu);
      }

      v118 = -[NEProfileIngestion initWithName:]( objc_alloc(&OBJC_CLASS___NEProfileIngestion),  "initWithName:",  @"neutil");
      [MEMORY[0x189603FC8] dictionaryWithContentsOfFile:v116];
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      v120 = -[NEProfilePayloadBase initWithPayload:]( objc_alloc(&OBJC_CLASS___NEProfilePayloadBase),  "initWithPayload:",  v119);
      -[NEProfileIngestion createConfigurationFromPayload:payloadType:]( v118,  "createConfigurationFromPayload:payloadType:",  v120,  @"com.apple.vpn.managed");
      v121 = -[NEProfileIngestion ingestedConfiguration](v118, "ingestedConfiguration");
      if (v121) {
        -[NEProfileIngestion saveIngestedConfiguration](v118, "saveIngestedConfiguration");
      }

      goto LABEL_173;
    case 0x26:
      if (!v5) {
        goto LABEL_105;
      }
      v122 = *(void **)(a1 + 32);
      v123 = *(void **)(a1 + 40);
      v124 = (id *)(v277 + 5);
      id v228 = (id)v277[5];
      -[NEUtilConfigurationClient setAlwaysOnParameters:errorStr:](v122, v123, (const __CFString **)&v228);
      objc_storeStrong(v124, v228);
      goto LABEL_173;
    case 0x27:
      if (!v5) {
        goto LABEL_105;
      }
      v125 = *(void **)(a1 + 32);
      v126 = *(void **)(a1 + 40);
      v127 = (id *)(v277 + 5);
      id v227 = (id)v277[5];
      -[NEUtilConfigurationClient unsetAlwaysOnParameters:errorStr:](v125, v126, (const __CFString **)&v227);
      objc_storeStrong(v127, v227);
      goto LABEL_173;
    case 0x28:
      if (!v5) {
        goto LABEL_105;
      }
      uint64_t v17 = *(void **)(a1 + 32);
      uint64_t v18 = *(void **)(a1 + 40);
      uint64_t v19 = (id *)(v277 + 5);
      obuint64_t j = (id)v277[5];
      -[NEUtilConfigurationClient swapConfigurationTypeWithParameters:errorStr:](v17, v18, &obj);
      objc_storeStrong(v19, obj);
      goto LABEL_173;
    case 0x2A:
      v128 = (void *)MEMORY[0x189603F68];
      [*(id *)(a1 + 40) objectForKeyedSubscript:@"profile-file-path"];
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      [v128 dictionaryWithContentsOfFile:v129];
      v130 = (void *)objc_claimAutoreleasedReturnValue();

      if (!isa_nsdictionary(v130))
      {
        v171 = (void *)NSString;
        [*(id *)(a1 + 40) objectForKeyedSubscript:@"profile-file-path"];
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v172 = [v171 stringWithFormat:@"Failed to read from %@", v132];
        v173 = (void *)v277[5];
        v277[5] = v172;
LABEL_171:

        goto LABEL_172;
      }
      v132 = +[NEConfiguration configurationWithProfilePayload:grade:]( &OBJC_CLASS___NEConfiguration,  "configurationWithProfilePayload:grade:",  v130,  1LL);
      if (!v132)
      {
        v212 = (void *)NSString;
        [*(id *)(a1 + 40) objectForKeyedSubscript:@"profile-file-path"];
        v173 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v213 = [v212 stringWithFormat:@"Failed to create a configuration from profile payload at %@. Make sure that the file only contains the configuration payload.", v173];
        v214 = (void *)v277[5];
        v277[5] = v213;

        v132 = 0LL;
        goto LABEL_171;
      }

      v133 = *(void **)(a1 + 32);
      if (!v133 || !objc_getProperty(v133, v131, 32LL, 1))
      {
        id v136 = objc_alloc_init(MEMORY[0x189603FA8]);
        v137 = *(void **)(a1 + 32);
        if (v137) {
          objc_setProperty_atomic(v137, v135, v136, 32LL);
        }
      }

      id v138 = *(id *)(a1 + 32);
      if (v138) {
        id v138 = objc_getProperty(v138, v134, 32LL, 1);
      }
      id v139 = v138;
      [v139 addObject:v132];

      v141 = *(void **)(a1 + 32);
      if (v141) {
        objc_setProperty_atomic(v141, v140, v132, 56LL);
      }
LABEL_172:

LABEL_173:
      if (v277[5]) {
        objc_msgSend(v8, "addObject:");
      }
      (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
LABEL_176:

      _Block_object_dispose(&v276, 8);
      return;
    case 0x2B:
      v142 = objc_alloc(&OBJC_CLASS___NEConfiguration);
      v143 = (void *)NSString;
      [v5 name];
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      [v143 stringWithFormat:@"%@ Per-App", v144];
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      v146 = -[NEConfiguration initWithName:grade:](v142, "initWithName:grade:", v145, [v5 grade]);

      v147 = objc_alloc_init(&OBJC_CLASS___NEVPNApp);
      -[NEConfiguration setAppVPN:](v146, "setAppVPN:", v147);

      [v5 VPN];
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      [v148 protocol];
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      v150 = -[NEConfiguration appVPN](v146, "appVPN");
      [v150 setProtocol:v149];
      v151 = -[NEConfiguration appVPN](v146, "appVPN");
      [v151 setOnDemandEnabled:1];

      [v5 VPN];
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      [v152 onDemandRules];
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      v154 = (void *)[v153 copy];
      v155 = -[NEConfiguration appVPN](v146, "appVPN");
      [v155 setOnDemandRules:v154];
      v156 = -[NEConfiguration appVPN](v146, "appVPN");
      [v156 setEnabled:1];
      v157 = -[NEConfiguration appVPN](v146, "appVPN");
      [v157 setTunnelType:1];
      v158 = +[NEConfigurationManager sharedManager](&OBJC_CLASS___NEConfigurationManager, "sharedManager");
      uint64_t v159 = MEMORY[0x1895F8AE0];
      id v160 = MEMORY[0x1895F8AE0];
      v218[0] = MEMORY[0x1895F87A8];
      v218[1] = 3221225472LL;
      v218[2] = __94__NEUtilConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_671;
      v218[3] = &unk_18A08FE50;
      v161 = v146;
      v219 = v161;
      v220 = &v276;
      [v158 saveConfiguration:v161 withCompletionQueue:v159 handler:v218];

      goto LABEL_173;
    case 0x2C:
      if (!v5) {
        goto LABEL_105;
      }
      v162 = *(void **)(a1 + 32);
      uint64_t v163 = *(void *)(a1 + 40);
      v164 = (id *)(v277 + 5);
      id v217 = (id)v277[5];
      [v162 setAppPushParameters:v163 errorStr:&v217];
      objc_storeStrong(v164, v217);
      goto LABEL_173;
    case 0x2D:
      if (!v5) {
        goto LABEL_105;
      }
      int v20 = *(void **)(a1 + 32);
      uint64_t v21 = *(void *)(a1 + 40);
      int v22 = (id *)(v277 + 5);
      id v216 = (id)v277[5];
      [v20 unsetAppPushParameters:v21 errorStr:&v216];
      objc_storeStrong(v22, v216);
      goto LABEL_173;
    case 0x2E:
      if (!v5) {
        goto LABEL_105;
      }
      v165 = *(void **)(a1 + 32);
      uint64_t v166 = *(void *)(a1 + 40);
      v167 = (id *)(v277 + 5);
      id v254 = (id)v277[5];
      [v165 addRelayWithParameters:v166 errorStr:&v254];
      objc_storeStrong(v167, v254);
      goto LABEL_173;
    case 0x2F:
      if (!v5) {
        goto LABEL_105;
      }
      uint64_t v23 = *(void **)(a1 + 32);
      uint64_t v24 = *(void *)(a1 + 40);
      uint64_t v25 = (id *)(v277 + 5);
      id v253 = (id)v277[5];
      [v23 removeRelayWithParameters:v24 errorStr:&v253];
      objc_storeStrong(v25, v253);
      goto LABEL_173;
    case 0x30:
      if (!v5) {
        goto LABEL_105;
      }
      id v26 = *(void **)(a1 + 32);
      uint64_t v27 = *(void *)(a1 + 40);
      uint64_t v28 = (id *)(v277 + 5);
      id v252 = (id)v277[5];
      [v26 setRelayConditionsWithParameters:v27 errorStr:&v252];
      objc_storeStrong(v28, v252);
      goto LABEL_173;
    case 0x31:
      if (v5)
      {
        v168 = *(void **)(a1 + 32);
        uint64_t v169 = *(void *)(a1 + 40);
        v170 = (id *)(v277 + 5);
        id v251 = (id)v277[5];
        [v168 unsetRelayConditionsWithParameters:v169 errorStr:&v251];
        objc_storeStrong(v170, v251);
      }

      else
      {
LABEL_105:
        uint64_t v177 = [NSString stringWithFormat:@"Configuration with name %@ does not exist", *(void *)(a1 + 48)];
        v178 = (void *)v277[5];
        v277[5] = v177;
      }

      goto LABEL_173;
    default:
      uint64_t v86 = [NSString stringWithFormat:@"Unknown command"];
      uint64_t v87 = (void *)v277[5];
      v277[5] = v86;

      goto LABEL_173;
  }

void __73__NEUtilConfigurationClient_loadConfigurationWithName_completionHandler___block_invoke( uint64_t a1,  void *a2)
{
  id v8 = a2;
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, v3, 40LL, 1);
  }
  find_config_by_name(Property, *(void **)(a1 + 40));
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    id v7 = *(id *)(a1 + 32);
    if (v7) {
      id v7 = objc_getProperty(v7, v5, 32LL, 1);
    }
    find_config_by_name(v7, *(void **)(a1 + 40));
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

- (void)loadConfigurationsForceRefresh:(void *)a3 completionHandler:
{
  id v6 = a3;
  if (a1)
  {
    if (!objc_getProperty(a1, v5, 40LL, 1) || a2)
    {
      id Property = objc_getProperty(a1, v7, 24LL, 1);
      v12[0] = MEMORY[0x1895F87A8];
      v12[1] = 3221225472LL;
      v12[2] = __78__NEUtilConfigurationClient_loadConfigurationsForceRefresh_completionHandler___block_invoke;
      v12[3] = &unk_18A0908F0;
      void v12[4] = a1;
      id v13 = v6;
      [Property loadConfigurationsWithCompletionQueue:MEMORY[0x1895F8AE0] handler:v12];
      id v8 = v13;
    }

    else
    {
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __78__NEUtilConfigurationClient_loadConfigurationsForceRefresh_completionHandler___block_invoke_2;
      block[3] = &unk_18A090940;
      id v11 = v6;
      dispatch_async(MEMORY[0x1895F8AE0], block);
      id v8 = v11;
    }
  }
}

void __78__NEUtilConfigurationClient_loadConfigurationsForceRefresh_completionHandler___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    id v8 = (void *)NSString;
    convert_error_to_string_21512(v6);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 stringWithFormat:@"Failed to load the current configurations: %@", v9];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v10 = 0LL;
  }

  id v12 = objc_alloc_init(MEMORY[0x189603FA8]);
  id v13 = *(void **)(a1 + 32);
  if (v13) {
    objc_setProperty_atomic(v13, v11, v12, 40LL);
  }

  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v14 = v5;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v15)
  {
    uint64_t v17 = v15;
    uint64_t v18 = *(void *)v25;
    do
    {
      for (uint64_t i = 0LL; i != v17; ++i)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(v14);
        }
        int v20 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id Property = *(id *)(a1 + 32);
        if (Property) {
          id Property = objc_getProperty(Property, v16, 40LL, 1);
        }
        id v22 = Property;
        uint64_t v23 = (void *)[v20 copy];
        [v22 addObject:v23];
      }

      uint64_t v17 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }

    while (v17);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

uint64_t __78__NEUtilConfigurationClient_loadConfigurationsForceRefresh_completionHandler___block_invoke_2( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)swapConfigurationTypeWithParameters:(void *)a3 errorStr:
{
  if (a1)
  {
    [a2 objectForKeyedSubscript:@"type"];
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    if ([v20 isEqualToString:@"vpn"])
    {
      uint64_t v6 = objc_msgSend(objc_getProperty(a1, v5, 56, 1), "appVPN");
      if (v6)
      {
        id v7 = (void *)v6;
        id v8 = objc_alloc_init(&OBJC_CLASS___NEVPN);
        -[NEVPN setEnabled:](v8, "setEnabled:", [v7 isEnabled]);
        -[NEVPN setOnDemandEnabled:](v8, "setOnDemandEnabled:", [v7 isOnDemandEnabled]);
        -[NEVPN setDisconnectOnDemandEnabled:]( v8,  "setDisconnectOnDemandEnabled:",  [v7 isDisconnectOnDemandEnabled]);
        [v7 onDemandRules];
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NEVPN setOnDemandRules:](v8, "setOnDemandRules:", v9);

        [v7 protocol];
        id v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NEVPN setProtocol:](v8, "setProtocol:", v10);

        objc_msgSend(objc_getProperty(a1, v11, 56, 1), "setAppVPN:", 0);
        objc_msgSend(objc_getProperty(a1, v12, 56, 1), "setVPN:", v8);
LABEL_8:

LABEL_13:
        return;
      }

      [NSString stringWithFormat:@"No configuration found for swapping %@ -> %@", @"appvpn", v20];
    }

    else if ([v20 isEqualToString:@"appvpn"])
    {
      uint64_t v14 = objc_msgSend(objc_getProperty(a1, v13, 56, 1), "VPN");
      if (v14)
      {
        id v7 = (void *)v14;
        id v8 = objc_alloc_init(&OBJC_CLASS___NEVPNApp);
        -[NEVPN setEnabled:](v8, "setEnabled:", [v7 isEnabled]);
        -[NEVPN setOnDemandEnabled:](v8, "setOnDemandEnabled:", [v7 isOnDemandEnabled]);
        -[NEVPN setDisconnectOnDemandEnabled:]( v8,  "setDisconnectOnDemandEnabled:",  [v7 isDisconnectOnDemandEnabled]);
        [v7 onDemandRules];
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NEVPN setOnDemandRules:](v8, "setOnDemandRules:", v15);

        [v7 protocol];
        id v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NEVPN setProtocol:](v8, "setProtocol:", v16);

        -[NEVPN setTunnelType:](v8, "setTunnelType:", 1LL);
        objc_msgSend(objc_getProperty(a1, v17, 56, 1), "setVPN:", 0);
        objc_msgSend(objc_getProperty(a1, v18, 56, 1), "setAppVPN:", v8);
        goto LABEL_8;
      }

      [NSString stringWithFormat:@"No configuration found for swapping %@ -> %@", @"vpn", v20];
    }

    else
    {
      [NSString stringWithFormat:@"Invalid configuration type for swapping: %@", v20, v19];
    }

    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }

void __94__NEUtilConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_644( void *a1,  void *a2)
{
  v17[1] = *MEMORY[0x1895F89C0];
  id v3 = a2;
  id v5 = v3;
  if (v3)
  {
    uint64_t v6 = (void *)NSString;
    uint64_t v7 = a1[4];
    convert_error_to_string_21512(v3);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v6 stringWithFormat:@"Failed to remove configuration %@: %@", v7, v8];
    uint64_t v10 = *(void *)(a1[8] + 8LL);
    SEL v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }

  else
  {
    id Property = (id)a1[5];
    if (Property) {
      id Property = objc_getProperty(Property, v4, 32LL, 1);
    }
    [Property removeObjectIdenticalTo:a1[6]];
    id v14 = (id)a1[5];
    if (v14) {
      id v14 = objc_getProperty(v14, v13, 40LL, 1);
    }
    [v14 removeObjectIdenticalTo:a1[6]];
  }

  uint64_t v15 = a1[7];
  if (*(void *)(*(void *)(a1[8] + 8LL) + 40LL))
  {
    v17[0] = *(void *)(*(void *)(a1[8] + 8LL) + 40LL);
    [MEMORY[0x189603F18] arrayWithObjects:v17 count:1];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v16);
  }

  else
  {
    (*(void (**)(void, void))(v15 + 16))(a1[7], 0LL);
  }
}

- (void)setPPPParameters:(void *)a3 errorStr:
{
  id v5 = a2;
  if (a1)
  {
    uint64_t v109 = v5;
    [a1 protocolForParameters:v5];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      SEL v11 = 0LL;
      SEL v12 = 0LL;
      id v13 = 0LL;
      id v14 = 0LL;
      uint64_t v15 = 0LL;
      id v16 = 0LL;
      *a3 = @"Configuration VPN type is not L2TP";
LABEL_109:

      id v5 = v109;
      goto LABEL_110;
    }

    uint64_t v106 = a3;
    [v109 objectForKeyedSubscript:@"authentication-method"];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

    id v8 = v109;
    if (v7)
    {
      [v109 objectForKeyedSubscript:@"authentication-method"];
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v9 isEqualToString:@"password"])
      {
        uint64_t v10 = 1LL;
      }

      else if ([v9 isEqualToString:@"securID"])
      {
        uint64_t v10 = 2LL;
      }

      else if ([v9 isEqualToString:@"certificate"])
      {
        uint64_t v10 = 3LL;
      }

      else if ([v9 isEqualToString:@"kerberos"])
      {
        uint64_t v10 = 4LL;
      }

      else
      {
        if (([v9 isEqualToString:@"cryptocard"] & 1) == 0)
        {
          [NSString stringWithFormat:@"Invalid %@, valid values are \"password\", \"securID\", \"certificate\", \"kerberos\", and \"cryptocard\", @"authentication-method""];
          *uint64_t v106 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_115;
        }

        uint64_t v10 = 5LL;
      }

      [v6 setAuthenticationMethod:v10];

      id v8 = v109;
    }

    [v8 objectForKeyedSubscript:@"verbose-logging-enabled"];
    SEL v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      [v109 objectForKeyedSubscript:@"verbose-logging-enabled"];
      SEL v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setVerboseLoggingEnabled:", objc_msgSend(v18, "BOOLValue"));
    }

    [v109 objectForKeyedSubscript:@"ipv4-config-method"];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();

    id v20 = v109;
    if (!v19)
    {
LABEL_29:
      [v20 objectForKeyedSubscript:@"ipv4-address"];
      __int128 v27 = (void *)objc_claimAutoreleasedReturnValue();

      self = a1;
      if (v27)
      {
        id v28 = objc_alloc(MEMORY[0x189603F18]);
        [v109 objectForKeyedSubscript:@"ipv4-address"];
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v107 = objc_msgSend(v28, "initWithObjects:", v29, 0);
      }

      else
      {
        uint64_t v107 = 0LL;
      }

      [v109 objectForKeyedSubscript:@"ipv4-subnet-mask"];
      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
      {
        id v31 = objc_alloc(MEMORY[0x189603F18]);
        [v109 objectForKeyedSubscript:@"ipv4-subnet-mask"];
        uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v15 = (void *)objc_msgSend(v31, "initWithObjects:", v32, 0);
      }

      else
      {
        uint64_t v15 = 0LL;
      }

      id v16 = (void *)v107;
      [v109 objectForKeyedSubscript:@"ipv4-router"];
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
      {
        uint64_t v108 = [v109 objectForKeyedSubscript:@"ipv4-router"];
      }

      else
      {
        uint64_t v108 = 0LL;
      }

      uint64_t v34 = [v6 IPv4Settings];
      if (!v34) {
        goto LABEL_43;
      }
      uint64_t v35 = (void *)v34;
      [v6 IPv4Settings];
      uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t v37 = v15;
      uint64_t v38 = [v36 configMethod];

      BOOL v39 = v38 == 3;
      uint64_t v15 = v37;
      if (v39)
      {
        id v40 = -[NEIPv4Settings initWithAddresses:subnetMasks:]( objc_alloc(&OBJC_CLASS___NEIPv4Settings),  "initWithAddresses:subnetMasks:",  v107,  v37);
        [v6 setIPv4Settings:v40];

        [v6 IPv4Settings];
        uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
        [v41 setConfigMethod:3];

        id v14 = (void *)v108;
        if (v108)
        {
          [v109 objectForKeyedSubscript:@"ipv4-router"];
          uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
          [v6 IPv4Settings];
          __int128 v43 = (void *)objc_claimAutoreleasedReturnValue();
          [v43 setRouter:v42];

          uint64_t v15 = v37;
        }
      }

      else
      {
LABEL_43:
        id v14 = (void *)v108;
        if (v107 || v15 || v108)
        {
          [NSString stringWithFormat:@"%@ %@ %@ cannot be specified, %@ is not \"manual\", @"ipv4-address", @"ipv4-subnet-mask", @"ipv4-router", @"ipv4-config-method""];
          id v57 = (id)objc_claimAutoreleasedReturnValue();
          SEL v11 = 0LL;
          SEL v12 = 0LL;
          id v13 = 0LL;
          goto LABEL_88;
        }
      }

      id v105 = v15;
      [v109 objectForKeyedSubscript:@"send-all-traffic"];
      __int128 v44 = (void *)objc_claimAutoreleasedReturnValue();

      if (v44)
      {
        [v6 IPv4Settings];
        uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v45)
        {
          [NSString stringWithFormat:@"%@ cannot be specified, %@ is not \"manual\" or \"ppp\", @"send-all-traffic", @"ipv4-config-method""];
          id v58 = (id)objc_claimAutoreleasedReturnValue();
          SEL v11 = 0LL;
          SEL v12 = 0LL;
          id v13 = 0LL;
LABEL_107:
          *uint64_t v106 = v58;
          goto LABEL_108;
        }

        [v109 objectForKeyedSubscript:@"send-all-traffic"];
        __int128 v46 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v47 = [v46 BOOLValue];
        [v6 IPv4Settings];
        uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue();
        [v48 setOverridePrimary:v47];
      }

      [v109 objectForKeyedSubscript:@"ipv6-config-method"];
      __int128 v49 = (void *)objc_claimAutoreleasedReturnValue();

      uint64_t v50 = v109;
      if (v49)
      {
        [v109 objectForKeyedSubscript:@"ipv6-config-method"];
        uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
        [v6 IPv6Settings];
        uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v52)
        {
          uint64_t v53 = -[NEIPv6Settings initWithConfigMethod:]( objc_alloc(&OBJC_CLASS___NEIPv6Settings),  "initWithConfigMethod:",  1LL);
          [v6 setIPv6Settings:v53];
        }

        if ([v51 isEqualToString:@"automatic"])
        {
          [v6 IPv6Settings];
          uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v55 = v54;
          uint64_t v56 = 1LL;
        }

        else if ([v51 isEqualToString:@"manual"])
        {
          [v6 IPv6Settings];
          uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v55 = v54;
          uint64_t v56 = 2LL;
        }

        else
        {
          if (![v51 isEqualToString:@"link-local"])
          {
            [NSString stringWithFormat:@"Invalid %@, valid values are \"automatic\", \"manual\", and \"link-local\", @"ipv6-config-method""];
            *uint64_t v106 = (id)objc_claimAutoreleasedReturnValue();

            SEL v11 = 0LL;
            SEL v12 = 0LL;
            id v13 = 0LL;
            goto LABEL_108;
          }

          [v6 IPv6Settings];
          uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v55 = v54;
          uint64_t v56 = 3LL;
        }

        [v54 setConfigMethod:v56];

        uint64_t v50 = v109;
      }

      [v50 objectForKeyedSubscript:@"ipv6-address"];
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      if (v59)
      {
        id v60 = objc_alloc(MEMORY[0x189603F18]);
        [v109 objectForKeyedSubscript:@"ipv6-address"];
        int v61 = (void *)objc_claimAutoreleasedReturnValue();
        id v13 = (void *)objc_msgSend(v60, "initWithObjects:", v61, 0);
      }

      else
      {
        id v13 = 0LL;
      }

      [v109 objectForKeyedSubscript:@"ipv6-prefix-length"];
      SEL v62 = (void *)objc_claimAutoreleasedReturnValue();

      if (v62)
      {
        id v63 = objc_alloc(MEMORY[0x189603F18]);
        [v109 objectForKeyedSubscript:@"ipv6-prefix-length"];
        id v64 = (void *)objc_claimAutoreleasedReturnValue();
        SEL v12 = (void *)objc_msgSend(v63, "initWithObjects:", v64, 0);
      }

      else
      {
        SEL v12 = 0LL;
      }

      [v109 objectForKeyedSubscript:@"ipv6-router"];
      uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue();

      if (v65)
      {
        [v109 objectForKeyedSubscript:@"ipv6-router"];
        SEL v11 = (void *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        SEL v11 = 0LL;
      }

      uint64_t v66 = [v6 IPv6Settings];
      if (v66
        && (id v67 = (void *)v66,
            [v6 IPv6Settings],
            id v68 = (void *)objc_claimAutoreleasedReturnValue(),
            uint64_t v69 = [v68 configMethod],
            v68,
            v67,
            v69 == 2))
      {
        uint64_t v70 = -[NEIPv6Settings initWithAddresses:networkPrefixLengths:]( objc_alloc(&OBJC_CLASS___NEIPv6Settings),  "initWithAddresses:networkPrefixLengths:",  v13,  v12);
        [v6 setIPv6Settings:v70];

        [v6 IPv6Settings];
        id v71 = (void *)objc_claimAutoreleasedReturnValue();
        [v71 setConfigMethod:2];

        [v6 IPv6Settings];
        uint64_t v72 = (void *)objc_claimAutoreleasedReturnValue();

        if (v72)
        {
          [v109 objectForKeyedSubscript:@"ipv6-router"];
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          [v6 IPv6Settings];
          uint64_t v74 = (void *)objc_claimAutoreleasedReturnValue();
          [v74 setRouter:v73];
        }
      }

      else if (v13 || v12 || v11)
      {
        [NSString stringWithFormat:@"%@ %@ %@ cannot be specified, %@ is not \"manual\", @"ipv6-address", @"ipv6-prefix-length", @"ipv6-router", @"ipv6-config-method""];
        id v78 = (id)objc_claimAutoreleasedReturnValue();
        id v79 = v106;
        id v16 = (void *)v107;
        goto LABEL_84;
      }

      [v109 objectForKeyedSubscript:@"machine-authentication-method"];
      uint64_t v75 = (void *)objc_claimAutoreleasedReturnValue();

      id v16 = (void *)v107;
      id v14 = (void *)v108;
      if (!v75)
      {
LABEL_92:
        id v80 = @"shared-secret";
        [v109 objectForKeyedSubscript:@"shared-secret"];
        uint64_t v81 = (void *)objc_claimAutoreleasedReturnValue();

        if (v81)
        {
          if ([v6 type] != 2) {
            goto LABEL_106;
          }
          int v82 = objc_alloc(&OBJC_CLASS___NEKeychainItem);
          [v109 objectForKeyedSubscript:@"shared-secret"];
          uint64_t v84 = (void *)objc_claimAutoreleasedReturnValue();
          if (v6)
          {
            uint64_t v85 = v6[10];
            id Property = objc_getProperty(v6, v83, 88LL, 1);
          }

          else
          {
            uint64_t v85 = 0LL;
            id Property = 0LL;
          }

          id v87 = Property;
          uint64_t v88 = -[NEKeychainItem initWithPassword:domain:accessGroup:]( v82,  "initWithPassword:domain:accessGroup:",  v84,  v85,  v87);
          [v6 setSharedSecretKeychainItem:v88];

          id v16 = (void *)v107;
          id v14 = (void *)v108;
        }

        id v80 = @"local-identifier";
        [v109 objectForKeyedSubscript:@"local-identifier"];
        int v89 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v89)
        {
LABEL_100:
          id v80 = @"machine-identity";
          [v109 objectForKeyedSubscript:@"machine-identity"];
          id v91 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v91)
          {
LABEL_108:
            uint64_t v15 = v105;
            goto LABEL_109;
          }

          if ([v6 type] == 2)
          {
            [v109 objectForKeyedSubscript:@"machine-identity"];
            __int128 v92 = (void *)objc_claimAutoreleasedReturnValue();
            unint64_t v93 = [v92 integerValue];

            id v95 = objc_getProperty(self, v94, 48LL, 1);
            if (v95)
            {
              v97 = v95;
              unint64_t v98 = objc_msgSend(objc_getProperty(self, v96, 48, 1), "count");

              if (v93 < v98)
              {
                objc_msgSend(objc_getProperty(self, v99, 48, 1), "objectAtIndexedSubscript:", v93);
                v100 = (void *)objc_claimAutoreleasedReturnValue();
                [v100 objectForKeyedSubscript:@"domain"];
                v101 = (void *)objc_claimAutoreleasedReturnValue();
                uint64_t v102 = [v101 integerValue];

                if (v102)
                {
                  [NSString stringWithFormat:@"Invalid %@, an identity in the system keychain is required", @"machine-identity"];
                  *uint64_t v106 = (id)objc_claimAutoreleasedReturnValue();
                }

                else
                {
                  [v100 objectForKeyedSubscript:@"persistent-reference"];
                  v103 = (void *)objc_claimAutoreleasedReturnValue();
                  [v6 setMachineIdentityReference:v103];
                }

                goto LABEL_85;
              }
            }

            [NSString stringWithFormat:@"Invalid %@ index, use the list-identities command to obtain a list of available identities and their indicies", @"machine-identity"];
            id v78 = (id)objc_claimAutoreleasedReturnValue();
            id v79 = v106;
LABEL_84:
            void *v79 = v78;
LABEL_85:
            uint64_t v15 = v105;
LABEL_86:
            id v14 = (void *)v108;
            goto LABEL_109;
          }

          goto LABEL_106;
        }

        if ([v6 type] == 2)
        {
          [v109 objectForKeyedSubscript:@"local-identifier"];
          uint64_t v90 = (void *)objc_claimAutoreleasedReturnValue();
          [v6 setLocalIdentifier:v90];

          goto LABEL_100;
        }

- (void)unsetPPPParameters:(void *)a3 errorStr:
{
  id v5 = a2;
  if (a1)
  {
    __int128 v43 = v5;
    [a1 protocolForParameters:v5];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v16 = 0LL;
      SEL v17 = 0LL;
      SEL v18 = 0LL;
      uint64_t v19 = 0LL;
      *a3 = @"Configuration VPN type is not L2TP";
LABEL_59:

      id v5 = v43;
      goto LABEL_60;
    }

    [v43 objectForKeyedSubscript:@"authentication-method"];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7) {
      [v6 setAuthenticationMethod:1];
    }
    [v43 objectForKeyedSubscript:@"send-all-traffic"];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      [v6 IPv4Settings];
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        [v6 IPv4Settings];
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 setOverridePrimary:0];
      }
    }

    [v43 objectForKeyedSubscript:@"verbose-logging-enabled"];
    SEL v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11) {
      [v6 setVerboseLoggingEnabled:0];
    }
    [v43 objectForKeyedSubscript:@"ipv4-config-method"];
    SEL v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      [v6 IPv4Settings];
      id v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        [v6 IPv4Settings];
        id v14 = (void *)objc_claimAutoreleasedReturnValue();
        [v14 setConfigMethod:2];
      }
    }

    [v43 objectForKeyedSubscript:@"ipv4-address"];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      id v16 = 0LL;
    }

    else
    {
      [v6 IPv4Settings];
      id v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        [v6 IPv4Settings];
        id v20 = (void *)objc_claimAutoreleasedReturnValue();
        [v20 addresses];
        id v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }

    [v43 objectForKeyedSubscript:@"ipv4-subnet-mask"];
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      SEL v17 = 0LL;
    }

    else
    {
      [v6 IPv4Settings];
      SEL v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        [v6 IPv4Settings];
        id v22 = (void *)objc_claimAutoreleasedReturnValue();
        [v22 subnetMasks];
        SEL v17 = (void *)objc_claimAutoreleasedReturnValue();
      }

      if (!v15)
      {
LABEL_24:
        [v43 objectForKeyedSubscript:@"ipv4-router"];
        __int128 v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          [v6 IPv4Settings];
          __int128 v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25)
          {
            [v6 IPv4Settings];
            uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
            [v26 setRouter:0];
          }
        }

        [v43 objectForKeyedSubscript:@"ipv6-config-method"];
        __int128 v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
        {
          [v6 IPv6Settings];
          id v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (v28)
          {
            [v6 IPv6Settings];
            uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
            [v29 setConfigMethod:1];
          }
        }

        [v43 objectForKeyedSubscript:@"ipv6-address"];
        uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (v30)
        {
          SEL v18 = 0LL;
        }

        else
        {
          [v6 IPv6Settings];
          SEL v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            [v6 IPv6Settings];
            id v31 = (void *)objc_claimAutoreleasedReturnValue();
            [v31 addresses];
            SEL v18 = (void *)objc_claimAutoreleasedReturnValue();
          }
        }

        [v43 objectForKeyedSubscript:@"ipv6-prefix-length"];
        uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (v32)
        {
          uint64_t v19 = 0LL;
        }

        else
        {
          [v6 IPv6Settings];
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            [v6 IPv6Settings];
            uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
            [v33 networkPrefixLengths];
            uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
          }

          if (!v30) {
            goto LABEL_40;
          }
        }

        uint64_t v34 = -[NEIPv6Settings initWithAddresses:networkPrefixLengths:]( objc_alloc(&OBJC_CLASS___NEIPv6Settings),  "initWithAddresses:networkPrefixLengths:",  v18,  v19);
        [v6 setIPv6Settings:v34];

LABEL_40:
        [v43 objectForKeyedSubscript:@"ipv6-router"];
        uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (v35)
        {
          [v6 IPv6Settings];
          uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();

          if (v36)
          {
            [v6 IPv6Settings];
            unint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
            [v37 setRouter:0];
          }
        }

        [v43 objectForKeyedSubscript:@"machine-authentication-method"];
        uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (v38)
        {
          if ([v6 type] == 2)
          {
            [v6 setMachineAuthenticationMethod:1];
          }

          else
          {
            [NSString stringWithFormat:@"Invalid %@, VPN type is not L2TP", @"machine-authentication-method"];
            *a3 = (id)objc_claimAutoreleasedReturnValue();
          }
        }

        [v43 objectForKeyedSubscript:@"shared-secret"];
        BOOL v39 = (void *)objc_claimAutoreleasedReturnValue();

        if (v39)
        {
          if ([v6 type] == 2)
          {
            [v6 sharedSecretKeychainItem];
            id v40 = (void *)objc_claimAutoreleasedReturnValue();
            [v40 setIdentifier:0];
          }

          else
          {
            [NSString stringWithFormat:@"Invalid %@, VPN type is not L2TP", @"shared-secret"];
            *a3 = (id)objc_claimAutoreleasedReturnValue();
          }
        }

        [v43 objectForKeyedSubscript:@"local-identifier"];
        uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();

        if (v41)
        {
          if ([v6 type] == 2)
          {
            [v6 setLocalIdentifier:0];
          }

          else
          {
            [NSString stringWithFormat:@"Invalid %@, VPN type is not L2TP", @"shared-secret"];
            *a3 = (id)objc_claimAutoreleasedReturnValue();
          }
        }

        [v43 objectForKeyedSubscript:@"machine-identity"];
        uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();

        if (v42)
        {
          if ([v6 type] == 2)
          {
            [v6 setMachineIdentityReference:0];
          }

          else
          {
            [NSString stringWithFormat:@"Invalid %@, VPN type is not L2TP", @"machine-identity"];
            *a3 = (id)objc_claimAutoreleasedReturnValue();
          }
        }

        goto LABEL_59;
      }
    }

    uint64_t v23 = -[NEIPv4Settings initWithAddresses:subnetMasks:]( objc_alloc(&OBJC_CLASS___NEIPv4Settings),  "initWithAddresses:subnetMasks:",  v16,  v17);
    [v6 setIPv4Settings:v23];

    goto LABEL_24;
  }

- (void)addAppRuleWithParameters:(void *)a3 errorStr:
{
  v55[1] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    id v5 = a2;
    [v5 objectForKeyedSubscript:@"match-signing-identifier"];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 objectForKeyedSubscript:@"match-path"];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 objectForKeyedSubscript:@"match-domains"];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 objectForKeyedSubscript:@"match-account-identifiers"];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v11 = objc_msgSend(objc_getProperty(a1, v10, 56, 1), "appVPN");

    if (v11)
    {
      uint64_t v11 = objc_msgSend(objc_getProperty(a1, v12, 56, 1), "appVPN");
    }

    objc_msgSend(objc_getProperty(a1, v12, 56, 1), "contentFilter");
    id v13 = (void *)objc_claimAutoreleasedReturnValue();

    id Property = objc_getProperty(a1, v14, 56LL, 1);
    if (v13)
    {
      [Property contentFilter];
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v16 perApp];
      SEL v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        uint64_t v19 = objc_alloc_init(&OBJC_CLASS___NEPerApp);
        objc_msgSend(objc_getProperty(a1, v20, 56, 1), "contentFilter");
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
        [v21 setPerApp:v19];
      }

      objc_msgSend(objc_getProperty(a1, v18, 56, 1), "contentFilter");
      id v22 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      [Property dnsProxy];
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();

      id v25 = objc_getProperty(a1, v24, 56LL, 1);
      if (v23)
      {
        [v25 dnsProxy];
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
        [v26 perApp];
        __int128 v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v27)
        {
          uint64_t v29 = objc_alloc_init(&OBJC_CLASS___NEPerApp);
          objc_msgSend(objc_getProperty(a1, v30, 56, 1), "dnsProxy");
          id v31 = (void *)objc_claimAutoreleasedReturnValue();
          [v31 setPerApp:v29];
        }

        objc_msgSend(objc_getProperty(a1, v28, 56, 1), "dnsProxy");
        id v22 = (void *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        uint64_t v32 = [v25 relay];

        if (!v32) {
          goto LABEL_17;
        }
        objc_msgSend(objc_getProperty(a1, v33, 56, 1), "relay");
        uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
        [v34 perApp];
        uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v35)
        {
          unint64_t v37 = objc_alloc_init(&OBJC_CLASS___NEPerApp);
          objc_msgSend(objc_getProperty(a1, v38, 56, 1), "relay");
          BOOL v39 = (void *)objc_claimAutoreleasedReturnValue();
          [v39 setPerApp:v37];
        }

        objc_msgSend(objc_getProperty(a1, v36, 56, 1), "relay");
        id v22 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }

    id v40 = v22;
    uint64_t v32 = [v22 perApp];

LABEL_17:
    if (!(v11 | v32))
    {
      *a3 = @"No perApp configuration present to apply app rules to";
LABEL_41:

      return;
    }

    if (v11) {
      uint64_t v41 = (void *)v11;
    }
    else {
      uint64_t v41 = (void *)v32;
    }
    uint64_t v42 = (NEAppRule *)[v41 copyAppRuleByID:v6];
    if (v42)
    {
      if (v11)
      {
LABEL_24:
        __int128 v43 = (void *)v11;
LABEL_27:
        [v43 removeAppRuleByID:v6];
        -[NEAppRule setMatchPath:](v42, "setMatchPath:", v7);
        if (isa_nsarray(v8))
        {
          -[NEAppRule setMatchDomains:](v42, "setMatchDomains:", v8);
        }

        else if (isa_nsstring(v8))
        {
          v55[0] = v8;
          [MEMORY[0x189603F18] arrayWithObjects:v55 count:1];
          __int128 v44 = (void *)objc_claimAutoreleasedReturnValue();
          -[NEAppRule setMatchDomains:](v42, "setMatchDomains:", v44);
        }

        if (isa_nsarray(v9))
        {
          -[NEAppRule setMatchAccountIdentifiers:](v42, "setMatchAccountIdentifiers:", v9);
        }

        else if (isa_nsstring(v9))
        {
          uint64_t v54 = v9;
          [MEMORY[0x189603F18] arrayWithObjects:&v54 count:1];
          uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();
          -[NEAppRule setMatchAccountIdentifiers:](v42, "setMatchAccountIdentifiers:", v45);
        }

        id v46 = objc_alloc(MEMORY[0x189603FA8]);
        if (v11)
        {
          [(id)v11 appRules];
          uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v48 = (void *)[v46 initWithArray:v47];

          [v48 addObject:v42];
          __int128 v49 = (void *)v11;
        }

        else
        {
          [(id)v32 appRules];
          uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v48 = (void *)[v46 initWithArray:v50];

          [v48 addObject:v42];
          __int128 v49 = (void *)v32;
        }

        [v49 setAppRules:v48];
        objc_msgSend(objc_getProperty(a1, v51, 56, 1), "externalIdentifier");
        uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v52) {
          objc_msgSend(objc_getProperty(a1, v53, 56, 1), "setExternalIdentifier:", @"NEUTIL-PERAPP-UUID");
        }

        goto LABEL_41;
      }
    }

    else
    {
      uint64_t v42 = -[NEAppRule initWithSigningIdentifier:]( objc_alloc(&OBJC_CLASS___NEAppRule),  "initWithSigningIdentifier:",  v6);
      if (v11) {
        goto LABEL_24;
      }
    }

    __int128 v43 = (void *)v32;
    goto LABEL_27;
  }

- (void)removeAppRuleWithParameters:(void *)a3 errorStr:
{
  uint64_t v50 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  uint64_t v6 = v5;
  if (a1)
  {
    [v5 objectForKeyedSubscript:@"match-signing-identifier"];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = objc_msgSend(objc_getProperty(a1, v8, 56, 1), "appVPN");

    if (v9)
    {
      uint64_t v9 = objc_msgSend(objc_getProperty(a1, v10, 56, 1), "appVPN");
    }

    objc_msgSend(objc_getProperty(a1, v10, 56, 1), "contentFilter");
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

    id Property = objc_getProperty(a1, v12, 56LL, 1);
    if (v11)
    {
      [Property contentFilter];
      SEL v14 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      [Property dnsProxy];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

      id v17 = objc_getProperty(a1, v16, 56LL, 1);
      if (v15)
      {
        [v17 dnsProxy];
        SEL v14 = (void *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        uint64_t v18 = [v17 relay];

        if (!v18) {
          goto LABEL_11;
        }
        objc_msgSend(objc_getProperty(a1, v19, 56, 1), "relay");
        SEL v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }

    SEL v20 = v14;
    uint64_t v18 = [v14 perApp];

LABEL_11:
    if (!(v9 | v18))
    {
      *a3 = @"No perApp configuration present to apply app rules to";
LABEL_39:

      goto LABEL_40;
    }

    __int128 v43 = a3;
    id v21 = objc_alloc(MEMORY[0x189603FA8]);
    __int128 v44 = v6;
    if (v9) {
      id v22 = (void *)v9;
    }
    else {
      id v22 = (void *)v18;
    }
    [v22 appRules];
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    SEL v24 = (void *)[v21 initWithArray:v23];

    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    id v25 = v24;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v45 objects:v49 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v41 = (void *)v18;
      uint64_t v42 = (void *)v9;
      id v28 = 0LL;
      uint64_t v29 = *(void *)v46;
      do
      {
        for (uint64_t i = 0LL; i != v27; ++i)
        {
          if (*(void *)v46 != v29) {
            objc_enumerationMutation(v25);
          }
          id v31 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          objc_msgSend(v31, "matchSigningIdentifier", v41, v42);
          uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
          int v33 = [v32 isEqualToString:v7];

          if (v33)
          {
            id v34 = v31;

            id v28 = v34;
          }
        }

        uint64_t v27 = [v25 countByEnumeratingWithState:&v45 objects:v49 count:16];
      }

      while (v27);

      uint64_t v18 = (uint64_t)v41;
      uint64_t v9 = (uint64_t)v42;
      if (v28)
      {
        [v25 removeObject:v28];
        uint64_t v6 = v44;
        if ([v25 count])
        {
          if (v42) {
            uint64_t v35 = v42;
          }
          else {
            uint64_t v35 = v41;
          }
          [v35 setAppRules:v25];
        }

        else
        {
          if (v42) {
            uint64_t v36 = v42;
          }
          else {
            uint64_t v36 = v41;
          }
          [v36 setAppRules:0];
          objc_msgSend(objc_getProperty(a1, v37, 56, 1), "externalIdentifier");
          SEL v38 = (void *)objc_claimAutoreleasedReturnValue();
          int v39 = [v38 isEqualToString:@"NEUTIL-PERAPP-UUID"];

          if (v39) {
            objc_msgSend(objc_getProperty(a1, v40, 56, 1), "setExternalIdentifier:", 0);
          }
        }

        goto LABEL_38;
      }
    }

    else
    {
    }

    id v28 = 0LL;
    uint64_t v6 = v44;
    *__int128 v43 = @"No matched rule";
LABEL_38:

    goto LABEL_39;
  }

- (void)setPathControllerWithParameters:(void *)a3 errorStr:
{
  id v5 = a2;
  if (a1)
  {
    id v22 = v5;
    objc_msgSend(objc_getProperty(a1, v6, 56, 1), "pathController");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      *a3 = @"No Path Controller configuration present";
LABEL_18:
      id v5 = v22;
      goto LABEL_19;
    }

    [v22 objectForKeyedSubscript:@"enabled"];
    SEL v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      [v22 objectForKeyedSubscript:@"enabled"];
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v10 = [v9 BOOLValue];
      objc_msgSend(objc_getProperty(a1, v11, 56, 1), "pathController");
      SEL v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 setEnabled:v10];
    }

    [v22 objectForKeyedSubscript:@"cellular-fallback"];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v13 isEqualToString:@"default"])
    {
      objc_msgSend(objc_getProperty(a1, v14, 56, 1), "pathController");
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      SEL v16 = v15;
      uint64_t v17 = 0LL;
    }

    else if ([v13 isEqualToString:@"none"])
    {
      objc_msgSend(objc_getProperty(a1, v18, 56, 1), "pathController");
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      SEL v16 = v15;
      uint64_t v17 = 1LL;
    }

    else if ([v13 isEqualToString:@"foreground"])
    {
      objc_msgSend(objc_getProperty(a1, v19, 56, 1), "pathController");
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      SEL v16 = v15;
      uint64_t v17 = 3LL;
    }

    else if ([v13 isEqualToString:@"background"])
    {
      objc_msgSend(objc_getProperty(a1, v20, 56, 1), "pathController");
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      SEL v16 = v15;
      uint64_t v17 = 7LL;
    }

    else
    {
      if (![v13 isEqualToString:@"all"])
      {
LABEL_17:

        goto LABEL_18;
      }

      objc_msgSend(objc_getProperty(a1, v21, 56, 1), "pathController");
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      SEL v16 = v15;
      uint64_t v17 = 11LL;
    }

    [v15 setCellularFallbackFlags:v17];

    goto LABEL_17;
  }

- (void)addPathRuleWithParameters:(const __CFString *)a3 errorStr:
{
  v38[1] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    id v5 = a2;
    [v5 objectForKeyedSubscript:@"match-signing-identifier"];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 objectForKeyedSubscript:@"match-path"];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 objectForKeyedSubscript:@"match-domains"];
    SEL v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 objectForKeyedSubscript:@"match-account-identifiers"];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 objectForKeyedSubscript:@"cellular-behavior"];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 objectForKeyedSubscript:@"wifi-behavior"];
    SEL v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(objc_getProperty(a1, v12, 56, 1), "pathController");
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    SEL v14 = (NEPathRule *)[v13 copyPathRuleBySigningIdentifier:v6];

    if (!v14) {
      SEL v14 = -[NEAppRule initWithSigningIdentifier:]( objc_alloc(&OBJC_CLASS___NEPathRule),  "initWithSigningIdentifier:",  v6);
    }
    objc_msgSend(objc_getProperty(a1, v15, 56, 1), "pathController");
    SEL v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 removePathRuleBySigningIdentifier:v6];

    -[NEAppRule setMatchPath:](v14, "setMatchPath:", v7);
    if (isa_nsarray(v8))
    {
      -[NEAppRule setMatchDomains:](v14, "setMatchDomains:", v8);
    }

    else if (isa_nsstring(v8))
    {
      v38[0] = v8;
      [MEMORY[0x189603F18] arrayWithObjects:v38 count:1];
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEAppRule setMatchDomains:](v14, "setMatchDomains:", v17);
    }

    if (isa_nsarray(v9))
    {
      -[NEAppRule setMatchAccountIdentifiers:](v14, "setMatchAccountIdentifiers:", v9);
    }

    else if (isa_nsstring(v9))
    {
      SEL v37 = v9;
      [MEMORY[0x189603F18] arrayWithObjects:&v37 count:1];
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEAppRule setMatchAccountIdentifiers:](v14, "setMatchAccountIdentifiers:", v19);
    }

    if (v10)
    {
      if ([v10 isEqualToString:@"allow"])
      {
        uint64_t v20 = 0LL;
      }

      else if ([v10 isEqualToString:@"deny"])
      {
        uint64_t v20 = 1LL;
      }

      else
      {
        if (([v10 isEqualToString:@"allow-while-roaming"] & 1) == 0)
        {
          uint64_t v35 = @"Cellular behavior value not recognized";
          goto LABEL_31;
        }

        uint64_t v20 = 2LL;
      }

      -[NEPathRule setCellularBehavior:](v14, "setCellularBehavior:", v20);
    }

    if (v11)
    {
      if ([v11 isEqualToString:@"allow"])
      {
        uint64_t v21 = 0LL;
      }

      else if ([v11 isEqualToString:@"deny"])
      {
        uint64_t v21 = 1LL;
      }

      else
      {
        if (([v11 isEqualToString:@"allow-while-roaming"] & 1) == 0)
        {
          uint64_t v35 = @"WiFi behavior value not recognized";
          goto LABEL_31;
        }

        uint64_t v21 = 2LL;
      }

      -[NEPathRule setWifiBehavior:](v14, "setWifiBehavior:", v21);
    }

    objc_msgSend(objc_getProperty(a1, v18, 56, 1), "pathController");
    id v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      id v23 = objc_alloc(MEMORY[0x189603FA8]);
      objc_msgSend(objc_getProperty(a1, v24, 56, 1), "pathController");
      id v25 = (void *)objc_claimAutoreleasedReturnValue();
      [v25 pathRules];
      uint64_t v36 = v9;
      uint64_t v26 = v10;
      uint64_t v27 = v11;
      id v28 = v8;
      uint64_t v29 = v6;
      SEL v30 = v7;
      id v31 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v32 = (void *)[v23 initWithArray:v31];

      [v32 addObject:v14];
      objc_msgSend(objc_getProperty(a1, v33, 56, 1), "pathController");
      id v34 = (void *)objc_claimAutoreleasedReturnValue();
      [v34 setPathRules:v32];

      uint64_t v7 = v30;
      uint64_t v6 = v29;
      SEL v8 = v28;
      SEL v11 = v27;
      uint64_t v10 = v26;
      uint64_t v9 = v36;

LABEL_32:
      return;
    }

    uint64_t v35 = @"No Path Controller configuration present to apply path rules to";
LABEL_31:
    *a3 = v35;
    goto LABEL_32;
  }

- (void)removePathRuleWithParameters:(void *)a3 errorStr:
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    [a2 objectForKeyedSubscript:@"match-signing-identifier"];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(objc_getProperty(a1, v6, 56, 1), "pathController");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      id v8 = objc_alloc(MEMORY[0x189603FA8]);
      objc_msgSend(objc_getProperty(a1, v9, 56, 1), "pathController");
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 pathRules];
      SEL v11 = (void *)objc_claimAutoreleasedReturnValue();
      SEL v12 = (void *)[v8 initWithArray:v11];

      if ([v12 count])
      {
        __int128 v30 = 0u;
        __int128 v31 = 0u;
        __int128 v28 = 0u;
        __int128 v29 = 0u;
        objc_msgSend(objc_getProperty(a1, v13, 56, 1), "pathController", 0);
        SEL v14 = (void *)objc_claimAutoreleasedReturnValue();
        [v14 pathRules];
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

        uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v29;
          do
          {
            for (uint64_t i = 0LL; i != v17; ++i)
            {
              if (*(void *)v29 != v18) {
                objc_enumerationMutation(v15);
              }
              uint64_t v20 = *(void **)(*((void *)&v28 + 1) + 8 * i);
              [v20 matchSigningIdentifier];
              uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
              int v22 = [v21 isEqualToString:v5];

              if (v22) {
                [v12 removeObject:v20];
              }
            }

            uint64_t v17 = [v15 countByEnumeratingWithState:&v28 objects:v32 count:16];
          }

          while (v17);
        }

        uint64_t v23 = [v12 count];
        objc_msgSend(objc_getProperty(a1, v24, 56, 1), "pathController");
        id v25 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v26 = v25;
        if (v23) {
          uint64_t v27 = v12;
        }
        else {
          uint64_t v27 = 0LL;
        }
        [v25 setPathRules:v27];
      }

      else
      {
        *a3 = @"No rules present";
      }
    }

    else
    {
      *a3 = @"No Path Controller configuration present to apply app rules to";
    }
  }

void __94__NEUtilConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_2_650( uint64_t a1,  void *a2)
{
  uint64_t v86 = *MEMORY[0x1895F89C0];
  [a2 objectForKeyedSubscript:@"UserMap"];
  id v60 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = *(void **)(a1 + 32);
  if (v4)
  {
    id v5 = objc_getProperty(v4, v3, 40LL, 1);
    if (v5)
    {
      uint64_t v7 = v5;
      id Property = *(id *)(a1 + 32);
      if (Property) {
        id Property = objc_getProperty(Property, v6, 40LL, 1);
      }
      uint64_t v9 = [Property count];

      if (v9)
      {
        __int128 v79 = 0u;
        __int128 v80 = 0u;
        __int128 v77 = 0u;
        __int128 v78 = 0u;
        id v10 = *(id *)(a1 + 32);
        if (v10) {
          id v10 = objc_getProperty(v10, v6, 40LL, 1);
        }
        obuint64_t j = v10;
        uint64_t v61 = [obj countByEnumeratingWithState:&v77 objects:v85 count:16];
        if (v61)
        {
          uint64_t v58 = *(void *)v78;
          uint64_t v59 = a1;
          do
          {
            uint64_t v11 = 0LL;
            do
            {
              if (*(void *)v78 != v58) {
                objc_enumerationMutation(obj);
              }
              uint64_t v62 = v11;
              SEL v12 = *(void **)(*((void *)&v77 + 1) + 8 * v11);
              id v13 = (void *)NSString;
              [v12 name];
              SEL v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "stringWithFormat:", @"%@ (Users:"), v14;
              uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

              id v63 = objc_alloc_init(MEMORY[0x189603FA8]);
              __int128 v73 = 0u;
              __int128 v74 = 0u;
              __int128 v75 = 0u;
              __int128 v76 = 0u;
              id v16 = v60;
              uint64_t v17 = [v16 countByEnumeratingWithState:&v73 objects:v84 count:16];
              if (v17)
              {
                uint64_t v18 = v17;
                uint64_t v19 = *(void *)v74;
                do
                {
                  for (uint64_t i = 0LL; i != v18; ++i)
                  {
                    if (*(void *)v74 != v19) {
                      objc_enumerationMutation(v16);
                    }
                    uint64_t v21 = *(void *)(*((void *)&v73 + 1) + 8 * i);
                    [v16 objectForKeyedSubscript:v21];
                    int v22 = (void *)objc_claimAutoreleasedReturnValue();
                    [v12 identifier];
                    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
                    int v24 = [v22 containsObject:v23];

                    if (v24) {
                      [v63 addObject:v21];
                    }
                  }

                  uint64_t v18 = [v16 countByEnumeratingWithState:&v73 objects:v84 count:16];
                }

                while (v18);
              }

              id v25 = v63;
              if ([v63 count])
              {
                __int128 v71 = 0u;
                __int128 v72 = 0u;
                __int128 v69 = 0u;
                __int128 v70 = 0u;
                id v26 = v63;
                uint64_t v27 = [v26 countByEnumeratingWithState:&v69 objects:v83 count:16];
                a1 = v59;
                if (v27)
                {
                  uint64_t v28 = v27;
                  uint64_t v29 = *(void *)v70;
                  do
                  {
                    uint64_t v30 = 0LL;
                    __int128 v31 = v15;
                    do
                    {
                      if (*(void *)v70 != v29) {
                        objc_enumerationMutation(v26);
                      }
                      uint64_t v32 = *(void **)(*((void *)&v69 + 1) + 8 * v30);
                      *(void *)id_type = 0LL;
                      [v32 getUUIDBytes:uu];
                      mbr_uuid_to_id(uu, (id_t *)id_type, &id_type[1]);
                      if (id_type[0]
                        && (uint64_t v33 = getpwuid(id_type[0])) != 0LL
                        && (pw_name = v33->pw_name) != 0LL
                        && *pw_name)
                      {
                        uint64_t v35 = id_type[0];
                        [v32 UUIDString];
                        uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
                        [v31 stringByAppendingFormat:@" %s(%d)[%@]", pw_name, v35, v36];
                      }

                      else
                      {
                        uint64_t v37 = id_type[0];
                        [v32 UUIDString];
                        uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
                        [v31 stringByAppendingFormat:@" %d[%@]", v37, v36, v56];
                      }

                      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

                      ++v30;
                      __int128 v31 = v15;
                    }

                    while (v28 != v30);
                    uint64_t v28 = [v26 countByEnumeratingWithState:&v69 objects:v83 count:16];
                  }

                  while (v28);
                }

                [v15 stringByAppendingString:@"\n"]);
                SEL v38 = (void *)objc_claimAutoreleasedReturnValue();
                id v25 = v63;
              }

              else
              {
                [v15 stringByAppendingString:@" None\n"]);
                SEL v38 = (void *)objc_claimAutoreleasedReturnValue();
                a1 = v59;
              }

              [*(id *)(a1 + 40) addObject:v38];
              uint64_t v11 = v62 + 1;
            }

            while (v62 + 1 != v61);
            uint64_t v61 = [obj countByEnumeratingWithState:&v77 objects:v85 count:16];
          }

          while (v61);
        }
      }
    }

    int v39 = *(void **)(a1 + 32);
    if (v39)
    {
      id v40 = objc_getProperty(v39, v6, 32LL, 1);
      if (v40)
      {
        uint64_t v42 = v40;
        id v43 = *(id *)(a1 + 32);
        if (v43) {
          id v43 = objc_getProperty(v43, v41, 32LL, 1);
        }
        uint64_t v44 = [v43 count];

        if (v44)
        {
          [*(id *)(a1 + 40) addObject:@"New Configurations:\n"];
          __int128 v66 = 0u;
          __int128 v67 = 0u;
          __int128 v64 = 0u;
          __int128 v65 = 0u;
          id v46 = *(id *)(a1 + 32);
          if (v46) {
            id v46 = objc_getProperty(v46, v45, 32LL, 1);
          }
          id v47 = v46;
          uint64_t v48 = [v47 countByEnumeratingWithState:&v64 objects:v81 count:16];
          if (v48)
          {
            uint64_t v49 = v48;
            uint64_t v50 = *(void *)v65;
            do
            {
              for (uint64_t j = 0LL; j != v49; ++j)
              {
                if (*(void *)v65 != v50) {
                  objc_enumerationMutation(v47);
                }
                uint64_t v52 = *(void **)(a1 + 40);
                uint64_t v53 = (void *)NSString;
                [*(id *)(*((void *)&v64 + 1) + 8 * j) name];
                uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue();
                [v53 stringWithFormat:@"%@\n", v54];
                uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue();
                [v52 addObject:v55];
              }

              uint64_t v49 = [v47 countByEnumeratingWithState:&v64 objects:v81 count:16];
            }

            while (v49);
          }
        }
      }
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void __94__NEUtilConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_3_662( uint64_t a1,  void *a2)
{
  id v3 = a2;
  id v12 = v3;
  if (v3)
  {
    id v5 = (void *)NSString;
    uint64_t v6 = *(void *)(a1 + 32);
    convert_error_to_string_21512(v3);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 stringWithFormat:@"Failed to save configuration %@: %@", v6, v7];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();

    [*(id *)(a1 + 40) addObject:v8];
  }

  else
  {
    id Property = *(id *)(a1 + 48);
    if (Property) {
      id Property = objc_getProperty(Property, v4, 32LL, 1);
    }
    [Property removeObjectIdenticalTo:*(void *)(a1 + 56)];
    id v11 = *(id *)(a1 + 48);
    if (v11) {
      id v11 = objc_getProperty(v11, v10, 40LL, 1);
    }
    [v11 addObject:*(void *)(a1 + 56)];
  }

  (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
}

- (void)setAlwaysOnParameters:(const __CFString *)a3 errorStr:
{
  id v42 = a2;
  if (a1)
  {
    objc_msgSend(objc_getProperty(a1, v5, 56, 1), "alwaysOnVPN");
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6) {
      *a3 = @"Requires AlwaysOn configuraton";
    }
    [v42 objectForKeyedSubscript:@"ui-toggle-enabled"];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      [v42 objectForKeyedSubscript:@"ui-toggle-enabled"];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setToggleEnabled:", objc_msgSend(v8, "BOOLValue"));
    }

    [v42 objectForKeyedSubscript:@"service-exception-name"];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      uint64_t v18 = 0LL;
      goto LABEL_28;
    }

    [v42 objectForKeyedSubscript:@"service-exception-name"];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (([v10 isEqualToString:@"AirPlay"] & 1) == 0)
    {
      [v42 objectForKeyedSubscript:@"service-exception-name"];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (([v11 isEqualToString:@"AirPrint"] & 1) == 0)
      {
        [v42 objectForKeyedSubscript:@"service-exception-name"];
        id v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (([v12 isEqualToString:@"AirDrop"] & 1) == 0)
        {
          [v42 objectForKeyedSubscript:@"service-exception-name"];
          id v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (([v13 isEqualToString:@"VoiceMail"] & 1) == 0)
          {
            [v42 objectForKeyedSubscript:@"service-exception-name"];
            SEL v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (([v14 isEqualToString:@"CellularServices"] & 1) == 0)
            {
              [v42 objectForKeyedSubscript:@"service-exception-name"];
              id v40 = (void *)objc_claimAutoreleasedReturnValue();
              char v41 = [v40 isEqualToString:@"DeviceCommunication"];

              if ((v41 & 1) == 0)
              {
                uint64_t v9 = 0LL;
                uint64_t v18 = 0LL;
                uint64_t v19 = @"Service must be: AirPlay, AirPrint, AirDrop, VoiceMail, CellularServices or DeviceCommunication";
                goto LABEL_40;
              }

              goto LABEL_17;
            }
          }
        }
      }
    }

LABEL_17:
    [v42 objectForKeyedSubscript:@"service-exception-action"];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      uint64_t v18 = 0LL;
      uint64_t v19 = @"Action is required";
LABEL_40:
      *a3 = v19;
      goto LABEL_41;
    }

    [v42 objectForKeyedSubscript:@"service-exception-action"];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    char v16 = [v15 isEqualToString:@"Allow"];

    if ((v16 & 1) != 0)
    {
      uint64_t v17 = 1LL;
    }

    else
    {
      [v42 objectForKeyedSubscript:@"service-exception-action"];
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      char v21 = [v20 isEqualToString:@"Drop"];

      if ((v21 & 1) == 0)
      {
        uint64_t v9 = 0LL;
        uint64_t v18 = 0LL;
        uint64_t v19 = @"Action must be Allow or Drop";
        goto LABEL_40;
      }

      uint64_t v17 = 2LL;
    }

    [v6 serviceExceptions];
    int v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      [v6 serviceExceptions];
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = (void *)[v23 mutableCopy];
    }

    else
    {
      uint64_t v9 = (void *)[objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:1];
    }

    uint64_t v18 = objc_alloc_init(&OBJC_CLASS___NEAOVPNException);
    [v42 objectForKeyedSubscript:@"service-exception-name"];
    int v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEAOVPNException setServiceName:](v18, "setServiceName:", v24);

    -[NEAOVPNException setAction:](v18, "setAction:", v17);
    [v42 objectForKeyedSubscript:@"service-exception-name"];
    id v25 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 setObject:v18 forKeyedSubscript:v25];

    [v6 setServiceExceptions:v9];
LABEL_28:
    [v42 objectForKeyedSubscript:@"allow-all-cn-plugins"];
    id v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      [v42 objectForKeyedSubscript:@"allow-all-cn-plugins"];
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setAllowAllCaptiveNetworkPlugins:", objc_msgSend(v27, "BOOLValue"));
    }

    [v42 objectForKeyedSubscript:@"allow-websheet"];
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      [v42 objectForKeyedSubscript:@"allow-websheet"];
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setAllowCaptiveWebSheet:", objc_msgSend(v29, "BOOLValue"));
    }

    [v42 objectForKeyedSubscript:@"cn-plugin-bundle-id"];
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v30) {
      goto LABEL_41;
    }
    [v6 allowedCaptiveNetworkPlugins];
    __int128 v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      [v6 allowedCaptiveNetworkPlugins];
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
      [v42 objectForKeyedSubscript:@"cn-plugin-bundle-id"];
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
      [v32 objectForKeyedSubscript:v33];
      id v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
      {
        uint64_t v19 = @"BundleId already exists";
        goto LABEL_40;
      }

      [v6 allowedCaptiveNetworkPlugins];
      uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v35 = (void *)[v36 mutableCopy];

      uint64_t v9 = v36;
    }

    else
    {
      uint64_t v35 = (void *)[objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:1];
    }

    uint64_t v37 = objc_alloc_init(&OBJC_CLASS___NEAOVPNException);
    [v42 objectForKeyedSubscript:@"cn-plugin-bundle-id"];
    SEL v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEAOVPNException setBundleIdentifier:](v37, "setBundleIdentifier:", v38);

    -[NEAOVPNException setAction:](v37, "setAction:", 1LL);
    [v42 objectForKeyedSubscript:@"cn-plugin-bundle-id"];
    int v39 = (void *)objc_claimAutoreleasedReturnValue();
    [v35 setObject:v37 forKeyedSubscript:v39];

    [v6 setAllowedCaptiveNetworkPlugins:v35];
    uint64_t v9 = v35;
    uint64_t v18 = v37;
LABEL_41:
  }
}

- (void)unsetAlwaysOnParameters:(const __CFString *)a3 errorStr:
{
  id v28 = a2;
  if (a1)
  {
    objc_msgSend(objc_getProperty(a1, v5, 56, 1), "alwaysOnVPN");
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6) {
      *a3 = @"Requires AlwaysOn configuraton";
    }
    [v28 objectForKeyedSubscript:@"ui-toggle-enabled"];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7) {
      [v6 setToggleEnabled:0];
    }
    [v28 objectForKeyedSubscript:@"service-exception-name"];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      [v6 serviceExceptions];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        uint64_t v27 = @"No existing service to be removed";
        goto LABEL_26;
      }

      [v6 serviceExceptions];
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v28 objectForKeyedSubscript:@"service-exception-name"];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 objectForKeyedSubscript:v10];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        id v8 = 0LL;
        uint64_t v27 = @"Service does not exist";
        goto LABEL_26;
      }

      [v6 serviceExceptions];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      id v8 = (void *)[v12 mutableCopy];

      [v28 objectForKeyedSubscript:@"service-exception-name"];
      id v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 removeObjectForKey:v13];

      if ([v8 count]) {
        SEL v14 = v8;
      }
      else {
        SEL v14 = 0LL;
      }
      [v6 setServiceExceptions:v14];
    }

    [v28 objectForKeyedSubscript:@"allow-all-cn-plugins"];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15) {
      [v6 setAllowAllCaptiveNetworkPlugins:0];
    }
    [v28 objectForKeyedSubscript:@"allow-websheet"];
    char v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16) {
      [v6 setAllowCaptiveWebSheet:0];
    }
    [v28 objectForKeyedSubscript:@"cn-plugin-bundle-id"];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17) {
      goto LABEL_27;
    }
    [v6 allowedCaptiveNetworkPlugins];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      [v6 allowedCaptiveNetworkPlugins];
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v28 objectForKeyedSubscript:@"cn-plugin-bundle-id"];
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v19 objectForKeyedSubscript:v20];
      char v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        [v6 allowedCaptiveNetworkPlugins];
        int v22 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v23 = (void *)[v22 mutableCopy];

        [v28 objectForKeyedSubscript:@"cn-plugin-bundle-id"];
        int v24 = (void *)objc_claimAutoreleasedReturnValue();
        [v23 removeObjectForKey:v24];

        if ([v23 count])
        {
          id v25 = v6;
          id v26 = v23;
        }

        else
        {
          id v25 = v6;
          id v26 = 0LL;
        }

        [v25 setAllowedCaptiveNetworkPlugins:v26];
        id v8 = v23;
        goto LABEL_27;
      }

      uint64_t v27 = @"BundleId does not exist";
    }

    else
    {
      uint64_t v27 = @"No existing CaptoveNetworkPlugin to be removed";
    }

void __94__NEUtilConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_671( uint64_t a1,  void *a2)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (v3)
  {
    ne_log_large_obj();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      id v12 = v3;
      __int16 v13 = 2112;
      uint64_t v14 = v5;
      _os_log_impl(&dword_1876B1000, v4, OS_LOG_TYPE_INFO, "Save error: %@ for %@", buf, 0x16u);
    }

    uint64_t v6 = (void *)NSString;
    [*(id *)(a1 + 32) name];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v6 stringWithFormat:@"Save Configuration with name %@ failed with error: %@", v7, v3];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8LL);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
}

void __69__NEUtilConfigurationClient_reloadIdentityListWithCompletionHandler___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  obuint64_t j = a2;
  uint64_t v3 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v18;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(a1 + 32);
        if (v7)
        {
          uint64_t v8 = (objc_class *)MEMORY[0x189603FC8];
          id v9 = *(id *)(*((void *)&v17 + 1) + 8 * v6);
          id v10 = (void *)[[v8 alloc] initWithDictionary:v9];

          [MEMORY[0x189607968] numberWithInteger:0];
          id v11 = (void *)objc_claimAutoreleasedReturnValue();
          [v10 setObject:v11 forKeyedSubscript:@"domain"];

          if (!objc_getProperty(v7, v12, 48LL, 1))
          {
            id v14 = objc_alloc_init(MEMORY[0x189603FA8]);
            objc_setProperty_atomic(v7, v15, v14, 48LL);
          }

          objc_msgSend(objc_getProperty(v7, v13, 48, 1), "addObject:", v10);
        }

        ++v6;
      }

      while (v4 != v6);
      uint64_t v4 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

- (id)relayConfiguration
{
  if (a1)
  {
    objc_msgSend(objc_getProperty(a1, a2, 56, 1), "relay");
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return a1;
}

void __48__NEUtilConfigurationClient_initWithClientName___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[NEUtilConfigurationClient loadConfigurationsForceRefresh:completionHandler:]( WeakRetained,  1,  &__block_literal_global_6);
}

+ (id)clientWithName:(id)a3
{
  id v3 = a3;
  +[NEUtilConfigurationClient allClients]();
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:v3];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    int v6 = [v3 hasPrefix:@"app:"];
    uint64_t v7 = off_18A087E68;
    if (!v6) {
      uint64_t v7 = off_18A087EF8;
    }
    uint64_t v5 = (void *)[objc_alloc(*v7) initWithClientName:v3];
    if (v5) {
      [v4 setObject:v5 forKeyedSubscript:v3];
    }
  }

  return v5;
}

+ (void)removeClientWithName:(id)a3
{
  id v3 = a3;
  +[NEUtilConfigurationClient allClients]();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 removeObjectForKey:v3];
}

+ (id)allClients
{
  if (allClients_g_initClients != -1) {
    dispatch_once(&allClients_g_initClients, &__block_literal_global_22093);
  }
  return (id)allClients_g_clients;
}

void __39__NEUtilConfigurationClient_allClients__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x189603FC8]);
  v1 = (void *)allClients_g_clients;
  allClients_g_clients = (uint64_t)v0;
}

@end