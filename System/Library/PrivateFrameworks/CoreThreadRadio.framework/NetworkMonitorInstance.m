@interface NetworkMonitorInstance
- (BOOL)getDeviceData:()basic_string<char;
- (BOOL)getPreviousPrimaryState;
- (BOOL)getPrimaryState;
- (BOOL)pingNode:()basic_string<char count:()std:(std::allocator<char>> *)a3 :char_traits<char>;
- (CtrInternalClient)CtrInternalClientPtr;
- (OS_dispatch_queue)fQueue;
- (OS_dispatch_source)nm_device_data_interval_timer;
- (OS_dispatch_source)nm_periodic_activity_guard_timer;
- (OS_dispatch_source)nm_respawn_convergence_timer;
- (OS_dispatch_source)nm_timer;
- (dict)networkMonitorInstance_MsgHandler:()basic_string<char message:()std:(std::allocator<char>> *)a3 :char_traits<char>;
- (id)init:(id)a3;
- (int)getNCPState;
- (int)getNodeType:(BOOL)a3;
- (unsigned)triggerDeviceDataInterval;
- (void)createDriverInterface:(id)a3;
- (void)handleDeviceDataIntervalTimer;
- (void)handleNetworkMonitorTimer;
- (void)handlePeriodicActivityGuardTimer;
- (void)handleRespawnConvergenceTimer;
- (void)setCtrInternalClientPtr:(id)a3;
- (void)setFQueue:(id)a3;
- (void)setNm_device_data_interval_timer:(id)a3;
- (void)setNm_periodic_activity_guard_timer:(id)a3;
- (void)setNm_respawn_convergence_timer:(id)a3;
- (void)setNm_timer:(id)a3;
- (void)startDeviceDataIntervalTimer;
- (void)startNetworkMonitorTimer;
- (void)startPeriodicAcitvityGuardTimer;
- (void)startRespawnConvergenceTimer;
@end

@implementation NetworkMonitorInstance

- (id)init:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NetworkMonitorInstance;
  v6 = -[NetworkMonitorInstance init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_fQueue, a3);
    -[NetworkMonitorInstance createDriverInterface:](v7, "createDriverInterface:", v5);
    objc_storeStrong((id *)&nmInstancePtr, v7);
  }

  return v7;
}

- (dict)networkMonitorInstance_MsgHandler:()basic_string<char message:()std:(std::allocator<char>> *)a3 :char_traits<char>
{
  id v5 = v3;
  v7 = v4;
  logging_obg = log_get_logging_obg("com.apple.wpantund.nm", "default");
  objc_super v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(logging_obg);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    var0 = a3;
    LODWORD(buf.__r_.__value_.__l.__data_) = 136315138;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)var0;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Message received from client %s",  (uint8_t *)&buf,  0xCu);
  }

  xpc_object_t v11 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_object_t v12 = v11;
  if (!v11) {
    xpc_object_t v12 = xpc_null_create();
  }

  id v13 = v12;
  v14 = v13;
  id *v7 = v13;
  if (!v13 || xpc_get_type(v13) != (xpc_type_t)&_xpc_type_dictionary)
  {
    xpc_object_t v15 = xpc_null_create();
    id v16 = *v7;
    id *v7 = v15;
  }

  id v17 = xpc::dict::operator*(v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  string = (char *)xpc_dictionary_get_string(v18, "method");
  std::string::basic_string[abi:ne180100]<0>(&buf, string);

  id v20 = xpc::dict::operator*(v5);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v22 = (char *)xpc_dictionary_get_string(v21, "property_name");
  std::string::basic_string[abi:ne180100]<0>(v46, v22);

  v23 = log_get_logging_obg("com.apple.wpantund.nm", "default");
  v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
    -[NetworkMonitorInstance networkMonitorInstance_MsgHandler:message:].cold.3();
  }

  if (!std::string::compare(&buf, "NetworkMonitor"))
  {
    id v28 = xpc::dict::operator*(v5);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    v30 = (char *)xpc_dictionary_get_string(v29, "property_value");
    std::string::basic_string[abi:ne180100]<0>(&__p, v30);

    v31 = log_get_logging_obg("com.apple.wpantund.nm", "default");
    v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      -[NetworkMonitorInstance networkMonitorInstance_MsgHandler:message:].cold.1();
    }

    if (v45 < 0) {
      operator delete(__p);
    }
    int64_t v27 = 0LL;
  }

  else
  {
    v25 = log_get_logging_obg("com.apple.wpantund.nm", "default");
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[NetworkMonitorInstance networkMonitorInstance_MsgHandler:message:].cold.2((uint64_t **)a3, (uint64_t)&buf, v26);
    }

    int64_t v27 = 1LL;
  }

  id v33 = xpc::dict::operator*(v7);
  v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
  v35 = v34;
  if ((buf.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    p_std::string buf = &buf;
  }
  else {
    p_std::string buf = (std::string *)buf.__r_.__value_.__r.__words[0];
  }
  xpc_dictionary_set_string(v34, "method", (const char *)p_buf);

  id v37 = xpc::dict::operator*(v7);
  v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
  v39 = v38;
  if (v47 >= 0) {
    v40 = v46;
  }
  else {
    v40 = (void **)v46[0];
  }
  xpc_dictionary_set_string(v38, "property_name", (const char *)v40);

  id v41 = xpc::dict::operator*(v7);
  v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
  xpc_dictionary_set_int64(v42, "ret", v27);

  if (v47 < 0) {
    operator delete(v46[0]);
  }
  return v43;
}

