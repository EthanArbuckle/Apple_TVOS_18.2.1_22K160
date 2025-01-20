@interface NEHelperSocketFactory
- (NEHelperSocketFactory)initWithFirstMessage:(id)a3;
- (OS_dispatch_queue)handlerQueue;
- (void)handleMessage:(id)a3;
@end

@implementation NEHelperSocketFactory

- (NEHelperSocketFactory)initWithFirstMessage:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___NEHelperSocketFactory;
  v5 = -[NEHelperSocketFactory init](&v28, "init");
  if (v5)
  {
    xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(v4);
    v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
    v8 = (void *)xpc_connection_copy_entitlement_value(v7, "com.apple.private.nehelper.privileged");
    v9 = (void *)xpc_connection_copy_entitlement_value(v7, "com.apple.private.neagent");
    BOOL v10 = v8 && xpc_get_type(v8) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v8);
    v5->_privileged = v10;
    BOOL v11 = v9 && xpc_get_type(v9) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v9);
    dispatch_queue_attr_t v12 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v12);
    dispatch_queue_t v14 = dispatch_queue_create("NEHelperSocketFactory", v13);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v14;

    if (!v5->_privileged && !v11)
    {
      pid_t pid = xpc_connection_get_pid(v7);
      uint64_t v17 = proc_name(pid, buffer, 0x100u);
      int v18 = v17;
      uint64_t v20 = ne_log_obj(v17, v19);
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
      if (v18 < 1)
      {
        if (v22)
        {
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v30 = pid;
          *(_WORD *)&v30[4] = 2080;
          *(void *)&v30[6] = "com.apple.private.nehelper.privileged";
          __int16 v31 = 2080;
          v32 = "com.apple.private.neagent";
          v23 = "Denying connection from process %d because it is missing the %s entitlement and the %s entitlement";
          v24 = v21;
          uint32_t v25 = 28;
          goto LABEL_21;
        }
      }

      else if (v22)
      {
        *(_DWORD *)buf = 136315906;
        *(void *)v30 = buffer;
        *(_WORD *)&v30[8] = 1024;
        *(_DWORD *)&v30[10] = pid;
        __int16 v31 = 2080;
        v32 = "com.apple.private.nehelper.privileged";
        __int16 v33 = 2080;
        v34 = "com.apple.private.neagent";
        v23 = "Denying connection from %s (%d) because it is missing the %s entitlement and the %s entitlement";
        v24 = v21;
        uint32_t v25 = 38;
LABEL_21:
        _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, v23, buf, v25);
      }

      v26 = 0LL;
      goto LABEL_19;
    }
  }

  v26 = v5;
LABEL_19:

  return v26;
}

- (OS_dispatch_queue)handlerQueue
{
  if (self) {
    self = (NEHelperSocketFactory *)objc_getProperty(self, a2, 16LL, 1);
  }
  return (OS_dispatch_queue *)self;
}

