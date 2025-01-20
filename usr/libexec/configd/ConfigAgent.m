@interface ConfigAgent
+ (id)agentDomain;
+ (id)agentFromData:(id)a3;
+ (id)agentType;
- (BOOL)internalShouldUpdateAgent;
- (BOOL)isActive;
- (BOOL)isKernelActivated;
- (BOOL)isSpecificUseOnly;
- (BOOL)isUserActivated;
- (BOOL)isVoluntary;
- (BOOL)shouldUpdateAgent;
- (BOOL)startAgentWithOptions:(id)a3;
- (ConfigAgent)initWithParameters:(id)a3;
- (NEPolicySession)preferredPolicySession;
- (NSData)internalAgentData;
- (NSString)agentDescription;
- (NSString)internalAssociatedEntity;
- (NSUUID)agentUUID;
- (NWNetworkAgentRegistration)internalRegistrationObject;
- (id)copyAgentData;
- (id)createUUIDForName:(id)a3;
- (id)getAgentData;
- (id)getAgentMapping;
- (id)getAgentName;
- (id)getAgentUUID;
- (id)getAssociatedEntity;
- (id)getRegistrationObject;
- (id)internalAgentMapping;
- (id)internalStartHandler;
- (unint64_t)getAgentSubType;
- (unint64_t)getAgentType;
- (void)addAgentRegistrationObject:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setAgentDescription:(id)a3;
- (void)setAgentMapping:(id)a3;
- (void)setAgentUUID:(id)a3;
- (void)setInternalAgentData:(id)a3;
- (void)setInternalAgentMapping:(id)a3;
- (void)setInternalAssociatedEntity:(id)a3;
- (void)setInternalRegistrationObject:(id)a3;
- (void)setInternalShouldUpdateAgent:(BOOL)a3;
- (void)setInternalStartHandler:(id)a3;
- (void)setKernelActivated:(BOOL)a3;
- (void)setPreferredPolicySession:(id)a3;
- (void)setSpecificUseOnly:(BOOL)a3;
- (void)setStartHandler:(id)a3;
- (void)setUserActivated:(BOOL)a3;
- (void)setVoluntary:(BOOL)a3;
- (void)updateAgentData:(id)a3;
@end

@implementation ConfigAgent

+ (id)agentDomain
{
  return @"SystemConfig";
}

+ (id)agentType
{
  return @"ConfigAgent";
}

+ (id)agentFromData:(id)a3
{
  return 0LL;
}

- (ConfigAgent)initWithParameters:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___ConfigAgent;
  v5 = -[ConfigAgent init](&v13, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForKey:@"EntityName"]);
    internalRegistrationObject = v5->_internalRegistrationObject;
    v5->_internalRegistrationObject = 0LL;

    v8 = (NSString *)[v6 copy];
    internalAssociatedEntity = v5->_internalAssociatedEntity;
    v5->_internalAssociatedEntity = v8;

    internalAgentData = v5->_internalAgentData;
    v5->_internalAgentData = 0LL;

    v5->_internalShouldUpdateAgent = 1;
    id internalAgentMapping = v5->_internalAgentMapping;
    v5->_id internalAgentMapping = 0LL;

    *(_DWORD *)&v5->active = 65537;
  }

  return v5;
}

- (void)addAgentRegistrationObject:(id)a3
{
}

- (unint64_t)getAgentType
{
  return 0LL;
}

- (id)getAgentUUID
{
  return 0LL;
}

- (id)getAgentName
{
  return @"ConfigAgent";
}

- (unint64_t)getAgentSubType
{
  return 0LL;
}

- (id)getRegistrationObject
{
  return self->_internalRegistrationObject;
}

- (id)getAssociatedEntity
{
  return self->_internalAssociatedEntity;
}

- (id)getAgentData
{
  return self->_internalAgentData;
}

- (id)copyAgentData
{
  return self->_internalAgentData;
}

- (void)setAgentMapping:(id)a3
{
}

- (id)getAgentMapping
{
  return self->_internalAgentMapping;
}

- (void)setStartHandler:(id)a3
{
  if (a3) {
    -[ConfigAgent setInternalStartHandler:](self, "setInternalStartHandler:");
  }
}

- (BOOL)startAgentWithOptions:(id)a3
{
  if (-[ConfigAgent isActive](self, "isActive", a3)) {
    return 0;
  }
  -[ConfigAgent setActive:](self, "setActive:", 1LL);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConfigAgent internalRegistrationObject](self, "internalRegistrationObject"));
  unsigned __int8 v6 = [v5 updateNetworkAgent:self];

  return v6;
}

- (void)updateAgentData:(id)a3
{
  id v7 = a3;
  if ([v7 isEqual:self->_internalAgentData])
  {
    BOOL v4 = 0;
  }

  else
  {
    v5 = (NSData *)[v7 copy];
    internalAgentData = self->_internalAgentData;
    self->_internalAgentData = v5;

    BOOL v4 = 1;
  }

  self->_internalShouldUpdateAgent = v4;
}

- (BOOL)shouldUpdateAgent
{
  return self->_internalShouldUpdateAgent;
}

- (id)createUUIDForName:(id)a3
{
  v3 = (const char *)[a3 UTF8String];
  CC_LONG v4 = strlen(v3);
  CC_SHA256(v3, v4, md);
  return -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", md);
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

- (NEPolicySession)preferredPolicySession
{
  return (NEPolicySession *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setPreferredPolicySession:(id)a3
{
}

- (NWNetworkAgentRegistration)internalRegistrationObject
{
  return self->_internalRegistrationObject;
}

- (void)setInternalRegistrationObject:(id)a3
{
}

- (NSString)internalAssociatedEntity
{
  return self->_internalAssociatedEntity;
}

- (void)setInternalAssociatedEntity:(id)a3
{
}

- (NSData)internalAgentData
{
  return self->_internalAgentData;
}

- (void)setInternalAgentData:(id)a3
{
}

- (BOOL)internalShouldUpdateAgent
{
  return self->_internalShouldUpdateAgent;
}

- (void)setInternalShouldUpdateAgent:(BOOL)a3
{
  self->_internalShouldUpdateAgent = a3;
}

- (id)internalStartHandler
{
  return objc_getProperty(self, a2, 64LL, 1);
}

- (void)setInternalStartHandler:(id)a3
{
}

- (id)internalAgentMapping
{
  return self->_internalAgentMapping;
}

- (void)setInternalAgentMapping:(id)a3
{
}

- (void).cxx_destruct
{
}

@end