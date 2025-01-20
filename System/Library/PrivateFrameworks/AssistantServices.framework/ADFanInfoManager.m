@interface ADFanInfoManager
+ (id)sharedManager;
- (ADFanInfoManager)init;
- (void)dealloc;
- (void)getCurrentFanInfo:(id)a3;
@end

@implementation ADFanInfoManager

- (ADFanInfoManager)init
{
  return 0LL;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___ADFanInfoManager;
  -[ADFanInfoManager dealloc](&v2, "dealloc");
}

- (void)getCurrentFanInfo:(id)a3
{
  if (a3) {
    (*((void (**)(id, void))a3 + 2))(a3, 0LL);
  }
}

+ (id)sharedManager
{
  return 0LL;
}

@end