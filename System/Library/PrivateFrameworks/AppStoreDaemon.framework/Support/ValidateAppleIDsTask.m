@interface ValidateAppleIDsTask
- (void)main;
@end

@implementation ValidateAppleIDsTask

- (void)main
{
  uint64_t v3 = ASDLogHandleForCategory(14LL);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[Validation] Scanning installed applications for outdated metadata",  buf,  2u);
  }

  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v68 = 0u;
  __int128 v69 = 0u;
  __int128 v70 = 0u;
  __int128 v71 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ams_iTunesAccounts"));
  id v8 = [v7 copy];

  id v9 = [v8 countByEnumeratingWithState:&v68 objects:v79 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v69;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v69 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v68 + 1) + 8LL * (void)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "ams_DSID"));
        if (v14)
        {
          uint64_t v15 = objc_claimAutoreleasedReturnValue([v13 username]);
          if (v15)
          {
            v16 = (void *)v15;
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "ams_altDSID"));

            if (v17) {
              -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v13, v14);
            }
          }
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v68 objects:v79 count:16];
    }

    while (v10);
  }

  __int128 v66 = 0u;
  __int128 v67 = 0u;
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  id v18 = sub_100325C00((uint64_t)&OBJC_CLASS___LSApplicationRecord, 0LL, 0LL);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  id v61 = [v19 countByEnumeratingWithState:&v64 objects:v78 count:16];
  if (v61)
  {
    uint64_t v20 = *(void *)v65;
    v59 = v19;
    uint64_t v60 = *(void *)v65;
    v58 = self;
LABEL_16:
    uint64_t v21 = 0LL;
    while (1)
    {
      if (*(void *)v65 != v20) {
        objc_enumerationMutation(v19);
      }
      v22 = *(void **)(*((void *)&v64 + 1) + 8 * v21);
      v23 = objc_autoreleasePoolPush();
      id v24 = sub_100325E80(v22);
      id Property = (id)objc_claimAutoreleasedReturnValue(v24);
      v27 = Property;
      if (Property) {
        id Property = objc_getProperty(Property, v26, 16LL, 1);
      }
      v28 = (os_log_s *)Property;

      if (!v28)
      {
        uint64_t v55 = ASDLogHandleForCategory(14LL);
        v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          v57 = (void *)objc_claimAutoreleasedReturnValue([v22 bundleIdentifier]);
          *(_DWORD *)buf = 138543362;
          v73 = v57;
          _os_log_error_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_ERROR,  "[Validation] Skipping validation for %{public}@: No owner available or unowned application",  buf,  0xCu);
        }

        objc_autoreleasePoolPop(v23);
LABEL_55:

        goto LABEL_56;
      }

      context = v23;
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v28));
      if (!v29)
      {
        uint64_t v40 = ASDLogHandleForCategory(14LL);
        v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          v51 = (void *)objc_claimAutoreleasedReturnValue([v22 bundleIdentifier]);
          *(_DWORD *)buf = 138543618;
          v73 = v51;
          __int16 v74 = 2114;
          v75 = v28;
          _os_log_error_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_ERROR,  "[Validation] Skipping validation for %{public}@: No account available for %{public}@",  buf,  0x16u);
        }

        int v39 = 1;
        goto LABEL_46;
      }

      id v30 = sub_1003261E8(v22);
      v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      v32 = v31;
      if (!v31)
      {
        uint64_t v50 = ASDLogHandleForCategory(14LL);
        v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          v52 = (void *)objc_claimAutoreleasedReturnValue([v22 bundleIdentifier]);
          *(_DWORD *)buf = 138543362;
          v73 = v52;
          _os_log_error_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_ERROR,  "[Validation] Skipping validation for %{public}@: Could not read existing metadata",  buf,  0xCu);
        }

        int v39 = 1;
        goto LABEL_45;
      }

      v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[os_log_s appleID](v31, "appleID"));
      if (v33)
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue([v29 username]);
        unsigned int v35 = -[os_log_s isEqualToString:](v33, "isEqualToString:", v34);

        if (v35)
        {
          uint64_t v36 = ASDLogHandleForCategory(14LL);
          v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            v38 = (void *)objc_claimAutoreleasedReturnValue([v22 bundleIdentifier]);
            *(_DWORD *)buf = 138543362;
            v73 = v38;
            _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "[Validation] Completed validation for %{public}@: Metadata already up to date",  buf,  0xCu);
          }

          int v39 = 1;
          goto LABEL_44;
        }
      }

      uint64_t v41 = ASDLogHandleForCategory(14LL);
      v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        v43 = (void *)objc_claimAutoreleasedReturnValue([v22 bundleIdentifier]);
        v44 = (void *)objc_claimAutoreleasedReturnValue([v29 username]);
        *(_DWORD *)buf = 138543875;
        v73 = v43;
        __int16 v74 = 2113;
        v75 = v33;
        __int16 v76 = 2113;
        v77 = v44;
        _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "[Validation] Updating metadata for: %{public}@, current Apple ID: '%{private}@' updated Apple ID: '%{private}@'",  buf,  0x20u);

        v19 = v59;
      }

      sub_1003042C8(v32, v29);
      v45 = (void *)objc_claimAutoreleasedReturnValue([v22 bundleIdentifier]);
      id v63 = 0LL;
      sub_10030456C(v32, v45, 0LL, &v63);
      v37 = (os_log_s *)v63;

      uint64_t v46 = ASDLogHandleForCategory(14LL);
      v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
      v48 = v47;
      if (v37)
      {
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          v49 = (void *)objc_claimAutoreleasedReturnValue([v22 bundleIdentifier]);
          *(_DWORD *)buf = 138543618;
          v73 = v49;
          __int16 v74 = 2114;
          v75 = v37;
          _os_log_error_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_ERROR,  "[Validation] Failed to update metadata for: %{public}@, error occurred: %{public}@",  buf,  0x16u);
LABEL_42:

          v19 = v59;
        }
      }

      else if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        v49 = (void *)objc_claimAutoreleasedReturnValue([v22 bundleIdentifier]);
        *(_DWORD *)buf = 138543362;
        v73 = v49;
        _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "[Validation] Completed validation for %{public}@: Metadata successfully updated",  buf,  0xCu);
        goto LABEL_42;
      }

      int v39 = 0;
LABEL_44:

      uint64_t v20 = v60;
LABEL_45:

LABEL_46:
      objc_autoreleasePoolPop(context);
      if (v39) {
        goto LABEL_55;
      }
      if (v61 == (id)++v21)
      {
        self = v58;
        id v61 = [v19 countByEnumeratingWithState:&v64 objects:v78 count:16];
        if (v61) {
          goto LABEL_16;
        }
        break;
      }
    }
  }

  uint64_t v53 = ASDLogHandleForCategory(14LL);
  v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_DEFAULT,  "[Validation] Completed scan for installed applications with outdated metadata",  buf,  2u);
  }

  -[Task completeWithSuccess](self, "completeWithSuccess");
LABEL_56:
}

@end