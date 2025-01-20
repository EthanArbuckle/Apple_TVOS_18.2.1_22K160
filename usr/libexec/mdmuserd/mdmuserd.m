uint64_t start()
{
  void *v0;
  os_log_s *v1;
  dispatch_queue_attr_t v2;
  dispatch_queue_attr_s *v3;
  dispatch_queue_t v4;
  id v5;
  id v6;
  id v7;
  NSXPCListener *v8;
  NSXPCListener *v9;
  void *v10;
  os_log_s *v11;
  os_log_s *v13;
  uint8_t v14[16];
  uint8_t buf[16];
  uint8_t v16[16];
  if ((+[DMCMultiUserModeUtilities inSharediPadUserSession]( &OBJC_CLASS___DMCMultiUserModeUtilities,  "inSharediPadUserSession") & 1) != 0)
  {
    v0 = objc_autoreleasePoolPush();
    v1 = *(os_log_s **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "mdmuserd starting...", buf, 2u);
    }

    v2 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_UTILITY, 0);
    v3 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v2);
    v4 = dispatch_queue_create("mdmuserd Catalyst Queue", v3);
    CATSetCatalystQueue();

    v5 = [[DMCPowerAssertion alloc] initWithReason:@"mdmuserd-Start"];
    v6 = [[MDMServerCore alloc] initWithChannelType:1];
    [v6 startOutError:0];
    v7 = [[MDMServiceDelegate alloc] initWithServer:v6];
    v8 = objc_alloc(&OBJC_CLASS___NSXPCListener);
    v9 = -[NSXPCListener initWithMachServiceName:](v8, "initWithMachServiceName:", kMDMUserServiceBootstrapName);
    -[NSXPCListener setDelegate:](v9, "setDelegate:", v7);
    -[NSXPCListener resume](v9, "resume");

    objc_autoreleasePoolPop(v0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
    [v10 run];

    v11 = *(os_log_s **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "mdmuserd stopping.", v14, 2u);
    }

    return 0LL;
  }

  else
  {
    v13 = *(os_log_s **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "mdmuserd exiting immediately - device is not in Shared iPad user session and user channel feature is not enabled",  v16,  2u);
    }

    return 1LL;
  }
}

id objc_msgSend_startOutError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startOutError:");
}