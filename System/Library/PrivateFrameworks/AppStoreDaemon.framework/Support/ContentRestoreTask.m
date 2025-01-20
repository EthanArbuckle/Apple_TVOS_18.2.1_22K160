@interface ContentRestoreTask
- (void)main;
@end

@implementation ContentRestoreTask

- (void)main
{
  if (-[NSError count](self->super._error, "count"))
  {
    id v3 = sub_100255630((uint64_t)&OBJC_CLASS___URLBag);
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    id v5 = sub_1002567DC(v4, @"p2-content-restore/url");
    uint64_t v147 = objc_claimAutoreleasedReturnValue(v5);

    v6 = objc_alloc(&OBJC_CLASS___ContentRestoreURLRequestEncoder);
    id v7 = sub_100255630((uint64_t)&OBJC_CLASS___URLBag);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = -[ContentRestoreURLRequestEncoder initWithBag:](v6, "initWithBag:", v8);

    -[ContentRestoreURLRequestEncoder setAccount:](v9, "setAccount:", *(void *)&self->super._success);
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[AppInstallationEvent additionalMetricsWithRestoreInstalls:]( &OBJC_CLASS____TtC9appstored20AppInstallationEvent,  "additionalMetricsWithRestoreInstalls:",  self->super._error));
    -[ContentRestoreURLRequestEncoder setAdditionalMetrics:](v9, "setAdditionalMetrics:", v10);

    id v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&self->super._success, "ams_DSID"));
    v12 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    if (os_variant_has_internal_content("com.apple.appstored")) {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  @"internal",  @"OSBuildType");
    }
    CFPropertyListRef v13 = sub_1002FA4B4((uint64_t)&OBJC_CLASS___AppDefaultsManager);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = v14;
    if (v14
      && (([v14 isEqualToNumber:&off_10040C328] & 1) != 0
       || [v15 isEqualToNumber:&off_10040C340]))
    {
      uint64_t v16 = ASDLogHandleForCategory(29LL);
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v175) = [v15 intValue];
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Content restore setting ForceAppDRMMode: %d",  buf,  8u);
      }

      v18 = (void *)objc_claimAutoreleasedReturnValue([v15 stringValue]);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  v18,  @"ForceAppDRMMode");
    }

    uint64_t v19 = objc_claimAutoreleasedReturnValue(+[AMSDevice deviceName](&OBJC_CLASS___AMSDevice, "deviceName"));
    if (v19) {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  v19,  @"device-name");
    }
    v139 = (void *)v19;
    uint64_t v20 = objc_claimAutoreleasedReturnValue(+[AMSDevice deviceGUID](&OBJC_CLASS___AMSDevice, "deviceGUID"));
    if (v20) {
      -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v20, @"guid");
    }
    v137 = (void *)v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[AMSKeybag sharedInstance](&OBJC_CLASS___AMSKeybag, "sharedInstance"));
    id v166 = 0LL;
    uint64_t v22 = objc_claimAutoreleasedReturnValue([v21 keybagSyncDataWithAccountID:v11 transactionType:1 error:&v166]);
    id v23 = v166;

    v145 = v12;
    v146 = v9;
    v141 = v15;
    v143 = v11;
    uint64_t v133 = v22;
    v135 = v23;
    if (v22)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  v22,  @"kbsync",  v22);
    }

    else
    {
      uint64_t v27 = ASDLogHandleForCategory(29LL);
      v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v175 = v11;
        __int16 v176 = 2114;
        id v177 = v23;
        _os_log_error_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "KBSync unavailable for account: %{public}@ error: %{public}@",  buf,  0x16u);
      }
    }

    v29 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    __int128 v162 = 0u;
    __int128 v163 = 0u;
    __int128 v164 = 0u;
    __int128 v165 = 0u;
    v148 = self;
    obj = self->super._error;
    id v30 = -[NSError countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v162,  buf,  16LL);
    v152 = v29;
    if (v30)
    {
      id v31 = v30;
      uint64_t v32 = *(void *)v163;
      do
      {
        for (i = 0LL; i != v31; i = (char *)i + 1)
        {
          if (*(void *)v163 != v32) {
            objc_enumerationMutation(obj);
          }
          v34 = *(_BYTE **)(*((void *)&v162 + 1) + 8LL * (void)i);
          v35 = -[LogKey initWithAppInstallMemoryEntity:]( objc_alloc(&OBJC_CLASS____TtC9appstored6LogKey),  "initWithAppInstallMemoryEntity:",  v34);
          id v36 = sub_100323DD0(v34);
          v37 = (void *)objc_claimAutoreleasedReturnValue(v36);

          uint64_t v38 = ASDLogHandleForCategory(29LL);
          v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
          BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);
          if (v37)
          {
            if (v40)
            {
              *(_DWORD *)v170 = 138412546;
              v171 = v35;
              __int16 v172 = 2114;
              v173 = v34;
              _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "[%@] ContentRestore lookup: %{public}@",  v170,  0x16u);
            }

            v41 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
            v168[0] = @"item-id";
            id v42 = sub_100323DD0(v34);
            v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
            v168[1] = @"kind";
            v169[0] = v43;
            v169[1] = @"software";
            v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v169,  v168,  2LL));
            v39 = -[NSMutableDictionary initWithDictionary:](v41, "initWithDictionary:", v44);

            id v45 = sub_1002D79A4(v34);
            v46 = (void *)objc_claimAutoreleasedReturnValue(v45);

            if (v46)
            {
              id v47 = sub_1002D79A4(v34);
              v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
              -[os_log_s setObject:forKeyedSubscript:]( v39,  "setObject:forKeyedSubscript:",  v48,  @"store-front-id");
            }

            v49 = sub_1002D7968(v34);
            v50 = (void *)objc_claimAutoreleasedReturnValue(v49);

            if (v50)
            {
              v51 = sub_1002D7968(v34);
              v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
              -[os_log_s setObject:forKeyedSubscript:]( v39,  "setObject:forKeyedSubscript:",  v52,  @"software-external-version-identifier");
            }

            id v53 = sub_1002D79C8(v34);
            v54 = (void *)objc_claimAutoreleasedReturnValue(v53);

            if (v54)
            {
              id v55 = sub_1002D79C8(v34);
              v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
              v57 = (void *)objc_claimAutoreleasedReturnValue([v56 UUIDString]);
              -[os_log_s setObject:forKeyedSubscript:](v39, "setObject:forKeyedSubscript:", v57, @"vid");
            }

            id v58 = sub_1002D7910(v34);
            uint64_t v59 = objc_claimAutoreleasedReturnValue(v58);
            if (v59)
            {
              v60 = (void *)v59;
              id v61 = sub_1002D7910(v34);
              v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
              id v63 = sub_1002D78EC(v34);
              v64 = (void *)objc_claimAutoreleasedReturnValue(v63);
              unsigned __int8 v65 = [v62 isEqualToNumber:v64];

              if ((v65 & 1) == 0)
              {
                id v66 = sub_1002D78EC(v34);
                v67 = (void *)objc_claimAutoreleasedReturnValue(v66);
                -[os_log_s setObject:forKeyedSubscript:](v39, "setObject:forKeyedSubscript:", v67, @"ownerDsid");
              }
            }

            v29 = v152;
            -[NSMutableArray addObject:](v152, "addObject:", v39, v133);
          }

          else if (v40)
          {
            *(_DWORD *)v170 = 138412546;
            v171 = v35;
            __int16 v172 = 2114;
            v173 = v34;
            _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "[%@] item: %{public}@ due to lack of required metadata",  v170,  0x16u);
          }
        }

        id v31 = -[NSError countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v162,  buf,  16LL);
      }

      while (v31);
    }

    v68 = v145;
    if (-[NSMutableArray count](v29, "count")) {
      -[NSMutableDictionary setObject:forKeyedSubscript:](v145, "setObject:forKeyedSubscript:", v29, @"items");
    }
    v69 = (void *)objc_claimAutoreleasedReturnValue(+[AMSDevice serialNumber](&OBJC_CLASS___AMSDevice, "serialNumber", v133));
    v71 = (void *)v147;
    v70 = v148;
    v72 = v146;
    if (v69) {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v145,  "setObject:forKeyedSubscript:",  v69,  @"serial-number");
    }

    v73 = (void *)objc_claimAutoreleasedReturnValue( -[ContentRestoreURLRequestEncoder requestWithMethod:bagURL:parameters:]( v146,  "requestWithMethod:bagURL:parameters:",  4LL,  v147,  v145));
    id v161 = 0LL;
    v74 = (void *)objc_claimAutoreleasedReturnValue([v73 resultWithError:&v161]);
    id v75 = v161;

    v76 = &selRef_refreshUpdateCountWithReplyHandler_;
    if (v75)
    {
      v77 = 0LL;
      v78 = 0LL;
    }

    else
    {
      id v79 = sub_1001F4B54((uint64_t)&OBJC_CLASS___AMSProcessInfo);
      v80 = (void *)objc_claimAutoreleasedReturnValue(v79);
      uint64_t v81 = ASDLogHandleForCategory(29LL);
      v82 = (os_log_s *)objc_claimAutoreleasedReturnValue(v81);
      if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
      {
        v83 = (void *)objc_claimAutoreleasedReturnValue([v80 bundleIdentifier]);
        *(_DWORD *)buf = 138543362;
        id v175 = v83;
        _os_log_impl( (void *)&_mh_execute_header,  v82,  OS_LOG_TYPE_DEFAULT,  "Content restore attributing network to: %{public}@",  buf,  0xCu);
      }

      v84 = sub_1001A5534((uint64_t)&OBJC_CLASS___AMSURLSession, v80);
      v78 = (void *)objc_claimAutoreleasedReturnValue(v84);
      v85 = (void *)objc_claimAutoreleasedReturnValue([v78 dataTaskPromiseWithRequest:v74]);
      id v160 = 0LL;
      v77 = (void *)objc_claimAutoreleasedReturnValue([v85 resultWithError:&v160]);
      id v75 = v160;

      if (!v75)
      {
        v86 = (void *)objc_claimAutoreleasedReturnValue([v77 object]);
        id v87 = sub_1002EB678((uint64_t)&OBJC_CLASS___StoreItemResponse, v86, 0);
        id Property = (id)objc_claimAutoreleasedReturnValue(v87);
        v90 = Property;
        if (Property) {
          id Property = objc_getProperty(Property, v89, 56LL, 1);
        }
        id v149 = Property;
        uint64_t v91 = objc_claimAutoreleasedReturnValue([v86 objectForKeyedSubscript:@"failed-items"]);
        v140 = (void *)v91;
        v142 = v90;
        v144 = v86;
        if (v91)
        {
          v92 = (void *)v91;
          v134 = v77;
          v136 = v78;
          v138 = v74;
          v153 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
          __int128 v156 = 0u;
          __int128 v157 = 0u;
          __int128 v158 = 0u;
          __int128 v159 = 0u;
          id obja = v92;
          id v93 = [obja countByEnumeratingWithState:&v156 objects:v167 count:16];
          if (v93)
          {
            id v94 = v93;
            uint64_t v95 = *(void *)v157;
            uint64_t v96 = ASDServerErrorDomain;
            do
            {
              for (j = 0LL; j != v94; j = (char *)j + 1)
              {
                if (*(void *)v157 != v95) {
                  objc_enumerationMutation(obja);
                }
                v98 = *(void **)(*((void *)&v156 + 1) + 8LL * (void)j);
                v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "objectForKeyedSubscript:", @"customerMessage", v134));
                v100 = (void *)objc_claimAutoreleasedReturnValue([v98 objectForKeyedSubscript:@"item-id"]);
                v101 = (void *)objc_claimAutoreleasedReturnValue([v98 objectForKeyedSubscript:@"failureType"]);
                id v102 = [v101 integerValue];

                if (v102)
                {
                  v103 = (void *)objc_claimAutoreleasedReturnValue([v98 objectForKeyedSubscript:@"failureType"]);
                  uint64_t v104 = (uint64_t)[v103 integerValue];
                }

                else
                {
                  uint64_t v104 = -1LL;
                }

                uint64_t v105 = ASDErrorWithTitleAndMessage(v96, v104, v99, 0LL);
                v106 = (void *)objc_claimAutoreleasedReturnValue(v105);
                if (v100) {
                  -[NSMutableDictionary setObject:forKeyedSubscript:](v153, "setObject:forKeyedSubscript:", v106, v100);
                }
              }

              id v94 = [obja countByEnumeratingWithState:&v156 objects:v167 count:16];
            }

            while (v94);
          }

          v71 = (void *)v147;
          v70 = v148;
          v68 = v145;
          v72 = v146;
          v78 = v136;
          v74 = v138;
          v107 = &selRef_refreshUpdateCountWithReplyHandler_;
          v77 = v134;
          v90 = v142;
          v108 = v153;
        }

        else
        {
          v108 = 0LL;
          v107 = &selRef_refreshUpdateCountWithReplyHandler_;
        }

        v109 = (objc_class *)objc_msgSend(v149, "copy", v134);
        uint64_t v110 = *((int *)v107 + 692);
        v111 = *(Class *)((char *)&v70->super.super.super.isa + v110);
        *(Class *)((char *)&v70->super.super.super.isa + v110) = v109;

        v154 = v108;
        if (v108)
        {
          v113 = (NSArray *)-[NSMutableDictionary copy](v108, "copy");
          restoreInstalls = v70->_restoreInstalls;
          v70->_restoreInstalls = v113;
        }

        if (v90) {
          id v115 = objc_getProperty(v90, v112, 64LL, 1);
        }
        else {
          id v115 = 0LL;
        }
        v116 = v144;
        id v117 = v115;

        if (v117)
        {
          uint64_t v118 = objc_claimAutoreleasedReturnValue(+[AMSKeybag sharedInstance](&OBJC_CLASS___AMSKeybag, "sharedInstance"));
          v120 = v90;
          v121 = (void *)v118;
          if (v120) {
            id v122 = objc_getProperty(v120, v119, 64LL, 1);
          }
          else {
            id v122 = 0LL;
          }
          id v123 = v122;
          id v155 = 0LL;
          [v121 importKeybagWithData:v123 error:&v155];
          id v124 = v155;

          if (v124)
          {
            uint64_t v125 = ASDLogHandleForCategory(29LL);
            v126 = (os_log_s *)objc_claimAutoreleasedReturnValue(v125);
            if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              id v175 = v124;
              _os_log_error_impl( (void *)&_mh_execute_header,  v126,  OS_LOG_TYPE_ERROR,  "Content restore keybag resulted in error: %{public}@",  buf,  0xCu);
            }
          }

          v90 = v142;
          v116 = v144;
        }

        uint64_t v127 = ASDLogHandleForCategory(29LL);
        v128 = (os_log_s *)objc_claimAutoreleasedReturnValue(v127);
        if (os_log_type_enabled(v128, OS_LOG_TYPE_INFO))
        {
          id v129 = [v149 count];
          *(_DWORD *)buf = 134217984;
          id v175 = v129;
          _os_log_impl( (void *)&_mh_execute_header,  v128,  OS_LOG_TYPE_INFO,  "Successfully completed content restore call with %ld appinstall(s)",  buf,  0xCu);
        }

        id v75 = 0LL;
      }

      v76 = &selRef_refreshUpdateCountWithReplyHandler_;
    }

    uint64_t v130 = ASDErrorWithSafeUserInfo(v75);
    v131 = (void *)objc_claimAutoreleasedReturnValue(v130);
    objc_setProperty_atomic_copy(v70, v132, v131, 32LL);

    LOBYTE(v70->super._keepAlive) = [*(id *)((char *)&v70->super.super.super.isa + *((int *)v76 + 692)) count] != 0;
  }

  else
  {
    uint64_t v24 = ASDErrorWithTitleAndMessage( ASDErrorDomain,  507LL,  @"Please provide one or more restore items to restore",  0LL);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    objc_setProperty_atomic_copy(self, v26, v25, 32LL);

    LOBYTE(self->super._keepAlive) = 0;
  }

- (void).cxx_destruct
{
}

@end