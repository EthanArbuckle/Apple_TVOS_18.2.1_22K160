@interface MTIDScheme
+ (BOOL)supportsSecureCoding;
- (BOOL)isDefault;
- (BOOL)isEqual:(id)a3;
- (MTIDScheme)initWithCoder:(id)a3;
- (MTIDScheme)initWithNamespace:(id)a3 options:(id)a4;
- (MTIDScheme)initWithNamespace:(id)a3 type:(int64_t)a4;
- (NSArray)correlations;
- (NSArray)topics;
- (NSString)containerIdentifier;
- (NSString)idNamespace;
- (NSString)version;
- (double)maxFutureTimeInterval;
- (double)maxPastTimeInterval;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)idType;
- (int64_t)lifespan;
- (int64_t)rotationSchedule;
- (unint64_t)calculateHash;
- (unint64_t)correlationHash;
- (unint64_t)hash;
- (unint64_t)localHash;
- (unint64_t)storagePoolSize;
- (void)encodeWithCoder:(id)a3;
- (void)overrideLifespanMaybe;
- (void)setContainerIdentifier:(id)a3;
- (void)setCorrelationHash:(unint64_t)a3;
- (void)setCorrelations:(id)a3;
- (void)setIdNamespace:(id)a3;
- (void)setIdType:(int64_t)a3;
- (void)setIsDefault:(BOOL)a3;
- (void)setLifespan:(int64_t)a3;
- (void)setLocalHash:(unint64_t)a3;
- (void)setRotationSchedule:(int64_t)a3;
- (void)setTopics:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation MTIDScheme

- (MTIDScheme)initWithNamespace:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___MTIDScheme;
  v8 = -[MTIDScheme init](&v22, "init");
  v9 = v8;
  if (v8)
  {
    -[MTIDScheme setIdNamespace:](v8, "setIdNamespace:", v6);
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v7, v10) & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"rotation"]);
      id v12 = [@"daily" compare:v11 options:1];

      if (v12)
      {
        -[MTIDScheme setRotationSchedule:](v9, "setRotationSchedule:", 0LL);
        v13 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"lifespan"]);
        -[MTIDScheme setLifespan:](v9, "setLifespan:", [v13 longLongValue]);
      }

      else
      {
        -[MTIDScheme setRotationSchedule:](v9, "setRotationSchedule:", 1LL);
        -[MTIDScheme setLifespan:](v9, "setLifespan:", 86400LL);
      }

      v14 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"correlations"]);
      id v15 = [v14 copy];
      -[MTIDScheme setCorrelations:](v9, "setCorrelations:", v15);

      v16 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"version"]);
      -[MTIDScheme setVersion:](v9, "setVersion:", v16);

      v17 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"type"]);
      uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0)
      {
        if ([@"userid" caseInsensitiveCompare:v17])
        {
          if ([@"user" caseInsensitiveCompare:v17]) {
            uint64_t v19 = 1LL;
          }
          else {
            uint64_t v19 = 2LL;
          }
        }

        else
        {
          uint64_t v19 = 2LL;
        }
      }

      else
      {
        uint64_t v19 = 1LL;
      }

      -[MTIDScheme setIdType:](v9, "setIdType:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"container"]);
      -[MTIDScheme setContainerIdentifier:](v9, "setContainerIdentifier:", v20);
    }

    else
    {
      -[MTIDScheme setIdType:](v9, "setIdType:", 1LL);
    }

    -[MTIDScheme overrideLifespanMaybe](v9, "overrideLifespanMaybe");
    -[MTIDScheme setLocalHash:](v9, "setLocalHash:", -[MTIDScheme calculateHash](v9, "calculateHash"));
  }

  return v9;
}

- (MTIDScheme)initWithNamespace:(id)a3 type:(int64_t)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MTIDScheme;
  id v7 = -[MTIDScheme init](&v10, "init");
  v8 = v7;
  if (v7)
  {
    -[MTIDScheme setIdNamespace:](v7, "setIdNamespace:", v6);
    -[MTIDScheme setIdType:](v8, "setIdType:", a4);
    -[MTIDScheme overrideLifespanMaybe](v8, "overrideLifespanMaybe");
    -[MTIDScheme setLocalHash:](v8, "setLocalHash:", -[MTIDScheme calculateHash](v8, "calculateHash"));
  }

  return v8;
}

