@interface StoreDownload
- (BOOL)_patchPackageDictionary:(id)a3 matchesInstallApplication:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)writeToFile:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (NSArray)assets;
- (NSNumber)downloaderAccountIdentifier;
- (NSNumber)familyAccountIdentifier;
- (NSNumber)matchedStatus;
- (NSNumber)purchaserAccountIdentifier;
- (NSNumber)redownloadedStatus;
- (StoreDownload)initWithContentsOfFile:(id)a3;
- (StoreDownload)initWithDownload:(id)a3;
- (id)_copyPinfValueWithField:(int64_t)a3;
- (id)_copySinfValueFromEpubRightsDataWithField:(int64_t)a3;
- (id)_copySinfValueWithField:(int64_t)a3;
- (id)_epubRightsSinfData;
- (id)_newAssetArrayWithDownloadAssets:(id)a3;
- (id)_newAssetPropertiesWithStoreDictionary:(id)a3 assetType:(id)a4;
- (id)_newAssetWithURL:(id)a3 assetType:(id)a4;
- (id)_newDateFormatter;
- (id)_newDeltaPackageAssetsWithAssetDictionary:(id)a3;
- (id)_newPrimaryAssetsWithAssetDictionary:(id)a3 assetType:(id)a4;
- (id)copyJobActivity;
- (id)description;
- (id)newDownloadProperties;
- (void)dealloc;
@end

@implementation StoreDownload

