void init_locationd_events()
{
  xpc_event_provider_create();
}

void sub_210C(uint64_t a1, uint64_t a2)
{
  uint64_t valuePtr = a2;
  xpc_event_provider_get_queue();
}

void sub_2410(id a1)
{
  qword_4408 = (uint64_t)os_log_create("com.apple.locationd.Core", "Core");
}

void sub_243C()
{
}

void sub_2594()
{
}

void sub_25E8()
{
  if (qword_4420)
  {
    xpc_object_t v0 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_object_t v1 = xpc_string_create("LaunchdManagedClients/kCLConnectionMessageRegister");
    xpc_dictionary_set_value(v0, "kCLConnectionMessageNameKey", v1);
    v2 = -[NSUUID UUIDString](+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"), "UUIDString");
    v8 = @"UUID";
    v9 = v2;
    v3 = +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL),  1LL,  0LL);
    if (qword_4410 != -1) {
      dispatch_once(&qword_4410, &stru_4280);
    }
    v4 = (os_log_s *)qword_4408;
    if (os_log_type_enabled((os_log_t)qword_4408, OS_LOG_TYPE_INFO))
    {
      int v6 = 136446210;
      v7 = -[NSString UTF8String](v2, "UTF8String");
      _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_INFO,  "Sending registration message to locationd with UUID %{public}s",  (uint8_t *)&v6,  0xCu);
    }

    xpc_object_t v5 = xpc_data_create(-[NSData bytes](v3, "bytes"), -[NSData length](v3, "length"));
    xpc_dictionary_set_value(v0, "kCLConnectionMessageInfoKey", v5);
    xpc_connection_send_message((xpc_connection_t)qword_4420, v0);
    if (v5) {
      xpc_release(v5);
    }
    if (v1) {
      xpc_release(v1);
    }
    if (v0) {
      xpc_release(v0);
    }
  }
}

void sub_27C0(id a1, int a2)
{
  if (qword_4410 != -1) {
    dispatch_once(&qword_4410, &stru_4280);
  }
  v2 = (os_log_s *)qword_4408;
  if (os_log_type_enabled((os_log_t)qword_4408, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "locationd started", buf, 2u);
  }

  if (!qword_4420)
  {
    if (qword_4410 != -1) {
      dispatch_once(&qword_4410, &stru_4280);
    }
    v3 = (os_log_s *)qword_4408;
    if (os_log_type_enabled((os_log_t)qword_4408, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "establish connection", v4, 2u);
    }

    sub_2594();
  }

void sub_2914(id a1, OS_xpc_object *a2)
{
  xpc_type_t type = xpc_get_type(a2);
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (a2 == (OS_xpc_object *)&_xpc_error_connection_invalid)
    {
      if (qword_4410 != -1) {
        dispatch_once(&qword_4410, &stru_4280);
      }
      v19 = (os_log_s *)qword_4408;
      if (os_log_type_enabled((os_log_t)qword_4408, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "#Warning event was XPC_ERROR_CONNECTION_INVALID", buf, 2u);
      }

      if (qword_4420)
      {
        xpc_connection_cancel((xpc_connection_t)qword_4420);
        xpc_release((xpc_object_t)qword_4420);
        qword_4420 = 0LL;
      }
    }

    else if (a2 == (OS_xpc_object *)&_xpc_error_connection_interrupted)
    {
      if (qword_4410 != -1) {
        dispatch_once(&qword_4410, &stru_4280);
      }
      v18 = (os_log_s *)qword_4408;
      if (os_log_type_enabled((os_log_t)qword_4408, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "event was XPC_ERROR_CONNECTION_INTERRUPTED", buf, 2u);
      }

      sub_25E8();
    }

    return;
  }

  if (type != (xpc_type_t)&_xpc_type_dictionary) {
    return;
  }
  string = xpc_dictionary_get_string(a2, "kCLConnectionMessageNameKey");
  if (!string)
  {
    if (qword_4410 != -1) {
      dispatch_once(&qword_4410, &stru_4280);
    }
    v20 = (os_log_s *)qword_4408;
    if (os_log_type_enabled((os_log_t)qword_4408, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_0,  v20,  OS_LOG_TYPE_DEFAULT,  "Received a XPC_TYPE_DICTIONARY with out a 'kCLConnectionMessageNameKey' key",  buf,  2u);
    }

    return;
  }

  xpc_object_t v5 = string;
  if (qword_4410 != -1) {
    dispatch_once(&qword_4410, &stru_4280);
  }
  int v6 = (os_log_s *)qword_4408;
  if (os_log_type_enabled((os_log_t)qword_4408, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v40 = v5;
    _os_log_impl( &dword_0,  v6,  OS_LOG_TYPE_DEFAULT,  "xpc_object_t event was XPC_TYPE_DICTIONARY with kCLConnectionMessageNameKey: %{public}s",  buf,  0xCu);
  }

  if (!strcmp(v5, "kCLConnectionMessageWakeClient"))
  {
    xpc_object_t v21 = xpc_dictionary_get_value(a2, "kCLConnectionMessageInfoKey");
    if (!v21 || (v22 = v21, xpc_get_type(v21) != (xpc_type_t)&_xpc_type_data))
    {
      if (qword_4410 != -1) {
        dispatch_once(&qword_4410, &stru_4280);
      }
      if (os_log_type_enabled((os_log_t)qword_4408, OS_LOG_TYPE_ERROR)) {
        sub_31EC();
      }
      return;
    }

    bytes_ptr = xpc_data_get_bytes_ptr(v22);
    size_t length = xpc_data_get_length(v22);
    v25 = (const __CFDictionary *)sub_2F78((uint64_t)bytes_ptr, length);
    v8 = (const __CFString *)v25;
    value = 0LL;
    if (v25
      && CFDictionaryGetValueIfPresent(v25, @"kCLConnectionMessageClientNameKey", (const void **)&value) == 1)
    {
      if (value && (CFTypeID v26 = CFGetTypeID(value), v26 == CFStringGetTypeID()))
      {
        CFTypeRef cf = 0LL;
        if (CFDictionaryGetValueIfPresent((CFDictionaryRef)qword_4428, value, &cf) == 1)
        {
          CFTypeID v27 = CFGetTypeID(cf);
          if (v27 == CFNumberGetTypeID())
          {
            CFNumberGetValue((CFNumberRef)cf, kCFNumberLongType, &valuePtr);
            xpc_event_provider_token_fire();
          }

          if (qword_4410 != -1) {
            dispatch_once(&qword_4410, &stru_4280);
          }
          if (os_log_type_enabled((os_log_t)qword_4408, OS_LOG_TYPE_ERROR)) {
            sub_3318();
          }
        }

        else
        {
          if (qword_4410 != -1) {
            dispatch_once(&qword_4410, &stru_4280);
          }
          if (os_log_type_enabled((os_log_t)qword_4408, OS_LOG_TYPE_ERROR)) {
            sub_3344();
          }
        }
      }

      else
      {
        if (qword_4410 != -1) {
          dispatch_once(&qword_4410, &stru_4280);
        }
        if (os_log_type_enabled((os_log_t)qword_4408, OS_LOG_TYPE_ERROR)) {
          sub_3288();
        }
      }
    }

    else
    {
      if (qword_4410 != -1) {
        dispatch_once(&qword_4410, &stru_4280);
      }
      v28 = (os_log_s *)qword_4408;
      if (!os_log_type_enabled((os_log_t)qword_4408, OS_LOG_TYPE_FAULT))
      {
        if (!v8) {
          return;
        }
        goto LABEL_58;
      }

      sub_3218(v28, v29, v30, v31, v32, v33, v34, v35);
      if (!v8) {
        return;
      }
    }

LABEL_58:
    CFRelease(v8);
    return;
  }

  CFStringRef v7 = CFStringCreateWithCString(kCFAllocatorDefault, v5, 0x8000100u);
  if (v7)
  {
    v8 = v7;
    if (CFArrayGetCount((CFArrayRef)qword_4438) >= 1)
    {
      CFIndex v9 = 0LL;
      do
      {
        ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)qword_4438, v9);
        if (CFStringCompare(ValueAtIndex, v8, 0LL)) {
          goto LABEL_58;
        }
      }

      while (++v9 < CFArrayGetCount((CFArrayRef)qword_4438));
    }

    CFRelease(v8);
  }

  if (qword_4410 != -1) {
    dispatch_once(&qword_4410, &stru_4280);
  }
  v11 = (os_log_s *)qword_4408;
  if (os_log_type_enabled((os_log_t)qword_4408, OS_LOG_TYPE_FAULT)) {
    sub_3370((uint64_t)v5, v11, v12, v13, v14, v15, v16, v17);
  }
}

