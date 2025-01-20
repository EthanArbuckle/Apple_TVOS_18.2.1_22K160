@interface PurchaseDownloadsTransaction
- (BOOL)_addPlaceholderDownloadForPurchase:(id)a3 clientIdentifier:(id)a4;
- (BOOL)_cancelDownloadForPurchaseIdentifier:(int64_t)a3;
- (BOOL)_insertPurchases:(id)a3 forClient:(id)a4 orderIdentifier:(double)a5 orderSpacing:(double)a6;
- (BOOL)addPurchases:(id)a3 forClient:(id)a4;
- (BOOL)cancelPurchaseWithIdentifier:(int64_t)a3 applyingProperties:(id)a4;
- (BOOL)deletePurchaseWithIdentifier:(int64_t)a3;
- (BOOL)insertPurchases:(id)a3 afterPurchaseWithIdentifier:(int64_t)a4 forClient:(id)a5;
- (BOOL)movePurchasesWithIdentifiers:(id)a3 afterPurchaseWithIdentifier:(int64_t)a4;
- (BOOL)replaceDownloadsInQuery:(id)a3 withStoreDownloads:(id)a4 accountID:(id)a5;
- (BOOL)resetPurchasedAutoUpdateForStoreItemID:(id)a3;
- (double)_maxOrderIdentifier;
- (id)_addEntityForPurchase:(id)a3 managerIdentifier:(int64_t)a4 orderIdentifier:(double)a5;
- (id)existingDownloadForPurchase:(id)a3;
- (id)replacePurchase:(id)a3 withDownloadQueueResponse:(id)a4;
- (id)replacePurchase:(id)a3 withDownloadQueueResponse:(id)a4 withClientIdentifier:(id)a5;
- (int64_t)_nextBatchIdentifier;
- (void)_getInsertOrderID:(double *)a3 nextOrderID:(double *)a4 afterPurchaseID:(int64_t)a5;
@end

@implementation PurchaseDownloadsTransaction

- (BOOL)addPurchases:(id)a3 forClient:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[PurchaseDownloadsTransaction _maxOrderIdentifier](self, "_maxOrderIdentifier");
  LOBYTE(self) = -[PurchaseDownloadsTransaction _insertPurchases:forClient:orderIdentifier:orderSpacing:]( self,  "_insertPurchases:forClient:orderIdentifier:orderSpacing:",  v7,  v6);

  return (char)self;
}

- (BOOL)cancelPurchaseWithIdentifier:(int64_t)a3 applyingProperties:(id)a4
{
  id v6 = a4;
  if (-[PurchaseDownloadsTransaction _cancelDownloadForPurchaseIdentifier:]( self,  "_cancelDownloadForPurchaseIdentifier:",  a3))
  {
    id v7 = objc_alloc(&OBJC_CLASS___PurchaseEntity);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadsSession database](self, "database"));
    v9 = -[PurchaseEntity initWithPersistentID:inDatabase:](v7, "initWithPersistentID:inDatabase:", a3, v8);

    if ([v6 count])
    {
      id v10 = [v6 mutableCopy];
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 2LL));
      [v10 setObject:v11 forKey:@"state"];

      unsigned __int8 v12 = -[PurchaseEntity setValuesWithDictionary:](v9, "setValuesWithDictionary:", v10);
    }

    else
    {
      id v10 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 2LL));
      unsigned __int8 v12 = -[PurchaseEntity setValue:forProperty:](v9, "setValue:forProperty:", v10, @"state");
    }

    BOOL v13 = v12;
  }

  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)deletePurchaseWithIdentifier:(int64_t)a3
{
  BOOL v5 = -[PurchaseDownloadsTransaction _cancelDownloadForPurchaseIdentifier:]( self,  "_cancelDownloadForPurchaseIdentifier:");
  if (v5)
  {
    id v6 = objc_alloc(&OBJC_CLASS___PurchaseEntity);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadsSession database](self, "database"));
    v8 = -[PurchaseEntity initWithPersistentID:inDatabase:](v6, "initWithPersistentID:inDatabase:", a3, v7);

    LOBYTE(v7) = -[PurchaseEntity deleteFromDatabase](v8, "deleteFromDatabase");
    LOBYTE(v5) = (_BYTE)v7;
  }

  return v5;
}

- (id)existingDownloadForPurchase:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0LL;
  v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  v18 = sub_10016EE30;
  v19 = sub_10016EE40;
  id v20 = 0LL;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForDownloadProperty:SSDownloadPropertyStoreItemIdentifier]);
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 longLongValue];
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteComparisonPredicate predicateWithProperty:equalToLongLong:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToLongLong:",  @"store_item_id",  v7));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadsSession database](self, "database"));
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[Download queryWithDatabase:predicate:]( &OBJC_CLASS___Download,  "queryWithDatabase:predicate:",  v9,  v8));

      v21[0] = @"IFNULL(download_state.phase, SSDownloadPhaseWaiting)";
      v21[1] = @"kind";
      v21[2] = @"is_purchase";
      v21[3] = @"purchase_id";
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v21, 4LL));
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_10016EE48;
      v14[3] = &unk_100350488;
      v14[4] = self;
      v14[5] = &v15;
      [v10 enumerateMemoryEntitiesWithProperties:v11 usingBlock:v14];
    }
  }

  id v12 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v12;
}

