@interface IXSPromisedInMemoryData
+ (BOOL)supportsSecureCoding;
- (IXSPromisedInMemoryData)initWithCoder:(id)a3;
- (IXSPromisedInMemoryData)initWithSeed:(id)a3 data:(id)a4 error:(id *)a5;
- (NSData)data;
- (id)updatedPromiseWithData:(id)a3 error:(id *)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IXSPromisedInMemoryData

- (IXSPromisedInMemoryData)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___IXSPromisedInMemoryData;
  return -[IXSOwnedDataPromise initWithCoder:](&v4, "initWithCoder:", a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v5);

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___IXSPromisedInMemoryData;
  -[IXSOwnedDataPromise encodeWithCoder:](&v6, "encodeWithCoder:", v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IXSPromisedInMemoryData)initWithSeed:(id)a3 data:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___IXSPromisedInMemoryData;
  v10 = -[IXSOwnedDataPromise initWithSeed:error:](&v26, "initWithSeed:error:", v8, a5);
  v11 = v10;
  if (!v10) {
    goto LABEL_7;
  }
  uint64_t v20 = 0LL;
  v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  v23 = sub_10003AF08;
  v24 = sub_10003AF18;
  id v25 = 0LL;
  v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](v10, "accessQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003AF20;
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

- (id)updatedPromiseWithData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise seed](self, "seed"));
  id v8 = objc_alloc_init(&OBJC_CLASS___IXPromisedInMemoryDataSeed);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);
  -[IXDataPromiseSeed setName:](v8, "setName:", v9);

  -[IXDataPromiseSeed setCreatorIdentifier:](v8, "setCreatorIdentifier:", [v7 creatorIdentifier]);
  -[IXDataPromiseSeed setTotalBytesNeededOnDisk:](v8, "setTotalBytesNeededOnDisk:", [v6 length]);
  id v15 = 0LL;
  id v10 = [objc_alloc((Class)objc_opt_class(self)) initWithSeed:v8 data:v6 error:&v15];

  id v11 = v15;
  v12 = v11;
  if (v10)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[IXSDataPromiseManager sharedInstance](&OBJC_CLASS___IXSDataPromiseManager, "sharedInstance"));
    [v13 registerPromise:v10];
  }

  else if (a4)
  {
    *a4 = v11;
  }

  return v10;
}

- (NSData)data
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IXSOwnedDataPromise stagedPath](self, "stagedPath"));
  id v12 = 0LL;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfURL:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfURL:options:error:",  v4,  3LL,  &v12));
  id v6 = v12;

  if (!v5)
  {
    v7 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IXSOwnedDataPromise stagedPath](self, "stagedPath"));
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 path]);
      *(_DWORD *)buf = 136315650;
      v14 = "-[IXSPromisedInMemoryData data]";
      __int16 v15 = 2112;
      v16 = v10;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to read data from %@ : %@",  buf,  0x20u);
    }
  }

  return (NSData *)v5;
}

@end