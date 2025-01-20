@interface MSDXattr
+ (BOOL)hasXattr:(id)a3 path:(id)a4;
+ (BOOL)isContentRoot:(id)a3;
+ (BOOL)isContentRootToRemove:(id)a3;
+ (BOOL)isNotExtracted:(id)a3;
+ (BOOL)removeXattr:(id)a3;
+ (BOOL)setContentRoot:(id)a3;
+ (BOOL)setContentRootToRemove:(id)a3;
+ (BOOL)setIsNotBackedUp:(id)a3;
+ (BOOL)setIsNotExtracted:(id)a3;
+ (BOOL)setIsNotRestored:(id)a3;
+ (BOOL)setXattr:(id)a3 path:(id)a4;
+ (BOOL)setXattr:(id)a3 value:(id)a4 path:(id)a5;
@end

@implementation MSDXattr

+ (BOOL)isNotExtracted:(id)a3
{
  return +[MSDXattr hasXattr:path:](&OBJC_CLASS___MSDXattr, "hasXattr:path:", @"NotExtracted", a3);
}

+ (BOOL)isContentRoot:(id)a3
{
  id v3 = a3;
  if (+[MSDXattr hasXattr:path:](&OBJC_CLASS___MSDXattr, "hasXattr:path:", @"ContentRoot", v3)) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = +[MSDXattr hasXattr:path:](&OBJC_CLASS___MSDXattr, "hasXattr:path:", @"ContentRootToRemove", v3);
  }

  return v4;
}

+ (BOOL)isContentRootToRemove:(id)a3
{
  return +[MSDXattr hasXattr:path:](&OBJC_CLASS___MSDXattr, "hasXattr:path:", @"ContentRootToRemove", a3);
}

+ (BOOL)removeXattr:(id)a3
{
  id v3 = a3;
  BOOL v4 = (const char *)[@"MSDAnnotation" UTF8String];
  id v5 = v3;
  int v6 = removexattr((const char *)[v5 fileSystemRepresentation], v4, 1);
  if (v6)
  {
    id v8 = sub_100021D84();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100025748();
    }
  }

  return v6 == 0;
}

+ (BOOL)setContentRoot:(id)a3
{
  return +[MSDXattr setXattr:path:](&OBJC_CLASS___MSDXattr, "setXattr:path:", @"ContentRoot", a3);
}

+ (BOOL)setContentRootToRemove:(id)a3
{
  return +[MSDXattr setXattr:path:](&OBJC_CLASS___MSDXattr, "setXattr:path:", @"ContentRootToRemove", a3);
}

+ (BOOL)setIsNotExtracted:(id)a3
{
  return +[MSDXattr setXattr:path:](&OBJC_CLASS___MSDXattr, "setXattr:path:", @"NotExtracted", a3);
}

+ (BOOL)setIsNotBackedUp:(id)a3
{
  return +[MSDXattr setXattr:value:path:]( &OBJC_CLASS___MSDXattr,  "setXattr:value:path:",  @"MBRestoreAnnotation",  @"NotBackedUp",  a3);
}

+ (BOOL)setIsNotRestored:(id)a3
{
  return +[MSDXattr setXattr:value:path:]( &OBJC_CLASS___MSDXattr,  "setXattr:value:path:",  @"MBRestoreAnnotation",  @"NotRestored",  a3);
}

+ (BOOL)hasXattr:(id)a3 path:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  id v8 = (const char *)[@"MSDAnnotation" UTF8String];
  id v9 = v6;
  v10 = (const char *)[v9 fileSystemRepresentation];
  ssize_t v11 = getxattr(v10, v8, 0LL, 0LL, 0, 1);
  if (v11 < 0)
  {
    if (*__error() == 93)
    {
      id v12 = 0LL;
      v14 = 0LL;
      goto LABEL_9;
    }

    id v18 = sub_100021D84();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_1000257BC((uint64_t)v9, v11, v16);
    }
    id v12 = 0LL;
LABEL_13:
    v14 = 0LL;
    BOOL v17 = 0;
LABEL_14:

    goto LABEL_15;
  }

  id v12 = objc_claimAutoreleasedReturnValue( +[NSMutableData dataWithLength:]( &OBJC_CLASS___NSMutableData, "dataWithLength:", v11));
  ssize_t v13 = getxattr(v10, v8, [v12 mutableBytes], v11, 0, 1);
  if (v13 < 0)
  {
    id v20 = sub_100021D84();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100025840();
    }
    goto LABEL_13;
  }

  [v12 setLength:v13];
  v14 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v12, 4LL);
  if (-[NSString isEqualToString:](v14, "isEqualToString:", v7))
  {
    id v15 = sub_100021D84();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138412546;
      id v22 = v9;
      __int16 v23 = 2114;
      id v24 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%@: Has expected xattr %{public}@",  (uint8_t *)&v21,  0x16u);
    }

    BOOL v17 = 1;
    goto LABEL_14;
  }

+ (BOOL)setXattr:(id)a3 path:(id)a4
{
  return +[MSDXattr setXattr:value:path:]( &OBJC_CLASS___MSDXattr,  "setXattr:value:path:",  @"MSDAnnotation",  a3,  a4);
}

+ (BOOL)setXattr:(id)a3 value:(id)a4 path:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a4 dataUsingEncoding:4]);
  id v10 = v8;
  ssize_t v11 = (const char *)[v10 fileSystemRepresentation];
  id v12 = v7;
  ssize_t v13 = (const char *)[v12 UTF8String];
  id v14 = v9;
  int v15 = setxattr(v11, v13, [v14 bytes], (size_t)objc_msgSend(v14, "length"), 0, 1);
  if (v15)
  {
    id v17 = sub_100021D84();
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1000258B4((uint64_t)v12, (uint64_t)v10, v18);
    }
  }

  return v15 == 0;
}

@end