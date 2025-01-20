@interface NRDirectToCloudAgent
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

@implementation NRDirectToCloudAgent

- (void)dealloc
{
  if (qword_1001DC818 != -1) {
    dispatch_once(&qword_1001DC818, &stru_1001AEB48);
  }
  if (_NRLogIsLevelEnabled(qword_1001DC810, 0LL))
  {
    if (qword_1001DC818 != -1) {
      dispatch_once(&qword_1001DC818, &stru_1001AEB48);
    }
    id v3 = (id)qword_1001DC810;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NRDirectToCloudAgent agentDescription](self, "agentDescription"));
    _NRLogWithArgs(v3, 0LL, "%s%.30s:%-4d Dealloc: %@", ", "-[NRDirectToCloudAgent dealloc]"", 69LL, v4);
  }

  sub_100068E04((uint64_t)self);
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NRDirectToCloudAgent;
  -[NRDirectToCloudAgent dealloc](&v5, "dealloc");
}

- (BOOL)requiresAssert
{
  return 1;
}

- (id)copyAgentData
{
  return 0LL;
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
  v8[2] = sub_10006870C;
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
  v7[2] = sub_100068158;
  v7[3] = &unk_1001B0720;
  id v8 = v4;
  id v9 = self;
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

+ (id)agentDomain
{
  return  -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%s",  "com.apple.networkrelay");
}

+ (id)agentType
{
  return  -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%s",  "DirectToCloud");
}

+ (id)agentFromData:(id)a3
{
  return 0LL;
}

@end