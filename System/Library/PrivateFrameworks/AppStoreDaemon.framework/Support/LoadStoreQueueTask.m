@interface LoadStoreQueueTask
- (void)main;
@end

@implementation LoadStoreQueueTask

- (void)main
{
  v3 = &_ss28__ContiguousArrayStorageBaseCMa_ptr;
  v4 = -[NSMutableArray initWithObjects:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithObjects:",  &off_10040D300,  0LL);
  presenter = self->_presenter;
  self->_presenter = (RequestPresenter *)v4;

  if ((unint64_t)-[RequestPresenter count](self->_presenter, "count") >= 2)
  {
    v146 = self;
    while (1)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[RequestPresenter objectAtIndexedSubscript:](self->_presenter, "objectAtIndexedSubscript:", 0LL));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[RequestPresenter objectAtIndexedSubscript:](self->_presenter, "objectAtIndexedSubscript:", 1LL));
      id v154 = 0LL;
      id v8 = v7;
      id v9 = v6;
      id v10 = sub_10030A870((uint64_t)self);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      id v145 = v9;
      if (!self->_queueType)
      {
        v12 = objc_alloc(&OBJC_CLASS___LoadStoreQueueRequestEncoder);
        id v13 = sub_100255630((uint64_t)&OBJC_CLASS___URLBag);
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        v15 = -[LoadStoreQueueRequestEncoder initWithBag:](v12, "initWithBag:", v14);
        queueType = (void *)self->_queueType;
        self->_queueType = (int64_t)v15;

        [(id)self->_queueType setAccount:v11];
        [(id)self->_queueType setAnisetteType:1];
        [(id)self->_queueType setRequestEncoding:2];
        v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)&self->super._success description]);
        [(id)self->_queueType setLogUUID:v17];
      }

      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[AMSDevice deviceGUID](&OBJC_CLASS___AMSDevice, "deviceGUID"));
      [v18 setObject:v19 forKeyedSubscript:@"guid"];

      id v20 = sub_10023FD08((uint64_t)&OBJC_CLASS___AMSKeybag, v11, 1LL);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      [v18 setObject:v21 forKeyedSubscript:@"kbsync"];

      v22 = (char *)[v9 unsignedLongLongValue];
      v23 = v9;
      v24 = v22;

      v25 = (char *)[v8 unsignedLongLongValue];
      id v143 = v8;

      if (v24 - 1 < v25)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%llu", v24));
        [v18 setObject:v26 forKeyedSubscript:@"startId"];

        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%llu", v25));
        [v18 setObject:v27 forKeyedSubscript:@"endId"];
      }

      v28 = (void *)self->_queueType;
      logKey = self->_logKey;
      id v30 = sub_100255630((uint64_t)&OBJC_CLASS___URLBag);
      v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
      v32 = v31;
      v33 = logKey ? @"pendingApps" : @"automatic-downloads2/downloads-url";
      v34 = (void *)objc_claimAutoreleasedReturnValue([v31 URLForKey:v33]);

      v35 = (void *)objc_claimAutoreleasedReturnValue([v28 requestWithMethod:4 bagURL:v34 parameters:v18]);
      uint64_t v36 = objc_claimAutoreleasedReturnValue([v35 resultWithError:&v154]);

      id v38 = v154;
      v144 = (void *)v36;
      if (!v36) {
        break;
      }
      v39 = objc_alloc_init(&OBJC_CLASS___RequestEnvironment);
      id v40 = sub_1001F4ADC((uint64_t)&OBJC_CLASS___AMSProcessInfo);
      v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
      v43 = v41;
      v44 = v145;
      if (v39)
      {
        objc_setProperty_atomic_copy(v39, v42, v41, 8LL);

        objc_setProperty_atomic(v39, v45, self->super._error, 32LL);
        objc_setProperty_atomic_copy(v39, v46, *(id *)&self->super._success, 16LL);
      }

      else
      {
      }

      id v47 = sub_1001E636C((uint64_t)&OBJC_CLASS___AMSURLSession);
      v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
      v142 = v39;
      id v49 = sub_1001E66A0(v48, v144, v39);
      v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
      id v153 = v38;
      v51 = (void *)objc_claimAutoreleasedReturnValue([v50 resultWithError:&v153]);
      id v52 = v153;

      if (v51)
      {
        v140 = v51;
        v54 = (void *)objc_claimAutoreleasedReturnValue([v51 object]);
        if (v54)
        {
          v141 = v54;
          id v55 = sub_1002EB678((uint64_t)&OBJC_CLASS___StoreItemResponse, v54, 0);
          v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
          v54 = v141;
          if (v56)
          {
            v58 = v56;
            id v59 = objc_getProperty(v56, v57, 64LL, 1);
            uint64_t v61 = objc_opt_class(&OBJC_CLASS___NSData, v60);
            if ((objc_opt_isKindOfClass(v59, v61) & 1) != 0 && [v59 length]) {
              sub_10023FC04((uint64_t)&OBJC_CLASS___AMSKeybag, v59);
            }
            id v62 = v58;
            id v64 = objc_getProperty(v62, v63, 80LL, 1);

            if (v64)
            {
              v66 = self->_presenter;
              id v67 = objc_getProperty(v62, v65, 80LL, 1);
              -[RequestPresenter addObjectsFromArray:](v66, "addObjectsFromArray:", v67);
            }

            selfa = v62;
            id v68 = objc_getProperty(v62, v65, 56LL, 1);

            if (v68)
            {
              -[Task lock](self, "lock");
              if (!self->_rangesToLoad)
              {
                v69 = objc_opt_new(&OBJC_CLASS___NSMutableOrderedSet);
                rangesToLoad = self->_rangesToLoad;
                self->_rangesToLoad = (NSMutableArray *)v69;
              }

              v147 = (void *)objc_opt_new(v3[492]);
              v71 = (void *)objc_opt_new(v3[492]);
              v72 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
              __int128 v159 = 0u;
              __int128 v160 = 0u;
              __int128 v161 = 0u;
              __int128 v162 = 0u;
              id obj = objc_getProperty(v62, v73, 56LL, 1);
              id v74 = [obj countByEnumeratingWithState:&v159 objects:v173 count:16];
              id v138 = v59;
              v151 = v72;
              if (v74)
              {
                id v76 = v74;
                uint64_t v77 = *(void *)v160;
                v149 = v71;
                id v150 = v52;
                uint64_t v148 = *(void *)v160;
                do
                {
                  v78 = 0LL;
                  do
                  {
                    if (*(void *)v160 != v77) {
                      objc_enumerationMutation(obj);
                    }
                    v79 = *(void **)(*((void *)&v159 + 1) + 8LL * (void)v78);
                    if (v79) {
                      id Property = objc_getProperty(*(id *)(*((void *)&v159 + 1) + 8LL * (void)v78), v75, 208LL, 1);
                    }
                    else {
                      id Property = 0LL;
                    }
                    id v81 = Property;

                    if (!v81)
                    {
                      [v71 addObject:v79];
                      goto LABEL_63;
                    }

                    if (v79) {
                      id v83 = objc_getProperty(v79, v82, 208LL, 1);
                    }
                    else {
                      id v83 = 0LL;
                    }
                    id v84 = v83;
                    v85 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v72,  "objectForKeyedSubscript:",  v84));

                    if (v85)
                    {
                      id v88 = objc_getProperty(v85, v86, 144LL, 1);
                      if (v79)
                      {
                        id v89 = objc_getProperty(v79, v87, 144LL, 1);
                        v90 = v89;
                        if (v89 && [v89 compare:v88] == (id)1)
                        {
                          uint64_t v91 = ASDLogHandleForCategory(25LL);
                          v92 = (os_log_s *)objc_claimAutoreleasedReturnValue(v91);
                          if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
                          {
                            id v94 = objc_getProperty(v79, v93, 208LL, 1);
                            id v96 = objc_getProperty(v79, v95, 96LL, 1);
                            *(_DWORD *)buf = 138544130;
                            id v166 = v94;
                            __int16 v167 = 2114;
                            id v168 = v96;
                            __int16 v169 = 2114;
                            id v170 = v90;
                            __int16 v171 = 2114;
                            id v172 = v88;
                            _os_log_impl( (void *)&_mh_execute_header,  v92,  OS_LOG_TYPE_DEFAULT,  "Queue check found duplicate items in the queue for %{public}@ (%{public}@). Choosing %{pub lic}@ over %{public}@.",  buf,  0x2Au);

                            id v52 = v150;
                            v72 = v151;
                          }

                          id v98 = objc_getProperty(v79, v97, 208LL, 1);
                          -[NSMutableDictionary setObject:forKeyedSubscript:]( v72,  "setObject:forKeyedSubscript:",  v79,  v98);

                          id v99 = v85;
                          goto LABEL_54;
                        }
                      }

                      else
                      {
                        v90 = 0LL;
                      }

                      uint64_t v102 = ASDLogHandleForCategory(25LL);
                      v103 = (os_log_s *)objc_claimAutoreleasedReturnValue(v102);
                      if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
                      {
                        if (v79)
                        {
                          id v105 = objc_getProperty(v79, v104, 208LL, 1);
                          id v107 = objc_getProperty(v79, v106, 96LL, 1);
                          v108 = v105;
                        }

                        else
                        {
                          id v105 = 0LL;
                          v108 = 0LL;
                          id v107 = 0LL;
                        }

                        id v109 = v107;
                        *(_DWORD *)buf = 138544130;
                        id v166 = v105;
                        __int16 v167 = 2114;
                        id v168 = v109;
                        __int16 v169 = 2114;
                        id v170 = v88;
                        __int16 v171 = 2114;
                        id v172 = v90;
                        _os_log_impl( (void *)&_mh_execute_header,  v103,  OS_LOG_TYPE_DEFAULT,  "Queue check found duplicate items in the queue for %{public}@ (%{public}@). Choosing %{public} @ over %{public}@.",  buf,  0x2Au);

                        id v52 = v150;
                        v72 = v151;
                      }

                      id v99 = v79;
                      if (v79)
                      {
LABEL_54:
                        v110 = v99;
                        id v111 = objc_getProperty(v99, v100, 120LL, 1);
                        char v112 = 0;
                      }

                      else
                      {
                        v110 = 0LL;
                        id v111 = 0LL;
                        char v112 = 1;
                      }

                      id v113 = v111;

                      if (v113)
                      {
                        v114 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
                        id v115 = sub_10030A870((uint64_t)v146);
                        v116 = (void *)objc_claimAutoreleasedReturnValue(v115);
                        v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "ams_DSID"));
                        -[NSMutableDictionary setObject:forKeyedSubscript:]( v114,  "setObject:forKeyedSubscript:",  v117,  @"account_id");

                        if ((v112 & 1) != 0)
                        {
                          -[NSMutableDictionary setObject:forKeyedSubscript:]( v114,  "setObject:forKeyedSubscript:",  0LL,  @"item_id");
                          id v121 = 0LL;
                        }

                        else
                        {
                          id v119 = objc_getProperty(v110, v118, 208LL, 1);
                          -[NSMutableDictionary setObject:forKeyedSubscript:]( v114,  "setObject:forKeyedSubscript:",  v119,  @"item_id");

                          id v121 = objc_getProperty(v110, v120, 120LL, 1);
                        }

                        id v122 = v121;
                        -[NSMutableDictionary setObject:forKeyedSubscript:]( v114,  "setObject:forKeyedSubscript:",  v122,  @"request_url");

                        id v52 = v150;
                        if ((v112 & 1) != 0) {
                          id v124 = 0LL;
                        }
                        else {
                          id v124 = objc_getProperty(v110, v123, 304LL, 1);
                        }
                        id v125 = v124;
                        -[NSMutableDictionary setObject:forKeyedSubscript:]( v114,  "setObject:forKeyedSubscript:",  v125,  @"transaction_id");

                        [v147 addObject:v114];
                        v72 = v151;
                      }

                      uint64_t v77 = v148;
                      v71 = v149;
                      goto LABEL_62;
                    }

                    if (v79) {
                      id v101 = objc_getProperty(v79, v86, 208LL, 1);
                    }
                    else {
                      id v101 = 0LL;
                    }
                    id v88 = v101;
                    -[NSMutableDictionary setObject:forKeyedSubscript:](v72, "setObject:forKeyedSubscript:", v79, v88);
LABEL_62:

LABEL_63:
                    v78 = (char *)v78 + 1;
                  }

                  while (v76 != v78);
                  id v126 = [obj countByEnumeratingWithState:&v159 objects:v173 count:16];
                  id v76 = v126;
                }

                while (v126);
              }

              __int128 v157 = 0u;
              __int128 v158 = 0u;
              __int128 v155 = 0u;
              __int128 v156 = 0u;
              v127 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v72, "allValues"));
              id v128 = [v127 countByEnumeratingWithState:&v155 objects:buf count:16];
              self = v146;
              if (v128)
              {
                id v129 = v128;
                uint64_t v130 = *(void *)v156;
                do
                {
                  for (i = 0LL; i != v129; i = (char *)i + 1)
                  {
                    if (*(void *)v156 != v130) {
                      objc_enumerationMutation(v127);
                    }
                    [v71 addObject:*(void *)(*((void *)&v155 + 1) + 8 * (void)i)];
                  }

                  id v129 = [v127 countByEnumeratingWithState:&v155 objects:buf count:16];
                }

                while (v129);
              }

              -[NSMutableArray addObjectsFromArray:](v146->_rangesToLoad, "addObjectsFromArray:", v71);
              -[Task unlock](v146, "unlock");
              id v132 = v147;
              if ([v132 count])
              {
                id v133 = sub_1002EEBC0((uint64_t)&OBJC_CLASS___AppInstallsDatabaseStore);
                v134 = (void *)objc_claimAutoreleasedReturnValue(v133);
                v163[0] = _NSConcreteStackBlock;
                v163[1] = 3221225472LL;
                v163[2] = sub_10030A8DC;
                v163[3] = &unk_1003EA9D8;
                id v164 = v132;
                [v134 modifyUsingTransaction:v163];
              }

              v3 = &_ss28__ContiguousArrayStorageBaseCMa_ptr;
              v44 = v145;
              id v59 = v138;
            }

            v54 = v141;
          }
        }

        v51 = v140;
      }

      else
      {
        objc_setProperty_atomic_copy(self, v53, v52, 32LL);
      }

      v135 = self->_presenter;
      v136 = v143;
      if (!v51) {
        goto LABEL_87;
      }
      -[RequestPresenter removeObjectsInRange:](v135, "removeObjectsInRange:", 0LL, 2LL);
      LOBYTE(self->super._keepAlive) = -[RequestPresenter count](self->_presenter, "count") == 0LL;
LABEL_88:
    }

    objc_setProperty_atomic_copy(self, v37, v38, 32LL);

    v135 = self->_presenter;
    v136 = v143;
    v44 = v145;
LABEL_87:
    -[RequestPresenter removeAllObjects](v135, "removeAllObjects");
    goto LABEL_88;
  }

- (void).cxx_destruct
{
}

@end