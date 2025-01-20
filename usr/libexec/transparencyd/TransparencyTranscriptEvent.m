@interface TransparencyTranscriptEvent
- (BOOL)success;
- (NSDate)timestamp;
- (NSString)name;
- (TransparencyTranscriptEvent)initWithName:(id)a3;
- (id)serialize;
- (void)setName:(id)a3;
- (void)setSuccess:(BOOL)a3;
- (void)setTimestamp:(id)a3;
@end

@implementation TransparencyTranscriptEvent

- (TransparencyTranscriptEvent)initWithName:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TransparencyTranscriptEvent;
  v5 = -[TransparencyTranscriptEvent init](&v8, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    -[TransparencyTranscriptEvent setTimestamp:](v5, "setTimestamp:", v6);

    -[TransparencyTranscriptEvent setName:](v5, "setName:", v4);
  }

  return v5;
}

- (id)serialize
{
  v8[0] = @"timestamp";
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyTranscriptEvent timestamp](self, "timestamp"));
  [v3 timeIntervalSince1970];
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v8[1] = @"name";
  v9[0] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyTranscriptEvent name](self, "name"));
  v9[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v8,  2LL));

  return v6;
}

- (NSDate)timestamp
{
  return (NSDate *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setTimestamp:(id)a3
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setName:(id)a3
{
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (void).cxx_destruct
{
}

@end