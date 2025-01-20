uint64_t sub_10000468C(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  v1 = a1;
  xpc_get_type(v1);
  if ((IMGetXPCBoolFromDictionary(v1, "isSend") & 1) != 0)
  {
    v2 = 1LL;
  }

  else if ((IMGetXPCBoolFromDictionary(v1, "prewarm") & 1) != 0)
  {
    v2 = 5LL;
  }

  else if ((IMGetXPCBoolFromDictionary(v1, "getNickname") & 1) != 0)
  {
    v2 = 2LL;
  }

  else if ((IMGetXPCBoolFromDictionary(v1, "setPersonalNickname") & 1) != 0)
  {
    v2 = 3LL;
  }

  else if ((IMGetXPCBoolFromDictionary(v1, "deleteAllPersonalNicknames") & 1) != 0)
  {
    v2 = 4LL;
  }

  else if ((IMGetXPCBoolFromDictionary(v1, "cancelSend") & 1) != 0)
  {
    v2 = 6LL;
  }

  else
  {
    v3 = IMGetXPCStringFromDictionary(v1, "simID");
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    if (v4)
    {
      v5 = IMGetXPCStringFromDictionary(v1, "transferURL");
      v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      if (v6) {
        v2 = 7LL;
      }
      else {
        v2 = 8LL;
      }
    }

    else
    {
      v2 = 0LL;
    }
  }

  return v2;
}

void start()
{
  dispatch_workloop_t v0 = dispatch_workloop_create("com.apple.IMTransferAgentWorkQueue");
  dispatch_queue_attr_t v1 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v1);
  dispatch_queue_t v3 = dispatch_queue_create_with_target_V2("com.apple.IMTransferAgentSerialQueue", v2, v0);

  im_set_primary_base_queue(v0);
  im_set_primary_queue(v3);
  if (IMOSLoggingEnabled(  +[IMTransferAgentIDSInterface sharedInstance]( &OBJC_CLASS___IMTransferAgentIDSInterface,  "sharedInstance")))
  {
    uint64_t v4 = OSLogHandleForIMFoundationCategory("Transfer");
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "IMTransferAgent woke up", buf, 2u);
    }
  }

  uint64_t v6 = im_primary_queue();
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v6);
  xpc_set_event_stream_handler("com.apple.notifyd.matching", v7, &stru_1000082D0);

  uint64_t v8 = im_primary_queue();
  v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
  mach_service = xpc_connection_create_mach_service("com.apple.imtransferservices.IMTransferAgent", v9, 1uLL);

  xpc_connection_set_event_handler(mach_service, &stru_1000082F0);
  xpc_connection_activate(mach_service);
  *(void *)&__int128 v11 = 138412290LL;
  __int128 v14 = v11;
  while (1)
  {
    v12 = objc_autoreleasePoolPush();
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop", v14));
    [v13 run];

    objc_autoreleasePoolPop(v12);
  }
}

void sub_100004A14(id a1, OS_xpc_object *a2)
{
  v2 = a2;
  if (IMOSLoggingEnabled())
  {
    uint64_t v3 = OSLogHandleForIMFoundationCategory("Transfer");
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Received IDS Launch notification", v5, 2u);
    }
  }
}

void sub_100004AAC(id a1, OS_xpc_object *a2)
{
  v2 = a2;
  if (IMOSLoggingEnabled())
  {
    uint64_t v3 = OSLogHandleForIMFoundationCategory("IMTransferAgent");
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = qos_class_self();
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "Handling connection message at qos (%u)",  buf,  8u);
    }
  }

  if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_connection)
  {
    *(_OWORD *)buf = 0u;
    __int128 v21 = 0u;
    xpc_connection_get_audit_token(v2, buf);
    if ((IMDAuditTokenTaskHasEntitlement(buf, @"com.apple.private.imcore.imtransferservice") & 1) != 0)
    {
      uint64_t v7 = im_primary_queue();
      uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v7);
      xpc_connection_set_target_queue(v2, v8);

      xpc_connection_set_event_handler(v2, &stru_100008310);
      xpc_connection_activate(v2);
    }

    else
    {
      uint64_t pid = xpc_connection_get_pid(v2);
      if (IMOSLoggingEnabled())
      {
        uint64_t v10 = OSLogHandleForIMFoundationCategory("Warning");
        __int128 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          uint64_t v12 = IMProcessNameForPid(pid);
          v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
          int v14 = 138412802;
          v15 = @"com.apple.private.imcore.imtransferservice";
          __int16 v16 = 2112;
          v17 = v13;
          __int16 v18 = 1024;
          int v19 = pid;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Denying xpc connection, task does not have entitlement: %@  (%@:%d)",  (uint8_t *)&v14,  0x1Cu);
        }
      }

      xpc_connection_cancel(v2);
    }
  }

  else if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v2;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Connection handler did not handle event: %@",  buf,  0xCu);
    }
  }
}

