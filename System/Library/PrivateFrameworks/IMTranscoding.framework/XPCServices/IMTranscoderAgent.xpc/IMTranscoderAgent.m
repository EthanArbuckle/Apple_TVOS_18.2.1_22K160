uint64_t start()
{
  uint64_t v0;
  void *v1;
  id v2;
  int v3;
  v0 = xpc_track_activity();
  IMSetEmbeddedTempDirectory(v0);
  v1 = objc_autoreleasePoolPush();
  v2 = objc_msgSend( +[IMImagePreviewGenerator UTITypes](IMImagePreviewGenerator, "UTITypes"),  "mutableCopy");
  objc_msgSend( v2,  "addObjectsFromArray:",  +[IMAnimatedImagePreviewGenerator UTITypes](IMAnimatedImagePreviewGenerator, "UTITypes"));
  v3 = CGImageSourceSetAllowableTypes(v2);

  objc_autoreleasePoolPop(v1);
  if (!v3) {
    xpc_main((xpc_connection_handler_t)sub_100003F14);
  }
  return 1LL;
}

void sub_100003F14(xpc_connection_t connection)
{
  if (qword_10000C0E8 != -1) {
    dispatch_once(&qword_10000C0E8, &stru_1000082A8);
  }
  xpc_connection_set_target_queue(connection, (dispatch_queue_t)qword_10000C0E0);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100003FDC;
  handler[3] = &unk_1000082F8;
  handler[4] = connection;
  xpc_connection_set_event_handler(connection, handler);
  xpc_connection_resume(connection);
}

void sub_100003FB4(id a1)
{
  qword_10000C0E0 = (uint64_t)dispatch_queue_create("IMTranscoderPeerConnectionQueue", 0LL);
}

void sub_100003FDC(uint64_t a1, uint64_t a2)
{
  uint64_t HasEntitlement = IMDAuditTokenTaskHasEntitlement(v15, @"com.apple.private.imcore.imtranscoderservice");
  if ((_DWORD)HasEntitlement)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1000041A4;
    v14[3] = &unk_1000082D0;
    v14[4] = *(void *)(a1 + 32);
    v14[5] = a2;
    v16[0] = 0LL;
    v16[1] = 0LL;
    uint64_t v10 = pthread_main_thread_np(HasEntitlement, v5, v6, v7, v8, v9);
    pthread_dependency_init_np(v16, v10, 0LL);
    *(void *)block = _NSConcreteStackBlock;
    *(void *)&block[8] = 3221225472LL;
    *(void *)&block[16] = sub_100004F18;
    v18 = &unk_100008320;
    v19 = v14;
    v20 = v16;
    dispatch_async(&_dispatch_main_q, block);
    pthread_dependency_wait_np(v16);
  }

  else
  {
    uint64_t pid = xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 32));
    if (IMOSLoggingEnabled(pid))
    {
      v12 = (os_log_s *)OSLogHandleForIMFoundationCategory("Warning");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        uint64_t v13 = IMProcessNameForPid(pid);
        *(_DWORD *)block = 138412802;
        *(void *)&block[4] = @"com.apple.private.imcore.imtranscoderservice";
        *(_WORD *)&block[12] = 2112;
        *(void *)&block[14] = v13;
        *(_WORD *)&block[22] = 1024;
        LODWORD(v18) = pid;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "Denying xpc connection, task does not have entitlement: %@  (%@:%d)",  block,  0x1Cu);
      }
    }

    xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
  }
}

