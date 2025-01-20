@interface StoreDownloadQueueResponse
- (BOOL)shouldCancelPurchaseBatch;
- (BOOL)triggeredQueueCheck;
- (NSArray)rangesToLoad;
- (NSData)keybag;
- (NSError)error;
- (NSNumber)userIdentifier;
- (NSOrderedSet)clusterMappings;
- (NSOrderedSet)downloads;
- (NSString)clientIdentifier;
- (NSString)storeCorrelationID;
- (StoreDownloadQueueResponse)initWithDictionary:(id)a3 userIdentifier:(id)a4;
- (StoreDownloadQueueResponse)initWithDictionary:(id)a3 userIdentifier:(id)a4 preferredAssetFlavor:(id)a5;
- (StoreDownloadQueueResponse)initWithError:(id)a3 userIdentifier:(id)a4;
- (id)_errorWithFailureType:(id)a3 customerMessage:(id)a4;
- (id)_initStoreDownloadQueueResponse;
- (id)_newManifestWithStoreDownloadQueueResponse:(id)a3 accountID:(id)a4 accountName:(id)a5;
- (id)copyJobManifestWithAccountID:(id)a3 accountName:(id)a4;
- (id)errorForItemIdentifier:(id)a3;
- (void)enumerateActivitiesWithAccountID:(id)a3 accountName:(id)a4 usingBlock:(id)a5;
- (void)setClientIdentifier:(id)a3;
- (void)setError:(id)a3;
- (void)setShouldCancelPurchaseBatch:(BOOL)a3;
- (void)setStoreCorrelationID:(id)a3;
- (void)setTriggeredQueueCheck:(BOOL)a3;
@end

@implementation StoreDownloadQueueResponse

- (id)_initStoreDownloadQueueResponse
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___StoreDownloadQueueResponse;
  v2 = -[StoreDownloadQueueResponse init](&v6, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.itunesstored.StoreDownloadQueueResponse", 0LL);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;
  }

  return v2;
}

- (StoreDownloadQueueResponse)initWithDictionary:(id)a3 userIdentifier:(id)a4
{
  return -[StoreDownloadQueueResponse initWithDictionary:userIdentifier:preferredAssetFlavor:]( self,  "initWithDictionary:userIdentifier:preferredAssetFlavor:",  a3,  a4,  0LL);
}

