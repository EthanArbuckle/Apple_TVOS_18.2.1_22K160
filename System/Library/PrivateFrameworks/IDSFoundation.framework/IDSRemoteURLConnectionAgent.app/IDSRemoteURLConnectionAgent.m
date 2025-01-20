void sub_100004964(id a1)
{
  IDSRemoteURLConnectionDaemon *v1;
  void *v2;
  v1 = objc_alloc_init(&OBJC_CLASS___IDSRemoteURLConnectionDaemon);
  v2 = (void *)qword_100015968;
  qword_100015968 = (uint64_t)v1;
}

void sub_100004EC4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v5 = OSLogHandleForIDSCategory("IDSRemoteURLConnectionDaemon");
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Application state changed: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled()
      && _IDSShouldLog(2LL, @"IDSRemoteURLConnectionDaemon"))
    {
      id v13 = v3;
      _IDSLogV( 2LL,  @"IDSFoundation",  @"IDSRemoteURLConnectionDaemon",  @"Application state changed: %@");
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", BKSApplicationStateProcessIDKey, v13));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:BKSApplicationStateKey]);
    v9 = v8;
    if (v7 && v8 && [v8 intValue] == 2)
    {
      uint64_t v10 = OSLogHandleForIDSCategory("IDSRemoteURLConnectionDaemon");
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v12 = [v7 intValue];
        *(_DWORD *)buf = 67109120;
        LODWORD(v16) = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, " => Pid %d suspended!", buf, 8u);
      }

      if (os_log_shim_legacy_logging_enabled()
        && _IDSShouldLog(0LL, @"IDSRemoteURLConnectionDaemon"))
      {
        id v14 = [v7 intValue];
        _IDSLogV(0LL, @"IDSFoundation", @"IDSRemoteURLConnectionDaemon", @" => Pid %d suspended!");
      }

      objc_msgSend(WeakRetained, "_pidSuspended:", objc_msgSend(v7, "intValue", v14));
    }
  }
}

void sub_1000057D4(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 8) allKeys]);
  id v3 = [v2 count];

  if (!v3)
  {
    uint64_t v4 = OSLogHandleForIDSCategory("IDSRemoteURLConnectionDaemon");
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Idle exiting, we're done here", v7, 2u);
    }

    if (os_log_shim_legacy_logging_enabled(v6))
    {
      if (_IDSShouldLog(0LL, @"IDSRemoteURLConnectionDaemon")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSRemoteURLConnectionDaemon",  @"Idle exiting, we're done here");
      }
    }

    [*(id *)(a1 + 32) _terminate];
  }
}

void sub_100005A8C(id a1)
{
  int v2 = 368885834;
  __int128 v1 = xmmword_10000C3B8;
  byte_100015970 = MGIsDeviceOneOfType(&v1);
}

void sub_100005EDC(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[IDSRemoteURLConnectionDaemon sharedInstance]( &OBJC_CLASS___IDSRemoteURLConnectionDaemon,  "sharedInstance"));
  [v2 removeURLLoaderForUniqueID:*(void *)(*(void *)(a1 + 32) + 48)];
}

void sub_1000061D0(id a1)
{
  __int128 v1 = objc_alloc_init(&OBJC_CLASS___IDSRemoteURLConnectionDaemonMIGInterface);
  id v2 = (void *)qword_100015988;
  qword_100015988 = (uint64_t)v1;
}

uint64_t sub_100006478(uint64_t result)
{
  if (!*(_BYTE *)(*(void *)(result + 32) + 16LL))
  {
    _IMWarn(@"IDSRemoteURLConnectionDaemonMIGInterface auth port died: %@");
    exit(-1);
  }

  return result;
}

