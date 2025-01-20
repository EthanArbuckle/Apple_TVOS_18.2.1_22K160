@interface PDDynamicAssociatedDomainPattern
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPattern:(id)a3;
- (NSString)uri;
- (id)description;
- (unint64_t)hash;
- (void)setUri:(id)a3;
@end

@implementation PDDynamicAssociatedDomainPattern

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<%@: ",  v5));

  [v6 appendFormat:@"uri: '%@'; ", self->_uri];
  [v6 appendFormat:@">"];
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](&OBJC_CLASS___NSString, "stringWithString:", v6));

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PDDynamicAssociatedDomainPattern *)a3;
  v6 = v4;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }

  else if (v4 && (uint64_t v7 = objc_opt_class(self, v5), (objc_opt_isKindOfClass(v6, v7) & 1) != 0))
  {
    BOOL v8 = -[PDDynamicAssociatedDomainPattern isEqualToPattern:](self, "isEqualToPattern:", v6);
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isEqualToPattern:(id)a3
{
  if (a3) {
    return PKEqualObjects(self->_uri, *((void *)a3 + 1));
  }
  else {
    return 0;
  }
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  -[NSMutableArray safelyAddObject:](v3, "safelyAddObject:", self->_uri);
  unint64_t v4 = PKCombinedHash(PKHashStartingValue, v3);

  return v4;
}

- (NSString)uri
{
  return self->_uri;
}

- (void)setUri:(id)a3
{
}

- (void).cxx_destruct
{
}

@end