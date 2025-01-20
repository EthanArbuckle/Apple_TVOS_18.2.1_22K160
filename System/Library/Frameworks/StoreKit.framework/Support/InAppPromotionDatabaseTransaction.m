@interface InAppPromotionDatabaseTransaction
- (BOOL)removePromotionInfoForBundleID:(id)a3;
- (BOOL)setPromotionInfo:(id)a3 forBundleID:(id)a4 error:(id *)a5;
@end

@implementation InAppPromotionDatabaseTransaction

- (BOOL)setPromotionInfo:(id)a3 forBundleID:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v49 = a4;
  v46 = self;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[InAppPromotionDatabaseSession connection](self, "connection"));
  id v72 = 0LL;
  v48 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v8,  "prepareStatement:error:",  @"INSERT INTO promoted_iaps (bundle_id, product_id, promo_order, visibility) VALUES (?1, ?2, coalesce(?3, (SELECT promo_order FROM promoted_iaps WHERE bundle_id = ?1 AND product_id = ?2), -1), coalesce(?4, (SELECT visibility FROM promoted_iaps WHERE bundle_id = ?1 AND product_id = ?2), -1));",
                    &v72));
  id v9 = v72;

  v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"ord"]);
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSArray);
  v12 = &off_100279000;
  if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
  {
    if (qword_10032DC58 != -1) {
      dispatch_once(&qword_10032DC58, &stru_1002E6948);
    }
    v13 = (os_log_s *)qword_10032DC10;
    if (os_log_type_enabled((os_log_t)qword_10032DC10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v75 = v49;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Clearing previous StoreKit promotion order for %{public}@",  buf,  0xCu);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[InAppPromotionDatabaseSession connection](self, "connection"));
    id v71 = v9;
    v69[0] = _NSConcreteStackBlock;
    v69[1] = 3221225472LL;
    v69[2] = sub_100005AB0;
    v69[3] = &unk_1002E68B8;
    id v70 = v49;
    objc_msgSend( v14,  "executeStatement:error:bindings:",  @"UPDATE promoted_iaps SET promo_order = -1 WHERE bundle_id = ?;",
      &v71,
      v69);
    id v15 = v71;

    id v16 = v10;
    id v9 = v15;
    v12 = &off_100279000;
  }

  else
  {
    id v16 = 0LL;
  }

  id v17 = (id)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"vis"]);

  uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0) {
    id v47 = [v17 mutableCopy];
  }
  else {
    id v47 = 0LL;
  }
  v44 = v7;
  v45 = v16;
  if ([v16 count])
  {
    unint64_t v19 = 0LL;
    uint64_t v20 = *((void *)v12 + 13);
    do
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue([v16 objectAtIndexedSubscript:v19]);
      uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v21, v22) & 1) != 0)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue([v47 objectForKeyedSubscript:v21]);

        [v47 setObject:0 forKeyedSubscript:v21];
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[InAppPromotionDatabaseSession connection](v46, "connection"));
        id v68 = v9;
        v61[0] = _NSConcreteStackBlock;
        v61[1] = v20;
        v61[2] = sub_100005AC0;
        v61[3] = &unk_1002E68E0;
        id v62 = v49;
        id v25 = v21;
        id v63 = v25;
        id v64 = v16;
        int v67 = v19;
        id v17 = v23;
        id v65 = v17;
        id v66 = v47;
        unsigned __int8 v26 = [v24 executePreparedStatement:v48 error:&v68 bindings:v61];
        id v27 = v68;

        if ((v26 & 1) == 0)
        {
          if (qword_10032DC58 != -1) {
            dispatch_once(&qword_10032DC58, &stru_1002E6948);
          }
          v28 = (os_log_s *)qword_10032DC10;
          if (os_log_type_enabled((os_log_t)qword_10032DC10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543874;
            id v75 = v49;
            __int16 v76 = 2114;
            id v77 = v25;
            __int16 v78 = 2114;
            id v79 = v27;
            _os_log_error_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "Error setting StoreKit promotion info for %{public}@:%{public}@ - %{public}@",  buf,  0x20u);
          }
        }

        id v9 = v27;
        id v16 = v45;
      }

      else
      {
        id v27 = v9;
      }

      ++v19;
    }

    while ((unint64_t)[v16 count] > v19);
  }

  else
  {
    id v27 = v9;
  }

  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  v29 = (void *)objc_claimAutoreleasedReturnValue([v47 allKeys]);
  id v30 = [v29 countByEnumeratingWithState:&v57 objects:v73 count:16];
  if (v30)
  {
    id v31 = v30;
    uint64_t v32 = *(void *)v58;
    do
    {
      v33 = 0LL;
      v34 = v27;
      do
      {
        if (*(void *)v58 != v32) {
          objc_enumerationMutation(v29);
        }
        v35 = *(void **)(*((void *)&v57 + 1) + 8LL * (void)v33);
        uint64_t v36 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v35, v36) & 1) != 0)
        {
          uint64_t v37 = objc_claimAutoreleasedReturnValue([v47 objectForKeyedSubscript:v35]);

          v38 = (void *)objc_claimAutoreleasedReturnValue(-[InAppPromotionDatabaseSession connection](v46, "connection"));
          id v56 = v34;
          v51[0] = _NSConcreteStackBlock;
          v51[1] = 3221225472LL;
          v51[2] = sub_100005CB8;
          v51[3] = &unk_1002E6908;
          id v52 = v49;
          v53 = v35;
          id v17 = (id)v37;
          id v54 = v17;
          id v55 = v47;
          LOBYTE(v37) = [v38 executePreparedStatement:v48 error:&v56 bindings:v51];
          id v27 = v56;

          if ((v37 & 1) == 0)
          {
            if (qword_10032DC58 != -1) {
              dispatch_once(&qword_10032DC58, &stru_1002E6948);
            }
            v39 = (os_log_s *)qword_10032DC10;
            if (os_log_type_enabled((os_log_t)qword_10032DC10, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543874;
              id v75 = v49;
              __int16 v76 = 2114;
              id v77 = v35;
              __int16 v78 = 2114;
              id v79 = v27;
              _os_log_error_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_ERROR,  "Error setting StoreKit promotion info for %{public}@:%{public}@ - %{public}@",  buf,  0x20u);
            }
          }

          v34 = v27;
        }

        else
        {
          id v27 = v34;
        }

        v33 = (char *)v33 + 1;
      }

      while (v31 != v33);
      id v31 = [v29 countByEnumeratingWithState:&v57 objects:v73 count:16];
    }

    while (v31);
  }

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[InAppPromotionDatabaseSession connection](v46, "connection"));
  id v50 = v27;
  unsigned __int8 v41 = [v40 finalizePreparedStatement:v48 error:&v50];
  id v42 = v50;

  if ((v41 & 1) == 0)
  {
    if (qword_10032DC58 != -1) {
      dispatch_once(&qword_10032DC58, &stru_1002E6948);
    }
    if (os_log_type_enabled((os_log_t)qword_10032DC10, OS_LOG_TYPE_ERROR)) {
      sub_10025B044();
    }
  }

  return 1;
}

- (BOOL)removePromotionInfoForBundleID:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[InAppPromotionDatabaseSession connection](self, "connection"));
  id v11 = 0LL;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100005F14;
  v9[3] = &unk_1002E68B8;
  id v6 = v4;
  id v10 = v6;
  objc_msgSend( v5,  "executeStatement:error:bindings:",  @"DELETE FROM promoted_iaps WHERE bundle_id = ?;",
    &v11,
    v9);
  id v7 = v11;

  if (v7)
  {
    if (qword_10032DC58 != -1) {
      dispatch_once(&qword_10032DC58, &stru_1002E6948);
    }
    if (os_log_type_enabled((os_log_t)qword_10032DC10, OS_LOG_TYPE_ERROR)) {
      sub_10025B0A8();
    }
  }

  return v7 == 0LL;
}

@end