@interface NEHelperInterfaceManager
- (NEHelperInterfaceManager)initWithFirstMessage:(id)a3;
- (OS_dispatch_queue)handlerQueue;
- (void)handleMessage:(id)a3;
@end

@implementation NEHelperInterfaceManager

- (NEHelperInterfaceManager)initWithFirstMessage:(id)a3
{
  xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(remote_connection);
  BOOL v6 = sub_100010A1C((uint64_t)&OBJC_CLASS___NEHelperServer, v5, (uint64_t)"com.apple.private.nehelper.privileged");
  if (v6)
  {
    v18.receiver = self;
    v18.super_class = (Class)&OBJC_CLASS___NEHelperInterfaceManager;
    v8 = -[NEHelperInterfaceManager init](&v18, "init");
    if (v8)
    {
      dispatch_queue_attr_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v9);
      dispatch_queue_t v11 = dispatch_queue_create("NEHelperInterfaceManager", v10);
      queue = v8->_queue;
      v8->_queue = (OS_dispatch_queue *)v11;
    }

    self = v8;
    v13 = self;
  }

  else
  {
    uint64_t v14 = ne_log_obj(v6, v7);
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v17 = sub_100010A78((uint64_t)&OBJC_CLASS___NEHelperServer, v5);
      *(_DWORD *)buf = 138412546;
      v20 = v17;
      __int16 v21 = 2080;
      v22 = "com.apple.private.nehelper.privileged";
      _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Denying interface manager connection because %@ does not have the %s entitlement",  buf,  0x16u);
    }

    v13 = 0LL;
  }

  return v13;
}

- (OS_dispatch_queue)handlerQueue
{
  if (self) {
    self = (NEHelperInterfaceManager *)objc_getProperty(self, a2, 8LL, 1);
  }
  return (OS_dispatch_queue *)self;
}

- (void)handleMessage:(id)a3
{
  id v3 = a3;
  switch(xpc_dictionary_get_uint64(v3, "interface-command"))
  {
    case 1uLL:
      __int128 v98 = 0uLL;
      int uint64 = xpc_dictionary_get_uint64(v3, "interface-ftype");
      string = xpc_dictionary_get_string(v3, "interface-name");
      uint64_t v97 = 535847LL;
      __int128 v117 = 0u;
      __int128 v118 = 0u;
      if ((uint64 - 1) >= 3)
      {
        uint64_t v71 = ne_log_obj(string, v6);
        v72 = (os_log_s *)objc_claimAutoreleasedReturnValue(v71);
        if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
        {
          LODWORD(length[0]) = 67109120;
          HIDWORD(length[0]) = uint64;
          _os_log_error_impl( (void *)&_mh_execute_header,  v72,  OS_LOG_TYPE_ERROR,  "invalid functional type %u",  (uint8_t *)length,  8u);
        }

        int64_t v14 = 22LL;
        goto LABEL_72;
      }

      int v7 = dword_1000274CC[uint64 - 1];
      if (string) {
        v8 = string;
      }
      else {
        v8 = "rd";
      }
      __strlcpy_chk(&v117, v8, 16LL, 16LL);
      HIDWORD(v97) = v7;
      *(void *)&__int128 v118 = &v97;
      uint64_t v9 = sub_100012390(0xC020697A, (uint64_t)&v117, 2);
      if ((_DWORD)v9)
      {
        int v11 = v9;
        uint64_t v12 = ne_log_obj(v9, v10);
        v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v95 = strerror(v11);
          LODWORD(length[0]) = 136315138;
          *(size_t *)((char *)length + 4) = (size_t)v95;
          _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "SIOCIFCREATE2 failed with, %s",  (uint8_t *)length,  0xCu);
        }

        int64_t v14 = v11;
        goto LABEL_72;
      }

      __int128 v115 = 0u;
      __int128 v116 = 0u;
      __int128 v113 = 0u;
      __int128 v114 = 0u;
      __int128 v111 = 0u;
      __int128 v112 = 0u;
      __int128 v109 = 0u;
      __int128 v110 = 0u;
      __int128 v107 = 0u;
      __int128 v108 = 0u;
      __int128 v105 = 0u;
      __int128 v106 = 0u;
      __int128 v103 = 0u;
      __int128 v104 = 0u;
      __int128 v102 = 0u;
      memset(&length[2], 0, 32);
      strncpy((char *)length, (const char *)&v117, 0x10uLL);
      uint64_t v73 = sub_100012390(0xC080696E, (uint64_t)length, 30);
      if ((_DWORD)v73)
      {
        int v75 = v73;
        uint64_t v76 = ne_log_obj(v73, v74);
        v77 = (os_log_s *)objc_claimAutoreleasedReturnValue(v76);
        if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
        {
          v78 = strerror(v75);
          *(_DWORD *)buf = 136315138;
          v100 = v78;
          v79 = "SIOCPROTOATTACH_IN6 failed with, %s";
LABEL_88:
          _os_log_error_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, v79, buf, 0xCu);
          goto LABEL_79;
        }

        goto LABEL_79;
      }

      *(void *)&__int128 v103 = 0LL;
      __int128 v102 = 0u;
      memset(&length[2], 0, 32);
      strncpy((char *)length, (const char *)&v117, 0x10uLL);
      uint64_t v83 = sub_100012390(0xC030694C, (uint64_t)length, 30);
      if ((_DWORD)v83)
      {
        int v85 = v83;
        uint64_t v86 = ne_log_obj(v83, v84);
        v77 = (os_log_s *)objc_claimAutoreleasedReturnValue(v86);
        if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
        {
          v96 = strerror(v85);
          *(_DWORD *)buf = 136315138;
          v100 = v96;
          v79 = "SIOCGIFINFO_IN6 failed with, %s";
          goto LABEL_88;
        }

        goto LABEL_79;
      }

      if ((HIDWORD(length[4]) & 0xFFFFFDF6) != HIDWORD(length[4]))
      {
        HIDWORD(length[4]) &= 0xFFFFFDF6;
        uint64_t v90 = sub_100012390(0xC0486957, (uint64_t)length, 30);
        if ((_DWORD)v90)
        {
          int v92 = v90;
          uint64_t v93 = ne_log_obj(v90, v91);
          v77 = (os_log_s *)objc_claimAutoreleasedReturnValue(v93);
          if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
          {
            v94 = strerror(v92);
            *(_DWORD *)buf = 136315138;
            v100 = v94;
            v79 = "SIOCSIFINFO_FLAGS failed with, %s";
            goto LABEL_88;
          }

- (void).cxx_destruct
{
}

@end