- (void)handleMessage:(id)a3
{
  id v4 = a3;
  uint64_t uint64 = xpc_dictionary_get_uint64(v4, "socket-type");
  switch(uint64)
  {
    case 1uLL:
      uint64_t v7 = socket(29, 3, 2);
      if ((v7 & 0x80000000) != 0)
      {
        uint64_t v59 = ne_log_obj(v7, v8);
        v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
        if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
        {
          int v94 = *__error();
          *(_DWORD *)__strerrbuf = 67109120;
          LODWORD(v164) = v94;
          _os_log_error_impl( (void *)&_mh_execute_header,  v60,  OS_LOG_TYPE_ERROR,  "socket(PF_KEY, SOCK_RAW, PF_KEY_V2) failed: %d",  (uint8_t *)__strerrbuf,  8u);
        }

        if (*__error()) {
          int64_t v61 = *__error();
        }
        else {
          int64_t v61 = 22LL;
        }
        sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v4, v61, 0LL);
      }

      else
      {
        int v9 = v7;
        xpc_object_t v10 = xpc_fd_create(v7);
        close(v9);
        *(_DWORD *)__strerrbuf = 4500;
        sysctlbyname("net.inet.ipsec.esp_port", 0LL, 0LL, __strerrbuf, 4uLL);
        sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v4, 0LL, v10);
      }

      goto LABEL_151;
    case 2uLL:
      size_t length = 0LL;
      size_t v142 = 0LL;
      data = (const sockaddr *)xpc_dictionary_get_data(v4, "socket-localaddr", &length);
      uint64_t v19 = (const sockaddr *)xpc_dictionary_get_data(v4, "socket-remoteaddr", &v142);
      string = xpc_dictionary_get_string(v4, "socket-interface");
      int v21 = xpc_dictionary_get_uint64(v4, "socket-effective-pid");
      uint64_t is_sockaddr_valid = ne_is_sockaddr_valid(v19, v142);
      if ((_DWORD)is_sockaddr_valid)
      {
        uint64_t is_sockaddr_valid = ne_is_sockaddr_valid(data, length);
        if ((is_sockaddr_valid & 1) != 0)
        {
          *(_DWORD *)v156 = v21;
          if (data)
          {
            if (v19)
            {
              int sa_family = v19->sa_family;
              BOOL v25 = data->sa_family == sa_family;
              uint64_t v26 = ne_log_obj(is_sockaddr_valid, v23);
              v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
              objc_super v28 = v27;
              if (v25)
              {
                if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
                {
                  nw_endpoint_t address = nw_endpoint_create_address(data);
                  nw_endpoint_t v104 = nw_endpoint_create_address(v19);
                  *(_DWORD *)__strerrbuf = 138413058;
                  v164 = (const char *)address;
                  __int16 v165 = 2112;
                  nw_endpoint_t v166 = v104;
                  __int16 v167 = 2080;
                  v168 = string;
                  __int16 v169 = 1024;
                  int v170 = v21;
                  _os_log_debug_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEBUG,  "Creating IKE socket to (%@, %@, %s, %d)",  (uint8_t *)__strerrbuf,  0x26u);
                }

                if (string)
                {
                  unsigned int v135 = if_nametoindex(string);
                  if (v135) {
                    goto LABEL_26;
                  }
                  int v29 = *__error();
                  uint64_t v30 = strerror_r(v29, __strerrbuf, 0x80uLL);
                  if ((_DWORD)v30) {
                    __strerrbuf[0] = 0;
                  }
                  uint64_t v32 = ne_log_obj(v30, v31);
                  __int16 v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
                  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136315650;
                    *(void *)&uint8_t buf[4] = string;
                    *(_WORD *)&buf[12] = 1024;
                    *(_DWORD *)&buf[14] = v29;
                    *(_WORD *)&buf[18] = 2080;
                    *(void *)&buf[20] = __strerrbuf;
                    _os_log_error_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_ERROR,  "Failed to find interface %s: [%d] %s",  buf,  0x1Cu);
                  }
                }

                unsigned int v135 = 0;
LABEL_26:
                int v34 = socket(sa_family, 2, 0);
                int v35 = v34;
                if (v34 < 0)
                {
                  int v74 = *__error();
                  uint64_t v86 = strerror_r(v74, __strerrbuf, 0x80uLL);
                  if ((_DWORD)v86) {
                    __strerrbuf[0] = 0;
                  }
                  uint64_t v88 = ne_log_obj(v86, v87);
                  v89 = (os_log_s *)objc_claimAutoreleasedReturnValue(v88);
                  if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 67109634;
                    *(_DWORD *)&uint8_t buf[4] = sa_family;
                    *(_WORD *)&buf[8] = 1024;
                    *(_DWORD *)&buf[10] = v74;
                    *(_WORD *)&buf[14] = 2080;
                    *(void *)&buf[16] = __strerrbuf;
                    _os_log_error_impl( (void *)&_mh_execute_header,  v89,  OS_LOG_TYPE_ERROR,  "Failed to create socket(%u, SOCK_DGRAM, 0): [%d] %s",  buf,  0x18u);
                  }

                  if (v35 == -1) {
                    goto LABEL_158;
                  }
                  goto LABEL_157;
                }

                if (fcntl(v34, 4, 4LL) == -1)
                {
                  int v36 = *__error();
                  uint64_t v37 = strerror_r(v36, __strerrbuf, 0x80uLL);
                  if ((_DWORD)v37) {
                    __strerrbuf[0] = 0;
                  }
                  uint64_t v39 = ne_log_obj(v37, v38);
                  v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
                  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 67109378;
                    *(_DWORD *)&uint8_t buf[4] = v36;
                    *(_WORD *)&buf[8] = 2080;
                    *(void *)&buf[10] = __strerrbuf;
                    _os_log_error_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_ERROR,  "Failed to put socket in non-blocking mode: [%d] %s",  buf,  0x12u);
                  }
                }

                if (fcntl(v35, 73, 1LL) == -1)
                {
                  int v41 = *__error();
                  uint64_t v42 = strerror_r(v41, __strerrbuf, 0x80uLL);
                  if ((_DWORD)v42) {
                    __strerrbuf[0] = 0;
                  }
                  uint64_t v44 = ne_log_obj(v42, v43);
                  v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
                  if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 67109378;
                    *(_DWORD *)&uint8_t buf[4] = v41;
                    *(_WORD *)&buf[8] = 2080;
                    *(void *)&buf[10] = __strerrbuf;
                    _os_log_error_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_ERROR,  "Failed to set NOSIGPIPE option: [%d] %s",  buf,  0x12u);
                  }
                }

                *(_DWORD *)v152 = 1;
                if (setsockopt(v35, 0xFFFF, 4, v152, 4u) < 0)
                {
                  int v74 = *__error();
                  uint64_t v90 = strerror_r(v74, __strerrbuf, 0x80uLL);
                  if ((_DWORD)v90) {
                    __strerrbuf[0] = 0;
                  }
                  uint64_t v92 = ne_log_obj(v90, v91);
                  v93 = (os_log_s *)objc_claimAutoreleasedReturnValue(v92);
                  if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 67109378;
                    *(_DWORD *)&uint8_t buf[4] = v74;
                    *(_WORD *)&buf[8] = 2080;
                    *(void *)&buf[10] = __strerrbuf;
                    _os_log_error_impl( (void *)&_mh_execute_header,  v93,  OS_LOG_TYPE_ERROR,  "setsockopt SO_REUSEADDR failed: [%d] %s",  buf,  0x12u);
                  }
                }

                else if (setsockopt(v35, 0xFFFF, 512, v152, 4u) < 0)
                {
                  int v74 = *__error();
                  uint64_t v95 = strerror_r(v74, __strerrbuf, 0x80uLL);
                  if ((_DWORD)v95) {
                    __strerrbuf[0] = 0;
                  }
                  uint64_t v97 = ne_log_obj(v95, v96);
                  v93 = (os_log_s *)objc_claimAutoreleasedReturnValue(v97);
                  if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 67109378;
                    *(_DWORD *)&uint8_t buf[4] = v74;
                    *(_WORD *)&buf[8] = 2080;
                    *(void *)&buf[10] = __strerrbuf;
                    _os_log_error_impl( (void *)&_mh_execute_header,  v93,  OS_LOG_TYPE_ERROR,  "setsockopt SO_REUSEPORT failed: [%d] %s",  buf,  0x12u);
                  }
                }

                else if (v21 && setsockopt(v35, 0xFFFF, 4359, v156, 4u) < 0)
                {
                  int v74 = *__error();
                  uint64_t v107 = strerror_r(v74, __strerrbuf, 0x80uLL);
                  if ((_DWORD)v107) {
                    __strerrbuf[0] = 0;
                  }
                  uint64_t v109 = ne_log_obj(v107, v108);
                  v93 = (os_log_s *)objc_claimAutoreleasedReturnValue(v109);
                  if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 67109378;
                    *(_DWORD *)&uint8_t buf[4] = v74;
                    *(_WORD *)&buf[8] = 2080;
                    *(void *)&buf[10] = __strerrbuf;
                    _os_log_error_impl( (void *)&_mh_execute_header,  v93,  OS_LOG_TYPE_ERROR,  "setsockopt SO_DELEGATED failed: [%d] %s",  buf,  0x12u);
                  }
                }

                else
                {
                  if (sa_family != 30 || (socklen_t v151 = 0, (setsockopt(v35, 41, 63, &v151, 4u) & 0x80000000) == 0))
                  {
                    *(void *)&v150.sae_srcif = 0LL;
                    memset(&v150.sae_srcaddrlen, 0, 24);
                    v150.sae_srcaddr = data;
                    v150.sae_srcaddrlen = data->sa_len;
                    v150.sae_srcif = v135;
                    v150.sae_dstaddr = v19;
                    v150.sae_dstaddrlen = v19->sa_len;
                    if ((connectx(v35, &v150, 0, 0, 0LL, 0, 0LL, 0LL) & 0x80000000) == 0)
                    {
                      xpc_object_t v46 = xpc_fd_create(v35);
                      close(v35);
                      sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v4, 0LL, v46);

                      goto LABEL_151;
                    }

                    int v74 = *__error();
                    uint64_t v110 = strerror_r(v74, __strerrbuf, 0x80uLL);
                    if ((_DWORD)v110) {
                      __strerrbuf[0] = 0;
                    }
                    uint64_t v112 = ne_log_obj(v110, v111);
                    v113 = (os_log_s *)objc_claimAutoreleasedReturnValue(v112);
                    if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
                    {
                      nw_endpoint_t v131 = nw_endpoint_create_address(data);
                      nw_endpoint_t v132 = nw_endpoint_create_address(v19);
                      *(_DWORD *)buf = 138413314;
                      *(void *)&uint8_t buf[4] = v131;
                      *(_WORD *)&buf[12] = 2112;
                      *(void *)&buf[14] = v132;
                      *(_WORD *)&buf[22] = 2080;
                      *(void *)&buf[24] = string;
                      LOWORD(v158) = 1024;
                      *(_DWORD *)((char *)&v158 + 2) = v74;
                      WORD3(v158) = 2080;
                      *((void *)&v158 + 1) = __strerrbuf;
                      _os_log_error_impl( (void *)&_mh_execute_header,  v113,  OS_LOG_TYPE_ERROR,  "connectx(%@, %@, %s) failed: [%d] %s",  buf,  0x30u);
                    }

                    goto LABEL_157;
                  }

                  int v74 = *__error();
                  uint64_t v126 = strerror_r(v74, __strerrbuf, 0x80uLL);
                  if ((_DWORD)v126) {
                    __strerrbuf[0] = 0;
                  }
                  uint64_t v128 = ne_log_obj(v126, v127);
                  v93 = (os_log_s *)objc_claimAutoreleasedReturnValue(v128);
                  if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 67109378;
                    *(_DWORD *)&uint8_t buf[4] = v74;
                    *(_WORD *)&buf[8] = 2080;
                    *(void *)&buf[10] = __strerrbuf;
                    _os_log_error_impl( (void *)&_mh_execute_header,  v93,  OS_LOG_TYPE_ERROR,  "setsockopt IPV6_PREFER_TEMPADDR failed: [%d] %s",  buf,  0x12u);
                  }
                }

