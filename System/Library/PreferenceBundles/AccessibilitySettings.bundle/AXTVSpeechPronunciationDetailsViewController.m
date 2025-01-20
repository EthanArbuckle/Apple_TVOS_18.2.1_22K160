@interface AXTVSpeechPronunciationDetailsViewController
- (AXTVSpeechPronunciationDetailsViewController)initWithCoder:(id)a3;
- (AXTVSpeechPronunciationDetailsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (AXTVSpeechPronunciationDetailsViewController)initWithPronunciation:(id)a3;
- (AXTVSpeechPronunciationDetailsViewController)initWithStyle:(int64_t)a3;
- (TSKTextInputViewController)originalTextInputController;
- (TSKTextInputViewController)replacementTextInputController;
- (TTSSpeechManager)speechManager;
- (TTSSubstitution)pronunciation;
- (UIBarButtonItem)playButtonItem;
- (id)_pronunciationReplacementGroup;
- (id)_pronunciationSettingsGroup;
- (id)_selectedLanguagesValueFormatter;
- (id)loadSettingGroups;
- (void)_editOriginalString:(id)a3;
- (void)_editReplacementString:(id)a3;
- (void)_playReplacement:(id)a3;
- (void)_updateNavigationItem;
- (void)editingController:(id)a3 didProvideValue:(id)a4 forSettingItem:(id)a5;
- (void)loadView;
- (void)setOriginalTextInputController:(id)a3;
- (void)setPlayButtonItem:(id)a3;
- (void)setPronunciation:(id)a3;
- (void)setReplacementTextInputController:(id)a3;
- (void)setSpeechManager:(id)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation AXTVSpeechPronunciationDetailsViewController

- (AXTVSpeechPronunciationDetailsViewController)initWithPronunciation:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___AXTVSpeechPronunciationDetailsViewController;
  v5 = -[AXTVSpeechPronunciationDetailsViewController initWithStyle:](&v8, "initWithStyle:", 1LL);
  v6 = v5;
  if (v5) {
    -[AXTVSpeechPronunciationDetailsViewController setPronunciation:](v5, "setPronunciation:", v4);
  }

  return v6;
}

- (AXTVSpeechPronunciationDetailsViewController)initWithStyle:(int64_t)a3
{
  return -[AXTVSpeechPronunciationDetailsViewController initWithPronunciation:](self, "initWithPronunciation:", 0LL);
}

- (AXTVSpeechPronunciationDetailsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[AXTVSpeechPronunciationDetailsViewController initWithPronunciation:](self, "initWithPronunciation:", 0LL, a4);
}

- (AXTVSpeechPronunciationDetailsViewController)initWithCoder:(id)a3
{
  return -[AXTVSpeechPronunciationDetailsViewController initWithPronunciation:](self, "initWithPronunciation:", 0LL);
}

- (TTSSpeechManager)speechManager
{
  speechManager = self->_speechManager;
  if (!speechManager)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___TTSSpeechManager);
    v5 = self->_speechManager;
    self->_speechManager = v4;

    speechManager = self->_speechManager;
  }

  return speechManager;
}

- (id)loadSettingGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[AXTVSpeechPronunciationDetailsViewController _pronunciationReplacementGroup]( self,  "_pronunciationReplacementGroup"));
  [v3 axSafelyAddObject:v4];

  v5 = (void *)objc_claimAutoreleasedReturnValue( -[AXTVSpeechPronunciationDetailsViewController _pronunciationSettingsGroup]( self,  "_pronunciationSettingsGroup"));
  [v3 axSafelyAddObject:v5];

  return v3;
}

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AXTVSpeechPronunciationDetailsViewController;
  -[AXTVSpeechPronunciationDetailsViewController loadView](&v3, "loadView");
  -[AXTVSpeechPronunciationDetailsViewController _updateNavigationItem](self, "_updateNavigationItem");
}