- (BOOL)insertPurchases:(id)a3 afterPurchaseWithIdentifier:(int64_t)a4 forClient:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  double v14 = 0.0;
  double v15 = 0.0;
  -[PurchaseDownloadsTransaction _getInsertOrderID:nextOrderID:afterPurchaseID:]( self,  "_getInsertOrderID:nextOrderID:afterPurchaseID:",  &v15,  &v14,  a4);
  if (v14 <= 0.0)
  {
    double v11 = 100.0;
  }

  else
  {
    double v10 = vabdd_f64(v14, v15);
    double v11 = v10 / (double)((unint64_t)[v8 count] + 1);
  }

  BOOL v12 = -[PurchaseDownloadsTransaction _insertPurchases:forClient:orderIdentifier:orderSpacing:]( self,  "_insertPurchases:forClient:orderIdentifier:orderSpacing:",  v8,  v9,  v15,  v11);

  return v12;
}

- (BOOL)movePurchasesWithIdentifiers:(id)a3 afterPurchaseWithIdentifier:(int64_t)a4
{
  id v6 = a3;
  double v25 = 0.0;
  double v26 = 0.0;
  -[PurchaseDownloadsTransaction _getInsertOrderID:nextOrderID:afterPurchaseID:]( self,  "_getInsertOrderID:nextOrderID:afterPurchaseID:",  &v26,  &v25,  a4);
  if (v25 <= 0.0)
  {
    double v8 = 100.0;
  }

  else
  {
    double v7 = vabdd_f64(v25, v26);
    double v8 = v7 / (double)((unint64_t)[v6 count] + 1);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadsSession database](self, "database"));
  double v10 = v26;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v11 = v6;
  id v12 = [v11 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        double v10 = v8 + v10;
        v16 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        uint64_t v17 = objc_alloc(&OBJC_CLASS___PurchaseEntity);
        v18 = -[PurchaseEntity initWithPersistentID:inDatabase:]( v17,  "initWithPersistentID:inDatabase:",  objc_msgSend(v16, "longLongValue", (void)v21),  v9);
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v10));
        -[PurchaseEntity setValue:forProperty:](v18, "setValue:forProperty:", v19, @"order_id");
      }

      id v13 = [v11 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }

    while (v13);
  }

  return 1;
}

- (BOOL)resetPurchasedAutoUpdateForStoreItemID:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___SSSQLiteQueryDescriptor);
  [v5 setEntityClass:objc_opt_class(DownloadEntity)];
  [v5 setLimitCount:1];
  id v20 = @"auto_update_time";
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v20, 1LL));
  [v5 setOrderingProperties:v6];

  uint64_t v19 = SSSQLiteOrderDescending;
  double v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v19, 1LL));
  [v5 setOrderingDirections:v7];

  double v8 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"is_private",  &__kCFBooleanTrue));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"is_automatic",  &off_10036D968));
  double v10 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"store_item_id",  v4));

  v18[0] = v8;
  v18[1] = v9;
  v18[2] = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 3LL));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SSSQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v11));
  [v5 setPredicate:v12];

  id v13 = objc_alloc(&OBJC_CLASS___SSSQLiteQuery);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadsSession database](self, "database"));
  double v15 = -[SSSQLiteQuery initWithDatabase:descriptor:](v13, "initWithDatabase:descriptor:", v14, v5);

  id v16 = -[SSSQLiteQuery copyEntityIdentifiers](v15, "copyEntityIdentifiers");
  LOBYTE(self) = -[DownloadsTransaction resetDownloadsWithIdentifiers:isUserInitiated:]( self,  "resetDownloadsWithIdentifiers:isUserInitiated:",  v16,  0LL);

  return (char)self;
}

- (BOOL)replaceDownloadsInQuery:(id)a3 withStoreDownloads:(id)a4 accountID:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v39 = 0LL;
  v40 = &v39;
  uint64_t v41 = 0x2020000000LL;
  char v42 = 1;
  v29 = v7;
  id v10 = [v7 copyEntityIdentifiers];
  id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v12 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v8 count]);
  id v13 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v8 count]);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_10016F99C;
  v31[3] = &unk_1003504B0;
  id v14 = v9;
  id v32 = v14;
  v33 = self;
  double v15 = v12;
  v34 = v15;
  id v16 = v13;
  v35 = v16;
  v38 = &v39;
  uint64_t v17 = v11;
  v36 = v17;
  id v18 = v10;
  id v37 = v18;
  [v8 enumerateObjectsUsingBlock:v31];
  if (*((_BYTE *)v40 + 24) && [v18 count])
  {
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v19) {
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    LODWORD(v20) = [v19 shouldLog];
    unsigned int v21 = [v19 shouldLogToDisk];
    __int128 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue([v19 OSLogObject]);
    __int128 v23 = v22;
    if (v21) {
      LODWORD(v20) = v20 | 2;
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO)) {
      uint64_t v20 = v20;
    }
    else {
      v20 &= 2u;
    }
    if ((_DWORD)v20)
    {
      id v24 = (id)objc_opt_class(self);
      id v25 = [v18 count];
      int v43 = 138412546;
      id v44 = v24;
      __int16 v45 = 2048;
      id v46 = v25;
      double v26 = (void *)_os_log_send_and_compose_impl( v20,  0LL,  0LL,  0LL,  &_mh_execute_header,  v23,  1LL,  "%@: Pruning %lu removed downloads",  &v43,  22);

      if (!v26)
      {
LABEL_14:

        -[DownloadsTransaction finishDownloadsWithIdentifiers:finalPhase:]( self,  "finishDownloadsWithIdentifiers:finalPhase:",  v18,  SSDownloadPhaseCanceled);
        goto LABEL_15;
      }

      __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v26,  4LL));
      free(v26);
      SSFileLog(v19, @"%@");
    }

    goto LABEL_14;
  }