- (StoreDownloadQueueResponse)initWithDictionary:(id)a3 userIdentifier:(id)a4 preferredAssetFlavor:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v100 = a5;
  v10 = -[StoreDownloadQueueResponse _initStoreDownloadQueueResponse](self, "_initStoreDownloadQueueResponse");
  if (v10)
  {
    v11 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"page-type"]);
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
    {
      uint64_t v14 = objc_claimAutoreleasedReturnValue([v12 objectForKey:@"template-name"]);

      v12 = (void *)v14;
    }

    uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v12, v15) & 1) != 0) {
      unsigned __int8 v16 = [v12 isEqualToString:@"preorder-success"];
    }
    else {
      unsigned __int8 v16 = 0;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"more"]);

    v18 = &ACSLocateCachingServer_ptr;
    uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v17, v19) & 1) != 0)
    {
      uint64_t MoreRangesFromArray = ISCopyLoadMoreRangesFromArray(v17);
      uint64_t v21 = objc_claimAutoreleasedReturnValue(MoreRangesFromArray);
      rangesToLoad = v10->_rangesToLoad;
      v10->_rangesToLoad = (NSArray *)v21;
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"failureType"]);

    if (v23)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"customerMessage"]);
      uint64_t v25 = objc_claimAutoreleasedReturnValue( -[StoreDownloadQueueResponse _errorWithFailureType:customerMessage:]( v10,  "_errorWithFailureType:customerMessage:",  v23,  v24));
      error = v10->_error;
      v10->_error = (NSError *)v25;
    }

    id v27 = (id)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"failed-items"]);

    uint64_t v28 = objc_opt_class(&OBJC_CLASS___NSArray);
    id v97 = v9;
    id v98 = v8;
    if ((objc_opt_isKindOfClass(v27, v28) & 1) != 0)
    {
      unsigned __int8 v109 = v16;
      v105 = v11;
      id v111 = v27;
      v113 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      __int128 v131 = 0u;
      __int128 v132 = 0u;
      __int128 v133 = 0u;
      __int128 v134 = 0u;
      id v29 = v27;
      id v30 = [v29 countByEnumeratingWithState:&v131 objects:v139 count:16];
      if (v30)
      {
        id v31 = v30;
        uint64_t v32 = *(void *)v132;
        do
        {
          for (i = 0LL; i != v31; i = (char *)i + 1)
          {
            if (*(void *)v132 != v32) {
              objc_enumerationMutation(v29);
            }
            v34 = *(void **)(*((void *)&v131 + 1) + 8LL * (void)i);
            uint64_t v35 = objc_opt_class(&OBJC_CLASS___NSDictionary);
            if ((objc_opt_isKindOfClass(v34, v35) & 1) != 0)
            {
              v36 = (void *)objc_claimAutoreleasedReturnValue([v34 objectForKey:@"item-id"]);
              v37 = (void *)objc_claimAutoreleasedReturnValue([v34 objectForKey:@"failureType"]);
              v38 = (void *)objc_claimAutoreleasedReturnValue([v34 objectForKey:@"customerMessage"]);
              v39 = (void *)objc_claimAutoreleasedReturnValue( -[StoreDownloadQueueResponse _errorWithFailureType:customerMessage:]( v10,  "_errorWithFailureType:customerMessage:",  v37,  v38));

              if (v36) {
                BOOL v40 = v39 == 0LL;
              }
              else {
                BOOL v40 = 1;
              }
              if (!v40) {
                -[NSMutableDictionary setObject:forKey:](v113, "setObject:forKey:", v39, v36);
              }
            }
          }

          id v31 = [v29 countByEnumeratingWithState:&v131 objects:v139 count:16];
        }

        while (v31);
      }

      v41 = (NSDictionary *)-[NSMutableDictionary copy](v113, "copy");
      itemErrors = v10->_itemErrors;
      v10->_itemErrors = v41;

      id v9 = v97;
      id v8 = v98;
      v11 = v105;
      v18 = &ACSLocateCachingServer_ptr;
      id v27 = v111;
      unsigned __int8 v16 = v109;
    }

    uint64_t v43 = objc_claimAutoreleasedReturnValue([v8 objectForKey:@"keybag"]);
    keybag = v10->_keybag;
    v10->_keybag = (NSData *)v43;

    v45 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"dsPersonId"]);
    uint64_t UniqueIdentifierFromValue = SSAccountGetUniqueIdentifierFromValue();
    v47 = (void *)objc_claimAutoreleasedReturnValue(UniqueIdentifierFromValue);

    if (v47) {
      v48 = v47;
    }
    else {
      v48 = v9;
    }
    v49 = (NSNumber *)[v48 copy];
    userIdentifier = v10->_userIdentifier;
    v10->_userIdentifier = v49;

    if ((v16 & 1) == 0)
    {
      uint64_t v51 = objc_claimAutoreleasedReturnValue([v8 objectForKey:@"items"]);

      id v27 = (id)v51;
      if (!v51) {
        id v27 = (id)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"songList"]);
      }
      uint64_t v52 = objc_opt_class(&OBJC_CLASS___NSArray);
      if ((objc_opt_isKindOfClass(v27, v52) & 1) != 0)
      {
        v95 = v47;
        v53 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
        downloads = v10->_downloads;
        v10->_downloads = v53;

        __int128 v129 = 0u;
        __int128 v130 = 0u;
        __int128 v127 = 0u;
        __int128 v128 = 0u;
        id v27 = v27;
        id v55 = [v27 countByEnumeratingWithState:&v127 objects:v138 count:16];
        if (v55)
        {
          id v56 = v55;
          uint64_t v57 = *(void *)v128;
          do
          {
            v58 = v27;
            for (j = 0LL; j != v56; j = (char *)j + 1)
            {
              if (*(void *)v128 != v57) {
                objc_enumerationMutation(v58);
              }
              v60 = -[StoreDownload initWithDictionary:]( objc_alloc(&OBJC_CLASS___StoreDownload),  "initWithDictionary:",  *(void *)(*((void *)&v127 + 1) + 8LL * (void)j));
              if (-[StoreDownload itemIdentifier](v60, "itemIdentifier"))
              {
                v61 = (void *)objc_claimAutoreleasedReturnValue(-[StoreDownload bundleIdentifier](v60, "bundleIdentifier"));
                id v62 = [v61 length];

                if (v62)
                {
                  v63 = (void *)objc_claimAutoreleasedReturnValue(-[StoreDownload bundleIdentifier](v60, "bundleIdentifier"));
                  v64 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[StoreDownload itemIdentifier](v60, "itemIdentifier")));
                  -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v63, v64);
                }
              }

              if ([v100 length]) {
                -[StoreDownload setPreferredAssetFlavor:](v60, "setPreferredAssetFlavor:", v100);
              }
              -[NSMutableOrderedSet addObject:](v10->_downloads, "addObject:", v60);
            }

            id v27 = v58;
            id v56 = [v58 countByEnumeratingWithState:&v127 objects:v138 count:16];
          }

          while (v56);
        }

        id v9 = v97;
        id v8 = v98;
        v18 = &ACSLocateCachingServer_ptr;
        v47 = v95;
      }
    }

    v65 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"cancel-purchase-batch"]);

    if ((objc_opt_respondsToSelector(v65, "BOOLValue") & 1) != 0) {
      unsigned __int8 v66 = [v65 BOOLValue];
    }
    else {
      unsigned __int8 v66 = 0;
    }
    v10->_shouldCancelPurchaseBatch = v66;
    v67 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"appClusterAssignmentsResultSet"]);

    uint64_t v68 = objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v67, v68) & 1) != 0)
    {
      v96 = v47;
      v69 = objc_opt_new(&OBJC_CLASS___NSMutableOrderedSet);
      clusterMappings = v10->_clusterMappings;
      v10->_clusterMappings = v69;

      __int128 v125 = 0u;
      __int128 v126 = 0u;
      __int128 v123 = 0u;
      __int128 v124 = 0u;
      v94 = v67;
      id obj = v67;
      id v71 = [obj countByEnumeratingWithState:&v123 objects:v137 count:16];
      if (v71)
      {
        id v72 = v71;
        uint64_t v73 = *(void *)v124;
        v106 = v11;
        uint64_t v99 = *(void *)v124;
        do
        {
          uint64_t v74 = 0LL;
          id v101 = v72;
          do
          {
            if (*(void *)v124 != v73) {
              objc_enumerationMutation(obj);
            }
            uint64_t v104 = v74;
            v75 = *(void **)(*((void *)&v123 + 1) + 8 * v74);
            v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "objectForKeyedSubscript:", @"clusterVersionId", v94));
            v77 = (void *)objc_claimAutoreleasedReturnValue([v75 objectForKeyedSubscript:@"appsClusterAssignments"]);
            uint64_t v78 = objc_opt_class(v18[348]);
            if ((objc_opt_isKindOfClass(v77, v78) & 1) != 0)
            {
              __int128 v121 = 0u;
              __int128 v122 = 0u;
              __int128 v119 = 0u;
              __int128 v120 = 0u;
              v103 = v77;
              id v107 = v77;
              id v112 = [v107 countByEnumeratingWithState:&v119 objects:v136 count:16];
              if (v112)
              {
                uint64_t v110 = *(void *)v120;
                do
                {
                  uint64_t v79 = 0LL;
                  do
                  {
                    if (*(void *)v120 != v110) {
                      objc_enumerationMutation(v107);
                    }
                    uint64_t v114 = v79;
                    v80 = *(void **)(*((void *)&v119 + 1) + 8 * v79);
                    v81 = (void *)objc_claimAutoreleasedReturnValue([v80 objectForKeyedSubscript:@"adamId"]);
                    v82 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v11, "objectForKey:", v81));
                    v83 = (void *)objc_claimAutoreleasedReturnValue([v80 objectForKeyedSubscript:@"clusterAssignments"]);
                    if (v82)
                    {
                      uint64_t v84 = objc_opt_class(v18[348]);
                      if ((objc_opt_isKindOfClass(v83, v84) & 1) != 0)
                      {
                        __int128 v117 = 0u;
                        __int128 v118 = 0u;
                        __int128 v115 = 0u;
                        __int128 v116 = 0u;
                        v108 = v83;
                        id v85 = v83;
                        id v86 = [v85 countByEnumeratingWithState:&v115 objects:v135 count:16];
                        if (v86)
                        {
                          id v87 = v86;
                          uint64_t v88 = *(void *)v116;
                          do
                          {
                            for (k = 0LL; k != v87; k = (char *)k + 1)
                            {
                              if (*(void *)v116 != v88) {
                                objc_enumerationMutation(v85);
                              }
                              v90 = -[AppClusterMapping initWithItemID:bundleID:clusterVersionID:dictionary:]( objc_alloc(&OBJC_CLASS___AppClusterMapping),  "initWithItemID:bundleID:clusterVersionID:dictionary:",  v81,  v82,  v76,  *(void *)(*((void *)&v115 + 1) + 8LL * (void)k));
                              -[NSMutableOrderedSet addObject:](v10->_clusterMappings, "addObject:", v90);
                            }

                            id v87 = [v85 countByEnumeratingWithState:&v115 objects:v135 count:16];
                          }

                          while (v87);
                        }

                        v11 = v106;
                        v18 = &ACSLocateCachingServer_ptr;
                        v83 = v108;
                      }
                    }

                    uint64_t v79 = v114 + 1;
                  }

                  while ((id)(v114 + 1) != v112);
                  id v112 = [v107 countByEnumeratingWithState:&v119 objects:v136 count:16];
                }

                while (v112);
              }

              uint64_t v73 = v99;
              id v72 = v101;
              v77 = v103;
            }

            uint64_t v74 = v104 + 1;
          }

          while ((id)(v104 + 1) != v72);
          id v72 = [obj countByEnumeratingWithState:&v123 objects:v137 count:16];
        }

        while (v72);
      }

      id v9 = v97;
      id v8 = v98;
      v67 = v94;
      v47 = v96;
    }

    id v91 = [[SSDictionaryResponse alloc] initWithResponseDictionary:v8];
    v92 = (void *)objc_claimAutoreleasedReturnValue([v91 actionsWithActionType:SSResponseActionTypeCheckDownloadQueues]);
    v10->_triggeredQueueCheck = [v92 count] != 0;
  }

  return v10;
}

