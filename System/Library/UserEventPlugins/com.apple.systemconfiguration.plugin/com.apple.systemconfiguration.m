void init_systemconfiguration()
{
  xpc_event_provider_create();
}

void sub_3988(uint64_t a1, uint64_t a2, void *a3)
{
  if (a1 == 1)
  {
    v8 = calloc(1uLL, 0x30uLL);
    *((void *)v8 + 1) = a2;
    *((_DWORD *)v8 + 10) = 2;
    string = xpc_dictionary_get_string(a3, "KeyPath");
    if (string)
    {
      v10 = CFStringCreateWithCString(0LL, string, 0x8000100u);
      if (v10)
      {
        v11 = v10;
        *((void *)v8 + 3) = CFStringCreateArrayBySeparatingStrings(0LL, v10, @"/");
        CFRelease(v11);
      }

      else
      {
        _os_assumes_log(0LL);
      }
    }

    if (xpc_dictionary_get_value(a3, "Value")) {
      *((void *)v8 + 4) = _CFXPCCreateCFObjectFromXPCObject();
    }
    v12 = xpc_dictionary_get_string(a3, "Identifier");
    if (v12) {
      v13 = CFStringCreateWithCString(0LL, v12, 0x8000100u);
    }
    else {
      v13 = 0LL;
    }
    v16 = xpc_dictionary_get_string(a3, "NotificationType");
    if (v16 && !strcmp(v16, "Commit")) {
      *((_DWORD *)v8 + 10) = 1;
    }
    v17 = SCPreferencesCreate(0LL, @"SCUserEvents", v13);
    *((void *)v8 + 2) = v17;
    if (!v17)
    {
      _os_assumes_log(0LL);
      v17 = (const __SCPreferences *)*((void *)v8 + 2);
    }

    v18.version = 0LL;
    memset(&v18.retain, 0, 24);
    v18.info = v8;
    if (!SCPreferencesSetCallback(v17, (SCPreferencesCallBack)sub_3C30, &v18)) {
      _os_assumes_log(0LL);
    }
    xpc_event_provider_get_queue();
  }

  if (a1 == 2)
  {
    v4 = &qword_4130;
    v5 = &qword_4130;
    while (1)
    {
      v5 = (uint64_t *)*v5;
      if (!v5) {
        break;
      }
      if (v5[1] == a2)
      {
        uint64_t *v4 = *v5;
        SCPreferencesSetDispatchQueue((SCPreferencesRef)v5[2], 0LL);
        CFRelease((CFTypeRef)v5[2]);
        v14 = (const void *)v5[3];
        if (v14) {
          CFRelease(v14);
        }
        v15 = (const void *)v5[4];
        if (v15) {
          CFRelease(v15);
        }
        free(v5);
        return;
      }
    }
  }
}

void sub_3BF0()
{
  if (qword_4130) {
    xpc_event_provider_token_fire();
  }
}

void sub_3C30(const __SCPreferences *a1, int a2, uint64_t a3)
{
  if (*(const __SCPreferences **)(a3 + 16) != a1) {
    sub_3D6C();
  }
  if ((*(_DWORD *)(a3 + 40) & a2) != 0)
  {
    v4 = *(const __CFArray **)(a3 + 24);
    if (!v4) {
      goto LABEL_15;
    }
    CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(a3 + 24));
    if (Count >= 1)
    {
      CFIndex v7 = Count;
      v8 = 0LL;
      for (CFIndex i = 0LL; i != v7; ++i)
      {
        ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v4, i);
        if (i)
        {
          CFTypeID v11 = CFGetTypeID(v8);
          if (v11 != CFDictionaryGetTypeID())
          {
            _os_assumes_log(0LL);
            goto LABEL_18;
          }

          Value = CFDictionaryGetValue((CFDictionaryRef)v8, ValueAtIndex);
        }

        else
        {
          Value = SCPreferencesGetValue(a1, ValueAtIndex);
        }

        v8 = Value;
        if (!Value) {
          goto LABEL_18;
        }
      }

      v13 = *(const void **)(a3 + 32);
      if (!v13 || CFEqual(Value, v13))
      {
        SCPreferencesSynchronize(a1);
LABEL_15:
        xpc_event_provider_token_fire();
      }
    }

LABEL_18:
    SCPreferencesSynchronize(a1);
  }

void sub_3D6C()
{
  uint64_t v0 = _os_assert_log(0LL);
  v1 = (const __CFArray *)_os_crash(v0);
  __break(1u);
  CFArrayGetCount(v1);
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