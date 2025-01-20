@interface MobileTimerAssistantSyncAlarm
- (MTAlarmManager)alarmManager;
- (MobileTimerAssistantSyncAlarm)init;
- (NSMutableArray)domainObjects;
- (NSMutableArray)postAnchors;
- (NSString)finalAnchor;
- (id)calculateFinalAnchorForAlarms:(id)a3;
- (void)_beginSyncWithAnchor:(id)a3 validity:(id)a4 forKey:(id)a5 beginInfo:(id)a6;
- (void)_getChangeAfterAnchor:(id)a3 changeInfo:(id)a4;
- (void)beginSyncWithAnchor:(id)a3 validity:(id)a4 forKey:(id)a5 beginInfo:(id)a6;
- (void)dealloc;
- (void)getChangeAfterAnchor:(id)a3 changeInfo:(id)a4;
- (void)populateAnchorsFromAlarms:(id)a3 validity:(id)a4 beginInfo:(id)a5;
- (void)setAlarmManager:(id)a3;
- (void)setDomainObjects:(id)a3;
- (void)setFinalAnchor:(id)a3;
- (void)setPostAnchors:(id)a3;
- (void)syncDidEnd;
@end

@implementation MobileTimerAssistantSyncAlarm

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MobileTimerAssistantSyncAlarm;
  -[MobileTimerAssistantSyncAlarm dealloc](&v3, "dealloc");
}

- (MobileTimerAssistantSyncAlarm)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MobileTimerAssistantSyncAlarm;
  v2 = -[MobileTimerAssistantSyncAlarm init](&v6, "init");
  if (v2)
  {
    objc_super v3 = objc_opt_new(&OBJC_CLASS___MTAlarmManager);
    alarmManager = v2->_alarmManager;
    v2->_alarmManager = v3;
  }

  return v2;
}

- (void)beginSyncWithAnchor:(id)a3 validity:(id)a4 forKey:(id)a5 beginInfo:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = MTLogForCategory(3LL);
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    sub_11810(v15, v16, v17, v18, v19, v20, v21, v22);
  }

  -[MobileTimerAssistantSyncAlarm _beginSyncWithAnchor:validity:forKey:beginInfo:]( self,  "_beginSyncWithAnchor:validity:forKey:beginInfo:",  v13,  v12,  v11,  v10);
  uint64_t v23 = MTLogForCategory(3LL);
  v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
    sub_117A0(v24, v25, v26, v27, v28, v29, v30, v31);
  }
}

- (void)getChangeAfterAnchor:(id)a3 changeInfo:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = MTLogForCategory(3LL);
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_118F0(v9, v10, v11, v12, v13, v14, v15, v16);
  }

  -[MobileTimerAssistantSyncAlarm _getChangeAfterAnchor:changeInfo:](self, "_getChangeAfterAnchor:changeInfo:", v7, v6);
  uint64_t v17 = MTLogForCategory(3LL);
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    sub_11880(v18, v19, v20, v21, v22, v23, v24, v25);
  }
}

- (void)syncDidEnd
{
  finalAnchor = self->_finalAnchor;
  self->_finalAnchor = 0LL;

  postAnchors = self->_postAnchors;
  self->_postAnchors = 0LL;

  domainObjects = self->_domainObjects;
  self->_domainObjects = 0LL;
}

- (void)_beginSyncWithAnchor:(id)a3 validity:(id)a4 forKey:(id)a5 beginInfo:(id)a6
{
  id v22 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  -[MobileTimerAssistantSyncAlarm syncDidEnd](self, "syncDidEnd");
  uint64_t v13 = objc_opt_new(&OBJC_CLASS___MTAlarmManager);
  uint64_t v14 = MTLogForCategory(3LL);
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[MobileTimerAssistantSyncAlarm _beginSyncWithAnchor:validity:forKey:beginInfo:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = self;
    _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "%s %{public}@ fetching alarms", buf, 0x16u);
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTAlarmManager alarms](v13, "alarms"));
  objc_initWeak(&location, self);
  dispatch_semaphore_t v17 = dispatch_semaphore_create(0LL);
  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  v32 = sub_D050;
  v33 = sub_D060;
  id v34 = 0LL;
  v26[0] = _NSConcreteStackBlock;
  v26[2] = sub_D068;
  v26[3] = &unk_186A0;
  v26[1] = 3221225472LL;
  objc_copyWeak(&v29, &location);
  uint64_t v28 = buf;
  uint64_t v18 = v17;
  uint64_t v27 = v18;
  id v19 = [v16 addSuccessBlock:v26];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_D160;
  v23[3] = &unk_188E8;
  objc_copyWeak(&v25, &location);
  uint64_t v20 = v18;
  uint64_t v24 = v20;
  id v21 = [v16 addFailureBlock:v23];
  dispatch_semaphore_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
  -[MobileTimerAssistantSyncAlarm populateAnchorsFromAlarms:validity:beginInfo:]( self,  "populateAnchorsFromAlarms:validity:beginInfo:",  *(void *)(*(void *)&buf[8] + 40LL),  v10,  v12);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&v29);
  _Block_object_dispose(buf, 8);

  objc_destroyWeak(&location);
}