void sub_100004D48(id a1, OS_xpc_object *a2)
{
  v2 = a2;
  xpc_type_t type = xpc_get_type(v2);
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (IMOSLoggingEnabled(type))
    {
      uint64_t v10 = OSLogHandleForIMFoundationCategory("TransferAgent");
      __int128 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v2;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Received error, tearing down connection (%@)",  buf,  0xCu);
      }
    }
  }

  else
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[IMTransferAgentIDSInterface sharedInstance]( &OBJC_CLASS___IMTransferAgentIDSInterface,  "sharedInstance"));
    [v4 incrementTransferCount];

    xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(v2);
    xpc_connection_t connection = (xpc_connection_t)objc_claimAutoreleasedReturnValue(remote_connection);
    uint64_t v6 = v2;
    uint64_t v7 = sub_10000468C(v6);
    switch(v7)
    {
      case 0LL:
        if (IMOSLoggingEnabled(v7))
        {
          uint64_t v12 = OSLogHandleForIMFoundationCategory("IMTransferAgent");
          v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = qos_class_self();
            _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Handling download message at qos (%u)",  buf,  8u);
          }
        }

        uint64_t v14 = IMGetXPCDataFromDictionary(v6, "signature");
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        uint64_t v16 = IMGetXPCDataFromDictionary(v6, "decryptionKey");
        v114 = (void *)objc_claimAutoreleasedReturnValue(v16);
        uint64_t v17 = IMGetXPCStringFromDictionary(v6, "ownerID");
        v112 = (void *)objc_claimAutoreleasedReturnValue(v17);
        uint64_t v18 = IMGetXPCStringFromDictionary(v6, "urlString");
        v111 = (void *)objc_claimAutoreleasedReturnValue(v18);
        uint64_t v19 = IMGetXPCStringFromDictionary(v6, "receivePath");
        v117 = (void *)objc_claimAutoreleasedReturnValue(v19);
        uint64_t v20 = IMGetXPCStringFromDictionary(v6, "transferID");
        v110 = (void *)objc_claimAutoreleasedReturnValue(v20);
        uint64_t v21 = IMGetXPCStringFromDictionary(v6, "sourceAppID");
        v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
        uint64_t uint64 = xpc_dictionary_get_uint64(v6, "file-size");
        uint64_t v23 = IMGetXPCStringFromDictionary(v6, "topic");
        v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
        uint64_t v25 = IMGetXPCStringFromDictionary(v6, "sandboxExtension");
        id v26 = objc_claimAutoreleasedReturnValue(v25);
        id v27 = [v26 UTF8String];

        if (v27)
        {
          uint64_t v29 = sandbox_extension_consume(v27);
          if (v29 == -1)
          {
            if (IMOSLoggingEnabled(-1LL))
            {
              uint64_t v30 = OSLogHandleForIMFoundationCategory("Warning");
              v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
              if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
              {
                int v32 = *__error();
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)&buf[4] = v32;
                *(_WORD *)&buf[8] = 2112;
                *(void *)&buf[10] = v117;
                _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_INFO,  "Unable to access path with extension, error: %d resource: %@",  buf,  0x12u);
              }
            }

            uint64_t v29 = -1LL;
          }
        }

        else
        {
          if (IMOSLoggingEnabled(v28))
          {
            uint64_t v105 = OSLogHandleForIMFoundationCategory("Warning");
            v106 = (os_log_s *)objc_claimAutoreleasedReturnValue(v105);
            if (os_log_type_enabled(v106, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&buf[4] = v117;
              _os_log_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_INFO, "No extension for path %@", buf, 0xCu);
            }
          }

          uint64_t v29 = 0LL;
        }

        v107 = (void *)objc_claimAutoreleasedReturnValue( +[IMTransferAgentController sharedInstance]( &OBJC_CLASS___IMTransferAgentController,  "sharedInstance"));
        v121 = _NSConcreteStackBlock;
        uint64_t v122 = 3221225472LL;
        v123 = sub_100005DFC;
        v124 = &unk_100008378;
        v125 = connection;
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&buf[8] = 3221225472LL;
        *(void *)&uint8_t buf[16] = sub_100005F68;
        v127 = &unk_1000083A0;
        uint64_t v131 = v29;
        v128 = v6;
        xpc_connection_t v129 = v125;
        v130 = &stru_100008350;
        [v107 receiveFileTransfer:v110 topic:v24 path:v117 requestURLString:v111 ownerID:v112 signature:v15 fileSize:uint64 decryptionKey:v114 sourceAppID:v22 progressB lock:&v121 completionBlock:buf];

        break;
      case 1LL:
        if (IMOSLoggingEnabled(v7))
        {
          uint64_t v33 = OSLogHandleForIMFoundationCategory("IMTransferAgent");
          v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = qos_class_self();
            _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_INFO,  "Handling upload message at qos (%u)",  buf,  8u);
          }
        }

        unsigned int v113 = IMGetXPCBoolFromDictionary(v6, "encryptFile");
        uint64_t v35 = IMGetXPCStringFromDictionary(v6, "transferURL");
        v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
        uint64_t v37 = IMGetXPCStringFromDictionary(v6, "transferID");
        v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
        uint64_t v39 = IMGetXPCStringFromDictionary(v6, "topic");
        v118 = (void *)objc_claimAutoreleasedReturnValue(v39);
        uint64_t v40 = IMGetXPCStringFromDictionary(v6, "sourceAppID");
        v115 = (void *)objc_claimAutoreleasedReturnValue(v40);
        uint64_t v41 = IMGetXPCDictionaryFromDictionary(v6, "userInfo");
        v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
        uint64_t v43 = IMGetXPCStringFromDictionary(v6, "sandboxExtension");
        id v44 = objc_claimAutoreleasedReturnValue(v43);
        id v45 = [v44 UTF8String];

        if (v45)
        {
          uint64_t v47 = sandbox_extension_consume(v45);
          uint64_t v48 = v47;
          if (v47 == -1)
          {
            uint64_t v47 = IMOSLoggingEnabled(-1LL);
            if ((_DWORD)v47)
            {
              uint64_t v49 = OSLogHandleForIMFoundationCategory("Warning");
              v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
              if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
              {
                int v51 = *__error();
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)&buf[4] = v51;
                *(_WORD *)&buf[8] = 2112;
                *(void *)&buf[10] = v36;
                _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_INFO,  "Unable to access path with extension, error: %d resource: %@",  buf,  0x12u);
              }
            }

            uint64_t v48 = -1LL;
          }
        }

        else
        {
          uint64_t v47 = IMOSLoggingEnabled(v46);
          if ((_DWORD)v47)
          {
            uint64_t v100 = OSLogHandleForIMFoundationCategory("Warning");
            v101 = (os_log_s *)objc_claimAutoreleasedReturnValue(v100);
            if (os_log_type_enabled(v101, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&buf[4] = v36;
              _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_INFO, "No extension for path %@", buf, 0xCu);
            }
          }

          uint64_t v48 = 0LL;
        }

        if (IMOSLoggingEnabled(v47))
        {
          uint64_t v102 = OSLogHandleForIMFoundationCategory("Transfer");
          v103 = (os_log_s *)objc_claimAutoreleasedReturnValue(v102);
          if (os_log_type_enabled(v103, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_INFO, "Requesting to upload file.", buf, 2u);
          }
        }

        v104 = (void *)objc_claimAutoreleasedReturnValue( +[IMTransferAgentController sharedInstance]( &OBJC_CLASS___IMTransferAgentController,  "sharedInstance"));
        v121 = _NSConcreteStackBlock;
        uint64_t v122 = 3221225472LL;
        v123 = sub_100006158;
        v124 = &unk_100008378;
        v125 = connection;
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&buf[8] = 3221225472LL;
        *(void *)&uint8_t buf[16] = sub_1000062C4;
        v127 = &unk_1000083C8;
        uint64_t v131 = v48;
        v128 = v6;
        xpc_connection_t v129 = v125;
        v130 = &stru_100008350;
        [v104 sendFilePath:v36 encrypt:v113 topic:v118 transferID:v38 sourceAppID:v115 userInfo:v42 progressBlock:&v121 completionBlock:buf];

        break;
      case 2LL:
        uint64_t v52 = IMOSLoggingEnabled(v7);
        if ((_DWORD)v52)
        {
          uint64_t v53 = OSLogHandleForIMFoundationCategory("IMTransferAgent");
          v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
          if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = qos_class_self();
            _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_INFO,  "Handling nickname download message at qos (%u)",  buf,  8u);
          }
        }

        if (IMOSLoggingEnabled(v52))
        {
          uint64_t v55 = OSLogHandleForIMFoundationCategory("TransferAgent_Nickname");
          v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
          if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_INFO,  "Transfer agent received nickname get message",  buf,  2u);
          }
        }

        uint64_t v57 = IMGetXPCStringFromDictionary(v6, "recordID");
        v119 = (void *)objc_claimAutoreleasedReturnValue(v57);
        uint64_t v58 = IMGetXPCDataFromDictionary(v6, "decryptionKey");
        v116 = (void *)objc_claimAutoreleasedReturnValue(v58);
        uint64_t v59 = IMGetXPCDataFromDictionary(v6, "wallpaperDataTag");
        v60 = (void *)objc_claimAutoreleasedReturnValue(v59);
        uint64_t v61 = IMGetXPCDataFromDictionary(v6, "wallpaperLowResDataTag");
        v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
        uint64_t v63 = IMGetXPCDataFromDictionary(v6, "wallpaperMetadataTag");
        v64 = (void *)objc_claimAutoreleasedReturnValue(v63);
        uint64_t v65 = IMGetXPCBoolFromDictionary(v6, "isKnownSender");
        char v66 = IMGetXPCBoolFromDictionary(v6, "shouldDecodeImageFields");
        v67 = (void *)objc_claimAutoreleasedReturnValue( +[IMTransferAgentNicknameController sharedInstance]( &OBJC_CLASS___IMTransferAgentNicknameController,  "sharedInstance"));
        uint64_t v68 = im_primary_queue();
        v69 = (void *)objc_claimAutoreleasedReturnValue(v68);
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&buf[8] = 3221225472LL;
        *(void *)&uint8_t buf[16] = sub_100006530;
        v127 = &unk_1000083F0;
        v128 = v6;
        xpc_connection_t v129 = connection;
        v130 = &stru_100008350;
        LOBYTE(v108) = v66;
        [v67 getNicknameWithRecordID:v119 decryptionKey:v116 wallpaperDataTag:v60 wallpaperLowResDataTag:v62 wallpaperMetadataTag:v64 knownSender :v65 shouldDecodeImageFields:v108 queue:v69 completionBlock:buf];

        break;
      case 3LL:
        uint64_t v70 = IMOSLoggingEnabled(v7);
        if ((_DWORD)v70)
        {
          uint64_t v71 = OSLogHandleForIMFoundationCategory("IMTransferAgent");
          v72 = (os_log_s *)objc_claimAutoreleasedReturnValue(v71);
          if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = qos_class_self();
            _os_log_impl( (void *)&_mh_execute_header,  v72,  OS_LOG_TYPE_INFO,  "Handling nickname upload message at qos (%u)",  buf,  8u);
          }
        }

        if (IMOSLoggingEnabled(v70))
        {
          uint64_t v73 = OSLogHandleForIMFoundationCategory("TransferAgent_Nickname");
          v74 = (os_log_s *)objc_claimAutoreleasedReturnValue(v73);
          if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v74,  OS_LOG_TYPE_INFO,  "Transfer agent received nickname upload message",  buf,  2u);
          }
        }

        uint64_t v75 = IMGetXPCStringFromDictionary(v6, "oldRecordID");
        v76 = (void *)objc_claimAutoreleasedReturnValue(v75);
        uint64_t v77 = IMGetXPCDataFromDictionary(v6, "newNickname");
        v78 = (void *)objc_claimAutoreleasedReturnValue(v77);
        v79 = (void *)objc_claimAutoreleasedReturnValue( +[IMTransferAgentNicknameController sharedInstance]( &OBJC_CLASS___IMTransferAgentNicknameController,  "sharedInstance"));
        uint64_t v80 = im_primary_queue();
        v81 = (void *)objc_claimAutoreleasedReturnValue(v80);
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&buf[8] = 3221225472LL;
        *(void *)&uint8_t buf[16] = sub_100006684;
        v127 = &unk_100008418;
        v128 = v6;
        xpc_connection_t v129 = connection;
        v130 = &stru_100008350;
        [v79 setPersonalNicknameData:v78 oldRecordID:v76 queue:v81 completionBlock:buf];

        break;
      case 4LL:
        uint64_t v82 = IMOSLoggingEnabled(v7);
        if ((_DWORD)v82)
        {
          uint64_t v83 = OSLogHandleForIMFoundationCategory("IMTransferAgent");
          v84 = (os_log_s *)objc_claimAutoreleasedReturnValue(v83);
          if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = qos_class_self();
            _os_log_impl( (void *)&_mh_execute_header,  v84,  OS_LOG_TYPE_INFO,  "Handling nickname delete message at qos (%u)",  buf,  8u);
          }
        }

        if (IMOSLoggingEnabled(v82))
        {
          uint64_t v85 = OSLogHandleForIMFoundationCategory("IMTransferAgent_Nickname");
          v86 = (os_log_s *)objc_claimAutoreleasedReturnValue(v85);
          if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v86,  OS_LOG_TYPE_INFO,  "Transfer agent received nickname delete message",  buf,  2u);
          }
        }

        v87 = (void *)objc_claimAutoreleasedReturnValue( +[IMTransferAgentNicknameController sharedInstance]( &OBJC_CLASS___IMTransferAgentNicknameController,  "sharedInstance"));
        uint64_t v88 = im_primary_queue();
        v89 = (void *)objc_claimAutoreleasedReturnValue(v88);
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&buf[8] = 3221225472LL;
        *(void *)&uint8_t buf[16] = sub_1000068B8;
        v127 = &unk_100008440;
        v128 = v6;
        xpc_connection_t v129 = connection;
        v130 = &stru_100008350;
        [v87 deleteAllPersonalNicknamesOnQueue:v89 withCompletion:buf];

        break;
      case 5LL:
        if (IMOSLoggingEnabled(v7))
        {
          uint64_t v90 = OSLogHandleForIMFoundationCategory("IMTransferAgent");
          v91 = (os_log_s *)objc_claimAutoreleasedReturnValue(v90);
          if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = qos_class_self();
            _os_log_impl( (void *)&_mh_execute_header,  v91,  OS_LOG_TYPE_INFO,  "Transfer agent received prewarm message at qos (%u)",  buf,  8u);
          }
        }

        v92 = (void *)objc_claimAutoreleasedReturnValue( +[IMTransferAgentController sharedInstance]( &OBJC_CLASS___IMTransferAgentController,  "sharedInstance"));
        [v92 warm];

        v93 = (void *)objc_claimAutoreleasedReturnValue( +[IMTransferAgentIDSInterface sharedInstance]( &OBJC_CLASS___IMTransferAgentIDSInterface,  "sharedInstance"));
        [v93 decrementTransferCount];

        break;
      case 6LL:
        if (IMOSLoggingEnabled(v7))
        {
          uint64_t v94 = OSLogHandleForIMFoundationCategory("IMTransferAgent");
          v95 = (os_log_s *)objc_claimAutoreleasedReturnValue(v94);
          if (os_log_type_enabled(v95, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = qos_class_self();
            _os_log_impl( (void *)&_mh_execute_header,  v95,  OS_LOG_TYPE_INFO,  "Handling cancel upload message at qos (%u)",  buf,  8u);
          }
        }

        uint64_t v96 = IMGetXPCStringFromDictionary(v6, "transferID");
        v97 = (void *)objc_claimAutoreleasedReturnValue(v96);
        v98 = (void *)objc_claimAutoreleasedReturnValue( +[IMTransferAgentController sharedInstance]( &OBJC_CLASS___IMTransferAgentController,  "sharedInstance"));
        [v98 cancelSendTransferID:v97];

        v99 = (void *)objc_claimAutoreleasedReturnValue( +[IMTransferAgentIDSInterface sharedInstance]( &OBJC_CLASS___IMTransferAgentIDSInterface,  "sharedInstance"));
        [v99 decrementTransferCount];

        break;
      case 7LL:
      case 8LL:
        xpc_object_t reply = xpc_dictionary_create_reply(v6);
        v9 = reply;
        if (reply)
        {
          IMInsertNSStringsToXPCDictionary(reply, "error");
          xpc_connection_send_message(connection, v9);
        }

        break;
      default:
        break;
    }
  }
}

