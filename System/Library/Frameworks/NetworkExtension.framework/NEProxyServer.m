@interface NEProxyServer
+ (BOOL)supportsSecureCoding;
- (BOOL)authenticationRequired;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)needToUpdateKeychain;
- (NEProxyServer)initWithAddress:(NSString *)address port:(NSInteger)port;
- (NEProxyServer)initWithCoder:(id)a3;
- (NEProxyServer)initWithType:(int64_t)a3 address:(id)a4 port:(int64_t)a5;
- (NSInteger)port;
- (NSString)address;
- (NSString)password;
- (NSString)username;
- (id)copyPassword;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (int64_t)type;
- (void)copyProtectionSpace;
- (void)encodeWithCoder:(id)a3;
- (void)removeFromKeychain;
- (void)setAuthenticationRequired:(BOOL)authenticationRequired;
- (void)setPassword:(NSString *)password;
- (void)setType:(int64_t)a3;
- (void)setUsername:(NSString *)username;
- (void)syncWithKeychain;
@end

@implementation NEProxyServer

- (NEProxyServer)initWithAddress:(NSString *)address port:(NSInteger)port
{
  return -[NEProxyServer initWithType:address:port:](self, "initWithType:address:port:", 1LL, address, port);
}

- (NEProxyServer)initWithType:(int64_t)a3 address:(id)a4 port:(int64_t)a5
{
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___NEProxyServer;
  v9 = -[NEProxyServer init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_type = a3;
    uint64_t v11 = [v8 copy];
    address = v10->_address;
    v10->_address = (NSString *)v11;

    v10->_port = a5;
  }

  return v10;
}

- (NEProxyServer)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___NEProxyServer;
  v5 = -[NEProxyServer init](&v13, sel_init);
  if (v5)
  {
    v5->_type = (int)[v4 decodeInt32ForKey:@"Type"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Address"];
    address = v5->_address;
    v5->_address = (NSString *)v6;

    v5->_port = (int)[v4 decodeInt32ForKey:@"Port"];
    v5->_authenticationRequired = [v4 decodeBoolForKey:@"AuthenticationRequired"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Username"];
    username = v5->_username;
    v5->_username = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Password"];
    password = v5->_password;
    v5->_password = (NSString *)v10;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt32:forKey:", -[NEProxyServer type](self, "type"), @"Type");
  v5 = -[NEProxyServer address](self, "address");
  [v4 encodeObject:v5 forKey:@"Address"];

  objc_msgSend(v4, "encodeInt32:forKey:", -[NEProxyServer port](self, "port"), @"Port");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[NEProxyServer authenticationRequired](self, "authenticationRequired"),  @"AuthenticationRequired");
  -[NEProxyServer username](self, "username");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"Username"];

  -[NEProxyServer password](self, "password");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v7 forKey:@"Password"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[NEProxyServer allocWithZone:](&OBJC_CLASS___NEProxyServer, "allocWithZone:", a3);
  int64_t v5 = -[NEProxyServer type](self, "type");
  -[NEProxyServer address](self, "address");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = -[NEProxyServer initWithType:address:port:]( v4,  "initWithType:address:port:",  v5,  v6,  -[NEProxyServer port](self, "port"));

  -[NEProxyServer setAuthenticationRequired:]( v7,  "setAuthenticationRequired:",  -[NEProxyServer authenticationRequired](self, "authenticationRequired"));
  -[NEProxyServer username](self, "username");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEProxyServer setUsername:](v7, "setUsername:", v8);
  v9 = -[NEProxyServer password](self, "password");
  -[NEProxyServer setPassword:](v7, "setPassword:", v9);

  return v7;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4 = a3;
  -[NEProxyServer address](self, "address");
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5) {
    +[NEConfiguration addError:toList:]( (uint64_t)&OBJC_CLASS___NEConfiguration,  @"Missing proxy server address",  v4);
  }

  return v5 != 0LL;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithCapacity:0];
  unint64_t v8 = -[NEProxyServer type](self, "type") - 2;
  if (v8 > 4) {
    v9 = @"http";
  }
  else {
    v9 = off_18A08FA08[v8];
  }
  [v7 appendPrettyObject:v9 withName:@"type" andIndent:v5 options:a4];
  -[NEProxyServer address](self, "address");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v11 = a4 | 1;
  [v7 appendPrettyObject:v10 withName:@"address" andIndent:v5 options:a4 | 1];

  objc_msgSend( v7,  "appendPrettyInt:withName:andIndent:options:",  (int)-[NEProxyServer port](self, "port"),  @"port",  v5,  a4);
  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEProxyServer authenticationRequired](self, "authenticationRequired"),  @"authenticationRequired",  v5,  a4);
  v12 = -[NEProxyServer username](self, "username");
  [v7 appendPrettyObject:v12 withName:@"username" andIndent:v5 options:v11];

  -[NEProxyServer password](self, "password");
  objc_super v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v13 withName:@"password" andIndent:v5 options:v11];

  return v7;
}

