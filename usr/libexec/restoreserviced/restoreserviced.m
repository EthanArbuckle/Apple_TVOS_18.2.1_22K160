void start()
{
  dispatch_queue_t v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  v0 = dispatch_queue_create("restoreservice_queue", 0LL);
  v1 = (void *)qword_10002E468;
  qword_10002E468 = (uint64_t)v0;

  v2 = (id)qword_10002E468;
  if (v2)
  {

    v3 = (id)xpc_remote_connection_create_remote_service_listener( "com.apple.RestoreRemoteServices.restoreserviced",  qword_10002E468,  1LL);
    if (v3)
    {
      v4 = v3;

      xpc_remote_connection_set_event_handler(v4, &stru_100024918);
      xpc_remote_connection_activate(v4);
      dispatch_main();
    }
  }

  else
  {
    v5 = _os_assert_log();
    _os_crash(v5);
    __break(1u);
  }

  v6 = _os_assert_log();
  _os_crash(v6);
  __break(1u);
}

void sub_1000045F0(id a1, OS_xpc_object *a2)
{
  v2 = a2;
  if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_error)
  {
    id v4 = sub_1000046F8();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10001639C();
    }

    uint64_t v6 = xpc_copy_clean_description(v2);
    if (v6)
    {
      v7 = (void *)v6;
      id v8 = sub_1000046F8();
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100016338((uint64_t)v7, v9, v10, v11, v12, v13, v14, v15);
      }

      free(v7);
    }
  }

  else
  {
    v3 = v2;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100004738;
    v16[3] = &unk_100024940;
    v17 = v3;
    xpc_remote_connection_set_event_handler(v3, v16);
    xpc_remote_connection_activate(v3);
  }
}

id sub_1000046F8()
{
  if (qword_10002E470 != -1) {
    dispatch_once(&qword_10002E470, &stru_100024980);
  }
  return (id)qword_10002E478;
}

void sub_100004738(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_get_type(v3) != (xpc_type_t)&_xpc_type_error)
  {
    id v4 = (_xpc_connection_s *)*(id *)(a1 + 32);
    id v5 = v3;
    uint64_t v6 = objc_autoreleasePoolPush();
    if ((xpc_dictionary_expects_reply(v5) & 1) == 0)
    {
      id v30 = sub_1000046F8();
      v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        sub_100016690();
      }

      xpc_connection_cancel(v4);
      goto LABEL_68;
    }

    string = xpc_dictionary_get_string(v5, "command");
    id v8 = sub_1000046F8();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    uint64_t v10 = v9;
    if (!string)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10001646C();
      }
LABEL_26:

      sub_10000529C(v5, "error");
      id v33 = v32;
LABEL_33:
      xpc_object_t reply = v33;
LABEL_66:
      id v86 = reply;
      if (!v86) {
        sub_100016458();
      }
      v87 = v86;

      xpc_dictionary_send_reply(v87);
LABEL_68:
      objc_autoreleasePoolPop(v6);

      goto LABEL_69;
    }

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)cf = 136446210;
      *(void *)&cf[4] = string;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Got command %{public}s", cf, 0xCu);
    }

    if (!strcmp(string, "recovery"))
    {
      id v34 = v5;
      io_registry_entry_t v35 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
      if (v35)
      {
        io_registry_entry_t v36 = v35;
        CFDataRef v37 = CFDataCreate(0LL, (const UInt8 *)"false", 5LL);
        if (!v37) {
          sub_100016458();
        }
        CFDataRef v38 = v37;
        uint64_t v39 = IORegistryEntrySetCFProperty(v36, @"auto-boot-once", v37);
        id v40 = sub_1000046F8();
        v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
        v42 = v41;
        if ((_DWORD)v39)
        {
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
            sub_100016508(v39, v42, v43, v44, v45, v46, v47, v48);
          }
        }

        else if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)cf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "auto-boot successfully disabled (via auto-boot-once)",  cf,  2u);
        }

        CFRelease(v38);
        IOObjectRelease(v36);
        if (!(_DWORD)v39)
        {
          id v68 = sub_100004DC0(v34);
          id v69 = (id)objc_claimAutoreleasedReturnValue(v68);
LABEL_50:
          xpc_object_t reply = v69;
          goto LABEL_65;
        }

LABEL_49:
        sub_10000529C(v34, "error");
        id v69 = v72;
        goto LABEL_50;
      }

      id v58 = sub_1000046F8();
      v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
        sub_100016498(v59, v60, v61, v62, v63, v64, v65, v66);
      }
    }

    else
    {
      if (!strcmp(string, "reboot"))
      {
        id v49 = sub_100004DC0(v5);
        id v33 = (id)objc_claimAutoreleasedReturnValue(v49);
        goto LABEL_33;
      }

      if (strcmp(string, "getnonces"))
      {
        if (strcmp(string, "getpreflightinfo"))
        {
          if (!strcmp(string, "getapparameters"))
          {
            id v70 = sub_100004E70(v5);
            id v33 = (id)objc_claimAutoreleasedReturnValue(v70);
            goto LABEL_33;
          }

          if (!strcmp(string, "delayrecoveryimage"))
          {
            id v73 = sub_100004F80(v5);
            id v33 = (id)objc_claimAutoreleasedReturnValue(v73);
            goto LABEL_33;
          }

          if (!strcmp(string, "restorelang"))
          {
            v88 = xpc_dictionary_get_string(v5, "argument");
            id v89 = sub_100005110(v5, v88);
            id v33 = (id)objc_claimAutoreleasedReturnValue(v89);
            goto LABEL_33;
          }

          id v11 = sub_1000046F8();
          uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
            sub_10001662C((uint64_t)string, v10, v12, v13, v14, v15, v16, v17);
          }
          goto LABEL_26;
        }

        id v34 = v5;
        *(void *)cf = 0LL;
        updated = ramrod_update_copy_deviceinfo(0, (CFErrorRef *)cf);
        if (updated)
        {
          xpc_object_t reply = xpc_dictionary_create_reply(v34);
          v67 = (void *)_CFXPCCreateXPCObjectFromCFObject(updated);
          xpc_dictionary_set_value(reply, "preflightinfo", v67);

          xpc_dictionary_set_string(reply, "result", "preflightinfo");
        }

        else
        {
          if (*(void *)cf)
          {
            id v77 = sub_1000046F8();
            v78 = (os_log_s *)objc_claimAutoreleasedReturnValue(v77);
            if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR)) {
              sub_1000165C4((uint64_t)cf, v78, v79, v80, v81, v82, v83, v84);
            }

            CFRelease(*(CFTypeRef *)cf);
          }

          sub_10000529C(v34, "error");
          xpc_object_t reply = v85;
        }

        if (*(void *)cf) {
          CFRelease(*(CFTypeRef *)cf);
        }
        if (updated) {
          goto LABEL_63;
        }
LABEL_65:

        goto LABEL_66;
      }

      id v34 = v5;
      uint64_t v51 = MGCopyAnswer(@"ApNonce", 0LL);
      if (v51)
      {
        updated = (__CFDictionary *)v51;
        uint64_t v53 = MGCopyAnswer(@"SEPNonce", 0LL);
        if (v53)
        {
          v54 = (__CFDictionary *)v53;
          xpc_object_t reply = xpc_dictionary_create_reply(v34);
          v55 = (void *)_CFXPCCreateXPCObjectFromCFObject(updated);
          xpc_dictionary_set_value(reply, "apNonce", v55);

          v56 = (void *)_CFXPCCreateXPCObjectFromCFObject(v54);
          xpc_dictionary_set_value(reply, "sepNonce", v56);

          xpc_dictionary_set_string(reply, "result", "nonces");
          CFRelease(updated);
          v57 = v54;
LABEL_64:
          CFRelease(v57);
          goto LABEL_65;
        }

        id v74 = sub_1000046F8();
        v75 = (os_log_s *)objc_claimAutoreleasedReturnValue(v74);
        if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR)) {
          sub_100016598();
        }

        sub_10000529C(v34, "error");
        xpc_object_t reply = v76;
LABEL_63:
        v57 = updated;
        goto LABEL_64;
      }

      id v71 = sub_1000046F8();
      v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v71);
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
        sub_10001656C();
      }
    }

    goto LABEL_49;
  }

  id v18 = sub_1000046F8();
  v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    sub_10001642C();
  }

  uint64_t v20 = xpc_copy_clean_description(v3);
  if (v20)
  {
    v21 = (void *)v20;
    id v22 = sub_1000046F8();
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_1000163C8((uint64_t)v21, v23, v24, v25, v26, v27, v28, v29);
    }

    free(v21);
  }

LABEL_69:
}

void sub_100004D90(id a1)
{
  os_log_t v1 = os_log_create("com.apple.RestoreRemoteServices.restoreservice", "restoreservice");
  v2 = (void *)qword_10002E478;
  qword_10002E478 = (uint64_t)v1;
}

id sub_100004DC0(void *a1)
{
  id v1 = a1;
  dispatch_time_t v2 = dispatch_time(0LL, 3000000000LL);
  dispatch_after(v2, (dispatch_queue_t)qword_10002E468, &stru_1000249A0);
  id v3 = sub_1000046F8();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Calling reboot3 imminently", v8, 2u);
  }

  sub_10000529C(v1, "success");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

id sub_100004E70(void *a1)
{
  id v1 = a1;
  CFTypeRef cf = 0LL;
  CFDictionaryRef updated = ramrod_update_copy_ap_parameters_generating_nonces(0LL);
  if (updated)
  {
    xpc_object_t reply = xpc_dictionary_create_reply(v1);
    id v4 = (void *)_CFXPCCreateXPCObjectFromCFObject(updated);
    xpc_dictionary_set_value(reply, "apparameters", v4);

    xpc_dictionary_set_string(reply, "result", "apparameters");
  }

  else
  {
    sub_10000529C(v1, "error");
    xpc_object_t reply = v5;
  }

  if (cf) {
    CFRelease(cf);
  }
  if (updated) {
    CFRelease(updated);
  }

  return reply;
}

id sub_100004F80(void *a1)
{
  id v1 = a1;
  if (MGGetProductType() != 376943508)
  {
LABEL_11:
    sub_10000529C(v1, "error");
    id v26 = v25;
    goto LABEL_12;
  }

  io_registry_entry_t v2 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
  if (!v2)
  {
    id v16 = sub_1000046F8();
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100016498(v17, v18, v19, v20, v21, v22, v23, v24);
    }

    goto LABEL_11;
  }

  io_registry_entry_t v3 = v2;
  CFDataRef v4 = CFDataCreate(0LL, (const UInt8 *)"true", 4LL);
  if (!v4) {
    sub_100016458();
  }
  CFDataRef v5 = v4;
  uint64_t v6 = IORegistryEntrySetCFProperty(v3, @"delay-recovery-image", v4);
  id v7 = sub_1000046F8();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if ((_DWORD)v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100016508(v6, v9, v10, v11, v12, v13, v14, v15);
    }

    CFRelease(v5);
    IOObjectRelease(v3);
    goto LABEL_11;
  }

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v30 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "delay-recovery-image successfully enabled",  v30,  2u);
  }

  CFRelease(v5);
  IOObjectRelease(v3);
  sub_10000529C(v1, "success");
  id v26 = (id)objc_claimAutoreleasedReturnValue(v29);
LABEL_12:
  uint64_t v27 = v26;

  return v27;
}

id sub_100005110(void *a1, const char *a2)
{
  id v3 = a1;
  if (MGGetProductType() == 376943508)
  {
    if (a2)
    {
      size_t v4 = strlen(a2);
      CFDataRef v5 = CFDataCreate(0LL, (const UInt8 *)a2, v4);
      if (!v5) {
        sub_100016458();
      }
      CFDataRef v6 = v5;
      io_registry_entry_t v7 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
      if (v7)
      {
        io_object_t v8 = v7;
        uint64_t v9 = IORegistryEntrySetCFProperty(v7, @"restore-lang", v6);
        if (!(_DWORD)v9)
        {
          CFRelease(v6);
          IOObjectRelease(v8);
          sub_10000529C(v3, "success");
          id v31 = (id)objc_claimAutoreleasedReturnValue(v34);
          goto LABEL_16;
        }

        uint64_t v10 = v9;
        id v11 = sub_1000046F8();
        uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          sub_100016508(v10, v12, v13, v14, v15, v16, v17, v18);
        }

        CFRelease(v6);
        IOObjectRelease(v8);
      }

      else
      {
        id v21 = sub_1000046F8();
        uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          sub_100016498(v22, v23, v24, v25, v26, v27, v28, v29);
        }

        CFRelease(v6);
      }
    }

    else
    {
      id v19 = sub_1000046F8();
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_1000166BC();
      }
    }
  }

  sub_10000529C(v3, "error");
  id v31 = v30;
LABEL_16:
  id v32 = v31;

  return v32;
}

void sub_10000529C(void *a1, const char *a2)
{
  id v3 = a1;
  xpc_object_t reply = xpc_dictionary_create_reply(v3);
  if (reply)
  {
    CFDataRef v5 = reply;
    xpc_dictionary_set_string(reply, "result", a2);

    id v6 = v5;
  }

  else
  {
    id v7 = sub_1000046F8();
    io_object_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000166E8(v8, v9, v10, v11, v12, v13, v14, v15);
    }

    __break(1u);
  }
}

void sub_100005314(id a1)
{
  id v1 = sub_1000046F8();
  io_registry_entry_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)CFDataRef v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Calling reboot3 now", v5, 2u);
  }

  if (reboot3(0LL))
  {
    id v3 = sub_1000046F8();
    size_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_100016758(v4);
    }
  }

void sub_1000053AC( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_1000053BC( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void sub_1000053DC( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

uint64_t sub_1000053F8()
{
  return _os_assert_log(0LL);
}

uint64_t AMRestorePartitionFWCopyTagData( const __CFURL *a1, const __CFString *a2, CFTypeRef *a3, off_t *a4, CFTypeRef *a5, off_t *a6)
{
  id v6 = a1;
  size_t __size = 0LL;
  uint64_t v63 = 0LL;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  memset(v40, 0, sizeof(v40));
  if (!a1)
  {
    AMSupportLogInternal(3LL, "AMRestorePartitionFWCopyTagData", "inURL is NULL");
    id v19 = 0LL;
LABEL_53:
    CFDataRef v25 = 0LL;
    uint64_t v17 = 0LL;
    uint64_t v24 = 99LL;
    goto LABEL_46;
  }

  int v11 = sub_10000597C(a1, 0);
  if (!v11)
  {
    AMSupportLogInternal(3LL, "AMRestorePartitionFWCopyTagData", "Unable to open inURL %@", v6);
    id v19 = 0LL;
    id v6 = 0LL;
    goto LABEL_53;
  }

  int v12 = v11;
  id v6 = malloc(0x8000uLL);
  if (v6)
  {
    ssize_t v13 = read(v12, v6, 0x8000uLL);
    if (v13)
    {
      ssize_t v14 = v13;
      id v32 = a3;
      id v33 = a6;
      id v31 = a4;
      char v35 = 0;
      off_t v34 = 0LL;
      off_t v15 = 0LL;
      unsigned int v16 = 0;
      CFDataRef cf = 0LL;
      uint64_t v17 = 0LL;
      while (1)
      {
        size_t __size = 0LL;
        int v18 = Img4DecodeParseLengthFromBuffer(v6, v14, &__size);
        if (v18 || !__size) {
          break;
        }
        id v19 = malloc(__size);
        if (!v19)
        {
          AMSupportLogInternal(3LL, "AMRestorePartitionFWCopyTagData", "failed to allocate IMG4buffer", v29, v30);
          goto LABEL_25;
        }

        off_t v20 = lseek(v12, v15, 0);
        if (v20 != v15)
        {
          off_t v27 = v20;
          uint64_t v28 = __error();
          AMSupportLogInternal( 3LL,  "AMRestorePartitionFWCopyTagData",  "Unable to rewind to start of IMG4 segment lseek=%ll, errno=%d.",  v27,  *v28);
          goto LABEL_25;
        }

        ssize_t v21 = read(v12, v19, __size);
        if (!v21)
        {
          __error();
          AMSupportLogInternal( 3LL,  "AMRestorePartitionFWCopyTagData",  "0 bytes read, IMG4 image hit end of block device? - fail errno=%d..");
          goto LABEL_25;
        }

        CFIndex v22 = v21;
        if (v21 != __size)
        {
          AMSupportLogInternal(3LL, "AMRestorePartitionFWCopyTagData", "Bytes read didn't match derLen.");
          goto LABEL_25;
        }

        int v23 = Img4DecodeInit(v19, v21, v40);
        if (v23)
        {
          AMSupportLogInternal( 3LL,  "AMRestorePartitionFWCopyTagData",  "Item %02d, der.length=%8d, Bad Img4 inside valid DER sequence. (derstat=%d)",  v16 + 1,  v22,  v23);
        }

        else
        {
          AMSupportSafeRelease(v17);
          uint64_t v17 = CFStringCreateWithBytes(kCFAllocatorDefault, *((const UInt8 **)&v41 + 1), v42, 0x8000100u, 0);
          AMSupportLogInternal( 3LL,  "AMRestorePartitionFWCopyTagData",  "Item %02d, offset=%8d, der.length=%8d, img4Tag=[%@]",  v16 + 1,  v15,  v22,  v17);
          if (a2 && CFStringCompare(a2, v17, 0LL) == kCFCompareEqualTo)
          {
            AMSupportLogInternal( 6LL,  "AMRestorePartitionFWCopyTagData",  "   ^^ Found requested tag.",  v16 + 1,  v22,  v17);
            if (a5)
            {
              if (!cf)
              {
                CFDataRef cf = CFDataCreate(kCFAllocatorDefault, (const UInt8 *)v19, v22);
                if (!cf)
                {
                  AMSupportLogInternal(3LL, "AMRestorePartitionFWCopyTagData", "Failed to allocate Img4Data");
                  CFDataRef v25 = 0LL;
                  goto LABEL_60;
                }
              }
            }

            char v35 = 1;
            off_t v34 = v15;
          }
        }

        v15 += __size;
        AMSupportSafeFree(v19);
        ssize_t v14 = read(v12, v6, 0x8000uLL);
        ++v16;
        if (!v14) {
          goto LABEL_27;
        }
      }

      AMSupportLogInternal(6LL, "AMRestorePartitionFWCopyTagData", "No more segments. (derstat=%d)", v18);
      if (!v16) {
        goto LABEL_23;
      }
LABEL_27:
      if (v16 >= 0x21)
      {
        AMSupportLogInternal(3LL, "AMRestorePartitionFWCopyTagData", "Too Many DER segments!", v29, v30);
        goto LABEL_24;
      }

      if (lseek(v12, v15, 0) != v15)
      {
        __error();
        AMSupportLogInternal(3LL, "AMRestorePartitionFWCopyTagData", "Unable to seek to terminator segment errno=%d.");
        goto LABEL_24;
      }

      __int16 v38 = -1;
      if (read(v12, &v38, 2uLL) != 2)
      {
        AMSupportLogInternal(3LL, "AMRestorePartitionFWCopyTagData", "Failed to read terminator bytes.", v29, v30);
        goto LABEL_24;
      }

      if (v38 | HIBYTE(v38))
      {
        AMSupportLogInternal(3LL, "AMRestorePartitionFWCopyTagData", "Invalid termination bytes: [0x%02x, 0x%02x]");
        goto LABEL_24;
      }

      if ((a2 == 0LL) | v35 & 1) {
        uint64_t v24 = 0LL;
      }
      else {
        uint64_t v24 = 8LL;
      }
      if (v33) {
        *id v33 = v15;
      }
      if (v31) {
        off_t *v31 = v34;
      }
      CFDataRef v25 = cf;
      if (v32 && v17) {
        *id v32 = CFRetain(v17);
      }
      id v19 = 0LL;
      if (a5 && cf)
      {
        id v19 = 0LL;
        *a5 = CFRetain(cf);
      }
    }

    else
    {
      CFDataRef cf = 0LL;
      uint64_t v17 = 0LL;
LABEL_23:
      AMSupportLogInternal(3LL, "AMRestorePartitionFWCopyTagData", "No DER segments found.");
LABEL_24:
      id v19 = 0LL;
LABEL_25:
      uint64_t v24 = 99LL;
      CFDataRef v25 = cf;
    }
  }

  else
  {
    AMSupportLogInternal(3LL, "AMRestorePartitionFWCopyTagData", "failed to allocate DER chunk buffer");
    uint64_t v17 = 0LL;
    CFDataRef v25 = 0LL;
    id v19 = 0LL;
LABEL_60:
    uint64_t v24 = 99LL;
  }

  if (v12 >= 1) {
    close(v12);
  }
LABEL_46:
  AMSupportSafeFree(v6);
  AMSupportSafeFree(v19);
  AMSupportSafeRelease(v17);
  AMSupportSafeRelease(v25);
  return v24;
}

uint64_t sub_10000597C(const __CFURL *a1, int a2)
{
  if (!CFURLGetFileSystemRepresentation(a1, 1u, buffer, 1024LL))
  {
    AMSupportLogInternal( 3LL,  "_AMRestorePartitionOpenFileWithURL",  "failed to convert url to file system representation");
    AMSupportLogInternal(7LL, "_AMRestorePartitionOpenFileWithURL", "%@", a1);
    return 0xFFFFFFFFLL;
  }

  uint64_t v4 = open((const char *)buffer, a2);
  uint64_t v5 = v4;
  if ((int)v4 <= 0)
  {
    id v7 = __error();
    io_object_t v8 = strerror(*v7);
    AMSupportLogInternal(3LL, "_AMRestorePartitionOpenFileWithURL", "open() returned %d, %s", v5, v8);
    return v5;
  }

  if (fcntl(v4, 48, 1LL))
  {
    AMSupportLogInternal(3LL, "_AMRestorePartitionOpenFileWithURL", "Unable to set F_NOCACHE on firmware storage", v9);
    return 0xFFFFFFFFLL;
  }

  return v5;
}

void sub_100006114( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, char a11)
{
}

uint64_t sub_10000613C(unsigned int *a1)
{
  uint64_t result = *a1;
  if ((_DWORD)result)
  {
    uint64_t result = IOObjectRelease(result);
    if ((_DWORD)result) {
      sub_100016884(&v2, v3);
    }
  }

  return result;
}

uint64_t sub_1000062B4(char *a1, const __CFString *a2)
{
  uint64_t v4 = (const __CFData *)sub_100006B7C(a1, a2);
  if (v4)
  {
    uint64_t v5 = v4;
    CFTypeID v6 = CFGetTypeID(v4);
    if (v6 != CFDataGetTypeID()
      || (BytePtr = CFDataGetBytePtr(v5), (size_t Length = CFDataGetLength(v5)) != 0)
      && (Length > 4 || !memcmp(BytePtr, &unk_100019BE0, Length)))
    {
      uint64_t v9 = 0LL;
      uint64_t v10 = "NO";
    }

    else
    {
      uint64_t v9 = 1LL;
      uint64_t v10 = "YES";
    }

    ramrod_log_msg_cf(@"Boot Firmware Updater: property_is_nonzero(%s, %@) = %s (%@)\n", a1, a2, v10, v5);
    CFRelease(v5);
  }

  else
  {
    ramrod_log_msg_cf(@"Boot Firmware Updater: property_is_nonzero(%s, %@) = %s (%@)\n", a1, a2, "NO", 0LL);
    return 0LL;
  }

  return v9;
}

BOOL sub_1000063FC(const __CFString *a1)
{
  CFTypeRef v2 = sub_100006B7C("IODeviceTree:/defaults", a1);
  CFTypeRef v3 = v2;
  if (v2)
  {
    CFRelease(v2);
    uint64_t v4 = "YES";
  }

  else
  {
    uint64_t v4 = "NO";
  }

  ramrod_log_msg_cf(@"Boot Firmware Updater: property_exists(%s, %@) = %s\n", "IODeviceTree:/defaults", a1, v4);
  return v3 != 0LL;
}

void sub_1000069A8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, char a34)
{
}

uint64_t sub_1000069DC(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSData);
  uint64_t result = objc_opt_isKindOfClass(a2, v7);
  if ((result & 1) == 0)
  {
    *a4 = 1;
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
  }

  return result;
}

void sub_100006A38(uint64_t a1, uint64_t a2)
{
}

void sub_100006A48(uint64_t a1)
{
}

CFTypeRef sub_100006B7C(char *path, const __CFString *a2)
{
  io_registry_entry_t v3 = IORegistryEntryFromPath(kIOMasterPortDefault, path);
  if (!v3) {
    return 0LL;
  }
  io_object_t v4 = v3;
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v3, a2, kCFAllocatorDefault, 0);
  IOObjectRelease(v4);
  return CFProperty;
}

uint64_t MSUBootFirmwareFindNamespace(io_registry_entry_t a1, uint64_t a2)
{
  uint64_t entryID = 0LL;
  IORegistryEntryGetRegistryEntryID(a1, &entryID);
  IOServiceWaitQuiet(a1, 0LL);
  v12[0] = @"IOParentMatch";
  CFMutableDictionaryRef v4 = IORegistryEntryIDMatching(entryID);
  CFTypeRef v5 = (id)CFMakeCollectable(v4);
  v12[1] = @"IOPropertyMatch";
  v13[0] = v5;
  uint64_t v10 = a2;
  int v11 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL);
  v13[1] = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL);
  CFTypeID v6 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v13,  v12,  2LL);
  if (v6) {
    uint64_t v7 = (const __CFDictionary *)CFRetain(v6);
  }
  else {
    uint64_t v7 = 0LL;
  }
  return IOServiceGetMatchingService(kIOMasterPortDefault, v7);
}

LABEL_29:
  AMSupportSafeRelease(v10);
  AMSupportSafeRelease(URLFromString);
  AMSupportSafeRelease(v20);
  AMSupportSafeRelease(theData);
  AMSupportSafeRelease(Mutable);
  return v53;
}

LABEL_11:
  iBU_LOG_real( (uint64_t)@"Writing end_of_contents_bytes to firmware dev node.",  "-[ASPStorageiBootUpdater updateBootFirmwareWithError:]",  v14,  v15,  v16,  v17,  v18,  v19,  v140);
  if (-[DevNodeWriter writeData:withError:]( -[ASPStorageiBootUpdater firmwareWriter](self, "firmwareWriter"),  "writeData:withError:",  +[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v157, 2LL),  &v155))
  {
    iBU_LOG_real( (uint64_t)@"Failed to write end-of-contents bytes to firmwareWriter.",  "-[ASPStorageiBootUpdater updateBootFirmwareWithError:]",  v24,  v25,  v26,  v27,  v28,  v29,  v141);
    if (a3)
    {
      char v35 = v155;
      io_registry_entry_t v36 = @"Failed to write end-of-contents bytes to firmwareWriter.";
LABEL_21:
      __int128 v51 = 3LL;
      goto LABEL_22;
    }

    return 0;
  }

  if (!-[DevNodeWriter finished](-[ASPStorageiBootUpdater firmwareWriter](self, "firmwareWriter"), "finished")) {
    iBU_LOG_real( (uint64_t)@"Failed to clean up firmwareWriter.",  "-[ASPStorageiBootUpdater updateBootFirmwareWithError:]",  v55,  v56,  v57,  v58,  v59,  v60,  v141);
  }
  if (sysctlbyname("debug.ASPFW", 0LL, 0LL, &v156, 4uLL)) {
    goto LABEL_27;
  }
  v75 = -[NSArray count](-[MSUBootFirmwareUpdater bootBlockImages](self, "bootBlockImages"), "count");
  iBU_LOG_real( (uint64_t)@"Writing %lu firmware images to llb dev node.",  "-[ASPStorageiBootUpdater updateBootFirmwareWithError:]",  v76,  v77,  v78,  v79,  v80,  v81,  v75);
  v149 = 0u;
  v150 = 0u;
  v147 = 0u;
  v148 = 0u;
  uint64_t v82 = -[MSUBootFirmwareUpdater bootBlockImages](self, "bootBlockImages");
  uint64_t v83 = -[NSArray countByEnumeratingWithState:objects:count:]( v82,  "countByEnumeratingWithState:objects:count:",  &v147,  v158,  16LL);
  if (v83)
  {
    v90 = v83;
    v91 = 0;
    v92 = *(void *)v148;
LABEL_31:
    v93 = 0LL;
    while (1)
    {
      if (*(void *)v148 != v92) {
        objc_enumerationMutation(v82);
      }
      v94 = -[MSUBootFirmwareUpdater _encodeFirmware:withRestoreInfo:]( self,  "_encodeFirmware:withRestoreInfo:",  *(void *)(*((void *)&v147 + 1) + 8 * v93),  -[MSUBootFirmwareUpdater _restoreInfoDictionary](self, "_restoreInfoDictionary"));
      if (!v94) {
        break;
      }
      v101 = v94;
      if (-[DevNodeWriter writeData:withError:]( -[ASPStorageiBootUpdater llbWriter](self, "llbWriter"),  "writeData:withError:",  v94,  &v155))
      {
        iBU_LOG_real( (uint64_t)@"Failed to write boot block data to dev node.",  "-[ASPStorageiBootUpdater updateBootFirmwareWithError:]",  v102,  v103,  v104,  v105,  v106,  v107,  v143);
        if (a3) {
          *a3 = MSUBootFirmwareError( 3LL,  v155,  (uint64_t)@"Failed to write boot block data to dev node.",  v115,  v116,  v117,  v118,  v119,  v145);
        }

        return 0;
      }

      v91 += (unsigned __int16)[v101 length];

      if (v90 == (id)++v93)
      {
        v90 = -[NSArray countByEnumeratingWithState:objects:count:]( v82,  "countByEnumeratingWithState:objects:count:",  &v147,  v158,  16LL);
        if (v90) {
          goto LABEL_31;
        }
        goto LABEL_40;
      }
    }

    iBU_LOG_real( (uint64_t)@"Got NULL data while wrapping boot-block IMG4 data.",  "-[ASPStorageiBootUpdater updateBootFirmwareWithError:]",  v95,  v96,  v97,  v98,  v99,  v100,  v143);
    if (!a3) {
      return 0;
    }
    char v35 = v155;
    io_registry_entry_t v36 = @"Got NULL data while wrapping boot-block IMG4 data.";
    goto LABEL_21;
  }

  v91 = 0;
