@interface SiriEyesFreePresentation
- ($C83F3EDC964651441187CDEAB72D1F66)keyboardInfoForSuggestionsController:(SEL)a3;
- (BOOL)hasContentAtPoint:(CGPoint)a3;
- (BOOL)shouldResumeInterruptedAudioPlayback;
- (BOOL)shouldUseEventDrivenIdleAndQuietUpdates;
- (BOOL)supportsTextInput;
- (BOOL)supportsVisualPresentationForConversationItem:(id)a3;
- (CGRect)statusBarFrameForSuggestionsViewController:(id)a3;
- (SRSuggestionsViewController)_siriUnavailableViewController;
- (SiriEyesFreePresentation)initWithCoder:(id)a3;
- (SiriEyesFreePresentation)initWithDelegate:(id)a3 dataSource:(id)a4;
- (SiriEyesFreePresentation)initWithNibName:(id)a3 bundle:(id)a4;
- (SiriEyesFreePresentation)initWithNibName:(id)a3 bundle:(id)a4 delegate:(id)a5 dataSource:(id)a6;
- (SiriUIPresentationDataSource)dataSource;
- (SiriUIPresentationDelegate)delegate;
- (double)_unlockTimeoutPeriodPlus:(double)a3;
- (double)contentWidthForSuggestionsViewController:(id)a3;
- (double)statusViewHeightForSuggestionsViewController:(id)a3;
- (id)siriEnabledAppListForSuggestionsController:(id)a3;
- (int64_t)options;
- (void)_cancelTimeout;
- (void)_didPresentItemsAtIndexPaths:(id)a3;
- (void)_dismissFromTimeoutAfterDelay:(double)a3;
- (void)_dismissSiriPresentationFromTimeout;
- (void)_synthesizeSpeechWithText:(id)a3;
- (void)configureForRequestOptions:(id)a3;
- (void)conversation:(id)a3 didInsertItemsAtIndexPaths:(id)a4;
- (void)conversation:(id)a3 didUpdateItemsAtIndexPaths:(id)a4;
- (void)delayDismissalAfterIdleFires:(id)a3;
- (void)didReceiveReportBugAction;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)siriDidHidePasscodeUnlock;
- (void)siriIsIdleAndQuietStatusDidChange:(BOOL)a3 isAttending:(BOOL)a4;
- (void)siriRequestWillStartWithRequestOptions:(id)a3;
- (void)siriWillShowPasscodeUnlockAndCancelRequest:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation SiriEyesFreePresentation

- (SiriEyesFreePresentation)initWithCoder:(id)a3
{
  return -[SiriEyesFreePresentation initWithNibName:bundle:delegate:dataSource:]( self,  "initWithNibName:bundle:delegate:dataSource:",  0LL,  0LL,  0LL,  0LL);
}

- (SiriEyesFreePresentation)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[SiriEyesFreePresentation initWithNibName:bundle:delegate:dataSource:]( self,  "initWithNibName:bundle:delegate:dataSource:",  a3,  a4,  0LL,  0LL);
}

- (SiriEyesFreePresentation)initWithDelegate:(id)a3 dataSource:(id)a4
{
  return -[SiriEyesFreePresentation initWithNibName:bundle:delegate:dataSource:]( self,  "initWithNibName:bundle:delegate:dataSource:",  0LL,  0LL,  a3,  a4);
}

- (SiriEyesFreePresentation)initWithNibName:(id)a3 bundle:(id)a4 delegate:(id)a5 dataSource:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___SiriEyesFreePresentation;
  v12 = -[SiriEyesFreePresentation initWithNibName:bundle:](&v17, "initWithNibName:bundle:", a3, a4);
  v13 = v12;
  if (v12)
  {
    -[SiriEyesFreePresentation setDelegate:](v12, "setDelegate:", v10);
    -[SiriEyesFreePresentation setDataSource:](v13, "setDataSource:", v11);
    v13->_numberOfSpeechRequestsWaitingToFinishSynthesis = 0LL;
    v14 = objc_alloc_init(&OBJC_CLASS___SRSuggestionsViewController);
    siriUnavailableViewController = v13->_siriUnavailableViewController;
    v13->_siriUnavailableViewController = v14;

    -[SRSuggestionsViewController setDelegate:](v13->_siriUnavailableViewController, "setDelegate:", v13);
  }

  return v13;
}