void sub_1000041A4(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  xpc_type_t type = xpc_get_type(v2);
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (v2 == &_xpc_error_termination_imminent) {
      uint64_t v10 = @"Termination Imminent";
    }
    else {
      uint64_t v10 = @"unknown";
    }
    if (v2 == &_xpc_error_connection_invalid) {
      v11 = @"Connection Invalid";
    }
    else {
      v11 = v10;
    }
    if (IMOSLoggingEnabled(type))
    {
      v12 = (os_log_s *)OSLogHandleForIMFoundationCategory("Transcoding");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v11;
        uint64_t v13 = "received error: %@";
        v14 = v12;
        uint32_t v15 = 12;
LABEL_24:
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, v13, (uint8_t *)&buf, v15);
      }
    }
  }

  else
  {
    xpc_retain(v2);
    xpc_object_t v4 = xpc_retain(v1);
    if (IMOSLoggingEnabled(v4))
    {
      uint64_t v5 = (os_log_s *)OSLogHandleForIMFoundationCategory("Transcoding");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 67109120;
        DWORD1(buf) = xpc_connection_get_pid((xpc_connection_t)v1);
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "received message from peer(%d)",  (uint8_t *)&buf,  8u);
      }
    }

    if (qword_10000C0F8 != -1) {
      dispatch_once(&qword_10000C0F8, &stru_100008340);
    }
    if (qword_10000C108 != -1) {
      dispatch_once(&qword_10000C108, &stru_100008360);
    }
    uint64_t v6 = IMGetXPCIntFromDictionary(v2, "message_type");
    int v7 = v6;
    uint64_t v8 = IMOSLoggingEnabled(v6);
    if ((_DWORD)v8)
    {
      uint64_t v9 = (os_log_s *)OSLogHandleForIMFoundationCategory("Transcoding");
      uint64_t v8 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
      if ((_DWORD)v8)
      {
        LODWORD(buf) = 67109120;
        DWORD1(buf) = v7;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Message type received %d", (uint8_t *)&buf, 8u);
      }
    }

    switch(v7)
    {
      case 0:
        queue = (dispatch_queue_s *)qword_10000C0F0;
        v85 = (void *)IMGetXPCStringFromDictionary(v2, "balloonBundleID");
        if ([v85 length]) {
          uint64_t v84 = IMGetXPCDataFromDictionary(v2, "payloadData");
        }
        else {
          uint64_t v84 = 0LL;
        }
        uint64_t v81 = IMGetXPCArrayFromDictionary(v2, "attachments");
        char v80 = IMGetXPCBoolFromDictionary(v2, "fallback");
        char v79 = IMGetXPCBoolFromDictionary(v2, "isLQMEnabled");
        uint64_t v78 = IMGetXPCArrayFromDictionary(v2, "sizes");
        uint64_t v77 = IMGetXPCDictionaryFromDictionary(v2, "commonCapabilities");
        int v76 = IMGetXPCIntFromDictionary(v2, "reps");
        int v75 = IMGetXPCIntFromDictionary(v2, "maxDimension");
        uint64_t v83 = IMGetXPCIntFromDictionary(v2, "target");
        id v60 = -[NSUserDefaults objectForKey:]( +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"),  "objectForKey:",  @"ForceTargetType");
        if (v60)
        {
          unsigned int v61 = [v60 intValue];
          if (v61 < 3) {
            uint64_t v83 = v61;
          }
        }

        v62 = (const __CFString *)IMGetXPCStringFromDictionary(v2, "UTI");
        v63 = (void *)IMGetXPCStringFromDictionary(v2, "transferURL");
        char v74 = IMGetXPCBoolFromDictionary(v2, "isSticker");
        if ((objc_msgSend(objc_msgSend(v63, "pathExtension"), "isEqualToIgnoringCase:", @"wbmp") & 1) != 0
          || objc_msgSend(objc_msgSend(v63, "pathExtension"), "isEqualToIgnoringCase:", @"bmp"))
        {
          v62 = @"________WBMP_________";
        }

        uint64_t v64 = IMGetXPCCodableFromDictionaryWithStandardAllowlist(v2, "allowUnfilteredUTIs");
        uint64_t v65 = IMGetXPCDictionaryFromDictionary(v2, "transcoderUserInfo");
        uint64_t v66 = sub_100004FD8((uint64_t)v2, (uint64_t)"read-extension");
        uint64_t v67 = os_transaction_create("_IMTranscoderAgent_TranscodeAttachment");
        aBlock = _NSConcreteStackBlock;
        uint64_t v87 = 3221225472LL;
        v88 = sub_10000510C;
        v89 = &unk_1000083B0;
        uint64_t v90 = (uint64_t)v2;
        uint64_t v91 = (uint64_t)v63;
        uint64_t v93 = v67;
        uint64_t v94 = v66;
        uint64_t v92 = (uint64_t)v1;
        v68 = _Block_copy(&aBlock);
        *(void *)&__int128 v112 = _NSConcreteStackBlock;
        *((void *)&v112 + 1) = 3221225472LL;
        *(void *)&__int128 v113 = sub_100005454;
        *((void *)&v113 + 1) = &unk_100008400;
        v114 = v2;
        v115 = v63;
        v116 = v1;
        uint64_t v117 = v67;
        v69 = _Block_copy(&v112);
        *(void *)&__int128 buf = _NSConcreteStackBlock;
        *((void *)&buf + 1) = 3221225472LL;
        v97 = sub_10000562C;
        v98 = &unk_100008428;
        uint64_t v99 = (uint64_t)v63;
        uint64_t v100 = v84;
        char v108 = v80;
        BOOL v109 = v84 != 0;
        *(void *)&__int128 v101 = v81;
        *((void *)&v101 + 1) = v62;
        char v110 = v74;
        *(void *)v102 = v64;
        *(void *)&v102[8] = v78;
        *(void *)&v102[16] = v77;
        *(void *)&v102[24] = v65;
        int v106 = v75;
        int v107 = v76;
        char v111 = v79;
        *(void *)&v102[32] = v85;
        v103 = v68;
        v104 = v69;
        uint64_t v105 = v83;
        dispatch_async(queue, &buf);

        break;
      case 1:
        v17 = (dispatch_queue_s *)qword_10000C100;
        uint64_t v18 = IMGetXPCCodableFromDictionaryWithStandardAllowlist(v2, "transferURL");
        uint64_t v19 = IMGetXPCDictionaryFromDictionary(v2, "constraints");
        v114 = 0LL;
        __int128 v112 = 0u;
        __int128 v113 = 0u;
        IMPreviewConstraintsFromDictionary(&v112, v19);
        uint64_t v20 = sub_100004FD8((uint64_t)v2, (uint64_t)"read-extension");
        aBlock = _NSConcreteStackBlock;
        uint64_t v87 = 3221225472LL;
        v88 = sub_1000057F0;
        v89 = &unk_1000084A0;
        uint64_t v90 = (uint64_t)v2;
        uint64_t v91 = v18;
        uint64_t v93 = os_transaction_create("_IMTranscoderAgent_GenerateSafeRender");
        uint64_t v94 = v20;
        uint64_t v92 = (uint64_t)v1;
        v21 = _Block_copy(&aBlock);
        *(void *)&__int128 buf = _NSConcreteStackBlock;
        *((void *)&buf + 1) = 3221225472LL;
        v97 = sub_1000059D0;
        v98 = &unk_1000084C8;
        __int128 v101 = v112;
        *(_OWORD *)v102 = v113;
        *(void *)&v102[16] = v114;
        uint64_t v99 = v18;
        uint64_t v100 = (uint64_t)v21;
        dispatch_async(v17, &buf);

        break;
      case 2:
        v22 = (dispatch_queue_s *)qword_10000C0F0;
        uint64_t v23 = IMGetXPCStringFromDictionary(v2, "messageGUID");
        v24 = (void *)IMGetXPCStringFromDictionary(v2, "balloonBundleID");
        if ([v24 length]) {
          v25 = -[NSURL initWithString:]( objc_alloc(&OBJC_CLASS___NSURL),  "initWithString:",  IMGetXPCStringFromDictionary(v2, "payloadURL"));
        }
        else {
          v25 = 0LL;
        }
        *(void *)&__int128 v112 = objc_opt_class(&OBJC_CLASS___IMSenderContext);
        uint64_t v70 = IMGetXPCKeyedCodableFromDictionaryWithSecureCodingAllowedClasses( v2,  "senderContext",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v112, 1LL));
        uint64_t v71 = sub_100004FD8((uint64_t)v2, (uint64_t)"read-extension");
        uint64_t v72 = os_transaction_create("_IMTranscoderAgent_GenerateSnapshot");
        *(void *)&__int128 buf = _NSConcreteStackBlock;
        *((void *)&buf + 1) = 3221225472LL;
        v97 = sub_100005ABC;
        v98 = &unk_100008518;
        uint64_t v99 = (uint64_t)v2;
        uint64_t v100 = v23;
        *((void *)&v101 + 1) = v72;
        *(void *)v102 = v71;
        *(void *)&__int128 v101 = v1;
        v73 = _Block_copy(&buf);
        aBlock = _NSConcreteStackBlock;
        uint64_t v87 = 3221225472LL;
        v88 = sub_100005C98;
        v89 = &unk_100008540;
        uint64_t v90 = v23;
        uint64_t v91 = (uint64_t)v25;
        uint64_t v92 = (uint64_t)v24;
        uint64_t v93 = v70;
        uint64_t v94 = (uint64_t)v73;
        dispatch_async(v22, &aBlock);

        break;
      case 3:
        v26 = (dispatch_queue_s *)qword_10000C100;
        uint64_t v27 = IMGetXPCStringFromDictionary(v2, "sourceURL");
        uint64_t v28 = IMGetXPCStringFromDictionary(v2, "previewURL");
        uint64_t v29 = IMGetXPCStringFromDictionary(v2, "balloonBundleID");
        v30 = +[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v27);
        v31 = +[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v28);
        uint64_t v118 = objc_opt_class(&OBJC_CLASS___IMSenderContext);
        uint64_t v32 = IMGetXPCKeyedCodableFromDictionaryWithSecureCodingAllowedClasses( v2,  "senderContext",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v118, 1LL));
        uint64_t v33 = sub_100004FD8((uint64_t)v2, (uint64_t)"write-extension");
        uint64_t v34 = sub_100004FD8((uint64_t)v2, (uint64_t)"read-extension");
        uint64_t v35 = IMGetXPCDictionaryFromDictionary(v2, "constraints");
        v114 = 0LL;
        __int128 v112 = 0u;
        __int128 v113 = 0u;
        IMPreviewConstraintsFromDictionary(&v112, v35);
        aBlock = _NSConcreteStackBlock;
        uint64_t v87 = 3221225472LL;
        v88 = sub_100005D78;
        v89 = &unk_100008590;
        uint64_t v90 = (uint64_t)v2;
        uint64_t v91 = (uint64_t)v30;
        uint64_t v94 = v33;
        uint64_t v95 = v34;
        uint64_t v92 = (uint64_t)v1;
        uint64_t v93 = os_transaction_create("_IMTranscoderAgent_GeneratePreview");
        v36 = _Block_copy(&aBlock);
        *((void *)&buf + 1) = 3221225472LL;
        *(_OWORD *)&v102[8] = v112;
        *(void *)&__int128 buf = _NSConcreteStackBlock;
        v97 = sub_100005FAC;
        v98 = &unk_1000085B8;
        uint64_t v99 = (uint64_t)v30;
        uint64_t v100 = (uint64_t)v31;
        *(void *)&__int128 v101 = v32;
        *((void *)&v101 + 1) = v29;
        *(_OWORD *)&v102[24] = v113;
        v103 = v114;
        *(void *)v102 = v36;
        dispatch_sync(v26, &buf);

        break;
      case 5:
        v37 = (dispatch_queue_s *)qword_10000C100;
        uint64_t v38 = IMGetXPCStringFromDictionary(v2, "sourceURL");
        uint64_t v39 = IMGetXPCStringFromDictionary(v2, "bundleID");
        v40 = +[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v38);
        *(void *)&__int128 v112 = objc_opt_class(&OBJC_CLASS___IMSenderContext);
        uint64_t v41 = IMGetXPCKeyedCodableFromDictionaryWithSecureCodingAllowedClasses( v2,  "senderContext",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v112, 1LL));
        uint64_t v42 = sub_100004FD8((uint64_t)v2, (uint64_t)"read-extension");
        uint64_t v43 = os_transaction_create("_IMTranscoderAgent_iMessageAppPayload");
        *(void *)&__int128 buf = _NSConcreteStackBlock;
        *((void *)&buf + 1) = 3221225472LL;
        v97 = sub_1000063C8;
        v98 = &unk_100008670;
        uint64_t v99 = (uint64_t)v2;
        uint64_t v100 = (uint64_t)v40;
        *(void *)&__int128 v101 = v39;
        *((void *)&v101 + 1) = v1;
        *(void *)v102 = v43;
        *(void *)&v102[8] = v42;
        id v44 = [&buf copy];
        aBlock = _NSConcreteStackBlock;
        uint64_t v87 = 3221225472LL;
        v88 = sub_1000065CC;
        v89 = &unk_100008698;
        uint64_t v90 = (uint64_t)v40;
        uint64_t v91 = v39;
        uint64_t v92 = v41;
        uint64_t v93 = (uint64_t)v44;
        dispatch_sync(v37, &aBlock);

        break;
      case 6:
        v45 = (dispatch_queue_s *)qword_10000C100;
        uint64_t v46 = IMGetXPCStringFromDictionary(v2, "sourceURL");
        uint64_t v47 = IMGetXPCStringFromDictionary(v2, "destinationURL");
        v48 = +[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v46);
        v49 = +[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v47);
        uint64_t v118 = objc_opt_class(&OBJC_CLASS___IMSenderContext);
        uint64_t v50 = IMGetXPCKeyedCodableFromDictionaryWithSecureCodingAllowedClasses( v2,  "senderContext",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v118, 1LL));
        uint64_t v51 = sub_100004FD8((uint64_t)v2, (uint64_t)"write-extension");
        uint64_t v52 = sub_100004FD8((uint64_t)v2, (uint64_t)"read-extension");
        uint64_t v53 = IMGetXPCDictionaryFromDictionary(v2, "constraints");
        v114 = 0LL;
        __int128 v112 = 0u;
        __int128 v113 = 0u;
        IMPreviewConstraintsFromDictionary(&v112, v53);
        aBlock = _NSConcreteStackBlock;
        uint64_t v87 = 3221225472LL;
        v88 = sub_1000060A4;
        v89 = &unk_100008590;
        uint64_t v90 = (uint64_t)v2;
        uint64_t v91 = (uint64_t)v48;
        uint64_t v94 = v51;
        uint64_t v95 = v52;
        uint64_t v92 = (uint64_t)v1;
        uint64_t v93 = os_transaction_create("_IMTranscoderAgent_GenerateMetadata");
        v54 = _Block_copy(&aBlock);
        *(void *)&__int128 buf = _NSConcreteStackBlock;
        *((void *)&buf + 1) = 3221225472LL;
        v97 = sub_1000062D8;
        v98 = &unk_1000085E0;
        uint64_t v99 = (uint64_t)v48;
        uint64_t v100 = (uint64_t)v49;
        *(_OWORD *)v102 = v112;
        *(_OWORD *)&v102[16] = v113;
        *(void *)&v102[32] = v114;
        *(void *)&__int128 v101 = v50;
        *((void *)&v101 + 1) = v54;
        dispatch_sync(v45, &buf);

        break;
      case 7:
        v55 = (dispatch_queue_s *)qword_10000C0F0;
        v56 = +[NSURL URLWithString:]( &OBJC_CLASS___NSURL,  "URLWithString:",  IMGetXPCStringFromDictionary(v2, "transferURL"));
        uint64_t v57 = sub_100004FD8((uint64_t)v2, (uint64_t)"read-extension");
        uint64_t v58 = os_transaction_create("_IMTranscoderAgent_GenerateTranscriptionForAudioMessage");
        *(void *)&__int128 buf = _NSConcreteStackBlock;
        *((void *)&buf + 1) = 3221225472LL;
        v97 = sub_1000066B4;
        v98 = &unk_1000086C0;
        uint64_t v99 = (uint64_t)v2;
        uint64_t v100 = (uint64_t)v1;
        *(void *)&__int128 v101 = v58;
        *((void *)&v101 + 1) = v57;
        v59 = _Block_copy(&buf);
        aBlock = _NSConcreteStackBlock;
        uint64_t v87 = 3221225472LL;
        v88 = sub_100006754;
        v89 = &unk_1000086E8;
        uint64_t v90 = (uint64_t)v56;
        uint64_t v91 = (uint64_t)v59;
        dispatch_async(v55, &aBlock);

        break;
      default:
        if (IMOSLoggingEnabled(v8))
        {
          v16 = (os_log_s *)OSLogHandleForIMFoundationCategory("Warning");
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            LODWORD(buf) = 67109120;
            DWORD1(buf) = v7;
            uint64_t v13 = "We got a transcoder message type that is undefined: %d";
            v14 = v16;
            uint32_t v15 = 8;
            goto LABEL_24;
          }
        }

        break;
    }
  }

