void sub_1000021B8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000021D8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000021E8(uint64_t a1)
{
}

void sub_1000021F0(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10000C838();
    }
  }
}

LABEL_69:
      v42 = 0;
      goto LABEL_70;
    }

LABEL_18:
    if (kperf_kdebug_filter_set(v10))
    {
      desc = kperf_kdebug_filter_create_desc(v10);
      if (!a4) {
        goto LABEL_69;
      }
      v21 = "???";
      if (desc) {
        v21 = (const char *)desc;
      }
      v54 = (uint64_t)v21;
      goto LABEL_66;
    }

    v23 = kperf_kdebug_action_set(1LL);
    if ((_DWORD)v23)
    {
      if (!a4) {
        goto LABEL_69;
      }
      v54 = v23;
      v22 = @"Unable to set kperf action for kdebug events: %{errno}d";
      goto LABEL_66;
    }

    v24 = kperf_action_samplers_set(1LL, v56);
    if ((_DWORD)v24)
    {
      if (!a4) {
        goto LABEL_69;
      }
      v54 = v24;
      v22 = @"Unable to set samplers for kdebug kperf events: %{errno}d";
      goto LABEL_66;
    }

    goto LABEL_33;
  }

  if (-[PTService _aspSamplingInitFilter:withSamplers:](self, "_aspSamplingInitFilter:withSamplers:", v10, &v56)) {
    goto LABEL_18;
  }
  if (!a4) {
    goto LABEL_69;
  }
  v19 = @"Unable to init asp sampling";
LABEL_51:
  v42 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError error:description:](&OBJC_CLASS___NSError, "error:description:", 0LL, v19));
LABEL_70:

  return v42;
}

LABEL_28:
  return v36;
}

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[PTService activeConfig](self, "activeConfig"));
      v26 = [v25 symbolicate];

      if (v26) {
        -[PTService _symbolicateKtraceFile:](self, "_symbolicateKtraceFile:", v6);
      }
      v18 = 1;
      goto LABEL_18;
    }

    if (a4)
    {
      v17 = @"Failed to create the tracing session for post-processing";
      goto LABEL_10;
    }

  v33 = *(void **)(a1 + 32);
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v7));
  v35 = (void *)objc_claimAutoreleasedReturnValue([v33 _generateToken:v34]);

  [*(id *)(a1 + 32) setActiveConfig:0];
  v36 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) connection]);
  v37 = (void *)objc_claimAutoreleasedReturnValue([v36 synchronousRemoteObjectProxyWithErrorHandler:&stru_1000149F8]);

  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v7));
  [v37 performanceTraceDidComplete:v38 withToken:v35 withError:v6];
}

  v38 = *(void **)(a1 + 32);
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v8));
  v40 = (void *)objc_claimAutoreleasedReturnValue([v38 _generateToken:v39]);

  [*(id *)(a1 + 32) setActiveConfig:0];
  v41 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) connection]);
  v42 = (void *)objc_claimAutoreleasedReturnValue([v41 synchronousRemoteObjectProxyWithErrorHandler:&stru_100014B60]);

  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v8));
  [v42 performanceTraceDidComplete:v43 withToken:v40 withError:v7];
}

LABEL_16:
        ktrace_session_destroy(v11);
        goto LABEL_17;
      }

      dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
      ktrace_session_destroy(v11);
      if (v34[3])
      {
        if (a4)
        {
          v18 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError error:description:]( &OBJC_CLASS___NSError,  "error:description:",  5LL,  @"Events were lost during tracing. Trace will be unreadable"));
          goto LABEL_18;
        }

LABEL_17:
        v18 = 0;
LABEL_18:

        _Block_object_dispose(v30, 8);
        _Block_object_dispose(v31, 8);
        _Block_object_dispose(&v33, 8);
        goto LABEL_19;
      }

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[PTService activeConfig](self, "activeConfig"));
      if ([v22 includeOSLogs])
      {
      }

      else
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[PTService activeConfig](self, "activeConfig"));
        v24 = [v23 includeOSSignposts];

        if (!v24) {
          goto LABEL_28;
        }
      }

      if (!-[PTService _appendLogContentToKtraceFile:withError:]( self,  "_appendLogContentToKtraceFile:withError:",  v6,  a4)
        || *a4)
      {
        goto LABEL_17;
      }

LABEL_11:
    v18 = 0;
    goto LABEL_19;
  }

  if (!a4) {
    goto LABEL_11;
  }
  v17 = @"Failed to open the trace file to append specs";
LABEL_10:
  v18 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError error:description:](&OBJC_CLASS___NSError, "error:description:", 0LL, v17));
LABEL_19:

  return v18;
}

void sub_100003434( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, char a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

void *sub_100003470(void *result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result[4] + 8LL);
  if (*(_BYTE *)(v2 + 24))
  {
    *(_BYTE *)(v2 + 24) = 0;
  }

  else if (*(_DWORD *)(a2 + 48) == 117571592)
  {
    ++*(void *)(*(void *)(result[5] + 8LL) + 24LL);
  }

  ++*(void *)(*(void *)(result[6] + 8LL) + 24LL);
  return result;
}

