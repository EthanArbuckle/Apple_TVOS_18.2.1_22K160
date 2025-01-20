@interface AFSiriAnnounceWorkoutReminderRequest
+ (void)deactivateRequestForPredictionIdentifier:(id)a3 completion:(id)a4;
- (AFSiriAnnounceWorkoutReminderRequest)initWithWorkoutReminder:(id)a3;
- (void)performRequestWithCompletion:(id)a3;
@end

@implementation AFSiriAnnounceWorkoutReminderRequest

- (AFSiriAnnounceWorkoutReminderRequest)initWithWorkoutReminder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___AFSiriAnnounceWorkoutReminderRequest;
  v5 = -[AFSiriAnnounceWorkoutReminderRequest init](&v9, "init");
  if (v5)
  {
    v6 = (AFSiriWorkoutReminder *)[v4 copy];
    workoutReminder = v5->_workoutReminder;
    v5->_workoutReminder = v6;
  }

  return v5;
}

- (void)performRequestWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  v5 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    workoutReminder = self->_workoutReminder;
    *(_DWORD *)buf = 136315394;
    v30 = "-[AFSiriAnnounceWorkoutReminderRequest performRequestWithCompletion:]";
    __int16 v31 = 2112;
    v32 = workoutReminder;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "%s Creating xpc for workout reminder announcement:%@",  buf,  0x16u);
    if (!v4) {
      goto LABEL_20;
    }
  }

  else if (!v4)
  {
    goto LABEL_20;
  }

  v6 = self->_workoutReminder;
  id v26 = 0LL;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v6,  1LL,  &v26));
  id v8 = v26;
  if (v8 || !v7)
  {
    v17 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v20 = self->_workoutReminder;
      *(_DWORD *)buf = 136315650;
      v30 = "-[AFSiriAnnounceWorkoutReminderRequest performRequestWithCompletion:]";
      __int16 v31 = 2112;
      v32 = v20;
      __int16 v33 = 2112;
      id v34 = v8;
      _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%s Failed to serialize workoutReminder %@: %@",  buf,  0x20u);
    }

    v4[2](v4, 0LL);
    id v11 = 0LL;
  }

  else
  {
    id v9 = v7;
    xpc_object_t v10 = xpc_data_create([v9 bytes], (size_t)objc_msgSend(v9, "length"));
    keys[0] = (char *)AFExternalRequestMessageKeyType;
    keys[1] = (char *)AFExternalRequestMessageKeyWorkoutReminderAnnouncement;
    values[0] = xpc_int64_create(12LL);
    id v11 = v10;
    values[1] = v11;
    xpc_object_t v12 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
    uint64_t v13 = _ExternalRequestConnection();
    uint64_t v14 = objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)v14;
    v16 = (os_log_s *)AFSiriLogContextConnection;
    if (v12 && v14)
    {
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
      {
        v21 = self->_workoutReminder;
        *(_DWORD *)buf = 136315394;
        v30 = "-[AFSiriAnnounceWorkoutReminderRequest performRequestWithCompletion:]";
        __int16 v31 = 2112;
        v32 = v21;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "%s Sending workout reminder announcement xpc message for %@",  buf,  0x16u);
      }

      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_1000AC714;
      handler[3] = &unk_1004FDB60;
      v25 = v4;
      v24 = v15;
      xpc_connection_send_message_with_reply(v24, v12, 0LL, handler);
    }

    else
    {
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        v22 = self->_workoutReminder;
        *(_DWORD *)buf = 136315394;
        v30 = "-[AFSiriAnnounceWorkoutReminderRequest performRequestWithCompletion:]";
        __int16 v31 = 2112;
        v32 = v22;
        _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%s Unable to send workout reminder annoucement xpc message for %@",  buf,  0x16u);
      }

      v4[2](v4, 0LL);
      if (v15) {
        xpc_connection_cancel((xpc_connection_t)v15);
      }
    }

    for (uint64_t i = 1LL; i != -1; --i)
  }

LABEL_20:
}

- (void).cxx_destruct
{
}

+ (void)deactivateRequestForPredictionIdentifier:(id)a3 completion:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, void))a4;
  AFLogInitIfNeeded();
  v7 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v27 = "+[AFSiriAnnounceWorkoutReminderRequest deactivateRequestForPredictionIdentifier:completion:]";
    __int16 v28 = 2112;
    id v29 = v5;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "%s Creating xpc to deactivate workout reminder announcement with prediction identifier: %@",  buf,  0x16u);
    if (!v6) {
      goto LABEL_20;
    }
  }

  else if (!v6)
  {
    goto LABEL_20;
  }

  id v23 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v5,  1LL,  &v23));
  id v9 = v23;
  if (v9 || !v8)
  {
    v18 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v27 = "+[AFSiriAnnounceWorkoutReminderRequest deactivateRequestForPredictionIdentifier:completion:]";
      __int16 v28 = 2112;
      id v29 = v5;
      __int16 v30 = 2112;
      id v31 = v9;
      _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "%s Failed to serialize workout reminder prediction identifier %@: %@",  buf,  0x20u);
    }

    v6[2](v6, 0LL);
    id v12 = 0LL;
  }

  else
  {
    id v10 = v8;
    xpc_object_t v11 = xpc_data_create([v10 bytes], (size_t)objc_msgSend(v10, "length"));
    keys[0] = (char *)AFExternalRequestMessageKeyType;
    keys[1] = (char *)AFExternalRequestMessageKeyWorkoutReminderPredictionIdentifier;
    values[0] = xpc_int64_create(13LL);
    id v12 = v11;
    values[1] = v12;
    xpc_object_t v13 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
    uint64_t v14 = _ExternalRequestConnection();
    uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);
    v16 = (void *)v15;
    v17 = (os_log_s *)AFSiriLogContextConnection;
    if (v13 && v15)
    {
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v27 = "+[AFSiriAnnounceWorkoutReminderRequest deactivateRequestForPredictionIdentifier:completion:]";
        __int16 v28 = 2112;
        id v29 = v5;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "%s Sending deactivate workout reminder xpc message for prediction identifier:%@",  buf,  0x16u);
      }

      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_1000ACAFC;
      handler[3] = &unk_1004FDB60;
      v22 = v6;
      v21 = v16;
      xpc_connection_send_message_with_reply(v21, v13, 0LL, handler);
    }

    else
    {
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v27 = "+[AFSiriAnnounceWorkoutReminderRequest deactivateRequestForPredictionIdentifier:completion:]";
        __int16 v28 = 2112;
        id v29 = v5;
        _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%s Unable to send deactivate request xpc message for workout prediction %@",  buf,  0x16u);
      }

      v6[2](v6, 0LL);
      if (v16) {
        xpc_connection_cancel((xpc_connection_t)v16);
      }
    }

    for (uint64_t i = 1LL; i != -1; --i)
  }

LABEL_20:
}

@end