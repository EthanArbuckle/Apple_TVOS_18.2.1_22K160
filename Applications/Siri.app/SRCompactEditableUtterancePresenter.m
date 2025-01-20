@interface SRCompactEditableUtterancePresenter
- (BOOL)hasContentAtPoint:(CGPoint)a3;
- (SRCompactEditableUtterancePresenter)initWithUserEditingDataManager:(id)a3 delegate:(id)a4;
- (id)attributedStringAtIndex:(int64_t)a3;
- (int64_t)numberOfAlternativeUtterances;
- (void)_editableUtteranceViewControllerDidDismiss:(id)a3;
- (void)_editableUtteranceViewControllerWillBePresentedWithSheetPresentationController:(id)a3;
- (void)didResignFirstResponderFromUtteranceViewController:(id)a3;
- (void)dismissEditableUtteranceViewControllerAndShouldStartNewRequest:(BOOL)a3 completion:(id)a4;
- (void)editableUtteranceViewController:(id)a3 alternativeSelectedAtIndex:(int64_t)a4;
- (void)editableUtteranceViewController:(id)a3 didFinishEditingWithText:(id)a4;
- (void)editableUtteranceViewController:(id)a3 openURL:(id)a4;
- (void)editableUtteranceViewController:(id)a3 requestsKeyboardWithCompletion:(id)a4;
- (void)presentUtteranceViewControllerFromViewController:(id)a3 animateAlongsideTransition:(id)a4 completion:(id)a5;
- (void)presentViewController:(id)a3 fromViewController:(id)a4 animateAlongsideTransition:(id)a5 completion:(id)a6;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)presentationControllerWillDismiss:(id)a3;
- (void)willBeginEditingFromUtteranceViewController:(id)a3;
@end

@implementation SRCompactEditableUtterancePresenter

- (SRCompactEditableUtterancePresenter)initWithUserEditingDataManager:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___SRCompactEditableUtterancePresenter;
  v9 = -[SRCompactEditableUtterancePresenter init](&v16, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_delegate, v8);
    objc_storeStrong((id *)&v10->_userUtteranceEditingDataManager, a3);
    v11 = objc_alloc(&OBJC_CLASS___SRCompactEditableUtteranceViewController);
    v12 = (void *)objc_claimAutoreleasedReturnValue( -[SiriSharedUIUserUtteranceEditingDataManaging userUtterance]( v10->_userUtteranceEditingDataManager,  "userUtterance"));
    v13 = -[SRCompactEditableUtteranceViewController initWithUserUtterance:delegate:dataSource:]( v11,  "initWithUserUtterance:delegate:dataSource:",  v12,  v10,  v10);
    editableUtteranceViewController = v10->_editableUtteranceViewController;
    v10->_editableUtteranceViewController = &v13->super;
  }

  return v10;
}

- (void)presentUtteranceViewControllerFromViewController:(id)a3 animateAlongsideTransition:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    v13 = "-[SRCompactEditableUtterancePresenter presentUtteranceViewControllerFromViewController:animateAlongsideTransit"
          "ion:completion:]";
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s #compact: presentingEditableUtteranceViewController",  (uint8_t *)&v12,  0xCu);
  }

  -[SRCompactEditableUtterancePresenter presentViewController:fromViewController:animateAlongsideTransition:completion:]( self,  "presentViewController:fromViewController:animateAlongsideTransition:completion:",  self->_editableUtteranceViewController,  v8,  v9,  v10);
}

- (void)dismissEditableUtteranceViewControllerAndShouldStartNewRequest:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[SRCompactEditableUtterancePresenter dismissEditableUtteranceViewControllerAndShouldStartNewRequest:completion:]";
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s #compact: dismissing editableUtteranceViewController",  buf,  0xCu);
  }

  self->_shouldStartNewRequest = a3;
  objc_initWeak((id *)buf, self);
  editableUtteranceViewController = self->_editableUtteranceViewController;
  int v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472LL;
  v14 = sub_10003D778;
  v15 = &unk_1000BB0C8;
  objc_copyWeak(&v17, (id *)buf);
  id v9 = v6;
  id v16 = v9;
  -[UIViewController dismissViewControllerAnimated:completion:]( editableUtteranceViewController,  "dismissViewControllerAnimated:completion:",  1LL,  &v12);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v11 = (void *)objc_claimAutoreleasedReturnValue( -[UIViewController transitionCoordinator]( self->_editableUtteranceViewController,  "transitionCoordinator",  v12,  v13,  v14,  v15));
  [WeakRetained willDismissEditableUtterancePresenter:self transitionCoordinator:v11];

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

- (BOOL)hasContentAtPoint:(CGPoint)a3
{
  return self->_editableUtteranceViewController && self->_editableUtteranceViewControllerIsPresented;
}

- (id)attributedStringAtIndex:(int64_t)a3
{
  return -[SiriSharedUIUserUtteranceEditingDataManaging attributedStringAtIndex:]( self->_userUtteranceEditingDataManager,  "attributedStringAtIndex:",  a3);
}

- (int64_t)numberOfAlternativeUtterances
{
  return (int64_t)-[SiriSharedUIUserUtteranceEditingDataManaging numberOfAlternativeUtterances]( self->_userUtteranceEditingDataManager,  "numberOfAlternativeUtterances");
}

- (void)didResignFirstResponderFromUtteranceViewController:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained didResignFirstResponderFromUtterancePresenter:self];
}

- (void)editableUtteranceViewController:(id)a3 requestsKeyboardWithCompletion:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained editableUtterancePresenter:self requestsKeyboardWithCompletion:v6];
}

