@interface RSDRemoteNetworkPeerDevice
- (RSDRemoteNetworkPeerDevice)initWithGeneratedName;
- (const)local_address;
- (const)remote_address;
- (id)initClientWithRemoteAddress:(const in6_addr *)a3;
- (id)initServerWithPeerSocket:(int)a3;
- (unsigned)interface_index;
- (unsigned)type;
- (void)attach;
- (void)disconnect;
- (void)needsConnect;
- (void)serverReplacePeerSocket:(int)a3;
@end

@implementation RSDRemoteNetworkPeerDevice

- (RSDRemoteNetworkPeerDevice)initWithGeneratedName
{
  result = -[RSDRemoteNetworkPeerDevice init](self, "init");
  if (result)
  {
    v3 = result;
    *(void *)&__int128 v4 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)__str = v4;
    __int128 v8 = v4;
    int v5 = dword_1000429B0++;
    snprintf(__str, 0x20uLL, "network-%d", v5);
    v6.receiver = v3;
    v6.super_class = (Class)&OBJC_CLASS___RSDRemoteNetworkPeerDevice;
    return -[RSDRemoteDevice initWithName:](&v6, "initWithName:", __str);
  }

  return result;
}

- (id)initClientWithRemoteAddress:(const in6_addr *)a3
{
  v3 = (in6_addr *)a3;
  if (a3)
  {
    if ((a3->__u6_addr32[0] || a3->__u6_addr32[1] || a3->__u6_addr32[2] || a3->__u6_addr32[3])
      && (self = -[RSDRemoteNetworkPeerDevice initWithGeneratedName](self, "initWithGeneratedName")) != 0LL)
    {
      self->remote_address_storage = *v3;
      self->server_mode = 0;
      self = self;
      v3 = (in6_addr *)self;
    }

    else
    {
      v3 = 0LL;
    }
  }

  return v3;
}

- (id)initServerWithPeerSocket:(int)a3
{
  v3 = self;
  if ((a3 & 0x80000000) == 0)
  {
    int v5 = -[RSDRemoteNetworkPeerDevice initWithGeneratedName](self, "initWithGeneratedName");
    v3 = v5;
    if (v5)
    {
      v5->peerfd = a3;
      v5->server_mode = 1;
      if (!sub_10001804C(a3, v5->remote_address_storage.__u6_addr8))
      {
        v3 = v3;
        objc_super v6 = v3;
        goto LABEL_7;
      }

      if (os_log_type_enabled((os_log_t)qword_100043110, OS_LOG_TYPE_ERROR)) {
        sub_1000295CC();
      }
    }
  }

  objc_super v6 = 0LL;
LABEL_7:

  return v6;
}

- (void)serverReplacePeerSocket:(int)a3
{
  if (a3 < 0)
  {
    if (os_log_type_enabled((os_log_t)qword_100043110, OS_LOG_TYPE_ERROR)) {
      sub_10002962C();
    }
  }

  else if (sub_10001804C(a3, self->remote_address_storage.__u6_addr8))
  {
    if (os_log_type_enabled((os_log_t)qword_100043110, OS_LOG_TYPE_ERROR)) {
      sub_1000295CC();
    }
  }

  else
  {
    self->peerfd = a3;
    int v5 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice connection](self, "connection"));

    if (v5)
    {
      objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice connection](self, "connection"));
      xpc_remote_connection_cancel(v6);

      -[RSDRemoteDevice setConnection:](self, "setConnection:", 0LL);
    }

    else
    {
      -[RSDRemoteNetworkPeerDevice needsConnect](self, "needsConnect");
    }
  }

- (void)attach
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___RSDRemoteNetworkPeerDevice;
  -[RSDRemoteDevice attach](&v3, "attach");
}

- (void)disconnect
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___RSDRemoteNetworkPeerDevice;
  -[RSDRemoteDevice disconnect](&v3, "disconnect");
  [(id)qword_100043118 removeObject:self];
}

- (void)needsConnect
{
  objc_super v3 = (os_log_s *)qword_100043110;
  BOOL v4 = os_log_type_enabled((os_log_t)qword_100043110, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    *(_DWORD *)buf = 138543362;
    v16 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@> needsConnect", buf, 0xCu);
  }

  if (self->server_mode)
  {
    uint64_t peerfd = self->peerfd;
    if ((peerfd & 0x80000000) != 0)
    {
      v13 = (os_log_s *)qword_100043110;
      if (os_log_type_enabled((os_log_t)qword_100043110, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v16 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}@> wait for the other side to connect",  buf,  0xCu);
      }
    }

    else
    {
      uint64_t v6 = qword_100043120;
      uint64_t failsafe_version_flags = xpc_remote_connection_get_failsafe_version_flags(v4);
      __int128 v8 = (void *)xpc_remote_connection_create_with_connected_fd(peerfd, v6, failsafe_version_flags, 1LL);
      self->uint64_t peerfd = -1;
      -[RSDRemoteDevice connect:](self, "connect:", v8);
    }
  }

  else
  {
    HIDWORD(v14) = -1;
    v9 = -[RSDRemoteNetworkPeerDevice remote_address](self, "remote_address");
    uint64_t v10 = sub_100017464( (int *)&v14 + 1,  (__n128 *)v9,  0xE5F9u,  (int)[(id)qword_100043128 index],  (uint64_t)&xmmword_100030468);
    v11 = (os_log_s *)qword_100043110;
    if ((_DWORD)v10)
    {
      uint64_t v12 = v10;
      if (os_log_type_enabled((os_log_t)qword_100043110, OS_LOG_TYPE_ERROR)) {
        sub_100027C7C((uint64_t)self, v12, v11);
      }
      -[RSDRemoteDevice connect:](self, "connect:", 0LL);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)qword_100043110, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v16 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%{public}@> network_connect_in6() completed successfully",  buf,  0xCu);
      }

      LODWORD(v14) = HIDWORD(v14);
      -[RSDRemoteDevice pollConnect:onQueue:withLog:completion:]( self,  "pollConnect:onQueue:withLog:completion:",  _NSConcreteStackBlock,  3221225472LL,  sub_1000166D4,  &unk_10003D428,  self,  v14);
    }
  }

- (unsigned)type
{
  return 14;
}

- (unsigned)interface_index
{
  return [(id)qword_100043128 index];
}

- (const)local_address
{
  return (const in6_addr *)&qword_100043130;
}

- (const)remote_address
{
  return &self->remote_address_storage;
}

@end