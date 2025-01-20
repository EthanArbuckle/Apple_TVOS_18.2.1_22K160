@interface CacheDeleteManagedAssets
+ (CacheDeleteManagedAssets)cacheDeleteManagedAssetsWithInfo:(id)a3 atUrgency:(int)a4;
- (BOOL)cancel;
- (BOOL)dateHasExpired:(id)a3 interval:(double)a4;
- (BOOL)periodicShouldRemoveAsset:(id)a3;
- (CacheDeleteManagedAssets)initWithInfo:(id)a3 atUrgency:(int)a4;
- (NSDictionary)info;
- (NSString)volume;
- (id)analytics;
- (id)assetsFromArray:(id)a3 forAmount:(unint64_t)a4;
- (id)sizeEligibleAsset:(int64_t *)a3;
- (id)sortAssets:(id)a3;
- (int)urgency;
- (unint64_t)purgeAssets:(unint64_t)a3 testObject:(id)a4;
- (void)cancelPurge;
- (void)periodic:(id)a3;
- (void)setCancel:(BOOL)a3;
@end

@implementation CacheDeleteManagedAssets

- (CacheDeleteManagedAssets)initWithInfo:(id)a3 atUrgency:(int)a4
{
  id v7 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___CacheDeleteManagedAssets;
  v8 = -[CacheDeleteManagedAssets init](&v19, "init");
  v9 = v8;
  if (!v8) {
    goto LABEL_4;
  }
  objc_storeStrong((id *)&v8->_info, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"]);
  uint64_t v11 = evaluateStringProperty();
  uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
  volume = v9->_volume;
  v9->_volume = (NSString *)v12;

  if (!v9->_volume)
  {
    uint64_t v15 = CDGetLogHandle("client");
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v18[0] = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "Missing volume parameter",  (uint8_t *)v18,  2u);
    }

    goto LABEL_8;
  }

  v9->_urgency = a4;
  if ((a4 - 5) < 0xFFFFFFFC)
  {
LABEL_8:
    v14 = 0LL;
    goto LABEL_9;
  }

+ (CacheDeleteManagedAssets)cacheDeleteManagedAssetsWithInfo:(id)a3 atUrgency:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  v6 = -[CacheDeleteManagedAssets initWithInfo:atUrgency:]( objc_alloc(&OBJC_CLASS___CacheDeleteManagedAssets),  "initWithInfo:atUrgency:",  v5,  v4);

  return v6;
}

- (BOOL)dateHasExpired:(id)a3 interval:(double)a4
{
  if (!a3) {
    return 0;
  }
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v6 timeIntervalSinceReferenceDate];
  double v8 = v7;

  [v5 timeIntervalSinceReferenceDate];
  double v10 = v9;

  return v8 - v10 > a4 && v8 >= v10;
}

- (BOOL)periodicShouldRemoveAsset:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 expirationDate]);
  unsigned __int8 v6 = -[CacheDeleteManagedAssets dateHasExpired:interval:](self, "dateHasExpired:interval:", v5, 0.0);

  if ((v6 & 1) != 0)
  {
    BOOL v7 = 1;
  }

  else
  {
    double v8 = (void *)objc_claimAutoreleasedReturnValue([v4 downloadCompletionDate]);

    if (v8)
    {
      BOOL v7 = 0;
    }

    else
    {
      double v9 = (void *)objc_claimAutoreleasedReturnValue([v4 downloadStartDate]);
      BOOL v7 = -[CacheDeleteManagedAssets dateHasExpired:interval:](self, "dateHasExpired:interval:", v9, 2592000.0);
    }
  }

  return v7;
}

- (id)sortAssets:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = __39__CacheDeleteManagedAssets_sortAssets___block_invoke;
  v4[3] = &unk_10000C5F0;
  v4[4] = self;
  return (id)objc_claimAutoreleasedReturnValue([a3 sortedArrayUsingComparator:v4]);
}

