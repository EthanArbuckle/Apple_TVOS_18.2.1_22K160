@interface SDAirDropHandlerSharediCloudDocumentsLinks
- (BOOL)canHandleTransfer;
- (BOOL)urlIsCloudDocument:(id)a3;
- (SDAirDropHandlerSharediCloudDocumentsLinks)initWithTransfer:(id)a3;
- (id)candidateIdentifiers;
- (id)suitableContentsDescription;
- (int64_t)transferTypes;
@end

@implementation SDAirDropHandlerSharediCloudDocumentsLinks

- (SDAirDropHandlerSharediCloudDocumentsLinks)initWithTransfer:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SDAirDropHandlerSharediCloudDocumentsLinks;
  return -[SDAirDropHandler initWithTransfer:bundleIdentifier:]( &v4,  "initWithTransfer:bundleIdentifier:",  a3,  @"com.apple.CloudKit.ShareBear");
}

- (id)candidateIdentifiers
{
  v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler bundleProxy](self, "bundleProxy"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler bundleProxy](self, "bundleProxy"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleIdentifier]);
    -[NSMutableArray addObject:](v3, "addObject:", v6);
  }

  return v3;
}

- (BOOL)urlIsCloudDocument:(id)a3
{
  id v22 = 0LL;
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue( +[LSAppLink appLinksWithURL:limit:error:]( &OBJC_CLASS___LSAppLink,  "appLinksWithURL:limit:error:",  a3,  -1LL,  &v22));
  id v5 = v22;
  v6 = v5;
  if (v4) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v5 == 0LL;
  }
  if (v7)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandlerSharediCloudDocumentsLinks candidateIdentifiers](self, "candidateIdentifiers"));
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id v8 = v4;
    id v9 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v19;
      while (2)
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v8);
          }
          v12 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v18 + 1) + 8 * (void)i),  "targetApplicationRecord",  (void)v18));
          v13 = (void *)objc_claimAutoreleasedReturnValue([v12 bundleIdentifier]);

          if (v13 && ([v15 containsObject:v13] & 1) != 0)
          {

            LOBYTE(v9) = 1;
            goto LABEL_20;
          }
        }

        id v9 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

- (BOOL)canHandleTransfer
{
  return 0;
}

- (int64_t)transferTypes
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SDAirDropHandlerSharediCloudDocumentsLinks;
  return (unint64_t)-[SDAirDropHandlerGenericLinks transferTypes](&v3, "transferTypes") | 0x40000000;
}

- (id)suitableContentsDescription
{
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler senderName](self, "senderName"));
  unint64_t v3 = -[SDAirDropHandler totalSharedItemsCount](self, "totalSharedItemsCount");
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 completedURLs]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);

  uint64_t v7 = SFSharediCloudDocumentsLinkToAppName(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 lowercaseString]);

  uint64_t v10 = SFSharediCloudDocumentsLinkToFileName(v6);
  uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)v11;
  v13 = 0LL;
  if (v3 != 1 || !v9 || !v11) {
    goto LABEL_13;
  }
  if ([v9 isEqual:@"keynote"])
  {
    uint64_t v14 = @"SHARED_KEYNOTE_DOCUMENT_LINK";
  }

  else if ([v9 isEqual:@"numbers"])
  {
    uint64_t v14 = @"SHARED_NUMBERS_DOCUMENT_LINK";
  }

  else
  {
    if (![v9 isEqual:@"pages"])
    {
      v13 = 0LL;
LABEL_13:
      v30 = @"SHARED_ICLOUD_DOCUMENT_LINK";
      id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v3));
      v31 = v22;
      v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v31,  &v30,  1LL));
      v32 = v23;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v32, 1LL));
      __int128 v21 = (void *)objc_claimAutoreleasedReturnValue( -[SDAirDropHandler alertMessageLocalizedKeyForTypeDicts:]( self,  "alertMessageLocalizedKeyForTypeDicts:",  v24));

      uint64_t v26 = SFLocalizedStringForKey(v21, v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      __int128 v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  v27,  v29,  v3));

      goto LABEL_14;
    }

    uint64_t v14 = @"SHARED_PAGES_DOCUMENT_LINK";
  }

  v33 = v14;
  v34 = &off_1005F7498;
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v34,  &v33,  1LL));
  v35 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v35, 1LL));
  v13 = (void *)objc_claimAutoreleasedReturnValue( -[SDAirDropHandler alertMessageLocalizedKeyForTypeDicts:]( self,  "alertMessageLocalizedKeyForTypeDicts:",  v16));

  uint64_t v18 = SFLocalizedStringForKey(v13, v17);
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  v19,  v29,  v12));

  __int128 v21 = v13;
  if (!v20) {
    goto LABEL_13;
  }
LABEL_14:

  return v20;
}

@end