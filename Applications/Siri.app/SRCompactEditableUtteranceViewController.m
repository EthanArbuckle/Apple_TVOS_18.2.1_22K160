@interface SRCompactEditableUtteranceViewController
- (BOOL)_didUpdateShowTipCount;
- (BOOL)_shouldShowAlternativesTableView;
- (BOOL)_shouldShowTip;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (SRCompactEditableUtteranceViewController)initWithUserUtterance:(id)a3 delegate:(id)a4 dataSource:(id)a5;
- (SRCompactEditableUtteranceViewController)initWithUserUtterance:(id)a3 delegate:(id)a4 dataSource:(id)a5 preferences:(id)a6;
- (SRCompactEditableUtteranceViewControllerDelegate)_delegate;
- (UITableView)_alternativesTableView;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (id)_attributedStringForTip;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_didShowTip;
- (void)_setAlternativesTableView:(id)a3;
- (void)_setDelegate:(id)a3;
- (void)_setDidUpdateShowTipCount:(BOOL)a3;
- (void)_setShouldShowTip:(BOOL)a3;
- (void)_setupAlternativesTableView;
- (void)didResignFirstResponderFromUtteranceView:(id)a3;
- (void)editableUtteranceView:(id)a3 didFinishEditingWithText:(id)a4;
- (void)editableUtteranceView:(id)a3 requestsKeyboardWithCompletion:(id)a4;
- (void)loadView;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5;
- (void)viewWillAppear:(BOOL)a3;
- (void)willBeginEditingFromUtteranceView:(id)a3;
@end

@implementation SRCompactEditableUtteranceViewController

- (SRCompactEditableUtteranceViewController)initWithUserUtterance:(id)a3 delegate:(id)a4 dataSource:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_alloc_init(&OBJC_CLASS___SRPreferences);
  v12 = -[SRCompactEditableUtteranceViewController initWithUserUtterance:delegate:dataSource:preferences:]( self,  "initWithUserUtterance:delegate:dataSource:preferences:",  v10,  v9,  v8,  v11);

  return v12;
}

- (SRCompactEditableUtteranceViewController)initWithUserUtterance:(id)a3 delegate:(id)a4 dataSource:(id)a5 preferences:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___SRCompactEditableUtteranceViewController;
  v15 = -[SRCompactEditableUtteranceViewController init](&v18, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_userUtterance, a3);
    objc_storeStrong((id *)&v16->_dataSource, a5);
    -[SRCompactEditableUtteranceViewController _setDelegate:](v16, "_setDelegate:", v12);
    -[SRCompactEditableUtteranceViewController _setupAlternativesTableView](v16, "_setupAlternativesTableView");
    objc_storeStrong((id *)&v16->_userPreferences, a6);
    if (-[SRPreferences showTapToEditTipCount](v16->_userPreferences, "showTapToEditTipCount") <= 1) {
      v16->_shouldShowTip = 1;
    }
  }

  return v16;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SRCompactEditableUtteranceViewController;
  -[SRCompactEditableUtteranceViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[SRCompactEditableUtteranceView beginEditing](self->_editableUtteranceView, "beginEditing");
}

