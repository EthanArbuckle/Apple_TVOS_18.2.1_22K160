@interface AFSiriUserNotificationRequest
+ (BOOL)canBeHandled;
+ (BOOL)supportedForApplicationWithBundleId:(id)a3;
+ (BOOL)supportedOnPlatform;
- (AFSiriUserNotificationRequest)initWithUserNotification:(id)a3 sourceAppId:(id)a4;
- (AFSiriUserNotificationRequest)initWithUserNotification:(id)a3 sourceAppId:(id)a4 platform:(int64_t)a5;
- (AFSiriUserNotificationRequest)initWithUserNotification:(id)a3 sourceAppId:(id)a4 platform:(int64_t)a5 summaryDecision:(int64_t)a6;
- (AFSiriUserNotificationRequest)initWithUserNotification:(id)a3 sourceAppId:(id)a4 platform:(int64_t)a5 summaryDecision:(int64_t)a6 summary:(id)a7;
- (void)deactivateRequestForReason:(int64_t)a3 completion:(id)a4;
- (void)deliverSummary:(id)a3 completion:(id)a4;
- (void)performRequestWithCompletion:(id)a3;
- (void)withdrawalRequestWithCompletion:(id)a3;
@end

@implementation AFSiriUserNotificationRequest

- (AFSiriUserNotificationRequest)initWithUserNotification:(id)a3 sourceAppId:(id)a4
{
  return -[AFSiriUserNotificationRequest initWithUserNotification:sourceAppId:platform:]( self,  "initWithUserNotification:sourceAppId:platform:",  a3,  a4,  1LL);
}

- (AFSiriUserNotificationRequest)initWithUserNotification:(id)a3 sourceAppId:(id)a4 platform:(int64_t)a5
{
  return -[AFSiriUserNotificationRequest initWithUserNotification:sourceAppId:platform:summaryDecision:summary:]( self,  "initWithUserNotification:sourceAppId:platform:summaryDecision:summary:",  a3,  a4,  a5,  0LL,  0LL);
}

- (AFSiriUserNotificationRequest)initWithUserNotification:(id)a3 sourceAppId:(id)a4 platform:(int64_t)a5 summaryDecision:(int64_t)a6
{
  return -[AFSiriUserNotificationRequest initWithUserNotification:sourceAppId:platform:summaryDecision:summary:]( self,  "initWithUserNotification:sourceAppId:platform:summaryDecision:summary:",  a3,  a4,  a5,  a6,  0LL);
}

- (AFSiriUserNotificationRequest)initWithUserNotification:(id)a3 sourceAppId:(id)a4 platform:(int64_t)a5 summaryDecision:(int64_t)a6 summary:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___AFSiriUserNotificationRequest;
  v16 = -[AFSiriUserNotificationRequest init](&v19, "init");
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_notification, a3);
    objc_storeStrong((id *)&v17->_sourceAppId, a4);
    v17->_platform = a5;
    v17->_summaryDecision = a6;
    objc_storeStrong((id *)&v17->_summary, a7);
  }

  return v17;
}

