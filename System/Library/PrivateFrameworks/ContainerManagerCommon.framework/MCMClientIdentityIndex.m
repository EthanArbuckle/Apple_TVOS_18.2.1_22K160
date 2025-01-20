@interface MCMClientIdentityIndex
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToClientIdentityIndex:(id)a3;
- (MCMClientIdentityIndex)initWithAuditToken:(id *)a3 proximateAuditToken:(id *)a4 personaUniqueString:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation MCMClientIdentityIndex

- (MCMClientIdentityIndex)initWithAuditToken:(id *)a3 proximateAuditToken:(id *)a4 personaUniqueString:(id)a5
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___MCMClientIdentityIndex;
  v10 = -[MCMClientIdentityIndex init](&v16, sel_init);
  if (v10)
  {
    uint64_t v11 = [MEMORY[0x189603F48] dataWithBytes:a3 length:32];
    auditToken = v10->_auditToken;
    v10->_auditToken = (NSData *)v11;

    uint64_t v13 = [MEMORY[0x189603F48] dataWithBytes:a4 length:32];
    proximateAuditToken = v10->_proximateAuditToken;
    v10->_proximateAuditToken = (NSData *)v13;

    objc_storeStrong((id *)&v10->_personaUniqueString, a5);
  }

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3 = -[NSData hash](self->_auditToken, "hash");
  uint64_t v4 = -[NSData hash](self->_proximateAuditToken, "hash");
  NSUInteger personaUniqueString = (NSUInteger)self->_personaUniqueString;
  if (personaUniqueString) {
    NSUInteger personaUniqueString = [(id)personaUniqueString hash];
  }
  return v4 ^ v3 ^ personaUniqueString;
}

- (BOOL)isEqualToClientIdentityIndex:(id)a3
{
  uint64_t v4 = a3;
  if (!-[NSData isEqualToData:](self->_auditToken, "isEqualToData:", v4[1])
    || !-[NSData isEqualToData:](self->_proximateAuditToken, "isEqualToData:", v4[2]))
  {
    goto LABEL_8;
  }

  NSUInteger personaUniqueString = self->_personaUniqueString;
  uint64_t v6 = v4[3];
  if (personaUniqueString)
  {
    if (v6 && -[NSString isEqualToString:](personaUniqueString, "isEqualToString:")) {
      goto LABEL_6;
    }
LABEL_8:
    BOOL v7 = 0;
    goto LABEL_9;
  }

  if (v6) {
    goto LABEL_8;
  }
LABEL_6:
  BOOL v7 = 1;
LABEL_9:

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && -[MCMClientIdentityIndex isEqualToClientIdentityIndex:](self, "isEqualToClientIdentityIndex:", v4);

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  -[NSData getBytes:length:](self->_auditToken, "getBytes:length:", &v11, 32LL);
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  -[NSData getBytes:length:](self->_proximateAuditToken, "getBytes:length:", &v9, 32LL);
  id v4 = objc_alloc(&OBJC_CLASS___MCMClientIdentityIndex);
  NSUInteger personaUniqueString = self->_personaUniqueString;
  v8[0] = v11;
  v8[1] = v12;
  v7[0] = v9;
  v7[1] = v10;
  return -[MCMClientIdentityIndex initWithAuditToken:proximateAuditToken:personaUniqueString:]( v4,  "initWithAuditToken:proximateAuditToken:personaUniqueString:",  v8,  v7,  personaUniqueString);
}

- (void).cxx_destruct
{
}

@end