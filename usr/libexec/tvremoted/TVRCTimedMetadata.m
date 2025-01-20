@interface TVRCTimedMetadata
+ (id)tvrd_filenameForIdentifier:(id)a3;
+ (id)tvrd_restoredTimedMetadataForIdentifier:(id)a3;
- (void)tvrd_removeForRestoration;
- (void)tvrd_saveForRestoration;
@end

@implementation TVRCTimedMetadata

- (void)tvrd_saveForRestoration
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVRCTimedMetadata rawData](self, "rawData"));
  id v4 = [v3 length];

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVRCTimedMetadata identifier](self, "identifier"));
    id v6 = [v5 length];

    if (v6)
    {
      v7 = (void *)objc_opt_class(self);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVRCTimedMetadata identifier](self, "identifier"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tvrd_filenameForIdentifier:", v8));

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      unsigned __int8 v11 = [v10 fileExistsAtPath:v9];

      if ((v11 & 1) == 0)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVRCTimedMetadata rawData](self, "rawData"));
        id v18 = 0LL;
        [v12 writeToFile:v9 options:1 error:&v18];
        id v13 = v18;

        id v14 = _TVRDXPCLog();
        v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        v16 = v15;
        if (v13)
        {
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            -[TVRCTimedMetadata(TVRDAdditions) tvrd_saveForRestoration].cold.1();
          }
        }

        else if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVRCTimedMetadata identifier](self, "identifier"));
          *(_DWORD *)buf = 138412546;
          v20 = @"TMDATA-REST";
          __int16 v21 = 2112;
          v22 = v17;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "%@: wrote archived timed metadata for programID %@",  buf,  0x16u);
        }
      }
    }
  }

- (void)tvrd_removeForRestoration
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVRCTimedMetadata identifier](self, "identifier"));
  id v4 = [v3 length];

  if (v4)
  {
    v5 = (void *)objc_opt_class(self);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVRCTimedMetadata identifier](self, "identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tvrd_filenameForIdentifier:", v6));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    unsigned int v9 = [v8 fileExistsAtPath:v7];

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      id v16 = 0LL;
      [v10 removeItemAtPath:v7 error:&v16];
      id v11 = v16;

      id v12 = _TVRDXPCLog();
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      id v14 = v13;
      if (v11)
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          -[TVRCTimedMetadata(TVRDAdditions) tvrd_removeForRestoration].cold.1();
        }
      }

      else if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVRCTimedMetadata identifier](self, "identifier"));
        *(_DWORD *)buf = 138412546;
        id v18 = @"TMDATA-REST";
        __int16 v19 = 2112;
        v20 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%@: removed archived timed metadata for programID %@",  buf,  0x16u);
      }
    }
  }

+ (id)tvrd_restoredTimedMetadataForIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tvrd_filenameForIdentifier:", v4));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    unsigned int v7 = [v6 fileExistsAtPath:v5];

    if (!v7)
    {
      v10 = 0LL;
LABEL_15:

      goto LABEL_16;
    }

    id v15 = 0LL;
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfFile:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfFile:options:error:",  v5,  2LL,  &v15));
    id v9 = v15;
    if ([v8 length])
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue( +[TVRCTimedMetadata timedMetadataWithIdentifier:rawData:]( &OBJC_CLASS___TVRCTimedMetadata,  "timedMetadataWithIdentifier:rawData:",  v4,  v8));
      if (!v10)
      {
LABEL_14:

        goto LABEL_15;
      }

      id v11 = _TVRDXPCLog();
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v17 = @"TMDATA-REST";
        __int16 v18 = 2112;
        id v19 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%@: Restored archived timed metadata for programID %@",  buf,  0x16u);
      }
    }

    else
    {
      if (!v9)
      {
        v10 = 0LL;
        goto LABEL_14;
      }

      id v13 = _TVRDXPCLog();
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        +[TVRCTimedMetadata(TVRDAdditions) tvrd_restoredTimedMetadataForIdentifier:].cold.1();
      }
      v10 = 0LL;
    }

    goto LABEL_14;
  }

  v10 = 0LL;
LABEL_16:

  return v10;
}

+ (id)tvrd_filenameForIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 temporaryDirectory]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 path]);

  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.timedmetadata",  v3));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:v7]);

  return v8;
}

@end