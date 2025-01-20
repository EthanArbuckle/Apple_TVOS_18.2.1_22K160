void start()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unsigned int v7;
  id v8;
  void *v9;
  objc_class *v10;
  void *v11;
  id v12;
  id v13;
  v0 = objc_autoreleasePoolPush();
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v2 = (void *)objc_claimAutoreleasedReturnValue([v1 bundleURL]);
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 URLByDeletingLastPathComponent]);

  v4 = objc_claimAutoreleasedReturnValue([v3 URLByDeletingLastPathComponent]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithURL:](&OBJC_CLASS___NSBundle, "bundleWithURL:", v4));
  objc_autoreleasePoolPop(v0);
  if (v5)
  {
    v6 = objc_autoreleasePoolPush();
    v13 = 0LL;
    v7 = [v5 loadAndReturnError:&v13];
    v8 = v13;
    objc_autoreleasePoolPop(v6);
    if (v7)
    {
      v9 = objc_autoreleasePoolPush();
      v10 = (objc_class *)[v1 principalClass];
      if (v10)
      {
        v12 = objc_alloc_init(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener"));
        [v11 setDelegate:v12];
      }

      else
      {
        NSLog(@"Unable to find principal class by name.");
        v11 = 0LL;
      }

      objc_autoreleasePoolPop(v9);
      [v11 resume];
    }

    else
    {
      NSLog(@"Error loading framework: %@", v8);
    }
  }

  else
  {
    NSLog(@"Unable to find framework using URL: %@", v4);
  }

  exit(1);
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}