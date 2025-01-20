@interface NRBTLinkPreferencesAgent
+ (id)agentDomain;
+ (id)agentFromData:(id)a3;
+ (id)agentType;
- (BOOL)assertAgentWithOptions:(id)a3;
- (BOOL)isActive;
- (BOOL)isKernelActivated;
- (BOOL)isNetworkProvider;
- (BOOL)isSpecificUseOnly;
- (BOOL)isUserActivated;
- (BOOL)isVoluntary;
- (BOOL)requiresAssert;
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
- (void)unassertAgentWithOptions:(id)a3;
@end

@implementation NRBTLinkPreferencesAgent

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NRBTLinkPreferencesAgent;
  -[NRBTLinkPreferencesAgent dealloc](&v3, "dealloc");
}

- (id)copyAgentData
{
  return 0LL;
}

- (BOOL)requiresAssert
{
  return 1;
}

- (BOOL)assertAgentWithOptions:(id)a3
{
  id v4 = a3;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0LL;
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100064DF0;
  v8[3] = &unk_1001B0720;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v8);

  return 1;
}

- (void)unassertAgentWithOptions:(id)a3
{
  id v4 = a3;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0LL;
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000649FC;
  v7[3] = &unk_1001B0720;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
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

+ (id)agentType
{
  return  -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%s",  "CompanionBTLinkPreferencesAgent");
}

+ (id)agentDomain
{
  return  -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"com.apple.networkrelay");
}

+ (id)agentFromData:(id)a3
{
  return 0LL;
}

@end