LABEL_157:
                uint64_t v72 = close(v35);
                goto LABEL_158;
              }

              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                nw_endpoint_t v105 = nw_endpoint_create_address(data);
                nw_endpoint_t v106 = nw_endpoint_create_address(v19);
                *(_DWORD *)__strerrbuf = 138412546;
                v164 = (const char *)v105;
                __int16 v165 = 2112;
                nw_endpoint_t v166 = v106;
                _os_log_error_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "Mismatched AF %@ %@",  (uint8_t *)__strerrbuf,  0x16u);
              }
            }

            else
            {
              uint64_t v134 = ne_log_obj(is_sockaddr_valid, v23);
              objc_super v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v134);
              if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)__strerrbuf = 136315138;
                v164 = "connect_udp_ike_socket";
                _os_log_fault_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_FAULT,  "%s called with null remote",  (uint8_t *)__strerrbuf,  0xCu);
              }
            }
          }

          else
          {
            uint64_t v133 = ne_log_obj(is_sockaddr_valid, v23);
            objc_super v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v133);
            if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)__strerrbuf = 136315138;
              v164 = "connect_udp_ike_socket";
              _os_log_fault_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_FAULT,  "%s called with null local",  (uint8_t *)__strerrbuf,  0xCu);
            }
          }

          int v74 = 22;
