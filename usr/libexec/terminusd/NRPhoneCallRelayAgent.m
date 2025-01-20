@interface NRPhoneCallRelayAgent
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

@implementation NRPhoneCallRelayAgent

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NRPhoneCallRelayAgent;
  -[NRPhoneCallRelayAgent dealloc](&v3, "dealloc");
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
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0LL;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100148180;
  block[3] = &unk_1001B0A88;
  block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
  return 1;
}

- (void)unassertAgentWithOptions:(id)a3
{
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0LL;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100147F78;
  block[3] = &unk_1001B0A88;
  block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
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
  return  -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%s",  "PhoneCallRelayAgent");
}

+ (id)agentDomain
{
  return  -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%s",  "com.apple.networkrelay");
}

+ (id)agentFromData:(id)a3
{
  return 0LL;
}

@end