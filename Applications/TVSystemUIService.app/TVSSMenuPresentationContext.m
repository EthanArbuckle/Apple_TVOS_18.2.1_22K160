@interface TVSSMenuPresentationContext
- (BOOL)isEqual:(id)a3;
- (TVSSMenuPresentationContext)initWithPresentationContext:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)reason;
@end

@implementation TVSSMenuPresentationContext

- (TVSSMenuPresentationContext)initWithPresentationContext:(id)a3
{
  v10 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v10;
  v10 = 0LL;
  v8.receiver = v3;
  v8.super_class = (Class)&OBJC_CLASS___TVSSMenuPresentationContext;
  v7 = -[TVSSMenuPresentationContext init](&v8, "init");
  v10 = v7;
  objc_storeStrong((id *)&v10, v7);
  if (v7)
  {
    id v4 = [location[0] reason];
    v10->_reason = (unint64_t)v4;
  }

  v6 = v10;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v10, 0LL);
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return self;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[TVSSMenuPresentationContext initWithPresentationContext:]( objc_alloc(&OBJC_CLASS___TVSSMutableMenuPresentationContext),  "initWithPresentationContext:",  self);
}

- (unint64_t)reason
{
  return self->_reason;
}

- (BOOL)isEqual:(id)a3
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (location[0] == v9)
  {
    char v10 = 1;
  }

  else
  {
    id v6 = location[0];
    uint64_t v3 = objc_opt_class(v9);
    BOOL v7 = 0;
    if ((objc_opt_isKindOfClass(v6, v3) & 1) != 0)
    {
      id v5 = -[TVSSMenuPresentationContext reason](v9, "reason");
      BOOL v7 = v5 == [location[0] reason];
    }

    char v10 = v7;
  }

  objc_storeStrong(location, 0LL);
  return v10 & 1;
}

@end