uint64_t __39__CacheDeleteManagedAssets_sortAssets___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  id v8 = v6;
  LODWORD(v6) = objc_msgSend(v7, "purgeabilityScoreAtUrgency:", objc_msgSend(*(id *)(a1 + 32), "urgency"));
  if (v6 < objc_msgSend( v8,  "purgeabilityScoreAtUrgency:",  objc_msgSend(*(id *)(a1 + 32), "urgency")))
  {
    uint64_t v9 = CDGetLogHandle("client");
    double v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
LABEL_3:
      uint64_t v11 = -1LL;
      goto LABEL_7;
    }

    int v48 = 67109634;
    int v49 = 120;
    __int16 v50 = 2112;
    id v51 = v7;
    __int16 v52 = 2112;
    id v53 = v8;
LABEL_26:
    _os_log_debug_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "SORT %d\nassetOne: %@\nassetTwo: %@",  (uint8_t *)&v48,  0x1Cu);
    goto LABEL_3;
  }

  unsigned int v12 = objc_msgSend(v7, "purgeabilityScoreAtUrgency:", objc_msgSend(*(id *)(a1 + 32), "urgency"));
  if (v12 > objc_msgSend(v8, "purgeabilityScoreAtUrgency:", objc_msgSend(*(id *)(a1 + 32), "urgency")))
  {
    uint64_t v13 = CDGetLogHandle("client");
    double v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
LABEL_6:
      uint64_t v11 = 1LL;
      goto LABEL_7;
    }

    int v48 = 67109634;
    int v49 = 123;
    __int16 v50 = 2112;
    id v51 = v7;
    __int16 v52 = 2112;
    id v53 = v8;
LABEL_33:
    _os_log_debug_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "SORT %d\nassetOne: %@\nassetTwo: %@",  (uint8_t *)&v48,  0x1Cu);
    goto LABEL_6;
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v7 expirationDate]);

  v16 = (void *)objc_claimAutoreleasedReturnValue([v8 expirationDate]);
  if (v15)
  {
    if (!v16)
    {
      uint64_t v23 = CDGetLogHandle("client");
      double v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_3;
      }
      int v48 = 67109634;
      int v49 = 137;
      __int16 v50 = 2112;
      id v51 = v7;
      __int16 v52 = 2112;
      id v53 = v8;
      goto LABEL_26;
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue([v7 expirationDate]);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v8 expirationDate]);
    uint64_t v11 = (uint64_t)[v17 compare:v18];

    if (v11)
    {
      uint64_t v19 = CDGetLogHandle("client");
      double v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_7;
      }
      int v48 = 67109634;
      int v49 = 133;
      __int16 v50 = 2112;
      id v51 = v7;
      __int16 v52 = 2112;
      id v53 = v8;
