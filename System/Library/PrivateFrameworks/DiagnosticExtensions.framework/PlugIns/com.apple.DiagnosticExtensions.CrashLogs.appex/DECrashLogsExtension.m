@interface DECrashLogsExtension
- (DECrashLogsExtension)init;
- (id)_attachmentsWithDisplayName:(id)a3;
- (id)_submittableLogsWithPattern:(id)a3 excludingPattern:(id)a4 excludingPathComponents:(id)a5;
- (id)attachmentList;
- (id)attachmentsForParameters:(id)a3;
- (id)shortname:(id)a3;
- (int64_t)cutOffSeconds;
- (void)setCutOffSeconds:(int64_t)a3;
@end

@implementation DECrashLogsExtension

- (DECrashLogsExtension)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___DECrashLogsExtension;
  v2 = -[DECrashLogsExtension init](&v10, "init");
  if (v2)
  {
    if (MGGetBoolAnswer(@"apple-internal-install"))
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
      v4 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"RCInternalMode"]);
      if ([v4 integerValue])
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
        v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForKey:@"RCInternalMode"]);
        id v7 = [v6 integerValue];

        if (v7 != (id)2) {
          goto LABEL_5;
        }
      }

      else
      {
      }

      uint64_t v8 = -259200LL;
      goto LABEL_8;
    }

- (id)attachmentList
{
  return -[DECrashLogsExtension _attachmentsWithDisplayName:](self, "_attachmentsWithDisplayName:", 0LL);
}

- (id)attachmentsForParameters:(id)a3
{
  id v5 = a3;
  v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"DEExtensionAttachmentsParamDisplayNameKey"]);

  if (v7)
  {
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"DEExtensionAttachmentsParamDisplayNameKey"]);
    id v9 = [v8 countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v44;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v44 != v11) {
            objc_enumerationMutation(v8);
          }
          v3 = (void *)objc_claimAutoreleasedReturnValue( -[DECrashLogsExtension _attachmentsWithDisplayName:]( self,  "_attachmentsWithDisplayName:",  *(void *)(*((void *)&v43 + 1) + 8LL * (void)i)));
          if (v3) {
            -[NSMutableArray addObjectsFromArray:](v6, "addObjectsFromArray:", v3);
          }
        }

        id v10 = [v8 countByEnumeratingWithState:&v43 objects:v48 count:16];
      }

      while (v10);
    }
  }

  v36 = v5;
  if (!-[NSMutableArray count](v6, "count"))
  {
    if (!MGGetBoolAnswer(@"apple-internal-install"))
    {
LABEL_20:
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[DECrashLogsExtension _attachmentsWithDisplayName:](self, "_attachmentsWithDisplayName:", 0LL));
      -[NSMutableArray addObjectsFromArray:](v6, "addObjectsFromArray:", v19);

      goto LABEL_21;
    }

    v13 = v6;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 valueForKey:@"RCInternalMode"]);
    id v16 = [v15 integerValue];
    if (v16)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
      id v5 = (id)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"RCInternalMode"]);
      if ([v5 integerValue] != (id)2)
      {

        v6 = v13;
        goto LABEL_20;
      }
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue([v36 objectForKeyedSubscript:@"DEExtensionHostAppKey"]);
    unsigned __int8 v18 = [@"Feedback Assistant" isEqualToString:v17];

    if (v16)
    {
    }

    v6 = v13;
    if ((v18 & 1) != 0) {
      goto LABEL_20;
    }
  }

- (id)_attachmentsWithDisplayName:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @".*\\.%@.*",  @"ips"));
  if (v4)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.*\\.%@.*",  v4,  @"ips"));

    id v7 = @"(JetsamEvent|Sandbox|^stacks|log-aggregated).*";
    id v5 = (void *)v6;
  }

  else
  {
    id v7 = @"(AutoBugCapture|CMActivityLog|CoreTime|DuetKnowledgeCollector|ExcResource|FlashStatus|JetsamEvent|KeyboardAccuracy|log-aggregated|memory-snapshot|OTAUpdate|Sandbox|^stacks|SymptomJournal|SystemMemoryReset|Ultra_1).*";
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  v5,  1LL,  0LL));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  v7,  1LL,  0LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  @"JetsamEvent.*\\.ips.*",  1LL,  0LL));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[DECrashLogsExtension _submittableLogsWithPattern:excludingPattern:excludingPathComponents:]( self,  "_submittableLogsWithPattern:excludingPattern:excludingPathComponents:",  v8,  v9,  &off_1000043A8));
  v12 = (void *)objc_claimAutoreleasedReturnValue( -[DECrashLogsExtension _submittableLogsWithPattern:excludingPattern:excludingPathComponents:]( self,  "_submittableLogsWithPattern:excludingPattern:excludingPathComponents:",  v10,  0LL,  &off_1000043A8));
  id v13 = [v11 mutableCopy];
  [v13 addObjectsFromArray:v12];
  if (v4)
  {
    uint64_t v24 = v12;
    v25 = v10;
    v26 = v9;
    v27 = v8;
    v28 = v5;
    id v29 = v4;
    v14 = -[NSDate initWithTimeIntervalSinceNow:]( objc_alloc(&OBJC_CLASS___NSDate),  "initWithTimeIntervalSinceNow:",  (double)-[DECrashLogsExtension cutOffSeconds](self, "cutOffSeconds"));
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    id v15 = v11;
    id v16 = [v15 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v31;
      do
      {
        for (i = 0LL; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v31 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
          id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 modificationDate]);
          id v22 = [v21 compare:v14];

          if (v22 == (id)-1LL) {
            [v13 removeObject:v20];
          }
        }

        id v17 = [v15 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }

      while (v17);
    }

    id v5 = v28;
    id v4 = v29;
    id v9 = v26;
    uint64_t v8 = v27;
    v12 = v24;
    id v10 = v25;
  }

  return v13;
}

