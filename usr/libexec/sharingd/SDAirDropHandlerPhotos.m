@interface SDAirDropHandlerPhotos
+ (id)suitableContentsDescriptionWithSenderName:(id)a3 itemsCount:(int64_t)a4 items:(id)a5 senderIsMe:(BOOL)a6 isVerifiableIdentity:(BOOL)a7 hasPhotos:(BOOL)a8 hasVideos:(BOOL)a9 isModernProgress:(BOOL)a10 transferState:(unint64_t)a11;
- (BOOL)canHandleTransfer;
- (BOOL)hasPhotos;
- (BOOL)hasVideos;
- (BOOL)shouldEndAfterOpen;
- (BOOL)shouldExtractMediaFromPhotosBundles;
- (BOOL)supportsAutoOpen;
- (BOOL)transferContainsAssetBundles:(id)a3;
- (NSArray)assetIdentifiers;
- (NSArray)unprivatizedURLs;
- (SDAirDropHandlerPhotos)initWithTransfer:(id)a3;
- (id)createDestination;
- (id)suitableContentsDescription;
- (id)transformPhotosAssetBundlesToFoldersIfNeededInCompletedURLs:(id)a3;
- (int64_t)transferTypes;
- (void)prepareForAcceptWithCompletion:(id)a3;
- (void)setAssetIdentifiers:(id)a3;
- (void)setHasPhotos:(BOOL)a3;
- (void)setHasVideos:(BOOL)a3;
- (void)setUnprivatizedURLs:(id)a3;
- (void)updatePossibleActions;
@end

@implementation SDAirDropHandlerPhotos

- (SDAirDropHandlerPhotos)initWithTransfer:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SDAirDropHandlerPhotos;
  return -[SDAirDropHandler initWithTransfer:bundleIdentifier:]( &v4,  "initWithTransfer:bundleIdentifier:",  a3,  @"com.apple.Photos");
}

- (BOOL)canHandleTransfer
{
  return 0;
}

- (int64_t)transferTypes
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SDAirDropHandlerPhotos;
  return (unint64_t)-[SDAirDropHandler transferTypes](&v3, "transferTypes") | 0x200;
}

- (id)suitableContentsDescription
{
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler senderName](self, "senderName"));
  unint64_t v17 = -[SDAirDropHandler totalSharedItemsCount](self, "totalSharedItemsCount");
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  v19 = (void *)objc_claimAutoreleasedReturnValue([v20 metaData]);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v19 items]);
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 metaData]);
  id v5 = [v4 senderIsMe];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 metaData]);
  id v8 = [v7 isVerifiableIdentity];
  BOOL hasPhotos = self->_hasPhotos;
  BOOL hasVideos = self->_hasVideos;
  unsigned __int8 v11 = -[SDAirDropHandler isModernProgress](self, "isModernProgress");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  BYTE1(v15) = v11;
  LOBYTE(v15) = hasVideos;
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[SDAirDropHandlerPhotos suitableContentsDescriptionWithSenderName:itemsCount:items:senderIsMe:isVerifiableIdentity:hasPhotos:hasVideos:isModernProgress:transferState:]( SDAirDropHandlerPhotos,  "suitableContentsDescriptionWithSenderName:itemsCount:items:senderIsMe:isVerifiableIdentity:hasPhotos :hasVideos:isModernProgress:transferState:",  v18,  v17,  v16,  v5,  v8,  hasPhotos,  v15,  [v12 transferState]));

  return v13;
}