id sub_2F78(uint64_t a1, uint64_t a2)
{
  if (a1) {
    v2 = -[NSData initWithBytes:length:](objc_alloc(&OBJC_CLASS___NSData), "initWithBytes:length:", a1, a2);
  }
  else {
    v2 = 0LL;
  }
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  v4 = +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", v3, objc_opt_class(&OBJC_CLASS___NSString), 0LL);
  if (!v2)
  {
LABEL_11:
    id v5 = 0LL;
    goto LABEL_12;
  }

  id v5 =  +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v4,  v2,  0LL);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0)
  {
    if (qword_4410 != -1) {
      dispatch_once(&qword_4410, &stru_4280);
    }
    if (os_log_type_enabled((os_log_t)qword_4408, OS_LOG_TYPE_FAULT)) {
      sub_3400();
    }

    goto LABEL_11;
  }

LABEL_12:
  return v5;
}

void sub_30B4(_Unwind_Exception *a1)
{
}

void sub_30D0()
{
  int v1 = v0;
  objc_begin_catch(v2);
  if (v1 == 2)
  {
    if (qword_4410 != -1) {
      dispatch_once(&qword_4410, &stru_4280);
    }
    if (os_log_type_enabled((os_log_t)qword_4408, OS_LOG_TYPE_FAULT)) {
      sub_33D4();
    }
    objc_end_catch();
    JUMPOUT(0x3060LL);
  }

  JUMPOUT(0x3068LL);
}

void sub_3148( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_3158( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void sub_317C( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_3194()
{
}

void sub_31C0()
{
}

void sub_31EC()
{
}

void sub_3218( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_3288()
{
}

void sub_32B4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_3318()
{
}

void sub_3344()
{
}

void sub_3370( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_33D4()
{
}

void sub_3400()
{
}

void xpc_event_provider_create()
{
  while (1)
    ;
}

void xpc_event_provider_get_queue()
{
  while (1)
    ;
}

void xpc_event_provider_token_fire()
{
  while (1)
    ;
}

id objc_msgSend_unarchivedObjectOfClasses_fromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unarchivedObjectOfClasses:fromData:error:");
}