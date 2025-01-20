@interface TVPPhotoStreamBatch
- (CGRect)batchFrame;
- (NSCountedSet)countsByAssetDisplayType;
- (NSDate)modifiedDate;
- (NSMutableArray)photoIndices;
- (NSMutableArray)photosInfo;
- (NSString)ID;
- (NSString)batchCreatorName;
- (NSString)batchDescription;
- (int64_t)batchIndex;
- (int64_t)photoAssetCount;
- (int64_t)videoAssetCount;
- (void)setBatchCreatorName:(id)a3;
- (void)setBatchDescription:(id)a3;
- (void)setBatchFrame:(CGRect)a3;
- (void)setBatchIndex:(int64_t)a3;
- (void)setID:(id)a3;
- (void)setModifiedDate:(id)a3;
- (void)setPhotoAssetCount:(int64_t)a3;
- (void)setPhotoIndices:(id)a3;
- (void)setPhotosInfo:(id)a3;
- (void)setVideoAssetCount:(int64_t)a3;
@end

@implementation TVPPhotoStreamBatch

- (NSCountedSet)countsByAssetDisplayType
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoStreamBatch photosInfo](self, "photosInfo"));
  v3 = objc_alloc_init(&OBJC_CLASS___NSCountedSet);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v4 = v2;
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * (void)i), "pl_managedAsset", (void)v13));
        switch([v9 playbackStyle])
        {
          case 0u:
            uint64_t v10 = 1LL;
            break;
          case 1u:
          case 3u:
            else {
              uint64_t v10 = 1LL;
            }
            break;
          case 2u:
            uint64_t v10 = 6LL;
            break;
          case 4u:
            uint64_t v10 = 2LL;
            break;
          case 5u:
            if ([v9 playbackVariation] == 1)
            {
              uint64_t v10 = 4LL;
            }

            else if ([v9 playbackVariation] == 2)
            {
              uint64_t v10 = 3LL;
            }

            else
            {
              uint64_t v10 = 2LL;
            }

            break;
          default:
            uint64_t v10 = 0LL;
            break;
        }

        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v10));
        -[NSCountedSet addObject:](v3, "addObject:", v11);
      }

      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v6);
  }

  return v3;
}

- (NSString)ID
{
  return self->_ID;
}

- (void)setID:(id)a3
{
}

- (NSString)batchDescription
{
  return self->_batchDescription;
}

- (void)setBatchDescription:(id)a3
{
}

- (NSString)batchCreatorName
{
  return self->_batchCreatorName;
}

- (void)setBatchCreatorName:(id)a3
{
}

- (NSDate)modifiedDate
{
  return self->_modifiedDate;
}

- (void)setModifiedDate:(id)a3
{
}

- (NSMutableArray)photosInfo
{
  return self->_photosInfo;
}

- (void)setPhotosInfo:(id)a3
{
}

- (NSMutableArray)photoIndices
{
  return self->_photoIndices;
}

- (void)setPhotoIndices:(id)a3
{
}

- (int64_t)photoAssetCount
{
  return self->_photoAssetCount;
}

- (void)setPhotoAssetCount:(int64_t)a3
{
  self->_photoAssetCount = a3;
}

- (int64_t)videoAssetCount
{
  return self->_videoAssetCount;
}

- (void)setVideoAssetCount:(int64_t)a3
{
  self->_videoAssetCount = a3;
}

- (int64_t)batchIndex
{
  return self->_batchIndex;
}

- (void)setBatchIndex:(int64_t)a3
{
  self->_batchIndex = a3;
}

- (CGRect)batchFrame
{
  double x = self->_batchFrame.origin.x;
  double y = self->_batchFrame.origin.y;
  double width = self->_batchFrame.size.width;
  double height = self->_batchFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBatchFrame:(CGRect)a3
{
  self->_batchFrame = a3;
}

- (void).cxx_destruct
{
}

@end