uint64_t sub_100004F18(uint64_t a1)
{
  return pthread_dependency_fulfill_np(*(void *)(a1 + 40), 0LL);
}

void sub_100004F48(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("IMTranscoderBackgroundPriorityQueue", 0LL);
  qword_10000C0F0 = (uint64_t)v1;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(-2LL, 0LL);
  dispatch_set_target_queue(v1, global_queue);
}

void sub_100004F90(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("IMTranscoderNormalPriorityQueue", 0LL);
  qword_10000C100 = (uint64_t)v1;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  dispatch_set_target_queue(v1, global_queue);
}

uint64_t sub_100004FD8(uint64_t a1, uint64_t a2)
{
  v3 = (void *)IMGetXPCStringFromDictionary();
  if (![v3 length])
  {
    uint64_t v5 = (os_log_s *)OSLogHandleForIMFoundationCategory("Warning");
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
      return -1LL;
    }
    int v7 = 136315138;
    uint64_t v8 = a2;
    uint64_t v6 = "Did not receive valid sandbox extension for key %s";
    goto LABEL_9;
  }

  uint64_t result = sandbox_extension_consume([v3 UTF8String]);
  if (result != -1) {
    return result;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = (os_log_s *)OSLogHandleForIMFoundationCategory("Warning");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315138;
      uint64_t v8 = a2;
      uint64_t v6 = "Failed to consume sandbox extension for key %s";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, v6, (uint8_t *)&v7, 0xCu);
    }
  }

  return -1LL;
}

