@interface SRSuggestionsViewController
- (BOOL)isShowingGuide;
- (BOOL)isShowingUserNudge;
- (BOOL)suggestionsViewIsInTextInputMode:(id)a3;
- (SRSuggestionsViewControllerDelegate)delegate;
- (double)contentWidthForSuggestionsView:(id)a3;
- (double)statusBarHeightForSuggestionsView:(id)a3;
- (double)statusViewHeightForSuggestionsView:(id)a3;
- (id)_initialHeaderText;
- (id)_nudgeHeaderText;
- (void)_createGuideController;
- (void)_showHeaderText:(id)a3 subheaderText:(id)a4 largeSubheaderText:(id)a5;
- (void)animateOut;
- (void)didShowSuggestionsForSuggestionsView:(id)a3;
- (void)hideAcousticIDSpinner;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)showAcousticIDSpinner;
- (void)showEmptyView;
- (void)showGreeting;
- (void)showUnavailable;
- (void)showUserNudge;
- (void)suggestionsView:(id)a3 didHideVibrantView:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SRSuggestionsViewController

- (void)loadView
{
  v4 = -[SiriUISuggestionsView initWithFrame:]( objc_alloc(&OBJC_CLASS___SiriUISuggestionsView),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  -[SiriUISuggestionsView setAutoresizingMask:](v4, "setAutoresizingMask:", 18LL);
  -[SiriUISuggestionsView setDelegate:](v4, "setDelegate:", self);
  -[SRSuggestionsViewController setView:](self, "setView:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSuggestionsViewController view](self, "view"));
  [v3 setHidden:1];
}

- (id)_initialHeaderText
{
  *(void *)&double v2 = objc_opt_class(self, a2).n128_u64[0];
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", v3, v2));
  id v5 = objc_alloc(&OBJC_CLASS___SiriUISuggestionsHeaderText);
  v6 = (void *)objc_claimAutoreleasedReturnValue( [v4 assistantUILocalizedStringForKey:@"ASSISTANT_INITIAL_QUERY_REGULAR" table:0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue( [v4 assistantUILocalizedStringForKey:@"ASSISTANT_INITIAL_QUERY_COMPACT" table:0]);
  id v8 = [v5 initWithRegularString:v6 compactString:v7];

  return v8;
}

- (id)_nudgeHeaderText
{
  *(void *)&double v2 = objc_opt_class(self, a2).n128_u64[0];
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", v3, v2));
  id v5 = objc_alloc(&OBJC_CLASS___SiriUISuggestionsHeaderText);
  v6 = (void *)objc_claimAutoreleasedReturnValue( [v4 assistantUILocalizedStringForKey:@"ASSISTANT_LISTENING_NUDGE_REGULAR" table:0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue( [v4 assistantUILocalizedStringForKey:@"ASSISTANT_LISTENING_NUDGE_COMPACT" table:0]);
  id v8 = [v5 initWithRegularString:v6 compactString:v7];

  return v8;
}

- (void)showUnavailable
{
  *(void *)&double v3 = objc_opt_class(self, a2).n128_u64[0];
  id v11 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", v4, v3));
  id v5 = objc_alloc(&OBJC_CLASS___SiriUISuggestionsHeaderText);
  v6 = (void *)objc_claimAutoreleasedReturnValue( [v11 assistantUILocalizedStringForKey:@"ASSISTANT_NOT_AVAILABLE_TITLE" table:0]);
  id v7 = [v5 initWithRegularString:v6 compactString:0];

  id v8 = objc_alloc(&OBJC_CLASS___SiriUISuggestionsHeaderText);
  v9 = (void *)objc_claimAutoreleasedReturnValue( [v11 assistantUILocalizedStringForKey:@"ASSISTANT_NO_NETWORK_SUBTITLE" table:0]);
  id v10 = [v8 initWithRegularString:v9 compactString:0];

  [v7 setTextAlignment:1];
  [v10 setTextAlignment:1];
  -[SRSuggestionsViewController _showHeaderText:subheaderText:largeSubheaderText:]( self,  "_showHeaderText:subheaderText:largeSubheaderText:",  v7,  v10,  0LL);
}

- (void)showGreeting
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSuggestionsViewController _initialHeaderText](self, "_initialHeaderText"));
  -[SRSuggestionsViewController _showHeaderText:subheaderText:largeSubheaderText:]( self,  "_showHeaderText:subheaderText:largeSubheaderText:",  v3,  0LL,  0LL);

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSuggestionsViewController view](self, "view"));
  [v4 clearCurrentSuggestions];

  [UIApp finishedIPTest:SUICPPTTestNameSiriBringupToInitialQuery];
}

- (void)showUserNudge
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSuggestionsViewController _nudgeHeaderText](self, "_nudgeHeaderText"));
  -[SRSuggestionsViewController _showHeaderText:subheaderText:largeSubheaderText:]( self,  "_showHeaderText:subheaderText:largeSubheaderText:",  v3,  0LL,  0LL);

  id v4 = (id)objc_claimAutoreleasedReturnValue(-[SRSuggestionsViewController view](self, "view"));
  [v4 setGuideHidden:1];
}