- (id)replacePurchase:(id)a3 withDownloadQueueResponse:(id)a4
{
  return -[PurchaseDownloadsTransaction replacePurchase:withDownloadQueueResponse:withClientIdentifier:]( self,  "replacePurchase:withDownloadQueueResponse:withClientIdentifier:",  a3,  a4,  @"com.apple.itunesstored");
}

- (id)replacePurchase:(id)a3 withDownloadQueueResponse:(id)a4 withClientIdentifier:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v132 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableOrderedSet orderedSet](&OBJC_CLASS___NSMutableOrderedSet, "orderedSet"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 downloads]);
  id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v139 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v10 count]);
  v136 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v10 count]);
  if ([v10 count] == (id)1)
  {
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v7 valueForDownloadProperty:SSDownloadPropertyKind]);
    id v13 = (void *)v12;
    else {
      v152 = (void *)objc_claimAutoreleasedReturnValue([v7 buyParameters]);
    }
  }

  else
  {
    v152 = 0LL;
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[ApplicationWorkspace defaultWorkspace](&OBJC_CLASS___ApplicationWorkspace, "defaultWorkspace"));
  unsigned int v145 = [v14 isMultiUser];

  double v15 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadsSession placeholderDownloadForPurchase:](self, "placeholderDownloadForPurchase:", v7));
  v134 = v15;
  if (v15) {
    id v133 = [v15 persistentID];
  }
  else {
    id v133 = 0LL;
  }
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v7 downloadPolicy]);
  uint64_t v17 = &ACSLocateCachingServer_ptr;
  if (v16)
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v18) {
      id v18 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v19 = [v18 shouldLog];
    else {
      LODWORD(v20) = v19;
    }
    unsigned int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 OSLogObject]);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO)) {
      uint64_t v20 = v20;
    }
    else {
      v20 &= 2u;
    }
    if (!(_DWORD)v20)
    {

      v140 = 0LL;
      goto LABEL_40;
    }

    id v22 = (id)objc_opt_class(self);
    int v166 = 138412546;
    id v167 = v22;
    __int16 v168 = 2112;
    id v169 = v16;
    __int128 v23 = (void *)_os_log_send_and_compose_impl( v20,  0LL,  0LL,  0LL,  &_mh_execute_header,  v21,  1LL,  "%@: Using custom policy for purchase: %@",  &v166,  22);

    if (v23)
    {
      id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v23,  4LL));
      free(v23);
      v127 = v24;
      SSFileLog(v18, @"%@");
    }

    v140 = 0LL;
  }

  else
  {
    v140 = (void *)objc_claimAutoreleasedReturnValue([v7 networkConstraints]);
    if (!v140)
    {
      v140 = 0LL;
      goto LABEL_41;
    }

    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v18) {
      id v18 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v25 = [v18 shouldLog];
    else {
      LODWORD(v26) = v25;
    }
    BOOL v27 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 OSLogObject]);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO)) {
      uint64_t v26 = v26;
    }
    else {
      v26 &= 2u;
    }
    if (!(_DWORD)v26)
    {

      goto LABEL_40;
    }

    id v28 = (id)objc_opt_class(self);
    int v166 = 138412546;
    id v167 = v28;
    __int16 v168 = 2112;
    id v169 = v140;
    v29 = (void *)_os_log_send_and_compose_impl( v26,  0LL,  0LL,  0LL,  &_mh_execute_header,  v27,  1LL,  "%@: Using custom network constraints for purchase: %@",  &v166,  22);

    if (v29)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v29,  4LL));
      free(v29);
      v127 = v30;
      SSFileLog(v18, @"%@");
    }
  }

  uint64_t v17 = &ACSLocateCachingServer_ptr;
LABEL_40:

