@interface TVAirPlayAPRKPinSession
- (NSString)description;
- (NSString)messageString;
- (NSString)promptString;
- (NSString)titleString;
- (OS_dispatch_source)timeoutTimer;
- (TVAirPlayAPRKPinSession)init;
- (TVAirPlayAPRKPinSession)initWithPasscode:(id)a3 clientName:(id)a4;
- (TVAirPlayAPRKSessionDelegate)delegate;
- (int64_t)sessionType;
- (void)_cancelTimer;
- (void)_handleTimeoutTimer;
- (void)_startTimer;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setTimeoutTimer:(id)a3;
- (void)userStop;
- (void)wasRegistered;
@end

@implementation TVAirPlayAPRKPinSession

- (TVAirPlayAPRKPinSession)init
{
  return 0LL;
}

- (TVAirPlayAPRKPinSession)initWithPasscode:(id)a3 clientName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___TVAirPlayAPRKPinSession;
  v8 = -[TVAirPlayAPRKPinSession init](&v17, "init");
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    messageString = v8->_messageString;
    v8->_messageString = v9;

    if ([v7 length])
    {
      v11 = (NSString *)[v7 copy];
      promptString = v8->_promptString;
      v8->_promptString = v11;
    }

    else
    {
      promptString = v8->_promptString;
      v8->_promptString = 0LL;
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v14 = objc_claimAutoreleasedReturnValue([v13 localizedStringForKey:@"TVAirPlayPINTitle" value:&stru_1000325D8 table:0]);
    titleString = v8->_titleString;
    v8->_titleString = (NSString *)v14;
  }

  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVAirPlayAPRKPinSession;
  -[TVAirPlayAPRKPinSession dealloc](&v3, "dealloc");
}

- (NSString)description
{
  objc_super v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___TVAirPlayAPRKPinSession;
  v4 = -[TVAirPlayAPRKPinSession description](&v15, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[NSMutableArray addObject:](v3, "addObject:", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayAPRKPinSession titleString](self, "titleString"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@=%@",  @"titleString",  v6));
  -[NSMutableArray addObject:](v3, "addObject:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayAPRKPinSession messageString](self, "messageString"));
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@=%@",  @"messageString",  v8));
  -[NSMutableArray addObject:](v3, "addObject:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayAPRKPinSession promptString](self, "promptString"));
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@=%@",  @"promptString",  v10));
  -[NSMutableArray addObject:](v3, "addObject:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v3, "componentsJoinedByString:", @", "));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"<%@>", v12));

  return (NSString *)v13;
}

- (int64_t)sessionType
{
  return 4LL;
}

- (void)wasRegistered
{
}

- (void)userStop
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[TVAirPlayAPRKPinSession delegate](self, "delegate"));
  [v3 sessionDidReceiveUserStop:self];
}

- (void)_startTimer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayAPRKPinSession timeoutTimer](self, "timeoutTimer"));
  if (!v3)
  {
    v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, &_dispatch_main_q);
    -[TVAirPlayAPRKPinSession setTimeoutTimer:](self, "setTimeoutTimer:", v4);
    objc_initWeak(&location, self);
    dispatch_time_t v5 = dispatch_time(0LL, 60000000000LL);
    dispatch_source_set_timer(v4, v5, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10001B808;
    v6[3] = &unk_100030B18;
    objc_copyWeak(&v7, &location);
    dispatch_source_set_event_handler(v4, v6);
    dispatch_resume(v4);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (void)_cancelTimer
{
  id v3 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[TVAirPlayAPRKPinSession timeoutTimer](self, "timeoutTimer"));
  if (v3)
  {
    v4 = v3;
    dispatch_source_cancel(v3);
    -[TVAirPlayAPRKPinSession setTimeoutTimer:](self, "setTimeoutTimer:", 0LL);
    id v3 = v4;
  }
}

- (void)_handleTimeoutTimer
{
  id v3 = sub_100004330();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[TVAirPlayAPRKPinSession _handleTimeoutTimer]";
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s: PIN session timed out",  (uint8_t *)&v5,  0xCu);
  }

  -[TVAirPlayAPRKPinSession _cancelTimer](self, "_cancelTimer");
  -[TVAirPlayAPRKPinSession userStop](self, "userStop");
}

- (TVAirPlayAPRKSessionDelegate)delegate
{
  return (TVAirPlayAPRKSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSString)titleString
{
  return self->_titleString;
}

- (NSString)messageString
{
  return self->_messageString;
}

- (NSString)promptString
{
  return self->_promptString;
}

- (OS_dispatch_source)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end