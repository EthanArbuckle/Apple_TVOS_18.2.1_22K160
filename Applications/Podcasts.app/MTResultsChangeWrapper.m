@interface MTResultsChangeWrapper
- (BOOL)isEqual:(id)a3;
- (MTResultsChangeWrapper)initWithObject:(id)a3;
- (NSCopying)object;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setObject:(id)a3;
@end

@implementation MTResultsChangeWrapper

- (MTResultsChangeWrapper)initWithObject:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTResultsChangeWrapper;
  v5 = -[MTResultsChangeWrapper init](&v8, "init");
  v6 = v5;
  if (v5) {
    -[MTResultsChangeWrapper setObject:](v5, "setObject:", v4);
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc(&OBJC_CLASS___MTResultsChangeWrapper);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTResultsChangeWrapper object](self, "object"));
  v6 = -[MTResultsChangeWrapper initWithObject:](v4, "initWithObject:", v5);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___MTResultsChangeWrapper);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    id v6 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTResultsChangeWrapper object](self, "object"));
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v6 object]);

    unsigned __int8 v9 = [v7 isEqual:v8];
  }

  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTResultsChangeWrapper object](self, "object"));
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (NSCopying)object
{
  return self->_object;
}

- (void)setObject:(id)a3
{
}

- (void).cxx_destruct
{
}

@end