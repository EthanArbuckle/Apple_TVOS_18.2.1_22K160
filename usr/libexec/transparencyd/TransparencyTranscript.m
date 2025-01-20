@interface TransparencyTranscript
- (NSMutableArray)_events;
- (NSString)context;
- (TransparencySettingsProtocol)settings;
- (TransparencyTranscript)initWithContext:(id)a3 settings:(id)a4;
- (id)serialize;
- (void)addEvent:(id)a3;
- (void)setContext:(id)a3;
- (void)setSettings:(id)a3;
- (void)set_events:(id)a3;
- (void)startEvent:(id)a3;
- (void)stopEventWithFailure:(id)a3 error:(id)a4;
- (void)stopEventWithSuccess:(id)a3;
@end

@implementation TransparencyTranscript

- (TransparencyTranscript)initWithContext:(id)a3 settings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TransparencyTranscript;
  v8 = -[TransparencyTranscript init](&v11, "init");
  if (v8)
  {
    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    -[TransparencyTranscript set_events:](v8, "set_events:", v9);

    -[TransparencyTranscript setContext:](v8, "setContext:", v6);
    -[TransparencyTranscript setSettings:](v8, "setSettings:", v7);
  }

  return v8;
}

- (void)addEvent:(id)a3
{
  id v12 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyTranscript settings](self, "settings"));
  if (![v4 allowsInternalSecurityPolicies])
  {
LABEL_6:

    goto LABEL_7;
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyTranscript settings](self, "settings"));
  unsigned int v6 = [v5 getBool:kTransparencyFlagEnableTranscript];

  if (v6)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyTranscript _events](self, "_events"));
    objc_sync_enter(v4);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyTranscript _events](self, "_events"));
    v8 = -[TransparencyTranscriptEvent initWithName:]( objc_alloc(&OBJC_CLASS___TransparencyTranscriptEvent),  "initWithName:",  v12);
    [v7 insertObject:v8 atIndex:0];

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyTranscript _events](self, "_events"));
    id v10 = [v9 count];

    if ((unint64_t)v10 >= 0x101)
    {
      objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyTranscript _events](self, "_events"));
      [v11 removeLastObject];
    }

    objc_sync_exit(v4);
    goto LABEL_6;
  }

- (void)startEvent:(id)a3
{
  id v4 = a3;
  if (qword_1002EEFD0 != -1) {
    dispatch_once(&qword_1002EEFD0, &stru_10028AB28);
  }
  v5 = (os_log_s *)qword_1002EEFD8;
  if (os_log_type_enabled((os_log_t)qword_1002EEFD8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Event start: %@", buf, 0xCu);
  }

  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-Start", v4));
  -[TransparencyTranscript addEvent:](self, "addEvent:", v6);
}

- (void)stopEventWithSuccess:(id)a3
{
  id v4 = a3;
  if (qword_1002EEFD0 != -1) {
    dispatch_once(&qword_1002EEFD0, &stru_10028AB48);
  }
  v5 = (os_log_s *)qword_1002EEFD8;
  if (os_log_type_enabled((os_log_t)qword_1002EEFD8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Event success: %@", buf, 0xCu);
  }

  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-Stop-Success",  v4));
  -[TransparencyTranscript addEvent:](self, "addEvent:", v6);
}

- (void)stopEventWithFailure:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = (__CFString *)a4;
  if (qword_1002EEFD0 != -1) {
    dispatch_once(&qword_1002EEFD0, &stru_10028AB68);
  }
  id v8 = (os_log_s *)qword_1002EEFD8;
  if (os_log_type_enabled((os_log_t)qword_1002EEFD8, OS_LOG_TYPE_ERROR))
  {
    v9 = &stru_10028E390;
    if (v7) {
      v9 = v7;
    }
    *(_DWORD *)buf = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Event failure: %@ %@", buf, 0x16u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-Stop-Failure",  v6));
  -[TransparencyTranscript addEvent:](self, "addEvent:", v10);
}

- (id)serialize
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyTranscript _events](self, "_events"));
  objc_sync_enter(v3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyTranscript _events](self, "_events"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v4));

  objc_sync_exit(v3);
  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472LL;
  id v12 = sub_1001D9CB8;
  __int16 v13 = &unk_10028AB90;
  v14 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v6 = v14;
  [v5 enumerateObjectsUsingBlock:&v10];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyTranscript context](self, "context", v10, v11, v12, v13));
  v15 = v7;
  v16 = v6;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));

  return v8;
}

- (NSString)context
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setContext:(id)a3
{
}

- (NSMutableArray)_events
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)set_events:(id)a3
{
}

- (TransparencySettingsProtocol)settings
{
  return (TransparencySettingsProtocol *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setSettings:(id)a3
{
}

- (void).cxx_destruct
{
}

@end