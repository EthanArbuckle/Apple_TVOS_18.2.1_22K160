@interface TVPMemoriesTabWatchNextCollectionViewCell
- (TVPMemoriesTabWatchNextCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)configureLabels;
@end

@implementation TVPMemoriesTabWatchNextCollectionViewCell

- (TVPMemoriesTabWatchNextCollectionViewCell)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVPMemoriesTabWatchNextCollectionViewCell;
  v3 = -[TVPMemoriesTabCollectionViewCell initWithFrame:]( &v7,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewCell floatingContentView](v3, "floatingContentView"));
    [v5 setCornerRadius:20.0];
  }

  return v4;
}

- (void)configureLabels
{
  v40.receiver = self;
  v40.super_class = (Class)&OBJC_CLASS___TVPMemoriesTabWatchNextCollectionViewCell;
  -[TVPMemoriesTabCollectionViewCell configureLabels](&v40, "configureLabels");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewCell memorySubtitleLabel](self, "memorySubtitleLabel"));
  [v3 setNumberOfLines:2];

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewCell memoryTitleLabel](self, "memoryTitleLabel"));
  v37 = (void *)objc_claimAutoreleasedReturnValue([v39 leadingAnchor]);
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewCell containerView](self, "containerView"));
  v36 = (void *)objc_claimAutoreleasedReturnValue([v38 leadingAnchor]);
  v35 = (void *)objc_claimAutoreleasedReturnValue([v37 constraintEqualToAnchor:v36 constant:20.0]);
  v41[0] = v35;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewCell memoryTitleLabel](self, "memoryTitleLabel"));
  v32 = (void *)objc_claimAutoreleasedReturnValue([v34 trailingAnchor]);
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewCell containerView](self, "containerView"));
  v31 = (void *)objc_claimAutoreleasedReturnValue([v33 trailingAnchor]);
  v30 = (void *)objc_claimAutoreleasedReturnValue([v32 constraintEqualToAnchor:v31 constant:-20.0]);
  v41[1] = v30;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewCell memoryTitleLabel](self, "memoryTitleLabel"));
  v27 = (void *)objc_claimAutoreleasedReturnValue([v29 lastBaselineAnchor]);
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewCell memorySubtitleLabel](self, "memorySubtitleLabel"));
  v26 = (void *)objc_claimAutoreleasedReturnValue([v28 firstBaselineAnchor]);
  v25 = (void *)objc_claimAutoreleasedReturnValue([v27 constraintEqualToAnchor:v26 constant:-23.0]);
  v41[2] = v25;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewCell memoryTitleLabel](self, "memoryTitleLabel"));
  v22 = (void *)objc_claimAutoreleasedReturnValue([v24 lastBaselineAnchor]);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewCell containerView](self, "containerView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue([v23 bottomAnchor]);
  v20 = (void *)objc_claimAutoreleasedReturnValue([v22 constraintLessThanOrEqualToAnchor:v21 constant:-20.0]);
  v41[3] = v20;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewCell memorySubtitleLabel](self, "memorySubtitleLabel"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v19 leadingAnchor]);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewCell memoryTitleLabel](self, "memoryTitleLabel"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v18 leadingAnchor]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v17 constraintEqualToAnchor:v16]);
  v41[4] = v15;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewCell memorySubtitleLabel](self, "memorySubtitleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v14 trailingAnchor]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewCell containerView](self, "containerView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 trailingAnchor]);
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v4 constraintEqualToAnchor:v6 constant:-20.0]);
  v41[5] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewCell memorySubtitleLabel](self, "memorySubtitleLabel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 lastBaselineAnchor]);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewCell containerView](self, "containerView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 bottomAnchor]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v9 constraintEqualToAnchor:v11 constant:-20.0]);
  v41[6] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v41, 7LL));
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v13);
}

@end