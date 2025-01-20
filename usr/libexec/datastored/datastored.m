void sub_100000850(uint64_t a1)
{
  os_unfair_lock_s *v2;
  v2 = (os_unfair_lock_s *)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
  sub_10000088C(a1);
  os_unfair_lock_unlock(v2);
  sub_100000978((void *)a1);
}

void sub_10000088C(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_BOOL(v2, "ds_data_invalid", 1);
  v3 = (void *)qword_100008028;
  if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_DEBUG)) {
    sub_1000027F4(a1, v3);
  }
  v4 = *(void **)(a1 + 56);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100001E2C;
  v8[3] = &unk_100004450;
  id v5 = v2;
  id v9 = v5;
  uint64_t v10 = a1;
  if (!xpc_array_apply(v4, v8)) {
    sub_1000027E0();
  }
  xpc_object_t v6 = xpc_array_create(0LL, 0LL);
  v7 = *(void **)(a1 + 56);
  *(void *)(a1 + 56) = v6;
}

void sub_100000978(void *a1)
{
  if (a1)
  {
    xpc_object_t v2 = (os_log_s *)qword_100008028;
    if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315138;
      id v9 = a1 + 13;
      _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_INFO,  "[%s] Freeing up datastore object",  (uint8_t *)&v8,  0xCu);
    }

    v3 = (void *)a1[5];
    if (v3)
    {
      if (a1[10] == 1LL) {
        free(v3);
      }
      else {
        munmap(v3, a1[6]);
      }
    }

    v4 = (void *)a1[12];
    if (v4) {
      free(v4);
    }
    id v5 = (void *)a1[7];
    a1[7] = 0LL;

    xpc_object_t v6 = (void *)a1[2];
    a1[2] = 0LL;

    v7 = (void *)a1[3];
    a1[3] = 0LL;

    free(a1);
  }
}

void sub_100000A78(uint64_t a1)
{
  v1 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = 0LL;
}

void sub_100000A84(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  string = xpc_dictionary_get_string(v3, "ds_name");
  uint64_t v6 = sub_100000C70((uint64_t)string);
  v7 = (os_log_s *)qword_100008028;
  if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315138;
    v14 = string;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "[%s] Initial subscriber handshake ",  (uint8_t *)&v13,  0xCu);
  }

  if (v6)
  {
    if (*(void *)(v6 + 96))
    {
      int v8 = (void *)xpc_connection_copy_entitlement_value(v4);
      id v9 = v8;
      if (v8 && xpc_get_type(v8) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v9))
      {
        unsigned int v10 = 0;
      }

      else
      {
        if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_ERROR)) {
          sub_1000028FC();
        }
        unsigned int v10 = 1;
      }
    }

    else
    {
      unsigned int v10 = 0;
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_ERROR)) {
      sub_10000289C();
    }
    unsigned int v10 = 22;
  }

  xpc_object_t reply = xpc_dictionary_create_reply(v3);
  xpc_dictionary_set_uint64(reply, "ds_status", v10);
  if (!v10)
  {
    xpc_dictionary_set_uint64(reply, "ds_type", *(void *)(v6 + 80));
    xpc_endpoint_t v12 = xpc_endpoint_create(*(xpc_connection_t *)(v6 + 16));
    xpc_dictionary_set_value(reply, "endpoint", v12);
  }

  xpc_dictionary_send_reply(reply);
}

uint64_t sub_100000C70(uint64_t a1)
{
  uint64_t pointer = xpc_dictionary_get_pointer(qword_100008020, a1);
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_100008018);
  return pointer;
}

