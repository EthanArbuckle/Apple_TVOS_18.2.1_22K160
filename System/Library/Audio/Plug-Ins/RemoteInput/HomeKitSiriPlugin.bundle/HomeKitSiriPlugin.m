void sub_3760( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}
}

LABEL_14:
  return v9;
}

void sub_49B8(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4[4] == *(void *)(a1 + 40))
  {
    [v4 _handleXpcEvent:v3];
  }

  else
  {
    v5 = (void *)qword_CFB0;
    if (os_log_type_enabled((os_log_t)qword_CFB0, OS_LOG_TYPE_DEBUG))
    {
      v6 = v5;
      xpc_type_t type = xpc_get_type(v3);
      if (type == (xpc_type_t)&_xpc_type_error) {
        v8 = @"XPC error";
      }
      else {
        v8 = @"XPC unknown event type";
      }
      if (type == (xpc_type_t)&_xpc_type_dictionary) {
        v9 = @"XPC message";
      }
      else {
        v9 = (__CFString *)v8;
      }
      v10 = v9;
      int v11 = 138412290;
      v12 = v10;
      _os_log_debug_impl( &dword_0,  v6,  OS_LOG_TYPE_DEBUG,  "HomeKitSiriRemoteInputPlugin dropping stale %@",  (uint8_t *)&v11,  0xCu);
    }
  }
}

void sub_4ADC(uint64_t a1)
{
  v1 = *(_xpc_connection_s **)(*(void *)(a1 + 32) + 32LL);
  if (v1)
  {
    id v3 = (os_log_s *)qword_CFB0;
    if (os_log_type_enabled((os_log_t)qword_CFB0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl( &dword_0,  v3,  OS_LOG_TYPE_DEFAULT,  "HomeKitSiriRemoteInputPlugin invalidating XPC connection",  v6,  2u);
      v1 = *(_xpc_connection_s **)(*(void *)(a1 + 32) + 32LL);
    }

    xpc_connection_cancel(v1);
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = 0LL;

    *(_BYTE *)(*(void *)(a1 + 32) + 13LL) = 0;
  }

void sub_4B7C(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    [WeakRetained _updateServerRunningStatus];
    WeakRetained = v2;
    if (v2[12])
    {
      [v2 _checkIn];
      WeakRetained = v2;
    }
  }
}

id objc_msgSend_xpcConnection(void *a1, const char *a2, ...)
{
  return [a1 xpcConnection];
}