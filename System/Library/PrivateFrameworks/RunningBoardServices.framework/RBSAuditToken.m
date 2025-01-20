@interface RBSAuditToken
+ (BOOL)supportsRBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (id)tokenFromAuditToken:(id *)a3;
+ (id)tokenFromAuditTokenRef:(id *)a3;
+ (id)tokenFromXPCConnection:(id)a3;
- ($115C4C562B26FF47E01F9F4EA65B5887)realToken;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (RBSAuditToken)initWithAuditToken:(id *)a3;
- (RBSAuditToken)initWithCoder:(id)a3;
- (RBSAuditToken)initWithRBSXPCCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int)pid;
- (int)pidversion;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSAuditToken

+ (id)tokenFromAuditToken:(id *)a3
{
  id v4 = objc_alloc((Class)a1);
  __int128 v5 = *(_OWORD *)&a3->var0[4];
  v7[0] = *(_OWORD *)a3->var0;
  v7[1] = v5;
  return (id)[v4 initWithAuditToken:v7];
}

+ (id)tokenFromAuditTokenRef:(id *)a3
{
  if (!a3)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 handleFailureInMethod:a2, a1, @"RBSSecurityUtilities.m", 41, @"Invalid parameter not satisfying: %@", @"auditToken" object file lineNumber description];
  }

  __int128 v5 = *(_OWORD *)&a3->var0[4];
  v9[0] = *(_OWORD *)a3->var0;
  v9[1] = v5;
  [a1 tokenFromAuditToken:v9];
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)tokenFromXPCConnection:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 handleFailureInMethod:a2, a1, @"RBSSecurityUtilities.m", 47, @"Invalid parameter not satisfying: %@", @"connection" object file lineNumber description];
  }

  *(void *)&__int128 v6 = -1LL;
  *((void *)&v6 + 1) = -1LL;
  *(_OWORD *)v10.val = v6;
  *(_OWORD *)&v10.val[4] = v6;
  xpc_connection_get_audit_token();
  audit_token_t atoken = v10;
  if (audit_token_to_pid(&atoken) == -1)
  {
    v7 = 0LL;
  }

  else
  {
    audit_token_t atoken = v10;
    [a1 tokenFromAuditToken:&atoken];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (RBSAuditToken)initWithAuditToken:(id *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___RBSAuditToken;
  result = -[RBSAuditToken init](&v6, sel_init);
  if (result)
  {
    __int128 v5 = *(_OWORD *)a3->var0;
    *(_OWORD *)&result->_auditToken.val[4] = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)result->_auditToken.val = v5;
  }

  return result;
}

- (int)pid
{
  return self->_auditToken.val[5];
}

- (int)pidversion
{
  __int128 v2 = *(_OWORD *)&self->_auditToken.val[4];
  *(_OWORD *)v4.val = *(_OWORD *)self->_auditToken.val;
  *(_OWORD *)&v4.val[4] = v2;
  return audit_token_to_pidversion(&v4);
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  id v5 = a3;
  xpc_object_t v4 = xpc_data_create(&self->_auditToken, 0x20uLL);
  if (v4) {
    [v5 encodeXPCObject:v4 forKey:@"_auditToken"];
  }
}