uint64_t sub_1000034C8(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

LABEL_10:
    [v12 performanceTraceDidStart:v10];
    goto LABEL_11;
  }

  -[PTService setKtraceRecording:](self, "setKtraceRecording:", ktrace_recording_create("PerformanceTrace", 0LL));
  if (!-[PTService ktraceRecording](self, "ktraceRecording"))
  {
    v10 = (NSDateFormatter *)objc_claimAutoreleasedReturnValue( +[NSError error:description:]( &OBJC_CLASS___NSError,  "error:description:",  0LL,  @"Cannot start tracing as Performance Trace failed to create the ktrace recording"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[PTService connection](self, "connection"));
    v12 = (id)objc_claimAutoreleasedReturnValue([v23 synchronousRemoteObjectProxyWithErrorHandler:&stru_1000146E0]);

    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }

  current = ktrace_config_create_current();
  if (current)
  {
    v15 = current;
    if (ktrace_config_get_owner_kind() == 1)
    {
      owner_name = (const char *)ktrace_config_get_owner_name(v15);
      if (strncmp(owner_name, "com.apple.Perfor", 0x20uLL))
      {
        v17 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Cannot start tracing as another process already owns foreground tracing: %s [%i]",  owner_name,  ktrace_config_get_owner_pid(v15));
        v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        v10 = (NSDateFormatter *)objc_claimAutoreleasedReturnValue(+[NSError error:description:](&OBJC_CLASS___NSError, "error:description:", 2LL, v18));

        ktrace_config_destroy(v15);
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[PTService activeConfig](self, "activeConfig"));

        if (v19)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[PTService activeConfig](self, "activeConfig"));
          [v20 setTracingActiveTransaction:0];

          -[PTService setActiveConfig:](self, "setActiveConfig:", 0LL);
        }

        if (-[PTService ktraceRecording](self, "ktraceRecording"))
        {
          v21 = ktrace_recording_destroy(-[PTService ktraceRecording](self, "ktraceRecording"));
          kperf_reset(v21);
          -[PTService setKtraceRecording:](self, "setKtraceRecording:", 0LL);
        }

        -[PTService _graphicsSamplingTeardown](self, "_graphicsSamplingTeardown");
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[PTService connection](self, "connection"));
        v12 = (id)objc_claimAutoreleasedReturnValue([v22 synchronousRemoteObjectProxyWithErrorHandler:&stru_100014740]);

        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          goto LABEL_10;
        }
        goto LABEL_9;
      }

      v24 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
      if (v24) {
        sub_10000CCD0(v24, v25, v26, v27, v28, v29, v30, v31);
      }
      v32 = ktrace_reset_existing();
      if ((_DWORD)v32)
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ktrace was left in a bad state and cannot be reset: %{errno}d",  v32));
        v10 = (NSDateFormatter *)objc_claimAutoreleasedReturnValue(+[NSError error:description:](&OBJC_CLASS___NSError, "error:description:", 0LL, v33));

        ktrace_config_destroy(v15);
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[PTService activeConfig](self, "activeConfig"));

        if (v34)
        {
          v35 = (void *)objc_claimAutoreleasedReturnValue(-[PTService activeConfig](self, "activeConfig"));
          [v35 setTracingActiveTransaction:0];

          -[PTService setActiveConfig:](self, "setActiveConfig:", 0LL);
        }

        if (-[PTService ktraceRecording](self, "ktraceRecording"))
        {
          v36 = ktrace_recording_destroy(-[PTService ktraceRecording](self, "ktraceRecording"));
          kperf_reset(v36);
          -[PTService setKtraceRecording:](self, "setKtraceRecording:", 0LL);
        }

        -[PTService _graphicsSamplingTeardown](self, "_graphicsSamplingTeardown");
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[PTService connection](self, "connection"));
        v12 = (id)objc_claimAutoreleasedReturnValue([v37 synchronousRemoteObjectProxyWithErrorHandler:&stru_100014700]);

        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          goto LABEL_10;
        }
        goto LABEL_9;
      }

      v38 = kperf_reset(v32);
      if ((_DWORD)v38)
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"kperf was left in a bad state and cannot be reset: %{errno}d",  v38));
        v10 = (NSDateFormatter *)objc_claimAutoreleasedReturnValue(+[NSError error:description:](&OBJC_CLASS___NSError, "error:description:", 0LL, v39));

        ktrace_config_destroy(v15);
        v40 = (void *)objc_claimAutoreleasedReturnValue(-[PTService activeConfig](self, "activeConfig"));

        if (v40)
        {
          v41 = (void *)objc_claimAutoreleasedReturnValue(-[PTService activeConfig](self, "activeConfig"));
          [v41 setTracingActiveTransaction:0];

          -[PTService setActiveConfig:](self, "setActiveConfig:", 0LL);
        }

        if (-[PTService ktraceRecording](self, "ktraceRecording"))
        {
          v42 = ktrace_recording_destroy(-[PTService ktraceRecording](self, "ktraceRecording"));
          kperf_reset(v42);
          -[PTService setKtraceRecording:](self, "setKtraceRecording:", 0LL);
        }

        -[PTService _graphicsSamplingTeardown](self, "_graphicsSamplingTeardown");
        v43 = (void *)objc_claimAutoreleasedReturnValue(-[PTService connection](self, "connection"));
        v12 = (id)objc_claimAutoreleasedReturnValue([v43 synchronousRemoteObjectProxyWithErrorHandler:&stru_100014720]);

        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          goto LABEL_10;
        }
        goto LABEL_9;
      }
    }

    ktrace_config_destroy(v15);
  }

  -[PTService setActiveConfig:](self, "setActiveConfig:", v4);
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[PTService setStartTime:](self, "setStartTime:", v44);

  v10 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  -[NSDateFormatter setDateStyle:](v10, "setDateStyle:", 1LL);
  -[NSDateFormatter setDateFormat:](v10, "setDateFormat:", @"yyyy-MM-dd-HHmmss");
  v45 = (void *)objc_claimAutoreleasedReturnValue([v4 traceName]);
  v46 = v45;
  if (v45)
  {
    v12 = v45;
  }

  else
  {
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[PTService startTime](self, "startTime"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v10, "stringFromDate:", v47));
    v12 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"trace_%@.atrc", v48));
  }

  v49 = (void *)objc_claimAutoreleasedReturnValue([v4 traceDirectoryURL]);
  v50 = objc_claimAutoreleasedReturnValue([v49 path]);
  v51 = (void *)v50;
  v52 = @"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/PerformanceTraces/";
  if (v50) {
    v52 = (__CFString *)v50;
  }
  v53 = v52;

  v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v123 = NSFilePosixPermissions;
  v124 = &off_100016110;
  v55 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v124,  &v123,  1LL));
  v119 = 0LL;
  v56 = [v54 createDirectoryAtPath:v53 withIntermediateDirectories:1 attributes:v55 error:&v119];
  v57 = v119;
  v58 = v57;
  if ((v56 & 1) != 0)
  {
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingPathComponent:](v53, "stringByAppendingPathComponent:", v12));
    v118 = 0LL;
    v60 = objc_claimAutoreleasedReturnValue( -[PTService _traceRecordArgsArrayFromConfig:outputFilePath:error:]( self,  "_traceRecordArgsArrayFromConfig:outputFilePath:error:",  v4,  v59,  &v118));
    v98 = v118;
    v99 = (void *)v60;
    if (v98)
    {
      v61 = (void *)objc_claimAutoreleasedReturnValue(-[PTService activeConfig](self, "activeConfig"));

      if (v61)
      {
        v62 = (void *)objc_claimAutoreleasedReturnValue(-[PTService activeConfig](self, "activeConfig"));
        [v62 setTracingActiveTransaction:0];

        -[PTService setActiveConfig:](self, "setActiveConfig:", 0LL);
      }

      if (-[PTService ktraceRecording](self, "ktraceRecording"))
      {
        v63 = ktrace_recording_destroy(-[PTService ktraceRecording](self, "ktraceRecording"));
        kperf_reset(v63);
        -[PTService setKtraceRecording:](self, "setKtraceRecording:", 0LL);
      }

      -[PTService _graphicsSamplingTeardown](self, "_graphicsSamplingTeardown");
      v64 = (void *)objc_claimAutoreleasedReturnValue(-[PTService connection](self, "connection"));
      v65 = (void *)objc_claimAutoreleasedReturnValue([v64 synchronousRemoteObjectProxyWithErrorHandler:&stru_100014780]);

      v66 = v98;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10000CC54(v98);
      }
      [v65 performanceTraceDidStart:v98];
    }

    else
    {
      v104 = v58;
      v74 = -[PTService ktraceRecording](self, "ktraceRecording");
      ktrace_recording_set_streams(v74, __stdoutp, __stderrp);
      v75 = (void *)v60;
      v76 = (void *)os_transaction_create("com.apple.PerformanceTrace.PerformanceTraceService");
      [v4 setTracingActiveTransaction:v76];

      v77 = -[PTService ktraceRecording](self, "ktraceRecording");
      v114[0] = _NSConcreteStackBlock;
      v114[1] = 3221225472LL;
      v114[2] = sub_100004648;
      v114[3] = &unk_100014828;
      v114[4] = self;
      v96 = v59;
      v115 = v59;
      v116 = v4;
      v97 = v55;
      v117 = v55;
      ktrace_recording_follow_notifications(v77, v114);
      global_queue = dispatch_get_global_queue(25LL, 0LL);
      v79 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
      v80 = dispatch_queue_create_with_target_V2("com.apple.PerformanceTrace.tracingStartedNotificationQueue", 0LL, v79);
      queue = v79;

      out_token = 0;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_100004EC8;
      handler[3] = &unk_100014870;
      handler[4] = self;
      v94 = v80;
      notify_register_dispatch("com.apple.PerformanceTrace.StartedTraceRecord", &out_token, v80, handler);
      v93 = [v75 count];
      v105 = calloc(v93 + 1LL, 8uLL);
      v108 = 0u;
      v109 = 0u;
      v110 = 0u;
      v111 = 0u;
      v81 = v75;
      v82 = [v81 countByEnumeratingWithState:&v108 objects:v122 count:16];
      if (v82)
      {
        v83 = v82;
        v101 = v54;
        v103 = v53;
        v92 = v10;
        v84 = 0LL;
        v85 = *(void *)v109;
        do
        {
          v86 = 0LL;
          v87 = (void)v84 << 32;
          v88 = (int)v84;
          v89 = (char *)&v105[(int)v84];
          do
          {
            if (*(void *)v109 != v85) {
              objc_enumerationMutation(v81);
            }
            *(void *)&v89[8 * (void)v86] = strdup((const char *)[*(id *)(*((void *)&v108 + 1) + 8 * (void)v86) UTF8String]);
            v86 = (char *)v86 + 1;
            v87 += (uint64_t)&_mh_execute_header;
          }

          while (v83 != v86);
          v83 = [v81 countByEnumeratingWithState:&v108 objects:v122 count:16];
          v84 = (char *)v86 + v88;
        }

        while (v83);
        v90 = v87 >> 32;
        v10 = v92;
        v54 = v101;
        v53 = v103;
      }

      else
      {
        v90 = 0LL;
      }

      v105[v90] = 0LL;
      v66 = 0LL;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v91 = (void *)objc_claimAutoreleasedReturnValue([v81 componentsJoinedByString:@" "]);
        *(_DWORD *)buf = 138412290;
        v121 = v91;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "trace record args: %@",  buf,  0xCu);
      }

      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100004FA0;
      block[3] = &unk_1000148B8;
      v107 = v93;
      block[4] = self;
      block[5] = v105;
      dispatch_async(queue, block);

      v59 = v96;
      v55 = v97;
      v58 = v104;
    }
  }

  else
  {
    v100 = v54;
    v102 = v53;
    v67 = (void *)objc_claimAutoreleasedReturnValue([v57 localizedDescription]);
    v68 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Cannot start tracing as Performance Trace cannot write to the target directory: %@",  v67));
    v69 = (void *)objc_claimAutoreleasedReturnValue( +[NSError error:description:underlyingError:]( &OBJC_CLASS___NSError,  "error:description:underlyingError:",  3LL,  v68,  v58));

    v70 = (void *)objc_claimAutoreleasedReturnValue(-[PTService activeConfig](self, "activeConfig"));
    if (v70)
    {
      v71 = (void *)objc_claimAutoreleasedReturnValue(-[PTService activeConfig](self, "activeConfig"));
      [v71 setTracingActiveTransaction:0];

      -[PTService setActiveConfig:](self, "setActiveConfig:", 0LL);
    }

    if (-[PTService ktraceRecording](self, "ktraceRecording"))
    {
      v72 = ktrace_recording_destroy(-[PTService ktraceRecording](self, "ktraceRecording"));
      kperf_reset(v72);
      -[PTService setKtraceRecording:](self, "setKtraceRecording:", 0LL);
    }

    -[PTService _graphicsSamplingTeardown](self, "_graphicsSamplingTeardown");
    v73 = (void *)objc_claimAutoreleasedReturnValue(-[PTService connection](self, "connection"));
    v66 = (void *)objc_claimAutoreleasedReturnValue([v73 synchronousRemoteObjectProxyWithErrorHandler:&stru_100014760]);

    v54 = v100;
    v59 = v69;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10000CC54(v69);
    }
    [v66 performanceTraceDidStart:v69];
    v53 = v102;
  }