void sub_10000510C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, char a7, uint64_t a8)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100005188;
  block[3] = &unk_100008388;
  block[4] = *(void *)(a1 + 32);
  block[5] = a2;
  char v13 = a6;
  char v14 = a7;
  block[6] = a3;
  block[7] = a5;
  block[8] = a4;
  block[9] = a8;
  __int128 v10 = *(_OWORD *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 64);
  uint64_t v11 = *(void *)(a1 + 56);
  uint64_t v12 = v8;
  dispatch_async(&_dispatch_main_q, block);
}

void sub_100005188(uint64_t a1)
{
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "path"), "UTF8String");
  IMInsertStringsToXPCDictionary(reply, "transferURL");
  IMInsertBoolsToXPCDictionary(reply, "success");
  IMInsertCodableObjectsToXPCDictionary(reply, "outputURLs");
  IMInsertCodableObjectsToXPCDictionary(reply, "contexts");
  uint64_t v3 = IMInsertCodableObjectsToXPCDictionary(reply, "additionalContext");
  if (IMOSLoggingEnabled(v3))
  {
    xpc_object_t v4 = (os_log_s *)OSLogHandleForIMFoundationCategory("Transcoding");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(a1 + 72);
      uint64_t v5 = *(void *)(a1 + 80);
      *(_DWORD *)__int128 buf = 138412546;
      uint64_t v8 = v5;
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "Handled TranscodeAttachment for %@ complete, additionalContext %@",  buf,  0x16u);
    }
  }

  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 88), reply);
  xpc_release(reply);
  xpc_release(*(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 88));
  sub_100005340(*(void *)(a1 + 104));
  sub_1000053E0(*(void *)(a1 + 96));
}

