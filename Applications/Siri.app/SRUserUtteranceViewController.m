@interface SRUserUtteranceViewController
- (AFUserUtterance)_userUtterance;
- (BOOL)editableTextViewTextShouldPreventCorrection:(id)a3;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (NSString)description;
- (double)_insertionAnimatedZPosition;
- (double)_scaledPaddingForPadding:(double)a3;
- (double)baselineOffsetFromBottom;
- (double)desiredHeightForWidth:(double)a3;
- (double)desiredPinnedTopPadding;
- (id)_correctionIdentifier;
- (id)_processUserUtterance:(id)a3 isCombined:(BOOL)a4 displayedText:(id)a5 withScore:(BOOL)a6;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)speechAlternativeHighlightListWithScore:(BOOL)a3;
- (id)userSelectionResults:(id)a3;
- (int64_t)_insertionAnimation;
- (int64_t)_pinAnimationType;
- (int64_t)_replacementAnimation;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)_checkUpdatedSizingForEditableTextView:(id)a3;
- (void)_createSpeechAlternativeViewsIfNecessary;
- (void)_hideEditableUtteranceView;
- (void)_setUserUtterance:(id)a3;
- (void)_updateViewWithChangeUtteranceIfNeeded:(id)a3;
- (void)_updateViewWithUserUtterance:(id)a3;
- (void)_utteranceViewDidSelect:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)createEditableUtteranceView;
- (void)createViewArray;
- (void)editableTextViewRequestKeyboardForTapToEditWithCompletion:(id)a3;
- (void)editableTextViewTextDidChange:(id)a3;
- (void)editableTextViewTextDidFinishCorrecting:(id)a3;
- (void)editableTextViewTextDidResignFirstResponder:(id)a3;
- (void)editableTextViewTextWillBeginCorrecting:(id)a3;
- (void)endEditingAndCorrect:(BOOL)a3;
- (void)endEditingAndCorrectByTouchPoint:(CGPoint)a3;
- (void)handleAceCommand:(id)a3;
- (void)handleChangeUtteranceCommand:(id)a3;
- (void)handleSelectRow:(int64_t)a3;
- (void)handleShowSpeechAlternativesCommand:(id)a3;
- (void)loadView;
- (void)removeSpeechAlternativeViewAndUpdateUtteranceTextIfNecessary;
- (void)removeSpeechAlternatives;
- (void)restoreOriginalEditTextContents:(id)a3;
- (void)setAceObject:(id)a3;
- (void)setTurnIdentifier:(id)a3;
- (void)setUtteranceUserInteractionEnabled:(BOOL)a3;
- (void)siriDidDeactivate;
- (void)viewDidLayoutSubviews;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SRUserUtteranceViewController

- (void)loadView
{
  if (!self->_utteranceView)
  {
    v3 = -[SRUserUtteranceView initWithFrame:]( objc_alloc(&OBJC_CLASS___SRUserUtteranceView),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
    utteranceView = self->_utteranceView;
    self->_utteranceView = v3;

    -[SRUserUtteranceView setEditable:](self->_utteranceView, "setEditable:", 1LL);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _userUtterance](self, "_userUtterance"));
    -[SRUserUtteranceViewController _updateViewWithUserUtterance:](self, "_updateViewWithUserUtterance:", v5);

    v6 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_utteranceViewDidSelect:");
    tapRecognizer = self->_tapRecognizer;
    self->_tapRecognizer = v6;

    -[SRUserUtteranceView addGestureRecognizer:](self->_utteranceView, "addGestureRecognizer:", self->_tapRecognizer);
    v8 = objc_alloc_init(&OBJC_CLASS___SRUserUtteranceContainerView);
    containerView = self->_containerView;
    self->_containerView = v8;

    -[SRUserUtteranceContainerView addSubview:](self->_containerView, "addSubview:", self->_utteranceView);
    -[SRUserUtteranceContainerView setDisplayView:](self->_containerView, "setDisplayView:", self->_utteranceView);
    -[SRUserUtteranceViewController setView:](self, "setView:", self->_containerView);
  }

- (void)viewWillLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___SRUserUtteranceViewController;
  -[SRUserUtteranceViewController viewWillLayoutSubviews](&v14, "viewWillLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController view](self, "view"));
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  double v9 = v8;
  double v11 = v10;

  if (self->_previousBounds.size.width != v9 || self->_previousBounds.size.height != v11)
  {
    if (self->_needsToInvalidateCollectionViewLayoutOnViewWillLayoutSubviews)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue( -[UICollectionView collectionViewLayout]( self->_speechAlternativeCollectionView,  "collectionViewLayout"));
      [v13 invalidateLayout];
    }

    self->_needsToInvalidateCollectionViewLayoutOnViewWillLayoutSubviews = 1;
    self->_previousBounds.origin.x = v5;
    self->_previousBounds.origin.y = v7;
    self->_previousBounds.size.width = v9;
    self->_previousBounds.size.height = v11;
  }

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController view](self, "view"));
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;

  if (v10 != width || v12 != height)
  {
    self->_needsToInvalidateCollectionViewLayoutOnViewWillLayoutSubviews = 0;
    objc_super v14 = (void *)objc_claimAutoreleasedReturnValue( -[UICollectionView collectionViewLayout]( self->_speechAlternativeCollectionView,  "collectionViewLayout"));
    [v14 invalidateLayout];

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000FC28;
    block[3] = &unk_1000BA078;
    block[4] = self;
    dispatch_async(&_dispatch_main_q, block);
  }

  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___SRUserUtteranceViewController;
  -[SRUserUtteranceViewController viewWillTransitionToSize:withTransitionCoordinator:]( &v15,  "viewWillTransitionToSize:withTransitionCoordinator:",  v7,  width,  height);
}

- (void)viewDidLayoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___SRUserUtteranceViewController;
  -[SRUserUtteranceViewController viewDidLayoutSubviews](&v15, "viewDidLayoutSubviews");
  -[SRUserUtteranceView frame](self->_utteranceView, "frame");
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  if (self->_oldUtteranceViewSize.width != v3 || self->_oldUtteranceViewSize.height != v4)
  {
    CGFloat v10 = v3;
    CGFloat v11 = v4;
    double v12 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController delegate](self, "delegate"));
    [v12 siriViewControllerHeightDidChange:self];

    v16.origin.x = v6;
    v16.origin.y = v8;
    v16.size.double width = v10;
    v16.size.double height = v11;
    CGFloat Width = CGRectGetWidth(v16);
    v17.origin.x = v6;
    v17.origin.y = v8;
    v17.size.double width = v10;
    v17.size.double height = v11;
    CGFloat Height = CGRectGetHeight(v17);
    self->_oldUtteranceViewSize.double width = Width;
    self->_oldUtteranceViewSize.double height = Height;
  }