- (BOOL)isShowingUserNudge
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSuggestionsViewController view](self, "view"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 headerText]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 regularString]);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSuggestionsViewController _nudgeHeaderText](self, "_nudgeHeaderText"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 regularString]);
  unsigned __int8 v8 = [v5 isEqualToString:v7];

  return v8;
}

- (void)showEmptyView
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SRSuggestionsViewController view](self, "view"));
  [v3 setGuideHidden:1];
}

- (void)_showHeaderText:(id)a3 subheaderText:(id)a4 largeSubheaderText:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SRSuggestionsViewController view](self, "view"));
  [v11 setHidden:0];

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SRSuggestionsViewController view](self, "view"));
  [v12 setSubheaderText:v9];

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SRSuggestionsViewController view](self, "view"));
  [v13 setLargeSubheaderText:v8];

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SRSuggestionsViewController view](self, "view"));
  [v14 setHeaderText:v10];

  id v15 = (id)objc_claimAutoreleasedReturnValue(-[SRSuggestionsViewController view](self, "view"));
  [v15 setGuideHidden:1 animated:1];
}

- (void)showAcousticIDSpinner
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[SRSuggestionsViewController view](self, "view"));
  [v2 showAcousticIDSpinner];
}

- (void)hideAcousticIDSpinner
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[SRSuggestionsViewController view](self, "view"));
  [v2 hideAcousticIDSpinner];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SRSuggestionsViewController;
  -[SRSuggestionsViewController viewWillAppear:](&v6, "viewWillAppear:", a3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSuggestionsViewController view](self, "view"));
  objc_msgSend(v4, "setOrientation:", objc_msgSend(UIApp, "statusBarOrientation"));

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSuggestionsViewController view](self, "view"));
  [v5 setNeedsLayout];
}

- (BOOL)isShowingGuide
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[SRSuggestionsViewController view](self, "view"));
  char v3 = [v2 isGuideHidden] ^ 1;

  return v3;
}

- (void)animateOut
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10000BB84;
  v3[3] = &unk_1000BA078;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[SRSuggestionsViewController view](self, "view"));
  id v2 = v4;
  [v2 animateOutWithCompletion:v3];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SRSuggestionsViewController;
  -[SRSuggestionsViewController viewWillTransitionToSize:withTransitionCoordinator:]( &v6,  "viewWillTransitionToSize:withTransitionCoordinator:",  a4,  a3.width,  a3.height);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSuggestionsViewController view](self, "view"));
  objc_msgSend(v5, "setOrientation:", objc_msgSend(UIApp, "statusBarOrientation"));
}

- (void)_createGuideController
{
  id v8 = -[AFUISiriLanguage initWithDelegate:](objc_alloc(&OBJC_CLASS___AFUISiriLanguage), "initWithDelegate:", 0LL);
  char v3 = objc_alloc(&OBJC_CLASS___AFConversation);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[AFUISiriLanguage spokenLanguageCode](v8, "spokenLanguageCode"));
  id v5 = -[AFConversation initWithLanguageCode:](v3, "initWithLanguageCode:", v4);
  conversation = self->_conversation;
  self->_conversation = v5;

  -[AFConversation setDelegate:](self->_conversation, "setDelegate:", self);
  id v7 = objc_alloc_init(&OBJC_CLASS___SAUIShowHelp);
  -[AFConversation addItemsForShowHelpCommand:](self->_conversation, "addItemsForShowHelpCommand:", v7);
}

- (void)didShowSuggestionsForSuggestionsView:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector(WeakRetained, "suggestionsViewDidShowSuggestions:");

  if ((v6 & 1) != 0)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 suggestionsViewDidShowSuggestions:self];
  }

- (double)statusBarHeightForSuggestionsView:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSuggestionsViewController delegate](self, "delegate", a3));
  [v4 statusBarFrameForSuggestionsViewController:self];
  double MaxY = CGRectGetMaxY(v7);

  return MaxY;
}

- (double)statusViewHeightForSuggestionsView:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSuggestionsViewController delegate](self, "delegate", a3));
  [v4 statusViewHeightForSuggestionsViewController:self];
  double v6 = v5;

  return v6;
}

- (void)suggestionsView:(id)a3 didHideVibrantView:(id)a4
{
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector(WeakRetained, "suggestionsViewController:didHideVibrantView:");

  if ((v6 & 1) != 0)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    [v7 suggestionsViewController:self didHideVibrantView:v8];
  }
}

- (double)contentWidthForSuggestionsView:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSuggestionsViewController delegate](self, "delegate", a3));
  [v4 contentWidthForSuggestionsViewController:self];
  double v6 = v5;

  return v6;
}

- (BOOL)suggestionsViewIsInTextInputMode:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector(WeakRetained, "inTextInputModeForSuggestionsViewController:");

  if ((v6 & 1) == 0) {
    return 0;
  }
  id v7 = objc_loadWeakRetained((id *)p_delegate);
  unsigned __int8 v8 = [v7 inTextInputModeForSuggestionsViewController:self];

  return v8;
}

- (SRSuggestionsViewControllerDelegate)delegate
{
  return (SRSuggestionsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end