void sub_100005340(uint64_t a1)
{
  if (a1 >= 1 && sandbox_extension_release() == -1 && IMOSLoggingEnabled())
  {
    dispatch_queue_t v1 = (os_log_s *)OSLogHandleForIMFoundationCategory("Warning");
    if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v2 = 0;
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "Failed to release sandbox extension", v2, 2u);
    }
  }

void sub_1000053E0(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0LL, 100000000LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000057E8;
  block[3] = &unk_100008450;
  block[4] = a1;
  dispatch_after(v2, &_dispatch_main_q, block);
}

void sub_100005454(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, char a6)
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000054CC;
  v6[3] = &unk_1000083D8;
  v6[4] = *(void *)(a1 + 32);
  v6[5] = a2;
  v6[6] = a4;
  v6[7] = a3;
  char v9 = a5;
  char v10 = a6;
  __int128 v7 = *(_OWORD *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 56);
  dispatch_async(&_dispatch_main_q, v6);
}

void sub_1000054CC(uint64_t a1)
{
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  IMInsertCodableObjectsToXPCDictionary(reply, "outputURLs");
  uint64_t v3 = IMInsertBoolsToXPCDictionary(reply, "success");
  if (IMOSLoggingEnabled(v3))
  {
    xpc_object_t v4 = (os_log_s *)OSLogHandleForIMFoundationCategory("Transcoding");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 64);
      *(_DWORD *)__int128 buf = 138412290;
      uint64_t v7 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "Handled TranscodeAttachment for %@ via fallback",  buf,  0xCu);
    }
  }

  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 72), reply);
  xpc_release(reply);
  xpc_release(*(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 72));
  sub_1000053E0(*(void *)(a1 + 80));
}

id sub_10000562C(uint64_t a1)
{
  if (IMOSLoggingEnabled(a1))
  {
    dispatch_time_t v2 = (os_log_s *)OSLogHandleForIMFoundationCategory("IMTranscoder");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      id v4 = [*(id *)(a1 + 40) length];
      uint64_t v5 = @"YES";
      if (*(_BYTE *)(a1 + 136)) {
        uint64_t v6 = @"YES";
      }
      else {
        uint64_t v6 = @"NO";
      }
      uint64_t v7 = *(void *)(a1 + 48);
      if (!*(_BYTE *)(a1 + 137)) {
        uint64_t v5 = @"NO";
      }
      *(_DWORD *)__int128 buf = 138413314;
      uint64_t v16 = v3;
      __int16 v17 = 2048;
      id v18 = v4;
      __int16 v19 = 2112;
      uint64_t v20 = v6;
      __int16 v21 = 2112;
      v22 = v5;
      __int16 v23 = 2112;
      uint64_t v24 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_INFO,  "Handling TranscodeAttachment for %@ data length %lu shouldGenerateFallback %@ isBalloonWithData %@ attachments %@",  buf,  0x34u);
    }
  }

  BOOL v8 = *(_BYTE *)(a1 + 137) == 0;
  char v9 = +[IMTranscodingAgentController sharedInstance](&OBJC_CLASS___IMTranscodingAgentController, "sharedInstance");
  char v10 = v9;
  if (!v8) {
    return -[IMTranscodingAgentController transcodeFileTransferData:balloonBundleID:attachments:fallBack:completionBlock:]( v9,  "transcodeFileTransferData:balloonBundleID:attachments:fallBack:completionBlock:",  *(void *)(a1 + 40),  *(void *)(a1 + 96),  *(void *)(a1 + 48),  *(unsigned __int8 *)(a1 + 136),  *(void *)(a1 + 112));
  }
  uint64_t v12 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", *(void *)(a1 + 32));
  LOBYTE(v14) = *(_BYTE *)(a1 + 139);
  LOBYTE(v13) = *(_BYTE *)(a1 + 136);
  return -[IMTranscodingAgentController transcodeFileTransferContents:utiType:isSticker:allowUnfilteredUTIs:target:sizes:commonCapabilities:maxDimension:transcoderUserInfo:fallback:representations:isLQMEnabled:completionBlock:]( v10,  "transcodeFileTransferContents:utiType:isSticker:allowUnfilteredUTIs:target:sizes:commonCapabilities:maxDimens ion:transcoderUserInfo:fallback:representations:isLQMEnabled:completionBlock:",  v12,  *(void *)(a1 + 56),  *(unsigned __int8 *)(a1 + 138),  *(void *)(a1 + 64),  *(void *)(a1 + 120),  *(void *)(a1 + 72),  *(void *)(a1 + 80),  *(int *)(a1 + 128),  *(void *)(a1 + 88),  v13,  *(int *)(a1 + 132),  v14,  *(void *)(a1 + 104));
}

