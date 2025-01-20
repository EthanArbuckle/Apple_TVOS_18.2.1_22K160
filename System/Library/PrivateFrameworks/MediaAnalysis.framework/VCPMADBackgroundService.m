@interface VCPMADBackgroundService
+ (int)runWithArgc:(int)a3 andArgv:(const char *)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (int)run;
@end

@implementation VCPMADBackgroundService

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v6 = (NSXPCListener *)a3;
  id v7 = a4;
  v8 = v7;
  if (v7) {
    [v7 auditToken];
  }
  else {
    memset(&token, 0, sizeof(token));
  }
  SecTaskRef v9 = SecTaskCreateWithAuditToken(0LL, &token);
  SecTaskRef v39 = v9;
  if (v9)
  {
    CFTypeID TypeID = (CFTypeID)SecTaskCopyValueForEntitlement(v9, @"com.apple.mediaanalysisd.service.client", 0LL);
    cf1[0] = (CFTypeRef)TypeID;
    if (TypeID
      && (v13 = CFGetTypeID((CFTypeRef)TypeID), CFTypeID TypeID = CFBooleanGetTypeID(), v13 == TypeID)
      && (CFTypeID TypeID = CFEqual(cf1[0], kCFBooleanTrue), (_DWORD)TypeID))
    {
      if (self->_listener == v6)
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMADRemoteActivityClientHandler clientHandlerWithXPCConnection:]( &OBJC_CLASS___VCPMADRemoteActivityClientHandler,  "clientHandlerWithXPCConnection:",  v8));
        if (v31)
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue(+[VCPClientManager sharedManager](&OBJC_CLASS___VCPClientManager, "sharedManager"));
          [v32 addClientHandler:v31];

          [v8 resume];
          BOOL v23 = 1;
          goto LABEL_18;
        }

        uint64_t v33 = MediaAnalysisLogLevel(0LL, v30);
        if ((int)v33 >= 4)
        {
          uint64_t v35 = VCPLogInstance(v33, v34);
          v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
          os_log_type_t v18 = VCPLogToOSLogType[4];
          if (!os_log_type_enabled(v17, v18)) {
            goto LABEL_16;
          }
          *(_WORD *)v36 = 0;
          v19 = "Failed to add client; dropping connection";
          goto LABEL_15;
        }
      }

      else
      {
        uint64_t v14 = MediaAnalysisLogLevel(TypeID, v12);
        if ((int)v14 >= 4)
        {
          uint64_t v16 = VCPLogInstance(v14, v15);
          v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
          os_log_type_t v18 = VCPLogToOSLogType[4];
          if (os_log_type_enabled(v17, v18))
          {
            *(_WORD *)v36 = 0;
            v19 = "Unknown service requested; denying connection";
LABEL_15:
            _os_log_impl((void *)&_mh_execute_header, v17, v18, v19, v36, 2u);
            goto LABEL_16;
          }

          goto LABEL_16;
        }
      }
    }

    else
    {
      uint64_t v20 = MediaAnalysisLogLevel(TypeID, v12);
      if ((int)v20 >= 4)
      {
        uint64_t v22 = VCPLogInstance(v20, v21);
        v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        os_log_type_t v18 = VCPLogToOSLogType[4];
        if (os_log_type_enabled(v17, v18))
        {
          *(_WORD *)v36 = 0;
          v19 = "Client not entitled; denying connection";
          goto LABEL_15;
        }

- (int)run
{
  v3 = objc_alloc(&OBJC_CLASS___NSXPCListener);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMADRemoteActivityClientHandler serviceName]( &OBJC_CLASS___VCPMADRemoteActivityClientHandler,  "serviceName"));
  v5 = -[NSXPCListener initWithMachServiceName:](v3, "initWithMachServiceName:", v4);
  listener = self->_listener;
  self->_listener = v5;

  -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", self);
  id v7 = -[NSXPCListener resume](self->_listener, "resume");
  uint64_t v9 = MediaAnalysisLogLevel(v7, v8);
  if ((int)v9 >= 5)
  {
    uint64_t v11 = VCPLogInstance(v9, v10);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    os_log_type_t v13 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v12, v13))
    {
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "Media Analysis Background Service started", v15, 2u);
    }
  }

  CFRunLoopRun();
  return 0;
}

