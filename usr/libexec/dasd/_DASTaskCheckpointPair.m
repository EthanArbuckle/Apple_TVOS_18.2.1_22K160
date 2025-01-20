@interface _DASTaskCheckpointPair
+ (BOOL)supportsSecureCoding;
- (PPSEvent)startEvent;
- (PPSEvent)terminalEvent;
- (_DASTaskCheckpointPair)initWithCoder:(id)a3;
- (_DASTaskCheckpointPair)initWithParams:(id)a3 terminalEvent:(id)a4;
- (id)debugDescription;
- (id)description;
- (id)dictionaryRepresentation;
- (void)encodeWithCoder:(id)a3;
- (void)setStartEvent:(id)a3;
- (void)setTerminalEvent:(id)a3;
@end

@implementation _DASTaskCheckpointPair

- (_DASTaskCheckpointPair)initWithParams:(id)a3 terminalEvent:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS____DASTaskCheckpointPair;
  v9 = -[_DASTaskCheckpointPair init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_startEvent, a3);
    objc_storeStrong((id *)&v10->_terminalEvent, a4);
  }

  return v10;
}

- (id)debugDescription
{
  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASTaskCheckpointPair description](self, "description"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ %p> %@",  v5,  self,  v6));

  return v7;
}

- (id)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_DASTaskCheckpointPair dictionaryRepresentation](self, "dictionaryRepresentation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 description]);

  return v3;
}

- (id)dictionaryRepresentation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_DASTaskCheckpointPair startEvent](self, "startEvent"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASTaskCheckpointPair startEvent](self, "startEvent"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 metricKeysAndValues]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v6));

    [v5 monotonicTimestamp];
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    [v7 setObject:v8 forKeyedSubscript:@"monotonicTimeStamp"];

    [v5 epochTimestamp];
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    [v7 setObject:v9 forKeyedSubscript:@"epoch"];

    [v3 setObject:v7 forKeyedSubscript:@"Start Event"];
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[_DASTaskCheckpointPair terminalEvent](self, "terminalEvent"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[_DASTaskCheckpointPair terminalEvent](self, "terminalEvent"));
    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v11 metricKeysAndValues]);
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v12));

    [v11 monotonicTimestamp];
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    [v13 setObject:v14 forKeyedSubscript:@"monotonicTimeStamp"];

    [v11 epochTimestamp];
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    [v13 setObject:v15 forKeyedSubscript:@"epoch"];

    [v3 setObject:v13 forKeyedSubscript:@"Terminal Event"];
  }

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_DASTaskCheckpointPair)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS____DASTaskCheckpointPair;
  v5 = -[_DASTaskCheckpointPair init](&v13, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:sub_1000A3F58() forKey:@"startEvent"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    startEvent = v5->_startEvent;
    v5->_startEvent = (PPSEvent *)v7;

    id v9 = [v4 decodeObjectOfClass:sub_1000A3F58() forKey:@"terminalEvent"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    terminalEvent = v5->_terminalEvent;
    v5->_terminalEvent = (PPSEvent *)v10;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  startEvent = self->_startEvent;
  id v5 = a3;
  [v5 encodeObject:startEvent forKey:@"startEvent"];
  [v5 encodeObject:self->_terminalEvent forKey:@"terminalEvent"];
}

- (PPSEvent)startEvent
{
  return self->_startEvent;
}

- (void)setStartEvent:(id)a3
{
}

- (PPSEvent)terminalEvent
{
  return self->_terminalEvent;
}

- (void)setTerminalEvent:(id)a3
{
}

- (void).cxx_destruct
{
}

@end