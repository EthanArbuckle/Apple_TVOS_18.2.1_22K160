@interface IDSConnectionContext
- (IDSConnectionContext)initWithReadHandler:(id)a3;
- (IDSDeviceConnectionInfo)deviceConnectionInfo;
- (IDSGenericConnection)connection;
- (id)readHandler;
- (void)setConnection:(id)a3;
- (void)setDeviceConnectionInfo:(id)a3;
@end

@implementation IDSConnectionContext

- (IDSConnectionContext)initWithReadHandler:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___IDSConnectionContext;
  v5 = -[IDSConnectionContext init](&v16, "init");
  if (v5)
  {
    id v6 = objc_retainBlock(v4);
    id readHandler = v5->_readHandler;
    v5->_id readHandler = v6;
  }

  uint64_t v8 = OSLogHandleForTransportCategory("IDSGenericConnection");
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = objc_retainBlock(v5->_readHandler);
    *(_DWORD *)buf = 134218240;
    id v18 = v10;
    __int16 v19 = 2048;
    v20 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "initWithReadHandler: readHandler: %p, self: %p",  buf,  0x16u);
  }

  uint64_t v12 = os_log_shim_legacy_logging_enabled(v11);
  if ((_DWORD)v12)
  {
    if (_IDSShouldLogTransport(v12))
    {
      id v14 = objc_retainBlock(v5->_readHandler);
      _IDSLogTransport( @"IDSGenericConnection",  @"IDS",  @"initWithReadHandler: readHandler: %p, self: %p");

      if (_IDSShouldLog(0LL, @"IDSGenericConnection"))
      {
        id v15 = objc_retainBlock(v5->_readHandler);
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSGenericConnection",  @"initWithReadHandler: readHandler: %p, self: %p");
      }
    }
  }

  return v5;
}

- (id)readHandler
{
  return self->_readHandler;
}

- (IDSGenericConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (IDSDeviceConnectionInfo)deviceConnectionInfo
{
  return self->_deviceConnectionInfo;
}

- (void)setDeviceConnectionInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end