uint64_t start()
{
  void *v0;
  void *v1;
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener"));
  v1 = (void *)objc_opt_new(&OBJC_CLASS___LPLinkSnapshotGeneratorServiceDelegate);
  [v0 setDelegate:v1];
  [v0 resume];

  return 0LL;
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}