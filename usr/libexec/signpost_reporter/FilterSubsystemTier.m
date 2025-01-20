@interface FilterSubsystemTier
- (FilterSubsystemTier)init;
- (id)keyForChildren:(id)a3;
- (id)newChildInstance;
@end

@implementation FilterSubsystemTier

- (FilterSubsystemTier)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___FilterSubsystemTier;
  v2 = -[FilterSubsystemTier init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    -[FilterTier setChildTiers:](v2, "setChildTiers:", v3);
  }

  return v2;
}

- (id)keyForChildren:(id)a3
{
  return [a3 category];
}

- (id)newChildInstance
{
  return objc_alloc_init(&OBJC_CLASS___FilterCategoryTier);
}

@end