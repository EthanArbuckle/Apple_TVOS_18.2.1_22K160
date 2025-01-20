@interface IPodLibraryItem
+ (unsigned)mediaTypeForStoreDownload:(id)a3;
- (BOOL)hasItemArtwork;
- (BOOL)isDownloading;
- (IPodLibraryItem)init;
- (NSArray)chapters;
- (NSData)itemArtworkData;
- (NSDictionary)additionalEntityProperties;
- (NSString)itemDownloadIdentifier;
- (NSString)itemMediaPath;
- (StoreDownload)itemMetadata;
- (double)durationInSeconds;
- (id)_copyChapterVideoTracksForAsset:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)assetType;
- (int64_t)downloadType;
- (int64_t)libraryPersistentIdentifier;
- (int64_t)protectionType;
- (int64_t)updateType;
- (void)dealloc;
- (void)loadPropertiesFromMediaPath:(id)a3 includeTracks:(BOOL)a4;
- (void)setAdditionalEntityProperties:(id)a3;
- (void)setAssetType:(int64_t)a3;
- (void)setChapters:(id)a3;
- (void)setDownloadType:(int64_t)a3;
- (void)setDurationInSeconds:(double)a3;
- (void)setItemArtworkData:(id)a3;
- (void)setItemDownloadIdentifier:(id)a3;
- (void)setItemMediaPath:(id)a3;
- (void)setItemMetadata:(id)a3;
- (void)setLibraryPersistentIdentifier:(int64_t)a3;
- (void)setProtectionType:(int64_t)a3;
- (void)setUpdateType:(int64_t)a3;
- (void)setValue:(id)a3 forAdditionalEntityProperty:(id)a4;
@end

@implementation IPodLibraryItem

- (IPodLibraryItem)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___IPodLibraryItem;
  v2 = -[IPodLibraryItem init](&v4, "init");
  if (v2) {
    v2->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.itunesstored.IPodLibraryItem", 0LL);
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___IPodLibraryItem;
  -[IPodLibraryItem dealloc](&v3, "dealloc");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000CD7E4;
  block[3] = &unk_10034DBE8;
  block[4] = v5;
  block[5] = self;
  block[6] = a3;
  dispatch_sync(dispatchQueue, block);
  return v5;
}

+ (unsigned)mediaTypeForStoreDownload:(id)a3
{
  id v4 = [a3 kind];
  id v5 = [a3 podcastType];
  unsigned int v6 = [v5 isEqualToString:SSDownloadPodcastTypeITunesU];
  if ([v4 isEqualToString:SSDownloadKindPodcast])
  {
    BOOL v7 = v6 == 0;
    unsigned int v8 = 4;
    unsigned int v9 = 32;
  }

  else if ([v4 isEqualToString:SSDownloadKindVideoPodcast])
  {
    BOOL v7 = v6 == 0;
    unsigned int v8 = 256;
    unsigned int v9 = 4096;
  }

  else
  {
    BOOL v7 = [v4 isEqualToString:SSDownloadKindMusicVideo] == 0;
    unsigned int v8 = 8;
    unsigned int v9 = 1032;
  }

  if (v7) {
    return v8;
  }
  else {
    return v9;
  }
}

