@interface RSDRemoteDevice
+ (id)tlsOidsRequiredOfPeer;
- (BOOL)connectable;
- (BOOL)isHost;
- (BOOL)isTrusted;
- (BOOL)negotiateTls;
- (BOOL)tlsEnabled;
- (NSMutableArray)heartbeat_requests;
- (NSMutableSet)device_peers;
- (NSMutableSet)service_listeners;
- (NSMutableSet)services;
- (NSSet)tlsOidsPopulatedOnPeer;
- (OS_xpc_object)device_listener;
- (OS_xpc_object)properties;
- (OS_xpc_object)public_properties;
- (OS_xpc_remote_connection)connection;
- (RSDRemoteDevice)initWithName:(char *)a3;
- (char)device_alias;
- (char)uuid;
- (const)device_name;
- (const)heartbeat_stats;
- (const)local_address;
- (const)remote_address;
- (const)uuidString;
- (id)copyClientDescriptionWithSensitiveProperties:(BOOL)a3;
- (id)description;
- (id)handleReset:(id)a3;
- (id)serviceWithName:(const char *)a3;
- (int)connectToService:(char *)a3 withTcpOption:(id *)a4;
- (int)interface_index;
- (int)latestConnectError;
- (int)listenForService:(char *)a3 port:(char *)a4;
- (unint64_t)device_id;
- (unint64_t)heartbeat_sequence_number;
- (unint64_t)messaging_protocol_version;
- (unint64_t)tlsRequirement;
- (unsigned)state;
- (unsigned)type;
- (void)_resetNow;
- (void)attach;
- (void)connect:(id)a3;
- (void)dealloc;
- (void)disconnect;
- (void)drainPendedRequests;
- (void)fetchDeviceAlias;
- (void)goodByeWithCallback:(id)a3;
- (void)handleResetGoAhead;
- (void)handshakeCompleted:(unint64_t)a3;
- (void)heartbeatWithCallback:(id)a3;
- (void)invokeWhenConnectable:(id)a3;
- (void)listenForService:(id)a3;
- (void)needsConnect;
- (void)pollConnect:(int)a3 onQueue:(id)a4 withLog:(id)a5 completion:(id)a6;
- (void)refreshServiceListeners;
- (void)reset;
- (void)setBackendProperty:(const char *)a3 withBool:(BOOL)a4;
- (void)setBackendProperty:(const char *)a3 withString:(const char *)a4;
- (void)setBackendProperty:(const char *)a3 withUint:(unint64_t)a4;
- (void)setConnection:(id)a3;
- (void)setDevice_alias:(char *)a3;
- (void)setDevice_id:(unint64_t)a3;
- (void)setDevice_listener:(id)a3;
- (void)setDevice_peers:(id)a3;
- (void)setHeartbeat_requests:(id)a3;
- (void)setHeartbeat_sequence_number:(unint64_t)a3;
- (void)setLatestConnectError:(int)a3;
- (void)setMessaging_protocol_version:(unint64_t)a3;
- (void)setProperties:(id)a3;
- (void)setPublic_properties:(id)a3;
- (void)setService_listeners:(id)a3;
- (void)setServices:(id)a3;
- (void)setState:(unsigned int)a3;
- (void)setTlsEnabled:(BOOL)a3;
- (void)setUuid:(char *)a3;
- (void)timesyncWithCallback:(id)a3;
- (void)triggerNeedsConnect;
@end

@implementation RSDRemoteDevice

- (RSDRemoteDevice)initWithName:(char *)a3
{
  v4 = -[RSDRemoteDevice init](self, "init");
  v5 = v4;
  if (v4)
  {
    ++qword_1000429A0;
    -[RSDRemoteDevice setDevice_id:](v4, "setDevice_id:");
    -[RSDRemoteDevice setHeartbeat_sequence_number:](v5, "setHeartbeat_sequence_number:", 1LL);
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    -[RSDRemoteDevice setDevice_peers:](v5, "setDevice_peers:", v6);

    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    -[RSDRemoteDevice setHeartbeat_requests:](v5, "setHeartbeat_requests:", v7);

    xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
    -[RSDRemoteDevice setProperties:](v5, "setProperties:", v8);

    xpc_object_t v9 = xpc_dictionary_create(0LL, 0LL, 0LL);
    -[RSDRemoteDevice setPublic_properties:](v5, "setPublic_properties:", v9);

    -[RSDRemoteDevice setLatestConnectError:](v5, "setLatestConnectError:", 0xFFFFFFFFLL);
    -[RSDRemoteDevice setTlsEnabled:](v5, "setTlsEnabled:", 0LL);
    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    pended_requests = v5->_pended_requests;
    v5->_pended_requests = v10;

    v5->_device_name = strdup(a3);
    uint64_t v12 = os_transaction_create();
    transaction = v5->_transaction;
    v5->_transaction = (OS_os_transaction *)v12;

    *(_WORD *)&v5->_requested_tls = 0;
    v14 = v5;
  }

  return v5;
}

- (unint64_t)tlsRequirement
{
  return 1LL;
}

+ (id)tlsOidsRequiredOfPeer
{
  return +[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", &off_10003E448);
}

- (BOOL)isHost
{
  connection = self->_connection;
  if (connection) {
    LOBYTE(connection) = xpc_remote_connection_is_server(connection, a2);
  }
  return (char)connection;
}

- (void)setUuid:(char *)a3
{
  uuid = self->_uuid;
  if (!uuid)
  {
    uuid = (char *)malloc(0x10uLL);
    self->_uuid = uuid;
    if (!uuid) {
      sub_100024A24(&v6, v7);
    }
  }

  uuid_copy((unsigned __int8 *)uuid, (const unsigned __int8 *)a3);
  uuid_unparse((const unsigned __int8 *)self->_uuid, self->_uuidString);
}

- (const)uuidString
{
  return self->_uuidString;
}

- (BOOL)isTrusted
{
  return remote_device_type_is_trusted(-[RSDRemoteDevice type](self, "type"));
}

- (const)heartbeat_stats
{
  return &self->_heartbeat_stats;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___RSDRemoteDevice;
  -[RSDRemoteDevice dealloc](&v3, "dealloc");
}

- (id)serviceWithName:(const char *)a3
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice services](self, "services", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        xpc_object_t v9 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        if (!strcmp((const char *)[v9 name], a3))
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  id v10 = 0LL;
LABEL_11:

  return v10;
}

