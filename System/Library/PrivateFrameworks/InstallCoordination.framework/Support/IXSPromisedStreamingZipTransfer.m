@interface IXSPromisedStreamingZipTransfer
- (IXSPromisedStreamingZipTransfer)initWithSeed:(id)a3 error:(id *)a4;
- (unint64_t)bytesConsumedOnDisk;
- (unint64_t)totalBytesForProgress;
- (void)_remote_setArchiveBytesConsumed:(unint64_t)a3;
- (void)reset;
@end

@implementation IXSPromisedStreamingZipTransfer

- (IXSPromisedStreamingZipTransfer)initWithSeed:(id)a3 error:(id *)a4
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___IXSPromisedStreamingZipTransfer;
  v4 = -[IXSOwnedDataPromise initWithSeed:error:](&v10, "initWithSeed:error:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](v4, "accessQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10002444C;
    block[3] = &unk_1000CCE58;
    v9 = v5;
    dispatch_sync(v6, block);
  }

  return v5;
}

- (void)reset
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise seed](self, "seed"));
  [v4 setArchiveBytesConsumed:0];

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___IXSPromisedStreamingZipTransfer;
  -[IXSOwnedDataPromise reset](&v5, "reset");
}

- (unint64_t)totalBytesForProgress
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise seed](self, "seed"));
  id v5 = [v4 archiveSizeBytes];

  return (unint64_t)v5;
}

- (unint64_t)bytesConsumedOnDisk
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[IXFileManager defaultManager](&OBJC_CLASS___IXFileManager, "defaultManager"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXSOwnedDataPromise stagedPath](self, "stagedPath"));
  id v6 = [v4 diskUsageForURL:v5];

  return (unint64_t)v6;
}

- (void)_remote_setArchiveBytesConsumed:(unint64_t)a3
{
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_not_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100024674;
  v7[3] = &unk_1000CCBD8;
  v7[4] = self;
  v7[5] = a3;
  sub_10005A8F0(v6, v7);
}

@end