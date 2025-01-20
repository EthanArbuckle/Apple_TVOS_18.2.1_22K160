@interface PBUIDebugContainerLayoutView
- (PBUIDebugContainerLayoutView)initWithFrame:(CGRect)a3;
- (UIStackView)bottomRightHStack;
- (UIStackView)topLeftHStack;
- (UIStackView)topRightVStack;
@end

@implementation PBUIDebugContainerLayoutView

- (PBUIDebugContainerLayoutView)initWithFrame:(CGRect)a3
{
  v40.receiver = self;
  v40.super_class = (Class)&OBJC_CLASS___PBUIDebugContainerLayoutView;
  v3 = -[PBUIDebugContainerLayoutView initWithFrame:]( &v40,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PBUIDebugContainerLayoutView setInsetsLayoutMarginsFromSafeArea:](v3, "setInsetsLayoutMarginsFromSafeArea:", 0LL);
    -[PBUIDebugContainerLayoutView setLayoutMargins:](v4, "setLayoutMargins:", 30.0, 60.0, 30.0, 30.0);
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472LL;
    v38[2] = sub_10020FB1C;
    v38[3] = &unk_1003DD2D8;
    v5 = v4;
    v39 = v5;
    v6 = objc_retainBlock(v38);
    uint64_t v7 = ((uint64_t (*)(void *, void))v6[2])(v6, 0LL);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    id v9 = v5[1];
    v5[1] = (id)v8;

    uint64_t v10 = ((uint64_t (*)(void *, uint64_t))v6[2])(v6, 1LL);
    uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
    id v12 = v5[2];
    v5[2] = (id)v11;

    uint64_t v13 = ((uint64_t (*)(void *, void))v6[2])(v6, 0LL);
    uint64_t v14 = objc_claimAutoreleasedReturnValue(v13);
    v37 = v4;
    id v15 = v5[3];
    v5[3] = (id)v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue([v5 layoutMarginsGuide]);
    v36 = (void *)objc_claimAutoreleasedReturnValue([v5[1] leftAnchor]);
    v35 = (void *)objc_claimAutoreleasedReturnValue([v16 leftAnchor]);
    v34 = (void *)objc_claimAutoreleasedReturnValue([v36 constraintEqualToAnchor:v35]);
    v41[0] = v34;
    v33 = (void *)objc_claimAutoreleasedReturnValue([v5[1] topAnchor]);
    v32 = (void *)objc_claimAutoreleasedReturnValue([v16 topAnchor]);
    v31 = (void *)objc_claimAutoreleasedReturnValue([v33 constraintEqualToAnchor:v32]);
    v41[1] = v31;
    v30 = (void *)objc_claimAutoreleasedReturnValue([v5[2] topAnchor]);
    v29 = (void *)objc_claimAutoreleasedReturnValue([v16 topAnchor]);
    v28 = (void *)objc_claimAutoreleasedReturnValue([v30 constraintEqualToAnchor:v29]);
    v41[2] = v28;
    v27 = (void *)objc_claimAutoreleasedReturnValue([v5[2] rightAnchor]);
    v26 = (void *)objc_claimAutoreleasedReturnValue([v16 rightAnchor]);
    v17 = (void *)objc_claimAutoreleasedReturnValue([v27 constraintEqualToAnchor:v26]);
    v41[3] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue([v5[3] rightAnchor]);
    v19 = (void *)objc_claimAutoreleasedReturnValue([v16 rightAnchor]);
    v20 = (void *)objc_claimAutoreleasedReturnValue([v18 constraintEqualToAnchor:v19]);
    v41[4] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue([v5[3] bottomAnchor]);
    v22 = (void *)objc_claimAutoreleasedReturnValue([v16 bottomAnchor]);
    v23 = (void *)objc_claimAutoreleasedReturnValue([v21 constraintEqualToAnchor:v22]);
    v41[5] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v41, 6LL));
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v24);

    v4 = v37;
  }

  return v4;
}

- (UIStackView)topLeftHStack
{
  return self->_topLeftHStack;
}

- (UIStackView)topRightVStack
{
  return self->_topRightVStack;
}

- (UIStackView)bottomRightHStack
{
  return self->_bottomRightHStack;
}

- (void).cxx_destruct
{
}

@end