void sub_100005C60(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x100005234LL);
  }

  _Unwind_Resume(a1);
}

void sub_100005DC8(id a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue(+[IMTransferAgentIDSInterface sharedInstance](&OBJC_CLASS___IMTransferAgentIDSInterface, "sharedInstance"));
  [v1 decrementTransferCount];
}

void sub_100005DFC(uint64_t a1, int64_t a2, int64_t a3, int64_t a4)
{
  xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (IMOSLoggingEnabled())
  {
    uint64_t v9 = OSLogHandleForIMFoundationCategory("Transfer");
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = 134218240;
      int64_t v12 = a2;
      __int16 v13 = 2048;
      int64_t v14 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "Download progress update (%llu of %llu)",  (uint8_t *)&v11,  0x16u);
    }
  }

  if (v8)
  {
    xpc_dictionary_set_int64(v8, "__message_type__", 1LL);
    xpc_dictionary_set_int64(v8, "transferredBytes", a2);
    xpc_dictionary_set_int64(v8, "totalBytes", a3);
    xpc_dictionary_set_int64(v8, "transferSpeed", a4);
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), v8);
  }
}

void sub_100005F68(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  id v10 = a2;
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if (IMOSLoggingEnabled(v13))
  {
    uint64_t v14 = OSLogHandleForIMFoundationCategory("IMTransferAgent");
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      qos_class_t v19 = qos_class_self();
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "Handling download completion at qos (%u)",  buf,  8u);
    }
  }

  if (*(void *)(a1 + 56) != -1LL) {
    sandbox_extension_release();
  }
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  if (reply)
  {
    [v10 UTF8String];
    [v11 UTF8String];
    [v13 UTF8String];
    IMInsertStringsToXPCDictionary(reply, "transferID");
    IMInsertBoolsToXPCDictionary(reply, "success");
    IMInsertCodableObjectsToXPCDictionary(reply, "error");
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), reply);
  }

  (*(void (**)(void, uint64_t))(*(void *)(a1 + 48) + 16LL))(*(void *)(a1 + 48), v16);
}

