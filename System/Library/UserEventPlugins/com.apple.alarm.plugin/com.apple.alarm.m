void power_set_handler(dispatch_queue_s *a1, void *refcon)
{
  io_object_t notifier;
  if (qword_45C0) {
    sub_2F94();
  }
  dword_45C8 = IORegisterForSystemPower( refcon,  (IONotificationPortRef *)&qword_45C0,  (IOServiceInterestCallback)sub_10C8,  &notifier);
  if (!dword_45C8) {
    sub_2F94();
  }
  IONotificationPortSetDispatchQueue((IONotificationPortRef)qword_45C0, a1);
}

void sub_10C8( uint64_t (*a1)(uint64_t, uint64_t, int *, uint64_t *, void **), uint64_t a2, int a3, intptr_t a4)
{
  int v11 = 0;
  v9 = 0LL;
  uint64_t v10 = 0LL;
  switch(a3)
  {
    case -536870288:
      v6 = (void *)a1(3758097008LL, 0LL, &v11, &v10, &v9);
      v5 = v6;
      if (!v6) {
        goto LABEL_8;
      }
      string_ptr = xpc_string_get_string_ptr(v6);
      if (!string_ptr || strcmp(string_ptr, "CancelSleep")) {
        goto LABEL_8;
      }
      IOReturn v8 = IOCancelPowerChange(dword_45C8, a4);
      if (v8) {
LABEL_9:
      }
        _os_assumes_log(v8);
      break;
    case -536870144:
      v5 = (void *)a1(3758097152LL, 31LL, &v11, &v10, &v9);
      break;
    case -536870272:
      v5 = (void *)a1(3758097024LL, 0LL, &v11, &v10, &v9);
LABEL_8:
      IOReturn v8 = IOAllowPowerChange(dword_45C8, a4);
      if (!v8) {
        break;
      }
      goto LABEL_9;
    default:
      goto LABEL_13;
  }

  if (v5) {
    xpc_release(v5);
  }
LABEL_13:
  free(v9);
}

uint64_t sub_1204(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = *(void *)(a2 + 32);
  unint64_t v4 = *(void *)(a3 + 32);
  BOOL v5 = v3 > v4;
  if (v3 >= v4) {
    unsigned int v6 = 0;
  }
  else {
    unsigned int v6 = -1;
  }
  if (v5) {
    return 1LL;
  }
  else {
    return v6;
  }
}

uint64_t sub_121C(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  unint64_t v3 = *(void *)(a2 + 32);
  BOOL v4 = v3 > *a3;
  if (v3 >= *a3) {
    unsigned int v5 = 0;
  }
  else {
    unsigned int v5 = -1;
  }
  if (v4) {
    return 1LL;
  }
  else {
    return v5;
  }
}

void init_alarm_module(uint64_t a1)
{
  qword_45D0 = a1;
  xpc_event_provider_create();
}