void sub_1000064B4(id a1, OS_xpc_object *a2, OS_xpc_object *a3)
{
  uint64_t v4 = a2;
  uint64_t v5 = a3;
  uint64_t v6 = OSLogHandleForIDSCategory("RemoteLoading");
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Incoming peer auth grant request", buf, 2u);
  }

  v9 = v4;
  uint64_t v10 = v5;
  xpc_type_t type = xpc_get_type(v10);
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (v10 == (OS_xpc_object *)&_xpc_error_connection_invalid)
    {
      uint64_t v87 = OSLogHandleForIDSCategory("RemoteLoading");
      v88 = (os_log_s *)objc_claimAutoreleasedReturnValue(v87);
      if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
      {
        pid_t pid = xpc_connection_get_pid(v9);
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = pid;
        _os_log_impl( (void *)&_mh_execute_header,  v88,  OS_LOG_TYPE_DEFAULT,  "peer(%d) received XPC_ERROR_CONNECTION_INVALID",  buf,  8u);
      }

      if (os_log_shim_legacy_logging_enabled(v90)
        && _IDSShouldLog(0LL, @"RemoteLoading"))
      {
        xpc_connection_get_pid(v9);
        _IDSLogV( 0LL,  @"IDSFoundation",  @"RemoteLoading",  @"peer(%d) received XPC_ERROR_CONNECTION_INVALID");
      }
    }

    else if (v10 == (OS_xpc_object *)&_xpc_error_connection_interrupted)
    {
      uint64_t v91 = OSLogHandleForIDSCategory("RemoteLoading");
      v92 = (os_log_s *)objc_claimAutoreleasedReturnValue(v91);
      if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
      {
        pid_t v93 = xpc_connection_get_pid(v9);
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v93;
        _os_log_impl( (void *)&_mh_execute_header,  v92,  OS_LOG_TYPE_DEFAULT,  "peer(%d) received XPC_ERROR_CONNECTION_INTERRUPTED",  buf,  8u);
      }

      if (os_log_shim_legacy_logging_enabled(v94)
        && _IDSShouldLog(0LL, @"RemoteLoading"))
      {
        xpc_connection_get_pid(v9);
        _IDSLogV( 0LL,  @"IDSFoundation",  @"RemoteLoading",  @"peer(%d) received XPC_ERROR_CONNECTION_INTERRUPTED");
      }
    }

    else if (v10 == (OS_xpc_object *)&_xpc_error_termination_imminent)
    {
      uint64_t v72 = OSLogHandleForIDSCategory("RemoteLoading");
      v73 = (os_log_s *)objc_claimAutoreleasedReturnValue(v72);
      if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
      {
        pid_t v74 = xpc_connection_get_pid(v9);
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v74;
        _os_log_impl( (void *)&_mh_execute_header,  v73,  OS_LOG_TYPE_DEFAULT,  "peer(%d) received XPC_ERROR_TERMINATION_IMMINENT",  buf,  8u);
      }

      if (os_log_shim_legacy_logging_enabled(v75)
        && _IDSShouldLog(0LL, @"RemoteLoading"))
      {
        xpc_connection_get_pid(v9);
        _IDSLogV( 0LL,  @"IDSFoundation",  @"RemoteLoading",  @"peer(%d) received XPC_ERROR_TERMINATION_IMMINENT");
      }
    }
  }

  else
  {
    *(void *)&__int128 v12 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&buf[16] = v12;
    *(_OWORD *)buf = v12;
    xpc_connection_get_audit_token(v9, buf);
    uint64_t v13 = kIDSRemoteURLConnectionEntitlement;
    if ((IMDAuditTokenTaskHasEntitlement(buf, kIDSRemoteURLConnectionEntitlement) & 1) != 0
      || (*(void *)&__int128 v14 = 0xAAAAAAAAAAAAAAAALL,
          *((void *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL,
          *(_OWORD *)&buf[16] = v14,
          *(_OWORD *)buf = v14,
          xpc_connection_get_audit_token(v9, buf),
          (IMDAuditTokenTaskHasEntitlement(buf, @"com.apple.private.imcore.imremoteurlconnection") & 1) != 0))
    {
      if (type != (xpc_type_t)&_xpc_type_dictionary) {
        sub_10000AF8C();
      }
      v15 = v10;
      id v16 = xpc_copy_description(v15);
      uint64_t v17 = OSLogHandleForIDSCategory("RemoteLoading");
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        pid_t v19 = xpc_connection_get_pid(v9);
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&uint8_t buf[4] = v19;
        *(_WORD *)&buf[8] = 2080;
        *(void *)&buf[10] = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "received message from peer(%d): %s",  buf,  0x12u);
      }

      if (os_log_shim_legacy_logging_enabled(v20)
        && _IDSShouldLog(0LL, @"RemoteLoading"))
      {
        xpc_connection_get_pid(v9);
        _IDSLogV(0LL, @"IDSFoundation", @"RemoteLoading", @"received message from peer(%d): %s");
      }

      free(v16);
      uint64_t v21 = kIMURLConnectionXPCRequestKey;
      uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSURLRequest);
      uint64_t v23 = IMGetXPCKeyedCodableFromDictionaryWithSecureCoding(v15, v21, v22);
      v103 = (void *)objc_claimAutoreleasedReturnValue(v23);
      int v24 = IMGetXPCBoolFromDictionary(v15, kIMURLConnectionXPCTryForceCellularKey);
      int v25 = IMGetXPCBoolFromDictionary(v15, kIMURLConnectionXPCRequireIDSHostKey);
      int v102 = IMGetXPCBoolFromDictionary(v15, kIMURLConnectionXPCShouldUsePipeliningKey);
      int v101 = IMGetXPCIntFromDictionary(v15, kIMURLConnectionXPCConcurrentConnectionsKey);
      int v100 = IMGetXPCBoolFromDictionary(v15, kIMURLConnectionXPCDisableKeepAliveKey);
      uint64_t v99 = IMGetXPCIntFromDictionary(v15, kIMURLConnectionXPCKeepAliveWifiKey);
      uint64_t v26 = IMGetXPCIntFromDictionary(v15, kIMURLConnectionXPCKeepAliveCellKey);
      char v98 = IMGetXPCBoolFromDictionary(v15, kIMURLConnectionXPCReturnTimingDataKey);
      uint64_t v27 = IMGetXPCStringFromDictionary(v15, "dataUsageBundleIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      uint64_t v29 = OSLogHandleForIDSCategory("RemoteLoading");
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v103;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Decoded URL request: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled(v31)
        && _IDSShouldLog(0LL, @"RemoteLoading"))
      {
        _IDSLogV(0LL, @"IDSFoundation", @"RemoteLoading", @"Decoded URL request: %@");
      }

      uint64_t v32 = OSLogHandleForIDSCategory("RemoteLoading");
      v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        v34 = @"NO";
        if (v24) {
          v34 = @"YES";
        }
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v34;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, " Try force cell: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled(v35)
        && _IDSShouldLog(0LL, @"RemoteLoading"))
      {
        _IDSLogV(0LL, @"IDSFoundation", @"RemoteLoading", @" Try force cell: %@");
      }

      uint64_t v36 = OSLogHandleForIDSCategory("RemoteLoading");
      v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        v38 = @"NO";
        if (v25) {
          v38 = @"YES";
        }
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v38;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, " requireIDSHost: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled(v39)
        && _IDSShouldLog(0LL, @"RemoteLoading"))
      {
        _IDSLogV(0LL, @"IDSFoundation", @"RemoteLoading", @" requireIDSHost: %@");
      }

      uint64_t v40 = OSLogHandleForIDSCategory("RemoteLoading");
      v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v28;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, " data usage identifier: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled(v42)
        && _IDSShouldLog(0LL, @"RemoteLoading"))
      {
        _IDSLogV(0LL, @"IDSFoundation", @"RemoteLoading", @" data usage identifier: %@");
      }

      uint64_t v43 = OSLogHandleForIDSCategory("RemoteLoading");
      v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        v45 = @"NO";
        if (v102) {
          v45 = @"YES";
        }
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v45;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, " shouldUsePipelining: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled(v46)
        && _IDSShouldLog(0LL, @"RemoteLoading"))
      {
        _IDSLogV(0LL, @"IDSFoundation", @"RemoteLoading", @" shouldUsePipelining: %@");
      }

      uint64_t v47 = OSLogHandleForIDSCategory("RemoteLoading");
      v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v101;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, " concurrentConnections: %d", buf, 8u);
      }

      if (os_log_shim_legacy_logging_enabled(v49)
        && _IDSShouldLog(0LL, @"RemoteLoading"))
      {
        _IDSLogV(0LL, @"IDSFoundation", @"RemoteLoading", @" concurrentConnections: %d");
      }

      uint64_t v50 = OSLogHandleForIDSCategory("RemoteLoading");
      v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        v52 = @"NO";
        if (v100) {
          v52 = @"YES";
        }
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v52;
        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, " disableKeepAlive: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled(v53)
        && _IDSShouldLog(0LL, @"RemoteLoading"))
      {
        _IDSLogV(0LL, @"IDSFoundation", @"RemoteLoading", @" disableKeepAlive: %@");
      }

      uint64_t v54 = OSLogHandleForIDSCategory("RemoteLoading");
      v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v99));
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v56;
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, " keepAliveWifi: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled(v57)
        && _IDSShouldLog(0LL, @"RemoteLoading"))
      {
        v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v99));
        _IDSLogV(0LL, @"IDSFoundation", @"RemoteLoading", @" keepAliveWifi: %@");
      }

      uint64_t v58 = OSLogHandleForIDSCategory("RemoteLoading");
      v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
      {
        v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v26));
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v60;
        _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, " keepAliveCell: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled(v61)
        && _IDSShouldLog(0LL, @"RemoteLoading"))
      {
        v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v26));
        _IDSLogV(0LL, @"IDSFoundation", @"RemoteLoading", @" keepAliveCell: %@");
      }

      ++dword_100015998;
      v111[0] = 0LL;
      v111[1] = v111;
      v111[2] = 0x3032000000LL;
      v111[3] = sub_1000076FC;
      v111[4] = sub_10000770C;
      id v112 = (id)0xAAAAAAAAAAAAAAAALL;
      id v112 = (id)os_transaction_create("com.apple.idsremoteurl");
      v62 = (void *)objc_claimAutoreleasedReturnValue(+[IMMobileNetworkManager sharedInstance](&OBJC_CLASS___IMMobileNetworkManager, "sharedInstance"));
      [v62 addFastDormancyDisableToken:@"IDSRemoteURLLoaderAgent"];

      v63 = v10;
      char v64 = v25;
      v105[0] = _NSConcreteStackBlock;
      v105[1] = 3221225472LL;
      v105[2] = sub_100007714;
      v105[3] = &unk_100010728;
      id v65 = v103;
      id v106 = v65;
      id v66 = v28;
      id v107 = v66;
      v104 = v15;
      v108 = v104;
      v109 = v9;
      v110 = v111;
      id v67 = [v105 copy];
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472LL;
      *(void *)&buf[16] = sub_100007F90;
      *(void *)&buf[24] = &unk_100010750;
      id v68 = v65;
      id v114 = v68;
      id v69 = v67;
      id v116 = v69;
      char v120 = v102;
      char v121 = v100;
      int v117 = v101;
      int v118 = v99;
      int v119 = v26;
      char v122 = v24;
      id v70 = v66;
      id v115 = v70;
      char v123 = v98;
      char v124 = v64;
      im_dispatch_after_primary_queue(buf, v71, 0.0);

      uint64_t v10 = v63;
      _Block_object_dispose(v111, 8);
    }

    else
    {
      uint64_t v76 = xpc_connection_get_pid(v9);
      uint64_t v77 = OSLogHandleForIDSCategory("Warning");
      v78 = (os_log_s *)objc_claimAutoreleasedReturnValue(v77);
      if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
      {
        uint64_t v79 = IMProcessNameForPid(v76);
        v80 = (void *)objc_claimAutoreleasedReturnValue(v79);
        *(_DWORD *)buf = 138413058;
        *(void *)&uint8_t buf[4] = v13;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = @"com.apple.private.imcore.imremoteurlconnection";
        *(_WORD *)&buf[22] = 2112;
        *(void *)&buf[24] = v80;
        LOWORD(v114) = 1024;
        *(_DWORD *)((char *)&v114 + 2) = v76;
        _os_log_impl( (void *)&_mh_execute_header,  v78,  OS_LOG_TYPE_ERROR,  "Denying xpc connection, task does not have entitlement: %@ or %@ (%@:%d)",  buf,  0x26u);
      }

      if (os_log_shim_legacy_logging_enabled(v81))
      {
        uint64_t v82 = IMProcessNameForPid(v76);
        v83 = (void *)objc_claimAutoreleasedReturnValue(v82);
        _IDSWarnV( @"IDSFoundation",  @"Denying xpc connection, task does not have entitlement: %@ or %@ (%@:%d)");

        uint64_t v84 = IMProcessNameForPid(v76);
        v85 = (void *)objc_claimAutoreleasedReturnValue(v84);
        _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"Denying xpc connection, task does not have entitlement: %@ or %@ (%@:%d)");

        uint64_t v86 = IMProcessNameForPid(v76);
        v97 = (void *)objc_claimAutoreleasedReturnValue(v86);
        _IDSLogTransport( @"Warning",  @"IDS",  @"Denying xpc connection, task does not have entitlement: %@ or %@ (%@:%d)");
      }

      xpc_connection_cancel(v9);
    }
  }
}