void sub_100000CB8(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  string = xpc_dictionary_get_string(v4, "ds_name");
  uint64_t v6 = sub_100000C70((uint64_t)string);
  v7 = (os_log_s *)qword_100008028;
  if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_INFO))
  {
    int v14 = 136315138;
    v15 = string;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "[%s] Publisher registering for datastore",  (uint8_t *)&v14,  0xCu);
  }

  if (v6)
  {
    int v8 = (void *)xpc_connection_copy_entitlement_value(v3);
    id v9 = v8;
    if (v8 && xpc_get_type(v8) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v9))
    {
      unsigned int v10 = 0;
    }

    else
    {
      if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_ERROR)) {
        sub_100002A1C();
      }
      unsigned int v10 = 1;
    }

    if ((*(_BYTE *)(v6 + 64) & 1) != 0)
    {
      if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_ERROR)) {
        sub_1000029BC();
      }
      unsigned int v10 = 37;
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_ERROR)) {
      sub_10000295C();
    }
    unsigned int v10 = 22;
  }

  xpc_object_t reply = xpc_dictionary_create_reply(v4);

  xpc_dictionary_set_uint64(reply, "ds_status", v10);
  if (!v10)
  {
    *(_BYTE *)(v6 + 64) |= 1u;
    xpc_dictionary_set_uint64(reply, "ds_type", *(void *)(v6 + 80));
    xpc_dictionary_set_uint64(reply, "max_size", *(void *)(v6 + 88));
    xpc_endpoint_t v12 = xpc_endpoint_create(*(xpc_connection_t *)(v6 + 24));
    xpc_dictionary_set_value(reply, "endpoint", v12);

    int v13 = (os_log_s *)qword_100008028;
    if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_INFO))
    {
      int v14 = 136315138;
      v15 = (const char *)(v6 + 104);
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "[%s] Invalidating data from producer's previous lifetime",  (uint8_t *)&v14,  0xCu);
    }

    sub_100000F48(v6);
  }

  xpc_dictionary_send_reply(reply);
}

void sub_100000F48(uint64_t a1)
{
  xpc_object_t v2 = (os_unfair_lock_s *)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
  id v3 = (unint64_t *)(a1 + 40);
  do
    id v4 = (void *)__ldxr(v3);
  while (__stxr(0LL, v3));
  if (v4)
  {
    if (*(void *)(a1 + 80) == 1LL) {
      free(v4);
    }
    else {
      munmap(v4, *(void *)(a1 + 48));
    }
    *(void *)(a1 + 48) = 0LL;
    sub_10000088C(a1);
  }

  os_unfair_lock_unlock(v2);
  id v5 = *(dispatch_queue_s **)(a1 + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100001F48;
  block[3] = &unk_100004470;
  block[4] = a1;
  dispatch_async(v5, block);
}

void sub_100000FF8(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = (const void *)a2[5];
  xpc_object_t xdict = v3;
  if (v4)
  {
    if (a2[10] == 1LL)
    {
      xpc_dictionary_set_data(v3, "ds_data", v4, a2[6]);
    }

    else
    {
      readonly = (void *)xpc_shmem_create_readonly(v4, a2[6]);
      xpc_dictionary_set_value(xdict, "ds_ool_data", readonly);
    }

    xpc_dictionary_set_uint64(xdict, "ds_type", a2[10]);
    uint64_t v5 = 0LL;
    id v3 = xdict;
  }

  else
  {
    uint64_t v5 = 96LL;
  }

  xpc_dictionary_set_uint64(v3, "ds_status", v5);
}

id sub_1000010A8(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v2, "ds_name", (const char *)(a1 + 104));
  id v3 = (void *)xpc_event_publisher_fire_with_reply_sync(qword_100008008, *(void *)(a1 + 72), v2);

  return v3;
}

void sub_100001108(uint64_t a1)
{
  if (!*(void *)(a1 + 40))
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 32));
    xpc_object_t v2 = (os_log_s *)qword_100008028;
    if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v15 = a1 + 104;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "[%s] Requesting data from producer", buf, 0xCu);
    }

    id v3 = sub_1000010A8(a1);
    id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
    if (!v4 || xpc_get_type(v4) == (xpc_type_t)&_xpc_type_error)
    {
      if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_ERROR)) {
        sub_100002A90();
      }
    }

    else
    {
      id v5 = v4;
      if ((*(_BYTE *)(a1 + 64) & 1) == 0) {
        sub_1000027E0();
      }
      id v4 = v5;
      region = 0LL;
      uint64_t v6 = *(void **)(a1 + 40);
      if (*(void *)(a1 + 80) == 1LL)
      {
        free(v6);
        data = xpc_dictionary_get_data(v4, "ds_data", (size_t *)(a1 + 48));
        size_t v8 = *(void *)(a1 + 48);
        id v9 = malloc(v8);
        region = v9;
        memcpy(v9, data, v8);
      }

      else
      {
        munmap(v6, *(void *)(a1 + 48));
        xpc_object_t value = xpc_dictionary_get_value(v4, "ds_ool_data");
        v11 = (void *)objc_claimAutoreleasedReturnValue(value);
        *(void *)(a1 + 48) = xpc_shmem_map(v11, &region);

        id v9 = region;
      }

      *(void *)(a1 + 40) = v9;
      xpc_endpoint_t v12 = (os_log_s *)qword_100008028;
      if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v15 = a1 + 104;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[%s] Populated with data", buf, 0xCu);
      }
    }
  }

