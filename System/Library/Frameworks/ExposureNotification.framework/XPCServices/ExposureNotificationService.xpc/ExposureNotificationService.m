uint64_t start()
{
  void *v0;
  v0 = (void *)objc_claimAutoreleasedReturnValue( +[ENXPCServiceListener sharedServiceListener]( &OBJC_CLASS___ENXPCServiceListener,  "sharedServiceListener"));
  [v0 main];

  return 0LL;
}

id objc_msgSend_sharedServiceListener(void *a1, const char *a2, ...)
{
  return [a1 sharedServiceListener];
}