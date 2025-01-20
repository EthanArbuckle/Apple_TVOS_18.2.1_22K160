@interface DMDEventStreamEvent
- (DMDEventStreamEvent)initWithEventType:(id)a3 details:(id)a4;
- (NSDate)timestamp;
- (NSDictionary)details;
- (NSString)eventType;
- (id)description;
- (id)eventStatusMessageWithPayloadIdentifier:(id)a3;
@end

@implementation DMDEventStreamEvent

- (DMDEventStreamEvent)initWithEventType:(id)a3 details:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___DMDEventStreamEvent;
  v8 = -[DMDEventStreamEvent init](&v16, "init");
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    eventType = v8->_eventType;
    v8->_eventType = v9;

    v11 = (NSDictionary *)[v7 copy];
    details = v8->_details;
    v8->_details = v11;

    v13 = objc_opt_new(&OBJC_CLASS___NSDate);
    timestamp = v8->_timestamp;
    v8->_timestamp = v13;
  }

  return v8;
}

- (id)description
{
  v7[0] = @"eventType";
  v7[1] = @"timestamp";
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v7, 2LL));
  uint64_t v4 = DMFObjectDescriptionWithProperties(self, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return v5;
}

- (id)eventStatusMessageWithPayloadIdentifier:(id)a3
{
  id v4 = a3;
  v5 = -[NSMutableDictionary initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableDictionary), "initWithCapacity:", 4LL);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v4,  DMFDeclarationEventsMessageInReplyToKey);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEventStreamEvent eventType](self, "eventType"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v6,  DMFDeclarationEventsMessageEventTypeKey);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEventStreamEvent timestamp](self, "timestamp"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v7,  DMFDeclarationEventsMessageEventTimestampKey);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEventStreamEvent details](self, "details"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v8,  DMFDeclarationEventsMessageEventPayloadKey);

  return v5;
}

- (NSString)eventType
{
  return self->_eventType;
}

- (NSDictionary)details
{
  return self->_details;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
}

@end