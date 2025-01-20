@interface MTApplication_ATV
+ (id)appController;
- (id)delegate;
@end

@implementation MTApplication_ATV

+ (id)appController
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___MTApplication_ATV;
  id v2 = objc_msgSendSuper2(&v4, "appController");
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

- (id)delegate
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTApplication_ATV;
  id v2 = -[MTApplication delegate](&v4, "delegate");
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

@end