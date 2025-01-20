uint64_t start()
{
  os_log_t v0;
  void *v1;
  v0 = os_log_create("com.apple.streamingzip", "conduit");
  v1 = (void *)qword_10000C0F8;
  qword_10000C0F8 = (uint64_t)v0;

  lockdown_checkin_xpc("com.apple.streaming_zip_conduit", 0LL, 0LL, &stru_100008378);
  CFRunLoopRun();
  return 0LL;
}

void sub_100004464(id a1, _lockdown_connection *a2, __CFDictionary *a3)
{
  context = objc_autoreleasePoolPush();
  uint64_t v121 = 0LL;
  v122 = &v121;
  uint64_t v123 = 0x2020000000LL;
  uint64_t v124 = 0LL;
  uint64_t v115 = 0LL;
  v116 = &v115;
  uint64_t v117 = 0x3032000000LL;
  v118 = sub_100005678;
  v119 = sub_100005688;
  id v120 = 0LL;
  v5 = calloc(1uLL, 0x38uLL);
  void *v5 = a2;
  CFTypeRef v6 = CFRetain(a3);
  v5[2] = 0LL;
  v5[1] = v6;
  *((_BYTE *)v5 + 48) = 0;
  v5[5] = 0LL;
  v5[3] = 0LL;
  uint64_t v103 = mach_absolute_time();
  *(void *)buf = 0LL;
  int v7 = lockdown_receive_message(*v5, buf);
  int v8 = v7;
  v9 = *(void **)buf;
  if (v7 || !*(void *)buf)
  {
    if (v7)
    {
      v21 = (os_log_s *)qword_10000C0F8;
      if (os_log_type_enabled((os_log_t)qword_10000C0F8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)handler = 67109120;
        *(_DWORD *)&handler[4] = v8;
        _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "lockdown_receive_message returned error %x",  handler,  8u);
        v9 = *(void **)buf;
        if (!*(void *)buf) {
          goto LABEL_23;
        }
        goto LABEL_22;
      }
    }

LABEL_21:
    if (!v9) {
      goto LABEL_23;
    }
LABEL_22:
    CFRelease(v9);
    goto LABEL_23;
  }

  CFTypeID v10 = CFGetTypeID(*(CFTypeRef *)buf);
  CFTypeID TypeID = CFDictionaryGetTypeID();
  v9 = *(void **)buf;
  if (v10 != TypeID) {
    goto LABEL_21;
  }
  if (!*(void *)buf)
  {
LABEL_23:
    v22 = (os_log_s *)(id)qword_10000C0F8;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      Value = CFDictionaryGetValue(a3, kLockdownCheckinClientNameKey);
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = Value;
      _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "Failed to receive initial message from client %@",  buf,  0xCu);
    }

    sub_100005690((uint64_t)v5, (uint64_t)@"NoInitialMessage");
    v9 = 0LL;
    goto LABEL_26;
  }

  v110 = (void *)objc_claimAutoreleasedReturnValue([*(id *)buf objectForKeyedSubscript:@"MediaSubdir"]);
  if (!v110)
  {
    v27 = (os_log_s *)qword_10000C0F8;
    if (os_log_type_enabled((os_log_t)qword_10000C0F8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "Failed to get destination directory from client message",  buf,  2u);
    }

    sub_100005690((uint64_t)v5, (uint64_t)@"MalformedSetupMessage");
LABEL_26:
    v23 = 0LL;
    v24 = 0LL;
    id v20 = 0LL;
    v25 = 0LL;
    v106 = 0LL;
    v107 = 0LL;
    id v26 = 0LL;
    v15 = 0LL;
    v108 = 0LL;
    v109 = 0LL;
    v110 = 0LL;
LABEL_27:
    sub_100006238(v5);
    goto LABEL_28;
  }

  v12 = NSHomeDirectory();
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v109 = (void *)objc_claimAutoreleasedReturnValue([v13 stringByAppendingPathComponent:@"Media"]);

  uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v110, v14) & 1) == 0)
  {
    v29 = (os_log_s *)qword_10000C0F8;
    if (os_log_type_enabled((os_log_t)qword_10000C0F8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "Destination directory in client message was not a string",  buf,  2u);
    }

    sub_100005690((uint64_t)v5, (uint64_t)@"MalformedSetupMessage");
    v23 = 0LL;
    v24 = 0LL;
    id v20 = 0LL;
    v25 = 0LL;
    v106 = 0LL;
    v107 = 0LL;
    id v26 = 0LL;
    v15 = 0LL;
    v108 = 0LL;
    goto LABEL_27;
  }

  v108 = (void *)objc_claimAutoreleasedReturnValue([v109 stringByAppendingPathComponent:v110]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v108 stringByResolvingSymlinksInPath]);
  if (([v15 hasPrefix:v109] & 1) == 0)
  {
    v30 = (os_log_s *)qword_10000C0F8;
    if (os_log_type_enabled((os_log_t)qword_10000C0F8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v15;
      _os_log_error_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "Dest path specified resolved to unpermitted path: %@",  buf,  0xCu);
    }

    sub_100005690((uint64_t)v5, (uint64_t)@"InvalidPath");
    v23 = 0LL;
    v24 = 0LL;
    id v20 = 0LL;
    v25 = 0LL;
    v106 = 0LL;
    v107 = 0LL;
    goto LABEL_63;
  }

  v106 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"InstallTransferredDirectory"]);
  if (v106)
  {
    uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v106, v16) & 1) != 0)
    {
    }
  }

  v107 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"UserInitiatedTransfer"]);
  if (v107)
  {
    uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v107, v17) & 1) != 0)
    {
    }
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"SpringBoardIconLayoutData"]);
  if (!v18) {
    goto LABEL_43;
  }
  uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSData);
  if ((objc_opt_isKindOfClass(v18, v19) & 1) == 0)
  {
    v31 = (os_log_s *)qword_10000C0F8;
    if (os_log_type_enabled((os_log_t)qword_10000C0F8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "SpringBoard icon layout value was not data; ignoring",
        buf,
        2u);
    }

LABEL_43:
    id v20 = 0LL;
    goto LABEL_44;
  }

  id v20 = v18;
  v5[3] = v20;
