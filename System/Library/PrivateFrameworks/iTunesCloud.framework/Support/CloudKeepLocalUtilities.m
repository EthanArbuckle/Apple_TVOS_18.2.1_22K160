@interface CloudKeepLocalUtilities
+ (void)downPinCollectionsForClasses:(id)a3 configuration:(id)a4;
+ (void)rePinCollectionsForClasses:(id)a3 configuration:(id)a4;
@end

@implementation CloudKeepLocalUtilities

+ (void)downPinCollectionsForClasses:(id)a3 configuration:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = os_log_create("com.apple.amp.itunescloudd", "Downloads");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v68 = v5;
    __int16 v69 = 2114;
    id v70 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "DownPinning collection classes %{public}@ and configuration %{public}@",  buf,  0x16u);
  }

  v36 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 userIdentity]);
  v39 = (void *)objc_claimAutoreleasedReturnValue( +[ML3MusicLibrary musicLibraryForUserAccount:]( &OBJC_CLASS___ML3MusicLibrary,  "musicLibraryForUserAccount:",  v8));

  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  id obj = v5;
  id v40 = [obj countByEnumeratingWithState:&v59 objects:v66 count:16];
  if (v40)
  {
    uint64_t v38 = *(void *)v60;
    uint64_t v44 = ML3EntityPropertyKeepLocal;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v60 != v38) {
          objc_enumerationMutation(obj);
        }
        uint64_t v42 = v10;
        v11 = *(void **)(*((void *)&v59 + 1) + 8 * v10);
        v12 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue( +[ML3ComparisonPredicate predicateWithProperty:value:comparison:]( &OBJC_CLASS___ML3ComparisonPredicate,  "predicateWithProperty:value:comparison:",  v44,  &off_1001B3BB0,  3LL));
        v14 = (void *)objc_claimAutoreleasedReturnValue([v11 queryWithLibrary:v39 predicate:v13]);

        uint64_t v65 = v44;
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v65, 1LL));
        v55[0] = _NSConcreteStackBlock;
        v55[1] = 3221225472LL;
        v55[2] = sub_10004A0D0;
        v55[3] = &unk_1001A2EA0;
        v58 = v11;
        id v16 = v39;
        id v56 = v16;
        id v17 = v12;
        id v57 = v17;
        v41 = v14;
        [v14 enumeratePersistentIDsAndProperties:v15 usingBlock:v55];

        __int128 v53 = 0u;
        __int128 v54 = 0u;
        __int128 v51 = 0u;
        __int128 v52 = 0u;
        id v43 = v17;
        id v18 = [v43 countByEnumeratingWithState:&v51 objects:v64 count:16];
        if (v18)
        {
          id v19 = v18;
          uint64_t v20 = *(void *)v52;
          do
          {
            for (i = 0LL; i != v19; i = (char *)i + 1)
            {
              if (*(void *)v52 != v20) {
                objc_enumerationMutation(v43);
              }
              v22 = *(void **)(*((void *)&v51 + 1) + 8LL * (void)i);
              v23 = os_log_create("com.apple.amp.itunescloudd", "Downloads");
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                id v68 = v22;
                _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "DownPinning %{public}@", buf, 0xCu);
              }

              v25 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v24);
              id v27 = objc_msgSend((id)objc_opt_class(v22, v26), "trackForeignPersistentID");
              v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
              v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v22 persistentID]));
              v30 = (void *)objc_claimAutoreleasedReturnValue( +[ML3ComparisonPredicate predicateWithProperty:value:comparison:]( &OBJC_CLASS___ML3ComparisonPredicate,  "predicateWithProperty:value:comparison:",  v28,  v29,  1LL));
              v31 = (void *)objc_claimAutoreleasedReturnValue( +[ML3Track queryWithLibrary:predicate:]( &OBJC_CLASS___ML3Track,  "queryWithLibrary:predicate:",  v16,  v30));

              uint64_t v63 = v44;
              v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v63,  1LL));
              v49[0] = _NSConcreteStackBlock;
              v49[1] = 3221225472LL;
              v49[2] = sub_10004A118;
              v49[3] = &unk_1001A6EC8;
              id v33 = v25;
              id v50 = v33;
              [v31 enumeratePersistentIDsAndProperties:v32 usingBlock:v49];

              v45[0] = _NSConcreteStackBlock;
              v45[1] = 3221225472LL;
              v45[2] = sub_10004A18C;
              v45[3] = &unk_1001A69E0;
              id v46 = v33;
              id v34 = v16;
              id v47 = v34;
              v48 = v22;
              id v35 = v33;
              [v34 performDatabaseTransactionWithBlock:v45];
            }

            id v19 = [v43 countByEnumeratingWithState:&v51 objects:v64 count:16];
          }

          while (v19);
        }

        uint64_t v10 = v42 + 1;
      }

      while ((id)(v42 + 1) != v40);
      id v40 = [obj countByEnumeratingWithState:&v59 objects:v66 count:16];
    }

    while (v40);
  }
}