LABEL_41:
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "requestProperties", v127));
  id v32 = (void *)objc_claimAutoreleasedReturnValue([v31 URLBagKey]);
  unsigned int v33 = [v32 isEqualToString:@"subDownload"];

  v34 = &off_10036D968;
  unsigned int v144 = v33;
  if (!v33) {
    v34 = 0LL;
  }
  v138 = v34;
  v147 = (void *)objc_claimAutoreleasedReturnValue([v7 valueForDownloadProperty:SSDownloadPropertyEnableExtensions]);
  v146 = (void *)objc_claimAutoreleasedReturnValue([v8 userIdentifier]);
  v148 = (void *)objc_claimAutoreleasedReturnValue([v7 filteredAssetTypes]);
  v151 = (void *)objc_claimAutoreleasedReturnValue([v7 valueForDownloadProperty:SSDownloadPropertyShouldCancelIfDuplicate]);
  v35 = (void *)objc_claimAutoreleasedReturnValue([v17[459] sharedDaemonConfig]);
  if (!v35) {
    v35 = (void *)objc_claimAutoreleasedReturnValue([v17[459] sharedConfig]);
  }
  v135 = v11;
  id v131 = v8;
  unsigned int v36 = [v35 shouldLog];
  else {
    LODWORD(v37) = v36;
  }
  v38 = (os_log_s *)objc_claimAutoreleasedReturnValue([v35 OSLogObject]);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO)) {
    uint64_t v37 = v37;
  }
  else {
    v37 &= 2u;
  }
  if (!(_DWORD)v37) {
    goto LABEL_54;
  }
  id v39 = (id)objc_opt_class(self);
  id v40 = [v134 persistentID];
  id v41 = [v10 count];
  int v166 = 138413058;
  id v167 = v39;
  __int16 v168 = 2048;
  id v169 = v40;
  __int16 v170 = 2048;
  id v171 = v41;
  __int16 v172 = 2112;
  v173 = v148;
  LODWORD(v129) = 42;
  char v42 = (void *)_os_log_send_and_compose_impl( v37,  0LL,  0LL,  0LL,  &_mh_execute_header,  v38,  1LL,  "%@: Replacing purchase %lld with %lu downloads, filtering asset types: %@",  &v166,  v129);

  if (v42)
  {
    v38 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v42,  4LL));
    free(v42);
    v128 = v38;
    SSFileLog(v35, @"%@");
LABEL_54:
  }

  __int128 v162 = 0u;
  __int128 v163 = 0u;
  __int128 v160 = 0u;
  __int128 v161 = 0u;
  id obj = v10;
  id v149 = [obj countByEnumeratingWithState:&v160 objects:v165 count:16];
  if (!v149)
  {
    int v110 = 1;
LABEL_159:
    v111 = v131;
    v112 = v135;
    goto LABEL_162;
  }

  id v130 = v7;
  uint64_t v141 = *(void *)v161;
  uint64_t v137 = SSDownloadPhaseCanceled;
  v142 = v16;
  v143 = v9;
LABEL_57:
  int v43 = 0LL;
  while (1)
  {
    if (*(void *)v161 != v141) {
      objc_enumerationMutation(obj);
    }
    id v44 = *(void **)(*((void *)&v160 + 1) + 8LL * (void)v43);
    __int16 v45 = -[Download initWithStoreDownload:](objc_alloc(&OBJC_CLASS___Download), "initWithStoreDownload:", v44);
    id v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL));
    -[Download setValue:forProperty:](v45, "setValue:forProperty:", v46, @"is_purchase");

    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
    -[Download setValue:forProperty:](v45, "setValue:forProperty:", v47, @"is_from_store");

    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v145));
    -[Download setValue:forProperty:](v45, "setValue:forProperty:", v48, @"is_shared");

    if (v16)
    {
      -[Download setDownloadPolicy:](v45, "setDownloadPolicy:", v16);
      v49 = v147;
    }

    else
    {
      v49 = v147;
      if (v140) {
        -[Download unionNetworkConstraints:](v45, "unionNetworkConstraints:", v140);
      }
    }

    if (v146) {
      -[Download setValue:forProperty:](v45, "setValue:forProperty:", v146, @"store_account_id");
    }
    if (v49) {
      -[Download setValue:forProperty:](v45, "setValue:forProperty:", v49, @"enable_extensions");
    }
    if (v152)
    {
      v50 = (void *)objc_claimAutoreleasedReturnValue(-[Download valueForProperty:](v45, "valueForProperty:", @"store_redownload_parameters"));

      if (!v50) {
        -[Download setValue:forProperty:](v45, "setValue:forProperty:", v152, @"store_redownload_parameters");
      }
    }

    __int128 v158 = 0u;
    __int128 v159 = 0u;
    __int128 v156 = 0u;
    __int128 v157 = 0u;
    id v51 = v148;
    id v52 = [v51 countByEnumeratingWithState:&v156 objects:v164 count:16];
    if (v52)
    {
      id v53 = v52;
      uint64_t v54 = *(void *)v157;
      do
      {
        for (i = 0LL; i != v53; i = (char *)i + 1)
        {
          if (*(void *)v157 != v54) {
            objc_enumerationMutation(v51);
          }
          -[Download removeAssetsWithAssetType:]( v45,  "removeAssetsWithAssetType:",  *(void *)(*((void *)&v156 + 1) + 8LL * (void)i),  v128);
        }

        id v53 = [v51 countByEnumeratingWithState:&v156 objects:v164 count:16];
      }

      while (v53);
    }

    if (v151)
    {
      v56 = (void *)objc_claimAutoreleasedReturnValue(-[Download valueForProperty:](v45, "valueForProperty:", @"cancel_if_duplicate"));

      if (!v56) {
        -[Download setValue:forProperty:](v45, "setValue:forProperty:", v151, @"cancel_if_duplicate");
      }
    }

    if (v144)
    {
      v57 = (void *)objc_claimAutoreleasedReturnValue(-[Download assets](v45, "assets"));
      v154[0] = _NSConcreteStackBlock;
      v154[1] = 3221225472LL;
      v154[2] = sub_100171CC8;
      v154[3] = &unk_1003504D8;
      id v155 = v138;
      [v57 enumerateObjectsUsingBlock:v154];
    }

    v58 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadsSession downloadForStoreDownload:](self, "downloadForStoreDownload:", v44, v128));
    v59 = (void *)objc_claimAutoreleasedReturnValue([v44 kind]);
    int IsSoftwareKind = SSDownloadKindIsSoftwareKind(v59);

    if (!IsSoftwareKind) {
      break;
    }
    -[NSMutableArray addObject:](v139, "addObject:", v45);
    if (!v58) {
      goto LABEL_100;
    }
    v61 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v61) {
      v61 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v62 = [v61 shouldLog];
    else {
      unsigned int v63 = v62;
    }
    v64 = (os_log_s *)objc_claimAutoreleasedReturnValue([v61 OSLogObject]);
    if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO)) {
      uint64_t v65 = v63;
    }
    else {
      uint64_t v65 = v63 & 2;
    }
    if (!(_DWORD)v65) {
      goto LABEL_96;
    }
    v66 = (void *)objc_opt_class(self);
    id v67 = v66;
    id v68 = [v58 persistentID];
    int v166 = 138412546;
    id v167 = v66;
    __int16 v168 = 2048;
    id v169 = v68;
    LODWORD(v129) = 22;
    v69 = (void *)_os_log_send_and_compose_impl( v65,  0LL,  0LL,  0LL,  &_mh_execute_header,  v64,  1LL,  "%@: Removing existing for software purchase: %lld",  &v166,  v129);

    if (v69)
    {
      v64 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v69,  4LL));
      free(v69);
      v128 = v64;
      SSFileLog(v61, @"%@");