- (void)overrideLifespanMaybe
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTFrameworkEnvironment sharedEnvironment](&OBJC_CLASS___MTFrameworkEnvironment, "sharedEnvironment"));
  unsigned int v4 = [v3 isInternalBuild];

  if (v4)
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDScheme idNamespace](self, "idNamespace"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"MTIDServiceLifespanOverride~%@",  v5));

    uint64_t v7 = (uint64_t)[v8 integerForKey:v6];
    if (!v7) {
      uint64_t v7 = (uint64_t)[v8 integerForKey:@"MTIDServiceLifespanOverride"];
    }
    if (v7 >= 1)
    {
      -[MTIDScheme setRotationSchedule:](self, "setRotationSchedule:", 0LL);
      -[MTIDScheme setLifespan:](self, "setLifespan:", v7);
    }
  }

- (NSString)containerIdentifier
{
  containerIdentifier = self->_containerIdentifier;
  if (containerIdentifier)
  {
    v3 = containerIdentifier;
  }

  else if ((id)-[MTIDScheme idType](self, "idType") == (id)2)
  {
    v3 = @"com.apple.amp-ae.metricskit.identifiers";
  }

  else
  {
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue( +[MTFrameworkEnvironment sharedEnvironment]( &OBJC_CLASS___MTFrameworkEnvironment,  "sharedEnvironment"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue([v4 hostProcessBundleIdentifier]);
  }

  return (NSString *)v3;
}

- (unint64_t)storagePoolSize
{
  if (!-[MTIDScheme lifespan](self, "lifespan")) {
    return 1LL;
  }
  unint64_t v3 = 0x2A3000 / (unint64_t)-[MTIDScheme lifespan](self, "lifespan");
  if (v3 <= 3) {
    unint64_t v3 = 3LL;
  }
  if (v3 >= 0x20) {
    return 32LL;
  }
  else {
    return v3;
  }
}

- (double)maxFutureTimeInterval
{
  if (!-[MTIDScheme lifespan](self, "lifespan")) {
    return 1.79769313e308;
  }
  unint64_t v3 = -[MTIDScheme storagePoolSize](self, "storagePoolSize");
  double v4 = (double)(-[MTIDScheme lifespan](self, "lifespan") * v3);
  -[MTIDScheme maxPastTimeInterval](self, "maxPastTimeInterval");
  return v4 - v5;
}

- (double)maxPastTimeInterval
{
  return (double)(2 * -[MTIDScheme lifespan](self, "lifespan"));
}

- (id)description
{
  unint64_t v3 = (objc_class *)objc_opt_class(self);
  double v4 = NSStringFromClass(v3);
  double v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDScheme idNamespace](self, "idNamespace"));
  int64_t v7 = -[MTIDScheme lifespan](self, "lifespan");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDScheme correlations](self, "correlations"));
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p, namespace: %@, lifespan: %lld correlations: %@ >",  v5,  self,  v6,  v7,  v8));

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(self);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    id v6 = v4;
    id v7 = -[MTIDScheme hash](self, "hash");
    if (v7 == [v6 hash])
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDScheme idNamespace](self, "idNamespace"));
      v9 = (void *)objc_claimAutoreleasedReturnValue([v6 idNamespace]);
      if ([v8 isEqual:v9]
        && (id v10 = -[MTIDScheme lifespan](self, "lifespan"), v10 == [v6 lifespan])
        && (id v11 = -[MTIDScheme idType](self, "idType"), v11 == [v6 idType]))
      {
        uint64_t v12 = objc_claimAutoreleasedReturnValue(-[MTIDScheme correlations](self, "correlations"));
        v13 = (void *)v12;
        if (v12) {
          v14 = (void *)v12;
        }
        else {
          v14 = &__NSArray0__struct;
        }
        uint64_t v15 = objc_claimAutoreleasedReturnValue([v6 correlations]);
        v16 = (void *)v15;
        if (v15) {
          v17 = (void *)v15;
        }
        else {
          v17 = &__NSArray0__struct;
        }
        if ([v14 isEqual:v17])
        {
          uint64_t v18 = objc_claimAutoreleasedReturnValue(-[MTIDScheme version](self, "version"));
          v31 = (void *)v18;
          if (v18) {
            uint64_t v19 = (__CFString *)v18;
          }
          else {
            uint64_t v19 = &stru_100021530;
          }
          uint64_t v20 = objc_claimAutoreleasedReturnValue([v6 version]);
          v21 = (void *)v20;
          if (v20) {
            objc_super v22 = (const __CFString *)v20;
          }
          else {
            objc_super v22 = &stru_100021530;
          }
          if (-[__CFString isEqual:](v19, "isEqual:", v22))
          {
            uint64_t v23 = objc_claimAutoreleasedReturnValue(-[MTIDScheme containerIdentifier](self, "containerIdentifier"));
            if (v23) {
              v24 = (__CFString *)v23;
            }
            else {
              v24 = &stru_100021530;
            }
            uint64_t v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "containerIdentifier", v23, v31));
            v26 = (void *)v25;
            if (v25) {
              v27 = (const __CFString *)v25;
            }
            else {
              v27 = &stru_100021530;
            }
            unsigned __int8 v28 = -[__CFString isEqual:](v24, "isEqual:", v27);
          }

          else
          {
            unsigned __int8 v28 = 0;
          }
        }

        else
        {
          unsigned __int8 v28 = 0;
        }
      }

      else
      {
        unsigned __int8 v28 = 0;
      }
    }

    else
    {
      unsigned __int8 v28 = 0;
    }
  }

  else
  {
    unsigned __int8 v28 = 0;
  }

  return v28;
}

