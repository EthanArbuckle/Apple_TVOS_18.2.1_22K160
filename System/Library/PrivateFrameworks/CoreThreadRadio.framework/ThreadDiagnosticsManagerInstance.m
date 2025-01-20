@interface ThreadDiagnosticsManagerInstance
- (BOOL)generateThreadDiagnosticsMonitorLogs;
- (BOOL)shouldRunDiagnostics;
- (BOOL)updateNCPProperties;
- (CtrInternalClient)CtrInternalClientPtr;
- (OS_dispatch_queue)fQueue;
- (OS_dispatch_queue)sendQueue;
- (OS_dispatch_source)tdm_timer;
- (basic_string<char,)getMLAddress;
- (basic_string<char,)getMLPrefix;
- (basic_string<char,)getNwName;
- (dict)threadDiagnosticsManagerInstance_MsgHandler:()basic_string<char message:()std:(std::allocator<char>> *)a3 :char_traits<char>;
- (id)init:(id)a3;
- (int)getNCPState;
- (unint64_t)getXPanId;
- (unsigned)getChannel;
- (unsigned)getLeaderRouterID;
- (unsigned)getPanId;
- (unsigned)getPartitionId;
- (void)createDriverInterface:(id)a3;
- (void)handlePeriodicTimer;
- (void)send_nwdiagnostics_get_req;
- (void)setCtrInternalClientPtr:(id)a3;
- (void)setFQueue:(id)a3;
- (void)setSendQueue:(id)a3;
- (void)setTdm_timer:(id)a3;
- (void)setupCleanupTimer;
- (void)startThreadDiagnosticsTimer;
@end

@implementation ThreadDiagnosticsManagerInstance

- (BOOL)generateThreadDiagnosticsMonitorLogs
{
  unsigned int v3 = *((_DWORD *)sub_1001B103C() + 10);
  dispatch_suspend((dispatch_object_t)self->_tdm_timer);
  dispatch_time_t v4 = dispatch_time(0LL, 0LL);
  dispatch_source_set_timer((dispatch_source_t)self->_tdm_timer, v4, 1000000000LL * v3, 0LL);
  dispatch_resume((dispatch_object_t)self->_tdm_timer);
  v5 = sub_1000160F4("com.apple.wpantund.tdm", "default");
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "TDM: generateThreadDiagnosticsMonitorLogs sysdiagnose triggered thread diagnostics monitor curPeriodicity=%d",  (uint8_t *)v8,  8u);
  }

  return 1;
}

- (id)init:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ThreadDiagnosticsManagerInstance;
  v6 = -[ThreadDiagnosticsManagerInstance init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_fQueue, a3);
    -[ThreadDiagnosticsManagerInstance createDriverInterface:](v7, "createDriverInterface:", v5);
  }

  return v7;
}

- (BOOL)shouldRunDiagnostics
{
  uint64_t v23 = 0LL;
  sub_10000AC00(buf, "Command Error");
  unsigned int v3 = *(void **)buf;
  int v4 = (char)buf[23];
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  sub_10000AC00(__p, "isPrimaryResident");
  if (CtrInternalClientPtr)
  {
    -[CtrInternalClient getProperty:output:](CtrInternalClientPtr, "getProperty:output:", __p, &v23);
    LODWORD(CtrInternalClientPtr) = *(_DWORD *)buf;
    if ((v4 & 0x80000000) == 0) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  memset(buf, 0, 32);
  if (v4 < 0) {
LABEL_3:
  }
    operator delete(v3);
LABEL_4:
  v6 = *(void **)&buf[8];
  int v7 = (char)buf[31];
  buf[31] = 0;
  buf[8] = 0;
  if (v22 < 0)
  {
    operator delete(__p[0]);
    if ((_DWORD)CtrInternalClientPtr) {
      goto LABEL_6;
    }
  }

  else if ((_DWORD)CtrInternalClientPtr)
  {
LABEL_6:
    v8 = sub_1000160F4("com.apple.wpantund.nm", "default");
    objc_super v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
      goto LABEL_23;
    }
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = "-[ThreadDiagnosticsManagerInstance shouldRunDiagnostics]";
    v10 = "%s : TDM Failed to get the isPrimaryResident Property";
    v11 = v9;
    uint32_t v12 = 12;
    goto LABEL_22;
  }

  if (sub_1001478B8(&v23))
  {
    v13 = sub_1000160F4("com.apple.wpantund.tdm", "default");
    objc_super v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
      goto LABEL_23;
    }
    *(_WORD *)buf = 0;
    v10 = " TDM Current device isPrimaryResident, skip running periodic TDM";
LABEL_14:
    v11 = v9;
    uint32_t v12 = 2;
LABEL_22:
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, v10, buf, v12);
    goto LABEL_23;
  }

  v14 = self->_CtrInternalClientPtr;
  sub_10000AC00(v19, "tdm:periodicdiag:enable");
  if (v14)
  {
    -[CtrInternalClient getProperty:output:](v14, "getProperty:output:", v19, &v23);
    LODWORD(v14) = *(_DWORD *)buf;
    if ((v7 & 0x80000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }

  memset(buf, 0, 32);
  if (v7 < 0) {
LABEL_17:
  }
    operator delete(v6);
LABEL_18:
  v6 = *(void **)&buf[8];
  LOBYTE(v7) = buf[31];
  buf[31] = 0;
  buf[8] = 0;
  if (v20 < 0)
  {
    operator delete(v19[0]);
    if ((_DWORD)v14) {
      goto LABEL_20;
    }
  }

  else if ((_DWORD)v14)
  {
LABEL_20:
    v15 = sub_1000160F4("com.apple.wpantund.nm", "default");
    objc_super v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
      goto LABEL_23;
    }
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[ThreadDiagnosticsManagerInstance shouldRunDiagnostics]";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "tdm:periodicdiag:enable";
    v10 = "%s : TDM Failed to get the property %s";
    v11 = v9;
    uint32_t v12 = 22;
    goto LABEL_22;
  }

  if (!sub_1001478B8(&v23))
  {
    v18 = sub_1000160F4("com.apple.wpantund.tdm", "default");
    objc_super v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
LABEL_23:

      BOOL v16 = 0;
      if ((v7 & 0x80) == 0) {
        goto LABEL_25;
      }
      goto LABEL_24;
    }

    *(_WORD *)buf = 0;
    v10 = " TDM Periodic diagnostics on this device disabled due to extended address logic";
    goto LABEL_14;
  }

  BOOL v16 = 1;
  if ((v7 & 0x80) != 0) {
LABEL_24:
  }
    operator delete(v6);