LABEL_44:
  v24 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"InstallOptionsDictionary"]);
  if (v24)
  {
    uint64_t v32 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v24, v32) & 1) != 0)
    {
      id v33 = v24;
      v5[4] = v33;
      v34 = (void *)objc_claimAutoreleasedReturnValue([v33 objectForKeyedSubscript:@"IsUserInitiated"]);
      if (v34)
      {
        uint64_t v35 = objc_opt_class(&OBJC_CLASS___NSNumber);
        if ((objc_opt_isKindOfClass(v34, v35) & 1) != 0)
        {
        }
      }

      v36 = (void *)objc_claimAutoreleasedReturnValue([v33 objectForKeyedSubscript:@"PackageType"]);
      if ((MGGetBoolAnswer(@"InternalBuild") & 1) == 0
        && [v36 isEqualToString:@"System"])
      {
        id v99 = v34;
        v37 = (os_log_s *)qword_10000C0F8;
        if (os_log_type_enabled((os_log_t)qword_10000C0F8, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_ERROR,  "Installing system apps from the host is prohibited.",  buf,  2u);
        }

        sub_100005690((uint64_t)v5, (uint64_t)@"InstallationProhibited");

        v23 = 0LL;
        v25 = 0LL;
        goto LABEL_96;
      }
    }
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"PassThroughFileWithLength"]);
  if (v25)
  {
    uint64_t v38 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v25, v38) & 1) != 0) {
      v5[5] = [v25 longLongValue];
    }
  }

  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  [v39 removeItemAtPath:v15 error:0];

  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned int v41 = [v40 fileExistsAtPath:v15];

  if (v41)
  {
    v42 = (os_log_s *)qword_10000C0F8;
    if (os_log_type_enabled((os_log_t)qword_10000C0F8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v15;
      _os_log_error_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_ERROR,  "Item exists at destination path %@",  buf,  0xCu);
    }

    sub_100005690((uint64_t)v5, (uint64_t)@"DestinationExists");
    v23 = 0LL;
LABEL_63:
    id v26 = 0LL;
    goto LABEL_27;
  }

  if (v25)
  {
    id v99 = objc_claimAutoreleasedReturnValue([v15 stringByDeletingLastPathComponent]);
    int v43 = mkpath_np((const char *)[v99 fileSystemRepresentation], 0x1EDu);
    int v44 = v43;
    if (v43 && v43 != 17)
    {
      v62 = (os_log_s *)(id)qword_10000C0F8;
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
        v77 = strerror(v44);
        *(_DWORD *)buf = 138412802;
        *(void *)&buf[4] = v15;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v99;
        *(_WORD *)&buf[22] = 2080;
        *(void *)&buf[24] = v77;
        _os_log_error_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_ERROR,  "Failed to make parent directory of %@ at %@: %s",  buf,  0x20u);
      }

      if (v44 == 28) {
        v63 = @"NoSpace";
      }
      else {
        v63 = @"SetupFailed";
      }
      sub_100005690((uint64_t)v5, (uint64_t)v63);
    }

    else
    {
      id v45 = v15;
      int v46 = open_dprotected_np((const char *)[v45 fileSystemRepresentation], 2818, 4, 0, 420);
      if ((v46 & 0x80000000) == 0)
      {
        int v97 = v46;
        v23 = 0LL;
        id v26 = 0LL;

        goto LABEL_69;
      }

      v64 = (os_log_s *)(id)qword_10000C0F8;
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      {
        v78 = __error();
        v79 = strerror(*v78);
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v45;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = v79;
        _os_log_error_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_ERROR,  "Failed to open pass through file at %@ : %s",  buf,  0x16u);
      }

      sub_100005690((uint64_t)v5, (uint64_t)@"SetupFailed");
    }

    v23 = 0LL;
