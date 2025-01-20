@interface KTAccountState
+ (BOOL)supportsSecureCoding;
- (BOOL)hasBeenEnabled;
- (KTAccountState)initWithCoder:(id)a3;
- (NSString)altDSID;
- (unint64_t)environment;
- (void)encodeWithCoder:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setEnvironment:(unint64_t)a3;
- (void)setHasBeenEnabled:(BOOL)a3;
@end

@implementation KTAccountState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccountState altDSID](self, "altDSID"));
  [v4 encodeObject:v5 forKey:@"altDSID"];

  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[KTAccountState environment](self, "environment")));
  [v4 encodeObject:v6 forKey:@"env"];

  id v7 = (id)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[KTAccountState hasBeenEnabled](self, "hasBeenEnabled")));
  [v4 encodeObject:v7 forKey:@"hasBeen"];
}

- (KTAccountState)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___KTAccountState;
  v6 = -[KTAccountState init](&v19, "init");
  if (v6)
  {
    id v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v5), @"altDSID");
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[KTAccountState setAltDSID:](v6, "setAltDSID:", v8);

    id v10 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSNumber, v9),  @"hasBeenEnabled");
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[KTAccountState setHasBeenEnabled:](v6, "setHasBeenEnabled:", [v11 BOOLValue]);

    id v13 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber, v12), @"env");
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    unsigned int v15 = [v14 intValue];

    if (v15 == 1) {
      uint64_t v16 = 1LL;
    }
    else {
      uint64_t v16 = 2LL * (v15 == 2);
    }
    -[KTAccountState setEnvironment:](v6, "setEnvironment:", v16);
    v17 = v6;
  }

  return v6;
}

- (NSString)altDSID
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setAltDSID:(id)a3
{
}

- (unint64_t)environment
{
  return self->_environment;
}

- (void)setEnvironment:(unint64_t)a3
{
  self->_environment = a3;
}

- (BOOL)hasBeenEnabled
{
  return self->_hasBeenEnabled;
}

- (void)setHasBeenEnabled:(BOOL)a3
{
  self->_hasBeenEnabled = a3;
}

- (void).cxx_destruct
{
}

@end