@interface SCATModernMenuControllableDevicesSheet
- (AXSSInterDeviceCommunicator)interDeviceCommunicator;
- (BOOL)isPushingConfirmationSheet;
- (BOOL)isVisible;
- (BOOL)shouldKeepScannerAwake;
- (NSArray)searchResults;
- (SCATModernMenuControllableDevicesConfirmationSheet)confirmationSheet;
- (SCATModernMenuControllableDevicesSheet)initWithMenu:(id)a3 interDeviceCommunicator:(id)a4;
- (id)makeMenuItemsIfNeeded;
- (void)dealloc;
- (void)didConfirmForSheet:(id)a3;
- (void)didExitMenuFromSheet:(id)a3;
- (void)didUpdateSearchResults;
- (void)menuItemWasActivated:(id)a3;
- (void)setConfirmationSheet:(id)a3;
- (void)setIsPushingConfirmationSheet:(BOOL)a3;
- (void)setIsVisible:(BOOL)a3;
- (void)setSearchResults:(id)a3;
- (void)sheetWillAppear:(BOOL)a3;
- (void)sheetWillDisappear:(BOOL)a3;
@end

@implementation SCATModernMenuControllableDevicesSheet

- (SCATModernMenuControllableDevicesSheet)initWithMenu:(id)a3 interDeviceCommunicator:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SCATModernMenuControllableDevicesSheet;
  v8 = -[SCATModernMenuSheet initWithMenu:](&v11, "initWithMenu:", a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_interDeviceCommunicator, a4);
    -[AXSSInterDeviceCommunicator setSearchObserver:](v9->_interDeviceCommunicator, "setSearchObserver:", v9);
  }

  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SCATModernMenuControllableDevicesSheet;
  -[SCATModernMenuSheet dealloc](&v3, "dealloc");
}

- (id)makeMenuItemsIfNeeded
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if (-[SCATModernMenuControllableDevicesSheet isVisible](self, "isVisible"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuControllableDevicesSheet searchResults](self, "searchResults"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10002F940;
    v9[3] = &unk_100122BC0;
    v9[4] = self;
    id v10 = v3;
    [v4 enumerateObjectsUsingBlock:v9];
  }

  id v5 = sub_10002B014(@"SEARCHING");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuItem itemWithIdentifier:delegate:title:imageName:activateBehavior:]( &OBJC_CLASS___SCATModernMenuItem,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:",  @"loadingDevices",  self,  v6,  0LL,  3LL));

  [v7 setShouldUseActivityIndicator:1];
  [v7 setDisabled:1];
  [v3 addObject:v7];

  return v3;
}

- (void)menuItemWasActivated:(id)a3
{
  id v4 = a3;
  objc_opt_class(&OBJC_CLASS___SCATControllableDevicesMenuItem, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    -[SCATModernMenuControllableDevicesSheet setIsPushingConfirmationSheet:]( self,  "setIsPushingConfirmationSheet:",  1LL);
    id v7 = v4;
    v8 = objc_alloc(&OBJC_CLASS___SCATModernMenuControllableDevicesConfirmationSheet);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet menu](self, "menu"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 searchResult]);
    objc_super v11 = -[SCATModernMenuControllableDevicesConfirmationSheet initWithMenu:interDeviceSearchResult:]( v8,  "initWithMenu:interDeviceSearchResult:",  v9,  v10);

    -[SCATModernMenuControllableDevicesSheet setConfirmationSheet:](self, "setConfirmationSheet:", v11);
    -[SCATModernMenuControllableDevicesConfirmationSheet setDelegate:](v11, "setDelegate:", self);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet menu](self, "menu"));
    [v12 pushSheet:v11];

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuControllableDevicesSheet interDeviceCommunicator](self, "interDeviceCommunicator"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v7 searchResult]);

    [v13 highlightSearchResult:v14];
  }

  else
  {
    v15.receiver = self;
    v15.super_class = (Class)&OBJC_CLASS___SCATModernMenuControllableDevicesSheet;
    -[SCATModernMenuSheet menuItemWasActivated:](&v15, "menuItemWasActivated:", v4);
  }
}

- (void)sheetWillAppear:(BOOL)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuControllableDevicesSheet interDeviceCommunicator](self, "interDeviceCommunicator"));
  unsigned int v5 = [v4 canSearch];

  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuControllableDevicesSheet interDeviceCommunicator](self, "interDeviceCommunicator"));
    [v6 search];
  }

  -[SCATModernMenuControllableDevicesSheet didUpdateSearchResults](self, "didUpdateSearchResults");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuControllableDevicesSheet confirmationSheet](self, "confirmationSheet"));
  [v7 setDelegate:0];

  -[SCATModernMenuControllableDevicesSheet setConfirmationSheet:](self, "setConfirmationSheet:", 0LL);
}