- (unsigned)type
{
  unsigned int result = _os_crash("Must overwrite -[RSDRemoteDevice type] in subclass", a2);
  __break(1u);
  return result;
}

- (const)remote_address
{
  unsigned int result = (const in6_addr *)_os_crash("Must overwrite -[RSDRemoteDevice remote_address] in subclass", a2);
  __break(1u);
  return result;
}

- (const)local_address
{
  unsigned int result = (const in6_addr *)_os_crash("Must overwrite -[RSDRemoteDevice remote_address] in subclass", a2);
  __break(1u);
  return result;
}

- (int)interface_index
{
  int result = _os_crash("Must overwrite -[RSDRemoteDevice interface_index] in subclass", a2);
  __break(1u);
  return result;
}

- (void)needsConnect
{
}

- (void)pollConnect:(int)a3 onQueue:(id)a4 withLog:(id)a5 completion:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100006F30;
  v10[3] = &unk_10003CF68;
  v10[4] = self;
  id v11 = a6;
  id v9 = v11;
  remote_socket_poll_connect_async(v8, a4, a5, a4, v10);
}

- (int)listenForService:(char *)a3 port:(char *)a4
{
  int v13 = -1;
  unsigned __int16 v12 = 0;
  int v7 = sub_100017998( &v13,  (__n128 *)-[RSDRemoteDevice local_address](self, "local_address"),  &v12,  -[RSDRemoteDevice interface_index](self, "interface_index"),  (uint64_t)&unk_10003047C);
  if (v7)
  {
    int v8 = v7;
    id v9 = (os_log_s *)qword_100043220;
    if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v16 = self;
      __int16 v17 = 2080;
      v18 = a3;
      __int16 v19 = 1024;
      int v20 = v8;
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%{public}@> Unable to start listener for %s: %{errno}d",  buf,  0x1Cu);
    }

    return -1;
  }

  else
  {
    id v11 = (os_log_s *)qword_100043220;
    if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543874;
      v16 = self;
      __int16 v17 = 2080;
      v18 = a3;
      __int16 v19 = 1024;
      int v20 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%{public}@> listenForService %s returning port %d",  buf,  0x1Cu);
    }

    return v13;
  }

- (int)connectToService:(char *)a3 withTcpOption:(id *)a4
{
  int v12 = -1;
  unsigned __int16 v6 = atoi(a3);
  int v7 = (os_log_s *)qword_100043220;
  if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v14 = self;
    __int16 v15 = 1024;
    int v16 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%{public}@> Attempting to connect to service on port %d",  buf,  0x12u);
  }

  int v8 = sub_100017464( &v12,  (__n128 *)-[RSDRemoteDevice remote_address](self, "remote_address"),  v6,  -[RSDRemoteDevice interface_index](self, "interface_index"),  (uint64_t)a4);
  if (!v8) {
    return v12;
  }
  int v9 = v8;
  id v10 = (os_log_s *)qword_100043220;
  if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543874;
    uint64_t v14 = self;
    __int16 v15 = 1024;
    int v16 = v6;
    __int16 v17 = 1024;
    int v18 = v9;
    _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%{public}@> Unable to open socket to service on port %d: %{darwin.errno}d",  buf,  0x18u);
  }

  return -1;
}

- (BOOL)connectable
{
  return -[RSDRemoteDevice state](self, "state") == 3 && !self->_resetting && !self->_being_reset;
}

- (void)attach
{
  if (!-[RSDRemoteDevice type](self, "type")) {
    sub_100024B0C(&v11, buf);
  }
  objc_super v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  -[RSDRemoteDevice setService_listeners:](self, "setService_listeners:", v3);

  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  -[RSDRemoteDevice setServices:](self, "setServices:", v4);

  [(id)qword_100043068 addObject:self];
  id v5 = (os_log_s *)qword_100043220;
  if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@> Attached", buf, 0xCu);
  }

  if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_DEBUG))
  {
    unsigned __int16 v6 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice properties](self, "properties"));
    int v7 = (void *)xpc_copy_clean_description();

    if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_DEBUG)) {
      sub_100024BDC((uint64_t)self);
    }
    free(v7);
    int v8 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice public_properties](self, "public_properties"));
    int v9 = (void *)xpc_copy_clean_description();

    if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_DEBUG)) {
      sub_100024B74((uint64_t)self);
    }
    free(v9);
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000074E8;
  v10[3] = &unk_10003CF40;
  v10[4] = self;
  dispatch_async((dispatch_queue_t)qword_100043070, v10);
  sub_10001B3BC(self);
}

- (NSSet)tlsOidsPopulatedOnPeer
{
  objc_super v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice properties](self, "properties"));
  xpc_object_t array = xpc_dictionary_get_array(v4, "EncryptedRemoteXPCPopulatedOIDs");
  unsigned __int16 v6 = (void *)objc_claimAutoreleasedReturnValue(array);

  if (v6)
  {
    applier[0] = _NSConcreteStackBlock;
    applier[1] = 3221225472LL;
    applier[2] = sub_1000075B8;
    applier[3] = &unk_10003CEF0;
    id v10 = v3;
    xpc_array_apply(v6, applier);
  }

  id v7 = -[NSMutableSet copy](v3, "copy");

  return (NSSet *)v7;
}