LABEL_40:
  iBU_LOG_real( (uint64_t)@"Writing end_of_contents_bytes to lldb dev node.",  "-[ASPStorageiBootUpdater updateBootFirmwareWithError:]",  v84,  v85,  v86,  v87,  v88,  v89,  v143);
  v108 = +[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v157, 2LL);
  if (-[DevNodeWriter writeData:withError:]( -[ASPStorageiBootUpdater llbWriter](self, "llbWriter"),  "writeData:withError:",  v108,  &v155))
  {
    iBU_LOG_real( (uint64_t)@"Failed to write end-of-contents bytes to llbWriter.",  "-[ASPStorageiBootUpdater updateBootFirmwareWithError:]",  v109,  v110,  v111,  v112,  v113,  v114,  v144);
    if (a3)
    {
      char v35 = v155;
      io_registry_entry_t v36 = @"Failed to write end-of-contents bytes to llbWriter.";
      goto LABEL_21;
    }

    return 0;
  }

  v120 = 4096LL - (((unsigned __int16)-[NSData length](v108, "length") + v91) & 0xFFF);
  v121 = malloc(v120);
  bzero(v121, v120);
  iBU_LOG_real( (uint64_t)@"Writing final padding to llb dev node.",  "-[ASPStorageiBootUpdater updateBootFirmwareWithError:]",  v122,  v123,  v124,  v125,  v126,  v127,  v144);
  if (-[DevNodeWriter writeBytes:ofLength:withError:]( -[ASPStorageiBootUpdater llbWriter](self, "llbWriter"),  "writeBytes:ofLength:withError:",  v121,  v120,  &v155))
  {
    iBU_LOG_real( (uint64_t)@"Failed to write LLB to dev node.",  "-[ASPStorageiBootUpdater updateBootFirmwareWithError:]",  v128,  v129,  v130,  v131,  v132,  v133,  v146);
    if (a3)
    {
      char v35 = v155;
      io_registry_entry_t v36 = @"Failed to write LLB to dev node.";
      goto LABEL_21;
    }

    return 0;
  }

  if (!-[DevNodeWriter finished](-[ASPStorageiBootUpdater llbWriter](self, "llbWriter"), "finished")) {
    iBU_LOG_real( (uint64_t)@"Failed to clean up llbWriter.",  "-[ASPStorageiBootUpdater updateBootFirmwareWithError:]",  v134,  v135,  v136,  v137,  v138,  v139,  v146);
  }
  if (sysctlbyname("debug.ASPLLB", 0LL, 0LL, &v156, 4uLL))
  {
LABEL_27:
    __int128 v61 = __error();
    strerror(*v61);
    iBU_LOG_real( (uint64_t)@"sysctlbyname('%s') failed with error: %s",  "-[ASPStorageiBootUpdater updateBootFirmwareWithError:]",  v62,  v63,  v64,  v65,  v66,  v67,  (uint64_t)"debug.ASPFW");
    if (a3)
    {
      id v68 = v155;
      id v69 = __error();
      strerror(*v69);
      __int128 v52 = MSUBootFirmwareError( 1LL,  v68,  (uint64_t)@"sysctlbyname('%s') failed with error: %s",  v70,  v71,  v72,  v73,  v74,  (uint64_t)"debug.ASPFW");
      goto LABEL_23;
    }

    return 0;
  }

  return 1;
}

LABEL_21:
    uint64_t v26 = 0;
    goto LABEL_22;
  }

  __int128 v53 = v47;
  __int128 v54 = CFDataGetBytePtr(a3);
  memmove(v53, v54, v46);
  if (IOConnectCallStructMethod( -[IOServiceWriter serviceConnect](-[IMG3NorUpdater writer](self, "writer"), "serviceConnect"),  !v8,  v53,  v46,  0LL,  0LL))
  {
    if (a6)
    {
      __int16 v38 = MSUBootFirmwareError( 3LL,  0LL,  (uint64_t)@"%s returned an error when writing img3 object",  v55,  v56,  v57,  v58,  v59,  (uint64_t)"AppleImage3NORAccess");
      goto LABEL_9;
    }

    return 0;
  }

  munmap(v53, v46);
  uint64_t v26 = 1;
LABEL_22:
  if (v65) {
    image3Discard(&v65);
  }
  return v26;
}

  AMSupportSafeRelease(CFProperty);
  AMSupportSafeRelease(v34);
  AMSupportSafeFree(v24);
  return updated;
}

uint64_t sub_100008E94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return _os_log_send_and_compose_impl(a1, v6, v5, 80LL, a5, v7, 16LL);
}

BOOL sub_100008EAC()
{
  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

void sub_100008FD0( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, char a11)
{
}

uint64_t sub_100008FF8(unsigned int *a1)
{
  uint64_t result = *a1;
  if ((_DWORD)result)
  {
    uint64_t result = IOObjectRelease(result);
    if ((_DWORD)result) {
      sub_1000169A4(&v2, v3);
    }
  }

  return result;
}

void sub_1000093B8( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, char a11)
{
}

uint64_t sub_1000093E0(unsigned int *a1)
{
  uint64_t result = *a1;
  if ((_DWORD)result)
  {
    uint64_t result = IOServiceClose(result);
    if ((_DWORD)result) {
      sub_100016AA8(&v2, v3);
    }
  }

  return result;
}

double sub_100009488(void *a1, _OWORD *a2)
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

uint64_t sub_1000094A0(uint64_t a1)
{
  return _os_crash_msg(*v1, a1);
}

void iBU_LOG_real( uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v10 = -[NSString initWithFormat:arguments:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:arguments:", a1, &a9);
  int v11 = v10;
  if (off_10002E480)
  {
    int v12 = -[NSString UTF8String](v10, "UTF8String");
    off_10002E480("%s: %s\n", a2, v12);
  }

  else
  {
    NSLog(@"%s: %@", a2, v10);
  }
}

NSError *MSUBootFirmwareError( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  int v11 = -[NSString initWithFormat:arguments:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:arguments:", a3, &a9);
  if (a2)
  {
    NSErrorUserInfoKey v18 = NSLocalizedDescriptionKey;
    NSErrorUserInfoKey v19 = NSUnderlyingErrorKey;
    off_t v20 = v11;
    uint64_t v21 = a2;
    int v12 = &v20;
    ssize_t v13 = &v18;
    uint64_t v14 = 2LL;
  }

  else
  {
    NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
    uint64_t v17 = v11;
    int v12 = &v17;
    ssize_t v13 = &v16;
    uint64_t v14 = 1LL;
  }

  return +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MSUFirmwareUpdaterErrorDomain",  a1,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v13,  v14,  &a9,  v16,  v17,  v18,  v19,  v20,  v21));
}

BOOL sub_10000979C(io_registry_entry_t a1)
{
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(a1, @"low-level-fw-device-info", 0LL, 0);
  CFTypeRef v2 = CFProperty;
  if (CFProperty) {
    CFRelease(CFProperty);
  }
  return v2 != 0LL;
}

LABEL_20:
      uint64_t v84 = -536870167;
      if (!v6) {
        return v84;
      }
      goto LABEL_21;
    }

    int v11 = [v6 objectAtIndex:0];
    int v12 = [v6 objectAtIndex:1];
    v91 = 0LL;
    [v11 invalidate];
    iBU_LOG_real( (uint64_t)v7,  "-[IODualSPIWriter writeFirstGenerationFirmware:withError:]",  v13,  v14,  v15,  v16,  v17,  v18,  (uint64_t)v11);
    [v12 invalidate];
    iBU_LOG_real( (uint64_t)v8,  "-[IODualSPIWriter writeFirstGenerationFirmware:withError:]",  v19,  v20,  v21,  v22,  v23,  v24,  (uint64_t)v12);
    iBU_LOG_real( (uint64_t)v9,  "-[IODualSPIWriter writeFirstGenerationFirmware:withError:]",  v25,  v26,  v27,  v28,  v29,  v30,  v86);
    [v11 setAsFirstGeneration];
    if (!-[IODualSPIWriter _writeFirmware:toHeader:withError:]( self,  "_writeFirmware:toHeader:withError:",  v4,  v11,  &v91)) {
      break;
    }
    CFDataRef v37 = [v11 startLocation];
    iBU_LOG_real( (uint64_t)@"Failed to write firmware images to header0 at offset 0x%x. Invalidating this header, then trying again with a different header.",  "-[IODualSPIWriter writeFirstGenerationFirmware:withError:]",  v38,  v39,  v40,  v41,  v42,  v43,  (uint64_t)v37);
LABEL_13:
    -[IODualSPIWriter markHeaderAsInvalid:](self, "markHeaderAsInvalid:", v12);
    id v74 = v10 + 1;
    v75 = v10 - 1;
    uint64_t v10 = (v10 + 1);
    if (v75 >= 0x1F)
    {
      id v76 = a4;
      if (a4)
      {
        id v77 = (v74 - 1);
        goto LABEL_18;
      }

      goto LABEL_20;
    }
  }

  __int128 v44 = v9;
  __int128 v45 = v8;
  __int128 v46 = v7;
  iBU_LOG_real( (uint64_t)@"Erasing header1.",  "-[IODualSPIWriter writeFirstGenerationFirmware:withError:]",  v31,  v32,  v33,  v34,  v35,  v36,  v87);
  __int128 v47 = -[IODualSPIWriter eraseBytes:ofLength:withError:]( self,  "eraseBytes:ofLength:withError:",  [v12 startLocation],  objc_msgSend(v12, "length"),  &v91);
  __int128 v48 = [v12 startLocation];
  if (v47)
  {
    iBU_LOG_real( (uint64_t)@"Failed to erase header1 at offset 0x%x. Invalidating this header, then trying again with a different header.",  "-[IODualSPIWriter writeFirstGenerationFirmware:withError:]",  v49,  v50,  v51,  v52,  v53,  v54,  (uint64_t)v48);
LABEL_12:
    uint64_t v7 = v46;
    io_object_t v8 = v45;
    uint64_t v9 = v44;
    CFMutableDictionaryRef v4 = a3;
    goto LABEL_13;
  }

  iBU_LOG_real( (uint64_t)@"Successfully wrote header1 at offset 0x%x.",  "-[IODualSPIWriter writeFirstGenerationFirmware:withError:]",  v49,  v50,  v51,  v52,  v53,  v54,  (uint64_t)v48);
  if (!-[IOServiceWriter shouldCommit](self, "shouldCommit")) {
    goto LABEL_24;
  }
  iBU_LOG_real( (uint64_t)@"Committing header0 to the first partition.",  "-[IODualSPIWriter writeFirstGenerationFirmware:withError:]",  v55,  v56,  v57,  v58,  v59,  v60,  v88);
  __int128 v61 = -[IODualSPIWriter _commitHeader:withError:](self, "_commitHeader:withError:", v11, &v91);
  __int128 v62 = [v11 startLocation];
  if (v61)
  {
    iBU_LOG_real( (uint64_t)@"Failed to commit header0 at offset 0x%x to the first partition. Invalidating this header, then trying again with a different header.",  "-[IODualSPIWriter writeFirstGenerationFirmware:withError:]",  v63,  v64,  v65,  v66,  v67,  v68,  (uint64_t)v62);
    int v12 = v11;
    goto LABEL_12;
  }

  iBU_LOG_real( (uint64_t)@"Successfully committed header0 at offset 0x%x.",  "-[IODualSPIWriter writeFirstGenerationFirmware:withError:]",  v63,  v64,  v65,  v66,  v67,  v68,  (uint64_t)v62);
LABEL_24:
  iBU_LOG_real( (uint64_t)@"Successfully wrote firmware after %d retries.",  "-[IODualSPIWriter writeFirstGenerationFirmware:withError:]",  v55,  v56,  v57,  v58,  v59,  v60,  v10);
  uint64_t v84 = 0;
  if (v6) {
LABEL_21:
  }

  return v84;
}

  if (!*(_DWORD *)(a1 + 96)) {
    sub_10001191C(a1, v11, a3, a4, a5, a6, a7, a8);
  }
  return v11;
}

LABEL_10:
  return v12;
}

  ssize_t v13 = *(_DWORD *)(a1 + 1476);
  if (!v13)
  {
    ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): {%s} tracking information lost on store [%s]\n",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  (char)"checkpoint_nvram_store_lost");
    ssize_t v13 = *(_DWORD *)(a1 + 1476);
  }

  *(_DWORD *)(a1 + 1476) = v13 + 1;
}

  if (v6) {
    IOObjectRelease(v6);
  }
  return v22;
}

LABEL_17:
    char v35 = MSUBootFirmwareError(3LL, v63, (uint64_t)v69, v64, v65, v66, v67, v68, (uint64_t)v110);
    goto LABEL_18;
  }

  uint64_t v29 = -536870212;
  iBU_LOG_real( (uint64_t)@"Firmware payload %lul is larger than maximum payload size %d",  "-[IODualSPIWriter _writeFirmware:toHeader:withError:]",  v23,  v24,  v25,  v26,  v27,  v28,  (uint64_t)v22);
  if (a5)
  {
    v109 = [a3 length];
    char v35 = MSUBootFirmwareError( 3LL,  0LL,  (uint64_t)@"Firmware payload %lul is larger than maximum payload size %d",  v30,  v31,  v32,  v33,  v34,  (uint64_t)v109);
LABEL_18:
    *a5 = v35;
  }

  return v29;
}

void sub_10000CC08( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, unsigned int a10)
{
}

uint64_t sub_10000CC2C(unsigned int *a1)
{
  uint64_t result = *a1;
  if ((_DWORD)result)
  {
    uint64_t result = IOObjectRelease(result);
    if ((_DWORD)result) {
      sub_100016BB4(&v2, v3);
    }
  }

  return result;
}

void sub_10000CD2C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, char a11)
{
}

void image3Discard(uint64_t *a1)
{
  if (a1)
  {
    uint64_t v2 = *a1;
    if (v2)
    {
      if (*(void *)v2)
      {
        if ((*(_BYTE *)(v2 + 10) & 4) != 0)
        {
          image3Free(*(void **)v2);
          uint64_t v2 = *a1;
        }
      }

      image3Free((void *)v2);
      *a1 = 0LL;
    }
  }

uint64_t image3InstantiateNew(void *a1, size_t a2, unsigned int a3)
{
  uint64_t v6 = image3Malloc(0x28uLL);
  if (!v6) {
    return 12LL;
  }
  uint64_t v7 = v6;
  if (a2 <= 0x14) {
    a2 = 20LL;
  }
  io_object_t v8 = image3Malloc(a2);
  void *v7 = v8;
  if (!v8)
  {
    image3Free(v7);
    return 12LL;
  }

  *io_object_t v8 = 0LL;
  v8[1] = 0LL;
  *((_DWORD *)v8 + 4) = 0;
  uint64_t v9 = (_DWORD *)*v7;
  _DWORD *v9 = 1231906611;
  v9[4] = a3;
  v7[2] = a2;
  v7[3] = 0xFFFFFFFF00000000LL;
  *((_DWORD *)v7 + 2) = 0x40000;
  v7[4] = 0LL;
  if (a3 == 1667592820 || (uint64_t v10 = image3SetTagUnsignedNumber((char **)v7, 1415139397, a3), !(_DWORD)v10))
  {
    uint64_t v11 = 0LL;
    *a1 = v7;
  }

  else
  {
    uint64_t v11 = v10;
    image3Free((void *)*v7);
    image3Free(v7);
  }

  return v11;
}

uint64_t image3SetTagUnsignedNumber(char **a1, int a2, unint64_t a3)
{
  int v7 = 0;
  unint64_t v6 = 0LL;
  if (HIDWORD(a3))
  {
    unint64_t v6 = a3;
    io_registry_entry_t v3 = (uint64_t *)&v6;
    size_t v4 = 8LL;
  }

  else
  {
    int v7 = a3;
    io_registry_entry_t v3 = (uint64_t *)&v7;
    size_t v4 = 4LL;
  }

  return image3SetTagStructure(a1, a2, v3, v4, 0);
}

uint64_t image3Finalize(uint64_t a1, char **a2, void *a3, int a4, uint64_t a5)
{
  unint64_t v18 = 0LL;
  int8x16_t v19 = 0uLL;
  int v20 = 0;
  v16[0] = 0LL;
  v16[1] = 0LL;
  int v17 = 0;
  if (!a4) {
    goto LABEL_8;
  }
  uint64_t result = image3AdvanceCursorWithZeroPad((char **)a1, (56 - *(_DWORD *)(a1 + 24)) & 0x3F);
  if (!(_DWORD)result)
  {
    uint64_t v10 = *(char **)a1;
    unsigned int v11 = *(_DWORD *)(a1 + 24);
    *((_DWORD *)v10 + 3) = v11 + a5;
    int v12 = v10 + 12;
    CC_LONG v13 = v11 + 8;
    if (a5)
    {
      unint64_t v18 = __PAIR64__(v11, a5);
      image3SHA1Partial(v12, v13, &v19);
    }

    else
    {
      image3SHA1Generate(v12, v13, (unsigned __int8 *)v16);
    }

    uint64_t result = image3PKISignHash();
    if (!(_DWORD)result)
    {
      *(_DWORD *)(a1 + 8) |= 0x20000u;
LABEL_8:
      uint64_t result = 0LL;
      uint64_t v14 = *(char **)a1;
      *((_DWORD *)v14 + 2) = *(_DWORD *)(a1 + 24);
      uint64_t v15 = (*(_DWORD *)(a1 + 24) + 20);
      *((_DWORD *)v14 + 1) = v15;
      *a2 = v14;
      *a3 = v15;
    }
  }

  return result;
}

uint64_t image3AdvanceCursorWithZeroPad(char **a1, int a2)
{
  if ((*((_BYTE *)a1 + 10) & 2) != 0) {
    return 30LL;
  }
  uint64_t v4 = *((int *)a1 + 6);
  uint64_t v3 = *((int *)a1 + 7);
  LODWORD(v5) = v4 + a2;
  *((_DWORD *)a1 + 6) = v4 + a2;
  unint64_t v6 = *a1;
  if ((_DWORD)v3 != -1)
  {
    *(_DWORD *)&v6[v3 + 24] = v5 - v3;
    LODWORD(v5) = *((_DWORD *)a1 + 6);
  }

  uint64_t v5 = (int)v5;
  unint64_t v7 = (int)v5 + 20LL;
  unint64_t v6 = (char *)realloc(v6, (int)v5 + 20LL);
  if (v6)
  {
    *a1 = v6;
    a1[2] = (char *)v7;
    uint64_t v5 = *((int *)a1 + 6);
LABEL_7:
    bzero(&v6[v4 + 20], v5 - v4);
    uint64_t result = 0LL;
    *((_DWORD *)*a1 + 2) = *((_DWORD *)a1 + 6);
    return result;
  }

  return 12LL;
}

uint64_t image3SetTagStructure(char **a1, int a2, void *__src, size_t __n, int a5)
{
  if ((*((_BYTE *)a1 + 10) & 2) != 0) {
    return 30LL;
  }
  if (a5)
  {
    uint64_t v9 = *((int *)a1 + 7);
    int v10 = (a5 + *((_DWORD *)a1 + 6) / a5 * a5 - *((_DWORD *)a1 + 6)) % a5 + *((_DWORD *)a1 + 6);
    *((_DWORD *)a1 + 6) = v10;
    unsigned int v11 = *a1;
    if ((_DWORD)v9 != -1) {
      *(_DWORD *)&v11[v9 + 24] = v10 - v9;
    }
  }

  else
  {
    unsigned int v11 = *a1;
  }

  if ((__n & 0xF) != 0) {
    size_t v13 = 16 - (__n & 0xF);
  }
  else {
    size_t v13 = 0LL;
  }
  uint64_t v14 = *((int *)a1 + 6);
  size_t v15 = __n + v13 + v14 + 32;
  if (v15 > (unint64_t)a1[2])
  {
    unsigned int v11 = (char *)realloc(v11, __n + v13 + v14 + 32);
    if (!v11) {
      return 12LL;
    }
    *a1 = v11;
    a1[2] = (char *)v15;
    uint64_t v14 = *((int *)a1 + 6);
  }

  NSErrorUserInfoKey v16 = &v11[v14];
  if ((((_DWORD)v13 + (_DWORD)__n) & 3) != 0) {
    int v17 = ((v13 + __n) & 0xFFFFFFFC) + 16;
  }
  else {
    int v17 = v13 + __n + 12;
  }
  *((_DWORD *)v16 + 5) = a2;
  *((_DWORD *)v16 + 6) = v17;
  *((_DWORD *)v16 + 7) = __n;
  memcpy(v16 + 32, __src, __n);
  bzero(&v16[__n + 32], v13);
  uint64_t result = 0LL;
  int v18 = *((_DWORD *)a1 + 6);
  *((_DWORD *)a1 + 7) = v18;
  int v19 = *((_DWORD *)v16 + 6) + v18;
  *((_DWORD *)a1 + 6) = v19;
  *((_DWORD *)*a1 + 2) = v19;
  return result;
}

uint64_t image3InstantiateFromBuffer(void *a1, _DWORD *a2, unint64_t a3, char a4)
{
  if (a3 < 0x14) {
    return 22LL;
  }
  if (*a2 != 1231906611) {
    return 22LL;
  }
  unint64_t v6 = a2[2];
  int v10 = image3Malloc(0x28uLL);
  if (!v10) {
    return 12LL;
  }
  unsigned int v11 = v10;
  *((_DWORD *)v10 + 2) = 1;
  v10[4] = 0LL;
  if (a2[3])
  {
    *((_DWORD *)v10 + 2) = 131073;
    if ((a4 & 1) == 0)
    {
      *int v10 = a2;
      v10[2] = a3;
LABEL_21:
      uint64_t result = 0LL;
      *a1 = v11;
      return result;
    }

    goto LABEL_19;
  }

  *((_DWORD *)v10 + 6) = a2[2];
  *((_DWORD *)v10 + 7) = -1;
  unsigned int v12 = a2[2];
  if (!v12)
  {
LABEL_19:
    size_t v16 = a2[2] + 20LL;
    v11[2] = v16;
    int v17 = image3Malloc(v16);
    *unsigned int v11 = v17;
    if (v17)
    {
      memcpy(v17, a2, v11[2]);
      *((_DWORD *)v11 + 2) |= 0x40000u;
      goto LABEL_21;
    }

    image3Free(v11);
    return 12LL;
  }

  unsigned int v13 = 0;
  while (1)
  {
    unsigned int v14 = v13;
    unsigned int v15 = *(_DWORD *)((char *)a2 + v13 + 24);
    v13 += v15;
    if (v13 > v12 || v15 <= 0xB) {
      break;
    }
    if (v13 == v12)
    {
      *((_DWORD *)v10 + 7) = v14;
      goto LABEL_19;
    }
  }

  image3Free(v10);
  return 22LL;
}

uint64_t image3GetTagStruct(uint64_t a1, int a2, void *a3, void *a4, int a5)
{
  uint64_t v5 = *(unsigned int *)(*(void *)a1 + 8LL);
  if (!(_DWORD)v5) {
    return 2LL;
  }
  unint64_t v6 = (_DWORD *)(*(void *)a1 + 20LL);
  unint64_t v7 = (unint64_t)v6 + v5;
  while (1)
  {
    io_object_t v8 = v6 + 3;
    uint64_t v9 = v6[2];
    if (a2 == -1 || *v6 == a2) {
      break;
    }
LABEL_9:
    unint64_t v10 = v6[1];
    if (v9 + 12 > v10) {
      return 22LL;
    }
    unint64_t v6 = (_DWORD *)((char *)v6 + v10);
  }

  if (a5)
  {
    --a5;
    goto LABEL_9;
  }

  if (a4)
  {
    if (*a4 && *a4 != v9) {
      return 22LL;
    }
    *a4 = v9;
  }

  uint64_t result = 0LL;
  *a3 = v8;
  return result;
}

uint64_t image3GetTagUnsignedNumber(uint64_t a1, int a2, void *a3, int a4)
{
  uint64_t v7 = 0LL;
  io_object_t v8 = 0LL;
  uint64_t result = image3GetTagStruct(a1, a2, &v8, &v7, a4);
  if (!(_DWORD)result)
  {
    if (v7 == 8)
    {
      uint64_t v6 = *(void *)v8;
      goto LABEL_6;
    }

    if (v7 == 4)
    {
      uint64_t v6 = *v8;
LABEL_6:
      uint64_t result = 0LL;
      *a3 = v6;
      return result;
    }

    return 22LL;
  }

  return result;
}

void sub_10000DAD4(uint64_t a1)
{
  uint64_t step_desc = checkpoint_closure_context_get_step_desc((uint64_t)objc_msgSend( *(id *)(a1 + 32),  "checkpoint_closure_context"));
  ramrod_log_msg( "[AsyncCP][Start] Checkpoint %s start running.\n",  v3,  v4,  v5,  v6,  v7,  v8,  v9,  *(void *)(step_desc + 8));
  unint64_t v10 = (dispatch_queue_s *)[*(id *)(a1 + 32) workQueue];
  dispatch_queue_set_specific( v10,  kCheckpointAsyncStepContextKey,  objc_msgSend(*(id *)(a1 + 32), "checkpoint_closure_context"),  0);
  char v11 = 0;
  char v12 = 1;
  do
  {
    while (1)
    {
      unsigned int v44 = 0;
      id v43 = 0LL;
      if ((v11 & 1) != 0)
      {
        unsigned int v13 = (uint64_t *)objc_msgSend(*(id *)(a1 + 32), "checkpoint_closure_context");
        if (checkpoint_closure_context_handle_simulator_actions( v13,  1LL,  (int *)&v44,  (const void **)&v43,  v14,  v15,  v16,  v17)) {
          goto LABEL_4;
        }
      }

      else if ((v12 & 1) != 0)
      {
LABEL_4:
        (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
        unsigned int v44 = [*(id *)(a1 + 32) result];
        id v43 = [*(id *)(a1 + 32) error];
        char v12 = 1;
        goto LABEL_7;
      }

      char v12 = 0;
LABEL_7:
      int v18 = (uint64_t *)objc_msgSend(*(id *)(a1 + 32), "checkpoint_closure_context");
      if (checkpoint_closure_context_handle_simulator_actions( v18,  0LL,  (int *)&v44,  (const void **)&v43,  v19,  v20,  v21,  v22))
      {
        int v23 = (uint64_t *)objc_msgSend(*(id *)(a1 + 32), "checkpoint_closure_context");
        BOOL v31 = checkpoint_closure_context_handle_simulator_match_name( v23,  v24,  v25,  v26,  v27,  v28,  v29,  v30) != 0;
      }

      else
      {
        BOOL v31 = 0;
      }

      [*(id *)(a1 + 32) setResult:v44];
      [*(id *)(a1 + 32) setError:v43];
      if (!v44 || v31) {
        break;
      }
      int should_retry = checkpoint_closure_context_should_retry((uint64_t)objc_msgSend( *(id *)(a1 + 32),  "checkpoint_closure_context"));
      char v11 = 1;
      if (!should_retry) {
        goto LABEL_18;
      }
    }

    if (v44) {
      char v33 = 1;
    }
    else {
      char v33 = v31;
    }
    char v11 = 1;
  }

  while ((v33 & 1) != 0);
LABEL_18:
  off_t v34 = (dispatch_queue_s *)[*(id *)(a1 + 32) workQueue];
  dispatch_queue_set_specific(v34, kCheckpointAsyncStepContextKey, 0LL, 0LL);
  uint64_t v35 = *(void *)(step_desc + 8);
  [*(id *)(a1 + 32) result];
  ramrod_log_msg("[AsyncCP][End] Checkpoint %s finished with result: %d.\n", v36, v37, v38, v39, v40, v41, v42, v35);
}

void sub_10000DC7C(uint64_t a1, uint64_t a2)
{
}

void sub_10000DCB8(uint64_t a1)
{
}

uint64_t wait_for_io_service_matching_dict(CFTypeRef cf, unsigned int a2)
{
  unsigned int v4 = 0;
  do
  {
    CFRetain(cf);
    uint64_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, (CFDictionaryRef)cf);
    if ((_DWORD)MatchingService) {
      break;
    }
    unsigned int v6 = a2 - v4 >= 3 ? 3 : a2 - v4;
    uint64_t v7 = CFCopyDescription(cf);
    char CStringPtr = CFStringGetCStringPtr(v7, 0);
    ramrod_log_msg("waiting for matching IOKit service: %s\n", v9, v10, v11, v12, v13, v14, v15, CStringPtr);
    sleep(v6);
    v4 += v6;
    CFRelease(v7);
  }

  while (v4 < a2);
  CFRelease(cf);
  return MatchingService;
}

uint64_t wait_for_io_service_matching_resource_with_timeout(const char *a1, unsigned int a2)
{
  CFMutableDictionaryRef v4 = IOServiceMatching("IOResources");
  if (v4)
  {
    uint64_t v12 = v4;
    CFStringRef v13 = CFStringCreateWithCString(kCFAllocatorDefault, a1, 0x8000100u);
    if (v13)
    {
      CFStringRef v21 = v13;
      CFDictionarySetValue(v12, @"IOResourceMatch", v13);
      CFRelease(v21);
      return wait_for_io_service_matching_dict(v12, a2);
    }

    ramrod_log_msg("unable to convert resource name to CFString\n", v14, v15, v16, v17, v18, v19, v20, v23);
  }

  else
  {
    ramrod_log_msg("unable to create matching dictionary for resource '%s'\n", v5, v6, v7, v8, v9, v10, v11, (char)a1);
  }

  return 0LL;
}

BOOL ramrod_check_NVRAM_access()
{
  io_object_t v0 = wait_for_io_service_matching_resource_with_timeout("IONVRAM", 0);
  io_object_t v1 = v0;
  if (v0) {
    IOObjectRelease(v0);
  }
  return v1 != 0;
}

uint64_t ramrod_delete_NVRAM_variable()
{
  return 1LL;
}

uint64_t ramrod_copy_NVRAM_variable()
{
  return 0LL;
}

CFTypeRef ramrod_copy_NVRAM_variable_from_devicetree(CFStringRef theString)
{
  Copy = CFStringCreateCopy(0LL, theString);
  io_registry_entry_t v2 = atomic_load((unsigned int *)&unk_10002E488);
  if (!v2)
  {
    io_registry_entry_t v5 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/options");
    if (v5)
    {
      while (1)
      {
        io_registry_entry_t v2 = __ldaxr((unsigned int *)&unk_10002E488);
        if (v2) {
          break;
        }
        if (!__stlxr(v5, (unsigned int *)&unk_10002E488))
        {
          io_registry_entry_t v2 = v5;
          goto LABEL_2;
        }
      }

      __clrex();
      IOObjectRelease(v5);
    }

    else
    {
      io_registry_entry_t v2 = 0;
    }
  }

LABEL_2:
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v2, Copy, 0LL, 0);
  CFRelease(Copy);
  return CFProperty;
}

