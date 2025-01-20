uint64_t start()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  unsigned __int8 v4;
  uint64_t v5;
  v0 = objc_autoreleasePoolPush();
  _set_user_dir_suffix([@"com.apple.metrickitd" UTF8String]);
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[MXCore sharedCore](&OBJC_CLASS___MXCore, "sharedCore"));
  if (v1)
  {
    do
    {
      v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](&OBJC_CLASS___NSDate, "distantFuture"));
      v4 = [v2 runMode:NSDefaultRunLoopMode beforeDate:v3];
    }

    while ((v4 & 1) != 0);
    v5 = 0LL;
  }

  else
  {
    NSLog(@"Failed to start core");
    v5 = 1LL;
  }

  objc_autoreleasePoolPop(v0);
  return v5;
}

id objc_msgSend_sharedCore(void *a1, const char *a2, ...)
{
  return [a1 sharedCore];
}