void sub_1000057E8(uint64_t a1)
{
}

void sub_1000057F0(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100005864;
  v6[3] = &unk_100008478;
  uint64_t v4 = *(void *)(a1 + 32);
  char v10 = a2;
  v6[4] = v4;
  v6[5] = a3;
  v6[6] = a4;
  __int128 v7 = *(_OWORD *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 56);
  uint64_t v9 = v5;
  dispatch_async(&_dispatch_main_q, v6);
}

void sub_100005864(uint64_t a1)
{
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  IMInsertBoolsToXPCDictionary(reply, "success");
  IMInsertCodableObjectsToXPCDictionary(reply, "previewURL");
  uint64_t v3 = IMInsertCodableObjectsToXPCDictionary(reply, "error");
  if (IMOSLoggingEnabled(v3))
  {
    uint64_t v4 = (os_log_s *)OSLogHandleForIMFoundationCategory("Lockdown");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(a1 + 48);
      uint64_t v5 = *(void *)(a1 + 56);
      uint64_t v7 = *(void *)(a1 + 40);
      *(_DWORD *)__int128 buf = 138412802;
      uint64_t v9 = v5;
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      __int16 v12 = 2112;
      uint64_t v13 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "Handled GenerateSafeRender for %@, previewURL: %@ error: %@",  buf,  0x20u);
    }
  }

  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 64), reply);
  xpc_release(reply);
  xpc_release(*(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 64));
  sub_100005340(*(void *)(a1 + 80));
  sub_1000053E0(*(void *)(a1 + 72));
}

id sub_1000059D0(uint64_t a1)
{
  if (IMOSLoggingEnabled(a1))
  {
    dispatch_time_t v2 = (os_log_s *)OSLogHandleForIMFoundationCategory("Lockdown");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      LODWORD(v9[0]) = 138412290;
      *(void *)((char *)v9 + 4) = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_INFO,  "Handling GenerateSafeRender for %@",  (uint8_t *)v9,  0xCu);
    }
  }

  uint64_t v4 = +[IMTranscodingAgentController sharedInstance](&OBJC_CLASS___IMTranscodingAgentController, "sharedInstance");
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  __int128 v7 = *(_OWORD *)(a1 + 64);
  v9[0] = *(_OWORD *)(a1 + 48);
  v9[1] = v7;
  uint64_t v10 = *(void *)(a1 + 80);
  return -[IMTranscodingAgentController generateSafeRender:constraints:completionBlock:]( v4,  "generateSafeRender:constraints:completionBlock:",  v5,  v9,  v6);
}

void sub_100005ABC(uint64_t a1, char a2, uint64_t a3)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100005B2C;
  block[3] = &unk_1000084F0;
  uint64_t v3 = *(void *)(a1 + 32);
  char v9 = a2;
  block[4] = v3;
  void block[5] = a3;
  __int128 v6 = *(_OWORD *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v8 = v4;
  dispatch_async(&_dispatch_main_q, block);
}

void sub_100005B2C(uint64_t a1)
{
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  IMInsertBoolsToXPCDictionary(reply, "success");
  uint64_t v3 = IMInsertCodableObjectsToXPCDictionary(reply, "error");
  if (IMOSLoggingEnabled(v3))
  {
    uint64_t v4 = (os_log_s *)OSLogHandleForIMFoundationCategory("Transcoding");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      if (*(_BYTE *)(a1 + 80)) {
        uint64_t v5 = @"YES";
      }
      else {
        uint64_t v5 = @"NO";
      }
      uint64_t v7 = *(void *)(a1 + 40);
      uint64_t v6 = *(void *)(a1 + 48);
      *(_DWORD *)__int128 buf = 138412802;
      uint64_t v9 = v6;
      __int16 v10 = 2112;
      uint64_t v11 = v5;
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "Handled GenerateSnapshot for %@, success: %@ snapshotError: %@",  buf,  0x20u);
    }
  }

  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 56), reply);
  xpc_release(reply);
  xpc_release(*(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 56));
  sub_100005340(*(void *)(a1 + 72));
  sub_1000053E0(*(void *)(a1 + 64));
}

id sub_100005C98(void *a1)
{
  if (IMOSLoggingEnabled(a1))
  {
    dispatch_time_t v2 = (os_log_s *)OSLogHandleForIMFoundationCategory("Transcoding");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = a1[4];
      int v5 = 138412290;
      uint64_t v6 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_INFO,  "Handling GenerateSnapshot for: %@",  (uint8_t *)&v5,  0xCu);
    }
  }

  return -[IMTranscodingAgentController generateSnapshotForMessageGUID:payloadURL:balloonBundleID:senderContext:completionBlock:]( +[IMTranscodingAgentController sharedInstance](&OBJC_CLASS___IMTranscodingAgentController, "sharedInstance"),  "generateSnapshotForMessageGUID:payloadURL:balloonBundleID:senderContext:completionBlock:",  a1[4],  a1[5],  a1[6],  a1[7],  a1[8]);
}

void sub_100005D78(uint64_t a1, char a2, uint64_t a3, double a4, double a5)
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100005DF4;
  v6[3] = &unk_100008568;
  uint64_t v5 = *(void *)(a1 + 32);
  char v12 = a2;
  v6[4] = v5;
  v6[5] = a3;
  double v9 = a4;
  double v10 = a5;
  __int128 v7 = *(_OWORD *)(a1 + 40);
  __int128 v11 = *(_OWORD *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 56);
  dispatch_async(&_dispatch_main_q, v6);
}