LABEL_25:
  if (v23) {
    (*(void (**)(uint64_t))(*(void *)v23 + 8LL))(v23);
  }
  return v16;
}

- (dict)threadDiagnosticsManagerInstance_MsgHandler:()basic_string<char message:()std:(std::allocator<char>> *)a3 :char_traits<char>
{
  id v5 = v3;
  v8 = v4;
  objc_super v9 = sub_1000160F4("com.apple.wpantund.tdm", "default");
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    var0 = a3;
    *(_DWORD *)buf = 136315138;
    *(void *)v145 = var0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Message received from client %s", buf, 0xCu);
  }

  xpc_object_t v12 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_object_t v13 = v12;
  if (!v12) {
    xpc_object_t v13 = xpc_null_create();
  }

  id v14 = v13;
  v15 = v14;
  id *v8 = v14;
  if (!v14 || xpc_get_type(v14) != (xpc_type_t)&_xpc_type_dictionary)
  {
    xpc_object_t v16 = xpc_null_create();
    id v17 = *v8;
    id *v8 = v16;
  }

  id v18 = sub_1000EA704(v5);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  string = (char *)xpc_dictionary_get_string(v19, "method");
  sub_10000AC00(&v143, string);

  id v21 = sub_1000EA704(v5);
  char v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  uint64_t v23 = (char *)xpc_dictionary_get_string(v22, "property_name");
  sub_10000AC00(__p, v23);

  if (!std::string::compare(&v143, "ConfigureThreadDiagnosticsManager"))
  {
    id v27 = sub_1000EA704(v5);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    BOOL v29 = xpc_dictionary_get_BOOL(v28, "readcurrentConfig");

    if (v29)
    {
      v30 = sub_1000160F4("com.apple.wpantund.tdm", "default");
      v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "Read current configuration from DB", buf, 2u);
      }

      v32 = sub_1001B103C();
      unsigned __int8 v33 = atomic_load((unsigned __int8 *)v32 + 11736);
      if ((v33 & 1) != 0)
      {
        id v102 = sub_1000EA704(v8);
        v103 = (void *)objc_claimAutoreleasedReturnValue(v102);
        xpc_dictionary_set_BOOL(v103, "expandEdges", *((_BYTE *)v32 + 11737));

        id v104 = sub_1000EA704(v8);
        v105 = (void *)objc_claimAutoreleasedReturnValue(v104);
        xpc_dictionary_set_BOOL(v105, "processDns", *((_BYTE *)v32 + 11738));

        id v106 = sub_1000EA704(v8);
        v107 = (void *)objc_claimAutoreleasedReturnValue(v106);
        xpc_dictionary_set_BOOL(v107, "enhancedTlvReq", *((_BYTE *)v32 + 11739));

        id v108 = sub_1000EA704(v8);
        v109 = (void *)objc_claimAutoreleasedReturnValue(v108);
        xpc_dictionary_set_uint64(v109, "sendToChildren", *((unsigned int *)v32 + 2935));

        id v110 = sub_1000EA704(v8);
        v111 = (void *)objc_claimAutoreleasedReturnValue(v110);
        xpc_dictionary_set_uint64(v111, "routerRspTimeout", *((unsigned int *)v32 + 2936));

        id v112 = sub_1000EA704(v8);
        v113 = (void *)objc_claimAutoreleasedReturnValue(v112);
        xpc_dictionary_set_uint64(v113, "childRspTimeout", *((unsigned int *)v32 + 2937));

        id v114 = sub_1000EA704(v8);
        v115 = (void *)objc_claimAutoreleasedReturnValue(v114);
        xpc_dictionary_set_uint64(v115, "periodicity", *((unsigned int *)v32 + 2940));

        id v116 = sub_1000EA704(v8);
        v117 = (void *)objc_claimAutoreleasedReturnValue(v116);
        xpc_dictionary_set_uint64(v117, "browseTimeout", *((unsigned int *)v32 + 2938));

        id v118 = sub_1000EA704(v8);
        v59 = (void *)objc_claimAutoreleasedReturnValue(v118);
        xpc_dictionary_set_uint64(v59, "resolveTimeout", *((unsigned int *)v32 + 2939));
      }

      else
      {
        id v34 = sub_1000EA704(v8);
        v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
        v36 = sub_1001B103C();
        xpc_dictionary_set_BOOL(v35, "expandEdges", *((_BYTE *)v36 + 48));

        id v37 = sub_1000EA704(v8);
        v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
        v39 = sub_1001B103C();
        xpc_dictionary_set_BOOL(v38, "processDns", *((_BYTE *)v39 + 49));

        id v40 = sub_1000EA704(v8);
        v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
        v42 = sub_1001B103C();
        xpc_dictionary_set_BOOL(v41, "enhancedTlvReq", *((_BYTE *)v42 + 50));

        id v43 = sub_1000EA704(v8);
        v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
        v45 = sub_1001B103C();
        xpc_dictionary_set_uint64(v44, "sendToChildren", *((unsigned int *)v45 + 11));

        id v46 = sub_1000EA704(v8);
        v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
        v48 = sub_1001B103C();
        xpc_dictionary_set_uint64(v47, "routerRspTimeout", *((unsigned int *)v48 + 8));

        id v49 = sub_1000EA704(v8);
        v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
        v51 = sub_1001B103C();
        xpc_dictionary_set_uint64(v50, "childRspTimeout", *((unsigned int *)v51 + 9));

        id v52 = sub_1000EA704(v8);
        v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
        v54 = sub_1001B103C();
        xpc_dictionary_set_uint64(v53, "periodicity", *((unsigned int *)v54 + 10));

        id v55 = sub_1000EA704(v8);
        v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
        v57 = sub_1001B103C();
        xpc_dictionary_set_uint64(v56, "browseTimeout", *((unsigned int *)v57 + 6));

        id v58 = sub_1000EA704(v8);
        v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
        v60 = sub_1001B103C();
        xpc_dictionary_set_uint64(v59, "resolveTimeout", *((unsigned int *)v60 + 7));
      }

      goto LABEL_31;
    }

    id v68 = sub_1000EA704(v5);
    v69 = (void *)objc_claimAutoreleasedReturnValue(v68);
    char v137 = xpc_dictionary_get_BOOL(v69, "expandEdges");

    id v70 = sub_1000EA704(v5);
    v71 = (void *)objc_claimAutoreleasedReturnValue(v70);
    BOOL v139 = xpc_dictionary_get_BOOL(v71, "processDns");

    id v72 = sub_1000EA704(v5);
    v73 = (void *)objc_claimAutoreleasedReturnValue(v72);
    BOOL v138 = xpc_dictionary_get_BOOL(v73, "enhancedTlvReq");

    id v74 = sub_1000EA704(v5);
    v75 = (void *)objc_claimAutoreleasedReturnValue(v74);
    BOOL v76 = xpc_dictionary_get_BOOL(v75, "oneshotmode");

    id v77 = sub_1000EA704(v5);
    v78 = (void *)objc_claimAutoreleasedReturnValue(v77);
    int uint64 = xpc_dictionary_get_uint64(v78, "sendToChildren");

    id v80 = sub_1000EA704(v5);
    v81 = (void *)objc_claimAutoreleasedReturnValue(v80);
    int v82 = xpc_dictionary_get_uint64(v81, "routerRspTimeout");

    id v83 = sub_1000EA704(v5);
    v84 = (void *)objc_claimAutoreleasedReturnValue(v83);
    int v85 = xpc_dictionary_get_uint64(v84, "childRspTimeout");

    id v86 = sub_1000EA704(v5);
    v87 = (void *)objc_claimAutoreleasedReturnValue(v86);
    int v88 = xpc_dictionary_get_uint64(v87, "browseTimeout");

    id v89 = sub_1000EA704(v5);
    v90 = (void *)objc_claimAutoreleasedReturnValue(v89);
    unsigned int v91 = xpc_dictionary_get_uint64(v90, "resolveTimeout");

    id v92 = sub_1000EA704(v5);
    v93 = (void *)objc_claimAutoreleasedReturnValue(v92);
    unsigned int v94 = xpc_dictionary_get_uint64(v93, "periodicity");

    v95 = sub_1001B103C();
    NetworkDiagnosticsManager::updatePendingConfig(v95, v137, v139, v138, uint64, v82, v85, v88, v91, v94);
    v96 = sub_1000160F4("com.apple.wpantund.tdm", "default");
    v97 = (os_log_s *)objc_claimAutoreleasedReturnValue(v96);
    if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136317698;
      *(void *)v145 = "-[ThreadDiagnosticsManagerInstance threadDiagnosticsManagerInstance_MsgHandler:message:]";
      *(_WORD *)&v145[8] = 1024;
      BOOL v146 = v76;
      __int16 v147 = 1024;
      BOOL v148 = v139;
      __int16 v149 = 1024;
      BOOL v150 = v138;
      __int16 v151 = 1024;
      BOOL v152 = v76;
      __int16 v153 = 1024;
      int v154 = uint64;
      __int16 v155 = 1024;
      int v156 = v82;
      __int16 v157 = 1024;
      int v158 = v85;
      __int16 v159 = 1024;
      int v160 = v88;
      __int16 v161 = 1024;
      unsigned int v162 = v91;
      __int16 v163 = 1024;
      unsigned int v164 = v94;
      _os_log_impl( (void *)&_mh_execute_header,  v97,  OS_LOG_TYPE_INFO,  "%s oneshotmodeflag=%d processDnsFlag=%d enhancedTlvReq=%d oneshotmodeFlag=%d sendToChildren=%d routerRspTimeoutI nSecs=%d childRspTimeoutInSecs=%d browseTimeoutInSecs=%d resolveTimeoutInSecs=%d periodicityInSecs=%d : updated ThreadDiagnosticsManager pending configuration ",  buf,  0x48u);
    }

    v98 = sub_1001B103C();
    if (v76)
    {
      dispatch_suspend((dispatch_object_t)self->_tdm_timer);
      *((_DWORD *)sub_1001B103C() + 10) = 0;
      v99 = sub_1000160F4("com.apple.wpantund.tdm", "default");
      v100 = (os_log_s *)objc_claimAutoreleasedReturnValue(v99);
      if (os_log_type_enabled(v100, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v100, OS_LOG_TYPE_INFO, "TDM: Oneshotmode stop the timer", buf, 2u);
      }

      fQueue = (dispatch_queue_s *)self->_fQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1001B2324;
      block[3] = &unk_1002B5570;
      block[4] = self;
      dispatch_async(fQueue, block);
      goto LABEL_31;
    }

    int v130 = *((_DWORD *)v98 + 10);
    if (v94)
    {
      if (!v130)
      {
        v134 = sub_1000160F4("com.apple.wpantund.tdm", "default");
        v135 = (os_log_s *)objc_claimAutoreleasedReturnValue(v134);
        if (os_log_type_enabled(v135, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v145 = v94;
          _os_log_impl( (void *)&_mh_execute_header,  v135,  OS_LOG_TYPE_INFO,  "TDM: Resume TDM timer. start diagnostics again periodicityInSecs=%d",  buf,  8u);
        }

        dispatch_time_t v136 = dispatch_time(0LL, 0LL);
        dispatch_source_set_timer((dispatch_source_t)self->_tdm_timer, v136, 1000000000LL * v94, 0LL);
        dispatch_resume((dispatch_object_t)self->_tdm_timer);
        goto LABEL_31;
      }

      if (v130 != v94)
      {
        dispatch_suspend((dispatch_object_t)self->_tdm_timer);
        dispatch_time_t v131 = dispatch_time(0LL, 0LL);
        dispatch_source_set_timer((dispatch_source_t)self->_tdm_timer, v131, 1000000000LL * v94, 0LL);
        dispatch_resume((dispatch_object_t)self->_tdm_timer);
        v132 = sub_1000160F4("com.apple.wpantund.tdm", "default");
        v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v132);
        if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)v145 = v130;
          *(_WORD *)&v145[4] = 1024;
          *(_DWORD *)&v145[6] = v94;
          _os_log_impl( (void *)&_mh_execute_header,  v67,  OS_LOG_TYPE_INFO,  "TDM: Periodicity changed. Suspend and Resume TDM timer with new periodicity curPeriodicity=%d periodicityInSecs=%d",  buf,  0xEu);
        }

        goto LABEL_52;
      }
    }

    else if (v130)
    {
      dispatch_suspend((dispatch_object_t)self->_tdm_timer);
      *((_DWORD *)sub_1001B103C() + 10) = 0;
      v133 = sub_1000160F4("com.apple.wpantund.tdm", "default");
      v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v133);
      if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v145 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v67,  OS_LOG_TYPE_INFO,  "TDM: Stop the timer as requested by client. periodicityInSecs=%d",  buf,  8u);
      }

      goto LABEL_52;
    }

