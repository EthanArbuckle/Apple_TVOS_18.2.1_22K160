@interface MTMediaContentSourceiOSMusicLibrary
+ (id)sharedInstance;
- (BOOL)iTunesMatchEnabled;
- (MTMediaContentSourceiOSMusicLibrary)init;
- (OS_dispatch_queue)workQueue;
- (void)determineiTunesMatchEnabledWithCompletion:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation MTMediaContentSourceiOSMusicLibrary

+ (id)sharedInstance
{
  if (qword_1002B6A98 != -1) {
    dispatch_once(&qword_1002B6A98, &stru_100242EA0);
  }
  return (id)qword_1002B6AA0;
}

- (MTMediaContentSourceiOSMusicLibrary)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTMediaContentSourceiOSMusicLibrary;
  v2 = -[MTMediaContentSourceiOSMusicLibrary init](&v8, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_UTILITY, -15);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("MTMediaContentSourceiOSMusicLibrary", v4);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v5;
  }

  return v2;
}

- (void)determineiTunesMatchEnabledWithCompletion:(id)a3
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100091694;
  v10[3] = &unk_100242EC8;
  id v11 = a3;
  id v4 = v11;
  dispatch_queue_t v5 = objc_retainBlock(v10);
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MTMediaContentSourceiOSMusicLibrary workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000916A8;
  block[3] = &unk_100240138;
  block[4] = self;
  id v9 = v5;
  v7 = v5;
  dispatch_async(v6, block);
}

- (BOOL)iTunesMatchEnabled
{
  return self->_iTunesMatchEnabled;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end