@interface TVPMyPhotoStreamItem
- (TVPAsset)asset;
- (TVPMyPhotoStreamItem)initWithDataClient:(id)a3 asset:(id)a4;
- (id)concreteValueForProperty:(id)a3;
- (void)setAsset:(id)a3;
@end

@implementation TVPMyPhotoStreamItem

- (TVPMyPhotoStreamItem)initWithDataClient:(id)a3 asset:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVPMyPhotoStreamItem;
  v8 = -[TVPMyPhotoStreamItem initWithDataClient:](&v11, "initWithDataClient:", a3);
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_asset, a4);
  }

  return v9;
}

- (id)concreteValueForProperty:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:TVCKDataPropertyMediaType])
  {
    v5 = (__CFString *)TVCKDataTypePhoto;
    goto LABEL_22;
  }

  if ([v4 isEqualToString:TVCKDataPropertyID])
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMyPhotoStreamItem asset](self, "asset"));
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 assetID]);
LABEL_9:
    v5 = (__CFString *)v7;
LABEL_21:

    goto LABEL_22;
  }

  if ([v4 isEqualToString:TVCKDataPropertyAssetImageSize])
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMyPhotoStreamItem asset](self, "asset"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 asset]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 metadataValueForKey:kMSAssetMetadataPixelWidthKey]);
    [v9 floatValue];
    double v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMyPhotoStreamItem asset](self, "asset"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 asset]);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 metadataValueForKey:kMSAssetMetadataPixelHeightKey]);
    [v14 floatValue];
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGSize:](&OBJC_CLASS___NSValue, "valueWithCGSize:", v11, v15));

LABEL_20:
    goto LABEL_21;
  }

  if ([v4 isEqualToString:TVCKDataPropertyDateCreated])
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMyPhotoStreamItem asset](self, "asset"));
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 dateContentCreated]);
    goto LABEL_9;
  }

  uint64_t v16 = TVCKDataPropertyPhotoStreamBatchID;
  if (([v4 isEqualToString:TVCKDataPropertyPhotoStreamBatchID] & 1) != 0
    || [v4 isEqualToString:TVCKDataPropertyPhotoStreamBatchDescription])
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMyPhotoStreamItem asset](self, "asset"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v17 dateContentCreated]);

    [v6 timeIntervalSinceDate:v8];
    v19 = @"ATVDataPropertyLegacyPhotoStreamEarlierBatchID";
    if (v18 < 1209600.0) {
      v19 = @"ATVDataPropertyLegacyPhotoStreamLastWeekBatchID";
    }
    if (v18 < 604800.0) {
      v19 = @"ATVDataPropertyLegacyPhotoStreamThisWeekBatchID";
    }
    v20 = v19;
    if ([v4 isEqualToString:v16])
    {
      v5 = v20;
    }

    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue([v21 localizedStringForKey:v20 value:&stru_1000CC6C8 table:0]);
    }

    goto LABEL_20;
  }

  if ([v4 isEqualToString:TVCKDataPropertyPhotoStreamBatchCreationDate])
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMyPhotoStreamItem asset](self, "asset"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v23 dateContentCreated]);

    [v6 timeIntervalSinceDate:v8];
    v25 = @"ATVDataPropertyLegacyPhotoStreamEarlierBatchID";
    if (v24 < 1209600.0) {
      v25 = @"ATVDataPropertyLegacyPhotoStreamLastWeekBatchID";
    }
    if (v24 < 604800.0) {
      v25 = @"ATVDataPropertyLegacyPhotoStreamThisWeekBatchID";
    }
    v5 = v25;
    goto LABEL_20;
  }

  v5 = (__CFString *)&__kCFBooleanTrue;
  if (([v4 isEqualToString:TVCKDataPropertyCanBeDeleted] & 1) == 0
    && ![v4 isEqualToString:TVCKDataPropertyPhotoStreamIsLegacyItem])
  {
    v5 = 0LL;
  }

- (TVPAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
}

- (void).cxx_destruct
{
}

@end