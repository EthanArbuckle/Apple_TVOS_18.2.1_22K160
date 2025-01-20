void sub_100001A44( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100001A74(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(a1 + 40))(0LL);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

void sub_100001C08( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100001C24(uint64_t a1)
{
  id v2 = [[CtrClientSysdiag alloc] init:"SysdiagnoseCoreThreadClient"];
  v3 = v2;
  if (!v2)
  {
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v5 = "Failed to initialize CoreThread topology object (CtrClientSysdiag)";
      v6 = buf;
      goto LABEL_7;
    }

LABEL_8:
    goto LABEL_9;
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 generateThreadDiagnosticsMonitorLogs];
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL))
  {
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v7 = 0;
      v5 = "CoreThread Topology SPI failed";
      v6 = (uint8_t *)&v7;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
      goto LABEL_8;
    }

    goto LABEL_8;
  }
}

LABEL_9:
}

    v6 = (void *)v12[5];
  }

  __int16 v7 = v6;
  _Block_object_dispose(&v11, 8);

  return v7;
}

    v11 = 0;
    goto LABEL_10;
  }

  __int16 v7 = (void *)objc_claimAutoreleasedReturnValue([(id)v29[5] description]);
  v8 = sub_100003F0C(v6, (uint64_t)@"CloudKit_SelectBehaviorOptions_Global.txt", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue([(id)v23[5] description]);
  v10 = v8 & sub_100003F0C(v6, (uint64_t)@"CloudKit_SelectBehaviorOptions_CurrentUser.txt", v9);

  if ((v10 & 1) == 0)
  {
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      v13 = "Couldn't write CloudKit preferences";
      goto LABEL_8;
    }

    goto LABEL_9;
  }

  v11 = 1;
LABEL_10:

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v11;
}

LABEL_29:
        v5 = 0LL;
LABEL_30:

        _Block_object_dispose(buf, 8);
        goto LABEL_31;
      }

      v11 = dispatch_time(0LL, (uint64_t)(a3 * 1000000000.0));
    }

    if (dispatch_semaphore_wait(v4, v11))
    {
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v30 = 0;
        v13 = "Timed out waiting for AWD server.";
LABEL_25:
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, v30, 2u);
        goto LABEL_29;
      }
    }

    else
    {
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([*((id *)v35 + 5) objectForKey:kAwdDiagnosticsFileArray]);
      v15 = objc_opt_class(&OBJC_CLASS___NSArray, v14);
      if ((objc_opt_isKindOfClass(v12, v15) & 1) != 0)
      {
        v28 = 0u;
        v29 = 0u;
        v26 = 0u;
        v27 = 0u;
        v12 = v12;
        v17 = -[os_log_s countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v26,  v40,  16LL);
        if (v17)
        {
          v18 = *(void *)v27;
          do
          {
            for (i = 0LL; i != v17; i = (char *)i + 1)
            {
              if (*(void *)v27 != v18) {
                objc_enumerationMutation(v12);
              }
              v20 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
              v21 = objc_opt_class(&OBJC_CLASS___NSString, v16);
              if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0)
              {
                v22 = sub_100003FF0(v20);
                v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
                -[NSMutableArray addObject:](v8, "addObject:", v23, (void)v26);
              }
            }

            v17 = -[os_log_s countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v26,  v40,  16LL);
          }

          while (v17);
        }

        v5 = v8;
        goto LABEL_30;
      }

      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v30 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Invalid file list returned from AWD server.",  v30,  2u);
      }
    }

    goto LABEL_29;
  }

  v4 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle", a3));
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v4, OS_LOG_TYPE_DEFAULT, "AWDServer SPI not available", buf, 2u);
  }

  v5 = 0LL;
LABEL_31:

  return v5;
}

void sub_1000020D0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
}

uint64_t sub_10000210C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000211C(uint64_t a1)
{
}

uint64_t sub_100002124(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 copy];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8LL);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000022A4(_Unwind_Exception *a1)
{
}

void sub_1000022C0(uint64_t a1)
{
  uint64_t v2 = CoreCaptureControlCreate(kCFAllocatorDefault);
  if (v2)
  {
    v3 = (const void *)v2;
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = CoreCaptureControlCapture( v2,  "com.apple.driver.AppleMarconiBTDriver.collect",  "BTFWSniffer",  "sysdiagnose-flush");
    if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL))
    {
      id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "CoreCaptureControlcapture failed to trigger",  v6,  2u);
      }
    }

    CFRelease(v3);
  }

  else
  {
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "failed CoreCaptureControlCreate()", buf, 2u);
    }

    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
  }
}

void sub_100002520( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_10000253C(uint64_t a1, uint64_t a2)
{
  uint64_t v23 = 0LL;
  v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  v26 = sub_10000210C;
  v27 = sub_10000211C;
  id v28 = 0LL;
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  v20 = sub_10000210C;
  v21 = sub_10000211C;
  id v22 = 0LL;
  if (!objc_opt_class(&OBJC_CLASS___GESysdiagnoseXPCClient, a2))
  {
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v8 = "GESysdiagnoseXPCClient class not found on this platform";
      v9 = v6;
      uint32_t v10 = 2;
      goto LABEL_7;
    }

LABEL_10:
    goto LABEL_11;
  }

  dispatch_semaphore_t v3 = dispatch_semaphore_create(0LL);
  id v4 = objc_alloc_init(&OBJC_CLASS___GESysdiagnoseXPCClient);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000027D8;
  v13[3] = &unk_1000606E8;
  v15 = &v23;
  v16 = &v17;
  uint64_t v5 = v3;
  v14 = v5;
  [v4 diagnosticsWithCompletionHandler:v13];

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  if (v24[5])
  {
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = v24[5];
      *(_DWORD *)buf = 138412290;
      uint64_t v30 = v7;
      v8 = "GEAvailability task encountered error when calling diagnosticsWithCompletionHandler: %@";
      v9 = v6;
      uint32_t v10 = 12;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
      goto LABEL_10;
    }

    goto LABEL_10;
  }

  if (v18[5])
  {
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    uint64_t v11 = *(void *)(a1 + 40);
    v12 = (void *)objc_claimAutoreleasedReturnValue([(id)v18[5] dataUsingEncoding:4]);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = -[os_log_s createFileAtPath:contents:attributes:]( v6,  "createFileAtPath:contents:attributes:",  v11,  v12,  0LL);

    goto LABEL_10;
  }

  return v6;
}

    if (sub_100021364(7u, &outputStruct, &v13))
    {
      sub_10002D054(a1, outputStruct, v13, a2);
      uint64_t v7 = outputStruct;
      goto LABEL_12;
    }

    uint32_t v10 = __stderrp;
    uint64_t v11 = "Error: IO NVMe Smart cmd failed to extract ASP excport stats!\n";
    v12 = 62LL;
    goto LABEL_16;
  }

  if (!a2) {
    goto LABEL_10;
  }
  v8 = (unsigned int *)sub_10002E788(0LL, 262, &v13, 0, 1);
  outputStruct = v8;
  if (v8)
  {
    uint64_t v7 = v8;
    sub_10002D054(a1, v8, v13, 1);
    goto LABEL_12;
  }

  uint32_t v10 = __stderrp;
  uint64_t v11 = "Error: Cannot Extract Band Stats and Validity\n";
  v12 = 46LL;
LABEL_16:
  fwrite(v11, v12, 1uLL, v10);
  return 0LL;
}

    if (!__filename) {
      return v8;
    }
LABEL_11:
    fclose(__stream);
    return v8;
  }

  id v22 = *(_DWORD *)(a2 + 4);
  uint64_t v23 = __filename;
  fwrite("===Grown Bad Blocks===\n", 0x17uLL, 1uLL, __stream);
  v24 = v8;
  if ((_DWORD)v8)
  {
    v13 = v8;
    do
    {
      v14 = *v9;
      v15 = v9[1];
      uint64_t v17 = *((_DWORD *)v9 + 1);
      v16 = *((_DWORD *)v9 + 2);
      v18 = *((_DWORD *)v9 + 6);
      uint64_t v19 = *((int *)v9 + 7);
      v21 = *((_DWORD *)v9 + 3);
      v20 = *((_DWORD *)v9 + 4);
      if (*((_DWORD *)v9 + 5) == 4095) {
        __sprintf_chk(v29, 0, 0xCuLL, "%s");
      }
      else {
        __sprintf_chk(v29, 0, 0xCuLL, "%u");
      }
      if (v18 << 24 == -2130706432) {
        __sprintf_chk(v28, 0, 0xCuLL, "%s");
      }
      else {
        __sprintf_chk(v28, 0, 0xCuLL, "%d");
      }
      fprintf( __stream,  "Bus: %u CE: %u CAU: %u Block: %u Cycles: %u Reason: %u Page: %s Temp: %s mode: %s\n",  v14,  v15,  v17,  v16,  v21,  v20,  v29,  v28,  v26);
      v9 += 16;
      --v13;
    }

    while (v13);
  }

  v8 = v24;
  fprintf(__stream, "Grown Bad Blocks Count: %u\n", v24);
  fprintf(__stream, "Factory Bad Blocks Count: %u\n", v22);
  if (v23) {
    goto LABEL_11;
  }
  return v8;
}

LABEL_11:
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);
}

void sub_1000027A0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1000027D8(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  v6 = v5;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v9 = *(void *)(v7 + 40);
  v8 = (void **)(v7 + 40);
  if (v9)
  {
    uint64_t v10 = v5;
  }

  else
  {
    v8 = (void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
    uint64_t v10 = v13;
  }

  id v11 = v10;
  uint64_t v12 = *v8;
  const char *v8 = v11;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000028C0(uint64_t a1)
{
  if (&_WriteStackshotReportWithOptions)
  {
    kdebug_trace(27525129LL, 0LL, 0LL, 0LL, 0LL);
    WriteStackshotReportWithOptions( @"stackshot via sysdiagnose",  3131746989LL,  0LL,  *(_DWORD *)(a1 + 40) | 0x80000000);
    kdebug_trace(27525130LL, 0LL, 0LL, 0LL, 0LL);
  }

  else
  {
    uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_semaphore_t v3 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "WriteStackshotReportWithOptions SPI not available",  v3,  2u);
    }
  }

void sub_100002A08(id a1, char *a2)
{
}

void sub_100002CA0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100002CD4(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) getPreferencesForDomain:@"com.apple.keyboard.preferences" withKeys:*(void *)(a1 + 40) currentUser:1]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) getPreferencesForDomain:@".GlobalPreferences" withKeys:*(void *)(a1 + 48) currentUser:1]);
  uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8LL);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void sub_100002EE4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100002F08(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) getPreferencesForDomain:@"com.apple.Accessibility" withKeys:*(void *)(a1 + 40) currentUser:1]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

__CFString *sub_10000356C(int a1)
{
  uint64_t v2 = 0LL;
  switch(a1)
  {
    case -1:
      return @"END_HELPER";
    case 1:
      id v4 = [@"TASK_TYPE_" length];
      uint64_t v5 = @"TASK_TYPE_ACCESSIBILITY_PREFERENCES";
      goto LABEL_64;
    case 2:
      id v4 = [@"TASK_TYPE_" length];
      uint64_t v5 = @"TASK_TYPE_AC_LOGS";
      goto LABEL_64;
    case 3:
      id v4 = [@"TASK_TYPE_" length];
      uint64_t v5 = @"TASK_TYPE_ASPTOOL";
      goto LABEL_64;
    case 4:
      id v4 = [@"TASK_TYPE_" length];
      uint64_t v5 = @"TASK_TYPE_ASPTOOL_MAGAZINE";
      goto LABEL_64;
    case 5:
      id v4 = [@"TASK_TYPE_" length];
      uint64_t v5 = @"TASK_TYPE_ASPTOOL_SNAP";
      goto LABEL_64;
    case 6:
      id v4 = [@"TASK_TYPE_" length];
      uint64_t v5 = @"TASK_TYPE_ASPTOOL_TRACE";
      goto LABEL_64;
    case 7:
      id v4 = [@"TASK_TYPE_" length];
      uint64_t v5 = @"TASK_TYPE_AWD";
      goto LABEL_64;
    case 8:
      id v4 = [@"TASK_TYPE_" length];
      uint64_t v5 = @"TASK_TYPE_BACKGROUND_POWER_LOGS";
      goto LABEL_64;
    case 9:
      id v4 = [@"TASK_TYPE_" length];
      uint64_t v5 = @"TASK_TYPE_BATTERY_HEALTH";
      goto LABEL_64;
    case 10:
      id v4 = [@"TASK_TYPE_" length];
      uint64_t v5 = @"TASK_TYPE_BATTERY_UI";
      goto LABEL_64;
    case 11:
      id v4 = [@"TASK_TYPE_" length];
      uint64_t v5 = @"TASK_TYPE_BTPHY";
      goto LABEL_64;
    case 12:
      id v4 = [@"TASK_TYPE_" length];
      uint64_t v5 = @"TASK_TYPE_CLOUDKIT_PREFERENCES";
      goto LABEL_64;
    case 13:
      id v4 = [@"TASK_TYPE_" length];
      uint64_t v5 = @"TASK_TYPE_CORECAPTURE_BT";
      goto LABEL_64;
    case 14:
      id v4 = [@"TASK_TYPE_" length];
      uint64_t v5 = @"TASK_TYPE_CORECAPTURE_CONFIG";
      goto LABEL_64;
    case 15:
      id v4 = [@"TASK_TYPE_" length];
      uint64_t v5 = @"TASK_TYPE_CORECAPTURE_WIFI";
      goto LABEL_64;
    case 16:
      id v4 = [@"TASK_TYPE_" length];
      uint64_t v5 = @"TASK_TYPE_COREREPAIR_DIAGNOSTIC";
      goto LABEL_64;
    case 17:
      id v4 = [@"TASK_TYPE_" length];
      uint64_t v5 = @"TASK_TYPE_DATACACHE";
      goto LABEL_64;
    case 18:
      id v4 = [@"TASK_TYPE_" length];
      uint64_t v5 = @"TASK_TYPE_DSCSYM";
      goto LABEL_64;
    case 19:
      id v4 = [@"TASK_TYPE_" length];
      uint64_t v5 = @"TASK_TYPE_ENDPOINT_SECURITY";
      goto LABEL_64;
    case 20:
      id v4 = [@"TASK_TYPE_" length];
      uint64_t v5 = @"TASK_TYPE_EXC_RESOURCE";
      goto LABEL_64;
    case 21:
      id v4 = [@"TASK_TYPE_" length];
      uint64_t v5 = @"TASK_TYPE_FDR_DIAGNOSTIC";
      goto LABEL_64;
    case 22:
      id v4 = [@"TASK_TYPE_" length];
      uint64_t v5 = @"TASK_TYPE_FILE_COORDINATION";
      goto LABEL_64;
    case 23:
      id v4 = [@"TASK_TYPE_" length];
      uint64_t v5 = @"TASK_TYPE_GE_AVAILABILITY";
      goto LABEL_64;
    case 24:
      id v4 = [@"TASK_TYPE_" length];
      uint64_t v5 = @"TASK_TYPE_HANDSHAKE";
      goto LABEL_64;
    case 25:
      id v4 = [@"TASK_TYPE_" length];
      uint64_t v5 = @"TASK_TYPE_HID_CRASHLOGS";
      goto LABEL_64;
    case 26:
      id v4 = [@"TASK_TYPE_" length];
      uint64_t v5 = @"TASK_TYPE_KEYBOARD_PREFERENCES";
      goto LABEL_64;
    case 27:
      id v4 = [@"TASK_TYPE_" length];
      uint64_t v5 = @"TASK_TYPE_LIBNOTIFY";
      goto LABEL_64;
    case 28:
      id v4 = [@"TASK_TYPE_" length];
      uint64_t v5 = @"TASK_TYPE_MEMORY_EXCEPTIONS";
      goto LABEL_64;
    case 29:
      id v4 = [@"TASK_TYPE_" length];
      uint64_t v5 = @"TASK_TYPE_MEMORY_EXCEPTIONS_LIST_LOGS";
      goto LABEL_64;
    case 30:
      id v4 = [@"TASK_TYPE_" length];
      uint64_t v5 = @"TASK_TYPE_NETWORK_RELAY";
      goto LABEL_64;
    case 31:
      id v4 = [@"TASK_TYPE_" length];
      uint64_t v5 = @"TASK_TYPE_OS_ELIGIBILITY";
      goto LABEL_64;
    case 32:
      id v4 = [@"TASK_TYPE_" length];
      uint64_t v5 = @"TASK_TYPE_PERSONALIZATION";
      goto LABEL_64;
    case 33:
      id v4 = [@"TASK_TYPE_" length];
      uint64_t v5 = @"TASK_TYPE_POWER_LOGS";
      goto LABEL_64;
    case 34:
      id v4 = [@"TASK_TYPE_" length];
      uint64_t v5 = @"TASK_TYPE_PREFERENCES";
      goto LABEL_64;
    case 35:
      id v4 = [@"TASK_TYPE_" length];
      uint64_t v5 = @"TASK_TYPE_PREFERENCES_INTERNAL";
      goto LABEL_64;
    case 36:
      id v4 = [@"TASK_TYPE_" length];
      uint64_t v5 = @"TASK_TYPE_PROACTIVE_INPUT";
      goto LABEL_64;
    case 37:
      id v4 = [@"TASK_TYPE_" length];
      uint64_t v5 = @"TASK_TYPE_PROMPT";
      goto LABEL_64;
    case 38:
      id v4 = [@"TASK_TYPE_" length];
      uint64_t v5 = @"TASK_TYPE_PROXIMITY";
      goto LABEL_64;
    case 39:
      id v4 = [@"TASK_TYPE_" length];
      uint64_t v5 = @"TASK_TYPE_RUNNING_BOARD";
      goto LABEL_64;
    case 40:
      id v4 = [@"TASK_TYPE_" length];
      uint64_t v5 = @"TASK_TYPE_STACKSHOT_TAKE_AND_RETRIEVE";
      goto LABEL_64;
    case 41:
      id v4 = [@"TASK_TYPE_" length];
      uint64_t v5 = @"TASK_TYPE_STACKSHOT_RETRIEVE_EXISTING";
      goto LABEL_64;
    case 42:
      id v4 = [@"TASK_TYPE_" length];
      uint64_t v5 = @"TASK_TYPE_SYSMON";
      goto LABEL_64;
    case 43:
      id v4 = [@"TASK_TYPE_" length];
      uint64_t v5 = @"TASK_TYPE_SYSTEM_EXP";
      goto LABEL_64;
    case 44:
      id v4 = [@"TASK_TYPE_" length];
      uint64_t v5 = @"TASK_TYPE_SYSTEM_STATS";
      goto LABEL_64;
    case 45:
      id v4 = [@"TASK_TYPE_" length];
      uint64_t v5 = @"TASK_TYPE_TAILSPIN_AUGMENT_LG";
      goto LABEL_64;
    case 46:
      id v4 = [@"TASK_TYPE_" length];
      uint64_t v5 = @"TASK_TYPE_TAILSPIN_INFO";
      goto LABEL_64;
    case 47:
      id v4 = [@"TASK_TYPE_" length];
      uint64_t v5 = @"TASK_TYPE_TAILSPIN_KEYCHORD";
      goto LABEL_64;
    case 48:
      id v4 = [@"TASK_TYPE_" length];
      uint64_t v5 = @"TASK_TYPE_TAILSPIN_LOGARCHIVE_TIMEOUT";
      goto LABEL_64;
    case 49:
      id v4 = [@"TASK_TYPE_" length];
      uint64_t v5 = @"TASK_TYPE_TAILSPIN_OUTPUTDIR_TIMEOUT";
      goto LABEL_64;
    case 50:
      id v4 = [@"TASK_TYPE_" length];
      uint64_t v5 = @"TASK_TYPE_TAILSPIN_SAVE_NO_SYMBOLICATE_TS";
      goto LABEL_64;
    case 51:
      id v4 = [@"TASK_TYPE_" length];
      uint64_t v5 = @"TASK_TYPE_TIMEZONE";
      goto LABEL_64;
    case 52:
      id v4 = [@"TASK_TYPE_" length];
      uint64_t v5 = @"TASK_TYPE_TRIAL";
      goto LABEL_64;
    case 53:
      id v4 = [@"TASK_TYPE_" length];
      uint64_t v5 = @"TASK_TYPE_TRIGGER_CORETHREAD_TOPOLOGY";
      goto LABEL_64;
    case 54:
      id v4 = [@"TASK_TYPE_" length];
      uint64_t v5 = @"TASK_TYPE_UNIFIED_ASSET";
      goto LABEL_64;
    case 55:
      id v4 = [@"TASK_TYPE_" length];
      uint64_t v5 = @"TASK_TYPE_INTELLIGENCE_PLATFORM";
      goto LABEL_64;
    case 56:
      id v4 = [@"TASK_TYPE_" length];
      uint64_t v5 = @"TASK_TYPE_POLARIS";
      goto LABEL_64;
    case 57:
      id v4 = [@"TASK_TYPE_" length];
      uint64_t v5 = @"TASK_TYPE_BASEBAND_TS_TRIGGER";
      goto LABEL_64;
    case 58:
      id v4 = [@"TASK_TYPE_" length];
      uint64_t v5 = @"TASK_TYPE_UID";
      goto LABEL_64;
    case 59:
      id v4 = [@"TASK_TYPE_" length];
      uint64_t v5 = @"TASK_TYPE_SPRING_BOARD_STATE_DUMP";
      goto LABEL_64;
    case 60:
      id v4 = [@"TASK_TYPE_" length];
      uint64_t v5 = @"TASK_TYPE_APPLECV3D";
      goto LABEL_64;
    case 61:
      id v4 = [@"TASK_TYPE_" length];
      uint64_t v5 = @"TASK_TYPE_SIRI_ENROLLMENT";
LABEL_64:
      uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringFromIndex:](v5, "substringFromIndex:", v4));
      break;
    default:
      return (__CFString *)v2;
  }

  return (__CFString *)v2;
}

uint64_t sub_100003C64(char *a1, size_t a2, const char *a3, const char *a4, const char *a5)
{
  time_t v19 = time(0LL);
  if (!localtime_r(&v19, &v18) || !strftime(__str, 0x40uLL, "%Y.%m.%d_%H-%M-%S%z", &v18))
  {
    uint32_t v10 = arc4random();
    snprintf(__str, 0x40uLL, "UNKNOWN-%u", v10);
  }

  id v11 = "";
  uint64_t v12 = "_";
  if (a3) {
    id v13 = a3;
  }
  else {
    id v13 = "";
  }
  if (!a3) {
    uint64_t v12 = "";
  }
  uint64_t v14 = "-";
  if (a4)
  {
    uint64_t v15 = a4;
  }

  else
  {
    uint64_t v14 = "";
    uint64_t v15 = "";
  }

  uint64_t v16 = ".";
  if (a5) {
    id v11 = a5;
  }
  else {
    uint64_t v16 = "";
  }
  return snprintf(a1, a2, "%s%s%s%s%s%s%s", v13, v12, __str, v14, v15, v16, v11);
}

uint64_t sub_100003D94(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  uint64_t v5 = (void *)xpc_connection_copy_entitlement_value(v4, [v3 UTF8String]);

  if (v5 && xpc_get_type(v5) == (xpc_type_t)&_xpc_type_BOOL)
  {
    if (xpc_BOOL_get_value(v5))
    {
      uint64_t v6 = 1LL;
      goto LABEL_10;
    }

    uint64_t v6 = 0LL;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    int v10 = 138412546;
    id v11 = v3;
    __int16 v12 = 1024;
    int v13 = 0;
    uint64_t v7 = "Peer has entitlement '%@' set, but value is %d";
    uint32_t v8 = 18;
    goto LABEL_5;
  }

  uint64_t v6 = 0LL;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v3;
    uint64_t v7 = "Peer does not have entitlement '%@' set, returning default NO for check";
    uint32_t v8 = 12;
LABEL_5:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, v8);
    uint64_t v6 = 0LL;
  }

id sub_100003F0C(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a1 stringByAppendingPathComponent:a2]);
  if (v6)
  {
    id v7 = objc_claimAutoreleasedReturnValue([v5 stringByAppendingString:@"\n"]);
    uint32_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( NSData,  "dataWithBytes:length:",  [v7 UTF8String],  objc_msgSend(v7, "length")));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v10 = [v9 createFileAtPath:v6 contents:v8 attributes:0];
  }

  else
  {
    id v10 = 0LL;
  }

  return v10;
}

id sub_100003FF0(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  @"/var",  @"/tmp",  @"/etc",  0LL));
  id v3 = v1;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = [v2 countByEnumeratingWithState:&v12 objects:v17 count:16];
  id v5 = v3;
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v13;
    id v5 = v3;
    do
    {
      uint32_t v8 = 0LL;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v2);
        }
        if ([v3 hasPrefix:*(void *)(*((void *)&v12 + 1) + 8 * (void)v8)])
        {
          v16[0] = @"/private";
          v16[1] = v3;
          uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 2LL));
          uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v9));

          id v5 = (void *)v10;
        }

        uint32_t v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v2 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }

    while (v6);
  }

  return v5;
}

uint64_t sub_10000418C(int a1)
{
  if (fstat(a1, &v3) != -1)
  {
    if ((v3.st_mode & 0xF000) != 0x8000 || v3.st_nlink < 2u) {
      return 0LL;
    }
    *__error() = 9;
  }

  return 1LL;
}

uint64_t sub_1000041FC(const char *a1, int a2)
{
  if ((a2 & 0x200) != 0) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v2 = open(a1, a2 | 0x20000000);
  uint64_t v3 = v2;
  if ((_DWORD)v2 != -1 && sub_10000418C(v2))
  {
    close(v3);
    return 0xFFFFFFFFLL;
  }

  return v3;
}

void sub_100004410( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_10000442C(uint64_t a1)
{
  uint64_t result = dscsym_copy_dscsym_files( 0, [*(id *)(a1 + 32) fileSystemRepresentation]);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = (_DWORD)result == 0;
  return result;
}

void sub_10000478C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000047D0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000047E0(uint64_t a1)
{
}

void sub_1000047E8(uint64_t a1)
{
  uint64_t v2 = (void *)objc_opt_new(&OBJC_CLASS___GDXPCSysdiagnoseService);
  id v9 = 0LL;
  uint64_t v3 = objc_claimAutoreleasedReturnValue([v2 diagnosticsWithError:&v9]);
  id v4 = v9;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;

  if (v4)
  {
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint32_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedDescription]);
      *(_DWORD *)buf = 138412290;
      id v11 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Intelligence platform SPI returned error: %@",  buf,  0xCu);
    }
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
  }
}

void sub_100004AFC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100004B20(uint64_t a1)
{
  CFTypeRef blob = 0LL;
  int v2 = IOPSCopyPowerSourcesByTypePrecise(1LL, &blob);
  CFTypeRef v3 = blob;
  if (!v2 && blob)
  {
    id v4 = IOPSCopyPowerSourcesList(blob);
    if (v4)
    {
      uint64_t v5 = v4;
      int Count = CFArrayGetCount(v4);
      if (Count)
      {
        uint64_t v7 = -[NSMutableString initWithString:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithString:",  &stru_1000619F0);
        uint32_t v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  @"Battery Service State",  @"Battery Service Flags",  @"Maximum Capacity Percent",  @"calibration0",  0LL));
        -[NSMutableArray addObjectsFromArray:](v8, "addObjectsFromArray:", v9);

        if (Count >= 1)
        {
          for (CFIndex i = 0LL; i != Count; ++i)
          {
            ValueAtIndex = CFArrayGetValueAtIndex(v5, i);
            CFDictionaryRef v12 = IOPSGetPowerSourceDescription(blob, ValueAtIndex);
            uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
            uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectsForKeys:v8 notFoundMarker:&stru_1000619F0]);
            __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:",  v14,  v8));

            uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 description]);
            -[NSMutableString appendFormat:](v7, "appendFormat:", @"Battery %d health info:\n%@\n", i, v16);
          }
        }

        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        uint64_t v18 = *(void *)(a1 + 40);
        time_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableString dataUsingEncoding:](v7, "dataUsingEncoding:", 4LL));
        *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v17 createFileAtPath:v18 contents:v19 attributes:0];

        CFRelease(v5);
        CFRelease(blob);

        return;
      }

      id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v23 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "BatteryHealthTask: no batteries found",  v23,  2u);
      }

      CFRelease(v5);
    }

    else
    {
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "BatteryHealthTask: power sources list NULL",  buf,  2u);
      }
    }

LABEL_19:
    CFRelease(blob);
    return;
  }

  v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    sub_10002EADC(v3 == 0LL, v2, v20);
  }

  if (v3) {
    goto LABEL_19;
  }
}

void sub_100004F64( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100004F80(uint64_t a1, uint64_t a2)
{
  if (objc_opt_class(&OBJC_CLASS___TZUpdate, a2))
  {
    CFTypeRef v3 = (void *)objc_claimAutoreleasedReturnValue(+[TZUpdate sharedInstance](&OBJC_CLASS___TZUpdate, "sharedInstance"));
    uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 currentTZDataVersion]);
  }

  else
  {
    uint64_t v7 = @"TimeZone Class not found on this platform";
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString dataUsingEncoding:](v7, "dataUsingEncoding:", 4LL));
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v4 createFileAtPath:v5 contents:v6 attributes:0];
}

uint64_t sub_10000519C(uint64_t a1)
{
  return RBSCaptureStateToFile([*(id *)(a1 + 32) fileSystemRepresentation]);
}

void sub_1000054B0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1000054E8(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue( +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  *(void *)(a1 + 64),  0LL));
  CFTypeRef v3 = (void *)v2;
  if (v2)
  {
    uint64_t v17 = v2;
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL));
    v15[0] = @"OutputDirectory";
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", *(void *)(a1 + 40)));
    v16[0] = v5;
    v16[1] = &__kCFBooleanFalse;
    v15[1] = @"Compress";
    v15[2] = @"Timeout";
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)(a1 + 72) * 1000.0));
    void v16[2] = v6;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v15,  3LL));

    uint32_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[W5Client sharedClient](&OBJC_CLASS___W5Client, "sharedClient"));
    id v9 = (id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
    id obj = 0LL;
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v8 collectLogs:v4 configuration:v7 update:0 receipts:0 error:&obj]);
    objc_storeStrong(v9, obj);
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8LL);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }

  else
  {
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "CoreCapture SPI returned empty LogItemRequest.",  buf,  2u);
    }
  }
}

void sub_10000584C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100005868(uint64_t a1)
{
  id v11 = 0LL;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[UAFAssetSetManager sysdiagnoseInformationWithError:]( &OBJC_CLASS___UAFAssetSetManager,  "sysdiagnoseInformationWithError:",  &v11));
  id v3 = v11;
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10002EC6C(v4);
    }
LABEL_7:

    goto LABEL_8;
  }

  uint64_t v7 = (id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 40);
  id v10 = 0LL;
  unsigned __int8 v8 = [v2 writeToFile:v6 atomically:0 encoding:4 error:&v10];
  id v9 = v10;
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = v8;
  if (v9)
  {
    id v4 = v9;
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10002EBBC(v7, v4);
    }
    goto LABEL_7;
  }

void sub_100005A80(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v6 = 0LL;
  unsigned __int8 v3 = +[TRIClient sysdiagnoseInfoToDir:error:]( &OBJC_CLASS___TRIClient,  "sysdiagnoseInfoToDir:error:",  v2,  &v6);
  id v4 = v6;
  if ((v3 & 1) == 0)
  {
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) logHandle]);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10002ED40(v4);
    }
  }
}

void sub_100005CF4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_100005D14(uint64_t a1)
{
  uint64_t v2 = (void *)PLSysdiagnoseCopyPowerlog(*(void *)(a1 + 32), (unint64_t)*(double *)(a1 + 56));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"status"]);
  if (!v4)
  {
    unsigned __int8 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) logHandle]);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    LOWORD(v12[0]) = 0;
    id v9 = "Power logs returned no status";
LABEL_10:
    id v10 = v8;
    uint32_t v11 = 2;
    goto LABEL_11;
  }

  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v3);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) == 0)
  {
    unsigned __int8 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) logHandle]);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    LOWORD(v12[0]) = 0;
    id v9 = "Power logs returned status object of wrong class";
    goto LABEL_10;
  }

  unsigned int v6 = [v4 intValue];
  if (!v6)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
    goto LABEL_13;
  }

  unsigned int v7 = v6;
  unsigned __int8 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) logHandle]);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 67109120;
    v12[1] = v7;
    id v9 = "Power logs returned error status: %d";
    id v10 = v8;
    uint32_t v11 = 8;
LABEL_11:
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)v12, v11);
  }

LABEL_12:
LABEL_13:
}

    v27 = v10;
    goto LABEL_18;
  }

  id v10 = v10;
  uint64_t v13 = sub_1000041FC((const char *)[v10 fileSystemRepresentation], 2);
  if ((_DWORD)v13 == -1)
  {
    v26 = *__error();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = [v10 fileSystemRepresentation];
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = strerror(v26);
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Unable to open '%s' for augmenting with error: %s",  buf,  0x16u);
    }

    goto LABEL_12;
  }

  uint64_t v14 = v13;
  uint64_t v15 = dispatch_semaphore_create(0LL);
  *(void *)buf = 0LL;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000LL;
  v45 = 0;
  v43[0] = &__kCFBooleanTrue;
  v42[0] = UnsafePointer;
  v42[1] = UnsafePointer;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v7));
  v43[1] = v16;
  v43[2] = &__kCFBooleanTrue;
  v42[2] = UnsafePointer;
  v42[3] = UnsafePointer;
  v43[3] = &__kCFBooleanTrue;
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v43,  v42,  4LL));

  uint64_t v18 = dispatch_queue_create("com.apple.sysdiagnose.tailspin_augment_queue", 0LL);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_100007E20;
  v34[3] = &unk_1000609E0;
  v34[4] = self;
  v36 = buf;
  time_t v19 = v15;
  v35 = v19;
  tailspin_augment_output(v14, v17, v18, v34);
  v20 = dispatch_time(0LL, (uint64_t)(a6 * 1000000000.0));
  v21 = dispatch_semaphore_wait(v19, v20);
  id v22 = v21;
  if (!*(_BYTE *)(*(void *)&buf[8] + 24LL) || v21)
  {
    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      id v28 = *(unsigned __int8 *)(*(void *)&buf[8] + 24LL);
      *(_DWORD *)v37 = 67109376;
      *(_DWORD *)v38 = v22 != 0;
      *(_WORD *)&v38[4] = 1024;
      *(_DWORD *)&v38[6] = v28;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Tailspin augment task timed out (!%d) or failed (!%d)",  v37,  0xEu);
    }
  }

  else
  {
    id v10 = v10;
    uint64_t v23 = (const char *)[v10 fileSystemRepresentation];
    v24 = v11;
    if (rename(v23, (const char *)[v24 fileSystemRepresentation]) == -1)
    {
      v29 = *__error();
      uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticLogAgent logHandle](self, "logHandle"));
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        id v10 = v10;
        v31 = [v10 fileSystemRepresentation];
        v32 = [v24 fileSystemRepresentation];
        v33 = strerror(v29);
        *(_DWORD *)v37 = 136315650;
        *(void *)v38 = v31;
        *(_WORD *)&v38[8] = 2080;
        v39 = v32;
        v40 = 2080;
        v41 = v33;
        _os_log_error_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "Failed to rename %s -> %s: %s",  v37,  0x20u);
      }
    }

    else
    {
      uint64_t v25 = (os_log_s *)v10;
      id v10 = v24;
    }
  }

  v27 = v10;
  _Block_object_dispose(buf, 8);

LABEL_18:
  return v27;
}

void sub_100005FFC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_10000601C(uint64_t a1)
{
  uint64_t v2 = ExcResourceReportPaths();
  uint64_t v3 = objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_100006160( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10000617C(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue( +[RMECacheEnumerator getLogPathsForSystemDiagnostic]( &OBJC_CLASS___RMECacheEnumerator,  "getLogPathsForSystemDiagnostic"));
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_10000634C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100006370(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[RMECacheEnumerator getLogPathsSortedByTime]( &OBJC_CLASS___RMECacheEnumerator,  "getLogPathsSortedByTime"));
  uint64_t v3 = v2;
  if (v2 && [v2 count])
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 componentsJoinedByString:@"\n"]);
    uint64_t v5 = *(void *)(a1 + 40);
    id v12 = 0LL;
    unsigned __int8 v6 = [v4 writeToFile:v5 atomically:0 encoding:4 error:&v12];
    unsigned int v7 = (os_log_s *)v12;
    unsigned __int8 v8 = v7;
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = v6;
    if (*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL)) {
      BOOL v9 = v7 == 0LL;
    }
    else {
      BOOL v9 = 0;
    }
    if (!v9)
    {
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412546;
        uint64_t v14 = v11;
        __int16 v15 = 2112;
        uint64_t v16 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Encountered error writing RME logs list to %@: %@",  buf,  0x16u);
      }

      *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
    }
  }

  else
  {
    unsigned __int8 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "RMECacheEnumerator getLogPathsSortedByTime returned nil paths or empty array",  buf,  2u);
    }
  }
}

void sub_100006890( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1000068D8(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[W5Client sharedClient](&OBJC_CLASS___W5Client, "sharedClient"));
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = (id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
    id obj = 0LL;
    uint64_t v5 = objc_claimAutoreleasedReturnValue([v2 queryDebugConfigurationForPeer:0 error:&obj]);
    objc_storeStrong(v4, obj);
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8LL);
    unsigned int v7 = *(os_log_s **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }

  else
  {
    unsigned int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "W5Client is nil", buf, 2u);
    }
  }
}

void sub_100006AC0(uint64_t a1)
{
  if ([*(id *)(a1 + 32) fileSystemRepresentation])
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }

  else
  {
    uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) logHandle]);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Target file creation failed.", v3, 2u);
    }
  }

void sub_100006BC0(id a1, char *a2)
{
}

void sub_100006C30(id a1, char *a2)
{
}

void sub_100006F44( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100006F70(uint64_t a1)
{
  CFTypeRef cf = 0LL;
  uint64_t v2 = ZhuGeCopyValue(@"ReportFDRDiagnostic", 0LL, 0LL, &cf);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (cf)
  {
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFTypeRef v10 = cf;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Failed to generate FDRDiagnostic report, error: %@",  buf,  0xCu);
    }

    CFRelease(cf);
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8LL);
    unsigned int v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = 0LL;
  }

void sub_100007354( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100007380(uint64_t a1)
{
  uint64_t v2 = tailspin_config_create_with_current_state();
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = tailspin_config_copy_description(v2, 1LL);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    uint64_t v6 = *(void *)(a1 + 32);
    id v10 = 0LL;
    unsigned int v7 = [v5 writeToURL:v6 atomically:0 encoding:4 error:&v10];
    id v8 = v10;
    if (v7)
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
    }

    else
    {
      BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) logHandle]);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v12 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Unable to create tailspin-info file: %@",  buf,  0xCu);
      }
    }

    tailspin_config_free(v3);
  }

void sub_10000782C(_Unwind_Exception *a1)
{
}

void sub_10000785C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v5[0] = UnsafePointer;
  v5[1] = UnsafePointer;
  v6[0] = v2;
  v6[1] = &__kCFBooleanFalse;
  v5[2] = UnsafePointer;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 52)));
  v6[2] = v3;
  v6[3] = &__kCFBooleanFalse;
  v5[3] = UnsafePointer;
  v5[4] = UnsafePointer;
  v6[4] = &__kCFBooleanFalse;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v6,  v5,  5LL));

  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = tailspin_dump_output_with_options_sync( *(unsigned int *)(a1 + 48),  v4);
}

void sub_100007DE8(_Unwind_Exception *a1)
{
}

uint64_t sub_100007E20(uint64_t a1, int a2)
{
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = a2;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Tailspin augment callback invoked with succeeded: %d",  (uint8_t *)v6,  8u);
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100008250(id a1, char *a2)
{
}

void sub_1000082EC(uint64_t a1)
{
  id v1 = objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) stringByAppendingPathComponent:@"libnotify_status.log"]);
  notify_dump_status([v1 fileSystemRepresentation]);
}

void sub_1000087A8(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
}

id sub_100008A8C(uint64_t a1)
{
  return [*(id *)(a1 + 32) writePreferenceInDomain:@"com.apple.coreaudio" withKey:0 toDirectory:*(void *)(a1 + 40) currentUser:1];
}

void sub_100008D48( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100008D64(uint64_t a1)
{
  int v2 = os_eligibility_dump_sysdiagnose_data_to_dir([*(id *)(a1 + 32) fileSystemRepresentation]);
  if (v2)
  {
    int v3 = v2;
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) logHandle]);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10002F090(v3, v4);
    }
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
  }

id sub_100008EC8(uint64_t a1)
{
  return [*(id *)(a1 + 32) writePreferenceInDomain:@"com.apple.locationd" withKey:0 toDirectory:*(void *)(a1 + 40) currentUser:1];
}

void sub_100009108( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_100009138(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) getPreferencesForDomain:*(void *)(a1 + 40) withKey:*(void *)(a1 + 48) andNestedKeys:*(void *)(a1 + 56) currentUser:0]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) getPreferencesForDomain:*(void *)(a1 + 40) withKey:*(void *)(a1 + 48) andNestedKeys:*(void *)(a1 + 56) currentUser:1]);
  uint64_t v6 = *(void *)(*(void *)(a1 + 72) + 8LL);
  unsigned int v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

LABEL_6:
  return v9;
}

uint64_t sub_10000934C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100009428(uint64_t a1)
{
  if ([*(id *)(a1 + 32) setUserMode])
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    [*(id *)(a1 + 32) setRootMode];
  }

  else
  {
    uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_10002F120();
    }
  }

void sub_1000097CC( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_1000097E8( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_1000097FC( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

  ;
}

uint64_t start()
{
  uid_t v0 = geteuid();
  if (v0) {
    id v1 = "com.apple.sysdiagnose_agent";
  }
  else {
    id v1 = "com.apple.sysdiagnose_helper";
  }
  mach_service = xpc_connection_create_mach_service(v1, 0LL, 1uLL);
  id v3 = sub_1000099C0();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = v0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "(!DDCSI) started with uid: %d",  (uint8_t *)v11,  8u);
  }

  if (mach_service)
  {
    id v10 = objc_autoreleasePoolPush();
    xpc_connection_set_event_handler(mach_service, &stru_100060B08);
    xpc_connection_resume(mach_service);
    dispatch_main();
  }

  id v5 = sub_1000099C0();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Log agent failed to be created",  (uint8_t *)v11,  2u);
  }

  id v7 = sub_1000099C0();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "sysdiagnose_helper should never return",  (uint8_t *)v11,  2u);
  }

  return 0LL;
}

id sub_1000099C0()
{
  if (qword_1000649C8 != -1) {
    dispatch_once(&qword_1000649C8, &stru_100060B28);
  }
  return (id)qword_1000649D0;
}

void sub_100009A00(id a1, OS_xpc_object *a2)
{
  uint64_t v2 = a2;
  xpc_type_t type = xpc_get_type(v2);
  id v4 = sub_1000099C0();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v7[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "sysdiagnose_helper connection callback",  (uint8_t *)v7,  2u);
  }

  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100009B18;
    v7[3] = &unk_100060B50;
    uint64_t v6 = v2;
    id v8 = v6;
    xpc_connection_set_event_handler(v6, v7);
    xpc_connection_resume(v6);
  }
}

void sub_100009AE8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.sysdiagnose", "helper");
  uint64_t v2 = (void *)qword_1000649D0;
  qword_1000649D0 = (uint64_t)v1;
}

void sub_100009B18(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (_xpc_connection_s *)*(id *)(a1 + 32);
  id v5 = v3;
  xpc_type_t type = xpc_get_type(v5);
  xpc_object_t reply = xpc_dictionary_create_reply(v5);
  if ((sub_100003D94(v4, @"com.apple.private.sysdiagnose_helper") & 1) == 0)
  {
    pid_t pid = xpc_connection_get_pid(v4);
    id v16 = sub_1000099C0();
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v29 = 67109120;
      pid_t v30 = pid;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  " pid %d is not entitled to invoke sysdiagnose_helper",  (uint8_t *)&v29,  8u);
    }

    id v18 = sub_1000099C0();
    time_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    if (v5 && type == (xpc_type_t)&_xpc_type_dictionary)
    {
      if (v20)
      {
        int64_t int64 = xpc_dictionary_get_int64(v5, "taskType");
        int v29 = 67109376;
        pid_t v30 = pid;
        __int16 v31 = 2048;
        int64_t v32 = int64;
        id v22 = "pid %d sent a message of type %llu";
        uint64_t v23 = v19;
        uint32_t v24 = 18;
LABEL_21:
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)&v29, v24);
      }
    }

    else if (v20)
    {
      int v29 = 67109120;
      pid_t v30 = pid;
      id v22 = "pid %d sent a message of unknown type";
      uint64_t v23 = v19;
      uint32_t v24 = 8;
      goto LABEL_21;
    }

    xpc_connection_cancel(v4);
    goto LABEL_23;
  }

  if (v5 && type == (xpc_type_t)&_xpc_type_dictionary)
  {
    id v8 = sub_1000099C0();
    BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Agent connection", (uint8_t *)&v29, 2u);
    }

    int64_t v10 = xpc_dictionary_get_int64(v5, "taskType");
    int v11 = v10;
    if ((_DWORD)v10 == 24)
    {
      id v25 = sub_1000099C0();
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v29) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Replying to HANDSHAKE from sysdiagnose_helper",  (uint8_t *)&v29,  2u);
      }

      xpc_dictionary_set_BOOL(reply, "result", 1);
      xpc_connection_send_message(v4, reply);
    }

    else
    {
      if ((_DWORD)v10 == -1)
      {
        id v27 = sub_1000099C0();
        id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v29) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "sysdiagnose_helper exiting.",  (uint8_t *)&v29,  2u);
        }

        exit(0);
      }

      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[SystemDiagnosticLogAgent logAgentWithTaskType:]( &OBJC_CLASS___SystemDiagnosticLogAgent,  "logAgentWithTaskType:",  v10));
      [v12 processMessage:v5 replyWith:reply];
      if (v11 != 37)
      {
        id v13 = sub_1000099C0();
        uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v29) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Sending reply from Log Agent",  (uint8_t *)&v29,  2u);
        }

        xpc_connection_send_message(v4, reply);
      }
    }
  }

LABEL_23:
}

void sub_100009E9C( const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (!qword_1000649D8)
  {
    qword_1000649D8 = (uint64_t)calloc(0x400uLL, 1uLL);
    vsnprintf(__str, 0x400uLL, a1, &a9);
    snprintf((char *)qword_1000649D8, 0x400uLL, "%s", __str);
  }

uint64_t sub_100009F54(uint64_t a1, uint64_t *a2, unsigned int a3)
{
  *(_DWORD *)(a1 + 36) = -1;
  if (a3 < 8) {
    return 0LL;
  }
  unsigned int v6 = a3 >> 3;
  while (2)
  {
    unint64_t v9 = *a2;
    id v8 = a2 + 1;
    int v7 = v9;
    unint64_t v10 = HIDWORD(v9);
    unsigned int v11 = v6 - 1;
    if (v9 <= 0x30000000 && v11 >= v10)
    {
      uint64_t v13 = (v7 - 1);
      if (v13 <= 0x47) {
        __asm { BR              X10 }
      }

      uint64_t v17 = (v7 - 73);
      if (v17 <= 0x46) {
        __asm { BR              X10 }
      }

      switch(v7)
      {
        case 144:
          uint64_t v18 = *v8;
          time_t v19 = "numMemExtreme";
          goto LABEL_13;
        case 145:
          uint64_t v18 = *v8;
          time_t v19 = "maxMemExtremeDuration";
          goto LABEL_13;
        case 146:
          uint64_t v18 = *v8;
          time_t v19 = "memExtremeDuration";
          goto LABEL_13;
        case 147:
          uint64_t v18 = *v8;
          time_t v19 = "bandGetsExtreme";
          goto LABEL_13;
        case 148:
          uint64_t v18 = *v8;
          time_t v19 = "bandGetsLow";
          goto LABEL_13;
        case 149:
          uint64_t v18 = *v8;
          time_t v19 = "numHostChoke";
          goto LABEL_13;
        case 152:
          uint64_t v18 = *v8;
          time_t v19 = "AbortSkip_ProgramError";
          goto LABEL_13;
        case 153:
          uint64_t v18 = *v8;
          time_t v19 = "AbortSkip_ReadErrorOpenBand";
          goto LABEL_13;
        case 154:
          uint64_t v18 = *v8;
          time_t v19 = "AbortSkip_FailedRebuildingParity";
          goto LABEL_13;
        case 155:
          uint64_t v18 = *v8;
          time_t v19 = "AbortPad_OpenRefreshBand";
          goto LABEL_13;
        case 156:
          uint64_t v18 = *v8;
          time_t v19 = "AbortPad_CloseBands";
          goto LABEL_13;
        case 157:
          uint64_t v18 = *v8;
          time_t v19 = "AbortPad_SetPhoto";
          goto LABEL_13;
        case 158:
          uint64_t v18 = *v8;
          time_t v19 = "AbortPad_GcNoSource";
          goto LABEL_13;
        case 159:
          uint64_t v18 = *v8;
          time_t v19 = "AbortPad_Format";
          goto LABEL_13;
        case 160:
          uint64_t v18 = *v8;
          time_t v19 = "nandDiscoveryDuration";
          goto LABEL_13;
        case 161:
          uint64_t v18 = *v8;
          time_t v19 = "coreCCEnableDuration";
          goto LABEL_13;
        case 163:
          uint64_t v18 = *v8;
          time_t v19 = "coreOpenDuration";
          goto LABEL_13;
        case 164:
          uint64_t v18 = *v8;
          time_t v19 = "coreWritableDuration";
          goto LABEL_13;
        case 165:
          uint64_t v18 = *v8;
          time_t v19 = "coreClogLoadDuration";
          goto LABEL_13;
        case 167:
          uint64_t v18 = *v8;
          time_t v19 = "bulkPFail";
          goto LABEL_13;
        case 169:
          uint64_t v18 = *v8;
          time_t v19 = "bulkRFail";
          goto LABEL_13;
        case 172:
          uint64_t v18 = *v8;
          time_t v19 = "raidSmartErrors";
          goto LABEL_13;
        case 182:
          uint64_t v18 = *v8;
          time_t v19 = "internalUeccs";
          goto LABEL_13;
        case 183:
          uint64_t v18 = *v8;
          time_t v19 = "e2eFail";
          goto LABEL_13;
        case 184:
          uint64_t v18 = *v8;
          time_t v19 = "TempSensorMax";
          goto LABEL_13;
        case 185:
          uint64_t v18 = *v8;
          time_t v19 = "TempSensorMin";
          goto LABEL_13;
        case 186:
          uint64_t v18 = *v8;
          time_t v19 = "powerUpFromDDR";
          goto LABEL_13;
        case 187:
          uint64_t v18 = *v8;
          time_t v19 = "numMemLow";
          goto LABEL_13;
        case 188:
          uint64_t v18 = *v8;
          time_t v19 = "maxMemLowDuration";
          goto LABEL_13;
        case 189:
          uint64_t v18 = *v8;
          time_t v19 = "memLowDuration";
          goto LABEL_13;
        case 190:
          uint64_t v18 = *v8;
          time_t v19 = "numFences";
          goto LABEL_13;
        case 191:
          uint64_t v18 = *v8;
          time_t v19 = "hostPassiveIO";
          goto LABEL_13;
        case 192:
          uint64_t v18 = *v8;
          time_t v19 = "odtsMax";
          goto LABEL_13;
        case 193:
          uint64_t v18 = *v8;
          time_t v19 = "defragMFromOrphans";
          goto LABEL_13;
        case 194:
          uint64_t v18 = *v8;
          time_t v19 = "defragMFromFragments";
          goto LABEL_13;
        case 195:
          uint64_t v18 = *v8;
          time_t v19 = "defragMTime";
          goto LABEL_13;
        case 196:
          uint64_t v18 = *v8;
          time_t v19 = "defragMMaxTime";
          goto LABEL_13;
        case 197:
          uint64_t v18 = *v8;
          time_t v19 = "raidFailedLbaMismatch";
          goto LABEL_13;
        case 198:
          uint64_t v18 = *v8;
          time_t v19 = "numSyscfgWrites";
          goto LABEL_13;
        case 199:
          uint64_t v18 = *v8;
          time_t v19 = "indmbUnitsXfer";
          goto LABEL_13;
        case 200:
          uint64_t v18 = *v8;
          time_t v19 = "indmbUnitsCache";
          goto LABEL_13;
        case 201:
          uint64_t v18 = *v8;
          time_t v19 = "indmbUnitsInd";
          goto LABEL_13;
        case 202:
          uint64_t v18 = *v8;
          time_t v19 = "wcacheFS_Mbytes";
          goto LABEL_13;
        case 203:
          uint64_t v18 = *v8;
          time_t v19 = "wcacheDS_Mbytes";
          goto LABEL_13;
        case 204:
          uint64_t v18 = *v8;
          time_t v19 = "powerOnSeconds";
          goto LABEL_13;
        case 205:
          uint64_t v18 = *v8;
          time_t v19 = "numUnknownTokenHostRead";
          goto LABEL_13;
        case 206:
          uint64_t v18 = *v8;
          time_t v19 = "numUnmmapedTokenHostRead";
          goto LABEL_13;
        case 207:
          BOOL v20 = "numOfThrottlingEntriesPerLevel";
          uint64_t v21 = a1;
          int v22 = 207;
LABEL_85:
          uint64_t v14 = v8;
          unsigned int v15 = 16;
          goto LABEL_12;
        case 208:
          uint64_t v18 = *v8;
          time_t v19 = "wcacheFS_MbytesMin";
          goto LABEL_13;
        case 209:
          uint64_t v18 = *v8;
          time_t v19 = "wcacheFS_MbytesMax";
          goto LABEL_13;
        case 210:
          uint64_t v18 = *v8;
          time_t v19 = "prepareForShutdownFailCounter";
          goto LABEL_13;
        case 211:
          uint64_t v18 = *v8;
          time_t v19 = "lpsrEntry";
          goto LABEL_13;
        case 212:
          uint64_t v18 = *v8;
          time_t v19 = "lpsrExit";
          goto LABEL_13;
        case 213:
          BOOL v20 = "crcInternalReadFail";
          uint64_t v21 = a1;
          int v22 = 213;
LABEL_23:
          uint64_t v14 = v8;
          unsigned int v15 = 8;
          goto LABEL_12;
        case 214:
          uint64_t v18 = *v8;
          time_t v19 = "wcacheFSEvictCnt";
          goto LABEL_13;
        case 215:
          uint64_t v18 = *v8;
          time_t v19 = "wcacheFSEvictSize";
          goto LABEL_13;
        case 216:
          uint64_t v18 = *v8;
          time_t v19 = "wcacheFSWr";
          goto LABEL_13;
        case 217:
          uint64_t v18 = *v8;
          time_t v19 = "wcacheDSWr";
          goto LABEL_13;
        case 218:
          BOOL v20 = "wcacheFSEvictSizeLogDist";
          uint64_t v21 = a1;
          int v22 = 218;
LABEL_11:
          uint64_t v14 = v8;
          unsigned int v15 = 10;
          goto LABEL_12;
        case 219:
          uint64_t v18 = *v8;
          time_t v19 = "prepareForShutdownTimeoutCounter";
          goto LABEL_13;
        case 220:
          uint64_t v18 = *v8;
          time_t v19 = "prepareForShutdownCancelCounter";
          goto LABEL_13;
        case 221:
          uint64_t v18 = *v8;
          time_t v19 = "RD_openBandCount";
          goto LABEL_13;
        case 222:
          uint64_t v18 = *v8;
          time_t v19 = "RD_openBandNops";
          goto LABEL_13;
        case 223:
          uint64_t v18 = *v8;
          time_t v19 = "RD_closedBandEvictCount";
LABEL_13:
          id v16 = (void *)a1;
          goto LABEL_14;
        default:
          switch(v7)
          {
            case 224:
              uint64_t v18 = *v8;
              time_t v19 = "RD_closedBandEvictSectors";
              goto LABEL_13;
            case 225:
              uint64_t v18 = *v8;
              time_t v19 = "RD_closedBandFragmentCount";
              goto LABEL_13;
            case 226:
              uint64_t v18 = *v8;
              time_t v19 = "RD_closedBandFragmentSectors";
              goto LABEL_13;
            case 227:
              BOOL v20 = "wcacheFSOverWrLogSizeCnts";
              uint64_t v21 = a1;
              int v22 = 227;
              goto LABEL_11;
            case 228:
              BOOL v20 = "wcacheFSOverWrSizeByFlow";
              uint64_t v21 = a1;
              int v22 = 228;
              goto LABEL_22;
            case 229:
              BOOL v20 = "indmbXferCountTo";
              uint64_t v21 = a1;
              int v22 = 229;
              goto LABEL_20;
            case 230:
              BOOL v20 = "indmbAccumulatedTimeBetweenXfers";
              uint64_t v21 = a1;
              int v22 = 230;
LABEL_20:
              uint64_t v14 = v8;
              unsigned int v15 = 2;
              goto LABEL_12;
            case 231:
              uint64_t v18 = *v8;
              time_t v19 = "maxGracefulBootTimeMs";
              goto LABEL_13;
            case 232:
              uint64_t v18 = *v8;
              time_t v19 = "maxUngracefulBootTimeMs";
              goto LABEL_13;
            case 233:
              uint64_t v18 = *v8;
              time_t v19 = "averageGracefulBootTimeMs";
              goto LABEL_13;
            case 234:
              uint64_t v18 = *v8;
              time_t v19 = "averageUngracefulBootTimeMs";
              goto LABEL_13;
            case 235:
              BOOL v20 = "gracefulBootTimeLogMs";
              uint64_t v21 = a1;
              int v22 = 235;
              goto LABEL_23;
            case 236:
              BOOL v20 = "ungracefulBootTimeLogMs";
              uint64_t v21 = a1;
              int v22 = 236;
              goto LABEL_23;
            case 237:
              BOOL v20 = "CalibrationCount";
              uint64_t v21 = a1;
              int v22 = 237;
              goto LABEL_22;
            case 238:
              uint64_t v18 = *v8;
              time_t v19 = "CalibrationLastTmp";
              goto LABEL_13;
            case 239:
              uint64_t v18 = *v8;
              time_t v19 = "CalibrationMaxTmp";
              goto LABEL_13;
            case 240:
              uint64_t v18 = *v8;
              time_t v19 = "CalibrationMinTmp";
              goto LABEL_13;
            case 241:
              uint64_t v18 = *v8;
              time_t v19 = "ungracefulBootWorstIndicator";
              goto LABEL_13;
            case 242:
              uint64_t v18 = *v8;
              time_t v19 = "metaMismatchReread";
              goto LABEL_13;
            case 243:
              uint64_t v18 = *v8;
              time_t v19 = "numS3SleepOps";
              goto LABEL_13;
            case 244:
              uint64_t v18 = *v8;
              time_t v19 = "odtsCurrent";
              goto LABEL_13;
            case 245:
              uint64_t v18 = *v8;
              time_t v19 = "prefetchReads";
              goto LABEL_13;
            case 246:
              uint64_t v18 = *v8;
              time_t v19 = "prefetchHits";
              goto LABEL_13;
            case 247:
              uint64_t v18 = *v8;
              time_t v19 = "prefetchWritesInvalidation";
              goto LABEL_13;
            case 248:
              uint64_t v18 = *v8;
              time_t v19 = "indmbUnitsTotal";
              goto LABEL_13;
            case 249:
              uint64_t v18 = *v8;
              time_t v19 = "selfThrottlingEngage";
              goto LABEL_13;
            case 250:
              uint64_t v18 = *v8;
              time_t v19 = "selfThrottlingDisengage";
              goto LABEL_13;
            case 252:
              uint64_t v18 = *v8;
              time_t v19 = "AbortSkip_WlpMode";
              goto LABEL_13;
            case 253:
              uint64_t v18 = *v8;
              time_t v19 = "hostWritesWlpMode";
              goto LABEL_13;
            case 254:
              uint64_t v18 = *v8;
              time_t v19 = "numClogDoubleUnc";
              goto LABEL_13;
            case 256:
              uint64_t v18 = *v8;
              time_t v19 = "AbortPad_WlpMode";
              goto LABEL_13;
            case 257:
              uint64_t v18 = *v8;
              time_t v19 = "bonfireIntermediateBandErases";
              goto LABEL_13;
            case 258:
              uint64_t v18 = *v8;
              time_t v19 = "bonfireUserBandErases";
              goto LABEL_13;
            case 259:
              uint64_t v18 = *v8;
              time_t v19 = "bonfireIntermediateBandProgs";
              goto LABEL_13;
            case 260:
              uint64_t v18 = *v8;
              time_t v19 = "bonfireUserBandProgs";
              goto LABEL_13;
            case 261:
              uint64_t v18 = *v8;
              time_t v19 = "bonfireIntermediatePageReads";
              goto LABEL_13;
            case 262:
              uint64_t v18 = *v8;
              time_t v19 = "bonfireUserPageReads";
              goto LABEL_13;
            case 263:
              uint64_t v18 = *v8;
              time_t v19 = "refreshUtil00";
              goto LABEL_13;
            case 264:
              uint64_t v18 = *v8;
              time_t v19 = "failToReadUtil00";
              goto LABEL_13;
            case 265:
              BOOL v20 = "readCountHisto";
              uint64_t v21 = a1;
              int v22 = 265;
LABEL_19:
              uint64_t v14 = v8;
              unsigned int v15 = 5;
              goto LABEL_12;
            case 266:
              BOOL v20 = "readAmpHisto";
              uint64_t v21 = a1;
              int v22 = 266;
              goto LABEL_85;
            case 267:
              uint64_t v18 = *v8;
              time_t v19 = "totalReadAmp";
              goto LABEL_13;
            case 268:
              BOOL v20 = "nvmeModeSelect";
              uint64_t v21 = a1;
              int v22 = 268;
              goto LABEL_22;
            case 269:
              BOOL v20 = "numBootBlockRefreshSuccess";
              uint64_t v21 = a1;
              int v22 = 269;
              goto LABEL_23;
            case 270:
              BOOL v20 = "numBootBlockRefreshFail";
              uint64_t v21 = a1;
              int v22 = 270;
              goto LABEL_23;
            case 271:
              uint64_t v18 = *v8;
              time_t v19 = "numUnsupportedAsi";
              goto LABEL_13;
            case 272:
              uint64_t v18 = *v8;
              time_t v19 = "NumTerminatedProgramSegs";
              goto LABEL_13;
            case 273:
              uint64_t v18 = *v8;
              time_t v19 = "indParityPagesDrops";
              goto LABEL_13;
            case 274:
              uint64_t v18 = *v8;
              time_t v19 = "indFlowPrograms";
              goto LABEL_13;
            case 277:
              BOOL v20 = "powerBudgetSelect";
              uint64_t v21 = a1;
              int v22 = 277;
LABEL_22:
              uint64_t v14 = v8;
              unsigned int v15 = 4;
              goto LABEL_12;
            case 279:
              uint64_t v18 = *v8;
              time_t v19 = "RxBurnNandWrites";
              goto LABEL_13;
            case 280:
              BOOL v20 = "E2EDPErrorCounters";
              uint64_t v21 = a1;
              int v22 = 280;
LABEL_153:
              uint64_t v14 = v8;
              unsigned int v15 = 12;
              goto LABEL_12;
            case 281:
              uint64_t v18 = *v8;
              time_t v19 = "wcacheSectorsMax";
              goto LABEL_13;
            case 282:
              uint64_t v18 = *v8;
              time_t v19 = "wcacheSectorsMin";
              goto LABEL_13;
            case 283:
              uint64_t v18 = *v8;
              time_t v19 = "wcacheSectorsCur";
              goto LABEL_13;
            case 284:
              uint64_t v18 = *v8;
              time_t v19 = "wcacheDS_SectorsMax";
              goto LABEL_13;
            case 285:
              uint64_t v18 = *v8;
              time_t v19 = "wcacheDS_SectorsMin";
              goto LABEL_13;
            case 286:
              uint64_t v18 = *v8;
              time_t v19 = "wcacheDS_SectorsCur";
              goto LABEL_13;
            case 287:
              uint64_t v18 = *v8;
              time_t v19 = "wcacheFS_Reads";
              goto LABEL_13;
            case 288:
              uint64_t v18 = *v8;
              time_t v19 = "wcacheDS_Reads";
              goto LABEL_13;
            case 289:
              BOOL v20 = "mspBootBlockReadFail";
              uint64_t v21 = a1;
              int v22 = 289;
              goto LABEL_155;
            case 290:
              BOOL v20 = "mspBootBlockProgFail";
              uint64_t v21 = a1;
              int v22 = 290;
              goto LABEL_155;
            case 291:
              BOOL v20 = "mspBootBlockEraseFail";
              uint64_t v21 = a1;
              int v22 = 291;
              goto LABEL_155;
            case 292:
              uint64_t v18 = *v8;
              time_t v19 = "bandsRefreshedOnError";
              goto LABEL_13;
            default:
              switch(v7)
              {
                case 298:
                  BOOL v20 = "perHostReads";
                  uint64_t v21 = a1;
                  int v22 = 298;
                  goto LABEL_20;
                case 299:
                  BOOL v20 = "perHostReadXacts";
                  uint64_t v21 = a1;
                  int v22 = 299;
                  goto LABEL_20;
                case 300:
                  BOOL v20 = "perHostWrites";
                  uint64_t v21 = a1;
                  int v22 = 300;
                  goto LABEL_20;
                case 301:
                  BOOL v20 = "perHostWriteXacts";
                  uint64_t v21 = a1;
                  int v22 = 301;
                  goto LABEL_20;
                case 302:
                  BOOL v20 = "perHostNumFlushes";
                  uint64_t v21 = a1;
                  int v22 = 302;
                  goto LABEL_20;
                case 303:
                  BOOL v20 = "perHostNumFences";
                  uint64_t v21 = a1;
                  int v22 = 303;
                  goto LABEL_20;
                case 304:
                  BOOL v20 = "commitPadSectorsPerFlow";
                  uint64_t v21 = a1;
                  int v22 = 304;
                  goto LABEL_11;
                case 305:
                  BOOL v20 = "wcacheDSOverWrLogSizeCnts";
                  uint64_t v21 = a1;
                  int v22 = 305;
                  goto LABEL_11;
                case 306:
                  BOOL v20 = "wcacheDSOverWrSizeByFlow";
                  uint64_t v21 = a1;
                  int v22 = 306;
                  goto LABEL_22;
                case 307:
                  BOOL v20 = "CmdRaisePrioiryEvents";
                  uint64_t v21 = a1;
                  int v22 = 307;
                  goto LABEL_11;
                case 308:
                  uint64_t v18 = *v8;
                  time_t v19 = "utilNumVerification";
                  goto LABEL_13;
                case 309:
                  uint64_t v18 = *v8;
                  time_t v19 = "utilRefreshes";
                  goto LABEL_13;
                case 310:
                  uint64_t v18 = *v8;
                  time_t v19 = "utilBDRErrors";
                  goto LABEL_13;
                case 311:
                  uint64_t v18 = *v8;
                  time_t v19 = "indBandsPerFlow";
                  goto LABEL_13;
                case 312:
                  uint64_t v18 = *v8;
                  time_t v19 = "secsPerIndFlow";
                  goto LABEL_13;
                case 313:
                  uint64_t v18 = *v8;
                  time_t v19 = "indDecodedECC";
                  goto LABEL_13;
                case 314:
                  BOOL v20 = "numBootBlockValidateSuccess";
                  uint64_t v21 = a1;
                  int v22 = 314;
                  goto LABEL_23;
                case 315:
                  BOOL v20 = "numBootBlockValidateFail";
                  uint64_t v21 = a1;
                  int v22 = 315;
                  goto LABEL_23;
                case 316:
                  BOOL v20 = "clogPagesFillingPercentage";
                  uint64_t v21 = a1;
                  int v22 = 316;
                  goto LABEL_22;
                case 317:
                  uint64_t v18 = *v8;
                  time_t v19 = "bdrCalTimeAccFactor";
                  goto LABEL_13;
                case 318:
                  uint64_t v18 = *v8;
                  time_t v19 = "bootChainRdError";
                  goto LABEL_13;
                case 319:
                  uint64_t v18 = *v8;
                  time_t v19 = "bootChainBlankError";
                  goto LABEL_13;
                case 320:
                  uint64_t v18 = *v8;
                  time_t v19 = "bootChainRefreshError";
                  goto LABEL_13;
                case 321:
                  uint64_t v18 = *v8;
                  time_t v19 = "bootChainVersionError";
                  goto LABEL_13;
                case 322:
                  uint64_t v18 = *v8;
                  time_t v19 = "mspBootBlockMismatch";
                  goto LABEL_13;
                case 323:
                  uint64_t v18 = *v8;
                  time_t v19 = "mspBootBlockMismatchErr";
                  goto LABEL_13;
                case 324:
                  BOOL v20 = "bitflipAddr";
                  uint64_t v21 = a1;
                  int v22 = 324;
                  goto LABEL_19;
                case 325:
                  BOOL v20 = "bitflipCount";
                  uint64_t v21 = a1;
                  int v22 = 325;
                  goto LABEL_19;
                case 326:
                  BOOL v20 = "bitflipDupes";
                  uint64_t v21 = a1;
                  int v22 = 326;
                  goto LABEL_19;
                case 327:
                  BOOL v20 = "bandsMaxTempHisto";
                  uint64_t v21 = a1;
                  int v22 = 327;
                  goto LABEL_196;
                case 328:
                  BOOL v20 = "bandsMinTempHisto";
                  uint64_t v21 = a1;
                  int v22 = 328;
                  goto LABEL_196;
                case 329:
                  BOOL v20 = "bandsLifeTimeTempHisto";
                  uint64_t v21 = a1;
                  int v22 = 329;
LABEL_196:
                  uint64_t v14 = v8;
                  unsigned int v15 = 30;
                  goto LABEL_12;
                case 330:
                  BOOL v20 = "bandsDeltaTempHisto";
                  uint64_t v21 = a1;
                  int v22 = 330;
                  uint64_t v14 = v8;
                  unsigned int v15 = 22;
                  goto LABEL_12;
                case 331:
                  BOOL v20 = "bandsCrossTempHisto";
                  uint64_t v21 = a1;
                  int v22 = 331;
                  uint64_t v14 = v8;
                  unsigned int v15 = 45;
                  goto LABEL_12;
                case 332:
                  BOOL v20 = "wcacheWaitLogMs";
                  uint64_t v21 = a1;
                  int v22 = 332;
                  goto LABEL_11;
                case 333:
                  BOOL v20 = "wcacheDS_segsSortedLogSize";
                  uint64_t v21 = a1;
                  int v22 = 333;
                  goto LABEL_11;
                case 334:
                  uint64_t v18 = *v8;
                  time_t v19 = "numFirmwareWrites";
                  goto LABEL_13;
                case 335:
                  uint64_t v18 = *v8;
                  time_t v19 = "numBisWrites";
                  goto LABEL_13;
                case 336:
                  uint64_t v18 = *v8;
                  time_t v19 = "numBootChainUpdates";
                  goto LABEL_13;
                case 337:
                  uint64_t v18 = *v8;
                  time_t v19 = "cntCalTimeWentBackWard";
                  goto LABEL_13;
                case 338:
                  uint64_t v18 = *v8;
                  time_t v19 = "indBoRecoveries";
                  goto LABEL_13;
                case 340:
                  uint64_t v18 = *v8;
                  time_t v19 = "numCrossTempUecc";
                  goto LABEL_13;
                case 341:
                  uint64_t v18 = *v8;
                  time_t v19 = "latencyMonitorError";
                  goto LABEL_13;
                case 343:
                  uint64_t v18 = *v8;
                  time_t v19 = "utilUeccReads";
                  goto LABEL_13;
                case 344:
                  uint64_t v18 = *v8;
                  time_t v19 = "numOfAvoidedGCDueToTemp";
                  goto LABEL_13;
                case 345:
                  uint64_t v18 = *v8;
                  time_t v19 = "forceShutdowns";
                  goto LABEL_13;
                case 346:
                  uint64_t v18 = *v8;
                  time_t v19 = "gcSlcDestinations";
                  goto LABEL_13;
                case 347:
                  uint64_t v18 = *v8;
                  time_t v19 = "indReplayExtUsed";
                  goto LABEL_13;
                case 348:
                  uint64_t v18 = *v8;
                  time_t v19 = "defectsPerPackageOverflow";
                  goto LABEL_13;
                case 349:
                  uint64_t v18 = *v8;
                  time_t v19 = "RxBurnIntBandsProgrammed";
                  goto LABEL_13;
                case 350:
                  uint64_t v18 = *v8;
                  time_t v19 = "RxBurnUsrBandsProgrammed";
                  goto LABEL_13;
                case 351:
                  uint64_t v18 = *v8;
                  time_t v19 = "RxBurnIntNandWrites";
                  goto LABEL_13;
                case 352:
                  uint64_t v18 = *v8;
                  time_t v19 = "RxBurnUsrNandWrites";
                  goto LABEL_13;
                case 353:
                  uint64_t v18 = *v8;
                  time_t v19 = "clogLastStripeUeccs";
                  goto LABEL_13;
                case 354:
                  uint64_t v18 = *v8;
                  time_t v19 = "GC_MidDestSrcSwitchSLC2TLC";
                  goto LABEL_13;
                case 355:
                  uint64_t v18 = *v8;
                  time_t v19 = "GC_MidDestSrcSwitchTLC2SLC";
                  goto LABEL_13;
                case 356:
                  uint64_t v18 = *v8;
                  time_t v19 = "nvme_stats_shutdown_count_host0_normal";
                  goto LABEL_13;
                case 357:
                  uint64_t v18 = *v8;
                  time_t v19 = "nvme_stats_shutdown_count_host1_normal";
                  goto LABEL_13;
                case 358:
                  uint64_t v18 = *v8;
                  time_t v19 = "nvme_stats_shutdown_count_host0_s2r";
                  goto LABEL_13;
                case 359:
                  uint64_t v18 = *v8;
                  time_t v19 = "nvme_stats_shutdown_count_host1_s2r";
                  goto LABEL_13;
                case 360:
                  BOOL v20 = "gcPDusterIntrSrcValidityHisto";
                  uint64_t v21 = a1;
                  int v22 = 360;
                  goto LABEL_85;
                case 361:
                  BOOL v20 = "gcPDusterUserSrcValidityHisto";
                  uint64_t v21 = a1;
                  int v22 = 361;
                  goto LABEL_85;
                case 362:
                  uint64_t v18 = *v8;
                  time_t v19 = "raidFailedReadParity";
                  goto LABEL_13;
                case 364:
                  uint64_t v18 = *v8;
                  time_t v19 = "lhotNumSkipes";
                  goto LABEL_13;
                default:
                  switch(v7)
                  {
                    case 365:
                      uint64_t v18 = *v8;
                      time_t v19 = "lhotNumIsHotCalls";
                      goto LABEL_13;
                    case 366:
                      uint64_t v18 = *v8;
                      time_t v19 = "lhotFullLap";
                      goto LABEL_13;
                    case 367:
                      uint64_t v18 = *v8;
                      time_t v19 = "lhotSkipPrecent";
                      goto LABEL_13;
                    case 368:
                      uint64_t v18 = *v8;
                      time_t v19 = "eraseSuspendEvents";
                      goto LABEL_13;
                    case 369:
                      uint64_t v18 = *v8;
                      time_t v19 = "eraseSuspendedStatuses";
                      goto LABEL_13;
                    case 370:
                      uint64_t v18 = *v8;
                      time_t v19 = "eraseSuspendedBands";
                      goto LABEL_13;
                    case 371:
                      uint64_t v18 = *v8;
                      time_t v19 = "eraseSuspendSituationsBelowThreshold";
                      goto LABEL_13;
                    case 372:
                      uint64_t v18 = *v8;
                      time_t v19 = "eraseSuspendSituationsAboveThreshold";
                      goto LABEL_13;
                    case 373:
                      uint64_t v18 = *v8;
                      time_t v19 = "eraseSuspendReadChainsProcessed";
                      goto LABEL_13;
                    case 374:
                      uint64_t v18 = *v8;
                      time_t v19 = "bdrLastDoneHr";
                      goto LABEL_13;
                    case 375:
                      uint64_t v18 = *v8;
                      time_t v19 = "bdrBackupThreshHrs";
                      goto LABEL_13;
                    case 376:
                      uint64_t v18 = *v8;
                      time_t v19 = "clogPortableProgBufs";
                      goto LABEL_13;
                    case 377:
                      uint64_t v18 = *v8;
                      time_t v19 = "clogPortableDropBufs";
                      goto LABEL_13;
                    case 378:
                      uint64_t v18 = *v8;
                      time_t v19 = "clogPortablePadSectors";
                      goto LABEL_13;
                    case 379:
                      uint64_t v18 = *v8;
                      time_t v19 = "numRetiredBlocks";
                      goto LABEL_13;
                    case 381:
                      uint64_t v18 = *v8;
                      time_t v19 = "numRefreshOnErrNandRefreshPerf";
                      goto LABEL_13;
                    case 382:
                      uint64_t v18 = *v8;
                      time_t v19 = "raidReconstructReads";
                      goto LABEL_13;
                    case 383:
                      uint64_t v18 = *v8;
                      time_t v19 = "gcReadsNoBlog";
                      goto LABEL_13;
                    case 384:
                      uint64_t v18 = *v8;
                      time_t v19 = "AbortSkip_MPBXReadVerifyClosedBand";
                      goto LABEL_13;
                    case 385:
                      uint64_t v18 = *v8;
                      time_t v19 = "openBandReadFail";
                      goto LABEL_13;
                    case 386:
                      uint64_t v18 = *v8;
                      time_t v19 = "AbortSkip_MPBXReadVerifyOpenBand";
                      goto LABEL_13;
                    case 387:
                      uint64_t v18 = *v8;
                      time_t v19 = "AbortSkip_MBPXFailedRebuildingParity";
                      goto LABEL_13;
                    case 388:
                      uint64_t v18 = *v8;
                      time_t v19 = "raidSuccessfulPMXReconstructionInternal";
                      goto LABEL_13;
                    case 389:
                      uint64_t v18 = *v8;
                      time_t v19 = "raidSuccessfulPMXReconstructionHost";
                      goto LABEL_13;
                    case 390:
                      uint64_t v18 = *v8;
                      time_t v19 = "raidFailedPMXReconstructionInternal";
                      goto LABEL_13;
                    case 391:
                      uint64_t v18 = *v8;
                      time_t v19 = "raidFailedPMXReconstructionHost";
                      goto LABEL_13;
                    case 392:
                      uint64_t v18 = *v8;
                      time_t v19 = "raidSuccessfulRMXReconstructionInternal";
                      goto LABEL_13;
                    case 393:
                      uint64_t v18 = *v8;
                      time_t v19 = "raidSuccessfulRMXReconstructionHost";
                      goto LABEL_13;
                    case 394:
                      uint64_t v18 = *v8;
                      time_t v19 = "raidFailedRMXReconstructionInternal";
                      goto LABEL_13;
                    case 395:
                      uint64_t v18 = *v8;
                      time_t v19 = "raidFailedRMXReconstructionHost";
                      goto LABEL_13;
                    case 396:
                      uint64_t v18 = *v8;
                      time_t v19 = "raidFailedReadParityInternal";
                      goto LABEL_13;
                    case 397:
                      uint64_t v18 = *v8;
                      time_t v19 = "raidFailedReadQParityInternal";
                      goto LABEL_13;
                    case 398:
                      uint64_t v18 = *v8;
                      time_t v19 = "raidFailedReadQParity";
                      goto LABEL_13;
                    case 399:
                      uint64_t v18 = *v8;
                      time_t v19 = "raidFailedReadQCopy";
                      goto LABEL_13;
                    case 400:
                      uint64_t v18 = *v8;
                      time_t v19 = "raidFailedReconstructionQParity";
                      goto LABEL_13;
                    case 401:
                      uint64_t v18 = *v8;
                      time_t v19 = "offlineBlocksCnt";
                      goto LABEL_13;
                    case 402:
                      uint64_t v18 = *v8;
                      time_t v19 = "bork0Revectors";
                      goto LABEL_13;
                    case 403:
                      uint64_t v18 = *v8;
                      time_t v19 = "raidFailedReadBlog";
                      goto LABEL_13;
                    case 404:
                      uint64_t v18 = *v8;
                      time_t v19 = "numReliabilityRefreshes";
                      goto LABEL_13;
                    case 405:
                      uint64_t v18 = *v8;
                      time_t v19 = "raidFailedReadQCopyInternal";
                      goto LABEL_13;
                    case 406:
                      BOOL v20 = "raidReconstructSuccessFlow";
                      uint64_t v21 = a1;
                      int v22 = 406;
                      goto LABEL_19;
                    case 407:
                      BOOL v20 = "raidReconstructFailFlow";
                      uint64_t v21 = a1;
                      int v22 = 407;
                      goto LABEL_19;
                    case 408:
                      uint64_t v18 = *v8;
                      time_t v19 = "raidReconstructFailP";
                      goto LABEL_13;
                    case 409:
                      uint64_t v18 = *v8;
                      time_t v19 = "raidReconstructFailQ";
                      goto LABEL_13;
                    case 410:
                      uint64_t v18 = *v8;
                      time_t v19 = "raidReconstructFailUECC";
                      goto LABEL_13;
                    case 411:
                      uint64_t v18 = *v8;
                      time_t v19 = "raidReconstructFailUnsupp";
                      goto LABEL_13;
                    case 412:
                      uint64_t v18 = *v8;
                      time_t v19 = "raidUECCOpenBand";
                      goto LABEL_13;
                    case 414:
                      uint64_t v18 = *v8;
                      time_t v19 = "ueccReads";
                      goto LABEL_13;
                    case 416:
                      uint64_t v18 = *v8;
                      time_t v19 = "raidSuccessfulVerify";
                      goto LABEL_13;
                    case 417:
                      uint64_t v18 = *v8;
                      time_t v19 = "raidFailedVerify";
                      goto LABEL_13;
                    case 418:
                      uint64_t v18 = *v8;
                      time_t v19 = "numBandsVerified";
                      goto LABEL_13;
                    case 419:
                      uint64_t v18 = *v8;
                      time_t v19 = "cache_heads";
                      goto LABEL_13;
                    case 420:
                      uint64_t v18 = *v8;
                      time_t v19 = "AbortSkip_RMXtoMPBX";
                      goto LABEL_13;
                    case 421:
                      uint64_t v18 = *v8;
                      time_t v19 = "s3eFwVer";
                      goto LABEL_13;
                    case 422:
                      uint64_t v18 = *v8;
                      time_t v19 = "readVerifyNative";
                      goto LABEL_13;
                    case 423:
                      uint64_t v18 = *v8;
                      time_t v19 = "reducedReadVerifyNative";
                      goto LABEL_13;
                    case 424:
                      uint64_t v18 = *v8;
                      time_t v19 = "readVerifySlc";
                      goto LABEL_13;
                    case 425:
                      uint64_t v18 = *v8;
                      time_t v19 = "reducedReadVerifySlc";
                      goto LABEL_13;
                    case 426:
                      uint64_t v18 = *v8;
                      time_t v19 = "RxBurnEvictions";
                      goto LABEL_13;
                    case 427:
                      uint64_t v18 = *v8;
                      time_t v19 = "directToTLCBands";
                      goto LABEL_13;
                    case 428:
                      uint64_t v18 = *v8;
                      time_t v19 = "nandDesc";
                      goto LABEL_13;
                    case 429:
                      uint64_t v18 = *v8;
                      time_t v19 = "fwUpdatesPercentUsed";
                      goto LABEL_13;
                    case 430:
                      uint64_t v18 = *v8;
                      time_t v19 = "slcPercentUsed";
                      goto LABEL_13;
                    case 431:
                      uint64_t v18 = *v8;
                      time_t v19 = "percentUsed";
                      goto LABEL_13;
                    default:
                      switch(v7)
                      {
                        case 432:
                          uint64_t v18 = *v8;
                          time_t v19 = "hostAutoWrites";
                          goto LABEL_13;
                        case 433:
                          uint64_t v18 = *v8;
                          time_t v19 = "hostAutoWriteXacts";
                          goto LABEL_13;
                        case 434:
                          uint64_t v18 = *v8;
                          time_t v19 = "gcDestDynamic";
                          goto LABEL_13;
                        case 435:
                          uint64_t v18 = *v8;
                          time_t v19 = "gcDestStatic";
                          goto LABEL_13;
                        case 436:
                          uint64_t v18 = *v8;
                          time_t v19 = "gcDestWearlevel";
                          goto LABEL_13;
                        case 437:
                          uint64_t v18 = *v8;
                          time_t v19 = "gcDestParity";
                          goto LABEL_13;
                        case 438:
                          uint64_t v18 = *v8;
                          time_t v19 = "AbortSkip_Format";
                          goto LABEL_13;
                        case 440:
                          uint64_t v18 = *v8;
                          time_t v19 = "raidSLCPadding";
                          goto LABEL_13;
                        case 441:
                          uint64_t v18 = *v8;
                          time_t v19 = "raidGCBands";
                          goto LABEL_13;
                        case 442:
                          uint64_t v18 = *v8;
                          time_t v19 = "raidGCSectors";
                          goto LABEL_13;
                        case 443:
                          uint64_t v18 = *v8;
                          time_t v19 = "raidGCPadding";
                          goto LABEL_13;
                        case 444:
                          uint64_t v18 = *v8;
                          time_t v19 = "raidSLCBandsPerHostFlow";
                          goto LABEL_13;
                        case 445:
                          uint64_t v18 = *v8;
                          time_t v19 = "raidSLCSecsPerHostFlow";
                          goto LABEL_13;
                        case 446:
                          uint64_t v18 = *v8;
                          time_t v19 = "rxBurnMinCycleRuns";
                          goto LABEL_13;
                        case 447:
                          uint64_t v18 = *v8;
                          time_t v19 = "clogNumFastCxt";
                          goto LABEL_13;
                        case 448:
                          uint64_t v18 = *v8;
                          time_t v19 = "clogNumRapidReboots";
                          goto LABEL_13;
                        case 449:
                          uint64_t v18 = *v8;
                          time_t v19 = "clogFastCxtAbvThr";
                          goto LABEL_13;
                        case 450:
                          uint64_t v18 = *v8;
                          time_t v19 = "rxBurnDiffModeRuns";
                          goto LABEL_13;
                        case 452:
                          uint64_t v18 = *v8;
                          time_t v19 = "indReadVerifyFail";
                          goto LABEL_13;
                        case 453:
                          BOOL v20 = "numOfThrottlingEntriesPerReadLevel";
                          uint64_t v21 = a1;
                          int v22 = 453;
                          goto LABEL_85;
                        case 454:
                          BOOL v20 = "numOfThrottlingEntriesPerWriteLevel";
                          uint64_t v21 = a1;
                          int v22 = 454;
                          goto LABEL_85;
                        case 456:
                          BOOL v20 = "slcFifoDepth";
                          uint64_t v21 = a1;
                          int v22 = 456;
                          goto LABEL_11;
                        case 457:
                          uint64_t v18 = *v8;
                          time_t v19 = "wcacheSectorsDirtyIdle";
                          goto LABEL_13;
                        case 458:
                          uint64_t v18 = *v8;
                          time_t v19 = "wcacheDS_SectorsDirtyIdle";
                          goto LABEL_13;
                        case 459:
                          uint64_t v18 = *v8;
                          time_t v19 = "wcacheFS_MbytesDirtyIdle";
                          goto LABEL_13;
                        case 460:
                          BOOL v20 = "CacheDepthVsThroughput";
                          uint64_t v21 = a1;
                          int v22 = 460;
                          uint64_t v14 = v8;
                          unsigned int v15 = 256;
                          goto LABEL_12;
                        case 461:
                          uint64_t v18 = *v8;
                          time_t v19 = "directToTLCSectors";
                          goto LABEL_13;
                        case 462:
                          uint64_t v18 = *v8;
                          time_t v19 = "fallbackToWaterfall";
                          goto LABEL_13;
                        case 463:
                          BOOL v20 = "balanceProportionBucketsHistogram";
                          uint64_t v21 = a1;
                          int v22 = 463;
LABEL_320:
                          uint64_t v14 = v8;
                          unsigned int v15 = 11;
                          goto LABEL_12;
                        case 464:
                          uint64_t v18 = *v8;
                          time_t v19 = "lockToTlc";
                          goto LABEL_13;
                        case 465:
                          BOOL v20 = "burstSizeHistogram";
                          uint64_t v21 = a1;
                          int v22 = 465;
                          goto LABEL_11;
                        case 466:
                          BOOL v20 = "qosDirectToTLC";
                          uint64_t v21 = a1;
                          int v22 = 466;
                          goto LABEL_342;
                        case 467:
                          BOOL v20 = "maxQosDirectToTLC";
                          uint64_t v21 = a1;
                          int v22 = 467;
                          goto LABEL_22;
                        case 468:
                          BOOL v20 = "wcacheDirtyAtFlush";
                          uint64_t v21 = a1;
                          int v22 = 468;
                          goto LABEL_85;
                        case 469:
                          BOOL v20 = "raidReconstructSuccessPartition";
                          uint64_t v21 = a1;
                          int v22 = 469;
                          goto LABEL_20;
                        case 470:
                          BOOL v20 = "raidReconstructFailPartition";
                          uint64_t v21 = a1;
                          int v22 = 470;
                          goto LABEL_20;
                        case 471:
                          uint64_t v18 = *v8;
                          time_t v19 = "raidUncleanBootBandFail";
                          goto LABEL_13;
                        case 472:
                          uint64_t v18 = *v8;
                          time_t v19 = "raidReconstructFailBandFlowHost";
                          goto LABEL_13;
                        case 473:
                          uint64_t v18 = *v8;
                          time_t v19 = "raidReconstructFailBandFlowGC";
                          goto LABEL_13;
                        case 476:
                          BOOL v20 = "raidSuccessfulRecoLbaRange";
                          uint64_t v21 = a1;
                          int v22 = 476;
                          goto LABEL_20;
                        case 477:
                          BOOL v20 = "raidFailedRecoLbaRange";
                          uint64_t v21 = a1;
                          int v22 = 477;
                          goto LABEL_20;
                        case 481:
                          BOOL v20 = "skinnyBandErases_481";
                          uint64_t v21 = a1;
                          int v22 = 481;
                          goto LABEL_155;
                        case 483:
                          uint64_t v18 = *v8;
                          time_t v19 = "tlcOverHeatWaterfall";
                          goto LABEL_13;
                        case 484:
                          uint64_t v18 = *v8;
                          time_t v19 = "skinnyCyclesConvert";
                          goto LABEL_13;
                        case 485:
                          uint64_t v18 = *v8;
                          time_t v19 = "non_proportional_directToTLCSectors";
                          goto LABEL_13;
                        case 486:
                          uint64_t v18 = *v8;
                          time_t v19 = "maxFailedFastCxtSync";
                          goto LABEL_13;
                        case 487:
                          uint64_t v18 = *v8;
                          time_t v19 = "numFormatUserArea";
                          goto LABEL_13;
                        case 488:
                          uint64_t v18 = *v8;
                          time_t v19 = "clogFastCxtSyncAborted";
                          goto LABEL_13;
                        case 489:
                          BOOL v20 = "clogOccupationSectors";
                          uint64_t v21 = a1;
                          int v22 = 489;
                          goto LABEL_19;
                        case 490:
                          BOOL v20 = "bdrTmpHist";
                          uint64_t v21 = a1;
                          int v22 = 490;
LABEL_342:
                          uint64_t v14 = v8;
                          unsigned int v15 = 64;
                          goto LABEL_12;
                        case 491:
                          uint64_t v18 = *v8;
                          time_t v19 = "numFWUpdates";
                          goto LABEL_13;
                        case 492:
                          uint64_t v18 = *v8;
                          time_t v19 = "numClogLoadFails";
                          goto LABEL_13;
                        case 493:
                          uint64_t v18 = *v8;
                          time_t v19 = "rxBurnNumForcedDiffMode";
                          goto LABEL_13;
                        case 494:
                          uint64_t v18 = *v8;
                          time_t v19 = "RD_numSaves";
                          goto LABEL_13;
                        case 495:
                          uint64_t v18 = *v8;
                          time_t v19 = "eanCompressWrites";
                          goto LABEL_13;
                        case 496:
                          uint64_t v18 = *v8;
                          time_t v19 = "eanHostWrites";
                          goto LABEL_13;
                        case 497:
                          uint64_t v18 = *v8;
                          time_t v19 = "bandPreErases";
                          goto LABEL_13;
                        case 498:
                          uint64_t v18 = *v8;
                          time_t v19 = "eanHostUnmaps";
                          goto LABEL_13;
                        case 499:
                          uint64_t v18 = *v8;
                          time_t v19 = "eanHostFlushes";
                          goto LABEL_13;
                        case 500:
                          uint64_t v18 = *v8;
                          time_t v19 = "eanFastWrites";
                          goto LABEL_13;
                        case 501:
                          uint64_t v18 = *v8;
                          time_t v19 = "autowriteDS2FSCollisions";
                          goto LABEL_13;
                        case 502:
                          uint64_t v18 = *v8;
                          time_t v19 = "autowriteWaitTransferTaskBlocks";
                          goto LABEL_13;
                        case 503:
                          BOOL v20 = "avgCycle";
                          uint64_t v21 = a1;
                          int v22 = 503;
                          goto LABEL_20;
                        case 504:
                          uint64_t v18 = *v8;
                          time_t v19 = "RD_DeferredClearsOverflowCnt";
                          goto LABEL_13;
                        default:
                          switch(v7)
                          {
                            case 505:
                              uint64_t v18 = *v8;
                              time_t v19 = "maxVerticsInBand";
                              goto LABEL_13;
                            case 506:
                              uint64_t v18 = *v8;
                              time_t v19 = "numVertics";
                              goto LABEL_13;
                            case 507:
                              uint64_t v18 = *v8;
                              time_t v19 = "exceededCVertics";
                              goto LABEL_13;
                            case 510:
                              uint64_t v18 = *v8;
                              time_t v19 = "raidReconstructFailMismatch";
                              goto LABEL_13;
                            case 511:
                              BOOL v20 = "mspbootBlockRefreshCnt";
                              uint64_t v21 = a1;
                              int v22 = 511;
                              goto LABEL_155;
                            case 516:
                              BOOL v20 = "mspBootBlockRefreshTime";
                              uint64_t v21 = a1;
                              int v22 = 516;
                              goto LABEL_155;
                            case 517:
                              uint64_t v18 = *v8;
                              time_t v19 = "mspBootBlockCountPerMsp";
                              goto LABEL_13;
                            case 518:
                              uint64_t v18 = *v8;
                              time_t v19 = "skinnyRevectorSLC";
                              goto LABEL_13;
                            case 519:
                              uint64_t v18 = *v8;
                              time_t v19 = "skinnyRevectorTLC";
                              goto LABEL_13;
                            case 520:
                              uint64_t v18 = *v8;
                              time_t v19 = "perfSetupAttempts";
                              goto LABEL_13;
                            case 521:
                              uint64_t v18 = *v8;
                              time_t v19 = "perfSetupSuccesses";
                              goto LABEL_13;
                            case 522:
                              uint64_t v18 = *v8;
                              time_t v19 = "perfWriteAttempts";
                              goto LABEL_13;
                            case 523:
                              uint64_t v18 = *v8;
                              time_t v19 = "perfWriteSuccesses";
                              goto LABEL_13;
                            case 524:
                              uint64_t v18 = *v8;
                              time_t v19 = "perfReadAttempts";
                              goto LABEL_13;
                            case 525:
                              uint64_t v18 = *v8;
                              time_t v19 = "perfReadSuccesses";
                              goto LABEL_13;
                            case 526:
                              uint64_t v18 = *v8;
                              time_t v19 = "perfCleanupAttempts";
                              goto LABEL_13;
                            case 527:
                              uint64_t v18 = *v8;
                              time_t v19 = "perfCleanupSuccesses";
                              goto LABEL_13;
                            case 530:
                              uint64_t v18 = *v8;
                              time_t v19 = "firstFailedDieId";
                              goto LABEL_13;
                            case 531:
                              uint64_t v18 = *v8;
                              time_t v19 = "numDieFailures";
                              goto LABEL_13;
                            case 532:
                              uint64_t v18 = *v8;
                              time_t v19 = "spareAvailablePercent";
                              goto LABEL_13;
                            case 533:
                              uint64_t v18 = *v8;
                              time_t v19 = "dataFabricErr";
                              goto LABEL_13;
                            case 534:
                              uint64_t v18 = *v8;
                              time_t v19 = "downlinkFabricErr";
                              goto LABEL_13;
                            case 535:
                              uint64_t v18 = *v8;
                              time_t v19 = "prpAccTimeoutErr";
                              goto LABEL_13;
                            case 537:
                              uint64_t v18 = *v8;
                              time_t v19 = "uplinkFabricErr";
                              goto LABEL_13;
                            case 538:
                              uint64_t v18 = *v8;
                              time_t v19 = "skinnyBandsGBB";
                              goto LABEL_13;
                            case 539:
                              uint64_t v18 = *v8;
                              time_t v19 = "AbortPad_GcMustPadBand";
                              goto LABEL_13;
                            case 540:
                              uint64_t v18 = *v8;
                              time_t v19 = "AbortPad_GcMustPadSkinny";
                              goto LABEL_13;
                            case 541:
                              uint64_t v18 = *v8;
                              time_t v19 = "bdrHostPingInitial";
                              goto LABEL_13;
                            case 542:
                              uint64_t v18 = *v8;
                              time_t v19 = "bdrHostPingMoreNeeded";
                              goto LABEL_13;
                            case 543:
                              uint64_t v18 = *v8;
                              time_t v19 = "bandParityAllocationFailed";
                              goto LABEL_13;
                            case 544:
                              uint64_t v18 = *v8;
                              time_t v19 = "fastHwBurstToSlc";
                              goto LABEL_13;
                            case 545:
                              uint64_t v18 = *v8;
                              time_t v19 = "slowHwToTlc";
                              goto LABEL_13;
                            case 546:
                              BOOL v20 = "slcDemandBurstSizeDetected";
                              uint64_t v21 = a1;
                              int v22 = 546;
                              goto LABEL_11;
                            case 547:
                              BOOL v20 = "slcDemandBurstDur";
                              uint64_t v21 = a1;
                              int v22 = 547;
                              goto LABEL_11;
                            case 548:
                              uint64_t v18 = *v8;
                              time_t v19 = "fastHwToTlcBurst";
                              goto LABEL_13;
                            case 549:
                              BOOL v20 = "slcDemandBurstSizeSlc";
                              uint64_t v21 = a1;
                              int v22 = 549;
                              goto LABEL_11;
                            case 551:
                              BOOL v20 = "balanceProportionBucketsHistogramTlc";
                              uint64_t v21 = a1;
                              int v22 = 551;
                              goto LABEL_320;
                            case 553:
                              uint64_t v18 = *v8;
                              time_t v19 = "slowHwFlushToSlc";
                              goto LABEL_13;
                            case 557:
                              uint64_t v18 = *v8;
                              time_t v19 = "slowHwToSlc";
                              goto LABEL_13;
                            case 558:
                              uint64_t v18 = *v8;
                              time_t v19 = "flushNwToSlc";
                              goto LABEL_13;
                            case 559:
                              uint64_t v18 = *v8;
                              time_t v19 = "flushNwToTlc";
                              goto LABEL_13;
                            case 560:
                              uint64_t v18 = *v8;
                              time_t v19 = "oslcHw";
                              goto LABEL_13;
                            case 561:
                              uint64_t v18 = *v8;
                              time_t v19 = "oslcTransitions";
                              goto LABEL_13;
                            case 563:
                              uint64_t v18 = *v8;
                              time_t v19 = "slcDemandFlushCount";
                              goto LABEL_13;
                            case 564:
                              uint64_t v18 = *v8;
                              time_t v19 = "slcDemandBurstCount";
                              goto LABEL_13;
                            case 565:
                              uint64_t v18 = *v8;
                              time_t v19 = "oslcBaseAvgPE";
                              goto LABEL_13;
                            case 566:
                              uint64_t v18 = *v8;
                              time_t v19 = "raidReconstructFailNoSPBX";
                              goto LABEL_13;
                            case 567:
                              uint64_t v18 = *v8;
                              time_t v19 = "raidReconstructFailDouble";
                              goto LABEL_13;
                            case 568:
                              uint64_t v18 = *v8;
                              time_t v19 = "oslcFastWAmpUOnOff";
                              goto LABEL_13;
                            case 569:
                              uint64_t v18 = *v8;
                              time_t v19 = "oslcSlowWAmpUOnOff";
                              goto LABEL_13;
                            case 570:
                              uint64_t v18 = *v8;
                              time_t v19 = "raidReconstructFailInvalid";
                              goto LABEL_13;
                            case 572:
                              uint64_t v18 = *v8;
                              time_t v19 = "oslcLastWAmpUx10";
                              goto LABEL_13;
                            case 573:
                              uint64_t v18 = *v8;
                              time_t v19 = "raidFailedReadNoBlog";
                              goto LABEL_13;
                            case 574:
                              uint64_t v18 = *v8;
                              time_t v19 = "raidReconstructFailBlank";
                              goto LABEL_13;
                            case 575:
                              uint64_t v18 = *v8;
                              time_t v19 = "oslcHotTLCOnOff";
                              goto LABEL_13;
                            case 576:
                              uint64_t v18 = *v8;
                              time_t v19 = "gcVPackDestinations";
                              goto LABEL_13;
                            case 581:
                              uint64_t v18 = *v8;
                              time_t v19 = "averageTLCPECycles";
                              goto LABEL_13;
                            case 582:
                              uint64_t v18 = *v8;
                              time_t v19 = "averageSLCPECycles";
                              goto LABEL_13;
                            case 583:
                              uint64_t v18 = *v8;
                              time_t v19 = "numAtomicBoots";
                              goto LABEL_13;
                            case 584:
                              uint64_t v18 = *v8;
                              time_t v19 = "clogMinorMismatch";
                              goto LABEL_13;
                            case 586:
                              uint64_t v18 = *v8;
                              time_t v19 = "raidExpectedFailRMXReconstructionInternal";
                              goto LABEL_13;
                            case 587:
                              uint64_t v18 = *v8;
                              time_t v19 = "raidExpectedFailRMXReconstructionHost";
                              goto LABEL_13;
                            case 588:
                              uint64_t v18 = *v8;
                              time_t v19 = "oslcGCinvalidations";
                              goto LABEL_13;
                            case 589:
                              uint64_t v18 = *v8;
                              time_t v19 = "oslcGCActivateReason";
                              goto LABEL_13;
                            default:
                              switch(v7)
                              {
                                case 590:
                                  uint64_t v18 = *v8;
                                  time_t v19 = "oslcLowCleanBandsUOnOff";
                                  goto LABEL_13;
                                case 591:
                                  uint64_t v18 = *v8;
                                  time_t v19 = "oslcTooManyGCMustOnOff";
                                  goto LABEL_13;
                                case 592:
                                  uint64_t v18 = *v8;
                                  time_t v19 = "oslcBaseHostWrites";
                                  goto LABEL_13;
                                case 593:
                                  uint64_t v18 = *v8;
                                  time_t v19 = "oslcBaseBandErases";
                                  goto LABEL_13;
                                case 594:
                                  uint64_t v18 = *v8;
                                  time_t v19 = "oslcBdrBands";
                                  goto LABEL_13;
                                case 595:
                                  uint64_t v18 = *v8;
                                  time_t v19 = "oslcBdrValid";
                                  goto LABEL_13;
                                case 596:
                                  uint64_t v18 = *v8;
                                  time_t v19 = "unexpectedBlanksInternal";
                                  goto LABEL_13;
                                case 597:
                                  uint64_t v18 = *v8;
                                  time_t v19 = "unexpectedBlanksOnRV";
                                  goto LABEL_13;
                                case 601:
                                  uint64_t v18 = *v8;
                                  time_t v19 = "waterfallLockSectors";
                                  goto LABEL_13;
                                case 602:
                                  uint64_t v18 = *v8;
                                  time_t v19 = "oslcGCActiveWrites";
                                  goto LABEL_13;
                                case 603:
                                  uint64_t v18 = *v8;
                                  time_t v19 = "chipIdTemperatureSample";
                                  goto LABEL_13;
                                case 604:
                                  uint64_t v18 = *v8;
                                  time_t v19 = "gcVPackWrites";
                                  goto LABEL_13;
                                case 605:
                                  BOOL v20 = "gcActiveReasons";
                                  uint64_t v21 = a1;
                                  int v22 = 605;
                                  goto LABEL_11;
                                case 606:
                                  uint64_t v18 = *v8;
                                  time_t v19 = "eanMaxInitTimeMs";
                                  goto LABEL_13;
                                case 607:
                                  uint64_t v18 = *v8;
                                  time_t v19 = "eanMinToFirstReadTimeMs";
                                  goto LABEL_13;
                                case 608:
                                  uint64_t v18 = *v8;
                                  time_t v19 = "skinnyAPGMRetire";
                                  goto LABEL_13;
                                case 609:
                                  uint64_t v18 = *v8;
                                  time_t v19 = "unexpectedBlanksHost";
                                  goto LABEL_13;
                                case 610:
                                  BOOL v20 = "pcieAerCounters";
                                  uint64_t v21 = a1;
                                  int v22 = 610;
                                  goto LABEL_342;
                                case 611:
                                  uint64_t v18 = *v8;
                                  time_t v19 = "fastHwToTlcBalance";
                                  goto LABEL_13;
                                case 612:
                                  uint64_t v18 = *v8;
                                  time_t v19 = "perfOSLCRuns";
                                  goto LABEL_13;
                                case 613:
                                  uint64_t v18 = *v8;
                                  time_t v19 = "slcDemandBurstWritesInGC";
                                  goto LABEL_13;
                                case 614:
                                  uint64_t v18 = *v8;
                                  time_t v19 = "slcDemandBurstWritesInTT";
                                  goto LABEL_13;
                                case 615:
                                  uint64_t v18 = *v8;
                                  time_t v19 = "slcDemandBurstWritesInNRP";
                                  goto LABEL_13;
                                case 616:
                                  uint64_t v18 = *v8;
                                  time_t v19 = "perfTotalDmaMb";
                                  goto LABEL_13;
                                case 617:
                                  uint64_t v18 = *v8;
                                  time_t v19 = "eanAvgInitTimeMs";
                                  goto LABEL_13;
                                case 618:
                                  uint64_t v18 = *v8;
                                  time_t v19 = "eanAvgToFirstReadTimeMs";
                                  goto LABEL_13;
                                case 619:
                                  uint64_t v18 = *v8;
                                  time_t v19 = "eanMaxBootReadTimeMs";
                                  goto LABEL_13;
                                case 620:
                                  uint64_t v18 = *v8;
                                  time_t v19 = "eanAvgBootReadTimeMs";
                                  goto LABEL_13;
                                case 621:
                                  BOOL v20 = "eanBootReadsHist";
                                  uint64_t v21 = a1;
                                  int v22 = 621;
                                  goto LABEL_11;
                                case 622:
                                  uint64_t v18 = *v8;
                                  time_t v19 = "maxBgInitTimeMs";
                                  goto LABEL_13;
                                case 623:
                                  uint64_t v18 = *v8;
                                  time_t v19 = "avgBgInitTimeMs";
                                  goto LABEL_13;
                                case 624:
                                  BOOL v20 = "clogFailReason";
                                  uint64_t v21 = a1;
                                  int v22 = 624;
                                  goto LABEL_85;
                                case 625:
                                  uint64_t v18 = *v8;
                                  time_t v19 = "eanMinBootReadMBPerSec";
                                  goto LABEL_13;
                                case 626:
                                  uint64_t v18 = *v8;
                                  time_t v19 = "eanAvgBootReadMBPerSec";
                                  goto LABEL_13;
                                case 627:
                                  uint64_t v18 = *v8;
                                  time_t v19 = "minSkinnyPECycles";
                                  goto LABEL_13;
                                case 628:
                                  uint64_t v18 = *v8;
                                  time_t v19 = "maxSkinnyPECycles";
                                  goto LABEL_13;
                                case 629:
                                  uint64_t v18 = *v8;
                                  time_t v19 = "averageSkinnyPECycles";
                                  goto LABEL_13;
                                case 630:
                                  BOOL v20 = "raidSuccessfulRecoEAN";
                                  uint64_t v21 = a1;
                                  int v22 = 630;
                                  goto LABEL_463;
                                case 631:
                                  BOOL v20 = "raidFailedRecoEAN";
                                  uint64_t v21 = a1;
                                  int v22 = 631;
                                  goto LABEL_463;
                                case 632:
                                  BOOL v20 = "eanFirstReadMode";
                                  uint64_t v21 = a1;
                                  int v22 = 632;
LABEL_463:
                                  uint64_t v14 = v8;
                                  unsigned int v15 = 6;
                                  goto LABEL_12;
                                case 635:
                                  uint64_t v18 = *v8;
                                  time_t v19 = "oslcHwGC";
                                  goto LABEL_13;
                                case 636:
                                  uint64_t v18 = *v8;
                                  time_t v19 = "oslcHwTT";
                                  goto LABEL_13;
                                case 637:
                                  uint64_t v18 = *v8;
                                  time_t v19 = "oslcHwNRP";
                                  goto LABEL_13;
                                case 638:
                                  BOOL v20 = "oslcDemandBurstSize";
                                  uint64_t v21 = a1;
                                  int v22 = 638;
                                  goto LABEL_11;
                                case 639:
                                  uint64_t v18 = *v8;
                                  time_t v19 = "raidReconstructSuccessBandFlowOslc";
                                  goto LABEL_13;
                                case 640:
                                  uint64_t v18 = *v8;
                                  time_t v19 = "raidReconstructFailBandFlowOslc";
                                  goto LABEL_13;
                                case 641:
                                  uint64_t v18 = *v8;
                                  time_t v19 = "raidFailSectors";
                                  goto LABEL_13;
                                case 642:
                                  uint64_t v18 = *v8;
                                  time_t v19 = "eanFailSectors";
                                  goto LABEL_13;
                                case 643:
                                  uint64_t v18 = *v8;
                                  time_t v19 = "bdrTimeMode";
                                  goto LABEL_13;
                                case 644:
                                  uint64_t v18 = *v8;
                                  time_t v19 = "raidParityNotSavedP";
                                  goto LABEL_13;
                                case 645:
                                  uint64_t v18 = *v8;
                                  time_t v19 = "raidParityNotSavedQ";
                                  goto LABEL_13;
                                case 646:
                                  uint64_t v18 = *v8;
                                  time_t v19 = "raidParityInvalid";
                                  goto LABEL_13;
                                case 647:
                                  uint64_t v18 = *v8;
                                  time_t v19 = "raidParityUnknown";
                                  goto LABEL_13;
                                case 648:
                                  uint64_t v18 = *v8;
                                  time_t v19 = "raidParityUnmapped";
                                  goto LABEL_13;
                                case 649:
                                  uint64_t v18 = *v8;
                                  time_t v19 = "raidParityGCUnc";
                                  goto LABEL_13;
                                case 657:
                                  uint64_t v18 = *v8;
                                  time_t v19 = "AbortSkip_MPBXProbational";
                                  goto LABEL_13;
                                case 659:
                                  uint64_t v18 = *v8;
                                  time_t v19 = "raidVerificationReads";
                                  goto LABEL_13;
                                case 666:
                                  uint64_t v18 = *v8;
                                  time_t v19 = "nofDies";
                                  goto LABEL_13;
                                case 671:
                                  uint64_t v18 = *v8;
                                  time_t v19 = "skinnyBandsNum";
                                  goto LABEL_13;
                                case 672:
                                  uint64_t v18 = *v8;
                                  time_t v19 = "skinnyBandsNumDips";
                                  goto LABEL_13;
                                case 674:
                                  BOOL v20 = "oslcNoVotesHw";
                                  uint64_t v21 = a1;
                                  int v22 = 674;
                                  goto LABEL_23;
                                case 675:
                                  uint64_t v18 = *v8;
                                  time_t v19 = "totalLbas";
                                  goto LABEL_13;
                                case 676:
                                  uint64_t v18 = *v8;
                                  time_t v19 = "bdrHostPingExtra";
                                  goto LABEL_13;
                                case 677:
                                  uint64_t v18 = *v8;
                                  time_t v19 = "magazineInstanceMeta";
                                  goto LABEL_13;
                                default:
                                  switch(v7)
                                  {
                                    case 680:
                                      BOOL v20 = "magazineFWVersion";
                                      uint64_t v21 = a1;
                                      int v22 = 680;
                                      goto LABEL_21;
                                    case 681:
                                      uint64_t v18 = *v8;
                                      time_t v19 = "raidReconstructFailPMXUnsup";
                                      goto LABEL_13;
                                    case 682:
                                      uint64_t v18 = *v8;
                                      time_t v19 = "raidReconstructFailBMXUnsup";
                                      goto LABEL_13;
                                    case 683:
                                      uint64_t v18 = *v8;
                                      time_t v19 = "iBootNANDResets";
                                      goto LABEL_13;
                                    case 684:
                                      uint64_t v18 = *v8;
                                      time_t v19 = "pcieClkreqHighTimeout";
                                      goto LABEL_13;
                                    case 687:
                                      BOOL v20 = "cbdrInitSent";
                                      uint64_t v21 = a1;
                                      int v22 = 687;
LABEL_21:
                                      uint64_t v14 = v8;
                                      unsigned int v15 = 3;
                                      goto LABEL_12;
                                    case 688:
                                      uint64_t v18 = *v8;
                                      time_t v19 = "cbdrPauseSent";
                                      goto LABEL_13;
                                    case 689:
                                      uint64_t v18 = *v8;
                                      time_t v19 = "cbdrResumeSent";
                                      goto LABEL_13;
                                    case 690:
                                      uint64_t v18 = *v8;
                                      time_t v19 = "cbdrGetResultSent";
                                      goto LABEL_13;
                                    case 691:
                                      uint64_t v18 = *v8;
                                      time_t v19 = "cbdrEarlyExits";
                                      goto LABEL_13;
                                    case 694:
                                      BOOL v20 = "cbdrRefreshGrades";
                                      uint64_t v21 = a1;
                                      int v22 = 694;
                                      goto LABEL_11;
                                    case 695:
                                      uint64_t v18 = *v8;
                                      time_t v19 = "cbdrNotEnoughReads";
                                      goto LABEL_13;
                                    case 696:
                                      uint64_t v18 = *v8;
                                      time_t v19 = "cbdrAborts";
                                      goto LABEL_13;
                                    case 697:
                                      uint64_t v18 = *v8;
                                      time_t v19 = "TurboRaidHostClassifications";
                                      goto LABEL_13;
                                    case 698:
                                      uint64_t v18 = *v8;
                                      time_t v19 = "TurboRaidInternalClassifications";
                                      goto LABEL_13;
                                    case 699:
                                      uint64_t v18 = *v8;
                                      time_t v19 = "cbdrFullyDone";
                                      goto LABEL_13;
                                    case 702:
                                      BOOL v20 = "vcurve";
                                      uint64_t v21 = a1;
                                      int v22 = 702;
                                      goto LABEL_155;
                                    case 703:
                                      BOOL v20 = "injDepth";
                                      uint64_t v21 = a1;
                                      int v22 = 703;
                                      goto LABEL_153;
                                    case 704:
                                      uint64_t v18 = *v8;
                                      time_t v19 = "logical_disk_occupied_promiles";
                                      goto LABEL_13;
                                    case 711:
                                      uint64_t v18 = *v8;
                                      time_t v19 = "raidPrevFailedReconstructSkip";
                                      goto LABEL_13;
                                    case 712:
                                      uint64_t v18 = *v8;
                                      time_t v19 = "TurboRaidSuccessfulHostAuxReads";
                                      goto LABEL_13;
                                    case 713:
                                      uint64_t v18 = *v8;
                                      time_t v19 = "TurboRaidSuccessfulInternalAuxReads";
                                      goto LABEL_13;
                                    case 714:
                                      uint64_t v18 = *v8;
                                      time_t v19 = "turboRaidClassificationReliabilityHost";
                                      goto LABEL_13;
                                    case 715:
                                      uint64_t v18 = *v8;
                                      time_t v19 = "turboRaidClassificationReliabilityInternal";
                                      goto LABEL_13;
                                    case 716:
                                      uint64_t v18 = *v8;
                                      time_t v19 = "turboRaidClassificationQualityHost";
                                      goto LABEL_13;
                                    case 717:
                                      uint64_t v18 = *v8;
                                      time_t v19 = "turboRaidClassificationQualityInternal";
                                      goto LABEL_13;
                                    case 719:
                                      uint64_t v18 = *v8;
                                      time_t v19 = "skinnyBandErases";
                                      goto LABEL_13;
                                    case 721:
                                      uint64_t v18 = *v8;
                                      time_t v19 = "gcPDusterDestinations";
                                      goto LABEL_13;
                                    case 722:
                                      uint64_t v18 = *v8;
                                      time_t v19 = "gcPDusterWrites";
                                      goto LABEL_13;
                                    case 730:
                                      uint64_t v18 = *v8;
                                      time_t v19 = "rvFails";
                                      goto LABEL_13;
                                    case 737:
                                      uint64_t v18 = *v8;
                                      time_t v19 = "TurboRaidFailedHostAuxReads";
                                      goto LABEL_13;
                                    case 738:
                                      uint64_t v18 = *v8;
                                      time_t v19 = "TurboRaidFailedInternalAuxReads";
                                      goto LABEL_13;
                                    case 741:
                                      uint64_t v18 = *v8;
                                      time_t v19 = "autoSkipTriggers";
                                      goto LABEL_13;
                                    case 742:
                                      uint64_t v18 = *v8;
                                      time_t v19 = "autoSkipPlanes";
                                      goto LABEL_13;
                                    case 744:
                                      BOOL v20 = "raidReconstructDurationHisto";
                                      uint64_t v21 = a1;
                                      int v22 = 744;
                                      goto LABEL_23;
                                    case 745:
                                      BOOL v20 = "failsOnReconstructHisto";
                                      uint64_t v21 = a1;
                                      int v22 = 745;
                                      goto LABEL_23;
                                    case 746:
                                      uint64_t v18 = *v8;
                                      time_t v19 = "bandKill_userFlattenExcessive";
                                      goto LABEL_13;
                                    case 747:
                                      uint64_t v18 = *v8;
                                      time_t v19 = "bandKill_IntFlattenExcessive";
                                      goto LABEL_13;
                                    case 748:
                                      uint64_t v18 = *v8;
                                      time_t v19 = "bandKill_userFlattenBalance";
                                      goto LABEL_13;
                                    case 749:
                                      uint64_t v18 = *v8;
                                      time_t v19 = "bandKill_intFlattenBalance";
                                      goto LABEL_13;
                                    case 750:
                                      uint64_t v18 = *v8;
                                      time_t v19 = "bandKill_formatVertExcessive";
                                      goto LABEL_13;
                                    case 751:
                                      uint64_t v18 = *v8;
                                      time_t v19 = "bandKill_formatVertBalance";
                                      goto LABEL_13;
                                    case 753:
                                      uint64_t v18 = *v8;
                                      time_t v19 = "cbdrNumSlowRefreshes";
                                      goto LABEL_13;
                                    case 754:
                                      uint64_t v18 = *v8;
                                      time_t v19 = "cbdrNumFastRefreshes";
                                      goto LABEL_13;
                                    case 755:
                                      uint64_t v18 = *v8;
                                      time_t v19 = "cbdrTotalRefreshValidity";
                                      goto LABEL_13;
                                    case 756:
                                      BOOL v20 = "cbdrRefreshedAges";
                                      uint64_t v21 = a1;
                                      int v22 = 756;
                                      goto LABEL_545;
                                    case 758:
                                      uint64_t v18 = *v8;
                                      time_t v19 = "cbdrSkippedBlocks";
                                      goto LABEL_13;
                                    case 759:
                                      BOOL v20 = "cbdrScanPct";
                                      uint64_t v21 = a1;
                                      int v22 = 759;
                                      goto LABEL_19;
                                    case 760:
                                      uint64_t v18 = *v8;
                                      time_t v19 = "raidSuccessfulBMXReconstructionInternal";
                                      goto LABEL_13;
                                    case 761:
                                      uint64_t v18 = *v8;
                                      time_t v19 = "raidSuccessfulBMXReconstructionHost";
                                      goto LABEL_13;
                                    case 762:
                                      uint64_t v18 = *v8;
                                      time_t v19 = "raidFailedBMXReconstructionInternal";
                                      goto LABEL_13;
                                    case 763:
                                      uint64_t v18 = *v8;
                                      time_t v19 = "raidFailedBMXReconstructionHost";
                                      goto LABEL_13;
                                    case 764:
                                      uint64_t v18 = *v8;
                                      time_t v19 = "ricSPRVFail";
                                      goto LABEL_13;
                                    case 765:
                                      uint64_t v18 = *v8;
                                      time_t v19 = "ricMPRVFail";
                                      goto LABEL_13;
                                    case 767:
                                      BOOL v20 = "cbdrRefreshGradesSLC";
                                      uint64_t v21 = a1;
                                      int v22 = 767;
                                      goto LABEL_11;
                                    case 768:
                                      BOOL v20 = "cbdrRefreshedAgesSLC";
                                      uint64_t v21 = a1;
                                      int v22 = 768;
LABEL_545:
                                      uint64_t v14 = v8;
                                      unsigned int v15 = 9;
                                      goto LABEL_12;
                                    case 769:
                                      BOOL v20 = "cbdrScanPctSLC";
                                      uint64_t v21 = a1;
                                      int v22 = 769;
                                      goto LABEL_19;
                                    case 770:
                                      BOOL v20 = "cpuBurstLength";
                                      uint64_t v21 = a1;
                                      int v22 = 770;
                                      goto LABEL_23;
                                    case 771:
                                      uint64_t v18 = *v8;
                                      time_t v19 = "autoSkipRaidRecoFail";
                                      goto LABEL_13;
                                    case 772:
                                      BOOL v20 = "dmReasonsSlc";
                                      uint64_t v21 = a1;
                                      int v22 = 772;
                                      goto LABEL_155;
                                    case 773:
                                      BOOL v20 = "dmReasonsTlc";
                                      uint64_t v21 = a1;
                                      int v22 = 773;
                                      goto LABEL_155;
                                    case 774:
                                      uint64_t v18 = *v8;
                                      time_t v19 = "raidReconstructFailBMXAbort";
                                      goto LABEL_13;
                                    case 775:
                                      uint64_t v18 = *v8;
                                      time_t v19 = "bandKill_fatBindingNoBlocks";
                                      goto LABEL_13;
                                    case 776:
                                      uint64_t v18 = *v8;
                                      time_t v19 = "bandKill_fatBindingFewBlocks";
                                      goto LABEL_13;
                                    default:
                                      switch(v7)
                                      {
                                        case 777:
                                          uint64_t v18 = *v8;
                                          time_t v19 = "numBadBootBlocks";
                                          goto LABEL_13;
                                        case 778:
                                          uint64_t v18 = *v8;
                                          time_t v19 = "snapshotCPUHigh";
                                          goto LABEL_13;
                                        case 779:
                                          uint64_t v18 = *v8;
                                          time_t v19 = "snapshotCPULow";
                                          goto LABEL_13;
                                        case 780:
                                          uint64_t v18 = *v8;
                                          time_t v19 = "gcWithoutBMs";
                                          goto LABEL_13;
                                        case 781:
                                          BOOL v20 = "gcSearchTimeHistory";
                                          uint64_t v21 = a1;
                                          int v22 = 781;
                                          goto LABEL_11;
                                        case 785:
                                          BOOL v20 = "gcSearchPortion";
                                          uint64_t v21 = a1;
                                          int v22 = 785;
                                          goto LABEL_85;
                                        case 786:
                                          uint64_t v18 = *v8;
                                          time_t v19 = "raidReconstructFailBmxMp";
                                          goto LABEL_13;
                                        case 787:
                                          uint64_t v18 = *v8;
                                          time_t v19 = "raidReconstructFailBmx";
                                          goto LABEL_13;
                                        case 788:
                                          uint64_t v18 = *v8;
                                          time_t v19 = "raidReconstructFailBMXUECC";
                                          goto LABEL_13;
                                        case 789:
                                          uint64_t v18 = *v8;
                                          time_t v19 = "raidReconstructFailBMXBlank";
                                          goto LABEL_13;
                                        case 790:
                                          uint64_t v18 = *v8;
                                          time_t v19 = "raidPrevFailedReconstructBmxMpSkip";
                                          goto LABEL_13;
                                        case 792:
                                          uint64_t v18 = *v8;
                                          time_t v19 = "numTLCFatBands";
                                          goto LABEL_13;
                                        case 793:
                                          uint64_t v18 = *v8;
                                          time_t v19 = "fatValidity";
                                          goto LABEL_13;
                                        case 794:
                                          uint64_t v18 = *v8;
                                          time_t v19 = "fatTotal";
                                          goto LABEL_13;
                                        case 798:
                                          BOOL v20 = "raidBMXFailP";
                                          uint64_t v21 = a1;
                                          int v22 = 798;
                                          goto LABEL_22;
                                        case 799:
                                          BOOL v20 = "raidBMXFailUECC";
                                          uint64_t v21 = a1;
                                          int v22 = 799;
                                          goto LABEL_22;
                                        case 804:
                                          BOOL v20 = "raidBMXFailNoSPBX";
                                          uint64_t v21 = a1;
                                          int v22 = 804;
                                          goto LABEL_22;
                                        case 806:
                                          BOOL v20 = "raidBMXFailBlank";
                                          uint64_t v21 = a1;
                                          int v22 = 806;
                                          goto LABEL_22;
                                        case 809:
                                          BOOL v20 = "raidBMXFailUnsup";
                                          uint64_t v21 = a1;
                                          int v22 = 809;
                                          goto LABEL_22;
                                        case 811:
                                          BOOL v20 = "raidBMXFailMpSkip";
                                          uint64_t v21 = a1;
                                          int v22 = 811;
                                          goto LABEL_22;
                                        case 812:
                                          BOOL v20 = "raidBMXFailAbort";
                                          uint64_t v21 = a1;
                                          int v22 = 812;
                                          goto LABEL_22;
                                        case 813:
                                          uint64_t v18 = *v8;
                                          time_t v19 = "TurboRaidIsEnabled";
                                          goto LABEL_13;
                                        case 814:
                                          BOOL v20 = "raidBMXFailOther";
                                          uint64_t v21 = a1;
                                          int v22 = 814;
                                          goto LABEL_22;
                                        case 815:
                                          BOOL v20 = "raidBMXSuccess";
                                          uint64_t v21 = a1;
                                          int v22 = 815;
                                          goto LABEL_22;
                                        case 816:
                                          uint64_t v18 = *v8;
                                          time_t v19 = "skinnyBandsExtraDip";
                                          goto LABEL_13;
                                        case 821:
                                          uint64_t v18 = *v8;
                                          time_t v19 = "writeAmp";
                                          goto LABEL_13;
                                        case 822:
                                          uint64_t v18 = *v8;
                                          time_t v19 = "ricMaxClogOnlyPages";
                                          goto LABEL_13;
                                        case 823:
                                          BOOL v20 = "readClassifyStatusesHisto";
                                          uint64_t v21 = a1;
                                          int v22 = 823;
                                          goto LABEL_21;
                                        case 824:
                                          BOOL v20 = "readWithAuxStatusesHisto";
                                          uint64_t v21 = a1;
                                          int v22 = 824;
                                          goto LABEL_11;
                                        case 825:
                                          BOOL v20 = "readReconstructStatusesHisto";
                                          uint64_t v21 = a1;
                                          int v22 = 825;
                                          goto LABEL_11;
                                        case 826:
                                          uint64_t v18 = *v8;
                                          time_t v19 = "bdrBackupChecks";
                                          goto LABEL_13;
                                        case 827:
                                          uint64_t v18 = *v8;
                                          time_t v19 = "ricExceedClogOnlyPagesTH";
                                          goto LABEL_13;
                                        case 828:
                                          uint64_t v18 = *v8;
                                          time_t v19 = "numDipFailures";
                                          goto LABEL_13;
                                        case 831:
                                          uint64_t v18 = *v8;
                                          time_t v19 = "prefetchNextRange";
                                          goto LABEL_13;
                                        case 862:
                                          uint64_t v18 = *v8;
                                          time_t v19 = "raidSuccessfulSkip";
                                          goto LABEL_13;
                                        case 863:
                                          uint64_t v18 = *v8;
                                          time_t v19 = "raidFailedSkip";
                                          goto LABEL_13;
                                        case 864:
                                          uint64_t v18 = *v8;
                                          time_t v19 = "raidSkipAttempts";
                                          goto LABEL_13;
                                        case 865:
                                          BOOL v20 = "timeOfThrottlingPerLevel";
                                          uint64_t v21 = a1;
                                          int v22 = 865;
                                          goto LABEL_85;
                                        case 866:
                                          BOOL v20 = "timeOfThrottlingPerReadLevel";
                                          uint64_t v21 = a1;
                                          int v22 = 866;
                                          goto LABEL_85;
                                        case 867:
                                          BOOL v20 = "timeOfThrottlingPerWriteLevel";
                                          uint64_t v21 = a1;
                                          int v22 = 867;
                                          goto LABEL_85;
                                        case 868:
                                          BOOL v20 = "dmReasonsSlc_1bc";
                                          uint64_t v21 = a1;
                                          int v22 = 868;
                                          goto LABEL_155;
                                        case 869:
                                          BOOL v20 = "dmReasonsTlc_1bc";
                                          uint64_t v21 = a1;
                                          int v22 = 869;
                                          goto LABEL_155;
                                        case 870:
                                          BOOL v20 = "dmReasonsSlc_1bc_he";
                                          uint64_t v21 = a1;
                                          int v22 = 870;
                                          goto LABEL_155;
                                        case 871:
                                          BOOL v20 = "dmReasonsTlc_1bc_he";
                                          uint64_t v21 = a1;
                                          int v22 = 871;
                                          goto LABEL_155;
                                        case 876:
                                          BOOL v20 = "dmReasonsSlc_mbc";
                                          uint64_t v21 = a1;
                                          int v22 = 876;
                                          goto LABEL_155;
                                        case 877:
                                          BOOL v20 = "dmReasonsTlc_mbc";
                                          uint64_t v21 = a1;
                                          int v22 = 877;
                                          goto LABEL_155;
                                        case 883:
                                          uint64_t v18 = *v8;
                                          time_t v19 = "clogEmptyProgramms";
                                          goto LABEL_13;
                                        case 884:
                                          uint64_t v18 = *v8;
                                          time_t v19 = "oslcHwCloseBand";
                                          goto LABEL_13;
                                        case 891:
                                          BOOL v20 = "turboRaidSuccessAuxPartition";
                                          uint64_t v21 = a1;
                                          int v22 = 891;
                                          goto LABEL_20;
                                        case 892:
                                          BOOL v20 = "turboRaidFailAuxPartition";
                                          uint64_t v21 = a1;
                                          int v22 = 892;
                                          goto LABEL_20;
                                        case 893:
                                          BOOL v20 = "turboRaidClassifyQualPartition";
                                          uint64_t v21 = a1;
                                          int v22 = 893;
                                          goto LABEL_20;
                                        case 894:
                                          BOOL v20 = "turboRaidClassifyRelPartition";
                                          uint64_t v21 = a1;
                                          int v22 = 894;
                                          goto LABEL_20;
                                        case 895:
                                          uint64_t v18 = *v8;
                                          time_t v19 = "IND_pool_freeMinSilo";
                                          goto LABEL_13;
                                        case 896:
                                          uint64_t v18 = *v8;
                                          time_t v19 = "autoSweepBlocks";
                                          goto LABEL_13;
                                        case 897:
                                          BOOL v20 = "wcWrFragSizes";
                                          uint64_t v21 = a1;
                                          int v22 = 897;
                                          goto LABEL_85;
                                        case 898:
                                          BOOL v20 = "indStateAcrossGcDidNoL";
                                          uint64_t v21 = a1;
                                          int v22 = 898;
                                          goto LABEL_85;
                                        case 899:
                                          BOOL v20 = "indStateAcrossGcDidL";
                                          uint64_t v21 = a1;
                                          int v22 = 899;
                                          goto LABEL_85;
                                        case 900:
                                          uint64_t v18 = *v8;
                                          time_t v19 = "turboRaidNoClassifyDueToWasRetire";
                                          goto LABEL_13;
                                        case 901:
                                          uint64_t v18 = *v8;
                                          time_t v19 = "turboRaidNoClassifyDueToOpenBand";
                                          goto LABEL_13;
                                        case 902:
                                          uint64_t v18 = *v8;
                                          time_t v19 = "turboRaidNoClassifyDueToQualityBlock";
                                          goto LABEL_13;
                                        case 903:
                                          uint64_t v18 = *v8;
                                          time_t v19 = "turboRaidGbbOpenBand";
                                          goto LABEL_13;
                                        case 904:
                                          uint64_t v18 = *v8;
                                          time_t v19 = "turboRaidGbbShouldRetireOnRefresh";
                                          goto LABEL_13;
                                        case 905:
                                          BOOL v20 = "turboRaidRelPerBlock";
                                          uint64_t v21 = a1;
                                          int v22 = 905;
                                          goto LABEL_85;
                                        case 906:
                                          BOOL v20 = "turboRaidRelBetweenRefreshesPerBlock";
                                          uint64_t v21 = a1;
                                          int v22 = 906;
                                          goto LABEL_85;
                                        default:
                                          if (v7 <= 1039)
                                          {
                                            switch(v7)
                                            {
                                              case 907:
                                                BOOL v20 = "turboRaidMaxRelBetweenRefreshesPerBlock";
                                                uint64_t v21 = a1;
                                                int v22 = 907;
                                                goto LABEL_85;
                                              case 908:
                                                BOOL v20 = "turboRaidMinRelBetweenRefreshesPerBlock";
                                                uint64_t v21 = a1;
                                                int v22 = 908;
                                                goto LABEL_85;
                                              case 909:
                                              case 910:
                                              case 911:
                                              case 912:
                                              case 913:
                                              case 914:
                                              case 915:
                                              case 916:
                                              case 917:
                                              case 924:
                                              case 925:
                                              case 926:
                                              case 927:
                                              case 928:
                                              case 929:
                                              case 936:
                                              case 941:
                                              case 945:
                                              case 946:
                                              case 947:
                                              case 949:
                                              case 950:
                                              case 952:
                                              case 954:
                                              case 955:
                                              case 956:
                                              case 957:
                                              case 958:
                                              case 959:
                                              case 960:
                                              case 963:
                                              case 964:
                                              case 965:
                                              case 966:
                                              case 968:
                                              case 969:
                                              case 970:
                                                goto LABEL_696;
                                              case 918:
                                                BOOL v20 = "turboRaidMaxCyclesBetweenRel";
                                                uint64_t v21 = a1;
                                                int v22 = 918;
                                                goto LABEL_85;
                                              case 919:
                                                BOOL v20 = "turboRaidMinCyclesBetweenRel";
                                                uint64_t v21 = a1;
                                                int v22 = 919;
                                                goto LABEL_85;
                                              case 920:
                                                BOOL v20 = "turboRaidAuxPerBlock";
                                                uint64_t v21 = a1;
                                                int v22 = 920;
                                                goto LABEL_85;
                                              case 921:
                                                BOOL v20 = "turboRaidAuxBetweenRefreshesPerBlock";
                                                uint64_t v21 = a1;
                                                int v22 = 921;
                                                goto LABEL_85;
                                              case 922:
                                                uint64_t v18 = *v8;
                                                time_t v19 = "turboRaidRelLockMark";
                                                goto LABEL_13;
                                              case 923:
                                                uint64_t v18 = *v8;
                                                time_t v19 = "turboRaidAuxLockMark";
                                                goto LABEL_13;
                                              case 930:
                                                BOOL v20 = "turboRaidMaxCyclesBetweenAux";
                                                uint64_t v21 = a1;
                                                int v22 = 930;
                                                goto LABEL_85;
                                              case 931:
                                                BOOL v20 = "turboRaidMinCyclesBetweenAux";
                                                uint64_t v21 = a1;
                                                int v22 = 931;
                                                goto LABEL_85;
                                              case 932:
                                                BOOL v20 = "turboRaidLastRelPECycles";
                                                uint64_t v21 = a1;
                                                int v22 = 932;
                                                goto LABEL_85;
                                              case 933:
                                                BOOL v20 = "turboRaidRelQualPECycles";
                                                uint64_t v21 = a1;
                                                int v22 = 933;
                                                goto LABEL_85;
                                              case 934:
                                                BOOL v20 = "turboRaidLastAuxPECycles";
                                                uint64_t v21 = a1;
                                                int v22 = 934;
                                                goto LABEL_85;
                                              case 935:
                                                BOOL v20 = "turboRaidAuxQualPECycles";
                                                uint64_t v21 = a1;
                                                int v22 = 935;
                                                goto LABEL_85;
                                              case 937:
                                                uint64_t v18 = *v8;
                                                time_t v19 = "turboRaidPEFailAfterRel";
                                                goto LABEL_13;
                                              case 938:
                                                uint64_t v18 = *v8;
                                                time_t v19 = "turboRaidPEFailAfterAux";
                                                goto LABEL_13;
                                              case 939:
                                                uint64_t v18 = *v8;
                                                time_t v19 = "dvfmVotesCPU";
                                                goto LABEL_13;
                                              case 940:
                                                uint64_t v18 = *v8;
                                                time_t v19 = "dvfmVotesBandwidth";
                                                goto LABEL_13;
                                              case 942:
                                                uint64_t v18 = *v8;
                                                time_t v19 = "maxSLCEndurance";
                                                goto LABEL_13;
                                              case 943:
                                                uint64_t v18 = *v8;
                                                time_t v19 = "maxMixedEndurance";
                                                goto LABEL_13;
                                              case 944:
                                                uint64_t v18 = *v8;
                                                time_t v19 = "maxNativeEndurance";
                                                goto LABEL_13;
                                              case 948:
                                                BOOL v20 = "assertHistory";
                                                uint64_t v21 = a1;
                                                int v22 = 948;
                                                uint64_t v14 = v8;
                                                unsigned int v15 = 40;
                                                goto LABEL_12;
                                              case 951:
                                                uint64_t v18 = *v8;
                                                time_t v19 = "asp3Support";
                                                goto LABEL_13;
                                              case 953:
                                                uint64_t v18 = *v8;
                                                time_t v19 = "numCrossTempRaidUecc";
                                                goto LABEL_13;
                                              case 961:
                                                uint64_t v18 = *v8;
                                                time_t v19 = "osBuildStr";
                                                goto LABEL_13;
                                              case 962:
                                                uint64_t v18 = *v8;
                                                time_t v19 = "raidConfig";
                                                goto LABEL_13;
                                              case 967:
                                                BOOL v20 = "indTrimFrags";
                                                uint64_t v21 = a1;
                                                int v22 = 967;
                                                goto LABEL_153;
                                              case 971:
                                                BOOL v20 = "indUsedFrags";
                                                uint64_t v21 = a1;
                                                int v22 = 971;
                                                goto LABEL_153;
                                              default:
                                                switch(v7)
                                                {
                                                  case 996:
                                                    uint64_t v18 = *v8;
                                                    id v16 = (void *)a1;
                                                    time_t v19 = "clogFindFail";
                                                    goto LABEL_14;
                                                  case 997:
                                                    uint64_t v18 = *v8;
                                                    id v16 = (void *)a1;
                                                    time_t v19 = "clogFindBlank";
                                                    goto LABEL_14;
                                                  case 998:
                                                    uint64_t v18 = *v8;
                                                    id v16 = (void *)a1;
                                                    time_t v19 = "clogFindUnc";
                                                    goto LABEL_14;
                                                  case 999:
                                                    uint64_t v18 = *v8;
                                                    id v16 = (void *)a1;
                                                    time_t v19 = "clogFindUnexpected";
                                                    goto LABEL_14;
                                                  case 1001:
                                                    uint64_t v21 = a1;
                                                    int v22 = 1001;
                                                    BOOL v20 = "clogReplayFailReason";
                                                    goto LABEL_23;
                                                  case 1002:
                                                    uint64_t v18 = *v8;
                                                    id v16 = (void *)a1;
                                                    time_t v19 = "clogReplayTransientError";
                                                    goto LABEL_14;
                                                  case 1003:
                                                    uint64_t v18 = *v8;
                                                    id v16 = (void *)a1;
                                                    time_t v19 = "clogReplaySpfError";
                                                    goto LABEL_14;
                                                  case 1015:
                                                    uint64_t v21 = a1;
                                                    int v22 = 1015;
                                                    BOOL v20 = "eanEarlyBootUeccPage";
                                                    goto LABEL_22;
                                                  case 1016:
                                                    uint64_t v18 = *v8;
                                                    id v16 = (void *)a1;
                                                    time_t v19 = "eanEarlyBootNumUeccPages";
                                                    goto LABEL_14;
                                                  case 1017:
                                                    uint64_t v18 = *v8;
                                                    id v16 = (void *)a1;
                                                    time_t v19 = "eanEarlyBootUeccMultiplane";
                                                    goto LABEL_14;
                                                  default:
                                                    goto LABEL_696;
                                                }
                                            }
                                          }

                                          if (v7 <= 1137)
                                          {
                                            if (v7 > 1104)
                                            {
                                              if (v7 > 1115)
                                              {
                                                if (v7 == 1116)
                                                {
                                                  uint64_t v21 = a1;
                                                  int v22 = 1116;
                                                  BOOL v20 = "gcwamp";
LABEL_155:
                                                  uint64_t v14 = v8;
                                                  unsigned int v15 = 32;
                                                  goto LABEL_12;
                                                }

                                                if (v7 == 1137)
                                                {
                                                  uint64_t v18 = *v8;
                                                  id v16 = (void *)a1;
                                                  time_t v19 = "numOfToUnhappySwitches";
                                                  goto LABEL_14;
                                                }
                                              }

                                              else
                                              {
                                                if (v7 == 1105)
                                                {
                                                  uint64_t v21 = a1;
                                                  int v22 = 1105;
                                                  BOOL v20 = "hostReadSequential";
                                                  goto LABEL_703;
                                                }

                                                if (v7 == 1106)
                                                {
                                                  uint64_t v21 = a1;
                                                  int v22 = 1106;
                                                  BOOL v20 = "GCReadSequential";
LABEL_703:
                                                  uint64_t v14 = v8;
                                                  unsigned int v15 = 14;
                                                  goto LABEL_12;
                                                }
                                              }
                                            }

                                            else
                                            {
                                              if (v7 <= 1041)
                                              {
                                                uint64_t v21 = a1;
                                                if (v7 == 1040)
                                                {
                                                  int v22 = 1040;
                                                  BOOL v20 = "bandsAgeBinsV2";
                                                }

                                                else
                                                {
                                                  int v22 = 1041;
                                                  BOOL v20 = "bandsAgeBinsSnapshot";
                                                }

                                                uint64_t v14 = v8;
                                                unsigned int v15 = 31;
                                                goto LABEL_12;
                                              }

                                              if (v7 == 1042)
                                              {
                                                uint64_t v21 = a1;
                                                int v22 = 1042;
                                                BOOL v20 = "bandsAgeBinsReadSectors";
                                                uint64_t v14 = v8;
                                                unsigned int v15 = 15;
LABEL_12:
                                                sub_10000EAD0(v21, v22, v20, v14, v15);
                                                goto LABEL_15;
                                              }

                                              if (v7 == 1080)
                                              {
                                                uint64_t v18 = *v8;
                                                id v16 = (void *)a1;
                                                time_t v19 = "raidForceClogLoad";
                                                goto LABEL_14;
                                              }
                                            }

LABEL_696:
                                            switch(v7)
                                            {
                                              case 1196:
                                                uint64_t v21 = a1;
                                                int v22 = 1196;
                                                BOOL v20 = "poDetectGBBedTotalCost";
                                                goto LABEL_19;
                                              case 1197:
                                                uint64_t v21 = a1;
                                                int v22 = 1197;
                                                BOOL v20 = "poDetectGBBedAge";
                                                goto LABEL_11;
                                              case 1198:
                                                uint64_t v21 = a1;
                                                int v22 = 1198;
                                                BOOL v20 = "poDetectPERemovalMostSevereCost";
                                                goto LABEL_21;
                                              case 1199:
                                                uint64_t v18 = *v8;
                                                id v16 = (void *)a1;
                                                time_t v19 = "poDetectCurrentSize";
                                                goto LABEL_14;
                                              case 1200:
                                              case 1203:
                                              case 1204:
                                              case 1205:
                                              case 1206:
                                              case 1207:
                                              case 1208:
                                              case 1209:
                                              case 1210:
                                              case 1212:
                                              case 1213:
                                              case 1214:
                                              case 1219:
                                              case 1220:
                                              case 1221:
                                              case 1222:
                                              case 1223:
                                                break;
                                              case 1201:
                                                uint64_t v21 = a1;
                                                int v22 = 1201;
                                                BOOL v20 = "gcVerticalSuccssfulAlignments";
                                                goto LABEL_22;
                                              case 1202:
                                                uint64_t v21 = a1;
                                                int v22 = 1202;
                                                BOOL v20 = "gcVerticalNoAlignmentDueToMissingSegs";
                                                goto LABEL_22;
                                              case 1211:
                                                uint64_t v21 = a1;
                                                int v22 = 1211;
                                                BOOL v20 = "forcedAllocationSmallEraseQ";
                                                goto LABEL_716;
                                              case 1215:
                                                uint64_t v21 = a1;
                                                int v22 = 1215;
                                                BOOL v20 = "hostWritesPerThrottleZone";
                                                goto LABEL_19;
                                              case 1216:
                                                uint64_t v21 = a1;
                                                int v22 = 1216;
                                                BOOL v20 = "tlcWLPerDipAvgPEC";
                                                goto LABEL_716;
                                              case 1217:
                                                uint64_t v21 = a1;
                                                int v22 = 1217;
                                                BOOL v20 = "tlcWLPerDipMaxPEC";
                                                goto LABEL_716;
                                              case 1218:
                                                uint64_t v21 = a1;
                                                int v22 = 1218;
                                                BOOL v20 = "tlcWLPerDipMinPEC";
                                                goto LABEL_716;
                                              case 1224:
                                                uint64_t v21 = a1;
                                                int v22 = 1224;
                                                BOOL v20 = "apfsValidLbaOvershoot";
                                                uint64_t v14 = v8;
                                                unsigned int v15 = 20;
                                                goto LABEL_12;
                                              default:
                                                switch(v7)
                                                {
                                                  case 1232:
                                                    uint64_t v18 = *v8;
                                                    id v16 = (void *)a1;
                                                    time_t v19 = "eanFastSize";
                                                    goto LABEL_14;
                                                  case 1233:
                                                    uint64_t v18 = *v8;
                                                    id v16 = (void *)a1;
                                                    time_t v19 = "eanNumSlcEvictions";
                                                    goto LABEL_14;
                                                  case 1234:
                                                    uint64_t v18 = *v8;
                                                    id v16 = (void *)a1;
                                                    time_t v19 = "eanNumForcedCompress";
                                                    goto LABEL_14;
                                                  case 1235:
                                                  case 1236:
                                                  case 1237:
                                                  case 1238:
                                                  case 1239:
                                                  case 1240:
                                                  case 1242:
                                                  case 1243:
                                                  case 1245:
                                                    goto LABEL_15;
                                                  case 1241:
                                                    uint64_t v21 = a1;
                                                    int v22 = 1241;
                                                    BOOL v20 = "s2rTimeHisto";
                                                    goto LABEL_11;
                                                  case 1244:
                                                    uint64_t v18 = *v8;
                                                    id v16 = (void *)a1;
                                                    time_t v19 = "calendarTimeWentBackward";
                                                    goto LABEL_14;
                                                  case 1246:
                                                    uint64_t v21 = a1;
                                                    int v22 = 1246;
                                                    BOOL v20 = "bandsUeccCrossTempHisto";
                                                    goto LABEL_23;
                                                  default:
                                                    if (v7 != 1190) {
                                                      goto LABEL_15;
                                                    }
                                                    uint64_t v21 = a1;
                                                    int v22 = 1190;
                                                    BOOL v20 = "powerDownTime";
                                                    break;
                                                }

                                                goto LABEL_153;
                                            }
                                          }

                                          else
                                          {
                                            switch(v7)
                                            {
                                              case 1147:
                                                uint64_t v21 = a1;
                                                int v22 = 1147;
                                                BOOL v20 = "gc_concurrent_dw_gc12";
                                                goto LABEL_716;
                                              case 1148:
                                                uint64_t v21 = a1;
                                                int v22 = 1148;
                                                BOOL v20 = "gc_concurrent_dw_gc1";
                                                goto LABEL_716;
                                              case 1149:
                                                uint64_t v21 = a1;
                                                int v22 = 1149;
                                                BOOL v20 = "gc_concurrent_dw_gc2";
LABEL_716:
                                                uint64_t v14 = v8;
                                                unsigned int v15 = 24;
                                                goto LABEL_12;
                                              case 1150:
                                              case 1151:
                                              case 1152:
                                              case 1153:
                                              case 1154:
                                              case 1155:
                                              case 1156:
                                              case 1159:
                                              case 1160:
                                              case 1161:
                                              case 1162:
                                              case 1163:
                                              case 1164:
                                              case 1165:
                                              case 1166:
                                              case 1167:
                                              case 1170:
                                              case 1173:
                                              case 1174:
                                              case 1175:
                                              case 1176:
                                              case 1177:
                                              case 1178:
                                                goto LABEL_696;
                                              case 1157:
                                                uint64_t v18 = *v8;
                                                id v16 = (void *)a1;
                                                time_t v19 = "eanMaxForceROTimeMs";
                                                break;
                                              case 1158:
                                                uint64_t v18 = *v8;
                                                id v16 = (void *)a1;
                                                time_t v19 = "eanMaxForceRORecoTimeMs";
                                                break;
                                              case 1168:
                                                uint64_t v21 = a1;
                                                int v22 = 1168;
                                                BOOL v20 = "poDetectPERemovalTotalCost";
                                                goto LABEL_20;
                                              case 1169:
                                                uint64_t v21 = a1;
                                                int v22 = 1169;
                                                BOOL v20 = "poDetectEmptySpotRemovalTotalCost";
                                                goto LABEL_20;
                                              case 1171:
                                                uint64_t v21 = a1;
                                                int v22 = 1171;
                                                BOOL v20 = "poDetectEmptySpotRemovalAge";
                                                goto LABEL_11;
                                              case 1172:
                                                uint64_t v21 = a1;
                                                int v22 = 1172;
                                                BOOL v20 = "poDetectGBBedMostSevereCost";
                                                goto LABEL_21;
                                              case 1179:
                                                uint64_t v21 = a1;
                                                int v22 = 1179;
                                                BOOL v20 = "gc_cur_dw_gc1";
                                                goto LABEL_22;
                                              case 1180:
                                                uint64_t v21 = a1;
                                                int v22 = 1180;
                                                BOOL v20 = "gc_cur_dw_gc2";
                                                goto LABEL_22;
                                              case 1181:
                                                uint64_t v21 = a1;
                                                int v22 = 1181;
                                                BOOL v20 = "gc_cur_dw_gc3";
                                                goto LABEL_22;
                                              case 1182:
                                                uint64_t v21 = a1;
                                                int v22 = 1182;
                                                BOOL v20 = "gc_tot_dw_gc1";
                                                goto LABEL_22;
                                              case 1183:
                                                uint64_t v21 = a1;
                                                int v22 = 1183;
                                                BOOL v20 = "gc_tot_dw_gc2";
                                                goto LABEL_22;
                                              case 1184:
                                                uint64_t v18 = *v8;
                                                id v16 = (void *)a1;
                                                time_t v19 = "unhappy_state";
                                                break;
                                              case 1185:
                                                uint64_t v18 = *v8;
                                                id v16 = (void *)a1;
                                                time_t v19 = "unhappy_level";
                                                break;
                                              default:
                                                if (v7 == 1138)
                                                {
                                                  uint64_t v18 = *v8;
                                                  id v16 = (void *)a1;
                                                  time_t v19 = "numOfToHappySwitches";
                                                }

                                                else
                                                {
                                                  if (v7 != 1189) {
                                                    goto LABEL_696;
                                                  }
                                                  uint64_t v18 = *v8;
                                                  id v16 = (void *)a1;
                                                  time_t v19 = "lastLbaFormatTime";
                                                }

                                                break;
                                            }

LABEL_14:
                                            sub_100020760(v16, "", v19, v18);
                                          }

  if (v21) {
    sub_10002EA88((uint64_t)v21);
  }
  return v19;
}

LABEL_15:
                                          a2 = &v8[v10];
                                          unsigned int v6 = v11 - v10;
                                          if (v11 != (_DWORD)v10) {
                                            continue;
                                          }
                                          uint64_t result = 1LL;
                                          break;
                                      }

                                      break;
                                  }

                                  break;
                              }

                              break;
                          }

                          break;
                      }

                      break;
                  }

                  break;
              }

              break;
          }

          break;
      }
    }

    else
    {
      uint64_t result = 0LL;
      *(_DWORD *)(a1 + 32) = 0;
    }

    return result;
  }

                                        sub_100009E9C(v19, a2, a3, a4, a5, a6, a7, a8, v23);
                                        goto LABEL_16;
                                      }

                                      if (v12 <= 1104)
                                      {
                                        if (v12 <= 1041)
                                        {
                                          if (v12 == 1040)
                                          {
                                            if ((_DWORD)v14 != 31) {
                                              sub_100009E9C( "ASPFTLParseBufferToCxt: bandsAgeBinsV2(1040): (#31) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              BOOL v20 = v14;
                                            }
                                            if ((sub_100019B70(a1, "bandsAgeBinsV2_", (uint64_t)v8, 8u, v20) & 1) == 0)
                                            {
                                              int v22 = "ASPFTLParseBufferToCxt: bandsAgeBinsV2(1040): Cannot add 31 elements to context";
                                              goto LABEL_2247;
                                            }
                                          }

                                          else
                                          {
                                            if ((_DWORD)v14 != 31) {
                                              sub_100009E9C( "ASPFTLParseBufferToCxt: bandsAgeBinsSnapshot(1041): (#31) cfg elements ! = (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              BOOL v20 = v14;
                                            }
                                            if ((sub_100019B70(a1, "bandsAgeBinsSnapshot_", (uint64_t)v8, 8u, v20) & 1) == 0)
                                            {
                                              int v22 = "ASPFTLParseBufferToCxt: bandsAgeBinsSnapshot(1041): Cannot add 31 el"
                                                    "ements to context";
                                              goto LABEL_2247;
                                            }
                                          }

                                          goto LABEL_14;
                                        }

                                        if (v12 == 1042)
                                        {
                                          if ((_DWORD)v14 != 15) {
                                            sub_100009E9C( "ASPFTLParseBufferToCxt: bandsAgeBinsReadSectors(1042): (#15) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                          }
                                          else {
                                            BOOL v20 = v14;
                                          }
                                          if ((sub_100019B70(a1, "bandsAgeBinsReadSectors_", (uint64_t)v8, 8u, v20) & 1) == 0)
                                          {
                                            int v22 = "ASPFTLParseBufferToCxt: bandsAgeBinsReadSectors(1042): Cannot add 15 e"
                                                  "lements to context";
                                            goto LABEL_2247;
                                          }

                                          goto LABEL_14;
                                        }

                                        if (v12 == 1080)
                                        {
                                          if ((sub_100019B70(a1, "raidForceClogLoad", (uint64_t)v8, 8u, 1u) & 1) == 0)
                                          {
                                            time_t v19 = "ASPFTLParseBufferToCxt: raidForceClogLoad(1080) cannot add 1 element to context";
                                            goto LABEL_15;
                                          }

uint64_t sub_10000EAD0(uint64_t result, int a2, const char *a3, uint64_t *a4, unsigned int a5)
{
  int v7 = (void *)result;
  uint64_t v8 = *a4;
  if (a2 <= 44)
  {
    switch(a2)
    {
      case 4:
        *(void *)(result + 72) = v8;
        if (a5) {
          goto LABEL_42;
        }
        return result;
      case 5:
      case 6:
      case 8:
      case 9:
      case 10:
      case 11:
      case 14:
      case 15:
      case 16:
        goto LABEL_41;
      case 7:
        *(void *)(result + 64) = v8;
        if (a5) {
          goto LABEL_42;
        }
        return result;
      case 12:
        *(void *)(result + 144) = v8;
        if (a5) {
          goto LABEL_42;
        }
        return result;
      case 13:
        *(void *)(result + 152) = v8;
        if (a5) {
          goto LABEL_42;
        }
        return result;
      case 17:
        *(void *)(result + 8_Block_object_dispose((const void *)(v13 - 112), 8) = v8;
        if (a5) {
          goto LABEL_42;
        }
        return result;
      case 18:
        *(void *)(result + 104) = v8;
        if (a5) {
          goto LABEL_42;
        }
        return result;
      case 19:
        *(void *)(result + 96) = v8;
        if (a5) {
          goto LABEL_42;
        }
        return result;
      case 20:
        *(void *)(result + 112) = v8;
        if (a5) {
          goto LABEL_42;
        }
        return result;
      default:
        if (a2 != 28) {
          goto LABEL_41;
        }
        *(void *)(result + 16_Block_object_dispose((const void *)(v13 - 112), 8) = v8;
        if (!a5) {
          return result;
        }
        goto LABEL_42;
    }
  }

  switch(a2)
  {
    case '-':
      *(void *)(result + 176) = v8;
      if (a5) {
        goto LABEL_42;
      }
      return result;
    case '.':
    case '/':
    case '6':
    case '7':
      goto LABEL_41;
    case '0':
      *(void *)(result + 80) = v8;
      if (!a5) {
        return result;
      }
      goto LABEL_42;
    case '1':
      *(_DWORD *)(result + 56) = v8;
      if (!a5) {
        return result;
      }
      goto LABEL_42;
    case '2':
      *(_DWORD *)(result + 52) = v8;
      if (!a5) {
        return result;
      }
      goto LABEL_42;
    case '3':
      *(_DWORD *)(result + 4_Block_object_dispose((const void *)(v13 - 112), 8) = v8;
      if (!a5) {
        return result;
      }
      goto LABEL_42;
    case '4':
      *(_DWORD *)(result + 44) = v8;
      if (!a5) {
        return result;
      }
      goto LABEL_42;
    case '5':
      *(_DWORD *)(result + 32) = v8;
      goto LABEL_41;
    case '8':
      *(void *)(result + 160) = v8;
      if (!a5) {
        return result;
      }
      goto LABEL_42;
    default:
      if (a2 != 265) {
        goto LABEL_41;
      }
      if (a5)
      {
        uint64_t v9 = a5;
        unint64_t v10 = (void *)(result + 184);
        unsigned int v11 = a4;
        do
        {
          uint64_t v12 = *v11++;
          *v10++ = v12;
          --v9;
        }

        while (v9);
LABEL_41:
        if (a5)
        {
LABEL_42:
          if (a5 == 1)
          {
            return sub_100020760((void *)result, "", a3, v8);
          }

          else
          {
            uint64_t v13 = 0LL;
            uint64_t v14 = a5;
            do
            {
              snprintf(__str, 0x64uLL, "%d", v13);
              __str[100] = 0;
              uint64_t result = sub_100020760(v7, a3, __str, a4[v13++]);
            }

            while (v14 != v13);
          }
        }
      }

      return result;
  }

double sub_10000ED18(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  if (v2)
  {
    do
    {
      id v3 = (void *)v2[14];
      free(v2);
      uint64_t v2 = v3;
    }

    while (v3);
  }

  id v4 = *(void **)(a1 + 16);
  if (v4)
  {
    do
    {
      id v5 = (void *)v4[14];
      free(v4);
      id v4 = v5;
    }

    while (v5);
  }

  double result = 0.0;
  *(_OWORD *)(a1 + 20_Block_object_dispose((const void *)(v13 - 112), 8) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 12_Block_object_dispose((const void *)(v13 - 112), 8) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 4_Block_object_dispose((const void *)(v13 - 112), 8) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  return result;
}

uint64_t sub_10000ED88( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = (unint64_t *)a2;
  uint64_t v10 = 0LL;
  unsigned int v11 = a3 >> 3;
  *(_OWORD *)__str = 0u;
  __int128 v25 = 0u;
  do
  {
LABEL_2:
    if (!v11) {
      return v10;
    }
    unint64_t v13 = *v8++;
    int v12 = v13;
    unint64_t v14 = HIDWORD(v13);
    --v11;
  }

  while (!HIDWORD(v13));
  uint64_t v17 = (v12 - 1);
  if (v17 <= 0x47) {
    __asm { BR              X9 }
  }

  uint64_t v18 = (v12 - 73);
  if (v18 <= 0x46) {
    __asm { BR              X9 }
  }

  switch(v12)
  {
    case 144:
      time_t v19 = "ASPFTLParseBufferToCxt: numMemExtreme(144) cannot add 1 element to context";
      goto LABEL_15;
    case 145:
      time_t v19 = "ASPFTLParseBufferToCxt: maxMemExtremeDuration(145) cannot add 1 element to context";
      goto LABEL_15;
    case 146:
      time_t v19 = "ASPFTLParseBufferToCxt: memExtremeDuration(146) cannot add 1 element to context";
      goto LABEL_15;
    case 147:
      time_t v19 = "ASPFTLParseBufferToCxt: bandGetsExtreme(147) cannot add 1 element to context";
      goto LABEL_15;
    case 148:
      time_t v19 = "ASPFTLParseBufferToCxt: bandGetsLow(148) cannot add 1 element to context";
      goto LABEL_15;
    case 149:
      time_t v19 = "ASPFTLParseBufferToCxt: numHostChoke(149) cannot add 1 element to context";
      goto LABEL_15;
    case 152:
      time_t v19 = "ASPFTLParseBufferToCxt: AbortSkip_ProgramError(152) cannot add 1 element to context";
      goto LABEL_15;
    case 153:
      time_t v19 = "ASPFTLParseBufferToCxt: AbortSkip_ReadErrorOpenBand(153) cannot add 1 element to context";
      goto LABEL_15;
    case 154:
      time_t v19 = "ASPFTLParseBufferToCxt: AbortSkip_FailedRebuildingParity(154) cannot add 1 element to context";
      goto LABEL_15;
    case 155:
      time_t v19 = "ASPFTLParseBufferToCxt: AbortPad_OpenRefreshBand(155) cannot add 1 element to context";
      goto LABEL_15;
    case 156:
      time_t v19 = "ASPFTLParseBufferToCxt: AbortPad_CloseBands(156) cannot add 1 element to context";
      goto LABEL_15;
    case 157:
      time_t v19 = "ASPFTLParseBufferToCxt: AbortPad_SetPhoto(157) cannot add 1 element to context";
      goto LABEL_15;
    case 158:
      time_t v19 = "ASPFTLParseBufferToCxt: AbortPad_GcNoSource(158) cannot add 1 element to context";
      goto LABEL_15;
    case 159:
      time_t v19 = "ASPFTLParseBufferToCxt: AbortPad_Format(159) cannot add 1 element to context";
      goto LABEL_15;
    case 160:
      time_t v19 = "ASPFTLParseBufferToCxt: nandDiscoveryDuration(160) cannot add 1 element to context";
      goto LABEL_15;
    case 161:
      time_t v19 = "ASPFTLParseBufferToCxt: coreCCEnableDuration(161) cannot add 1 element to context";
      goto LABEL_15;
    case 163:
      time_t v19 = "ASPFTLParseBufferToCxt: coreOpenDuration(163) cannot add 1 element to context";
      goto LABEL_15;
    case 164:
      time_t v19 = "ASPFTLParseBufferToCxt: coreWritableDuration(164) cannot add 1 element to context";
      goto LABEL_15;
    case 165:
      time_t v19 = "ASPFTLParseBufferToCxt: coreClogLoadDuration(165) cannot add 1 element to context";
      goto LABEL_15;
    case 167:
      time_t v19 = "ASPFTLParseBufferToCxt: bulkPFail(167) cannot add 1 element to context";
      goto LABEL_15;
    case 169:
      time_t v19 = "ASPFTLParseBufferToCxt: bulkRFail(169) cannot add 1 element to context";
      goto LABEL_15;
    case 172:
      time_t v19 = "ASPFTLParseBufferToCxt: raidSmartErrors(172) cannot add 1 element to context";
      goto LABEL_15;
    case 182:
      time_t v19 = "ASPFTLParseBufferToCxt: internalUeccs(182) cannot add 1 element to context";
      goto LABEL_15;
    case 183:
      time_t v19 = "ASPFTLParseBufferToCxt: e2eFail(183) cannot add 1 element to context";
      goto LABEL_15;
    case 184:
      time_t v19 = "ASPFTLParseBufferToCxt: TempSensorMax(184) cannot add 1 element to context";
      goto LABEL_15;
    case 185:
      time_t v19 = "ASPFTLParseBufferToCxt: TempSensorMin(185) cannot add 1 element to context";
      goto LABEL_15;
    case 186:
      time_t v19 = "ASPFTLParseBufferToCxt: powerUpFromDDR(186) cannot add 1 element to context";
      goto LABEL_15;
    case 187:
      time_t v19 = "ASPFTLParseBufferToCxt: numMemLow(187) cannot add 1 element to context";
      goto LABEL_15;
    case 188:
      time_t v19 = "ASPFTLParseBufferToCxt: maxMemLowDuration(188) cannot add 1 element to context";
      goto LABEL_15;
    case 189:
      time_t v19 = "ASPFTLParseBufferToCxt: memLowDuration(189) cannot add 1 element to context";
      goto LABEL_15;
    case 190:
      time_t v19 = "ASPFTLParseBufferToCxt: numFences(190) cannot add 1 element to context";
      goto LABEL_15;
    case 191:
      time_t v19 = "ASPFTLParseBufferToCxt: hostPassiveIO(191) cannot add 1 element to context";
      goto LABEL_15;
    case 192:
      time_t v19 = "ASPFTLParseBufferToCxt: odtsMax(192) cannot add 1 element to context";
      goto LABEL_15;
    case 193:
      time_t v19 = "ASPFTLParseBufferToCxt: defragMFromOrphans(193) cannot add 1 element to context";
      goto LABEL_15;
    case 194:
      time_t v19 = "ASPFTLParseBufferToCxt: defragMFromFragments(194) cannot add 1 element to context";
      goto LABEL_15;
    case 195:
      time_t v19 = "ASPFTLParseBufferToCxt: defragMTime(195) cannot add 1 element to context";
      goto LABEL_15;
    case 196:
      time_t v19 = "ASPFTLParseBufferToCxt: defragMMaxTime(196) cannot add 1 element to context";
      goto LABEL_15;
    case 197:
      time_t v19 = "ASPFTLParseBufferToCxt: raidFailedLbaMismatch(197) cannot add 1 element to context";
      goto LABEL_15;
    case 198:
      time_t v19 = "ASPFTLParseBufferToCxt: numSyscfgWrites(198) cannot add 1 element to context";
      goto LABEL_15;
    case 199:
      time_t v19 = "ASPFTLParseBufferToCxt: indmbUnitsXfer(199) cannot add 1 element to context";
      goto LABEL_15;
    case 200:
      time_t v19 = "ASPFTLParseBufferToCxt: indmbUnitsCache(200) cannot add 1 element to context";
      goto LABEL_15;
    case 201:
      time_t v19 = "ASPFTLParseBufferToCxt: indmbUnitsInd(201) cannot add 1 element to context";
      goto LABEL_15;
    case 202:
      time_t v19 = "ASPFTLParseBufferToCxt: wcacheFS_Mbytes(202) cannot add 1 element to context";
      goto LABEL_15;
    case 203:
      time_t v19 = "ASPFTLParseBufferToCxt: wcacheDS_Mbytes(203) cannot add 1 element to context";
      goto LABEL_15;
    case 204:
      time_t v19 = "ASPFTLParseBufferToCxt: powerOnSeconds(204) cannot add 1 element to context";
      goto LABEL_15;
    case 205:
      time_t v19 = "ASPFTLParseBufferToCxt: numUnknownTokenHostRead(205) cannot add 1 element to context";
      goto LABEL_15;
    case 206:
      time_t v19 = "ASPFTLParseBufferToCxt: numUnmmapedTokenHostRead(206) cannot add 1 element to context";
      goto LABEL_15;
    case 207:
      if ((_DWORD)v14 != 16) {
        sub_100009E9C( "ASPFTLParseBufferToCxt: numOfThrottlingEntriesPerLevel(207): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
      }
      else {
        unsigned int v20 = v14;
      }
      int v22 = "ASPFTLParseBufferToCxt: numOfThrottlingEntriesPerLevel(207): Cannot add 16 elements to context";
      goto LABEL_2247;
    case 208:
      time_t v19 = "ASPFTLParseBufferToCxt: wcacheFS_MbytesMin(208) cannot add 1 element to context";
      goto LABEL_15;
    case 209:
      time_t v19 = "ASPFTLParseBufferToCxt: wcacheFS_MbytesMax(209) cannot add 1 element to context";
      goto LABEL_15;
    case 210:
      time_t v19 = "ASPFTLParseBufferToCxt: prepareForShutdownFailCounter(210) cannot add 1 element to context";
      goto LABEL_15;
    case 211:
      time_t v19 = "ASPFTLParseBufferToCxt: lpsrEntry(211) cannot add 1 element to context";
      goto LABEL_15;
    case 212:
      time_t v19 = "ASPFTLParseBufferToCxt: lpsrExit(212) cannot add 1 element to context";
      goto LABEL_15;
    case 213:
      if ((_DWORD)v14 != 8) {
        sub_100009E9C( "ASPFTLParseBufferToCxt: crcInternalReadFail(213): (#8) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
      }
      else {
        unsigned int v20 = v14;
      }
      int v22 = "ASPFTLParseBufferToCxt: crcInternalReadFail(213): Cannot add 8 elements to context";
      goto LABEL_2247;
    case 214:
      time_t v19 = "ASPFTLParseBufferToCxt: wcacheFSEvictCnt(214) cannot add 1 element to context";
      goto LABEL_15;
    case 215:
      time_t v19 = "ASPFTLParseBufferToCxt: wcacheFSEvictSize(215) cannot add 1 element to context";
      goto LABEL_15;
    case 216:
      time_t v19 = "ASPFTLParseBufferToCxt: wcacheFSWr(216) cannot add 1 element to context";
      goto LABEL_15;
    case 217:
      time_t v19 = "ASPFTLParseBufferToCxt: wcacheDSWr(217) cannot add 1 element to context";
      goto LABEL_15;
    case 218:
      if ((_DWORD)v14 != 10) {
        sub_100009E9C( "ASPFTLParseBufferToCxt: wcacheFSEvictSizeLogDist(218): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
      }
      else {
        unsigned int v20 = v14;
      }
      int v22 = "ASPFTLParseBufferToCxt: wcacheFSEvictSizeLogDist(218): Cannot add 10 elements to context";
      goto LABEL_2247;
    case 219:
      time_t v19 = "ASPFTLParseBufferToCxt: prepareForShutdownTimeoutCounter(219) cannot add 1 element to context";
      goto LABEL_15;
    case 220:
      time_t v19 = "ASPFTLParseBufferToCxt: prepareForShutdownCancelCounter(220) cannot add 1 element to context";
      goto LABEL_15;
    case 221:
      time_t v19 = "ASPFTLParseBufferToCxt: RD_openBandCount(221) cannot add 1 element to context";
      goto LABEL_15;
    case 222:
      time_t v19 = "ASPFTLParseBufferToCxt: RD_openBandNops(222) cannot add 1 element to context";
      goto LABEL_15;
    case 223:
      time_t v19 = "ASPFTLParseBufferToCxt: RD_closedBandEvictCount(223) cannot add 1 element to context";
      goto LABEL_15;
    default:
      switch(v12)
      {
        case 224:
          time_t v19 = "ASPFTLParseBufferToCxt: RD_closedBandEvictSectors(224) cannot add 1 element to context";
          goto LABEL_15;
        case 225:
          time_t v19 = "ASPFTLParseBufferToCxt: RD_closedBandFragmentCount(225) cannot add 1 element to context";
          goto LABEL_15;
        case 226:
          time_t v19 = "ASPFTLParseBufferToCxt: RD_closedBandFragmentSectors(226) cannot add 1 element to context";
          goto LABEL_15;
        case 227:
          if ((_DWORD)v14 != 10) {
            sub_100009E9C( "ASPFTLParseBufferToCxt: wcacheFSOverWrLogSizeCnts(227): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: wcacheFSOverWrLogSizeCnts(227): Cannot add 10 elements to context";
          goto LABEL_2247;
        case 228:
          if ((_DWORD)v14 != 4) {
            sub_100009E9C( "ASPFTLParseBufferToCxt: wcacheFSOverWrSizeByFlow(228): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: wcacheFSOverWrSizeByFlow(228): Cannot add 4 elements to context";
          goto LABEL_2247;
        case 229:
          if ((_DWORD)v14 != 2) {
            sub_100009E9C( "ASPFTLParseBufferToCxt: indmbXferCountTo(229): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: indmbXferCountTo(229): Cannot add 2 elements to context";
          goto LABEL_2247;
        case 230:
          if ((_DWORD)v14 != 2) {
            sub_100009E9C( "ASPFTLParseBufferToCxt: indmbAccumulatedTimeBetweenXfers(230): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: indmbAccumulatedTimeBetweenXfers(230): Cannot add 2 elements to context";
          goto LABEL_2247;
        case 231:
          time_t v19 = "ASPFTLParseBufferToCxt: maxGracefulBootTimeMs(231) cannot add 1 element to context";
          goto LABEL_15;
        case 232:
          time_t v19 = "ASPFTLParseBufferToCxt: maxUngracefulBootTimeMs(232) cannot add 1 element to context";
          goto LABEL_15;
        case 233:
          time_t v19 = "ASPFTLParseBufferToCxt: averageGracefulBootTimeMs(233) cannot add 1 element to context";
          goto LABEL_15;
        case 234:
          time_t v19 = "ASPFTLParseBufferToCxt: averageUngracefulBootTimeMs(234) cannot add 1 element to context";
          goto LABEL_15;
        case 235:
          if ((_DWORD)v14 != 8) {
            sub_100009E9C( "ASPFTLParseBufferToCxt: gracefulBootTimeLogMs(235): (#8) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: gracefulBootTimeLogMs(235): Cannot add 8 elements to context";
          goto LABEL_2247;
        case 236:
          if ((_DWORD)v14 != 8) {
            sub_100009E9C( "ASPFTLParseBufferToCxt: ungracefulBootTimeLogMs(236): (#8) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: ungracefulBootTimeLogMs(236): Cannot add 8 elements to context";
          goto LABEL_2247;
        case 237:
          if ((_DWORD)v14 != 4) {
            sub_100009E9C( "ASPFTLParseBufferToCxt: CalibrationCount(237): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: CalibrationCount(237): Cannot add 4 elements to context";
          goto LABEL_2247;
        case 238:
          time_t v19 = "ASPFTLParseBufferToCxt: CalibrationLastTmp(238) cannot add 1 element to context";
          goto LABEL_15;
        case 239:
          time_t v19 = "ASPFTLParseBufferToCxt: CalibrationMaxTmp(239) cannot add 1 element to context";
          goto LABEL_15;
        case 240:
          time_t v19 = "ASPFTLParseBufferToCxt: CalibrationMinTmp(240) cannot add 1 element to context";
          goto LABEL_15;
        case 241:
          time_t v19 = "ASPFTLParseBufferToCxt: ungracefulBootWorstIndicator(241) cannot add 1 element to context";
          goto LABEL_15;
        case 242:
          time_t v19 = "ASPFTLParseBufferToCxt: metaMismatchReread(242) cannot add 1 element to context";
          goto LABEL_15;
        case 243:
          time_t v19 = "ASPFTLParseBufferToCxt: numS3SleepOps(243) cannot add 1 element to context";
          goto LABEL_15;
        case 244:
          time_t v19 = "ASPFTLParseBufferToCxt: odtsCurrent(244) cannot add 1 element to context";
          goto LABEL_15;
        case 245:
          time_t v19 = "ASPFTLParseBufferToCxt: prefetchReads(245) cannot add 1 element to context";
          goto LABEL_15;
        case 246:
          time_t v19 = "ASPFTLParseBufferToCxt: prefetchHits(246) cannot add 1 element to context";
          goto LABEL_15;
        case 247:
          time_t v19 = "ASPFTLParseBufferToCxt: prefetchWritesInvalidation(247) cannot add 1 element to context";
          goto LABEL_15;
        case 248:
          time_t v19 = "ASPFTLParseBufferToCxt: indmbUnitsTotal(248) cannot add 1 element to context";
          goto LABEL_15;
        case 249:
          time_t v19 = "ASPFTLParseBufferToCxt: selfThrottlingEngage(249) cannot add 1 element to context";
          goto LABEL_15;
        case 250:
          time_t v19 = "ASPFTLParseBufferToCxt: selfThrottlingDisengage(250) cannot add 1 element to context";
          goto LABEL_15;
        case 252:
          time_t v19 = "ASPFTLParseBufferToCxt: AbortSkip_WlpMode(252) cannot add 1 element to context";
          goto LABEL_15;
        case 253:
          time_t v19 = "ASPFTLParseBufferToCxt: hostWritesWlpMode(253) cannot add 1 element to context";
          goto LABEL_15;
        case 254:
          time_t v19 = "ASPFTLParseBufferToCxt: numClogDoubleUnc(254) cannot add 1 element to context";
          goto LABEL_15;
        case 256:
          time_t v19 = "ASPFTLParseBufferToCxt: AbortPad_WlpMode(256) cannot add 1 element to context";
          goto LABEL_15;
        case 257:
          time_t v19 = "ASPFTLParseBufferToCxt: bonfireIntermediateBandErases(257) cannot add 1 element to context";
          goto LABEL_15;
        case 258:
          time_t v19 = "ASPFTLParseBufferToCxt: bonfireUserBandErases(258) cannot add 1 element to context";
          goto LABEL_15;
        case 259:
          time_t v19 = "ASPFTLParseBufferToCxt: bonfireIntermediateBandProgs(259) cannot add 1 element to context";
          goto LABEL_15;
        case 260:
          time_t v19 = "ASPFTLParseBufferToCxt: bonfireUserBandProgs(260) cannot add 1 element to context";
          goto LABEL_15;
        case 261:
          time_t v19 = "ASPFTLParseBufferToCxt: bonfireIntermediatePageReads(261) cannot add 1 element to context";
          goto LABEL_15;
        case 262:
          time_t v19 = "ASPFTLParseBufferToCxt: bonfireUserPageReads(262) cannot add 1 element to context";
          goto LABEL_15;
        case 263:
          time_t v19 = "ASPFTLParseBufferToCxt: refreshUtil00(263) cannot add 1 element to context";
          goto LABEL_15;
        case 264:
          time_t v19 = "ASPFTLParseBufferToCxt: failToReadUtil00(264) cannot add 1 element to context";
          goto LABEL_15;
        case 265:
          if ((_DWORD)v14 != 5) {
            sub_100009E9C( "ASPFTLParseBufferToCxt: readCountHisto(265): (#5) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: readCountHisto(265): Cannot add 5 elements to context";
          goto LABEL_2247;
        case 266:
          if ((_DWORD)v14 != 16) {
            sub_100009E9C( "ASPFTLParseBufferToCxt: readAmpHisto(266): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: readAmpHisto(266): Cannot add 16 elements to context";
          goto LABEL_2247;
        case 267:
          time_t v19 = "ASPFTLParseBufferToCxt: totalReadAmp(267) cannot add 1 element to context";
          goto LABEL_15;
        case 268:
          if ((_DWORD)v14 != 4) {
            sub_100009E9C( "ASPFTLParseBufferToCxt: nvmeModeSelect(268): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: nvmeModeSelect(268): Cannot add 4 elements to context";
          goto LABEL_2247;
        case 269:
          if ((_DWORD)v14 != 8) {
            sub_100009E9C( "ASPFTLParseBufferToCxt: numBootBlockRefreshSuccess(269): (#8) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: numBootBlockRefreshSuccess(269): Cannot add 8 elements to context";
          goto LABEL_2247;
        case 270:
          if ((_DWORD)v14 != 8) {
            sub_100009E9C( "ASPFTLParseBufferToCxt: numBootBlockRefreshFail(270): (#8) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: numBootBlockRefreshFail(270): Cannot add 8 elements to context";
          goto LABEL_2247;
        case 271:
          time_t v19 = "ASPFTLParseBufferToCxt: numUnsupportedAsi(271) cannot add 1 element to context";
          goto LABEL_15;
        case 272:
          time_t v19 = "ASPFTLParseBufferToCxt: NumTerminatedProgramSegs(272) cannot add 1 element to context";
          goto LABEL_15;
        case 273:
          time_t v19 = "ASPFTLParseBufferToCxt: indParityPagesDrops(273) cannot add 1 element to context";
          goto LABEL_15;
        case 274:
          time_t v19 = "ASPFTLParseBufferToCxt: indFlowPrograms(274) cannot add 1 element to context";
          goto LABEL_15;
        case 277:
          if ((_DWORD)v14 != 4) {
            sub_100009E9C( "ASPFTLParseBufferToCxt: powerBudgetSelect(277): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: powerBudgetSelect(277): Cannot add 4 elements to context";
          goto LABEL_2247;
        case 279:
          time_t v19 = "ASPFTLParseBufferToCxt: RxBurnNandWrites(279) cannot add 1 element to context";
          goto LABEL_15;
        case 280:
          if ((_DWORD)v14 != 12) {
            sub_100009E9C( "ASPFTLParseBufferToCxt: E2EDPErrorCounters(280): (#12) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: E2EDPErrorCounters(280): Cannot add 12 elements to context";
          goto LABEL_2247;
        case 281:
          time_t v19 = "ASPFTLParseBufferToCxt: wcacheSectorsMax(281) cannot add 1 element to context";
          goto LABEL_15;
        case 282:
          time_t v19 = "ASPFTLParseBufferToCxt: wcacheSectorsMin(282) cannot add 1 element to context";
          goto LABEL_15;
        case 283:
          time_t v19 = "ASPFTLParseBufferToCxt: wcacheSectorsCur(283) cannot add 1 element to context";
          goto LABEL_15;
        case 284:
          time_t v19 = "ASPFTLParseBufferToCxt: wcacheDS_SectorsMax(284) cannot add 1 element to context";
          goto LABEL_15;
        case 285:
          time_t v19 = "ASPFTLParseBufferToCxt: wcacheDS_SectorsMin(285) cannot add 1 element to context";
          goto LABEL_15;
        case 286:
          time_t v19 = "ASPFTLParseBufferToCxt: wcacheDS_SectorsCur(286) cannot add 1 element to context";
          goto LABEL_15;
        case 287:
          time_t v19 = "ASPFTLParseBufferToCxt: wcacheFS_Reads(287) cannot add 1 element to context";
          goto LABEL_15;
        case 288:
          time_t v19 = "ASPFTLParseBufferToCxt: wcacheDS_Reads(288) cannot add 1 element to context";
          goto LABEL_15;
        case 289:
          if ((_DWORD)v14 != 32) {
            sub_100009E9C( "ASPFTLParseBufferToCxt: mspBootBlockReadFail(289): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: mspBootBlockReadFail(289): Cannot add 32 elements to context";
          goto LABEL_2247;
        case 290:
          if ((_DWORD)v14 != 32) {
            sub_100009E9C( "ASPFTLParseBufferToCxt: mspBootBlockProgFail(290): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: mspBootBlockProgFail(290): Cannot add 32 elements to context";
          goto LABEL_2247;
        case 291:
          if ((_DWORD)v14 != 32) {
            sub_100009E9C( "ASPFTLParseBufferToCxt: mspBootBlockEraseFail(291): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: mspBootBlockEraseFail(291): Cannot add 32 elements to context";
          goto LABEL_2247;
        case 292:
          time_t v19 = "ASPFTLParseBufferToCxt: bandsRefreshedOnError(292) cannot add 1 element to context";
          goto LABEL_15;
        default:
          switch(v12)
          {
            case 298:
              if ((_DWORD)v14 != 2) {
                sub_100009E9C( "ASPFTLParseBufferToCxt: perHostReads(298): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: perHostReads(298): Cannot add 2 elements to context";
              goto LABEL_2247;
            case 299:
              if ((_DWORD)v14 != 2) {
                sub_100009E9C( "ASPFTLParseBufferToCxt: perHostReadXacts(299): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: perHostReadXacts(299): Cannot add 2 elements to context";
              goto LABEL_2247;
            case 300:
              if ((_DWORD)v14 != 2) {
                sub_100009E9C( "ASPFTLParseBufferToCxt: perHostWrites(300): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: perHostWrites(300): Cannot add 2 elements to context";
              goto LABEL_2247;
            case 301:
              if ((_DWORD)v14 != 2) {
                sub_100009E9C( "ASPFTLParseBufferToCxt: perHostWriteXacts(301): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: perHostWriteXacts(301): Cannot add 2 elements to context";
              goto LABEL_2247;
            case 302:
              if ((_DWORD)v14 != 2) {
                sub_100009E9C( "ASPFTLParseBufferToCxt: perHostNumFlushes(302): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: perHostNumFlushes(302): Cannot add 2 elements to context";
              goto LABEL_2247;
            case 303:
              if ((_DWORD)v14 != 2) {
                sub_100009E9C( "ASPFTLParseBufferToCxt: perHostNumFences(303): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: perHostNumFences(303): Cannot add 2 elements to context";
              goto LABEL_2247;
            case 304:
              if ((_DWORD)v14 != 10) {
                sub_100009E9C( "ASPFTLParseBufferToCxt: commitPadSectorsPerFlow(304): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: commitPadSectorsPerFlow(304): Cannot add 10 elements to context";
              goto LABEL_2247;
            case 305:
              if ((_DWORD)v14 != 10) {
                sub_100009E9C( "ASPFTLParseBufferToCxt: wcacheDSOverWrLogSizeCnts(305): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: wcacheDSOverWrLogSizeCnts(305): Cannot add 10 elements to context";
              goto LABEL_2247;
            case 306:
              if ((_DWORD)v14 != 4) {
                sub_100009E9C( "ASPFTLParseBufferToCxt: wcacheDSOverWrSizeByFlow(306): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: wcacheDSOverWrSizeByFlow(306): Cannot add 4 elements to context";
              goto LABEL_2247;
            case 307:
              if ((_DWORD)v14 != 10) {
                sub_100009E9C( "ASPFTLParseBufferToCxt: CmdRaisePrioiryEvents(307): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: CmdRaisePrioiryEvents(307): Cannot add 10 elements to context";
              goto LABEL_2247;
            case 308:
              time_t v19 = "ASPFTLParseBufferToCxt: utilNumVerification(308) cannot add 1 element to context";
              goto LABEL_15;
            case 309:
              time_t v19 = "ASPFTLParseBufferToCxt: utilRefreshes(309) cannot add 1 element to context";
              goto LABEL_15;
            case 310:
              time_t v19 = "ASPFTLParseBufferToCxt: utilBDRErrors(310) cannot add 1 element to context";
              goto LABEL_15;
            case 311:
              time_t v19 = "ASPFTLParseBufferToCxt: indBandsPerFlow(311) cannot add 1 element to context";
              goto LABEL_15;
            case 312:
              time_t v19 = "ASPFTLParseBufferToCxt: secsPerIndFlow(312) cannot add 1 element to context";
              goto LABEL_15;
            case 313:
              time_t v19 = "ASPFTLParseBufferToCxt: indDecodedECC(313) cannot add 1 element to context";
              goto LABEL_15;
            case 314:
              if ((_DWORD)v14 != 8) {
                sub_100009E9C( "ASPFTLParseBufferToCxt: numBootBlockValidateSuccess(314): (#8) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: numBootBlockValidateSuccess(314): Cannot add 8 elements to context";
              goto LABEL_2247;
            case 315:
              if ((_DWORD)v14 != 8) {
                sub_100009E9C( "ASPFTLParseBufferToCxt: numBootBlockValidateFail(315): (#8) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: numBootBlockValidateFail(315): Cannot add 8 elements to context";
              goto LABEL_2247;
            case 316:
              if ((_DWORD)v14 != 4) {
                sub_100009E9C( "ASPFTLParseBufferToCxt: clogPagesFillingPercentage(316): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: clogPagesFillingPercentage(316): Cannot add 4 elements to context";
              goto LABEL_2247;
            case 317:
              time_t v19 = "ASPFTLParseBufferToCxt: bdrCalTimeAccFactor(317) cannot add 1 element to context";
              goto LABEL_15;
            case 318:
              time_t v19 = "ASPFTLParseBufferToCxt: bootChainRdError(318) cannot add 1 element to context";
              goto LABEL_15;
            case 319:
              time_t v19 = "ASPFTLParseBufferToCxt: bootChainBlankError(319) cannot add 1 element to context";
              goto LABEL_15;
            case 320:
              time_t v19 = "ASPFTLParseBufferToCxt: bootChainRefreshError(320) cannot add 1 element to context";
              goto LABEL_15;
            case 321:
              time_t v19 = "ASPFTLParseBufferToCxt: bootChainVersionError(321) cannot add 1 element to context";
              goto LABEL_15;
            case 322:
              time_t v19 = "ASPFTLParseBufferToCxt: mspBootBlockMismatch(322) cannot add 1 element to context";
              goto LABEL_15;
            case 323:
              time_t v19 = "ASPFTLParseBufferToCxt: mspBootBlockMismatchErr(323) cannot add 1 element to context";
              goto LABEL_15;
            case 324:
              if ((_DWORD)v14 != 5) {
                sub_100009E9C( "ASPFTLParseBufferToCxt: bitflipAddr(324): (#5) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: bitflipAddr(324): Cannot add 5 elements to context";
              goto LABEL_2247;
            case 325:
              if ((_DWORD)v14 != 5) {
                sub_100009E9C( "ASPFTLParseBufferToCxt: bitflipCount(325): (#5) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: bitflipCount(325): Cannot add 5 elements to context";
              goto LABEL_2247;
            case 326:
              if ((_DWORD)v14 != 5) {
                sub_100009E9C( "ASPFTLParseBufferToCxt: bitflipDupes(326): (#5) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: bitflipDupes(326): Cannot add 5 elements to context";
              goto LABEL_2247;
            case 327:
              if ((_DWORD)v14 != 30) {
                sub_100009E9C( "ASPFTLParseBufferToCxt: bandsMaxTempHisto(327): (#30) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: bandsMaxTempHisto(327): Cannot add 30 elements to context";
              goto LABEL_2247;
            case 328:
              if ((_DWORD)v14 != 30) {
                sub_100009E9C( "ASPFTLParseBufferToCxt: bandsMinTempHisto(328): (#30) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: bandsMinTempHisto(328): Cannot add 30 elements to context";
              goto LABEL_2247;
            case 329:
              if ((_DWORD)v14 != 30) {
                sub_100009E9C( "ASPFTLParseBufferToCxt: bandsLifeTimeTempHisto(329): (#30) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: bandsLifeTimeTempHisto(329): Cannot add 30 elements to context";
              goto LABEL_2247;
            case 330:
              if ((_DWORD)v14 != 22) {
                sub_100009E9C( "ASPFTLParseBufferToCxt: bandsDeltaTempHisto(330): (#22) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: bandsDeltaTempHisto(330): Cannot add 22 elements to context";
              goto LABEL_2247;
            case 331:
              if ((_DWORD)v14 != 45) {
                sub_100009E9C( "ASPFTLParseBufferToCxt: bandsCrossTempHisto(331): (#45) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: bandsCrossTempHisto(331): Cannot add 45 elements to context";
              goto LABEL_2247;
            case 332:
              if ((_DWORD)v14 != 10) {
                sub_100009E9C( "ASPFTLParseBufferToCxt: wcacheWaitLogMs(332): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: wcacheWaitLogMs(332): Cannot add 10 elements to context";
              goto LABEL_2247;
            case 333:
              if ((_DWORD)v14 != 10) {
                sub_100009E9C( "ASPFTLParseBufferToCxt: wcacheDS_segsSortedLogSize(333): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: wcacheDS_segsSortedLogSize(333): Cannot add 10 elements to context";
              goto LABEL_2247;
            case 334:
              time_t v19 = "ASPFTLParseBufferToCxt: numFirmwareWrites(334) cannot add 1 element to context";
              goto LABEL_15;
            case 335:
              time_t v19 = "ASPFTLParseBufferToCxt: numBisWrites(335) cannot add 1 element to context";
              goto LABEL_15;
            case 336:
              time_t v19 = "ASPFTLParseBufferToCxt: numBootChainUpdates(336) cannot add 1 element to context";
              goto LABEL_15;
            case 337:
              time_t v19 = "ASPFTLParseBufferToCxt: cntCalTimeWentBackWard(337) cannot add 1 element to context";
              goto LABEL_15;
            case 338:
              time_t v19 = "ASPFTLParseBufferToCxt: indBoRecoveries(338) cannot add 1 element to context";
              goto LABEL_15;
            case 340:
              time_t v19 = "ASPFTLParseBufferToCxt: numCrossTempUecc(340) cannot add 1 element to context";
              goto LABEL_15;
            case 341:
              time_t v19 = "ASPFTLParseBufferToCxt: latencyMonitorError(341) cannot add 1 element to context";
              goto LABEL_15;
            case 343:
              time_t v19 = "ASPFTLParseBufferToCxt: utilUeccReads(343) cannot add 1 element to context";
              goto LABEL_15;
            case 344:
              time_t v19 = "ASPFTLParseBufferToCxt: numOfAvoidedGCDueToTemp(344) cannot add 1 element to context";
              goto LABEL_15;
            case 345:
              time_t v19 = "ASPFTLParseBufferToCxt: forceShutdowns(345) cannot add 1 element to context";
              goto LABEL_15;
            case 346:
              time_t v19 = "ASPFTLParseBufferToCxt: gcSlcDestinations(346) cannot add 1 element to context";
              goto LABEL_15;
            case 347:
              time_t v19 = "ASPFTLParseBufferToCxt: indReplayExtUsed(347) cannot add 1 element to context";
              goto LABEL_15;
            case 348:
              time_t v19 = "ASPFTLParseBufferToCxt: defectsPerPackageOverflow(348) cannot add 1 element to context";
              goto LABEL_15;
            case 349:
              time_t v19 = "ASPFTLParseBufferToCxt: RxBurnIntBandsProgrammed(349) cannot add 1 element to context";
              goto LABEL_15;
            case 350:
              time_t v19 = "ASPFTLParseBufferToCxt: RxBurnUsrBandsProgrammed(350) cannot add 1 element to context";
              goto LABEL_15;
            case 351:
              time_t v19 = "ASPFTLParseBufferToCxt: RxBurnIntNandWrites(351) cannot add 1 element to context";
              goto LABEL_15;
            case 352:
              time_t v19 = "ASPFTLParseBufferToCxt: RxBurnUsrNandWrites(352) cannot add 1 element to context";
              goto LABEL_15;
            case 353:
              time_t v19 = "ASPFTLParseBufferToCxt: clogLastStripeUeccs(353) cannot add 1 element to context";
              goto LABEL_15;
            case 354:
              time_t v19 = "ASPFTLParseBufferToCxt: GC_MidDestSrcSwitchSLC2TLC(354) cannot add 1 element to context";
              goto LABEL_15;
            case 355:
              time_t v19 = "ASPFTLParseBufferToCxt: GC_MidDestSrcSwitchTLC2SLC(355) cannot add 1 element to context";
              goto LABEL_15;
            case 356:
              time_t v19 = "ASPFTLParseBufferToCxt: nvme_stats_shutdown_count_host0_normal(356) cannot add 1 element to context";
              goto LABEL_15;
            case 357:
              time_t v19 = "ASPFTLParseBufferToCxt: nvme_stats_shutdown_count_host1_normal(357) cannot add 1 element to context";
              goto LABEL_15;
            case 358:
              time_t v19 = "ASPFTLParseBufferToCxt: nvme_stats_shutdown_count_host0_s2r(358) cannot add 1 element to context";
              goto LABEL_15;
            case 359:
              time_t v19 = "ASPFTLParseBufferToCxt: nvme_stats_shutdown_count_host1_s2r(359) cannot add 1 element to context";
              goto LABEL_15;
            case 360:
              if ((_DWORD)v14 != 16) {
                sub_100009E9C( "ASPFTLParseBufferToCxt: gcPDusterIntrSrcValidityHisto(360): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: gcPDusterIntrSrcValidityHisto(360): Cannot add 16 elements to context";
              goto LABEL_2247;
            case 361:
              if ((_DWORD)v14 != 16) {
                sub_100009E9C( "ASPFTLParseBufferToCxt: gcPDusterUserSrcValidityHisto(361): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: gcPDusterUserSrcValidityHisto(361): Cannot add 16 elements to context";
              goto LABEL_2247;
            case 362:
              time_t v19 = "ASPFTLParseBufferToCxt: raidFailedReadParity(362) cannot add 1 element to context";
              goto LABEL_15;
            case 364:
              time_t v19 = "ASPFTLParseBufferToCxt: lhotNumSkipes(364) cannot add 1 element to context";
              goto LABEL_15;
            default:
              switch(v12)
              {
                case 365:
                  time_t v19 = "ASPFTLParseBufferToCxt: lhotNumIsHotCalls(365) cannot add 1 element to context";
                  goto LABEL_15;
                case 366:
                  time_t v19 = "ASPFTLParseBufferToCxt: lhotFullLap(366) cannot add 1 element to context";
                  goto LABEL_15;
                case 367:
                  time_t v19 = "ASPFTLParseBufferToCxt: lhotSkipPrecent(367) cannot add 1 element to context";
                  goto LABEL_15;
                case 368:
                  time_t v19 = "ASPFTLParseBufferToCxt: eraseSuspendEvents(368) cannot add 1 element to context";
                  goto LABEL_15;
                case 369:
                  time_t v19 = "ASPFTLParseBufferToCxt: eraseSuspendedStatuses(369) cannot add 1 element to context";
                  goto LABEL_15;
                case 370:
                  time_t v19 = "ASPFTLParseBufferToCxt: eraseSuspendedBands(370) cannot add 1 element to context";
                  goto LABEL_15;
                case 371:
                  time_t v19 = "ASPFTLParseBufferToCxt: eraseSuspendSituationsBelowThreshold(371) cannot add 1 element to context";
                  goto LABEL_15;
                case 372:
                  time_t v19 = "ASPFTLParseBufferToCxt: eraseSuspendSituationsAboveThreshold(372) cannot add 1 element to context";
                  goto LABEL_15;
                case 373:
                  time_t v19 = "ASPFTLParseBufferToCxt: eraseSuspendReadChainsProcessed(373) cannot add 1 element to context";
                  goto LABEL_15;
                case 374:
                  time_t v19 = "ASPFTLParseBufferToCxt: bdrLastDoneHr(374) cannot add 1 element to context";
                  goto LABEL_15;
                case 375:
                  time_t v19 = "ASPFTLParseBufferToCxt: bdrBackupThreshHrs(375) cannot add 1 element to context";
                  goto LABEL_15;
                case 376:
                  time_t v19 = "ASPFTLParseBufferToCxt: clogPortableProgBufs(376) cannot add 1 element to context";
                  goto LABEL_15;
                case 377:
                  time_t v19 = "ASPFTLParseBufferToCxt: clogPortableDropBufs(377) cannot add 1 element to context";
                  goto LABEL_15;
                case 378:
                  time_t v19 = "ASPFTLParseBufferToCxt: clogPortablePadSectors(378) cannot add 1 element to context";
                  goto LABEL_15;
                case 379:
                  time_t v19 = "ASPFTLParseBufferToCxt: numRetiredBlocks(379) cannot add 1 element to context";
                  goto LABEL_15;
                case 381:
                  time_t v19 = "ASPFTLParseBufferToCxt: numRefreshOnErrNandRefreshPerf(381) cannot add 1 element to context";
                  goto LABEL_15;
                case 382:
                  time_t v19 = "ASPFTLParseBufferToCxt: raidReconstructReads(382) cannot add 1 element to context";
                  goto LABEL_15;
                case 383:
                  time_t v19 = "ASPFTLParseBufferToCxt: gcReadsNoBlog(383) cannot add 1 element to context";
                  goto LABEL_15;
                case 384:
                  time_t v19 = "ASPFTLParseBufferToCxt: AbortSkip_MPBXReadVerifyClosedBand(384) cannot add 1 element to context";
                  goto LABEL_15;
                case 385:
                  time_t v19 = "ASPFTLParseBufferToCxt: openBandReadFail(385) cannot add 1 element to context";
                  goto LABEL_15;
                case 386:
                  time_t v19 = "ASPFTLParseBufferToCxt: AbortSkip_MPBXReadVerifyOpenBand(386) cannot add 1 element to context";
                  goto LABEL_15;
                case 387:
                  time_t v19 = "ASPFTLParseBufferToCxt: AbortSkip_MBPXFailedRebuildingParity(387) cannot add 1 element to context";
                  goto LABEL_15;
                case 388:
                  time_t v19 = "ASPFTLParseBufferToCxt: raidSuccessfulPMXReconstructionInternal(388) cannot add 1 element to context";
                  goto LABEL_15;
                case 389:
                  time_t v19 = "ASPFTLParseBufferToCxt: raidSuccessfulPMXReconstructionHost(389) cannot add 1 element to context";
                  goto LABEL_15;
                case 390:
                  time_t v19 = "ASPFTLParseBufferToCxt: raidFailedPMXReconstructionInternal(390) cannot add 1 element to context";
                  goto LABEL_15;
                case 391:
                  time_t v19 = "ASPFTLParseBufferToCxt: raidFailedPMXReconstructionHost(391) cannot add 1 element to context";
                  goto LABEL_15;
                case 392:
                  time_t v19 = "ASPFTLParseBufferToCxt: raidSuccessfulRMXReconstructionInternal(392) cannot add 1 element to context";
                  goto LABEL_15;
                case 393:
                  time_t v19 = "ASPFTLParseBufferToCxt: raidSuccessfulRMXReconstructionHost(393) cannot add 1 element to context";
                  goto LABEL_15;
                case 394:
                  time_t v19 = "ASPFTLParseBufferToCxt: raidFailedRMXReconstructionInternal(394) cannot add 1 element to context";
                  goto LABEL_15;
                case 395:
                  time_t v19 = "ASPFTLParseBufferToCxt: raidFailedRMXReconstructionHost(395) cannot add 1 element to context";
                  goto LABEL_15;
                case 396:
                  time_t v19 = "ASPFTLParseBufferToCxt: raidFailedReadParityInternal(396) cannot add 1 element to context";
                  goto LABEL_15;
                case 397:
                  time_t v19 = "ASPFTLParseBufferToCxt: raidFailedReadQParityInternal(397) cannot add 1 element to context";
                  goto LABEL_15;
                case 398:
                  time_t v19 = "ASPFTLParseBufferToCxt: raidFailedReadQParity(398) cannot add 1 element to context";
                  goto LABEL_15;
                case 399:
                  time_t v19 = "ASPFTLParseBufferToCxt: raidFailedReadQCopy(399) cannot add 1 element to context";
                  goto LABEL_15;
                case 400:
                  time_t v19 = "ASPFTLParseBufferToCxt: raidFailedReconstructionQParity(400) cannot add 1 element to context";
                  goto LABEL_15;
                case 401:
                  time_t v19 = "ASPFTLParseBufferToCxt: offlineBlocksCnt(401) cannot add 1 element to context";
                  goto LABEL_15;
                case 402:
                  time_t v19 = "ASPFTLParseBufferToCxt: bork0Revectors(402) cannot add 1 element to context";
                  goto LABEL_15;
                case 403:
                  time_t v19 = "ASPFTLParseBufferToCxt: raidFailedReadBlog(403) cannot add 1 element to context";
                  goto LABEL_15;
                case 404:
                  time_t v19 = "ASPFTLParseBufferToCxt: numReliabilityRefreshes(404) cannot add 1 element to context";
                  goto LABEL_15;
                case 405:
                  time_t v19 = "ASPFTLParseBufferToCxt: raidFailedReadQCopyInternal(405) cannot add 1 element to context";
                  goto LABEL_15;
                case 406:
                  if ((_DWORD)v14 != 5) {
                    sub_100009E9C( "ASPFTLParseBufferToCxt: raidReconstructSuccessFlow(406): (#5) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                  }
                  else {
                    unsigned int v20 = v14;
                  }
                  int v22 = "ASPFTLParseBufferToCxt: raidReconstructSuccessFlow(406): Cannot add 5 elements to context";
                  goto LABEL_2247;
                case 407:
                  if ((_DWORD)v14 != 5) {
                    sub_100009E9C( "ASPFTLParseBufferToCxt: raidReconstructFailFlow(407): (#5) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                  }
                  else {
                    unsigned int v20 = v14;
                  }
                  int v22 = "ASPFTLParseBufferToCxt: raidReconstructFailFlow(407): Cannot add 5 elements to context";
                  goto LABEL_2247;
                case 408:
                  time_t v19 = "ASPFTLParseBufferToCxt: raidReconstructFailP(408) cannot add 1 element to context";
                  goto LABEL_15;
                case 409:
                  time_t v19 = "ASPFTLParseBufferToCxt: raidReconstructFailQ(409) cannot add 1 element to context";
                  goto LABEL_15;
                case 410:
                  time_t v19 = "ASPFTLParseBufferToCxt: raidReconstructFailUECC(410) cannot add 1 element to context";
                  goto LABEL_15;
                case 411:
                  time_t v19 = "ASPFTLParseBufferToCxt: raidReconstructFailUnsupp(411) cannot add 1 element to context";
                  goto LABEL_15;
                case 412:
                  time_t v19 = "ASPFTLParseBufferToCxt: raidUECCOpenBand(412) cannot add 1 element to context";
                  goto LABEL_15;
                case 414:
                  time_t v19 = "ASPFTLParseBufferToCxt: ueccReads(414) cannot add 1 element to context";
                  goto LABEL_15;
                case 416:
                  time_t v19 = "ASPFTLParseBufferToCxt: raidSuccessfulVerify(416) cannot add 1 element to context";
                  goto LABEL_15;
                case 417:
                  time_t v19 = "ASPFTLParseBufferToCxt: raidFailedVerify(417) cannot add 1 element to context";
                  goto LABEL_15;
                case 418:
                  time_t v19 = "ASPFTLParseBufferToCxt: numBandsVerified(418) cannot add 1 element to context";
                  goto LABEL_15;
                case 419:
                  time_t v19 = "ASPFTLParseBufferToCxt: cache_heads(419) cannot add 1 element to context";
                  goto LABEL_15;
                case 420:
                  time_t v19 = "ASPFTLParseBufferToCxt: AbortSkip_RMXtoMPBX(420) cannot add 1 element to context";
                  goto LABEL_15;
                case 421:
                  time_t v19 = "ASPFTLParseBufferToCxt: s3eFwVer(421) cannot add 1 element to context";
                  goto LABEL_15;
                case 422:
                  time_t v19 = "ASPFTLParseBufferToCxt: readVerifyNative(422) cannot add 1 element to context";
                  goto LABEL_15;
                case 423:
                  time_t v19 = "ASPFTLParseBufferToCxt: reducedReadVerifyNative(423) cannot add 1 element to context";
                  goto LABEL_15;
                case 424:
                  time_t v19 = "ASPFTLParseBufferToCxt: readVerifySlc(424) cannot add 1 element to context";
                  goto LABEL_15;
                case 425:
                  time_t v19 = "ASPFTLParseBufferToCxt: reducedReadVerifySlc(425) cannot add 1 element to context";
                  goto LABEL_15;
                case 426:
                  time_t v19 = "ASPFTLParseBufferToCxt: RxBurnEvictions(426) cannot add 1 element to context";
                  goto LABEL_15;
                case 427:
                  time_t v19 = "ASPFTLParseBufferToCxt: directToTLCBands(427) cannot add 1 element to context";
                  goto LABEL_15;
                case 428:
                  time_t v19 = "ASPFTLParseBufferToCxt: nandDesc(428) cannot add 1 element to context";
                  goto LABEL_15;
                case 429:
                  time_t v19 = "ASPFTLParseBufferToCxt: fwUpdatesPercentUsed(429) cannot add 1 element to context";
                  goto LABEL_15;
                case 430:
                  time_t v19 = "ASPFTLParseBufferToCxt: slcPercentUsed(430) cannot add 1 element to context";
                  goto LABEL_15;
                case 431:
                  time_t v19 = "ASPFTLParseBufferToCxt: percentUsed(431) cannot add 1 element to context";
                  goto LABEL_15;
                default:
                  switch(v12)
                  {
                    case 432:
                      time_t v19 = "ASPFTLParseBufferToCxt: hostAutoWrites(432) cannot add 1 element to context";
                      goto LABEL_15;
                    case 433:
                      time_t v19 = "ASPFTLParseBufferToCxt: hostAutoWriteXacts(433) cannot add 1 element to context";
                      goto LABEL_15;
                    case 434:
                      time_t v19 = "ASPFTLParseBufferToCxt: gcDestDynamic(434) cannot add 1 element to context";
                      goto LABEL_15;
                    case 435:
                      time_t v19 = "ASPFTLParseBufferToCxt: gcDestStatic(435) cannot add 1 element to context";
                      goto LABEL_15;
                    case 436:
                      time_t v19 = "ASPFTLParseBufferToCxt: gcDestWearlevel(436) cannot add 1 element to context";
                      goto LABEL_15;
                    case 437:
                      time_t v19 = "ASPFTLParseBufferToCxt: gcDestParity(437) cannot add 1 element to context";
                      goto LABEL_15;
                    case 438:
                      time_t v19 = "ASPFTLParseBufferToCxt: AbortSkip_Format(438) cannot add 1 element to context";
                      goto LABEL_15;
                    case 440:
                      time_t v19 = "ASPFTLParseBufferToCxt: raidSLCPadding(440) cannot add 1 element to context";
                      goto LABEL_15;
                    case 441:
                      time_t v19 = "ASPFTLParseBufferToCxt: raidGCBands(441) cannot add 1 element to context";
                      goto LABEL_15;
                    case 442:
                      time_t v19 = "ASPFTLParseBufferToCxt: raidGCSectors(442) cannot add 1 element to context";
                      goto LABEL_15;
                    case 443:
                      time_t v19 = "ASPFTLParseBufferToCxt: raidGCPadding(443) cannot add 1 element to context";
                      goto LABEL_15;
                    case 444:
                      time_t v19 = "ASPFTLParseBufferToCxt: raidSLCBandsPerHostFlow(444) cannot add 1 element to context";
                      goto LABEL_15;
                    case 445:
                      time_t v19 = "ASPFTLParseBufferToCxt: raidSLCSecsPerHostFlow(445) cannot add 1 element to context";
                      goto LABEL_15;
                    case 446:
                      time_t v19 = "ASPFTLParseBufferToCxt: rxBurnMinCycleRuns(446) cannot add 1 element to context";
                      goto LABEL_15;
                    case 447:
                      time_t v19 = "ASPFTLParseBufferToCxt: clogNumFastCxt(447) cannot add 1 element to context";
                      goto LABEL_15;
                    case 448:
                      time_t v19 = "ASPFTLParseBufferToCxt: clogNumRapidReboots(448) cannot add 1 element to context";
                      goto LABEL_15;
                    case 449:
                      time_t v19 = "ASPFTLParseBufferToCxt: clogFastCxtAbvThr(449) cannot add 1 element to context";
                      goto LABEL_15;
                    case 450:
                      time_t v19 = "ASPFTLParseBufferToCxt: rxBurnDiffModeRuns(450) cannot add 1 element to context";
                      goto LABEL_15;
                    case 452:
                      time_t v19 = "ASPFTLParseBufferToCxt: indReadVerifyFail(452) cannot add 1 element to context";
                      goto LABEL_15;
                    case 453:
                      if ((_DWORD)v14 != 16) {
                        sub_100009E9C( "ASPFTLParseBufferToCxt: numOfThrottlingEntriesPerReadLevel(453): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: numOfThrottlingEntriesPerReadLevel(453): Cannot add 16 elements to context";
                      goto LABEL_2247;
                    case 454:
                      if ((_DWORD)v14 != 16) {
                        sub_100009E9C( "ASPFTLParseBufferToCxt: numOfThrottlingEntriesPerWriteLevel(454): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: numOfThrottlingEntriesPerWriteLevel(454): Cannot add 16 elements to context";
                      goto LABEL_2247;
                    case 456:
                      if ((_DWORD)v14 != 10) {
                        sub_100009E9C( "ASPFTLParseBufferToCxt: slcFifoDepth(456): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: slcFifoDepth(456): Cannot add 10 elements to context";
                      goto LABEL_2247;
                    case 457:
                      time_t v19 = "ASPFTLParseBufferToCxt: wcacheSectorsDirtyIdle(457) cannot add 1 element to context";
                      goto LABEL_15;
                    case 458:
                      time_t v19 = "ASPFTLParseBufferToCxt: wcacheDS_SectorsDirtyIdle(458) cannot add 1 element to context";
                      goto LABEL_15;
                    case 459:
                      time_t v19 = "ASPFTLParseBufferToCxt: wcacheFS_MbytesDirtyIdle(459) cannot add 1 element to context";
                      goto LABEL_15;
                    case 460:
                      if ((_DWORD)v14 != 256) {
                        sub_100009E9C( "ASPFTLParseBufferToCxt: CacheDepthVsThroughput(460): (#256) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: CacheDepthVsThroughput(460): Cannot add 256 elements to context";
                      goto LABEL_2247;
                    case 461:
                      time_t v19 = "ASPFTLParseBufferToCxt: directToTLCSectors(461) cannot add 1 element to context";
                      goto LABEL_15;
                    case 462:
                      time_t v19 = "ASPFTLParseBufferToCxt: fallbackToWaterfall(462) cannot add 1 element to context";
                      goto LABEL_15;
                    case 463:
                      if ((_DWORD)v14 != 11) {
                        sub_100009E9C( "ASPFTLParseBufferToCxt: balanceProportionBucketsHistogram(463): (#11) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: balanceProportionBucketsHistogram(463): Cannot add 11 elements to context";
                      goto LABEL_2247;
                    case 464:
                      time_t v19 = "ASPFTLParseBufferToCxt: lockToTlc(464) cannot add 1 element to context";
                      goto LABEL_15;
                    case 465:
                      if ((_DWORD)v14 != 10) {
                        sub_100009E9C( "ASPFTLParseBufferToCxt: burstSizeHistogram(465): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: burstSizeHistogram(465): Cannot add 10 elements to context";
                      goto LABEL_2247;
                    case 466:
                      if ((_DWORD)v14 != 64) {
                        sub_100009E9C( "ASPFTLParseBufferToCxt: qosDirectToTLC(466): (#64) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: qosDirectToTLC(466): Cannot add 64 elements to context";
                      goto LABEL_2247;
                    case 467:
                      if ((_DWORD)v14 != 4) {
                        sub_100009E9C( "ASPFTLParseBufferToCxt: maxQosDirectToTLC(467): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: maxQosDirectToTLC(467): Cannot add 4 elements to context";
                      goto LABEL_2247;
                    case 468:
                      if ((_DWORD)v14 != 16) {
                        sub_100009E9C( "ASPFTLParseBufferToCxt: wcacheDirtyAtFlush(468): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: wcacheDirtyAtFlush(468): Cannot add 16 elements to context";
                      goto LABEL_2247;
                    case 469:
                      if ((_DWORD)v14 != 2) {
                        sub_100009E9C( "ASPFTLParseBufferToCxt: raidReconstructSuccessPartition(469): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: raidReconstructSuccessPartition(469): Cannot add 2 elements to context";
                      goto LABEL_2247;
                    case 470:
                      if ((_DWORD)v14 != 2) {
                        sub_100009E9C( "ASPFTLParseBufferToCxt: raidReconstructFailPartition(470): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: raidReconstructFailPartition(470): Cannot add 2 elements to context";
                      goto LABEL_2247;
                    case 471:
                      time_t v19 = "ASPFTLParseBufferToCxt: raidUncleanBootBandFail(471) cannot add 1 element to context";
                      goto LABEL_15;
                    case 472:
                      time_t v19 = "ASPFTLParseBufferToCxt: raidReconstructFailBandFlowHost(472) cannot add 1 element to context";
                      goto LABEL_15;
                    case 473:
                      time_t v19 = "ASPFTLParseBufferToCxt: raidReconstructFailBandFlowGC(473) cannot add 1 element to context";
                      goto LABEL_15;
                    case 476:
                      if ((_DWORD)v14 != 2) {
                        sub_100009E9C( "ASPFTLParseBufferToCxt: raidSuccessfulRecoLbaRange(476): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: raidSuccessfulRecoLbaRange(476): Cannot add 2 elements to context";
                      goto LABEL_2247;
                    case 477:
                      if ((_DWORD)v14 != 2) {
                        sub_100009E9C( "ASPFTLParseBufferToCxt: raidFailedRecoLbaRange(477): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: raidFailedRecoLbaRange(477): Cannot add 2 elements to context";
                      goto LABEL_2247;
                    case 481:
                      if ((_DWORD)v14 != 32) {
                        sub_100009E9C( "ASPFTLParseBufferToCxt: skinnyBandErases_481(481): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: skinnyBandErases_481(481): Cannot add 32 elements to context";
                      goto LABEL_2247;
                    case 483:
                      time_t v19 = "ASPFTLParseBufferToCxt: tlcOverHeatWaterfall(483) cannot add 1 element to context";
                      goto LABEL_15;
                    case 484:
                      time_t v19 = "ASPFTLParseBufferToCxt: skinnyCyclesConvert(484) cannot add 1 element to context";
                      goto LABEL_15;
                    case 485:
                      time_t v19 = "ASPFTLParseBufferToCxt: non_proportional_directToTLCSectors(485) cannot add 1 element to context";
                      goto LABEL_15;
                    case 486:
                      time_t v19 = "ASPFTLParseBufferToCxt: maxFailedFastCxtSync(486) cannot add 1 element to context";
                      goto LABEL_15;
                    case 487:
                      time_t v19 = "ASPFTLParseBufferToCxt: numFormatUserArea(487) cannot add 1 element to context";
                      goto LABEL_15;
                    case 488:
                      time_t v19 = "ASPFTLParseBufferToCxt: clogFastCxtSyncAborted(488) cannot add 1 element to context";
                      goto LABEL_15;
                    case 489:
                      if ((_DWORD)v14 != 5) {
                        sub_100009E9C( "ASPFTLParseBufferToCxt: clogOccupationSectors(489): (#5) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: clogOccupationSectors(489): Cannot add 5 elements to context";
                      goto LABEL_2247;
                    case 490:
                      if ((_DWORD)v14 != 64) {
                        sub_100009E9C( "ASPFTLParseBufferToCxt: bdrTmpHist(490): (#64) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: bdrTmpHist(490): Cannot add 64 elements to context";
                      goto LABEL_2247;
                    case 491:
                      time_t v19 = "ASPFTLParseBufferToCxt: numFWUpdates(491) cannot add 1 element to context";
                      goto LABEL_15;
                    case 492:
                      time_t v19 = "ASPFTLParseBufferToCxt: numClogLoadFails(492) cannot add 1 element to context";
                      goto LABEL_15;
                    case 493:
                      time_t v19 = "ASPFTLParseBufferToCxt: rxBurnNumForcedDiffMode(493) cannot add 1 element to context";
                      goto LABEL_15;
                    case 494:
                      time_t v19 = "ASPFTLParseBufferToCxt: RD_numSaves(494) cannot add 1 element to context";
                      goto LABEL_15;
                    case 495:
                      time_t v19 = "ASPFTLParseBufferToCxt: eanCompressWrites(495) cannot add 1 element to context";
                      goto LABEL_15;
                    case 496:
                      time_t v19 = "ASPFTLParseBufferToCxt: eanHostWrites(496) cannot add 1 element to context";
                      goto LABEL_15;
                    case 497:
                      time_t v19 = "ASPFTLParseBufferToCxt: bandPreErases(497) cannot add 1 element to context";
                      goto LABEL_15;
                    case 498:
                      time_t v19 = "ASPFTLParseBufferToCxt: eanHostUnmaps(498) cannot add 1 element to context";
                      goto LABEL_15;
                    case 499:
                      time_t v19 = "ASPFTLParseBufferToCxt: eanHostFlushes(499) cannot add 1 element to context";
                      goto LABEL_15;
                    case 500:
                      time_t v19 = "ASPFTLParseBufferToCxt: eanFastWrites(500) cannot add 1 element to context";
                      goto LABEL_15;
                    case 501:
                      time_t v19 = "ASPFTLParseBufferToCxt: autowriteDS2FSCollisions(501) cannot add 1 element to context";
                      goto LABEL_15;
                    case 502:
                      time_t v19 = "ASPFTLParseBufferToCxt: autowriteWaitTransferTaskBlocks(502) cannot add 1 element to context";
                      goto LABEL_15;
                    case 503:
                      if ((_DWORD)v14 != 2) {
                        sub_100009E9C( "ASPFTLParseBufferToCxt: avgCycle(503): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: avgCycle(503): Cannot add 2 elements to context";
                      goto LABEL_2247;
                    case 504:
                      time_t v19 = "ASPFTLParseBufferToCxt: RD_DeferredClearsOverflowCnt(504) cannot add 1 element to context";
                      goto LABEL_15;
                    default:
                      switch(v12)
                      {
                        case 505:
                          time_t v19 = "ASPFTLParseBufferToCxt: maxVerticsInBand(505) cannot add 1 element to context";
                          goto LABEL_15;
                        case 506:
                          time_t v19 = "ASPFTLParseBufferToCxt: numVertics(506) cannot add 1 element to context";
                          goto LABEL_15;
                        case 507:
                          time_t v19 = "ASPFTLParseBufferToCxt: exceededCVertics(507) cannot add 1 element to context";
                          goto LABEL_15;
                        case 510:
                          time_t v19 = "ASPFTLParseBufferToCxt: raidReconstructFailMismatch(510) cannot add 1 element to context";
                          goto LABEL_15;
                        case 511:
                          if ((_DWORD)v14 != 32) {
                            sub_100009E9C( "ASPFTLParseBufferToCxt: mspbootBlockRefreshCnt(511): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                          }
                          else {
                            unsigned int v20 = v14;
                          }
                          int v22 = "ASPFTLParseBufferToCxt: mspbootBlockRefreshCnt(511): Cannot add 32 elements to context";
                          goto LABEL_2247;
                        case 516:
                          if ((_DWORD)v14 != 32) {
                            sub_100009E9C( "ASPFTLParseBufferToCxt: mspBootBlockRefreshTime(516): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                          }
                          else {
                            unsigned int v20 = v14;
                          }
                          int v22 = "ASPFTLParseBufferToCxt: mspBootBlockRefreshTime(516): Cannot add 32 elements to context";
                          goto LABEL_2247;
                        case 517:
                          time_t v19 = "ASPFTLParseBufferToCxt: mspBootBlockCountPerMsp(517) cannot add 1 element to context";
                          goto LABEL_15;
                        case 518:
                          time_t v19 = "ASPFTLParseBufferToCxt: skinnyRevectorSLC(518) cannot add 1 element to context";
                          goto LABEL_15;
                        case 519:
                          time_t v19 = "ASPFTLParseBufferToCxt: skinnyRevectorTLC(519) cannot add 1 element to context";
                          goto LABEL_15;
                        case 520:
                          time_t v19 = "ASPFTLParseBufferToCxt: perfSetupAttempts(520) cannot add 1 element to context";
                          goto LABEL_15;
                        case 521:
                          time_t v19 = "ASPFTLParseBufferToCxt: perfSetupSuccesses(521) cannot add 1 element to context";
                          goto LABEL_15;
                        case 522:
                          time_t v19 = "ASPFTLParseBufferToCxt: perfWriteAttempts(522) cannot add 1 element to context";
                          goto LABEL_15;
                        case 523:
                          time_t v19 = "ASPFTLParseBufferToCxt: perfWriteSuccesses(523) cannot add 1 element to context";
                          goto LABEL_15;
                        case 524:
                          time_t v19 = "ASPFTLParseBufferToCxt: perfReadAttempts(524) cannot add 1 element to context";
                          goto LABEL_15;
                        case 525:
                          time_t v19 = "ASPFTLParseBufferToCxt: perfReadSuccesses(525) cannot add 1 element to context";
                          goto LABEL_15;
                        case 526:
                          time_t v19 = "ASPFTLParseBufferToCxt: perfCleanupAttempts(526) cannot add 1 element to context";
                          goto LABEL_15;
                        case 527:
                          time_t v19 = "ASPFTLParseBufferToCxt: perfCleanupSuccesses(527) cannot add 1 element to context";
                          goto LABEL_15;
                        case 530:
                          time_t v19 = "ASPFTLParseBufferToCxt: firstFailedDieId(530) cannot add 1 element to context";
                          goto LABEL_15;
                        case 531:
                          time_t v19 = "ASPFTLParseBufferToCxt: numDieFailures(531) cannot add 1 element to context";
                          goto LABEL_15;
                        case 532:
                          time_t v19 = "ASPFTLParseBufferToCxt: spareAvailablePercent(532) cannot add 1 element to context";
                          goto LABEL_15;
                        case 533:
                          time_t v19 = "ASPFTLParseBufferToCxt: dataFabricErr(533) cannot add 1 element to context";
                          goto LABEL_15;
                        case 534:
                          time_t v19 = "ASPFTLParseBufferToCxt: downlinkFabricErr(534) cannot add 1 element to context";
                          goto LABEL_15;
                        case 535:
                          time_t v19 = "ASPFTLParseBufferToCxt: prpAccTimeoutErr(535) cannot add 1 element to context";
                          goto LABEL_15;
                        case 537:
                          time_t v19 = "ASPFTLParseBufferToCxt: uplinkFabricErr(537) cannot add 1 element to context";
                          goto LABEL_15;
                        case 538:
                          time_t v19 = "ASPFTLParseBufferToCxt: skinnyBandsGBB(538) cannot add 1 element to context";
                          goto LABEL_15;
                        case 539:
                          time_t v19 = "ASPFTLParseBufferToCxt: AbortPad_GcMustPadBand(539) cannot add 1 element to context";
                          goto LABEL_15;
                        case 540:
                          time_t v19 = "ASPFTLParseBufferToCxt: AbortPad_GcMustPadSkinny(540) cannot add 1 element to context";
                          goto LABEL_15;
                        case 541:
                          time_t v19 = "ASPFTLParseBufferToCxt: bdrHostPingInitial(541) cannot add 1 element to context";
                          goto LABEL_15;
                        case 542:
                          time_t v19 = "ASPFTLParseBufferToCxt: bdrHostPingMoreNeeded(542) cannot add 1 element to context";
                          goto LABEL_15;
                        case 543:
                          time_t v19 = "ASPFTLParseBufferToCxt: bandParityAllocationFailed(543) cannot add 1 element to context";
                          goto LABEL_15;
                        case 544:
                          time_t v19 = "ASPFTLParseBufferToCxt: fastHwBurstToSlc(544) cannot add 1 element to context";
                          goto LABEL_15;
                        case 545:
                          time_t v19 = "ASPFTLParseBufferToCxt: slowHwToTlc(545) cannot add 1 element to context";
                          goto LABEL_15;
                        case 546:
                          if ((_DWORD)v14 != 10) {
                            sub_100009E9C( "ASPFTLParseBufferToCxt: slcDemandBurstSizeDetected(546): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                          }
                          else {
                            unsigned int v20 = v14;
                          }
                          int v22 = "ASPFTLParseBufferToCxt: slcDemandBurstSizeDetected(546): Cannot add 10 elements to context";
                          goto LABEL_2247;
                        case 547:
                          if ((_DWORD)v14 != 10) {
                            sub_100009E9C( "ASPFTLParseBufferToCxt: slcDemandBurstDur(547): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                          }
                          else {
                            unsigned int v20 = v14;
                          }
                          int v22 = "ASPFTLParseBufferToCxt: slcDemandBurstDur(547): Cannot add 10 elements to context";
                          goto LABEL_2247;
                        case 548:
                          time_t v19 = "ASPFTLParseBufferToCxt: fastHwToTlcBurst(548) cannot add 1 element to context";
                          goto LABEL_15;
                        case 549:
                          if ((_DWORD)v14 != 10) {
                            sub_100009E9C( "ASPFTLParseBufferToCxt: slcDemandBurstSizeSlc(549): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                          }
                          else {
                            unsigned int v20 = v14;
                          }
                          int v22 = "ASPFTLParseBufferToCxt: slcDemandBurstSizeSlc(549): Cannot add 10 elements to context";
                          goto LABEL_2247;
                        case 551:
                          if ((_DWORD)v14 != 11) {
                            sub_100009E9C( "ASPFTLParseBufferToCxt: balanceProportionBucketsHistogramTlc(551): (#11) cfg elements !=(%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                          }
                          else {
                            unsigned int v20 = v14;
                          }
                          int v22 = "ASPFTLParseBufferToCxt: balanceProportionBucketsHistogramTlc(551): Cannot add 11 elements to context";
                          goto LABEL_2247;
                        case 553:
                          time_t v19 = "ASPFTLParseBufferToCxt: slowHwFlushToSlc(553) cannot add 1 element to context";
                          goto LABEL_15;
                        case 557:
                          time_t v19 = "ASPFTLParseBufferToCxt: slowHwToSlc(557) cannot add 1 element to context";
                          goto LABEL_15;
                        case 558:
                          time_t v19 = "ASPFTLParseBufferToCxt: flushNwToSlc(558) cannot add 1 element to context";
                          goto LABEL_15;
                        case 559:
                          time_t v19 = "ASPFTLParseBufferToCxt: flushNwToTlc(559) cannot add 1 element to context";
                          goto LABEL_15;
                        case 560:
                          time_t v19 = "ASPFTLParseBufferToCxt: oslcHw(560) cannot add 1 element to context";
                          goto LABEL_15;
                        case 561:
                          time_t v19 = "ASPFTLParseBufferToCxt: oslcTransitions(561) cannot add 1 element to context";
                          goto LABEL_15;
                        case 563:
                          time_t v19 = "ASPFTLParseBufferToCxt: slcDemandFlushCount(563) cannot add 1 element to context";
                          goto LABEL_15;
                        case 564:
                          time_t v19 = "ASPFTLParseBufferToCxt: slcDemandBurstCount(564) cannot add 1 element to context";
                          goto LABEL_15;
                        case 565:
                          time_t v19 = "ASPFTLParseBufferToCxt: oslcBaseAvgPE(565) cannot add 1 element to context";
                          goto LABEL_15;
                        case 566:
                          time_t v19 = "ASPFTLParseBufferToCxt: raidReconstructFailNoSPBX(566) cannot add 1 element to context";
                          goto LABEL_15;
                        case 567:
                          time_t v19 = "ASPFTLParseBufferToCxt: raidReconstructFailDouble(567) cannot add 1 element to context";
                          goto LABEL_15;
                        case 568:
                          time_t v19 = "ASPFTLParseBufferToCxt: oslcFastWAmpUOnOff(568) cannot add 1 element to context";
                          goto LABEL_15;
                        case 569:
                          time_t v19 = "ASPFTLParseBufferToCxt: oslcSlowWAmpUOnOff(569) cannot add 1 element to context";
                          goto LABEL_15;
                        case 570:
                          time_t v19 = "ASPFTLParseBufferToCxt: raidReconstructFailInvalid(570) cannot add 1 element to context";
                          goto LABEL_15;
                        case 572:
                          time_t v19 = "ASPFTLParseBufferToCxt: oslcLastWAmpUx10(572) cannot add 1 element to context";
                          goto LABEL_15;
                        case 573:
                          time_t v19 = "ASPFTLParseBufferToCxt: raidFailedReadNoBlog(573) cannot add 1 element to context";
                          goto LABEL_15;
                        case 574:
                          time_t v19 = "ASPFTLParseBufferToCxt: raidReconstructFailBlank(574) cannot add 1 element to context";
                          goto LABEL_15;
                        case 575:
                          time_t v19 = "ASPFTLParseBufferToCxt: oslcHotTLCOnOff(575) cannot add 1 element to context";
                          goto LABEL_15;
                        case 576:
                          time_t v19 = "ASPFTLParseBufferToCxt: gcVPackDestinations(576) cannot add 1 element to context";
                          goto LABEL_15;
                        case 581:
                          time_t v19 = "ASPFTLParseBufferToCxt: averageTLCPECycles(581) cannot add 1 element to context";
                          goto LABEL_15;
                        case 582:
                          time_t v19 = "ASPFTLParseBufferToCxt: averageSLCPECycles(582) cannot add 1 element to context";
                          goto LABEL_15;
                        case 583:
                          time_t v19 = "ASPFTLParseBufferToCxt: numAtomicBoots(583) cannot add 1 element to context";
                          goto LABEL_15;
                        case 584:
                          time_t v19 = "ASPFTLParseBufferToCxt: clogMinorMismatch(584) cannot add 1 element to context";
                          goto LABEL_15;
                        case 586:
                          time_t v19 = "ASPFTLParseBufferToCxt: raidExpectedFailRMXReconstructionInternal(586) cannot add 1 element to context";
                          goto LABEL_15;
                        case 587:
                          time_t v19 = "ASPFTLParseBufferToCxt: raidExpectedFailRMXReconstructionHost(587) cannot add 1 element to context";
                          goto LABEL_15;
                        case 588:
                          time_t v19 = "ASPFTLParseBufferToCxt: oslcGCinvalidations(588) cannot add 1 element to context";
                          goto LABEL_15;
                        case 589:
                          time_t v19 = "ASPFTLParseBufferToCxt: oslcGCActivateReason(589) cannot add 1 element to context";
                          goto LABEL_15;
                        default:
                          switch(v12)
                          {
                            case 590:
                              time_t v19 = "ASPFTLParseBufferToCxt: oslcLowCleanBandsUOnOff(590) cannot add 1 element to context";
                              goto LABEL_15;
                            case 591:
                              time_t v19 = "ASPFTLParseBufferToCxt: oslcTooManyGCMustOnOff(591) cannot add 1 element to context";
                              goto LABEL_15;
                            case 592:
                              time_t v19 = "ASPFTLParseBufferToCxt: oslcBaseHostWrites(592) cannot add 1 element to context";
                              goto LABEL_15;
                            case 593:
                              time_t v19 = "ASPFTLParseBufferToCxt: oslcBaseBandErases(593) cannot add 1 element to context";
                              goto LABEL_15;
                            case 594:
                              time_t v19 = "ASPFTLParseBufferToCxt: oslcBdrBands(594) cannot add 1 element to context";
                              goto LABEL_15;
                            case 595:
                              time_t v19 = "ASPFTLParseBufferToCxt: oslcBdrValid(595) cannot add 1 element to context";
                              goto LABEL_15;
                            case 596:
                              time_t v19 = "ASPFTLParseBufferToCxt: unexpectedBlanksInternal(596) cannot add 1 element to context";
                              goto LABEL_15;
                            case 597:
                              time_t v19 = "ASPFTLParseBufferToCxt: unexpectedBlanksOnRV(597) cannot add 1 element to context";
                              goto LABEL_15;
                            case 601:
                              time_t v19 = "ASPFTLParseBufferToCxt: waterfallLockSectors(601) cannot add 1 element to context";
                              goto LABEL_15;
                            case 602:
                              time_t v19 = "ASPFTLParseBufferToCxt: oslcGCActiveWrites(602) cannot add 1 element to context";
                              goto LABEL_15;
                            case 603:
                              time_t v19 = "ASPFTLParseBufferToCxt: chipIdTemperatureSample(603) cannot add 1 element to context";
                              goto LABEL_15;
                            case 604:
                              time_t v19 = "ASPFTLParseBufferToCxt: gcVPackWrites(604) cannot add 1 element to context";
                              goto LABEL_15;
                            case 605:
                              if ((_DWORD)v14 != 10) {
                                sub_100009E9C( "ASPFTLParseBufferToCxt: gcActiveReasons(605): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                              }
                              else {
                                unsigned int v20 = v14;
                              }
                              int v22 = "ASPFTLParseBufferToCxt: gcActiveReasons(605): Cannot add 10 elements to context";
                              goto LABEL_2247;
                            case 606:
                              time_t v19 = "ASPFTLParseBufferToCxt: eanMaxInitTimeMs(606) cannot add 1 element to context";
                              goto LABEL_15;
                            case 607:
                              time_t v19 = "ASPFTLParseBufferToCxt: eanMinToFirstReadTimeMs(607) cannot add 1 element to context";
                              goto LABEL_15;
                            case 608:
                              time_t v19 = "ASPFTLParseBufferToCxt: skinnyAPGMRetire(608) cannot add 1 element to context";
                              goto LABEL_15;
                            case 609:
                              time_t v19 = "ASPFTLParseBufferToCxt: unexpectedBlanksHost(609) cannot add 1 element to context";
                              goto LABEL_15;
                            case 610:
                              if ((_DWORD)v14 != 64) {
                                sub_100009E9C( "ASPFTLParseBufferToCxt: pcieAerCounters(610): (#64) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                              }
                              else {
                                unsigned int v20 = v14;
                              }
                              int v22 = "ASPFTLParseBufferToCxt: pcieAerCounters(610): Cannot add 64 elements to context";
                              goto LABEL_2247;
                            case 611:
                              time_t v19 = "ASPFTLParseBufferToCxt: fastHwToTlcBalance(611) cannot add 1 element to context";
                              goto LABEL_15;
                            case 612:
                              time_t v19 = "ASPFTLParseBufferToCxt: perfOSLCRuns(612) cannot add 1 element to context";
                              goto LABEL_15;
                            case 613:
                              time_t v19 = "ASPFTLParseBufferToCxt: slcDemandBurstWritesInGC(613) cannot add 1 element to context";
                              goto LABEL_15;
                            case 614:
                              time_t v19 = "ASPFTLParseBufferToCxt: slcDemandBurstWritesInTT(614) cannot add 1 element to context";
                              goto LABEL_15;
                            case 615:
                              time_t v19 = "ASPFTLParseBufferToCxt: slcDemandBurstWritesInNRP(615) cannot add 1 element to context";
                              goto LABEL_15;
                            case 616:
                              time_t v19 = "ASPFTLParseBufferToCxt: perfTotalDmaMb(616) cannot add 1 element to context";
                              goto LABEL_15;
                            case 617:
                              time_t v19 = "ASPFTLParseBufferToCxt: eanAvgInitTimeMs(617) cannot add 1 element to context";
                              goto LABEL_15;
                            case 618:
                              time_t v19 = "ASPFTLParseBufferToCxt: eanAvgToFirstReadTimeMs(618) cannot add 1 element to context";
                              goto LABEL_15;
                            case 619:
                              time_t v19 = "ASPFTLParseBufferToCxt: eanMaxBootReadTimeMs(619) cannot add 1 element to context";
                              goto LABEL_15;
                            case 620:
                              time_t v19 = "ASPFTLParseBufferToCxt: eanAvgBootReadTimeMs(620) cannot add 1 element to context";
                              goto LABEL_15;
                            case 621:
                              if ((_DWORD)v14 != 10) {
                                sub_100009E9C( "ASPFTLParseBufferToCxt: eanBootReadsHist(621): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                              }
                              else {
                                unsigned int v20 = v14;
                              }
                              int v22 = "ASPFTLParseBufferToCxt: eanBootReadsHist(621): Cannot add 10 elements to context";
                              goto LABEL_2247;
                            case 622:
                              time_t v19 = "ASPFTLParseBufferToCxt: maxBgInitTimeMs(622) cannot add 1 element to context";
                              goto LABEL_15;
                            case 623:
                              time_t v19 = "ASPFTLParseBufferToCxt: avgBgInitTimeMs(623) cannot add 1 element to context";
                              goto LABEL_15;
                            case 624:
                              if ((_DWORD)v14 != 16) {
                                sub_100009E9C( "ASPFTLParseBufferToCxt: clogFailReason(624): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                              }
                              else {
                                unsigned int v20 = v14;
                              }
                              int v22 = "ASPFTLParseBufferToCxt: clogFailReason(624): Cannot add 16 elements to context";
                              goto LABEL_2247;
                            case 625:
                              time_t v19 = "ASPFTLParseBufferToCxt: eanMinBootReadMBPerSec(625) cannot add 1 element to context";
                              goto LABEL_15;
                            case 626:
                              time_t v19 = "ASPFTLParseBufferToCxt: eanAvgBootReadMBPerSec(626) cannot add 1 element to context";
                              goto LABEL_15;
                            case 627:
                              time_t v19 = "ASPFTLParseBufferToCxt: minSkinnyPECycles(627) cannot add 1 element to context";
                              goto LABEL_15;
                            case 628:
                              time_t v19 = "ASPFTLParseBufferToCxt: maxSkinnyPECycles(628) cannot add 1 element to context";
                              goto LABEL_15;
                            case 629:
                              time_t v19 = "ASPFTLParseBufferToCxt: averageSkinnyPECycles(629) cannot add 1 element to context";
                              goto LABEL_15;
                            case 630:
                              if ((_DWORD)v14 != 6) {
                                sub_100009E9C( "ASPFTLParseBufferToCxt: raidSuccessfulRecoEAN(630): (#6) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                              }
                              else {
                                unsigned int v20 = v14;
                              }
                              int v22 = "ASPFTLParseBufferToCxt: raidSuccessfulRecoEAN(630): Cannot add 6 elements to context";
                              goto LABEL_2247;
                            case 631:
                              if ((_DWORD)v14 != 6) {
                                sub_100009E9C( "ASPFTLParseBufferToCxt: raidFailedRecoEAN(631): (#6) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                              }
                              else {
                                unsigned int v20 = v14;
                              }
                              int v22 = "ASPFTLParseBufferToCxt: raidFailedRecoEAN(631): Cannot add 6 elements to context";
                              goto LABEL_2247;
                            case 632:
                              if ((_DWORD)v14 != 6) {
                                sub_100009E9C( "ASPFTLParseBufferToCxt: eanFirstReadMode(632): (#6) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                              }
                              else {
                                unsigned int v20 = v14;
                              }
                              int v22 = "ASPFTLParseBufferToCxt: eanFirstReadMode(632): Cannot add 6 elements to context";
                              goto LABEL_2247;
                            case 635:
                              time_t v19 = "ASPFTLParseBufferToCxt: oslcHwGC(635) cannot add 1 element to context";
                              goto LABEL_15;
                            case 636:
                              time_t v19 = "ASPFTLParseBufferToCxt: oslcHwTT(636) cannot add 1 element to context";
                              goto LABEL_15;
                            case 637:
                              time_t v19 = "ASPFTLParseBufferToCxt: oslcHwNRP(637) cannot add 1 element to context";
                              goto LABEL_15;
                            case 638:
                              if ((_DWORD)v14 != 10) {
                                sub_100009E9C( "ASPFTLParseBufferToCxt: oslcDemandBurstSize(638): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                              }
                              else {
                                unsigned int v20 = v14;
                              }
                              int v22 = "ASPFTLParseBufferToCxt: oslcDemandBurstSize(638): Cannot add 10 elements to context";
                              goto LABEL_2247;
                            case 639:
                              time_t v19 = "ASPFTLParseBufferToCxt: raidReconstructSuccessBandFlowOslc(639) cannot add 1 element to context";
                              goto LABEL_15;
                            case 640:
                              time_t v19 = "ASPFTLParseBufferToCxt: raidReconstructFailBandFlowOslc(640) cannot add 1 element to context";
                              goto LABEL_15;
                            case 641:
                              time_t v19 = "ASPFTLParseBufferToCxt: raidFailSectors(641) cannot add 1 element to context";
                              goto LABEL_15;
                            case 642:
                              time_t v19 = "ASPFTLParseBufferToCxt: eanFailSectors(642) cannot add 1 element to context";
                              goto LABEL_15;
                            case 643:
                              time_t v19 = "ASPFTLParseBufferToCxt: bdrTimeMode(643) cannot add 1 element to context";
                              goto LABEL_15;
                            case 644:
                              time_t v19 = "ASPFTLParseBufferToCxt: raidParityNotSavedP(644) cannot add 1 element to context";
                              goto LABEL_15;
                            case 645:
                              time_t v19 = "ASPFTLParseBufferToCxt: raidParityNotSavedQ(645) cannot add 1 element to context";
                              goto LABEL_15;
                            case 646:
                              time_t v19 = "ASPFTLParseBufferToCxt: raidParityInvalid(646) cannot add 1 element to context";
                              goto LABEL_15;
                            case 647:
                              time_t v19 = "ASPFTLParseBufferToCxt: raidParityUnknown(647) cannot add 1 element to context";
                              goto LABEL_15;
                            case 648:
                              time_t v19 = "ASPFTLParseBufferToCxt: raidParityUnmapped(648) cannot add 1 element to context";
                              goto LABEL_15;
                            case 649:
                              time_t v19 = "ASPFTLParseBufferToCxt: raidParityGCUnc(649) cannot add 1 element to context";
                              goto LABEL_15;
                            case 657:
                              time_t v19 = "ASPFTLParseBufferToCxt: AbortSkip_MPBXProbational(657) cannot add 1 element to context";
                              goto LABEL_15;
                            case 659:
                              time_t v19 = "ASPFTLParseBufferToCxt: raidVerificationReads(659) cannot add 1 element to context";
                              goto LABEL_15;
                            case 666:
                              time_t v19 = "ASPFTLParseBufferToCxt: nofDies(666) cannot add 1 element to context";
                              goto LABEL_15;
                            case 671:
                              time_t v19 = "ASPFTLParseBufferToCxt: skinnyBandsNum(671) cannot add 1 element to context";
                              goto LABEL_15;
                            case 672:
                              time_t v19 = "ASPFTLParseBufferToCxt: skinnyBandsNumDips(672) cannot add 1 element to context";
                              goto LABEL_15;
                            case 674:
                              if ((_DWORD)v14 != 8) {
                                sub_100009E9C( "ASPFTLParseBufferToCxt: oslcNoVotesHw(674): (#8) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                              }
                              else {
                                unsigned int v20 = v14;
                              }
                              int v22 = "ASPFTLParseBufferToCxt: oslcNoVotesHw(674): Cannot add 8 elements to context";
                              goto LABEL_2247;
                            case 675:
                              time_t v19 = "ASPFTLParseBufferToCxt: totalLbas(675) cannot add 1 element to context";
                              goto LABEL_15;
                            case 676:
                              time_t v19 = "ASPFTLParseBufferToCxt: bdrHostPingExtra(676) cannot add 1 element to context";
                              goto LABEL_15;
                            case 677:
                              time_t v19 = "ASPFTLParseBufferToCxt: magazineInstanceMeta(677) cannot add 1 element to context";
                              goto LABEL_15;
                            default:
                              switch(v12)
                              {
                                case 680:
                                  if ((_DWORD)v14 != 3) {
                                    sub_100009E9C( "ASPFTLParseBufferToCxt: magazineFWVersion(680): (#3) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: magazineFWVersion(680): Cannot add 3 elements to context";
                                  goto LABEL_2247;
                                case 681:
                                  time_t v19 = "ASPFTLParseBufferToCxt: raidReconstructFailPMXUnsup(681) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 682:
                                  time_t v19 = "ASPFTLParseBufferToCxt: raidReconstructFailBMXUnsup(682) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 683:
                                  time_t v19 = "ASPFTLParseBufferToCxt: iBootNANDResets(683) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 684:
                                  time_t v19 = "ASPFTLParseBufferToCxt: pcieClkreqHighTimeout(684) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 687:
                                  if ((_DWORD)v14 != 3) {
                                    sub_100009E9C( "ASPFTLParseBufferToCxt: cbdrInitSent(687): (#3) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: cbdrInitSent(687): Cannot add 3 elements to context";
                                  goto LABEL_2247;
                                case 688:
                                  time_t v19 = "ASPFTLParseBufferToCxt: cbdrPauseSent(688) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 689:
                                  time_t v19 = "ASPFTLParseBufferToCxt: cbdrResumeSent(689) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 690:
                                  time_t v19 = "ASPFTLParseBufferToCxt: cbdrGetResultSent(690) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 691:
                                  time_t v19 = "ASPFTLParseBufferToCxt: cbdrEarlyExits(691) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 694:
                                  if ((_DWORD)v14 != 10) {
                                    sub_100009E9C( "ASPFTLParseBufferToCxt: cbdrRefreshGrades(694): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: cbdrRefreshGrades(694): Cannot add 10 elements to context";
                                  goto LABEL_2247;
                                case 695:
                                  time_t v19 = "ASPFTLParseBufferToCxt: cbdrNotEnoughReads(695) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 696:
                                  time_t v19 = "ASPFTLParseBufferToCxt: cbdrAborts(696) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 697:
                                  time_t v19 = "ASPFTLParseBufferToCxt: TurboRaidHostClassifications(697) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 698:
                                  time_t v19 = "ASPFTLParseBufferToCxt: TurboRaidInternalClassifications(698) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 699:
                                  time_t v19 = "ASPFTLParseBufferToCxt: cbdrFullyDone(699) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 702:
                                  if ((_DWORD)v14 != 32) {
                                    sub_100009E9C( "ASPFTLParseBufferToCxt: vcurve(702): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: vcurve(702): Cannot add 32 elements to context";
                                  goto LABEL_2247;
                                case 703:
                                  if ((_DWORD)v14 != 12) {
                                    sub_100009E9C( "ASPFTLParseBufferToCxt: injDepth(703): (#12) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: injDepth(703): Cannot add 12 elements to context";
                                  goto LABEL_2247;
                                case 704:
                                  time_t v19 = "ASPFTLParseBufferToCxt: logical_disk_occupied_promiles(704) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 711:
                                  time_t v19 = "ASPFTLParseBufferToCxt: raidPrevFailedReconstructSkip(711) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 712:
                                  time_t v19 = "ASPFTLParseBufferToCxt: TurboRaidSuccessfulHostAuxReads(712) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 713:
                                  time_t v19 = "ASPFTLParseBufferToCxt: TurboRaidSuccessfulInternalAuxReads(713) cannot add 1 el"
                                        "ement to context";
                                  goto LABEL_15;
                                case 714:
                                  time_t v19 = "ASPFTLParseBufferToCxt: turboRaidClassificationReliabilityHost(714) cannot add 1"
                                        " element to context";
                                  goto LABEL_15;
                                case 715:
                                  if ((sub_100019B70( a1,  "turboRaidClassificationReliabilityInternal",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                    goto LABEL_16;
                                  }
                                  time_t v19 = "ASPFTLParseBufferToCxt: turboRaidClassificationReliabilityInternal(715) cannot a"
                                        "dd 1 element to context";
                                  goto LABEL_15;
                                case 716:
                                  time_t v19 = "ASPFTLParseBufferToCxt: turboRaidClassificationQualityHost(716) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 717:
                                  time_t v19 = "ASPFTLParseBufferToCxt: turboRaidClassificationQualityInternal(717) cannot add 1"
                                        " element to context";
                                  goto LABEL_15;
                                case 719:
                                  time_t v19 = "ASPFTLParseBufferToCxt: skinnyBandErases(719) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 721:
                                  time_t v19 = "ASPFTLParseBufferToCxt: gcPDusterDestinations(721) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 722:
                                  time_t v19 = "ASPFTLParseBufferToCxt: gcPDusterWrites(722) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 730:
                                  time_t v19 = "ASPFTLParseBufferToCxt: rvFails(730) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 737:
                                  time_t v19 = "ASPFTLParseBufferToCxt: TurboRaidFailedHostAuxReads(737) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 738:
                                  time_t v19 = "ASPFTLParseBufferToCxt: TurboRaidFailedInternalAuxReads(738) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 741:
                                  time_t v19 = "ASPFTLParseBufferToCxt: autoSkipTriggers(741) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 742:
                                  time_t v19 = "ASPFTLParseBufferToCxt: autoSkipPlanes(742) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 744:
                                  if ((_DWORD)v14 != 8) {
                                    sub_100009E9C( "ASPFTLParseBufferToCxt: raidReconstructDurationHisto(744): (#8) cfg elements != (% d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: raidReconstructDurationHisto(744): Cannot add 8 elements to context";
                                  goto LABEL_2247;
                                case 745:
                                  if ((_DWORD)v14 != 8) {
                                    sub_100009E9C( "ASPFTLParseBufferToCxt: failsOnReconstructHisto(745): (#8) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: failsOnReconstructHisto(745): Cannot add 8 elements to context";
                                  goto LABEL_2247;
                                case 746:
                                  time_t v19 = "ASPFTLParseBufferToCxt: bandKill_userFlattenExcessive(746) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 747:
                                  time_t v19 = "ASPFTLParseBufferToCxt: bandKill_IntFlattenExcessive(747) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 748:
                                  time_t v19 = "ASPFTLParseBufferToCxt: bandKill_userFlattenBalance(748) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 749:
                                  time_t v19 = "ASPFTLParseBufferToCxt: bandKill_intFlattenBalance(749) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 750:
                                  time_t v19 = "ASPFTLParseBufferToCxt: bandKill_formatVertExcessive(750) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 751:
                                  time_t v19 = "ASPFTLParseBufferToCxt: bandKill_formatVertBalance(751) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 753:
                                  time_t v19 = "ASPFTLParseBufferToCxt: cbdrNumSlowRefreshes(753) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 754:
                                  time_t v19 = "ASPFTLParseBufferToCxt: cbdrNumFastRefreshes(754) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 755:
                                  time_t v19 = "ASPFTLParseBufferToCxt: cbdrTotalRefreshValidity(755) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 756:
                                  if ((_DWORD)v14 != 9) {
                                    sub_100009E9C( "ASPFTLParseBufferToCxt: cbdrRefreshedAges(756): (#9) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: cbdrRefreshedAges(756): Cannot add 9 elements to context";
                                  goto LABEL_2247;
                                case 758:
                                  time_t v19 = "ASPFTLParseBufferToCxt: cbdrSkippedBlocks(758) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 759:
                                  if ((_DWORD)v14 != 5) {
                                    sub_100009E9C( "ASPFTLParseBufferToCxt: cbdrScanPct(759): (#5) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: cbdrScanPct(759): Cannot add 5 elements to context";
                                  goto LABEL_2247;
                                case 760:
                                  if ((sub_100019B70( a1,  "raidSuccessfulBMXReconstructionInternal",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                    goto LABEL_16;
                                  }
                                  time_t v19 = "ASPFTLParseBufferToCxt: raidSuccessfulBMXReconstructionInternal(760) cannot add "
                                        "1 element to context";
                                  goto LABEL_15;
                                case 761:
                                  time_t v19 = "ASPFTLParseBufferToCxt: raidSuccessfulBMXReconstructionHost(761) cannot add 1 el"
                                        "ement to context";
                                  goto LABEL_15;
                                case 762:
                                  time_t v19 = "ASPFTLParseBufferToCxt: raidFailedBMXReconstructionInternal(762) cannot add 1 el"
                                        "ement to context";
                                  goto LABEL_15;
                                case 763:
                                  time_t v19 = "ASPFTLParseBufferToCxt: raidFailedBMXReconstructionHost(763) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 764:
                                  time_t v19 = "ASPFTLParseBufferToCxt: ricSPRVFail(764) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 765:
                                  time_t v19 = "ASPFTLParseBufferToCxt: ricMPRVFail(765) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 767:
                                  if ((_DWORD)v14 != 10) {
                                    sub_100009E9C( "ASPFTLParseBufferToCxt: cbdrRefreshGradesSLC(767): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: cbdrRefreshGradesSLC(767): Cannot add 10 elements to context";
                                  goto LABEL_2247;
                                case 768:
                                  if ((_DWORD)v14 != 9) {
                                    sub_100009E9C( "ASPFTLParseBufferToCxt: cbdrRefreshedAgesSLC(768): (#9) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: cbdrRefreshedAgesSLC(768): Cannot add 9 elements to context";
                                  goto LABEL_2247;
                                case 769:
                                  if ((_DWORD)v14 != 5) {
                                    sub_100009E9C( "ASPFTLParseBufferToCxt: cbdrScanPctSLC(769): (#5) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: cbdrScanPctSLC(769): Cannot add 5 elements to context";
                                  goto LABEL_2247;
                                case 770:
                                  if ((_DWORD)v14 != 8) {
                                    sub_100009E9C( "ASPFTLParseBufferToCxt: cpuBurstLength(770): (#8) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: cpuBurstLength(770): Cannot add 8 elements to context";
                                  goto LABEL_2247;
                                case 771:
                                  time_t v19 = "ASPFTLParseBufferToCxt: autoSkipRaidRecoFail(771) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 772:
                                  if ((_DWORD)v14 != 32) {
                                    sub_100009E9C( "ASPFTLParseBufferToCxt: dmReasonsSlc(772): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: dmReasonsSlc(772): Cannot add 32 elements to context";
                                  goto LABEL_2247;
                                case 773:
                                  if ((_DWORD)v14 != 32) {
                                    sub_100009E9C( "ASPFTLParseBufferToCxt: dmReasonsTlc(773): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: dmReasonsTlc(773): Cannot add 32 elements to context";
                                  goto LABEL_2247;
                                case 774:
                                  time_t v19 = "ASPFTLParseBufferToCxt: raidReconstructFailBMXAbort(774) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 775:
                                  time_t v19 = "ASPFTLParseBufferToCxt: bandKill_fatBindingNoBlocks(775) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 776:
                                  time_t v19 = "ASPFTLParseBufferToCxt: bandKill_fatBindingFewBlocks(776) cannot add 1 element to context";
                                  goto LABEL_15;
                                default:
                                  switch(v12)
                                  {
                                    case 777:
                                      time_t v19 = "ASPFTLParseBufferToCxt: numBadBootBlocks(777) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 778:
                                      time_t v19 = "ASPFTLParseBufferToCxt: snapshotCPUHigh(778) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 779:
                                      time_t v19 = "ASPFTLParseBufferToCxt: snapshotCPULow(779) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 780:
                                      time_t v19 = "ASPFTLParseBufferToCxt: gcWithoutBMs(780) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 781:
                                      if ((_DWORD)v14 != 10) {
                                        sub_100009E9C( "ASPFTLParseBufferToCxt: gcSearchTimeHistory(781): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: gcSearchTimeHistory(781): Cannot add 10 elements to context";
                                      goto LABEL_2247;
                                    case 785:
                                      if ((_DWORD)v14 != 16) {
                                        sub_100009E9C( "ASPFTLParseBufferToCxt: gcSearchPortion(785): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: gcSearchPortion(785): Cannot add 16 elements to context";
                                      goto LABEL_2247;
                                    case 786:
                                      time_t v19 = "ASPFTLParseBufferToCxt: raidReconstructFailBmxMp(786) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 787:
                                      time_t v19 = "ASPFTLParseBufferToCxt: raidReconstructFailBmx(787) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 788:
                                      time_t v19 = "ASPFTLParseBufferToCxt: raidReconstructFailBMXUECC(788) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 789:
                                      time_t v19 = "ASPFTLParseBufferToCxt: raidReconstructFailBMXBlank(789) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 790:
                                      time_t v19 = "ASPFTLParseBufferToCxt: raidPrevFailedReconstructBmxMpSkip(790) cannot add 1"
                                            " element to context";
                                      goto LABEL_15;
                                    case 792:
                                      time_t v19 = "ASPFTLParseBufferToCxt: numTLCFatBands(792) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 793:
                                      time_t v19 = "ASPFTLParseBufferToCxt: fatValidity(793) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 794:
                                      time_t v19 = "ASPFTLParseBufferToCxt: fatTotal(794) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 798:
                                      if ((_DWORD)v14 != 4) {
                                        sub_100009E9C( "ASPFTLParseBufferToCxt: raidBMXFailP(798): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: raidBMXFailP(798): Cannot add 4 elements to context";
                                      goto LABEL_2247;
                                    case 799:
                                      if ((_DWORD)v14 != 4) {
                                        sub_100009E9C( "ASPFTLParseBufferToCxt: raidBMXFailUECC(799): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: raidBMXFailUECC(799): Cannot add 4 elements to context";
                                      goto LABEL_2247;
                                    case 804:
                                      if ((_DWORD)v14 != 4) {
                                        sub_100009E9C( "ASPFTLParseBufferToCxt: raidBMXFailNoSPBX(804): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: raidBMXFailNoSPBX(804): Cannot add 4 elements to context";
                                      goto LABEL_2247;
                                    case 806:
                                      if ((_DWORD)v14 != 4) {
                                        sub_100009E9C( "ASPFTLParseBufferToCxt: raidBMXFailBlank(806): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: raidBMXFailBlank(806): Cannot add 4 elements to context";
                                      goto LABEL_2247;
                                    case 809:
                                      if ((_DWORD)v14 != 4) {
                                        sub_100009E9C( "ASPFTLParseBufferToCxt: raidBMXFailUnsup(809): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: raidBMXFailUnsup(809): Cannot add 4 elements to context";
                                      goto LABEL_2247;
                                    case 811:
                                      if ((_DWORD)v14 != 4) {
                                        sub_100009E9C( "ASPFTLParseBufferToCxt: raidBMXFailMpSkip(811): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: raidBMXFailMpSkip(811): Cannot add 4 elements to context";
                                      goto LABEL_2247;
                                    case 812:
                                      if ((_DWORD)v14 != 4) {
                                        sub_100009E9C( "ASPFTLParseBufferToCxt: raidBMXFailAbort(812): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: raidBMXFailAbort(812): Cannot add 4 elements to context";
                                      goto LABEL_2247;
                                    case 813:
                                      time_t v19 = "ASPFTLParseBufferToCxt: TurboRaidIsEnabled(813) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 814:
                                      if ((_DWORD)v14 != 4) {
                                        sub_100009E9C( "ASPFTLParseBufferToCxt: raidBMXFailOther(814): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: raidBMXFailOther(814): Cannot add 4 elements to context";
                                      goto LABEL_2247;
                                    case 815:
                                      if ((_DWORD)v14 != 4) {
                                        sub_100009E9C( "ASPFTLParseBufferToCxt: raidBMXSuccess(815): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: raidBMXSuccess(815): Cannot add 4 elements to context";
                                      goto LABEL_2247;
                                    case 816:
                                      time_t v19 = "ASPFTLParseBufferToCxt: skinnyBandsExtraDip(816) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 821:
                                      time_t v19 = "ASPFTLParseBufferToCxt: writeAmp(821) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 822:
                                      time_t v19 = "ASPFTLParseBufferToCxt: ricMaxClogOnlyPages(822) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 823:
                                      if ((_DWORD)v14 != 3) {
                                        sub_100009E9C( "ASPFTLParseBufferToCxt: readClassifyStatusesHisto(823): (#3) cfg elements !=(%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: readClassifyStatusesHisto(823): Cannot add 3 elements to context";
                                      goto LABEL_2247;
                                    case 824:
                                      if ((_DWORD)v14 != 10) {
                                        sub_100009E9C( "ASPFTLParseBufferToCxt: readWithAuxStatusesHisto(824): (#10) cfg elements !=(%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: readWithAuxStatusesHisto(824): Cannot add 10 elements to context";
                                      goto LABEL_2247;
                                    case 825:
                                      if ((_DWORD)v14 != 10) {
                                        sub_100009E9C( "ASPFTLParseBufferToCxt: readReconstructStatusesHisto(825): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: readReconstructStatusesHisto(825): Cannot add 10 ele"
                                            "ments to context";
                                      goto LABEL_2247;
                                    case 826:
                                      time_t v19 = "ASPFTLParseBufferToCxt: bdrBackupChecks(826) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 827:
                                      time_t v19 = "ASPFTLParseBufferToCxt: ricExceedClogOnlyPagesTH(827) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 828:
                                      time_t v19 = "ASPFTLParseBufferToCxt: numDipFailures(828) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 831:
                                      time_t v19 = "ASPFTLParseBufferToCxt: prefetchNextRange(831) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 862:
                                      time_t v19 = "ASPFTLParseBufferToCxt: raidSuccessfulSkip(862) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 863:
                                      time_t v19 = "ASPFTLParseBufferToCxt: raidFailedSkip(863) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 864:
                                      time_t v19 = "ASPFTLParseBufferToCxt: raidSkipAttempts(864) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 865:
                                      if ((_DWORD)v14 != 16) {
                                        sub_100009E9C( "ASPFTLParseBufferToCxt: timeOfThrottlingPerLevel(865): (#16) cfg elements !=(%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: timeOfThrottlingPerLevel(865): Cannot add 16 elements to context";
                                      goto LABEL_2247;
                                    case 866:
                                      if ((_DWORD)v14 != 16) {
                                        sub_100009E9C( "ASPFTLParseBufferToCxt: timeOfThrottlingPerReadLevel(866): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: timeOfThrottlingPerReadLevel(866): Cannot add 16 ele"
                                            "ments to context";
                                      goto LABEL_2247;
                                    case 867:
                                      if ((_DWORD)v14 != 16) {
                                        sub_100009E9C( "ASPFTLParseBufferToCxt: timeOfThrottlingPerWriteLevel(867): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: timeOfThrottlingPerWriteLevel(867): Cannot add 16 el"
                                            "ements to context";
                                      goto LABEL_2247;
                                    case 868:
                                      if ((_DWORD)v14 != 32) {
                                        sub_100009E9C( "ASPFTLParseBufferToCxt: dmReasonsSlc_1bc(868): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: dmReasonsSlc_1bc(868): Cannot add 32 elements to context";
                                      goto LABEL_2247;
                                    case 869:
                                      if ((_DWORD)v14 != 32) {
                                        sub_100009E9C( "ASPFTLParseBufferToCxt: dmReasonsTlc_1bc(869): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: dmReasonsTlc_1bc(869): Cannot add 32 elements to context";
                                      goto LABEL_2247;
                                    case 870:
                                      if ((_DWORD)v14 != 32) {
                                        sub_100009E9C( "ASPFTLParseBufferToCxt: dmReasonsSlc_1bc_he(870): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: dmReasonsSlc_1bc_he(870): Cannot add 32 elements to context";
                                      goto LABEL_2247;
                                    case 871:
                                      if ((_DWORD)v14 != 32) {
                                        sub_100009E9C( "ASPFTLParseBufferToCxt: dmReasonsTlc_1bc_he(871): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: dmReasonsTlc_1bc_he(871): Cannot add 32 elements to context";
                                      goto LABEL_2247;
                                    case 876:
                                      if ((_DWORD)v14 != 32) {
                                        sub_100009E9C( "ASPFTLParseBufferToCxt: dmReasonsSlc_mbc(876): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: dmReasonsSlc_mbc(876): Cannot add 32 elements to context";
                                      goto LABEL_2247;
                                    case 877:
                                      if ((_DWORD)v14 != 32) {
                                        sub_100009E9C( "ASPFTLParseBufferToCxt: dmReasonsTlc_mbc(877): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: dmReasonsTlc_mbc(877): Cannot add 32 elements to context";
                                      goto LABEL_2247;
                                    case 883:
                                      time_t v19 = "ASPFTLParseBufferToCxt: clogEmptyProgramms(883) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 884:
                                      time_t v19 = "ASPFTLParseBufferToCxt: oslcHwCloseBand(884) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 891:
                                      if ((_DWORD)v14 != 2) {
                                        sub_100009E9C( "ASPFTLParseBufferToCxt: turboRaidSuccessAuxPartition(891): (#2) cfg elements ! = (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: turboRaidSuccessAuxPartition(891): Cannot add 2 elements to context";
                                      goto LABEL_2247;
                                    case 892:
                                      if ((_DWORD)v14 != 2) {
                                        sub_100009E9C( "ASPFTLParseBufferToCxt: turboRaidFailAuxPartition(892): (#2) cfg elements !=(%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: turboRaidFailAuxPartition(892): Cannot add 2 elements to context";
                                      goto LABEL_2247;
                                    case 893:
                                      if ((_DWORD)v14 != 2) {
                                        sub_100009E9C( "ASPFTLParseBufferToCxt: turboRaidClassifyQualPartition(893): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: turboRaidClassifyQualPartition(893): Cannot add 2 el"
                                            "ements to context";
                                      goto LABEL_2247;
                                    case 894:
                                      if ((_DWORD)v14 != 2) {
                                        sub_100009E9C( "ASPFTLParseBufferToCxt: turboRaidClassifyRelPartition(894): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: turboRaidClassifyRelPartition(894): Cannot add 2 ele"
                                            "ments to context";
                                      goto LABEL_2247;
                                    case 895:
                                      time_t v19 = "ASPFTLParseBufferToCxt: IND_pool_freeMinSilo(895) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 896:
                                      time_t v19 = "ASPFTLParseBufferToCxt: autoSweepBlocks(896) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 897:
                                      if ((_DWORD)v14 != 16) {
                                        sub_100009E9C( "ASPFTLParseBufferToCxt: wcWrFragSizes(897): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: wcWrFragSizes(897): Cannot add 16 elements to context";
                                      goto LABEL_2247;
                                    case 898:
                                      if ((_DWORD)v14 != 16) {
                                        sub_100009E9C( "ASPFTLParseBufferToCxt: indStateAcrossGcDidNoL(898): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: indStateAcrossGcDidNoL(898): Cannot add 16 elements to context";
                                      goto LABEL_2247;
                                    case 899:
                                      if ((_DWORD)v14 != 16) {
                                        sub_100009E9C( "ASPFTLParseBufferToCxt: indStateAcrossGcDidL(899): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: indStateAcrossGcDidL(899): Cannot add 16 elements to context";
                                      goto LABEL_2247;
                                    case 900:
                                      time_t v19 = "ASPFTLParseBufferToCxt: turboRaidNoClassifyDueToWasRetire(900) cannot add 1 "
                                            "element to context";
                                      goto LABEL_15;
                                    case 901:
                                      time_t v19 = "ASPFTLParseBufferToCxt: turboRaidNoClassifyDueToOpenBand(901) cannot add 1 e"
                                            "lement to context";
                                      goto LABEL_15;
                                    case 902:
                                      if ((sub_100019B70( a1,  "turboRaidNoClassifyDueToQualityBlock",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                        goto LABEL_16;
                                      }
                                      time_t v19 = "ASPFTLParseBufferToCxt: turboRaidNoClassifyDueToQualityBlock(902) cannot add"
                                            " 1 element to context";
                                      goto LABEL_15;
                                    case 903:
                                      time_t v19 = "ASPFTLParseBufferToCxt: turboRaidGbbOpenBand(903) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 904:
                                      time_t v19 = "ASPFTLParseBufferToCxt: turboRaidGbbShouldRetireOnRefresh(904) cannot add 1 "
                                            "element to context";
                                      goto LABEL_15;
                                    case 905:
                                      if ((_DWORD)v14 != 16) {
                                        sub_100009E9C( "ASPFTLParseBufferToCxt: turboRaidRelPerBlock(905): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: turboRaidRelPerBlock(905): Cannot add 16 elements to context";
                                      goto LABEL_2247;
                                    case 906:
                                      if ((_DWORD)v14 != 16) {
                                        sub_100009E9C( "ASPFTLParseBufferToCxt: turboRaidRelBetweenRefreshesPerBlock(906): (#16) cfg e lements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      if ((sub_100019B70( a1,  "turboRaidRelBetweenRefreshesPerBlock_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                        goto LABEL_14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: turboRaidRelBetweenRefreshesPerBlock(906): Cannot ad"
                                            "d 16 elements to context";
                                      goto LABEL_2247;
                                    default:
                                      if (v12 <= 1039)
                                      {
                                        switch(v12)
                                        {
                                          case 907:
                                            if ((_DWORD)v14 != 16) {
                                              sub_100009E9C( "ASPFTLParseBufferToCxt: turboRaidMaxRelBetweenRefreshesPerBlock(907): (# 16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((sub_100019B70( a1,  "turboRaidMaxRelBetweenRefreshesPerBlock_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: turboRaidMaxRelBetweenRefreshesPerBlock(907): "
                                                  "Cannot add 16 elements to context";
                                            goto LABEL_2247;
                                          case 908:
                                            if ((_DWORD)v14 != 16) {
                                              sub_100009E9C( "ASPFTLParseBufferToCxt: turboRaidMinRelBetweenRefreshesPerBlock(908): (# 16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((sub_100019B70( a1,  "turboRaidMinRelBetweenRefreshesPerBlock_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: turboRaidMinRelBetweenRefreshesPerBlock(908): "
                                                  "Cannot add 16 elements to context";
                                            goto LABEL_2247;
                                          case 909:
                                          case 910:
                                          case 911:
                                          case 912:
                                          case 913:
                                          case 914:
                                          case 915:
                                          case 916:
                                          case 917:
                                          case 924:
                                          case 925:
                                          case 926:
                                          case 927:
                                          case 928:
                                          case 929:
                                          case 936:
                                          case 941:
                                          case 945:
                                          case 946:
                                          case 947:
                                          case 949:
                                          case 950:
                                          case 952:
                                          case 954:
                                          case 955:
                                          case 956:
                                          case 957:
                                          case 958:
                                          case 959:
                                          case 960:
                                          case 963:
                                          case 964:
                                          case 965:
                                          case 966:
                                          case 968:
                                          case 969:
                                          case 970:
                                            goto LABEL_2110;
                                          case 918:
                                            if ((_DWORD)v14 != 16) {
                                              sub_100009E9C( "ASPFTLParseBufferToCxt: turboRaidMaxCyclesBetweenRel(918): (#16) cfg ele ments != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((sub_100019B70( a1,  "turboRaidMaxCyclesBetweenRel_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: turboRaidMaxCyclesBetweenRel(918): Cannot add "
                                                  "16 elements to context";
                                            goto LABEL_2247;
                                          case 919:
                                            if ((_DWORD)v14 != 16) {
                                              sub_100009E9C( "ASPFTLParseBufferToCxt: turboRaidMinCyclesBetweenRel(919): (#16) cfg ele ments != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((sub_100019B70( a1,  "turboRaidMinCyclesBetweenRel_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: turboRaidMinCyclesBetweenRel(919): Cannot add "
                                                  "16 elements to context";
                                            goto LABEL_2247;
                                          case 920:
                                            if ((_DWORD)v14 != 16) {
                                              sub_100009E9C( "ASPFTLParseBufferToCxt: turboRaidAuxPerBlock(920): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: turboRaidAuxPerBlock(920): Cannot add 16 elements to context";
                                            goto LABEL_2247;
                                          case 921:
                                            if ((_DWORD)v14 != 16) {
                                              sub_100009E9C( "ASPFTLParseBufferToCxt: turboRaidAuxBetweenRefreshesPerBlock(921): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((sub_100019B70( a1,  "turboRaidAuxBetweenRefreshesPerBlock_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: turboRaidAuxBetweenRefreshesPerBlock(921): Can"
                                                  "not add 16 elements to context";
                                            goto LABEL_2247;
                                          case 922:
                                            time_t v19 = "ASPFTLParseBufferToCxt: turboRaidRelLockMark(922) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 923:
                                            time_t v19 = "ASPFTLParseBufferToCxt: turboRaidAuxLockMark(923) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 930:
                                            if ((_DWORD)v14 != 16) {
                                              sub_100009E9C( "ASPFTLParseBufferToCxt: turboRaidMaxCyclesBetweenAux(930): (#16) cfg ele ments != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((sub_100019B70( a1,  "turboRaidMaxCyclesBetweenAux_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: turboRaidMaxCyclesBetweenAux(930): Cannot add "
                                                  "16 elements to context";
                                            goto LABEL_2247;
                                          case 931:
                                            if ((_DWORD)v14 != 16) {
                                              sub_100009E9C( "ASPFTLParseBufferToCxt: turboRaidMinCyclesBetweenAux(931): (#16) cfg ele ments != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((sub_100019B70( a1,  "turboRaidMinCyclesBetweenAux_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: turboRaidMinCyclesBetweenAux(931): Cannot add "
                                                  "16 elements to context";
                                            goto LABEL_2247;
                                          case 932:
                                            if ((_DWORD)v14 != 16) {
                                              sub_100009E9C( "ASPFTLParseBufferToCxt: turboRaidLastRelPECycles(932): (#16) cfg element s != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: turboRaidLastRelPECycles(932): Cannot add 16 e"
                                                  "lements to context";
                                            goto LABEL_2247;
                                          case 933:
                                            if ((_DWORD)v14 != 16) {
                                              sub_100009E9C( "ASPFTLParseBufferToCxt: turboRaidRelQualPECycles(933): (#16) cfg element s != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: turboRaidRelQualPECycles(933): Cannot add 16 e"
                                                  "lements to context";
                                            goto LABEL_2247;
                                          case 934:
                                            if ((_DWORD)v14 != 16) {
                                              sub_100009E9C( "ASPFTLParseBufferToCxt: turboRaidLastAuxPECycles(934): (#16) cfg element s != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: turboRaidLastAuxPECycles(934): Cannot add 16 e"
                                                  "lements to context";
                                            goto LABEL_2247;
                                          case 935:
                                            if ((_DWORD)v14 != 16) {
                                              sub_100009E9C( "ASPFTLParseBufferToCxt: turboRaidAuxQualPECycles(935): (#16) cfg element s != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: turboRaidAuxQualPECycles(935): Cannot add 16 e"
                                                  "lements to context";
                                            goto LABEL_2247;
                                          case 937:
                                            time_t v19 = "ASPFTLParseBufferToCxt: turboRaidPEFailAfterRel(937) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 938:
                                            time_t v19 = "ASPFTLParseBufferToCxt: turboRaidPEFailAfterAux(938) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 939:
                                            time_t v19 = "ASPFTLParseBufferToCxt: dvfmVotesCPU(939) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 940:
                                            time_t v19 = "ASPFTLParseBufferToCxt: dvfmVotesBandwidth(940) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 942:
                                            time_t v19 = "ASPFTLParseBufferToCxt: maxSLCEndurance(942) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 943:
                                            time_t v19 = "ASPFTLParseBufferToCxt: maxMixedEndurance(943) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 944:
                                            time_t v19 = "ASPFTLParseBufferToCxt: maxNativeEndurance(944) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 948:
                                            if ((_DWORD)v14 != 40) {
                                              sub_100009E9C( "ASPFTLParseBufferToCxt: assertHistory(948): (#40) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: assertHistory(948): Cannot add 40 elements to context";
                                            goto LABEL_2247;
                                          case 951:
                                            time_t v19 = "ASPFTLParseBufferToCxt: asp3Support(951) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 953:
                                            time_t v19 = "ASPFTLParseBufferToCxt: numCrossTempRaidUecc(953) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 961:
                                            time_t v19 = "ASPFTLParseBufferToCxt: osBuildStr(961) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 962:
                                            time_t v19 = "ASPFTLParseBufferToCxt: raidConfig(962) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 967:
                                            if ((_DWORD)v14 != 12) {
                                              sub_100009E9C( "ASPFTLParseBufferToCxt: indTrimFrags(967): (#12) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: indTrimFrags(967): Cannot add 12 elements to context";
                                            goto LABEL_2247;
                                          case 971:
                                            if ((_DWORD)v14 != 12) {
                                              sub_100009E9C( "ASPFTLParseBufferToCxt: indUsedFrags(971): (#12) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: indUsedFrags(971): Cannot add 12 elements to context";
                                            goto LABEL_2247;
                                          default:
                                            switch(v12)
                                            {
                                              case 996:
                                                time_t v19 = "ASPFTLParseBufferToCxt: clogFindFail(996) cannot add 1 element to context";
                                                goto LABEL_15;
                                              case 997:
                                                time_t v19 = "ASPFTLParseBufferToCxt: clogFindBlank(997) cannot add 1 element to context";
                                                goto LABEL_15;
                                              case 998:
                                                time_t v19 = "ASPFTLParseBufferToCxt: clogFindUnc(998) cannot add 1 element to context";
                                                goto LABEL_15;
                                              case 999:
                                                time_t v19 = "ASPFTLParseBufferToCxt: clogFindUnexpected(999) cannot add 1 element to context";
                                                goto LABEL_15;
                                              case 1001:
                                                if ((_DWORD)v14 != 8) {
                                                  sub_100009E9C( "ASPFTLParseBufferToCxt: clogReplayFailReason(1001): (#8) cfg element s != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                                }
                                                else {
                                                  unsigned int v20 = v14;
                                                }
                                                int v22 = "ASPFTLParseBufferToCxt: clogReplayFailReason(1001): Cannot add 8 e"
                                                      "lements to context";
                                                goto LABEL_2247;
                                              case 1002:
                                                time_t v19 = "ASPFTLParseBufferToCxt: clogReplayTransientError(1002) cannot add "
                                                      "1 element to context";
                                                goto LABEL_15;
                                              case 1003:
                                                time_t v19 = "ASPFTLParseBufferToCxt: clogReplaySpfError(1003) cannot add 1 element to context";
                                                goto LABEL_15;
                                              case 1015:
                                                if ((_DWORD)v14 != 4) {
                                                  sub_100009E9C( "ASPFTLParseBufferToCxt: eanEarlyBootUeccPage(1015): (#4) cfg element s != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                                }
                                                else {
                                                  unsigned int v20 = v14;
                                                }
                                                int v22 = "ASPFTLParseBufferToCxt: eanEarlyBootUeccPage(1015): Cannot add 4 e"
                                                      "lements to context";
                                                goto LABEL_2247;
                                              case 1016:
                                                time_t v19 = "ASPFTLParseBufferToCxt: eanEarlyBootNumUeccPages(1016) cannot add "
                                                      "1 element to context";
                                                goto LABEL_15;
                                              case 1017:
                                                if ((sub_100019B70( a1,  "eanEarlyBootUeccMultiplane",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                                  goto LABEL_16;
                                                }
                                                time_t v19 = "ASPFTLParseBufferToCxt: eanEarlyBootUeccMultiplane(1017) cannot ad"
                                                      "d 1 element to context";
                                                goto LABEL_15;
                                              default:
                                                goto LABEL_2110;
                                            }
                                        }
                                      }

                                      if (v12 > 1137)
                                      {
                                        switch(v12)
                                        {
                                          case 1147:
                                            if ((_DWORD)v14 != 24) {
                                              sub_100009E9C( "ASPFTLParseBufferToCxt: gc_concurrent_dw_gc12(1147): (#24) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: gc_concurrent_dw_gc12(1147): Cannot add 24 ele"
                                                  "ments to context";
                                            goto LABEL_2247;
                                          case 1148:
                                            if ((_DWORD)v14 != 24) {
                                              sub_100009E9C( "ASPFTLParseBufferToCxt: gc_concurrent_dw_gc1(1148): (#24) cfg elements ! = (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: gc_concurrent_dw_gc1(1148): Cannot add 24 elements to context";
                                            goto LABEL_2247;
                                          case 1149:
                                            if ((_DWORD)v14 != 24) {
                                              sub_100009E9C( "ASPFTLParseBufferToCxt: gc_concurrent_dw_gc2(1149): (#24) cfg elements ! = (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: gc_concurrent_dw_gc2(1149): Cannot add 24 elements to context";
                                            goto LABEL_2247;
                                          case 1150:
                                          case 1151:
                                          case 1152:
                                          case 1153:
                                          case 1154:
                                          case 1155:
                                          case 1156:
                                          case 1159:
                                          case 1160:
                                          case 1161:
                                          case 1162:
                                          case 1163:
                                          case 1164:
                                          case 1165:
                                          case 1166:
                                          case 1167:
                                          case 1170:
                                          case 1173:
                                          case 1174:
                                          case 1175:
                                          case 1176:
                                          case 1177:
                                          case 1178:
                                            goto LABEL_2110;
                                          case 1157:
                                            time_t v19 = "ASPFTLParseBufferToCxt: eanMaxForceROTimeMs(1157) cannot add 1 element to context";
                                            break;
                                          case 1158:
                                            time_t v19 = "ASPFTLParseBufferToCxt: eanMaxForceRORecoTimeMs(1158) cannot add 1 element to context";
                                            break;
                                          case 1168:
                                            if ((_DWORD)v14 != 2) {
                                              sub_100009E9C( "ASPFTLParseBufferToCxt: poDetectPERemovalTotalCost(1168): (#2) cfg eleme nts != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: poDetectPERemovalTotalCost(1168): Cannot add 2"
                                                  " elements to context";
                                            goto LABEL_2247;
                                          case 1169:
                                            if ((_DWORD)v14 != 2) {
                                              sub_100009E9C( "ASPFTLParseBufferToCxt: poDetectEmptySpotRemovalTotalCost(1169): (#2) cf g elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((sub_100019B70( a1,  "poDetectEmptySpotRemovalTotalCost_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: poDetectEmptySpotRemovalTotalCost(1169): Canno"
                                                  "t add 2 elements to context";
                                            goto LABEL_2247;
                                          case 1171:
                                            if ((_DWORD)v14 != 10) {
                                              sub_100009E9C( "ASPFTLParseBufferToCxt: poDetectEmptySpotRemovalAge(1171): (#10) cfg ele ments != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((sub_100019B70( a1,  "poDetectEmptySpotRemovalAge_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: poDetectEmptySpotRemovalAge(1171): Cannot add "
                                                  "10 elements to context";
                                            goto LABEL_2247;
                                          case 1172:
                                            if ((_DWORD)v14 != 3) {
                                              sub_100009E9C( "ASPFTLParseBufferToCxt: poDetectGBBedMostSevereCost(1172): (#3) cfg elem ents != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((sub_100019B70( a1,  "poDetectGBBedMostSevereCost_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: poDetectGBBedMostSevereCost(1172): Cannot add "
                                                  "3 elements to context";
                                            goto LABEL_2247;
                                          case 1179:
                                            if ((_DWORD)v14 != 4) {
                                              sub_100009E9C( "ASPFTLParseBufferToCxt: gc_cur_dw_gc1(1179): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: gc_cur_dw_gc1(1179): Cannot add 4 elements to context";
                                            goto LABEL_2247;
                                          case 1180:
                                            if ((_DWORD)v14 != 4) {
                                              sub_100009E9C( "ASPFTLParseBufferToCxt: gc_cur_dw_gc2(1180): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: gc_cur_dw_gc2(1180): Cannot add 4 elements to context";
                                            goto LABEL_2247;
                                          case 1181:
                                            if ((_DWORD)v14 != 4) {
                                              sub_100009E9C( "ASPFTLParseBufferToCxt: gc_cur_dw_gc3(1181): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: gc_cur_dw_gc3(1181): Cannot add 4 elements to context";
                                            goto LABEL_2247;
                                          case 1182:
                                            if ((_DWORD)v14 != 4) {
                                              sub_100009E9C( "ASPFTLParseBufferToCxt: gc_tot_dw_gc1(1182): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: gc_tot_dw_gc1(1182): Cannot add 4 elements to context";
                                            goto LABEL_2247;
                                          case 1183:
                                            if ((_DWORD)v14 != 4) {
                                              sub_100009E9C( "ASPFTLParseBufferToCxt: gc_tot_dw_gc2(1183): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: gc_tot_dw_gc2(1183): Cannot add 4 elements to context";
                                            goto LABEL_2247;
                                          case 1184:
                                            time_t v19 = "ASPFTLParseBufferToCxt: unhappy_state(1184) cannot add 1 element to context";
                                            break;
                                          case 1185:
                                            time_t v19 = "ASPFTLParseBufferToCxt: unhappy_level(1185) cannot add 1 element to context";
                                            break;
                                          default:
                                            if (v12 != 1138)
                                            {
                                              if (v12 != 1189) {
                                                goto LABEL_2110;
                                              }
                                              if ((sub_100019B70(a1, "lastLbaFormatTime", (uint64_t)v8, 8u, 1u) & 1) == 0)
                                              {
                                                time_t v19 = "ASPFTLParseBufferToCxt: lastLbaFormatTime(1189) cannot add 1 element to context";
                                                break;
                                              }

                                              goto LABEL_16;
                                            }

                                            time_t v19 = "ASPFTLParseBufferToCxt: numOfToHappySwitches(1138) cannot add 1 element to context";
                                            break;
                                        }

LABEL_16:
                                          uint64_t v10 = (v10 + 1);
                                          goto LABEL_17;
                                        }

                                        goto LABEL_2110;
                                      }

                                      if (v12 > 1115)
                                      {
                                        if (v12 == 1116)
                                        {
                                          if ((_DWORD)v14 != 32) {
                                            sub_100009E9C( "ASPFTLParseBufferToCxt: gcwamp(1116): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                          }
                                          else {
                                            unsigned int v20 = v14;
                                          }
                                          if ((sub_100019B70(a1, "gcwamp_", (uint64_t)v8, 8u, v20) & 1) == 0)
                                          {
                                            int v22 = "ASPFTLParseBufferToCxt: gcwamp(1116): Cannot add 32 elements to context";
                                            goto LABEL_2247;
                                          }

                                          goto LABEL_14;
                                        }

                                        if (v12 == 1137)
                                        {
                                          time_t v19 = "ASPFTLParseBufferToCxt: numOfToUnhappySwitches(1137) cannot add 1 element to context";
                                          goto LABEL_15;
                                        }

LABEL_2110:
                                        switch(v12)
                                        {
                                          case 1196:
                                            if ((_DWORD)v14 != 5) {
                                              sub_100009E9C( "ASPFTLParseBufferToCxt: poDetectGBBedTotalCost(1196): (#5) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: poDetectGBBedTotalCost(1196): Cannot add 5 ele"
                                                  "ments to context";
                                            goto LABEL_2247;
                                          case 1197:
                                            if ((_DWORD)v14 != 10) {
                                              sub_100009E9C( "ASPFTLParseBufferToCxt: poDetectGBBedAge(1197): (#10) cfg elements != (% d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: poDetectGBBedAge(1197): Cannot add 10 elements to context";
                                            goto LABEL_2247;
                                          case 1198:
                                            if ((_DWORD)v14 != 3) {
                                              sub_100009E9C( "ASPFTLParseBufferToCxt: poDetectPERemovalMostSevereCost(1198): (#3) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((sub_100019B70( a1,  "poDetectPERemovalMostSevereCost_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: poDetectPERemovalMostSevereCost(1198): Cannot "
                                                  "add 3 elements to context";
                                            goto LABEL_2247;
                                          case 1199:
                                            time_t v19 = "ASPFTLParseBufferToCxt: poDetectCurrentSize(1199) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 1200:
                                          case 1203:
                                          case 1204:
                                          case 1205:
                                          case 1206:
                                          case 1207:
                                          case 1208:
                                          case 1209:
                                          case 1210:
                                          case 1212:
                                          case 1213:
                                          case 1214:
                                          case 1219:
                                          case 1220:
                                          case 1221:
                                          case 1222:
                                          case 1223:
LABEL_2242:
                                            else {
                                              snprintf(__str, 0x20uLL, "Stat_%d_");
                                            }
                                            if ((sub_100019B70(a1, __str, (uint64_t)v8, 8u, v14) & 1) == 0)
                                            {
                                              sub_100009E9C( "ASPFTLParseBufferToCxt %d: Cannot add %d elements to context",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v12);
                                              return v10;
                                            }

                                            uint64_t v10 = (v10 + v14);
                                            break;
                                          case 1201:
                                            if ((_DWORD)v14 != 4) {
                                              sub_100009E9C( "ASPFTLParseBufferToCxt: gcVerticalSuccssfulAlignments(1201): (#4) cfg el ements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((sub_100019B70( a1,  "gcVerticalSuccssfulAlignments_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: gcVerticalSuccssfulAlignments(1201): Cannot ad"
                                                  "d 4 elements to context";
                                            goto LABEL_2247;
                                          case 1202:
                                            if ((_DWORD)v14 != 4) {
                                              sub_100009E9C( "ASPFTLParseBufferToCxt: gcVerticalNoAlignmentDueToMissingSegs(1202): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((sub_100019B70( a1,  "gcVerticalNoAlignmentDueToMissingSegs_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: gcVerticalNoAlignmentDueToMissingSegs(1202): C"
                                                  "annot add 4 elements to context";
                                            goto LABEL_2247;
                                          case 1211:
                                            if ((_DWORD)v14 != 24) {
                                              sub_100009E9C( "ASPFTLParseBufferToCxt: forcedAllocationSmallEraseQ(1211): (#24) cfg ele ments != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((sub_100019B70( a1,  "forcedAllocationSmallEraseQ_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: forcedAllocationSmallEraseQ(1211): Cannot add "
                                                  "24 elements to context";
                                            goto LABEL_2247;
                                          case 1215:
                                            if ((_DWORD)v14 != 5) {
                                              sub_100009E9C( "ASPFTLParseBufferToCxt: hostWritesPerThrottleZone(1215): (#5) cfg elemen ts != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: hostWritesPerThrottleZone(1215): Cannot add 5 "
                                                  "elements to context";
                                            goto LABEL_2247;
                                          case 1216:
                                            if ((_DWORD)v14 != 24) {
                                              sub_100009E9C( "ASPFTLParseBufferToCxt: tlcWLPerDipAvgPEC(1216): (#24) cfg elements !=(%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: tlcWLPerDipAvgPEC(1216): Cannot add 24 elements to context";
                                            goto LABEL_2247;
                                          case 1217:
                                            if ((_DWORD)v14 != 24) {
                                              sub_100009E9C( "ASPFTLParseBufferToCxt: tlcWLPerDipMaxPEC(1217): (#24) cfg elements !=(%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: tlcWLPerDipMaxPEC(1217): Cannot add 24 elements to context";
                                            goto LABEL_2247;
                                          case 1218:
                                            if ((_DWORD)v14 != 24) {
                                              sub_100009E9C( "ASPFTLParseBufferToCxt: tlcWLPerDipMinPEC(1218): (#24) cfg elements !=(%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: tlcWLPerDipMinPEC(1218): Cannot add 24 elements to context";
                                            goto LABEL_2247;
                                          case 1224:
                                            if ((_DWORD)v14 != 20) {
                                              sub_100009E9C( "ASPFTLParseBufferToCxt: apfsValidLbaOvershoot(1224): (#20) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: apfsValidLbaOvershoot(1224): Cannot add 20 ele"
                                                  "ments to context";
                                            goto LABEL_2247;
                                          default:
                                            switch(v12)
                                            {
                                              case 1232:
                                                time_t v19 = "ASPFTLParseBufferToCxt: eanFastSize(1232) cannot add 1 element to context";
                                                goto LABEL_15;
                                              case 1233:
                                                time_t v19 = "ASPFTLParseBufferToCxt: eanNumSlcEvictions(1233) cannot add 1 element to context";
                                                goto LABEL_15;
                                              case 1234:
                                                time_t v19 = "ASPFTLParseBufferToCxt: eanNumForcedCompress(1234) cannot add 1 el"
                                                      "ement to context";
                                                goto LABEL_15;
                                              case 1235:
                                              case 1236:
                                              case 1237:
                                              case 1238:
                                              case 1239:
                                              case 1240:
                                              case 1242:
                                              case 1243:
                                              case 1245:
                                                goto LABEL_2242;
                                              case 1241:
                                                if ((_DWORD)v14 != 10) {
                                                  sub_100009E9C( "ASPFTLParseBufferToCxt: s2rTimeHisto(1241): (#10) cfg elements != (% d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                                }
                                                else {
                                                  unsigned int v20 = v14;
                                                }
                                                int v22 = "ASPFTLParseBufferToCxt: s2rTimeHisto(1241): Cannot add 10 elements to context";
                                                goto LABEL_2247;
                                              case 1244:
                                                time_t v19 = "ASPFTLParseBufferToCxt: calendarTimeWentBackward(1244) cannot add "
                                                      "1 element to context";
                                                goto LABEL_15;
                                              case 1246:
                                                if ((_DWORD)v14 != 8) {
                                                  sub_100009E9C( "ASPFTLParseBufferToCxt: bandsUeccCrossTempHisto(1246): (#8) cfg elem ents != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                                }
                                                else {
                                                  unsigned int v20 = v14;
                                                }
                                                if ((sub_100019B70( a1,  "bandsUeccCrossTempHisto_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                                  goto LABEL_14;
                                                }
                                                int v22 = "ASPFTLParseBufferToCxt: bandsUeccCrossTempHisto(1246): Cannot add "
                                                      "8 elements to context";
                                                goto LABEL_2247;
                                              default:
                                                if (v12 != 1190) {
                                                  goto LABEL_2242;
                                                }
                                                if ((_DWORD)v14 != 12) {
                                                  sub_100009E9C( "ASPFTLParseBufferToCxt: powerDownTime(1190): (#12) cfg elements !=(%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                                }
                                                else {
                                                  unsigned int v20 = v14;
                                                }
                                                int v22 = "ASPFTLParseBufferToCxt: powerDownTime(1190): Cannot add 12 elements to context";
                                                break;
                                            }

                                            goto LABEL_2247;
                                        }

LABEL_17:
                                        v8 += v14;
                                        v11 -= v14;
                                        goto LABEL_2;
                                      }

                                      if (v12 == 1105)
                                      {
                                        if ((_DWORD)v14 != 14) {
                                          sub_100009E9C( "ASPFTLParseBufferToCxt: hostReadSequential(1105): (#14) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                        }
                                        else {
                                          unsigned int v20 = v14;
                                        }
                                        if ((sub_100019B70(a1, "hostReadSequential_", (uint64_t)v8, 8u, v20) & 1) == 0)
                                        {
                                          int v22 = "ASPFTLParseBufferToCxt: hostReadSequential(1105): Cannot add 14 elements to context";
                                          goto LABEL_2247;
                                        }

                                        goto LABEL_14;
                                      }

                                      if (v12 != 1106) {
                                        goto LABEL_2110;
                                      }
                                      if ((_DWORD)v14 != 14) {
                                        sub_100009E9C( "ASPFTLParseBufferToCxt: GCReadSequential(1106): (#14) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      if ((sub_100019B70(a1, "GCReadSequential_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                      {
LABEL_14:
                                        uint64_t v10 = v20 + v10;
                                        goto LABEL_17;
                                      }

                                      int v22 = "ASPFTLParseBufferToCxt: GCReadSequential(1106): Cannot add 14 elements to context";
LABEL_2247:
                                      sub_100009E9C(v22, a2, a3, a4, a5, a6, a7, a8, v23);
                                      return v10;
                                  }
                              }
                          }
                      }
                  }
              }
          }
      }
  }

uint64_t sub_100019B70(uint64_t a1, const char *a2, uint64_t a3, unsigned int a4, unsigned int a5)
{
  uint64_t v14 = 0LL;
  uint64_t v5 = 1LL;
  if (a4 && a5)
  {
    if (a5 == 1)
    {
      if (a4 <= 8)
      {
        __memmove_chk(&v14, a3, a4, 8LL);
        return sub_100020604(a1, "", a2, v14);
      }

      else
      {
        return 0LL;
      }
    }

    else
    {
      int v11 = 0;
      int v12 = 0;
      do
      {
        uint64_t v14 = 0LL;
        if (a4 <= 8)
        {
          __memmove_chk(&v14, a3 + v11 * a4, a4, 8LL);
          snprintf(__str, 0x64uLL, "%d", v11);
          __str[100] = 0;
          uint64_t v5 = sub_100020604(a1, a2, __str, v14) & v5;
        }

        else
        {
          uint64_t v5 = 0LL;
        }

        int v11 = (unsigned __int16)++v12;
      }

      while ((unsigned __int16)v12 < a5);
    }
  }

  return v5;
}

uint64_t sub_100019CD0(uint64_t a1, unint64_t *a2, unsigned int a3)
{
  uint64_t v5 = 0LL;
  unsigned int v6 = a3 >> 3;
  *(_OWORD *)__str = 0u;
  __int128 v22 = 0u;
LABEL_2:
  int v7 = -v6;
  while (v7)
  {
    unint64_t v9 = *a2++;
    unsigned int v8 = v9;
    unint64_t v10 = HIDWORD(v9);
    ++v7;
    if (HIDWORD(v9))
    {
      if (v8 != 0xFFFF && v8 <= 0x30000000 && -v7 >= v10)
      {
        else {
          snprintf(__str, 0x20uLL, "Stat_%d_");
        }
        if ((sub_100019B70(a1, __str, (uint64_t)a2, 8u, v10) & 1) != 0)
        {
          uint64_t v5 = (v5 + v10);
          a2 += v10;
          unsigned int v6 = -v7 - v10;
          goto LABEL_2;
        }

        sub_100009E9C( "ASPFTLParseBufferToCxt %d: Cannot add %d elements to context",  v13,  v14,  v15,  v16,  v17,  v18,  v19,  v8);
      }

      return v5;
    }
  }

  return v5;
}

uint64_t sub_100019DF8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = 0LL;
  unint64_t v9 = "ASPMSPParseBufferToCxt: Passed in invalid buffer or empty buffer";
  if (!a2) {
    goto LABEL_1981;
  }
  unsigned int v10 = a3;
  if (!(_DWORD)a3) {
    goto LABEL_1981;
  }
  uint64_t v11 = a2;
  uint64_t v8 = 0LL;
  uint64_t v13 = &jpt_10001DF4C;
  uint64_t v14 = "ASPMSPParseBufferToCxt: fs1_4b_fail(4279): Error adding 4 elements to context";
  unint64_t v9 = "ASPMSPParseBufferToCxt: cbdr_step_5(4256): Error adding 10 elements to context";
  while (1)
  {
    do
    {
      if (!v10) {
        return v8;
      }
      uint64_t v15 = (unsigned __int16 *)v11;
      uint64_t v16 = *(unsigned __int16 *)(v11 + 2);
      v11 += 4LL;
      v10 -= 4;
    }

    while (!(_DWORD)v16);
    int v17 = *v15;
    if (v17 != 12286) {
      break;
    }
LABEL_461:
    v11 += v16;
    v10 -= v16;
  }

  switch(v17)
  {
    case 4096:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100009E9C( "ASPMSPParseBufferToCxt: passWithTmodeHard(4096): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: passWithTmodeHard(4096): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4097:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100009E9C( "ASPMSPParseBufferToCxt: passWithTmodeFS1_2b(4097): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: passWithTmodeFS1_2b(4097): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4098:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100009E9C( "ASPMSPParseBufferToCxt: passWithTmodeFS1_4b(4098): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: passWithTmodeFS1_4b(4098): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4099:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100009E9C( "ASPMSPParseBufferToCxt: passWithTmodeHard_fast(4099): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: passWithTmodeHard_fast(4099): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4100:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100009E9C( "ASPMSPParseBufferToCxt: passWithTmodeFS1_2b_fast(4100): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: passWithTmodeFS1_2b_fast(4100): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4101:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100009E9C( "ASPMSPParseBufferToCxt: passWithTmodeFS1_4b_fast(4101): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: passWithTmodeFS1_4b_fast(4101): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4102:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100009E9C( "ASPMSPParseBufferToCxt: numOfCwFailedInTmodeFS2_EOL(4102): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: numOfCwFailedInTmodeFS2_EOL(4102): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4103:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100009E9C( "ASPMSPParseBufferToCxt: numOfCwFailedInTmodeFS2_DSP_EOL(4103): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: numOfCwFailedInTmodeFS2_DSP_EOL(4103): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4104:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100009E9C( "ASPMSPParseBufferToCxt: readAlgoPassWithHardAfterAcq(4104): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithHardAfterAcq(4104): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4105:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100009E9C( "ASPMSPParseBufferToCxt: firstReadWasHardWithDefaultBDBFastRead(4105): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: firstReadWasHardWithDefaultBDBFastRead(4105): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4106:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100009E9C( "ASPMSPParseBufferToCxt: readalgoPassWithDS1(4106): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readalgoPassWithDS1(4106): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4107:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100009E9C( "ASPMSPParseBufferToCxt: readalgoPassWithDYCE1(4107): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readalgoPassWithDYCE1(4107): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4108:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100009E9C( "ASPMSPParseBufferToCxt: readalgoPassWithDS2(4108): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readalgoPassWithDS2(4108): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4109:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100009E9C( "ASPMSPParseBufferToCxt: readalgoPassWithDYCE2(4109): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readalgoPassWithDYCE2(4109): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4110:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100009E9C( "ASPMSPParseBufferToCxt: firstReadWasHardWithAcq(4110): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: firstReadWasHardWithAcq(4110): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4111:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100009E9C( "ASPMSPParseBufferToCxt: bdbDynamicMovedToEOL_LSB(4111): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: bdbDynamicMovedToEOL_LSB(4111): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4112:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100009E9C( "ASPMSPParseBufferToCxt: bdbDynamicMovedToEOL_MSB(4112): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: bdbDynamicMovedToEOL_MSB(4112): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4113:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100009E9C( "ASPMSPParseBufferToCxt: bdbDynamicMovedToEOL_USB(4113): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: bdbDynamicMovedToEOL_USB(4113): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4114:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100009E9C( "ASPMSPParseBufferToCxt: bdbDynamicMovedToSOL_LSB(4114): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: bdbDynamicMovedToSOL_LSB(4114): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4115:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100009E9C( "ASPMSPParseBufferToCxt: bdbDynamicMovedToSOL_MSB(4115): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: bdbDynamicMovedToSOL_MSB(4115): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4116:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100009E9C( "ASPMSPParseBufferToCxt: bdbDynamicMovedToSOL_USB(4116): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: bdbDynamicMovedToSOL_USB(4116): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4117:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100009E9C( "ASPMSPParseBufferToCxt: firstReadWasHardWithDefaultBDB(4117): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: firstReadWasHardWithDefaultBDB(4117): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4118:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100009E9C( "ASPMSPParseBufferToCxt: readAlgoPassedThroughSyndSumAcquisition(4118): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughSyndSumAcquisition(4118): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4119:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100009E9C( "ASPMSPParseBufferToCxt: readAlgoPassedThroughSlip(4119): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughSlip(4119): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4120:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 44) {
        sub_100009E9C( "ASPMSPParseBufferToCxt: FS2decodedBitFlips(4120): cfg 11 elements; (11*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: FS2decodedBitFlips(4120): Error adding 11 elements to context";
      goto LABEL_1981;
    case 4121:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 16) {
        sub_100009E9C( "ASPMSPParseBufferToCxt: slipTrackingAfterFs1ForceFailChangedVthInTicksHist(4121): cfg 4 elements; (4*4) cfg by"
      }
          "tes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: slipTrackingAfterFs1ForceFailChangedVthInTicksHist(4121): Error adding 4 elements to context";
      goto LABEL_1981;
    case 4122:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100009E9C( "ASPMSPParseBufferToCxt: readAlgoPassWithFS2_4b_fast(4122): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS2_4b_fast(4122): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4123:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100009E9C( "ASPMSPParseBufferToCxt: readAlgoPassWithHardAfterSlip_fast(4123): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithHardAfterSlip_fast(4123): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4124:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100009E9C( "ASPMSPParseBufferToCxt: readAlgoPassWithFS12BitAfterSlip_fast(4124): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS12BitAfterSlip_fast(4124): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4125:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100009E9C( "ASPMSPParseBufferToCxt: readAlgoPassWithFS14BitAfterSlip_fast(4125): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS14BitAfterSlip_fast(4125): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4126:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100009E9C( "ASPMSPParseBufferToCxt: readAlgoPassWithFS3_fast(4126): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS3_fast(4126): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4127:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 40) {
        sub_100009E9C( "ASPMSPParseBufferToCxt: deepSoft1Decoded(4127): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: deepSoft1Decoded(4127): Error adding 10 elements to context";
      goto LABEL_1981;
    case 4128:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 40) {
        sub_100009E9C( "ASPMSPParseBufferToCxt: deepSoft2Decoded(4128): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: deepSoft2Decoded(4128): Error adding 10 elements to context";
      goto LABEL_1981;
    case 4129:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100009E9C( "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS2_2b_fast(4129): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS2_2b_fast(4129): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4130:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100009E9C( "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS2_4b_fast(4130): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS2_4b_fast(4130): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4131:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100009E9C( "ASPMSPParseBufferToCxt: readAlgoPassedThroughSlip_fast(4131): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughSlip_fast(4131): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4132:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100009E9C( "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS3_fast(4132): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS3_fast(4132): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4133:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100009E9C( "ASPMSPParseBufferToCxt: readalgoPassWithEXH(4133): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readalgoPassWithEXH(4133): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4134:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 44) {
        sub_100009E9C( "ASPMSPParseBufferToCxt: FS1decodedbitflips(4134): cfg 11 elements; (11*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: FS1decodedbitflips(4134): Error adding 11 elements to context";
      goto LABEL_1981;
    case 4135:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100009E9C( "ASPMSPParseBufferToCxt: readZeroPage(4135): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readZeroPage(4135): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4136:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100009E9C( "ASPMSPParseBufferToCxt: readErasedPage(4136): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readErasedPage(4136): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4137:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100009E9C( "ASPMSPParseBufferToCxt: readFail(4137): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readFail(4137): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4138:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 20) {
        sub_100009E9C( "ASPMSPParseBufferToCxt: numOfSensesWereSentDuringSyndSumAcq(4138): cfg 5 elements; (5*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: numOfSensesWereSentDuringSyndSumAcq(4138): Error adding 5 elements to context";
      goto LABEL_1981;
    case 4139:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 12) {
        sub_100009E9C( "ASPMSPParseBufferToCxt: numOfSensesWereSentDuringMiniAcq(4139): cfg 3 elements; (3*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: numOfSensesWereSentDuringMiniAcq(4139): Error adding 3 elements to context";
      goto LABEL_1981;
    case 4140:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100009E9C( "ASPMSPParseBufferToCxt: bdbDefaultMoveFastToNormal(4140): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: bdbDefaultMoveFastToNormal(4140): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4141:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100009E9C( "ASPMSPParseBufferToCxt: bdbDefaultMoveNormalToFast(4141): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: bdbDefaultMoveNormalToFast(4141): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4142:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100009E9C( "ASPMSPParseBufferToCxt: readalgoPassWithEXH_DSP(4142): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readalgoPassWithEXH_DSP(4142): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4143:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100009E9C( "ASPMSPParseBufferToCxt: readalgoPassWithDS1_DSP(4143): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readalgoPassWithDS1_DSP(4143): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4144:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100009E9C( "ASPMSPParseBufferToCxt: readalgoPassWithDYCE1_DSP(4144): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readalgoPassWithDYCE1_DSP(4144): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4145:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100009E9C( "ASPMSPParseBufferToCxt: firstReadWasFS2EOL_DSP(4145): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: firstReadWasFS2EOL_DSP(4145): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4146:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100009E9C( "ASPMSPParseBufferToCxt: firstReadWasFS2EOL(4146): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: firstReadWasFS2EOL(4146): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4147:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100009E9C( "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS2_4b(4147): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS2_4b(4147): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4148:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100009E9C( "ASPMSPParseBufferToCxt: readAlgoPassWithFS2_4b(4148): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS2_4b(4148): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4149:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100009E9C( "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS2_2b(4149): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS2_2b(4149): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4150:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100009E9C( "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS3(4150): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS3(4150): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4151:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100009E9C( "ASPMSPParseBufferToCxt: readAlgoPassedThroughDS1(4151): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughDS1(4151): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4152:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100009E9C( "ASPMSPParseBufferToCxt: readAlgoPassedThroughDS2(4152): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughDS2(4152): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4153:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100009E9C( "ASPMSPParseBufferToCxt: readAlgoPassWithHardAfterSlip(4153): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithHardAfterSlip(4153): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4154:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100009E9C( "ASPMSPParseBufferToCxt: readAlgoPassWithFS12BitAfterSlip(4154): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS12BitAfterSlip(4154): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4155:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100009E9C( "ASPMSPParseBufferToCxt: readAlgoPassWithFS14BitAfterSlip(4155): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS14BitAfterSlip(4155): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4156:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100009E9C( "ASPMSPParseBufferToCxt: readAlgoPassWithFS3(4156): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS3(4156): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4157:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100009E9C( "ASPMSPParseBufferToCxt: readAlgoPassedThroughSyndSumAcquisition_DSP(4157): cfg 1 elements; (1*4) cfg bytes != "
      }
          "(%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughSyndSumAcquisition_DSP(4157): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4158:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100009E9C( "ASPMSPParseBufferToCxt: readAlgoPassWithFS12BitAfterAcq(4158): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS12BitAfterAcq(4158): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4159:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100009E9C( "ASPMSPParseBufferToCxt: readAlgoPassWithFS14BitAfterAcq(4159): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      if (sub_100019B70(a1, "readAlgoPassWithFS14BitAfterAcq", v11, 4u, v21))
      {
LABEL_460:
        uint64_t v8 = v8 + v21;
        uint64_t v13 = v20;
        uint64_t v14 = v19;
        goto LABEL_461;
      }

      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS14BitAfterAcq(4159): Error adding 1 elements to context";
LABEL_1981:
      sub_100009E9C(v9, a2, a3, a4, a5, a6, a7, a8, v24);
      return v8;
    default:
      switch(v17)
      {
        case 4160:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100009E9C( "ASPMSPParseBufferToCxt: readAlgoPassedThroughDS1_DSP(4160): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughDS1_DSP(4160): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4161:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100009E9C( "ASPMSPParseBufferToCxt: numOfSlipTracking(4161): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: numOfSlipTracking(4161): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4162:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100009E9C( "ASPMSPParseBufferToCxt: bdbDynamicMovedToEOL_QSB(4162): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: bdbDynamicMovedToEOL_QSB(4162): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4163:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100009E9C( "ASPMSPParseBufferToCxt: bdbDynamicMovedToSOL_QSB(4163): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: bdbDynamicMovedToSOL_QSB(4163): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4196:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100009E9C( "ASPMSPParseBufferToCxt: readStageNumOfFails100(4196): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails100(4196): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4197:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100009E9C( "ASPMSPParseBufferToCxt: readStageNumOfFails101(4197): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails101(4197): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4198:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100009E9C( "ASPMSPParseBufferToCxt: readStage100(4198): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStage100(4198): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4199:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100009E9C( "ASPMSPParseBufferToCxt: readStage101(4199): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStage101(4199): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4200:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100009E9C( "ASPMSPParseBufferToCxt: initialReadStage100(4200): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage100(4200): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4201:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100009E9C( "ASPMSPParseBufferToCxt: readStage102(4201): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStage102(4201): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4202:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100009E9C( "ASPMSPParseBufferToCxt: initialReadStage101(4202): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage101(4202): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4203:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100009E9C( "ASPMSPParseBufferToCxt: nandStageOfLife100(4203): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: nandStageOfLife100(4203): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4204:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100009E9C( "ASPMSPParseBufferToCxt: nandStageOfLife101(4204): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: nandStageOfLife101(4204): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4205:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100009E9C( "ASPMSPParseBufferToCxt: readStageNumOfFails102(4205): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails102(4205): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4206:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100009E9C( "ASPMSPParseBufferToCxt: initialReadStage102(4206): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage102(4206): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4207:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100009E9C( "ASPMSPParseBufferToCxt: readStage103(4207): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStage103(4207): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4208:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100009E9C( "ASPMSPParseBufferToCxt: readStage104(4208): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStage104(4208): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4209:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100009E9C( "ASPMSPParseBufferToCxt: readStage105(4209): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStage105(4209): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4210:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100009E9C( "ASPMSPParseBufferToCxt: readStage106(4210): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStage106(4210): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4211:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100009E9C( "ASPMSPParseBufferToCxt: dspExceptionParameter100(4211): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter100(4211): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4212:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100009E9C( "ASPMSPParseBufferToCxt: dspExceptionParameter101(4212): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter101(4212): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4213:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100009E9C( "ASPMSPParseBufferToCxt: initialReadStage103(4213): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage103(4213): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4214:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100009E9C( "ASPMSPParseBufferToCxt: initialReadStage104(4214): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage104(4214): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4215:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100009E9C( "ASPMSPParseBufferToCxt: readStage107(4215): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStage107(4215): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4216:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100009E9C( "ASPMSPParseBufferToCxt: readStage108(4216): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStage108(4216): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4217:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100009E9C( "ASPMSPParseBufferToCxt: nandStageOfLife102(4217): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: nandStageOfLife102(4217): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4218:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100009E9C( "ASPMSPParseBufferToCxt: nandStageOfLife103(4218): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: nandStageOfLife103(4218): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4219:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100009E9C( "ASPMSPParseBufferToCxt: nandStageOfLife104(4219): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: nandStageOfLife104(4219): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4220:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100009E9C( "ASPMSPParseBufferToCxt: dspExceptionParameter102(4220): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter102(4220): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4221:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100009E9C( "ASPMSPParseBufferToCxt: dspExceptionParameter103(4221): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter103(4221): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4222:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100009E9C( "ASPMSPParseBufferToCxt: dspExceptionParameter104(4222): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter104(4222): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4223:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100009E9C( "ASPMSPParseBufferToCxt: dspExceptionParameter105(4223): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter105(4223): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4224:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100009E9C( "ASPMSPParseBufferToCxt: dspExceptionParameter106(4224): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter106(4224): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4225:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100009E9C( "ASPMSPParseBufferToCxt: dspExceptionParameter107(4225): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter107(4225): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4226:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100009E9C( "ASPMSPParseBufferToCxt: dspExceptionParameter108(4226): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter108(4226): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4227:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100009E9C( "ASPMSPParseBufferToCxt: dspExceptionParameter109(4227): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter109(4227): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4228:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100009E9C( "ASPMSPParseBufferToCxt: dspExceptionParameter110(4228): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter110(4228): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4229:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100009E9C( "ASPMSPParseBufferToCxt: dspExceptionParameter111(4229): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter111(4229): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4230:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100009E9C( "ASPMSPParseBufferToCxt: dspExceptionParameter112(4230): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter112(4230): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4231:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100009E9C( "ASPMSPParseBufferToCxt: dspExceptionParameter113(4231): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter113(4231): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4232:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 256) {
            sub_100009E9C( "ASPMSPParseBufferToCxt: readStageNumOfFails108(4232): cfg 64 elements; (64*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails108(4232): Error adding 64 elements to context";
          goto LABEL_1981;
        case 4233:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 256) {
            sub_100009E9C( "ASPMSPParseBufferToCxt: readStageNumOfFails103(4233): cfg 64 elements; (64*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails103(4233): Error adding 64 elements to context";
          goto LABEL_1981;
        case 4234:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100009E9C( "ASPMSPParseBufferToCxt: readStageNumOfFails104(4234): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails104(4234): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4235:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100009E9C( "ASPMSPParseBufferToCxt: readStageNumOfFails105(4235): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails105(4235): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4236:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100009E9C( "ASPMSPParseBufferToCxt: readStageNumOfFails106(4236): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails106(4236): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4237:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100009E9C( "ASPMSPParseBufferToCxt: readStageNumOfFails107(4237): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails107(4237): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4238:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100009E9C( "ASPMSPParseBufferToCxt: readStage109(4238): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStage109(4238): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4239:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100009E9C( "ASPMSPParseBufferToCxt: readStage110(4239): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStage110(4239): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4240:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 80) {
            sub_100009E9C( "ASPMSPParseBufferToCxt: readStageNumOfErrorsBin100(4240): cfg 20 elements; (20*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfErrorsBin100(4240): Error adding 20 elements to context";
          goto LABEL_1981;
        case 4241:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 80) {
            sub_100009E9C( "ASPMSPParseBufferToCxt: dspExceptionParameter114(4241): cfg 20 elements; (20*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter114(4241): Error adding 20 elements to context";
          goto LABEL_1981;
        case 4242:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100009E9C( "ASPMSPParseBufferToCxt: dspExceptionParameter115(4242): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter115(4242): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4243:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100009E9C( "ASPMSPParseBufferToCxt: dspExceptionParameter116(4243): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter116(4243): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4244:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100009E9C( "ASPMSPParseBufferToCxt: dspExceptionParameter117(4244): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter117(4244): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4245:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100009E9C( "ASPMSPParseBufferToCxt: dspExceptionParameter118(4245): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter118(4245): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4246:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100009E9C( "ASPMSPParseBufferToCxt: dspExceptionParameter119(4246): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter119(4246): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4247:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100009E9C( "ASPMSPParseBufferToCxt: dspExceptionParameter120(4247): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter120(4247): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4248:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100009E9C( "ASPMSPParseBufferToCxt: dspExceptionParameter121(4248): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter121(4248): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4249:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100009E9C( "ASPMSPParseBufferToCxt: cbdr_ref_1(4249): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: cbdr_ref_1(4249): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4250:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100009E9C( "ASPMSPParseBufferToCxt: cbdr_ref_2(4250): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: cbdr_ref_2(4250): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4251:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100009E9C( "ASPMSPParseBufferToCxt: cbdr_outlier(4251): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: cbdr_outlier(4251): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4252:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 40) {
            sub_100009E9C( "ASPMSPParseBufferToCxt: cbdr_step_1(4252): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: cbdr_step_1(4252): Error adding 10 elements to context";
          goto LABEL_1981;
        case 4253:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 40) {
            sub_100009E9C( "ASPMSPParseBufferToCxt: cbdr_step_2(4253): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: cbdr_step_2(4253): Error adding 10 elements to context";
          goto LABEL_1981;
        case 4254:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 40) {
            sub_100009E9C( "ASPMSPParseBufferToCxt: cbdr_step_3(4254): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: cbdr_step_3(4254): Error adding 10 elements to context";
          goto LABEL_1981;
        case 4255:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 40) {
            sub_100009E9C( "ASPMSPParseBufferToCxt: cbdr_step_4(4255): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: cbdr_step_4(4255): Error adding 10 elements to context";
          goto LABEL_1981;
        default:
          switch(v17)
          {
            case 12288:
              if ((_DWORD)v16 != 8) {
                sub_100009E9C( "ASPMSPParseBufferToCxt: readStageNumOfFails200(12288): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails200(12288): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12289:
              if ((_DWORD)v16 != 8) {
                sub_100009E9C( "ASPMSPParseBufferToCxt: initialReadStage200(12289): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage200(12289): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12290:
              if ((_DWORD)v16 != 8) {
                sub_100009E9C( "ASPMSPParseBufferToCxt: initialReadStage201(12290): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage201(12290): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12291:
              if ((_DWORD)v16 != 8) {
                sub_100009E9C( "ASPMSPParseBufferToCxt: readStageNumOfFails201(12291): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails201(12291): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12292:
              if ((_DWORD)v16 != 8) {
                sub_100009E9C( "ASPMSPParseBufferToCxt: initialReadStage202(12292): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage202(12292): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12293:
              if ((_DWORD)v16 != 8) {
                sub_100009E9C( "ASPMSPParseBufferToCxt: initialReadStage203(12293): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage203(12293): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12294:
              if ((_DWORD)v16 != 8) {
                sub_100009E9C( "ASPMSPParseBufferToCxt: readStageNumOfFails202(12294): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails202(12294): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12295:
              if ((_DWORD)v16 != 8) {
                sub_100009E9C( "ASPMSPParseBufferToCxt: readStageNumOfFails203(12295): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails203(12295): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12296:
              if ((_DWORD)v16 != 8) {
                sub_100009E9C( "ASPMSPParseBufferToCxt: initialReadStage204(12296): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage204(12296): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12297:
              if ((_DWORD)v16 != 8) {
                sub_100009E9C( "ASPMSPParseBufferToCxt: initialReadStage205(12297): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage205(12297): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12298:
              if ((_DWORD)v16 != 8) {
                sub_100009E9C( "ASPMSPParseBufferToCxt: initialReadStage206(12298): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage206(12298): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12299:
              if ((_DWORD)v16 != 8) {
                sub_100009E9C( "ASPMSPParseBufferToCxt: initialReadStage207(12299): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage207(12299): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12300:
              if ((_DWORD)v16 != 8) {
                sub_100009E9C( "ASPMSPParseBufferToCxt: initialReadStage208(12300): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage208(12300): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12301:
              if ((_DWORD)v16 != 8) {
                sub_100009E9C( "ASPMSPParseBufferToCxt: initialReadStage209(12301): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage209(12301): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12302:
              if ((_DWORD)v16 != 8) {
                sub_100009E9C( "ASPMSPParseBufferToCxt: readStage200(12302): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage200(12302): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12303:
              if ((_DWORD)v16 != 32) {
                sub_100009E9C( "ASPMSPParseBufferToCxt: readStage201(12303): cfg 4 elements; (4*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage201(12303): Error adding 4 elements to context";
              goto LABEL_1981;
            case 12304:
              if ((_DWORD)v16 != 32) {
                sub_100009E9C( "ASPMSPParseBufferToCxt: readStage202(12304): cfg 4 elements; (4*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage202(12304): Error adding 4 elements to context";
              goto LABEL_1981;
            case 12305:
              if ((_DWORD)v16 != 8) {
                sub_100009E9C( "ASPMSPParseBufferToCxt: initialReadStage210(12305): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage210(12305): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12306:
              if ((_DWORD)v16 != 8) {
                sub_100009E9C( "ASPMSPParseBufferToCxt: initialReadStage211(12306): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage211(12306): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12307:
              if ((_DWORD)v16 != 8) {
                sub_100009E9C( "ASPMSPParseBufferToCxt: readStage203(12307): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage203(12307): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12308:
              if ((_DWORD)v16 != 8) {
                sub_100009E9C( "ASPMSPParseBufferToCxt: readStage204(12308): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage204(12308): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12309:
              if ((_DWORD)v16 != 8) {
                sub_100009E9C( "ASPMSPParseBufferToCxt: readStage205(12309): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage205(12309): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12310:
              if ((_DWORD)v16 != 8) {
                sub_100009E9C( "ASPMSPParseBufferToCxt: readStage206(12310): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage206(12310): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12311:
              if ((_DWORD)v16 != 8) {
                sub_100009E9C( "ASPMSPParseBufferToCxt: readStage207(12311): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage207(12311): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12312:
              if ((_DWORD)v16 != 8) {
                sub_100009E9C( "ASPMSPParseBufferToCxt: readStage208(12312): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage208(12312): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12313:
              if ((_DWORD)v16 != 32) {
                sub_100009E9C( "ASPMSPParseBufferToCxt: readStage209(12313): cfg 4 elements; (4*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage209(12313): Error adding 4 elements to context";
              goto LABEL_1981;
            case 12314:
              if ((_DWORD)v16 != 32) {
                sub_100009E9C( "ASPMSPParseBufferToCxt: readStage210(12314): cfg 4 elements; (4*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage210(12314): Error adding 4 elements to context";
              goto LABEL_1981;
            case 12315:
              if ((_DWORD)v16 != 8) {
                sub_100009E9C( "ASPMSPParseBufferToCxt: initialReadStage212(12315): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage212(12315): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12316:
              if ((_DWORD)v16 != 8) {
                sub_100009E9C( "ASPMSPParseBufferToCxt: initialReadStage213(12316): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage213(12316): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12317:
              if ((_DWORD)v16 != 8) {
                sub_100009E9C( "ASPMSPParseBufferToCxt: readStage211(12317): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage211(12317): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12318:
              if ((_DWORD)v16 != 8) {
                sub_100009E9C( "ASPMSPParseBufferToCxt: readStage212(12318): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage212(12318): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12319:
              if ((_DWORD)v16 != 8) {
                sub_100009E9C( "ASPMSPParseBufferToCxt: readStage213(12319): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage213(12319): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12320:
              if ((_DWORD)v16 != 8) {
                sub_100009E9C( "ASPMSPParseBufferToCxt: readStage214(12320): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage214(12320): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12321:
              if ((_DWORD)v16 != 8) {
                sub_100009E9C( "ASPMSPParseBufferToCxt: readStage215(12321): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage215(12321): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12322:
              if ((_DWORD)v16 != 8) {
                sub_100009E9C( "ASPMSPParseBufferToCxt: dspExceptionParameter142(12322): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter142(12322): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12323:
              if ((_DWORD)v16 != 8) {
                sub_100009E9C( "ASPMSPParseBufferToCxt: dspExceptionParameter143(12323): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter143(12323): Error adding 1 elements to context";
              goto LABEL_1981;
            default:
              switch(v17)
              {
                case 4256:
                  if ((_DWORD)v16 != 40) {
                    sub_100009E9C( "ASPMSPParseBufferToCxt: cbdr_step_5(4256): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  goto LABEL_1372;
                case 4257:
                  if ((_DWORD)v16 != 40) {
                    sub_100009E9C( "ASPMSPParseBufferToCxt: cbdr_step_6(4257): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: cbdr_step_6(4257): Error adding 10 elements to context";
                  goto LABEL_1981;
                case 4258:
                  if ((_DWORD)v16 != 40) {
                    sub_100009E9C( "ASPMSPParseBufferToCxt: cbdr_step_7(4258): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: cbdr_step_7(4258): Error adding 10 elements to context";
                  goto LABEL_1981;
                case 4259:
                  if ((_DWORD)v16 != 80) {
                    sub_100009E9C( "ASPMSPParseBufferToCxt: dspExceptionParameter122(4259): cfg 20 elements; (20*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter122(4259): Error adding 20 elements to context";
                  goto LABEL_1981;
                case 4260:
                  if ((_DWORD)v16 != 32) {
                    sub_100009E9C( "ASPMSPParseBufferToCxt: dspExceptionParameter123(4260): cfg 8 elements; (8*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter123(4260): Error adding 8 elements to context";
                  goto LABEL_1981;
                case 4261:
                  if ((_DWORD)v16 != 4) {
                    sub_100009E9C( "ASPMSPParseBufferToCxt: dspExceptionParameter124(4261): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter124(4261): Error adding 1 elements to context";
                  goto LABEL_1981;
                case 4262:
                  if ((_DWORD)v16 != 4) {
                    sub_100009E9C( "ASPMSPParseBufferToCxt: dspExceptionParameter125(4262): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter125(4262): Error adding 1 elements to context";
                  goto LABEL_1981;
                case 4263:
                  if ((_DWORD)v16 != 4) {
                    sub_100009E9C( "ASPMSPParseBufferToCxt: dspExceptionParameter126(4263): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter126(4263): Error adding 1 elements to context";
                  goto LABEL_1981;
                case 4264:
                  if ((_DWORD)v16 != 16) {
                    sub_100009E9C( "ASPMSPParseBufferToCxt: dspExceptionParameter127(4264): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter127(4264): Error adding 4 elements to context";
                  goto LABEL_1981;
                case 4265:
                  if ((_DWORD)v16 != 16) {
                    sub_100009E9C( "ASPMSPParseBufferToCxt: dspExceptionParameter128(4265): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter128(4265): Error adding 4 elements to context";
                  goto LABEL_1981;
                case 4266:
                  if ((_DWORD)v16 != 16) {
                    sub_100009E9C( "ASPMSPParseBufferToCxt: dspExceptionParameter129(4266): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter129(4266): Error adding 4 elements to context";
                  goto LABEL_1981;
                case 4267:
                  if ((_DWORD)v16 != 16) {
                    sub_100009E9C( "ASPMSPParseBufferToCxt: dspExceptionParameter130(4267): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter130(4267): Error adding 4 elements to context";
                  goto LABEL_1981;
                case 4268:
                  if ((_DWORD)v16 != 16) {
                    sub_100009E9C( "ASPMSPParseBufferToCxt: dspExceptionParameter131(4268): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter131(4268): Error adding 4 elements to context";
                  goto LABEL_1981;
                case 4269:
                  if ((_DWORD)v16 != 40) {
                    sub_100009E9C( "ASPMSPParseBufferToCxt: dspExceptionParameter132(4269): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter132(4269): Error adding 10 elements to context";
                  goto LABEL_1981;
                case 4270:
                  if ((_DWORD)v16 != 40) {
                    sub_100009E9C( "ASPMSPParseBufferToCxt: dspExceptionParameter133(4270): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter133(4270): Error adding 10 elements to context";
                  goto LABEL_1981;
                case 4271:
                  if ((_DWORD)v16 != 4) {
                    sub_100009E9C( "ASPMSPParseBufferToCxt: dspExceptionParameter134(4271): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter134(4271): Error adding 1 elements to context";
                  goto LABEL_1981;
                case 4272:
                  if ((_DWORD)v16 != 4) {
                    sub_100009E9C( "ASPMSPParseBufferToCxt: dspExceptionParameter135(4272): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter135(4272): Error adding 1 elements to context";
                  goto LABEL_1981;
                case 4273:
                  if ((_DWORD)v16 != 4) {
                    sub_100009E9C( "ASPMSPParseBufferToCxt: dspExceptionParameter136(4273): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter136(4273): Error adding 1 elements to context";
                  goto LABEL_1981;
                case 4274:
                  if ((_DWORD)v16 != 4) {
                    sub_100009E9C( "ASPMSPParseBufferToCxt: dspExceptionParameter137(4274): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter137(4274): Error adding 1 elements to context";
                  goto LABEL_1981;
                case 4275:
                  if ((_DWORD)v16 != 4) {
                    sub_100009E9C( "ASPMSPParseBufferToCxt: dspExceptionParameter138(4275): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter138(4275): Error adding 1 elements to context";
                  goto LABEL_1981;
                case 4276:
                  if ((_DWORD)v16 != 16) {
                    sub_100009E9C( "ASPMSPParseBufferToCxt: dspExceptionParameter139(4276): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter139(4276): Error adding 4 elements to context";
                  goto LABEL_1981;
                case 4277:
                  if ((_DWORD)v16 != 4) {
                    sub_100009E9C( "ASPMSPParseBufferToCxt: dspExceptionParameter140(4277): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter140(4277): Error adding 1 elements to context";
                  goto LABEL_1981;
                case 4278:
                  if ((_DWORD)v16 != 4) {
                    sub_100009E9C( "ASPMSPParseBufferToCxt: dspExceptionParameter141(4278): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter141(4278): Error adding 1 elements to context";
                  goto LABEL_1981;
                default:
                  switch(v17)
                  {
                    case 4164:
                      if ((_DWORD)v16 != 4) {
                        sub_100009E9C( "ASPMSPParseBufferToCxt: syndSumAcqConvergedToStaticWalls(4164): cfg 1 elements; (1*4) cfg byte"
                      }
                          "s != (%d) buffer bytes",
                          a2,
                          a3,
                          a4,
                          a5,
                          a6,
                          a7,
                          a8,
                          v16);
                      else {
                        unsigned int v22 = v16 >> 2;
                      }
                      unint64_t v9 = "ASPMSPParseBufferToCxt: syndSumAcqConvergedToStaticWalls(4164): Error adding 1 elements to context";
                      goto LABEL_1981;
                    case 4165:
                      if ((_DWORD)v16 != 60) {
                        sub_100009E9C( "ASPMSPParseBufferToCxt: DYCE1_Decoded_Bitflips(4165): cfg 15 elements; (15*4) cfg bytes != (%d) buffer bytes",
                      }
                          a2,
                          a3,
                          a4,
                          a5,
                          a6,
                          a7,
                          a8,
                          v16);
                      else {
                        unsigned int v22 = v16 >> 2;
                      }
                      unint64_t v9 = "ASPMSPParseBufferToCxt: DYCE1_Decoded_Bitflips(4165): Error adding 15 elements to context";
                      goto LABEL_1981;
                    case 4166:
                      if ((_DWORD)v16 != 80) {
                        sub_100009E9C( "ASPMSPParseBufferToCxt: DYCE1_Target_Bitflips(4166): cfg 20 elements; (20*4) cfg bytes != (%d) buffer bytes",
                      }
                          a2,
                          a3,
                          a4,
                          a5,
                          a6,
                          a7,
                          a8,
                          v16);
                      else {
                        unsigned int v22 = v16 >> 2;
                      }
                      unint64_t v9 = "ASPMSPParseBufferToCxt: DYCE1_Target_Bitflips(4166): Error adding 20 elements to context";
                      goto LABEL_1981;
                    case 4167:
                      if ((_DWORD)v16 != 60) {
                        sub_100009E9C( "ASPMSPParseBufferToCxt: DYCE2_Decoded_Bitflips(4167): cfg 15 elements; (15*4) cfg bytes != (%d) buffer bytes",
                      }
                          a2,
                          a3,
                          a4,
                          a5,
                          a6,
                          a7,
                          a8,
                          v16);
                      else {
                        unsigned int v22 = v16 >> 2;
                      }
                      unint64_t v9 = "ASPMSPParseBufferToCxt: DYCE2_Decoded_Bitflips(4167): Error adding 15 elements to context";
                      goto LABEL_1981;
                    case 4168:
                      if ((_DWORD)v16 != 80) {
                        sub_100009E9C( "ASPMSPParseBufferToCxt: DYCE2_Target_Bitflips(4168): cfg 20 elements; (20*4) cfg bytes != (%d) buffer bytes",
                      }
                          a2,
                          a3,
                          a4,
                          a5,
                          a6,
                          a7,
                          a8,
                          v16);
                      else {
                        unsigned int v22 = v16 >> 2;
                      }
                      unint64_t v9 = "ASPMSPParseBufferToCxt: DYCE2_Target_Bitflips(4168): Error adding 20 elements to context";
                      goto LABEL_1981;
                    default:
                      if (v17 <= 12323)
                      {
                        switch(v17)
                        {
                          case 8193:
                            if ((_DWORD)v16 != 20) {
                              sub_100009E9C( "ASPMSPParseBufferToCxt: avg_rd_window_size(8193): cfg 5 elements; (5*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: avg_rd_window_size(8193): Error adding 5 elements to context";
                            break;
                          case 8194:
                            if ((_DWORD)v16 != 4) {
                              sub_100009E9C( "ASPMSPParseBufferToCxt: num_zq_failures(8194): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: num_zq_failures(8194): Error adding 1 elements to context";
                            break;
                          case 8195:
                            if ((_DWORD)v16 != 64) {
                              sub_100009E9C( "ASPMSPParseBufferToCxt: lower_die_temperature(8195): cfg 16 elements; (16*4) cfg bytes !"
                            }
                                "= (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: lower_die_temperature(8195): Error adding 16 elements to context";
                            break;
                          case 8196:
                            if ((_DWORD)v16 != 64) {
                              sub_100009E9C( "ASPMSPParseBufferToCxt: higher_die_temperature(8196): cfg 16 elements; (16*4) cfg bytes "
                            }
                                "!= (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: higher_die_temperature(8196): Error adding 16 elements to context";
                            break;
                          case 8197:
                            if ((_DWORD)v16 != 4) {
                              sub_100009E9C( "ASPMSPParseBufferToCxt: number_of_sram_flips(8197): cfg 1 elements; (1*4) cfg bytes != ("
                            }
                                "%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: number_of_sram_flips(8197): Error adding 1 elements to context";
                            break;
                          case 8198:
                            if ((_DWORD)v16 != 4) {
                              sub_100009E9C( "ASPMSPParseBufferToCxt: number_of_reset_failures(8198): cfg 1 elements; (1*4) cfg bytes "
                            }
                                "!= (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: number_of_reset_failures(8198): Error adding 1 elements to context";
                            break;
                          case 8199:
                            if ((_DWORD)v16 != 4) {
                              sub_100009E9C( "ASPMSPParseBufferToCxt: device_config(8199): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: device_config(8199): Error adding 1 elements to context";
                            break;
                          case 8200:
                            if ((_DWORD)v16 != 4) {
                              sub_100009E9C( "ASPMSPParseBufferToCxt: number_of_throttling_events(8200): cfg 1 elements; (1*4) cfg byt"
                            }
                                "es != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: number_of_throttling_events(8200): Error adding 1 elements to context";
                            break;
                          case 8201:
                            if ((_DWORD)v16 != 4) {
                              sub_100009E9C( "ASPMSPParseBufferToCxt: link_speed_recoveries(8201): cfg 1 elements; (1*4) cfg bytes != "
                            }
                                "(%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: link_speed_recoveries(8201): Error adding 1 elements to context";
                            break;
                          case 8202:
                            if ((_DWORD)v16 != 4) {
                              sub_100009E9C( "ASPMSPParseBufferToCxt: fw_updates(8202): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: fw_updates(8202): Error adding 1 elements to context";
                            break;
                          case 8203:
                            if ((_DWORD)v16 != 4) {
                              sub_100009E9C( "ASPMSPParseBufferToCxt: maintenance_backup_to_main(8203): cfg 1 elements; (1*4) cfg byte"
                            }
                                "s != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: maintenance_backup_to_main(8203): Error adding 1 elements to context";
                            break;
                          case 8204:
                            if ((_DWORD)v16 != 4) {
                              sub_100009E9C( "ASPMSPParseBufferToCxt: maintenance_main_to_backup(8204): cfg 1 elements; (1*4) cfg byte"
                            }
                                "s != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: maintenance_main_to_backup(8204): Error adding 1 elements to context";
                            break;
                          case 8205:
                            if ((_DWORD)v16 != 4) {
                              sub_100009E9C( "ASPMSPParseBufferToCxt: boot_block_erase_failures(8205): cfg 1 elements; (1*4) cfg bytes"
                            }
                                " != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: boot_block_erase_failures(8205): Error adding 1 elements to context";
                            break;
                          case 8206:
                            if ((_DWORD)v16 != 4) {
                              sub_100009E9C( "ASPMSPParseBufferToCxt: boot_block_program_failures(8206): cfg 1 elements; (1*4) cfg byt"
                            }
                                "es != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: boot_block_program_failures(8206): Error adding 1 elements to context";
                            break;
                          case 8207:
                            if ((_DWORD)v16 != 4) {
                              sub_100009E9C( "ASPMSPParseBufferToCxt: boot_block_read_verify_failures(8207): cfg 1 elements; (1*4) cfg"
                            }
                                " bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: boot_block_read_verify_failures(8207): Error adding 1 elements to context";
                            break;
                          case 8208:
                            if ((_DWORD)v16 != 4) {
                              sub_100009E9C( "ASPMSPParseBufferToCxt: boot_block_read_failures(8208): cfg 1 elements; (1*4) cfg bytes "
                            }
                                "!= (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: boot_block_read_failures(8208): Error adding 1 elements to context";
                            break;
                          case 8209:
                            if ((_DWORD)v16 != 4) {
                              sub_100009E9C( "ASPMSPParseBufferToCxt: boot_block_refresh(8209): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: boot_block_refresh(8209): Error adding 1 elements to context";
                            break;
                          case 8210:
                            if ((_DWORD)v16 != 4) {
                              sub_100009E9C( "ASPMSPParseBufferToCxt: boot_block_convert_to_main(8210): cfg 1 elements; (1*4) cfg byte"
                            }
                                "s != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: boot_block_convert_to_main(8210): Error adding 1 elements to context";
                            break;
                          case 8211:
                            if ((_DWORD)v16 != 4) {
                              sub_100009E9C( "ASPMSPParseBufferToCxt: boot_block_read_source_changed(8211): cfg 1 elements; (1*4) cfg "
                            }
                                "bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: boot_block_read_source_changed(8211): Error adding 1 elements to context";
                            break;
                          case 8212:
                            if ((_DWORD)v16 != 16) {
                              sub_100009E9C( "ASPMSPParseBufferToCxt: open_blocks_hist(8212): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: open_blocks_hist(8212): Error adding 4 elements to context";
                            break;
                          case 8213:
                            if ((_DWORD)v16 != 24) {
                              sub_100009E9C( "ASPMSPParseBufferToCxt: random_read_hit_ratio_hist(8213): cfg 6 elements; (6*4) cfg byte"
                            }
                                "s != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: random_read_hit_ratio_hist(8213): Error adding 6 elements to context";
                            break;
                          case 8214:
                            if ((_DWORD)v16 != 20) {
                              sub_100009E9C( "ASPMSPParseBufferToCxt: active_time_hist(8214): cfg 5 elements; (5*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: active_time_hist(8214): Error adding 5 elements to context";
                            break;
                          case 8215:
                            if ((_DWORD)v16 != 8) {
                              sub_100009E9C( "ASPMSPParseBufferToCxt: rd_retraining_failures(8215): cfg 2 elements; (2*4) cfg bytes !="
                            }
                                " (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: rd_retraining_failures(8215): Error adding 2 elements to context";
                            break;
                          case 8216:
                            if ((_DWORD)v16 != 8) {
                              sub_100009E9C( "ASPMSPParseBufferToCxt: wr_retraining_failures(8216): cfg 2 elements; (2*4) cfg bytes !="
                            }
                                " (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: wr_retraining_failures(8216): Error adding 2 elements to context";
                            break;
                          case 8217:
                            if ((_DWORD)v16 != 20) {
                              sub_100009E9C( "ASPMSPParseBufferToCxt: auto_skip(8217): cfg 5 elements; (5*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: auto_skip(8217): Error adding 5 elements to context";
                            break;
                          case 8218:
                            if ((_DWORD)v16 != 4) {
                              sub_100009E9C( "ASPMSPParseBufferToCxt: number_of_dcc_pass_after_retry(8218): cfg 1 elements; (1*4) cfg "
                            }
                                "bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: number_of_dcc_pass_after_retry(8218): Error adding 1 elements to context";
                            break;
                          case 8219:
                            if ((_DWORD)v16 != 4) {
                              sub_100009E9C( "ASPMSPParseBufferToCxt: number_of_dcc_failures(8219): cfg 1 elements; (1*4) cfg bytes !="
                            }
                                " (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: number_of_dcc_failures(8219): Error adding 1 elements to context";
                            break;
                          case 8220:
                            if ((_DWORD)v16 != 28) {
                              sub_100009E9C( "ASPMSPParseBufferToCxt: open_blocks_hist(8220): cfg 7 elements; (7*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: open_blocks_hist(8220): Error adding 7 elements to context";
                            break;
                          case 8221:
                            if ((_DWORD)v16 != 4) {
                              sub_100009E9C( "ASPMSPParseBufferToCxt: max_size_open_blocks_list(8221): cfg 1 elements; (1*4) cfg bytes"
                            }
                                " != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: max_size_open_blocks_list(8221): Error adding 1 elements to context";
                            break;
                          case 8222:
                            if ((_DWORD)v16 != 4) {
                              sub_100009E9C( "ASPMSPParseBufferToCxt: gps_max_num_of_failures(8222): cfg 1 elements; (1*4) cfg bytes !"
                            }
                                "= (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: gps_max_num_of_failures(8222): Error adding 1 elements to context";
                            break;
                          case 8223:
                            if ((_DWORD)v16 != 4) {
                              sub_100009E9C( "ASPMSPParseBufferToCxt: gps_num_of_failures_max_overflow(8223): cfg 1 elements; (1*4) cf"
                            }
                                "g bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: gps_num_of_failures_max_overflow(8223): Error adding 1 elements to context";
                            break;
                          case 8224:
                            if ((_DWORD)v16 != 32) {
                              sub_100009E9C( "ASPMSPParseBufferToCxt: active_time_hist(8224): cfg 8 elements; (8*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: active_time_hist(8224): Error adding 8 elements to context";
                            break;
                          case 8225:
                            if ((_DWORD)v16 != 4) {
                              sub_100009E9C( "ASPMSPParseBufferToCxt: num_auto_program_cache_terminations(8225): cfg 1 elements; (1*4)"
                            }
                                " cfg bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: num_auto_program_cache_terminations(8225): Error adding 1 elements to context";
                            break;
                          case 8226:
                            if ((_DWORD)v16 != 4) {
                              sub_100009E9C( "ASPMSPParseBufferToCxt: number_of_read_cache_auto_terminations(8226): cfg 1 elements; (1"
                            }
                                "*4) cfg bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: number_of_read_cache_auto_terminations(8226): Error adding 1 el"
                                 "ements to context";
                            break;
                          case 8227:
                            if ((_DWORD)v16 != 28) {
                              sub_100009E9C( "ASPMSPParseBufferToCxt: external_etags_usage_hist(8227): cfg 7 elements; (7*4) cfg bytes"
                            }
                                " != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: external_etags_usage_hist(8227): Error adding 7 elements to context";
                            break;
                          case 8228:
                            if ((_DWORD)v16 != 16) {
                              sub_100009E9C( "ASPMSPParseBufferToCxt: internal_etags_usage_hist(8228): cfg 4 elements; (4*4) cfg bytes"
                            }
                                " != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: internal_etags_usage_hist(8228): Error adding 4 elements to context";
                            break;
                          case 8229:
                            if ((_DWORD)v16 != 4) {
                              sub_100009E9C( "ASPMSPParseBufferToCxt: max_heap_usage(8229): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: max_heap_usage(8229): Error adding 1 elements to context";
                            break;
                          case 8230:
                            if ((_DWORD)v16 != 24) {
                              sub_100009E9C( "ASPMSPParseBufferToCxt: rom_num_hard_resets(8230): cfg 6 elements; (6*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: rom_num_hard_resets(8230): Error adding 6 elements to context";
                            break;
                          case 8231:
                            if ((_DWORD)v16 != 64) {
                              sub_100009E9C( "ASPMSPParseBufferToCxt: lower_die_temperature(8231): cfg 16 elements; (16*4) cfg bytes !"
                            }
                                "= (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: lower_die_temperature(8231): Error adding 16 elements to context";
                            break;
                          case 8232:
                            if ((_DWORD)v16 != 64) {
                              sub_100009E9C( "ASPMSPParseBufferToCxt: higher_die_temperature(8232): cfg 16 elements; (16*4) cfg bytes "
                            }
                                "!= (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: higher_die_temperature(8232): Error adding 16 elements to context";
                            break;
                          case 8233:
                            if ((_DWORD)v16 != 24) {
                              sub_100009E9C( "ASPMSPParseBufferToCxt: random_read_hit_ratio_hist(8233): cfg 6 elements; (6*4) cfg byte"
                            }
                                "s != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: random_read_hit_ratio_hist(8233): Error adding 6 elements to context";
                            break;
                          case 8234:
                            if ((_DWORD)v16 != 4) {
                              sub_100009E9C( "ASPMSPParseBufferToCxt: msp_number_sram_flips(8234): cfg 1 elements; (1*4) cfg bytes != "
                            }
                                "(%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: msp_number_sram_flips(8234): Error adding 1 elements to context";
                            break;
                          case 8235:
                            if ((_DWORD)v16 != 28) {
                              sub_100009E9C( "ASPMSPParseBufferToCxt: boot_time_normal_power(8235): cfg 7 elements; (7*4) cfg bytes !="
                            }
                                " (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: boot_time_normal_power(8235): Error adding 7 elements to context";
                            break;
                          case 8236:
                            if ((_DWORD)v16 != 28) {
                              sub_100009E9C( "ASPMSPParseBufferToCxt: boot_time_low_power(8236): cfg 7 elements; (7*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: boot_time_low_power(8236): Error adding 7 elements to context";
                            break;
                          case 8237:
                            if ((_DWORD)v16 != 40) {
                              sub_100009E9C( "ASPMSPParseBufferToCxt: active_time_bw_pg_hist(8237): cfg 10 elements; (10*4) cfg bytes "
                            }
                                "!= (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: active_time_bw_pg_hist(8237): Error adding 10 elements to context";
                            break;
                          case 8238:
                            if ((_DWORD)v16 != 4) {
                              sub_100009E9C( "ASPMSPParseBufferToCxt: active_time_bw_pg_min(8238): cfg 1 elements; (1*4) cfg bytes != "
                            }
                                "(%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: active_time_bw_pg_min(8238): Error adding 1 elements to context";
                            break;
                          case 8239:
                            if ((_DWORD)v16 != 4) {
                              sub_100009E9C( "ASPMSPParseBufferToCxt: active_time_bw_pg_max(8239): cfg 1 elements; (1*4) cfg bytes != "
                            }
                                "(%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: active_time_bw_pg_max(8239): Error adding 1 elements to context";
                            break;
                          case 8240:
                            if ((_DWORD)v16 != 20) {
                              sub_100009E9C( "ASPMSPParseBufferToCxt: mdll_relative_offset(8240): cfg 5 elements; (5*4) cfg bytes != ("
                            }
                                "%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: mdll_relative_offset(8240): Error adding 5 elements to context";
                            break;
                          case 8241:
                            if ((_DWORD)v16 != 4) {
                              sub_100009E9C( "ASPMSPParseBufferToCxt: num_pg_regrets(8241): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: num_pg_regrets(8241): Error adding 1 elements to context";
                            break;
                          case 8242:
                            if ((_DWORD)v16 != 4) {
                              sub_100009E9C( "ASPMSPParseBufferToCxt: spi_image_overall_duration_acc(8242): cfg 1 elements; (1*4) cfg "
                            }
                                "bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: spi_image_overall_duration_acc(8242): Error adding 1 elements to context";
                            break;
                          case 8243:
                            if ((_DWORD)v16 != 4) {
                              sub_100009E9C( "ASPMSPParseBufferToCxt: spi_image_cw_fetch_duration_acc(8243): cfg 1 elements; (1*4) cfg"
                            }
                                " bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: spi_image_cw_fetch_duration_acc(8243): Error adding 1 elements to context";
                            break;
                          case 8244:
                            if ((_DWORD)v16 != 20) {
                              sub_100009E9C( "ASPMSPParseBufferToCxt: spi_image_cw_fetch_duration_hist(8244): cfg 5 elements; (5*4) cf"
                            }
                                "g bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: spi_image_cw_fetch_duration_hist(8244): Error adding 5 elements to context";
                            break;
                          default:
                            switch(v17)
                            {
                              case 4279:
                                if ((_DWORD)v16 != 16) {
                                  sub_100009E9C( "ASPMSPParseBufferToCxt: fs1_4b_fail(4279): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
                                }
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v16);
                                else {
                                  unsigned int v22 = v16 >> 2;
                                }
                                unint64_t v9 = v14;
                                break;
                              case 4280:
                                if ((_DWORD)v16 != 16) {
                                  sub_100009E9C( "ASPMSPParseBufferToCxt: fs1_4b_fast_fail(4280): cfg 4 elements; (4*4) cfg bytes != ("
                                }
                                    "%d) buffer bytes",
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v16);
                                else {
                                  unsigned int v22 = v16 >> 2;
                                }
                                unint64_t v9 = "ASPMSPParseBufferToCxt: fs1_4b_fast_fail(4280): Error adding 4 elements to context";
                                break;
                              case 4281:
                                if ((_DWORD)v16 != 40) {
                                  sub_100009E9C( "ASPMSPParseBufferToCxt: dyce_decoded_bit_flips(4281): cfg 10 elements; (10*4) cfg by"
                                }
                                    "tes != (%d) buffer bytes",
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v16);
                                else {
                                  unsigned int v22 = v16 >> 2;
                                }
                                unint64_t v9 = "ASPMSPParseBufferToCxt: dyce_decoded_bit_flips(4281): Error adding 10 elements to context";
                                break;
                              case 4282:
                                if ((_DWORD)v16 != 60) {
                                  sub_100009E9C( "ASPMSPParseBufferToCxt: slip_bch(4282): cfg 15 elements; (15*4) cfg bytes != (%d) buffer bytes",
                                }
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v16);
                                else {
                                  unsigned int v22 = v16 >> 2;
                                }
                                unint64_t v9 = "ASPMSPParseBufferToCxt: slip_bch(4282): Error adding 15 elements to context";
                                break;
                              case 4283:
                                if ((_DWORD)v16 != 40) {
                                  sub_100009E9C( "ASPMSPParseBufferToCxt: read_fail(4283): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
                                }
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v16);
                                else {
                                  unsigned int v22 = v16 >> 2;
                                }
                                unint64_t v9 = "ASPMSPParseBufferToCxt: read_fail(4283): Error adding 10 elements to context";
                                break;
                              case 4284:
                                if ((_DWORD)v16 != 40) {
                                  sub_100009E9C( "ASPMSPParseBufferToCxt: tr_read_fail(4284): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
                                }
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v16);
                                else {
                                  unsigned int v22 = v16 >> 2;
                                }
                                unint64_t v9 = "ASPMSPParseBufferToCxt: tr_read_fail(4284): Error adding 10 elements to context";
                                break;
                              case 4285:
                                if ((_DWORD)v16 != 40) {
                                  sub_100009E9C( "ASPMSPParseBufferToCxt: tr_aux_bfs_percent(4285): cfg 10 elements; (10*4) cfg bytes "
                                }
                                    "!= (%d) buffer bytes",
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v16);
                                else {
                                  unsigned int v22 = v16 >> 2;
                                }
                                unint64_t v9 = "ASPMSPParseBufferToCxt: tr_aux_bfs_percent(4285): Error adding 10 elements to context";
                                break;
                              case 4286:
                                if ((_DWORD)v16 != 20) {
                                  sub_100009E9C( "ASPMSPParseBufferToCxt: tr_reconstruct_pass_step(4286): cfg 5 elements; (5*4) cfg by"
                                }
                                    "tes != (%d) buffer bytes",
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v16);
                                else {
                                  unsigned int v22 = v16 >> 2;
                                }
                                unint64_t v9 = "ASPMSPParseBufferToCxt: tr_reconstruct_pass_step(4286): Error adding 5 elements to context";
                                break;
                              case 4287:
                                if ((_DWORD)v16 != 4) {
                                  sub_100009E9C( "ASPMSPParseBufferToCxt: tr_reconstruct_num(4287): cfg 1 elements; (1*4) cfg bytes !="
                                }
                                    " (%d) buffer bytes",
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v16);
                                else {
                                  unsigned int v22 = v16 >> 2;
                                }
                                unint64_t v9 = "ASPMSPParseBufferToCxt: tr_reconstruct_num(4287): Error adding 1 elements to context";
                                break;
                              default:
                                goto LABEL_1404;
                            }

                            goto LABEL_1981;
                        }

                        goto LABEL_1981;
                      }

                      switch(v17)
                      {
                        case 12326:
                          if ((_DWORD)v16 != 8) {
                            sub_100009E9C( "ASPMSPParseBufferToCxt: initialReadStageParameter2(12326): cfg 1 elements; (1*8) cfg bytes"
                          }
                              " != (%d) buffer bytes",
                              a2,
                              a3,
                              a4,
                              a5,
                              a6,
                              a7,
                              a8,
                              v16);
                          else {
                            unsigned int v22 = v16 >> 3;
                          }
                          if (!sub_100019B70(a1, "initialReadStageParameter2", v11, 8u, v22))
                          {
                            unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStageParameter2(12326): Error adding 1 elements to context";
                            goto LABEL_1981;
                          }

                          break;
                        case 12325:
                          if ((_DWORD)v16 != 8) {
                            sub_100009E9C( "ASPMSPParseBufferToCxt: initialReadStageParameter1(12325): cfg 1 elements; (1*8) cfg bytes"
                          }
                              " != (%d) buffer bytes",
                              a2,
                              a3,
                              a4,
                              a5,
                              a6,
                              a7,
                              a8,
                              v16);
                          else {
                            unsigned int v22 = v16 >> 3;
                          }
                          if (!sub_100019B70(a1, "initialReadStageParameter1", v11, 8u, v22))
                          {
                            unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStageParameter1(12325): Error adding 1 elements to context";
                            goto LABEL_1981;
                          }

                          break;
                        case 12324:
                          if ((_DWORD)v16 != 8) {
                            sub_100009E9C( "ASPMSPParseBufferToCxt: dspExceptionParameter144(12324): cfg 1 elements; (1*8) cfg bytes !"
                          }
                              "= (%d) buffer bytes",
                              a2,
                              a3,
                              a4,
                              a5,
                              a6,
                              a7,
                              a8,
                              v16);
                          else {
                            unsigned int v22 = v16 >> 3;
                          }
                          if (!sub_100019B70(a1, "dspExceptionParameter144", v11, 8u, v22))
                          {
                            unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter144(12324): Error adding 1 elements to context";
                            goto LABEL_1981;
                          }

                          break;
                        default:
LABEL_1404:
                          switch(v17)
                          {
                            case 8245:
                              if ((_DWORD)v16 != 4) {
                                sub_100009E9C( "ASPMSPParseBufferToCxt: spi_num_uses(8245): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                              }
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              else {
                                unsigned int v22 = v16 >> 2;
                              }
                              unint64_t v9 = "ASPMSPParseBufferToCxt: spi_num_uses(8245): Error adding 1 elements to context";
                              break;
                            case 8246:
                              if ((_DWORD)v16 != 20) {
                                sub_100009E9C( "ASPMSPParseBufferToCxt: e2e_error_count_tmode(8246): cfg 5 elements; (5*4) cfg bytes !"
                              }
                                  "= (%d) buffer bytes",
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              else {
                                unsigned int v22 = v16 >> 2;
                              }
                              unint64_t v9 = "ASPMSPParseBufferToCxt: e2e_error_count_tmode(8246): Error adding 5 elements to context";
                              break;
                            case 8247:
                              if ((_DWORD)v16 != 36) {
                                sub_100009E9C( "ASPMSPParseBufferToCxt: rd_window_dist(8247): cfg 9 elements; (9*4) cfg bytes != (%d) buffer bytes",
                              }
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              else {
                                unsigned int v22 = v16 >> 2;
                              }
                              unint64_t v9 = "ASPMSPParseBufferToCxt: rd_window_dist(8247): Error adding 9 elements to context";
                              break;
                            case 8248:
                              if ((_DWORD)v16 != 36) {
                                sub_100009E9C( "ASPMSPParseBufferToCxt: extended_rd_window_diff_dist(8248): cfg 9 elements; (9*4) cfg "
                              }
                                  "bytes != (%d) buffer bytes",
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              else {
                                unsigned int v22 = v16 >> 2;
                              }
                              unint64_t v9 = "ASPMSPParseBufferToCxt: extended_rd_window_diff_dist(8248): Error adding 9 elements to context";
                              break;
                            case 8249:
                              if ((_DWORD)v16 != 8) {
                                sub_100009E9C( "ASPMSPParseBufferToCxt: rd_retraining_failures_v2(8249): cfg 2 elements; (2*4) cfg byt"
                              }
                                  "es != (%d) buffer bytes",
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              else {
                                unsigned int v22 = v16 >> 2;
                              }
                              unint64_t v9 = "ASPMSPParseBufferToCxt: rd_retraining_failures_v2(8249): Error adding 2 elements to context";
                              break;
                            case 8250:
                              if ((_DWORD)v16 != 120) {
                                sub_100009E9C( "ASPMSPParseBufferToCxt: lower_die_temperature(8250): cfg 30 elements; (30*4) cfg bytes"
                              }
                                  " != (%d) buffer bytes",
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              else {
                                unsigned int v22 = v16 >> 2;
                              }
                              unint64_t v9 = "ASPMSPParseBufferToCxt: lower_die_temperature(8250): Error adding 30 elements to context";
                              break;
                            case 8251:
                              if ((_DWORD)v16 != 120) {
                                sub_100009E9C( "ASPMSPParseBufferToCxt: higher_die_temperature(8251): cfg 30 elements; (30*4) cfg byte"
                              }
                                  "s != (%d) buffer bytes",
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              else {
                                unsigned int v22 = v16 >> 2;
                              }
                              unint64_t v9 = "ASPMSPParseBufferToCxt: higher_die_temperature(8251): Error adding 30 elements to context";
                              break;
                            case 8252:
                              if ((_DWORD)v16 != 36) {
                                sub_100009E9C( "ASPMSPParseBufferToCxt: rd_window_dist_single_die(8252): cfg 9 elements; (9*4) cfg byt"
                              }
                                  "es != (%d) buffer bytes",
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              else {
                                unsigned int v22 = v16 >> 2;
                              }
                              unint64_t v9 = "ASPMSPParseBufferToCxt: rd_window_dist_single_die(8252): Error adding 9 elements to context";
                              break;
                            case 8253:
                              if ((_DWORD)v16 != 16) {
                                sub_100009E9C( "ASPMSPParseBufferToCxt: parallel_slip_drops_hist(8253): cfg 4 elements; (4*4) cfg byte"
                              }
                                  "s != (%d) buffer bytes",
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              else {
                                unsigned int v22 = v16 >> 2;
                              }
                              unint64_t v9 = "ASPMSPParseBufferToCxt: parallel_slip_drops_hist(8253): Error adding 4 elements to context";
                              break;
                            case 8254:
                              if ((_DWORD)v16 != 4) {
                                sub_100009E9C( "ASPMSPParseBufferToCxt: sys_halt_max_latency(8254): cfg 1 elements; (1*4) cfg bytes !="
                              }
                                  " (%d) buffer bytes",
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              else {
                                unsigned int v22 = v16 >> 2;
                              }
                              unint64_t v9 = "ASPMSPParseBufferToCxt: sys_halt_max_latency(8254): Error adding 1 elements to context";
                              break;
                            case 8255:
                              if ((_DWORD)v16 != 4) {
                                sub_100009E9C( "ASPMSPParseBufferToCxt: sys_halt_max_latency_opcode(8255): cfg 1 elements; (1*4) cfg b"
                              }
                                  "ytes != (%d) buffer bytes",
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              else {
                                unsigned int v22 = v16 >> 2;
                              }
                              unint64_t v9 = "ASPMSPParseBufferToCxt: sys_halt_max_latency_opcode(8255): Error adding 1 elements to context";
                              break;
                            case 8256:
                              if ((_DWORD)v16 != 4) {
                                sub_100009E9C( "ASPMSPParseBufferToCxt: channel_halt_max_latency(8256): cfg 1 elements; (1*4) cfg byte"
                              }
                                  "s != (%d) buffer bytes",
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              else {
                                unsigned int v22 = v16 >> 2;
                              }
                              unint64_t v9 = "ASPMSPParseBufferToCxt: channel_halt_max_latency(8256): Error adding 1 elements to context";
                              break;
                            case 8257:
                              if ((_DWORD)v16 != 8) {
                                sub_100009E9C( "ASPMSPParseBufferToCxt: max_heap_usage_v2(8257): cfg 2 elements; (2*4) cfg bytes != (%d) buffer bytes",
                              }
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              else {
                                unsigned int v22 = v16 >> 2;
                              }
                              unint64_t v9 = "ASPMSPParseBufferToCxt: max_heap_usage_v2(8257): Error adding 2 elements to context";
                              break;
                            default:
                              switch(v17)
                              {
                                case 16384:
                                  if ((_DWORD)v16 != 8) {
                                    sub_100009E9C( "ASPMSPParseBufferToCxt: fw_version_identifier(16384): cfg 1 elements; (1*8) cfg by"
                                  }
                                      "tes != (%d) buffer bytes",
                                      a2,
                                      a3,
                                      a4,
                                      a5,
                                      a6,
                                      a7,
                                      a8,
                                      v16);
                                  else {
                                    unsigned int v22 = v16 >> 3;
                                  }
                                  unint64_t v9 = "ASPMSPParseBufferToCxt: fw_version_identifier(16384): Error adding 1 elements to context";
                                  break;
                                case 16385:
                                  if ((_DWORD)v16 != 40) {
                                    sub_100009E9C( "ASPMSPParseBufferToCxt: random_read_size_ratio(16385): cfg 5 elements; (5*8) cfg b"
                                  }
                                      "ytes != (%d) buffer bytes",
                                      a2,
                                      a3,
                                      a4,
                                      a5,
                                      a6,
                                      a7,
                                      a8,
                                      v16);
                                  else {
                                    unsigned int v22 = v16 >> 3;
                                  }
                                  unint64_t v9 = "ASPMSPParseBufferToCxt: random_read_size_ratio(16385): Error adding 5 elements to context";
                                  break;
                                case 16386:
                                  if ((_DWORD)v16 != 8) {
                                    sub_100009E9C( "ASPMSPParseBufferToCxt: number_gracefull_read_terminations(16386): cfg 1 elements;"
                                  }
                                      " (1*8) cfg bytes != (%d) buffer bytes",
                                      a2,
                                      a3,
                                      a4,
                                      a5,
                                      a6,
                                      a7,
                                      a8,
                                      v16);
                                  else {
                                    unsigned int v22 = v16 >> 3;
                                  }
                                  if (sub_100019B70( a1,  "number_gracefull_read_terminations",  v11,  8u,  v22)) {
                                    goto LABEL_1372;
                                  }
                                  unint64_t v9 = "ASPMSPParseBufferToCxt: number_gracefull_read_terminations(16386): Error adding 1"
                                       " elements to context";
                                  break;
                                case 16387:
                                  if ((_DWORD)v16 != 8) {
                                    sub_100009E9C( "ASPMSPParseBufferToCxt: active_time_bw_pg_acc(16387): cfg 1 elements; (1*8) cfg by"
                                  }
                                      "tes != (%d) buffer bytes",
                                      a2,
                                      a3,
                                      a4,
                                      a5,
                                      a6,
                                      a7,
                                      a8,
                                      v16);
                                  else {
                                    unsigned int v22 = v16 >> 3;
                                  }
                                  unint64_t v9 = "ASPMSPParseBufferToCxt: active_time_bw_pg_acc(16387): Error adding 1 elements to context";
                                  break;
                                case 16388:
                                  if ((_DWORD)v16 != 8) {
                                    sub_100009E9C( "ASPMSPParseBufferToCxt: num_pg_events(16388): cfg 1 elements; (1*8) cfg bytes != ("
                                  }
                                      "%d) buffer bytes",
                                      a2,
                                      a3,
                                      a4,
                                      a5,
                                      a6,
                                      a7,
                                      a8,
                                      v16);
                                  else {
                                    unsigned int v22 = v16 >> 3;
                                  }
                                  unint64_t v9 = "ASPMSPParseBufferToCxt: num_pg_events(16388): Error adding 1 elements to context";
                                  break;
                                case 16389:
                                  if ((_DWORD)v16 != 128) {
                                    sub_100009E9C( "ASPMSPParseBufferToCxt: algo_queue_depth(16389): cfg 16 elements; (16*8) cfg bytes"
                                  }
                                      " != (%d) buffer bytes",
                                      a2,
                                      a3,
                                      a4,
                                      a5,
                                      a6,
                                      a7,
                                      a8,
                                      v16);
                                  else {
                                    unsigned int v22 = v16 >> 3;
                                  }
                                  unint64_t v9 = "ASPMSPParseBufferToCxt: algo_queue_depth(16389): Error adding 16 elements to context";
                                  break;
                                case 16390:
                                  if ((_DWORD)v16 != 128) {
                                    sub_100009E9C( "ASPMSPParseBufferToCxt: parallel_slip_hist(16390): cfg 16 elements; (16*8) cfg byt"
                                  }
                                      "es != (%d) buffer bytes",
                                      a2,
                                      a3,
                                      a4,
                                      a5,
                                      a6,
                                      a7,
                                      a8,
                                      v16);
                                  else {
                                    unsigned int v22 = v16 >> 3;
                                  }
                                  unint64_t v9 = "ASPMSPParseBufferToCxt: parallel_slip_hist(16390): Error adding 16 elements to context";
                                  break;
                                case 16391:
                                  if ((_DWORD)v16 != 48) {
                                    sub_100009E9C( "ASPMSPParseBufferToCxt: sys_halt_latency_hist(16391): cfg 6 elements; (6*8) cfg by"
                                  }
                                      "tes != (%d) buffer bytes",
                                      a2,
                                      a3,
                                      a4,
                                      a5,
                                      a6,
                                      a7,
                                      a8,
                                      v16);
                                  else {
                                    unsigned int v22 = v16 >> 3;
                                  }
                                  unint64_t v9 = "ASPMSPParseBufferToCxt: sys_halt_latency_hist(16391): Error adding 6 elements to context";
                                  break;
                                case 16392:
                                  if ((_DWORD)v16 != 48) {
                                    sub_100009E9C( "ASPMSPParseBufferToCxt: channel_halt_latency_hist(16392): cfg 6 elements; (6*8) cf"
                                  }
                                      "g bytes != (%d) buffer bytes",
                                      a2,
                                      a3,
                                      a4,
                                      a5,
                                      a6,
                                      a7,
                                      a8,
                                      v16);
                                  else {
                                    unsigned int v22 = v16 >> 3;
                                  }
                                  unint64_t v9 = "ASPMSPParseBufferToCxt: channel_halt_latency_hist(16392): Error adding 6 elements to context";
                                  break;
                                case 16393:
                                  if ((_DWORD)v16 != 8) {
                                    sub_100009E9C( "ASPMSPParseBufferToCxt: num_idle_die_read_cache_terminate(16393): cfg 1 elements; "
                                  }
                                      "(1*8) cfg bytes != (%d) buffer bytes",
                                      a2,
                                      a3,
                                      a4,
                                      a5,
                                      a6,
                                      a7,
                                      a8,
                                      v16);
                                  else {
                                    unsigned int v22 = v16 >> 3;
                                  }
                                  if (sub_100019B70( a1,  "num_idle_die_read_cache_terminate",  v11,  8u,  v22)) {
                                    goto LABEL_1372;
                                  }
                                  unint64_t v9 = "ASPMSPParseBufferToCxt: num_idle_die_read_cache_terminate(16393): Error adding 1 "
                                       "elements to context";
                                  break;
                                default:
                                  goto LABEL_1373;
                              }

                              goto LABEL_1981;
                          }

                          goto LABEL_1981;
                      }

LABEL_1372:
                      uint64_t v8 = v8 + v22;
LABEL_1373:
                      uint64_t v13 = &jpt_10001DF4C;
                      break;
                  }

                  break;
              }

              break;
          }

          break;
      }

      goto LABEL_461;
  }

uint64_t sub_100020604(uint64_t result, const char *a2, const char *a3, uint64_t a4)
{
  if (result)
  {
    int v7 = (void *)result;
    uint64_t v8 = (char *)calloc(1uLL, 0x78uLL);
    unint64_t v9 = calloc(1uLL, 0x78uLL);
    unsigned int v10 = v9;
    if (v8 && v9)
    {
      uint64_t v11 = v7[1];
      if (v11 && (uint64_t v12 = v7[3]) != 0)
      {
        *(void *)(v11 + 112) = v9;
        uint64_t v13 = (char **)(v12 + 112);
      }

      else
      {
        *int v7 = v9;
        uint64_t v13 = (char **)(v7 + 2);
      }

      *uint64_t v13 = v8;
      v7[1] = v9;
      v7[3] = v8;
      *((void *)v8 + 14) = 0LL;
      *((void *)v9 + 14) = 0LL;
      snprintf(v9, 0x63uLL, "%s%s", a2, a3);
      v10[99] = 0;
      snprintf(v8, 0x63uLL, "%llu", a4);
      v8[99] = 0;
      *((void *)v8 + 13) = a4;
      return 1LL;
    }

    else
    {
      if (v8) {
        free(v8);
      }
      if (v10) {
        free(v10);
      }
      return 0LL;
    }
  }

  return result;
}

double sub_100020708(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = *(void **)a1;
    if (v2)
    {
      do
      {
        id v3 = (void *)v2[14];
        free(v2);
        uint64_t v2 = v3;
      }

      while (v3);
    }

    id v4 = *(void **)(a1 + 16);
    if (v4)
    {
      do
      {
        uint64_t v5 = (void *)v4[14];
        free(v4);
        id v4 = v5;
      }

      while (v5);
    }

    double result = 0.0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }

  return result;
}

uint64_t sub_100020760(void *a1, const char *a2, const char *a3, uint64_t a4)
{
  uint64_t v8 = (char *)malloc(0x78uLL);
  unint64_t v9 = malloc(0x78uLL);
  unsigned int v10 = v9;
  uint64_t v11 = a1[1];
  if (v11 && (uint64_t v12 = a1[3]) != 0)
  {
    *(void *)(v11 + 112) = v9;
    uint64_t v13 = (char **)(v12 + 112);
  }

  else
  {
    *a1 = v9;
    uint64_t v13 = (char **)(a1 + 2);
  }

  *uint64_t v13 = v8;
  a1[1] = v9;
  a1[3] = v8;
  *((void *)v8 + 14) = 0LL;
  v9[14] = 0LL;
  snprintf((char *)v9, 0x63uLL, "%s%s", a2, a3);
  *((_BYTE *)v10 + 99) = 0;
  uint64_t result = snprintf(v8, 0x63uLL, "%llu", a4);
  v8[99] = 0;
  *((void *)v8 + 13) = a4;
  return result;
}

BOOL sub_10002082C(uint64_t a1, uint64_t a2, char *a3, size_t *a4, _DWORD *a5, unsigned int *a6)
{
  *(_OWORD *)v74 = 0u;
  __int128 v75 = 0u;
  if (!a5) {
    return 0LL;
  }
  int v9 = a5[3];
  size_t v10 = *a4;
  uint64_t v11 = a5[6];
  *(void *)v76 = 0LL;
  uint64_t v77 = 0LL;
  uint64_t v78 = 0LL;
  gettimeofday(&v73, 0LL);
  uint64_t v12 = localtime(&v73.tv_sec);
  strftime(v76, 0x18uLL, "%Y-%m-%d %H:%M:%S", v12);
  __sprintf_chk(v74, 0, 0x20uLL, "%s.%03d", v76, v73.tv_usec / 1000);
  unsigned int v13 = snprintf(a3, v10, "Captured at: %s\n", v74);
  size_t v14 = v10 - v13;
  BOOL v15 = v10 <= v13;
  uint64_t v16 = &a3[v13];
  if (v10 > v13) {
    size_t v17 = v10 - v13;
  }
  else {
    size_t v17 = v10;
  }
  v69 = a3;
  if (v10 > v13) {
    uint64_t v18 = &a3[v13];
  }
  else {
    uint64_t v18 = a3;
  }
  v68 = a5;
  if (*a6) {
    goto LABEL_9;
  }
  if (a5[1] >= 6u)
  {
    if (v10 > v13)
    {
      unsigned int v62 = snprintf(&a3[v13], v14, "- ASP Snapshot - \n%s\n");
      goto LABEL_92;
    }

LABEL_94:
    uint64_t v19 = 0LL;
    BOOL v15 = 1;
    goto LABEL_95;
  }

  if (v10 <= v13) {
    goto LABEL_94;
  }
  unsigned int v62 = snprintf( &a3[v13],  v14,  "Key: \n T   - Timestamp\n E   - Erased bands during this time interval\n HR  - Host Reads (in 4k sectors)\n HW  - Host Writes (in 4k sectors)\n NR  - Nand Reads (in 4k sectors)\n NW  - Nand Writes (in 4k sectors)\n TH  - Time in Hysteresis in this time interval (in ms)\n GC  - Number of sectors (4k bytes) completed GC in this time interval\n W   - Number of wear level bands completed in this time interval\n BI  - Bands Intermediate (SLC) PendingErase\n BU  - Bands User (MLC) PendingErase\n V   - Number of Free Nodes\n BF  - Buffer Fragments/BufferHighWater\n P   - Percent of time in DoPreempt rather than DoNormal\n H   - Qos Delays: Normal/Extreme\n X   - Successful expedite commands/Failed expedite commands\n L   - Age of the oldest command in ms (calculated every second)/Qos Interval (in 100us units)\n C   - Command tags in use by host (Min/Max)S   - Number of free segs\n U   - Sectors of host unmaps\n RO  - Num read ops for this time interval: priority0/priority1/...\n RL  - Total Read Latency (in us) for this time interval: priority0/priority1/...\n RM  - Max Read Latency (int us) for this time interval: priority0/priority1/...\n WO  - Num write ops for this time interval: priority0/priority1/...\n WL  - Total write latency (in us) for this time interval: priority0/priority1/...\n WM  - Max write latency (in us) for this time interval: priority0/priority1/...\n \n");
LABEL_92:
  if (v14 <= v62) {
    goto LABEL_94;
  }
  BOOL v15 = 0;
  uint64_t v18 = &v16[v62];
  size_t v17 = v14 - v62;
LABEL_9:
  uint64_t v19 = 0LL;
  unsigned int v20 = v9 - 1;
  unsigned int v21 = *a6;
  if (*a6 >= v9 - 1 || v15) {
    goto LABEL_95;
  }
  uint64_t v19 = 0LL;
  uint64_t v23 = a1;
  unsigned int v22 = a5;
  char v24 = (_DWORD *)((char *)a5 + v11);
  unint64_t v25 = *v24;
  unsigned int v64 = v9 - 1;
  unint64_t v70 = v25;
  while (2)
  {
    uint64_t v72 = v23 + v22[2] * v21;
    if (!*(_DWORD *)(v72 + v24[3])) {
      goto LABEL_83;
    }
    v65 = v19;
    if (!(_DWORD)v25) {
      goto LABEL_81;
    }
    unint64_t v26 = 0LL;
    do
    {
      unsigned int v27 = LOWORD(v24[7 * v26 + 2]);
      if (v27 < 2)
      {
        v39 = &v24[7 * v26];
        int v42 = *((unsigned __int8 *)v39 + 20);
        v40 = (const char *)(v39 + 5);
        int v41 = v42;
        if (!v42) {
          goto LABEL_78;
        }
        v43 = fmtcheck(v40, "%u");
        unsigned int v44 = snprintf(v18, v17, v43, *(unsigned int *)(v72 + v24[7 * v26 + 3]), v63);
      }

      else
      {
        if (v27 != 2)
        {
          if (v27 == 3)
          {
            id v28 = &v24[7 * v26];
            unsigned int v29 = v28[4];
            unsigned int v30 = v29 / 0xC;
            v71 = (char *)(v28 + 5);
            __int16 v31 = fmtcheck((const char *)v28 + 20, "%s");
            size_t v32 = snprintf(v18, v17, v31, "O");
            BOOL v33 = v17 <= v32;
            if (v17 <= v32) {
              size_t v32 = 0LL;
            }
            v17 -= v32;
            v18 += v32;
            if (v29 >= 0xC)
            {
              uint64_t v34 = 0LL;
              if (v30 <= 1) {
                unsigned int v35 = 1;
              }
              else {
                unsigned int v35 = v29 / 0xC;
              }
              uint64_t v36 = 12LL * v35;
              do
              {
                if (v33)
                {
                  BOOL v33 = 1;
                }

                else
                {
                  if (v34) {
                    unsigned int v37 = snprintf(v18, v17, "/%4u");
                  }
                  else {
                    unsigned int v37 = snprintf(v18, v17, "%4u");
                  }
                  if (v17 <= v37)
                  {
                    BOOL v33 = 1;
                  }

                  else
                  {
                    v17 -= v37;
                    v18 += v37;
                    BOOL v33 = 0;
                  }
                }

                v34 += 12LL;
              }

              while (v36 != v34);
            }

            if (v33)
            {
              char v38 = 1;
            }

            else
            {
              v48 = fmtcheck(v71, "%s");
              unsigned int v49 = snprintf(v18, v17, v48, "L");
              if (v17 <= v49)
              {
                char v38 = 1;
              }

              else
              {
                v17 -= v49;
                v18 += v49;
                char v38 = 0;
              }
            }

            if (v29 >= 0xC)
            {
              uint64_t v50 = 0LL;
              if (v30 <= 1) {
                unsigned int v51 = 1;
              }
              else {
                unsigned int v51 = v29 / 0xC;
              }
              uint64_t v52 = 12LL * v51;
              do
              {
                if ((v38 & 1) != 0)
                {
                  char v38 = 1;
                }

                else
                {
                  if (v50) {
                    unsigned int v53 = snprintf(v18, v17, "/%7u");
                  }
                  else {
                    unsigned int v53 = snprintf(v18, v17, "%7u");
                  }
                  if (v17 <= v53)
                  {
                    char v38 = 1;
                  }

                  else
                  {
                    v17 -= v53;
                    v18 += v53;
                    char v38 = 0;
                  }
                }

                v50 += 12LL;
              }

              while (v52 != v50);
            }

            if ((v38 & 1) != 0)
            {
              int v41 = 1;
            }

            else
            {
              v54 = fmtcheck(v71, "%s");
              unsigned int v55 = snprintf(v18, v17, v54, "M");
              if (v17 <= v55)
              {
                int v41 = 1;
              }

              else
              {
                v17 -= v55;
                v18 += v55;
                int v41 = 0;
              }
            }

            unint64_t v25 = v70;
            if (v29 >= 0xC)
            {
              uint64_t v56 = 0LL;
              if (v30 <= 1) {
                unsigned int v57 = 1;
              }
              else {
                unsigned int v57 = v30;
              }
              uint64_t v58 = 12LL * v57;
              do
              {
                if ((v41 & 1) != 0)
                {
                  int v41 = 1;
                }

                else
                {
                  if (v56) {
                    unsigned int v59 = snprintf(v18, v17, "/%5u");
                  }
                  else {
                    unsigned int v59 = snprintf(v18, v17, "%5u");
                  }
                  if (v17 <= v59)
                  {
                    int v41 = 1;
                  }

                  else
                  {
                    v17 -= v59;
                    v18 += v59;
                    int v41 = 0;
                  }
                }

                v56 += 12LL;
              }

              while (v58 != v56);
            }
          }

          else
          {
            int v41 = 0;
          }

          goto LABEL_78;
        }

        v45 = &v24[7 * v26];
        unsigned int v46 = *(_DWORD *)(v72 + v45[3]);
        v47 = fmtcheck((const char *)v45 + 20, "%u %u");
        unsigned int v44 = snprintf(v18, v17, v47, v46 / 0x3E8uLL, v46 % 0x3E8 / 0xAuLL);
      }

      if (v17 <= v44) {
        goto LABEL_89;
      }
      int v41 = 0;
      v18 += v44;
      v17 -= v44;
LABEL_78:
      ++v26;
    }

    while (v26 < v25 && !v41);
    if ((v41 & 1) == 0)
    {
LABEL_81:
      unsigned int v60 = snprintf(v18, v17, "\n");
      if (v17 > v60)
      {
        v18 += v60;
        v17 -= v60;
        uint64_t v19 = (char *)(v18 - v69);
        uint64_t v23 = a1;
        unsigned int v22 = v68;
        unsigned int v20 = v64;
LABEL_83:
        unsigned int v21 = *a6 + 1;
        *a6 = v21;
        if (v21 >= v20)
        {
          BOOL v15 = 0;
          goto LABEL_95;
        }

        continue;
      }
    }

    break;
  }

LABEL_89:
  ++*a6;
  BOOL v15 = 1;
  uint64_t v19 = v65;
LABEL_95:
  BOOL result = !v15;
  v19[(void)v69] = 0;
  *a4 = (size_t)(v19 + 1);
  return result;
}

uint64_t sub_100020E8C(uint64_t a1, unint64_t a2, char *__str, size_t *a4)
{
  id v4 = a4;
  unint64_t v8 = *a4;
  unsigned int v9 = snprintf( __str,  *a4,  "Key: \n T   - Timestamp\n E   - Erased bands during this time interval\n HR  - Host Reads (in 4k sectors)\n HW  - Host Writes (in 4k sectors)\n NR  - Nand Reads (in 4k sectors)\n NW  - Nand Writes (in 4k sectors)\n TH  - Time in Hysteresis in this time interval (in ms)\n GC  - Number of sectors (4k bytes) completed GC in this time interval\n W   - Number of wear level bands completed in this time interval\n BI  - Bands Intermediate (SLC) PendingErase\n BU  - Bands User (MLC) PendingErase\n V   - Number of Free Nodes\n BF  - Buffer Fragments/BufferHighWater\n P   - Percent of time in DoPreempt rather than DoNormal\n H   - Qos Delays: Normal/Extreme\n X   - Successful expedite commands/Failed expedite commands\n L   - Age of the oldest command in ms (calculated every second)/Qos Interval (in 100us units)\n C   - Command tags in use by host (Min/Max)S   - Number of free segs\n U   - Sectors of host unmaps\n RO  - Num read ops for this time interval: priority0/priority1/...\n RL  - Total Read Latency (in us) for this time interval: priority0/priority1/...\n RM  - Max Read Latency (int us) for this time interval: priority0/priority1/...\n WO  - Num write ops for this time interval: priority0/priority1/...\n WL  - Total write latency (in us) for this time interval: priority0/priority1/...\n WM  - Max write latency (in us) for this time interval: priority0/priority1/...\n \n");
  if (v8 > v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = &__str[v9];
    size_t v12 = v8 - v10;
    if ((a2 / 0xF8))
    {
      uint64_t v80 = (a2 / 0xF8);
      v81 = v4;
      uint64_t v13 = 0LL;
      uint64_t v14 = a1 + 68;
      uint64_t v84 = a1 + 76;
      uint64_t v85 = a1 + 72;
      uint64_t v88 = a1;
      uint64_t v82 = a1;
LABEL_4:
      uint64_t v83 = v13;
      BOOL v15 = (int *)(a1 + 248 * v13);
      int v87 = v15[26];
      int v16 = v15[28];
      int v86 = v15[27];
      unsigned int v17 = v15[38];
      int v18 = v15[39];
      int v19 = v15[29];
      int v20 = v15[30];
      int v21 = v15[31];
      int v22 = v15[32];
      int v24 = v15[35];
      int v23 = v15[36];
      int v26 = v15[43];
      int v25 = v15[44];
      int v27 = v15[46];
      int v28 = v15[47];
      int v29 = *v15;
      int v30 = v15[1];
      int v31 = v15[49];
      int v32 = v15[50];
      int v34 = v15[41];
      int v33 = v15[42];
      int v36 = v15[52];
      int v35 = v15[53];
      int v37 = v15[40];
      int v38 = v15[51];
      int v40 = v15[14];
      v39 = v15 + 14;
      int v79 = v34;
      int v41 = v11;
      unsigned int v42 = snprintf( v11,  v12,  "T=%04u E=%02u HR=%4u HW=%4u NR=%4u NW=%4u TH=%8u.%02u GC=%4u W=%2u BI=%3u BU=%3u V=%5u BF=%2u/%2u P=%2u H= %2u/%2u X=%2u/%2u L=%3u/%3u C=%2u/%2u S=%4u U=%8u RO=%4u",  v29,  v87,  v86,  v16,  v19,  v20,  v17 / 0x3E8,  v17 % 0x3E8 / 0xA,  v21,  v22,  v24,  v23,  v25,  v27,  v28,  v30,  v37,  v18,  v31,  v32,  v33,  v26,  v36,  v35,  v79,  v38,  v40);
      if (v12 > v42)
      {
        uint64_t v43 = 0LL;
        unsigned int v44 = &v41[v42];
        size_t v45 = v12 - v42;
        while (1)
        {
          unsigned int v46 = snprintf(v44, v45, "/%4u", *(_DWORD *)(v14 + v43));
          if (v45 <= v46) {
            break;
          }
          v43 += 12LL;
          v44 += v46;
          v45 -= v46;
          if (v43 == 36)
          {
            unsigned int v47 = snprintf(v44, v45, " RL=%7u", v39[1]);
            if (v45 > v47)
            {
              uint64_t v48 = 0LL;
              unsigned int v49 = &v44[v47];
              size_t v50 = v45 - v47;
              while (1)
              {
                unsigned int v51 = snprintf(v49, v50, "/%7u", *(_DWORD *)(v85 + v48));
                if (v50 <= v51) {
                  break;
                }
                v48 += 12LL;
                v49 += v51;
                v50 -= v51;
                if (v48 == 36)
                {
                  unsigned int v52 = snprintf(v49, v50, " RM=%5u", v39[2]);
                  if (v50 > v52)
                  {
                    uint64_t v53 = 0LL;
                    v54 = &v49[v52];
                    size_t v55 = v50 - v52;
                    while (1)
                    {
                      unsigned int v56 = snprintf(v54, v55, "/%5u", *(_DWORD *)(v84 + v53));
                      if (v55 <= v56) {
                        break;
                      }
                      v53 += 12LL;
                      v54 += v56;
                      v55 -= v56;
                      if (v53 == 36)
                      {
                        uint64_t v57 = v82 + 248 * v83;
                        int v59 = *(_DWORD *)(v57 + 8);
                        uint64_t v58 = v57 + 8;
                        unsigned int v60 = snprintf(v54, v55, " WO=%4u", v59);
                        if (v55 > v60)
                        {
                          v61 = &v54[v60];
                          size_t v62 = v55 - v60;
                          uint64_t v63 = 20LL;
                          while (1)
                          {
                            unsigned int v64 = snprintf(v61, v62, "/%4u", *(_DWORD *)(v88 + v63));
                            if (v62 <= v64) {
                              break;
                            }
                            v63 += 12LL;
                            v61 += v64;
                            v62 -= v64;
                            if (v63 == 56)
                            {
                              unsigned int v65 = snprintf(v61, v62, " WL=%7u", *(_DWORD *)(v58 + 4));
                              if (v62 > v65)
                              {
                                v66 = &v61[v65];
                                size_t v67 = v62 - v65;
                                uint64_t v68 = 24LL;
                                while (1)
                                {
                                  unsigned int v69 = snprintf(v66, v67, "/%7u", *(_DWORD *)(v88 + v68));
                                  if (v67 <= v69) {
                                    break;
                                  }
                                  v68 += 12LL;
                                  v66 += v69;
                                  v67 -= v69;
                                  if (v68 == 60)
                                  {
                                    unsigned int v70 = snprintf(v66, v67, " WM=%5u", *(_DWORD *)(v58 + 8));
                                    if (v67 > v70)
                                    {
                                      v71 = &v66[v70];
                                      size_t v72 = v67 - v70;
                                      uint64_t v73 = 28LL;
                                      while (1)
                                      {
                                        unsigned int v74 = snprintf(v71, v72, "/%5u", *(_DWORD *)(v88 + v73));
                                        if (v72 <= v74) {
                                          break;
                                        }
                                        v73 += 12LL;
                                        v71 += v74;
                                        v72 -= v74;
                                        if (v73 == 64)
                                        {
                                          unsigned int v75 = snprintf(v71, v72, "\n");
                                          if (v72 <= v75) {
                                            return 0LL;
                                          }
                                          uint64_t v76 = v75;
                                          uint64_t v11 = &v71[v75];
                                          size_t v12 = v72 - v76;
                                          a1 = v82;
                                          uint64_t v13 = v83 + 1;
                                          v14 += 248LL;
                                          v84 += 248LL;
                                          v85 += 248LL;
                                          v88 += 248LL;
                                          id v4 = v81;
                                          if (v83 + 1 != v80) {
                                            goto LABEL_4;
                                          }
                                          goto LABEL_30;
                                        }
                                      }
                                    }

                                    return 0LL;
                                  }
                                }
                              }

                              return 0LL;
                            }
                          }
                        }

                        return 0LL;
                      }
                    }
                  }

                  return 0LL;
                }
              }
            }

            return 0LL;
          }
        }
      }
    }

    else
    {
LABEL_30:
      unsigned int v77 = snprintf(v11, v12, "\n");
      if (v77 < v12)
      {
        *v4 += v77 - v12;
        return 1LL;
      }
    }
  }

  return 0LL;
}

uint64_t sub_100021364(unsigned int a1, void *a2, void *a3)
{
  uint64_t v12 = 0LL;
  if (!a2 || !a3)
  {
    id v4 = __stderrp;
    uint64_t v5 = "Error: Exporting data must output to buffer externally!\n";
    size_t v6 = 56LL;
    goto LABEL_6;
  }

  if (a1 <= 1)
  {
    id v4 = __stderrp;
    uint64_t v5 = "Error: system counters only supported on OSX\n";
    size_t v6 = 45LL;
LABEL_6:
    fwrite(v5, v6, 1uLL, v4);
    return 0LL;
  }

  signed int v8 = a1 - 3;
  if (a1 - 3 >= 7)
  {
    fprintf(__stderrp, "Error: Not supported option %d\n", a1);
    return 0LL;
  }

  int v10 = dword_100031ED0[v8];
  uint64_t v11 = sub_10002E770(0LL, v10, qword_100031E98[v8], &v12, 0, 0);
  *a2 = v11;
  if (v11)
  {
    *a3 = v12;
    return 1LL;
  }

  else
  {
    fprintf(__stderrp, "Error: Failed to get tunnel buffer for cmd option %d.\n", v10);
    uint64_t result = 0LL;
    *a3 = 0LL;
  }

  return result;
}

uint64_t sub_100021488(char **a1, int a2, int a3, void *a4, void *a5)
{
  if (a3) {
    int v6 = 10;
  }
  else {
    int v6 = 13;
  }
  uint64_t v10 = 0LL;
  if (a4 && a5)
  {
    signed int v8 = sub_10002E3F0(a1, v6, 0, a2, &v10, 0, 0);
    *a4 = v8;
    if (v8)
    {
      *a5 = v10;
      return 1LL;
    }

    else
    {
      fprintf(__stderrp, "Error: Failed to get tunnel buffer for cmd option %d.\n", v6);
      uint64_t result = 0LL;
      *a5 = 0LL;
    }
  }

  else
  {
    fwrite("Error: Exporting data must output to buffer externally!\n", 0x38uLL, 1uLL, __stderrp);
    return 0LL;
  }

  return result;
}

uint64_t print_asp_magazine_stats(char *a1, int a2, int a3)
{
  uint64_t v8 = 0LL;
  unsigned int v9 = 0LL;
  if (sub_100021488(0LL, a2, a3, &v9, &v8))
  {
    if (a3) {
      int v5 = 1;
    }
    else {
      int v5 = 3;
    }
    sub_1000215FC(a1, (unint64_t *)v9, v8 >> 3, v5);
    free(v9);
    return 1LL;
  }

  else
  {
    int v7 = "all";
    if (a3) {
      int v7 = "perm";
    }
    fprintf(__stderrp, "Error: IO NVMe Smart cmd failed to extract ASP %s stats!\n", v7);
    return 0LL;
  }

uint64_t sub_1000215FC(char *__filename, unint64_t *a2, int a3, int a4)
{
  int v7 = __filename;
  if (__filename)
  {
    uint64_t v8 = fopen(__filename, "a");
    if (!v8) {
      return fprintf(__stderrp, "Unable to open %s\n", v7);
    }
  }

  else
  {
    uint64_t v8 = __stdoutp;
  }

  fwrite("NAND stats:\n", 0xCuLL, 1uLL, v8);
  uint64_t result = fwrite("===========\n", 0xCuLL, 1uLL, v8);
  if (!a3) {
    goto LABEL_3139;
  }
  unint64_t v10 = 0LL;
  unint64_t v11 = 0LL;
  unint64_t v12 = 0LL;
  unint64_t v13 = 0LL;
  unint64_t v436 = 0LL;
  unint64_t v437 = 0LL;
  *(void *)v435 = a4 & 3;
  while (1)
  {
    unint64_t v16 = *a2;
    BOOL v15 = a2 + 1;
    int v14 = v16;
    unsigned int v17 = a3 - 1;
    unint64_t v438 = HIDWORD(v16);
    if (v17 < HIDWORD(v16)) {
      break;
    }
    if (v14 > 49)
    {
      if (v14 > 128)
      {
        if (v14 == 129)
        {
          unint64_t v11 = *v15;
          goto LABEL_31;
        }

        if (v14 == 677)
        {
          unint64_t v10 = *v15;
          goto LABEL_31;
        }
      }

      else
      {
        if (v14 == 50)
        {
          *(void *)&v435[4] = *v15;
          goto LABEL_31;
        }

        if (v14 == 84)
        {
          unint64_t v12 = *v15;
          goto LABEL_31;
        }
      }
    }

    else if (v14 > 19)
    {
      if (v14 == 20)
      {
        unint64_t v436 = *v15;
        goto LABEL_31;
      }

      if (v14 == 49)
      {
        unint64_t v13 = *v15;
        goto LABEL_31;
      }
    }

    else
    {
      if (v14 == 1)
      {
        uint64_t result = fprintf(v8, "%20s:\t0x%llx\n");
        goto LABEL_32;
      }

      if (v14 == 4)
      {
        unint64_t v437 = *v15;
LABEL_31:
        uint64_t result = fprintf(v8, "%20s:\t%llu\n");
        goto LABEL_32;
      }
    }

    if ((a4 & 1) != 0 && v14 == 678 || (a4 & 1) != 0 && v14 == 679) {
      goto LABEL_31;
    }
    if ((a4 & 1) != 0 && v14 == 680)
    {
      unsigned int v433 = v17;
      unint64_t v18 = v13;
      unint64_t v19 = v11;
      uint64_t result = fprintf(v8, "%20s:\n", "magazineFWVersion");
      else {
        uint64_t v20 = v438;
      }
      if ((_DWORD)v20)
      {
        unint64_t v431 = v10;
        for (uint64_t i = 0LL; i != v20; ++i)
          uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i, v15[i]);
        unint64_t v10 = v431;
      }

      unint64_t v11 = v19;
      unint64_t v13 = v18;
      unsigned int v17 = v433;
      goto LABEL_32;
    }

    if ((a4 & 1) != 0 && v14 == 2
      || (a4 & 1) != 0 && v14 == 3
      || (a4 & 1) != 0 && v14 == 5
      || (a4 & 1) != 0 && v14 == 6
      || (a4 & 1) != 0 && v14 == 27
      || (a4 & 1) != 0 && v14 == 99
      || (a4 & 1) != 0 && v14 == 107
      || (a4 & 1) != 0 && v14 == 1066
      || (a4 & 1) != 0 && v14 == 191
      || (a4 & 1) != 0 && v14 == 7)
    {
      goto LABEL_31;
    }

    unint64_t v434 = v11;
    int v432 = a4;
    if ((a4 & 1) == 0 || v14 != 8)
    {
      int v22 = v7;
      unint64_t v23 = v10;
      if ((v432 & 1) != 0 && v14 == 9
        || (v432 & 1) != 0 && v14 == 10
        || (v432 & 1) != 0 && v14 == 11
        || (v432 & 1) != 0 && v14 == 12
        || (v432 & 1) != 0 && v14 == 895
        || (v432 & 1) != 0 && v14 == 13
        || (v432 & 2) != 0 && v14 == 739)
      {
LABEL_81:
        uint64_t result = fprintf(v8, "%20s:\t%llu\n");
        goto LABEL_82;
      }

      if ((v432 & 1) != 0 && v14 == 14)
      {
        uint64_t result = fprintf(v8, "%20s:\n", "hostWriteLogHisto");
        else {
          uint64_t v24 = v438;
        }
        if ((_DWORD)v24)
        {
          for (uint64_t j = 0LL; j != v24; ++j)
            uint64_t result = fprintf(v8, "                      [%d] = %llu\n", j, v15[j]);
        }

        goto LABEL_82;
      }

      if ((v432 & 1) != 0 && v14 == 15)
      {
        uint64_t result = fprintf(v8, "%20s:\n", "hostReadLogHisto");
        else {
          uint64_t v26 = v438;
        }
        if ((_DWORD)v26)
        {
          for (uint64_t k = 0LL; k != v26; ++k)
            uint64_t result = fprintf(v8, "                      [%d] = %llu\n", k, v15[k]);
        }

        goto LABEL_82;
      }

      if ((v432 & 1) != 0 && v14 == 17
        || (v432 & 1) != 0 && v14 == 18
        || (v432 & 1) != 0 && v14 == 19
        || (v432 & 1) != 0 && v14 == 916
        || (v432 & 1) != 0 && v14 == 917
        || (v432 & 1) != 0 && v14 == 1024
        || (v432 & 1) != 0 && v14 == 414
        || (v432 & 1) != 0 && v14 == 22
        || (v432 & 1) != 0 && v14 == 23
        || (v432 & 1) != 0 && v14 == 24
        || (v432 & 1) != 0 && v14 == 404
        || (v432 & 1) != 0 && v14 == 817
        || (v432 & 1) != 0 && v14 == 818
        || (v432 & 1) != 0 && v14 == 819
        || (v432 & 1) != 0 && v14 == 820
        || (v432 & 1) != 0 && v14 == 28
        || (v432 & 1) != 0 && v14 == 30
        || (v432 & 1) != 0 && v14 == 31
        || (v432 & 1) != 0 && v14 == 337
        || (v432 & 1) != 0 && v14 == 34
        || (v432 & 1) != 0 && v14 == 92
        || (v432 & 1) != 0 && v14 == 36
        || (v432 & 1) != 0 && v14 == 37
        || (v432 & 1) != 0 && v14 == 190
        || (v432 & 1) != 0 && v14 == 38
        || (v432 & 1) != 0 && v14 == 39
        || (v432 & 1) != 0 && v14 == 41
        || (v432 & 1) != 0 && v14 == 42
        || (v432 & 1) != 0 && v14 == 43
        || (v432 & 1) != 0 && v14 == 44
        || (v432 & 1) != 0 && v14 == 996
        || (v432 & 1) != 0 && v14 == 997
        || (v432 & 1) != 0 && v14 == 998
        || (v432 & 1) != 0 && v14 == 999
        || (v432 & 1) != 0 && v14 == 45
        || (v432 & 1) != 0 && v14 == 334
        || (v432 & 2) != 0 && v14 == 198
        || (v432 & 2) != 0 && v14 == 46
        || (v432 & 1) != 0 && v14 == 47
        || (v432 & 1) != 0 && v14 == 379
        || (v432 & 1) != 0 && v14 == 48
        || (v432 & 2) != 0 && v14 == 51
        || (v432 & 2) != 0 && v14 == 52
        || (v432 & 2) != 0 && v14 == 53)
      {
        goto LABEL_81;
      }

      if ((v432 & 2) != 0 && v14 == 54)
      {
        uint64_t result = fprintf(v8, "%20s:\n", "ECBins");
        else {
          uint64_t v28 = v438;
        }
        if ((_DWORD)v28)
        {
          for (uint64_t m = 0LL; m != v28; ++m)
            uint64_t result = fprintf(v8, "                      [%d] = %llu\n", m, v15[m]);
        }

        goto LABEL_82;
      }

      if ((v432 & 2) != 0 && v14 == 55)
      {
        uint64_t result = fprintf(v8, "%20s:\n", "RCBins");
        else {
          uint64_t v30 = v438;
        }
        if ((_DWORD)v30)
        {
          for (uint64_t n = 0LL; n != v30; ++n)
            uint64_t result = fprintf(v8, "                      [%d] = %llu\n", n, v15[n]);
        }

        goto LABEL_82;
      }

      if ((v432 & 2) != 0 && v14 == 56
        || (v432 & 2) != 0 && v14 == 57
        || (v432 & 2) != 0 && v14 == 58
        || (v432 & 2) != 0 && v14 == 791
        || (v432 & 1) != 0 && v14 == 1189)
      {
        goto LABEL_81;
      }

      if ((v432 & 1) != 0 && v14 == 1190)
      {
        uint64_t result = fprintf(v8, "%20s:\n", "powerDownTime");
        else {
          uint64_t v32 = v438;
        }
        if ((_DWORD)v32)
        {
          for (iuint64_t i = 0LL; ii != v32; ++ii)
            uint64_t result = fprintf(v8, "                      [%d] = %llu\n", ii, v15[ii]);
        }

        goto LABEL_82;
      }

      if ((v432 & 1) != 0 && v14 == 1244) {
        goto LABEL_81;
      }
      if ((v432 & 1) != 0 && v14 == 90)
      {
        uint64_t result = fprintf(v8, "%20s:\n", "qosPerCmdQ");
        else {
          uint64_t v34 = v438;
        }
        if ((_DWORD)v34)
        {
          for (juint64_t j = 0LL; jj != v34; ++jj)
            uint64_t result = fprintf(v8, "                      [%d] = %llu\n", jj, v15[jj]);
        }

        goto LABEL_82;
      }

      if ((v432 & 1) != 0 && v14 == 91)
      {
        uint64_t result = fprintf(v8, "%20s:\n", "maxQosPerCmdQ");
        else {
          uint64_t v36 = v438;
        }
        if ((_DWORD)v36)
        {
          for (kuint64_t k = 0LL; kk != v36; ++kk)
            uint64_t result = fprintf(v8, "                      [%d] = %llu\n", kk, v15[kk]);
        }

        goto LABEL_82;
      }

      if ((v432 & 2) != 0 && v14 == 59
        || (v432 & 2) != 0 && v14 == 60
        || (v432 & 2) != 0 && v14 == 61
        || (v432 & 2) != 0 && v14 == 62
        || (v432 & 2) != 0 && v14 == 63
        || (v432 & 2) != 0 && v14 == 64
        || (v432 & 2) != 0 && v14 == 65
        || (v432 & 2) != 0 && v14 == 66
        || (v432 & 2) != 0 && v14 == 67
        || (v432 & 2) != 0 && v14 == 68
        || (v432 & 2) != 0 && v14 == 69
        || (v432 & 2) != 0 && v14 == 70
        || (v432 & 2) != 0 && v14 == 109
        || (v432 & 2) != 0 && v14 == 71
        || (v432 & 2) != 0 && v14 == 72
        || (v432 & 1) != 0 && v14 == 73
        || (v432 & 1) != 0 && v14 == 75
        || (v432 & 1) != 0 && v14 == 76
        || (v432 & 1) != 0 && v14 == 77)
      {
        goto LABEL_81;
      }

      if ((v432 & 1) != 0 && v14 == 265)
      {
        uint64_t result = fprintf(v8, "%20s:\n", "readCountHisto");
        else {
          uint64_t v38 = v438;
        }
        if ((_DWORD)v38)
        {
          for (muint64_t m = 0LL; mm != v38; ++mm)
            uint64_t result = fprintf(v8, "                      [%d] = %llu\n", mm, v15[mm]);
        }

        goto LABEL_82;
      }

      if ((v432 & 1) != 0 && v14 == 80
        || (v432 & 1) != 0 && v14 == 81
        || (v432 & 1) != 0 && v14 == 82
        || (v432 & 1) != 0 && v14 == 1019
        || (v432 & 2) != 0 && v14 == 85
        || (v432 & 2) != 0 && v14 == 86
        || (v432 & 1) != 0 && v14 == 87)
      {
        goto LABEL_81;
      }

      if ((v432 & 1) != 0 && v14 == 1215)
      {
        uint64_t result = fprintf(v8, "%20s:\n", "hostWritesPerThrottleZone");
        else {
          uint64_t v40 = v438;
        }
        if ((_DWORD)v40)
        {
          for (nuint64_t n = 0LL; nn != v40; ++nn)
            uint64_t result = fprintf(v8, "                      [%d] = %llu\n", nn, v15[nn]);
        }

        goto LABEL_82;
      }

      if ((v432 & 1) != 0 && v14 == 93)
      {
        uint64_t result = fprintf(v8, "%20s:\n", "numBandsRefreshedForAgePerTier");
        else {
          uint64_t v42 = v438;
        }
        if ((_DWORD)v42)
        {
          for (uint64_t i1 = 0LL; i1 != v42; ++i1)
            uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i1, v15[i1]);
        }

        goto LABEL_82;
      }

      if ((v432 & 1) != 0 && v14 == 94)
      {
        uint64_t result = fprintf(v8, "%20s:\n", "bdrDeltaHot");
        else {
          uint64_t v44 = v438;
        }
        if ((_DWORD)v44)
        {
          for (uint64_t i2 = 0LL; i2 != v44; ++i2)
            uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i2, v15[i2]);
        }

        goto LABEL_82;
      }

      if ((v432 & 1) != 0 && v14 == 112
        || (v432 & 1) != 0 && v14 == 95
        || (v432 & 1) != 0 && v14 == 96
        || (v432 & 1) != 0 && v14 == 381
        || (v432 & 1) != 0 && v14 == 130
        || (v432 & 1) != 0 && v14 == 97
        || (v432 & 1) != 0 && v14 == 98
        || (v432 & 4) != 0 && v14 == 106
        || (v432 & 4) != 0 && v14 == 100
        || (v432 & 4) != 0 && v14 == 101
        || (v432 & 4) != 0 && v14 == 102
        || (v432 & 4) != 0 && v14 == 103
        || (v432 & 4) != 0 && v14 == 104
        || (v432 & 4) != 0 && v14 == 105
        || (v432 & 2) != 0 && v14 == 110)
      {
        goto LABEL_81;
      }

      if ((v432 & 1) != 0 && v14 == 113)
      {
        uint64_t result = fprintf(v8, "%20s:\n", "bandsPerHostFlow");
        else {
          uint64_t v46 = v438;
        }
        if ((_DWORD)v46)
        {
          for (uint64_t i3 = 0LL; i3 != v46; ++i3)
            uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i3, v15[i3]);
        }

        goto LABEL_82;
      }

      if ((v432 & 1) != 0 && v14 == 114)
      {
        uint64_t result = fprintf(v8, "%20s:\n", "bandsPerSpecialFlow");
        else {
          uint64_t v48 = v438;
        }
        if ((_DWORD)v48)
        {
          for (uint64_t i4 = 0LL; i4 != v48; ++i4)
            uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i4, v15[i4]);
        }

        goto LABEL_82;
      }

      if ((v432 & 1) != 0 && v14 == 115)
      {
        uint64_t result = fprintf(v8, "%20s:\n", "secsPerHostFlow");
        else {
          uint64_t v50 = v438;
        }
        if ((_DWORD)v50)
        {
          for (uint64_t i5 = 0LL; i5 != v50; ++i5)
            uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i5, v15[i5]);
        }

        goto LABEL_82;
      }

      if ((v432 & 1) != 0 && v14 == 116)
      {
        uint64_t result = fprintf(v8, "%20s:\n", "secsPerSpecialFlow");
        else {
          uint64_t v52 = v438;
        }
        if ((_DWORD)v52)
        {
          for (uint64_t i6 = 0LL; i6 != v52; ++i6)
            uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i6, v15[i6]);
        }

        goto LABEL_82;
      }

      if ((v432 & 1) != 0 && v14 == 118)
      {
        uint64_t result = fprintf(v8, "%20s:\n", "overWritesPerHostFlow");
        else {
          uint64_t v54 = v438;
        }
        if ((_DWORD)v54)
        {
          for (uint64_t i7 = 0LL; i7 != v54; ++i7)
            uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i7, v15[i7]);
        }

        goto LABEL_82;
      }

      if ((v432 & 1) != 0 && v14 == 119)
      {
        uint64_t result = fprintf(v8, "%20s:\n", "overWritesPerSpecialFlow");
        else {
          uint64_t v56 = v438;
        }
        if ((_DWORD)v56)
        {
          for (uint64_t i8 = 0LL; i8 != v56; ++i8)
            uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i8, v15[i8]);
        }

        goto LABEL_82;
      }

      if ((v432 & 1) != 0 && v14 == 120)
      {
        uint64_t result = fprintf(v8, "%20s:\n", "padSectorsPerFlow");
        else {
          uint64_t v58 = v438;
        }
        if ((_DWORD)v58)
        {
          for (uint64_t i9 = 0LL; i9 != v58; ++i9)
            uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i9, v15[i9]);
        }

        goto LABEL_82;
      }

      if ((v432 & 1) != 0 && v14 == 121)
      {
        uint64_t result = fprintf(v8, "%20s:\n", "padSizes");
        else {
          uint64_t v60 = v438;
        }
        if ((_DWORD)v60)
        {
          for (uint64_t i10 = 0LL; i10 != v60; ++i10)
            uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i10, v15[i10]);
        }

        goto LABEL_82;
      }

      if ((v432 & 1) != 0 && v14 == 740) {
        goto LABEL_81;
      }
      if ((v432 & 1) != 0 && v14 == 122)
      {
        uint64_t result = fprintf(v8, "%20s:\n", "unmapsPerHostFlow");
        else {
          uint64_t v62 = v438;
        }
        if ((_DWORD)v62)
        {
          for (uint64_t i11 = 0LL; i11 != v62; ++i11)
            uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i11, v15[i11]);
        }

        goto LABEL_82;
      }

      if ((v432 & 1) != 0 && v14 == 123)
      {
        uint64_t result = fprintf(v8, "%20s:\n", "unmapsPerSpecialFlow");
        else {
          uint64_t v64 = v438;
        }
        if ((_DWORD)v64)
        {
          for (uint64_t i12 = 0LL; i12 != v64; ++i12)
            uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i12, v15[i12]);
        }

        goto LABEL_82;
      }

      if ((v432 & 1) != 0 && v14 == 124)
      {
        uint64_t result = fprintf(v8, "%20s:\n", "coldestCycle");
        else {
          uint64_t v66 = v438;
        }
        if ((_DWORD)v66)
        {
          for (uint64_t i13 = 0LL; i13 != v66; ++i13)
            uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i13, v15[i13]);
        }

        goto LABEL_82;
      }

      if ((v432 & 1) != 0 && v14 == 503)
      {
        uint64_t result = fprintf(v8, "%20s:\n", "avgCycle");
        else {
          uint64_t v68 = v438;
        }
        if ((_DWORD)v68)
        {
          for (uint64_t i14 = 0LL; i14 != v68; ++i14)
            uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i14, v15[i14]);
        }

        goto LABEL_82;
      }

      if ((v432 & 1) != 0 && v14 == 125)
      {
        uint64_t result = fprintf(v8, "%20s:\n", "hottestCycle");
        else {
          uint64_t v70 = v438;
        }
        if ((_DWORD)v70)
        {
          for (uint64_t i15 = 0LL; i15 != v70; ++i15)
            uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i15, v15[i15]);
        }

        goto LABEL_82;
      }

      if ((v432 & 1) != 0 && v14 == 16
        || (v432 & 1) != 0 && v14 == 126
        || (v432 & 1) != 0 && v14 == 139
        || (v432 & 1) != 0 && v14 == 576
        || (v432 & 1) != 0 && v14 == 604
        || (v432 & 1) != 0 && v14 == 721
        || (v432 & 1) != 0 && v14 == 722
        || (v432 & 1) != 0 && v14 == 723
        || (v432 & 1) != 0 && v14 == 724
        || (v432 & 1) != 0 && v14 == 726
        || (v432 & 1) != 0 && v14 == 140
        || (v432 & 1) != 0 && v14 == 346)
      {
        goto LABEL_81;
      }

      if ((v432 & 1) != 0 && v14 == 131)
      {
        uint64_t result = fprintf(v8, "%20s:\n", "errInjCounters");
        else {
          uint64_t v72 = v438;
        }
        if ((_DWORD)v72)
        {
          for (uint64_t i16 = 0LL; i16 != v72; ++i16)
            uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i16, v15[i16]);
        }

        goto LABEL_82;
      }

      if ((v432 & 2) != 0 && v14 == 962
        || (v432 & 1) != 0 && v14 == 132
        || (v432 & 1) != 0 && v14 == 133
        || (v432 & 1) != 0 && v14 == 135
        || (v432 & 1) != 0 && v14 == 388
        || (v432 & 1) != 0 && v14 == 389
        || (v432 & 1) != 0 && v14 == 390
        || (v432 & 1) != 0 && v14 == 391
        || (v432 & 1) != 0 && v14 == 392
        || (v432 & 1) != 0 && v14 == 393
        || (v432 & 1) != 0 && v14 == 394
        || (v432 & 1) != 0 && v14 == 395
        || (v432 & 1) != 0 && v14 == 586
        || (v432 & 1) != 0 && v14 == 587
        || (v432 & 1) != 0 && v14 == 760
        || (v432 & 1) != 0 && v14 == 761
        || (v432 & 1) != 0 && v14 == 762
        || (v432 & 1) != 0 && v14 == 763
        || (v432 & 1) != 0 && v14 == 134
        || (v432 & 1) != 0 && v14 == 400)
      {
        goto LABEL_81;
      }

      if ((v432 & 1) != 0 && v14 == 476)
      {
        uint64_t result = fprintf(v8, "%20s:\n", "raidSuccessfulRecoLbaRange");
        else {
          uint64_t v74 = v438;
        }
        if ((_DWORD)v74)
        {
          for (uint64_t i17 = 0LL; i17 != v74; ++i17)
            uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i17, v15[i17]);
        }

        goto LABEL_82;
      }

      if ((v432 & 1) != 0 && v14 == 477)
      {
        uint64_t result = fprintf(v8, "%20s:\n", "raidFailedRecoLbaRange");
        else {
          uint64_t v76 = v438;
        }
        if ((_DWORD)v76)
        {
          for (uint64_t i18 = 0LL; i18 != v76; ++i18)
            uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i18, v15[i18]);
        }

        goto LABEL_82;
      }

      if ((v432 & 1) != 0 && v14 == 630)
      {
        uint64_t result = fprintf(v8, "%20s:\n", "raidSuccessfulRecoEAN");
        else {
          uint64_t v78 = v438;
        }
        if ((_DWORD)v78)
        {
          for (uint64_t i19 = 0LL; i19 != v78; ++i19)
            uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i19, v15[i19]);
        }

        goto LABEL_82;
      }

      if ((v432 & 1) != 0 && v14 == 631)
      {
        uint64_t result = fprintf(v8, "%20s:\n", "raidFailedRecoEAN");
        else {
          uint64_t v80 = v438;
        }
        if ((_DWORD)v80)
        {
          for (uint64_t i20 = 0LL; i20 != v80; ++i20)
            uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i20, v15[i20]);
        }

        goto LABEL_82;
      }

      if ((v432 & 1) != 0 && v14 == 644
        || (v432 & 1) != 0 && v14 == 645
        || (v432 & 1) != 0 && v14 == 646
        || (v432 & 1) != 0 && v14 == 647
        || (v432 & 1) != 0 && v14 == 648
        || (v432 & 1) != 0 && v14 == 649
        || (v432 & 1) != 0 && v14 == 864
        || (v432 & 1) != 0 && v14 == 862
        || (v432 & 1) != 0 && v14 == 863
        || (v432 & 2) != 0 && v14 == 813
        || (v432 & 1) != 0 && v14 == 697
        || (v432 & 1) != 0 && v14 == 698
        || (v432 & 1) != 0 && v14 == 712
        || (v432 & 1) != 0 && v14 == 713
        || (v432 & 1) != 0 && v14 == 737
        || (v432 & 1) != 0 && v14 == 738
        || (v432 & 1) != 0 && v14 == 714
        || (v432 & 1) != 0 && v14 == 715
        || (v432 & 1) != 0 && v14 == 716
        || (v432 & 1) != 0 && v14 == 717
        || (v432 & 1) != 0 && v14 == 829)
      {
        goto LABEL_81;
      }

      if ((v432 & 1) != 0 && v14 == 891)
      {
        uint64_t result = fprintf(v8, "%20s:\n", "turboRaidSuccessAuxPartition");
        else {
          uint64_t v82 = v438;
        }
        if ((_DWORD)v82)
        {
          for (uint64_t i21 = 0LL; i21 != v82; ++i21)
            uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i21, v15[i21]);
        }

        goto LABEL_82;
      }

      if ((v432 & 1) != 0 && v14 == 892)
      {
        uint64_t result = fprintf(v8, "%20s:\n", "turboRaidFailAuxPartition");
        else {
          uint64_t v84 = v438;
        }
        if ((_DWORD)v84)
        {
          for (uint64_t i22 = 0LL; i22 != v84; ++i22)
            uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i22, v15[i22]);
        }

        goto LABEL_82;
      }

      if ((v432 & 1) != 0 && v14 == 893)
      {
        uint64_t result = fprintf(v8, "%20s:\n", "turboRaidClassifyQualPartition");
        else {
          uint64_t v86 = v438;
        }
        if ((_DWORD)v86)
        {
          for (uint64_t i23 = 0LL; i23 != v86; ++i23)
            uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i23, v15[i23]);
        }

        goto LABEL_82;
      }

      if ((v432 & 1) != 0 && v14 == 894)
      {
        uint64_t result = fprintf(v8, "%20s:\n", "turboRaidClassifyRelPartition");
        else {
          uint64_t v88 = v438;
        }
        if ((_DWORD)v88)
        {
          for (uint64_t i24 = 0LL; i24 != v88; ++i24)
            uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i24, v15[i24]);
        }

        goto LABEL_82;
      }

      if ((v432 & 1) != 0 && v14 == 900
        || (v432 & 1) != 0 && v14 == 901
        || (v432 & 1) != 0 && v14 == 902
        || (v432 & 1) != 0 && v14 == 903
        || (v432 & 1) != 0 && v14 == 904
        || (v432 & 1) != 0 && v14 == 947
        || (v432 & 1) != 0 && v14 == 1133
        || (v432 & 1) != 0 && v14 == 1134
        || (v432 & 1) != 0 && v14 == 1135
        || (v432 & 1) != 0 && v14 == 1136
        || (v432 & 1) != 0 && v14 == 362
        || (v432 & 1) != 0 && v14 == 396
        || (v432 & 1) != 0 && v14 == 398
        || (v432 & 1) != 0 && v14 == 397
        || (v432 & 1) != 0 && v14 == 399
        || (v432 & 1) != 0 && v14 == 405
        || (v432 & 1) != 0 && v14 == 403
        || (v432 & 1) != 0 && v14 == 573
        || (v432 & 1) != 0 && v14 == 197
        || (v432 & 1) != 0 && v14 == 136
        || (v432 & 1) != 0 && v14 == 137
        || (v432 & 1) != 0 && v14 == 444
        || (v432 & 1) != 0 && v14 == 445
        || (v432 & 1) != 0 && v14 == 964
        || (v432 & 1) != 0 && v14 == 965
        || (v432 & 1) != 0 && v14 == 440
        || (v432 & 1) != 0 && v14 == 960
        || (v432 & 1) != 0 && v14 == 441
        || (v432 & 1) != 0 && v14 == 442
        || (v432 & 1) != 0 && v14 == 443
        || (v432 & 1) != 0 && v14 == 382
        || (v432 & 1) != 0 && v14 == 659
        || (v432 & 1) != 0 && v14 == 172
        || (v432 & 1) != 0 && v14 == 416
        || (v432 & 1) != 0 && v14 == 417)
      {
        goto LABEL_81;
      }

      if ((v432 & 1) != 0 && v14 == 406)
      {
        uint64_t result = fprintf(v8, "%20s:\n", "raidReconstructSuccessFlow");
        else {
          uint64_t v90 = v438;
        }
        if ((_DWORD)v90)
        {
          for (uint64_t i25 = 0LL; i25 != v90; ++i25)
            uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i25, v15[i25]);
        }

        goto LABEL_82;
      }

      if ((v432 & 1) != 0 && v14 == 407)
      {
        uint64_t result = fprintf(v8, "%20s:\n", "raidReconstructFailFlow");
        else {
          uint64_t v92 = v438;
        }
        if ((_DWORD)v92)
        {
          for (uint64_t i26 = 0LL; i26 != v92; ++i26)
            uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i26, v15[i26]);
        }

        goto LABEL_82;
      }

      if ((v432 & 1) != 0 && v14 == 472
        || (v432 & 1) != 0 && v14 == 473
        || (v432 & 1) != 0 && v14 == 639
        || (v432 & 1) != 0 && v14 == 640)
      {
        goto LABEL_81;
      }

      if ((v432 & 1) != 0 && v14 == 469)
      {
        uint64_t result = fprintf(v8, "%20s:\n", "raidReconstructSuccessPartition");
        else {
          uint64_t v94 = v438;
        }
        if ((_DWORD)v94)
        {
          for (uint64_t i27 = 0LL; i27 != v94; ++i27)
            uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i27, v15[i27]);
        }

        goto LABEL_82;
      }

      if ((v432 & 1) != 0 && v14 == 470)
      {
        uint64_t result = fprintf(v8, "%20s:\n", "raidReconstructFailPartition");
        else {
          uint64_t v96 = v438;
        }
        if ((_DWORD)v96)
        {
          for (uint64_t i28 = 0LL; i28 != v96; ++i28)
            uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i28, v15[i28]);
        }

        goto LABEL_82;
      }

      if ((v432 & 1) != 0 && v14 == 408
        || (v432 & 1) != 0 && v14 == 409
        || (v432 & 1) != 0 && v14 == 786
        || (v432 & 1) != 0 && v14 == 787
        || (v432 & 1) != 0 && v14 == 410
        || (v432 & 1) != 0 && v14 == 788
        || (v432 & 1) != 0 && v14 == 411
        || (v432 & 1) != 0 && v14 == 510
        || (v432 & 1) != 0 && v14 == 566
        || (v432 & 1) != 0 && v14 == 567
        || (v432 & 1) != 0 && v14 == 570
        || (v432 & 1) != 0 && v14 == 574
        || (v432 & 1) != 0 && v14 == 789
        || (v432 & 1) != 0 && v14 == 681
        || (v432 & 1) != 0 && v14 == 682
        || (v432 & 1) != 0 && v14 == 711
        || (v432 & 1) != 0 && v14 == 790
        || (v432 & 1) != 0 && v14 == 774
        || (v432 & 1) != 0 && v14 == 412
        || (v432 & 1) != 0 && v14 == 471
        || (v432 & 1) != 0 && v14 == 641)
      {
        goto LABEL_81;
      }

      if ((v432 & 1) != 0 && v14 == 798)
      {
        uint64_t result = fprintf(v8, "%20s:\n", "raidBMXFailP");
        else {
          uint64_t v98 = v438;
        }
        if ((_DWORD)v98)
        {
          for (uint64_t i29 = 0LL; i29 != v98; ++i29)
            uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i29, v15[i29]);
        }

        goto LABEL_82;
      }

      if ((v432 & 1) != 0 && v14 == 799)
      {
        uint64_t result = fprintf(v8, "%20s:\n", "raidBMXFailUECC");
        else {
          uint64_t v100 = v438;
        }
        if ((_DWORD)v100)
        {
          for (uint64_t i30 = 0LL; i30 != v100; ++i30)
            uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i30, v15[i30]);
        }

        goto LABEL_82;
      }

      if ((v432 & 1) != 0 && v14 == 804)
      {
        uint64_t result = fprintf(v8, "%20s:\n", "raidBMXFailNoSPBX");
        else {
          uint64_t v102 = v438;
        }
        if ((_DWORD)v102)
        {
          for (uint64_t i31 = 0LL; i31 != v102; ++i31)
            uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i31, v15[i31]);
        }

        goto LABEL_82;
      }

      if ((v432 & 1) != 0 && v14 == 806)
      {
        uint64_t result = fprintf(v8, "%20s:\n", "raidBMXFailBlank");
        else {
          uint64_t v104 = v438;
        }
        if ((_DWORD)v104)
        {
          for (uint64_t i32 = 0LL; i32 != v104; ++i32)
            uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i32, v15[i32]);
        }

        goto LABEL_82;
      }

      if ((v432 & 1) != 0 && v14 == 809)
      {
        uint64_t result = fprintf(v8, "%20s:\n", "raidBMXFailUnsup");
        else {
          uint64_t v106 = v438;
        }
        if ((_DWORD)v106)
        {
          for (uint64_t i33 = 0LL; i33 != v106; ++i33)
            uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i33, v15[i33]);
        }

        goto LABEL_82;
      }

      if ((v432 & 1) != 0 && v14 == 811)
      {
        uint64_t result = fprintf(v8, "%20s:\n", "raidBMXFailMpSkip");
        else {
          uint64_t v108 = v438;
        }
        if ((_DWORD)v108)
        {
          for (uint64_t i34 = 0LL; i34 != v108; ++i34)
            uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i34, v15[i34]);
        }

        goto LABEL_82;
      }

      if ((v432 & 1) != 0 && v14 == 812)
      {
        uint64_t result = fprintf(v8, "%20s:\n", "raidBMXFailAbort");
        else {
          uint64_t v110 = v438;
        }
        if ((_DWORD)v110)
        {
          for (uint64_t i35 = 0LL; i35 != v110; ++i35)
            uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i35, v15[i35]);
        }

        goto LABEL_82;
      }

      if ((v432 & 1) != 0 && v14 == 814)
      {
        uint64_t result = fprintf(v8, "%20s:\n", "raidBMXFailOther");
        else {
          uint64_t v112 = v438;
        }
        if ((_DWORD)v112)
        {
          for (uint64_t i36 = 0LL; i36 != v112; ++i36)
            uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i36, v15[i36]);
        }

        goto LABEL_82;
      }

      if ((v432 & 1) != 0 && v14 == 815)
      {
        uint64_t result = fprintf(v8, "%20s:\n", "raidBMXSuccess");
        else {
          uint64_t v114 = v438;
        }
        if ((_DWORD)v114)
        {
          for (uint64_t i37 = 0LL; i37 != v114; ++i37)
            uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i37, v15[i37]);
        }

        goto LABEL_82;
      }

      if ((v432 & 1) != 0 && v14 == 184)
      {
        v116 = "TempSensorMax";
      }

      else
      {
        if ((v432 & 1) == 0 || v14 != 185)
        {
          if ((v432 & 1) != 0 && v14 == 182
            || (v432 & 1) != 0 && v14 == 353
            || (v432 & 1) != 0 && v14 == 609
            || (v432 & 1) != 0 && v14 == 596
            || (v432 & 1) != 0 && v14 == 597
            || (v432 & 1) != 0 && v14 == 152
            || (v432 & 1) != 0 && v14 == 153
            || (v432 & 1) != 0 && v14 == 154
            || (v432 & 1) != 0 && v14 == 384
            || (v432 & 1) != 0 && v14 == 386
            || (v432 & 1) != 0 && v14 == 657
            || (v432 & 1) != 0 && v14 == 387
            || (v432 & 1) != 0 && v14 == 420
            || (v432 & 1) != 0 && v14 == 438
            || (v432 & 1) != 0 && v14 == 155
            || (v432 & 1) != 0 && v14 == 156
            || (v432 & 1) != 0 && v14 == 158
            || (v432 & 1) != 0 && v14 == 159
            || (v432 & 1) != 0 && v14 == 539
            || (v432 & 1) != 0 && v14 == 540
            || (v432 & 2) != 0 && v14 == 160
            || (v432 & 2) != 0 && v14 == 161
            || (v432 & 2) != 0 && v14 == 163
            || (v432 & 2) != 0 && v14 == 164
            || (v432 & 2) != 0 && v14 == 165
            || (v432 & 1) != 0 && v14 == 141
            || (v432 & 1) != 0 && v14 == 142
            || (v432 & 1) != 0 && v14 == 143
            || (v432 & 1) != 0 && v14 == 144
            || (v432 & 1) != 0 && v14 == 145
            || (v432 & 1) != 0 && v14 == 146
            || (v432 & 1) != 0 && v14 == 187
            || (v432 & 1) != 0 && v14 == 188
            || (v432 & 1) != 0 && v14 == 189
            || (v432 & 1) != 0 && v14 == 147
            || (v432 & 1) != 0 && v14 == 148
            || (v432 & 1) != 0 && v14 == 149
            || (v432 & 1) != 0 && v14 == 183
            || (v432 & 1) != 0 && v14 == 204
            || (v432 & 1) != 0 && v14 == 205
            || (v432 & 1) != 0 && v14 == 206
            || (v432 & 2) != 0 && v14 == 248
            || (v432 & 2) != 0 && v14 == 199
            || (v432 & 1) != 0 && v14 == 200
            || (v432 & 1) != 0 && v14 == 201
            || (v432 & 2) != 0 && v14 == 203)
          {
            goto LABEL_81;
          }

          if ((v432 & 1) != 0 && v14 == 207)
          {
            uint64_t result = fprintf(v8, "%20s:\n", "numOfThrottlingEntriesPerLevel");
            else {
              uint64_t v117 = v438;
            }
            if ((_DWORD)v117)
            {
              for (uint64_t i38 = 0LL; i38 != v117; ++i38)
                uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i38, v15[i38]);
            }
          }

          else if ((v432 & 1) != 0 && v14 == 865)
          {
            uint64_t result = fprintf(v8, "%20s:\n", "timeOfThrottlingPerLevel");
            else {
              uint64_t v119 = v438;
            }
            if ((_DWORD)v119)
            {
              for (uint64_t i39 = 0LL; i39 != v119; ++i39)
                uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i39, v15[i39]);
            }
          }

          else if ((v432 & 2) != 0 && v14 == 453)
          {
            uint64_t result = fprintf(v8, "%20s:\n", "numOfThrottlingEntriesPerReadLevel");
            else {
              uint64_t v121 = v438;
            }
            if ((_DWORD)v121)
            {
              for (uint64_t i40 = 0LL; i40 != v121; ++i40)
                uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i40, v15[i40]);
            }
          }

          else if ((v432 & 2) != 0 && v14 == 866)
          {
            uint64_t result = fprintf(v8, "%20s:\n", "timeOfThrottlingPerReadLevel");
            else {
              uint64_t v123 = v438;
            }
            if ((_DWORD)v123)
            {
              for (uint64_t i41 = 0LL; i41 != v123; ++i41)
                uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i41, v15[i41]);
            }
          }

          else if ((v432 & 2) != 0 && v14 == 454)
          {
            uint64_t result = fprintf(v8, "%20s:\n", "numOfThrottlingEntriesPerWriteLevel");
            else {
              uint64_t v125 = v438;
            }
            if ((_DWORD)v125)
            {
              for (uint64_t i42 = 0LL; i42 != v125; ++i42)
                uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i42, v15[i42]);
            }
          }

          else if ((v432 & 2) != 0 && v14 == 867)
          {
            uint64_t result = fprintf(v8, "%20s:\n", "timeOfThrottlingPerWriteLevel");
            else {
              uint64_t v127 = v438;
            }
            if ((_DWORD)v127)
            {
              for (uint64_t i43 = 0LL; i43 != v127; ++i43)
                uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i43, v15[i43]);
            }
          }

          else if ((v432 & 1) != 0 && v14 == 213)
          {
            uint64_t result = fprintf(v8, "%20s:\n", "crcInternalReadFail");
            else {
              uint64_t v129 = v438;
            }
            if ((_DWORD)v129)
            {
              for (uint64_t i44 = 0LL; i44 != v129; ++i44)
                uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i44, v15[i44]);
            }
          }

          else
          {
            if ((v432 & 1) != 0 && v14 == 217
              || (v432 & 1) != 0 && v14 == 1067
              || (v432 & 1) != 0 && v14 == 221
              || (v432 & 1) != 0 && v14 == 222
              || (v432 & 1) != 0 && v14 == 1221
              || (v432 & 1) != 0 && v14 == 223
              || (v432 & 1) != 0 && v14 == 224
              || (v432 & 1) != 0 && v14 == 1222
              || (v432 & 1) != 0 && v14 == 494)
            {
              goto LABEL_81;
            }

            if ((v432 & 1) != 0 && v14 == 1223)
            {
              uint64_t result = fprintf(v8, "%20s:\n", "RD_closedBlocksTHHist");
              else {
                uint64_t v131 = v438;
              }
              if ((_DWORD)v131)
              {
                for (uint64_t i45 = 0LL; i45 != v131; ++i45)
                  uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i45, v15[i45]);
              }
            }

            else if ((v432 & 1) != 0 && v14 == 229)
            {
              uint64_t result = fprintf(v8, "%20s:\n", "indmbXferCountTo");
              else {
                uint64_t v133 = v438;
              }
              if ((_DWORD)v133)
              {
                for (uint64_t i46 = 0LL; i46 != v133; ++i46)
                  uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i46, v15[i46]);
              }
            }

            else if ((v432 & 1) != 0 && v14 == 230)
            {
              uint64_t result = fprintf(v8, "%20s:\n", "indmbAccumulatedTimeBetweenXfers");
              else {
                uint64_t v135 = v438;
              }
              if ((_DWORD)v135)
              {
                for (uint64_t i47 = 0LL; i47 != v135; ++i47)
                  uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i47, v15[i47]);
              }
            }

            else
            {
              if ((v432 & 1) != 0 && v14 == 231
                || (v432 & 1) != 0 && v14 == 232
                || (v432 & 1) != 0 && v14 == 233
                || (v432 & 1) != 0 && v14 == 234)
              {
                goto LABEL_81;
              }

              if ((v432 & 1) != 0 && v14 == 235)
              {
                uint64_t result = fprintf(v8, "%20s:\n", "gracefulBootTimeLogMs");
                else {
                  uint64_t v137 = v438;
                }
                if ((_DWORD)v137)
                {
                  for (uint64_t i48 = 0LL; i48 != v137; ++i48)
                    uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i48, v15[i48]);
                }
              }

              else if ((v432 & 1) != 0 && v14 == 236)
              {
                uint64_t result = fprintf(v8, "%20s:\n", "ungracefulBootTimeLogMs");
                else {
                  uint64_t v139 = v438;
                }
                if ((_DWORD)v139)
                {
                  for (uint64_t i49 = 0LL; i49 != v139; ++i49)
                    uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i49, v15[i49]);
                }
              }

              else
              {
                if ((v432 & 1) != 0 && v14 == 245
                  || (v432 & 1) != 0 && v14 == 246
                  || (v432 & 1) != 0 && v14 == 247
                  || (v432 & 1) != 0 && v14 == 254)
                {
                  goto LABEL_81;
                }

                if ((v432 & 1) != 0 && v14 == 266)
                {
                  uint64_t result = fprintf(v8, "%20s:\n", "readAmpHisto");
                  else {
                    uint64_t v141 = v438;
                  }
                  if ((_DWORD)v141)
                  {
                    for (uint64_t i50 = 0LL; i50 != v141; ++i50)
                      uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i50, v15[i50]);
                  }
                }

                else
                {
                  if ((v432 & 1) != 0 && v14 == 267) {
                    goto LABEL_81;
                  }
                  if ((v432 & 1) != 0 && v14 == 269)
                  {
                    uint64_t result = fprintf(v8, "%20s:\n", "numBootBlockRefreshSuccess");
                    else {
                      uint64_t v143 = v438;
                    }
                    if ((_DWORD)v143)
                    {
                      for (uint64_t i51 = 0LL; i51 != v143; ++i51)
                        uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i51, v15[i51]);
                    }
                  }

                  else if ((v432 & 1) != 0 && v14 == 270)
                  {
                    uint64_t result = fprintf(v8, "%20s:\n", "numBootBlockRefreshFail");
                    else {
                      uint64_t v145 = v438;
                    }
                    if ((_DWORD)v145)
                    {
                      for (uint64_t i52 = 0LL; i52 != v145; ++i52)
                        uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i52, v15[i52]);
                    }
                  }

                  else
                  {
                    if ((v432 & 1) != 0 && v14 == 322
                      || (v432 & 1) != 0 && v14 == 323
                      || (v432 & 1) != 0 && v14 == 271
                      || (v432 & 1) != 0 && v14 == 272
                      || (v432 & 1) != 0 && v14 == 274)
                    {
                      goto LABEL_81;
                    }

                    if ((v432 & 1) != 0 && v14 == 277)
                    {
                      uint64_t result = fprintf(v8, "%20s:\n", "powerBudgetSelect");
                      else {
                        uint64_t v147 = v438;
                      }
                      if ((_DWORD)v147)
                      {
                        for (uint64_t i53 = 0LL; i53 != v147; ++i53)
                          uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i53, v15[i53]);
                      }
                    }

                    else
                    {
                      if ((v432 & 1) != 0 && v14 == 279) {
                        goto LABEL_81;
                      }
                      if ((v432 & 1) != 0 && v14 == 280)
                      {
                        uint64_t result = fprintf(v8, "%20s:\n", "E2EDPErrorCounters");
                        else {
                          uint64_t v149 = v438;
                        }
                        if ((_DWORD)v149)
                        {
                          for (uint64_t i54 = 0LL; i54 != v149; ++i54)
                            uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i54, v15[i54]);
                        }
                      }

                      else
                      {
                        if ((v432 & 2) != 0 && v14 == 281
                          || (v432 & 2) != 0 && v14 == 282
                          || (v432 & 2) != 0 && v14 == 283
                          || (v432 & 2) != 0 && v14 == 284
                          || (v432 & 2) != 0 && v14 == 285
                          || (v432 & 2) != 0 && v14 == 286
                          || (v432 & 1) != 0 && v14 == 288)
                        {
                          goto LABEL_81;
                        }

                        if ((v432 & 1) != 0 && v14 == 289)
                        {
                          uint64_t result = fprintf(v8, "%20s:\n", "mspBootBlockReadFail");
                          else {
                            uint64_t v151 = v438;
                          }
                          if ((_DWORD)v151)
                          {
                            for (uint64_t i55 = 0LL; i55 != v151; ++i55)
                              uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i55, v15[i55]);
                          }
                        }

                        else if ((v432 & 1) != 0 && v14 == 290)
                        {
                          uint64_t result = fprintf(v8, "%20s:\n", "mspBootBlockProgFail");
                          else {
                            uint64_t v153 = v438;
                          }
                          if ((_DWORD)v153)
                          {
                            for (uint64_t i56 = 0LL; i56 != v153; ++i56)
                              uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i56, v15[i56]);
                          }
                        }

                        else if ((v432 & 1) != 0 && v14 == 291)
                        {
                          uint64_t result = fprintf(v8, "%20s:\n", "mspBootBlockEraseFail");
                          else {
                            uint64_t v155 = v438;
                          }
                          if ((_DWORD)v155)
                          {
                            for (uint64_t i57 = 0LL; i57 != v155; ++i57)
                              uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i57, v15[i57]);
                          }
                        }

                        else if ((v432 & 2) != 0 && v14 == 511)
                        {
                          uint64_t result = fprintf(v8, "%20s:\n", "mspbootBlockRefreshCnt");
                          else {
                            uint64_t v157 = v438;
                          }
                          if ((_DWORD)v157)
                          {
                            for (uint64_t i58 = 0LL; i58 != v157; ++i58)
                              uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i58, v15[i58]);
                          }
                        }

                        else if ((v432 & 2) != 0 && v14 == 516)
                        {
                          uint64_t result = fprintf(v8, "%20s:\n", "mspBootBlockRefreshTime");
                          else {
                            uint64_t v159 = v438;
                          }
                          if ((_DWORD)v159)
                          {
                            for (uint64_t i59 = 0LL; i59 != v159; ++i59)
                              uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i59, v15[i59]);
                          }
                        }

                        else
                        {
                          if ((v432 & 2) != 0 && v14 == 517
                            || (v432 & 2) != 0 && v14 == 777
                            || (v432 & 1) != 0 && v14 == 292)
                          {
                            goto LABEL_81;
                          }

                          if ((v432 & 1) != 0 && v14 == 298)
                          {
                            uint64_t result = fprintf(v8, "%20s:\n", "perHostReads");
                            else {
                              uint64_t v161 = v438;
                            }
                            if ((_DWORD)v161)
                            {
                              for (uint64_t i60 = 0LL; i60 != v161; ++i60)
                                uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i60, v15[i60]);
                            }
                          }

                          else if ((v432 & 1) != 0 && v14 == 299)
                          {
                            uint64_t result = fprintf(v8, "%20s:\n", "perHostReadXacts");
                            else {
                              uint64_t v163 = v438;
                            }
                            if ((_DWORD)v163)
                            {
                              for (uint64_t i61 = 0LL; i61 != v163; ++i61)
                                uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i61, v15[i61]);
                            }
                          }

                          else if ((v432 & 1) != 0 && v14 == 300)
                          {
                            uint64_t result = fprintf(v8, "%20s:\n", "perHostWrites");
                            else {
                              uint64_t v165 = v438;
                            }
                            if ((_DWORD)v165)
                            {
                              for (uint64_t i62 = 0LL; i62 != v165; ++i62)
                                uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i62, v15[i62]);
                            }
                          }

                          else if ((v432 & 1) != 0 && v14 == 301)
                          {
                            uint64_t result = fprintf(v8, "%20s:\n", "perHostWriteXacts");
                            else {
                              uint64_t v167 = v438;
                            }
                            if ((_DWORD)v167)
                            {
                              for (uint64_t i63 = 0LL; i63 != v167; ++i63)
                                uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i63, v15[i63]);
                            }
                          }

                          else if ((v432 & 1) != 0 && v14 == 302)
                          {
                            uint64_t result = fprintf(v8, "%20s:\n", "perHostNumFlushes");
                            else {
                              uint64_t v169 = v438;
                            }
                            if ((_DWORD)v169)
                            {
                              for (uint64_t i64 = 0LL; i64 != v169; ++i64)
                                uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i64, v15[i64]);
                            }
                          }

                          else if ((v432 & 1) != 0 && v14 == 303)
                          {
                            uint64_t result = fprintf(v8, "%20s:\n", "perHostNumFences");
                            else {
                              uint64_t v171 = v438;
                            }
                            if ((_DWORD)v171)
                            {
                              for (uint64_t i65 = 0LL; i65 != v171; ++i65)
                                uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i65, v15[i65]);
                            }
                          }

                          else if ((v432 & 1) != 0 && v14 == 304)
                          {
                            uint64_t result = fprintf(v8, "%20s:\n", "commitPadSectorsPerFlow");
                            else {
                              uint64_t v173 = v438;
                            }
                            if ((_DWORD)v173)
                            {
                              for (uint64_t i66 = 0LL; i66 != v173; ++i66)
                                uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i66, v15[i66]);
                            }
                          }

                          else if ((v432 & 1) != 0 && v14 == 305)
                          {
                            uint64_t result = fprintf(v8, "%20s:\n", "wcacheDSOverWrLogSizeCnts");
                            else {
                              uint64_t v175 = v438;
                            }
                            if ((_DWORD)v175)
                            {
                              for (uint64_t i67 = 0LL; i67 != v175; ++i67)
                                uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i67, v15[i67]);
                            }
                          }

                          else if ((v432 & 1) != 0 && v14 == 306)
                          {
                            uint64_t result = fprintf(v8, "%20s:\n", "wcacheDSOverWrSizeByFlow");
                            else {
                              uint64_t v177 = v438;
                            }
                            if ((_DWORD)v177)
                            {
                              for (uint64_t i68 = 0LL; i68 != v177; ++i68)
                                uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i68, v15[i68]);
                            }
                          }

                          else if ((v432 & 1) != 0 && v14 == 307)
                          {
                            uint64_t result = fprintf(v8, "%20s:\n", "CmdRaisePrioiryEvents");
                            else {
                              uint64_t v179 = v438;
                            }
                            if ((_DWORD)v179)
                            {
                              for (uint64_t i69 = 0LL; i69 != v179; ++i69)
                                uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i69, v15[i69]);
                            }
                          }

                          else
                          {
                            if ((v432 & 1) != 0 && v14 == 308
                              || (v432 & 1) != 0 && v14 == 309
                              || (v432 & 1) != 0 && v14 == 310
                              || (v432 & 1) != 0 && v14 == 347)
                            {
                              goto LABEL_81;
                            }

                            if ((v432 & 1) != 0 && v14 == 314)
                            {
                              uint64_t result = fprintf(v8, "%20s:\n", "numBootBlockValidateSuccess");
                              else {
                                uint64_t v181 = v438;
                              }
                              if ((_DWORD)v181)
                              {
                                for (uint64_t i70 = 0LL; i70 != v181; ++i70)
                                  uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i70, v15[i70]);
                              }
                            }

                            else if ((v432 & 1) != 0 && v14 == 315)
                            {
                              uint64_t result = fprintf(v8, "%20s:\n", "numBootBlockValidateFail");
                              else {
                                uint64_t v183 = v438;
                              }
                              if ((_DWORD)v183)
                              {
                                for (uint64_t i71 = 0LL; i71 != v183; ++i71)
                                  uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i71, v15[i71]);
                              }
                            }

                            else if ((v432 & 1) != 0 && v14 == 316)
                            {
                              uint64_t result = fprintf(v8, "%20s:\n", "clogPagesFillingPercentage");
                              else {
                                uint64_t v185 = v438;
                              }
                              if ((_DWORD)v185)
                              {
                                for (uint64_t i72 = 0LL; i72 != v185; ++i72)
                                  uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i72, v15[i72]);
                              }
                            }

                            else
                            {
                              if ((v432 & 2) != 0 && v14 == 317
                                || (v432 & 2) != 0 && v14 == 643
                                || (v432 & 1) != 0 && v14 == 336
                                || (v432 & 1) != 0 && v14 == 318
                                || (v432 & 1) != 0 && v14 == 319
                                || (v432 & 1) != 0 && v14 == 320
                                || (v432 & 1) != 0 && v14 == 321)
                              {
                                goto LABEL_81;
                              }

                              if ((v432 & 1) != 0 && v14 == 324)
                              {
                                uint64_t result = fprintf(v8, "%20s:\n", "bitflipAddr");
                                else {
                                  uint64_t v187 = v438;
                                }
                                if ((_DWORD)v187)
                                {
                                  for (uint64_t i73 = 0LL; i73 != v187; ++i73)
                                    uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i73, v15[i73]);
                                }
                              }

                              else if ((v432 & 1) != 0 && v14 == 325)
                              {
                                uint64_t result = fprintf(v8, "%20s:\n", "bitflipCount");
                                else {
                                  uint64_t v189 = v438;
                                }
                                if ((_DWORD)v189)
                                {
                                  for (uint64_t i74 = 0LL; i74 != v189; ++i74)
                                    uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i74, v15[i74]);
                                }
                              }

                              else if ((v432 & 1) != 0 && v14 == 326)
                              {
                                uint64_t result = fprintf(v8, "%20s:\n", "bitflipDupes");
                                else {
                                  uint64_t v191 = v438;
                                }
                                if ((_DWORD)v191)
                                {
                                  for (uint64_t i75 = 0LL; i75 != v191; ++i75)
                                    uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i75, v15[i75]);
                                }
                              }

                              else if ((v432 & 1) != 0 && v14 == 327)
                              {
                                uint64_t result = fprintf(v8, "%20s:\n", "bandsMaxTempHisto");
                                else {
                                  uint64_t v193 = v438;
                                }
                                if ((_DWORD)v193)
                                {
                                  for (uint64_t i76 = 0LL; i76 != v193; ++i76)
                                    uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i76, v15[i76]);
                                }
                              }

                              else if ((v432 & 1) != 0 && v14 == 328)
                              {
                                uint64_t result = fprintf(v8, "%20s:\n", "bandsMinTempHisto");
                                else {
                                  uint64_t v195 = v438;
                                }
                                if ((_DWORD)v195)
                                {
                                  for (uint64_t i77 = 0LL; i77 != v195; ++i77)
                                    uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i77, v15[i77]);
                                }
                              }

                              else if ((v432 & 1) != 0 && v14 == 329)
                              {
                                uint64_t result = fprintf(v8, "%20s:\n", "bandsLifeTimeTempHisto");
                                else {
                                  uint64_t v197 = v438;
                                }
                                if ((_DWORD)v197)
                                {
                                  for (uint64_t i78 = 0LL; i78 != v197; ++i78)
                                    uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i78, v15[i78]);
                                }
                              }

                              else if ((v432 & 1) != 0 && v14 == 330)
                              {
                                uint64_t result = fprintf(v8, "%20s:\n", "bandsDeltaTempHisto");
                                else {
                                  uint64_t v199 = v438;
                                }
                                if ((_DWORD)v199)
                                {
                                  for (uint64_t i79 = 0LL; i79 != v199; ++i79)
                                    uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i79, v15[i79]);
                                }
                              }

                              else if ((v432 & 1) != 0 && v14 == 331)
                              {
                                uint64_t result = fprintf(v8, "%20s:\n", "bandsCrossTempHisto");
                                else {
                                  uint64_t v201 = v438;
                                }
                                if ((_DWORD)v201)
                                {
                                  for (uint64_t i80 = 0LL; i80 != v201; ++i80)
                                    uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i80, v15[i80]);
                                }
                              }

                              else if ((v432 & 1) != 0 && v14 == 1031)
                              {
                                uint64_t result = fprintf(v8, "%20s:\n", "bandsUeccTempHisto");
                                else {
                                  uint64_t v203 = v438;
                                }
                                if ((_DWORD)v203)
                                {
                                  for (uint64_t i81 = 0LL; i81 != v203; ++i81)
                                    uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i81, v15[i81]);
                                }
                              }

                              else if ((v432 & 1) != 0 && v14 == 1246)
                              {
                                uint64_t result = fprintf(v8, "%20s:\n", "bandsUeccCrossTempHisto");
                                else {
                                  uint64_t v205 = v438;
                                }
                                if ((_DWORD)v205)
                                {
                                  for (uint64_t i82 = 0LL; i82 != v205; ++i82)
                                    uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i82, v15[i82]);
                                }
                              }

                              else
                              {
                                if ((v432 & 2) != 0 && v14 == 603) {
                                  goto LABEL_81;
                                }
                                if ((v432 & 1) != 0 && v14 == 332)
                                {
                                  uint64_t result = fprintf(v8, "%20s:\n", "wcacheWaitLogMs");
                                  else {
                                    uint64_t v207 = v438;
                                  }
                                  if ((_DWORD)v207)
                                  {
                                    for (uint64_t i83 = 0LL; i83 != v207; ++i83)
                                      uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i83, v15[i83]);
                                  }
                                }

                                else if ((v432 & 1) != 0 && v14 == 333)
                                {
                                  uint64_t result = fprintf(v8, "%20s:\n", "wcacheDS_segsSortedLogSize");
                                  else {
                                    uint64_t v209 = v438;
                                  }
                                  if ((_DWORD)v209)
                                  {
                                    for (uint64_t i84 = 0LL; i84 != v209; ++i84)
                                      uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i84, v15[i84]);
                                  }
                                }

                                else if ((v432 & 1) != 0 && v14 == 468)
                                {
                                  uint64_t result = fprintf(v8, "%20s:\n", "wcacheDirtyAtFlush");
                                  else {
                                    uint64_t v211 = v438;
                                  }
                                  if ((_DWORD)v211)
                                  {
                                    for (uint64_t i85 = 0LL; i85 != v211; ++i85)
                                      uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i85, v15[i85]);
                                  }
                                }

                                else
                                {
                                  if ((v432 & 2) != 0 && v14 == 457
                                    || (v432 & 2) != 0 && v14 == 458
                                    || (v432 & 1) != 0 && v14 == 340
                                    || (v432 & 1) != 0 && v14 == 953
                                    || (v432 & 1) != 0 && v14 == 343
                                    || (v432 & 1) != 0 && v14 == 344
                                    || (v432 & 1) != 0 && v14 == 349
                                    || (v432 & 1) != 0 && v14 == 350
                                    || (v432 & 1) != 0 && v14 == 351
                                    || (v432 & 1) != 0 && v14 == 352
                                    || (v432 & 1) != 0 && v14 == 356
                                    || (v432 & 1) != 0 && v14 == 358
                                    || (v432 & 1) != 0 && v14 == 368
                                    || (v432 & 1) != 0 && v14 == 369
                                    || (v432 & 1) != 0 && v14 == 370
                                    || (v432 & 1) != 0 && v14 == 371
                                    || (v432 & 1) != 0 && v14 == 372
                                    || (v432 & 1) != 0 && v14 == 374
                                    || (v432 & 1) != 0 && v14 == 375
                                    || (v432 & 1) != 0 && v14 == 385
                                    || (v432 & 1) != 0 && v14 == 401
                                    || (v432 & 1) != 0 && v14 == 837
                                    || (v432 & 2) != 0 && v14 == 419
                                    || (v432 & 1) != 0 && v14 == 422
                                    || (v432 & 1) != 0 && v14 == 423
                                    || (v432 & 1) != 0 && v14 == 424
                                    || (v432 & 1) != 0 && v14 == 425
                                    || (v432 & 1) != 0 && v14 == 427
                                    || (v432 & 1) != 0 && v14 == 461
                                    || (v432 & 1) != 0 && v14 == 485
                                    || (v432 & 1) != 0 && v14 == 462
                                    || (v432 & 1) != 0 && v14 == 784)
                                  {
                                    goto LABEL_81;
                                  }

                                  if ((v432 & 1) != 0 && v14 == 463)
                                  {
                                    uint64_t result = fprintf(v8, "%20s:\n", "balanceProportionBucketsHistogram");
                                    else {
                                      uint64_t v213 = v438;
                                    }
                                    if ((_DWORD)v213)
                                    {
                                      for (uint64_t i86 = 0LL; i86 != v213; ++i86)
                                        uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i86, v15[i86]);
                                    }
                                  }

                                  else if ((v432 & 1) != 0 && v14 == 551)
                                  {
                                    uint64_t result = fprintf(v8, "%20s:\n", "balanceProportionBucketsHistogramTlc");
                                    else {
                                      uint64_t v215 = v438;
                                    }
                                    if ((_DWORD)v215)
                                    {
                                      for (uint64_t i87 = 0LL; i87 != v215; ++i87)
                                        uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i87, v15[i87]);
                                    }
                                  }

                                  else
                                  {
                                    if ((v432 & 1) != 0 && v14 == 464) {
                                      goto LABEL_81;
                                    }
                                    if ((v432 & 1) != 0 && v14 == 465)
                                    {
                                      uint64_t result = fprintf(v8, "%20s:\n", "burstSizeHistogram");
                                      else {
                                        uint64_t v217 = v438;
                                      }
                                      if ((_DWORD)v217)
                                      {
                                        for (uint64_t i88 = 0LL; i88 != v217; ++i88)
                                          uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i88, v15[i88]);
                                      }
                                    }

                                    else if ((v432 & 1) != 0 && v14 == 913)
                                    {
                                      uint64_t result = fprintf(v8, "%20s:\n", "fwaHistogram");
                                      else {
                                        uint64_t v219 = v438;
                                      }
                                      if ((_DWORD)v219)
                                      {
                                        for (uint64_t i89 = 0LL; i89 != v219; ++i89)
                                          uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i89, v15[i89]);
                                      }
                                    }

                                    else
                                    {
                                      if ((v432 & 1) != 0 && v14 == 483
                                        || (v432 & 2) != 0 && v14 == 428
                                        || (v432 & 1) != 0 && v14 == 429
                                        || (v432 & 1) != 0 && v14 == 430
                                        || (v432 & 1) != 0 && v14 == 431
                                        || (v432 & 1) != 0 && v14 == 432
                                        || (v432 & 1) != 0 && v14 == 433
                                        || (v432 & 1) != 0 && v14 == 434
                                        || (v432 & 1) != 0 && v14 == 435
                                        || (v432 & 1) != 0 && v14 == 436
                                        || (v432 & 1) != 0 && v14 == 437
                                        || (v432 & 1) != 0 && v14 == 447
                                        || (v432 & 1) != 0 && v14 == 448
                                        || (v432 & 1) != 0 && v14 == 449
                                        || (v432 & 1) != 0 && v14 == 488
                                        || (v432 & 1) != 0 && v14 == 486
                                        || (v432 & 1) != 0 && v14 == 450)
                                      {
                                        goto LABEL_81;
                                      }

                                      if ((v432 & 1) != 0 && v14 == 460)
                                      {
                                        uint64_t result = fprintf(v8, "%20s:\n", "CacheDepthVsThroughput");
                                        else {
                                          uint64_t v221 = v438;
                                        }
                                        if ((_DWORD)v221)
                                        {
                                          for (uint64_t i90 = 0LL; i90 != v221; ++i90)
                                            uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i90, v15[i90]);
                                        }
                                      }

                                      else if ((v432 & 1) != 0 && v14 == 466)
                                      {
                                        uint64_t result = fprintf(v8, "%20s:\n", "qosDirectToTLC");
                                        else {
                                          uint64_t v223 = v438;
                                        }
                                        if ((_DWORD)v223)
                                        {
                                          for (uint64_t i91 = 0LL; i91 != v223; ++i91)
                                            uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i91, v15[i91]);
                                        }
                                      }

                                      else if ((v432 & 1) != 0 && v14 == 467)
                                      {
                                        uint64_t result = fprintf(v8, "%20s:\n", "maxQosDirectToTLC");
                                        else {
                                          uint64_t v225 = v438;
                                        }
                                        if ((_DWORD)v225)
                                        {
                                          for (uint64_t i92 = 0LL; i92 != v225; ++i92)
                                            uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i92, v15[i92]);
                                        }
                                      }

                                      else
                                      {
                                        if ((v432 & 1) != 0 && v14 == 518
                                          || (v432 & 1) != 0 && v14 == 519
                                          || (v432 & 2) != 0 && v14 == 627
                                          || (v432 & 2) != 0 && v14 == 628
                                          || (v432 & 2) != 0 && v14 == 629
                                          || (v432 & 2) != 0 && v14 == 671
                                          || (v432 & 2) != 0 && v14 == 672
                                          || (v432 & 2) != 0 && v14 == 816
                                          || (v432 & 1) != 0 && v14 == 538
                                          || (v432 & 1) != 0 && v14 == 487)
                                        {
                                          goto LABEL_81;
                                        }

                                        if ((v432 & 1) != 0 && v14 == 490)
                                        {
                                          uint64_t result = fprintf(v8, "%20s:\n", "bdrTmpHist");
                                          else {
                                            uint64_t v227 = v438;
                                          }
                                          if ((_DWORD)v227)
                                          {
                                            for (uint64_t i93 = 0LL; i93 != v227; ++i93)
                                              uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i93, v15[i93]);
                                          }
                                        }

                                        else
                                        {
                                          if ((v432 & 1) != 0 && v14 == 491 || (v432 & 1) != 0 && v14 == 492) {
                                            goto LABEL_81;
                                          }
                                          if ((v432 & 1) != 0 && v14 == 624)
                                          {
                                            uint64_t result = fprintf(v8, "%20s:\n", "clogFailReason");
                                            else {
                                              uint64_t v229 = v438;
                                            }
                                            if ((_DWORD)v229)
                                            {
                                              for (uint64_t i94 = 0LL; i94 != v229; ++i94)
                                                uint64_t result = fprintf( v8,  "                      [%d] = %llu\n",  i94,  v15[i94]);
                                            }
                                          }

                                          else if ((v432 & 1) != 0 && v14 == 1001)
                                          {
                                            uint64_t result = fprintf(v8, "%20s:\n", "clogReplayFailReason");
                                            else {
                                              uint64_t v231 = v438;
                                            }
                                            if ((_DWORD)v231)
                                            {
                                              for (uint64_t i95 = 0LL; i95 != v231; ++i95)
                                                uint64_t result = fprintf( v8,  "                      [%d] = %llu\n",  i95,  v15[i95]);
                                            }
                                          }

                                          else
                                          {
                                            if ((v432 & 1) != 0 && v14 == 1002
                                              || (v432 & 1) != 0 && v14 == 1003
                                              || (v432 & 1) != 0 && v14 == 493
                                              || (v432 & 1) != 0 && v14 == 497
                                              || (v432 & 1) != 0 && v14 == 495
                                              || (v432 & 1) != 0 && v14 == 496
                                              || (v432 & 1) != 0 && v14 == 498
                                              || (v432 & 1) != 0 && v14 == 499
                                              || (v432 & 1) != 0 && v14 == 500
                                              || (v432 & 1) != 0 && v14 == 606
                                              || (v432 & 1) != 0 && v14 == 617
                                              || (v432 & 1) != 0 && v14 == 607
                                              || (v432 & 1) != 0 && v14 == 618
                                              || (v432 & 1) != 0 && v14 == 619
                                              || (v432 & 1) != 0 && v14 == 620
                                              || (v432 & 1) != 0 && v14 == 625
                                              || (v432 & 1) != 0 && v14 == 626
                                              || (v432 & 1) != 0 && v14 == 1009
                                              || (v432 & 1) != 0 && v14 == 1010)
                                            {
                                              goto LABEL_81;
                                            }

                                            if ((v432 & 1) != 0 && v14 == 621)
                                            {
                                              uint64_t result = fprintf(v8, "%20s:\n", "eanBootReadsHist");
                                              else {
                                                uint64_t v233 = v438;
                                              }
                                              if ((_DWORD)v233)
                                              {
                                                for (uint64_t i96 = 0LL; i96 != v233; ++i96)
                                                  uint64_t result = fprintf( v8,  "                      [%d] = %llu\n",  i96,  v15[i96]);
                                              }
                                            }

                                            else if ((v432 & 1) != 0 && v14 == 632)
                                            {
                                              uint64_t result = fprintf(v8, "%20s:\n", "eanFirstReadMode");
                                              else {
                                                uint64_t v235 = v438;
                                              }
                                              if ((_DWORD)v235)
                                              {
                                                for (uint64_t i97 = 0LL; i97 != v235; ++i97)
                                                  uint64_t result = fprintf( v8,  "                      [%d] = %llu\n",  i97,  v15[i97]);
                                              }
                                            }

                                            else
                                            {
                                              if ((v432 & 1) != 0 && v14 == 642
                                                || (v432 & 1) != 0 && v14 == 502
                                                || (v432 & 1) != 0 && v14 == 505
                                                || (v432 & 1) != 0 && v14 == 506
                                                || (v432 & 1) != 0 && v14 == 507
                                                || (v432 & 1) != 0 && v14 == 520
                                                || (v432 & 1) != 0 && v14 == 521
                                                || (v432 & 1) != 0 && v14 == 522
                                                || (v432 & 1) != 0 && v14 == 523
                                                || (v432 & 1) != 0 && v14 == 524
                                                || (v432 & 1) != 0 && v14 == 525
                                                || (v432 & 1) != 0 && v14 == 526
                                                || (v432 & 1) != 0 && v14 == 527
                                                || (v432 & 1) != 0 && v14 == 612
                                                || (v432 & 1) != 0 && v14 == 616
                                                || (v432 & 1) != 0 && v14 == 664
                                                || (v432 & 1) != 0 && v14 == 665
                                                || (v432 & 1) != 0 && v14 == 707
                                                || (v432 & 1) != 0 && v14 == 708
                                                || (v432 & 2) != 0 && v14 == 530
                                                || (v432 & 1) != 0 && v14 == 531
                                                || (v432 & 1) != 0 && v14 == 828
                                                || (v432 & 1) != 0 && v14 == 532
                                                || (v432 & 1) != 0 && v14 == 533
                                                || (v432 & 1) != 0 && v14 == 534
                                                || (v432 & 1) != 0 && v14 == 535
                                                || (v432 & 1) != 0 && v14 == 537
                                                || (v432 & 1) != 0 && v14 == 543
                                                || (v432 & 2) != 0 && v14 == 581
                                                || (v432 & 2) != 0 && v14 == 582
                                                || (v432 & 1) != 0 && v14 == 583
                                                || (v432 & 1) != 0 && v14 == 584
                                                || (v432 & 1) != 0 && v14 == 544
                                                || (v432 & 1) != 0 && v14 == 553
                                                || (v432 & 1) != 0 && v14 == 557
                                                || (v432 & 1) != 0 && v14 == 1117
                                                || (v432 & 1) != 0 && v14 == 548
                                                || (v432 & 1) != 0 && v14 == 611
                                                || (v432 & 1) != 0 && v14 == 545
                                                || (v432 & 1) != 0 && v14 == 558
                                                || (v432 & 1) != 0 && v14 == 559
                                                || (v432 & 1) != 0 && v14 == 1112
                                                || (v432 & 1) != 0 && v14 == 563
                                                || (v432 & 1) != 0 && v14 == 564
                                                || (v432 & 1) != 0 && v14 == 613
                                                || (v432 & 1) != 0 && v14 == 614
                                                || (v432 & 1) != 0 && v14 == 615)
                                              {
                                                goto LABEL_81;
                                              }

                                              if ((v432 & 1) != 0 && v14 == 546)
                                              {
                                                uint64_t result = fprintf(v8, "%20s:\n", "slcDemandBurstSizeDetected");
                                                else {
                                                  uint64_t v237 = v438;
                                                }
                                                if ((_DWORD)v237)
                                                {
                                                  for (uint64_t i98 = 0LL; i98 != v237; ++i98)
                                                    uint64_t result = fprintf( v8,  "                      [%d] = %llu\n",  i98,  v15[i98]);
                                                }
                                              }

                                              else if ((v432 & 1) != 0 && v14 == 549)
                                              {
                                                uint64_t result = fprintf(v8, "%20s:\n", "slcDemandBurstSizeSlc");
                                                else {
                                                  uint64_t v239 = v438;
                                                }
                                                if ((_DWORD)v239)
                                                {
                                                  for (uint64_t i99 = 0LL; i99 != v239; ++i99)
                                                    uint64_t result = fprintf( v8,  "                      [%d] = %llu\n",  i99,  v15[i99]);
                                                }
                                              }

                                              else if ((v432 & 1) != 0 && v14 == 547)
                                              {
                                                uint64_t result = fprintf(v8, "%20s:\n", "slcDemandBurstDur");
                                                else {
                                                  uint64_t v241 = v438;
                                                }
                                                if ((_DWORD)v241)
                                                {
                                                  for (uint64_t i100 = 0LL; i100 != v241; ++i100)
                                                    uint64_t result = fprintf( v8,  "                      [%d] = %llu\n",  i100,  v15[i100]);
                                                }
                                              }

                                              else
                                              {
                                                if ((v432 & 1) != 0 && v14 == 560
                                                  || (v432 & 1) != 0 && v14 == 635
                                                  || (v432 & 1) != 0 && v14 == 636
                                                  || (v432 & 1) != 0 && v14 == 637
                                                  || (v432 & 1) != 0 && v14 == 561
                                                  || (v432 & 1) != 0 && v14 == 565
                                                  || (v432 & 1) != 0 && v14 == 568
                                                  || (v432 & 1) != 0 && v14 == 575
                                                  || (v432 & 1) != 0 && v14 == 588
                                                  || (v432 & 1) != 0 && v14 == 589
                                                  || (v432 & 1) != 0 && v14 == 590
                                                  || (v432 & 1) != 0 && v14 == 591
                                                  || (v432 & 1) != 0 && v14 == 594
                                                  || (v432 & 1) != 0 && v14 == 595
                                                  || (v432 & 1) != 0 && v14 == 602)
                                                {
                                                  goto LABEL_81;
                                                }

                                                if ((v432 & 1) != 0 && v14 == 638)
                                                {
                                                  uint64_t result = fprintf(v8, "%20s:\n", "oslcDemandBurstSize");
                                                  else {
                                                    uint64_t v243 = v438;
                                                  }
                                                  if ((_DWORD)v243)
                                                  {
                                                    for (uint64_t i101 = 0LL; i101 != v243; ++i101)
                                                      uint64_t result = fprintf( v8,  "                      [%d] = %llu\n",  i101,  v15[i101]);
                                                  }
                                                }

                                                else if ((v432 & 1) != 0 && v14 == 674)
                                                {
                                                  uint64_t result = fprintf(v8, "%20s:\n", "oslcNoVotesHw");
                                                  else {
                                                    uint64_t v245 = v438;
                                                  }
                                                  if ((_DWORD)v245)
                                                  {
                                                    for (uint64_t i102 = 0LL; i102 != v245; ++i102)
                                                      uint64_t result = fprintf( v8,  "                      [%d] = %llu\n",  i102,  v15[i102]);
                                                  }
                                                }

                                                else
                                                {
                                                  if ((v432 & 1) != 0 && v14 == 884 || (v432 & 1) != 0 && v14 == 601) {
                                                    goto LABEL_81;
                                                  }
                                                  if ((v432 & 2) != 0 && v14 == 1174)
                                                  {
                                                    uint64_t result = fprintf(v8, "%20s:\n", "nandWritesByMode");
                                                    else {
                                                      uint64_t v247 = v438;
                                                    }
                                                    if ((_DWORD)v247)
                                                    {
                                                      for (uint64_t i103 = 0LL; i103 != v247; ++i103)
                                                        uint64_t result = fprintf( v8,  "                      [%d] = %llu\n",  i103,  v15[i103]);
                                                    }
                                                  }

                                                  else if ((v432 & 2) != 0 && v14 == 1175)
                                                  {
                                                    uint64_t result = fprintf(v8, "%20s:\n", "nandReadsByMode");
                                                    else {
                                                      uint64_t v249 = v438;
                                                    }
                                                    if ((_DWORD)v249)
                                                    {
                                                      for (uint64_t i104 = 0LL; i104 != v249; ++i104)
                                                        uint64_t result = fprintf( v8,  "                      [%d] = %llu\n",  i104,  v15[i104]);
                                                    }
                                                  }

                                                  else if ((v432 & 1) != 0 && v14 == 605)
                                                  {
                                                    uint64_t result = fprintf(v8, "%20s:\n", "gcActiveReasons");
                                                    else {
                                                      uint64_t v251 = v438;
                                                    }
                                                    if ((_DWORD)v251)
                                                    {
                                                      for (uint64_t i105 = 0LL; i105 != v251; ++i105)
                                                        uint64_t result = fprintf( v8,  "                      [%d] = %llu\n",  i105,  v15[i105]);
                                                    }
                                                  }

                                                  else if ((v432 & 1) != 0 && v14 == 610)
                                                  {
                                                    uint64_t result = fprintf(v8, "%20s:\n", "pcieAerCounters");
                                                    else {
                                                      uint64_t v253 = v438;
                                                    }
                                                    if ((_DWORD)v253)
                                                    {
                                                      for (uint64_t i106 = 0LL; i106 != v253; ++i106)
                                                        uint64_t result = fprintf( v8,  "                      [%d] = %llu\n",  i106,  v15[i106]);
                                                    }
                                                  }

                                                  else
                                                  {
                                                    if ((v432 & 1) != 0 && v14 == 622
                                                      || (v432 & 1) != 0 && v14 == 623
                                                      || (v432 & 1) != 0 && v14 == 633
                                                      || (v432 & 1) != 0 && v14 == 634
                                                      || (v432 & 1) != 0 && v14 == 541
                                                      || (v432 & 1) != 0 && v14 == 542
                                                      || (v432 & 1) != 0 && v14 == 667
                                                      || (v432 & 1) != 0 && v14 == 676
                                                      || (v432 & 1) != 0 && v14 == 826)
                                                    {
                                                      goto LABEL_81;
                                                    }

                                                    if ((v432 & 1) != 0 && v14 == 660)
                                                    {
                                                      uint64_t result = fprintf(v8, "%20s:\n", "gcMustReasons");
                                                      else {
                                                        uint64_t v255 = v438;
                                                      }
                                                      if ((_DWORD)v255)
                                                      {
                                                        for (uint64_t i107 = 0LL; i107 != v255; ++i107)
                                                          uint64_t result = fprintf( v8,  "                      [%d] = %llu\n",  i107,  v15[i107]);
                                                      }
                                                    }

                                                    else
                                                    {
                                                      if ((v432 & 2) != 0 && v14 == 666
                                                        || (v432 & 2) != 0 && v14 == 675
                                                        || (v432 & 1) != 0 && v14 == 684)
                                                      {
                                                        goto LABEL_81;
                                                      }

                                                      if ((v432 & 1) != 0 && v14 == 687)
                                                      {
                                                        uint64_t result = fprintf(v8, "%20s:\n", "cbdrInitSent");
                                                        else {
                                                          uint64_t v257 = v438;
                                                        }
                                                        if ((_DWORD)v257)
                                                        {
                                                          for (uint64_t i108 = 0LL; i108 != v257; ++i108)
                                                            uint64_t result = fprintf( v8,  "                      [%d] = %llu\n",  i108,  v15[i108]);
                                                        }
                                                      }

                                                      else
                                                      {
                                                        if ((v432 & 1) != 0 && v14 == 688
                                                          || (v432 & 1) != 0 && v14 == 689
                                                          || (v432 & 1) != 0 && v14 == 690
                                                          || (v432 & 1) != 0 && v14 == 691)
                                                        {
                                                          goto LABEL_81;
                                                        }

                                                        if ((v432 & 1) != 0 && v14 == 694)
                                                        {
                                                          uint64_t result = fprintf(v8, "%20s:\n", "cbdrRefreshGrades");
                                                          else {
                                                            uint64_t v259 = v438;
                                                          }
                                                          if ((_DWORD)v259)
                                                          {
                                                            for (uint64_t i109 = 0LL; i109 != v259; ++i109)
                                                              uint64_t result = fprintf( v8,  "                      [%d] = %llu\n",  i109,  v15[i109]);
                                                          }
                                                        }

                                                        else
                                                        {
                                                          if ((v432 & 1) != 0 && v14 == 695
                                                            || (v432 & 1) != 0 && v14 == 696
                                                            || (v432 & 1) != 0 && v14 == 699)
                                                          {
                                                            goto LABEL_81;
                                                          }

                                                          if ((v432 & 1) != 0 && v14 == 731)
                                                          {
                                                            uint64_t result = fprintf(v8, "%20s:\n", "cbdrLastScannedHr");
                                                            else {
                                                              uint64_t v261 = v438;
                                                            }
                                                            if ((_DWORD)v261)
                                                            {
                                                              for (uint64_t i110 = 0LL; i110 != v261; ++i110)
                                                                uint64_t result = fprintf( v8,  "                      [%d] = %llu\n",  i110,  v15[i110]);
                                                            }
                                                          }

                                                          else
                                                          {
                                                            if ((v432 & 1) != 0 && v14 == 753
                                                              || (v432 & 1) != 0 && v14 == 754
                                                              || (v432 & 1) != 0 && v14 == 755)
                                                            {
                                                              goto LABEL_81;
                                                            }

                                                            if ((v432 & 1) != 0 && v14 == 756)
                                                            {
                                                              uint64_t result = fprintf(v8, "%20s:\n", "cbdrRefreshedAges");
                                                              else {
                                                                uint64_t v263 = v438;
                                                              }
                                                              if ((_DWORD)v263)
                                                              {
                                                                for (uint64_t i111 = 0LL; i111 != v263; ++i111)
                                                                  uint64_t result = fprintf( v8,  "                      [%d] = %llu\n",  i111,  v15[i111]);
                                                              }
                                                            }

                                                            else
                                                            {
                                                              if ((v432 & 1) != 0 && v14 == 757
                                                                || (v432 & 1) != 0 && v14 == 758)
                                                              {
                                                                goto LABEL_81;
                                                              }

                                                              if ((v432 & 1) != 0 && v14 == 759)
                                                              {
                                                                uint64_t result = fprintf(v8, "%20s:\n", "cbdrScanPct");
                                                                else {
                                                                  uint64_t v265 = v438;
                                                                }
                                                                if ((_DWORD)v265)
                                                                {
                                                                  for (uint64_t i112 = 0LL; i112 != v265; ++i112)
                                                                    uint64_t result = fprintf( v8,  "                      [%d] = %llu\n",  i112,  v15[i112]);
                                                                }
                                                              }

                                                              else
                                                              {
                                                                if ((v432 & 1) != 0 && v14 == 766) {
                                                                  goto LABEL_81;
                                                                }
                                                                if ((v432 & 1) != 0 && v14 == 767)
                                                                {
                                                                  uint64_t result = fprintf( v8,  "%20s:\n",  "cbdrRefreshGradesSLC");
                                                                  else {
                                                                    uint64_t v267 = v438;
                                                                  }
                                                                  if ((_DWORD)v267)
                                                                  {
                                                                    for (uint64_t i113 = 0LL; i113 != v267; ++i113)
                                                                      uint64_t result = fprintf( v8,  "                      [%d] = %llu\n",  i113,  v15[i113]);
                                                                  }
                                                                }

                                                                else if ((v432 & 1) != 0 && v14 == 768)
                                                                {
                                                                  uint64_t result = fprintf( v8,  "%20s:\n",  "cbdrRefreshedAgesSLC");
                                                                  else {
                                                                    uint64_t v269 = v438;
                                                                  }
                                                                  if ((_DWORD)v269)
                                                                  {
                                                                    for (uint64_t i114 = 0LL; i114 != v269; ++i114)
                                                                      uint64_t result = fprintf( v8,  "                      [%d] = %llu\n",  i114,  v15[i114]);
                                                                  }
                                                                }

                                                                else if ((v432 & 1) != 0 && v14 == 769)
                                                                {
                                                                  uint64_t result = fprintf(v8, "%20s:\n", "cbdrScanPctSLC");
                                                                  else {
                                                                    uint64_t v271 = v438;
                                                                  }
                                                                  if ((_DWORD)v271)
                                                                  {
                                                                    for (uint64_t i115 = 0LL; i115 != v271; ++i115)
                                                                      uint64_t result = fprintf( v8,  "                      [%d] = %llu\n",  i115,  v15[i115]);
                                                                  }
                                                                }

                                                                else
                                                                {
                                                                  if ((v432 & 2) != 0 && v14 == 970
                                                                    || (v432 & 1) != 0 && v14 == 683
                                                                    || (v432 & 1) != 0 && v14 == 693
                                                                    || (v432 & 1) != 0 && v14 == 718
                                                                    || (v432 & 1) != 0 && v14 == 709
                                                                    || (v432 & 1) != 0 && v14 == 710
                                                                    || (v432 & 1) != 0 && v14 == 719
                                                                    || (v432 & 1) != 0 && v14 == 720)
                                                                  {
                                                                    goto LABEL_81;
                                                                  }

                                                                  if ((v432 & 1) != 0 && v14 == 702)
                                                                  {
                                                                    uint64_t result = fprintf(v8, "%20s:\n", "vcurve");
                                                                    else {
                                                                      uint64_t v273 = v438;
                                                                    }
                                                                    if ((_DWORD)v273)
                                                                    {
                                                                      for (uint64_t i116 = 0LL; i116 != v273; ++i116)
                                                                        uint64_t result = fprintf( v8,  "                      [%d] = %llu\n",  i116,  v15[i116]);
                                                                    }
                                                                  }

                                                                  else if ((v432 & 1) != 0 && v14 == 703)
                                                                  {
                                                                    uint64_t result = fprintf(v8, "%20s:\n", "injDepth");
                                                                    else {
                                                                      uint64_t v275 = v438;
                                                                    }
                                                                    if ((_DWORD)v275)
                                                                    {
                                                                      for (uint64_t i117 = 0LL; i117 != v275; ++i117)
                                                                        uint64_t result = fprintf( v8,  "                      [%d] = %llu\n",  i117,  v15[i117]);
                                                                    }
                                                                  }

                                                                  else
                                                                  {
                                                                    if ((v432 & 1) != 0 && v14 == 704
                                                                      || (v432 & 1) != 0 && v14 == 728
                                                                      || (v432 & 1) != 0 && v14 == 729
                                                                      || (v432 & 1) != 0 && v14 == 730
                                                                      || (v432 & 1) != 0 && v14 == 732
                                                                      || (v432 & 1) != 0 && v14 == 741
                                                                      || (v432 & 1) != 0 && v14 == 742
                                                                      || (v432 & 1) != 0 && v14 == 743
                                                                      || (v432 & 1) != 0 && v14 == 746
                                                                      || (v432 & 1) != 0 && v14 == 747
                                                                      || (v432 & 1) != 0 && v14 == 748
                                                                      || (v432 & 1) != 0 && v14 == 749
                                                                      || (v432 & 1) != 0 && v14 == 750
                                                                      || (v432 & 1) != 0 && v14 == 751
                                                                      || (v432 & 1) != 0 && v14 == 752)
                                                                    {
                                                                      goto LABEL_81;
                                                                    }

                                                                    if ((v432 & 1) != 0 && v14 == 744)
                                                                    {
                                                                      uint64_t result = fprintf( v8,  "%20s:\n",  "raidReconstructDurationHisto");
                                                                      else {
                                                                        uint64_t v277 = v438;
                                                                      }
                                                                      if ((_DWORD)v277)
                                                                      {
                                                                        for (uint64_t i118 = 0LL; i118 != v277; ++i118)
                                                                          uint64_t result = fprintf( v8,  "                      [%d] = %llu\n",  i118,  v15[i118]);
                                                                      }
                                                                    }

                                                                    else if ((v432 & 1) != 0 && v14 == 745)
                                                                    {
                                                                      uint64_t result = fprintf( v8,  "%20s:\n",  "failsOnReconstructHisto");
                                                                      else {
                                                                        uint64_t v279 = v438;
                                                                      }
                                                                      if ((_DWORD)v279)
                                                                      {
                                                                        for (uint64_t i119 = 0LL; i119 != v279; ++i119)
                                                                          uint64_t result = fprintf( v8,  "                      [%d] = %llu\n",  i119,  v15[i119]);
                                                                      }
                                                                    }

                                                                    else
                                                                    {
                                                                      if ((v432 & 1) != 0 && v14 == 776
                                                                        || (v432 & 1) != 0 && v14 == 764
                                                                        || (v432 & 1) != 0 && v14 == 765)
                                                                      {
                                                                        goto LABEL_81;
                                                                      }

                                                                      if ((v432 & 1) != 0 && v14 == 770)
                                                                      {
                                                                        uint64_t result = fprintf( v8,  "%20s:\n",  "cpuBurstLength");
                                                                        else {
                                                                          uint64_t v281 = v438;
                                                                        }
                                                                        if ((_DWORD)v281)
                                                                        {
                                                                          for (uint64_t i120 = 0LL; i120 != v281; ++i120)
                                                                            uint64_t result = fprintf( v8,  "                      [%d] = %llu\n",  i120,  v15[i120]);
                                                                        }
                                                                      }

                                                                      else
                                                                      {
                                                                        if ((v432 & 1) != 0 && v14 == 778
                                                                          || (v432 & 1) != 0 && v14 == 779
                                                                          || (v432 & 1) != 0 && v14 == 780)
                                                                        {
                                                                          goto LABEL_81;
                                                                        }

                                                                        if ((v432 & 1) != 0 && v14 == 781)
                                                                        {
                                                                          uint64_t result = fprintf( v8,  "%20s:\n",  "gcSearchTimeHistory");
                                                                          else {
                                                                            uint64_t v283 = v438;
                                                                          }
                                                                          if ((_DWORD)v283)
                                                                          {
                                                                            for (uint64_t i121 = 0LL; i121 != v283; ++i121)
                                                                              uint64_t result = fprintf( v8,  "                      [%d] = %llu\n",  i121,  v15[i121]);
                                                                          }
                                                                        }

                                                                        else if ((v432 & 1) != 0 && v14 == 785)
                                                                        {
                                                                          uint64_t result = fprintf( v8,  "%20s:\n",  "gcSearchPortion");
                                                                          else {
                                                                            uint64_t v285 = v438;
                                                                          }
                                                                          if ((_DWORD)v285)
                                                                          {
                                                                            for (uint64_t i122 = 0LL; i122 != v285; ++i122)
                                                                              uint64_t result = fprintf( v8,  "                      [%d] = %llu\n",  i122,  v15[i122]);
                                                                          }
                                                                        }

                                                                        else
                                                                        {
                                                                          if ((v432 & 1) != 0 && v14 == 792
                                                                            || (v432 & 1) != 0 && v14 == 793
                                                                            || (v432 & 1) != 0 && v14 == 794
                                                                            || (v432 & 2) != 0 && v14 == 821
                                                                            || (v432 & 1) != 0 && v14 == 822
                                                                            || (v432 & 1) != 0 && v14 == 827)
                                                                          {
                                                                            goto LABEL_81;
                                                                          }

                                                                          if ((v432 & 1) != 0 && v14 == 823)
                                                                          {
                                                                            uint64_t result = fprintf( v8,  "%20s:\n",  "readClassifyStatusesHisto");
                                                                            else {
                                                                              uint64_t v287 = v438;
                                                                            }
                                                                            if ((_DWORD)v287)
                                                                            {
                                                                              for (uint64_t i123 = 0LL; i123 != v287; ++i123)
                                                                                uint64_t result = fprintf( v8,  "                      [%d] = %llu\n",  i123,  v15[i123]);
                                                                            }
                                                                          }

                                                                          else if ((v432 & 1) != 0 && v14 == 824)
                                                                          {
                                                                            uint64_t result = fprintf( v8,  "%20s:\n",  "readWithAuxStatusesHisto");
                                                                            else {
                                                                              uint64_t v289 = v438;
                                                                            }
                                                                            if ((_DWORD)v289)
                                                                            {
                                                                              for (uint64_t i124 = 0LL; i124 != v289; ++i124)
                                                                                uint64_t result = fprintf( v8,  "                      [%d] = %llu\n",  i124,  v15[i124]);
                                                                            }
                                                                          }

                                                                          else if ((v432 & 1) != 0 && v14 == 825)
                                                                          {
                                                                            uint64_t result = fprintf( v8,  "%20s:\n",  "readReconstructStatusesHisto");
                                                                            else {
                                                                              uint64_t v291 = v438;
                                                                            }
                                                                            if ((_DWORD)v291)
                                                                            {
                                                                              for (uint64_t i125 = 0LL; i125 != v291; ++i125)
                                                                                uint64_t result = fprintf( v8,  "                      [%d] = %llu\n",  i125,  v15[i125]);
                                                                            }
                                                                          }

                                                                          else
                                                                          {
                                                                            if ((v432 & 1) != 0 && v14 == 830
                                                                              || (v432 & 1) != 0 && v14 == 831
                                                                              || (v432 & 2) != 0 && v14 == 832)
                                                                            {
                                                                              goto LABEL_81;
                                                                            }

                                                                            if ((v432 & 2) != 0 && v14 == 855)
                                                                            {
                                                                              uint64_t result = fprintf( v8,  "%20s:\n",  "fwFormatVersion");
                                                                              else {
                                                                                uint64_t v293 = v438;
                                                                              }
                                                                              if ((_DWORD)v293)
                                                                              {
                                                                                for (uint64_t i126 = 0LL; i126 != v293; ++i126)
                                                                                  uint64_t result = fprintf( v8,  "                      [%d] = %llu\n",  i126,  v15[i126]);
                                                                              }
                                                                            }

                                                                            else
                                                                            {
                                                                              if ((v432 & 1) != 0 && v14 == 883) {
                                                                                goto LABEL_81;
                                                                              }
                                                                              if ((v432 & 2) != 0 && v14 == 868)
                                                                              {
                                                                                uint64_t result = fprintf( v8,  "%20s:\n",  "dmReasonsSlc_1bc");
                                                                                else {
                                                                                  uint64_t v295 = v438;
                                                                                }
                                                                                if ((_DWORD)v295)
                                                                                {
                                                                                  for (uint64_t i127 = 0LL; i127 != v295; ++i127)
                                                                                    uint64_t result = fprintf( v8,  "                      [%d] = %llu\n",  i127,  v15[i127]);
                                                                                }
                                                                              }

                                                                              else if ((v432 & 2) != 0 && v14 == 869)
                                                                              {
                                                                                uint64_t result = fprintf( v8,  "%20s:\n",  "dmReasonsTlc_1bc");
                                                                                else {
                                                                                  uint64_t v297 = v438;
                                                                                }
                                                                                if ((_DWORD)v297)
                                                                                {
                                                                                  for (uint64_t i128 = 0LL; i128 != v297; ++i128)
                                                                                    uint64_t result = fprintf( v8,  "                      [%d] = %llu\n",  i128,  v15[i128]);
                                                                                }
                                                                              }

                                                                              else if ((v432 & 2) != 0 && v14 == 870)
                                                                              {
                                                                                uint64_t result = fprintf( v8,  "%20s:\n",  "dmReasonsSlc_1bc_he");
                                                                                else {
                                                                                  uint64_t v299 = v438;
                                                                                }
                                                                                if ((_DWORD)v299)
                                                                                {
                                                                                  for (uint64_t i129 = 0LL; i129 != v299; ++i129)
                                                                                    uint64_t result = fprintf( v8,  "                      [%d] = %llu\n",  i129,  v15[i129]);
                                                                                }
                                                                              }

                                                                              else if ((v432 & 2) != 0 && v14 == 871)
                                                                              {
                                                                                uint64_t result = fprintf( v8,  "%20s:\n",  "dmReasonsTlc_1bc_he");
                                                                                else {
                                                                                  uint64_t v301 = v438;
                                                                                }
                                                                                if ((_DWORD)v301)
                                                                                {
                                                                                  for (uint64_t i130 = 0LL; i130 != v301; ++i130)
                                                                                    uint64_t result = fprintf( v8,  "                      [%d] = %llu\n",  i130,  v15[i130]);
                                                                                }
                                                                              }

                                                                              else if ((v432 & 2) != 0 && v14 == 876)
                                                                              {
                                                                                uint64_t result = fprintf( v8,  "%20s:\n",  "dmReasonsSlc_mbc");
                                                                                else {
                                                                                  uint64_t v303 = v438;
                                                                                }
                                                                                if ((_DWORD)v303)
                                                                                {
                                                                                  for (uint64_t i131 = 0LL; i131 != v303; ++i131)
                                                                                    uint64_t result = fprintf( v8,  "                      [%d] = %llu\n",  i131,  v15[i131]);
                                                                                }
                                                                              }

                                                                              else if ((v432 & 2) != 0 && v14 == 877)
                                                                              {
                                                                                uint64_t result = fprintf( v8,  "%20s:\n",  "dmReasonsTlc_mbc");
                                                                                else {
                                                                                  uint64_t v305 = v438;
                                                                                }
                                                                                if ((_DWORD)v305)
                                                                                {
                                                                                  for (uint64_t i132 = 0LL; i132 != v305; ++i132)
                                                                                    uint64_t result = fprintf( v8,  "                      [%d] = %llu\n",  i132,  v15[i132]);
                                                                                }
                                                                              }

                                                                              else
                                                                              {
                                                                                if ((v432 & 1) != 0 && v14 == 896) {
                                                                                  goto LABEL_81;
                                                                                }
                                                                                if ((v432 & 1) != 0 && v14 == 897)
                                                                                {
                                                                                  uint64_t result = fprintf( v8,  "%20s:\n",  "wcWrFragSizes");
                                                                                  else {
                                                                                    uint64_t v307 = v438;
                                                                                  }
                                                                                  if ((_DWORD)v307)
                                                                                  {
                                                                                    for (uint64_t i133 = 0LL; i133 != v307; ++i133)
                                                                                      uint64_t result = fprintf( v8,  "                      [%d] = %llu\n",  i133,  v15[i133]);
                                                                                  }
                                                                                }

                                                                                else if ((v432 & 1) != 0 && v14 == 905)
                                                                                {
                                                                                  uint64_t result = fprintf( v8,  "%20s:\n",  "turboRaidRelPerBlock");
                                                                                  else {
                                                                                    uint64_t v309 = v438;
                                                                                  }
                                                                                  if ((_DWORD)v309)
                                                                                  {
                                                                                    for (uint64_t i134 = 0LL; i134 != v309; ++i134)
                                                                                      uint64_t result = fprintf( v8,  "                      [%d] = %llu\n",  i134,  v15[i134]);
                                                                                  }
                                                                                }

                                                                                else if ((v432 & 1) != 0 && v14 == 906)
                                                                                {
                                                                                  uint64_t result = fprintf( v8,  "%20s:\n",  "turboRaidRelBetweenRefreshesPerBlock");
                                                                                  else {
                                                                                    uint64_t v311 = v438;
                                                                                  }
                                                                                  if ((_DWORD)v311)
                                                                                  {
                                                                                    for (uint64_t i135 = 0LL; i135 != v311; ++i135)
                                                                                      uint64_t result = fprintf( v8,  "                      [%d] = %llu\n",  i135,  v15[i135]);
                                                                                  }
                                                                                }

                                                                                else if ((v432 & 1) != 0 && v14 == 907)
                                                                                {
                                                                                  uint64_t result = fprintf( v8,  "%20s:\n",  "turboRaidMaxRelBetweenRefreshesPerBlock");
                                                                                  else {
                                                                                    uint64_t v313 = v438;
                                                                                  }
                                                                                  if ((_DWORD)v313)
                                                                                  {
                                                                                    for (uint64_t i136 = 0LL; i136 != v313; ++i136)
                                                                                      uint64_t result = fprintf( v8,  "                      [%d] = %llu\n",  i136,  v15[i136]);
                                                                                  }
                                                                                }

                                                                                else if ((v432 & 1) != 0 && v14 == 908)
                                                                                {
                                                                                  uint64_t result = fprintf( v8,  "%20s:\n",  "turboRaidMinRelBetweenRefreshesPerBlock");
                                                                                  else {
                                                                                    uint64_t v315 = v438;
                                                                                  }
                                                                                  if ((_DWORD)v315)
                                                                                  {
                                                                                    for (uint64_t i137 = 0LL; i137 != v315; ++i137)
                                                                                      uint64_t result = fprintf( v8,  "                      [%d] = %llu\n",  i137,  v15[i137]);
                                                                                  }
                                                                                }

                                                                                else if ((v432 & 1) != 0 && v14 == 918)
                                                                                {
                                                                                  uint64_t result = fprintf( v8,  "%20s:\n",  "turboRaidMaxCyclesBetweenRel");
                                                                                  else {
                                                                                    uint64_t v317 = v438;
                                                                                  }
                                                                                  if ((_DWORD)v317)
                                                                                  {
                                                                                    for (uint64_t i138 = 0LL; i138 != v317; ++i138)
                                                                                      uint64_t result = fprintf( v8,  "                      [%d] = %llu\n",  i138,  v15[i138]);
                                                                                  }
                                                                                }

                                                                                else if ((v432 & 1) != 0 && v14 == 919)
                                                                                {
                                                                                  uint64_t result = fprintf( v8,  "%20s:\n",  "turboRaidMinCyclesBetweenRel");
                                                                                  else {
                                                                                    uint64_t v319 = v438;
                                                                                  }
                                                                                  if ((_DWORD)v319)
                                                                                  {
                                                                                    for (uint64_t i139 = 0LL; i139 != v319; ++i139)
                                                                                      uint64_t result = fprintf( v8,  "                      [%d] = %llu\n",  i139,  v15[i139]);
                                                                                  }
                                                                                }

                                                                                else if ((v432 & 1) != 0 && v14 == 932)
                                                                                {
                                                                                  uint64_t result = fprintf( v8,  "%20s:\n",  "turboRaidLastRelPECycles");
                                                                                  else {
                                                                                    uint64_t v321 = v438;
                                                                                  }
                                                                                  if ((_DWORD)v321)
                                                                                  {
                                                                                    for (uint64_t i140 = 0LL; i140 != v321; ++i140)
                                                                                      uint64_t result = fprintf( v8,  "                      [%d] = %llu\n",  i140,  v15[i140]);
                                                                                  }
                                                                                }

                                                                                else if ((v432 & 1) != 0 && v14 == 933)
                                                                                {
                                                                                  uint64_t result = fprintf( v8,  "%20s:\n",  "turboRaidRelQualPECycles");
                                                                                  else {
                                                                                    uint64_t v323 = v438;
                                                                                  }
                                                                                  if ((_DWORD)v323)
                                                                                  {
                                                                                    for (uint64_t i141 = 0LL; i141 != v323; ++i141)
                                                                                      uint64_t result = fprintf( v8,  "                      [%d] = %llu\n",  i141,  v15[i141]);
                                                                                  }
                                                                                }

                                                                                else if ((v432 & 1) != 0 && v14 == 920)
                                                                                {
                                                                                  uint64_t result = fprintf( v8,  "%20s:\n",  "turboRaidAuxPerBlock");
                                                                                  else {
                                                                                    uint64_t v325 = v438;
                                                                                  }
                                                                                  if ((_DWORD)v325)
                                                                                  {
                                                                                    for (uint64_t i142 = 0LL; i142 != v325; ++i142)
                                                                                      uint64_t result = fprintf( v8,  "                      [%d] = %llu\n",  i142,  v15[i142]);
                                                                                  }
                                                                                }

                                                                                else if ((v432 & 1) != 0 && v14 == 921)
                                                                                {
                                                                                  uint64_t result = fprintf( v8,  "%20s:\n",  "turboRaidAuxBetweenRefreshesPerBlock");
                                                                                  else {
                                                                                    uint64_t v327 = v438;
                                                                                  }
                                                                                  if ((_DWORD)v327)
                                                                                  {
                                                                                    for (uint64_t i143 = 0LL; i143 != v327; ++i143)
                                                                                      uint64_t result = fprintf( v8,  "                      [%d] = %llu\n",  i143,  v15[i143]);
                                                                                  }
                                                                                }

                                                                                else if ((v432 & 1) != 0 && v14 == 930)
                                                                                {
                                                                                  uint64_t result = fprintf( v8,  "%20s:\n",  "turboRaidMaxCyclesBetweenAux");
                                                                                  else {
                                                                                    uint64_t v329 = v438;
                                                                                  }
                                                                                  if ((_DWORD)v329)
                                                                                  {
                                                                                    for (uint64_t i144 = 0LL; i144 != v329; ++i144)
                                                                                      uint64_t result = fprintf( v8,  "                      [%d] = %llu\n",  i144,  v15[i144]);
                                                                                  }
                                                                                }

                                                                                else if ((v432 & 1) != 0 && v14 == 931)
                                                                                {
                                                                                  uint64_t result = fprintf( v8,  "%20s:\n",  "turboRaidMinCyclesBetweenAux");
                                                                                  else {
                                                                                    uint64_t v331 = v438;
                                                                                  }
                                                                                  if ((_DWORD)v331)
                                                                                  {
                                                                                    for (uint64_t i145 = 0LL; i145 != v331; ++i145)
                                                                                      uint64_t result = fprintf( v8,  "                      [%d] = %llu\n",  i145,  v15[i145]);
                                                                                  }
                                                                                }

                                                                                else if ((v432 & 1) != 0 && v14 == 934)
                                                                                {
                                                                                  uint64_t result = fprintf( v8,  "%20s:\n",  "turboRaidLastAuxPECycles");
                                                                                  else {
                                                                                    uint64_t v333 = v438;
                                                                                  }
                                                                                  if ((_DWORD)v333)
                                                                                  {
                                                                                    for (uint64_t i146 = 0LL; i146 != v333; ++i146)
                                                                                      uint64_t result = fprintf( v8,  "                      [%d] = %llu\n",  i146,  v15[i146]);
                                                                                  }
                                                                                }

                                                                                else if ((v432 & 1) != 0 && v14 == 935)
                                                                                {
                                                                                  uint64_t result = fprintf( v8,  "%20s:\n",  "turboRaidAuxQualPECycles");
                                                                                  else {
                                                                                    uint64_t v335 = v438;
                                                                                  }
                                                                                  if ((_DWORD)v335)
                                                                                  {
                                                                                    for (uint64_t i147 = 0LL; i147 != v335; ++i147)
                                                                                      uint64_t result = fprintf( v8,  "                      [%d] = %llu\n",  i147,  v15[i147]);
                                                                                  }
                                                                                }

                                                                                else
                                                                                {
                                                                                  if ((v432 & 1) != 0 && v14 == 922
                                                                                    || (v432 & 1) != 0 && v14 == 923)
                                                                                  {
                                                                                    goto LABEL_81;
                                                                                  }

                                                                                  if ((v432 & 1) != 0 && v14 == 910)
                                                                                  {
                                                                                    uint64_t result = fprintf( v8,  "%20s:\n",  "pgBelowMinBands");
                                                                                    else {
                                                                                      uint64_t v337 = v438;
                                                                                    }
                                                                                    if ((_DWORD)v337)
                                                                                    {
                                                                                      for (uint64_t i148 = 0LL; i148 != v337; ++i148)
                                                                                        uint64_t result = fprintf( v8,  "                      [%d] = %llu\n",  i148,  v15[i148]);
                                                                                    }
                                                                                  }

                                                                                  else if ((v432 & 1) != 0 {
                                                                                         && v14 == 911)
                                                                                  }
                                                                                  {
                                                                                    uint64_t result = fprintf( v8,  "%20s:\n",  "pgNoBands");
                                                                                    else {
                                                                                      uint64_t v339 = v438;
                                                                                    }
                                                                                    if ((_DWORD)v339)
                                                                                    {
                                                                                      for (uint64_t i149 = 0LL; i149 != v339; ++i149)
                                                                                        uint64_t result = fprintf( v8,  "                      [%d] = %llu\n",  i149,  v15[i149]);
                                                                                    }
                                                                                  }

                                                                                  else if ((v432 & 1) != 0 {
                                                                                         && v14 == 912)
                                                                                  }
                                                                                  {
                                                                                    uint64_t result = fprintf( v8,  "%20s:\n",  "pgBelowMinBlocks");
                                                                                    else {
                                                                                      uint64_t v341 = v438;
                                                                                    }
                                                                                    if ((_DWORD)v341)
                                                                                    {
                                                                                      for (uint64_t i150 = 0LL; i150 != v341; ++i150)
                                                                                        uint64_t result = fprintf( v8,  "                      [%d] = %llu\n",  i150,  v15[i150]);
                                                                                    }
                                                                                  }

                                                                                  else
                                                                                  {
                                                                                    if ((v432 & 1) != 0 && v14 == 915
                                                                                      || (v432 & 1) != 0 && v14 == 925
                                                                                      || (v432 & 1) != 0 && v14 == 946
                                                                                      || (v432 & 1) != 0 && v14 == 936
                                                                                      || (v432 & 1) != 0 && v14 == 937
                                                                                      || (v432 & 1) != 0 && v14 == 938
                                                                                      || (v432 & 1) != 0 && v14 == 939
                                                                                      || (v432 & 1) != 0 && v14 == 940
                                                                                      || (v432 & 2) != 0 && v14 == 954
                                                                                      || (v432 & 2) != 0 && v14 == 942
                                                                                      || (v432 & 2) != 0 && v14 == 943
                                                                                      || (v432 & 2) != 0 && v14 == 944
                                                                                      || (v432 & 1) != 0 && v14 == 957
                                                                                      || (v432 & 1) != 0 && v14 == 958)
                                                                                    {
                                                                                      goto LABEL_81;
                                                                                    }

                                                                                    if ((v432 & 2) != 0 && v14 == 948)
                                                                                    {
                                                                                      uint64_t result = fprintf( v8,  "%20s:\n",  "assertHistory");
                                                                                      else {
                                                                                        uint64_t v343 = v438;
                                                                                      }
                                                                                      if ((_DWORD)v343)
                                                                                      {
                                                                                        for (uint64_t i151 = 0LL;
                                                                                              i151 != v343;
                                                                                              ++i151)
                                                                                        {
                                                                                          uint64_t result = fprintf( v8,  "                      [%d] = %llu\n",  i151,  v15[i151]);
                                                                                        }
                                                                                      }
                                                                                    }

                                                                                    else
                                                                                    {
                                                                                      if ((v432 & 2) != 0 && v14 == 951
                                                                                        || (v432 & 2) != 0 && v14 == 952
                                                                                        || (v432 & 1) != 0 && v14 == 955
                                                                                        || (v432 & 1) != 0 && v14 == 966
                                                                                        || (v432 & 1) != 0 && v14 == 968
                                                                                        || (v432 & 1) != 0 && v14 == 969)
                                                                                      {
                                                                                        goto LABEL_81;
                                                                                      }

                                                                                      if ((v432 & 1) != 0 && v14 == 961)
                                                                                      {
                                                                                        uint64_t result = fprintf( v8,  "%20s:\n",  "osBuildStr");
                                                                                        else {
                                                                                          uint64_t v345 = v438;
                                                                                        }
                                                                                        if ((_DWORD)v345)
                                                                                        {
                                                                                          for (uint64_t i152 = 0LL;
                                                                                                i152 != v345;
                                                                                                ++i152)
                                                                                          {
                                                                                            uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i152, v15[i152]);
                                                                                          }
                                                                                        }
                                                                                      }

                                                                                      else if ((v432 & 1) != 0 {
                                                                                             && v14 == 967)
                                                                                      }
                                                                                      {
                                                                                        uint64_t result = fprintf( v8,  "%20s:\n",  "indTrimFrags");
                                                                                        else {
                                                                                          uint64_t v347 = v438;
                                                                                        }
                                                                                        if ((_DWORD)v347)
                                                                                        {
                                                                                          for (uint64_t i153 = 0LL;
                                                                                                i153 != v347;
                                                                                                ++i153)
                                                                                          {
                                                                                            uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i153, v15[i153]);
                                                                                          }
                                                                                        }
                                                                                      }

                                                                                      else if ((v432 & 1) != 0 {
                                                                                             && v14 == 971)
                                                                                      }
                                                                                      {
                                                                                        uint64_t result = fprintf( v8,  "%20s:\n",  "indUsedFrags");
                                                                                        else {
                                                                                          uint64_t v349 = v438;
                                                                                        }
                                                                                        if ((_DWORD)v349)
                                                                                        {
                                                                                          for (uint64_t i154 = 0LL;
                                                                                                i154 != v349;
                                                                                                ++i154)
                                                                                          {
                                                                                            uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i154, v15[i154]);
                                                                                          }
                                                                                        }
                                                                                      }

                                                                                      else
                                                                                      {
                                                                                        if ((v432 & 1) != 0
                                                                                          && v14 == 985
                                                                                          || (v432 & 1) != 0
                                                                                          && v14 == 973
                                                                                          || (v432 & 1) != 0
                                                                                          && v14 == 976
                                                                                          || (v432 & 1) != 0
                                                                                          && v14 == 980
                                                                                          || (v432 & 1) != 0
                                                                                          && v14 == 981
                                                                                          || (v432 & 1) != 0
                                                                                          && v14 == 982
                                                                                          || (v432 & 1) != 0
                                                                                          && v14 == 984
                                                                                          || (v432 & 1) != 0
                                                                                          && v14 == 990
                                                                                          || (v432 & 1) != 0
                                                                                          && v14 == 992
                                                                                          || (v432 & 1) != 0
                                                                                          && v14 == 993
                                                                                          || (v432 & 1) != 0
                                                                                          && v14 == 994
                                                                                          || (v432 & 1) != 0
                                                                                          && v14 == 986
                                                                                          || (v432 & 1) != 0
                                                                                          && v14 == 987
                                                                                          || (v432 & 1) != 0
                                                                                          && v14 == 1000
                                                                                          || (v432 & 1) != 0
                                                                                          && v14 == 1013)
                                                                                        {
                                                                                          goto LABEL_81;
                                                                                        }

                                                                                        if ((v432 & 1) != 0
                                                                                          && v14 == 1015)
                                                                                        {
                                                                                          uint64_t result = fprintf( v8,  "%20s:\n",  "eanEarlyBootUeccPage");
                                                                                          else {
                                                                                            uint64_t v351 = v438;
                                                                                          }
                                                                                          if ((_DWORD)v351)
                                                                                          {
                                                                                            for (uint64_t i155 = 0LL;
                                                                                                  i155 != v351;
                                                                                                  ++i155)
                                                                                            {
                                                                                              uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i155, v15[i155]);
                                                                                            }
                                                                                          }
                                                                                        }

                                                                                        else
                                                                                        {
                                                                                          if ((v432 & 1) != 0
                                                                                            && v14 == 1016
                                                                                            || (v432 & 1) != 0
                                                                                            && v14 == 1017
                                                                                            || (v432 & 1) != 0
                                                                                            && v14 == 1020
                                                                                            || (v432 & 1) != 0
                                                                                            && v14 == 1021
                                                                                            || (v432 & 1) != 0
                                                                                            && v14 == 1027
                                                                                            || (v432 & 1) != 0
                                                                                            && v14 == 1028
                                                                                            || (v432 & 1) != 0
                                                                                            && v14 == 1029
                                                                                            || (v432 & 1) != 0
                                                                                            && v14 == 1022
                                                                                            || (v432 & 1) != 0
                                                                                            && v14 == 1023
                                                                                            || (v432 & 2) != 0
                                                                                            && v14 == 1025
                                                                                            || (v432 & 2) != 0
                                                                                            && v14 == 1026
                                                                                            || (v432 & 1) != 0
                                                                                            && v14 == 1030)
                                                                                          {
                                                                                            goto LABEL_81;
                                                                                          }

                                                                                          if ((v432 & 1) != 0
                                                                                            && v14 == 1040)
                                                                                          {
                                                                                            uint64_t result = fprintf(v8, "%20s:\n", "bandsAgeBinsV2");
                                                                                            else {
                                                                                              uint64_t v353 = v438;
                                                                                            }
                                                                                            if ((_DWORD)v353)
                                                                                            {
                                                                                              for (uint64_t i156 = 0LL;
                                                                                                    i156 != v353;
                                                                                                    ++i156)
                                                                                              {
                                                                                                uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i156, v15[i156]);
                                                                                              }
                                                                                            }
                                                                                          }

                                                                                          else if ((v432 & 1) != 0 && v14 == 1041)
                                                                                          {
                                                                                            uint64_t result = fprintf(v8, "%20s:\n", "bandsAgeBinsSnapshot");
                                                                                            else {
                                                                                              uint64_t v355 = v438;
                                                                                            }
                                                                                            if ((_DWORD)v355)
                                                                                            {
                                                                                              for (uint64_t i157 = 0LL;
                                                                                                    i157 != v355;
                                                                                                    ++i157)
                                                                                              {
                                                                                                uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i157, v15[i157]);
                                                                                              }
                                                                                            }
                                                                                          }

                                                                                          else if ((v432 & 1) != 0 && v14 == 1042)
                                                                                          {
                                                                                            uint64_t result = fprintf(v8, "%20s:\n", "bandsAgeBinsReadSectors");
                                                                                            else {
                                                                                              uint64_t v357 = v438;
                                                                                            }
                                                                                            if ((_DWORD)v357)
                                                                                            {
                                                                                              for (uint64_t i158 = 0LL;
                                                                                                    i158 != v357;
                                                                                                    ++i158)
                                                                                              {
                                                                                                uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i158, v15[i158]);
                                                                                              }
                                                                                            }
                                                                                          }

                                                                                          else
                                                                                          {
                                                                                            if ((v432 & 2) != 0
                                                                                              && v14 == 1050
                                                                                              || (v432 & 2) != 0
                                                                                              && v14 == 1051
                                                                                              || (v432 & 2) != 0
                                                                                              && v14 == 1052
                                                                                              || (v432 & 2) != 0
                                                                                              && v14 == 1053
                                                                                              || (v432 & 2) != 0
                                                                                              && v14 == 1061)
                                                                                            {
                                                                                              goto LABEL_81;
                                                                                            }

                                                                                            if ((v432 & 1) != 0
                                                                                              && v14 == 1057)
                                                                                            {
                                                                                              uint64_t result = fprintf(v8, "%20s:\n", "hostReadsVerticalByFlow");
                                                                                              else {
                                                                                                uint64_t v359 = v438;
                                                                                              }
                                                                                              if ((_DWORD)v359)
                                                                                              {
                                                                                                for (uint64_t i159 = 0LL;
                                                                                                      i159 != v359;
                                                                                                      ++i159)
                                                                                                {
                                                                                                  uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i159, v15[i159]);
                                                                                                }
                                                                                              }
                                                                                            }

                                                                                            else if ((v432 & 1) != 0 && v14 == 1058)
                                                                                            {
                                                                                              uint64_t result = fprintf(v8, "%20s:\n", "hostReadsByFlow");
                                                                                              else {
                                                                                                uint64_t v361 = v438;
                                                                                              }
                                                                                              if ((_DWORD)v361)
                                                                                              {
                                                                                                for (uint64_t i160 = 0LL;
                                                                                                      i160 != v361;
                                                                                                      ++i160)
                                                                                                {
                                                                                                  uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i160, v15[i160]);
                                                                                                }
                                                                                              }
                                                                                            }

                                                                                            else
                                                                                            {
                                                                                              if ((v432 & 1) != 0
                                                                                                && v14 == 1036
                                                                                                || (v432 & 1) != 0
                                                                                                && v14 == 1037
                                                                                                || (v432 & 1) != 0
                                                                                                && v14 == 1076
                                                                                                || (v432 & 1) != 0
                                                                                                && v14 == 1098)
                                                                                              {
                                                                                                goto LABEL_81;
                                                                                              }

                                                                                              if ((v432 & 1) != 0
                                                                                                && v14 == 1099)
                                                                                              {
                                                                                                uint64_t result = fprintf(v8, "%20s:\n", "pgCompressionBlocksInDip");
                                                                                                else {
                                                                                                  uint64_t v363 = v438;
                                                                                                }
                                                                                                if ((_DWORD)v363)
                                                                                                {
                                                                                                  for (uint64_t i161 = 0LL;
                                                                                                        i161 != v363;
                                                                                                        ++i161)
                                                                                                  {
                                                                                                    uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i161, v15[i161]);
                                                                                                  }
                                                                                                }
                                                                                              }

                                                                                              else if ((v432 & 1) != 0 && v14 == 1139)
                                                                                              {
                                                                                                uint64_t result = fprintf(v8, "%20s:\n", "pgCompressionBlocksInPG");
                                                                                                else {
                                                                                                  uint64_t v365 = v438;
                                                                                                }
                                                                                                if ((_DWORD)v365)
                                                                                                {
                                                                                                  for (uint64_t i162 = 0LL;
                                                                                                        i162 != v365;
                                                                                                        ++i162)
                                                                                                  {
                                                                                                    uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i162, v15[i162]);
                                                                                                  }
                                                                                                }
                                                                                              }

                                                                                              else
                                                                                              {
                                                                                                if ((v432 & 1) != 0 && v14 == 1140 || (v432 & 1) != 0 && v14 == 1141 || (v432 & 1) != 0 && v14 == 1200 || (v432 & 1) != 0 && v14 == 1080) {
                                                                                                  goto LABEL_81;
                                                                                                }
                                                                                                if ((v432 & 1) != 0 && v14 == 1105)
                                                                                                {
                                                                                                  uint64_t result = fprintf(v8, "%20s:\n", "hostReadSequential");
                                                                                                  else {
                                                                                                    uint64_t v367 = v438;
                                                                                                  }
                                                                                                  if ((_DWORD)v367)
                                                                                                  {
                                                                                                    for (uint64_t i163 = 0LL;
                                                                                                          i163 != v367;
                                                                                                          ++i163)
                                                                                                    {
                                                                                                      uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i163, v15[i163]);
                                                                                                    }
                                                                                                  }
                                                                                                }

                                                                                                else if ((v432 & 1) != 0 && v14 == 1106)
                                                                                                {
                                                                                                  uint64_t result = fprintf(v8, "%20s:\n", "GCReadSequential");
                                                                                                  else {
                                                                                                    uint64_t v369 = v438;
                                                                                                  }
                                                                                                  if ((_DWORD)v369)
                                                                                                  {
                                                                                                    for (uint64_t i164 = 0LL;
                                                                                                          i164 != v369;
                                                                                                          ++i164)
                                                                                                    {
                                                                                                      uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i164, v15[i164]);
                                                                                                    }
                                                                                                  }
                                                                                                }

                                                                                                else
                                                                                                {
                                                                                                  if ((v432 & 2) != 0 && v14 == 1118 || (v432 & 2) != 0 && v14 == 1121 || (v432 & 1) != 0 && v14 == 1123 || (v432 & 1) != 0 && v14 == 1124 || (v432 & 1) != 0 && v14 == 1125 || (v432 & 1) != 0 && v14 == 1126 || (v432 & 1) != 0 && v14 == 1137 || (v432 & 1) != 0 && v14 == 1138 || (v432 & 1) != 0 && v14 == 1156) {
                                                                                                    goto LABEL_81;
                                                                                                  }
                                                                                                  if ((v432 & 1) != 0 && v14 == 1116)
                                                                                                  {
                                                                                                    uint64_t result = fprintf(v8, "%20s:\n", "gcwamp");
                                                                                                    else {
                                                                                                      uint64_t v371 = v438;
                                                                                                    }
                                                                                                    if ((_DWORD)v371)
                                                                                                    {
                                                                                                      for (uint64_t i165 = 0LL;
                                                                                                            i165 != v371;
                                                                                                            ++i165)
                                                                                                      {
                                                                                                        uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i165, v15[i165]);
                                                                                                      }
                                                                                                    }
                                                                                                  }

                                                                                                  else
                                                                                                  {
                                                                                                    if ((v432 & 1) != 0 && v14 == 1157 || (v432 & 1) != 0 && v14 == 1158 || (v432 & 1) != 0 && v14 == 1164) {
                                                                                                      goto LABEL_81;
                                                                                                    }
                                                                                                    if ((v432 & 2) != 0 && v14 == 1159)
                                                                                                    {
                                                                                                      uint64_t result = fprintf(v8, "%20s:\n", "slcWLPerDipDelta");
                                                                                                      else {
                                                                                                        uint64_t v373 = v438;
                                                                                                      }
                                                                                                      if ((_DWORD)v373)
                                                                                                      {
                                                                                                        for (uint64_t i166 = 0LL;
                                                                                                              i166 != v373;
                                                                                                              ++i166)
                                                                                                        {
                                                                                                          uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i166, v15[i166]);
                                                                                                        }
                                                                                                      }
                                                                                                    }

                                                                                                    else if ((v432 & 2) != 0 && v14 == 1160)
                                                                                                    {
                                                                                                      uint64_t result = fprintf(v8, "%20s:\n", "slcWLPerDipAvgPEC");
                                                                                                      else {
                                                                                                        uint64_t v375 = v438;
                                                                                                      }
                                                                                                      if ((_DWORD)v375)
                                                                                                      {
                                                                                                        for (uint64_t i167 = 0LL;
                                                                                                              i167 != v375;
                                                                                                              ++i167)
                                                                                                        {
                                                                                                          uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i167, v15[i167]);
                                                                                                        }
                                                                                                      }
                                                                                                    }

                                                                                                    else if ((v432 & 2) != 0 && v14 == 1161)
                                                                                                    {
                                                                                                      uint64_t result = fprintf(v8, "%20s:\n", "slcWLPerDipSlack");
                                                                                                      else {
                                                                                                        uint64_t v377 = v438;
                                                                                                      }
                                                                                                      if ((_DWORD)v377)
                                                                                                      {
                                                                                                        for (uint64_t i168 = 0LL;
                                                                                                              i168 != v377;
                                                                                                              ++i168)
                                                                                                        {
                                                                                                          uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i168, v15[i168]);
                                                                                                        }
                                                                                                      }
                                                                                                    }

                                                                                                    else
                                                                                                    {
                                                                                                      if ((v432 & 2) != 0 && v14 == 1162 || (v432 & 2) != 0 && v14 == 1163) {
                                                                                                        goto LABEL_81;
                                                                                                      }
                                                                                                      if ((v432 & 2) != 0 && v14 == 1216)
                                                                                                      {
                                                                                                        uint64_t result = fprintf(v8, "%20s:\n", "tlcWLPerDipAvgPEC");
                                                                                                        else {
                                                                                                          uint64_t v379 = v438;
                                                                                                        }
                                                                                                        if ((_DWORD)v379)
                                                                                                        {
                                                                                                          for (uint64_t i169 = 0LL;
                                                                                                                i169 != v379;
                                                                                                                ++i169)
                                                                                                          {
                                                                                                            uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i169, v15[i169]);
                                                                                                          }
                                                                                                        }
                                                                                                      }

                                                                                                      else if ((v432 & 2) != 0 && v14 == 1217)
                                                                                                      {
                                                                                                        uint64_t result = fprintf(v8, "%20s:\n", "tlcWLPerDipMaxPEC");
                                                                                                        else {
                                                                                                          uint64_t v381 = v438;
                                                                                                        }
                                                                                                        if ((_DWORD)v381)
                                                                                                        {
                                                                                                          for (uint64_t i170 = 0LL;
                                                                                                                i170 != v381;
                                                                                                                ++i170)
                                                                                                          {
                                                                                                            uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i170, v15[i170]);
                                                                                                          }
                                                                                                        }
                                                                                                      }

                                                                                                      else if ((v432 & 2) != 0 && v14 == 1218)
                                                                                                      {
                                                                                                        uint64_t result = fprintf(v8, "%20s:\n", "tlcWLPerDipMinPEC");
                                                                                                        else {
                                                                                                          uint64_t v383 = v438;
                                                                                                        }
                                                                                                        if ((_DWORD)v383)
                                                                                                        {
                                                                                                          for (uint64_t i171 = 0LL;
                                                                                                                i171 != v383;
                                                                                                                ++i171)
                                                                                                          {
                                                                                                            uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i171, v15[i171]);
                                                                                                          }
                                                                                                        }
                                                                                                      }

                                                                                                      else if ((v432 & 1) != 0 && v14 == 1147)
                                                                                                      {
                                                                                                        uint64_t result = fprintf(v8, "%20s:\n", "gc_concurrent_dw_gc12");
                                                                                                        else {
                                                                                                          uint64_t v385 = v438;
                                                                                                        }
                                                                                                        if ((_DWORD)v385)
                                                                                                        {
                                                                                                          for (uint64_t i172 = 0LL;
                                                                                                                i172 != v385;
                                                                                                                ++i172)
                                                                                                          {
                                                                                                            uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i172, v15[i172]);
                                                                                                          }
                                                                                                        }
                                                                                                      }

                                                                                                      else if ((v432 & 1) != 0 && v14 == 1148)
                                                                                                      {
                                                                                                        uint64_t result = fprintf(v8, "%20s:\n", "gc_concurrent_dw_gc1");
                                                                                                        else {
                                                                                                          uint64_t v387 = v438;
                                                                                                        }
                                                                                                        if ((_DWORD)v387)
                                                                                                        {
                                                                                                          for (uint64_t i173 = 0LL;
                                                                                                                i173 != v387;
                                                                                                                ++i173)
                                                                                                          {
                                                                                                            uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i173, v15[i173]);
                                                                                                          }
                                                                                                        }
                                                                                                      }

                                                                                                      else if ((v432 & 1) != 0 && v14 == 1149)
                                                                                                      {
                                                                                                        uint64_t result = fprintf(v8, "%20s:\n", "gc_concurrent_dw_gc2");
                                                                                                        else {
                                                                                                          uint64_t v389 = v438;
                                                                                                        }
                                                                                                        if ((_DWORD)v389)
                                                                                                        {
                                                                                                          for (uint64_t i174 = 0LL;
                                                                                                                i174 != v389;
                                                                                                                ++i174)
                                                                                                          {
                                                                                                            uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i174, v15[i174]);
                                                                                                          }
                                                                                                        }
                                                                                                      }

                                                                                                      else
                                                                                                      {
                                                                                                        if ((v432 & 1) != 0 && v14 == 1178) {
                                                                                                          goto LABEL_81;
                                                                                                        }
                                                                                                        if ((v432 & 2) != 0 && v14 == 1179)
                                                                                                        {
                                                                                                          uint64_t result = fprintf(v8, "%20s:\n", "gc_cur_dw_gc1");
                                                                                                          else {
                                                                                                            uint64_t v391 = v438;
                                                                                                          }
                                                                                                          if ((_DWORD)v391)
                                                                                                          {
                                                                                                            for (uint64_t i175 = 0LL;
                                                                                                                  i175 != v391;
                                                                                                                  ++i175)
                                                                                                            {
                                                                                                              uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i175, v15[i175]);
                                                                                                            }
                                                                                                          }
                                                                                                        }

                                                                                                        else if ((v432 & 2) != 0 && v14 == 1180)
                                                                                                        {
                                                                                                          uint64_t result = fprintf(v8, "%20s:\n", "gc_cur_dw_gc2");
                                                                                                          else {
                                                                                                            uint64_t v393 = v438;
                                                                                                          }
                                                                                                          if ((_DWORD)v393)
                                                                                                          {
                                                                                                            for (uint64_t i176 = 0LL;
                                                                                                                  i176 != v393;
                                                                                                                  ++i176)
                                                                                                            {
                                                                                                              uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i176, v15[i176]);
                                                                                                            }
                                                                                                          }
                                                                                                        }

                                                                                                        else if ((v432 & 2) != 0 && v14 == 1181)
                                                                                                        {
                                                                                                          uint64_t result = fprintf(v8, "%20s:\n", "gc_cur_dw_gc3");
                                                                                                          else {
                                                                                                            uint64_t v395 = v438;
                                                                                                          }
                                                                                                          if ((_DWORD)v395)
                                                                                                          {
                                                                                                            for (uint64_t i177 = 0LL;
                                                                                                                  i177 != v395;
                                                                                                                  ++i177)
                                                                                                            {
                                                                                                              uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i177, v15[i177]);
                                                                                                            }
                                                                                                          }
                                                                                                        }

                                                                                                        else if ((v432 & 1) != 0 && v14 == 1182)
                                                                                                        {
                                                                                                          uint64_t result = fprintf(v8, "%20s:\n", "gc_tot_dw_gc1");
                                                                                                          else {
                                                                                                            uint64_t v397 = v438;
                                                                                                          }
                                                                                                          if ((_DWORD)v397)
                                                                                                          {
                                                                                                            for (uint64_t i178 = 0LL;
                                                                                                                  i178 != v397;
                                                                                                                  ++i178)
                                                                                                            {
                                                                                                              uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i178, v15[i178]);
                                                                                                            }
                                                                                                          }
                                                                                                        }

                                                                                                        else if ((v432 & 1) != 0 && v14 == 1183)
                                                                                                        {
                                                                                                          uint64_t result = fprintf(v8, "%20s:\n", "gc_tot_dw_gc2");
                                                                                                          else {
                                                                                                            uint64_t v399 = v438;
                                                                                                          }
                                                                                                          if ((_DWORD)v399)
                                                                                                          {
                                                                                                            for (uint64_t i179 = 0LL;
                                                                                                                  i179 != v399;
                                                                                                                  ++i179)
                                                                                                            {
                                                                                                              uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i179, v15[i179]);
                                                                                                            }
                                                                                                          }
                                                                                                        }

                                                                                                        else
                                                                                                        {
                                                                                                          if ((v432 & 2) != 0 && v14 == 1184 || (v432 & 2) != 0 && v14 == 1185 || (v432 & 2) != 0 && v14 == 1186 || (v432 & 1) != 0 && v14 == 1187) {
                                                                                                            goto LABEL_81;
                                                                                                          }
                                                                                                          if ((v432 & 1) != 0 && v14 == 1168)
                                                                                                          {
                                                                                                            uint64_t result = fprintf(v8, "%20s:\n", "poDetectPERemovalTotalCost");
                                                                                                            else {
                                                                                                              uint64_t v401 = v438;
                                                                                                            }
                                                                                                            if ((_DWORD)v401)
                                                                                                            {
                                                                                                              for (uint64_t i180 = 0LL;
                                                                                                                    i180 != v401;
                                                                                                                    ++i180)
                                                                                                              {
                                                                                                                uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i180, v15[i180]);
                                                                                                              }
                                                                                                            }
                                                                                                          }

                                                                                                          else if ((v432 & 1) != 0 && v14 == 1198)
                                                                                                          {
                                                                                                            uint64_t result = fprintf(v8, "%20s:\n", "poDetectPERemovalMostSevereCost");
                                                                                                            else {
                                                                                                              uint64_t v403 = v438;
                                                                                                            }
                                                                                                            if ((_DWORD)v403)
                                                                                                            {
                                                                                                              for (uint64_t i181 = 0LL;
                                                                                                                    i181 != v403;
                                                                                                                    ++i181)
                                                                                                              {
                                                                                                                uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i181, v15[i181]);
                                                                                                              }
                                                                                                            }
                                                                                                          }

                                                                                                          else if ((v432 & 1) != 0 && v14 == 1169)
                                                                                                          {
                                                                                                            uint64_t result = fprintf(v8, "%20s:\n", "poDetectEmptySpotRemovalTotalCost");
                                                                                                            else {
                                                                                                              uint64_t v405 = v438;
                                                                                                            }
                                                                                                            if ((_DWORD)v405)
                                                                                                            {
                                                                                                              for (uint64_t i182 = 0LL;
                                                                                                                    i182 != v405;
                                                                                                                    ++i182)
                                                                                                              {
                                                                                                                uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i182, v15[i182]);
                                                                                                              }
                                                                                                            }
                                                                                                          }

                                                                                                          else if ((v432 & 1) != 0 && v14 == 1171)
                                                                                                          {
                                                                                                            uint64_t result = fprintf(v8, "%20s:\n", "poDetectEmptySpotRemovalAge");
                                                                                                            else {
                                                                                                              uint64_t v407 = v438;
                                                                                                            }
                                                                                                            if ((_DWORD)v407)
                                                                                                            {
                                                                                                              for (uint64_t i183 = 0LL;
                                                                                                                    i183 != v407;
                                                                                                                    ++i183)
                                                                                                              {
                                                                                                                uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i183, v15[i183]);
                                                                                                              }
                                                                                                            }
                                                                                                          }

                                                                                                          else if ((v432 & 1) != 0 && v14 == 1172)
                                                                                                          {
                                                                                                            uint64_t result = fprintf(v8, "%20s:\n", "poDetectGBBedMostSevereCost");
                                                                                                            else {
                                                                                                              uint64_t v409 = v438;
                                                                                                            }
                                                                                                            if ((_DWORD)v409)
                                                                                                            {
                                                                                                              for (uint64_t i184 = 0LL;
                                                                                                                    i184 != v409;
                                                                                                                    ++i184)
                                                                                                              {
                                                                                                                uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i184, v15[i184]);
                                                                                                              }
                                                                                                            }
                                                                                                          }

                                                                                                          else if ((v432 & 1) != 0 && v14 == 1196)
                                                                                                          {
                                                                                                            uint64_t result = fprintf(v8, "%20s:\n", "poDetectGBBedTotalCost");
                                                                                                            else {
                                                                                                              uint64_t v411 = v438;
                                                                                                            }
                                                                                                            if ((_DWORD)v411)
                                                                                                            {
                                                                                                              for (uint64_t i185 = 0LL;
                                                                                                                    i185 != v411;
                                                                                                                    ++i185)
                                                                                                              {
                                                                                                                uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i185, v15[i185]);
                                                                                                              }
                                                                                                            }
                                                                                                          }

                                                                                                          else if ((v432 & 1) != 0 && v14 == 1197)
                                                                                                          {
                                                                                                            uint64_t result = fprintf(v8, "%20s:\n", "poDetectGBBedAge");
                                                                                                            else {
                                                                                                              uint64_t v413 = v438;
                                                                                                            }
                                                                                                            if ((_DWORD)v413)
                                                                                                            {
                                                                                                              for (uint64_t i186 = 0LL;
                                                                                                                    i186 != v413;
                                                                                                                    ++i186)
                                                                                                              {
                                                                                                                uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i186, v15[i186]);
                                                                                                              }
                                                                                                            }
                                                                                                          }

                                                                                                          else
                                                                                                          {
                                                                                                            if ((v432 & 1) != 0 && v14 == 1199 || (v432 & 1) != 0 && v14 == 1191 || (v432 & 1) != 0 && v14 == 1192 || (v432 & 1) != 0 && v14 == 1205) {
                                                                                                              goto LABEL_81;
                                                                                                            }
                                                                                                            if ((v432 & 1) != 0 && v14 == 1211)
                                                                                                            {
                                                                                                              uint64_t result = fprintf(v8, "%20s:\n", "forcedAllocationSmallEraseQ");
                                                                                                              else {
                                                                                                                uint64_t v415 = v438;
                                                                                                              }
                                                                                                              if ((_DWORD)v415)
                                                                                                              {
                                                                                                                for (uint64_t i187 = 0LL;
                                                                                                                      i187 != v415;
                                                                                                                      ++i187)
                                                                                                                {
                                                                                                                  uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i187, v15[i187]);
                                                                                                                }
                                                                                                              }
                                                                                                            }

                                                                                                            else if ((v432 & 1) != 0 && v14 == 1201)
                                                                                                            {
                                                                                                              uint64_t result = fprintf(v8, "%20s:\n", "gcVerticalSuccssfulAlignments");
                                                                                                              else {
                                                                                                                uint64_t v417 = v438;
                                                                                                              }
                                                                                                              if ((_DWORD)v417)
                                                                                                              {
                                                                                                                for (uint64_t i188 = 0LL;
                                                                                                                      i188 != v417;
                                                                                                                      ++i188)
                                                                                                                {
                                                                                                                  uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i188, v15[i188]);
                                                                                                                }
                                                                                                              }
                                                                                                            }

                                                                                                            else if ((v432 & 1) != 0 && v14 == 1202)
                                                                                                            {
                                                                                                              uint64_t result = fprintf(v8, "%20s:\n", "gcVerticalNoAlignmentDueToMissingSegs");
                                                                                                              else {
                                                                                                                uint64_t v419 = v438;
                                                                                                              }
                                                                                                              if ((_DWORD)v419)
                                                                                                              {
                                                                                                                for (uint64_t i189 = 0LL;
                                                                                                                      i189 != v419;
                                                                                                                      ++i189)
                                                                                                                {
                                                                                                                  uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i189, v15[i189]);
                                                                                                                }
                                                                                                              }
                                                                                                            }

                                                                                                            else
                                                                                                            {
                                                                                                              if ((v432 & 2) != 0 && v14 == 1225 || (v432 & 2) != 0 && v14 == 1226 || (v432 & 2) != 0 && v14 == 1227) {
                                                                                                                goto LABEL_81;
                                                                                                              }
                                                                                                              if ((v432 & 1) != 0 && v14 == 1228)
                                                                                                              {
                                                                                                                uint64_t result = fprintf(v8, "%20s:\n", "HUPolicyWidthDown");
                                                                                                                else {
                                                                                                                  uint64_t v421 = v438;
                                                                                                                }
                                                                                                                if ((_DWORD)v421)
                                                                                                                {
                                                                                                                  for (uint64_t i190 = 0LL;
                                                                                                                        i190 != v421;
                                                                                                                        ++i190)
                                                                                                                  {
                                                                                                                    uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i190, v15[i190]);
                                                                                                                  }
                                                                                                                }
                                                                                                              }

                                                                                                              else if ((v432 & 1) != 0 && v14 == 1229)
                                                                                                              {
                                                                                                                uint64_t result = fprintf(v8, "%20s:\n", "HUPolicyWidthUp");
                                                                                                                else {
                                                                                                                  uint64_t v423 = v438;
                                                                                                                }
                                                                                                                if ((_DWORD)v423)
                                                                                                                {
                                                                                                                  for (uint64_t i191 = 0LL;
                                                                                                                        i191 != v423;
                                                                                                                        ++i191)
                                                                                                                  {
                                                                                                                    uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i191, v15[i191]);
                                                                                                                  }
                                                                                                                }
                                                                                                              }

                                                                                                              else
                                                                                                              {
                                                                                                                if ((v432 & 2) != 0 && v14 == 1230 || (v432 & 2) != 0 && v14 == 1231 || (v432 & 1) != 0 && v14 == 1235 || (v432 & 1) != 0 && v14 == 1236 || (v432 & 1) != 0 && v14 == 1232 || (v432 & 1) != 0 && v14 == 1233 || (v432 & 1) != 0 && v14 == 1234) {
                                                                                                                  goto LABEL_81;
                                                                                                                }
                                                                                                                if ((v432 & 1) != 0 && v14 == 1224)
                                                                                                                {
                                                                                                                  uint64_t result = fprintf(v8, "%20s:\n", "apfsValidLbaOvershoot");
                                                                                                                  else {
                                                                                                                    uint64_t v425 = v438;
                                                                                                                  }
                                                                                                                  if ((_DWORD)v425)
                                                                                                                  {
                                                                                                                    for (uint64_t i192 = 0LL;
                                                                                                                          i192 != v425;
                                                                                                                          ++i192)
                                                                                                                    {
                                                                                                                      uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i192, v15[i192]);
                                                                                                                    }
                                                                                                                  }
                                                                                                                }

                                                                                                                else if ((v432 & 1) != 0 && v14 == 1241)
                                                                                                                {
                                                                                                                  uint64_t result = fprintf(v8, "%20s:\n", "s2rTimeHisto");
                                                                                                                  else {
                                                                                                                    uint64_t v427 = v438;
                                                                                                                  }
                                                                                                                  if ((_DWORD)v427)
                                                                                                                  {
                                                                                                                    for (uint64_t i193 = 0LL;
                                                                                                                          i193 != v427;
                                                                                                                          ++i193)
                                                                                                                    {
                                                                                                                      uint64_t result = fprintf(v8, "                      [%d] = %llu\n", i193, v15[i193]);
                                                                                                                    }
                                                                                                                  }
                                                                                                                }

                                                                                                                else
                                                                                                                {
                                                                                                                  if ((v432 & 2) != 0 && v14 == 1247 || (v432 & 2) != 0 && v14 == 1248 || (v432 & 1) != 0 && v14 == 1254 || (v432 & 1) != 0 && v14 == 1255 || (v432 & 1) != 0 && v14 == 1256) {
                                                                                                                    goto LABEL_81;
                                                                                                                  }
                                                                                                                  if (*(_DWORD *)v435 && (_DWORD)v438)
                                                                                                                  {
                                                                                                                    if ((_DWORD)v438 == 1)
                                                                                                                    {
                                                                                                                      uint64_t result = fprintf(v8, "                KEY_%u:\t%llu\n");
                                                                                                                    }

                                                                                                                    else
                                                                                                                    {
                                                                                                                      printf("KEY_%u:\n", v14);
                                                                                                                      uint64_t v429 = 0LL;
                                                                                                                      else {
                                                                                                                        uint64_t v430 = v438;
                                                                                                                      }
                                                                                                                      do
                                                                                                                      {
                                                                                                                        uint64_t result = fprintf(v8, "                      [%d] = %llu\n", v429, v15[v429]);
                                                                                                                        ++v429;
                                                                                                                      }

                                                                                                                      while (v430 != v429);
                                                                                                                    }
                                                                                                                  }
                                                                                                                }
                                                                                                              }
                                                                                                            }
                                                                                                          }
                                                                                                        }
                                                                                                      }
                                                                                                    }
                                                                                                  }
                                                                                                }
                                                                                              }
                                                                                            }
                                                                                          }
                                                                                        }
                                                                                      }
                                                                                    }
                                                                                  }
                                                                                }
                                                                              }
                                                                            }
                                                                          }
                                                                        }
                                                                      }
                                                                    }
                                                                  }
                                                                }
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }

LABEL_82:
          unint64_t v10 = v23;
          a4 = v432;
          int v7 = v22;
          unint64_t v11 = v434;
          goto LABEL_32;
        }

        v116 = "TempSensorMin";
      }

      uint64_t result = fprintf(v8, "%20s:\n", v116);
      if ((_DWORD)v438) {
        uint64_t result = fprintf(v8, "                      [%d] = %llu\n");
      }
      goto LABEL_82;
    }

    uint64_t result = fprintf(v8, "%20s:\t%llu\n", "validLbas", *v15);
LABEL_32:
    a2 = &v15[v438];
    a3 = v17 - v438;
    if (!a3) {
      goto LABEL_3133;
    }
  }

  uint64_t result = fwrite("ASPUserClient: maxEl < elements", 0x1FuLL, 1uLL, v8);
LABEL_3133:
  if (v437)
  {
    uint64_t result = fprintf( v8,  "%20s:\t%f\n",  "WriteAmp",  (double)v436 * (double)((v13 * *(_DWORD *)&v435[4]) >> 12) / (double)v437);
    if (v12)
    {
      if ((_DWORD)v11) {
        uint64_t result = fprintf( v8,  "%20s:\t%f\n",  "IntermediateWriteAmp",  (double)v12 * (double)((v11 * v13) >> 12) / (double)v437);
      }
    }
  }

  if (v10) {
    uint64_t result = fprintf(v8, "%20s:\t%llu\n", "statsMagCalTime", (v10 >> 24));
  }
LABEL_3139:
  if (v7) {
    return fclose(v8);
  }
  return result;
}

uint64_t extract_all_magazine_stats(const char *a1)
{
  unint64_t v18 = 0xDEADBEEFDEADBEEFLL;
  __ptr = 0LL;
  unint64_t v16 = 0LL;
  if (!a1)
  {
    os_log_t v1 = "NULL";
    goto LABEL_19;
  }

  os_log_t v1 = a1;
  uint64_t v2 = fopen(a1, "a");
  if (!v2)
  {
LABEL_19:
    fprintf(__stderrp, "Error: cannot open dest file %s", v1);
    uint64_t v11 = 0LL;
    id v3 = 0LL;
    goto LABEL_23;
  }

  id v3 = v2;
  v20[0] = xmmword_100031E40;
  v20[1] = xmmword_100031E50;
  v20[2] = xmmword_100031E60;
  int v21 = 168;
  id v4 = v22;
  uint64_t v5 = -1176LL;
  do
  {
    *v4++ = v5 + 1512;
    v5 += 168LL;
  }

  while (v5);
  uint64_t v6 = 0LL;
  *(_OWORD *)&v22[28] = xmmword_100031E70;
  int v23 = 8064;
  int v7 = 8736;
  do
  {
    *(_DWORD *)&v24[v6] = v7;
    v6 += 4LL;
    v7 += 4368;
  }

  while (v6 != 36);
  if (sub_10002E940(&v16) && v16 && *((_DWORD *)v16 + 4))
  {
    uint64_t v8 = 0LL;
    while (1)
    {
      int v9 = *(_DWORD *)((char *)v20 + v8);
      if (!sub_100021488(v16, v9, 1, &__ptr, &__size))
      {
        fprintf(__stderrp, "Error: failed to extract stats magazine for %u hours back", v9);
        goto LABEL_22;
      }

      if (!__ptr || __size == 0) {
        break;
      }
      v8 += 4LL;
      fwrite(__ptr, __size, 1uLL, v3);
      fwrite(&v18, 8uLL, 1uLL, v3);
      free(__ptr);
      __ptr = 0LL;
      size_t __size = 0LL;
      if (v8 == 136)
      {
        syslog(5, "All stats magazine extracted.");
        uint64_t v11 = 1LL;
        goto LABEL_23;
      }
    }

    unint64_t v12 = __stderrp;
    unint64_t v13 = "Error: extracted stats magazine but did not generate proper buffer";
    size_t v14 = 66LL;
  }

  else
  {
    unint64_t v12 = __stderrp;
    unint64_t v13 = "Unable to get nand connection\n";
    size_t v14 = 30LL;
  }

  fwrite(v13, v14, 1uLL, v12);
LABEL_22:
  uint64_t v11 = 0LL;
LABEL_23:
  if (v16)
  {
    sub_10002EA88((uint64_t)v16);
    unint64_t v16 = 0LL;
  }

  if (v3) {
    fclose(v3);
  }
  if (__ptr) {
    free(__ptr);
  }
  return v11;
}

uint64_t print_all_stats(char *a1)
{
  return print_asp_magazine_stats(a1, 0, 0);
}

uint64_t print_asp_stats(char *a1)
{
  return print_asp_magazine_stats(a1, 0, 1);
}

uint64_t print_band_stats(char *a1)
{
  return print_band_stats_v2(a1, 0);
}

uint64_t print_band_stats_v2(char *a1, int a2)
{
  int v4 = sub_10002E7C0(0LL, 299, 0, &outputStruct);
  int v5 = outputStruct & 0xF;
  if (!v4) {
    int v5 = 1;
  }
  uint64_t v13 = 0LL;
  outputStruct = 0LL;
  if (v5 != 2)
  {
    if (v5 == 3)
    {
      uint64_t v6 = (unsigned int *)sub_10002E788(0LL, 297, &v13, 0, 1);
      outputStruct = v6;
      if (v6)
      {
        int v7 = v6;
        sub_10002CC3C(a1, (uint64_t)v6, v13);
LABEL_12:
        free(v7);
        return 1LL;
      }

      unint64_t v10 = __stderrp;
      uint64_t v11 = "Error: Cannot Extract Band Stats for ASP3\n";
      size_t v12 = 42LL;
      goto LABEL_16;
    }

void sub_10002CC3C(char *__filename, uint64_t a2, unsigned int a3)
{
  int v33 = 0;
  uint64_t v32 = 0LL;
  int v31 = -1;
  uint64_t v30 = -1LL;
  int v29 = 0;
  uint64_t v28 = 0LL;
  int v27 = 0;
  uint64_t v26 = 0LL;
  int v25 = 0;
  uint64_t v24 = 0LL;
  unint64_t v21 = 0LL;
  if (__filename)
  {
    uint64_t v6 = fopen(__filename, "a");
    if (!v6)
    {
      fprintf(__stderrp, "Unable to open %s\n", __filename);
      return;
    }
  }

  else
  {
    uint64_t v6 = __stdoutp;
  }

  if (*(_DWORD *)(a2 + 8) != 1)
  {
    fprintf(__stderrp, "Version mismatch, expected 1 got %d\n");
LABEL_9:
    if (__filename) {
      fclose(v6);
    }
    return;
  }

  if (*(_DWORD *)a2 > a3)
  {
    fprintf(__stderrp, "Insufficient size, expected %d got %d\n");
    goto LABEL_9;
  }

  unsigned int v7 = *(_DWORD *)(a2 + 4);
  uint64_t v8 = (unsigned __int16 *)sub_10002E788(0LL, 264, &v21, 0, 1);
  if (v8)
  {
    int v9 = v8;
    if (v21 >= 2 && 21 * (unint64_t)*v8 + 2 <= v21)
    {
      uint64_t v11 = (const char *)&xmmword_1000649E0;
      strcpy((char *)&xmmword_1000649E0, "USER PARTITION");
      strcpy((char *)qword_1000649FE, "INTERMEDIATE PARTITION");
      strcpy(byte_100064A1C, "SKINNY PARTITION");
      fwrite("Band stats:\n", 0xCuLL, 1uLL, v6);
      fwrite( "Flags: Bits/Cell (1 or 3), r: retrace, C: GCcan, M: GCmust, S: Special, R: GCrd, E: erased, I: toInvalidate\n",  0x6CuLL,  1uLL,  v6);
      int32x2_t v12 = *(int32x2_t *)(a2 + 12);
      __int32 v23 = v12.i32[0];
      int32x2_t v22 = vrev64_s32(v12);
      uint64_t v20 = v9;
      uint64_t v13 = (uint64_t)(v9 + 1);
      size_t v14 = sub_10002DF44( v6,  (unsigned int *)(a2 + 20),  v7,  1u,  (uint64_t)&v22,  (uint64_t)&v24,  (uint64_t)&v32,  (uint64_t)&v30,  (uint64_t)&v28,  (uint64_t)&v26,  v13);
      BOOL v15 = sub_10002DF44( v6,  v14,  v7,  0,  (uint64_t)&v22,  (uint64_t)&v24,  (uint64_t)&v32,  (uint64_t)&v30,  (uint64_t)&v28,  (uint64_t)&v26,  v13);
      sub_10002DF44( v6,  v15,  v7,  2u,  (uint64_t)&v22,  (uint64_t)&v24,  (uint64_t)&v32,  (uint64_t)&v30,  (uint64_t)&v28,  (uint64_t)&v26,  v13);
      for (unint64_t i = 0LL; i != 12; i += 4LL)
      {
        unsigned int v17 = *(_DWORD *)((char *)&v26 + i);
        if (v17)
        {
          int v18 = *(_DWORD *)((char *)&v28 + i) / v17;
          *(_DWORD *)((char *)&v28 + i) = v18;
          unsigned __int32 v19 = v22.u32[i / 4];
          fprintf( v6,  "%-23s: Erase Cycles: Max(%d, %d%% of EoL) Min(%d, %d%% of EoL) Avg(%d, %d%% of EoL)\n",  v11,  *(_DWORD *)((char *)&v32 + i),  100 * *(_DWORD *)((char *)&v32 + i) / v19,  *(_DWORD *)((char *)&v30 + i),  100 * *(_DWORD *)((char *)&v30 + i) / v19,  v18,  100 * v18 / v19);
          fprintf(v6, "%24s Max band age:    (%d)\n", " ", *(_DWORD *)((char *)&v24 + i));
          fprintf(v6, "%24s EoL erase cycles:(%d)\n", " ", v19);
        }

        v11 += 30;
      }

      if (__filename) {
        fclose(v6);
      }
      unint64_t v10 = v20;
    }

    else
    {
      fwrite("Flow list too small", 0x13uLL, 1uLL, __stderrp);
      if (__filename) {
        fclose(v6);
      }
      unint64_t v10 = v9;
    }

    free(v10);
  }

  else
  {
    fwrite("Can't get flow list", 0x13uLL, 1uLL, __stderrp);
    if (__filename) {
      fclose(v6);
    }
  }

void sub_10002D054(char *__filename, unsigned int *a2, unsigned int a3, int a4)
{
  int v101 = 0;
  uint64_t v100 = 0LL;
  int v99 = -1;
  uint64_t v98 = -1LL;
  int v97 = 0;
  uint64_t v96 = 0LL;
  int v95 = 0;
  uint64_t v94 = 0LL;
  memset(v89, 0, sizeof(v89));
  v90[0] = 0;
  if (__filename)
  {
    unsigned int v7 = fopen(__filename, "a");
    if (!v7)
    {
      fprintf(__stderrp, "Unable to open %s\n", __filename);
      return;
    }
  }

  else
  {
    unsigned int v7 = __stdoutp;
  }

  fwrite("Band stats:\n", 0xCuLL, 1uLL, v7);
  fwrite("===========\n", 0xCuLL, 1uLL, v7);
  uint64_t v9 = *a2;
  uint64_t v8 = a2[1];
  fprintf(v7, "numBands: %d\n", *a2);
  if (a4) {
    int v10 = 8;
  }
  else {
    int v10 = 5;
  }
  if ((_DWORD)v9)
  {
    unsigned int v11 = v9 * v10 + 2 * v8 + 2;
    if (v11 <= a3)
    {
      int v12 = v11 + v8;
      unsigned int v13 = a3 >> 2;
      uint64_t v14 = (uint64_t)&a2[v11 + 2];
      BOOL v15 = (int *)&a2[v11];
      if (a3 >> 2 == v12) {
        unint64_t v16 = v15;
      }
      else {
        unint64_t v16 = 0LL;
      }
      if ((_DWORD)v8 == 2)
      {
        unsigned int v18 = a2[2];
        unsigned int v20 = a2[3];
        v93[0] = v18;
        v92[0] = v20;
        if (v13 == v12) {
          int v21 = *v15;
        }
        else {
          int v21 = 30000;
        }
        LODWORD(v91[0]) = v21;
        strcpy((char *)&xmmword_1000649E0, "INTERMEDIATE PARTITION");
        unsigned int v22 = a2[5];
        v93[1] = a2[4];
        unsigned __int32 v19 = a2 + 6;
        v92[1] = v22;
        if (v13 == v12) {
          int v23 = *(_DWORD *)(v14 - 4);
        }
        else {
          int v23 = 750;
        }
        HIDWORD(v91[0]) = v23;
        strcpy((char *)qword_1000649FE, "USER PARTITION");
        if (!v21 || !v23)
        {
          unint64_t v16 = 0LL;
          v91[0] = 0x2EE00007530LL;
        }
      }

      else
      {
        if ((_DWORD)v8 != 1)
        {
          fprintf(v7, "ASP returned %d partitions, the tool does not know how to handle this many partitions\n");
          goto LABEL_69;
        }

        unsigned int v18 = a2[2];
        unsigned int v17 = a2[3];
        v93[0] = v18;
        unsigned __int32 v19 = a2 + 4;
        v92[0] = v17;
        if (v13 == v12)
        {
          LODWORD(v91[0]) = *v15;
          strcpy((char *)&xmmword_1000649E0, "USER PARTITION");
          if (LODWORD(v91[0]))
          {
            unint64_t v16 = v15;
          }

          else
          {
            unint64_t v16 = 0LL;
            LODWORD(v91[0]) = 3000;
          }
        }

        else
        {
          unint64_t v16 = 0LL;
          LODWORD(v91[0]) = 3000;
          strcpy((char *)&xmmword_1000649E0, "USER PARTITION");
        }
      }

      uint64_t v83 = malloc(4 * v9);
      if (v83)
      {
        uint64_t v72 = v16;
        uint64_t v73 = __filename;
        __streauint64_t m = v7;
        unint64_t v24 = 0LL;
        int v78 = 0;
        int v79 = 0;
        int v80 = 0;
        uint64_t v81 = v9;
        while (1)
        {
          if (a4)
          {
            int v80 = v19[5];
            int v79 = v19[6];
            int v87 = v19 + 8;
            int v78 = v19[7];
          }

          else
          {
            int v87 = v19 + 5;
          }

          uint64_t v25 = 0LL;
          unsigned int v26 = *v19;
          int v27 = v19[1];
          unsigned int v28 = v19[2];
          unsigned int v29 = v19[3];
          int v30 = (*v19 >> 1) & 1;
          int v31 = (*v19 >> 2) & 1;
          int v32 = (*v19 >> 3) & 1;
          unsigned int v33 = v19[4];
          int v34 = v26 & 1;
          int v35 = (v26 >> 4) & 3;
          v83[v24] = v29;
          uint64_t v36 = (const char *)&xmmword_1000649E0;
          do
          {
            unint64_t v37 = v93[v25];
            if (v24 >= v37 && v24 <= v92[v25])
            {
              if (v24 == v37)
              {
                int v75 = v27;
                int v76 = v31;
                int v77 = v30;
                int v74 = v35;
                fprintf(__stream, "\n%s:\n", v36);
                int v35 = v74;
                int v27 = v75;
                int v31 = v76;
                int v30 = v77;
              }

              if (v24 >= v18)
              {
                unsigned int v39 = *((_DWORD *)&v94 + v25);
                if (v39 <= v33) {
                  unsigned int v39 = v33;
                }
                *((_DWORD *)&v94 + v25) = v39;
                unsigned int v40 = *((_DWORD *)&v100 + v25);
                if (v40 <= v29) {
                  unsigned int v40 = v29;
                }
                *((_DWORD *)&v100 + v25) = v40;
                unsigned int v41 = *((_DWORD *)&v98 + v25);
                if (v41 >= v29) {
                  unsigned int v41 = v29;
                }
                *((_DWORD *)&v98 + v25) = v41;
                uint64_t v38 = v25;
                *((_DWORD *)&v96 + v25) += v29;
                goto LABEL_52;
              }

LABEL_44:
              fprintf(__stream, "band: %4d\tUtility Band\n", v24);
              goto LABEL_58;
            }

            ++v25;
            v36 += 30;
          }

          while (v8 != v25);
          if (v24 < v18) {
            goto LABEL_44;
          }
          uint64_t v38 = 0LL;
LABEL_52:
          unsigned int v42 = 100 * v29;
          if (v28 == -1)
          {
            uint64_t v43 = __stream;
            fprintf( __stream,  "band:%4d\tflow:%2d\tvalid:    NA\terases:%5d [%3d%%] \tage:%5d\tGCcan:%d GCmust:%d GCrd: %d Special: %d mode:%d ",  v24,  v27,  v29,  v42 / *((_DWORD *)v91 + v38),  v33,  v34,  v30,  v31,  v32,  v35);
            if ((a4 & 1) != 0) {
              fwrite("Valid Sectors: NA Parity Sectors: NA Total Sectors: NA", 0x36uLL, 1uLL, __stream);
            }
          }

          else
          {
            double v71 = (float)v28 / 10.0;
            uint64_t v43 = __stream;
            fprintf( __stream,  "band:%4d\tflow:%2d\tvalid:%6.1f\terases:%5d [%3d%%] \tage:%5d\tGCcan:%d GCmust:%d GCrd: %d Special: %d mode:%d ",  v24,  v27,  v71,  v29,  v42 / *((_DWORD *)v91 + v38),  v33,  v34,  v30,  v31,  v32,  v35);
            if (a4) {
              fprintf(__stream, "Valid Sectors: %d Parity Sectors: %d Total Sectors: %d", v79, v78, v80);
            }
          }

          fputc(10, v43);
LABEL_58:
          unsigned __int32 v19 = v87;
          if (++v24 == v81)
          {
            uint64_t v44 = "";
            if (!v72) {
              uint64_t v44 = "*using kASPNand constants!";
            }
            uint64_t v82 = v44;
            size_t v45 = v92;
            uint64_t v46 = v93;
            unsigned int v47 = (unsigned int *)&v96;
            uint64_t v48 = (const char *)&xmmword_1000649E0;
            unsigned int v49 = &v100;
            uint64_t v50 = (unsigned int *)v91;
            unsigned int v51 = &v98;
            uint64_t v52 = &v94;
            uint64_t v53 = v8;
            do
            {
              unsigned int v55 = *v45++;
              unsigned int v54 = v55;
              unsigned int v56 = *v46++;
              BOOL v57 = v54 >= v56;
              unsigned int v58 = v54 - v56;
              if (v57)
              {
                unsigned int v59 = *v47 / (v58 + 1);
                unsigned int *v47 = v59;
                uint64_t v86 = v46;
                uint64_t v88 = v45;
                unsigned int v60 = *v50;
                fprintf( __stream,  "%-23s: Erase Cycles: Max(%d, %d%% of EoL) Min(%d, %d%% of EoL) Avg(%d, %d%% of EoL)\n",  v48,  *(_DWORD *)v49,  100 * *(_DWORD *)v49 / v60,  *(_DWORD *)v51,  100 * *(_DWORD *)v51 / v60,  v59,  100 * v59 / v60);
                fprintf(__stream, "%24s Max band age:    (%d)\n", " ", *(_DWORD *)v52);
                fprintf(__stream, "%24s EoL erase cycles:(%d) %s\n", " ", v60, v82);
                uint64_t v46 = v86;
                size_t v45 = v88;
              }

              ++v47;
              v48 += 30;
              unsigned int v49 = (uint64_t *)((char *)v49 + 4);
              ++v50;
              unsigned int v51 = (uint64_t *)((char *)v51 + 4);
              uint64_t v52 = (uint64_t *)((char *)v52 + 4);
              --v53;
            }

            while (v53);
            BOOL v61 = (_DWORD)v8 != 1;
            unsigned int v62 = v93[v61];
            unsigned int v63 = v92[v61];
            if (v62 <= v63)
            {
              float v67 = (float)*(unsigned int *)((unint64_t)&v100 | (4 * v61));
              unsigned int v65 = v73;
              uint64_t v66 = __stream;
              do
              {
                uint64_t v68 = &dword_100000018;
                while ((float)(*(float *)((char *)&unk_1000645D0 + v68) * v67) > (float)v83[v62])
                {
                  v68 -= 4LL;
                  if (v68 == -4) {
                    goto LABEL_78;
                  }
                }

                ++*(_DWORD *)((char *)v89 + v68);
LABEL_78:
                ++v62;
              }

              while (v62 <= v63);
              int v64 = v90[0];
            }

            else
            {
              int v64 = 0;
              unsigned int v65 = v73;
              uint64_t v66 = __stream;
            }

            fwrite("USER PARTITION:\n", 0x10uLL, 1uLL, v66);
            unint64_t v69 = 0LL;
            uint64_t v70 = (unsigned int *)((unint64_t)&v100 | (4 * v61));
            do
            {
              if (v69) {
                fprintf( v66,  "Erase Quantile [  %3.2f (%.2f - %.2f erases) ] = %d bands\n",  *(float *)((char *)&unk_1000645D0 + v69 + 24) * 100.0,  (float)(*(float *)((char *)&unk_1000645D0 + v69 + 24) * (float)*v70),  (float)(*(float *)((char *)&unk_1000645D0 + v69 + 28) * (float)*v70),  v90[v69 / 4]);
              }
              else {
                fprintf( v66,  "Erase Quantile [  %3.2f (%.2f - %.2f erases) ] = %d bands\n",  *(float *)&dword_1000645E8 * 100.0,  (float)(*(float *)&dword_1000645E8 * (float)*v70),  (float)(*(float *)&dword_1000645E8 * (float)*v70),  v64);
              }
              v69 -= 4LL;
            }

            while (v69 != -28LL);
            if (v65) {
              fclose(v66);
            }
            free(v83);
            return;
          }
        }
      }

      fprintf(v7, "could not allocate %d bytes\n");
LABEL_69:
      if (__filename) {
        fclose(v7);
      }
    }
  }

uint64_t sub_10002D8DC(char *a1, int a2, _DWORD *a3, uint64_t a4)
{
  uint64_t v9 = 0LL;
  int v10 = 0LL;
  if (sub_100021364(8u, &v10, &v9))
  {
    if (a2) {
      *a3 = sub_10002D98C(a1, (uint64_t)v10, 1, a4);
    }
    else {
      sub_10002D98C(a1, (uint64_t)v10, 0, a4);
    }
    free(v10);
    return 1LL;
  }

  else
  {
    fwrite("Error: IO NVMe Smart cmd failed to extract ASP NAND defects!\n", 0x3DuLL, 1uLL, __stderrp);
    return 0LL;
  }

uint64_t sub_10002D98C(char *__filename, uint64_t a2, char a3, uint64_t a4)
{
  int v27 = 0;
  if (__filename)
  {
    __streauint64_t m = fopen(__filename, "a");
    if (!__stream)
    {
      fprintf(__stderrp, "Unable to open %s\n", __filename);
      return 0LL;
    }
  }

  else
  {
    __streauint64_t m = __stdoutp;
  }

  uint64_t v8 = *(unsigned int *)(a2 + 8);
  if ((a3 & 1) != 0) {
    goto LABEL_10;
  }
  uint64_t v9 = (unsigned __int16 *)(a2 + 12);
  if (a4)
  {
    if ((_DWORD)v8)
    {
      int v10 = (_DWORD *)(a4 + 16);
      uint64_t v11 = *(unsigned int *)(a2 + 8);
      do
      {
        *(v10 - 4) = *(_DWORD *)v9;
        *(v10 - 3) = *((_DWORD *)v9 + 1);
        *(v10 - 2) = *((_DWORD *)v9 + 2);
        *(v10 - 1) = *((_DWORD *)v9 + 3);
        *int v10 = *((_DWORD *)v9 + 4);
        v10[1] = *((_DWORD *)v9 + 5);
        v10[2] = *((_DWORD *)v9 + 6);
        v10[3] = *((_DWORD *)v9 + 7);
        v10 += 8;
        v9 += 16;
        --v11;
      }

      while (v11);
    }

uint64_t print_grown_defects_ext(char *a1)
{
  return sub_10002D8DC(a1, 0, 0LL, 0LL);
}

uint64_t print_snapshots(char *__filename)
{
  if (__filename)
  {
    uint64_t v2 = fopen(__filename, "a");
    if (!v2)
    {
      fprintf(__stderrp, "Unable to open %s\n", __filename);
      return 0LL;
    }

    id v3 = v2;
    syslog(5, "printing ASP snapshots to %s", __filename);
    int v4 = sub_10002E7A0(22, v15);
    if (!v4) {
      goto LABEL_18;
    }
  }

  else
  {
    id v3 = __stdoutp;
    int v4 = sub_10002E7A0(22, v15);
    if (!v4) {
      return 0LL;
    }
  }

  int v5 = v4;
  syslog(5, "ASP get snapshot data done.");
  vm_size_t v6 = vm_page_size;
  uint64_t v16 = 40 * vm_page_size;
  unsigned int v7 = (char *)valloc(40 * vm_page_size);
  if (!v7)
  {
    uint64_t v16 = 4 * v6;
    unsigned int v7 = (char *)valloc(4 * v6);
    if (!v7)
    {
      fwrite("can't allocate buffer!\n", 0x17uLL, 1uLL, __stderrp);
      free(v5);
      if (__filename) {
LABEL_18:
      }
        fclose(v3);
      return 0LL;
    }
  }

  uint64_t v8 = sub_10002E7A0(145, &v14);
  syslog(5, "ASP get snapshot header done.");
  if (v8 && v8[1] > 5u)
  {
    uint64_t v9 = v8[5];
    if (v14 != v9)
    {
      fprintf(__stderrp, "Read snapshot header %zu bytes, expect %u bytes\n", v14, v9);
      goto LABEL_21;
    }

    unsigned int v13 = 0;
  }

  else if ((sub_100020E8C((uint64_t)v5, *(unint64_t *)v15, v7, (size_t *)&v16) & 1) == 0)
  {
    fwrite("Snapshot parser requires a larger string buffer\n", 0x30uLL, 1uLL, v3);
LABEL_21:
    uint64_t v10 = 0LL;
    goto LABEL_22;
  }

  fputs(v7, v3);
  uint64_t v10 = 1LL;
LABEL_22:
  free(v5);
  free(v7);
  free(v8);
  uint64_t v11 = "stdout";
  if (__filename) {
    uint64_t v11 = __filename;
  }
  syslog(5, "ASP snapshot written to %s done", v11);
  if (__filename) {
    fclose(v3);
  }
  return v10;
}

unsigned int *sub_10002DF44( FILE *__stream, unsigned int *a2, unsigned int a3, unsigned int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v11 = a2;
  int v12 = __stream;
  unsigned int v13 = *a2;
  if (a4 == HIBYTE(*a2))
  {
    uint64_t v11 = a2 + 1;
    int v14 = v13 & 0xFFFFFF;
    if ((v13 & 0xFFFFFF) != 0)
    {
      uint64_t v16 = a11;
      uint64_t v17 = a4;
      fprintf(__stream, "==== %s ====\n", (const char *)&xmmword_1000649E0 + 30 * a4);
      fprintf(v12, "\t%d bands\n", v14);
      int v18 = 0;
      unsigned int v54 = v12;
      int v47 = v14;
      do
      {
        unsigned int v51 = v11[3];
        unsigned int v20 = v11[4];
        int v19 = v11[5];
        int v21 = v12;
        unsigned int v22 = v11[1];
        uint64_t v23 = 73LL;
        uint64_t v24 = 45LL;
        if ((v22 & 0x40) == 0) {
          uint64_t v23 = 45LL;
        }
        uint64_t v46 = v23;
        uint64_t v25 = 114LL;
        if ((v22 & 0x100) == 0) {
          uint64_t v25 = 45LL;
        }
        uint64_t v26 = 67LL;
        if ((v22 & 1) == 0) {
          uint64_t v26 = 45LL;
        }
        uint64_t v27 = 77LL;
        if ((v22 & 2) == 0) {
          uint64_t v27 = 45LL;
        }
        uint64_t v28 = 82LL;
        if ((v22 & 4) == 0) {
          uint64_t v28 = 45LL;
        }
        uint64_t v29 = 83LL;
        if ((v22 & 8) == 0) {
          uint64_t v29 = 45LL;
        }
        if ((v22 & 0x10) != 0) {
          uint64_t v24 = 69LL;
        }
        uint64_t v45 = v25;
        uint64_t v30 = 49LL;
        if ((v22 & 0x10) == 0) {
          uint64_t v30 = 51LL;
        }
        fprintf( v21,  "Band:%4d  Flow:%s [%d]  Flags:%c%c%c%c%c%c%c%c  ",  *v11,  (const char *)(v16 + 21 * v11[2]),  v11[2],  v30,  v45,  v26,  v27,  v28,  v29,  v24,  v46);
        if (v51 == -1 || !v20) {
          fwrite("Valid Sectors: NA   Total Sectors: NA  ", 0x27uLL, 1uLL, v54);
        }
        else {
          fprintf(v54, "Valid Sectors: %5d  Total Sectors: %5d [%d%%]  ", v19, v20, 100 * v19 / v20);
        }
        int v52 = v18;
        unsigned int v31 = v11[6];
        if ((v22 & 0x80) != 0)
        {
          v11 += 7;
          if (v31)
          {
            do
            {
              unsigned int v37 = *v11;
              unsigned int v38 = v11[1];
              unsigned int v39 = v11[2];
              unsigned int v40 = *(_DWORD *)(a6 + 4 * v17);
              if (v40 <= v39) {
                unsigned int v40 = v11[2];
              }
              *(_DWORD *)(a6 + 4 * v17) = v40;
              unsigned int v41 = *(_DWORD *)(a7 + 4 * v17);
              if (v41 <= v38) {
                unsigned int v41 = v38;
              }
              *(_DWORD *)(a7 + 4 * v17) = v41;
              unsigned int v42 = *(_DWORD *)(a8 + 4 * v17);
              if (v42 >= v38) {
                unsigned int v42 = v38;
              }
              *(_DWORD *)(a8 + 4 * v17) = v42;
              *(_DWORD *)(a9 + 4 * v17) += v38;
              uint64_t v43 = v11 + 3;
              ++*(_DWORD *)(a10 + 4 * v17);
              fprintf( v54,  "\n\tBlock:%4d [Bork:%4d Dip: %4d Age:%5d Cycles:%5d EOL%%:%3d]",  v37,  v37 / a3,  v37 % a3,  v39,  v38,  100 * v38 / *(_DWORD *)(a5 + 4 * v17));
              v11 += 3;
              --v31;
            }

            while (v31);
            uint64_t v11 = v43;
            int v12 = v54;
            uint64_t v16 = a11;
            int v14 = v47;
          }

          else
          {
            int v12 = v54;
          }
        }

        else
        {
          int v32 = v11 + 8;
          unsigned int v33 = v11[7];
          fprintf(v54, "Age:%5d Cycles:%5d EOL%%:%3d\n", v33, v31, 100 * v31 / *(_DWORD *)(a5 + 4 * v17));
          unsigned int v34 = *(_DWORD *)(a6 + 4 * v17);
          if (v34 <= v33) {
            unsigned int v34 = v33;
          }
          *(_DWORD *)(a6 + 4 * v17) = v34;
          unsigned int v35 = *(_DWORD *)(a7 + 4 * v17);
          if (v35 <= v31) {
            unsigned int v35 = v31;
          }
          *(_DWORD *)(a7 + 4 * v17) = v35;
          unsigned int v36 = *(_DWORD *)(a8 + 4 * v17);
          if (v36 >= v31) {
            unsigned int v36 = v31;
          }
          *(_DWORD *)(a8 + 4 * v17) = v36;
          *(_DWORD *)(a9 + 4 * v17) += v31;
          ++*(_DWORD *)(a10 + 4 * v17);
          uint64_t v11 = v32;
          int v12 = v54;
        }

        fputc(10, v12);
        ++v18;
      }

      while (v52 + 1 != v14);
      fputc(10, v12);
    }
  }

  else
  {
    fwrite("Error parsing! missing header", 0x1DuLL, 1uLL, __stream);
  }

  return v11;
}

uint64_t sub_10002E2BC(char *__filename, const char *a2)
{
  if (__filename)
  {
    int v4 = fopen(__filename, "a");
    if (!v4) {
      return fprintf(__stderrp, "Unable to open %s\n", __filename);
    }
  }

  else
  {
    int v4 = __stdoutp;
  }

  fwrite("Trace dump:\n", 0xCuLL, 1uLL, v4);
  uint64_t result = fputs(a2, v4);
  if (__filename) {
    return fclose(v4);
  }
  return result;
}

uint64_t print_trace_dump(char *a1)
{
  uint64_t v3 = 0LL;
  int v4 = 0LL;
  if (sub_100021364(9u, &v4, &v3))
  {
    sub_10002E2BC(a1, (const char *)v4);
    free(v4);
    return 1LL;
  }

  else
  {
    fwrite("Error: IO NVMe Smart cmd failed to extract debug dump trace!\n", 0x3DuLL, 1uLL, __stderrp);
    return 0LL;
  }

void *sub_10002E3F0(char **a1, int a2, int a3, int a4, void *a5, char a6, char a7)
{
  unsigned int v13 = a1;
  int v21 = 0LL;
  *a5 = 0LL;
  if (!a1 && (!sub_10002E940(&v21) || (unsigned int v13 = v21) == 0LL || !*((_DWORD *)v21 + 4)))
  {
    fwrite("Err: Finding internal NAND exporter failed for fetch tunnel buffer.\n", 0x44uLL, 1uLL, __stderrp);
LABEL_11:
    int v19 = 0LL;
    goto LABEL_14;
  }

  int v14 = a3;
  unsigned int v15 = sub_10002E58C((uint64_t)v13, a2, a3, a4, a7);
  if (!v15)
  {
    fprintf(__stderrp, "failed to get data size for cmd option %d\n", a2);
    goto LABEL_11;
  }

  uint64_t v16 = v15;
  size_t v17 = (vm_page_size + v15 - 1) / vm_page_size * vm_page_size;
  int v18 = valloc(v17);
  int v19 = v18;
  if (v18)
  {
    bzero(v18, v17);
    if ((sub_10002E650((uint64_t)v13, a2, v14, a4, v19, v17, a6, a7) & 1) != 0)
    {
      *a5 = v16;
    }

    else
    {
      free(v19);
      int v19 = 0LL;
      *a5 = 0LL;
    }
  }

  else
  {
    fwrite("can't allocate buffer!\n", 0x17uLL, 1uLL, __stderrp);
  }

uint64_t sub_10002E58C(uint64_t a1, int a2, int a3, int a4, char a5)
{
  kern_return_t v7;
  uint64_t result;
  size_t outputStructCnt;
  unsigned int outputStruct;
  _DWORD inputStruct[3];
  uint64_t v12;
  int v13;
  unsigned int v13 = 0;
  int v12 = 0LL;
  outputStructCnt = 4LL;
  inputStruct[0] = a2;
  inputStruct[1] = a3 | 1;
  inputStruct[2] = a4;
  unsigned int v7 = IOConnectCallStructMethod( *(_DWORD *)(a1 + 16),  *(_DWORD *)(a1 + 28),  inputStruct,  0x18uLL,  &outputStruct,  &outputStructCnt);
  if (v7)
  {
    if ((a5 & 1) == 0) {
      fprintf(__stderrp, "Error calling CoreDebugTunnel method! - 0x%X\n", v7);
    }
    return 0LL;
  }

  else
  {
    uint64_t result = outputStruct;
    if (!outputStruct && (a5 & 1) == 0)
    {
      fprintf(__stderrp, "SizeOnly for tunnel command 0x%x returned 0\n", a2);
      return outputStruct;
    }
  }

  return result;
}

uint64_t sub_10002E650(uint64_t a1, int a2, int a3, int a4, void *outputStruct, size_t a6, char a7, char a8)
{
  kern_return_t v15;
  size_t v16;
  _DWORD inputStruct[3];
  uint64_t v19;
  int v20;
  size_t outputStructCnt;
  LOBYTE(v9) = a7;
  outputStructCnt = a6;
  unsigned int v20 = 0;
  int v19 = 0LL;
  while (1)
  {
    inputStruct[0] = a2;
    inputStruct[1] = a3;
    inputStruct[2] = a4;
    unsigned int v15 = IOConnectCallStructMethod( *(_DWORD *)(a1 + 16),  *(_DWORD *)(a1 + 28),  inputStruct,  0x18uLL,  outputStruct,  &outputStructCnt);
    if (v15 != -536870211) {
      break;
    }
    if ((v9 & 1) == 0) {
      goto LABEL_10;
    }
    if ((a8 & 1) == 0) {
      fprintf(__stderrp, "CoreDebugTunnel 0x%x returned kIOReturnNoMemory\n", a2);
    }
    uint64_t v16 = outputStructCnt;
    outputStructCnt = vm_page_size;
    uint64_t v9 = 1LL;
    if (vm_page_size == v16) {
      return v9;
    }
  }

  if (!v15) {
    return 1LL;
  }
LABEL_10:
  if ((a8 & 1) == 0) {
    fprintf(__stderrp, "Error calling CoreDebugTunnel method! - 0x%X\n", v15);
  }
  return 0LL;
}

void *sub_10002E770(char **a1, int a2, int a3, void *a4, char a5, char a6)
{
  return sub_10002E3F0(a1, a2, a3, 0, a4, a5, a6);
}

void *sub_10002E788(char **a1, int a2, void *a3, char a4, char a5)
{
  return sub_10002E3F0(a1, a2, 0, 0, a3, a4, a5);
}

void *sub_10002E7A0(int a1, void *a2)
{
  return sub_10002E3F0(0LL, a1, 0, 0, a2, 0, 0);
}

uint64_t sub_10002E7C0(char **a1, int a2, int a3, void *outputStruct)
{
  kern_return_t v7;
  uint64_t v8;
  size_t outputStructCnt;
  char **v11;
  _DWORD inputStruct[3];
  uint64_t v13;
  int v14;
  unsigned int v13 = 0LL;
  int v14 = 0;
  outputStructCnt = 4LL;
  uint64_t v11 = 0LL;
  inputStruct[0] = a2;
  inputStruct[1] = 1;
  inputStruct[2] = a3;
  if (!outputStruct)
  {
    syslog(3, "Error: must provide valid pointer for output value");
    goto LABEL_11;
  }

  if (a1)
  {
    mach_port_t v6 = *((_DWORD *)a1 + 4);
  }

  else if (!sub_10002E940(&v11) || (a1 = v11) == 0LL || (mach_port_t v6 = *((_DWORD *)v11 + 4)) == 0)
  {
    fwrite("Err: Finding internal NAND exporter failed.\n", 0x2CuLL, 1uLL, __stderrp);
    goto LABEL_11;
  }

  unsigned int v7 = IOConnectCallStructMethod(v6, *((_DWORD *)a1 + 8), inputStruct, 0x18uLL, outputStruct, &outputStructCnt);
  if (v7)
  {
    fprintf(__stderrp, "Error fetching the tunnel output buffer for opcode [%d], Result [0x%X]\n", a2, v7);
LABEL_11:
    uint64_t v8 = 0LL;
    goto LABEL_12;
  }

  uint64_t v8 = 1LL;
LABEL_12:
  if (v11) {
    sub_10002EA88((uint64_t)v11);
  }
  return v8;
}

void *sub_10002E8C8()
{
  return &unk_1000645F0;
}

void *sub_10002E8D4()
{
  return &unk_1000645F8;
}

void *sub_10002E8E0()
{
  return &unk_100064600;
}

void *sub_10002E8EC()
{
  return &unk_100064610;
}

void *sub_10002E8F8()
{
  return &unk_100064618;
}

void *sub_10002E904()
{
  return &unk_100064620;
}

void *sub_10002E910()
{
  return &unk_100064628;
}

void *sub_10002E91C()
{
  return &unk_100064630;
}

void *sub_10002E928()
{
  return &unk_100064608;
}

void *sub_10002E934()
{
  return &unk_100064638;
}

char *sub_10002E940(char ***a1)
{
  io_connect_t connect = 0;
  *a1 = 0LL;
  int v2 = pthread_mutex_trylock(&stru_100064640);
  if (v2)
  {
    if (v2 != 16
      || (syslog(4, "Warning: NANDInfo: NANDExporter: serializeAccess already locked. waiting for lock !\n"),
          pthread_mutex_lock(&stru_100064640)))
    {
      uint64_t v3 = __error();
      syslog(3, "Error: NANDInfo: NANDExporter: pthread_mutex_trylock() (%d) failed \n", *v3);
      return 0LL;
    }
  }

  syslog(5, "NANDInfo: NANDExporter object locked ! \n");
  int v5 = &off_100064680;
  uint64_t result = off_100064680;
  if (!off_100064680)
  {
LABEL_11:
    io_object_t v8 = 0;
    goto LABEL_12;
  }

  while (1)
  {
    mach_port_t v6 = IOServiceMatching(result);
    if (!v6) {
      goto LABEL_10;
    }
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v6);
    if (!MatchingService) {
      goto LABEL_10;
    }
    io_object_t v8 = MatchingService;
    if (!IOServiceOpen(MatchingService, mach_task_self_, 0, &connect)) {
      break;
    }
    IOServiceClose(connect);
    io_connect_t connect = 0;
    IOObjectRelease(v8);
LABEL_10:
    uint64_t v9 = v5[21];
    v5 += 21;
    uint64_t result = (char *)v9;
    if (!v9) {
      goto LABEL_11;
    }
  }

  syslog(5, "NANDInfo: findNandExporter_tunnel: Controller found: %s\n", *v5);
  uint64_t result = (char *)1;
LABEL_12:
  *((_DWORD *)v5 + 4) = connect;
  *((_DWORD *)v5 + 5) = v8;
  *a1 = v5;
  return result;
}

uint64_t sub_10002EA88(uint64_t a1)
{
  io_connect_t v2 = *(_DWORD *)(a1 + 16);
  if (v2)
  {
    IOServiceClose(v2);
    *(_DWORD *)(a1 + 16) = 0;
  }

  io_object_t v3 = *(_DWORD *)(a1 + 20);
  if (v3)
  {
    IOObjectRelease(v3);
    *(_DWORD *)(a1 + 20) = 0;
  }

  syslog(5, "NANDInfo: NANDExporter object unlocked ! \n");
  return pthread_mutex_unlock(&stru_100064640);
}

void sub_10002EADC(char a1, int a2, os_log_t log)
{
  v3[0] = 67109376;
  v3[1] = a2;
  __int16 v4 = 1024;
  int v5 = a1 & 1;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "IOPSCopyPowerSourcesByTypePrecise returned error. status: %d, NULL snapshot: %d",  (uint8_t *)v3,  0xEu);
}

void sub_10002EB64()
{
}

void sub_10002EB90()
{
}

void sub_10002EBBC(id *a1, void *a2)
{
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([a2 localizedDescription]);
  sub_1000097E8( (void *)&_mh_execute_header,  v3,  v4,  "Encountered error writing Unified Asset log to %s: %@",  v5,  v6,  v7,  v8,  2u);
}

void sub_10002EC6C(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  sub_1000097FC( (void *)&_mh_execute_header,  v2,  v3,  "Unified Asset task encountered error when calling sysdiagnoseInfoWithError: %@",  v4,  v5,  v6,  v7,  2u);

  sub_1000097DC();
}

void sub_10002ECE8()
{
}

void sub_10002ED14()
{
}

void sub_10002ED40(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  sub_1000097FC( (void *)&_mh_execute_header,  v2,  v3,  "Trial task encountered error when calling +sysdiagnoseInfoToDir:error: %@",  v4,  v5,  v6,  v7,  2u);

  sub_1000097DC();
}

void sub_10002EDBC(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 134217984;
  *(void *)(buf + 4) = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "W5DebugState: %lu", buf, 0xCu);
}

void sub_10002EE00()
{
  uid_t v0 = __error();
  strerror(*v0);
  sub_100009824();
  sub_1000097E8((void *)&_mh_execute_header, v1, v2, "Unable to open %@: %s", v3, v4, v5, v6, v7);
  sub_1000097DC();
}

void sub_10002EE7C()
{
  uid_t v0 = __error();
  strerror(*v0);
  sub_100009824();
  sub_1000097E8( (void *)&_mh_execute_header,  v1,  v2,  "Can't trigger keychord tailspin. Unable to create output file name %s: %s",  v3,  v4,  v5,  v6,  v7);
  sub_1000097DC();
}

void sub_10002EEFC(int a1)
{
}

void sub_10002EF6C()
{
}

void sub_10002EF98(void *a1, _OWORD *a2)
{
  int v4 = *__error();
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    uint64_t v5 = 3LL;
  }
  else {
    uint64_t v5 = 2LL;
  }
  int v7 = 136315138;
  uint64_t v8 = strerror(v4);
  uint64_t v6 = _os_log_send_and_compose_impl( v5,  a1,  a2,  80LL,  &_mh_execute_header,  &_os_log_default,  16LL,  "Unable to set root mode with error: %s. Aborting because this thread is in a bad state.",  (const char *)&v7);
  _os_crash_msg(*a1, v6);
  __break(1u);
}

void sub_10002F058()
{
}

void sub_10002F090(int a1, os_log_s *a2)
{
  v3[0] = 67109378;
  v3[1] = a1;
  __int16 v4 = 2082;
  uint64_t v5 = strerror(a1);
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Got error from os_eligibility_dump_sysdiagnose_data_to_dir (%d): %{public}s",  (uint8_t *)v3,  0x12u);
  sub_1000097DC();
}

void sub_10002F120()
{
}

id objc_msgSend_tailspinAugmentSpiWrapperForPath_withDestName_collectAriadne_withTimeout_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tailspinAugmentSpiWrapperForPath:withDestName:collectAriadne:withTimeout:");
}

id objc_msgSend_writeToURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:error:");
}