@interface TVTextEntryHeaderView
- (CGRect)_imageViewFrameWithBounds:(CGRect)a3;
- (CGRect)_messageViewFrameWithBounds:(CGRect)a3;
- (CGRect)_titleViewFrameWithBounds:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSAttributedString)message;
- (NSAttributedString)title;
- (TVImageView)imageView;
- (UILabel)messageView;
- (UILabel)titleView;
- (void)layoutSubviews;
- (void)setImageView:(id)a3;
- (void)setMessage:(id)a3;
- (void)setMessageView:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleView:(id)a3;
@end

@implementation TVTextEntryHeaderView

- (void)setImageView:(id)a3
{
  id v5 = a3;
  if (self->_titleView) {
    -[TVTextEntryHeaderView setTitle:](self, "setTitle:", 0LL);
  }
  -[TVImageView removeFromSuperview](self->_imageView, "removeFromSuperview");
  objc_storeStrong((id *)&self->_imageView, a3);
  if (self->_imageView) {
    -[TVTextEntryHeaderView addSubview:](self, "addSubview:");
  }
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (self->_imageView)
  {
    -[TVTextEntryHeaderView setImageView:](self, "setImageView:", 0LL);
    id v4 = v9;
  }

  titleView = self->_titleView;
  if (v4)
  {
    if (!titleView)
    {
      v6 = -[UILabel initWithFrame:]( objc_alloc(&OBJC_CLASS___UILabel),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
      v7 = self->_titleView;
      self->_titleView = v6;

      -[UILabel setNumberOfLines:](self->_titleView, "setNumberOfLines:", 0LL);
      -[UILabel setTextAlignment:](self->_titleView, "setTextAlignment:", 1LL);
      -[TVTextEntryHeaderView addSubview:](self, "addSubview:", self->_titleView);
      titleView = self->_titleView;
    }

    -[UILabel setAttributedText:](titleView, "setAttributedText:", v9);
    -[TVTextEntryHeaderView setNeedsLayout](self, "setNeedsLayout");
    goto LABEL_9;
  }

  if (titleView)
  {
    -[UILabel removeFromSuperview](titleView, "removeFromSuperview");
    v8 = self->_titleView;
    self->_titleView = 0LL;

LABEL_9:
    id v4 = v9;
  }
}

- (void)setMessage:(id)a3
{
  id v4 = a3;
  messageView = self->_messageView;
  if (v4)
  {
    id v9 = v4;
    if (!messageView)
    {
      v6 = -[UILabel initWithFrame:]( objc_alloc(&OBJC_CLASS___UILabel),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
      v7 = self->_messageView;
      self->_messageView = v6;

      -[UILabel setNumberOfLines:](self->_messageView, "setNumberOfLines:", 0LL);
      -[UILabel setBaselineAdjustment:](self->_messageView, "setBaselineAdjustment:", 1LL);
      -[UILabel setTextAlignment:](self->_messageView, "setTextAlignment:", 1LL);
      -[TVTextEntryHeaderView addSubview:](self, "addSubview:", self->_messageView);
      messageView = self->_messageView;
    }

    -[UILabel setAttributedText:](messageView, "setAttributedText:", v9);
    -[TVTextEntryHeaderView setNeedsLayout](self, "setNeedsLayout");
    goto LABEL_7;
  }

  if (messageView)
  {
    id v9 = 0LL;
    -[UILabel removeFromSuperview](messageView, "removeFromSuperview");
    v8 = self->_messageView;
    self->_messageView = 0LL;

LABEL_7:
    id v4 = v9;
  }
}

- (void)layoutSubviews
{
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  titleView = self->_titleView;
  -[TVTextEntryHeaderView _titleViewFrameWithBounds:](self, "_titleViewFrameWithBounds:");
  -[UILabel setFrame:](titleView, "setFrame:");
  imageView = self->_imageView;
  -[TVTextEntryHeaderView _imageViewFrameWithBounds:](self, "_imageViewFrameWithBounds:", v4, v6, v8, v10);
  -[TVImageView setFrame:](imageView, "setFrame:");
  messageView = self->_messageView;
  -[TVTextEntryHeaderView _messageViewFrameWithBounds:](self, "_messageViewFrameWithBounds:", v4, v6, v8, v10);
  -[UILabel setFrame:](messageView, "setFrame:");
}

- (CGRect)_titleViewFrameWithBounds:(CGRect)a3
{
  double width = a3.size.width;
  -[UILabel sizeThatFits:](self->_titleView, "sizeThatFits:", a3.size.width, 3.40282347e38);
  double v6 = v5;
  if (v4 <= width) {
    double v7 = v4;
  }
  else {
    double v7 = width;
  }
  BOOL v8 = sub_1000A7D2C();
  double v9 = 0.0;
  if (v8) {
    double v9 = 66.0;
  }
  double v10 = floor((width - v7) * 0.5);
  double v11 = v7;
  double v12 = v6;
  result.size.height = v12;
  result.size.double width = v11;
  result.origin.y = v9;
  result.origin.x = v10;
  return result;
}

- (CGRect)_imageViewFrameWithBounds:(CGRect)a3
{
  double width = a3.size.width;
  -[TVImageView sizeThatFits:](self->_imageView, "sizeThatFits:", 600.0, 163.0, a3.size.width, a3.size.height);
  double v5 = v4;
  double v7 = v6;
  BOOL v8 = sub_1000A7D2C();
  double v9 = 0.0;
  if (v8) {
    double v9 = 66.0;
  }
  double v10 = floor((width - v5) * 0.5);
  double v11 = v5;
  double v12 = v7;
  result.size.height = v12;
  result.size.double width = v11;
  result.origin.y = v9;
  result.origin.x = v10;
  return result;
}

- (CGRect)_messageViewFrameWithBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  -[UILabel sizeThatFits:](self->_messageView, "sizeThatFits:", a3.size.width, 3.40282347e38);
  double v9 = v8;
  double v11 = v10;
  double v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVTextEntryHeaderView titleView](self, "titleView"));

  if (v12) {
    -[TVTextEntryHeaderView _titleViewFrameWithBounds:](self, "_titleViewFrameWithBounds:", x, y, width, height);
  }
  else {
    -[TVTextEntryHeaderView _imageViewFrameWithBounds:](self, "_imageViewFrameWithBounds:", x, y, width, height);
  }
  if (v9 > width) {
    double v9 = width;
  }
  double MaxY = CGRectGetMaxY(*(CGRect *)&v13);
  BOOL v18 = sub_1000A7D2C();
  double v19 = 54.0;
  if (!v18) {
    double v19 = 15.0;
  }
  double v20 = MaxY + v19;
  double v21 = floor((width - v9) * 0.5);
  double v22 = v9;
  double v23 = v11;
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.double y = v20;
  result.origin.double x = v21;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double y = CGPointZero.y;
  if (a3.width + -360.0 <= 360.0) {
    double width = a3.width;
  }
  else {
    double width = a3.width + -360.0;
  }
  -[TVTextEntryHeaderView _titleViewFrameWithBounds:]( self,  "_titleViewFrameWithBounds:",  CGPointZero.x,  CGPointZero.y,  width,  a3.height);
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  -[TVTextEntryHeaderView _imageViewFrameWithBounds:]( self,  "_imageViewFrameWithBounds:",  CGPointZero.x,  y,  width,  height);
  CGFloat v44 = v16;
  CGFloat v45 = v15;
  CGFloat v42 = v18;
  CGFloat v43 = v17;
  -[TVTextEntryHeaderView _messageViewFrameWithBounds:]( self,  "_messageViewFrameWithBounds:",  CGPointZero.x,  y,  width,  height);
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  CGFloat v27 = sub_1000A7EE4( CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height,  v8,  v10,  v12,  v14);
  CGFloat v31 = sub_1000A7EE4(v27, v28, v29, v30, v45, v44, v43, v42);
  v47.origin.CGFloat x = sub_1000A7EE4(v31, v32, v33, v34, v20, v22, v24, v26);
  CGFloat x = v47.origin.x;
  CGFloat v36 = v47.origin.y;
  CGFloat v37 = v47.size.width;
  CGFloat v38 = v47.size.height;
  CGFloat MaxX = CGRectGetMaxX(v47);
  v48.origin.CGFloat x = x;
  v48.origin.double y = v36;
  v48.size.double width = v37;
  v48.size.double height = v38;
  double MaxY = CGRectGetMaxY(v48);
  double v41 = MaxX;
  result.double height = MaxY;
  result.double width = v41;
  return result;
}

- (TVImageView)imageView
{
  return self->_imageView;
}

- (NSAttributedString)title
{
  return self->_title;
}

- (NSAttributedString)message
{
  return self->_message;
}

- (UILabel)titleView
{
  return self->_titleView;
}

- (void)setTitleView:(id)a3
{
}

- (UILabel)messageView
{
  return self->_messageView;
}

- (void)setMessageView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end