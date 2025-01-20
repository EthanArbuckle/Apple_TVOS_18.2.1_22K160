@interface AMSDNFCAccessory
- (id)_addCampaignToken:(id)a3 andGroup:(id)a4 toURL:(id)a5;
- (id)_bag;
@end

@implementation AMSDNFCAccessory

- (id)_bag
{
  id v2 = objc_alloc_init(&OBJC_CLASS___AMSMutableBagKeySet);
  [v2 addBagKey:@"arcade-iap-family-id" valueType:4];
  [v2 addBagKey:@"nfc-accessories/music/tag-url" valueType:5];
  [v2 addBagKey:@"nfc-accessories/music/payloads/unsubscribed" valueType:6];
  [v2 addBagKey:@"nfc-accessories/music/payloads/subscribed" valueType:6];
  [v2 addBagKey:@"nfc-accessories/tv/tag-url" valueType:5];
  [v2 addBagKey:@"nfc-accessories/tv/payloads/unsubscribed" valueType:6];
  [v2 addBagKey:@"nfc-accessories/tv/payloads/subscribed" valueType:6];
  [v2 addBagKey:@"nfc-accessories/arcade/tag-url" valueType:5];
  [v2 addBagKey:@"nfc-accessories/arcade/payloads/unsubscribed" valueType:6];
  [v2 addBagKey:@"nfc-accessories/arcade/payloads/subscribed" valueType:6];
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AMSURLRequestEncoder bagKeySet](&OBJC_CLASS___AMSURLRequestEncoder, "bagKeySet"));
  [v2 unionBagKeySet:v3];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[AMSMetrics bagKeySet](&OBJC_CLASS___AMSMetrics, "bagKeySet"));
  [v2 unionBagKeySet:v4];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[AMSMescal bagKeySet](&OBJC_CLASS___AMSMescal, "bagKeySet"));
  [v2 unionBagKeySet:v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[AMSUserNotification bagKeySet](&OBJC_CLASS___AMSUserNotification, "bagKeySet"));
  [v2 unionBagKeySet:v6];

  +[AMSBagKeySet registerBagKeySet:forProfile:profileVersion:]( &OBJC_CLASS___AMSBagKeySet,  "registerBagKeySet:forProfile:profileVersion:",  v2,  @"AMSNFCAccessory",  @"1");
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[AMSBag bagForProfile:profileVersion:]( &OBJC_CLASS___AMSBag,  "bagForProfile:profileVersion:",  @"AMSNFCAccessory",  @"1"));

  return v7;
}

- (id)_addCampaignToken:(id)a3 andGroup:(id)a4 toURL:(id)a5
{
  unint64_t v7 = (unint64_t)a3;
  unint64_t v8 = (unint64_t)a4;
  id v9 = a5;
  v10 = v9;
  if (v7 | v8)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLComponents componentsWithURL:resolvingAgainstBaseURL:]( &OBJC_CLASS___NSURLComponents,  "componentsWithURL:resolvingAgainstBaseURL:",  v9,  1LL));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 queryItems]);
    id v13 = [v12 mutableCopy];
    v14 = v13;
    if (v13) {
      v15 = (NSMutableArray *)v13;
    }
    else {
      v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    }
    v17 = v15;

    if (v8)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  @"itscg",  v8));
      -[NSMutableArray addObject:](v17, "addObject:", v18);
    }

    if (v7)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  @"itsct",  v7));
      -[NSMutableArray addObject:](v17, "addObject:", v19);
    }

    [v11 setQueryItems:v17];
    id v16 = (id)objc_claimAutoreleasedReturnValue([v11 URL]);
  }

  else
  {
    id v16 = v9;
  }

  return v16;
}

@end