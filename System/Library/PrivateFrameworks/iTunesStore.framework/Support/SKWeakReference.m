@interface SKWeakReference
- (BOOL)isEqual:(id)a3;
- (SKWeakReference)initWithObject:(id)a3;
- (id)object;
- (unint64_t)hash;
- (void)setObject:(id)a3;
@end

@implementation SKWeakReference

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SKWeakReference object](self, "object"));
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(self);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKWeakReference object](self, "object"));
    BOOL v8 = v6 == v7;
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (SKWeakReference)initWithObject:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SKWeakReference;
  uint64_t v5 = -[SKWeakReference init](&v8, "init");
  v6 = v5;
  if (v5) {
    -[SKWeakReference setObject:](v5, "setObject:", v4);
  }

  return v6;
}

- (id)object
{
  return objc_loadWeakRetained(&self->_object);
}

- (void)setObject:(id)a3
{
}

- (void).cxx_destruct
{
}

@end