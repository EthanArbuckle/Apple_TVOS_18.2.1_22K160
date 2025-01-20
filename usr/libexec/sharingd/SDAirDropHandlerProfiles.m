@interface SDAirDropHandlerProfiles
- (BOOL)canHandleTransfer;
- (BOOL)shouldEndAfterOpen;
- (SDAirDropHandlerProfiles)initWithTransfer:(id)a3;
- (id)suitableContentsDescription;
- (int64_t)transferTypes;
- (void)updatePossibleActions;
@end

@implementation SDAirDropHandlerProfiles

- (SDAirDropHandlerProfiles)initWithTransfer:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SDAirDropHandlerProfiles;
  v3 = -[SDAirDropHandler initWithTransfer:bundleIdentifier:]( &v6,  "initWithTransfer:bundleIdentifier:",  a3,  @"com.apple.Preferences");
  v4 = v3;
  if (v3) {
    -[SDAirDropHandler setBundleProxy:](v3, "setBundleProxy:", 0LL);
  }
  return v4;
}

- (BOOL)canHandleTransfer
{
  return 0;
}

- (int64_t)transferTypes
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SDAirDropHandlerProfiles;
  return (unint64_t)-[SDAirDropHandler transferTypes](&v3, "transferTypes") | 0x400;
}

- (id)suitableContentsDescription
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler senderName](self, "senderName"));
  unint64_t v4 = -[SDAirDropHandler totalSharedItemsCount](self, "totalSharedItemsCount");
  v16 = @"PROFILE";
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v4));
  v17 = v5;
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
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
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___SDAirDropHandlerProfiles;
  -[SDAirDropHandler updatePossibleActions](&v2, "updatePossibleActions");
}

- (BOOL)shouldEndAfterOpen
{
  return 1;
}

@end