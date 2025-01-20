@interface TVAirPlayInfoSession
- (BOOL)deactivated;
- (BOOL)performAction:(id)a3 withOptions:(id)a4 outInfo:(id *)a5 error:(id *)a6;
- (BOOL)setProperty:(id)a3 qualifier:(id)a4 value:(id)a5 error:(id *)a6;
- (BOOL)stopWithOptions:(id)a3 error:(id *)a4;
- (NSString)commandKey;
- (NSString)description;
- (NSString)messageString;
- (NSString)promptString;
- (NSString)titleString;
- (NSTimer)timeoutTimer;
- (TVAirPlayLegacySessionDelegate)delegate;
- (id)getProperty:(id)a3 qualifier:(id)a4 error:(id *)a5;
- (int64_t)sessionType;
- (unsigned)sessionID;
- (void)_messageTimedOut;
- (void)setCommandKey:(id)a3;
- (void)setDeactivated:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setMessageString:(id)a3;
- (void)setPromptString:(id)a3;
- (void)setSessionType:(int64_t)a3;
- (void)setTimeoutTimer:(id)a3;
- (void)setTitleString:(id)a3;
- (void)startWithOptions:(id)a3 completion:(id)a4;
- (void)userStop;
@end

@implementation TVAirPlayInfoSession

- (NSString)description
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVAirPlayInfoSession;
  v3 = -[TVAirPlayInfoSession description](&v7, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ ID: %u",  v4,  -[TVAirPlayInfoSession sessionID](self, "sessionID")));

  return (NSString *)v5;
}

- (void)startWithOptions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v32 = 0LL;
  unsigned int v8 = +[TVAirPlayUtilities validateParameters:error:]( &OBJC_CLASS___TVAirPlayUtilities,  "validateParameters:error:",  v6,  &v32);
  id v9 = v32;
  if (v8)
  {
    unsigned int v10 = dword_10003F1F0++;
    self->_sessionID = v10;
    v11 = (NSString *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"TVAirPlayInfoSessionCommand"]);
    commandKey = self->_commandKey;
    self->_commandKey = v11;

    if (-[NSString isEqualToString:](self->_commandKey, "isEqualToString:", @"showPIN"))
    {
      self->_sessionType = 4LL;
      v13 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"pin"]);
      v14 = (NSString *)[v13 copy];
      messageString = self->_messageString;
      self->_messageString = v14;

      v16 = (NSString *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"clientName"]);
      if (-[NSString length](v16, "length"))
      {
        v17 = (NSString *)-[NSString copy](v16, "copy");
        promptString = self->_promptString;
        self->_promptString = v17;
      }

      else
      {
        promptString = self->_promptString;
        self->_promptString = 0LL;
      }

      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v24 = (NSString *)objc_claimAutoreleasedReturnValue( [v23 localizedStringForKey:@"TVAirPlayPINTitle" value:&stru_1000325D8 table:0]);
      titleString = self->_titleString;
      self->_titleString = v24;
    }

    else
    {
      if (!-[NSString isEqualToString:](self->_commandKey, "isEqualToString:", @"incompatibleSender"))
      {
LABEL_11:
        v26 = (NSTimer *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  self,  "_messageTimedOut",  0LL,  0LL,  60.0));
        timeoutTimer = self->_timeoutTimer;
        self->_timeoutTimer = v26;

        v28 = (void *)objc_claimAutoreleasedReturnValue( +[TVAirPlaySessionManager sharedInstance]( &OBJC_CLASS___TVAirPlaySessionManager,  "sharedInstance"));
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472LL;
        v29[2] = sub_1000105A4;
        v29[3] = &unk_100030EF0;
        id v31 = v7;
        id v30 = v9;
        [v28 registerSession:self withCompletionHandler:v29];

        goto LABEL_12;
      }

      self->_sessionType = 5LL;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v20 = (NSString *)objc_claimAutoreleasedReturnValue( [v19 localizedStringForKey:@"AirPlaySecurityVerifyFailureDialogText" value:&stru_1000325D8 table:0]);
      v21 = self->_messageString;
      self->_messageString = v20;

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v22 = (NSString *)objc_claimAutoreleasedReturnValue( [v13 localizedStringForKey:@"AirPlaySecurityVerifyFailureDialogLabel" value:&stru_1000325D8 table:0]);
      v16 = self->_titleString;
      self->_titleString = v22;
    }

    goto LABEL_11;
  }

  (*((void (**)(id, void, id))v7 + 2))(v7, 0LL, v9);
LABEL_12:
}

- (BOOL)stopWithOptions:(id)a3 error:(id *)a4
{
  BOOL v5 = +[TVAirPlayUtilities validateParameters:error:]( &OBJC_CLASS___TVAirPlayUtilities,  "validateParameters:error:",  a3,  a4);
  if (v5)
  {
    -[NSTimer invalidate](self->_timeoutTimer, "invalidate");
    timeoutTimer = self->_timeoutTimer;
    self->_timeoutTimer = 0LL;

    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[TVAirPlaySessionManager sharedInstance](&OBJC_CLASS___TVAirPlaySessionManager, "sharedInstance"));
    [v7 deregisterSession:self options:0];
  }

  return v5;
}

- (id)getProperty:(id)a3 qualifier:(id)a4 error:(id *)a5
{
  return 0LL;
}

- (BOOL)setProperty:(id)a3 qualifier:(id)a4 value:(id)a5 error:(id *)a6
{
  return 0;
}

- (BOOL)performAction:(id)a3 withOptions:(id)a4 outInfo:(id *)a5 error:(id *)a6
{
  return 0;
}

- (void)userStop
{
  id v3 = sub_1000042C0();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "User dismissed info dialog session %{public}@",  (uint8_t *)&v5,  0xCu);
  }

  -[TVAirPlayInfoSession stopWithOptions:error:](self, "stopWithOptions:error:", &__NSDictionary0__struct, 0LL);
}

- (void)_messageTimedOut
{
  id v3 = sub_1000042C0();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Info dialog session %{public}@ timed out",  (uint8_t *)&v5,  0xCu);
  }

  -[TVAirPlayInfoSession stopWithOptions:error:](self, "stopWithOptions:error:", &__NSDictionary0__struct, 0LL);
}

- (BOOL)deactivated
{
  return self->_deactivated;
}

- (void)setDeactivated:(BOOL)a3
{
  self->_deactivated = a3;
}

- (TVAirPlayLegacySessionDelegate)delegate
{
  return (TVAirPlayLegacySessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (unsigned)sessionID
{
  return self->_sessionID;
}

- (NSString)commandKey
{
  return self->_commandKey;
}

- (void)setCommandKey:(id)a3
{
}

- (NSTimer)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
}

- (int64_t)sessionType
{
  return self->_sessionType;
}

- (void)setSessionType:(int64_t)a3
{
  self->_sessionType = a3;
}

- (NSString)titleString
{
  return self->_titleString;
}

- (void)setTitleString:(id)a3
{
}

- (NSString)promptString
{
  return self->_promptString;
}

- (void)setPromptString:(id)a3
{
}

- (NSString)messageString
{
  return self->_messageString;
}

- (void)setMessageString:(id)a3
{
}

- (void).cxx_destruct
{
}

@end