void sub_10000745C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29)
{
  if (a2 == 1)
  {
    objc_begin_catch(exception_object);
    objc_end_catch();
    JUMPOUT(0x100007110LL);
  }

  _Unwind_Resume(exception_object);
}

id sub_1000076A4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__setupServer");
}

uint64_t sub_1000076FC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000770C(uint64_t a1)
{
}

void sub_100007714(uint64_t a1, void *a2, int a3, void *a4, void *a5, void *a6)
{
  id v11 = a2;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = OSLogHandleForIDSCategory("RemoteLoading");
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    id v55 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Finished loading request: %@", buf, 0xCu);
  }

  uint64_t v19 = OSLogHandleForIDSCategory("RemoteLoading");
  uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    id v55 = v21;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, " Data Usage identifier: %@", buf, 0xCu);
  }

  uint64_t v23 = OSLogHandleForIDSCategory("RemoteLoading");
  int v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v55 = v11;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "              Response: %@", buf, 0xCu);
  }

  uint64_t v26 = OSLogHandleForIDSCategory("RemoteLoading");
  uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v28 = [v12 length];
    *(_DWORD *)buf = 67109120;
    LODWORD(v55) = v28;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "     ResultData Length: %d", buf, 8u);
  }

  if (os_log_shim_legacy_logging_enabled(v29) && _IDSShouldLog(0LL, @"RemoteLoading"))
  {
    [v12 length];
    _IDSLogV(0LL, @"IDSFoundation", @"RemoteLoading", @"     ResultData Length: %d");
  }

  uint64_t v30 = OSLogHandleForIDSCategory("RemoteLoading");
  uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v55) = a3;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "            StatusCode: %d", buf, 8u);
  }

  uint64_t v33 = OSLogHandleForIDSCategory("RemoteLoading");
  v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v55 = v13;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "                 Error: %@", buf, 0xCu);
  }

  uint64_t v36 = OSLogHandleForIDSCategory("RemoteLoading");
  v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NetworkChangeNotifier sharedInstance](&OBJC_CLASS___NetworkChangeNotifier, "sharedInstance"));
    unsigned int v39 = [v38 linkQualityValueForInterfaceType:3];
    *(_DWORD *)buf = 67109120;
    LODWORD(v55) = v39;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "     Cell Link Quality: %d", buf, 8u);
  }

  if (os_log_shim_legacy_logging_enabled(v40) && _IDSShouldLog(0LL, @"RemoteLoading"))
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NetworkChangeNotifier sharedInstance](&OBJC_CLASS___NetworkChangeNotifier, "sharedInstance"));
    [v41 linkQualityValueForInterfaceType:3];
    _IDSLogV(0LL, @"IDSFoundation", @"RemoteLoading", @"     Cell Link Quality: %d");
  }

  uint64_t v42 = OSLogHandleForIDSCategory("RemoteLoading");
  uint64_t v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NetworkChangeNotifier sharedInstance](&OBJC_CLASS___NetworkChangeNotifier, "sharedInstance"));
    unsigned int v45 = [v44 linkQualityValueForInterfaceType:2];
    *(_DWORD *)buf = 67109120;
    LODWORD(v55) = v45;
    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "     WiFi Link Quality: %d", buf, 8u);
  }

  if (os_log_shim_legacy_logging_enabled(v46) && _IDSShouldLog(0LL, @"RemoteLoading"))
  {
    uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue(+[NetworkChangeNotifier sharedInstance](&OBJC_CLASS___NetworkChangeNotifier, "sharedInstance"));
    [v47 linkQualityValueForInterfaceType:2];
    _IDSLogV(0LL, @"IDSFoundation", @"RemoteLoading", @"     WiFi Link Quality: %d");
  }

  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 48));
  IMInsertDatasToXPCDictionary(reply, kIMURLConnectionXPCResultDataKey);
  IMInsertKeyedCodableObjectsToXPCDictionary(reply, kIMURLConnectionXPCResponseKey);
  IMInsertKeyedCodableObjectsToXPCDictionary(reply, kIMURLConnectionXPCErrorKey);
  IMInsertIntsToXPCDictionary(reply, kIMURLConnectionXPCStatusCodeKey);
  IMInsertDictionariesToXPCDictionary(reply, kIMURLConnectionXPCResultTimingDataKey);
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 56), reply);
  uint64_t v49 = *(void *)(*(void *)(a1 + 64) + 8LL);
  uint64_t v50 = *(void **)(v49 + 40);
  *(void *)(v49 + 40) = 0LL;

  if (dword_100015998-- <= 1)
  {
    uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue(+[IMMobileNetworkManager sharedInstance](&OBJC_CLASS___IMMobileNetworkManager, "sharedInstance"));
    [v53 removeFastDormancyDisableToken:@"IDSRemoteURLLoaderAgent"];
  }

  im_dispatch_after_primary_queue(&stru_100010700, v51, 30.0);
}