- (void)sheetWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SCATModernMenuControllableDevicesSheet;
  -[SCATModernMenuSheet sheetWillDisappear:](&v6, "sheetWillDisappear:", a3);
  -[SCATModernMenuControllableDevicesSheet setIsVisible:](self, "setIsVisible:", 0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuControllableDevicesSheet interDeviceCommunicator](self, "interDeviceCommunicator"));
  unsigned __int8 v5 = -[SCATModernMenuControllableDevicesSheet isPushingConfirmationSheet](self, "isPushingConfirmationSheet");

  if ((v5 & 1) == 0)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuControllableDevicesSheet interDeviceCommunicator](self, "interDeviceCommunicator"));
    [v4 stop];
LABEL_4:
  }

  -[SCATModernMenuControllableDevicesSheet setIsPushingConfirmationSheet:](self, "setIsPushingConfirmationSheet:", 0LL);
}

- (BOOL)shouldKeepScannerAwake
{
  return 1;
}

- (void)didUpdateSearchResults
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuControllableDevicesSheet interDeviceCommunicator](self, "interDeviceCommunicator"));
  id v16 = (id)objc_claimAutoreleasedReturnValue([v3 searchResults]);

  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[SCATModernMenuControllableDevicesSheet searchResults](self, "searchResults"));
  if (!v4
    || (unsigned __int8 v5 = (void *)v4,
        objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuControllableDevicesSheet searchResults](self, "searchResults")),
        unsigned __int8 v7 = [v16 isEqualToArray:v6],
        v6,
        v5,
        (v7 & 1) == 0))
  {
    -[SCATModernMenuControllableDevicesSheet setSearchResults:](self, "setSearchResults:", v16);
    -[SCATModernMenuSheet reload](self, "reload");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuControllableDevicesSheet confirmationSheet](self, "confirmationSheet"));

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuControllableDevicesSheet searchResults](self, "searchResults"));
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuControllableDevicesSheet confirmationSheet](self, "confirmationSheet"));
      objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v10 searchResult]);
      unsigned __int8 v12 = [v9 containsObject:v11];

      if ((v12 & 1) != 0)
      {
LABEL_8:
        objc_super v15 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
        [v15 beginScanningWithFocusContext:0];

        goto LABEL_9;
      }

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuControllableDevicesSheet confirmationSheet](self, "confirmationSheet"));
      [v13 setDelegate:0];

      -[SCATModernMenuControllableDevicesSheet setConfirmationSheet:](self, "setConfirmationSheet:", 0LL);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet menu](self, "menu"));
      [v14 popSheet];
    }

    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet menu](self, "menu"));
      [v14 reloadFromCurrentSheet];
    }

    goto LABEL_8;
  }

- (void)didConfirmForSheet:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuControllableDevicesSheet interDeviceCommunicator](self, "interDeviceCommunicator"));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v4 searchResult]);

  id v7 = sub_10002C0E0();
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v5 selectSearchResult:v6 settings:v8];

  id v9 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  objc_msgSend( v9,  "setSwitchControlPlatformSwitchedCount:",  (char *)objc_msgSend(v9, "switchControlPlatformSwitchedCount") + 1);
}

- (void)didExitMenuFromSheet:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuControllableDevicesSheet interDeviceCommunicator](self, "interDeviceCommunicator", a3));
  unsigned __int8 v5 = [v4 isForwardingSwitchEvents];

  if ((v5 & 1) == 0)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[SCATModernMenuControllableDevicesSheet interDeviceCommunicator](self, "interDeviceCommunicator"));
    [v6 stop];
  }

- (NSArray)searchResults
{
  return self->_searchResults;
}

- (void)setSearchResults:(id)a3
{
}

- (AXSSInterDeviceCommunicator)interDeviceCommunicator
{
  return self->_interDeviceCommunicator;
}

- (BOOL)isVisible
{
  return self->_isVisible;
}

- (void)setIsVisible:(BOOL)a3
{
  self->_isVisible = a3;
}

- (SCATModernMenuControllableDevicesConfirmationSheet)confirmationSheet
{
  return self->_confirmationSheet;
}

- (void)setConfirmationSheet:(id)a3
{
}

- (BOOL)isPushingConfirmationSheet
{
  return self->_isPushingConfirmationSheet;
}

- (void)setIsPushingConfirmationSheet:(BOOL)a3
{
  self->_isPushingConfirmationSheet = a3;
}

- (void).cxx_destruct
{
}

@end