- (void)willBeginEditingFromUtteranceViewController:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained willBeginEditingFromUtterancePresenter:self];
}

- (void)editableUtteranceViewController:(id)a3 alternativeSelectedAtIndex:(int64_t)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtterancePresenter attributedStringAtIndex:](self, "attributedStringAtIndex:", a4));
  id v10 = (id)objc_claimAutoreleasedReturnValue([v6 string]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[SiriSharedUIUserUtteranceEditingDataManaging selectionResultsForAlternateTextAtIndex:]( self->_userUtteranceEditingDataManager,  "selectionResultsForAlternateTextAtIndex:",  a4));
  LODWORD(v6) = -[SiriSharedUIUserUtteranceEditingDataManaging isEditedTextSameAsUtterance:]( self->_userUtteranceEditingDataManager,  "isEditedTextSameAsUtterance:",  v10);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v9 = v6 ^ 1;
  [WeakRetained editableUtterancePresenter:self didFinishEditingWithText:v10 selectionResults:v7 shouldStartNewRequest:v9];

  -[SRCompactEditableUtterancePresenter dismissEditableUtteranceViewControllerAndShouldStartNewRequest:completion:]( self,  "dismissEditableUtteranceViewControllerAndShouldStartNewRequest:completion:",  v9,  0LL);
}

- (void)editableUtteranceViewController:(id)a3 didFinishEditingWithText:(id)a4
{
  userUtteranceEditingDataManager = self->_userUtteranceEditingDataManager;
  id v6 = a4;
  id v9 = (id)objc_claimAutoreleasedReturnValue( -[SiriSharedUIUserUtteranceEditingDataManaging selectionResultsForEditedText:]( userUtteranceEditingDataManager,  "selectionResultsForEditedText:",  v6));
  LODWORD(userUtteranceEditingDataManager) = -[SiriSharedUIUserUtteranceEditingDataManaging isEditedTextSameAsUtterance:]( self->_userUtteranceEditingDataManager,  "isEditedTextSameAsUtterance:",  v6);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v8 = userUtteranceEditingDataManager ^ 1;
  [WeakRetained editableUtterancePresenter:self didFinishEditingWithText:v6 selectionResults:v9 shouldStartNewRequest:v8];

  -[SRCompactEditableUtterancePresenter dismissEditableUtteranceViewControllerAndShouldStartNewRequest:completion:]( self,  "dismissEditableUtteranceViewControllerAndShouldStartNewRequest:completion:",  v8,  0LL);
}

- (void)editableUtteranceViewController:(id)a3 openURL:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained editableUtterancePresenter:self openURL:v6];
}

- (void)presentViewController:(id)a3 fromViewController:(id)a4 animateAlongsideTransition:(id)a5 completion:(id)a6
{
  id v22 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  [v22 setModalPresentationStyle:2];
  [v22 setModalPresentationCapturesStatusBarAppearance:1];
  [v22 setNeedsStatusBarAppearanceUpdate];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v10 presentedViewController]);
  objc_opt_class(v22, v14);
  char isKindOfClass = objc_opt_isKindOfClass(v13, v15);

  if ((isKindOfClass & 1) == 0)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v10 view]);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 window]);
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 _rootSheetPresentationController]);

    -[SRCompactEditableUtterancePresenter _editableUtteranceViewControllerWillBePresentedWithSheetPresentationController:]( self,  "_editableUtteranceViewControllerWillBePresentedWithSheetPresentationController:",  v19);
    [v10 presentViewController:v22 animated:1 completion:0];
    v20 = (void *)objc_claimAutoreleasedReturnValue([v22 presentationController]);
    [v20 setDelegate:self];

    v21 = (void *)objc_claimAutoreleasedReturnValue([v22 transitionCoordinator]);
    [v21 animateAlongsideTransition:v11 completion:v12];
  }
}

- (void)_editableUtteranceViewControllerWillBePresentedWithSheetPresentationController:(id)a3
{
  self->_editableUtteranceViewControllerIsPresented = 1;
  p_sheetPresentationController = &self->_sheetPresentationController;
  id v8 = a3;
  id v5 = objc_storeWeak((id *)p_sheetPresentationController, v8);
  unsigned __int8 v6 = [v8 _shouldScaleDownBehindDescendantSheets];

  self->_previousShouldScaleDownBehindDescendantSheetsValue = v6;
  id WeakRetained = objc_loadWeakRetained((id *)p_sheetPresentationController);
  [WeakRetained _setShouldScaleDownBehindDescendantSheets:0];
}

- (void)presentationControllerWillDismiss:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[UIViewController transitionCoordinator]( self->_editableUtteranceViewController,  "transitionCoordinator"));
  [WeakRetained willDismissEditableUtterancePresenter:self transitionCoordinator:v4];
}

- (void)presentationControllerDidDismiss:(id)a3
{
}

- (void)_editableUtteranceViewControllerDidDismiss:(id)a3
{
  p_sheetPresentationController = &self->_sheetPresentationController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sheetPresentationController);
  [WeakRetained _setShouldScaleDownBehindDescendantSheets:self->_previousShouldScaleDownBehindDescendantSheetsValue];

  self->_previousShouldScaleDownBehindDescendantSheetsValue = 0;
  objc_storeWeak((id *)p_sheetPresentationController, 0LL);
  self->_editableUtteranceViewControllerIsPresented = 0;
  editableUtteranceViewController = self->_editableUtteranceViewController;
  self->_editableUtteranceViewController = 0LL;
}

- (void).cxx_destruct
{
}

@end