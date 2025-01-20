@interface BTVCBonjourEndpoint
+ (id)createConnectionParameters;
- (BOOL)initiatedConnection;
- (BOOL)isAdvToBrowserConnection;
- (BOOL)isConnected;
- (BTVCBonjourEndpoint)initWithConnection:(id)a3 isAdvToBrowserConnection:(BOOL)a4 localUniqueID:(id)a5 withQueue:(id)a6;
- (NSMutableSet)remoteAdvDataSet;
- (NSString)localUniqueIDString;
- (NSString)remoteUniqueIDString;
- (OS_dispatch_queue)queue;
- (OS_nw_connection)connection;
- (OS_nw_endpoint)remoteEndpoint;
- (id)_getServerRemoteUUIDFromConnectionMetadata:(id)a3 isAdvToBrowserConnection:(BOOL)a4;
- (id)didConnectHandler;
- (id)didDisconnectHandler;
- (id)didReceiveDataHandler;
- (void)_handleUUIDHeaders;
- (void)_startConnection;
- (void)cancel;
- (void)receiveNextMessage;
- (void)sendDataMessage:(id)a3 completion:(id)a4;
- (void)setDidConnectHandler:(id)a3;
- (void)setDidDisconnectHandler:(id)a3;
- (void)setDidReceiveDataHandler:(id)a3;
- (void)setInitiatedConnection:(BOOL)a3;
- (void)setIsConnected:(BOOL)a3;
- (void)setLocalUniqueIDString:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRemoteAdvDataSet:(id)a3;
- (void)setRemoteUniqueIDString:(id)a3;
@end

@implementation BTVCBonjourEndpoint

- (BTVCBonjourEndpoint)initWithConnection:(id)a3 isAdvToBrowserConnection:(BOOL)a4 localUniqueID:(id)a5 withQueue:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___BTVCBonjourEndpoint;
  v14 = -[BTVCBonjourEndpoint init](&v25, "init");
  v15 = v14;
  if (v14)
  {
    if (v12 && v11 && v13)
    {
      objc_storeStrong((id *)&v14->_queue, a6);
      objc_storeStrong((id *)&v15->_connection, a3);
      nw_endpoint_t v16 = nw_connection_copy_endpoint(v15->_connection);
      remoteEndpoint = v15->_remoteEndpoint;
      v15->_remoteEndpoint = v16;

      if (v15->_remoteEndpoint)
      {
        v15->_isAdvToBrowserConnection = a4;
        objc_storeStrong((id *)&v15->_localUniqueIDString, a5);
        -[BTVCBonjourEndpoint _startConnection](v15, "_startConnection");
        if (!v15->_isAdvToBrowserConnection)
        {
          v18 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
          remoteAdvDataSet = v15->_remoteAdvDataSet;
          v15->_remoteAdvDataSet = v18;
        }

        goto LABEL_8;
      }

      v21 = (os_log_s *)qword_1008F7710;
      if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
      {
        v24[0] = 0;
        v22 = "[BTVCBonjourEndpoint] Invalid remoteEndpoint ";
        goto LABEL_13;
      }
    }

    else
    {
      v21 = (os_log_s *)qword_1008F7710;
      if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
      {
        v24[0] = 0;
        v22 = "[BTVCBonjourEndpoint] Invalid arguments to BTVCBonjourEndpoint";
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)v24, 2u);
      }
    }

    v20 = 0LL;
    goto LABEL_15;
  }

- (void)_startConnection
{
  v3 = (os_log_s *)qword_1008F7710;
  if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
  {
    connection = self->_connection;
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = connection;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "[BTVCBonjourEndpoint] Started connecting to %@",  (uint8_t *)&buf,  0xCu);
  }

  nw_connection_set_queue(self->_connection, (dispatch_queue_t)self->_queue);
  id location = 0LL;
  objc_initWeak(&location, self);
  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v15 = 0x3032000000LL;
  nw_endpoint_t v16 = sub_100444968;
  v17 = sub_100444978;
  id v18 = 0LL;
  v6 = _NSConcreteStackBlock;
  v5 = self->_connection;
  v8 = sub_100444980;
  v9 = &unk_100898AD8;
  uint64_t v7 = 3221225472LL;
  objc_copyWeak(&v12, &location);
  v10 = self;
  p___int128 buf = &buf;
  nw_connection_set_state_changed_handler(v5, &v6);
  -[BTVCBonjourEndpoint _handleUUIDHeaders](self, "_handleUUIDHeaders", v6, v7, v8, v9);
  nw_connection_start(self->_connection);
  objc_destroyWeak(&v12);
  _Block_object_dispose(&buf, 8);

  objc_destroyWeak(&location);
}

- (id)_getServerRemoteUUIDFromConnectionMetadata:(id)a3 isAdvToBrowserConnection:(BOOL)a4
{
  v6 = (nw_connection *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (a4)
  {
    id v7 = 0LL;
  }

  else
  {
    uint64_t v15 = 0LL;
    nw_endpoint_t v16 = &v15;
    uint64_t v17 = 0x3032000000LL;
    id v18 = sub_100444968;
    v19 = sub_100444978;
    id v20 = 0LL;
    v8 = nw_protocol_copy_ws_definition();
    v9 = nw_connection_copy_protocol_metadata(v6, v8);

    v10 = nw_ws_metadata_copy_server_response(v9);
    id v11 = v10;
    if (v10)
    {
      enumerator[0] = _NSConcreteStackBlock;
      enumerator[1] = 3221225472LL;
      enumerator[2] = sub_100444FBC;
      enumerator[3] = &unk_100898B00;
      enumerator[4] = &v15;
      nw_ws_response_enumerate_additional_headers(v10, enumerator);
    }

    id v12 = (void *)v16[5];
    if (!v12)
    {
      if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_ERROR)) {
        sub_100680084();
      }
      id v12 = (void *)v16[5];
    }

    id v7 = v12;

    _Block_object_dispose(&v15, 8);
  }

  return v7;
}