- (void)performRequestWithCompletion:(id)a3
{
  v4 = (void (**)(id, void))a3;
  v5 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    notification = self->_notification;
    *(_DWORD *)keys = 136315394;
    *(void *)&keys[4] = "-[AFSiriUserNotificationRequest performRequestWithCompletion:]";
    *(_WORD *)&keys[12] = 2112;
    *(void *)&keys[14] = notification;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s %@", keys, 0x16u);
  }

  v6 = self->_notification;
  id v37 = 0LL;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v6,  1LL,  &v37));
  id v8 = v37;
  if (v8) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v7 == 0LL;
  }
  if (!v9)
  {
    id v11 = v7;
    xpc_object_t v12 = xpc_data_create([v11 bytes], (size_t)objc_msgSend(v11, "length"));
    summary = self->_summary;
    id v36 = 0LL;
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  summary,  1LL,  &v36));
    id v15 = v36;
    v16 = v15;
    if (v15 || !v14)
    {
      v25 = (os_log_s *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        v29 = self->_summary;
        *(_DWORD *)keys = 136315650;
        *(void *)&keys[4] = "-[AFSiriUserNotificationRequest performRequestWithCompletion:]";
        *(_WORD *)&keys[12] = 2112;
        *(void *)&keys[14] = v29;
        *(_WORD *)&keys[22] = 2112;
        id v44 = v16;
        _os_log_error_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "%s Failed to serialize summary %@: %@",  keys,  0x20u);
      }

      v4[2](v4, 0LL);
      id v19 = 0LL;
      goto LABEL_29;
    }

    v32 = v14;
    id v17 = v14;
    xpc_object_t v18 = xpc_data_create([v17 bytes], (size_t)objc_msgSend(v17, "length"));
    *(void *)keys = AFExternalRequestMessageKeyType;
    *(void *)&keys[8] = AFExternalRequestMessageKeyNotification;
    *(void *)&keys[16] = AFExternalRequestMessageKeySourceAppId;
    id v44 = (id)AFExternalRequestMessageKeyAnnouncementPlatform;
    uint64_t v45 = AFExternalRequestMessageKeySummaryDecision;
    uint64_t v46 = AFExternalRequestMessageKeySummary;
    values[0] = xpc_int64_create(2LL);
    values[1] = v12;
    values[2] = xpc_string_create(-[NSString UTF8String](self->_sourceAppId, "UTF8String"));
    values[3] = xpc_int64_create(self->_platform);
    values[4] = xpc_int64_create(self->_summaryDecision);
    id v19 = v18;
    values[5] = v19;
    xpc_object_t v20 = xpc_dictionary_create((const char *const *)keys, values, 6uLL);
    uint64_t v21 = _ExternalRequestConnection();
    uint64_t v22 = objc_claimAutoreleasedReturnValue(v21);
    v23 = (void *)v22;
    v24 = (os_log_s *)AFSiriLogContextConnection;
    if (v20 && v22)
    {
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
      {
        v30 = self->_notification;
        *(_DWORD *)buf = 136315394;
        v39 = "-[AFSiriUserNotificationRequest performRequestWithCompletion:]";
        __int16 v40 = 2112;
        v41 = v30;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEBUG,  "%s Sending xpc message for %@",  buf,  0x16u);
      }

      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_10021609C;
      handler[3] = &unk_1004FDB60;
      v35 = v4;
      v34 = v23;
      xpc_connection_send_message_with_reply(v34, v20, 0LL, handler);

LABEL_26:
      for (uint64_t i = 5LL; i != -1; --i)

      v16 = 0LL;
      id v14 = v32;
LABEL_29:

      goto LABEL_30;
    }

    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v31 = self->_notification;
      *(_DWORD *)buf = 136315394;
      v39 = "-[AFSiriUserNotificationRequest performRequestWithCompletion:]";
      __int16 v40 = 2112;
      v41 = v31;
      _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "%s Unable to send xpc message for %@",  buf,  0x16u);
      if (!v4)
      {
LABEL_24:
        if (v23) {
          xpc_connection_cancel((xpc_connection_t)v23);
        }
        goto LABEL_26;
      }
    }

    else if (!v4)
    {
      goto LABEL_24;
    }

    v4[2](v4, 0LL);
    goto LABEL_24;
  }

  v10 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v28 = self->_notification;
    *(_DWORD *)keys = 136315650;
    *(void *)&keys[4] = "-[AFSiriUserNotificationRequest performRequestWithCompletion:]";
    *(_WORD *)&keys[12] = 2112;
    *(void *)&keys[14] = v28;
    *(_WORD *)&keys[22] = 2112;
    id v44 = v8;
    _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s Failed to serialize notification %@: %@",  keys,  0x20u);
  }

  v4[2](v4, 0LL);
  xpc_object_t v12 = 0LL;
LABEL_30:
}

