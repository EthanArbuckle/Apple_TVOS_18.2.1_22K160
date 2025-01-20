@interface PBUIDebugContainerView
- (PBUIDebugContainerView)initWithFrame:(CGRect)a3;
- (PBUIDebugExternalControlStackView)externalControlStackView;
- (PBUIDebugLayoutLevelsStackView)layoutLevelsStackView;
- (PBUIDebugSceneStackView)sceneStackView;
- (PBUIDebugSystemGestureStackView)systemGestureStackView;
@end

@implementation PBUIDebugContainerView

- (PBUIDebugContainerView)initWithFrame:(CGRect)a3
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___PBUIDebugContainerView;
  v3 = -[PBUIDebugContainerLayoutView initWithFrame:]( &v20,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___PBUIDebugExternalControlStackView);
    externalControlStackView = v3->_externalControlStackView;
    v3->_externalControlStackView = v4;

    v6 = objc_alloc_init(&OBJC_CLASS___PBUIDebugLayoutLevelsStackView);
    layoutLevelsStackView = v3->_layoutLevelsStackView;
    v3->_layoutLevelsStackView = v6;

    v8 = objc_alloc_init(&OBJC_CLASS___PBUIDebugSceneStackView);
    sceneStackView = v3->_sceneStackView;
    v3->_sceneStackView = v8;

    v10 = objc_alloc_init(&OBJC_CLASS___PBUIDebugSystemGestureStackView);
    systemGestureStackView = v3->_systemGestureStackView;
    v3->_systemGestureStackView = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PBUIDebugContainerLayoutView topLeftHStack](v3, "topLeftHStack"));
    [v12 addArrangedSubview:v3->_sceneStackView];

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PBUIDebugContainerLayoutView topLeftHStack](v3, "topLeftHStack"));
    [v13 addArrangedSubview:v3->_externalControlStackView];

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PBUIDebugContainerLayoutView topRightVStack](v3, "topRightVStack"));
    [v14 addArrangedSubview:v3->_layoutLevelsStackView];

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PBUIDebugContainerLayoutView bottomRightHStack](v3, "bottomRightHStack"));
    [v15 addArrangedSubview:v3->_systemGestureStackView];

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[PBUIDebugSceneStackView widthAnchor](v3->_sceneStackView, "widthAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 constraintLessThanOrEqualToConstant:960.0]);
    v21 = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v18);
  }

  return v3;
}

- (PBUIDebugExternalControlStackView)externalControlStackView
{
  return self->_externalControlStackView;
}

- (PBUIDebugLayoutLevelsStackView)layoutLevelsStackView
{
  return self->_layoutLevelsStackView;
}

- (PBUIDebugSceneStackView)sceneStackView
{
  return self->_sceneStackView;
}

- (PBUIDebugSystemGestureStackView)systemGestureStackView
{
  return self->_systemGestureStackView;
}

- (void).cxx_destruct
{
}

@end