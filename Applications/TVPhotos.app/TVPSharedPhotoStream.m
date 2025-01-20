@interface TVPSharedPhotoStream
+ (id)collectionTypeForAlbum:(id)a3;
+ (id)collectionWithDataClient:(id)a3 album:(id)a4 accessObject:(id)a5;
- (ACAccount)appleAccount;
- (MSASAlbum)album;
- (TVPSharedPhotoStream)initWithDataClient:(id)a3;
- (TVPSharedPhotoStream)initWithDataClient:(id)a3 album:(id)a4 appleAccount:(id)a5;
- (id)concreteValueForProperty:(id)a3;
- (void)setAlbum:(id)a3;
- (void)setAppleAccount:(id)a3;
@end

@implementation TVPSharedPhotoStream

+ (id)collectionTypeForAlbum:(id)a3
{
  unsigned int v3 = [a3 relationshipState];
  if (v3 > 4) {
    return 0LL;
  }
  else {
    return *(id *)*(&off_1000CA478 + (int)v3);
  }
}

+ (id)collectionWithDataClient:(id)a3 album:(id)a4 accessObject:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc((Class)a1);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v10 appleAccount]);
  v35 = v8;
  id v13 = [v11 initWithDataClient:v8 album:v9 appleAccount:v12];

  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 album]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 GUID]);
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v10 numberOfAssetsForAlbumID:v15]));

  [v13 setObject:v16 forKey:TVCKDataPropertyCollectionItemCount];
  [v13 setObject:v16 forKey:TVCKDataPropertyCollectionCount];
  v17 = (void *)objc_claimAutoreleasedReturnValue([v13 album]);
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 GUID]);
  v19 = (void *)objc_claimAutoreleasedReturnValue([v10 invitationForAlbumID:v18]);

  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 email]);
  [v13 setObject:v20 forKey:TVCKDataPropertyEmail];

  v21 = (void *)objc_claimAutoreleasedReturnValue([v19 fullName]);
  [v13 setObject:v21 forKey:TVCKDataPropertyFullName];

  v22 = (void *)objc_claimAutoreleasedReturnValue([v13 album]);
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 GUID]);
  v24 = (void *)objc_claimAutoreleasedReturnValue([v10 accessControlsForAlbumID:v23]);

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v26 = objc_claimAutoreleasedReturnValue([v24 nextObject]);
  if (v26)
  {
    v27 = (void *)v26;
    do
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue([v27 fullName]);

      uint64_t v29 = objc_claimAutoreleasedReturnValue([v24 nextObject]);
      v27 = (void *)v29;
    }

    while (v29);
  }

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v25));
  [v13 setObject:v30 forKey:TVCKDataPropertyPhotoStreamSubscribers];

  v31 = (void *)objc_claimAutoreleasedReturnValue([v13 album]);
  v32 = (void *)objc_claimAutoreleasedReturnValue([v31 GUID]);
  v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v10 isAlbumUnviewedForAlbumID:v32]));

  [v13 setObject:v33 forKey:TVCKDataPropertyHasNewContent];
  return v13;
}

- (TVPSharedPhotoStream)initWithDataClient:(id)a3
{
  id v3 = a3;
  __assert_rtn("-[TVPSharedPhotoStream initWithDataClient:]", "TVPStream.m", 179, "NO");
}

- (TVPSharedPhotoStream)initWithDataClient:(id)a3 album:(id)a4 appleAccount:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TVPSharedPhotoStream;
  id v11 = -[TVPSharedPhotoStream initWithDataClient:](&v14, "initWithDataClient:", a3);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_appleAccount, a5);
    objc_storeStrong((id *)&v12->_album, a4);
  }

  return v12;
}

- (id)concreteValueForProperty:(id)a3
{
  id v4 = a3;
  if (![v4 isEqualToString:TVCKDataPropertyName])
  {
    if ([v4 isEqualToString:TVCKDataPropertyID])
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPhotoStream album](self, "album"));
      uint64_t v8 = objc_claimAutoreleasedReturnValue([v6 GUID]);
      goto LABEL_6;
    }

    if ([v4 isEqualToString:TVCKDataPropertyCollectionType])
    {
      id v11 = (id *)&TVCKDataPropertyCollectionTypePhotoAlbum;
    }

    else
    {
      if ([v4 isEqualToString:TVCKDataPropertyPhotoStreamCollectionType])
      {
        id v13 = (void *)objc_opt_class(self, v12);
        objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPhotoStream album](self, "album"));
        id v9 = (id)objc_claimAutoreleasedReturnValue([v13 collectionTypeForAlbum:v14]);

        goto LABEL_7;
      }

      if (![v4 isEqualToString:TVCKDataPropertyMediaType])
      {
        if (![v4 isEqualToString:TVCKDataPropertyPhotoStreamAllowsMultipleContributors])
        {
          id v9 = 0LL;
          goto LABEL_7;
        }

        v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPhotoStream album](self, "album"));
        v6 = v5;
        v7 = &kMSASAlbumMetadataAllowMultipleContributorsKey;
        goto LABEL_3;
      }

      id v11 = (id *)&TVCKDataTypePhoto;
    }

    id v9 = *v11;
    goto LABEL_7;
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPhotoStream album](self, "album"));
  v6 = v5;
  v7 = &kMSASAlbumMetadataNameKey;
LABEL_3:
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v5 metadataValueForKey:*v7]);
LABEL_6:
  id v9 = (id)v8;

LABEL_7:
  return v9;
}

- (MSASAlbum)album
{
  return self->_album;
}

- (void)setAlbum:(id)a3
{
}

- (ACAccount)appleAccount
{
  return self->_appleAccount;
}

- (void)setAppleAccount:(id)a3
{
}

- (void).cxx_destruct
{
}

@end