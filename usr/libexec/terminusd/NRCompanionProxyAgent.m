@interface NRCompanionProxyAgent
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

@implementation NRCompanionProxyAgent

- (void)dealloc
{
  v2 = self;
  if (self) {
    self = (NRCompanionProxyAgent *)self->_nrUUID;
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
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NRCompanionProxyAgent agentDescription](v2, "agentDescription"));

    _NRLogWithArgs(v9, 0LL, "%s%.30s:%-4d Dealloc: %@", ", "-[NRCompanionProxyAgent dealloc]"", 79LL, v10);
  }

  if (v2)
  {
    if (v2->_isRegistered)
    {
      v11 = (void *)_NRCopyLogObjectForNRUUID(v2->_nrUUID, v5);
      int v12 = _NRLogIsLevelEnabled(v11, 17LL);

      if (v12)
      {
        v13 = (void *)_NRCopyLogObjectForNRUUID(v2->_nrUUID, v5);
        _NRLogWithArgs(v13, 17LL, "agent dealloc'd while being registered");
      }
    }
  }

  sub_10005DE28((uint64_t)v2, v5);
  v14.receiver = v2;
  v14.super_class = (Class)&OBJC_CLASS___NRCompanionProxyAgent;
  -[NRCompanionProxyAgent dealloc](&v14, "dealloc");
}

- (id)copyAgentData
{
  if (self) {
    unint64_t generation = self->_generation;
  }
  else {
    unint64_t generation = 0LL;
  }
  unint64_t v4 = generation;
  return -[NSData initWithBytes:length:](objc_alloc(&OBJC_CLASS___NSData), "initWithBytes:length:", &v4, 8LL);
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
  return  -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%s",  "CompanionProxy");
}

+ (id)agentFromData:(id)a3
{
  return 0LL;
}

@end