void start()
{
  id v0;
  os_log_s *v1;
  dispatch_queue_global_t global_queue;
  dispatch_queue_s *v3;
  dispatch_source_s *v4;
  _xpc_connection_s *mach_service;
  uint8_t v6[16];
  v0 = sub_100003368();
  v1 = (os_log_s *)objc_claimAutoreleasedReturnValue(v0);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "Starting up", v6, 2u);
  }

  global_queue = dispatch_get_global_queue(0LL, 0LL);
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0LL, v3);

  dispatch_source_set_event_handler(v4, &stru_100004278);
  dispatch_resume(v4);
  xpc_track_activity();
  mach_service = xpc_connection_create_mach_service("com.apple.mobile.assertion_agent", &_dispatch_main_q, 1uLL);
  xpc_connection_set_event_handler(mach_service, &stru_1000042B8);
  xpc_connection_resume(mach_service);
  dispatch_main();
}

void sub_1000024E8(id a1)
{
  id v1 = sub_100003368();
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v3 = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "Got SIGTERM, exiting now.", v3, 2u);
  }

  exit(0);
}

void sub_100002544(id a1, OS_xpc_object *a2)
{
  v2 = a2;
  if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_connection)
  {
    v8 = v2;
    xpc_connection_set_target_queue(v8, 0LL);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100002638;
    handler[3] = &unk_1000042E0;
    v11 = v8;
    v9 = v8;
    xpc_connection_set_event_handler(v9, handler);
    xpc_connection_resume(v9);
  }

  else
  {
    v3 = xpc_copy_description(v2);
    if (v3)
    {
      v4 = v3;
      id v5 = sub_100003368();
      v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        sub_1000034F4((uint64_t)v4, v6, v7);
      }

      free(v4);
    }
  }
}