uint64_t image3SHA1Generate(const void *a1, CC_LONG a2, unsigned __int8 *a3)
{
  return CC_SHA1_Final(a3, &v7);
}

uint64_t image3PKISignHash()
{
  return 0xFFFFFFFFLL;
}

int8x16_t image3SHA1Partial(const void *a1, CC_LONG a2, int8x16_t *a3)
{
  int8x16_t result = vrev32q_s8(*(int8x16_t *)&v7.h0);
  *a3 = result;
  a3[1].i32[0] = bswap32(v7.h4);
  return result;
}

uint64_t ramrod_ticket_create_img3(CFDataRef *a1, CFErrorRef *a2)
{
  uint64_t v28 = 0LL;
  if (!qword_10002E490 || byte_10002E498 != 1) {
    return 1LL;
  }
  CFIndex v29 = 0LL;
  uint64_t v30 = 0LL;
  if (image3InstantiateNew(&v28, 0LL, 0x53434142u))
  {
    ramrod_create_error_cf( a2,  @"RamrodErrorDomain",  6LL,  0LL,  @"%s: unable to create img3 ticket",  v4,  v5,  v6,  (char)"ramrod_ticket_create_img3");
    uint64_t v14 = "failed to create img3\n";
LABEL_10:
    ramrod_log_msg(v14, v7, v8, v9, v10, v11, v12, v13, v27);
LABEL_11:
    uint64_t v15 = 0LL;
    goto LABEL_12;
  }

  uint64_t v16 = v28;
  BytePtr = (UInt8 *)CFDataGetBytePtr((CFDataRef)qword_10002E490);
  size_t Length = CFDataGetLength((CFDataRef)qword_10002E490);
  if (image3SetTagStructure(v16, 1145132097, BytePtr, Length, 32))
  {
    uint64_t v14 = "failed to create data tag for ticket";
    goto LABEL_10;
  }

  if (image3Finalize((uint64_t)v28, (char **)&v30, &v29, 0, 0LL))
  {
    ramrod_create_error_cf( a2,  @"RamrodErrorDomain",  6LL,  0LL,  @"%s: unable to create CFData for img3 ticket",  v19,  v20,  v21,  (char)"ramrod_ticket_create_img3");
    uint64_t v14 = "could not finalize ticket img3";
    goto LABEL_10;
  }

  CFDataRef v23 = CFDataCreate(kCFAllocatorDefault, v30, v29);
  if (!v23)
  {
    ramrod_create_error_cf( a2,  @"RamrodErrorDomain",  6LL,  0LL,  @"%s: unable to create CFData for img3 ticket",  v24,  v25,  v26,  (char)"ramrod_ticket_create_img3");
    goto LABEL_11;
  }

  *a1 = v23;
  uint64_t v15 = 1LL;
LABEL_12:
  if (v28) {
    image3Discard((uint64_t *)&v28);
  }
  return v15;
}

uint64_t get_BOOLean_option(const __CFDictionary *a1, const __CFString *a2, uint64_t a3)
{
  uint64_t v3 = a3;
  unsigned __int8 valuePtr = a3;
  if (a1)
  {
    Value = (const __CFBoolean *)CFDictionaryGetValue(a1, a2);
    if (Value)
    {
      uint64_t v6 = Value;
      CFTypeID v7 = CFGetTypeID(Value);
      if (v7 == CFBooleanGetTypeID()) {
        return CFBooleanGetValue(v6);
      }
      CFTypeID v9 = CFGetTypeID(v6);
      if (v9 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v6, kCFNumberIntType, &valuePtr);
        return valuePtr;
      }

      else
      {
        __int128 v32 = 0u;
        __int128 v33 = 0u;
        __int128 v30 = 0u;
        __int128 v31 = 0u;
        __int128 v28 = 0u;
        __int128 v29 = 0u;
        __int128 v26 = 0u;
        __int128 v27 = 0u;
        __int128 v24 = 0u;
        __int128 v25 = 0u;
        __int128 v22 = 0u;
        __int128 v23 = 0u;
        __int128 v20 = 0u;
        __int128 v21 = 0u;
        *(_OWORD *)buffer = 0u;
        __int128 v19 = 0u;
        CFStringGetCString(a2, buffer, 255LL, 0x8000100u);
        ramrod_log_msg( "%s: option '%s' has non-BOOLean value, using default\n",  v10,  v11,  v12,  v13,  v14,  v15,  v16,  (char)"get_BOOLean_option");
      }
    }
  }

  return v3;
}

uint64_t ramrod_log_msg_to_fd(uint64_t a1, uint64_t a2, int __fd)
{
  uint64_t result = 0LL;
  if (a1 && a2)
  {
    uint64_t v7 = 0LL;
    while (1)
    {
      ssize_t v8 = write(__fd, (const void *)(a1 + v7), a2 - v7);
      if (v8 == -1) {
        break;
      }
      v7 += v8;
      if (v7 == a2) {
        return 0LL;
      }
    }

    return *__error();
  }

  return result;
}

uint64_t sub_10000E644(int a1)
{
  int valuePtr = a1;
  memset(&v16, 0, sizeof(v16));
  int v1 = fstat(a1, &v16);
  BOOL v2 = (__int16)v16.st_mode <= -1 && v1 == 0;
  uint64_t v3 = &qword_10002E4C0;
  if (v2) {
    uint64_t v3 = &qword_10002E4B8;
  }
  uint64_t v4 = (__CFSet *)*v3;
  if (!*v3)
  {
    uint64_t v12 = __stderrp;
    uint64_t v13 = "can't remove logging fd since none were added";
    size_t v14 = 45LL;
LABEL_13:
    fwrite(v13, v14, 1uLL, v12);
    return 0xFFFFFFFFLL;
  }

  CFNumberRef v5 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
  if (!v5)
  {
    uint64_t v12 = __stderrp;
    uint64_t v13 = "failed to convert fd to number";
    size_t v14 = 30LL;
    goto LABEL_13;
  }

  CFNumberRef v6 = v5;
  CFSetRemoveValue(v4, v5);
  if (close(valuePtr))
  {
    uint64_t v7 = __error();
    uint64_t v8 = *v7;
    CFTypeID v9 = __stderrp;
    int v10 = valuePtr;
    uint64_t v11 = strerror(*v7);
    fprintf(v9, "failed to close file descriptor '%d', error:%s", v10, v11);
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  CFRelease(v6);
  return v8;
}

uint64_t ramrod_log_msg_to_all_fds(uint64_t a1, uint64_t a2)
{
  __int128 context = 0u;
  *(_OWORD *)theArray = 0u;
  int valuePtr = -1;
  pthread_mutex_lock(&stru_10002E010);
  if (a1 && xmmword_10002E4B8 != 0)
  {
    *(void *)&__int128 context = a1;
    *((void *)&context + 1) = a2;
    theArray[0] = 0LL;
    LOBYTE(theArray[1]) = 0;
    if (*((void *)&xmmword_10002E4B8 + 1)) {
      CFSetApplyFunction(*((CFSetRef *)&xmmword_10002E4B8 + 1), (CFSetApplierFunction)sub_10000E8C8, &context);
    }
    qword_10002E4C8 += a2;
    if (qword_10002E4C8)
    {
      LOBYTE(theArray[1]) = 1;
      qword_10002E4C8 = 0LL;
    }

    if ((void)xmmword_10002E4B8) {
      CFSetApplyFunction((CFSetRef)xmmword_10002E4B8, (CFSetApplierFunction)sub_10000E8C8, &context);
    }
    if (theArray[0])
    {
      CFIndex Count = CFArrayGetCount(theArray[0]);
      if (Count >= 1)
      {
        CFIndex v5 = Count;
        for (CFIndex i = 0LL; i != v5; ++i)
        {
          ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(theArray[0], i);
          if (CFNumberGetValue(ValueAtIndex, kCFNumberIntType, &valuePtr)) {
            sub_10000E644(valuePtr);
          }
          else {
            fwrite("Failed to convert CFNumberRef into int value\n", 0x2DuLL, 1uLL, __stderrp);
          }
        }
      }

      CFRelease(theArray[0]);
    }
  }

  pthread_mutex_unlock(&stru_10002E010);
  return 0LL;
}

void sub_10000E8C8(const void *a1, uint64_t a2)
{
  int valuePtr = -1;
  if (!a1)
  {
    CFIndex v5 = __stderrp;
    CFNumberRef v6 = "NULL fd num in fd set, weird.\n";
    size_t v7 = 30LL;
LABEL_11:
    fwrite(v6, v7, 1uLL, v5);
    return;
  }

  if (!a2)
  {
    CFIndex v5 = __stderrp;
    CFNumberRef v6 = "Missing logging context.\n";
    size_t v7 = 25LL;
    goto LABEL_11;
  }

  if (*(void *)a2)
  {
    if (CFNumberGetValue((CFNumberRef)a1, kCFNumberIntType, &valuePtr))
    {
      if (ramrod_log_msg_to_fd(*(void *)a2, *(void *)(a2 + 8), valuePtr))
      {
        fprintf(__stderrp, "Removing file descriptor %d since it failed to be written to.\n", valuePtr);
        Mutable = *(__CFArray **)(a2 + 16);
        if (!Mutable)
        {
          Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 1LL, &kCFTypeArrayCallBacks);
          *(void *)(a2 + 16) = Mutable;
        }

        CFArrayAppendValue(Mutable, a1);
      }

      else if (*(_BYTE *)(a2 + 24))
      {
        fsync(valuePtr);
      }
    }

    else
    {
      fwrite("Failed to convert num to int\n", 0x1DuLL, 1uLL, __stderrp);
    }
  }

void ramrod_log_msg( const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
}

void ramrod_log_msg_cf(CFStringRef format, ...)
{
  int v1 = CFStringCreateWithFormatAndArguments(kCFAllocatorDefault, 0LL, format, va);
  if (!v1)
  {
    ramrod_log_msg("(Failed to format log message)\n", v2, v3, v4, v5, v6, v7, v8, v30);
    return;
  }

  CFTypeID v9 = v1;
  char CStringPtr = CFStringGetCStringPtr(v1, 0x8000100u);
  if (CStringPtr)
  {
    char v30 = (char)CStringPtr;
    uint64_t v18 = "%s";
  }

  else
  {
    CFIndex Length = CFStringGetLength(v9);
    CFIndex v20 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
    __int128 v21 = (char *)malloc(v20);
    if (v21)
    {
      __int128 v22 = v21;
      if (CFStringGetCString(v9, v21, v20, 0x8000100u)) {
        ramrod_log_msg("%s", v23, v24, v25, v26, v27, v28, v29, (char)v22);
      }
      else {
        ramrod_log_msg("(Failed to alloc and convert log message)\n", v23, v24, v25, v26, v27, v28, v29, v30);
      }
      free(v22);
      goto LABEL_12;
    }

    uint64_t v18 = "(Failed to alloc and convert log message)\n";
  }

  ramrod_log_msg(v18, v11, v12, v13, v14, v15, v16, v17, v30);
LABEL_12:
  CFRelease(v9);
}

void sub_10000EB2C(int a1, const char *a2, va_list a3)
{
  __s = 0LL;
  if (vasprintf(&__s, a2, a3) != -1)
  {
    pthread_mutex_lock(&stru_10002DFD0);
    if (a1 == 1)
    {
      fputs(__s, __stdoutp);
      if (off_10002E4D0) {
        off_10002E4D0(__s);
      }
    }

    size_t v4 = strlen(__s);
    ramrod_log_msg_to_all_fds((uint64_t)__s, v4);
    if (!byte_10002E050) {
      goto LABEL_23;
    }
    uint64_t v5 = (char *)qword_10002E4B0;
    if (!qword_10002E4B0)
    {
      uint64_t v5 = (char *)malloc(0x100000uLL);
      qword_10002E4B0 = (uint64_t)v5;
      if (!v5)
      {
        fprintf(__stderrp, "unable to allocate %lu bytes for log buffer\n", 0x100000LL);
LABEL_23:
        pthread_mutex_unlock(&stru_10002DFD0);
        goto LABEL_24;
      }

      qword_10002E4A0 = (uint64_t)v5;
      qword_10002E4A8 = (uint64_t)v5;
    }

    char v6 = *__s;
    if (*__s)
    {
      uint64_t v7 = v5 + 0x100000;
      uint64_t v8 = (char *)qword_10002E4A8;
      uint64_t v9 = qword_10002E4A0;
      int v10 = __s + 1;
      do
      {
        *uint64_t v8 = v6;
        if (v8 + 1 == v7) {
          uint64_t v8 = v5;
        }
        else {
          ++v8;
        }
        qword_10002E4A8 = (uint64_t)v8;
        if ((char *)v9 == v8)
        {
          if (v8 + 1 == v7) {
            uint64_t v9 = (uint64_t)v5;
          }
          else {
            uint64_t v9 = (uint64_t)(v8 + 1);
          }
          qword_10002E4A0 = v9;
        }

        int v11 = *v10++;
        char v6 = v11;
      }

      while (v11);
    }

    goto LABEL_23;
  }

  fwrite("unable to allocate storage for log message\n", 0x2BuLL, 1uLL, __stderrp);
LABEL_24:
  free(__s);
}

CFStringRef sub_10000ECA4()
{
  return CFStringCreateWithFormat(0LL, 0LL, @"UNKNOWN");
}

CFStringRef sub_10000ECB8(uint64_t a1, const char **a2)
{
  if (!a2) {
    return 0LL;
  }
  uint64_t v2 = *a2;
  if (!*a2) {
    return 0LL;
  }
  size_t v3 = strlen(*a2);
  if (v3 > 0x100) {
    return CFStringCreateWithFormat(0LL, 0LL, @"~%s", &v2[v3 - 255]);
  }
  else {
    return CFStringCreateWithFormat(0LL, 0LL, @"%s", v2);
  }
}

CFStringRef sub_10000ED2C(uint64_t a1, unsigned int *a2)
{
  if (!a2) {
    return 0LL;
  }
  uint64_t v3 = *((void *)a2 + 1);
  if (!v3) {
    return 0LL;
  }
  size_t v4 = strlen(*((const char **)a2 + 1));
  if (v4 > 0xF2) {
    return CFStringCreateWithFormat(0LL, 0LL, @"{0x%08X:~%s}", *a2, v4 + v3 - 241);
  }
  else {
    return CFStringCreateWithFormat(0LL, 0LL, @"{0x%08X:%s}", *a2, v3);
  }
}

CFStringRef sub_10000EDAC(uint64_t a1, void *a2)
{
  if (a2) {
    return CFStringCreateWithFormat(0LL, 0LL, @"%ld", *a2);
  }
  else {
    return 0LL;
  }
}

CFStringRef sub_10000EDEC(uint64_t a1, const __CFString *a2)
{
  CFStringRef v2 = a2;
  if (a2)
  {
    uint64_t v16 = 0LL;
    asprintf(&v16, "{");
    uint64_t v8 = v16;
    if (v16)
    {
      uint64_t v9 = 0LL;
      int v15 = 0;
      char v10 = 1;
      do
      {
        char v11 = v10;
        uint64_t v12 = (const char *)*((void *)&v2->isa + v9);
        if (v12)
        {
          uint64_t v8 = sub_1000116AC(v8, off_100024A20[v9], v12, &v15);
          uint64_t v16 = v8;
        }

        char v10 = 0;
        uint64_t v9 = 1LL;
      }

      while ((v11 & 1) != 0);
      uint64_t v16 = sub_100011798(v8, "}", (uint64_t)v12, v3, v4, v5, v6, v7, v14);
      CFStringRef v2 = CFStringCreateWithFormat(0LL, 0LL, @"%s", v16);
      if (v16) {
        free(v16);
      }
    }

    else
    {
      return 0LL;
    }
  }

  return v2;
}

CFStringRef sub_10000EEB8(uint64_t a1, const __CFString *a2)
{
  CFStringRef v2 = a2;
  if (a2)
  {
    char v14 = 0LL;
    asprintf(&v14, "{");
    uint64_t v8 = v14;
    if (v14)
    {
      uint64_t v9 = 0LL;
      int v13 = 0;
      do
      {
        char v10 = *(const char **)((char *)&v2->info + v9);
        if (v10)
        {
          uint64_t v8 = sub_100011834(v8, *(_DWORD *)((char *)&v2->isa + v9), v10, &v13);
          char v14 = v8;
        }

        v9 += 16LL;
      }

      while (v9 != 128);
      char v14 = sub_100011798(v8, "}", (uint64_t)v10, v3, v4, v5, v6, v7, v12);
      CFStringRef v2 = CFStringCreateWithFormat(0LL, 0LL, @"%s", v14);
      if (v14) {
        free(v14);
      }
    }

    else
    {
      return 0LL;
    }
  }

  return v2;
}

CFStringRef sub_10000EF70(uint64_t a1, const __CFString *a2)
{
  CFStringRef v2 = a2;
  if (a2)
  {
    char v14 = 0LL;
    asprintf(&v14, "{");
    if (v14)
    {
      uint64_t v9 = 0LL;
      int v13 = 0;
      do
      {
        if (*(_DWORD *)((char *)&v2->isa + v9))
        {
          char v12 = 0LL;
          asprintf(&v12, "%d", *(_DWORD *)((char *)&v2->isa + v9 + 4));
          uint64_t v3 = v12;
          if (v12)
          {
            char v14 = sub_100011834(v14, *(_DWORD *)((char *)&v2->isa + v9), v12, &v13);
            if (v12) {
              free(v12);
            }
          }
        }

        v9 += 8LL;
      }

      while (v9 != 64);
      char v14 = sub_100011798(v14, "}", (uint64_t)v3, v4, v5, v6, v7, v8, v11);
      CFStringRef v2 = CFStringCreateWithFormat(0LL, 0LL, @"%s", v14);
      if (v14) {
        free(v14);
      }
    }

    else
    {
      return 0LL;
    }
  }

  return v2;
}

CFStringRef sub_10000F06C(uint64_t a1, const __CFString *a2)
{
  CFStringRef v2 = a2;
  if (a2)
  {
    __int128 v19 = 0LL;
    asprintf(&v19, "{");
    if (v19)
    {
      uint64_t v9 = 0LL;
      int v18 = 0;
      p_info = &v2->info;
      do
      {
        char v11 = (int *)v2 + 18 * v9;
        if (*v11)
        {
          __int128 v22 = 0LL;
          asprintf(&v22, "{");
          if (v22)
          {
            uint64_t v12 = 0LL;
            int v21 = 0;
            do
            {
              int v13 = (const char *)p_info[v12];
              if (v13)
              {
                CFIndex v20 = 0LL;
                asprintf(&v20, "%s", v13);
                uint64_t v3 = v20;
                if (v20)
                {
                  __int128 v22 = sub_1000118A8(v22, v12, v20, &v21);
                  if (v20) {
                    free(v20);
                  }
                }
              }

              ++v12;
            }

            while (v12 != 8);
            char v14 = sub_100011798(v22, "}", (uint64_t)v3, v4, v5, v6, v7, v8, v17);
            if (v14)
            {
              int v15 = v14;
              __int128 v19 = sub_100011834(v19, *v11, v14, &v18);
              free(v15);
            }
          }
        }

        ++v9;
        p_info += 9;
      }

      while (v9 != 8);
      __int128 v19 = sub_100011798(v19, "}", (uint64_t)v3, v4, v5, v6, v7, v8, v17);
      CFStringRef v2 = CFStringCreateWithFormat(0LL, 0LL, @"%s", v19);
      if (v19) {
        free(v19);
      }
    }

    else
    {
      return 0LL;
    }
  }

  return v2;
}

CFStringRef sub_10000F200(uint64_t a1, const __CFString *a2)
{
  CFStringRef v2 = a2;
  if (a2)
  {
    int v18 = 0LL;
    asprintf(&v18, "{");
    if (v18)
    {
      uint64_t v9 = 0LL;
      int v17 = 0;
      CFStringRef v10 = v2;
      do
      {
        char v11 = (int *)v2 + 11 * v9;
        if (*v11)
        {
          int v21 = 0LL;
          asprintf(&v21, "{");
          if (v21)
          {
            uint64_t v12 = 0LL;
            int v20 = 0;
            do
            {
              if (*((_BYTE *)&v10[1].isa + v12 + 4))
              {
                __int128 v19 = 0LL;
                asprintf(&v19, "%d", *((_DWORD *)&v10->isa + v12 + 1));
                uint64_t v3 = v19;
                if (v19)
                {
                  int v21 = sub_1000118A8(v21, v12, v19, &v20);
                  if (v19) {
                    free(v19);
                  }
                }
              }

              ++v12;
            }

            while (v12 != 8);
            int v13 = sub_100011798(v21, "}", (uint64_t)v3, v4, v5, v6, v7, v8, v16);
            if (v13)
            {
              char v14 = v13;
              int v18 = sub_100011834(v18, *v11, v13, &v17);
              free(v14);
            }
          }
        }

        ++v9;
        CFStringRef v10 = (CFStringRef)((char *)v10 + 44);
      }

      while (v9 != 8);
      int v18 = sub_100011798(v18, "}", (uint64_t)v3, v4, v5, v6, v7, v8, v16);
      CFStringRef v2 = CFStringCreateWithFormat(0LL, 0LL, @"%s", v18);
      if (v18) {
        free(v18);
      }
    }

    else
    {
      return 0LL;
    }
  }

  return v2;
}

uint64_t sub_10000F3A0( uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a3;
  int v10 = *(_DWORD *)(a1 + 664);
  if (!v10) {
    goto LABEL_160;
  }
  if (v10 == 1)
  {
    uint64_t v11 = 1LL;
    goto LABEL_20;
  }

  uint64_t v11 = 0LL;
  if (a2)
  {
    if (v10 == 2)
    {
LABEL_160:
      if (ramrod_check_NVRAM_access())
      {
        if (*(_BYTE *)(a1 + 2272))
        {
          if (!*(_BYTE *)(a1 + 2273))
          {
LABEL_24:
            int v17 = *(_DWORD *)(a1 + 664);
            if (*(_BYTE *)(a1 + 669))
            {
LABEL_149:
              uint64_t v11 = 1LL;
              *(_DWORD *)(a1 + 664) = 1;
              if (!v8)
              {
                if (v17) {
                  sub_10000FC94(a1, 2, 1, 0, 256, "NVRAM access has become available", 0, 0, 0LL);
                }
                else {
                  sub_10000FC94(a1, 2, 1, 0, 256, "NVRAM access available on initial check", 0, 0, 0LL);
                }
              }

              goto LABEL_20;
            }

            BOOL v18 = *(_DWORD *)a1 == 1 && v17 == 2;
            uint64_t v19 = 8LL;
            if (v18) {
              uint64_t v19 = 400LL;
            }
            uint64_t v20 = a1 + v19;
            int v21 = (void *)(v20 + 664);
            if (*(_BYTE *)(v20 + 668)) {
              ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): first available indication when already collected\n",  v12,  a3,  a4,  a5,  a6,  a7,  a8,  (char)"checkpoint_nvram_handle_first_available");
            }
            else {
              sub_10001075C((int *)a1, (uint64_t)v21, a3, a4, a5, a6, a7, a8);
            }
            if (*(_DWORD *)a1 == 1)
            {
              int v29 = *(_DWORD *)(a1 + 88);
              if (*(_DWORD *)(a1 + 96))
              {
                if (v29 == 2) {
                  uint64_t v39 = (unsigned int *)&unk_100019EC4;
                }
                else {
                  uint64_t v39 = (unsigned int *)&unk_10001A00C;
                }
              }

              else
              {
                if (v29 == 2)
                {
                  int v31 = sub_100011CB4(a1, (uint64_t)v21, dword_100019C34, v24, v25, v26, v27, v28);
                  sub_100011EE8(a1, (uint64_t)v21);
                  goto LABEL_53;
                }

                uint64_t v39 = (unsigned int *)&unk_100019DB4;
              }

              int v31 = sub_100011CB4(a1, (uint64_t)v21, v39, v24, v25, v26, v27, v28);
LABEL_53:
              uint64_t v43 = v21[6];
              if (!v43)
              {
LABEL_110:
                if (!(_DWORD)v43 && v31 && !*(_BYTE *)(a1 + 106) && !*(_BYTE *)(a1 + 100) && !*(_BYTE *)(a1 + 104)) {
                  sub_100010918( a1,  v32,  "[monitor_aware]pre-existing NVRAM implied reboot-retry but values were inconsistent");
                }
LABEL_116:
                if (*(_BYTE *)(a1 + 104))
                {
                  if (v17 == 2)
                  {
                    uint64_t v73 = 0LL;
                    id v74 = (void *)(a1 + 1496);
                    v75 = &dword_100024A40;
LABEL_119:
                    uint64_t v76 = *v75;
                    if (v73 != v76)
                    {
                      uint64_t v77 = a1 + 16LL * (int)v76;
                      *(_BYTE *)(v77 + 1492) = *((_BYTE *)v74 - 4);
                      *((_BYTE *)v74 - 4) = 0;
                      uint64_t v78 = *v74;
                      *id v74 = *(void *)(v77 + 1496);
                      *(void *)(v77 + 1496) = v78;
                    }

                    while (v73 != 47)
                    {
                      v74 += 2;
                      v75 += 8;
                      ++v73;
                      if (*(_BYTE *)(a1 + 104)) {
                        goto LABEL_119;
                      }
                    }
                  }
                }

                else if (*(_DWORD *)a1 != 1 && *(_DWORD *)(a1 + 88) == 2)
                {
                  ramrod_log_msg("%s\n", v32, v33, v34, v35, v36, v37, v38, (char)"void clear_stale_ota_nvram(void)");
                  sub_100012098(@"boot-breadcrumbs");
                  sub_100012098(@"OTA-pre-conversion");
                  sub_100012098(@"OTA-post-conversion");
                  sub_100012098(@"ota-conv-panic-indicator");
                  sub_100012098(@"OTA-fsck-metrics");
                  sub_100012098(@"OTA-sealvolume-metrics");
                  sub_100012098(@"OTA-migrator-metrics");
                  for (uint64_t i = 0LL; i != 28; ++i)
                  {
                    uint64_t v80 = (const __CFString **)&off_100024A30[4 * dword_10001A544[i]];
                    sub_100012098(v80[1]);
                    sub_100012098(*v80);
                  }
                }

                if (*(_DWORD *)(a1 + 96))
                {
                  if (*(_BYTE *)(a1 + 101))
                  {
                    if (*(_BYTE *)(a1 + 104))
                    {
                      if (*(_BYTE *)(a1 + 106))
                      {
                        unsigned int v81 = 9;
                      }

                      else if (*(_BYTE *)(a1 + 105))
                      {
                        unsigned int v81 = 12;
                      }

                      else if (*(_BYTE *)(a1 + 100))
                      {
                        unsigned int v81 = 10;
                      }

                      else
                      {
                        unsigned int v81 = 11;
                      }
                    }

                    else if (*(_BYTE *)(a1 + 103))
                    {
                      unsigned int v81 = 10;
                    }

                    else
                    {
                      unsigned int v81 = 3;
                    }
                  }

                  else if (*(_BYTE *)(a1 + 102))
                  {
                    if (*(_BYTE *)(a1 + 104)) {
                      unsigned int v81 = 7;
                    }
                    else {
                      unsigned int v81 = 6;
                    }
                  }

                  else
                  {
                    unsigned int v81 = 2;
                  }

                  sub_1000109B4(a1, v81, v33, v34, v35, v36, v37, v38);
                }

                else
                {
                  sub_10001191C(a1, 1, v33, v34, v35, v36, v37, v38);
                }

                *(_BYTE *)(a1 + 669) = 1;
                goto LABEL_149;
              }

              unsigned int v44 = sub_1000108A0(a1, (uint64_t)v21, v33, v34, v35, v36, v37, v38);
              if (v44 < 0x22)
              {
                __int128 v52 = &dword_10001A5B4[3 * v44];
              }

              else
              {
                ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): invalid outcome=%d\n",  v45,  v46,  v47,  v48,  v49,  v50,  v51,  (char)"checkpoint_get_outcome_attributes");
                __int128 v52 = dword_10001A5B4;
              }

              __int128 v53 = (const __CFString *)v21[6];
              bzero(v83, 0x400uLL);
              if (*v52 == 2)
              {
                int v54 = *((unsigned __int8 *)v52 + 8);
                if (*((_BYTE *)v52 + 8)) {
                  *(_BYTE *)(a1 + 106) = 1;
                }
                if (*((_BYTE *)v52 + 7))
                {
                  int v31 = 0;
                  *(_BYTE *)(a1 + 102) = 1;
                }

                if (!*((_BYTE *)v52 + 5))
                {
                  if (!*((_BYTE *)v52 + 4) || !*((_BYTE *)v52 + 6))
                  {
                    LODWORD(v43) = 0;
                    goto LABEL_110;
                  }

                  if (v54)
                  {
                    LODWORD(v43) = 0;
                    *(_BYTE *)(a1 + 101) = 1;
                    goto LABEL_110;
                  }

                  uint64_t v43 = v21[8];
                  if (!v43) {
                    goto LABEL_110;
                  }
LABEL_98:
                  id v69 = (const __CFString *)v21[7];
                  *(_BYTE *)(a1 + 101) = 1;
                  if (v69 && CFStringCompare(v69, @"true", 0LL) == kCFCompareEqualTo)
                  {
                    *(_BYTE *)(a1 + 100) = 1;
                    LODWORD(v43) = *((unsigned __int8 *)v52 + 5);
                    if (!*((_BYTE *)v52 + 5))
                    {
                      *(_BYTE *)(a1 + 103) = 1;
                      goto LABEL_110;
                    }

                    LODWORD(v43) = 0;
                    goto LABEL_65;
                  }

                  goto LABEL_100;
                }

                if (v54)
                {
                  LODWORD(v43) = 0;
                  *(_BYTE *)(a1 + 101) = 1;
LABEL_65:
                  *(_WORD *)(a1 + 104) = 257;
                  goto LABEL_110;
                }

                uint64_t v43 = v21[8];
                if (v43) {
                  goto LABEL_98;
                }
              }

              else
              {
                LODWORD(v43) = *((unsigned __int8 *)v52 + 5);
                if (!*((_BYTE *)v52 + 5)) {
                  goto LABEL_110;
                }
                if (!v21[8])
                {
                  sub_100010B3C(v53, v83);
                  sub_100010918(a1, v71, "[monitor_aware]outcome=%s(reboot_retry_not_in_zone)");
                  goto LABEL_102;
                }

                __int128 v55 = (const __CFString *)v21[7];
                if (!v55 || CFStringCompare(v55, @"true", 0LL))
                {
LABEL_100:
                  sub_100010B3C(v53, v83);
                  sub_100010918(a1, v70, "[monitor_aware]outcome=%s(reboot_retry_disabled)");
LABEL_102:
                  LODWORD(v43) = 1;
                  goto LABEL_110;
                }

                LODWORD(v43) = 0;
              }

              *(_BYTE *)(a1 + 104) = 1;
              goto LABEL_110;
            }

            char v30 = (const __CFString *)v21[7];
            if (v30 && CFStringCompare(v30, @"true", 0LL) == kCFCompareEqualTo) {
              *(_BYTE *)(a1 + 100) = 1;
            }
            else {
              ramrod_log_msg("AP nonce will not be touched\n", v22, v23, v24, v25, v26, v27, v28, v82);
            }
            int v40 = *(_DWORD *)(a1 + 88);
            if (*(_DWORD *)(a1 + 96))
            {
              if (v40 == 2)
              {
                int v41 = sub_100011CB4(a1, (uint64_t)v21, dword_10001A2AC, v24, v25, v26, v27, v28);
                sub_100011EE8(a1, (uint64_t)v21);
                goto LABEL_72;
              }

              uint64_t v42 = (unsigned int *)&unk_10001A434;
            }

            else if (v40 == 2)
            {
              uint64_t v42 = (unsigned int *)&unk_10001A0EC;
            }

            else
            {
              uint64_t v42 = (unsigned int *)&unk_10001A204;
            }

            int v41 = sub_100011CB4(a1, (uint64_t)v21, v42, v24, v25, v26, v27, v28);
LABEL_72:
            if (!v21[6])
            {
              *(_BYTE *)(a1 + 1456) = 1;
              *(void *)(a1 + 1464) = "access now enabled";
              if (*(_DWORD *)(a1 + 88) == 2)
              {
                if (v21[8]) {
                  sub_100010A3C(a1, 7LL, 0LL, 0LL, v35, v36, v37, v38);
                }
                uint64_t v65 = (const __CFString *)v21[3];
                if (v65 && CFStringCompare(v65, @"recover", 0LL)) {
                  sub_100010A3C(a1, 2LL, 1LL, 0LL, v35, v36, v37, v38);
                }
                if (v21[4]) {
                  sub_100010A3C(a1, 3LL, 1LL, 0LL, v35, v36, v37, v38);
                }
              }

              goto LABEL_105;
            }

            unsigned int v56 = sub_1000108A0(a1, (uint64_t)v21, v33, v34, v35, v36, v37, v38);
            if (v56 < 0x22)
            {
              uint64_t v64 = &dword_10001A5B4[3 * v56];
            }

            else
            {
              ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): invalid outcome=%d\n",  v57,  v58,  v59,  v60,  v61,  v62,  v63,  (char)"checkpoint_get_outcome_attributes");
              uint64_t v64 = dword_10001A5B4;
            }

            uint64_t v66 = (const __CFString *)v21[6];
            bzero(v83, 0x400uLL);
            if (*v64 != 1)
            {
              if (*((_BYTE *)v64 + 6))
              {
                if (v21[8])
                {
                  sub_100011FC4((_BYTE *)a1, v66, v33, v34, v35, v36, v37, v38, v82);
                }

                else
                {
                  sub_100010B3C(v66, v83);
                  sub_100010918(a1, v72, "[chassis_aware]outcome=%s(pre_existing_reboot_retry_not_in_zone)", v83);
                }
              }

              *(_BYTE *)(a1 + 1456) = 1;
              *(void *)(a1 + 1464) = "access now enabled";
              goto LABEL_105;
            }

            uint64_t v67 = v21[8];
            if (*((_BYTE *)v64 + 5))
            {
              if (!v67)
              {
                sub_100010B3C(v66, v83);
                sub_100010918(a1, v68, "[chassis_aware]outcome=%s(pre_existing_reboot_retry_not_in_zone)", v83);
LABEL_105:
                if (v41 && !*(_BYTE *)(a1 + 104)) {
                  sub_100010918( a1,  v32,  "[chassis_aware]pre-existing NVRAM implied reboot-retry but values were inconsistent");
                }
                goto LABEL_116;
              }
            }

            else if (!v67)
            {
              goto LABEL_105;
            }

            sub_100011FC4((_BYTE *)a1, v66, v33, v34, v35, v36, v37, v38, v82);
            goto LABEL_105;
          }
        }

        else
        {
          sub_1000119D0(a1, 1u, 0x2Fu, (const __CFString **)(a1 + 1056));
          if (!*(void *)(a1 + 1056))
          {
            *(_BYTE *)(a1 + 2272) = 1;
            goto LABEL_24;
          }

          if (*(_DWORD *)a1 == 2) {
            sub_100010A3C(a1, 47LL, 0LL, 0LL, a5, a6, a7, a8);
          }
          *(_BYTE *)(a1 + 2273) = 1;
          *(_BYTE *)(a1 + 668) = 0;
          int v13 = (const __CFString **)(a1 + 992);
          uint64_t v14 = -4LL;
          do
            sub_1000119D0(a1, 1u, v14 + 43, v13++);
          while (!__CFADD__(v14++, 1LL));
          *(_BYTE *)(a1 + 2272) = 1;
        }
      }

      *(_DWORD *)(a1 + 664) = 2;
      if (!v8) {
        sub_10000FC94(a1, 2, 1, 0, 256, "NVRAM access is not currently available", 0, 0, 0LL);
      }
      uint64_t v11 = 0LL;
    }
  }

