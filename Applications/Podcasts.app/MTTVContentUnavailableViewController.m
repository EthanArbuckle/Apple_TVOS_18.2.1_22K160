@interface MTTVContentUnavailableViewController
- (MTTVContentUnavailableView)emptyOverlay;
- (NSString)buttonTitle;
- (NSString)primaryText;
- (NSString)secondaryText;
- (void)setButtonTitle:(id)a3;
- (void)setEmptyOverlay:(id)a3;
- (void)setPrimaryText:(id)a3;
- (void)setSecondaryText:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation MTTVContentUnavailableViewController

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MTTVContentUnavailableViewController;
  -[MTTVContentUnavailableViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVContentUnavailableViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVContentUnavailableViewController emptyOverlay](self, "emptyOverlay"));
  [v3 addSubview:v4];
}

- (void)viewDidLayoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___MTTVContentUnavailableViewController;
  -[MTTVContentUnavailableViewController viewDidLayoutSubviews](&v16, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVContentUnavailableViewController view](self, "view"));
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVContentUnavailableViewController emptyOverlay](self, "emptyOverlay"));
  objc_msgSend(v8, "sizeThatFits:", v5, 1.79769313e308);
  double v10 = v9;
  double v12 = v11;

  double v13 = IMRoundToPixel((v5 - v10) * 0.5);
  double v14 = IMRoundToPixel((v7 - v12) * 0.5);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVContentUnavailableViewController emptyOverlay](self, "emptyOverlay"));
  objc_msgSend(v15, "setFrame:", v13, v14, v10, v12);
}

- (void)setPrimaryText:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_primaryText, a3);
  emptyOverlay = self->_emptyOverlay;
  if (emptyOverlay)
  {
    -[MTTVContentUnavailableView setTitle:](emptyOverlay, "setTitle:", v7);
    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVContentUnavailableViewController view](self, "view"));
    [v6 setNeedsLayout];
  }
}

- (void)setSecondaryText:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_secondaryText, a3);
  emptyOverlay = self->_emptyOverlay;
  if (emptyOverlay)
  {
    -[MTTVContentUnavailableView setMessage:](emptyOverlay, "setMessage:", v7);
    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVContentUnavailableViewController view](self, "view"));
    [v6 setNeedsLayout];
  }
}

- (void)setButtonTitle:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_buttonTitle, a3);
  emptyOverlay = self->_emptyOverlay;
  if (emptyOverlay) {
    -[MTTVContentUnavailableView setButtonTitle:target:action:]( emptyOverlay,  "setButtonTitle:target:action:",  v6,  self,  "buttonPressed:");
  }
}

- (MTTVContentUnavailableView)emptyOverlay
{
  emptyOverlay = self->_emptyOverlay;
  if (!emptyOverlay)
  {
    double v4 = objc_opt_new(&OBJC_CLASS___MTTVContentUnavailableView);
    double v5 = self->_emptyOverlay;
    self->_emptyOverlay = v4;

    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVContentUnavailableViewController primaryText](self, "primaryText"));
    -[MTTVContentUnavailableView setTitle:](self->_emptyOverlay, "setTitle:", v6);

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVContentUnavailableViewController secondaryText](self, "secondaryText"));
    -[MTTVContentUnavailableView setMessage:](self->_emptyOverlay, "setMessage:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVContentUnavailableViewController buttonTitle](self, "buttonTitle"));
    emptyOverlay = self->_emptyOverlay;
    if (v8)
    {
      double v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVContentUnavailableViewController buttonTitle](self, "buttonTitle"));
      -[MTTVContentUnavailableView setButtonTitle:target:action:]( emptyOverlay,  "setButtonTitle:target:action:",  v9,  self,  "buttonPressed:");

      emptyOverlay = self->_emptyOverlay;
    }
  }

  return emptyOverlay;
}

- (NSString)primaryText
{
  return self->_primaryText;
}

- (NSString)secondaryText
{
  return self->_secondaryText;
}

- (NSString)buttonTitle
{
  return self->_buttonTitle;
}

- (void)setEmptyOverlay:(id)a3
{
}

- (void).cxx_destruct
{
}

@end