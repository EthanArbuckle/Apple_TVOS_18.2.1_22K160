@interface TVPSharedPhotoStreamItem
+ (id)_commentDictionaryFromMSASComment:(id)a3;
+ (id)_commentGUIDForLastViewedCommentDate:(id)a3 comments:(id)a4;
+ (id)_userDictionaryFromMSASComment:(id)a3;
+ (id)itemWithDataClient:(id)a3 asset:(id)a4 accessObject:(id)a5;
- (ACAccount)appleAccount;
- (MSASAlbum)albumContainingAsset;
- (MSASAssetCollection)asset;
- (TVPSharedPhotoStreamItem)initWithDataClient:(id)a3 asset:(id)a4 appleAccount:(id)a5 albumContainingAsset:(id)a6;
- (id)concreteValueForProperty:(id)a3;
- (void)resolveMediaURLWithAccessObject:(id)a3 completionHandler:(id)a4;
- (void)setAlbumContainingAsset:(id)a3;
- (void)setAppleAccount:(id)a3;
- (void)setAsset:(id)a3;
@end

@implementation TVPSharedPhotoStreamItem

+ (id)itemWithDataClient:(id)a3 asset:(id)a4 accessObject:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 albumGUID]);
  uint64_t v12 = objc_claimAutoreleasedReturnValue([v10 albumForAlbumID:v11]);

  id v13 = objc_alloc((Class)a1);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v10 appleAccount]);
  v50 = v8;
  v48 = (void *)v12;
  id v15 = [v13 initWithDataClient:v8 asset:v9 appleAccount:v14 albumContainingAsset:v12];

  v16 = (void *)objc_claimAutoreleasedReturnValue([v9 GUID]);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v10 captionForAssetID:v16]);
  uint64_t v18 = objc_claimAutoreleasedReturnValue([a1 _commentDictionaryFromMSASComment:v17]);

  v47 = (void *)v18;
  [v15 setObject:v18 forKey:TVCKDataPropertyDescription];
  v19 = (void *)objc_claimAutoreleasedReturnValue([v9 GUID]);
  v49 = v10;
  v20 = (void *)objc_claimAutoreleasedReturnValue([v10 commentsForAssetID:v19]);

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v23 = objc_claimAutoreleasedReturnValue([v20 nextObject]);
  if (v23)
  {
    v25 = (void *)v23;
    char v26 = 0;
    uint64_t v27 = 0LL;
    do
    {
      id v28 = objc_msgSend((id)objc_opt_class(a1, v24), "_commentDictionaryFromMSASComment:", v25);
      v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      if (v29)
      {
        [v22 addObject:v29];
        if ([v25 isLike])
        {
          else {
            [v21 addObject:v25];
          }
          ++v27;
        }
      }

      uint64_t v30 = objc_claimAutoreleasedReturnValue([v20 nextObject]);
      v25 = (void *)v30;
    }

    while (v30);
  }

  else
  {
    uint64_t v27 = 0LL;
    char v26 = 0;
  }

  [v21 sortUsingComparator:&stru_1000CB190];
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472LL;
  v51[2] = sub_10003A348;
  v51[3] = &unk_1000CB1B8;
  id v31 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 5LL));
  id v52 = v31;
  id v53 = a1;
  [v21 enumerateObjectsUsingBlock:v51];
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v22));
  [v15 setObject:v32 forKey:TVCKDataPropertyComments];

  v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v22 count]));
  [v15 setObject:v33 forKey:TVCKDataPropertyTotalCommentCount];

  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v27));
  [v15 setObject:v34 forKey:TVCKDataPropertyLikesCount];

  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v26 & 1));
  [v15 setObject:v35 forKey:TVCKDataPropertyLiked];

  v46 = v31;
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v31));
  [v15 setObject:v36 forKey:TVCKDataPropertyUsersWhoLikeThisItem];

  v37 = (void *)objc_claimAutoreleasedReturnValue([v9 GUID]);
  v38 = (void *)objc_claimAutoreleasedReturnValue([v49 lastViewedCommentDateForAssetID:v37]);

  if (v38)
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue([v9 GUID]);
    v40 = (void *)objc_claimAutoreleasedReturnValue([v49 commentsForAssetID:v39]);
    v41 = (void *)objc_claimAutoreleasedReturnValue([a1 _commentGUIDForLastViewedCommentDate:v38 comments:v40]);

    [v15 setObject:v41 forKey:TVCKDataPropertyLastAccessedItem];
  }

  v42 = (void *)objc_claimAutoreleasedReturnValue([v9 GUID]);
  v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v49 isAssetUnviewedForAssetID:v42]));

  [v15 setObject:v43 forKey:TVCKDataPropertyHasNewContent];
  v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v9 isPhotoIris]));
  [v15 setObject:v44 forKey:TVCKDataPropertyIsIrisAsset];

  return v15;
}