void sub_100001338(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t uint64 = xpc_dictionary_get_uint64(v3, "request_type");
  if (uint64 == 6)
  {
    sub_100000CB8(v3, v4);
  }

  else if (uint64 == 1)
  {
    sub_100000A84(v3, v4);
  }

  else if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_ERROR))
  {
    sub_100002AF4();
  }
}

void sub_1000013E0(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_DEBUG)) {
    sub_100002E04();
  }
  if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_DEBUG)) {
    sub_100002D88();
  }
  if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_DEBUG)) {
    sub_100002D0C();
  }
  if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_DEBUG)) {
    sub_100002CA8();
  }
  if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_DEBUG)) {
    sub_100002C44();
  }
  xpc_object_t v2 = (void *)qword_100008028;
  if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_DEBUG)) {
    sub_100002BB8(a1, v2);
  }
  if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_DEBUG)) {
    sub_100002B54();
  }
}

void sub_100001504()
{
  v0 = (os_log_s *)qword_100008028;
  if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_INFO, "Printing out registered datastores...\n", buf, 2u);
  }

  xpc_dictionary_apply((xpc_object_t)qword_100008020, &stru_1000043A0);
  v1 = (os_log_s *)qword_100008028;
  if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)xpc_object_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "Done", v2, 2u);
  }

BOOL sub_1000015B8(id a1, const char *a2, OS_xpc_object *a3)
{
  id v3 = a3;
  uint64_t value = xpc_pointer_get_value(v3);
  sub_1000013E0(value);

  return 1;
}

void start()
{
  dword_100008018 = 0;
  xpc_object_t v0 = xpc_dictionary_create(0LL, 0LL, 0LL);
  v1 = (void *)qword_100008020;
  qword_100008020 = (uint64_t)v0;

  os_log_t v2 = os_log_create("com.apple.xpc.datastore", "datastored");
  id v3 = (void *)qword_100008028;
  qword_100008028 = (uint64_t)v2;

  dispatch_workloop_t v4 = dispatch_workloop_create("com.apple.datastored.ipc_wl");
  mach_service = xpc_connection_create_mach_service("com.apple.xpc.datastore", 0LL, 1uLL);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100001764;
  handler[3] = &unk_1000043C8;
  uint64_t v6 = v4;
  handler[4] = v6;
  xpc_connection_set_event_handler(mach_service, handler);
  objc_storeStrong(&qword_100008010, mach_service);
  objc_storeStrong((id *)&qword_100008000, v4);
  uint64_t v7 = xpc_event_publisher_create("com.apple.xpc.datastores.publish", v6);
  size_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000018A4;
  v9[3] = &unk_1000043E8;
  v9[4] = &qword_100008000;
  xpc_event_publisher_set_handler(v8, v9);
  xpc_event_publisher_set_error_handler(v8, &stru_100004428);
  objc_storeStrong((id *)&qword_100008008, v8);
  xpc_event_publisher_activate(v8);
  signal(30, (void (__cdecl *)(int))sub_100001504);
  dispatch_main();
}

void sub_100001764(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_connection)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10000180C;
    handler[3] = &unk_1000043C8;
    id v4 = v3;
    id v6 = v4;
    xpc_connection_set_event_handler((xpc_connection_t)v4, handler);
    xpc_connection_set_target_queue((xpc_connection_t)v4, *(dispatch_queue_t *)(a1 + 32));
    xpc_connection_resume((xpc_connection_t)v4);
  }
}

