@interface SDAirDropHandlerCalendarEvents
- (BOOL)canHandleTransfer;
- (BOOL)shouldEndAfterOpen;
- (SDAirDropHandlerCalendarEvents)initWithTransfer:(id)a3;
- (id)suitableContentsDescription;
- (int64_t)transferTypes;
- (void)performImportWithCompletedURLs:(id)a3 completion:(id)a4;
- (void)performViewActionWithImportedURLs:(id)a3 completion:(id)a4;
- (void)updatePossibleActions;
@end

@implementation SDAirDropHandlerCalendarEvents

- (SDAirDropHandlerCalendarEvents)initWithTransfer:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SDAirDropHandlerCalendarEvents;
  return -[SDAirDropHandler initWithTransfer:bundleIdentifier:]( &v4,  "initWithTransfer:bundleIdentifier:",  a3,  @"com.apple.mobilecal");
}

- (BOOL)canHandleTransfer
{
  return 0;
}

- (int64_t)transferTypes
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SDAirDropHandlerCalendarEvents;
  return (unint64_t)-[SDAirDropHandler transferTypes](&v3, "transferTypes") | 0x40;
}

- (id)suitableContentsDescription
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler senderName](self, "senderName"));
  unint64_t v4 = -[SDAirDropHandler totalSharedItemsCount](self, "totalSharedItemsCount");
  v16 = @"CALENDAR";
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v4));
  v17 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
  v18 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));
  v8 = (void *)objc_claimAutoreleasedReturnValue( -[SDAirDropHandler alertMessageLocalizedKeyForTypeDicts:]( self,  "alertMessageLocalizedKeyForTypeDicts:",  v7));

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
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___SDAirDropHandlerCalendarEvents;
  -[SDAirDropHandler updatePossibleActions](&v13, "updatePossibleActions");
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler bundleProxy](self, "bundleProxy"));
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler defaultActionForBundleProxy:](self, "defaultActionForBundleProxy:", v3));

  id location = 0LL;
  objc_initWeak(&location, self);
  v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472LL;
  uint64_t v9 = sub_10008D400;
  uint64_t v10 = &unk_1005CB070;
  objc_copyWeak(&v11, &location);
  [v4 setActionHandler:&v7];
  v14 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v14,  1LL,  v7,  v8,  v9,  v10));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  [v6 setPossibleActions:v5];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)performImportWithCompletedURLs:(id)a3 completion:(id)a4
{
  v5 = (void (**)(id, SDAirDropHandlerImportResult *, void))a4;
  id v6 = a3;
  v7 = objc_alloc_init(&OBJC_CLASS___SDAirDropHandlerImportResult);
  -[SDAirDropHandlerImportResult setImportedFiles:](v7, "setImportedFiles:", v6);

  v5[2](v5, v7, 0LL);
}

- (void)performViewActionWithImportedURLs:(id)a3 completion:(id)a4
{
  uint64_t v10 = (void (**)(id, BOOL, void))a4;
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler bundleProxy](self, "bundleProxy"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleIdentifier]);
  BOOL v9 = -[SDAirDropHandler openURLs:bundleIdentifier:](self, "openURLs:bundleIdentifier:", v6, v8);

  v10[2](v10, v9, 0LL);
}

- (BOOL)shouldEndAfterOpen
{
  return 1;
}

@end