LABEL_13:
      _os_log_debug_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "SORT %d\nassetOne: %@\nassetTwo: %@",  (uint8_t *)&v48,  0x1Cu);
      goto LABEL_7;
    }
  }

  else if (v16)
  {
    uint64_t v20 = CDGetLogHandle("client");
    double v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_6;
    }
    int v48 = 67109634;
    int v49 = 141;
    __int16 v50 = 2112;
    id v51 = v7;
    __int16 v52 = 2112;
    id v53 = v8;
    goto LABEL_33;
  }

  int v21 = [v7 priority];
  if (v21 < (int)[v8 priority])
  {
    uint64_t v22 = CDGetLogHandle("client");
    double v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_3;
    }
    int v48 = 67109634;
    int v49 = 147;
    __int16 v50 = 2112;
    id v51 = v7;
    __int16 v52 = 2112;
    id v53 = v8;
    goto LABEL_26;
  }

  int v24 = [v7 priority];
  if (v24 > (int)[v8 priority])
  {
    uint64_t v25 = CDGetLogHandle("client");
    double v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_6;
    }
    int v48 = 67109634;
    int v49 = 150;
    __int16 v50 = 2112;
    id v51 = v7;
    __int16 v52 = 2112;
    id v53 = v8;
    goto LABEL_33;
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue([v7 consumedDate]);

  v27 = (void *)objc_claimAutoreleasedReturnValue([v8 consumedDate]);
  if (v26)
  {
    if (!v27)
    {
      uint64_t v37 = CDGetLogHandle("client");
      double v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_3;
      }
      int v48 = 67109634;
      int v49 = 164;
      __int16 v50 = 2112;
      id v51 = v7;
      __int16 v52 = 2112;
      id v53 = v8;
      goto LABEL_26;
    }

    v28 = (void *)objc_claimAutoreleasedReturnValue([v7 consumedDate]);
    v29 = (void *)objc_claimAutoreleasedReturnValue([v8 consumedDate]);
    uint64_t v11 = (uint64_t)[v28 compare:v29];

    if (v11)
    {
      uint64_t v30 = CDGetLogHandle("client");
      double v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_7;
      }
      int v48 = 67109634;
      int v49 = 160;
      __int16 v50 = 2112;
      id v51 = v7;
      __int16 v52 = 2112;
      id v53 = v8;
      goto LABEL_13;
    }
  }

  else if (v27)
  {
    uint64_t v31 = CDGetLogHandle("client");
    double v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_6;
    }
    int v48 = 67109634;
    int v49 = 168;
    __int16 v50 = 2112;
    id v51 = v7;
    __int16 v52 = 2112;
    id v53 = v8;
    goto LABEL_33;
  }

  v32 = (void *)objc_claimAutoreleasedReturnValue([v7 downloadCompletionDate]);

  v33 = (void *)objc_claimAutoreleasedReturnValue([v8 downloadCompletionDate]);
  if (v32)
  {
    if (!v33)
    {
      uint64_t v44 = CDGetLogHandle("client");
      double v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_3;
      }
      int v48 = 67109634;
      int v49 = 182;
      __int16 v50 = 2112;
      id v51 = v7;
      __int16 v52 = 2112;
      id v53 = v8;
      goto LABEL_26;
    }

    v34 = (void *)objc_claimAutoreleasedReturnValue([v7 downloadCompletionDate]);
    v35 = (void *)objc_claimAutoreleasedReturnValue([v8 downloadCompletionDate]);
    uint64_t v11 = (uint64_t)[v34 compare:v35];

    if (v11)
    {
      uint64_t v36 = CDGetLogHandle("client");
      double v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_7;
      }
      int v48 = 67109634;
      int v49 = 178;
      __int16 v50 = 2112;
      id v51 = v7;
      __int16 v52 = 2112;
      id v53 = v8;
      goto LABEL_13;
    }
  }

  else if (v33)
  {
    uint64_t v38 = CDGetLogHandle("client");
    double v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_6;
    }
    int v48 = 67109634;
    int v49 = 186;
    __int16 v50 = 2112;
    id v51 = v7;
    __int16 v52 = 2112;
    id v53 = v8;
    goto LABEL_33;
  }

  v39 = (void *)objc_claimAutoreleasedReturnValue([v7 downloadStartDate]);

  v40 = (void *)objc_claimAutoreleasedReturnValue([v8 downloadStartDate]);
  if (v39)
  {
    if (!v40)
    {
      uint64_t v47 = CDGetLogHandle("client");
      double v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_3;
      }
      int v48 = 67109634;
      int v49 = 200;
      __int16 v50 = 2112;
      id v51 = v7;
      __int16 v52 = 2112;
      id v53 = v8;
      goto LABEL_26;
    }

    v41 = (void *)objc_claimAutoreleasedReturnValue([v7 downloadStartDate]);
    v42 = (void *)objc_claimAutoreleasedReturnValue([v8 downloadStartDate]);
    uint64_t v11 = (uint64_t)[v41 compare:v42];

    if (v11)
    {
      uint64_t v43 = CDGetLogHandle("client");
      double v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_7;
      }
      int v48 = 67109634;
      int v49 = 196;
      __int16 v50 = 2112;
      id v51 = v7;
      __int16 v52 = 2112;
      id v53 = v8;
      goto LABEL_13;
    }
  }

  else if (v40)
  {
    uint64_t v45 = CDGetLogHandle("client");
    double v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_6;
    }
    int v48 = 67109634;
    int v49 = 204;
    __int16 v50 = 2112;
    id v51 = v7;
    __int16 v52 = 2112;
    id v53 = v8;
    goto LABEL_33;
  }

  uint64_t v46 = CDGetLogHandle("client");
  double v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v48 = 67109634;
    int v49 = 209;
    __int16 v50 = 2112;
    id v51 = v7;
    __int16 v52 = 2112;
    id v53 = v8;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "SORT %d\nassetOne: %@\nassetTwo: %@",  (uint8_t *)&v48,  0x1Cu);
  }

  uint64_t v11 = 0LL;
