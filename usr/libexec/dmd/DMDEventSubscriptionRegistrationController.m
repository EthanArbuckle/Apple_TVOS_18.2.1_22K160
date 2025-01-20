@interface DMDEventSubscriptionRegistrationController
- (DMDEventReportingSchedule)schedule;
- (DMDEventSubscriptionRegistrationController)initWithSubscriptionRegistration:(id)a3 streamEventsHandler:(id)a4;
- (NSDate)lastDateScheduleElapsed;
- (NSMutableDictionary)eventStreamByEventType;
- (NSString)identifier;
- (NSString)organizationIdentifier;
- (NSString)payloadIdentifier;
- (id)eventStatusesSinceStartDate:(id)a3;
- (id)streamEventsHandler;
- (void)_updateEventStreams:(id)a3;
- (void)setEventStreamByEventType:(id)a3;
- (void)setLastDateScheduleElapsed:(id)a3;
- (void)setSchedule:(id)a3;
- (void)updateWithSubscriptionRegistration:(id)a3;
@end

@implementation DMDEventSubscriptionRegistrationController

- (DMDEventSubscriptionRegistrationController)initWithSubscriptionRegistration:(id)a3 streamEventsHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___DMDEventSubscriptionRegistrationController;
  v8 = -[DMDEventSubscriptionRegistrationController init](&v24, "init");
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 payloadMetadata]);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 organization]);
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 identifier]);
    organizationIdentifier = v8->_organizationIdentifier;
    v8->_organizationIdentifier = (NSString *)v11;

    uint64_t v13 = objc_claimAutoreleasedReturnValue([v9 identifier]);
    payloadIdentifier = v8->_payloadIdentifier;
    v8->_payloadIdentifier = (NSString *)v13;

    uint64_t v15 = objc_claimAutoreleasedReturnValue([v6 identifier]);
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v15;

    id v17 = objc_retainBlock(v7);
    id streamEventsHandler = v8->_streamEventsHandler;
    v8->_id streamEventsHandler = v17;

    v19 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    eventStreamByEventType = v8->_eventStreamByEventType;
    v8->_eventStreamByEventType = v19;

    v21 = objc_opt_new(&OBJC_CLASS___NSDate);
    lastDateScheduleElapsed = v8->_lastDateScheduleElapsed;
    v8->_lastDateScheduleElapsed = v21;

    -[DMDEventSubscriptionRegistrationController updateWithSubscriptionRegistration:]( v8,  "updateWithSubscriptionRegistration:",  v6);
  }

  return v8;
}

- (void)updateWithSubscriptionRegistration:(id)a3
{
  id v12 = a3;
  if (!v12)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v10 handleFailureInMethod:a2, self, @"DMDEventSubscriptionRegistrationController.m", 49, @"Invalid parameter not satisfying: %@", @"subscriptionRegistration" object file lineNumber description];
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEventSubscriptionRegistrationController identifier](self, "identifier"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
  unsigned __int8 v7 = [v5 isEqualToString:v6];

  if ((v7 & 1) == 0)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v11 handleFailureInMethod:a2 object:self file:@"DMDEventSubscriptionRegistrationController.m" lineNumber:51 description:@"Cannot update subscription controller with a subscription registration with a different identifier"];
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue([v12 events]);
  -[DMDEventSubscriptionRegistrationController _updateEventStreams:](self, "_updateEventStreams:", v8);

  v9 = -[DMDEventReportingSchedule initWithScheduleRegistration:]( objc_alloc(&OBJC_CLASS___DMDEventReportingSchedule),  "initWithScheduleRegistration:",  v12);
  -[DMDEventSubscriptionRegistrationController setSchedule:](self, "setSchedule:", v9);
}

- (void)_updateEventStreams:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEventSubscriptionRegistrationController eventStreamByEventType](self, "eventStreamByEventType"));
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v23;
    *(void *)&__int128 v8 = 138543362LL;
    __int128 v21 = v8;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "payloadType", v21, (void)v22));
        v14 = (void *)objc_claimAutoreleasedReturnValue([v13 lowercaseString]);

        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v14]);
        v16 = v15;
        if (v15)
        {
          [v15 updateEvent:v12];
          goto LABEL_14;
        }

        id v17 = [v14 isEqualToString:@"com.apple.event.management.test"];
        if ((v17 & 1) != 0)
        {
          v18 = objc_opt_new(&OBJC_CLASS___DMDTestEventStream);
          if (!v18) {
            goto LABEL_14;
          }
          v19 = (os_log_s *)v18;
          [v5 setObject:v18 forKeyedSubscript:v14];
        }

        else
        {
          uint64_t v20 = DMFConfigurationEngineLog(v17);
          v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v21;
            v27 = v14;
            _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "Unknown event stream type %{public}@, skipping",  buf,  0xCu);
          }
        }

LABEL_14:
      }

      id v9 = [v6 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }

    while (v9);
  }
}

- (void)setSchedule:(id)a3
{
  id v5 = a3;
  if (!-[DMDEventReportingSchedule isEqual:](self->_schedule, "isEqual:", v5))
  {
    objc_storeStrong((id *)&self->_schedule, a3);
    if ([v5 frequency])
    {
      objc_initWeak(&location, self);
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472LL;
      v7[2] = sub_10003A3C4;
      v7[3] = &unk_10009E378;
      objc_copyWeak(&v8, &location);
      [v5 startWithScheduleElapsedHandler:v7];
      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }

    else
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue( -[DMDEventSubscriptionRegistrationController eventStreamByEventType]( self,  "eventStreamByEventType"));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_10003A374;
      v10[3] = &unk_10009EAC8;
      v10[4] = self;
      [v6 enumerateKeysAndObjectsUsingBlock:v10];
    }
  }
}

- (id)eventStatusesSinceStartDate:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEventSubscriptionRegistrationController eventStreamByEventType](self, "eventStreamByEventType"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10003A52C;
  v12[3] = &unk_10009EAF0;
  id v13 = v4;
  id v7 = v5;
  v14 = v7;
  id v8 = v4;
  [v6 enumerateKeysAndObjectsUsingBlock:v12];

  id v9 = v14;
  uint64_t v10 = v7;

  return v10;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)organizationIdentifier
{
  return self->_organizationIdentifier;
}

- (NSString)payloadIdentifier
{
  return self->_payloadIdentifier;
}

- (DMDEventReportingSchedule)schedule
{
  return self->_schedule;
}

- (NSMutableDictionary)eventStreamByEventType
{
  return self->_eventStreamByEventType;
}

- (void)setEventStreamByEventType:(id)a3
{
}

- (id)streamEventsHandler
{
  return self->_streamEventsHandler;
}

- (NSDate)lastDateScheduleElapsed
{
  return self->_lastDateScheduleElapsed;
}

- (void)setLastDateScheduleElapsed:(id)a3
{
}

- (void).cxx_destruct
{
}

@end