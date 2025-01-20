@interface IAPInfoDAAPRequestEncoder
- (id)dataForRequestWithError:(id *)a3;
@end

@implementation IAPInfoDAAPRequestEncoder

- (id)dataForRequestWithError:(id *)a3
{
  revision = self->_revision;
  if (revision) {
    id v5 = (id)-[NSNumber intValue](revision, "intValue", a3);
  }
  else {
    id v5 = 0LL;
  }
  v6 = self->_knownIAPs;
  uint64_t v7 = objc_opt_self(&OBJC_CLASS___IAPInfoDAAPRequestEncoder);
  v33 = -[NSOutputStream initToMemory](objc_alloc(&OBJC_CLASS___NSOutputStream), "initToMemory");
  id v8 = [[DKDAAPWriter alloc] initWithStream:v33];
  [v8 startContainerWithCode:1633973106];
  [v8 writeUInt32:v5 withCode:1836413810];
  uint64_t v32 = v7;
  objc_opt_self(v7);
  v40[0] = @"daap.databasesongs";
  v40[1] = @"dmap.status";
  v40[2] = @"dmap.updatetype";
  v40[3] = @"dmap.specifiedtotalcount";
  v40[4] = @"dmap.returnedcount";
  v40[5] = @"dmap.serverrevision";
  v40[6] = @"dmap.listing";
  v40[7] = @"dmap.listingitem";
  v40[8] = @"dmap.itemkind";
  v40[9] = @"com.apple.itunes.adam-id";
  v40[10] = @"daap.songdatemodified";
  v40[11] = @"com.apple.itunes.cloud-purchased-token";
  v40[12] = @"com.apple.itunes.store.in-app-purchase-type";
  v40[13] = @"com.apple.itunes.store.in-app-purchase-expiration-date";
  v40[14] = @"com.apple.itunes.store.app-adam-id";
  v40[15] = @"dmap.longitemid";
  v40[16] = @"com.apple.itunes.store.in-app-used-offers";
  v40[17] = @"com.apple.itunes.store.in-app-subscription-family-id";
  v40[18] = @"com.apple.itunes.store.in-app-auto-renew-status";
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v40, 19LL));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 componentsJoinedByString:@","]);
  [v8 writeString:v10 withCode:1835365473];

  [v8 startContainerWithCode:1634038892];
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  v11 = v6;
  id v12 = -[NSArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v34,  v40,  16LL);
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v35;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v35 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)i);
        objc_msgSend(v8, "startContainerWithCode:", 1634038889, v32);
        v17 = (void *)objc_claimAutoreleasedReturnValue([v16 purchaseDate]);
        [v17 timeIntervalSince1970];
        uint64_t v19 = v18;

        [v8 writeUInt32:v19 withCode:1634038895];
        v20 = (void *)objc_claimAutoreleasedReturnValue([v16 adamId]);
        id v21 = [v20 unsignedLongLongValue];

        [v8 writeUInt64:v21 withCode:1835625572];
        [v8 endContainerWithCode:1634038889];
      }

      id v13 = -[NSArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v34,  v40,  16LL);
    }

    while (v13);
  }

  [v8 endContainerWithCode:1634038892];
  [v8 endContainerWithCode:1633973106];
  [v8 close];
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSOutputStream propertyForKey:](v33, "propertyForKey:", NSStreamDataWrittenToMemoryStreamKey));
  uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSData, v23);
  if ((objc_opt_isKindOfClass(v22, v24) & 1) != 0)
  {
    id v25 = v22;
  }

  else
  {
    uint64_t v26 = ASDLogHandleForCategory(14LL);
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v30 = (void *)objc_opt_class(v32, v28);
      *(_DWORD *)buf = 138412290;
      v39 = v30;
      id v31 = v30;
      _os_log_error_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "[%@]: IAP Info DAAP data not NSData",  buf,  0xCu);
    }

    id v25 = 0LL;
  }

  return v25;
}

- (void).cxx_destruct
{
}

@end