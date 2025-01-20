@interface IDSNGMSwizzler
+ (id)lastPrKey;
+ (void)installMethods;
+ (void)uninstallMethods;
@end

@implementation IDSNGMSwizzler

+ (void)installMethods
{
  if ((byte_1009BE96C & 1) == 0)
  {
    v2 = NSClassFromString(@"NGMFullPrekey");
    InstanceMethod = class_getInstanceMethod(v2, "dhKey");
    qword_1009BE970 = (uint64_t)method_getImplementation(InstanceMethod);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1000BDE4C;
    v6[3] = &unk_1008F9228;
    v6[4] = qword_1009BE970;
    v6[5] = "dhKey";
    v4 = objc_retainBlock(v6);
    v5 = imp_implementationWithBlock(v4);

    method_setImplementation(InstanceMethod, v5);
    byte_1009BE96C = 1;
  }

  os_unfair_lock_unlock(&stru_1009BE968);
}

+ (void)uninstallMethods
{
  if (byte_1009BE96C == 1)
  {
    v2 = NSClassFromString(@"NGMFullPrekey");
    InstanceMethod = class_getInstanceMethod(v2, "dhKey");
    method_setImplementation(InstanceMethod, (IMP)qword_1009BE970);
    byte_1009BE96C = 0;
    v4 = (void *)qword_1009BE960;
    qword_1009BE960 = 0LL;
  }

  os_unfair_lock_unlock(&stru_1009BE968);
}

+ (id)lastPrKey
{
  return (id)qword_1009BE960;
}

@end