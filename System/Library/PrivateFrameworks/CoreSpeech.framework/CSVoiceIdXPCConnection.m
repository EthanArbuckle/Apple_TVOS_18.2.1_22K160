@interface CSVoiceIdXPCConnection
- (CSVoiceIdXPCConnection)initWithConnection:(id)a3;
- (OS_dispatch_queue)queue;
- (OS_xpc_object)connection;
- (void)_handleClientError:(id)a3 client:(id)a4;
- (void)_handleClientEvent:(id)a3;
- (void)_handleClientMessage:(id)a3 client:(id)a4;
- (void)_sendReplyMessageWithResult:(BOOL)a3 error:(id)a4 event:(id)a5 client:(id)a6;
- (void)activateConnection;
- (void)setConnection:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation CSVoiceIdXPCConnection

- (CSVoiceIdXPCConnection)initWithConnection:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CSVoiceIdXPCConnection;
  v6 = -[CSVoiceIdXPCConnection init](&v15, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    dispatch_queue_t v8 = dispatch_queue_create("corespeechd speaker xpc connection client queue", 0LL);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

    v10 = (dispatch_object_s *)v7->_queue;
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(33LL, 0LL);
    v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    dispatch_set_target_queue(v10, v12);

    xpc_connection_set_target_queue(v7->_connection, (dispatch_queue_t)v7->_queue);
    v13 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "-[CSVoiceIdXPCConnection initWithConnection:]";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s Created VoiceIdXpc connection", buf, 0xCu);
    }
  }

  return v7;
}

- (void)activateConnection
{
  connection = self->_connection;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000C502C;
  v4[3] = &unk_10022E2F8;
  objc_copyWeak(&v5, &location);
  xpc_connection_set_event_handler(connection, v4);
  xpc_connection_activate(self->_connection);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_handleClientEvent:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && self->_connection)
  {
    xpc_type_t type = xpc_get_type(v4);
    if (type == (xpc_type_t)&_xpc_type_dictionary)
    {
      -[CSVoiceIdXPCConnection _handleClientMessage:client:]( self,  "_handleClientMessage:client:",  v5,  self->_connection);
      goto LABEL_12;
    }

    if (type == (xpc_type_t)&_xpc_type_error)
    {
      -[CSVoiceIdXPCConnection _handleClientError:client:](self, "_handleClientError:client:", v5, self->_connection);
      goto LABEL_12;
    }

    v7 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315138;
      v14 = "-[CSVoiceIdXPCConnection _handleClientEvent:]";
      dispatch_queue_t v8 = "%s ignore unknown types of message";
      v9 = v7;
      uint32_t v10 = 12;
LABEL_9:
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v13, v10);
    }
  }

  else
  {
    v11 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      connection = self->_connection;
      int v13 = 136315650;
      v14 = "-[CSVoiceIdXPCConnection _handleClientEvent:]";
      __int16 v15 = 2050;
      v16 = v5;
      __int16 v17 = 2050;
      v18 = connection;
      dispatch_queue_t v8 = "%s event = %{public}p client = %{public}p cannot handle event";
      v9 = v11;
      uint32_t v10 = 32;
      goto LABEL_9;
    }
  }

