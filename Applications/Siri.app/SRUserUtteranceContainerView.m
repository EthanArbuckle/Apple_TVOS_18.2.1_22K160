@interface SRUserUtteranceContainerView
- (BOOL)isFirstResponder;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SRUserUtteranceView)displayView;
- (UIView)tableView;
- (double)baselineOffsetFromBottom;
- (double)firstLineBaselineOffsetFromTop;
- (void)animateToDisplayWithDuration:(double)a3 completion:(id)a4;
- (void)animateToEditWithDuration:(double)a3 completion:(id)a4;
- (void)layoutSubviews;
- (void)setDisplayView:(id)a3;
- (void)setTableView:(id)a3;
@end

@implementation SRUserUtteranceContainerView

- (BOOL)isFirstResponder
{
  uint64_t v18 = 0LL;
  v19 = &v18;
  uint64_t v20 = 0x2020000000LL;
  char v21 = 0;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceContainerView subviews](self, "subviews"));
  id v4 = [v2 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v15;
LABEL_3:
    uint64_t v6 = 0LL;
    while (1)
    {
      if (*(void *)v15 != v5) {
        objc_enumerationMutation(v2);
      }
      v7 = *(void **)(*((void *)&v14 + 1) + 8 * v6);
      objc_opt_class(&OBJC_CLASS___UICollectionView, v3);
      if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
      {
        id v9 = v7;
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472LL;
        v13[2] = sub_10000F240;
        v13[3] = &unk_1000BA0E0;
        v13[4] = &v18;
        [v9 _enumerateDescendentViews:v13];
        BOOL v10 = *((_BYTE *)v19 + 24) == 0;

        if (!v10) {
          break;
        }
      }

      if (v4 == (id)++v6)
      {
        id v4 = [v2 countByEnumeratingWithState:&v14 objects:v22 count:16];
        if (v4) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  char v11 = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&v18, 8);
  return v11;
}

- (void)animateToEditWithDuration:(double)a3 completion:(id)a4
{
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
  [WeakRetained setAlpha:0.0];

  id v8 = objc_loadWeakRetained((id *)&self->_tableView);
  -[SRUserUtteranceContainerView addSubview:](self, "addSubview:", v8);

  self->_showEditingView = 1;
  id v11 = v6;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10000F3C0;
  v12[3] = &unk_1000BA078;
  v12[4] = self;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10000F42C;
  v10[3] = &unk_1000BA108;
  v10[4] = self;
  id v9 = v6;
  +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v12,  v10,  a3);
}

- (void)animateToDisplayWithDuration:(double)a3 completion:(id)a4
{
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_displayView);
  [WeakRetained setChevronHidden:0];

  id v8 = objc_loadWeakRetained((id *)&self->_displayView);
  [v8 setAlpha:0.0];

  id v9 = objc_loadWeakRetained((id *)&self->_displayView);
  -[SRUserUtteranceContainerView addSubview:](self, "addSubview:", v9);

  self->_showEditingView = 0;
  id v12 = v6;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10000F594;
  v13[3] = &unk_1000BA078;
  v13[4] = self;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10000F600;
  v11[3] = &unk_1000BA108;
  v11[4] = self;
  id v10 = v6;
  +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v13,  v11,  a3);
}

- (double)firstLineBaselineOffsetFromTop
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_displayView);
  [WeakRetained firstLineBaselineOffsetFromTop];
  double v4 = v3;

  return v4;
}

- (double)baselineOffsetFromBottom
{
  if (self->_showEditingView)
  {
    id WeakRetained = (id)objc_claimAutoreleasedReturnValue(+[UIFont siriui_userUtteranceFont](&OBJC_CLASS___UIFont, "siriui_userUtteranceFont"));
    [WeakRetained descender];
    double v4 = -v3;
  }

  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_displayView);
    [WeakRetained baselineOffsetFromBottom];
    double v4 = v5;
  }

  return v4;
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___SRUserUtteranceContainerView;
  -[SRUserUtteranceContainerView layoutSubviews](&v15, "layoutSubviews");
  -[SRUserUtteranceContainerView bounds](self, "bounds");
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  if (self->_showEditingView) {
    id v11 = &OBJC_IVAR___SRUserUtteranceContainerView__tableView;
  }
  else {
    id v11 = &OBJC_IVAR___SRUserUtteranceContainerView__displayView;
  }
  if (self->_showEditingView) {
    double v12 = -8.0;
  }
  else {
    double v12 = 0.0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + *v11));
  v16.origin.x = v4;
  v16.origin.y = v6;
  v16.size.width = v8;
  v16.size.height = v10;
  double Width = CGRectGetWidth(v16);
  v17.origin.x = v4;
  v17.origin.y = v6;
  v17.size.width = v8;
  v17.size.height = v10;
  objc_msgSend(WeakRetained, "setFrame:", 0.0, v12, Width, CGRectGetHeight(v17));
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (self->_showEditingView)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
    objc_msgSend(WeakRetained, "sizeThatFits:", width, height);
  }

  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_displayView);
    objc_msgSend(WeakRetained, "sizeThatFits:", width, height);
    double width = v7;
  }

  double v8 = v6;

  double v9 = width;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (SRUserUtteranceView)displayView
{
  return (SRUserUtteranceView *)objc_loadWeakRetained((id *)&self->_displayView);
}

- (void)setDisplayView:(id)a3
{
}

- (UIView)tableView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_tableView);
}

- (void)setTableView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end