- (void)createDriverInterface:(id)a3
{
  id v4 = a3;
  gettimeofday(&v38, 0LL);
  __darwin_time_t tv_sec = v38.tv_sec;
  logging_obg = log_get_logging_obg("com.apple.wpantund.nm", "default");
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(logging_obg);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 134217984;
    __darwin_time_t v40 = tv_sec;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Network Monitor Starting...System Timestamp: %llu sec",  buf,  0xCu);
  }

  v8 = -[CtrInternalClient init:](objc_alloc(&OBJC_CLASS___CtrInternalClient), "init:", "NM-Internal");
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  self->_CtrInternalClientPtr = v8;

  NetworkMonitorManager::init(v10);
  Instance = NetworkMonitorManager::getInstance(v11);
  NetworkMonitorManager::init_settings(Instance);
  id v13 = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(__p, "nm:networkdata");
  v35 = self->_fQueue;
  -[CtrInternalClient setEventHandler:InternalClientEventBlock:dqueue:]( v13,  "setEventHandler:InternalClientEventBlock:dqueue:",  __p,  &__block_literal_global_5,  &v35);
  v14 = v35;
  v35 = 0LL;

  if (v37 < 0) {
    operator delete(__p[0]);
  }
  xpc_object_t v15 = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(v33, "nm:ping:stats");
  v32 = self->_fQueue;
  -[CtrInternalClient setEventHandler:InternalClientEventBlock:dqueue:]( v15,  "setEventHandler:InternalClientEventBlock:dqueue:",  v33,  &__block_literal_global_13,  &v32);
  id v16 = v32;
  v32 = 0LL;

  if (v34 < 0) {
    operator delete(v33[0]);
  }
  id v17 = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(v30, "nm:diag:devicedata");
  v29 = self->_fQueue;
  -[CtrInternalClient setEventHandler:InternalClientEventBlock:dqueue:]( v17,  "setEventHandler:InternalClientEventBlock:dqueue:",  v30,  &__block_literal_global_16,  &v29);
  v18 = v29;
  v29 = 0LL;

  if (v31 < 0) {
    operator delete(v30[0]);
  }
  v19 = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(v27, "NCP:State");
  id v20 = v4;
  id v26 = v20;
  -[CtrInternalClient setEventHandler:InternalClientEventBlock:dqueue:]( v19,  "setEventHandler:InternalClientEventBlock:dqueue:",  v27,  &__block_literal_global_19,  &v26);
  id v21 = v26;
  id v26 = 0LL;

  if (v28 < 0) {
    operator delete(v27[0]);
  }
  -[NetworkMonitorInstance startRespawnConvergenceTimer](self, "startRespawnConvergenceTimer");
  -[NetworkMonitorInstance startNetworkMonitorTimer](self, "startNetworkMonitorTimer");
  -[NetworkMonitorInstance startDeviceDataIntervalTimer](self, "startDeviceDataIntervalTimer");
  int v22 = -[NetworkMonitorInstance getNCPState](self, "getNCPState");
  v23 = (NetworkMonitorManager *)-[NetworkMonitorInstance getPrimaryState](self, "getPrimaryState");
  char v24 = (char)v23;
  v25 = NetworkMonitorManager::getInstance(v23);
  NetworkMonitorManager::start_monitoring((uint64_t)v25, tv_sec, v22, v24);
}

void __48__NetworkMonitorInstance_createDriverInterface___block_invoke(id a1, any a2)
{
  v2 = boost::any_cast<nmNetData>(a2.var0);
  logging_obg = log_get_logging_obg("com.apple.wpantund.nm", "default");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(logging_obg);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = *(unsigned __int8 *)v2;
    int v6 = *((unsigned __int8 *)v2 + 1);
    int v7 = *((unsigned __int8 *)v2 + 2);
    int v8 = *((_DWORD *)v2 + 1);
    int v9 = *((_DWORD *)v2 + 2);
    int v10 = *((unsigned __int8 *)v2 + 12);
    v13[0] = 67110400;
    v13[1] = v8;
    __int16 v14 = 1024;
    int v15 = v5;
    __int16 v16 = 1024;
    int v17 = v6;
    __int16 v18 = 1024;
    int v19 = v7;
    __int16 v20 = 1024;
    int v21 = v9;
    __int16 v22 = 1024;
    int v23 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "[Event: nm:networkdata] size = %d, numUnicastService = %d, numAnycastServices = %d numOnmeshPrefixes = %d, partiti on_id = %d primary_resident = %d\n",  (uint8_t *)v13,  0x26u);
  }

  Instance = NetworkMonitorManager::getInstance(v11);
  NetworkMonitorManager::handle_netdata_indication((uint64_t)Instance, (unsigned __int8 *)v2);
}

void __48__NetworkMonitorInstance_createDriverInterface___block_invoke_12(id a1, any a2)
{
  v2 = (unsigned __int16 *)boost::any_cast<nmPingStats>(a2.var0);
  logging_obg = log_get_logging_obg("com.apple.wpantund.nm", "default");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(logging_obg);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[Event: nm:pingStats] \n", v7, 2u);
  }

  Instance = NetworkMonitorManager::getInstance(v5);
  NetworkMonitorManager::handle_ping_stats_indication((uint64_t)Instance, v2);
}

