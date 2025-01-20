@interface SAMPSetPlaybackPosition
- (void)_ad_performNextItemWithTargetQueue:(id)a3 completion:(id)a4;
- (void)_ad_performPreviousItemWithTargetQueue:(id)a3 completion:(id)a4;
- (void)_ad_performSeekToBeginningWithTargetQueue:(id)a3 completion:(id)a4;
- (void)_ad_performWithMediaRemoteService:(id)a3 replyHandler:(id)a4;
@end

@implementation SAMPSetPlaybackPosition

- (void)_ad_performWithMediaRemoteService:(id)a3 replyHandler:(id)a4
{
  v10 = (void (**)(id, SACommandFailed *, void))a4;
  id v6 = a3;
  unsigned int v7 = -[SAMPSetPlaybackPosition position](self, "position");
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 targetQueue]);

  switch(v7)
  {
    case 3u:
      -[SAMPSetPlaybackPosition _ad_performSeekToBeginningWithTargetQueue:completion:]( self,  "_ad_performSeekToBeginningWithTargetQueue:completion:",  v8,  v10);
      break;
    case 2u:
      -[SAMPSetPlaybackPosition _ad_performPreviousItemWithTargetQueue:completion:]( self,  "_ad_performPreviousItemWithTargetQueue:completion:",  v8,  v10);
      break;
    case 1u:
      -[SAMPSetPlaybackPosition _ad_performNextItemWithTargetQueue:completion:]( self,  "_ad_performNextItemWithTargetQueue:completion:",  v8,  v10);
      break;
    default:
      if (v10)
      {
        v9 = -[SACommandFailed initWithReason:]( objc_alloc(&OBJC_CLASS___SACommandFailed),  "initWithReason:",  @"Unsupported playback position request");
        v10[2](v10, v9, 0LL);
      }

      break;
  }
}

- (void)_ad_performSeekToBeginningWithTargetQueue:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  v9 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100191570;
  v12[3] = &unk_1004F68A0;
  id v13 = v6;
  id v14 = v7;
  v12[4] = self;
  id v10 = v6;
  id v11 = v7;
  AFGetNowPlayingInfoDictionary(v9, v12);
}

- (void)_ad_performNextItemWithTargetQueue:(id)a3 completion:(id)a4
{
}

- (void)_ad_performPreviousItemWithTargetQueue:(id)a3 completion:(id)a4
{
  uint64_t v9 = kMRMediaRemoteOptionRequestDefermentToPlaybackQueuePosition;
  id v10 = &__kCFBooleanTrue;
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
  sub_10019054C(5LL, self, v8, v7, v6);
}

@end