void *sub_10000FC94( uint64_t a1, int a2, int a3, int a4, int a5, const char *a6, int a7, int a8, const void *a9)
{
  int v17 = calloc(1uLL, 0x78uLL);
  if (!v17) {
    return v17;
  }
  v130 = 0LL;
  asprintf(&v130, "%s", a6);
  if (!v130)
  {
    free(v17);
    return 0LL;
  }

  *((_DWORD *)v17 + 2) = a2;
  v17[2] = time(0LL);
  gettimeofday((timeval *)(v17 + 3), 0LL);
  *((_DWORD *)v17 + 10) = getpid();
  *((_DWORD *)v17 + 11) = getppid();
  *((_DWORD *)v17 + 12) = a3;
  *((_DWORD *)v17 + 13) = a4;
  *((_DWORD *)v17 + 14) = a5;
  v17[8] = v130;
  *((_DWORD *)v17 + 18) = a7;
  *((_DWORD *)v17 + 19) = a8;
  if (a9)
  {
    v17[10] = a9;
    CFRetain(a9);
    a5 = *((_DWORD *)v17 + 14);
  }

  *((_DWORD *)v17 + 22) = a5 | (*((_DWORD *)v17 + 2) << 16) | 0x11000000;
  *(void *)v134 = 0x1500000001LL;
  v131[0] = 0LL;
  v131[1] = 0LL;
  size_t v132 = 16LL;
  if (sysctl(v134, 2u, v131, &v132, 0LL, 0LL)) {
    uint64_t v25 = -1LL;
  }
  else {
    uint64_t v25 = v17[2] - (unint64_t)v131[0];
  }
  int v26 = *((_DWORD *)v17 + 2);
  switch(v26)
  {
    case 1:
      sub_1000122C0(a1, 10LL, *((unsigned int *)v17 + 22), (const char *)v17[8], v21, v22, v23, v24);
      goto LABEL_69;
    case 2:
      goto LABEL_69;
    case 3:
      if (!*((_DWORD *)v17 + 18))
      {
        uint64_t v38 = 23LL;
        if (!*(_BYTE *)(a1 + 104)) {
          uint64_t v38 = 11LL;
        }
        int v39 = *(_DWORD *)(a1 + 1472) + 1;
        *(_DWORD *)(a1 + 1472) = v39;
        uint64_t v40 = *((unsigned int *)v17 + 22);
        int v41 = *(int **)(a1 + 16 * v38 + 1496);
        if (!v41) {
          goto LABEL_28;
        }
        unint64_t v42 = 0LL;
        do
        {
          int v44 = *v41;
          v41 += 2;
          int v43 = v44;
          if (v42 > 6) {
            break;
          }
          ++v42;
        }

        while (v43);
        if (!v43)
        {
          *(v41 - 2) = v40;
          *(v41 - 1) = v39;
          *(_BYTE *)(a1 + 16 * v38 + 1492) = 1;
        }

        else
        {
LABEL_28:
          int v45 = *(_DWORD *)(a1 + 1476);
          if (!v45)
          {
            ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): {%s} tracking information lost on store [%s]\n",  v18,  v40,  v20,  v21,  v22,  v23,  v24,  (char)"checkpoint_nvram_store_lost");
            int v45 = *(_DWORD *)(a1 + 1476);
            uint64_t v40 = *((unsigned int *)v17 + 22);
          }

          *(_DWORD *)(a1 + 1476) = v45 + 1;
        }

        sub_1000122C0(a1, 12LL, v40, (const char *)v17[8], v21, v22, v23, v24);
      }

      goto LABEL_68;
    case 4:
    case 7:
      goto LABEL_15;
    case 5:
      goto LABEL_13;
    case 6:
      sub_100012630( a1,  14LL,  *((unsigned int *)v17 + 22),  *((unsigned int *)v17 + 18),  (const char *)v17[8],  v22,  v23,  v24);
      goto LABEL_69;
    default:
      if (v26 == 32)
      {
LABEL_15:
        sub_1000124E0( a1,  13LL,  *((_DWORD *)v17 + 14) | 0x11070000u,  *((unsigned int *)v17 + 18),  *((unsigned int *)v17 + 19),  v22,  v23,  v24);
        uint64_t v28 = (__CFError *)v17[10];
        if (v28)
        {
          CFIndex Code = CFErrorGetCode(v28);
          Domain = CFErrorGetDomain((CFErrorRef)v17[10]);
          int v31 = sub_100010D3C((CFErrorRef)v17[10]);
          sub_1000124E0(a1, 15LL, *((unsigned int *)v17 + 22), *((unsigned int *)v17 + 18), Code, v32, v33, v34);
          if (Domain)
          {
            bzero(buffer, 0x400uLL);
            CFStringGetCString(Domain, (char *)buffer, 1024LL, 0x8000100u);
            sub_100012630( a1,  16LL,  *((unsigned int *)v17 + 22),  *((unsigned int *)v17 + 18),  (const char *)buffer,  v35,  v36,  v37);
          }

          if (v31)
          {
            sub_1000122C0(a1, 17LL, *((unsigned int *)v17 + 22), v31, v21, v22, v23, v24);
            free(v31);
          }
        }

        goto LABEL_68;
      }

      if (v26 != 33) {
        goto LABEL_69;
      }
LABEL_13:
      uint64_t v20 = *((unsigned int *)v17 + 18);
      int v27 = *((_DWORD *)v17 + 14);
      if ((_DWORD)v20)
      {
        sub_1000124E0(a1, 13LL, v27 | 0x11070000u, v20, 0LL, v22, v23, v24);
        goto LABEL_68;
      }

      uint64_t v46 = 23LL;
      if (!*(_BYTE *)(a1 + 104)) {
        uint64_t v46 = 11LL;
      }
      uint64_t v47 = a1 + 16 * v46;
      uint64_t v48 = *(void **)(v47 + 1496);
      if (!v48) {
        goto LABEL_45;
      }
      int v49 = v27 | 0x11030000;
      if (*(_DWORD *)v48 == v49)
      {
        uint64_t v50 = 0LL;
        *uint64_t v48 = 0LL;
LABEL_37:
        uint64_t v51 = v50;
        do
        {
          v48[v51] = v48[v51 + 1];
          ++v51;
        }

        while (v51 != 7);
        goto LABEL_39;
      }

      __int128 v52 = v48 + 1;
      unint64_t v53 = -1LL;
      while (v53 != 6)
      {
        int v54 = *v52;
        v52 += 2;
        ++v53;
        if (v54 == v49)
        {
          *((void *)v52 - 1) = 0LL;
          if (v53 <= 5)
          {
            uint64_t v50 = v53 + 1;
            goto LABEL_37;
          }

LABEL_39:
          v48[7] = 0LL;
          *(_BYTE *)(v47 + 1492) = 1;
          goto LABEL_48;
        }
      }

LABEL_45:
      int v55 = *(_DWORD *)(a1 + 1480);
      if (!v55)
      {
        ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): {%s} tracking information lost on remove [%s]\n",  v18,  v19,  v20,  v21,  v22,  v23,  v24,  (char)"checkpoint_nvram_remove_lost");
        int v55 = *(_DWORD *)(a1 + 1480);
      }

      *(_DWORD *)(a1 + 1480) = v55 + 1;
LABEL_48:
      uint64_t v56 = 24LL;
      if (!*(_BYTE *)(a1 + 104)) {
        uint64_t v56 = 12LL;
      }
      if (((0x1001100uLL >> v56) & 1) == 0) {
        goto LABEL_63;
      }
      uint64_t v57 = a1 + 16 * v56;
      uint64_t v58 = *(void *)(v57 + 1496);
      if (!v58) {
        goto LABEL_63;
      }
      int v59 = *((_DWORD *)v17 + 14) | 0x11030000;
      if (*(_DWORD *)v58 == v59)
      {
        unint64_t v60 = 0LL;
LABEL_57:
        uint64_t v63 = (void *)(v58 + 16 * v60);
        uint64_t v64 = (void *)v63[1];
        if (v64) {
          free(v64);
        }
        *uint64_t v63 = 0LL;
        v63[1] = 0LL;
        if (v60 <= 6)
        {
          uint64_t v65 = 16 * v60;
          do
          {
            *(_OWORD *)(v58 + v65) = *(_OWORD *)(v58 + v65 + 16);
            v65 += 16LL;
          }

          while (v65 != 112);
        }

        *(void *)(v58 + 112) = 0LL;
        *(void *)(v58 + 120) = 0LL;
        *(_BYTE *)(v57 + 1492) = 1;
      }

      else
      {
        unint64_t v60 = 0LL;
        uint64_t v61 = (int *)(v58 + 16);
        while (v60 != 7)
        {
          ++v60;
          int v62 = *v61;
          v61 += 4;
          if (v62 == v59) {
            goto LABEL_57;
          }
        }

LABEL_63:
        int v66 = *(_DWORD *)(a1 + 1480);
        if (!v66)
        {
          ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): {%s} tracking information lost on remove [%s]\n",  v18,  v19,  v20,  v21,  v22,  v23,  v24,  (char)"checkpoint_nvram_remove_lost");
          int v66 = *(_DWORD *)(a1 + 1480);
        }

        *(_DWORD *)(a1 + 1480) = v66 + 1;
      }

LABEL_68:
      sub_1000123FC(a1, 18LL, v25, v20, v21, v22, v23, v24);
      sub_1000123FC(a1, 21LL, (uint64_t)*((double *)v17 + 14), v67, v68, v69, v70, v71);
LABEL_69:
      void *v17 = 0LL;
      **(void **)(a1 + 192) = v17;
      *(void *)(a1 + 192) = v17;
      unsigned int v72 = *(_DWORD *)(a1 + 200) + 1;
      *(_DWORD *)(a1 + 200) = v72;
      if (v72 >= 0x201)
      {
        uint64_t v73 = (void **)(a1 + 184);
        do
        {
          id v74 = *v73;
          v75 = (void *)**v73;
          *uint64_t v73 = v75;
          if (!v75) {
            *(void *)(a1 + 192) = v73;
          }
          *(_DWORD *)(a1 + 200) = v72 - 1;
          uint64_t v76 = (void *)v74[8];
          if (v76)
          {
            free(v76);
            v74[8] = 0LL;
          }

          uint64_t v77 = (const void *)v74[10];
          if (v77) {
            CFRelease(v77);
          }
          free(v74);
          unsigned int v72 = *(_DWORD *)(a1 + 200);
        }

        while (v72 > 0x200);
      }

      memset(buffer, 0, 56);
      v131[0] = 0LL;
      gmtime_r(v17 + 2, buffer);
      uint64_t v78 = *((unsigned int *)v17 + 2);
      else {
        uint64_t v79 = off_1000250B8[v78];
      }
      asprintf( v131,  "[%02u:%02u:%02u.%04u-GMT]{%u>%u} CHECKPOINT %s",  buffer[0].tm_hour,  buffer[0].tm_min,  buffer[0].tm_sec,  *((_DWORD *)v17 + 8) / 1000,  *((_DWORD *)v17 + 11),  *((_DWORD *)v17 + 10),  v79);
      uint64_t v80 = v131[0];
      *(void *)&buffer[0].tm_sec = 0LL;
      if (*((_DWORD *)v17 + 19))
      {
        asprintf((char **)buffer, "(FAILURE:%d) ");
      }

      else
      {
        unsigned int v87 = *((_DWORD *)v17 + 2);
        if (v87 <= 0x1C && ((1 << v87) & 0x18000080) != 0) {
          asprintf((char **)buffer, "(SUCCESS) ", v127);
        }
        else {
          asprintf((char **)buffer, " ", v127);
        }
      }

      v88 = *(char **)&buffer[0].tm_sec;
      if (!v80 || !*(void *)&buffer[0].tm_sec) {
        goto LABEL_149;
      }
      *(void *)&buffer[0].tm_sec = 0LL;
      if (*((_DWORD *)v17 + 14))
      {
        int v89 = *((_DWORD *)v17 + 2);
        if (v89 == 28 || v89 == 1)
        {
          asprintf((char **)buffer, "[0x%04X] %s");
        }

        else if (*((_DWORD *)v17 + 12) == 1)
        {
          asprintf((char **)buffer, "%s");
        }

        else
        {
          asprintf((char **)buffer, "%s:[0x%04X] %s");
        }

        v90 = *(char **)&buffer[0].tm_sec;
      }

      else
      {
        v90 = 0LL;
      }

      v131[0] = 0LL;
      int v91 = *((_DWORD *)v17 + 2);
      if (v91 == 28)
      {
        *(void *)&buffer[0].tm_sec = 0LL;
        if (!*((_DWORD *)v17 + 19))
        {
          asprintf((char **)buffer, "... %s");
          goto LABEL_122;
        }

        v94 = sub_100012830(a1, 9LL, v81, v82, v83, v84, v85, v86);
        v100 = sub_1000128DC(a1, a1 + 1064, 12LL, v95, v96, v97, v98, v99);
        v101 = v100;
        uint64_t v102 = *(unsigned int *)(a1 + 108);
        else {
          v103 = off_1000252B0[v102];
        }
        if (v94)
        {
          if (!v100)
          {
            asprintf((char **)buffer, "[%s] %s", v103, v94);
            v112 = v94;
            goto LABEL_121;
          }

          asprintf((char **)buffer, "[%s] %s %s", v103, v100, v94);
          free(v94);
        }

        else
        {
          if (!v100)
          {
            asprintf((char **)buffer, "[%s]");
LABEL_122:
            v92 = *(char **)&buffer[0].tm_sec;
            if (v90) {
              goto LABEL_106;
            }
            goto LABEL_123;
          }

          asprintf((char **)buffer, "[%s] %s", v103, v100);
        }

        v112 = v101;
LABEL_121:
        free(v112);
        goto LABEL_122;
      }

      if (v91 == 27)
      {
        v92 = sub_100012830(a1, 13LL, v81, v82, v83, v84, v85, v86);
        int v93 = strcmp(v92, "{}");
        if (v92 && !v93)
        {
          free(v92);
          if (!v90) {
            goto LABEL_125;
          }
LABEL_108:
          asprintf(v131, "%s:%s%s", v80, v88, v90);
          char v111 = 0;
          v92 = 0LL;
          goto LABEL_127;
        }
      }

      else
      {
        v92 = sub_100010D3C((CFErrorRef)v17[10]);
      }

      if (v90)
      {
LABEL_106:
        if (v92)
        {
          asprintf(v131, "%s:%s%s %s", v80, v88, v90, v92);
          char v111 = 0;
          goto LABEL_127;
        }

        goto LABEL_108;
      }

LABEL_123:
      if (v92)
      {
        asprintf(v131, "%s:%s %s", v80, v88, v92);
        goto LABEL_126;
      }

LABEL_125:
      asprintf(v131, "%s:%s", v80, v88);
      v92 = 0LL;
LABEL_126:
      char v111 = 1;
LABEL_127:
      char v113 = (char)v131[0];
      if (v131[0])
      {
        char v129 = v111;
        if (*((_DWORD *)v17 + 2) == 28)
        {
          if (*(_DWORD *)(a1 + 88) == 2) {
            int v114 = 1;
          }
          else {
            int v114 = 3;
          }
        }

        else
        {
          int v114 = 1;
        }

        while (1)
        {
          ramrod_log_msg("%s\n", v104, v105, v106, v107, v108, v109, v110, v113);
          if (*((_DWORD *)v17 + 2) == 28) {
            ramrod_log_msg( "\n^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n",  v115,  v116,  v117,  v118,  v119,  v120,  v121,  v128);
          }
          if (v114 < 2) {
            break;
          }
          --v114;
          sleep(1u);
        }

        v122 = v131[0];
        v123 = calloc(1uLL, 0x10uLL);
        if (v123)
        {
          v124 = v123;
          v123[1] = v122;
          if (*(_DWORD *)a1 == 1)
          {
            void *v123 = 0LL;
            **(void **)(a1 + 480) = v123;
            *(void *)(a1 + 480) = v123;
          }

          else
          {
            pthread_mutex_lock((pthread_mutex_t *)(a1 + 232));
            int v125 = *(_DWORD *)a1;
            void *v124 = 0LL;
            **(void **)(a1 + 480) = v124;
            *(void *)(a1 + 480) = v124;
            if (v125 != 1) {
              pthread_mutex_unlock((pthread_mutex_t *)(a1 + 232));
            }
          }

          *(_BYTE *)(a1 + 208) = 1;
          char v111 = v129;
        }

        else if (v122)
        {
          free(v122);
        }
      }

      if ((v111 & 1) == 0) {
        free(v90);
      }
      if (v92) {
        free(v92);
      }
LABEL_149:
      if (v80) {
        free(v80);
      }
      if (v88) {
        free(v88);
      }
      return v17;
  }

void sub_10001075C( int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_BYTE *)(a2 + 4))
  {
    ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): first available indication when already collected\n",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  (char)"checkpoint_nvram_collect");
    return;
  }

  int v10 = (const __CFString **)(a2 + 8);
  for (uint64_t i = 1LL; i != 49; ++i)
  {
    sub_1000119D0((uint64_t)a1, *(_DWORD *)a2, i - 1, v10);
    int v16 = *a1;
    if ((i - 40) <= 3 && v16 == 2)
    {
      if (*(void *)(a2 + 8 * i)) {
        goto LABEL_12;
      }
    }

    else if ((i - 44) <= 3 && v16 == 2)
    {
      int v17 = *(const __CFString **)(a2 + 8 * i);
      if (v17)
      {
        bzero(v23, 0x400uLL);
        sub_100010B3C(v17, v23);
        sub_100010B84((uint64_t)a1, (i - 5), v23, v18, v19, v20, v21, v22);
LABEL_12:
        sub_100010A3C((uint64_t)a1, i - 1, 0LL, 0LL, v12, v13, v14, v15);
      }
    }

    ++v10;
  }

  *(_BYTE *)(a2 + 4) = 1;
}

uint64_t sub_1000108A0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = sub_1000128DC(a1, a2, 5LL, a4, a5, a6, a7, a8);
  if (!v8) {
    return 0LL;
  }
  uint64_t v9 = v8;
  unint64_t v10 = 0LL;
  do
  {
    if (!strcmp(v9, off_1000252E8[v10])) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0LL;
    }
    if ((_DWORD)v11) {
      break;
    }
  }

  while (v10++ < 0x21);
  free(v9);
  return v11;
}

void sub_100010918(uint64_t a1, uint64_t a2, char *a3, ...)
{
  v8[0] = 0LL;
  va_copy((va_list)&v8[1], va);
  vasprintf(v8, a3, va);
  if (v8[0])
  {
    sub_10000FC94(a1, 30, 1, 0, 260, v8[0], 0, 0, 0LL);
    sub_1000122C0(a1, 8LL, *(unsigned int *)(a1 + 120), v8[0], v4, v5, v6, v7);
    if (v8[0])
    {
      free(v8[0]);
      v8[0] = 0LL;
    }
  }

  ++*(_DWORD *)(a1 + 120);
}

