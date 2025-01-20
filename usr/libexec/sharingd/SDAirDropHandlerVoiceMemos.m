@interface SDAirDropHandlerVoiceMemos
- (BOOL)canHandleTransfer;
- (BOOL)canHandleTransferRegardlessOfBundleID;
- (BOOL)shouldEndAfterOpen;
- (NSArray)openAppURLs;
- (SDAirDropHandlerVoiceMemos)initWithTransfer:(id)a3;
- (id)suitableContentsDescription;
- (int64_t)transferTypes;
- (void)performImportWithCompletedURLs:(id)a3 completion:(id)a4;
- (void)performViewActionWithImportedURLs:(id)a3 completion:(id)a4;
- (void)setOpenAppURLs:(id)a3;
- (void)updatePossibleActions;
@end

@implementation SDAirDropHandlerVoiceMemos

- (SDAirDropHandlerVoiceMemos)initWithTransfer:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SDAirDropHandlerVoiceMemos;
  v3 = -[SDAirDropHandler initWithTransfer:bundleIdentifier:]( &v6,  "initWithTransfer:bundleIdentifier:",  a3,  @"com.apple.VoiceMemos");
  v4 = v3;
  if (v3) {
    -[SDAirDropHandler setBundleProxy:](v3, "setBundleProxy:", 0LL);
  }
  return v4;
}

- (BOOL)canHandleTransferRegardlessOfBundleID
{
  unsigned int v3 = -[SDAirDropHandler isJustFiles](self, "isJustFiles");
  int v4 = SFVoiceMemosAppAvailable();
  BOOL v5 = 0;
  if (v3 && v4)
  {
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer", 0LL));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 metaData]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 items]);

    id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v17;
      while (2)
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v16 + 1) + 8 * (void)i) type]);
          int v14 = SFIsVoiceMemo();

          if (!v14)
          {
            BOOL v5 = 0;
            goto LABEL_13;
          }
        }

        id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    BOOL v5 = 1;
LABEL_13:
  }

  return v5;
}

- (BOOL)canHandleTransfer
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 metaData]);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 senderBundleID]);
  [v5 isEqual:@"com.apple.VoiceMemos"];

  -[SDAirDropHandlerVoiceMemos canHandleTransferRegardlessOfBundleID](self, "canHandleTransferRegardlessOfBundleID");
  return 0;
}

- (int64_t)transferTypes
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SDAirDropHandlerVoiceMemos;
  return (unint64_t)-[SDAirDropHandler transferTypes](&v3, "transferTypes") | 0x1000;
}

- (id)suitableContentsDescription
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler senderName](self, "senderName"));
  unint64_t v4 = -[SDAirDropHandler totalSharedItemsCount](self, "totalSharedItemsCount");
  __int128 v16 = @"VOICE_MEMO";
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v4));
  __int128 v17 = v5;
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
  __int128 v18 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));
  v8 = (void *)objc_claimAutoreleasedReturnValue( -[SDAirDropHandler alertMessageLocalizedKeyForTypeDicts:]( self,  "alertMessageLocalizedKeyForTypeDicts:",  v7));

  LODWORD(v6) = -[SDAirDropHandler isModernProgress](self, "isModernProgress");
  uint64_t v10 = SFLocalizedStringForKey(v8, v9);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
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
  v22.super_class = (Class)&OBJC_CLASS___SDAirDropHandlerVoiceMemos;
  -[SDAirDropHandler updatePossibleActions](&v22, "updatePossibleActions");
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler bundleProxy](self, "bundleProxy"));

  if (v3)
  {
    unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler bundleProxy](self, "bundleProxy"));
    BOOL v5 = (SFAirDropAction *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler defaultActionForBundleProxy:](self, "defaultActionForBundleProxy:", v4));
  }

  else
  {
    objc_super v6 = objc_alloc(&OBJC_CLASS___SFAirDropAction);
    unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    uint64_t v9 = (objc_class *)objc_opt_class(self, v8);
    uint64_t v10 = NSStringFromClass(v9);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler singleItemActionTitle](self, "singleItemActionTitle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler singleItemActionTitle](self, "singleItemActionTitle"));
    BOOL v5 = -[SFAirDropAction initWithTransferIdentifier:actionIdentifier:title:singleItemTitle:type:]( v6,  "initWithTransferIdentifier:actionIdentifier:title:singleItemTitle:type:",  v7,  v11,  v12,  v13,  1LL);
  }

  id location = 0LL;
  objc_initWeak(&location, self);
  __int128 v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472LL;
  __int128 v18 = sub_1000937BC;
  __int128 v19 = &unk_1005CB070;
  objc_copyWeak(&v20, &location);
  -[SFAirDropAction setActionHandler:](v5, "setActionHandler:", &v16);
  v23 = v5;
  int v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v23,  1LL,  v16,  v17,  v18,  v19));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  [v15 setPossibleActions:v14];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

- (void)performImportWithCompletedURLs:(id)a3 completion:(id)a4
{
  BOOL v5 = (void (**)(id, SDAirDropHandlerImportResult *, void))a4;
  id v6 = a3;
  v7 = objc_alloc_init(&OBJC_CLASS___SDAirDropHandlerImportResult);
  -[SDAirDropHandlerImportResult setImportedFiles:](v7, "setImportedFiles:", v6);

  v5[2](v5, v7, 0LL);
}

- (void)performViewActionWithImportedURLs:(id)a3 completion:(id)a4
{
  uint64_t v9 = (void (**)(id, BOOL, void))a4;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandlerVoiceMemos openAppURLs](self, "openAppURLs"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler bundleProxy](self, "bundleProxy"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);
  BOOL v8 = -[SDAirDropHandler openURLs:bundleIdentifier:](self, "openURLs:bundleIdentifier:", v5, v7);

  v9[2](v9, v8, 0LL);
}

- (BOOL)shouldEndAfterOpen
{
  return 1;
}

- (NSArray)openAppURLs
{
  return self->_openAppURLs;
}

- (void)setOpenAppURLs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end