LABEL_7:

  return v11;
}

- (id)sizeEligibleAsset:(int64_t *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteManagedAssets info](self, "info"));
  id v7 = (const __CFBoolean *)CacheDeleteUserManagedAssetsPurgeable();

  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  uint64_t v15 = 0LL;
  if (kCFBooleanTrue == v7)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = __46__CacheDeleteManagedAssets_sizeEligibleAsset___block_invoke;
    v9[3] = &unk_10000C618;
    v9[4] = self;
    id v10 = v5;
    uint64_t v11 = &v12;
    CacheManagementEnumerateAssets(0LL, 0LL, v9);
  }

  if (a3) {
    *a3 = v13[3];
  }
  _Block_object_dispose(&v12, 8);
  return v5;
}

uint64_t __46__CacheDeleteManagedAssets_sizeEligibleAsset___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned int v4 = objc_msgSend(v3, "purgeabilityScoreAtUrgency:", objc_msgSend(*(id *)(a1 + 32), "urgency"));
  if (v4 && v4 <= [*(id *)(a1 + 32) urgency])
  {
    uint64_t v5 = CDGetLogHandle("client");
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "purgeable: %@", (uint8_t *)&v8, 0xCu);
    }

    [*(id *)(a1 + 40) addObject:v3];
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += [v3 size];
  }

  return 1LL;
}

- (id)assetsFromArray:(id)a3 forAmount:(unint64_t)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    id v9 = v8;
    unint64_t v10 = 0LL;
    uint64_t v11 = *(void *)v20;
LABEL_3:
    uint64_t v12 = 0LL;
    while (1)
    {
      if (*(void *)v20 != v11) {
        objc_enumerationMutation(v7);
      }
      uint64_t v13 = *(void **)(*((void *)&v19 + 1) + 8 * v12);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier", (void)v19));
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v14]);

      if (!v15)
      {
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
        v16 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
        [v6 setObject:v15 forKeyedSubscript:v16];
      }

      [v15 addObject:v13];
      v10 += (unint64_t)[v13 sizeCached:1];

      if (v10 >= a4) {
        break;
      }
      if (v9 == (id)++v12)
      {
        id v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  id v17 = [v6 copy];
  return v17;
}

- (unint64_t)purgeAssets:(unint64_t)a3 testObject:(id)a4
{
  id v6 = a4;
  uint64_t v25 = 0LL;
  v26 = &v25;
  uint64_t v27 = 0x2020000000LL;
  uint64_t v28 = 0LL;
  unint64_t v24 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteManagedAssets sizeEligibleAsset:](self, "sizeEligibleAsset:", &v24));
  dispatch_group_t v8 = dispatch_group_create();
  id v9 = dispatch_queue_create("com.apple.mobile.cache_delete_managed_assets.CacheManagementAsset.Purge", 0LL);
  if (v24 <= a3)
  {
    id v11 = [v7 mutableCopy];
  }

  else
  {
    unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteManagedAssets sortAssets:](self, "sortAssets:", v7));
    id v11 = [v10 mutableCopy];
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __51__CacheDeleteManagedAssets_purgeAssets_testObject___block_invoke;
  block[3] = &unk_10000C6B0;
  __int128 v22 = &v25;
  unint64_t v23 = a3;
  id v18 = v11;
  __int128 v19 = self;
  id v20 = v6;
  dispatch_group_t v21 = v8;
  uint64_t v12 = v8;
  id v13 = v6;
  id v14 = v11;
  dispatch_group_async(v12, v9, block);
  dispatch_group_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  unint64_t v15 = v26[3];

  _Block_object_dispose(&v25, 8);
  return v15;
}

