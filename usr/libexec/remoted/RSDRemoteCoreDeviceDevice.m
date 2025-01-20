@interface RSDRemoteCoreDeviceDevice
- (OS_nw_connection)client_connection;
- (OS_nw_endpoint)address_endpoint;
- (OS_nw_endpoint)client_endpoint;
- (OS_nw_listener)server_listener;
- (OS_xpc_object)control_peer;
- (RSDRemoteCoreDeviceDevice)initWithClientEndpoint:(id)a3 controlPeer:(id)a4 interfaceName:(const char *)a5 connectTimeout:(unsigned int)a6;
- (RSDRemoteCoreDeviceDevice)initWithGeneratedName;
- (RSDRemoteCoreDeviceDevice)initWithServerListener:(id)a3 controlPeer:(id)a4 interfaceName:(const char *)a5 interfaceIndex:(unsigned int)a6 connectTimeout:(unsigned int)a7;
- (char)if_name;
- (const)local_address;
- (const)remote_address;
- (unint64_t)tlsRequirement;
- (unsigned)connect_timeout;
- (unsigned)if_index;
- (unsigned)type;
- (void)attach;
- (void)cancelListener;
- (void)connected;
- (void)dealloc;
- (void)disconnect;
- (void)needsConnect;
- (void)setAddress_endpoint:(id)a3;
- (void)setClient_connection:(id)a3;
- (void)setClient_endpoint:(id)a3;
- (void)setConnect_timeout:(unsigned int)a3;
- (void)setControl_peer:(id)a3;
- (void)setIf_index:(unsigned int)a3;
- (void)setIf_name:(char *)a3;
- (void)setServer_listener:(id)a3;
@end

@implementation RSDRemoteCoreDeviceDevice

- (unint64_t)tlsRequirement
{
  return 1LL;
}

- (RSDRemoteCoreDeviceDevice)initWithGeneratedName
{
  *(void *)&__int128 v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)__str = v3;
  __int128 v8 = v3;
  int v4 = dword_100042998++;
  snprintf(__str, 0x20uLL, "coredevice-%d", v4);
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___RSDRemoteCoreDeviceDevice;
  return -[RSDRemoteDevice initWithName:](&v6, "initWithName:", __str);
}

- (RSDRemoteCoreDeviceDevice)initWithClientEndpoint:(id)a3 controlPeer:(id)a4 interfaceName:(const char *)a5 connectTimeout:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v10 = a3;
  id v11 = a4;
  v12 = -[RSDRemoteCoreDeviceDevice initWithGeneratedName](self, "initWithGeneratedName");
  v13 = v12;
  if (!v12) {
    goto LABEL_7;
  }
  -[RSDRemoteCoreDeviceDevice setControl_peer:](v12, "setControl_peer:", v11);
  -[RSDRemoteCoreDeviceDevice setClient_endpoint:](v13, "setClient_endpoint:", v10);
  -[RSDRemoteCoreDeviceDevice setIf_name:](v13, "setIf_name:", strdup(a5));
  -[RSDRemoteCoreDeviceDevice setConnect_timeout:](v13, "setConnect_timeout:", v6);
  v14 = (RSDRemoteCoreDeviceDevice *)objc_claimAutoreleasedReturnValue(-[RSDRemoteCoreDeviceDevice client_endpoint](v13, "client_endpoint"));
  if (v14)
  {
    uint64_t v15 = objc_claimAutoreleasedReturnValue(-[RSDRemoteCoreDeviceDevice control_peer](v13, "control_peer"));
    if (v15)
    {
      v16 = (void *)v15;
      v17 = -[RSDRemoteCoreDeviceDevice if_name](v13, "if_name");

      if (v17)
      {
        v14 = v13;
        goto LABEL_8;
      }
    }

    else
    {
    }

- (RSDRemoteCoreDeviceDevice)initWithServerListener:(id)a3 controlPeer:(id)a4 interfaceName:(const char *)a5 interfaceIndex:(unsigned int)a6 connectTimeout:(unsigned int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v8 = *(void *)&a6;
  id v12 = a3;
  id v13 = a4;
  v14 = -[RSDRemoteCoreDeviceDevice initWithGeneratedName](self, "initWithGeneratedName");
  uint64_t v15 = v14;
  if (!v14) {
    goto LABEL_8;
  }
  -[RSDRemoteCoreDeviceDevice setControl_peer:](v14, "setControl_peer:", v13);
  -[RSDRemoteCoreDeviceDevice setServer_listener:](v15, "setServer_listener:", v12);
  -[RSDRemoteCoreDeviceDevice setIf_name:](v15, "setIf_name:", strdup(a5));
  -[RSDRemoteCoreDeviceDevice setIf_index:](v15, "setIf_index:", v8);
  -[RSDRemoteCoreDeviceDevice setConnect_timeout:](v15, "setConnect_timeout:", v7);
  v16 = (RSDRemoteCoreDeviceDevice *)objc_claimAutoreleasedReturnValue(-[RSDRemoteCoreDeviceDevice server_listener](v15, "server_listener"));
  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteCoreDeviceDevice control_peer](v15, "control_peer"));
    if (v17 && -[RSDRemoteCoreDeviceDevice if_name](v15, "if_name"))
    {
      unsigned int v18 = -[RSDRemoteCoreDeviceDevice if_index](v15, "if_index");

      if (v18)
      {
        v16 = v15;
        goto LABEL_9;
      }
    }

    else
    {
    }

