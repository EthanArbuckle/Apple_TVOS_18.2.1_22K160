@interface NRQuickRelayAgent
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
- (NSString)agentDescription;
- (NSUUID)agentUUID;
- (id)copyAgentData;
- (id)description;
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

@implementation NRQuickRelayAgent

- (void)dealloc
{
  v2 = self;
  if (self) {
    self = (NRQuickRelayAgent *)self->_nrUUID;
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
    _NRLogWithArgs(v9, 0LL, "%s%.30s:%-4d Dealloc: %@", ", "-[NRQuickRelayAgent dealloc]"", 73LL, v2);
  }

  if (v2)
  {
    if (v2->_isRegistered)
    {
      v10 = (void *)_NRCopyLogObjectForNRUUID(v2->_nrUUID, v5);
      int v11 = _NRLogIsLevelEnabled(v10, 17LL);

      if (v11)
      {
        v12 = v2->_nrUUID;
        v14 = (void *)_NRCopyLogObjectForNRUUID(v12, v13);
        _NRLogWithArgs(v14, 17LL, "Agent dealloc'd while registered: %@", v2);
      }
    }
  }

  v15.receiver = v2;
  v15.super_class = (Class)&OBJC_CLASS___NRQuickRelayAgent;
  -[NRQuickRelayAgent dealloc](&v15, "dealloc");
}

- (id)description
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NRQuickRelayAgent agentUUID](self, "agentUUID"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"agent-uuid: %@", v5);

  if (self)
  {
    -[NSMutableString appendFormat:](v3, "appendFormat:", @", %u", self->_assertCount);
    if (self->_isRegistered) {
      v6 = ", R";
    }
    else {
      v6 = "";
    }
  }

  else
  {
    -[NSMutableString appendFormat:](v3, "appendFormat:", @", %u", 0LL);
    v6 = "";
  }

  -[NSMutableString appendFormat:](v3, "appendFormat:", @"%s", v6);
  v7 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"[%@]", v3);

  return v7;
}

- (id)copyAgentData
{
  v2 = self;
  if (self) {
    self = (NRQuickRelayAgent *)self->_nrUUID;
  }
  v3 = (void *)_NRCopyLogObjectForNRUUID(self, a2);
  int IsLevelEnabled = _NRLogIsLevelEnabled(v3, 1LL);

  if (IsLevelEnabled)
  {
    if (v2) {
      nrUUID = v2->_nrUUID;
    }
    else {
      nrUUID = 0LL;
    }
    v7 = (void *)_NRCopyLogObjectForNRUUID(nrUUID, v5);
    _NRLogWithArgs( v7,  1LL,  "%s%.30s:%-4d Updating agent data - state: %u",  ",  "-[NRQuickRelayAgent copyAgentData]"",  105,  v2->_state.state);
  }

  return -[NSData initWithBytes:length:](objc_alloc(&OBJC_CLASS___NSData), "initWithBytes:length:", &v2->_state, 1LL);
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
  block[2] = sub_10002F818;
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
  block[2] = sub_10002F5F8;
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
  return  -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%s",  "QuickRelayAgent");
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