- (void)_handleClientMessage:(id)a3 client:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_t v8 = v7;
  if (v6 && v7)
  {
    int64_t int64 = xpc_dictionary_get_int64(v6, "type");
    uint32_t v10 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v52 = "-[CSVoiceIdXPCConnection _handleClientMessage:client:]";
      __int16 v53 = 2050;
      uint64_t v54 = int64;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s MessageType = %{public}lld", buf, 0x16u);
    }

    if (int64 == 2)
    {
      xpc_object_t dictionary = xpc_dictionary_get_dictionary(v6, "body");
      v12 = (void *)objc_claimAutoreleasedReturnValue(dictionary);
      int v13 = v12;
      if (v12)
      {
        v14 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(v12, "utterancePath"));
        __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        xpc_object_t v16 = xpc_dictionary_get_dictionary(v13, "voiceTriggerEventInfo");
        __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        if (v17)
        {
          v41 = v15;
          v18 = objc_alloc(&OBJC_CLASS___NSDictionary);
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary _cs_initWithXPCObject:](v18, "_cs_initWithXPCObject:", v17));

          xpc_object_t v20 = xpc_dictionary_get_dictionary(v13, "otherCtxt");
          v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
          if (v21)
          {
            v22 = objc_alloc(&OBJC_CLASS___NSDictionary);
            v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary _cs_initWithXPCObject:](v22, "_cs_initWithXPCObject:", v21));

            xpc_object_t value = xpc_dictionary_get_value(v13, "recordDeviceInfo");
            uint64_t v25 = objc_claimAutoreleasedReturnValue(value);
            v40 = (void *)v25;
            if (v25)
            {
              v38 = -[CSFAudioRecordDeviceInfo initWithXPCObject:]( objc_alloc(&OBJC_CLASS___CSFAudioRecordDeviceInfo),  "initWithXPCObject:",  v25);
              xpc_object_t v26 = xpc_dictionary_get_value(v13, "audioRecordCtx");
              uint64_t v27 = objc_claimAutoreleasedReturnValue(v26);
              v39 = (void *)v27;
              if (v27)
              {
                v37 = -[CSAudioRecordContext initWithXPCObject:]( objc_alloc(&OBJC_CLASS___CSAudioRecordContext),  "initWithXPCObject:",  v27);
                v28 = (os_log_s *)CSLogContextFacilityCoreSpeech;
                if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315650;
                  v52 = "-[CSVoiceIdXPCConnection _handleClientMessage:client:]";
                  __int16 v53 = 2050;
                  uint64_t v54 = 2LL;
                  __int16 v55 = 2114;
                  v56 = v41;
                  _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "%s Received msg of type %{public}lld for utt %{public}@",  buf,  0x20u);
                }

                v29 = v38;
                if (+[CSUtils platformSupportsImplicitUttAddition]( &OBJC_CLASS___CSUtils,  "platformSupportsImplicitUttAddition"))
                {
                  v36 = (void *)objc_claimAutoreleasedReturnValue( +[CSVoiceTriggerAssetHandler sharedHandler]( &OBJC_CLASS___CSVoiceTriggerAssetHandler,  "sharedHandler"));
                  v42[0] = _NSConcreteStackBlock;
                  v42[1] = 3221225472LL;
                  v42[2] = sub_1000C4C84;
                  v42[3] = &unk_10022C978;
                  id v43 = v41;
                  v44 = v38;
                  v45 = v37;
                  id v46 = v19;
                  id v47 = v23;
                  v48 = self;
                  id v49 = v6;
                  id v50 = v8;
                  [v36 getVoiceTriggerAssetWithEndpointId:0 completion:v42];
                }
              }

              else
              {
                v35 = (os_log_s *)CSLogContextFacilityCoreSpeech;
                v29 = v38;
                if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315138;
                  v52 = "-[CSVoiceIdXPCConnection _handleClientMessage:client:]";
                  _os_log_error_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_ERROR,  "%s Null audio context",  buf,  0xCu);
                }
              }
            }

            else
            {
              v34 = (os_log_s *)CSLogContextFacilityCoreSpeech;
              if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315138;
                v52 = "-[CSVoiceIdXPCConnection _handleClientMessage:client:]";
                _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%s Null deviceInfo", buf, 0xCu);
              }
            }
          }

          else
          {
            v33 = (os_log_s *)CSLogContextFacilityCoreSpeech;
            if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315138;
              v52 = "-[CSVoiceIdXPCConnection _handleClientMessage:client:]";
              _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%s Null Ctx", buf, 0xCu);
            }
          }

          __int16 v15 = v41;
        }

        else
        {
          v32 = (os_log_s *)CSLogContextFacilityCoreSpeech;
          if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            v52 = "-[CSVoiceIdXPCConnection _handleClientMessage:client:]";
            _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%s Null VTEI", buf, 0xCu);
          }
        }
      }

      else
      {
        v31 = (os_log_s *)CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v52 = "-[CSVoiceIdXPCConnection _handleClientMessage:client:]";
          _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%s Null msg body", buf, 0xCu);
        }
      }
    }
  }

  else
  {
    v30 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v52 = "-[CSVoiceIdXPCConnection _handleClientMessage:client:]";
      __int16 v53 = 2050;
      uint64_t v54 = (uint64_t)v6;
      __int16 v55 = 2050;
      v56 = v8;
      _os_log_error_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "%s message = %{public}p, client = %{public}p, cannot handle message",  buf,  0x20u);
    }
  }
}

- (void)_handleClientError:(id)a3 client:(id)a4
{
  id v5 = (char *)a3;
  id v6 = a4;
  id v7 = v6;
  if (!v5 || !v6)
  {
    uint32_t v10 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    int v16 = 136315650;
    __int16 v17 = "-[CSVoiceIdXPCConnection _handleClientError:client:]";
    __int16 v18 = 2114;
    v19 = v5;
    __int16 v20 = 2114;
    v21 = v7;
    v9 = "%s Received error %{public}@ from client %{public}@";
    v11 = v10;
    uint32_t v12 = 32;
LABEL_16:
    _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v16, v12);
    goto LABEL_13;
  }

  if (v5 == (char *)&_xpc_error_connection_invalid || v5 == (char *)&_xpc_error_connection_interrupted)
  {
    v14 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    int v16 = 136315394;
    __int16 v17 = "-[CSVoiceIdXPCConnection _handleClientError:client:]";
    __int16 v18 = 2050;
    v19 = (const char *)v7;
    v9 = "%s Client %{public}p connection disconnected, noticing xpc listener";
    goto LABEL_15;
  }

  string = xpc_dictionary_get_string(v5, _xpc_error_key_description);
  v14 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    int v16 = 136315394;
    __int16 v17 = "-[CSVoiceIdXPCConnection _handleClientError:client:]";
    __int16 v18 = 2082;
    v19 = string;
    v9 = "%s connection error: %{public}s";
LABEL_15:
    v11 = v14;
    uint32_t v12 = 22;
    goto LABEL_16;
  }

- (void)_sendReplyMessageWithResult:(BOOL)a3 error:(id)a4 event:(id)a5 client:(id)a6
{
  id v12 = a4;
  v9 = (_xpc_connection_s *)a6;
  xpc_object_t reply = xpc_dictionary_create_reply(a5);
  xpc_dictionary_set_BOOL(reply, "result", a3);
  if (v12)
  {
    id v11 = objc_claimAutoreleasedReturnValue([v12 domain]);
    xpc_dictionary_set_string(reply, "resultErrorDomain", (const char *)[v11 UTF8String]);

    xpc_dictionary_set_int64(reply, "resultErrorCode", (int64_t)[v12 code]);
  }

  xpc_connection_send_message(v9, reply);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end