+ (id)suitableContentsDescriptionWithSenderName:(id)a3 itemsCount:(int64_t)a4 items:(id)a5 senderIsMe:(BOOL)a6 isVerifiableIdentity:(BOOL)a7 hasPhotos:(BOOL)a8 hasVideos:(BOOL)a9 isModernProgress:(BOOL)a10 transferState:(unint64_t)a11
{
  BOOL v11 = a8;
  BOOL v12 = a7;
  BOOL v13 = a6;
  id v17 = a3;
  id v18 = a5;
  v20 = v18;
  if (!v11 || !a9)
  {
    if (v11)
    {
      id v31 = a1;
      BOOL v56 = v13;
      v64 = @"PHOTO";
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
      v65 = v32;
      v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v65,  &v64,  1LL));
      v66 = v33;
      v34 = &v66;
    }

    else
    {
      if (!a9)
      {
        v36 = 0LL;
LABEL_31:
        uint64_t v46 = SFLocalizedStringForKey(v36, v19);
        v44 = (void *)objc_claimAutoreleasedReturnValue(v46);
        if (!a10) {
          goto LABEL_35;
        }
        goto LABEL_32;
      }

      id v31 = a1;
      BOOL v56 = v13;
      v61 = @"VIDEO";
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
      v62 = v32;
      v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v62,  &v61,  1LL));
      v63 = v33;
      v34 = &v63;
    }

    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v34, 1LL));
    v36 = (void *)objc_claimAutoreleasedReturnValue( [v31 alertMessageLocalizedKeyForTypeDicts:v35 senderIsMe:v56 isVerifiableIdentity:v12 isModernProgress:a10 transferState:a11]);

    goto LABEL_31;
  }

  id v52 = a1;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  id v21 = [v18 countByEnumeratingWithState:&v57 objects:v72 count:16];
  id v54 = v17;
  BOOL v53 = v12;
  BOOL v55 = v13;
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = 0LL;
    a4 = 0LL;
    uint64_t v24 = *(void *)v58;
    do
    {
      for (i = 0LL; i != v22; i = (char *)i + 1)
      {
        if (*(void *)v58 != v24) {
          objc_enumerationMutation(v20);
        }
        v26 = *(void **)(*((void *)&v57 + 1) + 8LL * (void)i);
        v27 = (void *)objc_claimAutoreleasedReturnValue([v26 type]);
        v28 = (void *)objc_claimAutoreleasedReturnValue([v26 type]);
        int v29 = SFIsPhotosAssetBundle();

        if (v29)
        {
          uint64_t v30 = objc_claimAutoreleasedReturnValue([v26 subtype]);

          v27 = (void *)v30;
        }

        if (SFIsImage(v27))
        {
          v23 += (uint64_t)[v26 count];
        }

        else if (SFIsVideo(v27))
        {
          a4 += (int64_t)[v26 count];
        }
      }

      id v22 = [v20 countByEnumeratingWithState:&v57 objects:v72 count:16];
    }

    while (v22);
  }

  else
  {
    uint64_t v23 = 0LL;
    a4 = 0LL;
  }

  v69 = @"PHOTO";
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v23));
  v70 = v37;
  v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v70,  &v69,  1LL));
  v71[0] = v38;
  v67 = @"VIDEO";
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
  v68 = v39;
  v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v68,  &v67,  1LL));
  v71[1] = v40;
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v71, 2LL));
  v36 = (void *)objc_claimAutoreleasedReturnValue( [v52 alertMessageLocalizedKeyForTypeDicts:v41 senderIsMe:v55 isVerifiableIdentity:v53 isModernProgress:a10 transferState:a11]);

  uint64_t v43 = SFLocalizedStringForKey(v36, v42);
  v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
  if (v23 < 2 || a4 < 2)
  {
    id v17 = v54;
    if (v23 >= 2)
    {
      if (a10) {
        goto LABEL_29;
      }
      goto LABEL_37;
    }

    if (a4 < 2)
    {
      if (a10) {
        goto LABEL_39;
      }
      goto LABEL_38;
    }

    if (!a10)
    {
LABEL_35:
      int64_t v50 = a4;
LABEL_38:
      id v49 = v17;
LABEL_39:
      v45 = +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  v44,  v49,  v50,  v51);
      goto LABEL_40;
    }

- (BOOL)supportsAutoOpen
{
  return 1;
}

- (BOOL)shouldEndAfterOpen
{
  return 0;
}

