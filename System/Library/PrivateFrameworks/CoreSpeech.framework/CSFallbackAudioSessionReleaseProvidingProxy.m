@interface CSFallbackAudioSessionReleaseProvidingProxy
- (CSClientXPCConnection)xpcConnection;
- (CSFallbackAudioSessionReleaseProvidingProxy)initWithXPCConnection:(id)a3;
- (void)_handleDeactivateAudioSessionRequestMessage:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)_sendReply:(id)a3 client:(id)a4 result:(BOOL)a5 error:(id)a6;
- (void)handleXPCMessage:(id)a3 messageBody:(id)a4 client:(id)a5;
- (void)setXpcConnection:(id)a3;
@end

@implementation CSFallbackAudioSessionReleaseProvidingProxy

- (CSFallbackAudioSessionReleaseProvidingProxy)initWithXPCConnection:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CSFallbackAudioSessionReleaseProvidingProxy;
  v5 = -[CSFallbackAudioSessionReleaseProvidingProxy init](&v8, "init");
  v6 = v5;
  if (v5) {
    -[CSFallbackAudioSessionReleaseProvidingProxy setXpcConnection:](v5, "setXpcConnection:", v4);
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
    -[CSFallbackAudioSessionReleaseProvidingProxy _handleDeactivateAudioSessionRequestMessage:messageBody:client:]( self,  "_handleDeactivateAudioSessionRequestMessage:messageBody:client:",  v8,  v9,  v10);
  }

  else
  {
    int64_t v12 = int64;
    v13 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315394;
      v15 = "-[CSFallbackAudioSessionReleaseProvidingProxy handleXPCMessage:messageBody:client:]";
      __int16 v16 = 2048;
      int64_t v17 = v12;
      _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%s Cannot handle unexpected message type : %lld",  (uint8_t *)&v14,  0x16u);
    }
  }
}

- (void)_handleDeactivateAudioSessionRequestMessage:(id)a3 messageBody:(id)a4 client:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  int64_t int64 = xpc_dictionary_get_int64(a4, "option");
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[CSSpeechManager sharedManagerForCoreSpeechDaemon]( &OBJC_CLASS___CSSpeechManager,  "sharedManagerForCoreSpeechDaemon"));
  int64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 fetchFallbackAudioSessionReleaseProvider]);

  if (v12)
  {
    id v16 = 0LL;
    id v13 = [v12 fallbackDeactivateAudioSession:int64 error:&v16];
    id v14 = v16;
    -[CSFallbackAudioSessionReleaseProvidingProxy _sendReply:client:result:error:]( self,  "_sendReply:client:result:error:",  v9,  v8,  v13,  v14);
  }

  else
  {
    v15 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[CSFallbackAudioSessionReleaseProvidingProxy _handleDeactivateAudioSessionRequestMessage:messageBody:client:]";
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%s CSFallbackAudioSessionReleaseProvider is nil from CSSpeechManager",  buf,  0xCu);
    }

    -[CSFallbackAudioSessionReleaseProvidingProxy _sendReply:client:result:error:]( self,  "_sendReply:client:result:error:",  v9,  v8,  0LL,  0LL);
  }
}

- (void)_sendReply:(id)a3 client:(id)a4 result:(BOOL)a5 error:(id)a6
{
  connection = (_xpc_connection_s *)a4;
  id v9 = a6;
  xpc_object_t reply = xpc_dictionary_create_reply(a3);
  xpc_dictionary_set_BOOL(reply, "result", a5);
  if (v9)
  {
    id v11 = objc_claimAutoreleasedReturnValue([v9 domain]);
    xpc_dictionary_set_string(reply, "resultErrorDomain", (const char *)[v11 UTF8String]);

    xpc_dictionary_set_int64(reply, "resultErrorCode", (int64_t)[v9 code]);
  }

  xpc_connection_send_message(connection, reply);
}

- (CSClientXPCConnection)xpcConnection
{
  return (CSClientXPCConnection *)objc_loadWeakRetained((id *)&self->_xpcConnection);
}

- (void)setXpcConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end