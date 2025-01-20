}

uint64_t start(int a1, char **a2)
{
  v4 = objc_autoreleasePoolPush();
  v5 = (objc_class *)objc_opt_class(&OBJC_CLASS___TVCRDAppDelegate);
  v6 = NSStringFromClass(v5);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = UIApplicationMain(a1, a2, 0LL, v7);

  objc_autoreleasePoolPop(v4);
  return v8;
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}