- (void)_updateViewWithUserUtterance:(id)a3
{
  utteranceView = self->_utteranceView;
  id v5 = a3;
  CGFloat v6 = (void *)objc_claimAutoreleasedReturnValue([v5 bestTextInterpretation]);
  -[SRUserUtteranceView setText:](utteranceView, "setText:", v6);

  id v9 = (id)objc_claimAutoreleasedReturnValue([v5 allPhrases]);
  if (v9)
  {
    self->_changeUtteranceShouldDisplay = 1;
    self->_receivedFinalRecognitionResult = 1;
    -[SRUserUtteranceViewController _updateViewWithChangeUtteranceIfNeeded:]( self,  "_updateViewWithChangeUtteranceIfNeeded:",  self->_changeUtteranceCommand);
    if (self->_editableUtteranceView)
    {
      double v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _userUtterance](self, "_userUtterance"));
      -[SRUserUtteranceViewController restoreOriginalEditTextContents:](self, "restoreOriginalEditTextContents:", v7);
    }

    else
    {
      -[SRUserUtteranceViewController createEditableUtteranceView](self, "createEditableUtteranceView");
    }

    -[SRUserUtteranceView setBlendEffectEnabled:](self->_utteranceView, "setBlendEffectEnabled:", 1LL);
    CGFloat v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController delegate](self, "delegate"));
    [v8 siriViewControllerHeightDidChange:self];
  }
}

- (void)_updateViewWithChangeUtteranceIfNeeded:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (self->_changeUtteranceShouldDisplay)
    {
      id v10 = v4;
      uint64_t v5 = (uint64_t)[v4 utteranceIndex];
      id v4 = v10;
      if (v5 >= 1)
      {
        CGFloat v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _userUtterance](self, "_userUtterance"));
        id v7 = [v6 numberOfAlternativeUtterances];

        id v4 = v10;
        if (v5 < (uint64_t)v7)
        {
          CGFloat v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _userUtterance](self, "_userUtterance"));
          id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 textOfUtteranceAtIndex:v5]);

          -[SRUserUtteranceView setText:](self->_utteranceView, "setText:", v9);
          id v4 = v10;
        }
      }
    }
  }
}

- (void)setUtteranceUserInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SRUserUtteranceViewController;
  -[SRUserUtteranceViewController setUtteranceUserInteractionEnabled:](&v8, "setUtteranceUserInteractionEnabled:");
  BOOL v5 = !v3;
  -[SRUserUtteranceView setChevronHidden:](self->_utteranceView, "setChevronHidden:", v5);
  utteranceView = self->_utteranceView;
  tapRecognizer = self->_tapRecognizer;
  if (v5) {
    -[SRUserUtteranceView removeGestureRecognizer:](utteranceView, "removeGestureRecognizer:", tapRecognizer);
  }
  else {
    -[SRUserUtteranceView addGestureRecognizer:](utteranceView, "addGestureRecognizer:", tapRecognizer);
  }
}

- (NSString)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SRUserUtteranceViewController;
  BOOL v3 = -[SRUserUtteranceViewController description](&v8, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _userUtterance](self, "_userUtterance"));
  CGFloat v6 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingFormat:@"%@", v5]);

  return (NSString *)v6;
}

- (void)_setUserUtterance:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v7 = v5;
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _userUtterance](self, "_userUtterance"));

    id v5 = v7;
    if (v6 != v7)
    {
      self->_forceBestTextInterpretation = 0;
      -[SRUserUtteranceViewController _updateViewWithUserUtterance:](self, "_updateViewWithUserUtterance:", v7);
      objc_storeStrong((id *)&self->_userUtterance, a3);
      id v5 = v7;
    }
  }
}

- (id)_correctionIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _userUtterance](self, "_userUtterance"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 correctionIdentifier]);

  return v3;
}

- (double)desiredHeightForWidth:(double)a3
{
  self->_latestGivenCGFloat Width = a3;
  if (self->_showSpeechAlternativeList) {
    -[SiriUICollectionViewFlowLayout collectionViewContentSize]( self->_speechAlternativeCollectionViewLayout,  "collectionViewContentSize");
  }
  else {
    -[SRUserUtteranceView sizeThatFits:](self->_utteranceView, "sizeThatFits:");
  }
  return v3;
}

- (void)removeSpeechAlternatives
{
  speechAlternativeDisplayList = self->_speechAlternativeDisplayList;
  self->_speechAlternativeDisplayList = (NSArray *)&__NSArray0__struct;

  -[NSMutableArray removeAllObjects](self->_speechAlternativeList, "removeAllObjects");
  -[SRUserUtteranceViewController createViewArray](self, "createViewArray");
  id v4 = -[UICollectionView reloadData](self->_speechAlternativeCollectionView, "reloadData");
  -[UICollectionView recursive_setSemanticContentAttribute:]( self->_speechAlternativeCollectionView,  "recursive_setSemanticContentAttribute:",  SiriLanguageSemanticContentAttribute(v4, v5));
}

- (void)removeSpeechAlternativeViewAndUpdateUtteranceTextIfNecessary
{
  self->_showSpeechAlternativeList = 0;
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController delegate](self, "delegate"));
  [v3 siriViewControllerHeightDidChange:self pinTopOfSnippet:1];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _privateDelegate](self, "_privateDelegate"));
  [v4 siriViewControllerRequestToPin:self];

  if (self->_textChanged)
  {
    -[SRUserUtteranceViewController removeSpeechAlternatives](self, "removeSpeechAlternatives");
  }

  else
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _userUtterance](self, "_userUtterance"));
    -[SRUserUtteranceViewController restoreOriginalEditTextContents:](self, "restoreOriginalEditTextContents:", v5);

    utteranceView = self->_utteranceView;
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[SREditableTextView text](self->_editableUtteranceView, "text"));
    -[SRUserUtteranceView setText:](utteranceView, "setText:", v7);
  }