- (id)copyPassword
{
  v2 = -[NEProxyServer copyProtectionSpace](self);
  if (v2)
  {
    [MEMORY[0x189607A68] sharedCredentialStorage];
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 defaultCredentialForProtectionSpace:v2];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      [v4 password];
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v5 = 0LL;
    }
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  return v5;
}

- (NSString)address
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSInteger)port
{
  return self->_port;
}

- (BOOL)authenticationRequired
{
  return self->_authenticationRequired;
}

- (void)setAuthenticationRequired:(BOOL)authenticationRequired
{
  self->_authenticationRequired = authenticationRequired;
}

- (NSString)username
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setUsername:(NSString *)username
{
}

- (NSString)password
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setPassword:(NSString *)password
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
}

- (void)copyProtectionSpace
{
  v1 = a1;
  if (a1)
  {
    unint64_t v2 = [a1 type] - 1;
    if (v2 <= 4 && ((0x17u >> v2) & 1) != 0)
    {
      id v3 = **((id **)&unk_18A08FA30 + v2);
      if (v3)
      {
        [v1 address];
        uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v6 = [v5 length];

        if (v6)
        {
          id v7 = objc_alloc(MEMORY[0x189607A78]);
          [v1 address];
          unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v9 = [v1 port];
          v1 = (void *)[v7 initWithProxyHost:v8 port:v9 type:v3 realm:0 authenticationMethod:*MEMORY[0x189607730]];

          goto LABEL_6;
        }
      }
    }

    else
    {
      id v3 = 0LL;
    }

    v1 = 0LL;
LABEL_6:
  }

  return v1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)syncWithKeychain
{
  if (a1)
  {
    id v11 = -[NEProxyServer copyProtectionSpace](a1);
    if (!v11) {
      goto LABEL_13;
    }
    if ([a1 authenticationRequired])
    {
      [a1 password];
      unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v2 length])
      {
        [a1 username];
        id v3 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v4 = [v3 length];

        if (v4)
        {
          id v5 = objc_alloc(MEMORY[0x189607A60]);
          [a1 username];
          uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
          [a1 password];
          id v7 = (void *)objc_claimAutoreleasedReturnValue();
          unint64_t v8 = (void *)[v5 initWithUser:v6 password:v7 persistence:2];

          if (v8)
          {
            [MEMORY[0x189607A68] sharedCredentialStorage];
            uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
            [v9 setDefaultCredential:v8 forProtectionSpace:v11];
LABEL_12:
          }

- (BOOL)needToUpdateKeychain
{
  BOOL v1 = (BOOL)a1;
  if (a1)
  {
    [a1 password];
    unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      [(id)v1 password];
      id v3 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v1 = [v3 length] != 0;
    }

    else
    {
      BOOL v1 = 0LL;
    }
  }

  return v1;
}

- (void)removeFromKeychain
{
  if (a1)
  {
    BOOL v1 = -[NEProxyServer copyProtectionSpace](a1);
    if (v1)
    {
      id v5 = v1;
      [MEMORY[0x189607A68] sharedCredentialStorage];
      unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
      [v2 defaultCredentialForProtectionSpace:v5];
      id v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3)
      {
        [MEMORY[0x189607A68] sharedCredentialStorage];
        uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
        [v4 removeCredential:v3 forProtectionSpace:v5];
      }

      BOOL v1 = v5;
    }
  }

@end