LABEL_96:
    id v26 = 0LL;

    goto LABEL_27;
  }

  id v101 = v15;
  int v52 = mkpath_np((const char *)[v101 fileSystemRepresentation], 0x1EDu);
  int v53 = v52;
  if (v52 != 17)
  {
    if (v52)
    {
      v65 = (os_log_s *)(id)qword_10000C0F8;
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      {
        v80 = strerror(v53);
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v101;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = v80;
        _os_log_error_impl( (void *)&_mh_execute_header,  v65,  OS_LOG_TYPE_ERROR,  "Failed to create dest path %@ : %s",  buf,  0x16u);
      }

      if (v53 == 28) {
        v66 = @"NoSpace";
      }
      else {
        v66 = @"InvalidPath";
      }
      goto LABEL_114;
    }

    id v98 = v101;
    int v54 = open((const char *)[v98 fileSystemRepresentation], 1048832);
    int v55 = v54;
    if (v54 < 0)
    {
      v75 = (void *)qword_10000C0F8;
      if (os_log_type_enabled((os_log_t)qword_10000C0F8, OS_LOG_TYPE_ERROR))
      {
        id v85 = v98;
        v86 = v75;
        id v87 = [v85 fileSystemRepresentation];
        v88 = __error();
        v89 = strerror(*v88);
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = v87;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = v89;
        _os_log_error_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_ERROR, "Failed to open %s : %s", buf, 0x16u);
      }
    }

    else
    {
      int v96 = fcntl(v54, 64, 4LL);
      if (v96)
      {
        v56 = (void *)qword_10000C0F8;
        if (os_log_type_enabled((os_log_t)qword_10000C0F8, OS_LOG_TYPE_ERROR))
        {
          id v93 = v98;
          v82 = v56;
          id v94 = [v93 fileSystemRepresentation];
          v83 = __error();
          v84 = strerror(*v83);
          *(_DWORD *)buf = 136315650;
          *(void *)&buf[4] = v94;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 4;
          *(_WORD *)&buf[18] = 2080;
          *(void *)&buf[20] = v84;
          _os_log_error_impl( (void *)&_mh_execute_header,  v82,  OS_LOG_TYPE_ERROR,  "Failed to set protection class on %s to %d: %s",  buf,  0x1Cu);
        }
      }

      close(v55);

      if (!v96) {
        goto LABEL_81;
      }
    }

    v73 = (os_log_s *)qword_10000C0F8;
    if (os_log_type_enabled((os_log_t)qword_10000C0F8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v74 = "Failed to set protection class";
      goto LABEL_122;
    }

LABEL_113:
    v66 = @"SetupFailed";
LABEL_114:
    sub_100005690((uint64_t)v5, (uint64_t)v66);
    v23 = 0LL;
    v25 = 0LL;
    id v26 = 0LL;
    v15 = v101;
    goto LABEL_27;
  }

