@interface IMMessageSyndicationAction
- (void)addParametersToSendMessageDictionary:(id)a3;
@end

@implementation IMMessageSyndicationAction

- (void)addParametersToSendMessageDictionary:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___IMMessageSyndicationAction;
  id v4 = a3;
  -[IMMessageSyndicationAction addParametersToSendMessageDictionary:](&v13, "addParametersToSendMessageDictionary:", v4);
  id v5 = -[IMMessageSyndicationAction messagePartRange](self, "messagePartRange", v13.receiver, v13.super_class);
  uint64_t v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v5));
  [v4 setObject:v8 forKeyedSubscript:IMSyndicationActionRangeLocationKey];

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v7));
  [v4 setObject:v9 forKeyedSubscript:IMSyndicationActionRangeLengthKey];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[IMMessageSyndicationAction messagePartGUID](self, "messagePartGUID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 encodedMessagePartGUID]);
  id v12 = [v11 copy];
  [v4 setObject:v12 forKeyedSubscript:IMSyndicationActionMessagePartGUIDKey];
}

@end