void sub_100007E08(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x1000079ACLL);
  }

  _Unwind_Resume(a1);
}

void sub_100007EB8(id a1)
{
  if (dword_100015998 <= 0)
  {
    uint64_t v1 = OSLogHandleForIDSCategory("RemoteLoading");
    id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Idle exiting, we're done here", v3, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
    }

    exit(0);
  }

void sub_100007F90(uint64_t a1)
{
  id v3 = -[IDSRemoteAgentURLLoader initWithURLRequest:completionBlock:]( objc_alloc(&OBJC_CLASS___IDSRemoteAgentURLLoader),  "initWithURLRequest:completionBlock:",  *(void *)(a1 + 32),  *(void *)(a1 + 48));
  -[IDSRemoteAgentURLLoader setShouldUsePipelining:](v3, "setShouldUsePipelining:", *(unsigned __int8 *)(a1 + 68));
  -[IDSRemoteAgentURLLoader setConcurrentConnections:](v3, "setConcurrentConnections:", *(unsigned int *)(a1 + 56));
  -[IDSRemoteAgentURLLoader setDisableKeepAlive:](v3, "setDisableKeepAlive:", *(unsigned __int8 *)(a1 + 69));
  -[IDSRemoteAgentURLLoader setKeepAliveWifi:](v3, "setKeepAliveWifi:", *(unsigned int *)(a1 + 60));
  -[IDSRemoteAgentURLLoader setKeepAliveCell:](v3, "setKeepAliveCell:", *(unsigned int *)(a1 + 64));
  -[IDSRemoteAgentURLLoader setForceCellularIfPossible:]( v3,  "setForceCellularIfPossible:",  *(unsigned __int8 *)(a1 + 70));
  -[IDSRemoteAgentURLLoader setBundleIdentifierForDataUsage:]( v3,  "setBundleIdentifierForDataUsage:",  *(void *)(a1 + 40));
  -[IDSRemoteAgentURLLoader setShouldReturnTimingData:](v3, "setShouldReturnTimingData:", *(unsigned __int8 *)(a1 + 71));
  -[IDSRemoteAgentURLLoader setRequireIDSHost:](v3, "setRequireIDSHost:", *(unsigned __int8 *)(a1 + 72));
  -[IDSRemoteAgentURLLoader load](v3, "load");
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRemoteURLConnectionDaemon sharedInstance]( &OBJC_CLASS___IDSRemoteURLConnectionDaemon,  "sharedInstance"));
  [v2 addURLLoader:v3];
}