LABEL_11:
}

  [v12 performanceTraceDidStart:v10];
LABEL_11:
}

void sub_100004468(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000CD04();
  }
}

void sub_1000044A4(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000CD04();
  }
}

void sub_1000044E0(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000CD04();
  }
}

void sub_10000451C(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000CD04();
  }
}

void sub_100004558(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000CD04();
  }
}

void sub_100004594(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000CD04();
  }
}

void sub_1000045D0(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000CD04();
  }
}

void sub_10000460C(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000CD04();
  }
}

void sub_100004648(uint64_t a1, int *a2)
{
  switch(*a2)
  {
    case 6:
      if ([*(id *)(a1 + 32) ktraceRecording])
      {
        uint64_t v4 = ktrace_recording_destroy([*(id *)(a1 + 32) ktraceRecording]);
        kperf_reset(v4);
        [*(id *)(a1 + 32) setKtraceRecording:0];
      }

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Received trace record finished notification",  buf,  2u);
      }

      id v5 = *(id *)(a1 + 40);
      if ([*(id *)(a1 + 48) compressWhenFinished])
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Compressing Performance Trace",  buf,  2u);
        }

        uint64_t v6 = tailspin_compress_file(v5, 1LL);
        v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
        v8 = v7;
        if (v7)
        {
          id v9 = v7;

          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Done compressing Performance Trace",  buf,  2u);
          }
        }

        else
        {
          BOOL v25 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
          if (v25) {
            sub_10000CE70(v25, v26, v27, v28, v29, v30, v31, v32);
          }
          id v9 = v5;
        }

        id v5 = v9;
      }

      v33 = *(void **)(a1 + 32);
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v5));
      [v33 _markPurgable:v34 withUrgency:1024];

      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      uint64_t v36 = *(void *)(a1 + 56);
      id v52 = 0LL;
      [v35 setAttributes:v36 ofItemAtPath:v5 error:&v52];
      id v14 = v52;

      if (v14 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10000CDF4(v14);
      }
      uint64_t v37 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) connection]);
      if (v37
        && (v38 = (void *)v37,
            v39 = *(void **)(a1 + 32),
            v40 = (void *)objc_claimAutoreleasedReturnValue([v39 connection]),
            LODWORD(v39) = [v39 _connectionIsEntitled:v40 toEntitlement:@"com.apple.PerformanceTrace.SkipNotification"],  v40,  v38,  (_DWORD)v39))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Skipping notification as requested.",  buf,  2u);
        }
      }

      else
      {
        v41 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) connection]);
        int v42 = [v41 processIdentifier];

        proc_name(v42, buf, 0x20u);
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10000CD6C();
        }
