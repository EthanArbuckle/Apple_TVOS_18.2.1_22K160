@interface SCATModernMenuContentViewContainer
- (CGSize)intrinsicContentSize;
- (NSArray)contentViewConstraints;
- (SCATModernMenuContentViewContainer)initWithFrame:(CGRect)a3;
- (UIView)contentView;
- (id)collectionView;
- (void)setContentView:(id)a3;
- (void)setContentViewConstraints:(id)a3;
@end

@implementation SCATModernMenuContentViewContainer

- (SCATModernMenuContentViewContainer)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SCATModernMenuContentViewContainer;
  return -[SCATModernMenuContentViewContainer initWithFrame:]( &v4,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (void)setContentView:(id)a3
{
  v5 = (UIView *)a3;
  p_contentView = &self->_contentView;
  contentView = self->_contentView;
  if (contentView != v5)
  {
    -[UIView removeFromSuperview](contentView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_contentView, a3);
    -[SCATModernMenuContentViewContainer addSubview:](self, "addSubview:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuContentViewContainer contentViewConstraints](self, "contentViewConstraints"));
    +[NSLayoutConstraint deactivateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "deactivateConstraints:", v8);

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:]( *p_contentView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](*p_contentView, "topAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuContentViewContainer topAnchor](self, "topAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue([v22 constraintEqualToAnchor:v21]);
    v24[0] = v20;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](*p_contentView, "bottomAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuContentViewContainer bottomAnchor](self, "bottomAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v19 constraintEqualToAnchor:v9]);
    v24[1] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](*p_contentView, "leadingAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuContentViewContainer leadingAnchor](self, "leadingAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v11 constraintEqualToAnchor:v12]);
    v24[2] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](*p_contentView, "trailingAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuContentViewContainer trailingAnchor](self, "trailingAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v14 constraintEqualToAnchor:v15]);
    v24[3] = v16;
    v23 = v5;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v24, 4LL));
    -[SCATModernMenuContentViewContainer setContentViewConstraints:](self, "setContentViewConstraints:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuContentViewContainer contentViewConstraints](self, "contentViewConstraints"));
    v5 = v23;
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v18);

    -[SCATModernMenuContentViewContainer invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (id)collectionView
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuContentViewContainer contentView](self, "contentView", 0LL));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 subviews]);

  id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        objc_opt_class(&OBJC_CLASS___UICollectionView, v4);
        if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
        {
          id v5 = v8;
          goto LABEL_11;
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

- (CGSize)intrinsicContentSize
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuContentViewContainer collectionView](self, "collectionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 collectionViewLayout]);
  [v3 collectionViewContentSize];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (NSArray)contentViewConstraints
{
  return self->_contentViewConstraints;
}

- (void)setContentViewConstraints:(id)a3
{
}

- (void).cxx_destruct
{
}

@end