LABEL_158:
          uint64_t v129 = ne_log_obj(v72, v73);
          v130 = (os_log_s *)objc_claimAutoreleasedReturnValue(v129);
          if (os_log_type_enabled(v130, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)__strerrbuf = 0;
            _os_log_error_impl( (void *)&_mh_execute_header,  v130,  OS_LOG_TYPE_ERROR,  "kNEHelperMessageSocketTypeIKE connect_udp_ike_socket failed",  (uint8_t *)__strerrbuf,  2u);
          }

          sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v4, v74, 0LL);
          goto LABEL_151;
        }
      }

      uint64_t v50 = ne_log_obj(is_sockaddr_valid, v23);
      v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)__strerrbuf = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_ERROR,  "kNEHelperMessageSocketTypeIKE received invalid parameters",  (uint8_t *)__strerrbuf,  2u);
      }

      sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v4, 22LL, 0LL);
LABEL_151:

      return;
    case 3uLL:
      BOOL v11 = xpc_dictionary_get_string(v4, "socket-control-name");
      size_t length = 0LL;
      p_size_t length = &length;
      uint64_t v148 = 0x2020000000LL;
      char v149 = 0;
      size_t v142 = 0LL;
      v143 = &v142;
      uint64_t v144 = 0x2020000000LL;
      char v145 = 0;
      if (!self || !self->_privileged)
      {
        uint64_t v13 = ne_log_obj(v11, v12);
        dispatch_queue_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)__strerrbuf = 0;
          _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Rejecting kernel control socket request from un-privileged client",  (uint8_t *)__strerrbuf,  2u);
        }

        sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v4, 1LL, 0LL);
        goto LABEL_150;
      }

      v52 = v11;
      int v53 = socket(32, 2, 2);
      if (v53 < 0)
      {
        int v67 = *__error();
        uint64_t v68 = strerror_r(v67, __strerrbuf, 0x80uLL);
        if ((_DWORD)v68) {
          __strerrbuf[0] = 0;
        }
        uint64_t v70 = ne_log_obj(v68, v69);
        v71 = (os_log_s *)objc_claimAutoreleasedReturnValue(v70);
        if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v156 = 67109378;
          *(_DWORD *)&v156[4] = v67;
          *(_WORD *)&v156[8] = 2080;
          *(void *)&v156[10] = __strerrbuf;
          _os_log_error_impl( (void *)&_mh_execute_header,  v71,  OS_LOG_TYPE_ERROR,  "Cannot create kernel control socket: [%d] %s",  v156,  0x12u);
        }

        sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v4, v67, 0LL);
        goto LABEL_150;
      }

      int v162 = 0;
      __int128 v160 = 0u;
      __int128 v161 = 0u;
      __int128 v158 = 0u;
      __int128 v159 = 0u;
      memset(buf, 0, sizeof(buf));
      __strlcpy_chk(&buf[4], v52, 96LL, 96LL);
      if (ioctl(v53, 0xC0644E03uLL, buf))
      {
        int v54 = *__error();
        uint64_t v55 = strerror_r(v54, __strerrbuf, 0x80uLL);
        if ((_DWORD)v55) {
          __strerrbuf[0] = 0;
        }
        uint64_t v57 = ne_log_obj(v55, v56);
        v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v156 = 67109378;
          *(_DWORD *)&v156[4] = v54;
          *(_WORD *)&v156[8] = 2080;
          *(void *)&v156[10] = __strerrbuf;
          _os_log_error_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_ERROR,  "ioctl(CTLIOCGINFO) failed: [%d] %s",  v156,  0x12u);
        }

        close(v53);
        sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v4, v54, 0LL);
        goto LABEL_150;
      }

      v150.sae_srcif = 139296;
      *(&v150.sae_srcif + 1) = *(_DWORD *)buf;
      memset(&v150.sae_srcaddr, 0, 24);
      xpc_object_t array = xpc_dictionary_get_array(v4, "socket-options");
      v76 = (void *)objc_claimAutoreleasedReturnValue(array);
      v77 = v76;
      if (v76 && xpc_array_get_count(v76))
      {
        if (bind(v53, (const sockaddr *)&v150, 0x20u))
        {
          int v78 = *__error();
          uint64_t v79 = strerror_r(v78, __strerrbuf, 0x80uLL);
          if ((_DWORD)v79) {
            __strerrbuf[0] = 0;
          }
          uint64_t v81 = ne_log_obj(v79, v80);
          v82 = (os_log_s *)objc_claimAutoreleasedReturnValue(v81);
          if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v156 = 67109378;
            *(_DWORD *)&v156[4] = v78;
            *(_WORD *)&v156[8] = 2080;
            *(void *)&v156[10] = __strerrbuf;
            _os_log_error_impl( (void *)&_mh_execute_header,  v82,  OS_LOG_TYPE_ERROR,  "bind failed on kernel control socket: [%d] %s",  v156,  0x12u);
          }

- (void).cxx_destruct
{
}

@end