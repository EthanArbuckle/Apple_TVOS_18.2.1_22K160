@interface NENexusAgent
+ (id)agentDomain;
+ (id)agentFromData:(id)a3;
+ (id)agentType;
- (BOOL)assertAgentWithOptions:(id)a3;
- (BOOL)isActive;
- (BOOL)isKernelActivated;
- (BOOL)isNetworkProvider;
- (BOOL)isNexusProvider;
- (BOOL)isSpecificUseOnly;
- (BOOL)isUserActivated;
- (BOOL)isVoluntary;
- (BOOL)requestNexusWithOptions:(id)a3;
- (BOOL)startAgentWithOptions:(id)a3;
- (BOOL)supportsBrowseRequests;
- (NSString)agentDescription;
- (NSUUID)agentUUID;
- (id)copyAgentData;
- (void)closeNexusWithOptions:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setAgentDescription:(id)a3;
- (void)setAgentUUID:(id)a3;
- (void)setNexusProvider:(BOOL)a3;
- (void)setSupportsBrowseRequests:(BOOL)a3;
- (void)unassertAgentWithOptions:(id)a3;
@end

@implementation NENexusAgent

- (id)copyAgentData
{
  __int128 v13 = 0u;
  memset(v14, 0, sizeof(v14));
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v5 = 0u;
  __int128 v6 = 0u;
  __int128 v3 = 0u;
  __int128 v4 = 0u;
  if (!self)
  {
    DWORD1(v3) = 1;
    goto LABEL_5;
  }

  LODWORD(v3) = self->_frameType;
  DWORD1(v3) = 1;
  if ((_DWORD)v3 != 2)
  {
LABEL_5:
    *((void *)&v3 + 1) = 0x100000002LL;
    LODWORD(v4) = 3;
    goto LABEL_6;
  }

  DWORD2(v3) = 1;
  *((void *)&v7 + 1) = 0x100000002LL;
LABEL_6:
  [MEMORY[0x189603F48] dataWithBytes:&v3 length:204];
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isVoluntary
{
  return 0;
}

- (BOOL)isKernelActivated
{
  return 0;
}

- (BOOL)isUserActivated
{
  return 1;
}

- (BOOL)isSpecificUseOnly
{
  return 0;
}

- (BOOL)isNetworkProvider
{
  return 1;
}

- (BOOL)requestNexusWithOptions:(id)a3
{
  __int128 v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (self) {
    self = (NENexusAgent *)objc_loadWeakRetained((id *)&self->_delegate);
  }
  char v5 = -[NENexusAgent handleRequestNexusFromClient:](self, "handleRequestNexusFromClient:", v4);

  return v5;
}

- (void)closeNexusWithOptions:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (self) {
    self = (NENexusAgent *)objc_loadWeakRetained((id *)&self->_delegate);
  }
  -[NENexusAgent closeFlowWithClientIdentifier:](self, "closeFlowWithClientIdentifier:", v4);
}

- (BOOL)startAgentWithOptions:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (self) {
    self = (NENexusAgent *)objc_loadWeakRetained((id *)&self->_delegate);
  }
  -[NENexusAgent handleStartFromClient:](self, "handleStartFromClient:", v4);

  return 1;
}

- (BOOL)assertAgentWithOptions:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (self) {
    self = (NENexusAgent *)objc_loadWeakRetained((id *)&self->_delegate);
  }
  -[NENexusAgent handleAssertFromClient:](self, "handleAssertFromClient:", v4);

  return 1;
}

- (void)unassertAgentWithOptions:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (self) {
    self = (NENexusAgent *)objc_loadWeakRetained((id *)&self->_delegate);
  }
  -[NENexusAgent handleUnassertFromClient:](self, "handleUnassertFromClient:", v4);
}

- (NSUUID)agentUUID
{
  return self->agentUUID;
}

- (void)setAgentUUID:(id)a3
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

- (NSString)agentDescription
{
  return self->agentDescription;
}

- (void)setAgentDescription:(id)a3
{
}

- (BOOL)supportsBrowseRequests
{
  return self->supportsBrowseRequests;
}

- (void)setSupportsBrowseRequests:(BOOL)a3
{
  self->supportsBrowseRequests = a3;
}

- (BOOL)isNexusProvider
{
  return self->nexusProvider;
}

- (void)setNexusProvider:(BOOL)a3
{
  self->nexusProvider = a3;
}

- (void).cxx_destruct
{
}

+ (id)agentDomain
{
  return @"NENexus";
}

+ (id)agentType
{
  return @"Nexus";
}

+ (id)agentFromData:(id)a3
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NENexusAgent);
  if ((unint64_t)[v3 length] < 0xCC)
  {
    ne_log_obj();
    __int128 v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 134217984;
      uint64_t v9 = [v3 length];
      _os_log_error_impl(&dword_1876B1000, v6, OS_LOG_TYPE_ERROR, "data.length is invalid (%lu)", (uint8_t *)&v8, 0xCu);
    }
  }

  else
  {
    char v5 = (unsigned int *)[v3 bytes];
    if (v5 && v4) {
      v4->_frameType = *v5;
    }
  }

  return v4;
}

@end