LABEL_81:
  id v57 = objc_alloc(&OBJC_CLASS___SZExtractor);
  uint64_t v128 = SZExtractorOptionsDenyInvalidSymlinks;
  v129 = &__kCFBooleanTrue;
  v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v129,  &v128,  1LL));
  id v26 = [v57 initWithPath:v101 options:v58];

  if (!v26)
  {
    v73 = (os_log_s *)qword_10000C0F8;
    if (os_log_type_enabled((os_log_t)qword_10000C0F8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v74 = "Failed to set up extractor";
LABEL_122:
      _os_log_error_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_ERROR, v74, buf, 2u);
      goto LABEL_113;
    }

    goto LABEL_113;
  }

  v111[0] = _NSConcreteStackBlock;
  v111[1] = 3221225472LL;
  v111[2] = sub_100005778;
  v111[3] = &unk_1000083A0;
  v113 = &v115;
  v114 = &v121;
  v23 = dispatch_semaphore_create(0LL);
  v112 = v23;
  [v26 prepareForExtraction:v111];
  dispatch_semaphore_wait(v23, 0xFFFFFFFFFFFFFFFFLL);
  if (v116[5])
  {
    uint64_t v59 = v116[5];
    v60 = (os_log_s *)qword_10000C0F8;
    if (os_log_type_enabled((os_log_t)qword_10000C0F8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v59;
      _os_log_error_impl( (void *)&_mh_execute_header,  v60,  OS_LOG_TYPE_ERROR,  "-prepareForExtraction returned error %@",  buf,  0xCu);
    }

    v61 = @"SetupFailed";
LABEL_119:
    sub_100005690((uint64_t)v5, (uint64_t)v61);
    v25 = 0LL;

    goto LABEL_27;
  }

  if (v122[3])
  {
    v76 = (os_log_s *)qword_10000C0F8;
    if (os_log_type_enabled((os_log_t)qword_10000C0F8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v101;
      _os_log_error_impl( (void *)&_mh_execute_header,  v76,  OS_LOG_TYPE_ERROR,  "Item exists at destination path %@",  buf,  0xCu);
    }

    v61 = @"DestinationExists";
    goto LABEL_119;
  }

  int v97 = -1;

LABEL_69:
  unsigned int socket = lockdown_get_socket(a2);
  if ((socket & 0x80000000) != 0)
  {
    v67 = (os_log_s *)(id)qword_10000C0F8;
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
    {
      v81 = CFDictionaryGetValue(a3, kLockdownCheckinClientNameKey);
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v81;
      _os_log_error_impl( (void *)&_mh_execute_header,  v67,  OS_LOG_TYPE_ERROR,  "Failed to get socket for connection from client %@",  buf,  0xCu);
    }

    sub_100005690((uint64_t)v5, (uint64_t)@"NoSocket");
    goto LABEL_27;
  }

  id v100 = v26;
  dispatch_semaphore_t v48 = dispatch_semaphore_create(0LL);
  v49 = valloc(0x100000uLL);
  v126[0] = 0LL;
  v126[1] = v126;
  v126[2] = 0x3032000000LL;
  v126[3] = sub_100005678;
  v126[4] = sub_100005688;
  id v127 = 0LL;
  v125[0] = 0LL;
  v125[1] = v125;
  v125[2] = 0x2020000000LL;
  v125[3] = 0LL;
  v91 = (void *)os_transaction_create("com.apple.streaming_zip_conduit.client_socket");
  dispatch_semaphore_t v92 = v48;
  v95 = v49;
  if (*((_BYTE *)v5 + 49))
  {
    v50 = (os_log_s *)qword_10000C0F8;
    if (os_log_type_enabled((os_log_t)qword_10000C0F8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_DEBUG,  "Receiving transfer as QOS_CLASS_USER_INITIATED",  buf,  2u);
    }

    uint64_t v51 = 25LL;
  }

  else
  {
    uint64_t v51 = 9LL;
  }

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(v51, 0LL);
  v90 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v69 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, socket, 0LL, v90);
  *(void *)buf = _NSConcreteStackBlock;
  *(void *)&buf[8] = 3221225472LL;
  *(void *)&buf[16] = sub_1000057E4;
  *(void *)&buf[24] = &unk_100008460;
  uint64_t v149 = v103;
  v147 = v125;
  int v152 = v97;
  id v104 = v100;
  id v144 = v104;
  v148 = v126;
  v70 = v92;
  v150 = v5;
  v151 = v95;
  v145 = v70;
  id v146 = v91;
  id v102 = v91;
  dispatch_source_set_cancel_handler(v69, buf);
  *(void *)handler = _NSConcreteStackBlock;
  uint64_t v131 = 3221225472LL;
  v132 = sub_100005E00;
  v133 = &unk_100008460;
  v140 = v95;
  uint64_t v141 = 0x100000LL;
  int v142 = v97;
  v134 = v69;
  id v135 = v104;
  v136 = v70;
  v138 = v126;
  v139 = v5;
  v137 = v125;
  v71 = v69;
  id v26 = v104;
  v72 = v70;
  dispatch_source_set_event_handler(v71, handler);
  dispatch_resume(v71);

  _Block_object_dispose(v125, 8);
  _Block_object_dispose(v126, 8);

LABEL_28:
  _Block_object_dispose(&v115, 8);

  _Block_object_dispose(&v121, 8);
  objc_autoreleasePoolPop(context);
}