- (StoreDownload)initWithContentsOfFile:(id)a3
{
  v4 = -[NSMutableDictionary initWithContentsOfFile:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithContentsOfFile:",  a3);
  if (v4)
  {
    v5 = v4;
    v6 = -[StoreDownload initWithDictionary:](self, "initWithDictionary:", v4);

    return v6;
  }

  else
  {

    return 0LL;
  }

- (StoreDownload)initWithDownload:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___StoreDownload;
  v4 = -[StoreDownload init](&v15, "init");
  if (v4)
  {
    v47[75] = "setKind:";
    v48[0] = 0LL;
    v48[1] = "setArtistName:";
    v48[2] = 0LL;
    v48[3] = "setBundleIdentifier:";
    v48[4] = 0LL;
    v48[5] = "setCancelDownloadURL:";
    v48[6] = sub_1000973A4;
    v48[7] = "setDownloadPermalink:";
    v48[8] = 0LL;
    v48[9] = "setCloudIdentifier:";
    v48[10] = 0LL;
    v48[11] = "setCollectionArtistName:";
    v48[12] = 0LL;
    v48[13] = "setCollectionIndexInCollectionGroup:";
    v48[14] = 0LL;
    v48[15] = "setCollectionName:";
    v48[16] = 0LL;
    v48[17] = "setComposerName:";
    v48[18] = 0LL;
    v48[19] = "setDocumentTargetIdentifier:";
    v48[20] = 0LL;
    v48[21] = "setDownloadKey:";
    v48[22] = 0LL;
    v48[23] = "setDurationInMilliseconds:";
    v48[24] = 0LL;
    v48[25] = "setEpisodeIdentifier:";
    v48[26] = 0LL;
    v48[27] = "setEpisodeSortIdentifier:";
    v48[28] = 0LL;
    v48[29] = "setGenre:";
    v48[30] = 0LL;
    v48[31] = "setIndexInCollection:";
    v48[32] = 0LL;
    v48[33] = "setLongDescription:";
    v48[34] = 0LL;
    v48[35] = "setLongSeasonDescription:";
    v48[36] = 0LL;
    v48[37] = "setNumberOfCollectionsInCollectionGroup:";
    v48[38] = 0LL;
    v48[39] = "setNumberOfItemsInCollection:";
    v48[40] = 0LL;
    v48[41] = "setPageProgressionDirection:";
    v48[42] = 0LL;
    v48[43] = "setPodcastEpisodeGUID:";
    v48[44] = 0LL;
    v48[45] = "setPodcastFeedURL:";
    v48[46] = sub_1000973A4;
    v48[47] = "setPodcastType:";
    v48[48] = 0LL;
    v48[49] = "setPurchaseDate:";
    v48[50] = sub_1000973B4;
    v48[51] = "setReleaseDate:";
    v48[52] = sub_1000973B4;
    v48[53] = "setReleaseYear:";
    v48[54] = 0LL;
    v48[55] = "setSeasonNumber:";
    v48[56] = 0LL;
    v48[57] = "setSeriesName:";
    v48[58] = 0LL;
    v48[59] = "setShortDescription:";
    v48[60] = 0LL;
    v48[61] = "setThumbnailImageURL:";
    v48[62] = sub_1000973A4;
    v48[63] = "setTitle:";
    v48[64] = 0LL;
    v48[65] = "setPublicationVersion:";
    v48[66] = 0LL;
    v48[67] = "setTransactionIdentifier:";
    v48[68] = 0LL;
    v48[69] = "setRedownloadActionParameters:";
    v48[70] = 0LL;
    v48[71] = "setThumbnailNewsstandBindingEdge:";
    v48[72] = 0LL;
    v48[73] = "setThumbnailNewsstandBindingType:";
    v48[74] = 0LL;
    v48[75] = "setViewStoreItemURL:";
    v48[76] = sub_1000973A4;
    v47[0] = @"kind";
    v47[1] = @"artist_name";
    v47[2] = @"bundle_id";
    v47[3] = @"cancel_url";
    v47[4] = @"download_permalink";
    v47[5] = @"store_saga_id";
    v47[6] = @"collection_artist_name";
    v47[7] = @"index_in_collection_group";
    v47[8] = @"collection_name";
    v47[9] = @"composer_name";
    v47[10] = @"document_target_id";
    v47[11] = @"store_download_key";
    v47[12] = @"duration_in_ms";
    v47[13] = @"episode_id";
    v47[14] = @"episode_sort_id";
    v47[15] = @"genre_name";
    v47[16] = @"index_in_collection";
    v47[17] = @"long_description";
    v47[18] = @"long_season_description";
    v47[19] = @"collection_group_count";
    v47[20] = @"collection_item_count";
    v47[21] = @"page_progression_direction";
    v47[22] = @"podcast_episode_guid";
    v47[23] = @"podcast_feed_url";
    v47[24] = @"podcast_type";
    v47[25] = @"store_purchase_date";
    v47[26] = @"release_date";
    v47[27] = @"release_year";
    v47[28] = @"season_number";
    v47[29] = @"series_name";
    v47[30] = @"short_description";
    v47[31] = @"thumbnail_url";
    v47[32] = @"title";
    v47[33] = @"store_publication_version";
    v47[34] = @"store_transaction_id";
    v47[35] = @"store_redownload_parameters";
    v47[36] = @"thumbnail_newsstand_binding_edge";
    v47[37] = @"thumbnail_newsstand_binding_type";
    v47[38] = @"store_url";
    v47[39] = @"store_artist_id";
    v47[40] = @"store_collection_id";
    v47[41] = @"store_composer_id";
    v47[42] = @"store_genre_id";
    v47[43] = @"store_item_id";
    v47[44] = @"store_preorder_id";
    v47[45] = @"artwork_is_prerendered";
    v47[46] = @"is_automatic";
    v47[47] = @"is_compilation";
    v47[48] = @"is_explicit";
    v47[49] = @"is_rental";
    v47[50] = @"is_sample";
    v47[51] = @"is_music_show";
    v47[52] = @"software_type";
    v47[53] = @"store_software_version_id";
    v47[54] = @"store_front_id";
    v47[55] = @"store_xid";
    v47[56] = @"artwork_template_name";
    v47[57] = @"is_store_queued";
    v47[58] = @"preferred_asset_flavor";
    v47[59] = @"is_hd";
    v47[60] = @"cancel_if_duplicate";
    v47[61] = @"bundle_version";
    v47[62] = @"store_cohort";
    v47[63] = @"is_redownload";
    v47[64] = @"beta_external_version_identifier";
    v47[65] = @"variant_id";
    v47[66] = @"rental_id";
    v47[67] = @"show_composer";
    v47[68] = @"work_name";
    v47[69] = @"has_hdr";
    v47[70] = @"is_hls";
    v47[71] = @"is_premium";
    v47[72] = @"has_4k";
    v47[73] = @"has_dolby_vision";
    v47[74] = @"hls_playlist_url";
    [a3 getValues:v16 forProperties:v47 count:75];
    if ((SSDownloadKindIsPodcastKind(v16[0]) & 1) != 0) {
      -[StoreDownload setKeyStyle:](v4, "setKeyStyle:", 1LL);
    }
    uint64_t v5 = 0LL;
    v6 = (uint64_t (**)(void))v48;
    do
    {
      uint64_t v7 = v16[v5];
      if (v7)
      {
        if (*v6)
        {
          uint64_t v7 = (*v6)(v16[v5]);
          v16[v5] = v7;
        }

        -[StoreDownload performSelector:withObject:](v4, "performSelector:withObject:", *(v6 - 1), v7);
      }

      ++v5;
      v6 += 2;
    }

    while (v5 != 39);
    uint64_t v8 = SSGetItemIdentifierFromValue(v16[39]);
    if (v8) {
      -[StoreDownload setArtistIdentifier:](v4, "setArtistIdentifier:", v8);
    }
    uint64_t v9 = SSGetItemIdentifierFromValue(v16[40]);
    if (v9) {
      -[StoreDownload setCollectionIdentifier:](v4, "setCollectionIdentifier:", v9);
    }
    uint64_t v10 = SSGetItemIdentifierFromValue(v16[41]);
    if (v10) {
      -[StoreDownload setComposerIdentifier:](v4, "setComposerIdentifier:", v10);
    }
    uint64_t v11 = SSGetItemIdentifierFromValue(v16[42]);
    if (v11) {
      -[StoreDownload setGenreIdentifier:](v4, "setGenreIdentifier:", v11);
    }
    uint64_t v12 = SSGetItemIdentifierFromValue(v16[43]);
    if (v12) {
      -[StoreDownload setItemIdentifier:](v4, "setItemIdentifier:", v12);
    }
    uint64_t v13 = SSGetItemIdentifierFromValue(v16[44]);
    if (v13) {
      -[StoreDownload setPreOrderIdentifier:](v4, "setPreOrderIdentifier:", v13);
    }
    if (v17) {
      -[StoreDownload setArtworkIsPrerendered:](v4, "setArtworkIsPrerendered:", [v17 BOOLValue]);
    }
    if (v18) {
      -[StoreDownload setAutomaticDownload:](v4, "setAutomaticDownload:", [v18 BOOLValue]);
    }
    if (v19) {
      -[StoreDownload setCompilation:](v4, "setCompilation:", [v19 BOOLValue]);
    }
    if (v20) {
      -[StoreDownload setExplicitContent:](v4, "setExplicitContent:", [v20 BOOLValue]);
    }
    if (v21) {
      -[StoreDownload setRental:](v4, "setRental:", [v21 BOOLValue]);
    }
    if (v22) {
      -[StoreDownload setSample:](v4, "setSample:", [v22 BOOLValue]);
    }
    if (v23) {
      -[StoreDownload setMusicShow:](v4, "setMusicShow:", [v23 BOOLValue]);
    }
    -[StoreDownload setValue:forMetadataKey:](v4, "setValue:forMetadataKey:", v24, SSDownloadMetadataKeySoftwareType);
    -[StoreDownload setValue:forMetadataKey:]( v4,  "setValue:forMetadataKey:",  v25,  SSDownloadMetadataKeySoftwareExternalVersionID);
    -[StoreDownload setValue:forMetadataKey:](v4, "setValue:forMetadataKey:", v26, SSDownloadMetadataKeyStoreFrontID);
    -[StoreDownload setValue:forMetadataKey:](v4, "setValue:forMetadataKey:", v27, SSDownloadMetadataKeyXID);
    -[StoreDownload setValue:forMetadataKey:]( v4,  "setValue:forMetadataKey:",  v28,  SSDownloadMetadataKeyArtworkTemplateName);
    -[StoreDownload setValue:forMetadataKey:](v4, "setValue:forMetadataKey:", v29, SSDownloadMetadataKeyIsInStoreQueue);
    -[StoreDownload setPreferredAssetFlavor:](v4, "setPreferredAssetFlavor:", v30);
    -[StoreDownload setHighDefinition:](v4, "setHighDefinition:", [v31 BOOLValue]);
    -[StoreDownload setValue:forMetadataKey:]( v4,  "setValue:forMetadataKey:",  v32,  SSDownloadMetadataKeyCancelIfDuplicate);
    -[StoreDownload setValue:forMetadataKey:](v4, "setValue:forMetadataKey:", v33, SSDownloadMetadataKeyBundleVersion);
    -[StoreDownload setValue:forMetadataKey:](v4, "setValue:forMetadataKey:", v34, SSDownloadMetadataKeyStoreCohort);
    -[StoreDownload setValue:forMetadataKey:]( v4,  "setValue:forMetadataKey:",  v35,  SSDownloadMetadataKeyIsPurchaseRedownload);
    -[StoreDownload setValue:forMetadataKey:]( v4,  "setValue:forMetadataKey:",  v36,  SSDownloadMetadataKeyBetaExternalVersionIdentifier);
    -[StoreDownload setValue:forMetadataKey:](v4, "setValue:forMetadataKey:", v37, @"variantID");
    -[StoreDownload setValue:forMetadataKey:]( v4,  "setValue:forMetadataKey:",  v38,  SSDownloadMetadataKeyRentalIdentifier);
    -[StoreDownload setValue:forMetadataKey:](v4, "setValue:forMetadataKey:", v39, SSDownloadMetadataKeyShowComposer);
    -[StoreDownload setValue:forMetadataKey:](v4, "setValue:forMetadataKey:", v40, SSDownloadMetadataKeyWorkName);
    -[StoreDownload setValue:forMetadataKey:](v4, "setValue:forMetadataKey:", v41, SSDownloadMetadataKeyHasHDR);
    -[StoreDownload setValue:forMetadataKey:](v4, "setValue:forMetadataKey:", v42, SSDownloadMetadataKeyIsHLS);
    -[StoreDownload setValue:forMetadataKey:](v4, "setValue:forMetadataKey:", v43, SSDownloadMetadataKeyIsPremium);
    -[StoreDownload setValue:forMetadataKey:](v4, "setValue:forMetadataKey:", v44, SSDownloadMetadataKeyHas4K);
    -[StoreDownload setValue:forMetadataKey:](v4, "setValue:forMetadataKey:", v45, SSDownloadMetadataKeyHasDolbyVision);
    -[StoreDownload setValue:forMetadataKey:](v4, "setValue:forMetadataKey:", v46, SSDownloadMetadataKeyHLSPlaylistURL);
  }

  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___StoreDownload;
  -[StoreDownload dealloc](&v3, "dealloc");
}

- (NSArray)assets
{
  objc_super v3 = (NSArray *)+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  id v4 = -[StoreDownload primaryAssetDictionary](self, "primaryAssetDictionary");
  if (v4 || (id v4 = -[StoreDownload dictionary](self, "dictionary")) != 0LL)
  {
    id v5 = -[StoreDownload _newDeltaPackageAssetsWithAssetDictionary:]( self,  "_newDeltaPackageAssetsWithAssetDictionary:",  v4);
    -[NSArray addObjectsFromArray:](v3, "addObjectsFromArray:", v5);

    id v6 = -[StoreDownload _newPrimaryAssetsWithAssetDictionary:assetType:]( self,  "_newPrimaryAssetsWithAssetDictionary:assetType:",  v4,  SSDownloadAssetTypeMedia);
    -[NSArray addObjectsFromArray:](v3, "addObjectsFromArray:", v6);

    uint64_t v7 = -[NSArray count](v3, "count");
    if (v7 >= 1)
    {
      uint64_t v8 = v7;
      for (uint64_t i = 0LL; i != v8; ++i)
        objc_msgSend( -[NSArray objectAtIndex:](v3, "objectAtIndex:", i),  "setValue:forProperty:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", i),  @"asset_order");
    }
  }

  id v10 = -[StoreDownload fullSizeImageURL](self, "fullSizeImageURL");
  if (objc_msgSend(objc_msgSend(v10, "host"), "length"))
  {
    id v11 = -[StoreDownload _newAssetWithURL:assetType:]( self,  "_newAssetWithURL:assetType:",  v10,  SSDownloadAssetTypeArtwork);
    -[NSArray addObject:](v3, "addObject:", v11);
  }

  id v12 = -[StoreDownload podcastFeedURL](self, "podcastFeedURL");
  if (objc_msgSend(objc_msgSend(v12, "host"), "length"))
  {
    id v13 = -[StoreDownload _newAssetWithURL:assetType:]( self,  "_newAssetWithURL:assetType:",  v12,  SSDownloadAssetTypeXMLFeed);
    -[NSArray addObject:](v3, "addObject:", v13);
  }

  id v14 = -[StoreDownload transitMapDataURL](self, "transitMapDataURL");
  if (objc_msgSend(objc_msgSend(v14, "host"), "length"))
  {
    id v15 = -[StoreDownload _newAssetWithURL:assetType:]( self,  "_newAssetWithURL:assetType:",  v14,  SSDownloadAssetTypeTransitMapsData);
    -[NSArray addObject:](v3, "addObject:", v15);
  }

  id v16 = -[StoreDownload thumbnailImageCollection](self, "thumbnailImageCollection");
  id v17 = [v16 imagesForKind:SSItemArtworkKindNewsstandIcon];
  if ([v17 count])
  {
    id v18 = objc_msgSend(objc_msgSend(v17, "lastObject"), "URL");
    if (objc_msgSend(objc_msgSend(v18, "host"), "length"))
    {
      id v19 = -[StoreDownload _newAssetWithURL:assetType:]( self,  "_newAssetWithURL:assetType:",  v18,  SSDownloadAssetTypeNewsstandArtwork);
      -[NSArray addObject:](v3, "addObject:", v19);
    }
  }

  return v3;
}

