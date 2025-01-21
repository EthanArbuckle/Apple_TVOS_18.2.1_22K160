@interface WiFiUserInteractionMonitorNetworkAgent
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
- (NWNetworkAgentRegistration)registration;
- (WiFiUserInteractionMonitorClient)client;
- (WiFiUserInteractionMonitorNetworkAgent)initWithUUID:(id)a3 andDescription:(id)a4;
- (id)copyAgentData;
- (unint64_t)assertCount;
- (unint64_t)avcMinJB;
- (void)registerStateChangeCallback:(id)a3 withCallbackContext:(void *)a4;
- (void)setActive:(BOOL)a3;
- (void)setAgentDescription:(id)a3;
- (void)setAgentUUID:(id)a3;
- (void)setAssertCount:(unint64_t)a3;
- (void)setAvcMinJB:(unint64_t)a3;
- (void)setClient:(id)a3;
- (void)setKernelActivated:(BOOL)a3;
- (void)setNetworkProvider:(BOOL)a3;
- (void)setRegistration:(id)a3;
- (void)setSpecificUseOnly:(BOOL)a3;
- (void)setUserActivated:(BOOL)a3;
- (void)setVoluntary:(BOOL)a3;
- (void)unassertAgentWithOptions:(id)a3;
@end

@implementation WiFiUserInteractionMonitorNetworkAgent

+ (id)agentDomain
{
  return @"WiFiUserInteractionMonitor";
}

+ (id)agentFromData:(id)a3
{
  return 0LL;
}

+ (id)agentType
{
  return @"WiFiTrafficAssertion";
}

- (id)copyAgentData
{
  return 0LL;
}

- (WiFiUserInteractionMonitorNetworkAgent)initWithUUID:(id)a3 andDescription:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___WiFiUserInteractionMonitorNetworkAgent;
  v8 = -[WiFiUserInteractionMonitorNetworkAgent init](&v16, "init");
  if (!v8) {
    goto LABEL_5;
  }
  v9 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v6);
  -[WiFiUserInteractionMonitorNetworkAgent setAgentUUID:](v8, "setAgentUUID:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitorNetworkAgent agentUUID](v8, "agentUUID"));
  if (!v10) {
    goto LABEL_5;
  }
  v11 = -[NWNetworkAgentRegistration initWithNetworkAgentClass:]( objc_alloc(&OBJC_CLASS___NWNetworkAgentRegistration),  "initWithNetworkAgentClass:",  objc_opt_class(&OBJC_CLASS___WiFiUserInteractionMonitorNetworkAgent));
  -[WiFiUserInteractionMonitorNetworkAgent setRegistration:](v8, "setRegistration:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitorNetworkAgent registration](v8, "registration"));
  if (!v12) {
    goto LABEL_5;
  }
  -[WiFiUserInteractionMonitorNetworkAgent setAgentDescription:](v8, "setAgentDescription:", v7);
  -[WiFiUserInteractionMonitorNetworkAgent setActive:](v8, "setActive:", 0LL);
  -[WiFiUserInteractionMonitorNetworkAgent setKernelActivated:](v8, "setKernelActivated:", 1LL);
  -[WiFiUserInteractionMonitorNetworkAgent setUserActivated:](v8, "setUserActivated:", 1LL);
  -[WiFiUserInteractionMonitorNetworkAgent setVoluntary:](v8, "setVoluntary:", 1LL);
  -[WiFiUserInteractionMonitorNetworkAgent setSpecificUseOnly:](v8, "setSpecificUseOnly:", 1LL);
  -[WiFiUserInteractionMonitorNetworkAgent setNetworkProvider:](v8, "setNetworkProvider:", 0LL);
  -[WiFiUserInteractionMonitorNetworkAgent setAssertCount:](v8, "setAssertCount:", 0LL);
  -[WiFiUserInteractionMonitorNetworkAgent setAvcMinJB:](v8, "setAvcMinJB:", 0LL);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitorNetworkAgent registration](v8, "registration"));
  unsigned __int8 v14 = [v13 registerNetworkAgent:v8];

  if ((v14 & 1) == 0)
  {
LABEL_5:

    v8 = 0LL;
  }

  return v8;
}

- (BOOL)assertAgentWithOptions:(id)a3
{
  id v4 = a3;
  v5 = -[WiFiUserInteractionMonitorNetworkAgent avcMinJB](self, "avcMinJB");
  -[WiFiUserInteractionMonitorNetworkAgent setAssertCount:]( self,  "setAssertCount:",  (char *)-[WiFiUserInteractionMonitorNetworkAgent assertCount](self, "assertCount") + 1);
  id v6 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [qword_100219F60 WFLog:@"%s: received AVC assert, assertCount=%lu" message:3, "-[WiFiUserInteractionMonitorNetworkAgent assertAgentWithOptions:]", -[WiFiUserInteractionMonitorNetworkAgent assertCount](self, "assertCount")];
  }
  objc_autoreleasePoolPop(v6);
  if (!v4)
  {
    v17 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: null userInfo" message:3 "-[WiFiUserInteractionMonitorNetworkAgent assertAgentWithOptions:]"];
    }
    goto LABEL_18;
  }

  uint64_t v7 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:NWNetworkAgentStartOptionClientUUID]);
  if (!v7)
  {
    v17 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: null clientUUID" message:3 "-[WiFiUserInteractionMonitorNetworkAgent assertAgentWithOptions:]"];
    }
