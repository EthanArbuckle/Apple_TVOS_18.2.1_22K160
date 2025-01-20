@interface UAAuditToken
- ($115C4C562B26FF47E01F9F4EA65B5887)auditTokenValue;
- (BOOL)isSandboxed;
- (UAAuditToken)initWithAuditToken:(id *)a3;
- (const)objCType;
- (id)debugDescription;
- (id)description;
- (int)asid;
- (int)pid;
- (int)pidVersion;
- (unsigned)egid;
- (unsigned)euid;
- (unsigned)rgid;
- (unsigned)ruid;
- (void)getValue:(void *)a3;
@end

@implementation UAAuditToken

- (UAAuditToken)initWithAuditToken:(id *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___UAAuditToken;
  result = -[UAAuditToken init](&v6, "init");
  if (result)
  {
    __int128 v5 = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)result->_auditTokenValue.val = *(_OWORD *)a3->var0;
    *(_OWORD *)&result->_auditTokenValue.val[4] = v5;
  }

  return result;
}

- (int)pid
{
  audit_token_t atoken = v3;
  audit_token_to_au32(&atoken, 0LL, 0LL, 0LL, 0LL, 0LL, &pidp, 0LL, 0LL);
  return pidp;
}

- (int)pidVersion
{
  au_tid_t tidp = 0LL;
  audit_token_t atoken = v3;
  audit_token_to_au32(&atoken, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, &tidp);
  return tidp.port;
}

- (unsigned)euid
{
  audit_token_t atoken = v3;
  audit_token_to_au32(&atoken, 0LL, 0LL, 0LL, &ruidp, 0LL, 0LL, 0LL, 0LL);
  return ruidp;
}

- (unsigned)ruid
{
  audit_token_t atoken = v3;
  audit_token_to_au32(&atoken, 0LL, 0LL, 0LL, &ruidp, 0LL, 0LL, 0LL, 0LL);
  return ruidp;
}

- (unsigned)egid
{
  audit_token_t atoken = v3;
  audit_token_to_au32(&atoken, 0LL, 0LL, &egidp, 0LL, 0LL, 0LL, 0LL, 0LL);
  return egidp;
}

- (unsigned)rgid
{
  audit_token_t atoken = v3;
  audit_token_to_au32(&atoken, 0LL, 0LL, 0LL, 0LL, &rgidp, 0LL, 0LL, 0LL);
  return rgidp;
}

- (int)asid
{
  audit_token_t atoken = v3;
  audit_token_to_au32(&atoken, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, &asidp, 0LL);
  return asidp;
}

- (BOOL)isSandboxed
{
  BOOL v4 = 0;
  -[UAAuditToken auditTokenValue](self, "auditTokenValue");
  sub_10004A32C(&v3, &v4);
  return v4;
}

- (void)getValue:(void *)a3
{
  __int128 v3 = *(_OWORD *)&self->_auditTokenValue.val[4];
  *(_OWORD *)a3 = *(_OWORD *)self->_auditTokenValue.val;
  *((_OWORD *)a3 + 1) = v3;
}

- (const)objCType
{
  return "{?=[8I]}";
}

- (id)description
{
  uint64_t v3 = -[UAAuditToken pid](self, "pid");
  uint64_t v4 = -[UAAuditToken pidVersion](self, "pidVersion");
  uint64_t v5 = -[UAAuditToken euid](self, "euid");
  uint64_t v6 = -[UAAuditToken ruid](self, "ruid");
  uint64_t v7 = -[UAAuditToken egid](self, "egid");
  uint64_t v8 = -[UAAuditToken rgid](self, "rgid");
  uint64_t v9 = -[UAAuditToken asid](self, "asid");
  unsigned int v10 = -[UAAuditToken isSandboxed](self, "isSandboxed");
  v11 = @"NO";
  if (v10) {
    v11 = @"YES";
  }
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[pid=%d/%d uid=%d/%d gid=%d/%d asid=%d sb=%@]",  v3,  v4,  v5,  v6,  v7,  v8,  v9,  v11);
}

- (id)debugDescription
{
  uint64_t v3 = (objc_class *)objc_opt_class(self);
  uint64_t v4 = NSStringFromClass(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[UAAuditToken description](self, "description"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ %p> %@",  v5,  self,  v6));

  return v7;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditTokenValue
{
  return result;
}

@end