void sub_1000109B4( uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(unsigned int *)(a1 + 96);
  uint64_t v9 = (uint64_t)*(&off_1000253F8 + v8);
  if (*(_DWORD *)(v9 + 4LL * a2))
  {
    *(_DWORD *)(a1 + 92) = v8;
    uint64_t v12 = *(unsigned int *)(v9 + 4LL * a2);
    *(_DWORD *)(a1 + 96) = v12;
    else {
      uint64_t v13 = off_1000252E8[v12];
    }
    sub_100010B84(a1, 5LL, v13, a4, a5, a6, a7, a8);
    sub_100012158(a1, a2);
  }

void sub_100010A3C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2 < 0x30)
  {
    uint64_t v9 = &off_100024A30[4 * a2];
    if ((_DWORD)a3 || (*((_DWORD *)v9 + 6) - 5) < 0xFFFFFFFD)
    {
      bzero(buffer, 0x400uLL);
      if (*(_DWORD *)(a1 + 88) == 1) {
        unint64_t v10 = (CFStringRef *)v9;
      }
      else {
        unint64_t v10 = (CFStringRef *)(v9 + 1);
      }
      uint64_t v11 = *v10;
      CFStringGetCString(*v10, buffer, 1024LL, 0x8000100u);
      sub_100012098(v11);
    }

    else
    {
      ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): invalid delete of BOOT-CONTROL NVRAM ID %u\n",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  (char)"checkpoint_nvram_delete_var");
    }
  }

  else
  {
    ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): invalid delete of NVRAM ID %u\n",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  (char)"checkpoint_nvram_delete_var");
  }

char *sub_100010B3C(const __CFString *a1, char *a2)
{
  if (a1) {
    CFStringGetCString(a1, a2, 1024LL, 0x8000100u);
  }
  else {
    bzero(a2, 0x400uLL);
  }
  return a2;
}

void sub_100010B84( uint64_t a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_BYTE *)(a1 + 104))
  {
    if (a2 > 0x2F)
    {
      ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): invalid variable ID=%d\n",  a2,  (uint64_t)a3,  a4,  a5,  a6,  a7,  a8,  (char)"checkpoint_nvram_adjust_id");
      uint64_t v10 = 0LL;
      goto LABEL_7;
    }

    a2 = LODWORD(off_100024A30[4 * a2 + 2]);
  }

  uint64_t v10 = a2;
LABEL_7:
  if (((0xFFFC000000FEuLL >> v10) & 1) != 0)
  {
    uint64_t v11 = *(void ***)(a1 + 16 * v10 + 1496);
    if (v11)
    {
      if (*v11)
      {
        free(*v11);
        *uint64_t v11 = 0LL;
      }

      sub_10001278C(a1 + 1456, (char **)v11, a3, a4, a5, a6, a7, a8);
      *(_BYTE *)(a1 + 16 * v10 + 1492) = 1;
      return;
    }
  }

LABEL_12:
  int v12 = *(_DWORD *)(a1 + 1476);
  if (!v12)
  {
    ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): {%s} tracking information lost on store [%s]\n",  a2,  (uint64_t)a3,  a4,  a5,  a6,  a7,  a8,  (char)"checkpoint_nvram_store_lost");
    int v12 = *(_DWORD *)(a1 + 1476);
  }

  *(_DWORD *)(a1 + 1476) = v12 + 1;
}

void sub_100010C9C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    if (*(_DWORD *)a1 != 1) {
      pthread_mutex_lock((pthread_mutex_t *)(a1 + 8));
    }
  }

  else
  {
    ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): checkpoint context not initialized\n",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  (char)"checkpoint_access_obtain");
  }

void sub_100010CEC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    if (*(_DWORD *)a1 != 1) {
      pthread_mutex_unlock((pthread_mutex_t *)(a1 + 8));
    }
  }

  else
  {
    ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): checkpoint context not initialized\n",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  (char)"checkpoint_access_yield");
  }

char *sub_100010D3C(CFErrorRef err)
{
  if (!err) {
    return 0LL;
  }
  int v1 = err;
  CFStringRef v2 = 0LL;
  unsigned int v3 = 0;
  do
  {
    uint64_t v4 = CFErrorCopyUserInfo(v1);
    CFStringRef v2 = sub_100011798(v2, "[%d]", v5, v6, v7, v8, v9, v10, v3);
    if (!v4) {
      break;
    }
    char v22 = 0;
    Value = (const __CFString *)CFDictionaryGetValue(v4, kCFErrorLocalizedRecoverySuggestionKey);
    int v12 = sub_1000129D0(v2, (char)"RS", Value, &v22);
    uint64_t v13 = (const __CFString *)CFDictionaryGetValue(v4, kCFErrorLocalizedDescriptionKey);
    uint64_t v14 = sub_1000129D0(v12, (char)"LD", v13, &v22);
    uint64_t v15 = (const __CFString *)CFDictionaryGetValue(v4, kCFErrorDescriptionKey);
    int v16 = sub_1000129D0(v14, (char)"D", v15, &v22);
    int v17 = (const __CFString *)CFDictionaryGetValue(v4, kCFErrorLocalizedFailureReasonKey);
    CFStringRef v2 = sub_1000129D0(v16, (char)"FR", v17, &v22);
    int v1 = (__CFError *)CFDictionaryGetValue(v4, kCFErrorUnderlyingErrorKey);
    CFRelease(v4);
    if (!v1) {
      break;
    }
  }

  while (v3++ < 0xF);
  size_t v19 = strlen(v2);
  if (v19 >= 0xF3)
  {
    uint64_t v21 = 0LL;
    asprintf(&v21, "%s", &v2[v19 - 242]);
    if (v2) {
      free(v2);
    }
    return v21;
  }

  return v2;
}

uint64_t checkpoint_closure_context_get_step_desc(uint64_t result)
{
  if (result) {
    return *(void *)result;
  }
  return result;
}

uint64_t checkpoint_closure_context_should_retry(uint64_t result)
{
  if (result)
  {
    int v1 = *(_DWORD *)(result + 40);
    *(_DWORD *)(result + 40) = v1 + 1;
    return !*(_BYTE *)(result + 11) && v1 < *(_DWORD *)(*(void *)result + 28LL);
  }

  return result;
}

uint64_t checkpoint_closure_context_handle_simulator_actions( uint64_t *a1, uint64_t a2, int *a3, const void **a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    if (qword_10002E4D8) {
      return sub_100010FE4(qword_10002E4D8, *a1, a2, a3, a4, a6, a7, a8);
    }
    ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): %s called too early, checkpoint_chassis_context == NULL\n",  a2,  (uint64_t)a3,  (uint64_t)a4,  a5,  a6,  a7,  a8,  (char)"checkpoint_closure_context_handle_simulator_actions");
  }

  else
  {
    ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): closure context is NULL\n",  a2,  (uint64_t)a3,  (uint64_t)a4,  a5,  a6,  a7,  a8,  (char)"checkpoint_closure_context_handle_simulator_actions");
  }

  return a2;
}

uint64_t sub_100010FE4( uint64_t a1, uint64_t a2, uint64_t a3, int *a4, const void **a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v10 = a3;
  unsigned int v13 = a3;
  sub_100010C9C(a1, a2, a3, (uint64_t)a4, (uint64_t)a5, a6, a7, a8);
  sub_100012AA0(a1, v14, v15, v16, v17, v18, v19, v20);
  if (!*(_DWORD *)(a1 + 2276) || !*(void *)(a1 + 2288)) {
    goto LABEL_14;
  }
  CFStringRef v28 = CFStringCreateWithCString(kCFAllocatorDefault, *(const char **)(a2 + 8), 0x8000100u);
  CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 2288));
  if (Count < 1)
  {
    BOOL v36 = 0;
    if (!v28) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }

  CFIndex v30 = Count;
  ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 2288), 0LL);
  if (CFStringCompare(v28, ValueAtIndex, 0LL) == kCFCompareEqualTo)
  {
    BOOL v36 = 1;
    if (!v28) {
      goto LABEL_10;
    }
LABEL_9:
    CFRelease(v28);
    goto LABEL_10;
  }

  CFIndex v32 = 1LL;
  do
  {
    CFIndex v33 = v32;
    if (v30 == v32) {
      break;
    }
    uint64_t v34 = (const __CFString *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 2288), v32);
    CFComparisonResult v35 = CFStringCompare(v28, v34, 0LL);
    CFIndex v32 = v33 + 1;
  }

  while (v35);
  BOOL v36 = v33 < v30;
  if (v28) {
    goto LABEL_9;
  }
LABEL_10:
  if (!v36)
  {
LABEL_14:
    sub_100010CEC(a1, v21, v22, v23, v24, v25, v26, v27);
    BOOL v38 = 0;
    goto LABEL_15;
  }

  int v37 = *(_DWORD *)(a1 + 2284);
  if (v37)
  {
    if (!v13) {
      *(_DWORD *)(a1 + 2284) = v37 - 1;
    }
    goto LABEL_14;
  }

  if (v13) {
    sub_10000FC94( a1,  *(_DWORD *)(a1 + 2276),  1,  0,  *(_DWORD *)a2,  *(const char **)(a2 + 8),  *(_DWORD *)(a1 + 2280),  *a4,  *a5);
  }
  sub_100010CEC(a1, v21, v22, v23, v24, v25, v26, v27);
  BOOL v38 = 0;
  int v47 = 0;
  switch(*(_DWORD *)(a1 + 2276))
  {
    case 9:
      goto LABEL_80;
    case 0xA:
      if (*(unsigned __int8 *)(a1 + 2275) == v10)
      {
        *a4 = 181;
        ramrod_create_error_cf( (CFErrorRef *)a5,  @"CheckpointErrorDomain",  181LL,  0LL,  @"checkpoint simulator error",  v44,  v45,  v46,  v92);
      }

      goto LABEL_76;
    case 0xB:
      goto LABEL_76;
    case 0xC:
      goto LABEL_76;
    case 0xD:
      goto LABEL_76;
    case 0xE:
      if (*(unsigned __int8 *)(a1 + 2275) == v10)
      {
        for (uint64_t i = 0LL; ; i += 4LL)
          ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): simulator signal executing after dereference of %p [%d]\n",  v40,  v41,  v42,  v43,  v44,  v45,  v46,  (char)"checkpoint_simulator_action");
      }

      goto LABEL_76;
    case 0xF:
      if (*(unsigned __int8 *)(a1 + 2275) == v10)
      {
        while (1)
          ;
      }

      goto LABEL_76;
    case 0x10:
      if (*(unsigned __int8 *)(a1 + 2275) == v10)
      {
        memset(&v94, 0, sizeof(v94));
        v93.__sig = 0LL;
        *(void *)v93.__opaque = 0LL;
        pthread_mutexattr_init(&v93);
        pthread_mutex_init(&v94, &v93);
        pthread_mutex_lock(&v94);
        pthread_mutex_lock(&v94);
      }

      goto LABEL_76;
    case 0x11:
      mach_port_t v49 = mach_host_self();
      int v50 = 0;
      goto LABEL_45;
    case 0x12:
      mach_port_t v49 = mach_host_self();
      int v50 = 4096;
LABEL_45:
      host_reboot(v49, v50);
LABEL_76:
      BOOL v38 = 0;
      goto LABEL_77;
    case 0x13:
      ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): simulator PAUSE not supported\n",  v40,  v41,  v42,  v43,  v44,  v45,  v46,  (char)"checkpoint_simulator_action");
      goto LABEL_76;
    case 0x14:
      ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): simulator RESUME not supported\n",  v40,  v41,  v42,  v43,  v44,  v45,  v46,  (char)"checkpoint_simulator_action");
      goto LABEL_76;
    case 0x15:
      __break(1u);
LABEL_50:
      BOOL v38 = v10 == 0;
LABEL_77:
      int v47 = v13;
LABEL_78:
      if (!v13) {
        goto LABEL_80;
      }
      unsigned int v13 = v47;
      if (!v47) {
        goto LABEL_80;
      }
      goto LABEL_15;
    case 0x16:
      goto LABEL_50;
    case 0x17:
      BOOL v38 = 0;
      int v51 = *(unsigned __int8 *)(a1 + 2275);
      if (v51 == v10) {
        int v47 = 0;
      }
      else {
        int v47 = v10;
      }
      if (v13 || v51 != v10) {
        goto LABEL_78;
      }
      if (!*a4)
      {
        ramrod_log_msg( "CHECKPOINT_SIMULATOR_NOTICE(%s): checkpoint simulator to ignore error on step %s, but step was successful\n",  v40,  v41,  v42,  v43,  v44,  v45,  v46,  (char)"checkpoint_simulator_action");
        goto LABEL_70;
      }

      ramrod_log_msg( "CHECKPOINT_SIMULATOR_NOTICE(%s): checkpoint simulator ignoring error on step %s result: %d\n",  v40,  v41,  v42,  v43,  v44,  v45,  v46,  (char)"checkpoint_simulator_action");
      *a4 = 0;
      if (!*a5)
      {
LABEL_70:
        BOOL v38 = 0;
        int v47 = 0;
        goto LABEL_80;
      }

      __int128 v52 = sub_100010D3C((CFErrorRef)*a5);
      if (v52)
      {
        unint64_t v60 = v52;
        ramrod_log_msg( "CHECKPOINT_SIMULATOR_NOTICE(%s): checkpoint simulator ignoring error on step %s error: %s\n",  v53,  v54,  v55,  v56,  v57,  v58,  v59,  (char)"checkpoint_simulator_action");
        free(v60);
      }

      CFRelease(*a5);
      BOOL v38 = 0;
      int v47 = 0;
      *a5 = 0LL;
LABEL_80:
      int v90 = *(_DWORD *)(a1 + 2280);
      if (v90)
      {
        int v91 = v90 - 1;
        *(_DWORD *)(a1 + 2280) = v91;
        if (!v91) {
          *(_DWORD *)(a1 + 2276) = 0;
        }
      }

      unsigned int v13 = v47;
LABEL_15:
      if (v10) {
        return v13;
      }
      else {
        return v38;
      }
    case 0x18:
      if (*(unsigned __int8 *)(a1 + 2275) == v10)
      {
        sub_100012CB8();
        ramrod_log_msg( "CHECKPOINT_SIMULATOR_NOTICE(%s): returned from checkpoint jetsam attempt; continuing engine\n",
          v61,
          v62,
          v63,
          v64,
          v65,
          v66,
          v67,
          (char)"checkpoint_simulator_action");
      }

      goto LABEL_76;
    case 0x19:
      if (*(unsigned __int8 *)(a1 + 2275) == v10)
      {
        int v68 = fork();
        if (v68 < 1)
        {
          if (!v68)
          {
            sub_100012CB8();
            exit(0);
          }

          __error();
          ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): error %d attempting to fork jetsam child\n",  v76,  v77,  v78,  v79,  v80,  v81,  v82,  (char)"checkpoint_simulator_action");
        }

        else
        {
          LODWORD(v94.__sig) = 0;
          if (waitpid(v68, (int *)&v94, 0) < 0)
          {
            __error();
            ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): error %d waiting for jetsam child\n",  v83,  v84,  v85,  v86,  v87,  v88,  v89,  (char)"checkpoint_simulator_action");
          }

          else if ((v94.__sig & 0x7F) == 0x7F)
          {
            ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): unexpected status of jetsam child: %d\n",  v69,  v70,  v71,  v72,  v73,  v74,  v75,  (char)"checkpoint_simulator_action");
          }

          else if ((v94.__sig & 0x7F) != 0)
          {
            ramrod_log_msg( "CHECKPOINT_SIMULATOR_NOTICE(%s): jetsam child signalled: %d\n",  v69,  v70,  v71,  v72,  v73,  v74,  v75,  (char)"checkpoint_simulator_action");
          }

          else
          {
            ramrod_log_msg( "CHECKPOINT_SIMULATOR_NOTICE(%s): jetsam child exited: %d\n",  v69,  v70,  v71,  v72,  v73,  v74,  v75,  (char)"checkpoint_simulator_action");
          }
        }
      }

      goto LABEL_76;
    default:
      ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): unknown simulator command ignored\n",  v40,  v41,  v42,  v43,  v44,  v45,  v46,  (char)"checkpoint_simulator_action");
      BOOL v38 = 0;
      int v47 = 1;
      goto LABEL_78;
  }

uint64_t checkpoint_closure_context_handle_simulator_match_name( uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    if (qword_10002E4D8) {
      return sub_1000115D8(qword_10002E4D8, *a1, a3, a4, a5, a6, a7, a8);
    }
    ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): %s called too early, checkpoint_chassis_context == NULL\n",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  (char)"checkpoint_closure_context_handle_simulator_match_name");
  }

  else
  {
    ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): closure context is NULL\n",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  (char)"checkpoint_closure_context_handle_simulator_match_name");
  }

  return 0LL;
}

uint64_t sub_1000115D8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_DWORD *)(a1 + 2276))
  {
    CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 2288));
    CFIndex v32 = CFStringCreateWithCString(kCFAllocatorDefault, *(const char **)(a2 + 8), 0x8000100u);
    if (Count < 1)
    {
LABEL_6:
      uint64_t v35 = 0LL;
    }

    else
    {
      CFIndex v33 = 0LL;
      while (1)
      {
        ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 2288), v33);
        if (CFStringCompare(v32, ValueAtIndex, 0LL) == kCFCompareEqualTo) {
          break;
        }
        if (Count == ++v33) {
          goto LABEL_6;
        }
      }

      uint64_t v35 = 1LL;
    }

    sub_100010CEC(a1, v25, v26, v27, v28, v29, v30, v31);
    if (v32) {
      CFRelease(v32);
    }
  }

  else
  {
    sub_100010CEC(a1, v17, v18, v19, v20, v21, v22, v23);
    return 0LL;
  }

  return v35;
}

char *sub_1000116AC(char *a1, const char *a2, const char *a3, int *a4)
{
  uint64_t v11 = 0LL;
  uint64_t v12 = 0LL;
  asprintf(&v12, "%s:%s", a2, a3);
  uint64_t v6 = v12;
  if (!v12) {
    return a1;
  }
  if (!a1) {
    return v12;
  }
  size_t v7 = strlen(a1);
  size_t v8 = strlen(v12);
  uint64_t v9 = 1LL;
  if (*a4 > 0) {
    uint64_t v9 = 2LL;
  }
  if (v8 + v7 + v9 >= 0x81)
  {
    uint64_t v11 = a1;
LABEL_13:
    free(v6);
    return v11;
  }

  if (*a4 <= 0) {
    asprintf(&v11, "%s%s");
  }
  else {
    asprintf(&v11, "%s;%s");
  }
  ++*a4;
  free(a1);
  uint64_t v6 = v12;
  if (v12) {
    goto LABEL_13;
  }
  return v11;
}

char *sub_100011798( char *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v11 = 0LL;
  v12[0] = 0LL;
  v12[1] = &a9;
  vasprintf(v12, a2, &a9);
  if (!v12[0]) {
    return a1;
  }
  if (!a1) {
    return v12[0];
  }
  asprintf(&v11, "%s%s", a1, v12[0]);
  if (v11) {
    free(a1);
  }
  else {
    uint64_t v11 = a1;
  }
  if (v12[0])
  {
    free(v12[0]);
    v12[0] = 0LL;
  }

  return v11;
}

char *sub_100011834(char *a1, int a2, const char *a3, int *a4)
{
  size_t v8 = 0LL;
  asprintf(&v8, "0x%08X", a2);
  if (v8)
  {
    a1 = sub_1000116AC(a1, v8, a3, a4);
    if (v8) {
      free(v8);
    }
  }

  return a1;
}

char *sub_1000118A8(char *a1, int a2, const char *a3, int *a4)
{
  size_t v8 = 0LL;
  asprintf(&v8, "%d", a2);
  if (v8)
  {
    a1 = sub_1000116AC(a1, v8, a3, a4);
    if (v8) {
      free(v8);
    }
  }

  return a1;
}

void sub_10001191C( uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_DWORD *)a1 == 1)
  {
    if (a2)
    {
      if (*(_BYTE *)(a1 + 104))
      {
        int v9 = 17;
        goto LABEL_14;
      }

      BOOL v10 = *(_BYTE *)(a1 + 101) == 0;
      int v9 = 5;
    }

    else
    {
      BOOL v10 = *(_DWORD *)(a1 + 88) == 2;
      int v9 = 1;
    }
  }

  else if (a2)
  {
    if (*(_BYTE *)(a1 + 104))
    {
      int v9 = 19;
      goto LABEL_14;
    }

    BOOL v10 = *(_BYTE *)(a1 + 101) == 0;
    int v9 = 7;
  }

  else
  {
    BOOL v10 = *(_DWORD *)(a1 + 88) == 2;
    int v9 = 3;
  }

  if (!v10) {
    ++v9;
  }
LABEL_14:
  *(_DWORD *)(a1 + 96) = v9;
  sub_100010B84(a1, 5LL, off_1000252E8[v9], a4, a5, a6, a7, a8);
  sub_100012158(a1, 1);
}

void sub_1000119D0(uint64_t a1, unsigned int a2, unsigned int a3, const __CFString **a4)
{
  CFTypeRef cf = 0LL;
  bzero(buffer, 0x400uLL);
  bzero(v46, 0x400uLL);
  if (a3 < 0x30)
  {
    if (*(_DWORD *)(a1 + 88) == 1) {
      uint64_t v16 = &off_100024A30[4 * a3];
    }
    else {
      uint64_t v16 = &off_100024A30[4 * a3 + 1];
    }
    CFStringGetCString(*v16, buffer, 1024LL, 0x8000100u);
    uint64_t v17 = (const __CFString *)ramrod_copy_NVRAM_variable();
    if (!v17) {
      return;
    }
    uint64_t v15 = v17;
    CFTypeID v18 = CFGetTypeID(v17);
    if (v18 == CFStringGetTypeID())
    {
      CFStringGetCString(v15, v46, 1024LL, 0x8000100u);
      *a4 = v15;
      uint64_t v15 = 0LL;
      goto LABEL_22;
    }

    if (v18 == CFNumberGetTypeID())
    {
      LODWORD(valuePtr) = 0;
      if (!CFNumberGetValue((CFNumberRef)v15, kCFNumberIntType, &valuePtr))
      {
        uint64_t v27 = "CHECKPOINT_INTERNAL_ERROR(%s): number that is not an int %s\n";
        goto LABEL_29;
      }

      uint64_t v26 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"%d", valuePtr);
      if (!v26)
      {
        uint64_t v27 = "CHECKPOINT_INTERNAL_ERROR(%s): failed to get valid number for %s\n";
LABEL_29:
        ramrod_log_msg(v27, v19, v20, v21, v22, v23, v24, v25, (char)"checkpoint_nvram_collect_var");
        goto LABEL_3;
      }
    }

    else
    {
      if (v18 != CFDataGetTypeID())
      {
        ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): unsupported nvram variable type for %s\n",  v28,  v29,  v30,  v31,  v32,  v33,  v34,  (char)"checkpoint_nvram_collect_var");
        goto LABEL_3;
      }

      uint64_t v26 = CFStringCreateFromExternalRepresentation(kCFAllocatorDefault, (CFDataRef)v15, 0x8000100u);
      if (!v26)
      {
        ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): failed to get string from data %s\n",  v35,  v36,  v37,  v38,  v39,  v40,  v41,  (char)"checkpoint_nvram_collect_var");
        goto LABEL_3;
      }
    }

    uint64_t v42 = v26;
    CFStringGetCString(v26, v46, 1024LL, 0x8000100u);
    *a4 = v42;
LABEL_22:
    int valuePtr = 0LL;
    if (a2 > 2) {
      uint64_t v43 = "Unknown";
    }
    else {
      uint64_t v43 = off_100025030[a2];
    }
    asprintf(&valuePtr, "%s NVRAM variable: %s=%s", v43, buffer, v46);
    if (valuePtr)
    {
      sub_10000FC94(a1, 2, 1, 0, 257, valuePtr, 0, 0, 0LL);
      free(valuePtr);
    }

    goto LABEL_3;
  }

  ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): invalid variable id=%u\n",  v8,  v9,  v10,  v11,  v12,  v13,  v14,  (char)"checkpoint_nvram_collect_var");
  uint64_t v15 = 0LL;
LABEL_3:
  if (cf) {
    CFRelease(cf);
  }
  if (v15) {
    CFRelease(v15);
  }
}

uint64_t sub_100011CB4( uint64_t a1, uint64_t a2, unsigned int *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v10 = *a3;
  if (*a3)
  {
    unsigned __int8 v11 = 0;
    char v12 = 0;
    uint64_t v13 = a3 + 2;
    do
    {
      uint64_t v14 = v10;
      *((_BYTE *)v38 + v10) = 1;
      if (*(void *)(a2 + 8LL * v10 + 8))
      {
        if (*((_BYTE *)v13 - 3)) {
          unsigned __int8 v11 = 1;
        }
        if (*((_BYTE *)v13 - 2)) {
          char v12 = 1;
        }
        if (*((_BYTE *)v13 - 1))
        {
          uint64_t v15 = v10 <= 0x2F && (LODWORD(off_100024A30[4 * v10 + 3]) - 2) < 3;
          sub_100010A3C(a1, v10, v15, 1LL, a5, a6, a7, a8);
        }
      }

      else if (*((_BYTE *)v13 - 4))
      {
        bzero(buffer, 0x400uLL);
        sub_100011F3C(a1, v14, buffer, v16, v17, v18, v19, v20);
        sub_100010918(a1, v21, "[check_collection]%s(does_not_exist)", buffer);
      }

      unsigned int v22 = *v13;
      v13 += 2;
      unsigned int v10 = v22;
    }

    while (v22);
  }

  else
  {
    char v12 = 0;
    unsigned __int8 v11 = 0;
  }

  uint64_t v23 = 0LL;
  uint64_t v24 = a2 + 16;
  do
  {
    if (!*((_BYTE *)v38 + v23 + 1) && *(void *)(v24 + 8 * v23))
    {
      bzero(buffer, 0x400uLL);
      bzero(v36, 0x400uLL);
      sub_100011F3C(a1, (v23 + 1), buffer, v25, v26, v27, v28, v29);
      sub_100010B3C(*(const __CFString **)(v24 + 8 * v23), v36);
      sub_100010918(a1, v30, "[check_collection]%s=%s(exists_when_not_expected)", buffer, v36);
      sub_100010A3C(a1, (v23 + 1), 0LL, 1LL, v31, v32, v33, v34);
    }

    ++v23;
  }

  while (v23 != 47);
  if (v12) {
    sub_10000FC94(a1, 2, 1, 0, 262, "Old restore failure indication(s)", 0, 0, 0LL);
  }
  return v11;
}

void sub_100011EE8(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = *(const __CFString **)(a2 + 24);
  if (v3)
  {
    if (CFStringCompare(v3, @"upgrade", 0LL) == kCFCompareEqualTo) {
      sub_100010A3C(a1, 2LL, 1LL, 0LL, v4, v5, v6, v7);
    }
  }

char *sub_100011F3C( uint64_t a1, uint64_t a2, char *buffer, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2 >= 0x30)
  {
    ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): invalid variable ID=%d\n",  a2,  (uint64_t)buffer,  a4,  a5,  a6,  a7,  a8,  (char)"checkpoint_get_nvram_name");
    LODWORD(a2) = 0;
  }

  if (*(_DWORD *)(a1 + 88) == 1) {
    unsigned int v10 = &off_100024A30[4 * a2];
  }
  else {
    unsigned int v10 = &off_100024A30[4 * a2 + 1];
  }
  CFStringGetCString(*v10, buffer, 1024LL, 0x8000100u);
  return buffer;
}

void sub_100011FC4( _BYTE *a1, const __CFString *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (a1[100])
  {
    a1[104] = 1;
    a1[101] = 1;
    ramrod_log_msg("AP nonce will not be touched\n", (uint64_t)a2, a3, a4, a5, a6, a7, a8, a9);
  }

  else
  {
    bzero(v12, 0x400uLL);
    sub_100010B3C(a2, v12);
    sub_100010918((uint64_t)a1, v11, "[reboot_retry_chassis]outcome=%s(pre_existing_reboot_retry_disabled)", v12);
  }

void sub_100012098(const __CFString *a1)
{
}

void sub_100012158(uint64_t a1, int a2)
{
  uint64_t v7 = 0LL;
  uint64_t v3 = *(unsigned int *)(a1 + 92);
  else {
    uint64_t v4 = off_1000252E8[v3];
  }
  uint64_t v5 = *(unsigned int *)(a1 + 96);
  else {
    uint64_t v6 = off_1000252E8[v5];
  }
  asprintf(&v7, "%s (%s) -> (%s)", off_100025048[a2], v4, v6);
  if (v7)
  {
    sub_10000FC94(a1, 29, 1, 0, 260, v7, 0, 0, 0LL);
    if (v7) {
      free(v7);
    }
  }

uint64_t sub_10001221C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_BYTE *)(a1 + 104))
  {
    if (a2 > 0x2F)
    {
      ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): invalid variable ID=%d\n",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  (char)"checkpoint_nvram_adjust_id");
      LODWORD(a2) = 0;
      goto LABEL_7;
    }

    LODWORD(a2) = off_100024A30[4 * a2 + 2];
  }

  if (a2 < 0x30)
  {
LABEL_7:
    uint64_t v10 = a2;
    uint64_t v9 = HIDWORD(off_100024A30[4 * a2 + 2]);
    return ((uint64_t (*)(uint64_t, void))checkpoint_nvram_encoder[v9])( a1,  *(void *)(a1 + 16 * v10 + 1496));
  }

  uint64_t v9 = 0LL;
  uint64_t v10 = a2;
  return ((uint64_t (*)(uint64_t, void))checkpoint_nvram_encoder[v9])(a1, *(void *)(a1 + 16 * v10 + 1496));
}