- (void)triggerNeedsConnect
{
  if (-[RSDRemoteDevice state](self, "state") == 5)
  {
    objc_super v3 = (os_log_s *)qword_100043220;
    if (!os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_INFO)) {
      return;
    }
    int v5 = 138543362;
    unsigned __int16 v6 = self;
    v4 = "%{public}@> Device gone, not attempting reconnect";
    goto LABEL_7;
  }

  if (-[RSDRemoteDevice state](self, "state") != 3)
  {
    -[RSDRemoteDevice needsConnect](self, "needsConnect");
    return;
  }

  objc_super v3 = (os_log_s *)qword_100043220;
  if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_INFO))
  {
    int v5 = 138543362;
    unsigned __int16 v6 = self;
    v4 = "%{public}@> Already connected, not triggering needsConnect";
LABEL_7:
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, v4, (uint8_t *)&v5, 0xCu);
  }

- (BOOL)negotiateTls
{
  xpc_object_t v3 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (-[RSDRemoteDevice state](self, "state") == 2)
  {
    id v4 = sub_100014F60();

    if (v4)
    {
      if (-[RSDRemoteDevice messaging_protocol_version](self, "messaging_protocol_version") > 5)
      {
        if ((id)-[RSDRemoteDevice tlsRequirement](self, "tlsRequirement") != (id)1)
        {
          id v13 = [(id)objc_opt_class(self) tlsOidsRequiredOfPeer];
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
          int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](&OBJC_CLASS___NSMutableSet, "setWithSet:", v14));

          __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice tlsOidsPopulatedOnPeer](self, "tlsOidsPopulatedOnPeer"));
          [v9 minusSet:v15];

          if ([v9 count])
          {
            if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_ERROR)) {
              sub_100024CA4();
            }
            BOOL v8 = 0;
          }

          else
          {
            BOOL v8 = 1;
          }

          goto LABEL_12;
        }

        int v12 = (os_log_s *)qword_100043220;
        if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_INFO))
        {
          int v16 = 138543362;
          __int16 v17 = self;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%{public}@> TLS is disabled for this backend.",  (uint8_t *)&v16,  0xCu);
        }
      }

      else
      {
        int v5 = (void *)qword_100043220;
        if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_INFO))
        {
          unsigned __int16 v6 = v5;
          int v16 = 138543874;
          __int16 v17 = self;
          __int16 v18 = 2048;
          unint64_t v19 = -[RSDRemoteDevice messaging_protocol_version](self, "messaging_protocol_version");
          __int16 v20 = 1024;
          int v21 = 6;
          _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%{public}@> Peer protocol version too low for TLS (%llu < %d).",  (uint8_t *)&v16,  0x1Cu);
        }
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_ERROR))
    {
      sub_100024C44();
    }

    BOOL v8 = 0;
    int v9 = 0LL;
LABEL_12:
    xpc_dictionary_set_string(v3, "MessageType", "StartTls");
    xpc_dictionary_set_BOOL(v3, "YesNo", v8);
    xpc_dictionary_set_uint64(v3, "TlsPolicy", -[RSDRemoteDevice tlsRequirement](self, "tlsRequirement"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice connection](self, "connection"));
    xpc_remote_connection_send_message(v10, v3);

    goto LABEL_13;
  }

  id v7 = (void *)qword_100043220;
  if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_ERROR)) {
    sub_100024D04(self, v7);
  }
  BOOL v8 = 0;
LABEL_13:

  return v8;
}

- (void)handshakeCompleted:(unint64_t)a3
{
  unint64_t v5 = -[RSDRemoteDevice tlsRequirement](self, "tlsRequirement");
  if ((a3 == 3 || v5 == 3) && !self->_enable_tls)
  {
    id v7 = (os_log_s *)qword_100043220;
    if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      uint64_t v11 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@> TLS is required by self and/or peer and was not enabled. Connect failed.",  (uint8_t *)&v10,  0xCu);
    }

    -[RSDRemoteDevice setState:](self, "setState:", 1LL);
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice connection](self, "connection"));

    if (v8)
    {
      int v9 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice connection](self, "connection"));
      xpc_remote_connection_cancel();

      -[RSDRemoteDevice setConnection:](self, "setConnection:", 0LL);
    }
  }

  else
  {
    unsigned __int16 v6 = (os_log_s *)qword_100043220;
    if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      uint64_t v11 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@> Handshake complete.",  (uint8_t *)&v10,  0xCu);
    }

    -[RSDRemoteDevice setState:](self, "setState:", 3LL);
    -[RSDRemoteDevice connected](self, "connected");
    -[RSDRemoteDevice fetchDeviceAlias](self, "fetchDeviceAlias");
    sub_10001B4B8(self);
    -[RSDRemoteDevice drainPendedRequests](self, "drainPendedRequests");
  }

- (id)handleReset:(id)a3
{
  id v4 = a3;
  if ((xpc_dictionary_expects_reply(v4) & 1) != 0)
  {
    self->_being_reset = 1;
    xpc_object_t reply = xpc_dictionary_create_reply(v4);
    xpc_dictionary_set_string(reply, "Result", "Ok");
  }

  else
  {
    if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_ERROR)) {
      sub_100024D94();
    }
    xpc_object_t reply = 0LL;
  }

  return reply;
}

- (void)handleResetGoAhead
{
  xpc_object_t v3 = (os_log_s *)qword_100043220;
  if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%{public}@> Got reset goahead. Cancel this connection and proceed to reset",  (uint8_t *)&v6,  0xCu);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice connection](self, "connection"));

  if (v4)
  {
    unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice connection](self, "connection"));
    xpc_remote_connection_cancel();

    -[RSDRemoteDevice setConnection:](self, "setConnection:", 0LL);
  }

