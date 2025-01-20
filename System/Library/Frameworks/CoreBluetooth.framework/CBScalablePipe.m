@interface CBScalablePipe
- (BOOL)reliablePipe;
- (CBCentral)central;
- (CBPeer)peer;
- (CBScalablePipe)initWithPipeManager:(id)a3 info:(id)a4;
- (NSInputStream)input;
- (NSOutputStream)output;
- (NSString)name;
- (id)description;
- (int64_t)peerType;
- (int64_t)priority;
- (int64_t)type;
- (unsigned)localCLFeatures;
- (unsigned)localCLVersion;
- (unsigned)peerCLFeatures;
- (unsigned)peerCLVersion;
- (void)channel;
- (void)dealloc;
- (void)setOrphan;
@end

@implementation CBScalablePipe

- (CBScalablePipe)initWithPipeManager:(id)a3 info:(id)a4
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  v36.receiver = self;
  v36.super_class = (Class)&OBJC_CLASS___CBScalablePipe;
  v9 = -[CBScalablePipe init](&v36, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_pipeManager, a3);
    v11 = -[CBPeer initWithInfo:manager:](objc_alloc(&OBJC_CLASS___CBPeer), "initWithInfo:manager:", v8, v7);
    peer = v10->_peer;
    v10->_peer = v11;

    objc_storeStrong((id *)&v10->_central, v10->_peer);
    uint64_t v13 = [v8 objectForKeyedSubscript:@"kCBMsgArgName"];
    name = v10->_name;
    v10->_name = (NSString *)v13;

    [v8 objectForKeyedSubscript:@"kCBMsgArgType"];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_type = [v15 integerValue];

    [v8 objectForKeyedSubscript:@"kCBLePipeMsgArgPriority"];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_priority = [v16 integerValue];

    [v8 objectForKeyedSubscript:@"kCBLePipeMsgArgReliable"];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_reliablePipe = [v17 integerValue] != 0;

    [v8 objectForKeyedSubscript:@"kCBLePipeMsgArgPeerType"];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_peerType = [v18 integerValue];

    [v8 objectForKeyedSubscript:@"kCBLePipeMsgArgPeerCLVersion"];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_peerCLVersion = [v19 integerValue];

    [v8 objectForKeyedSubscript:@"kCBLePipeMsgArgPeerCLFeatures"];
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_peerCLFeatures = [v20 unsignedIntValue];

    [v8 objectForKeyedSubscript:@"kCBLePipeMsgArglocalCLVersion"];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_localCLVersion = [v21 integerValue];

    [v8 objectForKeyedSubscript:@"kCBLePipeMsgArglocalCLFeatures"];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_localCLFeatures = [v22 unsignedIntValue];

    [v8 objectForKeyedSubscript:@"kCBLePipeMsgArgSocket"];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      [v8 objectForKeyedSubscript:@"kCBLePipeMsgArgSocket"];
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v10->_int socket = [v24 intValue];

      readStream[0] = 0LL;
      CFWriteStreamRef writeStream = 0LL;
      CFStreamCreatePairWithSocket((CFAllocatorRef)*MEMORY[0x189604DB0], v10->_socket, readStream, &writeStream);
      input = v10->_input;
      v10->_input = (NSInputStream *)readStream[0];

      output = v10->_output;
      v10->_output = (NSOutputStream *)writeStream;

      if (CBLogInitOnce != -1) {
        dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
      }
      v27 = (os_log_s *)CBLogComponent;
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
      {
        int socket = v10->_socket;
        v29 = "yes";
        if (v10->_input) {
          v30 = "yes";
        }
        else {
          v30 = "no";
        }
        if (!v10->_output) {
          v29 = "no";
        }
        *(_DWORD *)buf = 138413058;
        v39 = v10;
        __int16 v40 = 1024;
        *(_DWORD *)v41 = socket;
        *(_WORD *)&v41[4] = 2080;
        *(void *)&v41[6] = v30;
        *(_WORD *)&v41[14] = 2080;
        *(void *)&v41[16] = v29;
        _os_log_impl( &dword_186F9B000,  v27,  OS_LOG_TYPE_DEFAULT,  "%@ created socket pipe: fd %d, in %s, out %s",  buf,  0x26u);
      }
    }

    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        readStream[0] = 0LL;
        readStream[1] = 0LL;
        [v23 getUUIDBytes:readStream];
        if (uuid_is_null((const unsigned __int8 *)readStream))
        {
          if (CBLogInitOnce != -1) {
            dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
          }
          if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
            -[CBScalablePipe initWithPipeManager:info:].cold.1();
          }
        }

        else
        {
          os_channel_attr_create();
          os_channel_attr_set();
          v10->_channel = (void *)os_channel_create_extended();
          os_channel_attr_destroy();
          if (CBLogInitOnce != -1) {
            dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
          }
          v32 = (os_log_s *)CBLogComponent;
          if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
          {
            channel = v10->_channel;
            *(_DWORD *)buf = 138412802;
            if (channel) {
              v34 = "yes";
            }
            else {
              v34 = "no";
            }
            v39 = v10;
            __int16 v40 = 2112;
            *(void *)v41 = v23;
            *(_WORD *)&v41[8] = 2080;
            *(void *)&v41[10] = v34;
            _os_log_impl( &dword_186F9B000,  v32,  OS_LOG_TYPE_DEFAULT,  "%@ created skywalk pipe: UUID %@, channel %s",  buf,  0x20u);
          }
        }
      }

      else
      {
        if (CBLogInitOnce != -1) {
          dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
        }
        if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
          -[CBScalablePipe initWithPipeManager:info:].cold.2();
        }
      }
    }
  }

  return v10;
}

