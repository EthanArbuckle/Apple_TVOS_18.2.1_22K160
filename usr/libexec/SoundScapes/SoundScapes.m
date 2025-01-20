uint64_t start()
{
  void *v0;
  id v1;
  void *v2;
  v0 = objc_autoreleasePoolPush();
  NSLog(@"SoundScapes Launching");
  v1 = +[SSPlayerManager sharedInstance](&OBJC_CLASS___SSPlayerManager, "sharedInstance");
  objc_autoreleasePoolPop(v0);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
  [v2 run];

  return 0LL;
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}