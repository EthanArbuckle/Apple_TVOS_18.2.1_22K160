uint64_t start()
{
  ServiceDelegate *v0;
  void *v1;
  v0 = objc_opt_new(&OBJC_CLASS___ServiceDelegate);
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener"));
  [v1 setDelegate:v0];
  [v1 resume];

  return 0LL;
}

id sub_1000038B8()
{
  if (qword_1000086E8 != -1) {
    dispatch_once(&qword_1000086E8, &stru_1000040E0);
  }
  return (id)qword_1000086E0;
}

void sub_1000038F8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.avkit.SharedPreferences", "AVKitSharedPreferences");
  v2 = (void *)qword_1000086E0;
  qword_1000086E0 = (uint64_t)v1;
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedObject:");
}