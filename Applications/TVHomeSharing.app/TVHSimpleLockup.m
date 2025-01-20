@interface TVHSimpleLockup
+ (id)_footerViewWithLockupLayout:(id)a3;
- (TVHSimpleLockup)initWithLayout:(id)a3;
- (TVHSimpleLockup)initWithSimpleLayout:(id)a3;
@end

@implementation TVHSimpleLockup

- (TVHSimpleLockup)initWithLayout:(id)a3
{
  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v5);

  return 0LL;
}

- (TVHSimpleLockup)initWithSimpleLayout:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVHSimpleLockup;
  return -[TVHLockup initWithLayout:](&v4, "initWithLayout:", a3);
}

+ (id)_footerViewWithLockupLayout:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___TVHSimpleLockupLayout);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0
    && (uint64_t v5 = objc_claimAutoreleasedReturnValue([v3 footerViewLayout])) != 0)
  {
    v6 = (void *)v5;
    v7 = -[TVHSimpleLockupFooterView initWithLayout:]( objc_alloc(&OBJC_CLASS___TVHSimpleLockupFooterView),  "initWithLayout:",  v5);
  }

  else
  {
    v7 = 0LL;
  }

  return v7;
}

@end