@interface IMAction
+ (id)podcastDeleteAction;
+ (id)podcastPlayAction;
+ (id)podcastRefreshAction;
+ (id)podcastSettingsAction;
+ (id)stationDeleteAction;
+ (id)stationPlayAction;
+ (id)stationRefreshAction;
+ (id)stationSettingsAction;
- (BOOL)isAllowedForController:(id)a3;
- (BOOL)isDestructive;
- (IMAction)initWithTitle:(id)a3 icon:(id)a4;
- (IMActionController)controller;
- (NSString)title;
- (UIImage)icon;
- (id)actionBlock;
- (id)button;
- (id)buttonBlock;
- (id)buttonItem;
- (id)buttonItemBlock;
- (id)conditionBlock;
- (void)buttonTapped:(id)a3;
- (void)setActionBlock:(id)a3;
- (void)setButtonBlock:(id)a3;
- (void)setButtonItemBlock:(id)a3;
- (void)setConditionBlock:(id)a3;
- (void)setController:(id)a3;
- (void)setDestructive:(BOOL)a3;
- (void)setIcon:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation IMAction

+ (id)podcastPlayAction
{
  v2 = objc_alloc(&OBJC_CLASS___IMAction);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedStringForKey:@"Play" value:&stru_100248948 table:0]);
  v5 = -[IMAction initWithTitle:icon:](v2, "initWithTitle:icon:", v4, 0LL);

  -[IMAction setConditionBlock:](v5, "setConditionBlock:", &stru_100241008);
  -[IMAction setActionBlock:](v5, "setActionBlock:", &stru_100241048);
  return v5;
}

+ (id)podcastRefreshAction
{
  v2 = objc_alloc(&OBJC_CLASS___IMAction);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedStringForKey:@"Refresh" value:&stru_100248948 table:0]);
  v5 = -[IMAction initWithTitle:icon:](v2, "initWithTitle:icon:", v4, 0LL);

  -[IMAction setConditionBlock:](v5, "setConditionBlock:", &stru_100241068);
  -[IMAction setActionBlock:](v5, "setActionBlock:", &stru_100241088);
  return v5;
}

+ (id)podcastSettingsAction
{
  v2 = objc_alloc(&OBJC_CLASS___IMAction);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedStringForKey:@"Settings" value:&stru_100248948 table:0]);
  v5 = -[IMAction initWithTitle:icon:](v2, "initWithTitle:icon:", v4, 0LL);

  -[IMAction setConditionBlock:](v5, "setConditionBlock:", &stru_1002410A8);
  -[IMAction setActionBlock:](v5, "setActionBlock:", &stru_1002410C8);
  return v5;
}

+ (id)podcastDeleteAction
{
  v2 = objc_alloc(&OBJC_CLASS___IMAction);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedStringForKey:@"Unfollow" value:&stru_100248948 table:0]);
  v5 = -[IMAction initWithTitle:icon:](v2, "initWithTitle:icon:", v4, 0LL);

  -[IMAction setConditionBlock:](v5, "setConditionBlock:", &stru_1002410E8);
  -[IMAction setActionBlock:](v5, "setActionBlock:", &stru_100241108);
  -[IMAction setDestructive:](v5, "setDestructive:", 1LL);
  return v5;
}

+ (id)stationPlayAction
{
  v2 = objc_alloc(&OBJC_CLASS___IMAction);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedStringForKey:@"Play" value:&stru_100248948 table:0]);
  v5 = -[IMAction initWithTitle:icon:](v2, "initWithTitle:icon:", v4, 0LL);

  -[IMAction setConditionBlock:](v5, "setConditionBlock:", &stru_1002444E0);
  -[IMAction setActionBlock:](v5, "setActionBlock:", &stru_100244520);
  return v5;
}

+ (id)stationRefreshAction
{
  v2 = objc_alloc(&OBJC_CLASS___IMAction);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedStringForKey:@"Refresh" value:&stru_100248948 table:0]);
  v5 = -[IMAction initWithTitle:icon:](v2, "initWithTitle:icon:", v4, 0LL);

  -[IMAction setConditionBlock:](v5, "setConditionBlock:", &stru_100244540);
  -[IMAction setActionBlock:](v5, "setActionBlock:", &stru_100244560);
  return v5;
}

