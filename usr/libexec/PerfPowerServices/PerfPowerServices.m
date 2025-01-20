uint64_t start()
{
  void *v0;
  void *v1;
  void *v2;
  unsigned __int8 v3;
  EnterSandbox("PerfPowerServices", "com.apple.PerfPowerServices");
  v0 = objc_autoreleasePoolPush();
  +[PowerlogCore setupCore](&OBJC_CLASS___PowerlogCore, "setupCore");
  objc_autoreleasePoolPop(v0);
  do
  {
    v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](&OBJC_CLASS___NSDate, "distantFuture"));
    v3 = [v1 runMode:NSDefaultRunLoopMode beforeDate:v2];
  }

  while ((v3 & 1) != 0);
  return 0LL;
}

id objc_msgSend_setupCore(void *a1, const char *a2, ...)
{
  return [a1 setupCore];
}