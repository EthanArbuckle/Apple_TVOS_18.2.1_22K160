@interface PBUserNotificationTextEntryButtonView
+ (id)_createButtonsWithTitles:(id)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)buttonTitles;
- (NSArray)buttons;
- (PBUserNotificationTextEntryButtonView)initWithButtonTitles:(id)a3;
- (PBUserNotificationTextEntryButtonView)initWithButtons:(id)a3;
- (TextEntryButtonViewDelegate)delegate;
- (id)buttonAtIndex:(int64_t)a3;
- (id)buttonWithTitle:(id)a3;
- (int64_t)defaultButtonIndex;
- (int64_t)indexOfButton:(id)a3;
- (void)_didSelectButton:(id)a3;
- (void)setButtons:(id)a3;
- (void)setDefaultButtonIndex:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
@end

@implementation PBUserNotificationTextEntryButtonView

- (PBUserNotificationTextEntryButtonView)initWithButtonTitles:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class(self) _createButtonsWithTitles:v4];
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  v7 = -[PBUserNotificationTextEntryButtonView initWithButtons:](self, "initWithButtons:", v6);
  return v7;
}

- (PBUserNotificationTextEntryButtonView)initWithButtons:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___PBUserNotificationTextEntryButtonView;
  id v5 = -[PBUserNotificationTextEntryButtonView init](&v21, "init");
  v6 = v5;
  if (v5)
  {
    -[PBUserNotificationTextEntryButtonView setAxis:](v5, "setAxis:", 0LL);
    -[PBUserNotificationTextEntryButtonView setDistribution:](v6, "setDistribution:", 1LL);
    -[PBUserNotificationTextEntryButtonView setAlignment:](v6, "setAlignment:", 0LL);
    -[PBUserNotificationTextEntryButtonView setSpacing:](v6, "setSpacing:", 28.0);
    v6->_defaultButtonIndex = 0x7FFFFFFFFFFFFFFFLL;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id v7 = v4;
    id v8 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
          [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
          v13 = (void *)objc_claimAutoreleasedReturnValue([v12 widthAnchor]);
          v14 = (void *)objc_claimAutoreleasedReturnValue([v13 constraintGreaterThanOrEqualToConstant:250.0]);

          LODWORD(v15) = 1132068864;
          [v14 setPriority:v15];
          [v14 setActive:1];
          [v12 addTarget:v6 action:"_didSelectButton:" forControlEvents:0x2000];
          -[PBUserNotificationTextEntryButtonView addArrangedSubview:](v6, "addArrangedSubview:", v12);
        }

        id v9 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }

      while (v9);
    }

    -[PBUserNotificationTextEntryButtonView setButtons:](v6, "setButtons:", v7);
  }

  return v6;
}

- (id)buttonWithTitle:(id)a3
{
  id v4 = a3;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationTextEntryButtonView buttons](self, "buttons", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 titleLabel]);
        v11 = (void *)objc_claimAutoreleasedReturnValue([v10 text]);
        unsigned int v12 = [v4 isEqualToString:v11];

        if (v12)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

- (id)buttonAtIndex:(int64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationTextEntryButtonView buttons](self, "buttons"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndex:a3]);

  return v5;
}

- (int64_t)indexOfButton:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationTextEntryButtonView buttons](self, "buttons"));
  id v6 = [v5 indexOfObject:v4];

  return (int64_t)v6;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setEnabled:(BOOL)a3
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationTextEntryButtonView buttons](self, "buttons"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100139788;
  v5[3] = &unk_1003D8BB0;
  BOOL v6 = a3;
  [v4 enumerateObjectsUsingBlock:v5];
}

+ (id)_createButtonsWithTitles:(id)a3
{
  id v3 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100139850;
  v7[3] = &unk_1003D8BD8;
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v3 count]));
  id v4 = v8;
  [v3 enumerateObjectsUsingBlock:v7];

  id v5 = [v4 copy];
  return v5;
}

- (void)_didSelectButton:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  BOOL v6 = WeakRetained;
  if (WeakRetained && (objc_opt_respondsToSelector(WeakRetained, "buttonView:didSelectButton:atIndex:") & 1) != 0) {
    objc_msgSend( v6,  "buttonView:didSelectButton:atIndex:",  self,  v4,  -[PBUserNotificationTextEntryButtonView indexOfButton:](self, "indexOfButton:", v4));
  }
}

- (NSArray)buttonTitles
{
  return self->_buttonTitles;
}

- (NSArray)buttons
{
  return self->_buttons;
}

- (void)setButtons:(id)a3
{
}

- (int64_t)defaultButtonIndex
{
  return self->_defaultButtonIndex;
}

- (void)setDefaultButtonIndex:(int64_t)a3
{
  self->_defaultButtonIndex = a3;
}

- (TextEntryButtonViewDelegate)delegate
{
  return (TextEntryButtonViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end