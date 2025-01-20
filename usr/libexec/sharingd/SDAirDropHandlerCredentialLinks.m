@interface SDAirDropHandlerCredentialLinks
- (BOOL)canHandleTransfer;
- (BOOL)shouldEndAfterOpen;
- (id)suitableContentsDescription;
- (int64_t)transferTypes;
- (void)handleAction;
- (void)updatePossibleActions;
@end

@implementation SDAirDropHandlerCredentialLinks

- (BOOL)canHandleTransfer
{
  return 0;
}

- (void)handleAction
{
  uint64_t v3 = airdrop_log(self);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_1000AE1EC(v4);
  }

  credential = self->_credential;
  self->_credential = 0LL;

  v6 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue( -[SDAirDropHandler completionHandler]( self,  "completionHandler"));
  v6[2](v6, 0LL, 0LL, 1LL);
}

- (id)suitableContentsDescription
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler senderName](self, "senderName"));
  unint64_t v4 = -[SDAirDropHandler totalSharedItemsCount](self, "totalSharedItemsCount");
  v14 = @"CREDENTIAL";
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v4));
  v15 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));
  v16 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
  v8 = (void *)objc_claimAutoreleasedReturnValue( -[SDAirDropHandler alertMessageLocalizedKeyForTypeDicts:]( self,  "alertMessageLocalizedKeyForTypeDicts:",  v7));

  uint64_t v10 = SFLocalizedStringForKey(v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  v11,  v3,  v4));

  return v12;
}

- (int64_t)transferTypes
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SDAirDropHandlerCredentialLinks;
  return (unint64_t)-[SDAirDropHandler transferTypes](&v3, "transferTypes") | 0x40000;
}

- (void)updatePossibleActions
{
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___SDAirDropHandlerCredentialLinks;
  -[SDAirDropHandler updatePossibleActions](&v21, "updatePossibleActions");
  objc_super v3 = objc_alloc(&OBJC_CLASS___SFAirDropAction);
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  v7 = (objc_class *)objc_opt_class(self, v6);
  v8 = NSStringFromClass(v7);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler singleItemActionTitle](self, "singleItemActionTitle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler singleItemActionTitle](self, "singleItemActionTitle"));
  v12 = -[SFAirDropAction initWithTransferIdentifier:actionIdentifier:title:singleItemTitle:type:]( v3,  "initWithTransferIdentifier:actionIdentifier:title:singleItemTitle:type:",  v5,  v9,  v10,  v11,  1LL);

  id location = 0LL;
  objc_initWeak(&location, self);
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  v17 = sub_1000AE1A4;
  v18 = &unk_1005CB070;
  objc_copyWeak(&v19, &location);
  -[SFAirDropAction setActionHandler:](v12, "setActionHandler:", &v15);
  v22 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v22,  1LL,  v15,  v16,  v17,  v18));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  [v14 setPossibleActions:v13];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (BOOL)shouldEndAfterOpen
{
  return 1;
}

- (void).cxx_destruct
{
}

@end