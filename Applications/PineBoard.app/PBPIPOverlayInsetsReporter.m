@interface PBPIPOverlayInsetsReporter
- (CGRect)bounds;
- (PBOverlayLayoutController)layoutController;
- (PBPIPOverlayInsetsReporter)initWithLayoutCoordinator:(id)a3;
- (PBPIPOverlayInsetsReporter)initWithLayoutCoordinator:(id)a3 insetsAdjustment:(UIEdgeInsets)a4;
- (UIEdgeInsets)insetsAdjustment;
- (UIEdgeInsets)overlayInsets;
- (void)_updateLayoutElementsWithPreviousOverlayInsets:(UIEdgeInsets)a3 transitionContext:(id)a4;
- (void)setOverlayInsets:(UIEdgeInsets)a3;
- (void)setOverlayInsets:(UIEdgeInsets)a3 withTransitionContext:(id)a4;
@end

@implementation PBPIPOverlayInsetsReporter

- (PBPIPOverlayInsetsReporter)initWithLayoutCoordinator:(id)a3 insetsAdjustment:(UIEdgeInsets)a4
{
  CGFloat right = a4.right;
  CGFloat bottom = a4.bottom;
  CGFloat left = a4.left;
  CGFloat top = a4.top;
  id v10 = a3;
  Class v11 = NSClassFromString(@"PBOverlayLayoutCoordinator");
  if (!v10)
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100271B54(a2);
    }
LABEL_11:
    _bs_set_crash_log_message([v40 UTF8String]);
    __break(0);
    JUMPOUT(0x100026E5CLL);
  }

  if ((objc_opt_isKindOfClass(v10, v11) & 1) == 0)
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:PBOverlayLayoutCoordinatorClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100271B54(a2);
    }
    goto LABEL_11;
  }

  v41.receiver = self;
  v41.super_class = (Class)&OBJC_CLASS___PBPIPOverlayInsetsReporter;
  v12 = -[PBPIPOverlayInsetsReporter init](&v41, "init");
  if (v12)
  {
    v13 = objc_alloc(&OBJC_CLASS___PBOverlayLayoutController);
    v14 = (objc_class *)objc_opt_class(v12);
    v15 = NSStringFromClass(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = -[PBOverlayLayoutController initWithLayoutCoordinator:name:](v13, "initWithLayoutCoordinator:name:", v10, v16);
    layoutController = v12->_layoutController;
    v12->_layoutController = v17;

    id v19 = [v10 bounds];
    v12->_bounds.origin.x = v20;
    v12->_bounds.origin.y = v21;
    v12->_bounds.size.width = v22;
    v12->_bounds.size.height = v23;
    v12->_insetsAdjustment.CGFloat top = top;
    v12->_insetsAdjustment.CGFloat left = left;
    v12->_insetsAdjustment.CGFloat bottom = bottom;
    v12->_insetsAdjustment.CGFloat right = right;
    v24 = sub_100026EC4((uint64_t)v19, (uint64_t)@"com.apple.PineBoard.pip.overlay-inset.top");
    uint64_t v25 = objc_claimAutoreleasedReturnValue(v24);
    v26 = v12->_elements[0];
    v12->_elements[0] = (PBSOverlayLayoutElement *)v25;

    v28 = sub_100026EC4(v27, (uint64_t)@"com.apple.PineBoard.pip.overlay-inset.right");
    uint64_t v29 = objc_claimAutoreleasedReturnValue(v28);
    v30 = v12->_elements[1];
    v12->_elements[1] = (PBSOverlayLayoutElement *)v29;

    v32 = sub_100026EC4(v31, (uint64_t)@"com.apple.PineBoard.pip.overlay-inset.bottom");
    uint64_t v33 = objc_claimAutoreleasedReturnValue(v32);
    v34 = v12->_elements[2];
    v12->_elements[2] = (PBSOverlayLayoutElement *)v33;

    v36 = sub_100026EC4(v35, (uint64_t)@"com.apple.PineBoard.pip.overlay-inset.left");
    uint64_t v37 = objc_claimAutoreleasedReturnValue(v36);
    v38 = v12->_elements[3];
    v12->_elements[3] = (PBSOverlayLayoutElement *)v37;
  }

  return v12;
}

- (PBPIPOverlayInsetsReporter)initWithLayoutCoordinator:(id)a3
{
  return -[PBPIPOverlayInsetsReporter initWithLayoutCoordinator:insetsAdjustment:]( self,  "initWithLayoutCoordinator:insetsAdjustment:",  a3,  UIEdgeInsetsZero.top,  UIEdgeInsetsZero.left,  UIEdgeInsetsZero.bottom,  UIEdgeInsetsZero.right);
}

- (void)setOverlayInsets:(UIEdgeInsets)a3
{
}

