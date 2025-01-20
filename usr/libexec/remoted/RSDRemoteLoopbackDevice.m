@interface RSDRemoteLoopbackDevice
- (BOOL)connectable;
- (const)local_address;
- (const)remote_address;
- (int)connectToService:(char *)a3 withTcpOption:(id *)a4;
- (int)listenForService:(char *)a3 port:(char *)a4;
- (unint64_t)tlsRequirement;
- (unsigned)interface_index;
- (unsigned)type;
@end

@implementation RSDRemoteLoopbackDevice

- (unint64_t)tlsRequirement
{
  uint64_t v2 = sub_100013B5C((void *)qword_1000431F0, @"rsd_loopback_tls_requirement", @"loopback-tls-requirement");
  if (v2)
  {
    unint64_t v3 = v2;
    v4 = (const char *)&unk_100037DBD;
  }

  else
  {
    int is_darwinos = os_variant_is_darwinos("com.apple.RemoteServiceDiscovery");
    if (is_darwinos) {
      v4 = " by default for darwinOS";
    }
    else {
      v4 = " by default for non-darwinOS";
    }
    if (is_darwinos) {
      unint64_t v3 = 2LL;
    }
    else {
      unint64_t v3 = 1LL;
    }
  }

  v6 = (void *)qword_1000431F0;
  if (os_log_type_enabled((os_log_t)qword_1000431F0, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    int v9 = 136315394;
    v10 = sub_100013AC8(v3);
    __int16 v11 = 2080;
    v12 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "TLS is %s for loopback%s",  (uint8_t *)&v9,  0x16u);
  }

  return v3;
}

- (unsigned)type
{
  return 1;
}

- (BOOL)connectable
{
  if ((byte_100043210 & 1) != 0) {
    return 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___RSDRemoteLoopbackDevice;
  return -[RSDRemoteDevice connectable](&v3, "connectable");
}

- (unsigned)interface_index
{
  unsigned int result = _os_crash("Not supported on loopback", a2);
  __break(1u);
  return result;
}

- (const)remote_address
{
  unsigned int result = (const in6_addr *)_os_crash("Not supported on loopback", a2);
  __break(1u);
  return result;
}

- (const)local_address
{
  unsigned int result = (const in6_addr *)_os_crash("Not supported on loopback", a2);
  __break(1u);
  return result;
}

- (int)listenForService:(char *)a3 port:(char *)a4
{
  int v5 = socket(2, 1, 0);
  if (v5 == -1)
  {
    int v9 = (void *)qword_1000431F0;
    if (os_log_type_enabled((os_log_t)qword_1000431F0, OS_LOG_TYPE_ERROR)) {
      sub_10002C1C8(v9);
    }
    return -1;
  }

  int v6 = v5;
  *(_DWORD *)&v19.sa_len = 512;
  *(_DWORD *)&v19.sa_data[2] = inet_addr("127.0.0.1");
  *(void *)&v19.sa_data[6] = 0LL;
  if (bind(v6, &v19, 0x10u) == -1)
  {
    v10 = (void *)qword_1000431F0;
    if (os_log_type_enabled((os_log_t)qword_1000431F0, OS_LOG_TYPE_ERROR)) {
      sub_10002C244(v10);
    }
    goto LABEL_16;
  }

  if (listen(v6, 128) == -1)
  {
    __int16 v11 = (void *)qword_1000431F0;
    if (os_log_type_enabled((os_log_t)qword_1000431F0, OS_LOG_TYPE_ERROR)) {
      sub_10002C2C0(v11);
    }
    goto LABEL_16;
  }

  socklen_t v14 = 16;
  if (getsockname(v6, &v19, &v14) == -1)
  {
    v12 = (void *)qword_1000431F0;
    if (os_log_type_enabled((os_log_t)qword_1000431F0, OS_LOG_TYPE_ERROR)) {
      sub_10002C33C(v12);
    }
LABEL_16:
    close(v6);
    return -1;
  }

  unsigned int v7 = bswap32(*(unsigned __int16 *)v19.sa_data) >> 16;
  v8 = (os_log_s *)qword_1000431F0;
  if (os_log_type_enabled((os_log_t)qword_1000431F0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v16 = qword_1000431F8;
    __int16 v17 = 1024;
    unsigned int v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%{public}@> Bound to localhost:%d", buf, 0x12u);
  }

  asprintf(a4, "%d", v7);
  return v6;
}

- (int)connectToService:(char *)a3 withTcpOption:(id *)a4
{
  if (byte_100043210 == 1)
  {
    v4 = (os_log_s *)qword_1000431F0;
    if (os_log_type_enabled((os_log_t)qword_1000431F0, OS_LOG_TYPE_ERROR)) {
      sub_10002C3B8(v4, v5, v6, v7, v8, v9, v10, v11);
    }
    return -1;
  }

  int v13 = socket(2, 1, 0);
  if (v13 == -1)
  {
    __int16 v17 = (void *)qword_1000431F0;
    if (os_log_type_enabled((os_log_t)qword_1000431F0, OS_LOG_TYPE_ERROR)) {
      sub_10002C1C8(v17);
    }
    return -1;
  }

  int v14 = v13;
  if (fcntl(v13, 4, 4LL) == -1)
  {
    unsigned int v18 = (void *)qword_1000431F0;
    if (os_log_type_enabled((os_log_t)qword_1000431F0, OS_LOG_TYPE_ERROR)) {
      sub_10002C428(v18);
    }
    goto LABEL_19;
  }

  uint64_t v15 = strtol(a3, 0LL, 0);
  if ((unint64_t)(v15 - 0x10000) <= 0xFFFFFFFFFFFF0000LL)
  {
    uint64_t v16 = (os_log_s *)qword_1000431F0;
    if (os_log_type_enabled((os_log_t)qword_1000431F0, OS_LOG_TYPE_ERROR)) {
      sub_10002C4A4((uint64_t)a3, v16);
    }
LABEL_19:
    close(v14);
    return -1;
  }

  v27[0] = 512;
  v27[1] = bswap32(v15) >> 16;
  in_addr_t v28 = inet_addr("127.0.0.1");
  uint64_t v29 = 0LL;
  memset(&v22, 0, 24);
  v22.sae_dstaddr = (const sockaddr *)v27;
  *(&v22.sae_dstaddrlen + 1) = 0;
  v22.sae_dstaddrlen = 16;
  if (connectx(v14, &v22, 0, 0, 0LL, 0, 0LL, 0LL) && *__error() != 36)
  {
    v20 = (void *)qword_1000431F0;
    if (os_log_type_enabled((os_log_t)qword_1000431F0, OS_LOG_TYPE_ERROR)) {
      sub_10002C528(v20);
    }
    goto LABEL_19;
  }

  sockaddr v19 = (os_log_s *)qword_1000431F0;
  if (os_log_type_enabled((os_log_t)qword_1000431F0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v24 = qword_1000431F8;
    __int16 v25 = 2080;
    v26 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "%{public}@> connectx(2) succeeded to %s",  buf,  0x16u);
  }

  return v14;
}

@end