LABEL_96:
    }

    -[DownloadsTransaction finishDownloadWithID:finalPhase:]( self,  "finishDownloadWithID:finalPhase:",  [v58 persistentID],  v137);
    id v70 = 0LL;
    v58 = 0LL;
LABEL_101:
    int v73 = 1;
LABEL_102:
    v74 = -[NSNumber initWithLongLong:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithLongLong:", v70);
    v75 = (void *)objc_claimAutoreleasedReturnValue([v44 kind]);
    v76 = (void *)objc_claimAutoreleasedReturnValue( +[ScratchManager directoryPathForDownloadID:kind:createIfNeeded:]( &OBJC_CLASS___ScratchManager,  "directoryPathForDownloadID:kind:createIfNeeded:",  v70,  v75,  1LL));
    v77 = (void *)objc_claimAutoreleasedReturnValue([v76 stringByAppendingPathComponent:@"iTunesMetadata.plist"]);

    [v44 writeToFile:v77 options:0 error:0];
    v78 = (void *)objc_claimAutoreleasedReturnValue([v44 kind]);
    LODWORD(v75) = SSDownloadKindIsSoftwareKind(v78);

    if ((_DWORD)v75)
    {
      v79 = (void *)objc_claimAutoreleasedReturnValue([v44 bundleIdentifier]);
      if (v79) {
        int v80 = v73;
      }
      else {
        int v80 = 0;
      }
      if (v80 == 1) {
        -[NSMutableDictionary setObject:forKey:](v135, "setObject:forKey:", v74, v79);
      }
    }

    id v9 = v143;
    objc_msgSend(v143, "addObject:", v74, v128);

    int v43 = (char *)v43 + 1;
    id v16 = v142;
    if (v43 == v149)
    {
      id v109 = [obj countByEnumeratingWithState:&v160 objects:v165 count:16];
      id v149 = v109;
      if (!v109)
      {
        int v110 = 1;
        id v7 = v130;
        goto LABEL_159;
      }

      goto LABEL_57;
    }
  }

  v71 = (void *)objc_claimAutoreleasedReturnValue([v44 kind]);
  int IsBookToShimKind = SSDownloadKindIsBookToShimKind(v71);

  if (IsBookToShimKind)
  {
    -[NSMutableArray addObject:](v136, "addObject:", v45);
LABEL_100:
    id v70 = 0LL;
    goto LABEL_101;
  }

  if (v58)
  {
    v81 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v81) {
      v81 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v82 = [v81 shouldLog];
    v83 = (os_log_s *)objc_claimAutoreleasedReturnValue([v81 OSLogObject]);
    if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO)) {
      uint64_t v84 = v82;
    }
    else {
      uint64_t v84 = v82 & 2;
    }
    if ((_DWORD)v84)
    {
      id v85 = (id)objc_opt_class(self);
      id v86 = [v58 persistentID];
      int v166 = 138412546;
      id v167 = v85;
      __int16 v168 = 2048;
      id v169 = v86;
      LODWORD(v129) = 22;
      v87 = (void *)_os_log_send_and_compose_impl( v84,  0LL,  0LL,  0LL,  &_mh_execute_header,  v83,  1LL,  "%@: Updating existing download: %lld",  &v166,  v129);

      if (v87)
      {
        v83 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v87,  4LL));
        free(v87);
        v128 = v83;
        SSFileLog(v81, @"%@");
        goto LABEL_122;
      }
    }

    else
    {
LABEL_122:
    }

    unsigned __int8 v88 = -[DownloadsTransaction updateDownloadEntityWithIdentifier:withDownload:]( self,  "updateDownloadEntityWithIdentifier:withDownload:",  [v58 persistentID],  v45);
    id v89 = [v58 persistentID];
    if ((v88 & 1) == 0) {
      goto LABEL_161;
    }
    id v70 = v89;
    int v73 = 0;
    goto LABEL_102;
  }

  id v90 = [obj count];
  uint64_t v91 = objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  v92 = (void *)v91;
  if (v90 == (id)1 && v134)
  {
    if (!v91) {
      v92 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v93 = [v92 shouldLog];
    v94 = (os_log_s *)objc_claimAutoreleasedReturnValue([v92 OSLogObject]);
    if (os_log_type_enabled(v94, OS_LOG_TYPE_INFO)) {
      uint64_t v95 = v93;
    }
    else {
      uint64_t v95 = v93 & 2;
    }
    if ((_DWORD)v95)
    {
      id v96 = (id)objc_opt_class(self);
      id v97 = [v134 persistentID];
      int v166 = 138412546;
      id v167 = v96;
      __int16 v168 = 2048;
      id v169 = v97;
      LODWORD(v129) = 22;
      v98 = (void *)_os_log_send_and_compose_impl( v95,  0LL,  0LL,  0LL,  &_mh_execute_header,  v94,  1LL,  "%@: Updating placeholder download: %lld",  &v166,  v129);

      if (v98)
      {
        v94 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v98,  4LL));
        free(v98);
        v128 = v94;
        SSFileLog(v92, @"%@");
        goto LABEL_137;
      }
    }

    else
    {
LABEL_137:
    }

    unsigned __int8 v99 = -[DownloadsTransaction updateDownloadEntityWithIdentifier:withDownload:]( self,  "updateDownloadEntityWithIdentifier:withDownload:",  [v134 persistentID],  v45);
    id v70 = [v134 persistentID];

    v134 = 0LL;
    if ((v99 & 1) == 0) {
      goto LABEL_161;
    }
    int v73 = 1;
    v58 = 0LL;
    goto LABEL_102;
  }

  if (!v91) {
    v92 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v100 = [v92 shouldLog];
  v101 = (os_log_s *)objc_claimAutoreleasedReturnValue([v92 OSLogObject]);
  if (os_log_type_enabled(v101, OS_LOG_TYPE_INFO)) {
    uint64_t v102 = v100;
  }
  else {
    uint64_t v102 = v100 & 2;
  }
  if ((_DWORD)v102)
  {
    id v103 = (id)objc_opt_class(self);
    int v166 = 138412290;
    id v167 = v103;
    LODWORD(v129) = 12;
    v104 = (void *)_os_log_send_and_compose_impl( v102,  0LL,  0LL,  0LL,  &_mh_execute_header,  v101,  1LL,  "%@: Adding new download from purchase",  &v166,  v129);

    if (v104)
    {
      v101 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v104,  4LL));
      free(v104);
      v128 = v101;
      SSFileLog(v92, @"%@");
      goto LABEL_150;
    }
  }

  else
  {
LABEL_150:
  }

  v105 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v45));
  if (v133) {
    uint64_t v106 = objc_claimAutoreleasedReturnValue( -[DownloadsTransaction insertDownloads:afterDownloadWithID:]( self,  "insertDownloads:afterDownloadWithID:",  v105));
  }
  else {
    uint64_t v106 = objc_claimAutoreleasedReturnValue(-[DownloadsTransaction addDownloads:](self, "addDownloads:", v105));
  }
  v107 = (void *)v106;

  if ([v107 count] == (id)1)
  {
    v108 = (void *)objc_claimAutoreleasedReturnValue([v107 objectAtIndex:0]);
    id v70 = [v108 longLongValue];

    v58 = 0LL;
    int v73 = 1;
    id v133 = v70;
    goto LABEL_102;
  }

