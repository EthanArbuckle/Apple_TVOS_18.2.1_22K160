@interface AXTVSwitchControlAddSwitchViewController
- (AXSwitchRegistrar)switchRegistrar;
- (AXTVSwitchControlAddSwitchViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (AXTVSwitchControlAddSwitchViewController)initWithStyle:(int64_t)a3;
- (BOOL)switchRegistrarShouldFilterEvents:(id)a3;
- (BOOL)switchRegistrarShouldProcessGamepadEvent:(id)a3;
- (BOOL)switchRegistrarShouldProcessKeyboardKeyEvent:(id)a3;
- (BOOL)switchRegistrarShouldProcessMFIButtonEvent:(id)a3;
- (BOOL)switchRegistrarShouldProcessMIDIEvent:(id)a3;
- (TSKTextInputViewController)switchNameEntryViewController;
- (UIAlertController)alertController;
- (id)_activateInstructionsGroup;
- (id)loadSettingGroups;
- (void)_commonInit;
- (void)_showAlertForSwitchInUse;
- (void)_showAlertForSwitchNameInUse;
- (void)_showAlertForSwitchNameInvalid;
- (void)_showTextInputForSave:(id)a3;
- (void)dealloc;
- (void)editingController:(id)a3 didProvideValue:(id)a4 forSettingItem:(id)a5;
- (void)setAlertController:(id)a3;
- (void)setSwitchNameEntryViewController:(id)a3;
- (void)setSwitchRegistrar:(id)a3;
- (void)switchRegistrar:(id)a3 didUpdateSwitch:(id)a4;
- (void)switchRegistrarGamepadSourceAlreadyInUseForSwitch:(id)a3;
- (void)switchRegistrarKeyboardKeyAlreadyInUseForSwitch:(id)a3;
- (void)switchRegistrarMFIButtonAlreadyInUseForSwitch:(id)a3;
- (void)switchRegistrarMIDISourceAlreadyInUseForSwitch:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AXTVSwitchControlAddSwitchViewController

- (void)_commonInit
{
  v3 = objc_alloc_init(&OBJC_CLASS___AXSwitchRegistrar);
  -[AXTVSwitchControlAddSwitchViewController setSwitchRegistrar:](self, "setSwitchRegistrar:", v3);

  id v4 = (id)objc_claimAutoreleasedReturnValue(-[AXTVSwitchControlAddSwitchViewController switchRegistrar](self, "switchRegistrar"));
  [v4 setDelegate:self];
}

- (AXTVSwitchControlAddSwitchViewController)initWithStyle:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___AXTVSwitchControlAddSwitchViewController;
  v3 = -[AXTVSwitchControlAddSwitchViewController initWithStyle:](&v6, "initWithStyle:", a3);
  id v4 = v3;
  if (v3) {
    -[AXTVSwitchControlAddSwitchViewController _commonInit](v3, "_commonInit");
  }
  return v4;
}

- (AXTVSwitchControlAddSwitchViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___AXTVSwitchControlAddSwitchViewController;
  id v4 = -[AXTVSwitchControlAddSwitchViewController initWithNibName:bundle:](&v7, "initWithNibName:bundle:", a3, a4);
  v5 = v4;
  if (v4) {
    -[AXTVSwitchControlAddSwitchViewController _commonInit](v4, "_commonInit");
  }
  return v5;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSwitchControlAddSwitchViewController switchRegistrar](self, "switchRegistrar"));
  [v3 setDelegate:0];

  -[AXTVSwitchControlAddSwitchViewController setSwitchRegistrar:](self, "setSwitchRegistrar:", 0LL);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___AXTVSwitchControlAddSwitchViewController;
  -[AXTVSwitchControlAddSwitchViewController dealloc](&v4, "dealloc");
}

- (id)loadSettingGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue( -[AXTVSwitchControlAddSwitchViewController _activateInstructionsGroup]( self,  "_activateInstructionsGroup"));
  [v3 axSafelyAddObject:v4];

  return v3;
}