- (id)_submittableLogsWithPattern:(id)a3 excludingPattern:(id)a4 excludingPathComponents:(id)a5
{
  id v7 = a3;
  id v37 = a4;
  id v8 = a5;
  uint64_t v9 = OSASubmittableLogs();
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  if ([v10 count])
  {
    id v11 = v7;
    if (!v11) {
      id v11 = (id)objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  @"*",  1LL,  0LL));
    }
    id v32 = v8;
    id v33 = v7;
    if (v8 && [v8 count]) {
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v8));
    }
    else {
      v36 = 0LL;
    }
    uint64_t v34 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v31 = v10;
    id obj = v10;
    id v12 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v42;
      do
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v42 != v14) {
            objc_enumerationMutation(obj);
          }
          id v16 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)i);
          id v40 = 0LL;
          objc_msgSend(v16, "getResourceValue:forKey:error:", &v40, NSURLNameKey, 0, v31);
          id v17 = v40;
          id v18 = [v17 length];
          if (v18) {
            BOOL v19 = v11 == 0LL;
          }
          else {
            BOOL v19 = 1;
          }
          if (v19
            || (v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstMatchInString:options:range:", v17, 8, 0, v18)),
                v20,
                v20))
          {
            if (!v37
              || !v18
              || (id v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "firstMatchInString:options:range:", v17, 8, 0, v18)),
                  v21,
                  !v21))
            {
              if (!v36
                || (id v22 = objc_alloc(&OBJC_CLASS___NSSet),
                    id v23 = (void *)objc_claimAutoreleasedReturnValue([v16 pathComponents]),
                    uint64_t v24 = -[NSSet initWithArray:](v22, "initWithArray:", v23),
                    unsigned __int8 v25 = -[NSSet intersectsSet:](v24, "intersectsSet:", v36),
                    v24,
                    v23,
                    (v25 & 1) == 0))
              {
                id v39 = 0LL;
                [v16 getResourceValue:&v39 forKey:NSURLFileSizeKey error:0];
                id v38 = 0LL;
                id v26 = v39;
                [v16 getResourceValue:&v38 forKey:NSURLContentModificationDateKey error:0];
                id v27 = v38;
                v28 = (void *)objc_claimAutoreleasedReturnValue([v16 lastPathComponent]);
                id v29 = (void *)objc_claimAutoreleasedReturnValue( +[DEAttachmentItem attachmentWithPath:withDisplayName:modificationDate:andFilesize:]( &OBJC_CLASS___DEAttachmentItem,  "attachmentWithPath:withDisplayName:modificationDate:andFilesize:",  v16,  v28,  v27,  v26));

                -[NSMutableArray addObject:](v34, "addObject:", v29);
              }
            }
          }
        }

        id v13 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
      }

      while (v13);
    }

    id v8 = v32;
    id v7 = v33;
    id v10 = v31;
  }

  else
  {
    uint64_t v34 = (NSMutableArray *)&__NSArray0__struct;
  }

  return v34;
}

- (id)shortname:(id)a3
{
  id v3 = a3;
  id v4 = (void *)qword_100008278;
  if (!qword_100008278)
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  @"([^_-]*)",  1LL,  0LL));
    uint64_t v6 = (void *)qword_100008278;
    qword_100008278 = v5;

    id v4 = (void *)qword_100008278;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstMatchInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length")));
  id v8 = v7;
  if (v7)
  {
    id v9 = [v7 range];
    id v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringWithRange:", v9, v10));
  }

  else
  {
    id v11 = v3;
  }

  id v12 = v11;

  return v12;
}

- (int64_t)cutOffSeconds
{
  return self->_cutOffSeconds;
}

- (void)setCutOffSeconds:(int64_t)a3
{
  self->_cutOffSeconds = a3;
}

@end