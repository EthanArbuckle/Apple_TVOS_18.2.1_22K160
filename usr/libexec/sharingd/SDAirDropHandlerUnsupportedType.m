@interface SDAirDropHandlerUnsupportedType
- (BOOL)canHandleTransfer;
- (BOOL)shouldEndAfterOpen;
- (SDAirDropHandlerUnsupportedType)initWithTransfer:(id)a3;
- (id)suitableContentsDescription;
- (void)triggerAppStoreSearch;
- (void)updatePossibleActions;
@end

@implementation SDAirDropHandlerUnsupportedType

- (SDAirDropHandlerUnsupportedType)initWithTransfer:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___SDAirDropHandlerUnsupportedType;
  v5 = -[SDAirDropHandler initWithTransfer:](&v10, "initWithTransfer:", v4);
  if (v5)
  {
    v6 = -[SDAirDropHandleriCloudDrive initWithTransfer:]( objc_alloc(&OBJC_CLASS___SDAirDropHandleriCloudDrive),  "initWithTransfer:",  v4);
    icloudDriveHandler = v5->_icloudDriveHandler;
    v5->_icloudDriveHandler = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue( +[LSBundleProxy bundleProxyForIdentifier:]( &OBJC_CLASS___LSBundleProxy,  "bundleProxyForIdentifier:",  @"com.apple.AppStore"));
    -[SDAirDropHandler setBundleProxy:](v5, "setBundleProxy:", v8);
  }

  return v5;
}

- (BOOL)canHandleTransfer
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 metaData]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 items]);
  [v4 count];

  return 0;
}

- (id)suitableContentsDescription
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 metaData]);
  unsigned int v5 = [v4 isVerifiableIdentity];

  unsigned int v6 = -[SDAirDropHandler isJustFiles](self, "isJustFiles");
  v8 = @"LINK_DEVICE_SENDING_REQUIRES_APP_TEXT";
  if (v5) {
    v8 = @"LINK_PERSON_SENDING_REQUIRES_APP_TEXT";
  }
  v9 = @"FILE_PERSON_SENDING_REQUIRES_APP_TEXT";
  if (!v5) {
    v9 = @"FILE_DEVICE_SENDING_REQUIRES_APP_TEXT";
  }
  if (v6) {
    objc_super v10 = v9;
  }
  else {
    objc_super v10 = v8;
  }
  uint64_t v11 = SFLocalizedStringForKey(v10, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler senderName](self, "senderName"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v12, v13));

  return v14;
}

- (void)updatePossibleActions
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___SDAirDropHandlerUnsupportedType;
  -[SDAirDropHandler updatePossibleActions](&v18, "updatePossibleActions");
  v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler bundleProxy](self, "bundleProxy"));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler defaultActionForBundleProxy:](self, "defaultActionForBundleProxy:", v4));

  uint64_t v7 = SFLocalizedStringForKey(@"GET_APP_BUTTON_TITLE", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v5 setSingleItemLocalizedTitle:v8];

  [v5 setShouldUpdateUserResponse:0];
  [v5 setMinRequiredTransferState:1];
  id location = 0LL;
  objc_initWeak(&location, self);
  v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472LL;
  v14 = sub_10001641C;
  v15 = &unk_1005CB070;
  objc_copyWeak(&v16, &location);
  [v5 setActionHandler:&v12];
  -[NSMutableArray addObject:](v3, "addObject:", v5, v12, v13, v14, v15);
  if (-[SDAirDropHandleriCloudDrive canHandleTransfer](self->_icloudDriveHandler, "canHandleTransfer"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler completionHandler](self, "completionHandler"));
    -[SDAirDropHandler setCompletionHandler:](self->_icloudDriveHandler, "setCompletionHandler:", v9);

    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandleriCloudDrive action](self->_icloudDriveHandler, "action"));
    -[NSMutableArray addObject:](v3, "addObject:", v10);
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  [v11 setPossibleActions:v3];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)triggerAppStoreSearch
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 metaData]);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 items]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 anyObject]);

  else {
    uint64_t v7 = @"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/docTypeLookup?scheme=%@";
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 type]);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v7, v8));
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v9));

  uint64_t v12 = airdrop_log(v11);
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Launching app store with URL: %@", buf, 0xCu);
  }

  -[SDAirDropHandler logReceiverBundleID:forAppProxy:andURL:]( self,  "logReceiverBundleID:forAppProxy:andURL:",  0LL,  0LL,  v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  [v14 openURL:v10 configuration:0 completionHandler:0];
}

- (BOOL)shouldEndAfterOpen
{
  return 1;
}

- (void).cxx_destruct
{
}

@end