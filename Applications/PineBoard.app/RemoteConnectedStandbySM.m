@interface RemoteConnectedStandbySM
- (BOOL)_canBeInOnStateAutomatically;
- (RemoteConnectedStandbySM)init;
- (void)_enterOffStateAutomatically;
- (void)_enterOnStateAutomatically;
- (void)_initializeRemoteConnectedStandbyAvailability;
- (void)_notifyRemoteConnectedStandbyAvailabilityDidChange:(BOOL)a3;
@end

@implementation RemoteConnectedStandbySM

- (RemoteConnectedStandbySM)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___RemoteConnectedStandbySM;
  v2 = -[PBAttentionMonitorStateMachine init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[RemoteConnectedStandbySM _initializeRemoteConnectedStandbyAvailability]( v2,  "_initializeRemoteConnectedStandbyAvailability");
    -[PBAttentionMonitorStateMachine automaticEnable](v3, "automaticEnable");
    -[PBAttentionMonitorStateMachine adjustStateAutomatically](v3, "adjustStateAutomatically");
  }

  return v3;
}

- (BOOL)_canBeInOnStateAutomatically
{
  unsigned int v2 = -[PBAttentionMonitorStateMachine isAutomaticEnabled](self, "isAutomaticEnabled");
  unsigned int v3 = [(id)qword_10046FEF8 isOn];
  unsigned int v4 = [(id)qword_10046FF38 isOn] | v3;
  if ((v2 & v4 & 1) == 0)
  {
    id v5 = sub_100084338();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = "not autoEnabled, ";
      int v10 = 136318978;
      v11 = "-[RemoteConnectedStandbySM _canBeInOnStateAutomatically]";
      __int16 v12 = 2080;
      if (v2) {
        v7 = "";
      }
      v13 = v7;
      __int16 v14 = 2080;
      v8 = "not (isSleepOn || isBackgroundTasksLongIdleOn), ";
      if (v4) {
        v8 = "";
      }
      v15 = v8;
      __int16 v16 = 2080;
      v17 = "";
      __int16 v18 = 2080;
      v19 = "";
      __int16 v20 = 2080;
      v21 = "";
      __int16 v22 = 2080;
      v23 = "";
      __int16 v24 = 2080;
      v25 = "";
      __int16 v26 = 2080;
      v27 = "";
      __int16 v28 = 2080;
      v29 = "";
      __int16 v30 = 2080;
      v31 = "";
      __int16 v32 = 2080;
      v33 = "";
      __int16 v34 = 2080;
      v35 = "";
      __int16 v36 = 2080;
      v37 = "";
      __int16 v38 = 2080;
      v39 = "";
      __int16 v40 = 2080;
      v41 = "";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s: returning no -> (%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s)",  (uint8_t *)&v10,  0xA2u);
    }
  }

  return v2 & v4;
}

- (void)_enterOnStateAutomatically
{
}

- (void)_enterOffStateAutomatically
{
}

- (void)_initializeRemoteConnectedStandbyAvailability
{
  p_remoteConnectedStandbyAvailabilityDidChangeNotificationToken = &self->_remoteConnectedStandbyAvailabilityDidChangeNotificationToken;
  self->_remoteConnectedStandbyAvailabilityDidChangeNotificationToken = -1;
  unsigned int v3 = (void *)PBSRemoteConnectedStandbyAvailabilityDidChangeNotification;
  if (notify_register_check( (const char *)[PBSRemoteConnectedStandbyAvailabilityDidChangeNotification UTF8String],  &self->_remoteConnectedStandbyAvailabilityDidChangeNotificationToken))
  {
    id v4 = sub_100084338();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10026FFBC(v5, v6, v7, v8, v9, v10, v11, v12);
    }
LABEL_13:

    int *p_remoteConnectedStandbyAvailabilityDidChangeNotificationToken = -1;
    return;
  }

  if (*p_remoteConnectedStandbyAvailabilityDidChangeNotificationToken == -1
    || !notify_is_valid_token(*p_remoteConnectedStandbyAvailabilityDidChangeNotificationToken))
  {
    id v17 = sub_100084338();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10026FE74(v5, v18, v19, v20, v21, v22, v23, v24);
    }
    goto LABEL_13;
  }

  id v13 = sub_100084338();
  __int16 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 136315138;
    v27 = "-[RemoteConnectedStandbySM _initializeRemoteConnectedStandbyAvailability]";
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s: Notifying initial state",  (uint8_t *)&v26,  0xCu);
  }

  if (notify_set_state(*p_remoteConnectedStandbyAvailabilityDidChangeNotificationToken, 0LL))
  {
    id v15 = sub_100084338();
    __int16 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10026FF50();
    }
LABEL_18:

    return;
  }

  if (notify_post((const char *)[v3 UTF8String]))
  {
    id v25 = sub_100084338();
    __int16 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10026FEE4();
    }
    goto LABEL_18;
  }

- (void)_notifyRemoteConnectedStandbyAvailabilityDidChange:(BOOL)a3
{
  int remoteConnectedStandbyAvailabilityDidChangeNotificationToken = self->_remoteConnectedStandbyAvailabilityDidChangeNotificationToken;
  if (remoteConnectedStandbyAvailabilityDidChangeNotificationToken == -1)
  {
    id v8 = sub_100084338();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10027002C(v7, v9, v10, v11, v12, v13, v14, v15);
    }
    goto LABEL_7;
  }

  unsigned int v5 = a3;
  uint64_t state64 = 0LL;
  if (notify_get_state(remoteConnectedStandbyAvailabilityDidChangeNotificationToken, &state64))
  {
    id v6 = sub_100084338();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100270174();
    }
LABEL_7:

    return;
  }

  if (state64 != v5)
  {
    id v16 = sub_100084338();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v22 = "-[RemoteConnectedStandbySM _notifyRemoteConnectedStandbyAvailabilityDidChange:]";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "    %s: notifying", buf, 0xCu);
    }

    uint64_t state64 = v5;
    if (notify_set_state(self->_remoteConnectedStandbyAvailabilityDidChangeNotificationToken, v5))
    {
      id v18 = sub_100084338();
      uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_100270108();
      }
      goto LABEL_7;
    }

    if (notify_post((const char *)[PBSRemoteConnectedStandbyAvailabilityDidChangeNotification UTF8String]))
    {
      id v19 = sub_100084338();
      uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_10027009C();
      }
      goto LABEL_7;
    }
  }

@end