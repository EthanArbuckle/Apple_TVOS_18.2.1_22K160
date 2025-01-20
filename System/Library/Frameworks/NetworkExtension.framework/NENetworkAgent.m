@interface NENetworkAgent
+ (id)agentDomain;
+ (id)agentFromData:(id)a3;
+ (id)agentType;
- (BOOL)isActive;
- (BOOL)isKernelActivated;
- (BOOL)isUserActivated;
- (BOOL)isVoluntary;
- (BOOL)matchesFileHandle:(id)a3;
- (BOOL)reportError:(int)a3 withOptions:(id)a4;
- (BOOL)startAgentWithOptions:(id)a3;
- (NENetworkAgent)initWithConfigUUID:(id)a3 sessionType:(int)a4 name:(id)a5;
- (NENetworkAgent)initWithDelegate:(id)a3 configUUID:(id)a4 sessionType:(int)a5 name:(id)a6;
- (NSString)agentDescription;
- (NSString)configurationName;
- (NSUUID)agentUUID;
- (NSUUID)configurationUUID;
- (id)copyAgentData;
- (int)lastStatus;
- (int)sessionType;
- (void)setActive:(BOOL)a3;
- (void)setAgentDescription:(id)a3;
- (void)setAgentUUID:(id)a3;
- (void)setConfigurationName:(id)a3;
- (void)setKernelActivated:(BOOL)a3;
- (void)setLastStatus:(int)a3;
- (void)setStartHandler:(id)a3;
- (void)setUserActivated:(BOOL)a3;
- (void)setVoluntary:(BOOL)a3;
@end

@implementation NENetworkAgent

- (NENetworkAgent)initWithConfigUUID:(id)a3 sessionType:(int)a4 name:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___NENetworkAgent;
  v11 = -[NENetworkAgent init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_internalUUID, a3);
    v12->_internalSessionType = a4;
    objc_storeStrong((id *)&v12->_name, a5);
  }

  return v12;
}

- (NENetworkAgent)initWithDelegate:(id)a3 configUUID:(id)a4 sessionType:(int)a5 name:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___NENetworkAgent;
  v13 = -[NENetworkAgent init](&v16, sel_init);
  objc_super v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_internalUUID, a4);
    v14->_internalSessionType = a5;
    objc_storeStrong((id *)&v14->_name, a6);
    objc_storeWeak((id *)&v14->_delegate, v10);
  }

  return v14;
}

- (BOOL)reportError:(int)a3 withOptions:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained reportError:v4 withOptions:v6];
  }

  return 1;
}

- (BOOL)matchesFileHandle:(id)a3
{
  id v5 = a3;
  [v5 sessionType];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  int v7 = [v6 intValue];
  if (v7 != -[NENetworkAgent sessionType](self, "sessionType"))
  {
    char v15 = 0;
    goto LABEL_21;
  }
  v8 = -[NENetworkAgent configurationUUID](self, "configurationUUID");
  [v5 configurationIdentifier];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  int v10 = [v8 isEqual:v9];

  if (v10)
  {
    if (self && (id v12 = objc_getProperty(self, v11, 48LL, 1)) != 0LL)
    {
      id v6 = v12;
      int v14 = 0;
    }

    else
    {
      uint64_t v16 = [v5 name];
      id v6 = 0LL;
      if (v16) {
        v3 = (void *)v16;
      }
      else {
        v3 = 0LL;
      }
      if (v16) {
        char v15 = 0;
      }
      else {
        char v15 = -1;
      }
      if (!v16 || !self) {
        goto LABEL_20;
      }
      int v14 = 1;
      v3 = (void *)v16;
    }

    id v17 = objc_getProperty(self, v13, 48LL, 1);
    if (!v17)
    {
      char v15 = 0;
      if (!v14) {
        goto LABEL_21;
      }
      goto LABEL_20;
    }

    v18 = v17;
    uint64_t v19 = [v5 name];
    if (!v19)
    {

      char v15 = 0;
      if ((v14 & 1) == 0) {
        goto LABEL_21;
      }
      goto LABEL_20;
    }

    v21 = (void *)v19;
    id v22 = objc_getProperty(self, v20, 48LL, 1);
    [v5 name];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    char v15 = [v22 isEqualToString:v23];

    if ((v14 & 1) != 0) {
LABEL_20:
    }

LABEL_21:
    goto LABEL_22;
  }

  char v15 = 0;
LABEL_22:

  return v15 & 1;
}

- (NSString)agentDescription
{
  v3 = (void *)NSString;
  [(id)objc_opt_class() agentType];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NENetworkAgent configurationName](self, "configurationName");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  int v7 = &stru_18A0915E8;
  if (self)
  {
    char v8 = 1;
    id v10 = objc_getProperty(self, v5, 48LL, 1);
    if (v10) {
      id v11 = @" ";
    }
    else {
      id v11 = &stru_18A0915E8;
    }
    id v12 = objc_getProperty(self, v9, 48LL, 1);
    if (v12)
    {
      int v14 = v12;
      int v7 = (__CFString *)objc_getProperty(self, v13, 48LL, 1);

      char v8 = 0;
    }
  }

  else
  {
    id v10 = 0LL;
    char v8 = 1;
    id v11 = &stru_18A0915E8;
  }

  [v3 stringWithFormat:@"%@: %@%@%@", v4, v6, v11, v7];
  char v15 = (NSString *)objc_claimAutoreleasedReturnValue();
  agentDescription = self->agentDescription;
  self->agentDescription = v15;

  if ((v8 & 1) == 0) {
  return self->agentDescription;
  }
}