void __51__CacheDeleteManagedAssets_purgeAssets_testObject___block_invoke(uint64_t a1)
{
  while (*(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) < *(void *)(a1 + 72))
  {
    if (!objc_msgSend(*(id *)(a1 + 32), "count", v18)) {
      break;
    }
    v2 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 40) assetsFromArray:*(void *)(a1 + 32) forAmount:*(void *)(a1 + 72) - *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)]);
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id v3 = v2;
    id v4 = [v3 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v25;
LABEL_5:
      uint64_t v7 = 0LL;
      while (1)
      {
        if (*(void *)v25 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v24 + 1) + 8 * v7);
        id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v8, v18));
        uint64_t v10 = *(void *)(a1 + 48);
        uint64_t v28 = v8;
        id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v28, 1LL));
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472LL;
        v19[2] = __51__CacheDeleteManagedAssets_purgeAssets_testObject___block_invoke_2;
        v19[3] = &unk_10000C668;
        uint64_t v12 = *(void *)(a1 + 40);
        id v20 = v9;
        uint64_t v21 = v12;
        uint64_t v23 = *(void *)(a1 + 72);
        __int128 v18 = *(_OWORD *)(a1 + 56);
        id v13 = (id)v18;
        __int128 v22 = v18;
        id v14 = v9;
        id v15 = (id)assert_group_cache_deletion( v10,  v11,  v19,  &__block_literal_global_1);

        [*(id *)(a1 + 32) removeObjectsInArray:v14];
        unint64_t v16 = *(void *)(a1 + 72);
        unint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL);

        if (v17 >= v16) {
          break;
        }
        if (v5 == (id)++v7)
        {
          id v5 = [v3 countByEnumeratingWithState:&v24 objects:v29 count:16];
          if (v5) {
            goto LABEL_5;
          }
          break;
        }
      }
    }
  }

void __51__CacheDeleteManagedAssets_purgeAssets_testObject___block_invoke_2(uint64_t a1)
{
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = *(void *)v22;
    *(void *)&__int128 v4 = 136315394LL;
    __int128 v16 = v4;
LABEL_3:
    uint64_t v7 = 0LL;
    while (1)
    {
      if (*(void *)v22 != v6) {
        objc_enumerationMutation(v2);
      }
      uint64_t v8 = *(void **)(*((void *)&v21 + 1) + 8 * v7);
      unsigned __int8 v9 = objc_msgSend(*(id *)(a1 + 40), "cancel", v16);
      uint64_t v10 = *(void *)(a1 + 56);
      unint64_t v11 = *(void *)(a1 + 64);
      if ((v9 & 1) == 0 && *(void *)(*(void *)(v10 + 8) + 24LL) < v11)
      {
        id v12 = [v8 sizeCached:1];
        uint64_t v13 = CDGetLogHandle("client");
        id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v16;
          __int128 v26 = "com.apple.mobile.cache_delete_managed_assets";
          __int16 v27 = 2112;
          uint64_t v28 = v8;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s purging %@", buf, 0x16u);
        }

        dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472LL;
        v18[2] = __51__CacheDeleteManagedAssets_purgeAssets_testObject___block_invoke_10;
        v18[3] = &unk_10000C640;
        v18[4] = v8;
        id v20 = v12;
        __int128 v17 = *(_OWORD *)(a1 + 48);
        id v15 = (id)v17;
        __int128 v19 = v17;
        CacheManagementRemove(v8, v18);

        uint64_t v10 = *(void *)(a1 + 56);
        unint64_t v11 = *(void *)(a1 + 64);
      }

      if (*(void *)(*(void *)(v10 + 8) + 24LL) >= v11) {
        break;
      }
      if (v5 == (id)++v7)
      {
        id v5 = [v2 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v5) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

void __51__CacheDeleteManagedAssets_purgeAssets_testObject___block_invoke_10(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = CDGetLogHandle("client");
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412546;
      id v8 = v3;
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "purge CacheManagementRemove ERROR: %@, for asset: %@",  (uint8_t *)&v7,  0x16u);
    }
  }

  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) += *(void *)(a1 + 56);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __51__CacheDeleteManagedAssets_purgeAssets_testObject___block_invoke_13(id a1, NSError *a2, NSString *a3)
{
  uint64_t v4 = a2;
  id v5 = a3;
  uint64_t v6 = CDGetLogHandle("client");
  int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138412546;
    __int16 v9 = v5;
    __int16 v10 = 2112;
    unint64_t v11 = v4;
    _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Failed to acquire termination assertion for '%@': %@",  (uint8_t *)&v8,  0x16u);
  }
}

