@interface PrecisionFindingDiagnosticExtension
- (id)attachmentList;
- (id)attachmentsForParameters:(id)a3;
@end

@implementation PrecisionFindingDiagnosticExtension

- (id)attachmentList
{
  return &__NSArray0__struct;
}

- (id)attachmentsForParameters:(id)a3
{
  os_log_t v3 = os_log_create("com.apple.CoreMotionAlgorithms", "DiagnosticExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL URLWithString:]( &OBJC_CLASS___NSURL,  "URLWithString:",  @"/private/var/mobile/Library/Caches/com.apple.CoreMotionAlgorithms/"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  NSURLResourceKey v16 = NSURLContentModificationDateKey;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
  id v15 = 0LL;
  v7 = (void *)objc_claimAutoreleasedReturnValue( [v5 contentsOfDirectoryAtURL:v4 includingPropertiesForKeys:v6 options:0 error:&v15]);
  id v8 = v15;

  if (v8)
  {
    v9 = v3;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000039BC(v8, v9);
    }
    v10 = &__NSArray0__struct;
  }

  else
  {
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 sortedArrayUsingComparator:&stru_100004108]);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    if (-[os_log_s count](v9, "count"))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s firstObject](v9, "firstObject"));
      v12 = (void *)objc_claimAutoreleasedReturnValue([v11 path]);
      v13 = (void *)objc_claimAutoreleasedReturnValue( +[DEAttachmentItem attachmentWithPath:]( &OBJC_CLASS___DEAttachmentItem,  "attachmentWithPath:",  v12));
      [v10 addObject:v13];
    }
  }

  return v10;
}

@end