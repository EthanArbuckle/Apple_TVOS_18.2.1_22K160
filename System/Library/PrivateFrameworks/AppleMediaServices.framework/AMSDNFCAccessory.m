@interface AMSDNFCAccessory
- (id)_addCampaignToken:(id)a3 andGroup:(id)a4 toURL:(id)a5;
- (id)_bag;
@end

@implementation AMSDNFCAccessory

- (id)_bag
{
  return +[AMSBag bagForProfile:profileVersion:]( &OBJC_CLASS___AMSBag,  "bagForProfile:profileVersion:",  @"AMSNFCAccessory",  @"1");
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