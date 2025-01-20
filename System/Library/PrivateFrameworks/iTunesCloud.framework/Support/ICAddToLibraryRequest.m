@interface ICAddToLibraryRequest
+ (id)requestWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 adamID:(int64_t)a5 containerID:(unsigned int)a6 referralAlbumAdamID:(int64_t)a7 referralPlaylistGlobalID:(id)a8;
+ (id)requestWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 adamID:(int64_t)a5 referralAlbumAdamID:(int64_t)a6 referralPlaylistGlobalID:(id)a7;
+ (id)requestWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 playlistGlobalID:(id)a5;
+ (id)requestWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 sagaID:(int64_t)a5 containerID:(unsigned int)a6;
- (ICAddToLibraryRequest)initWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 adamID:(int64_t)a5 sagaID:(int64_t)a6 playlistGlobalID:(id)a7 containerID:(unsigned int)a8 referralAlbumAdamID:(int64_t)a9 referralPlaylistGlobalID:(id)a10;
- (double)timeoutInterval;
- (id)_bodyDataForDatabaseRevision:(unsigned int)a3 adamID:(int64_t)a4 sagaID:(int64_t)a5 playlistGlobalID:(id)a6 referralAlbumAdamID:(int64_t)a7 referralPlaylistGlobalID:(id)a8;
- (id)canonicalResponseForResponse:(id)a3;
@end

@implementation ICAddToLibraryRequest

- (ICAddToLibraryRequest)initWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 adamID:(int64_t)a5 sagaID:(int64_t)a6 playlistGlobalID:(id)a7 containerID:(unsigned int)a8 referralAlbumAdamID:(int64_t)a9 referralPlaylistGlobalID:(id)a10
{
  uint64_t v10 = *(void *)&a8;
  uint64_t v13 = *(void *)&a4;
  uint64_t v14 = *(void *)&a3;
  id v17 = a7;
  id v18 = a10;
  if (a5 && v17)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    objc_msgSend( v25,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"ICAddToLibraryRequest.m",  43,  @"You can only send one field (adam-id or playlist-global-id");
  }

  else if (!v17)
  {
    goto LABEL_5;
  }

  if ((_DWORD)v10)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v26 handleFailureInMethod:a2 object:self file:@"ICAddToLibraryRequest.m" lineNumber:45 description:@"You can not add a playlist-global-id to a container"];

    goto LABEL_6;
  }

- (id)canonicalResponseForResponse:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICDResponse responseWithResponse:](&OBJC_CLASS___ICAddToLibraryResponse, "responseWithResponse:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 responseData]);
  if ([v4 length])
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSInputStream inputStreamWithData:](&OBJC_CLASS___NSInputStream, "inputStreamWithData:", v4));
    id v6 = [[DKDAAPParser alloc] initWithStream:v5];
    v7 = objc_alloc_init(&OBJC_CLASS___AddToLibraryResponseParserDelegate);
    [v6 setDelegate:v7];
    [v6 parse];
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[AddToLibraryResponseParserDelegate addedItems](v7, "addedItems"));
    id v9 = [v8 copy];
    [v3 setAddedItems:v9];

    objc_msgSend(v3, "setUpdateRequired:", -[AddToLibraryResponseParserDelegate updateRequired](v7, "updateRequired"));
  }

  return v3;
}

- (double)timeoutInterval
{
  return 120.0;
}

- (id)_bodyDataForDatabaseRevision:(unsigned int)a3 adamID:(int64_t)a4 sagaID:(int64_t)a5 playlistGlobalID:(id)a6 referralAlbumAdamID:(int64_t)a7 referralPlaylistGlobalID:(id)a8
{
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100116F90;
  v15[3] = &unk_1001A7090;
  unsigned int v21 = a3;
  int64_t v18 = a4;
  int64_t v19 = a5;
  int64_t v20 = a7;
  id v16 = a6;
  id v17 = a8;
  id v9 = v17;
  id v10 = v16;
  if (v18 <= 0) {
    uint64_t v11 = 1LL;
  }
  else {
    uint64_t v11 = 2LL;
  }
  uint64_t DataForItemKindContainer = ICDAAPUtilitiesCreateDataForItemKindContainer(1634353985LL, v11, v15);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(DataForItemKindContainer);

  return v13;
}

