@interface LACSharedModePolicyCoordinatorACMStorageRequest
- (BOOL)isEqual:(id)a3;
- (LACSharedModePolicyCoordinatorACMStorageRequest)initWithKey:(int64_t)a3 BOOLValue:(BOOL)a4;
- (LACXPCClient)client;
- (NSData)acl;
- (NSData)value;
- (NSUUID)contextID;
- (int64_t)domain;
- (int64_t)key;
- (unsigned)identifier;
- (void)setAcl:(id)a3;
- (void)setClient:(id)a3;
- (void)setContextID:(id)a3;
- (void)setDomain:(int64_t)a3;
- (void)setIdentifier:(unsigned int)a3;
- (void)setKey:(int64_t)a3;
- (void)setValue:(id)a3;
@end

@implementation LACSharedModePolicyCoordinatorACMStorageRequest

- (LACSharedModePolicyCoordinatorACMStorageRequest)initWithKey:(int64_t)a3 BOOLValue:(BOOL)a4
{
  BOOL v18 = a4;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___LACSharedModePolicyCoordinatorACMStorageRequest;
  v5 = -[LACSharedModePolicyCoordinatorACMStorageRequest init](&v17, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_domain = 0LL;
    v5->_key = a3;
    uint64_t v7 = [MEMORY[0x189603F48] dataWithBytes:&v18 length:1];
    value = v6->_value;
    v6->_value = (NSData *)v7;

    acl = v6->_acl;
    v6->_acl = 0LL;

    v10 = objc_alloc(&OBJC_CLASS___LACXPCClient);
    [MEMORY[0x189607B30] currentConnection];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = -[LACXPCClient initWithConnection:](v10, "initWithConnection:", v11);
    client = v6->_client;
    v6->_client = (LACXPCClient *)v12;

    contextID = v6->_contextID;
    v6->_contextID = 0LL;

    int v15 = identifierCounter++;
    v6->_identifier = v15;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v5 = v4;
    unsigned int v6 = -[LACSharedModePolicyCoordinatorACMStorageRequest identifier](self, "identifier");
    int64_t v7 = -[LACSharedModePolicyCoordinatorACMStorageRequest key](self, "key");
    if (v7 != [v5 key]) {
      goto LABEL_12;
    }
    int64_t v8 = -[LACSharedModePolicyCoordinatorACMStorageRequest domain](self, "domain");
    if (v8 != [v5 domain]) {
      goto LABEL_12;
    }
    v9 = -[LACSharedModePolicyCoordinatorACMStorageRequest acl](self, "acl");
    uint64_t v10 = [v5 acl];
    if (v9 == (void *)v10)
    {
    }

    else
    {
      v11 = (void *)v10;
      -[LACSharedModePolicyCoordinatorACMStorageRequest acl](self, "acl");
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 acl];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      int v14 = [v12 isEqual:v13];

      if (!v14) {
        goto LABEL_12;
      }
    }
    v16 = -[LACSharedModePolicyCoordinatorACMStorageRequest contextID](self, "contextID");
    uint64_t v17 = [v5 contextID];
    if (v16 == (void *)v17)
    {
    }

    else
    {
      BOOL v18 = (void *)v17;
      v19 = -[LACSharedModePolicyCoordinatorACMStorageRequest contextID](self, "contextID");
      [v5 contextID];
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      int v21 = [v19 isEqual:v20];

      if (!v21)
      {
LABEL_12:
        char v15 = 0;
LABEL_13:

        goto LABEL_14;
      }
    }
    v23 = -[LACSharedModePolicyCoordinatorACMStorageRequest value](self, "value");
    uint64_t v24 = [v5 value];
    if (v23 == (void *)v24)
    {
      char v15 = 1;
      v25 = v23;
    }

    else
    {
      v25 = (void *)v24;
      v26 = -[LACSharedModePolicyCoordinatorACMStorageRequest value](self, "value");
      [v5 value];
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      char v15 = [v26 isEqual:v27];
    }

    goto LABEL_13;
  }

  char v15 = 0;
LABEL_14:

  return v15;
}

- (NSData)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (unsigned)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unsigned int)a3
{
  self->_identifier = a3;
}

- (int64_t)key
{
  return self->_key;
}

- (void)setKey:(int64_t)a3
{
  self->_key = a3;
}

- (NSData)acl
{
  return self->_acl;
}

- (void)setAcl:(id)a3
{
}

- (LACXPCClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (NSUUID)contextID
{
  return self->_contextID;
}

- (void)setContextID:(id)a3
{
}

- (int64_t)domain
{
  return self->_domain;
}

- (void)setDomain:(int64_t)a3
{
  self->_domain = a3;
}

- (void).cxx_destruct
{
}

@end