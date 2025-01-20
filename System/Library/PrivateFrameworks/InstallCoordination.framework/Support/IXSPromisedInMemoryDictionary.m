@interface IXSPromisedInMemoryDictionary
+ (BOOL)supportsSecureCoding;
- (IXSPromisedInMemoryDictionary)initWithCoder:(id)a3;
- (IXSPromisedInMemoryDictionary)initWithSeed:(id)a3 dictionary:(id)a4 error:(id *)a5;
- (NSDictionary)dictionary;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IXSPromisedInMemoryDictionary

- (IXSPromisedInMemoryDictionary)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___IXSPromisedInMemoryDictionary;
  return -[IXSOwnedDataPromise initWithCoder:](&v4, "initWithCoder:", a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v5);

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___IXSPromisedInMemoryDictionary;
  -[IXSOwnedDataPromise encodeWithCoder:](&v6, "encodeWithCoder:", v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IXSPromisedInMemoryDictionary)initWithSeed:(id)a3 dictionary:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___IXSPromisedInMemoryDictionary;
  v10 = -[IXSOwnedDataPromise initWithSeed:error:](&v26, "initWithSeed:error:", v8, a5);
  v11 = v10;
  if (!v10) {
    goto LABEL_7;
  }
  uint64_t v20 = 0LL;
  v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  v23 = sub_10002DC74;
  v24 = sub_10002DC84;
  id v25 = 0LL;
  v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](v10, "accessQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002DC8C;
  block[3] = &unk_1000CD058;
  v17 = v11;
  id v18 = v9;
  v19 = &v20;
  dispatch_sync(v12, block);

  v13 = (void *)v21[5];
  if (!v13)
  {

    _Block_object_dispose(&v20, 8);
LABEL_7:
    v14 = v11;
    goto LABEL_8;
  }

  if (a5) {
    *a5 = v13;
  }

  _Block_object_dispose(&v20, 8);
  v14 = 0LL;
LABEL_8:

  return v14;
}

- (NSDictionary)dictionary
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IXSOwnedDataPromise stagedPath](self, "stagedPath"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfURL:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:",  v4));

  if (!v5)
  {
    objc_super v6 = sub_1000047B4((uint64_t)off_1000E8CA0);
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IXSOwnedDataPromise stagedPath](self, "stagedPath"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 path]);
      int v11 = 136315650;
      v12 = "-[IXSPromisedInMemoryDictionary dictionary]";
      __int16 v13 = 2112;
      v14 = v9;
      __int16 v15 = 2112;
      uint64_t v16 = 0LL;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to read dictionary from %@ : %@",  (uint8_t *)&v11,  0x20u);
    }
  }

  return (NSDictionary *)v5;
}

@end