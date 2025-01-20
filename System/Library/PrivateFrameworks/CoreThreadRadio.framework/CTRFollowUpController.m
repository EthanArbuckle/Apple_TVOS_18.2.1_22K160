@interface CTRFollowUpController
- (BOOL)ctrUtilPostFollowUpItem:(id)a3;
- (CTRFollowUpController)init;
- (FLFollowUpController)ctrFollowUpController;
- (id)createFolloUpItem:(id)a3;
- (void)ctrUtilClearFollowUpItem:(id)a3;
- (void)setCtrFollowUpController:(id)a3;
@end

@implementation CTRFollowUpController

- (CTRFollowUpController)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CTRFollowUpController;
  v2 = -[CTRFollowUpController init](&v6, "init");
  if (v2)
  {
    v3 = -[FLFollowUpController initWithClientIdentifier:]( objc_alloc(&OBJC_CLASS___FLFollowUpController),  "initWithClientIdentifier:",  @"com.apple.fillmore.hw.fault");
    ctrFollowUpController = v2->_ctrFollowUpController;
    v2->_ctrFollowUpController = v3;
  }

  return v2;
}

- (id)createFolloUpItem:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___FLFollowUpItem);
  v5 = v4;
  if (!v4)
  {
    v9 = sub_1000160F4("com.apple.wpantund", "default");
    objc_super v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1001C7730(v6, v10, v11, v12, v13, v14, v15, v16);
    }
    goto LABEL_9;
  }

  [v4 setUniqueIdentifier:v3];
  objc_super v6 = (os_log_s *)objc_alloc_init(&OBJC_CLASS___FLFollowUpNotification);
  if (!v6)
  {
    v17 = sub_1000160F4("com.apple.wpantund", "default");
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1001C77A0(v18, v19, v20, v21, v22, v23, v24, v25);
    }

LABEL_9:
    id v8 = 0LL;
    goto LABEL_10;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  [v7 addObject:FLNotificationOptionNotificationCenter];
  -[os_log_s setOptions:](v6, "setOptions:", v7);
  [v5 setNotification:v6];
  id v8 = v5;

LABEL_10:
  return v8;
}

- (void)ctrUtilClearFollowUpItem:(id)a3
{
  id v4 = a3;
  ctrFollowUpController = self->_ctrFollowUpController;
  id v16 = v4;
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
  unsigned int v7 = -[FLFollowUpController clearPendingFollowUpItemsWithUniqueIdentifiers:error:]( ctrFollowUpController,  "clearPendingFollowUpItemsWithUniqueIdentifiers:error:",  v6,  0LL);

  id v8 = sub_1000160F4("com.apple.wpantund", "default");
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315650;
    uint64_t v11 = "-[CTRFollowUpController ctrUtilClearFollowUpItem:]";
    __int16 v12 = 2112;
    id v13 = v4;
    __int16 v14 = 1024;
    unsigned int v15 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s: Cleared followup item, Unique Identifier : %@, ret : %d",  (uint8_t *)&v10,  0x1Cu);
  }
}

- (BOOL)ctrUtilPostFollowUpItem:(id)a3
{
  id v4 = a3;
  if (!self->_ctrFollowUpController)
  {
    v9 = sub_1000160F4("com.apple.wpantund", "default");
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v12 = 136315394;
      id v13 = "-[CTRFollowUpController ctrUtilPostFollowUpItem:]";
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s: Unique Identifier : %@, Followup controller instance is nil, returning false",  (uint8_t *)&v12,  0x16u);
    }

    goto LABEL_10;
  }

  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CTRFollowUpController createFolloUpItem:](self, "createFolloUpItem:", v4));
  if (!v5)
  {
    int v10 = sub_1000160F4("com.apple.wpantund", "default");
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1001C7810((uint64_t)v4, v5);
    }
LABEL_10:
    LOBYTE(v6) = 0;
    goto LABEL_11;
  }

  unsigned int v6 = -[FLFollowUpController postFollowUpItem:error:]( self->_ctrFollowUpController,  "postFollowUpItem:error:",  v5,  0LL);
  unsigned int v7 = sub_1000160F4("com.apple.wpantund", "default");
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315650;
    id v13 = "-[CTRFollowUpController ctrUtilPostFollowUpItem:]";
    __int16 v14 = 2112;
    id v15 = v4;
    __int16 v16 = 1024;
    unsigned int v17 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s: Unique Identifier : %@, Followup item post return val is : %d",  (uint8_t *)&v12,  0x1Cu);
  }

LABEL_11:
  return v6;
}

- (FLFollowUpController)ctrFollowUpController
{
  return self->_ctrFollowUpController;
}

- (void)setCtrFollowUpController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end