@interface NEHelperWiFiInfoManager
- (NEHelperWiFiInfoManager)initWithFirstMessage:(id)a3;
- (OS_dispatch_queue)handlerQueue;
- (void)dealloc;
- (void)handleMessage:(id)a3;
@end

@implementation NEHelperWiFiInfoManager

- (NEHelperWiFiInfoManager)initWithFirstMessage:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___NEHelperWiFiInfoManager;
  v5 = -[NEHelperWiFiInfoManager init](&v24, "init");
  if (v5)
  {
    uint64_t v6 = NECopySigningIdentifierForXPCMessage(v4);
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v6;

    dispatch_queue_attr_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v8);
    dispatch_queue_t v10 = dispatch_queue_create("NEHelperWiFiInfoManagerMainTaskQueue", v9);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v10;

    xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(v4);
    uint64_t v13 = objc_claimAutoreleasedReturnValue(remote_connection);
    connection = v5->_connection;
    v5->_connection = (OS_xpc_object *)v13;

    uint64_t v17 = ne_log_obj(v15, v16);
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = (void *)objc_opt_class(v5);
      v20 = v5->_bundleID;
      *(_DWORD *)buf = 138412546;
      v26 = v19;
      __int16 v27 = 2112;
      v28 = v20;
      id v21 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "%@ Created new WiFi Info Helper delegate for [%@]",  buf,  0x16u);
    }

    v22 = v5;
  }

  return v5;
}

- (OS_dispatch_queue)handlerQueue
{
  if (self) {
    self = (NEHelperWiFiInfoManager *)objc_getProperty(self, a2, 48LL, 1);
  }
  return (OS_dispatch_queue *)self;
}

- (void)dealloc
{
  uint64_t v3 = ne_log_obj(self, a2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = (id)objc_opt_class(self);
    id v5 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%@ dealloc()", buf, 0xCu);
  }

  myCFRelease(&self->_network);
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NEHelperWiFiInfoManager;
  -[NEHelperWiFiInfoManager dealloc](&v6, "dealloc");
}

