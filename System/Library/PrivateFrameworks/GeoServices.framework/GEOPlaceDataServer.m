@interface GEOPlaceDataServer
+ (id)identifier;
+ (unint64_t)launchMode;
- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6;
- (GEOPlaceDataServer)initWithDaemon:(id)a3;
- (GEOPlaceDataServer)initWithDaemon:(id)a3 proxy:(id)a4;
- (void)_addRequestUUID:(id)a3 forPeer:(id)a4;
- (void)_removeRequestUUID:(id)a3 forPeer:(id)a4;
- (void)calculateFreeableSpaceSyncWithRequest:(id)a3;
- (void)calculateFreeableSpaceWithRequest:(id)a3;
- (void)cancelPlaceDataRequestWithRequest:(id)a3;
- (void)clearCacheWithRequest:(id)a3;
- (void)fetchAllCacheEntriesWithRequest:(id)a3;
- (void)peerDidDisconnect:(id)a3;
- (void)performPlaceDataRequestWithRequest:(id)a3;
- (void)preservePlaceDataWithRequest:(id)a3;
- (void)requestMUIDsWithRequest:(id)a3;
- (void)requestPhoneNumbersWithRequest:(id)a3;
- (void)shrinkBySizeSyncWithRequest:(id)a3;
- (void)shrinkBySizeWithRequest:(id)a3;
@end

@implementation GEOPlaceDataServer

- (GEOPlaceDataServer)initWithDaemon:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlaceDataLocalProxy shared](&OBJC_CLASS___GEOPlaceDataLocalProxy, "shared"));
  v6 = -[GEOPlaceDataServer initWithDaemon:proxy:](self, "initWithDaemon:proxy:", v4, v5);

  return v6;
}

- (GEOPlaceDataServer)initWithDaemon:(id)a3 proxy:(id)a4
{
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___GEOPlaceDataServer;
  v8 = -[GEOPlaceDataServer initWithDaemon:](&v16, "initWithDaemon:", a3);
  v9 = v8;
  if (!v8) {
    goto LABEL_4;
  }
  if (v7)
  {
    objc_storeStrong((id *)&v8->_placeDataProxy, a4);
    v10 = -[NSMapTable initWithKeyOptions:valueOptions:capacity:]( objc_alloc(&OBJC_CLASS___NSMapTable),  "initWithKeyOptions:valueOptions:capacity:",  512LL,  512LL,  5LL);
    peerToRequestUUID = v9->_peerToRequestUUID;
    v9->_peerToRequestUUID = v10;

    uint64_t v12 = geo_isolater_create("PlaceDataServer");
    peerToRequestUUIDIsolater = v9->_peerToRequestUUIDIsolater;
    v9->_peerToRequestUUIDIsolater = (geo_isolater *)v12;

LABEL_4:
    v14 = v9;
    goto LABEL_5;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
    sub_10003ABC4();
  }
  v14 = 0LL;
LABEL_5:

  return v14;
}

- (void)_addRequestUUID:(id)a3 forPeer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  peerToRequestUUIDIsolater = self->_peerToRequestUUIDIsolater;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100004788;
  v11[3] = &unk_100059048;
  v11[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  geo_isolate_sync_data(peerToRequestUUIDIsolater, v11);
}

- (void)_removeRequestUUID:(id)a3 forPeer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  peerToRequestUUIDIsolater = self->_peerToRequestUUIDIsolater;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000048B8;
  v11[3] = &unk_100059048;
  v11[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  geo_isolate_sync_data(peerToRequestUUIDIsolater, v11);
}

- (void)peerDidDisconnect:(id)a3
{
  id v4 = a3;
  uint64_t v18 = 0LL;
  v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  v21 = sub_100004AE0;
  v22 = sub_100004AF0;
  id v23 = 0LL;
  peerToRequestUUIDIsolater = self->_peerToRequestUUIDIsolater;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100004AF8;
  v15[3] = &unk_100059070;
  v17 = &v18;
  v15[4] = self;
  id v6 = v4;
  id v16 = v6;
  geo_isolate_sync_data(peerToRequestUUIDIsolater, v15);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v7 = (id)v19[5];
  id v8 = [v7 countByEnumeratingWithState:&v11 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v12;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v7);
        }
        -[GEOPlaceDataLocalProxy cancelRequest:]( self->_placeDataProxy,  "cancelRequest:",  *(void *)(*((void *)&v11 + 1) + 8LL * (void)v10),  (void)v11);
        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v7 countByEnumeratingWithState:&v11 objects:v24 count:16];
    }

    while (v8);
  }

  _Block_object_dispose(&v18, 8);
}

