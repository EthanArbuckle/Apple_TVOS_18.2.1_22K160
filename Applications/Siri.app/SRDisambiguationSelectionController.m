@interface SRDisambiguationSelectionController
- (double)baselineOffsetFromBottom;
- (double)desiredHeightForWidth:(double)a3;
- (int64_t)_pinAnimationType;
- (void)loadView;
@end

@implementation SRDisambiguationSelectionController

- (void)loadView
{
  v7 = -[SRUserUtteranceView initWithFrame:]( objc_alloc(&OBJC_CLASS___SRUserUtteranceView),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRDisambiguationSelectionController aceObject](self, "aceObject"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 selectionResponse]);

  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRDisambiguationSelectionController aceObject](self, "aceObject"));
    v4 = (void *)objc_claimAutoreleasedReturnValue([v5 selectionText]);

    if (!v4)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRDisambiguationSelectionController aceObject](self, "aceObject"));
      v4 = (void *)objc_claimAutoreleasedReturnValue([v6 title]);
    }
  }

  -[SRUserUtteranceView setText:](v7, "setText:", v4);
  -[SRUserUtteranceView setEditable:](v7, "setEditable:", 0LL);
  -[SRUserUtteranceView setBlendEffectEnabled:](v7, "setBlendEffectEnabled:", 1LL);
  -[SRDisambiguationSelectionController setView:](self, "setView:", v7);
}

- (double)desiredHeightForWidth:(double)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRDisambiguationSelectionController view](self, "view"));
  objc_msgSend(v4, "sizeThatFits:", a3, 1.79769313e308);
  double v6 = v5;

  return v6;
}

- (double)baselineOffsetFromBottom
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SRDisambiguationSelectionController view](self, "view"));
  [v2 baselineOffsetFromBottom];
  double v4 = v3;

  return v4;
}

- (int64_t)_pinAnimationType
{
  return 1LL;
}

@end