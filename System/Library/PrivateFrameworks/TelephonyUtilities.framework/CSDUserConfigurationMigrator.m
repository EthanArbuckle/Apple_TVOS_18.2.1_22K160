@interface CSDUserConfigurationMigrator
- (CSDUserConfigurationMigrator)init;
- (TUUserConfiguration)userConfiguration;
- (void)migrateAnnounceCalls;
- (void)migrateConversationLinkBaseURL;
- (void)perform;
@end

@implementation CSDUserConfigurationMigrator

- (CSDUserConfigurationMigrator)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CSDUserConfigurationMigrator;
  v2 = -[CSDUserConfigurationMigrator init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___TUUserConfiguration);
    userConfiguration = v2->_userConfiguration;
    v2->_userConfiguration = v3;
  }

  return v2;
}

- (void)perform
{
}

- (void)migrateAnnounceCalls
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDUserConfigurationMigrator userConfiguration](self, "userConfiguration"));
  id v4 = [v3 announceCalls];

  if (!v4)
  {
    v5 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.InCallService");
    id v6 = sub_1001704C4();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      v18 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Migrator is looking for legacy Announce Calls setting in %@",  (uint8_t *)&v17,  0xCu);
    }

    v8 = (NSUserDefaults *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](v5, "objectForKey:", @"announcements"));
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSNumber, v9);
    char isKindOfClass = objc_opt_isKindOfClass(v8, v10);
    id v12 = sub_1001704C4();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if ((isKindOfClass & 1) != 0)
    {
      if (v14)
      {
        int v17 = 138412290;
        v18 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Migrator found legacy Announce Calls setting %@",  (uint8_t *)&v17,  0xCu);
      }

      unint64_t v15 = (unint64_t)-[NSUserDefaults unsignedIntegerValue](v8, "unsignedIntegerValue") - 1;
      if (v15 > 3) {
        uint64_t v16 = 0LL;
      }
      else {
        uint64_t v16 = qword_1003792F0[v15];
      }
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CSDUserConfigurationMigrator userConfiguration](self, "userConfiguration"));
      -[os_log_s setAnnounceCalls:](v13, "setAnnounceCalls:", v16);
    }

    else if (v14)
    {
      int v17 = 138412290;
      v18 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Migrator did not find legacy Announce Calls setting in %@",  (uint8_t *)&v17,  0xCu);
    }

    -[NSUserDefaults removeObjectForKey:](v5, "removeObjectForKey:", @"announcements");
  }

- (void)migrateConversationLinkBaseURL
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDUserConfigurationMigrator userConfiguration](self, "userConfiguration"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 conversationLinkBaseURL]);

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults tu_defaults](&OBJC_CLASS___NSUserDefaults, "tu_defaults"));
    id v6 = sub_1001704C4();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      BOOL v14 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Migrator is looking for legacy Conversation Link Base URL setting in %@",  (uint8_t *)&v13,  0xCu);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue([v5 stringForKey:@"GondolaLinkOverrideBaseURL"]);
    id v9 = sub_1001704C4();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v11)
      {
        int v13 = 138412290;
        BOOL v14 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Migrator found legacy Conversation Link Base URL setting %@",  (uint8_t *)&v13,  0xCu);
      }

      uint64_t v10 = -[NSURL initWithString:](objc_alloc(&OBJC_CLASS___NSURL), "initWithString:", v8);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDUserConfigurationMigrator userConfiguration](self, "userConfiguration"));
      [v12 setConversationLinkBaseURL:v10];
    }

    else if (v11)
    {
      int v13 = 138412290;
      BOOL v14 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Migrator did not find legacy Conversation Link Base URL setting in %@",  (uint8_t *)&v13,  0xCu);
    }

    [v5 removeObjectForKey:@"GondolaLinkOverrideBaseURL"];
  }
}

- (TUUserConfiguration)userConfiguration
{
  return self->_userConfiguration;
}

- (void).cxx_destruct
{
}

@end