void sub_10000180C(uint64_t a1, void *a2)
{
  xpc_object_t object = a2;
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_dictionary)
  {
    sub_100001338(object, *(void **)(a1 + 32));
  }

  else
  {
    xpc_type_t type = xpc_get_type(object);

    if (type == (xpc_type_t)&_xpc_type_error) {
      xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
    }
  }

void sub_1000018A4(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  switch(a2)
  {
    case 2:
      xpc_connection_resume(*(xpc_connection_t *)(*(void *)(a1 + 32) + 16LL));
      break;
    case 1:
      *(void *)&__int128 buf = 0LL;
      *((void *)&buf + 1) = &buf;
      uint64_t v54 = 0x2020000000LL;
      v55 = 0LL;
      os_unfair_lock_lock((os_unfair_lock_t)&dword_100008018);
      *(void *)__s = _NSConcreteStackBlock;
      uint64_t v44 = 3221225472LL;
      v45 = sub_100002728;
      v46 = &unk_1000044E0;
      p___int128 buf = &buf;
      uint64_t v48 = a3;
      xpc_dictionary_apply((xpc_object_t)qword_100008020, __s);
      uint64_t v31 = *(void *)(*((void *)&buf + 1) + 24LL);
      if (v31)
      {
        v32 = (os_log_s *)qword_100008028;
        if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_INFO))
        {
          LODWORD(handler) = 136315138;
          *(void *)((char *)&handler + 4) = v31 + 104;
          _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_INFO,  "[%s] Removing datastore from registered list",  (uint8_t *)&handler,  0xCu);
          uint64_t v31 = *(void *)(*((void *)&buf + 1) + 24LL);
        }

        xpc_dictionary_set_value((xpc_object_t)qword_100008020, (const char *)(v31 + 104), 0LL);
        os_unfair_lock_unlock((os_unfair_lock_t)&dword_100008018);
        sub_100001F80(*(void *)(*((void *)&buf + 1) + 24LL));
      }

      else
      {
        os_unfair_lock_unlock((os_unfair_lock_t)&dword_100008018);
        v33 = (os_log_s *)qword_100008028;
        if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_ERROR)) {
          sub_100002F28(a3, v33, v34, v35, v36, v37, v38, v39);
        }
      }

      _Block_object_dispose(&buf, 8);
      break;
    case 0:
      char event_name = xpc_get_event_name("com.apple.xpc.datastores.publish", a3, __s);
      id v9 = (os_log_s *)qword_100008028;
      if ((event_name & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_INFO))
        {
          LODWORD(buf) = 136315138;
          *(void *)((char *)&buf + 4) = __s;
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "[%s] Adding info for datastore",  (uint8_t *)&buf,  0xCu);
        }

        id v10 = v7;
        size_t v11 = strlen(__s);
        xpc_endpoint_t v12 = calloc(1uLL, v11 + 105);
        int v13 = (void **)v12;
        if (v12)
        {
          strcpy((char *)v12 + 104, __s);
          id v14 = v10;
          v13[9] = (void *)a3;
          int64_t int64 = xpc_dictionary_get_int64(v14, "SizeLimit");
          v13[11] = (void *)int64;
          if (int64)
          {
            v13[10] = (void *)1;
            string = xpc_dictionary_get_string(v14, "RequiresEntitlement");
            if (string) {
              v13[12] = strdup(string);
            }
            *((_DWORD *)v13 + 8) = 0;
            xpc_object_t v17 = xpc_array_create(0LL, 0LL);
            v18 = v13[7];
            v13[7] = v17;

            *((_BYTE *)v13 + 64) &= ~1u;
            label = 0LL;
            asprintf(&label, "%s.ipc_dq", (const char *)v13 + 104);
            dispatch_queue_t v19 = dispatch_queue_create_with_target_V2(label, 0LL, (dispatch_queue_t)qword_100008000);
            dispatch_set_finalizer_f(v19, (dispatch_function_t)sub_100000A78);
            dispatch_set_context(v19, v13);
            v20 = *v13;
            *int v13 = v19;
            v41 = v19;

            free(label);
            asprintf(&label, "%s.launch_pub_dq", (const char *)v13 + 104);
            dispatch_queue_t v21 = dispatch_queue_create(label, 0LL);
            dispatch_set_finalizer_f(v21, (dispatch_function_t)sub_100000850);
            dispatch_set_context(v21, v13);
            v22 = v13[1];
            v13[1] = v21;
            v23 = v21;

            free(label);
            v24 = xpc_connection_create(0LL, 0LL);
            *(void *)&__int128 buf = _NSConcreteStackBlock;
            *((void *)&buf + 1) = 3221225472LL;
            uint64_t v54 = (uint64_t)sub_100001FC8;
            v55 = &unk_100004490;
            v56 = v13;
            xpc_connection_set_event_handler(v24, &buf);
            v25 = v13[2];
            v13[2] = v24;
            v26 = v24;

            xpc_connection_activate(v26);
            v27 = xpc_connection_create(0LL, 0LL);
            *(void *)&__int128 handler = _NSConcreteStackBlock;
            *((void *)&handler + 1) = 3221225472LL;
            v50 = sub_100002394;
            v51 = &unk_100004490;
            v52 = v13;
            xpc_connection_set_event_handler(v27, &handler);
            v28 = v13[3];
            v13[3] = v27;
            v29 = v27;

            xpc_connection_activate(v29);
            os_unfair_lock_lock((os_unfair_lock_t)&dword_100008018);
            uint64_t pointer = xpc_dictionary_get_pointer(qword_100008020, __s);
            if (pointer)
            {
              xpc_dictionary_set_pointer(qword_100008020, __s, 0LL);
              sub_100001F80(pointer);
              sub_100000978(v13);
              if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_ERROR)) {
                sub_100002E68();
              }
            }

            else
            {
              xpc_dictionary_set_pointer(qword_100008020, __s, v13);
            }

            os_unfair_lock_unlock((os_unfair_lock_t)&dword_100008018);
            goto LABEL_28;
          }
        }

        else
        {
          id v40 = v10;
        }

