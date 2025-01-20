@interface WLDLivePlaybackReporter
+ (id)_contentEventFromSummary:(id)a3 schedule:(id)a4 event:(id)a5;
+ (void)_decorateEBSSummary:(id)a3 completion:(id)a4;
+ (void)_decorateLiveSummary:(id)a3 completion:(id)a4;
+ (void)decorateSummary:(id)a3 completion:(id)a4;
- (WLDLivePlaybackReporter)initWithSessionID:(id)a3;
- (WLKPlaybackSummary)lastSummary;
- (WLKTransactionScope)transaction;
- (id)_debugStringForInput:(unint64_t)a3;
- (id)schedule;
- (unint64_t)state;
- (void)_configureTimerForDate:(id)a3 playbackDate:(id)a4 input:(unint64_t)a5;
- (void)_evaluateEventsForReportingWithPlaybackDate:(id)a3 schedule:(id)a4 completion:(id)a5;
- (void)_evaluateScheduleWithPlaybackDate:(id)a3;
- (void)_getScheduleWithPlaybackDate:(id)a3 completion:(id)a4;
- (void)_handlePlayerStateDidBecomePlayingWithCompletion:(id)a3;
- (void)_handleTimerFiredAtEventStart:(id)a3;
- (void)_handleTimerFiredAtScheduleBoundary:(id)a3;
- (void)_invalidateTimer;
- (void)_processInput:(unint64_t)a3 completion:(id)a4;
- (void)_reportPlayEvents:(id)a3 account:(id)a4 completion:(id)a5;
- (void)getCachedCanonicalIDForSummary:(id)a3 completionHandler:(id)a4;
- (void)reportPlayback:(id)a3 completion:(id)a4;
- (void)setLastSummary:(id)a3;
- (void)setSchedule:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setTransaction:(id)a3;
@end

@implementation WLDLivePlaybackReporter

- (WLDLivePlaybackReporter)initWithSessionID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___WLDLivePlaybackReporter;
  v6 = -[WLDLivePlaybackReporter init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sessionID, a3);
    v7->_scheduleAlreadyFetchedAtBoundary = 0;
    -[WLDLivePlaybackReporter setState:](v7, "setState:", 1LL);
  }

  return v7;
}

- (void)reportPlayback:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = WLDDispatchQueue();
  objc_super v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __53__WLDLivePlaybackReporter_reportPlayback_completion___block_invoke;
  block[3] = &unk_10003CE60;
  id v13 = v6;
  v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

void __53__WLDLivePlaybackReporter_reportPlayback_completion___block_invoke(id *a1)
{
  id v2 = a1[4];
  if (v2)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = __53__WLDLivePlaybackReporter_reportPlayback_completion___block_invoke_2;
    v5[3] = &unk_10003CE88;
    id v3 = a1[6];
    id v4 = a1[5];
    id v7 = v3;
    v5[4] = v4;
    id v6 = v2;
    [v6 resolveChannelID:v5];
  }

  else
  {
    NSLog(&CFSTR("WLDLivePlaybackReporter: Received nil summary, performing cleanup, calling completion and returning early cau"
                 "se no need to report a tune out").isa);
    [a1[5] _invalidateTimer];
    [a1[5] setTransaction:0];
    (*((void (**)(void))a1[6] + 2))();
  }
}

void __53__WLDLivePlaybackReporter_reportPlayback_completion___block_invoke_2( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    id v7 = WLDDispatchQueue();
    id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v7);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __53__WLDLivePlaybackReporter_reportPlayback_completion___block_invoke_3;
    block[3] = &unk_10003CE60;
    objc_super v9 = *(void **)(a1 + 40);
    void block[4] = *(void *)(a1 + 32);
    id v11 = v9;
    id v12 = *(id *)(a1 + 48);
    dispatch_async(v8, block);
  }

  else
  {
    NSLog(@"WLDLivePlaybackReporter: Error: Failed to resolve channel %@", v5);
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }
}

