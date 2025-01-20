@interface SATVConsentViewController
- (BOOL)isCenteredHorizontally;
- (BOOL)useStackedConsentButtonLayout;
- (SATVChoiceView)choiceView;
- (SATVConsentViewController)initWithChoiceViewStyle:(int64_t)a3;
- (SATVConsentViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (SATVConsentViewControllerDataSource)dataSource;
- (SATVConsentViewControllerDelegate)delegate;
- (double)choiceViewHorizontalCenter;
- (double)maximumChoiceViewWidth;
- (id)attributedSubtitleStringForChoiceView;
- (id)auxiliaryButtonTextForChoiceView:(id)a3;
- (id)auxiliaryButtonViewForChoiceView:(id)a3;
- (id)choiceHeaderButtonTextForChoiceView:(id)a3;
- (id)choiceView:(id)a3 textForChoice:(unint64_t)a4;
- (id)footerButtonTextForChoiceView:(id)a3;
- (id)footerButtonViewForChoiceView:(id)a3;
- (id)footnoteTextForChoiceView:(id)a3;
- (id)preferredFocusEnvironments;
- (id)subtitleTextForChoiceView:(id)a3;
- (id)titleTextForChoiceView:(id)a3;
- (int64_t)choiceViewStyle;
- (void)didSelectAuxiliaryButton;
- (void)didSelectChoice:(unint64_t)a3;
- (void)didSelectFooterButton;
- (void)loadView;
- (void)setCenteredHorizontally:(BOOL)a3;
- (void)setChoiceView:(id)a3;
- (void)setChoiceViewHorizontalCenter:(double)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMaximumChoiceViewWidth:(double)a3;
- (void)setUseStackedConsentButtonLayout:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SATVConsentViewController

- (SATVConsentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SATVConsentViewController;
  v4 = -[SATVConsentViewController initWithNibName:bundle:](&v7, "initWithNibName:bundle:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_maximumChoiceViewWidth = 835.0;
    v4->_choiceViewHorizontalCenter = 572.0;
    if (!-[SATVConsentViewController tvsk_layoutStyle](v4, "tvsk_layoutStyle")) {
      v5->_centeredHorizontally = 1;
    }
  }

  return v5;
}

- (SATVConsentViewController)initWithChoiceViewStyle:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SATVConsentViewController;
  result = -[SATVConsentViewController init](&v5, "init");
  if (result) {
    result->_choiceViewStyle = a3;
  }
  return result;
}

- (void)loadView
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SATVConsentViewController;
  -[SATVConsentViewController loadView](&v6, "loadView");
  v3 = -[SATVChoiceView initWithChoiceViewStyle:frame:]( objc_alloc(&OBJC_CLASS___SATVChoiceView),  "initWithChoiceViewStyle:frame:",  self->_choiceViewStyle,  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  choiceView = self->_choiceView;
  self->_choiceView = v3;

  -[SATVChoiceView setDelegate:](self->_choiceView, "setDelegate:", self);
  -[SATVChoiceView setDataSource:](self->_choiceView, "setDataSource:", self);
  -[SATVChoiceView setChoiceButtonLayout:]( self->_choiceView,  "setChoiceButtonLayout:",  -[SATVConsentViewController useStackedConsentButtonLayout](self, "useStackedConsentButtonLayout"));
  if (-[SATVConsentViewController useStackedConsentButtonLayout](self, "useStackedConsentButtonLayout")) {
    self->_maximumChoiceViewWidth = 912.0;
  }
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVConsentViewController view](self, "view"));
  [v5 addSubview:self->_choiceView];
}

