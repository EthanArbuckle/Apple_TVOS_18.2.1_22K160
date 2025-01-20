@interface NRPreferWiFiAgent
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
- (BOOL)startAgentWithOptions:(id)a3;
- (NRPreferWiFiAgent)init;
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

@implementation NRPreferWiFiAgent

- (NRPreferWiFiAgent)init
{
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___NRPreferWiFiAgent;
  v2 = -[NRPreferWiFiAgent init](&v26, "init");
  if (!v2)
  {
    id v17 = sub_100060700();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v17, 16LL);

    if (IsLevelEnabled)
    {
      id v19 = sub_100060700();
      _NRLogWithArgs(v19, 16LL, "%s%.30s:%-4d ABORTING: [super init] failed", ", "-[NRPreferWiFiAgent init]"", 36);
    }

    uint64_t v20 = _os_log_pack_size(12LL);
    v21 = (char *)&v25 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    v22 = __error();
    uint64_t v23 = _os_log_pack_fill(v21, v20, *v22, &_mh_execute_header, "%{public}s [super init] failed");
    *(_DWORD *)uint64_t v23 = 136446210;
    *(void *)(v23 + 4) = "-[NRPreferWiFiAgent init]";
    id v24 = sub_100060700();
    _NRLogAbortWithPack(v24, v21);
  }

  v3 = v2;
  -[NRPreferWiFiAgent setActive:](v2, "setActive:", 0LL);
  -[NRPreferWiFiAgent setKernelActivated:](v3, "setKernelActivated:", 1LL);
  -[NRPreferWiFiAgent setUserActivated:](v3, "setUserActivated:", 1LL);
  -[NRPreferWiFiAgent setVoluntary:](v3, "setVoluntary:", 1LL);
  -[NRPreferWiFiAgent setNetworkProvider:](v3, "setNetworkProvider:", 1LL);
  -[NRPreferWiFiAgent setSpecificUseOnly:](v3, "setSpecificUseOnly:", 1LL);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  -[NRPreferWiFiAgent setAgentUUID:](v3, "setAgentUUID:", v4);

  v5 = objc_alloc(&OBJC_CLASS___NSString);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NRPreferWiFiAgent agentUUID](v3, "agentUUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
  v8 = -[NSString initWithFormat:](v5, "initWithFormat:", @"NRPreferWiFiAgent-%@", v7);
  policyIdentifier = v3->_policyIdentifier;
  v3->_policyIdentifier = v8;

  v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  clientUUIDToPathDictionary = v3->_clientUUIDToPathDictionary;
  v3->_clientUUIDToPathDictionary = v10;

  v12 = objc_alloc_init(&OBJC_CLASS___NSCountedSet);
  p2pClientUUIDSet = v3->_p2pClientUUIDSet;
  v3->_p2pClientUUIDSet = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NRPreferWiFiAgent agentUUID](v3, "agentUUID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 UUIDString]);
  sub_10011BB18(0LL, 15001, 0LL, v15);

  return v3;
}

- (void)dealloc
{
  if (qword_1001DC7A8 != -1) {
    dispatch_once(&qword_1001DC7A8, &stru_1001AE9E0);
  }
  if (_NRLogIsLevelEnabled(qword_1001DC7A0, 1LL))
  {
    if (qword_1001DC7A8 != -1) {
      dispatch_once(&qword_1001DC7A8, &stru_1001AE9E0);
    }
    _NRLogWithArgs(qword_1001DC7A0, 1LL, "%s%.30s:%-4d Dealloc: %@", ", "-[NRPreferWiFiAgent dealloc]"", 55LL, self);
  }

  if (self)
  {
    if (self->_isRegistered)
    {
      if (qword_1001DC7A8 != -1) {
        dispatch_once(&qword_1001DC7A8, &stru_1001AE9E0);
      }
      if (_NRLogIsLevelEnabled(qword_1001DC7A0, 17LL))
      {
        if (qword_1001DC7A8 != -1) {
          dispatch_once(&qword_1001DC7A8, &stru_1001AE9E0);
        }
        _NRLogWithArgs(qword_1001DC7A0, 17LL, "Prefer Wi-Fi agent getting dealloc'd without unregistering");
      }
    }

    self->_invalidated = 1;
  }

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NRPreferWiFiAgent;
  -[NRPreferWiFiAgent dealloc](&v3, "dealloc");
}

- (id)description
{
  objc_super v3 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NRPreferWiFiAgent agentUUID](self, "agentUUID"));
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"agent UUID: %@\n", v4);

  if (self)
  {
    -[NSMutableString appendFormat:](v3, "appendFormat:", @"registration handle: %@\n", self->_registrationObject);
    uint64_t assertCount = self->_assertCount;
  }

  else
  {
    -[NSMutableString appendFormat:](v3, "appendFormat:", @"registration handle: %@\n", 0LL);
    uint64_t assertCount = 0LL;
  }

  -[NSMutableString appendFormat:](v3, "appendFormat:", @"assert count: %d\n", assertCount);
  return v3;
}

- (id)copyAgentData
{
  return 0LL;
}

- (BOOL)startAgentWithOptions:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (qword_1001DC7A8 != -1) {
    dispatch_once(&qword_1001DC7A8, &stru_1001AE9E0);
  }
  id v6 = (id)qword_1001DC7A0;
  char IsLevelEnabled = _NRLogIsLevelEnabled(v6, 1LL);

  if ((IsLevelEnabled & 1) != 0)
  {
    if (qword_1001DC7A8 != -1) {
      dispatch_once(&qword_1001DC7A8, &stru_1001AE9E0);
    }
    id v8 = (id)qword_1001DC7A0;
    _NRLogWithArgs( v8,  1LL,  "%s%.30s:%-4d Received start agent request",  ",  "-[NRPreferWiFiAgent startAgentWithOptions:]"",  242);
  }

  objc_sync_exit(v5);

  return 0;
}

- (BOOL)assertAgentWithOptions:(id)a3
{
  objc_super v3 = self;
  objc_sync_enter(v3);
  if (v3) {
    queue = (dispatch_queue_s *)v3->_queue;
  }
  else {
    queue = 0LL;
  }
  dispatch_async(queue, &stru_1001AE9A0);
  objc_sync_exit(v3);

  return 1;
}

- (void)unassertAgentWithOptions:(id)a3
{
  obj = self;
  objc_sync_enter(obj);
  queue = (dispatch_queue_s *)obj;
  if (obj) {
    queue = (dispatch_queue_s *)obj->_queue;
  }
  dispatch_async(queue, &stru_1001AE9C0);
  objc_sync_exit(obj);
}

- (NSUUID)agentUUID
{
  return self->agentUUID;
}

- (void)setAgentUUID:(id)a3
{
}

- (NSString)agentDescription
{
  return self->agentDescription;
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

- (void).cxx_destruct
{
}

+ (id)agentDomain
{
  return  -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%s",  "com.apple.networkrelay");
}

+ (id)agentType
{
  return -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"%s", "PreferWiFi");
}

+ (id)agentFromData:(id)a3
{
  return 0LL;
}

@end