LABEL_28:
        break;
      }

      if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_ERROR)) {
        sub_100002EC8();
      }
      break;
  }
}

void sub_100001DC8(_Unwind_Exception *a1)
{
}

void sub_100001DE8(id a1, int a2)
{
  id v3 = (os_log_s *)qword_100008028;
  if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_ERROR)) {
    sub_100002FA0(a2, v3);
  }
}

uint64_t sub_100001E2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  mach_port_name_t v4 = xpc_mach_send_copy_right(a3);
  if (v4 - 1 <= 0xFFFFFFFD)
  {
    mach_port_name_t v5 = v4;
    id v6 = (void *)xpc_pipe_create_from_port();
    int v7 = xpc_pipe_simpleroutine(v6, *(void *)(a1 + 32));
    if (v7)
    {
      int v8 = v7;
      id v9 = (os_log_s *)qword_100008028;
      if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = *(void *)(a1 + 40) + 104LL;
        int v12 = 136315650;
        uint64_t v13 = v11;
        __int16 v14 = 1024;
        mach_port_name_t v15 = v5;
        __int16 v16 = 1024;
        int v17 = v8;
        _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "[%s] Unable to send invalidation to client %#x: %d",  (uint8_t *)&v12,  0x18u);
      }
    }

    mach_port_deallocate(mach_task_self_, v5);
  }

  return 1LL;
}

void sub_100001F48(uint64_t a1)
{
}

void sub_100001F80(uint64_t a1)
{
  os_log_t v2 = *(void **)a1;
  *(void *)a1 = 0LL;

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 32));
}

void sub_100001FC8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_connection)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100002074;
    handler[3] = &unk_1000043C8;
    id v4 = v3;
    id v6 = v4;
    xpc_connection_set_event_handler((xpc_connection_t)v4, handler);
    xpc_connection_set_target_queue((xpc_connection_t)v4, **(dispatch_queue_t **)(a1 + 32));
    xpc_connection_activate((xpc_connection_t)v4);
  }
}

void sub_100002074(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_dictionary)
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(v3, "request_type");
    if (uint64 == 3)
    {
      mach_port_name_t v5 = v3;
      int v6 = 1;
      goto LABEL_6;
    }

    if (uint64 == 2)
    {
      mach_port_name_t v5 = v3;
      int v6 = 0;
LABEL_6:
      sub_100002120(v5, v6);
      goto LABEL_10;
    }

    int v7 = (os_log_s *)qword_100008028;
    if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_ERROR)) {
      sub_100003014(v7);
    }
    xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
  }

