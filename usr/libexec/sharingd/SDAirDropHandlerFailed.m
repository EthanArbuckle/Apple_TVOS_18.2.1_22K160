@interface SDAirDropHandlerFailed
- (BOOL)canHandleTransfer;
- (BOOL)shouldEndAfterOpen;
- (NSString)errorDetailedString;
- (NSString)errorString;
- (id)suitableContentsDescription;
- (id)suitableContentsTitle;
- (void)activate;
@end

@implementation SDAirDropHandlerFailed

- (void)activate
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  [v3 setCancelAction:0];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  [v4 setSelectedAction:0];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  [v5 setPossibleActions:0];

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SDAirDropHandlerFailed;
  -[SDAirDropHandler activate](&v6, "activate");
}

- (BOOL)canHandleTransfer
{
  return 0;
}

- (NSString)errorString
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  [v3 transferState];

  v4 = (void *)objc_claimAutoreleasedReturnValue( -[SDAirDropHandler alertMessageLocalizedKeyForTypeDicts:]( self,  "alertMessageLocalizedKeyForTypeDicts:",  0LL));
  uint64_t v6 = SFLocalizedStringForKey(v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler senderName](self, "senderName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v7, v8));

  return (NSString *)v9;
}

- (NSString)errorDetailedString
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  id v4 = [v3 transferState];

  if (v4 == (id)9
    && (uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer")),
        uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 error]),
        id v7 = [v6 code],
        v6,
        v5,
        v7 == (id)-2LL))
  {
    uint64_t v9 = SFLocalizedStringForKey(@"Not Enough Space", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  }

  else
  {
    v10 = 0LL;
  }

  return (NSString *)v10;
}

- (id)suitableContentsTitle
{
  return -[SDAirDropHandlerFailed errorString](self, "errorString");
}

- (id)suitableContentsDescription
{
  return -[SDAirDropHandlerFailed errorDetailedString](self, "errorDetailedString");
}

- (BOOL)shouldEndAfterOpen
{
  return 1;
}

@end