void sub_13D8(uint64_t a1, uint64_t a2, void *a3)
{
  if (a1 == 2)
  {
    v13 = (void **)sub_2450(a2, 0LL);
    if (v13)
    {
      v14 = v13;
      v15 = (os_log_s *)qword_45E8;
      if (os_log_type_enabled((os_log_t)qword_45E8, OS_LOG_TYPE_INFO))
      {
        v16 = (const char *)v14[2];
        if (!v16) {
          v16 = "NULL";
        }
        *(_DWORD *)buf = 136446466;
        v35 = v16;
        __int16 v36 = 2048;
        uint64_t v37 = a2;
        _os_log_impl( &dword_0,  v15,  OS_LOG_TYPE_INFO,  "Received request to remove alarm %{public}s with token %llu\n",  buf,  0x16u);
      }

      free(v14[2]);
      free(v14);
    }

    else
    {
      sub_30C8(a2);
    }

    goto LABEL_15;
  }

  if (a1 == 1)
  {
    unsigned int v5 = calloc(1uLL, 0x48uLL);
    uint64_t v6 = qword_45B8++;
    void *v5 = a2;
    v5[1] = v6;
    xpc_object_t value = xpc_dictionary_get_value(a3, "Date");
    if (!value)
    {
      if (os_log_type_enabled((os_log_t)qword_45E8, OS_LOG_TYPE_ERROR)) {
        sub_2FAC();
      }
      goto LABEL_43;
    }

    IOReturn v8 = value;
    string = xpc_dictionary_get_string(a3, "Type");
    if (string) {
      uint64_t v10 = string;
    }
    else {
      uint64_t v10 = "Walltime";
    }
    xpc_object_t v11 = xpc_dictionary_get_value(a3, "ShouldWake");
    if (v11) {
      BOOL v12 = xpc_BOOL_get_value(v11);
    }
    else {
      BOOL v12 = 1;
    }
    *((_BYTE *)v5 + 25) = v12;
    if (!strcasecmp(v10, "Walltime") && xpc_get_type(v8) == (xpc_type_t)&_xpc_type_date)
    {
      *((_DWORD *)v5 + 7) = 0;
      uint64_t v20 = xpc_date_get_value(v8);
    }

    else
    {
      if (!strcasecmp(v10, "Uptime") && xpc_get_type(v8) == (xpc_type_t)&_xpc_type_uint64)
      {
        *((_DWORD *)v5 + 7) = 1;
        v5[4] = xpc_uint64_get_value(v8);
        *((_BYTE *)v5 + 25) = 0;
LABEL_34:
        *((_BYTE *)v5 + 24) = xpc_dictionary_get_BOOL(a3, "UserVisible");
        if (!xpc_get_event_name("com.apple.alarm", a2, buf))
        {
          v29 = (os_log_s *)qword_45E8;
          if (os_log_type_enabled((os_log_t)qword_45E8, OS_LOG_TYPE_ERROR)) {
            sub_2FD8(a2, v29);
          }
          goto LABEL_43;
        }

        v21 = strdup((const char *)buf);
        v5[2] = v21;
        v22 = (os_log_s *)qword_45E8;
        if (os_log_type_enabled((os_log_t)qword_45E8, OS_LOG_TYPE_DEFAULT))
        {
          __uint64_t v23 = sub_2320(*((unsigned int *)v5 + 7));
          __uint64_t v24 = v5[4];
          unint64_t v25 = (v24 - v23) / 0x3B9ACA00;
          BOOL v26 = v23 > v24;
          unint64_t v27 = (v23 - v24) / 0x3B9ACA00;
          if (v26) {
            unint64_t v28 = -(uint64_t)v27;
          }
          else {
            unint64_t v28 = v25;
          }
          int v30 = 136446466;
          v31 = v21;
          __int16 v32 = 2048;
          unint64_t v33 = v28;
          _os_log_impl( &dword_0,  v22,  OS_LOG_TYPE_DEFAULT,  "Registering job %{public}s due in %lld seconds.",  (uint8_t *)&v30,  0x16u);
        }

        sub_237C((uint64_t)v5);
        goto LABEL_15;
      }

      if (strcasecmp(v10, "Monotonic") || xpc_get_type(v8) != (xpc_type_t)&_xpc_type_uint64)
      {
        v18 = xpc_copy_description(v8);
        v19 = (os_log_s *)qword_45E8;
        if (os_log_type_enabled((os_log_t)qword_45E8, OS_LOG_TYPE_ERROR)) {
          sub_3048((uint64_t)v10, (uint64_t)v18, v19);
        }
        free(v18);
LABEL_43:
        free(v5);
        return;
      }

      *((_DWORD *)v5 + 7) = 2;
      uint64_t v20 = xpc_uint64_get_value(v8);
    }

    v5[4] = v20;
    goto LABEL_34;
  }

LABEL_15:
  __uint64_t v17 = 0LL;
  do
  {
    sub_17B8(v17, 0);
    __uint64_t v17 = (v17 + 1);
  }

  while ((_DWORD)v17 != 3);
}

void sub_17AC(uint64_t a1)
{
}

