@interface TVPMemoriesTabSpecManager
- (Class)specClass;
- (id)createSpec;
@end

@implementation TVPMemoriesTabSpecManager

- (Class)specClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___TVPMemoriesTabSpec, a2);
}

- (id)createSpec
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabSpecManager extendedTraitCollection](self, "extendedTraitCollection"));
  v4 = -[TVPMemoriesTabSpec initWithExtendedTraitCollection:options:]( objc_alloc(&OBJC_CLASS___TVPMemoriesTabSpec),  "initWithExtendedTraitCollection:options:",  v3,  -[TVPMemoriesTabSpecManager options](self, "options"));

  return v4;
}

@end