LABEL_47:
        v43 = *(void **)(a1 + 32);
        v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v5));
        [v43 _sendNotification:v44];
      }

      v45 = *(void **)(a1 + 32);
      v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v5));
      v47 = (void *)objc_claimAutoreleasedReturnValue([v45 _generateToken:v46]);

      v48 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeConfig]);
      [v48 setTracingActiveTransaction:0];

      [*(id *)(a1 + 32) setActiveConfig:0];
      v49 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) connection]);
      v50 = (void *)objc_claimAutoreleasedReturnValue([v49 synchronousRemoteObjectProxyWithErrorHandler:&stru_100014800]);

      v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v5));
      [v50 performanceTraceDidComplete:v51 withToken:v47 withError:0];

      goto LABEL_49;
    case 8:
      v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeConfig]);

      if (v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeConfig]);
        [v12 setTracingActiveTransaction:0];

        [*(id *)(a1 + 32) setActiveConfig:0];
      }

      if ([*(id *)(a1 + 32) ktraceRecording])
      {
        uint64_t v13 = ktrace_recording_destroy([*(id *)(a1 + 32) ktraceRecording]);
        kperf_reset(v13);
        [*(id *)(a1 + 32) setKtraceRecording:0];
      }

      [*(id *)(a1 + 32) _graphicsSamplingTeardown];
      id v5 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Received argument error from ktrace_record: %s",  *((void *)a2 + 1)));
      id v14 = (id)objc_claimAutoreleasedReturnValue(+[NSError error:description:](&OBJC_CLASS___NSError, "error:description:", 3LL, v5));
      v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) connection]);
      v16 = (void *)objc_claimAutoreleasedReturnValue([v15 synchronousRemoteObjectProxyWithErrorHandler:&stru_1000147A0]);

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        goto LABEL_31;
      }
      goto LABEL_32;
    case 9:
      v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeConfig]);

      if (v17)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeConfig]);
        [v18 setTracingActiveTransaction:0];

        [*(id *)(a1 + 32) setActiveConfig:0];
      }

      if ([*(id *)(a1 + 32) ktraceRecording])
      {
        uint64_t v19 = ktrace_recording_destroy([*(id *)(a1 + 32) ktraceRecording]);
        kperf_reset(v19);
        [*(id *)(a1 + 32) setKtraceRecording:0];
      }

      [*(id *)(a1 + 32) _graphicsSamplingTeardown];
      id v5 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Received permission error from ktrace_record: %s",  *((void *)a2 + 1)));
      id v14 = (id)objc_claimAutoreleasedReturnValue(+[NSError error:description:](&OBJC_CLASS___NSError, "error:description:", 3LL, v5));
      v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) connection]);
      v16 = (void *)objc_claimAutoreleasedReturnValue([v20 synchronousRemoteObjectProxyWithErrorHandler:&stru_1000147E0]);

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        goto LABEL_31;
      }
      goto LABEL_32;
    case 10:
      v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeConfig]);

      if (v21)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeConfig]);
        [v22 setTracingActiveTransaction:0];

        [*(id *)(a1 + 32) setActiveConfig:0];
      }

      if ([*(id *)(a1 + 32) ktraceRecording])
      {
        uint64_t v23 = ktrace_recording_destroy([*(id *)(a1 + 32) ktraceRecording]);
        kperf_reset(v23);
        [*(id *)(a1 + 32) setKtraceRecording:0];
      }

      [*(id *)(a1 + 32) _graphicsSamplingTeardown];
      id v5 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Received system error from ktrace_record: %s",  *((void *)a2 + 1)));
      id v14 = (id)objc_claimAutoreleasedReturnValue(+[NSError error:description:](&OBJC_CLASS___NSError, "error:description:", 3LL, v5));
      v24 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) connection]);
      v16 = (void *)objc_claimAutoreleasedReturnValue([v24 synchronousRemoteObjectProxyWithErrorHandler:&stru_1000147C0]);

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
LABEL_31:
      }
        sub_10000CC54(v14);
