@interface FKACommandsView
- (FKACommandsView)initWithCommandLists:(id)a3;
- (NSArray)commandLists;
- (id)primaryTextStyle;
- (void)setCommandLists:(id)a3;
@end

@implementation FKACommandsView

- (FKACommandsView)initWithCommandLists:(id)a3
{
  id v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___FKACommandsView;
  v6 = -[FKACommandsView init](&v28, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_commandLists, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id v23 = v5;
    id v9 = v5;
    id v10 = [v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v25;
      do
      {
        v13 = 0LL;
        do
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v24 + 1) + 8LL * (void)v13);
          v15 = objc_alloc(&OBJC_CLASS___FKACommandListView);
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[FKACommandsView platterBlurEffect](v7, "platterBlurEffect"));
          v17 = -[FKACommandListView initWithCommandList:blurEffect:](v15, "initWithCommandList:blurEffect:", v14, v16);

          [v8 addObject:v17];
          v13 = (char *)v13 + 1;
        }

        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }

      while (v11);
    }

    v18 = -[UIStackView initWithArrangedSubviews:]( objc_alloc(&OBJC_CLASS___UIStackView),  "initWithArrangedSubviews:",  v8);
    -[UIStackView setAxis:](v18, "setAxis:", 1LL);
    -[UIStackView setSpacing:](v18, "setSpacing:", 0.0);
    -[UIStackView setDistribution:](v18, "setDistribution:", 3LL);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:]( v18,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[FKACommandsView contentView](v7, "contentView"));
    [v19 addSubview:v18];

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[FKACommandsView contentView](v7, "contentView"));
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint ax_constraintsToMakeView:sameDimensionsAsView:]( &OBJC_CLASS___NSLayoutConstraint,  "ax_constraintsToMakeView:sameDimensionsAsView:",  v18,  v20));
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v21);

    id v5 = v23;
  }

  return v7;
}

- (id)primaryTextStyle
{
  return UIFontTextStyleSubheadline;
}

- (NSArray)commandLists
{
  return self->_commandLists;
}

- (void)setCommandLists:(id)a3
{
}

- (void).cxx_destruct
{
}

@end