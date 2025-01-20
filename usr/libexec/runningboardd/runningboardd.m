uint64_t start()
{
  void *v0;
  v0 = objc_autoreleasePoolPush();
  +[RBDaemon run](&OBJC_CLASS___RBDaemon, "run");
  objc_autoreleasePoolPop(v0);
  CFRunLoopRun();
  return 0LL;
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}