- (void)createDriverInterface:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INITIATED, 0);
  v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
  int v7 = (OS_dispatch_queue *)dispatch_queue_create("wpantund.TDM.SendQueue", v6);
  sendQueue = self->_sendQueue;
  self->_sendQueue = v7;

  if (!self->_sendQueue)
  {
    xpc_object_t v13 = sub_1000160F4("com.apple.wpantund.tdm", "default");
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1001B484C(v14, v15, v16, v17, v18, v19, v20, v21);
    }

    __assert_rtn( "-[ThreadDiagnosticsManagerInstance createDriverInterface:]",  "ThreadDiagnosticsManagerInstance.mm",  314,  "false");
  }

  objc_super v9 = -[CtrInternalClient init:](objc_alloc(&OBJC_CLASS___CtrInternalClient), "init:", "TDM-Internal");
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  self->_CtrInternalClientPtr = v9;

  v11 = self->_CtrInternalClientPtr;
  sub_10000AC00(__p, "vendor:networkdiagnosticsrsp");
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1001B2540;
  v23[3] = &unk_1002B5598;
  objc_copyWeak(&v24, &location);
  v23[4] = self;
  char v22 = self->_fQueue;
  -[CtrInternalClient setEventHandler:InternalClientEventBlock:dqueue:]( v11,  "setEventHandler:InternalClientEventBlock:dqueue:",  __p,  v23,  &v22);
  xpc_object_t v12 = v22;
  char v22 = 0LL;

  if (v26 < 0) {
    operator delete(__p[0]);
  }
  -[ThreadDiagnosticsManagerInstance startThreadDiagnosticsTimer](self, "startThreadDiagnosticsTimer");
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