- (unint64_t)hash
{
  unint64_t v3 = -[MTIDScheme localHash](self, "localHash");
  return -[MTIDScheme correlationHash](self, "correlationHash") ^ v3;
}

- (unint64_t)calculateHash
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDScheme idNamespace](self, "idNamespace"));
  unint64_t v4 = (unint64_t)[v3 hash];

  int64_t v5 = -[MTIDScheme lifespan](self, "lifespan");
  unint64_t v6 = v5 ^ -[MTIDScheme rotationSchedule](self, "rotationSchedule") ^ v4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDScheme version](self, "version"));
  unint64_t v8 = (unint64_t)[v7 hash];

  unint64_t v9 = v6 ^ v8 ^ -[MTIDScheme idType](self, "idType");
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDScheme containerIdentifier](self, "containerIdentifier"));
  unint64_t v11 = v9 ^ (unint64_t)[v10 hash];

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDScheme correlations](self, "correlations", 0LL));
  id v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      v16 = 0LL;
      do
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        v11 ^= (unint64_t)[*(id *)(*((void *)&v18 + 1) + 8 * (void)v16) hash];
        v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v14);
  }

  return v11;
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDScheme idNamespace](self, "idNamespace"));
  [v3 setObject:v4 forKeyedSubscript:@"namespace"];

  if ((id)-[MTIDScheme idType](self, "idType") == (id)2) {
    int64_t v5 = @"user";
  }
  else {
    int64_t v5 = @"client";
  }
  [v3 setObject:v5 forKeyedSubscript:@"type"];
  if ((id)-[MTIDScheme rotationSchedule](self, "rotationSchedule") == (id)1)
  {
    [v3 setObject:@"daily" forKeyedSubscript:@"rotation"];
  }

  else if (-[MTIDScheme lifespan](self, "lifespan") >= 1)
  {
    unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  -[MTIDScheme lifespan](self, "lifespan")));
    [v3 setObject:v6 forKeyedSubscript:@"lifespan"];
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDScheme correlations](self, "correlations"));
  id v8 = [v7 count];

  if (v8)
  {
    unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDScheme correlations](self, "correlations"));
    [v3 setObject:v9 forKeyedSubscript:@"correlations"];
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDScheme version](self, "version"));
  [v3 setObject:v10 forKeyedSubscript:@"version"];

  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDScheme containerIdentifier](self, "containerIdentifier"));
  [v3 setObject:v11 forKeyedSubscript:@"container"];

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDScheme topics](self, "topics"));
  id v13 = [v12 count];

  if (v13)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDScheme topics](self, "topics"));
    [v3 setObject:v14 forKeyedSubscript:@"topics"];
  }

  if (-[MTIDScheme isDefault](self, "isDefault"))
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[MTIDScheme isDefault](self, "isDefault")));
    [v3 setObject:v15 forKeyedSubscript:@"default"];
  }

  id v16 = [v3 copy];

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDScheme idNamespace](self, "idNamespace"));
  [v9 encodeObject:v4 forKey:@"namespace"];

  objc_msgSend(v9, "encodeInt:forKey:", -[MTIDScheme idType](self, "idType"), @"type");
  objc_msgSend(v9, "encodeInt:forKey:", -[MTIDScheme rotationSchedule](self, "rotationSchedule"), @"rotation");
  objc_msgSend(v9, "encodeInt64:forKey:", -[MTIDScheme lifespan](self, "lifespan"), @"lifespan");
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDScheme correlations](self, "correlations"));
  [v9 encodeObject:v5 forKey:@"correlations"];

  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDScheme version](self, "version"));
  [v9 encodeObject:v6 forKey:@"version"];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDScheme containerIdentifier](self, "containerIdentifier"));
  [v9 encodeObject:v7 forKey:@"container"];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDScheme topics](self, "topics"));
  [v9 encodeObject:v8 forKey:@"topics"];

  objc_msgSend(v9, "encodeBool:forKey:", -[MTIDScheme isDefault](self, "isDefault"), @"default");
  objc_msgSend(v9, "encodeInt:forKey:", -[MTIDScheme localHash](self, "localHash"), @"localHash");
  objc_msgSend( v9,  "encodeInt:forKey:",  -[MTIDScheme correlationHash](self, "correlationHash"),  @"correlationHash");
}

