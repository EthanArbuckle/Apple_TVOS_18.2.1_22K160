@interface NRCompanionProxyConfigAgent
+ (id)agentDomain;
+ (id)agentFromData:(id)a3;
+ (id)agentType;
- (BOOL)isActive;
- (BOOL)isKernelActivated;
- (BOOL)isNetworkProvider;
- (BOOL)isSpecificUseOnly;
- (BOOL)isUserActivated;
- (BOOL)isVoluntary;
- (NSString)agentDescription;
- (NSUUID)agentUUID;
- (id)copyAgentData;
- (void)dealloc;
- (void)setActive:(BOOL)a3;
- (void)setAgentDescription:(id)a3;
- (void)setAgentUUID:(id)a3;
- (void)setKernelActivated:(BOOL)a3;
- (void)setNetworkProvider:(BOOL)a3;
- (void)setSpecificUseOnly:(BOOL)a3;
- (void)setUserActivated:(BOOL)a3;
- (void)setVoluntary:(BOOL)a3;
@end

@implementation NRCompanionProxyConfigAgent

- (void)dealloc
{
  v2 = self;
  if (self) {
    self = (NRCompanionProxyConfigAgent *)self->_nrUUID;
  }
  v3 = (void *)_NRCopyLogObjectForNRUUID(self, a2);
  int IsLevelEnabled = _NRLogIsLevelEnabled(v3, 0LL);

  if (IsLevelEnabled)
  {
    if (v2) {
      nrUUID = v2->_nrUUID;
    }
    else {
      nrUUID = 0LL;
    }
    v7 = nrUUID;
    v9 = (void *)_NRCopyLogObjectForNRUUID(v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NRCompanionProxyConfigAgent agentDescription](v2, "agentDescription"));

    _NRLogWithArgs(v9, 0LL, "%s%.30s:%-4d Dealloc: %@", ", "-[NRCompanionProxyConfigAgent dealloc]"", 331LL, v10);
  }

  sub_10005E374((uint64_t)v2, v5);
  v11.receiver = v2;
  v11.super_class = (Class)&OBJC_CLASS___NRCompanionProxyConfigAgent;
  -[NRCompanionProxyConfigAgent dealloc](&v11, "dealloc");
}

- (id)copyAgentData
{
  if (!self) {
    return 0LL;
  }
  parameters = self->_parameters;
  if (!parameters) {
    return 0LL;
  }
  uint64_t v9 = 0LL;
  uint64_t v3 = nw_parameters_create_data(parameters, &v9);
  v4 = 0LL;
  if (v3) {
    BOOL v5 = v9 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    v6 = (void *)v3;
    v7 = objc_alloc(&OBJC_CLASS___NSData);
    v4 = -[NSData initWithBytes:length:](v7, "initWithBytes:length:", v6, v9);
    free(v6);
  }

  return v4;
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

- (BOOL)isSpecificUseOnly
{
  return self->specificUseOnly;
}

- (void)setSpecificUseOnly:(BOOL)a3
{
  self->specificUseOnly = a3;
}

- (BOOL)isNetworkProvider
{
  return self->networkProvider;
}

- (void)setNetworkProvider:(BOOL)a3
{
  self->networkProvider = a3;
}

- (NSString)agentDescription
{
  return self->agentDescription;
}

- (void)setAgentDescription:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)agentDomain
{
  return  -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%s",  "com.apple.networkrelay");
}

+ (id)agentType
{
  return  -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%s",  "CompanionProxyConfig");
}

+ (id)agentFromData:(id)a3
{
  return 0LL;
}

@end