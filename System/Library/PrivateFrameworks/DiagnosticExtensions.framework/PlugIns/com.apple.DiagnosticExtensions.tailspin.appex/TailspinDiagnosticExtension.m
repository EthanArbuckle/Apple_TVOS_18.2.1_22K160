@interface TailspinDiagnosticExtension
- (id)attachmentList;
- (id)attachmentsForParameters:(id)a3;
@end

@implementation TailspinDiagnosticExtension

- (id)attachmentList
{
  return &__NSArray0__struct;
}

- (id)attachmentsForParameters:(id)a3
{
  id v3 = a3;
  uint64_t v4 = tailspin_config_create_with_current_state();
  if (v4)
  {
    uint64_t v5 = v4;
    int v6 = tailspin_enabled_get();
    tailspin_config_free(v5);
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:UnsafePointer]);
      v8 = v7;
      if (v7) {
        unsigned int v9 = [v7 BOOLValue];
      }
      else {
        unsigned int v9 = 0;
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:UnsafePointer]);
      v12 = v11;
      if (v11)
      {
        id v13 = v11;
        if (v9)
        {
LABEL_9:
          id v14 = v13;
          if (access((const char *)[v14 UTF8String], 0))
          {
            v15 = &__NSArray0__struct;
          }

          else
          {
            v26 = (void *)objc_claimAutoreleasedReturnValue( +[DEAttachmentItem attachmentWithPath:]( &OBJC_CLASS___DEAttachmentItem,  "attachmentWithPath:",  v14));
            [v26 setDeleteOnAttach:&__kCFBooleanTrue];
            v29 = v26;
            v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v29,  1LL));
          }

          NSLog(@"Returned existing tailspin file '%@'", v14);
          id v10 = v15;
LABEL_20:

          goto LABEL_21;
        }
      }

      else
      {
        v16 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
        -[NSDateFormatter setDateStyle:](v16, "setDateStyle:", 1LL);
        -[NSDateFormatter setDateFormat:](v16, "setDateFormat:", @"yyyy-MM-dd-HHmmss");
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v16, "stringFromDate:", v17));
        v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"tailspin-trace_%@.tailspin",  v18));

        id v13 = (id)objc_claimAutoreleasedReturnValue( [@"/var/mobile/Library/Logs/CrashReporter" stringByAppendingPathComponent:v19]);
        if (v9) {
          goto LABEL_9;
        }
      }

      mode_t v20 = umask(0);
      id v21 = v13;
      uint64_t v22 = open((const char *)[v21 UTF8String], 2562, 432);
      umask(v20);
      if ((_DWORD)v22 == -1)
      {
        id v10 = &__NSArray0__struct;
      }

      else
      {
        id v23 = v3;
        NSLog(@"Saving tailspin file with options = %@", v23);
        if (tailspin_dump_output_with_options_sync(v22, v23))
        {
          NSLog(@"Saved tailspin output to file '%@'", v21);
          v24 = (void *)objc_claimAutoreleasedReturnValue( +[DEAttachmentItem attachmentWithPath:]( &OBJC_CLASS___DEAttachmentItem,  "attachmentWithPath:",  v21));
          [v24 setDeleteOnAttach:&__kCFBooleanTrue];
          v28 = v24;
          v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v28,  1LL));
        }

        else
        {
          NSLog(@"Unable to save tailspin data to file '%@'", v21);
          v25 = &__NSArray0__struct;
        }

        close(v22);
        id v10 = v25;
      }

      goto LABEL_20;
    }
  }

  id v10 = &__NSArray0__struct;
LABEL_21:

  return v10;
}

@end