void sub_17B8(__uint64_t a1, int a2)
{
  uint64_t v4 = a1;
  unsigned int v5 = (rb_tree_t *)((char *)&unk_45F0 + 64 * (unint64_t)a1);
  if (!rb_tree_count(v5))
  {
    dispatch_source_set_timer(qword_46B0[v4], 0xFFFFFFFFFFFFFFFFLL, 0LL, 0LL);
    return;
  }

  uint64_t v48 = v4;
  int v47 = a1;
  __uint64_t v50 = sub_2320(a1);
  node_leq = (const char **)rb_tree_find_node_leq(v5, &v50);
  v49 = node_leq;
  if (node_leq)
  {
    v7 = 0LL;
    do
    {
      if (!*((_BYTE *)node_leq + 40))
      {
        IOReturn v8 = (os_log_s *)qword_45E8;
        if (os_log_type_enabled((os_log_t)qword_45E8, OS_LOG_TYPE_DEFAULT))
        {
          v9 = node_leq[2];
          uint64_t v10 = node_leq[4];
          __uint64_t v11 = sub_2320(*((unsigned int *)node_leq + 7));
          unint64_t v12 = (v11 - (unint64_t)v10) / 0x3B9ACA00;
          *(_DWORD *)buf = 136446466;
          *(void *)&uint8_t buf[4] = v9;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v12;
          _os_log_impl( &dword_0,  v8,  OS_LOG_TYPE_DEFAULT,  "Firing event %{public}s which was due %lld sec ago.",  buf,  0x16u);
        }

        *((_BYTE *)node_leq + 40) = 1;
        v14 = *node_leq;
        v13 = node_leq[1];
        v15 = strdup(node_leq[2]);
        AssertionID[0] = 0;
        CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        if (Mutable)
        {
          __uint64_t v17 = Mutable;
          v18 = CFStringCreateWithCString(0LL, v15, 0x8000100u);
          if (v18)
          {
            CFDictionarySetValue(v17, @"AssertName", v18);
            CFRelease(v18);
            CFDictionarySetValue(v17, @"PlugInBundleID", @"com.apple.alarm");
            CFDictionarySetValue(v17, @"AssertType", @"PreventUserIdleSystemSleep");
            CFDictionarySetValue(v17, @"TimeoutAction", @"TimeoutActionTurnOff");
            LODWORD(valuePtr) = 30;
            v18 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
            if (v18)
            {
              CFDictionarySetValue(v17, @"TimeoutSeconds", v18);
              CFRelease(v18);
              LODWORD(valuePtr) = 255;
              v18 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
              if (v18)
              {
                CFDictionarySetValue(v17, @"AssertLevel", v18);
                CFRelease(v18);
                LODWORD(v18) = IOPMAssertionCreateWithProperties(v17, AssertionID);
                if ((_DWORD)v18) {
                  AssertionID[0] = 0;
                }
              }
            }
          }

          v19 = (os_log_s *)qword_45E8;
          if (os_log_type_enabled((os_log_t)qword_45E8, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315650;
            *(void *)&uint8_t buf[4] = v15;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = (_DWORD)v18;
            *(_WORD *)&buf[18] = 1024;
            *(_DWORD *)&buf[20] = AssertionID[0];
            _os_log_impl( &dword_0,  v19,  OS_LOG_TYPE_INFO,  "power_create_temporary_fire_assertion: name %s, ret: %x, id: %d",  buf,  0x18u);
          }

          CFRelease(v17);
          IOPMAssertionID v20 = AssertionID[0];
        }

        else
        {
          IOPMAssertionID v20 = 0;
        }

        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&buf[8] = 0x40000000LL;
        *(void *)&buf[16] = sub_2584;
        v56 = &unk_42C8;
        IOPMAssertionID v60 = v20;
        v57 = v14;
        v58 = v13;
        v59 = v15;
        v53[0] = 0LL;
        v53[1] = v53;
        v53[2] = 0x2000000000LL;
        char v54 = 0;
        xpc_event_provider_get_queue();
      }

      if (a2 && *((_BYTE *)node_leq + 25)) {
        v7 = node_leq;
      }
      node_leq = (const char **)rb_tree_iterate(v5, node_leq, 0);
    }

    while (node_leq);
    node_leq = v49;
    if (v7)
    {
      v21 = (os_log_s *)qword_45E8;
      if (os_log_type_enabled((os_log_t)qword_45E8, OS_LOG_TYPE_DEFAULT))
      {
        v22 = v7[2];
        __uint64_t v23 = v7[4];
        *(_DWORD *)buf = 136446466;
        *(void *)&uint8_t buf[4] = v22;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v23;
        _os_log_impl( &dword_0,  v21,  OS_LOG_TYPE_DEFAULT,  "System woke up due to %{public}s which was due at: %lld",  buf,  0x16u);
      }
    }
  }

  __uint64_t v24 = rb_tree_iterate(v5, node_leq, 1u);
  if (v24)
  {
    unint64_t v25 = v24;
    do
    {
      if (*((_BYTE *)v25 + 40))
      {
        BOOL v26 = (os_log_s *)qword_45E8;
        if (os_log_type_enabled((os_log_t)qword_45E8, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v27 = v25[2];
          unint64_t v28 = v25[4];
          __uint64_t v29 = sub_2320(*((unsigned int *)v25 + 7));
          unint64_t v30 = (v29 - v28) / 0x3B9ACA00;
          *(_DWORD *)buf = 136446466;
          *(void *)&uint8_t buf[4] = v27;
          if (v28 > v29) {
            unint64_t v30 = -(uint64_t)((v28 - v29) / 0x3B9ACA00);
          }
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v30;
          _os_log_impl( &dword_0,  v26,  OS_LOG_TYPE_DEFAULT,  "Un-firing event %{public}s which is due in %lld sec.",  buf,  0x16u);
        }

        *((_BYTE *)v25 + 40) = 0;
      }

      unint64_t v25 = rb_tree_iterate(v5, v25, 1u);
    }

    while (v25);
  }

  v31 = rb_tree_iterate(v5, v49, 1u);
  if (!v31)
  {
    dispatch_source_set_timer(qword_46B0[v48], 0xFFFFFFFFFFFFFFFFLL, 0LL, 0LL);
    uint64_t v46 = qword_45E8;
    if (!os_log_type_enabled((os_log_t)qword_45E8, OS_LOG_TYPE_INFO)) {
      return;
    }
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v47;
    v43 = "Clearing dispatch timer of type %d";
    v44 = (os_log_s *)v46;
    uint32_t v45 = 8;
    goto LABEL_52;
  }

  unint64_t v33 = v31;
  unint64_t v34 = v31[4];
  __uint64_t v35 = v50;
  int64_t v36 = v34 - v50;
  if ((((v34 - __PAIR128__(v32, v50)) >> 64) & 1) != (v34 - v50) >> 63)
  {
    uint64_t v37 = (os_log_s *)qword_45E8;
    if (os_log_type_enabled((os_log_t)qword_45E8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( &dword_0,  v37,  OS_LOG_TYPE_ERROR,  "Detected subtraction overflow while setting dispatch timer.",  buf,  2u);
      unint64_t v34 = v33[4];
      __uint64_t v35 = v50;
    }

    if (v34 > v35) {
      int64_t v36 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      int64_t v36 = 0x8000000000000000LL;
    }
  }

  dispatch_time_t v38 = dispatch_time(qword_36D0[v48], v36);
  dispatch_source_set_timer(qword_46B0[v48], v38, 0xFFFFFFFFFFFFFFFFLL, 0xB2D05E00uLL);
  uint64_t v39 = qword_45E8;
  if (os_log_type_enabled((os_log_t)qword_45E8, OS_LOG_TYPE_INFO))
  {
    uint64_t v40 = v33[2];
    unint64_t v41 = v33[4];
    if (v50 > v41) {
      unint64_t v42 = -(uint64_t)((v50 - v41) / 0x3B9ACA00);
    }
    else {
      unint64_t v42 = (v41 - v50) / 0x3B9ACA00;
    }
    *(_DWORD *)buf = 136446466;
    *(void *)&uint8_t buf[4] = v40;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v42;
    v43 = "Setting timer for %{public}s in %lld seconds.";
    v44 = (os_log_s *)v39;
    uint32_t v45 = 22;
LABEL_52:
    _os_log_impl(&dword_0, v44, OS_LOG_TYPE_INFO, v43, buf, v45);
  }
}

unint64_t *sub_1F68(int a1, uint64_t a2)
{
  uint64_t v4 = (os_log_s *)qword_45E8;
  if (os_log_type_enabled((os_log_t)qword_45E8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109376;
    LODWORD(v21[0]) = a1;
    WORD2(v21[0]) = 1024;
    *(_DWORD *)((char *)v21 + 6) = a2;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "power_event, msg: %u caps: %u", buf, 0xEu);
  }

  __uint64_t v5 = 0LL;
  do
  {
    sub_17B8(v5, a1 == -536870144);
    __uint64_t v5 = (v5 + 1);
  }

  while ((_DWORD)v5 != 3);
  if (a1 == -536870288)
  {
    uint64_t v6 = 0LL;
    char v7 = 0;
    do
    {
      IOReturn v8 = rb_tree_iterate((rb_tree_t *)&unk_45F0 + v6, 0LL, 0);
      if (v8)
      {
        v9 = v8;
        while (!*((_BYTE *)v9 + 40))
        {
          v9 = rb_tree_iterate((rb_tree_t *)&unk_45F0 + v6, v9, 0);
          if (!v9) {
            goto LABEL_18;
          }
        }

        uint64_t v10 = (os_log_s *)qword_45E8;
        if (os_log_type_enabled((os_log_t)qword_45E8, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v11 = *((void *)v9 + 2);
          *(_DWORD *)buf = 136446210;
          v21[0] = v11;
          _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Alarm event %{public}s is fired and active.", buf, 0xCu);
        }

        char v7 = 1;
      }

LABEL_18:
      ++v6;
    }

    while (v6 != 3);
    if ((v7 & 1) != 0) {
      return (unint64_t *)xpc_string_create("CancelSleep");
    }
  }

  else if (a1 != -536870080 || (IOPMIsASleep(a2) & 1) == 0)
  {
    return 0LL;
  }

  double v13 = CFAbsoluteTimeGetCurrent() + 30.0;
  if (*(double *)&qword_46C8 >= v13)
  {
    v14 = CFDateCreate(0LL, *(CFAbsoluteTime *)&qword_46C8);
    if (IOPMCancelScheduledPowerEvent(v14, (CFStringRef)qword_46D0, @"wake")
      && os_log_type_enabled((os_log_t)qword_45E8, OS_LOG_TYPE_ERROR))
    {
      sub_31D4();
      if (!v14) {
        goto LABEL_26;
      }
    }

    else if (!v14)
    {
LABEL_26:
      qword_46C8 = 0LL;
      if (qword_46D0) {
        CFRelease((CFTypeRef)qword_46D0);
      }
      qword_46D0 = 0LL;
      goto LABEL_29;
    }

    CFRelease(v14);
    goto LABEL_26;
  }

LABEL_29:
  v15 = CFDateCreate(0LL, *(CFAbsoluteTime *)&qword_46D8);
  IOReturn v16 = IOPMCancelScheduledPowerEvent(v15, (CFStringRef)qword_46E0, @"wake");
  if (v16 && (v16 & 0xE00002F0) == 0 && os_log_type_enabled((os_log_t)qword_45E8, OS_LOG_TYPE_ERROR))
  {
    sub_316C();
    if (!v15) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }

  if (v15) {
LABEL_34:
  }
    CFRelease(v15);
LABEL_35:
  qword_46D8 = 0LL;
  if (qword_46E0) {
    CFRelease((CFTypeRef)qword_46E0);
  }
  qword_46E0 = 0LL;
LABEL_38:
  __uint64_t v17 = sub_2924(0);
  if (v17)
  {
    v18 = v17;
    sub_29F8((uint64_t)v17);
    if (!*((_BYTE *)v18 + 24))
    {
      result = sub_2924(1);
      if (!result) {
        return result;
      }
      sub_29F8((uint64_t)result);
    }
  }

  else
  {
    v19 = (os_log_s *)qword_45E8;
    if (os_log_type_enabled((os_log_t)qword_45E8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, "No upcoming events, not scheduling wake.", buf, 2u);
    }
  }

  return 0LL;
}

void sub_22EC()
{
  __uint64_t v0 = 0LL;
  do
  {
    sub_17B8(v0, 0);
    __uint64_t v0 = (v0 + 1);
  }

  while ((_DWORD)v0 != 3);
}

__uint64_t sub_2320(__uint64_t result)
{
  switch((_DWORD)result)
  {
    case 2:
      return clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    case 1:
      return clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
    case 0:
      xpc_object_t v1 = xpc_date_create_from_current();
      int64_t value = xpc_date_get_value(v1);
      xpc_release(v1);
      return value;
  }

  return result;
}

void *sub_237C(uint64_t a1)
{
  v2 = (os_log_s *)qword_45E8;
  if (os_log_type_enabled((os_log_t)qword_45E8, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 16);
    int v6 = 136446210;
    uint64_t v7 = v3;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "Adding alarm %{public}s", (uint8_t *)&v6, 0xCu);
  }

  for (uint64_t i = *(unsigned int *)(a1 + 28); ; uint64_t i = *(unsigned int *)(a1 + 28))
  {
    result = rb_tree_insert_node((rb_tree_t *)&unk_45F0 + i, (void *)a1);
    --*(void *)(a1 + 32);
  }

  return result;
}

void *sub_2450(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = 0LL;
  while (1)
  {
    __uint64_t v5 = rb_tree_iterate((rb_tree_t *)&unk_45F0 + v4, 0LL, 1u);
    if (v5) {
      break;
    }
LABEL_8:
    if (++v4 == 3) {
      return 0LL;
    }
  }

  int v6 = v5;
  while (*v6 != a1 || a2 && v6[1] != a2)
  {
    int v6 = rb_tree_iterate((rb_tree_t *)&unk_45F0 + v4, v6, 1u);
    if (!v6) {
      goto LABEL_8;
    }
  }

  uint64_t v7 = (os_log_s *)qword_45E8;
  if (os_log_type_enabled((os_log_t)qword_45E8, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = v6[2];
    int v10 = 136446210;
    uint64_t v11 = v8;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Removing alarm %{public}s", (uint8_t *)&v10, 0xCu);
  }

  rb_tree_remove_node((rb_tree_t *)&unk_45F0 + v4, v6);
  return v6;
}

void sub_2584(uint64_t a1, uint64_t a2, int a3)
{
  IOPMAssertionID v5 = *(_DWORD *)(a1 + 56);
  int v6 = (os_log_s *)qword_45E8;
  if (os_log_type_enabled((os_log_t)qword_45E8, OS_LOG_TYPE_INFO))
  {
    int v28 = 67109120;
    LODWORD(v29) = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "release power assertion %d", (uint8_t *)&v28, 8u);
  }

  IOPMAssertionRelease(v5);
  uint64_t v7 = sub_2450(*(void *)(a1 + 32), *(void *)(a1 + 40));
  if (v7)
  {
    uint64_t v8 = (uint64_t)v7;
    int v9 = *((unsigned __int8 *)v7 + 40);
    *((_BYTE *)v7 + 40) = 0;
    __uint64_t v10 = sub_2320(*((unsigned int *)v7 + 7));
    __uint64_t v11 = v10;
    if (*(void *)(v8 + 32) <= v10)
    {
      *(void *)(v8 + 32) = v10 + 60000000000LL;
      if (v10 >= 0xFFFFFFF207B8A800LL)
      {
        if (os_log_type_enabled((os_log_t)qword_45E8, OS_LOG_TYPE_ERROR)) {
          sub_323C();
        }
        *(void *)(v8 + 32) = -1LL;
      }
    }

    sub_237C(v8);
    unint64_t v12 = (os_log_s *)qword_45E8;
    if (os_log_type_enabled((os_log_t)qword_45E8, OS_LOG_TYPE_INFO))
    {
      double v13 = "fired";
      if (!v9) {
        double v13 = "unfired";
      }
      uint64_t v14 = *(void *)(v8 + 16);
      unint64_t v15 = *(void *)(v8 + 32);
      int v28 = 136315650;
      __uint64_t v29 = v13;
      if (v11 > v15) {
        unint64_t v16 = -(uint64_t)((v11 - v15) / 0x3B9ACA00);
      }
      else {
        unint64_t v16 = (v15 - v11) / 0x3B9ACA00;
      }
      __int16 v30 = 2082;
      uint64_t v31 = v14;
      __int16 v32 = 2048;
      unint64_t v33 = v16;
      _os_log_impl( &dword_0,  v12,  OS_LOG_TYPE_INFO,  "Resetting %s job %{public}s, now due in %lld seconds.",  (uint8_t *)&v28,  0x20u);
    }

    uint64_t v17 = 0LL;
    do
    {
      sub_17B8(v17, 0LL);
      uint64_t v17 = (v17 + 1);
    }

    while ((_DWORD)v17 != 3);
    if (a3)
    {
      v18 = (os_log_s *)qword_45E8;
      if (os_log_type_enabled((os_log_t)qword_45E8, OS_LOG_TYPE_FAULT))
      {
        unint64_t v20 = *(void *)(a1 + 40);
        v19 = *(const char **)(a1 + 48);
        uint64_t v21 = *(void *)(a1 + 32);
        int v22 = *(_DWORD *)(a1 + 56);
        int v28 = 136315906;
        __uint64_t v29 = v19;
        __int16 v30 = 2048;
        uint64_t v31 = v21;
        __int16 v32 = 2048;
        unint64_t v33 = v20;
        __int16 v34 = 1024;
        int v35 = v22;
        _os_log_fault_impl( &dword_0,  v18,  OS_LOG_TYPE_FAULT,  "No reply received for alarm '%s' %lld/%lld with power assertion %d. Client may not have an event stream handle r set up, or their event handler's queue may be blocked.",  (uint8_t *)&v28,  0x26u);
      }

      goto LABEL_24;
    }
  }

  else if ((a3 & 1) != 0)
  {
    goto LABEL_24;
  }

  __uint64_t v23 = (os_log_s *)qword_45E8;
  if (os_log_type_enabled((os_log_t)qword_45E8, OS_LOG_TYPE_INFO))
  {
    unint64_t v25 = *(void *)(a1 + 40);
    __uint64_t v24 = *(const char **)(a1 + 48);
    uint64_t v26 = *(void *)(a1 + 32);
    int v27 = *(_DWORD *)(a1 + 56);
    int v28 = 136315906;
    __uint64_t v29 = v24;
    __int16 v30 = 2048;
    uint64_t v31 = v26;
    __int16 v32 = 2048;
    unint64_t v33 = v25;
    __int16 v34 = 1024;
    int v35 = v27;
    _os_log_impl( &dword_0,  v23,  OS_LOG_TYPE_INFO,  "Reply received for alarm '%s' %lld/%lld with power assertion %d.",  (uint8_t *)&v28,  0x26u);
  }

LABEL_24:
  free(*(void **)(a1 + 48));
}

uint64_t sub_2878(uint64_t result)
{
  if (!*(_BYTE *)(*(void *)(*(void *)(result + 40) + 8LL) + 24LL))
  {
    uint64_t v1 = result;
    result = (*(uint64_t (**)(void))(*(void *)(result + 32) + 16LL))();
    *(_BYTE *)(*(void *)(*(void *)(v1 + 40) + 8LL) + 24LL) = 1;
  }

  return result;
}

void sub_28C8(uint64_t a1)
{
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL))
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
    dispatch_block_cancel(*(dispatch_block_t *)(a1 + 40));
  }

unint64_t *sub_2924(int a1)
{
  __uint64_t v2 = 0LL;
  uint64_t v3 = 0LL;
  unint64_t v4 = -1LL;
  do
  {
    if (v2 != 1)
    {
      __uint64_t v9 = sub_2320(v2);
      node_geq = (unint64_t *)rb_tree_find_node_geq((rb_tree_t *)&unk_45F0 + v2, &v9);
      if (node_geq)
      {
        int v6 = node_geq;
        while (!*((_BYTE *)v6 + 25) || a1 && !*((_BYTE *)v6 + 24))
        {
          int v6 = (unint64_t *)rb_tree_iterate((rb_tree_t *)&unk_45F0 + v2, v6, 1u);
          if (!v6) {
            goto LABEL_12;
          }
        }

        unint64_t v7 = sub_2CDC(v2, v6[4]);
        if (v7 < v4)
        {
          uint64_t v3 = v6;
          unint64_t v4 = v7;
        }
      }
    }

LABEL_12:
    ++v2;
  }

  while (v2 != 3);
  return v3;
}

void sub_29F8(uint64_t a1)
{
  double v2 = (double)(sub_2CDC(*(unsigned int *)(a1 + 28), *(void *)(a1 + 32)) / 0x3B9ACA00uLL) + -978307200.0;
  CFDateRef v3 = CFDateCreate(0LL, v2);
  if (*(_BYTE *)(a1 + 24)) {
    unint64_t v4 = kCFBooleanTrue;
  }
  else {
    unint64_t v4 = kCFBooleanFalse;
  }
  if (v4 == kCFBooleanTrue) {
    IOPMAssertionID v5 = @"com.apple.alarm.user-visible";
  }
  else {
    IOPMAssertionID v5 = @"com.apple.alarm.user-invisible";
  }
  MutableCopy = CFStringCreateMutableCopy(0LL, 0LL, v5);
  unint64_t v7 = *(const char **)(a1 + 16);
  if (v7)
  {
    CFStringRef v8 = CFStringCreateWithCString(0LL, v7, 0x8000100u);
    if (v8)
    {
      __uint64_t v9 = v8;
      CFStringAppend(MutableCopy, @"-");
      CFStringAppend(MutableCopy, v9);
      CFRelease(v9);
    }
  }

  if (v4 == kCFBooleanTrue)
  {
    qword_46D8 = *(void *)&v2;
    __uint64_t v10 = &qword_46E0;
  }

  else
  {
    qword_46C8 = *(void *)&v2;
    __uint64_t v10 = &qword_46D0;
  }

  if (*v10)
  {
    CFRelease((CFTypeRef)*v10);
    *__uint64_t v10 = 0LL;
  }

  *__uint64_t v10 = (uint64_t)CFRetain(MutableCopy);
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, @"time", v3);
  CFDictionaryAddValue(Mutable, @"scheduledby", MutableCopy);
  CFDictionaryAddValue(Mutable, @"UserVisible", v4);
  int v12 = IOPMRequestSysWake(Mutable);
  double v13 = (os_log_s *)qword_45E8;
  if (v12)
  {
    int v14 = v12;
    if (os_log_type_enabled((os_log_t)qword_45E8, OS_LOG_TYPE_ERROR))
    {
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      uint64_t v16 = *(void *)(a1 + 16);
      int v19 = 134218498;
      double v20 = v2 - Current;
      __int16 v21 = 2082;
      uint64_t v22 = v16;
      __int16 v23 = 1024;
      int v24 = v14;
      _os_log_error_impl( &dword_0,  v13,  OS_LOG_TYPE_ERROR,  "Unable to schedule wake for %.1fs on behalf of %{public}s, IOPMRequestSysWake() returned %d.",  (uint8_t *)&v19,  0x1Cu);
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_45E8, OS_LOG_TYPE_INFO))
  {
    CFAbsoluteTime v17 = CFAbsoluteTimeGetCurrent();
    uint64_t v18 = *(void *)(a1 + 16);
    int v19 = 134218242;
    double v20 = v2 - v17;
    __int16 v21 = 2082;
    uint64_t v22 = v18;
    _os_log_impl( &dword_0,  v13,  OS_LOG_TYPE_INFO,  "Scheduled wake for %.1fs on behalf of %{public}s.",  (uint8_t *)&v19,  0x16u);
  }

  if (v3) {
    CFRelease(v3);
  }
  if (MutableCopy) {
    CFRelease(MutableCopy);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
}

uint64_t sub_2CDC(__uint64_t a1, unint64_t a2)
{
  if ((a1 - 1) <= 1)
  {
    xpc_object_t v4 = xpc_date_create_from_current();
    int64_t value = xpc_date_get_value(v4);
    xpc_release(v4);
    __uint64_t v6 = sub_2320(a1);
    unint64_t v8 = a2 - v6;
    uint64_t v9 = (uint64_t)(a2 - v6) >> 63;
    if (((((a2 - __PAIR128__(v7, v6)) >> 64) ^ v9) & 1) != 0)
    {
      __uint64_t v10 = v6;
      if (os_log_type_enabled((os_log_t)qword_45E8, OS_LOG_TYPE_ERROR)) {
        sub_3294();
      }
      if (v10 < a2) {
        unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v8 = 0x8000000000000000LL;
      }
      if (v10 < a2) {
        uint64_t v9 = 0LL;
      }
      else {
        uint64_t v9 = -1LL;
      }
    }

    uint64_t v11 = v9 << 63 >> 63;
    a2 = value + v8;
    if (__CFADD__(value, v8)) {
      uint64_t v12 = v11 + 1;
    }
    else {
      uint64_t v12 = v11;
    }
    uint64_t v13 = v12 << 63 >> 63;
    if (v13 != v12 || v13 < 0)
    {
      if (os_log_type_enabled((os_log_t)qword_45E8, OS_LOG_TYPE_ERROR)) {
        sub_3268();
      }
      return (uint64_t)~v8 >> 63;
    }
  }

  return a2;
}

void sub_2DCC( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

  ;
}

void sub_2E04( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

uint64_t clock_set_handler(dispatch_queue_t queue, uint64_t a2)
{
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 0x40000000LL;
  handler[2] = sub_2EF8;
  handler[3] = &unk_4338;
  handler[4] = a2;
  uint32_t v4 = notify_register_dispatch("com.apple.system.timezone", &out_token, queue, handler);
  if (v4) {
    _os_assumes_log(v4);
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 0x40000000LL;
  v6[2] = sub_2F00;
  v6[3] = &unk_4358;
  v6[4] = a2;
  uint64_t result = notify_register_dispatch("com.apple.system.clock_set", &out_token, queue, v6);
  if ((_DWORD)result) {
    return _os_assumes_log(result);
  }
  return result;
}

uint64_t sub_2EF8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_2F00(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

double clock_mach_time_dilation()
{
  if (qword_46E8 != -1) {
    dispatch_once(&qword_46E8, &stru_4398);
  }
  return *(double *)&qword_46F0;
}

void sub_2F48(id a1)
{
  kern_return_t v1;
  unint64_t v2;
  unint64_t v3;
  double v4;
  mach_timebase_info info;
  uint64_t v1 = mach_timebase_info(&info);
  if (v1)
  {
    _os_assumes_log(v1);
    uint32_t v4 = 1.0;
  }

  else
  {
    LODWORD(v2) = info.numer;
    LODWORD(v3) = info.denom;
    uint32_t v4 = (double)v2 / (double)v3;
  }

  qword_46F0 = *(void *)&v4;
}

void sub_2F94()
{
  uint64_t v0 = _os_assert_log(0LL);
  _os_crash(v0);
  __break(1u);
}

void sub_2FAC()
{
}

void sub_2FD8(uint64_t a1, os_log_s *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl( &dword_0,  a2,  OS_LOG_TYPE_ERROR,  "Failed to get event name for alarm registration with token %llu",  (uint8_t *)&v2,  0xCu);
  sub_2DFC();
}

void sub_3048(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 136446466;
  uint64_t v4 = a1;
  __int16 v5 = 2082;
  uint64_t v6 = a2;
  _os_log_error_impl( &dword_0,  log,  OS_LOG_TYPE_ERROR,  "Unsupported alarm (Type: %{public}s, Date: %{public}s)",  (uint8_t *)&v3,  0x16u);
  sub_2DFC();
}

void sub_30C8(uint64_t a1)
{
  int v2 = (os_log_s *)qword_45E8;
  if (os_log_type_enabled((os_log_t)qword_45E8, OS_LOG_TYPE_INFO))
  {
    int v3 = 134217984;
    uint64_t v4 = a1;
    _os_log_impl( &dword_0,  v2,  OS_LOG_TYPE_INFO,  "Received request to remove alarm with token %llu\n",  (uint8_t *)&v3,  0xCu);
  }

void sub_316C()
{
  sub_2E04( &dword_0,  v0,  v1,  "Unable to cancel user-visible wake for %.1f, IOPMCancelScheduledPowerEvent() returned 0x%x.",  v2,  v3,  v4,  v5,  v6);
  sub_2DFC();
}

void sub_31D4()
{
  sub_2E04( &dword_0,  v0,  v1,  "Unable to cancel wake for %.1f, IOPMCancelScheduledPowerEvent() returned 0x%x.",  v2,  v3,  v4,  v5,  v6);
  sub_2DFC();
}

void sub_323C()
{
}

void sub_3268()
{
}

void sub_3294()
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

void xpc_event_provider_token_fire_with_reply()
{
  while (1)
    ;
}