@interface VOTOutputBrailleComponent
- (void)_handlePerformAction:(id)a3;
- (void)handleEvent:(id)a3;
@end

@implementation VOTOutputBrailleComponent

- (void)_handlePerformAction:(id)a3
{
  id v4 = a3;
  id v22 = (id)objc_claimAutoreleasedReturnValue([v4 objectForIndex:14]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForVariant:34]);
  LODWORD(v6) = [v5 intValue];

  v7 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForVariant:35]);
  id v8 = [v7 rangeValue];
  uint64_t v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[VOTOutputComponent determineLanguageForEvent:](self, "determineLanguageForEvent:", v4));

  v12 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForVariant:36]);
  v13 = v12;
  if (v12) {
    [v12 doubleValue];
  }
  else {
    +[VOTBrailleManager currentDefaultBrailleAlertTimeout]( &OBJC_CLASS___VOTBrailleManager,  "currentDefaultBrailleAlertTimeout");
  }
  double v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForVariant:58]);
  unsigned __int8 v17 = [v16 BOOLValue];

  v18 = (void *)objc_claimAutoreleasedReturnValue([v22 string]);
  if (([(id)VOTSharedWorkspace emojiFeedback] & 0x10) == 0 && (v17 & 1) == 0)
  {
    uint64_t v19 = objc_claimAutoreleasedReturnValue( +[TTSEmojiUtilities stringByRemovingEmojiCharacters:]( &OBJC_CLASS___TTSEmojiUtilities,  "stringByRemovingEmojiCharacters:",  v18));

    v18 = (void *)v19;
  }

  if ((_DWORD)v6) {
    uint64_t v6 = v6;
  }
  else {
    uint64_t v6 = 2LL;
  }
  id v20 = [objc_allocWithZone(NSMutableAttributedString) initWithString:v18];
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[VOTBrailleManager manager](&OBJC_CLASS___VOTBrailleManager, "manager"));
  objc_msgSend( v21,  "setBrailleString:type:timeout:langCode:brailleLineRange:isBrailleLineRangeKnown:",  v20,  v6,  v11,  v8,  v10,  v7 != 0,  v15);
}

- (void)handleEvent:(id)a3
{
  id v6 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForIndex:1]);
  unsigned int v5 = [v4 unsignedIntValue];

  if (v5 == 6) {
    -[VOTOutputBrailleComponent _handlePerformAction:](self, "_handlePerformAction:", v6);
  }
}

@end