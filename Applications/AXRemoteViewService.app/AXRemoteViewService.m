uint64_t start(int a1, char **a2)
{
  void *v4;
  objc_class *v5;
  NSString *v6;
  NSString *v7;
  objc_class *v8;
  NSString *v9;
  NSString *v10;
  uint64_t v11;
  v4 = objc_autoreleasePoolPush();
  v5 = (objc_class *)objc_opt_class(&OBJC_CLASS___UIApplication);
  v6 = NSStringFromClass(v5);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (objc_class *)objc_opt_class(&OBJC_CLASS___AppDelegate);
  v9 = NSStringFromClass(v8);
  v10 = (NSString *)objc_claimAutoreleasedReturnValue(v9);
  v11 = UIApplicationMain(a1, a2, v7, v10);

  objc_autoreleasePoolPop(v4);
  return v11;
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}