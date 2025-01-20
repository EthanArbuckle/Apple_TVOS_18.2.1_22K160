@interface HHDClockPlayer
- (HHDClockPlayer)initWithEndpoint:(id)a3 delegate:(id)a4;
- (SIBSApplicationForegroundAssertion)foregroundAssertion;
- (int64_t)state;
- (unint64_t)previousReason;
- (void)invalidateAssertion;
- (void)setForegroundAssertion:(id)a3;
- (void)setPreviousReason:(unint64_t)a3;
- (void)setState:(int64_t)a3;
@end

@implementation HHDClockPlayer

- (HHDClockPlayer)initWithEndpoint:(id)a3 delegate:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___HHDClockPlayer;
  result = -[HHDClockPlayer initWithEndpoint:delegate:](&v5, "initWithEndpoint:delegate:", a3, a4);
  if (result)
  {
    result->_state = 0LL;
    result->_previousReason = 0LL;
  }

  return result;
}

- (void)setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[HHDClockPlayer endpoint](self, "endpoint"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 accessoryId]);

    id v7 = sub_100002640();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t state = self->_state;
      if (state > 2) {
        v10 = @"???";
      }
      else {
        v10 = off_100024718[state];
      }
      else {
        v11 = off_100024718[a3];
      }
      int v16 = 138413058;
      v17 = &stru_100024E50;
      __int16 v18 = 2114;
      v19 = v6;
      __int16 v20 = 2114;
      v21 = v10;
      __int16 v22 = 2114;
      v23 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%@Endpoint %{public}@ transitioning %{public}@ -> %{public}@",  (uint8_t *)&v16,  0x2Au);
    }

    self->_unint64_t state = a3;
    if (a3 == 2)
    {
      id v14 = sub_100002640();
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138412546;
        v17 = &stru_100024E50;
        __int16 v18 = 2114;
        v19 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%@Stopping playback for endpoint %{public}@",  (uint8_t *)&v16,  0x16u);
      }

      -[HHDClockPlayer stopPlayback](self, "stopPlayback");
      -[HHDClockPlayer invalidateAssertion](self, "invalidateAssertion");
    }

    else if (a3 == 1)
    {
      id v12 = sub_100002640();
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138412546;
        v17 = &stru_100024E50;
        __int16 v18 = 2114;
        v19 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%@Starting playback for endpoint %{public}@",  (uint8_t *)&v16,  0x16u);
      }

      -[HHDClockPlayer startPlayback](self, "startPlayback");
    }
  }

- (void)invalidateAssertion
{
  foregroundAssertion = self->_foregroundAssertion;
  if (foregroundAssertion)
  {
    -[SIBSApplicationForegroundAssertion invalidate](foregroundAssertion, "invalidate");
    v4 = self->_foregroundAssertion;
    self->_foregroundAssertion = 0LL;
  }

- (int64_t)state
{
  return self->_state;
}

- (SIBSApplicationForegroundAssertion)foregroundAssertion
{
  return self->_foregroundAssertion;
}

- (void)setForegroundAssertion:(id)a3
{
}

- (unint64_t)previousReason
{
  return self->_previousReason;
}

- (void)setPreviousReason:(unint64_t)a3
{
  self->_previousReason = a3;
}

- (void).cxx_destruct
{
}

@end