- (int)getNCPState
{
  unsigned int v3 = *(void **)buf;
  int v4 = SBYTE7(v25);
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  uint64_t v19 = 0LL;
  sub_10000AC00(__p, "NCP:State");
  if (CtrInternalClientPtr)
  {
    -[CtrInternalClient getProperty:output:](CtrInternalClientPtr, "getProperty:output:", __p, &v19);
    LODWORD(CtrInternalClientPtr) = *(_DWORD *)buf;
    if ((v4 & 0x80000000) == 0) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  *(_OWORD *)buf = 0u;
  __int128 v25 = 0u;
  if (v4 < 0) {
LABEL_3:
  }
    operator delete(v3);
LABEL_4:
  v6 = *(void **)&buf[8];
  int v7 = SHIBYTE(v25);
  HIBYTE(v25) = 0;
  buf[8] = 0;
  if (v18 < 0)
  {
    operator delete(__p[0]);
    if ((_DWORD)CtrInternalClientPtr) {
      goto LABEL_6;
    }
  }

  else if ((_DWORD)CtrInternalClientPtr)
  {
LABEL_6:
    v8 = sub_1000160F4("com.apple.wpantund.tdm", "default");
    objc_super v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[ThreadDiagnosticsManagerInstance getNCPState]";
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s : TDM Failed to get the NCP State Property",  buf,  0xCu);
    }

    int v10 = 0;
    goto LABEL_22;
  }

  v11 = (char *)buf;
  sub_100147B4C(&v19, (std::string *)buf);
  if (SBYTE7(v25) < 0) {
    v11 = *(char **)buf;
  }
  xpc_object_t v12 = sub_1000160F4("com.apple.wpantund.tdm", "default");
  xpc_object_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t v20 = 136315138;
    *(void *)&v20[4] = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s : TDM NCP State Property", v20, 0xCu);
  }

  sub_10000AC00(v20, v11);
  int v10 = sub_1000B5828(v20);
  if (v23 < 0) {
    operator delete(*(void **)v20);
  }
  id v14 = sub_1000160F4("com.apple.wpantund.tdm", "default");
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t v20 = 136315394;
    *(void *)&v20[4] = v11;
    __int16 v21 = 1024;
    int v22 = v10;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "TDM read NCP state as: %s, %d \n", v20, 0x12u);
  }

  if (SBYTE7(v25) < 0) {
    operator delete(*(void **)buf);
  }
