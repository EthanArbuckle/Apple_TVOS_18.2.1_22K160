@interface IDSMultiplexerSimulatorConnection
- (BOOL)tryConsumePacketBuffer:(id *)a3;
- (IDSMultiplexerSimulatorConnection)initWithConnection:(id)a3;
- (OS_nw_protocol_definition)protocol;
- (void)callPacketBufferReadHandler:(id *)a3;
- (void)invalidate;
- (void)receiveFromSimulatorSendToQRLoopFromConnection:(id)a3;
- (void)sendToSimulatorLoopOnConnection:(id)a3 withData:(id)a4;
- (void)setProtocol:(id)a3;
- (void)writePacketBuffer:(id *)a3;
@end

@implementation IDSMultiplexerSimulatorConnection

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id readHandler = self->super._readHandler;
  self->super._id readHandler = 0LL;

  self->super._invalidated = 1;
  os_unfair_lock_unlock(p_lock);
}

- (IDSMultiplexerSimulatorConnection)initWithConnection:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___IDSMultiplexerSimulatorConnection;
  id v3 = a3;
  v4 = -[IDSMultiplexerConnection init](&v7, "init");
  v4->super._invalidated = 0;
  -[IDSMultiplexerConnection setConnection:](v4, "setConnection:", v3, v7.receiver, v7.super_class);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSMultiplexerConnection connection](v4, "connection"));
  -[IDSMultiplexerSimulatorConnection receiveFromSimulatorSendToQRLoopFromConnection:]( v4,  "receiveFromSimulatorSendToQRLoopFromConnection:",  v5);

  return v4;
}

- (void)receiveFromSimulatorSendToQRLoopFromConnection:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1003CB6B0;
  v4[3] = &unk_1009040D0;
  v4[4] = self;
  id v5 = a3;
  id v3 = (nw_connection *)v5;
  nw_connection_receive(v3, 1u, 0xFFFFFFFF, v4);
}

- (void)sendToSimulatorLoopOnConnection:(id)a3 withData:(id)a4
{
}

- (void)callPacketBufferReadHandler:(id *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL invalidated = self->super._invalidated;
  os_unfair_lock_unlock(p_lock);
  if (invalidated)
  {
    objc_super v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      v9 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "readPacketBuffer called but invalidated - %@",  (uint8_t *)&v8,  0xCu);
    }
  }

  else
  {
    (*((void (**)(id, $54F6A343B951227605E470F4B19DD8D1 *))self->super._readHandler + 2))( self->super._readHandler,  a3);
  }

- (void)writePacketBuffer:(id *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSMultiplexerConnection connection](self, "connection"));
  BOOL invalidated = self->super._invalidated;
  os_unfair_lock_unlock(p_lock);
  if (invalidated)
  {
    int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      v10 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "writePacketBuffer called but invalidated - %@",  (uint8_t *)&v9,  0xCu);
    }
  }

  else
  {
    int v8 = (os_log_s *)dispatch_data_create(a3->var0 + 8, a3->var2 - 8, 0LL, 0LL);
    -[IDSMultiplexerSimulatorConnection sendToSimulatorLoopOnConnection:withData:]( self,  "sendToSimulatorLoopOnConnection:withData:",  v6,  v8);
  }
}

- (BOOL)tryConsumePacketBuffer:(id *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->super._invalidated)
  {
    os_unfair_lock_unlock(p_lock);
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      *(void *)v17 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "writePacketBuffer called but invalidated - %@",  (uint8_t *)&v16,  0xCu);
    }
  }

  else if (a3->var2 > 3)
  {
    unsigned int v9 = __rev16(*(unsigned __int16 *)a3->var0);
    unsigned int v10 = __rev16(*((unsigned __int16 *)a3->var0 + 1));
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v12 = -[IDSMultiplexerConnection localPort](self, "localPort");
      unsigned int v13 = -[IDSMultiplexerConnection remotePort](self, "remotePort");
      int64_t var2 = a3->var2;
      int v16 = 67110144;
      *(_DWORD *)v17 = v12;
      *(_WORD *)&v17[4] = 1024;
      *(_DWORD *)&v17[6] = v13;
      __int16 v18 = 1024;
      unsigned int v19 = v10;
      __int16 v20 = 1024;
      unsigned int v21 = v9;
      __int16 v22 = 2048;
      int64_t v23 = var2;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "connection local:%u remote:%u tryConsume packet dst:%u src:%u packetBufferLength:%ld",  (uint8_t *)&v16,  0x24u);
    }

    if (-[IDSMultiplexerConnection localPort](self, "localPort") == v10
      && (!-[IDSMultiplexerConnection remotePort](self, "remotePort")
       || -[IDSMultiplexerConnection remotePort](self, "remotePort") == v9))
    {
      os_unfair_lock_unlock(p_lock);
      -[IDSMultiplexerSimulatorConnection writePacketBuffer:](self, "writePacketBuffer:", a3);
      return 1;
    }

    os_unfair_lock_unlock(p_lock);
  }

  else
  {
    os_unfair_lock_unlock(p_lock);
    objc_super v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v8 = a3->var2;
      int v16 = 134217984;
      *(void *)v17 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Connection cannot retrieve port signature, invalid packetBuffer size: %ld",  (uint8_t *)&v16,  0xCu);
    }
  }

  return 0;
}

- (OS_nw_protocol_definition)protocol
{
  return self->_protocol;
}

- (void)setProtocol:(id)a3
{
}

- (void).cxx_destruct
{
}

@end