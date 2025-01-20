void sub_1000035A4(id a1, NSURLQueryItem *a2, unint64_t a3, BOOL *a4)
{
  NSURLQueryItem *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  NSHTTPCookie *v9;
  void *v10;
  void *v11;
  NSHTTPCookie *v12;
  void *v13;
  void *v14;
  void *v15;
  NSHTTPCookie *v16;
  void v17[5];
  void v18[5];
  v5 = a2;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLQueryItem name](v5, "name"));
  v7 = [v6 isEqualToString:@"itc_dsid"];

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLQueryItem value](v5, "value"));
    if ([v8 length])
    {
      v9 = objc_alloc(&OBJC_CLASS___NSHTTPCookie);
      v17[0] = NSHTTPCookieName;
      v17[1] = NSHTTPCookieValue;
      v18[0] = @"itc_dsid";
      v18[1] = v8;
      v17[2] = NSHTTPCookieDomain;
      v17[3] = NSHTTPCookiePath;
      v18[2] = @".itunes.apple.com";
      v18[3] = @"/";
      v17[4] = NSHTTPCookieExpires;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](&OBJC_CLASS___NSDate, "distantFuture"));
      v18[4] = v10;
      v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v18,  v17,  5LL));
      v12 = -[NSHTTPCookie initWithProperties:](v9, "initWithProperties:", v11);

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[SSVCookieStorage sharedStorage](&OBJC_CLASS___SSVCookieStorage, "sharedStorage"));
      v16 = v12;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
      v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v8 longLongValue]));
      [v13 setCookies:v14 forUserIdentifier:v15];
    }

    *a4 = 1;
  }
}

uint64_t start(int a1, char **a2)
{
  v4 = objc_autoreleasePoolPush();
  uint64_t v8 = TVSSystemLog;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));
  +[TVSLogger initializeLoggingWithDomain:persistentComponents:]( &OBJC_CLASS___TVSLogger,  "initializeLoggingWithDomain:persistentComponents:",  @"com.apple.TVMovies",  v5);

  uint64_t v6 = UIApplicationMain(a1, a2, @"TVApplication", @"TVMoviesAppDelegate");
  objc_autoreleasePoolPop(v4);
  return v6;
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}