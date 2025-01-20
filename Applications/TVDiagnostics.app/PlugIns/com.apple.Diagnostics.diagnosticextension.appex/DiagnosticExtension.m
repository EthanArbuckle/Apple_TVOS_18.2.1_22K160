@interface DiagnosticExtension
- (id)attachmentsForParameters:(id)a3;
@end

@implementation DiagnosticExtension

- (id)attachmentsForParameters:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DSMutableArchive archive](&OBJC_CLASS___DSMutableArchive, "archive"));
  id v21 = v5;
  +[LogArchiveAggregator addLogTypes:archive:prefix:]( &OBJC_CLASS___LogArchiveAggregator,  "addLogTypes:archive:prefix:",  46LL,  &v21,  @"FieldDiagnosticsLogs");
  id v6 = v21;

  if (v3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"shouldCreateTarBall"]);
    if (v7 && (uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v7, v8) & 1) != 0))
    {
      unsigned __int8 v9 = [v7 BOOLValue];

      if ((v9 & 1) == 0)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue([@"FieldDiagnosticsLogs" stringByAppendingString:@".XXXXXX"]);
        id v19 = 0LL;
        v11 = (void *)objc_claimAutoreleasedReturnValue([v6 archiveAsTempDirectoryWithName:v10 error:&v19]);
        id v12 = v19;

        v13 = (void *)objc_claimAutoreleasedReturnValue([v11 URLByAppendingPathComponent:@"FieldDiagnosticsLogs"]);
        v14 = (void *)objc_claimAutoreleasedReturnValue( +[DEAttachmentItem attachmentWithPathURL:]( &OBJC_CLASS___DEAttachmentItem,  "attachmentWithPathURL:",  v13));

        goto LABEL_8;
      }
    }

    else
    {
    }
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue([@"FieldDiagnosticsLogs" stringByAppendingString:@".XXXXXX"]);
  id v20 = 0LL;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v6 archiveAsTempFileWithTemplate:v15 suffix:@".tgz" error:&v20]);
  id v12 = v20;

  v14 = (void *)objc_claimAutoreleasedReturnValue( +[DEAttachmentItem attachmentWithPathURL:]( &OBJC_CLASS___DEAttachmentItem,  "attachmentWithPathURL:",  v11));
LABEL_8:
  -[NSMutableArray addObject:](v4, "addObject:", v14);

  if (v12)
  {
    uint64_t v16 = DiagnosticLogHandleForCategory(0LL);
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100003348((uint64_t)v12, v17);
    }
  }

  return v4;
}

@end