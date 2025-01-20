uint64_t start()
{
  void *v0;
  v0 = (void *)objc_opt_new(&OBJC_CLASS___PKDServer);
  [v0 run];

  return 0LL;
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}