void sub_1000055F8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, char a37)
{
}

uint64_t sub_100005678(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100005688(uint64_t a1)
{
}

void sub_100005690(uint64_t a1, uint64_t a2)
{
  if (!*(_BYTE *)(a1 + 48))
  {
    uint64_t v2 = a1;
    *(_BYTE *)(a1 + 48) = 1;
    CFTypeRef v6 = @"Error";
    uint64_t v7 = a2;
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));
    LOBYTE(v2) = sub_100006834(v2, v3);

    if ((v2 & 1) == 0)
    {
      v4 = (os_log_s *)qword_10000C0F8;
      if (os_log_type_enabled((os_log_t)qword_10000C0F8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v5 = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "Could not send error response to host",  v5,  2u);
      }
    }
  }
}

void sub_100005778(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a3);
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000057E4(uint64_t a1)
{
  uint64_t v2 = mach_absolute_time();
  mach_timebase_info(&info);
  v3 = (os_log_s *)qword_10000C0F8;
  if (os_log_type_enabled((os_log_t)qword_10000C0F8, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v21 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);
    LODWORD(v4) = info.numer;
    LODWORD(v5) = info.denom;
    double v22 = (double)v4 / (double)v5 * (double)(v2 - *(void *)(a1 + 72)) / 1000000000.0;
    *(_DWORD *)buf = 134218496;
    CFIndex v57 = v21;
    __int16 v58 = 2048;
    double v59 = v22;
    __int16 v60 = 2048;
    double v61 = (double)(v21 >> 20) / v22;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "Transferred %llu archived bytes in %.3f seconds (%.3f MB/sec)",  buf,  0x20u);
  }

  int v6 = *(_DWORD *)(a1 + 96);
  if ((v6 & 0x80000000) == 0) {
    close(v6);
  }
  uint64_t v7 = *(void **)(a1 + 32);
  if (v7)
  {
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472LL;
    v50[2] = sub_1000063EC;
    v50[3] = &unk_1000083C8;
    uint64_t v52 = *(void *)(a1 + 64);
    id v51 = *(id *)(a1 + 40);
    [v7 finishStreamWithCompletionBlock:v50];
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 40), 0xFFFFFFFFFFFFFFFFLL);
  }

  int v8 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 domain]);
    if ([v9 isEqualToString:NSPOSIXErrorDomain])
    {
      id v10 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) code];

      if (v10 == (id)28)
      {
        v11 = @"NoSpace";
LABEL_16:
        uint64_t v15 = *(void *)(a1 + 80);
        goto LABEL_17;
      }
    }

    else
    {
    }

    v11 = @"ExtractionFailed";
    goto LABEL_16;
  }

  uint64_t v12 = *(void *)(a1 + 80);
  if (!*(void *)(v12 + 16))
  {
    sub_10000674C(v12);
    goto LABEL_18;
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  unsigned int v14 = [v13 effectiveBoolValueForSetting:MCFeatureAppInstallationAllowed];

  if (v14 == 2)
  {
    uint64_t v15 = *(void *)(a1 + 80);
    v11 = @"InstallationProhibited";
LABEL_17:
    sub_100005690(v15, (uint64_t)v11);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    [v16 removeItemAtPath:*(void *)(*(void *)(a1 + 80) + 16) error:0];

    goto LABEL_18;
  }

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[TVSCacheDelete sharedInstance](&OBJC_CLASS___TVSCacheDelete, "sharedInstance"));
  id v18 = [v17 synchronouslyFetchApplicationsState];

  if (v18 == (id)2)
  {
    uint64_t v19 = qword_10000C0F8;
    if (os_log_type_enabled((os_log_t)qword_10000C0F8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      id v20 = "Disallowing app installation becuase TVSCacheDelete says there's no more space.";
      goto LABEL_27;
    }

LABEL_38:
    uint64_t v15 = *(void *)(a1 + 80);
    v11 = @"AppQuotaExceeded";
    goto LABEL_17;
  }

  if (v18 != (id)1)
  {
    if (v18)
    {
      uint64_t v42 = qword_10000C0F8;
      if (os_log_type_enabled((os_log_t)qword_10000C0F8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        CFIndex v57 = (CFIndex)v18;
        id v20 = "TVSCacheDelete returned unknown state %ld";
        v23 = (os_log_s *)v42;
        uint32_t v24 = 12;
        goto LABEL_40;
      }
    }

    else
    {
      uint64_t v19 = qword_10000C0F8;
      if (os_log_type_enabled((os_log_t)qword_10000C0F8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        id v20 = "TVSCacheDelete returned TVSCacheDeleteUnknownApplicationsState; disallowing installations.";
LABEL_27:
        v23 = (os_log_s *)v19;
        uint32_t v24 = 2;
LABEL_40:
        _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, v20, buf, v24);
        goto LABEL_38;
      }
    }

    goto LABEL_38;
  }

  v25 = *(const __CFData **)(*(void *)(a1 + 80) + 24LL);
  if (v25)
  {
    id v26 = (void *)qword_10000C0F8;
    if (os_log_type_enabled((os_log_t)qword_10000C0F8, OS_LOG_TYPE_DEBUG))
    {
      int v43 = v26;
      CFIndex Length = CFDataGetLength(v25);
      *(_DWORD *)buf = 134217984;
      CFIndex v57 = Length;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEBUG,  "Sending icon state with length %ld",  buf,  0xCu);
    }

    uint64_t v27 = SBSSpringBoardBlockableServerPort();
    BytePtr = CFDataGetBytePtr(*(CFDataRef *)(*(void *)(a1 + 80) + 24LL));
    CFIndex v29 = CFDataGetLength(*(CFDataRef *)(*(void *)(a1 + 80) + 24LL));
    int v30 = SBSetIconState(v27, BytePtr, v29);
    if (v30)
    {
      int v31 = v30;
      uint64_t v32 = (os_log_s *)qword_10000C0F8;
      if (os_log_type_enabled((os_log_t)qword_10000C0F8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v57) = v31;
        _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "SBSetIconState returned 0x%x", buf, 8u);
      }
    }
  }

  id v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  *(void *)(*(void *)(a1 + 80) + 16LL)));
  id v34 = *(id *)(*(void *)(a1 + 80) + 32LL);
  if (!v34)
  {
    uint64_t v54 = LSPackageTypeKey;
    uint64_t v55 = LSPackageTypeCustomer;
    id v34 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v55,  &v54,  1LL));
  }

  id v35 = [v34 mutableCopy];
  [v35 setObject:&__kCFBooleanTrue forKeyedSubscript:@"AllowInstallLocalProvisioned"];
  dispatch_semaphore_t v36 = dispatch_semaphore_create(0LL);
  id v37 = [[MIInstallOptions alloc] initWithLegacyOptionsDictionary:v35];
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472LL;
  v49[2] = sub_1000064C4;
  v49[3] = &unk_1000083E8;
  v49[4] = *(void *)(a1 + 80);
  uint64_t v38 = objc_retainBlock(v49);
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472LL;
  v45[2] = sub_1000065B4;
  v45[3] = &unk_100008410;
  uint64_t v39 = *(void *)(a1 + 80);
  dispatch_semaphore_t v47 = v36;
  uint64_t v48 = v39;
  id v46 = v33;
  v40 = v36;
  id v41 = v33;
  +[IXAppInstallCoordinator installApplication:consumeSource:options:legacyProgressBlock:completion:]( &OBJC_CLASS___IXAppInstallCoordinator,  "installApplication:consumeSource:options:legacyProgressBlock:completion:",  v41,  1LL,  v37,  v38,  v45);
  dispatch_semaphore_wait(v40, 0xFFFFFFFFFFFFFFFFLL);

