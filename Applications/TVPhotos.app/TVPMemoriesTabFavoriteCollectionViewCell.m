@interface TVPMemoriesTabFavoriteCollectionViewCell
- (TVPMemoriesTabFavoriteCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)configureLabels;
@end

@implementation TVPMemoriesTabFavoriteCollectionViewCell

- (TVPMemoriesTabFavoriteCollectionViewCell)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVPMemoriesTabFavoriteCollectionViewCell;
  v3 = -[TVPMemoriesTabCollectionViewCell initWithFrame:]( &v7,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewCell floatingContentView](v3, "floatingContentView"));
    [v5 setCornerRadius:26.0];
  }

  return v4;
}

- (void)configureLabels
{
  v38.receiver = self;
  v38.super_class = (Class)&OBJC_CLASS___TVPMemoriesTabFavoriteCollectionViewCell;
  -[TVPMemoriesTabCollectionViewCell configureLabels](&v38, "configureLabels");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewCell memorySubtitleLabel](self, "memorySubtitleLabel"));
  [v3 setNumberOfLines:1];

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewCell memoryTitleLabel](self, "memoryTitleLabel"));
  v35 = (void *)objc_claimAutoreleasedReturnValue([v37 leadingAnchor]);
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewCell containerView](self, "containerView"));
  v34 = (void *)objc_claimAutoreleasedReturnValue([v36 leadingAnchor]);
  v33 = (void *)objc_claimAutoreleasedReturnValue([v35 constraintEqualToAnchor:v34 constant:30.0]);
  v39[0] = v33;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewCell memoryTitleLabel](self, "memoryTitleLabel"));
  v30 = (void *)objc_claimAutoreleasedReturnValue([v32 lastBaselineAnchor]);
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewCell memorySubtitleLabel](self, "memorySubtitleLabel"));
  v29 = (void *)objc_claimAutoreleasedReturnValue([v31 firstBaselineAnchor]);
  v28 = (void *)objc_claimAutoreleasedReturnValue([v30 constraintEqualToAnchor:v29 constant:-30.0]);
  v39[1] = v28;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewCell memoryTitleLabel](self, "memoryTitleLabel"));
  v26 = (void *)objc_claimAutoreleasedReturnValue([v27 widthAnchor]);
  v25 = (void *)objc_claimAutoreleasedReturnValue([v26 constraintEqualToConstant:500.0]);
  v39[2] = v25;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewCell memoryTitleLabel](self, "memoryTitleLabel"));
  v22 = (void *)objc_claimAutoreleasedReturnValue([v24 lastBaselineAnchor]);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewCell containerView](self, "containerView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue([v23 bottomAnchor]);
  v20 = (void *)objc_claimAutoreleasedReturnValue([v22 constraintLessThanOrEqualToAnchor:v21 constant:-34.0]);
  v39[3] = v20;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewCell memorySubtitleLabel](self, "memorySubtitleLabel"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v19 leadingAnchor]);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewCell memoryTitleLabel](self, "memoryTitleLabel"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v18 leadingAnchor]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v17 constraintEqualToAnchor:v16]);
  v39[4] = v15;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewCell memorySubtitleLabel](self, "memorySubtitleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v14 trailingAnchor]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewCell memoryTitleLabel](self, "memoryTitleLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 trailingAnchor]);
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v4 constraintEqualToAnchor:v6]);
  v39[5] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewCell memorySubtitleLabel](self, "memorySubtitleLabel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 lastBaselineAnchor]);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewCell containerView](self, "containerView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 bottomAnchor]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v9 constraintEqualToAnchor:v11 constant:-34.0]);
  v39[6] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v39, 7LL));
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v13);
}

@end