- (void)viewDidLayoutSubviews
{
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___SATVConsentViewController;
  -[SATVConsentViewController viewDidLayoutSubviews](&v29, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVConsentViewController view](self, "view"));
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SATVConsentViewController view](self, "view"));
  unsigned int v13 = [v12 _shouldReverseLayoutDirection];

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SATVConsentViewController choiceView](self, "choiceView"));
  -[SATVConsentViewController maximumChoiceViewWidth](self, "maximumChoiceViewWidth");
  objc_msgSend(v14, "sizeThatFits:");
  double v16 = v15;
  double v18 = v17;

  if (-[SATVConsentViewController isCenteredHorizontally](self, "isCenteredHorizontally"))
  {
    double v19 = UIRectCenteredIntegralRect(CGPointZero.x, CGPointZero.y, v16, v18, v5, v7, v9, v11);
  }

  else
  {
    -[SATVConsentViewController choiceViewHorizontalCenter](self, "choiceViewHorizontalCenter");
    if (v13) {
      double v23 = v9 - v23;
    }
    double v19 = UIRectCenteredYInRect(v23 - floor(v16 * 0.5), 0.0, v16, v18, v5, v7, v9, v11);
  }

  double v24 = v19;
  double v25 = v20;
  double v26 = v21;
  double v27 = v22;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[SATVConsentViewController choiceView](self, "choiceView"));
  objc_msgSend(v28, "setFrame:", v24, v25, v26, v27);
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SATVConsentViewController;
  -[SATVConsentViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVConsentViewController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v4, "consentViewControllerCanSelectConsent:") & 1) != 0) {
    -[SATVChoiceView setChoice:enabled:]( self->_choiceView,  "setChoice:enabled:",  0,  [v4 consentViewControllerCanSelectConsent:self]);
  }
  if ((objc_opt_respondsToSelector(v4, "consentViewControllerCanSelectDissent:") & 1) != 0) {
    -[SATVChoiceView setChoice:enabled:]( self->_choiceView,  "setChoice:enabled:",  1,  [v4 consentViewControllerCanSelectDissent:self]);
  }
}

- (void)setCenteredHorizontally:(BOOL)a3
{
  if (self->_centeredHorizontally != a3)
  {
    self->_centeredHorizontally = a3;
    id v3 = (id)objc_claimAutoreleasedReturnValue(-[SATVConsentViewController view](self, "view"));
    [v3 setNeedsLayout];
  }

- (id)preferredFocusEnvironments
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue(-[SATVConsentViewController choiceView](self, "choiceView"));
  id v3 = (void *)v2;
  if (v2)
  {
    uint64_t v6 = v2;
    double v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
  }

  else
  {
    double v4 = &__NSArray0__struct;
  }

  return v4;
}

- (id)choiceView:(id)a3 textForChoice:(unint64_t)a4
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVConsentViewController dataSource](self, "dataSource", a3));
  double v7 = v6;
  if (a4 == 1)
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v6 dissentButtonTextForConsentViewController:self]);
  }

  else
  {
    if (a4)
    {
      double v9 = 0LL;
      goto LABEL_7;
    }

    uint64_t v8 = objc_claimAutoreleasedReturnValue([v6 consentButtonTextForConsentViewController:self]);
  }

  double v9 = (void *)v8;
LABEL_7:

  return v9;
}

- (id)titleTextForChoiceView:(id)a3
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVConsentViewController dataSource](self, "dataSource", a3));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 titleTextForConsentViewController:self]);

  return v5;
}

- (id)subtitleTextForChoiceView:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if ((objc_opt_respondsToSelector(WeakRetained, "subtitleTextForConsentViewController:") & 1) != 0) {
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained subtitleTextForConsentViewController:self]);
  }
  else {
    objc_super v5 = 0LL;
  }

  return v5;
}

- (id)attributedSubtitleStringForChoiceView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if ((objc_opt_respondsToSelector(WeakRetained, "attributedSubtitleStringForConsentViewController") & 1) != 0) {
    id v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained attributedSubtitleStringForConsentViewController]);
  }
  else {
    id v3 = 0LL;
  }

  return v3;
}

- (id)choiceHeaderButtonTextForChoiceView:(id)a3
{
  return sub_10000D7CC(@"PLEASE_CHOOSE_HEADER", @"Localizable");
}

