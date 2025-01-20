void sub_10000174C(id a1)
{
  DAHIDEventMonitor *v1;
  void *v2;
  v1 = objc_alloc_init(&OBJC_CLASS___DAHIDEventMonitor);
  v2 = (void *)qword_100008908;
  qword_100008908 = (uint64_t)v1;
}

void sub_100001C6C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_100001C84(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) HIDEvents]);
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectAtIndexedSubscript:*(void *)(a1 + 48)]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"HIDServiceClient"]);
  v5 = (__IOHIDServiceClient *)[v4 pointerValue];

  if (v5)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = IOHIDServiceClientSetProperty( v5,  *(CFStringRef *)(a1 + 56),  *(CFTypeRef *)(a1 + 64)) != 0;
  }

  else
  {
    uint64_t v6 = DiagnosticLogHandleForCategory(3LL);
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100002928();
    }
  }
}

LABEL_29:
  v23 = DiagnosticLogHandleForCategory(3LL);
  v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
    sub_100002980();
  }

  -[DAHIDEventMonitor cleanUpSystemClient](v5, "cleanUpSystemClient");
  v20 = 0;
LABEL_34:
  v4 = v30;
LABEL_35:

  return v20;
}

void sub_1000020EC(_Unwind_Exception *a1)
{
}

uint64_t _HIDEventFilterCallback(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([a2 delegate]);
    [v5 handleHIDEvent:a4];
  }

  return 0LL;
}

void sub_1000022CC(_Unwind_Exception *a1)
{
}

id sub_1000022E8(uint64_t a1)
{
  return [*(id *)(a1 + 32) cleanUpSystemClient];
}

void sub_100002434( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

id sub_1000025F0(uint64_t a1)
{
  return [*(id *)(a1 + 32) finish];
}

void sub_1000028D0()
{
}

void sub_1000028FC()
{
}

void sub_100002928()
{
}

void sub_100002954()
{
}

void sub_100002980()
{
}

void sub_1000029B8(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "[ERROR] - Could not find plugin.", buf, 2u);
}

void sub_1000029F4()
{
}

void sub_100002A20(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Accelerometer NOT found. (0)", v1, 2u);
}

id objc_msgSend_valueWithPointer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueWithPointer:");
}