- (NSNumber)matchedStatus
{
  objc_super v3 = (NSNumber *)-[StoreDownload valueForMetadataKey:](self, "valueForMetadataKey:", @"matched-status");
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    return v3;
  }
  else {
    return (NSNumber *)-[StoreDownload _copyPinfValueWithField:](self, "_copyPinfValueWithField:", 0LL);
  }
}

- (NSNumber)redownloadedStatus
{
  objc_super v3 = (NSNumber *)-[StoreDownload valueForMetadataKey:](self, "valueForMetadataKey:", @"redownloaded-status");
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    return v3;
  }
  else {
    return (NSNumber *)-[StoreDownload _copyPinfValueWithField:](self, "_copyPinfValueWithField:", 1LL);
  }
}

- (NSNumber)purchaserAccountIdentifier
{
  result = (NSNumber *)-[StoreDownload _copySinfValueWithField:](self, "_copySinfValueWithField:", 2LL);
  if (!result) {
    return (NSNumber *) -[StoreDownload _copySinfValueFromEpubRightsDataWithField:]( self,  "_copySinfValueFromEpubRightsDataWithField:",  2LL);
  }
  return result;
}

- (NSNumber)downloaderAccountIdentifier
{
  result = (NSNumber *)-[StoreDownload _copySinfValueWithField:](self, "_copySinfValueWithField:", 3LL);
  if (!result) {
    return (NSNumber *) -[StoreDownload _copySinfValueFromEpubRightsDataWithField:]( self,  "_copySinfValueFromEpubRightsDataWithField:",  3LL);
  }
  return result;
}

