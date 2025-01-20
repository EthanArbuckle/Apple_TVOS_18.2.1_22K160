@interface PBAttentionMonitorStateMachine
- (BOOL)_canBeInOnStateAutomatically;
- (BOOL)enteredOnStateAutomatically;
- (BOOL)isAutomaticEnabled;
- (BOOL)isOff;
- (BOOL)isOn;
- (PBAttentionMonitorStateMachine)init;
- (double)enabledOffset;
- (id)_logString;
- (void)_cancelAutomaticOnStateChangeConfirmationIfNeeded;
- (void)_confirmAutomaticOnStateChangeWithCompletion:(id)a3;
- (void)_setStateOff;
- (void)_setStateOn;
- (void)adjustStateAutomatically;
- (void)automaticDisable;
- (void)automaticEnable;
- (void)enterOffStateAutomatically;
- (void)enterOffStateForced;
- (void)enterOnStateForced;
- (void)setEnabledOffset:(double)a3;
@end

@implementation PBAttentionMonitorStateMachine

- (PBAttentionMonitorStateMachine)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBAttentionMonitorStateMachine;
  result = -[PBAttentionMonitorStateMachine init](&v3, "init");
  if (result)
  {
    result->_state = 0LL;
    result->_enabledOffset = 0.0;
    *(_WORD *)&result->_automaticEnabled = 0;
  }

  return result;
}

- (BOOL)isOff
{
  return self->_state == 0;
}

- (BOOL)isOn
{
  return self->_state == 1;
}

- (void)_setStateOn
{
  if (!self->_state)
  {
    id v4 = sub_100084338();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      Class = object_getClass(self);
      int v7 = 136446466;
      Name = class_getName(Class);
      __int16 v9 = 2082;
      v10 = sel_getName(a2);
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  " [%{public}s %{public}s]",  (uint8_t *)&v7,  0x16u);
    }
  }

  self->_state = 1LL;
}

- (void)_setStateOff
{
  if (self->_state == 1)
  {
    id v4 = sub_100084338();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      Class = object_getClass(self);
      int v7 = 136446466;
      Name = class_getName(Class);
      __int16 v9 = 2082;
      v10 = sel_getName(a2);
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  " [%{public}s %{public}s]",  (uint8_t *)&v7,  0x16u);
    }
  }

  self->_state = 0LL;
}

- (BOOL)isAutomaticEnabled
{
  return self->_automaticEnabled;
}

- (void)automaticEnable
{
  if (!self->_automaticEnabled)
  {
    id v4 = sub_100084338();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      Class = object_getClass(self);
      int v7 = 136446466;
      Name = class_getName(Class);
      __int16 v9 = 2082;
      v10 = sel_getName(a2);
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  " [%{public}s %{public}s]",  (uint8_t *)&v7,  0x16u);
    }
  }

  self->_automaticEnabled = 1;
}

- (void)automaticDisable
{
  if (self->_automaticEnabled)
  {
    id v4 = sub_100084338();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      Class = object_getClass(self);
      int v7 = 136446466;
      Name = class_getName(Class);
      __int16 v9 = 2082;
      v10 = sel_getName(a2);
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  " [%{public}s %{public}s]",  (uint8_t *)&v7,  0x16u);
    }
  }

  self->_automaticEnabled = 0;
}

- (void)adjustStateAutomatically
{
  unsigned int v4 = -[PBAttentionMonitorStateMachine _canBeInOnStateAutomatically](self, "_canBeInOnStateAutomatically");
  int64_t state = self->_state;
  if (state) {
    unsigned int v6 = 0;
  }
  else {
    unsigned int v6 = v4;
  }
  if (v6 == 1)
  {
    objc_initWeak(&location, self);
    if (self->_automaticOnStateChangeConfirmationID)
    {
      id v7 = sub_100084338();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        Class = object_getClass(self);
        Name = class_getName(Class);
        v11 = sel_getName(a2);
        *(_DWORD *)buf = 136446466;
        v31 = Name;
        __int16 v32 = 2082;
        v33 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  " [%{public}s %{public}s]: Confirmation to enter on state is currently in progress. Will not attempt to adjust state",  buf,  0x16u);
      }
    }

    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      objc_storeStrong((id *)&self->_automaticOnStateChangeConfirmationID, v20);
      id v21 = sub_100084338();
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = object_getClass(self);
        v24 = class_getName(v23);
        v25 = sel_getName(a2);
        *(_DWORD *)buf = 136446466;
        v31 = v24;
        __int16 v32 = 2082;
        v33 = v25;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  " [%{public}s %{public}s]: Starting confirmation to enter on state.",  buf,  0x16u);
      }

      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472LL;
      v26[2] = sub_10000FB2C;
      v26[3] = &unk_1003D04E0;
      objc_copyWeak(v28, &location);
      v8 = v20;
      v27 = v8;
      v28[1] = (id)a2;
      -[PBAttentionMonitorStateMachine _confirmAutomaticOnStateChangeWithCompletion:]( self,  "_confirmAutomaticOnStateChangeWithCompletion:",  v26);

      objc_destroyWeak(v28);
    }

    objc_destroyWeak(&location);
  }

  else
  {
    if (state == 1) {
      char v12 = v4;
    }
    else {
      char v12 = 1;
    }
    if ((v12 & 1) == 0)
    {
      id v13 = sub_100084338();
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = object_getClass(self);
        v16 = class_getName(v15);
        v17 = sel_getName(a2);
        int64_t v18 = self->_state;
        *(_DWORD *)buf = 136446722;
        if (v18) {
          v19 = "on";
        }
        else {
          v19 = "off";
        }
        v31 = v16;
        __int16 v32 = 2082;
        v33 = v17;
        __int16 v34 = 2082;
        v35 = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  " [%{public}s %{public}s]: %{public}s -> off",  buf,  0x20u);
      }

      self->_int64_t state = 0LL;
      self->_enteredOnStateAutomatically = 0;
      -[PBAttentionMonitorStateMachine _cancelAutomaticOnStateChangeConfirmationIfNeeded]( self,  "_cancelAutomaticOnStateChangeConfirmationIfNeeded");
      -[PBAttentionMonitorStateMachine _enterOffStateAutomatically](self, "_enterOffStateAutomatically");
    }
  }

