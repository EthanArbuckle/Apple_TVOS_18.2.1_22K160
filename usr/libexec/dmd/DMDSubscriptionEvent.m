@interface DMDSubscriptionEvent
+ (id)fetchRequestMatchingEventsFromOrganizationWithIdentifier:(id)a3;
- (id)dictionaryRepresentation;
@end

@implementation DMDSubscriptionEvent

- (id)dictionaryRepresentation
{
  v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDSubscriptionEvent payloadIdentifier](self, "payloadIdentifier"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDSubscriptionEvent payloadIdentifier](self, "payloadIdentifier"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v5,  DMFDeclarationEventsMessageInReplyToKey);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDSubscriptionEvent eventType](self, "eventType"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DMDSubscriptionEvent eventType](self, "eventType"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v7,  DMFDeclarationEventsMessageEventTypeKey);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDSubscriptionEvent date](self, "date"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DMDSubscriptionEvent date](self, "date"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v9,  DMFDeclarationEventsMessageEventTimestampKey);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DMDSubscriptionEvent details](self, "details"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[DMDSubscriptionEvent details](self, "details"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v11,  DMFDeclarationEventsMessageEventPayloadKey);
  }

  return v3;
}

+ (id)fetchRequestMatchingEventsFromOrganizationWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 fetchRequest]);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"organization.identifier = %@",  v4));

  [v5 setPredicate:v6];
  return v5;
}

@end