@interface ASLocalization
+ (id)sharedLocalization;
- (ASLocalization)init;
- (id)_languageCode;
- (id)localizedStringForKey:(id)a3 table:(id)a4 bundle:(id)a5;
- (void)_clearTableCache;
- (void)_languageCodeChanged;
- (void)dealloc;
@end

@implementation ASLocalization

- (ASLocalization)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___ASLocalization;
  v2 = -[ASLocalization init](&v7, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create(0LL, 0LL);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver( DarwinNotifyCenter,  v2,  (CFNotificationCallback)sub_1000063FC,  AFLanguageCodeDidChangeDarwinNotification,  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
  }

  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___ASLocalization;
  -[ASLocalization dealloc](&v4, "dealloc");
}

- (id)_languageCode
{
  languageCode = self->_languageCode;
  if (!languageCode)
  {
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 languageCode]);
    v6 = (NSString *)[v5 copy];
    objc_super v7 = self->_languageCode;
    self->_languageCode = v6;

    v8 = (os_log_s *)AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_INFO))
    {
      v9 = self->_languageCode;
      int v11 = 136315394;
      v12 = "-[ASLocalization _languageCode]";
      __int16 v13 = 2112;
      v14 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s Using new language code %@",  (uint8_t *)&v11,  0x16u);
    }

    languageCode = self->_languageCode;
  }

  return languageCode;
}

- (void)_languageCodeChanged
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000063F4;
  block[3] = &unk_1000146A8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_clearTableCache
{
  languageCode = self->_languageCode;
  self->_languageCode = 0LL;

  stringTables = self->_stringTables;
  self->_stringTables = 0LL;
}

- (id)localizedStringForKey:(id)a3 table:(id)a4 bundle:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    uint64_t v20 = 0LL;
    v21 = &v20;
    uint64_t v22 = 0x3032000000LL;
    v23 = sub_100006198;
    v24 = sub_1000061A8;
    id v25 = 0LL;
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000061B0;
    block[3] = &unk_100014428;
    id v15 = v9;
    v16 = self;
    id v17 = v10;
    v19 = &v20;
    id v18 = v8;
    dispatch_sync(queue, block);
    id v12 = (id)v21[5];

    _Block_object_dispose(&v20, 8);
  }

  else
  {
    id v12 = 0LL;
  }

  return v12;
}

- (void).cxx_destruct
{
}

+ (id)sharedLocalization
{
  if (qword_10001AA30 != -1) {
    dispatch_once(&qword_10001AA30, &stru_100014400);
  }
  return (id)qword_10001AA28;
}

@end