LABEL_161:
  int v110 = 0;
  id v7 = v130;
  v111 = v131;
  v112 = v135;
  id v16 = v142;
  id v9 = v143;
LABEL_162:

  else {
    BOOL v113 = 1;
  }
  if ((v110 & v113) == 1 && v134)
  {
    v114 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v114) {
      v114 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v115 = objc_msgSend(v114, "shouldLog", v128);
    else {
      LODWORD(v116) = v115;
    }
    v117 = (os_log_s *)objc_claimAutoreleasedReturnValue([v114 OSLogObject]);
    if (os_log_type_enabled(v117, OS_LOG_TYPE_INFO)) {
      uint64_t v116 = v116;
    }
    else {
      v116 &= 2u;
    }
    if ((_DWORD)v116)
    {
      id v118 = (id)objc_opt_class(self);
      id v119 = [v134 persistentID];
      int v166 = 138412546;
      id v167 = v118;
      __int16 v168 = 2048;
      id v169 = v119;
      LODWORD(v129) = 22;
      v120 = (void *)_os_log_send_and_compose_impl( v116,  0LL,  0LL,  0LL,  &_mh_execute_header,  v117,  1LL,  "%@: Remove placeholder for purchase: %lld",  &v166,  v129);

      if (v120)
      {
        v117 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v120,  4LL));
        free(v120);
        v128 = v117;
        SSFileLog(v114, @"%@");
        goto LABEL_178;
      }
    }

    else
    {
LABEL_178:
    }

    id v121 = [v134 persistentID];
    if (!-[DownloadsTransaction finishDownloadWithID:finalPhase:]( self,  "finishDownloadWithID:finalPhase:",  v121,  SSDownloadPhaseCanceled))
    {
LABEL_180:

      id v9 = 0LL;
      goto LABEL_189;
    }
  }

  else if (!v110)
  {
    goto LABEL_180;
  }

  if (-[NSMutableDictionary count](v112, "count", v128)) {
    -[DownloadsTransaction reconcileSoftwareDownloads:fromITunesStore:]( self,  "reconcileSoftwareDownloads:fromITunesStore:",  v112,  1LL);
  }
  if (-[NSMutableArray count](v139, "count"))
  {
    +[AppStoreUtility sendSoftwareDownloads:withReason:forClientID:]( &OBJC_CLASS___AppStoreUtility,  "sendSoftwareDownloads:withReason:forClientID:",  v139,  @"purchase response",  v132);
    v122 = (void *)objc_claimAutoreleasedReturnValue([v111 clusterMappings]);
    id v123 = [v122 count];

    if (v123)
    {
      v124 = (void *)objc_claimAutoreleasedReturnValue([v111 clusterMappings]);
      +[AppStoreUtility sendClusterMappings:](&OBJC_CLASS___AppStoreUtility, "sendClusterMappings:", v124);
    }
  }

  if (-[NSMutableArray count](v136, "count")) {
    +[BookAssetDaemonUtility sendBookDownloads:withReason:]( &OBJC_CLASS___BookAssetDaemonUtility,  "sendBookDownloads:withReason:",  v136,  @"purchase response");
  }