void __53__WLDLivePlaybackReporter_reportPlayback_completion___block_invoke_3(id *a1)
{
  id v2 = [a1[5] playbackState];
  id v3 = a1[4];
  if (v2 == (id)1)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([a1[4] transaction]);

    if (!v4)
    {
      id v5 = a1[4];
      id v6 = -[WLKTransactionScope initWithIdentifier:]( objc_alloc(&OBJC_CLASS___WLKTransactionScope),  "initWithIdentifier:",  @"WLDLivePlaybackReporter._processInput");
      [v5 setTransaction:v6];
    }

    [a1[4] _processInput:0 completion:a1[6]];
  }

  else
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = __53__WLDLivePlaybackReporter_reportPlayback_completion___block_invoke_4;
    v7[3] = &unk_10003CE38;
    v7[4] = v3;
    id v8 = a1[6];
    [v3 _processInput:1 completion:v7];
  }

void __53__WLDLivePlaybackReporter_reportPlayback_completion___block_invoke_4( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  [v4 setTransaction:0];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

- (void)getCachedCanonicalIDForSummary:(id)a3 completionHandler:(id)a4
{
  objc_super v9 = (void (**)(id, void *, void))a4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[WLDLivePlaybackReporter schedule](self, "schedule"));

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[WLDLivePlaybackReporter schedule](self, "schedule"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 eventForDate:v7]);

    if (v8) {
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v8 canonicalID]);
    }
    else {
      id v5 = 0LL;
    }
  }

  v9[2](v9, v5, 0LL);
}

- (id)schedule
{
  id v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_schedule;
  objc_sync_exit(v2);

  return v3;
}

- (void)setSchedule:(id)a3
{
  id v6 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  objc_sync_exit(v5);
}

+ (void)decorateSummary:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 playbackType] == (id)2)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = __54__WLDLivePlaybackReporter_decorateSummary_completion___block_invoke;
    v13[3] = &unk_10003CEB0;
    id v14 = v7;
    [a1 _decorateLiveSummary:v6 completion:v13];
    id v8 = v14;
  }

  else
  {
    if ([v6 playbackType] != (id)1)
    {
      NSLog(@"WLDLivePlaybackReporter: decorate failed -- unsupported playback type");
      uint64_t v9 = WLKError(1LL, 0LL, @"Invalid playbackType.");
      id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v10);

      goto LABEL_7;
    }

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = __54__WLDLivePlaybackReporter_decorateSummary_completion___block_invoke_2;
    v11[3] = &unk_10003CEB0;
    id v12 = v7;
    [a1 _decorateEBSSummary:v6 completion:v11];
    id v8 = v12;
  }

LABEL_7:
}

uint64_t __54__WLDLivePlaybackReporter_decorateSummary_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __54__WLDLivePlaybackReporter_decorateSummary_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)_processInput:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  id v7 = WLDDispatchQueue();
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v7);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __52__WLDLivePlaybackReporter__processInput_completion___block_invoke;
  block[3] = &unk_10003CED8;
  objc_copyWeak(v12, &location);
  v12[1] = (id)a3;
  void block[4] = self;
  id v11 = v6;
  id v9 = v6;
  dispatch_async(v8, block);

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
}

void __52__WLDLivePlaybackReporter__processInput_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = [WeakRetained state];
  if (v2)
  {
    if (v2 == (id)1)
    {
      id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _debugStringForInput:*(void *)(a1 + 56)]);
      NSLog(@"WLDLivePlaybackReporter: [StateMachine][PlayerStateNotPlaying] input:[%@]", v3);

      uint64_t v4 = *(void *)(a1 + 56);
      if (v4)
      {
        id v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _debugStringForInput:*(void *)(a1 + 56)]);
        NSLog( @"WLDLivePlaybackReporter: [StateMachine][PlayerStateNotPlaying] No action for input: %lu %@",  v4,  v5);
        goto LABEL_13;
      }

      [WeakRetained _handlePlayerStateDidBecomePlayingWithCompletion:*(void *)(a1 + 40)];
    }
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _debugStringForInput:*(void *)(a1 + 56)]);
    NSLog(@"WLDLivePlaybackReporter: [StateMachine][PlayerStatePlaying] input:[%@]", v6);

    uint64_t v7 = *(void *)(a1 + 56);
    switch(v7)
    {
      case 3LL:
        [WeakRetained _handleTimerFiredAtScheduleBoundary:*(void *)(a1 + 40)];
        break;
      case 2LL:
        [WeakRetained _handleTimerFiredAtEventStart:*(void *)(a1 + 40)];
        break;
      case 1LL:
        [WeakRetained _invalidateTimer];
        [WeakRetained setState:1];
LABEL_14:
        (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
        break;
      default:
        id v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _debugStringForInput:*(void *)(a1 + 56)]);
        NSLog( @"WLDLivePlaybackReporter: [StateMachine][PlayerStatePlaying] No action for input: %lu %@",  v7,  v5);