- (void)handleAceCommand:(id)a3
{
  id v9 = a3;
  objc_opt_class(&OBJC_CLASS___SAUIChangePrimaryUtterance, v5);
  if ((objc_opt_isKindOfClass(v9, v6) & 1) != 0)
  {
    objc_storeStrong((id *)&self->_changeUtteranceCommand, a3);
    -[SRUserUtteranceViewController handleChangeUtteranceCommand:]( self,  "handleChangeUtteranceCommand:",  self->_changeUtteranceCommand);
  }

  else
  {
    objc_opt_class(&OBJC_CLASS___SAUIShowSpeechAlternatives, v7);
    if ((objc_opt_isKindOfClass(v9, v8) & 1) != 0) {
      -[SRUserUtteranceViewController handleShowSpeechAlternativesCommand:]( self,  "handleShowSpeechAlternativesCommand:",  v9);
    }
  }
}

- (void)setTurnIdentifier:(id)a3
{
}

- (void)handleShowSpeechAlternativesCommand:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _userUtterance](self, "_userUtterance", a3));
  -[SRUserUtteranceViewController restoreOriginalEditTextContents:](self, "restoreOriginalEditTextContents:", v4);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView window](self->_speechAlternativeCollectionView, "window"));
  if (v5) {
    -[SREditableTextView beginEditing](self->_editableUtteranceView, "beginEditing");
  }
  else {
    -[SRUserUtteranceViewController _utteranceViewDidSelect:](self, "_utteranceViewDidSelect:", self->_utteranceView);
  }
}

- (void)handleChangeUtteranceCommand:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 136315394;
    v26 = "-[SRUserUtteranceViewController handleChangeUtteranceCommand:]";
    __int16 v27 = 2112;
    id v28 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s handleChangeUtteranceCommand: %@",  (uint8_t *)&v25,  0x16u);
  }

  if (self->_receivedFinalRecognitionResult)
  {
    changeUtteranceCommand = (SAUIChangePrimaryUtterance *)v4;
    uint64_t v7 = (uint64_t)-[SAUIChangePrimaryUtterance utteranceIndex](changeUtteranceCommand, "utteranceIndex");
    if (v7 >= 1)
    {
      uint64_t v8 = v7;
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _userUtterance](self, "_userUtterance"));
      id v10 = [v9 numberOfAlternativeUtterances];

      if (v8 < (uint64_t)v10)
      {
        self->_forceBestTextInterpretation = 1;
        CGFloat v11 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _userUtterance](self, "_userUtterance"));
        double v12 = (void *)objc_claimAutoreleasedReturnValue([v11 dictationResult]);

        v13 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _userUtterance](self, "_userUtterance"));
        id v14 = [v13 updateDictationResult:v12 withAlternativeUtteranceAtIndex:v8];

        id v15 = -[SRUserUtteranceViewController speechAlternativeHighlightListWithScore:]( self,  "speechAlternativeHighlightListWithScore:",  SiriUIShowSpeechAlternativeScore());
        CGRect v16 = (NSArray *)objc_claimAutoreleasedReturnValue(v15);
        speechAlternativeDisplayList = self->_speechAlternativeDisplayList;
        self->_speechAlternativeDisplayList = v16;

        -[SRUserUtteranceViewController createViewArray](self, "createViewArray");
        id v18 = -[UICollectionView reloadData](self->_speechAlternativeCollectionView, "reloadData");
        -[UICollectionView recursive_setSemanticContentAttribute:]( self->_speechAlternativeCollectionView,  "recursive_setSemanticContentAttribute:",  SiriLanguageSemanticContentAttribute(v18, v19));
        utteranceView = self->_utteranceView;
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[SREditableTextView text](self->_editableUtteranceView, "text"));
        -[SRUserUtteranceView setText:](utteranceView, "setText:", v21);

        -[SRUserUtteranceView setNeedsLayout](self->_utteranceView, "setNeedsLayout");
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController delegate](self, "delegate"));
        [v22 siriViewControllerHeightDidChange:self];

        v23 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController view](self, "view"));
        [v23 setNeedsLayout];
      }
    }
  }

  else
  {
    v24 = (SAUIChangePrimaryUtterance *)v4;
    changeUtteranceCommand = self->_changeUtteranceCommand;
    self->_changeUtteranceCommand = v24;
  }
}

- (void)setAceObject:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___SRUserUtteranceViewController;
  -[SRUserUtteranceViewController setAceObject:](&v34, "setAceObject:", v4);
  objc_opt_class(&OBJC_CLASS___SASSpeechRecognized, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    id v8 = v4;
    id v9 = (AFUserUtterance *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "af_userUtteranceValue"));
    id v10 = (NSString *)objc_claimAutoreleasedReturnValue([v8 title]);
    speechAlternativeListTitle = self->_speechAlternativeListTitle;
    self->_speechAlternativeListTitle = v10;

    if (!self->_speechAlternativeListTitle)
    {
      *(void *)&double v13 = objc_opt_class(self, v12).n128_u64[0];
      id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", v14, v13));
      CGRect v16 = (void *)objc_claimAutoreleasedReturnValue( [v15 siriUILocalizedStringForKey:@"TITLE_FOR_SPEECH_ALTERNATIVE_LIST" table:0]);
      CGRect v17 = objc_alloc(&OBJC_CLASS___NSLocale);
      uint64_t v18 = AFUIGetLanguageCode();
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      v20 = -[NSLocale initWithLocaleIdentifier:](v17, "initWithLocaleIdentifier:", v19);
      v21 = (NSString *)objc_claimAutoreleasedReturnValue([v16 uppercaseStringWithLocale:v20]);
      v22 = self->_speechAlternativeListTitle;
      self->_speechAlternativeListTitle = v21;
    }

    v23 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    alternativeInfoMap = self->_alternativeInfoMap;
    self->_alternativeInfoMap = v23;

    int v25 = (NSString *)objc_claimAutoreleasedReturnValue([v8 sessionId]);
    sessionId = self->_sessionId;
    self->_sessionId = v25;

    if (AFIsInternalInstall())
    {
      v35 = @"bestTextInterpretation";
      __int16 v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "af_bestTextInterpretation"));
      v36 = v27;
      id v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v36,  &v35,  1LL));
    }

    else
    {
      id v28 = 0LL;
    }

    v31 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
    [v31 logEventWithType:1507 context:v28];

LABEL_12:
    goto LABEL_13;
  }

  objc_opt_class(&OBJC_CLASS___SASSpeechPartialResult, v7);
  if ((objc_opt_isKindOfClass(v4, v29) & 1) == 0)
  {
    objc_opt_class(&OBJC_CLASS___SAUIUserUtteranceView, v30);
    if ((objc_opt_isKindOfClass(v4, v32) & 1) == 0)
    {
      id v9 = 0LL;
      goto LABEL_13;
    }

    id v8 = (id)objc_claimAutoreleasedReturnValue([v4 text]);
    id v9 = -[AFUserUtterance initWithString:correctionIdentifier:]( objc_alloc(&OBJC_CLASS___AFUserUtterance),  "initWithString:correctionIdentifier:",  v8,  0LL);
    goto LABEL_12;
  }

  id v9 = (AFUserUtterance *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "af_userUtteranceValue"));