void sub_100002638(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3 == &_xpc_error_connection_invalid) {
    goto LABEL_59;
  }
  v4 = (void *)os_transaction_create("com.apple.mobile.assertion_agent");
  xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
  id v5 = objc_autoreleasePoolPush();
  uint64_t v99 = 0LL;
  value = 0LL;
  CFDictionaryRef theDict = 0LL;
  __int32_t v6 = lockdown_copy_checkin_info(v3, &value);
  if (!v6)
  {
    Mutable = CFDictionaryCreateMutable(0LL, 1LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (!Mutable)
    {
      id v45 = sub_100003368();
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_6;
      }
      LOWORD(buf.fds_bits[0]) = 0;
      v10 = "Could not create dictionary.";
      v11 = v9;
      uint32_t v12 = 2;
      goto LABEL_5;
    }

    v13 = Mutable;
    CFDictionaryAddValue(Mutable, kLockdownCheckinConnectionInfoKey, value);
    __int32_t v15 = secure_lockdown_checkin(&v99, v13, &theDict);
    if (theDict)
    {
      uint64_t v16 = v99;
      id v17 = sub_100003368();
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      v19 = v18;
      if (!v15 && v16)
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
          sub_10000360C(&theDict, v19);
        }

        v20 = CFDictionaryGetValue(theDict, kLockdownCheckinClientNameKey);
        if (v20)
        {
          uint64_t v21 = (uint64_t)v20;
          CFTypeID v22 = CFGetTypeID(v20);
          if (v22 == CFStringGetTypeID())
          {
            uint64_t v23 = v99;
            CFTypeRef cf = 0LL;
            IOPMAssertionID AssertionID = 0;
            __int32_t v24 = lockdown_receive_message(v99, &cf);
            if (v24 || !cf || (CFTypeID v25 = CFGetTypeID(cf), v25 != CFDictionaryGetTypeID()))
            {
              id v53 = sub_100003368();
              v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
              if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
              {
                v55 = "Object was the wrong type";
                if (!cf) {
                  v55 = "Object was NULL";
                }
                buf.fds_bits[0] = 67109378;
                buf.fds_bits[1] = v24;
                LOWORD(buf.fds_bits[2]) = 2080;
                *(void *)((char *)&buf.fds_bits[2] + 2) = v55;
                v56 = "lockdown_receive_message() failed: %d (%s).";
                p_fd_set buf = (uint8_t *)&buf;
                v58 = v54;
                uint32_t v59 = 18;
                goto LABEL_64;
              }

LABEL_65:
LABEL_91:
              if (AssertionID) {
                IOPMAssertionRelease(AssertionID);
              }
              if (cf) {
                CFRelease(cf);
              }
              goto LABEL_50;
            }

            v26 = CFDictionaryGetValue((CFDictionaryRef)cf, @"CommandKey");
            v27 = v26;
            if (!v26 || (CFTypeID v28 = CFGetTypeID(v26), v28 != CFStringGetTypeID()))
            {
              sub_1000033D8(v23, @"InvalidRequest");
              id v60 = sub_100003368();
              v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
              if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
              {
                v62 = "Object was the wrong type";
                if (!v27) {
                  v62 = "Object was NULL";
                }
                buf.fds_bits[0] = 138412546;
                *(void *)&buf.fds_bits[1] = v21;
                LOWORD(buf.fds_bits[3]) = 2080;
                *(void *)((char *)&buf.fds_bits[3] + 2) = v62;
                v63 = "Incoming message from %@ is missing command. (%s)";
                v64 = (uint8_t *)&buf;
                goto LABEL_88;
              }

              goto LABEL_90;
            }

            if (CFEqual(v27, @"CommandCreateAssertion"))
            {
              memset(&buf, 0, sizeof(buf));
              memset(&v102, 0, sizeof(v102));
              v29 = CFDictionaryGetValue((CFDictionaryRef)cf, @"AssertionTypeKey");
              v30 = v29;
              if (v29 && (CFTypeID v31 = CFGetTypeID(v29), v31 == CFStringGetTypeID()))
              {
                if (!CFEqual(v30, @"AMDPowerAssertionTypeWirelessSync"))
                {
                  if (!CFEqual(v30, @"PreventUserIdleSystemSleep") && !CFEqual(v30, @"PreventSystemSleep"))
                  {
                    sub_1000033D8(v23, @"InvalidRequest");
                    id v75 = sub_100003368();
                    v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v75);
                    if (!os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT)) {
                      goto LABEL_90;
                    }
                    *(_DWORD *)v107 = 138412290;
                    *(void *)v108 = v21;
                    v63 = "ASSERTION_TYPE_KEY from %@ is not one of the recognized types.";
                    goto LABEL_97;
                  }

                  id v32 = sub_100003368();
                  v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
                  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)v107 = 138412802;
                    *(void *)v108 = v21;
                    *(_WORD *)&v108[8] = 2112;
                    v109 = (const char *)v30;
                    __int16 v110 = 2112;
                    v111 = @"PreventUserIdleSystemSleep";
                    _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "Workaround 11510010 for %@, ignoring %@ forcing %@.",  v107,  0x20u);
                  }
                }

                v34 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)cf, @"AssertionNameKey");
                v35 = v34;
                if (v34 && (CFTypeID v36 = CFGetTypeID(v34), v36 == CFStringGetTypeID()))
                {
                  v37 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)cf, @"AssertionDetailKey");
                  v38 = v37;
                  if (v37 && (CFTypeID v39 = CFGetTypeID(v37), v39 != CFStringGetTypeID()))
                  {
                    sub_1000033D8(v23, @"InvalidRequest");
                    id v74 = sub_100003368();
                    v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v74);
                    if (!os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT)) {
                      goto LABEL_90;
                    }
                    *(_DWORD *)v107 = 138412546;
                    *(void *)v108 = v21;
                    *(_WORD *)&v108[8] = 2080;
                    v109 = "Object was the wrong type";
                    v63 = "ASSERTION_DETAILS_KEY from %@ is invalid (%s).";
                  }

                  else
                  {
                    v97 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)cf, @"AssertionTimeoutKey");
                    if (v97)
                    {
                      CFTypeID v40 = CFGetTypeID(v97);
                      if (v40 == CFNumberGetTypeID())
                      {
                        if (CFNumberGetValue((CFNumberRef)v97, kCFNumberDoubleType, &valuePtr))
                        {
                          IOReturn v41 = IOPMAssertionCreateWithDescription( @"PreventUserIdleSystemSleep",  v35,  v38,  0LL,  0LL,  valuePtr,  @"TimeoutActionTurnOff",  &AssertionID);
                          id v42 = sub_100003368();
                          v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
                          v44 = v43;
                          if (v41)
                          {
                            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
                            {
                              *(_DWORD *)v107 = 138412546;
                              *(void *)v108 = v21;
                              *(_WORD *)&v108[8] = 1024;
                              LODWORD(v109) = v41;
                              _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "IOPMAssertionCreateWithDescription() for %@ failed: 0x%x.",  v107,  0x12u);
                            }

                            sub_1000033D8(v23, @"IOKitError");
                            goto LABEL_91;
                          }

                          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
                          {
                            *(_DWORD *)v107 = 138413058;
                            *(void *)v108 = @"PreventUserIdleSystemSleep";
                            *(_WORD *)&v108[8] = 2112;
                            v109 = (const char *)v35;
                            __int16 v110 = 2112;
                            v111 = v97;
                            __int16 v112 = 2112;
                            uint64_t v113 = v21;
                            _os_log_debug_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEBUG,  "Creating assertion %@ %@ %@ for %@.",  v107,  0x2Au);
                          }

                          CFMutableDictionaryRef v76 = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
                          if (v76)
                          {
                            CFMutableDictionaryRef v77 = v76;
                            int v78 = lockdown_send_message(v23, v76, 200LL);
                            if (v78)
                            {
                              int v79 = v78;
                              id v80 = sub_100003368();
                              v81 = (os_log_s *)objc_claimAutoreleasedReturnValue(v80);
                              if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
                              {
                                *(_DWORD *)v107 = 67109120;
                                *(_DWORD *)v108 = v79;
                                _os_log_impl( (void *)&_mh_execute_header,  v81,  OS_LOG_TYPE_DEFAULT,  "lockdown_send_message() failed: %d",  v107,  8u);
                              }
                            }

                            CFRelease(v77);
                          }

                          int socket = lockdown_get_socket(v23);
                          if (socket == -1)
                          {
                            id v89 = sub_100003368();
                            v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v89);
                            if (!os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT)) {
                              goto LABEL_90;
                            }
                            *(_DWORD *)v107 = 138412290;
                            *(void *)v108 = v21;
                            v63 = "lockdown_get_socket() for %@ returned -1.";
                            goto LABEL_97;
                          }

                          int v83 = socket;
                          if (__darwin_check_fd_set_overflow(socket, &buf, 0)) {
                            *(__int32_t *)((char *)buf.fds_bits + (((unint64_t)v83 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v83;
                          }
                          if (__darwin_check_fd_set_overflow(v83, &v102, 0)) {
                            *(__int32_t *)((char *)v102.fds_bits + (((unint64_t)v83 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v83;
                          }
                          v101.tv_sec = (uint64_t)valuePtr;
                          v101.tv_usec = (int)((valuePtr - (double)(uint64_t)valuePtr) / 1000.0 / 1000.0);
                          *__error() = 0;
                          int v84 = select(v83 + 1, &buf, 0LL, &v102, &v101);
                          if (v84 != 1)
                          {
                            int v85 = v84;
                            if (!v84)
                            {
                              id v93 = sub_100003368();
                              v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v93);
                              if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG)) {
                                sub_100003560(v54);
                              }
                              goto LABEL_65;
                            }

                            if (v84 == -1)
                            {
                              id v86 = sub_100003368();
                              v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v86);
                              if (!os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT)) {
                                goto LABEL_90;
                              }
                              v87 = __error();
                              v88 = strerror(*v87);
                              *(_DWORD *)v107 = 138412546;
                              *(void *)v108 = v21;
                              *(_WORD *)&v108[8] = 2080;
                              v109 = v88;
                              v63 = "select() for %@ failed: %s.";
                              goto LABEL_87;
                            }

                            id v94 = sub_100003368();
                            v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v94);
                            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
                            {
                              int v95 = *__error();
                              *(_DWORD *)v107 = 67109376;
                              *(_DWORD *)v108 = v85;
                              *(_WORD *)&v108[4] = 1024;
                              *(_DWORD *)&v108[6] = v95;
                              v56 = "select() returned unexpectedly returned %d (errno:%d).";
                              p_fd_set buf = v107;
                              v58 = v54;
                              uint32_t v59 = 14;
LABEL_64:
                              _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, v56, p_buf, v59);
                              goto LABEL_65;
                            }

                            goto LABEL_65;
                          }

                          uint64_t v90 = lockdown_recv(v23, v106, 10LL);
                          id v91 = sub_100003368();
                          v92 = (os_log_s *)objc_claimAutoreleasedReturnValue(v91);
                          v61 = v92;
                          if (!v90)
                          {
                            if (os_log_type_enabled(v92, OS_LOG_TYPE_DEBUG)) {
                              sub_1000035A0(v21, v61, v96);
                            }
                            goto LABEL_90;
                          }

                          if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)v107 = 134217984;
                            *(void *)v108 = v90;
                            v63 = "Read %ld bytes but expected none.";