LABEL_32:
      [v16 performanceTraceDidStart:v14];

LABEL_49:
      break;
    default:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        int v10 = *a2;
        *(_DWORD *)buf = 67109120;
        int v54 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Received unhandled note from ktrace_record: %d",  buf,  8u);
      }

      break;
  }
}

void sub_100004DD8(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000CD04();
  }
}

void sub_100004E14(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000CD04();
  }
}

void sub_100004E50(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000CD04();
  }
}

void sub_100004E8C(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000CD04();
  }
}

void sub_100004EC8(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Sucessfully started Performance Trace",  v4,  2u);
  }

  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) connection]);
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 synchronousRemoteObjectProxyWithErrorHandler:&stru_100014848]);

  [v3 performanceTraceDidStart:0];
}

void sub_100004F64(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000CD04();
  }
}

void sub_100004FA0(uint64_t a1)
{
  BOOL v2 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v2) {
    sub_10000CEA4(v2, v3, v4, v5, v6, v7, v8, v9);
  }
  uint64_t v10 = ktrace_record( [*(id *)(a1 + 32) ktraceRecording],  *(unsigned int *)(a1 + 48),  *(void *)(a1 + 40));
  if ((_DWORD)v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to start trace session with error: %d",  v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError error:description:](&OBJC_CLASS___NSError, "error:description:", 3LL, v11));

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeConfig]);
    if (v13)
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeConfig]);
      [v14 setTracingActiveTransaction:0];

      [*(id *)(a1 + 32) setActiveConfig:0];
    }

    if ([*(id *)(a1 + 32) ktraceRecording])
    {
      uint64_t v15 = ktrace_recording_destroy([*(id *)(a1 + 32) ktraceRecording]);
      kperf_reset(v15);
      [*(id *)(a1 + 32) setKtraceRecording:0];
    }

    [*(id *)(a1 + 32) _graphicsSamplingTeardown];
    v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) connection]);
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 synchronousRemoteObjectProxyWithErrorHandler:&stru_100014890]);

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10000CC54(v12);
    }
    [v17 performanceTraceDidStart:v12];
  }