LABEL_22:
  if (v19) {
    (*(void (**)(uint64_t))(*(void *)v19 + 8LL))(v19);
  }
  if (v7 < 0) {
    operator delete(v6);
  }
  return v10;
}

- (basic_string<char,)getMLPrefix
{
  uint64_t v2 = v1;
  sub_10000AC00(buf, "Command Error");
  int v4 = *(void **)buf;
  int v5 = buf[23];
  v6 = *(void **)(v2 + 8);
  retstr->var0.var0.var0.var1.var0 = 0LL;
  retstr->var0.var0.var0.var1.var1 = 0LL;
  *((void *)&retstr->var0.var0.var0.var1 + 2) = 0LL;
  char v23 = 0LL;
  sub_10000AC00(__p, "IPv6:MeshLocalPrefix");
  if (v6)
  {
    [v6 getProperty:__p output:&v23];
    LODWORD(v6) = *(_DWORD *)buf;
    if ((v5 & 0x80000000) == 0) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  memset(buf, 0, sizeof(buf));
  if (v5 < 0) {
LABEL_3:
  }
    operator delete(v4);
LABEL_4:
  int v7 = *(void **)&buf[8];
  int v8 = buf[31];
  buf[31] = 0;
  buf[8] = 0;
  if (v22 < 0)
  {
    operator delete(__p[0]);
    if ((_DWORD)v6)
    {
LABEL_6:
      objc_super v9 = sub_1000160F4("com.apple.wpantund.tdm", "default");
      int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1001B48BC(v10, v11, v12, v13, v14, v15, v16, v17);
      }
      goto LABEL_16;
    }
  }

  else if ((_DWORD)v6)
  {
    goto LABEL_6;
  }

  sub_100147B4C((uint64_t *)&v23, (std::string *)buf);
  *(_OWORD *)retstr->var0.var0.var0.var0.var0 = *(_OWORD *)buf;
  *((void *)&retstr->var0.var0.var0.var1 + 2) = *(void *)&buf[16];
  char v18 = sub_1000160F4("com.apple.wpantund.tdm", "default");
  int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    else {
      var0 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)retstr->var0.var0.var0.var1.var0;
    }
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadDiagnosticsManagerInstance getMLPrefix]";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = var0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s : TDM NCP MLPrefix=%s", buf, 0x16u);
  }

- (basic_string<char,)getMLAddress
{
  uint64_t v2 = v1;
  sub_10000AC00(buf, "Command Error");
  int v4 = *(void **)buf;
  int v5 = buf[23];
  v6 = *(void **)(v2 + 8);
  retstr->var0.var0.var0.var1.var0 = 0LL;
  retstr->var0.var0.var0.var1.var1 = 0LL;
  *((void *)&retstr->var0.var0.var0.var1 + 2) = 0LL;
  char v23 = 0LL;
  sub_10000AC00(__p, "IPv6:MeshLocalAddress");
  if (v6)
  {
    [v6 getProperty:__p output:&v23];
    LODWORD(v6) = *(_DWORD *)buf;
    if ((v5 & 0x80000000) == 0) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  memset(buf, 0, sizeof(buf));
  if (v5 < 0) {
LABEL_3:
  }
    operator delete(v4);
LABEL_4:
  int v7 = *(void **)&buf[8];
  int v8 = buf[31];
  buf[31] = 0;
  buf[8] = 0;
  if (v22 < 0)
  {
    operator delete(__p[0]);
    if ((_DWORD)v6)
    {
LABEL_6:
      objc_super v9 = sub_1000160F4("com.apple.wpantund.tdm", "default");
      int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1001B492C(v10, v11, v12, v13, v14, v15, v16, v17);
      }
      goto LABEL_16;
    }
  }

  else if ((_DWORD)v6)
  {
    goto LABEL_6;
  }

  sub_100147B4C((uint64_t *)&v23, (std::string *)buf);
  *(_OWORD *)retstr->var0.var0.var0.var0.var0 = *(_OWORD *)buf;
  *((void *)&retstr->var0.var0.var0.var1 + 2) = *(void *)&buf[16];
  char v18 = sub_1000160F4("com.apple.wpantund.tdm", "default");
  int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    else {
      var0 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)retstr->var0.var0.var0.var1.var0;
    }
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadDiagnosticsManagerInstance getMLAddress]";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = var0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s : TDM NCP MLAddress=%s", buf, 0x16u);
  }

- (basic_string<char,)getNwName
{
  uint64_t v2 = v1;
  sub_10000AC00(buf, "Command Error");
  int v4 = *(void **)buf;
  int v5 = buf[23];
  v6 = *(void **)(v2 + 8);
  retstr->var0.var0.var0.var1.var0 = 0LL;
  retstr->var0.var0.var0.var1.var1 = 0LL;
  *((void *)&retstr->var0.var0.var0.var1 + 2) = 0LL;
  char v23 = 0LL;
  sub_10000AC00(__p, "Network:Name");
  if (v6)
  {
    [v6 getProperty:__p output:&v23];
    LODWORD(v6) = *(_DWORD *)buf;
    if ((v5 & 0x80000000) == 0) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  memset(buf, 0, sizeof(buf));
  if (v5 < 0) {
LABEL_3:
  }
    operator delete(v4);
LABEL_4:
  int v7 = *(void **)&buf[8];
  int v8 = buf[31];
  buf[31] = 0;
  buf[8] = 0;
  if (v22 < 0)
  {
    operator delete(__p[0]);
    if ((_DWORD)v6)
    {
LABEL_6:
      objc_super v9 = sub_1000160F4("com.apple.wpantund.tdm", "default");
      int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1001B499C(v10, v11, v12, v13, v14, v15, v16, v17);
      }
      goto LABEL_16;
    }
  }

  else if ((_DWORD)v6)
  {
    goto LABEL_6;
  }

  sub_100147B4C((uint64_t *)&v23, (std::string *)buf);
  *(_OWORD *)retstr->var0.var0.var0.var0.var0 = *(_OWORD *)buf;
  *((void *)&retstr->var0.var0.var0.var1 + 2) = *(void *)&buf[16];
  char v18 = sub_1000160F4("com.apple.wpantund.tdm", "default");
  int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    else {
      var0 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)retstr->var0.var0.var0.var1.var0;
    }
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadDiagnosticsManagerInstance getNwName]";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = var0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s : TDM NCP NwName=%s", buf, 0x16u);
  }

