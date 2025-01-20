@interface RMConfigurationEventStreamSubscription
- (NSSet)configurationTypes;
- (NSString)identifier;
- (OS_xpc_event_publisher)eventPublisher;
- (RMConfigurationEventStreamSubscription)initWithToken:(unint64_t)a3 configurationTypes:(id)a4 eventPublisher:(id)a5;
- (id)reportDetails;
- (unint64_t)token;
- (void)applyChangedConfigurationsTypes:(id)a3;
- (void)setEventPublisher:(id)a3;
@end

@implementation RMConfigurationEventStreamSubscription

- (RMConfigurationEventStreamSubscription)initWithToken:(unint64_t)a3 configurationTypes:(id)a4 eventPublisher:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___RMConfigurationEventStreamSubscription;
  v10 = -[RMConfigurationEventStreamSubscription init](&v18, "init");
  v11 = v10;
  if (v10)
  {
    v10->_token = a3;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
    uint64_t v13 = objc_claimAutoreleasedReturnValue([v12 stringValue]);
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v13;

    v15 = (NSSet *)[v8 copy];
    configurationTypes = v11->_configurationTypes;
    v11->_configurationTypes = v15;

    objc_storeStrong((id *)&v11->_eventPublisher, a5);
  }

  return v11;
}

- (void)applyChangedConfigurationsTypes:(id)a3
{
  v11 = @"ConfigurationTypes";
  id v12 = a3;
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[RMLog configurationEventStreamSubscription]( &OBJC_CLASS___RMLog,  "configurationEventStreamSubscription"));

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    v10 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Firing stream event with payload: %{public}@",  (uint8_t *)&v9,  0xCu);
  }

  v7 = (void *)_CFXPCCreateXPCObjectFromCFObject(v5);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[RMConfigurationEventStreamSubscription eventPublisher](self, "eventPublisher"));
  xpc_event_publisher_fire(v8, -[RMConfigurationEventStreamSubscription token](self, "token"), v7);
}

- (id)reportDetails
{
  v11[0] = @"Location";
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RMConfigurationEventStreamSubscription identifier](self, "identifier"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"XPCEvent/%@", v3));
  v12[0] = v4;
  v11[1] = @"Identifier";
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RMConfigurationEventStreamSubscription identifier](self, "identifier"));
  v12[1] = v5;
  v11[2] = @"ConfigurationTypes";
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RMConfigurationEventStreamSubscription configurationTypes](self, "configurationTypes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allObjects]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 sortedArrayUsingSelector:"caseInsensitiveCompare:"]);
  v12[2] = v8;
  int v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  3LL));

  return v9;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSSet)configurationTypes
{
  return self->_configurationTypes;
}

- (unint64_t)token
{
  return self->_token;
}

- (OS_xpc_event_publisher)eventPublisher
{
  return self->_eventPublisher;
}

- (void)setEventPublisher:(id)a3
{
}

- (void).cxx_destruct
{
}

@end