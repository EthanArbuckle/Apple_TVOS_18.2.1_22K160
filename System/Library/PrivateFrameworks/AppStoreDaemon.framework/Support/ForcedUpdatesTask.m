@interface ForcedUpdatesTask
- (void)main;
@end

@implementation ForcedUpdatesTask

- (void)main
{
  v2 = self;
  if (self)
  {
    v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    id v4 = sub_100255630((uint64_t)&OBJC_CLASS___URLBag);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    id v6 = &__NSArray0__struct;
    id v7 = sub_100255EC0((uint64_t)v5, (uint64_t)@"invalid-build-tools/invalid-versions", &__NSArray0__struct);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

    CFPropertyListRef v9 = sub_1002FA6DC((uint64_t)&OBJC_CLASS___AppDefaultsManager);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

    id v11 = sub_100255630((uint64_t)&OBJC_CLASS___URLBag);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    *(void *)&__int128 v50 = 0LL;
    id v13 = sub_100255DA0((uint64_t)v12, (uint64_t)@"drm-recovery", &v50);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    id v15 = (id)v50;

    if (v15)
    {
      uint64_t v16 = ASDLogHandleForCategory(40LL);
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        uint64_t v18 = *(void *)&v2->super._success;
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v18;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "[%@] Error looking up DRM recovery key: %{public}@",  buf,  0x16u);
      }
    }

    if ([v6 count] || v14)
    {
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472LL;
      v46[2] = sub_1002CA0E8;
      v46[3] = &unk_1003EDB20;
      v46[4] = v2;
      id v19 = v6;
      id v47 = v19;
      id v48 = v14;
      v49 = v3;
      +[ApplicationProxy enumerateApplicationsOfType:usingBlock:]( &OBJC_CLASS___ApplicationProxy,  "enumerateApplicationsOfType:usingBlock:",  0LL,  v46);
      sub_1002FA7EC((uint64_t)&OBJC_CLASS___AppDefaultsManager, v19);
    }

    if (-[NSMutableArray count](v3, "count"))
    {
      v40 = v14;
      id v41 = v6;
      v43 = v2;
      v39 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
      v42 = v3;
      v20 = v3;
      v21 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
      v45 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
      __int128 v50 = 0u;
      __int128 v51 = 0u;
      __int128 v52 = 0u;
      __int128 v53 = 0u;
      obj = v20;
      id v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v50,  buf,  16LL);
      if (v22)
      {
        id v23 = v22;
        uint64_t v24 = *(void *)v51;
        do
        {
          for (i = 0LL; i != v23; i = (char *)i + 1)
          {
            if (*(void *)v51 != v24) {
              objc_enumerationMutation(obj);
            }
            v26 = *(void **)(*((void *)&v50 + 1) + 8LL * (void)i);
            v27 = (void *)objc_claimAutoreleasedReturnValue([v26 downloaderDSID]);
            else {
              v28 = 0LL;
            }
            v29 = (void *)objc_claimAutoreleasedReturnValue([v26 purchaserDSID]);
            v30 = v29;
            if (!v28
              && (!sub_100240668(v29)
               || (v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "ams_iTunesAccountWithDSID:", v30))) == 0))
            {
              v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "ams_activeiTunesAccount"));
            }

            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "ams_DSID"));

            if (v31)
            {
              v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "ams_DSID"));
              v33 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v21,  "objectForKeyedSubscript:",  v32));

              if (!v33) {
                v33 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
              }
              -[NSMutableArray addObject:](v33, "addObject:", v26);
              v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "ams_DSID"));
              -[NSMutableDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v33, v34);
            }
          }

          id v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v50,  buf,  16LL);
        }

        while (v23);
      }

      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472LL;
      *(void *)&buf[16] = sub_1002CA2E4;
      v55 = &unk_1003F1A98;
      v2 = v43;
      v56 = obj;
      v57 = v43;
      v35 = v39;
      v58 = v35;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v21, "enumerateKeysAndObjectsUsingBlock:", buf);
      v36 = v58;
      v37 = v35;

      id v6 = v41;
      v3 = v42;
      v14 = v40;
    }

    else
    {
      v37 = 0LL;
    }
  }

  else
  {
    v37 = 0LL;
  }

  logKey = v2->_logKey;
  v2->_logKey = (LogKey *)v37;

  -[Task completeWithSuccess](v2, "completeWithSuccess");
}

- (void).cxx_destruct
{
}

@end