- (void)setOverlayInsets:(UIEdgeInsets)a3 withTransitionContext:(id)a4
{
  double top = a3.top;
  double v5 = self->_overlayInsets.top;
  if (self->_overlayInsets.left != a3.left
    || v5 != top
    || self->_overlayInsets.right != a3.right
    || self->_overlayInsets.bottom != a3.bottom)
  {
    self->_overlayInsets.double top = top;
    self->_overlayInsets.CGFloat left = a3.left;
    self->_overlayInsets.CGFloat bottom = a3.bottom;
    self->_overlayInsets.CGFloat right = a3.right;
    -[PBPIPOverlayInsetsReporter _updateLayoutElementsWithPreviousOverlayInsets:transitionContext:]( self,  "_updateLayoutElementsWithPreviousOverlayInsets:transitionContext:",  a4,  v5);
  }

- (void)_updateLayoutElementsWithPreviousOverlayInsets:(UIEdgeInsets)a3 transitionContext:(id)a4
{
  id v6 = a4;
  v7 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 4LL);
  v8 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 4LL);
  CGFloat v9 = UIEdgeInsetsSubtract( 15LL,  self->_overlayInsets.top,  self->_overlayInsets.left,  self->_overlayInsets.bottom,  self->_overlayInsets.right,  self->_insetsAdjustment.top,  self->_insetsAdjustment.left,  self->_insetsAdjustment.bottom,  self->_insetsAdjustment.right);
  CGFloat v42 = v10;
  CGFloat v43 = v9;
  double v40 = v12;
  double v41 = v11;
  id v13 = sub_1000F730C();
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v32 = NSStringFromUIEdgeInsets(self->_overlayInsets);
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    v50.CGFloat left = v42;
    v50.double top = v43;
    v50.CGFloat right = v40;
    v50.CGFloat bottom = v41;
    v34 = NSStringFromUIEdgeInsets(v50);
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
    *(_DWORD *)buf = 138543618;
    v45 = v33;
    __int16 v46 = 2114;
    v47 = v35;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "Updating overlay insets {insets=%{public}@, adjusted=%{public}@}",  buf,  0x16u);
  }

  uint64_t v15 = 0LL;
  CGFloat y = CGRectZero.origin.y;
  CGFloat height = CGRectZero.size.height;
  CGFloat width = CGRectZero.size.width;
  do
  {
    v16 = self->_elements[v15];
    -[PBSOverlayLayoutElement frame](v16, "frame");
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    double x = self->_bounds.origin.x;
    double v26 = self->_bounds.origin.y;
    double v27 = self->_bounds.size.width;
    double v28 = v43;
    switch(v15)
    {
      case 0LL:
        break;
      case 1LL:
        double x = x + v27 - v40;
        double v27 = v40;
        goto LABEL_9;
      case 2LL:
        double v28 = v41;
        double v26 = v26 + self->_bounds.size.height - v41;
        break;
      case 3LL:
        double v27 = v42;
LABEL_9:
        double v28 = self->_bounds.size.height;
        break;
      default:
        double v26 = y;
        double x = CGRectZero.origin.x;
        double v28 = height;
        double v27 = width;
        break;
    }

    -[PBSOverlayLayoutElement setFrame:](v16, "setFrame:", x, v26, v27, v28);
    v48.origin.double x = x;
    v48.origin.CGFloat y = v26;
    v48.size.CGFloat width = v27;
    v48.size.CGFloat height = v28;
    if (CGRectIsEmpty(v48))
    {
      v49.origin.double x = v18;
      v49.origin.CGFloat y = v20;
      v49.size.CGFloat width = v22;
      v49.size.CGFloat height = v24;
      if (!CGRectIsEmpty(v49))
      {
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[PBSOverlayLayoutElement identifier](v16, "identifier"));
        -[NSMutableArray addObject:](v8, "addObject:", v29);
      }
    }

    else
    {
      -[NSMutableArray addObject:](v7, "addObject:", v16);
    }

    ++v15;
  }

  while (v15 != 4);
  v30 = (void *)objc_claimAutoreleasedReturnValue( +[PBSOverlayLayoutBatchUpdate batchUpdateWithUpdatedElements:removedElementIdentifiers:]( &OBJC_CLASS___PBSOverlayLayoutBatchUpdate,  "batchUpdateWithUpdatedElements:removedElementIdentifiers:",  v7,  v8));
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue( -[PBOverlayLayoutController performBatchUpdate:withTransitionContext:]( self->_layoutController,  "performBatchUpdate:withTransitionContext:",  v30,  v6));
  if ([v31 count])
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[hints count] == 0"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100271BF8(a2);
    }
    _bs_set_crash_log_message([v36 UTF8String]);
    __break(0);
    JUMPOUT(0x1000272F4LL);
  }
}

- (UIEdgeInsets)overlayInsets
{
  double top = self->_overlayInsets.top;
  double left = self->_overlayInsets.left;
  double bottom = self->_overlayInsets.bottom;
  double right = self->_overlayInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (PBOverlayLayoutController)layoutController
{
  return self->_layoutController;
}

- (CGRect)bounds
{
  double x = self->_bounds.origin.x;
  double y = self->_bounds.origin.y;
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (UIEdgeInsets)insetsAdjustment
{
  double top = self->_insetsAdjustment.top;
  double left = self->_insetsAdjustment.left;
  double bottom = self->_insetsAdjustment.bottom;
  double right = self->_insetsAdjustment.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = 4LL;
  do
    objc_storeStrong((id *)&(&self->super.isa)[v3--], 0LL);
  while (v3 * 8);
}

  ;
}

@end