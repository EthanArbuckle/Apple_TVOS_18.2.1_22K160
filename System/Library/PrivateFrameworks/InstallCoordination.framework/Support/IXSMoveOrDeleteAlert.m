@interface IXSMoveOrDeleteAlert
- (IXSMoveOrDeleteAlert)initWithAppRecord:(id)a3 bundleIdentifier:(id)a4 removability:(unint64_t)a5 deletionIsRestricted:(BOOL)a6;
- (id)cancelButtonLabel;
- (id)defaultButtonLabel;
- (id)message;
- (id)otherButtonLabel;
- (id)title;
- (void)otherButtonActionWithCompletion:(id)a3;
@end

@implementation IXSMoveOrDeleteAlert

- (IXSMoveOrDeleteAlert)initWithAppRecord:(id)a3 bundleIdentifier:(id)a4 removability:(unint64_t)a5 deletionIsRestricted:(BOOL)a6
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___IXSMoveOrDeleteAlert;
  v6 = -[IXSUninstallAlert initWithAppRecord:bundleIdentifier:removability:deletionIsRestricted:]( &v9,  "initWithAppRecord:bundleIdentifier:removability:deletionIsRestricted:",  a3,  a4,  a5,  a6);
  v7 = v6;
  if (v6)
  {
    -[IXSUninstallAlert setTypeDescription:](v6, "setTypeDescription:", @"Move or Delete");
    -[IXSUninstallAlert setNeedsArchiveOptionButton:](v7, "setNeedsArchiveOptionButton:", 1LL);
  }

  return v7;
}

- (id)title
{
  if (-[IXSUninstallAlert appIsRemovable](self, "appIsRemovable")) {
    v3 = @"UNINSTALL_ICON_TITLE_MOVE_TO_APP_LIBRARY_OR_DELETE";
  }
  else {
    v3 = @"UNINSTALL_ICON_TITLE_MOVE_TO_APP_LIBRARY";
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[IXSUninstallAlert localizedStringForKey:withFormatHint:]( self,  "localizedStringForKey:withFormatHint:",  v3,  @"Remove “%@”?"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXSUninstallAlert appRecord](self, "appRecord"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedName]);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v4, v6));

  return v7;
}

- (id)message
{
  return -[IXSUninstallAlert localizedStringForKey:withFormatHint:]( self,  "localizedStringForKey:withFormatHint:",  @"UNINSTALL_ICON_BODY_MOVE_TO_APP_LIBRARY",  @"Removing from Home Screen will keep the app in your App Library.");
}

- (id)defaultButtonLabel
{
  return -[IXSUninstallAlert localizedStringForKey:withFormatHint:]( self,  "localizedStringForKey:withFormatHint:",  @"UNINSTALL_ICON_BUTTON_DELETE_APP",  @"Delete App");
}

- (id)cancelButtonLabel
{
  return -[IXSUninstallAlert localizedStringForKey:withFormatHint:]( self,  "localizedStringForKey:withFormatHint:",  @"UNINSTALL_ICON_BUTTON_CANCEL",  @"Cancel");
}

- (id)otherButtonLabel
{
  return -[IXSUninstallAlert localizedStringForKey:withFormatHint:]( self,  "localizedStringForKey:withFormatHint:",  @"UNINSTALL_ICON_BUTTON_MOVE",  @"Remove from Home Screen");
}

- (void)otherButtonActionWithCompletion:(id)a3
{
}

@end