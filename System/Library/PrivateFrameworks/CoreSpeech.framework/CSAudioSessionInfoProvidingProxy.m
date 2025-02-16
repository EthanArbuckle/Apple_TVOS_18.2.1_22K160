@interface CSAudioSessionInfoProvidingProxy
- (CSAudioSessionInfoProviding)audioSessionInfoProvider;
- (CSAudioSessionInfoProvidingProxy)initWithXPCConnection:(id)a3;
- (CSClientXPCConnection)xpcConnection;
- (unint64_t)streamClientType;
- (void)_handleSessionIDRequestMessage:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)_sendDelegateMessageToClient:(id)a3;
- (void)audioSessionInfoProvider:(id)a3 didReceiveAudioSessionInterruptionNotificationWithUserInfo:(id)a4;
- (void)audioSessionInfoProvider:(id)a3 didReceiveAudioSessionMediaServicesWereLostNotificationWithUserInfo:(id)a4;
- (void)audioSessionInfoProvider:(id)a3 didReceiveAudioSessionMediaServicesWereResetNotificationWithUserInfo:(id)a4;
- (void)audioSessionInfoProvider:(id)a3 didReceiveAudioSessionRouteChangeNotificationWithUserInfo:(id)a4;
- (void)handleXPCMessage:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)setAudioSessionInfoProvider:(id)a3;
- (void)setStreamClientType:(unint64_t)a3;
- (void)setXpcConnection:(id)a3;
@end

@implementation CSAudioSessionInfoProvidingProxy

- (CSAudioSessionInfoProvidingProxy)initWithXPCConnection:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CSAudioSessionInfoProvidingProxy;
  v5 = -[CSAudioSessionInfoProvidingProxy init](&v8, "init");
  v6 = v5;
  if (v5) {
    -[CSAudioSessionInfoProvidingProxy setXpcConnection:](v5, "setXpcConnection:", v4);
  }

  return v6;
}

- (void)handleXPCMessage:(id)a3 messageBody:(id)a4 client:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int64_t int64 = xpc_dictionary_get_int64(v9, "type");
  if (int64 == 1)
  {
    -[CSAudioSessionInfoProvidingProxy _handleSessionIDRequestMessage:messageBody:client:]( self,  "_handleSessionIDRequestMessage:messageBody:client:",  v8,  v9,  v10);
  }

  else
  {
    int64_t v12 = int64;
    v13 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315394;
      v15 = "-[CSAudioSessionInfoProvidingProxy handleXPCMessage:messageBody:client:]";
      __int16 v16 = 2048;
      int64_t v17 = v12;
      _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%s Cannot handle unexpected message type : %lld",  (uint8_t *)&v14,  0x16u);
    }
  }
}

- (void)_handleSessionIDRequestMessage:(id)a3 messageBody:(id)a4 client:(id)a5
{
  id v8 = a4;
  id v9 = (_xpc_connection_s *)a5;
  xpc_object_t reply = xpc_dictionary_create_reply(a3);
  p_audioSessionInfoProvider = &self->_audioSessionInfoProvider;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audioSessionInfoProvider);

  if (WeakRetained)
  {
    string = xpc_dictionary_get_string(v8, "deviceID");
    if (string) {
      int v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string));
    }
    else {
      int v14 = 0LL;
    }
    id v16 = objc_loadWeakRetained((id *)p_audioSessionInfoProvider);
    unsigned int v17 = [v16 audioSessionIdForDeviceId:v14];

    v18 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 136315650;
      v20 = "-[CSAudioSessionInfoProvidingProxy _handleSessionIDRequestMessage:messageBody:client:]";
      __int16 v21 = 2114;
      v22 = v14;
      __int16 v23 = 2050;
      uint64_t v24 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%s sessionID(for deviceId %{public}@ = %{public}llu",  (uint8_t *)&v19,  0x20u);
    }

    xpc_dictionary_set_BOOL(reply, "result", 1);
    xpc_dictionary_set_uint64(reply, "sessionID", v17);
  }

  else
  {
    v15 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v19 = 136315138;
      v20 = "-[CSAudioSessionInfoProvidingProxy _handleSessionIDRequestMessage:messageBody:client:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%s Trying to get sessionID when audioSessionInfoProvider is nil",  (uint8_t *)&v19,  0xCu);
    }

    xpc_dictionary_set_BOOL(reply, "result", 0);
  }

  xpc_connection_send_message(v9, reply);
}