- (void)connect:(id)a3
{
  id v4 = a3;
  unsigned int v5 = -[RSDRemoteDevice state](self, "state");
  if (v4)
  {
    if (v5 == 5)
    {
      int v6 = (os_log_s *)qword_100043220;
      if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v79 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%{public}@> Device already gone, giving up the connection",  buf,  0xCu);
      }

      xpc_remote_connection_cancel(v4);
    }

    else
    {
      BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice connection](self, "connection"));

      if (v8) {
        sub_100024E0C(&v73, buf);
      }
      -[RSDRemoteDevice setConnection:](self, "setConnection:", v4);
      if (!-[RSDRemoteDevice state](self, "state")) {
        self->_being_reset = 0;
      }
      -[RSDRemoteDevice setState:](self, "setState:", 1LL);
      v53 = self;
      if (self->_enable_tls)
      {
        id v9 = sub_100014F60();
        if (!v9) {
          sub_100024DF4(0LL, v10);
        }
        uint64_t v11 = v9;
        int v12 = (os_log_s *)qword_100043220;
        if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v79 = self;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%{public}@> Applying TLS to RemoteXPC connection.",  buf,  0xCu);
        }

        id v13 = self;
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice connection](self, "connection"));
        v72[0] = _NSConcreteStackBlock;
        v72[1] = 3221225472LL;
        v72[2] = sub_100008494;
        v72[3] = &unk_10003CF90;
        v72[4] = self;
        xpc_remote_connection_set_tls(v14, v11, v72, qword_100043070);

        BOOL enable_tls = self->_enable_tls;
      }

      else
      {
        BOOL enable_tls = 0LL;
        id v13 = self;
      }

      -[RSDRemoteDevice setTlsEnabled:](v13, "setTlsEnabled:", enable_tls);
      -[RSDRemoteDevice refreshServiceListeners](v13, "refreshServiceListeners");
      xpc_remote_connection_set_target_queue(v4, qword_100043070);
      v66 = _NSConcreteStackBlock;
      uint64_t v67 = 3221225472LL;
      v68 = sub_1000084E4;
      v69 = &unk_10003CFE0;
      v70 = v13;
      id v50 = v4;
      id v17 = v4;
      id v71 = v17;
      xpc_remote_connection_set_event_handler();
      id v48 = v17;
      xpc_remote_connection_activate(v17);
      xpc_object_t v18 = xpc_dictionary_create(0LL, 0LL, 0LL);
      xpc_dictionary_set_string(v18, "MessageType", "Handshake");
      xpc_dictionary_set_uint64(v18, "MessagingProtocolVersion", 6uLL);
      xpc_dictionary_set_uuid(v18, "UUID", byte_100043228);
      xpc_object_t v49 = v18;
      xpc_dictionary_set_value(v18, "Properties", (xpc_object_t)qword_100043238);
      xpc_object_t xdict = xpc_dictionary_create(0LL, 0LL, 0LL);
      __int128 v62 = 0u;
      __int128 v63 = 0u;
      __int128 v64 = 0u;
      __int128 v65 = 0u;
      id obj = (id)qword_100043240;
      id v19 = [obj countByEnumeratingWithState:&v62 objects:v77 count:16];
      __int16 v20 = v13;
      if (v19)
      {
        id v21 = v19;
        uint64_t v22 = *(void *)v63;
        do
        {
          for (i = 0LL; i != v21; i = (char *)i + 1)
          {
            if (*(void *)v63 != v22) {
              objc_enumerationMutation(obj);
            }
            v24 = *(void **)(*((void *)&v62 + 1) + 8LL * (void)i);
            __int128 v58 = 0u;
            __int128 v59 = 0u;
            __int128 v60 = 0u;
            __int128 v61 = 0u;
            v25 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice service_listeners](v20, "service_listeners"));
            id v26 = [v25 countByEnumeratingWithState:&v58 objects:v76 count:16];
            if (v26)
            {
              id v27 = v26;
              uint64_t v28 = *(void *)v59;
LABEL_28:
              uint64_t v29 = 0LL;
              while (1)
              {
                if (*(void *)v59 != v28) {
                  objc_enumerationMutation(v25);
                }
                v30 = *(void **)(*((void *)&v58 + 1) + 8 * v29);
                v31 = (void *)objc_claimAutoreleasedReturnValue([v30 service]);

                if (v31 == v24) {
                  break;
                }
                if (v27 == (id)++v29)
                {
                  id v27 = [v25 countByEnumeratingWithState:&v58 objects:v76 count:16];
                  if (v27) {
                    goto LABEL_28;
                  }
                  goto LABEL_34;
                }
              }

              id v32 = v30;

              if (!v32) {
                goto LABEL_37;
              }
              v33 = (const char *)[v24 name];
              id v34 = [v32 copyServiceDescription];
              xpc_dictionary_set_value(xdict, v33, v34);

              __int16 v20 = v53;
            }

            else
            {
LABEL_34:

LABEL_37:
              v35 = (void *)qword_100043220;
              __int16 v20 = v53;
              if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_ERROR))
              {
                v36 = v35;
                id v37 = [v24 name];
                *(_DWORD *)buf = 138543618;
                v79 = v53;
                __int16 v80 = 2080;
                id v81 = v37;
                _os_log_error_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_ERROR,  "%{public}@> No listener for \"%s\"",  buf,  0x16u);
              }
            }
          }

          id v21 = [obj countByEnumeratingWithState:&v62 objects:v77 count:16];
        }

        while (v21);
      }

      __int128 v56 = 0u;
      __int128 v57 = 0u;
      __int128 v54 = 0u;
      __int128 v55 = 0u;
      id v38 = (id)qword_100043248;
      id v39 = [v38 countByEnumeratingWithState:&v54 objects:v75 count:16];
      if (v39)
      {
        id v40 = v39;
        uint64_t v41 = *(void *)v55;
        do
        {
          for (j = 0LL; j != v40; j = (char *)j + 1)
          {
            if (*(void *)v55 != v41) {
              objc_enumerationMutation(v38);
            }
            v43 = *(void **)(*((void *)&v54 + 1) + 8LL * (void)j);
            v44 = (const char *)[v43 name];
            id v45 = [v43 copyServiceDescription];
            xpc_dictionary_set_value(xdict, v44, v45);
          }

          id v40 = [v38 countByEnumeratingWithState:&v54 objects:v75 count:16];
        }

        while (v40);
      }

      xpc_dictionary_set_value(v49, "Services", xdict);
      xpc_remote_connection_send_message(v48, v49);
      v46 = (void *)xpc_copy_clean_description(v49);
      v47 = (os_log_s *)qword_100043220;
      if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        v79 = v20;
        __int16 v80 = 2080;
        id v81 = v46;
        _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_INFO,  "%{public}@> Sending handshake message: %s",  buf,  0x16u);
      }

      free(v46);

      id v4 = v50;
    }
  }

  else
  {
    id v7 = (os_log_s *)qword_100043220;
    if (v5 == 5)
    {
      if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v79 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%{public}@> Device connection failed, device already gone, giving up",  buf,  0xCu);
      }
    }

    else
    {
      if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v79 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@> Device connection failed",  buf,  0xCu);
      }

      dispatch_time_t v16 = dispatch_time(0LL, 1000000000LL);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10000848C;
      block[3] = &unk_10003CF40;
      block[4] = self;
      dispatch_after(v16, (dispatch_queue_t)qword_100043070, block);
    }
  }
}