LABEL_10:
}

void sub_100002120(void *a1, int a2)
{
  id v3 = a1;
  xpc_object_t reply = xpc_dictionary_create_reply(v3);
  string = xpc_dictionary_get_string(v3, "ds_name");
  uint64_t v6 = sub_100000C70((uint64_t)string);
  int v7 = (os_log_s *)qword_100008028;
  if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    int v17 = string;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%s] Requesting datastore data", buf, 0xCu);
  }

  if (v6)
  {
    xpc_object_t value = xpc_dictionary_get_value(v3, "ds_data_invalid_notify");
    id v9 = (void *)objc_claimAutoreleasedReturnValue(value);
    if (*(void *)(v6 + 40))
    {
      os_unfair_lock_lock((os_unfair_lock_t)(v6 + 32));
      sub_100000FF8(reply, (void *)v6);
      xpc_array_append_value(*(xpc_object_t *)(v6 + 56), v9);
      os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 32));
    }

    else
    {
      id v10 = (os_log_s *)qword_100008028;
      if (!a2)
      {
        if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_DEBUG)) {
          sub_1000030B4();
        }
        uint64_t v11 = *(void *)(v6 + 8);
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472LL;
        v12[2] = sub_1000026D0;
        v12[3] = &unk_1000044B8;
        uint64_t v15 = v6;
        id v13 = reply;
        id v14 = v9;
        xpc_dictionary_handoff_reply(v13, v11, v12);

        goto LABEL_14;
      }

      if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 136315138;
        int v17 = string;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "[%s] Datastore not populated but soft demand request - returning ENODATA",  buf,  0xCu);
      }

      xpc_dictionary_set_uint64(reply, "ds_status", 0x60uLL);
    }

    xpc_dictionary_send_reply(reply);
LABEL_14:

    goto LABEL_15;
  }

  if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_ERROR)) {
    sub_100003054();
  }
  xpc_dictionary_set_uint64(reply, "ds_status", 0x16uLL);
  xpc_dictionary_send_reply(reply);
LABEL_15:
}

void sub_100002394(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_connection)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100002468;
    handler[3] = &unk_1000043C8;
    id v4 = v3;
    id v7 = v4;
    xpc_connection_set_event_handler((xpc_connection_t)v4, handler);
    xpc_connection_set_target_queue((xpc_connection_t)v4, **(dispatch_queue_t **)(a1 + 32));
    mach_port_name_t v5 = strdup((const char *)(*(void *)(a1 + 32) + 104LL));
    xpc_connection_set_context((xpc_connection_t)v4, v5);
    xpc_connection_set_finalizer_f((xpc_connection_t)v4, (xpc_finalizer_t)&_free);
    xpc_connection_activate((xpc_connection_t)v4);
  }
}

void sub_100002468(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_type_t type = xpc_get_type(v3);
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(v3, "request_type");
    if (uint64 != 7)
    {
      if (uint64 == 4)
      {
        id v10 = v3;
        string = xpc_dictionary_get_string(v10, "ds_name");
        int v12 = (os_log_s *)qword_100008028;
        if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_INFO))
        {
          int v16 = 136315138;
          int v17 = string;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "[%s] Invalidating data",  (uint8_t *)&v16,  0xCu);
        }

        xpc_object_t reply = xpc_dictionary_create_reply(v10);

        uint64_t v14 = sub_100000C70((uint64_t)string);
        if (v14)
        {
          sub_100000F48(v14);
          uint64_t v15 = 0LL;
        }

        else
        {
          uint64_t v15 = 22LL;
        }

        xpc_dictionary_set_uint64(reply, "ds_status", v15);
        xpc_dictionary_send_reply(reply);
      }

      else if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_ERROR))
      {
        sub_100002AF4();
      }
    }
  }

  else if (type == (xpc_type_t)&_xpc_type_error)
  {
    context = (const char *)xpc_connection_get_context(*(xpc_connection_t *)(a1 + 32));
    uint64_t v6 = (os_log_s *)qword_100008028;
    if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_INFO))
    {
      int v16 = 136315138;
      int v17 = context;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "[%s] Publisher gone - relinquishing datastore",  (uint8_t *)&v16,  0xCu);
    }

    uint64_t v7 = sub_100000C70((uint64_t)context);
    if (v7)
    {
      if ((*(_BYTE *)(v7 + 64) & 1) == 0) {
        sub_1000027E0();
      }
      *(_BYTE *)(v7 + 64) &= ~1u;
      int v8 = (os_log_s *)qword_100008028;
      if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_INFO))
      {
        int v16 = 136315138;
        int v17 = context;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "[%s] Clearing ownership of datastore",  (uint8_t *)&v16,  0xCu);
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_ERROR))
    {
      sub_100003114();
    }
  }
}

