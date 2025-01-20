@interface SDAirDropHandlerFindMyFriendsLinks
- (BOOL)canHandleTransfer;
- (SDAirDropHandlerFindMyFriendsLinks)initWithTransfer:(id)a3;
- (id)suitableContentsDescription;
- (id)suitableContentsTitle;
- (int64_t)transferTypes;
@end

@implementation SDAirDropHandlerFindMyFriendsLinks

- (SDAirDropHandlerFindMyFriendsLinks)initWithTransfer:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SDAirDropHandlerFindMyFriendsLinks;
  return -[SDAirDropHandler initWithTransfer:bundleIdentifier:]( &v4,  "initWithTransfer:bundleIdentifier:",  a3,  @"com.apple.findmy");
}

- (BOOL)canHandleTransfer
{
  return 0;
}

- (int64_t)transferTypes
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SDAirDropHandlerFindMyFriendsLinks;
  return (unint64_t)-[SDAirDropHandlerGenericLinks transferTypes](&v3, "transferTypes") | 0x8000000;
}

- (id)suitableContentsTitle
{
  return (id)SFLocalizedStringForKey(@"FIND_MY_FRIENDS_TITLE", a2);
}

- (id)suitableContentsDescription
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler senderName](self, "senderName"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue( -[SDAirDropHandler alertMessageLocalizedKeyForTypeDicts:]( self,  "alertMessageLocalizedKeyForTypeDicts:",  &off_1005FADD8));
  uint64_t v6 = SFLocalizedStringForKey(v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v7, v3));

  return v8;
}

@end