LABEL_97:
                            v64 = v107;
                            goto LABEL_76;
                          }

LABEL_90:
                          goto LABEL_91;
                        }
                      }
                    }

                    sub_1000033D8(v23, @"InvalidRequest");
                    id v72 = sub_100003368();
                    v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v72);
                    if (!os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT)) {
                      goto LABEL_90;
                    }
                    v73 = "Object was the wrong type";
                    if (!v97) {
                      v73 = "Object was NULL";
                    }
                    *(_DWORD *)v107 = 138412546;
                    *(void *)v108 = v21;
                    *(_WORD *)&v108[8] = 2080;
                    v109 = v73;
                    v63 = "ASSERTION_TIMEOUT_KEY from %@ is invalid (%s).";
                  }
                }

                else
                {
                  sub_1000033D8(v23, @"InvalidRequest");
                  id v70 = sub_100003368();
                  v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v70);
                  if (!os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT)) {
                    goto LABEL_90;
                  }
                  v71 = "Object was the wrong type";
                  if (!v35) {
                    v71 = "Object was NULL";
                  }
                  *(_DWORD *)v107 = 138412546;
                  *(void *)v108 = v21;
                  *(_WORD *)&v108[8] = 2080;
                  v109 = v71;
                  v63 = "ASSERTION_NAME_KEY from %@ is invalid (%s).";
                }
              }

              else
              {
                sub_1000033D8(v23, @"InvalidRequest");
                id v65 = sub_100003368();
                v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);
                if (!os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT)) {
                  goto LABEL_90;
                }
                v66 = "Object was the wrong type";
                if (!v30) {
                  v66 = "Object was NULL";
                }
                *(_DWORD *)v107 = 138412546;
                *(void *)v108 = v21;
                *(_WORD *)&v108[8] = 2080;
                v109 = v66;
                v63 = "ASSERTION_TYPE_KEY from %@ is invalid (%s).";
              }