LABEL_18:
  sub_100006238(*(uint64_t **)(a1 + 80));
  free(*(void **)(a1 + 88));
}

void sub_100005E00(uint64_t a1)
{
  uint64_t v2 = lockdown_recv(**(void **)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88));
  uint64_t v3 = v2;
  if (v2 < 0)
  {
    v9 = (void *)qword_10000C0F8;
    if (os_log_type_enabled((os_log_t)qword_10000C0F8, OS_LOG_TYPE_ERROR))
    {
      id v10 = v9;
      v11 = __error();
      uint64_t v12 = strerror(*v11);
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = v3;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = v12;
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "lockdown_recv returned %zd and error %s",  buf,  0x16u);
    }

    goto LABEL_14;
  }

  if (!v2)
  {
    v13 = (os_log_s *)qword_10000C0F8;
    if (os_log_type_enabled((os_log_t)qword_10000C0F8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "lockdown_recv returned 0; canceling",
        buf,
        2u);
    }

    goto LABEL_14;
  }

  *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) += v2;
  unint64_t v4 = (os_log_s *)qword_10000C0F8;
  if (os_log_type_enabled((os_log_t)qword_10000C0F8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = v3;
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "lockdown_recv returned %zd", buf, 0xCu);
  }

  int v5 = *(_DWORD *)(a1 + 96);
  if (v5 < 0 || *(void *)(a1 + 40))
  {
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000LL;
    LOBYTE(v36) = 0;
    int v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  *(void *)(a1 + 80),  v3,  0LL));
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_1000062F8;
    v31[3] = &unk_100008438;
    uint64_t v7 = *(void *)(a1 + 64);
    id v33 = buf;
    uint64_t v34 = v7;
    int v8 = *(void **)(a1 + 40);
    id v32 = *(id *)(a1 + 48);
    [v8 supplyBytes:v6 withCompletionBlock:v31];
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 48), 0xFFFFFFFFFFFFFFFFLL);
    if (*(_BYTE *)(*(void *)&buf[8] + 24LL)) {
      dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
    }

    _Block_object_dispose(buf, 8);
    return;
  }

  uint64_t v14 = *(void *)(a1 + 72);
  uint64_t v15 = *(void *)(v14 + 40);
  uint64_t v16 = v15 - v3;
  if (v15 < v3)
  {
    uint64_t v17 = (os_log_s *)qword_10000C0F8;
    if (os_log_type_enabled((os_log_t)qword_10000C0F8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      *(void *)&uint8_t buf[4] = v3;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v15;
      _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "Received %ld bytes but only %lld bytes remain!",  buf,  0x16u);
    }

    uint64_t v18 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  5LL,  0LL));
    uint64_t v19 = *(void *)(*(void *)(a1 + 64) + 8LL);
    id v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;