- (void)enterOffStateAutomatically
{
  if (self->_state == 1)
  {
    id v4 = sub_100084338();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      Class = object_getClass(self);
      Name = class_getName(Class);
      v8 = sel_getName(a2);
      int64_t state = self->_state;
      int v11 = 136446722;
      char v12 = Name;
      if (state) {
        v10 = "on";
      }
      else {
        v10 = "off";
      }
      __int16 v13 = 2082;
      v14 = v8;
      __int16 v15 = 2082;
      v16 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  " [%{public}s %{public}s]: %{public}s -> off",  (uint8_t *)&v11,  0x20u);
    }

    self->_int64_t state = 0LL;
    self->_enteredOnStateAutomatically = 0;
    -[PBAttentionMonitorStateMachine _cancelAutomaticOnStateChangeConfirmationIfNeeded]( self,  "_cancelAutomaticOnStateChangeConfirmationIfNeeded");
    -[PBAttentionMonitorStateMachine _enterOffStateAutomatically](self, "_enterOffStateAutomatically");
  }

- (void)enterOnStateForced
{
  if (!self->_state)
  {
    id v4 = sub_100084338();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      Class = object_getClass(self);
      Name = class_getName(Class);
      v8 = sel_getName(a2);
      int64_t state = self->_state;
      int v11 = 136446722;
      char v12 = Name;
      if (state) {
        v10 = "on";
      }
      else {
        v10 = "off";
      }
      __int16 v13 = 2082;
      v14 = v8;
      __int16 v15 = 2082;
      v16 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  " [%{public}s %{public}s]: %{public}s -> on",  (uint8_t *)&v11,  0x20u);
    }

    self->_int64_t state = 1LL;
    self->_enteredOnStateAutomatically = 0;
    -[PBAttentionMonitorStateMachine _cancelAutomaticOnStateChangeConfirmationIfNeeded]( self,  "_cancelAutomaticOnStateChangeConfirmationIfNeeded");
    -[PBAttentionMonitorStateMachine _enterOnStateForced](self, "_enterOnStateForced");
  }

- (void)enterOffStateForced
{
  if (self->_state == 1)
  {
    id v4 = sub_100084338();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      Class = object_getClass(self);
      Name = class_getName(Class);
      v8 = sel_getName(a2);
      int64_t state = self->_state;
      int v11 = 136446722;
      char v12 = Name;
      if (state) {
        v10 = "on";
      }
      else {
        v10 = "off";
      }
      __int16 v13 = 2082;
      v14 = v8;
      __int16 v15 = 2082;
      v16 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  " [%{public}s %{public}s]: %{public}s -> off",  (uint8_t *)&v11,  0x20u);
    }

    self->_int64_t state = 0LL;
    self->_enteredOnStateAutomatically = 0;
    -[PBAttentionMonitorStateMachine _cancelAutomaticOnStateChangeConfirmationIfNeeded]( self,  "_cancelAutomaticOnStateChangeConfirmationIfNeeded");
    -[PBAttentionMonitorStateMachine _enterOffStateForced](self, "_enterOffStateForced");
  }

- (BOOL)enteredOnStateAutomatically
{
  return self->_enteredOnStateAutomatically;
}

- (void)_cancelAutomaticOnStateChangeConfirmationIfNeeded
{
  if (self->_automaticOnStateChangeConfirmationID)
  {
    -[PBAttentionMonitorStateMachine _cancelAutomaticOnStateChangeConfirmation]( self,  "_cancelAutomaticOnStateChangeConfirmation");
    automaticOnStateChangeConfirmationID = self->_automaticOnStateChangeConfirmationID;
    self->_automaticOnStateChangeConfirmationID = 0LL;
  }

- (id)_logString
{
  if (self->_state) {
    v2 = "ON";
  }
  else {
    v2 = "OFF";
  }
  objc_super v3 = "yes";
  if (self->_automaticEnabled) {
    id v4 = "yes";
  }
  else {
    id v4 = "no";
  }
  if (!self->_enteredOnStateAutomatically) {
    objc_super v3 = "no";
  }
  return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"{state=%s, offset=%f, autoEnabled=%s, onAutomatically=%s}",  v2,  *(void *)&self->_enabledOffset,  v4,  v3));
}

- (BOOL)_canBeInOnStateAutomatically
{
  return 1;
}

- (void)_confirmAutomaticOnStateChangeWithCompletion:(id)a3
{
}

- (double)enabledOffset
{
  return self->_enabledOffset;
}

- (void)setEnabledOffset:(double)a3
{
  self->_enabledOffset = a3;
}

- (void).cxx_destruct
{
}

@end