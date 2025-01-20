@interface NEAOVPNException
+ (BOOL)supportsSecureCoding;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)isLimitedToUDP;
- (NEAOVPNException)initWithCoder:(id)a3;
- (NSArray)limitToProtocols;
- (NSString)bundleIdentifier;
- (NSString)serviceName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (int64_t)action;
- (void)encodeWithCoder:(id)a3;
- (void)setAction:(int64_t)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setLimitToProtocols:(id)a3;
- (void)setServiceName:(id)a3;
@end

@implementation NEAOVPNException

- (NEAOVPNException)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___NEAOVPNException;
  v5 = -[NEAOVPNException init](&v16, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ServiceName"];
    serviceName = v5->_serviceName;
    v5->_serviceName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BundleIdentifier"];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v8;

    v10 = (void *)MEMORY[0x189604010];
    uint64_t v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"LimitToProtocols"];
    limitToProtocols = v5->_limitToProtocols;
    v5->_limitToProtocols = (NSArray *)v13;

    v5->_action = (int)[v4 decodeInt32ForKey:@"Action"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  -[NEAOVPNException serviceName](self, "serviceName");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 encodeObject:v4 forKey:@"ServiceName"];
  v5 = -[NEAOVPNException bundleIdentifier](self, "bundleIdentifier");
  [v7 encodeObject:v5 forKey:@"BundleIdentifier"];

  -[NEAOVPNException limitToProtocols](self, "limitToProtocols");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 encodeObject:v6 forKey:@"LimitToProtocols"];

  objc_msgSend(v7, "encodeInt32:forKey:", -[NEAOVPNException action](self, "action"), @"Action");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = -[NEAOVPNException init]( +[NEAOVPNException allocWithZone:](&OBJC_CLASS___NEAOVPNException, "allocWithZone:", a3),  "init");
  v5 = -[NEAOVPNException serviceName](self, "serviceName");
  -[NEAOVPNException setServiceName:](v4, "setServiceName:", v5);

  -[NEAOVPNException bundleIdentifier](self, "bundleIdentifier");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEAOVPNException setBundleIdentifier:](v4, "setBundleIdentifier:", v6);

  -[NEAOVPNException limitToProtocols](self, "limitToProtocols");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEAOVPNException setLimitToProtocols:](v4, "setLimitToProtocols:", v7);

  -[NEAOVPNException setAction:](v4, "setAction:", -[NEAOVPNException action](self, "action"));
  return v4;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4 = a3;
  v5 = -[NEAOVPNException serviceName](self, "serviceName");
  if (!v5) {
    goto LABEL_8;
  }
  -[NEAOVPNException serviceName](self, "serviceName");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEAOVPNException serviceName](self, "serviceName");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v7 isEqualToString:@"VoiceMail"])
  {
LABEL_6:

LABEL_7:
    goto LABEL_8;
  }

  -[NEAOVPNException serviceName](self, "serviceName");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v8 isEqualToString:@"CellularServices"])
  {

    goto LABEL_6;
  }

  -[NEAOVPNException serviceName](self, "serviceName");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  char v12 = [v11 isEqualToString:@"DeviceCommunication"];

  if ((v12 & 1) == 0)
  {
    +[NEConfiguration addError:toList:]( (uint64_t)&OBJC_CLASS___NEConfiguration,  @"Invalid service name for service exception",  v4);
    BOOL v9 = 0;
    goto LABEL_9;
  }

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc_init(MEMORY[0x189607940]);
  -[NEAOVPNException serviceName](self, "serviceName");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v8 withName:@"service-name" andIndent:v5 options:a4];

  -[NEAOVPNException bundleIdentifier](self, "bundleIdentifier");
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v9 withName:@"bundle-identifier" andIndent:v5 options:a4];
  v10 = -[NEAOVPNException limitToProtocols](self, "limitToProtocols");
  [v7 appendPrettyObject:v10 withName:@"limit-to-protocols" andIndent:v5 options:a4];

  objc_msgSend( v7,  "appendPrettyInt:withName:andIndent:options:",  -[NEAOVPNException action](self, "action"),  @"action",  v5,  a4);
  return v7;
}

- (BOOL)isLimitedToUDP
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  v2 = -[NEAOVPNException limitToProtocols](self, "limitToProtocols", 0LL);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0LL; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v9 + 1) + 8 * i) isEqualToString:@"UDP"])
        {
          BOOL v7 = 1;
          goto LABEL_11;
        }
      }

      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

  BOOL v7 = 0;
LABEL_11:

  return v7;
}

- (NSString)serviceName
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setServiceName:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSArray)limitToProtocols
{
  return (NSArray *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setLimitToProtocols:(id)a3
{
}

- (int64_t)action
{
  return self->_action;
}

- (void)setAction:(int64_t)a3
{
  self->_action = a3;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end