- (id)_activateInstructionsGroup
{
  id v2 = [[TSKSettingGroup alloc] initWithTitle:0];
  v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v4 = AXParameterizedLocalizedString(2LL, @"SWITCH_SOURCE_EXTERNAL_INSTRUCTIONAL_TEXT_TITLE");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v5,  0LL,  0LL,  0LL));

  -[NSMutableArray addObject:](v3, "addObject:", v6);
  [v2 setSettingItems:v3];

  return v2;
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___AXTVSwitchControlAddSwitchViewController;
  -[AXTVSwitchControlAddSwitchViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSwitchControlAddSwitchViewController switchRegistrar](self, "switchRegistrar"));
  [v4 beginFilteringEvents];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___AXTVSwitchControlAddSwitchViewController;
  -[AXTVSwitchControlAddSwitchViewController viewDidDisappear:](&v5, "viewDidDisappear:", a3);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSwitchControlAddSwitchViewController switchRegistrar](self, "switchRegistrar"));
  [v4 endFilteringEvents];
}

- (void)_showAlertForSwitchInUse
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSwitchControlAddSwitchViewController presentedViewController](self, "presentedViewController"));

  if (v3)
  {
    char v12 = 1;
    _AXLogWithFacility( 1LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  v12,  @"Alert already being presented. Not presenting another");
  }

  else
  {
    uint64_t v4 = AXParameterizedLocalizedString(2LL, @"SWITCH_SOURCE_DIALOG_SOURCE_IN_USE");
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    uint64_t v6 = AXParameterizedLocalizedString(2LL, @"SWITCH_SOURCE_DIALOG_TITLE");
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    uint64_t v8 = AXParameterizedLocalizedString(2LL, @"SWITCH_SOURCE_DIALOG_OK");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    objc_initWeak(&location, self);
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v7,  v5,  1LL));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_32F34;
    v15[3] = &unk_66990;
    objc_copyWeak(&v16, &location);
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v9,  1LL,  v15));
    [v10 addAction:v11];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_32F78;
    v13[3] = &unk_654A0;
    objc_copyWeak(&v14, &location);
    -[AXTVSwitchControlAddSwitchViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v10,  1LL,  v13);
    objc_destroyWeak(&v14);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

- (void)_showAlertForSwitchNameInUse
{
  uint64_t v3 = AXParameterizedLocalizedString(2LL, @"SWITCH_SAVE_DIALOG_NAME_IN_USE");
  id v9 = (id)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v4 = AXParameterizedLocalizedString(2LL, @"SWITCH_SOURCE_DIALOG_OK");
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v9,  0LL,  1LL));
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v5,  1LL,  0LL));
  [v6 addAction:v7];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[AXTVSwitchControlAddSwitchViewController switchNameEntryViewController]( self,  "switchNameEntryViewController"));
  [v8 presentViewController:v6 animated:1 completion:0];
}

- (void)_showAlertForSwitchNameInvalid
{
  uint64_t v3 = AXParameterizedLocalizedString(2LL, @"SWITCH_SAVE_DIALOG_NAME_IS_INVALID");
  id v9 = (id)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v4 = AXParameterizedLocalizedString(2LL, @"SWITCH_SOURCE_DIALOG_OK");
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v9,  0LL,  1LL));
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v5,  1LL,  0LL));
  [v6 addAction:v7];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[AXTVSwitchControlAddSwitchViewController switchNameEntryViewController]( self,  "switchNameEntryViewController"));
  [v8 presentViewController:v6 animated:1 completion:0];
}

- (void)_showTextInputForSave:(id)a3
{
  id v12 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSwitchControlAddSwitchViewController presentedViewController](self, "presentedViewController"));

  if (v4)
  {
    char v11 = 1;
    _AXLogWithFacility( 1LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  v11,  @"Switch save already being presented. Not presenting another");
  }

  else
  {
    objc_super v5 = objc_alloc_init(&OBJC_CLASS___TSKTextInputViewController);
    uint64_t v6 = AXParameterizedLocalizedString(2LL, @"SWITCH_SAVE_DIALOG_TITLE");
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[TSKTextInputViewController setHeaderText:](v5, "setHeaderText:", v7);

    uint64_t v8 = SCATNextAvailableSwitchName(-[TSKTextInputViewController setMessageText:](v5, "setMessageText:", v12));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[TSKTextInputViewController setInitialText:](v5, "setInitialText:", v9);

    -[TSKTextInputViewController setEditingDelegate:](v5, "setEditingDelegate:", self);
    -[AXTVSwitchControlAddSwitchViewController setSwitchNameEntryViewController:]( self,  "setSwitchNameEntryViewController:",  v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSwitchControlAddSwitchViewController navigationController](self, "navigationController"));
    [v10 pushViewController:v5 animated:1];
  }
}

