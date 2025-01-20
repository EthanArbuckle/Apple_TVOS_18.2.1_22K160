uint64_t start()
{
  void *v0;
  id v1;
  int v3;
  _DWORD v4[2];
  v0 = objc_autoreleasePoolPush();
  if ((_set_user_dir_suffix("com.apple.triald") & 1) == 0
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v3 = *__error();
    v4[0] = 67109120;
    v4[1] = v3;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to set private sandbox for com.apple.triald, errno: %d",  (uint8_t *)v4,  8u);
  }

  v1 = NSTemporaryDirectory();
  objc_autoreleasePoolPop(v0);
  TRIDServerRun();
  return 0LL;
}

void sub_10000323C(uint64_t a1)
{
  v2 = objc_autoreleasePoolPush();
  v3 = (objc_class *)objc_opt_class(*(void *)(a1 + 32));
  InstanceMethod = class_getInstanceMethod(v3, "descriptionWithLocale:");
  if (!InstanceMethod)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v6 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"TRIDaemonScopedSwizzling.m" lineNumber:28 description:@"failed to lookup -[NSDate descriptionWithLocale:]"];
  }

  v5 = class_getInstanceMethod(v3, "tri_memoryFriendlyDescriptionWithLocale:");
  if (!v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v7 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"TRIDaemonScopedSwizzling.m" lineNumber:30 description:@"failed to lookup -[NSDate tri_memoryFriendlyDescriptionWithLocale:]"];
  }

  method_exchangeImplementations(InstanceMethod, v5);
  objc_autoreleasePoolPop(v2);
}

id sub_1000034B4(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "tri_memoryFriendlyDescriptionWithLocale:", *(void *)(a1 + 40)));
  if (!v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v4 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 32), @"TRIDaemonScopedSwizzling.m", 53, @"Expression was unexpectedly nil/false: %@", @"[self tri_memoryFriendlyDescriptionWithLocale:locale]" object file lineNumber description];
  }

  return v2;
}

id objc_msgSend_tri_memoryFriendlyDescriptionWithLocale_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tri_memoryFriendlyDescriptionWithLocale:");
}