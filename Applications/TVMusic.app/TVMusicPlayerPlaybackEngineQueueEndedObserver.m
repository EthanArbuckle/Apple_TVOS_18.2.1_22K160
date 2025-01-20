@interface TVMusicPlayerPlaybackEngineQueueEndedObserver
- (void)engine:(id)a3 didReachEndOfQueueWithReason:(id)a4;
@end

@implementation TVMusicPlayerPlaybackEngineQueueEndedObserver

- (void)engine:(id)a3 didReachEndOfQueueWithReason:(id)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10007DE30;
  block[3] = &unk_100268D60;
  v5 = &stru_10026BBC8;
  dispatch_async(&_dispatch_main_q, block);
}

@end