LABEL_189:
  id v125 = v9;

  return v125;
}

- (id)_addEntityForPurchase:(id)a3 managerIdentifier:(int64_t)a4 orderIdentifier:(double)a5
{
  id v8 = a3;
  id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v10 = -[NSNumber initWithLongLong:]( [NSNumber alloc],  "initWithLongLong:",  [v8 uniqueIdentifier]);
  -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v10, SSSQLEntityPropertyPersistentID);
  id v11 = -[NSNumber initWithLongLong:]( [NSNumber alloc],  "initWithLongLong:",  [v8 batchIdentifier]);

  -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v11, @"batch_id");
  uint64_t v12 = -[NSNumber initWithLongLong:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithLongLong:", a4);

  -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v12, @"client_id");
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 databaseEncoding]);

  if (v13) {
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v13, @"encoded_data");
  }
  id v14 = -[NSNumber initWithDouble:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithDouble:", a5);

  -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v14, @"order_id");
  double v15 = objc_alloc(&OBJC_CLASS___PurchaseEntity);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadsSession database](self, "database"));
  uint64_t v17 = -[PurchaseEntity initWithPropertyValues:inDatabase:](v15, "initWithPropertyValues:inDatabase:", v9, v16);

  return v17;
}

- (BOOL)_addPlaceholderDownloadForPurchase:(id)a3 clientIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 downloadProperties]);
  id v9 = +[DownloadEntity copyDatabaseDictionaryToSetClientDictionary:]( &OBJC_CLASS___DownloadEntity,  "copyDatabaseDictionaryToSetClientDictionary:",  v8);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
  [v9 setObject:v10 forKey:@"is_purchase"];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
  [v9 setObject:v11 forKey:@"is_from_store"];

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v6 uniqueIdentifier]));
  [v9 setObject:v12 forKey:@"purchase_id"];

  if (v7) {
    [v9 setObject:v7 forKey:@"client_id"];
  }
  uint64_t v13 = SSSQLEntityPropertyPersistentID;
  id v14 = (NSNumber *)objc_claimAutoreleasedReturnValue([v9 objectForKey:SSSQLEntityPropertyPersistentID]);
  id v15 = [v6 placeholderDownloadIdentifier];
  if (v15 && !v14)
  {
    id v14 = -[NSNumber initWithLongLong:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithLongLong:", v15);
    [v9 setObject:v14 forKey:v13];
  }

  id v16 = objc_alloc_init(&OBJC_CLASS___Download);
  if (v14) {
    id v17 = -[NSNumber longLongValue](v14, "longLongValue");
  }
  else {
    id v17 = 0LL;
  }
  -[Download setDatabaseID:](v16, "setDatabaseID:", v17);
  -[Download setValuesWithDictionary:](v16, "setValuesWithDictionary:", v9);
  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v16));
  unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadsTransaction addDownloads:](self, "addDownloads:", v18));

  LOBYTE(v18) = [v19 count] == (id)1;
  return (char)v18;
}