LABEL_13:

        goto LABEL_14;
    }
  }
}

- (void)_handlePlayerStateDidBecomePlayingWithCompletion:(id)a3
{
  id v4 = a3;
  -[WLDLivePlaybackReporter setState:](self, "setState:", 0LL);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[WLDLivePlaybackReporter lastSummary](self, "lastSummary"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentPlaybackDate]);

  if (!v6)
  {
    NSLog(@"WLDLivePlaybackReporter::Falling back to current date and currentPlaybackDate is not available");
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  }

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = __76__WLDLivePlaybackReporter__handlePlayerStateDidBecomePlayingWithCompletion___block_invoke;
  v9[3] = &unk_10003CF00;
  v9[4] = self;
  id v10 = v6;
  id v11 = v4;
  id v7 = v4;
  id v8 = v6;
  -[WLDLivePlaybackReporter _getScheduleWithPlaybackDate:completion:]( self,  "_getScheduleWithPlaybackDate:completion:",  v8,  v9);
}

void __76__WLDLivePlaybackReporter__handlePlayerStateDidBecomePlayingWithCompletion___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (v6 && ![*(id *)(a1 + 32) state])
  {
    [*(id *)(a1 + 32) _evaluateEventsForReportingWithPlaybackDate:*(void *)(a1 + 40) schedule:v6 completion:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) _evaluateScheduleWithPlaybackDate:*(void *)(a1 + 40)];
  }

  else
  {
    if ([*(id *)(a1 + 32) state]) {
      NSLog(&CFSTR("WLDLivePlaybackReporter::_handlePlayerStateDidBecomePlaying - Not reporting or evaluating schedule as state"
    }
                   " is no longer playing").isa);
    else {
      NSLog(@"WLDLivePlaybackReporter:_handlePlayerStateDidBecomePlaying - decorate failed %@", v5);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }
}

- (void)_handleTimerFiredAtEventStart:(id)a3
{
  id v4 = a3;
  id v5 = WLDDispatchQueue();
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v5);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = __57__WLDLivePlaybackReporter__handleTimerFiredAtEventStart___block_invoke;
  v8[3] = &unk_10003CF50;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __57__WLDLivePlaybackReporter__handleTimerFiredAtEventStart___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  id v3 = *(id *)(*(void *)(a1 + 32) + 24LL);
  objc_sync_exit(v2);

  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) schedule]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 eventForDate:v3 fuzziness:2.0]);

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) lastSummary]);
    id v8 = (void *)objc_opt_class(*(void *)(a1 + 32), v7);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) schedule]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 _contentEventFromSummary:v6 schedule:v9 event:v5]);

    v17 = v10;
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 accountID]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v12 longLongValue]));

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = __57__WLDLivePlaybackReporter__handleTimerFiredAtEventStart___block_invoke_2;
    v15[3] = &unk_10003CF28;
    id v14 = *(void **)(a1 + 32);
    id v16 = *(id *)(a1 + 40);
    [v14 _reportPlayEvents:v11 account:v13 completion:v15];
  }

  else if (*(void *)(a1 + 40))
  {
    NSLog(@"WLDLivePlaybackReporter: Next event not found when timer fired. Investigate this.");
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

  [*(id *)(a1 + 32) _evaluateScheduleWithPlaybackDate:*(void *)(*(void *)(a1 + 32) + 24)];
}