LABEL_87:
              v64 = v107;
LABEL_88:
              v68 = v61;
              uint32_t v69 = 22;
              goto LABEL_89;
            }

            sub_1000033D8(v23, @"InvalidRequest");
            id v67 = sub_100003368();
            v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v67);
            if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
            {
              buf.fds_bits[0] = 138412290;
              *(void *)&buf.fds_bits[1] = v21;
              v63 = "received unknown request from %@.";
              v64 = (uint8_t *)&buf;
LABEL_76:
              v68 = v61;
              uint32_t v69 = 12;
LABEL_89:
              _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, v63, v64, v69);
              goto LABEL_90;
            }

            goto LABEL_90;
          }
        }

        id v51 = sub_100003368();
        v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v52 = CFDictionaryGetValue(theDict, kLockdownCheckinPath);
          buf.fds_bits[0] = 138412290;
          *(void *)&buf.fds_bits[1] = v52;
          v47 = "Check in client name was bad at path '%@'.";
          v48 = v19;
          uint32_t v49 = 12;
          goto LABEL_48;
        }

LABEL_49:
        goto LABEL_50;
      }

      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_49;
      }
      v50 = CFDictionaryGetValue(theDict, kLockdownCheckinPath);
      buf.fds_bits[0] = 138412546;
      *(void *)&buf.fds_bits[1] = v50;
      LOWORD(buf.fds_bits[3]) = 1024;
      *(__int32_t *)((char *)&buf.fds_bits[3] + 2) = v15;
      v47 = "Unable to check in with lockdown at path '%@': %d";
      v48 = v19;
      uint32_t v49 = 18;
    }

    else
    {
      id v46 = sub_100003368();
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_49;
      }
      buf.fds_bits[0] = 67109120;
      buf.fds_bits[1] = v15;
      v47 = "Lockdown checkin did not provide connection info: %d";
      v48 = v19;
      uint32_t v49 = 8;
    }

