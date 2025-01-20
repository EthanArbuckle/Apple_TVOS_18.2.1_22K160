@interface NSData
+ (id)dmd_dataWithMappedContentsOfFileHandle:(id)a3 error:(id *)a4;
- (NSData)dmd_sha1Hash;
@end

@implementation NSData

+ (id)dmd_dataWithMappedContentsOfFileHandle:(id)a3 error:(id *)a4
{
  int v5 = [a3 fileDescriptor];
  if (fstat(v5, &v27) == -1)
  {
    BOOL v9 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v9)
    {
      sub_100067250(v9, v10, v11, v12, v13, v14, v15, v16);
      if (!a4) {
        goto LABEL_9;
      }
    }

    else if (!a4)
    {
LABEL_9:
      dispatch_data_t v8 = 0LL;
      return v8;
    }

- (NSData)dmd_sha1Hash
{
  v3 = self;
  CC_SHA1_Update(&c, -[NSData bytes](v3, "bytes"), (CC_LONG)-[NSData length](v3, "length"));
  CC_SHA1_Final(md, &c);
  return (NSData *)(id)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  md,  20LL));
}

@end