- (BOOL)switchRegistrarShouldFilterEvents:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[AXTVSwitchControlAddSwitchViewController presentedViewController]( self,  "presentedViewController",  a3));
  BOOL v4 = v3 == 0LL;

  return v4;
}

- (BOOL)switchRegistrarShouldProcessKeyboardKeyEvent:(id)a3
{
  qword_805F0 = *(void *)&v4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSwitchControlAddSwitchViewController presentedViewController](self, "presentedViewController"));
  BOOL v5 = v6 == 0LL;

  return v5;
}

- (BOOL)switchRegistrarShouldProcessMFIButtonEvent:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[AXTVSwitchControlAddSwitchViewController presentedViewController]( self,  "presentedViewController",  a3));
  BOOL v4 = v3 == 0LL;

  return v4;
}

- (void)switchRegistrarKeyboardKeyAlreadyInUseForSwitch:(id)a3
{
}

- (void)switchRegistrarMFIButtonAlreadyInUseForSwitch:(id)a3
{
}

- (void)switchRegistrar:(id)a3 didUpdateSwitch:(id)a4
{
}

- (void)switchRegistrarMIDISourceAlreadyInUseForSwitch:(id)a3
{
}

- (BOOL)switchRegistrarShouldProcessMIDIEvent:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[AXTVSwitchControlAddSwitchViewController presentedViewController]( self,  "presentedViewController",  a3));
  BOOL v4 = v3 == 0LL;

  return v4;
}

- (BOOL)switchRegistrarShouldProcessGamepadEvent:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[AXTVSwitchControlAddSwitchViewController presentedViewController]( self,  "presentedViewController",  a3));
  BOOL v4 = v3 == 0LL;

  return v4;
}

- (void)switchRegistrarGamepadSourceAlreadyInUseForSwitch:(id)a3
{
}

- (void)editingController:(id)a3 didProvideValue:(id)a4 forSettingItem:(id)a5
{
  id v12 = a4;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v12, v6) & 1) != 0)
  {
    id v7 = v12;
    if ([v7 length])
    {
      if (SCATSwitchExistsWithName(v7))
      {
        -[AXTVSwitchControlAddSwitchViewController _showAlertForSwitchNameInUse](self, "_showAlertForSwitchNameInUse");
      }

      else
      {
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSwitchControlAddSwitchViewController switchRegistrar](self, "switchRegistrar"));
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 aSwitch]);

        [v9 setName:v7];
        if (!v9) {
          _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/ATVAccessibility/settings/AccessibilitySettings/source/AXTVSwitchContr olAddSwitchViewController.m",  243LL,  "-[AXTVSwitchControlAddSwitchViewController editingController:didProvideValue:forSettingItem:]",  @"Expecting switch to be non-nil from the switch Registrar");
        }
        v10 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVSwitchControlSwitchDetailsViewController controllerWithSwitch:variant:]( &OBJC_CLASS___AXTVSwitchControlSwitchDetailsViewController,  "controllerWithSwitch:variant:",  v9,  0LL));
        char v11 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSwitchControlAddSwitchViewController navigationController](self, "navigationController"));
        [v11 pushViewController:v10 animated:1];
      }
    }

    else
    {
      -[AXTVSwitchControlAddSwitchViewController _showAlertForSwitchNameInvalid](self, "_showAlertForSwitchNameInvalid");
    }
  }

  else
  {
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/ATVAccessibility/settings/AccessibilitySettings/source/AXTVSwitchControlAddS witchViewController.m",  222LL,  "-[AXTVSwitchControlAddSwitchViewController editingController:didProvideValue:forSettingItem:]",  @"Expected incoming value to be a string. %@");
    -[AXTVSwitchControlAddSwitchViewController _showAlertForSwitchNameInvalid]( self,  "_showAlertForSwitchNameInvalid",  v12);
  }
}

- (AXSwitchRegistrar)switchRegistrar
{
  return self->_switchRegistrar;
}

- (void)setSwitchRegistrar:(id)a3
{
}

- (UIAlertController)alertController
{
  return self->_alertController;
}

- (void)setAlertController:(id)a3
{
}

- (TSKTextInputViewController)switchNameEntryViewController
{
  return self->_switchNameEntryViewController;
}

- (void)setSwitchNameEntryViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end