void __48__NetworkMonitorInstance_createDriverInterface___block_invoke_15(id a1, any a2)
{
  v2 = (NmDeviceData *)boost::any_cast<NmDeviceData>(a2.var0);
  logging_obg = log_get_logging_obg("com.apple.wpantund.nm", "default");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(logging_obg);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[Event: nm:diag:devicedata] \n", v7, 2u);
  }

  Instance = NetworkMonitorManager::getInstance(v5);
  NetworkMonitorManager::handle_device_data_indication(Instance, v2);
}

void __48__NetworkMonitorInstance_createDriverInterface___block_invoke_18(id a1, any a2)
{
  int v2 = nl::wpantund::string_to_ncp_state(&__p);
  logging_obg = log_get_logging_obg("com.apple.wpantund.nm", "default");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(logging_obg);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LODWORD(__p.__r_.__value_.__l.__data_) = 136315394;
    *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 4) = (std::string::size_type)"NCP:State";
    WORD2(__p.__r_.__value_.__r.__words[1]) = 1024;
    *(_DWORD *)((char *)&__p.__r_.__value_.__r.__words[1] + 6) = v2;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s NM-Internal got event Data: NCP State: %d\n",  (uint8_t *)&__p,  0x12u);
  }

  Instance = NetworkMonitorManager::getInstance(v5);
  NetworkMonitorManager::handle_ncp_state_indication((uint64_t)Instance, v2);
}

- (int)getNCPState
{
  v3 = *(void **)buf;
  int v4 = SBYTE7(v23);
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  uint64_t v17 = 0LL;
  std::string::basic_string[abi:ne180100]<0>(__p, "NCP:State");
  if (CtrInternalClientPtr)
  {
    -[CtrInternalClient getProperty:output:](CtrInternalClientPtr, "getProperty:output:", __p, &v17);
    LODWORD(CtrInternalClientPtr) = *(_DWORD *)buf;
    if ((v4 & 0x80000000) == 0) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  *(_OWORD *)std::string buf = 0u;
  __int128 v23 = 0u;
  if (v4 < 0) {
LABEL_3:
  }
    operator delete(v3);
LABEL_4:
  int v6 = *(void **)&buf[8];
  int v7 = SHIBYTE(v23);
  HIBYTE(v23) = 0;
  buf[8] = 0;
  if (v16 < 0)
  {
    operator delete(__p[0]);
    if ((_DWORD)CtrInternalClientPtr) {
      goto LABEL_6;
    }
  }

  else if ((_DWORD)CtrInternalClientPtr)
  {
LABEL_6:
    logging_obg = log_get_logging_obg("com.apple.wpantund.nm", "default");
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(logging_obg);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)std::string buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[NetworkMonitorInstance getNCPState]";
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s : NM Failed to get the NCP State Property",  buf,  0xCu);
    }

    int v10 = 0;
    goto LABEL_21;
  }

  any_to_string((const boost::any *)&v17, (std::string *)buf);
  if ((SBYTE7(v23) & 0x80u) == 0) {
    xpc_object_t v11 = (char *)buf;
  }
  else {
    xpc_object_t v11 = *(char **)buf;
  }
  std::string::basic_string[abi:ne180100]<0>(v18, v11);
  int v10 = nl::wpantund::string_to_ncp_state(v18);
  if (v21 < 0) {
    operator delete(*(void **)v18);
  }
  xpc_object_t v12 = log_get_logging_obg("com.apple.wpantund.nm", "default");
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int16 v18 = 136315394;
    *(void *)&v18[4] = v11;
    __int16 v19 = 1024;
    int v20 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "NM read NCP state as: %s, %d \n", v18, 0x12u);
  }

  if (SBYTE7(v23) < 0) {
    operator delete(*(void **)buf);
  }
LABEL_21:
  if (v17) {
    (*(void (**)(uint64_t))(*(void *)v17 + 8LL))(v17);
  }
  if (v7 < 0) {
    operator delete(v6);
  }
  return v10;
}

