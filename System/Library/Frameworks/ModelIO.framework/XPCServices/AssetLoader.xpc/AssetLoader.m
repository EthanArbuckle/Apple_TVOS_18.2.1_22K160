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

void sub_100003894( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return [a1 uppercaseString];
}
 == -1)
    v8[2](v8, @"Unable to consume sandbox.read extension.");
  v12 = objc_alloc(&OBJC_CLASS___MDLAssetLoader);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v17 pathExtension]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 uppercaseString]);
  v15 = [v12 initWithExtension:v14];

  v16 = (__CFString *)objc_claimAutoreleasedReturnValue([v15 loadURL:v17]);
  v8[2](v8, v16);
  sandbox_extension_release(v11);
}

@end