void sub_100006158(uint64_t a1, int64_t a2, int64_t a3, int64_t a4)
{
  xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (IMOSLoggingEnabled())
  {
    uint64_t v9 = OSLogHandleForIMFoundationCategory("Transfer");
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = 134218240;
      int64_t v12 = a2;
      __int16 v13 = 2048;
      int64_t v14 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "Update progress update (%llu of %llu)",  (uint8_t *)&v11,  0x16u);
    }
  }

  if (v8)
  {
    xpc_dictionary_set_int64(v8, "__message_type__", 1LL);
    xpc_dictionary_set_int64(v8, "transferredBytes", a2);
    xpc_dictionary_set_int64(v8, "totalBytes", a3);
    xpc_dictionary_set_int64(v8, "transferSpeed", a4);
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), v8);
  }
}

void sub_1000062C4( uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8, void *a9, void *a10)
{
  id v29 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = a10;
  if (IMOSLoggingEnabled(v20))
  {
    uint64_t v21 = OSLogHandleForIMFoundationCategory("IMTransferAgent");
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      qos_class_t v31 = qos_class_self();
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "Handling upload completion at qos (%u)",  buf,  8u);
    }
  }

  if (*(void *)(a1 + 56) != -1LL) {
    sandbox_extension_release();
  }
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  if (reply)
  {
    [v16 UTF8String];
    [v18 UTF8String];
    [v20 UTF8String];
    IMInsertStringsToXPCDictionary(reply, "ownerID");
    IMInsertDatasToXPCDictionary(reply, "signature");
    if (v15) {
      IMInsertDatasToXPCDictionary(reply, "encryptionKey");
    }
    IMInsertBoolsToXPCDictionary(reply, "success");
    IMInsertIntsToXPCDictionary(reply, "fileSize");
    IMInsertCodableObjectsToXPCDictionary(reply, "error");
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), reply);
  }

  (*(void (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16LL))( *(void *)(a1 + 48),  v23,  v24,  v25,  v26,  v27);
}