- (void)audioSessionInfoProvider:(id)a3 didReceiveAudioSessionInterruptionNotificationWithUserInfo:(id)a4
{
  keys = "type";
  id v5 = a4;
  xpc_object_t values = xpc_int64_create(1LL);
  xpc_object_t v6 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_cs_xpcObject"));

  xpc_dictionary_set_value(v6, "notificationInfo", v7);
  -[CSAudioSessionInfoProvidingProxy _sendDelegateMessageToClient:](self, "_sendDelegateMessageToClient:", v6);
}

- (void)audioSessionInfoProvider:(id)a3 didReceiveAudioSessionRouteChangeNotificationWithUserInfo:(id)a4
{
  keys = "type";
  id v5 = a4;
  xpc_object_t values = xpc_int64_create(2LL);
  xpc_object_t v6 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_cs_xpcObject"));

  xpc_dictionary_set_value(v6, "notificationInfo", v7);
  -[CSAudioSessionInfoProvidingProxy _sendDelegateMessageToClient:](self, "_sendDelegateMessageToClient:", v6);
}

- (void)audioSessionInfoProvider:(id)a3 didReceiveAudioSessionMediaServicesWereLostNotificationWithUserInfo:(id)a4
{
  keys = "type";
  id v5 = a4;
  xpc_object_t values = xpc_int64_create(3LL);
  xpc_object_t v6 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_cs_xpcObject"));

  xpc_dictionary_set_value(v6, "notificationInfo", v7);
  -[CSAudioSessionInfoProvidingProxy _sendDelegateMessageToClient:](self, "_sendDelegateMessageToClient:", v6);
}

- (void)audioSessionInfoProvider:(id)a3 didReceiveAudioSessionMediaServicesWereResetNotificationWithUserInfo:(id)a4
{
  keys = "type";
  id v5 = a4;
  xpc_object_t values = xpc_int64_create(4LL);
  xpc_object_t v6 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_cs_xpcObject"));

  xpc_dictionary_set_value(v6, "notificationInfo", v7);
  -[CSAudioSessionInfoProvidingProxy _sendDelegateMessageToClient:](self, "_sendDelegateMessageToClient:", v6);
}

- (void)_sendDelegateMessageToClient:(id)a3
{
  id v4 = a3;
  *(_OWORD *)keys = *(_OWORD *)off_10022E270;
  v9[0] = xpc_int64_create(11LL);
  id v5 = v4;
  v9[1] = v5;
  xpc_object_t v6 = xpc_dictionary_create((const char *const *)keys, v9, 2uLL);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSAudioSessionInfoProvidingProxy xpcConnection](self, "xpcConnection", v9[0]));
  [v7 sendMessageToClient:v6];

  for (uint64_t i = 1LL; i != -1; --i)
}

- (CSAudioSessionInfoProviding)audioSessionInfoProvider
{
  return (CSAudioSessionInfoProviding *)objc_loadWeakRetained((id *)&self->_audioSessionInfoProvider);
}

- (void)setAudioSessionInfoProvider:(id)a3
{
}

- (CSClientXPCConnection)xpcConnection
{
  return (CSClientXPCConnection *)objc_loadWeakRetained((id *)&self->_xpcConnection);
}

- (void)setXpcConnection:(id)a3
{
}

- (unint64_t)streamClientType
{
  return self->_streamClientType;
}

- (void)setStreamClientType:(unint64_t)a3
{
  self->_streamClientType = a3;
}

- (void).cxx_destruct
{
}

@end