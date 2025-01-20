@interface SRUserUtteranceView
+ (double)insertionAnimatedZPosition;
- (BOOL)isBlendEffectEnabled;
- (BOOL)isEditable;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)text;
- (SRUserUtteranceView)initWithFrame:(CGRect)a3;
- (double)_indentWidth;
- (double)_scaledSiriTapToEditViewLeading;
- (double)_streamingTextMaxYToTapToEditOriginDistance;
- (double)baselineOffsetFromBottom;
- (double)firstLineBaselineOffsetFromTop;
- (void)layoutSubviews;
- (void)setBlendEffectEnabled:(BOOL)a3;
- (void)setChevronHidden:(BOOL)a3;
- (void)setEditable:(BOOL)a3;
- (void)setText:(id)a3;
@end

@implementation SRUserUtteranceView

- (SRUserUtteranceView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___SRUserUtteranceView;
  v7 = -[SRUserUtteranceView initWithFrame:](&v20, "initWithFrame:");
  if (v7)
  {
    v8 = -[SUICStreamingTextView initWithFrame:]( objc_alloc(&OBJC_CLASS___SUICStreamingTextView),  "initWithFrame:",  x,  y,  width,  height);
    streamingTextView = v7->_streamingTextView;
    v7->_streamingTextView = v8;

    v10 = v7->_streamingTextView;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont siriui_userUtteranceFont](&OBJC_CLASS___UIFont, "siriui_userUtteranceFont"));
    -[SUICStreamingTextView setFont:](v10, "setFont:", v11);

    id v12 = -[SUICStreamingTextView setAnimationDuration:](v7->_streamingTextView, "setAnimationDuration:", 0.3);
    v13 = v7->_streamingTextView;
    SiriUITextHyphenationFactor(v12);
    -[SUICStreamingTextView setHyphenationFactor:](v13, "setHyphenationFactor:");
    -[SRUserUtteranceView addSubview:](v7, "addSubview:", v7->_streamingTextView);
    v14 = -[SRTapToEditView initWithFrame:]( objc_alloc(&OBJC_CLASS___SRTapToEditView),  "initWithFrame:",  x,  y,  width,  height);
    tapToEditView = v7->_tapToEditView;
    v7->_tapToEditView = v14;

    -[SRUserUtteranceView addSubview:](v7, "addSubview:", v7->_tapToEditView);
    id v16 = -[SRTapToEditView setHidden:](v7->_tapToEditView, "setHidden:", 1LL);
    CGFloat v17 = SiriUIDefaultEdgePadding;
    v7->_edgeInsets.top = 0.0;
    v7->_edgeInsets.leading = v17;
    v7->_edgeInsets.bottom = 0.0;
    v7->_edgeInsets.trailing = v17;
    -[SRUserUtteranceView recursive_setSemanticContentAttribute:]( v7,  "recursive_setSemanticContentAttribute:",  SiriLanguageSemanticContentAttribute(v16, v18));
  }

  return v7;
}

- (void)setChevronHidden:(BOOL)a3
{
  if (self->_blendEffectEnabled)
  {
    -[SRTapToEditView setHidden:](self->_tapToEditView, "setHidden:", a3);
    -[SRUserUtteranceView setNeedsLayout](self, "setNeedsLayout");
  }

+ (double)insertionAnimatedZPosition
{
  return 500.0;
}

- (double)firstLineBaselineOffsetFromTop
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont siriui_userUtteranceFont](&OBJC_CLASS___UIFont, "siriui_userUtteranceFont"));
  [v2 ascender];
  double v4 = v3;

  return v4;
}

- (double)baselineOffsetFromBottom
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont siriui_userUtteranceFont](&OBJC_CLASS___UIFont, "siriui_userUtteranceFont"));
  [v3 descender];
  double v5 = v4;

  -[SRTapToEditView baselineOffsetFromBottom](self->_tapToEditView, "baselineOffsetFromBottom");
  return result;
}

- (NSString)text
{
  return (NSString *)-[SUICStreamingTextView text](self->_streamingTextView, "text");
}