- (void)attach
{
  if (-[RSDRemoteCoreDeviceDevice if_index](self, "if_index")) {
    -[RSDRemoteDevice setBackendProperty:withUint:]( self,  "setBackendProperty:withUint:",  "InterfaceIndex",  -[RSDRemoteCoreDeviceDevice if_index](self, "if_index"));
  }
  [(id)qword_100043038 addObject:self];
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___RSDRemoteCoreDeviceDevice;
  -[RSDRemoteDevice attach](&v3, "attach");
}

- (void)disconnect
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___RSDRemoteCoreDeviceDevice;
  -[RSDRemoteDevice disconnect](&v5, "disconnect");
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteCoreDeviceDevice client_connection](self, "client_connection"));

  if (v3)
  {
    int v4 = (nw_connection *)objc_claimAutoreleasedReturnValue(-[RSDRemoteCoreDeviceDevice client_connection](self, "client_connection"));
    nw_connection_cancel(v4);

    -[RSDRemoteCoreDeviceDevice setClient_connection:](self, "setClient_connection:", 0LL);
  }

  [(id)qword_100043038 removeObject:self];
}

- (void)cancelListener
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteCoreDeviceDevice server_listener](self, "server_listener"));

  if (v3)
  {
    int v4 = (nw_listener *)objc_claimAutoreleasedReturnValue(-[RSDRemoteCoreDeviceDevice server_listener](self, "server_listener"));
    nw_listener_cancel(v4);

    -[RSDRemoteCoreDeviceDevice setServer_listener:](self, "setServer_listener:", 0LL);
  }

- (void)dealloc
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteCoreDeviceDevice server_listener](self, "server_listener"));

  if (v3)
  {
    int v4 = (nw_listener *)objc_claimAutoreleasedReturnValue(-[RSDRemoteCoreDeviceDevice server_listener](self, "server_listener"));
    nw_listener_cancel(v4);
  }

  free(-[RSDRemoteCoreDeviceDevice if_name](self, "if_name"));
  -[RSDRemoteCoreDeviceDevice setIf_name:](self, "setIf_name:", 0LL);
  -[RSDRemoteCoreDeviceDevice setControl_peer:](self, "setControl_peer:", 0LL);
  -[RSDRemoteCoreDeviceDevice setClient_endpoint:](self, "setClient_endpoint:", 0LL);
  -[RSDRemoteCoreDeviceDevice setServer_listener:](self, "setServer_listener:", 0LL);
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___RSDRemoteCoreDeviceDevice;
  -[RSDRemoteDevice dealloc](&v5, "dealloc");
}

