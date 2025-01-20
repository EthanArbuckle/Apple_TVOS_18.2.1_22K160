void init_greentea_logging()
{
  int v0;
  if (notify_register_dispatch( "com.apple.ManagedConfiguration.profileListChanged",  &dword_40A0,  &_dispatch_main_q,  &stru_4080))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_3D18();
    }
    dword_40A0 = -1;
  }

  v0 = ct_green_tea_logging_enabled();
  sub_3C20(v0);
}

void sub_3BC0(id a1, int a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Handling mobile config installation", v3, 2u);
  }

  int v2 = ct_green_tea_logging_enabled();
  sub_3C20(v2);
}

void sub_3C20(int a1)
{
  int v3 = a1;
  int v1 = sysctlbyname("security.mac.platform_exec_logging", 0LL, 0LL, &v3, 4uLL);
  if (v1)
  {
    int v2 = v1;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_3D5C(&v3, v2);
    }
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v5 = "security.mac.platform_exec_logging";
    __int16 v6 = 1024;
    int v7 = v3;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "SET %s to %d", buf, 0x12u);
  }
}

void sub_3D18()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Failed to register for the mobile config installation notification",  v0,  2u);
}

void sub_3D5C(int *a1, int a2)
{
  int v3 = *a1;
  v4 = __error();
  v5 = strerror(*v4);
  int v6 = 136315906;
  int v7 = "security.mac.platform_exec_logging";
  __int16 v8 = 1024;
  int v9 = v3;
  __int16 v10 = 1024;
  int v11 = a2;
  __int16 v12 = 2080;
  v13 = v5;
  _os_log_error_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "FAILED to set %s to %d with error: %d  %s",  (uint8_t *)&v6,  0x22u);
}