- (unsigned)getLeaderRouterID
{
  unsigned int v3 = *(void **)buf;
  int v4 = (char)buf[23];
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  uint64_t v22 = 0LL;
  sub_10000AC00(__p, "Thread:Leader:RouterID");
  if (CtrInternalClientPtr)
  {
    -[CtrInternalClient getProperty:output:](CtrInternalClientPtr, "getProperty:output:", __p, &v22);
    LODWORD(CtrInternalClientPtr) = *(_DWORD *)buf;
    if ((v4 & 0x80000000) == 0) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  memset(buf, 0, 32);
  if (v4 < 0) {
LABEL_3:
  }
    operator delete(v3);
LABEL_4:
  v6 = *(void **)&buf[8];
  int v7 = (char)buf[31];
  buf[31] = 0;
  buf[8] = 0;
  if (v21 < 0)
  {
    operator delete(__p[0]);
    if ((_DWORD)CtrInternalClientPtr) {
      goto LABEL_6;
    }
  }

  else if ((_DWORD)CtrInternalClientPtr)
  {
LABEL_6:
    int v8 = sub_1000160F4("com.apple.wpantund.tdm", "default");
    objc_super v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1001B4A0C(v9, v10, v11, v12, v13, v14, v15, v16);
    }
    unsigned __int16 v17 = 255;
    goto LABEL_14;
  }

  unsigned __int16 v17 = sub_1001472F4(&v22);
  char v18 = sub_1000160F4("com.apple.wpantund.tdm", "default");
  objc_super v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadDiagnosticsManagerInstance getLeaderRouterID]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v17;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s : TDM NCP Leader Router ID=%d", buf, 0x12u);
  }

- (unsigned)getChannel
{
  unsigned int v3 = *(void **)buf;
  int v4 = (char)buf[23];
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  uint64_t v22 = 0LL;
  sub_10000AC00(__p, "NCP:Channel");
  if (CtrInternalClientPtr)
  {
    -[CtrInternalClient getProperty:output:](CtrInternalClientPtr, "getProperty:output:", __p, &v22);
    LODWORD(CtrInternalClientPtr) = *(_DWORD *)buf;
    if ((v4 & 0x80000000) == 0) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  memset(buf, 0, 32);
  if (v4 < 0) {
LABEL_3:
  }
    operator delete(v3);
LABEL_4:
  v6 = *(void **)&buf[8];
  int v7 = (char)buf[31];
  buf[31] = 0;
  buf[8] = 0;
  if (v21 < 0)
  {
    operator delete(__p[0]);
    if ((_DWORD)CtrInternalClientPtr) {
      goto LABEL_6;
    }
  }

  else if ((_DWORD)CtrInternalClientPtr)
  {
LABEL_6:
    int v8 = sub_1000160F4("com.apple.wpantund.tdm", "default");
    objc_super v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1001B4A7C(v9, v10, v11, v12, v13, v14, v15, v16);
    }
    unsigned __int16 v17 = 255;
    goto LABEL_14;
  }

  unsigned __int16 v17 = sub_1001472F4(&v22);
  char v18 = sub_1000160F4("com.apple.wpantund.tdm", "default");
  objc_super v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadDiagnosticsManagerInstance getChannel]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v17;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s : TDM NCP Channel=%d", buf, 0x12u);
  }

- (unsigned)getPartitionId
{
  unsigned int v3 = *(void **)buf;
  int v4 = (char)buf[23];
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  uint64_t v22 = 0LL;
  sub_10000AC00(__p, "Network:PartitionId");
  if (CtrInternalClientPtr)
  {
    -[CtrInternalClient getProperty:output:](CtrInternalClientPtr, "getProperty:output:", __p, &v22);
    LODWORD(CtrInternalClientPtr) = *(_DWORD *)buf;
    if ((v4 & 0x80000000) == 0) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  memset(buf, 0, 32);
  if (v4 < 0) {
LABEL_3:
  }
    operator delete(v3);
LABEL_4:
  v6 = *(void **)&buf[8];
  int v7 = (char)buf[31];
  buf[31] = 0;
  buf[8] = 0;
  if (v21 < 0)
  {
    operator delete(__p[0]);
    if ((_DWORD)CtrInternalClientPtr) {
      goto LABEL_6;
    }
  }

  else if ((_DWORD)CtrInternalClientPtr)
  {
LABEL_6:
    int v8 = sub_1000160F4("com.apple.wpantund.tdm", "default");
    objc_super v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1001B4AEC(v9, v10, v11, v12, v13, v14, v15, v16);
    }
    unsigned int v17 = 255;
    goto LABEL_14;
  }

  unsigned int v17 = sub_1001472F4(&v22);
  char v18 = sub_1000160F4("com.apple.wpantund.tdm", "default");
  objc_super v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadDiagnosticsManagerInstance getPartitionId]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v17;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s : TDM NCP PartitionId=%d", buf, 0x12u);
  }