- (void)loadView
{
  v3 = objc_alloc(&OBJC_CLASS___SRCompactEditableUtteranceView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v7 = -[SRCompactEditableUtteranceView initWithFrame:userUtterance:delegate:]( v3,  "initWithFrame:userUtterance:delegate:",  self->_userUtterance,  self,  CGRectZero.origin.x,  y,  width,  height);
  editableUtteranceView = self->_editableUtteranceView;
  self->_editableUtteranceView = v7;

  -[SRCompactEditableUtteranceView recursive_setSemanticContentAttribute:]( self->_editableUtteranceView,  "recursive_setSemanticContentAttribute:",  SiriLanguageSemanticContentAttribute(v9, v10));
  id v11 = self->_editableUtteranceView;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](&OBJC_CLASS___UIColor, "systemBackgroundColor"));
  -[SRCompactEditableUtteranceView setBackgroundColor:](v11, "setBackgroundColor:", v12);

  -[SRCompactEditableUtteranceViewController setView:](self, "setView:", self->_editableUtteranceView);
  id v13 = -[SRCompactLinkTappableTextView initWithFrame:]( objc_alloc(&OBJC_CLASS___SRCompactLinkTappableTextView),  "initWithFrame:",  CGRectZero.origin.x,  y,  width,  height);
  textViewForFooterText = self->_textViewForFooterText;
  self->_textViewForFooterText = &v13->super;

  v15 = self->_textViewForFooterText;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceViewController _attributedStringForTip](self, "_attributedStringForTip"));
  -[UITextView setAttributedText:](v15, "setAttributedText:", v16);

  v17 = self->_textViewForFooterText;
  +[UIFont smallSystemFontSize](&OBJC_CLASS___UIFont, "smallSystemFontSize");
  objc_super v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](&OBJC_CLASS___UIFont, "systemFontOfSize:"));
  -[UITextView setFont:](v17, "setFont:", v18);

  -[UITextView setEditable:](self->_textViewForFooterText, "setEditable:", 0LL);
  -[UITextView setScrollEnabled:](self->_textViewForFooterText, "setScrollEnabled:", 0LL);
  -[UITextView setTextContainerInset:](self->_textViewForFooterText, "setTextContainerInset:", 7.5, 15.0, 7.5, 15.0);
  -[UITextView setDelegate:](self->_textViewForFooterText, "setDelegate:", self);
  if (-[SRCompactEditableUtteranceViewController _shouldShowAlternativesTableView]( self,  "_shouldShowAlternativesTableView"))
  {
    v19 = self->_editableUtteranceView;
    id v20 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceViewController _alternativesTableView](self, "_alternativesTableView"));
    -[SRCompactEditableUtteranceView setAuxiliaryView:](v19, "setAuxiliaryView:", v20);
  }

  else if (-[SRCompactEditableUtteranceViewController _shouldShowTip](self, "_shouldShowTip"))
  {
    -[SRCompactEditableUtteranceView setAuxiliaryView:]( self->_editableUtteranceView,  "setAuxiliaryView:",  self->_textViewForFooterText);
    -[SRCompactEditableUtteranceViewController _didShowTip](self, "_didShowTip");
  }

- (void)editableUtteranceView:(id)a3 requestsKeyboardWithCompletion:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceViewController _delegate](self, "_delegate"));
  [v6 editableUtteranceViewController:self requestsKeyboardWithCompletion:v5];
}

- (void)willBeginEditingFromUtteranceView:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceViewController _delegate](self, "_delegate", a3));
  [v4 willBeginEditingFromUtteranceViewController:self];
}

- (void)didResignFirstResponderFromUtteranceView:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceViewController _delegate](self, "_delegate", a3));
  [v4 didResignFirstResponderFromUtteranceViewController:self];
}