- (StoreDownloadQueueResponse)initWithError:(id)a3 userIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = -[StoreDownloadQueueResponse _initStoreDownloadQueueResponse](self, "_initStoreDownloadQueueResponse");
  v10 = (StoreDownloadQueueResponse *)v9;
  if (v9)
  {
    objc_storeStrong(v9 + 4, a3);
    v11 = (NSNumber *)[v8 copy];
    userIdentifier = v10->_userIdentifier;
    v10->_userIdentifier = v11;
  }

  return v10;
}

- (NSOrderedSet)downloads
{
  return (NSOrderedSet *)-[NSMutableOrderedSet copy](self->_downloads, "copy");
}

- (NSError)error
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_10000EC38;
  v10 = sub_10000EC48;
  id v11 = 0LL;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000EC50;
  v5[3] = &unk_10034AFE0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSError *)v3;
}

- (id)errorForItemIdentifier:(id)a3
{
  return -[NSDictionary objectForKey:](self->_itemErrors, "objectForKey:", a3);
}

- (NSData)keybag
{
  return self->_keybag;
}

- (NSArray)rangesToLoad
{
  return self->_rangesToLoad;
}

- (void)setError:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000ECF8;
  block[3] = &unk_10034AD58;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(dispatchQueue, block);
}

- (void)setShouldCancelPurchaseBatch:(BOOL)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10000ED74;
  v4[3] = &unk_10034B008;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (void)setTriggeredQueueCheck:(BOOL)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10000EDE0;
  v4[3] = &unk_10034B008;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (BOOL)shouldCancelPurchaseBatch
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000EE80;
  v5[3] = &unk_10034AFE0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)triggeredQueueCheck
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000EF24;
  v5[3] = &unk_10034AFE0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSNumber)userIdentifier
{
  return self->_userIdentifier;
}