LABEL_13:
  -[SRUserUtteranceViewController _setUserUtterance:](self, "_setUserUtterance:", v9);
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _userUtterance](self, "_userUtterance"));
  -[SRUserUtteranceViewController _updateViewWithUserUtterance:](self, "_updateViewWithUserUtterance:", v33);
}

- (double)desiredPinnedTopPadding
{
  if ((SiriUIIsCompactWidth(self, a2) & 1) != 0)
  {
    -[SRUserUtteranceViewController _scaledPaddingForPadding:](self, "_scaledPaddingForPadding:", 52.0);
  }

  else
  {
    int v4 = SiriUIIsCompactHeight();
    double v5 = 84.0;
    if (v4) {
      double v5 = 52.0;
    }
    -[SRUserUtteranceViewController _scaledPaddingForPadding:](self, "_scaledPaddingForPadding:", v5);
  }

  return result;
}

- (double)_scaledPaddingForPadding:(double)a3
{
  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont siriui_userUtteranceFont](&OBJC_CLASS___UIFont, "siriui_userUtteranceFont"));
  [v5 _scaledValueForValue:a3];
  double v7 = v6;

  -[SRUserUtteranceContainerView firstLineBaselineOffsetFromTop](self->_containerView, "firstLineBaselineOffsetFromTop");
  return v7 - v8;
}

- (double)baselineOffsetFromBottom
{
  return result;
}

- (void)endEditingAndCorrect:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[SREditableTextView window](self->_editableUtteranceView, "window"));

  if (v5) {
    -[SREditableTextView endEditingAndCorrect:](self->_editableUtteranceView, "endEditingAndCorrect:", v3);
  }
  if (!v3)
  {
    self->_showSpeechAlternativeList = 0;
    -[SRUserUtteranceViewController _hideEditableUtteranceView](self, "_hideEditableUtteranceView");
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _privateDelegate](self, "_privateDelegate"));
    [v6 siriViewControllerRequestTearDownEditingViewController:self];
  }

- (void)endEditingAndCorrectByTouchPoint:(CGPoint)a3
{
  int v4 = (void *)objc_claimAutoreleasedReturnValue( -[UICollectionView hitTest:withEvent:]( self->_speechAlternativeCollectionView,  "hitTest:withEvent:",  0LL,  a3.x,  a3.y));
  double v5 = v4;
  uint64_t v14 = 0LL;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
  if (v4)
  {
    viewArray = self->_viewArray;
    double v8 = _NSConcreteStackBlock;
    uint64_t v9 = 3221225472LL;
    id v10 = sub_100010BCC;
    CGFloat v11 = &unk_1000BA130;
    id v12 = v4;
    double v13 = &v14;
    -[NSMutableArray enumerateObjectsUsingBlock:](viewArray, "enumerateObjectsUsingBlock:", &v8);
  }

  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _privateDelegate](self, "_privateDelegate", v8, v9, v10, v11));
  [v7 siriViewControllerRequestTearDownEditingViewController:self];

  if (v15[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[SRUserUtteranceViewController removeSpeechAlternativeViewAndUpdateUtteranceTextIfNecessary]( self,  "removeSpeechAlternativeViewAndUpdateUtteranceTextIfNecessary");
    -[SRUserUtteranceViewController _hideEditableUtteranceView](self, "_hideEditableUtteranceView");
  }

  else
  {
    -[SRUserUtteranceViewController handleSelectRow:](self, "handleSelectRow:");
  }

  _Block_object_dispose(&v14, 8);
}

- (void)siriDidDeactivate
{
  if (-[SREditableTextView isFirstResponder](self->_editableUtteranceView, "isFirstResponder")) {
    -[SRUserUtteranceViewController endEditingAndCorrect:](self, "endEditingAndCorrect:", 0LL);
  }
}

- (int64_t)_pinAnimationType
{
  return 1LL;
}

- (int64_t)_insertionAnimation
{
  return SiriUIIsStreamingDictationEnabled(self, a2) ^ 1;
}

- (int64_t)_replacementAnimation
{
  else {
    return 2LL;
  }
}

- (double)_insertionAnimatedZPosition
{
  return result;
}

- (void)_utteranceViewDidSelect:(id)a3
{
  if (self->_receivedFinalRecognitionResult)
  {
    -[SRUserUtteranceViewController _createSpeechAlternativeViewsIfNecessary]( self,  "_createSpeechAlternativeViewsIfNecessary",  a3);
    self->_showSpeechAlternativeList = 1;
    -[SiriUICollectionViewFlowLayout invalidateLayout](self->_speechAlternativeCollectionViewLayout, "invalidateLayout");
    -[SREditableTextView beginEditing](self->_editableUtteranceView, "beginEditing");
    containerView = self->_containerView;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_100010DD0;
    v5[3] = &unk_1000BA078;
    v5[4] = self;
    -[SRUserUtteranceContainerView animateToEditWithDuration:completion:]( containerView,  "animateToEditWithDuration:completion:",  v5,  0.1);
  }

- (void)_hideEditableUtteranceView
{
  utteranceView = self->_utteranceView;
  int v4 = (void *)objc_claimAutoreleasedReturnValue(-[SREditableTextView text](self->_editableUtteranceView, "text"));
  -[SRUserUtteranceView setText:](utteranceView, "setText:", v4);

  containerView = self->_containerView;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100010ECC;
  v6[3] = &unk_1000BA078;
  v6[4] = self;
  -[SRUserUtteranceContainerView animateToDisplayWithDuration:completion:]( containerView,  "animateToDisplayWithDuration:completion:",  v6,  0.1);
}

- (void)createEditableUtteranceView
{
  if (!self->_editableUtteranceView)
  {
    BOOL v3 = -[SREditableTextView initWithFrame:presentationStyle:]( objc_alloc(&OBJC_CLASS___SREditableTextView),  "initWithFrame:presentationStyle:",  0LL,  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
    editableUtteranceView = self->_editableUtteranceView;
    self->_editableUtteranceView = v3;

    else {
      uint64_t v7 = 0LL;
    }
    -[SREditableTextView setTextAlignment:](self->_editableUtteranceView, "setTextAlignment:", v7);
    -[SREditableTextView setDelegate:](self->_editableUtteranceView, "setDelegate:", self);
    -[SREditableTextView setAutoresizingMask:](self->_editableUtteranceView, "setAutoresizingMask:", 18LL);
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _userUtterance](self, "_userUtterance"));
    -[SRUserUtteranceViewController restoreOriginalEditTextContents:](self, "restoreOriginalEditTextContents:", v8);
  }

- (BOOL)editableTextViewTextShouldPreventCorrection:(id)a3
{
  BOOL v3 = self;
  int v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _privateDelegate](self, "_privateDelegate", a3));
  LOBYTE(v3) = [v4 siriViewControllerShouldPreventUserInteraction:v3];

  return (char)v3;
}