+ (id)requestWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 adamID:(int64_t)a5 referralAlbumAdamID:(int64_t)a6 referralPlaylistGlobalID:(id)a7
{
  uint64_t v9 = *(void *)&a4;
  uint64_t v10 = *(void *)&a3;
  id v14 = a7;
  if (a5)
  {
    if (!a6) {
      goto LABEL_5;
    }
  }

  else
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v17 handleFailureInMethod:a2 object:a1 file:@"ICAddToLibraryRequest.m" lineNumber:64 description:@"adam-id cannot be zero."];

    if (!a6) {
      goto LABEL_5;
    }
  }

  if ([v14 length])
  {
    int64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v18 handleFailureInMethod:a2 object:a1 file:@"ICAddToLibraryRequest.m" lineNumber:65 description:@"cannot specify more than one referral"];
  }

+ (id)requestWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 adamID:(int64_t)a5 containerID:(unsigned int)a6 referralAlbumAdamID:(int64_t)a7 referralPlaylistGlobalID:(id)a8
{
  uint64_t v9 = *(void *)&a6;
  uint64_t v11 = *(void *)&a4;
  uint64_t v12 = *(void *)&a3;
  id v16 = a8;
  if (a5)
  {
    if ((_DWORD)v9) {
      goto LABEL_3;
    }
  }

  else
  {
    int64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v19 handleFailureInMethod:a2 object:a1 file:@"ICAddToLibraryRequest.m" lineNumber:70 description:@"adam-id cannot be zero."];

    if ((_DWORD)v9)
    {
LABEL_3:
      if (!a7) {
        goto LABEL_6;
      }
      goto LABEL_4;
    }
  }

  int64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  [v20 handleFailureInMethod:a2 object:a1 file:@"ICAddToLibraryRequest.m" lineNumber:71 description:@"container-id cannot be zero."];

  if (!a7) {
    goto LABEL_6;
  }
LABEL_4:
  if ([v16 length])
  {
    unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v21 handleFailureInMethod:a2 object:a1 file:@"ICAddToLibraryRequest.m" lineNumber:72 description:@"cannot specify more than one referral"];
  }

+ (id)requestWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 sagaID:(int64_t)a5 containerID:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v8 = *(void *)&a4;
  uint64_t v9 = *(void *)&a3;
  if (!a5)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v13 handleFailureInMethod:a2 object:a1 file:@"ICAddToLibraryRequest.m" lineNumber:77 description:@"saga-id cannot be zero."];

    if ((_DWORD)v6) {
      return  objc_msgSend( objc_alloc((Class)objc_opt_class(a1, a2)),  "initWithDatabaseID:databaseRevision:adamID:sagaID:playlistGlobalID:containerID:referralAlbumAdamID:refe rralPlaylistGlobalID:",  v9,  v8,  0,  a5,  0,  v6,  0,  0);
    }
LABEL_5:
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v14 handleFailureInMethod:a2 object:a1 file:@"ICAddToLibraryRequest.m" lineNumber:78 description:@"container-id cannot be zero."];

    return  objc_msgSend( objc_alloc((Class)objc_opt_class(a1, a2)),  "initWithDatabaseID:databaseRevision:adamID:sagaID:playlistGlobalID:containerID:referralAlbumAdamID:referr alPlaylistGlobalID:",  v9,  v8,  0,  a5,  0,  v6,  0,  0);
  }

  if (!a6) {
    goto LABEL_5;
  }
  return  objc_msgSend( objc_alloc((Class)objc_opt_class(a1, a2)),  "initWithDatabaseID:databaseRevision:adamID:sagaID:playlistGlobalID:containerID:referralAlbumAdamID:referral PlaylistGlobalID:",  v9,  v8,  0,  a5,  0,  v6,  0,  0);
}

+ (id)requestWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 playlistGlobalID:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v6 = *(void *)&a3;
  id v9 = a5;
  if (![v9 length])
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v13 handleFailureInMethod:a2 object:a1 file:@"ICAddToLibraryRequest.m" lineNumber:83 description:@"playlist-global-id must be a non-zero length string."];
  }

  id v11 = objc_msgSend( objc_alloc((Class)objc_opt_class(a1, v10)),  "initWithDatabaseID:databaseRevision:adamID:sagaID:playlistGlobalID:containerID:referralAlbumAdamID:referralPlaylistGlobalID:",  v6,  v5,  0,  0,  v9,  0,  0,  0);

  return v11;
}

@end