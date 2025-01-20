@interface SDAirDropHandlerMapsLinks
- (BOOL)canHandleTransfer;
- (SDAirDropHandlerMapsLinks)initWithTransfer:(id)a3;
- (id)candidateIdentifiers;
- (id)suitableContentsDescription;
- (int64_t)transferTypes;
@end

@implementation SDAirDropHandlerMapsLinks

- (SDAirDropHandlerMapsLinks)initWithTransfer:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SDAirDropHandlerMapsLinks;
  return -[SDAirDropHandler initWithTransfer:bundleIdentifier:]( &v4,  "initWithTransfer:bundleIdentifier:",  a3,  @"com.apple.Maps");
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

- (BOOL)canHandleTransfer
{
  return 0;
}

- (int64_t)transferTypes
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SDAirDropHandlerMapsLinks;
  return (unint64_t)-[SDAirDropHandlerGenericLinks transferTypes](&v3, "transferTypes") | 0x80000000;
}

- (id)suitableContentsDescription
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler senderName](self, "senderName"));
  unint64_t v4 = -[SDAirDropHandler totalSharedItemsCount](self, "totalSharedItemsCount");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 metaData]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 itemsDescriptionAdvanced]);

  if (v4 == 1
    && v7
    && (v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"SFAirDropActivitySubjectMapsLinkType"]),
        v8,
        v8))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"SFAirDropActivitySubjectMapsLinkType"]);
    id v10 = [v9 integerValue];

    switch((unint64_t)v10)
    {
      case 0uLL:
        v48 = @"MAPS_LINK_CURRENT_LOCATION";
        v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  1LL));
        v49 = v11;
        v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v49,  &v48,  1LL));
        v50 = v12;
        v13 = &v50;
        goto LABEL_13;
      case 1uLL:
        v45 = @"MAPS_LINK_DIRECTIONS";
        v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  1LL));
        v46 = v11;
        v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v46,  &v45,  1LL));
        v47 = v12;
        v13 = &v47;
        goto LABEL_13;
      case 2uLL:
        v42 = @"MAPS_LINK_DROPPED_PIN";
        v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  1LL));
        v43 = v11;
        v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v43,  &v42,  1LL));
        v44 = v12;
        v13 = &v44;
        goto LABEL_13;
      case 3uLL:
        v39 = @"MAPS_LINK_POI";
        v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  1LL));
        v40 = v11;
        v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v40,  &v39,  1LL));
        v41 = v12;
        v13 = &v41;
LABEL_13:
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 1LL));
        v17 = (void *)objc_claimAutoreleasedReturnValue( -[SDAirDropHandler alertMessageLocalizedKeyForTypeDicts:]( self,  "alertMessageLocalizedKeyForTypeDicts:",  v23));

        break;
      default:
        v17 = 0LL;
        break;
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 metaData]);
    v26 = (void *)objc_claimAutoreleasedReturnValue([v25 itemsDescription]);
    if ([v26 length])
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
      v28 = (void *)objc_claimAutoreleasedReturnValue([v27 metaData]);
      v20 = (void *)objc_claimAutoreleasedReturnValue([v28 itemsDescription]);
    }

    else
    {
      v20 = 0LL;
    }

    unsigned int v29 = -[SDAirDropHandler isModernProgress](self, "isModernProgress");
    uint64_t v31 = SFLocalizedStringForKey(v17, v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    if (v29) {
      v33 = +[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v32, v20, v35);
    }
    else {
      v33 = +[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v32, v3, v20);
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(v33);
  }

  else
  {
    v36 = @"MAPS_LINK";
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v4));
    v37 = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v37,  &v36,  1LL));
    v38 = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v38, 1LL));
    v17 = (void *)objc_claimAutoreleasedReturnValue( -[SDAirDropHandler alertMessageLocalizedKeyForTypeDicts:]( self,  "alertMessageLocalizedKeyForTypeDicts:",  v16));

    LODWORD(v15) = -[SDAirDropHandler isModernProgress](self, "isModernProgress");
    uint64_t v19 = SFLocalizedStringForKey(v17, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    if ((_DWORD)v15) {
      v21 = +[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v20, v4, v35);
    }
    else {
      v21 = +[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v20, v3, v4);
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  }

  return v22;
}

@end