- (void)editableTextViewRequestKeyboardForTapToEditWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _privateDelegate](self, "_privateDelegate"));
  [v5 siriViewControllerRequestKeyboardForTapToEditWithCompletion:v4];
}

- (void)editableTextViewTextWillBeginCorrecting:(id)a3
{
  id v4 = (NSString *)objc_claimAutoreleasedReturnValue(-[SREditableTextView text](self->_editableUtteranceView, "text", a3));
  preCorrectionText = self->_preCorrectionText;
  self->_preCorrectionText = v4;

  editableUtteranceView = self->_editableUtteranceView;
  -[SREditableTextView frame](editableUtteranceView, "frame");
  -[SREditableTextView sizeThatFits:](editableUtteranceView, "sizeThatFits:", CGRectGetWidth(v19), 1.79769313e308);
  self->_currentTextSize.double width = v7;
  self->_currentTextSize.double height = v8;
  self->_textChanged = 0;
  speechAlternativeDisplayList = self->_speechAlternativeDisplayList;
  if (!speechAlternativeDisplayList)
  {
    id v10 = -[SRUserUtteranceViewController speechAlternativeHighlightListWithScore:]( self,  "speechAlternativeHighlightListWithScore:",  SiriUIShowSpeechAlternativeScore());
    CGFloat v11 = (NSArray *)objc_claimAutoreleasedReturnValue(v10);
    id v12 = self->_speechAlternativeDisplayList;
    self->_speechAlternativeDisplayList = v11;

    speechAlternativeDisplayList = self->_speechAlternativeDisplayList;
  }

  if (-[NSArray count](speechAlternativeDisplayList, "count"))
  {
    double v13 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController delegate](self, "delegate"));
    [v13 siriViewControllerHeightDidChange:self pinTopOfSnippet:1];
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _privateDelegate](self, "_privateDelegate"));
  [v14 siriViewControllerWillBeginEditing:self];

  id v18 = (id)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController aceObject](self, "aceObject"));
  uint64_t v16 = AFAnalyticsContextCreateWithCommand();
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  [v18 logEventWithType:1424 context:v17];
}

- (void)_checkUpdatedSizingForEditableTextView:(id)a3
{
  id v4 = a3;
  [v4 frame];
  objc_msgSend(v4, "sizeThatFits:", CGRectGetWidth(v11), 1.79769313e308);
  double v6 = v5;
  double v8 = v7;

  if (v6 != self->_currentTextSize.width || v8 != self->_currentTextSize.height)
  {
    self->_currentTextSize.double width = v6;
    self->_currentTextSize.double height = v8;
    -[SiriUICollectionViewFlowLayout invalidateLayout](self->_speechAlternativeCollectionViewLayout, "invalidateLayout");
    id v10 = (id)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController delegate](self, "delegate"));
    [v10 siriViewControllerHeightDidChange:self];
  }

- (void)editableTextViewTextDidChange:(id)a3
{
  id v4 = a3;
  -[SRUserUtteranceViewController _checkUpdatedSizingForEditableTextView:]( self,  "_checkUpdatedSizingForEditableTextView:",  v4);
  [v4 setNeedsLayout];
  preCorrectionText = self->_preCorrectionText;
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v4 text]);

  double v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](&OBJC_CLASS___NSCharacterSet, "whitespaceCharacterSet"));
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByTrimmingCharactersInSet:v7]);
  self->_textChanged = !-[NSString isEqualToString:](preCorrectionText, "isEqualToString:", v8);

  id v9 = (id)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _privateDelegate](self, "_privateDelegate"));
  [v9 siriViewControllerRequestToPin:self];
}

- (void)editableTextViewTextDidFinishCorrecting:(id)a3
{
  id v4 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _privateDelegate](self, "_privateDelegate"));
  [v5 siriViewControllerDidEndEditing:self];

  double v6 = (void *)objc_claimAutoreleasedReturnValue([v4 text]);
  double v7 = v6;
  self->_showSpeechAlternativeList = 0;
  if (!self->_textChanged)
  {
    CGRect v11 = (AFUserUtterance *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _userUtterance](self, "_userUtterance"));
    -[SRUserUtteranceViewController restoreOriginalEditTextContents:](self, "restoreOriginalEditTextContents:", v11);
    goto LABEL_6;
  }

  if (![v6 length])
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _userUtterance](self, "_userUtterance"));
    -[SRUserUtteranceViewController restoreOriginalEditTextContents:](self, "restoreOriginalEditTextContents:", v18);

    utteranceView = self->_utteranceView;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _userUtterance](self, "_userUtterance"));
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 bestTextInterpretation]);
    -[SRUserUtteranceView setText:](utteranceView, "setText:", v21);

    goto LABEL_11;
  }

  if (!-[NSString isEqualToString:](self->_preCorrectionText, "isEqualToString:", v7))
  {
    double v8 = objc_alloc(&OBJC_CLASS___AFUserUtterance);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _userUtterance](self, "_userUtterance"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 correctionIdentifier]);
    CGRect v11 = -[AFUserUtterance initWithString:correctionIdentifier:](v8, "initWithString:correctionIdentifier:", v7, v10);

    -[SRUserUtteranceViewController _setUserUtterance:](self, "_setUserUtterance:", v11);
    -[SRUserUtteranceViewController removeSpeechAlternatives](self, "removeSpeechAlternatives");
    [v4 setText:v7];
    self->_newRequestSent = 1;
