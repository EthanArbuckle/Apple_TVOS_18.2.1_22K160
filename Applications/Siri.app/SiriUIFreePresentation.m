@interface SiriUIFreePresentation
- (BOOL)shouldDismissForIdling;
- (BOOL)shouldResumeInterruptedAudioPlaybackForAttendingState:(BOOL)a3;
- (BOOL)supportsVisualPresentationForConversationItem:(id)a3;
- (SiriUIFreePresentation)initWithDelegate:(id)a3 dataSource:(id)a4;
- (SiriUIFreePresentation)initWithNibName:(id)a3 bundle:(id)a4 delegate:(id)a5 dataSource:(id)a6;
- (SiriUIPresentationDataSource)dataSource;
- (SiriUIPresentationDelegate)delegate;
- (double)idleTimerInterval;
- (int64_t)options;
- (void)_didPresentItemsAtIndexPaths:(id)a3;
- (void)conversation:(id)a3 didInsertItemsAtIndexPaths:(id)a4;
- (void)conversation:(id)a3 didUpdateItemsAtIndexPaths:(id)a4;
- (void)handleRequestEndBehavior:(id)a3 isAttending:(BOOL)a4;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setShouldSuppressErrorTTS:(BOOL)a3;
- (void)siriDidActivateFromSource:(int64_t)a3;
- (void)siriDidDeactivate;
- (void)siriDidTransitionFromState:(int64_t)a3 event:(int64_t)a4;
- (void)siriRequestWillStartWithRequestOptions:(id)a3;
@end

@implementation SiriUIFreePresentation

- (SiriUIFreePresentation)initWithDelegate:(id)a3 dataSource:(id)a4
{
  return -[SiriUIFreePresentation initWithNibName:bundle:delegate:dataSource:]( self,  "initWithNibName:bundle:delegate:dataSource:",  0LL,  0LL,  a3,  a4);
}

- (SiriUIFreePresentation)initWithNibName:(id)a3 bundle:(id)a4 delegate:(id)a5 dataSource:(id)a6
{
  id v8 = a5;
  id v9 = a6;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___SiriUIFreePresentation;
  v10 = -[SiriUIFreePresentation init](&v13, "init");
  v11 = v10;
  if (v10)
  {
    -[SiriUIFreePresentation setDelegate:](v10, "setDelegate:", v8);
    -[SiriUIFreePresentation setDataSource:](v11, "setDataSource:", v9);
    v11->_idleTimeoutInSec = 9.0;
  }

  return v11;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    v5 = obj;
    if (!self->_hasReportedPresentation)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[SiriUIFreePresentation delegate](self, "delegate"));
      [v6 siriPresentationDidPresentUserInterface:self];

      v5 = obj;
      self->_hasReportedPresentation = 1;
    }
  }
}

- (void)siriDidActivateFromSource:(int64_t)a3
{
  id v6 = +[AFUISiriSession availabilityState](&OBJC_CLASS___AFUISiriSession, "availabilityState");
  if (v6 && !self->_shouldSuppressErrorTTS)
  {
    *(void *)&double v9 = objc_opt_class(self, v5).n128_u64[0];
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", v10, v9));
    v12 = v11;
    if (v6 == (id)2)
    {
      objc_super v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle afui_assistantUIFrameworkBundle]( &OBJC_CLASS___NSBundle,  "afui_assistantUIFrameworkBundle"));
      uint64_t v14 = objc_claimAutoreleasedReturnValue( [v13 siriUILocalizedStringForKey:@"ASSISTANT_FIRST_UNLOCK_TITLE" value:@"Enter Passcode to Use Siri" table:0]);
    }

    else
    {
      objc_super v13 = (void *)objc_claimAutoreleasedReturnValue([v11 siriUILocalizedStringForKey:@"ASSISTANT_NOT_AVAILABLE_TITLE"]);
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[SiriUIFreePresentation delegate](self, "delegate"));
      [v15 siriPresentation:self synthesizeSpeechWithText:v13 completion:0];

      if (v6 == (id)3)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
        unsigned int v18 = objc_msgSend(v17, "sf_isChinaRegionCellularDevice");

        if (v18) {
          v16 = @"ASSISTANT_NO_LOCAL_ASSETS_SUBTITLE_NOTIFICATION_CHINA";
        }
        else {
          v16 = @"ASSISTANT_NO_LOCAL_ASSETS_SUBTITLE_NOTIFICATION";
        }
      }

      else
      {
        if (v6 != (id)1)
        {
LABEL_15:
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[SiriUIFreePresentation delegate](self, "delegate"));
          [v20 siriPresentation:self synthesizeSpeechWithText:v13 completion:0];

          goto LABEL_16;
        }

        v16 = @"ASSISTANT_NO_NETWORK_SUBTITLE";
      }

      uint64_t v14 = objc_claimAutoreleasedReturnValue([v12 siriUILocalizedStringForKey:v16]);
    }

    v19 = (void *)v14;

    objc_super v13 = v19;
    goto LABEL_15;
  }

  v7 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    BOOL shouldSuppressErrorTTS = self->_shouldSuppressErrorTTS;
    int v22 = 136315906;
    v23 = "-[SiriUIFreePresentation siriDidActivateFromSource:]";
    __int16 v24 = 2048;
    int64_t v25 = a3;
    __int16 v26 = 2048;
    id v27 = v6;
    __int16 v28 = 1024;
    BOOL v29 = shouldSuppressErrorTTS;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s Suppressing error TTS. source : %ld, availability : %lu, _shouldSuppressErrorTTS : %d",  (uint8_t *)&v22,  0x26u);
  }