- (unsigned)getPanId
{
  unsigned int v3 = *(void **)buf;
  int v4 = (char)buf[23];
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  uint64_t v22 = 0LL;
  sub_10000AC00(__p, "Network:PANID");
  if (CtrInternalClientPtr)
  {
    -[CtrInternalClient getProperty:output:](CtrInternalClientPtr, "getProperty:output:", __p, &v22);
    LODWORD(CtrInternalClientPtr) = *(_DWORD *)buf;
    if ((v4 & 0x80000000) == 0) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  memset(buf, 0, 32);
  if (v4 < 0) {
LABEL_3:
  }
    operator delete(v3);
LABEL_4:
  v6 = *(void **)&buf[8];
  int v7 = (char)buf[31];
  buf[31] = 0;
  buf[8] = 0;
  if (v21 < 0)
  {
    operator delete(__p[0]);
    if ((_DWORD)CtrInternalClientPtr) {
      goto LABEL_6;
    }
  }

  else if ((_DWORD)CtrInternalClientPtr)
  {
LABEL_6:
    int v8 = sub_1000160F4("com.apple.wpantund.tdm", "default");
    objc_super v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1001B4B5C(v9, v10, v11, v12, v13, v14, v15, v16);
    }
    unsigned __int16 v17 = 255;
    goto LABEL_14;
  }

  unsigned __int16 v17 = sub_1001472F4(&v22);
  char v18 = sub_1000160F4("com.apple.wpantund.tdm", "default");
  objc_super v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadDiagnosticsManagerInstance getPanId]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v17;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s : TDM NCP Channel=%d", buf, 0x12u);
  }

- (unint64_t)getXPanId
{
  unsigned int v3 = *(void **)buf;
  int v4 = (char)buf[23];
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  uint64_t v22 = 0LL;
  sub_10000AC00(__p, "Network:XPANID");
  if (CtrInternalClientPtr)
  {
    -[CtrInternalClient getProperty:output:](CtrInternalClientPtr, "getProperty:output:", __p, &v22);
    LODWORD(CtrInternalClientPtr) = *(_DWORD *)buf;
    if ((v4 & 0x80000000) == 0) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  memset(buf, 0, 32);
  if (v4 < 0) {
LABEL_3:
  }
    operator delete(v3);
LABEL_4:
  v6 = *(void **)&buf[8];
  int v7 = (char)buf[31];
  buf[31] = 0;
  buf[8] = 0;
  if (v21 < 0)
  {
    operator delete(__p[0]);
    if ((_DWORD)CtrInternalClientPtr) {
      goto LABEL_6;
    }
  }

  else if ((_DWORD)CtrInternalClientPtr)
  {
LABEL_6:
    int v8 = sub_1000160F4("com.apple.wpantund.tdm", "default");
    objc_super v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1001B4BCC(v9, v10, v11, v12, v13, v14, v15, v16);
    }
    unint64_t v17 = 255LL;
    goto LABEL_14;
  }

  unint64_t v17 = (unint64_t)sub_1001476B4(&v22, 0);
  char v18 = sub_1000160F4("com.apple.wpantund.tdm", "default");
  objc_super v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadDiagnosticsManagerInstance getXPanId]";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v17;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s : TDM NCP XPanId=%llu", buf, 0x16u);
  }

- (void)send_nwdiagnostics_get_req
{
  unsigned int v3 = sub_1001B103C();
  int v4 = *((unsigned __int8 *)v3 + 11728);
  uint64_t v5 = *((void *)v3 + 1464);
  uint64_t v6 = *((void *)v3 + 1463);
  objc_initWeak(&location, self);
  if (v4)
  {
    id v7 = objc_loadWeakRetained(&location);
    if (v7)
    {
      unint64_t v8 = 0x8E38E38E38E38E39LL * ((v5 - v6) >> 2);
      uint64_t v9 = 954437177 * ((v5 - v6) >> 2);
      if (954437177 * ((v5 - v6) >> 2))
      {
        uint64_t v10 = 0LL;
        uint64_t v11 = 36LL * (v8 - 1);
        uint64_t v12 = 36 * v9;
        do
        {
          uint64_t v13 = (__int128 *)(*((void *)v3 + 1463) + v10);
          __int128 v14 = v13[1];
          __int128 v21 = *v13;
          __int128 v22 = v14;
          int v23 = *((_DWORD *)v13 + 8);
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v7 CtrInternalClientPtr]);
          v19[0] = v21;
          v19[1] = v22;
          int v20 = v23;
          objc_msgSend(v15, "send_diagnostics_req:", v19);
          if (v17 < 0) {
            operator delete(__p);
          }

          if (v11 != v10) {
            usleep(0x186A0u);
          }
          v10 += 36LL;
        }

        while (v12 != v10);
      }
    }
  }

  *((_BYTE *)sub_1001B103C() + 11728) = 0;
  objc_destroyWeak(&location);
}