+ (id)stationSettingsAction
{
  v2 = objc_alloc(&OBJC_CLASS___IMAction);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedStringForKey:@"Settings" value:&stru_100248948 table:0]);
  v5 = -[IMAction initWithTitle:icon:](v2, "initWithTitle:icon:", v4, 0LL);

  -[IMAction setConditionBlock:](v5, "setConditionBlock:", &stru_100244580);
  -[IMAction setActionBlock:](v5, "setActionBlock:", &stru_1002445A0);
  return v5;
}

+ (id)stationDeleteAction
{
  v2 = objc_alloc(&OBJC_CLASS___IMAction);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedStringForKey:@"DELETE_SINGULAR" value:&stru_100248948 table:0]);
  v5 = -[IMAction initWithTitle:icon:](v2, "initWithTitle:icon:", v4, 0LL);

  -[IMAction setConditionBlock:](v5, "setConditionBlock:", &stru_1002445C0);
  -[IMAction setActionBlock:](v5, "setActionBlock:", &stru_1002445E0);
  -[IMAction setDestructive:](v5, "setDestructive:", 1LL);
  return v5;
}

- (IMAction)initWithTitle:(id)a3 icon:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___IMAction;
  v9 = -[IMAction init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_title, a3);
    objc_storeStrong((id *)&v10->_icon, a4);
  }

  return v10;
}

- (id)button
{
  buttonBlock = (uint64_t (**)(id, SEL))self->_buttonBlock;
  if (buttonBlock)
  {
    uint64_t v4 = buttonBlock[2](buttonBlock, a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  }

  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](&OBJC_CLASS___UIButton, "buttonWithType:", 0LL));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMAction icon](self, "icon"));
    [v6 setImage:v7 forState:0];

    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IMAction title](self, "title"));
    [v6 setTitle:v8 forState:0];

    v5 = 0LL;
  }

  [v5 addTarget:self action:"buttonTapped:" forControlEvents:64];
  return v5;
}

- (id)buttonItem
{
  buttonItemBlock = (uint64_t (**)(id, SEL))self->_buttonItemBlock;
  if (buttonItemBlock)
  {
    uint64_t v4 = buttonItemBlock[2](buttonItemBlock, a2);
    v5 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue(v4);
    -[UIBarButtonItem setTarget:](v5, "setTarget:", self);
    -[UIBarButtonItem setAction:](v5, "setAction:", "buttonTapped:");
  }

  else
  {
    v6 = objc_alloc(&OBJC_CLASS___UIBarButtonItem);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMAction button](self, "button"));
    v5 = -[UIBarButtonItem initWithCustomView:](v6, "initWithCustomView:", v7);
  }

  return v5;
}

- (BOOL)isAllowedForController:(id)a3
{
  conditionBlock = (uint64_t (**)(id, id))self->_conditionBlock;
  if (conditionBlock) {
    LOBYTE(conditionBlock) = conditionBlock[2](conditionBlock, a3);
  }
  return (char)conditionBlock;
}

- (void)buttonTapped:(id)a3
{
  actionBlock = (void (**)(id, id, id))self->_actionBlock;
  if (actionBlock)
  {
    p_controller = &self->_controller;
    id v5 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_controller);
    actionBlock[2](actionBlock, WeakRetained, v5);
  }

- (IMActionController)controller
{
  return (IMActionController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (void)setController:(id)a3
{
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (BOOL)isDestructive
{
  return self->_destructive;
}

- (void)setDestructive:(BOOL)a3
{
  self->_destructive = a3;
}

- (id)conditionBlock
{
  return self->_conditionBlock;
}

- (void)setConditionBlock:(id)a3
{
}

- (id)actionBlock
{
  return self->_actionBlock;
}

- (void)setActionBlock:(id)a3
{
}

- (id)buttonBlock
{
  return self->_buttonBlock;
}

- (void)setButtonBlock:(id)a3
{
}

- (id)buttonItemBlock
{
  return self->_buttonItemBlock;
}

- (void)setButtonItemBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end