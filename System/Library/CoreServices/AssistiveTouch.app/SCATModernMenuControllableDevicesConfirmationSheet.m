@interface SCATModernMenuControllableDevicesConfirmationSheet
- (AXSSInterDeviceSearchResult)searchResult;
- (BOOL)isPoppingToPreviousViewController;
- (BOOL)shouldKeepScannerAwake;
- (SCATModernMenuControllableDevicesConfirmationSheet)initWithMenu:(id)a3 interDeviceSearchResult:(id)a4;
- (SCATModernMenuControllableDevicesConfirmationSheetDelegate)delegate;
- (id)makeMenuItemsIfNeeded;
- (void)menuItemWasActivated:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsPoppingToPreviousViewController:(BOOL)a3;
- (void)sheetWillDisappear:(BOOL)a3;
@end

@implementation SCATModernMenuControllableDevicesConfirmationSheet

- (SCATModernMenuControllableDevicesConfirmationSheet)initWithMenu:(id)a3 interDeviceSearchResult:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SCATModernMenuControllableDevicesConfirmationSheet;
  v8 = -[SCATModernMenuSheet initWithMenu:](&v11, "initWithMenu:", a3);
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_searchResult, a4);
  }

  return v9;
}

- (id)makeMenuItemsIfNeeded
{
  id v3 = sub_10002B014(@"CONFIRM_CONTROL_DEVICE");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuItem itemWithIdentifier:delegate:title:imageName:activateBehavior:]( &OBJC_CLASS___SCATModernMenuItem,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:",  @"controllableDevices_confirm",  self,  v4,  @"SCATIcon_interdevice_confirm",  1LL));
  v8 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));

  return v6;
}

- (void)menuItemWasActivated:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  unsigned int v6 = [v5 isEqualToString:@"controllableDevices_confirm"];

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuControllableDevicesConfirmationSheet delegate](self, "delegate"));
    [v7 didConfirmForSheet:self];
  }

  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    unsigned int v9 = -[SCATModernMenuSheet isBackItemIdentifier:](self, "isBackItemIdentifier:", v8);

    if (v9) {
      -[SCATModernMenuControllableDevicesConfirmationSheet setIsPoppingToPreviousViewController:]( self,  "setIsPoppingToPreviousViewController:",  1LL);
    }
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___SCATModernMenuControllableDevicesConfirmationSheet;
    -[SCATModernMenuSheet menuItemWasActivated:](&v10, "menuItemWasActivated:", v4);
  }
}

- (BOOL)shouldKeepScannerAwake
{
  return 1;
}

- (void)sheetWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SCATModernMenuControllableDevicesConfirmationSheet;
  -[SCATModernMenuSheet sheetWillDisappear:](&v5, "sheetWillDisappear:", a3);
  if (!-[SCATModernMenuControllableDevicesConfirmationSheet isPoppingToPreviousViewController]( self,  "isPoppingToPreviousViewController"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuControllableDevicesConfirmationSheet delegate](self, "delegate"));
    [v4 didExitMenuFromSheet:self];
  }

  -[SCATModernMenuControllableDevicesConfirmationSheet setIsPoppingToPreviousViewController:]( self,  "setIsPoppingToPreviousViewController:",  0LL);
}

- (SCATModernMenuControllableDevicesConfirmationSheetDelegate)delegate
{
  return (SCATModernMenuControllableDevicesConfirmationSheetDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (AXSSInterDeviceSearchResult)searchResult
{
  return self->_searchResult;
}

- (BOOL)isPoppingToPreviousViewController
{
  return self->_isPoppingToPreviousViewController;
}

- (void)setIsPoppingToPreviousViewController:(BOOL)a3
{
  self->_isPoppingToPreviousViewController = a3;
}

- (void).cxx_destruct
{
}

@end