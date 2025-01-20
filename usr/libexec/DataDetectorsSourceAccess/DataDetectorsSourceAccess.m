uint64_t start()
{
  void *v0;
  ServiceDelegate *v1;
  NSXPCListener *v2;
  stru_100008688.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_1000030AC;
  *(void *)&stru_100008688.sa_mask = 0LL;
  sigaction(15, &stru_100008688, 0LL);
  v0 = objc_autoreleasePoolPush();
  v1 = objc_opt_new(&OBJC_CLASS___ServiceDelegate);
  v2 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.DataDetectorsSourceAccess");
  -[NSXPCListener setDelegate:](v2, "setDelegate:", v1);
  -[NSXPCListener resume](v2, "resume");
  CFRunLoopRun();

  objc_autoreleasePoolPop(v0);
  return 0LL;
}

void sub_1000030AC(int a1)
{
  if (a1 == 15)
  {
    Current = CFRunLoopGetCurrent();
    CFRunLoopStop(Current);
  }
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObjects:");
}