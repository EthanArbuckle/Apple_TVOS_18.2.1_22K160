void start()
{
  void *v0;
  v0 = objc_autoreleasePoolPush();
  +[UPDaemon run](&OBJC_CLASS___UPDaemon, "run");
  objc_autoreleasePoolPop(v0);
  dispatch_main();
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}