void sub_100005114(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000CD04();
  }
}

LABEL_54:
  return a5;
}

void sub_100006714(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000CD04();
  }
}

void sub_100006750(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000CD04();
  }
}

void sub_10000678C(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000CD04();
  }
}

void sub_1000067C8(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000CD04();
  }
}

void sub_100006804(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000CD04();
  }
}

void sub_100006840(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000CD04();
  }
}

void sub_10000687C(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000CD04();
  }
}

void sub_1000068B8(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000CD04();
  }
}

void sub_1000068F4(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000CD04();
  }
}

void sub_100006930(uint64_t a1)
{
  if ([*(id *)(a1 + 32) ktraceSession])
  {
    uint64_t v2 = ktrace_session_destroy([*(id *)(a1 + 32) ktraceSession]);
    kperf_reset(v2);
    [*(id *)(a1 + 32) setKtraceSession:0];
  }

  [*(id *)(a1 + 32) _graphicsSamplingTeardown];
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", *(void *)(a1 + 40)));
  id v40 = 0LL;
  unsigned __int8 v5 = [v3 _postProcessKtraceFile:v4 withError:&v40];
  id v6 = v40;

  if ((v6 || (v5 & 1) == 0) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000CF48(v6);
  }
  id v7 = *(id *)(a1 + 40);
  if ([*(id *)(a1 + 48) compressWhenFinished])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Compressing Performance Trace",  buf,  2u);
    }

    uint64_t v8 = tailspin_compress_file(*(void *)(a1 + 40), 1LL);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    uint64_t v10 = v9;
    if (v9)
    {
      id v11 = v9;

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Done compressing Performance Trace",  buf,  2u);
      }
    }

    else
    {
      BOOL v12 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v12) {
        sub_10000CE70(v12, v13, v14, v15, v16, v17, v18, v19);
      }
      id v11 = v7;
    }

    id v7 = v11;
  }

  v20 = *(void **)(a1 + 32);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v7));
  [v20 _markPurgable:v21 withUrgency:1024];

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v23 = *(void *)(a1 + 56);
  id v39 = 0LL;
  [v22 setAttributes:v23 ofItemAtPath:v7 error:&v39];
  id v24 = v39;

  if (v24 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000CDF4(v24);
  }
  uint64_t v25 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) connection]);
  if (!v25
    || (uint64_t v26 = (void *)v25,
        uint64_t v27 = *(void **)(a1 + 32),
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v27 connection]),
        LODWORD(v27) = [v27 _connectionIsEntitled:v28 toEntitlement:@"com.apple.PerformanceTrace.SkipNotification"],  v28,  v26,  !(_DWORD)v27))
  {
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) connection]);
    int v30 = [v29 processIdentifier];

    proc_name(v30, buf, 0x20u);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10000CD6C();
    }
LABEL_27:
    uint64_t v31 = *(void **)(a1 + 32);
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v7));
    [v31 _sendNotification:v32];

    goto LABEL_28;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Skipping notification as requested.",  buf,  2u);
  }

void sub_100006D58(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000CD04();
  }
}

void sub_100006D94(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000CD04();
  }
}

void sub_100006DD0(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000CD04();
  }
}

void sub_100006E0C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) ktraceSession];
  BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v3)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Stopping Performance Trace due to timeout",  buf,  2u);
    }

    ktrace_end([*(id *)(a1 + 32) ktraceSession], 0);
  }

  else if (v3)
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Timeout occurred but skipping killing Performance Trace due to no current session",  v4,  2u);
  }

void sub_100006EC4(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000CD04();
  }
}

void sub_100007154(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000CD04();
  }
}

void sub_100007190(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000CD04();
  }
}

void sub_100007CA8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

void sub_100007D14(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000CD04();
  }
}