- (void)setText:(id)a3
{
  id v4 = a3;
  uint64_t v33 = 0LL;
  v34 = &v33;
  uint64_t v35 = 0x3032000000LL;
  v36 = sub_100032F20;
  v37 = sub_100032F30;
  id v38 = 0LL;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](&OBJC_CLASS___NSCharacterSet, "whitespaceCharacterSet"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByTrimmingCharactersInSet:v5]);

  if (v6)
  {
    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v8 = (void *)v34[5];
    v34[5] = (uint64_t)v7;

    uint64_t v27 = 0LL;
    v28 = &v27;
    uint64_t v29 = 0x3032000000LL;
    v30 = sub_100032F20;
    v31 = sub_100032F30;
    id v32 = 0LL;
    if (((uint64_t (*)(void))SiriUIIsTextInputEnabled)())
    {
      id v9 = [v6 length];
      else {
        uint64_t v10 = (uint64_t)v9;
      }
    }

    else
    {
      uint64_t v10 = (uint64_t)[v6 length];
    }

    uint64_t v23 = 0LL;
    v24 = &v23;
    uint64_t v25 = 0x2020000000LL;
    char v26 = 0;
    v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472LL;
    CGFloat v17 = sub_100032F38;
    uint64_t v18 = &unk_1000BAD58;
    objc_super v20 = &v23;
    v21 = &v27;
    id v11 = v6;
    id v19 = v11;
    v22 = &v33;
    objc_msgSend(v11, "enumerateSubstringsInRange:options:usingBlock:", 0, v10, 1027, &v15);
    if (v28[5]) {
      objc_msgSend((id)v34[5], "addObject:", v15, v16, v17, v18);
    }
    id v12 = objc_msgSend((id)v34[5], "count", v15, v16, v17, v18);
    if (!v12)
    {
      id v12 = [v11 length];
      if (v12) {
        id v12 = [(id)v34[5] addObject:v11];
      }
    }

    if (SiriUIIsTextInputEnabled(v12) && (unint64_t)[v11 length] >= 0x8D)
    {
      v13 = (void *)v34[5];
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"…"));
      [v13 addObject:v14];
    }

    -[SUICStreamingTextView setWords:](self->_streamingTextView, "setWords:", v34[5]);
    -[SUICStreamingTextView siriui_setBlendEffectEnabled:]( self->_streamingTextView,  "siriui_setBlendEffectEnabled:",  self->_blendEffectEnabled);

    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(&v27, 8);
  }

  _Block_object_dispose(&v33, 8);
}