void __57__WLDLivePlaybackReporter__handleTimerFiredAtEventStart___block_invoke_2( uint64_t a1,  unsigned int a2,  void *a3)
{
  id v5 = a3;
  NSLog( @"WLDLivePlaybackReporter: Live activity timer based event start report success: %d Error: %@",  a2,  v5);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)_handleTimerFiredAtScheduleBoundary:(id)a3
{
  id v4 = a3;
  -[WLDLivePlaybackReporter _invalidateTimer](self, "_invalidateTimer");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[WLDLivePlaybackReporter schedule](self, "schedule"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 endDate]);

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = __63__WLDLivePlaybackReporter__handleTimerFiredAtScheduleBoundary___block_invoke;
  v9[3] = &unk_10003CF00;
  v9[4] = self;
  id v10 = v6;
  id v11 = v4;
  id v7 = v4;
  id v8 = v6;
  -[WLDLivePlaybackReporter _getScheduleWithPlaybackDate:completion:]( self,  "_getScheduleWithPlaybackDate:completion:",  v8,  v9);
}

void __63__WLDLivePlaybackReporter__handleTimerFiredAtScheduleBoundary___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (v6 && ![*(id *)(a1 + 32) state])
  {
    [*(id *)(a1 + 32) _evaluateEventsForReportingWithPlaybackDate:*(void *)(a1 + 40) schedule:v6 completion:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) _evaluateScheduleWithPlaybackDate:*(void *)(a1 + 40)];
  }

  else
  {
    if ([*(id *)(a1 + 32) state]) {
      NSLog(&CFSTR("WLDLivePlaybackReporter::_handleTimerFiredAtScheduleBoundary - Not reporting or evaluating schedule as stat"
    }
                   "e is no longer playing").isa);
    else {
      NSLog(@"WLDLivePlaybackReporter:_handleTimerFiredAtScheduleBoundary - decorate failed %@", v5);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }
}

- (void)_getScheduleWithPlaybackDate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[WLDLivePlaybackReporter lastSummary](self, "lastSummary"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[WLDLivePlaybackReporter schedule](self, "schedule"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 endDate]);

  BOOL v11 = 0;
  if (v6 && v10)
  {
    id v12 = (id)objc_claimAutoreleasedReturnValue([v6 laterDate:v10]);
    BOOL v11 = v12 == v6;
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[WLDLivePlaybackReporter schedule](self, "schedule"));
  if (!v13)
  {
    if (!v11)
    {
      NSLog(@"WLDLivePlaybackReporter: No existing schedule, fetching one");
      goto LABEL_13;
    }

void __67__WLDLivePlaybackReporter__getScheduleWithPlaybackDate_completion___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) schedule]);
    unsigned __int8 v7 = [v6 isEqual:v10];

    if ((v7 & 1) == 0)
    {
      [*(id *)(a1 + 32) setSchedule:v10];
      *(_BYTE *)(*(void *)(a1 + 32) + 40LL) = 0;
    }

    id v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16LL);
    goto LABEL_7;
  }

  NSLog(@"WLDLivePlaybackReporter: decorate failed %@", v5);
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9)
  {
    id v8 = *(void (**)(void))(v9 + 16);
LABEL_7:
    v8();
  }
}

+ (void)_decorateLiveSummary:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = __59__WLDLivePlaybackReporter__decorateLiveSummary_completion___block_invoke;
  v7[3] = &unk_10003CFC8;
  id v8 = a3;
  id v9 = a4;
  id v5 = v8;
  id v6 = v9;
  [v5 resolveChannelID:v7];
}