void sub_1000122C0( uint64_t a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9 = a3;
  if (*(_BYTE *)(a1 + 104))
  {
    if (a2 > 0x2F)
    {
      ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): invalid variable ID=%d\n",  a2,  a3,  (uint64_t)a4,  a5,  a6,  a7,  a8,  (char)"checkpoint_nvram_adjust_id");
      uint64_t v11 = 0LL;
      goto LABEL_7;
    }

    a2 = LODWORD(off_100024A30[4 * a2 + 2]);
  }

  uint64_t v11 = a2;
LABEL_7:
  if (((0x20420400uLL >> v11) & 1) != 0)
  {
    a2 = *(void *)(a1 + 16 * v11 + 1496);
    if (a2) {
      goto LABEL_21;
    }
  }

  if (((0x1001100uLL >> v11) & 1) != 0)
  {
    uint64_t v12 = *(void *)(a1 + 16 * v11 + 1496);
    if (v12)
    {
      unint64_t v13 = 0LL;
      a2 = v12 - 16;
      do
      {
        int v15 = *(_DWORD *)(a2 + 16);
        a2 += 16LL;
        int v14 = v15;
        if (v15) {
          BOOL v16 = v13 >= 7;
        }
        else {
          BOOL v16 = 1;
        }
        ++v13;
      }

      while (!v16);
      if (!v14)
      {
LABEL_21:
        *(_DWORD *)a2 = v9;
        sub_10001278C(a1 + 1456, (char **)(a2 + 8), a4, (uint64_t)a4, a5, a6, a7, a8);
        *(_BYTE *)(a1 + 16 * v11 + 1492) = 1;
        return;
      }
    }
  }

LABEL_18:
  int v17 = *(_DWORD *)(a1 + 1476);
  if (!v17)
  {
    ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): {%s} tracking information lost on store [%s]\n",  a2,  a3,  (uint64_t)a4,  a5,  a6,  a7,  a8,  (char)"checkpoint_nvram_store_lost");
    int v17 = *(_DWORD *)(a1 + 1476);
  }

  *(_DWORD *)(a1 + 1476) = v17 + 1;
}

void sub_1000123FC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_BYTE *)(a1 + 104))
  {
    if (a2 > 0x2F)
    {
      ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): invalid variable ID=%d\n",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  (char)"checkpoint_nvram_adjust_id");
      uint64_t v10 = 0LL;
      goto LABEL_7;
    }

    a2 = LODWORD(off_100024A30[4 * a2 + 2]);
  }

  uint64_t v10 = a2;
LABEL_7:
  if (((0x3C03C0000uLL >> v10) & 1) != 0)
  {
    uint64_t v11 = a1 + 16 * v10;
    uint64_t v12 = *(uint64_t **)(v11 + 1496);
    if (v12)
    {
      *uint64_t v12 = a3;
      *(_BYTE *)(v11 + 1492) = 1;
      return;
    }
  }

void sub_1000124E0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a5;
  int v9 = a4;
  int v10 = a3;
  if (*(_BYTE *)(a1 + 104))
  {
    if (a2 > 0x2F)
    {
      ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): invalid variable ID=%d\n",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  (char)"checkpoint_nvram_adjust_id");
      uint64_t v12 = 0LL;
      goto LABEL_7;
    }

    a2 = LODWORD(off_100024A30[4 * a2 + 2]);
  }

  uint64_t v12 = a2;
LABEL_7:
  if (((0xA00A000uLL >> v12) & 1) != 0 && v9 <= 7)
  {
    int v14 = *(_DWORD **)(a1 + 16 * v12 + 1496);
    if (v14)
    {
      unint64_t v15 = 0LL;
      BOOL v16 = 0LL;
      int v17 = *(_DWORD **)(a1 + 16 * v12 + 1496);
      do
      {
        int v19 = *v17;
        v17 += 11;
        int v18 = v19;
        if (v19) {
          BOOL v20 = 1;
        }
        else {
          BOOL v20 = v10 == 0;
        }
        if (!v20) {
          BOOL v16 = v14;
        }
        BOOL v21 = v18 == v10 || v15++ >= 7;
        int v14 = v17;
      }

      while (!v21);
      if (v18 == v10) {
        BOOL v16 = v17 - 11;
      }
      if (v16)
      {
        *BOOL v16 = v10;
        v16[v9 + 1] = v8;
        *((_BYTE *)v16 + v9 + 36) = 1;
        *(_BYTE *)(a1 + 16 * v12 + 1492) = 1;
        return;
      }
    }
  }

LABEL_8:
  int v13 = *(_DWORD *)(a1 + 1476);
  if (!v13)
  {
    ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): {%s} tracking information lost on store [%s]\n",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  (char)"checkpoint_nvram_store_lost");
    int v13 = *(_DWORD *)(a1 + 1476);
  }

  *(_DWORD *)(a1 + 1476) = v13 + 1;
}

  int v13 = *(_DWORD *)(a1 + 1476);
  if (!v13)
  {
    ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): {%s} tracking information lost on store [%s]\n",  a2,  a3,  a4,  (uint64_t)a5,  a6,  a7,  a8,  (char)"checkpoint_nvram_store_lost");
    int v13 = *(_DWORD *)(a1 + 1476);
  }

  *(_DWORD *)(a1 + 1476) = v13 + 1;
}

void sub_100012630( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const char *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9 = a4;
  int v10 = a3;
  if (*(_BYTE *)(a1 + 104))
  {
    if (a2 > 0x2F)
    {
      ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): invalid variable ID=%d\n",  a2,  a3,  a4,  (uint64_t)a5,  a6,  a7,  a8,  (char)"checkpoint_nvram_adjust_id");
      uint64_t v12 = 0LL;
      goto LABEL_7;
    }

    a2 = LODWORD(off_100024A30[4 * a2 + 2]);
  }

  uint64_t v12 = a2;
LABEL_7:
  if (((0x14014000uLL >> v12) & 1) != 0 && v9 <= 7)
  {
    int v14 = *(_DWORD **)(a1 + 16 * v12 + 1496);
    if (v14)
    {
      unint64_t v15 = 0LL;
      BOOL v16 = 0LL;
      int v17 = *(_DWORD **)(a1 + 16 * v12 + 1496);
      do
      {
        int v19 = *v17;
        v17 += 18;
        int v18 = v19;
        if (v19) {
          BOOL v20 = 1;
        }
        else {
          BOOL v20 = v10 == 0;
        }
        if (!v20) {
          BOOL v16 = v14;
        }
        BOOL v21 = v18 == v10 || v15++ >= 7;
        int v14 = v17;
      }

      while (!v21);
      if (v18 == v10) {
        BOOL v16 = v17 - 18;
      }
      if (v16)
      {
        *BOOL v16 = v10;
        sub_10001278C(a1 + 1456, (char **)&v16[2 * v9 + 2], a5, a4, (uint64_t)a5, a6, a7, a8);
        *(_BYTE *)(a1 + 16 * v12 + 1492) = 1;
        return;
      }
    }
  }

void sub_10001278C( uint64_t a1, char **a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2)
  {
    if (*a2)
    {
      free(*a2);
      *a2 = 0LL;
    }

    if (a3) {
      asprintf(a2, "%s", a3);
    }
  }

  else
  {
    int v11 = *(_DWORD *)(a1 + 20);
    if (!v11)
    {
      ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): {%s} tracking information lost on store [%s]\n",  0LL,  (uint64_t)a3,  a4,  a5,  a6,  a7,  a8,  (char)"checkpoint_nvram_store_lost");
      int v11 = *(_DWORD *)(a1 + 20);
    }

    *(_DWORD *)(a1 + 20) = v11 + 1;
  }

char *sub_100012830( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = (char *)sub_10001221C(a1, a2, a3, a4, a5, a6, a7, a8);
  int v10 = 0LL;
  if (result)
  {
    int v9 = (const __CFString *)result;
    bzero(buffer, 0x400uLL);
    CFStringGetCString(v9, buffer, 1024LL, 0x8000100u);
    asprintf(&v10, "%s", buffer);
    CFRelease(v9);
    return v10;
  }

  return result;
}

char *sub_1000128DC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v11 = 0LL;
  if (*(_BYTE *)(a1 + 104))
  {
    if (a3 > 0x2F)
    {
      ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): invalid variable ID=%d\n",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  (char)"checkpoint_nvram_adjust_id");
      LODWORD(a3) = 0;
    }

    else
    {
      LODWORD(a3) = off_100024A30[4 * a3 + 2];
    }
  }

  int v9 = *(const __CFString **)(a2 + 8LL * a3 + 8);
  if (!v9) {
    return 0LL;
  }
  bzero(buffer, 0x400uLL);
  CFStringGetCString(v9, buffer, 1024LL, 0x8000100u);
  asprintf(&v11, "%s", buffer);
  return v11;
}

char *sub_1000129D0(char *a1, char a2, const __CFString *a3, _BYTE *a4)
{
  if (a3)
  {
    bzero(buffer, 0x400uLL);
    CFStringGetCString(a3, buffer, 1024LL, 0x8000100u);
    if (*a4) {
      int v14 = "|%s(%s)";
    }
    else {
      int v14 = "%s(%s)";
    }
    a1 = sub_100011798(a1, v14, v8, v9, v10, v11, v12, v13, a2);
    *a4 = 1;
  }

  return a1;
}

void sub_100012AA0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!*(_BYTE *)(a1 + 2274) && sub_10000F3A0(a1, 0, 0LL, a4, a5, a6, a7, a8))
  {
    uint64_t v9 = *(const __CFString **)(a1 + 992);
    if (!v9) {
      goto LABEL_23;
    }
    bzero(&v28[4], 0x3FCuLL);
    *(_DWORD *)(a1 + 2276) = 0;
    *(void *)(a1 + 2288) = 0LL;
    bzero(v30, 0x3FBuLL);
    strcpy(__s, "SIM_");
    size_t v10 = strlen(__s);
    CFStringGetCString(v9, &__s[v10], 1024 - v10, 0x8000100u);
    strcpy(v28, "SIM");
    size_t v11 = strlen(v28);
    CFStringGetCString(*(CFStringRef *)(a1 + 992), &v28[v11], 1024 - v11, 0x8000100u);
    uint64_t v12 = 0LL;
    while (1)
    {
      uint64_t v13 = off_1000250B8[v12];
      if (!strncasecmp(__s, v13, 0x400uLL))
      {
        *(_DWORD *)(a1 + 2276) = v12;
        goto LABEL_11;
      }

      if (!strncasecmp(v28, v13, 0x400uLL)) {
        break;
      }
      if (++v12 == 34)
      {
        LODWORD(v12) = *(_DWORD *)(a1 + 2276);
        goto LABEL_11;
      }
    }

    *(_DWORD *)(a1 + 2276) = v12;
    *(_BYTE *)(a1 + 2275) = 1;
LABEL_11:
    if (!(_DWORD)v12) {
      goto LABEL_23;
    }
    BOOL v20 = *(const __CFString **)(a1 + 1016);
    if (v20)
    {
      ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(kCFAllocatorDefault, v20, @",");
      *(void *)(a1 + 2288) = ArrayBySeparatingStrings;
      if (ArrayBySeparatingStrings)
      {
        CFIndex Count = CFArrayGetCount(ArrayBySeparatingStrings);
        if (Count >= 1)
        {
          CFIndex v23 = Count;
          for (CFIndex i = 0LL; i != v23; ++i)
          {
            ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 2288), i);
            CFStringGetCStringPtr(ValueAtIndex, 0x8000100u);
          }
        }

        uint64_t v26 = *(const __CFString **)(a1 + 1000);
        if (v26) {
          *(_DWORD *)(a1 + 2280) = CFStringGetIntValue(v26);
        }
        uint64_t v27 = *(const __CFString **)(a1 + 1008);
        if (v27) {
          *(_DWORD *)(a1 + 2284) = CFStringGetIntValue(v27);
        }
        goto LABEL_23;
      }
    }

    else
    {
      ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): simulator command without stepName\n",  0LL,  v14,  v15,  v16,  v17,  v18,  v19,  (char)"checkpoint_simulator_configure");
    }

    *(_DWORD *)(a1 + 2276) = 0;
LABEL_23:
    *(_BYTE *)(a1 + 2274) = 1;
  }

void *sub_100012CB8()
{
  uint64_t v5 = 0LL;
  io_object_t v0 = &v5;
  size_t v1 = 0x100000LL;
  do
  {
    CFStringRef v2 = malloc(v1);
    os_log_s *v0 = v2;
    if (v2)
    {
      bzero(v2, v1);
      io_object_t v0 = (void **)*v0;
    }

    else
    {
      v1 >>= 1;
    }
  }

  while ((int)v1 > 4095);
  uint64_t result = v5;
  if (v5)
  {
    do
    {
      uint64_t v4 = (void *)*result;
      free(result);
      uint64_t result = v4;
    }

    while (v4);
  }

  return result;
}

uint64_t ramrod_hardware_partition_supports_bics()
{
  return sub_100012D34((uint64_t)@"SupportsBurninMitigation");
}

uint64_t sub_100012D34(uint64_t a1)
{
  size_t v1 = (const __CFBoolean *)MGCopyAnswer(a1, 0LL);
  if (!v1) {
    return 0LL;
  }
  CFStringRef v2 = v1;
  CFTypeID v3 = CFGetTypeID(v1);
  if (v3 == CFBooleanGetTypeID()) {
    uint64_t Value = CFBooleanGetValue(v2);
  }
  else {
    uint64_t Value = 0LL;
  }
  CFRelease(v2);
  return Value;
}

uint64_t _ramrod_device_has_sandcat()
{
  if (qword_10002E520 != -1) {
    dispatch_once(&qword_10002E520, &stru_100025508);
  }
  return byte_10002E518;
}

void sub_100012DD8(id a1)
{
  io_registry_entry_t v1 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/arm-io/sep/iop-sep-nub/Sandcat");
  if (v1)
  {
    byte_10002E518 = 1;
    IOObjectRelease(v1);
  }

uint64_t ramrod_connect_to_ioservice(const char *a1, io_service_t *a2, io_connect_t *a3)
{
  char v5 = (char)a1;
  uint64_t v6 = IOServiceMatching(a1);
  if (v6)
  {
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v6);
    if (MatchingService)
    {
      io_service_t v22 = MatchingService;
      io_connect_t connect = 0;
      if (!IOServiceOpen(MatchingService, mach_task_self_, 0, &connect))
      {
        *a2 = v22;
        *a3 = connect;
        return 1LL;
      }

      ramrod_log_msg("IOServiceOpen failed for class '%s'\n", v23, v24, v25, v26, v27, v28, v29, v5);
    }

    else
    {
      ramrod_log_msg("IOServiceGetMatchingService failed\n", v15, v16, v17, v18, v19, v20, v21, v31);
    }
  }

  else
  {
    ramrod_log_msg("IOServiceMatching failed for %s\n", v7, v8, v9, v10, v11, v12, v13, v5);
  }

  return 0LL;
}

uint64_t ramrod_generate_apslot_copy_nonce(_DWORD *a1, CFDataRef *a2)
{
  size_t v35 = 4LL;
  *(void *)connection = 0LL;
  size_t v34 = 32LL;
  *(_OWORD *)bytes = 0u;
  __int128 v38 = 0u;
  if (!ramrod_connect_to_ioservice("AppleMobileApNonce", &connection[1], connection))
  {
    ramrod_log_msg( "Failed to connect to AppleMobileApNonce to generate AP nonce slot.\n",  v4,  v5,  v6,  v7,  v8,  v9,  v10,  outputStruct);
    goto LABEL_5;
  }

  mach_port_t v11 = connection[0];
  mach_error_t v12 = IOConnectCallMethod(connection[0], 0xC8u, 0LL, 0, 0LL, 0LL, 0LL, 0LL, bytes, &v34);
  if (v12)
  {
    mach_error_string(v12);
    ramrod_log_msg( "IOConnectCallMethod(%s,%u) failed: %s\n",  v13,  v14,  v15,  v16,  v17,  v18,  v19,  (char)"AppleMobileApNonce");
LABEL_5:
    uint64_t v20 = 0LL;
    goto LABEL_6;
  }

  uint64_t v20 = (int *)calloc(1uLL, 4uLL);
  mach_error_t v25 = IOConnectCallMethod(v11, 0xCBu, 0LL, 0, 0LL, 0LL, 0LL, 0LL, v20, &v35);
  if (v25)
  {
    mach_error_string(v25);
    ramrod_log_msg( "IOConnectCallMethod(%s,%u) failed: %s\n",  v26,  v27,  v28,  v29,  v30,  v31,  v32,  (char)"AppleMobileApNonce");
LABEL_6:
    int v21 = 0;
    CFDataRef v22 = 0LL;
    uint64_t v23 = 0LL;
    if (!a1) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }

  int v21 = *v20;
  CFDataRef v22 = CFDataCreate(kCFAllocatorDefault, bytes, 32LL);
  uint64_t v23 = 1LL;
  if (a1) {
LABEL_7:
  }
    *a1 = v21;
LABEL_8:
  if (a2)
  {
    *a2 = v22;
  }

  else if (v22)
  {
    CFRelease(v22);
  }

  if (v20) {
    free(v20);
  }
  if (connection[1]) {
    IOObjectRelease(connection[1]);
  }
  if (connection[0]) {
    IOObjectRelease(connection[0]);
  }
  return v23;
}

uint64_t ramrod_generate_sepslot_copy_nonce(_DWORD *a1, CFDataRef *a2)
{
  *(void *)bytes = 0LL;
  uint64_t v30 = 0LL;
  int v31 = 0;
  CFIndex length = 20LL;
  *(void *)connection = 0LL;
  uint64_t output = 0LL;
  uint32_t outputCnt = 1;
  if (ramrod_connect_to_ioservice("AppleSEPManager", &connection[1], connection))
  {
    io_object_t v11 = connection[0];
    mach_error_t v12 = IOConnectCallMethod(connection[0], 0x53u, 0LL, 0, 0LL, 0LL, &output, &outputCnt, bytes, (size_t *)&length);
    if (v12)
    {
      mach_error_string(v12);
      ramrod_log_msg( "IOConnectCallMethod(%s,%u) failed: %s\n",  v13,  v14,  v15,  v16,  v17,  v18,  v19,  (char)"AppleSEPManager");
      uint64_t v20 = 0LL;
      int v21 = 0;
      CFDataRef v22 = 0LL;
    }

    else
    {
      int v21 = output;
      CFDataRef v22 = CFDataCreate(kCFAllocatorDefault, bytes, length);
      uint64_t v20 = 1LL;
    }

    if (connection[1]) {
      IOObjectRelease(connection[1]);
    }
    if (v11) {
      IOObjectRelease(v11);
    }
    if (a1) {
      *a1 = v21;
    }
    if (a2)
    {
      *a2 = v22;
    }

    else if (v22)
    {
      CFRelease(v22);
    }
  }

  else
  {
    ramrod_log_msg( "Failed to connect to AppleSEPManager to generate sep nonce.\n",  v4,  v5,  v6,  v7,  v8,  v9,  v10,  outputStruct);
    return 0LL;
  }

  return v20;
}

uint64_t ramrod_should_do_legacy_restored_behaviors()
{
  return 0LL;
}

uint64_t ramrod_should_do_legacy_restored_internal_behaviors()
{
  return 0LL;
}

void ramrod_create_error_cf( CFErrorRef *a1, const __CFString *a2, CFIndex a3, const void *a4, const __CFString *a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
}

void sub_100013254( CFErrorRef *a1, const __CFString *a2, CFIndex a3, const void *a4, const __CFString *a5, va_list a6)
{
  if (a1)
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    if (Mutable)
    {
      uint64_t v13 = Mutable;
      CFStringRef v14 = CFStringCreateWithFormatAndArguments(kCFAllocatorDefault, 0LL, a5, a6);
      if (v14)
      {
        CFStringRef v15 = v14;
        CFDictionaryAddValue(v13, kCFErrorDescriptionKey, v14);
        CFRelease(v15);
      }

      if (a4) {
        CFDictionaryAddValue(v13, kCFErrorUnderlyingErrorKey, a4);
      }
      *a1 = CFErrorCreate(kCFAllocatorDefault, a2, a3, v13);
      CFRelease(v13);
    }
  }

uint64_t ramrod_copy_updater_functions( void *a1, const char *a2, __CFDictionary *(***a3)(const __CFDictionary *a1, uint64_t a2, uint64_t a3, CFErrorRef *a4), CFErrorRef *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a2 || !a3)
  {
    ramrod_create_error_cf( a4,  @"RamrodErrorDomain",  3LL,  0LL,  @"%s: invalid parameters",  a6,  a7,  a8,  (char)"ramrod_copy_updater_functions");
    return 0LL;
  }

  *a3 = 0LL;
  mach_error_t v12 = (__CFDictionary *(**)(const __CFDictionary *, uint64_t, uint64_t, CFErrorRef *))malloc(0x18uLL);
  if (!v12)
  {
    ramrod_create_error_cf( a4,  @"RamrodErrorDomain",  6LL,  0LL,  @"%s: failed to allocate tmp update_functions struct",  v13,  v14,  v15,  (char)"ramrod_copy_updater_functions");
    return 0LL;
  }

  uint64_t v16 = v12;
  *mach_error_t v12 = 0LL;
  v12[1] = 0LL;
  void v12[2] = 0LL;
  if (!strcmp(a2, "Canary"))
  {
    *uint64_t v16 = sub_1000135EC;
    v16[1] = (__CFDictionary *(*)(const __CFDictionary *, uint64_t, uint64_t, CFErrorRef *))sub_1000136FC;
    void v16[2] = (__CFDictionary *(*)(const __CFDictionary *, uint64_t, uint64_t, CFErrorRef *))sub_100013720;
  }

  else
  {
    int v21 = (__CFDictionary *(*)(const __CFDictionary *, uint64_t, uint64_t, CFErrorRef *))sub_1000134CC( a1,  (uint64_t)a2,  (uint64_t)"UpdaterCreate",  a4,  v17,  v18,  v19,  v20);
    *uint64_t v16 = v21;
    if (!v21
      || (uint64_t v26 = (__CFDictionary *(*)(const __CFDictionary *, uint64_t, uint64_t, CFErrorRef *))sub_1000134CC(a1, (uint64_t)a2, (uint64_t)"UpdaterIsDone", a4, v22, v23, v24, v25),
          (v16[1] = v26) == 0LL)
      || (int v31 = (__CFDictionary *(*)(const __CFDictionary *, uint64_t, uint64_t, CFErrorRef *))sub_1000134CC(a1, (uint64_t)a2, (uint64_t)"UpdaterExecCommand", a4, v27, v28, v29, v30),
          (void v16[2] = v31) == 0LL))
    {
      free(v16);
      return 0LL;
    }
  }

  *a3 = v16;
  return 1LL;
}

void *sub_1000134CC( void *a1, uint64_t a2, uint64_t a3, CFErrorRef *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1 && a3)
  {
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    *(_OWORD *)__symbol = 0u;
    __int128 v16 = 0u;
    __strlcpy_chk(__symbol, a2, 128LL, 128LL);
    __strlcat_chk(__symbol, a3, 128LL, 128LL);
    uint64_t result = dlsym(a1, __symbol);
    if (result) {
      return result;
    }
    dlerror();
    ramrod_create_error_cf( a4,  @"RamrodErrorDomain",  1012LL,  0LL,  @"%s: unable to find %s: %s",  v12,  v13,  v14,  (char)"load_function");
  }

  else
  {
    ramrod_create_error_cf( a4,  @"RamrodErrorDomain",  3LL,  0LL,  @"%s: invalid parameters",  a6,  a7,  a8,  (char)"load_function");
  }

  return 0LL;
}

__CFDictionary *sub_1000135EC(const __CFDictionary *a1, uint64_t a2, uint64_t a3, CFErrorRef *a4)
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  if (Mutable)
  {
    if (a1)
    {
      uint64_t Value = CFDictionaryGetValue(a1, @"Options");
      if (Value) {
        CFDictionarySetValue(Mutable, @"Options", Value);
      }
    }

    CFDictionarySetValue(Mutable, @"IsDone", kCFBooleanFalse);
    CFDictionarySetValue(Mutable, @"Loop0", kCFBooleanTrue);
    CFDictionarySetValue(Mutable, @"QueryLoop0", kCFBooleanTrue);
  }

  else
  {
    ramrod_create_error_cf( a4,  @"RamrodErrorDomain",  6LL,  0LL,  @"%s: state allocation failed",  v6,  v7,  v8,  (char)"_CanaryUpdaterCreate");
  }

  return Mutable;
}

CFDictionaryRef sub_1000136FC(const __CFDictionary *result)
{
  if (result)
  {
    uint64_t Value = (const __CFBoolean *)CFDictionaryGetValue(result, @"IsDone");
    return (const __CFDictionary *)CFBooleanGetValue(Value);
  }

  return result;
}

uint64_t sub_100013720( const __CFDictionary *a1, CFStringRef theString1, uint64_t a3, CFMutableDictionaryRef *a4, CFErrorRef *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1)
  {
    uint64_t v12 = @"%s: state is NULL";
    goto LABEL_7;
  }

  if (!theString1)
  {
    uint64_t v12 = @"%s: command is NULL";
    goto LABEL_7;
  }

  if (!a4)
  {
    uint64_t v12 = @"%s: output is NULL";
    goto LABEL_7;
  }

  if (CFStringCompare(theString1, @"queryInfo", 0LL))
  {
    if (CFStringCompare(theString1, @"performNextStage", 0LL))
    {
      uint64_t v12 = @"%s: %@ invalid command";
LABEL_7:
      ramrod_create_error_cf(a5, @"RamrodErrorDomain", 3LL, 0LL, v12, a6, a7, a8, (char)"_CanaryUpdaterExecCmd");
      return 0LL;
    }

    uint64_t Value = CFDictionaryGetValue(a1, @"Loop0");
    AMSupportLogInternal(6LL, "_CanaryUpdaterExecCmd", "PerformNextStage Running, Loop0=%@.", Value);
    if (CFDictionaryGetValue(a1, @"Loop0") == kCFBooleanFalse) {
      CFDictionarySetValue(a1, @"IsDone", kCFBooleanTrue);
    }
    __int128 v21 = @"Loop0";
    __int128 v22 = a1;
    CFBooleanRef v23 = kCFBooleanFalse;
  }

  else
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    *a4 = Mutable;
    if (!Mutable)
    {
      ramrod_create_error_cf( a5,  @"RamrodErrorDomain",  6LL,  0LL,  @"%s: *output allocation failed",  v15,  v16,  v17,  (char)"_CanaryUpdaterExecCmd");
      return 0LL;
    }

    __int128 v18 = CFDictionaryGetValue(a1, @"QueryLoop0");
    AMSupportLogInternal(6LL, "_CanaryUpdaterExecCmd", "QueryInfo Running, Loop0=%@.", v18);
    CFDictionarySetValue(*a4, @"ECID", @"1234567890");
    __int128 v19 = *a4;
    __int128 v20 = CFDictionaryGetValue(a1, @"QueryLoop0");
    CFDictionarySetValue(v19, @"QueryLoop0", v20);
    CFDictionarySetValue(*a4, @"LocalSigningID", kCFBooleanTrue);
    if (CFDictionaryGetValue(a1, @"QueryLoop0") == kCFBooleanFalse) {
      CFDictionarySetValue(a1, @"IsDone", kCFBooleanTrue);
    }
    __int128 v21 = @"QueryLoop0";
    __int128 v22 = a1;
    CFBooleanRef v23 = kCFBooleanFalse;
  }

  CFDictionarySetValue(v22, v21, v23);
  return 1LL;
}

