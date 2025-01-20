@interface IMActionController
- (IMActionController)initWithDelegate:(id)a3;
- (IMActionControllerDelegate)delegate;
- (IMActionSheetAction)moreAction;
- (NSArray)allActions;
- (NSArray)availableActions;
- (NSObject)actionObject;
- (id)createMoreAction;
- (id)presentAvailableActionsFromView:(id)a3;
- (void)dismissActionSheetsAndPopovers;
- (void)prepareForReuse;
- (void)registerActions:(id)a3;
- (void)reloadActions;
- (void)setActionObject:(id)a3;
- (void)setActionObject:(id)a3 reloadActions:(BOOL)a4;
- (void)setAllActions:(id)a3;
- (void)setAvailableActions:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMoreAction:(id)a3;
- (void)updateActionSheetsAndPopovers;
@end

@implementation IMActionController

- (IMActionController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___IMActionController;
  v5 = -[IMActionController init](&v8, "init");
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (void)setActionObject:(id)a3
{
}

- (void)setActionObject:(id)a3 reloadActions:(BOOL)a4
{
  BOOL v4 = a4;
  objc_storeStrong((id *)&self->_actionObject, a3);
  if (a3)
  {
    if (v4) {
      -[IMActionController reloadActions](self, "reloadActions");
    }
  }

- (void)reloadActions
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[IMActionController allActions](self, "allActions"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000B2E04;
  v6[3] = &unk_1002438E0;
  v6[4] = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue([v5 indexesOfObjectsPassingTest:v6]);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v5 objectsAtIndexes:v3]);
  -[IMActionController setAvailableActions:](self, "setAvailableActions:", v4);
}

- (id)presentAvailableActionsFromView:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMActionController moreAction](self, "moreAction"));
  v6 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([v5 actionBlock]);
  ((void (**)(void, IMActionController *, id))v6)[2](v6, self, v4);

  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 alertController]);
  return v7;
}

- (void)prepareForReuse
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMActionController moreAction](self, "moreAction"));
  [v3 setAlertController:0];

  -[IMActionController setActionObject:](self, "setActionObject:", 0LL);
}

- (void)updateActionSheetsAndPopovers
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMActionController availableActions](self, "availableActions"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000B2FC8;
  v5[3] = &unk_100243948;
  id v6 = &stru_100243920;
  [v3 enumerateObjectsUsingBlock:v5];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMActionController moreAction](self, "moreAction"));
  sub_1000B2F6C(v4, v4);
}

- (void)dismissActionSheetsAndPopovers
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMActionController availableActions](self, "availableActions"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000B30C4;
  v5[3] = &unk_100243948;
  id v6 = &stru_100243968;
  [v3 enumerateObjectsUsingBlock:v5];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMActionController moreAction](self, "moreAction"));
  sub_1000B3068(v4, v4);
}

- (void)setAvailableActions:(id)a3
{
  id v4 = (NSArray *)a3;
  -[IMActionController registerActions:](self, "registerActions:", v4);
  availableActions = self->_availableActions;
  self->_availableActions = v4;
}

- (void)registerActions:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000B3160;
  v3[3] = &unk_100243990;
  v3[4] = self;
  [a3 enumerateObjectsUsingBlock:v3];
}

- (id)createMoreAction
{
  v2 = -[IMAction initWithTitle:icon:](objc_alloc(&OBJC_CLASS___IMActionSheetAction), "initWithTitle:icon:", 0LL, 0LL);
  objc_initWeak(&location, v2);
  id v4 = _NSConcreteStackBlock;
  uint64_t v5 = 3221225472LL;
  id v6 = sub_1000B3244;
  v7 = &unk_100242570;
  objc_copyWeak(&v8, &location);
  -[IMAction setActionBlock:](v2, "setActionBlock:", &v4);
  -[IMAction setConditionBlock:](v2, "setConditionBlock:", &stru_1002439B0, v4, v5, v6, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  return v2;
}

- (IMActionSheetAction)moreAction
{
  moreAction = self->_moreAction;
  if (!moreAction)
  {
    id v4 = (IMActionSheetAction *)objc_claimAutoreleasedReturnValue(-[IMActionController createMoreAction](self, "createMoreAction"));
    uint64_t v5 = self->_moreAction;
    self->_moreAction = v4;

    -[IMAction setController:](self->_moreAction, "setController:", self);
    moreAction = self->_moreAction;
  }

  return moreAction;
}

- (NSObject)actionObject
{
  return self->_actionObject;
}

- (IMActionControllerDelegate)delegate
{
  return (IMActionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void)setMoreAction:(id)a3
{
}

- (NSArray)allActions
{
  return self->_allActions;
}

- (void)setAllActions:(id)a3
{
}

- (NSArray)availableActions
{
  return self->_availableActions;
}

- (void).cxx_destruct
{
}

@end