@interface MSDAccountContext
+ (BOOL)supportsSecureCoding;
- (BOOL)resetCDP;
- (MSDAccountContext)initWithCoder:(id)a3;
- (NSDictionary)features;
- (NSString)localSecret;
- (NSString)password;
- (NSString)recoveryKey;
- (NSString)username;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setFeatures:(id)a3;
- (void)setLocalSecret:(id)a3;
- (void)setPassword:(id)a3;
- (void)setRecoveryKey:(id)a3;
- (void)setResetCDP:(BOOL)a3;
- (void)setUsername:(id)a3;
@end

@implementation MSDAccountContext

- (id)description
{
  int has_internal_content = os_variant_has_internal_content("com.apple.mobilestoredemod");
  v5 = (objc_class *)objc_opt_class(self, v4);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[MSDAccountContext username](self, "username"));
  v9 = (void *)v8;
  if (has_internal_content)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountContext password](self, "password"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountContext recoveryKey](self, "recoveryKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@[%p]: Username=%@ Password=%@ RecoveryKey=%@>",  v7,  self,  v9,  v10,  v11));
  }

  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@[%p]: Username=%@>",  v7,  self,  v8));
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MSDAccountContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___MSDAccountContext;
  v6 = -[MSDAccountContext init](&v30, "init");
  if (v6)
  {
    id v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v5), @"username");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[MSDAccountContext setUsername:](v6, "setUsername:", v8);

    id v10 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v9), @"password");
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[MSDAccountContext setPassword:](v6, "setPassword:", v11);

    id v13 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v12),  @"localSecret");
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    -[MSDAccountContext setLocalSecret:](v6, "setLocalSecret:", v14);

    id v16 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v15),  @"recoveryKey");
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    -[MSDAccountContext setRecoveryKey:](v6, "setRecoveryKey:", v17);

    id v19 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSNumber, v18),  @"resetCDP");
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    -[MSDAccountContext setResetCDP:](v6, "setResetCDP:", [v20 BOOLValue]);

    uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSDictionary, v21);
    uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSString, v23);
    v26 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v22,  v24,  objc_opt_class(&OBJC_CLASS___NSNumber, v25),  0LL);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v27 forKey:@"features"]);
    -[MSDAccountContext setFeatures:](v6, "setFeatures:", v28);
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountContext username](self, "username"));
  [v4 encodeObject:v5 forKey:@"username"];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountContext password](self, "password"));
  [v4 encodeObject:v6 forKey:@"password"];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountContext localSecret](self, "localSecret"));
  [v4 encodeObject:v7 forKey:@"localSecret"];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountContext recoveryKey](self, "recoveryKey"));
  [v4 encodeObject:v8 forKey:@"recoveryKey"];

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[MSDAccountContext resetCDP](self, "resetCDP")));
  [v4 encodeObject:v9 forKey:@"resetCDP"];

  id v10 = (id)objc_claimAutoreleasedReturnValue(-[MSDAccountContext features](self, "features"));
  [v4 encodeObject:v10 forKey:@"features"];
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
}

- (NSString)localSecret
{
  return self->_localSecret;
}

- (void)setLocalSecret:(id)a3
{
}

- (NSString)recoveryKey
{
  return self->_recoveryKey;
}

- (void)setRecoveryKey:(id)a3
{
}

- (BOOL)resetCDP
{
  return self->_resetCDP;
}

- (void)setResetCDP:(BOOL)a3
{
  self->_resetCDP = a3;
}

- (NSDictionary)features
{
  return self->_features;
}

- (void)setFeatures:(id)a3
{
}

- (void).cxx_destruct
{
}

@end