- (TVPSharedPhotoStreamItem)initWithDataClient:(id)a3 asset:(id)a4 appleAccount:(id)a5 albumContainingAsset:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___TVPSharedPhotoStreamItem;
  v14 = -[TVPSharedPhotoStreamItem initWithDataClient:](&v17, "initWithDataClient:", a3);
  id v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_appleAccount, a5);
    objc_storeStrong((id *)&v15->_asset, a4);
    objc_storeStrong((id *)&v15->_albumContainingAsset, a6);
  }

  return v15;
}

- (void)resolveMediaURLWithAccessObject:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPhotoStreamItem asset](self, "asset"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 assets]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[TVPAccessObject _filterAppositeVideoAssetFromAssets:]( &OBJC_CLASS___TVPAccessObject,  "_filterAppositeVideoAssetFromAssets:",  v9));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10003A55C;
  v12[3] = &unk_1000CB1E0;
  id v13 = v6;
  id v11 = v6;
  [v7 resolveMediaURLForMSAsset:v10 completionHandler:v12];
}

- (id)concreteValueForProperty:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPhotoStreamItem asset](self, "asset"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mediaAssetType]);
  unsigned int v7 = [v6 isEqualToString:kMSASAssetCollectionMediaAssetTypeVideo];

  if ([v4 isEqualToString:TVCKDataPropertyMediaType])
  {
    id v8 = (id *)&TVCKDataTypeVideoClip;
    if (!v7) {
      id v8 = (id *)&TVCKDataTypePhoto;
    }
    id v9 = *v8;
    goto LABEL_5;
  }

  if ([v4 isEqualToString:TVCKDataPropertyID])
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPhotoStreamItem asset](self, "asset"));
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 GUID]);
LABEL_10:
    id v10 = (void *)v12;
LABEL_11:

    goto LABEL_12;
  }

  if ([v4 isEqualToString:TVCKDataPropertyParentContainerID])
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPhotoStreamItem asset](self, "asset"));
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 albumGUID]);
    goto LABEL_10;
  }

  if ([v4 isEqualToString:TVCKDataPropertyCollectionName])
  {
    id v9 = (id)objc_claimAutoreleasedReturnValue( -[MSASAlbum metadataValueForKey:]( self->_albumContainingAsset,  "metadataValueForKey:",  kMSASAlbumMetadataNameKey));
LABEL_5:
    id v10 = v9;
    goto LABEL_12;
  }

  if ([v4 isEqualToString:TVCKDataPropertyAssetImageSize])
  {
    uint64_t v26 = 0LL;
    uint64_t v27 = (double *)&v26;
    uint64_t v28 = 0x3010000000LL;
    v29 = &unk_1000BD292;
    CGSize v30 = CGSizeZero;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPhotoStreamItem asset](self, "asset"));
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 assets]);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_10003AAA8;
    v25[3] = &unk_1000CB208;
    v25[4] = &v26;
    [v21 enumerateObjectsUsingBlock:v25];

    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGSize:](&OBJC_CLASS___NSValue, "valueWithCGSize:", v27[4], v27[5]));
    _Block_object_dispose(&v26, 8);
    goto LABEL_12;
  }

  if ([v4 isEqualToString:TVCKDataPropertyDateCreated])
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPhotoStreamItem asset](self, "asset"));
    v22 = (void *)objc_claimAutoreleasedReturnValue([v11 metadata]);
    uint64_t v23 = v22;
    uint64_t v24 = &kMSASAssetCollectionMetadataDateCreated;
LABEL_33:
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKey:*v24]);

    goto LABEL_11;
  }

  if ([v4 isEqualToString:TVCKDataPropertyPhotoStreamBatchID])
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPhotoStreamItem asset](self, "asset"));
    v22 = (void *)objc_claimAutoreleasedReturnValue([v11 metadata]);
    uint64_t v23 = v22;
    uint64_t v24 = &kMSASAssetCollectionMetadataBatchGUID;
    goto LABEL_33;
  }

  if ([v4 isEqualToString:TVCKDataPropertyPhotoStreamBatchCreationDate])
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPhotoStreamItem asset](self, "asset"));
    v22 = (void *)objc_claimAutoreleasedReturnValue([v11 metadata]);
    uint64_t v23 = v22;
    uint64_t v24 = &kMSASAssetCollectionMetadataBatchDateCreated;
    goto LABEL_33;
  }

  if ([v4 isEqualToString:TVCKDataPropertyPhotoStreamIsLegacyItem])
  {
    id v10 = &__kCFBooleanFalse;
    goto LABEL_24;
  }

  if ([v4 isEqualToString:TVCKDataPropertyFullName])
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPhotoStreamItem asset](self, "asset"));
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 fullName]);
    goto LABEL_10;
  }

  if ([v4 isEqualToString:TVCKDataPropertyIrisGroupIdentifier])
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPhotoStreamItem asset](self, "asset"));
    v22 = (void *)objc_claimAutoreleasedReturnValue([v11 metadata]);
    uint64_t v23 = v22;
    uint64_t v24 = &kMSASAssetCollectionMetadataIrisGroupIdentifier;
    goto LABEL_33;
  }

  if ([v4 isEqualToString:TVCKDataPropertyIrisStillDisplayTime])
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPhotoStreamItem asset](self, "asset"));
    v22 = (void *)objc_claimAutoreleasedReturnValue([v11 metadata]);
    uint64_t v23 = v22;
    uint64_t v24 = &kMSASAssetCollectionMetadataIrisStillDisplayTime;
    goto LABEL_33;
  }

  if ([v4 isEqualToString:TVCKDataPropertyIrisVideoDuration])
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPhotoStreamItem asset](self, "asset"));
    v22 = (void *)objc_claimAutoreleasedReturnValue([v11 metadata]);
    uint64_t v23 = v22;
    uint64_t v24 = &kMSASAssetCollectionMetadataIrisVideoDuration;
    goto LABEL_33;
  }

  id v10 = 0LL;
