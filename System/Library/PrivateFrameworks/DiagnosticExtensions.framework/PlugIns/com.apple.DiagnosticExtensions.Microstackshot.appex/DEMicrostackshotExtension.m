@interface DEMicrostackshotExtension
- (id)attachmentList;
- (id)attachmentsForParameters:(id)a3;
@end

@implementation DEMicrostackshotExtension

- (id)attachmentList
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 0.0));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, @"endDate");

  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  -86400.0));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, @"startDate");

  uint64_t v6 = PLQueryRegistered(52LL, @"LogFiles", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"microstackshots"]);
  NSLog(@"[DEMicrostackshotExtension] attachmentList: %@\n", v8);
  id v9 = PowerMSSLog();
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "attachmentList: %@", buf, 0xCu);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[DEAttachmentItem attachmentWithPath:](&OBJC_CLASS___DEAttachmentItem, "attachmentWithPath:", v8));
  -[NSMutableArray addObject:](v2, "addObject:", v11);

  return v2;
}

- (id)attachmentsForParameters:(id)a3
{
  id v3 = a3;
  id v4 = PowerMSSLog();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v38 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "parameters: %@", buf, 0xCu);
  }

  uint64_t v6 = objc_claimAutoreleasedReturnValue([v3 objectForKey:@"from"]);
  if (v6) {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"from"]);
  }
  uint64_t v7 = objc_claimAutoreleasedReturnValue([v3 objectForKey:@"to"]);

  if (v7) {
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"to"]);
  }
  if (v6 && !v7)
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeInterval:sinceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeInterval:sinceDate:",  v6,  86400.0));
LABEL_15:
    uint64_t v7 = v8;
    goto LABEL_16;
  }

  if (!v6 && v7)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeInterval:sinceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeInterval:sinceDate:",  v7,  -86400.0));
    goto LABEL_16;
  }

  if (!(v6 | v7))
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", -86400.0));
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 0.0));
    goto LABEL_15;
  }

@end