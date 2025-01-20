@interface SRBigButtonView
- (BOOL)suppressVibrantBackground;
- (CGSize)sizeThatFits:(CGSize)result;
- (SRBigButtonView)initWithFrame:(CGRect)a3;
- (SiriUIContentButton)button;
- (UIEdgeInsets)edgeInsets;
- (void)layoutSubviews;
- (void)viewInsetsInConversationView:(UIEdgeInsets)a3;
@end

@implementation SRBigButtonView

- (SRBigButtonView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SRBigButtonView;
  v3 = -[SRBigButtonView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = objc_claimAutoreleasedReturnValue( +[SiriUIContentButton buttonWithMediumWeightFont]( &OBJC_CLASS___SiriUIContentButton,  "buttonWithMediumWeightFont"));
    button = v3->_button;
    v3->_button = (SiriUIContentButton *)v4;

    *(_OWORD *)&v3->_edgeInsets.top = 0u;
    *(_OWORD *)&v3->_edgeInsets.bottom = 0u;
    -[SRBigButtonView addSubview:](v3, "addSubview:", v3->_button);
  }

  return v3;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___SRBigButtonView;
  -[SRBigButtonView layoutSubviews](&v13, "layoutSubviews");
  -[SRBigButtonView bounds](self, "bounds");
  double top = self->_edgeInsets.top;
  if (top == 0.0)
  {
    *(CGRect *)&double v9 = CGRectInset(*(CGRect *)&v3, 16.0, 16.0);
  }

  else
  {
    double left = self->_edgeInsets.left;
    double v9 = v3 + left;
    double v10 = v4 + top;
    double v11 = v5 - (left + self->_edgeInsets.right);
    double v12 = v6 - (top + self->_edgeInsets.bottom);
  }

  -[SiriUIContentButton setFrame:](self->_button, "setFrame:", v9, v10, v11, v12);
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double top = self->_edgeInsets.top;
  if (top == 0.0) {
    double v4 = 79.0;
  }
  else {
    double v4 = 79.0 - (top + self->_edgeInsets.bottom);
  }
  result.height = v4;
  return result;
}

- (BOOL)suppressVibrantBackground
{
  return 1;
}

- (void)viewInsetsInConversationView:(UIEdgeInsets)a3
{
  self->_edgeInsets = a3;
}

- (SiriUIContentButton)button
{
  return self->_button;
}

- (UIEdgeInsets)edgeInsets
{
  double top = self->_edgeInsets.top;
  double left = self->_edgeInsets.left;
  double bottom = self->_edgeInsets.bottom;
  double right = self->_edgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void).cxx_destruct
{
}

@end