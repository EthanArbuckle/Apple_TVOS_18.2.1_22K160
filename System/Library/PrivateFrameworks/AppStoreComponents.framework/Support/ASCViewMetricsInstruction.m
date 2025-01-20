@interface ASCViewMetricsInstruction
+ (BOOL)supportsSecureCoding;
- (ASCMetricsData)data;
- (ASCViewMetricsInstruction)initWithCoder:(id)a3;
- (ASCViewMetricsInstruction)initWithData:(id)a3 invocationPoints:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSSet)invocationPoints;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCViewMetricsInstruction

- (ASCViewMetricsInstruction)initWithData:(id)a3 invocationPoints:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sub_10000F4DC((uint64_t)&OBJC_CLASS___ASCEligibility);
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___ASCViewMetricsInstruction;
  v8 = -[ASCViewMetricsInstruction init](&v14, "init");
  if (v8)
  {
    v9 = (ASCMetricsData *)[v6 copy];
    data = v8->_data;
    v8->_data = v9;

    v11 = (NSSet *)[v7 copy];
    invocationPoints = v8->_invocationPoints;
    v8->_invocationPoints = v11;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCViewMetricsInstruction)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class(ASCMetricsData) forKey:@"data"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (v6)
  {
    id v7 = objc_alloc(&OBJC_CLASS___NSSet);
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSSet);
    v9 = -[NSSet initWithObjects:](v7, "initWithObjects:", v8, objc_opt_class(&OBJC_CLASS___NSString), 0LL);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v9 forKey:@"invocationPoints"]);
    if (v10)
    {
      self =  -[ASCViewMetricsInstruction initWithData:invocationPoints:]( self,  "initWithData:invocationPoints:",  v6,  v10);
      v11 = self;
    }

    else
    {
      BOOL v20 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v20) {
        sub_1000E1E8C(v20, v21, v22, v23, v24, v25, v26, v27);
      }
      v11 = 0LL;
    }
  }

  else
  {
    BOOL v12 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v12) {
      sub_1000E1E58(v12, v13, v14, v15, v16, v17, v18, v19);
    }
    v11 = 0LL;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCViewMetricsInstruction data](self, "data"));
  [v4 encodeObject:v5 forKey:@"data"];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[ASCViewMetricsInstruction invocationPoints](self, "invocationPoints"));
  [v4 encodeObject:v6 forKey:@"invocationPoints"];
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(&OBJC_CLASS___ASCHasher);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCViewMetricsInstruction data](self, "data"));
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCViewMetricsInstruction invocationPoints](self, "invocationPoints"));
  -[ASCHasher combineObject:](v3, "combineObject:", v5);

  unint64_t v6 = -[ASCHasher finalizeHash](v3, "finalizeHash");
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___ASCViewMetricsInstruction);
  id v6 = v4;
  id v7 = v6;
  if (v6)
  {
    if ((objc_opt_isKindOfClass(v6, v5) & 1) != 0) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0LL;
    }
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  id v9 = v8;

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASCViewMetricsInstruction data](self, "data"));
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v9 data]);
    BOOL v12 = (void *)v11;
    if (v10 && v11)
    {
    }

    else if (v10 == (void *)v11)
    {
LABEL_10:
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASCViewMetricsInstruction invocationPoints](self, "invocationPoints"));
      uint64_t v14 = objc_claimAutoreleasedReturnValue([v9 invocationPoints]);
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
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCViewMetricsInstruction data](self, "data"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, @"data");

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCViewMetricsInstruction invocationPoints](self, "invocationPoints"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v5, @"invocationPoints");

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCDescriber finalizeDescription](v3, "finalizeDescription"));
  return v6;
}

- (ASCMetricsData)data
{
  return self->_data;
}

- (NSSet)invocationPoints
{
  return self->_invocationPoints;
}

- (void).cxx_destruct
{
}

@end