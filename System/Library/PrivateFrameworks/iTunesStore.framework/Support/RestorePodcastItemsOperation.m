@interface RestorePodcastItemsOperation
- (NSArray)downloadItems;
- (NSArray)responses;
- (RestorePodcastItemsOperation)initWithDownloadItems:(id)a3;
- (id)_addResponseForItem:(id)a3 operation:(id)a4;
- (id)_newResponseWithItems:(id)a3 error:(id)a4;
- (id)_newURLOperationForItem:(id)a3 error:(id *)a4;
- (void)_addResponse:(id)a3;
- (void)run;
@end

@implementation RestorePodcastItemsOperation

- (RestorePodcastItemsOperation)initWithDownloadItems:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___RestorePodcastItemsOperation;
  v5 = -[RestorePodcastItemsOperation init](&v9, "init");
  if (v5)
  {
    v6 = (NSArray *)[v4 copy];
    downloadItems = v5->_downloadItems;
    v5->_downloadItems = v6;
  }

  return v5;
}

- (NSArray)downloadItems
{
  return self->_downloadItems;
}

- (NSArray)responses
{
  id v3 = -[NSMutableArray copy](self->_responses, "copy");
  -[RestorePodcastItemsOperation unlock](self, "unlock");
  return (NSArray *)v3;
}

- (void)run
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v3) {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v4 = [v3 shouldLog];
  else {
    LODWORD(v5) = v4;
  }
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 OSLogObject]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
    uint64_t v5 = v5;
  }
  else {
    v5 &= 2u;
  }
  if ((_DWORD)v5)
  {
    v7 = (void *)objc_opt_class(self);
    downloadItems = self->_downloadItems;
    id v9 = v7;
    int v57 = 138412546;
    v58 = v7;
    __int16 v59 = 2048;
    v60 = -[NSArray count](downloadItems, "count");
    v10 = (void *)_os_log_send_and_compose_impl( v5,  0LL,  0LL,  0LL,  &_mh_execute_header,  v6,  1LL,  "%@: Restoring %lu podcasts",  &v57,  22);

    if (!v10) {
      goto LABEL_13;
    }
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v10,  4LL));
    free(v10);
    v41 = v6;
    SSFileLog(v3, @"%@");
  }

