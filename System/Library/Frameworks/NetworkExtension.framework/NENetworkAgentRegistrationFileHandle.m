@interface NENetworkAgentRegistrationFileHandle
- (BOOL)isRegisteredHandle;
- (NENetworkAgentRegistrationFileHandle)initWithNetworkAgentRegistration:(id)a3 sessionType:(id)a4 configurationIdentifier:(id)a5 agentUUID:(id)a6;
- (NENetworkAgentRegistrationFileHandle)initWithNetworkAgentRegistration:(id)a3 sessionType:(id)a4 configurationIdentifier:(id)a5 agentUUID:(id)a6 name:(id)a7;
- (NSNumber)sessionType;
- (NSString)name;
- (NSUUID)agentUUID;
- (NSUUID)configurationIdentifier;
- (id)description;
- (id)dictionary;
- (id)initFromDictionary:(id)a3;
- (unint64_t)agentFlags;
- (unint64_t)type;
- (void)setAgentFlags:(unint64_t)a3;
@end

@implementation NENetworkAgentRegistrationFileHandle

- (NENetworkAgentRegistrationFileHandle)initWithNetworkAgentRegistration:(id)a3 sessionType:(id)a4 configurationIdentifier:(id)a5 agentUUID:(id)a6 name:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = [a3 dupRegistrationFileDescriptor];
  if ((v17 & 0x80000000) != 0)
  {
    v21 = 0LL;
  }

  else
  {
    int v18 = v17;
    v23.receiver = self;
    v23.super_class = (Class)&OBJC_CLASS___NENetworkAgentRegistrationFileHandle;
    v19 = -[NEFileHandle initWithFileDescriptor:launchOwnerWhenReadable:]( &v23,  sel_initWithFileDescriptor_launchOwnerWhenReadable_,  v17,  1LL);
    p_isa = (id *)&v19->super.super.isa;
    if (v19)
    {
      objc_storeStrong((id *)&v19->_sessionType, a4);
      objc_storeStrong(p_isa + 4, a5);
      objc_storeStrong(p_isa + 5, a6);
      objc_storeStrong(p_isa + 6, a7);
    }

    else
    {
      close(v18);
    }

    self = p_isa;
    v21 = self;
  }

  return v21;
}

- (NENetworkAgentRegistrationFileHandle)initWithNetworkAgentRegistration:(id)a3 sessionType:(id)a4 configurationIdentifier:(id)a5 agentUUID:(id)a6
{
  return -[NENetworkAgentRegistrationFileHandle initWithNetworkAgentRegistration:sessionType:configurationIdentifier:agentUUID:name:]( self,  "initWithNetworkAgentRegistration:sessionType:configurationIdentifier:agentUUID:name:",  a3,  a4,  a5,  a6,  0LL);
}

- (id)initFromDictionary:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___NENetworkAgentRegistrationFileHandle;
  v5 = -[NEFileHandle initFromDictionary:](&v19, sel_initFromDictionary_, v4);
  if (v5)
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(v4, "session-type");
    uuid = xpc_dictionary_get_uuid(v4, "configuration-identifier");
    v8 = xpc_dictionary_get_uuid(v4, "agent-uuid");
    string = xpc_dictionary_get_string(v4, "agent-name");
    uint64_t v10 = [MEMORY[0x189607968] numberWithUnsignedLongLong:uint64];
    v11 = (void *)v5[3];
    v5[3] = v10;

    uint64_t v12 = [objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:uuid];
    id v13 = (void *)v5[4];
    v5[4] = v12;

    uint64_t v14 = [objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:v8];
    id v15 = (void *)v5[5];
    v5[5] = v14;

    v5[7] = xpc_dictionary_get_uint64(v4, "agent-flags");
    if (string)
    {
      uint64_t v16 = [NSString stringWithUTF8String:string];
      uint64_t v17 = (void *)v5[6];
      v5[6] = v16;
    }
  }

  return v5;
}

- (id)dictionary
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NENetworkAgentRegistrationFileHandle;
  v3 = -[NEFileHandle dictionary](&v10, sel_dictionary);
  -[NENetworkAgentRegistrationFileHandle sessionType](self, "sessionType");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_uint64(v3, "session-type", [v4 unsignedLongLongValue]);
  v5 = -[NENetworkAgentRegistrationFileHandle configurationIdentifier](self, "configurationIdentifier");
  [v5 getUUIDBytes:uuid];

  xpc_dictionary_set_uuid(v3, "configuration-identifier", uuid);
  v6 = -[NENetworkAgentRegistrationFileHandle agentUUID](self, "agentUUID");
  [v6 getUUIDBytes:v11];

  xpc_dictionary_set_uuid(v3, "agent-uuid", v11);
  xpc_dictionary_set_uint64(v3, "agent-flags", -[NENetworkAgentRegistrationFileHandle agentFlags](self, "agentFlags"));
  v7 = -[NENetworkAgentRegistrationFileHandle name](self, "name");
  if (v7)
  {
    id v8 = -[NENetworkAgentRegistrationFileHandle name](self, "name");
    xpc_dictionary_set_string(v3, "agent-name", (const char *)[v8 UTF8String]);
  }

  return v3;
}

- (id)description
{
  v3 = (void *)NSString;
  -[NEFileHandle handle](self, "handle");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 fileDescriptor];
  v6 = -[NENetworkAgentRegistrationFileHandle configurationIdentifier](self, "configurationIdentifier");
  [v6 UUIDString];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NENetworkAgentRegistrationFileHandle agentUUID](self, "agentUUID");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 UUIDString];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NENetworkAgentRegistrationFileHandle sessionType](self, "sessionType");
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[NENetworkAgentRegistrationFileHandle name](self, "name");
  [v3 stringWithFormat:@"Network Agent Registration socket (%d) %@ %@ %@ %@ agent flags %#llx", v5, v7, v9, v10, v11, -[NENetworkAgentRegistrationFileHandle agentFlags](self, "agentFlags")];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (unint64_t)type
{
  return 2LL;
}

- (BOOL)isRegisteredHandle
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2 || (int v4 = [v2 fileDescriptor], v4 < 0))
  {
    BOOL v5 = 0;
  }

  else
  {
    socklen_t v7 = 4;
    int v8 = 0;
    BOOL v5 = getsockopt(v4, 2, 23, &v8, &v7) == 0;
  }

  return v5;
}

- (NSNumber)sessionType
{
  return (NSNumber *)objc_getProperty(self, a2, 24LL, 1);
}

- (NSUUID)configurationIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 32LL, 1);
}

- (NSUUID)agentUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 40LL, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (unint64_t)agentFlags
{
  return self->_agentFlags;
}

- (void)setAgentFlags:(unint64_t)a3
{
  self->_agentFlags = a3;
}

- (void).cxx_destruct
{
}

@end