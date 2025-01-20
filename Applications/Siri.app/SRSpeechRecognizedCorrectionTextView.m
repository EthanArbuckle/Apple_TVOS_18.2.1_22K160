@interface SRSpeechRecognizedCorrectionTextView
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)keyboardInput:(id)a3 shouldInsertText:(id)a4 isMarkedText:(BOOL)a5;
- (BOOL)resignFirstResponder;
- (SRSpeechRecognizedCorrectionTextView)initWithFrame:(CGRect)a3;
- (id)undoManager;
- (void)clearDictationResults;
- (void)setText:(id)a3;
@end

@implementation SRSpeechRecognizedCorrectionTextView

- (SRSpeechRecognizedCorrectionTextView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___SRSpeechRecognizedCorrectionTextView;
  v3 = -[SRSpeechRecognizedCorrectionTextView initWithFrame:]( &v10,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont siriui_userUtteranceFont](&OBJC_CLASS___UIFont, "siriui_userUtteranceFont"));
    -[SRSpeechRecognizedCorrectionTextView setFont:](v3, "setFont:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor siriui_lightTextColor](&OBJC_CLASS___UIColor, "siriui_lightTextColor"));
    -[SRSpeechRecognizedCorrectionTextView setTextColor:](v3, "setTextColor:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[SRSpeechRecognizedCorrectionTextView setBackgroundColor:](v3, "setBackgroundColor:", v6);

    -[SRSpeechRecognizedCorrectionTextView setTextAlignment:](v3, "setTextAlignment:", 2LL);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor siriui_lightInsertionPointColor](&OBJC_CLASS___UIColor, "siriui_lightInsertionPointColor"));
    -[SRSpeechRecognizedCorrectionTextView setInsertionPointColor:](v3, "setInsertionPointColor:", v7);

    -[SRSpeechRecognizedCorrectionTextView setBounces:](v3, "setBounces:", 0LL);
    -[SRSpeechRecognizedCorrectionTextView setClipsToBounds:](v3, "setClipsToBounds:", 0LL);
    -[SRSpeechRecognizedCorrectionTextView setScrollEnabled:](v3, "setScrollEnabled:", 0LL);
    -[SRSpeechRecognizedCorrectionTextView setReturnKeyType:](v3, "setReturnKeyType:", 9LL);
    -[SRSpeechRecognizedCorrectionTextView setKeyboardAppearance:](v3, "setKeyboardAppearance:", 1LL);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSpeechRecognizedCorrectionTextView textContainer](v3, "textContainer"));
    [v8 setLineFragmentPadding:0.0];
  }

  return v3;
}

- (void)clearDictationResults
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SRSpeechRecognizedCorrectionTextView text](self, "text"));
  -[SRSpeechRecognizedCorrectionTextView setText:](self, "setText:", v3);
}

- (void)setText:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___SRSpeechRecognizedCorrectionTextView;
  id v4 = a3;
  -[SRSpeechRecognizedCorrectionTextView setText:](&v18, "setText:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 languageCode]);
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
    id v8 = (id)objc_claimAutoreleasedReturnValue([v9 bestSupportedLanguageCodeForLanguageCode:0]);
  }

  unsigned int v10 = [v8 isEqualToString:@"th-TH"];
  id v11 = -[SRSpeechRecognizedCorrectionTextView textAlignment](self, "textAlignment");
  if (v10) {
    uint64_t v12 = objc_claimAutoreleasedReturnValue( +[SiriUIFontScalingUtilities tallParagraphStyleForCurrentScaleWithTextAlignment:]( &OBJC_CLASS___SiriUIFontScalingUtilities,  "tallParagraphStyleForCurrentScaleWithTextAlignment:",  v11));
  }
  else {
    uint64_t v12 = objc_claimAutoreleasedReturnValue( +[SiriUIFontScalingUtilities paragraphStyleForCurrentScaleWithTextAlignment:]( &OBJC_CLASS___SiriUIFontScalingUtilities,  "paragraphStyleForCurrentScaleWithTextAlignment:",  v11));
  }
  v13 = (void *)v12;
  v20[0] = v12;
  v19[0] = NSParagraphStyleAttributeName;
  v19[1] = NSFontAttributeName;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SRSpeechRecognizedCorrectionTextView font](self, "font"));
  v20[1] = v14;
  v19[2] = NSForegroundColorAttributeName;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SRSpeechRecognizedCorrectionTextView textColor](self, "textColor"));
  v19[3] = @"NSLanguage";
  v20[2] = v15;
  v20[3] = v8;
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  v19,  4LL));

  v17 = -[NSAttributedString initWithString:attributes:]( objc_alloc(&OBJC_CLASS___NSAttributedString),  "initWithString:attributes:",  v4,  v16);
  -[SRSpeechRecognizedCorrectionTextView setAttributedText:](self, "setAttributedText:", v17);
}

- (id)undoManager
{
  return 0LL;
}

- (BOOL)canBecomeFirstResponder
{
  unsigned int v3 = -[SRSpeechRecognizedCorrectionTextView isEditable](self, "isEditable");
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS___SRSpeechRecognizedCorrectionTextView;
    LOBYTE(v3) = -[SRSpeechRecognizedCorrectionTextView canBecomeFirstResponder](&v5, "canBecomeFirstResponder");
  }

  return v3;
}

- (BOOL)becomeFirstResponder
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SRSpeechRecognizedCorrectionTextView;
  BOOL v3 = -[SRSpeechRecognizedCorrectionTextView becomeFirstResponder](&v6, "becomeFirstResponder");
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSpeechRecognizedCorrectionTextView delegate](self, "delegate"));
    [v4 utteranceTextDidBecomeFirstResponder:self];
  }

  return v3;
}

- (BOOL)resignFirstResponder
{
  unsigned int v3 = -[SRSpeechRecognizedCorrectionTextView isFirstResponder](self, "isFirstResponder");
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SRSpeechRecognizedCorrectionTextView;
  unsigned int v4 = -[SRSpeechRecognizedCorrectionTextView resignFirstResponder](&v8, "resignFirstResponder");
  BOOL v5 = v4;
  if (v3 && v4)
  {
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSpeechRecognizedCorrectionTextView delegate](self, "delegate"));
    [v6 utteranceTextDidResignFirstResponder:self];
  }

  return v5;
}

- (BOOL)keyboardInput:(id)a3 shouldInsertText:(id)a4 isMarkedText:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSpeechRecognizedCorrectionTextView delegate](self, "delegate"));
  unsigned int v11 = [v10 conformsToProtocol:&OBJC_PROTOCOL___SRUtteranceCorrectionTextViewDelegate];

  if (v11)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SRSpeechRecognizedCorrectionTextView delegate](self, "delegate"));
  }

  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___SRSpeechRecognizedCorrectionTextView;
  BOOL v13 = -[SRSpeechRecognizedCorrectionTextView keyboardInput:shouldInsertText:isMarkedText:]( &v15,  "keyboardInput:shouldInsertText:isMarkedText:",  v8,  v9,  v5);

  return v13;
}

@end