void __59__WLDLivePlaybackReporter__decorateLiveSummary_completion___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unsigned __int8 v7 = v6;
  if (v5)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) serviceID]);
    if ([v5 length] && objc_msgSend(v8, "length"))
    {
      id v9 = [[WLKPlayActivityDecorateLiveOperation alloc] initWithChannelID:v5 serviceID:v8];
      objc_initWeak(&location, v9);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = __59__WLDLivePlaybackReporter__decorateLiveSummary_completion___block_invoke_2;
      v14[3] = &unk_10003CFA0;
      objc_copyWeak(&v16, &location);
      id v15 = *(id *)(a1 + 40);
      [v9 setCompletionBlock:v14];
      id v10 = WLDOperationQueue();
      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      [v11 addOperation:v9];

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }

    else
    {
      NSLog( @"WLDLivePlaybackReporter: Live summary doesn't meet preconditions. channelID:%@ serviceID:%@",  v5,  v8);
      uint64_t v12 = *(void *)(a1 + 40);
      uint64_t v13 = WLKError(1LL, 0LL, @"Live summary doesn't meet preconditions.");
      id v9 = (id)objc_claimAutoreleasedReturnValue(v13);
      (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0LL, v9);
    }
  }

  else
  {
    NSLog(@"WLDPlaybackReporter: Error: Failed to resolve channelID %@", v6);
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }
}

void __59__WLDLivePlaybackReporter__decorateLiveSummary_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained responseDictionary]);
  id v3 = -[WLKSchedule initWithDictionary:](objc_alloc(&OBJC_CLASS___WLKSchedule), "initWithDictionary:", v2);
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained error]);
  (*(void (**)(uint64_t, WLKSchedule *, void *))(v4 + 16))(v4, v3, v5);
}

+ (void)_decorateEBSSummary:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = __58__WLDLivePlaybackReporter__decorateEBSSummary_completion___block_invoke;
  v7[3] = &unk_10003CFC8;
  id v8 = a3;
  id v9 = a4;
  id v5 = v8;
  id v6 = v9;
  [v5 resolveChannelID:v7];
}

void __58__WLDLivePlaybackReporter__decorateEBSSummary_completion___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unsigned __int8 v7 = v6;
  if (v5)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) contentID]);
    if ([v5 length] && objc_msgSend(v8, "length"))
    {
      id v9 = [[WLKPlayActivityDecorateEBSOperation alloc] initWithChannelID:v5 externalContentID:v8];
      objc_initWeak(&location, v9);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = __58__WLDLivePlaybackReporter__decorateEBSSummary_completion___block_invoke_2;
      v14[3] = &unk_10003CFA0;
      objc_copyWeak(&v16, &location);
      id v15 = *(id *)(a1 + 40);
      [v9 setCompletionBlock:v14];
      id v10 = WLDOperationQueue();
      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      [v11 addOperation:v9];

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }

    else
    {
      NSLog( @"WLDLivePlaybackReporter: EBS summary doesn't meet preconditions. channelID:%@ contentID:%@",  v5,  v8);
      uint64_t v12 = *(void *)(a1 + 40);
      uint64_t v13 = WLKError(1LL, 0LL, @"EBS summary doesn't meet preconditions.");
      id v9 = (id)objc_claimAutoreleasedReturnValue(v13);
      (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0LL, v9);
    }
  }

  else
  {
    NSLog(@"WLDLivePlaybackReporter: Error: Failed to resolve channelID %@", v6);
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }
}

void __58__WLDLivePlaybackReporter__decorateEBSSummary_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained responseDictionary]);
  id v3 = -[WLKSchedule initWithDictionary:](objc_alloc(&OBJC_CLASS___WLKSchedule), "initWithDictionary:", v2);
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained error]);
  (*(void (**)(uint64_t, WLKSchedule *, void *))(v4 + 16))(v4, v3, v5);
}

