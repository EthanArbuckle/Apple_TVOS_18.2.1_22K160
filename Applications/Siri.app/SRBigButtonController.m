@interface SRBigButtonController
- (BOOL)usePlatterStyle;
- (UIEdgeInsets)defaultViewInsets;
- (double)desiredHeightForWidth:(double)a3;
- (id)snippet;
- (void)_bigButtonHit:(id)a3;
- (void)dealloc;
- (void)loadView;
- (void)setAceObject:(id)a3;
@end

@implementation SRBigButtonController

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRBigButtonView button](self->_buttonView, "button"));
  [v3 removeTarget:self action:"_bigButtonHit:" forControlEvents:64];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SRBigButtonController;
  -[SRBigButtonController dealloc](&v4, "dealloc");
}

- (void)setAceObject:(id)a3
{
  objc_super v4 = (SAUIButton *)a3;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SRBigButtonController;
  -[SRBigButtonController setAceObject:](&v6, "setAceObject:", v4);
  buttonObject = self->_buttonObject;
  self->_buttonObject = v4;
}

- (id)snippet
{
  return 0LL;
}

- (UIEdgeInsets)defaultViewInsets
{
  double top = UIEdgeInsetsZero.top;
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)usePlatterStyle
{
  return 1;
}

- (void)loadView
{
  if (!self->_buttonView)
  {
    v3 = -[SRBigButtonView initWithFrame:]( objc_alloc(&OBJC_CLASS___SRBigButtonView),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
    buttonView = self->_buttonView;
    self->_buttonView = v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRBigButtonView button](self->_buttonView, "button"));
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[SAUIButton text](self->_buttonObject, "text"));
    [v5 setTitle:v6 forState:0];

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRBigButtonView button](self->_buttonView, "button"));
    [v7 addTarget:self action:"_bigButtonHit:" forControlEvents:64];

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRBigButtonView button](self->_buttonView, "button"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 layer]);
    [v9 setCornerRadius:9.0];

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRBigButtonView button](self->_buttonView, "button"));
    [v10 setRole:0];

    -[SRBigButtonController setView:](self, "setView:", self->_buttonView);
  }

- (double)desiredHeightForWidth:(double)a3
{
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRBigButtonController view](self, "view"));
  objc_msgSend(v4, "sizeThatFits:", a3, 1.79769313e308);
  double v6 = v5;

  return v6;
}

- (void)_bigButtonHit:(id)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SRBigButtonController delegate](self, "delegate", a3));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[SAUIButton commands](self->_buttonObject, "commands"));
  [v5 siriViewController:self performAceCommands:v4];
}

- (void).cxx_destruct
{
}

@end