- (void)cancelPurge
{
}

- (void)periodic:(id)a3
{
  id v4 = a3;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = __37__CacheDeleteManagedAssets_periodic___block_invoke;
  v22[3] = &unk_10000C6D8;
  v22[4] = self;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v23 = v5;
  CacheManagementEnumerateAssets(0LL, 0LL, v22);
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v25 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      __int16 v10 = 0LL;
      do
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v24 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)v10);
        uint64_t v11 = v24;
        id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v24, 1LL));
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472LL;
        v15[2] = __37__CacheDeleteManagedAssets_periodic___block_invoke_2;
        v15[3] = &unk_10000C728;
        id v13 = v6;
        id v16 = v13;
        uint64_t v17 = v11;
        id v14 = (id)assert_group_cache_deletion( v4,  v12,  v15,  &__block_literal_global_17);

        __int16 v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v13 countByEnumeratingWithState:&v18 objects:v25 count:16];
    }

    while (v8);
  }
}

uint64_t __37__CacheDeleteManagedAssets_periodic___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) periodicShouldRemoveAsset:v3])
  {
    id v4 = *(void **)(a1 + 40);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v5]);

    if (!v6)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
      id v7 = *(void **)(a1 + 40);
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
      [v7 setObject:v6 forKeyedSubscript:v8];
    }

    [v6 addObject:v3];
  }

  return 1LL;
}

void __37__CacheDeleteManagedAssets_periodic___block_invoke_2(uint64_t a1)
{
  v1 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)]);
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v9;
    do
    {
      id v5 = 0LL;
      do
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void *)(*((void *)&v8 + 1) + 8LL * (void)v5);
        v7[0] = _NSConcreteStackBlock;
        v7[1] = 3221225472LL;
        v7[2] = __37__CacheDeleteManagedAssets_periodic___block_invoke_3;
        v7[3] = &unk_10000C700;
        v7[4] = v6;
        CacheManagementRemove(v6, v7);
        id v5 = (char *)v5 + 1;
      }

      while (v3 != v5);
      id v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v3);
  }
}

void __37__CacheDeleteManagedAssets_periodic___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = CDGetLogHandle("client");
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v9 = 138412546;
      id v10 = v3;
      __int16 v11 = 2112;
      uint64_t v12 = v7;
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "periodic CacheManagementRemove error: %@, %@",  (uint8_t *)&v9,  0x16u);
    }
  }

  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v8 = *(void **)(a1 + 32);
    int v9 = 138412290;
    id v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "periodic removed: %@", (uint8_t *)&v9, 0xCu);
  }
}

void __37__CacheDeleteManagedAssets_periodic___block_invoke_16(id a1, NSError *a2, NSString *a3)
{
  uint64_t v4 = a2;
  id v5 = a3;
  uint64_t v6 = CDGetLogHandle("client");
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138412546;
    int v9 = v5;
    __int16 v10 = 2112;
    __int16 v11 = v4;
    _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Failed to acquire termination assertion for '%@': %@",  (uint8_t *)&v8,  0x16u);
  }
}

