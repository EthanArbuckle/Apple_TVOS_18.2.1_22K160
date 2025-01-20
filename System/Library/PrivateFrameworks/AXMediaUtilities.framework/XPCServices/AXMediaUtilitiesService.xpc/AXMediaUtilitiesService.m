void sub_10000575C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, id location)
{
  id *v22;
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}
}

void OUTLINED_FUNCTION_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

uint64_t _AXMProcessRequestMobileUserPrivileges()
{
  uint64_t result = (uint64_t)getpwnam("mobile");
  if (result)
  {
    uint64_t v1 = result;
    if (getuid() == *(_DWORD *)(result + 16)) {
      return 1LL;
    }
    else {
      return !setgid(*(_DWORD *)(v1 + 20)) && setuid(*(_DWORD *)(v1 + 16)) == 0;
    }
  }

  return result;
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3 = AXMediaLogCommon(*(void *)&argc, argv, envp);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "*** AXMediaUtilitiesService is starting ***",  v12,  2u);
  }

  uint64_t v5 = _AXMProcessRequestMobileUserPrivileges();
  if ((v5 & 1) != 0)
  {
    v8 = objc_alloc_init(&OBJC_CLASS___AXMServiceInstance);
    -[AXMServiceInstance run](v8, "run");
    int v9 = 0;
  }

  else
  {
    uint64_t v10 = AXMediaLogCommon(v5, v6, v7);
    v8 = (AXMServiceInstance *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR)) {
      main_cold_1((os_log_t)v8);
    }
    int v9 = -1;
  }

  return v9;
}

void main_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Could not switch to mobile. aborting",  v1,  2u);
}

id objc_msgSend_xpcServer(void *a1, const char *a2, ...)
{
  return [a1 xpcServer];
}