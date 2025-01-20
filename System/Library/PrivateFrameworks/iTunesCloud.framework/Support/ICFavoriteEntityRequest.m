@interface ICFavoriteEntityRequest
- (ICFavoriteEntityRequest)initWithStoreID:(int64_t)a3 globalPlaylistID:(id)a4 albumCloudLibraryID:(id)a5 artistCloudLibraryID:(id)a6 entityType:(int64_t)a7 time:(id)a8 databaseID:(unsigned int)a9 databaseRevision:(unsigned int)a10;
- (double)timeoutInterval;
- (id)_bodyDataWithStoreID:(int64_t)a3 globalPlaylistID:(id)a4 albumCloudLibraryID:(id)a5 artistCloudLibraryID:(id)a6 time:(id)a7 serverDatabaseRevision:(unsigned int)a8;
- (id)canonicalResponseForResponse:(id)a3;
- (id)description;
@end

@implementation ICFavoriteEntityRequest

- (ICFavoriteEntityRequest)initWithStoreID:(int64_t)a3 globalPlaylistID:(id)a4 albumCloudLibraryID:(id)a5 artistCloudLibraryID:(id)a6 entityType:(int64_t)a7 time:(id)a8 databaseID:(unsigned int)a9 databaseRevision:(unsigned int)a10
{
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"databases/%u/add-favorite",  a9));
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___ICFavoriteEntityRequest;
  v21 = -[ICDRequest initWithAction:](&v30, "initWithAction:", v20);

  if (v21)
  {
    v21->_adamID = a3;
    v21->_entityType = a7;
    v22 = (NSString *)-[NSString copy](v21->_globalPlaylistID, "copy");
    globalPlaylistID = v21->_globalPlaylistID;
    v21->_globalPlaylistID = v22;

    v24 = (NSString *)[v17 copy];
    albumCloudLibraryID = v21->_albumCloudLibraryID;
    v21->_albumCloudLibraryID = v24;

    v26 = (NSString *)[v18 copy];
    artistCloudLibraryID = v21->_artistCloudLibraryID;
    v21->_artistCloudLibraryID = v26;

    -[ICDRequest setMethod:](v21, "setMethod:", 1LL);
    v28 = (void *)objc_claimAutoreleasedReturnValue( -[ICFavoriteEntityRequest _bodyDataWithStoreID:globalPlaylistID:albumCloudLibraryID:artistCloudLibraryID:time:serverDatabaseRevision:]( v21,  "_bodyDataWithStoreID:globalPlaylistID:albumCloudLibraryID:artistCloudLibraryID:time:serverDatabaseRevision:",  a3,  v16,  v17,  v18,  v19,  a10));
    -[ICDRequest setBodyData:](v21, "setBodyData:", v28);
  }

  return v21;
}

- (id)canonicalResponseForResponse:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[ICDResponse responseWithResponse:]( &OBJC_CLASS___ICFavoriteEntityResponse,  "responseWithResponse:",  a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 responseData]);
  if ([v5 length])
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSInputStream inputStreamWithData:](&OBJC_CLASS___NSInputStream, "inputStreamWithData:", v5));
    id v7 = [[DKDAAPParser alloc] initWithStream:v6];
    v8 = -[FavoriteEntityResponseParserDelegate initWithEntityType:]( objc_alloc(&OBJC_CLASS___FavoriteEntityResponseParserDelegate),  "initWithEntityType:",  self->_entityType);
    [v7 setDelegate:v8];
    [v7 parse];
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FavoriteEntityResponseParserDelegate addedItems](v8, "addedItems"));
    id v10 = [v9 copy];
    [v4 setAddedItems:v10];

    objc_msgSend(v4, "setUpdateRequired:", -[FavoriteEntityResponseParserDelegate updateRequired](v8, "updateRequired"));
  }

  return v4;
}

- (id)_bodyDataWithStoreID:(int64_t)a3 globalPlaylistID:(id)a4 albumCloudLibraryID:(id)a5 artistCloudLibraryID:(id)a6 time:(id)a7 serverDatabaseRevision:(unsigned int)a8
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100115FAC;
  v23[3] = &unk_1001A6FB8;
  unsigned int v29 = a8;
  id v27 = a7;
  int64_t v28 = a3;
  id v24 = v13;
  id v25 = v14;
  id v26 = v15;
  id v16 = v27;
  id v17 = v15;
  id v18 = v14;
  id v19 = v13;
  uint64_t DataForContainer = ICDAAPUtilitiesCreateDataForContainer(1634353510LL, v23);
  v21 = (void *)objc_claimAutoreleasedReturnValue(DataForContainer);

  return v21;
}

- (double)timeoutInterval
{
  return 180.0;
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p storeID=%lld, globalPlaylistID=%@, cloudAlbumID=%@, cloudArtistID=%@ timeStamp=%@>",  objc_opt_class(self, a2),  self,  self->_adamID,  self->_globalPlaylistID,  self->_albumCloudLibraryID,  self->_artistCloudLibraryID,  self->_timeStamp);
}

- (void).cxx_destruct
{
}

@end