- (NSNumber)familyAccountIdentifier
{
  result = (NSNumber *)-[StoreDownload _copySinfValueWithField:](self, "_copySinfValueWithField:", 4LL);
  if (!result) {
    return (NSNumber *) -[StoreDownload _copySinfValueFromEpubRightsDataWithField:]( self,  "_copySinfValueFromEpubRightsDataWithField:",  4LL);
  }
  return result;
}

- (BOOL)writeToFile:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  uint64_t v8 = +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  -[StoreDownload dictionary](self, "dictionary"),  200LL,  0LL,  a5);
  if (v8) {
    LOBYTE(v8) = -[NSData writeToFile:options:error:](v8, "writeToFile:options:error:", a3, a4, a5);
  }
  return (char)v8;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___StoreDownload;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: %llu / %@",  -[StoreDownload description](&v3, "description"),  -[StoreDownload itemIdentifier](self, "itemIdentifier"),  -[StoreDownload transactionIdentifier](self, "transactionIdentifier"));
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = objc_opt_class(self);
  if (v5 != objc_opt_class(a3)) {
    return 0;
  }
  id v6 = -[StoreDownload itemIdentifier](self, "itemIdentifier");
  if (v6 != [a3 itemIdentifier]) {
    return 0;
  }
  id v7 = -[StoreDownload transactionIdentifier](self, "transactionIdentifier");
  if (v7 == [a3 transactionIdentifier]) {
    return 1;
  }
  else {
    return objc_msgSend( -[StoreDownload transactionIdentifier](self, "transactionIdentifier"),  "isEqual:",  objc_msgSend(a3, "transactionIdentifier"));
  }
}

- (id)newDownloadProperties
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___StoreDownload;
  id v3 = -[StoreDownload newDownloadProperties](&v7, "newDownloadProperties");
  uint64_t v4 = -[StoreDownload matchedStatus](self, "matchedStatus");
  if (v4) {
    [v3 setObject:v4 forKey:SSDownloadPropertyStoreMatchStatus];
  }
  uint64_t v5 = -[StoreDownload redownloadedStatus](self, "redownloadedStatus");
  if (v5) {
    [v3 setObject:v5 forKey:SSDownloadPropertyStoreRedownloadStatus];
  }
  return v3;
}

- (id)_copyPinfValueWithField:(int64_t)a3
{
  id v4 = -[StoreDownload sinfs](self, "sinfs");
  if (![v4 count]) {
    return 0LL;
  }
  uint64_t v5 = -[DownloadDRM initWithSinfArray:](objc_alloc(&OBJC_CLASS___DownloadDRM), "initWithSinfArray:", v4);
  id v6 = -[DownloadDRM pinfsArray](v5, "pinfsArray");
  if (v6) {
    id v7 = -[SinfsArray copyValueForField:error:](v6, "copyValueForField:error:", a3, 0LL);
  }
  else {
    id v7 = 0LL;
  }

  return v7;
}

- (id)_copySinfValueWithField:(int64_t)a3
{
  id v4 = -[StoreDownload sinfs](self, "sinfs");
  if (![v4 count]) {
    return 0LL;
  }
  uint64_t v5 = -[DownloadDRM initWithSinfArray:](objc_alloc(&OBJC_CLASS___DownloadDRM), "initWithSinfArray:", v4);
  id v6 = -[DownloadDRM sinfsArray](v5, "sinfsArray");
  if (v6) {
    id v7 = -[SinfsArray copyValueForField:error:](v6, "copyValueForField:error:", a3, 0LL);
  }
  else {
    id v7 = 0LL;
  }

  return v7;
}

- (id)_copySinfValueFromEpubRightsDataWithField:(int64_t)a3
{
  id v4 = -[StoreDownload _epubRightsSinfData](self, "_epubRightsSinfData");
  if (!v4) {
    return 0LL;
  }
  id v8 = v4;
  uint64_t v5 = -[SinfsArray initWithSINFs:]( objc_alloc(&OBJC_CLASS___SinfsArray),  "initWithSINFs:",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));
  id v6 = -[SinfsArray copyValueForField:error:](v5, "copyValueForField:error:", a3, 0LL);

  return v6;
}

- (id)_epubRightsSinfData
{
  epubRightsSinfData = self->_epubRightsSinfData;
  if (!epubRightsSinfData)
  {
    id v4 = -[EpubRightsDataParser initWithXMLData:]( objc_alloc(&OBJC_CLASS___EpubRightsDataParser),  "initWithXMLData:",  -[StoreDownload epubRightsData](self, "epubRightsData"));
    self->_epubRightsSinfData = -[EpubRightsDataParser sinfData](v4, "sinfData");

    epubRightsSinfData = self->_epubRightsSinfData;
  }

  return epubRightsSinfData;
}