void sub_1000080A4(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___IDSRemoteURLConnectionDaemonIDSInterface);
  id v2 = (void *)qword_1000159A8;
  qword_1000159A8 = (uint64_t)v1;
}

LABEL_11:
  return (char)v3;
}

    _IMLog(@"Quit - notifying about shutdown");
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "__mainThreadPostNotificationName:object:", @"IMAVDaemonShutdownNotification", 0);

    _IMLog(@"Quit - shutting down daemon");
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRemoteURLConnectionDaemon sharedInstance]( &OBJC_CLASS___IDSRemoteURLConnectionDaemon,  "sharedInstance"));
    [v4 shutdown];

    _IMLog(@"Quit - goodbye!");
    return;
  }

  switch(v1)
  {
    case 31:
      uint64_t v5 = _IMLog(@"Reloading Logging Settings");
      uint64_t v6 = _IMSyncLoggingSettings(v5);
      MarcoSyncLoggingsPreferences(v6);
      return;
    case 30:
      v7 = (id)objc_claimAutoreleasedReturnValue( +[IDSRemoteURLConnectionDaemon sharedInstance]( &OBJC_CLASS___IDSRemoteURLConnectionDaemon,  "sharedInstance"));
      [v7 logState];

      return;
    case 15:
      goto LABEL_11;
  }