LABEL_6:
  }

  id v12 = objc_alloc_init(&OBJC_CLASS___SAUIListItem);
  -[SAUIListItem setSelectionText:](v12, "setSelectionText:", v7);
  double v13 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController delegate](self, "delegate"));
  [v13 siriViewController:self addSelectionResponse:v12];

  uint64_t v14 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v22 = 136315394;
    v23 = "-[SRUserUtteranceViewController editableTextViewTextDidFinishCorrecting:]";
    __int16 v24 = 2112;
    int v25 = v7;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s CorrectedText = %@", (uint8_t *)&v22, 0x16u);
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _privateDelegate](self, "_privateDelegate"));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _correctionIdentifier](self, "_correctionIdentifier"));
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController userSelectionResults:](self, "userSelectionResults:", v7));
  [v15 siriViewController:self startCorrectedSpeechRequestWithText:v7 correctionIdentifier:v16 userSelectionResults:v17];

LABEL_11:
  -[SRUserUtteranceViewController _hideEditableUtteranceView](self, "_hideEditableUtteranceView");
}

- (void)editableTextViewTextDidResignFirstResponder:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController delegate](self, "delegate", a3));
  char v5 = objc_opt_respondsToSelector(v4, "siriViewControllerDidResignFirstResponder:");

  if ((v5 & 1) != 0)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController delegate](self, "delegate"));
    [v6 siriViewControllerDidResignFirstResponder:self];
  }

- (void)restoreOriginalEditTextContents:(id)a3
{
  id v8 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v8 allPhrases]);
  if (v4 && !self->_forceBestTextInterpretation)
  {
    editableUtteranceView = self->_editableUtteranceView;
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v8 correctionIdentifier]);
    -[SREditableTextView setDictationResult:withCorrectionIdentifier:]( editableUtteranceView,  "setDictationResult:withCorrectionIdentifier:",  v4,  v6);
  }

  else
  {
    char v5 = self->_editableUtteranceView;
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v8 bestTextInterpretation]);
    -[SREditableTextView setText:](v5, "setText:", v6);
  }
}

- (void)createViewArray
{
  BOOL v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  viewArray = self->_viewArray;
  self->_viewArray = v3;

  editableUtteranceView = self->_editableUtteranceView;
  self->_editableUtteranceView = 0LL;

  -[SRUserUtteranceViewController createEditableUtteranceView](self, "createEditableUtteranceView");
  -[NSMutableArray addObject:](self->_viewArray, "addObject:", self->_editableUtteranceView);
  if (-[NSMutableArray count](self->_speechAlternativeList, "count"))
  {
    id v6 = self->_viewArray;
    double v7 = objc_alloc(&OBJC_CLASS___SRSpeechAlternativeLabelCellView);
    speechAlternativeListTitle = self->_speechAlternativeListTitle;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont siriui_serverUtteranceFont](&OBJC_CLASS___UIFont, "siriui_serverUtteranceFont"));
    id v10 = -[SRSpeechAlternativeLabelCellView initWithTitle:font:]( v7,  "initWithTitle:font:",  speechAlternativeListTitle,  v9);
    -[NSMutableArray addObject:](v6, "addObject:", v10);

    self->_speechAlternativesStartIndex = (int64_t)-[NSMutableArray count](self->_viewArray, "count");
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    CGRect v11 = self->_speechAlternativeDisplayList;
    id v12 = -[NSArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        id v15 = 0LL;
        do
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v19 + 1) + 8LL * (void)v15);
          uint64_t v17 = objc_alloc(&OBJC_CLASS___SRSpeechAlternativeCellView);
          id v18 = -[SRSpeechAlternativeCellView initWithTitle:](v17, "initWithTitle:", v16, (void)v19);
          -[NSMutableArray addObject:](self->_viewArray, "addObject:", v18);

          id v15 = (char *)v15 + 1;
        }

        while (v13 != v15);
        id v13 = -[NSArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
      }

      while (v13);
    }
  }

- (void)_createSpeechAlternativeViewsIfNecessary
{
  if (!self->_speechAlternativeDisplayList)
  {
    id v3 = -[SRUserUtteranceViewController speechAlternativeHighlightListWithScore:]( self,  "speechAlternativeHighlightListWithScore:",  SiriUIShowSpeechAlternativeScore());
    id v4 = (NSArray *)objc_claimAutoreleasedReturnValue(v3);
    speechAlternativeDisplayList = self->_speechAlternativeDisplayList;
    self->_speechAlternativeDisplayList = v4;
  }

  if (!self->_speechAlternativeCollectionView)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___SiriUICollectionViewFlowLayout);
    speechAlternativeCollectionViewLayout = self->_speechAlternativeCollectionViewLayout;
    self->_speechAlternativeCollectionViewLayout = v6;

    -[SiriUICollectionViewFlowLayout setMinimumLineSpacing:]( self->_speechAlternativeCollectionViewLayout,  "setMinimumLineSpacing:",  0.0);
    -[SiriUICollectionViewFlowLayout setMinimumInteritemSpacing:]( self->_speechAlternativeCollectionViewLayout,  "setMinimumInteritemSpacing:",  0.0);
    id v8 = -[UICollectionView initWithFrame:collectionViewLayout:]( objc_alloc(&OBJC_CLASS___UICollectionView),  "initWithFrame:collectionViewLayout:",  self->_speechAlternativeCollectionViewLayout,  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
    speechAlternativeCollectionView = self->_speechAlternativeCollectionView;
    self->_speechAlternativeCollectionView = v8;

    -[UICollectionView setDelegate:](self->_speechAlternativeCollectionView, "setDelegate:", self);
    -[UICollectionView setDataSource:](self->_speechAlternativeCollectionView, "setDataSource:", self);
    -[UICollectionView setScrollEnabled:](self->_speechAlternativeCollectionView, "setScrollEnabled:", 0LL);
    -[UICollectionView setShowsVerticalScrollIndicator:]( self->_speechAlternativeCollectionView,  "setShowsVerticalScrollIndicator:",  0LL);
    id v10 = self->_speechAlternativeCollectionView;
    CGRect v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[UICollectionView setBackgroundColor:](v10, "setBackgroundColor:", v11);

    id v12 = self->_speechAlternativeCollectionView;
    *(void *)&double v14 = objc_opt_class(&OBJC_CLASS___SiriUIContentCollectionViewCell, v13).n128_u64[0];
    uint64_t v16 = v15;
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[SiriUIContentCollectionViewCell reuseIdentifier]( &OBJC_CLASS___SiriUIContentCollectionViewCell,  "reuseIdentifier",  v14));
    -[UICollectionView registerClass:forCellWithReuseIdentifier:]( v12,  "registerClass:forCellWithReuseIdentifier:",  v16,  v17);

    -[SRUserUtteranceViewController createViewArray](self, "createViewArray");
    id v18 = -[UICollectionView reloadData](self->_speechAlternativeCollectionView, "reloadData");
    -[UICollectionView recursive_setSemanticContentAttribute:]( self->_speechAlternativeCollectionView,  "recursive_setSemanticContentAttribute:",  SiriLanguageSemanticContentAttribute(v18, v19));
    -[SRUserUtteranceContainerView setTableView:]( self->_containerView,  "setTableView:",  self->_speechAlternativeCollectionView);
  }

