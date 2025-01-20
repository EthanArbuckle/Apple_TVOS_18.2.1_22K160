@interface PDDynamicAssociatedDomain
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDomain:(id)a3;
- (NSArray)patterns;
- (NSString)host;
- (PDDynamicAssociatedDomain)initWithHost:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)setHost:(id)a3;
- (void)setPatterns:(id)a3;
@end

@implementation PDDynamicAssociatedDomain

- (PDDynamicAssociatedDomain)initWithHost:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PDDynamicAssociatedDomain;
  v6 = -[PDDynamicAssociatedDomain init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_host, a3);
  }

  return v7;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<%@: ",  v5));

  [v6 appendFormat:@"host: '%@'; ", self->_host];
  [v6 appendFormat:@"patterns: '%@'; ", self->_patterns];
  [v6 appendFormat:@">"];
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](&OBJC_CLASS___NSString, "stringWithString:", v6));

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PDDynamicAssociatedDomain *)a3;
  v6 = v4;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }

  else if (v4 && (uint64_t v7 = objc_opt_class(self, v5), (objc_opt_isKindOfClass(v6, v7) & 1) != 0))
  {
    BOOL v8 = -[PDDynamicAssociatedDomain isEqualToDomain:](self, "isEqualToDomain:", v6);
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isEqualToDomain:(id)a3
{
  v4 = a3;
  else {
    char v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  -[NSMutableArray addObject:](v3, "addObject:", self->_host);
  -[NSMutableArray safelyAddObject:](v3, "safelyAddObject:", self->_patterns);
  unint64_t v4 = PKCombinedHash(PKHashStartingValue, v3);

  return v4;
}

- (NSString)host
{
  return self->_host;
}

- (void)setHost:(id)a3
{
}

- (NSArray)patterns
{
  return self->_patterns;
}

- (void)setPatterns:(id)a3
{
}

- (void).cxx_destruct
{
}

@end