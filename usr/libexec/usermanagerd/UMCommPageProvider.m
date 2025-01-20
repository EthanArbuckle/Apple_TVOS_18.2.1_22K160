@interface UMCommPageProvider
- (UMCommPageProvider)init;
@end

@implementation UMCommPageProvider

- (UMCommPageProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___UMCommPageProvider;
  v2 = -[UMCommPageProvider init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    sub_100019D38(v2, (char *)&stru_1000CD268);
    sub_100019D4C(v3, (char *)&stru_1000CD2A8);
    v4 = v3;
  }

  return v3;
}

@end