- (MTIDScheme)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___MTIDScheme;
  int64_t v5 = -[MTIDScheme init](&v17, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"namespace"];
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[MTIDScheme setIdNamespace:](v5, "setIdNamespace:", v7);

    -[MTIDScheme setIdType:](v5, "setIdType:", (int)[v4 decodeIntForKey:@"type"]);
    -[MTIDScheme setRotationSchedule:]( v5,  "setRotationSchedule:",  (int)[v4 decodeIntForKey:@"rotation"]);
    -[MTIDScheme setLifespan:](v5, "setLifespan:", [v4 decodeInt64ForKey:@"lifespan"]);
    id v8 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class(NSString) forKey:@"correlations"];
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[MTIDScheme setCorrelations:](v5, "setCorrelations:", v9);

    id v10 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"version"];
    unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[MTIDScheme setVersion:](v5, "setVersion:", v11);

    id v12 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"container"];
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    -[MTIDScheme setContainerIdentifier:](v5, "setContainerIdentifier:", v13);

    id v14 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class(NSString) forKey:@"topics"];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    -[MTIDScheme setTopics:](v5, "setTopics:", v15);

    -[MTIDScheme setIsDefault:](v5, "setIsDefault:", [v4 decodeBoolForKey:@"default"]);
    -[MTIDScheme setLocalHash:](v5, "setLocalHash:", (int)[v4 decodeIntForKey:@"localHash"]);
    -[MTIDScheme setCorrelationHash:]( v5,  "setCorrelationHash:",  (int)[v4 decodeIntForKey:@"correlationHash"]);
  }

  return v5;
}

- (NSString)idNamespace
{
  return self->_idNamespace;
}

- (void)setIdNamespace:(id)a3
{
}

- (int64_t)idType
{
  return self->_idType;
}

- (void)setIdType:(int64_t)a3
{
  self->_idType = a3;
}

- (int64_t)rotationSchedule
{
  return self->_rotationSchedule;
}

- (void)setRotationSchedule:(int64_t)a3
{
  self->_rotationSchedule = a3;
}

- (int64_t)lifespan
{
  return self->_lifespan;
}

- (void)setLifespan:(int64_t)a3
{
  self->_lifespan = a3;
}

- (NSArray)correlations
{
  return self->_correlations;
}

- (void)setCorrelations:(id)a3
{
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (void)setContainerIdentifier:(id)a3
{
}

- (unint64_t)localHash
{
  return self->_localHash;
}

- (void)setLocalHash:(unint64_t)a3
{
  self->_localHash = a3;
}

- (unint64_t)correlationHash
{
  return self->_correlationHash;
}

- (void)setCorrelationHash:(unint64_t)a3
{
  self->_correlationHash = a3;
}

- (NSArray)topics
{
  return self->_topics;
}

- (void)setTopics:(id)a3
{
}

- (BOOL)isDefault
{
  return self->_isDefault;
}

- (void)setIsDefault:(BOOL)a3
{
  self->_isDefault = a3;
}

- (void).cxx_destruct
{
}

@end