- (id)analytics
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteManagedAssets info](self, "info"));
  __int128 v25 = (void *)CacheDeleteUserManagedAssetsPurgeable();

  uint64_t v55 = 0LL;
  v56 = &v55;
  uint64_t v57 = 0x2020000000LL;
  uint64_t v58 = 0LL;
  uint64_t v51 = 0LL;
  __int16 v52 = &v51;
  uint64_t v53 = 0x2020000000LL;
  uint64_t v54 = 0LL;
  uint64_t v47 = 0LL;
  int v48 = &v47;
  uint64_t v49 = 0x2020000000LL;
  uint64_t v50 = 0LL;
  uint64_t v43 = 0LL;
  uint64_t v44 = &v43;
  uint64_t v45 = 0x2020000000LL;
  uint64_t v46 = 0LL;
  uint64_t v39 = 0LL;
  v40 = &v39;
  uint64_t v41 = 0x2020000000LL;
  uint64_t v42 = 0LL;
  uint64_t v35 = 0LL;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x2020000000LL;
  uint64_t v38 = 0LL;
  uint64_t v31 = 0LL;
  v32 = &v31;
  uint64_t v33 = 0x2020000000LL;
  uint64_t v34 = 0LL;
  uint64_t v27 = 0LL;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2020000000LL;
  uint64_t v30 = 0LL;
  unsigned int v4 = -[CacheDeleteManagedAssets urgency](self, "urgency") - 1;
  if (v4 >= 4) {
    id v5 = @"???";
  }
  else {
    id v5 = *(&off_10000C840 + (int)v4);
  }
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ManagedAssets_%@",  v5));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = __37__CacheDeleteManagedAssets_analytics__block_invoke;
  v26[3] = &unk_10000C770;
  v26[4] = self;
  v26[5] = &v51;
  v26[6] = &v55;
  v26[7] = &v43;
  v26[8] = &v47;
  v26[9] = &v35;
  v26[10] = &v39;
  v26[11] = &v27;
  v26[12] = &v31;
  CacheManagementEnumerateAssets(0LL, 0LL, v26);
  v59[0] = @"ManagedAssets_autoPurgeEnabled";
  v60[0] = v25;
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingString:@"_size"]);
  v59[1] = v24;
  id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", v56[3]));
  v60[1] = v23;
  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingString:@"_count"]);
  v59[2] = v22;
  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", v52[3]));
  v60[2] = v21;
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingString:@"_eligibleSize"]);
  v59[3] = v20;
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", v48[3]));
  v60[3] = v19;
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingString:@"_eligibleCount"]);
  v59[4] = v18;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", v44[3]));
  v60[4] = v7;
  int v8 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingString:@"_watchedSize"]);
  v59[5] = v8;
  int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", v40[3]));
  v60[5] = v9;
  __int16 v10 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingString:@"_watchedCount"]);
  v59[6] = v10;
  __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", v36[3]));
  v60[6] = v11;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingString:@"_downloadingSize"]);
  v59[7] = v12;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", v32[3]));
  v60[7] = v13;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingString:@"_downloadingCount"]);
  v59[8] = v14;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", v28[3]));
  v60[8] = v15;
  id v17 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v60,  v59,  9LL));

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v55, 8);

  return v17;
}

uint64_t __37__CacheDeleteManagedAssets_analytics__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += [v3 size];
  unsigned int v4 = objc_msgSend(v3, "purgeabilityScoreAtUrgency:", objc_msgSend(*(id *)(a1 + 32), "urgency"));
  if (v4 && v4 <= [*(id *)(a1 + 32) urgency])
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) += [v3 size];
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 consumedDate]);

  if (v5)
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL);
    *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) += [v3 size];
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 downloadCompletionDate]);

  if (!v6)
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 24LL);
    *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) += [v3 size];
  }

  return 1LL;
}

- (NSString)volume
{
  return self->_volume;
}

- (int)urgency
{
  return self->_urgency;
}

- (NSDictionary)info
{
  return self->_info;
}

- (BOOL)cancel
{
  return self->_cancel;
}

- (void)setCancel:(BOOL)a3
{
  self->_cancel = a3;
}

- (void).cxx_destruct
{
}

@end