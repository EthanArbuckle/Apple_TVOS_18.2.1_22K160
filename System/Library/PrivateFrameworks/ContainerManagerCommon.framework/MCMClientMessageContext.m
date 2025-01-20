@interface MCMClientMessageContext
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (MCMPOSIXUser)posixUser;
- (MCMUserIdentityCache)userIdentityCache;
- (NSString)personaUniqueString;
- (OS_xpc_object)message;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initForCurrentThreadContextWithXPCMessage:(id)a3 userIdentityCache:(id)a4;
- (int)pid;
@end

@implementation MCMClientMessageContext

- (id)initForCurrentThreadContextWithXPCMessage:(id)a3 userIdentityCache:(id)a4
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___MCMClientMessageContext;
  v9 = -[MCMClientMessageContext init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_message, a3);
    xpc_dictionary_get_audit_token();
    objc_storeStrong((id *)&v10->_userIdentityCache, a4);
    uint64_t v11 = [v8 personaUniqueStringForCurrentContext];
    personaUniqueString = v10->_personaUniqueString;
    v10->_personaUniqueString = (NSString *)v11;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return self;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  __int128 v3 = *(_OWORD *)&self->var0[6];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self->var0[2];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (MCMPOSIXUser)posixUser
{
  return (MCMPOSIXUser *)(id)objc_claimAutoreleasedReturnValue();
}

- (int)pid
{
  return container_audit_token_get_pid();
}

- (NSString)personaUniqueString
{
  return self->_personaUniqueString;
}

- (OS_xpc_object)message
{
  return self->_message;
}

- (MCMUserIdentityCache)userIdentityCache
{
  return self->_userIdentityCache;
}

- (void).cxx_destruct
{
}

@end