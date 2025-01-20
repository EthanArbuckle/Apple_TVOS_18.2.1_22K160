@interface BUISAgentXPCConnection
- (BOOL)_entitledAndReturnError:(id *)a3;
- (BOOL)entitled;
- (BluetoothUIService)agent;
- (OS_dispatch_queue)dispatchQueue;
- (OS_xpc_object)xpcCnx;
- (int)pid;
- (void)_xpcSendReplyError:(id)a3 request:(id)a4;
- (void)invalidate;
- (void)setAgent:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setEntitled:(BOOL)a3;
- (void)setPid:(int)a3;
- (void)setXpcCnx:(id)a3;
- (void)xpcConnectionEvent:(id)a3;
- (void)xpcConnectionMessage:(id)a3;
- (void)xpcSendMessage:(int)a3;
@end

@implementation BUISAgentXPCConnection

- (void)invalidate
{
  xpcCnx = self->_xpcCnx;
  if (xpcCnx) {
    xpc_connection_cancel(xpcCnx);
  }
}

- (BOOL)_entitledAndReturnError:(id *)a3
{
  if (self->_entitled) {
    return 1;
  }
  if ((xpc_connection_has_entitlement(self->_xpcCnx, "com.apple.BluetoothUIService") & 1) != 0)
  {
    BOOL result = 1;
    self->_entitled = 1;
  }

  else
  {
    uint64_t v6 = NSErrorF(NSOSStatusErrorDomain, 4294896128LL, "Missing entitlement: %s", "com.apple.BluetoothUIService");
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    if (dword_1000114F8 <= 90
      && (dword_1000114F8 != -1 || _LogCategory_Initialize(&dword_1000114F8, 90LL)))
    {
      LogPrintF( &dword_1000114F8,  "-[BUISAgentXPCConnection _entitledAndReturnError:]",  90LL,  "### XPC denied: %#{pid}, %{error}",  self->_pid,  v7);
    }

    if (a3) {
      *a3 = v7;
    }

    return 0;
  }

  return result;
}

- (void)xpcConnectionEvent:(id)a3
{
  id v7 = a3;
  if (xpc_get_type(v7) == (xpc_type_t)&_xpc_type_dictionary)
  {
    -[BUISAgentXPCConnection xpcConnectionMessage:](self, "xpcConnectionMessage:", v7);
    goto LABEL_14;
  }

  if (v7 == &_xpc_error_connection_invalid)
  {
    if (dword_1000114F8 <= 20
      && (dword_1000114F8 != -1 || _LogCategory_Initialize(&dword_1000114F8, 20LL)))
    {
      LogPrintF( &dword_1000114F8,  "-[BUISAgentXPCConnection xpcConnectionEvent:]",  20LL,  "XPC connection ended: %#{pid}",  self->_pid);
    }

    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = 0LL;

    -[BUISAgentXPCConnection invalidate](self, "invalidate");
    goto LABEL_14;
  }

  v4 = v7;
  if (dword_1000114F8 <= 90)
  {
    if (dword_1000114F8 != -1 || (int v5 = _LogCategory_Initialize(&dword_1000114F8, 90LL), v4 = v7, v5))
    {
      LogPrintF( &dword_1000114F8,  "-[BUISAgentXPCConnection xpcConnectionEvent:]",  90LL,  "### XPC connection error: %{xpc}",  v4);
LABEL_14:
      v4 = v7;
    }
  }
}

- (void)xpcConnectionMessage:(id)a3
{
  id v4 = a3;
  string = xpc_dictionary_get_string(v4, "BUISKeyType");
  if (!string)
  {
    if (dword_1000114F8 <= 90
      && (dword_1000114F8 != -1 || _LogCategory_Initialize(&dword_1000114F8, 90LL)))
    {
      LogPrintF(&dword_1000114F8, "-[BUISAgentXPCConnection xpcConnectionMessage:]", 90LL, "### XPC no message type");
    }

    uint64_t v9 = NSErrorF(NSOSStatusErrorDomain, 4294960561LL, "Unknown message type: %lld", 0LL);
    goto LABEL_17;
  }

  uint64_t v6 = string;
  if (strcmp(string, "BUISKeyArgType"))
  {
    if (dword_1000114F8 <= 90
      && (dword_1000114F8 != -1 || _LogCategory_Initialize(&dword_1000114F8, 90LL)))
    {
      LogPrintF( &dword_1000114F8,  "-[BUISAgentXPCConnection xpcConnectionMessage:]",  90LL,  "### XPC unknown message type: %lld",  v6);
    }

    uint64_t v9 = NSErrorF(NSOSStatusErrorDomain, 4294960561LL, "Unknown message type: %lld", v6);
LABEL_17:
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    -[BUISAgentXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v10, v4);

LABEL_18:
    id v8 = 0LL;
    goto LABEL_19;
  }

  id v11 = 0LL;
  unsigned int v7 = -[BUISAgentXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v11);
  id v8 = v11;
  if (v7) {
    -[BluetoothUIService activateBanner:withXPCConnection:](self->_agent, "activateBanner:withXPCConnection:", v4, self);
  }
LABEL_19:
}

- (void)xpcSendMessage:(int)a3
{
  connection = self->_xpcCnx;
  if (connection)
  {
    xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_int64(v5, (const char *)[@"BUISKeyType" UTF8String], a3);
    xpc_connection_send_message_with_reply(connection, v5, (dispatch_queue_t)self->_dispatchQueue, &stru_10000C4A8);

LABEL_3:
    uint64_t v6 = connection;
    goto LABEL_4;
  }

  uint64_t v6 = 0LL;
  if (dword_1000114F8 <= 90)
  {
    if (dword_1000114F8 != -1 || (v7 = _LogCategory_Initialize(&dword_1000114F8, 90LL), uint64_t v6 = 0LL, v7))
    {
      LogPrintF(&dword_1000114F8, "-[BUISAgentXPCConnection xpcSendMessage:]", 90LL, "### No valid XPC connection");
      goto LABEL_3;
    }
  }

- (void)_xpcSendReplyError:(id)a3 request:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  int v7 = self->_xpcCnx;
  if (v7)
  {
    xpc_object_t reply = xpc_dictionary_create_reply(v6);
    if (reply)
    {
      CUXPCEncodeNSError(v9, reply, "errO", "errC", "errD", "errM", "errO");
      xpc_connection_send_message(v7, reply);
    }

    else if (dword_1000114F8 <= 90 {
           && (dword_1000114F8 != -1 || _LogCategory_Initialize(&dword_1000114F8, 90LL)))
    }
    {
      LogPrintF( &dword_1000114F8,  "-[BUISAgentXPCConnection _xpcSendReplyError:request:]",  90LL,  "### Send error create reply failed");
    }
  }

  else if (dword_1000114F8 <= 90 {
         && (dword_1000114F8 != -1 || _LogCategory_Initialize(&dword_1000114F8, 90LL)))
  }
  {
    LogPrintF( &dword_1000114F8,  "-[BUISAgentXPCConnection _xpcSendReplyError:request:]",  90LL,  "### Send error with no cnx");
  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (BOOL)entitled
{
  return self->_entitled;
}

- (void)setEntitled:(BOOL)a3
{
  self->_entitled = a3;
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (OS_xpc_object)xpcCnx
{
  return self->_xpcCnx;
}

- (void)setXpcCnx:(id)a3
{
}

- (BluetoothUIService)agent
{
  return self->_agent;
}

- (void)setAgent:(id)a3
{
}

- (void).cxx_destruct
{
}

@end