- (void)editableUtteranceView:(id)a3 didFinishEditingWithText:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceViewController _delegate](self, "_delegate"));
  [v6 editableUtteranceViewController:self didFinishEditingWithText:v5];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t result = (int64_t)-[SRCompactEditableUtteranceViewControllerDataSource numberOfAlternativeUtterances]( self->_dataSource,  "numberOfAlternativeUtterances",  a3,  a4);
  if (result >= 3) {
    return 3LL;
  }
  return result;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1LL;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = off_1000D8730;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a3 dequeueReusableCellWithIdentifier:v6]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  [v8 setBackgroundColor:v9];

  dataSource = self->_dataSource;
  id v11 = [v7 row];

  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[SRCompactEditableUtteranceViewControllerDataSource attributedStringAtIndex:]( dataSource,  "attributedStringAtIndex:",  v11));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 textLabel]);
  [v13 setAttributedText:v12];

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 textLabel]);
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleSubheadline));
  [v14 setFont:v15];

  v16 = (void *)objc_claimAutoreleasedReturnValue([v8 textLabel]);
  objc_msgSend(v16, "recursive_setSemanticContentAttribute:", SiriLanguageSemanticContentAttribute(v16, v17));

  objc_super v18 = (void *)objc_claimAutoreleasedReturnValue([v8 textLabel]);
  [v18 setNumberOfLines:0];

  [v8 setSelectionStyle:0];
  return v8;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  *(void *)&double v4 = objc_opt_class(self, a2).n128_u64[0];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", v5, v4));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 siriUILocalizedStringForKey:@"TITLE_FOR_SPEECH_ALTERNATIVE_LIST" table:0]);
  id v8 = objc_alloc(&OBJC_CLASS___NSLocale);
  uint64_t v9 = AFUIGetLanguageCode();
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = -[NSLocale initWithLocaleIdentifier:](v8, "initWithLocaleIdentifier:", v10);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 uppercaseStringWithLocale:v11]);

  return v12;
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  id v9 = a4;
  objc_opt_class(&OBJC_CLASS___UITableViewHeaderFooterView, v5);
  if ((objc_opt_isKindOfClass(v9, v6) & 1) != 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v9 textLabel]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](&OBJC_CLASS___UIColor, "labelColor"));
    [v7 setTextColor:v8];
  }
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  if (-[SRCompactEditableUtteranceViewController _shouldShowTip](self, "_shouldShowTip", a3, a4))
  {
    -[SRCompactEditableUtteranceViewController _didShowTip](self, "_didShowTip");
    uint64_t v5 = -[UITableViewHeaderFooterView initWithFrame:]( objc_alloc(&OBJC_CLASS___UITableViewHeaderFooterView),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
    -[UITextView setTranslatesAutoresizingMaskIntoConstraints:]( self->_textViewForFooterText,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UITableViewHeaderFooterView addSubview:](v5, "addSubview:", self->_textViewForFooterText);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewHeaderFooterView topAnchor](v5, "topAnchor"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView topAnchor](self->_textViewForFooterText, "topAnchor"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 constraintEqualToAnchor:v7]);
    [v8 setActive:1];

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewHeaderFooterView bottomAnchor](v5, "bottomAnchor"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView bottomAnchor](self->_textViewForFooterText, "bottomAnchor"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 constraintEqualToAnchor:v10]);
    [v11 setActive:1];

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewHeaderFooterView leadingAnchor](v5, "leadingAnchor"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView leadingAnchor](self->_textViewForFooterText, "leadingAnchor"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 constraintEqualToAnchor:v13]);
    [v14 setActive:1];

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewHeaderFooterView trailingAnchor](v5, "trailingAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView trailingAnchor](self->_textViewForFooterText, "trailingAnchor"));
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v15 constraintEqualToAnchor:v16]);
    [v17 setActive:1];
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  return v5;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v5 = a3;
  double v6 = 0.0;
  if (-[SRCompactEditableUtteranceViewController _shouldShowTip](self, "_shouldShowTip"))
  {
    [v5 bounds];
    -[UITextView sizeThatFits:](self->_textViewForFooterText, "sizeThatFits:", v7, 1.79769313e308);
    double v6 = v8;
  }

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceViewController _delegate](self, "_delegate"));
  id v6 = [v5 row];

  [v7 editableUtteranceViewController:self alternativeSelectedAtIndex:v6];
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v7 = a4;
  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceViewController _delegate](self, "_delegate"));
  [v8 editableUtteranceViewController:self openURL:v7];

  return 0;
}