- (void)heartbeatWithCallback:(id)a3
{
  id v4 = a3;
  if (-[RSDRemoteDevice state](self, "state") == 3
    && (unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice connection](self, "connection")),
        v5,
        v5))
  {
    if (-[RSDRemoteDevice messaging_protocol_version](self, "messaging_protocol_version"))
    {
      uint64_t v6 = -[RSDRemoteDevice heartbeat_sequence_number](self, "heartbeat_sequence_number");
      -[RSDRemoteDevice setHeartbeat_sequence_number:]( self,  "setHeartbeat_sequence_number:",  (char *)-[RSDRemoteDevice heartbeat_sequence_number](self, "heartbeat_sequence_number") + 1);
      id v7 = (os_log_s *)qword_100043220;
      if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v22 = self;
        __int16 v23 = 2048;
        uint64_t v24 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@> Sending heartbeat request %llu",  buf,  0x16u);
      }

      self->_heartbeat_stats.times.outstanding_start = clock_gettime_nsec_np(_CLOCK_MONOTONIC);
      ++self->_heartbeat_stats.counts.sent;
      xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
      xpc_dictionary_set_string(v8, "MessageType", "Heartbeat");
      xpc_dictionary_set_uint64(v8, "SequenceNumber", v6);
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice connection](self, "connection"));
      uint64_t v10 = qword_100043070;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_1000099B0;
      v14[3] = &unk_10003D030;
      v14[4] = self;
      uint64_t v16 = v6;
      id v15 = v4;
      xpc_remote_connection_send_message_with_reply(v9, v8, v10, v14);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_ERROR)) {
        sub_1000254C8();
      }
      id v13 = (dispatch_queue_s *)qword_100043070;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_1000099A0;
      v17[3] = &unk_10003D008;
      id v18 = v4;
      dispatch_async(v13, v17);
      xpc_object_t v8 = v18;
    }
  }

  else
  {
    uint64_t v11 = (os_log_s *)qword_100043220;
    if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v22 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@> Heartbeat failed: not connected",  buf,  0xCu);
    }

    int v12 = (dispatch_queue_s *)qword_100043070;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100009990;
    block[3] = &unk_10003D008;
    id v20 = v4;
    dispatch_async(v12, block);
    xpc_object_t v8 = v20;
  }
}

- (void)timesyncWithCallback:(id)a3
{
  id v4 = a3;
  if (-[RSDRemoteDevice state](self, "state") == 3
    && (unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice connection](self, "connection")),
        v5,
        v5))
  {
    unint64_t v6 = -[RSDRemoteDevice messaging_protocol_version](self, "messaging_protocol_version");
    id v7 = (os_log_s *)qword_100043220;
    if (v6 > 2)
    {
      if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v21 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@> sending timesync request",  buf,  0xCu);
      }

      unint64_t v8 = sub_10000EAF0();
      int v9 = v8;
      unint64_t v10 = HIDWORD(v8);
      id v11 = sub_10000EB78(v8, (void *)qword_100043220);
      int v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      xpc_object_t empty = xpc_dictionary_create_empty();
      xpc_dictionary_set_string(empty, "MessageType", "Timesync");
      xpc_dictionary_set_value(empty, "TimesyncPayload", v12);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice connection](self, "connection"));
      uint64_t v15 = qword_100043070;
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_100009DB4;
      v16[3] = &unk_10003D030;
      v16[4] = self;
      id v17 = v4;
      int v18 = v9;
      int v19 = v10;
      xpc_remote_connection_send_message_with_reply(v14, empty, v15, v16);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_ERROR)) {
        sub_100025614();
      }
      (*((void (**)(id, uint64_t))v4 + 2))(v4, 43LL);
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_ERROR)) {
      sub_1000255B4();
    }
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 57LL);
  }
}

- (void)goodByeWithCallback:(id)a3
{
  id v4 = a3;
  if (-[RSDRemoteDevice type](self, "type") == 14)
  {
    if (-[RSDRemoteDevice state](self, "state") == 3
      && (unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice connection](self, "connection")),
          v5,
          v5))
    {
      xpc_object_t empty = xpc_dictionary_create_empty();
      xpc_dictionary_set_string(empty, "MessageType", "Goodbye");
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice connection](self, "connection"));
      uint64_t v8 = qword_100043070;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = sub_10000A028;
      v9[3] = &unk_10003D058;
      v9[4] = self;
      id v10 = v4;
      xpc_remote_connection_send_message_with_reply(v7, empty, v8, v9);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_ERROR)) {
        sub_10002573C();
      }
      (*((void (**)(id, uint64_t))v4 + 2))(v4, 57LL);
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_ERROR)) {
      sub_10002579C();
    }
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 43LL);
  }
}

