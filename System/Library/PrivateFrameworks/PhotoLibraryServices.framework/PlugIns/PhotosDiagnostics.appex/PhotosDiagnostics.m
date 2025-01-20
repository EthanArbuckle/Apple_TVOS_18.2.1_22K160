void sub_100002228( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;
  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, void);
  v12 = va_arg(va1, void);
  v13 = va_arg(va1, void);
  v14 = va_arg(va1, void);
  v15 = va_arg(va1, void);
  v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100002524( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}
}

LABEL_8:
}

uint64_t sub_100002BA8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100002BB8(uint64_t a1)
{
}

void sub_100002BC0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedDescription]);
    int v5 = 138543362;
    v6 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Error communicating with diagnose service: %{public}@",  (uint8_t *)&v5,  0xCu);
  }

  [*(id *)(a1 + 32) diagnosticServiceStateDidChange:0xFFFFFFFFLL outputURL:0 error:v3];
}

void sub_100002C98(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (a2)
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v7 path]);
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8LL);
    v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) lastPathComponent]);
      int v14 = 138543362;
      v15 = v12;
      v13 = "Diagnose started into %{public}@";
LABEL_6:
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  v13,  (uint8_t *)&v14,  0xCu);
    }
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([v8 localizedFailureReason]);
    int v14 = 138543362;
    v15 = v12;
    v13 = "Error starting diagnose: %{public}@";
    goto LABEL_6;
  }
}

void sub_100002DF0(void *a1, void *a2, char a3)
{
  id v6 = a2;
  id v7 = v6;
  if (!a1[4]
    || (id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 lastPathComponent]),
        unsigned __int8 v9 = [v8 containsString:a1[4]],
        v8,
        (v9 & 1) == 0))
  {
    id v13 = 0LL;
    [v7 getResourceValue:&v13 forKey:NSURLCreationDateKey error:0];
    id v10 = v13;
    id v11 = v13;
    v12 = v11;
    if ((a3 & 1) == 0 && [v11 compare:*(void *)(*(void *)(a1[5] + 8) + 40)] == (id)1)
    {
      objc_storeStrong((id *)(*(void *)(a1[5] + 8LL) + 40LL), v10);
      objc_storeStrong((id *)(*(void *)(a1[6] + 8LL) + 40LL), a2);
    }
  }
}

id objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "synchronousRemoteObjectProxyWithErrorHandler:");
}