- (void)siriRequestWillStartWithRequestOptions:(id)a3
{
  self->_shouldResumeMediaOnIdle = 0;
  id v4 = [a3 requestSource];
  if (v4 == (id)42 || v4 == (id)26)
  {
    uint64_t v5 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315394;
      v7 = "-[SiriUIFreePresentation siriRequestWillStartWithRequestOptions:]";
      __int16 v8 = 2048;
      uint64_t v9 = 0x4000000000000000LL;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s #uifree Adjusting ui free idle timer to %f seconds for user interaction request source",  (uint8_t *)&v6,  0x16u);
    }

    self->_idleTimeoutInSec = 2.0;
  }

  self->_shouldPauseAutoDismissal = 0;
}

- (void)siriDidDeactivate
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SiriUIFreePresentation delegate](self, "delegate"));
  [v3 disableIdleTimerForSiriPresentation:self];
}

- (void)conversation:(id)a3 didInsertItemsAtIndexPaths:(id)a4
{
  id v5 = a4;
  int v6 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    __int16 v8 = "-[SiriUIFreePresentation conversation:didInsertItemsAtIndexPaths:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v7, 0xCu);
  }

  -[SiriUIFreePresentation _didPresentItemsAtIndexPaths:](self, "_didPresentItemsAtIndexPaths:", v5);
}

- (void)conversation:(id)a3 didUpdateItemsAtIndexPaths:(id)a4
{
}

- (void)_didPresentItemsAtIndexPaths:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SiriUIFreePresentation dataSource](self, "dataSource"));
  int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 conversationIdentifiersForSiriPresentation:self]);
  int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 lastObject]);

  __int16 v8 = (void *)objc_claimAutoreleasedReturnValue(-[SiriUIFreePresentation dataSource](self, "dataSource"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 siriPresentation:self conversationWithIdentifier:v7]);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v4 count]));
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v11 = v4;
  id v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      v15 = 0LL;
      do
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v9,  "itemAtIndexPath:",  *(void *)(*((void *)&v19 + 1) + 8 * (void)v15),  (void)v19));
        v17 = (void *)objc_claimAutoreleasedReturnValue([v16 identifier]);
        [v10 addObject:v17];

        v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v13);
  }

  unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(-[SiriUIFreePresentation delegate](self, "delegate"));
  [v18 siriPresentation:self didPresentConversationItemsWithIdentifiers:v10];
}

- (double)idleTimerInterval
{
  return self->_idleTimeoutInSec;
}

- (void)handleRequestEndBehavior:(id)a3 isAttending:(BOOL)a4
{
  id v5 = a3;
  if ([v5 premptivelyResumeMedia])
  {
    int v6 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315138;
      uint64_t v14 = "-[SiriUIFreePresentation handleRequestEndBehavior:isAttending:]";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s Presentation will resume media on idle",  (uint8_t *)&v13,  0xCu);
    }

    self->_shouldResumeMediaOnIdle = 1;
  }

  int v7 = (void *)objc_claimAutoreleasedReturnValue([v5 minimumAutoDismissalTimeInMs]);

  if (v7)
  {
    __int16 v8 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = v8;
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 minimumAutoDismissalTimeInMs]);
      id v11 = [v10 longValue];
      int v13 = 136315394;
      uint64_t v14 = "-[SiriUIFreePresentation handleRequestEndBehavior:isAttending:]";
      __int16 v15 = 2048;
      id v16 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s #autodismiss Setting delay dismissal for ui free presentation by %ld milliseconds.",  (uint8_t *)&v13,  0x16u);
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 minimumAutoDismissalTimeInMs]);
    self->_idleTimeoutInSec = (double)(uint64_t)[v12 longValue] / 1000.0;
  }
}

- (BOOL)shouldResumeInterruptedAudioPlaybackForAttendingState:(BOOL)a3
{
  return self->_shouldResumeMediaOnIdle;
}

- (void)siriDidTransitionFromState:(int64_t)a3 event:(int64_t)a4
{
  switch(a4)
  {
    case 13LL:
      int v6 = (os_log_s *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 136315138;
        uint64_t v10 = "-[SiriUIFreePresentation siriDidTransitionFromState:event:]";
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s #uifree Speech was mitigated as side speech, dismissing",  (uint8_t *)&v9,  0xCu);
      }

      self->_shouldPauseAutoDismissal = 0;
      int v7 = (void *)objc_claimAutoreleasedReturnValue(-[SiriUIFreePresentation delegate](self, "delegate"));
      [v7 dismissSiriPresentation:self withReason:46];

      break;
    case 12LL:
      __int16 v8 = (os_log_s *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 136315138;
        uint64_t v10 = "-[SiriUIFreePresentation siriDidTransitionFromState:event:]";
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s #uifree Speech directed siri speech detected, unpausing auto dismissal",  (uint8_t *)&v9,  0xCu);
      }

      self->_shouldPauseAutoDismissal = 0;
      break;
    case 11LL:
      id v5 = (os_log_s *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 136315138;
        uint64_t v10 = "-[SiriUIFreePresentation siriDidTransitionFromState:event:]";
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s #uifree Speech start detected, pausing auto dismissal",  (uint8_t *)&v9,  0xCu);
      }

      self->_shouldPauseAutoDismissal = 1;
      break;
  }

- (BOOL)shouldDismissForIdling
{
  return !self->_shouldPauseAutoDismissal;
}

- (void)setShouldSuppressErrorTTS:(BOOL)a3
{
  self->_BOOL shouldSuppressErrorTTS = a3;
}

- (int64_t)options
{
  return 4LL;
}

- (BOOL)supportsVisualPresentationForConversationItem:(id)a3
{
  return 0;
}

- (SiriUIPresentationDataSource)dataSource
{
  return (SiriUIPresentationDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
}

- (SiriUIPresentationDelegate)delegate
{
  return (SiriUIPresentationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
}

@end