uint64_t sub_1000026D0(uint64_t a1)
{
  return xpc_dictionary_send_reply(*(void *)(a1 + 32));
}

uint64_t sub_100002728(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t value = xpc_pointer_get_value(a3);
  if (!value) {
    return 1LL;
  }
  uint64_t v5 = value;
  if (*(void *)(value + 72) != *(void *)(a1 + 40)) {
    return 1LL;
  }
  uint64_t result = 0LL;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v5;
  return result;
}

void sub_10000277C( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_100002794( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

uint64_t sub_1000027BC()
{
  return _os_assert_log(0LL);
}

void sub_1000027C4( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

size_t sub_1000027D4()
{
  return xpc_array_get_count(v0);
}

void sub_1000027E0()
{
  uint64_t v0 = sub_1000027BC();
  _os_crash(v0);
  __break(1u);
}

void sub_1000027F4(uint64_t a1, void *a2)
{
  uint64_t v3 = a1 + 104;
  id v4 = a2;
  int v5 = 136315394;
  uint64_t v6 = v3;
  __int16 v7 = 2048;
  size_t v8 = sub_1000027D4();
  _os_log_debug_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEBUG,  "[%s] Notifying %zu subscribers of data invalidation",  (uint8_t *)&v5,  0x16u);
}

void sub_10000289C()
{
}

void sub_1000028FC()
{
}

void sub_10000295C()
{
}

void sub_1000029BC()
{
}

void sub_100002A1C()
{
}

void sub_100002A90()
{
}

void sub_100002AF4()
{
}

void sub_100002B54()
{
  sub_100002794((void *)&_mh_execute_header, v0, v1, "\tdata_size     = %zu\n", v2, v3, v4, v5, v6);
  sub_10000278C();
}

void sub_100002BB8(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_1000027D4();
  sub_1000027A4();
  _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "\t#subscribers  = %zu", v4, 0xCu);
}

void sub_100002C44()
{
  sub_100002794((void *)&_mh_execute_header, v0, v1, "\tentitlement   = %s", v2, v3, v4, v5, v6);
  sub_10000278C();
}

void sub_100002CA8()
{
  sub_100002794((void *)&_mh_execute_header, v0, v1, "\tmax_size      = %llu", v2, v3, v4, v5, v6);
  sub_10000278C();
}

void sub_100002D0C()
{
  sub_100002794((void *)&_mh_execute_header, v0, v1, "\tds_type       = %s", v2, v3, v4, v5, v6);
  sub_10000278C();
}

void sub_100002D88()
{
  sub_100002794((void *)&_mh_execute_header, v0, v1, "\tchecked in    = %s", v2, v3, v4, v5, v6);
  sub_10000278C();
}

void sub_100002E04()
{
}

void sub_100002E68()
{
}

void sub_100002EC8()
{
}

void sub_100002F28( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000027C4( (void *)&_mh_execute_header,  a2,  a3,  "[%s] Could not find a datastore tracking the specified token = %#llx",  a5,  a6,  a7,  a8,  2u);
  sub_10000278C();
}

void sub_100002FA0(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "datastored received error %d\n",  (uint8_t *)v2,  8u);
}

void sub_100003014(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Received unknown datastore request type on subscriber connection",  v1,  2u);
}

void sub_100003054()
{
  sub_10000277C( (void *)&_mh_execute_header,  v0,  v1,  "[%s] Datastore not present - returning EINVAL",  v2,  v3,  v4,  v5,  v6);
  sub_10000278C();
}

void sub_1000030B4()
{
}

void sub_100003114()
{
}