void sub_100008BB0(uint64_t a1, void *a2, __CFString *a3, void *a4, void *a5, void *a6)
{
  id v11 = a2;
  id v86 = a4;
  id v12 = a5;
  id v85 = a6;
  if ([*(id *)(*(void *)(a1 + 32) + 24) containsObject:*(void *)(a1 + 40)])
  {
    [*(id *)(*(void *)(a1 + 32) + 24) removeObject:*(void *)(a1 + 40)];
    v83 = a3;
    uint64_t v13 = OSLogHandleForIDSCategory("IDSRemoteURLConnectionDaemonIDSInterface");
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(const __CFString **)(a1 + 40);
      id v16 = *(__CFString **)(*(void *)(a1 + 32) + 24LL);
      *(_DWORD *)buf = 138412546;
      v88 = v15;
      __int16 v89 = 2112;
      uint64_t v90 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Removed uniqueID %@ from _pendingResponseUniqueIDs. New map: %@",  buf,  0x16u);
    }

    if (os_log_shim_legacy_logging_enabled(v17)
      && _IDSShouldLog(0LL, @"IDSRemoteURLConnectionDaemonIDSInterface"))
    {
      uint64_t v79 = *(__CFString **)(a1 + 40);
      uint64_t v81 = *(void *)(*(void *)(a1 + 32) + 24LL);
      _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSRemoteURLConnectionDaemonIDSInterface",  @"Removed uniqueID %@ from _pendingResponseUniqueIDs. New map: %@");
    }

    uint64_t v18 = OSLogHandleForIDSCategory("IDSRemoteURLConnectionDaemonIDSInterface");
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = *(const __CFString **)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      v88 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Finished loading request: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v21)
      && _IDSShouldLog(0LL, @"IDSRemoteURLConnectionDaemonIDSInterface"))
    {
      uint64_t v79 = *(__CFString **)(a1 + 48);
      _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSRemoteURLConnectionDaemonIDSInterface",  @"Finished loading request: %@");
    }

    uint64_t v22 = OSLogHandleForIDSCategory("IDSRemoteURLConnectionDaemonIDSInterface");
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = *(const __CFString **)(a1 + 56);
      *(_DWORD *)buf = 138412290;
      v88 = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, " Data Usage identifier: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v25)
      && _IDSShouldLog(0LL, @"IDSRemoteURLConnectionDaemonIDSInterface"))
    {
      uint64_t v79 = *(__CFString **)(a1 + 56);
      _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSRemoteURLConnectionDaemonIDSInterface",  @" Data Usage identifier: %@");
    }

    uint64_t v26 = OSLogHandleForIDSCategory("IDSRemoteURLConnectionDaemonIDSInterface");
    uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v88 = v11;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "              Response: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v28)
      && _IDSShouldLog(0LL, @"IDSRemoteURLConnectionDaemonIDSInterface"))
    {
      uint64_t v79 = v11;
      _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSRemoteURLConnectionDaemonIDSInterface",  @"              Response: %@");
    }

    uint64_t v29 = OSLogHandleForIDSCategory("IDSRemoteURLConnectionDaemonIDSInterface");
    uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v31 = [v86 length];
      *(_DWORD *)buf = 67109120;
      LODWORD(v88) = v31;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "     ResultData Length: %d", buf, 8u);
    }

    if (os_log_shim_legacy_logging_enabled(v32)
      && _IDSShouldLog(0LL, @"IDSRemoteURLConnectionDaemonIDSInterface"))
    {
      uint64_t v79 = (__CFString *)[v86 length];
      _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSRemoteURLConnectionDaemonIDSInterface",  @"     ResultData Length: %d");
    }

    uint64_t v33 = OSLogHandleForIDSCategory("IDSRemoteURLConnectionDaemonIDSInterface");
    v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v88) = (_DWORD)a3;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "            StatusCode: %d", buf, 8u);
    }

    if (os_log_shim_legacy_logging_enabled(v35)
      && _IDSShouldLog(0LL, @"IDSRemoteURLConnectionDaemonIDSInterface"))
    {
      uint64_t v79 = a3;
      _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSRemoteURLConnectionDaemonIDSInterface",  @"            StatusCode: %d");
    }

    uint64_t v36 = OSLogHandleForIDSCategory("IDSRemoteURLConnectionDaemonIDSInterface");
    v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v88 = v12;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "                 Error: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v38)
      && _IDSShouldLog(0LL, @"IDSRemoteURLConnectionDaemonIDSInterface"))
    {
      uint64_t v79 = v12;
      _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSRemoteURLConnectionDaemonIDSInterface",  @"                 Error: %@");
    }

    uint64_t v84 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString allHeaderFields](v11, "allHeaderFields", v79, v81));
    uint64_t v39 = JWEncodeKeyedCodableObject(v84);
    uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
    if (!v40) {
      uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](&OBJC_CLASS___NSData, "data"));
    }
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString URL](v11, "URL"));
    uint64_t v42 = JWEncodeKeyedCodableObject(v41);
    uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
    if (!v43) {
      uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](&OBJC_CLASS___NSData, "data"));
    }
    v44 = (id)kCFHTTPVersion1_1;
    uint64_t v45 = objc_opt_class(&OBJC_CLASS___NSHTTPURLResponse);
    if ((objc_opt_isKindOfClass(v11, v45) & 1) != 0)
    {
      uint64_t v46 = (const __CFString *)-[__CFString _CFURLResponse](v11, "_CFURLResponse");
      uint64_t v47 = v46;
      if (v46)
      {
        HTTPResponse = (__CFHTTPMessage *)CFURLResponseGetHTTPResponse(v46);
        if (HTTPResponse)
        {
          CFStringRef v49 = CFHTTPMessageCopyVersion(HTTPResponse);

          v44 = (__CFString *)v49;
        }

        else
        {
          uint64_t v60 = OSLogHandleForIDSCategory("IDSRemoteURLConnectionDaemonIDSInterface");
          uint64_t v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v88 = v47;
            _os_log_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_DEFAULT,  "Could not get HTTP version for response %@",  buf,  0xCu);
          }

          if (os_log_shim_legacy_logging_enabled(v62)
            && _IDSShouldLog(0LL, @"IDSRemoteURLConnectionDaemonIDSInterface"))
          {
            v80 = v47;
            _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSRemoteURLConnectionDaemonIDSInterface",  @"Could not get HTTP version for response %@");
          }
        }
      }

      else
      {
        uint64_t v57 = OSLogHandleForIDSCategory("IDSRemoteURLConnectionDaemonIDSInterface");
        uint64_t v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v88 = v11;
          _os_log_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_DEFAULT,  "Could not get CFURLResponse from response %@",  buf,  0xCu);
        }

        if (os_log_shim_legacy_logging_enabled(v59)
          && _IDSShouldLog(0LL, @"IDSRemoteURLConnectionDaemonIDSInterface"))
        {
          v80 = v11;
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSRemoteURLConnectionDaemonIDSInterface",  @"Could not get CFURLResponse from response %@");
        }
      }
    }

    else
    {
      uint64_t v54 = OSLogHandleForIDSCategory("Warning");
      id v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v88 = @"IDSRemoteURLConnectionDaemonIDSInterface";
        __int16 v89 = 2112;
        uint64_t v90 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_ERROR,  "%@ - Response is not an HTTP response %@",  buf,  0x16u);
      }

      if (os_log_shim_legacy_logging_enabled(v56))
      {
        _IDSWarnV(@"IDSFoundation", @"%@ - Response is not an HTTP response %@");
        _IDSLogV(0LL, @"IDSFoundation", @"Warning", @"%@ - Response is not an HTTP response %@");
        v80 = @"IDSRemoteURLConnectionDaemonIDSInterface";
        uint64_t v82 = v11;
        _IDSLogTransport(@"Warning", @"IDS", @"%@ - Response is not an HTTP response %@");
      }
    }

    uint64_t v63 = JWEncodeKeyedCodableObject(v12);
    char v64 = (void *)objc_claimAutoreleasedReturnValue(v63);
    if (!v64) {
      char v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](&OBJC_CLASS___NSData, "data"));
    }
    id v65 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    CFDictionarySetValue((CFMutableDictionaryRef)v65, IDSRemoteURLConnectionKeyCommand, &off_100011378);
    id v66 = *(id *)(a1 + 40);
    if (v66) {
      CFDictionarySetValue((CFMutableDictionaryRef)v65, IDSRemoteURLConnectionKeyUniqueID, v66);
    }

    id v67 = v40;
    if (v67) {
      CFDictionarySetValue((CFMutableDictionaryRef)v65, IDSRemoteURLConnectionKeyHeaders, v67);
    }

    id v68 = v43;
    if (v68) {
      CFDictionarySetValue((CFMutableDictionaryRef)v65, IDSRemoteURLConnectionKeyURL, v68);
    }

    id v69 = v44;
    if (v69) {
      CFDictionarySetValue((CFMutableDictionaryRef)v65, IDSRemoteURLConnectionKeyHTTPVersion, v69);
    }

    id v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v83));
    if (v70) {
      CFDictionarySetValue((CFMutableDictionaryRef)v65, IDSRemoteURLConnectionKeyResponseStatusCode, v70);
    }

    id v71 = v86;
    if (v71) {
      CFDictionarySetValue((CFMutableDictionaryRef)v65, IDSRemoteURLConnectionKeyResultData, v71);
    }

    id v72 = v64;
    if (v72) {
      CFDictionarySetValue((CFMutableDictionaryRef)v65, IDSRemoteURLConnectionKeyResponseError, v72);
    }

    uint64_t v73 = OSLogHandleForIDSCategory("IDSRemoteURLConnectionDaemonIDSInterface");
    pid_t v74 = (os_log_s *)objc_claimAutoreleasedReturnValue(v73);
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v88 = (const __CFString *)v65;
      _os_log_impl( (void *)&_mh_execute_header,  v74,  OS_LOG_TYPE_DEFAULT,  "Sending an IDS message back to the watch. loadResponse: %@",  buf,  0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v75)
      && _IDSShouldLog(0LL, @"IDSRemoteURLConnectionDaemonIDSInterface"))
    {
      v80 = (const __CFString *)v65;
      _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSRemoteURLConnectionDaemonIDSInterface",  @"Sending an IDS message back to the watch. loadResponse: %@");
    }

    if ((objc_msgSend(*(id *)(a1 + 32), "sendIDSMessage:forLoaderWithUniqueID:", v65, 0, v80, v82) & 1) == 0)
    {
      uint64_t v76 = OSLogHandleForIDSCategory("IDSRemoteURLConnectionDaemonIDSInterface");
      uint64_t v77 = (os_log_s *)objc_claimAutoreleasedReturnValue(v76);
      if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v77,  OS_LOG_TYPE_DEFAULT,  "Failed sending load request response",  buf,  2u);
      }

      if (os_log_shim_legacy_logging_enabled(v78)
        && _IDSShouldLog(0LL, @"IDSRemoteURLConnectionDaemonIDSInterface"))
      {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSRemoteURLConnectionDaemonIDSInterface",  @"Failed sending load request response");
      }
    }
  }

  else
  {
    uint64_t v50 = OSLogHandleForIDSCategory("IDSRemoteURLConnectionDaemonIDSInterface");
    uint64_t v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      v52 = *(const __CFString **)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v88 = v52;
      _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_DEFAULT,  "Response is for deactivated watch and was dropped. _pendingResponseUniqueIDs does not contain %@",  buf,  0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v53)
      && _IDSShouldLog(0LL, @"IDSRemoteURLConnectionDaemonIDSInterface"))
    {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSRemoteURLConnectionDaemonIDSInterface",  @"Response is for deactivated watch and was dropped. _pendingResponseUniqueIDs does not contain %@");
    }
  }
}

