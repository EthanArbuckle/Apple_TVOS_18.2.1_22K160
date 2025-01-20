void sub_100004F5C(id a1)
{
  DAHIDEventMonitor *v1;
  void *v2;
  v1 = objc_alloc_init(&OBJC_CLASS___DAHIDEventMonitor);
  v2 = (void *)qword_10000CA98;
  qword_10000CA98 = (uint64_t)v1;
}

void sub_10000547C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_100005494(uint64_t a1)
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
      sub_1000064DC();
    }
  }
}

LABEL_29:
  v23 = DiagnosticLogHandleForCategory(3LL);
  v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
    sub_100006534();
  }

  -[DAHIDEventMonitor cleanUpSystemClient](v5, "cleanUpSystemClient");
  v20 = 0;
LABEL_34:
  v4 = v30;
LABEL_35:

  return v20;
}

void sub_1000058FC(_Unwind_Exception *a1)
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

void sub_100005ADC(_Unwind_Exception *a1)
{
}

id sub_100005AF8(uint64_t a1)
{
  return [*(id *)(a1 + 32) cleanUpSystemClient];
}

void sub_100005C44( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

id sub_100006004(uint64_t a1)
{
  return [*(id *)(a1 + 32) finish];
}

void sub_100006484()
{
}

void sub_1000064B0()
{
}

void sub_1000064DC()
{
}

void sub_100006508()
{
}

void sub_100006534()
{
}

void sub_10000656C(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "[ERROR] - Could not find plugin.", buf, 2u);
}

void sub_1000065A8()
{
}

void sub_1000065D4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Ambient Light Sensor NOT found. (0)", v1, 2u);
}

id objc_msgSend_valueWithPointer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueWithPointer:");
}