- (void)disconnect
{
  xpc_object_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice connection](self, "connection"));

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice connection](self, "connection"));
    xpc_remote_connection_cancel(v4);

    -[RSDRemoteDevice setConnection:](self, "setConnection:", 0LL);
  }

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice service_listeners](self, "service_listeners"));
  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      int v9 = 0LL;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * (void)v9) cancel];
        int v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }

    while (v7);
  }

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice services](self, "services", 0LL));
  id v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0LL;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * (void)v14) cancel];
        uint64_t v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }

    while (v12);
  }

  -[RSDRemoteDevice setService_listeners:](self, "setService_listeners:", 0LL);
  -[RSDRemoteDevice setServices:](self, "setServices:", 0LL);
  -[RSDRemoteDevice drainPendedRequests](self, "drainPendedRequests");
  sub_10001B628(self);
  [(id)qword_100043068 removeObject:self];
}

- (void)reset
{
  if (-[RSDRemoteDevice state](self, "state") == 5)
  {
    if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_ERROR)) {
      sub_1000257FC();
    }
  }

  else
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_10000A3C4;
    v3[3] = &unk_10003CF40;
    v3[4] = self;
    -[RSDRemoteDevice invokeWhenConnectable:](self, "invokeWhenConnectable:", v3);
  }

- (void)refreshServiceListeners
{
  if ((id)-[RSDRemoteDevice tlsRequirement](self, "tlsRequirement") == (id)3
    && !-[RSDRemoteDevice tlsEnabled](self, "tlsEnabled"))
  {
    __int128 v19 = (os_log_s *)qword_100043220;
    if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v41 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "%{public}@> TLS required and not yet enabled. Postpone listening for services.",  buf,  0xCu);
    }

    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice service_listeners](self, "service_listeners"));
    id v21 = [v20 countByEnumeratingWithState:&v36 objects:v46 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v37;
      do
      {
        for (i = 0LL; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v37 != v23) {
            objc_enumerationMutation(v20);
          }
          [*(id *)(*((void *)&v36 + 1) + 8 * (void)i) cancel];
        }

        id v22 = [v20 countByEnumeratingWithState:&v36 objects:v46 count:16];
      }

      while (v22);
    }

    id obj = (id)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice service_listeners](self, "service_listeners"));
    [obj removeAllObjects];
  }

  else
  {
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    id obj = (id)qword_100043240;
    id v3 = [obj countByEnumeratingWithState:&v32 objects:v45 count:16];
    if (v3)
    {
      id v5 = v3;
      uint64_t v27 = *(void *)v33;
      *(void *)&__int128 v4 = 138543618LL;
      __int128 v25 = v4;
      do
      {
        for (j = 0LL; j != v5; j = (char *)j + 1)
        {
          if (*(void *)v33 != v27) {
            objc_enumerationMutation(obj);
          }
          id v7 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)j);
          __int128 v28 = 0u;
          __int128 v29 = 0u;
          __int128 v30 = 0u;
          __int128 v31 = 0u;
          uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice service_listeners](self, "service_listeners", v25));
          id v9 = [v8 countByEnumeratingWithState:&v28 objects:v44 count:16];
          if (v9)
          {
            id v10 = v9;
            uint64_t v11 = *(void *)v29;
LABEL_10:
            uint64_t v12 = 0LL;
            while (1)
            {
              if (*(void *)v29 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void **)(*((void *)&v28 + 1) + 8 * v12);
              uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 service]);

              if (v14 == v7) {
                break;
              }
              if (v10 == (id)++v12)
              {
                id v10 = [v8 countByEnumeratingWithState:&v28 objects:v44 count:16];
                if (v10) {
                  goto LABEL_10;
                }
                goto LABEL_16;
              }
            }

            id v15 = v13;

            if (v15) {
              goto LABEL_21;
            }
          }

          else
          {
LABEL_16:
          }

          __int128 v16 = (void *)qword_100043220;
          if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_INFO))
          {
            __int128 v17 = v16;
            id v18 = [v7 name];
            *(_DWORD *)buf = v25;
            uint64_t v41 = self;
            __int16 v42 = 2080;
            id v43 = v18;
            _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "%{public}@> Trying to listen for new service \"%s\"",  buf,  0x16u);
          }

          -[RSDRemoteDevice listenForService:](self, "listenForService:", v7);
          id v15 = 0LL;
LABEL_21:
        }

        id v5 = [obj countByEnumeratingWithState:&v32 objects:v45 count:16];
      }

      while (v5);
    }
  }
}

- (void)_resetNow
{
  if (-[RSDRemoteDevice state](self, "state") == 5)
  {
    if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_ERROR)) {
      sub_1000257FC();
    }
  }

  else
  {
    unint64_t v3 = -[RSDRemoteDevice messaging_protocol_version](self, "messaging_protocol_version");
    __int128 v4 = (os_log_s *)qword_100043220;
    if (v3 > 1)
    {
      if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        id v9 = self;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%{public}@> About to reset", buf, 0xCu);
      }

      self->_resetting = 1;
      xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
      xpc_dictionary_set_string(v5, "MessageType", "Reset");
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice connection](self, "connection"));
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472LL;
      v7[2] = sub_10000A8C0;
      v7[3] = &unk_10003CDB8;
      v7[4] = self;
      xpc_remote_connection_send_message_with_reply(v6, v5, qword_100043070, v7);
    }

    else if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_ERROR))
    {
      sub_10002585C();
    }
  }

- (void)drainPendedRequests
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000AABC;
  block[3] = &unk_10003CF40;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)qword_100043070, block);
}

- (void)invokeWhenConnectable:(id)a3
{
  id v6 = (void (**)(void))a3;
  if (-[RSDRemoteDevice connectable](self, "connectable"))
  {
    v6[2]();
  }

  else
  {
    pended_requests = self->_pended_requests;
    xpc_object_t v5 = objc_retainBlock(v6);

    -[NSMutableArray addObject:](pended_requests, "addObject:", v5);
    id v6 = v5;
  }
}