- (RBSAuditToken)initWithRBSXPCCoder:(id)a3
{
  *(void *)&__int128 v4 = -1LL;
  *((void *)&v4 + 1) = -1LL;
  __int128 buffer = v4;
  __int128 v11 = v4;
  [a3 decodeXPCObjectOfType:MEMORY[0x1895F9240] forKey:@"_auditToken"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_super v6 = v5;
  if (v5 && xpc_data_get_bytes(v5, &buffer, 0LL, 0x20uLL) == 32)
  {
    v9[0] = buffer;
    v9[1] = v11;
    self = -[RBSAuditToken initWithAuditToken:](self, "initWithAuditToken:", v9);
    v7 = self;
  }

  else
  {
    v7 = 0LL;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RBSAuditToken)initWithCoder:(id)a3
{
  *(void *)&__int128 v4 = -1LL;
  *((void *)&v4 + 1) = -1LL;
  __int128 v7 = v4;
  __int128 v8 = v4;
  [a3 decodeValueOfObjCType:"{?=[8I]}" at:&v7 size:32];
  v6[0] = v7;
  v6[1] = v8;
  return -[RBSAuditToken initWithAuditToken:](self, "initWithAuditToken:", v6);
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeValueOfObjCType:"{?=[8I]}" at:&self->_auditToken];
}

- (BOOL)isEqual:(id)a3
{
  __int128 v4 = (RBSAuditToken *)a3;
  id v5 = v4;
  if (self == v4)
  {
    BOOL v6 = 1;
  }

  else
  {
    if (v4) {
      -[RBSAuditToken realToken](v4, "realToken");
    }
    else {
      memset(v12, 0, sizeof(v12));
    }
    if (LODWORD(v12[0]) == self->_auditToken.val[0])
    {
      unint64_t v7 = 0LL;
      do
      {
        unint64_t v8 = v7;
        if (v7 == 7) {
          break;
        }
        int v9 = *((_DWORD *)v12 + v7 + 1);
        unsigned int v10 = self->_auditToken.val[++v7];
      }

      while (v9 == v10);
      BOOL v6 = v8 > 6;
    }

    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  __int128 v2 = *(_OWORD *)&self->_auditToken.val[4];
  *(_OWORD *)v4.val = *(_OWORD *)self->_auditToken.val;
  *(_OWORD *)&v4.val[4] = v2;
  return audit_token_to_pid(&v4);
}

- (NSString)description
{
  id v3 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  audit_token_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v5 = *(_OWORD *)&self->_auditToken.val[4];
  *(_OWORD *)atoken.val = *(_OWORD *)self->_auditToken.val;
  *(_OWORD *)&atoken.val[4] = v5;
  uint64_t v6 = audit_token_to_auid(&atoken);
  __int128 v7 = *(_OWORD *)&self->_auditToken.val[4];
  *(_OWORD *)atoken.val = *(_OWORD *)self->_auditToken.val;
  *(_OWORD *)&atoken.val[4] = v7;
  uint64_t v8 = audit_token_to_euid(&atoken);
  __int128 v9 = *(_OWORD *)&self->_auditToken.val[4];
  *(_OWORD *)atoken.val = *(_OWORD *)self->_auditToken.val;
  *(_OWORD *)&atoken.val[4] = v9;
  uint64_t v10 = audit_token_to_egid(&atoken);
  __int128 v11 = *(_OWORD *)&self->_auditToken.val[4];
  *(_OWORD *)atoken.val = *(_OWORD *)self->_auditToken.val;
  *(_OWORD *)&atoken.val[4] = v11;
  uint64_t v12 = audit_token_to_ruid(&atoken);
  __int128 v13 = *(_OWORD *)&self->_auditToken.val[4];
  *(_OWORD *)atoken.val = *(_OWORD *)self->_auditToken.val;
  *(_OWORD *)&atoken.val[4] = v13;
  uint64_t v14 = audit_token_to_rgid(&atoken);
  __int128 v15 = *(_OWORD *)&self->_auditToken.val[4];
  *(_OWORD *)atoken.val = *(_OWORD *)self->_auditToken.val;
  *(_OWORD *)&atoken.val[4] = v15;
  uint64_t v16 = audit_token_to_pid(&atoken);
  __int128 v17 = *(_OWORD *)&self->_auditToken.val[4];
  *(_OWORD *)atoken.val = *(_OWORD *)self->_auditToken.val;
  *(_OWORD *)&atoken.val[4] = v17;
  v18 = (void *)[v3 initWithFormat:@"<%@| AUID:%d EUID:%d EGID:%d RUID:%d RGID:%d PID:%d ASID:%d>", v4, v6, v8, v10, v12, v14, v16, audit_token_to_asid(&atoken)];

  return (NSString *)v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  audit_token_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  __int128 v5 = *(_OWORD *)&self->_auditToken.val[4];
  v7[0] = *(_OWORD *)self->_auditToken.val;
  v7[1] = v5;
  return (id)[v4 initWithAuditToken:v7];
}

- ($115C4C562B26FF47E01F9F4EA65B5887)realToken
{
  __int128 v3 = *(_OWORD *)&self->var0[6];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self->var0[2];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

@end