- (void)setBlendEffectEnabled:(BOOL)a3
{
  if (self->_blendEffectEnabled != a3)
  {
    self->_blendEffectEnabled = a3;
    if (a3)
    {
      id v4 = objc_alloc(&OBJC_CLASS___SUICStreamingTextView);
      -[SUICStreamingTextView frame](self->_streamingTextView, "frame");
      double v5 = -[SUICStreamingTextView initWithFrame:](v4, "initWithFrame:");
      clonedStreamingTextView = self->_clonedStreamingTextView;
      self->_clonedStreamingTextView = v5;

      -[SUICStreamingTextView recursive_setSemanticContentAttribute:]( self->_clonedStreamingTextView,  "recursive_setSemanticContentAttribute:",  SiriLanguageSemanticContentAttribute(v7, v8));
      id v9 = self->_clonedStreamingTextView;
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont siriui_userUtteranceFont](&OBJC_CLASS___UIFont, "siriui_userUtteranceFont"));
      -[SUICStreamingTextView setFont:](v9, "setFont:", v10);

      id v11 = -[SUICStreamingTextView setAnimationDuration:](self->_clonedStreamingTextView, "setAnimationDuration:", 0.0);
      id v12 = self->_clonedStreamingTextView;
      SiriUITextHyphenationFactor(v11);
      -[SUICStreamingTextView setHyphenationFactor:](v12, "setHyphenationFactor:");
      v13 = self->_clonedStreamingTextView;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[SUICStreamingTextView words](self->_streamingTextView, "words"));
      -[SUICStreamingTextView setWords:](v13, "setWords:", v14);

      -[SRUserUtteranceView addSubview:](self, "addSubview:", self->_clonedStreamingTextView);
      streamingTextView = self->_streamingTextView;
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor siriui_blendEffectColor](&OBJC_CLASS___UIColor, "siriui_blendEffectColor"));
      -[SUICStreamingTextView setEndTextColor:](streamingTextView, "setEndTextColor:", v16);

      -[SUICStreamingTextView siriui_setBlendEffectEnabled:]( self->_streamingTextView,  "siriui_setBlendEffectEnabled:",  1LL);
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472LL;
      v22[2] = sub_100033354;
      v22[3] = &unk_1000BA078;
      v22[4] = self;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_10003336C;
      v21[3] = &unk_1000BAD80;
      v21[4] = self;
      +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v22,  v21,  0.3);
      if (-[SRUserUtteranceView isEditable](self, "isEditable"))
      {
        -[SRTapToEditView setHidden:](self->_tapToEditView, "setHidden:", 0LL);
        -[SRTapToEditView setAlpha:](self->_tapToEditView, "setAlpha:", 0.0);
        v19[4] = self;
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472LL;
        v20[2] = sub_1000333A8;
        v20[3] = &unk_1000BA078;
        v20[4] = self;
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472LL;
        v19[2] = sub_1000333C0;
        v19[3] = &unk_1000BAD80;
        +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v20,  v19,  0.3);
      }
    }

    else
    {
      CGFloat v17 = self->_streamingTextView;
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor lightTextColor](&OBJC_CLASS___UIColor, "lightTextColor"));
      -[SUICStreamingTextView setEndTextColor:](v17, "setEndTextColor:", v18);

      -[SUICStreamingTextView siriui_setBlendEffectEnabled:]( self->_streamingTextView,  "siriui_setBlendEffectEnabled:",  0LL);
    }
  }

