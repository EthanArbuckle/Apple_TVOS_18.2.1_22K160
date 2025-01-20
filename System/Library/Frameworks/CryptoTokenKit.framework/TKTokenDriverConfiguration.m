@interface TKTokenDriverConfiguration
+ (NSDictionary)driverConfigurations;
+ (id)_connectionWithClient:(id)a3;
+ (id)_driverConfigurationsWithConnection:(id)a3;
+ (id)driverConfigurationsWithClient:(id)a3;
- (NSDictionary)tokenConfigurations;
- (TKTokenConfiguration)addTokenConfigurationForTokenInstanceID:(TKTokenInstanceID)instanceID;
- (TKTokenDriverClassID)classID;
- (TKTokenDriverConfiguration)initWithClassID:(id)a3 configurationConnection:(id)a4;
- (id)beginTransaction;
- (id)createTokenConfigurationWithInstanceID:(id)a3 persistent:(BOOL)a4;
- (void)removeTokenConfigurationForTokenInstanceID:(TKTokenInstanceID)instanceID;
@end

@implementation TKTokenDriverConfiguration

+ (id)driverConfigurationsWithClient:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[TKTokenDriverConfiguration _driverConfigurationsWithConnection:]( &OBJC_CLASS___TKTokenDriverConfiguration,  "_driverConfigurationsWithConnection:",  v3);
  return v4;
}

+ (NSDictionary)driverConfigurations
{
  if (driverConfigurations_onceToken != -1) {
    dispatch_once(&driverConfigurations_onceToken, &__block_literal_global_170);
  }
  return (NSDictionary *)[a1 _driverConfigurationsWithConnection:driverConfigurations_connection];
}

void __50__TKTokenDriverConfiguration_driverConfigurations__block_invoke()
{
  uint64_t v0 = +[TKTokenDriverConfiguration _connectionWithClient:]( &OBJC_CLASS___TKTokenDriverConfiguration,  "_connectionWithClient:",  0LL);
  v1 = (void *)driverConfigurations_connection;
  driverConfigurations_connection = v0;
}

+ (id)_connectionWithClient:(id)a3
{
  v3 = (TKClientToken *)a3;
  if (!v3) {
    v3 = -[TKClientToken initWithTokenID:](objc_alloc(&OBJC_CLASS___TKClientToken), "initWithTokenID:", &stru_189F8C1A8);
  }
  v4 = -[TKClientToken configurationEndpoint](v3, "configurationEndpoint");
  if (v4) {
    v5 = -[TKTokenConfigurationConnection initWithEndpoint:]( objc_alloc(&OBJC_CLASS___TKTokenConfigurationConnection),  "initWithEndpoint:",  v4);
  }
  else {
    v5 = 0LL;
  }

  return v5;
}

+ (id)_driverConfigurationsWithConnection:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v14 = 0LL;
    v15 = &v14;
    uint64_t v16 = 0x3032000000LL;
    v17 = __Block_byref_object_copy__2;
    v18 = __Block_byref_object_dispose__2;
    id v19 = (id)[MEMORY[0x189604A60] mutableCopy];
    [v3 configurationProtocol];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = MEMORY[0x1895F87A8];
    uint64_t v9 = 3221225472LL;
    v10 = __66__TKTokenDriverConfiguration__driverConfigurationsWithConnection___block_invoke;
    v11 = &unk_189F8AAD8;
    id v12 = v3;
    v13 = &v14;
    [v4 getClassIDsWithReply:&v8];

    v5 = (void *)objc_msgSend((id)v15[5], "copy", v8, v9, v10, v11);
    _Block_object_dispose(&v14, 8);
  }

  else
  {
    TK_LOG_tokencfg();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[TKTokenDriverConfiguration _driverConfigurationsWithConnection:].cold.1(v6);
    }

    v5 = (void *)MEMORY[0x189604A60];
  }

  return v5;
}

void __66__TKTokenDriverConfiguration__driverConfigurationsWithConnection___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * v7);
        uint64_t v9 = -[TKTokenDriverConfiguration initWithClassID:configurationConnection:]( objc_alloc(&OBJC_CLASS___TKTokenDriverConfiguration),  "initWithClassID:configurationConnection:",  v8,  *(void *)(a1 + 32));
        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v9 forKeyedSubscript:v8];

        ++v7;
      }

      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v5);
  }
}

- (TKTokenDriverConfiguration)initWithClassID:(id)a3 configurationConnection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TKTokenDriverConfiguration;
  uint64_t v9 = -[TKTokenDriverConfiguration init](&v12, sel_init);
  __int128 v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_classID, a3);
    objc_storeStrong((id *)&v10->_configurationConnection, a4);
  }

  return v10;
}