- (void)connected
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice connection](self, "connection"));
  int v4 = (void *)xpc_remote_connection_copy_remote_endpoint();
  -[RSDRemoteCoreDeviceDevice setAddress_endpoint:](self, "setAddress_endpoint:", v4);

  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteCoreDeviceDevice address_endpoint](self, "address_endpoint"));
  if (!v5)
  {
    id v6 = sub_100003B18();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_10002418C();
    }
  }

- (void)needsConnect
{
  id v3 = sub_100003B18();
  int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138543362;
    v24 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}@> needsConnect",  (uint8_t *)&v23,  0xCu);
  }

  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteCoreDeviceDevice server_listener](self, "server_listener"));
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteCoreDeviceDevice client_connection](self, "client_connection"));

    id v7 = sub_100003B18();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v9)
      {
        int v23 = 138543362;
        v24 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@> server using established client connection",  (uint8_t *)&v23,  0xCu);
      }

      nw_connection_t v10 = (nw_connection_t)objc_claimAutoreleasedReturnValue(-[RSDRemoteCoreDeviceDevice client_connection](self, "client_connection"));
      id v11 = -[RSDRemoteCoreDeviceDevice setClient_connection:](self, "setClient_connection:", 0LL);
      uint64_t v12 = 1LL;
      if (v10)
      {
LABEL_8:
        uint64_t v13 = qword_100043040;
        uint64_t failsafe_version_flags = xpc_remote_connection_get_failsafe_version_flags(v11);
        uint64_t v15 = (void *)xpc_remote_connection_create_with_nw_connection(v10, v13, failsafe_version_flags, v12);
LABEL_16:
        -[RSDRemoteDevice connect:](self, "connect:", v15);

LABEL_17:
        return;
      }

- (unsigned)type
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteCoreDeviceDevice client_endpoint](self, "client_endpoint"));

  if (v2) {
    return 10;
  }
  else {
    return 13;
  }
}

- (const)local_address
{
  p_local_address_storage = &self->local_address_storage;
  if (!self->local_address_storage.__u6_addr32[0]
    && !self->local_address_storage.__u6_addr32[1]
    && !self->local_address_storage.__u6_addr32[2]
    && !self->local_address_storage.__u6_addr32[3]
    && sub_100017DA8(-[RSDRemoteCoreDeviceDevice if_name](self, "if_name"), p_local_address_storage, 0))
  {
    id v3 = sub_100003B18();
    int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000242EC();
    }
  }

  return p_local_address_storage;
}

- (const)remote_address
{
  v2 = (nw_endpoint *)objc_claimAutoreleasedReturnValue(-[RSDRemoteCoreDeviceDevice address_endpoint](self, "address_endpoint"));
  address = nw_endpoint_get_address(v2);

  return (const in6_addr *)&address->sa_data[6];
}

- (OS_xpc_object)control_peer
{
  return self->_control_peer;
}

- (void)setControl_peer:(id)a3
{
}

- (OS_nw_endpoint)address_endpoint
{
  return self->_address_endpoint;
}

- (void)setAddress_endpoint:(id)a3
{
}

- (OS_nw_endpoint)client_endpoint
{
  return self->_client_endpoint;
}

- (void)setClient_endpoint:(id)a3
{
}

- (OS_nw_listener)server_listener
{
  return self->_server_listener;
}

- (void)setServer_listener:(id)a3
{
}

- (unsigned)connect_timeout
{
  return self->_connect_timeout;
}

- (void)setConnect_timeout:(unsigned int)a3
{
  self->_connect_timeout = a3;
}

- (char)if_name
{
  return self->_if_name;
}

- (void)setIf_name:(char *)a3
{
  self->_if_name = a3;
}

- (unsigned)if_index
{
  return self->_if_index;
}

- (void)setIf_index:(unsigned int)a3
{
  self->_if_index = a3;
}

- (OS_nw_connection)client_connection
{
  return self->_client_connection;
}

- (void)setClient_connection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end