- (void)_handleUUIDHeaders
{
  v3 = nw_connection_copy_parameters(self->_connection);
  v4 = nw_parameters_copy_default_protocol_stack(v3);
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  uint64_t v15 = sub_100444968;
  nw_endpoint_t v16 = sub_100444978;
  id v17 = 0LL;
  iterate_block[0] = _NSConcreteStackBlock;
  iterate_block[1] = 3221225472LL;
  iterate_block[2] = sub_100445204;
  iterate_block[3] = &unk_100898B28;
  iterate_block[4] = &v12;
  nw_protocol_stack_iterate_application_protocols(v4, iterate_block);
  v5 = (nw_protocol_options *)v13[5];
  if (v5)
  {
    if (self->_isAdvToBrowserConnection)
    {
      id location = 0LL;
      objc_initWeak(&location, self);
      v6 = (nw_protocol_options *)v13[5];
      queue = (dispatch_queue_s *)self->_queue;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_1004452B8;
      handler[3] = &unk_100898B78;
      objc_copyWeak(&v9, &location);
      nw_ws_options_set_client_request_handler(v6, queue, handler);
      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }

    else
    {
      nw_ws_options_add_additional_header( v5,  "BTVCBonjourEndpointClientUUIDHeader",  -[NSString UTF8String](self->_localUniqueIDString, "UTF8String"));
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_ERROR))
  {
    sub_1006800B0();
  }

  _Block_object_dispose(&v12, 8);
}

- (void)cancel
{
  connection = self->_connection;
  if (connection)
  {
    nw_connection_cancel(connection);
  }

  else if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_ERROR))
  {
    sub_1006800DC();
  }

- (void)receiveNextMessage
{
  if (self->_connection)
  {
    id location = 0LL;
    objc_initWeak(&location, self);
    connection = self->_connection;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_100445558;
    v4[3] = &unk_100898BA0;
    objc_copyWeak(&v5, &location);
    nw_connection_receive_message(connection, v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }

  else if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_ERROR))
  {
    sub_100680108();
  }

- (void)sendDataMessage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_connection)
  {
    id v8 = v6;
    id v9 = dispatch_data_create([v8 bytes], (size_t)objc_msgSend(v8, "length"), 0, 0);
    metadata = nw_ws_create_metadata(nw_ws_opcode_binary);
    id v11 = nw_content_context_create("send");
    nw_content_context_set_metadata_for_protocol(v11, metadata);
    connection = self->_connection;
    completion[0] = _NSConcreteStackBlock;
    completion[1] = 3221225472LL;
    completion[2] = sub_1004459A0;
    completion[3] = &unk_100898BC8;
    id v15 = v8;
    id v16 = v7;
    nw_connection_send(connection, v9, v11, 1, completion);

LABEL_5:
    goto LABEL_6;
  }

  if (v7)
  {
    NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
    id v18 = @"Unable to send message, nil connection";
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
    id v9 = (dispatch_data_s *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -6700LL,  v13));

    (*((void (**)(id, dispatch_data_s *))v7 + 2))(v7, v9);
    goto LABEL_5;
  }

+ (id)createConnectionParameters
{
  secure_tcp = nw_parameters_create_secure_tcp(_nw_parameters_configure_protocol_disable, &stru_100898C08);
  v3 = nw_parameters_copy_default_protocol_stack(secure_tcp);
  options = nw_ws_create_options(nw_ws_version_13);
  nw_ws_options_set_auto_reply_ping(options, 1);
  nw_protocol_stack_prepend_application_protocol(v3, options);
  id v5 = (nw_interface *)nw_interface_create_with_name("en0");
  nw_parameters_require_interface(secure_tcp, v5);

  id v6 = (nw_interface *)nw_interface_create_with_name("lo0");
  nw_parameters_prohibit_interface(secure_tcp, v6);

  return secure_tcp;
}

- (id)didConnectHandler
{
  return self->_didConnectHandler;
}

- (void)setDidConnectHandler:(id)a3
{
}

- (id)didDisconnectHandler
{
  return self->_didDisconnectHandler;
}

- (void)setDidDisconnectHandler:(id)a3
{
}

- (id)didReceiveDataHandler
{
  return self->_didReceiveDataHandler;
}

- (void)setDidReceiveDataHandler:(id)a3
{
}

- (OS_nw_endpoint)remoteEndpoint
{
  return (OS_nw_endpoint *)objc_getProperty(self, a2, 40LL, 1);
}

- (OS_nw_connection)connection
{
  return (OS_nw_connection *)objc_getProperty(self, a2, 48LL, 1);
}

- (BOOL)isAdvToBrowserConnection
{
  return self->_isAdvToBrowserConnection;
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (void)setIsConnected:(BOOL)a3
{
  self->_isConnected = a3;
}

- (NSString)localUniqueIDString
{
  return self->_localUniqueIDString;
}

- (void)setLocalUniqueIDString:(id)a3
{
}

- (NSString)remoteUniqueIDString
{
  return self->_remoteUniqueIDString;
}

- (void)setRemoteUniqueIDString:(id)a3
{
}

- (NSMutableSet)remoteAdvDataSet
{
  return self->_remoteAdvDataSet;
}

- (void)setRemoteAdvDataSet:(id)a3
{
}

- (BOOL)initiatedConnection
{
  return self->_initiatedConnection;
}

- (void)setInitiatedConnection:(BOOL)a3
{
  self->_initiatedConnection = a3;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end