- (void)configureForRequestOptions:(id)a3
{
  id v4 = +[AFUISiriSession availabilityState](&OBJC_CLASS___AFUISiriSession, "availabilityState", a3);
  if (v4)
  {
    id v6 = v4;
    *(void *)&double v7 = objc_opt_class(self, v5).n128_u64[0];
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", v8, v7));
    if (v6 != (id)2)
    {
      id v17 = v9;
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SiriEyesFreePresentation _siriUnavailableViewController](self, "_siriUnavailableViewController"));
      [v10 showEmptyView];

      id v11 = (void *)objc_claimAutoreleasedReturnValue([v17 siriUILocalizedStringForKey:@"ASSISTANT_NOT_AVAILABLE_TITLE"]);
      -[SiriEyesFreePresentation _synthesizeSpeechWithText:](self, "_synthesizeSpeechWithText:", v11);

      if (v6 == (id)3)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
        unsigned int v15 = objc_msgSend(v14, "sf_isChinaRegionCellularDevice");

        if (v15) {
          v16 = @"ASSISTANT_NO_LOCAL_ASSETS_SUBTITLE_NOTIFICATION_CHINA";
        }
        else {
          v16 = @"ASSISTANT_NO_LOCAL_ASSETS_SUBTITLE_NOTIFICATION";
        }
        v13 = (void *)objc_claimAutoreleasedReturnValue([v17 siriUILocalizedStringForKey:v16]);
        goto LABEL_11;
      }

      v9 = v17;
      if (v6 == (id)1)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue( +[SiriUIUtilities deviceSpecificKeyForDefaultKey:]( &OBJC_CLASS___SiriUIUtilities,  "deviceSpecificKeyForDefaultKey:",  @"ASSISTANT_NO_NETWORK_SUBTITLE_NOTIFICATION"));
        v13 = (void *)objc_claimAutoreleasedReturnValue([v17 siriUILocalizedStringForKey:v12]);

LABEL_11:
        -[SiriEyesFreePresentation _synthesizeSpeechWithText:](self, "_synthesizeSpeechWithText:", v13);

        v9 = v17;
      }
    }
  }

- (int64_t)options
{
  return 1LL;
}

- (void)siriWillShowPasscodeUnlockAndCancelRequest:(BOOL)a3
{
  id v4 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    id v6 = "-[SiriEyesFreePresentation siriWillShowPasscodeUnlockAndCancelRequest:]";
    __int16 v7 = 2048;
    uint64_t v8 = 0x4020000000000000LL;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s #eyesfree Passcode screen is showing, will timeout in %f",  (uint8_t *)&v5,  0x16u);
  }

  -[SiriEyesFreePresentation _dismissFromTimeoutAfterDelay:](self, "_dismissFromTimeoutAfterDelay:", 8.0);
}

- (void)siriDidHidePasscodeUnlock
{
  v3 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    int v5 = "-[SiriEyesFreePresentation siriDidHidePasscodeUnlock]";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s #eyesfree Passcode screen did hide, canceling timeout.",  (uint8_t *)&v4,  0xCu);
  }

  -[SiriEyesFreePresentation _cancelTimeout](self, "_cancelTimeout");
}

- (void)_synthesizeSpeechWithText:(id)a3
{
  id v4 = a3;
  ++self->_numberOfSpeechRequestsWaitingToFinishSynthesis;
  objc_initWeak(&location, self);
  int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SiriEyesFreePresentation delegate](self, "delegate"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100043464;
  v6[3] = &unk_1000B9F38;
  objc_copyWeak(&v7, &location);
  [v5 siriPresentation:self synthesizeSpeechWithText:v4 completion:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)conversation:(id)a3 didInsertItemsAtIndexPaths:(id)a4
{
}

- (void)conversation:(id)a3 didUpdateItemsAtIndexPaths:(id)a4
{
}

- (void)_didPresentItemsAtIndexPaths:(id)a3
{
  id v4 = a3;
  int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SiriEyesFreePresentation dataSource](self, "dataSource"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 conversationIdentifiersForSiriPresentation:self]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 lastObject]);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SiriEyesFreePresentation dataSource](self, "dataSource"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 siriPresentation:self conversationWithIdentifier:v7]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v4 count]));
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
      unsigned int v15 = 0LL;
      do
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v9,  "itemAtIndexPath:",  *(void *)(*((void *)&v19 + 1) + 8 * (void)v15),  (void)v19));
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 identifier]);
        [v10 addObject:v17];

        unsigned int v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v13);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SiriEyesFreePresentation delegate](self, "delegate"));
  [v18 siriPresentation:self didPresentConversationItemsWithIdentifiers:v10];
}