void sub_100009830(uint64_t a1)
{
  id v3 = -[IDSRemoteAgentURLLoader initWithURLRequest:completionBlock:]( objc_alloc(&OBJC_CLASS___IDSRemoteAgentURLLoader),  "initWithURLRequest:completionBlock:",  *(void *)(a1 + 32),  *(void *)(a1 + 48));
  -[IDSRemoteAgentURLLoader setForceCellularIfPossible:]( v3,  "setForceCellularIfPossible:",  *(unsigned __int8 *)(a1 + 68));
  -[IDSRemoteAgentURLLoader setBundleIdentifierForDataUsage:]( v3,  "setBundleIdentifierForDataUsage:",  *(void *)(a1 + 40));
  -[IDSRemoteAgentURLLoader setRequireIDSHost:](v3, "setRequireIDSHost:", *(unsigned __int8 *)(a1 + 69));
  -[IDSRemoteAgentURLLoader setShouldUsePipelining:](v3, "setShouldUsePipelining:", *(unsigned __int8 *)(a1 + 70));
  -[IDSRemoteAgentURLLoader setConcurrentConnections:](v3, "setConcurrentConnections:", *(unsigned int *)(a1 + 56));
  -[IDSRemoteAgentURLLoader setDisableKeepAlive:](v3, "setDisableKeepAlive:", *(unsigned __int8 *)(a1 + 71));
  -[IDSRemoteAgentURLLoader setKeepAliveWifi:](v3, "setKeepAliveWifi:", *(unsigned int *)(a1 + 60));
  -[IDSRemoteAgentURLLoader setKeepAliveCell:](v3, "setKeepAliveCell:", *(unsigned int *)(a1 + 64));
  -[IDSRemoteAgentURLLoader load](v3, "load");
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRemoteURLConnectionDaemon sharedInstance]( &OBJC_CLASS___IDSRemoteURLConnectionDaemon,  "sharedInstance"));
  [v2 addURLLoader:v3];
}