- (int)getNodeType:(BOOL)a3
{
  BOOL v3 = a3;
  std::string::basic_string[abi:ne180100]<0>(buf, "Command Error");
  int v5 = *(void **)buf;
  int v6 = buf[23];
  uint64_t v24 = 0LL;
  if (v3)
  {
    CtrInternalClientPtr = self->_CtrInternalClientPtr;
    std::string::basic_string[abi:ne180100]<0>(v22, "Network:Role");
    if (CtrInternalClientPtr)
    {
      -[CtrInternalClient getProperty:output:](CtrInternalClientPtr, "getProperty:output:", v22, &v24);
      LODWORD(CtrInternalClientPtr) = *(_DWORD *)buf;
      if ((v6 & 0x80000000) == 0) {
        goto LABEL_5;
      }
    }

    else
    {
      memset(buf, 0, sizeof(buf));
      if ((v6 & 0x80000000) == 0)
      {
LABEL_5:
        int v8 = *(void **)&buf[8];
        char v9 = buf[31];
        buf[31] = 0;
        buf[8] = 0;
        if (v23 < 0)
        {
          int v10 = (void *)v22[0];
          goto LABEL_20;
        }

- (unsigned)triggerDeviceDataInterval
{
  BOOL v3 = *(void **)buf;
  int v4 = SBYTE7(v16);
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  uint64_t v14 = 0LL;
  std::string::basic_string[abi:ne180100]<0>(__p, "nm:trigger:devicedata:interval");
  if (CtrInternalClientPtr)
  {
    -[CtrInternalClient getProperty:output:](CtrInternalClientPtr, "getProperty:output:", __p, &v14);
    LODWORD(CtrInternalClientPtr) = *(_DWORD *)buf;
    if ((v4 & 0x80000000) == 0) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  *(_OWORD *)std::string buf = 0u;
  __int128 v16 = 0u;
  if (v4 < 0) {
LABEL_3:
  }
    operator delete(v3);
LABEL_4:
  int v6 = *(void **)&buf[8];
  int v7 = SHIBYTE(v16);
  HIBYTE(v16) = 0;
  buf[8] = 0;
  if (v13 < 0)
  {
    operator delete(__p[0]);
    if ((_DWORD)CtrInternalClientPtr) {
      goto LABEL_6;
    }
LABEL_12:
    unsigned __int8 v10 = any_to_int((const boost::any *)&v14);
    goto LABEL_13;
  }

  if (!(_DWORD)CtrInternalClientPtr) {
    goto LABEL_12;
  }
LABEL_6:
  logging_obg = log_get_logging_obg("com.apple.wpantund.nm", "default");
  char v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(logging_obg);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[NetworkMonitorInstance triggerDeviceDataInterval]";
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s : NM Failed to get the NCP State Property",  buf,  0xCu);
  }

  unsigned __int8 v10 = 0;
LABEL_13:
  if (v14) {
    (*(void (**)(uint64_t))(*(void *)v14 + 8LL))(v14);
  }
  if (v7 < 0) {
    operator delete(v6);
  }
  return v10;
}

- (BOOL)getPrimaryState
{
  BOOL v3 = *(void **)buf;
  int v4 = SBYTE7(v17);
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  uint64_t v15 = 0LL;
  std::string::basic_string[abi:ne180100]<0>(__p, "isPrimaryResident");
  if (CtrInternalClientPtr)
  {
    -[CtrInternalClient getProperty:output:](CtrInternalClientPtr, "getProperty:output:", __p, &v15);
    LODWORD(CtrInternalClientPtr) = *(_DWORD *)buf;
    if ((v4 & 0x80000000) == 0) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  *(_OWORD *)std::string buf = 0u;
  __int128 v17 = 0u;
  if (v4 < 0) {
LABEL_3:
  }
    operator delete(v3);
LABEL_4:
  int v6 = *(void **)&buf[8];
  int v7 = SHIBYTE(v17);
  HIBYTE(v17) = 0;
  buf[8] = 0;
  if (v14 < 0)
  {
    operator delete(__p[0]);
    if ((_DWORD)CtrInternalClientPtr) {
      goto LABEL_6;
    }
  }

  else if ((_DWORD)CtrInternalClientPtr)
  {
LABEL_6:
    logging_obg = log_get_logging_obg("com.apple.wpantund.nm", "default");
    char v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(logging_obg);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)std::string buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[NetworkMonitorInstance getPrimaryState]";
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s : NM Failed to get the isPrimaryResident Property",  buf,  0xCu);
    }

    LOBYTE(v10) = 0;
    goto LABEL_14;
  }

  BOOL v10 = any_to_BOOL((const boost::any *)&v15);
  xpc_object_t v11 = log_get_logging_obg("com.apple.wpantund.nm", "default");
  char v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "isPrimaryResident[%d]", buf, 8u);
  }

- (BOOL)getPreviousPrimaryState
{
  BOOL v3 = *(void **)buf;
  int v4 = SBYTE7(v17);
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  uint64_t v15 = 0LL;
  std::string::basic_string[abi:ne180100]<0>(__p, "wasPrimaryResident");
  if (CtrInternalClientPtr)
  {
    -[CtrInternalClient getProperty:output:](CtrInternalClientPtr, "getProperty:output:", __p, &v15);
    LODWORD(CtrInternalClientPtr) = *(_DWORD *)buf;
    if ((v4 & 0x80000000) == 0) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  *(_OWORD *)std::string buf = 0u;
  __int128 v17 = 0u;
  if (v4 < 0) {
LABEL_3:
  }
    operator delete(v3);
LABEL_4:
  int v6 = *(void **)&buf[8];
  int v7 = SHIBYTE(v17);
  HIBYTE(v17) = 0;
  buf[8] = 0;
  if (v14 < 0)
  {
    operator delete(__p[0]);
    if ((_DWORD)CtrInternalClientPtr) {
      goto LABEL_6;
    }
  }

  else if ((_DWORD)CtrInternalClientPtr)
  {
LABEL_6:
    logging_obg = log_get_logging_obg("com.apple.wpantund.nm", "default");
    char v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(logging_obg);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)std::string buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[NetworkMonitorInstance getPreviousPrimaryState]";
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s : NM Failed to get the wasPrimaryResident Property",  buf,  0xCu);
    }

    LOBYTE(v10) = 0;
    goto LABEL_14;
  }

  BOOL v10 = any_to_BOOL((const boost::any *)&v15);
  xpc_object_t v11 = log_get_logging_obg("com.apple.wpantund.nm", "default");
  char v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "wasPrimaryResident[%d]", buf, 8u);
  }

