@interface NIAlgorithmConvergence
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NIAlgorithmConvergence)initWithCoder:(id)a3;
- (NIAlgorithmConvergence)initWithStatus:(int64_t)a3 andReasons:(id)a4;
- (NIAlgorithmConvergenceStatus)status;
- (NSArray)reasons;
- (id)copyWithZone:(_NSZone *)a3;
- (id)reasonsPrivate;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setReasons:(id)a3;
- (void)setStatus:(int64_t)a3;
@end

@implementation NIAlgorithmConvergence

- (NIAlgorithmConvergence)initWithStatus:(int64_t)a3 andReasons:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NIAlgorithmConvergence;
  v8 = -[NIAlgorithmConvergence init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    v8->_status = a3;
    objc_storeStrong((id *)&v8->_reasons, a4);
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (self->_reasons) {
    v4 = -[NSArray initWithArray:copyItems:]( +[NSArray allocWithZone:](&OBJC_CLASS___NSArray, "allocWithZone:", a3),  "initWithArray:copyItems:",  self->_reasons,  1LL);
  }
  else {
    v4 = 0LL;
  }
  v5 = -[NIAlgorithmConvergence initWithStatus:andReasons:]( objc_alloc(&OBJC_CLASS___NIAlgorithmConvergence),  "initWithStatus:andReasons:",  self->_status,  v4);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeInteger:self->_status forKey:@"status"];
  reasons = self->_reasons;
  if (reasons) {
    [v5 encodeObject:reasons forKey:@"reasons"];
  }
}

- (NIAlgorithmConvergence)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeIntegerForKey:@"status"];
  if (![v4 containsValueForKey:@"reasons"])
  {
    v10 = 0LL;
    goto LABEL_5;
  }

  v15[0] = objc_opt_class(&OBJC_CLASS___NSArray, v6);
  v15[1] = objc_opt_class(&OBJC_CLASS___NSString, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 2LL));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v9 forKey:@"reasons"]);

  uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSArray, v11);
  if ((objc_opt_isKindOfClass(v10, v12) & 1) != 0)
  {
LABEL_5:
    v13 = -[NIAlgorithmConvergence initWithStatus:andReasons:]( objc_alloc(&OBJC_CLASS___NIAlgorithmConvergence),  "initWithStatus:andReasons:",  v5,  v10);
    goto LABEL_6;
  }

  v13 = 0LL;
LABEL_6:

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    id v7 = v4;
    id v8 = [v7 status];
    int64_t status = self->_status;
    v10 = (void *)objc_claimAutoreleasedReturnValue([v7 reasons]);
    if (v10) {
      BOOL v11 = 0;
    }
    else {
      BOOL v11 = self->_reasons == 0LL;
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue([v7 reasons]);
    unsigned __int8 v14 = [v13 isEqualToArray:self->_reasons];

    if (v8 == (id)status) {
      char v12 = v11 | v14;
    }
    else {
      char v12 = 0;
    }
  }

  else
  {
    char v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", self->_status));
  unint64_t v4 = (unint64_t)[v3 hash];
  unint64_t v5 = (unint64_t)-[NSArray hash](self->_reasons, "hash") ^ v4;

  return v5;
}

- (id)reasonsPrivate
{
  return self->_reasons;
}

- (NIAlgorithmConvergenceStatus)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_int64_t status = a3;
}

- (NSArray)reasons
{
  return self->_reasons;
}

- (void)setReasons:(id)a3
{
}

- (void).cxx_destruct
{
}

@end