- (void)_getChangeAfterAnchor:(id)a3 changeInfo:(id)a4
{
  id v24 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MobileTimerAssistantSyncAlarm postAnchors](self, "postAnchors"));
  id v8 = [v7 count];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MobileTimerAssistantSyncAlarm domainObjects](self, "domainObjects"));
  id v10 = [v9 count];

  if (v8 != v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MobileTimerAssistantSyncAlarm postAnchors](self, "postAnchors"));
    id v12 = [v11 count];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MobileTimerAssistantSyncAlarm domainObjects](self, "domainObjects"));
    NSLog( @"Unexpected array length mismatch! postAnchors.count: %lu, domainObjects.count: %lu",  v12,  [v13 count]);
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MobileTimerAssistantSyncAlarm domainObjects](self, "domainObjects"));
  if ([v14 count])
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[MobileTimerAssistantSyncAlarm finalAnchor](self, "finalAnchor"));
    unsigned __int8 v16 = [v15 isEqualToString:v24];

    if ((v16 & 1) == 0)
    {
      if (!v24)
      {
        uint64_t v19 = 0LL;
        goto LABEL_11;
      }

      dispatch_semaphore_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[MobileTimerAssistantSyncAlarm postAnchors](self, "postAnchors"));
      uint64_t v18 = (uint64_t)[v17 indexOfObject:v24];

      if (v18 < 0x7FFFFFFFFFFFFFFELL)
      {
        uint64_t v19 = v18 + 1;
LABEL_11:
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[MobileTimerAssistantSyncAlarm domainObjects](self, "domainObjects"));
        id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 objectAtIndex:v19]);
        [v6 setObject:v21];

        id v22 = (void *)objc_claimAutoreleasedReturnValue(-[MobileTimerAssistantSyncAlarm postAnchors](self, "postAnchors"));
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectAtIndex:v19]);
        [v6 setPostAnchor:v23];

        goto LABEL_12;
      }
    }
  }

  else
  {
  }

  [v6 setObject:0];
  [v6 setPostAnchor:v24];
LABEL_12:
}

- (id)calculateFinalAnchorForAlarms:(id)a3
{
  id v3 = a3;
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472LL;
  id v10 = sub_D474;
  id v11 = &unk_18910;
  id v12 = objc_opt_new(&OBJC_CLASS___NSMutableString);
  v4 = v12;
  objc_msgSend(v3, "na_each:", &v8);

  id v5 = -[NSMutableString hash](v4, "hash");
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%lu",  v5,  v8,  v9,  v10,  v11));

  return v6;
}

- (void)populateAnchorsFromAlarms:(id)a3 validity:(id)a4 beginInfo:(id)a5
{
  id v28 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[MobileTimerAssistantSyncAlarm calculateFinalAnchorForAlarms:]( self,  "calculateFinalAnchorForAlarms:",  v28));
  -[MobileTimerAssistantSyncAlarm setFinalAnchor:](self, "setFinalAnchor:", v10);

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MobileTimerAssistantSyncAlarm finalAnchor](self, "finalAnchor"));
  unsigned __int8 v12 = [v11 isEqualToString:v8];

  if ((v12 & 1) == 0)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MobileTimerAssistantSyncAlarm finalAnchor](self, "finalAnchor"));
    [v9 resetWithValidity:v13];

    id v14 = [v28 count];
    if (v14)
    {
      unint64_t v15 = (unint64_t)v14;
      unsigned __int8 v16 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", v14);
      -[MobileTimerAssistantSyncAlarm setPostAnchors:](self, "setPostAnchors:", v16);

      dispatch_semaphore_t v17 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", v15);
      -[MobileTimerAssistantSyncAlarm setDomainObjects:](self, "setDomainObjects:", v17);

      for (uint64_t i = 0LL; i != v15; ++i)
      {
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v28 objectAtIndexedSubscript:i]);
        id v20 = objc_alloc_init(&OBJC_CLASS___SAAlarmObject);
        id v21 = (void *)objc_claimAutoreleasedReturnValue([v19 alarmURL]);
        [v20 setIdentifier:v21];

        id v22 = (void *)objc_claimAutoreleasedReturnValue(-[MobileTimerAssistantSyncAlarm domainObjects](self, "domainObjects"));
        [v22 addObject:v20];
      }

      if (v15 >= 2)
      {
        for (uint64_t j = 1LL; j != v15; ++j)
        {
          id v24 = (void *)objc_claimAutoreleasedReturnValue(-[MobileTimerAssistantSyncAlarm postAnchors](self, "postAnchors"));
          id v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%ld", j));
          [v24 addObject:v25];
        }
      }

      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[MobileTimerAssistantSyncAlarm postAnchors](self, "postAnchors"));
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[MobileTimerAssistantSyncAlarm finalAnchor](self, "finalAnchor"));
      [v26 addObject:v27];
    }
  }
}

- (MTAlarmManager)alarmManager
{
  return self->_alarmManager;
}

- (void)setAlarmManager:(id)a3
{
}

- (NSString)finalAnchor
{
  return self->_finalAnchor;
}

- (void)setFinalAnchor:(id)a3
{
}

- (NSMutableArray)postAnchors
{
  return self->_postAnchors;
}

- (void)setPostAnchors:(id)a3
{
}

- (NSMutableArray)domainObjects
{
  return self->_domainObjects;
}

- (void)setDomainObjects:(id)a3
{
}

- (void).cxx_destruct
{
}

@end