- (void)_updateNavigationItem
{
  id v30 = (id)objc_claimAutoreleasedReturnValue(-[AXTVSpeechPronunciationDetailsViewController navigationItem](self, "navigationItem"));
  id v10 = AXTVLocString(@"AXSpeechPronunciationReplacementTitle", v3, v4, v5, v6, v7, v8, v9, v28);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  [v30 setTitle:v11];

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSpeechPronunciationDetailsViewController playButtonItem](self, "playButtonItem"));
  if (!v12)
  {
    v13 = objc_alloc(&OBJC_CLASS___UIBarButtonItem);
    id v21 = AXTVLocString(@"AXSpeechPronunciationPlayButtonTitle", v14, v15, v16, v17, v18, v19, v20, v29);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v23 = -[UIBarButtonItem initWithTitle:style:target:action:]( v13,  "initWithTitle:style:target:action:",  v22,  0LL,  self,  "_playReplacement:");
    -[AXTVSpeechPronunciationDetailsViewController setPlayButtonItem:](self, "setPlayButtonItem:", v23);
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSpeechPronunciationDetailsViewController pronunciation](self, "pronunciation"));
  v25 = (void *)objc_claimAutoreleasedReturnValue([v24 replacementString]);
  id v26 = [v25 length];

  if (v26)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSpeechPronunciationDetailsViewController playButtonItem](self, "playButtonItem"));
    [v30 setRightBarButtonItem:v27];
  }

  else
  {
    [v30 setRightBarButtonItem:0];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___AXTVSpeechPronunciationDetailsViewController;
  -[AXTVSpeechPronunciationDetailsViewController viewWillDisappear:](&v10, "viewWillDisappear:", a3);
  if (-[AXTVSpeechPronunciationDetailsViewController isMovingFromParentViewController]( self,  "isMovingFromParentViewController"))
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSpeechPronunciationDetailsViewController pronunciation](self, "pronunciation"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 languages]);
    unsigned int v6 = [v5 containsObject:@"all-languages"];

    if (v6)
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSpeechPronunciationDetailsViewController pronunciation](self, "pronunciation"));
      [v7 setLanguages:0];
    }

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVUtils sharedInstance](&OBJC_CLASS___AXTVUtils, "sharedInstance"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSpeechPronunciationDetailsViewController pronunciation](self, "pronunciation"));
    [v8 savePronunciationToSettingsIfNeeded:v9 syncWithIcloud:1];
  }

- (id)_pronunciationReplacementGroup
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSpeechPronunciationDetailsViewController pronunciation](self, "pronunciation"));
  id v4 = [[TSKSettingGroup alloc] initWithTitle:0];
  id v12 = AXTVLocString(@"AXSpeechPronunciationReplacementDescription", v5, v6, v7, v8, v9, v10, v11, (uint64_t)v36);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  [v4 setLocalizedDescription:v13];

  uint64_t v14 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v22 = AXTVLocString( @"AXSpeechPronunciationOriginalStringTitle",  v15,  v16,  v17,  v18,  v19,  v20,  v21,  (uint64_t)v36);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v23,  0LL,  v3,  @"originalString",  self,  "_editOriginalString:"));

  -[NSMutableArray addObject:](v14, "addObject:", v24);
  objc_initWeak(&location, self);
  id v32 = AXTVLocString( @"AXSpeechPronunciationReplacementStringTitle",  v25,  v26,  v27,  v28,  v29,  v30,  v31,  (uint64_t)v36);
  v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
  v34 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v33,  0LL,  v3,  @"replacementString",  self,  "_editReplacementString:"));

  v36 = _NSConcreteStackBlock;
  uint64_t v37 = 3221225472LL;
  v38 = sub_E7B4;
  v39 = &unk_65798;
  objc_copyWeak(&v40, &location);
  [v34 setUpdateBlock:&v36];
  -[NSMutableArray addObject:](v14, "addObject:", v34, v36, v37, v38, v39);
  [v4 setSettingItems:v14];
  objc_destroyWeak(&v40);
  objc_destroyWeak(&location);

  return v4;
}