- (id)_errorWithFailureType:(id)a3 customerMessage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {

    id v6 = 0LL;
  }

  if ((objc_opt_respondsToSelector(v5, "intValue") & 1) != 0)
  {
    uint64_t v8 = SSServerErrorDomain;
    uint64_t v9 = (int)[v5 intValue];
    uint64_t v10 = v8;
  }

  else
  {
    uint64_t v10 = SSErrorDomain;
    uint64_t v9 = 100LL;
  }

  uint64_t v11 = SSError(v10, v9, v6, 0LL);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  return v12;
}

- (NSOrderedSet)clusterMappings
{
  return (NSOrderedSet *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSString)storeCorrelationID
{
  return self->_storeCorrelationID;
}

- (void)setStoreCorrelationID:(id)a3
{
  self->_storeCorrelationID = (NSString *)a3;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
  self->_clientIdentifier = (NSString *)a3;
}

- (void).cxx_destruct
{
}

- (id)copyJobManifestWithAccountID:(id)a3 accountName:(id)a4
{
  id v5 = -[StoreDownloadQueueResponse _newManifestWithStoreDownloadQueueResponse:accountID:accountName:]( self,  "_newManifestWithStoreDownloadQueueResponse:accountID:accountName:",  self,  a3,  a4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[StoreDownloadQueueResponse storeCorrelationID](self, "storeCorrelationID"));
  [v5 setStoreCorrelationID:v6];

  return v5;
}

- (void)enumerateActivitiesWithAccountID:(id)a3 accountName:(id)a4 usingBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v44 = (void (**)(id, id))a5;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  v48 = self;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[StoreDownloadQueueResponse downloads](self, "downloads"));
  id v10 = [obj countByEnumeratingWithState:&v49 objects:v57 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v50;
    id v45 = v8;
    id v47 = v9;
    do
    {
      uint64_t v13 = 0LL;
      do
      {
        if (*(void *)v50 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v49 + 1) + 8LL * (void)v13);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "kind", v42));
        int IsSoftwareKind = SSDownloadKindIsSoftwareKind(v15);

        if (IsSoftwareKind)
        {
          id v17 = [v14 copyJobActivity];
          v18 = (void *)objc_claimAutoreleasedReturnValue([v17 bundleID]);
          id v19 = [v18 length];

          uint64_t v20 = objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
          uint64_t v21 = (void *)v20;
          if (!v19)
          {
            if (!v20) {
              uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
            }
            LODWORD(v36) = [v21 shouldLog];
            v37 = (os_log_s *)objc_claimAutoreleasedReturnValue([v21 OSLogObject]);
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT)) {
              uint64_t v36 = v36;
            }
            else {
              v36 &= 2u;
            }
            if ((_DWORD)v36)
            {
              v38 = (void *)objc_opt_class(v48);
              int v53 = 138412546;
              v54 = v38;
              __int16 v55 = 2112;
              id v56 = v14;
              id v39 = v38;
              LODWORD(v43) = 22;
              BOOL v40 = (void *)_os_log_send_and_compose_impl( v36,  0LL,  0LL,  0LL,  &_mh_execute_header,  v37,  0LL,  "[%@]: Skipping store download %@ due to lack of bundleID",  &v53,  v43);

              id v9 = v47;
              if (!v40) {
                goto LABEL_45;
              }
              v37 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v40,  4LL));
              free(v40);
              v42 = v37;
              SSFileLog(v21, @"%@");
            }

            goto LABEL_45;
          }

          if (!v20) {
            uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
          }
          unsigned int v22 = [v21 shouldLog];
          v23 = (os_log_s *)objc_claimAutoreleasedReturnValue([v21 OSLogObject]);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
            uint64_t v24 = v22;
          }
          else {
            uint64_t v24 = v22 & 2;
          }
          if ((_DWORD)v24)
          {
            uint64_t v25 = (void *)objc_opt_class(v48);
            id v26 = v25;
            id v27 = (void *)objc_claimAutoreleasedReturnValue([v17 bundleID]);
            int v53 = 138412546;
            v54 = v25;
            __int16 v55 = 2112;
            id v56 = v27;
            LODWORD(v43) = 22;
            uint64_t v28 = (void *)_os_log_send_and_compose_impl( v24,  0LL,  0LL,  0LL,  &_mh_execute_header,  v23,  2LL,  "[%@]: Adding download with bundleID: %@",  &v53,  v43);

            id v8 = v45;
            id v9 = v47;

            if (v28)
            {
              v23 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v28,  4LL));
              free(v28);
              v42 = v23;
              SSFileLog(v21, @"%@");
              goto LABEL_18;
            }
          }

          else
          {
LABEL_18:
          }

          id v29 = (void *)objc_claimAutoreleasedReturnValue(-[StoreDownloadQueueResponse clientIdentifier](v48, "clientIdentifier"));
          [v17 setClientID:v29];

          [v17 setIsFromStore:1];
          if (v8) {
            [v17 setStoreAccountID:v8];
          }
          if (v9) {
            [v17 setStoreAccountName:v9];
          }
          v44[2](v44, v17);
          goto LABEL_46;
        }

        id v17 = (id)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
        if (!v17) {
          id v17 = (id)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
        }
        unsigned int v30 = [v17 shouldLog];
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v17 OSLogObject]);
        if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_DEFAULT)) {
          uint64_t v31 = v30;
        }
        else {
          uint64_t v31 = v30 & 2;
        }
        if (!(_DWORD)v31) {
          goto LABEL_45;
        }
        uint64_t v32 = (void *)objc_opt_class(v48);
        id v33 = v32;
        v34 = (void *)objc_claimAutoreleasedReturnValue([v14 kind]);
        int v53 = 138412546;
        v54 = v32;
        __int16 v55 = 2112;
        id v56 = v34;
        LODWORD(v43) = 22;
        uint64_t v35 = (void *)_os_log_send_and_compose_impl( v31,  0LL,  0LL,  0LL,  &_mh_execute_header,  v21,  0LL,  "[%@]: Skipped over unexpected download kind %@",  &v53,  v43);

        if (v35)
        {
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v35,  4LL));
          free(v35);
          v42 = (os_log_s *)v21;
          SSFileLog(v17, @"%@");
          id v8 = v45;
          id v9 = v47;
