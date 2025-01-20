@interface HHDNotificationProxy
+ (id)notificationProxy;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)bootstrapWithNotificationService:(id)a3;
- (void)forwardInvocation:(id)a3;
@end

@implementation HHDNotificationProxy

+ (id)notificationProxy
{
  return objc_alloc(&OBJC_CLASS___HHDNotificationProxy);
}

- (void)bootstrapWithNotificationService:(id)a3
{
}

- (void)forwardInvocation:(id)a3
{
}

- (id)methodSignatureForSelector:(SEL)a3
{
  return sub_100006DF0((unint64_t)a3, &OBJC_PROTOCOL___HHManagementEventListener);
}

- (void).cxx_destruct
{
}

@end