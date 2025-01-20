@interface CLLocationManager
+ (void)sg_swizzle;
- (id)sg_init;
@end

@implementation CLLocationManager

- (id)sg_init
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_FAULT,  "-[CLLocationManager init] must never be used in suggestd",  v4,  2u);
  }

  return (id)objc_claimAutoreleasedReturnValue(-[CLLocationManager sg_init](self, "sg_init"));
}

+ (void)sg_swizzle
{
  v3 = (objc_class *)objc_opt_class(a1, a2);
  InstanceMethod = class_getInstanceMethod(v3, "init");
  v6 = (objc_class *)objc_opt_class(a1, v5);
  v7 = class_getInstanceMethod(v6, "sg_init");
  v9 = (objc_class *)objc_opt_class(a1, v8);
  Implementation = method_getImplementation(v7);
  TypeEncoding = method_getTypeEncoding(v7);
  if (class_addMethod(v9, "init", Implementation, TypeEncoding))
  {
    v13 = (objc_class *)objc_opt_class(a1, v12);
    v14 = method_getImplementation(InstanceMethod);
    v15 = method_getTypeEncoding(InstanceMethod);
    class_replaceMethod(v13, "sg_init", v14, v15);
  }

  else
  {
    method_exchangeImplementations(InstanceMethod, v7);
  }

@end