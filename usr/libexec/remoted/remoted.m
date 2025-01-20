id sub_1000024D4(uint64_t a1, uint64_t a2, int a3)
{
  void *v4;
  id result;
  v4 = *(void **)(a1 + 32);
  if (!a3) {
    return [v4 fire:a2];
  }
  [v4 setBrowser:0];
  result = [*(id *)(a1 + 32) dontRestartBrowse];
  return result;
}

uint64_t sub_1000027BC()
{
  os_log_t v0 = os_log_create("com.apple.RemoteServiceDiscovery", "rsd_events");
  v1 = (void *)qword_100043000;
  qword_100043000 = (uint64_t)v0;

  v2 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  v3 = (void *)qword_100043010;
  qword_100043010 = (uint64_t)v2;

  dispatch_queue_t v4 = dispatch_queue_create("com.apple.rsd_events", 0LL);
  v5 = (void *)qword_100042FF8;
  qword_100042FF8 = (uint64_t)v4;

  uint64_t v6 = xpc_event_publisher_create("com.apple.remoteservicediscovery.events", qword_100042FF8);
  uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)qword_100043008;
  qword_100043008 = v7;

  xpc_event_publisher_set_handler(qword_100043008, &stru_10003CD10);
  xpc_event_publisher_set_error_handler(qword_100043008, &stru_10003CD50);
  return xpc_event_publisher_activate(qword_100043008);
}

void sub_10000287C(id a1, unsigned int a2, unint64_t a3, OS_xpc_object *a4)
{
  uint64_t v6 = a4;
  if (a2 == 1)
  {
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id v12 = objc_msgSend((id)qword_100043010, "copy", 0);
    id v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v22;
      while (2)
      {
        for (i = 0LL; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
          if ([v17 token] == (id)a3)
          {
            v18 = (void *)qword_100043000;
            if (os_log_type_enabled((os_log_t)qword_100043000, OS_LOG_TYPE_INFO))
            {
              v19 = v18;
              id v20 = [v17 name];
              *(_DWORD *)v30 = 136446210;
              *(void *)&v30[4] = v20;
              _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "Removing RSD events registration: %{public}s",  v30,  0xCu);
            }

            [v17 cancelBrowsing];
            [(id)qword_100043010 removeObject:v17];
            goto LABEL_24;
          }
        }

        id v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }

LABEL_24:
  }

  else if (!a2)
  {
    *(void *)&__int128 v7 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
    __int128 v36 = v7;
    __int128 v37 = v7;
    __int128 v34 = v7;
    __int128 v35 = v7;
    __int128 v32 = v7;
    __int128 v33 = v7;
    *(_OWORD *)v30 = v7;
    __int128 v31 = v7;
    if ((xpc_get_event_name("com.apple.remoted.service", a3, v30) & 1) == 0) {
      __strlcpy_chk(v30, "<Unknown>", 128LL, 128LL);
    }
    v8 = -[RSDEventRegistration initWithToken:name:]( objc_alloc(&OBJC_CLASS___RSDEventRegistration),  "initWithToken:name:",  a3,  v30);
    [(id)qword_100043010 addObject:v8];
    -[RSDEventRegistration startBrowsing:](v8, "startBrowsing:", v6);
    v9 = (os_log_s *)qword_100043000;
    if (os_log_type_enabled((os_log_t)qword_100043000, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      v27 = v30;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Registered for RSD events: %{public}s",  buf,  0xCu);
    }

    if (os_log_type_enabled((os_log_t)qword_100043000, OS_LOG_TYPE_INFO))
    {
      v10 = xpc_copy_description(v6);
      v11 = (os_log_s *)qword_100043000;
      if (os_log_type_enabled((os_log_t)qword_100043000, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136446466;
        v27 = v30;
        __int16 v28 = 2082;
        v29 = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%{public}s: %{public}s", buf, 0x16u);
      }

      free(v10);
    }
  }
}

void sub_100002B70(id a1, int a2)
{
  v3 = (os_log_s *)qword_100043000;
  if (os_log_type_enabled((os_log_t)qword_100043000, OS_LOG_TYPE_ERROR)) {
    sub_100023D58(a2, v3);
  }
}

uint64_t sub_100002BB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return _os_log_send_and_compose_impl(a1, v6, v5, 80LL, a5, v7, 16LL);
}

uint64_t sub_100002BCC(uint64_t a1)
{
  return _os_crash_msg(*v1, a1);
}

BOOL sub_100002BD8()
{
  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

BOOL sub_100002BE4(void *a1)
{
  v1 = a1;
  if (!objc_opt_class(&OBJC_CLASS___SecureConfigParameters))
  {
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
      sub_100023DCC(v1);
    }
    goto LABEL_14;
  }

  id v21 = 0LL;
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[SecureConfigParameters loadContentsAndReturnError:]( &OBJC_CLASS___SecureConfigParameters,  "loadContentsAndReturnError:",  &v21));
  id v3 = v21;
  if (!v2)
  {
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      sub_100023E0C((uint64_t)v3, v1, v7, v8, v9, v10, v11, v12);
    }

    goto LABEL_14;
  }

  dispatch_queue_t v4 = (const __CFBoolean *)objc_msgSend(v2, "research_disableAppleInfrastructureEnforcement");
  uint64_t v5 = v4;
  if (!v4)
  {
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      __int128 v23 = @"com.apple.pcc.research.disableAppleInfrastructureEnforcement";
      _os_log_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEFAULT,  "SecureConfig parameter '%{public}@' not present",  buf,  0xCu);
    }

LABEL_14:
    BOOL v6 = 0LL;
    goto LABEL_19;
  }

  if ((sub_1000113DC(v4) & 1) != 0)
  {
    BOOL v6 = CFBooleanGetValue(v5) != 0;
  }

  else
  {
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      sub_100023E74(v1, v13, v14, v15, v16, v17, v18, v19);
    }
    BOOL v6 = 0LL;
  }

  CFRelease(v5);
LABEL_19:

  return v6;
}

void sub_100002D80(_Unwind_Exception *a1)
{
}

void sub_100002DA4( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100002DB4(void *a1)
{
  id v2 = a1;
  objc_storeStrong((id *)&qword_100043018, a1);
  id v3 = (void *)qword_100043020;
  qword_100043020 = (uint64_t)v2;
  id v8 = v2;

  os_log_t v4 = os_log_create("com.apple.RemoteServiceDiscovery", "ControlInterface");
  uint64_t v5 = (void *)qword_100043028;
  qword_100043028 = (uint64_t)v4;

  xpc_connection_t mach_service = xpc_connection_create_mach_service( "com.apple.remoted.control",  (dispatch_queue_t)qword_100043018,  1uLL);
  uint64_t v7 = (void *)qword_100043030;
  qword_100043030 = (uint64_t)mach_service;

  xpc_connection_set_event_handler((xpc_connection_t)qword_100043030, &stru_10003CD90);
  xpc_connection_activate((xpc_connection_t)qword_100043030);
}

void sub_100002E78(id a1, OS_xpc_object *a2)
{
  id v2 = a2;
  if (xpc_get_type(v2) != (xpc_type_t)&_xpc_type_error)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100002F18;
    handler[3] = &unk_10003CDB8;
    id v3 = v2;
    uint64_t v5 = v3;
    xpc_connection_set_event_handler(v3, handler);
    xpc_connection_set_target_queue(v3, (dispatch_queue_t)qword_100043018);
    xpc_connection_activate(v3);
  }
}

void sub_100002F18(uint64_t a1, void *a2)
{
  id v3 = a2;
  os_log_t v4 = (_xpc_connection_s *)*(id *)(a1 + 32);
  id v5 = v3;
  BOOL v6 = objc_autoreleasePoolPush();
  if (xpc_get_type(v5) == (xpc_type_t)&_xpc_type_error)
  {
LABEL_21:
    xpc_connection_cancel(v4);
    goto LABEL_36;
  }

  if ((xpc_dictionary_expects_reply(v5) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)qword_100043028, OS_LOG_TYPE_ERROR)) {
      sub_100024160();
    }
    goto LABEL_21;
  }

  string = xpc_dictionary_get_string(v5, "cmd");
  if ((os_variant_has_internal_content("com.apple.xpc.remoted") & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)qword_100043028, OS_LOG_TYPE_ERROR)) {
      sub_100024134();
    }
    goto LABEL_26;
  }

  if (!string)
  {
    if (os_log_type_enabled((os_log_t)qword_100043028, OS_LOG_TYPE_ERROR)) {
      sub_100023F90();
    }
    goto LABEL_26;
  }

  if (!strcmp(string, "attach_loopback"))
  {
    id v10 = v5;
    sub_10001FA68();
    goto LABEL_33;
  }

  if (!strcmp(string, "connect_loopback"))
  {
    id v10 = v5;
    sub_10001FBE0();
    goto LABEL_33;
  }

  if (!strcmp(string, "detach_loopback"))
  {
    id v10 = v5;
    sub_100020034();
    goto LABEL_33;
  }

  if (!strcmp(string, "suspend_loopback"))
  {
    id v10 = v5;
    sub_100020184();
    goto LABEL_33;
  }

  if (!strcmp(string, "resume_loopback"))
  {
    id v10 = v5;
    sub_1000202D0();
    goto LABEL_33;
  }

  if (!strcmp(string, "reset_loopback"))
  {
    id v10 = v5;
    sub_100020418();
    goto LABEL_33;
  }

  if (strcmp(string, "enable_bonjour")
    && strcmp(string, "disable_bonjour")
    && strcmp(string, "enable_bonjour_loopback"))
  {
    if (!strcmp(string, "enable_network_peer"))
    {
      id v15 = v5;
      uint64_t v16 = xpc_dictionary_get_string(v15, "arg");
      if (!v16)
      {
LABEL_49:
        id v23 = sub_100018AC4(v15);
        xpc_object_t reply = (xpc_object_t)objc_claimAutoreleasedReturnValue(v23);
        goto LABEL_50;
      }

      *(void *)&__int128 block = _NSConcreteStackBlock;
      *((void *)&block + 1) = 3221225472LL;
      v27 = sub_100003400;
      __int16 v28 = &unk_10003CDD8;
      *(void *)&__int128 v29 = strdup(v16);
      uint64_t v17 = (dispatch_queue_s *)qword_100043020;
LABEL_39:
      dispatch_async(v17, &block);
      xpc_object_t reply = xpc_dictionary_create_reply(v15);
      xpc_dictionary_set_string(reply, "result", "OK");
LABEL_50:

      goto LABEL_34;
    }

    if (strcmp(string, "disable_network_peer"))
    {
      if (strcmp(string, "connect_network_peer"))
      {
        if (os_log_type_enabled((os_log_t)qword_100043028, OS_LOG_TYPE_ERROR)) {
          sub_100024108();
        }
        goto LABEL_26;
      }

      id v15 = v5;
      uint64_t v19 = xpc_dictionary_get_string(v15, "arg");
      __int128 v25 = 0uLL;
      int v20 = inet_pton(30, v19, &v25);
      if (v20 == -1)
      {
        id v21 = __error();
        __int128 v22 = (os_log_s *)qword_100043028;
        if (os_log_type_enabled((os_log_t)qword_100043028, OS_LOG_TYPE_ERROR)) {
          sub_100024094(v21, v22);
        }
        goto LABEL_49;
      }

      if (v20 != 1)
      {
        if (v20) {
          sub_100023FBC(&v24, &block);
        }
        if (os_log_type_enabled((os_log_t)qword_100043028, OS_LOG_TYPE_ERROR)) {
          sub_100024068();
        }
        goto LABEL_49;
      }

      uint64_t v17 = (dispatch_queue_s *)qword_100043020;
      *(void *)&__int128 block = _NSConcreteStackBlock;
      *((void *)&block + 1) = 3221225472LL;
      v27 = sub_1000034D4;
      __int16 v28 = &unk_10003CE38;
      __int128 v29 = v25;
      goto LABEL_39;
    }

    uint64_t v18 = (dispatch_queue_s *)qword_100043020;
    id v10 = v5;
    dispatch_async(v18, &stru_10003CE18);
LABEL_33:
    xpc_object_t reply = xpc_dictionary_create_reply(v10);

    xpc_dictionary_set_string(reply, "result", "OK");
    goto LABEL_34;
  }

LABEL_26:
  id v8 = sub_100018AC4(v5);
  xpc_object_t reply = (xpc_object_t)objc_claimAutoreleasedReturnValue(v8);
LABEL_34:
  id v11 = reply;
  if (!v11) {
    sub_100023EE8(&v25, &block);
  }
  uint64_t v12 = v11;

  xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(v12);
  uint64_t v14 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
  xpc_connection_send_message(v14, v12);

LABEL_36:
  objc_autoreleasePoolPop(v6);
}

void sub_100003400(uint64_t a1)
{
  BOOL v2 = sub_100016958(*(const char **)(a1 + 32));
  id v3 = (os_log_s *)qword_100043028;
  if (os_log_type_enabled((os_log_t)qword_100043028, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t v4 = "failed";
    if (v2) {
      os_log_t v4 = "succeeded";
    }
    int v5 = 136446210;
    BOOL v6 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "network peer enable %{public}s",  (uint8_t *)&v5,  0xCu);
  }

  free(*(void **)(a1 + 32));
}

void sub_1000034D4(uint64_t a1)
{
  BOOL v1 = sub_100017034((void *)(a1 + 32));
  BOOL v2 = (os_log_s *)qword_100043028;
  if (os_log_type_enabled((os_log_t)qword_100043028, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = "failed";
    if (v1) {
      id v3 = "succeeded";
    }
    int v4 = 136446210;
    int v5 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "network peer connect %{public}s",  (uint8_t *)&v4,  0xCu);
  }
}

void sub_100003590( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

LABEL_7:
    uint64_t v14 = 0LL;
  }

LABEL_8:
  return v14;
}

    uint64_t v16 = 0LL;
  }

LABEL_9:
  return v16;
}

id sub_100003B18()
{
  if (qword_100043058 != -1) {
    dispatch_once(&qword_100043058, &stru_10003CE78);
  }
  return (id)qword_100043050;
}

LABEL_15:
      id v15 = 0LL;
      goto LABEL_16;
    }

    if (v9)
    {
      id v23 = 138543362;
      uint64_t v24 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@> server waiting for connection from client",  (uint8_t *)&v23,  0xCu);
    }
  }

  else
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteCoreDeviceDevice client_endpoint](self, "client_endpoint"));

    uint64_t v17 = sub_100003B18();
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    id v8 = v18;
    if (v16)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        id v23 = 138543362;
        uint64_t v24 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@> client connecting to remote remoted",  (uint8_t *)&v23,  0xCu);
      }

      id v23 = 0;
      uint64_t v19 = sub_100003E30(-[RSDRemoteCoreDeviceDevice if_name](self, "if_name"), 2, &v23);
      id v15 = (void *)objc_claimAutoreleasedReturnValue(v19);
      if (!v15 || !v23)
      {
        id v21 = sub_100003B18();
        __int128 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
          sub_1000241E4();
        }

        goto LABEL_17;
      }

      -[RSDRemoteCoreDeviceDevice setIf_index:](self, "setIf_index:");
      int v20 = (nw_endpoint *)objc_claimAutoreleasedReturnValue(-[RSDRemoteCoreDeviceDevice client_endpoint](self, "client_endpoint"));
      id v10 = nw_connection_create(v20, (nw_parameters_t)v15);

      uint64_t v12 = 2LL;
      if (v10) {
        goto LABEL_8;
      }
      goto LABEL_15;
    }

    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      sub_1000241B8();
    }
  }
}

  if (a1 && (_DWORD)v19) {
    close_drop_optional_np(a1, 0LL);
  }
  return v19;
}
}

    __break(0x5519u);
  }

  return result;
}

    __break(0x5519u);
  }

  return result;
}

nw_parameters *sub_100003E30(const char *a1, int a2, _DWORD *a3)
{
  uint64_t v6 = if_nametoindex(a1);
  if ((_DWORD)v6)
  {
    int v7 = v6;
    id v8 = sub_10001E3A0(v6, a2);
    uint64_t v9 = (nw_parameters *)objc_claimAutoreleasedReturnValue(v8);
    id v10 = v9;
    if (v9)
    {
      id v11 = nw_parameters_copy_required_interface(v9);
      name = nw_interface_get_name(v11);
      if (!strncmp(name, a1, 0x10uLL))
      {
        nw_parameters_set_local_only(v10, 0);
        nw_parameters_set_required_interface_type(v10, nw_interface_type_other);
        *a3 = v7;
        uint64_t v16 = v10;
        goto LABEL_14;
      }

      id v13 = sub_100003B18();
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        sub_100024270();
      }
    }

    else
    {
      id v17 = sub_100003B18();
      id v11 = (nw_interface *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        sub_1000241E4();
      }
    }

    uint64_t v16 = 0LL;
LABEL_14:

    goto LABEL_15;
  }

  id v15 = sub_100003B18();
  id v10 = (nw_parameters *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_100024210();
  }
  uint64_t v16 = 0LL;
LABEL_15:

  return v16;
}

void sub_100004204(void *a1)
{
  id v1 = a1;
  id v2 = sub_100003B18();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "initializing CoreDevice backend", v10, 2u);
  }

  int v4 = (void *)qword_100043040;
  qword_100043040 = (uint64_t)v1;
  id v5 = v1;

  uint64_t v6 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  int v7 = (void *)qword_100043038;
  qword_100043038 = (uint64_t)v6;

  xpc_connection_t mach_service = xpc_connection_create_mach_service( "com.apple.remoted.coredevice",  (dispatch_queue_t)qword_100043040,  1uLL);
  uint64_t v9 = (void *)qword_100043048;
  qword_100043048 = (uint64_t)mach_service;

  xpc_connection_set_event_handler((xpc_connection_t)qword_100043048, &stru_10003CE58);
  xpc_connection_activate((xpc_connection_t)qword_100043048);
}

void sub_1000042EC(id a1, OS_xpc_object *a2)
{
  id v2 = a2;
  if (xpc_get_type(v2) != (xpc_type_t)&_xpc_type_error)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10000438C;
    handler[3] = &unk_10003CDB8;
    id v3 = v2;
    id v5 = v3;
    xpc_connection_set_event_handler(v3, handler);
    xpc_connection_set_target_queue(v3, (dispatch_queue_t)qword_100043040);
    xpc_connection_activate(v3);
  }
}

void sub_10000438C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  id v5 = v3;
  uint64_t v6 = objc_autoreleasePoolPush();
  if (xpc_get_type(v5) == (xpc_type_t)&_xpc_type_error)
  {
    sub_100004EB4(v4);
    goto LABEL_102;
  }

  *(void *)&__int128 v7 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)buf = v7;
  *(_OWORD *)&buf[16] = v7;
  xpc_connection_get_audit_token(v4, buf);
  id v8 = (void *)xpc_copy_entitlement_for_token("com.apple.private.remoted.coredevice", buf);
  BOOL v9 = v8 == 0LL;

  if (v9)
  {
    id v14 = sub_100003B18();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100024358();
    }
    goto LABEL_14;
  }

  if ((xpc_dictionary_expects_reply(v5) & 1) == 0)
  {
    id v16 = sub_100003B18();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1000244EC();
    }
LABEL_14:

    sub_100004EB4(v4);
    goto LABEL_102;
  }

  string = xpc_dictionary_get_string(v5, "cmd");
  id v11 = string;
  if (!string)
  {
    id v17 = sub_100003B18();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100023F90();
    }
    goto LABEL_20;
  }

  if (!strcmp(string, "add_listener_device"))
  {
    __s2 = (char *)v4;
    id v20 = v5;
    id v21 = sub_100003B18();
    __int128 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "add server listener start", buf, 2u);
    }

    id v23 = xpc_dictionary_get_string(v20, "interface_name");
    uint64_t v24 = v23;
    if (v23)
    {
      unsigned int v103 = 0;
      __int128 v25 = sub_100003E30(v23, 1, &v103);
      v26 = (nw_parameters *)objc_claimAutoreleasedReturnValue(v25);
      v27 = v26;
      if (v26 && (uint64_t v28 = v103) != 0)
      {
        __int128 v29 = nw_listener_create(v26);
        if (v29)
        {
          uint64_t uint64 = xpc_dictionary_get_uint64(v20, "connect_timeout");
          id v31 = sub_100003B18();
          __int128 v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446210;
            *(void *)&uint8_t buf[4] = v24;
            _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Creating new listener device for interface: %{public}s",  buf,  0xCu);
          }

          __int128 v33 = -[RSDRemoteCoreDeviceDevice initWithServerListener:controlPeer:interfaceName:interfaceIndex:connectTimeout:]( objc_alloc(&OBJC_CLASS___RSDRemoteCoreDeviceDevice),  "initWithServerListener:controlPeer:interfaceName:interfaceIndex:connectTimeout:",  v29,  __s2,  v24,  v28,  uint64);
          __int128 v34 = v33;
          if (v33 && -[RSDRemoteDevice device_name](v33, "device_name"))
          {
            -[RSDRemoteCoreDeviceDevice attach](v34, "attach");
            id v35 = sub_100003B18();
            __int128 v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              __int128 v37 = -[RSDRemoteDevice device_name](v34, "device_name");
              *(_DWORD *)buf = 136446466;
              *(void *)&uint8_t buf[4] = v37;
              *(_WORD *)&buf[12] = 2082;
              *(void *)&buf[14] = v24;
              _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "Attached new listener device: %{public}s for interface: %{public}s",  buf,  0x16u);
            }

            *(void *)&__int128 handler = _NSConcreteStackBlock;
            *((void *)&handler + 1) = 3221225472LL;
            *(void *)&__int128 v105 = sub_10000508C;
            *((void *)&v105 + 1) = &unk_10003CEA0;
            v38 = v34;
            *(void *)&__int128 v106 = v38;
            nw_listener_set_new_connection_handler(v29, &handler);
            *(void *)&__int128 v108 = 0LL;
            *((void *)&v108 + 1) = &v108;
            uint64_t v109 = 0x2020000000LL;
            char v110 = 1;
            *(void *)buf = _NSConcreteStackBlock;
            *(void *)&buf[8] = 3221225472LL;
            *(void *)&buf[16] = sub_10000522C;
            *(void *)&buf[24] = &unk_10003CEC8;
            v39 = v29;
            v112 = v39;
            v115 = &v108;
            v113 = v38;
            id v114 = v20;
            nw_listener_set_state_changed_handler(v39, buf);
            nw_listener_set_queue(v39, (dispatch_queue_t)qword_100043040);
            nw_listener_start(v39);
            id v40 = sub_100003B18();
            v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v102 = 0;
              _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "add server listener done", v102, 2u);
            }

            _Block_object_dispose(&v108, 8);
            v42 = (void *)v106;
          }

          else
          {
            id v87 = sub_100003B18();
            v88 = (os_log_s *)objc_claimAutoreleasedReturnValue(v87);
            if (os_log_type_enabled(v88, OS_LOG_TYPE_FAULT)) {
              sub_1000243DC();
            }

            id v89 = sub_100005054(v20, "ERROR");
            v42 = (void *)objc_claimAutoreleasedReturnValue(v89);
            xpc_dictionary_send_reply(v42);
          }
        }

        else
        {
          id v93 = sub_100003B18();
          v94 = (os_log_s *)objc_claimAutoreleasedReturnValue(v93);
          if (os_log_type_enabled(v94, OS_LOG_TYPE_FAULT)) {
            sub_1000243B0();
          }

          id v95 = sub_100005054(v20, "ERROR");
          __int128 v34 = (RSDRemoteCoreDeviceDevice *)objc_claimAutoreleasedReturnValue(v95);
          xpc_dictionary_send_reply(v34);
        }
      }

      else
      {
        id v70 = sub_100003B18();
        v71 = (os_log_s *)objc_claimAutoreleasedReturnValue(v70);
        if (os_log_type_enabled(v71, OS_LOG_TYPE_FAULT)) {
          sub_1000241E4();
        }

        id v72 = sub_100005054(v20, "ERROR");
        __int128 v29 = (nw_listener *)objc_claimAutoreleasedReturnValue(v72);
        xpc_dictionary_send_reply(v29);
      }
    }

    else
    {
      id v66 = sub_100003B18();
      v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v66);
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
        sub_100024384();
      }

      id v68 = sub_100005054(v20, "ERROR");
      v69 = (void *)objc_claimAutoreleasedReturnValue(v68);
      xpc_dictionary_send_reply(v69);
    }

    goto LABEL_102;
  }

  if (!strcmp(v11, "add_client_device"))
  {
    id v43 = v4;
    id v44 = v5;
    v45 = xpc_dictionary_get_string(v44, "interface_name");
    v46 = xpc_dictionary_get_string(v44, "listener_address");
    uint64_t v47 = xpc_dictionary_get_uint64(v44, "listener_port");
    if (v45 && v46 && v47 && v47 < 0x10000)
    {
      host_with_numeric_port = (void *)nw_endpoint_create_host_with_numeric_port(v46, (unsigned __int16)v47);
      if (host_with_numeric_port)
      {
        uint64_t v49 = xpc_dictionary_get_uint64(v44, "connect_timeout");
        id v50 = sub_100003B18();
        v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&uint8_t buf[4] = v45;
          _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_DEFAULT,  "Creating new client device for interface: %{public}s",  buf,  0xCu);
        }

        v52 = -[RSDRemoteCoreDeviceDevice initWithClientEndpoint:controlPeer:interfaceName:connectTimeout:]( objc_alloc(&OBJC_CLASS___RSDRemoteCoreDeviceDevice),  "initWithClientEndpoint:controlPeer:interfaceName:connectTimeout:",  host_with_numeric_port,  v43,  v45,  v49);
        v53 = v52;
        if (v52 && -[RSDRemoteDevice device_name](v52, "device_name"))
        {
          -[RSDRemoteCoreDeviceDevice attach](v53, "attach");
          id v54 = sub_100003B18();
          v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
          {
            v56 = -[RSDRemoteDevice device_name](v53, "device_name");
            *(_DWORD *)buf = 136446466;
            *(void *)&uint8_t buf[4] = v56;
            *(_WORD *)&buf[12] = 2082;
            *(void *)&buf[14] = v45;
            _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_DEFAULT,  "Attached new client device: %{public}s for interface: %{public}s",  buf,  0x16u);
          }

          id v57 = sub_100005054(v44, "OK");
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v57);
          xpc_dictionary_set_string(v19, "device_name", -[RSDRemoteDevice device_name](v53, "device_name"));
        }

        else
        {
          id v90 = sub_100003B18();
          v91 = (os_log_s *)objc_claimAutoreleasedReturnValue(v90);
          if (os_log_type_enabled(v91, OS_LOG_TYPE_FAULT)) {
            sub_1000243DC();
          }

          id v92 = sub_100005054(v44, "ERROR");
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v92);
        }
      }

      else
      {
        id v96 = sub_100003B18();
        v97 = (os_log_s *)objc_claimAutoreleasedReturnValue(v96);
        if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR)) {
          sub_100024434();
        }

        id v98 = sub_100005054(v44, "ERROR");
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v98);
      }
    }

    else
    {
      id v73 = sub_100003B18();
      v74 = (os_log_s *)objc_claimAutoreleasedReturnValue(v73);
      if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
        sub_100024408();
      }

      id v75 = sub_100005054(v44, "ERROR");
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v75);
    }

    goto LABEL_100;
  }

  if (strcmp(v11, "remove_device"))
  {
    id v12 = sub_100003B18();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100024108();
    }
LABEL_20:

    id v18 = sub_100018AC4(v5);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    goto LABEL_100;
  }

  id v58 = v4;
  id v99 = v5;
  __s2a = (char *)xpc_dictionary_get_string(v99, "device_name");
  if (!__s2a)
  {
    id v76 = sub_100003B18();
    v77 = (os_log_s *)objc_claimAutoreleasedReturnValue(v76);
    if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR)) {
      sub_100024460();
    }

    id v78 = sub_100005054(v99, "ERROR");
    uint64_t v79 = objc_claimAutoreleasedReturnValue(v78);
LABEL_79:
    uint64_t v19 = (void *)v79;
    goto LABEL_80;
  }

  __int128 v106 = 0u;
  __int128 v107 = 0u;
  __int128 handler = 0u;
  __int128 v105 = 0u;
  id v59 = (id)qword_100043038;
  id v60 = [v59 countByEnumeratingWithState:&handler objects:buf count:16];
  if (!v60)
  {
LABEL_59:

LABEL_76:
    id v84 = sub_100003B18();
    v85 = (os_log_s *)objc_claimAutoreleasedReturnValue(v84);
    if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR)) {
      sub_10002448C();
    }

    id v86 = sub_100005054(v99, "ERROR");
    uint64_t v79 = objc_claimAutoreleasedReturnValue(v86);
    goto LABEL_79;
  }

  uint64_t v61 = *(void *)v105;
LABEL_51:
  uint64_t v62 = 0LL;
  while (1)
  {
    if (*(void *)v105 != v61) {
      objc_enumerationMutation(v59);
    }
    v63 = *(void **)(*((void *)&handler + 1) + 8 * v62);
    id v64 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "control_peer", v99));
    if (v64 == v58) {
      break;
    }

LABEL_57:
    if (v60 == (id)++v62)
    {
      id v60 = [v59 countByEnumeratingWithState:&handler objects:buf count:16];
      if (v60) {
        goto LABEL_51;
      }
      goto LABEL_59;
    }
  }

  BOOL v65 = strcmp((const char *)objc_msgSend(v63, "device_name"), __s2a) == 0;

  if (!v65) {
    goto LABEL_57;
  }
  id v80 = v63;

  if (!v80) {
    goto LABEL_76;
  }
  id v81 = sub_100003B18();
  v82 = (os_log_s *)objc_claimAutoreleasedReturnValue(v81);
  if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v108) = 136446210;
    *(void *)((char *)&v108 + 4) = __s2a;
    _os_log_impl( (void *)&_mh_execute_header,  v82,  OS_LOG_TYPE_DEFAULT,  "Disconnecting removed device: %{public}s",  (uint8_t *)&v108,  0xCu);
  }

  [v80 disconnect];
  [v80 cancelListener];
  id v83 = sub_100005054(v99, "OK");
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v83);

LABEL_80:
LABEL_100:
  if (v19)
  {
    xpc_dictionary_send_reply(v19);
  }

LABEL_102:
  objc_autoreleasePoolPop(v6);
}

void sub_100004E64( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_100004E84(id a1)
{
  os_log_t v1 = os_log_create("com.apple.RemoteServiceDiscovery", "CoreDevice");
  id v2 = (void *)qword_100043050;
  qword_100043050 = (uint64_t)v1;
}

void sub_100004EB4(void *a1)
{
  os_log_t v1 = a1;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v2 = [(id)qword_100043038 copy];
  id v3 = [v2 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = *(void *)v15;
    *(void *)&__int128 v4 = 136446210LL;
    __int128 v13 = v4;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        BOOL v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "control_peer", v13));

        if (v9 == v1)
        {
          id v10 = sub_100003B18();
          id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            id v12 = objc_msgSend(v8, "device_name");
            *(_DWORD *)buf = v13;
            id v19 = v12;
            _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Peer connection canceled, disconnecting device: %{public}s",  buf,  0xCu);
          }

          [v8 disconnect];
          [v8 cancelListener];
        }
      }

      id v5 = [v2 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }

    while (v5);
  }

  xpc_connection_cancel(v1);
}

id sub_100005054(void *a1, const char *a2)
{
  xpc_object_t reply = xpc_dictionary_create_reply(a1);
  xpc_dictionary_set_string(reply, "result", a2);
  return reply;
}

void sub_10000508C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_100003B18();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_msgSend(*(id *)(a1 + 32), "device_name");
    int v14 = 138543618;
    id v15 = v3;
    __int16 v16 = 2082;
    id v17 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}@> got incoming remoted connection for device: %{public}s",  (uint8_t *)&v14,  0x16u);
  }

  __int128 v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) connection]);
  if (v7)
  {
    id v8 = sub_100003B18();
    BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = *(void **)(a1 + 32);
      int v14 = 138543362;
      id v15 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@> canceling existing connection to replace it",  (uint8_t *)&v14,  0xCu);
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "client_connection"));
    if (v11)
    {
      id v12 = (nw_connection *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "client_connection"));
      nw_connection_cancel(v12);
    }

    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) connection]);
    xpc_remote_connection_cancel();

    objc_msgSend(*(id *)(a1 + 32), "setClient_connection:", v3);
  }

  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setClient_connection:", v3);
    [*(id *)(a1 + 32) needsConnect];
  }
}

void sub_10000522C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if ((_DWORD)a2 == 3)
  {
    id v14 = sub_100003B18();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100024610();
    }

    if (*(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL))
    {
      id v16 = sub_100005054(*(void **)(a1 + 48), "ERROR");
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(v16);
    }

    else
    {
      __int128 v13 = 0LL;
    }

    [*(id *)(a1 + 40) disconnect];
    [*(id *)(a1 + 40) cancelListener];
    goto LABEL_27;
  }

  if ((_DWORD)a2 != 2)
  {
    if (v5)
    {
      id v17 = sub_100003B18();
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_100024518((uint64_t)v6, a2, v18);
      }

      if (*(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL)) {
        goto LABEL_26;
      }
    }

LABEL_20:
    __int128 v13 = 0LL;
    goto LABEL_32;
  }

  unsigned int port = nw_listener_get_port(*(nw_listener_t *)(a1 + 32));
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL))
  {
    id v19 = sub_100003B18();
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      id v21 = objc_msgSend(*(id *)(a1 + 40), "device_name");
      int v25 = 67109378;
      unsigned int v26 = port;
      __int16 v27 = 2082;
      id v28 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "listener port: %u for device: %{public}s, ignored because client is no longer waiting for reply",  (uint8_t *)&v25,  0x12u);
    }

    goto LABEL_20;
  }

  id v8 = sub_100003B18();
  BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = v9;
  if (port)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v11 = objc_msgSend(*(id *)(a1 + 40), "device_name");
      int v25 = 67109378;
      unsigned int v26 = port;
      __int16 v27 = 2082;
      id v28 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "listener port: %u for device: %{public}s",  (uint8_t *)&v25,  0x12u);
    }

    id v12 = sub_100005054(*(void **)(a1 + 48), "OK");
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    xpc_dictionary_set_string(v13, "device_name", (const char *)objc_msgSend(*(id *)(a1 + 40), "device_name"));
    xpc_dictionary_set_uint64(v13, "listener_port", port);
    goto LABEL_27;
  }

  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
    sub_100024588(a1, v10);
  }

LABEL_26:
  id v22 = sub_100005054(*(void **)(a1 + 48), "ERROR");
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(v22);
LABEL_27:
  uint64_t v23 = *(void *)(*(void *)(a1 + 56) + 8LL);
  if (*(_BYTE *)(v23 + 24)) {
    BOOL v24 = v13 == 0LL;
  }
  else {
    BOOL v24 = 1;
  }
  if (!v24)
  {
    *(_BYTE *)(v23 + 24) = 0;
    xpc_dictionary_send_reply(v13);
  }

  if (v9)
  {
    id v22 = sub_100006188((uint64_t)-[RSDLocalService name](self, "name"), v9);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    -[RSDLocalService setLimit_load_from_device_types:](self, "setLimit_load_from_device_types:", v23);
  }

LABEL_23:
  return v11;
}

  id v12 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  if (*(_BYTE *)(a1 + 69))
  {
    if (v12 && *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL)) {
      goto LABEL_23;
    }
LABEL_25:
    __int128 v13 = 1LL;
    goto LABEL_26;
  }

  if (!v12) {
    goto LABEL_25;
  }
LABEL_23:
  __int128 v13 = 0LL;
LABEL_26:

  return v13;
}

LABEL_32:
}

void sub_1000054F8( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void sub_10000551C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

void sub_100005D3C(_Unwind_Exception *a1)
{
}

uint64_t sub_1000060C4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (xpc_get_type(v4) == (xpc_type_t)&_xpc_type_string)
  {
    string_ptr = xpc_string_get_string_ptr(v4);
    if (!strcmp(string_ptr, "HasInternalSecurityPolicies"))
    {
      objc_msgSend(*(id *)(a1 + 32), "setIs_exposed_to_untrusted_devices_internal:", 1);
    }

    else if (!strcmp(string_ptr, "PreSetup"))
    {
      objc_msgSend(*(id *)(a1 + 32), "setIs_exposed_to_untrusted_devices_presetup:", 1);
    }
  }

  else
  {
    id v5 = (void *)qword_100043220;
    if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_ERROR)) {
      sub_1000248C8(a1, v5);
    }
  }

  return 1LL;
}

id sub_100006188(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_type_t type = xpc_get_type(v3);
  if (type == (xpc_type_t)&_xpc_type_string)
  {
    string_ptr = xpc_string_get_string_ptr(v3);
    __int128 v7 = +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  remote_device_type_parse(string_ptr));
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    __int128 v13 = v8;
    id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
  }

  else if (type == (xpc_type_t)&_xpc_type_array)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10000C054;
    v10[3] = &unk_10003D0A0;
    uint64_t v12 = a1;
    id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    id v11 = v5;
    xpc_array_apply(v3, v10);
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

void sub_100006400(void *a1)
{
  os_log_t v1 = a1;
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id v2 = (id)qword_100043068;
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
LABEL_3:
    uint64_t v6 = 0LL;
    while (1)
    {
      if (*(void *)v8 != v5) {
        objc_enumerationMutation(v2);
      }
      if (!v1[2](v1, *(void *)(*((void *)&v7 + 1) + 8 * v6))) {
        break;
      }
      if (v4 == (id)++v6)
      {
        id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
        if (v4) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

uint64_t sub_1000066B8(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) service]);
  id v3 = v2;
  if (v2) {
    [v2 getTcpOptions];
  }
  else {
    memset(v14, 0, 20);
  }

  uint64_t result = sub_100018118( (int)[*(id *)(a1 + 32) socket],  0,  0,  (unsigned __int8 *)v14,  (int *)&v14[2] + 1);
  if (!(_DWORD)result)
  {
    *(void *)&__int128 v5 = 138543618LL;
    __int128 v13 = v5;
    do
    {
      uint64_t v6 = (void *)qword_100043220;
      if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_DEFAULT))
      {
        __int128 v7 = *(void **)(a1 + 32);
        __int128 v8 = v6;
        __int128 v9 = (void *)objc_claimAutoreleasedReturnValue([v7 device]);
        __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) service]);
        id v11 = [v10 name];
        *(_DWORD *)buf = v13;
        id v16 = v9;
        __int16 v17 = 2080;
        id v18 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@> Got incoming connection for %s",  buf,  0x16u);
      }

      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "service", v13));
      [v12 fireDevice:*(void *)(a1 + 40) fd:HIDWORD(v14[2])];

      close(SHIDWORD(v14[2]));
      uint64_t result = sub_100018118( (int)[*(id *)(a1 + 32) socket],  0,  0,  (unsigned __int8 *)v14,  (int *)&v14[2] + 1);
    }

    while (!(_DWORD)result);
  }

  return result;
}

uint64_t sub_10000686C(uint64_t a1)
{
  return close((int)[*(id *)(a1 + 32) socket]);
}

uint64_t sub_100006F30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) connection]);

  if (!v5) {
    [*(id *)(a1 + 32) setLatestConnectError:a3];
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

id sub_1000074E8(uint64_t a1)
{
  return [*(id *)(a1 + 32) triggerNeedsConnect];
}

uint64_t sub_1000075B8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (xpc_get_type(v4) == (xpc_type_t)&_xpc_type_string)
  {
    __int128 v5 = *(void **)(a1 + 32);
    uint64_t v6 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_string_get_string_ptr(v4));
    __int128 v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    [v5 addObject:v7];
  }

  return 1LL;
}

id sub_10000848C(uint64_t a1)
{
  return [*(id *)(a1 + 32) triggerNeedsConnect];
}

void sub_100008494(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  __int128 v5 = *(void **)(a1 + 32);
  __int128 v7 = a4;
  uint64_t v6 = sub_100014F6C(v5, a3);
  v7[2](v7, v6);
}

void sub_1000084E4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  uint64_t v5 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) connection]);
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    __int128 v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) connection]);
    __int128 v8 = *(void **)(a1 + 40);

    if (v7 != v8)
    {
      __int128 v9 = (os_log_s *)qword_100043220;
      if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = *v4;
        *(_DWORD *)buf = 138543362;
        id v89 = v10;
        id v11 = "%{public}@> ignore message from previous connection";
LABEL_5:
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v11, buf, 0xCu);
        goto LABEL_97;
      }

      goto LABEL_97;
    }
  }

  xpc_type_t type = xpc_get_type(v3);
  unsigned int v13 = [*v4 state];
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (v13 == 5)
    {
      id v15 = (os_log_s *)qword_100043220;
      if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_INFO))
      {
        id v16 = *v4;
        *(_DWORD *)buf = 138543362;
        id v89 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "%{public}@> Device connection interrupted, device already gone, giving up",  buf,  0xCu);
      }
    }

    else
    {
      if ([*v4 state] != 2)
      {
        id v21 = (os_log_s *)qword_100043220;
        if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_DEFAULT))
        {
          id v22 = *v4;
          *(_DWORD *)buf = 138543362;
          id v89 = v22;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%{public}@> Device must renegotiate TLS",  buf,  0xCu);
        }

        *((_BYTE *)*v4 + 59) = 0;
        [*v4 refreshServiceListeners];
        if (*((_BYTE *)*v4 + 57))
        {
          uint64_t v23 = (os_log_s *)qword_100043220;
          if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_DEFAULT))
          {
            id v24 = *v4;
            *(_DWORD *)buf = 138543362;
            id v89 = v24;
            _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "%{public}@> Device connection interrupted. Proceed to reset",  buf,  0xCu);
          }

          [*v4 disconnect];
          [*v4 setState:0];
          [*v4 attach];
          goto LABEL_97;
        }
      }

      __int128 v32 = (os_log_s *)qword_100043220;
      if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_DEFAULT))
      {
        id v33 = *v4;
        *(_DWORD *)buf = 138543362;
        id v89 = v33;
        _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "%{public}@> Device connection interrupted",  buf,  0xCu);
      }

      if ([*v4 state] == 1)
      {
        dispatch_time_t v34 = dispatch_time(0LL, 1000000000LL);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_10000939C;
        block[3] = &unk_10003CF40;
        block[4] = *v4;
        dispatch_after(v34, (dispatch_queue_t)qword_100043070, block);
      }

      else
      {
        unsigned int v35 = [*v4 state];
        id v36 = *v4;
        if (v35 == 2)
        {
          [v36 setState:0];
          __int128 v37 = (dispatch_queue_s *)qword_100043070;
          v86[0] = _NSConcreteStackBlock;
          v86[1] = 3221225472LL;
          v86[2] = sub_1000093A4;
          v86[3] = &unk_10003CF40;
          v86[4] = *v4;
          v38 = v86;
        }

        else
        {
          [v36 setState:4];
          __int128 v37 = (dispatch_queue_s *)qword_100043070;
          v85[0] = _NSConcreteStackBlock;
          v85[1] = 3221225472LL;
          v85[2] = sub_1000093AC;
          v85[3] = &unk_10003CF40;
          v85[4] = *v4;
          v38 = v85;
        }

        dispatch_async(v37, v38);
      }
    }

    v46 = (void *)objc_claimAutoreleasedReturnValue([*v4 connection]);

    if (v46)
    {
      uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue([*v4 connection]);
      xpc_remote_connection_cancel();

      [*v4 setConnection:0];
    }

    goto LABEL_97;
  }

  if (v13 == 1)
  {
    string = xpc_dictionary_get_string(v3, "MessageType");
    objc_msgSend(*v4, "setMessaging_protocol_version:", xpc_dictionary_get_uint64(v3, "MessagingProtocolVersion"));
    if (objc_msgSend(*v4, "messaging_protocol_version") && (!string || strcmp(string, "Handshake")))
    {
      if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_ERROR)) {
        sub_100024F70();
      }
      goto LABEL_96;
    }

    objc_msgSend(*v4, "setUuid:", xpc_dictionary_get_uuid(v3, "UUID"));
    xpc_object_t value = xpc_dictionary_get_value(v3, "Properties");
    unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue(value);
    xpc_object_t reply = v26;
    if (v26)
    {
      xpc_type_t v28 = xpc_get_type(v26);
      __int128 v29 = (os_log_s *)qword_100043220;
      if (v28 != (xpc_type_t)&_xpc_type_dictionary)
      {
        if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_ERROR)) {
          sub_100024F44();
        }

        goto LABEL_96;
      }

      if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_INFO))
      {
        id v39 = *v4;
        *(_DWORD *)buf = 138543362;
        id v89 = v39;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_INFO,  "%{public}@> Updating existing properties dictionary",  buf,  0xCu);
      }

      applier[0] = _NSConcreteStackBlock;
      applier[1] = 3221225472LL;
      applier[2] = sub_1000093B4;
      applier[3] = &unk_10003CFB8;
      applier[4] = *v4;
      xpc_dictionary_apply(reply, applier);
      if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_DEBUG))
      {
        id v40 = (void *)objc_claimAutoreleasedReturnValue([*v4 properties]);
        v41 = (void *)xpc_copy_clean_description(v40);

        if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_DEBUG)) {
          sub_100024EDC();
        }
        free(v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v4, "public_properties"));
        id v43 = (void *)xpc_copy_clean_description(v42);

        if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_DEBUG)) {
          sub_100024E74();
        }
        free(v43);
      }
    }

    xpc_object_t v44 = xpc_dictionary_get_value(v3, "Services");
    v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
    v83[0] = _NSConcreteStackBlock;
    v83[1] = 3221225472LL;
    v83[2] = sub_100009460;
    v83[3] = &unk_10003CFB8;
    v83[4] = *v4;
    xpc_dictionary_apply(v45, v83);
    if ((unint64_t)objc_msgSend(*v4, "messaging_protocol_version") < 4
      || ([*v4 tlsEnabled] & 1) != 0)
    {
      [*v4 handshakeCompleted:0];
LABEL_67:

LABEL_90:
      goto LABEL_97;
    }

    [*v4 setState:2];
    unsigned int v48 = [*v4 negotiateTls];
    uint64_t v49 = *v4;
    if (v48)
    {
      v49[58] = 1;
      id v50 = (os_log_s *)qword_100043220;
      if (!os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_67;
      }
      id v51 = *v4;
      *(_DWORD *)buf = 138543362;
      id v89 = v51;
      v52 = "%{public}@> Requested TLS.";
    }

    else
    {
      v49[58] = 0;
      id v50 = (os_log_s *)qword_100043220;
      if (!os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_67;
      }
      id v57 = *v4;
      *(_DWORD *)buf = 138543362;
      id v89 = v57;
      v52 = "%{public}@> Declined TLS.";
    }

    _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, v52, buf, 0xCu);
    goto LABEL_67;
  }

  unsigned int v17 = [*v4 state];
  id v18 = *v4;
  if (v17 != 2)
  {
    if (objc_msgSend(*v4, "messaging_protocol_version"))
    {
      v30 = xpc_dictionary_get_string(v3, "MessageType");
      if (v30)
      {
        id v31 = v30;
        if (!strcmp(v30, "Heartbeat"))
        {
          if ((xpc_dictionary_expects_reply(v3) & 1) == 0)
          {
            if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_ERROR)) {
              sub_1000250F0();
            }
            goto LABEL_96;
          }

          uint64_t uint64 = xpc_dictionary_get_uint64(v3, "SequenceNumber");
          v55 = (os_log_s *)qword_100043220;
          if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_DEFAULT))
          {
            id v56 = *v4;
            *(_DWORD *)buf = 138543618;
            id v89 = v56;
            __int16 v90 = 2048;
            v91 = (const char *)uint64;
            _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_DEFAULT,  "%{public}@> Responding to heartbeat request with sequence number %llu",  buf,  0x16u);
          }

          *((void *)*v4 + 11) = clock_gettime_nsec_np(_CLOCK_MONOTONIC);
          ++*((void *)*v4 + 13);
          xpc_object_t reply = xpc_dictionary_create_reply(v3);
          xpc_dictionary_set_uint64(reply, "SequenceNumber", uint64);
        }

        else
        {
          if (!strcmp(v31, "Reset"))
          {
            xpc_object_t reply = (xpc_object_t)objc_claimAutoreleasedReturnValue([*v4 handleReset:v3]);
            if (reply) {
              goto LABEL_89;
            }
            goto LABEL_96;
          }

          if (!strcmp(v31, "ResetGoahead")) {
            goto LABEL_79;
          }
          if (!strcmp(v31, "Timesync"))
          {
            if ((xpc_dictionary_expects_reply(v3) & 1) == 0)
            {
              if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_ERROR)) {
                sub_100025210();
              }
              goto LABEL_96;
            }

            xpc_object_t v72 = xpc_dictionary_get_value(v3, "TimesyncPayload");
            id v73 = (void *)objc_claimAutoreleasedReturnValue(v72);
            if (!v73)
            {
              if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_ERROR)) {
                sub_100025150();
              }
              goto LABEL_96;
            }

            v74 = v73;
            id v75 = sub_10000EC20(v73, (void *)qword_100043220);
            uint64_t v76 = objc_claimAutoreleasedReturnValue(v75);
            if (!v76)
            {
              if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_ERROR)) {
                sub_1000251B0();
              }

              goto LABEL_96;
            }

            v77 = (void *)v76;
            xpc_object_t reply = xpc_dictionary_create_reply(v3);
            xpc_dictionary_set_value(reply, "TimesyncPayload", v77);
          }

          else
          {
            if (strcmp(v31, "Goodbye"))
            {
              if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_ERROR)) {
                sub_1000252D0();
              }
              goto LABEL_96;
            }

            if ((xpc_dictionary_expects_reply(v3) & 1) == 0)
            {
              if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_ERROR)) {
                sub_100025270();
              }
              goto LABEL_96;
            }

            xpc_object_t reply = xpc_dictionary_create_reply(v3);
            xpc_dictionary_set_string(reply, "Result", "Ok");
            v82[0] = _NSConcreteStackBlock;
            v82[1] = 3221225472LL;
            v82[2] = sub_10000968C;
            v82[3] = &unk_10003CF40;
            v82[4] = *v4;
            dispatch_async((dispatch_queue_t)qword_100043070, v82);
          }
        }

        if (!reply) {
          goto LABEL_97;
        }
        goto LABEL_89;
      }

      if (!os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_ERROR)) {
        goto LABEL_96;
      }
LABEL_69:
      sub_100025030();
      goto LABEL_96;
    }

    if (!os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_ERROR)) {
      goto LABEL_96;
    }
LABEL_53:
    sub_100024FD0();
    goto LABEL_96;
  }

  if (!objc_msgSend(v18, "messaging_protocol_version"))
  {
    if (!os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_ERROR)) {
      goto LABEL_96;
    }
    goto LABEL_53;
  }

  id v19 = xpc_dictionary_get_string(v3, "MessageType");
  if (!v19)
  {
    if (!os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_ERROR)) {
      goto LABEL_96;
    }
    goto LABEL_69;
  }

  id v20 = v19;
  if (!strcmp(v19, "Reset"))
  {
    uint64_t v53 = objc_claimAutoreleasedReturnValue([*v4 handleReset:v3]);
    if (v53)
    {
      xpc_object_t reply = (xpc_object_t)v53;
LABEL_89:
      xpc_dictionary_send_reply(reply);
      goto LABEL_90;
    }

LABEL_96:
    [*v4 disconnect];
    goto LABEL_97;
  }

  if (!strcmp(v20, "ResetGoahead"))
  {
LABEL_79:
    [*v4 handleResetGoAhead];
    goto LABEL_97;
  }

  if (strcmp(v20, "StartTls"))
  {
    if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_ERROR)) {
      sub_100025090();
    }
    goto LABEL_96;
  }

  BOOL v58 = xpc_dictionary_get_BOOL(v3, "YesNo");
  uint64_t v59 = xpc_dictionary_get_uint64(v3, "TlsPolicy");
  if (v59)
  {
    id v60 = (void *)qword_100043220;
    if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_DEFAULT))
    {
      id v61 = *v4;
      uint64_t v62 = v60;
      *(_DWORD *)buf = 138543618;
      id v89 = v61;
      __int16 v90 = 2082;
      v91 = sub_100013AC8(v59);
      _os_log_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_DEFAULT,  "%{public}@> Peer TLS requirement: %{public}s",  buf,  0x16u);
    }
  }

  v63 = (os_log_s *)qword_100043220;
  if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_DEFAULT))
  {
    id v64 = "declined";
    id v65 = *v4;
    if (v58) {
      id v64 = "requested";
    }
    *(_DWORD *)buf = 138543618;
    id v89 = v65;
    __int16 v90 = 2080;
    v91 = v64;
    _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "%{public}@> Peer %s TLS.", buf, 0x16u);
  }

  if (*((_BYTE *)*v4 + 58)) {
    BOOL v66 = v58;
  }
  else {
    BOOL v66 = 0;
  }
  if (v66)
  {
    v67 = (os_log_s *)qword_100043220;
    if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_DEFAULT))
    {
      id v68 = *v4;
      *(_DWORD *)buf = 138543362;
      id v89 = v68;
      _os_log_impl( (void *)&_mh_execute_header,  v67,  OS_LOG_TYPE_DEFAULT,  "%{public}@> Both sides requested TLS.",  buf,  0xCu);
    }

    *((_BYTE *)*v4 + 59) = 1;
    unsigned int v69 = [*v4 isHost];
    __int128 v9 = (os_log_s *)qword_100043220;
    BOOL v70 = os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_DEFAULT);
    if (!v69)
    {
      if (!v70) {
        goto LABEL_97;
      }
      id v80 = *v4;
      *(_DWORD *)buf = 138543362;
      id v89 = v80;
      id v11 = "%{public}@> Wait for peer to reset connection to enable TLS.";
      goto LABEL_5;
    }

    if (v70)
    {
      id v71 = *v4;
      *(_DWORD *)buf = 138543362;
      id v89 = v71;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@> Resetting connection to enable TLS.",  buf,  0xCu);
    }

    [*v4 _resetNow];
  }

  else
  {
    *((_BYTE *)*v4 + 59) = 0;
    id v78 = (os_log_s *)qword_100043220;
    if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_DEFAULT))
    {
      id v79 = *v4;
      *(_DWORD *)buf = 138543362;
      id v89 = v79;
      _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "%{public}@> Not enabling TLS.", buf, 0xCu);
    }

    [*v4 handshakeCompleted:v59];
  }

LABEL_97:
}

id sub_10000939C(uint64_t a1)
{
  return [*(id *)(a1 + 32) triggerNeedsConnect];
}

id sub_1000093A4(uint64_t a1)
{
  return [*(id *)(a1 + 32) triggerNeedsConnect];
}

id sub_1000093AC(uint64_t a1)
{
  return [*(id *)(a1 + 32) triggerNeedsConnect];
}

uint64_t sub_1000093B4(uint64_t a1, const char *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) properties]);
  xpc_dictionary_set_value(v6, a2, v5);

  __int128 v9 = a2;
  if (lfind(&v9, &off_10003D0C0, &qword_1000304A8, 8uLL, (int (__cdecl *)(const void *, const void *))sub_10000C104))
  {
    __int128 v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "public_properties"));
    xpc_dictionary_set_value(v7, a2, v5);
  }

  return 1LL;
}

uint64_t sub_100009460(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (xpc_get_type(v5) == (xpc_type_t)&_xpc_type_dictionary)
  {
    __int128 v7 = *(void **)(a1 + 32);
    uint64_t v6 = (id *)(a1 + 32);
    __int128 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 serviceWithName:a2]);
    __int128 v9 = (void *)xpc_copy_clean_description(v5);
    id v10 = (os_log_s *)qword_100043220;
    if (v8)
    {
      if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_DEBUG))
      {
        id v16 = *v6;
        int v17 = 138543874;
        id v18 = v16;
        __int16 v19 = 2080;
        uint64_t v20 = a2;
        __int16 v21 = 2080;
        id v22 = v9;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "%{public}@> Updating port for existing remote service %s: %s",  (uint8_t *)&v17,  0x20u);
      }

      [v8 updateWithDescription:v5];
    }

    else
    {
      if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_INFO))
      {
        id v11 = *v6;
        int v17 = 138543874;
        id v18 = v11;
        __int16 v19 = 2082;
        uint64_t v20 = a2;
        __int16 v21 = 2082;
        id v22 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%{public}@> Adding remote service %{public}s: %{public}s",  (uint8_t *)&v17,  0x20u);
      }

      uint64_t v12 = -[RSDRemoteService initWithName:description:]( objc_alloc(&OBJC_CLASS___RSDRemoteService),  "initWithName:description:",  a2,  v5);
      if (v12)
      {
        unsigned int v13 = v12;
        -[RSDRemoteService setDevice:](v12, "setDevice:", *v6);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([*v6 services]);
        [v14 addObject:v13];
      }

      else if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_ERROR))
      {
        sub_1000253F0();
      }
    }

    free(v9);
  }

  else if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_ERROR))
  {
    sub_100025464();
  }

  return 1LL;
}

id sub_10000968C(uint64_t a1)
{
  return [*(id *)(a1 + 32) disconnect];
}

uint64_t sub_100009990(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_1000099A0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_1000099B0(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = a1[4];
  uint64_t v5 = *(void *)(v4 + 80);
  *(void *)(v4 + 80) = 0LL;
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_error)
  {
    if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_ERROR)) {
      sub_10002553C();
    }
    goto LABEL_10;
  }

  uint64_t uint64 = xpc_dictionary_get_uint64(v3, "SequenceNumber");
  __int128 v7 = (os_log_s *)qword_100043220;
  if (uint64 != a1[6])
  {
    uint64_t v11 = uint64;
    if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = a1[4];
      uint64_t v13 = a1[6];
      int v14 = 138543874;
      uint64_t v15 = v12;
      __int16 v16 = 2048;
      uint64_t v17 = v13;
      __int16 v18 = 2048;
      uint64_t v19 = v11;
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%{public}@> Heartbeat %llu failed - WRONG sequence number %llu in reply",  (uint8_t *)&v14,  0x20u);
    }

LABEL_10:
    id v10 = *(void (**)(void))(a1[5] + 16LL);
    goto LABEL_11;
  }

  if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = a1[4];
    uint64_t v9 = a1[6];
    int v14 = 138543618;
    uint64_t v15 = v8;
    __int16 v16 = 2048;
    uint64_t v17 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@> Heartbeat %llu succeeded",  (uint8_t *)&v14,  0x16u);
  }

  *(void *)(a1[4] + 64LL) = v5;
  *(void *)(a1[4] + 72LL) = clock_gettime_nsec_np(_CLOCK_MONOTONIC);
  id v10 = *(void (**)(void))(a1[5] + 16LL);
LABEL_11:
  v10();
}

void sub_100009DB4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_error)
  {
    if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_ERROR)) {
      sub_100025674();
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

  else
  {
    xpc_object_t value = xpc_dictionary_get_value(v3, "TimesyncPayload");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(value);
    if (v5)
    {
      sub_10000ED54(*(void *)(a1 + 48), v5, (void *)qword_100043220);
      uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16LL);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_ERROR)) {
        sub_1000256D8();
      }
      uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16LL);
    }

    v6();
  }
}

uint64_t sub_10000A028(uint64_t a1, xpc_object_t object)
{
  if (xpc_get_type(object) != (xpc_type_t)&_xpc_type_error
    || [*(id *)(a1 + 32) state] != 5)
  {
    return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))(*(void *)(a1 + 40), 0LL);
  }

  id v3 = (os_log_s *)qword_100043220;
  if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138543362;
    uint64_t v7 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%{public}@> Device gone, aborting goodbye",  (uint8_t *)&v6,  0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

id sub_10000A3C4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resetNow];
}

void sub_10000A8C0(uint64_t a1, xpc_object_t object)
{
  xpc_type_t type = xpc_get_type(object);
  uint64_t v4 = *(void **)(a1 + 32);
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    if ([v4 state] == 5)
    {
      int v6 = (os_log_s *)qword_100043220;
      if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        uint64_t v11 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@> Device gone, aborting reset",  buf,  0xCu);
      }
    }

    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10000AA50;
      block[3] = &unk_10003CF40;
      block[4] = *(void *)(a1 + 32);
      dispatch_async((dispatch_queue_t)qword_100043070, block);
    }
  }

  else
  {
    [v4 refreshServiceListeners];
    id v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_string(v8, "MessageType", "ResetGoahead");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) connection]);
    xpc_remote_connection_send_message(v5, v8);

    *(_BYTE *)(*(void *)(a1 + 32) + 56LL) = 0;
  }

id sub_10000AA50(uint64_t a1)
{
  *(_BYTE *)(*(void *)(a1 + 32) + 56LL) = 0;
  return [*(id *)(a1 + 32) reset];
}

void sub_10000AABC(uint64_t a1)
{
  if (([*(id *)(a1 + 32) connectable] & 1) != 0
    || [*(id *)(a1 + 32) state] == 5)
  {
    if ([*(id *)(*(void *)(a1 + 32) + 112) count])
    {
      id v2 = (void (**)(void))objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 112) objectAtIndex:0]);
      [*(id *)(*(void *)(a1 + 32) + 112) removeObjectAtIndex:0];
      v2[2]();
      [*(id *)(a1 + 32) drainPendedRequests];
    }
  }

void sub_10000BAEC()
{
  id v0 = sub_100014F60();
  if (v0)
  {
    id v2 = v0;
    os_log_t v1 = (void *)sub_1000148FC();
    xpc_dictionary_set_value((xpc_object_t)qword_100043238, "EncryptedRemoteXPCPopulatedOIDs", v1);

    id v0 = v2;
  }
}

void sub_10000BB40()
{
  id v0 = (const __CFString *)objc_claimAutoreleasedReturnValue([(id)qword_100043218 valueForKey:@"device-uuid"]);
  CFUUIDRef v1 = CFUUIDCreateFromString(0LL, v0);
  if (v1)
  {
    id v2 = v1;
  }

  else
  {
    id v3 = CFUUIDCreate(0LL);
    if (!v3) {
      sub_100025D94(&buf, out);
    }
    id v2 = v3;
    CFStringRef v4 = CFUUIDCreateString(0LL, v3);
    if (!v4) {
      sub_100025DFC(&buf, out);
    }
    id v0 = v4;
    [(id)qword_100043218 setValue:v4 forKey:@"device-uuid"];
  }

  CFUUIDBytes v7 = CFUUIDGetUUIDBytes(v2);
  uuid_copy(byte_100043228, &v7.byte0);
  *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)uuid_string_t out = v5;
  *(_OWORD *)&out[16] = v5;
  uuid_unparse(byte_100043228, out);
  int v6 = (os_log_s *)qword_100043220;
  if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t buf = 0x1004100202LL;
    __int16 v9 = 2096;
    id v10 = byte_100043228;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "device-uuid: %{uuid_t}.16P",  (uint8_t *)&buf,  0x12u);
  }

  CFRelease(v2);
  CFRelease(v0);
}

char *sub_10000BCBC(const __CFString *a1)
{
  CFIndex v2 = (2 * CFStringGetLength(a1)) | 1;
  id v3 = (char *)malloc(v2);
  if (!v3) {
    sub_100025E64(&v6, v7);
  }
  CFStringRef v4 = v3;
  if (!CFStringGetCString(a1, v3, v2, 0x8000100u)) {
    sub_100025ECC(&v6, v7);
  }
  return v4;
}

void sub_10000BD68(void *a1, const char *a2, const __CFString *a3)
{
  id v5 = a1;
  CFTypeID v6 = CFGetTypeID(a3);
  if (v6 == CFStringGetTypeID())
  {
    CFUUIDBytes v7 = sub_10000BCBC(a3);
    xpc_dictionary_set_string(v5, a2, v7);
    free(v7);
  }

  else
  {
    CFTypeID v8 = CFGetTypeID(a3);
    if (v8 == CFBooleanGetTypeID())
    {
      BOOL v9 = CFBooleanGetValue((CFBooleanRef)a3) != 0;
      xpc_dictionary_set_BOOL(v5, a2, v9);
    }

    else
    {
      CFTypeID v10 = CFGetTypeID(a3);
      if (v10 == CFNumberGetTypeID())
      {
        uint64_t valuePtr = 0xAAAAAAAAAAAAAAAALL;
        CFNumberGetValue((CFNumberRef)a3, kCFNumberSInt64Type, &valuePtr);
        xpc_dictionary_set_uint64(v5, a2, valuePtr);
      }

      else
      {
        CFTypeID v11 = CFGetTypeID(a3);
        if (v11 == CFDataGetTypeID())
        {
          BytePtr = CFDataGetBytePtr((CFDataRef)a3);
          size_t Length = CFDataGetLength((CFDataRef)a3);
          xpc_dictionary_set_data(v5, a2, BytePtr, Length);
        }

        else
        {
          int v14 = (void *)qword_100043220;
          if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_ERROR)) {
            sub_100025F34((uint64_t)a2, v14, a3);
          }
        }
      }
    }
  }
}

void start()
{
  id v0 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  CFUUIDRef v1 = (void *)qword_100043240;
  qword_100043240 = (uint64_t)v0;

  CFIndex v2 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  id v3 = (void *)qword_100043248;
  qword_100043248 = (uint64_t)v2;

  CFStringRef v4 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  id v5 = (void *)qword_100043068;
  qword_100043068 = (uint64_t)v4;

  xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
  CFUUIDBytes v7 = (void *)qword_100043238;
  qword_100043238 = (uint64_t)v6;

  os_log_t v8 = os_log_create("com.apple.RemoteServiceDiscovery", "remoted");
  BOOL v9 = (void *)qword_100043220;
  qword_100043220 = (uint64_t)v8;

  CFTypeID v10 = (os_log_s *)qword_100043220;
  if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "remoted starting up, waiting for services...",  v13,  2u);
  }

  dispatch_queue_t v11 = dispatch_queue_create("com.apple.remoted", 0LL);
  uint64_t v12 = (void *)qword_100043070;
  qword_100043070 = (uint64_t)v11;

  sub_10000BFEC();
  xpc_set_event_stream_handler("com.apple.iokit.matching", 0LL, &stru_10003D078);
  dispatch_main();
}

uint64_t sub_10000BFEC()
{
  uint64_t v0 = xpc_event_publisher_create("com.apple.remoted.service", qword_100043070);
  uint64_t v1 = objc_claimAutoreleasedReturnValue(v0);
  CFIndex v2 = (void *)qword_100043060;
  qword_100043060 = v1;

  xpc_event_publisher_set_handler(qword_100043060, &stru_10003D1A0);
  xpc_event_publisher_set_error_handler(qword_100043060, &stru_10003D1C0);
  return xpc_event_publisher_activate(qword_100043060);
}

uint64_t sub_10000C054(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (xpc_get_type(v4) == (xpc_type_t)&_xpc_type_string)
  {
    string_ptr = xpc_string_get_string_ptr(v4);
    uint64_t v7 = remote_device_type_parse(string_ptr);
    if ((_DWORD)v7)
    {
      os_log_t v8 = *(void **)(a1 + 32);
      BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v7));
      [v8 addObject:v9];
    }
  }

  else
  {
    id v5 = (void *)qword_100043220;
    if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_ERROR)) {
      sub_100025FCC(a1, v5);
    }
  }

  return 1LL;
}

uint64_t sub_10000C104(const char **a1, const char **a2)
{
  return strcmp(*a1, *a2);
}

void sub_10000C110(id a1)
{
  int v5 = 0;
  uint64_t v1 = (const __CFBoolean *)MGCopyAnswerWithError(@"3kmXfug8VcxLI5yEmsqQKw", 0LL, &v5);
  if (v5)
  {
    CFIndex v2 = (os_log_s *)qword_100043220;
    if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_ERROR)) {
      sub_100026064(&v5, v2);
    }
  }

  else
  {
    id v3 = v1;
    byte_100043078 = CFBooleanGetValue(v1) != 0;
    CFRelease(v3);
  }

  id v4 = (os_log_s *)qword_100043220;
  if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t buf = 67109120;
    int v7 = byte_100043078;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "InDiagnosticsMode: %d", buf, 8u);
  }

void sub_10000C214(id a1, unsigned int a2, unint64_t a3, OS_xpc_object *a4)
{
  xpc_object_t v6 = a4;
  switch(a2)
  {
    case 2u:
      uint64_t v13 = (os_log_s *)qword_100043220;
      if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uu = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Finalized the initial set of remoted services",  uu,  2u);
      }

      int v14 = -[RSDPreferences initWithPrefDomain:]( objc_alloc(&OBJC_CLASS___RSDPreferences),  "initWithPrefDomain:",  @"com.apple.remoted");
      uint64_t v15 = (void *)qword_100043218;
      qword_100043218 = (uint64_t)v14;

      [(id)qword_100043218 migrateContentsOnDisk];
      sub_100014EBC((void *)qword_100043070);
      os_variant_has_internal_content("com.apple.xpc.remoted");
      sub_10000BB40();
      __int16 v16 = (void *)qword_100043238;
      char has_internal_content = os_variant_has_internal_content("com.apple.xpc.remoted");
      xpc_dictionary_set_BOOL(v16, "AppleInternal", has_internal_content);
      *(void *)uint64_t buf = 0LL;
      __int16 v18 = *(void **)buf;
      if (*(void *)buf)
      {
        xpc_dictionary_set_string((xpc_object_t)qword_100043238, "BuildVersion", *(const char **)buf);
        free(v18);
      }

      uint64_t v19 = (const __CFDictionary *)_CFCopySystemVersionDictionary();
      if (v19)
      {
        uint64_t v20 = v19;
        Value = (const __CFString *)CFDictionaryGetValue(v19, _kCFSystemVersionProductVersionKey);
        if (Value) {
          sub_10000BD68((void *)qword_100043238, "OSVersion", Value);
        }
        CFRelease(v20);
      }

      id v22 = (const char *)bridge_version_copy_current_string();
      if (v22)
      {
        uint64_t v23 = (char *)v22;
        xpc_dictionary_set_string((xpc_object_t)qword_100043238, "BridgeVersion", v22);
        free(v23);
      }

      else if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_ERROR))
      {
        sub_1000261AC();
      }

      in = 0LL;
      if (!sub_10000E67C("kern.bootsessionuuid", &in)) {
        _os_assumes_log(0LL);
      }
      id v33 = in;
      if (in)
      {
        memset(uu, 170, sizeof(uu));
        int v34 = uuid_parse(in, uu);
        if (v34) {
          _os_assumes_log(v34);
        }
        else {
          xpc_dictionary_set_uuid((xpc_object_t)qword_100043238, "BootSessionUUID", uu);
        }
      }

      free(v33);
      unsigned int v35 = (void *)qword_100043238;
      BOOL v36 = getenv("__OSINSTALL_ENVIRONMENT") != 0LL;
      xpc_dictionary_set_BOOL(v35, "OSInstallEnvironment", v36);
      __int128 v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  @"/System/Library/CoreServices/RestoreVersion.plist",  0LL));
      *(void *)uu = 0LL;
      v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfURL:error:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:error:",  v37,  uu));
      id v39 = *(id *)uu;
      id v40 = v39;
      if (v38)
      {

        v41 = (void *)objc_claimAutoreleasedReturnValue([v38 objectForKeyedSubscript:@"RestoreLongVersion"]);
        __int128 v37 = v41;
        if (v41)
        {
          xpc_dictionary_set_string( (xpc_object_t)qword_100043238, "RestoreLongVersion", (const char *)[v41 UTF8String]);
        }

        else if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_ERROR))
        {
          sub_100026180();
        }
      }

      else
      {
        v42 = (os_log_s *)(id)qword_100043220;
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
          sub_1000260D8(v40, v42);
        }
      }

      uint64_t version_flags = xpc_remote_connection_get_version_flags();
      xpc_dictionary_set_uint64((xpc_object_t)qword_100043238, "RemoteXPCVersionFlags", version_flags);
      xpc_dictionary_set_BOOL((xpc_object_t)qword_100043238, "SensitivePropertiesVisible", 1);

      sub_10000C940();
      sub_100004204((void *)qword_100043070);
      sub_10000F3CC((void *)qword_100043070);
      sub_100011C4C((void *)qword_100043070);
      sub_100002DB4((void *)qword_100043070);
      sub_10001B68C((void *)qword_100043070);
      sub_1000027BC();
      sub_100018448();
      break;
    case 1u:
      __int128 v46 = 0u;
      __int128 v47 = 0u;
      __int128 v44 = 0u;
      __int128 v45 = 0u;
      id v24 = objc_msgSend((id)qword_100043240, "copy", 0);
      id v25 = [v24 countByEnumeratingWithState:&v44 objects:v49 count:16];
      if (v25)
      {
        id v26 = v25;
        uint64_t v27 = *(void *)v45;
        while (2)
        {
          for (i = 0LL; i != v26; i = (char *)i + 1)
          {
            if (*(void *)v45 != v27) {
              objc_enumerationMutation(v24);
            }
            __int128 v29 = *(void **)(*((void *)&v44 + 1) + 8LL * (void)i);
            if ([v29 token] == (id)a3)
            {
              v30 = (void *)qword_100043220;
              if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_INFO))
              {
                id v31 = v30;
                id v32 = [v29 name];
                *(_DWORD *)uu = 136446210;
                *(void *)&uu[4] = v32;
                _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_INFO,  "Unregistered remoted service: %{public}s",  uu,  0xCu);
              }

              [(id)qword_100043240 removeObject:v29];
              goto LABEL_38;
            }
          }

          id v26 = [v24 countByEnumeratingWithState:&v44 objects:v49 count:16];
          if (v26) {
            continue;
          }
          break;
        }
      }

LABEL_38:
      break;
    case 0u:
      *(void *)&__int128 v7 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
      __int128 v59 = v7;
      __int128 v60 = v7;
      __int128 v57 = v7;
      __int128 v58 = v7;
      __int128 v55 = v7;
      __int128 v56 = v7;
      *(_OWORD *)uu = v7;
      __int128 v54 = v7;
      if ((xpc_get_event_name("com.apple.remoted.service", a3, uu) & 1) == 0) {
        __strlcpy_chk(uu, "<Unknown>", 128LL, 128LL);
      }
      os_log_t v8 = -[RSDLocalService initWithToken:name:event:]( objc_alloc(&OBJC_CLASS___RSDLocalService),  "initWithToken:name:event:",  a3,  uu,  v6);
      if (v8)
      {
        BOOL v9 = v8;
        [(id)qword_100043240 addObject:v8];
        CFTypeID v10 = (os_log_s *)qword_100043220;
        if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t buf = 136446210;
          *(void *)&uint8_t buf[4] = uu;
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Registered remoted service: %{public}s",  buf,  0xCu);
        }

        if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_INFO))
        {
          dispatch_queue_t v11 = (void *)xpc_copy_debug_description(v6);
          uint64_t v12 = (os_log_s *)qword_100043220;
          if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)uint64_t buf = 136446466;
            *(void *)&uint8_t buf[4] = uu;
            __int16 v51 = 2082;
            v52 = v11;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%{public}s: %{public}s", buf, 0x16u);
          }

          free(v11);
        }
      }

      break;
  }
}

void sub_10000C8A0(id a1, int a2)
{
  uint64_t v5 = 0LL;
  memset(v4, 0, sizeof(v4));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    uint64_t v2 = 3LL;
  }
  else {
    uint64_t v2 = 2LL;
  }
  uint64_t v3 = _os_log_send_and_compose_impl(v2, &v5, v4, 80LL, &_mh_execute_header, &_os_log_default, 16LL);
  _os_crash_msg(v5, v3);
  __break(1u);
}

void sub_10000C940()
{
  uint64_t v0 = (const __CFString *)MGCopyAnswer(@"0uthiXrHZ212KvcJizKHEw", 0LL);
  if (v0)
  {
    uint64_t v1 = v0;
    sub_10000BD68((void *)qword_100043238, "BoardId", v0);
    uint64_t v2 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "BoardId";
      _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_INFO,  "Populated property with MG: %s",  (uint8_t *)&v451,  0xCu);
    }

    CFRelease(v1);
  }

  else
  {
    uint64_t v3 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100027358(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }

  dispatch_queue_t v11 = (const __CFString *)MGCopyAnswer(@"VqRhf8vgXr9B+SYvpnX39g", 0LL);
  if (v11)
  {
    uint64_t v12 = v11;
    sub_10000BD68((void *)qword_100043238, "BoardRevision", v11);
    uint64_t v13 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "BoardRevision";
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Populated property with MG: %s",  (uint8_t *)&v451,  0xCu);
    }

    CFRelease(v12);
  }

  else
  {
    int v14 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1000272E8(v14, v15, v16, v17, v18, v19, v20, v21);
    }
  }

  id v22 = (const __CFString *)MGCopyAnswer(@"k7QIBwZJJOVw+Sej/8h8VA", 0LL);
  if (v22)
  {
    uint64_t v23 = v22;
    sub_10000BD68((void *)qword_100043238, "CPUArchitecture", v22);
    id v24 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "CPUArchitecture";
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "Populated property with MG: %s",  (uint8_t *)&v451,  0xCu);
    }

    CFRelease(v23);
  }

  else
  {
    id v25 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_100027278(v25, v26, v27, v28, v29, v30, v31, v32);
    }
  }

  id v33 = (const __CFString *)MGCopyAnswer(@"uO3aPe7lfB1XxSiz/1xBvA", 0LL);
  if (v33)
  {
    int v34 = v33;
    sub_10000BD68((void *)qword_100043238, "CertificateProductionStatus", v33);
    unsigned int v35 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "CertificateProductionStatus";
      _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_INFO,  "Populated property with MG: %s",  (uint8_t *)&v451,  0xCu);
    }

    CFRelease(v34);
  }

  else
  {
    BOOL v36 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      sub_100027208(v36, v37, v38, v39, v40, v41, v42, v43);
    }
  }

  __int128 v44 = (const __CFString *)MGCopyAnswer(@"eg8KDO//lXaLwp+URGP6DA", 0LL);
  if (v44)
  {
    __int128 v45 = v44;
    sub_10000BD68((void *)qword_100043238, "CertificateSecurityMode", v44);
    __int128 v46 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "CertificateSecurityMode";
      _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_INFO,  "Populated property with MG: %s",  (uint8_t *)&v451,  0xCu);
    }

    CFRelease(v45);
  }

  else
  {
    __int128 v47 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
      sub_100027198(v47, v48, v49, v50, v51, v52, v53, v54);
    }
  }

  __int128 v55 = (const __CFString *)MGCopyAnswer(@"566JrJVMlDfnslGpwUzNlQ", 0LL);
  if (v55)
  {
    __int128 v56 = v55;
    sub_10000BD68((void *)qword_100043238, "ChipID", v55);
    __int128 v57 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "ChipID";
      _os_log_impl( (void *)&_mh_execute_header,  v57,  OS_LOG_TYPE_INFO,  "Populated property with MG: %s",  (uint8_t *)&v451,  0xCu);
    }

    CFRelease(v56);
  }

  else
  {
    __int128 v58 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
      sub_100027128(v58, v59, v60, v61, v62, v63, v64, v65);
    }
  }

  BOOL v66 = (const __CFString *)MGCopyAnswer(@"+3Uf0Pm5F8Xy7Onyvko0vA", 0LL);
  if (v66)
  {
    v67 = v66;
    sub_10000BD68((void *)qword_100043238, "DeviceClass", v66);
    id v68 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "DeviceClass";
      _os_log_impl( (void *)&_mh_execute_header,  v68,  OS_LOG_TYPE_INFO,  "Populated property with MG: %s",  (uint8_t *)&v451,  0xCu);
    }

    CFRelease(v67);
  }

  else
  {
    unsigned int v69 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
      sub_1000270B8(v69, v70, v71, v72, v73, v74, v75, v76);
    }
  }

  v77 = (const __CFString *)MGCopyAnswer(@"mumHZHMLEfAuTkkd28fHlQ", 0LL);
  if (v77)
  {
    id v78 = v77;
    sub_10000BD68((void *)qword_100043238, "DeviceColor", v77);
    id v79 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "DeviceColor";
      _os_log_impl( (void *)&_mh_execute_header,  v79,  OS_LOG_TYPE_INFO,  "Populated property with MG: %s",  (uint8_t *)&v451,  0xCu);
    }

    CFRelease(v78);
  }

  else
  {
    id v80 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR)) {
      sub_100027048(v80, v81, v82, v83, v84, v85, v86, v87);
    }
  }

  v88 = (const __CFString *)MGCopyAnswer(@"JhEU414EIaDvAz8ki5DSqw", 0LL);
  if (v88)
  {
    id v89 = v88;
    sub_10000BD68((void *)qword_100043238, "DeviceEnclosureColor", v88);
    __int16 v90 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "DeviceEnclosureColor";
      _os_log_impl( (void *)&_mh_execute_header,  v90,  OS_LOG_TYPE_INFO,  "Populated property with MG: %s",  (uint8_t *)&v451,  0xCu);
    }

    CFRelease(v89);
  }

  else
  {
    v91 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR)) {
      sub_100026FD8(v91, v92, v93, v94, v95, v96, v97, v98);
    }
  }

  id v99 = (const __CFString *)MGCopyAnswer(@"7ZipyD32hkjOUTl66Q8REw", 0LL);
  if (v99)
  {
    v100 = v99;
    sub_10000BD68((void *)qword_100043238, "DeviceSupportsLockdown", v99);
    v101 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v101, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "DeviceSupportsLockdown";
      _os_log_impl( (void *)&_mh_execute_header,  v101,  OS_LOG_TYPE_INFO,  "Populated property with MG: %s",  (uint8_t *)&v451,  0xCu);
    }

    CFRelease(v100);
  }

  else
  {
    v102 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR)) {
      sub_100026F68(v102, v103, v104, v105, v106, v107, v108, v109);
    }
  }

  char v110 = (const __CFString *)MGCopyAnswer(@"AQiIpW0UeYQKnhy2da7AXg", 0LL);
  if (v110)
  {
    v111 = v110;
    sub_10000BD68((void *)qword_100043238, "EffectiveProductionStatusAp", v110);
    v112 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v112, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "EffectiveProductionStatusAp";
      _os_log_impl( (void *)&_mh_execute_header,  v112,  OS_LOG_TYPE_INFO,  "Populated property with MG: %s",  (uint8_t *)&v451,  0xCu);
    }

    CFRelease(v111);
  }

  else
  {
    v113 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR)) {
      sub_100026EF8(v113, v114, v115, v116, v117, v118, v119, v120);
    }
  }

  v121 = (const __CFString *)MGCopyAnswer(@"PNexcW/LBlPgAm+Skp2EAg", 0LL);
  if (v121)
  {
    v122 = v121;
    sub_10000BD68((void *)qword_100043238, "EffectiveProductionStatusSEP", v121);
    v123 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v123, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "EffectiveProductionStatusSEP";
      _os_log_impl( (void *)&_mh_execute_header,  v123,  OS_LOG_TYPE_INFO,  "Populated property with MG: %s",  (uint8_t *)&v451,  0xCu);
    }

    CFRelease(v122);
  }

  else
  {
    v124 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v124, OS_LOG_TYPE_ERROR)) {
      sub_100026E88(v124, v125, v126, v127, v128, v129, v130, v131);
    }
  }

  v132 = (const __CFString *)MGCopyAnswer(@"vENa/R1xAXLobl8r3PBL6w", 0LL);
  if (v132)
  {
    v133 = v132;
    sub_10000BD68((void *)qword_100043238, "EffectiveSecurityModeAp", v132);
    v134 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v134, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "EffectiveSecurityModeAp";
      _os_log_impl( (void *)&_mh_execute_header,  v134,  OS_LOG_TYPE_INFO,  "Populated property with MG: %s",  (uint8_t *)&v451,  0xCu);
    }

    CFRelease(v133);
  }

  else
  {
    v135 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v135, OS_LOG_TYPE_ERROR)) {
      sub_100026E18(v135, v136, v137, v138, v139, v140, v141, v142);
    }
  }

  v143 = (const __CFString *)MGCopyAnswer(@"QJSuJ2zhdxYX/7DUA2JtUw", 0LL);
  if (v143)
  {
    v144 = v143;
    sub_10000BD68((void *)qword_100043238, "EffectiveSecurityModeSEP", v143);
    v145 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v145, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "EffectiveSecurityModeSEP";
      _os_log_impl( (void *)&_mh_execute_header,  v145,  OS_LOG_TYPE_INFO,  "Populated property with MG: %s",  (uint8_t *)&v451,  0xCu);
    }

    CFRelease(v144);
  }

  else
  {
    v146 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v146, OS_LOG_TYPE_ERROR)) {
      sub_100026DA8(v146, v147, v148, v149, v150, v151, v152, v153);
    }
  }

  v154 = (const __CFString *)MGCopyAnswer(@"VG9TCKNqNLCHk0J6zTkuVQ", 0LL);
  if (v154)
  {
    v155 = v154;
    sub_10000BD68((void *)qword_100043238, "EthernetMacAddress", v154);
    v156 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v156, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "EthernetMacAddress";
      _os_log_impl( (void *)&_mh_execute_header,  v156,  OS_LOG_TYPE_INFO,  "Populated property with MG: %s",  (uint8_t *)&v451,  0xCu);
    }

    CFRelease(v155);
  }

  else
  {
    v157 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v157, OS_LOG_TYPE_ERROR)) {
      sub_100026D38(v157, v158, v159, v160, v161, v162, v163, v164);
    }
  }

  v165 = (const __CFString *)MGCopyAnswer(@"/YYygAofPDbhrwToVsXdeA", 0LL);
  if (v165)
  {
    v166 = v165;
    sub_10000BD68((void *)qword_100043238, "HWModel", v165);
    v167 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v167, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "HWModelStr";
      _os_log_impl( (void *)&_mh_execute_header,  v167,  OS_LOG_TYPE_INFO,  "Populated property with MG: %s",  (uint8_t *)&v451,  0xCu);
    }

    CFRelease(v166);
  }

  else
  {
    v168 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v168, OS_LOG_TYPE_ERROR)) {
      sub_100026CC8(v168, v169, v170, v171, v172, v173, v174, v175);
    }
  }

  v176 = (const __CFString *)MGCopyAnswer(@"5pYKlGnYYBzGvAlIU8RjEQ", 0LL);
  if (v176)
  {
    v177 = v176;
    sub_10000BD68((void *)qword_100043238, "HardwarePlatform", v176);
    v178 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v178, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "HardwarePlatform";
      _os_log_impl( (void *)&_mh_execute_header,  v178,  OS_LOG_TYPE_INFO,  "Populated property with MG: %s",  (uint8_t *)&v451,  0xCu);
    }

    CFRelease(v177);
  }

  else
  {
    v179 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v179, OS_LOG_TYPE_ERROR)) {
      sub_100026C58(v179, v180, v181, v182, v183, v184, v185, v186);
    }
  }

  v187 = (const __CFString *)MGCopyAnswer(@"7DfjbzhvH/GDkhio1dv8fA", 0LL);
  if (v187)
  {
    v188 = v187;
    sub_10000BD68((void *)qword_100043238, "HasSEP", v187);
    v189 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v189, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "HasSEP";
      _os_log_impl( (void *)&_mh_execute_header,  v189,  OS_LOG_TYPE_INFO,  "Populated property with MG: %s",  (uint8_t *)&v451,  0xCu);
    }

    CFRelease(v188);
  }

  else
  {
    v190 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v190, OS_LOG_TYPE_ERROR)) {
      sub_100026BE8(v190, v191, v192, v193, v194, v195, v196, v197);
    }
  }

  v198 = (const __CFString *)MGCopyAnswer(@"ToLFRidm+eJGWnpw6W4Wwg", 0LL);
  if (v198)
  {
    v199 = v198;
    sub_10000BD68((void *)qword_100043238, "HumanReadableProductVersionString", v198);
    v200 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v200, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "HumanReadableProductVersionString";
      _os_log_impl( (void *)&_mh_execute_header,  v200,  OS_LOG_TYPE_INFO,  "Populated property with MG: %s",  (uint8_t *)&v451,  0xCu);
    }

    CFRelease(v199);
  }

  else
  {
    v201 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v201, OS_LOG_TYPE_ERROR)) {
      sub_100026B78(v201, v202, v203, v204, v205, v206, v207, v208);
    }
  }

  v209 = (const __CFString *)MGCopyAnswer(@"Nzu4E/VsXjEIa83CkRdZrQ", 0LL);
  if (v209)
  {
    v210 = v209;
    sub_10000BD68((void *)qword_100043238, "Image4CryptoHashMethod", v209);
    v211 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v211, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "Image4CryptoHashMethod";
      _os_log_impl( (void *)&_mh_execute_header,  v211,  OS_LOG_TYPE_INFO,  "Populated property with MG: %s",  (uint8_t *)&v451,  0xCu);
    }

    CFRelease(v210);
  }

  else
  {
    v212 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v212, OS_LOG_TYPE_ERROR)) {
      sub_100026B08(v212, v213, v214, v215, v216, v217, v218, v219);
    }
  }

  v220 = (const __CFString *)MGCopyAnswer(@"kyxFFGn+VS4L9a/bsvm19Q", 0LL);
  if (v220)
  {
    v221 = v220;
    sub_10000BD68((void *)qword_100043238, "Image4Supported", v220);
    v222 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v222, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "Image4Supported";
      _os_log_impl( (void *)&_mh_execute_header,  v222,  OS_LOG_TYPE_INFO,  "Populated property with MG: %s",  (uint8_t *)&v451,  0xCu);
    }

    CFRelease(v221);
  }

  else
  {
    v223 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v223, OS_LOG_TYPE_ERROR)) {
      sub_100026A98(v223, v224, v225, v226, v227, v228, v229, v230);
    }
  }

  v231 = (const __CFString *)MGCopyAnswer(@"I32sGclpgl5VujQRJxyhKQ", 0LL);
  if (v231)
  {
    v232 = v231;
    sub_10000BD68((void *)qword_100043238, "IsUIBuild", v231);
    v233 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v233, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "IsUIBuild";
      _os_log_impl( (void *)&_mh_execute_header,  v233,  OS_LOG_TYPE_INFO,  "Populated property with MG: %s",  (uint8_t *)&v451,  0xCu);
    }

    CFRelease(v232);
  }

  else
  {
    v234 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v234, OS_LOG_TYPE_ERROR)) {
      sub_100026A28(v234, v235, v236, v237, v238, v239, v240, v241);
    }
  }

  v242 = (const __CFString *)MGCopyAnswer(@"MrC93gcyPVLHmEbzUu9uzQ", 0LL);
  if (v242)
  {
    v243 = v242;
    sub_10000BD68((void *)qword_100043238, "IsVirtualDevice", v242);
    v244 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v244, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "IsVirtualDevice";
      _os_log_impl( (void *)&_mh_execute_header,  v244,  OS_LOG_TYPE_INFO,  "Populated property with MG: %s",  (uint8_t *)&v451,  0xCu);
    }

    CFRelease(v243);
  }

  else
  {
    v245 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v245, OS_LOG_TYPE_ERROR)) {
      sub_1000269B8(v245, v246, v247, v248, v249, v250, v251, v252);
    }
  }

  v253 = (const __CFString *)MGCopyAnswer(@"k+KTni1jrwErpcDMEnn3aw", 0LL);
  if (v253)
  {
    v254 = v253;
    sub_10000BD68((void *)qword_100043238, "MobileDeviceMinimumVersion", v253);
    v255 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v255, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "MobileDeviceMinimumVersion";
      _os_log_impl( (void *)&_mh_execute_header,  v255,  OS_LOG_TYPE_INFO,  "Populated property with MG: %s",  (uint8_t *)&v451,  0xCu);
    }

    CFRelease(v254);
  }

  else
  {
    v256 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v256, OS_LOG_TYPE_ERROR)) {
      sub_100026948(v256, v257, v258, v259, v260, v261, v262, v263);
    }
  }

  v264 = (const __CFString *)MGCopyAnswer(@"D0cJ8r7U5zve6uA6QbOiLA", 0LL);
  if (v264)
  {
    v265 = v264;
    sub_10000BD68((void *)qword_100043238, "ModelNumber", v264);
    v266 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v266, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "ModelNumber";
      _os_log_impl( (void *)&_mh_execute_header,  v266,  OS_LOG_TYPE_INFO,  "Populated property with MG: %s",  (uint8_t *)&v451,  0xCu);
    }

    CFRelease(v265);
  }

  else
  {
    v267 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v267, OS_LOG_TYPE_ERROR)) {
      sub_1000268D8(v267, v268, v269, v270, v271, v272, v273, v274);
    }
  }

  v275 = (const __CFString *)MGCopyAnswer(@"qgfS+6l1exvcMW5Tfplv2Q", 0LL);
  if (v275)
  {
    v276 = v275;
    sub_10000BD68((void *)qword_100043238, "OceanComputeCarrierID", v275);
    v277 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v277, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "OceanComputeCarrierID";
      _os_log_impl( (void *)&_mh_execute_header,  v277,  OS_LOG_TYPE_INFO,  "Populated property with MG: %s",  (uint8_t *)&v451,  0xCu);
    }

    CFRelease(v276);
  }

  else
  {
    v278 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v278, OS_LOG_TYPE_ERROR)) {
      sub_100026868(v278, v279, v280, v281, v282, v283, v284, v285);
    }
  }

  v286 = (const __CFString *)MGCopyAnswer(@"LUy+wqFiBmou5hwM5OWbmA", 0LL);
  if (v286)
  {
    v287 = v286;
    sub_10000BD68((void *)qword_100043238, "OceanComputeCarrierSlot", v286);
    v288 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v288, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "OceanComputeCarrierSlot";
      _os_log_impl( (void *)&_mh_execute_header,  v288,  OS_LOG_TYPE_INFO,  "Populated property with MG: %s",  (uint8_t *)&v451,  0xCu);
    }

    CFRelease(v287);
  }

  else
  {
    v289 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v289, OS_LOG_TYPE_ERROR)) {
      sub_1000267F8(v289, v290, v291, v292, v293, v294, v295, v296);
    }
  }

  v297 = (const __CFString *)MGCopyAnswer(@"ivIu8YTDnBSrYv/SN4G8Ag", 0LL);
  if (v297)
  {
    v298 = v297;
    sub_10000BD68((void *)qword_100043238, "ProductName", v297);
    v299 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v299, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "ProductName";
      _os_log_impl( (void *)&_mh_execute_header,  v299,  OS_LOG_TYPE_INFO,  "Populated property with MG: %s",  (uint8_t *)&v451,  0xCu);
    }

    CFRelease(v298);
  }

  else
  {
    v300 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v300, OS_LOG_TYPE_ERROR)) {
      sub_100026788(v300, v301, v302, v303, v304, v305, v306, v307);
    }
  }

  v308 = (const __CFString *)MGCopyAnswer(@"h9jDsbgj7xIVeIQ8S3/X3Q", 0LL);
  if (v308)
  {
    v309 = v308;
    sub_10000BD68((void *)qword_100043238, "ProductType", v308);
    v310 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v310, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "ProductType";
      _os_log_impl( (void *)&_mh_execute_header,  v310,  OS_LOG_TYPE_INFO,  "Populated property with MG: %s",  (uint8_t *)&v451,  0xCu);
    }

    CFRelease(v309);
  }

  else
  {
    v311 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v311, OS_LOG_TYPE_ERROR)) {
      sub_100026718(v311, v312, v313, v314, v315, v316, v317, v318);
    }
  }

  v319 = (const __CFString *)MGCopyAnswer(@"P5Go9WVVA604m7rKhbVndw", 0LL);
  if (v319)
  {
    v320 = v319;
    sub_10000BD68((void *)qword_100043238, "ProductVersionExtra", v319);
    v321 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v321, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "ProductVersionExtra";
      _os_log_impl( (void *)&_mh_execute_header,  v321,  OS_LOG_TYPE_INFO,  "Populated property with MG: %s",  (uint8_t *)&v451,  0xCu);
    }

    CFRelease(v320);
  }

  else
  {
    v322 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v322, OS_LOG_TYPE_ERROR)) {
      sub_1000266A8(v322, v323, v324, v325, v326, v327, v328, v329);
    }
  }

  v330 = (const __CFString *)MGCopyAnswer(@"h63QSdBCiT/z0WU6rdQv6Q", 0LL);
  if (v330)
  {
    v331 = v330;
    sub_10000BD68((void *)qword_100043238, "RegionCode", v330);
    v332 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v332, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "RegionCode";
      _os_log_impl( (void *)&_mh_execute_header,  v332,  OS_LOG_TYPE_INFO,  "Populated property with MG: %s",  (uint8_t *)&v451,  0xCu);
    }

    CFRelease(v331);
  }

  else
  {
    v333 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v333, OS_LOG_TYPE_ERROR)) {
      sub_100026638(v333, v334, v335, v336, v337, v338, v339, v340);
    }
  }

  v341 = (const __CFString *)MGCopyAnswer(@"zHeENZu+wbg7PUprwNwBWg", 0LL);
  if (v341)
  {
    v342 = v341;
    sub_10000BD68((void *)qword_100043238, "RegionInfo", v341);
    v343 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v343, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "RegionInfo";
      _os_log_impl( (void *)&_mh_execute_header,  v343,  OS_LOG_TYPE_INFO,  "Populated property with MG: %s",  (uint8_t *)&v451,  0xCu);
    }

    CFRelease(v342);
  }

  else
  {
    v344 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v344, OS_LOG_TYPE_ERROR)) {
      sub_1000265C8(v344, v345, v346, v347, v348, v349, v350, v351);
    }
  }

  v352 = (const __CFString *)MGCopyAnswer(@"9UCjT7Qfi4xLVvPAKIzTCQ", 0LL);
  if (v352)
  {
    v353 = v352;
    sub_10000BD68((void *)qword_100043238, "ReleaseType", v352);
    v354 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v354, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "ReleaseType";
      _os_log_impl( (void *)&_mh_execute_header,  v354,  OS_LOG_TYPE_INFO,  "Populated property with MG: %s",  (uint8_t *)&v451,  0xCu);
    }

    CFRelease(v353);
  }

  else
  {
    v355 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v355, OS_LOG_TYPE_ERROR)) {
      sub_100026558(v355, v356, v357, v358, v359, v360, v361, v362);
    }
  }

  v363 = (const __CFString *)MGCopyAnswer(@"wu9wv8HhpA95iHT4Yyez7A", 0LL);
  if (v363)
  {
    v364 = v363;
    sub_10000BD68((void *)qword_100043238, "SecurityDomain", v363);
    v365 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v365, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "SecurityDomain";
      _os_log_impl( (void *)&_mh_execute_header,  v365,  OS_LOG_TYPE_INFO,  "Populated property with MG: %s",  (uint8_t *)&v451,  0xCu);
    }

    CFRelease(v364);
  }

  else
  {
    v366 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v366, OS_LOG_TYPE_ERROR)) {
      sub_1000264E8(v366, v367, v368, v369, v370, v371, v372, v373);
    }
  }

  v374 = (const __CFString *)MGCopyAnswer(@"VasUgeSzVyHdB27g2XpN0g", 0LL);
  if (v374)
  {
    v375 = v374;
    sub_10000BD68((void *)qword_100043238, "SerialNumber", v374);
    v376 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v376, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "SerialNumber";
      _os_log_impl( (void *)&_mh_execute_header,  v376,  OS_LOG_TYPE_INFO,  "Populated property with MG: %s",  (uint8_t *)&v451,  0xCu);
    }

    CFRelease(v375);
  }

  else
  {
    v377 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v377, OS_LOG_TYPE_ERROR)) {
      sub_100026478(v377, v378, v379, v380, v381, v382, v383, v384);
    }
  }

  v385 = (const __CFString *)MGCopyAnswer(@"a5BRUxn1QBPXkAnbAHbmeg", 0LL);
  if (v385)
  {
    v386 = v385;
    sub_10000BD68((void *)qword_100043238, "SigningFuse", v385);
    v387 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v387, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "SigningFuse";
      _os_log_impl( (void *)&_mh_execute_header,  v387,  OS_LOG_TYPE_INFO,  "Populated property with MG: %s",  (uint8_t *)&v451,  0xCu);
    }

    CFRelease(v386);
  }

  else
  {
    v388 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v388, OS_LOG_TYPE_ERROR)) {
      sub_100026408(v388, v389, v390, v391, v392, v393, v394, v395);
    }
  }

  v396 = (const __CFString *)MGCopyAnswer(@"aadL+4GFBDe6DdsUD2HGGw", 0LL);
  if (v396)
  {
    v397 = v396;
    sub_10000BD68((void *)qword_100043238, "StoreDemoMode", v396);
    v398 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v398, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "StoreDemoMode";
      _os_log_impl( (void *)&_mh_execute_header,  v398,  OS_LOG_TYPE_INFO,  "Populated property with MG: %s",  (uint8_t *)&v451,  0xCu);
    }

    CFRelease(v397);
  }

  else
  {
    v399 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v399, OS_LOG_TYPE_ERROR)) {
      sub_100026398(v399, v400, v401, v402, v403, v404, v405, v406);
    }
  }

  v407 = (const __CFString *)MGCopyAnswer(@"gLd6IDfbVM+JiOhktEP7Bw", 0LL);
  if (v407)
  {
    v408 = v407;
    sub_10000BD68((void *)qword_100043238, "SupplementalBuildVersion", v407);
    v409 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v409, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "SupplementalBuildVersion";
      _os_log_impl( (void *)&_mh_execute_header,  v409,  OS_LOG_TYPE_INFO,  "Populated property with MG: %s",  (uint8_t *)&v451,  0xCu);
    }

    CFRelease(v408);
  }

  else
  {
    v410 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v410, OS_LOG_TYPE_ERROR)) {
      sub_100026328(v410, v411, v412, v413, v414, v415, v416, v417);
    }
  }

  v418 = (const __CFString *)MGCopyAnswer(@"0+nc/Udy4WNG8S+Q7a/s1A", 0LL);
  if (v418)
  {
    v419 = v418;
    sub_10000BD68((void *)qword_100043238, "ThinningProductType", v418);
    v420 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v420, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "ThinningProductType";
      _os_log_impl( (void *)&_mh_execute_header,  v420,  OS_LOG_TYPE_INFO,  "Populated property with MG: %s",  (uint8_t *)&v451,  0xCu);
    }

    CFRelease(v419);
  }

  else
  {
    v421 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v421, OS_LOG_TYPE_ERROR)) {
      sub_1000262B8(v421, v422, v423, v424, v425, v426, v427, v428);
    }
  }

  v429 = (const __CFString *)MGCopyAnswer(@"TF31PAB6aO8KAbPyNKSxKA", 0LL);
  if (v429)
  {
    v430 = v429;
    sub_10000BD68((void *)qword_100043238, "UniqueChipID", v429);
    v431 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v431, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "UniqueChipID";
      _os_log_impl( (void *)&_mh_execute_header,  v431,  OS_LOG_TYPE_INFO,  "Populated property with MG: %s",  (uint8_t *)&v451,  0xCu);
    }

    CFRelease(v430);
  }

  else
  {
    v432 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v432, OS_LOG_TYPE_ERROR)) {
      sub_100026248(v432, v433, v434, v435, v436, v437, v438, v439);
    }
  }

  v440 = (const __CFString *)MGCopyAnswer(@"re6Zb+zwFKJNlkQTUeT+/w", 0LL);
  if (v440)
  {
    v441 = v440;
    sub_10000BD68((void *)qword_100043238, "UniqueDeviceID", v440);
    v442 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v442, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "UniqueDeviceID";
      _os_log_impl( (void *)&_mh_execute_header,  v442,  OS_LOG_TYPE_INFO,  "Populated property with MG: %s",  (uint8_t *)&v451,  0xCu);
    }

    CFRelease(v441);
  }

  else
  {
    v443 = (os_log_s *)(id)qword_100043220;
    if (os_log_type_enabled(v443, OS_LOG_TYPE_ERROR)) {
      sub_1000261D8(v443, v444, v445, v446, v447, v448, v449, v450);
    }
  }

size_t sub_10000E67C(const char *a1, char **a2)
{
  *__error() = 0;
  *(void *)&__int128 v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  __int128 v21 = v4;
  __int128 v22 = v4;
  __int128 v19 = v4;
  __int128 v20 = v4;
  __int128 v17 = v4;
  __int128 v18 = v4;
  *(_OWORD *)__s1 = v4;
  __int128 v16 = v4;
  size_t __size = 128LL;
  int v5 = sysctlbyname(a1, __s1, &__size, 0LL, 0LL);
  int v6 = v5;
  if (__size)
  {
    if (v5) {
      return 0LL;
    }
  }

  else
  {
    size_t __size = 128LL;
    *__error() = 12;
    if (v6) {
      return 0LL;
    }
  }

  if (__size != 128 || *__error() != 12) {
    goto LABEL_12;
  }
  int v8 = sysctlbyname(a1, 0LL, &__size, 0LL, 0LL);
  size_t result = 0LL;
  if (v8) {
    return result;
  }
  if (__size < 0x81)
  {
LABEL_12:
    dispatch_queue_t v11 = 0LL;
    uint64_t v10 = __s1;
LABEL_13:
    *a2 = strdup(v10);
    uint64_t v10 = v11;
    goto LABEL_14;
  }

  uint64_t v9 = (char *)malloc(__size);
  if (!v9) {
    sub_1000273C8(&v12, v14);
  }
  uint64_t v10 = v9;
  if (!sysctlbyname(a1, v9, &__size, 0LL, 0LL))
  {
    dispatch_queue_t v11 = v10;
    goto LABEL_13;
  }

  size_t __size = 0LL;
LABEL_14:
  free(v10);
  return __size;
}

void sub_10000E7F8(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

double sub_10000E804(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  double result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

  ;
}

uint64_t sub_10000E840(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return _os_log_send_and_compose_impl(a1, a2, a3, a4, a5, a6, 16LL);
}

  ;
}

  ;
}

void sub_10000E864(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_10000E870(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(va, 8) = a1;
}

void sub_10000E87C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

void sub_10000E890( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

uint64_t sub_10000E8C8(uint64_t a1)
{
  return _os_crash_msg(*v1, a1);
}

xpc_type_t sub_10000E8D4()
{
  return xpc_get_type(v0);
}

char *sub_10000E8E0(int *a1)
{
  return strerror(*a1);
}

  ;
}

void sub_10000E8F4(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

id sub_10000E900()
{
  return [v0 name];
}

BOOL sub_10000E90C()
{
  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

id sub_10000E918(uint64_t a1, void *a2)
{
  return a2;
}

uint64_t sub_10000E920()
{
  if (qword_100043090 != -1) {
    dispatch_once(&qword_100043090, &stru_10003D1E0);
  }
  return byte_100043088;
}

void sub_10000E960(id a1)
{
  uint64_t v1 = (const __CFString *)MGCopyAnswer(@"+3Uf0Pm5F8Xy7Onyvko0vA", 0LL);
  if (v1)
  {
    uint64_t v2 = v1;
    CFTypeID v3 = CFGetTypeID(v1);
    if (v3 != CFStringGetTypeID())
    {
      uint64_t v7 = 0LL;
      memset(v10, 0, sizeof(v10));
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        uint64_t v4 = 3LL;
      }
      else {
        uint64_t v4 = 2LL;
      }
      int v8 = 134217984;
      uint64_t v9 = 0LL;
      uint64_t v5 = _os_log_send_and_compose_impl(v4, &v7, v10, 80LL, &_mh_execute_header, &_os_log_default, 16LL);
      uint64_t v6 = _os_crash_msg(v7, v5);
      sub_100027430(v6);
    }

    byte_100043088 = CFStringCompare(v2, @"AppleDisplay", 0LL) == kCFCompareEqualTo;
    CFRelease(v2);
  }

  else
  {
    byte_100043088 = 0;
  }

void sub_10000EAC0(_Unwind_Exception *a1)
{
}

unint64_t sub_10000EAF0()
{
  __tp.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  __tp.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  if (clock_gettime(_CLOCK_REALTIME, &__tp)) {
    sub_100027434(&v3, v5);
  }
  __tp.tv_sec += 2208988800LL;
  unsigned int v0 = sntp_datestamp_from_timespec(__tp.tv_sec, __tp.tv_nsec);
  return sntp_timestamp_from_datestamp(v0, v1);
}

id sub_10000EB78(unint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v9 = 0LL;
  memset(bytes, 0, sizeof(bytes));
  LOBYTE(bytes[0]) = 35;
  unint64_t v10 = sntp_timestamp_hton(a1);
  xpc_object_t v4 = xpc_data_create(bytes, 0x30uLL);
  if (!v4) {
    sub_1000274E0(&v7, v11);
  }
  uint64_t v5 = v4;

  return v5;
}

id sub_10000EC20(void *a1, void *a2)
{
  id v3 = a1;
  xpc_object_t v4 = a2;
  *(void *)&__int128 v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  __int128 v22 = v5;
  __int128 v23 = v5;
  _OWORD bytes[2] = v5;
  __int128 buffer = v5;
  bytes[0] = v5;
  bytes[1] = v5;
  unint64_t v6 = sub_10000EAF0();
  unint64_t v7 = sntp_timestamp_hton(v6);
  if (xpc_data_get_bytes(v3, &buffer, 0LL, 0x30uLL) == 48)
  {
    v24[0] = buffer;
    v24[1] = v22;
    v24[2] = v23;
    __int128 v18 = xmmword_1000304C0;
    unint64_t v19 = v7;
    sntp_server_respond((uint64_t)v24, (uint64_t)&v18, (uint64_t (*)(void))sub_10000EAF0, (uint64_t)bytes);
    xpc_object_t v8 = xpc_data_create(bytes, 0x30uLL);
    if (!v8) {
      sub_1000274E0(&v18, v24);
    }
    uint64_t v9 = v8;
  }

  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100027568(v4, v10, v11, v12, v13, v14, v15, v16);
    }
    uint64_t v9 = 0LL;
  }

  return v9;
}

void sub_10000ED54(unint64_t a1, void *a2, void *a3)
{
  unint64_t v41 = a1;
  xpc_object_t v4 = a3;
  *(void *)&__int128 v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v40[3] = v5;
  v40[4] = v5;
  v40[1] = v5;
  v40[2] = v5;
  __int128 v39 = v5;
  v40[0] = v5;
  __int128 buffer = v5;
  __int128 v38 = v5;
  if (xpc_data_get_bytes(a2, &buffer, 0LL, 0x30uLL) == 48)
  {
    unint64_t v36 = sub_10000EAF0();
    *(_OWORD *)&v46.modes = buffer;
    *(_OWORD *)&v46.freq = v38;
    *(_OWORD *)&v46.esterror = v39;
    sntp_client_process_response((unsigned __int8 *)&v46, &v41, &v36, (uint64_t)v40);
    int v6 = v40[0];
    if (LODWORD(v40[0]))
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        sub_100027684(v6, v4, v7);
      }
      goto LABEL_29;
    }

    unint64_t v15 = sntp_calc_offset((uint64_t)v40);
    unint64_t v17 = v16;
    uint64_t v18 = v36;
    unint64_t v19 = v4;
    uint64_t v20 = sntp_datestamp_to_nsec(v15, v17);
    unint64_t v21 = sntp_timestamp_to_datestamp(v18);
    uint64_t v23 = sntp_datestamp_to_timespec(v21, v22);
    uint64_t v25 = v24;
    uint64_t v26 = v23 - 2208988800LL;
    v42[0] = v23 - 2208988800LL;
    v42[1] = v24;
    if (v20 >= 0) {
      unint64_t v27 = v20;
    }
    else {
      unint64_t v27 = -v20;
    }
    if (!v15 && v27 < 0x7A12000)
    {
      *(void *)&v46.modes = 8209LL;
      memset(&v46.freq, 0, 120);
      v46.offset = v20;
      v46.status = 1;
      int v28 = ntp_adjtime(&v46);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)uint64_t buf = 134218496;
        *(void *)&uint8_t buf[4] = v20;
        *(_WORD *)&_BYTE buf[12] = 2048;
        *(void *)&buf[14] = v46.offset;
        __int16 v44 = 2048;
        uint64_t v45 = v46.freq / 0x10000;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "PACING with ntp_adjtime of %lld ns => resulting offset: %ld ns freq: %ld PPM",  buf,  0x20u);
      }

      if (v28 && os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_10002761C(v28, v19, v29);
      }
LABEL_28:

      goto LABEL_29;
    }

    uint64_t v30 = sntp_datestamp_to_timespec(v15, v17);
    uint64_t v32 = v31 + v25;
    *(void *)uint64_t buf = v30 + v26;
    *(void *)&buf[8] = v31 + v25;
    if (v31 + v25 <= 999999999)
    {
      if ((v32 & 0x8000000000000000LL) == 0)
      {
LABEL_22:
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v46.modes = 68158466;
          *(&v46.modes + 1) = 16;
          LOWORD(v46.offset) = 2096;
          *(uint64_t *)((char *)&v46.offset + 2) = (uint64_t)v42;
          WORD1(v46.freq) = 1040;
          HIDWORD(v46.freq) = 16;
          LOWORD(v46.maxerror) = 2096;
          *(uint64_t *)((char *)&v46.maxerror + 2) = (uint64_t)buf;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "setting time from %{timespec}.*P to %{timespec}.*P",  (uint8_t *)&v46,  0x22u);
        }

        if (clock_settime(_CLOCK_REALTIME, (const timespec *)buf))
        {
          unsigned int v35 = v19;
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
            sub_100027598(v35);
          }
        }

        goto LABEL_28;
      }

      uint64_t v33 = 1000000000LL;
      uint64_t v34 = -1LL;
    }

    else
    {
      uint64_t v33 = -1000000000LL;
      uint64_t v34 = 1LL;
    }

    *(void *)uint64_t buf = v30 + v26 + v34;
    *(void *)&buf[8] = v33 + v32;
    goto LABEL_22;
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_1000276EC(v4, v8, v9, v10, v11, v12, v13, v14);
  }
LABEL_29:
}

void sub_10000F0A0(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

BOOL sub_10000F0AC(os_log_s *a1)
{
  return os_log_type_enabled(a1, OS_LOG_TYPE_ERROR);
}

void sub_10000F3CC(void *a1)
{
  id v2 = a1;
  if (!qword_100043098)
  {
    os_log_t v3 = os_log_create("com.apple.RemoteServiceDiscovery", "ncm_host");
    xpc_object_t v4 = (void *)qword_1000430A0;
    qword_1000430A0 = (uint64_t)v3;

    __int128 v5 = (os_log_s *)qword_1000430A0;
    if (os_log_type_enabled((os_log_t)qword_1000430A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Initializing ncm host backend", buf, 2u);
    }

    objc_storeStrong((id *)&qword_100043098, a1);
    int v6 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    uint64_t v7 = (void *)qword_1000430A8;
    qword_1000430A8 = (uint64_t)v6;

    id v8 = (id)qword_1000430A8;
    if (!v8) {
      sub_10002771C(&v30, buf);
    }

    uint64_t v9 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v10 = (void *)qword_1000430B0;
    qword_1000430B0 = (uint64_t)v9;

    id v11 = (id)qword_1000430B0;
    if (!v11) {
      sub_1000277A8(&v30, buf);
    }

    if (qword_1000430B8) {
      sub_1000278C0(&v30, buf);
    }
    uint64_t v12 = sub_1000119B8((void *)qword_100043098);
    qword_1000430B8 = (uint64_t)v12;
    if (!v12) {
      sub_100027834(&v30, buf);
    }
    uint64_t v13 = IOServiceMatching("AppleUSBNCMData");
    if (!v13)
    {
      uint64_t v28 = 0LL;
      __int128 v35 = 0u;
      __int128 v36 = 0u;
      __int128 v33 = 0u;
      __int128 v34 = 0u;
      *(_OWORD *)uint64_t buf = 0u;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        uint64_t v19 = 3LL;
      }
      else {
        uint64_t v19 = 2LL;
      }
      int v30 = 134217984;
      uint64_t v31 = 0LL;
      uint64_t v20 = _os_log_send_and_compose_impl(v19, &v28, buf, 80LL, &_mh_execute_header, &_os_log_default, 16LL);
      uint64_t v21 = _os_crash_msg(v28, v20);
      sub_100027430(v21);
    }

    Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    unint64_t v15 = Mutable;
    if (!Mutable)
    {
      uint64_t v28 = 0LL;
      __int128 v35 = 0u;
      __int128 v36 = 0u;
      __int128 v33 = 0u;
      __int128 v34 = 0u;
      *(_OWORD *)uint64_t buf = 0u;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        uint64_t v22 = 3LL;
      }
      else {
        uint64_t v22 = 2LL;
      }
      int v30 = 134217984;
      uint64_t v31 = 0LL;
      uint64_t v23 = _os_log_send_and_compose_impl(v22, &v28, buf, 80LL, &_mh_execute_header, &_os_log_default, 16LL);
      uint64_t v24 = _os_crash_msg(v28, v23);
      sub_100027430(v24);
    }

    CFDictionarySetValue(Mutable, @"IOModel", @"USB");
    int valuePtr = 1452;
    CFNumberRef v16 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
    CFDictionarySetValue(v15, @"idVendor", v16);
    CFDictionarySetValue(v13, @"IOPropertyMatch", v15);
    unint64_t v17 = IOServiceMatching("IOEthernetInterface");
    uint64_t v18 = v17;
    if (!v17)
    {
      uint64_t v28 = 0LL;
      __int128 v35 = 0u;
      __int128 v36 = 0u;
      __int128 v33 = 0u;
      __int128 v34 = 0u;
      *(_OWORD *)uint64_t buf = 0u;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        uint64_t v25 = 3LL;
      }
      else {
        uint64_t v25 = 2LL;
      }
      int v30 = 134217984;
      uint64_t v31 = 0LL;
      uint64_t v26 = _os_log_send_and_compose_impl(v25, &v28, buf, 80LL, &_mh_execute_header, &_os_log_default, 16LL);
      uint64_t v27 = _os_crash_msg(v28, v26);
      sub_100027430(v27);
    }

    CFDictionarySetValue(v17, @"IOParentMatch", v13);
    if (v16) {
      CFRelease(v16);
    }
    CFRelease(v15);
    CFRelease(v13);
    sub_100011AB0((uint64_t)v12, (IOServiceMatchingCallback)sub_10000F8F4, v18);
  }
}

void sub_10000F884(_Unwind_Exception *a1)
{
  if (v1) {
    CFRelease(v1);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_10000F8F4(uint64_t a1, io_iterator_t iterator)
{
  kern_return_t v23;
  os_log_s *v24;
  __CFString *v25;
  os_log_s *v26;
  BOOL v27;
  CFStringRef v28;
  os_log_s *v29;
  char v30;
  __int128 v31;
  io_registry_entry_t v32;
  __CFString *v33;
  os_log_s *v34;
  kern_return_t Name;
  os_log_s *v36;
  os_log_s *v37;
  BOOL v38;
  char v40;
  char v41[15];
  char v42;
  char v43[11];
  int v44;
  char v45;
  char v46[15];
  char v47;
  char v48[15];
  char v49;
  char v50[11];
  io_iterator_t iteratora;
  uint8_t v52[4];
  __CFString *v53;
  uint8_t buf[16];
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  if (!a1) {
    sub_10002794C(v52, buf);
  }
  uint64_t result = IOIteratorNext(iterator);
  if ((_DWORD)result)
  {
    uint64_t v4 = result;
    do
    {
      __int16 v44 = v4;
      __int128 v5 = (os_log_s *)qword_1000430A0;
      if (os_log_type_enabled((os_log_t)qword_1000430A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "NCM device attached", buf, 2u);
      }

      int v6 = (os_log_s *)qword_1000430A0;
      if (os_log_type_enabled((os_log_t)qword_1000430A0, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)uint64_t buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v4;
        _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "IOIteratorNext returned %d", buf, 8u);
      }

      *(_DWORD *)uint64_t buf = 0;
      int v7 = -5;
      do
      {
        if (sub_100011844(v4, buf))
        {
          if (*(_DWORD *)buf != 4372) {
            goto LABEL_17;
          }
          if (os_log_type_enabled((os_log_t)qword_1000430A0, OS_LOG_TYPE_DEBUG)) {
            sub_100027A88(&v42, v43);
          }
          goto LABEL_22;
        }

        usleep(0x186A0u);
      }

      while (!__CFADD__(v7++, 1));
      uint64_t v9 = (os_log_s *)qword_1000430A0;
      if (os_log_type_enabled((os_log_t)qword_1000430A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v52 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Failed to extract productid, fallback to false",  v52,  2u);
      }

LABEL_17:
      uint64_t v10 = sub_10001113C(v4);
      if ((v10 & 1) != 0)
      {
LABEL_18:
        id v11 = objc_alloc(&OBJC_CLASS___RSDNCMInterface);
        uint64_t v12 = -[RSDNCMInterface initWithService:notificationPort:queue:]( v11,  "initWithService:notificationPort:queue:",  v4,  a1,  qword_100043098);
        uint64_t v13 = v12;
        if (v12)
        {
          -[RSDNCMInterface setIs_private:](v12, "setIs_private:", v10);
          uint64_t v14 = v13;
          -[RSDNCMInterface setInactive_callback:](v14, "setInactive_callback:", &stru_10003D248);
          -[RSDNCMInterface setAddressed_callback:](v14, "setAddressed_callback:", &stru_10003D268);
          -[RSDNCMInterface setDetached_callback:](v14, "setDetached_callback:", &stru_10003D288);

          if (-[RSDNCMInterface activate](v14, "activate"))
          {
            unint64_t v15 = -[RSDRemoteNCMHostDevice initWithInterface:]( objc_alloc(&OBJC_CLASS___RSDRemoteNCMHostDevice),  "initWithInterface:",  v14);
            -[RSDNCMInterface setDevice:](v14, "setDevice:", v15);
            *(_DWORD *)uint64_t buf = -1431655766;
            CFNumberRef v16 = v15;
            unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteNCMDevice interface](v16, "interface"));
            sub_1000116D0((io_registry_entry_t)[v17 service], buf);

            -[RSDRemoteDevice setBackendProperty:withUint:]( v16,  "setBackendProperty:withUint:",  "LocationID",  *(unsigned int *)buf);
            -[RSDRemoteNCMHostDevice attach](v16, "attach");
            [(id)qword_1000430A8 addObject:v14];
          }
        }

        goto LABEL_22;
      }

      iteratora = 0;
      uint64_t v18 = IOObjectCopyClass(v4);
      uint64_t v19 = v18;
      if (v18)
      {
        if (CFStringCompare(v18, @"IOEthernetInterface", 0LL))
        {
          uint64_t v20 = (os_log_s *)qword_1000430A0;
          if (os_log_type_enabled((os_log_t)qword_1000430A0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)uint64_t buf = 138412290;
            *(void *)&uint8_t buf[4] = v19;
            _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Unsupported class %@", buf, 0xCu);
          }
        }

        else
        {
          io_object_t v21 = sub_1000111E4(v4, 3);
          io_registry_entry_t v22 = v21;
          if (v21)
          {
            if (IOObjectConformsTo(v21, "IOUSBDevice"))
            {
              uint64_t v23 = IORegistryEntryCreateIterator(v22, "IOService", 0, &iteratora);
              if (v23)
              {
                uint64_t v24 = (os_log_s *)qword_1000430A0;
                if (os_log_type_enabled((os_log_t)qword_1000430A0, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)uint64_t buf = 67109120;
                  *(_DWORD *)&uint8_t buf[4] = v23;
                  _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "IORegistryEntryCreateIterator failed: 0x%08x",  buf,  8u);
                }

  free(v13);

  return v11;
}

        __break(0x5513u);
        goto LABEL_18;
      }
    }
  }

  return result;
}

LABEL_44:
                LODWORD(v2_Block_object_dispose(va, 8) = 0;
LABEL_45:
                int v30 = 0;
              }

              else
              {
                *(void *)&uint64_t v31 = 0xAAAAAAAAAAAAAAAALL;
                *((void *)&v31 + 1) = 0xAAAAAAAAAAAAAAAALL;
                uint64_t v60 = v31;
                uint64_t v61 = v31;
                __int128 v58 = v31;
                uint64_t v59 = v31;
                __int128 v56 = v31;
                __int128 v57 = v31;
                *(_OWORD *)uint64_t buf = v31;
                __int128 v55 = v31;
                while (1)
                {
                  uint64_t v32 = IOIteratorNext(iteratora);
                  LODWORD(v2_Block_object_dispose(va, 8) = v32;
                  if (!v32) {
                    break;
                  }
                  __int128 v33 = (__CFString *)sub_100011284(v32);
                  __int128 v34 = (os_log_s *)qword_1000430A0;
                  if (v33)
                  {
                    if (os_log_type_enabled((os_log_t)qword_1000430A0, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)uint64_t v52 = 136315138;
                      uint64_t v53 = v33;
                      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Iterating %s", v52, 0xCu);
                    }

                    free(v33);
                    Name = IORegistryEntryGetName((io_registry_entry_t)v28, (char *)buf);
                    if (Name)
                    {
                      __int128 v36 = (os_log_s *)qword_1000430A0;
                      if (os_log_type_enabled((os_log_t)qword_1000430A0, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)uint64_t v52 = 67109120;
                        LODWORD(v53) = Name;
                        _os_log_error_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_ERROR,  "IORegistryEntryGetName failed: 0x%08x",  v52,  8u);
                      }
                    }

                    else if (!(*(void *)buf ^ 0x61746144204D434ELL | buf[8]) {
                           && sub_10001113C((io_registry_entry_t)v28))
                    }
                    {
                      IOObjectRelease((io_object_t)v28);
                      LODWORD(v2_Block_object_dispose(va, 8) = 1;
                      break;
                    }

                    IOObjectRelease((io_object_t)v28);
                  }

                  else if (os_log_type_enabled((os_log_t)qword_1000430A0, OS_LOG_TYPE_ERROR))
                  {
                    sub_100027B0C(&v45, v46);
                  }
                }

                int v30 = 1;
              }

              IOObjectRelease(v22);
              goto LABEL_62;
            }

            uint64_t v28 = IOObjectCopyClass(v22);
            uint64_t v29 = (os_log_s *)qword_1000430A0;
            if (os_log_type_enabled((os_log_t)qword_1000430A0, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)uint64_t buf = 138412290;
              *(void *)&uint8_t buf[4] = v28;
              _os_log_error_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "Unexpected 3rd parent class %@",  buf,  0xCu);
              if (!v28) {
                goto LABEL_45;
              }
            }

            else if (!v28)
            {
              goto LABEL_45;
            }

            CFRelease(v28);
            goto LABEL_44;
          }

          uint64_t v25 = (__CFString *)sub_100011284(v4);
          uint64_t v26 = (os_log_s *)qword_1000430A0;
          uint64_t v27 = os_log_type_enabled((os_log_t)qword_1000430A0, OS_LOG_TYPE_ERROR);
          if (v25)
          {
            if (v27)
            {
              *(_DWORD *)uint64_t buf = 136315138;
              *(void *)&uint8_t buf[4] = v25;
              _os_log_error_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "Can't find 3rd parent for %s",  buf,  0xCu);
            }

            free(v25);
          }

          else if (v27)
          {
            sub_100027AE4(&v47, v48);
          }
        }
      }

      else if (os_log_type_enabled((os_log_t)qword_1000430A0, OS_LOG_TYPE_ERROR))
      {
        sub_100027AE4(&v49, v50);
      }

      LODWORD(v2_Block_object_dispose(va, 8) = 0;
      int v30 = 0;
LABEL_62:
      if (iteratora) {
        IOObjectRelease(iteratora);
      }
      if (v19) {
        CFRelease(v19);
      }
      if ((v30 & 1) != 0)
      {
        uint64_t v37 = (os_log_s *)qword_1000430A0;
        __int128 v38 = os_log_type_enabled((os_log_t)qword_1000430A0, OS_LOG_TYPE_DEFAULT);
        if (!(_DWORD)v28)
        {
          if (v38)
          {
            *(_WORD *)uint64_t buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "Using the public NCM interface",  buf,  2u);
          }

          goto LABEL_18;
        }

        if (v38)
        {
          *(_WORD *)uint64_t buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "Not using the public NCM interface due to the existence of private NCM interface",  buf,  2u);
        }
      }

      else if (os_log_type_enabled((os_log_t)qword_1000430A0, OS_LOG_TYPE_ERROR))
      {
        sub_100027ABC(&v40, v41);
      }

LABEL_22:
      if ((_DWORD)v4)
      {
        if (IOObjectRelease(v4)) {
          sub_1000279D8(v52, buf);
        }
      }

      uint64_t result = IOIteratorNext(iterator);
      uint64_t v4 = result;
    }

    while ((_DWORD)result);
  }

  return result;
}
    }
  }

  else if (*(_DWORD *)(a1 + 80))
  {
    __int128 v33 = sub_10001D718();
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR)) {
      sub_10002B574((uint64_t)v5, (os_log_s *)v14, v34, v35, v36, v37, v38, v39);
    }
    goto LABEL_22;
  }
}

      __break(0x5519u);
    }
  }

  else if (a2)
  {
    if (a3) {
      *a3 = 0;
    }
    return 1LL;
  }

  return 0LL;
}

void sub_100010068( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, int a26, unsigned int a27)
{
  if (v27) {
    CFRelease(v27);
  }
  sub_1000110D8(&a27);
  _Unwind_Resume(a1);
}

void sub_1000105B4(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  if ([*(id *)(a1 + 32) state] != 3)
  {
    id v2 = (void *)objc_claimAutoreleasedReturnValue([*v1 connection]);

    if (v2)
    {
      os_log_t v3 = (os_log_s *)qword_1000430A0;
      if (os_log_type_enabled((os_log_t)qword_1000430A0, OS_LOG_TYPE_ERROR)) {
        sub_100027C08((uint64_t *)v1, v3);
      }
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*v1 connection]);
      xpc_remote_connection_cancel(v4);
    }
  }

id sub_100010C70(uint64_t a1)
{
  return [*(id *)(a1 + 32) triggerNeedsConnect];
}

void sub_100010C78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((_DWORD)a3)
  {
    __int128 v5 = (os_log_s *)qword_1000430A0;
    if (os_log_type_enabled((os_log_t)qword_1000430A0, OS_LOG_TYPE_ERROR)) {
      sub_100027E7C(a1, a3, v5);
    }
    [*(id *)(a1 + 32) connect:0];
  }

  else
  {
    int v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) connection]);

    int v7 = (os_log_s *)qword_1000430A0;
    BOOL v8 = os_log_type_enabled((os_log_t)qword_1000430A0, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        uint64_t v9 = *(void *)(a1 + 32);
        int v15 = 138543362;
        uint64_t v16 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@> pollConnect completed, but socket is not needed anymore, closing",  (uint8_t *)&v15,  0xCu);
      }

      close(*(_DWORD *)(*(void *)(a1 + 32) + 304LL));
    }

    else
    {
      if (v8)
      {
        uint64_t v10 = *(void *)(a1 + 32);
        int v15 = 138543362;
        uint64_t v16 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@> pollConnect completed, socket is connected",  (uint8_t *)&v15,  0xCu);
      }

      uint64_t v11 = *(unsigned int *)(*(void *)(a1 + 32) + 304LL);
      uint64_t v12 = qword_100043098;
      failsafe_uint64_t version_flags = xpc_remote_connection_get_failsafe_version_flags(v8);
      uint64_t v14 = (void *)xpc_remote_connection_create_with_connected_fd(v11, v12, failsafe_version_flags, 0LL);
      [*(id *)(a1 + 32) connect:v14];
    }
  }

  *(_DWORD *)(*(void *)(a1 + 32) + 304LL) = -1;
}

uint64_t sub_1000110D8(unsigned int *a1)
{
  uint64_t result = *a1;
  if ((_DWORD)result)
  {
    uint64_t result = IOObjectRelease(result);
    if ((_DWORD)result) {
      sub_100027EF0(&v2, v3);
    }
  }

  return result;
}

uint64_t sub_10001113C(io_registry_entry_t a1)
{
  int v8 = 0;
  int v2 = -5;
  do
  {
    if ((sub_100011774(a1, &v8) & 1) != 0) {
      return (HIBYTE(v8) >> 5) & 1;
    }
    usleep(0x186A0u);
  }

  while (!__CFADD__(v2++, 1));
  uint64_t v4 = (os_log_s *)qword_1000430A0;
  BOOL v5 = os_log_type_enabled((os_log_t)qword_1000430A0, OS_LOG_TYPE_DEFAULT);
  uint64_t result = 0LL;
  if (v5)
  {
    *(_WORD *)int v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Failed to extract nwifflags, fallback to false",  v7,  2u);
    return 0LL;
  }

  return result;
}

uint64_t sub_1000111E4(io_registry_entry_t a1, int a2)
{
  if (!a1) {
    sub_100027F84(&v5, parent);
  }
  parent[0] = 0;
  uint64_t v3 = 0LL;
  if (!IORegistryEntryGetParentEntry(a1, "IOService", parent))
  {
    uint64_t v3 = parent[0];
    if (a2 != 1)
    {
      uint64_t v3 = sub_1000111E4(parent[0], (a2 - 1));
      IOObjectRelease(parent[0]);
    }
  }

  return v3;
}

CFStringRef sub_100011284(io_registry_entry_t a1)
{
  uint64_t result = IORegistryEntryCopyPath(a1, "IOService");
  if (result)
  {
    int v2 = result;
    uint64_t v3 = sub_10000BCBC(result);
    CFRelease(v2);
    return (const __CFString *)v3;
  }

  return result;
}

void sub_1000112C4(id a1, RSDNCMInterface *a2)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[RSDNCMInterface device](a2, "device"));
  [v2 setSuspended:1];
}

void sub_1000112F8(id a1, RSDNCMInterface *a2)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[RSDNCMInterface device](a2, "device"));
  sub_10001E514(v2);
  [v2 triggerNeedsConnect];
  [v2 setSuspended:0];
}

void sub_10001133C(id a1, RSDNCMInterface *a2)
{
  id v2 = a2;
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[RSDNCMInterface device](v2, "device"));
  [v3 disconnect];
  -[RSDNCMInterface setDevice:](v2, "setDevice:", 0LL);
  [(id)qword_1000430A8 removeObject:v2];
}

double sub_100011398(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  double result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

void sub_1000113B0(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
}

_BYTE *sub_1000113C0(_BYTE *result, _BYTE *a2)
{
  *double result = 0;
  *a2 = 0;
  return result;
}

uint64_t sub_1000113D0(uint64_t a1)
{
  return _os_crash_msg(*v1, a1);
}

const void *sub_1000113DC(const void *result)
{
  if (result)
  {
    CFTypeID v1 = CFGetTypeID(result);
    return (const void *)(v1 == CFBooleanGetTypeID());
  }

  return result;
}

BOOL sub_10001140C(io_registry_entry_t a1, _DWORD *a2)
{
  BOOL v2 = 0LL;
  if (a1 && a2)
  {
    uint64_t v4 = (void *)IORegistryEntrySearchCFProperty(a1, "IOService", @"IOLinkStatus", kCFAllocatorDefault, 3u);
    BOOL v2 = v4 != 0LL;
    if (v4)
    {
      uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber);
      if ((objc_opt_isKindOfClass(v4, v5) & 1) == 0) {
        _os_assumes_log(0LL);
      }
      *a2 = [v4 unsignedIntValue];
    }

    else
    {
      id v6 = sub_1000114D8();
      int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_100027FF4();
      }
    }
  }

  return v2;
}

id sub_1000114D8()
{
  if (qword_1000430C8 != -1) {
    dispatch_once(&qword_1000430C8, &stru_10003D2A8);
  }
  return (id)qword_1000430C0;
}

BOOL sub_100011518(io_registry_entry_t a1, char *a2)
{
  BOOL v2 = 0LL;
  if (a1 && a2)
  {
    uint64_t v4 = (const __CFString *)IORegistryEntrySearchCFProperty( a1,  "IOService",  @"BSD Name",  kCFAllocatorDefault,  3u);
    if (v4)
    {
      uint64_t v5 = v4;
      CFTypeID v6 = CFGetTypeID(v4);
      if (v6 != CFStringGetTypeID()) {
        _os_assumes_log(0LL);
      }
      CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
      int CString = CFStringGetCString(v5, a2, 16LL, SystemEncoding);
      BOOL v2 = CString != 0;
      if (CString && !*a2) {
        _os_assumes_log(0LL);
      }
      CFRelease(v5);
    }

    else
    {
      id v9 = sub_1000114D8();
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_100028020();
      }

      return 0LL;
    }
  }

  return v2;
}

void sub_100011600(_Unwind_Exception *a1)
{
}

uint64_t sub_100011620(io_registry_entry_t entry, void *a2)
{
  uint64_t result = 0LL;
  if (entry && a2)
  {
    CFTypeRef v5 = IORegistryEntrySearchCFProperty(entry, "IOService", @"USB Serial Number", kCFAllocatorDefault, 3u);
    *a2 = v5;
    if (v5)
    {
      CFTypeID v6 = CFGetTypeID(v5);
      if (v6 != CFStringGetTypeID()) {
        _os_assumes_log(0LL);
      }
      return 1LL;
    }

    else
    {
      id v7 = sub_1000114D8();
      int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_10002804C();
      }

      return 0LL;
    }
  }

  return result;
}

BOOL sub_1000116D0(io_registry_entry_t a1, _DWORD *a2)
{
  BOOL v2 = 0LL;
  if (a1 && a2)
  {
    uint64_t v4 = (void *)IORegistryEntrySearchCFProperty(a1, "IOService", @"locationID", kCFAllocatorDefault, 3u);
    CFTypeRef v5 = v4;
    BOOL v2 = v4 != 0LL;
    if (v4)
    {
      *a2 = [v4 unsignedIntValue];
    }

    else
    {
      id v6 = sub_1000114D8();
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_100028078();
      }
    }
  }

  return v2;
}

uint64_t sub_100011774(io_registry_entry_t a1, _DWORD *a2)
{
  uint64_t v2 = 0LL;
  if (a1 && a2)
  {
    CFTypeRef v5 = (void *)IORegistryEntrySearchCFProperty( a1,  "IOService",  @"NetworkInterfaceFlags",  kCFAllocatorDefault,  3u);
    if (v5
      || (CFTypeRef v5 = (void *)IORegistryEntrySearchCFProperty( a1,  "IOService",  @"NetworkInterfaceFlags",  kCFAllocatorDefault,  1u)) != 0LL)
    {
      *a2 = [v5 unsignedIntValue];
      uint64_t v2 = 1LL;
    }

    else
    {
      id v7 = sub_1000114D8();
      CFTypeRef v5 = (void *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR)) {
        sub_1000280A4();
      }
      uint64_t v2 = 0LL;
    }
  }

  return v2;
}

BOOL sub_100011844(io_registry_entry_t a1, _DWORD *a2)
{
  BOOL v2 = 0LL;
  if (a1 && a2)
  {
    uint64_t v4 = (void *)IORegistryEntrySearchCFProperty(a1, "IOService", @"idProduct", kCFAllocatorDefault, 3u);
    CFTypeRef v5 = v4;
    BOOL v2 = v4 != 0LL;
    if (v4)
    {
      *a2 = [v4 unsignedIntValue];
    }

    else
    {
      id v6 = sub_1000114D8();
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_1000280D0();
      }
    }
  }

  return v2;
}

BOOL sub_1000118E8(io_registry_entry_t a1, uint64_t a2)
{
  BOOL v2 = 0LL;
  if (a1 && a2)
  {
    uint64_t v4 = (void *)IORegistryEntrySearchCFProperty(a1, "IOService", @"IOMACAddress", kCFAllocatorDefault, 3u);
    CFTypeRef v5 = v4;
    BOOL v2 = v4 != 0LL;
    if (v4)
    {
      id v6 = [v5 bytes];
      __int16 v7 = v6[2];
      *(_DWORD *)a2 = *(_DWORD *)v6;
      *(_WORD *)(a2 + 4) = v7;
    }

    else
    {
      id v8 = sub_1000114D8();
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1000280FC();
      }
    }
  }

  return v2;
}

id *sub_1000119B8(void *a1)
{
  id v2 = a1;
  id v3 = (id *)calloc(1uLL, 0x20uLL);
  if (!v3) {
    sub_100028128(&v9, v10);
  }
  uint64_t v4 = v3;
  objc_storeStrong(v3, a1);
  uint64_t v5 = IOMainPort(0, (mach_port_t *)v4 + 2);
  if ((_DWORD)v5) {
    os_assert_mach("create main port", v5);
  }
  IONotificationPortRef v6 = IONotificationPortCreate(*((_DWORD *)v4 + 2));
  v4[2] = v6;
  if (!v6) {
    sub_100028190(&v9, v10);
  }
  id v7 = *v4;
  if (!v7) {
    sub_1000281F8(&v9, v10);
  }

  IONotificationPortSetDispatchQueue((IONotificationPortRef)v4[2], (dispatch_queue_t)*v4);
  return v4;
}

void sub_100011AB0(uint64_t a1, IOServiceMatchingCallback callback, const __CFDictionary *a3)
{
  if (!a1) {
    sub_100028128(&v16, v17);
  }
  uint64_t v5 = IOServiceAddMatchingNotification( *(IONotificationPortRef *)(a1 + 16),  "IOServiceFirstMatch",  a3,  callback,  *(void **)(a1 + 16),  (io_iterator_t *)(a1 + 24));
  id v6 = sub_1000114D8();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100028260(v5, v7, v8, v9, v10, v11, v12, v13);
  }

  if ((_DWORD)v5)
  {
    _os_assumes_log((int)v5);
  }

  else
  {
    uint64_t v14 = *(dispatch_queue_s **)a1;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100011BB4;
    v15[3] = &unk_10003CE38;
    v15[4] = a1;
    v15[5] = callback;
    dispatch_async(v14, v15);
  }

uint64_t sub_100011BB4(uint64_t a1)
{
  id v2 = sub_1000114D8();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1000282C4(a1, v3, v4, v5, v6, v7, v8, v9);
  }

  return (*(uint64_t (**)(void, void))(a1 + 40))( *(void *)(*(void *)(a1 + 32) + 16LL),  *(unsigned int *)(*(void *)(a1 + 32) + 24LL));
}

void sub_100011C0C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.RemoteServiceDiscovery", "iokit");
  id v2 = (void *)qword_1000430C0;
  qword_1000430C0 = (uint64_t)v1;
}

void sub_100011C3C( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100011C4C(void *a1)
{
  id v2 = a1;
  if (!qword_1000430D0 && (sub_10000E920() & 1) == 0)
  {
    os_log_t v3 = os_log_create("com.apple.RemoteServiceDiscovery", "ncm_device");
    uint64_t v4 = (void *)qword_1000430D8;
    qword_1000430D8 = (uint64_t)v3;

    uint64_t v5 = (os_log_s *)qword_1000430D8;
    if (os_log_type_enabled((os_log_t)qword_1000430D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Initializing ncm device backend", buf, 2u);
    }

    objc_storeStrong((id *)&qword_1000430D0, a1);
    uint64_t v6 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    uint64_t v7 = (void *)qword_1000430E0;
    qword_1000430E0 = (uint64_t)v6;

    id v8 = (id)qword_1000430E0;
    if (!v8) {
      sub_100028330(&v17, buf);
    }

    if (qword_1000430E8) {
      sub_1000284D4(&v17, buf);
    }
    uint64_t v9 = sub_1000119B8((void *)qword_1000430D0);
    qword_1000430E8 = (uint64_t)v9;
    if (!v9) {
      sub_1000283BC(&v17, buf);
    }
    CFMutableDictionaryRef v10 = IOServiceMatching("AppleUSBDeviceNCMData");
    if (!v10) {
      sub_100028448(&v17, buf);
    }
    uint64_t v11 = IOServiceMatching("IOEthernetInterface");
    uint64_t v12 = v11;
    if (!v11)
    {
      uint64_t v16 = 0LL;
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      *(_OWORD *)uint64_t buf = 0u;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        uint64_t v13 = 3LL;
      }
      else {
        uint64_t v13 = 2LL;
      }
      int v17 = 134217984;
      uint64_t v18 = 0LL;
      uint64_t v14 = _os_log_send_and_compose_impl(v13, &v16, buf, 80LL, &_mh_execute_header, &_os_log_default, 16LL);
      uint64_t v15 = _os_crash_msg(v16, v14);
      sub_100027430(v15);
    }

    CFDictionarySetValue(v11, @"IOParentMatch", v10);
    CFRelease(v10);
    sub_100011AB0((uint64_t)v9, (IOServiceMatchingCallback)sub_100011ED0, v12);
  }
}

void sub_100011EA8(_Unwind_Exception *a1)
{
}

uint64_t sub_100011ED0(uint64_t a1, io_iterator_t iterator)
{
  if (!a1) {
    sub_100028560(&v26, v32);
  }
  uint64_t result = IOIteratorNext(iterator);
  if ((_DWORD)result)
  {
    uint64_t v4 = result;
    *(void *)&__int128 v3 = 67109120LL;
    __int128 v23 = v3;
    while (1)
    {
      uint64_t v5 = (os_log_s *)qword_1000430D8;
      if (os_log_type_enabled((os_log_t)qword_1000430D8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)uint64_t v32 = v23;
        *(_DWORD *)&v32[4] = v4;
        _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "IOIteratorNext returned %d", v32, 8u);
      }

      uint64_t v6 = IOObjectCopyClass(v4);
      CFComparisonResult v7 = CFStringCompare(v6, @"AppleUSBDeviceNCMPrivateEthernetInterface", 0LL);
      if (v6) {
        CFRelease(v6);
      }
      if (v7 == kCFCompareEqualTo) {
        goto LABEL_29;
      }
      id v8 = (void *)IORegistryEntrySearchCFProperty(v4, "IOService", @"DeviceDescription", kCFAllocatorDefault, 3u);
      if (!v8) {
        break;
      }
      id v9 = v8;
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      __int128 v29 = 0u;
      CFMutableDictionaryRef v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"ConfigurationDescriptors"]);
      id v11 = [v10 countByEnumeratingWithState:&v26 objects:v32 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v27;
        while (2)
        {
          for (i = 0LL; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v27 != v12) {
              objc_enumerationMutation(v10);
            }
            uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v26 + 1) + 8 * (void)i),  "objectForKeyedSubscript:",  @"Interfaces",  v23));
            uint64_t v15 = (os_log_s *)qword_1000430D8;
            if (os_log_type_enabled((os_log_t)qword_1000430D8, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)uint64_t buf = 138543362;
              uint64_t v31 = v14;
              _os_log_debug_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "interfaces: %{public}@",  buf,  0xCu);
            }

            unsigned __int8 v16 = [v14 containsObject:@"AppleUSBNCMDataAux"];

            if ((v16 & 1) != 0)
            {
              int v17 = 1;
              goto LABEL_22;
            }
          }

          id v11 = [v10 countByEnumeratingWithState:&v26 objects:v32 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }

      int v17 = 0;
LABEL_22:

      CFRelease(v9);
      uint64_t v18 = (os_log_s *)qword_1000430D8;
      if (!v17) {
        goto LABEL_27;
      }
      if (os_log_type_enabled((os_log_t)qword_1000430D8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v32 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Not using the public NCM interface due to the existence of private NCM interface",  v32,  2u);
      }

LABEL_33:
      if ((_DWORD)v4)
      {
        if (IOObjectRelease(v4)) {
          sub_1000285EC(&v26, v32);
        }
      }

      uint64_t result = IOIteratorNext(iterator);
      uint64_t v4 = result;
      if (!(_DWORD)result) {
        return result;
      }
    }

    uint64_t v18 = (os_log_s *)qword_1000430D8;
    if (os_log_type_enabled((os_log_t)qword_1000430D8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "failed to find USB device for interface",  buf,  2u);
      uint64_t v18 = (os_log_s *)qword_1000430D8;
    }

  objc_autoreleasePoolPop(context);
}

LABEL_27:
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v32 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Using the public NCM interface", v32, 2u);
    }

LABEL_29:
    uint64_t v19 = objc_alloc(&OBJC_CLASS___RSDNCMInterface);
    __int128 v20 = -[RSDNCMInterface initWithService:notificationPort:queue:]( v19,  "initWithService:notificationPort:queue:",  v4,  a1,  qword_1000430D0);
    __int128 v21 = v20;
    if (v20)
    {
      -[RSDNCMInterface setIs_private:](v20, "setIs_private:", v7 == kCFCompareEqualTo);
      __int128 v22 = v21;
      -[RSDNCMInterface setInactive_callback:](v22, "setInactive_callback:", &stru_10003D360);
      -[RSDNCMInterface setAddressed_callback:](v22, "setAddressed_callback:", &stru_10003D380);
      -[RSDNCMInterface setDetached_callback:](v22, "setDetached_callback:", &stru_10003D3A0);

      if (-[RSDNCMInterface activate](v22, "activate")) {
        [(id)qword_1000430E0 addObject:v22];
      }
    }

    goto LABEL_33;
  }

  return result;
}

void sub_1000122E8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, unsigned int a17)
{
}

id sub_100012D38(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) state];
  if ((_DWORD)result != 5) {
    return [*(id *)(a1 + 32) createBonjourListener];
  }
  return result;
}

void sub_100012D74(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (os_log_s *)qword_1000430D8;
  BOOL v5 = os_log_type_enabled((os_log_t)qword_1000430D8, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v16 = 138543618;
    uint64_t v17 = v6;
    __int16 v18 = 2114;
    id v19 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}@> %{public}@ got incoming remoted connection",  (uint8_t *)&v16,  0x16u);
  }

  uint64_t v7 = qword_1000430D0;
  failsafe_uint64_t version_flags = xpc_remote_connection_get_failsafe_version_flags(v5);
  id v9 = (void *)xpc_remote_connection_create_with_nw_connection(v3, v7, failsafe_version_flags, 1LL);
  CFMutableDictionaryRef v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) connection]);

  if (v10)
  {
    id v11 = (os_log_s *)qword_1000430D8;
    if (os_log_type_enabled((os_log_t)qword_1000430D8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      int v16 = 138543362;
      uint64_t v17 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@> Canceling existing connection to replace it",  (uint8_t *)&v16,  0xCu);
    }

    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = *(void *)(v13 + 304);
    if (v14)
    {
      xpc_remote_connection_cancel(v14);
      uint64_t v13 = *(void *)(a1 + 32);
    }

    objc_storeStrong((id *)(v13 + 304), v9);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) connection]);
    xpc_remote_connection_cancel(v15);
  }

  else
  {
    [*(id *)(a1 + 32) connect:v9];
  }
}

void sub_100012F18(uint64_t a1, int a2, void *a3)
{
  BOOL v5 = a3;
  uint64_t v6 = v5;
  if (a2 == 3)
  {
    __int128 v22 = (os_log_s *)qword_1000430D8;
    if (os_log_type_enabled((os_log_t)qword_1000430D8, OS_LOG_TYPE_ERROR)) {
      sub_1000287DC(a1, (uint64_t)v6, v22);
    }
    nw_error_domain_t error_domain = nw_error_get_error_domain(v6);
    int error_code = nw_error_get_error_code(v6);
    if (error_domain == nw_error_domain_dns && (error_code == -65563 || error_code == -65568))
    {
      nw_listener_cancel(*(nw_listener_t *)(*(void *)(a1 + 32) + 312LL));
      dispatch_time_t v25 = dispatch_time(0LL, 5000000000LL);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100013238;
      block[3] = &unk_10003CF40;
      block[4] = *(void *)(a1 + 32);
      dispatch_after(v25, (dispatch_queue_t)qword_1000430D0, block);
    }
  }

  else if (a2 == 2)
  {
    uint64_t v7 = (void *)qword_1000430D8;
    if (os_log_type_enabled((os_log_t)qword_1000430D8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(v8 + 312);
      CFMutableDictionaryRef v10 = v7;
      id v11 = (void *)nw_listener_copy_local_endpoint(v9);
      *(_DWORD *)uint64_t buf = 138544130;
      uint64_t v29 = v8;
      __int16 v30 = 2112;
      uint64_t v31 = (uint64_t)v11;
      __int16 v32 = 1024;
      int v33 = 2;
      __int16 v34 = 2112;
      __int128 v35 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@> listening on %@ (state %u, error %@)",  buf,  0x26u);
    }

    int port = nw_listener_get_port(*(nw_listener_t *)(*(void *)(a1 + 32) + 312LL));
    if (port)
    {
      int v13 = port;
      uint64_t v14 = (os_log_s *)qword_1000430D8;
      if (os_log_type_enabled((os_log_t)qword_1000430D8, OS_LOG_TYPE_INFO))
      {
        uint64_t v15 = *(void *)(a1 + 32);
        *(_DWORD *)uint64_t buf = 138543618;
        uint64_t v29 = v15;
        __int16 v30 = 1024;
        LODWORD(v31) = v13;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%{public}@> listener port: %u", buf, 0x12u);
      }

      uint64_t v16 = nw_listener_copy_local_endpoint(*(void *)(*(void *)(a1 + 32) + 312LL));
      uint64_t v17 = (void *)v16;
      if (v16)
      {
        uint64_t description = nw_endpoint_get_description(v16);
        if (description)
        {
          uint64_t v19 = description;
          __int128 v20 = (os_log_s *)qword_1000430D8;
          if (os_log_type_enabled((os_log_t)qword_1000430D8, OS_LOG_TYPE_INFO))
          {
            uint64_t v21 = *(void *)(a1 + 32);
            *(_DWORD *)uint64_t buf = 138543618;
            uint64_t v29 = v21;
            __int16 v30 = 2080;
            uint64_t v31 = v19;
            _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "%{public}@> listener local endpoint: %s",  buf,  0x16u);
          }
        }
      }
    }
  }

  else if (v5)
  {
    __int128 v26 = (os_log_s *)qword_1000430D8;
    if (os_log_type_enabled((os_log_t)qword_1000430D8, OS_LOG_TYPE_ERROR)) {
      sub_100028768(a1, (uint64_t)v6, v26);
    }
  }
}

id sub_100013238(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) state];
  if ((_DWORD)result != 5) {
    return [*(id *)(a1 + 32) createBonjourListener];
  }
  return result;
}

void sub_100013274(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  uint64_t v6 = (os_log_s *)qword_1000430D8;
  if (os_log_type_enabled((os_log_t)qword_1000430D8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = "removed";
    int v9 = 138543874;
    if (a3) {
      uint64_t v8 = "added";
    }
    uint64_t v10 = v7;
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2080;
    uint64_t v14 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@> advertised endpoint %@ %s",  (uint8_t *)&v9,  0x20u);
  }
}

id sub_1000135DC(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) state];
  if ((_DWORD)result != 5) {
    return [*(id *)(a1 + 32) createPortListener];
  }
  return result;
}

uint64_t sub_100013618(uint64_t a1)
{
  unsigned int v16 = -1431655766;
  for (uint64_t result = sub_100018118(*(_DWORD *)(a1 + 40), 0LL, 0LL, (unsigned __int8 *)&xmmword_100030468, (int *)&v16);
        !(_DWORD)result;
        uint64_t result = sub_100018118(*(_DWORD *)(a1 + 40), 0LL, 0LL, (unsigned __int8 *)&xmmword_100030468, (int *)&v16))
  {
    id v3 = (os_log_s *)qword_1000430D8;
    BOOL v4 = os_log_type_enabled((os_log_t)qword_1000430D8, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)uint64_t buf = 138543362;
      uint64_t v18 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%{public}@> Got incoming remoted connection",  buf,  0xCu);
    }

    uint64_t v6 = v16;
    uint64_t v7 = qword_1000430D0;
    failsafe_uint64_t version_flags = xpc_remote_connection_get_failsafe_version_flags(v4);
    int v9 = (void *)xpc_remote_connection_create_with_connected_fd(v6, v7, failsafe_version_flags, 1LL);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) connection]);

    if (v10)
    {
      __int16 v11 = (os_log_s *)qword_1000430D8;
      if (os_log_type_enabled((os_log_t)qword_1000430D8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        *(_DWORD *)uint64_t buf = 138543362;
        uint64_t v18 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@> Canceling existing connection to replace it",  buf,  0xCu);
      }

      uint64_t v13 = *(void *)(a1 + 32);
      uint64_t v14 = *(void *)(v13 + 304);
      if (v14)
      {
        xpc_remote_connection_cancel(v14);
        uint64_t v13 = *(void *)(a1 + 32);
      }

      objc_storeStrong((id *)(v13 + 304), v9);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) connection]);
      xpc_remote_connection_cancel(v15);
    }

    else
    {
      [*(id *)(a1 + 32) connect:v9];
    }
  }

  return result;
}

uint64_t sub_100013810(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

uint64_t sub_10001386C(unsigned int *a1)
{
  uint64_t result = *a1;
  if ((_DWORD)result)
  {
    uint64_t result = IOObjectRelease(result);
    if ((_DWORD)result) {
      sub_1000288D0(&v2, v3);
    }
  }

  return result;
}

void sub_1000138D0(id a1, RSDNCMInterface *a2)
{
  BOOL v4 = a2;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[RSDNCMInterface device](v4, "device"));

  if (v2)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[RSDNCMInterface device](v4, "device"));
    [v3 disconnect];

    -[RSDNCMInterface setDevice:](v4, "setDevice:", 0LL);
  }
}

void sub_100013934(id a1, RSDNCMInterface *a2)
{
  uint64_t v7 = a2;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[RSDNCMInterface device](v7, "device"));

  if (v2)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[RSDNCMInterface device](v7, "device"));
    [v3 disconnect];

    -[RSDNCMInterface setDevice:](v7, "setDevice:", 0LL);
  }

  BOOL v4 = -[RSDRemoteNCMDeviceDevice initWithInterface:]( objc_alloc(&OBJC_CLASS___RSDRemoteNCMDeviceDevice),  "initWithInterface:",  v7);
  -[RSDNCMInterface setDevice:](v7, "setDevice:", v4);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[RSDNCMInterface device](v7, "device"));
  sub_10001E514(v5);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[RSDNCMInterface device](v7, "device"));
  [v6 attach];
}

void sub_1000139F0(id a1, RSDNCMInterface *a2)
{
  BOOL v4 = a2;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[RSDNCMInterface device](v4, "device"));

  if (v2)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[RSDNCMInterface device](v4, "device"));
    [v3 disconnect];

    -[RSDNCMInterface setDevice:](v4, "setDevice:", 0LL);
  }

  [(id)qword_1000430E0 removeObject:v4];
}

uint64_t sub_100013A64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return _os_log_send_and_compose_impl(a1, v6, v5, 80LL, a5, v7, 16LL);
}

void sub_100013A7C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

char *sub_100013A90(_xpc_connection_s *a1)
{
  id v3 = 0LL;
  pid_t pid = xpc_connection_get_pid(a1);
  asprintf(&v3, "pid/%d", pid);
  return v3;
}

const char *sub_100013AC8(uint64_t a1)
{
  else {
    return off_10003D408[a1 - 1];
  }
}

uint64_t sub_100013AF0(const char *a1)
{
  if (!strcmp(a1, "disabled")) {
    return 1LL;
  }
  if (!strcmp(a1, "optional")) {
    return 2LL;
  }
  if (!strcmp(a1, "required")) {
    return 3LL;
  }
  return 0LL;
}

uint64_t sub_100013B5C(void *a1, void *a2, void *a3)
{
  uint64_t v5 = a1;
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100043218 valueForKey:v7]);
  if (v8)
  {
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    {
      uint64_t v10 = sub_100013AF0((const char *)[v8 UTF8String]);
      if (v10)
      {
        uint64_t v11 = v10;
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          uint64_t v12 = off_10003D408[v11 - 1];
          LODWORD(buf[0]) = 136446466;
          *(void *)((char *)buf + 4) = v12;
          WORD6(buf[0]) = 2114;
          *(void *)((char *)buf + 14) = v7;
          _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "TLS is %{public}s per preference '%{public}@'",  (uint8_t *)buf,  0x16u);
        }

        uint64_t v13 = 0LL;
        goto LABEL_17;
      }

      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_1000289B8();
      }
    }
  }

  uint64_t v13 = (char *)calloc(0xBuLL, 1uLL);
  if (!v13)
  {
    uint64_t v24 = 0LL;
    memset(buf, 0, sizeof(buf));
    id v18 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      uint64_t v19 = 3LL;
    }
    else {
      uint64_t v19 = 2LL;
    }
    __int128 v20 = __error();
    uint64_t v21 = strerror(*v20);
    int v25 = 136315650;
    __int128 v26 = "known-constant allocation";
    __int16 v27 = 2048;
    uint64_t v28 = 1LL;
    __int16 v29 = 2080;
    __int16 v30 = v21;
    uint64_t v22 = _os_log_send_and_compose_impl(v19, &v24, buf, 80LL, &_mh_execute_header, &_os_log_default, 16LL);

    uint64_t v23 = _os_crash_msg(v24, v22);
    sub_100027430(v23);
  }

  id v14 = v6;
  if (!os_parse_boot_arg_string([v14 UTF8String], v13, 10))
  {
LABEL_16:
    uint64_t v11 = 0LL;
    goto LABEL_17;
  }

  uint64_t v15 = sub_100013AF0(v13);
  if (!v15)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100028958();
    }
    goto LABEL_16;
  }

  uint64_t v11 = v15;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    unsigned int v16 = off_10003D408[v11 - 1];
    LODWORD(buf[0]) = 136446466;
    *(void *)((char *)buf + 4) = v16;
    WORD6(buf[0]) = 2114;
    *(void *)((char *)buf + 14) = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "TLS is %{public}s per boot arg '%{public}@'",  (uint8_t *)buf,  0x16u);
  }

void sub_100013E84(_Unwind_Exception *a1)
{
}

void sub_100013EAC()
{
  unsigned int v0 = sub_100013EF8();
  id v1 = (id)objc_claimAutoreleasedReturnValue(v0);
  sub_100013ED8(v1);
}

void sub_100013ED8(id obj)
{
}

sec_identity *sub_100013EF8()
{
  CFErrorRef error = 0LL;
  v51[0] = kSecOidCommonName;
  v51[1] = @"remoted-identity";
  unsigned int v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v51, 2LL));
  uint64_t v52 = v0;
  id v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v52, 1LL));
  v53[0] = v1;
  v49[0] = kSecOidCountryName;
  v49[1] = @"US";
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v49, 2LL));
  uint64_t v50 = v2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v50, 1LL));
  v53[1] = v3;
  v47[0] = kSecOidOrganization;
  v47[1] = @"Apple Inc";
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v47, 2LL));
  uint64_t v48 = v4;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v48, 1LL));
  v53[2] = v5;
  int v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v53, 3LL));

  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v7 = kSecAttrAccessibleAlwaysThisDeviceOnlyPrivate;
  SecAccessControlRef v8 = SecAccessControlCreateWithFlags(0LL, kSecAttrAccessibleAlwaysThisDeviceOnlyPrivate, 0x40000000uLL, &error);
  SecAccessControlRef v9 = v8;
  if (v8)
  {
    v45[0] = kSecAttrIsPermanent;
    v45[1] = kSecAttrTokenID;
    v46[0] = &__kCFBooleanFalse;
    v46[1] = kSecAttrTokenIDAppleKeyStore;
    v45[2] = kSecAttrKeyType;
    v45[3] = kSecAttrAccessControl;
    v46[2] = kSecAttrKeyTypeECSECPrimeRandom;
    v46[3] = v8;
    v45[4] = kSecAttrKeySizeInBits;
    v46[4] = &off_10003E4F0;
    uint64_t v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v46,  v45,  5LL));
    uint64_t v11 = SecKeyCreateRandomKey(v10, &error);
    if (!v11)
    {
      if (os_log_type_enabled((os_log_t)qword_1000430F0, OS_LOG_TYPE_ERROR)) {
        sub_100028AB0();
      }

      id v32 = 0LL;
      id v18 = 0LL;
      goto LABEL_50;
    }

    __int16 v30 = v10;
    id v35 = 0LL;
    uint64_t v12 = MAECopyDCRTWithOptions(0LL, &v35);
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(v12);
    id v32 = v35;
    if (v31)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  v31,  @"1.2.840.113635.100.6.84");
      uint64_t v13 = (os_log_s *)qword_1000430F0;
      if (os_log_type_enabled((os_log_t)qword_1000430F0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "New self identity contains DCRT chain data.",  buf,  2u);
      }

      *(void *)uint64_t buf = 0LL;
      uint64_t v14 = SecKeyCopySystemKey(7LL, buf);
      uint64_t v15 = (const void *)v14;
      if (v14)
      {
        Attestation = (void *)SecKeyCreateAttestation(v14, v11, buf);
        if (!Attestation && os_log_type_enabled((os_log_t)qword_1000430F0, OS_LOG_TYPE_ERROR)) {
          sub_100028CE0();
        }
        id v17 = Attestation;
        CFRelease(v15);
      }

      else
      {
        if (os_log_type_enabled((os_log_t)qword_1000430F0, OS_LOG_TYPE_ERROR)) {
          sub_100028C80();
        }
        id v17 = 0LL;
      }

      if (*(void *)buf) {
        CFRelease(*(CFTypeRef *)buf);
      }
      if (v17)
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  v17,  @"1.2.840.113635.100.6.83");
        uint64_t v19 = (os_log_s *)qword_1000430F0;
        if (os_log_type_enabled((os_log_t)qword_1000430F0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "New self identity contains DAK attestation.",  buf,  2u);
        }

LABEL_30:
        SecKeyRef v20 = SecKeyCopyPublicKey(v11);
        uint64_t v43 = kSecCertificateExtensionsEncoded;
        id v21 = -[NSMutableDictionary copy](v6, "copy");
        id v44 = v21;
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v44,  &v43,  1LL));

        SelfSignedCertificate = (const void *)SecGenerateSelfSignedCertificate(v33, v22, v20, v11);
        if (!SelfSignedCertificate)
        {
          if (os_log_type_enabled((os_log_t)qword_1000430F0, OS_LOG_TYPE_ERROR)) {
            sub_100028B10();
          }

          id v18 = 0LL;
          goto LABEL_48;
        }

        uint64_t v24 = SecIdentityCreate(0LL, SelfSignedCertificate, v11);
        int v25 = (__SecIdentity *)v24;
        if (!v24)
        {
          if (os_log_type_enabled((os_log_t)qword_1000430F0, OS_LOG_TYPE_ERROR)) {
            sub_100028B3C();
          }

          id v18 = 0LL;
          goto LABEL_47;
        }

        v37[0] = kSecAttrLabel;
        v37[1] = kSecAttrAccessGroup;
        *(void *)uint64_t buf = @"com.apple.remoted.identity";
        __int128 v39 = @"com.apple.remoted";
        v37[2] = kSecClass;
        v37[3] = kSecValueRef;
        CFStringRef v40 = kSecClassIdentity;
        uint64_t v41 = v24;
        v37[4] = kSecAttrAccessible;
        uint64_t v42 = v7;
        attributes = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  buf,  v37,  5LL));
        if (SecItemAdd(attributes, 0LL))
        {
          if (os_log_type_enabled((os_log_t)qword_1000430F0, OS_LOG_TYPE_ERROR)) {
            sub_100028B94();
          }
        }

        else
        {
          sec_identity_t v26 = sec_identity_create(v25);
          __int16 v27 = (os_log_s *)qword_1000430F0;
          if (v26)
          {
            if (os_log_type_enabled((os_log_t)qword_1000430F0, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)__int16 v34 = 0;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Created new identity.", v34, 2u);
            }

            id v18 = v26;
            goto LABEL_46;
          }

          if (os_log_type_enabled((os_log_t)qword_1000430F0, OS_LOG_TYPE_ERROR)) {
            sub_100028B68();
          }
        }

        id v18 = 0LL;
LABEL_46:

        CFRelease(v25);
LABEL_47:
        CFRelease(SelfSignedCertificate);
LABEL_48:
        CFRelease(v11);
        if (v20) {
          CFRelease(v20);
        }
LABEL_50:
        CFRelease(v9);
        goto LABEL_51;
      }

      if (os_log_type_enabled((os_log_t)qword_1000430F0, OS_LOG_TYPE_ERROR)) {
        sub_100028C54();
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_1000430F0, OS_LOG_TYPE_ERROR))
    {
      sub_100028BF4();
    }

    id v17 = 0LL;
    goto LABEL_30;
  }

  if (os_log_type_enabled((os_log_t)qword_1000430F0, OS_LOG_TYPE_ERROR)) {
    sub_100028A50();
  }

  id v32 = 0LL;
  id v18 = 0LL;
LABEL_51:
  if (error) {
    CFRelease(error);
  }

  if (!v18
    && (os_variant_is_recovery("com.apple.remoted") & 1) == 0
    && os_log_type_enabled((os_log_t)qword_1000430F0, OS_LOG_TYPE_FAULT))
  {
    sub_100028A18();
  }

  return v18;
}

void sub_1000146CC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, CFTypeRef cf, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, CFTypeRef a23)
{
  if (v26) {
    CFRelease(v26);
  }
  CFRelease(v23);
  if (cf) {
    CFRelease(cf);
  }
  _Unwind_Resume(a1);
}

void sub_100014798()
{
}

void sub_1000147B0()
{
  v6[0] = kSecAttrLabel;
  v6[1] = kSecAttrAccessGroup;
  v7[0] = @"com.apple.remoted.identity";
  v7[1] = @"com.apple.remoted";
  v6[2] = kSecClass;
  v7[2] = kSecClassIdentity;
  unsigned int v0 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v7,  v6,  3LL));
  OSStatus v1 = SecItemDelete(v0);
  if (v1 == -25300 || v1 == 0)
  {
    id v3 = (os_log_s *)qword_1000430F0;
    if (os_log_type_enabled((os_log_t)qword_1000430F0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Deleted identity.", v5, 2u);
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_1000430F0, OS_LOG_TYPE_ERROR))
  {
    sub_100028D40();
  }
}

uint64_t sub_1000148FC()
{
  id v0 = sub_10001491C((void *)qword_1000430F8);
  return objc_claimAutoreleasedReturnValue(v0);
}

id sub_10001491C(void *a1)
{
  OSStatus v1 = a1;
  xpc_object_t empty = xpc_array_create_empty();
  SecCertificateRef certificateRef = 0LL;
  if (v1)
  {
    id v3 = sec_identity_copy_ref(v1);
    if (SecIdentityCopyCertificate(v3, &certificateRef))
    {
      if (os_log_type_enabled((os_log_t)qword_1000430F0, OS_LOG_TYPE_ERROR)) {
        sub_100028DA0();
      }
    }

    else
    {
      BOOL v4 = "1.2.840.113635.100.6.83";
      uint64_t v5 = off_10003D3F0;
      do
      {
        id v6 = (const void *)SecCertificateCopyExtensionValue( certificateRef,  +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v4),  0LL);
        if (v6)
        {
          xpc_array_set_string(empty, 0xFFFFFFFFFFFFFFFFLL, v4);
          CFRelease(v6);
        }

        uint64_t v7 = *v5++;
        BOOL v4 = v7;
      }

      while (v7);
    }
  }

  else
  {
    id v3 = 0LL;
  }

  id v8 = empty;
  if (certificateRef) {
    CFRelease(certificateRef);
  }
  if (v3) {
    CFRelease(v3);
  }

  return v8;
}

void sub_100014A48( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CFTypeRef cf)
{
  if (v10) {
    CFRelease(v10);
  }
  _Unwind_Resume(exception_object);
}

void sub_100014A94(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = (dispatch_queue_s *)qword_100043100;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100014B38;
  v8[3] = &unk_10003D3C8;
  id v9 = v3;
  id v10 = v4;
  id v6 = v4;
  id v7 = v3;
  dispatch_async(v5, v8);
}

void sub_100014B38(uint64_t a1)
{
  result[0] = 0LL;
  *(void *)&__int128 v24 = kSecAttrLabel;
  *((void *)&v24 + 1) = kSecAttrAccessGroup;
  v23[0] = @"com.apple.remoted.identity";
  v23[1] = @"com.apple.remoted";
  *(void *)&__int128 v25 = kSecClass;
  *((void *)&v25 + 1) = kSecReturnRef;
  v23[2] = kSecClassIdentity;
  v23[3] = &__kCFBooleanTrue;
  uint64_t v2 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v23,  &v24,  4LL));
  OSStatus v3 = SecItemCopyMatching(v2, result);
  if (v3 != -25300 && v3)
  {
    if (os_log_type_enabled((os_log_t)qword_1000430F0, OS_LOG_TYPE_ERROR)) {
      sub_100028E00();
    }
    sec_identity_t v4 = 0LL;
  }

  else
  {
    if (!result[0])
    {

LABEL_25:
      uint64_t v15 = sub_100013EF8();
      sec_identity_t v4 = (sec_identity_t)objc_claimAutoreleasedReturnValue(v15);
      goto LABEL_26;
    }

    sec_identity_t v4 = sec_identity_create((SecIdentityRef)result[0]);
  }

  if (result[0]) {
    CFRelease(result[0]);
  }

  if (!v4) {
    goto LABEL_25;
  }
  id v5 = *(id *)(a1 + 32);
  if (v5) {
    id v6 = v5;
  }
  else {
    id v6 = &__NSArray0__struct;
  }
  id v7 = sub_10001491C(v4);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  result[0] = _NSConcreteStackBlock;
  result[1] = (CFTypeRef)3221225472LL;
  result[2] = sub_100015C10;
  result[3] = &unk_10003CEF0;
  id v10 = v9;
  uint64_t v22 = v10;
  xpc_array_apply(v8, result);
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v11 = v6;
  id v12 = [v11 countByEnumeratingWithState:&v24 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v25;
    while (2)
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v11);
        }
        if (!-[NSMutableSet containsObject:]( v10,  "containsObject:",  *(void *)(*((void *)&v24 + 1) + 8LL * (void)i)))
        {

          goto LABEL_25;
        }
      }

      id v12 = [v11 countByEnumeratingWithState:&v24 objects:v23 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

LABEL_26:
  unsigned int v16 = (dispatch_queue_s *)qword_100043108;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100014E80;
  block[3] = &unk_10003D3C8;
  sec_identity_t v19 = v4;
  id v20 = *(id *)(a1 + 40);
  id v17 = v4;
  dispatch_async(v16, block);
}

void sub_100014E58( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_100014E80(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100014EBC(void *a1)
{
  id v8 = a1;
  objc_storeStrong((id *)&qword_100043108, a1);
  dispatch_queue_attr_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  OSStatus v3 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v2);
  dispatch_queue_t v4 = dispatch_queue_create("com.apple.remoted.identity", v3);
  id v5 = (void *)qword_100043100;
  qword_100043100 = (uint64_t)v4;

  if (!qword_1000430F0)
  {
    os_log_t v6 = os_log_create("com.apple.RemoteServiceDiscovery", "identity");
    id v7 = (void *)qword_1000430F0;
    qword_1000430F0 = (uint64_t)v6;
  }
}

id sub_100014F60()
{
  return (id)qword_1000430F8;
}

uint64_t sub_100014F6C(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  id v5 = [v4 type];
  os_log_t v6 = (void *)objc_opt_class(v4);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 tlsOidsRequiredOfPeer]);
  uint64_t v8 = sub_100014FE8((uint64_t)v5, v7, v3);

  return v8;
}

uint64_t sub_100014FE8(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  os_log_t v6 = sec_trust_copy_ref(v5);
  CFArrayRef v7 = SecTrustCopyCertificateChain(v6);
  CFArrayRef v8 = v7;
  if (v7)
  {
    id v9 = (__SecCertificate *)objc_claimAutoreleasedReturnValue(-[__CFArray lastObject](v7, "lastObject"));
    id v10 = v9;
    if (v9)
    {
      uint64_t v11 = sub_100015100((uint64_t)v9, v4, v9);
      CFRelease(v10);
      goto LABEL_9;
    }

    if (os_log_type_enabled((os_log_t)qword_1000430F0, OS_LOG_TYPE_ERROR)) {
      sub_100028E8C();
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_1000430F0, OS_LOG_TYPE_ERROR))
  {
    sub_100028E60();
  }

  uint64_t v11 = 0LL;
LABEL_9:

  if (v6) {
    CFRelease(v6);
  }

  return v11;
}

void sub_1000150D0(_Unwind_Exception *a1)
{
  if (v1) {
    CFRelease(v1);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_100015100(uint64_t a1, void *a2, __SecCertificate *a3)
{
  id v4 = a2;
  CFErrorRef error = 0LL;
  id v5 = SecCertificateCopyKey(a3);
  os_log_t v6 = v5;
  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)qword_1000430F0, OS_LOG_TYPE_ERROR)) {
      sub_100028EB8();
    }
    goto LABEL_33;
  }

  CFDataRef v7 = SecKeyCopyExternalRepresentation(v5, &error);
  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)qword_1000430F0, OS_LOG_TYPE_ERROR)) {
      sub_100028EE4();
    }
    goto LABEL_33;
  }

  CFArrayRef v8 = (void *)SecCertificateCopyExtensionValue(a3, @"1.2.840.113635.100.6.84", 0LL);
  if (!v8)
  {
    if (os_log_type_enabled((os_log_t)qword_1000430F0, OS_LOG_TYPE_ERROR)) {
      sub_100028F44();
    }

    goto LABEL_33;
  }

  id v9 = v8;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  *(_OWORD *)uint64_t buf = 0u;
  *(void *)id v35 = 0LL;
  id v10 = v9;
  id v11 = [v10 bytes];
  if (CTParseCertificateSet( (unint64_t)v11,  (unint64_t)[v10 length] + (void)v11,  buf,  3,  v35)
    || !*(void *)v35)
  {
    if (os_log_type_enabled((os_log_t)qword_1000430F0, OS_LOG_TYPE_ERROR)) {
      sub_100029080();
    }
    id v12 = 0LL;
    goto LABEL_21;
  }

  id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if (!v12)
  {
LABEL_21:
    id v16 = 0LL;
    goto LABEL_22;
  }

  if (*(void *)v35)
  {
    uint64_t v13 = 0LL;
    int v14 = 0;
    do
    {
      uint64_t v15 = (void *)SecCertificateCreateWithBytes(0LL, *(void *)&buf[16 * v13], *(void *)&buf[16 * v13 + 8]);
      -[NSMutableArray setObject:atIndexedSubscript:](v12, "setObject:atIndexedSubscript:", v15, v13);

      uint64_t v13 = ++v14;
    }

    while (*(void *)v35 > (unint64_t)v14);
  }

  id v16 = -[NSMutableArray copy](v12, "copy");
LABEL_22:

  if (!v16)
  {
    if (os_log_type_enabled((os_log_t)qword_1000430F0, OS_LOG_TYPE_ERROR)) {
      sub_100028F70();
    }

    goto LABEL_33;
  }

  id v17 = (void *)SecCertificateCopyExtensionValue(a3, @"1.2.840.113635.100.6.83", 0LL);
  if (!v17)
  {
    if (os_log_type_enabled((os_log_t)qword_1000430F0, OS_LOG_TYPE_ERROR)) {
      sub_100028F9C();
    }

LABEL_33:
    sec_identity_t v19 = 0LL;
LABEL_34:
    uint64_t v20 = 0LL;
    goto LABEL_35;
  }

  size_t v18 = aks_attest_context_size;
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      sec_identity_t v19 = calloc(1uLL, v18);
      if (v19) {
        break;
      }
      __os_temporary_resource_shortage();
    }
  }

  else
  {
    sec_identity_t v19 = calloc(1uLL, v18);
    if (!v19)
    {
      uint64_t v34 = 0LL;
      __int128 v43 = 0u;
      __int128 v44 = 0u;
      __int128 v41 = 0u;
      __int128 v42 = 0u;
      *(_OWORD *)uint64_t buf = 0u;
      id v27 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        uint64_t v28 = 3LL;
      }
      else {
        uint64_t v28 = 2LL;
      }
      __int16 v29 = __error();
      __int16 v30 = strerror(*v29);
      *(_DWORD *)id v35 = 136315650;
      *(void *)&v35[4] = "known-constant allocation";
      __int16 v36 = 2048;
      size_t v37 = v18;
      __int16 v38 = 2080;
      __int128 v39 = v30;
      uint64_t v31 = _os_log_send_and_compose_impl(v28, &v34, buf, 80LL, &_mh_execute_header, &_os_log_default, 16LL);

      uint64_t v32 = _os_crash_msg(v34, v31);
      sub_100027430(v32);
    }
  }

  id v22 = v17;
  if (aks_attest_context_init([v22 bytes], objc_msgSend(v22, "length"), v19))
  {
    if (os_log_type_enabled((os_log_t)qword_1000430F0, OS_LOG_TYPE_ERROR)) {
      sub_100029020();
    }
LABEL_59:

    goto LABEL_34;
  }

  uint64_t v23 = (os_log_s *)(id)qword_1000430F0;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(-[__CFData sha256](v7, "sha256"));
    __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v24 base64EncodedStringWithOptions:0]);
    *(_DWORD *)uint64_t buf = 138543362;
    *(void *)&uint8_t buf[4] = v25;
    _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Authenticating TLS peer with public key sha256: %{public}@",  buf,  0xCu);
  }

  if ([v4 containsObject:@"1.2.840.113635.100.6.84"]
    && (sub_1000157BC(v16) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)qword_1000430F0, OS_LOG_TYPE_ERROR)) {
      sub_100028FF4();
    }
    goto LABEL_59;
  }

  if ([v4 containsObject:@"1.2.840.113635.100.6.83"]
    && (sub_1000158E0(v7, v16, (uint64_t)v19) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)qword_1000430F0, OS_LOG_TYPE_ERROR)) {
      sub_100028FC8();
    }
    goto LABEL_59;
  }

  __int128 v26 = (os_log_s *)qword_1000430F0;
  if (os_log_type_enabled((os_log_t)qword_1000430F0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "TLS peer authenticated successfully.", buf, 2u);
  }

  uint64_t v20 = 1LL;
LABEL_35:
  free(v19);
  if (v6) {
    CFRelease(v6);
  }
  if (error) {
    CFRelease(error);
  }

  return v20;
}

void sub_1000156F8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, CFTypeRef cf)
{
  if (v11) {
    CFRelease(v11);
  }
  if (cf) {
    CFRelease(cf);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_100015754(void *a1, __SecCertificate *a2)
{
  id v3 = a1;
  [v3 type];
  id v4 = (void *)objc_opt_class(v3);

  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 tlsOidsRequiredOfPeer]);
  uint64_t v6 = sub_100015100((uint64_t)v5, v5, a2);

  return v6;
}

uint64_t sub_1000157BC(void *a1)
{
  id v1 = a1;
  dispatch_queue_attr_t v2 = (os_log_s *)qword_1000430F0;
  if (os_log_type_enabled((os_log_t)qword_1000430F0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "Verifying peer's DCRT chain against SCRT root CA...",  buf,  2u);
  }

  uint64_t v3 = 1LL;
  if ((sub_100015C90(v1, 1) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)qword_1000430F0, OS_LOG_TYPE_ERROR)) {
      sub_10002910C();
    }
    id v4 = (os_log_s *)qword_1000430F0;
    if (os_log_type_enabled((os_log_t)qword_1000430F0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Verifying peer's DCRT chain against UCRT root CA...",  v6,  2u);
    }

    if ((sub_100015C90(v1, 0) & 1) != 0)
    {
      uint64_t v3 = 1LL;
    }

    else
    {
      if (os_log_type_enabled((os_log_t)qword_1000430F0, OS_LOG_TYPE_ERROR)) {
        sub_1000290E0();
      }
      uint64_t v3 = 0LL;
    }
  }

  return v3;
}

uint64_t sub_1000158E0(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  CFTypeRef cf = 0LL;
  CFDataRef v7 = (__SecCertificate *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:0]);
  CFArrayRef v8 = v7;
  if (v7)
  {
    id v9 = SecCertificateCopyKey(v7);
    id v10 = v9;
    if (!v9)
    {
      if (os_log_type_enabled((os_log_t)qword_1000430F0, OS_LOG_TYPE_ERROR)) {
        sub_100029164();
      }
      uint64_t v14 = 0LL;
      goto LABEL_19;
    }

    CFDataRef v11 = SecKeyCopyExternalRepresentation(v9, (CFErrorRef *)&cf);
    id v12 = (os_log_s *)qword_1000430F0;
    if (!v11)
    {
      if (os_log_type_enabled((os_log_t)qword_1000430F0, OS_LOG_TYPE_ERROR)) {
        sub_100029190();
      }
      goto LABEL_17;
    }

    if (os_log_type_enabled((os_log_t)qword_1000430F0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Verifying peer's DAK attestation...",  buf,  2u);
    }

    uint64_t v13 = v11;
    if (aks_attest_context_verify(a3, -[__CFData bytes](v13, "bytes"), -[__CFData length](v13, "length")))
    {
      if (os_log_type_enabled((os_log_t)qword_1000430F0, OS_LOG_TYPE_ERROR)) {
        sub_100029310();
      }
LABEL_17:
      uint64_t v14 = 0LL;
      uint64_t v15 = 0LL;
LABEL_18:

      CFRelease(v10);
LABEL_19:
      CFRelease(v8);
      goto LABEL_20;
    }

    uint64_t v30 = 0LL;
    *(void *)uint64_t buf = 0LL;
    if (!aks_attest_context_get(a3, 1LL, buf, &v30) && *(void *)buf && v30)
    {
      id v17 = objc_alloc(&OBJC_CLASS___NSData);
      size_t v18 = -[NSData initWithBytes:length:](v17, "initWithBytes:length:", *(void *)buf, v30);
      if (v18)
      {
        sec_identity_t v19 = v18;

        char v20 = 1;
        goto LABEL_33;
      }

      if (os_log_type_enabled((os_log_t)qword_1000430F0, OS_LOG_TYPE_ERROR)) {
        sub_100029284();
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_1000430F0, OS_LOG_TYPE_ERROR))
    {
      sub_1000292B0();
    }

    sec_identity_t v19 = 0LL;
    char v20 = 0;
LABEL_33:
    uint64_t v15 = v19;
    if ((v20 & 1) != 0)
    {
      if ([v5 isEqual:v15])
      {
        uint64_t v14 = 1LL;
        goto LABEL_18;
      }

      if (os_log_type_enabled((os_log_t)qword_1000430F0, OS_LOG_TYPE_ERROR)) {
        sub_1000291F0();
      }
    }

    else
    {
      id v21 = (os_log_s *)qword_1000430F0;
      if (os_log_type_enabled((os_log_t)qword_1000430F0, OS_LOG_TYPE_ERROR)) {
        sub_10002921C(v21, v22, v23, v24, v25, v26, v27, v28);
      }
    }

    uint64_t v14 = 0LL;
    goto LABEL_18;
  }

  if (os_log_type_enabled((os_log_t)qword_1000430F0, OS_LOG_TYPE_ERROR)) {
    sub_100029138();
  }
  uint64_t v14 = 0LL;
LABEL_20:
  if (cf) {
    CFRelease(cf);
  }

  return v14;
}

void sub_100015BCC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_100015C10(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (xpc_get_type(v4) == (xpc_type_t)&_xpc_type_string)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_string_get_string_ptr(v4));
    CFDataRef v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    [v5 addObject:v7];
  }

  return 1LL;
}

uint64_t sub_100015C90(void *a1, int a2)
{
  id v3 = a1;
  CFTypeRef cf = 0LL;
  SecTrustRef trust = 0LL;
  id v4 = [v3 mutableCopy];
  SecTrustResultType result = kSecTrustResultInvalid;
  if (a2)
  {
    id v5 = objc_alloc(&OBJC_CLASS___NSData);
    id v6 = -[NSData initWithBytes:length:](v5, "initWithBytes:length:", aBeginCertifica, dword_100042FF0);
    if (!v6)
    {
      if (os_log_type_enabled((os_log_t)qword_1000430F0, OS_LOG_TYPE_ERROR)) {
        sub_100029370();
      }
      goto LABEL_23;
    }

    uint64_t AppleBasicAttestationSystem = SecPolicyCreateAppleBasicAttestationSystem(0LL);
    if (!AppleBasicAttestationSystem)
    {
      if (os_log_type_enabled((os_log_t)qword_1000430F0, OS_LOG_TYPE_ERROR)) {
        sub_10002939C();
      }
LABEL_22:

LABEL_23:
      id v9 = 0LL;
LABEL_24:

      uint64_t v11 = 0LL;
      goto LABEL_30;
    }
  }

  else
  {
    CFArrayRef v8 = objc_alloc(&OBJC_CLASS___NSData);
    id v6 = -[NSData initWithBytes:length:](v8, "initWithBytes:length:", aBeginCertifica_0, dword_100042CCC);
    if (!v6)
    {
      if (os_log_type_enabled((os_log_t)qword_1000430F0, OS_LOG_TYPE_ERROR)) {
        sub_100029574();
      }
      goto LABEL_23;
    }

    uint64_t AppleBasicAttestationSystem = SecPolicyCreateAppleBasicAttestationUser(0LL);
    if (!AppleBasicAttestationSystem)
    {
      if (os_log_type_enabled((os_log_t)qword_1000430F0, OS_LOG_TYPE_ERROR)) {
        sub_1000295A0();
      }
      goto LABEL_22;
    }
  }

  id v9 = (const void *)AppleBasicAttestationSystem;
  id v10 = (const void *)SecCertificateCreateWithPEM(0LL, v6);
  if (!v10)
  {
    if (os_log_type_enabled((os_log_t)qword_1000430F0, OS_LOG_TYPE_ERROR)) {
      sub_1000293C8();
    }

    goto LABEL_24;
  }

  [v4 addObject:v10];
  if (SecTrustCreateWithCertificates(v4, v9, &trust))
  {
    if (os_log_type_enabled((os_log_t)qword_1000430F0, OS_LOG_TYPE_ERROR)) {
      sub_100029514();
    }
  }

  else
  {
    sec_identity_t v19 = v10;
    if (!SecTrustSetAnchorCertificates( trust,  (CFArrayRef)+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v19, 1LL)))
    {
      if (!SecTrustEvaluateWithError(trust, (CFErrorRef *)&cf))
      {
        if (SecTrustGetTrustResult(trust, &result))
        {
          if (os_log_type_enabled((os_log_t)qword_1000430F0, OS_LOG_TYPE_ERROR)) {
            sub_100029454();
          }
          goto LABEL_28;
        }

        if (result != kSecTrustResultRecoverableTrustFailure || !SecTrustIsExpiredOnly(trust))
        {
          if (os_log_type_enabled((os_log_t)qword_1000430F0, OS_LOG_TYPE_ERROR)) {
            sub_1000293F4();
          }
          goto LABEL_28;
        }

        uint64_t v14 = (os_log_s *)qword_1000430F0;
        if (os_log_type_enabled((os_log_t)qword_1000430F0, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)uint64_t v15 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "Ignoring past-due expiration date on DCRT.",  v15,  2u);
        }
      }

      uint64_t v13 = (os_log_s *)qword_1000430F0;
      uint64_t v11 = 1LL;
      if (os_log_type_enabled((os_log_t)qword_1000430F0, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v15 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Peer's DCRT passed trust evaluation.",  v15,  2u);
      }

      goto LABEL_29;
    }

    if (os_log_type_enabled((os_log_t)qword_1000430F0, OS_LOG_TYPE_ERROR)) {
      sub_1000294B4();
    }
  }

LABEL_28:
  uint64_t v11 = 0LL;
LABEL_29:

  CFRelease(v10);
LABEL_30:
  if (cf) {
    CFRelease(cf);
  }
  if (trust) {
    CFRelease(trust);
  }
  if (v9) {
    CFRelease(v9);
  }

  return v11;
}

    uint64_t v28 = sub_100013A90(v3);
    __int16 v29 = (os_log_s *)qword_100043198;
    if (os_log_type_enabled((os_log_t)qword_100043198, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 67109378;
      __int128 v43 = uint64;
      __int128 v44 = 2080;
      uint64_t v45 = v28;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "device_get_unique: Unable to find device with type %d (client=%s)",  buf,  0x12u);
    }

    free(v28);
    uint64_t v30 = sub_100005054(v4, "ERROR");
    xpc_object_t reply = (xpc_object_t)objc_claimAutoreleasedReturnValue(v30);
    goto LABEL_31;
  }

  id v12 = (os_log_s *)qword_100043198;
  if (os_log_type_enabled((os_log_t)qword_100043198, OS_LOG_TYPE_ERROR)) {
    sub_10002AFB4(v11 != 0LL, 0, v12);
  }
  uint64_t v13 = sub_100005054(v4, "ERROR");
  uint64_t v14 = objc_claimAutoreleasedReturnValue(v13);
LABEL_15:
  xpc_object_t reply = (xpc_object_t)v14;
LABEL_32:

  return reply;
}

          __break(0x5519u);
        }

        uint64_t v11 = 0xAAAAAAAAAAAAAAAALL;
        id v12 = 0xAAAAAAAAAAAAAAAALL;
        if (v8 > v9 || v9 > v14) {
          goto LABEL_28;
        }
        uint64_t v11 = v9;
        id v12 = v14;
        SecTrustResultType result = ccder_blob_decode_tl(&v11, 5LL, &v15);
        if (!(_DWORD)result) {
          return result;
        }
        if (v11 != v14) {
          return 0LL;
        }
        if (!__CFADD__(v11, v15))
        {
          id v10 = v11 + v15;
          if (v11 + v15 <= a1[1] && *a1 <= v10)
          {
            *a1 = v10;
            return 1LL;
          }

          goto LABEL_28;
        }
      }
    }

    __break(0x5513u);
  }

  return result;
}

void sub_100016068( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, CFTypeRef cf, CFTypeRef a12)
{
  if (cf) {
    CFRelease(cf);
  }
  if (a12) {
    CFRelease(a12);
  }
  if (v12) {
    CFRelease(v12);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000160D8( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_1000166D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((_DWORD)a3)
  {
    id v5 = (os_log_s *)qword_100043110;
    if (os_log_type_enabled((os_log_t)qword_100043110, OS_LOG_TYPE_ERROR)) {
      sub_100027E7C(a1, a3, v5);
    }
    [*(id *)(a1 + 32) connect:0];
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) connection]);

    CFDataRef v7 = (os_log_s *)qword_100043110;
    BOOL v8 = os_log_type_enabled((os_log_t)qword_100043110, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        uint64_t v9 = *(void *)(a1 + 32);
        int v15 = 138543362;
        uint64_t v16 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@> pollConnect completed, but socket is not needed anymore, closing",  (uint8_t *)&v15,  0xCu);
      }

      close(*(_DWORD *)(a1 + 40));
    }

    else
    {
      if (v8)
      {
        uint64_t v10 = *(void *)(a1 + 32);
        int v15 = 138543362;
        uint64_t v16 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@> pollConnect completed, socket is connected",  (uint8_t *)&v15,  0xCu);
      }

      uint64_t v11 = *(unsigned int *)(a1 + 40);
      uint64_t v12 = qword_100043120;
      failsafe_uint64_t version_flags = xpc_remote_connection_get_failsafe_version_flags(v8);
      uint64_t v14 = (void *)xpc_remote_connection_create_with_connected_fd(v11, v12, failsafe_version_flags, 0LL);
      [*(id *)(a1 + 32) connect:v14];
    }
  }

void sub_100016888(void *a1)
{
  id v2 = a1;
  if (!qword_100043120)
  {
    os_log_t v3 = os_log_create("com.apple.RemoteServiceDiscovery", "network_peer");
    id v4 = (void *)qword_100043110;
    qword_100043110 = (uint64_t)v3;

    id v5 = (os_log_s *)qword_100043110;
    if (os_log_type_enabled((os_log_t)qword_100043110, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "initializing network peer device", v8, 2u);
    }

    objc_storeStrong((id *)&qword_100043120, a1);
    id v6 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    CFDataRef v7 = (void *)qword_100043118;
    qword_100043118 = (uint64_t)v6;
  }
}

BOOL sub_100016958(const char *a1)
{
  id v2 = (id)qword_100043120;
  if (!v2) {
    sub_100029658(handler, buf);
  }

  os_log_t v3 = (os_log_s *)qword_100043110;
  if (os_log_type_enabled((os_log_t)qword_100043110, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "enabling network peer", buf, 2u);
  }

  if (a1)
  {
    if (qword_100043128)
    {
      BOOL result = os_log_type_enabled((os_log_t)qword_100043110, OS_LOG_TYPE_ERROR);
      if (result)
      {
        sub_100029890();
        return 0LL;
      }
    }

    else
    {
      uint64_t v5 = if_nametoindex(a1);
      if ((_DWORD)v5)
      {
        uint64_t v6 = v5;
        if (sub_100017DA8(a1, &qword_100043130, 0))
        {
          BOOL result = os_log_type_enabled((os_log_t)qword_100043110, OS_LOG_TYPE_ERROR);
          if (result)
          {
            sub_100029830();
            return 0LL;
          }
        }

        else
        {
          BOOL v8 = (os_log_s *)qword_100043110;
          if (os_log_type_enabled((os_log_t)qword_100043110, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)uint64_t buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "create peer listener start", buf, 2u);
          }

          __int16 handle_6 = -6663;
          int handle = -1;
          int v9 = sub_100017998(&handle, (__n128 *)&qword_100043130, &handle_6, v6, (uint64_t)&unk_10003047C);
          if (v9)
          {
            int v10 = v9;
            uint64_t v11 = (os_log_s *)qword_100043110;
            if (os_log_type_enabled((os_log_t)qword_100043110, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)uint64_t buf = 67109120;
              *(_DWORD *)&uint8_t buf[4] = v10;
              _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Unable to start remoted listener: %{darwin.errno}d",  buf,  8u);
              uint64_t v11 = (os_log_s *)qword_100043110;
            }

            BOOL result = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
            if (result)
            {
              sub_1000297D0();
              return 0LL;
            }
          }

          else
          {
            if ((id)qword_100043140) {
              sub_10002975C(&v22, buf);
            }
            dispatch_source_t v12 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_read,  handle,  0LL,  (dispatch_queue_t)qword_100043120);
            uint64_t v13 = (void *)qword_100043140;
            qword_100043140 = (uint64_t)v12;

            handler[0] = _NSConcreteStackBlock;
            handler[1] = 3221225472LL;
            handler[2] = sub_1000172C4;
            handler[3] = &unk_10003D340;
            int v21 = handle;
            dispatch_source_set_event_handler((dispatch_source_t)qword_100043140, handler);
            v18[0] = _NSConcreteStackBlock;
            v18[1] = 3221225472LL;
            v18[2] = sub_100017438;
            v18[3] = &unk_10003D340;
            int v19 = handle;
            dispatch_source_set_mandatory_cancel_handler(qword_100043140, v18);
            dispatch_activate((dispatch_object_t)qword_100043140);
            uint64_t v14 = (os_log_s *)qword_100043110;
            if (os_log_type_enabled((os_log_t)qword_100043110, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)uint64_t buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "create peer listener done", buf, 2u);
            }

            int v15 = objc_alloc_init(&OBJC_CLASS___RSDNCMInterface);
            uint64_t v16 = (void *)qword_100043128;
            qword_100043128 = (uint64_t)v15;

            [(id)qword_100043128 setIndex:v6];
            [(id)qword_100043128 setName:strdup(a1)];
            id v17 = (os_log_s *)qword_100043110;
            if (os_log_type_enabled((os_log_t)qword_100043110, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)uint64_t buf = 136446210;
              *(void *)&uint8_t buf[4] = a1;
              _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "network peer enabled on %{public}s",  buf,  0xCu);
            }

            return 1LL;
          }
        }
      }

      else
      {
        CFDataRef v7 = (os_log_s *)qword_100043110;
        BOOL result = os_log_type_enabled((os_log_t)qword_100043110, OS_LOG_TYPE_ERROR);
        if (result)
        {
          sub_1000296EC((uint64_t)a1, v7);
          return 0LL;
        }
      }
    }
  }

  else
  {
    BOOL result = os_log_type_enabled((os_log_t)qword_100043110, OS_LOG_TYPE_ERROR);
    if (result)
    {
      sub_1000296C0();
      return 0LL;
    }
  }

  return result;
}

void sub_100016D48()
{
  id v0 = (id)qword_100043120;
  if (!v0) {
    sub_100029658(&v17, buf);
  }

  id v1 = (os_log_s *)qword_100043110;
  if (os_log_type_enabled((os_log_t)qword_100043110, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "disabling network peer", buf, 2u);
  }

  if (qword_100043128)
  {
    id v2 = (id)qword_100043140;
    if (!v2) {
      sub_1000298E8(&v17, buf);
    }

    dispatch_source_cancel((dispatch_source_t)qword_100043140);
    os_log_t v3 = (void *)qword_100043140;
    qword_100043140 = 0LL;

    id v4 = (void *)qword_100043128;
    qword_100043128 = 0LL;

    if (os_log_type_enabled((os_log_t)qword_100043110, OS_LOG_TYPE_DEBUG)) {
      sub_100029950();
    }
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    id v5 = [(id)qword_100043118 copy];
    id v6 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          int v10 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
          if ([v10 state] == 3)
          {
            v12[0] = _NSConcreteStackBlock;
            v12[1] = 3221225472LL;
            v12[2] = sub_100016FD8;
            v12[3] = &unk_10003D450;
            v12[4] = v10;
            [v10 goodByeWithCallback:v12];
          }

          else
          {
            [v10 disconnect];
          }
        }

        id v7 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }

      while (v7);
    }

    qword_100043130 = 0LL;
    *(void *)algn_100043138 = 0LL;
    uint64_t v11 = (os_log_s *)qword_100043110;
    if (os_log_type_enabled((os_log_t)qword_100043110, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "network peer disabled", buf, 2u);
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_100043110, OS_LOG_TYPE_ERROR))
  {
    sub_1000298BC();
  }

id sub_100016FD8(uint64_t a1, int a2)
{
  if (a2 && os_log_type_enabled((os_log_t)qword_100043110, OS_LOG_TYPE_ERROR)) {
    sub_100029988();
  }
  return [*(id *)(a1 + 32) disconnect];
}

BOOL sub_100017034(void *a1)
{
  id v2 = (id)qword_100043120;
  if (!v2) {
    sub_100029658(&v9, v10);
  }

  if (!qword_100043128)
  {
    BOOL result = os_log_type_enabled((os_log_t)qword_100043110, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    sub_1000299E8();
    return 0LL;
  }

  id v3 = sub_100017168(a1);
  uint64_t v4 = objc_claimAutoreleasedReturnValue(v3);
  if (v4)
  {
    id v5 = (void *)v4;
    if (os_log_type_enabled((os_log_t)qword_100043110, OS_LOG_TYPE_ERROR)) {
      sub_100029A40();
    }

    return 0LL;
  }

  id v7 = -[RSDRemoteNetworkPeerDevice initClientWithRemoteAddress:]( objc_alloc(&OBJC_CLASS___RSDRemoteNetworkPeerDevice),  "initClientWithRemoteAddress:",  a1);
  if (v7)
  {
    uint64_t v8 = v7;
    [v7 attach];

    return 1LL;
  }

  BOOL result = os_log_type_enabled((os_log_t)qword_100043110, OS_LOG_TYPE_ERROR);
  if (result)
  {
    sub_100029A14();
    return 0LL;
  }

  return result;
}

id sub_100017168(void *a1)
{
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v2 = (id)qword_100043118;
  id v3 = [v2 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v3)
  {
    id v4 = v3;
    int v5 = 0;
    id v6 = 0LL;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v2);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        int v10 = objc_msgSend(v9, "remote_address");
        if (*v10 == *a1 && v10[1] == a1[1])
        {
          id v12 = v9;

          ++v5;
          id v6 = v12;
        }
      }

      id v4 = [v2 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }

    while (v4);

    if (v6 && v5 >= 2) {
      sub_100029A6C(&v14, v19);
    }
  }

  else
  {

    id v6 = 0LL;
  }

  return v6;
}

uint64_t sub_1000172C4(uint64_t a1)
{
  int v17 = 0;
  unsigned int v18 = -1431655766;
  *(void *)&v15.sa_len = 0LL;
  *(void *)&v15.sa_data[6] = 0LL;
  uint64_t v16 = 0LL;
  socklen_t v14 = 28;
  for (uint64_t result = sub_100018118(*(_DWORD *)(a1 + 32), &v15, &v14, (unsigned __int8 *)&xmmword_100030468, (int *)&v18);
        !(_DWORD)result;
        uint64_t result = sub_100018118(*(_DWORD *)(a1 + 32), &v15, &v14, (unsigned __int8 *)&xmmword_100030468, (int *)&v18))
  {
    id v3 = (os_log_s *)qword_100043110;
    if (os_log_type_enabled((os_log_t)qword_100043110, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Got incoming remoted connection", buf, 2u);
    }

    id v4 = sub_100017168(&v15.sa_data[6]);
    int v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    id v6 = v5;
    if (v5)
    {
      [v5 serverReplacePeerSocket:v18];
    }

    else
    {
      uint64_t v7 = objc_alloc(&OBJC_CLASS___RSDRemoteNetworkPeerDevice);
      id v8 = -[RSDRemoteNetworkPeerDevice initServerWithPeerSocket:](v7, "initServerWithPeerSocket:", v18);
      if (v8)
      {
        uint64_t v9 = v8;
        [v8 attach];
      }

      else
      {
        int v10 = (os_log_s *)qword_100043110;
        if (os_log_type_enabled((os_log_t)qword_100043110, OS_LOG_TYPE_ERROR)) {
          sub_100029AF4(&v11, v12, v10);
        }
      }
    }
  }

  return result;
}

uint64_t sub_100017438(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

double sub_100017440(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  double result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

uint64_t sub_100017464(int *a1, __n128 *a2, unsigned int a3, int a4, uint64_t a5)
{
  if (!a1 || !a2 || !a3)
  {
    id v18 = sub_100017728();
    int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t buf = 134218496;
      *(void *)__int16 v29 = a1;
      *(_WORD *)&v29[8] = 2048;
      uint64_t v30 = a2;
      *(_WORD *)uint64_t v31 = 1024;
      *(_DWORD *)&v31[2] = a3;
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "invalid fd %p, addr %p or port %d",  buf,  0x1Cu);
    }

    goto LABEL_11;
  }

  if (a2->n128_u8[0] == 254 && !a4 && (a2->n128_u8[1] & 0xC0) == 0x80)
  {
    id v9 = sub_100017728();
    int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100029C7C(v10, v11, v12, v13, v14, v15, v16, v17);
    }
LABEL_11:
    uint64_t v19 = 22LL;
    goto LABEL_15;
  }

  uint64_t v20 = sub_100017768(a1, a4, a5);
  if ((_DWORD)v20)
  {
    uint64_t v19 = v20;
    id v21 = sub_100017728();
    int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100029C1C();
    }
  }

  else
  {
    sub_10001791C((uint64_t)v27, a2, a3, a4);
    id v23 = sub_100017728();
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t buf = 67110402;
      *(_DWORD *)__int16 v29 = v27[0].sa_len;
      *(_WORD *)&v29[4] = 1024;
      *(_DWORD *)&v29[6] = v27[0].sa_family;
      LOWORD(v30) = 1024;
      *(_DWORD *)((char *)&v30 + 2) = bswap32(*(unsigned __int16 *)v27[0].sa_data) >> 16;
      HIWORD(v30) = 1024;
      *(_DWORD *)uint64_t v31 = *(_DWORD *)&v27[1].sa_data[6];
      *(_WORD *)&v31[4] = 1040;
      int v32 = 16;
      __int16 v33 = 2096;
      uint64_t v34 = &v27[0].sa_data[6];
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "sockaddr_in6 { len: %d, family: %d, port: %d, scope_id: %d, addr: %{network:in6_addr}.16P }",  buf,  0x2Au);
    }

    if (*a1 < 0) {
      sub_100029BB4(&v26, buf);
    }
    if (!connect(*a1, v27, 0x1Cu) || *__error() == 36) {
      return 0LL;
    }
    uint64_t v19 = *__error();
    id v25 = sub_100017728();
    int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100029B30(a1, v19, v10);
    }
  }

id sub_100017728()
{
  if (qword_100043150 != -1) {
    dispatch_once(&qword_100043150, &stru_10003D470);
  }
  return (id)qword_100043148;
}

uint64_t sub_100017768(int *a1, int a2, uint64_t a3)
{
  int v15 = a2;
  *a1 = socket(30, 1, 0);
  id v6 = sub_100017728();
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100029DCC(a1, v7);
  }

  if (*a1 == -1)
  {
    a3 = *__error();
    id v12 = sub_100017728();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100029CAC();
    }
LABEL_16:

    if ((_DWORD)a3)
    {
LABEL_17:
      close_drop_optional_np(a1, 0LL);
      return a3;
    }

    return a3;
  }

  if (fcntl(*a1, 4, 4LL) == -1) {
    sub_100025944(&v14, v16);
  }
  if (a2 && setsockopt(*a1, 41, 125, &v15, 4u))
  {
    a3 = *__error();
    id v8 = sub_100017728();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100029D6C();
    }
    goto LABEL_16;
  }

  if (a3)
  {
    a3 = sub_1000181F0(*a1, (unsigned __int8 *)a3);
    if ((_DWORD)a3)
    {
      id v10 = sub_100017728();
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100029D0C();
      }

      goto LABEL_17;
    }
  }

  return a3;
}

__n128 sub_10001791C(uint64_t a1, __n128 *a2, unsigned int a3, int a4)
{
  if (!a1) {
    sub_100029E64(&v5, v6);
  }
  *(void *)a1 = 0LL;
  *(void *)(a1 + _Block_object_dispose(va, 8) = 0LL;
  *(_DWORD *)(a1 + 24) = 0;
  *(void *)(a1 + 16) = 0LL;
  *(_WORD *)a1 = 7708;
  *(_WORD *)(a1 + 2) = __rev16(a3);
  __n128 result = *a2;
  *(__n128 *)(a1 + _Block_object_dispose(va, 8) = *a2;
  *(_DWORD *)(a1 + 24) = a4;
  return result;
}

uint64_t sub_100017998(int *a1, __n128 *a2, _WORD *a3, int a4, uint64_t a5)
{
  if (!a1 || !a2 || !a3)
  {
    id v18 = sub_100017728();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t buf = 134218496;
      *(void *)__int16 v36 = a1;
      *(_WORD *)&v36[8] = 2048;
      *(void *)&v36[10] = a2;
      *(_WORD *)&v36[18] = 2048;
      *(void *)&v36[20] = a3;
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "invalid fd %p, addr %p or port %p",  buf,  0x20u);
    }

    goto LABEL_11;
  }

  if (a2->n128_u8[0] == 254 && !a4 && (a2->n128_u8[1] & 0xC0) == 0x80)
  {
    id v9 = sub_100017728();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100029C7C(v10, v11, v12, v13, v14, v15, v16, v17);
    }
LABEL_11:
    uint64_t v19 = 22LL;
LABEL_15:

    if (a1 && (_DWORD)v19) {
      close_drop_optional_np(a1, 0LL);
    }
    return v19;
  }

  memset(v34, 170, 28);
  uint64_t v20 = sub_100017768(a1, a4, a5);
  if ((_DWORD)v20)
  {
    uint64_t v19 = v20;
    id v21 = sub_100017728();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100029C1C();
    }
    goto LABEL_15;
  }

  int v33 = 1;
  if (setsockopt(*a1, 0xFFFF, 4, &v33, 4u) < 0)
  {
    uint64_t v19 = *__error();
    id v28 = sub_100017728();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100029ECC();
    }
    goto LABEL_15;
  }

  sub_10001791C((uint64_t)v34, a2, (unsigned __int16)*a3, a4);
  id v23 = sub_100017728();
  uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t buf = 67110402;
    *(_DWORD *)__int16 v36 = v34[0].sa_len;
    *(_WORD *)&v36[4] = 1024;
    *(_DWORD *)&v36[6] = v34[0].sa_family;
    *(_WORD *)&v36[10] = 1024;
    *(_DWORD *)&v36[12] = bswap32(*(unsigned __int16 *)v34[0].sa_data) >> 16;
    *(_WORD *)&v36[16] = 1024;
    *(_DWORD *)&v36[18] = *(_DWORD *)&v34[1].sa_data[6];
    *(_WORD *)&v36[22] = 1040;
    *(_DWORD *)&v36[24] = 16;
    __int16 v37 = 2096;
    __int16 v38 = &v34[0].sa_data[6];
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "sockaddr_in6 { len: %d, family: %d, port: %d, scope_id: %d, addr: %{network:in6_addr}.16P }",  buf,  0x2Au);
  }

  if (bind(*a1, v34, 0x1Cu) == -1)
  {
    uint64_t v19 = *__error();
    id v29 = sub_100017728();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100029F2C();
    }
    goto LABEL_15;
  }

  if (listen(*a1, 128) == -1)
  {
    uint64_t v19 = *__error();
    id v30 = sub_100017728();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100029F8C();
    }
    goto LABEL_15;
  }

  socklen_t v32 = 28;
  if (getsockname(*a1, v34, &v32) == -1)
  {
    uint64_t v19 = *__error();
    id v31 = sub_100017728();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100029FEC();
    }
    goto LABEL_15;
  }

  *a3 = bswap32(*(unsigned __int16 *)v34[0].sa_data) >> 16;
  id v25 = sub_100017728();
  uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    int v27 = (unsigned __int16)*a3;
    *(_DWORD *)uint64_t buf = 68158466;
    *(_DWORD *)__int16 v36 = 16;
    *(_WORD *)&v36[4] = 2096;
    *(void *)&v36[6] = &v34[0].sa_data[6];
    *(_WORD *)&v36[14] = 1024;
    *(_DWORD *)&v36[16] = a4;
    *(_WORD *)&v36[20] = 1024;
    *(_DWORD *)&v36[22] = v27;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_INFO,  "bound to %{network:in6_addr}.16P%%%d:%d",  buf,  0x1Eu);
  }

  return 0LL;
}

uint64_t sub_100017DA8(const char *a1, _OWORD *a2, int a3)
{
  if (!a2)
  {
    id v9 = sub_100017728();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10002A04C(v7, v10, v11, v12, v13, v14, v15, v16);
    }
    uint64_t v8 = 22LL;
    goto LABEL_33;
  }

  socklen_t v32 = 0LL;
  if (getifaddrs(&v32))
  {
    id v6 = sub_100017728();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10002A0E0(v7);
    }
    uint64_t v8 = 0xFFFFFFFFLL;
LABEL_33:

    return v8;
  }

  uint64_t v17 = v32;
  if (!v32)
  {
    freeifaddrs(0LL);
    goto LABEL_30;
  }

  id v18 = 0LL;
  int v19 = 0;
  do
  {
    if ((v17->ifa_flags & 1) != 0)
    {
      ifa_addr = v17->ifa_addr;
      if (ifa_addr->sa_family == 30
        && !strncmp(v17->ifa_name, a1, 0x10uLL)
        && (!a3 || ifa_addr->sa_data[6] == 254 && (ifa_addr->sa_data[7] & 0xC0) == 0x80))
      {
        *(_DWORD *)&ifa_addr[1].sa_data[6] = if_nametoindex(a1);
        id v21 = sub_100017728();
        uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)uint64_t buf = 136315650;
          uint64_t v34 = a1;
          __int16 v35 = 1040;
          int v36 = 16;
          __int16 v37 = 2096;
          __int16 v38 = &ifa_addr->sa_data[6];
          _os_log_debug_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEBUG,  "%s: %{network:in6_addr}.16P",  buf,  0x1Cu);
        }

        ++v19;
        id v18 = v17;
      }
    }

    uint64_t v17 = v17->ifa_next;
  }

  while (v17);
  if (v18) {
    *a2 = *(_OWORD *)&v18->ifa_addr->sa_data[6];
  }
  freeifaddrs(v32);
  if (v19 >= 2)
  {
    id v23 = sub_100017728();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 136315138;
      uint64_t v34 = a1;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Found more than one ipv6 addresses for %s",  buf,  0xCu);
    }

    uint64_t v8 = 0LL;
    goto LABEL_33;
  }

  if (!v19)
  {
LABEL_30:
    id v24 = sub_100017728();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10002A07C((uint64_t)a1, v7, v25, v26, v27, v28, v29, v30);
    }
    uint64_t v8 = 3LL;
    goto LABEL_33;
  }

  return 0LL;
}

uint64_t sub_10001804C(int a1, _OWORD *a2)
{
  int v10 = 0;
  socklen_t v8 = 28;
  if (!a2) {
    sub_10002A168(&v7, v11);
  }
  if (getpeername(a1, (sockaddr *)v9, &v8))
  {
    uint64_t v3 = *__error();
    id v4 = sub_100017728();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10002A1D0();
    }
  }

  else
  {
    uint64_t v3 = 0LL;
    *a2 = *(_OWORD *)&v9[8];
  }

  return v3;
}

uint64_t sub_100018118(int a1, sockaddr *a2, socklen_t *a3, unsigned __int8 *a4, int *a5)
{
  if (!a5) {
    return 22LL;
  }
  int v7 = accept(a1, a2, a3);
  if (v7 == -1)
  {
    uint64_t v9 = *__error();
    if ((_DWORD)v9 != 35)
    {
      id v12 = sub_100017728();
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_10002A230();
      }
    }
  }

  else
  {
    int v8 = v7;
    uint64_t v9 = sub_1000181F0(v7, a4);
    if ((_DWORD)v9)
    {
      id v10 = sub_100017728();
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_10002A290();
      }

      if ((v8 & 0x80000000) == 0) {
        close(v8);
      }
    }

    else
    {
      *a5 = v8;
    }
  }

  return v9;
}

uint64_t sub_1000181F0(int a1, unsigned __int8 *a2)
{
  if (!*((_DWORD *)a2 + 4)) {
    sub_10002A2F0(&v12, v13);
  }
  LODWORD(v13[0]) = *((_DWORD *)a2 + 4);
  if (!setsockopt(a1, 6, 32, v13, 4u))
  {
    if (*a2)
    {
      LODWORD(v13[0]) = 1;
      if (setsockopt(a1, 0xFFFF, 8, v13, 4u))
      {
        uint64_t v4 = *__error();
        id v8 = sub_100017728();
        id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          sub_10002A478();
        }
        goto LABEL_5;
      }

      LODWORD(v13[0]) = *a2;
      if (LODWORD(v13[0]) && setsockopt(a1, 6, 16, v13, 4u))
      {
        uint64_t v4 = *__error();
        id v9 = sub_100017728();
        id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          sub_10002A418();
        }
        goto LABEL_5;
      }

      LODWORD(v13[0]) = *((_DWORD *)a2 + 2);
      if (LODWORD(v13[0]) && setsockopt(a1, 6, 258, v13, 4u))
      {
        uint64_t v4 = *__error();
        id v10 = sub_100017728();
        id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          sub_10002A3B8();
        }
        goto LABEL_5;
      }

      LODWORD(v13[0]) = *((_DWORD *)a2 + 3);
      if (LODWORD(v13[0]) && setsockopt(a1, 6, 257, v13, 4u))
      {
        uint64_t v4 = *__error();
        id v11 = sub_100017728();
        id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          sub_10002A358();
        }
        goto LABEL_5;
      }
    }

    return 0LL;
  }

  uint64_t v4 = *__error();
  id v5 = sub_100017728();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_10002A4D8();
  }
LABEL_5:

  return v4;
}

void sub_100018418(id a1)
{
  os_log_t v1 = os_log_create("com.apple.RemoteServiceDiscovery", "network");
  id v2 = (void *)qword_100043148;
  qword_100043148 = (uint64_t)v1;
}

void sub_100018448()
{
  if (qword_100043178 != -1) {
    dispatch_once(&qword_100043178, &stru_10003D548);
  }
  if (!byte_100043180)
  {
    if (qword_100043188 != -1) {
      dispatch_once(&qword_100043188, &stru_10003D568);
    }
    if (dword_100043190
      || os_variant_is_darwinos("com.apple.remoted")
      && !os_variant_is_recovery("com.apple.remoted")
      || sub_10000E920())
    {
      os_log_t v0 = os_log_create("com.apple.RemoteServiceDiscovery", "timesync");
      os_log_t v1 = (void *)qword_100043158;
      qword_100043158 = (uint64_t)v0;

      dispatch_queue_t v2 = dispatch_queue_create("com.apple.remoted.timesync", 0LL);
      uint64_t v3 = (void *)qword_100043160;
      qword_100043160 = (uint64_t)v2;

      uint64_t started = remote_device_start_browsing(0xFFFFLL, qword_100043160, &stru_10003D4B0);
      id v5 = (void *)qword_100043170;
      qword_100043170 = started;

      id v6 = (os_log_s *)qword_100043158;
      if (os_log_type_enabled((os_log_t)qword_100043158, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "enabled remoted timesync", v7, 2u);
      }
    }
  }

void sub_1000185A0(id a1, OS_remote_device *a2, BOOL a3)
{
  uint64_t v4 = a2;
  unsigned int type = remote_device_get_type();
  if (qword_100043188 != -1) {
    dispatch_once(&qword_100043188, &stru_10003D568);
  }
  if (dword_100043190)
  {
    BOOL v6 = dword_100043190 == type;
  }

  else
  {
    if (type > 0xF) {
      goto LABEL_15;
    }
    BOOL v6 = 1;
    if (((1 << type) & 0x9200) == 0) {
      goto LABEL_15;
    }
  }

  if (v6 && qword_100043168 == 0)
  {
    objc_storeStrong((id *)&qword_100043168, a2);
    uint64_t name = remote_device_get_name(qword_100043168);
    id v9 = (os_log_s *)qword_100043158;
    if (os_log_type_enabled((os_log_t)qword_100043158, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 136446210;
      uint64_t v28 = name;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "start timesync with %{public}s", buf, 0xCu);
    }

    id v10 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)qword_100043160);
    dispatch_source_set_timer(v10, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0LL);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100018824;
    handler[3] = &unk_10003D4D8;
    uint64_t v25 = name;
    id v11 = v10;
    id v24 = v11;
    unsigned int v26 = type;
    dispatch_source_set_event_handler(v11, handler);
    uint64_t v12 = qword_100043168;
    uint64_t v13 = qword_100043160;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_100018940;
    v21[3] = &unk_10003D500;
    uint64_t v14 = v11;
    uint64_t v22 = v14;
    remote_device_set_connected_callback(v12, v13, v21);
    uint64_t v15 = qword_100043168;
    uint64_t v16 = qword_100043160;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100018954;
    v18[3] = &unk_10003D528;
    int v19 = v14;
    uint64_t v20 = name;
    uint64_t v17 = v14;
    remote_device_set_disconnected_callback(v15, v16, v18);
    dispatch_activate(v17);
  }

void sub_100018824(uint64_t a1)
{
  int v2 = remote_device_timesync(qword_100043168);
  uint64_t v3 = (os_log_s *)qword_100043158;
  if (os_log_type_enabled((os_log_t)qword_100043158, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = "fail";
    uint64_t v5 = *(void *)(a1 + 40);
    if (v2) {
      uint64_t v4 = "success";
    }
    int v8 = 136446466;
    uint64_t v9 = v5;
    __int16 v10 = 2082;
    id v11 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "timesync with %{public}s %{public}s",  (uint8_t *)&v8,  0x16u);
  }

  BOOL v6 = *(dispatch_source_s **)(a1 + 32);
  if (*(_DWORD *)(a1 + 48) == 15) {
    dispatch_time_t v7 = -1LL;
  }
  else {
    dispatch_time_t v7 = dispatch_time(0LL, 60000000000LL);
  }
  dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0LL);
}

void sub_100018940(uint64_t a1)
{
}

void sub_100018954(uint64_t a1)
{
  int v2 = (os_log_s *)qword_100043158;
  if (os_log_type_enabled((os_log_t)qword_100043158, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v5 = 136446210;
    uint64_t v6 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "%{public}s disconnected, timesync stop",  (uint8_t *)&v5,  0xCu);
  }

  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  uint64_t v4 = (void *)qword_100043168;
  qword_100043168 = 0LL;
}

void sub_100018A0C(id a1)
{
  uint64_t v1 = 0LL;
}

void sub_100018A50(id a1)
{
  uint64_t v1 = calloc(0x100uLL, 1uLL);
  free(v1);
}

void sub_100018AB0(_Unwind_Exception *a1)
{
}

id sub_100018AC4(void *a1)
{
  return sub_100005054(a1, "ERROR");
}

id sub_100018AD0(void *a1, int a2)
{
  id v3 = sub_100005054(a1, "ERROR");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  xpc_dictionary_set_int64(v4, "error_code", a2);
  return v4;
}

void sub_100018D1C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_get_type(v3) != (xpc_type_t)&_xpc_type_error)
  {
    uint64_t v4 = sub_100013A90(v3);
    int v5 = (os_log_s *)(id)qword_100043198;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = [*(id *)(a1 + 32) name];
      *(_DWORD *)uint64_t buf = 136446466;
      id v11 = v6;
      __int16 v12 = 2080;
      uint64_t v13 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Accepting service connection for %{public}s (client=%s)",  buf,  0x16u);
    }

    free(v4);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100018E9C;
    v8[3] = &unk_10003CFE0;
    void v8[4] = *(void *)(a1 + 32);
    dispatch_time_t v7 = v3;
    uint64_t v9 = v7;
    xpc_connection_set_event_handler(v7, v8);
    xpc_connection_set_target_queue(v7, (dispatch_queue_t)qword_1000431A0);
    xpc_connection_activate(v7);
  }
}

void sub_100018E80(_Unwind_Exception *a1)
{
}

void sub_100018E9C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 40);
  id v5 = *(id *)(a1 + 32);
  id v6 = v4;
  id v7 = v3;
  int v8 = objc_autoreleasePoolPush();
  if (xpc_get_type(v7) == (xpc_type_t)&_xpc_type_error)
  {
LABEL_10:
    xpc_connection_cancel(v6);
    goto LABEL_24;
  }

  if ((xpc_dictionary_expects_reply(v7) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)qword_100043198, OS_LOG_TYPE_ERROR)) {
      sub_10002A674();
    }
    goto LABEL_10;
  }

  id v9 = v7;
  id v10 = v5;
  id v11 = (const char *)[v10 entitlement];
  if (!v11) {
    sub_10002A538(&v35, buf);
  }
  __int16 v12 = v11;
  if (!strcmp(v11, "None-AppleInternal") || sub_10001BFC4(v12))
  {
  }

  else
  {
    if (xpc_get_type(v9) != (xpc_type_t)&_xpc_type_dictionary) {
      sub_10002A5EC(&v35, buf);
    }
    *(void *)&__int128 v13 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)uint64_t buf = v13;
    *(_OWORD *)&uint8_t buf[16] = v13;
    xpc_dictionary_get_audit_token(v9, buf);
    uint64_t v14 = (void *)xpc_copy_entitlement_for_token("com.apple.private.network.intcoproc.restricted", buf);
    BOOL v15 = v14 == 0LL;

    if (v15)
    {
      uint64_t v16 = (void *)xpc_copy_entitlement_for_token(v12, buf);
      BOOL v17 = v16 == 0LL;

      if (v17)
      {
        socklen_t v32 = sub_100013A90(v6);
        int v33 = (os_log_s *)(id)qword_100043198;
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          id v34 = [v10 name];
          *(_DWORD *)uint64_t buf = 136446466;
          *(void *)&uint8_t buf[4] = v34;
          *(_WORD *)&uint8_t buf[12] = 2080;
          *(void *)&buf[14] = v32;
          _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "service_handler: Client lacks privilege to interact with service with name %{public}s (client=%s)",  buf,  0x16u);
        }

        free(v32);
        goto LABEL_19;
      }
    }

    else
    {
    }
  }

  string = xpc_dictionary_get_string(v9, "cmd");
  if (!string || strcmp(string, "connect"))
  {
    if (os_log_type_enabled((os_log_t)qword_100043198, OS_LOG_TYPE_ERROR)) {
      sub_10002A5C0();
    }
LABEL_19:
    id v19 = sub_100005054(v9, "ERROR");
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    id v21 = v20;
    if (v20)
    {
      xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(v20);
      id v23 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
      xpc_connection_send_message(v23, v21);
    }

    goto LABEL_24;
  }

  id v24 = sub_100013A90(v6);
  uint64_t v25 = (os_log_s *)(id)qword_100043198;
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    id v26 = [v10 name];
    *(_DWORD *)uint64_t buf = 136446466;
    *(void *)&uint8_t buf[4] = v26;
    *(_WORD *)&uint8_t buf[12] = 2080;
    *(void *)&buf[14] = v24;
    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_INFO,  "%{public}s> Got CONNECT command (client=%s)",  buf,  0x16u);
  }

  free(v24);
  id v27 = v10;
  id v28 = v9;
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v27 device]);
  *(void *)uint64_t buf = _NSConcreteStackBlock;
  *(void *)&uint8_t buf[8] = 3221225472LL;
  *(void *)&uint8_t buf[16] = sub_10001C000;
  *(void *)&buf[24] = &unk_10003CF18;
  id v37 = v27;
  id v38 = v28;
  id v30 = v28;
  id v31 = v27;
  [v29 invokeWhenConnectable:buf];

LABEL_24:
  objc_autoreleasePoolPop(v8);
}

void sub_100019298(_Unwind_Exception *a1)
{
}

void sub_100019608(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_get_type(v3) != (xpc_type_t)&_xpc_type_error)
  {
    uint64_t v4 = sub_100013A90(v3);
    id v5 = (os_log_s *)qword_100043198;
    if (os_log_type_enabled((os_log_t)qword_100043198, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)uint64_t buf = 138543618;
      uint64_t v12 = v6;
      __int16 v13 = 2080;
      uint64_t v14 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%{public}@> Accepting device connection (client=%s)",  buf,  0x16u);
    }

    free(v4);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "device_peers"));
    [v7 addObject:v3];

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100019774;
    v9[3] = &unk_10003CFE0;
    v9[4] = *(void *)(a1 + 32);
    int v8 = v3;
    id v10 = v8;
    xpc_connection_set_event_handler(v8, v9);
    xpc_connection_set_target_queue(v8, (dispatch_queue_t)qword_1000431A0);
    xpc_connection_activate(v8);
  }
}

void sub_100019774(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 40);
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = v4;
  id v7 = v3;
  context = objc_autoreleasePoolPush();
  if (xpc_get_type(v7) == (xpc_type_t)&_xpc_type_error)
  {
    xpc_connection_cancel(v6);
    id v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "device_peers"));
    [v10 removeObject:v6];
LABEL_32:

    goto LABEL_33;
  }

  string = xpc_dictionary_get_string(v7, "cmd");
  if (!string)
  {
    if (os_log_type_enabled((os_log_t)qword_100043198, OS_LOG_TYPE_ERROR)) {
      sub_10002A7C8();
    }
    goto LABEL_33;
  }

  id v9 = string;
  if (!strcmp(string, "helo_device"))
  {
    id v10 = v5;
    BOOL v15 = v6;
    if (xpc_dictionary_get_uint64(v7, "device_state") == 1
      && [v10 state] - 3 <= 2)
    {
      xpc_object_t v16 = xpc_dictionary_create(0LL, 0LL, 0LL);
      sub_10001B184(v10, v15, v16);
      xpc_connection_send_message(v15, v16);
    }

    goto LABEL_32;
  }

  if (!strcmp(v9, "heartbeat"))
  {
    id v17 = v5;
    id v18 = v7;
    id v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "heartbeat_requests"));
    id v20 = [v19 count];

    if (!v20)
    {
      *(void *)uint64_t buf = _NSConcreteStackBlock;
      *(void *)&uint8_t buf[8] = 3221225472LL;
      *(void *)&uint8_t buf[16] = sub_10001C348;
      *(void *)&buf[24] = &unk_10003D5B0;
      id v150 = v17;
      [v150 heartbeatWithCallback:buf];
    }

    id v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "heartbeat_requests"));
    [v21 addObject:v18];
  }

  else if (!strcmp(v9, "timesync"))
  {
    id v22 = v5;
    id v23 = v6;
    id v24 = v7;
    *(void *)&__int128 v25 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v25 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)uint64_t v151 = v25;
    *(_OWORD *)&v151[16] = v25;
    xpc_connection_get_audit_token(v23, v151);
    id v26 = (void *)xpc_copy_entitlement_for_token("com.apple.private.RemoteServiceDiscovery.device-admin", v151);
    BOOL v27 = v26 == 0LL;

    if (v27)
    {
      id v29 = sub_100018AD0(v24, 1);
      id v28 = (id)objc_claimAutoreleasedReturnValue(v29);
      id v30 = sub_100013A90(v23);
      id v31 = (os_log_s *)qword_100043198;
      if (os_log_type_enabled((os_log_t)qword_100043198, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t buf = 136315138;
        *(void *)&uint8_t buf[4] = v30;
        _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "device_timesync: Client lacks privilege (client=%s)",  buf,  0xCu);
      }

      free(v30);
      xpc_dictionary_send_reply(v28);
    }

    else
    {
      *(void *)uint64_t buf = _NSConcreteStackBlock;
      *(void *)&uint8_t buf[8] = 3221225472LL;
      *(void *)&uint8_t buf[16] = sub_10001C4A0;
      *(void *)&buf[24] = &unk_10003D450;
      id v150 = v24;
      [v22 timesyncWithCallback:buf];
      id v28 = v150;
    }
  }

  else
  {
    if ((xpc_dictionary_expects_reply(v7) & 1) != 0)
    {
      if (!strcmp(v9, "list_services"))
      {
        id v137 = v5;
        id v32 = v7;
        xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(v32);
        v135 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
        xpc_object_t xdict = xpc_dictionary_create_reply(v32);
        id v34 = sub_100013A90(v135);
        uint64_t v35 = (os_log_s *)(id)qword_100043198;
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
          sub_10002A7F4((uint64_t)[v137 uuidString], (uint64_t)v34, (uint64_t)v154);
        }

        free(v34);
        xpc_dictionary_set_string(xdict, "result", "OK");
        xpc_object_t v36 = xpc_array_create(0LL, 0LL);
        __int128 v152 = 0u;
        __int128 v153 = 0u;
        memset(v151, 0, sizeof(v151));
        id v37 = (void *)objc_claimAutoreleasedReturnValue([v137 services]);
        id v38 = [v37 countByEnumeratingWithState:v151 objects:buf count:16];
        if (v38)
        {
          uint64_t v39 = **(void **)&v151[16];
          do
          {
            for (i = 0LL; i != v38; i = (char *)i + 1)
            {
              if (**(void **)&v151[16] != v39) {
                objc_enumerationMutation(v37);
              }
              __int128 v41 = *(void **)(*(void *)&v151[8] + 8LL * (void)i);
              if (sub_10001C4F8(v32, v41)) {
                xpc_array_set_string(v36, 0xFFFFFFFFFFFFFFFFLL, (const char *)[v41 name]);
              }
            }

            id v38 = [v37 countByEnumeratingWithState:v151 objects:buf count:16];
          }

          while (v38);
        }

        xpc_dictionary_set_value(xdict, "services", v36);
        __int128 v42 = sub_100013A90(v135);
        __int128 v43 = (os_log_s *)(id)qword_100043198;
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          size_t count = xpc_array_get_count(v36);
          uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue([v137 services]);
          *(_DWORD *)uint64_t v141 = 134218754;
          size_t v142 = count;
          __int16 v143 = 1024;
          unsigned int v144 = [v45 count];
          __int16 v145 = 2082;
          id v146 = [v137 uuidString];
          __int16 v147 = 2080;
          uint64_t v148 = v42;
          _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_INFO,  "device_list_services: Returning %zd/%d services for device %{public}s (client=%s)",  v141,  0x26u);
        }

        free(v42);
        xpc_object_t reply = xdict;
        goto LABEL_26;
      }

      if (!strcmp(v9, "list_local_services"))
      {
        xpc_object_t xdicta = v5;
        id v136 = v7;
        xpc_connection_t v46 = xpc_dictionary_get_remote_connection(v136);
        uint64_t v138 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(v46);
        if (sub_10001C630(v136))
        {
          xpc_object_t reply = xpc_dictionary_create_reply(v136);
          __int128 v47 = sub_100013A90(v138);
          uint64_t v48 = (os_log_s *)(id)qword_100043198;
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG)) {
            sub_10002A830((uint64_t)[xdicta uuidString], (uint64_t)v47, (uint64_t)v141);
          }

          free(v47);
          xpc_object_t v49 = xpc_array_create(0LL, 0LL);
          __int128 v152 = 0u;
          __int128 v153 = 0u;
          memset(v151, 0, sizeof(v151));
          uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(xdicta, "service_listeners"));
          id v51 = [v50 countByEnumeratingWithState:v151 objects:buf count:16];
          if (v51)
          {
            uint64_t v52 = **(void **)&v151[16];
            do
            {
              for (j = 0LL; j != v51; j = (char *)j + 1)
              {
                if (**(void **)&v151[16] != v52) {
                  objc_enumerationMutation(v50);
                }
                uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(void *)&v151[8]
                                                                                   + 8LL * (void)j), "service", xdicta));
                xpc_array_set_string(v49, 0xFFFFFFFFFFFFFFFFLL, (const char *)[v54 name]);
              }

              id v51 = [v50 countByEnumeratingWithState:v151 objects:buf count:16];
            }

            while (v51);
          }

          xpc_dictionary_set_value(reply, "services", v49);
          xpc_dictionary_set_string(reply, "result", "OK");
        }

        else
        {
          BOOL v66 = sub_100013A90(v138);
          v67 = (os_log_s *)qword_100043198;
          if (os_log_type_enabled((os_log_t)qword_100043198, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)uint64_t buf = 136315138;
            *(void *)&uint8_t buf[4] = v66;
            _os_log_impl( (void *)&_mh_execute_header,  v67,  OS_LOG_TYPE_DEFAULT,  "device_list_local_services: Client lacks privilege (client=%s)",  buf,  0xCu);
          }

          free(v66);
          id v68 = sub_100005054(v136, "ERROR");
          xpc_object_t reply = (xpc_object_t)objc_claimAutoreleasedReturnValue(v68);
        }

        goto LABEL_26;
      }

      if (strcmp(v9, "get_service"))
      {
        if (!strcmp(v9, "check_service"))
        {
          id v69 = v5;
          uint64_t v70 = (_xpc_connection_s *)v7;
          xpc_connection_t v71 = xpc_dictionary_get_remote_connection(v70);
          uint64_t v72 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(v71);
          uint64_t v73 = xpc_dictionary_get_string(v70, "name");
          if (v73)
          {
            uint64_t v74 = v73;
            uint64_t v75 = sub_100013A90(v72);
            uint64_t v76 = (os_log_s *)(id)qword_100043198;
            if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)uint64_t buf = 136446722;
              *(void *)&uint8_t buf[4] = v74;
              *(_WORD *)&uint8_t buf[12] = 2082;
              *(void *)&buf[14] = [v69 uuidString];
              *(_WORD *)&_BYTE buf[22] = 2080;
              *(void *)&buf[24] = v75;
              _os_log_debug_impl( (void *)&_mh_execute_header,  v76,  OS_LOG_TYPE_DEBUG,  "Fetching service %{public}s on %{public}s (client=%s)",  buf,  0x20u);
            }

            free(v75);
            v77 = (void *)objc_claimAutoreleasedReturnValue([v69 serviceWithName:v74]);
            if (v77)
            {
              xpc_object_t reply = xpc_dictionary_create_reply(v70);
              xpc_dictionary_set_string(reply, "result", "OK");
            }

            else
            {
              v100 = sub_100013A90(v72);
              v101 = (os_log_s *)qword_100043198;
              if (os_log_type_enabled((os_log_t)qword_100043198, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)uint64_t buf = 136446466;
                *(void *)&uint8_t buf[4] = v74;
                *(_WORD *)&uint8_t buf[12] = 2080;
                *(void *)&buf[14] = v100;
                _os_log_impl( (void *)&_mh_execute_header,  v101,  OS_LOG_TYPE_DEFAULT,  "device_check_service: Unable to find service with name %{public}s (client=%s)",  buf,  0x16u);
              }

              free(v100);
              id v102 = sub_100005054(v70, "ERROR");
              xpc_object_t reply = (xpc_object_t)objc_claimAutoreleasedReturnValue(v102);
            }
          }

          else
          {
            if (os_log_type_enabled((os_log_t)qword_100043198, OS_LOG_TYPE_ERROR)) {
              sub_10002A898();
            }
            id v83 = sub_100005054(v70, "ERROR");
            xpc_object_t reply = (xpc_object_t)objc_claimAutoreleasedReturnValue(v83);
          }

          goto LABEL_156;
        }

        if (!strcmp(v9, "get_heartbeat_stats"))
        {
          id v78 = v5;
          xpc_object_t reply = xpc_dictionary_create_reply(v7);
          xpc_dictionary_set_string(reply, "result", "OK");
          id v79 = objc_msgSend(v78, "heartbeat_stats");

          xpc_dictionary_set_data(reply, "heartbeat_stats", v79, 0x30uLL);
          goto LABEL_26;
        }

        if (!strcmp(v9, "get_connectable"))
        {
          id v81 = v5;
          xpc_object_t reply = xpc_dictionary_create_reply(v7);
          unsigned __int8 v82 = [v81 connectable];

          xpc_dictionary_set_BOOL(reply, "result", v82);
          goto LABEL_26;
        }

        if (!strcmp(v9, "reset"))
        {
          id v88 = v5;
          id v89 = v7;
          xpc_connection_t v90 = xpc_dictionary_get_remote_connection(v89);
          v91 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(v90);
          id v92 = v89;
          if (xpc_get_type(v92) != (xpc_type_t)&_xpc_type_dictionary) {
            sub_10002A8C4(v151, buf);
          }
          *(void *)&__int128 v93 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v93 + 1) = 0xAAAAAAAAAAAAAAAALL;
          *(_OWORD *)uint64_t buf = v93;
          *(_OWORD *)&uint8_t buf[16] = v93;
          xpc_dictionary_get_audit_token(v92, buf);
          uint64_t v94 = (void *)xpc_copy_entitlement_for_token("com.apple.private.RemoteServiceDiscovery.device-admin", buf);
          BOOL v95 = v94 == 0LL;

          uint64_t v96 = sub_100013A90(v91);
          uint64_t v97 = (os_log_s *)qword_100043198;
          if (v95)
          {
            if (os_log_type_enabled((os_log_t)qword_100043198, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)uint64_t buf = 136315138;
              *(void *)&uint8_t buf[4] = v96;
              _os_log_impl( (void *)&_mh_execute_header,  v97,  OS_LOG_TYPE_DEFAULT,  "device_reset: Client lacks privilege to reset device (client=%s)",  buf,  0xCu);
            }

            free(v96);
            id v113 = sub_100005054(v92, "ERROR");
            xpc_object_t reply = (xpc_object_t)objc_claimAutoreleasedReturnValue(v113);
          }

          else
          {
            uint64_t v98 = (os_log_s *)(id)qword_100043198;
            if (os_log_type_enabled(v98, OS_LOG_TYPE_INFO))
            {
              id v99 = [v88 uuidString];
              *(_DWORD *)uint64_t buf = 136446466;
              *(void *)&uint8_t buf[4] = v99;
              *(_WORD *)&uint8_t buf[12] = 2080;
              *(void *)&buf[14] = v96;
              _os_log_impl( (void *)&_mh_execute_header,  v98,  OS_LOG_TYPE_INFO,  "Resetting remote device %{public}s (client=%s)",  buf,  0x16u);
            }

            free(v96);
            [v88 reset];
            xpc_object_t reply = xpc_dictionary_create_reply(v92);
            xpc_dictionary_set_string(reply, "result", "OK");
          }

          goto LABEL_26;
        }

        if (!strcmp(v9, "set_alias"))
        {
          id v69 = v5;
          uint64_t v70 = v6;
          uint64_t v72 = (_xpc_connection_s *)v7;
          *(void *)&__int128 v103 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v103 + 1) = 0xAAAAAAAAAAAAAAAALL;
          *(_OWORD *)uint64_t buf = v103;
          *(_OWORD *)&uint8_t buf[16] = v103;
          xpc_connection_get_audit_token(v70, buf);
          uint64_t v104 = (void *)xpc_copy_entitlement_for_token("com.apple.private.RemoteServiceDiscovery.device-admin", buf);
          BOOL v105 = v104 == 0LL;

          if (v105)
          {
            uint64_t v116 = sub_100013A90(v70);
            uint64_t v117 = (os_log_s *)qword_100043198;
            if (os_log_type_enabled((os_log_t)qword_100043198, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)uint64_t v151 = 136315138;
              *(void *)&v151[4] = v116;
              _os_log_impl( (void *)&_mh_execute_header,  v117,  OS_LOG_TYPE_DEFAULT,  "device_set_alias: Client lacks privilege to name device (client=%s)",  v151,  0xCu);
            }

            free(v116);
            id v118 = sub_100005054(v72, "ERROR");
            uint64_t v119 = objc_claimAutoreleasedReturnValue(v118);
          }

          else
          {
            uint64_t v106 = xpc_dictionary_get_string(v72, "device_alias");
            if (v106)
            {
              uint64_t v107 = sub_100013A90(v70);
              uint64_t v108 = (os_log_s *)(id)qword_100043198;
              if (os_log_type_enabled(v108, OS_LOG_TYPE_INFO))
              {
                id v109 = [v69 uuidString];
                *(_DWORD *)uint64_t v151 = 136446722;
                *(void *)&v151[4] = v109;
                *(_WORD *)&v151[12] = 2082;
                *(void *)&v151[14] = v106;
                *(_WORD *)&v151[22] = 2080;
                *(void *)&v151[24] = v107;
                _os_log_impl( (void *)&_mh_execute_header,  v108,  OS_LOG_TYPE_INFO,  "setting remote device %{public}s alias as %{public}s (client=%s)",  v151,  0x20u);
              }

              free(v107);
              objc_msgSend(v69, "setDevice_alias:", v106);
              xpc_object_t reply = xpc_dictionary_create_reply(v72);
              xpc_dictionary_set_string(reply, "result", "OK");
              goto LABEL_156;
            }

            if (os_log_type_enabled((os_log_t)qword_100043198, OS_LOG_TYPE_ERROR)) {
              sub_10002A94C();
            }
            id v128 = sub_100005054(v72, "ERROR");
            uint64_t v119 = objc_claimAutoreleasedReturnValue(v128);
          }

          xpc_object_t reply = (xpc_object_t)v119;
        }

        else
        {
          if (!strcmp(v9, "disconnect_device"))
          {
            id v69 = v5;
            uint64_t v70 = (_xpc_connection_s *)v7;
            xpc_connection_t v110 = xpc_dictionary_get_remote_connection(v70);
            uint64_t v72 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(v110);
            if ([v69 type] - 14 >= 3)
            {
              uint64_t v120 = (void *)qword_100043198;
              if (os_log_type_enabled((os_log_t)qword_100043198, OS_LOG_TYPE_ERROR)) {
                sub_10002A978(v120, v69);
              }
              id v121 = sub_100018AD0(v70, 1);
              xpc_object_t reply = (xpc_object_t)objc_claimAutoreleasedReturnValue(v121);
            }

            else
            {
              v111 = sub_100013A90(v72);
              v112 = (os_log_s *)(id)qword_100043198;
              if (os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)uint64_t buf = 136446466;
                *(void *)&uint8_t buf[4] = objc_msgSend(v69, "device_name");
                *(_WORD *)&uint8_t buf[12] = 2080;
                *(void *)&buf[14] = v111;
                _os_log_impl( (void *)&_mh_execute_header,  v112,  OS_LOG_TYPE_DEFAULT,  "Disconnecting remote device %{public}s (client=%s)",  buf,  0x16u);
              }

              free(v111);
              if ([v69 state] == 3)
              {
                *(void *)uint64_t buf = _NSConcreteStackBlock;
                *(void *)&uint8_t buf[8] = 3221225472LL;
                *(void *)&uint8_t buf[16] = sub_10001C6DC;
                *(void *)&buf[24] = &unk_10003D450;
                id v150 = v69;
                [v150 goodByeWithCallback:buf];
              }

              else
              {
                [v69 disconnect];
              }

              xpc_object_t reply = xpc_dictionary_create_reply(v70);
              xpc_dictionary_set_string(reply, "result", "OK");
            }

            goto LABEL_156;
          }

          if (!strcmp(v9, "get_latest_connect_error"))
          {
            id v114 = v5;
            xpc_object_t reply = xpc_dictionary_create_reply(v7);
            signed int v115 = [v114 latestConnectError];

            xpc_dictionary_set_int64(reply, "result", v115);
            goto LABEL_26;
          }

          if (strcmp(v9, "authenticate_device"))
          {
            if (os_log_type_enabled((os_log_t)qword_100043198, OS_LOG_TYPE_ERROR)) {
              sub_10002AB24();
            }
LABEL_25:
            id v11 = sub_100005054(v7, "ERROR");
            xpc_object_t reply = (xpc_object_t)objc_claimAutoreleasedReturnValue(v11);
            goto LABEL_26;
          }

          id v69 = v5;
          uint64_t v70 = v6;
          uint64_t v72 = (_xpc_connection_s *)v7;
          *(void *)uint64_t v151 = 0LL;
          v122 = sub_100013A90(v70);
          v123 = (os_log_s *)qword_100043198;
          if (os_log_type_enabled((os_log_t)qword_100043198, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)uint64_t buf = 136315138;
            *(void *)&uint8_t buf[4] = v122;
            _os_log_impl( (void *)&_mh_execute_header,  v123,  OS_LOG_TYPE_DEFAULT,  "Authenticating device certificate on behalf of client... (client=%s)",  buf,  0xCu);
          }

          free(v122);
          data = xpc_dictionary_get_data(v72, "identity_cert", (size_t *)v151);
          if (data)
          {
            uint64_t v125 = (__SecCertificate *)SecCertificateCreateWithBytes(0LL, data, *(void *)v151);
            if (v125)
            {
              if ((sub_100015754(v69, v125) & 1) != 0)
              {
                uint64_t v126 = sub_100013A90(v70);
                uint64_t v127 = (os_log_s *)qword_100043198;
                if (os_log_type_enabled((os_log_t)qword_100043198, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)uint64_t buf = 136315138;
                  *(void *)&uint8_t buf[4] = v126;
                  _os_log_impl( (void *)&_mh_execute_header,  v127,  OS_LOG_TYPE_DEFAULT,  "Successfully authenticated device certificate on behalf of client (client=%s)",  buf,  0xCu);
                }

                free(v126);
                xpc_object_t reply = xpc_dictionary_create_reply(v72);
                xpc_dictionary_set_string(reply, "result", "OK");
              }

              else
              {
                uint64_t v131 = sub_100013A90(v70);
                if (os_log_type_enabled((os_log_t)qword_100043198, OS_LOG_TYPE_ERROR)) {
                  sub_10002AAC4();
                }
                free(v131);
                id v132 = sub_100005054(v72, "ERROR");
                xpc_object_t reply = (xpc_object_t)objc_claimAutoreleasedReturnValue(v132);
              }

              CFRelease(v125);
              goto LABEL_156;
            }

            uint64_t v129 = sub_100013A90(v70);
            if (os_log_type_enabled((os_log_t)qword_100043198, OS_LOG_TYPE_ERROR)) {
              sub_10002AA64();
            }
          }

          else
          {
            uint64_t v129 = sub_100013A90(v70);
            if (os_log_type_enabled((os_log_t)qword_100043198, OS_LOG_TYPE_ERROR)) {
              sub_10002AA04();
            }
          }

          free(v129);
          id v130 = sub_100005054(v72, "ERROR");
          xpc_object_t reply = (xpc_object_t)objc_claimAutoreleasedReturnValue(v130);
        }

LABEL_156:
LABEL_26:
        if (reply)
        {
          xpc_connection_t v13 = xpc_dictionary_get_remote_connection(reply);
          uint64_t v14 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(v13);
          xpc_connection_send_message(v14, reply);
        }

        goto LABEL_33;
      }

      id v139 = v5;
      id v55 = v7;
      xpc_connection_t v56 = xpc_dictionary_get_remote_connection(v55);
      __int128 v57 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(v56);
      __int128 v58 = xpc_dictionary_get_string(v55, "name");
      if (!v58)
      {
        if (os_log_type_enabled((os_log_t)qword_100043198, OS_LOG_TYPE_ERROR)) {
          sub_10002A86C();
        }
        id v80 = sub_100005054(v55, "ERROR");
        xpc_object_t reply = (xpc_object_t)objc_claimAutoreleasedReturnValue(v80);
        goto LABEL_102;
      }

      uint64_t v59 = v58;
      uint64_t v60 = sub_100013A90(v57);
      uint64_t v61 = (os_log_s *)(id)qword_100043198;
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)uint64_t buf = 136446722;
        *(void *)&uint8_t buf[4] = v59;
        *(_WORD *)&uint8_t buf[12] = 2082;
        *(void *)&buf[14] = [v139 uuidString];
        *(_WORD *)&_BYTE buf[22] = 2080;
        *(void *)&buf[24] = v60;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_DEBUG,  "Fetching service %{public}s on %{public}s (client=%s)",  buf,  0x20u);
      }

      free(v60);
      uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue([v139 serviceWithName:v59]);
      if (v62)
      {
        if (sub_10001C4F8(v55, v62))
        {
          xpc_object_t reply = xpc_dictionary_create_reply(v55);
          xpc_dictionary_set_string(reply, "result", "OK");
          id v63 = [v62 copyClientDescription];
          xpc_dictionary_set_value(reply, "service", v63);

          uint64_t v64 = sub_100013A90(v57);
          uint64_t v65 = (os_log_s *)qword_100043198;
          if (os_log_type_enabled((os_log_t)qword_100043198, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)uint64_t buf = 136446466;
            *(void *)&uint8_t buf[4] = v59;
            *(_WORD *)&uint8_t buf[12] = 2080;
            *(void *)&buf[14] = v64;
            _os_log_impl( (void *)&_mh_execute_header,  v65,  OS_LOG_TYPE_DEFAULT,  "device_get_service: Returning service %{public}s (client=%s)",  buf,  0x16u);
          }

          free(v64);
          goto LABEL_101;
        }

        uint64_t v84 = sub_100013A90(v57);
        uint64_t v86 = (os_log_s *)qword_100043198;
        if (os_log_type_enabled((os_log_t)qword_100043198, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t buf = 136446466;
          *(void *)&uint8_t buf[4] = v59;
          *(_WORD *)&uint8_t buf[12] = 2080;
          *(void *)&buf[14] = v84;
          _os_log_impl( (void *)&_mh_execute_header,  v86,  OS_LOG_TYPE_DEFAULT,  "device_get_service: Client lacks privilege to find service with name %{public}s (client=%s)",  buf,  0x16u);
        }
      }

      else
      {
        uint64_t v84 = sub_100013A90(v57);
        uint64_t v85 = (os_log_s *)qword_100043198;
        if (os_log_type_enabled((os_log_t)qword_100043198, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t buf = 136446466;
          *(void *)&uint8_t buf[4] = v59;
          *(_WORD *)&uint8_t buf[12] = 2080;
          *(void *)&buf[14] = v84;
          _os_log_impl( (void *)&_mh_execute_header,  v85,  OS_LOG_TYPE_DEFAULT,  "device_get_service: Unable to find service with name %{public}s (client=%s)",  buf,  0x16u);
        }
      }

      free(v84);
      id v87 = sub_100005054(v55, "ERROR");
      xpc_object_t reply = (xpc_object_t)objc_claimAutoreleasedReturnValue(v87);
LABEL_101:

LABEL_102:
      goto LABEL_26;
    }

    if (os_log_type_enabled((os_log_t)qword_100043198, OS_LOG_TYPE_ERROR)) {
      sub_10002AB50();
    }
  }

void sub_10001ADB0(_Unwind_Exception *a1)
{
}

id sub_10001AF20(uint64_t a1, xpc_object_t object)
{
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_error)
  {
    id v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) connection]);
    uint64_t v4 = sub_100013A90(v3);

    id v5 = (os_log_s *)qword_100043198;
    if (os_log_type_enabled((os_log_t)qword_100043198, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315138;
      int v8 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Unregistering client browse. (client=%s)",  (uint8_t *)&v7,  0xCu);
    }

    free(v4);
  }

  else if (os_log_type_enabled((os_log_t)qword_100043198, OS_LOG_TYPE_ERROR))
  {
    sub_10002AB7C();
  }

  return [*(id *)(a1 + 32) cancel];
}

void sub_10001B184(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = a2;
  id v7 = a1;
  BOOL v8 = sub_10001C2AC((uint64_t)v6);
  id v9 = sub_100013A90(v6);

  id v10 = (os_log_s *)qword_100043198;
  if (os_log_type_enabled((os_log_t)qword_100043198, OS_LOG_TYPE_DEBUG)) {
    sub_10002ABA8(v8, (uint64_t)v9, v10);
  }
  free(v9);
  xpc_dictionary_set_string(v5, "cmd", "found_device");
  id v11 = [v7 copyClientDescriptionWithSensitiveProperties:v8];

  xpc_dictionary_set_value(v5, "device", v11);
}

void sub_10001B34C(uint64_t a1)
{
  uint64_t v1 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) connection]);
  xpc_connection_cancel(v1);
}

void sub_10001B3BC(void *a1)
{
  id v1 = a1;
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id v2 = (id)qword_1000431A8;
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * (void)v6), "deliverDevice:", v1, (void)v7);
        uint64_t v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }

    while (v4);
  }
}

void sub_10001B4B8(void *a1)
{
  id v1 = a1;
  id v2 = (os_log_s *)qword_100043198;
  if (os_log_type_enabled((os_log_t)qword_100043198, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Delivering device update", buf, 2u);
  }

  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "device_peers", 0));
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      __int128 v7 = 0LL;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        __int128 v8 = *(void **)(*((void *)&v10 + 1) + 8LL * (void)v7);
        xpc_object_t v9 = xpc_dictionary_create(0LL, 0LL, 0LL);
        sub_10001B184(v1, v8, v9);
        xpc_connection_send_message((xpc_connection_t)v8, v9);

        __int128 v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }

    while (v5);
  }
}

void sub_10001B628(void *a1)
{
  id v3 = a1;
  id v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "device_listener"));

  if (v1)
  {
    id v2 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "device_listener"));
    xpc_connection_cancel(v2);

    objc_msgSend(v3, "setDevice_listener:", 0);
  }
}

void sub_10001B68C(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v3 = (void *)qword_1000431A8;
  qword_1000431A8 = (uint64_t)v2;

  id v4 = (void *)qword_1000431A0;
  qword_1000431A0 = (uint64_t)v1;
  id v9 = v1;

  os_log_t v5 = os_log_create("com.apple.RemoteServiceDiscovery", "ClientInterface");
  uint64_t v6 = (void *)qword_100043198;
  qword_100043198 = (uint64_t)v5;

  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.remoted", (dispatch_queue_t)qword_1000431A0, 1uLL);
  __int128 v8 = (void *)qword_1000431B0;
  qword_1000431B0 = (uint64_t)mach_service;

  xpc_connection_set_event_handler((xpc_connection_t)qword_1000431B0, &stru_10003D588);
  xpc_connection_activate((xpc_connection_t)qword_1000431B0);
}

void sub_10001B754(id a1, OS_xpc_object *a2)
{
  id v2 = a2;
  if (xpc_get_type(v2) != (xpc_type_t)&_xpc_type_error)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10001B7F4;
    handler[3] = &unk_10003CDB8;
    id v3 = v2;
    os_log_t v5 = v3;
    xpc_connection_set_event_handler(v3, handler);
    xpc_connection_set_target_queue(v3, (dispatch_queue_t)qword_1000431A0);
    xpc_connection_activate(v3);
  }
}

void sub_10001B7F4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (_xpc_connection_s *)*(id *)(a1 + 32);
  id v5 = v3;
  uint64_t v6 = objc_autoreleasePoolPush();
  if (xpc_get_type(v5) == (xpc_type_t)&_xpc_type_error)
  {
    xpc_connection_cancel(v4);
    goto LABEL_40;
  }

  if ((xpc_dictionary_expects_reply(v5) & 1) != 0)
  {
    string = xpc_dictionary_get_string(v5, "cmd");
    if (!string)
    {
      if (os_log_type_enabled((os_log_t)qword_100043198, OS_LOG_TYPE_ERROR)) {
        sub_10002AD00();
      }
      goto LABEL_19;
    }

    __int128 v8 = string;
    if (strcmp(string, "browse"))
    {
      if (!strcmp(v8, "get_unique_device") || !strcmp(v8, "get_device"))
      {
        id v11 = sub_10001C738(v4, v5);
        uint64_t v10 = objc_claimAutoreleasedReturnValue(v11);
        goto LABEL_21;
      }

      if (!strcmp(v8, "get_local_device_description"))
      {
        xpc_object_t reply = xpc_dictionary_create_reply(v5);
        xpc_object_t v13 = xpc_dictionary_create(0LL, 0LL, 0LL);
        xpc_dictionary_set_string(reply, "result", "OK");
        xpc_dictionary_set_uint64(v13, "device_messaging_protocol_version", 6uLL);
        xpc_dictionary_set_uuid(v13, "UUID", byte_100043228);
        xpc_dictionary_set_value(v13, "properties", (xpc_object_t)qword_100043238);
        xpc_dictionary_set_value(reply, "device", v13);
        goto LABEL_37;
      }

      if (!strcmp(v8, "get_local_device_identity"))
      {
        id v31 = v4;
        *(void *)&__int128 buf = _NSConcreteStackBlock;
        *((void *)&buf + 1) = 3221225472LL;
        __int128 v58 = sub_10001D074;
        uint64_t v59 = &unk_10003D648;
        uint64_t v60 = (BrowseRegistration *)v5;
        uint64_t v61 = v31;
        uint64_t v62 = &stru_10003D5D0;
        id v32 = v60;
        int v33 = v31;
        sub_100014A94(0LL, &buf);

        goto LABEL_40;
      }

      if (!strcmp(v8, "delete_local_device_identity"))
      {
        xpc_object_t reply = xpc_dictionary_create_reply(v5);
        sub_100014798();
      }

      else
      {
        if (strcmp(v8, "create_local_device_identity"))
        {
          if (strcmp(v8, "list_local_device_services"))
          {
            if (os_log_type_enabled((os_log_t)qword_100043198, OS_LOG_TYPE_ERROR)) {
              sub_10002AD94();
            }
LABEL_19:
            id v9 = sub_100005054(v5, "ERROR");
            uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
LABEL_21:
            xpc_object_t reply = (xpc_object_t)v10;
LABEL_38:
            id v27 = reply;
            if (!v27) {
              sub_10002AC98(v55, &buf);
            }
            id v28 = v27;

            xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(v28);
            id v30 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
            xpc_connection_send_message(v30, v28);

            goto LABEL_40;
          }

          xpc_object_t v13 = v5;
          xpc_object_t reply = xpc_dictionary_create_reply(v13);
          xpc_object_t v15 = xpc_array_create(0LL, 0LL);
          if (sub_10001C630(v13))
          {
            xpc_object_t v46 = v13;
            xpc_dictionary_set_string(reply, "result", "OK");
            __int128 v53 = 0u;
            __int128 v54 = 0u;
            __int128 v51 = 0u;
            __int128 v52 = 0u;
            id v34 = (id)qword_100043240;
            id v35 = [v34 countByEnumeratingWithState:&v51 objects:&buf count:16];
            if (v35)
            {
              id v36 = v35;
              uint64_t v37 = *(void *)v52;
              do
              {
                for (i = 0LL; i != v36; i = (char *)i + 1)
                {
                  if (*(void *)v52 != v37) {
                    objc_enumerationMutation(v34);
                  }
                  xpc_object_t v39 = xpc_string_create((const char *)[*(id *)(*((void *)&v51 + 1) + 8 * (void)i) name]);
                  xpc_array_append_value(v15, v39);
                }

                id v36 = [v34 countByEnumeratingWithState:&v51 objects:&buf count:16];
              }

              while (v36);
            }

            __int128 v49 = 0u;
            __int128 v50 = 0u;
            __int128 v47 = 0u;
            __int128 v48 = 0u;
            id v40 = (id)qword_100043248;
            id v41 = [v40 countByEnumeratingWithState:&v47 objects:v55 count:16];
            if (v41)
            {
              id v42 = v41;
              uint64_t v43 = *(void *)v48;
              do
              {
                for (j = 0LL; j != v42; j = (char *)j + 1)
                {
                  if (*(void *)v48 != v43) {
                    objc_enumerationMutation(v40);
                  }
                  xpc_object_t v45 = xpc_string_create((const char *)[*(id *)(*((void *)&v47 + 1) + 8 * (void)j) name]);
                  xpc_array_append_value(v15, v45);
                }

                id v42 = [v40 countByEnumeratingWithState:&v47 objects:v55 count:16];
              }

              while (v42);
            }

            xpc_dictionary_set_value(reply, "services", v15);
            xpc_object_t v13 = v46;
          }

          else
          {
            xpc_dictionary_set_string(reply, "result", "ERROR");
          }

          goto LABEL_36;
        }

        xpc_object_t reply = xpc_dictionary_create_reply(v5);
        sub_100013EAC();
      }

      xpc_dictionary_set_string(reply, "result", "OK");
      goto LABEL_38;
    }

    xpc_object_t v13 = v5;
    xpc_connection_t v14 = xpc_dictionary_get_remote_connection(v13);
    xpc_object_t v15 = (xpc_object_t)objc_claimAutoreleasedReturnValue(v14);
    BOOL v16 = xpc_dictionary_get_BOOL(v13, "present_only");
    id v17 = sub_100013A90((_xpc_connection_s *)v15);
    id v18 = (os_log_s *)qword_100043198;
    BOOL v19 = os_log_type_enabled((os_log_t)qword_100043198, OS_LOG_TYPE_INFO);
    if (v16)
    {
      if (v19)
      {
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = v17;
        id v20 = "Registering client browse (present-only). (client=%s)";
LABEL_27:
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, v20, (uint8_t *)&buf, 0xCu);
      }
    }

    else if (v19)
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = v17;
      id v20 = "Registering client browse. (client=%s)";
      goto LABEL_27;
    }

    free(v17);
    id v21 = -[BrowseRegistration initWithRequest:](objc_alloc(&OBJC_CLASS___BrowseRegistration), "initWithRequest:", v13);
    if (!v21) {
      sub_10002AD2C(v55, &buf);
    }
    *(void *)&__int128 buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472LL;
    __int128 v58 = sub_10001CC54;
    uint64_t v59 = &unk_10003D5F8;
    id v22 = v21;
    uint64_t v60 = v22;
    sub_100006400(&buf);
    id v23 = sub_100013A90((_xpc_connection_s *)v15);
    id v24 = (os_log_s *)qword_100043198;
    if (os_log_type_enabled((os_log_t)qword_100043198, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)id v55 = 136315138;
      xpc_connection_t v56 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "Completed immediate devices. (client=%s)",  v55,  0xCu);
    }

    free(v23);
    if (v16)
    {
      -[BrowseRegistration cancel](v22, "cancel");
      __int128 v25 = sub_100013A90((_xpc_connection_s *)v15);
      id v26 = (os_log_s *)qword_100043198;
      if (os_log_type_enabled((os_log_t)qword_100043198, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)id v55 = 136315138;
        xpc_connection_t v56 = v25;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_INFO,  "Completed client browse (present-only). (client=%s)",  v55,  0xCu);
      }

      free(v25);
    }

    xpc_object_t reply = xpc_dictionary_create_reply(v13);
    xpc_dictionary_set_string(reply, "cmd", "browse");
    xpc_dictionary_set_string(reply, "result", "OK");

LABEL_36:
LABEL_37:

    goto LABEL_38;
  }

  if (os_log_type_enabled((os_log_t)qword_100043198, OS_LOG_TYPE_ERROR)) {
    sub_10002ADC0();
  }
LABEL_40:
  objc_autoreleasePoolPop(v6);
}

BOOL sub_10001BFC4(const char *a1)
{
  return !strcmp(a1, "AppleInternal") && (os_variant_has_internal_content("com.apple.RemoteServiceDiscovery") & 1) != 0;
}

void sub_10001C000(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) device]);
  unsigned int v4 = [v3 state];

  if (v4 == 5)
  {
    id v5 = sub_100005054(*(void **)(a1 + 40), "ERROR");
    xpc_object_t reply = (xpc_object_t)objc_claimAutoreleasedReturnValue(v5);
  }

  else
  {
    __int128 v22 = xmmword_100030468;
    LODWORD(v23) = 8;
    xpc_object_t value = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 40), "keepalive");
    __int128 v8 = (void *)objc_claimAutoreleasedReturnValue(value);
    id v9 = v8;
    if (v8 && xpc_get_type(v8) == (xpc_type_t)&_xpc_type_BOOL) {
      LOBYTE(v22) = xpc_BOOL_get_value(v9);
    }
    uint64_t uint64 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 40), "keepalive_time");
    uint64_t v11 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 40), "keepcount");
    if (v11) {
      DWORD2(v22) = v11;
    }
    uint64_t v12 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 40), "keepinterval");
    if (v12) {
      HIDWORD(v22) = v12;
    }
    uint64_t v13 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 40), "connect_timeout");
    if (v13) {
      LODWORD(v23) = v13;
    }
    int v14 = [*v2 getSocketWithTcpOption:&v22];
    if (v14 < 0)
    {
      id v20 = (void *)qword_100043198;
      if (os_log_type_enabled((os_log_t)qword_100043198, OS_LOG_TYPE_ERROR)) {
        sub_10002ADEC(v2, v20);
      }
      id v21 = sub_100005054(*(void **)(a1 + 40), "INTERRUPTED");
      xpc_object_t reply = (xpc_object_t)objc_claimAutoreleasedReturnValue(v21);
    }

    else
    {
      xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(*(xpc_object_t *)(a1 + 40));
      BOOL v16 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
      id v17 = sub_100013A90(v16);
      id v18 = (os_log_s *)(id)qword_100043198;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        id v19 = objc_msgSend(*v2, "name", v22, v23);
        *(_DWORD *)__int128 buf = 136446466;
        id v25 = v19;
        __int16 v26 = 2080;
        id v27 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "%{public}s> Connect succeeded (client=%s)",  buf,  0x16u);
      }

      free(v17);
      xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 40));
      xpc_dictionary_set_string(reply, "result", "OK");
      xpc_dictionary_set_fd(reply, "fd", v14);
      close(v14);
    }
  }

  xpc_dictionary_send_reply(reply);
}

void sub_10001C290(_Unwind_Exception *a1)
{
}

BOOL sub_10001C2AC(uint64_t a1)
{
  *(void *)&__int128 v1 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v1 + 1) = 0xAAAAAAAAAAAAAAAALL;
  __int128 v6 = v1;
  __int128 v7 = v1;
  xpc_connection_get_audit_token(a1, &v6);
  id v2 = (void *)xpc_copy_entitlement_for_token("com.apple.private.RemoteServiceDiscovery.device-admin", &v6);

  BOOL result = 0;
  if (v2)
  {
    id v3 = (void *)xpc_copy_entitlement_for_token("com.apple.private.RemoteServiceDiscovery.allow-sandbox", &v6);

    if (v3) {
      return 1;
    }
    v5[0] = v6;
    v5[1] = v7;
  }

  return result;
}

void sub_10001C348(uint64_t a1, int a2)
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "heartbeat_requests", 0));
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    if (a2) {
      __int128 v8 = "OK";
    }
    else {
      __int128 v8 = "ERROR";
    }
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(*((void *)&v12 + 1) + 8LL * (void)v9));
        xpc_dictionary_set_string(reply, "result", v8);
        xpc_dictionary_send_reply(reply);

        id v9 = (char *)v9 + 1;
      }

      while (v6 != v9);
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v6);
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "heartbeat_requests"));
  [v11 removeAllObjects];
}

void sub_10001C4A0(uint64_t a1, int a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2)
  {
    id v3 = sub_100018AD0(v2, a2);
    uint64_t v4 = objc_claimAutoreleasedReturnValue(v3);
  }

  else
  {
    id reply = xpc_dictionary_create_reply(v2);
    xpc_dictionary_set_string(reply, "result", "OK");
    uint64_t v4 = (uint64_t)reply;
  }

  id v6 = (id)v4;
  xpc_dictionary_send_reply(v4);
}

BOOL sub_10001C4F8(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = (const char *)[v4 entitlement];
  if (!v5) {
    sub_10002AE74(&v13, v14);
  }
  id v6 = v5;
  if (!strcmp(v5, "None-AppleInternal") || sub_10001BFC4(v6)) {
    goto LABEL_7;
  }
  if (xpc_get_type(v3) != (xpc_type_t)&_xpc_type_dictionary) {
    sub_10002AEDC(&v13, v14);
  }
  *(void *)&__int128 v7 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v14[0] = v7;
  v14[1] = v7;
  xpc_dictionary_get_audit_token(v3, v14);
  __int128 v8 = (void *)xpc_copy_entitlement_for_token("com.apple.private.RemoteServiceDiscovery.device-admin", v14);

  if (v8
    || (id v9 = (void *)xpc_copy_entitlement_for_token("com.apple.private.network.intcoproc.restricted", v14),
        v9,
        v9))
  {
LABEL_7:
    BOOL v10 = 1LL;
  }

  else
  {
    __int128 v12 = (void *)xpc_copy_entitlement_for_token(v6, v14);
    BOOL v10 = v12 != 0LL;
  }

  return v10;
}

BOOL sub_10001C630(void *a1)
{
  id v1 = a1;
  if (xpc_get_type(v1) != (xpc_type_t)&_xpc_type_dictionary) {
    sub_10002AEDC(&v6, v7);
  }
  *(void *)&__int128 v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v7[0] = v2;
  v7[1] = v2;
  xpc_dictionary_get_audit_token(v1, v7);
  id v3 = (void *)xpc_copy_entitlement_for_token("com.apple.private.RemoteServiceDiscovery.device-admin", v7);
  BOOL v4 = v3 != 0LL;

  return v4;
}

id sub_10001C6DC(uint64_t a1, int a2)
{
  if (a2)
  {
    BOOL v4 = (os_log_s *)qword_100043198;
    if (os_log_type_enabled((os_log_t)qword_100043198, OS_LOG_TYPE_ERROR)) {
      sub_10002AF44(a2, v4);
    }
  }

  return [*(id *)(a1 + 32) disconnect];
}

id sub_10001C738(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  unsigned int uint64 = xpc_dictionary_get_uint64(v4, "device_type");
  string = xpc_dictionary_get_string(v4, "device_name");
  uuid = xpc_dictionary_get_uuid(v4, "UUID");
  __int128 v8 = xpc_dictionary_get_string(v4, "trust_level");
  BOOL v9 = uint64 != 0;
  if (string) {
    int v10 = v9 + 1;
  }
  else {
    int v10 = uint64 != 0;
  }
  if (uuid) {
    ++v10;
  }
  if (v10 != 1)
  {
    __int128 v15 = (os_log_s *)qword_100043198;
    if (os_log_type_enabled((os_log_t)qword_100043198, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)xpc_object_t v46 = 67109632;
      *(_DWORD *)&v46[4] = v9;
      LOWORD(v47) = 1024;
      *(_DWORD *)((char *)&v47 + 2) = string != 0LL;
      HIWORD(v47) = 1024;
      LODWORD(v4_Block_object_dispose(va, 8) = uuid != 0LL;
      _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "GET query with invalid criteria (t:%d n:%d u:%d)",  v46,  0x14u);
    }

    id v16 = sub_100005054(v4, "ERROR");
    uint64_t v14 = objc_claimAutoreleasedReturnValue(v16);
    goto LABEL_15;
  }

  uint64_t v11 = v8;
  if (uuid || !v8)
  {
    BOOL v18 = v8 != 0LL;
    BOOL v19 = sub_10001C2AC((uint64_t)v3);
    *(void *)xpc_object_t v46 = 0LL;
    __int128 v47 = v46;
    uint64_t v48 = 0x3032000000LL;
    __int128 v49 = sub_10001CC74;
    __int128 v50 = sub_10001CC84;
    id v51 = 0LL;
    uint64_t v36 = 0LL;
    uint64_t v37 = (uint8_t *)&v36;
    uint64_t v38 = 0x3032000000LL;
    xpc_object_t v39 = sub_10001CC74;
    id v40 = sub_10001CC84;
    id v41 = 0LL;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_10001CC8C;
    v32[3] = &unk_10003D620;
    unsigned int v33 = uint64;
    BOOL v34 = v19;
    v32[6] = string;
    v32[7] = uuid;
    v32[4] = &v36;
    v32[5] = v46;
    BOOL v35 = v18;
    sub_100006400(v32);
    if (v11)
    {
      if (!strcmp(v11, "trusted"))
      {
        id v21 = v37;
        goto LABEL_23;
      }

      if (strcmp(v11, "untrusted")) {
        goto LABEL_28;
      }
    }

    else
    {
      id v20 = (void *)*((void *)v37 + 5);
      if (v20) {
        goto LABEL_24;
      }
    }

    id v21 = v47;
LABEL_23:
    id v20 = (void *)*((void *)v21 + 5);
LABEL_24:
    id v22 = v20;
    if (v22)
    {
      uint64_t v23 = v22;
      xpc_object_t reply = xpc_dictionary_create_reply(v4);
      xpc_dictionary_set_string(reply, "result", "OK");
      id v24 = [v23 copyClientDescriptionWithSensitiveProperties:v19];
      xpc_dictionary_set_value(reply, "device", v24);

      id v25 = sub_100013A90(v3);
      __int16 v26 = (os_log_s *)(id)qword_100043198;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        unsigned int v27 = [v23 type];
        *(_DWORD *)__int128 buf = 67109378;
        unsigned int v43 = v27;
        __int16 v44 = 2080;
        xpc_object_t v45 = v25;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_INFO,  "device_get_unique: Returning device of type %d (client=%s)",  buf,  0x12u);
      }

      free(v25);
LABEL_31:
      _Block_object_dispose(&v36, 8);

      _Block_object_dispose(v46, 8);
      goto LABEL_32;
    }

void sub_10001CB7C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29)
{
}

void sub_10001CBC8(id a1, OS_xpc_object *a2)
{
  __int128 v2 = a2;
  if (!v2) {
    sub_10002B038(&v6, v7);
  }
  xpc_object_t xdict = v2;

  xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(xdict);
  id v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
  xpc_connection_send_message(v4, xdict);
}

uint64_t sub_10001CC54(uint64_t a1, uint64_t a2)
{
  return 1LL;
}

uint64_t sub_10001CC74(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10001CC84(uint64_t a1)
{
}

uint64_t sub_10001CC8C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(_DWORD *)(a1 + 64))
  {
    if ([v3 type] != *(_DWORD *)(a1 + 64))
    {
LABEL_3:
      id v5 = 0LL;
      goto LABEL_20;
    }

    goto LABEL_14;
  }

  if (*(void *)(a1 + 48))
  {
    if (strcmp((const char *)objc_msgSend(v3, "device_name"), *(const char **)(a1 + 48))
      && (!objc_msgSend(v4, "device_alias")
       || strcmp((const char *)objc_msgSend(v4, "device_alias"), *(const char **)(a1 + 48))))
    {
      uint64_t v6 = sub_10001CF20(v4, "HWModel", *(unsigned __int8 *)(a1 + 68));
      __int128 v7 = v6;
      if (v6 && strcasestr(v6, *(const char **)(a1 + 48)))
      {
        id v5 = v4;
        __int128 v8 = 0LL;
        BOOL v9 = 0LL;
        int v10 = 0LL;
        goto LABEL_35;
      }

      __int128 v15 = sub_10001CF20(v4, "ProductType", *(unsigned __int8 *)(a1 + 68));
      int v10 = v15;
      if (v15 && strcasestr(v15, *(const char **)(a1 + 48)))
      {
        BOOL v9 = 0LL;
      }

      else
      {
        id v16 = sub_10001CF20(v4, "UniqueDeviceID", *(unsigned __int8 *)(a1 + 68));
        BOOL v9 = v16;
        if (!v16 || !strcasestr(v16, *(const char **)(a1 + 48)))
        {
          id v17 = sub_10001CF20(v4, "SerialNumber", *(unsigned __int8 *)(a1 + 68));
          __int128 v8 = v17;
          uint64_t v18 = sub_10001CFD0(v4, *(unsigned __int8 *)(a1 + 68));
          if (v18)
          {
            id v5 = 0LL;
          }

          else
          {
            id v5 = 0LL;
          }

LABEL_34:
          if (!v7)
          {
LABEL_36:
            if (v10) {
              free(v10);
            }
            if (v9) {
              free(v9);
            }
            if (v8) {
              free(v8);
            }
            goto LABEL_15;
          }

          __break(0x5519u);
          return result;
        }

        uint64_t v12 = 786432LL;
      }

      else
      {
        if (v7 != 16) {
          goto LABEL_30;
        }
        if (*(void *)v8 != 0x2D20656761766153LL || *(void *)(v8 + 8) != 0x79726F7463614620LL) {
          goto LABEL_30;
        }
        uint64_t v12 = 3LL;
      }

      uint64_t v13 = v12 & 0xFFFF0000FFFFFFFFLL | 0x30000000000LL;
    }

    *a2 = v10 | v13;
    goto LABEL_30;
  }

  return result;
}

LABEL_35:
          free(v7);
          goto LABEL_36;
        }
      }

      __int128 v8 = 0LL;
LABEL_33:
      id v5 = v4;
      goto LABEL_34;
    }
  }

  else if (!*(void *)(a1 + 56) {
         || ![v3 uuid]
  }
         || uuid_compare(*(const unsigned __int8 **)(a1 + 56), (const unsigned __int8 *)[v4 uuid]))
  {
    goto LABEL_3;
  }

LABEL_14:
  id v5 = v4;
LABEL_15:
  if (v5)
  {
    else {
      uint64_t v11 = *(void *)(a1 + 40);
    }
    objc_storeStrong((id *)(*(void *)(v11 + 8) + 40LL), v5);
  }

  id v20 = v66;
  BOOL v19 = v67;
  if (v67 < v66) {
    goto LABEL_186;
  }
  id v21 = v70;
  if (v70 > v67 - v66) {
    goto LABEL_186;
  }
  *(void *)(a1 + 136) = v66;
  *(void *)(a1 + 144) = v21;
  if (__CFADD__(v20, v21)) {
    goto LABEL_187;
  }
  id v22 = v20 + v21;
  if (v20 > v22 || v22 > v19) {
    goto LABEL_186;
  }
  BOOL v66 = v22;
  id v24 = v66;
  uint64_t v23 = v67;
  if (v67 < v66) {
    goto LABEL_186;
  }
  id v25 = v70;
  if (v70 > v67 - v66) {
    goto LABEL_186;
  }
  *(void *)(a1 + 120) = v66;
  *(void *)(a1 + 12_Block_object_dispose(va, 8) = v25;
  if (__CFADD__(v24, v25)) {
    goto LABEL_187;
  }
  __int16 v26 = v24 + v25;
  if (v24 > v26 || v26 > v23) {
    goto LABEL_186;
  }
  BOOL v66 = v26;
  id v28 = v66;
  unsigned int v27 = v67;
  if (v67 < v66) {
    goto LABEL_186;
  }
  id v29 = v70;
  if (v70 > v67 - v66) {
    goto LABEL_186;
  }
  *(void *)(a1 + 72) = v66;
  *(void *)(a1 + 80) = v29;
  if (__CFADD__(v28, v29)) {
    goto LABEL_187;
  }
  id v30 = v28 + v29;
  if (v28 > v30 || v30 > v27) {
    goto LABEL_186;
  }
  BOOL v66 = v30;
  id v31 = v66;
  id v32 = v67;
  if (v67 < v66) {
    goto LABEL_186;
  }
  unsigned int v33 = v70;
  if (v70 > v67 - v66) {
    goto LABEL_186;
  }
  *(void *)(a1 + 104) = v66;
  *(void *)(a1 + 112) = v33;
  if (__CFADD__(v31, v33)) {
    goto LABEL_187;
  }
  BOOL v34 = v31 + v33;
  if (v31 > v31 + v33 || v34 > v32) {
    goto LABEL_186;
  }
  BOOL v66 = v31 + v33;
  BOOL result = ccder_blob_decode_tl(&v66, 0x2000000000000010LL, &v70);
  if (!(_DWORD)result) {
    return 720922LL;
  }
  BOOL v35 = v66;
  uint64_t v36 = v70;
  uint64_t v37 = v66 - v34 + v70;
  if (!__CFADD__(v66 - v34, v70))
  {
    if (v37 > v32 - v34) {
      goto LABEL_186;
    }
    *(void *)(a1 + 8_Block_object_dispose(va, 8) = v34;
    *(void *)(a1 + 96) = v37;
    if (__CFADD__(v35, v36)) {
      goto LABEL_187;
    }
    uint64_t v38 = v35 + v36;
    if (v35 > v38 || v38 > v67) {
      goto LABEL_186;
    }
    uint64_t v65 = v67;
    BOOL v66 = v38;
    uint64_t v64 = v38;
    if ((ccder_blob_decode_tl(&v64, 0x8000000000000001LL, &v70) & 1) != 0) {
      return 720923LL;
    }
    if (v66 > v67) {
      goto LABEL_186;
    }
    uint64_t v64 = v66;
    uint64_t v65 = v67;
    if ((ccder_blob_decode_tl(&v64, 0x8000000000000002LL, &v70) & 1) != 0) {
      return 720924LL;
    }
    if (v66 > v67) {
      goto LABEL_186;
    }
    uint64_t v64 = v66;
    uint64_t v65 = v67;
    if (ccder_blob_decode_tl(&v64, 0xA000000000000003LL, &v70))
    {
      uint64_t v62 = 0xAAAAAAAAAAAAAAAALL;
      id v63 = 0xAAAAAAAAAAAAAAAALL;
      if (__CFADD__(v64, v70)) {
        goto LABEL_187;
      }
      if (v64 > v64 + v70 || v64 + v70 > v65) {
        goto LABEL_186;
      }
      uint64_t v62 = v64;
      id v63 = v64 + v70;
      xpc_object_t v39 = v62;
      if (__CFADD__(v62, v70)) {
LABEL_187:
      }
        __break(0x5513u);
      id v40 = v62 + v70;
      if (v62 > v62 + v70 || v40 > v63) {
        goto LABEL_186;
      }
      id v63 = v62 + v70;
      *(_BYTE *)(a1 + 266) = 0;
      memset(&v72[2], 0, 128);
      if (a3) {
        id v41 = a4 == 0;
      }
      else {
        id v41 = 1;
      }
      id v42 = !v41;
      memset(v72, 0, 32);
      if (v39 < v40)
      {
        id v55 = 0;
        unsigned int v43 = 0;
        do
        {
          uint64_t v60 = 0xAAAAAAAAAAAAAAAALL;
          uint64_t v61 = 0xAAAAAAAAAAAAAAAALL;
          uint64_t v59 = 0;
          __int128 v58 = 0LL;
          if ((ccder_blob_decode_tl(&v62, 0x2000000000000010LL, &v58) & 1) == 0) {
            return 720926LL;
          }
          xpc_connection_t v56 = 0xAAAAAAAAAAAAAAAALL;
          __int128 v57 = 0xAAAAAAAAAAAAAAAALL;
          if (__CFADD__(v62, v58)) {
            goto LABEL_187;
          }
          if (v62 > v62 + v58 || v62 + v58 > v63) {
            goto LABEL_186;
          }
          xpc_connection_t v56 = v62;
          __int128 v57 = v62 + v58;
          if (v57 < v56 || v70 > v57 - v56) {
            goto LABEL_186;
          }
          uint64_t v60 = v56;
          uint64_t v61 = v70;
          if (__CFADD__(v56, v70)) {
            goto LABEL_187;
          }
          if (v56 > v56 + v70 || v56 + v70 > v57) {
            goto LABEL_186;
          }
          v56 += v70;
          if (__CFADD__(v56, v70)) {
            goto LABEL_187;
          }
          if (v57 != v56 + v70) {
            return 720929LL;
          }
          if (v42 && !compare_octet_string_raw((uint64_t)&v60, a3, a4))
          {
            if (v57 < v56) {
              goto LABEL_186;
            }
            xpc_object_t v45 = v70;
            if (v70 > v57 - v56) {
              goto LABEL_186;
            }
            *(void *)(a1 + 24_Block_object_dispose(va, 8) = v56;
            *(void *)(a1 + 256) = v45;
          }

          if (v61 == 3)
          {
            if (*(_WORD *)v60 == 7509 && *(_BYTE *)(v60 + 2) == 15)
            {
              uint64_t v18 = 720930LL;
              v43 |= 1u;
              goto LABEL_155;
            }

            if (*(_WORD *)v60 == 7509 && *(_BYTE *)(v60 + 2) == 19)
            {
              uint64_t v18 = 720931LL;
              v43 |= 2u;
              goto LABEL_155;
            }

            if (*(_WORD *)v60 == 7509 && *(_BYTE *)(v60 + 2) == 35)
            {
              uint64_t v18 = 720932LL;
              if ((v43 & 4) != 0
                || (sub_10002248C(&v56, (unint64_t *)(a1 + 168), (unint64_t *)(a1 + 176)) & 1) == 0)
              {
                return v18;
              }

              v43 |= 4u;
              goto LABEL_155;
            }

            if (*(_WORD *)v60 == 7509 && *(_BYTE *)(v60 + 2) == 14)
            {
              uint64_t v18 = 720933LL;
              if ((v43 & 8) != 0
                || (sub_1000225B0(&v56, (unint64_t *)(a1 + 184), (unint64_t *)(a1 + 192)) & 1) == 0)
              {
                return v18;
              }

              v43 |= 8u;
              goto LABEL_155;
            }

            if (*(_WORD *)v60 == 7509 && *(_BYTE *)(v60 + 2) == 37)
            {
              uint64_t v18 = 720934LL;
              if ((v43 & 0x10) != 0
                || (sub_100022670(&v56, (unint64_t *)(a1 + 208), (unint64_t *)(a1 + 216)) & 1) == 0)
              {
                return v18;
              }

              v43 |= 0x10u;
              goto LABEL_155;
            }

            if (*(_WORD *)v60 == 7509 && *(_BYTE *)(v60 + 2) == 17)
            {
              uint64_t v18 = 720935LL;
              if ((v43 & 0x20) != 0
                || (sub_10002277C(&v56, (unint64_t *)(a1 + 224), (unint64_t *)(a1 + 232)) & 1) == 0)
              {
                return v18;
              }

              v43 |= 0x20u;
              goto LABEL_155;
            }
          }

          else if (v61 >= 8 && *(_DWORD *)v60 == -2042067414 && *(_DWORD *)(v60 + 3) == 1684273030)
          {
            uint64_t v18 = 720936LL;
            BOOL result = sub_1000228D4( (uint64_t)&v56,  v60,  v61,  (unint64_t *)(a1 + 240),  (unint64_t *)(a1 + 248),  v42);
            if (!(_DWORD)result) {
              return v18;
            }
            if (v55 == 0xFF) {
              goto LABEL_189;
            }
            ++v55;
            goto LABEL_155;
          }

          if (__CFADD__(v56, v70)) {
            goto LABEL_187;
          }
          if (v56 > v56 + v70 || v56 + v70 > v57) {
            goto LABEL_186;
          }
          v56 += v70;
          if (v59) {
            *(_BYTE *)(a1 + 266) = 1;
          }
LABEL_155:
          if (v56 != v57) {
            return 720926LL;
          }
          if (__CFADD__(v62, v58)) {
            goto LABEL_187;
          }
          xpc_object_t v39 = v62 + v58;
          if (v62 > v62 + v58) {
            goto LABEL_186;
          }
          id v40 = v63;
          if (v39 > v63) {
            goto LABEL_186;
          }
          v62 += v58;
        }

        while (v39 < v63);
      }

      if (v39 != v40) {
        return 720925LL;
      }
      if (v39 > v67 || v66 > v39) {
        goto LABEL_186;
      }
      BOOL v66 = v39;
    }

    if (*(void *)(a1 + 32) < 3uLL)
    {
      uint64_t v18 = 720915LL;
      if (v66 != v67) {
        return v18;
      }
LABEL_170:
      if (__CFADD__(v68, v71)) {
        goto LABEL_187;
      }
      if (v68 > v68 + v71 || v68 + v71 > v69) {
        goto LABEL_186;
      }
      v68 += v71;
      *(void *)&v72[0] = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v72[0] + 1) = 0xAAAAAAAAAAAAAAAALL;
      uint64_t v62 = 0LL;
      BOOL result = ccder_blob_decode_bitstring(&v68, v72, &v62);
      if (!(_DWORD)result) {
        return 720938LL;
      }
      if (v62 < 0xFFFFFFFFFFFFFFF9LL)
      {
        if (*((void *)&v72[0] + 1) >= *(void *)&v72[0])
        {
          __int128 v53 = (v62 + 7) >> 3;
          if (v53 <= *((void *)&v72[0] + 1) - *(void *)&v72[0])
          {
            *(void *)(a1 + 56) = *(void *)&v72[0];
            *(void *)(a1 + 64) = v53;
            __int128 v54 = v69;
            if (v68 <= v69)
            {
              uint64_t v18 = 0LL;
              *a2 = v68;
              a2[1] = v54;
              return v18;
            }
          }
        }

        goto LABEL_186;
      }

      goto LABEL_188;
    }

    if (v67 <= a2[1] && *a2 <= v67)
    {
      *a2 = v67;
      goto LABEL_170;
    }

char *sub_10001CF20(void *a1, const char *a2, int a3)
{
  id v5 = a1;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "public_properties"));
  xpc_object_t value = xpc_dictionary_get_value(v6, a2);
  __int128 v8 = (void *)objc_claimAutoreleasedReturnValue(value);

  if (!v8 && a3)
  {
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v5 properties]);
    xpc_object_t v10 = xpc_dictionary_get_value(v9, a2);
    __int128 v8 = (void *)objc_claimAutoreleasedReturnValue(v10);
  }

  if (v8 && (string_ptr = xpc_string_get_string_ptr(v8)) != 0LL) {
    uint64_t v12 = strdup(string_ptr);
  }
  else {
    uint64_t v12 = 0LL;
  }

  return v12;
}

uint64_t sub_10001CFD0(void *a1, int a2)
{
  id v3 = a1;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "public_properties"));
  xpc_object_t value = xpc_dictionary_get_value(v4, "LocationID");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(value);

  if (!v6 && a2)
  {
    __int128 v7 = (void *)objc_claimAutoreleasedReturnValue([v3 properties]);
    xpc_object_t v8 = xpc_dictionary_get_value(v7, "LocationID");
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v8);
  }

  return v9;
}

void sub_10001D074(uint64_t a1)
{
  __int128 v2 = (sec_identity *)sub_100014F60();
  CFTypeRef cf = 0LL;
  SecKeyRef privateKeyRef = 0LL;
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_string(reply, "result", "ERROR");
  if (!v2)
  {
    uint64_t v6 = sub_100013A90(*(_xpc_connection_s **)(a1 + 40));
    if (os_log_type_enabled((os_log_t)qword_100043198, OS_LOG_TYPE_ERROR)) {
      sub_10002B0A0();
    }
    id v5 = 0LL;
    goto LABEL_11;
  }

  id v5 = sec_identity_copy_ref(v2);
  if (SecIdentityCopyPrivateKey(v5, &privateKeyRef))
  {
    uint64_t v6 = sub_100013A90(*(_xpc_connection_s **)(a1 + 40));
    if (os_log_type_enabled((os_log_t)qword_100043198, OS_LOG_TYPE_ERROR)) {
      sub_10002B280();
    }
LABEL_11:
    CFDictionaryRef v7 = 0LL;
LABEL_12:
    id v8 = 0LL;
LABEL_13:
    free(v6);
    uint64_t v9 = 0LL;
    xpc_object_t v10 = v5;
    goto LABEL_14;
  }

  if (SecIdentityCopyCertificate(v5, (SecCertificateRef *)&cf))
  {
    uint64_t v6 = sub_100013A90(*(_xpc_connection_s **)(a1 + 40));
    if (os_log_type_enabled((os_log_t)qword_100043198, OS_LOG_TYPE_ERROR)) {
      sub_10002B220();
    }
    goto LABEL_11;
  }

  CFDictionaryRef v11 = SecKeyCopyAttributes(privateKeyRef);
  CFDictionaryRef v7 = v11;
  if (!v11)
  {
    uint64_t v6 = sub_100013A90(*(_xpc_connection_s **)(a1 + 40));
    if (os_log_type_enabled((os_log_t)qword_100043198, OS_LOG_TYPE_ERROR)) {
      sub_10002B100();
    }
    goto LABEL_11;
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", kSecAttrTokenOID));
  if (!v12)
  {
    uint64_t v6 = sub_100013A90(*(_xpc_connection_s **)(a1 + 40));
    if (os_log_type_enabled((os_log_t)qword_100043198, OS_LOG_TYPE_ERROR)) {
      sub_10002B160();
    }
    goto LABEL_12;
  }

  id v8 = v12;
  xpc_dictionary_set_data(empty, "identity_key", [v8 bytes], (size_t)objc_msgSend(v8, "length"));
  CFDataRef v13 = SecCertificateCopyData((SecCertificateRef)cf);
  if (!v13)
  {
    uint64_t v6 = sub_100013A90(*(_xpc_connection_s **)(a1 + 40));
    if (os_log_type_enabled((os_log_t)qword_100043198, OS_LOG_TYPE_ERROR)) {
      sub_10002B1C0();
    }
    goto LABEL_13;
  }

  uint64_t v9 = v13;
  xpc_dictionary_set_data( empty,  "identity_cert",  -[__CFData bytes](v9, "bytes"),  (size_t)-[__CFData length](v9, "length"));
  xpc_dictionary_set_value(reply, "identity", empty);
  xpc_object_t v10 = v5;
  xpc_dictionary_set_string(reply, "result", "OK");
LABEL_14:
  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();

  if (cf) {
    CFRelease(cf);
  }
  if (privateKeyRef) {
    CFRelease(privateKeyRef);
  }
  if (v10) {
    CFRelease(v10);
  }
}

void sub_10001D3D8( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, CFTypeRef cf, CFTypeRef a10)
{
  if (cf) {
    CFRelease(cf);
  }
  if (a10) {
    CFRelease(a10);
  }
  if (v10) {
    CFRelease(v10);
  }
  _Unwind_Resume(exception_object);
}

void sub_10001D450(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

double sub_10001D474(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  double result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

uint64_t sub_10001D490(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(void *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2080;
  *(void *)(a3 + 14) = a2;
  return result;
}

id sub_10001D718()
{
  if (qword_1000431C0 != -1) {
    dispatch_once(&qword_1000431C0, &stru_10003D720);
  }
  return (id)qword_1000431B8;
}

uint64_t sub_10001D758(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  *(unsigned int *)(a1 + 40));
}

uint64_t sub_10001D76C(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

void sub_10001DBC8(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2 == 3)
  {
    id v19 = sub_10001D718();
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10002B5DC((uint64_t)v5, v20, v21, v22, v23, v24, v25, v26);
    }

    nw_error_domain_t error_domain = nw_error_get_error_domain(v5);
    int error_code = nw_error_get_error_code(v5);
    if (error_domain == nw_error_domain_dns && (error_code == -65563 || error_code == -65568))
    {
      nw_listener_cancel(*(nw_listener_t *)(*(void *)(a1 + 32) + 16LL));
      dispatch_time_t v29 = dispatch_time(0LL, 5000000000LL);
      uint64_t v30 = *(void *)(a1 + 32);
      id v31 = *(void **)(a1 + 40);
      id v32 = *(dispatch_queue_s **)(v30 + 24);
      v40[0] = _NSConcreteStackBlock;
      v40[2] = sub_10001DEDC;
      v40[3] = &unk_10003D698;
      v40[1] = 3221225472LL;
      v40[4] = v30;
      __int128 v43 = *(_OWORD *)(a1 + 56);
      uint64_t v44 = *(void *)(a1 + 72);
      id v41 = v31;
      id v42 = *(id *)(a1 + 48);
      dispatch_after(v29, v32, v40);
    }
  }

  else if (a2 == 2)
  {
    id v6 = sub_10001D718();
    CFDictionaryRef v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = (void *)nw_listener_copy_local_endpoint(*(void *)(*(void *)(a1 + 32) + 16LL));
      *(_DWORD *)__int128 buf = 138412802;
      uint64_t v46 = (uint64_t)v8;
      __int16 v47 = 1024;
      int v48 = 2;
      __int16 v49 = 2112;
      __int128 v50 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "listening on %@ (state %u, error %@)",  buf,  0x1Cu);
    }

    int port = nw_listener_get_port(*(nw_listener_t *)(*(void *)(a1 + 32) + 16LL));
    if (port)
    {
      int v10 = port;
      id v11 = sub_10001D718();
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 67109120;
        LODWORD(v46) = v10;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "listener port: %u", buf, 8u);
      }

      uint64_t v13 = nw_listener_copy_local_endpoint(*(void *)(*(void *)(a1 + 32) + 16LL));
      uint64_t v14 = (void *)v13;
      if (v13)
      {
        uint64_t description = nw_endpoint_get_description(v13);
        if (description)
        {
          uint64_t v16 = description;
          id v17 = sub_10001D718();
          uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)__int128 buf = 136315138;
            uint64_t v46 = v16;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "listener local endpoint: %s", buf, 0xCu);
          }
        }
      }

_BYTE *sub_10001DEDC(void *a1)
{
  double result = (_BYTE *)a1[4];
  if (!result[32]) {
    return [result listenOnBonjourName:a1[7] type:a1[8] domain:a1[9] configureTLS:a1[5] connectionHandler:a1[6]];
  }
  return result;
}

void sub_10001DF00(id a1, OS_nw_endpoint *a2, BOOL a3)
{
  BOOL v3 = a3;
  id v4 = a2;
  id v5 = sub_10001D718();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    CFDictionaryRef v7 = "removed";
    if (v3) {
      CFDictionaryRef v7 = "added";
    }
    int v8 = 138412546;
    uint64_t v9 = v4;
    __int16 v10 = 2080;
    id v11 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "advertised endpoint %@ %s",  (uint8_t *)&v8,  0x16u);
  }
}

void sub_10001E088(id a1)
{
  os_log_t v1 = os_log_create("com.apple.RemoteServiceDiscovery", "listener");
  __int128 v2 = (void *)qword_1000431B8;
  qword_1000431B8 = (uint64_t)v1;
}

nw_parameters *sub_10001E3A0(uint64_t a1, int a2)
{
  nw_parameters_t secure_tcp = nw_parameters_create_secure_tcp( _nw_parameters_configure_protocol_disable,  _nw_parameters_configure_protocol_default_configuration);
  if (!(_DWORD)a1) {
    sub_10002B350(&v11, v12);
  }
  id v5 = secure_tcp;
  id v6 = (nw_interface *)nw_interface_create_with_index(a1);
  if (v6)
  {
    nw_parameters_require_interface(v5, v6);
    nw_parameters_set_local_only(v5, 1);
    nw_parameters_set_required_address_family(v5, 30LL);
    nw_parameters_set_required_interface_type(v5, nw_interface_type_wired);
    nw_parameters_set_no_fallback(v5, 1LL);
    nw_parameters_set_indefinite(v5, 0LL);
    xpc_remote_connection_setup_nw_parameters(v5, a2);
    CFDictionaryRef v7 = v5;
  }

  else
  {
    id v8 = sub_10001E4D4();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10002B4C4(v9);
    }

    CFDictionaryRef v7 = 0LL;
  }

  return v7;
}

id sub_10001E4D4()
{
  if (qword_1000431E0 != -1) {
    dispatch_once(&qword_1000431E0, &stru_10003D788);
  }
  return (id)qword_1000431D8;
}

void sub_10001E514(void *a1)
{
  id v1 = a1;
  __int128 v2 = (void *)objc_claimAutoreleasedReturnValue([v1 interface]);
  objc_msgSend(v1, "setBackendProperty:withUint:", "InterfaceIndex", objc_msgSend(v2, "index"));

  id v3 = (id)objc_claimAutoreleasedReturnValue([v1 interface]);
  objc_msgSend(v1, "setBackendProperty:withString:", "InterfaceName", objc_msgSend(v3, "name"));
}

BOOL sub_10001E594()
{
  if (qword_1000431D0 != -1) {
    dispatch_once(&qword_1000431D0, &stru_10003D740);
  }
  return (byte_1000431C8 & 1) == 0;
}

void sub_10001E5DC(id a1)
{
  uint64_t v1 = 0LL;
}

uint64_t sub_10001E914(uint64_t a1)
{
  if (!a1) {
    sub_10002B8D4(&v2, v3);
  }
  return 33022LL;
}

void sub_10001EDFC(void *a1, uint64_t a2, int a3)
{
  id v5 = sub_10001E4D4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10002BAD4(a3, v6);
  }

  id v7 = a1;
  if (!v7) {
    sub_10002BA6C(&v16, buf);
  }
  id v8 = v7;

  switch(a3)
  {
    case -536870896:
      id v12 = sub_10001E4D4();
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 134217984;
        *(void *)&uint8_t buf[4] = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[%p] kIOMessageServiceIsTerminated",  buf,  0xCu);
      }

      [v8 deactivate];
      uint64_t v11 = 3LL;
      goto LABEL_18;
    case -536771840:
      id v14 = sub_10001E4D4();
      __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 134217984;
        *(void *)&uint8_t buf[4] = v8;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[%p] kIONetworkLinkStateActive", buf, 0xCu);
      }

      if (![v8 state])
      {
        uint64_t v11 = 1LL;
        goto LABEL_18;
      }

      break;
    case -536771839:
      id v9 = sub_10001E4D4();
      __int16 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 134217984;
        *(void *)&uint8_t buf[4] = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[%p] kIONetworkLinkStateInactive",  buf,  0xCu);
      }

      if ([v8 state] != (id)3)
      {
        uint64_t v11 = 0LL;
LABEL_18:
        [v8 advanceState:v11];
      }

      break;
  }
}

id sub_10001F474(uint64_t a1)
{
  return [*(id *)(a1 + 32) addressWithRetry];
}

id sub_10001F7E8(uint64_t a1)
{
  return [*(id *)(a1 + 32) addressWithRetry];
}

uint64_t sub_10001F7F0(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

uint64_t sub_10001F800(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

uint64_t sub_10001F810(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void sub_10001FA38(id a1)
{
  os_log_t v1 = os_log_create("com.apple.RemoteServiceDiscovery", "ncm_common");
  uint64_t v2 = (void *)qword_1000431D8;
  qword_1000431D8 = (uint64_t)v1;
}

void sub_10001FA68()
{
  id v0 = (id)qword_1000431E8;
  if (!v0) {
    sub_100029658(&v5, buf);
  }

  if (dword_100042FF4 == 3)
  {
    if (qword_1000431F8) {
      sub_10002C028(&v5, buf);
    }
    os_log_t v1 = (os_log_s *)qword_1000431F0;
    if (os_log_type_enabled((os_log_t)qword_1000431F0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "Attaching loopback device.", buf, 2u);
    }

    uint64_t v2 = -[RSDRemoteDevice initWithName:]( objc_alloc(&OBJC_CLASS___RSDRemoteLoopbackDevice),  "initWithName:",  "localhost");
    id v3 = (void *)qword_1000431F8;
    qword_1000431F8 = (uint64_t)v2;

    dword_100042FF4 = 1;
    [(id)qword_1000431F8 setBackendProperty:"IsLoopback" withBool:1];
    [(id)qword_1000431F8 attach];
  }

  else
  {
    id v4 = (os_log_s *)qword_1000431F0;
    if (os_log_type_enabled((os_log_t)qword_1000431F0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = dword_100042FF4;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Cannot attach loopback, state = %d", buf, 8u);
    }
  }

void sub_10001FBE0()
{
  id v1 = (id)objc_claimAutoreleasedReturnValue(+[RSDRemoteDevice tlsOidsRequiredOfPeer](&OBJC_CLASS___RSDRemoteLoopbackDevice, "tlsOidsRequiredOfPeer"));
  id v0 = (void *)objc_claimAutoreleasedReturnValue([v1 allObjects]);
  sub_100014A94(v0, &stru_10003D7C0);
}

void sub_10001FC34(id a1)
{
  id v1 = (id)qword_1000431E8;
  if (!v1) {
    sub_100029658(&v14, buf);
  }

  int v2 = dword_100042FF4;
  if (dword_100042FF4 == 1)
  {
    uint64_t v3 = qword_1000431F8;
    if (!qword_1000431F8) {
      sub_10002C090(&v14, buf);
    }
    id v4 = (os_log_s *)qword_1000431F0;
    if (os_log_type_enabled((os_log_t)qword_1000431F0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 138543362;
      *(void *)&uint8_t buf[4] = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%{public}@> Connecting to loopback device",  buf,  0xCu);
    }

    uint64_t version_flags = xpc_remote_connection_get_version_flags();
    id v14 = 0LL;
    *(void *)__int128 buf = 0LL;
    xpc_remote_connection_create_connected_ipv6_pair(buf, &v14, qword_1000431E8, version_flags, 0LL);
    id v6 = *(void **)buf;
    id v7 = *(id *)buf;
    id v8 = v14;
    id v9 = v14;
    objc_storeStrong((id *)&qword_100043200, v6);
    objc_storeStrong((id *)&qword_100043208, v8);
    byte_100043211 = 0;
    [(id)qword_1000431F8 connect:qword_100043208];
    xpc_remote_connection_set_event_handler(qword_100043200, &stru_10003D800);
    if ([(id)qword_1000431F8 tlsEnabled])
    {
      id v10 = sub_100014F60();
      if (!v10) {
        sub_100024DF4(0LL, v11);
      }
      id v12 = v10;
      xpc_remote_connection_set_tls(qword_100043200, v10, &stru_10003D860, qword_1000431E8);
    }

    xpc_remote_connection_activate(qword_100043200);
    dword_100042FF4 = 2;
  }

  else
  {
    uint64_t v13 = (os_log_s *)qword_1000431F0;
    if (os_log_type_enabled((os_log_t)qword_1000431F0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v2;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Cannot connect loopback, state = %d",  buf,  8u);
    }
  }

void sub_10001FE54()
{
  id v0 = (id)qword_1000431E8;
  if (!v0) {
    sub_100029658(&v7, buf);
  }

  if (dword_100042FF4 == 3)
  {
    id v1 = (os_log_s *)qword_1000431F0;
    if (os_log_type_enabled((os_log_t)qword_1000431F0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = dword_100042FF4;
      _os_log_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEFAULT,  "Cannot disconnect loopback, state = %d",  buf,  8u);
    }
  }

  else
  {
    if (!qword_1000431F8) {
      sub_10002C090(&v7, buf);
    }
    int v2 = (os_log_s *)qword_1000431F0;
    if (os_log_type_enabled((os_log_t)qword_1000431F0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 138543362;
      *(void *)&uint8_t buf[4] = qword_1000431F8;
      _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_INFO,  "%{public}@> Disconnecting loopback device",  buf,  0xCu);
    }

    if (dword_100042FF4 == 2)
    {
      if (!qword_100043200) {
        sub_10002C0F8(&v7, buf);
      }
      xpc_remote_connection_cancel();
      uint64_t v3 = (void *)qword_100043200;
      qword_100043200 = 0LL;

      id v4 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_1000431F8 connection]);
      if (v4)
      {
        uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_1000431F8 connection]);
        xpc_remote_connection_cancel();

        [(id)qword_1000431F8 setConnection:0];
      }

      id v6 = (void *)qword_100043208;
      if (!qword_100043208) {
        sub_10002C160(&v7, buf);
      }
      qword_100043208 = 0LL;
    }

    dword_100042FF4 = 3;
    byte_100043210 = 0;
  }

void sub_100020034()
{
  id v0 = (id)qword_1000431E8;
  if (!v0) {
    sub_100029658(&v4, buf);
  }

  if (dword_100042FF4 == 3)
  {
    id v1 = (os_log_s *)qword_1000431F0;
    if (os_log_type_enabled((os_log_t)qword_1000431F0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = dword_100042FF4;
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Cannot detach loopback, state = %d", buf, 8u);
    }
  }

  else
  {
    if (!qword_1000431F8) {
      sub_10002C090(&v4, buf);
    }
    int v2 = (os_log_s *)qword_1000431F0;
    if (os_log_type_enabled((os_log_t)qword_1000431F0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 138543362;
      *(void *)&uint8_t buf[4] = qword_1000431F8;
      _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_INFO,  "%{public}@> Detaching loopback device",  buf,  0xCu);
    }

    sub_10001FE54();
    [(id)qword_1000431F8 disconnect];
    uint64_t v3 = (void *)qword_1000431F8;
    qword_1000431F8 = 0LL;
  }

void sub_100020184()
{
  id v0 = (id)qword_1000431E8;
  if (!v0) {
    sub_100029658(&v3, buf);
  }

  if (dword_100042FF4 == 2)
  {
    if (!qword_1000431F8) {
      sub_10002C090(&v3, buf);
    }
    id v1 = (os_log_s *)qword_1000431F0;
    if (os_log_type_enabled((os_log_t)qword_1000431F0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 138543362;
      *(void *)&uint8_t buf[4] = qword_1000431F8;
      _os_log_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_INFO,  "%{public}@> Suspending loopback device",  buf,  0xCu);
    }

    byte_100043210 = 1;
  }

  else
  {
    int v2 = (os_log_s *)qword_1000431F0;
    if (os_log_type_enabled((os_log_t)qword_1000431F0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = dword_100042FF4;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Cannot suspend loopback, state = %d", buf, 8u);
    }
  }

void sub_1000202D0()
{
  id v0 = (id)qword_1000431E8;
  if (!v0) {
    sub_100029658(&v3, buf);
  }

  if (dword_100042FF4 == 2)
  {
    if (!qword_1000431F8) {
      sub_10002C090(&v3, buf);
    }
    id v1 = (os_log_s *)qword_1000431F0;
    if (os_log_type_enabled((os_log_t)qword_1000431F0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 138543362;
      *(void *)&uint8_t buf[4] = qword_1000431F8;
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "%{public}@> Resuming loopback device", buf, 0xCu);
    }

    byte_100043210 = 0;
    [(id)qword_1000431F8 drainPendedRequests];
  }

  else
  {
    int v2 = (os_log_s *)qword_1000431F0;
    if (os_log_type_enabled((os_log_t)qword_1000431F0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = dword_100042FF4;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Cannot resume loopback, state = %d", buf, 8u);
    }
  }

void sub_100020418()
{
  id v0 = (id)qword_1000431E8;
  if (!v0) {
    sub_100029658(&v4, buf);
  }

  if (dword_100042FF4 == 2)
  {
    if (!qword_1000431F8) {
      sub_10002C090(&v4, buf);
    }
    if (!qword_100043200) {
      sub_10002C0F8(&v4, buf);
    }
    id v1 = (os_log_s *)qword_1000431F0;
    if (os_log_type_enabled((os_log_t)qword_1000431F0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 138543362;
      *(void *)&uint8_t buf[4] = qword_1000431F8;
      _os_log_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_INFO,  "%{public}@> Resetting loopback device",  buf,  0xCu);
    }

    xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_string(v2, "MessageType", "Reset");
    xpc_remote_connection_send_message_with_reply(qword_100043200, v2, qword_1000431E8, &stru_10003D7E0);
  }

  else
  {
    uint64_t v3 = (os_log_s *)qword_1000431F0;
    if (os_log_type_enabled((os_log_t)qword_1000431F0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = dword_100042FF4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Cannot reset loopback, state = %d", buf, 8u);
    }
  }

void sub_1000205B4(id a1, OS_xpc_object *a2)
{
  byte_100043211 = 1;
  id v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v2, "MessageType", "ResetGoahead");
  xpc_remote_connection_send_message(qword_100043200, v2);
}

void sub_100020614(id obj)
{
  id v4 = obj;
  os_log_t v2 = os_log_create("com.apple.RemoteServiceDiscovery", "loopback");
  uint64_t v3 = (void *)qword_1000431F0;
  qword_1000431F0 = (uint64_t)v2;
}

void sub_100020C8C(id a1, OS_xpc_object *a2)
{
  os_log_t v2 = a2;
  if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_error)
  {
    if (byte_100043211 != 1) {
      goto LABEL_18;
    }
    goto LABEL_13;
  }

  string = xpc_dictionary_get_string(v2, "MessageType");
  if (!string)
  {
    id v12 = (os_log_s *)qword_1000431F0;
    if (os_log_type_enabled((os_log_t)qword_1000431F0, OS_LOG_TYPE_ERROR)) {
      sub_10002C5A4(v12, v13, v14, v15, v16, v17, v18, v19);
    }
    sub_100020034();
    goto LABEL_18;
  }

  id v4 = string;
  if (!strcmp(string, "Handshake") || !strcmp(v4, "StartTls"))
  {
    xpc_remote_connection_send_message(qword_100043200, v2);
    goto LABEL_18;
  }

  if (!strcmp(v4, "Heartbeat"))
  {
    uint64_t reply_msg_id = _xpc_dictionary_get_reply_msg_id(v2);
    _xpc_dictionary_set_reply_msg_id(v2, 0LL);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_100020F18;
    v22[3] = &unk_10003D820;
    v22[4] = reply_msg_id;
    xpc_remote_connection_send_message_with_reply(qword_100043200, v2, qword_1000431E8, v22);
    goto LABEL_18;
  }

  if (!strcmp(v4, "Reset"))
  {
    xpc_object_t reply = xpc_dictionary_create_reply(v2);
    xpc_dictionary_set_string(reply, "Result", "Ok");
    xpc_dictionary_send_reply(reply);
LABEL_21:

    goto LABEL_18;
  }

  if (!strcmp(v4, "ResetGoahead"))
  {
LABEL_13:
    sub_10001FE54();
    dword_100042FF4 = 1;
    sub_10001FBE0();
    goto LABEL_18;
  }

  if (!strcmp(v4, "Timesync"))
  {
    xpc_object_t value = xpc_dictionary_get_value(v2, "TimesyncPayload");
    id v6 = (id)objc_claimAutoreleasedReturnValue(value);
    if (!v6) {
      sub_10002C614(&v21, v23);
    }
    xpc_object_t reply = v6;

    id v8 = sub_10000EC20(reply, (void *)qword_1000431F0);
    id v9 = (id)objc_claimAutoreleasedReturnValue(v8);
    if (!v9) {
      sub_10002C67C(&v21, v23);
    }
    id v10 = v9;

    xpc_object_t v11 = xpc_dictionary_create_reply(v2);
    xpc_dictionary_set_value(v11, "TimesyncPayload", v10);
    xpc_dictionary_send_reply(v11);

    goto LABEL_21;
  }

LABEL_18:
}

          __break(0x5519u);
          return result;
        }

void sub_100020F18(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_get_type(v3) != (xpc_type_t)&_xpc_type_error)
  {
    _xpc_dictionary_set_reply_msg_id(v3, *(void *)(a1 + 32));
    _xpc_dictionary_set_remote_connection(v3, qword_100043200);
    xpc_dictionary_send_reply(v3);
  }
}

void sub_100020F80(id a1, OS_sec_protocol_metadata *a2, OS_sec_trust *a3, id a4)
{
  uint64_t v5 = (void *)qword_1000431F8;
  uint64_t v7 = (void (**)(id, uint64_t))a4;
  uint64_t v6 = sub_100014F6C(v5, a3);
  v7[2](v7, v6);
}

void sub_100020FD4( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

int *sub_100021000()
{
  return __error();
}

uint64_t sntp_shortstamp_ntoh(unsigned int a1)
{
  return __rev16(a1);
}

unint64_t sntp_timestamp_hton(unint64_t a1)
{
  return __rev32(a1);
}

unint64_t sntp_timestamp_ntoh(unint64_t a1)
{
  return __rev32(a1);
}

uint64_t sntp_timestamp_to_datestamp(uint64_t result)
{
  return result;
}

unint64_t sntp_timestamp_from_datestamp(unsigned int a1, uint64_t a2)
{
  return a2 & 0xFFFFFFFF00000000LL | a1;
}

uint64_t sntp_datestamp_to_nsec(unint64_t a1, unint64_t a2)
{
  return 1000000000 * a1
}

uint64_t sntp_datestamp_to_timespec(unint64_t a1, unint64_t a2)
{
  return (uint64_t)(1000000000 * a1
                 + __CFADD__(1000000000 * a2, (uint64_t)((__PAIR128__(a1, a2) * 0x3B9ACA00) >> 64) >> 63)
}

uint64_t sntp_datestamp_from_timespec(uint64_t a1, uint64_t a2)
{
  return a1;
}

uint64_t sntp_calc_offset(uint64_t a1)
{
  uint64_t v2 = sntp_timestamp_to_datestamp(*(void *)(a1 + 4));
  uint64_t v4 = v3;
  uint64_t v5 = -v2;
  uint64_t v6 = sntp_timestamp_to_datestamp(*(void *)(a1 + 12));
  uint64_t v8 = v7;
  uint64_t v9 = sntp_timestamp_to_datestamp(*(void *)(a1 + 20));
  uint64_t v11 = v10;
  uint64_t v12 = sntp_timestamp_to_datestamp(*(void *)(a1 + 28));
  unsigned __int128 v14 = __PAIR128__( v5 - (v4 != 0) + __CFADD__(-v4, v8) + v6 + (unint64_t)__CFADD__(v8 - v4, v11) + v9,  v8 - v4 + v11)
      - v13;
  return (__CFADD__((void)v14, (unint64_t)(*((void *)&v14 + 1) - v12) >> 63) + *((void *)&v14 + 1) - v12) >> 1;
}

uint64_t sntp_calc_delay(uint64_t a1)
{
  uint64_t v2 = sntp_timestamp_to_datestamp(*(void *)(a1 + 4));
  uint64_t v4 = v3;
  uint64_t v5 = -v2;
  uint64_t v6 = sntp_timestamp_to_datestamp(*(void *)(a1 + 12));
  uint64_t v8 = v7;
  uint64_t v9 = sntp_timestamp_to_datestamp(*(void *)(a1 + 20));
  unint64_t v11 = v10;
  uint64_t v12 = -v9;
  uint64_t v13 = sntp_timestamp_to_datestamp(*(void *)(a1 + 28));
  return v13
       + ((__PAIR128__(v5 - (v4 != 0) + (unint64_t)__CFADD__(-v4, v8) + v6, v8 - v4) - v11 + __PAIR128__(v12, v14)) >> 64);
}

unint64_t sntp_packet_ntoh@<X0>(__int128 *a1@<X0>, void *a2@<X8>)
{
  __int128 v5 = *a1;
  uint64_t v6 = *((void *)a1 + 2);
  sntp_header_ntoh((int *)&v5, (uint64_t)a2);
  a2[3] = sntp_timestamp_ntoh(*((void *)a1 + 3));
  a2[4] = sntp_timestamp_ntoh(*((void *)a1 + 4));
  unint64_t result = sntp_timestamp_ntoh(*((void *)a1 + 5));
  a2[5] = result;
  return result;
}

unint64_t sntp_header_ntoh@<X0>(int *a1@<X0>, uint64_t a2@<X8>)
{
  int v5 = *a1;
  unsigned int v4 = a1[1];
  *(_DWORD *)a2 = v5;
  *(_DWORD *)(a2 + 4) = sntp_shortstamp_ntoh(v4);
  int v6 = sntp_shortstamp_ntoh(a1[2]);
  unsigned int v7 = bswap32(a1[3]);
  *(_DWORD *)(a2 + _Block_object_dispose(va, 8) = v6;
  *(_DWORD *)(a2 + 12) = v7;
  unint64_t result = sntp_timestamp_ntoh(*((void *)a1 + 2));
  *(void *)(a2 + 16) = result;
  return result;
}

unint64_t sntp_server_respond@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(void)@<X2>, uint64_t a4@<X8>)
{
  unint64_t v8 = a3();
  *(_OWORD *)a4 = *(_OWORD *)a2;
  uint64_t v9 = *(void *)(a1 + 40);
  *(void *)(a4 + 16) = *(void *)(a2 + 16);
  *(void *)(a4 + 24) = v9;
  *(void *)(a4 + 32) = sntp_timestamp_hton(v8);
  unint64_t v10 = a3();
  unint64_t result = sntp_timestamp_hton(v10);
  *(void *)(a4 + 40) = result;
  if (__ROR8__(v10, 32) < __ROR8__(v8, 32))
  {
    *(_BYTE *)(a4 + 1) = 0;
    *(_DWORD *)(a4 + 12) = 1398031696;
  }

  return result;
}

unint64_t sntp_client_process_response@<X0>( unsigned __int8 *a1@<X0>, unint64_t *a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  *(_OWORD *)(a4 + 4_Block_object_dispose(va, 8) = 0u;
  *(_OWORD *)(a4 + 64) = 0u;
  *(_OWORD *)(a4 + 16) = 0u;
  *(_OWORD *)(a4 + 32) = 0u;
  *(_OWORD *)a4 = 0u;
  if (a2)
  {
    unint64_t v8 = *a2;
    *(void *)(a4 + 4) = *a2;
    unint64_t v9 = HIDWORD(v8);
    if (!a3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  LODWORD(v9) = 0;
  LODWORD(v_Block_object_dispose(va, 8) = 0;
  if (a3) {
LABEL_3:
  }
    *(void *)(a4 + 2_Block_object_dispose(va, 8) = *a3;
LABEL_4:
  __int128 v10 = *((_OWORD *)a1 + 1);
  v16[0] = *(_OWORD *)a1;
  v16[1] = v10;
  v16[2] = *((_OWORD *)a1 + 2);
  unint64_t result = sntp_packet_ntoh(v16, v17);
  __int128 v12 = v17[1];
  *(_OWORD *)a1 = v17[0];
  *((_OWORD *)a1 + 1) = v12;
  *((_OWORD *)a1 + 2) = v17[2];
  *(_OWORD *)(a4 + 36) = *(_OWORD *)a1;
  *(void *)(a4 + 52) = *((void *)a1 + 2);
  uint64_t v13 = *((void *)a1 + 4);
  uint64_t v14 = *((void *)a1 + 5);
  *(void *)(a4 + 12) = v13;
  *(void *)(a4 + 20) = v14;
  if (*a1 <= 0xBFu)
  {
    if (a1[1])
    {
      if (__ROR8__(v14, 32) >= __ROR8__(v13, 32))
      {
        if (a2)
        {
          if (*((_DWORD *)a1 + 6) != (_DWORD)v8 || *((_DWORD *)a1 + 7) != (_DWORD)v9)
          {
            int v15 = 10;
            goto LABEL_19;
          }

          if (a3)
          {
            unint64_t result = sntp_calc_delay(a4);
            if ((result & 0x8000000000000000LL) != 0)
            {
              int v15 = 11;
              goto LABEL_19;
            }
          }
        }

        int v15 = 0;
      }

      else
      {
        int v15 = 12;
      }
    }

    else
    {
      int v15 = 8;
    }
  }

  else
  {
    int v15 = 9;
  }

LABEL_19:
  *(_DWORD *)a4 = v15;
  return result;
}

    __break(0x5519u);
LABEL_20:
    __break(0x5513u);
  }

  return v9 == v10 + v11;
}

uint64_t X509PolicyCheckForBlockedKeys(uint64_t a1)
{
  uint64_t result = compare_octet_string(a1 + 88, (uint64_t)&BlockedYonkersSPKI);
  if (!(_DWORD)result) {
    *(void *)(a1 + 240) &= 0xFFFFFFFFFFF3FFFFLL;
  }
  return result;
}

uint64_t compare_octet_string(uint64_t a1, uint64_t a2)
{
  size_t v2 = *(void *)(a1 + 8);
  size_t v3 = *(void *)(a2 + 8);
  if (v2 == v3) {
    return memcmp(*(const void **)a1, *(const void **)a2, v2);
  }
  if (v2 > v3) {
    return 0xFFFFFFFFLL;
  }
  return 1LL;
}

uint64_t compare_octet_string_raw(uint64_t a1, const void *a2, size_t a3)
{
  size_t v3 = *(void *)(a1 + 8);
  if (v3 == a3) {
    return memcmp(*(const void **)a1, a2, a3);
  }
  if (v3 > a3) {
    return 0xFFFFFFFFLL;
  }
  return 1LL;
}

uint64_t ccder_blob_decode_AlgorithmIdentifierNULL(unint64_t *a1, unint64_t *a2)
{
  uint64_t v16 = 0LL;
  unint64_t v15 = 0LL;
  uint64_t result = ccder_blob_decode_tl(a1, 0x2000000000000010LL, &v16);
  if ((_DWORD)result)
  {
    unint64_t v13 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v5 = *a1;
    if (!__CFADD__(*a1, v16))
    {
      if (v5 > v5 + v16 || v5 + v16 > a1[1]) {
        goto LABEL_28;
      }
      unint64_t v13 = *a1;
      unint64_t v14 = v5 + v16;
      uint64_t result = ccder_blob_decode_tl(&v13, 6LL, &v15);
      if (!(_DWORD)result) {
        return result;
      }
      unint64_t v7 = v15;
      unint64_t v8 = v13;
      if (a2)
      {
        if (v14 < v13 || v15 > v14 - v13) {
          goto LABEL_28;
        }
        *a2 = v13;
        a2[1] = v7;
      }

      if (!__CFADD__(v8, v7))
      {
        unint64_t v9 = v8 + v7;
        if (v9 == v14)
        {
          if (v9 <= a1[1] && *a1 <= v9)
          {
            *a1 = v9;
            return 1LL;
          }

uint64_t ccder_blob_check_null(uint64_t a1)
{
  uint64_t v2 = 0LL;
  LODWORD(result) = ccder_blob_decode_tl(a1, 5LL, &v2);
  if (v2) {
    return 0LL;
  }
  else {
    return result;
  }
}

uint64_t CTParseCertificateSet(unint64_t a1, unint64_t a2, _OWORD *a3, uint64_t a4, void *a5)
{
  uint64_t v6 = 0LL;
  if (a1 < a2 && a4)
  {
    uint64_t v8 = 0LL;
    uint64_t v9 = a4 - 1;
    unint64_t v10 = a3;
    unint64_t v11 = (unint64_t)&a3[a4];
    while (1)
    {
      *(void *)&__int128 v12 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v17[17] = v12;
      v17[18] = v12;
      v17[15] = v12;
      v17[16] = v12;
      v17[13] = v12;
      v17[14] = v12;
      v17[11] = v12;
      v17[12] = v12;
      v17[9] = v12;
      v17[10] = v12;
      v17[7] = v12;
      v17[8] = v12;
      _OWORD v17[5] = v12;
      v17[6] = v12;
      _OWORD v17[3] = v12;
      v17[4] = v12;
      v17[1] = v12;
      v17[2] = v12;
      v17[0] = v12;
      unint64_t v15 = a1;
      unint64_t v16 = a2;
      uint64_t result = X509CertificateParse((unint64_t *)v17, &v15);
      if ((_DWORD)result) {
        break;
      }
      a1 = v15;
      a2 = v16;
      _OWORD *v10 = v17[0];
      uint64_t v6 = v8 + 1;
      if (a1 < a2)
      {
        ++v10;
        if (v9 != v8++) {
          continue;
        }
      }

      goto LABEL_11;
    }
  }

  else
  {
LABEL_11:
    uint64_t result = 0LL;
    if (a5) {
      *a5 = v6;
    }
  }

  return result;
}

uint64_t X509CertificateParseImplicit(uint64_t a1, unint64_t *a2, const void *a3, size_t a4)
{
  unint64_t v70 = 0LL;
  uint64_t v71 = 0LL;
  unint64_t v68 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v69 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  if (*a2 > v5) {
    goto LABEL_186;
  }
  uint64_t v10 = 720915LL;
  unint64_t v68 = *a2;
  unint64_t v69 = v5;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 4_Block_object_dispose(va, 8) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 12_Block_object_dispose(va, 8) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 20_Block_object_dispose(va, 8) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 28_Block_object_dispose(va, 8) = 0u;
  uint64_t result = ccder_blob_decode_tl(&v68, 0x2000000000000010LL, &v71);
  if (!(_DWORD)result) {
    return v10;
  }
  uint64_t v12 = v71;
  unint64_t v13 = v68;
  unint64_t v14 = v71 + v68 - v4;
  if (__CFADD__(v71, v68 - v4)) {
    goto LABEL_188;
  }
  if (v14 > v5 - v4) {
    goto LABEL_186;
  }
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v14;
  unint64_t v66 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v67 = 0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(v13, v12)) {
    goto LABEL_187;
  }
  unint64_t v15 = v13 + v12;
  if (v13 > v15 || v15 > v69) {
    goto LABEL_186;
  }
  unint64_t v66 = v13;
  unint64_t v67 = v15;
  unint64_t v64 = v13;
  unint64_t v65 = v15;
  if (ccder_blob_decode_tl(&v64, 0xA000000000000000LL, &v70))
  {
    unint64_t v16 = v70;
    unint64_t v17 = v64;
    if (__CFADD__(v64, v70)) {
      goto LABEL_187;
    }
    uint64_t v18 = 720916LL;
    if (ccder_blob_decode_uint64(&v64, a1 + 32) && v64 == v17 + v16)
    {
      if (v17 + v16 > v65) {
        goto LABEL_186;
      }
      unint64_t v66 = v17 + v16;
      unint64_t v67 = v65;
      goto LABEL_14;
    }

    return v18;
  }

LABEL_186:
    __break(0x5519u);
    goto LABEL_187;
  }

LABEL_188:
  __break(0x5500u);
LABEL_189:
  __break(0x5507u);
  return result;
}

uint64_t sub_1000221E0(unint64_t *a1, int a2, BOOL *a3)
{
  unint64_t v13 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v3 = a1[1];
  if (*a1 > v3) {
    goto LABEL_22;
  }
  unint64_t v13 = (unsigned __int8 *)*a1;
  unint64_t v14 = v3;
  uint64_t v12 = 0LL;
  uint64_t result = ccder_blob_decode_tl(&v13, 1LL, &v12);
  if ((result & 1) != 0)
  {
    if (v12 == 1)
    {
      uint64_t v8 = v13;
      if ((unint64_t)v13 < v14)
      {
        int v9 = *v13;
        if (v9 != 255 && v9 != 0) {
          return 0LL;
        }
        if (a3) {
          *a3 = v9 != 0;
        }
        if (v8 == (unsigned __int8 *)-1LL)
        {
          __break(0x5513u);
          return result;
        }

        unint64_t v11 = v8 + 1;
        if ((unint64_t)v11 <= a1[1] && *a1 <= (unint64_t)v11)
        {
          *a1 = (unint64_t)v11;
          return 1LL;
        }
      }

uint64_t sub_1000222F4(uint64_t a1, _BYTE *a2)
{
  uint64_t v6 = (_BYTE *)0xAAAAAAAAAAAAAAAALL;
  unint64_t v7 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v5 = 0LL;
  uint64_t result = ccder_blob_decode_bitstring(a1, &v6, &v5);
  if ((_DWORD)result)
  {
    if (v7 != *(void *)(a1 + 8) || v6 == (_BYTE *)v7 || v5 > 8)
    {
      return 0LL;
    }

    else if ((unint64_t)v6 >= v7)
    {
      __break(0x5519u);
    }

    else
    {
      *a2 = *v6 & (-1 << (8 - v5));
      return 1LL;
    }
  }

  return result;
}

uint64_t sub_1000223C0(unint64_t *a1, unint64_t *a2, BOOL *a3)
{
  unint64_t v10 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v11 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = ccder_blob_decode_tl(a1, 0x2000000000000010LL, &v11);
  if ((_DWORD)result)
  {
    uint64_t result = sub_1000221E0(a1, 1, a3);
    if ((_DWORD)result)
    {
      uint64_t result = ccder_blob_decode_uint64(a1, &v10);
      if ((_DWORD)result)
      {
        if (!*a3) {
          return 0LL;
        }
        unint64_t v7 = v10;
        *a2 = v10;
        BOOL v8 = __CFADD__(v7, 1LL);
        unint64_t v9 = v7 + 1;
        if (v8)
        {
          __break(0x5500u);
          return result;
        }

        *a2 = v9;
      }

      return 1LL;
    }
  }

  return result;
}

uint64_t sub_10002248C(unint64_t *a1, unint64_t *a2, unint64_t *a3)
{
  unint64_t v13 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = ccder_blob_decode_tl(a1, 0x2000000000000010LL, &v14);
  if ((_DWORD)result)
  {
    unint64_t v7 = *a1;
    if (__CFADD__(*a1, v14)) {
      goto LABEL_15;
    }
    if (v7 + v14 != a1[1]) {
      return 0LL;
    }
    unint64_t v11 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v12 = 0xAAAAAAAAAAAAAAAALL;
    if (v7 > v7 + v14) {
      goto LABEL_16;
    }
    unint64_t v11 = v7;
    unint64_t v12 = v7 + v14;
    uint64_t result = ccder_blob_decode_tl(&v11, 0x8000000000000000LL, &v13);
    if ((_DWORD)result)
    {
      if (v12 < v11) {
        goto LABEL_16;
      }
      unint64_t v8 = v13;
      if (v13 > v12 - v11) {
        goto LABEL_16;
      }
      *a2 = v11;
      *a3 = v8;
    }

    unint64_t v9 = *a1;
    if (__CFADD__(*a1, v14))
    {
LABEL_15:
      __break(0x5513u);
    }

    else
    {
      unint64_t v10 = v9 + v14;
      if (v9 <= v9 + v14 && v10 <= a1[1])
      {
        *a1 = v10;
        return 1LL;
      }
    }

LABEL_16:
    __break(0x5519u);
  }

  return result;
}

uint64_t sub_1000225B0(unint64_t *a1, unint64_t *a2, unint64_t *a3)
{
  unint64_t v17 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = ccder_blob_decode_tl(a1, 4LL, &v17);
  if ((_DWORD)result)
  {
    unint64_t v7 = a1[1];
    unint64_t v8 = v17;
    BOOL v10 = v7 >= *a1;
    unint64_t v9 = v7 - *a1;
    if (v10)
    {
      BOOL v10 = v17 >= v9;
      BOOL v11 = v17 == v9;
    }

    else
    {
      BOOL v10 = 1;
      BOOL v11 = 0;
    }

    if (!v11 && v10) {
      goto LABEL_13;
    }
    *a2 = *a1;
    *a3 = v8;
    unint64_t v12 = *a1;
    if (__CFADD__(*a1, v8))
    {
      __break(0x5513u);
      return result;
    }

    unint64_t v13 = v12 + v8;
    unint64_t v14 = a1[1];
    if (v12 <= v13)
    {
      BOOL v15 = v13 >= v14;
      BOOL v16 = v13 == v14;
    }

    else
    {
      BOOL v15 = 1;
      BOOL v16 = 0;
    }

    if (!v16 && v15) {
LABEL_13:
    }
      __break(0x5519u);
    *a1 = v13;
  }

  return result;
}

uint64_t sub_100022670(unint64_t *a1, unint64_t *a2, unint64_t *a3)
{
  unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v15 = 0xAAAAAAAAAAAAAAAALL;
  int v6 = ccder_blob_decode_tl(a1, 0x2000000000000010LL, &v15);
  uint64_t result = 0LL;
  if (v6 && v15)
  {
    unint64_t v12 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v13 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v8 = a1[1];
    if (*a1 > v8) {
      goto LABEL_12;
    }
    unint64_t v12 = *a1;
    unint64_t v13 = v8;
    uint64_t result = ccder_blob_decode_tl(&v12, 6LL, &v14);
    if (!(_DWORD)result) {
      return result;
    }
    if (v13 < v12) {
      goto LABEL_12;
    }
    unint64_t v9 = v14;
    if (v14 > v13 - v12) {
      goto LABEL_12;
    }
    *a2 = v12;
    *a3 = v9;
    unint64_t v10 = *a1;
    if (__CFADD__(*a1, v15))
    {
      __break(0x5513u);
      return result;
    }

    unint64_t v11 = v10 + v15;
    if (v10 > v10 + v15 || v11 > a1[1]) {
LABEL_12:
    }
      __break(0x5519u);
    *a1 = v11;
  }

  return result;
}

uint64_t sub_10002277C(unint64_t *a1, unint64_t *a2, unint64_t *a3)
{
  unint64_t v15 = 0xAAAAAAAAAAAAAAAALL;
  LODWORD(result) = ccder_blob_decode_tl(a1, 0x2000000000000010LL, &v15);
  unint64_t v7 = v15;
  if (v15) {
    uint64_t result = result;
  }
  else {
    uint64_t result = 0LL;
  }
  if ((_DWORD)result == 1)
  {
    unint64_t v8 = a1[1];
    BOOL v9 = v8 >= *a1;
    unint64_t v10 = v8 - *a1;
    if (!v9 || v15 > v10) {
      goto LABEL_16;
    }
    *a2 = *a1;
    *a3 = v7;
    unint64_t v12 = *a1;
    if (__CFADD__(*a1, v7))
    {
      __break(0x5513u);
      return result;
    }

    unint64_t v13 = v12 + v7;
    if (v12 > v13 || v13 > a1[1]) {
LABEL_16:
    }
      __break(0x5519u);
    *a1 = v13;
  }

  return result;
}

uint64_t sub_10002284C(uint64_t result, uint64_t a2, unsigned int a3)
{
  if (a3 > 9) {
    return 0LL;
  }
  unint64_t v5 = (void *)result;
  unsigned __int8 v6 = 0;
  unint64_t v7 = ~a2;
  while (v7 >= 16LL * (char)v6)
  {
    uint64_t result = compare_octet_string((uint64_t)v5, a2 + 16LL * v6);
    if (!(_DWORD)result) {
      return result;
    }
    if (a3 <= v6++)
    {
      uint64_t v9 = v5[1];
      unint64_t v10 = (void *)(a2 + 16LL * a3);
      void *v10 = *v5;
      v10[1] = v9;
      return 1LL;
    }
  }

  __break(0x5513u);
  return result;
}

uint64_t sub_1000228D4( uint64_t result, unint64_t a2, unint64_t a3, unint64_t *a4, unint64_t *a5, int a6)
{
  if (a6) {
    a5 = 0LL;
  }
  if (a3 == 11)
  {
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x10901066463F786LL)
    {
      uint64_t result = ccder_blob_check_null(result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x400000000000LL;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x10301066463F786LL)
    {
      uint64_t result = ccder_blob_check_null(result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x200;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x10601066463F786LL)
    {
      uint64_t result = ccder_blob_check_null(result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x800;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x11801066463F786LL)
    {
      uint64_t result = ccder_blob_check_null(result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x2000;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x12401066463F786LL)
    {
      uint64_t result = ccder_blob_check_null(result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x100000000000LL;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x11901066463F786LL)
    {
      uint64_t result = ccder_blob_check_null(result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x4000;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x21901066463F786LL)
    {
      uint64_t result = ccder_blob_check_null(result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x8000;
      goto LABEL_261;
    }

LABEL_157:
    int v44 = 0;
LABEL_158:
    if (*(void *)a2 == 0x66463F78648862ALL && *(_BYTE *)(a2 + 8) == 27) {
      return sub_1000239D4(result, a2, a3, a4, a5);
    }
    if (!v44) {
      goto LABEL_232;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 832)
    {
      uint64_t result = ccder_blob_check_null(result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x400000;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3586)
    {
      uint64_t result = ccder_blob_check_null(result);
      if (!(_DWORD)result) {
        return result;
      }
      unint64_t v54 = *a4;
      uint64_t v55 = 37748736LL;
    }

    else
    {
      if (*(void *)a2 != 0x66463F78648862ALL || *(_WORD *)(a2 + 8) != 4354)
      {
        if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 327) {
          return (uint64_t)sub_100023BF0((unint64_t *)result, a4, a5);
        }
        if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3841LL)
        {
          unint64_t v52 = *(void *)result;
          unint64_t v51 = *(void *)(result + 8);
          if (a5)
          {
            if (v52 > v51) {
              goto LABEL_265;
            }
            *a5 = v52;
            a5[1] = v51 - v52;
          }

          *a4 |= 0x80000000uLL;
LABEL_233:
          if (v52 <= v51)
          {
            *(void *)uint64_t result = v51;
            return 1LL;
          }

LABEL_265:
          __break(0x5519u);
          return result;
        }

        goto LABEL_232;
      }

      uint64_t result = ccder_blob_check_null(result);
      if (!(_DWORD)result) {
        return result;
      }
      unint64_t v54 = *a4;
      uint64_t v55 = 0x8004000000LL;
    }

LABEL_201:
    uint64_t v24 = v54 | v55;
    goto LABEL_261;
  }

  if (a3 == 10)
  {
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 5122)
    {
      uint64_t result = ccder_blob_check_null(result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x100000;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 258)
    {
      uint64_t result = ccder_blob_check_null(result);
      if (!(_DWORD)result) {
        return result;
      }
      unint64_t v54 = *a4;
      uint64_t v55 = 0x58600003F0D0LL;
      goto LABEL_201;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1538) {
      goto LABEL_203;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 4610)
    {
      uint64_t result = ccder_blob_check_null(result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0xF00;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3073)
    {
      uint64_t result = ccder_blob_check_null(result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x10;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1793)
    {
      uint64_t result = ccder_blob_check_null(result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x20000;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3329)
    {
LABEL_203:
      uint64_t result = ccder_blob_check_null(result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x20;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 2305)
    {
      uint64_t result = ccder_blob_check_null(result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x40;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 513)
    {
      uint64_t result = ccder_blob_check_null(result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x80;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1025)
    {
      uint64_t result = ccder_blob_check_null(result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x10000;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 769)
    {
      uint64_t result = ccder_blob_check_null(result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x100;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1537)
    {
      uint64_t result = ccder_blob_check_null(result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x400;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 6145)
    {
      uint64_t result = ccder_blob_check_null(result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x1000;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 9217)
    {
      uint64_t result = ccder_blob_check_null(result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x80000000000LL;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 8193)
    {
      uint64_t result = ccder_blob_check_null(result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x2000000000LL;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 8705)
    {
      uint64_t result = ccder_blob_check_null(result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x4000000000LL;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 315) {
      return sub_10002376C((unint64_t *)result, a4, a5);
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3074)
    {
      uint64_t result = ccder_blob_check_null(result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x300000000LL;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 304) {
      return sub_10002384C((unint64_t *)result, a4, a5);
    }
    int v44 = 1;
    goto LABEL_158;
  }

  if (a3 != 9)
  {
    if (a3 < 0xA) {
      goto LABEL_232;
    }
    goto LABEL_157;
  }

  if (*(void *)a2 == 0xB6463F78648862ALL && *(_BYTE *)(a2 + 8) == 1) {
    return sub_1000233B8((unint64_t *)result, a4, a5);
  }
  if (*(void *)a2 != 0x66463F78648862ALL || *(_BYTE *)(a2 + 8) != 49)
  {
    if (*(void *)a2 == 0x66463F78648862ALL && *(_BYTE *)(a2 + 8) == 44) {
      return sub_1000234F0((unint64_t *)result, a4, a5);
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_BYTE *)(a2 + 8) == 36) {
      return sub_100023684((unint64_t *)result, a4, a5);
    }
    if (*(void *)a2 != 0x66463F78648862ALL || *(_BYTE *)(a2 + 8) != 22)
    {
      if (*(void *)a2 == 0xC6463F78648862ALL && *(_BYTE *)(a2 + 8) == 19)
      {
        uint64_t result = ccder_blob_check_null(result);
        if (!(_DWORD)result) {
          return result;
        }
        uint64_t v24 = *a4 | 0x8000000000LL;
        goto LABEL_261;
      }

      if (*(void *)a2 != 0xA6463F78648862ALL || *(_BYTE *)(a2 + 8) != 1)
      {
        if (*(void *)a2 == 0x66463F78648862ALL && *(_BYTE *)(a2 + 8) == 29)
        {
          uint64_t result = ccder_blob_check_null(result);
          if (!(_DWORD)result) {
            return result;
          }
          uint64_t v24 = *a4 | 0x2000000;
        }

        else
        {
          if (*(void *)a2 != 0xC6463F78648862ALL || *(_BYTE *)(a2 + 8) != 14)
          {
            if (*(void *)a2 == 0x86463F78648862ALL && *(_BYTE *)(a2 + 8) == 3) {
              return sub_100023AA0((unint64_t *)result, a4, a5);
            }
            goto LABEL_232;
          }

          uint64_t result = ccder_blob_check_null(result);
          if (!(_DWORD)result) {
            return result;
          }
          uint64_t v24 = *a4 | 0x4000000;
        }

LABEL_261:
        *a4 = v24;
        return 1LL;
      }

      *a4 |= 0x1000000uLL;
LABEL_232:
      unint64_t v52 = *(void *)result;
      unint64_t v51 = *(void *)(result + 8);
      goto LABEL_233;
    }

    uint64_t result = ccder_blob_check_null(result);
    if (!(_DWORD)result) {
      return result;
    }
    unint64_t v54 = *a4;
    uint64_t v55 = 1048584LL;
    goto LABEL_201;
  }

  BOOL v56 = 0;
  uint64_t result = sub_1000221E0((unint64_t *)result, 0, &v56);
  if ((_DWORD)result)
  {
    uint64_t v53 = 0x10000080002LL;
    if (!v56) {
      uint64_t v53 = 0x20000040001LL;
    }
    *a4 |= v53;
  }

  return result;
}

uint64_t X509CertificateParseWithExtension( unint64_t *a1, unint64_t *a2, const void *a3, size_t a4)
{
  uint64_t v8 = 720939LL;
  unint64_t v9 = *a2;
  unint64_t v10 = a2[1];
  unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v11 = *a2;
  uint64_t result = X509CertificateParseImplicit((uint64_t)a1, a2, a3, a4);
  uint64_t v8 = result;
  if ((_DWORD)result) {
    return v8;
  }
  if (__CFADD__(v11, v14))
  {
    __break(0x5513u);
LABEL_11:
    __break(0x5500u);
    goto LABEL_12;
  }

  uint64_t v8 = 720939LL;
  if (*a2 != v11 + v14) {
    return v8;
  }
  unint64_t v13 = v14 + v11 - v9;
  if (__CFADD__(v14, v11 - v9)) {
    goto LABEL_11;
  }
  if (v10 >= v9 && v13 <= v10 - v9)
  {
    *a1 = v9;
    a1[1] = v13;
    X509PolicyCheckForBlockedKeys((uint64_t)a1);
    return 0LL;
  }

LABEL_12:
  __break(0x5519u);
  return result;
}

uint64_t X509CertificateParse(unint64_t *a1, unint64_t *a2)
{
  return X509CertificateParseWithExtension(a1, a2, 0LL, 0LL);
}

BOOL sub_1000233B8(unint64_t *a1, void *a2, unint64_t *a3)
{
  unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v15 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v4 = *a1;
  unint64_t v3 = a1[1];
  if (*a1 > v3) {
    goto LABEL_19;
  }
  unint64_t v14 = *a1;
  unint64_t v15 = v3;
  unint64_t v13 = v3 - v4;
  if ((ccder_blob_decode_tl(&v14, 22LL, &v13) & 1) != 0) {
    goto LABEL_5;
  }
  unint64_t v8 = a1[1];
  if (*a1 > v8) {
    goto LABEL_19;
  }
  unint64_t v14 = *a1;
  unint64_t v15 = v8;
  if (ccder_blob_decode_tl(&v14, 12LL, &v13))
  {
LABEL_5:
    unint64_t v10 = v14;
    unint64_t v9 = v15;
    if (v14 > v15) {
      goto LABEL_19;
    }
    *a1 = v14;
    a1[1] = v9;
    unint64_t v11 = v13;
  }

  else
  {
    unint64_t v10 = *a1;
    unint64_t v9 = a1[1];
    unint64_t v11 = v9 - *a1;
    unint64_t v13 = v11;
  }

  if (__CFADD__(v10, v11)) {
    goto LABEL_20;
  }
  if (v9 == v10 + v11)
  {
    if (!v11) {
      goto LABEL_16;
    }
    if (!a3)
    {
LABEL_15:
      *a2 |= 0x40000000uLL;
LABEL_16:
      if (v10 <= v9)
      {
        *a1 = v9;
        return v9 == v10 + v11;
      }

      goto LABEL_19;
    }

    if (v10 <= v9 && v11 <= v9 - v10)
    {
      *a3 = v10;
      a3[1] = v11;
      goto LABEL_15;
    }

uint64_t sub_1000234F0(unint64_t *a1, unint64_t *a2, unint64_t *a3)
{
  unint64_t v16 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = ccder_blob_decode_tl(a1, 22LL, &v16);
  if ((_DWORD)result)
  {
    unint64_t v7 = v16;
    unint64_t v8 = *a1;
    if (__CFADD__(*a1, v16))
    {
      __break(0x5513u);
      goto LABEL_34;
    }

    unint64_t v9 = v8 + v16;
    if (a1[1] != v8 + v16) {
      return 0LL;
    }
    unint64_t v10 = *a2;
    *a2 |= 0x30000000000uLL;
    if (a3)
    {
      if (v8 > v9) {
        goto LABEL_34;
      }
      *a3 = v8;
      a3[1] = v7;
    }

    if (v7 == 4)
    {
      if (*(_DWORD *)v8 != 1953653621) {
        goto LABEL_30;
      }
      unint64_t v13 = 0x30001000000LL;
    }

    else
    {
      if (v7 == 17)
      {
        if (*(void *)v8 != 0x207372656B6E6F59LL
          || *(void *)(v8 + 8) != 0x726F74636146202DLL
          || *(_BYTE *)(v8 + 16) != 121)
        {
LABEL_30:
          if (v8 <= v9)
          {
            *a1 = v9;
            return 1LL;
          }

uint64_t sub_100023684(unint64_t *a1, void *a2, unint64_t *a3)
{
  unint64_t v9 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = ccder_blob_decode_tl(a1, 4LL, &v9);
  if ((_DWORD)result)
  {
    unint64_t v7 = *a1;
    if (__CFADD__(*a1, v9))
    {
      __break(0x5513u);
    }

    else
    {
      unint64_t v8 = a1[1];
      if (v8 != v7 + v9) {
        return 0LL;
      }
      if (v9 == 32)
      {
        if (a3)
        {
          if (v8 < v7 || v8 - v7 <= 0x1F) {
            goto LABEL_15;
          }
          *a3 = v7;
          a3[1] = 32LL;
        }

        *a2 |= 4uLL;
      }

      if (v7 <= v8)
      {
        *a1 = v8;
        return 1LL;
      }
    }

uint64_t sub_10002376C(unint64_t *a1, void *a2, unint64_t *a3)
{
  unint64_t v10 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = ccder_blob_decode_tl(a1, 4LL, &v10);
  if ((_DWORD)result)
  {
    unint64_t v7 = v10;
    unint64_t v8 = *a1;
    if (__CFADD__(*a1, v10))
    {
      __break(0x5513u);
    }

    else
    {
      unint64_t v9 = a1[1];
      if (v9 != v8 + v10) {
        return 0LL;
      }
      if (v10)
      {
        if (a3)
        {
          if (v9 < v8 || v10 > v9 - v8) {
            goto LABEL_15;
          }
          *a3 = v8;
          a3[1] = v7;
        }

        *a2 |= 0x30000000uLL;
      }

      if (v8 <= v9)
      {
        *a1 = v9;
        return 1LL;
      }
    }

uint64_t sub_10002384C(unint64_t *a1, unint64_t *a2, unint64_t *a3)
{
  unint64_t v17 = 0LL;
  int v6 = ccder_blob_decode_tl(a1, 12LL, &v17);
  uint64_t result = 0LL;
  if (v6)
  {
    unint64_t v8 = v17;
    if (v17 >= 0x19)
    {
      unint64_t v9 = *a1;
      BOOL v10 = *(void *)*a1 == 0x2E3034382E322E31LL && *(void *)(*a1 + 8) == 0x312E353336333131LL;
      unint64_t v11 = 0x2E37322E362E3030LL;
      if (!v10 || *(void *)(*a1 + 16) != 0x2E37322E362E3030LL) {
        return 0LL;
      }
      if (v9 < 0xFFFFFFFFFFFFFFE8LL)
      {
        unint64_t v13 = v9 + 24;
        if (v9 >= v9 + 24) {
          goto LABEL_21;
        }
        unint64_t v11 = a1[1];
        if (v13 > v11) {
          goto LABEL_21;
        }
        unint64_t v14 = (unsigned __int8 *)(v9 + 24);
        do
        {
          BOOL v15 = v14 > v14 + 1;
          ++v14;
        }

        while (!v15);
        while (1)
        {
LABEL_21:
          __break(0x5519u);
LABEL_22:
          if (!a3) {
            goto LABEL_26;
          }
          unint64_t v16 = v8 - 24;
          if (v8 < 0x18) {
            goto LABEL_31;
          }
          if (v16 <= v11 - v13)
          {
            *a3 = v13;
            a3[1] = v16;
LABEL_26:
            unint64_t v13 = *a2 | 0x200000000LL;
            *a2 = v13;
            if (__CFADD__(v9, v8)) {
              break;
            }
            v8 += v9;
            if (v9 <= v8 && v8 <= v11)
            {
              *a1 = v8;
              return 1LL;
            }
          }
        }
      }

      __break(0x5513u);
LABEL_31:
      __break(0x5515u);
    }
  }

  return result;
}

uint64_t sub_1000239D4(uint64_t a1, unint64_t a2, uint64_t a3, void *a4, unint64_t *a5)
{
  uint64_t result = ccder_blob_check_null(a1);
  if ((_DWORD)result)
  {
    if (a2 > 0xFFFFFFFFFFFFFFF6LL) {
      goto LABEL_26;
    }
    if (__CFADD__(a2, a3)) {
      goto LABEL_26;
    }
    unint64_t v10 = a2 + a3;
    if (a2 + a3 == -1LL) {
      goto LABEL_26;
    }
    unint64_t v11 = a2 + 9;
    uint64_t v12 = (char *)(a2 + 9);
    while (1)
    {
      BOOL v13 = (unint64_t)v12 < v10 && (unint64_t)v12 >= a2;
      BOOL v14 = v13;
      if (!v14) {
        goto LABEL_25;
      }
      int v15 = *v12++;
      if ((v15 & 0x80000000) == 0) {
        return 0LL;
      }
    }

    if (!v14)
    {
LABEL_25:
      __break(0x5519u);
LABEL_26:
      __break(0x5513u);
      return result;
    }

    if ((*v12 & 0x80000000) == 0)
    {
      if (!a5)
      {
LABEL_22:
        *a4 |= (unint64_t)&_mh_execute_header;
        return 1LL;
      }

      if (v11 >= a2 && v11 <= v10)
      {
        *a5 = v11;
        a5[1] = a3 - 9;
        goto LABEL_22;
      }

      goto LABEL_25;
    }

    return 0LL;
  }

  return result;
}

uint64_t sub_100023AA0(unint64_t *a1, void *a2, unint64_t *a3)
{
  unint64_t v13 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = ccder_blob_decode_tl(a1, 0x2000000000000010LL, &v14);
  if ((_DWORD)result)
  {
    unint64_t v7 = *a1;
    if (__CFADD__(*a1, v14)) {
      goto LABEL_17;
    }
    if (a1[1] != v7 + v14) {
      return 0LL;
    }
    unint64_t v11 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v12 = 0xAAAAAAAAAAAAAAAALL;
    if (v7 > v7 + v14) {
      goto LABEL_18;
    }
    unint64_t v11 = v7;
    unint64_t v12 = v7 + v14;
    uint64_t result = ccder_blob_decode_tl(&v11, 0xA000000000000002LL, &v13);
    if ((_DWORD)result)
    {
      uint64_t result = ccder_blob_decode_tl(&v11, 4LL, &v13);
      if ((_DWORD)result)
      {
        if (a3)
        {
          if (v12 < v11) {
            goto LABEL_18;
          }
          unint64_t v8 = v13;
          if (v13 > v12 - v11) {
            goto LABEL_18;
          }
          *a3 = v11;
          a3[1] = v8;
        }

        *a2 |= 0x240000800000uLL;
        unint64_t v9 = *a1;
        if (!__CFADD__(*a1, v14))
        {
          unint64_t v10 = v9 + v14;
          if (v9 <= v9 + v14 && v10 <= a1[1])
          {
            *a1 = v10;
            return 1LL;
          }

unint64_t *sub_100023BF0(unint64_t *result, void *a2, unint64_t *a3)
{
  unint64_t v4 = *result;
  unint64_t v3 = result[1];
  unint64_t v5 = v3 - *result;
  if (v5 != 32) {
    return (unint64_t *)(v5 == 32);
  }
  if (a3)
  {
    if (v4 > v3)
    {
LABEL_12:
      __break(0x5519u);
      goto LABEL_13;
    }

    *a3 = v4;
    a3[1] = 32LL;
  }

  *a2 |= 0xC00000000uLL;
  if (v4 < 0xFFFFFFFFFFFFFFE0LL)
  {
    unint64_t v6 = v4 + 32;
    if (v4 + 32 <= v3 && v4 <= v6)
    {
      *uint64_t result = v6;
      return (unint64_t *)(v5 == 32);
    }

    goto LABEL_12;
  }

LABEL_13:
  __break(0x5513u);
  return result;
}

void sub_100023C50(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (sub_100002BD8()) {
    uint64_t v5 = 3LL;
  }
  else {
    uint64_t v5 = 2LL;
  }
  uint64_t v6 = sub_100002BB4(v5, v2, v3, v4, (uint64_t)&_mh_execute_header);
  sub_100002BCC(v6);
  __break(1u);
}

void sub_100023CD4(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (sub_100002BD8()) {
    uint64_t v5 = 3LL;
  }
  else {
    uint64_t v5 = 2LL;
  }
  uint64_t v6 = sub_100002BB4(v5, v2, v3, v4, (uint64_t)&_mh_execute_header);
  sub_100002BCC(v6);
  __break(1u);
}

void sub_100023D58(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "rsd_events publisher received error %d\n",  (uint8_t *)v2,  8u);
}

void sub_100023DCC(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "SecureConfigDB not available.", v1, 2u);
}

void sub_100023E0C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100023E74( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100023EE8(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    uint64_t v4 = 3LL;
  }
  else {
    uint64_t v4 = 2LL;
  }
  uint64_t v5 = _os_log_send_and_compose_impl(v4, a1, a2, 80LL, &_mh_execute_header, &_os_log_default, 16LL);
  _os_crash_msg(*a1, v5);
  __break(1u);
}

void sub_100023F90()
{
}

void sub_100023FBC(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    uint64_t v4 = 3LL;
  }
  else {
    uint64_t v4 = 2LL;
  }
  uint64_t v5 = _os_log_send_and_compose_impl(v4, a1, a2, 80LL, &_mh_execute_header, &_os_log_default, 16LL);
  _os_crash_msg(*a1, v5);
  __break(1u);
}

void sub_100024068()
{
}

void sub_100024094(int *a1, os_log_s *a2)
{
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "inet_pton: %{darwin.errno}d",  (uint8_t *)v3,  8u);
  sub_1000035A0();
}

void sub_100024108()
{
}

void sub_100024134()
{
}

void sub_100024160()
{
}

void sub_10002418C()
{
}

void sub_1000241B8()
{
}

void sub_1000241E4()
{
}

void sub_100024210()
{
}

void sub_100024270()
{
  __int16 v3 = 2082;
  uint64_t v4 = v0;
  _os_log_fault_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_FAULT,  "nw_interface created with %{public}s, but we expect to use %{public}s",  v2,  0x16u);
  sub_100005508();
}

void sub_1000242EC()
{
}

void sub_100024358()
{
}

void sub_100024384()
{
}

void sub_1000243B0()
{
}

void sub_1000243DC()
{
}

void sub_100024408()
{
}

void sub_100024434()
{
}

void sub_100024460()
{
}

void sub_10002448C()
{
}

void sub_1000244EC()
{
}

void sub_100024518(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  LODWORD(v3) = 67109378;
  HIDWORD(v3) = a2;
  LOWORD(v4) = 2114;
  *(void *)((char *)&v4 + 2) = a1;
  sub_10000551C( (void *)&_mh_execute_header,  a2,  a3,  "nw_listener state %d received error: %{public}@",  v3,  (void)v4,  WORD4(v4));
  sub_100005508();
}

void sub_100024588(uint64_t a1, os_log_s *a2)
{
}

void sub_100024610()
{
}

void sub_100024670(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 136315394;
  uint64_t v4 = a1;
  __int16 v5 = 2080;
  uint8_t v6 = "RequireEntitlement";
  sub_10000E864( (void *)&_mh_execute_header,  a2,  a3,  "RemoteService definition '%s' is missing the required key '%s'",  (uint8_t *)&v3);
  sub_100005508();
}

void sub_1000246EC()
{
}

void sub_10002474C(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_100002BB4(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100002BCC(v6);
  __break(1u);
}

void sub_1000247B4(void *a1, uint64_t a2, const _xpc_type_s *a3)
{
  id v5 = a1;
  sub_10000E900();
  xpc_type_get_name(a3);
  sub_10000E8A0();
  sub_10000E864( (void *)&_mh_execute_header,  v3,  v6,  "RemoteService definition '%s' has unsupported expose policy type '%s'",  v7);

  sub_10000E848();
}

void sub_100024844(void *a1, void *a2)
{
  uint64_t v3 = a1;
  [a2 name];
  sub_100005510();

  sub_10000E8E8();
}

void sub_1000248C8(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_10000E900();
  uint64_t v4 = sub_10000E8D4();
  xpc_type_get_name(v4);
  sub_10000E8A0();
  sub_10000E864( (void *)&_mh_execute_header,  v2,  v5,  "RemoteService definition '%s' has \t\t\t\t\t\t\tunsupported expose policy item type '%s'",  v6);

  sub_10000E848();
}

void sub_100024954(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_100002BB4(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100002BCC(v6);
  __break(1u);
}

void sub_1000249BC(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_100002BB4(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100002BCC(v6);
  __break(1u);
}

void sub_100024A24(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_100002BB4(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100002BCC(v6);
  __break(1u);
}

void sub_100024A8C(void *a1, _OWORD *a2)
{
  if (sub_100002BD8()) {
    uint64_t v2 = 3LL;
  }
  else {
    uint64_t v2 = 2LL;
  }
  uint64_t v3 = __error();
  sub_10000E8E0(v3);
  uint64_t v7 = sub_100002BB4(v2, v4, v5, v6, (uint64_t)&_mh_execute_header);
  sub_100002BCC(v7);
  __break(1u);
}

void sub_100024B0C(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_100002BB4(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100002BCC(v6);
  __break(1u);
}

void sub_100024B74(uint64_t a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = a1;
  sub_10000E8B8();
  sub_10000E87C((void *)&_mh_execute_header, v1, v2, "%{public}@> Public Properties: %s", (void)v3, DWORD2(v3));
  sub_100005508();
}

void sub_100024BDC(uint64_t a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = a1;
  sub_10000E8B8();
  sub_10000E87C((void *)&_mh_execute_header, v1, v2, "%{public}@> Properties: %s", (void)v3, DWORD2(v3));
  sub_100005508();
}

void sub_100024C44()
{
}

void sub_100024CA4()
{
}

void sub_100024D04(void *a1, void *a2)
{
  uint64_t v3 = (os_log_s *)sub_10000E918((uint64_t)a1, a2);
  int v5 = 138543618;
  uint8_t v6 = a1;
  __int16 v7 = 1024;
  unsigned int v8 = [a1 state];
  sub_10000E8F4((void *)&_mh_execute_header, v3, v4, "%{public}@> Cannot negotiate TLS in state %d.", (uint8_t *)&v5);

  sub_10000E8E8();
}

void sub_100024D94()
{
}

void sub_100024DF4(uint64_t a1, uint64_t a2)
{
}

void sub_100024E0C(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_100002BB4(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100002BCC(v6);
  __break(1u);
}

void sub_100024E74()
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = v0;
  sub_10000E8B8();
  sub_10000E87C((void *)&_mh_execute_header, v1, v2, "%{public}@> Public Properties: %s", (void)v3, DWORD2(v3));
  sub_100005508();
}

void sub_100024EDC()
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = v0;
  sub_10000E8B8();
  sub_10000E87C((void *)&_mh_execute_header, v1, v2, "%{public}@> Properties: %s", (void)v3, DWORD2(v3));
  sub_100005508();
}

void sub_100024F44()
{
}

void sub_100024F70()
{
}

void sub_100024FD0()
{
}

void sub_100025030()
{
}

void sub_100025090()
{
}

void sub_1000250F0()
{
}

void sub_100025150()
{
}

void sub_1000251B0()
{
}

void sub_100025210()
{
}

void sub_100025270()
{
}

void sub_1000252D0()
{
}

void sub_100025330(void *a1, _OWORD *a2, id *a3)
{
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (sub_10000E90C()) {
    uint64_t v6 = 3LL;
  }
  else {
    uint64_t v6 = 2LL;
  }
  [*a3 state];
  uint64_t v7 = sub_10000E840(v6, (uint64_t)a1, (uint64_t)a2, 80LL, (uint64_t)&_mh_execute_header, (uint64_t)&_os_log_default);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_1000253F0()
{
  __int16 v3 = 2082;
  uint64_t v4 = v0;
  sub_10000E864( (void *)&_mh_execute_header,  v1,  (uint64_t)v1,  "%{public}@> Skipping remote service %{public}s with invalid description",  v2);
  sub_100005508();
}

void sub_100025464()
{
}

void sub_1000254C8()
{
  __int16 v3 = 1024;
  int v4 = 1;
  sub_10000E8F4( (void *)&_mh_execute_header,  v0,  v1,  "%{public}@> Unable to heartbeat peer with version %d - faking success",  v2);
  sub_100005508();
}

void sub_10002553C()
{
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  sub_10000E864( (void *)&_mh_execute_header,  v1,  (uint64_t)v1,  "%{public}@> Heartbeat %llu failed - error on connection",  v2);
  sub_100005508();
}

void sub_1000255B4()
{
}

void sub_100025614()
{
}

void sub_100025674()
{
}

void sub_1000256D8()
{
}

void sub_10002573C()
{
}

void sub_10002579C()
{
}

void sub_1000257FC()
{
}

void sub_10002585C()
{
}

void sub_1000258BC(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (os_log_s *)sub_10000E918(a1, a2);
  [a3 name];
  sub_10000E8A0();
  sub_10000E864((void *)&_mh_execute_header, v4, v5, "%{public}@> Unable to listen for %s", v6);

  sub_10000E848();
}

void sub_100025944(void *a1, _OWORD *a2)
{
  if (sub_100002BD8()) {
    uint64_t v2 = 3LL;
  }
  else {
    uint64_t v2 = 2LL;
  }
  __error();
  uint64_t v6 = sub_100002BB4(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100002BCC(v6);
  __break(1u);
}

void sub_1000259C4()
{
}

void sub_100025A24()
{
}

void sub_100025A84(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (sub_100002BD8()) {
    uint64_t v4 = 3LL;
  }
  else {
    uint64_t v4 = 2LL;
  }
  uint64_t v5 = __error();
  sub_10000E8E0(v5);
  uint64_t v6 = sub_10000E840(v4, (uint64_t)a1, (uint64_t)a2, 80LL, (uint64_t)&_mh_execute_header, (uint64_t)&_os_log_default);
  sub_10000E8C8(v6);
  __break(1u);
}

void sub_100025B48()
{
}

void sub_100025BA8(const char *a1, void *a2, _OWORD *a3)
{
  *a2 = 0LL;
  *a3 = 0u;
  a3[1] = 0u;
  a3[2] = 0u;
  a3[3] = 0u;
  a3[4] = 0u;
  if (sub_10000E90C()) {
    uint64_t v5 = 3LL;
  }
  else {
    uint64_t v5 = 2LL;
  }
  uint8_t v6 = __error();
  sub_10000E8E0(v6);
  uint64_t v7 = sub_10000E840(v5, (uint64_t)a2, (uint64_t)a3, 80LL, (uint64_t)&_mh_execute_header, (uint64_t)&_os_log_default);
  sub_10000E8C8(v7);
  __break(1u);
}

void sub_100025C74()
{
}

void sub_100025CD4()
{
}

void sub_100025D00()
{
}

void sub_100025D2C(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_100002BB4(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100002BCC(v6);
  __break(1u);
}

void sub_100025D94(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_100002BB4(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100002BCC(v6);
  __break(1u);
}

void sub_100025DFC(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_100002BB4(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100002BCC(v6);
  __break(1u);
}

void sub_100025E64(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_100002BB4(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100002BCC(v6);
  __break(1u);
}

void sub_100025ECC(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_100002BB4(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100002BCC(v6);
  __break(1u);
}

void sub_100025F34(uint64_t a1, void *a2, const void *a3)
{
  uint64_t v5 = (os_log_s *)sub_10000E918(a1, a2);
  int v7 = 136315394;
  uint64_t v8 = a1;
  __int16 v9 = 2048;
  CFTypeID v10 = CFGetTypeID(a3);
  sub_10000E864((void *)&_mh_execute_header, v5, v6, "Cannot convert key %s, unsupported type: %lu", (uint8_t *)&v7);

  sub_10000E848();
}

void sub_100025FCC(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  uint64_t v5 = sub_10000E8D4();
  int v7 = 136315394;
  uint64_t v8 = v3;
  __int16 v9 = 2080;
  uint64_t name = xpc_type_get_name(v5);
  sub_10000E864( (void *)&_mh_execute_header,  v2,  v6,  "RemoteService definition '%s' has \t\t\t\t\t\tinvliad LimitExposedToDeviceType item type '%s'",  (uint8_t *)&v7);

  sub_10000E848();
}

void sub_100026064(int *a1, os_log_s *a2)
{
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Unable to fetch InDiagnosticsMode status, error %d",  (uint8_t *)v3,  8u);
  sub_1000035A0();
}

void sub_1000260D8(void *a1, os_log_s *a2)
{
  if (a1)
  {
    id v2 = objc_claimAutoreleasedReturnValue([a1 description]);
    [v2 UTF8String];
  }

  sub_100005510();
  sub_10000E7F8((void *)&_mh_execute_header, a2, v5, "failed to load RestoreVersion.plist: %{public}s", v6);
  if (a1) {

  }
  sub_10000E848();
}

void sub_100026180()
{
}

void sub_1000261AC()
{
}

void sub_1000261D8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100026248( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000262B8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100026328( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100026398( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100026408( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100026478( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000264E8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100026558( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000265C8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100026638( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000266A8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100026718( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100026788( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000267F8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100026868( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000268D8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100026948( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000269B8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100026A28( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100026A98( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100026B08( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100026B78( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100026BE8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100026C58( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100026CC8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100026D38( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100026DA8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100026E18( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100026E88( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100026EF8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100026F68( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100026FD8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100027048( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000270B8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100027128( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100027198( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100027208( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100027278( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000272E8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100027358( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000273C8(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_100002BB4(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100002BCC(v6);
  __break(1u);
}

void sub_100027434(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (sub_10000F0AC((os_log_s *)&_os_log_default)) {
    uint64_t v4 = 3LL;
  }
  else {
    uint64_t v4 = 2LL;
  }
  uint64_t v5 = _os_log_send_and_compose_impl(v4, a1, a2, 80LL, &_mh_execute_header, &_os_log_default, 16LL);
  _os_crash_msg(*a1, v5);
  __break(1u);
}

void sub_1000274E0(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (sub_10000F0AC((os_log_s *)&_os_log_default)) {
    uint64_t v5 = 3LL;
  }
  else {
    uint64_t v5 = 2LL;
  }
  uint64_t v6 = sub_100002BB4(v5, v2, v3, v4, (uint64_t)&_mh_execute_header);
  sub_100002BCC(v6);
  __break(1u);
}

void sub_100027568( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100027598(os_log_s *a1)
{
  int v2 = *__error();
  v4[0] = 67109120;
  v4[1] = v2;
  sub_10000F0A0((void *)&_mh_execute_header, a1, v3, "clock_settime: %{errno}d", (uint8_t *)v4);
}

void sub_10002761C(int a1, os_log_s *a2, uint64_t a3)
{
  v3[0] = 67109120;
  v3[1] = a1;
  sub_10000F0A0((void *)&_mh_execute_header, a2, a3, "ntp_adjtime returned error: %d", (uint8_t *)v3);
  sub_1000035A0();
}

void sub_100027684(int a1, os_log_s *a2, uint64_t a3)
{
  v3[0] = 67109120;
  v3[1] = a1;
  sub_10000F0A0((void *)&_mh_execute_header, a2, a3, "sntp exchange failed: %d", (uint8_t *)v3);
  sub_1000035A0();
}

void sub_1000276EC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002771C(void *a1, _OWORD *a2)
{
  uint64_t v7 = sub_100002BB4(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_1000277A8(void *a1, _OWORD *a2)
{
  uint64_t v7 = sub_100002BB4(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_100027834(void *a1, _OWORD *a2)
{
  uint64_t v7 = sub_100002BB4(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_1000278C0(void *a1, _OWORD *a2)
{
  uint64_t v7 = sub_100002BB4(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_10002794C(void *a1, _OWORD *a2)
{
  uint64_t v7 = sub_100002BB4(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_1000279D8(void *a1, _OWORD *a2)
{
  if (sub_10000F0AC((os_log_s *)&_os_log_default)) {
    uint64_t v4 = 3LL;
  }
  else {
    uint64_t v4 = 2LL;
  }
  uint64_t v5 = sub_10000E840(v4, (uint64_t)a1, (uint64_t)a2, 80LL, (uint64_t)&_mh_execute_header, (uint64_t)&_os_log_default);
  _os_crash_msg(*a1, v5);
  __break(1u);
}

void sub_100027A88(_BYTE *a1, _BYTE *a2)
{
}

void sub_100027ABC(_BYTE *a1, _BYTE *a2)
{
}

void sub_100027AE4(_BYTE *a1, _BYTE *a2)
{
}

void sub_100027B0C(_BYTE *a1, _BYTE *a2)
{
}

void sub_100027B34(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Fail to extract USB Serial Number", v1, 2u);
}

void sub_100027B74(void *a1, _OWORD *a2)
{
  if (sub_10000F0AC((os_log_s *)&_os_log_default)) {
    uint64_t v4 = 3LL;
  }
  else {
    uint64_t v4 = 2LL;
  }
  uint64_t v5 = sub_10000E840(v4, (uint64_t)a1, (uint64_t)a2, 80LL, (uint64_t)&_mh_execute_header, (uint64_t)&_os_log_default);
  sub_1000113D0(v5);
  __break(1u);
}

void sub_100027C08(uint64_t *a1, os_log_s *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "%{public}@> Connection timeout, retrying",  (uint8_t *)&v3,  0xCu);
  sub_100005508();
}

void sub_100027C7C(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)int v3 = 138543618;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 1024;
  *(_DWORD *)&v3[14] = a2;
  sub_10000551C( (void *)&_mh_execute_header,  a2,  a3,  "%{public}@> network_connect_in6: %{errno}d",  *(void *)v3,  *(void *)&v3[8],  *(_WORD *)&v3[16]);
  sub_100005508();
}

void sub_100027CEC(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_100002BB4(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100002BCC(v6);
  __break(1u);
}

void sub_100027D5C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_FAULT,  "Failed to create bonjour connection parameters",  v1,  2u);
}

void sub_100027D9C(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_100002BB4(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100002BCC(v6);
  __break(1u);
}

void sub_100027E0C(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_100002BB4(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100002BCC(v6);
  __break(1u);
}

void sub_100027E7C(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)uint64_t v3 = 138543618;
  *(void *)&v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 1024;
  *(_DWORD *)&v3[14] = a2;
  sub_10000551C( (void *)&_mh_execute_header,  a2,  a3,  "%{public}@> ncm failed to connect with %{errno}d",  *(void *)v3,  *(void *)&v3[8],  *(_WORD *)&v3[16]);
  sub_100005508();
}

void sub_100027EF0(void *a1, _OWORD *a2)
{
  if (sub_10000F0AC((os_log_s *)&_os_log_default)) {
    uint64_t v4 = 3LL;
  }
  else {
    uint64_t v4 = 2LL;
  }
  uint64_t v5 = sub_10000E840(v4, (uint64_t)a1, (uint64_t)a2, 80LL, (uint64_t)&_mh_execute_header, (uint64_t)&_os_log_default);
  sub_1000113D0(v5);
  __break(1u);
}

void sub_100027F84(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_100002BB4(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100002BCC(v6);
  __break(1u);
}

void sub_100027FF4()
{
}

void sub_100028020()
{
}

void sub_10002804C()
{
}

void sub_100028078()
{
}

void sub_1000280A4()
{
}

void sub_1000280D0()
{
}

void sub_1000280FC()
{
}

void sub_100028128(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_100002BB4(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100002BCC(v6);
  __break(1u);
}

void sub_100028190(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_100002BB4(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100002BCC(v6);
  __break(1u);
}

void sub_1000281F8(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_100002BB4(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100002BCC(v6);
  __break(1u);
}

void sub_100028260( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100011C3C( (void *)&_mh_execute_header,  a2,  a3,  "IOServiceAddMatchingNotification returned 0x%08x",  a5,  a6,  a7,  a8,  0);
  sub_1000035A0();
}

void sub_1000282C4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100028330(void *a1, _OWORD *a2)
{
  uint64_t v7 = sub_100002BB4(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_1000283BC(void *a1, _OWORD *a2)
{
  uint64_t v7 = sub_100002BB4(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_100028448(void *a1, _OWORD *a2)
{
  uint64_t v7 = sub_100002BB4(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_1000284D4(void *a1, _OWORD *a2)
{
  uint64_t v7 = sub_100002BB4(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_100028560(void *a1, _OWORD *a2)
{
  uint64_t v7 = sub_100002BB4(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_1000285EC(void *a1, _OWORD *a2)
{
  if (sub_10000E90C()) {
    uint64_t v6 = 3LL;
  }
  else {
    uint64_t v6 = 2LL;
  }
  uint64_t v7 = sub_100013A64(v6, v3, v4, v5, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_100028688(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_100002BB4(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100002BCC(v6);
  __break(1u);
}

void sub_1000286F8(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_100002BB4(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100002BCC(v6);
  __break(1u);
}

void sub_100028768(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)uint64_t v3 = 138543618;
  *(void *)&v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  sub_100013A7C( (void *)&_mh_execute_header,  a2,  a3,  "%{public}@> received error: %@",  *(void *)v3,  *(void *)&v3[8],  *(void *)&v3[16]);
  sub_100005508();
}

void sub_1000287DC(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)uint64_t v3 = 138543618;
  *(void *)&v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  sub_100013A7C( (void *)&_mh_execute_header,  a2,  a3,  "%{public}@> nw_listener_state_failed: %{public}@",  *(void *)v3,  *(void *)&v3[8],  *(void *)&v3[16]);
  sub_100005508();
}

void sub_100028850(uint64_t a1, int a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "%{public}@> Unable to start remoted listener: %{darwin.errno}d",  (uint8_t *)&v3,  0x12u);
  sub_100005508();
}

void sub_1000288D0(void *a1, _OWORD *a2)
{
  if (sub_10000E90C()) {
    uint64_t v6 = 3LL;
  }
  else {
    uint64_t v6 = 2LL;
  }
  uint64_t v7 = sub_100013A64(v6, v3, v4, v5, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_100028958()
{
}

void sub_1000289B8()
{
}

void sub_100028A18()
{
}

void sub_100028A50()
{
}

void sub_100028AB0()
{
}

void sub_100028B10()
{
}

void sub_100028B3C()
{
}

void sub_100028B68()
{
}

void sub_100028B94()
{
}

void sub_100028BF4()
{
}

void sub_100028C54()
{
}

void sub_100028C80()
{
}

void sub_100028CE0()
{
}

void sub_100028D40()
{
}

void sub_100028DA0()
{
}

void sub_100028E00()
{
}

void sub_100028E60()
{
}

void sub_100028E8C()
{
}

void sub_100028EB8()
{
}

void sub_100028EE4()
{
}

void sub_100028F44()
{
}

void sub_100028F70()
{
}

void sub_100028F9C()
{
}

void sub_100028FC8()
{
}

void sub_100028FF4()
{
}

void sub_100029020()
{
}

void sub_100029080()
{
}

void sub_1000290E0()
{
}

void sub_10002910C()
{
}

void sub_100029138()
{
}

void sub_100029164()
{
}

void sub_100029190()
{
}

void sub_1000291F0()
{
}

void sub_10002921C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100029284()
{
}

void sub_1000292B0()
{
}

void sub_100029310()
{
}

void sub_100029370()
{
}

void sub_10002939C()
{
}

void sub_1000293C8()
{
}

void sub_1000293F4()
{
}

void sub_100029454()
{
}

void sub_1000294B4()
{
}

void sub_100029514()
{
}

void sub_100029574()
{
}

void sub_1000295A0()
{
}

void sub_1000295CC()
{
}

void sub_10002962C()
{
}

void sub_100029658(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_100002BB4(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100002BCC(v6);
  __break(1u);
}

void sub_1000296C0()
{
}

void sub_1000296EC(uint64_t a1, os_log_s *a2)
{
  int v2 = 136446210;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "failed to find interface index for name %{public}s",  (uint8_t *)&v2,  0xCu);
  sub_100005508();
}

void sub_10002975C(void *a1, _OWORD *a2)
{
  if (sub_10000E90C()) {
    uint64_t v5 = 3LL;
  }
  else {
    uint64_t v5 = 2LL;
  }
  uint64_t v6 = sub_100013A64(v5, v2, v3, v4, (uint64_t)&_mh_execute_header);
  sub_1000113D0(v6);
  __break(1u);
}

void sub_1000297D0()
{
}

void sub_100029830()
{
}

void sub_100029890()
{
}

void sub_1000298BC()
{
}

void sub_1000298E8(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_100002BB4(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100002BCC(v6);
  __break(1u);
}

void sub_100029950()
{
}

void sub_100029988()
{
}

void sub_1000299E8()
{
}

void sub_100029A14()
{
}

void sub_100029A40()
{
}

void sub_100029A6C(void *a1, _OWORD *a2)
{
  if (sub_10000E90C()) {
    uint64_t v5 = 3LL;
  }
  else {
    uint64_t v5 = 2LL;
  }
  uint64_t v6 = sub_100013A64(v5, v2, v3, v4, (uint64_t)&_mh_execute_header);
  sub_1000113D0(v6);
  __break(1u);
}

void sub_100029AF4(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *__int128 buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "failed to create server device", buf, 2u);
}

void sub_100029B30(int *a1, int a2, os_log_t log)
{
  int v3 = *a1;
  v4[0] = 67109376;
  v4[1] = v3;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "connect(fd: %d, ...) failed with %{darwin.errno}d\n",  (uint8_t *)v4,  0xEu);
  sub_100005508();
}

void sub_100029BB4(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_100002BB4(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100002BCC(v6);
  __break(1u);
}

void sub_100029C1C()
{
}

void sub_100029C7C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100029CAC()
{
}

void sub_100029D0C()
{
}

void sub_100029D6C()
{
}

float sub_100029DCC(int *a1, os_log_s *a2)
{
  int v2 = *a1;
  v4[0] = 67109888;
  v4[1] = 30;
  __int16 v5 = 1024;
  int v6 = 1;
  __int16 v7 = 1024;
  int v8 = 0;
  __int16 v9 = 1024;
  int v10 = v2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "socket(domain: %d, type: %d, protocol: %d) ret: %d",  (uint8_t *)v4,  0x1Au);
  return result;
}

void sub_100029E64(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_100002BB4(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100002BCC(v6);
  __break(1u);
}

void sub_100029ECC()
{
}

void sub_100029F2C()
{
}

void sub_100029F8C()
{
}

void sub_100029FEC()
{
}

void sub_10002A04C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002A07C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002A0E0(os_log_s *a1)
{
  int v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_ERROR, "getifaddrs(2): %{errno}d", (uint8_t *)v3, 8u);
  sub_100005508();
}

void sub_10002A168(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_100002BB4(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100002BCC(v6);
  __break(1u);
}

void sub_10002A1D0()
{
}

void sub_10002A230()
{
}

void sub_10002A290()
{
}

void sub_10002A2F0(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_100002BB4(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100002BCC(v6);
  __break(1u);
}

void sub_10002A358()
{
}

void sub_10002A3B8()
{
}

void sub_10002A418()
{
}

void sub_10002A478()
{
}

void sub_10002A4D8()
{
}

void sub_10002A538(void *a1, _OWORD *a2)
{
  uint64_t v7 = sub_100002BB4(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_10002A5C0()
{
}

void sub_10002A5EC(void *a1, _OWORD *a2)
{
  uint64_t v7 = sub_100002BB4(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_10002A674()
{
}

void sub_10002A6A0()
{
}

void sub_10002A700(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_100002BB4(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100002BCC(v6);
  __break(1u);
}

void sub_10002A768()
{
}

void sub_10002A7C8()
{
}

void sub_10002A7F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_10001D450((void *)&_mh_execute_header, v5, v3, "Listing services on %{public}s (client=%s)", v4);
}

void sub_10002A830(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_10001D450((void *)&_mh_execute_header, v5, v3, "Listing local services exposed to %{public}s (client=%s)", v4);
}

void sub_10002A86C()
{
}

void sub_10002A898()
{
}

void sub_10002A8C4(void *a1, _OWORD *a2)
{
  uint64_t v7 = sub_100002BB4(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_10002A94C()
{
}

void sub_10002A978(void *a1, void *a2)
{
  uint64_t v3 = a1;
  remote_device_type_get_description([a2 type]);
  sub_100005510();
  sub_10000E7F8((void *)&_mh_execute_header, v3, v4, "device type %{public}s cannot be disconnected manually", v5);

  sub_10000E8E8();
}

void sub_10002AA04()
{
  sub_100002DA4( (void *)&_mh_execute_header,  v0,  v1,  "device_authenticate: No certificate data (client=%s)",  v2,  v3,  v4,  v5,  v6);
  sub_100005508();
}

void sub_10002AA64()
{
  sub_100002DA4( (void *)&_mh_execute_header,  v0,  v1,  "device_authenticate: Failed to create cert from data (client=%s)",  v2,  v3,  v4,  v5,  v6);
  sub_100005508();
}

void sub_10002AAC4()
{
  sub_100002DA4( (void *)&_mh_execute_header,  v0,  v1,  "device_authenticate: Failed to authenticate peer cert (client=%s)",  v2,  v3,  v4,  v5,  v6);
  sub_100005508();
}

void sub_10002AB24()
{
}

void sub_10002AB50()
{
}

void sub_10002AB7C()
{
}

void sub_10002ABA8(char a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v3 = "with";
  if ((a1 & 1) == 0) {
    uint64_t v3 = "without";
  }
  int v4 = 136446466;
  uint64_t v5 = v3;
  __int16 v6 = 2080;
  uint64_t v7 = a2;
  sub_10001D450( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "Sending device note %{public}s sensitive properties (client=%s)",  (uint8_t *)&v4);
  sub_100005508();
}

void sub_10002AC38()
{
  sub_10000E890((void *)&_mh_execute_header, v0, v1, "Canceling client browse. (client=%s)", v2, v3, v4, v5, v6);
  sub_100005508();
}

void sub_10002AC98(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_100002BB4(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100002BCC(v6);
  __break(1u);
}

void sub_10002AD00()
{
}

void sub_10002AD2C(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_100002BB4(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100002BCC(v6);
  __break(1u);
}

void sub_10002AD94()
{
}

void sub_10002ADC0()
{
}

void sub_10002ADEC(void **a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a2;
  [v2 name];
  sub_100005510();
  sub_10000E7F8((void *)&_mh_execute_header, v3, v4, "%{public}s> Connect failed", v5);

  sub_10000E8E8();
}

void sub_10002AE74(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_100002BB4(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100002BCC(v6);
  __break(1u);
}

void sub_10002AEDC(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_100002BB4(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100002BCC(v6);
  __break(1u);
}

void sub_10002AF44(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "failed to send goodbye to peer: %{darwin.errno}d",  (uint8_t *)v2,  8u);
  sub_1000035A0();
}

void sub_10002AFB4(char a1, int a2, os_log_t log)
{
  v3[0] = 67109376;
  v3[1] = a1 & 1;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "GET query with invalid criteria (trust:%d u:%d)",  (uint8_t *)v3,  0xEu);
  sub_100005508();
}

void sub_10002B038(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_100002BB4(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100002BCC(v6);
  __break(1u);
}

void sub_10002B0A0()
{
  sub_100002DA4((void *)&_mh_execute_header, v0, v1, "No local identity available. (client=%s)", v2, v3, v4, v5, v6);
  sub_100005508();
}

void sub_10002B100()
{
  sub_100002DA4( (void *)&_mh_execute_header,  v0,  v1,  "Failed to copy key attributes. (client=%s)",  v2,  v3,  v4,  v5,  v6);
  sub_100005508();
}

void sub_10002B160()
{
  sub_100002DA4((void *)&_mh_execute_header, v0, v1, "Failed to copy key data. (client=%s)", v2, v3, v4, v5, v6);
  sub_100005508();
}

void sub_10002B1C0()
{
  sub_100002DA4( (void *)&_mh_execute_header,  v0,  v1,  "Failed to copy certificate data. (client=%s)",  v2,  v3,  v4,  v5,  v6);
  sub_100005508();
}

void sub_10002B220()
{
  sub_10000551C( (void *)&_mh_execute_header,  v0,  v1,  "Failed to copy certificate from identity: %d (client=%s)",  v2,  v3);
  sub_100005508();
}

void sub_10002B280()
{
  sub_10000551C( (void *)&_mh_execute_header,  v0,  v1,  "Failed to copy private key from identity: %d (client=%s)",  v2,  v3);
  sub_100005508();
}

void sub_10002B2E0(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Unable to start remoted listener: %{darwin.errno}d",  (uint8_t *)v2,  8u);
  sub_1000035A0();
}

void sub_10002B350(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_100002BB4(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100002BCC(v6);
  __break(1u);
}

void sub_10002B3B8(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_fault_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_FAULT,  "Failed to create bonjour connection parameters",  v1,  2u);
  sub_1000035A0();
}

void sub_10002B3F4(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_100002BB4(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100002BCC(v6);
  __break(1u);
}

void sub_10002B45C(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_100002BB4(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100002BCC(v6);
  __break(1u);
}

void sub_10002B4C4(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Failed to create interface with index",  v1,  2u);
  sub_1000035A0();
}

void sub_10002B500(void *a1, _OWORD *a2)
{
  if (sub_10000E90C()) {
    uint64_t v5 = 3LL;
  }
  else {
    uint64_t v5 = 2LL;
  }
  uint64_t v6 = sub_100013A64(v5, v2, v3, v4, (uint64_t)&_mh_execute_header);
  sub_1000113D0(v6);
  __break(1u);
}

void sub_10002B574( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002B5DC( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002B644(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    uint64_t v4 = 3LL;
  }
  else {
    uint64_t v4 = 2LL;
  }
  uint64_t v5 = __error();
  strerror(*v5);
  uint64_t v6 = _os_log_send_and_compose_impl(v4, a1, a2, 80LL, &_mh_execute_header, &_os_log_default, 16LL);
  sub_10000E8C8(v6);
  __break(1u);
}

void sub_10002B71C(const char *a1, void *a2, _OWORD *a3)
{
  *a2 = 0LL;
  *a3 = 0u;
  a3[1] = 0u;
  a3[2] = 0u;
  a3[3] = 0u;
  a3[4] = 0u;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    uint64_t v5 = 3LL;
  }
  else {
    uint64_t v5 = 2LL;
  }
  uint64_t v6 = __error();
  strerror(*v6);
  uint64_t v7 = _os_log_send_and_compose_impl(v5, a2, a3, 80LL, &_mh_execute_header, &_os_log_default, 16LL);
  sub_10000E8C8(v7);
  __break(1u);
}

void sub_10002B7F8()
{
}

void sub_10002B858()
{
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_error_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_ERROR,  "%{public}@> network_copy_interface_address_in6: %{darwin.errno}d",  v2,  0x12u);
  sub_100005508();
}

void sub_10002B8D4(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_100002BB4(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100002BCC(v6);
  __break(1u);
}

void sub_10002B93C()
{
}

void sub_10002B99C()
{
}

void sub_10002B9FC(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "IOServiceAddInterestNotification on ncm interface: 0x%x",  (uint8_t *)v2,  8u);
  sub_1000035A0();
}

void sub_10002BA6C(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_100002BB4(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100002BCC(v6);
  __break(1u);
}

void sub_10002BAD4(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "IOServiceAddInterestNotification match: unsigned int type = 0x%08x",  (uint8_t *)v2,  8u);
  sub_1000035A0();
}

void sub_10002BB44(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_100002BB4(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100002BCC(v6);
  __break(1u);
}

void sub_10002BBAC(const char *a1, void *a2, _OWORD *a3)
{
  *a2 = 0LL;
  *a3 = 0u;
  a3[1] = 0u;
  a3[2] = 0u;
  a3[3] = 0u;
  a3[4] = 0u;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    uint64_t v5 = 3LL;
  }
  else {
    uint64_t v5 = 2LL;
  }
  uint64_t v6 = __error();
  strerror(*v6);
  uint64_t v7 = _os_log_send_and_compose_impl(v5, a2, a3, 80LL, &_mh_execute_header, &_os_log_default, 16LL);
  _os_crash_msg(*a2, v7);
  __break(1u);
}

void sub_10002BC90()
{
}

void sub_10002BCF0(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_100002BB4(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100002BCC(v6);
  __break(1u);
}

void sub_10002BD58()
{
}

void sub_10002BDB8()
{
}

void sub_10002BE18()
{
}

void sub_10002BE30(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_100002BB4(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100002BCC(v6);
  __break(1u);
}

void sub_10002BE98(uint64_t a1, void *a2, _OWORD *a3)
{
  *a2 = 0LL;
  a3[3] = 0u;
  a3[4] = 0u;
  a3[1] = 0u;
  a3[2] = 0u;
  *a3 = 0u;
  if (sub_100002BD8()) {
    uint64_t v6 = 3LL;
  }
  else {
    uint64_t v6 = 2LL;
  }
  uint64_t v7 = sub_100002BB4(v6, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100002BCC(v7);
  __break(1u);
}

void sub_10002BF24(uint64_t a1, void *a2, _OWORD *a3)
{
  *a2 = 0LL;
  a3[3] = 0u;
  a3[4] = 0u;
  a3[1] = 0u;
  a3[2] = 0u;
  *a3 = 0u;
  if (sub_100002BD8()) {
    uint64_t v6 = 3LL;
  }
  else {
    uint64_t v6 = 2LL;
  }
  uint64_t v7 = sub_100002BB4(v6, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100002BCC(v7);
  __break(1u);
}

void sub_10002BFB0()
{
}

void sub_10002BFC8()
{
}

void sub_10002C028(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_100002BB4(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100002BCC(v6);
  __break(1u);
}

void sub_10002C090(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_100002BB4(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100002BCC(v6);
  __break(1u);
}

void sub_10002C0F8(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_100002BB4(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100002BCC(v6);
  __break(1u);
}

void sub_10002C160(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_100002BB4(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100002BCC(v6);
  __break(1u);
}

void sub_10002C1C8(void *a1)
{
  id v2 = a1;
  sub_100021000();
  sub_100020FE8();
  sub_100020FD4((void *)&_mh_execute_header, v3, v4, "%{public}@> socket(2): %{errno}d", v5, v6, v7, v8, v9);

  sub_10000E8E8();
}

void sub_10002C244(void *a1)
{
  id v2 = a1;
  sub_100021000();
  sub_100020FE8();
  sub_100020FD4((void *)&_mh_execute_header, v3, v4, "%{public}@> bind(2): %{errno}d", v5, v6, v7, v8, v9);

  sub_10000E8E8();
}

void sub_10002C2C0(void *a1)
{
  id v2 = a1;
  sub_100021000();
  sub_100020FE8();
  sub_100020FD4((void *)&_mh_execute_header, v3, v4, "%{public}@> listen(2): %{errno}d", v5, v6, v7, v8, v9);

  sub_10000E8E8();
}

void sub_10002C33C(void *a1)
{
  id v2 = a1;
  sub_100021000();
  sub_100020FE8();
  sub_100020FD4((void *)&_mh_execute_header, v3, v4, "%{public}@> getsockname(2): %{errno}d", v5, v6, v7, v8, v9);

  sub_10000E8E8();
}

void sub_10002C3B8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002C428(void *a1)
{
  id v2 = a1;
  sub_100021000();
  sub_100020FE8();
  sub_100020FD4( (void *)&_mh_execute_header,  v3,  v4,  "%{public}@> fcntl(2): Failed to set O_NONBLOCK: %{errno}d",  v5,  v6,  v7,  v8,  v9);

  sub_10000E8E8();
}

void sub_10002C4A4(uint64_t a1, os_log_s *a2)
{
  int v2 = 138543618;
  uint64_t v3 = qword_1000431F8;
  __int16 v4 = 2082;
  uint64_t v5 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "%{public}@> invalid port %{public}s",  (uint8_t *)&v2,  0x16u);
  sub_100005508();
}

void sub_10002C528(void *a1)
{
  id v2 = a1;
  sub_100021000();
  sub_100020FE8();
  sub_100020FD4((void *)&_mh_execute_header, v3, v4, "%{public}@> connectx(2): %{errno}d", v5, v6, v7, v8, v9);

  sub_10000E8E8();
}

void sub_10002C5A4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002C614(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_100002BB4(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100002BCC(v6);
  __break(1u);
}

void sub_10002C67C(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_100002BB4(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100002BCC(v6);
  __break(1u);
  CFBooleanGetTypeID();
}

id objc_msgSend_initWithServerListener_controlPeer_interfaceName_interfaceIndex_connectTimeout_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithServerListener:controlPeer:interfaceName:interfaceIndex:connectTimeout:");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:");
}