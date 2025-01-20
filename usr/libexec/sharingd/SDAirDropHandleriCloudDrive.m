@interface SDAirDropHandleriCloudDrive
- (BOOL)canHandleTransfer;
- (BOOL)iCloudDriveIsAccessible;
- (BOOL)shouldEndAfterOpen;
- (BOOL)useOpenWithText;
- (NSURL)iCloudDriveURL;
- (SDAirDropHandleriCloudDrive)initWithTransfer:(id)a3;
- (SFAirDropAction)action;
- (id)cancelActionTitleToAccompanyActions:(id)a3;
- (id)suitableContentsDescription;
- (int64_t)transferTypes;
- (void)setUseOpenWithText:(BOOL)a3;
- (void)updatePossibleActions;
@end

@implementation SDAirDropHandleriCloudDrive

- (SDAirDropHandleriCloudDrive)initWithTransfer:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SDAirDropHandleriCloudDrive;
  return -[SDAirDropHandler initWithTransfer:](&v4, "initWithTransfer:", a3);
}

- (BOOL)canHandleTransfer
{
  return 0;
}

- (int64_t)transferTypes
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SDAirDropHandleriCloudDrive;
  return (unint64_t)-[SDAirDropHandler transferTypes](&v3, "transferTypes") | 0x1000000;
}

- (id)suitableContentsDescription
{
  return (id)SFLocalizedStringForKey(@"TRANSFER_FROM_IMPORT_FAILED_TEXT", a2);
}

- (id)cancelActionTitleToAccompanyActions:(id)a3
{
  return (id)SFLocalizedStringForKey(@"CANCEL_BUTTON_TITLE", a2);
}

- (void)updatePossibleActions
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SDAirDropHandleriCloudDrive;
  -[SDAirDropHandler updatePossibleActions](&v6, "updatePossibleActions");
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandleriCloudDrive action](self, "action"));
  v7 = v3;
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 1LL));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  [v5 setPossibleActions:v4];
}

- (SFAirDropAction)action
{
  action = self->_action;
  if (!action)
  {
    int v4 = SFFilesAppAvailable(0LL, a2);
    char v6 = v4;
    if (v4)
    {
      if (self->_useOpenWithText) {
        v7 = @"OPEN_WITH_FILES_APP_BUTTON_TITLE";
      }
      else {
        v7 = @"FILES_APP_BUTTON_TITLE";
      }
    }

    else
    {
      v7 = @"SAVE_TO_ICLOUD_DRIVE_BUTTON_TITLE";
    }

    uint64_t v8 = SFLocalizedStringForKey(v7, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = objc_alloc(&OBJC_CLASS___SFAirDropAction);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
    v14 = (objc_class *)objc_opt_class(self, v13);
    v15 = NSStringFromClass(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler singleItemActionTitle](self, "singleItemActionTitle"));
    v18 = -[SFAirDropAction initWithTransferIdentifier:actionIdentifier:title:singleItemTitle:type:]( v10,  "initWithTransferIdentifier:actionIdentifier:title:singleItemTitle:type:",  v12,  v16,  v9,  v17,  1LL);
    v19 = self->_action;
    self->_action = v18;

    id location = 0LL;
    objc_initWeak(&location, self);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_10005708C;
    v21[3] = &unk_1005CC1F8;
    char v23 = v6;
    objc_copyWeak(&v22, &location);
    -[SFAirDropAction setActionHandler:](self->_action, "setActionHandler:", v21);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);

    action = self->_action;
  }

  return action;
}

- (BOOL)iCloudDriveIsAccessible
{
  iCloudDriveURL = self->_iCloudDriveURL;
  uint64_t v4 = 0LL;
  return -[NSURL checkResourceIsReachableAndReturnError:]( iCloudDriveURL,  "checkResourceIsReachableAndReturnError:",  &v4);
}

- (NSURL)iCloudDriveURL
{
  return self->_iCloudDriveURL;
}

- (BOOL)shouldEndAfterOpen
{
  return 0;
}

- (BOOL)useOpenWithText
{
  return self->_useOpenWithText;
}

- (void)setUseOpenWithText:(BOOL)a3
{
  self->_useOpenWithText = a3;
}

- (void).cxx_destruct
{
}

@end