- (id)speechAlternativeHighlightListWithScore:(BOOL)a3
{
  BOOL v3 = a3;
  if ((SiriUIDisableAlternativesFeature(self, a2) & 1) != 0) {
    return 0LL;
  }
  speechAlternativeList = self->_speechAlternativeList;
  if (speechAlternativeList) {
    -[NSMutableArray removeAllObjects](speechAlternativeList, "removeAllObjects");
  }
  double v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v8 = self->_speechAlternativeList;
  self->_speechAlternativeList = v7;

  -[NSMutableDictionary removeAllObjects](self->_alternativeInfoMap, "removeAllObjects");
  self->_showOnDeviceResults = 0;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _userUtterance](self, "_userUtterance"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 allRecognitionStringsAndScores]);

  CGRect v11 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _userUtterance](self, "_userUtterance"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 textOfUtteranceAtIndex:0]);

  if (!v12)
  {
    __int16 v27 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      sub_10006A078(v27);
    }
    v26 = 0LL;
    goto LABEL_22;
  }

  id v13 = objc_alloc_init(&OBJC_CLASS___SRUIFAlternativeInfo);
  [v13 setOriginalRank:&off_1000BEC68];
  double v14 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:v12]);
  uint64_t v15 = AFUserUtteranceConfidenceAverageKey;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:AFUserUtteranceConfidenceAverageKey]);
  [v13 setOriginalScore:v16];

  [v13 setIsFromDevice:&__kCFBooleanFalse];
  -[NSMutableDictionary setObject:forKey:](self->_alternativeInfoMap, "setObject:forKey:", v13, v12);
  uint64_t v17 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = v17;
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:v12]);
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKey:v15]);
    int v30 = 136315650;
    v31 = "-[SRUserUtteranceViewController speechAlternativeHighlightListWithScore:]";
    __int16 v32 = 2112;
    v33 = v12;
    __int16 v34 = 2112;
    v35 = v20;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%s Original utterance:  %@ (%@)",  (uint8_t *)&v30,  0x20u);
  }

  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController delegate](self, "delegate"));
  char v22 = objc_opt_respondsToSelector(v21, "updatedUserUtteranceForSiriViewController:");

  if ((v22 & 1) == 0)
  {
    __int16 v24 = 0LL;
LABEL_18:
    id v28 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v30 = 136315138;
      v31 = "-[SRUserUtteranceViewController speechAlternativeHighlightListWithScore:]";
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "%s server results only",  (uint8_t *)&v30,  0xCu);
    }

    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _userUtterance](self, "_userUtterance"));
    v26 = (void *)objc_claimAutoreleasedReturnValue( -[SRUserUtteranceViewController _processUserUtterance:isCombined:displayedText:withScore:]( self,  "_processUserUtterance:isCombined:displayedText:withScore:",  v29,  0LL,  v12,  v3));

    goto LABEL_21;
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController delegate](self, "delegate"));
  __int16 v24 = (void *)objc_claimAutoreleasedReturnValue([v23 updatedUserUtteranceForSiriViewController:self]);

  int v25 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v30 = 136315138;
    v31 = "-[SRUserUtteranceViewController speechAlternativeHighlightListWithScore:]";
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s combined results", (uint8_t *)&v30, 0xCu);
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue( -[SRUserUtteranceViewController _processUserUtterance:isCombined:displayedText:withScore:]( self,  "_processUserUtterance:isCombined:displayedText:withScore:",  v24,  1LL,  v12,  v3));
LABEL_21:

LABEL_22:
  return v26;
}

- (id)_processUserUtterance:(id)a3 isCombined:(BOOL)a4 displayedText:(id)a5 withScore:(BOOL)a6
{
  id v10 = a3;
  id v11 = a5;
  NSAttributedStringKey v39 = NSForegroundColorAttributeName;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 1.0));
  v40 = v12;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v40,  &v39,  1LL));

  NSAttributedStringKey v37 = NSForegroundColorAttributeName;
  double v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.5));
  v38 = v14;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v38,  &v37,  1LL));

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v10 allRecognitionStringsAndScores]);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 keysSortedByValueUsingComparator:&stru_1000BA170]);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_1000121C4;
  v27[3] = &unk_1000BA198;
  id v28 = v11;
  id v29 = v16;
  int v30 = self;
  id v31 = v15;
  BOOL v35 = a4;
  id v32 = v10;
  id v33 = v13;
  BOOL v36 = a6;
  id v18 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v34 = v18;
  id v19 = v13;
  id v20 = v10;
  id v21 = v15;
  id v22 = v16;
  id v23 = v11;
  [v17 enumerateObjectsUsingBlock:v27];
  __int16 v24 = v34;
  id v25 = v18;

  return v25;
}

- (void)handleSelectRow:(int64_t)a3
{
  if (-[NSMutableArray count](self->_speechAlternativeList, "count"))
  {
    int64_t v5 = a3 - self->_speechAlternativesStartIndex;
    if (v5 >= 0 && v5 < (unint64_t)-[NSMutableArray count](self->_speechAlternativeList, "count"))
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_speechAlternativeList, "objectAtIndex:", v5));
      double v7 = (os_log_s *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        int v16 = 136315394;
        uint64_t v17 = "-[SRUserUtteranceViewController handleSelectRow:]";
        __int16 v18 = 2112;
        id v19 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s alternativeString = %@",  (uint8_t *)&v16,  0x16u);
      }

      id v8 = objc_alloc(&OBJC_CLASS___AFUserUtterance);
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _userUtterance](self, "_userUtterance"));
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 correctionIdentifier]);
      id v11 = -[AFUserUtterance initWithString:correctionIdentifier:](v8, "initWithString:correctionIdentifier:", v6, v10);

      -[SRUserUtteranceViewController _setUserUtterance:](self, "_setUserUtterance:", v11);
      -[SRUserUtteranceView setText:](self->_utteranceView, "setText:", v6);
      -[SREditableTextView setText:](self->_editableUtteranceView, "setText:", v6);
      self->_showSpeechAlternativeList = 0;
      -[SRUserUtteranceViewController removeSpeechAlternatives](self, "removeSpeechAlternatives");
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController delegate](self, "delegate"));
      [v12 siriViewControllerHeightDidChange:self pinTopOfSnippet:1];

      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _privateDelegate](self, "_privateDelegate"));
      double v14 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController _correctionIdentifier](self, "_correctionIdentifier"));
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController userSelectionResults:](self, "userSelectionResults:", v6));
      [v13 siriViewController:self startCorrectedSpeechRequestWithText:v6 correctionIdentifier:v14 userSelectionResults:v15];

      self->_newRequestSent = 1;
      -[SRUserUtteranceViewController _hideEditableUtteranceView](self, "_hideEditableUtteranceView");
    }
  }

  else
  {
    -[SREditableTextView beginEditing](self->_editableUtteranceView, "beginEditing");
  }