- (void)deactivateRequestForReason:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v7 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    v23 = v7;
    uint64_t Name = AFSiriDeactivationReasonGetName(a3);
    v25 = (void *)objc_claimAutoreleasedReturnValue(Name);
    *(_DWORD *)keys = 136315394;
    *(void *)&keys[4] = "-[AFSiriUserNotificationRequest deactivateRequestForReason:completion:]";
    *(_WORD *)&keys[12] = 2112;
    *(void *)&keys[14] = v25;
    _os_log_debug_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "%s reason: %@", keys, 0x16u);
  }

  if (self->_platform == 2)
  {
    if ((AFSiriDeactivationReasonGetIsValidAndSpecified(a3) & 1) != 0)
    {
      notification = self->_notification;
      id v30 = 0LL;
      BOOL v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  notification,  1LL,  &v30));
      id v10 = v30;
      if (!v10 && v9)
      {
        id v11 = v9;
        xpc_object_t v12 = xpc_data_create([v11 bytes], (size_t)objc_msgSend(v11, "length"));
        *(void *)keys = AFExternalRequestMessageKeyType;
        *(void *)&keys[8] = AFExternalRequestMessageKeyNotification;
        *(void *)&keys[16] = AFExternalRequestMessageKeySourceAppId;
        id v35 = (id)AFExternalRequestMessageKeyAnnouncementPlatform;
        uint64_t v36 = AFExternalRequestMessageKeyDeactivationReason;
        values[0] = xpc_int64_create(9LL);
        id v13 = v12;
        values[1] = v13;
        values[2] = xpc_string_create(-[NSString UTF8String](self->_sourceAppId, "UTF8String"));
        values[3] = xpc_int64_create(self->_platform);
        values[4] = xpc_int64_create(a3);
        xpc_object_t v14 = xpc_dictionary_create((const char *const *)keys, values, 5uLL);
        uint64_t v15 = _ExternalRequestConnection();
        uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
        id v17 = (void *)v16;
        xpc_object_t v18 = (os_log_s *)AFSiriLogContextConnection;
        if (v14 && v16)
        {
          if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315138;
            v32 = "-[AFSiriUserNotificationRequest deactivateRequestForReason:completion:]";
            _os_log_debug_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "%s Sending xpc message for request deactivation.",  buf,  0xCu);
          }

          handler[0] = _NSConcreteStackBlock;
          handler[1] = 3221225472LL;
          handler[2] = sub_100216034;
          handler[3] = &unk_1004FDB60;
          id v29 = v6;
          v28 = v17;
          xpc_connection_send_message_with_reply(v28, v14, 0LL, handler);

LABEL_27:
          for (uint64_t i = 4LL; i != -1; --i)

          goto LABEL_29;
        }

        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v32 = "-[AFSiriUserNotificationRequest deactivateRequestForReason:completion:]";
          _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "%s Unable to send xpc message for request deactivation.",  buf,  0xCu);
          if (!v6)
          {
LABEL_25:
            if (v17) {
              xpc_connection_cancel((xpc_connection_t)v17);
            }
            goto LABEL_27;
          }
        }

        else if (!v6)
        {
          goto LABEL_25;
        }

        (*((void (**)(id, void))v6 + 2))(v6, 0LL);
        goto LABEL_25;
      }

      uint64_t v21 = (os_log_s *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        v26 = self->_notification;
        *(_DWORD *)keys = 136315650;
        *(void *)&keys[4] = "-[AFSiriUserNotificationRequest deactivateRequestForReason:completion:]";
        *(_WORD *)&keys[12] = 2112;
        *(void *)&keys[14] = v26;
        *(_WORD *)&keys[22] = 2112;
        id v35 = v10;
        _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "%s Failed to serialize notification %@: %@",  keys,  0x20u);
        if (!v6) {
          goto LABEL_21;
        }
      }

      else if (!v6)
      {
LABEL_21:
        id v13 = 0LL;
LABEL_29:

        goto LABEL_30;
      }

      (*((void (**)(id, void))v6 + 2))(v6, 0LL);
      goto LABEL_21;
    }

    xpc_object_t v20 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)keys = 136315394;
      *(void *)&keys[4] = "-[AFSiriUserNotificationRequest deactivateRequestForReason:completion:]";
      *(_WORD *)&keys[12] = 2048;
      *(void *)&keys[14] = a3;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEBUG,  "%s unspecified deactivation reason %li. Ignoring.",  keys,  0x16u);
      if (!v6) {
        goto LABEL_30;
      }
      goto LABEL_17;
    }
  }

  else
  {
    id v19 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)keys = 136315138;
      *(void *)&keys[4] = "-[AFSiriUserNotificationRequest deactivateRequestForReason:completion:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%s deactivation requests are currently only supported for CarPlay.",  keys,  0xCu);
      if (!v6) {
        goto LABEL_30;
      }
      goto LABEL_17;
    }
  }

  if (v6) {
LABEL_17:
  }
    (*((void (**)(id, void))v6 + 2))(v6, 0LL);