- (NSDictionary)additionalEntityProperties
{
  uint64_t v6 = 0LL;
  BOOL v7 = &v6;
  uint64_t v8 = 0x3052000000LL;
  unsigned int v9 = sub_1000CDA9C;
  v10 = sub_1000CDAAC;
  uint64_t v11 = 0LL;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000CDAB8;
  v5[3] = &unk_10034B2D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  objc_super v3 = (NSDictionary *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int64_t)assetType
{
  uint64_t v6 = 0LL;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  uint64_t v9 = 0LL;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000CDB7C;
  v5[3] = &unk_10034B2D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSArray)chapters
{
  uint64_t v6 = 0LL;
  BOOL v7 = &v6;
  uint64_t v8 = 0x3052000000LL;
  uint64_t v9 = sub_1000CDA9C;
  v10 = sub_1000CDAAC;
  uint64_t v11 = 0LL;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000CDC54;
  v5[3] = &unk_10034B2D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  int64_t v3 = (NSArray *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int64_t)downloadType
{
  uint64_t v6 = 0LL;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  uint64_t v9 = 0LL;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000CDD18;
  v5[3] = &unk_10034B2D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (double)durationInSeconds
{
  uint64_t v6 = 0LL;
  BOOL v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000LL;
  uint64_t v9 = 0LL;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000CDDBC;
  v5[3] = &unk_10034B2D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isDownloading
{
  return !-[IPodLibraryItem itemMediaPath](self, "itemMediaPath")
      && -[IPodLibraryItem updateType](self, "updateType") == 0;
}

- (BOOL)hasItemArtwork
{
  uint64_t v6 = 0LL;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000CDE9C;
  v5[3] = &unk_10034DC10;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSData)itemArtworkData
{
  uint64_t v6 = 0LL;
  BOOL v7 = &v6;
  uint64_t v8 = 0x3052000000LL;
  char v9 = sub_1000CDA9C;
  v10 = sub_1000CDAAC;
  uint64_t v11 = 0LL;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000CDFA0;
  v5[3] = &unk_10034B2D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = (NSData *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSString)itemDownloadIdentifier
{
  uint64_t v6 = 0LL;
  BOOL v7 = &v6;
  uint64_t v8 = 0x3052000000LL;
  char v9 = sub_1000CDA9C;
  v10 = sub_1000CDAAC;
  uint64_t v11 = 0LL;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000CE098;
  v5[3] = &unk_10034B2D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSString)itemMediaPath
{
  uint64_t v6 = 0LL;
  BOOL v7 = &v6;
  uint64_t v8 = 0x3052000000LL;
  char v9 = sub_1000CDA9C;
  v10 = sub_1000CDAAC;
  uint64_t v11 = 0LL;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000CE190;
  v5[3] = &unk_10034B2D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (StoreDownload)itemMetadata
{
  uint64_t v6 = 0LL;
  BOOL v7 = &v6;
  uint64_t v8 = 0x3052000000LL;
  char v9 = sub_1000CDA9C;
  v10 = sub_1000CDAAC;
  uint64_t v11 = 0LL;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000CE288;
  v5[3] = &unk_10034B2D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = (StoreDownload *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int64_t)libraryPersistentIdentifier
{
  uint64_t v6 = 0LL;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  uint64_t v9 = 0LL;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000CE438;
  v5[3] = &unk_10034B2D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)loadPropertiesFromMediaPath:(id)a3 includeTracks:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = -[AVURLAsset initWithURL:options:]( objc_alloc(&OBJC_CLASS___AVURLAsset),  "initWithURL:options:",  +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", a3),  0LL);
  if (!v6) {
    return;
  }
  BOOL v7 = v6;
  uint64_t v8 = dispatch_semaphore_create(0LL);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1000CE660;
  v20[3] = &unk_10034AE98;
  v20[4] = v8;
  -[AVURLAsset loadValuesAsynchronouslyForKeys:completionHandler:]( v7,  "loadValuesAsynchronouslyForKeys:completionHandler:",  +[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", @"duration", @"tracks", 0LL),  v20);
  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v8);
  id v9 = -[AVURLAsset tracksWithMediaType:](v7, "tracksWithMediaType:", AVMediaTypeVideo);
  if ([v9 count])
  {
    id v10 = -[IPodLibraryItem _copyChapterVideoTracksForAsset:](self, "_copyChapterVideoTracksForAsset:", v7);
    id v11 = [v10 count];
    if (v11 >= [v9 count]) {
      uint64_t v12 = 1LL;
    }
    else {
      uint64_t v12 = 2LL;
    }

    if (v4) {
      goto LABEL_7;
    }
LABEL_9:
    id v13 = 0LL;
    goto LABEL_10;
  }

  uint64_t v12 = objc_msgSend(-[AVURLAsset tracksWithMediaType:](v7, "tracksWithMediaType:", AVMediaTypeAudio), "count") != 0;
  if (!v4) {
    goto LABEL_9;
  }
LABEL_7:
  id v13 = +[ML3Track importChaptersByParsingAsset:](&OBJC_CLASS___ML3Track, "importChaptersByParsingAsset:", v7);
LABEL_10:
  -[AVURLAsset duration](v7, "duration");
  v14 = (void (*)(__int128 *))ISWeakLinkedSymbolForString("CMTimeGetSeconds", 15LL);
  if (v14)
  {
    __int128 v21 = v18;
    uint64_t v22 = v19;
    v14(&v21);
  }

  else
  {
    uint64_t v15 = 0LL;
  }

  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000CE668;
  block[3] = &unk_10034DC38;
  block[5] = v13;
  block[6] = v12;
  void block[7] = v15;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (int64_t)protectionType
{
  uint64_t v6 = 0LL;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  uint64_t v9 = 0LL;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000CE748;
  v5[3] = &unk_10034B2D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setAdditionalEntityProperties:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000CE7B4;
  v4[3] = &unk_10034AE70;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (void)setAssetType:(int64_t)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000CE84C;
  v4[3] = &unk_10034B300;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)setChapters:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000CE8B0;
  v4[3] = &unk_10034AE70;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)setDownloadType:(int64_t)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000CE948;
  v4[3] = &unk_10034B300;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (void)setDurationInSeconds:(double)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000CE9B0;
  v4[3] = &unk_10034B300;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)setItemArtworkData:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000CEA18;
  v4[3] = &unk_10034AE70;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (void)setItemDownloadIdentifier:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000CEAB0;
  v4[3] = &unk_10034AE70;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (void)setItemMediaPath:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000CEB48;
  v4[3] = &unk_10034AE70;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (void)setItemMetadata:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000CEBE0;
  v4[3] = &unk_10034AE70;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (void)setLibraryPersistentIdentifier:(int64_t)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000CEC78;
  v4[3] = &unk_10034B300;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (void)setProtectionType:(int64_t)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000CECDC;
  v4[3] = &unk_10034B300;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (void)setUpdateType:(int64_t)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000CED40;
  v4[3] = &unk_10034B300;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (void)setValue:(id)a3 forAdditionalEntityProperty:(id)a4
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000CEDA8;
  block[3] = &unk_10034AF00;
  block[4] = a3;
  block[5] = self;
  block[6] = a4;
  dispatch_sync(dispatchQueue, block);
}

- (int64_t)updateType
{
  uint64_t v6 = 0LL;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  uint64_t v9 = 0LL;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000CEE94;
  v5[3] = &unk_10034B2D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)_copyChapterVideoTracksForAsset:(id)a3
{
  BOOL v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v5 = [a3 trackReferences];
  id v6 = [v5 objectForKey:AVAssetChapterListTrackReferencesKey];
  if ((unint64_t)[v6 count] >= 2)
  {
    unint64_t v7 = 1LL;
    do
    {
      id v8 = objc_msgSend(a3, "trackWithTrackID:", objc_msgSend(objc_msgSend(v6, "objectAtIndex:", v7), "intValue"));
      v7 += 2LL;
    }

    while (v7 < (unint64_t)[v6 count]);
  }

  return v4;
}

@end