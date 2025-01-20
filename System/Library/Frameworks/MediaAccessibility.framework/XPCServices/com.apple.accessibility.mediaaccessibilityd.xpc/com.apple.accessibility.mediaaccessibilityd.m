int main(int argc, const char **argv, const char **envp)
{
  void *v3;
  v3 = objc_autoreleasePoolPush();
  sub_1000028B4();
  dispatch_main();
}

void sub_1000028B4()
{
  qword_100008048 = (uint64_t)xpc_connection_create_mach_service( "com.apple.accessibility.mediaaccessibilityd",  &_dispatch_main_q,  1uLL);
  xpc_connection_set_event_handler((xpc_connection_t)qword_100008048, &stru_1000042E0);
  xpc_connection_resume((xpc_connection_t)qword_100008048);
}

void sub_1000028FC(id a1, OS_xpc_object *a2)
{
  if (xpc_get_type(a2) == (xpc_type_t)&_xpc_type_connection && &_xpc_type_error != &_xpc_type_connection)
  {
    if (xpc_connection_get_euid(a2))
    {
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_1000029A0;
      handler[3] = &unk_100004308;
      handler[4] = a2;
      xpc_connection_set_event_handler(a2, handler);
      xpc_connection_resume(a2);
    }

    else
    {
      xpc_connection_cancel(a2);
    }
  }
}

void sub_1000029A0(uint64_t a1, void *a2)
{
  v4 = objc_autoreleasePoolPush();
  v5 = *(void **)(a1 + 32);
  xpc_type_t type = xpc_get_type(a2);
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (a2 == &_xpc_error_connection_invalid || a2 == &_xpc_error_termination_imminent) {
      sub_100002F8C(v5, 0);
    }
    goto LABEL_52;
  }

  if (type != (xpc_type_t)&_xpc_type_dictionary) {
    goto LABEL_52;
  }
  xpc_object_t value = xpc_dictionary_get_value(a2, "reqiestTypePreferences");
  if (value)
  {
    v8 = value;
    if (xpc_get_type(value) == (xpc_type_t)&_xpc_type_dictionary)
    {
      CFNumberRef v9 = sub_100003240(v8);
      uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v9, v10) & 1) == 0) {
        goto LABEL_34;
      }
      id v11 = -[__CFNumber objectForKey:](v9, "objectForKey:", @"preferenceName");
      id v12 = -[__CFNumber objectForKey:](v9, "objectForKey:", @"getOrSet");
      if (!v11) {
        goto LABEL_34;
      }
      v13 = v12;
      uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSString);
      BOOL v15 = 0;
      v16 = 0LL;
      if ((objc_opt_isKindOfClass(v11, v14) & 1) == 0 || !v13) {
        goto LABEL_35;
      }
      uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v13, v17) & 1) == 0
        || ([v13 isEqual:@"get"] & 1) == 0
        && ![v13 isEqual:@"set"])
      {
        goto LABEL_34;
      }

      if ([v13 isEqual:@"set"])
      {
        id v18 = -[__CFNumber objectForKey:](v9, "objectForKey:", @"preferenceValue");
        if ([v11 isEqualToString:@"MACaptionPreferredLanguages"])
        {
          if (!v18 || sub_100003078(v18))
          {
            CFPreferencesSetAppValue( @"MACaptionPreferredLanguages",  v18,  @"com.apple.mediaaccessibility.public");
LABEL_73:
            CFPreferencesAppSynchronize(@"com.apple.mediaaccessibility.public");
            v16 = 0LL;
            BOOL v15 = 1;
LABEL_35:

            xpc_object_t reply = xpc_dictionary_create_reply(a2);
            remote_connection = xpc_dictionary_get_remote_connection(a2);
            if (v16)
            {
              xpc_object_t v27 = sub_10000342C(v16);
              if (v27)
              {
                v28 = v27;
                xpc_dictionary_set_value(reply, "result", v27);
                CFRelease(v28);
              }
            }

            xpc_dictionary_set_BOOL(reply, "success", v15);
            xpc_connection_send_message(remote_connection, reply);
            CFRelease(reply);
            goto LABEL_39;
          }
        }

        else if ([v11 isEqualToString:@"MACaptionDisplayType"])
        {
          if (v18)
          {
            v22 = +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v18 integerValue]);
          }

          else
          {
            v22 = 0LL;
          }

          CFPreferencesSetAppValue(@"MACaptionDisplayType", v22, @"com.apple.mediaaccessibility.public");
          goto LABEL_73;
        }