- (id)footnoteTextForChoiceView:(id)a3
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVConsentViewController dataSource](self, "dataSource", a3));
  if ((objc_opt_respondsToSelector(v4, "footnoteTextForConsentViewController:") & 1) != 0) {
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 footnoteTextForConsentViewController:self]);
  }
  else {
    objc_super v5 = 0LL;
  }

  return v5;
}

- (id)footerButtonTextForChoiceView:(id)a3
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVConsentViewController dataSource](self, "dataSource", a3));
  if ((objc_opt_respondsToSelector(v4, "footerButtonTextForConsentViewController:") & 1) != 0) {
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 footerButtonTextForConsentViewController:self]);
  }
  else {
    objc_super v5 = 0LL;
  }

  return v5;
}

- (id)auxiliaryButtonTextForChoiceView:(id)a3
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVConsentViewController dataSource](self, "dataSource", a3));
  if ((objc_opt_respondsToSelector(v4, "auxiliaryButtonTextForConsentViewController:") & 1) != 0) {
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 auxiliaryButtonTextForConsentViewController:self]);
  }
  else {
    objc_super v5 = 0LL;
  }

  return v5;
}

- (id)footerButtonViewForChoiceView:(id)a3
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVConsentViewController dataSource](self, "dataSource", a3));
  if ((objc_opt_respondsToSelector(v4, "footerButtonViewForConsentViewController:") & 1) != 0) {
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 footerButtonViewForConsentViewController:self]);
  }
  else {
    objc_super v5 = 0LL;
  }

  return v5;
}

- (id)auxiliaryButtonViewForChoiceView:(id)a3
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVConsentViewController dataSource](self, "dataSource", a3));
  if ((objc_opt_respondsToSelector(v4, "auxiliaryButtonViewForConsentViewController:") & 1) != 0) {
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 auxiliaryButtonViewForConsentViewController:self]);
  }
  else {
    objc_super v5 = 0LL;
  }

  return v5;
}

- (void)didSelectChoice:(unint64_t)a3
{
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVConsentViewController delegate](self, "delegate"));
  if (a3 == 1)
  {
    id v6 = v5;
    [v5 consentViewControllerDidSelectDissent:self];
    goto LABEL_5;
  }

  if (!a3)
  {
    id v6 = v5;
    [v5 consentViewControllerDidSelectConsent:self];
LABEL_5:
    objc_super v5 = v6;
  }
}

- (void)didSelectFooterButton
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SATVConsentViewController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v3, "consentViewControllerDidSelectFooter:") & 1) != 0) {
    [v3 consentViewControllerDidSelectFooter:self];
  }
}

- (void)didSelectAuxiliaryButton
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SATVConsentViewController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v3, "consentViewControllerDidSelectAuxiliary:") & 1) != 0) {
    [v3 consentViewControllerDidSelectAuxiliary:self];
  }
}

- (SATVChoiceView)choiceView
{
  return self->_choiceView;
}

- (void)setChoiceView:(id)a3
{
}

- (SATVConsentViewControllerDelegate)delegate
{
  return (SATVConsentViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (SATVConsentViewControllerDataSource)dataSource
{
  return (SATVConsentViewControllerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
}

- (double)maximumChoiceViewWidth
{
  return self->_maximumChoiceViewWidth;
}

- (void)setMaximumChoiceViewWidth:(double)a3
{
  self->_maximumChoiceViewWidth = a3;
}

- (double)choiceViewHorizontalCenter
{
  return self->_choiceViewHorizontalCenter;
}

- (void)setChoiceViewHorizontalCenter:(double)a3
{
  self->_choiceViewHorizontalCenter = a3;
}

- (int64_t)choiceViewStyle
{
  return self->_choiceViewStyle;
}

- (BOOL)useStackedConsentButtonLayout
{
  return self->_useStackedConsentButtonLayout;
}

- (void)setUseStackedConsentButtonLayout:(BOOL)a3
{
  self->_useStackedConsentButtonLayout = a3;
}

- (BOOL)isCenteredHorizontally
{
  return self->_centeredHorizontally;
}

- (void).cxx_destruct
{
}

@end