- (NSDictionary)tokenConfigurations
{
  id v3 = (void *)[MEMORY[0x189604A60] mutableCopy];
  -[TKTokenConfigurationConnection configurationProtocol](self->_configurationConnection, "configurationProtocol");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKTokenDriverConfiguration classID](self, "classID");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = MEMORY[0x1895F87A8];
  uint64_t v10 = 3221225472LL;
  __int128 v11 = __49__TKTokenDriverConfiguration_tokenConfigurations__block_invoke;
  objc_super v12 = &unk_189F8AB00;
  __int128 v13 = self;
  id v14 = v3;
  id v6 = v3;
  [v4 getTokenIDsForClassID:v5 reply:&v9];

  id v7 = (void *)objc_msgSend(v6, "copy", v9, v10, v11, v12, v13);
  return (NSDictionary *)v7;
}

void __49__TKTokenDriverConfiguration_tokenConfigurations__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * v7);
        uint64_t v9 = -[TKTokenConfiguration initWithTokenID:configurationConnection:]( objc_alloc(&OBJC_CLASS___TKTokenConfiguration),  "initWithTokenID:configurationConnection:",  v8,  *(void *)(*(void *)(a1 + 32) + 8LL));
        uint64_t v10 = *(void **)(a1 + 40);
        [v8 instanceID];
        __int128 v11 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 setObject:v9 forKeyedSubscript:v11];

        ++v7;
      }

      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v5);
  }
}

- (id)beginTransaction
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 beginTransactionWithReply:&__block_literal_global_176];

  return  -[TKTokenConfigurationTransaction initWithConfigurationConnection:]( objc_alloc(&OBJC_CLASS___TKTokenConfigurationTransaction),  "initWithConfigurationConnection:",  self->_configurationConnection);
}

- (TKTokenConfiguration)addTokenConfigurationForTokenInstanceID:(TKTokenInstanceID)instanceID
{
  return (TKTokenConfiguration *)-[TKTokenDriverConfiguration createTokenConfigurationWithInstanceID:persistent:]( self,  "createTokenConfigurationWithInstanceID:persistent:",  instanceID,  1LL);
}

- (id)createTokenConfigurationWithInstanceID:(id)a3 persistent:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  id v19 = __Block_byref_object_copy__2;
  v20 = __Block_byref_object_dispose__2;
  id v21 = 0LL;
  uint64_t v7 = -[TKTokenID initWithClassID:instanceID:]( objc_alloc(&OBJC_CLASS___TKTokenID),  "initWithClassID:instanceID:",  self->_classID,  v6);
  -[TKTokenConfigurationConnection configurationProtocol](self->_configurationConnection, "configurationProtocol");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __80__TKTokenDriverConfiguration_createTokenConfigurationWithInstanceID_persistent___block_invoke;
  v12[3] = &unk_189F8A438;
  __int128 v15 = &v16;
  uint64_t v9 = v7;
  __int128 v13 = v9;
  __int128 v14 = self;
  [v8 createTokenID:v9 persistent:v4 reply:v12];

  id v10 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v10;
}

void __80__TKTokenDriverConfiguration_createTokenConfigurationWithInstanceID_persistent___block_invoke( void *a1)
{
  v2 = -[TKTokenConfiguration initWithTokenID:configurationConnection:]( objc_alloc(&OBJC_CLASS___TKTokenConfiguration),  "initWithTokenID:configurationConnection:",  a1[4],  *(void *)(a1[5] + 8LL));
  uint64_t v3 = *(void *)(a1[6] + 8LL);
  BOOL v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)removeTokenConfigurationForTokenInstanceID:(TKTokenInstanceID)instanceID
{
  BOOL v4 = instanceID;
  id v6 = -[TKTokenID initWithClassID:instanceID:]( objc_alloc(&OBJC_CLASS___TKTokenID),  "initWithClassID:instanceID:",  self->_classID,  v4);

  -[TKTokenConfigurationConnection configurationProtocol](self->_configurationConnection, "configurationProtocol");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 removeTokenID:v6 reply:&__block_literal_global_177];
}

- (TKTokenDriverClassID)classID
{
  return self->_classID;
}

- (void).cxx_destruct
{
}

+ (void)_driverConfigurationsWithConnection:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl( &dword_186E58000,  log,  OS_LOG_TYPE_ERROR,  "Failed to get configurationEndpoint, returning empty configurations",  v1,  2u);
}

@end