- (id)_newAssetPropertiesWithStoreDictionary:(id)a3 assetType:(id)a4
{
  id v7 = [a3 objectForKey:SSDownloadMetadataKeyURL];
  if (!v7) {
    id v7 = [a3 objectForKey:SSDownloadMetadataKeyURL2];
  }
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) == 0 || ![v7 length]) {
    return 0LL;
  }
  uint64_t v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", a4, @"asset_type");
  -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v7, @"url");
  id v10 = [a3 objectForKey:SSDownloadMetadataKeyDownloadKey];
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0) {
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v10, @"store_download_key");
  }
  uint64_t v12 = SSDownloadMetadataKeyFileExtension;
  id v13 = [a3 objectForKey:SSDownloadMetadataKeyFileExtension];
  uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0
    || [a4 isEqualToString:SSDownloadAssetTypeMedia]
    && (id v13 = objc_msgSend(objc_msgSend(a3, "objectForKey:", @"metadata"), "objectForKey:", v12),
        uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSString),
        (objc_opt_isKindOfClass(v13, v15) & 1) != 0))
  {
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v13, @"path_extension");
  }

  uint64_t v16 = SSDownloadMetadataKeyIsZipStreamable;
  id v17 = [a3 objectForKey:SSDownloadMetadataKeyIsZipStreamable];
  if (!v17) {
    id v17 = -[StoreDownload valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", v16, 0LL);
  }
  uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0) {
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v17, @"is_zip_streamable");
  }
  uint64_t v19 = SSDownloadMetadataKeyUncompressedSize;
  id v20 = [a3 objectForKey:SSDownloadMetadataKeyUncompressedSize];
  if (!v20) {
    id v20 = -[StoreDownload valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", v19, 0LL);
  }
  if ((objc_opt_respondsToSelector(v20, "unsignedLongLongValue") & 1) != 0) {
    -[NSMutableDictionary setObject:forKey:]( v9,  "setObject:forKey:",  +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v20 unsignedLongLongValue]),  @"uncompressed_size");
  }
  id v21 = [a3 objectForKey:SSDownloadMetadataKeyAssetInfo];
  uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v21, v22) & 1) != 0) {
    id v23 = v21;
  }
  else {
    id v23 = a3;
  }
  if (v23)
  {
    id v24 = [v23 objectForKey:SSDownloadMetadataKeyAssetFileSize];
    uint64_t v25 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v24, v25) & 1) != 0) {
      -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v24, @"bytes_total");
    }
    else {
      id v24 = 0LL;
    }
    id v26 = [v23 objectForKey:SSDownloadMetadataKeyAssetFlavor];
    uint64_t v27 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v26, v27) & 1) != 0) {
      -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v26, @"store_flavor");
    }
  }

  else
  {
    id v24 = 0LL;
  }

  id v28 = [a3 objectForKey:SSDownloadMetadataKeyVariantIdentifier];
  uint64_t v29 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v28, v29) & 1) != 0) {
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v28, @"variant_id");
  }
  id v30 = [a3 objectForKey:SSDownloadMetadataKeyHashChunks];
  uint64_t v31 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v30, v31) & 1) != 0)
  {
    uint64_t v32 = (NSArray *)[v30 objectForKey:SSDownloadMetadataKeyHashChunkHashes];
    id v24 = [v30 objectForKey:SSDownloadMetadataKeyHashChunkSize];
  }

  else
  {
    id v33 = [a3 objectForKey:SSDownloadMetadataKeyMD5];
    uint64_t v34 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v33, v34) & 1) != 0) {
      uint64_t v32 = +[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v33);
    }
    else {
      uint64_t v32 = 0LL;
    }
  }

  uint64_t v35 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v24, v35) & 1) != 0) {
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v24, @"bytes_to_hash");
  }
  uint64_t v36 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v32, v36) & 1) != 0)
  {
    uint64_t v37 = +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v32,  200LL,  0LL,  0LL);
    if (v37) {
      -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v37, @"hash_array");
    }
  }

  id v38 = [a3 objectForKey:SSDownloadMetadataKeySINFs];
  uint64_t v39 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v38, v39) & 1) != 0 && [v38 count])
  {
    uint64_t v40 = -[DownloadDRM initWithSinfArray:](objc_alloc(&OBJC_CLASS___DownloadDRM), "initWithSinfArray:", v38);
    if (-[DownloadDRM isDRMFree](v40, "isDRMFree")) {
      -[NSMutableDictionary setObject:forKey:]( v9,  "setObject:forKey:",  +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL),  @"is_drm_free");
    }
    uint64_t v41 = +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v38,  200LL,  0LL,  0LL);
    if (-[NSData length](v41, "length")) {
      -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v41, @"sinfs_data");
    }
  }

  id v42 = [a3 objectForKey:SSDownloadMetadataKeyIsHLS];
  uint64_t v43 = objc_opt_class(&OBJC_CLASS___NSNumber);
  id v44 = [a3 objectForKey:v12];
  uint64_t v45 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v44, v45) & 1) != 0) {
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v44, @"path_extension");
  }
  uint64_t v46 = (NSNull *)[a3 objectForKey:SSDownloadMetadataKeyInitialODRSize];
  uint64_t v47 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v46, v47) & 1) == 0) {
    uint64_t v46 = +[NSNull null](&OBJC_CLASS___NSNull, "null");
  }
  -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v46, @"initial_odr_size");
  return v9;
}

- (id)_newAssetWithURL:(id)a3 assetType:(id)a4
{
  uint64_t v5 = -[SSMutableURLRequestProperties initWithURL:]( objc_alloc(&OBJC_CLASS___SSMutableURLRequestProperties),  "initWithURL:",  a3);
  -[SSMutableURLRequestProperties setITunesStoreRequest:](v5, "setITunesStoreRequest:", 1LL);
  id v6 = -[DownloadAsset initWithURLRequestProperties:]( objc_alloc(&OBJC_CLASS___DownloadAsset),  "initWithURLRequestProperties:",  v5);
  -[DownloadAsset setValue:forProperty:](v6, "setValue:forProperty:", a4, @"asset_type");

  return v6;
}