- (id)userSelectionResults:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___AFUserUtteranceSelectionResults);
  id v6 = v5;
  if (v4)
  {
    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_alternativeInfoMap, "objectForKey:", v4));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 originalScore]);
    [v6 setOriginalScore:v8];

    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 originalRank]);
    [v6 setOriginalRank:v9];

    id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 isFromDevice]);
    unsigned int v11 = [v10 BOOLValue];

    id v12 = &SASStartCorrectedSpeechRequestUtteranceSourceCLIENTValue;
    if (!v11) {
      id v12 = &SASStartCorrectedSpeechRequestUtteranceSourceSERVERValue;
    }
    [v6 setUtteranceSource:*v12];
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 combinedRank]);
    [v6 setCombinedRank:v13];

    double v14 = (void *)objc_claimAutoreleasedReturnValue([v7 combinedScore]);
    [v6 setCombinedScore:v14];
  }

  else
  {
    [v5 setUtteranceSource:SASStartCorrectedSpeechRequestUtteranceSourceUSER_EDITEDValue];
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController aceObject](self, "aceObject"));
  int v16 = (void *)objc_claimAutoreleasedReturnValue([v15 refId]);
  [v6 setInteractionId:v16];

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_showOnDeviceResults));
  [v6 setOnDeviceUtterancesPresent:v17];

  [v6 setSessionId:self->_sessionId];
  [v6 setPreviousUtterance:self->_preCorrectionText];
  __int16 v18 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v20 = 136315394;
    id v21 = "-[SRUserUtteranceViewController userSelectionResults:]";
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "%s AFUserUtteranceSelectionResults = %@",  (uint8_t *)&v20,  0x16u);
  }

  return v6;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return (int64_t)-[NSMutableArray count](self->_viewArray, "count", a3, a4);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SiriUIContentCollectionViewCell reuseIdentifier]( &OBJC_CLASS___SiriUIContentCollectionViewCell,  "reuseIdentifier"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 dequeueReusableCellWithReuseIdentifier:v8 forIndexPath:v6]);

  [v9 setHasChevron:0];
  id v10 = [v6 item];

  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  [v9 setBackgroundColor:v11];

  if (v10)
  {
    [v9 setKeylineType:4];
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 keyline]);
    [v12 setCustomLeftPadding:44.0];

    id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 keyline]);
    [v13 setCustomRightPadding:44.0];

    double v14 = (void *)objc_claimAutoreleasedReturnValue([v9 keyline]);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.5, 0.3));
    [v14 setCustomBackgroundColor:v15];
  }

  else
  {
    [v9 setKeylineType:0];
  }

  int v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_viewArray, "objectAtIndex:", v10));
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v9 contentView]);
  [v9 bounds];
  double Width = CGRectGetWidth(v49);
  [v9 bounds];
  objc_msgSend(v17, "setBounds:", 0.0, 0.0, Width, CGRectGetHeight(v50));

  objc_opt_class(&OBJC_CLASS___SRSpeechAlternativeCellView, v19);
  if ((objc_opt_isKindOfClass(v16, v20) & 1) != 0)
  {
    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue([v9 contentView]);
    [v22 addSubview:v16];

    id v23 = (void *)objc_claimAutoreleasedReturnValue([v9 contentView]);
    [v23 bounds];
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;
    [v16 edgeInsets];
    double v33 = v25 + v32;
    double v35 = v27 + v34;
    double v37 = v29 - (v32 + v36);
    double v39 = v31 - (v34 + v38);
LABEL_9:

    objc_msgSend(v16, "setFrame:", v33, v35, v37, v39);
    goto LABEL_10;
  }

  objc_opt_class(&OBJC_CLASS___SREditableTextView, v21);
  if ((objc_opt_isKindOfClass(v16, v40) & 1) != 0
    || (objc_opt_class(&OBJC_CLASS___SRSpeechAlternativeLabelCellView, v41), (objc_opt_isKindOfClass(v16, v42) & 1) != 0))
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue([v9 contentView]);
    [v43 addSubview:v16];

    id v23 = (void *)objc_claimAutoreleasedReturnValue([v9 contentView]);
    [v23 bounds];
    double v33 = v44;
    double v35 = v45;
    double v37 = v46;
    double v39 = v47;
    goto LABEL_9;
  }

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 deselectItemAtIndexPath:v6 animated:1];
  id v7 = [v6 row];

  -[SRUserUtteranceViewController handleSelectRow:](self, "handleSelectRow:", v7);
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6 = a5;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceViewController delegate](self, "delegate"));
  [v7 siriViewControllerExpectedWidth:self];
  double width = v8;

  CGFloat height = CGSizeZero.height;
  id v11 = [v6 item];

  if (v11 >= -[NSMutableArray count](self->_viewArray, "count"))
  {
    double width = CGSizeZero.width;
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_viewArray, "objectAtIndex:", v11));
    objc_opt_class(&OBJC_CLASS___SRSpeechAlternativeCellView, v13);
    if ((objc_opt_isKindOfClass(v12, v14) & 1) != 0
      || (objc_opt_class(&OBJC_CLASS___SREditableTextView, v15), (objc_opt_isKindOfClass(v12, v16) & 1) != 0)
      || (objc_opt_class(&OBJC_CLASS___SRSpeechAlternativeLabelCellView, v17),
          (objc_opt_isKindOfClass(v12, v18) & 1) != 0))
    {
      objc_msgSend(v12, "sizeThatFits:", width, 1.79769313e308);
      CGFloat height = v19;
    }
  }

  double v20 = width;
  double v21 = height;
  result.CGFloat height = v21;
  result.double width = v20;
  return result;
}

- (AFUserUtterance)_userUtterance
{
  return self->_userUtterance;
}

- (void).cxx_destruct
{
}

@end