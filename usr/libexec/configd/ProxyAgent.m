@interface ProxyAgent
+ (id)agentType;
- (NSString)internalAgentName;
- (ProxyAgent)initWithParameters:(id)a3;
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

@implementation ProxyAgent

+ (id)agentType
{
  return @"ProxyAgent";
}

- (ProxyAgent)initWithParameters:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___ProxyAgent;
  v5 = -[ConfigAgent initWithParameters:](&v20, "initWithParameters:", v4);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForKey:@"EntityName"]);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForKey:@"AgentSubType"]);
    id v8 = [(id)objc_opt_class(v5) agentType];
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%@", v9, v6));
    internalAgentName = v5->_internalAgentName;
    v5->_internalAgentName = (NSString *)v10;

    v5->_internalAgentSubType = (unint64_t)[v7 unsignedIntegerValue];
    v5->_internalAgentType = 1LL;
    objc_storeStrong((id *)&v5->agentDescription, v5->_internalAgentName);
    agentDescription = v5->agentDescription;
    v19.receiver = v5;
    v19.super_class = (Class)&OBJC_CLASS___ProxyAgent;
    id v13 = -[ConfigAgent createUUIDForName:](&v19, "createUUIDForName:", agentDescription);
    uint64_t v14 = objc_claimAutoreleasedReturnValue(v13);
    agentUUID = v5->agentUUID;
    v5->agentUUID = (NSUUID *)v14;

    if (!v5->agentUUID)
    {
      uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      v17 = v5->agentUUID;
      v5->agentUUID = (NSUUID *)v16;
    }
  }

  return v5;
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