- (id)_newDeltaPackageAssetsWithAssetDictionary:(id)a3
{
  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v6 = [a3 objectForKey:SSDownloadMetadataKeyDeltaPackages];
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    uint64_t v8 = objc_autoreleasePoolPush();
    id v9 = +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  -[StoreDownload bundleIdentifier](self, "bundleIdentifier"));
    if ([v9 purchaserDSID])
    {
      id v10 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
      if (!v10) {
        id v10 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      }
      unsigned int v11 = [v10 shouldLog];
      else {
        LODWORD(v12) = v11;
      }
      id v13 = (os_log_s *)[v10 OSLogObject];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
        uint64_t v12 = v12;
      }
      else {
        v12 &= 2u;
      }
      if ((_DWORD)v12)
      {
        int v51 = 138412546;
        uint64_t v52 = objc_opt_class(self);
        __int16 v53 = 2112;
        id v54 = -[StoreDownload bundleIdentifier](self, "bundleIdentifier");
        uint64_t v14 = _os_log_send_and_compose_impl( v12,  0LL,  0LL,  0LL,  &_mh_execute_header,  v13,  1LL,  "[%@]: Enumerating delta packages for: %@",  &v51,  22);
        if (v14)
        {
          uint64_t v15 = (void *)v14;
          uint64_t v16 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v14, 4LL);
          free(v15);
          uint64_t v43 = v16;
          SSFileLog(v10, @"%@");
        }
      }

      __int128 v48 = 0u;
      __int128 v49 = 0u;
      __int128 v46 = 0u;
      __int128 v47 = 0u;
      id v17 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v46, v50, 16, v43);
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v47;
        while (2)
        {
          for (uint64_t i = 0LL; i != v18; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v47 != v19) {
              objc_enumerationMutation(v6);
            }
            uint64_t v21 = *(void *)(*((void *)&v46 + 1) + 8LL * (void)i);
            uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSDictionary);
            if ((objc_opt_isKindOfClass(v21, v22) & 1) != 0
              && -[StoreDownload _patchPackageDictionary:matchesInstallApplication:]( self,  "_patchPackageDictionary:matchesInstallApplication:",  v21,  v9))
            {
              id v23 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
              if (!v23) {
                id v23 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
              }
              unsigned int v24 = [v23 shouldLog];
              else {
                LODWORD(v25) = v24;
              }
              id v26 = (os_log_s *)[v23 OSLogObject];
              if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO)) {
                uint64_t v25 = v25;
              }
              else {
                v25 &= 2u;
              }
              if ((_DWORD)v25)
              {
                uint64_t v27 = objc_opt_class(self);
                id v28 = -[StoreDownload bundleIdentifier](self, "bundleIdentifier");
                int v51 = 138412546;
                uint64_t v52 = v27;
                __int16 v53 = 2112;
                id v54 = v28;
                LODWORD(v45) = 22;
                uint64_t v29 = _os_log_send_and_compose_impl( v25,  0LL,  0LL,  0LL,  &_mh_execute_header,  v26,  1LL,  "[%@]: Found delta package for: %@",  &v51,  v45);
                if (v29)
                {
                  id v30 = (void *)v29;
                  uint64_t v31 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v29,  4LL);
                  free(v30);
                  id v44 = v31;
                  SSFileLog(v23, @"%@");
                }
              }

              id v32 = -[StoreDownload _newPrimaryAssetsWithAssetDictionary:assetType:]( self,  "_newPrimaryAssetsWithAssetDictionary:assetType:",  v21,  SSDownloadAssetTypeDeltaPackage,  v44);
              if (v32)
              {
                id v33 = v32;
                -[NSMutableArray addObjectsFromArray:](v5, "addObjectsFromArray:", v32);
              }

              else
              {
                id v35 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
                if (!v35) {
                  id v35 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
                }
                unsigned int v36 = [v35 shouldLog];
                else {
                  LODWORD(v37) = v36;
                }
                id v38 = (os_log_s *)[v35 OSLogObject];
                if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT)) {
                  uint64_t v37 = v37;
                }
                else {
                  v37 &= 2u;
                }
                if ((_DWORD)v37)
                {
                  uint64_t v39 = objc_opt_class(self);
                  id v40 = -[StoreDownload bundleIdentifier](self, "bundleIdentifier");
                  int v51 = 138412546;
                  uint64_t v52 = v39;
                  __int16 v53 = 2112;
                  id v54 = v40;
                  LODWORD(v45) = 22;
                  uint64_t v41 = _os_log_send_and_compose_impl( v37,  0LL,  0LL,  0LL,  &_mh_execute_header,  v38,  0LL,  "[%@]: Delta had no assets for: %@",  &v51,  v45);
                  if (v41)
                  {
                    id v42 = (void *)v41;
                    +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v41,  4LL);
                    free(v42);
                    SSFileLog(v35, @"%@");
                  }
                }
              }

              goto LABEL_37;
            }
          }

          id v18 = [v6 countByEnumeratingWithState:&v46 objects:v50 count:16];
          if (v18) {
            continue;
          }
          break;
        }
      }
    }

- (id)_newPrimaryAssetsWithAssetDictionary:(id)a3 assetType:(id)a4
{
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v8 = -[StoreDownload _newAssetPropertiesWithStoreDictionary:assetType:]( self,  "_newAssetPropertiesWithStoreDictionary:assetType:",  a3,  a4);
  if (v8)
  {
    id v9 = v8;
    id v10 = [a3 objectForKey:@"local-server-info"];
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0) {
      objc_msgSend( v9,  "setObject:forKey:",  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1),  @"is_local_cache_server");
    }
    if (![v9 objectForKey:@"path_extension"])
    {
      id v12 = -[StoreDownload fileExtension](self, "fileExtension");
      if (v12) {
        [v9 setObject:v12 forKey:@"path_extension"];
      }
    }

    id v13 = objc_alloc_init(&OBJC_CLASS___DownloadAsset);
    -[DownloadAsset setValuesWithDictionary:](v13, "setValuesWithDictionary:", v9);
    -[NSMutableArray addObject:](v7, "addObject:", v13);
  }

  return v7;
}

