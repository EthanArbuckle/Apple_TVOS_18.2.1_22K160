@interface NEPathControllerNetworkAgent
+ (id)agentFromData:(id)a3;
+ (id)agentType;
- (BOOL)assertAgentWithOptions:(id)a3;
- (BOOL)isForcedAdvisory;
- (BOOL)noAdvisoryTimer;
- (BOOL)preferAdvisory;
- (BOOL)updateClientsImmediately;
- (BOOL)weakAdvisory;
- (NEPathControllerNetworkAgent)initWithAdvisoryAgentDomain:(id)a3 agentType:(id)a4 advisoryMode:(unint64_t)a5;
- (NEPathControllerNetworkAgent)initWithAdvisoryInterface:(id)a3 advisoryMode:(unint64_t)a4;
- (NSMutableArray)advisoryInterfaceArray;
- (NSMutableArray)predictedInterfaceArray;
- (NSString)advisoryAgentDomain;
- (NSString)advisoryAgentType;
- (id)copyAgentData;
- (void)setAdvisoryAgentDomain:(id)a3;
- (void)setAdvisoryAgentType:(id)a3;
- (void)setAdvisoryInterfaceArray:(id)a3;
- (void)setAssertHandler:(id)a3;
- (void)setIsForcedAdvisory:(BOOL)a3;
- (void)setNoAdvisoryTimer:(BOOL)a3;
- (void)setPredictedInterfaceArray:(id)a3;
- (void)setPreferAdvisory:(BOOL)a3;
- (void)setUnassertHandler:(id)a3;
- (void)setUpdateClientsImmediately:(BOOL)a3;
- (void)setWeakAdvisory:(BOOL)a3;
- (void)unassertAgentWithOptions:(id)a3;
@end

@implementation NEPathControllerNetworkAgent

- (void)setIsForcedAdvisory:(BOOL)a3
{
  self->_isForcedAdvisory = a3;
  -[NEPathControllerNetworkAgent setUpdateClientsImmediately:](self, "setUpdateClientsImmediately:");
}

- (id)copyAgentData
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  v3 = -[NEPathControllerNetworkAgent advisoryInterfaceArray](self, "advisoryInterfaceArray");
  if ([v3 count]) {
    goto LABEL_4;
  }
  v4 = -[NEPathControllerNetworkAgent advisoryAgentDomain](self, "advisoryAgentDomain");
  if ([v4 length])
  {

LABEL_4:
    goto LABEL_5;
  }
  v27 = -[NEPathControllerNetworkAgent advisoryAgentType](self, "advisoryAgentType");
  uint64_t v28 = [v27 length];

  if (!v28)
  {
    *(void *)&__int128 v32 = 0LL;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    if (self)
    {
      objc_msgSend(objc_getProperty(self, v5, 40, 1), "getUUIDBytes:", &v30);
      int internalSessionType = self->super._internalSessionType;
    }

    else
    {
      [0 getUUIDBytes:&v30];
      int internalSessionType = 0;
    }

    LODWORD(v31) = internalSessionType;
    [MEMORY[0x189603F48] dataWithBytes:&v30 length:40];
    return (id)objc_claimAutoreleasedReturnValue();
  }

- (BOOL)assertAgentWithOptions:(id)a3
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  [a3 objectForKeyedSubscript:*MEMORY[0x189608DD0]];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    [MEMORY[0x189608E18] pathForClientID:v4];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v6 = v5 != 0LL;
    ne_log_obj();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    unint64_t v8 = v7;
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        v15 = -[NENetworkAgent agentDescription](self, "agentDescription");
        [v4 UUIDString];
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        [v5 parameters];
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        [v17 effectiveProcessUUID];
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        [v18 UUIDString];
        BOOL v19 = (void *)objc_claimAutoreleasedReturnValue();
        int v21 = 138412802;
        char v22 = v15;
        __int16 v23 = 2112;
        v24 = v16;
        __int16 v25 = 2112;
        v26 = v19;
        _os_log_debug_impl( &dword_1876B1000,  v8,  OS_LOG_TYPE_DEBUG,  "%@ asserted by: client=%@ process=%@",  (uint8_t *)&v21,  0x20u);
      }

      if (!self || !objc_getProperty(self, v9, 88LL, 1))
      {
        BOOL v6 = 1;
        goto LABEL_15;
      }

      id Property = objc_getProperty(self, v10, 88LL, 1);
      id v12 = Property;
      [v5 parameters];
      unint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      -[os_log_s effectiveProcessUUID](v8, "effectiveProcessUUID");
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *, void *))Property + 2))(v12, v4, v13);
    }

    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      [v4 UUIDString];
      char v20 = (void *)objc_claimAutoreleasedReturnValue();
      int v21 = 138412290;
      char v22 = v20;
      _os_log_error_impl( &dword_1876B1000,  v8,  OS_LOG_TYPE_ERROR,  "Could not fetch path for assert message (client %@)",  (uint8_t *)&v21,  0xCu);
    }
  }

  else
  {
    ne_log_obj();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v21) = 0;
      _os_log_error_impl( &dword_1876B1000,  (os_log_t)v5,  OS_LOG_TYPE_ERROR,  "Assert message did not contain client UUID",  (uint8_t *)&v21,  2u);
    }

    BOOL v6 = 0;
  }