void sub_100007D50(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000CD04();
  }
}

void sub_100007D8C(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000CD04();
  }
}

void sub_100007DC8(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000CD04();
  }
}

void sub_100007E04(uint64_t a1)
{
  uint64_t v2 = ktrace_reset_existing();
  kperf_reset(v2);
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL);
  if (v3)
  {
    ktrace_session_destroy(v3);
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0LL;
  }

  [*(id *)(a1 + 32) _graphicsSamplingTeardown];
  uint64_t v4 = *(void **)(a1 + 32);
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", *(void *)(a1 + 40)));
  id v45 = 0LL;
  unsigned __int8 v6 = [v4 _postProcessKtraceFile:v5 withError:&v45];
  id v7 = v45;

  if ((v7 || (v6 & 1) == 0) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000CF48(v7);
  }
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeConfig]);
  unsigned int v10 = [v9 compressWhenFinished];

  if (v10)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Compressing Performance Trace",  buf,  2u);
    }

    uint64_t v11 = tailspin_compress_file(*(void *)(a1 + 40), 1LL);
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    uint64_t v13 = v12;
    if (v12)
    {
      id v14 = v12;

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Done compressing Performance Trace",  buf,  2u);
      }
    }

    else
    {
      BOOL v15 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v15) {
        sub_10000CE70(v15, v16, v17, v18, v19, v20, v21, v22);
      }
      id v14 = v8;
    }

    id v8 = v14;
  }

  uint64_t v23 = *(void **)(a1 + 32);
  id v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v8));
  [v23 _markPurgable:v24 withUrgency:1024];

  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v26 = *(void *)(a1 + 48);
  id v44 = 0LL;
  [v25 setAttributes:v26 ofItemAtPath:v8 error:&v44];
  id v27 = v44;

  if (v27 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000CDF4(v27);
  }
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeConfig]);
  unsigned int v29 = [v28 skipNotification];

  if (!v29) {
    goto LABEL_27;
  }
  uint64_t v30 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) connection]);
  if (!v30
    || (uint64_t v31 = (void *)v30,
        uint64_t v32 = *(void **)(a1 + 32),
        v33 = (void *)objc_claimAutoreleasedReturnValue([v32 connection]),
        LODWORD(v32) = [v32 _connectionIsEntitled:v33 toEntitlement:@"com.apple.PerformanceTrace.SkipNotification"],  v33,  v31,  !(_DWORD)v32))
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) connection]);
    int v35 = [v34 processIdentifier];

    proc_name(v35, buf, 0x20u);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10000CD6C();
    }
LABEL_27:
    uint64_t v36 = *(void **)(a1 + 32);
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v8));
    [v36 _sendNotification:v37];

    goto LABEL_28;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Skipping notification as requested.",  buf,  2u);
  }

void sub_100008254(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000CD04();
  }
}

void sub_100008290(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000CD04();
  }
}

void sub_1000082CC(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000CD04();
  }
}

void sub_1000085A0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_1000085C0(uint64_t a1, void *a2)
{
}

void sub_10000947C(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000D3E8();
  }
}

void sub_100009664(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "XPC connection invalidated.",  v3,  2u);
  }

  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeConfig]);

  if (v2)
  {
    [*(id *)(a1 + 32) stopPerformanceTrace];
    [*(id *)(a1 + 32) setActiveConfig:0];
  }

void sub_1000096F4(uint64_t a1)
{
  BOOL v2 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (v2) {
    sub_10000D4D8(v2, v3, v4, v5, v6, v7, v8, v9);
  }
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeConfig]);

  if (v10)
  {
    [*(id *)(a1 + 32) stopPerformanceTrace];
    [*(id *)(a1 + 32) setActiveConfig:0];
  }

int main(int argc, const char **argv, const char **envp)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Starting PerformanceTraceService.",  v6,  2u);
  }

  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___PTService);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener"));
  [v4 setDelegate:v3];
  [v4 resume];

  return 0;
}

void sub_1000098A4( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_1000098B4(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

  ;
}

  ;
}

void sub_1000098E0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_1000098F0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void sub_100009920( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_10000993C( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_10000994C( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_10000995C(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(va, 8) = a1;
}

  ;
}

  ;
}

  ;
}

uint64_t sub_10000998C(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(void *)(a2 + 4) = result;
  return result;
}

uint64_t traceConfigTemplateForString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"PTTraceConfigTraceTemplateDefault"])
  {
    uint64_t v2 = 1LL;
  }

  else if ([v1 isEqualToString:@"PTTraceConfigTraceTemplateFull"])
  {
    uint64_t v2 = 2LL;
  }

  else if ([v1 isEqualToString:@"PTTraceConfigTraceTemplateProfile"])
  {
    uint64_t v2 = 3LL;
  }

  else
  {
    uint64_t v2 = 0LL;
  }

  return v2;
}

uint64_t traceTypeForString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"PTTraceConfigTraceTypeContinuouslyWriteToDisk"])
  {
    uint64_t v2 = 1LL;
  }

  else if ([v1 isEqualToString:@"PTTraceConfigTraceTypeRingBuffer"])
  {
    uint64_t v2 = 2LL;
  }

  else
  {
    uint64_t v2 = 0LL;
  }

  return v2;
}

