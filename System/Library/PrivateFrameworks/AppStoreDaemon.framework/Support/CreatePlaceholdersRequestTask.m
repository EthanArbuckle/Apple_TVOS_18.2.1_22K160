@interface CreatePlaceholdersRequestTask
- (id)initForClient:(id)a3 withOptions:(id)a4;
- (void)main;
@end

@implementation CreatePlaceholdersRequestTask

- (id)initForClient:(id)a3 withOptions:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CreatePlaceholdersRequestTask;
  v4 = -[RequestTask initForClient:withOptions:](&v8, "initForClient:withOptions:", a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(&OBJC_CLASS____TtC9appstored6LogKey);
    v6 = (void *)v4[8];
    v4[8] = v5;
  }

  return v4;
}

- (void)main
{
  v2 = self;
  if (self) {
    response = self->super._response;
  }
  else {
    response = 0LL;
  }
  v4 = response;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASDRequestResponse items](v4, "items"));
  id v6 = [v5 mutableCopy];

  v118 = (char *)[v6 count];
  uint64_t v7 = ASDLogHandleForCategory(29LL);
  objc_super v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (v2) {
      client = v2->super._client;
    }
    else {
      client = 0LL;
    }
    *(_DWORD *)buf = 138412546;
    v147 = client;
    __int16 v148 = 2048;
    v149 = v118;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[%@] Creating placeholders for %lu app(s)",  buf,  0x16u);
  }

  if ([v6 count])
  {
    v11 = 0LL;
    *(void *)&__int128 v10 = 138412802LL;
    __int128 v117 = v10;
    id v119 = v6;
    do
    {
      if ((unint64_t)objc_msgSend(v6, "count", v117) < 0x15)
      {
        id v12 = [v6 copy];
        [v6 removeAllObjects];
      }

      else
      {
        id v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subarrayWithRange:", 0, 20));
        objc_msgSend(v6, "removeObjectsInRange:", 0, 20);
      }

      v13 = objc_autoreleasePoolPush();
      id v14 = v12;
      v15 = v14;
      if (v2)
      {
        uint64_t v16 = objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v14 count]));
        id v17 = sub_1001D17B8((uint64_t)&OBJC_CLASS___NetworkMonitor);
        v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        unsigned int v19 = [v18 isConnected];

        if (v19)
        {
          id v20 = sub_1002B86C0(v15, &stru_1003EFF40);
          v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
          id v22 = objc_alloc(&OBJC_CLASS___AMSMediaTask);
          id v23 = sub_100255630((uint64_t)&OBJC_CLASS___URLBag);
          v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
          id v25 = [v22 initWithType:0 clientIdentifier:@"tvappstore" clientVersion:@"1" bag:v24];

          [v25 setItemIdentifiers:v21];
          id v26 = sub_1001F4ADC((uint64_t)&OBJC_CLASS___AMSProcessInfo);
          v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
          [v25 setClientInfo:v27];

          v28 = (void *)objc_claimAutoreleasedReturnValue(-[XPCClient description](v2->super._client, "description"));
          [v25 setLogKey:v28];

          v29 = (void *)objc_claimAutoreleasedReturnValue( +[ACAccountStore ams_sharedAccountStore]( &OBJC_CLASS___ACAccountStore,  "ams_sharedAccountStore"));
          v30 = (void *)v16;
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "ams_activeiTunesAccount"));
          [v25 setAccount:v31];

          [v25 setAdditionalQueryParams:&off_10040E1C8];
          dispatch_semaphore_t v32 = dispatch_semaphore_create(0LL);
          v33 = (void *)objc_claimAutoreleasedReturnValue([v25 perform]);
          v137[0] = _NSConcreteStackBlock;
          v137[1] = 3221225472LL;
          v137[2] = sub_10028E6FC;
          v137[3] = &unk_1003EFF68;
          uint64_t v34 = (uint64_t)v30;
          id v138 = v30;
          v139 = v2;
          v35 = v32;
          v140 = v35;
          [v33 addFinishBlock:v137];
          dispatch_time_t v36 = dispatch_time(0LL, 10000000000LL);
          if (dispatch_semaphore_wait(v35, v36))
          {
            uint64_t v37 = ASDLogHandleForCategory(29LL);
            v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              v116 = v2->super._client;
              *(_DWORD *)buf = 138412290;
              v147 = v116;
              _os_log_error_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_ERROR,  "[%@] Placeholder artwork will be missing, media task timed out",  buf,  0xCu);
            }
          }

          uint64_t v16 = v34;
        }

        else
        {
          uint64_t v39 = ASDLogHandleForCategory(29LL);
          v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            v40 = v2->super._client;
            *(_DWORD *)buf = 138412290;
            v147 = v40;
            _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "[%@] Placeholder artwork will be missing, no network available",  buf,  0xCu);
          }
        }

        v122 = v11;
        v120 = v13;
        v123 = (void *)v16;
        if (os_variant_has_internal_content("com.apple.appstored"))
        {
          v41 = v2->super._response;
          unsigned int v127 = -[ASDRequestResponse createAsMobileBackup](v41, "createAsMobileBackup");
        }

        else
        {
          unsigned int v127 = 0;
        }

        __int128 v135 = 0u;
        __int128 v136 = 0u;
        __int128 v133 = 0u;
        __int128 v134 = 0u;
        v121 = v15;
        id obj = v15;
        id v126 = [obj countByEnumeratingWithState:&v133 objects:buf count:16];
        if (v126)
        {
          uint64_t v125 = *(void *)v134;
          do
          {
            uint64_t v42 = 0LL;
            do
            {
              if (*(void *)v134 != v125) {
                objc_enumerationMutation(obj);
              }
              uint64_t v128 = v42;
              v43 = *(void **)(*((void *)&v133 + 1) + 8 * v42);
              v44 = objc_alloc(&OBJC_CLASS____TtC9appstored6LogKey);
              v45 = v2;
              v46 = v2->super._client;
              v47 = (void *)objc_claimAutoreleasedReturnValue(-[XPCClient description](v46, "description"));
              uint64_t v48 = objc_claimAutoreleasedReturnValue([v43 bundleID]);
              v49 = (void *)v48;
              if (v48) {
                v50 = (const __CFString *)v48;
              }
              else {
                v50 = &stru_1003F3E40;
              }
              v145[0] = v50;
              v51 = (void *)objc_claimAutoreleasedReturnValue([v43 itemID]);
              uint64_t v52 = objc_claimAutoreleasedReturnValue([v51 stringValue]);
              v53 = (void *)v52;
              if (v52) {
                v54 = (const __CFString *)v52;
              }
              else {
                v54 = &stru_1003F3E40;
              }
              v145[1] = v54;
              v55 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v145,  2LL));
              v56 = -[LogKey initWithBase:IDs:](v44, "initWithBase:IDs:", v47, v55);

              v57 = objc_alloc_init(&OBJC_CLASS___CoordinatorBuilder);
              v58 = (void *)objc_claimAutoreleasedReturnValue([v43 bundleID]);
              v60 = v58;
              if (v57)
              {
                objc_setProperty_atomic(v57, v59, v58, 8LL);

                v57->_intent = 3LL;
                objc_setProperty_atomic(v57, v61, v56, 40LL);
                v62 = v56;
                if (v127) {
                  v57->_clientID = 2LL;
                }
              }

              else
              {

                v62 = v56;
              }

              id v132 = 0LL;
              id v63 = sub_1002DF048(v57, &v132);
              v64 = (void *)objc_claimAutoreleasedReturnValue(v63);
              id v65 = v132;
              v66 = v65;
              v2 = v45;
              if (!v64)
              {
                uint64_t v73 = ASDLogHandleForCategory(29LL);
                v74 = (os_log_s *)objc_claimAutoreleasedReturnValue(v73);
                if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)v141 = 138412546;
                  v142 = v62;
                  __int16 v143 = 2114;
                  id v144 = v66;
                  _os_log_error_impl( (void *)&_mh_execute_header,  v74,  OS_LOG_TYPE_ERROR,  "[%@] Could not create coordinator: %{public}@",  v141,  0x16u);
                }

                goto LABEL_76;
              }

              if (v127)
              {
                v67 = v62;
                v68 = v45->super._response;
                unsigned int v69 = -[ASDRequestResponse completeDataPromise](v68, "completeDataPromise");

                v62 = v67;
                if (v69)
                {
                  uint64_t v70 = ASDLogHandleForCategory(29LL);
                  v71 = (os_log_s *)objc_claimAutoreleasedReturnValue(v70);
                  if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)v141 = 138412546;
                    v142 = v67;
                    __int16 v143 = 2114;
                    id v144 = v66;
                    _os_log_error_impl( (void *)&_mh_execute_header,  v71,  OS_LOG_TYPE_ERROR,  "[%@] Could not complete user data promise: %{public}@",  v141,  0x16u);
                  }

                  sub_1001E5794(v64, 0LL);
                }

                id v131 = v66;
                if ([v64 conformsToProtocol:&OBJC_PROTOCOL___IXCoordinatorWithAppAssetPromise]) {
                  unsigned __int8 v72 = [v64 setAppAssetPromiseResponsibleClient:1 error:&v131];
                }
                else {
                  unsigned __int8 v72 = 0;
                }
                id v75 = v131;

                if ((v72 & 1) == 0)
                {
                  uint64_t v76 = ASDLogHandleForCategory(29LL);
                  v77 = (os_log_s *)objc_claimAutoreleasedReturnValue(v76);
                  if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)v141 = 138412546;
                    v142 = v62;
                    __int16 v143 = 2114;
                    id v144 = v75;
                    _os_log_error_impl( (void *)&_mh_execute_header,  v77,  OS_LOG_TYPE_ERROR,  "[%@] Could not set App Store as app asset DRI: %{public}@",  v141,  0x16u);
                  }
                }
              }

              else
              {
                id v75 = v65;
              }

              if (sub_1001E4DA0(v64))
              {
                uint64_t v78 = ASDLogHandleForCategory(29LL);
                v66 = (void *)objc_claimAutoreleasedReturnValue(v78);
                if (os_log_type_enabled((os_log_t)v66, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)v141 = 138412290;
                  v142 = v62;
                  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v66,  OS_LOG_TYPE_ERROR,  "[%@] Coordinator already has a configured placeholder",  v141,  0xCu);
                }
              }

              else
              {
                v57 = objc_alloc_init(&OBJC_CLASS___PlaceholderBuilder);
                v79 = (void *)objc_claimAutoreleasedReturnValue([v43 itemID]);
                v81 = (void *)objc_claimAutoreleasedReturnValue([v123 objectForKeyedSubscript:v79]);
                if (v57) {
                  objc_setProperty_atomic(v57, v80, v81, 32LL);
                }

                v83 = (void *)objc_claimAutoreleasedReturnValue([v43 itemName]);
                if (v57) {
                  objc_setProperty_atomic(v57, v82, v83, 48LL);
                }

                v84 = (void *)objc_claimAutoreleasedReturnValue([v43 bundleID]);
                v86 = v84;
                if (v57)
                {
                  objc_setProperty_atomic(v57, v85, v84, 40LL);

                  v57[1]._clientID = 2LL;
                  v87 = v62;
                  objc_setProperty_atomic(v57, v88, v62, 88LL);
                  v57[1]._priority = 0LL;
                }

                else
                {
                  v87 = v62;
                }

                v89 = objc_alloc_init(&OBJC_CLASS___MIStoreMetadata);
                v90 = (void *)objc_claimAutoreleasedReturnValue([v43 vendorName]);
                -[MIStoreMetadata setArtistName:](v89, "setArtistName:", v90);

                v91 = (void *)objc_claimAutoreleasedReturnValue([v43 bundleID]);
                -[MIStoreMetadata setSoftwareVersionBundleID:](v89, "setSoftwareVersionBundleID:", v91);

                v92 = (void *)objc_claimAutoreleasedReturnValue([v43 itemName]);
                -[MIStoreMetadata setItemName:](v89, "setItemName:", v92);

                v93 = (void *)objc_claimAutoreleasedReturnValue([v43 itemID]);
                -[MIStoreMetadata setItemID:](v89, "setItemID:", v93);

                v94 = (void *)objc_claimAutoreleasedReturnValue([v43 externalVersionIdentifier]);
                -[MIStoreMetadata setSoftwareVersionExternalIdentifier:]( v89,  "setSoftwareVersionExternalIdentifier:",  v94);

                v95 = (void *)objc_claimAutoreleasedReturnValue([v43 storeFront]);
                -[MIStoreMetadata setStorefront:](v89, "setStorefront:", v95);

                v96 = (void *)objc_claimAutoreleasedReturnValue([v43 accountName]);
                -[MIStoreMetadata setAppleID:](v89, "setAppleID:", v96);

                v97 = (void *)objc_claimAutoreleasedReturnValue([v43 accountID]);
                -[MIStoreMetadata setDSPersonID:](v89, "setDSPersonID:", v97);

                v98 = (void *)objc_claimAutoreleasedReturnValue([v43 downloaderID]);
                -[MIStoreMetadata setDownloaderID:](v89, "setDownloaderID:", v98);

                v99 = (void *)objc_claimAutoreleasedReturnValue([v43 familyID]);
                -[MIStoreMetadata setFamilyID:](v89, "setFamilyID:", v99);

                v100 = (void *)objc_claimAutoreleasedReturnValue([v43 purchaserDSID]);
                -[MIStoreMetadata setPurchaserID:](v89, "setPurchaserID:", v100);

                v101 = (void *)objc_claimAutoreleasedReturnValue([v43 altDSID]);
                -[MIStoreMetadata setAltDSID:](v89, "setAltDSID:", v101);

                -[MIStoreMetadata setDeviceBasedVPP:](v89, "setDeviceBasedVPP:", [v43 deviceBasedVPP]);
                -[MIStoreMetadata setSourceApp:](v89, "setSourceApp:", @"com.apple.TVAppStore");
                if (v57) {
                  objc_setProperty_atomic(v57, v102, v89, 120LL);
                }

                id v130 = 0LL;
                id v103 = sub_10026C808((uint64_t)v57, &v130);
                v104 = (void *)objc_claimAutoreleasedReturnValue(v103);
                id v105 = v130;
                v66 = v105;
                if (!v104)
                {
                  uint64_t v109 = ASDLogHandleForCategory(29LL);
                  v110 = (os_log_s *)objc_claimAutoreleasedReturnValue(v109);
                  if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)v141 = 138412546;
                    v62 = v87;
                    v142 = v87;
                    __int16 v143 = 2114;
                    id v144 = v66;
                    _os_log_error_impl( (void *)&_mh_execute_header,  v110,  OS_LOG_TYPE_ERROR,  "[%@] Could not build placeholder for coordinator: %{public}@",  v141,  0x16u);
                    goto LABEL_75;
                  }

- (void).cxx_destruct
{
}

@end