- (void)startRespawnConvergenceTimer
{
  __int128 v17 = __p;
  BOOL v3 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>( (uint64_t **)&network_monitor_settings,  (const void **)__p,  (uint64_t)&std::piecewise_construct,  &v17);
  boost::any::any<std::string &>(&v16, (uint64_t)(v3 + 7));
  if (v19 < 0) {
    operator delete(*(void **)__p);
  }
  int v4 = any_to_int((const boost::any *)&v16);
  if (v4 >= 600) {
    int v5 = 600;
  }
  else {
    int v5 = v4;
  }
  if (v5 <= 120) {
    uint64_t v6 = 120LL;
  }
  else {
    uint64_t v6 = v5;
  }
  int v7 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_fQueue);
  nm_respawn_convergence_timer = self->_nm_respawn_convergence_timer;
  self->_nm_respawn_convergence_timer = v7;

  logging_obg = log_get_logging_obg("com.apple.wpantund.nm", "default");
  BOOL v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(logging_obg);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)std::string __p = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Starting Respawn Convergence Timer", __p, 2u);
  }

  dispatch_time_t v11 = dispatch_time(0LL, 1000000000LL * v6);
  dispatch_source_set_timer((dispatch_source_t)self->_nm_respawn_convergence_timer, v11, 0xFFFFFFFFFFFFFFFFLL, 0LL);
  xpc_object_t v12 = self->_nm_respawn_convergence_timer;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = __54__NetworkMonitorInstance_startRespawnConvergenceTimer__block_invoke;
  v15[3] = &unk_1004414D8;
  v15[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)v12, v15);
  dispatch_activate((dispatch_object_t)self->_nm_respawn_convergence_timer);
  char v13 = log_get_logging_obg("com.apple.wpantund.nm", "default");
  char v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string __p = 134217984;
    *(void *)&__p[4] = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "RespawnConvergenceTimer : Timer periodicity(s)=%lld",  __p,  0xCu);
  }

  if (v16) {
    (*(void (**)(uint64_t))(*(void *)v16 + 8LL))(v16);
  }
}

void __54__NetworkMonitorInstance_startRespawnConvergenceTimer__block_invoke(uint64_t a1)
{
  logging_obg = log_get_logging_obg("com.apple.wpantund.nm", "default");
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(logging_obg);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(__p[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "nm_respawn_convergence_timer: TIMEOUT",  (uint8_t *)__p,  2u);
  }

  [*(id *)(a1 + 32) handleRespawnConvergenceTimer];
  std::string::basic_string[abi:ne180100]<0>(__p, "Command Error");
  if (v5 < 0) {
    operator delete(__p[0]);
  }
}

- (void)handleRespawnConvergenceTimer
{
  __darwin_time_t tv_sec = v13.tv_sec;
  logging_obg = log_get_logging_obg("com.apple.wpantund.nm", "default");
  char v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(logging_obg);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 134217984;
    __darwin_time_t v15 = tv_sec;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "RespawnConvergenceTimer Timeout time_sec[%llu]",  buf,  0xCu);
  }

  __darwin_suseconds_t v6 = -[NetworkMonitorInstance getPrimaryState](self, "getPrimaryState");
  int v7 = -[NetworkMonitorInstance getPreviousPrimaryState](self, "getPreviousPrimaryState");
  int v8 = -[NetworkMonitorInstance getNCPState](self, "getNCPState");
  int v9 = -[NetworkMonitorInstance getNodeType:](self, "getNodeType:", 1LL);
  BOOL v10 = (NetworkMonitorManager *)-[NetworkMonitorInstance getNodeType:](self, "getNodeType:", 0LL);
  int v11 = (int)v10;
  Instance = NetworkMonitorManager::getInstance(v10);
  NetworkMonitorManager::perform_respawn_convergence_actions((uint64_t)Instance, v8, v6, v7, v9, v11);
}

- (void)startNetworkMonitorTimer
{
  BOOL v3 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_fQueue);
  nm_timer = self->_nm_timer;
  self->_nm_timer = v3;

  logging_obg = log_get_logging_obg("com.apple.wpantund.nm", "default");
  __darwin_suseconds_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(logging_obg);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)std::string buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Starting Network Monitor Timer", buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(buf, "nm:periodic:timer");
  uint64_t v16 = buf;
  int v7 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>( (uint64_t **)&network_monitor_settings,  (const void **)buf,  (uint64_t)&std::piecewise_construct,  &v16);
  boost::any::any<std::string &>(&v15, (uint64_t)(v7 + 7));
  if (v18 < 0) {
    operator delete(*(void **)buf);
  }
  int v8 = any_to_int((const boost::any *)&v15);
  if (v8 <= 180) {
    uint64_t v9 = 180LL;
  }
  else {
    uint64_t v9 = v8;
  }
  dispatch_time_t v10 = dispatch_time(0LL, 1000000000LL * v9);
  dispatch_source_set_timer((dispatch_source_t)self->_nm_timer, v10, 1000000000LL * v9, 0LL);
  int v11 = self->_nm_timer;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = __50__NetworkMonitorInstance_startNetworkMonitorTimer__block_invoke;
  v14[3] = &unk_1004414D8;
  v14[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)v11, v14);
  dispatch_activate((dispatch_object_t)self->_nm_timer);
  xpc_object_t v12 = log_get_logging_obg("com.apple.wpantund.nm", "default");
  timeval v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 134217984;
    *(void *)&uint8_t buf[4] = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "NetworkMonitorTimer : Timer periodicity(s)=%lld",  buf,  0xCu);
  }

  if (v15) {
    (*(void (**)(uint64_t))(*(void *)v15 + 8LL))(v15);
  }
}

