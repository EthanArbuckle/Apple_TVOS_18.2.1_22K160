@interface SDAirDropHandlerWalletItems
- (BOOL)canHandleTransfer;
- (BOOL)shouldEndAfterOpen;
- (SDAirDropHandlerWalletItems)initWithTransfer:(id)a3;
- (id)suitableContentsDescription;
- (int64_t)transferTypes;
- (void)performImportWithCompletedURLs:(id)a3 completion:(id)a4;
- (void)updatePossibleActions;
@end

@implementation SDAirDropHandlerWalletItems

- (SDAirDropHandlerWalletItems)initWithTransfer:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SDAirDropHandlerWalletItems;
  v3 = -[SDAirDropHandler initWithTransfer:bundleIdentifier:]( &v6,  "initWithTransfer:bundleIdentifier:",  a3,  @"com.apple.Passbook");
  v4 = v3;
  if (v3) {
    -[SDAirDropHandler setBundleProxy:](v3, "setBundleProxy:", 0LL);
  }
  return v4;
}

- (BOOL)canHandleTransfer
{
  if (!-[SDAirDropHandler isJustFiles](self, "isJustFiles")) {
    return 0;
  }
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer", 0LL));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 metaData]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 rawFiles]);

  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v19;
    uint64_t v9 = kSFOperationFileTypeKey;
    uint64_t v10 = kSFOperationFileNameKey;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        v12 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v9]);
        v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v10]);
        v15 = (void *)objc_claimAutoreleasedReturnValue([v14 pathExtension]);

        LODWORD(v14) = SFIsPass(v13, v15);
        if (!(_DWORD)v14)
        {
          BOOL v16 = 0;
          goto LABEL_13;
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  BOOL v16 = 1;
LABEL_13:

  return v16;
}

- (int64_t)transferTypes
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SDAirDropHandlerWalletItems;
  return (unint64_t)-[SDAirDropHandler transferTypes](&v3, "transferTypes") | 0x2000;
}

- (id)suitableContentsDescription
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler senderName](self, "senderName"));
  unint64_t v4 = -[SDAirDropHandler totalSharedItemsCount](self, "totalSharedItemsCount");
  BOOL v16 = @"PASS";
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v4));
  v17 = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
  __int128 v18 = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[SDAirDropHandler alertMessageLocalizedKeyForTypeDicts:]( self,  "alertMessageLocalizedKeyForTypeDicts:",  v7));

  LODWORD(v6) = -[SDAirDropHandler isModernProgress](self, "isModernProgress");
  uint64_t v10 = SFLocalizedStringForKey(v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  if ((_DWORD)v6) {
    v12 = +[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v11, v4, v15);
  }
  else {
    v12 = +[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v11, v3, v4);
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  return v13;
}

- (void)updatePossibleActions
{
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___SDAirDropHandlerWalletItems;
  -[SDAirDropHandler updatePossibleActions](&v22, "updatePossibleActions");
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler bundleProxy](self, "bundleProxy"));

  if (v3)
  {
    unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler bundleProxy](self, "bundleProxy"));
    v5 = (SFAirDropAction *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler defaultActionForBundleProxy:](self, "defaultActionForBundleProxy:", v4));
  }

  else
  {
    id v6 = objc_alloc(&OBJC_CLASS___SFAirDropAction);
    unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    uint64_t v9 = (objc_class *)objc_opt_class(self, v8);
    uint64_t v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler singleItemActionTitle](self, "singleItemActionTitle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler singleItemActionTitle](self, "singleItemActionTitle"));
    v5 = -[SFAirDropAction initWithTransferIdentifier:actionIdentifier:title:singleItemTitle:type:]( v6,  "initWithTransferIdentifier:actionIdentifier:title:singleItemTitle:type:",  v7,  v11,  v12,  v13,  1LL);
  }

  id location = 0LL;
  objc_initWeak(&location, self);
  BOOL v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472LL;
  __int128 v18 = sub_100094CF4;
  __int128 v19 = &unk_1005CB070;
  objc_copyWeak(&v20, &location);
  -[SFAirDropAction setActionHandler:](v5, "setActionHandler:", &v16);
  v23 = v5;
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v23,  1LL,  v16,  v17,  v18,  v19));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  [v15 setPossibleActions:v14];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

- (void)performImportWithCompletedURLs:(id)a3 completion:(id)a4
{
  v5 = (void (**)(id, SDAirDropHandlerImportResult *, void))a4;
  id v6 = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___SDAirDropHandlerImportResult);
  -[SDAirDropHandlerImportResult setImportedFiles:](v7, "setImportedFiles:", v6);

  v5[2](v5, v7, 0LL);
}

- (BOOL)shouldEndAfterOpen
{
  return 0;
}

@end