- (BOOL)updateNCPProperties
{
  uint64_t v3 = HIBYTE(v48);
  if (v48 < 0) {
    uint64_t v3 = *((void *)&v47 + 1);
  }
  if (v3)
  {
    -[ThreadDiagnosticsManagerInstance getMLAddress](self, "getMLAddress");
    uint64_t v4 = HIBYTE(v46);
    if (v46 < 0) {
      uint64_t v4 = *((void *)&v45 + 1);
    }
    BOOL v5 = v4 != 0;
    if (v4)
    {
      if (SHIBYTE(v48) < 0)
      {
        id v7 = (__int128 *)v47;
        uint64_t v6 = --*((void *)&v47 + 1);
      }

      else
      {
        uint64_t v6 = HIBYTE(v48) - 1LL;
        HIBYTE(v48) = v6 & 0x7F;
        id v7 = &v47;
      }

      *((_BYTE *)v7 + v6) = 0;
      if (SHIBYTE(v48) < 0)
      {
        id v27 = (__int128 *)v47;
        uint64_t v26 = --*((void *)&v47 + 1);
      }

      else
      {
        uint64_t v26 = HIBYTE(v48) - 1LL;
        HIBYTE(v48) = v26 & 0x7F;
        id v27 = &v47;
      }

      *((_BYTE *)v27 + v26) = 0;
      if (SHIBYTE(v48) < 0)
      {
        BOOL v29 = (__int128 *)v47;
        uint64_t v28 = --*((void *)&v47 + 1);
      }

      else
      {
        uint64_t v28 = HIBYTE(v48) - 1LL;
        HIBYTE(v48) = v28 & 0x7F;
        BOOL v29 = &v47;
      }

      *((_BYTE *)v29 + v28) = 0;
      __int16 v30 = -[ThreadDiagnosticsManagerInstance getPanId](self, "getPanId");
      -[ThreadDiagnosticsManagerInstance getNwName](self, "getNwName");
      int v31 = -[ThreadDiagnosticsManagerInstance getPartitionId](self, "getPartitionId");
      __int16 v32 = -[ThreadDiagnosticsManagerInstance getChannel](self, "getChannel");
      __int16 v33 = -[ThreadDiagnosticsManagerInstance getLeaderRouterID](self, "getLeaderRouterID");
      uint64_t v34 = -[ThreadDiagnosticsManagerInstance getXPanId](self, "getXPanId");
      v35 = sub_1001B103C();
      if (SHIBYTE(v48) < 0)
      {
        sub_100168054(__dst, (void *)v47, *((unint64_t *)&v47 + 1));
      }

      else
      {
        *(_OWORD *)__dst = v47;
        uint64_t v42 = v48;
      }

      if (SHIBYTE(v46) < 0)
      {
        sub_100168054(v39, (void *)v45, *((unint64_t *)&v45 + 1));
      }

      else
      {
        *(_OWORD *)v39 = v45;
        uint64_t v40 = v46;
      }

      if (SHIBYTE(v44) < 0)
      {
        sub_100168054(__p, v43[0], (unint64_t)v43[1]);
      }

      else
      {
        *(_OWORD *)__p = *(_OWORD *)v43;
        uint64_t v38 = v44;
      }

      NetworkDiagnosticsManager::updateNCPProperties( (uint64_t)v35,  (uint64_t)__dst,  (uint64_t)v39,  (uint64_t)__p,  v30,  v34,  v32,  v33,  v31);
      if (SHIBYTE(v38) < 0) {
        operator delete(__p[0]);
      }
      if (SHIBYTE(v40) < 0) {
        operator delete(v39[0]);
      }
      if (SHIBYTE(v42) < 0) {
        operator delete(__dst[0]);
      }
      if (SHIBYTE(v44) < 0) {
        operator delete(v43[0]);
      }
    }

    else
    {
      char v17 = sub_1000160F4("com.apple.wpantund.tdm", "default");
      char v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_1001B4CAC(v18, v19, v20, v21, v22, v23, v24, v25);
      }
    }

    if (SHIBYTE(v46) < 0) {
      operator delete((void *)v45);
    }
  }

  else
  {
    unint64_t v8 = sub_1000160F4("com.apple.wpantund.tdm", "default");
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1001B4C3C(v9, v10, v11, v12, v13, v14, v15, v16);
    }

    BOOL v5 = 0;
  }

  if (SHIBYTE(v48) < 0) {
    operator delete((void *)v47);
  }
  return v5;
}

- (void)setupCleanupTimer
{
  int v3 = *((unsigned __int8 *)sub_1001B103C() + 6736);
  uint64_t v4 = sub_1000160F4("com.apple.wpantund.tdm", "default");
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v3)
  {
    int64_t v7 = 12000000000LL;
    if (v6)
    {
      int v10 = 67109120;
      int v11 = 12;
      unint64_t v8 = "Setup cleanup timer after %d s for sysdiag trigger";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, v8, (uint8_t *)&v10, 8u);
    }
  }

  else
  {
    int64_t v7 = 120000000000LL;
    if (v6)
    {
      int v10 = 67109120;
      int v11 = 120;
      unint64_t v8 = "Setup cleanup timer after %d s";
      goto LABEL_6;
    }
  }

  dispatch_time_t v9 = dispatch_time(0LL, v7);
  dispatch_after(v9, (dispatch_queue_t)self->_fQueue, &stru_1002B55B8);
}

- (void)handlePeriodicTimer
{
  if (-[ThreadDiagnosticsManagerInstance getNCPState](self, "getNCPState") != 8)
  {
    uint64_t v16 = sub_1000160F4("com.apple.wpantund.tdm", "default");
    char v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      __int16 v23 = 0;
      char v18 = "TDM: handlePeriodicTimer return here as NCP state is not associated";
      uint64_t v19 = (uint8_t *)&v23;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, v18, v19, 2u);
    }

- (void)startThreadDiagnosticsTimer
{
  int v3 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_fQueue);
  tdm_timer = self->_tdm_timer;
  self->_tdm_timer = v3;

  int v5 = rand() % 300;
  dispatch_time_t v6 = dispatch_time(0LL, 1000000000LL * (v5 + 300));
  uint64_t v7 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109376;
    int v14 = 300;
    __int16 v15 = 1024;
    int v16 = (unsigned __int16)v5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "TDM: startThreadDiagnosticsTimer period:%d, rand_offset(%d)",  buf,  0xEu);
  }

  dispatch_source_set_timer((dispatch_source_t)self->_tdm_timer, v6, 0x34884C48400uLL, 0LL);
  uint64_t v9 = self->_tdm_timer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_1001B4678;
  handler[3] = &unk_1002B5570;
  handler[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)v9, handler);
  dispatch_activate((dispatch_object_t)self->_tdm_timer);
  uint64_t v10 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    int v14 = 3610;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "TDM: startThreadDiagnosticsTimer : Timer periodicity(s)=%d",  buf,  8u);
  }
}

- (CtrInternalClient)CtrInternalClientPtr
{
  return (CtrInternalClient *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setCtrInternalClientPtr:(id)a3
{
}

- (OS_dispatch_source)tdm_timer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setTdm_timer:(id)a3
{
}

- (OS_dispatch_queue)fQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setFQueue:(id)a3
{
}

- (OS_dispatch_queue)sendQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setSendQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end