@interface TVAirPlayStoreMediaItem
+ (id)_dataItemForParameters:(id)a3;
- (BOOL)hasTrait:(id)a3;
- (BOOL)preventSpeculativeLoading;
- (TVAirPlayResourceLoadingMediaItemDelegate)resourceLoadingDelegate;
- (TVAirPlayStoreMediaItem)initWithParameters:(id)a3;
- (void)loadStreamingKeyForRequest:(id)a3;
- (void)mergePropertiesFromDataItem:(id)a3 toDataItem:(id)a4;
- (void)setPreventSpeculativeLoading:(BOOL)a3;
- (void)setResourceLoadingDelegate:(id)a3;
@end

@implementation TVAirPlayStoreMediaItem

- (TVAirPlayStoreMediaItem)initWithParameters:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class(self) _dataItemForParameters:v4];
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"purchasedMediaKind"]);

  if (([v7 isEqualToString:@"movie"] & 1) != 0
    || [v7 isEqualToString:@"tvshow"])
  {
    self->_preventSpeculativeLoading = 1;
  }

  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVAirPlayStoreMediaItem;
  v8 = -[TVAirPlayStoreMediaItem initWithDataItem:](&v10, "initWithDataItem:", v6);

  return v8;
}

+ (id)_dataItemForParameters:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(&OBJC_CLASS___TVCKDataItem);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVCKCloudDataClient cloudDataClient](&OBJC_CLASS___TVCKCloudDataClient, "cloudDataClient"));
  id v6 = [v4 initWithDataClient:v5];

  [v6 beginUpdateTransaction];
  v27 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"mz_at"]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v27 base64EncodedStringWithOptions:0]);
  [v6 setValue:v7 forProperty:TVCKDataPropertyMZAT];

  v26 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"buyParams"]);
  objc_msgSend(v6, "setValue:forProperty:");
  v25 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"dsid"]);
  objc_msgSend(v6, "setValue:forProperty:");
  v8 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"userAgent"]);
  [v6 setValue:v8 forProperty:TVCKDataPropertyUserAgent];
  v9 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"itemID"]);
  [v6 setValue:v9 forProperty:TVCKDataPropertyVodka2ItemID];
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"itemType"]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"purchasedMediaKind"]);
  if ([v10 isEqualToString:@"match"])
  {
    [v6 setValue:TVCKDataPropertyOfferTypePaidRedownload forProperty:TVCKDataPropertyOfferType];
    [v6 setValue:v9 forProperty:TVCKDataPropertySagaID];
  }

  else if ([v10 isEqualToString:@"purchased"])
  {
    unsigned int v12 = [v11 isEqualToString:@"tvshow"];
    else {
      v13 = &TVCKDataPropertyOfferTypeRedownload;
    }
    [v6 setValue:*v13 forProperty:TVCKDataPropertyOfferType];
    [v6 setObject:&off_100033330 forKey:TVCKDataPropertySagaID];
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"HLS-Content-Location"]);
  if (![v14 length])
  {
    uint64_t v15 = objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"Content-Location"]);

    v14 = (void *)v15;
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v14));
  [v6 setValue:v16 forProperty:TVCKDataPropertyMediaItemPlaybackURL];

  id v17 = TVCKDataTypeMovie;
  v18 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"audioOnly"]);
  unsigned __int8 v19 = [v18 BOOLValue];

  if ((v19 & 1) != 0) {
    goto LABEL_14;
  }
  if ([v11 isEqualToString:@"tvshow"])
  {
    v20 = (id *)&TVCKDataTypeTVShow;
LABEL_15:
    id v21 = *v20;

    id v17 = v21;
    goto LABEL_16;
  }

  if ([v11 isEqualToString:@"music"])
  {
LABEL_14:
    v20 = (id *)&TVCKDataTypeAudio;
    goto LABEL_15;
  }

  if ([v11 isEqualToString:@"musicvideo"])
  {
    v20 = (id *)&TVCKDataTypeMusicVideo;
    goto LABEL_15;
  }

- (BOOL)hasTrait:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:TVPMediaItemTraitMightCacheInBackground] & 1) != 0
    || ([v4 isEqualToString:TVPMediaItemTraitCacheInBackground] & 1) != 0)
  {
    unsigned __int8 preventSpeculativeLoading = 0;
  }

  else if ([v4 isEqualToString:TVPMediaItemTraitPreventSpeculativeLoading])
  {
    unsigned __int8 preventSpeculativeLoading = self->_preventSpeculativeLoading;
  }

  else if ([v4 isEqualToString:TVPMediaItemTraitAirPlayedContent])
  {
    unsigned __int8 preventSpeculativeLoading = 1;
  }

  else
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___TVAirPlayStoreMediaItem;
    unsigned __int8 preventSpeculativeLoading = -[TVAirPlayStoreMediaItem hasTrait:](&v7, "hasTrait:", v4);
  }

  return preventSpeculativeLoading;
}

- (void)loadStreamingKeyForRequest:(id)a3
{
  p_resourceLoadingDelegate = &self->_resourceLoadingDelegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_resourceLoadingDelegate);
  sub_100017A3C(v5, self, WeakRetained);
}

- (void)mergePropertiesFromDataItem:(id)a3 toDataItem:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_super v7 = v6;
  if (v5 && v6)
  {
    [v6 beginUpdateTransaction];
    v21[0] = TVCKDataPropertyMZAT;
    v21[1] = TVCKDataPropertyBuyParameters;
    v21[2] = TVCKDataPropertyDSID;
    v21[3] = TVCKDataPropertyUserAgent;
    v21[4] = TVCKDataPropertyVodka2ItemID;
    v21[5] = TVCKDataPropertyOfferType;
    v21[6] = TVCKDataPropertySagaID;
    v21[7] = TVCKDataPropertyMediaItemPlaybackURL;
    v21[8] = TVCKDataPropertyMediaType;
    v21[9] = TVCKDataPropertyAllowedToUseHLS;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v21,  10LL));
    id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)i);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueForProperty:", v13, (void)v16));

          if (!v14)
          {
            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForProperty:v13]);
            [v7 setValue:v15 forProperty:v13];
          }
        }

        id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }

      while (v10);
    }

    [v7 commitUpdateTransactionWithOptions:0];
  }
}

- (TVAirPlayResourceLoadingMediaItemDelegate)resourceLoadingDelegate
{
  return (TVAirPlayResourceLoadingMediaItemDelegate *)objc_loadWeakRetained((id *)&self->_resourceLoadingDelegate);
}

- (void)setResourceLoadingDelegate:(id)a3
{
}

- (BOOL)preventSpeculativeLoading
{
  return self->_preventSpeculativeLoading;
}

- (void)setPreventSpeculativeLoading:(BOOL)a3
{
  self->_unsigned __int8 preventSpeculativeLoading = a3;
}

- (void).cxx_destruct
{
}

@end