- (void)requestMUIDsWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [[GEOPlaceByIdentifiersReply alloc] initWithRequest:v4];
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 identifiers]);
  id v7 = [v6 count];

  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 requestUUID]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 peer]);
    -[GEOPlaceDataServer _addRequestUUID:forPeer:](self, "_addRequestUUID:forPeer:", v8, v9);

    placeDataProxy = self->_placeDataProxy;
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 identifiers]);
    id v11 = [v4 resultProvider];
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v4 requestUUID]);
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v4 traits]);
    id v14 = [v4 options];
    v15 = (void *)objc_claimAutoreleasedReturnValue([v4 preferredAuditToken]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v4 throttleToken]);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100004D4C;
    v19[3] = &unk_100059098;
    v19[4] = self;
    id v20 = v4;
    id v21 = v5;
    -[GEOPlaceDataLocalProxy requestIdentifiers:resultProviderID:requestUUID:traits:options:auditToken:throttleToken:requesterHandler:]( placeDataProxy,  "requestIdentifiers:resultProviderID:requestUUID:traits:options:auditToken:throttleToken:requesterHandler:",  v10,  v11,  v12,  v13,  v14,  v15,  v16,  v19);
  }

  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError GEOErrorWithCode:reason:]( &OBJC_CLASS___NSError,  "GEOErrorWithCode:reason:",  -10LL,  @"Empty list of Identifiers"));
    [v5 setError:v17];

    [v5 send];
  }
}

- (void)requestPhoneNumbersWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [[GEOPlaceByPhoneNumberReply alloc] initWithRequest:v4];
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 phoneNumbers]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v6 count]));

  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 phoneNumbers]);
  id v9 = [v8 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v34;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(v8);
        }
        __int128 v13 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
        if (![v13 length] || (uint64_t v14 = GEOCreatePhoneNumberForStringRepresentation(v13)) == 0) {
          uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
        }
        v15 = (void *)v14;
        [v7 addObject:v14];
      }

      id v10 = [v8 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }

    while (v10);
  }

  uint64_t Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEOPlaceDataServer");
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v4 peer]);
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 bundleIdentifier]);
    *(_DWORD *)buf = 138478083;
    v38 = v7;
    __int16 v39 = 2113;
    v40 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "Request for phone numbers: %{private}@ by bundle identifier: %{private}@",  buf,  0x16u);
  }

  id v20 = [v4 allowCellular];
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v4 requestUUID]);
  v22 = (void *)objc_claimAutoreleasedReturnValue([v4 peer]);
  -[GEOPlaceDataServer _addRequestUUID:forPeer:](self, "_addRequestUUID:forPeer:", v21, v22);

  placeDataProxy = self->_placeDataProxy;
  v24 = (void *)objc_claimAutoreleasedReturnValue([v4 requestUUID]);
  v25 = (void *)objc_claimAutoreleasedReturnValue([v4 traits]);
  v26 = (void *)objc_claimAutoreleasedReturnValue([v4 preferredAuditToken]);
  v27 = (void *)objc_claimAutoreleasedReturnValue([v4 throttleToken]);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_1000051C0;
  v30[3] = &unk_100059098;
  v30[4] = self;
  id v31 = v4;
  id v32 = v5;
  id v28 = v5;
  id v29 = v4;
  -[GEOPlaceDataLocalProxy requestPhoneNumbers:requestUUID:allowCellularDataForLookup:traits:auditToken:throttleToken:requesterHandler:]( placeDataProxy,  "requestPhoneNumbers:requestUUID:allowCellularDataForLookup:traits:auditToken:throttleToken:requesterHandler:",  v7,  v24,  v20,  v25,  v26,  v27,  v30);
}

- (void)fetchAllCacheEntriesWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [[GEOPlaceFetchCacheReply alloc] initWithRequest:v4];

  placeDataProxy = self->_placeDataProxy;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000539C;
  v8[3] = &unk_1000590C0;
  id v9 = v5;
  id v7 = v5;
  -[GEOPlaceDataLocalProxy fetchAllCacheEntriesWithRequesterHandler:]( placeDataProxy,  "fetchAllCacheEntriesWithRequesterHandler:",  v8);
}

