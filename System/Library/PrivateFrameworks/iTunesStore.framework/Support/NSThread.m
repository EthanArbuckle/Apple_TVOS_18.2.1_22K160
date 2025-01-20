@interface NSThread
+ (id)beginManagedContextSession;
+ (id)beginPrivateManagedContextSession;
+ (void)endManagedContextSession;
+ (void)endPrivateManagedContextSession;
@end

@implementation NSThread

+ (id)beginManagedContextSession
{
  v2 = (void *)sub_10003E170(0LL);
  return [v2 beginThreadContextSession];
}

+ (id)beginPrivateManagedContextSession
{
  v2 = (void *)sub_10003E170(1LL);
  return [v2 beginThreadContextSession];
}

+ (void)endManagedContextSession
{
  v2 = (void *)sub_10003E170(0LL);
  [v2 endThreadContextSession];
}

+ (void)endPrivateManagedContextSession
{
  v2 = (void *)sub_10003E170(1LL);
  [v2 endThreadContextSession];
}

@end