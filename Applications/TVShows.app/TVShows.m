uint64_t start(int a1, char **a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v8;
  v4 = objc_autoreleasePoolPush();
  v8 = TVSSystemLog;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));
  +[TVSLogger initializeLoggingWithDomain:persistentComponents:]( &OBJC_CLASS___TVSLogger,  "initializeLoggingWithDomain:persistentComponents:",  @"com.apple.TVShows",  v5);

  v6 = UIApplicationMain(a1, a2, @"TVApplication", @"TVShowsAppDelegate");
  objc_autoreleasePoolPop(v4);
  return v6;
}

id objc_msgSend_setDefaultDataType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDefaultDataType:");
}