void __50__NetworkMonitorInstance_startNetworkMonitorTimer__block_invoke(uint64_t a1)
{
  if (v2 < 0) {
    operator delete(__p);
  }
}

- (void)handleNetworkMonitorTimer
{
  __darwin_time_t tv_sec = v19.tv_sec;
  logging_obg = log_get_logging_obg("com.apple.wpantund.nm", "default");
  char v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(logging_obg);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf.__r_.__value_.__l.__data_) = 134217984;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = tv_sec;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Network Monitor Periodic Timeout time_sec[%llu]",  (uint8_t *)&buf,  0xCu);
  }

  __darwin_suseconds_t v6 = (NetworkMonitorManager *)-[NetworkMonitorInstance getPrimaryState](self, "getPrimaryState");
  int v7 = (int)v6;
  Instance = NetworkMonitorManager::getInstance(v6);
  NetworkMonitorManager::switch_monitoring_interval(Instance, tv_sec, v7);
  if (v7)
  {
    uint64_t v9 = (NetworkMonitorManager *)-[NetworkMonitorInstance getNCPState](self, "getNCPState");
    int v10 = (int)v9;
    if ((_DWORD)v9 == 8)
    {
      int v11 = NetworkMonitorManager::getInstance((NetworkMonitorManager *)-[NetworkMonitorInstance startPeriodicAcitvityGuardTimer]( self,  "startPeriodicAcitvityGuardTimer"));
      NetworkMonitorManager::perform_primary_task_Actions((uint64_t)v11, 8);
      std::string::basic_string[abi:ne180100]<0>(&buf, "ff03::1");
      else {
        std::string __p = buf;
      }
      unsigned int v15 = -[NetworkMonitorInstance getDeviceData:](self, "getDeviceData:", &__p);
      uint64_t v16 = log_get_logging_obg("com.apple.wpantund.nm", "default");
      __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int v20 = 67109120;
        unsigned int v21 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "Network Monitor getDeviceData result[%d]",  v20,  8u);
      }
    }

    else
    {
      char v14 = NetworkMonitorManager::getInstance(v9);
      NetworkMonitorManager::perform_primary_task_Actions((uint64_t)v14, v10);
    }
  }

  else
  {
    xpc_object_t v12 = log_get_logging_obg("com.apple.wpantund.nm", "default");
    timeval v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf.__r_.__value_.__l.__data_) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Not a primary resident", (uint8_t *)&buf, 2u);
    }
  }

- (void)startPeriodicAcitvityGuardTimer
{
  __int128 v17 = __p;
  BOOL v3 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>( (uint64_t **)&network_monitor_settings,  (const void **)__p,  (uint64_t)&std::piecewise_construct,  &v17);
  boost::any::any<std::string &>(&v16, (uint64_t)(v3 + 7));
  if (v19 < 0) {
    operator delete(*(void **)__p);
  }
  int v4 = any_to_int((const boost::any *)&v16);
  if (v4 >= 600) {
    int v5 = 600;
  }
  else {
    int v5 = v4;
  }
  if (v5 <= 120) {
    uint64_t v6 = 120LL;
  }
  else {
    uint64_t v6 = v5;
  }
  int v7 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_fQueue);
  nm_periodic_activity_guard_timer = self->_nm_periodic_activity_guard_timer;
  self->_nm_periodic_activity_guard_timer = v7;

  logging_obg = log_get_logging_obg("com.apple.wpantund.nm", "default");
  int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(logging_obg);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)std::string __p = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Starting Periodic Activity Guard Timer", __p, 2u);
  }

  dispatch_time_t v11 = dispatch_time(0LL, 1000000000LL * v6);
  dispatch_source_set_timer((dispatch_source_t)self->_nm_periodic_activity_guard_timer, v11, 0xFFFFFFFFFFFFFFFFLL, 0LL);
  xpc_object_t v12 = self->_nm_periodic_activity_guard_timer;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = __57__NetworkMonitorInstance_startPeriodicAcitvityGuardTimer__block_invoke;
  v15[3] = &unk_1004414D8;
  v15[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)v12, v15);
  dispatch_activate((dispatch_object_t)self->_nm_periodic_activity_guard_timer);
  timeval v13 = log_get_logging_obg("com.apple.wpantund.nm", "default");
  char v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string __p = 134217984;
    *(void *)&__p[4] = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "nm_periodic_activity_guard_timer : Timer periodicity(s)=%lld",  __p,  0xCu);
  }

  if (v16) {
    (*(void (**)(uint64_t))(*(void *)v16 + 8LL))(v16);
  }
}