- (BOOL)_cancelDownloadForPurchaseIdentifier:(int64_t)a3
{
  uint64_t v13 = 0LL;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  char v16 = 1;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteComparisonPredicate predicateWithProperty:equalToLongLong:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToLongLong:",  @"is_purchase",  1LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteComparisonPredicate predicateWithProperty:equalToLongLong:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToLongLong:",  @"purchase_id",  a3));
  v17[0] = v5;
  v17[1] = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 2LL));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SSSQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v7));

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadsSession database](self, "database"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[DownloadEntity queryWithDatabase:predicate:]( &OBJC_CLASS___DownloadEntity,  "queryWithDatabase:predicate:",  v9,  v8));

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1001722F8;
  v12[3] = &unk_10034CD78;
  v12[4] = self;
  v12[5] = &v13;
  [v10 enumeratePersistentIDsUsingBlock:v12];
  LOBYTE(self) = *((_BYTE *)v14 + 24) != 0;

  _Block_object_dispose(&v13, 8);
  return (char)self;
}

- (void)_getInsertOrderID:(double *)a3 nextOrderID:(double *)a4 afterPurchaseID:(int64_t)a5
{
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadsSession database](self, "database"));
  uint64_t v21 = 0LL;
  id v22 = (double *)&v21;
  uint64_t v23 = 0x2020000000LL;
  uint64_t v24 = 0LL;
  if (a5)
  {
    id v9 = -[PurchaseEntity initWithPersistentID:inDatabase:]( objc_alloc(&OBJC_CLASS___PurchaseEntity),  "initWithPersistentID:inDatabase:",  a5,  v8);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseEntity valueForProperty:](v9, "valueForProperty:", @"order_id"));
    id v11 = v10;
    if (v10)
    {
      [v10 doubleValue];
      uint64_t v13 = v12;
      id v14 = objc_alloc_init(&OBJC_CLASS___SSSQLiteQueryDescriptor);
      [v14 setEntityClass:objc_opt_class(PurchaseEntity)];
      [v14 setLimitCount:1];
      uint64_t v26 = @"order_id";
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v26, 1LL));
      [v14 setOrderingProperties:v15];

      char v16 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteComparisonPredicate predicateWithProperty:value:comparisonType:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:value:comparisonType:",  @"order_id",  v11,  5LL));
      [v14 setPredicate:v16];

      id v17 = -[SSSQLiteQuery initWithDatabase:descriptor:]( objc_alloc(&OBJC_CLASS___SSSQLiteQuery),  "initWithDatabase:descriptor:",  v8,  v14);
      unsigned int v25 = @"order_id";
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      v20[2] = sub_100172608;
      v20[3] = &unk_10034AE48;
      v20[4] = &v21;
      -[SSSQLiteQuery enumeratePersistentIDsAndProperties:count:usingBlock:]( v17,  "enumeratePersistentIDsAndProperties:count:usingBlock:",  &v25,  1LL,  v20);
    }

    else
    {
      uint64_t v13 = 0LL;
    }
  }

  else
  {
    id v18 = (PurchaseEntity *)objc_claimAutoreleasedReturnValue( +[PurchaseEntity minValueForProperty:predicate:database:]( &OBJC_CLASS___PurchaseEntity,  "minValueForProperty:predicate:database:",  @"order_id",  0LL,  v8));
    id v9 = v18;
    uint64_t v13 = 0LL;
    uint64_t v19 = 0LL;
    if (v18) {
      -[PurchaseEntity doubleValue](v18, "doubleValue", 0.0);
    }
    *((void *)v22 + 3) = v19;
  }

  if (a3) {
    *(void *)a3 = v13;
  }
  if (a4) {
    *a4 = v22[3];
  }
  _Block_object_dispose(&v21, 8);
}

- (BOOL)_insertPurchases:(id)a3 forClient:(id)a4 orderIdentifier:(double)a5 orderSpacing:(double)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v24 = 0LL;
  unsigned int v25 = &v24;
  uint64_t v26 = 0x2020000000LL;
  char v27 = 1;
  int64_t v12 = -[PurchaseDownloadsTransaction _nextBatchIdentifier](self, "_nextBatchIdentifier");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 clientIdentifier]);
  v23[0] = 0LL;
  v23[1] = v23;
  v23[2] = 0x2020000000LL;
  *(double *)&v23[3] = a5 + a6;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1001727BC;
  v16[3] = &unk_100350500;
  int64_t v20 = v12;
  id v21 = [v11 uniqueIdentifier];
  v16[4] = self;
  id v18 = v23;
  uint64_t v19 = &v24;
  id v14 = v13;
  id v17 = v14;
  double v22 = a6;
  [v10 enumerateObjectsUsingBlock:v16];
  LOBYTE(v12) = *((_BYTE *)v25 + 24);

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(&v24, 8);

  return v12;
}

- (double)_maxOrderIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadsSession database](self, "database"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[PurchaseEntity maxValueForProperty:predicate:database:]( &OBJC_CLASS___PurchaseEntity,  "maxValueForProperty:predicate:database:",  @"order_id",  0LL,  v2));

  if (v3)
  {
    [v3 doubleValue];
    double v5 = v4;
  }

  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (int64_t)_nextBatchIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadsSession database](self, "database"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[PurchaseEntity maxValueForProperty:predicate:database:]( &OBJC_CLASS___PurchaseEntity,  "maxValueForProperty:predicate:database:",  @"batch_id",  0LL,  v2));

  if (v3) {
    double v4 = (char *)[v3 longLongValue] + 1;
  }
  else {
    double v4 = 0LL;
  }

  return (int64_t)v4;
}

@end