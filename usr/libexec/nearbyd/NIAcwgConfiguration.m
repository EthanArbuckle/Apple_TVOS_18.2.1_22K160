@interface NIAcwgConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NIAcwgConfiguration)initWithCoder:(id)a3;
- (NIAcwgConfiguration)initWithConfiguration:(id)a3;
- (NIAcwgConfiguration)initWithLockIdentifier:(id)a3;
- (NSDictionary)debugOptions;
- (NSString)lockIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionInternal;
- (int64_t)configurationType;
- (unint64_t)hash;
- (unsigned)lockBtConnHandle;
- (void)encodeWithCoder:(id)a3;
- (void)setDebugOptions:(id)a3;
- (void)setLockBtConnHandle:(unsigned __int16)a3;
- (void)setLockIdentifier:(id)a3;
@end

@implementation NIAcwgConfiguration

- (NIAcwgConfiguration)initWithLockIdentifier:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v10 handleFailureInMethod:a2, self, @"NIAcwgConfiguration.mm", 18, @"Invalid parameter not satisfying: %@", @"lockIdentifier" object file lineNumber description];
  }

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NIAcwgConfiguration;
  v7 = -[NIConfiguration initInternal](&v11, "initInternal");
  v8 = (NIAcwgConfiguration *)v7;
  if (v7)
  {
    objc_storeStrong(v7 + 6, a3);
    v8->_lockBtConnHandle = -1;
    v8->_configurationTypeInternal = 1LL;
  }

  return v8;
}

- (NIAcwgConfiguration)initWithConfiguration:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v12 handleFailureInMethod:a2, self, @"NIAcwgConfiguration.mm", 30, @"Invalid parameter not satisfying: %@", @"configuration" object file lineNumber description];
  }

  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___NIAcwgConfiguration;
  id v6 = -[NIConfiguration initInternal](&v13, "initInternal");
  if (v6)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v5 lockIdentifier]);
    lockIdentifier = v6->_lockIdentifier;
    v6->_lockIdentifier = (NSString *)v7;

    v6->_lockBtConnHandle = (unsigned __int16)[v5 lockBtConnHandle];
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v5 debugOptions]);
    debugOptions = v6->_debugOptions;
    v6->_debugOptions = (NSDictionary *)v9;

    v6->_configurationTypeInternal = (int64_t)[v5 configurationType];
  }

  return v6;
}

- (int64_t)configurationType
{
  return self->_configurationTypeInternal;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NIAcwgConfiguration;
  id v5 = -[NIConfiguration copyWithZone:](&v9, "copyWithZone:");
  [v5 setLockIdentifier:self->_lockIdentifier];
  [v5 setLockBtConnHandle:self->_lockBtConnHandle];
  v5[4] = self->_configurationTypeInternal;
  if (self->_debugOptions)
  {
    id v6 = -[NSDictionary initWithDictionary:copyItems:]( +[NSDictionary allocWithZone:](&OBJC_CLASS___NSDictionary, "allocWithZone:", a3),  "initWithDictionary:copyItems:",  self->_debugOptions,  1LL);
    uint64_t v7 = (void *)v5[7];
    v5[7] = v6;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_lockIdentifier forKey:@"lockIdentifier"];
  [v4 encodeInt:self->_lockBtConnHandle forKey:@"lockBtConnHandle"];
  [v4 encodeObject:self->_debugOptions forKey:@"debugOptions"];
  [v4 encodeInteger:self->_configurationTypeInternal forKey:@"configurationType"];
}

