@interface IDSMultiplexerGroupConnection
- (BOOL)tryConsumePacketBuffer:(id *)a3;
- (BOOL)verboseFunctionalLogging;
- (OS_nw_framer)framer;
- (OS_nw_protocol_definition)protocol;
- (id)getProtocolDefinition;
- (void)callPacketBufferReadHandler:(id *)a3;
- (void)invalidate;
- (void)setFramer:(id)a3;
- (void)setProtocol:(id)a3;
- (void)setVerboseFunctionalLogging:(BOOL)a3;
- (void)writePacketBuffer:(id *)a3;
@end

@implementation IDSMultiplexerGroupConnection

- (void)invalidate
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  self->super._invalidated = 1;
  objc_storeWeak((id *)&self->_framer, 0LL);
  protocol = self->_protocol;
  self->_protocol = 0LL;

  id readHandler = self->super._readHandler;
  self->super._id readHandler = 0LL;

  os_unfair_lock_unlock(p_lock);
}

- (id)getProtocolDefinition
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  protocol = self->_protocol;
  if (!protocol)
  {
    self->_verboseFunctionalLogging = IMGetCachedDomainBoolForKeyWithDefaultValue( @"com.apple.ids",  @"SessionFunctionalLogging",  0LL);
    v5 = sub_1003CA7A4(self);
    v6 = self->_protocol;
    self->_protocol = v5;

    protocol = self->_protocol;
  }

  v7 = protocol;
  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (void)callPacketBufferReadHandler:(id *)a3
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  if (self->super._invalidated)
  {
    os_unfair_lock_unlock(p_lock);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
    if (!os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
    {
LABEL_5:

      return;
    }

    *(_DWORD *)buf = 138412290;
    v12 = self;
    v7 = "readPacketBuffer called but invalidated - %@";
LABEL_4:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v6, OS_LOG_TYPE_DEFAULT, v7, buf, 0xCu);
    goto LABEL_5;
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_framer);

  if (!WeakRetained)
  {
    os_unfair_lock_unlock(p_lock);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
    if (!os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_5;
    }
    *(_DWORD *)buf = 138412290;
    v12 = self;
    v7 = "readPacketBuffer called but framer is nil - %@";
    goto LABEL_4;
  }

  id readHandler = self->super._readHandler;
  if (!readHandler)
  {
    os_unfair_lock_unlock(p_lock);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
    if (!os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_5;
    }
    *(_DWORD *)buf = 138412290;
    v12 = self;
    v7 = "readPacketBuffer called but readHandler is nil - %@";
    goto LABEL_4;
  }

  v10 = (void (**)(id, $54F6A343B951227605E470F4B19DD8D1 *))objc_retainBlock(readHandler);
  os_unfair_lock_unlock(p_lock);
  v10[2](v10, a3);
}

- (void)writePacketBuffer:(id *)a3
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  if (!self->super._invalidated)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_framer);
    if (WeakRetained)
    {
      if (a3->var2 > 7)
      {
        var0 = a3->var0;
        *(_WORD *)var0 = __rev16(-[IDSMultiplexerConnection remotePort](self, "remotePort"));
        *((_WORD *)var0 + 1) = __rev16(-[IDSMultiplexerConnection localPort](self, "localPort"));
        v11 = (nw_endpoint *)objc_claimAutoreleasedReturnValue(-[IDSMultiplexerConnection localEndpoint](self, "localEndpoint"));
        address = nw_endpoint_get_address(v11);

        v13 = (nw_endpoint *)objc_claimAutoreleasedReturnValue(-[IDSMultiplexerConnection remoteEndpoint](self, "remoteEndpoint"));
        v14 = nw_endpoint_get_address(v13);

        if (address->sa_family != 30) {
          sub_1006AC4FC();
        }
        if (v14->sa_family != 30) {
          sub_1006AC4D4();
        }
        udp6checksum( (int8x16_t *)&address->sa_data[6],  (int8x16_t *)&v14->sa_data[6],  (int8x16_t *)a3->var0,  a3->var2,  v15);
        if (self->_verboseFunctionalLogging)
        {
          v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            v17 = sub_1001FF4E0((uint64_t)a3->var0, a3->var2);
            *(_DWORD *)buf = 136315138;
            v23 = (IDSMultiplexerGroupConnection *)v17;
            _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "writePacketBuffer whole packet:\n%s",  buf,  0xCu);
          }
        }

        os_unfair_lock_unlock(p_lock);
        dispatch_data_t v18 = dispatch_data_create(a3->var0, a3->var2, 0LL, 0LL);
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472LL;
        v19[2] = sub_1003CB1E8;
        v19[3] = &unk_1008F5F80;
        v20 = (nw_framer *)WeakRetained;
        dispatch_data_t v21 = v18;
        v7 = v18;
        nw_framer_async(v20, v19);

        goto LABEL_18;
      }

      os_unfair_lock_unlock(p_lock);
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int64_t var2 = a3->var2;
        *(_DWORD *)buf = 134217984;
        v23 = (IDSMultiplexerGroupConnection *)var2;
        v9 = "packet doest not have enough bytes for header %ld";
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v9, buf, 0xCu);
      }
    }

    else
    {
      os_unfair_lock_unlock(p_lock);
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v23 = self;
        v9 = "writePacketBuffer called but framer is nil - %@";
        goto LABEL_10;
      }
    }

