@interface PKDPersona
+ (BOOL)personasAreSupported;
- (BOOL)isEnterprise;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPersona:(id)a3;
- (NSNumber)personaID;
- (PKDPersona)initWithPersonaID:(id)a3 enterprise:(BOOL)a4;
- (id)description;
- (unint64_t)hash;
@end

@implementation PKDPersona

- (PKDPersona)initWithPersonaID:(id)a3 enterprise:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PKDPersona;
  v8 = -[PKDPersona init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_personaID, a3);
    v9->_enterprise = a4;
  }

  return v9;
}

+ (BOOL)personasAreSupported
{
  return 0;
}

- (unint64_t)hash
{
  return (unint64_t)-[NSNumber hash](self->_personaID, "hash");
}

- (BOOL)isEqualToPersona:(id)a3
{
  v4 = a3;
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PKDPersona *)a3;
  unsigned __int8 v5 = self == v4;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___PKDPersona);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0) {
    unsigned __int8 v5 = -[PKDPersona isEqualToPersona:](self, "isEqualToPersona:", v4);
  }

  return v5;
}

- (id)description
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v4 = objc_opt_class(self);
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPersona personaID](self, "personaID"));
  unsigned int v6 = -[PKDPersona isEnterprise](self, "isEnterprise");
  id v7 = "NO";
  if (v6) {
    id v7 = "YES";
  }
  v8 = -[NSString initWithFormat:](v3, "initWithFormat:", @"%@: personaID: %@, isEnterprise: %s", v4, v5, v7);

  return v8;
}

- (NSNumber)personaID
{
  return (NSNumber *)objc_getProperty(self, a2, 16LL, 1);
}

- (BOOL)isEnterprise
{
  return self->_enterprise;
}

- (void).cxx_destruct
{
}

@end