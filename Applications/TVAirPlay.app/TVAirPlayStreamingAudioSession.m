@interface TVAirPlayStreamingAudioSession
- (BOOL)deactivated;
- (BOOL)performAction:(id)a3 withOptions:(id)a4 outInfo:(id *)a5 error:(id *)a6;
- (BOOL)setProperty:(id)a3 qualifier:(id)a4 value:(id)a5 error:(id *)a6;
- (BOOL)stopWithOptions:(id)a3 error:(id *)a4;
- (NSDictionary)initialOptions;
- (NSString)description;
- (TVAirPlayLegacySessionDelegate)delegate;
- (id)getProperty:(id)a3 qualifier:(id)a4 error:(id *)a5;
- (int64_t)sessionType;
- (unsigned)sessionID;
- (void)setDeactivated:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setInitialOptions:(id)a3;
- (void)startWithOptions:(id)a3 completion:(id)a4;
@end

@implementation TVAirPlayStreamingAudioSession

- (NSString)description
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVAirPlayStreamingAudioSession;
  v3 = -[TVAirPlayStreamingAudioSession description](&v7, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ ID: %u",  v4,  -[TVAirPlayStreamingAudioSession sessionID](self, "sessionID")));

  return (NSString *)v5;
}

- (int64_t)sessionType
{
  return 0LL;
}

- (void)startWithOptions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v16 = 0LL;
  unsigned int v8 = +[TVAirPlayUtilities validateParameters:error:]( &OBJC_CLASS___TVAirPlayUtilities,  "validateParameters:error:",  v6,  &v16);
  id v9 = v16;
  if (v8)
  {
    v10 = (NSDictionary *)[v6 copy];
    initialOptions = self->_initialOptions;
    self->_initialOptions = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"sessionID"]);
    self->_sessionID = [v12 unsignedIntValue];

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[TVAirPlaySessionManager sharedInstance](&OBJC_CLASS___TVAirPlaySessionManager, "sharedInstance"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10000FF68;
    v14[3] = &unk_100030CF8;
    id v15 = v7;
    [v13 registerSession:self withCompletionHandler:v14];
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
    initialOptions = self->_initialOptions;
    self->_initialOptions = 0LL;

    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[TVAirPlaySessionManager sharedInstance](&OBJC_CLASS___TVAirPlaySessionManager, "sharedInstance"));
    [v7 deregisterSession:self options:0];
  }

  return v5;
}

- (id)getProperty:(id)a3 qualifier:(id)a4 error:(id *)a5
{
  return 0LL;
}

- (BOOL)performAction:(id)a3 withOptions:(id)a4 outInfo:(id *)a5 error:(id *)a6
{
  return 0;
}

- (BOOL)setProperty:(id)a3 qualifier:(id)a4 value:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = a5;
  BOOL v10 = +[TVAirPlayUtilities validateParametersWithPropertyKey:value:error:]( &OBJC_CLASS___TVAirPlayUtilities,  "validateParametersWithPropertyKey:value:error:",  v8,  v9,  a6);
  if (v10 && [v8 isEqual:off_10003F1E8])
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
    [v11 postNotificationName:@"TVAirPlayTimeNotificationName" object:0 userInfo:v9];
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

- (NSDictionary)initialOptions
{
  return self->_initialOptions;
}

- (void)setInitialOptions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end