- (BOOL)tryConsumePacketBuffer:(id *)a3
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  if (self->super._invalidated)
  {
    os_unfair_lock_unlock(p_lock);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
    if (!os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
    {
LABEL_5:

      return 0;
    }

    int v18 = 138412290;
    *(void *)v19 = self;
    v7 = "writePacketBuffer called but invalidated - %@";
LABEL_4:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v18, 0xCu);
    goto LABEL_5;
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_framer);

  if (!WeakRetained)
  {
    os_unfair_lock_unlock(p_lock);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
    if (!os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_5;
    }
    int v18 = 138412290;
    *(void *)v19 = self;
    v7 = "writePacketBuffer called but framer is nil - %@";
    goto LABEL_4;
  }

  if (a3->var2 > 3)
  {
    unsigned int v12 = __rev16(*(unsigned __int16 *)a3->var0);
    unsigned int v13 = __rev16(*((unsigned __int16 *)a3->var0 + 1));
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v15 = -[IDSMultiplexerConnection localPort](self, "localPort");
      unsigned int v16 = -[IDSMultiplexerConnection remotePort](self, "remotePort");
      int64_t var2 = a3->var2;
      int v18 = 67110144;
      *(_DWORD *)v19 = v15;
      *(_WORD *)&void v19[4] = 1024;
      *(_DWORD *)&v19[6] = v16;
      __int16 v20 = 1024;
      unsigned int v21 = v13;
      __int16 v22 = 1024;
      unsigned int v23 = v12;
      __int16 v24 = 2048;
      int64_t v25 = var2;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "connection local:%u remote:%u tryConsume packet dst:%u src:%u packetBufferLength:%ld",  (uint8_t *)&v18,  0x24u);
    }

    if (-[IDSMultiplexerConnection localPort](self, "localPort") == v13
      && (!-[IDSMultiplexerConnection remotePort](self, "remotePort")
       || -[IDSMultiplexerConnection remotePort](self, "remotePort") == v12))
    {
      os_unfair_lock_unlock(p_lock);
      -[IDSMultiplexerGroupConnection writePacketBuffer:](self, "writePacketBuffer:", a3);
      return 1;
    }

    os_unfair_lock_unlock(p_lock);
  }

  else
  {
    os_unfair_lock_unlock(p_lock);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog Multiplexer](&OBJC_CLASS___IDSFoundationLog, "Multiplexer"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v11 = a3->var2;
      int v18 = 134217984;
      *(void *)v19 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Connection cannot retrieve port signature, invalid packetBuffer size: %ld",  (uint8_t *)&v18,  0xCu);
    }
  }

  return 0;
}

- (OS_nw_framer)framer
{
  return (OS_nw_framer *)objc_loadWeakRetained((id *)&self->_framer);
}

- (void)setFramer:(id)a3
{
}

- (OS_nw_protocol_definition)protocol
{
  return self->_protocol;
}

- (void)setProtocol:(id)a3
{
}

- (BOOL)verboseFunctionalLogging
{
  return self->_verboseFunctionalLogging;
}

- (void)setVerboseFunctionalLogging:(BOOL)a3
{
  self->_verboseFunctionalLogging = a3;
}

- (void).cxx_destruct
{
}

@end