LABEL_14:
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
    return;
  }

  uint64_t v21 = 0LL;
  *(void *)(v14 + 40) = v16;
  uint64_t v22 = *(void *)(a1 + 80);
  while (v3 != v21)
  {
    ssize_t v23 = write(v5, (const void *)(v22 + v21), v3 - v21);
    v21 += v23;
    if (v23 < 0)
    {
      if (v3 != -1)
      {
        uint64_t v24 = *__error();
        v25 = (void *)qword_10000C0F8;
        if (os_log_type_enabled((os_log_t)qword_10000C0F8, OS_LOG_TYPE_ERROR))
        {
          CFIndex v29 = v25;
          int v30 = strerror(v24);
          *(_DWORD *)buf = 134218498;
          *(void *)&uint8_t buf[4] = v3;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = -1LL;
          *(_WORD *)&buf[22] = 2080;
          dispatch_semaphore_t v36 = v30;
          _os_log_error_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "Failed to write %ld bytes to passthrough file: write returned %ld : %s",  buf,  0x20u);
        }

        uint64_t v26 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v24,  0LL));
        uint64_t v27 = *(void *)(*(void *)(a1 + 64) + 8LL);
        v28 = *(void **)(v27 + 40);
        *(void *)(v27 + 40) = v26;

        dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
      }

      break;
    }
  }