LABEL_34:
        v16 = 0LL;
        BOOL v15 = 0;
        goto LABEL_35;
      }

      if ([v11 isEqualToString:@"MACaptionPreferredLanguages"])
      {
        v19 = (void *)CFPreferencesCopyAppValue( @"MACaptionPreferredLanguages",  @"com.apple.mediaaccessibility.public");
        v20 = v19;
        if (v19)
        {
          if (sub_100003078(v19))
          {
            v21 = +[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v20);
LABEL_33:
            v16 = (const __CFString *)v21;
LABEL_68:
            BOOL v15 = 1;
LABEL_70:

            goto LABEL_35;
          }

          goto LABEL_69;
        }
      }

      else
      {
        CFPropertyListRef v23 = CFPreferencesCopyAppValue(@"MACaptionDisplayType", @"com.apple.mediaaccessibility.public");
        v20 = (void *)v23;
        if (v23)
        {
          if (sub_1000031B8((uint64_t)v23))
          {
            id v24 = [v20 integerValue];
            if ((unint64_t)v24 <= 3)
            {
              v21 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v24);
              goto LABEL_33;
            }
          }

LABEL_69:
          v16 = 0LL;
          BOOL v15 = 0;
          goto LABEL_70;
        }
      }

      v16 = 0LL;
      goto LABEL_68;
    }
  }

LABEL_39:
  xpc_object_t v29 = xpc_dictionary_get_value(a2, "callStatus");
  if (v29)
  {
    v30 = v29;
    if (xpc_get_type(v29) == (xpc_type_t)&_xpc_type_dictionary)
    {
      CFNumberRef v31 = sub_100003240(v30);
      uint64_t v32 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v31, v32) & 1) == 0)
      {
        BOOL v37 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v37) {
          sub_100003840(v37, v38, v39, v40, v41, v42, v43, v44);
        }
        goto LABEL_51;
      }

      id v33 = -[__CFNumber objectForKey:](v31, "objectForKey:", @"getOrSet");
      if (!v33
        || (v34 = v33, uint64_t v35 = objc_opt_class(&OBJC_CLASS___NSString), (objc_opt_isKindOfClass(v34, v35) & 1) == 0))
      {
        BOOL v45 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v45) {
          sub_100003770(v45, v46, v47, v48, v49, v50, v51, v52);
        }
        goto LABEL_51;
      }

      if ([v34 isEqual:@"set"])
      {
        id v36 = -[__CFNumber objectForKey:](v31, "objectForKey:", @"preferenceValue");
        if ((objc_opt_respondsToSelector(v36, "BOOLValue") & 1) != 0)
        {
          sub_100002F8C(v5, (int)[v36 BOOLValue]);
        }

        else
        {
          BOOL v56 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
          if (v56) {
            sub_1000037A4(v56, v57, v58, v59, v60, v61, v62, v63);
          }
        }

LABEL_51:
        goto LABEL_52;
      }

      if (![v34 isEqual:@"get"])
      {
        BOOL v64 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v64) {
          sub_10000380C(v64, v65, v66, v67, v68, v69, v70, v71);
        }
        goto LABEL_51;
      }

      xpc_connection_get_audit_token(v5, v82);
      v53 = (void *)xpc_copy_entitlement_for_token("com.apple.private.accessibility.captionCallStatusGet", v82);
      v54 = v53;
      if (v53 && xpc_BOOL_get_value(v53))
      {
        if (qword_100008058)
        {
          BOOL v55 = CFDictionaryGetCount((CFDictionaryRef)qword_100008058) > 0;
          goto LABEL_65;
        }
      }

      else
      {
        BOOL v72 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v72) {
          sub_1000037D8(v72, v73, v74, v75, v76, v77, v78, v79);
        }
      }

      BOOL v55 = 0;
