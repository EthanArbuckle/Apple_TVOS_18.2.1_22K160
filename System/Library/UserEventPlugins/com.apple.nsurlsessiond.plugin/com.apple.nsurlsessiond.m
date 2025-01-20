void init_nsurlsessiond_events()
{
  qword_41D8 = (uint64_t)CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  qword_41E0 = (uint64_t)CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  xpc_event_provider_create();
}

void sub_37C0(uint64_t a1, uint64_t a2, xpc_object_t object)
{
  uint64_t valuePtr = a2;
  if (qword_41F0 != -1) {
    dispatch_once(&qword_41F0, &stru_4138);
  }
  if (a1 == 2)
  {
    syslog(5, "nsurlsessiond_events plugin: removing token %llu", a2);
    CFNumberRef v10 = CFNumberCreate(kCFAllocatorDefault, kCFNumberLongLongType, &valuePtr);
    if (!v10) {
      goto LABEL_17;
    }
    CFStringRef v8 = (CFStringRef)v10;
    Value = CFDictionaryGetValue((CFDictionaryRef)qword_41E0, v10);
    if (Value) {
      CFDictionaryRemoveValue((CFMutableDictionaryRef)qword_41D8, Value);
    }
    CFDictionaryRemoveValue((CFMutableDictionaryRef)qword_41E0, v8);
LABEL_16:
    CFRelease(v8);
    goto LABEL_17;
  }

  if (a1 == 1)
  {
    if (object)
    {
      if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_dictionary)
      {
        string = xpc_dictionary_get_string(object, kNSURLSessionLaunchOnDemandClientIdentifierKey);
        if (string)
        {
          v7 = string;
          syslog(5, "nsurlsessiond_events plugin: adding token %llu for client %s", a2, string);
          CFStringRef v8 = CFStringCreateWithCString(kCFAllocatorDefault, v7, 0x8000100u);
          CFNumberRef v9 = CFNumberCreate(kCFAllocatorDefault, kCFNumberLongLongType, &valuePtr);
          CFDictionarySetValue((CFMutableDictionaryRef)qword_41D8, v8, v9);
          CFDictionarySetValue((CFMutableDictionaryRef)qword_41E0, v9, v8);
          if (v9) {
            CFRelease(v9);
          }
          if (v8) {
            goto LABEL_16;
          }
        }
      }
    }
  }

LABEL_17:
  sub_3960();
}

void sub_3960()
{
  if (qword_41F8)
  {
    xpc_object_t v0 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_int64(v0, "com.apple.nsurlsessiond-events.message-type", 2LL);
    v1 = (void *)_CFXPCCreateXPCObjectFromCFObject(qword_41D8);
    xpc_dictionary_set_value(v0, "com.apple.nsurlsessiond-events.registered-clients", v1);
    xpc_connection_send_message((xpc_connection_t)qword_41F8, v0);
    xpc_release(v1);
    xpc_release(v0);
  }
}

void sub_39FC(id a1)
{
}

void sub_3A48()
{
  if (qword_41F8)
  {
    xpc_connection_cancel((xpc_connection_t)qword_41F8);
    xpc_release((xpc_object_t)qword_41F8);
    qword_41F8 = 0LL;
  }

  xpc_event_provider_get_queue();
}

void sub_3AB8(id a1, void *a2)
{
  if (xpc_get_type(a2) == (xpc_type_t)&_xpc_type_dictionary
    && xpc_dictionary_get_int64(a2, "com.apple.nsurlsessiond-events.message-type") == 1)
  {
    string = xpc_dictionary_get_string(a2, kNSURLSessionLaunchOnDemandClientIdentifierKey);
    v4 = xpc_dictionary_get_string(a2, kNSURLSessionLaunchOnDemandSessionIdentifierKey);
    if (string)
    {
      v5 = v4;
      CFStringRef v6 = CFStringCreateWithCString(kCFAllocatorDefault, string, 0x8000100u);
      Value = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)qword_41D8, v6);
      if (Value)
      {
        CFNumberGetValue(Value, kCFNumberLongType, &valuePtr);
        xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
        if (v5) {
          xpc_dictionary_set_string(v8, kNSURLSessionLaunchOnDemandSessionIdentifierKey, v5);
        }
        syslog(5, "calling xpc_event_provider_token_fire for client %s session %s", string, v5);
        xpc_event_provider_token_fire();
      }

      if (v6) {
        CFRelease(v6);
      }
    }
  }

void sub_3BF4(id a1, int a2)
{
  if (!qword_41F8)
  {
    syslog(3, "nsurlsessiond launched and we didn't have an xpc connection-- creating a new one");
    sub_3A48();
  }

  sub_3960();
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