LABEL_48:
    _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, v47, (uint8_t *)&buf, v49);
    goto LABEL_49;
  }

  __int32_t v7 = v6;
  id v8 = sub_100003368();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    buf.fds_bits[0] = 67109120;
    buf.fds_bits[1] = v7;
    v10 = "Unable to copy lockdown checkin info: %d";
    v11 = v9;
    uint32_t v12 = 8;
LABEL_5:
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&buf, v12);
  }

LABEL_6:
  v13 = 0LL;
LABEL_50:
  if (theDict) {
    CFRelease(theDict);
  }
  if (v13) {
    CFRelease(v13);
  }
  if (v99) {
    lockdown_disconnect();
  }
  if (value) {
    CFRelease(value);
  }
  objc_autoreleasePoolPop(v5);

LABEL_59:
}

id sub_100003368()
{
  if (qword_100008008 != -1) {
    dispatch_once(&qword_100008008, &stru_100004300);
  }
  return (id)qword_100008000;
}

void sub_1000033A8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobile.assertion_agent", "main");
  v2 = (void *)qword_100008000;
  qword_100008000 = (uint64_t)v1;
}

void sub_1000033D8(uint64_t a1, const void *a2)
{
  v9 = a2;
  keys = @"ErrorKey";
  if (a1)
  {
    if (a2)
    {
      CFDictionaryRef v3 = CFDictionaryCreate( kCFAllocatorDefault,  (const void **)&keys,  &v9,  1LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
      if (v3)
      {
        CFDictionaryRef v4 = v3;
        int v5 = lockdown_send_message(a1, v3, 200LL);
        if (v5)
        {
          int v6 = v5;
          id v7 = sub_100003368();
          id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)fd_set buf = 67109120;
            int v12 = v6;
            _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "lockdown_send_message() failed: %d",  buf,  8u);
          }
        }

        CFRelease(v4);
      }
    }
  }
}

void sub_1000034E8(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_1000034F4(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 136315138;
  uint64_t v4 = a1;
  sub_1000034E8((void *)&_mh_execute_header, a2, a3, "Got a '%s'. Returning", (uint8_t *)&v3);
}

void sub_100003560(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "select() timed out.", v1, 2u);
}

void sub_1000035A0(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 138412290;
  uint64_t v4 = a1;
  sub_1000034E8((void *)&_mh_execute_header, a2, a3, "Connection closed for client %@.", (uint8_t *)&v3);
}

void sub_10000360C(CFDictionaryRef *a1, os_log_s *a2)
{
  Value = CFDictionaryGetValue(*a1, kLockdownCheckinPath);
  int v5 = 138412290;
  int v6 = Value;
  sub_1000034E8((void *)&_mh_execute_header, a2, v4, "Checked in at path '%@'", (uint8_t *)&v5);
}