void sub_100003268(id a1, AMSPurchaseResult *a2, NSError *a3)
{
  AMSPurchaseResult *v4;
  NSError *v5;
  NSMutableDictionary *v6;
  NSNumber *v7;
  void *v8;
  void *v9;
  int v10;
  AMSPurchaseResult *v11;
  v4 = a2;
  v5 = a3;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000033EC((uint64_t)v5);
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543362;
      v11 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "TVAskPermissionRequestExtension::AMSPurchaseRequest succeeded - Response items: %{public}@",  (uint8_t *)&v10,  0xCu);
    }

    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v7 = +[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", getpid());
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v8, @"sendingPID");

    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
    [v9 postNotificationName:@"com.apple.VideosUI.StoreAcquisitionCrossProcessNotification" object:0 userInfo:v6 deliverImmediately:1];

    notify_post((const char *)[@"com.apple.VideosUI.StoreAcquisitionCrossProcessNotification" cStringUsingEncoding:4]);
  }
}

void sub_1000033EC(uint64_t a1)
{
  int v1 = 138543362;
  uint64_t v2 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "TVAskPermissionRequestExtension::AMSPurchaseRequest failed - Error: %{public}@",  (uint8_t *)&v1,  0xCu);
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}