+ (int)runWithArgc:(int)a3 andArgv:(const char *)a4
{
  if (a3 < 2) {
    goto LABEL_37;
  }
  if (a3 != 2)
  {
    uint64_t v6 = MediaAnalysisLogLevel(a1, a2);
    if ((int)v6 >= 4)
    {
      uint64_t v8 = VCPLogInstance(v6, v7);
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      os_log_type_t v10 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v9, v10))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = a3;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  v10,  "Unsupported number of arguments specified (%d); ignoring",
          buf,
          8u);
      }
    }
  }

  uint64_t v11 = strcmp(a4[1], "clamp");
  if (!(_DWORD)v11)
  {
    *(_OWORD *)buf = (unint64_t)*a4;
    uint64_t v18 = MediaAnalysisLogLevel(v11, v12);
    if ((int)v18 >= 5)
    {
      uint64_t v20 = VCPLogInstance(v18, v19);
      uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      os_log_type_t v22 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v21, v22))
      {
        LOWORD(v52[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, v22, "Clamping process to utility QoS", (uint8_t *)v52, 2u);
      }
    }

    uint64_t v23 = posix_spawnattr_init(v52);
    if ((_DWORD)v23)
    {
      a1 = (id)MediaAnalysisLogLevel(v23, v24);
      uint64_t v26 = VCPLogInstance(a1, v25);
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      os_log_type_t v28 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v27, v28))
      {
        *(_WORD *)v51 = 0;
        v29 = "Failed to clamp process to utility QoS (1)";
LABEL_35:
        _os_log_impl((void *)&_mh_execute_header, v27, v28, v29, v51, 2u);
      }
    }

    else
    {
      uint64_t v30 = posix_spawnattr_set_qos_clamp_np(v52, 1LL);
      if ((_DWORD)v30)
      {
        a1 = (id)MediaAnalysisLogLevel(v30, v31);
        uint64_t v33 = VCPLogInstance(a1, v32);
        v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
        os_log_type_t v28 = VCPLogToOSLogType[4];
        if (os_log_type_enabled(v27, v28))
        {
          *(_WORD *)v51 = 0;
          v29 = "Failed to clamp process to utility QoS (2)";
          goto LABEL_35;
        }
      }

      else
      {
        uint64_t v34 = posix_spawnattr_setflags(v52, 64);
        if ((_DWORD)v34)
        {
          a1 = (id)MediaAnalysisLogLevel(v34, v35);
          uint64_t v37 = VCPLogInstance(a1, v36);
          v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
          os_log_type_t v28 = VCPLogToOSLogType[4];
          if (os_log_type_enabled(v27, v28))
          {
            *(_WORD *)v51 = 0;
            v29 = "Failed to clamp process to utility QoS (3)";
            goto LABEL_35;
          }
        }

        else
        {
          uint64_t v38 = posix_spawnp(0LL, *a4, 0LL, v52, (char *const *)buf, environ);
          BOOL v39 = (_DWORD)v38 == 0;
          a1 = (id)MediaAnalysisLogLevel(v38, v40);
          if (v39)
          {
            uint64_t v43 = VCPLogInstance(a1, v41);
            v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
            os_log_type_t v28 = VCPLogToOSLogType[5];
            if (os_log_type_enabled(v27, v28))
            {
              *(_WORD *)v51 = 0;
              v29 = "Successfully clamped process to utility QoS";
              goto LABEL_35;
            }
          }

          else
          {
            uint64_t v42 = VCPLogInstance(a1, v41);
            v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
            os_log_type_t v28 = VCPLogToOSLogType[4];
            if (os_log_type_enabled(v27, v28))
            {
              *(_WORD *)v51 = 0;
              v29 = "Failed to clamp process to utility QoS (4)";
              goto LABEL_35;
            }
          }
        }
      }
    }

    goto LABEL_37;
  }

  a1 = (id)MediaAnalysisLogLevel(v11, v12);
  if ((int)a1 >= 4)
  {
    uint64_t v14 = VCPLogInstance(a1, v13);
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    os_log_type_t v16 = VCPLogToOSLogType[4];
    if (os_log_type_enabled(v15, v16))
    {
      v17 = a4[1];
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "Unknown argument specified (%s); ignoring", buf, 0xCu);
    }
  }

- (void).cxx_destruct
{
}

@end