LABEL_30:
}

- (void)withdrawalRequestWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    notification = self->_notification;
    *(_DWORD *)buf = 136315394;
    v31 = "-[AFSiriUserNotificationRequest withdrawalRequestWithCompletion:]";
    __int16 v32 = 2112;
    v33 = notification;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s %@", buf, 0x16u);
  }

  id v6 = self->_notification;
  id v27 = 0LL;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v6,  1LL,  &v27));
  id v8 = v27;
  if (v8) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v7 == 0LL;
  }
  if (!v9)
  {
    id v11 = v7;
    xpc_object_t v12 = xpc_data_create([v11 bytes], (size_t)objc_msgSend(v11, "length"));
    keys[0] = (char *)AFExternalRequestMessageKeyType;
    keys[1] = (char *)AFExternalRequestMessageKeyNotification;
    values[0] = xpc_int64_create(10LL);
    id v13 = v12;
    values[1] = v13;
    xpc_object_t v14 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
    uint64_t v15 = _ExternalRequestConnection();
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    id v17 = (void *)v16;
    xpc_object_t v18 = (os_log_s *)AFSiriLogContextConnection;
    if (v14 && v16)
    {
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v22 = self->_notification;
        *(_DWORD *)buf = 136315394;
        v31 = "-[AFSiriUserNotificationRequest withdrawalRequestWithCompletion:]";
        __int16 v32 = 2112;
        v33 = v22;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "%s Sending xpc message for %@",  buf,  0x16u);
      }

      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_100215FCC;
      handler[3] = &unk_1004FDB60;
      id v26 = v4;
      v25 = v17;
      xpc_connection_send_message_with_reply(v25, v14, 0LL, handler);

LABEL_21:
      for (uint64_t i = 1LL; i != -1; --i)

      goto LABEL_23;
    }

    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v23 = self->_notification;
      *(_DWORD *)buf = 136315394;
      v31 = "-[AFSiriUserNotificationRequest withdrawalRequestWithCompletion:]";
      __int16 v32 = 2112;
      v33 = v23;
      _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "%s Unable to send xpc message for %@",  buf,  0x16u);
      if (!v4)
      {
LABEL_19:
        if (v17) {
          xpc_connection_cancel((xpc_connection_t)v17);
        }
        goto LABEL_21;
      }
    }

    else if (!v4)
    {
      goto LABEL_19;
    }

    (*((void (**)(id, void))v4 + 2))(v4, 0LL);
    goto LABEL_19;
  }

  id v10 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    uint64_t v21 = self->_notification;
    *(_DWORD *)buf = 136315650;
    v31 = "-[AFSiriUserNotificationRequest withdrawalRequestWithCompletion:]";
    __int16 v32 = 2112;
    v33 = v21;
    __int16 v34 = 2112;
    id v35 = v8;
    _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s Failed to serialize notification %@: %@",  buf,  0x20u);
  }

  (*((void (**)(id, void))v4 + 2))(v4, 0LL);
  id v13 = 0LL;
LABEL_23:
}