- (void)handleMessage:(id)a3
{
  id v4 = a3;
  string = xpc_dictionary_get_string(v4, "interface-name");
  uint64_t v7 = ne_log_obj(string, v6);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (void *)objc_opt_class(self);
    dispatch_queue_t v10 = "(nil)";
    if (string) {
      dispatch_queue_t v10 = string;
    }
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v10;
    id v11 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%@ processing Wi-Fi information request for %s",  buf,  0x16u);
  }

  id v12 = v4;
  uint64_t v13 = v12;
  if (self)
  {
    id v14 = v12;
    uint64_t v15 = v14;
    if (v14)
    {
      uint64_t v16 = xpc_dictionary_get_string(v14, "interface-name");
      if (v16)
      {
        uint64_t v17 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v16));
        interfaceName = self->_interfaceName;
        self->_interfaceName = v17;
      }

      self->_isSecurityTypeRequested = xpc_dictionary_get_BOOL(v15, "security-type-requested");
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472LL;
      *(void *)&buf[16] = sub_10000D4B4;
      *(void *)&buf[24] = &unk_100035580;
      v139 = self;
      dispatch_sync(&_dispatch_main_q, buf);
      if (!self->_network)
      {
        uint64_t v21 = ne_log_obj(v19, v20);
        v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          v23 = (void *)objc_opt_class(self);
          *(_DWORD *)v142 = 138412290;
          *(void *)&v142[4] = v23;
          id v24 = v23;
          _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "%@ device is not associated to Wi-Fi network",  v142,  0xCu);
        }
      }
    }

    v25 = self->_connection;
    if (qword_10003EB50 != -1) {
      dispatch_once(&qword_10003EB50, &stru_100034D10);
    }
    if (byte_10003EB48)
    {
      if (nelog_is_debug_logging_enabled())
      {
        pid_t pid = xpc_connection_get_pid(v25);
        uint64_t v27 = proc_name(pid, buf, 0x40u);
        uint64_t v29 = ne_log_obj(v27, v28);
        v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v142 = 136315138;
          *(void *)&v142[4] = buf;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEBUG,  "Process [%s] is requesting current Wi-Fi network information",  v142,  0xCu);
        }
      }

      v31 = (void *)xpc_connection_copy_entitlement_value(v25, "com.apple.captive.private");
      v32 = v31;
      if (v31 && xpc_get_type(v31) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v32))
      {

        uint64_t v35 = ne_log_obj(v33, v34);
        v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          v135 = (void *)objc_opt_class(self);
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v135;
          id v136 = v135;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEBUG,  "%@ calling process has private entitlement",  buf,  0xCu);
        }

        sub_10000C93C((uint64_t)self, v15);
        goto LABEL_86;
      }
    }

    memset(buf, 0, sizeof(buf));
    xpc_dictionary_get_audit_token(v15, buf);
    id v137 = 0LL;
    *(_OWORD *)v142 = *(_OWORD *)buf;
    *(_OWORD *)&v142[16] = *(_OWORD *)&buf[16];
    v37 = (void *)objc_claimAutoreleasedReturnValue( +[LSBundleRecord bundleRecordForAuditToken:error:]( &OBJC_CLASS___LSBundleRecord,  "bundleRecordForAuditToken:error:",  v142,  &v137));
    id v38 = v137;
    v40 = v38;
    if (v37)
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue([v37 SDKVersion]);
    }

    else
    {
      uint64_t v42 = ne_log_obj(v38, v39);
      v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v142 = 138412546;
        *(void *)&v142[4] = self;
        *(_WORD *)&v142[12] = 2112;
        *(void *)&v142[14] = v40;
        _os_log_error_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_ERROR,  "%@ failed to get bundle record, error: %@",  v142,  0x16u);
      }

      v41 = 0LL;
    }

    uint64_t v46 = ne_log_obj(v44, v45);
    v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
    {
      v119 = (void *)objc_opt_class(self);
      bundleID = self->_bundleID;
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v119;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = bundleID;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&buf[24] = v41;
      id v121 = v119;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEBUG,  "%@ [%@] is built with SDK version [%@]",  buf,  0x20u);
    }

    if (!v41) {
      goto LABEL_42;
    }
    id v50 = v41;
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
    unsigned __int8 v52 = [v51 isVersion:v50 greaterThanOrEqualToVersion:@"12.0"];

    if ((v52 & 1) != 0)
    {
      v55 = (void *)xpc_connection_copy_entitlement_value(self->_connection, "com.apple.developer.networking.wifi-info");
      v56 = v55;
      if (!v55 || xpc_get_type(v55) != (xpc_type_t)&_xpc_type_BOOL || !xpc_BOOL_get_value(v56))
      {

        uint64_t v59 = ne_log_obj(v57, v58);
        v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
        if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
        {
          v61 = (void *)objc_opt_class(self);
          v62 = self->_bundleID;
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v61;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v62;
          *(_WORD *)&buf[22] = 2080;
          *(void *)&buf[24] = "com.apple.developer.networking.wifi-info";
          id v63 = v61;
          _os_log_impl( (void *)&_mh_execute_header,  v60,  OS_LOG_TYPE_INFO,  "%@ [%@] missing %s entitlement",  buf,  0x20u);
        }

LABEL_42:
        uint64_t v64 = ne_log_obj(v48, v49);
        v65 = (os_log_s *)objc_claimAutoreleasedReturnValue(v64);
        if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
        {
          v66 = (void *)objc_opt_class(self);
          v67 = self->_bundleID;
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v66;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v67;
          id v68 = v66;
          _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_INFO, "%@ [%@] is not entitled", buf, 0x16u);
        }

        sub_10000D114((uint64_t)self, v15, 1LL);
        goto LABEL_85;
      }
    }

    else
    {
      uint64_t v69 = ne_log_obj(v53, v54);
      v56 = (void *)objc_claimAutoreleasedReturnValue(v69);
      if (os_log_type_enabled((os_log_t)v56, OS_LOG_TYPE_INFO))
      {
        v70 = (void *)objc_opt_class(self);
        v71 = self->_bundleID;
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v70;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v71;
        id v72 = v70;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v56,  OS_LOG_TYPE_INFO,  "%@ [%@] linked before iOS 12.0",  buf,  0x16u);
      }
    }

    uint64_t v75 = ne_log_obj(v73, v74);
    v76 = (os_log_s *)objc_claimAutoreleasedReturnValue(v75);
    if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
    {
      v77 = (void *)objc_opt_class(self);
      v78 = self->_bundleID;
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v77;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v78;
      id v79 = v77;
      _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_INFO, "%@ [%@] is entitled", buf, 0x16u);
    }

    uint64_t v80 = objc_opt_class(&OBJC_CLASS___CLLocationManager);
    if (v80)
    {
      v82 = self->_bundleID;
      *(void *)v142 = 0LL;
      unsigned int v83 = +[CLLocationManager _checkAndExerciseAuthorizationForBundleID:error:]( &OBJC_CLASS___CLLocationManager,  "_checkAndExerciseAuthorizationForBundleID:error:",  v82,  v142);
      id v84 = *(id *)v142;
      v86 = v84;
      if (v84)
      {
        uint64_t v87 = ne_log_obj(v84, v85);
        v88 = (os_log_s *)objc_claimAutoreleasedReturnValue(v87);
        if (os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
        {
          v89 = (void *)objc_opt_class(self);
          v90 = self->_bundleID;
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v89;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v90;
          *(_WORD *)&buf[22] = 2112;
          *(void *)&buf[24] = v86;
          id v91 = v89;
          _os_log_impl( (void *)&_mh_execute_header,  v88,  OS_LOG_TYPE_INFO,  "%@ failed to find location authorization for [%@] [%@]",  buf,  0x20u);
        }

        unsigned int v83 = 0;
      }
    }

    else
    {
      unsigned int v83 = 0;
    }

    uint64_t v92 = ne_log_obj(v80, v81);
    v93 = (os_log_s *)objc_claimAutoreleasedReturnValue(v92);
    BOOL v94 = os_log_type_enabled(v93, OS_LOG_TYPE_INFO);
    if (v83)
    {
      if (v94)
      {
        v95 = (void *)objc_opt_class(self);
        v96 = self->_bundleID;
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v95;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v96;
        id v97 = v95;
        v98 = "%@ [%@] is authorized to access the location";
LABEL_83:
        _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_INFO, v98, buf, 0x16u);
      }
    }

    else
    {
      if (v94)
      {
        v99 = (void *)objc_opt_class(self);
        v100 = self->_bundleID;
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v99;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v100;
        id v101 = v99;
        _os_log_impl( (void *)&_mh_execute_header,  v93,  OS_LOG_TYPE_INFO,  "%@ [%@] is not authorized to access the location",  buf,  0x16u);
      }

      id network = self->_network;
      if (network && (id network = (id)WiFiNetworkGetBundleIdentifier(network)) != 0LL)
      {
        id network = -[NSString isEqual:](self->_bundleID, "isEqual:", network);
        int v104 = (int)network;
      }

      else
      {
        int v104 = 0;
      }

      uint64_t v105 = ne_log_obj(network, v102);
      v93 = (os_log_s *)objc_claimAutoreleasedReturnValue(v105);
      BOOL v106 = os_log_type_enabled(v93, OS_LOG_TYPE_INFO);
      if (!v104)
      {
        if (v106)
        {
          v109 = (void *)objc_opt_class(self);
          v110 = self->_bundleID;
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v109;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v110;
          id v111 = v109;
          _os_log_impl( (void *)&_mh_execute_header,  v93,  OS_LOG_TYPE_INFO,  "%@ [%@] has not configured the current network",  buf,  0x16u);
        }

        v112 = (void *)xpc_connection_copy_entitlement_value( self->_connection,  "com.apple.developer.networking.networkextension");
        if ((NEGetEntitlement() & 3) != 0)
        {
          id v114 = +[LSPlugInKitProxy pluginKitProxyForIdentifier:]( &OBJC_CLASS___LSPlugInKitProxy,  "pluginKitProxyForIdentifier:",  objc_getProperty(self, v113, 32LL, 1));
          v115 = (void *)objc_claimAutoreleasedReturnValue(v114);
          v116 = v115;
          if (v115)
          {
            v117 = (void *)objc_claimAutoreleasedReturnValue([v115 protocol]);
            BOOL v118 = ([v117 isEqualToString:@"com.apple.networkextension.app-proxy"] & 1) != 0
                || [v117 isEqualToString:@"com.apple.networkextension.packet-tunnel"];
          }

          else
          {
            BOOL v118 = 0;
          }
        }

        else
        {
          BOOL v118 = 0;
        }

        uint64_t v124 = ne_log_obj(v122, v123);
        v93 = (os_log_s *)objc_claimAutoreleasedReturnValue(v124);
        BOOL v125 = os_log_type_enabled(v93, OS_LOG_TYPE_INFO);
        if (!v118)
        {
          if (v125)
          {
            v128 = (void *)objc_opt_class(self);
            v129 = self->_bundleID;
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v128;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v129;
            id v130 = v128;
            _os_log_impl( (void *)&_mh_execute_header,  v93,  OS_LOG_TYPE_INFO,  "%@ [%@] is not a VPN provider",  buf,  0x16u);
          }

          *(void *)buf = _NSConcreteStackBlock;
          *(void *)&buf[8] = 3221225472LL;
          *(void *)&buf[16] = sub_10000CC34;
          *(void *)&buf[24] = &unk_100035230;
          v139 = self;
          id v140 = v15;
          id v141 = v50;
          v131 = buf;
          v132 = (void *)objc_claimAutoreleasedReturnValue( +[NEConfigurationManager sharedManagerForAllUsers]( &OBJC_CLASS___NEConfigurationManager,  "sharedManagerForAllUsers"));
          queue = self->_queue;
          *(void *)v142 = _NSConcreteStackBlock;
          *(void *)&v142[8] = 3221225472LL;
          *(void *)&v142[16] = sub_10000D238;
          *(void *)&v142[24] = &unk_100034CF0;
          v143 = self;
          v134 = v131;
          v144 = v134;
          [v132 loadConfigurations:0 withFilter:0 completionQueue:queue completionHandler:v142];

          goto LABEL_85;
        }

        if (!v125) {
          goto LABEL_84;
        }
        v126 = (void *)objc_opt_class(self);
        v127 = self->_bundleID;
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v126;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v127;
        id v97 = v126;
        v98 = "%@ [%@] is a VPN provider";
        goto LABEL_83;
      }

      if (v106)
      {
        v107 = (void *)objc_opt_class(self);
        v108 = self->_bundleID;
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v107;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v108;
        id v97 = v107;
        v98 = "%@ [%@] has configured the current network";
        goto LABEL_83;
      }
    }

- (void).cxx_destruct
{
}

@end