- (void)setBackendProperty:(const char *)a3 withUint:(unint64_t)a4
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice properties](self, "properties"));
  xpc_dictionary_set_uint64(v7, a3, a4);

  id v9 = a3;
  if (lfind(&v9, &off_10003D0C0, &qword_1000304A8, 8uLL, (int (__cdecl *)(const void *, const void *))sub_10000C104))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice public_properties](self, "public_properties"));
    xpc_dictionary_set_uint64(v8, a3, a4);
  }

- (void)setBackendProperty:(const char *)a3 withBool:(BOOL)a4
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice properties](self, "properties"));
  xpc_dictionary_set_BOOL(v7, a3, a4);

  id v9 = a3;
  if (lfind(&v9, &off_10003D0C0, &qword_1000304A8, 8uLL, (int (__cdecl *)(const void *, const void *))sub_10000C104))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice public_properties](self, "public_properties"));
    xpc_dictionary_set_BOOL(v8, a3, a4);
  }

- (void)setBackendProperty:(const char *)a3 withString:(const char *)a4
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice properties](self, "properties"));
  xpc_dictionary_set_string(v7, a3, a4);

  id v9 = a3;
  if (lfind(&v9, &off_10003D0C0, &qword_1000304A8, 8uLL, (int (__cdecl *)(const void *, const void *))sub_10000C104))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice public_properties](self, "public_properties"));
    xpc_dictionary_set_string(v8, a3, a4);
  }

- (id)description
{
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%s", self->_device_name);
}

- (void)listenForService:(id)a3
{
  id v4 = a3;
  if ([v4 shouldBeExposedToDevice:self])
  {
    unint64_t v17 = 0xAAAAAAAAAAAAAAAALL;
    uint64_t v5 = -[RSDRemoteDevice listenForService:port:](self, "listenForService:port:", [v4 name], &v17);
    if ((_DWORD)v5 != -1)
    {
      uint64_t v6 = v5;
      if (fcntl(v5, 4, 4LL) == -1) {
        sub_100025944(&v16, buf);
      }
      id v7 = objc_alloc(&OBJC_CLASS___RSDLocalServiceListener);
      uint64_t v8 = -[RSDLocalServiceListener initWithService:forDevice:withPort:onSocket:]( v7,  "initWithService:forDevice:withPort:onSocket:",  v4,  self,  v17,  v6);
      id v9 = (void *)qword_100043220;
      if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_INFO))
      {
        id v10 = v9;
        id v11 = [v4 name];
        uint64_t v12 = -[RSDLocalServiceListener port](v8, "port");
        *(_DWORD *)buf = 138543874;
        __int128 v19 = self;
        __int16 v20 = 2080;
        id v21 = v11;
        __int16 v22 = 2080;
        uint64_t v23 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%{public}@> Listening for %s on port %s.",  buf,  0x20u);
      }

      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice service_listeners](self, "service_listeners"));
      [v13 addObject:v8];

      goto LABEL_9;
    }

    id v15 = (void *)qword_100043220;
    if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_ERROR)) {
      sub_1000258BC((uint64_t)self, v15, v4);
    }
  }

  else
  {
    uint64_t v14 = (void *)qword_100043220;
    if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = v14;
      *(_DWORD *)buf = 138543618;
      __int128 v19 = self;
      __int16 v20 = 2080;
      id v21 = [v4 name];
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v8,  OS_LOG_TYPE_INFO,  "%{public}@> Won't expose %s to the device",  buf,  0x16u);
LABEL_9:
    }
  }
}

- (void)fetchDeviceAlias
{
  if (!-[RSDRemoteDevice device_alias](self, "device_alias"))
  {
    unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice properties](self, "properties"));
    xpc_object_t value = xpc_dictionary_get_value(v3, "UniqueDeviceID");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(value);

    if (v5)
    {
      string_ptr = xpc_string_get_string_ptr(v5);
      if (string_ptr)
      {
        id v7 = string_ptr;
        uint64_t v8 = objc_claimAutoreleasedReturnValue([(id)qword_100043218 valueForKey:@"device_name_map"]);
        if (v8)
        {
          id v9 = (const __CFDictionary *)v8;
          CFStringRef v10 = CFStringCreateWithCString(kCFAllocatorDefault, v7, 0x8000100u);
          id v11 = (const __CFString *)CFDictionaryGetValue(v9, v10);
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = (char *)malloc(0x80uLL);
            if (!v13) {
              sub_100025A84(&v14, v15);
            }
            self->_device_alias = v13;
            CFStringGetCString(v12, v13, 128LL, 0x8000100u);
          }

          CFRelease(v10);
          CFRelease(v9);
        }
      }

      else if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_DEBUG))
      {
        sub_100025A24();
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_DEBUG))
    {
      sub_1000259C4();
    }
  }

- (void)setDevice_alias:(char *)a3
{
  if (a3)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice properties](self, "properties"));
    xpc_object_t value = xpc_dictionary_get_value(v5, "UniqueDeviceID");
    id v7 = (void *)objc_claimAutoreleasedReturnValue(value);

    if (v7)
    {
      string_ptr = xpc_string_get_string_ptr(v7);
      if (string_ptr)
      {
        id v9 = string_ptr;
        CFStringRef v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue([(id)qword_100043218 valueForKey:@"device_name_map"]);
        if (!v10 || (Mutable = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0LL, v10)) == 0LL) {
          Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
        }
        CFStringRef v12 = CFStringCreateWithCString(kCFAllocatorDefault, a3, 0x8000100u);
        CFStringRef v13 = CFStringCreateWithCString(kCFAllocatorDefault, v9, 0x8000100u);
        CFDictionarySetValue(Mutable, v13, v12);
        [(id)qword_100043218 setValue:Mutable forKey:@"device_name_map"];
        [(id)qword_100043218 synchronize];
        free(self->_device_alias);
        if (_dispatch_is_multithreaded())
        {
          while (1)
          {
            uint64_t v14 = strdup(a3);
            if (v14) {
              break;
            }
            __os_temporary_resource_shortage();
          }
        }

        else
        {
          uint64_t v14 = strdup(a3);
          if (!v14) {
            sub_100025BA8(a3, &v15, v16);
          }
        }

        self->_device_alias = v14;
        CFRelease(v13);
        CFRelease(v12);
        CFRelease(Mutable);
        if (v10) {
          CFRelease(v10);
        }
      }

      else if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_DEBUG))
      {
        sub_100025A24();
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_DEBUG))
    {
      sub_1000259C4();
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_ERROR))
  {
    sub_100025B48();
  }

