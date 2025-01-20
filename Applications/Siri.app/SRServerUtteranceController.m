@interface SRServerUtteranceController
- (BOOL)_shouldSkipAnimationsInAlternateSpeeds;
- (double)_extendedTopPadding;
- (double)_insertionAnimatedZPosition;
- (double)_scaledTopPadding;
- (double)baselineOffsetFromBottom;
- (double)desiredHeightForWidth:(double)a3;
- (id)description;
- (int64_t)_insertionAnimation;
- (int64_t)_pinAnimationType;
- (int64_t)_replacementAnimation;
- (void)_loadFromObject:(id)a3;
- (void)loadView;
- (void)setAceObject:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation SRServerUtteranceController

- (void)setAceObject:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SRServerUtteranceController;
  id v4 = a3;
  -[SRServerUtteranceController setAceObject:](&v6, "setAceObject:", v4);
  -[SRServerUtteranceController _loadFromObject:](self, "_loadFromObject:", v4, v6.receiver, v6.super_class);

  utteranceView = self->_utteranceView;
  if (utteranceView) {
    -[SRServerUtteranceView setText:](utteranceView, "setText:", self->_utterance);
  }
}

- (void)_loadFromObject:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 text]);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v4 context]);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[AFUIUtilities parsedUtteranceFromText:context:]( &OBJC_CLASS___AFUIUtilities,  "parsedUtteranceFromText:context:",  v5,  v6));

  v8 = (NSString *)[v7 copy];
  utterance = self->_utterance;
  self->_utterance = v8;

  objc_opt_class(&OBJC_CLASS___SAUIAssistantTipView, v10);
  char isKindOfClass = objc_opt_isKindOfClass(v4, v11);
  self->_isTip = isKindOfClass & 1;
  if ((isKindOfClass & 1) != 0)
  {
    v13 = (NSString *)objc_claimAutoreleasedReturnValue([v4 tipPrefix]);
    utterancePrefix = self->_utterancePrefix;
    self->_utterancePrefix = v13;
  }

  v15 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v16 = v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue([v4 dialogIdentifier]);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v4 text]);
    int v19 = 136315650;
    v20 = "-[SRServerUtteranceController _loadFromObject:]";
    __int16 v21 = 2112;
    v22 = v17;
    __int16 v23 = 2112;
    v24 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%s dialogIdentifier:%@ utterance:%@",  (uint8_t *)&v19,  0x20u);
  }
}

- (void)loadView
{
  if (!self->_utteranceView)
  {
    BOOL isTip = self->_isTip;
    id v4 = -[SRServerUtteranceView initWithFrame:]( objc_alloc(&OBJC_CLASS___SRServerUtteranceView),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
    utteranceView = self->_utteranceView;
    self->_utteranceView = v4;

    objc_super v6 = self->_utteranceView;
    if (isTip)
    {
      -[SRServerUtteranceView setBlendEffectEnabled:](self->_utteranceView, "setBlendEffectEnabled:", 1LL);
      if (-[NSString length](self->_utterancePrefix, "length"))
      {
        v7 = objc_alloc(&OBJC_CLASS___NSMutableAttributedString);
        v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSString stringByAppendingString:]( self->_utterancePrefix,  "stringByAppendingString:",  self->_utterance));
        v9 = -[NSMutableAttributedString initWithString:](v7, "initWithString:", v8);

        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont siriui_serverTipPrefixFont](&OBJC_CLASS___UIFont, "siriui_serverTipPrefixFont"));
        -[NSMutableAttributedString addAttribute:value:range:]( v9,  "addAttribute:value:range:",  NSFontAttributeName,  v10,  0LL,  -[NSString length](self->_utterancePrefix, "length"));

        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont siriui_serverTipFont](&OBJC_CLASS___UIFont, "siriui_serverTipFont"));
        -[NSMutableAttributedString addAttribute:value:range:]( v9,  "addAttribute:value:range:",  NSFontAttributeName,  v11,  -[NSString length](self->_utterancePrefix, "length"),  -[NSString length](self->_utterance, "length"));

        -[SRServerUtteranceView setAttributedText:](self->_utteranceView, "setAttributedText:", v9);
LABEL_8:
        -[SRServerUtteranceController setView:](self, "setView:", self->_utteranceView);
        return;
      }

      v13 = self->_utteranceView;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont siriui_serverTipFont](&OBJC_CLASS___UIFont, "siriui_serverTipFont"));
      -[SRServerUtteranceView setFont:](v13, "setFont:", v14);
    }

    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont siriui_serverUtteranceFont](&OBJC_CLASS___UIFont, "siriui_serverUtteranceFont"));
      -[SRServerUtteranceView setFont:](v6, "setFont:", v12);

      -[SRServerUtteranceView setBlendEffectEnabled:](self->_utteranceView, "setBlendEffectEnabled:", 0LL);
    }

    -[SRServerUtteranceView setText:](self->_utteranceView, "setText:", self->_utterance);
    goto LABEL_8;
  }

- (void)viewDidAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SRServerUtteranceController;
  -[SRServerUtteranceController viewDidAppear:](&v8, "viewDidAppear:", a3);
  if (!-[SRServerUtteranceView chevronHasBeenShown](self->_utteranceView, "chevronHasBeenShown"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRServerUtteranceController delegate](self, "delegate"));
    char v5 = objc_opt_respondsToSelector(v4, "shouldEnableInteractionForSiriViewController:");

    if ((v5 & 1) != 0)
    {
      objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRServerUtteranceController delegate](self, "delegate"));
      unsigned int v7 = [v6 shouldEnableInteractionForSiriViewController:self];

      if (v7) {
        -[SRServerUtteranceController setUtteranceUserInteractionEnabled:]( self,  "setUtteranceUserInteractionEnabled:",  1LL);
      }
    }
  }

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SRServerUtteranceController;
  id v3 = -[SRServerUtteranceController description](&v7, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  char v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingFormat:@", %@", self->_utterance]);

  return v5;
}

- (double)desiredHeightForWidth:(double)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRServerUtteranceController view](self, "view"));
  objc_msgSend(v4, "sizeThatFits:", a3, 1.79769313e308);
  double v6 = v5;

  return v6;
}

- (double)baselineOffsetFromBottom
{
  return result;
}

- (double)_extendedTopPadding
{
  if (self->_isTip)
  {
    *(double *)&uint64_t v2 = 56.0;
LABEL_5:
    double v3 = *(double *)&v2;
    goto LABEL_9;
  }

  if ((SiriUIIsCompactWidth(self, a2) & 1) != 0)
  {
    *(double *)&uint64_t v2 = 62.0;
    goto LABEL_5;
  }

  else {
    double v3 = 94.0;
  }
LABEL_9:
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont siriui_serverUtteranceFont](&OBJC_CLASS___UIFont, "siriui_serverUtteranceFont"));
  [v4 _scaledValueForValue:v3];
  double v6 = v5;

  return v6;
}

- (double)_scaledTopPadding
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont siriui_serverUtteranceFont](&OBJC_CLASS___UIFont, "siriui_serverUtteranceFont"));
  [v2 _scaledValueForValue:42.0];
  double v4 = v3;

  return v4;
}

- (BOOL)_shouldSkipAnimationsInAlternateSpeeds
{
  return 1;
}

- (int64_t)_pinAnimationType
{
  return 2LL;
}

- (int64_t)_insertionAnimation
{
  return 1LL;
}

- (int64_t)_replacementAnimation
{
  return 2LL;
}

- (double)_insertionAnimatedZPosition
{
  return result;
}

- (void).cxx_destruct
{
}

@end