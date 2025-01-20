@interface DaemonServiceManagerFactory
+ (id)build;
@end

@implementation DaemonServiceManagerFactory

+ (id)build
{
  return objc_opt_new(&OBJC_CLASS___DefaultDaemonServiceManager);
}

@end