- (const)device_name
{
  return self->_device_name;
}

- (char)device_alias
{
  return self->_device_alias;
}

- (unint64_t)device_id
{
  return self->_device_id;
}

- (void)setDevice_id:(unint64_t)a3
{
  self->_device_id = a3;
}

- (char)uuid
{
  return self->_uuid;
}

- (unsigned)state
{
  return self->_state;
}

- (void)setState:(unsigned int)a3
{
  self->_state = a3;
}

- (OS_xpc_remote_connection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (int)latestConnectError
{
  return self->_latestConnectError;
}

- (void)setLatestConnectError:(int)a3
{
  self->_latestConnectError = a3;
}

- (unint64_t)heartbeat_sequence_number
{
  return self->_heartbeat_sequence_number;
}

- (void)setHeartbeat_sequence_number:(unint64_t)a3
{
  self->_heartbeat_sequence_number = a3;
}

- (unint64_t)messaging_protocol_version
{
  return self->_messaging_protocol_version;
}

- (void)setMessaging_protocol_version:(unint64_t)a3
{
  self->_messaging_protocol_version = a3;
}

- (OS_xpc_object)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
}

- (OS_xpc_object)public_properties
{
  return self->_public_properties;
}

- (void)setPublic_properties:(id)a3
{
}

- (NSMutableSet)services
{
  return self->_services;
}

- (void)setServices:(id)a3
{
}

- (NSMutableSet)service_listeners
{
  return self->_service_listeners;
}

- (void)setService_listeners:(id)a3
{
}

- (BOOL)tlsEnabled
{
  return self->_tlsEnabled;
}

- (void)setTlsEnabled:(BOOL)a3
{
  self->_tlsEnabled = a3;
}

- (OS_xpc_object)device_listener
{
  return self->_device_listener;
}

- (void)setDevice_listener:(id)a3
{
}

- (NSMutableSet)device_peers
{
  return self->_device_peers;
}

- (void)setDevice_peers:(id)a3
{
}

- (NSMutableArray)heartbeat_requests
{
  return self->_heartbeat_requests;
}

- (void)setHeartbeat_requests:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id)copyClientDescriptionWithSensitiveProperties:(BOOL)a3
{
  BOOL v3 = a3;
  xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v5, "device_type", -[RSDRemoteDevice type](self, "type"));
  xpc_dictionary_set_uint64(v5, "device_id", -[RSDRemoteDevice device_id](self, "device_id"));
  xpc_dictionary_set_string(v5, "device_name", -[RSDRemoteDevice device_name](self, "device_name"));
  if (-[RSDRemoteDevice device_alias](self, "device_alias")) {
    xpc_dictionary_set_string(v5, "device_alias", -[RSDRemoteDevice device_alias](self, "device_alias"));
  }
  xpc_dictionary_set_uint64( v5,  "device_messaging_protocol_version",  -[RSDRemoteDevice messaging_protocol_version](self, "messaging_protocol_version"));
  xpc_dictionary_set_BOOL(v5, "device_tls_enabled", -[RSDRemoteDevice tlsEnabled](self, "tlsEnabled"));
  if (-[RSDRemoteDevice uuid](self, "uuid")) {
    xpc_dictionary_set_uuid(v5, "UUID", (const unsigned __int8 *)-[RSDRemoteDevice uuid](self, "uuid"));
  }
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice properties](self, "properties"));

  if (v6)
  {
    BOOL v7 = os_log_type_enabled((os_log_t)qword_100043198, OS_LOG_TYPE_DEBUG);
    if (v3)
    {
      if (v7) {
        sub_10002A6A0();
      }
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice properties](self, "properties"));
    }

    else
    {
      if (v7) {
        sub_10002A768();
      }
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice public_properties](self, "public_properties"));

      if (!v9) {
        sub_10002A700(&v21, buf);
      }
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice public_properties](self, "public_properties"));
    }

    CFStringRef v10 = v8;
    xpc_dictionary_set_value(v5, "properties", v8);
  }

  unsigned int v11 = -[RSDRemoteDevice state](self, "state") - 3;
  if (v11 > 2) {
    uint64_t v12 = 1LL;
  }
  else {
    uint64_t v12 = qword_100030518[v11];
  }
  xpc_dictionary_set_uint64(v5, "device_state", v12);
  CFStringRef v13 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice device_listener](self, "device_listener"));

  if (!v13)
  {
    uint64_t v14 = (os_log_s *)qword_100043198;
    if (os_log_type_enabled((os_log_t)qword_100043198, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = self;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%{public}@> Creating device listener",  buf,  0xCu);
    }

    xpc_connection_t v15 = xpc_connection_create(0LL, (dispatch_queue_t)qword_1000431A0);
    -[RSDRemoteDevice setDevice_listener:](self, "setDevice_listener:", v15);

    uint64_t v16 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice device_listener](self, "device_listener"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100019608;
    v20[3] = &unk_10003CDB8;
    v20[4] = self;
    xpc_connection_set_event_handler(v16, v20);

    unint64_t v17 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice device_listener](self, "device_listener"));
    xpc_connection_activate(v17);
  }

  id v18 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice device_listener](self, "device_listener"));
  xpc_dictionary_set_connection(v5, "endpoint", v18);

  return v5;
}

@end