void __57__NetworkMonitorInstance_startPeriodicAcitvityGuardTimer__block_invoke(uint64_t a1)
{
  logging_obg = log_get_logging_obg("com.apple.wpantund.nm", "default");
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(logging_obg);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(__p[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "nm_periodic_activity_guard_timer: TIMEOUT",  (uint8_t *)__p,  2u);
  }

  [*(id *)(a1 + 32) handlePeriodicActivityGuardTimer];
  std::string::basic_string[abi:ne180100]<0>(__p, "Command Error");
  if (v5 < 0) {
    operator delete(__p[0]);
  }
}

- (void)handlePeriodicActivityGuardTimer
{
  __darwin_time_t tv_sec = v9.tv_sec;
  logging_obg = log_get_logging_obg("com.apple.wpantund.nm", "default");
  char v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(logging_obg);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 134217984;
    __darwin_time_t v11 = tv_sec;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Network Monitor Periodic Activity TIMEOUT time_sec[%llu]",  buf,  0xCu);
  }

  uint64_t v6 = (NetworkMonitorManager *)-[NetworkMonitorInstance getNCPState](self, "getNCPState");
  int v7 = (int)v6;
  Instance = NetworkMonitorManager::getInstance(v6);
  NetworkMonitorManager::perform_periodic_guard_timeout_actions((uint64_t)Instance, v7);
}

- (BOOL)getDeviceData:()basic_string<char
{
  int v4 = self;
  if (v4)
  {
    memset(&v37, 0, sizeof(v37));
    std::string::basic_string[abi:ne180100]<0>(buf, "Command Error");
    char v5 = *(void **)buf;
    int v6 = SBYTE7(v36);
    std::string::operator=(&v37, (const std::string *)a3);
    LOBYTE(v38) = 100;
    __int16 v39 = 1;
    int v7 = (void *)objc_claimAutoreleasedReturnValue(-[NetworkMonitorInstance CtrInternalClientPtr](v4, "CtrInternalClientPtr"));
    else {
      std::string __p = v37;
    }
    __int128 v33 = v38;
    __int16 v34 = v39;
    if (v7)
    {
      objc_msgSend(v7, "get_device_data_diag:", &__p);
      int v18 = *(_DWORD *)buf;
      if ((v6 & 0x80000000) == 0)
      {
LABEL_11:
        char v19 = *(void **)&buf[8];
        int v20 = SHIBYTE(v36);
        HIBYTE(v36) = 0;
        buf[8] = 0;

        BOOL v17 = v18 == 0;
        if (v18)
        {
          logging_obg = log_get_logging_obg("com.apple.wpantund.nm", "default");
          __int16 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(logging_obg);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            -[NetworkMonitorInstance getDeviceData:].cold.2(v22, v23, v24, v25, v26, v27, v28, v29);
          }
        }

        else
        {
          v30 = log_get_logging_obg("com.apple.wpantund.nm", "default");
          __int16 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)std::string buf = 136315138;
            *(void *)&uint8_t buf[4] = "-[NetworkMonitorInstance getDeviceData:]";
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%s start success", buf, 0xCu);
          }
        }

        if (v20 < 0) {
          operator delete(v19);
        }
        goto LABEL_24;
      }
    }

    else
    {
      int v18 = 0;
      *(_OWORD *)std::string buf = 0u;
      __int128 v36 = 0u;
      if ((v6 & 0x80000000) == 0) {
        goto LABEL_11;
      }
    }

    operator delete(v5);
    goto LABEL_11;
  }

  int v8 = log_get_logging_obg("com.apple.wpantund.nm", "default");
  timeval v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[NetworkMonitorInstance getDeviceData:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
  }

  BOOL v17 = 0;
LABEL_24:

  return v17;
}

- (void)startDeviceDataIntervalTimer
{
  BOOL v3 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_fQueue);
  nm_device_data_interval_timer = self->_nm_device_data_interval_timer;
  self->_nm_device_data_interval_timer = v3;

  logging_obg = log_get_logging_obg("com.apple.wpantund.nm", "default");
  int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(logging_obg);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)std::string buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Starting Device data interval Timer", buf, 2u);
  }

  std::string::basic_string[abi:ne180100]<0>(buf, "nm:devicedata:interval:timer");
  uint64_t v16 = buf;
  int v7 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>( (uint64_t **)&network_monitor_settings,  (const void **)buf,  (uint64_t)&std::piecewise_construct,  &v16);
  boost::any::any<std::string &>(&v15, (uint64_t)(v7 + 7));
  if (v18 < 0) {
    operator delete(*(void **)buf);
  }
  int v8 = any_to_int((const boost::any *)&v15);
  uint64_t v9 = 1000000000LL * v8;
  dispatch_time_t v10 = dispatch_time(0LL, v9);
  dispatch_source_set_timer((dispatch_source_t)self->_nm_device_data_interval_timer, v10, v9, 0LL);
  uint64_t v11 = self->_nm_device_data_interval_timer;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = __54__NetworkMonitorInstance_startDeviceDataIntervalTimer__block_invoke;
  v14[3] = &unk_1004414D8;
  v14[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)v11, v14);
  dispatch_activate((dispatch_object_t)self->_nm_device_data_interval_timer);
  uint64_t v12 = log_get_logging_obg("com.apple.wpantund.nm", "default");
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 134217984;
    *(void *)&uint8_t buf[4] = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "DeviceDataInterval : Timer periodicity(s)=%lld",  buf,  0xCu);
  }

  if (v15) {
    (*(void (**)(uint64_t))(*(void *)v15 + 8LL))(v15);
  }
}