+ (void)rePinCollectionsForClasses:(id)a3 configuration:(id)a4
{
  id v5 = a3;
  id v31 = a4;
  id v6 = os_log_create("com.apple.amp.itunescloudd", "Downloads");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v5;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v31;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "RePinning collection classes %{public}@ and configuration %{public}@",  buf,  0x16u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue([v31 userIdentity]);
  v36 = (void *)objc_claimAutoreleasedReturnValue( +[ML3MusicLibrary musicLibraryForUserAccount:]( &OBJC_CLASS___ML3MusicLibrary,  "musicLibraryForUserAccount:",  v7));

  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  id obj = v5;
  id v34 = [obj countByEnumeratingWithState:&v51 objects:v63 count:16];
  if (v34)
  {
    uint64_t v33 = *(void *)v52;
    uint64_t v40 = ML3EntityPropertyKeepLocalStatus;
    uint64_t v41 = ML3EntityPropertyKeepLocal;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v52 != v33)
        {
          uint64_t v10 = v9;
          objc_enumerationMutation(obj);
          uint64_t v9 = v10;
        }

        uint64_t v35 = v9;
        v11 = *(void **)(*((void *)&v51 + 1) + 8 * v9);
        v12 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue( +[ML3ComparisonPredicate predicateWithProperty:equalToInteger:]( &OBJC_CLASS___ML3ComparisonPredicate,  "predicateWithProperty:equalToInteger:",  v40,  3LL));
        v37 = (void *)objc_claimAutoreleasedReturnValue([v11 queryWithLibrary:v36 predicate:v13]);

        v47[0] = _NSConcreteStackBlock;
        v47[1] = 3221225472LL;
        v47[2] = sub_10004A070;
        v47[3] = &unk_1001A2EC8;
        id v50 = v11;
        id v39 = v36;
        id v48 = v39;
        id v14 = v12;
        id v49 = v14;
        [v37 enumeratePersistentIDsUsingBlock:v47];
        __int128 v45 = 0u;
        __int128 v46 = 0u;
        __int128 v43 = 0u;
        __int128 v44 = 0u;
        id v38 = v14;
        id v16 = [v38 countByEnumeratingWithState:&v43 objects:v62 count:16];
        if (v16)
        {
          uint64_t v17 = *(void *)v44;
          do
          {
            for (i = 0LL; i != v16; i = (char *)i + 1)
            {
              if (*(void *)v44 != v17) {
                objc_enumerationMutation(v38);
              }
              id v19 = *(void **)(*((void *)&v43 + 1) + 8LL * (void)i);
              id v20 = objc_msgSend((id)objc_opt_class(v19, v15), "trackForeignPersistentID");
              v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
              v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v19 persistentID]));
              v23 = (void *)objc_claimAutoreleasedReturnValue( +[ML3ComparisonPredicate predicateWithProperty:value:comparison:]( &OBJC_CLASS___ML3ComparisonPredicate,  "predicateWithProperty:value:comparison:",  v21,  v22,  1LL));
              v61[0] = v23;
              uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:]( &OBJC_CLASS___ML3ComparisonPredicate,  "predicateWithProperty:equalToInt64:",  v41,  0LL));
              v61[1] = v24;
              v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v61,  2LL));
              uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[ML3AllCompoundPredicate predicateMatchingPredicates:]( &OBJC_CLASS___ML3AllCompoundPredicate,  "predicateMatchingPredicates:",  v25));

              id v27 = (void *)objc_claimAutoreleasedReturnValue( +[ML3Track queryWithLibrary:predicate:]( &OBJC_CLASS___ML3Track,  "queryWithLibrary:predicate:",  v39,  v26));
              *(void *)buf = 0LL;
              *(void *)&buf[8] = buf;
              *(void *)&buf[16] = 0x2020000000LL;
              char v60 = 0;
              v42[0] = _NSConcreteStackBlock;
              v42[1] = 3221225472LL;
              v42[2] = sub_10004A0B8;
              v42[3] = &unk_1001A2EF0;
              v42[4] = buf;
              [v27 enumeratePersistentIDsUsingBlock:v42];
              LODWORD(v24) = *(unsigned __int8 *)(*(void *)&buf[8] + 24LL);
              v28 = os_log_create("com.apple.amp.itunescloudd", "Downloads");
              BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
              if ((_DWORD)v24)
              {
                if (v29)
                {
                  *(_DWORD *)id v57 = 138543362;
                  v58 = v19;
                  _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Clearing status for %{public}@",  v57,  0xCu);
                }

                uint64_t v55 = v40;
                v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v55,  1LL));
                [v19 setValues:&off_1001B4AD0 forProperties:v30];
              }

              else
              {
                if (v29)
                {
                  *(_DWORD *)id v57 = 138543362;
                  v58 = v19;
                  _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "RePinning %{public}@", v57, 0xCu);
                }

                v56[0] = v41;
                v56[1] = v40;
                v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v56,  2LL));
                [v19 setValues:&off_1001B4AB8 forProperties:v30];
              }

              _Block_object_dispose(buf, 8);
            }

            id v16 = [v38 countByEnumeratingWithState:&v43 objects:v62 count:16];
          }

          while (v16);
        }

        uint64_t v9 = v35 + 1;
      }

      while ((id)(v35 + 1) != v34);
      id v34 = [obj countByEnumeratingWithState:&v51 objects:v63 count:16];
    }

    while (v34);
  }
}

@end