LABEL_65:
      xpc_object_t v80 = xpc_dictionary_create_reply(a2);
      v81 = xpc_dictionary_get_remote_connection(a2);
      xpc_dictionary_set_BOOL(v80, "result", v55);
      xpc_dictionary_set_BOOL(v80, "success", 1);
      xpc_connection_send_message(v81, v80);
      CFRelease(v80);
      if (v54) {
        CFRelease(v54);
      }
      goto LABEL_51;
    }
  }

LABEL_52:
  objc_autoreleasePoolPop(v4);
}

void sub_100002F8C(void *key, int a2)
{
  if (qword_100008050 != -1) {
    dispatch_once(&qword_100008050, &stru_100004348);
  }
  int v4 = CFDictionaryContainsKey((CFDictionaryRef)qword_100008058, key);
  if (a2)
  {
    if (!v4)
    {
      v5 = (const void *)os_transaction_create("com.apple.accessibility.mediaAccessibility.captionCall");
      CFDictionarySetValue((CFMutableDictionaryRef)qword_100008058, key, v5);
      CFRelease(v5);
    }
  }

  else if (v4)
  {
    CFDictionaryRemoveValue((CFMutableDictionaryRef)qword_100008058, key);
  }

void sub_100003044(id a1)
{
  qword_100008058 = (uint64_t)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
}

uint64_t sub_100003078(void *a1)
{
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(a1, v2) & 1) == 0) {
    return 0LL;
  }
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v3 = [a1 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
LABEL_4:
    uint64_t v6 = 0LL;
    while (1)
    {
      if (*(void *)v11 != v5) {
        objc_enumerationMutation(a1);
      }
      v7 = *(void **)(*((void *)&v10 + 1) + 8 * v6);
      uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSString);
      if (v4 == (id)++v6)
      {
        id v4 = [a1 countByEnumeratingWithState:&v10 objects:v14 count:16];
        uint64_t result = 1LL;
        if (v4) {
          goto LABEL_4;
        }
        return result;
      }
    }
  }

  return 1LL;
}

BOOL sub_1000031B8(uint64_t a1)
{
  BOOL result = 0;
  if ((objc_opt_respondsToSelector(a1, "integerValue") & 1) != 0)
  {
    uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(a1, v2) & 1) != 0) {
      return 1;
    }
    uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(a1, v3) & 1) != 0) {
      return 1;
    }
  }

  return result;
}