- (BOOL)isBlendEffectEnabled
{
  return self->_blendEffectEnabled;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = -[SRUserUtteranceView _indentWidth](self, "_indentWidth");
  -[SUICStreamingTextView sizeThatFits:]( self->_streamingTextView,  "sizeThatFits:",  SiriUIUtteranceWidthForAvailableWidthAndInsets( v6,  width - v7,  self->_edgeInsets.top,  self->_edgeInsets.leading,  self->_edgeInsets.bottom,  self->_edgeInsets.trailing),  1.79769313e308);
  double v9 = v8;
  if (!-[SRTapToEditView isHidden](self->_tapToEditView, "isHidden") || self->_chevronHasBeenShown)
  {
    -[SRUserUtteranceView _streamingTextMaxYToTapToEditOriginDistance]( self,  "_streamingTextMaxYToTapToEditOriginDistance");
    double v11 = v9 + v10;
    -[SRTapToEditView sizeThatFits:](self->_tapToEditView, "sizeThatFits:", width, height);
    double v9 = v11 + v12;
  }

  double v13 = width;
  double v14 = v9;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (void)layoutSubviews
{
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___SRUserUtteranceView;
  -[SRUserUtteranceView layoutSubviews](&v33, "layoutSubviews");
  -[SRUserUtteranceView bounds](self, "bounds");
  CGFloat x = v34.origin.x;
  double y = v34.origin.y;
  CGFloat width = v34.size.width;
  CGFloat height = v34.size.height;
  double v7 = CGRectGetWidth(v34);
  id v8 = -[SRUserUtteranceView _indentWidth](self, "_indentWidth");
  double v10 = SiriUIUtteranceWidthForAvailableWidthAndInsets( v8,  v7 - v9,  self->_edgeInsets.top,  self->_edgeInsets.leading,  self->_edgeInsets.bottom,  self->_edgeInsets.trailing);
  v35.origin.CGFloat x = x;
  v35.origin.double y = y;
  v35.size.CGFloat width = width;
  v35.size.CGFloat height = height;
  double v11 = CGRectGetHeight(v35);
  id v12 = -[SUICStreamingTextView sizeThatFits:](self->_streamingTextView, "sizeThatFits:", v10, v11);
  double v14 = v13;
  if (SiriLanguageIsRTL(v12, v15))
  {
    v36.origin.CGFloat x = x;
    v36.origin.double y = y;
    v36.size.CGFloat width = width;
    v36.size.CGFloat height = height;
    CGFloat v16 = CGRectGetWidth(v36) - v10 - self->_edgeInsets.leading;
    -[SRUserUtteranceView _indentWidth](self, "_indentWidth");
    double v18 = v16 - v17;
  }

  else
  {
    double leading = self->_edgeInsets.leading;
    -[SRUserUtteranceView _indentWidth](self, "_indentWidth");
    double v18 = leading + v20;
  }

  -[SUICStreamingTextView setFrame:](self->_clonedStreamingTextView, "setFrame:", v18, y, v10, v14);
  -[SUICStreamingTextView setFrame:](self->_streamingTextView, "setFrame:", v18, y, v10, v14);
  if ((-[SRTapToEditView isHidden](self->_tapToEditView, "isHidden") & 1) == 0)
  {
    id v21 = -[SRTapToEditView sizeThatFits:](self->_tapToEditView, "sizeThatFits:", v10, v11);
    double v31 = v23;
    double v32 = v22;
    double v25 = v18;
    if (SiriLanguageIsRTL(v21, v24))
    {
      v37.origin.CGFloat x = x;
      v37.origin.double y = y;
      v37.size.CGFloat width = width;
      v37.size.CGFloat height = height;
      double v26 = CGRectGetWidth(v37);
      v38.origin.CGFloat x = 0.0;
      v38.origin.double y = 0.0;
      v38.size.CGFloat height = v31;
      v38.size.CGFloat width = v32;
      double v27 = v26 - CGRectGetWidth(v38) - self->_edgeInsets.leading;
      -[SRUserUtteranceView _indentWidth](self, "_indentWidth");
      double v25 = v27 - v28;
    }

    v39.origin.CGFloat x = v18;
    v39.origin.double y = y;
    v39.size.CGFloat width = v10;
    v39.size.CGFloat height = v14;
    double MaxY = CGRectGetMaxY(v39);
    -[SRUserUtteranceView _streamingTextMaxYToTapToEditOriginDistance]( self,  "_streamingTextMaxYToTapToEditOriginDistance");
    -[SRTapToEditView setFrame:](self->_tapToEditView, "setFrame:", v25, MaxY + v30, v32, v31);
  }

- (double)_streamingTextMaxYToTapToEditOriginDistance
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v3 scale];
  double v5 = v4;
  -[SRUserUtteranceView _scaledSiriTapToEditViewLeading](self, "_scaledSiriTapToEditViewLeading");
  double v7 = v6;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SUICStreamingTextView font](self->_streamingTextView, "font"));
  [v8 descender];
  double v10 = v7 + v9;
  -[SRTapToEditView firstLineBaselineOffsetFromTop](self->_tapToEditView, "firstLineBaselineOffsetFromTop");
  double v12 = v10 - v11;
  double v13 = floor(v12);
  if (v5 < 2.0) {
    double v14 = v13;
  }
  else {
    double v14 = v12;
  }

  return v14;
}

- (double)_indentWidth
{
  double v2 = 28.0;
  if ((SiriUIIsCompactWidth(self, a2) & 1) == 0)
  {
    else {
      return 31.0;
    }
  }

  return v2;
}

- (double)_scaledSiriTapToEditViewLeading
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont siriui_serverUtteranceCorrectionPromptFont]( &OBJC_CLASS___UIFont,  "siriui_serverUtteranceCorrectionPromptFont"));
  [v2 _scaledValueForValue:26.0];
  double v4 = v3;

  return v4;
}

- (BOOL)isEditable
{
  return self->_editable;
}

- (void)setEditable:(BOOL)a3
{
  self->_editable = a3;
}

- (void).cxx_destruct
{
}

@end