uint64_t traceGroupForString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"PTTraceConfigTraceGroupFullTracePoints"])
  {
    uint64_t v2 = 1LL;
  }

  else if ([v1 isEqualToString:@"PTTraceConfigTraceGroupProfileTracePoints"])
  {
    uint64_t v2 = 2LL;
  }

  else if ([v1 isEqualToString:@"PTTraceConfigTraceGroupCallstackSamples"])
  {
    uint64_t v2 = 3LL;
  }

  else if ([v1 isEqualToString:@"PTTraceConfigTraceGroupSystemCallSamples"])
  {
    uint64_t v2 = 4LL;
  }

  else if ([v1 isEqualToString:@"PTTraceConfigTraceGroupVMFaultSamples"])
  {
    uint64_t v2 = 5LL;
  }

  else if ([v1 isEqualToString:@"PTTraceConfigTraceGroupGPU"])
  {
    uint64_t v2 = 6LL;
  }

  else if ([v1 isEqualToString:@"PTTraceConfigTraceGroupASP"])
  {
    uint64_t v2 = 7LL;
  }

  else
  {
    uint64_t v2 = 0LL;
  }

  return v2;
}

void sub_10000B3A8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_10000B3C0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000B3D0(uint64_t a1)
{
}

void sub_10000B3D8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5 || !v6)
  {
    BOOL v11 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v11) {
      sub_10000D540(v11, v12, v13, v14, v15, v16, v17, v18);
    }
    uint64_t v19 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) configWithTemplate:1]);
    uint64_t v20 = *(void *)(*(void *)(a1 + 32) + 8LL);
    uint64_t v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v19;
  }

  else
  {
    id v8 = [v6 copy];
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8LL);
    unsigned int v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "setSource:", objc_msgSend(v7, "source"));
  }
}

void sub_10000B5B8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10000B5D0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    BOOL v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v4) {
      sub_10000D574(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Successfully reset config.",  v12,  2u);
    }

    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
  }
}

void sub_10000B78C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10000B7A4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10000D5A8((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
  }
}

void sub_10000B8CC(id a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v1 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "XPC connection invalidated.",  v1,  2u);
  }

void sub_10000B924(id a1)
{
  BOOL v1 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (v1) {
    sub_10000D4D8(v1, v2, v3, v4, v5, v6, v7, v8);
  }
}

void sub_10000B990(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000D618((uint64_t)a2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void sub_10000C838()
{
}

void sub_10000C8A0()
{
}

void sub_10000C908()
{
}

void sub_10000C970()
{
}

void sub_10000C9D8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000CA0C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000CA40( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000CA74()
{
}

void sub_10000CADC()
{
}

void sub_10000CB44()
{
}

void sub_10000CBAC()
{
}

void sub_10000CC20( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000CC54(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 description]);
  sub_1000098C0();
  sub_1000098A4( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v2,  "Performance Trace Start Failed: %{public}@",  v3,  v4,  v5,  v6,  v7);

  sub_1000098CC();
}

void sub_10000CCD0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000CD04()
{
}

void sub_10000CD6C()
{
  uint64_t v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:"));
  sub_100009908();
  sub_100009920( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v1,  "Client %{public}@ [%d] requested to skip notifications but is not entitled to do so.",  v2,  v3,  v4,  v5,  v6);

  sub_1000098CC();
}

void sub_10000CDF4(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  sub_1000098C0();
  sub_1000098A4( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v2,  "Failed to set posix permissions on file: %{public}@",  v3,  v4,  v5,  v6,  v7);

  sub_1000098CC();
}

void sub_10000CE70( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000CEA4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000CED8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000CF48(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 description]);
  sub_1000098C0();
  sub_1000098A4( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v2,  "Performance Trace Failed To Stop/Complete: %{public}@",  v3,  v4,  v5,  v6,  v7);

  sub_1000098CC();
}

void sub_10000CFC4(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 description]);
  sub_1000098C0();
  sub_1000098A4( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v2,  "Performance Trace Stop Failed: %{public}@",  v3,  v4,  v5,  v6,  v7);

  sub_1000098CC();
}

void sub_10000D040( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000D074()
{
  sub_1000098F0( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "warning: notification returned %u\n",  v1,  v2,  v3,  v4,  v5);
  sub_100009900();
}

void sub_10000D0DC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000D110(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 description]);
  sub_1000098C0();
  sub_1000098A4( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v2,  "Performance Trace Stop Failed: %{public}@",  v3,  v4,  v5,  v6,  v7);

  sub_1000098CC();
}

void sub_10000D190()
{
  sub_10000996C();
}

void sub_10000D1D4()
{
}

void sub_10000D240()
{
}

void sub_10000D2AC()
{
}

void sub_10000D318()
{
}

void sub_10000D380()
{
}

void sub_10000D3E8()
{
}

void sub_10000D450()
{
  uint64_t v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:"));
  sub_100009908();
  sub_100009920( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v1,  "Client %{public}@ [%d] is not entitled to use Performance Trace.",  v2,  v3,  v4,  v5,  v6);

  sub_1000098CC();
}

void sub_10000D4D8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000D50C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000D540( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000D574( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000D5A8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000D618( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:options:error:");
}