- (void)_evaluateEventsForReportingWithPlaybackDate:(id)a3 schedule:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[WLDLivePlaybackReporter lastSummary](self, "lastSummary"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v8 eventForDate:v10]);

  if (v13)
  {
    NSLog(@"WLDLivePlaybackReporter: will report event");
    id v15 = objc_msgSend((id)objc_opt_class(self, v14), "_contentEventFromSummary:schedule:event:", v11, v8, v13);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    [v12 addObject:v16];
  }

  if ([v12 count])
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue([v11 accountID]);
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v17 longLongValue]));

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = __91__WLDLivePlaybackReporter__evaluateEventsForReportingWithPlaybackDate_schedule_completion___block_invoke;
    v19[3] = &unk_10003CF28;
    id v20 = v9;
    -[WLDLivePlaybackReporter _reportPlayEvents:account:completion:]( self,  "_reportPlayEvents:account:completion:",  v12,  v18,  v19);
  }

  else
  {
    NSLog(@"WLDLivePlaybackReporter: Will not report. We have no events");
    if (v9) {
      (*((void (**)(id, uint64_t, void))v9 + 2))(v9, 1LL, 0LL);
    }
  }
}

void __91__WLDLivePlaybackReporter__evaluateEventsForReportingWithPlaybackDate_schedule_completion___block_invoke( uint64_t a1,  unsigned int a2,  void *a3)
{
  id v5 = a3;
  NSLog(@"WLDLivePlaybackReporter: Live activity report success: %d", a2);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)_reportPlayEvents:(id)a3 account:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = -[WLDPlayActivityReportOperation initWithLivePlayEvents:]( objc_alloc(&OBJC_CLASS___WLDPlayActivityReportOperation),  "initWithLivePlayEvents:",  v7);
  -[WLDPlayActivityReportOperation setDSID:](v10, "setDSID:", v8);
  objc_initWeak(&location, v10);
  uint64_t v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472LL;
  id v16 = __64__WLDLivePlaybackReporter__reportPlayEvents_account_completion___block_invoke;
  v17 = &unk_10003CFA0;
  objc_copyWeak(&v19, &location);
  id v11 = v9;
  id v18 = v11;
  -[WLDPlayActivityReportOperation setCompletionBlock:](v10, "setCompletionBlock:", &v14);
  NSLog(@"WLDLivePlaybackReporter: Queueing activity report for events: %p", v7, v14, v15, v16, v17);
  id v12 = WLDOperationQueue();
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  [v13 addOperation:v10];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __64__WLDLivePlaybackReporter__reportPlayEvents_account_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained error]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained httpResponse]);
  NSLog(@"WLDLivePlaybackReporter: success: %d response:%@", v2 == 0LL, v3);

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained error]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained error]);
  (*(void (**)(uint64_t, BOOL, void *))(v4 + 16))(v4, v5 == 0LL, v6);
}

- (id)_debugStringForInput:(unint64_t)a3
{
  if (a3 > 3) {
    return @"Unknown";
  }
  else {
    return off_10003D030[a3];
  }
}

+ (id)_contentEventFromSummary:(id)a3 schedule:(id)a4 event:(id)a5
{
  id v6 = a5;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v9 = objc_alloc_init(&OBJC_CLASS___UWLLiveActivityEvent);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleID]);
  -[UWLLiveActivityEvent setBundleId:](v9, "setBundleId:", v10);

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 externalProfileID]);
  -[UWLLiveActivityEvent setProfileId:](v9, "setProfileId:", v11);

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 timestamp]);
  [v8 timeIntervalSinceDate:v12];
  -[UWLLiveActivityEvent setMillisecondsSinceEvent:](v9, "setMillisecondsSinceEvent:", (uint64_t)(v13 * 1000.0));

  -[UWLLiveActivityEvent setCause:](v9, "setCause:", 3LL);
  -[UWLLiveActivityEvent setContractOrTimed:](v9, "setContractOrTimed:", 1LL);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v6 nowPlayingPassThrough]);

  -[UWLLiveActivityEvent setPassThrough:](v9, "setPassThrough:", v14);
  return v9;
}

