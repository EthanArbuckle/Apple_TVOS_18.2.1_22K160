@interface IDSDeviceUser
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDeviceUser:(id)a3;
- (BOOL)shouldReplace:(id)a3;
- (IDSDeviceUser)deviceUserWithUpdatedServerUserID:(id)a3;
- (IDSDeviceUser)initWithCoder:(id)a3;
- (IDSDeviceUser)initWithUDID:(id)a3;
- (NSString)description;
- (NSString)deviceUDID;
- (NSString)serverUserID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)realmPrefixedIdentifier;
- (id)uniqueIdentifier;
- (id)unprefixedIdentifier;
- (int64_t)realm;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDeviceUDID:(id)a3;
- (void)setServerUserID:(id)a3;
@end

@implementation IDSDeviceUser

- (IDSDeviceUser)initWithUDID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___IDSDeviceUser;
  v6 = -[IDSDeviceUser init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_deviceUDID, a3);
  }

  return v7;
}

- (IDSDeviceUser)deviceUserWithUpdatedServerUserID:(id)a3
{
  id v4 = a3;
  id v5 = -[IDSDeviceUser copy](self, "copy");
  [v5 setServerUserID:v4];

  return (IDSDeviceUser *)v5;
}

- (id)uniqueIdentifier
{
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue(-[IDSDeviceUser deviceUDID](self, "deviceUDID"));
  v3 = v2;
  if (!v2) {
    v2 = @"DeviceUser";
  }
  id v4 = v2;

  return v4;
}

- (int64_t)realm
{
  return 3LL;
}

- (id)realmPrefixedIdentifier
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[IDSDeviceUser serverUserID](self, "serverUserID"));
  if (v3
    && (id v4 = (void *)v3,
        id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDeviceUser serverUserID](self, "serverUserID")),
        id v6 = [v5 rangeOfString:@":"],
        v5,
        v4,
        v6 != (id)0x7FFFFFFFFFFFFFFFLL))
  {
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDeviceUser serverUserID](self, "serverUserID"));
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDeviceUser unprefixedIdentifier](self, "unprefixedIdentifier"));
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDeviceUser unprefixedIdentifier](self, "unprefixedIdentifier"));
      objc_super v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  @"A:",  v8));
    }

    else
    {
      objc_super v9 = 0LL;
    }
  }

  return v9;
}

- (id)unprefixedIdentifier
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDeviceUser serverUserID](self, "serverUserID"));

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDeviceUser serverUserID](self, "serverUserID"));
    id v5 = (char *)[v4 rangeOfString:@":"];

    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDeviceUser serverUserID](self, "serverUserID"));
    v7 = v6;
    if (v5 != (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v8 = objc_claimAutoreleasedReturnValue([v6 substringFromIndex:v5 + 1]);

      v7 = (void *)v8;
    }
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDeviceUser deviceUDID](self, "deviceUDID"));
  }

  return v7;
}

- (BOOL)shouldReplace:(id)a3
{
  id v4 = a3;
  if ([v4 realm] == (id)3
    && (uint64_t v6 = objc_opt_class(&OBJC_CLASS___IDSDeviceUser, v5), (objc_opt_isKindOfClass(v4, v6) & 1) != 0))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 serverUserID]);
    if (v7)
    {
      BOOL v8 = 0;
    }

    else
    {
      objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDeviceUser serverUserID](self, "serverUserID"));
      BOOL v8 = v9 != 0LL;
    }
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDeviceUser uniqueIdentifier](self, "uniqueIdentifier"));
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0) {
    BOOL v7 = -[IDSDeviceUser isEqualToDeviceUser:](self, "isEqualToDeviceUser:", v4);
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isEqualToDeviceUser:(id)a3
{
  uint64_t v5 = (IDSDeviceUser *)a3;
  uint64_t v6 = v5;
  if (self != v5)
  {
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDeviceUser serverUserID](v5, "serverUserID"));
    if (v7
      || (id v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDeviceUser serverUserID](self, "serverUserID"))) != 0LL)
    {
      BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDeviceUser serverUserID](v6, "serverUserID"));
      objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDeviceUser serverUserID](self, "serverUserID"));
      unsigned int v10 = [v8 isEqualToString:v9];

      if (v7)
      {
LABEL_9:

        v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDeviceUser uniqueIdentifier](v6, "uniqueIdentifier"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDeviceUser uniqueIdentifier](self, "uniqueIdentifier"));
        unsigned int v11 = [v12 isEqualToString:v13] & v10;

        goto LABEL_10;
      }
    }

    else
    {
      unsigned int v10 = 1;
    }

    goto LABEL_9;
  }

  LOBYTE(v11) = 1;
LABEL_10:

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSDeviceUser)initWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v5), @"udid");
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  BOOL v8 = -[IDSDeviceUser initWithUDID:](self, "initWithUDID:", v7);
  id v10 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v9), @"serverID");
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  -[IDSDeviceUser setServerUserID:](v8, "setServerUserID:", v11);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDeviceUser deviceUDID](self, "deviceUDID"));
  [v4 encodeObject:v5 forKey:@"udid"];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[IDSDeviceUser serverUserID](self, "serverUserID"));
  [v4 encodeObject:v6 forKey:@"serverID"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc(&OBJC_CLASS___IDSDeviceUser);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDeviceUser deviceUDID](self, "deviceUDID"));
  id v6 = [v5 copy];
  BOOL v7 = -[IDSDeviceUser initWithUDID:](v4, "initWithUDID:", v6);

  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDeviceUser serverUserID](self, "serverUserID"));
  id v9 = [v8 copy];
  -[IDSDeviceUser setServerUserID:](v7, "setServerUserID:", v9);

  return v7;
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class(self, a2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDeviceUser uniqueIdentifier](self, "uniqueIdentifier"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDeviceUser realmPrefixedIdentifier](self, "realmPrefixedIdentifier"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@:%p> uid: %@ rpi: %@",  v3,  self,  v4,  v5));

  return (NSString *)v6;
}

- (NSString)deviceUDID
{
  return self->_deviceUDID;
}

- (void)setDeviceUDID:(id)a3
{
}

- (NSString)serverUserID
{
  return self->_serverUserID;
}

- (void)setServerUserID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end