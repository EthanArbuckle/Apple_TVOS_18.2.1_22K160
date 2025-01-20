@interface SDAirDropHandlerMixedTypes
- (BOOL)canHandleTransfer;
- (SDAirDropHandlerMixedTypes)initWithTransfer:(id)a3;
- (id)suitableContentsDescription;
- (int64_t)transferTypes;
- (void)openLinks;
- (void)updatePossibleActions;
@end

@implementation SDAirDropHandlerMixedTypes

- (SDAirDropHandlerMixedTypes)initWithTransfer:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SDAirDropHandlerMixedTypes;
  return -[SDAirDropHandler initWithTransfer:](&v4, "initWithTransfer:", a3);
}

- (BOOL)canHandleTransfer
{
  return 0;
}

- (int64_t)transferTypes
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SDAirDropHandlerMixedTypes;
  return (unint64_t)-[SDAirDropHandler transferTypes](&v3, "transferTypes") | 0x5000000;
}

- (id)suitableContentsDescription
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler senderName](self, "senderName"));
  unint64_t v4 = -[SDAirDropHandler totalSharedItemsCount](self, "totalSharedItemsCount");
  v14 = @"GENERIC_ITEM";
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v4));
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

- (void)updatePossibleActions
{
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___SDAirDropHandlerMixedTypes;
  -[SDAirDropHandler updatePossibleActions](&v22, "updatePossibleActions");
  objc_super v3 = (objc_class *)objc_opt_class(self);
  unint64_t v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_alloc(&OBJC_CLASS___SFAirDropAction);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
  uint64_t v10 = SFLocalizedStringForKey(@"ACCEPT_BUTTON_TITLE", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler singleItemActionTitle](self, "singleItemActionTitle"));
  v13 = -[SFAirDropAction initWithTransferIdentifier:actionIdentifier:title:singleItemTitle:type:]( v6,  "initWithTransferIdentifier:actionIdentifier:title:singleItemTitle:type:",  v8,  v5,  v11,  v12,  1LL);

  id location = 0LL;
  objc_initWeak(&location, self);
  v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472LL;
  v18 = sub_10014BDD0;
  v19 = &unk_1005CB070;
  objc_copyWeak(&v20, &location);
  -[SFAirDropAction setActionHandler:](v13, "setActionHandler:", &v16);
  v23 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v23,  1LL,  v16,  v17,  v18,  v19));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  [v15 setPossibleActions:v14];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

- (void)openLinks
{
  objc_super v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer", 0LL));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 completedURLs]);

  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
      }

      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v7);
  }

  -[SDAirDropHandler openURLs:](self, "openURLs:", v3);
}

@end