void sub_100005DF4(uint64_t a1)
{
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  IMInsertBoolsToXPCDictionary(reply, "success");
  uint64_t v9 = *(void *)(a1 + 40);
  IMInsertCodableObjectsToXPCDictionary(reply, "error");
  *(_OWORD *)__int128 buf = *(_OWORD *)(a1 + 72);
  +[NSValue valueWithBytes:objCType:](&OBJC_CLASS___NSValue, "valueWithBytes:objCType:", buf, "{CGSize=dd}", v9, 0LL);
  uint64_t v3 = IMInsertCodableObjectsToXPCDictionary(reply, "size");
  if (IMOSLoggingEnabled(v3))
  {
    uint64_t v4 = (os_log_s *)OSLogHandleForIMFoundationCategory("Transcoding");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 48);
      if (*(_BYTE *)(a1 + 104)) {
        uint64_t v6 = @"YES";
      }
      else {
        uint64_t v6 = @"NO";
      }
      uint64_t v7 = *(void *)(a1 + 72);
      uint64_t v8 = *(void *)(a1 + 80);
      *(_DWORD *)__int128 buf = 138413058;
      *(void *)&uint8_t buf[4] = v5;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v6;
      __int16 v11 = 2048;
      uint64_t v12 = v7;
      __int16 v13 = 2048;
      uint64_t v14 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "Handled GeneratePreview for %@, success: %@ size: (%f, %f)",  buf,  0x2Au);
    }
  }

  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 56), reply);
  xpc_release(reply);
  xpc_release(*(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 56));
  sub_100005340(*(void *)(a1 + 88));
  sub_100005340(*(void *)(a1 + 96));
  sub_1000053E0(*(void *)(a1 + 64));
}

id sub_100005FAC(uint64_t a1)
{
  if (IMOSLoggingEnabled(a1))
  {
    dispatch_time_t v2 = (os_log_s *)OSLogHandleForIMFoundationCategory("Transcoding");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      LODWORD(v12[0]) = 138412290;
      *(void *)((char *)v12 + 4) = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_INFO,  "Handling GeneratePreview for %@",  (uint8_t *)v12,  0xCu);
    }
  }

  uint64_t v4 = +[IMTranscodingAgentController sharedInstance](&OBJC_CLASS___IMTranscodingAgentController, "sharedInstance");
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 64);
  __int128 v10 = *(_OWORD *)(a1 + 88);
  v12[0] = *(_OWORD *)(a1 + 72);
  v12[1] = v10;
  uint64_t v13 = *(void *)(a1 + 104);
  return -[IMTranscodingAgentController generatePreview:previewURL:senderContext:balloonBundleID:constraints:completionBlock:]( v4,  "generatePreview:previewURL:senderContext:balloonBundleID:constraints:completionBlock:",  v5,  v6,  v7,  v8,  v12,  v9);
}

void sub_1000060A4(uint64_t a1, char a2, uint64_t a3, double a4, double a5)
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100006120;
  v6[3] = &unk_100008568;
  uint64_t v5 = *(void *)(a1 + 32);
  char v12 = a2;
  v6[4] = v5;
  v6[5] = a3;
  double v9 = a4;
  double v10 = a5;
  __int128 v7 = *(_OWORD *)(a1 + 40);
  __int128 v11 = *(_OWORD *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 56);
  dispatch_async(&_dispatch_main_q, v6);
}

void sub_100006120(uint64_t a1)
{
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  IMInsertBoolsToXPCDictionary(reply, "success");
  uint64_t v9 = *(void *)(a1 + 40);
  IMInsertCodableObjectsToXPCDictionary(reply, "error");
  *(_OWORD *)__int128 buf = *(_OWORD *)(a1 + 72);
  +[NSValue valueWithBytes:objCType:](&OBJC_CLASS___NSValue, "valueWithBytes:objCType:", buf, "{CGSize=dd}", v9, 0LL);
  uint64_t v3 = IMInsertCodableObjectsToXPCDictionary(reply, "size");
  if (IMOSLoggingEnabled(v3))
  {
    uint64_t v4 = (os_log_s *)OSLogHandleForIMFoundationCategory("Transcoding");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 48);
      if (*(_BYTE *)(a1 + 104)) {
        uint64_t v6 = @"YES";
      }
      else {
        uint64_t v6 = @"NO";
      }
      uint64_t v7 = *(void *)(a1 + 72);
      uint64_t v8 = *(void *)(a1 + 80);
      *(_DWORD *)__int128 buf = 138413058;
      *(void *)&uint8_t buf[4] = v5;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v6;
      __int16 v11 = 2048;
      uint64_t v12 = v7;
      __int16 v13 = 2048;
      uint64_t v14 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "Handled GenerateMetadata for %@, success: %@ size: (%f, %f)",  buf,  0x2Au);
    }
  }

  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 56), reply);
  xpc_release(reply);
  xpc_release(*(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 56));
  sub_100005340(*(void *)(a1 + 88));
  sub_100005340(*(void *)(a1 + 96));
  sub_1000053E0(*(void *)(a1 + 64));
}

