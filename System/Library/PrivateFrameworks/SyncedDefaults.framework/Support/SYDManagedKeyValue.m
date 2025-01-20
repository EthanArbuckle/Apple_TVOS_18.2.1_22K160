@interface SYDManagedKeyValue
- (id)value;
- (void)setValue:(id)a3;
@end

@implementation SYDManagedKeyValue

- (id)value
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SYDManagedKeyValue plistDataValue](self, "plistDataValue"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SYDManagedKeyValue plistDataValue](self, "plistDataValue"));
    id v16 = 0LL;
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v4,  0LL,  0LL,  &v16));
    id v6 = v16;

    if (v6)
    {
      id v7 = SYDGetCloudKitLog();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1000327A4((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }

  else
  {
    v5 = 0LL;
  }

  return v5;
}

- (void)setValue:(id)a3
{
  if (a3)
  {
    id v16 = 0LL;
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  a3,  200LL,  0LL,  &v16));
    id v5 = v16;
    id v6 = v5;
    if (v4) {
      BOOL v7 = v5 == 0LL;
    }
    else {
      BOOL v7 = 0;
    }
    if (v7)
    {
      -[SYDManagedKeyValue setPlistDataValue:](self, "setPlistDataValue:", v4);
    }

    else
    {
      id v8 = SYDGetCoreDataLog();
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10003280C((uint64_t)v6, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }

  else
  {
    -[SYDManagedKeyValue setPlistDataValue:](self, "setPlistDataValue:");
  }

@end