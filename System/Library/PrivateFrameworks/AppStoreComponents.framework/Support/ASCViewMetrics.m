@interface ASCViewMetrics
+ (BOOL)supportsSecureCoding;
- (ASCViewMetrics)initWithCoder:(id)a3;
- (ASCViewMetrics)initWithInstructions:(id)a3 pageFields:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSArray)instructions;
- (NSDictionary)pageFields;
- (id)dataForInvocationPoint:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCViewMetrics

- (ASCViewMetrics)initWithInstructions:(id)a3 pageFields:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sub_10000F4DC((uint64_t)&OBJC_CLASS___ASCEligibility);
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___ASCViewMetrics;
  v8 = -[ASCViewMetrics init](&v14, "init");
  if (v8)
  {
    v9 = (NSArray *)[v6 copy];
    instructions = v8->_instructions;
    v8->_instructions = v9;

    v11 = (NSDictionary *)[v7 copy];
    pageFields = v8->_pageFields;
    v8->_pageFields = v11;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCViewMetrics)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc(&OBJC_CLASS___NSSet);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___ASCViewMetricsInstruction);
  id v7 = -[NSSet initWithObjects:](v5, "initWithObjects:", v6, objc_opt_class(&OBJC_CLASS___NSArray), 0LL);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v7 forKey:@"instructions"]);
  if (v8)
  {
    id v9 = sub_100019AC4(v4, @"pageFields");
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if (v10)
    {
      self = -[ASCViewMetrics initWithInstructions:pageFields:](self, "initWithInstructions:pageFields:", v8, v10);
      v11 = self;
    }

    else
    {
      BOOL v20 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v20) {
        sub_1000E1E24(v20, v21, v22, v23, v24, v25, v26, v27);
      }
      v11 = 0LL;
    }
  }

  else
  {
    BOOL v12 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v12) {
      sub_1000E1DF0(v12, v13, v14, v15, v16, v17, v18, v19);
    }
    v11 = 0LL;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCViewMetrics instructions](self, "instructions"));
  [v4 encodeObject:v5 forKey:@"instructions"];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[ASCViewMetrics pageFields](self, "pageFields"));
  [v4 encodeObject:v6 forKey:@"pageFields"];
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(&OBJC_CLASS___ASCHasher);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCViewMetrics instructions](self, "instructions"));
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCViewMetrics pageFields](self, "pageFields"));
  -[ASCHasher combineObject:](v3, "combineObject:", v5);

  unint64_t v6 = -[ASCHasher finalizeHash](v3, "finalizeHash");
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___ASCViewMetrics);
  id v6 = v4;
  id v7 = v6;
  if (v6)
  {
    if ((objc_opt_isKindOfClass(v6, v5) & 1) != 0) {
      v8 = v7;
    }
    else {
      v8 = 0LL;
    }
  }

  else
  {
    v8 = 0LL;
  }

  id v9 = v8;

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASCViewMetrics instructions](self, "instructions"));
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v9 instructions]);
    BOOL v12 = (void *)v11;
    if (v10 && v11)
    {
    }

    else if (v10 == (void *)v11)
    {
LABEL_10:
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASCViewMetrics pageFields](self, "pageFields"));
      uint64_t v14 = objc_claimAutoreleasedReturnValue([v9 pageFields]);
      uint64_t v15 = (void *)v14;
      if (v13 && v14) {
        unsigned __int8 v16 = [v13 isEqual:v14];
      }
      else {
        unsigned __int8 v16 = v13 == (void *)v14;
      }

      goto LABEL_18;
    }

    unsigned __int8 v16 = 0;
LABEL_18:

    goto LABEL_19;
  }

  unsigned __int8 v16 = 0;
LABEL_19:

  return v16;
}

- (id)description
{
  v3 = -[ASCDescriber initWithObject:](objc_alloc(&OBJC_CLASS___ASCDescriber), "initWithObject:", self);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCViewMetrics instructions](self, "instructions"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, @"instructions");

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCViewMetrics pageFields](self, "pageFields"));
  -[ASCDescriber addSensitiveObject:withName:](v3, "addSensitiveObject:withName:", v5, @"pageFields");

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCDescriber finalizeDescription](v3, "finalizeDescription"));
  return v6;
}

- (id)dataForInvocationPoint:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCViewMetrics instructions](self, "instructions", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v11 invocationPoints]);
        unsigned int v13 = [v12 containsObject:v4];

        if (v13)
        {
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v11 data]);
          -[NSMutableArray addObject:](v5, "addObject:", v14);
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v8);
  }

  id v15 = -[NSMutableArray copy](v5, "copy");
  return v15;
}

- (NSArray)instructions
{
  return self->_instructions;
}

- (NSDictionary)pageFields
{
  return self->_pageFields;
}

- (void).cxx_destruct
{
}

@end