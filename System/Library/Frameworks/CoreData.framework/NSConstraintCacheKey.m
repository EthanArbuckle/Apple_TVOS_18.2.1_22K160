@interface NSConstraintCacheKey
- (BOOL)isEqual:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation NSConstraintCacheKey

- (void)dealloc
{
  self->_values = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSConstraintCacheKey;
  -[NSConstraintCacheKey dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<NSConstraintCacheKey: %@>", self->_values];
}

- (unint64_t)hash
{
  return -[NSArray hash](self->_values, "hash");
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v7 = (void *)*((void *)a3 + 1);
    NSUInteger v8 = -[NSArray count](self->_values, "count");
    if (v8)
    {
      uint64_t v9 = 0LL;
      NSUInteger v10 = v8 - 1;
      do
      {
        int v6 = objc_msgSend( -[NSArray objectAtIndex:](self->_values, "objectAtIndex:", v9),  "isEqual:",  objc_msgSend(v7, "objectAtIndex:", v9));
        if (v6) {
          BOOL v11 = v10 == v9;
        }
        else {
          BOOL v11 = 1;
        }
        ++v9;
      }

      while (!v11);
    }

    else
    {
      LOBYTE(v6) = 1;
    }
  }

  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

@end