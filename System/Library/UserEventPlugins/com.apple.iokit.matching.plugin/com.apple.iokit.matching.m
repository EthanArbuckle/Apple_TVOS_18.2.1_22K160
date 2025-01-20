void init_iokit_matching_module(uint64_t a1)
{
  *(void *)calloc(1uLL, 0x18uLL) = a1;
  xpc_event_provider_create();
}

void sub_31A8(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1 == 2)
  {
    v26 = *(void **)(a4 + 16);
    v24 = (void **)(a4 + 16);
    v25 = v26;
    if (v26)
    {
      do
      {
        v27 = (void *)*v25;
        if (v25[2] == a2)
        {
          sub_35D8(7, "%s - remove event for token %lld", v12, v13, v14, v15, v16, v17, (char)"removeIOKitMatchEvent");
          v34 = *v24;
          v35 = v24;
          while (v34 != v25)
          {
            v35 = v34;
            v34 = (void *)*v34;
          }

          void *v35 = *v25;
          sub_35D8( 7,  "%s - token %lld release firstMatchIterator %u",  v28,  v29,  v30,  v31,  v32,  v33,  (char)"removeIOKitMatchEvent");
          IOObjectRelease(*((_DWORD *)v25 + 6));
          v42 = (_DWORD *)v25[4];
          if (v42)
          {
            do
            {
              v43 = (void *)v25[4];
              v44 = v25 + 4;
              while (v43 != (void *)v42)
              {
                v44 = v43;
                v43 = (void *)*v43;
              }

              v45 = *(_DWORD **)v42;
              void *v44 = *(void *)v42;
              sub_35D8( 7,  "%s - token %lld release notificationObj %u",  v36,  v37,  v38,  v39,  v40,  v41,  (char)"removeIOKitMatchEvent");
              IOObjectRelease(v42[4]);
              sub_35D8( 7,  "%s - token %lld free iokit_matching_notification_context %p",  v46,  v47,  v48,  v49,  v50,  v51,  (char)"removeIOKitMatchEvent");
              free(v42);
              v42 = v45;
            }

            while (v45);
          }

          sub_35D8( 7,  "%s - token %lld free iokit_matching_event %p",  v36,  v37,  v38,  v39,  v40,  v41,  (char)"removeIOKitMatchEvent");
          free(v25);
        }

        v25 = v27;
      }

      while (v27);
    }
  }

  else if (a1 == 1)
  {
    sub_35D8(7, "%s - for token %lld", v12, v13, v14, v15, v16, v17, (char)"addIOKitMatchEvent");
    if (xpc_get_type(a3) != (xpc_type_t)&_xpc_type_dictionary)
    {
      CFGetTypeID(a3);
      sub_35D8(3, "%s - invalid launch event type %ld", v18, v19, v20, v21, v22, v23, (char)"addIOKitMatchEvent");
      return;
    }

    v52 = (const __CFDictionary *)_CFXPCCreateCFObjectFromXPCObject(a3);
    if (!v52)
    {
      sub_35D8( 3,  "%s - _CFXPCCreateCFObjectFromXPCObject failed",  v53,  v54,  v55,  v56,  v57,  v58,  (char)"addIOKitMatchEvent");
      return;
    }

    v59 = v52;
    MutableCopy = CFDictionaryCreateMutableCopy(0LL, 0LL, v52);
    CFRelease(v59);
    if (!MutableCopy)
    {
      sub_35D8(3, "%s - CFDictionaryCreateMutableCopy failed", v61, v62, v63, v64, v65, v66, (char)"addIOKitMatchEvent");
      return;
    }

    v67 = calloc(1uLL, 0x28uLL);
    v67[1] = a4;
    v67[2] = a2;
    *((_DWORD *)v67 + 6) = 0;
    *((_BYTE *)v67 + 28) = 0;
    v67[4] = 0LL;
    CFBooleanRef Value = (CFBooleanRef)CFDictionaryGetValue(MutableCopy, @"IOMatchLaunchStream");
    *((_BYTE *)v67 + 28) = Value == kCFBooleanTrue;
    if (Value) {
      CFDictionaryRemoveValue(MutableCopy, @"IOMatchLaunchStream");
    }
    v69 = (const __CFBoolean *)CFDictionaryGetValue(MutableCopy, @"IOMatchAll");
    if (v69 == kCFBooleanTrue) {
      v70 = "IOServiceMatched";
    }
    else {
      v70 = "IOServiceFirstMatch";
    }
    if (v69) {
      CFDictionaryRemoveValue(MutableCopy, @"IOMatchAll");
    }
    v71 = (const __CFString *)CFDictionaryGetValue(MutableCopy, @"IONotificationType");
    if (v71)
    {
      v72 = v71;
      CFTypeID TypeID = CFStringGetTypeID();
      if (TypeID == CFGetTypeID(v72))
      {
        CFIndex Length = CFStringGetLength(v72);
        CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
        CFIndex v76 = CFStringGetMaximumSizeForEncoding(Length, SystemEncoding) + 4;
        v77 = (char *)malloc(v76);
        if (v77)
        {
          if (CFStringGetCString(v72, v77, v76, 0)) {
            v70 = v77;
          }
        }
      }

      else
      {
        v77 = 0LL;
      }

      CFDictionaryRemoveValue(MutableCopy, @"IONotificationType");
    }

    else
    {
      v77 = 0LL;
    }

    if (IOServiceAddMatchingNotification( (IONotificationPortRef)qword_4178,  v70,  MutableCopy,  (IOServiceMatchingCallback)sub_3648,  v67,  (io_iterator_t *)v67 + 6))
    {
      sub_35D8( 3,  "%s - IOServiceAddMatchingNotification failed",  v78,  v79,  v80,  v81,  v82,  v83,  (char)"addIOKitMatchEvent");
      v84 = (char *)v67;
LABEL_44:
      free(v84);
      return;
    }

    sub_35D8( 7,  "%s - for token %lld add iokit_matching_event %p ",  v78,  v79,  v80,  v81,  v82,  v83,  (char)"addIOKitMatchEvent");
    void *v67 = *(void *)(a4 + 16);
    *(void *)(a4 + 16) = v67;
    sub_3648((uint64_t)v67, *((_DWORD *)v67 + 6), v85, v86, v87, v88, v89, v90);
    if (v77)
    {
      v84 = v77;
      goto LABEL_44;
    }
  }

  else
  {
    sub_35D8(3, "%s - invalid launch event action %ld", v12, v13, v14, v15, v16, v17, (char)"eventCallback");
  }
}