- (void)unassertAgentWithOptions:(id)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  [a3 objectForKeyedSubscript:*MEMORY[0x189608DD0]];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ne_log_obj();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v10 = -[NENetworkAgent agentDescription](self, "agentDescription");
      [v4 UUIDString];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      int v12 = 138412546;
      uint64_t v13 = v10;
      __int16 v14 = 2112;
      v15 = v11;
      _os_log_debug_impl(&dword_1876B1000, v6, OS_LOG_TYPE_DEBUG, "%@ unasserted by: client=%@", (uint8_t *)&v12, 0x16u);
    }

    if (self && objc_getProperty(self, v7, 96LL, 1))
    {
      id Property = (void (**)(id, void *))objc_getProperty(self, v8, 96LL, 1);
      Property[2](Property, v4);
    }
  }

  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12) = 0;
      _os_log_error_impl( &dword_1876B1000,  v6,  OS_LOG_TYPE_ERROR,  "Unassert message did not contain client UUID",  (uint8_t *)&v12,  2u);
    }
  }
}

- (void)setAssertHandler:(id)a3
{
  if (self) {
    objc_setProperty_atomic_copy(self, a2, a3, 88LL);
  }
}

- (void)setUnassertHandler:(id)a3
{
  if (self) {
    objc_setProperty_atomic_copy(self, a2, a3, 96LL);
  }
}

- (NEPathControllerNetworkAgent)initWithAdvisoryInterface:(id)a3 advisoryMode:(unint64_t)a4
{
  id v6 = a3;
  [MEMORY[0x189607AB8] UUID];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v8 = -[NENetworkAgent initWithConfigUUID:sessionType:name:]( self,  "initWithConfigUUID:sessionType:name:",  v7,  5LL,  0LL);

  if (v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x189603FA8]);
    -[NEPathControllerNetworkAgent setAdvisoryInterfaceArray:](v8, "setAdvisoryInterfaceArray:", v9);

    id v10 = objc_alloc_init(MEMORY[0x189603FA8]);
    -[NEPathControllerNetworkAgent setPredictedInterfaceArray:](v8, "setPredictedInterfaceArray:", v10);
    v11 = -[NEPathControllerNetworkAgent advisoryInterfaceArray](v8, "advisoryInterfaceArray");
    int v12 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189607968]),  "initWithUnsignedLong:",  objc_msgSend(v6, "interfaceIndex"));
    [v11 addObject:v12];

    -[NEPathControllerNetworkAgent predictedInterfaceArray](v8, "predictedInterfaceArray");
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 addObject:&unk_18A0CFA08];

    switch(a4)
    {
      case 4uLL:
        -[NEPathControllerNetworkAgent setPreferAdvisory:](v8, "setPreferAdvisory:", 1LL);
        break;
      case 3uLL:
        -[NEPathControllerNetworkAgent setNoAdvisoryTimer:](v8, "setNoAdvisoryTimer:", 1LL);
        break;
      case 2uLL:
        -[NEPathControllerNetworkAgent setWeakAdvisory:](v8, "setWeakAdvisory:", 1LL);
        break;
    }
  }

  return v8;
}

- (NEPathControllerNetworkAgent)initWithAdvisoryAgentDomain:(id)a3 agentType:(id)a4 advisoryMode:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  [MEMORY[0x189607AB8] UUID];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[NENetworkAgent initWithConfigUUID:sessionType:name:]( self,  "initWithConfigUUID:sessionType:name:",  v10,  5LL,  0LL);

  if (v11)
  {
    -[NEPathControllerNetworkAgent setAdvisoryAgentDomain:](v11, "setAdvisoryAgentDomain:", v8);
    -[NEPathControllerNetworkAgent setAdvisoryAgentType:](v11, "setAdvisoryAgentType:", v9);
    switch(a5)
    {
      case 4uLL:
        -[NEPathControllerNetworkAgent setPreferAdvisory:](v11, "setPreferAdvisory:", 1LL);
        break;
      case 3uLL:
        -[NEPathControllerNetworkAgent setNoAdvisoryTimer:](v11, "setNoAdvisoryTimer:", 1LL);
        break;
      case 2uLL:
        -[NEPathControllerNetworkAgent setWeakAdvisory:](v11, "setWeakAdvisory:", 1LL);
        break;
    }
  }

  return v11;
}