- (id)_pronunciationSettingsGroup
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSpeechPronunciationDetailsViewController pronunciation](self, "pronunciation"));
  id v4 = [[TSKSettingGroup alloc] initWithTitle:0];
  uint64_t v5 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v13 = AXTVLocString(@"AXSpeechPronunciationLanguageTitle", v6, v7, v8, v9, v10, v11, v12, v29);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSpeechPronunciationDetailsViewController pronunciation](self, "pronunciation"));
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_EA34;
  v31[3] = &unk_657E8;
  v31[4] = self;
  objc_copyWeak(&v32, &location);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v14,  0LL,  v15,  @"languages",  v31));

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[AXTVSpeechPronunciationDetailsViewController _selectedLanguagesValueFormatter]( self,  "_selectedLanguagesValueFormatter"));
  [v16 setLocalizedValueFormatter:v17];

  -[NSMutableArray addObject:](v5, "addObject:", v16);
  id v25 = AXTVLocString(@"AXSpeechPronunciationIgnoreCaseTitle", v18, v19, v20, v21, v22, v23, v24, v30);
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v26,  0LL,  v3,  @"ignoreCase",  0LL,  0LL));

  -[NSMutableArray addObject:](v5, "addObject:", v27);
  [v4 setSettingItems:v5];
  objc_destroyWeak(&v32);

  objc_destroyWeak(&location);
  return v4;
}

- (void)_editOriginalString:(id)a3
{
  uint64_t v27 = objc_alloc_init(&OBJC_CLASS___TSKTextInputViewController);
  id v11 = AXTVLocString(@"AXSpeechPronunciationAddPhrasePromptTitle", v4, v5, v6, v7, v8, v9, v10, v25);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  -[TSKTextInputViewController setHeaderText:](v27, "setHeaderText:", v12);

  id v20 = AXTVLocString(@"AXSpeechPronunciationAddPhrasePromptMessage", v13, v14, v15, v16, v17, v18, v19, v26);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  -[TSKTextInputViewController setMessageText:](v27, "setMessageText:", v21);

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSpeechPronunciationDetailsViewController pronunciation](self, "pronunciation"));
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 originalString]);
  -[TSKTextInputViewController setInitialText:](v27, "setInitialText:", v23);

  -[TSKTextInputViewController setEditingDelegate:](v27, "setEditingDelegate:", self);
  -[AXTVSpeechPronunciationDetailsViewController setOriginalTextInputController:]( self,  "setOriginalTextInputController:",  v27);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSpeechPronunciationDetailsViewController navigationController](self, "navigationController"));
  [v24 pushViewController:v27 animated:1];
}

- (void)_editReplacementString:(id)a3
{
  uint64_t v28 = objc_alloc_init(&OBJC_CLASS___TSKTextInputViewController);
  id v11 = AXTVLocString(@"AXSpeechPronunciationAddReplacementPromptTitle", v4, v5, v6, v7, v8, v9, v10, v27);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  -[TSKTextInputViewController setHeaderText:](v28, "setHeaderText:", v12);

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSpeechPronunciationDetailsViewController pronunciation](self, "pronunciation"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 originalString]);
  id v22 = AXTVLocString( @"AXSpeechPronunciationAddReplacementPromptMessage",  v15,  v16,  v17,  v18,  v19,  v20,  v21,  (uint64_t)v14);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  -[TSKTextInputViewController setMessageText:](v28, "setMessageText:", v23);

  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSpeechPronunciationDetailsViewController pronunciation](self, "pronunciation"));
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 replacementString]);
  -[TSKTextInputViewController setInitialText:](v28, "setInitialText:", v25);

  -[TSKTextInputViewController setEditingDelegate:](v28, "setEditingDelegate:", self);
  -[AXTVSpeechPronunciationDetailsViewController setReplacementTextInputController:]( self,  "setReplacementTextInputController:",  v28);
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSpeechPronunciationDetailsViewController navigationController](self, "navigationController"));
  [v26 pushViewController:v28 animated:1];
}