- (void)preservePlaceDataWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [[GEOPlaceCachePlaceReply alloc] initWithRequest:v4];
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 place]);

  if (v6)
  {
    placeDataProxy = self->_placeDataProxy;
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 place]);
    -[GEOPlaceDataLocalProxy trackPlaceData:](placeDataProxy, "trackPlaceData:", v8);

    id v9 = objc_alloc(&OBJC_CLASS___GEOMapItemIdentifier);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 place]);
    id v11 = [v9 initWithPlace:v10];
    id v14 = v11;
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));
    [v5 setIdentifiers:v12];
  }

  else
  {
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError GEOErrorWithCode:reason:]( &OBJC_CLASS___NSError,  "GEOErrorWithCode:reason:",  -10LL,  @"Missing place"));
    [v5 setError:v13];
  }

  [v5 send];
}

- (void)performPlaceDataRequestWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [[GEOPlaceReplyMessage alloc] initWithRequest:v4];
  uint64_t Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEOPlaceDataServer");
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 request]);
    *(_DWORD *)buf = 134217984;
    id v28 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Received place data request: %p", buf, 0xCu);
  }

  uint64_t v9 = objc_claimAutoreleasedReturnValue([v4 request]);
  if (v9
    && (id v10 = (void *)v9,
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 traits]),
        v11,
        v10,
        v11))
  {
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v4 requestUUID]);
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v4 peer]);
    -[GEOPlaceDataServer _addRequestUUID:forPeer:](self, "_addRequestUUID:forPeer:", v12, v13);

    placeDataProxy = self->_placeDataProxy;
    v15 = (void *)objc_claimAutoreleasedReturnValue([v4 request]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v4 requestUUID]);
    v17 = (void *)objc_claimAutoreleasedReturnValue([v4 traits]);
    id v18 = [v4 cachePolicy];
    [v4 timeout];
    double v20 = v19;
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v4 preferredAuditToken]);
    v22 = (void *)objc_claimAutoreleasedReturnValue([v4 throttleToken]);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_100005820;
    v24[3] = &unk_100059098;
    v24[4] = self;
    id v25 = v4;
    id v26 = v5;
    -[GEOPlaceDataLocalProxy performPlaceDataRequest:requestUUID:traits:cachePolicy:timeout:auditToken:throttleToken:requesterHandler:]( placeDataProxy,  "performPlaceDataRequest:requestUUID:traits:cachePolicy:timeout:auditToken:throttleToken:requesterHandler:",  v15,  v16,  v17,  v18,  v21,  v22,  v20,  v24);
  }

  else
  {
    id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSError GEOErrorWithCode:reason:]( &OBJC_CLASS___NSError,  "GEOErrorWithCode:reason:",  -10LL,  @"Missign request or traits"));
    [v5 setError:v23];

    [v5 send];
  }
}

- (void)cancelPlaceDataRequestWithRequest:(id)a3
{
  id v9 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v9 requestUUID]);

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v9 requestUUID]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v9 peer]);
    -[GEOPlaceDataServer _removeRequestUUID:forPeer:](self, "_removeRequestUUID:forPeer:", v5, v6);

    placeDataProxy = self->_placeDataProxy;
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v9 requestUUID]);
    -[GEOPlaceDataLocalProxy cancelRequest:](placeDataProxy, "cancelRequest:", v8);
  }
}

- (void)calculateFreeableSpaceWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [[GEOPlaceCalculateFreeableSpaceReply alloc] initWithRequest:v4];

  placeDataProxy = self->_placeDataProxy;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100005B14;
  v8[3] = &unk_1000590E8;
  id v9 = v5;
  id v7 = v5;
  -[GEOPlaceDataLocalProxy calculateFreeableSpaceWithHandler:](placeDataProxy, "calculateFreeableSpaceWithHandler:", v8);
}

- (void)calculateFreeableSpaceSyncWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [[GEOPlaceCalculateFreeableSpaceReply alloc] initWithRequest:v4];

  objc_msgSend( v5,  "setFreeableBytes:",  -[GEOPlaceDataLocalProxy calculateFreeableSpaceSync](self->_placeDataProxy, "calculateFreeableSpaceSync"));
  [v5 send];
}

- (void)shrinkBySizeWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [[GEOPlaceFreeSpaceReply alloc] initWithRequest:v4];
  placeDataProxy = self->_placeDataProxy;
  id v7 = [v4 freeBytes];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100005C7C;
  v9[3] = &unk_1000590E8;
  id v10 = v5;
  id v8 = v5;
  -[GEOPlaceDataLocalProxy shrinkBySize:finished:](placeDataProxy, "shrinkBySize:finished:", v7, v9);
}