- (void)_setupAlternativesTableView
{
  if (-[SRCompactEditableUtteranceViewController _shouldShowAlternativesTableView]( self,  "_shouldShowAlternativesTableView"))
  {
    v3 = -[UITableView initWithFrame:style:]( objc_alloc(&OBJC_CLASS___UITableView),  "initWithFrame:style:",  1LL,  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
    -[SRCompactEditableUtteranceViewController _setAlternativesTableView:](self, "_setAlternativesTableView:", v3);

    double v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceViewController _alternativesTableView](self, "_alternativesTableView"));
    *(void *)&double v6 = objc_opt_class(&OBJC_CLASS___UITableViewCell, v5).n128_u64[0];
    objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", v7, off_1000D8730, v6);

    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceViewController _alternativesTableView](self, "_alternativesTableView"));
    [v8 setScrollEnabled:0];

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceViewController _alternativesTableView](self, "_alternativesTableView"));
    [v9 setDelegate:self];

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceViewController _alternativesTableView](self, "_alternativesTableView"));
    [v10 setDataSource:self];

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceViewController _alternativesTableView](self, "_alternativesTableView"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    [v11 setBackgroundColor:v12];

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceViewController _alternativesTableView](self, "_alternativesTableView"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor separatorColor](&OBJC_CLASS___UIColor, "separatorColor"));
    [v13 setSeparatorColor:v14];

    id v19 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactEditableUtteranceViewController _alternativesTableView](self, "_alternativesTableView"));
    *(void *)&double v16 = objc_opt_class(&OBJC_CLASS___UITableViewCell, v15).n128_u64[0];
    objc_msgSend(v19, "registerClass:forCellReuseIdentifier:", v17, off_1000D8730, v16);
  }

  else
  {
    objc_super v18 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[SRCompactEditableUtteranceViewController _setupAlternativesTableView]";
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%s #compact: no alternative utterances to display",  buf,  0xCu);
    }
  }

- (BOOL)_shouldShowAlternativesTableView
{
  return (uint64_t)-[SRCompactEditableUtteranceViewControllerDataSource numberOfAlternativeUtterances]( self->_dataSource,  "numberOfAlternativeUtterances") > 0;
}

- (id)_attributedStringForTip
{
  *(void *)&double v2 = objc_opt_class(self, a2).n128_u64[0];
  double v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", v3, v2));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( [v4 siriUILocalizedStringForKey:@"TEXT_FOR_SPEECH_ALTERNATIVE_LIST_TIP" table:0]);
  double v6 = (void *)objc_claimAutoreleasedReturnValue( [v4 siriUILocalizedStringForKey:@"TEXT_FOR_SPEECH_ALTERNATIVE_LIST_TIP_LINK" table:0]);
  id v7 = [v5 rangeOfString:v6 options:4];
  uint64_t v9 = v8;
  uint64_t v10 = -[NSAttributedString initWithString:](objc_alloc(&OBJC_CLASS___NSAttributedString), "initWithString:", v5);
  id v11 = -[NSAttributedString mutableCopy](v10, "mutableCopy");

  objc_msgSend( v11,  "addAttribute:value:range:",  NSLinkAttributeName,  @"prefs:root=SIRI%23-64&path=VOICE_FEEDBACK_ID%23-64",  v7,  v9);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](&OBJC_CLASS___UIColor, "secondaryLabelColor"));
  objc_msgSend(v11, "addAttribute:value:range:", NSForegroundColorAttributeName, v12, 0, objc_msgSend(v11, "length"));

  return v11;
}

- (void)_didShowTip
{
  if (!-[SRCompactEditableUtteranceViewController _didUpdateShowTipCount](self, "_didUpdateShowTipCount"))
  {
    -[SRCompactEditableUtteranceViewController _setDidUpdateShowTipCount:](self, "_setDidUpdateShowTipCount:", 1LL);
    -[SRPreferences setShowTapToEditTipCount:]( self->_userPreferences,  "setShowTapToEditTipCount:",  (char *)-[SRPreferences showTapToEditTipCount](self->_userPreferences, "showTapToEditTipCount") + 1);
  }

- (SRCompactEditableUtteranceViewControllerDelegate)_delegate
{
  return (SRCompactEditableUtteranceViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)_setDelegate:(id)a3
{
}

- (UITableView)_alternativesTableView
{
  return self->_alternativesTableView;
}

- (void)_setAlternativesTableView:(id)a3
{
}

- (BOOL)_shouldShowTip
{
  return self->_shouldShowTip;
}

- (void)_setShouldShowTip:(BOOL)a3
{
  self->_shouldShowTip = a3;
}

- (BOOL)_didUpdateShowTipCount
{
  return self->_didUpdateShowTipCount;
}

- (void)_setDidUpdateShowTipCount:(BOOL)a3
{
  self->_didUpdateShowTipCount = a3;
}

- (void).cxx_destruct
{
}

@end