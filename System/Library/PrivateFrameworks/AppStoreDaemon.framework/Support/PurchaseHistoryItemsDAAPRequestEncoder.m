@interface PurchaseHistoryItemsDAAPRequestEncoder
- (id)dataForRequestWithError:(id *)a3;
@end

@implementation PurchaseHistoryItemsDAAPRequestEncoder

- (id)dataForRequestWithError:(id *)a3
{
  revision = self->_revision;
  if (revision) {
    id v5 = (id)-[NSNumber intValue](revision, "intValue", a3);
  }
  else {
    id v5 = 0LL;
  }
  v6 = self->_knownApps;
  uint64_t v7 = objc_opt_self(&OBJC_CLASS___PurchaseHistoryItemsDAAPRequestEncoder);
  v8 = -[NSOutputStream initToMemory](objc_alloc(&OBJC_CLASS___NSOutputStream), "initToMemory");
  id v9 = [[DKDAAPWriter alloc] initWithStream:v8];
  [v9 startContainerWithCode:1633973106];
  uint64_t v30 = v7;
  objc_opt_self(v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue([&off_10040DD50 componentsJoinedByString:@","]);
  [v9 writeString:v10 withCode:1835365473];

  [v9 writeUInt32:v5 withCode:1836413810];
  [v9 writeUInt8:1 withCode:1835559268];
  [v9 writeUInt8:1 withCode:1634355568];
  id v11 = sub_10031E760((uint64_t)&OBJC_CLASS___PurchaseHistoryDAAPEncoding);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"(%@)", v12));

  [v9 writeString:v13 withCode:1836152165];
  [v9 startContainerWithCode:1634038892];
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  v14 = v6;
  id v15 = -[NSArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v31,  v37,  16LL);
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v32;
    do
    {
      v18 = 0LL;
      do
      {
        if (*(void *)v32 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)v18);
        [v9 startContainerWithCode:1634038889];
        objc_msgSend(v9, "writeUInt32:withCode:", objc_msgSend(v19, "purchaseToken"), 1634038895);
        objc_msgSend(v9, "writeUInt64:withCode:", objc_msgSend(v19, "lockerItemID"), 1835625572);
        [v9 endContainerWithCode:1634038889];
        v18 = (char *)v18 + 1;
      }

      while (v16 != v18);
      id v16 = -[NSArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v31,  v37,  16LL);
    }

    while (v16);
  }

  [v9 endContainerWithCode:1634038892];
  [v9 endContainerWithCode:1633973106];
  [v9 close];
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSOutputStream propertyForKey:](v8, "propertyForKey:", NSStreamDataWrittenToMemoryStreamKey));
  uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSData, v21);
  if ((objc_opt_isKindOfClass(v20, v22) & 1) != 0)
  {
    id v23 = v20;
  }

  else
  {
    uint64_t v24 = ASDLogHandleForCategory(14LL);
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v28 = (void *)objc_opt_class(v30, v26);
      *(_DWORD *)buf = 138412290;
      v36 = v28;
      id v29 = v28;
      _os_log_error_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "[%@]: Purchase History DAAP data not NSData",  buf,  0xCu);
    }

    id v23 = 0LL;
  }

  return v23;
}

- (void).cxx_destruct
{
}

@end