@interface AFSiriAnnounceWorkoutVoiceFeedbackRequest
+ (void)deactivateOngoingRequestWithCompletion:(id)a3;
- (AFSiriAnnounceWorkoutVoiceFeedbackRequest)initWithVoiceFeedbackData:(id)a3;
- (void)performRequestWithCompletion:(id)a3;
@end

@implementation AFSiriAnnounceWorkoutVoiceFeedbackRequest

- (AFSiriAnnounceWorkoutVoiceFeedbackRequest)initWithVoiceFeedbackData:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___AFSiriAnnounceWorkoutVoiceFeedbackRequest;
  v5 = -[AFSiriAnnounceWorkoutVoiceFeedbackRequest init](&v9, "init");
  if (v5)
  {
    v6 = (NSDictionary *)[v4 copy];
    data = v5->_data;
    v5->_data = v6;
  }

  return v5;
}

- (void)performRequestWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  v5 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    data = self->_data;
    *(_DWORD *)buf = 136315394;
    v30 = "-[AFSiriAnnounceWorkoutVoiceFeedbackRequest performRequestWithCompletion:]";
    __int16 v31 = 2112;
    v32 = data;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "%s Creating xpc for workout voice feedback announcement:%@",  buf,  0x16u);
    if (!v4) {
      goto LABEL_20;
    }
  }

  else if (!v4)
  {
    goto LABEL_20;
  }

  v6 = self->_data;
  id v26 = 0LL;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v6,  200LL,  0LL,  &v26));
  id v8 = v26;
  if (v8 || !self->_data)
  {
    objc_super v9 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v20 = self->_data;
      *(_DWORD *)buf = 136315650;
      v30 = "-[AFSiriAnnounceWorkoutVoiceFeedbackRequest performRequestWithCompletion:]";
      __int16 v31 = 2112;
      v32 = v20;
      __int16 v33 = 2112;
      id v34 = v8;
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%s Failed to serialize workoutvoice feedback data %@: %@",  buf,  0x20u);
    }

    v4[2](v4, 0LL);
    id v10 = 0LL;
  }

  else
  {
    id v11 = v7;
    xpc_object_t v12 = xpc_data_create([v11 bytes], (size_t)objc_msgSend(v11, "length"));
    keys[0] = (char *)AFExternalRequestMessageKeyType;
    keys[1] = (char *)AFExternalRequestMessageKeyWorkoutVoiceFeedbackAnnouncement;
    values[0] = xpc_int64_create(14LL);
    id v10 = v12;
    values[1] = v10;
    xpc_object_t v13 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
    uint64_t v14 = _ExternalRequestConnection();
    uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);
    v16 = (void *)v15;
    v17 = (os_log_s *)AFSiriLogContextConnection;
    if (v13 && v15)
    {
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
      {
        v21 = self->_data;
        *(_DWORD *)buf = 136315394;
        v30 = "-[AFSiriAnnounceWorkoutVoiceFeedbackRequest performRequestWithCompletion:]";
        __int16 v31 = 2112;
        v32 = v21;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "%s Sending workout voice feedback announcement xpc message for %@",  buf,  0x16u);
      }

      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_100352318;
      handler[3] = &unk_1004FDB60;
      v25 = v4;
      v24 = v16;
      xpc_connection_send_message_with_reply(v24, v13, 0LL, handler);
    }

    else
    {
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        v22 = self->_data;
        *(_DWORD *)buf = 136315394;
        v30 = "-[AFSiriAnnounceWorkoutVoiceFeedbackRequest performRequestWithCompletion:]";
        __int16 v31 = 2112;
        v32 = v22;
        _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%s Unable to send workout voice feedback annoucement xpc message for %@",  buf,  0x16u);
      }

      v4[2](v4, 0LL);
      if (v16) {
        xpc_connection_cancel((xpc_connection_t)v16);
      }
    }

    for (uint64_t i = 1LL; i != -1; --i)
  }

LABEL_20:
}

- (void).cxx_destruct
{
}

+ (void)deactivateOngoingRequestWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "+[AFSiriAnnounceWorkoutVoiceFeedbackRequest deactivateOngoingRequestWithCompletion:]";
    _os_log_debug_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "%s Creating xpc to deactivate workout voice feedback announcement",  buf,  0xCu);
    if (!v3) {
      goto LABEL_13;
    }
  }

  else if (!v3)
  {
    goto LABEL_13;
  }

  keys = (char *)AFExternalRequestMessageKeyType;
  xpc_object_t values = xpc_int64_create(15LL);
  xpc_object_t v5 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
  uint64_t v6 = _ExternalRequestConnection();
  uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
  id v8 = (void *)v7;
  objc_super v9 = (os_log_s *)AFSiriLogContextConnection;
  if (v5 && v7)
  {
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "+[AFSiriAnnounceWorkoutVoiceFeedbackRequest deactivateOngoingRequestWithCompletion:]";
      _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "%s Sending deactivate workout reminder xpc message for workout voice feedback",  buf,  0xCu);
    }

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10035259C;
    v10[3] = &unk_1004FDB60;
    id v12 = v3;
    id v11 = v8;
    xpc_connection_send_message_with_reply(v11, v5, 0LL, v10);
  }

  else
  {
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "+[AFSiriAnnounceWorkoutVoiceFeedbackRequest deactivateOngoingRequestWithCompletion:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%s Unable to send deactivate request xpc message for workout voice feedback",  buf,  0xCu);
    }

    (*((void (**)(id, void))v3 + 2))(v3, 0LL);
    if (v8) {
      xpc_connection_cancel((xpc_connection_t)v8);
    }
  }

LABEL_13:
}

@end