LABEL_18:
    objc_autoreleasePoolPop(v17);
    goto LABEL_8;
  }

  v8 = (void *)v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NWPath pathForClientID:](&OBJC_CLASS___NWPath, "pathForClientID:", v7));
  if (v9)
  {
    v10 = v9;
  }

  else
  {
    v18 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: null clientPath" message:3 "-[WiFiUserInteractionMonitorNetworkAgent assertAgentWithOptions:]"];
    }
    objc_autoreleasePoolPop(v18);
  }

LABEL_8:
  if (-[WiFiUserInteractionMonitorNetworkAgent assertCount](self, "assertCount")
    && !-[WiFiUserInteractionMonitorNetworkAgent isActive](self, "isActive")
    || v5 != (void *)-[WiFiUserInteractionMonitorNetworkAgent avcMinJB](self, "avcMinJB"))
  {
    -[WiFiUserInteractionMonitorNetworkAgent setActive:](self, "setActive:", 1LL);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitorNetworkAgent registration](self, "registration"));
    [v11 updateNetworkAgent:self];

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitorNetworkAgent client](self, "client"));
    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitorNetworkAgent client](self, "client"));
      unsigned __int8 v14 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([v13 callback]);
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitorNetworkAgent client](self, "client"));
      ((void (**)(void, id, uint64_t))v14)[2](v14, [v15 context], 1);
    }
  }

  return 1;
}

- (void)unassertAgentWithOptions:(id)a3
{
  id v10 = a3;
  if (-[WiFiUserInteractionMonitorNetworkAgent assertCount](self, "assertCount")) {
    -[WiFiUserInteractionMonitorNetworkAgent setAssertCount:]( self,  "setAssertCount:",  (char *)-[WiFiUserInteractionMonitorNetworkAgent assertCount](self, "assertCount") - 1);
  }
  id v4 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [qword_100219F60 WFLog:@"%s: received AVC unassert, assertCount=%lu" message:3, "-[WiFiUserInteractionMonitorNetworkAgent unassertAgentWithOptions:]", -[WiFiUserInteractionMonitorNetworkAgent assertCount](self, "assertCount")];
  }
  objc_autoreleasePoolPop(v4);
  if (!-[WiFiUserInteractionMonitorNetworkAgent assertCount](self, "assertCount"))
  {
    if (-[WiFiUserInteractionMonitorNetworkAgent isActive](self, "isActive"))
    {
      -[WiFiUserInteractionMonitorNetworkAgent setActive:](self, "setActive:", 0LL);
      -[WiFiUserInteractionMonitorNetworkAgent setAvcMinJB:](self, "setAvcMinJB:", 0LL);
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitorNetworkAgent registration](self, "registration"));
      [v5 updateNetworkAgent:self];

      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitorNetworkAgent client](self, "client"));
      if (v6)
      {
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitorNetworkAgent client](self, "client"));
        v8 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([v7 callback]);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitorNetworkAgent client](self, "client"));
        ((void (**)(void, id, uint64_t))v8)[2](v8, [v9 context], 1);
      }
    }
  }
}

- (void)registerStateChangeCallback:(id)a3 withCallbackContext:(void *)a4
{
  id v12 = a3;
  id v6 = objc_autoreleasePoolPush();
  uint64_t v7 = (void *)qword_100219F60;
  if (qword_100219F60)
  {
    id v8 = objc_retainBlock(v12);
    [v7 WFLog:3, "%s: callback %@, context %@", "-[WiFiUserInteractionMonitorNetworkAgent registerStateChangeCallback:withCallbackContext:]", v8, a4 message];
  }

  objc_autoreleasePoolPop(v6);
  v9 = objc_alloc_init(&OBJC_CLASS___WiFiUserInteractionMonitorClient);
  -[WiFiUserInteractionMonitorNetworkAgent setClient:](self, "setClient:", v9);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitorNetworkAgent client](self, "client"));
  [v10 setCallback:v12];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitorNetworkAgent client](self, "client"));
  [v11 setContext:a4];
}

- (BOOL)isVoluntary
{
  return self->voluntary;
}

- (void)setVoluntary:(BOOL)a3
{
  self->voluntary = a3;
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

- (NSUUID)agentUUID
{
  return self->agentUUID;
}

- (void)setAgentUUID:(id)a3
{
}

- (BOOL)isUserActivated
{
  return self->userActivated;
}

- (void)setUserActivated:(BOOL)a3
{
  self->userActivated = a3;
}

- (BOOL)isKernelActivated
{
  return self->kernelActivated;
}

- (void)setKernelActivated:(BOOL)a3
{
  self->kernelActivated = a3;
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

- (unint64_t)assertCount
{
  return self->_assertCount;
}

- (void)setAssertCount:(unint64_t)a3
{
  self->_assertCount = a3;
}

- (unint64_t)avcMinJB
{
  return self->_avcMinJB;
}

- (void)setAvcMinJB:(unint64_t)a3
{
  self->_avcMinJB = a3;
}

- (NWNetworkAgentRegistration)registration
{
  return self->_registration;
}

- (void)setRegistration:(id)a3
{
}

- (WiFiUserInteractionMonitorClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (void).cxx_destruct
{
}

@end