- (void)_evaluateScheduleWithPlaybackDate:(id)a3
{
  id v15 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[WLDLivePlaybackReporter schedule](self, "schedule"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 eventAfterDate:v15]);
  id v6 = v5;
  if (v5)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 startDate]);
    id v8 = @"_next event begins";
  }

  else
  {
    id v8 = 0LL;
    id v7 = 0LL;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 endDate]);
  id v10 = v9;
  uint64_t v11 = 2LL;
  id v12 = v15;
  if (v15 && !v7 && v9)
  {
    if (([v9 isEqual:v15] & 1) != 0
      || (double v13 = (void *)objc_claimAutoreleasedReturnValue([v10 laterDate:v15]),
          v13,
          v13 != v10))
    {
      id v7 = 0LL;
      goto LABEL_16;
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 endDate]);
    id v8 = @"_no event found";
    uint64_t v11 = 3LL;
    id v12 = v15;
  }

  if (v12)
  {
    if (v7)
    {
      if (([v7 isEqual:v12] & 1) == 0)
      {
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v7 laterDate:v15]);

        if (v14 == v7)
        {
          NSLog(@"WLDLivePlaybackReporter: Set up timer for %@ context: %@", v7, v8);
          -[WLDLivePlaybackReporter _configureTimerForDate:playbackDate:input:]( self,  "_configureTimerForDate:playbackDate:input:",  v7,  v15,  v11);
        }
      }
    }
  }

- (void)_configureTimerForDate:(id)a3 playbackDate:(id)a4 input:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = self;
  objc_sync_enter(v11);
  objc_storeStrong((id *)&v11->_timerEventDate, a3);
  id v12 = WLDDispatchQueue();
  double v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v12);
  dispatch_source_t v14 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v13);
  timer = v11->_timer;
  v11->_timer = (OS_dispatch_source *)v14;

  [v9 timeIntervalSinceDate:v10];
  if (v16 <= 0.0)
  {
    NSLog(@"WLDLivePlaybackReporter: Timer fire time cannot be less than or equal to 0, returning early. Investigate this.");
  }

  else
  {
    double v17 = 7200.0;
    if (v16 <= 7200.0)
    {
      double v17 = v16;
    }

    else
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:"));
      NSLog(@"WLDLivePlaybackReporter: Requested fire date exceeds max, clamping: %@", v18);
    }

    dispatch_time_t v19 = dispatch_time(0LL, (uint64_t)(v17 * 1000000000.0));
    dispatch_source_set_timer((dispatch_source_t)v11->_timer, v19, 0xFFFFFFFFFFFFFFFFLL, 0LL);
    objc_initWeak(&location, v11);
    id v20 = (dispatch_source_s *)v11->_timer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = __69__WLDLivePlaybackReporter__configureTimerForDate_playbackDate_input___block_invoke;
    handler[3] = &unk_10003D010;
    objc_copyWeak(v22, &location);
    v22[1] = (id)a5;
    dispatch_source_set_event_handler(v20, handler);
    dispatch_activate((dispatch_object_t)v11->_timer);
    objc_destroyWeak(v22);
    objc_destroyWeak(&location);
  }

  objc_sync_exit(v11);
}

void __69__WLDLivePlaybackReporter__configureTimerForDate_playbackDate_input___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained) {
    objc_msgSend(WeakRetained, "_processInput:completion:");
  }
}

void __69__WLDLivePlaybackReporter__configureTimerForDate_playbackDate_input___block_invoke_2( uint64_t a1,  unsigned int a2)
{
}

- (void)_invalidateTimer
{
  obj = self;
  objc_sync_enter(obj);
  timer = obj->_timer;
  if (timer)
  {
    NSLog(@"WLDLivePlaybackReporter: Cancelling existing timer");
    timerEventDate = obj->_timerEventDate;
    obj->_timerEventDate = 0LL;

    dispatch_source_cancel((dispatch_source_t)obj->_timer);
    uint64_t v4 = obj;
    timer = obj->_timer;
  }

  else
  {
    uint64_t v4 = obj;
  }

  v4->_timer = 0LL;

  objc_sync_exit(obj);
}

- (unint64_t)state
{
  return self->state;
}

- (void)setState:(unint64_t)a3
{
  self->state = a3;
}

- (WLKPlaybackSummary)lastSummary
{
  return (WLKPlaybackSummary *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setLastSummary:(id)a3
{
}

- (WLKTransactionScope)transaction
{
  return (WLKTransactionScope *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setTransaction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end