LABEL_12:
  if (v10) {
    unsigned int v13 = 0;
  }
  else {
    unsigned int v13 = v7;
  }
  if (v13 == 1)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPhotoStreamItem asset](self, "asset"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 assets]);
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[TVPAccessObject _filterAppositeVideoAssetFromAssets:]( &OBJC_CLASS___TVPAccessObject,  "_filterAppositeVideoAssetFromAssets:",  v15));

    if ([v4 isEqualToString:TVCKDataPropertyIsHD])
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v16 mediaAssetType] == (id)7));
    }

    else if ([v4 isEqualToString:TVCKDataPropertyDuration])
    {
      objc_super v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPhotoStreamItem asset](self, "asset"));
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 metadata]);
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:kMSASAssetCollectionMetadataVideoDuration]);
    }

    else
    {
      id v10 = 0LL;
    }
  }

+ (id)_commentDictionaryFromMSASComment:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    if ([v3 isLike])
    {
      v5 = (id *)&TVCKDataPropertyPhotoStreamLikeCommentType;
    }

    else
    {
      unsigned int v7 = [v4 isCaption];
      v5 = (id *)&TVCKDataPropertyPhotoStreamRegularCommentType;
      if (v7) {
        v5 = (id *)&TVCKDataPropertyPhotoStreamCaptionCommentType;
      }
    }

    id v8 = *v5;
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 content]);
    id v10 = v9;
    if (v9) {
      id v11 = v9;
    }
    else {
      id v11 = (id)objc_claimAutoreleasedReturnValue(+[NSString string](&OBJC_CLASS___NSString, "string"));
    }
    uint64_t v12 = v11;

    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v4 GUID]);
    v14 = v13;
    if (v13) {
      id v15 = v13;
    }
    else {
      id v15 = (id)objc_claimAutoreleasedReturnValue(+[NSString string](&OBJC_CLASS___NSString, "string"));
    }
    v16 = v15;

    objc_super v17 = (void *)objc_claimAutoreleasedReturnValue([v4 fullName]);
    uint64_t v18 = v17;
    if (v17) {
      id v19 = v17;
    }
    else {
      id v19 = (id)objc_claimAutoreleasedReturnValue(+[NSString string](&OBJC_CLASS___NSString, "string"));
    }
    v20 = v19;

    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObjectsAndKeys:",  v12,  TVCKDataPropertyDescription,  v16,  TVCKDataPropertyID,  v20,  TVCKDataPropertyFullName,  v8,  TVCKDataPropertyPhotoStreamCommentType,  0LL));
    v21 = (void *)objc_claimAutoreleasedReturnValue([v4 timestamp]);
    if (v21) {
      [v6 setObject:v21 forKey:TVCKDataPropertyDateCreated];
    }
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

+ (id)_userDictionaryFromMSASComment:(id)a3
{
  uint64_t v7 = TVCKDataPropertyFullName;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 fullName]);
  id v4 = v3;
  if (!v3) {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString string](&OBJC_CLASS___NSString, "string"));
  }
  id v8 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));
  if (!v3) {

  }
  return v5;
}

+ (id)_commentGUIDForLastViewedCommentDate:(id)a3 comments:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 nextObject]);
  if (v7)
  {
    id v8 = 0LL;
    while (1)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 timestamp]);
      [v9 timeIntervalSinceDate:v5];
      double v11 = v10;

      if (v11 > 0.0) {
        break;
      }
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v7 GUID]);

      uint64_t v13 = objc_claimAutoreleasedReturnValue([v6 nextObject]);
      uint64_t v7 = (void *)v13;
      id v8 = v12;
      if (!v13) {
        goto LABEL_8;
      }
    }

    uint64_t v12 = v8;
  }

  else
  {
    uint64_t v12 = 0LL;
  }

- (MSASAssetCollection)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
}

- (ACAccount)appleAccount
{
  return self->_appleAccount;
}

- (void)setAppleAccount:(id)a3
{
}

- (MSASAlbum)albumContainingAsset
{
  return self->_albumContainingAsset;
}

- (void)setAlbumContainingAsset:(id)a3
{
}

- (void).cxx_destruct
{
}

@end