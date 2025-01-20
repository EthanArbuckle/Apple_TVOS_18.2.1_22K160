@interface ADHomeInfo
- (BOOL)isEqual:(id)a3;
- (BOOL)personalDomainsIsEnabled;
- (BOOL)securePersonalDomainsRequireAuth;
- (NSUUID)currentHomeIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)setCurrentHomeIdentifier:(id)a3;
- (void)setPersonalDomainsIsEnabled:(BOOL)a3;
- (void)setSecurePersonalDomainsRequireAuth:(BOOL)a3;
@end

@implementation ADHomeInfo

- (id)description
{
  v3 = objc_alloc(&OBJC_CLASS___NSMutableString);
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___ADHomeInfo;
  id v4 = -[ADHomeInfo description](&v11, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  unsigned int v6 = -[ADHomeInfo personalDomainsIsEnabled](self, "personalDomainsIsEnabled");
  unsigned int v7 = -[ADHomeInfo securePersonalDomainsRequireAuth](self, "securePersonalDomainsRequireAuth");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADHomeInfo currentHomeIdentifier](self, "currentHomeIdentifier"));
  v9 = -[NSMutableString initWithFormat:]( v3,  "initWithFormat:",  @"%@ Personal Domains Enabled: %d Auth Required: %d, currentHomeIdentifier: %@",  v5,  v6,  v7,  v8);

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___ADHomeInfo);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    unsigned int v6 = v4;
    unsigned int v7 = v6;
    if (self->_personalDomainsIsEnabled == *((unsigned __int8 *)v6 + 8)
      && self->_securePersonalDomainsRequireAuth == *((unsigned __int8 *)v6 + 9))
    {
      currentHomeIdentifier = self->_currentHomeIdentifier;
      else {
        unsigned __int8 v9 = 1;
      }
    }

    else
    {
      unsigned __int8 v9 = 0;
    }
  }

  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_personalDomainsIsEnabled));
  unint64_t v4 = (unint64_t)[v3 hash];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  self->_securePersonalDomainsRequireAuth));
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;
  unint64_t v7 = v6 ^ (unint64_t)-[NSUUID hash](self->_currentHomeIdentifier, "hash");

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = objc_alloc_init(&OBJC_CLASS___ADHomeInfo);
  -[ADHomeInfo setPersonalDomainsIsEnabled:]( v4,  "setPersonalDomainsIsEnabled:",  -[ADHomeInfo personalDomainsIsEnabled](self, "personalDomainsIsEnabled"));
  -[ADHomeInfo setSecurePersonalDomainsRequireAuth:]( v4,  "setSecurePersonalDomainsRequireAuth:",  -[ADHomeInfo securePersonalDomainsRequireAuth](self, "securePersonalDomainsRequireAuth"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADHomeInfo currentHomeIdentifier](self, "currentHomeIdentifier"));
  -[ADHomeInfo setCurrentHomeIdentifier:](v4, "setCurrentHomeIdentifier:", v5);

  return v4;
}

- (BOOL)personalDomainsIsEnabled
{
  return self->_personalDomainsIsEnabled;
}

- (void)setPersonalDomainsIsEnabled:(BOOL)a3
{
  self->_personalDomainsIsEnabled = a3;
}

- (BOOL)securePersonalDomainsRequireAuth
{
  return self->_securePersonalDomainsRequireAuth;
}

- (void)setSecurePersonalDomainsRequireAuth:(BOOL)a3
{
  self->_securePersonalDomainsRequireAuth = a3;
}

- (NSUUID)currentHomeIdentifier
{
  return self->_currentHomeIdentifier;
}

- (void)setCurrentHomeIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end