void sub_100006218( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100006238(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if (*a1)
  {
    dispatch_time_t v3 = dispatch_time(0LL, 5000000000LL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000062F0;
    block[3] = &unk_100008480;
    block[4] = v2;
    dispatch_after(v3, &_dispatch_main_q, block);
  }

  unint64_t v4 = (const void *)a1[1];
  if (v4) {
    CFRelease(v4);
  }
  int v5 = (const void *)a1[2];
  if (v5) {
    CFRelease(v5);
  }
  int v6 = (const void *)a1[3];
  if (v6) {
    CFRelease(v6);
  }
  uint64_t v7 = (const void *)a1[4];
  if (v7) {
    CFRelease(v7);
  }
  free(a1);
}

uint64_t sub_1000062F0(uint64_t a1)
{
  return lockdown_disconnect(*(void *)(a1 + 32));
}

void sub_1000062F8(uint64_t a1, void *a2, int a3)
{
  id v6 = a2;
  uint64_t v7 = v6;
  if (v6 || a3)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
    if (v6)
    {
      int v8 = (os_log_s *)qword_10000C0F8;
      if (os_log_type_enabled((os_log_t)qword_10000C0F8, OS_LOG_TYPE_ERROR))
      {
        int v9 = 138412290;
        id v10 = v7;
        _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "Stream extractor got error: %@",  (uint8_t *)&v9,  0xCu);
      }

      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), a2);
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000063EC(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    int v5 = (os_log_s *)qword_10000C0F8;
    if (os_log_type_enabled((os_log_t)qword_10000C0F8, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "Failed to finish extraction: %@",  (uint8_t *)&v6,  0xCu);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000064C4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  int v8 = @"InstallProgressDict";
  id v9 = v3;
  int v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));
  LOBYTE(v4) = sub_100006834(v4, v5);

  if ((v4 & 1) == 0)
  {
    int v6 = (os_log_s *)qword_10000C0F8;
    if (os_log_type_enabled((os_log_t)qword_10000C0F8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v7 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed to send install progress", v7, 2u);
    }
  }
}

void sub_1000065B4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = (void *)qword_10000C0F8;
    if (os_log_type_enabled((os_log_t)qword_10000C0F8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void **)(a1 + 32);
      v13 = v7;
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 path]);
      int v15 = 138412546;
      uint64_t v16 = v14;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Failed to install application at %@ : %@",  (uint8_t *)&v15,  0x16u);
    }

    int v8 = (void *)objc_claimAutoreleasedReturnValue([v6 domain]);
    if ([v8 isEqualToString:IXUserPresentableErrorDomain])
    {
      id v9 = [v6 code];

      if (v9 == (id)11)
      {
        id v10 = @"NoSpace";
LABEL_10:
        sub_100005690(*(void *)(a1 + 48), (uint64_t)v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        [v11 removeItemAtPath:*(void *)(*(void *)(a1 + 48) + 16) error:0];

        goto LABEL_11;
      }
    }

    else
    {
    }

    id v10 = @"InstallationFailed";
    goto LABEL_10;
  }

  sub_10000674C(*(void *)(a1 + 48));
LABEL_11:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_10000674C(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 48))
  {
    uint64_t v1 = a1;
    id v5 = @"Status";
    id v6 = @"DataComplete";
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));
    LOBYTE(v1) = sub_100006834(v1, v2);

    if ((v1 & 1) == 0)
    {
      id v3 = (os_log_s *)qword_10000C0F8;
      if (os_log_type_enabled((os_log_t)qword_10000C0F8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v4 = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "Could not send error response to host",  v4,  2u);
      }
    }
  }

uint64_t sub_100006834(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    int v4 = lockdown_send_message(*(void *)a1, v3, 200LL);
    if (v4)
    {
      int v5 = v4;
      id v6 = (os_log_s *)qword_10000C0F8;
      if (os_log_type_enabled((os_log_t)qword_10000C0F8, OS_LOG_TYPE_ERROR))
      {
        v8[0] = 67109120;
        v8[1] = v5;
        _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "Got error %x from lockdown_send_message",  (uint8_t *)v8,  8u);
      }

      a1 = 0LL;
    }

    else
    {
      a1 = 1LL;
    }
  }

  return a1;
}

id objc_msgSend_synchronouslyFetchApplicationsState(void *a1, const char *a2, ...)
{
  return [a1 synchronouslyFetchApplicationsState];
}