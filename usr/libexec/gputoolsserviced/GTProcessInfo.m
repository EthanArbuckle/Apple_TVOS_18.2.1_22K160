@interface GTProcessInfo
+ (BOOL)supportsSecureCoding;
- (GTProcessInfo)init;
- (GTProcessInfo)initWithCoder:(id)a3;
- (NSArray)arguments;
- (NSDictionary)environment;
- (NSString)bundleIdentifier;
- (NSString)processName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)ppid;
- (int)processIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setArguments:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setPpid:(int)a3;
- (void)setProcessIdentifier:(int)a3;
- (void)setProcessName:(id)a3;
@end

@implementation GTProcessInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTProcessInfo)init
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___GTProcessInfo;
  v2 = -[GTProcessInfo init](&v14, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
    uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 processName]);
    processName = v2->_processName;
    v2->_processName = (NSString *)v4;

    uint64_t v6 = objc_claimAutoreleasedReturnValue([v3 environment]);
    environment = v2->_environment;
    v2->_environment = (NSDictionary *)v6;

    uint64_t v8 = objc_claimAutoreleasedReturnValue([v3 arguments]);
    arguments = v2->_arguments;
    v2->_arguments = (NSArray *)v8;

    v2->_processIdentifier = [v3 processIdentifier];
    v2->_ppid = getppid();
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 bundleIdentifier]);
    bundleIdentifier = v2->_bundleIdentifier;
    v2->_bundleIdentifier = (NSString *)v11;
  }

  return v2;
}

- (GTProcessInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v58.receiver = self;
  v58.super_class = (Class)&OBJC_CLASS___GTProcessInfo;
  v5 = -[GTProcessInfo init](&v58, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"processName"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    processName = v5->_processName;
    v5->_processName = (NSString *)v7;

    v9 = v5->_processName;
    if (v9)
    {
      uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v9, v10) & 1) == 0)
      {
        uint64_t v11 = v5->_processName;
        v5->_processName = 0LL;
      }
    }

    id v12 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class(NSString) forKey:@"arguments"];
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    arguments = v5->_arguments;
    v5->_arguments = (NSArray *)v13;

    v15 = v5->_arguments;
    if (v15)
    {
      uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSArray);
      if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
      {
        __int128 v56 = 0u;
        __int128 v57 = 0u;
        __int128 v54 = 0u;
        __int128 v55 = 0u;
        v17 = v5->_arguments;
        id v18 = -[NSArray countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v54,  v60,  16LL);
        if (v18)
        {
          id v19 = v18;
          uint64_t v20 = *(void *)v55;
          while (2)
          {
            for (i = 0LL; i != v19; i = (char *)i + 1)
            {
              if (*(void *)v55 != v20) {
                objc_enumerationMutation(v17);
              }
              uint64_t v22 = *(void *)(*((void *)&v54 + 1) + 8LL * (void)i);
              uint64_t v23 = objc_opt_class(&OBJC_CLASS___NSString);
              if ((objc_opt_isKindOfClass(v22, v23) & 1) == 0)
              {
                v24 = v5->_arguments;
                v5->_arguments = 0LL;

                goto LABEL_18;
              }
            }

            id v19 = -[NSArray countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v54,  v60,  16LL);
            if (v19) {
              continue;
            }
            break;
          }
        }
      }

      else
      {
        v17 = v5->_arguments;
        v5->_arguments = 0LL;
      }

- (void)encodeWithCoder:(id)a3
{
  processName = self->_processName;
  id v5 = a3;
  [v5 encodeObject:processName forKey:@"processName"];
  [v5 encodeObject:self->_arguments forKey:@"arguments"];
  [v5 encodeObject:self->_environment forKey:@"environment"];
  [v5 encodeObject:self->_bundleIdentifier forKey:@"bundleIdentifier"];
  [v5 encodeInt32:self->_processIdentifier forKey:@"processIdentifier"];
  [v5 encodeInt32:self->_ppid forKey:@"ppid"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___GTProcessInfo);
  -[GTProcessInfo setProcessName:](v4, "setProcessName:", self->_processName);
  id v5 = -[NSArray initWithArray:copyItems:]( objc_alloc(&OBJC_CLASS___NSArray),  "initWithArray:copyItems:",  self->_arguments,  1LL);
  -[GTProcessInfo setArguments:](v4, "setArguments:", v5);

  id v6 = -[NSDictionary initWithDictionary:copyItems:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithDictionary:copyItems:",  self->_environment,  1LL);
  -[GTProcessInfo setEnvironment:](v4, "setEnvironment:", v6);

  -[GTProcessInfo setBundleIdentifier:](v4, "setBundleIdentifier:", self->_bundleIdentifier);
  -[GTProcessInfo setProcessIdentifier:](v4, "setProcessIdentifier:", self->_processIdentifier);
  -[GTProcessInfo setProcessName:](v4, "setProcessName:", self->_processName);
  return v4;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self);
  id v4 = NSStringFromClass(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: processName=%@ arguments=%@ environment=%@ bundleIdentifier=%@ processIdentifier=%d ppid=%d>",  v5,  self->_processName,  self->_arguments,  self->_environment,  self->_bundleIdentifier,  self->_processIdentifier,  self->_ppid));

  return v6;
}

- (NSString)processName
{
  return self->_processName;
}

- (void)setProcessName:(id)a3
{
}

- (NSArray)arguments
{
  return self->_arguments;
}

- (void)setArguments:(id)a3
{
}

- (NSDictionary)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (int)processIdentifier
{
  return self->_processIdentifier;
}

- (void)setProcessIdentifier:(int)a3
{
  self->_processIdentifier = a3;
}

- (int)ppid
{
  return self->_ppid;
}

- (void)setPpid:(int)a3
{
  self->_ppid = a3;
}

- (void).cxx_destruct
{
}

@end