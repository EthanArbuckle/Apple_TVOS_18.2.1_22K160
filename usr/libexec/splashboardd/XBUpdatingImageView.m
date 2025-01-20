@interface XBUpdatingImageView
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation XBUpdatingImageView

- (void)traitCollectionDidChange:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___XBUpdatingImageView;
  -[XBUpdatingImageView traitCollectionDidChange:](&v18, "traitCollectionDidChange:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[XBUpdatingImageView image](self, "image"));
  [v4 capInsets];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double left = UIEdgeInsetsZero.left;
  if (v10 == UIEdgeInsetsZero.bottom && v12 == UIEdgeInsetsZero.right && v6 == UIEdgeInsetsZero.top && v8 == left) {
    uint64_t v17 = 4LL;
  }
  else {
    uint64_t v17 = 0LL;
  }
  -[XBUpdatingImageView setContentMode:](self, "setContentMode:", v17, UIEdgeInsetsZero.top, left);
}

@end