void sub_35D8( int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  v12[0] = 0LL;
  v12[1] = &a9;
  vasprintf(v12, a2, &a9);
  v11 = v12[0];
  if (!v12[0]) {
    v11 = a2;
  }
  asl_log(0LL, 0LL, a1, "%s", v11);
  if (v12[0]) {
    free(v12[0]);
  }
}

uint64_t sub_3648( uint64_t a1, io_iterator_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = IOIteratorNext(a2);
  if ((_DWORD)result)
  {
    io_registry_entry_t v17 = result;
    do
    {
      if (*(_BYTE *)(a1 + 28))
      {
        IORegistryEntryGetRegistryEntryID(v17, &entryID);
        xpc_object_t v18 = xpc_dictionary_create(0LL, 0LL, 0LL);
        xpc_dictionary_set_uint64(v18, "IOMatchLaunchServiceID", entryID);
        sub_35D8(7, "%s - stream fire for token %lld", v19, v20, v21, v22, v23, v24, (char)"firstMatchIteratorCallback");
        xpc_event_provider_token_fire();
      }

      if (IOObjectConformsTo(v17, "IOService"))
      {
        v25 = (io_object_t *)calloc(1uLL, 0x18uLL);
        v25[4] = 0;
        *(void *)v25 = *(void *)(a1 + 32);
        *((void *)v25 + 1) = a1;
        *(void *)(a1 + 32) = v25;
        sub_35D8( 7,  "%s - token %lld new iokit_matching_notification_context %p",  v26,  v27,  v28,  v29,  v30,  v31,  (char)"recordMatch");
        if (IOServiceAddInterestNotification( (IONotificationPortRef)qword_4178,  v17,  "IOGeneralInterest",  (IOServiceInterestCallback)sub_3880,  v25,  v25 + 4))
        {
          sub_35D8( 3,  "%s - IOServiceAddInterestNotification failed for token %lld",  v32,  v33,  v34,  v35,  v36,  v37,  (char)"recordMatch");
          uint64_t v38 = *(io_object_t **)(a1 + 32);
          uint64_t v39 = (io_object_t *)(a1 + 32);
          while (v38 != v25)
          {
            uint64_t v39 = v38;
            uint64_t v38 = *(io_object_t **)v38;
          }

          *(void *)uint64_t v39 = *(void *)v25;
          free(v25);
        }

        else
        {
          sub_35D8(7, "%s - token %lld new notificationObj %u", v32, v33, v34, v35, v36, v37, (char)"recordMatch");
        }
      }

      IOObjectRelease(v17);
      uint64_t result = IOIteratorNext(a2);
      io_registry_entry_t v17 = result;
    }

    while ((_DWORD)result);
  }

  if (!*(_BYTE *)(a1 + 28))
  {
    sub_35D8( 7,  "%s - set state runJob %d for token %lld",  v11,  v12,  v13,  v14,  v15,  v16,  (char)"firstMatchIteratorCallback");
    xpc_event_provider_token_set_state();
  }

  return result;
}

void sub_3880( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((_DWORD)a3 == -536870896)
  {
    sub_35D8(7, "%s", a3, a4, a5, a6, a7, a8, (char)"interestNotificationCallback");
    uint64_t v15 = a1[1];
    if (v15)
    {
      uint64_t v16 = (void *)(v15 + 32);
      for (i = *(void **)(v15 + 32); i != a1; i = (void *)*i)
        uint64_t v16 = i;
      *uint64_t v16 = *a1;
      if (*((_DWORD *)a1 + 4))
      {
        sub_35D8( 7,  "%s - token %lld release notificationObj %u",  v9,  v10,  v11,  v12,  v13,  v14,  (char)"interestNotificationCallback");
        IOObjectRelease(*((_DWORD *)a1 + 4));
      }

      sub_35D8( 7,  "%s - token %lld free iokit_matching_notification_context %p",  v9,  v10,  v11,  v12,  v13,  v14,  (char)"interestNotificationCallback");
      free(a1);
      sub_35D8(7, "%s - set state runJob %d", v18, v19, v20, v21, v22, v23, (char)"interestNotificationCallback");
      xpc_event_provider_token_set_state();
    }

    sub_35D8(3, "%s - owner is NULL", v9, v10, v11, v12, v13, v14, (char)"interestNotificationCallback");
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

void xpc_event_provider_token_set_state()
{
  while (1)
    ;
}