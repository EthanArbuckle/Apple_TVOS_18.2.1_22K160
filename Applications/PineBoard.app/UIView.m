@interface UIView
- (id)pb_constraintsForPinningToBottomOfView:(id)a3;
- (id)pb_constraintsForPinningToView:(id)a3;
@end

@implementation UIView

- (id)pb_constraintsForPinningToView:(id)a3
{
  id v4 = a3;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self, "topAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v4 topAnchor]);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v18 constraintEqualToAnchor:v17]);
  v19[0] = v16;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self, "bottomAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 bottomAnchor]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 constraintEqualToAnchor:v6]);
  v19[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self, "leadingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v4 leadingAnchor]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 constraintEqualToAnchor:v9]);
  v19[2] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self, "trailingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v4 trailingAnchor]);

  v13 = (void *)objc_claimAutoreleasedReturnValue([v11 constraintEqualToAnchor:v12]);
  v19[3] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v19, 4LL));

  return v14;
}

- (id)pb_constraintsForPinningToBottomOfView:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self, "bottomAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 bottomAnchor]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 constraintEqualToAnchor:v6]);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self, "leadingAnchor", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v4 leadingAnchor]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 constraintEqualToAnchor:v9]);
  v16[1] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self, "trailingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v4 trailingAnchor]);

  v13 = (void *)objc_claimAutoreleasedReturnValue([v11 constraintEqualToAnchor:v12]);
  v16[2] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 3LL));

  return v14;
}

@end