- (void)deliverSummary:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  id v34 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v6,  1LL,  &v34));
  id v9 = v34;
  if (v9) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = v8 == 0LL;
  }
  if (!v10)
  {
    notification = self->_notification;
    id v33 = 0LL;
    xpc_object_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  notification,  1LL,  &v33));
    id v15 = v33;
    uint64_t v16 = v15;
    if (v15 || !v14)
    {
      id v27 = (os_log_s *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        id v29 = self->_notification;
        *(_DWORD *)keys = 136315650;
        *(void *)&keys[4] = "-[AFSiriUserNotificationRequest deliverSummary:completion:]";
        *(_WORD *)&keys[12] = 2112;
        *(void *)&keys[14] = v29;
        *(_WORD *)&keys[22] = 2112;
        id v41 = v16;
        _os_log_error_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "%s Failed to serialize notification %@: %@",  keys,  0x20u);
      }

      v7[2](v7, 0LL);
      id v21 = 0LL;
      id v12 = 0LL;
      goto LABEL_27;
    }

    id v17 = v14;
    xpc_object_t v18 = xpc_data_create([v17 bytes], (size_t)objc_msgSend(v17, "length"));
    id v19 = v8;
    xpc_object_t v20 = xpc_data_create([v19 bytes], (size_t)objc_msgSend(v19, "length"));
    *(void *)keys = AFExternalRequestMessageKeyType;
    *(void *)&keys[8] = AFExternalRequestMessageKeySummary;
    *(void *)&keys[16] = AFExternalRequestMessageKeyNotification;
    values[0] = xpc_int64_create(16LL);
    id v12 = v20;
    values[1] = v12;
    id v21 = v18;
    xpc_object_t values[2] = v21;
    xpc_object_t v22 = xpc_dictionary_create((const char *const *)keys, values, 3uLL);
    uint64_t v23 = _ExternalRequestConnection();
    uint64_t v24 = objc_claimAutoreleasedReturnValue(v23);
    v25 = (void *)v24;
    id v26 = (os_log_s *)AFSiriLogContextConnection;
    if (v22 && v24)
    {
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v36 = "-[AFSiriUserNotificationRequest deliverSummary:completion:]";
        __int16 v37 = 2112;
        id v38 = v6;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEBUG,  "%s Sending xpc message for %@",  buf,  0x16u);
      }

      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_100215F64;
      handler[3] = &unk_1004FDB60;
      __int16 v32 = v7;
      v31 = v25;
      xpc_connection_send_message_with_reply(v31, v22, 0LL, handler);

LABEL_24:
      for (uint64_t i = 2LL; i != -1; --i)

      uint64_t v16 = 0LL;
LABEL_27:

      goto LABEL_28;
    }

    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v36 = "-[AFSiriUserNotificationRequest deliverSummary:completion:]";
      __int16 v37 = 2112;
      id v38 = v6;
      _os_log_error_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "%s Unable to send xpc message for %@",  buf,  0x16u);
      if (!v7)
      {
LABEL_22:
        if (v25) {
          xpc_connection_cancel((xpc_connection_t)v25);
        }
        goto LABEL_24;
      }
    }

    else if (!v7)
    {
      goto LABEL_22;
    }

    v7[2](v7, 0LL);
    goto LABEL_22;
  }

  id v11 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)keys = 136315650;
    *(void *)&keys[4] = "-[AFSiriUserNotificationRequest deliverSummary:completion:]";
    *(_WORD *)&keys[12] = 2112;
    *(void *)&keys[14] = v6;
    *(_WORD *)&keys[22] = 2112;
    id v41 = v9;
    _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%s Failed to serialize summary %@: %@",  keys,  0x20u);
  }

  v7[2](v7, 0LL);
  id v12 = 0LL;
LABEL_28:
}

- (void).cxx_destruct
{
}

+ (BOOL)canBeHandled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[AFSiriUserNotificationRequestCapabilityManager sharedManager]( &OBJC_CLASS___AFSiriUserNotificationRequestCapabilityManager,  "sharedManager"));
  unsigned __int8 v3 = [v2 requestCanBeHandled];

  return v3;
}

+ (BOOL)supportedOnPlatform
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[AFSiriUserNotificationRequestCapabilityManager sharedManager]( &OBJC_CLASS___AFSiriUserNotificationRequestCapabilityManager,  "sharedManager"));
  unsigned __int8 v3 = [v2 hasEligibleSetup];

  return v3;
}

+ (BOOL)supportedForApplicationWithBundleId:(id)a3
{
  return +[AFSiriUserNotificationRequestCapabilityManager supportedByApplicationWithBundleID:]( &OBJC_CLASS___AFSiriUserNotificationRequestCapabilityManager,  "supportedByApplicationWithBundleID:",  a3);
}

@end