void sub_10000A674(uint64_t a1)
{
  uint64_t v2 = OSLogHandleForIDSCategory("IDSRemoteURLConnectionDaemonIDSInterface");
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Message timeout block fired; checking if we still have a URLLoader for the request",
      buf,
      2u);
  }

  if (os_log_shim_legacy_logging_enabled(v4)
    && _IDSShouldLog(0LL, @"IDSRemoteURLConnectionDaemonIDSInterface"))
  {
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSRemoteURLConnectionDaemonIDSInterface",  @"Message timeout block fired; checking if we still have a URLLoader for the request");
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRemoteURLConnectionDaemon sharedInstance]( &OBJC_CLASS___IDSRemoteURLConnectionDaemon,  "sharedInstance"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 urlLoaderForUniqueID:*(void *)(a1 + 32)]);

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 block]);
    id v8 = [v7 copy];

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  IDSRemoteURLConnectionErrorDomain,  2LL,  0LL));
      (*((void (**)(id, void, void, void, void *, void))v8 + 2))(v8, 0LL, 0LL, 0LL, v9, 0LL);
    }

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRemoteURLConnectionDaemon sharedInstance]( &OBJC_CLASS___IDSRemoteURLConnectionDaemon,  "sharedInstance"));
    [v10 removeURLLoaderForUniqueID:*(void *)(a1 + 32)];
  }

  else
  {
    uint64_t v11 = OSLogHandleForIDSCategory("IDSRemoteURLConnectionDaemonIDSInterface");
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      uint64_t v14 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v17 = v13;
      __int16 v18 = 2112;
      uint64_t v19 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "No URLLoader for uniqueID %@ message ID %@",  buf,  0x16u);
    }

    if (os_log_shim_legacy_logging_enabled(v15)
      && _IDSShouldLog(0LL, @"IDSRemoteURLConnectionDaemonIDSInterface"))
    {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSRemoteURLConnectionDaemonIDSInterface",  @"No URLLoader for uniqueID %@ message ID %@");
    }
  }
}

void sub_10000AB64(int a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000ABBC;
  block[3] = &unk_100010808;
  int v2 = a1;
  dispatch_async(&_dispatch_main_q, block);
}

void sub_10000ABBC(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 32);
  if (v1 <= 14)
  {
    if (v1 != 1 && v1 != 3)
    {
      if (v1 == 13)
      {
        signal(2, (void (__cdecl *)(int))sub_10000AB64);
        return;
      }

      goto LABEL_14;
    }

LABEL_14:
  _IMWarn(@"Unhandled signal: %d");
}

void sub_10000AD00()
{
  if (qword_1000159B0 != -1) {
    dispatch_once(&qword_1000159B0, &stru_100010828);
  }
}

void sub_10000AD28(id a1)
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  int v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  for (uint64_t i = 0LL; i != 6; ++i)
  {
    int v4 = dword_10000C428[i];
    uint64_t v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, v4, 0LL, v2);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10000AE30;
    handler[3] = &unk_100010808;
    int v9 = v4;
    dispatch_source_set_event_handler(v5, handler);
    uint64_t v6 = (void *)qword_1000159B8[i];
    qword_1000159B8[i] = v5;
    id v7 = v5;

    dispatch_resume(v7);
    signal(v4, (void (__cdecl *)(int))1);
  }
}

void sub_10000AE30(uint64_t a1)
{
}

uint64_t start()
{
  v0 = objc_autoreleasePoolPush();
  int v1 = objc_autoreleasePoolPush();
  if (qword_1000159B0 != -1) {
    dispatch_once(&qword_1000159B0, &stru_100010828);
  }
  xpc_set_event_stream_handler("com.apple.notifyd.matching", &_dispatch_main_q, &stru_100010868);
  int v2 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRemoteURLConnectionDaemon sharedInstance]( &OBJC_CLASS___IDSRemoteURLConnectionDaemon,  "sharedInstance"));
  objc_autoreleasePoolPop(v1);
  if (v2)
  {
    id v3 = objc_autoreleasePoolPush();
    int v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
    [v4 run];

    objc_autoreleasePoolPop(v3);
  }

  objc_autoreleasePoolPop(v0);
  return 0LL;
}

void sub_10000AF6C(void *a1)
{
}

void sub_10000AF8C()
{
  __assert_rtn( "auth_peer_event_handler",  "IDSRemoteURLConnectionDaemonMIGInterface.m",  74,  "type == XPC_TYPE_DICTIONARY");
}

void sub_10000AFB4(void *a1)
{
}

id objc_msgSend_urlLoaderForUniqueID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "urlLoaderForUniqueID:");
}