id sub_1000062D8(uint64_t a1)
{
  if (IMOSLoggingEnabled(a1))
  {
    dispatch_time_t v2 = (os_log_s *)OSLogHandleForIMFoundationCategory("Transcoding");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      LODWORD(v11[0]) = 138412290;
      *(void *)((char *)v11 + 4) = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_INFO,  "Handling GenerateMetadata for %@",  (uint8_t *)v11,  0xCu);
    }
  }

  uint64_t v4 = +[IMTranscodingAgentController sharedInstance](&OBJC_CLASS___IMTranscodingAgentController, "sharedInstance");
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 56);
  __int128 v9 = *(_OWORD *)(a1 + 80);
  v11[0] = *(_OWORD *)(a1 + 64);
  v11[1] = v9;
  uint64_t v12 = *(void *)(a1 + 96);
  return -[IMTranscodingAgentController generatePreviewMetadata:destinationURL:senderContext:constraints:completionBlock:]( v4,  "generatePreviewMetadata:destinationURL:senderContext:constraints:completionBlock:",  v5,  v6,  v7,  v11,  v8);
}

__n128 sub_1000063C8(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  _OWORD v9[2] = sub_100006440;
  v9[3] = &unk_100008648;
  uint64_t v5 = *(void *)(a1 + 32);
  char v13 = a2;
  v9[4] = v5;
  v9[5] = a5;
  v9[6] = a3;
  v9[7] = a4;
  __int128 v6 = *(_OWORD *)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 72);
  __int128 v7 = *(_OWORD *)(a1 + 56);
  __int128 v10 = v6;
  __int128 v11 = v7;
  dispatch_async(&_dispatch_main_q, v9);
  return result;
}

void sub_100006440(uint64_t a1)
{
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  IMInsertBoolsToXPCDictionary(reply, "success");
  IMInsertCodableObjectsToXPCDictionary(reply, "error");
  IMInsertDatasToXPCDictionary(reply, "payloadData");
  objc_msgSend(*(id *)(a1 + 56), "__imArrayByApplyingBlock:", &stru_100008620);
  uint64_t v3 = IMInsertArraysToXPCDictionary(reply, "attachments");
  if (IMOSLoggingEnabled(v3))
  {
    uint64_t v4 = (os_log_s *)OSLogHandleForIMFoundationCategory("Transcoding");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 64);
      uint64_t v6 = *(void *)(a1 + 72);
      *(_DWORD *)__int128 buf = 138412546;
      uint64_t v8 = v5;
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "Handled DecodeiMessageAppPayload for %@ bundleID %@",  buf,  0x16u);
    }
  }

  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 80), reply);
  xpc_release(reply);
  xpc_release(*(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 80));
  sub_100005340(*(void *)(a1 + 96));
  sub_1000053E0(*(void *)(a1 + 88));
}

id sub_1000065C4(id a1, NSURL *a2)
{
  return -[NSURL absoluteString](a2, "absoluteString");
}

id sub_1000065CC(void *a1)
{
  if (IMOSLoggingEnabled(a1))
  {
    dispatch_time_t v2 = (os_log_s *)OSLogHandleForIMFoundationCategory("Transcoding");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = a1[4];
      uint64_t v4 = a1[5];
      int v6 = 138412546;
      uint64_t v7 = v3;
      __int16 v8 = 2112;
      uint64_t v9 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_INFO,  "Handling DecodeiMessageAppPayload for %@ bundleID %@",  (uint8_t *)&v6,  0x16u);
    }
  }

  return -[IMTranscodingAgentController decodeiMessageAppPayload:senderContext:bundleID:completionBlock:]( +[IMTranscodingAgentController sharedInstance](&OBJC_CLASS___IMTranscodingAgentController, "sharedInstance"),  "decodeiMessageAppPayload:senderContext:bundleID:completionBlock:",  a1[4],  a1[6],  a1[5],  a1[7]);
}

void sub_1000066B4(uint64_t a1, uint64_t a2, void *a3)
{
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  [a3 UTF8String];
  IMInsertStringsToXPCDictionary(reply, "IMAudioTranscription");
  IMInsertCodableObjectsToXPCDictionary(reply, "error");
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), reply);
  xpc_release(reply);
  xpc_release(*(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 40));
  sub_100005340(*(void *)(a1 + 56));
  sub_1000053E0(*(void *)(a1 + 48));
}

id sub_100006754(uint64_t a1)
{
  return -[IMTranscodingAgentController transcribeAudioForAudioTransferURL:withCompletion:]( +[IMTranscodingAgentController sharedInstance](&OBJC_CLASS___IMTranscodingAgentController, "sharedInstance"),  "transcribeAudioForAudioTransferURL:withCompletion:",  *(void *)(a1 + 32),  *(void *)(a1 + 40));
}

id objc_msgSend_generatePreview_previewURL_senderContext_balloonBundleID_constraints_completionBlock_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generatePreview:previewURL:senderContext:balloonBundleID:constraints:completionBlock:");
}

id objc_msgSend_generatePreviewMetadata_destinationURL_senderContext_constraints_completionBlock_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generatePreviewMetadata:destinationURL:senderContext:constraints:completionBlock:");
}

id objc_msgSend_generateSnapshotForMessageGUID_payloadURL_balloonBundleID_senderContext_completionBlock_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generateSnapshotForMessageGUID:payloadURL:balloonBundleID:senderContext:completionBlock:");
}

id objc_msgSend_transcodeFileTransferContents_utiType_isSticker_allowUnfilteredUTIs_target_sizes_commonCapabilities_maxDimension_transcoderUserInfo_fallback_representations_isLQMEnabled_completionBlock_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "transcodeFileTransferContents:utiType:isSticker:allowUnfilteredUTIs:target:sizes:commonCapabilities:maxDimens ion:transcoderUserInfo:fallback:representations:isLQMEnabled:completionBlock:");
}

id objc_msgSend_transcodeFileTransferData_balloonBundleID_attachments_fallBack_completionBlock_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transcodeFileTransferData:balloonBundleID:attachments:fallBack:completionBlock:");
}

id objc_msgSend_valueWithBytes_objCType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueWithBytes:objCType:");
}