- (id)copyAgentData
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  uint64_t v9 = 0LL;
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  if (self)
  {
    objc_msgSend(objc_getProperty(self, a2, 40, 1), "getUUIDBytes:", &v7);
    LODWORD(v8) = self->_internalSessionType;
    if (objc_getProperty(self, v3, 48LL, 1))
    {
      id v5 = objc_getProperty(self, v4, 48LL, 1);
      objc_msgSend(v5, "UTF8String", v7);
      __strlcpy_chk();
    }
  }

  else
  {
    [0 getUUIDBytes:&v7];
    LODWORD(v8) = 0;
  }

  [MEMORY[0x189603F48] dataWithBytes:&v7 length:40];
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSUUID)configurationUUID
{
  if (self) {
    self = (NENetworkAgent *)objc_getProperty(self, a2, 40LL, 1);
  }
  return (NSUUID *)self;
}

- (int)sessionType
{
  if (self) {
    LODWORD(self) = self->_internalSessionType;
  }
  return (int)self;
}

- (void)setStartHandler:(id)a3
{
  if (self) {
    objc_setProperty_atomic_copy(self, a2, a3, 56LL);
  }
}

- (BOOL)startAgentWithOptions:(id)a3
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if (self && objc_getProperty(self, v4, 56LL, 1))
  {
    uuid_clear(uu);
    uint64_t v6 = *MEMORY[0x189608DD0];
    [v5 objectForKeyedSubscript:*MEMORY[0x189608DD0]];
    __int128 v7 = (void *)objc_claimAutoreleasedReturnValue();
    int v8 = isa_nsuuid(v7);

    if (!v8)
    {
      uint64_t v20 = *MEMORY[0x189608DD8];
      [v5 objectForKeyedSubscript:*MEMORY[0x189608DD8]];
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      int v22 = isa_nsnumber(v21);

      if (v22)
      {
        [v5 objectForKeyedSubscript:v20];
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v13 = [v23 intValue];
      }

      else
      {
        uint64_t v13 = 0LL;
      }

      uint64_t v24 = *MEMORY[0x189608DE0];
      [v5 objectForKeyedSubscript:*MEMORY[0x189608DE0]];
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      int v26 = isa_nsuuid(v25);

      if (!v26)
      {
        v18 = 0LL;
LABEL_21:
        BOOL v19 = 1;
        id Property = objc_getProperty(self, v27, 56LL, 1);
        id v29 = v18;
        id v30 = Property;
        (*((void (**)(id, uint64_t, unsigned __int8 *, uint64_t))Property + 2))( v30,  v13,  uu,  [v29 UTF8String]);

        goto LABEL_22;
      }

      [v5 objectForKeyedSubscript:v24];
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 getUUIDBytes:uu];
      v18 = 0LL;
LABEL_20:

      goto LABEL_21;
    }

    [v5 objectForKeyedSubscript:v6];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189608E18] pathForClientID:v9];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    id v11 = v10;
    if (v10)
    {
      [v10 parameters];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v13 = [v12 pid];

      [v11 parameters];
      int v14 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v15 = [v14 effectiveProcessUUID];
      [(id)v15 getUUIDBytes:uu];

      [v11 endpoint];
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      LOBYTE(v15) = objc_opt_isKindOfClass();

      if ((v15 & 1) == 0)
      {
        v18 = 0LL;
        goto LABEL_19;
      }

      [v11 endpoint];
      id v17 = (void *)objc_claimAutoreleasedReturnValue();
      [v17 hostname];
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      ne_log_obj();
      id v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR))
      {
        [v9 UUIDString];
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        int v33 = 138412290;
        v34 = v32;
        _os_log_error_impl( &dword_1876B1000,  (os_log_t)v17,  OS_LOG_TYPE_ERROR,  "Could not fetch path for unassert message (client %@)",  (uint8_t *)&v33,  0xCu);
      }

      v18 = 0LL;
      uint64_t v13 = 0LL;
    }

LABEL_19:
    goto LABEL_20;
  }

  BOOL v19 = 0;
LABEL_22:

  return v19;
}

- (NSUUID)agentUUID
{
  return self->agentUUID;
}

- (void)setAgentUUID:(id)a3
{
}

- (void)setAgentDescription:(id)a3
{
}

- (BOOL)isActive
{
  return self->active;
}

- (void)setActive:(BOOL)a3
{
  self->active = a3;
}

- (BOOL)isKernelActivated
{
  return self->kernelActivated;
}

- (void)setKernelActivated:(BOOL)a3
{
  self->kernelActivated = a3;
}

- (BOOL)isUserActivated
{
  return self->userActivated;
}

- (void)setUserActivated:(BOOL)a3
{
  self->userActivated = a3;
}

- (BOOL)isVoluntary
{
  return self->voluntary;
}

- (void)setVoluntary:(BOOL)a3
{
  self->voluntary = a3;
}

- (NSString)configurationName
{
  return (NSString *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setConfigurationName:(id)a3
{
}

- (int)lastStatus
{
  return self->_lastStatus;
}

- (void)setLastStatus:(int)a3
{
  self->_lastStatus = a3;
}

- (void).cxx_destruct
{
}

+ (id)agentDomain
{
  return @"NetworkExtension";
}

+ (id)agentType
{
  return @"Generic";
}

+ (id)agentFromData:(id)a3
{
  id v3 = a3;
  if ([v3 length] == 40)
  {
    uint64_t v4 = [v3 bytes];
    id v5 = objc_alloc(&OBJC_CLASS___NENetworkAgent);
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:v4];
    uint64_t v7 = *(unsigned int *)(v4 + 16);
    [NSString stringWithUTF8String:v4 + 20];
    int v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = -[NENetworkAgent initWithConfigUUID:sessionType:name:](v5, "initWithConfigUUID:sessionType:name:", v6, v7, v8);
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  return v9;
}

@end