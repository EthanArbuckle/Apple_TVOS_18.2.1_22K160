@interface TVMusicRoundButton
- (CGSize)intrinsicContentSize;
- (NSMutableDictionary)imagesForControlState;
- (TVMusicRoundButton)initWithDiameter:(double)a3;
- (UIImageView)imageView;
- (id)imageForControlState:(unint64_t)a3;
- (void)_updateImageForCurrentControlState;
- (void)setCornerRadius:(double)a3;
- (void)setImage:(id)a3 forControlState:(unint64_t)a4;
- (void)setSelected:(BOOL)a3;
@end

@implementation TVMusicRoundButton

- (TVMusicRoundButton)initWithDiameter:(double)a3
{
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___TVMusicRoundButton;
  v4 = -[TVMusicFloatingButton initWithFrame:](&v25, "initWithFrame:", 0.0, 0.0, a3, a3);
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicFloatingButton contentView](v4, "contentView"));
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    imagesForControlState = v5->_imagesForControlState;
    v5->_imagesForControlState = (NSMutableDictionary *)v7;

    v9 = objc_alloc_init(&OBJC_CLASS___UIImageView);
    imageView = v5->_imageView;
    v5->_imageView = v9;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:]( v5->_imageView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    [v6 addSubview:v5->_imageView];
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerXAnchor](v5->_imageView, "centerXAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue([v6 centerXAnchor]);
    v22 = (void *)objc_claimAutoreleasedReturnValue([v24 constraintEqualToAnchor:v23]);
    v26[0] = v22;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](v5->_imageView, "centerYAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue([v6 centerYAnchor]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v21 constraintEqualToAnchor:v20]);
    v26[1] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](v5->_imageView, "widthAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v6 widthAnchor]);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v12 constraintLessThanOrEqualToAnchor:v13]);
    v26[2] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](v5->_imageView, "heightAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v6 heightAnchor]);
    v17 = (void *)objc_claimAutoreleasedReturnValue([v15 constraintLessThanOrEqualToAnchor:v16]);
    v26[3] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v26, 4LL));
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v18);

    -[TVMusicRoundButton setCornerRadius:](v5, "setCornerRadius:", a3 * 0.5);
  }

  return v5;
}

- (void)setCornerRadius:(double)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVMusicRoundButton;
  -[TVMusicFloatingButton setCornerRadius:](&v4, "setCornerRadius:", a3);
  -[TVMusicRoundButton invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (CGSize)intrinsicContentSize
{
  double v3 = v2 + v2;
  double v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)imageForControlState:(unint64_t)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicRoundButton imagesForControlState](self, "imagesForControlState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v6]);

  if (!v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicRoundButton imagesForControlState](self, "imagesForControlState"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:&off_100281880]);
  }

  return v7;
}

- (void)setImage:(id)a3 forControlState:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicRoundButton imagesForControlState](self, "imagesForControlState"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
  [v7 setObject:v6 forKeyedSubscript:v8];

  -[TVMusicRoundButton _updateImageForCurrentControlState](self, "_updateImageForCurrentControlState");
}

- (void)setSelected:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVMusicRoundButton;
  -[TVMusicFloatingButton setSelected:](&v4, "setSelected:", a3);
  -[TVMusicRoundButton _updateImageForCurrentControlState](self, "_updateImageForCurrentControlState");
}

- (void)_updateImageForCurrentControlState
{
  else {
    uint64_t v3 = 0LL;
  }
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicRoundButton imageView](self, "imageView"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicRoundButton imageForControlState:](self, "imageForControlState:", v3));
  [v5 setImage:v4];
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (NSMutableDictionary)imagesForControlState
{
  return self->_imagesForControlState;
}

- (void).cxx_destruct
{
}

@end