@interface TVHProductCreditsView
- (NSArray)actors;
- (NSArray)directors;
- (TVHProductCreditRoleView)actorsView;
- (TVHProductCreditRoleView)directorsView;
- (void)layoutSubviews;
- (void)setActors:(id)a3;
- (void)setActorsView:(id)a3;
- (void)setDirectors:(id)a3;
- (void)setDirectorsView:(id)a3;
@end

@implementation TVHProductCreditsView

- (NSArray)directors
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductCreditsView directorsView](self, "directorsView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 names]);

  return (NSArray *)v3;
}

- (void)setDirectors:(id)a3
{
  id v12 = a3;
  v4 = (TVHProductCreditRoleView *)objc_claimAutoreleasedReturnValue(-[TVHProductCreditsView directorsView](self, "directorsView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductCreditRoleView names](v4, "names"));
  unsigned __int8 v6 = [v5 isEqualToArray:v12];

  if ((v6 & 1) == 0)
  {
    if ([v12 count])
    {
      if (!v4)
      {
        v4 = objc_alloc_init(&OBJC_CLASS___TVHProductCreditRoleView);
        -[TVHProductCreditRoleView tvh_setDebugLayoutColorType:](v4, "tvh_setDebugLayoutColorType:", 13LL);
        -[TVHProductCreditsView setDirectorsView:](self, "setDirectorsView:", v4);
        -[TVHProductCreditsView addSubview:](self, "addSubview:", v4);
      }

      id v7 = [v12 count];
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v9 = v8;
      if (v7 == (id)1) {
        v10 = @"DIRECTOR_TITLE";
      }
      else {
        v10 = @"DIRECTORS_TITLE";
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue([v8 localizedStringForKey:v10 value:0 table:0]);

      -[TVHProductCreditRoleView setTitle:](v4, "setTitle:", v11);
      -[TVHProductCreditRoleView setNames:](v4, "setNames:", v12);
    }

    else
    {
      -[TVHProductCreditRoleView removeFromSuperview](v4, "removeFromSuperview");
      -[TVHProductCreditsView setDirectorsView:](self, "setDirectorsView:", 0LL);
    }

    -[TVHProductCreditsView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (NSArray)actors
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductCreditsView actorsView](self, "actorsView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 names]);

  return (NSArray *)v3;
}

- (void)setActors:(id)a3
{
  id v9 = a3;
  v4 = (TVHProductCreditRoleView *)objc_claimAutoreleasedReturnValue(-[TVHProductCreditsView actorsView](self, "actorsView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductCreditRoleView names](v4, "names"));
  unsigned __int8 v6 = [v5 isEqualToArray:v9];

  if ((v6 & 1) == 0)
  {
    if ([v9 count])
    {
      if (!v4)
      {
        v4 = objc_alloc_init(&OBJC_CLASS___TVHProductCreditRoleView);
        -[TVHProductCreditRoleView tvh_setDebugLayoutColorType:](v4, "tvh_setDebugLayoutColorType:", 9LL);
        -[TVHProductCreditsView setActorsView:](self, "setActorsView:", v4);
        id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        v8 = (void *)objc_claimAutoreleasedReturnValue([v7 localizedStringForKey:@"CAST_TITLE" value:0 table:0]);

        -[TVHProductCreditRoleView setTitle:](v4, "setTitle:", v8);
        -[TVHProductCreditsView addSubview:](self, "addSubview:", v4);
      }

      -[TVHProductCreditRoleView setNames:](v4, "setNames:", v9);
    }

    else
    {
      -[TVHProductCreditRoleView removeFromSuperview](v4, "removeFromSuperview");
      -[TVHProductCreditsView setActorsView:](self, "setActorsView:", 0LL);
    }

    -[TVHProductCreditsView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TVHProductCreditsView;
  -[TVHProductCreditsView layoutSubviews](&v14, "layoutSubviews");
  -[TVHProductCreditsView bounds](self, "bounds");
  double v4 = v3;
  double v6 = v5;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductCreditsView directorsView](self, "directorsView"));
  objc_msgSend(v7, "sizeThatFits:", v4, v6);
  if (v8 >= v6) {
    double v9 = v6;
  }
  else {
    double v9 = v8;
  }
  objc_msgSend(v7, "setFrame:", 0.0, 0.0, v4, v9);
  if (v6 - v9 > 36.0)
  {
    double v10 = v6 - v9 + -36.0;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductCreditsView actorsView](self, "actorsView"));
    id v12 = v11;
    if (v10 > 0.0 && v11 != 0LL) {
      objc_msgSend(v11, "setFrame:", 0.0, v9 + 36.0, v4, v10);
    }
  }
}

- (TVHProductCreditRoleView)directorsView
{
  return self->_directorsView;
}

- (void)setDirectorsView:(id)a3
{
}

- (TVHProductCreditRoleView)actorsView
{
  return self->_actorsView;
}

- (void)setActorsView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end