@interface IXSPromisedOutOfBandStreamingZipTransfer
- (IXSPromisedOutOfBandStreamingZipTransfer)initWithSeed:(id)a3 error:(id *)a4;
- (unint64_t)totalBytesForProgress;
- (void)_remote_setArchiveBytesConsumed:(unint64_t)a3;
- (void)reset;
@end

@implementation IXSPromisedOutOfBandStreamingZipTransfer

- (IXSPromisedOutOfBandStreamingZipTransfer)initWithSeed:(id)a3 error:(id *)a4
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___IXSPromisedOutOfBandStreamingZipTransfer;
  return -[IXSDataPromise initWithSeed:error:](&v5, "initWithSeed:error:", a3, a4);
}

- (void)reset
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise seed](self, "seed"));
  [v4 setArchiveBytesConsumed:0];

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___IXSPromisedOutOfBandStreamingZipTransfer;
  -[IXSDataPromise reset](&v5, "reset");
}

- (unint64_t)totalBytesForProgress
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise seed](self, "seed"));
  id v5 = [v4 archiveSizeBytes];

  return (unint64_t)v5;
}

- (void)_remote_setArchiveBytesConsumed:(unint64_t)a3
{
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_not_V2(v5);

  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000046FC;
  v7[3] = &unk_1000CCBD8;
  v7[4] = self;
  v7[5] = a3;
  dispatch_sync(v6, v7);
}

@end