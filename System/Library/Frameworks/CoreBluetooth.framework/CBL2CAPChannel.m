@interface CBL2CAPChannel
- (BOOL)isIncoming;
- (CBL2CAPChannel)initWithPeer:(id)a3 info:(id)a4;
- (CBL2CAPPSM)PSM;
- (CBPeer)peer;
- (CBUUID)serviceUUID;
- (NSInputStream)inputStream;
- (NSOutputStream)outputStream;
- (id)description;
- (int)socketFD;
- (void)dealloc;
- (void)setIsIncoming:(BOOL)a3;
- (void)setServiceUUID:(id)a3;
@end

@implementation CBL2CAPChannel

- (CBL2CAPChannel)initWithPeer:(id)a3 info:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___CBL2CAPChannel;
  v9 = -[CBL2CAPChannel init](&v22, sel_init);
  if (!v9) {
    goto LABEL_8;
  }
  [v8 objectForKey:@"kCBMsgArgPSM"];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v9->_PSM = [v10 intValue];

  objc_storeStrong((id *)&v9->_peer, a3);
  v9->_socketFD = -1;
  [v8 objectForKey:@"kCBMsgArgIsIncoming"];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v9->_isIncoming = [v11 intValue] != 0;

  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
  }
  v12 = (os_log_s *)CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
    -[CBL2CAPChannel initWithPeer:info:].cold.2(&v9->_PSM, v12);
  }
  [v8 objectForKeyedSubscript:@"kCBMsgArgSocket"];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (CBLogInitOnce == -1)
    {
      v18 = (os_log_s *)CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
      {
LABEL_11:

        v17 = 0LL;
        goto LABEL_12;
      }
    }

    else
    {
      dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
      v18 = (os_log_s *)CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
        goto LABEL_11;
      }
    }

    -[CBL2CAPChannel initWithPeer:info:].cold.1(v18);
    goto LABEL_11;
  }

  [v8 objectForKeyedSubscript:@"kCBMsgArgSocket"];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v9->_socketFD = [v14 intValue];

  v20 = 0LL;
  CFReadStreamRef readStream = 0LL;
  CFStreamCreatePairWithSocket( (CFAllocatorRef)*MEMORY[0x189604DB0],  v9->_socketFD,  &readStream,  (CFWriteStreamRef *)&v20);
  inputStream = v9->_inputStream;
  v9->_inputStream = (NSInputStream *)readStream;

  outputStream = v9->_outputStream;
  v9->_outputStream = v20;

LABEL_8:
  v17 = v9;
LABEL_12:

  return v17;
}

- (void)dealloc
{
  int socketFD = self->_socketFD;
  if ((socketFD & 0x80000000) == 0)
  {
    close(socketFD);
    self->_int socketFD = -1;
  }
  v4 = -[CBPeer manager](self->_peer, "manager");
  v5 = -[CBPeer identifier](self->_peer, "identifier");
  objc_msgSend(v4, "closeL2CAPChannelForPeerUUID:withPsm:", v5, -[CBL2CAPChannel PSM](self, "PSM"));

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CBL2CAPChannel;
  -[CBL2CAPChannel dealloc](&v6, sel_dealloc);
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p peer = %@, psm = %d>", objc_opt_class(), self, self->_peer, self->_PSM];
}

- (CBPeer)peer
{
  return self->_peer;
}

- (NSInputStream)inputStream
{
  return self->_inputStream;
}

- (NSOutputStream)outputStream
{
  return self->_outputStream;
}

- (CBL2CAPPSM)PSM
{
  return self->_PSM;
}

- (CBUUID)serviceUUID
{
  return self->_serviceUUID;
}

- (void)setServiceUUID:(id)a3
{
}

- (BOOL)isIncoming
{
  return self->_isIncoming;
}

- (void)setIsIncoming:(BOOL)a3
{
  self->_isIncoming = a3;
}

- (int)socketFD
{
  return self->_socketFD;
}

- (void).cxx_destruct
{
}

- (void)initWithPeer:(os_log_t)log info:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_186F9B000, log, OS_LOG_TYPE_ERROR, "Skywalk unsupported with le l2cap channels", v1, 2u);
}

- (void)initWithPeer:(unsigned __int16 *)a1 info:(os_log_s *)a2 .cold.2(unsigned __int16 *a1, os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl(&dword_186F9B000, a2, OS_LOG_TYPE_DEBUG, "Init CBL2CAPChannel with psm : %u", (uint8_t *)v3, 8u);
}

@end