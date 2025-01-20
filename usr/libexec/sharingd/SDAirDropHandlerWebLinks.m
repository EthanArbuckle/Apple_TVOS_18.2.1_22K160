@interface SDAirDropHandlerWebLinks
+ (id)safariBundleID;
- (BOOL)canHandleTransfer;
- (SDAirDropHandlerWebLinks)initWithTransfer:(id)a3;
- (id)suitableContentsDescription;
- (int64_t)transferTypes;
@end

@implementation SDAirDropHandlerWebLinks

- (SDAirDropHandlerWebLinks)initWithTransfer:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDAirDropHandlerWebLinks safariBundleID](&OBJC_CLASS___SDAirDropHandlerWebLinks, "safariBundleID"));
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SDAirDropHandlerWebLinks;
  v6 = -[SDAirDropHandler initWithTransfer:bundleIdentifier:](&v8, "initWithTransfer:bundleIdentifier:", v4, v5);

  return v6;
}

+ (id)safariBundleID
{
  return @"com.apple.mobilesafari";
}

- (BOOL)canHandleTransfer
{
  return 0;
}

- (int64_t)transferTypes
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SDAirDropHandlerWebLinks;
  return -[SDAirDropHandlerGenericLinks transferTypes](&v3, "transferTypes") | 0x8000000000LL;
}

- (id)suitableContentsDescription
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler senderName](self, "senderName"));
  unint64_t v4 = -[SDAirDropHandler totalSharedItemsCount](self, "totalSharedItemsCount");
  v14 = @"WEBSITE";
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v4));
  v15 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));
  v16 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( -[SDAirDropHandler alertMessageLocalizedKeyForTypeDicts:]( self,  "alertMessageLocalizedKeyForTypeDicts:",  v7));

  uint64_t v10 = SFLocalizedStringForKey(v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  v11,  v3,  v4));

  return v12;
}

@end