- (BOOL)hasContentAtPoint:(CGPoint)a3
{
  return 0;
}

- (BOOL)supportsTextInput
{
  return 0;
}

- (BOOL)shouldResumeInterruptedAudioPlayback
{
  return 1;
}

- (BOOL)supportsVisualPresentationForConversationItem:(id)a3
{
  return 0;
}

- (void)siriRequestWillStartWithRequestOptions:(id)a3
{
}

- (void)didReceiveReportBugAction
{
  id v7 = [[SKIDirectInvocationPayload alloc] initWithIdentifier:@"com.apple.siri.directInvocation.RunVoiceShortcut.serverTriggeredAppShortcut"];
  [v7 setUserData:&off_1000BEE80];
  id v3 = objc_alloc_init(&OBJC_CLASS___SKIDirectInvocationContext);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SKIDirectInvocation runSiriKitExecutorCommandWithContext:payload:]( &OBJC_CLASS___SKIDirectInvocation,  "runSiriKitExecutorCommandWithContext:payload:",  v3,  v7));
  int v5 = (void *)objc_claimAutoreleasedReturnValue( +[SKIDirectInvocation wrapCommandInStartLocalRequest:]( &OBJC_CLASS___SKIDirectInvocation,  "wrapCommandInStartLocalRequest:",  v4));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SiriEyesFreePresentation delegate](self, "delegate"));
  [v6 siriPresentation:self handleStartLocalRequest:v5 turnIdentifier:0];
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___SiriEyesFreePresentation;
  -[SiriEyesFreePresentation viewDidLoad](&v12, "viewDidLoad");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SiriEyesFreePresentation _siriUnavailableViewController](self, "_siriUnavailableViewController"));
  -[SiriEyesFreePresentation addChildViewController:](self, "addChildViewController:", v3);
  [v3 didMoveToParentViewController:self];
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SiriEyesFreePresentation view](self, "view"));
  int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SiriEyesFreePresentation _siriUnavailableViewController](self, "_siriUnavailableViewController"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 view]);
  [v4 addSubview:v6];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SiriEyesFreePresentation _siriUnavailableViewController](self, "_siriUnavailableViewController"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 view]);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SiriEyesFreePresentation view](self, "view"));
  [v9 frame];
  objc_msgSend(v8, "setFrame:");

  if (+[AFUISiriSession availabilityState](&OBJC_CLASS___AFUISiriSession, "availabilityState") == (id)2)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle afui_assistantUIFrameworkBundle]( &OBJC_CLASS___NSBundle,  "afui_assistantUIFrameworkBundle"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 siriUILocalizedStringForKey:@"ASSISTANT_FIRST_UNLOCK_TITLE"]);

    -[SiriEyesFreePresentation _synthesizeSpeechWithText:](self, "_synthesizeSpeechWithText:", v11);
  }
}

- (CGRect)statusBarFrameForSuggestionsViewController:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SiriEyesFreePresentation delegate](self, "delegate", a3));
  [v4 statusBarFrameForSiriPresentation:self];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (double)statusViewHeightForSuggestionsViewController:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SiriEyesFreePresentation delegate](self, "delegate", a3));
  [v4 statusViewHeightForSiriPresentation:self];
  double v6 = v5;

  return v6;
}

- (double)contentWidthForSuggestionsViewController:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SiriEyesFreePresentation delegate](self, "delegate", a3));
  [v4 contentWidthForForSiriPresentation:self];
  double v6 = v5;

  return v6;
}

- ($C83F3EDC964651441187CDEAB72D1F66)keyboardInfoForSuggestionsController:(SEL)a3
{
  *(_WORD *)&retstr->var0 = 256;
  retstr->var2 = 0;
  CGSize size = CGRectZero.size;
  retstr->var3.origin = CGRectZero.origin;
  retstr->var3.CGSize size = size;
  retstr->var4 = 0.0;
  return self;
}