- (BOOL)_patchPackageDictionary:(id)a3 matchesInstallApplication:(id)a4
{
  id v7 = [a4 externalVersionIdentifier];
  id v8 = [a3 objectForKey:SSDownloadMetadataKeyPriorVersionExternalIdentifier];
  unsigned int v9 = [v7 isEqual:v8];
  if (v9)
  {
    id v10 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v10) {
      id v10 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v11 = [v10 shouldLog];
    else {
      LODWORD(v12) = v11;
    }
    id v13 = (os_log_s *)[v10 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      uint64_t v12 = v12;
    }
    else {
      v12 &= 2u;
    }
    if ((_DWORD)v12)
    {
      int v30 = 138413058;
      uint64_t v31 = objc_opt_class(self);
      __int16 v32 = 2112;
      id v33 = [a4 bundleIdentifier];
      __int16 v34 = 2112;
      id v35 = v7;
      __int16 v36 = 2112;
      id v37 = v8;
      uint64_t v14 = _os_log_send_and_compose_impl( v12,  0LL,  0LL,  0LL,  &_mh_execute_header,  v13,  2LL,  "[%@]: Found version match for %@: %@ -> %@",  &v30,  42);
      if (v14)
      {
        uint64_t v15 = (void *)v14;
        uint64_t v16 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v14, 4LL);
        free(v15);
        id v28 = v16;
        SSFileLog(v10, @"%@");
      }
    }

    id v17 = objc_msgSend(a4, "applicationVariant", v28);
    id v18 = [a3 objectForKey:SSDownloadMetadataKeyVariantIdentifier];
    if (v17 == v18 || (unsigned int v9 = [v17 isEqual:v18]) != 0)
    {
      id v19 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
      if (!v19) {
        id v19 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      }
      unsigned int v20 = [v19 shouldLog];
      else {
        LODWORD(v21) = v20;
      }
      uint64_t v22 = (os_log_s *)[v19 OSLogObject];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        uint64_t v21 = v21;
      }
      else {
        v21 &= 2u;
      }
      if ((_DWORD)v21)
      {
        uint64_t v23 = objc_opt_class(self);
        id v24 = [a4 bundleIdentifier];
        int v30 = 138413058;
        uint64_t v31 = v23;
        __int16 v32 = 2112;
        id v33 = v24;
        __int16 v34 = 2112;
        id v35 = v17;
        __int16 v36 = 2112;
        id v37 = v18;
        LODWORD(v29) = 42;
        uint64_t v25 = _os_log_send_and_compose_impl( v21,  0LL,  0LL,  0LL,  &_mh_execute_header,  v22,  2LL,  "[%@]: Found variant match for %@: %@ -> %@",  &v30,  v29);
        if (v25)
        {
          id v26 = (void *)v25;
          +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v25, 4LL);
          free(v26);
          SSFileLog(v19, @"%@");
        }
      }

      LOBYTE(v9) = 1;
    }
  }

  return v9;
}

