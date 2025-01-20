@interface IDSMadridEndpointFilterComponent
- (id)runIndividuallyWithInput:(id)a3;
- (void)addTokenURI:(id)a3 forProperty:(id)a4 toRegistrationPropertyToDestinationsMap:(id)a5;
@end

@implementation IDSMadridEndpointFilterComponent

- (id)runIndividuallyWithInput:(id)a3
{
  id v3 = a3;
  v79 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v91 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v80 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v81 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v83 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v114 = 0u;
  __int128 v115 = 0u;
  __int128 v116 = 0u;
  __int128 v117 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([v3 endpoints]);
  v89 = v3;
  id v85 = [obj countByEnumeratingWithState:&v114 objects:v132 count:16];
  if (v85)
  {
    uint64_t v84 = *(void *)v115;
    do
    {
      for (id i = 0LL; i != v85; id i = v45 + 1)
      {
        if (*(void *)v115 != v84) {
          objc_enumerationMutation(obj);
        }
        v88 = (char *)i;
        v5 = *(void **)(*((void *)&v114 + 1) + 8LL * (void)i);
        uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 pushTokenObject]);
        v86 = (void *)objc_claimAutoreleasedReturnValue([v5 URI]);
        v87 = (void *)v6;
        v7 = (void *)objc_claimAutoreleasedReturnValue([v86 URIByAddingPushToken:v6]);
        __int128 v110 = 0u;
        __int128 v111 = 0u;
        __int128 v112 = 0u;
        __int128 v113 = 0u;
        v8 = (void *)objc_claimAutoreleasedReturnValue([v3 registrationProperties]);
        v9 = (void *)objc_claimAutoreleasedReturnValue([v8 interesting]);

        id v10 = [v9 countByEnumeratingWithState:&v110 objects:v131 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v111;
          do
          {
            for (j = 0LL; j != v11; j = (char *)j + 1)
            {
              if (*(void *)v111 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void *)(*((void *)&v110 + 1) + 8LL * (void)j);
              v15 = (void *)objc_claimAutoreleasedReturnValue([v5 capabilities]);
              uint64_t v16 = (uint64_t)[v15 valueForCapability:v14];

              if (v16 < 1)
              {
                v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog delivery](&OBJC_CLASS___IDSFoundationLog, "delivery"));
                if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
                {
                  v18 = (void *)objc_claimAutoreleasedReturnValue([v3 guid]);
                  *(_DWORD *)buf = 138412802;
                  v126 = v18;
                  __int16 v127 = 2112;
                  v128 = v7;
                  __int16 v129 = 2112;
                  uint64_t v130 = v14;
                  _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "GUID %@ Destination %@ lacks interesting property %@",  buf,  0x20u);
                }
              }

              else
              {
                -[IDSMadridEndpointFilterComponent addTokenURI:forProperty:toRegistrationPropertyToDestinationsMap:]( self,  "addTokenURI:forProperty:toRegistrationPropertyToDestinationsMap:",  v7,  v14,  v91);
              }
            }

            id v11 = [v9 countByEnumeratingWithState:&v110 objects:v131 count:16];
          }

          while (v11);
        }

        __int128 v108 = 0u;
        __int128 v109 = 0u;
        __int128 v106 = 0u;
        __int128 v107 = 0u;
        v19 = (void *)objc_claimAutoreleasedReturnValue([v3 registrationProperties]);
        v20 = (void *)objc_claimAutoreleasedReturnValue([v19 requireAll]);

        id v21 = [v20 countByEnumeratingWithState:&v106 objects:v124 count:16];
        if (v21)
        {
          id v22 = v21;
          uint64_t v23 = *(void *)v107;
          char v24 = 1;
          do
          {
            for (k = 0LL; k != v22; k = (char *)k + 1)
            {
              if (*(void *)v107 != v23) {
                objc_enumerationMutation(v20);
              }
              uint64_t v26 = *(void *)(*((void *)&v106 + 1) + 8LL * (void)k);
              v27 = (void *)objc_claimAutoreleasedReturnValue([v5 capabilities]);
              uint64_t v28 = (uint64_t)[v27 valueForCapability:v26];

              if (v28 < 1)
              {
                v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog delivery](&OBJC_CLASS___IDSFoundationLog, "delivery"));
                if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                {
                  v30 = (void *)objc_claimAutoreleasedReturnValue([v89 guid]);
                  *(_DWORD *)buf = 138412802;
                  v126 = v30;
                  __int16 v127 = 2112;
                  v128 = v7;
                  __int16 v129 = 2112;
                  uint64_t v130 = v26;
                  _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "GUID %@ Destination %@ lacks required property %@",  buf,  0x20u);
                }

                char v24 = 0;
              }

              else
              {
                -[IDSMadridEndpointFilterComponent addTokenURI:forProperty:toRegistrationPropertyToDestinationsMap:]( self,  "addTokenURI:forProperty:toRegistrationPropertyToDestinationsMap:",  v7,  v26,  v91);
              }
            }

            id v22 = [v20 countByEnumeratingWithState:&v106 objects:v124 count:16];
          }

          while (v22);
        }

        else
        {
          char v24 = 1;
        }

        __int128 v104 = 0u;
        __int128 v105 = 0u;
        __int128 v102 = 0u;
        __int128 v103 = 0u;
        v31 = (void *)objc_claimAutoreleasedReturnValue([v89 registrationProperties]);
        v32 = (void *)objc_claimAutoreleasedReturnValue([v31 lackAll]);

        id v33 = [v32 countByEnumeratingWithState:&v102 objects:v123 count:16];
        if (v33)
        {
          id v34 = v33;
          uint64_t v35 = *(void *)v103;
          do
          {
            for (m = 0LL; m != v34; m = (char *)m + 1)
            {
              if (*(void *)v103 != v35) {
                objc_enumerationMutation(v32);
              }
              uint64_t v37 = *(void *)(*((void *)&v102 + 1) + 8LL * (void)m);
              v38 = (void *)objc_claimAutoreleasedReturnValue([v5 capabilities]);
              uint64_t v39 = (uint64_t)[v38 valueForCapability:v37];

              if (v39 >= 1)
              {
                v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog delivery](&OBJC_CLASS___IDSFoundationLog, "delivery"));
                if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
                {
                  v41 = (void *)objc_claimAutoreleasedReturnValue([v89 guid]);
                  *(_DWORD *)buf = 138412802;
                  v126 = v41;
                  __int16 v127 = 2112;
                  v128 = v7;
                  __int16 v129 = 2112;
                  uint64_t v130 = v37;
                  _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "GUID %@ Destination %@ has property %@ we do not want",  buf,  0x20u);
                }

                -[IDSMadridEndpointFilterComponent addTokenURI:forProperty:toRegistrationPropertyToDestinationsMap:]( self,  "addTokenURI:forProperty:toRegistrationPropertyToDestinationsMap:",  v7,  v37,  v91);
                char v24 = 0;
              }
            }

            id v34 = [v32 countByEnumeratingWithState:&v102 objects:v123 count:16];
          }

          while (v34);
        }

        if ((v24 & 1) != 0)
        {
          v42 = v87;
          v43 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v83, "objectForKey:", v87));
          id v3 = v89;
          v44 = v86;
          if (!v43)
          {
            v43 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
            -[NSMutableDictionary setObject:forKey:](v83, "setObject:forKey:", v43, v87);
          }

          v45 = v88;
          if (!-[NSMutableSet count](v43, "count")
            || ([v89 sendOnePerToken] & 1) == 0
            && (-[NSMutableSet containsObject:](v43, "containsObject:", v86) & 1) == 0)
          {
            if (v86) {
              -[NSMutableSet addObject:](v43, "addObject:", v86);
            }
            -[NSMutableArray addObject:](v79, "addObject:", v5);
            v46 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v81, "objectForKey:", v86));
            if (!v46)
            {
              v46 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
              if (v86) {
                -[NSMutableDictionary setObject:forKey:](v81, "setObject:forKey:", v46, v86);
              }
            }

            if (v87) {
              -[NSMutableArray addObject:](v46, "addObject:", v87);
            }
          }
        }

        else
        {
          v45 = v88;
          id v3 = v89;
          v44 = v86;
          v42 = v87;
          if (v7) {
            -[NSMutableArray addObject:](v80, "addObject:", v7);
          }
        }
      }

      id v85 = [obj countByEnumeratingWithState:&v114 objects:v132 count:16];
    }

    while (v85);
  }

  [v3 setEndpoints:v79];
  v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog delivery](&OBJC_CLASS___IDSFoundationLog, "delivery"));
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    v48 = (void *)objc_claimAutoreleasedReturnValue([v3 guid]);
    *(_DWORD *)buf = 138412290;
    v126 = v48;
    _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "GUID %@ finished token filtering", buf, 0xCu);
  }

  v49 = (void *)objc_claimAutoreleasedReturnValue([v3 guid]);
  id v50 = [v49 copy];

  v51 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary debugDescription](v81, "debugDescription"));
  v99[0] = _NSConcreteStackBlock;
  v99[1] = 3221225472LL;
  v99[2] = sub_100316228;
  v99[3] = &unk_1008F5F80;
  id v52 = v50;
  id v100 = v52;
  id v53 = v51;
  id v101 = v53;
  cut_dispatch_log_queue(v99);
  if (-[NSMutableArray count](v80, "count"))
  {
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray debugDescription](v80, "debugDescription"));
    v96[0] = _NSConcreteStackBlock;
    v96[1] = 3221225472LL;
    v96[2] = sub_1003162E0;
    v96[3] = &unk_1008F5F80;
    id v97 = v52;
    id v98 = v54;
    id v55 = v54;
    cut_dispatch_log_queue(v96);
  }

  v56 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v92 = 0u;
  __int128 v93 = 0u;
  __int128 v94 = 0u;
  __int128 v95 = 0u;
  v57 = v79;
  id v58 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v57,  "countByEnumeratingWithState:objects:count:",  &v92,  v122,  16LL);
  if (v58)
  {
    id v59 = v58;
    uint64_t v60 = *(void *)v93;
    do
    {
      for (n = 0LL; n != v59; n = (char *)n + 1)
      {
        if (*(void *)v93 != v60) {
          objc_enumerationMutation(v57);
        }
        v62 = *(void **)(*((void *)&v92 + 1) + 8LL * (void)n);
        v63 = (void *)objc_claimAutoreleasedReturnValue([v62 URI]);
        v64 = (void *)objc_claimAutoreleasedReturnValue([v62 pushTokenObject]);
        v65 = (void *)objc_claimAutoreleasedReturnValue([v63 URIByAddingPushToken:v64]);

        if (v65) {
          -[NSMutableArray addObject:](v56, "addObject:", v65);
        }
      }

      id v59 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v57,  "countByEnumeratingWithState:objects:count:",  &v92,  v122,  16LL);
    }

    while (v59);
  }

  uint64_t v66 = objc_claimAutoreleasedReturnValue([v89 willSendBlock]);
  v67 = (void *)v66;
  if (v66) {
    (*(void (**)(uint64_t, NSMutableArray *, NSMutableArray *, NSMutableDictionary *))(v66 + 16))( v66,  v56,  v80,  v91);
  }
  if (-[NSMutableArray count](v57, "count"))
  {
    v68 = v89;
    v69 = (void *)objc_claimAutoreleasedReturnValue( +[CUTUnsafePromise fulfilledPromiseWithValue:]( &OBJC_CLASS___CUTUnsafePromise,  "fulfilledPromiseWithValue:",  v89));
  }

  else
  {
    id v70 = -[NSMutableArray count](v80, "count");
    v71 = objc_alloc(&OBJC_CLASS___NSError);
    uint64_t v72 = IDSSendErrorDomain;
    if (v70)
    {
      v120 = @"IDSPipelineParameter";
      v121 = v89;
      v73 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v121,  &v120,  1LL));
      v74 = v71;
      uint64_t v75 = v72;
      uint64_t v76 = 28LL;
    }

    else
    {
      v118 = @"IDSPipelineParameter";
      v119 = v89;
      v73 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v119,  &v118,  1LL));
      v74 = v71;
      uint64_t v75 = v72;
      uint64_t v76 = 1LL;
    }

    v77 = -[NSError initWithDomain:code:userInfo:](v74, "initWithDomain:code:userInfo:", v75, v76, v73);

    v69 = (void *)objc_claimAutoreleasedReturnValue( +[CUTUnsafePromise failedPromiseWithError:]( &OBJC_CLASS___CUTUnsafePromise,  "failedPromiseWithError:",  v77));
    v68 = v89;
  }

  return v69;
}

- (void)addTokenURI:(id)a3 forProperty:(id)a4 toRegistrationPropertyToDestinationsMap:(id)a5
{
  id v10 = a3;
  id v7 = a4;
  id v8 = a5;
  v9 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v8 objectForKey:v7]);
  if (!v9)
  {
    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    [v8 setObject:v9 forKey:v7];
  }

  if (v10) {
    -[NSMutableArray addObject:](v9, "addObject:", v10);
  }
}

@end