LABEL_45:

          goto LABEL_46;
        }

        id v8 = v45;
        id v9 = v47;
LABEL_46:

        uint64_t v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v41 = [obj countByEnumeratingWithState:&v49 objects:v57 count:16];
      id v11 = v41;
    }

    while (v41);
  }
}

- (id)_newManifestWithStoreDownloadQueueResponse:(id)a3 accountID:(id)a4 accountName:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v45 = objc_msgSend( objc_alloc((Class)ISWeakLinkedClassForString(@"ASDJobManifest", 29)),  "initWithManifestType:",  0);
  v46 = v7;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 downloads]);
  id v11 = [v10 countByEnumeratingWithState:&v48 objects:v56 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v49;
    uint64_t v43 = *(void *)v49;
    v42 = v10;
    do
    {
      uint64_t v14 = 0LL;
      id v47 = v12;
      do
      {
        if (*(void *)v49 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v48 + 1) + 8LL * (void)v14);
        unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "kind", v40));
        int IsSoftwareKind = SSDownloadKindIsSoftwareKind(v16);

        if (IsSoftwareKind)
        {
          id v18 = [v15 copyJobActivity];
          id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 bundleID]);
          id v20 = [v19 length];

          uint64_t v21 = objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
          unsigned int v22 = (void *)v21;
          if (v20)
          {
            if (!v21) {
              unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
            }
            LODWORD(v23) = [v22 shouldLog];
            uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue([v22 OSLogObject]);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO)) {
              uint64_t v23 = v23;
            }
            else {
              v23 &= 2u;
            }
            if ((_DWORD)v23)
            {
              uint64_t v25 = (void *)objc_opt_class(self);
              id v26 = v9;
              id v27 = v8;
              id v28 = v25;
              id v29 = (void *)objc_claimAutoreleasedReturnValue([v18 bundleID]);
              int v52 = 138412546;
              int v53 = v25;
              __int16 v54 = 2112;
              __int16 v55 = v29;
              LODWORD(v41) = 22;
              unsigned int v30 = (void *)_os_log_send_and_compose_impl( v23,  0LL,  0LL,  0LL,  &_mh_execute_header,  v24,  1LL,  "[%@]: Adding download with bundleID: %@",  &v52,  v41);

              uint64_t v13 = v43;
              id v8 = v27;
              id v9 = v26;
              id v10 = v42;

              if (v30)
              {
                uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v30,  4LL));
                free(v30);
                BOOL v40 = v24;
                SSFileLog(v22, @"%@");
                goto LABEL_18;
              }
            }

            else
            {
LABEL_18:
            }

            uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v46 clientIdentifier]);
            [v18 setClientID:v31];

            if (v8) {
              [v18 setStoreAccountID:v8];
            }
            id v12 = v47;
            if (v9) {
              [v18 setStoreAccountName:v9];
            }
            objc_msgSend(v18, "setIsFromStore:", 1, v40);
            id v32 = [v45 addActivity:v18];
LABEL_37:

            goto LABEL_38;
          }

          if (!v21) {
            unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
          }
          unsigned int v33 = [v22 shouldLog];
          else {
            LODWORD(v34) = v33;
          }
          uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue([v22 OSLogObject]);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO)) {
            uint64_t v34 = v34;
          }
          else {
            v34 &= 2u;
          }
          if ((_DWORD)v34)
          {
            uint64_t v36 = (void *)objc_opt_class(self);
            int v52 = 138412546;
            int v53 = v36;
            __int16 v54 = 2112;
            __int16 v55 = v15;
            id v37 = v36;
            LODWORD(v41) = 22;
            v38 = (void *)_os_log_send_and_compose_impl( v34,  0LL,  0LL,  0LL,  &_mh_execute_header,  v35,  1LL,  "[%@]: Skipping store download %@ due to lack of bundleID",  &v52,  v41);

            uint64_t v13 = v43;
            if (v38)
            {
              uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v38,  4LL));
              free(v38);
              BOOL v40 = v35;
              SSFileLog(v22, @"%@");
              goto LABEL_35;
            }
          }

          else
          {
LABEL_35:
          }

          id v12 = v47;
          goto LABEL_37;
        }

@end