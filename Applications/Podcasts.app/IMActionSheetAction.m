@interface IMActionSheetAction
- (NSArray)actions;
- (NSAttributedString)attributedMessageForAlertController;
- (NSString)messageForAlertController;
- (NSString)titleForAlertController;
- (UIAlertController)alertController;
- (UIBarButtonItem)buttonItem;
- (UIButton)button;
- (id)titleForAlertControllerBlock;
- (id)titleForCancelAction;
- (void)dealloc;
- (void)dismissActionSheet;
- (void)setAlertController:(id)a3;
- (void)setAttributedMessageForAlertController:(id)a3;
- (void)setButton:(id)a3;
- (void)setButtonItem:(id)a3;
- (void)setMessageForAlertController:(id)a3;
- (void)setTitleForAlertController:(id)a3;
- (void)setTitleForAlertControllerBlock:(id)a3;
- (void)showActionSheetWithActions:(id)a3 fromButton:(id)a4;
- (void)updateActionSheet;
@end

@implementation IMActionSheetAction

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___IMActionSheetAction;
  -[IMActionSheetAction dealloc](&v3, "dealloc");
}

- (UIButton)button
{
  button = self->_button;
  if (!button)
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___IMActionSheetAction;
    id v4 = -[IMAction button](&v8, "button");
    v5 = (UIButton *)objc_claimAutoreleasedReturnValue(v4);
    v6 = self->_button;
    self->_button = v5;

    button = self->_button;
  }

  return button;
}

- (void)setButton:(id)a3
{
  v5 = (UIButton *)a3;
  button = self->_button;
  if (button != v5)
  {
    v10 = v5;
    if (button)
    {
      buttonItem = self->_buttonItem;
      if (buttonItem)
      {
        objc_super v8 = (UIButton *)objc_claimAutoreleasedReturnValue(-[UIBarButtonItem customView](buttonItem, "customView"));
        v9 = self->_button;

        if (v8 == v9) {
          -[IMActionSheetAction setButtonItem:](self, "setButtonItem:", 0LL);
        }
      }
    }

    objc_storeStrong((id *)&self->_button, a3);
    v5 = v10;
  }
}

- (UIBarButtonItem)buttonItem
{
  buttonItem = self->_buttonItem;
  if (!buttonItem)
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___IMActionSheetAction;
    id v4 = -[IMAction buttonItem](&v8, "buttonItem");
    v5 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue(v4);
    v6 = self->_buttonItem;
    self->_buttonItem = v5;

    buttonItem = self->_buttonItem;
  }

  return buttonItem;
}

- (void)setAlertController:(id)a3
{
  v5 = (UIAlertController *)a3;
  alertController = self->_alertController;
  if (alertController != v5)
  {
    v7 = alertController;
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIAlertController popoverPresentationController](v7, "popoverPresentationController"));
    [v8 setDelegate:0];

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIAlertController presentingViewController](v7, "presentingViewController"));
    if (v9)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10000C454;
      block[3] = &unk_10023FF98;
      v12 = v7;
      dispatch_async(&_dispatch_main_q, block);
    }

    objc_storeStrong((id *)&self->_alertController, a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue( -[UIAlertController popoverPresentationController]( self->_alertController,  "popoverPresentationController"));
    [v10 setDelegate:self];
  }
}

- (void)showActionSheetWithActions:(id)a3 fromButton:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_storeStrong((id *)&self->_actions, a3);
  v30 = self;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[IMActionSheetAction titleForAlertController](self, "titleForAlertController"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[IMActionSheetAction messageForAlertController](self, "messageForAlertController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v31));
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id obj = v7;
  id v10 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v36;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v36 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue([v14 title]);
        id v16 = [v15 length];

        if (v16)
        {
          else {
            uint64_t v17 = 0LL;
          }
          v18 = v9;
          v19 = (void *)objc_claimAutoreleasedReturnValue([v14 title]);
          v33[0] = _NSConcreteStackBlock;
          v33[1] = 3221225472LL;
          v33[2] = sub_10000C814;
          v33[3] = &unk_1002402E0;
          v33[4] = v14;
          id v34 = v8;
          v20 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v19,  v17,  v33));

          v9 = v18;
          [v18 addAction:v20];
        }
      }

      id v11 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    }

    while (v11);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[IMActionSheetAction attributedMessageForAlertController](v30, "attributedMessageForAlertController"));
  if (v21) {
    [v9 _setAttributedMessage:v21];
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[IMActionSheetAction titleForCancelAction](v30, "titleForCancelAction"));
  v23 = v9;
  v24 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v22,  1LL,  0LL));
  [v23 addAction:v24];

  -[IMPopoverPresentationAction setPresentingButton:](v30, "setPresentingButton:", v8);
  -[IMActionSheetAction setAlertController:](v30, "setAlertController:", v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[IMAction controller](v30, "controller"));
  v26 = (void *)objc_claimAutoreleasedReturnValue([v25 delegate]);

  [v26 presentViewController:v23 animated:1 completion:0];
  v27 = (void *)objc_claimAutoreleasedReturnValue([v23 popoverPresentationController]);
  [v27 setDelegate:v30];

  v28 = (void *)objc_claimAutoreleasedReturnValue([v23 popoverPresentationController]);
  -[IMPopoverPresentationAction prepareForPopoverPresentation:](v30, "prepareForPopoverPresentation:", v28);
}

- (void)dismissActionSheet
{
}

- (void)updateActionSheet
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMActionSheetAction alertController](self, "alertController"));
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 presentingViewController]);
  if (v4)
  {
    v5 = (void *)v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue([v3 presentationController]);
    if ([v6 presentationStyle] == (id)7)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 transitionCoordinator]);

      if (!v7)
      {
        objc_initWeak(&location, self);
        id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 presentingViewController]);
        v9[0] = _NSConcreteStackBlock;
        v9[1] = 3221225472LL;
        v9[2] = sub_10000CA1C;
        v9[3] = &unk_100240290;
        objc_copyWeak(&v10, &location);
        [v8 dismissViewControllerAnimated:0 completion:v9];

        objc_destroyWeak(&v10);
        objc_destroyWeak(&location);
      }
    }

    else
    {
    }
  }
}

- (NSString)titleForAlertController
{
  objc_super v3 = self->_titleForAlertController;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMActionSheetAction titleForAlertControllerBlock](self, "titleForAlertControllerBlock"));

  if (v4)
  {
    v5 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue( -[IMActionSheetAction titleForAlertControllerBlock]( self,  "titleForAlertControllerBlock"));
    uint64_t v6 = ((uint64_t (**)(void, IMActionSheetAction *))v5)[2](v5, self);
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);

    objc_super v3 = (NSString *)v7;
  }

  return v3;
}

- (id)titleForCancelAction
{
  return 0LL;
}

- (void)setButtonItem:(id)a3
{
}

- (UIAlertController)alertController
{
  return self->_alertController;
}

- (void)setTitleForAlertController:(id)a3
{
}

- (id)titleForAlertControllerBlock
{
  return self->_titleForAlertControllerBlock;
}

- (void)setTitleForAlertControllerBlock:(id)a3
{
}

- (NSString)messageForAlertController
{
  return self->_messageForAlertController;
}

- (void)setMessageForAlertController:(id)a3
{
}

- (NSAttributedString)attributedMessageForAlertController
{
  return self->_attributedMessageForAlertController;
}

- (void)setAttributedMessageForAlertController:(id)a3
{
}

- (NSArray)actions
{
  return self->_actions;
}

- (void).cxx_destruct
{
}

@end