- (id)transformPhotosAssetBundlesToFoldersIfNeededInCompletedURLs:(id)a3
{
  id v3 = a3;
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v3 count]));
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v37;
    v9 = UTTypePackage;
    *(void *)&__int128 v6 = 138412290LL;
    __int128 v28 = v6;
    int v29 = v4;
    uint64_t v31 = *(void *)v37;
    do
    {
      v10 = 0LL;
      id v32 = v7;
      do
      {
        if (*(void *)v37 != v8) {
          objc_enumerationMutation(obj);
        }
        BOOL v11 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)v10);
        BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "pathExtension", v28));
        BOOL v13 = (void *)objc_claimAutoreleasedReturnValue( +[UTType typeWithFilenameExtension:conformingToType:]( &OBJC_CLASS___UTType,  "typeWithFilenameExtension:conformingToType:",  v12,  v9));
        v14 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);

        if (SFIsPhotosAssetBundle(v14))
        {
          id v15 = [[PFAssetBundle alloc] initWithAssetBundleAtURL:v11];
          v16 = (void *)objc_claimAutoreleasedReturnValue([v11 URLByDeletingLastPathComponent]);
          id v35 = 0LL;
          id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 writeFolderRepresentationToDirectory:v16 error:&v35]);
          id v18 = (os_log_s *)v35;
          uint64_t v19 = airdrop_log(v18);
          v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
          id v21 = v20;
          if (v17)
          {
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v28;
              v41 = v17;
              _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "Wrote folder representation of asset bundle to: %@",  buf,  0xCu);
            }

            id v34 = 0LL;
            unsigned __int8 v22 = [v30 removeItemAtURL:v11 error:&v34];
            uint64_t v23 = (os_log_s *)v34;
            id v21 = v23;
            if ((v22 & 1) == 0)
            {
              uint64_t v24 = airdrop_log(v23);
              v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v28;
                v41 = v21;
                _os_log_error_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "Unable to delete asset bundle after transforming to folder. Error: %@",  buf,  0xCu);
              }
            }

            objc_super v4 = v29;
          }

          else if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v28;
            v41 = v18;
            _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "Unable to create folder representation from asset bundle. Error: %@",  buf,  0xCu);
          }

          v9 = UTTypePackage;
          uint64_t v8 = v31;
          id v7 = v32;
        }

        else
        {
          id v17 = 0LL;
        }

        if (v17) {
          v26 = v17;
        }
        else {
          v26 = (os_log_s *)v11;
        }
        [v4 addObject:v26];

        v10 = (char *)v10 + 1;
      }

      while (v7 != v10);
      id v7 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
    }

    while (v7);
  }

  return v4;
}

- (void)updatePossibleActions
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___SDAirDropHandlerPhotos;
  -[SDAirDropHandler updatePossibleActions](&v2, "updatePossibleActions");
}

- (BOOL)transferContainsAssetBundles:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 metaData]);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue([v3 items]);
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * (void)i), "type", (void)v11));
        char v9 = SFIsPhotosAssetBundle(v8);

        if ((v9 & 1) != 0)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }

      id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

- (void)prepareForAcceptWithCompletion:(id)a3
{
  id v3 = (void (**)(id, uint64_t))a3;
  uint64_t v4 = airdrop_log(v3);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Preparing AirDrop for accept", v6, 2u);
  }

  v3[2](v3, 1LL);
}

- (id)createDestination
{
  id v3 = NSHomeDirectory();
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v4, 1LL));
  id v13 = 0LL;
  id v6 = sub_100115134(v5, &v13);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = v13;

  if (!v7)
  {
    uint64_t v10 = airdrop_log(v9);
    __int128 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10008327C(self, (uint64_t)v8, v11);
    }
  }

  return v7;
}

- (BOOL)shouldExtractMediaFromPhotosBundles
{
  return self->_shouldExtractMediaFromPhotosBundles;
}

- (BOOL)hasPhotos
{
  return self->_hasPhotos;
}

- (void)setHasPhotos:(BOOL)a3
{
  self->_BOOL hasPhotos = a3;
}

- (BOOL)hasVideos
{
  return self->_hasVideos;
}

- (void)setHasVideos:(BOOL)a3
{
  self->_BOOL hasVideos = a3;
}

- (NSArray)unprivatizedURLs
{
  return self->_unprivatizedURLs;
}

- (void)setUnprivatizedURLs:(id)a3
{
}

- (NSArray)assetIdentifiers
{
  return self->_assetIdentifiers;
}

- (void)setAssetIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end