- (BOOL)updateClientsImmediately
{
  return self->updateClientsImmediately;
}

- (void)setUpdateClientsImmediately:(BOOL)a3
{
  self->updateClientsImmediately = a3;
}

- (BOOL)isForcedAdvisory
{
  return self->_isForcedAdvisory;
}

- (NSMutableArray)predictedInterfaceArray
{
  return (NSMutableArray *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setPredictedInterfaceArray:(id)a3
{
}

- (NSMutableArray)advisoryInterfaceArray
{
  return (NSMutableArray *)objc_getProperty(self, a2, 112LL, 1);
}

- (void)setAdvisoryInterfaceArray:(id)a3
{
}

- (NSString)advisoryAgentDomain
{
  return (NSString *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setAdvisoryAgentDomain:(id)a3
{
}

- (NSString)advisoryAgentType
{
  return (NSString *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setAdvisoryAgentType:(id)a3
{
}

- (BOOL)weakAdvisory
{
  return self->_weakAdvisory;
}

- (void)setWeakAdvisory:(BOOL)a3
{
  self->_weakAdvisory = a3;
}

- (BOOL)noAdvisoryTimer
{
  return self->_noAdvisoryTimer;
}

- (void)setNoAdvisoryTimer:(BOOL)a3
{
  self->_noAdvisoryTimer = a3;
}

- (BOOL)preferAdvisory
{
  return self->_preferAdvisory;
}

- (void)setPreferAdvisory:(BOOL)a3
{
  self->_preferAdvisory = a3;
}

- (void).cxx_destruct
{
}

+ (id)agentType
{
  return @"PathController";
}

+ (id)agentFromData:(id)a3
{
  id v3 = a3;
  if ([v3 length] == 140)
  {
    uint64_t v4 = [v3 bytes];
    v5 = objc_alloc(&OBJC_CLASS___NEPathControllerNetworkAgent);
    id v6 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:v4];
    uint64_t v7 = *(unsigned int *)(v4 + 16);
    [NSString stringWithUTF8String:v4 + 20];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v9 = -[NENetworkAgent initWithConfigUUID:sessionType:name:](v5, "initWithConfigUUID:sessionType:name:", v6, v7, v8);

    id v10 = objc_alloc_init(MEMORY[0x189603FA8]);
    -[NEPathControllerNetworkAgent setAdvisoryInterfaceArray:](v9, "setAdvisoryInterfaceArray:", v10);

    id v11 = objc_alloc_init(MEMORY[0x189603FA8]);
    -[NEPathControllerNetworkAgent setPredictedInterfaceArray:](v9, "setPredictedInterfaceArray:", v11);

    for (uint64_t i = 0LL; i != 16; i += 4LL)
    {
      uint64_t v13 = v4 + i;
      if (*(_DWORD *)(v4 + i + 40))
      {
        -[NEPathControllerNetworkAgent advisoryInterfaceArray](v9, "advisoryInterfaceArray");
        __int16 v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)[objc_alloc(MEMORY[0x189607968]) initWithUnsignedLong:*(unsigned int *)(v13 + 40)];
        [v14 addObject:v15];

        -[NEPathControllerNetworkAgent predictedInterfaceArray](v9, "predictedInterfaceArray");
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)[objc_alloc(MEMORY[0x189607968]) initWithUnsignedLong:*(unsigned int *)(v13 + 56)];
        [v16 addObject:v17];
      }
    }

    -[NEPathControllerNetworkAgent setWeakAdvisory:](v9, "setWeakAdvisory:", *(_BYTE *)(v4 + 72) & 1);
    -[NEPathControllerNetworkAgent setNoAdvisoryTimer:]( v9,  "setNoAdvisoryTimer:",  (*(unsigned __int8 *)(v4 + 72) >> 1) & 1);
    -[NEPathControllerNetworkAgent setIsForcedAdvisory:]( v9,  "setIsForcedAdvisory:",  (*(unsigned __int8 *)(v4 + 72) >> 2) & 1);
    -[NEPathControllerNetworkAgent setPreferAdvisory:]( v9,  "setPreferAdvisory:",  (*(unsigned __int8 *)(v4 + 72) >> 3) & 1);
    if (*(_BYTE *)(v4 + 73))
    {
      [NSString stringWithUTF8String:v4 + 73];
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEPathControllerNetworkAgent setAdvisoryAgentDomain:](v9, "setAdvisoryAgentDomain:", v18);
    }

    int v20 = *(unsigned __int8 *)(v4 + 105);
    uint64_t v19 = v4 + 105;
    if (v20)
    {
      [NSString stringWithUTF8String:v19];
      int v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEPathControllerNetworkAgent setAdvisoryAgentType:](v9, "setAdvisoryAgentType:", v21);
    }
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

@end