@interface ML3MediaLibraryWriter
- (void)collectDiagnostic:(id)a3;
@end

@implementation ML3MediaLibraryWriter

- (void)collectDiagnostic:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ML3MediaLibraryWriter serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000389C;
  block[3] = &unk_1000251D8;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_sync(v5, block);
}

@end