void __54__NetworkMonitorInstance_startDeviceDataIntervalTimer__block_invoke(uint64_t a1)
{
  if (v2 < 0) {
    operator delete(__p);
  }
}

- (void)handleDeviceDataIntervalTimer
{
  __darwin_time_t tv_sec = v6.tv_sec;
  logging_obg = log_get_logging_obg("com.apple.wpantund.nm", "default");
  char v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(logging_obg);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 134217984;
    __darwin_time_t v8 = tv_sec;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "DeviceDataInterval Timeout time_sec[%llu]",  buf,  0xCu);
  }

  -[NetworkMonitorInstance triggerDeviceDataInterval](self, "triggerDeviceDataInterval");
}

- (BOOL)pingNode:()basic_string<char count:()std:(std::allocator<char>> *)a3 :char_traits<char>
{
  __int16 v4 = v3;
  timeval v6 = self;
  if (v6)
  {
    memset(&v36, 0, sizeof(v36));
    std::string::basic_string[abi:ne180100]<0>(buf, "Command Error");
    int v7 = *(void **)buf;
    int v8 = SBYTE7(v39);
    std::string::operator=(&v36, (const std::string *)a3);
    __int16 v37 = v4;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NetworkMonitorInstance CtrInternalClientPtr](v6, "CtrInternalClientPtr"));
    else {
      std::string __p = v36;
    }
    __int16 v35 = v37;
    if (v9)
    {
      objc_msgSend(v9, "send_ping_node:", &__p);
      int v20 = *(_DWORD *)buf;
      if ((v8 & 0x80000000) == 0)
      {
LABEL_11:
        unsigned int v21 = *(void **)&buf[8];
        int v22 = SHIBYTE(v39);
        HIBYTE(v39) = 0;
        buf[8] = 0;

        BOOL v19 = v20 == 0;
        if (v20)
        {
          logging_obg = log_get_logging_obg("com.apple.wpantund.nm", "default");
          uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(logging_obg);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
            -[NetworkMonitorInstance pingNode:count:].cold.2(v24, v25, v26, v27, v28, v29, v30, v31);
          }
        }

        else
        {
          v32 = log_get_logging_obg("com.apple.wpantund.nm", "default");
          uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)std::string buf = 136315138;
            *(void *)&uint8_t buf[4] = "-[NetworkMonitorInstance pingNode:count:]";
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s Ping start success", buf, 0xCu);
          }
        }

        if (v22 < 0) {
          operator delete(v21);
        }
        goto LABEL_24;
      }
    }

    else
    {
      int v20 = 0;
      *(_OWORD *)std::string buf = 0u;
      __int128 v39 = 0u;
      if ((v8 & 0x80000000) == 0) {
        goto LABEL_11;
      }
    }

    operator delete(v7);
    goto LABEL_11;
  }

  dispatch_time_t v10 = log_get_logging_obg("com.apple.wpantund.nm", "default");
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[NetworkMonitorInstance pingNode:count:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);
  }

  BOOL v19 = 0;
LABEL_24:

  return v19;
}

- (CtrInternalClient)CtrInternalClientPtr
{
  return (CtrInternalClient *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setCtrInternalClientPtr:(id)a3
{
}

- (OS_dispatch_source)nm_respawn_convergence_timer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setNm_respawn_convergence_timer:(id)a3
{
}

- (OS_dispatch_source)nm_timer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setNm_timer:(id)a3
{
}

- (OS_dispatch_source)nm_periodic_activity_guard_timer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setNm_periodic_activity_guard_timer:(id)a3
{
}

- (OS_dispatch_source)nm_device_data_interval_timer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setNm_device_data_interval_timer:(id)a3
{
}

- (OS_dispatch_queue)fQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setFQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)networkMonitorInstance_MsgHandler:message:.cold.1()
{
}

- (void)networkMonitorInstance_MsgHandler:(os_log_s *)a3 message:.cold.2( uint64_t **a1,  uint64_t a2,  os_log_s *a3)
{
  else {
    uint64_t v3 = *(void *)a2;
  }
  LODWORD(v4) = 136315394;
  *(void *)((char *)&v4 + 4) = a1;
  WORD6(v4) = 2080;
  HIWORD(v4) = v3;
  OUTLINED_FUNCTION_2_3( (void *)&_mh_execute_header,  a2,  a3,  "Wrong message received from client %s for method %s ",  (const char *)v4,  *((const char **)&v4 + 1));
  OUTLINED_FUNCTION_2_0();
}

- (void)networkMonitorInstance_MsgHandler:message:.cold.3()
{
  else {
    uint64_t v3 = *(void *)v0;
  }
  LODWORD(v4) = 136315394;
  *(void *)((char *)&v4 + 4) = v2;
  WORD6(v4) = 2080;
  HIWORD(v4) = v3;
  OUTLINED_FUNCTION_2_3( (void *)&_mh_execute_header,  v0,  v1,  "method \"%s\" property \"%s\"",  (const char *)v4,  *((const char **)&v4 + 1));
  OUTLINED_FUNCTION_2_0();
}

- (void)getDeviceData:(uint64_t)a3 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)getDeviceData:(uint64_t)a3 .cold.2( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)pingNode:(uint64_t)a3 count:(uint64_t)a4 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)pingNode:(uint64_t)a3 count:(uint64_t)a4 .cold.2( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end