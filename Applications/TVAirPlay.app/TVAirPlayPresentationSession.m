@interface TVAirPlayPresentationSession
- (BOOL)deactivated;
- (BOOL)performAction:(id)a3 withOptions:(id)a4 outInfo:(id *)a5 error:(id *)a6;
- (BOOL)setProperty:(id)a3 qualifier:(id)a4 value:(id)a5 error:(id *)a6;
- (BOOL)stopWithOptions:(id)a3 error:(id *)a4;
- (NSString)description;
- (OS_dispatch_source)userActivityTimer;
- (TVAirPlayLegacySessionDelegate)delegate;
- (TVAirPlayPresentationView)presentationView;
- (id)getProperty:(id)a3 qualifier:(id)a4 error:(id *)a5;
- (int64_t)sessionType;
- (unsigned)sessionID;
- (void)setDeactivated:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setPresentationView:(id)a3;
- (void)setUserActivityTimer:(id)a3;
- (void)startWithOptions:(id)a3 completion:(id)a4;
- (void)userStop;
@end

@implementation TVAirPlayPresentationSession

- (NSString)description
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVAirPlayPresentationSession;
  v3 = -[TVAirPlayPresentationSession description](&v7, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ ID: %u",  v4,  -[TVAirPlayPresentationSession sessionID](self, "sessionID")));

  return (NSString *)v5;
}

- (int64_t)sessionType
{
  return 1LL;
}

- (void)userStop
{
  v7[0] = @"sessionID";
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  -[TVAirPlayPresentationSession sessionID](self, "sessionID")));
  v7[1] = @"userExit";
  v8[0] = v3;
  v8[1] = &__kCFBooleanTrue;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  2LL));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayPresentationSession delegate](self, "delegate"));
  [v5 session:self didPerformEvent:@"userStop" withInfo:v4];

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVAirPlaySessionManager sharedInstance](&OBJC_CLASS___TVAirPlaySessionManager, "sharedInstance"));
  [v6 deregisterSession:self options:1];
}

- (void)startWithOptions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v23 = 0LL;
  unsigned int v8 = +[TVAirPlayUtilities validateParameters:error:]( &OBJC_CLASS___TVAirPlayUtilities,  "validateParameters:error:",  v6,  &v23);
  id v9 = v23;
  if (v8)
  {

    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"sessionID"]);
    self->_sessionID = [v10 unsignedIntValue];

    v11 = objc_alloc(&OBJC_CLASS___TVAirPlayPresentationView);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    [v12 bounds];
    v13 = -[TVAirPlayPresentationView initWithFrame:](v11, "initWithFrame:");
    presentationView = self->_presentationView;
    self->_presentationView = v13;

    uint64_t v15 = objc_claimAutoreleasedReturnValue(-[TVAirPlayPresentationView presentationLayer](self->_presentationView, "presentationLayer"));
    v16 = (void *)v15;
    if (v15)
    {
      v24 = @"presentationLayer";
      uint64_t v25 = v15;
      v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v25,  &v24,  1LL));
    }

    else
    {
      v17 = 0LL;
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[TVAirPlaySessionManager sharedInstance](&OBJC_CLASS___TVAirPlaySessionManager, "sharedInstance"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100011470;
    v20[3] = &unk_100030EF0;
    id v21 = v17;
    id v22 = v7;
    id v19 = v17;
    [v18 registerSession:self withCompletionHandler:v20];
  }

  else
  {
    (*((void (**)(id, void, id))v7 + 2))(v7, 0LL, v9);
  }
}

- (BOOL)stopWithOptions:(id)a3 error:(id *)a4
{
  BOOL v5 = +[TVAirPlayUtilities validateParameters:error:]( &OBJC_CLASS___TVAirPlayUtilities,  "validateParameters:error:",  a3,  a4);
  if (v5)
  {
    presentationView = self->_presentationView;
    self->_presentationView = 0LL;

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
  id v9 = a3;
  BOOL v10 = +[TVAirPlayUtilities validateParameters:error:]( &OBJC_CLASS___TVAirPlayUtilities,  "validateParameters:error:",  a4,  a6);
  if (v10)
  {
    id v11 = [v9 isEqualToString:off_10003F258];
  }

  return v10;
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

- (TVAirPlayPresentationView)presentationView
{
  return self->_presentationView;
}

- (void)setPresentationView:(id)a3
{
}

- (OS_dispatch_source)userActivityTimer
{
  return self->_userActivityTimer;
}

- (void)setUserActivityTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end