- (id)copyJobActivity
{
  id v3 = objc_alloc_init((Class)ISWeakLinkedClassForString(@"ASDJobActivity", 29LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  -[StoreDownload artistIdentifier](self, "artistIdentifier")));
  [v3 setArtistID:v4];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[StoreDownload artistName](self, "artistName"));
  [v3 setArtistName:v5];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[StoreDownload bundleIdentifier](self, "bundleIdentifier"));
  [v3 setBundleID:v6];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[StoreDownload redownloadActionParameters](self, "redownloadActionParameters"));
  [v3 setBuyParams:v7];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[StoreDownload cancelDownloadURL](self, "cancelDownloadURL"));
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 absoluteString]);
  [v3 setCancelDownloadURL:v9];

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[StoreDownload collectionName](self, "collectionName"));
  [v3 setCollectionName:v10];

  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[StoreDownload enableExtensions](self, "enableExtensions"));
  [v3 setEnableExtensions:v11];

  objc_msgSend(v3, "setExplicitContent:", -[StoreDownload isExplicitContent](self, "isExplicitContent"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[StoreDownload genre](self, "genre"));
  [v3 setGenre:v12];

  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  -[StoreDownload genreIdentifier](self, "genreIdentifier")));
  [v3 setGenreID:v13];

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  -[StoreDownload itemIdentifier](self, "itemIdentifier")));
  [v3 setItemID:v14];

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[StoreDownload kind](self, "kind"));
  [v3 setKind:v15];

  objc_msgSend(v3, "setHasMessagesExtension:", -[StoreDownload hasMessagesExtension](self, "hasMessagesExtension"));
  objc_msgSend(v3, "setLaunchProhibited:", -[StoreDownload launchProhibited](self, "launchProhibited"));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[StoreDownload messagesArtworkURL](self, "messagesArtworkURL"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 absoluteString]);
  [v3 setMessagesArtworkURL:v17];

  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[StoreDownload purchaseDate](self, "purchaseDate"));
  [v3 setPurchaseDate:v18];

  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[StoreDownload releaseDate](self, "releaseDate"));
  [v3 setReleaseDate:v19];

  unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue(-[StoreDownload downloadKey](self, "downloadKey"));
  [v3 setStoreDownloadKey:v20];

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[StoreDownload transactionIdentifier](self, "transactionIdentifier"));
  [v3 setStoreTransactionID:v21];

  objc_msgSend(v3, "setSoftwareIconNeedsShine:", -[StoreDownload artworkIsPrerendered](self, "artworkIsPrerendered"));
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[StoreDownload thumbnailImageURL](self, "thumbnailImageURL"));
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 absoluteString]);
  [v3 setThumbnailURL:v23];

  id v24 = (void *)objc_claimAutoreleasedReturnValue(-[StoreDownload title](self, "title"));
  [v3 setTitle:v24];

  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( -[StoreDownload valueForMetadataKey:]( self,  "valueForMetadataKey:",  SSDownloadMetadataKeyAppReceiptData));
  uint64_t v26 = objc_opt_class(&OBJC_CLASS___NSData);
  if ((objc_opt_isKindOfClass(v25, v26) & 1) != 0) {
    [v3 setAppReceiptData:v25];
  }
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( -[StoreDownload valueForMetadataKey:]( self,  "valueForMetadataKey:",  SSDownloadMetadataKeyBetaExternalVersionIdentifier));

  uint64_t v28 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v27, v28) & 1) != 0) {
    [v3 setBetaExternalVersionIdentifier:v27];
  }
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( -[StoreDownload valueForMetadataKey:]( self,  "valueForMetadataKey:",  SSDownloadMetadataKeyBundleVersion));

  uint64_t v30 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v29, v30) & 1) != 0) {
    [v3 setBundleVersion:v29];
  }
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue( -[StoreDownload valueForMetadataKey:]( self,  "valueForMetadataKey:",  SSDownloadMetadataKeyCancelIfDuplicate));

  if ((objc_opt_respondsToSelector(v31, "BOOLValue") & 1) != 0) {
    objc_msgSend(v3, "setCancelIfDuplicate:", objc_msgSend(v31, "BOOLValue"));
  }
  __int16 v32 = (void *)objc_claimAutoreleasedReturnValue( -[StoreDownload valueForMetadataKey:]( self,  "valueForMetadataKey:",  SSDownloadMetadataKeyIsPurchaseRedownload));

  if ((objc_opt_respondsToSelector(v32, "BOOLValue") & 1) != 0) {
    objc_msgSend(v3, "setIsPurchasedRedownload:", objc_msgSend(v32, "BOOLValue"));
  }
  id v33 = (void *)objc_claimAutoreleasedReturnValue( -[StoreDownload valueForMetadataKey:]( self,  "valueForMetadataKey:",  SSDownloadMetadataKeyIAdAttribution));

  uint64_t v34 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v33, v34) & 1) != 0) {
    [v3 setIAdAttribution:v33];
  }
  id v35 = (void *)objc_claimAutoreleasedReturnValue( -[StoreDownload valueForMetadataKey:]( self,  "valueForMetadataKey:",  SSDownloadMetadataKeyIAdConversionDate));

  uint64_t v36 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v35, v36) & 1) != 0)
  {
    id v37 = -[StoreDownload _newDateFormatter](self, "_newDateFormatter");
    id v38 = (void *)objc_claimAutoreleasedReturnValue([v37 dateFromString:v35]);
    if (v38) {
      [v3 setIAdConversionDate:v38];
    }
  }

  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue( -[StoreDownload valueForMetadataKey:]( self,  "valueForMetadataKey:",  SSDownloadMetadataKeyIAdImpressionDate));

  uint64_t v40 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v39, v40) & 1) != 0)
  {
    id v41 = -[StoreDownload _newDateFormatter](self, "_newDateFormatter");
    id v42 = (void *)objc_claimAutoreleasedReturnValue([v41 dateFromString:v39]);
    if (v42) {
      [v3 setIAdImpressionDate:v42];
    }
  }

  uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(-[StoreDownload valueForMetadataKey:](self, "valueForMetadataKey:", SSDownloadPropertyIsInStoreQueue));

  if ((objc_opt_respondsToSelector(v43, "BOOLValue") & 1) != 0) {
    objc_msgSend(v3, "setIsInQueue:", objc_msgSend(v43, "BOOLValue"));
  }
  id v44 = (void *)objc_claimAutoreleasedReturnValue(-[StoreDownload valueForMetadataKey:](self, "valueForMetadataKey:", SSDownloadMetadataKeyStoreFrontID));

  if ((objc_opt_respondsToSelector(v44, "stringValue") & 1) != 0)
  {
    uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue([v44 stringValue]);
    [v3 setStorefront:v45];
  }

  __int128 v46 = (void *)objc_claimAutoreleasedReturnValue(-[StoreDownload valueForMetadataKey:](self, "valueForMetadataKey:", SSDownloadMetadataKeyRating));

  uint64_t v47 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v46, v47) & 1) != 0)
  {
    id v48 = v46;
    __int128 v49 = (void *)objc_claimAutoreleasedReturnValue([v48 objectForKey:@"label"]);
    uint64_t v50 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v49, v50) & 1) != 0) {
      [v3 setRatingLabel:v49];
    }
    int v51 = (void *)objc_claimAutoreleasedReturnValue([v48 objectForKey:@"rank"]);
    uint64_t v52 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v51, v52) & 1) != 0) {
      [v3 setRatingRank:v51];
    }
  }

  __int16 v53 = (void *)objc_claimAutoreleasedReturnValue( -[StoreDownload valueForMetadataKey:]( self,  "valueForMetadataKey:",  SSDownloadMetadataKeySoftwareExternalVersionID));

  uint64_t v54 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v53, v54) & 1) != 0) {
    [v3 setSoftwareVersionExternalIdentifier:v53];
  }
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[StoreDownload valueForMetadataKey:](self, "valueForMetadataKey:", SSDownloadMetadataKeyStoreCohort));

  uint64_t v56 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v55, v56) & 1) != 0) {
    [v3 setStoreCohort:v55];
  }
  v57 = (void *)objc_claimAutoreleasedReturnValue( -[StoreDownload valueForMetadataKey:]( self,  "valueForMetadataKey:",  SSDownloadMetadataKeyVariantIdentifier));

  uint64_t v58 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v57, v58) & 1) != 0) {
    [v3 setVariantID:v57];
  }
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[StoreDownload assets](self, "assets"));
  id v60 = -[StoreDownload _newAssetArrayWithDownloadAssets:](self, "_newAssetArrayWithDownloadAssets:", v59);

  [v3 setAssets:v60];
  return v3;
}

- (id)_newAssetArrayWithDownloadAssets:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      unsigned int v9 = 0LL;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * (void)v9), "copyJobAsset", (void)v13);
        -[NSMutableArray addObject:](v4, "addObject:", v10);

        unsigned int v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v7);
  }

  id v11 = -[NSMutableArray copy](v4, "copy");
  return v11;
}

- (id)_newDateFormatter
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  -[NSDateFormatter setDateFormat:](v2, "setDateFormat:", @"yyyy-MM-dd'T'HH:mm:ss'Z'");
  -[NSDateFormatter setLenient:](v2, "setLenient:", 1LL);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneForSecondsFromGMT:](&OBJC_CLASS___NSTimeZone, "timeZoneForSecondsFromGMT:", 0LL));
  -[NSDateFormatter setTimeZone:](v2, "setTimeZone:", v3);

  return v2;
}

@end