void sub_100006530(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory("IMTransferAgent");
    xpc_object_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      qos_class_t v12 = qos_class_self();
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Handling nickname download completion at qos (%u)",  buf,  8u);
    }
  }

  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  id v10 = reply;
  if (reply)
  {
    if (v5)
    {
      IMInsertKeyedCodableObjectsToXPCDictionary(reply, "nickname");
    }

    else if (v6)
    {
      IMInsertKeyedCodableObjectsToXPCDictionary(reply, "error");
    }

    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), v10);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void sub_100006684( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8, void *a9)
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  if (IMOSLoggingEnabled())
  {
    uint64_t v22 = OSLogHandleForIMFoundationCategory("IMTransferAgent");
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      qos_class_t v27 = qos_class_self();
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "Handling nickname upload completion at qos (%u)",  buf,  8u);
    }
  }

  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  uint64_t v25 = reply;
  if (reply)
  {
    IMInsertBoolsToXPCDictionary(reply, "created");
    IMInsertNSStringsToXPCDictionary(v25, "nicknameLocation");
    IMInsertDatasToXPCDictionary(v25, "key");
    IMInsertDatasToXPCDictionary(v25, "wallpaperDataTag");
    IMInsertDatasToXPCDictionary(v25, "lowResWallpaperTag");
    IMInsertDatasToXPCDictionary(v25, "wallpaperMetadataTag");
    IMInsertKeyedCodableObjectsToXPCDictionary(v25, "uploadedNickname");
    if (v21) {
      IMInsertCodableObjectsToXPCDictionary(v25, "error");
    }
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), v25);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void sub_1000068B8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory("IMTransferAgent");
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      qos_class_t v11 = qos_class_self();
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Handling nickname delete completion at qos (%u)",  buf,  8u);
    }
  }

  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  uint64_t v9 = reply;
  if (reply)
  {
    IMInsertBoolsToXPCDictionary(reply, "successDeleting");
    if (v4) {
      IMInsertCodableObjectsToXPCDictionary(v9, "error");
    }
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), v9);
  }

  (*(void (**)(void, uint64_t))(*(void *)(a1 + 48) + 16LL))(*(void *)(a1 + 48), v8);
}

id objc_msgSend_getNicknameWithRecordID_decryptionKey_wallpaperDataTag_wallpaperLowResDataTag_wallpaperMetadataTag_knownSender_shouldDecodeImageFields_queue_completionBlock_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "getNicknameWithRecordID:decryptionKey:wallpaperDataTag:wallpaperLowResDataTag:wallpaperMetadataTag:knownSende r:shouldDecodeImageFields:queue:completionBlock:");
}

id objc_msgSend_receiveFileTransfer_topic_path_requestURLString_ownerID_signature_fileSize_decryptionKey_sourceAppID_progressBlock_completionBlock_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "receiveFileTransfer:topic:path:requestURLString:ownerID:signature:fileSize:decryptionKey:sourceAppID:progress Block:completionBlock:");
}

id objc_msgSend_sendFilePath_encrypt_topic_transferID_sourceAppID_userInfo_progressBlock_completionBlock_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendFilePath:encrypt:topic:transferID:sourceAppID:userInfo:progressBlock:completionBlock:");
}

id objc_msgSend_warm(void *a1, const char *a2, ...)
{
  return [a1 warm];
}