- (id)siriEnabledAppListForSuggestionsController:(id)a3
{
  return 0LL;
}

- (BOOL)shouldUseEventDrivenIdleAndQuietUpdates
{
  return 1;
}

- (void)siriIsIdleAndQuietStatusDidChange:(BOOL)a3 isAttending:(BOOL)a4
{
  BOOL v4 = a3;
  if (a3 && !self->_numberOfSpeechRequestsWaitingToFinishSynthesis)
  {
    delayDismissalMs = self->_delayDismissalMs;
    if (delayDismissalMs && -[NSNumber longValue](delayDismissalMs, "longValue") >= 1)
    {
      double v10 = (void *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        double v11 = self->_delayDismissalMs;
        double v12 = v10;
        int v15 = 136315394;
        double v16 = "-[SiriEyesFreePresentation siriIsIdleAndQuietStatusDidChange:isAttending:]";
        __int16 v17 = 2048;
        v18[0] = -[NSNumber longValue](v11, "longValue");
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s #autodismiss Siri is idle and quiet, but delaying dismissal for AutoSend for %ld milliseconds",  (uint8_t *)&v15,  0x16u);
      }

      double v13 = (double)-[NSNumber longValue](self->_delayDismissalMs, "longValue") / 1000.0;
    }

    else
    {
      double v14 = (os_log_s *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 136315138;
        double v16 = "-[SiriEyesFreePresentation siriIsIdleAndQuietStatusDidChange:isAttending:]";
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s #autodismiss Siri is idle and quiet. Dismissing immediately.",  (uint8_t *)&v15,  0xCu);
      }

      double v13 = 0.0;
    }

    -[SiriEyesFreePresentation _dismissFromTimeoutAfterDelay:](self, "_dismissFromTimeoutAfterDelay:", v13);
  }

  else
  {
    double v6 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t numberOfSpeechRequestsWaitingToFinishSynthesis = self->_numberOfSpeechRequestsWaitingToFinishSynthesis;
      int v15 = 136315650;
      double v16 = "-[SiriEyesFreePresentation siriIsIdleAndQuietStatusDidChange:isAttending:]";
      __int16 v17 = 1024;
      LODWORD(v18[0]) = v4;
      WORD2(v18[0]) = 2048;
      *(void *)((char *)v18 + 6) = numberOfSpeechRequestsWaitingToFinishSynthesis;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s #autodismiss Not dismissing and cancelling any previous ones, because we have either siriIsIdleAndQuiet %d, o r %ld presentation generated speech requests in progress.",  (uint8_t *)&v15,  0x1Cu);
    }

    -[SiriEyesFreePresentation _cancelTimeout](self, "_cancelTimeout");
  }

  double v8 = self->_delayDismissalMs;
  self->_delayDismissalMs = 0LL;
}

- (void)delayDismissalAfterIdleFires:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    double v6 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      double v7 = v6;
      int v8 = 136315394;
      double v9 = "-[SiriEyesFreePresentation delayDismissalAfterIdleFires:]";
      __int16 v10 = 2048;
      id v11 = [v5 longValue];
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s #autodismiss Setting delay dismissal for auto send by %ld milliseconds.",  (uint8_t *)&v8,  0x16u);
    }

    objc_storeStrong((id *)&self->_delayDismissalMs, a3);
  }
}

- (void)_dismissFromTimeoutAfterDelay:(double)a3
{
}

- (void)_dismissSiriPresentationFromTimeout
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SiriEyesFreePresentation delegate](self, "delegate"));
  [v3 dismissSiriPresentation:self withReason:4];
}

- (void)_cancelTimeout
{
  id v3 = (void *)objc_opt_class(self, a2);
  _[v3 cancelPreviousPerformRequestsWithTarget:self selector:"_dismissSiriPresentationFromTimeout" object:0];
}

- (double)_unlockTimeoutPeriodPlus:(double)a3
{
  return a3 + 8.0;
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

- (void)setDelegate:(id)a3
{
}

- (SRSuggestionsViewController)_siriUnavailableViewController
{
  return self->_siriUnavailableViewController;
}

- (void).cxx_destruct
{
}

@end