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

uint64_t sub_10000399C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedObject:");
}
ng:range:configuration:completionBlock:]( &OBJC_CLASS___DDScannerService,  "scanString:range:configuration:completionBlock:",  a3,  location,  length,  a5,  v11);
}

@end