@interface DNSAgent
+ (id)agentType;
- (DNSAgent)initWithParameters:(id)a3;
- (NSString)internalAgentName;
- (id)agentDescription;
- (id)agentUUID;
- (id)getAgentName;
- (id)getAgentUUID;
- (unint64_t)getAgentSubType;
- (unint64_t)getAgentType;
- (unint64_t)internalAgentSubType;
- (unint64_t)internalAgentType;
- (void)setAgentDescription:(id)a3;
- (void)setAgentUUID:(id)a3;
- (void)setInternalAgentName:(id)a3;
- (void)setInternalAgentSubType:(unint64_t)a3;
- (void)setInternalAgentType:(unint64_t)a3;
@end

@implementation DNSAgent

+ (id)agentType
{
  return @"DNSAgent";
}

- (DNSAgent)initWithParameters:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___DNSAgent;
  v5 = -[ConfigAgent initWithParameters:](&v21, "initWithParameters:", v4);
  if (!v5) {
    goto LABEL_10;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForKey:@"EntityName"]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForKey:@"AgentSubType"]);
  id v8 = [(id)objc_opt_class(v5) agentType];
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue(v8);
  if ([v7 unsignedIntegerValue] == (id)4)
  {
    v10 = @"DNSAgent(m)";
LABEL_6:

    v9 = (__CFString *)v10;
    goto LABEL_7;
  }

  if ([v7 unsignedIntegerValue] == (id)5)
  {
    v10 = @"DNSAgent(p)";
    goto LABEL_6;
  }

- (unint64_t)getAgentType
{
  return self->_internalAgentType;
}

- (id)getAgentName
{
  return self->_internalAgentName;
}

- (unint64_t)getAgentSubType
{
  return self->_internalAgentSubType;
}

- (id)getAgentUUID
{
  return self->agentUUID;
}

- (id)agentUUID
{
  return self->agentUUID;
}

- (void)setAgentUUID:(id)a3
{
}

- (id)agentDescription
{
  return self->agentDescription;
}

- (void)setAgentDescription:(id)a3
{
}

- (unint64_t)internalAgentType
{
  return self->_internalAgentType;
}

- (void)setInternalAgentType:(unint64_t)a3
{
  self->_internalAgentType = a3;
}

- (NSString)internalAgentName
{
  return self->_internalAgentName;
}

- (void)setInternalAgentName:(id)a3
{
}

- (unint64_t)internalAgentSubType
{
  return self->_internalAgentSubType;
}

- (void)setInternalAgentSubType:(unint64_t)a3
{
  self->_internalAgentSubType = a3;
}

- (void).cxx_destruct
{
}

@end