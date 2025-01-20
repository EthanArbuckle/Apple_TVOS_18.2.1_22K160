@interface IDSAppleUser
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAppleUser:(id)a3;
- (BOOL)shouldReplace:(id)a3;
- (IDSAppleUser)initWithCoder:(id)a3;
- (IDSAppleUser)initWithUserName:(id)a3 DSID:(id)a4;
- (NSString)DSID;
- (NSString)description;
- (NSString)userName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)realmPrefixedIdentifier;
- (id)uniqueIdentifier;
- (int64_t)realm;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IDSAppleUser

- (IDSAppleUser)initWithUserName:(id)a3 DSID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___IDSAppleUser;
  v9 = -[IDSAppleUser init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_userName, a3);
    objc_storeStrong((id *)&v10->_DSID, a4);
  }

  return v10;
}

- (id)uniqueIdentifier
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  self->_userName,  self->_DSID);
}

- (int64_t)realm
{
  return 1LL;
}

- (id)realmPrefixedIdentifier
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAppleUser unprefixedIdentifier](self, "unprefixedIdentifier"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAppleUser unprefixedIdentifier](self, "unprefixedIdentifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  @"D:",  v4));
  }

  else
  {
    v5 = 0LL;
  }

  return v5;
}

- (BOOL)shouldReplace:(id)a3
{
  return 0;
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAppleUser uniqueIdentifier](self, "uniqueIdentifier"));
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0) {
    BOOL v7 = -[IDSAppleUser isEqualToAppleUser:](self, "isEqualToAppleUser:", v4);
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isEqualToAppleUser:(id)a3
{
  id v4 = (IDSAppleUser *)a3;
  uint64_t v5 = v4;
  if (self != v4)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAppleUser uniqueIdentifier](v4, "uniqueIdentifier"));
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAppleUser uniqueIdentifier](self, "uniqueIdentifier"));
    if (![v6 isEqualToString:v7])
    {
      unsigned __int8 v13 = 0;
LABEL_16:

      goto LABEL_17;
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAppleUser userName](v5, "userName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAppleUser userName](self, "userName"));
    if (v8 == v9)
    {
      objc_super v12 = -[IDSAppleUser DSID](v5, "DSID", v20, v22);
    }

    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAppleUser userName](v5, "userName"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAppleUser userName](self, "userName"));
      if (![v10 isEqual:v11])
      {
        unsigned __int8 v13 = 0;
LABEL_14:

LABEL_15:
        goto LABEL_16;
      }

      objc_super v12 = -[IDSAppleUser DSID](v5, "DSID", v11, v10);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(v12);
    uint64_t v15 = objc_claimAutoreleasedReturnValue(-[IDSAppleUser DSID](self, "DSID"));
    if (v14 == (void *)v15)
    {

      unsigned __int8 v13 = 1;
    }

    else
    {
      v16 = (void *)v15;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAppleUser DSID](v5, "DSID"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAppleUser DSID](self, "DSID"));
      unsigned __int8 v13 = [v17 isEqual:v18];
    }

    v11 = v21;
    v10 = v23;
    if (v8 == v9) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }

  unsigned __int8 v13 = 1;
LABEL_17:

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSAppleUser)initWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v5), @"username");
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v8), @"dsid");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v11 = -[IDSAppleUser initWithUserName:DSID:](self, "initWithUserName:DSID:", v7, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  userName = self->_userName;
  id v5 = a3;
  [v5 encodeObject:userName forKey:@"username"];
  [v5 encodeObject:self->_DSID forKey:@"dsid"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc(&OBJC_CLASS___IDSAppleUser);
  id v5 = -[NSString copy](self->_userName, "copy");
  id v6 = -[NSString copy](self->_DSID, "copy");
  BOOL v7 = -[IDSAppleUser initWithUserName:DSID:](v4, "initWithUserName:DSID:", v5, v6);

  return v7;
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class(self, a2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAppleUser uniqueIdentifier](self, "uniqueIdentifier"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAppleUser realmPrefixedIdentifier](self, "realmPrefixedIdentifier"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@:%p> uid: %@ rpi: %@",  v3,  self,  v4,  v5));

  return (NSString *)v6;
}

- (NSString)userName
{
  return self->_userName;
}

- (NSString)DSID
{
  return self->_DSID;
}

- (void).cxx_destruct
{
}

@end