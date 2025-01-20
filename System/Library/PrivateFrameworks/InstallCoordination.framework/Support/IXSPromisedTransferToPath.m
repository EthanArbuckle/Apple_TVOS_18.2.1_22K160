@interface IXSPromisedTransferToPath
- (void)_remote_setShouldCopy:(BOOL)a3;
- (void)_remote_setTransferPath:(id)a3;
- (void)_remote_setTryDeltaCopy:(BOOL)a3;
@end

@implementation IXSPromisedTransferToPath

- (void)_remote_setTransferPath:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_not_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10003059C;
  v8[3] = &unk_1000CCCB8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  sub_10005A8F0(v6, v8);
}

- (void)_remote_setShouldCopy:(BOOL)a3
{
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_not_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100030674;
  v7[3] = &unk_1000CD420;
  v7[4] = self;
  BOOL v8 = a3;
  sub_10005A8F0(v6, v7);
}

- (void)_remote_setTryDeltaCopy:(BOOL)a3
{
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_not_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100030750;
  v7[3] = &unk_1000CD420;
  v7[4] = self;
  BOOL v8 = a3;
  sub_10005A8F0(v6, v7);
}

@end