LABEL_13:
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[SSURLBagContext contextWithBagType:](&OBJC_CLASS___SSURLBagContext, "contextWithBagType:", 0LL));
  id v55 = 0LL;
  unsigned __int8 v12 = -[RestorePodcastItemsOperation loadURLBagWithContext:returningError:]( self,  "loadURLBagWithContext:returningError:",  v11,  &v55);
  id v13 = v55;
  if ((v12 & 1) == 0)
  {
    id v32 = -[RestorePodcastItemsOperation _newResponseWithItems:error:]( self,  "_newResponseWithItems:error:",  self->_downloadItems,  v13);
    -[RestorePodcastItemsOperation _addResponse:](self, "_addResponse:", v32);
    uint64_t v18 = 0LL;
    goto LABEL_45;
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[ISURLBagCache sharedCache](&OBJC_CLASS___ISURLBagCache, "sharedCache"));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 URLBagForContext:v11]);

  v44 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 urlForKey:@"p2-podcast-restore"]);

  if (v16)
  {
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    v17 = self->_downloadItems;
    id v46 = -[NSArray countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v51,  v56,  16LL);
    if (v46)
    {
      v43 = v11;
      uint64_t v45 = *(void *)v52;
      LODWORD(v18) = 1;
      while (1)
      {
        for (i = 0LL; i != v46; i = (char *)i + 1)
        {
          if (*(void *)v52 != v45) {
            objc_enumerationMutation(v17);
          }
          uint64_t v20 = *(void *)(*((void *)&v51 + 1) + 8LL * (void)i);
          v21 = objc_autoreleasePoolPush();
          id v50 = 0LL;
          id v22 = -[RestorePodcastItemsOperation _newURLOperationForItem:error:]( self,  "_newURLOperationForItem:error:",  v20,  &v50);
          id v23 = v50;
          v24 = v23;
          if (v22)
          {
            v47 = v21;
            id v49 = v23;
            v25 = v17;
            id v26 = v13;
            unsigned __int8 v27 = -[RestorePodcastItemsOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v22,  &v49);
            id v28 = v49;

            if ((v27 & 1) != 0)
            {
              id v29 = (id)objc_claimAutoreleasedReturnValue( -[RestorePodcastItemsOperation _addResponseForItem:operation:]( self,  "_addResponseForItem:operation:",  v20,  v22));
              v24 = (void *)objc_claimAutoreleasedReturnValue([v29 responseError]);

              BOOL v30 = v24 == 0LL;
              id v13 = v26;
              v17 = v25;
              v21 = v47;
              goto LABEL_25;
            }

            v24 = v28;
            id v13 = v26;
            v17 = v25;
            v21 = v47;
          }

          v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v20, v41));
          id v29 = -[RestorePodcastItemsOperation _newResponseWithItems:error:]( self,  "_newResponseWithItems:error:",  v31,  v24);

          -[RestorePodcastItemsOperation _addResponse:](self, "_addResponse:", v29);
          BOOL v30 = 0;
LABEL_25:

          if (!v13) {
            id v13 = v24;
          }
          uint64_t v18 = v18 & v30;

          objc_autoreleasePoolPop(v21);
        }

        id v46 = -[NSArray countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v51,  v56,  16LL);
        if (!v46)
        {
          v11 = v43;
          goto LABEL_44;
        }
      }
    }

    goto LABEL_43;
  }

  v48 = v13;
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v33) {
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v34 = objc_msgSend(v33, "shouldLog", v41);
  v35 = (os_log_s *)objc_claimAutoreleasedReturnValue([v33 OSLogObject]);
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v36 = v34;
  }
  else {
    uint64_t v36 = v34 & 2;
  }
  if (!(_DWORD)v36) {
    goto LABEL_41;
  }
  v37 = (void *)objc_opt_class(self);
  int v57 = 138412546;
  v58 = v37;
  __int16 v59 = 2112;
  v60 = @"p2-podcast-restore";
  id v38 = v37;
  LODWORD(v42) = 22;
  v39 = (void *)_os_log_send_and_compose_impl( v36,  0LL,  0LL,  0LL,  &_mh_execute_header,  v35,  0LL,  "%@: Failing podcast restore, no bag key: %@",  &v57,  v42);

  if (v39)
  {
    v35 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v39,  4LL));
    free(v39);
    SSFileLog(v33, @"%@");
LABEL_41:
  }

  uint64_t v40 = SSError(SSErrorDomain, 3LL, 0LL, 0LL);
  id v13 = (id)objc_claimAutoreleasedReturnValue(v40);

  v17 = -[RestorePodcastItemsOperation _newResponseWithItems:error:]( self,  "_newResponseWithItems:error:",  self->_downloadItems,  v13);
  -[RestorePodcastItemsOperation _addResponse:](self, "_addResponse:", v17);
LABEL_43:
  uint64_t v18 = 1LL;
LABEL_44:

  id v32 = v44;
LABEL_45:

  -[RestorePodcastItemsOperation setError:](self, "setError:", v13);
  -[RestorePodcastItemsOperation setSuccess:](self, "setSuccess:", v18);
}

- (void)_addResponse:(id)a3
{
  id v8 = a3;
  -[RestorePodcastItemsOperation lock](self, "lock");
  unsigned int v4 = (id *)&self->ISOperation_opaque[OBJC_IVAR___ISOperation__delegate];
  id WeakRetained = objc_loadWeakRetained(v4);
  char v6 = objc_opt_respondsToSelector(WeakRetained, "restorePodcastItemsOperation:didReceiveResponse:");

  if ((v6 & 1) != 0) {
    id v7 = objc_loadWeakRetained(v4);
  }
  else {
    id v7 = 0LL;
  }
  -[NSMutableArray addObject:](self->_responses, "addObject:", v8);
  -[RestorePodcastItemsOperation unlock](self, "unlock");
  if (v7) {
    [v7 restorePodcastItemsOperation:self didReceiveResponse:v8];
  }
}

