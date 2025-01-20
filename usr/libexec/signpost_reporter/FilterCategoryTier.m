@interface FilterCategoryTier
- (FilterCategoryTier)init;
- (id)keyForChildren:(id)a3;
- (id)newChildInstance;
@end

@implementation FilterCategoryTier

- (FilterCategoryTier)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___FilterCategoryTier;
  v2 = -[FilterCategoryTier init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    -[FilterTier setChildTiers:](v2, "setChildTiers:", v3);
  }

  return v2;
}

- (id)keyForChildren:(id)a3
{
  return [a3 name];
}

- (id)newChildInstance
{
  return objc_alloc_init(&OBJC_CLASS___FilterNameTier);
}

@end