uint64_t ramrod_update_nvram_overrides( const char *a1, __CFDictionary *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a2)
  {
    uint64_t v32 = "options is NULL\n";
LABEL_21:
    ramrod_log_msg(v32, (uint64_t)a2, a3, a4, a5, a6, a7, a8, v33);
    io_object_t v11 = 0LL;
    uint64_t v12 = 0LL;
    goto LABEL_7;
  }

  if (!a1)
  {
    uint64_t v32 = "updaterName is NULL\n";
    goto LABEL_21;
  }

  char CStringPtr = CFStringGetCStringPtr(@"T200", 0x8000100u);
  if (!strcmp(a1, CStringPtr))
  {
    io_object_t v11 = (const __CFData *)ramrod_copy_NVRAM_variable_from_devicetree(@"VeridianForceUpdate");
    if (v11)
    {
      CFStringRef v15 = CFStringCreateFromExternalRepresentation(kCFAllocatorDefault, v11, 0x8000100u);
      uint64_t v12 = v15;
      if (v15)
      {
        CFTypeID v16 = CFGetTypeID(v15);
        if (v16 == CFStringGetTypeID() && CFStringCompare(v12, @"yes", 1uLL) == kCFCompareEqualTo)
        {
          ramrod_log_msg( "Setting %s=false due to nvram variable %s=yes\n",  v17,  v18,  v19,  v20,  v21,  v22,  v23,  (char)"SkipSameVersion");
          CFDictionarySetValue(a2, @"SkipSameVersion", kCFBooleanFalse);
          CFDictionarySetValue(a2, @"RestoreInternal", kCFBooleanTrue);
        }
      }

      goto LABEL_6;
    }
  }

  else
  {
    io_object_t v11 = 0LL;
  }

  uint64_t v12 = 0LL;
LABEL_6:
  uint64_t v13 = CFStringGetCStringPtr(@"AppleTCON", 0x8000100u);
  if (!strcmp(a1, v13))
  {
    io_object_t v11 = (const __CFData *)ramrod_copy_NVRAM_variable_from_devicetree(@"AppleTCONForceUpdate");
    if (v11) {
      uint64_t v12 = CFStringCreateFromExternalRepresentation(kCFAllocatorDefault, v11, 0x8000100u);
    }
    if (v12)
    {
      CFTypeID v24 = CFGetTypeID(v12);
      if (v24 == CFStringGetTypeID() && CFStringCompare(v12, @"yes", 1uLL) == kCFCompareEqualTo)
      {
        ramrod_log_msg( "Setting %s=false due to nvram variable %s=yes\n",  v25,  v26,  v27,  v28,  v29,  v30,  v31,  (char)"SkipSameVersion");
        CFDictionarySetValue(a2, @"SkipSameVersion", kCFBooleanFalse);
        CFDictionarySetValue(a2, @"RestoreInternal", kCFBooleanTrue);
      }
    }
  }

LABEL_7:
  AMSupportSafeRelease(v12);
  return AMSupportSafeRelease(v11);
}

__CFString **sub_100013C2C(const __CFString *a1)
{
  if (a1)
  {
    uint64_t v2 = 0LL;
    CFTypeID v3 = "Updater entry is NULL, defaulting to TRUE";
    while (1)
    {
      uint64_t v4 = off_10002E348[v2];
      if (!v4) {
        break;
      }
      if (CFStringCompare(a1, v4, 0LL) == kCFCompareEqualTo) {
        return &off_10002E348[v2];
      }
      v2 += 6LL;
      if (v2 == 36) {
        return 0LL;
      }
    }
  }

  else
  {
    CFTypeID v3 = "updaterName is NULL";
  }

  AMSupportLogInternal(3LL, "_updater_named", v3);
  return 0LL;
}

__CFString *ramrod_update_get_dylib(const __CFString *a1)
{
  if (a1)
  {
    uint64_t v2 = sub_100013C2C(a1);
    if (v2) {
      return v2[3];
    }
    AMSupportLogInternal(3LL, "ramrod_update_get_dylib", "updaterName %@ not found", a1);
  }

  else
  {
    AMSupportLogInternal(3LL, "ramrod_update_get_dylib", "updaterName is NULL");
  }

  return 0LL;
}

CFDictionaryRef ramrod_update_copy_ap_parameters_generating_nonces(CFDictionaryRef theDict)
{
  if (theDict) {
    MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0LL, theDict);
  }
  else {
    MutableCopy = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  }
  uint64_t v9 = MutableCopy;
  if (MutableCopy)
  {
    CFDictionarySetValue(MutableCopy, @"GenerateNonces", kCFBooleanTrue);
    CFDictionaryRef updated = ramrod_update_copy_ap_parameters(v9);
    CFRelease(v9);
    return updated;
  }

  else
  {
    ramrod_log_msg("Failed to allocate ap options dictionary.\n", v2, v3, v4, v5, v6, v7, v8, v12);
    return 0LL;
  }

CFDictionaryRef ramrod_update_copy_ap_parameters(const __CFDictionary *a1)
{
  int BOOLean_option = get_BOOLean_option(a1, @"GenerateNonces", 0LL);
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  if (!Mutable)
  {
    AMSupportLogInternal(3LL, "ramrod_update_copy_ap_parameters", "apParameters failed to allocate");
    CFNumberRef v30 = 0LL;
    CFDictionaryRef Copy = 0LL;
    goto LABEL_29;
  }

  io_registry_entry_t v3 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/chosen");
  if (v3)
  {
    io_object_t v11 = v3;
    CFTypeRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v3, @"esdm-fuses", kCFAllocatorDefault, 0);
    if (CFProperty)
    {
      uint64_t v20 = CFProperty;
      CFTypeID v21 = CFGetTypeID(CFProperty);
      if (v21 == CFDataGetTypeID())
      {
        BytePtr = CFDataGetBytePtr(v20);
        CFNumberRef v30 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, BytePtr);
        if (v30) {
          goto LABEL_12;
        }
        uint64_t v31 = "could not create CFNumber for esdm-fuses\n";
      }

      else
      {
        uint64_t v31 = "esdm-fuses property is not a CFData\n";
      }

      ramrod_log_msg(v31, v22, v23, v24, v25, v26, v27, v28, v52);
      CFNumberRef v30 = 0LL;
LABEL_12:
      CFRelease(v20);
      IOObjectRelease(v11);
      if (v30) {
        CFDictionarySetValue(Mutable, kAMAuthInstallApParameterSiKA, v30);
      }
      goto LABEL_14;
    }

    ramrod_log_msg("unable to lookup esdm-fuses property\n", v13, v14, v15, v16, v17, v18, v19, v52);
    IOObjectRelease(v11);
  }

  else
  {
    ramrod_log_msg("unable to find 'chosen' registry entry\n", v4, v5, v6, v7, v8, v9, v10, v52);
  }

  CFNumberRef v30 = 0LL;
LABEL_14:
  if (BOOLean_option && _ramrod_device_has_sandcat())
  {
    int v55 = 2;
    int valuePtr = 0;
    CFTypeRef cf = 0LL;
    value = 0LL;
    if (ramrod_generate_apslot_copy_nonce(&valuePtr, (CFDataRef *)&value))
    {
      CFNumberRef v39 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
      if (v39)
      {
        CFNumberRef v40 = v39;
        CFDictionarySetValue(Mutable, kAMAuthInstallApParameterApNonceSlotID, v39);
        CFRelease(v40);
      }

      if (value)
      {
        CFDictionarySetValue(Mutable, kAMAuthInstallApParameterApNonce, value);
        CFRelease(value);
      }
    }

    else
    {
      ramrod_log_msg("unable to read the AP slot id will not set.\n", v32, v33, v34, v35, v36, v37, v38, v52);
    }

    if (ramrod_generate_sepslot_copy_nonce(&v55, (CFDataRef *)&cf))
    {
      CFNumberRef v48 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &v55);
      if (v48)
      {
        CFNumberRef v49 = v48;
        CFDictionarySetValue(Mutable, kAMAuthInstallApParameterSepNonceSlotID, v48);
        CFRelease(v49);
      }

      if (cf)
      {
        CFDictionarySetValue(Mutable, kAMAuthInstallApParameterSepNonce, cf);
        CFRelease(cf);
      }
    }

    else
    {
      ramrod_log_msg("unable to read the SEP slot id will not set.\n", v41, v42, v43, v44, v45, v46, v47, v52);
    }
  }

  CFDictionaryRef Copy = CFDictionaryCreateCopy(kCFAllocatorDefault, Mutable);
LABEL_29:
  AMSupportSafeRelease(Mutable);
  AMSupportSafeRelease(v30);
  return Copy;
}

__CFDictionary *ramrod_update_copy_deviceinfo_with_options(const __CFDictionary *a1, CFErrorRef *a2)
{
  char v129 = 0LL;
  v130[0] = 0LL;
  char v128 = 0LL;
  sub_1000160C8();
  CFTypeRef cf = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  if (!cf)
  {
    ramrod_create_error_cf( a2,  @"RamrodErrorDomain",  6LL,  0LL,  @"%s: Failed to allocate outDict",  v3,  v4,  v5,  (char)"ramrod_update_copy_deviceinfo_with_options");
    CFMutableDictionaryRef Mutable = 0LL;
LABEL_150:
    CFMutableDictionaryRef v13 = 0LL;
LABEL_152:
    CFMutableDictionaryRef v17 = 0LL;
LABEL_156:
    v126 = 0LL;
LABEL_157:
    theDict = 0LL;
    CFDictionaryRef v113 = 0LL;
    MutableCFDictionaryRef Copy = 0LL;
    CFDictionaryRef updated = 0LL;
LABEL_158:
    CFNumberRef v30 = 0LL;
    CFMutableArrayRef v29 = 0LL;
    uint64_t v28 = 0LL;
    char v101 = 1;
    goto LABEL_140;
  }

  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  if (!Mutable)
  {
    ramrod_create_error_cf( a2,  @"RamrodErrorDomain",  6LL,  0LL,  @"%s: Failed to allocate deviceInfo",  v6,  v7,  v8,  (char)"ramrod_update_copy_deviceinfo_with_options");
    goto LABEL_150;
  }

  CFMutableDictionaryRef v13 = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  if (!v13)
  {
    ramrod_create_error_cf( a2,  @"RamrodErrorDomain",  6LL,  0LL,  @"%s: Failed to allocate disabledInfo",  v10,  v11,  v12,  (char)"ramrod_update_copy_deviceinfo_with_options");
    goto LABEL_152;
  }

  CFMutableDictionaryRef v17 = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  if (!v17)
  {
    ramrod_create_error_cf( a2,  @"RamrodErrorDomain",  6LL,  0LL,  @"%s: Failed to allocate checkpointDict",  v14,  v15,  v16,  (char)"ramrod_update_copy_deviceinfo_with_options");
    goto LABEL_156;
  }

  if (!a1)
  {
    ramrod_create_error_cf( a2,  @"RamrodErrorDomain",  2LL,  0LL,  @"%s: options is NULL",  v14,  v15,  v16,  (char)"ramrod_update_copy_deviceinfo_with_options");
    goto LABEL_156;
  }

  v126 = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  if (!v126)
  {
    AMSupportLogInternal(4LL, "ramrod_update_copy_deviceinfo_with_options", "updaterOptions failed to allocate");
    goto LABEL_156;
  }

  theDict = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  if (!theDict)
  {
    AMSupportLogInternal(4LL, "ramrod_update_copy_deviceinfo_with_options", "subOptions failed to allocate");
    goto LABEL_157;
  }

  uint64_t v18 = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  CFDictionaryRef updated = v18;
  if (!v18)
  {
    AMSupportLogInternal(4LL, "ramrod_update_copy_deviceinfo_with_options", "restoreOptions failed to allocate");
    CFDictionaryRef v113 = 0LL;
    MutableCFDictionaryRef Copy = 0LL;
    goto LABEL_158;
  }

  CFDictionarySetValue(v18, @"CreateFilesystemPartitions", kCFBooleanFalse);
  CFDictionaryRef v113 = updated;
  CFDictionarySetValue(v126, @"RestoreOptions", updated);
  if (CFDictionaryContainsKey(a1, @"PreflightRequired"))
  {
    uint64_t Value = CFDictionaryGetValue(a1, @"PreflightRequired");
    CFDictionarySetValue(theDict, @"PreflightRequired", Value);
  }

  CFMutableDictionaryRef v118 = v17;
  CFMutableDictionaryRef v114 = v13;
  if (CFDictionaryContainsKey(a1, @"BootedUpdate"))
  {
    CFBooleanRef v21 = (CFBooleanRef)CFDictionaryGetValue(a1, @"BootedUpdate");
    CFDictionarySetValue(theDict, @"BootedUpdate", v21);
    BOOL v120 = v21 == kCFBooleanTrue;
  }

  else
  {
    BOOL v120 = 0;
  }

  uint64_t v115 = Mutable;
  uint64_t v127 = a1;
  if (CFDictionaryContainsKey(a1, @"PreflightContext"))
  {
    uint64_t v25 = (const __CFString *)CFDictionaryGetValue(a1, @"PreflightContext");
    CFDictionarySetValue(theDict, @"PreflightContext", v25);
    BOOL v26 = CFStringCompare(v25, @"Limited", 0LL) != kCFCompareEqualTo;
  }

  else
  {
    BOOL v26 = 1;
  }

  uint64_t v27 = 0LL;
  uint64_t v28 = 0LL;
  CFMutableArrayRef v29 = 0LL;
  CFNumberRef v30 = 0LL;
  MutableCFDictionaryRef Copy = 0LL;
  if (v120) {
    BOOL v26 = 1;
  }
  BOOL v125 = v26;
  uint64_t v32 = "ramrod_update_copy_deviceinfo_with_options";
  while (1)
  {
    if (v28) {
      CFRelease(v28);
    }
    if (v129)
    {
      CFRelease(v129);
      char v129 = 0LL;
    }

    if (v29) {
      CFRelease(v29);
    }
    if (v30) {
      CFRelease(v30);
    }
    if (v130[0])
    {
      CFRelease(v130[0]);
      v130[0] = 0LL;
    }

    if (MutableCopy) {
      CFRelease(MutableCopy);
    }
    if (v128)
    {
      free(v128);
      char v128 = 0LL;
    }

    uint64_t v33 = (CFStringRef *)&off_10002E348[6 * v27];
    if (!*v33)
    {
      ramrod_create_error_cf( a2,  @"RamrodErrorDomain",  6LL,  v130[0],  @"%s: Updater Name is NULL at index %d",  v22,  v23,  v24,  (char)v32);
LABEL_129:
      MutableCFDictionaryRef Copy = 0LL;
LABEL_131:
      CFDictionaryRef updated = 0LL;
      CFNumberRef v30 = 0LL;
      CFMutableArrayRef v29 = 0LL;
      goto LABEL_137;
    }

    uint64_t v34 = v27 + 1;
    AMSupportLogInternal(6LL, v32, "Preflight loop %d for updater %@..", v27 + 1, *v33);
    uint64_t v35 = *v33;
    if (!*v33) {
      break;
    }
    uint64_t v36 = (const __CFArray *)CFDictionaryGetValue(v127, @"SkipUpdaters");
    if (!v36) {
      break;
    }
    uint64_t v37 = v36;
    if (CFArrayGetCount(v36) < 1) {
      break;
    }
    CFIndex v38 = 0LL;
    while (1)
    {
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v37, v38);
      if (ValueAtIndex)
      {
        CFNumberRef v40 = ValueAtIndex;
        CFTypeID v41 = CFGetTypeID(ValueAtIndex);
        if (v41 == CFStringGetTypeID() && CFStringCompare(v35, v40, 0LL) == kCFCompareEqualTo) {
          break;
        }
      }

      if (++v38 >= CFArrayGetCount(v37)) {
        goto LABEL_43;
      }
    }

    AMSupportLogInternal(6LL, v32, "Skipping updater %@", *v33);
    MutableCFDictionaryRef Copy = 0LL;
    CFNumberRef v30 = 0LL;
    CFMutableArrayRef v29 = 0LL;
    uint64_t v28 = 0LL;
LABEL_71:
    uint64_t v27 = v34;
    if (v34 == 6)
    {
      CFDictionaryRef updated = ramrod_update_copy_ap_parameters(v127);
      CFMutableDictionaryRef Mutable = v115;
      CFDictionaryAddValue(cf, @"DeviceInfo", v115);
      CFMutableDictionaryRef v13 = v114;
      CFDictionaryAddValue(cf, @"DeviceInfoDisabled", v114);
      CFMutableDictionaryRef v17 = v118;
      CFDictionaryAddValue(cf, @"DeviceInfoFailures", v118);
      CFDictionaryAddValue(cf, @"ApParameters", updated);
      char v101 = 0;
      goto LABEL_140;
    }
  }

LABEL_43:
  uint64_t v42 = v32;
  uint64_t v43 = &off_10002E348[6 * v27];
  uint64_t v46 = v43[2];
  uint64_t v45 = v43 + 2;
  uint64_t v44 = v46;
  if (!v46) {
    goto LABEL_55;
  }
  if (v125)
  {
    uint64_t v47 = kCFAllocatorDefault;
    goto LABEL_49;
  }

  uint64_t v47 = kCFAllocatorDefault;
  if (((unsigned int (*)(uint64_t))v44)(1LL))
  {
    char v48 = 0;
    goto LABEL_51;
  }

  uint64_t v44 = *v45;
LABEL_49:
  if (!((unsigned int (*)(BOOL))v44)(v120))
  {
LABEL_55:
    uint64_t v32 = v42;
    AMSupportLogInternal(6LL, v42, "Updater %@ not supported on this device..", *v33);
    MutableCFDictionaryRef Copy = 0LL;
    CFNumberRef v30 = 0LL;
    CFMutableArrayRef v29 = 0LL;
    goto LABEL_70;
  }

  char v48 = 1;
LABEL_51:
  char CStringPtr = CFStringGetCStringPtr(*v33, 0x8000100u);
  if (!CStringPtr)
  {
    ramrod_create_error_cf( a2,  @"RamrodErrorDomain",  6LL,  v130[0],  @"%s: failed convert updaterName %@",  v50,  v51,  v52,  (char)v42);
    goto LABEL_129;
  }

  uint64_t v53 = CStringPtr;
  MutableCFDictionaryRef Copy = CFDictionaryCreateMutableCopy(v47, 0LL, theDict);
  if (!MutableCopy)
  {
    ramrod_create_error_cf( a2,  @"RamrodErrorDomain",  6LL,  v130[0],  @"%s: Failed to copy subOptions for %s",  v54,  v55,  v56,  (char)v42);
    goto LABEL_131;
  }

  CFDictionarySetValue(v126, @"Options", MutableCopy);
  ramrod_update_nvram_overrides(v53, MutableCopy, v57, v58, v59, v60, v61, v62);
  if (AMAuthInstallUpdaterTwoStageEnabled(*v33))
  {
    ramrod_log_msg( "%s Updater configured for two-stage update. DeferredCommit: YES.\n",  v63,  v64,  v65,  v66,  v67,  v68,  v69,  (char)v53);
    CFDictionarySetValue(MutableCopy, @"DeferredCommit", kCFBooleanTrue);
  }

  else
  {
    ramrod_log_msg("%s Updater: Legacy / single-stage updater.\n", v63, v64, v65, v66, v67, v68, v69, (char)v53);
  }

  if (BYTE4(off_10002E348[6 * v27 + 4]))
  {
    CFMutableArrayRef v29 = CFArrayCreateMutable(v47, 0LL, &kCFTypeArrayCallBacks);
    if (v29)
    {
      if ((v48 & 1) == 0) {
        goto LABEL_60;
      }
      goto LABEL_61;
    }

    ramrod_create_error_cf( a2,  @"RamrodErrorDomain",  6LL,  v130[0],  @"%s: Failed to create queryResults array for %s",  v70,  v71,  v72,  (char)v42);
LABEL_136:
    CFDictionaryRef updated = 0LL;
    CFNumberRef v30 = 0LL;
LABEL_137:
    uint64_t v28 = 0LL;
LABEL_138:
    char v101 = 1;
    CFMutableDictionaryRef Mutable = v115;
    goto LABEL_139;
  }

  CFMutableArrayRef v29 = 0LL;
  if ((v48 & 1) == 0)
  {
LABEL_60:
    AMSupportLogInternal(6LL, v42, "overriding updater context to BootedOS for %sUpdater", v53);
    CFDictionarySetValue(MutableCopy, @"PreflightContext", @"BootedOS");
  }

LABEL_61:
  uint64_t v73 = dlopen((const char *)off_10002E348[6 * v27 + 3], 261);
  if (!v73)
  {
    dlerror();
    uint64_t v32 = v42;
    AMSupportLogInternal(6LL, v42, "Failed to open updater library on device that should have %s: %s");
LABEL_69:
    CFNumberRef v30 = 0LL;
LABEL_70:
    uint64_t v28 = 0LL;
    goto LABEL_71;
  }

  if (!ramrod_copy_updater_functions(v73, v53, &v128, a2, v74, v75, v76, v77))
  {
    AMSupportLogInternal( 3LL,  "ramrod_update_copy_deviceinfo_with_options",  "ramrod_copy_updater_functions failed on %s");
    goto LABEL_136;
  }

  uint64_t v32 = v42;
  int v78 = ((uint64_t (*)(void, const void **))v128[1])(0LL, v130);
  if (v130[0])
  {
    AMSupportLogInternal( 3LL,  "ramrod_update_copy_deviceinfo_with_options",  "%sUpdater fp_isDone returned error: %@",  v53,  v130[0]);
    goto LABEL_136;
  }

  if (v78)
  {
    AMSupportLogInternal(6LL, v42, "Updater %s returned isDone(NULL)=true (ie: module should skip), continuing.");
    goto LABEL_69;
  }

  AMSupportLogInternal(6LL, v42, "creating %sUpdater obj", v53);
  uint64_t v79 = (*v128)(v126, (uint64_t)sub_100014EE4, (uint64_t)v53, (CFErrorRef *)v130);
  uint64_t v28 = v79;
  if (!v79)
  {
    AMSupportLogInternal(3LL, v42, "fp_create failed on %s. error=%@", v53, v130[0]);
    ramrod_create_error_cf( a2,  @"RamrodErrorDomain",  1013LL,  v130[0],  @"%s: Preflight Create failed on %s",  v105,  v106,  v107,  (char)v42);
LABEL_126:
    CFDictionaryRef updated = 0LL;
    CFNumberRef v30 = 0LL;
    goto LABEL_138;
  }

  int v80 = ((uint64_t (*)(__CFDictionary *, const void **))v128[1])(v79, v130);
  if (v130[0])
  {
    AMSupportLogInternal( 3LL,  "ramrod_update_copy_deviceinfo_with_options",  "%sUpdater fp_isDone returned error: %@",  v53,  v130[0]);
    goto LABEL_126;
  }

  if (v80)
  {
    AMSupportLogInternal(6LL, v42, "Updater %s returned isDone(obj)=true (ie: module should skip), continuing.", v53);
    CFNumberRef v30 = 0LL;
    goto LABEL_71;
  }

  int v81 = 0;
  v112 = 0LL;
  uint64_t v82 = &off_10002E348[6 * v27];
  uint64_t v119 = (char *)v82 + 33;
  uint64_t v117 = (const void **)(v82 + 1);
  uint64_t v110 = (const void **)(v82 + 5);
  char v111 = (char *)v82 + 34;
  while (2)
  {
    if (v81 <= 1024) {
      int v83 = 1024;
    }
    else {
      int v83 = v81;
    }
    int key = v83;
    int v84 = v81 - 1;
    while (2)
    {
      if (v129)
      {
        CFRelease(v129);
        char v129 = 0LL;
      }

      if (key == v84 + 1)
      {
        AMSupportLogInternal(3LL, v42, "Exceeded maximum loops (%d) for %s. error=%@", 1024LL, v53);
        ramrod_create_error_cf( a2,  @"RamrodErrorDomain",  1016LL,  v130[0],  @"%s: Exceeded maximum loops for %s",  v102,  v103,  v104,  (char)v42);
LABEL_123:
        CFDictionaryRef updated = 0LL;
        char v101 = 1;
        CFMutableDictionaryRef Mutable = v115;
        goto LABEL_124;
      }

      if (!v29) {
        goto LABEL_89;
      }
      AMSupportLogInternal(6LL, v42, "Calling %sUpdater fp_isDone", v53);
      int v85 = ((uint64_t (*)(__CFDictionary *, const void **))v128[1])(v28, v130);
      if (v130[0])
      {
        AMSupportLogInternal( 3LL,  "ramrod_update_copy_deviceinfo_with_options",  "%sUpdater fp_isDone returned error: %@",  v53,  v130[0]);
        goto LABEL_123;
      }

      if (v85) {
        goto LABEL_121;
      }
LABEL_89:
      AMSupportLogInternal(6LL, v42, "Calling %sUpdater fp_ExecCmd", v53);
      if (!((unsigned int (*)(__CFDictionary *, const __CFString *, void, __CFDictionary **, const void **))v128[2])( v28,  @"queryInfo",  0LL,  &v129,  v130))
      {
        AMSupportLogInternal(3LL, v42, "fp_ExecCmd failed on %s, continuing to next updater.", v53);
        if (*v119 == 1)
        {
          ramrod_log_msg( "%s updater failed but not reporting error since it is best effort\n",  v86,  v87,  v88,  v89,  v90,  v91,  v92,  (char)v53);
        }

        else
        {
          CFDictionarySetValue(v118, *v33, *v117);
          ramrod_create_error_cf( a2,  @"RamrodErrorDomain",  1016LL,  v130[0],  @"%s: Preflight QueryInfo failed on %s",  v93,  v94,  v95,  (char)v42);
        }

        ++v84;
        if (!v29) {
          goto LABEL_121;
        }
        continue;
      }

      break;
    }

    if (!v129)
    {
      CFMutableDictionaryRef Mutable = v115;
      goto LABEL_103;
    }

    CFTypeID TypeID = CFDictionaryGetTypeID();
    CFMutableDictionaryRef Mutable = v115;
    if (TypeID != CFGetTypeID(v129) || CFDictionaryGetValue(v127, @"PreflightRequired") != kCFBooleanFalse)
    {
LABEL_103:
      unint64_t v97 = (unint64_t)v129;
      if (v29)
      {
        CFArrayAppendValue(v29, v129);
        unint64_t v97 = (unint64_t)v129;
      }

      if (v97 && !v130[0])
      {
        AMSupportLogInternal(6LL, v42, "Populated deviceinfo for %s, continuing.", v53);
        if (v29) {
          CFMutableArrayRef v98 = v29;
        }
        else {
          CFMutableArrayRef v98 = v129;
        }
        if (*v111) {
          uint64_t v99 = Mutable;
        }
        else {
          uint64_t v99 = v114;
        }
        CFDictionarySetValue(v99, *v33, v98);
        goto LABEL_120;
      }

      if (!(v97 | (unint64_t)v130[0]))
      {
        AMSupportLogInternal( 6LL,  v42,  "Updater %s returned no personalization info (ie: module should skip), continuing.",  v53);
        goto LABEL_120;
      }

      v100 = "NULL";
      if (v97) {
        v100 = "NOT-NULL";
      }
      AMSupportLogInternal( 6LL,  v42,  "Updater %s QueryInfo succeeded, but bad results. Results=%s, Error=%@",  v53,  v100,  v130[0]);
      if (!*v111)
      {
LABEL_120:
        int v81 = v84 + 2;
        if (v29) {
          continue;
        }
LABEL_121:
        uint64_t v32 = v42;
        CFNumberRef v30 = v112;
        goto LABEL_71;
      }

      ramrod_create_error_cf( a2,  @"RamrodErrorDomain",  1016LL,  v130[0],  @"%s: Preflight QueryInfo succeeded, but improper results on %s",  v22,  v23,  v24,  (char)v42);
      CFDictionaryRef updated = 0LL;
      char v101 = 1;
LABEL_124:
      CFMutableDictionaryRef v13 = v114;
      CFMutableDictionaryRef v17 = v118;
      CFNumberRef v30 = v112;
      goto LABEL_140;
    }

    break;
  }

  v112 = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0LL, v129);
  if (v112)
  {
    if (*v110)
    {
      keya = (void *)*v110;
      if (CFDictionaryContainsKey(v112, *v110))
      {
        AMSupportLogInternal(3LL, v42, "Removing updater reference from DeviceInfo to avoid serialization failures.");
        CFDictionaryRemoveValue(v112, keya);
        CFRelease(v129);
        char v129 = v112;
        v112 = 0LL;
      }
    }

    goto LABEL_103;
  }

  CFDictionaryRef updated = 0LL;
  CFNumberRef v30 = 0LL;
  char v101 = 1;
LABEL_139:
  CFMutableDictionaryRef v13 = v114;
  CFMutableDictionaryRef v17 = v118;
LABEL_140:
  AMSupportSafeRelease(v28);
  AMSupportSafeRelease(v30);
  AMSupportSafeRelease(v129);
  AMSupportSafeRelease(v29);
  AMSupportSafeRelease(v130[0]);
  AMSupportSafeRelease(v126);
  AMSupportSafeRelease(theDict);
  AMSupportSafeRelease(v113);
  AMSupportSafeRelease(Mutable);
  AMSupportSafeRelease(v13);
  AMSupportSafeRelease(v17);
  AMSupportSafeRelease(MutableCopy);
  AMSupportSafeRelease(updated);
  if (v128)
  {
    free(v128);
    char v128 = 0LL;
  }

  uint64_t result = cf;
  char v109 = v101 ^ 1;
  if (!cf) {
    char v109 = 1;
  }
  if ((v109 & 1) == 0)
  {
    CFRelease(cf);
    return 0LL;
  }

  return result;
}