- (id)_addResponseForItem:(id)a3 operation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(&OBJC_CLASS___RestorePodcastItemsResponse);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v6, 0LL));
  -[RestorePodcastItemsResponse setRequestItems:](v8, "setRequestItems:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue([v7 dataProvider]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 output]);

  uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
  {
    id v13 = [[SSItem alloc] initWithItemDictionary:v11];
    v14 = -[StoreDownload initWithItem:](objc_alloc(&OBJC_CLASS___StoreDownload), "initWithItem:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[StoreDownload primaryAssetURL](v14, "primaryAssetURL"));

    if (v15)
    {
      v16 = -[NSArray initWithObjects:](objc_alloc(&OBJC_CLASS___NSArray), "initWithObjects:", v14, 0LL);
      -[RestorePodcastItemsResponse setResponseDownloads:](v8, "setResponseDownloads:", v16);
    }

    else
    {
      v16 = (NSArray *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"failureType"]);
      else {
        uint64_t v18 = 100LL;
      }
      uint64_t v19 = SSError(SSServerErrorDomain, v18, 0LL, 0LL);
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue([v6 storeItemID]);
      -[RestorePodcastItemsResponse setError:forItemIdentifier:](v8, "setError:forItemIdentifier:", v20, v21);
    }
  }

  else
  {
    uint64_t v17 = SSError(SSErrorDomain, 2LL, 0LL, 0LL);
    id v13 = (id)objc_claimAutoreleasedReturnValue(v17);
    -[RestorePodcastItemsResponse setResponseError:](v8, "setResponseError:", v13);
  }

  -[RestorePodcastItemsOperation _addResponse:](self, "_addResponse:", v8);
  return v8;
}

- (id)_newResponseWithItems:(id)a3 error:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___RestorePodcastItemsResponse);
  -[RestorePodcastItemsResponse setRequestItems:](v7, "setRequestItems:", v6);

  -[RestorePodcastItemsResponse setResponseError:](v7, "setResponseError:", v5);
  return v7;
}

- (id)_newURLOperationForItem:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 podcastEpisodeGUID]);
  uint64_t v7 = objc_claimAutoreleasedReturnValue([v5 storeItemID]);

  if (!(v7 | v6))
  {
    uint64_t v8 = SSError(SSErrorDomain, 116LL, 0LL, 0LL);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    id v10 = 0LL;
    if (!a4) {
      goto LABEL_12;
    }
    goto LABEL_10;
  }

  id v10 = objc_alloc_init(&OBJC_CLASS___ISStoreURLOperation);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[DaemonProtocolDataProvider provider](&OBJC_CLASS___DaemonProtocolDataProvider, "provider"));
  [v10 setDataProvider:v11];

  uint64_t v12 = objc_alloc_init(&OBJC_CLASS___SSMutableURLRequestProperties);
  if (v7 && (uint64_t)[(id)v7 longLongValue] >= 1)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([(id)v7 stringValue]);
    -[SSMutableURLRequestProperties setValue:forRequestParameter:]( v12,  "setValue:forRequestParameter:",  v13,  @"id");
  }

  else if (v6)
  {
    -[SSMutableURLRequestProperties setValue:forRequestParameter:]( v12,  "setValue:forRequestParameter:",  v6,  @"epguid");
  }

  -[SSMutableURLRequestProperties setURLBagKey:](v12, "setURLBagKey:", @"p2-podcast-restore");
  [v10 setRequestProperties:v12];

  id v9 = 0LL;
  if (a4)
  {
LABEL_10:
    if (!v10) {
      *a4 = v9;
    }
  }

- (void).cxx_destruct
{
}

@end