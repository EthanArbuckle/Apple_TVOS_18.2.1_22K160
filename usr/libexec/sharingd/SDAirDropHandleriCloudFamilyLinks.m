@interface SDAirDropHandleriCloudFamilyLinks
- (BOOL)canHandleTransfer;
- (SDAirDropHandleriCloudFamilyLinks)initWithTransfer:(id)a3;
- (id)cancelActionTitleToAccompanyActions:(id)a3;
- (id)singleItemActionTitle;
- (id)suitableContentsDescription;
- (id)suitableContentsTitle;
- (int64_t)transferTypes;
@end

@implementation SDAirDropHandleriCloudFamilyLinks

- (SDAirDropHandleriCloudFamilyLinks)initWithTransfer:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SDAirDropHandleriCloudFamilyLinks;
  return -[SDAirDropHandler initWithTransfer:bundleIdentifier:]( &v4,  "initWithTransfer:bundleIdentifier:",  a3,  @"com.apple.family");
}

- (BOOL)canHandleTransfer
{
  return 0;
}

- (int64_t)transferTypes
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SDAirDropHandleriCloudFamilyLinks;
  return -[SDAirDropHandlerGenericLinks transferTypes](&v3, "transferTypes") | 0x20000000000LL;
}

- (id)suitableContentsTitle
{
  return (id)SFLocalizedStringForKey(@"FAMILY_INVITATION_TITLE", a2);
}

- (id)suitableContentsDescription
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler senderName](self, "senderName"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue( -[SDAirDropHandler alertMessageLocalizedKeyForTypeDicts:]( self,  "alertMessageLocalizedKeyForTypeDicts:",  &off_1005FAE80));
  uint64_t v6 = SFLocalizedStringForKey(v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v7, v3));

  return v8;
}

- (id)singleItemActionTitle
{
  return (id)SFLocalizedStringForKey(@"SHOW_INVITATION_BUTTON_TITLE", a2);
}

- (id)cancelActionTitleToAccompanyActions:(id)a3
{
  return (id)SFLocalizedStringForKey(@"CANCEL_BUTTON_TITLE", a2);
}

@end