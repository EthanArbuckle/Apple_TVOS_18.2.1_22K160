@interface PurchaseHistoryHideShowRequestEncoder
- (id)dataForRequestWithError:(id *)a3;
@end

@implementation PurchaseHistoryHideShowRequestEncoder

- (id)dataForRequestWithError:(id *)a3
{
  v26 = -[NSOutputStream initToMemory](objc_alloc(&OBJC_CLASS___NSOutputStream), "initToMemory");
  id v4 = [[DKDAAPWriter alloc] initWithStream:v26];
  [v4 startContainerWithCode:1835360883];
  [v4 writeUInt8:2 withCode:1835625316];
  [v4 startContainerWithCode:1835819884];
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  v25 = self;
  v5 = self->_items;
  id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v27,  v33,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v28;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v27 + 1) + 8LL * (void)v9);
        objc_msgSend(v4, "startContainerWithCode:", 1835821428, v25);
        if (v10)
        {
          id v11 = *(id *)(v10 + 16);
          id v12 = [v11 lockerItemID];

          [v4 writeUInt64:v12 withCode:1835625572];
          BOOL v13 = *(_BYTE *)(v10 + 8) != 0;
        }

        else
        {
          objc_msgSend(v4, "writeUInt64:withCode:", objc_msgSend(0, "lockerItemID"), 1835625572);
          BOOL v13 = 0;
        }

        [v4 writeUInt8:!v13 withCode:1835624553];
        [v4 endContainerWithCode:1835821428];
        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v14 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v27,  v33,  16LL);
      id v7 = v14;
    }

    while (v14);
  }

  [v4 endContainerWithCode:1835819884];
  [v4 endContainerWithCode:1835360883];
  [v4 close];
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSOutputStream propertyForKey:](v26, "propertyForKey:", NSStreamDataWrittenToMemoryStreamKey));
  uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSData, v16);
  if ((objc_opt_isKindOfClass(v15, v17) & 1) != 0)
  {
    id v18 = v15;
  }

  else
  {
    uint64_t v19 = ASDLogHandleForCategory(14LL);
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v23 = (void *)objc_opt_class(v25, v21);
      *(_DWORD *)buf = 138412290;
      v32 = v23;
      id v24 = v23;
      _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "[%@]: Purchase History DAAP data not NSData",  buf,  0xCu);
    }

    id v18 = 0LL;
  }

  return v18;
}

- (void).cxx_destruct
{
}

@end