- (void)setOrphan
{
  pipeManager = self->_pipeManager;
  self->_pipeManager = 0LL;
}

- (void)dealloc
{
  int socket = self->_socket;
  if (socket) {
    close(socket);
  }
  if (self->_channel) {
    os_channel_destroy();
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CBScalablePipe;
  -[CBScalablePipe dealloc](&v4, sel_dealloc);
}

- (id)description
{
  v3 = (void *)NSString;
  uint64_t v4 = objc_opt_class();
  v5 = "low";
  v6 = "medium";
  int64_t type = self->_type;
  int64_t priority = self->_priority;
  v9 = "isochronous";
  if (priority == 2) {
    v9 = "high";
  }
  if (priority != 1) {
    v6 = v9;
  }
  if (priority) {
    v5 = v6;
  }
  v10 = "server";
  if (type != 1) {
    v10 = "peer-to-peer";
  }
  if (!type) {
    v10 = "client";
  }
  if (self->_reliablePipe) {
    v11 = "ON";
  }
  else {
    v11 = "OFF";
  }
  v12 = "yes";
  if (!self->_channel) {
    v12 = "no";
  }
  return (id)[v3 stringWithFormat:@"<%@: peer = %@, name = %@, int64_t type = %s, priority = %s reliability is %s, socket %d, channel %s>", v4, self->_peer, self->_name, v10, v5, v11, self->_socket, v12];
}

- (CBCentral)central
{
  return self->_central;
}

- (CBPeer)peer
{
  return self->_peer;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)priority
{
  return self->_priority;
}

- (BOOL)reliablePipe
{
  return self->_reliablePipe;
}

- (int64_t)peerType
{
  return self->_peerType;
}

- (NSInputStream)input
{
  return self->_input;
}

- (NSOutputStream)output
{
  return self->_output;
}

- (void)channel
{
  return self->_channel;
}

- (unsigned)localCLVersion
{
  return self->_localCLVersion;
}

- (unsigned)peerCLVersion
{
  return self->_peerCLVersion;
}

- (unsigned)localCLFeatures
{
  return self->_localCLFeatures;
}

- (unsigned)peerCLFeatures
{
  return self->_peerCLFeatures;
}

- (void).cxx_destruct
{
}

- (void)initWithPipeManager:info:.cold.1()
{
}

- (void)initWithPipeManager:info:.cold.2()
{
}

@end