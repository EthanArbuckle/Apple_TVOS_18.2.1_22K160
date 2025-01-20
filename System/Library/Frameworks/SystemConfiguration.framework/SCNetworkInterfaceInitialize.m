@interface SCNetworkInterfaceInitialize
@end

@implementation SCNetworkInterfaceInitialize

void ____SCNetworkInterfaceInitialize_block_invoke()
{
  v6[1] = *MEMORY[0x1895F89C0];
  pthread_mutex_init(&lock_1, 0LL);
  __kSCNetworkInterfaceTypeID = _CFRuntimeRegisterClass();
  _CFRuntimeInitStaticInstance();
  qword_18C46BEF0 = (uint64_t)@"IPv4";
  qword_18C46BF10 = (uint64_t)@"ipv4";
  _CFRuntimeInitStaticInstance();
  qword_18C46C088 = (uint64_t)@"Loopback";
  qword_18C46C0A8 = (uint64_t)@"loopback";
  qword_18C46C0E8 = (uint64_t)CFRetain(@"lo0");
  qword_18C46C0F8 = (uint64_t)@"Loopback";
  bundle = _SC_CFBundleGet();
  int v0 = MEMORY[0x186E08FB4](0LL, &masterPort);
  if (v0)
  {
    int v1 = v0;
    v2 = __log_SCNetworkConfiguration();
    uint64_t v3 = _SC_syslog_os_log_mapping(5);
    if (__SC_log_enabled(5, v2, (os_log_type_t)v3))
    {
      v4 = (char *)v6 - ((_os_log_pack_size() + 15) & 0xFFFFFFFFFFFFFFF0LL);
      __error();
      v5 = (_DWORD *)_os_log_pack_fill();
      _DWORD *v5 = 67109120;
      v5[1] = v1;
      __SC_log_send(5, (uint64_t)v2, v3, v4);
    }
  }

@end