- (void)shrinkBySizeSyncWithRequest:(id)a3
{
  id v4 = a3;
  id v7 = [[GEOPlaceFreeSpaceReply alloc] initWithRequest:v4];
  placeDataProxy = self->_placeDataProxy;
  id v6 = [v4 freeBytes];

  objc_msgSend( v7,  "setFreedBytes:",  -[GEOPlaceDataLocalProxy shrinkBySizeSync:](placeDataProxy, "shrinkBySizeSync:", v6));
  [v7 send];
}

- (void)clearCacheWithRequest:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)identifier
{
  return @"placedata";
}

+ (unint64_t)launchMode
{
  return 1LL;
}

- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = sub_100011D18(v10);
  BOOL v16 = 0;
  if (v13 <= 2000)
  {
    if (v13 <= 1252)
    {
      if (v13 == 987)
      {
        BOOL v16 = 1;
        if (sub_100012B28(v12, v11, @"placedata", v10, &off_10005E5F8, 1LL))
        {
          uint64_t v60 = objc_opt_class(&OBJC_CLASS___GEOPlaceClearCacheRequest, v58, v59);
          id v61 = sub_100012270(@"placedata", v10, v11, v60, v12);
          v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
          double v20 = v62;
          BOOL v16 = v62 != 0LL;
          if (v62)
          {
            [v62 setSignpostId:a6];
            -[GEOPlaceDataServer clearCacheWithRequest:](self, "clearCacheWithRequest:", v20);
            goto LABEL_43;
          }

          goto LABEL_44;
        }
      }

      else if (v13 == 1195)
      {
        uint64_t v29 = objc_opt_class(&OBJC_CLASS___GEOPlaceByIdentifiersRequest, v14, v15);
        id v30 = sub_100012270(@"placedata", v10, v11, v29, v12);
        id v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
        double v20 = v31;
        BOOL v16 = v31 != 0LL;
        if (v31)
        {
          [v31 setSignpostId:a6];
          -[GEOPlaceDataServer requestMUIDsWithRequest:](self, "requestMUIDsWithRequest:", v20);
          goto LABEL_43;
        }

        goto LABEL_44;
      }
    }

    else
    {
      switch(v13)
      {
        case 1253:
          BOOL v16 = 1;
          if (sub_100012B28(v12, v11, @"placedata", v10, &off_10005E5C8, 1LL))
          {
            uint64_t v42 = objc_opt_class(&OBJC_CLASS___GEOPlaceFreeSpaceRequest, v40, v41);
            id v43 = sub_100012270(@"placedata", v10, v11, v42, v12);
            v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
            double v20 = v44;
            BOOL v16 = v44 != 0LL;
            if (v44)
            {
              [v44 setSignpostId:a6];
              -[GEOPlaceDataServer shrinkBySizeWithRequest:](self, "shrinkBySizeWithRequest:", v20);
              goto LABEL_43;
            }

            goto LABEL_44;
          }

          break;
        case 1666:
          BOOL v16 = 1;
          if (sub_100012B28(v12, v11, @"placedata", v10, &off_10005E5E0, 1LL))
          {
            uint64_t v47 = objc_opt_class(&OBJC_CLASS___GEOPlaceFreeSpaceRequest, v45, v46);
            id v48 = sub_100012270(@"placedata", v10, v11, v47, v12);
            v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
            double v20 = v49;
            BOOL v16 = v49 != 0LL;
            if (v49)
            {
              [v49 setSignpostId:a6];
              -[GEOPlaceDataServer shrinkBySizeSyncWithRequest:](self, "shrinkBySizeSyncWithRequest:", v20);
              goto LABEL_43;
            }

            goto LABEL_44;
          }

          break;
        case 1739:
          uint64_t v21 = objc_opt_class(&OBJC_CLASS___GEOPlaceCachePlaceRequest, v14, v15);
          id v22 = sub_100012270(@"placedata", v10, v11, v21, v12);
          id v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
          double v20 = v23;
          BOOL v16 = v23 != 0LL;
          if (v23)
          {
            [v23 setSignpostId:a6];
            -[GEOPlaceDataServer preservePlaceDataWithRequest:](self, "preservePlaceDataWithRequest:", v20);
            goto LABEL_43;
          }

@end