void sub_100014EE4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2) {
    ramrod_log_msg("updater_log: %s", a2, a3, a4, a5, a6, a7, a8, a2);
  }
}

__CFDictionary *ramrod_update_copy_deviceinfo(int a1, CFErrorRef *a2)
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  uint64_t v5 = Mutable;
  if (Mutable)
  {
    uint64_t v6 = (const void **)&kCFBooleanTrue;
    if (!a1) {
      uint64_t v6 = (const void **)&kCFBooleanFalse;
    }
    CFDictionarySetValue(Mutable, @"PreflightRequired", *v6);
    CFDictionarySetValue(v5, @"PreflightContext", @"BootedOS");
    CFDictionaryRef updated = ramrod_update_copy_deviceinfo_with_options(v5, a2);
  }

  else
  {
    AMSupportLogInternal(3LL, "ramrod_update_copy_deviceinfo", "Failed allocate options");
    CFDictionaryRef updated = 0LL;
  }

  AMSupportSafeRelease(v5);
  return updated;
}

BOOL ramrod_should_update_rose( int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    BOOL v8 = 0LL;
    uint64_t v9 = "Skipping checking Rose for booted update\n";
  }

  else
  {
    int has_rose = ramrod_device_has_rose();
    BOOL v8 = has_rose != 0;
    if (has_rose) {
      uint64_t v9 = "Rose is present. Will update\n";
    }
    else {
      uint64_t v9 = "Rose not present\n";
    }
  }

  ramrod_log_msg(v9, a2, a3, a4, a5, a6, a7, a8, v12);
  return v8;
}

uint64_t ramrod_device_has_rose()
{
  io_object_t v0 = IOServiceNameMatching("rose");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v0);
  if (!MatchingService)
  {
    ramrod_log_msg("Service does not exist\n", v1, v2, v3, v4, v5, v6, v7, v59);
    uint64_t v49 = 0LL;
    CFMutableDictionaryRef v17 = 0LL;
    BOOL v26 = 0LL;
    uint64_t v35 = 0LL;
LABEL_31:
    uint64_t v45 = 0LL;
    goto LABEL_20;
  }

  if (!ramrod_should_do_legacy_restored_internal_behaviors())
  {
    CFMutableDictionaryRef v17 = 0LL;
LABEL_17:
    BOOL v26 = 0LL;
LABEL_18:
    uint64_t v35 = 0LL;
    uint64_t v45 = 0LL;
    goto LABEL_19;
  }

  char valuePtr = 0;
  uint64_t v9 = (const __CFString *)MGCopyAnswer(@"HWModelStr", 0LL);
  CFMutableDictionaryRef v17 = v9;
  if (!v9)
  {
    char v48 = "Failed to get HW model\n";
    goto LABEL_16;
  }

  CFTypeID v18 = CFGetTypeID(v9);
  if (v18 != CFStringGetTypeID())
  {
    char v48 = "HW model is not a string\n";
    goto LABEL_16;
  }

  if (!CFStringHasSuffix(v17, @"DEV"))
  {
    char v48 = "Not a DEV board\n";
LABEL_16:
    ramrod_log_msg(v48, v10, v11, v12, v13, v14, v15, v16, v59);
    goto LABEL_17;
  }

  ramrod_log_msg("DEV board\n", v10, v11, v12, v13, v14, v15, v16, v59);
  BOOL v26 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt8Type, &valuePtr);
  if (!v26)
  {
    ramrod_log_msg("Failed to create zero\n", v19, v20, v21, v22, v23, v24, v25, v60);
    goto LABEL_18;
  }

  uint64_t v27 = (const __CFNumber *)IORegistryEntrySearchCFProperty( MatchingService,  "IOService",  @"ECID",  kCFAllocatorDefault,  1u);
  uint64_t v35 = v27;
  if (!v27)
  {
    uint64_t v58 = "ECID property does not exist\n";
LABEL_30:
    ramrod_log_msg(v58, v28, v29, v30, v31, v32, v33, v34, v60);
    uint64_t v49 = 0LL;
    goto LABEL_31;
  }

  CFTypeID v36 = CFGetTypeID(v27);
  if (v36 != CFNumberGetTypeID())
  {
    uint64_t v58 = "ECID property is not a number\n";
    goto LABEL_30;
  }

  if (CFNumberCompare(v26, v35, 0LL) == kCFCompareEqualTo)
  {
    uint64_t v58 = "ECID property is zero\n";
    goto LABEL_30;
  }

  uint64_t v37 = (const __CFNumber *)IORegistryEntrySearchCFProperty( MatchingService,  "IOService",  @"ChipID",  kCFAllocatorDefault,  1u);
  uint64_t v45 = v37;
  if (!v37)
  {
    uint64_t v47 = "ChipID property does not exist\n";
    goto LABEL_34;
  }

  CFTypeID v46 = CFGetTypeID(v37);
  if (v46 != CFNumberGetTypeID())
  {
    uint64_t v47 = "ChipID property is not a number\n";
    goto LABEL_34;
  }

  if (CFNumberCompare(v26, v45, 0LL))
  {
LABEL_19:
    uint64_t v49 = 1LL;
    goto LABEL_20;
  }

  uint64_t v47 = "ChipID property is zero\n";
LABEL_34:
  ramrod_log_msg(v47, v38, v39, v40, v41, v42, v43, v44, v60);
  uint64_t v49 = 0LL;
LABEL_20:
  AMSupportSafeRelease(v45);
  AMSupportSafeRelease(v35);
  AMSupportSafeRelease(v26);
  AMSupportSafeRelease(v17);
  if (MatchingService) {
    IOObjectRelease(MatchingService);
  }
  ramrod_log_msg("result: %u\n", v50, v51, v52, v53, v54, v55, v56, v49);
  return v49;
}

CFStringRef ramrod_update_supported(CFStringRef theString, const __CFString *a2)
{
  uint64_t v2 = theString;
  uint64_t v24 = 0LL;
  CFTypeRef cf = 0LL;
  uint64_t v23 = 0LL;
  if (!theString)
  {
    AMSupportLogInternal(3LL, "_ramrod_update_supported", "ERROR updater NULL.");
    uint64_t v7 = 0LL;
    CFMutableDictionaryRef Mutable = 0LL;
    CFMutableDictionaryRef v8 = 0LL;
    char CStringPtr = 0LL;
    goto LABEL_28;
  }

  char CStringPtr = CFStringGetCStringPtr(theString, 0x8000100u);
  if (!CStringPtr)
  {
    AMSupportLogInternal( 3LL,  "_ramrod_update_supported",  "Failed to convert %@ name to C String.. skipping update.",  v2);
    uint64_t v7 = 0LL;
    CFMutableDictionaryRef Mutable = 0LL;
    CFMutableDictionaryRef v8 = 0LL;
    goto LABEL_16;
  }

  dylib = ramrod_update_get_dylib(v2);
  CFMutableDictionaryRef Mutable = (__CFDictionary *)dylib;
  if (!dylib)
  {
    AMSupportLogInternal( 3LL,  "_ramrod_update_supported",  "ramrod_update_get_dylib returned NULL for %@, skipping update.",  v2);
LABEL_38:
    uint64_t v7 = 0LL;
    goto LABEL_39;
  }

  uint64_t v7 = dlopen((const char *)dylib, 261);
  if (!v7)
  {
    uint64_t v20 = dlerror();
    AMSupportLogInternal(3LL, "_ramrod_update_supported", "%@ dylib missing, skipping update: %s: %s", v2, Mutable, v20);
    CFMutableDictionaryRef Mutable = 0LL;
LABEL_39:
    CFMutableDictionaryRef v8 = 0LL;
    goto LABEL_15;
  }

  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  if (!Mutable)
  {
    AMSupportLogInternal(4LL, "_ramrod_update_supported", "updaterOptions failed to allocate");
    goto LABEL_38;
  }

  CFMutableDictionaryRef v8 = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  if (!v8)
  {
    AMSupportLogInternal(4LL, "_ramrod_update_supported", "subOptions failed to allocate");
LABEL_41:
    uint64_t v7 = 0LL;
    goto LABEL_15;
  }

  CFDictionarySetValue(Mutable, @"Options", v8);
  CFDictionarySetValue(v8, @"PreflightRequired", kCFBooleanTrue);
  if (!ramrod_copy_updater_functions( v7,  CStringPtr,  (__CFDictionary *(***)(const __CFDictionary *, uint64_t, uint64_t, CFErrorRef *))&v23,  0LL,  v9,  v10,  v11,  v12)
    || !*((void *)v23 + 2)
    || !*((void *)v23 + 1)
    || !*(void *)v23)
  {
    goto LABEL_41;
  }

  uint64_t v13 = (*(uint64_t (**)(__CFDictionary *, void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), const char *, uint64_t *))v23)( Mutable,  sub_100014EE4,  CStringPtr,  &v24);
  uint64_t v7 = (void *)v13;
  if (!v13)
  {
    AMSupportLogInternal(3LL, "_ramrod_update_supported", "Failed to create %s obj, error=%@", CStringPtr, v24);
    goto LABEL_15;
  }

  CFErrorRef err = 0LL;
  if ((*((unsigned int (**)(uint64_t, void))v23 + 1))(v13, 0LL))
  {
    uint64_t v21 = v2;
    uint64_t v14 = "%@ instructed us not to attempt OTA (via isDone)";
LABEL_14:
    AMSupportLogInternal(4LL, "_ramrod_update_supported", v14, v21);
LABEL_15:
    char CStringPtr = 0LL;
LABEL_16:
    uint64_t v2 = 0LL;
    goto LABEL_28;
  }

  uint64_t v15 = (*((uint64_t (**)(void *, const __CFString *, void, CFTypeRef *, CFErrorRef *))v23 + 2))( v7,  @"queryInfo",  0LL,  &cf,  &err);
  if ((_DWORD)v15 == 1 && !err)
  {
    if (!cf || (CFTypeID v16 = CFGetTypeID(cf), v16 == CFDictionaryGetTypeID()) && !CFDictionaryGetCount((CFDictionaryRef)cf))
    {
      uint64_t v21 = v2;
      uint64_t v14 = "%@ instructed us not to attempt OTA (via QueryInfo)";
      goto LABEL_14;
    }
  }

  char CStringPtr = 0LL;
  CFErrorRef v17 = err;
  if (a2 && err)
  {
    CFTypeID v18 = CFErrorCopyDescription(err);
    char CStringPtr = (const char *)v18;
    if (v18 && CFStringCompare(v18, a2, 0LL) == kCFCompareEqualTo)
    {
      AMSupportLogInternal( 4LL,  "_ramrod_update_supported",  "%@ instructed us not to attempt update (via QueryInfo Error string match)",  v2);
      goto LABEL_16;
    }

    AMSupportLogInternal( 4LL,  "_ramrod_update_supported",  "%@ returned error, but no indication to skip update: %@",  v2,  err);
    CFErrorRef v17 = err;
  }

  AMSupportLogInternal( 6LL,  "_ramrod_update_supported",  "%@ tells us to attempt Update.  success=%d, error=%d, result=%d.",  v2,  v15,  v17 != 0LL,  cf != 0LL);
  uint64_t v2 = (const __CFString *)1;
LABEL_28:
  AMSupportSafeRelease(cf);
  AMSupportSafeRelease(Mutable);
  AMSupportSafeRelease(v8);
  AMSupportSafeRelease(v24);
  AMSupportSafeRelease(v7);
  AMSupportSafeRelease(CStringPtr);
  if (v23) {
    free(v23);
  }
  return v2;
}

uint64_t ramrod_device_has_appletcon(uint64_t a1)
{
  io_registry_entry_t v2 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/product");
  if (!v2)
  {
    CFTypeRef CFProperty = 0LL;
LABEL_19:
    CFTypeRef v34 = 0LL;
    uint64_t v24 = 0LL;
LABEL_20:
    uint64_t updated = 0LL;
    goto LABEL_21;
  }

  io_object_t v3 = v2;
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v2, @"tcon-path", kCFAllocatorDefault, 0);
  IOObjectRelease(v3);
  if (!CFProperty)
  {
    CFTypeID v46 = "tcon-path pointer not found.\n";
LABEL_18:
    ramrod_log_msg(v46, v5, v6, v7, v8, v9, v10, v11, v57);
    goto LABEL_19;
  }

  CFTypeID TypeID = CFDataGetTypeID();
  if (TypeID != CFGetTypeID(CFProperty))
  {
    CFTypeID v46 = "IORegistryEntryCreateCFProperty returned non CFDataRef\n";
    goto LABEL_18;
  }

  CFIndex Length = CFDataGetLength((CFDataRef)CFProperty);
  if (!Length)
  {
    CFTypeID v46 = "tcon-path contains invalid string\n";
    goto LABEL_18;
  }

  CFIndex v14 = Length;
  size_t v15 = Length + 15;
  CFTypeID v16 = (char *)malloc(Length + 15);
  uint64_t v24 = v16;
  if (!v16)
  {
    uint64_t v49 = "malloc returned NULL\n";
LABEL_31:
    ramrod_log_msg(v49, v17, v18, v19, v20, v21, v22, v23, v57);
    goto LABEL_32;
  }

  if (snprintf(v16, v15, "%s", "IODeviceTree:/") != 14)
  {
    uint64_t v49 = "overflow";
    goto LABEL_31;
  }

  v59.CFIndex length = CFDataGetLength((CFDataRef)CFProperty);
  v59.location = 0LL;
  CFDataGetBytes((CFDataRef)CFProperty, v59, (UInt8 *)v24 + 14);
  v24[v14 + 14] = 0;
  ramrod_log_msg("Looking for entry under %s\n", v25, v26, v27, v28, v29, v30, v31, (char)v24);
  io_registry_entry_t v32 = IORegistryEntryFromPath(kIOMasterPortDefault, v24);
  if (!v32)
  {
    uint64_t v49 = "tcon-path points to non-existent node\n";
    goto LABEL_31;
  }

  io_object_t v33 = v32;
  CFTypeRef v34 = IORegistryEntryCreateCFProperty(v32, @"firmware", kCFAllocatorDefault, 0);
  IOObjectRelease(v33);
  if (!v34)
  {
    char v48 = "No 'firmware' property found.\n";
LABEL_23:
    ramrod_log_msg(v48, v35, v36, v37, v38, v39, v40, v41, v57);
    goto LABEL_20;
  }

  CFTypeID v42 = CFDataGetTypeID();
  if (v42 != CFGetTypeID(v34))
  {
    char v48 = "IORegistryEntryCreateCFProperty returned non CFDataRef\n";
    goto LABEL_23;
  }

  if (CFDataGetLength((CFDataRef)v34) != 4)
  {
    char v58 = CFDataGetLength((CFDataRef)v34);
    ramrod_log_msg("version_data wrong length (%lu bytes)\n", v50, v51, v52, v53, v54, v55, v56, v58);
    goto LABEL_20;
  }

  BytePtr = CFDataGetBytePtr((CFDataRef)v34);
  if (!BytePtr)
  {
    char v48 = "CFDataGetBytePtr returned NULL\n";
    goto LABEL_23;
  }

  int v44 = *(_DWORD *)BytePtr;
  ramrod_log_msg( "AppleTCON flashable node found. (firmware=%d)\n",  v35,  v36,  v37,  v38,  v39,  v40,  v41,  *(_DWORD *)BytePtr);
  CFRelease(v34);
  if (!v44)
  {
LABEL_32:
    CFTypeRef v34 = 0LL;
    goto LABEL_20;
  }

  if (a1
    && (const CFBooleanRef)AMSupportGetValueForKeyPathInDict( kCFAllocatorDefault,  a1,  @"AppleTCONOptions.FuseSDOM") == kCFBooleanTrue)
  {
    CFTypeRef v34 = 0LL;
    uint64_t updated = 1LL;
  }

  else
  {
    uint64_t updated = (uint64_t)ramrod_update_supported( @"AppleTCON",  @"AppleTCONUpdaterErrorDomain: AppleTCONUpdaterExecCommand - execCommand error");
    CFTypeRef v34 = 0LL;
  }

BOOL ramrod_device_ota_appletcon( int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1) {
    return ramrod_device_has_appletcon(0LL) != 0;
  }
  ramrod_log_msg("Skipping checking TCON for booted update\n", a2, a3, a4, a5, a6, a7, a8, vars0);
  return 0LL;
}

uint64_t _ramrod_device_has_usbcretimer_callback(_DWORD *a1, io_iterator_t iterator)
{
  io_object_t v3 = IOIteratorNext(iterator);
  if (v3) {
    ++*a1;
  }
  return IOObjectRelease(v3);
}

BOOL _ramrod_device_has_usbcretimer(const __CFString *a1, uint64_t a2)
{
  kern_return_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  io_object_t v65;
  __CFRunLoop *Current;
  __CFRunLoop *v67;
  id v68;
  char v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  id v77;
  id v78;
  uint64_t v79;
  void *j;
  char v81;
  __CFRunLoopSource *source;
  io_registry_entry_t v83;
  void *v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  uint64_t entryID;
  int refCon;
  io_iterator_t iterator;
  _BYTE v96[128];
  CFStringRef v97;
  CFTypeRef v98;
  _BYTE v99[128];
  iterator = 0;
  io_object_t v3 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, a2);
  uint64_t v5 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v4);
  io_registry_entry_t v6 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/arm-io");
  refCon = 0;
  ramrod_log_msg("entering %s\n", v7, v8, v9, v10, v11, v12, v13, (char)"_ramrod_device_has_usbcretimer");
  if (ramrod_should_do_legacy_restored_internal_behaviors())
  {
    uint64_t entryID = 0LL;
    if (os_parse_boot_arg_int("ramrod_disable_usbcretimer", &entryID))
    {
      if (entryID)
      {
        uint64_t v21 = "ramrod_disable_usbcretimer set in boot-args, disabling hardware support and not waiting for retimers\n";
LABEL_9:
        ramrod_log_msg(v21, v14, v15, v16, v17, v18, v19, v20, v81);
        BOOL v22 = 0LL;
        goto LABEL_10;
      }
    }
  }

  if (!v6)
  {
    uint64_t v21 = "Failed to create DT node for IODeviceTree\n";
    goto LABEL_9;
  }

  if (IORegistryEntryCreateIterator(v6, "IODeviceTree", 1u, &iterator))
  {
    uint64_t v21 = "Failed to create iterator for DeviceTree.\n";
    goto LABEL_9;
  }

  int v84 = v5;
  io_object_t v24 = IOIteratorNext(iterator);
  if (v24)
  {
    io_registry_entry_t v25 = v24;
    while (1)
    {
      CFTypeRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v25, @"name", kCFAllocatorDefault, 0);
      if (CFProperty) {
        break;
      }
LABEL_25:
      IOObjectRelease(v25);
      io_registry_entry_t v25 = IOIteratorNext(iterator);
      if (!v25) {
        goto LABEL_26;
      }
    }

    uint64_t v27 = CFProperty;
    uint64_t entryID = 0LL;
    IORegistryEntryGetRegistryEntryID(v25, &entryID);
    CFTypeID TypeID = CFDataGetTypeID();
    if (TypeID == CFGetTypeID(v27))
    {
      uint64_t v36 = CFStringCreateFromExternalRepresentation(kCFAllocatorDefault, v27, 0x8000100u);
      if (v36)
      {
        uint64_t v37 = v36;
        if (CFStringHasPrefix(v36, a1)) {
          objc_msgSend( v3,  "addObject:",  +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", entryID));
        }
        CFRelease(v37);
        goto LABEL_24;
      }

      uint64_t v38 = "nameString NULL\n";
    }

    else
    {
      uint64_t v38 = "nameData not CFDataRef\n";
    }

    ramrod_log_msg(v38, v29, v30, v31, v32, v33, v34, v35, v81);
LABEL_24:
    CFRelease(v27);
    goto LABEL_25;
  }

LABEL_26:
  if (iterator) {
    IOObjectRelease(iterator);
  }
  iterator = 0;
  if ([v3 count])
  {
    int v83 = v6;
    char v39 = [v3 count];
    ramrod_log_msg( "Found %lu nodes in the device tree. Waiting some (small) amount of time for them to register as an IOSerivce\n",  v40,  v41,  v42,  v43,  v44,  v45,  v46,  v39);
    uint64_t v47 = IONotificationPortCreate(kIOMasterPortDefault);
    source = IONotificationPortGetRunLoopSource(v47);
    uint64_t v89 = 0u;
    uint64_t v90 = 0u;
    uint64_t v91 = 0u;
    uint64_t v92 = 0u;
    char v48 = v3;
    id v49 = [v3 countByEnumeratingWithState:&v89 objects:v99 count:16];
    if (v49)
    {
      id v50 = v49;
      uint64_t v51 = *(void *)v90;
      do
      {
        for (CFIndex i = 0LL; i != v50; CFIndex i = (char *)i + 1)
        {
          if (*(void *)v90 != v51) {
            objc_enumerationMutation(v3);
          }
          uint64_t v53 = *(void **)(*((void *)&v89 + 1) + 8LL * (void)i);
          LODWORD(entryID) = 0;
          unint64_t v97 = @"IOParentMatch";
          CFMutableDictionaryRef v54 = IORegistryEntryIDMatching((uint64_t)[v53 longLongValue]);
          CFMutableArrayRef v98 = (id)CFMakeCollectable(v54);
          uint64_t v55 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v98,  &v97,  1LL);
          if (v55) {
            uint64_t v56 = (const __CFDictionary *)CFRetain(v55);
          }
          else {
            uint64_t v56 = 0LL;
          }
          char v57 = IOServiceAddMatchingNotification( v47,  "IOServiceFirstMatch",  v56,  (IOServiceMatchingCallback)_ramrod_device_has_usbcretimer_callback,  &refCon,  (io_iterator_t *)&entryID);
          if (v57)
          {
            ramrod_log_msg( "IOServiceAddMatchingNotification() failed with return %d",  v58,  v59,  v60,  v61,  v62,  v63,  v64,  v57);
          }

          else
          {
            objc_msgSend( v84,  "addObject:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", entryID));
            uint64_t v65 = IOIteratorNext(entryID);
            if (v65) {
              ++refCon;
            }
            IOObjectRelease(v65);
          }
        }

        id v50 = [v3 countByEnumeratingWithState:&v89 objects:v99 count:16];
      }

      while (v50);
    }

    Current = CFRunLoopGetCurrent();
    CFRunLoopAddSource(Current, source, kCFRunLoopDefaultMode);
    CFRunLoopRunInMode(kCFRunLoopDefaultMode, 5.0, 0);
    uint64_t v67 = CFRunLoopGetCurrent();
    CFRunLoopRemoveSource(v67, source, kCFRunLoopDefaultMode);
    IONotificationPortDestroy(v47);
    uint64_t v68 = (id)refCon;
    if ([v3 count] != v68)
    {
      uint64_t v69 = refCon;
      [v3 count];
      ramrod_log_msg("Found only %d when we should have found %d\n", v70, v71, v72, v73, v74, v75, v76, v69);
    }

    uint64_t v87 = 0u;
    uint64_t v88 = 0u;
    int v85 = 0u;
    uint64_t v86 = 0u;
    uint64_t v5 = v84;
    uint64_t v77 = [v84 countByEnumeratingWithState:&v85 objects:v96 count:16];
    if (v77)
    {
      int v78 = v77;
      uint64_t v79 = *(void *)v86;
      do
      {
        for (j = 0LL; j != v78; j = (char *)j + 1)
        {
          if (*(void *)v86 != v79) {
            objc_enumerationMutation(v84);
          }
          IOObjectRelease((io_object_t)[*(id *)(*((void *)&v85 + 1) + 8 * (void)j) unsignedIntValue]);
        }

        int v78 = [v84 countByEnumeratingWithState:&v85 objects:v96 count:16];
      }

      while (v78);
    }

    BOOL v22 = refCon != 0;
    io_object_t v3 = v48;
    io_registry_entry_t v6 = v83;
  }

  else
  {
    BOOL v22 = 0LL;
  }

BOOL ramrod_device_has_usbcretimer(uint64_t a1, uint64_t a2)
{
  return _ramrod_device_has_usbcretimer(@"atcrt", a2) || _ramrod_device_has_usbcretimer(@"uatcrt", v2);
}

BOOL ramrod_should_update_usbcretimer( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!(_DWORD)a1) {
    return ramrod_device_has_usbcretimer(a1, a2);
  }
  ramrod_log_msg("Skipping checking retimer for booted update\n", a2, a3, a4, a5, a6, a7, a8, vars0);
  return 0LL;
}

BOOL ramrod_should_update_usbcretimer_uarp( int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1) {
    return _ramrod_device_has_usbcretimer(@"uatcrt", a2);
  }
  ramrod_log_msg("Skipping checking retimer for booted update\n", a2, a3, a4, a5, a6, a7, a8, vars0);
  return 0LL;
}

BOOL ramrod_device_has_PS190( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  io_registry_entry_t v25 = 0LL;
  ramrod_log_msg("opening %s\n", a2, a3, a4, a5, a6, a7, a8, (char)"/usr/lib/updaters/libPS190Updater.dylib");
  uint64_t v8 = dlopen("/usr/lib/updaters/libPS190Updater.dylib", 261);
  if (!v8)
  {
    dlerror();
    ramrod_log_msg( "unable to open %s. %s, skipping step\n",  v17,  v18,  v19,  v20,  v21,  v22,  v23,  (char)"/usr/lib/updaters/libPS190Updater.dylib");
    return 0LL;
  }

  int v13 = ramrod_copy_updater_functions( v8,  "PS190",  (__CFDictionary *(***)(const __CFDictionary *, uint64_t, uint64_t, CFErrorRef *))&v25,  0LL,  v9,  v10,  v11,  v12);
  uint64_t v14 = v25;
  if (!v13)
  {
    BOOL v16 = 0LL;
    if (!v25) {
      return v16;
    }
    goto LABEL_5;
  }

  uint64_t v15 = (unsigned int (*)(void, void))*((void *)v25 + 1);
  if (!v15)
  {
    BOOL v16 = 0LL;
    goto LABEL_5;
  }

  BOOL v16 = v15(0LL, 0LL) == 0;
  uint64_t v14 = v25;
  if (v25) {
LABEL_5:
  }
    free(v14);
  return v16;
}

BOOL ramrod_should_update_PS190( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!(_DWORD)a1) {
    return ramrod_device_has_PS190(a1, a2, a3, a4, a5, a6, a7, a8);
  }
  ramrod_log_msg("Skipping checking PS190 for booted update\n", a2, a3, a4, a5, a6, a7, a8, vars0);
  return 0LL;
}

void sub_1000160C8()
{
  if ((ramrod_should_do_legacy_restored_behaviors() & 1) == 0 && qword_10002E528 != -1) {
    dispatch_once(&qword_10002E528, &stru_100025530);
  }
}

void sub_100016108(id a1)
{
  for (uint64_t i = 0LL; i != 36; i += 6LL)
  {
    if (CFEqual(off_10002E348[i + 1], @"update_rose")) {
      BYTE1(off_10002E348[i + 4]) = 1;
    }
  }

void sub_100016338( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001639C()
{
}

void sub_1000163C8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001642C()
{
}

void sub_100016458()
{
  uint64_t v0 = sub_1000053F8();
  _os_crash(v0);
  __break(1u);
}

void sub_10001646C()
{
}

void sub_100016498( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100016508( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001656C()
{
}

void sub_100016598()
{
}

void sub_1000165C4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001662C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100016690()
{
}

void sub_1000166BC()
{
}

void sub_1000166E8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100016758(os_log_s *a1)
{
  int v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a1,  OS_LOG_TYPE_FAULT,  "Failed to reboot the device: %{errno}d",  (uint8_t *)v3,  8u);
  sub_1000053D4();
}

void sub_1000167E0(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (sub_100008EAC()) {
    uint64_t v6 = 3LL;
  }
  else {
    uint64_t v6 = 2LL;
  }
  uint64_t v7 = sub_100008E94(v6, v3, v4, v5, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_100016884(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (sub_100008EAC()) {
    uint64_t v6 = 3LL;
  }
  else {
    uint64_t v6 = 2LL;
  }
  uint64_t v7 = sub_100008E94(v6, v3, v4, v5, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_100016914(void *a1, _OWORD *a2)
{
  uint64_t v7 = sub_100008E94(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_1000169A4(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_100008E94(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000094A0(v6);
  __break(1u);
}

void sub_100016A18(void *a1, _OWORD *a2)
{
  uint64_t v7 = sub_100008E94(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_100016AA8(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_100008E94(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000094A0(v6);
  __break(1u);
}

void sub_100016B1C(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  sub_100008EAC();
  sub_10000946C();
  uint64_t v7 = sub_100008E94(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_100016BB4(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  sub_100008EAC();
  sub_10000946C();
  uint64_t v7 = sub_100008E94(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_100016C38(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  sub_100008EAC();
  sub_10000946C();
  uint64_t v7 = sub_100008E94(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

id objc_msgSend_writer(void *a1, const char *a2, ...)
{
  return [a1 writer];
}