- (void)editingController:(id)a3 didProvideValue:(id)a4 forSettingItem:(id)a5
{
  id v15 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
  {
    id v9 = v7;
    if (![v9 length])
    {
LABEL_10:

      goto LABEL_11;
    }

    id v10 = (id)objc_claimAutoreleasedReturnValue( -[AXTVSpeechPronunciationDetailsViewController originalTextInputController]( self,  "originalTextInputController"));

    if (v10 == v15)
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSpeechPronunciationDetailsViewController pronunciation](self, "pronunciation"));
      [v12 setOriginalString:v9];
    }

    else
    {
      id v11 = (id)objc_claimAutoreleasedReturnValue( -[AXTVSpeechPronunciationDetailsViewController replacementTextInputController]( self,  "replacementTextInputController"));

      if (v11 != v15)
      {
LABEL_9:
        -[AXTVSpeechPronunciationDetailsViewController reloadSettings](self, "reloadSettings");
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[AXTVSpeechPronunciationDetailsViewController navigationController]( self,  "navigationController"));
        id v14 = [v13 popViewControllerAnimated:1];

        goto LABEL_10;
      }

      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSpeechPronunciationDetailsViewController pronunciation](self, "pronunciation"));
      [v12 setReplacementString:v9];
    }

    goto LABEL_9;
  }

  _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/ATVAccessibility/settings/AccessibilitySettings/source/AXTVSpeechPronunciation DetailsViewController.m",  207LL,  "-[AXTVSpeechPronunciationDetailsViewController editingController:didProvideValue:forSettingItem:]",  @"Expected incoming value to be a string. %@");
LABEL_11:
}

- (void)_playReplacement:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSpeechPronunciationDetailsViewController pronunciation](self, "pronunciation", a3));
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 replacementString]);
    id v7 = [v6 length];

    if (v7)
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"));
      [v8 setActive:1 error:0];

      id v9 = objc_alloc_init(&OBJC_CLASS___TTSSpeechAction);
      -[TTSSpeechAction setShouldQueue:](v9, "setShouldQueue:", 0LL);
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 languages]);
      if ([v10 count] == (char *)&dword_0 + 1)
      {
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 languages]);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 anyObject]);
        -[TTSSpeechAction setLanguage:](v9, "setLanguage:", v12);
      }

      else
      {
        -[TTSSpeechAction setLanguage:](v9, "setLanguage:", 0LL);
      }

      -[TTSSpeechAction setIgnoreCustomSubstitutions:](v9, "setIgnoreCustomSubstitutions:", 1LL);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v5 phonemes]);
      id v14 = [v13 length];

      if (v14)
      {
        id v15 = objc_alloc(&OBJC_CLASS___NSAttributedString);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v5 replacementString]);
        uint64_t v21 = AVSpeechSynthesisIPANotationAttribute;
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v5 phonemes]);
        id v22 = v17;
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
        uint64_t v19 = -[NSAttributedString initWithString:attributes:](v15, "initWithString:attributes:", v16, v18);

        -[TTSSpeechAction setAttributedString:](v9, "setAttributedString:", v19);
      }

      else
      {
        uint64_t v19 = (NSAttributedString *)objc_claimAutoreleasedReturnValue([v5 replacementString]);
        -[TTSSpeechAction setString:](v9, "setString:", v19);
      }

      -[TTSSpeechAction setCompletionCallback:](v9, "setCompletionCallback:", &stru_65828);
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSpeechPronunciationDetailsViewController speechManager](self, "speechManager"));
      [v20 dispatchSpeechAction:v9];
    }
  }
}

- (id)_selectedLanguagesValueFormatter
{
  return [[TVSBlockFormatter alloc] initWithFormattingBlock:&stru_65868];
}

- (TTSSubstitution)pronunciation
{
  return self->_pronunciation;
}

- (void)setPronunciation:(id)a3
{
}

- (UIBarButtonItem)playButtonItem
{
  return self->_playButtonItem;
}

- (void)setPlayButtonItem:(id)a3
{
}

- (void)setSpeechManager:(id)a3
{
}

- (TSKTextInputViewController)originalTextInputController
{
  return self->_originalTextInputController;
}

- (void)setOriginalTextInputController:(id)a3
{
}

- (TSKTextInputViewController)replacementTextInputController
{
  return self->_replacementTextInputController;
}

- (void)setReplacementTextInputController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end