- (NIAcwgConfiguration)initWithCoder:(id)a3
{
  id v5 = a3;
  if (!self)
  {
    v19 = 0LL;
LABEL_9:
    self = v19;
    uint64_t v7 = self;
    goto LABEL_10;
  }

  id v6 = objc_msgSend( v5,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v4),  @"lockIdentifier");
  uint64_t v7 = (NIAcwgConfiguration *)objc_claimAutoreleasedReturnValue(v6);
  if (v7)
  {
    unsigned __int16 v8 = (unsigned __int16)[v5 decodeIntForKey:@"lockBtConnHandle"];
    uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSString, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL));
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v10));

    v21[0] = objc_opt_class(&OBJC_CLASS___NSString, v12);
    v21[1] = objc_opt_class(&OBJC_CLASS___NSNumber, v13);
    v21[2] = objc_opt_class(&OBJC_CLASS___NSData, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v21, 3LL));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v15));

    v17 = (void *)objc_claimAutoreleasedReturnValue( [v5 decodeDictionaryWithKeysOfClasses:v11 objectsOfClasses:v16 forKey:@"debugOptions"]);
    if ([v5 decodeIntegerForKey:@"configurationType"] == (id)1)
    {
      v18 = -[NIAcwgConfiguration initWithLockIdentifier:](self, "initWithLockIdentifier:", v7);
      v19 = v18;
      if (v18)
      {
        -[NIAcwgConfiguration setLockBtConnHandle:](v18, "setLockBtConnHandle:", v8);
        -[NIAcwgConfiguration setDebugOptions:](v19, "setDebugOptions:", v17);
      }
    }

    else
    {

      v19 = 0LL;
    }

    goto LABEL_9;
  }

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    uint64_t v7 = (NIAcwgConfiguration *)v4;
    unsigned __int16 v8 = v7;
    if (v7 == self)
    {
      BOOL v16 = 1;
    }

    else
    {
      lockIdentifier = self->_lockIdentifier;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NIAcwgConfiguration lockIdentifier](v7, "lockIdentifier"));
      unsigned int v11 = -[NSString isEqualToString:](lockIdentifier, "isEqualToString:", v10);

      int lockBtConnHandle = self->_lockBtConnHandle;
      unsigned int v13 = -[NIAcwgConfiguration lockBtConnHandle](v8, "lockBtConnHandle");
      debugOptions = self->_debugOptions;
      if (debugOptions)
      {
        BOOL v15 = 0;
      }

      else
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[NIAcwgConfiguration debugOptions](v8, "debugOptions"));
        BOOL v15 = v17 == 0LL;

        debugOptions = self->_debugOptions;
      }

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[NIAcwgConfiguration debugOptions](v8, "debugOptions"));
      unsigned __int8 v19 = -[NSDictionary isEqualToDictionary:](debugOptions, "isEqualToDictionary:", v18);

      int64_t configurationTypeInternal = self->_configurationTypeInternal;
      id v21 = -[NIAcwgConfiguration configurationType](v8, "configurationType");
      char v22 = v19 | v15;
      if (lockBtConnHandle == v13) {
        unsigned int v23 = v11;
      }
      else {
        unsigned int v23 = 0;
      }
      if ((id)configurationTypeInternal != v21) {
        char v22 = 0;
      }
      if (v23 == 1) {
        BOOL v16 = v22;
      }
      else {
        BOOL v16 = 0;
      }
    }
  }

  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (unint64_t)hash
{
  unint64_t v3 = -[NSString hash](self->_lockIdentifier, "hash") ^ self->_lockBtConnHandle;
  return v3 ^ (unint64_t)-[NSDictionary hash](self->_debugOptions, "hash") ^ self->_configurationTypeInternal;
}

- (id)description
{
  unint64_t v3 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v5 = (objc_class *)objc_opt_class(self, v4);
  uint64_t v6 = NSStringFromClass(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  unsigned __int16 v8 = (void *)objc_claimAutoreleasedReturnValue(-[NIAcwgConfiguration descriptionInternal](self, "descriptionInternal"));
  uint64_t v9 = -[NSString initWithFormat:](v3, "initWithFormat:", @"<%@: %@>", v7, v8);

  return v9;
}

- (id)descriptionInternal
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<lock identifier: %@, BT conn handle: 0x%04x, debug options: <%@>>",  self->_lockIdentifier,  self->_lockBtConnHandle,  self->_debugOptions);
}

- (NSString)lockIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setLockIdentifier:(id)a3
{
}

- (unsigned)lockBtConnHandle
{
  return self->_lockBtConnHandle;
}

- (void)setLockBtConnHandle:(unsigned __int16)a3
{
  self->_int lockBtConnHandle = a3;
}

- (NSDictionary)debugOptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setDebugOptions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end