void sub_100003228( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

CFNumberRef sub_100003240(void *a1)
{
  if (!a1) {
    return 0LL;
  }
  xpc_type_t type = xpc_get_type(a1);
  if (type == (xpc_type_t)&_xpc_type_int64)
  {
    valuePtr[0] = xpc_int64_get_value(a1);
    return CFNumberCreate(0LL, kCFNumberSInt64Type, valuePtr);
  }

  if (type == (xpc_type_t)&_xpc_type_string)
  {
    string_ptr = xpc_string_get_string_ptr(a1);
    return (CFNumberRef)CFStringCreateWithCString(0LL, string_ptr, 0x8000100u);
  }

  else
  {
    if (type == (xpc_type_t)&_xpc_type_array)
    {
      Mutable = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
      size_t count = xpc_array_get_count(a1);
      if (count)
      {
        size_t v7 = count;
        for (size_t i = 0LL; i != v7; ++i)
        {
          xpc_object_t value = xpc_array_get_value(a1, i);
          __int128 v10 = (const void *)sub_100003240(value);
          if (v10)
          {
            __int128 v11 = v10;
            CFArrayAppendValue(Mutable, v10);
            CFRelease(v11);
          }
        }
      }

      return Mutable;
    }

    if (type == (xpc_type_t)&_xpc_type_dictionary)
    {
      Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      valuePtr[0] = _NSConcreteStackBlock;
      valuePtr[1] = 0x40000000LL;
      valuePtr[2] = sub_1000036F4;
      valuePtr[3] = &unk_100004368;
      valuePtr[4] = Mutable;
      xpc_dictionary_apply(a1, valuePtr);
      return Mutable;
    }

    if (type != (xpc_type_t)&_xpc_type_BOOL) {
      return 0LL;
    }
    BOOL v12 = xpc_BOOL_get_value(a1);
    __int128 v13 = (CFTypeRef *)&kCFBooleanTrue;
    if (!v12) {
      __int128 v13 = (CFTypeRef *)&kCFBooleanFalse;
    }
    return (CFNumberRef)CFRetain(*v13);
  }

xpc_object_t sub_10000342C(const __CFString *a1)
{
  if (!a1) {
    return 0LL;
  }
  CFTypeID v2 = CFGetTypeID(a1);
  if (v2 != CFNumberGetTypeID())
  {
    if (v2 == CFStringGetTypeID())
    {
      LOBYTE(valuePtr[0]) = 0;
      CFStringGetCString(a1, (char *)valuePtr, 2048LL, 0x8000100u);
      return xpc_string_create((const char *)valuePtr);
    }

    if (v2 == CFArrayGetTypeID())
    {
      xpc_object_t v4 = xpc_array_create(0LL, 0LL);
      CFIndex Count = CFArrayGetCount((CFArrayRef)a1);
      if (Count >= 1)
      {
        CFIndex v6 = Count;
        for (CFIndex i = 0LL; i != v6; ++i)
        {
          ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)a1, i);
          CFNumberRef v9 = (void *)sub_10000342C(ValueAtIndex);
          if (v9)
          {
            __int128 v10 = v9;
            xpc_array_append_value(v4, v9);
            CFRelease(v10);
          }
        }
      }

      return v4;
    }

    if (v2 == CFDictionaryGetTypeID()) {
      return sub_1000035B4((const __CFDictionary *)a1);
    }
    return 0LL;
  }

  valuePtr[0] = 0LL;
  CFNumberGetValue((CFNumberRef)a1, kCFNumberSInt64Type, valuePtr);
  return xpc_int64_create(valuePtr[0]);
}

xpc_object_t sub_1000035B4(const __CFDictionary *a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  int64_t Count = CFDictionaryGetCount(a1);
  xpc_object_t v4 = (const void **)calloc(Count, 8uLL);
  uint64_t v5 = (const void **)calloc(Count, 8uLL);
  CFDictionaryGetKeysAndValues(a1, v4, v5);
  if (Count >= 1)
  {
    do
    {
      CFIndex v6 = (const __CFString *)*v4;
      if (*v4)
      {
        CFTypeID v7 = CFGetTypeID(*v4);
        if (v7 == CFStringGetTypeID())
        {
          buffer[0] = 0;
          if (CFStringGetCString(v6, buffer, 2048LL, 0x8000100u))
          {
            uint64_t v8 = (void *)sub_10000342C(*v5);
            if (v8)
            {
              CFNumberRef v9 = v8;
              xpc_dictionary_set_value(v2, buffer, v8);
              CFRelease(v9);
            }
          }
        }
      }

      --Count;
    }

    while (Count);
  }

  free(v4);
  free(v5);
  return v2;
}

uint64_t sub_1000036F4(uint64_t a1, const char *a2, uint64_t a3)
{
  if (a2)
  {
    if (a3)
    {
      CFStringRef v5 = CFStringCreateWithCString(0LL, a2, 0x8000100u);
      if (v5)
      {
        CFStringRef v6 = v5;
        CFTypeID v7 = (const void *)sub_100003240(a3);
        if (v7)
        {
          uint64_t v8 = v7;
          CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 32), v6, v7);
          CFRelease(v8);
        }

        CFRelease(v6);
      }
    }
  }

  return 1LL;
}

void sub_100003770( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000037A4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000037D8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000380C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100003840( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}