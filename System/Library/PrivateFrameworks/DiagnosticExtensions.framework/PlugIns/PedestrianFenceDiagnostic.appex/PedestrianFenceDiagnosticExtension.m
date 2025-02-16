@interface PedestrianFenceDiagnosticExtension
- (id)attachmentList;
- (id)attachmentsForParameters:(id)a3;
@end

@implementation PedestrianFenceDiagnosticExtension

- (id)attachmentList
{
  return &__NSArray0__struct;
}

- (id)attachmentsForParameters:(id)a3
{
  os_log_t v3 = os_log_create("com.apple.locationd", "DiagnosticExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL URLWithString:]( &OBJC_CLASS___NSURL,  "URLWithString:",  @"/var/mobile/Library/Logs/locationd/MslLogger/"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  NSURLResourceKey v43 = NSURLContentModificationDateKey;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v43, 1LL));
  id v39 = 0LL;
  v7 = (void *)objc_claimAutoreleasedReturnValue( [v5 contentsOfDirectoryAtURL:v4 includingPropertiesForKeys:v6 options:0 error:&v39]);
  id v8 = v39;

  if (v8)
  {
    v9 = v3;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000039BC(v8, v9);
    }
    id v31 = &__NSArray0__struct;
  }

  else
  {
    v28 = v7;
    v29 = v5;
    v30 = v4;
    v10 = (void *)objc_claimAutoreleasedReturnValue([v7 sortedArrayUsingComparator:&stru_100004110]);
    id v31 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    v9 = v10;
    id v11 = -[os_log_s countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v35,  v42,  16LL);
    if (v11)
    {
      id v12 = v11;
      unint64_t v13 = 0LL;
      uint64_t v14 = *(void *)v36;
      NSURLResourceKey v15 = NSURLFileSizeKey;
LABEL_7:
      uint64_t v16 = 0LL;
      while (1)
      {
        if (*(void *)v36 != v14) {
          objc_enumerationMutation(v9);
        }
        if (v13 > 0xC800000) {
          break;
        }
        v17 = *(void **)(*((void *)&v35 + 1) + 8 * v16);
        id v33 = 0LL;
        id v34 = 0LL;
        [v17 getResourceValue:&v34 forKey:v15 error:&v33];
        id v18 = v34;
        id v19 = v33;
        if (v19 || !v18)
        {
          v25 = v3;
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
            sub_100003948(v40, v19, &v41, v25);
          }
        }

        else
        {
          v32 = (char *)[v18 unsignedLongLongValue] + v13;
          id v20 = v12;
          uint64_t v21 = v14;
          v22 = v15;
          v23 = v9;
          v24 = v3;
          v25 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 path]);
          v26 = (void *)objc_claimAutoreleasedReturnValue( +[DEAttachmentItem attachmentWithPath:]( &OBJC_CLASS___DEAttachmentItem,  "attachmentWithPath:",  v25));
          [v31 addObject:v26];

          os_log_t v3 = v24;
          v9 = v23;
          NSURLResourceKey v15 = v22;
          uint64_t v14 = v21;
          id v12 = v20;
          unint64_t v13 = (unint64_t)v32;
        }

        if (v12 == (id)++v16)
        {
          id v12 = -[os_log_s countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v35,  v42,  16LL);
          if (v12) {
            goto LABEL_7;
          }
          break;
        }
      }
    }

    v5 = v29;
    v4 = v30;
    id v8 = 0LL;
    v7 = v28;
  }

  return v31;
}

@end