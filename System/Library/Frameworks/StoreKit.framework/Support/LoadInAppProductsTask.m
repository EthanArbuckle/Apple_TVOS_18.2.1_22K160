@interface LoadInAppProductsTask
- (LoadInAppProductsTask)initWithProductIdentifiers:(id)a3 client:(id)a4 apiVersion:(int64_t)a5;
- (LoadInAppProductsTask)initWithSubscriptionGroupIdentifiers:(id)a3 client:(id)a4;
- (NSArray)identifiers;
- (NSArray)invalidIdentifiers;
- (NSArray)products;
- (NSString)serverCorrelationIdentifier;
- (_TtC9storekitd6Client)client;
- (char)_clientType;
- (id)_buildMediaAPIURLWith:(id)a3 error:(id *)a4;
- (id)_localeIdentifier;
- (id)_mediaAPIFetchWith:(id)a3 error:(id *)a4;
- (id)_mediaClientIdentifier;
- (id)_mediaPlatformString;
- (id)_newProductIdentifierAllowedCharacterSet;
- (id)_parseLegacyToMedia:(id)a3;
- (id)_parseMediaProducts:(id)a3;
- (id)_parseResponse:(id)a3 error:(id *)a4;
- (id)_processIdentifiers;
- (id)_productIdentifierAllowedCharacterSet;
- (id)_queryDictionary;
- (id)_requestBatches:(id)a3 error:(id *)a4;
- (int64_t)apiVersion;
- (int64_t)identifierKind;
- (void)main;
@end

@implementation LoadInAppProductsTask

- (LoadInAppProductsTask)initWithProductIdentifiers:(id)a3 client:(id)a4 apiVersion:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___LoadInAppProductsTask;
  v11 = -[Task init](&v16, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)(v11 + 50), a4);
    objc_storeStrong((id *)(v12 + 58), a3);
    *(void *)(v12 + 66) = 0LL;
    *(void *)(v12 + 74) = a5;
    uint64_t v13 = objc_claimAutoreleasedReturnValue(+[NSUUID lib_shortLogKeyWithAPIVersion:](&OBJC_CLASS___NSUUID, "lib_shortLogKeyWithAPIVersion:", a5));
    v14 = *(void **)(v12 + 42);
    *(void *)(v12 + 42) = v13;
  }

  return (LoadInAppProductsTask *)v12;
}

- (LoadInAppProductsTask)initWithSubscriptionGroupIdentifiers:(id)a3 client:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___LoadInAppProductsTask;
  id v9 = -[Task init](&v14, "init");
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)(v9 + 50), a4);
    objc_storeStrong((id *)(v10 + 58), a3);
    *(void *)(v10 + 66) = 1LL;
    *(void *)(v10 + 74) = 2LL;
    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSUUID lib_shortLogKeyWithAPIVersion:](&OBJC_CLASS___NSUUID, "lib_shortLogKeyWithAPIVersion:", 2LL));
    v12 = *(void **)(v10 + 42);
    *(void *)(v10 + 42) = v11;
  }

  return (LoadInAppProductsTask *)v10;
}

- (void)main
{
  if (qword_10032EC98 != -1) {
    dispatch_once(&qword_10032EC98, &stru_1002E9BD8);
  }
  v3 = (void *)qword_10032EC60;
  if (os_log_type_enabled((os_log_t)qword_10032EC60, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(LoadInAppProductsTask **)(&self->super.super._success + 2);
    v5 = v3;
    *(_DWORD *)buf = 138543618;
    v91 = v4;
    __int16 v92 = 2114;
    id v93 = (id)objc_opt_class(self);
    id v6 = v93;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] [%{public}@]: Started task",  buf,  0x16u);
  }

  os_log_t v7 = (os_log_t)objc_claimAutoreleasedReturnValue(-[LoadInAppProductsTask _processIdentifiers](self, "_processIdentifiers"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[LoadInAppProductsTask client](self, "client"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bag]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[BagKey productsBatchLimit](&OBJC_CLASS____TtC9storekitd6BagKey, "productsBatchLimit"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 integerForKey:v10]);

  id v89 = 0LL;
  v12 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue([v11 valueWithError:&v89]);
  id v13 = v89;
  objc_super v14 = v13;
  if (!v12 && ASDErrorIsEqual(v13, AMSErrorDomain, 204LL))
  {

    v12 = &off_100302888;
    goto LABEL_14;
  }

  if (!v14)
  {
LABEL_14:
    int64_t v19 = -[LoadInAppProductsTask identifierKind](self, "identifierKind");
    if (v19 == 1)
    {
      if (qword_10032EC98 != -1) {
        dispatch_once(&qword_10032EC98, &stru_1002E9BD8);
      }
      v25 = (void *)qword_10032EC60;
      if (!os_log_type_enabled((os_log_t)qword_10032EC60, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_25;
      }
      v21 = v25;
      id v26 = -[os_log_s count](v7, "count");
      v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->super.super._error + 2) requestBundleID]);
      *(_DWORD *)buf = 138543874;
      v91 = self;
      __int16 v92 = 2048;
      id v93 = v26;
      __int16 v94 = 2114;
      id v95 = v23;
      v24 = "%{public}@: Loading %lu subscription groups for %{public}@";
    }

    else
    {
      if (v19) {
        goto LABEL_25;
      }
      if (qword_10032EC98 != -1) {
        dispatch_once(&qword_10032EC98, &stru_1002E9BD8);
      }
      v20 = (void *)qword_10032EC60;
      if (!os_log_type_enabled((os_log_t)qword_10032EC60, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_25;
      }
      v21 = v20;
      id v22 = -[os_log_s count](v7, "count");
      v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->super.super._error + 2) requestBundleID]);
      *(_DWORD *)buf = 138543874;
      v91 = self;
      __int16 v92 = 2048;
      id v93 = v22;
      __int16 v94 = 2114;
      id v95 = v23;
      v24 = "%{public}@: Loading %lu products for %{public}@";
    }

    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v24, buf, 0x20u);

LABEL_25:
    v73 = v11;
    v74 = v9;
    v75 = v12;
    v76 = self;
    v27 = (char *)[v12 integerValue];
    v79 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v28 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
    __int128 v85 = 0u;
    __int128 v86 = 0u;
    __int128 v87 = 0u;
    __int128 v88 = 0u;
    os_log_t log = v7;
    obj = v7;
    id v29 = -[os_log_s countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v85,  v107,  16LL);
    if (v29)
    {
      id v30 = v29;
      v31 = 0LL;
      uint64_t v32 = *(void *)v86;
      do
      {
        for (i = 0LL; i != v30; i = (char *)i + 1)
        {
          if (*(void *)v86 != v32) {
            objc_enumerationMutation(obj);
          }
          v34 = *(void **)(*((void *)&v85 + 1) + 8LL * (void)i);
          if (v31 == v27
            || (id v35 = -[NSMutableString length](v28, "length"),
                (unint64_t)[v34 length] + (void)v35 + 1 >= 0x281))
          {
            -[NSMutableArray addObject:](v79, "addObject:", v28);
            v36 = objc_alloc_init(&OBJC_CLASS___NSMutableString);

            v31 = 0LL;
            v28 = v36;
          }

          id v37 = -[NSMutableString length](v28, "length");
          v38 = @",";
          if (!v37) {
            v38 = &stru_1002FBA48;
          }
          -[NSMutableString appendFormat:](v28, "appendFormat:", @"%@%@", v38, v34);
          ++v31;
        }

        id v30 = -[os_log_s countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v85,  v107,  16LL);
      }

      while (v30);
    }

    v39 = v79;
    if (-[NSMutableString length](v28, "length")) {
      -[NSMutableArray addObject:](v79, "addObject:", v28);
    }
    id v84 = 0LL;
    v40 = v76;
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[LoadInAppProductsTask _requestBatches:error:](v76, "_requestBatches:error:", v79, &v84));
    id obja = v84;
    if (obja)
    {
      if (qword_10032EC98 != -1) {
        dispatch_once(&qword_10032EC98, &stru_1002E9BD8);
      }
      os_log_t v7 = log;
      if (os_log_type_enabled((os_log_t)qword_10032EC60, OS_LOG_TYPE_ERROR)) {
        sub_100262BBC();
      }
      v42 = *(void **)((char *)&v76->_identifierKind + 2);
      *(int64_t *)((char *)&v76->_identifierKind + 2) = (int64_t)&__NSArray0__struct;

      v43 = (void *)objc_claimAutoreleasedReturnValue(-[LoadInAppProductsTask identifiers](v76, "identifiers"));
      v44 = (NSArray *)[v43 copy];
      v45 = *(NSArray **)((char *)&v76->_identifiers + 2);
      *(NSArray **)((char *)&v76->_identifiers + 2) = v44;

      -[AsyncTask completeWithError:](v76, "completeWithError:", obja);
    }

    else
    {
      v46 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
      __int128 v80 = 0u;
      __int128 v81 = 0u;
      __int128 v82 = 0u;
      __int128 v83 = 0u;
      id v70 = v41;
      id v47 = v41;
      id v48 = [v47 countByEnumeratingWithState:&v80 objects:v106 count:16];
      if (v48)
      {
        id v49 = v48;
        uint64_t v50 = *(void *)v81;
        do
        {
          for (j = 0LL; j != v49; j = (char *)j + 1)
          {
            if (*(void *)v81 != v50) {
              objc_enumerationMutation(v47);
            }
            v52 = *(void **)(*((void *)&v80 + 1) + 8LL * (void)j);
            if (*(_TtC9storekitd6Client **)((char *)&v40->_client + 2) == (_TtC9storekitd6Client *)1)
            {
              v53 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v80 + 1) + 8 * (void)j) objectForKeyedSubscript:off_100328138[0]]);
            }

            else
            {
              id v54 = -[LoadInAppProductsTask identifierKind](v40, "identifierKind");
              v55 = (void *)objc_claimAutoreleasedReturnValue([v52 objectForKeyedSubscript:@"attributes"]);
              v56 = v55;
              if (v54 == (id)1) {
                v57 = @"subscriptionFamilyId";
              }
              else {
                v57 = @"offerName";
              }
              v53 = (void *)objc_claimAutoreleasedReturnValue([v55 objectForKeyedSubscript:v57]);

              v40 = v76;
            }

            -[NSMutableSet addObject:](v46, "addObject:", v53);
          }

          id v49 = [v47 countByEnumeratingWithState:&v80 objects:v106 count:16];
        }

        while (v49);
      }

      v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithArray:]( &OBJC_CLASS___NSMutableSet,  "setWithArray:",  *(void *)(&v40->super._finished + 1)));
      [v58 intersectSet:v46];
      v59 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithArray:]( &OBJC_CLASS___NSMutableSet,  "setWithArray:",  *(void *)(&v40->super._finished + 1)));
      [v59 minusSet:v46];
      id v60 = -[NSMutableSet mutableCopy](v46, "mutableCopy");
      v61 = (void *)objc_claimAutoreleasedReturnValue( +[NSSet setWithArray:]( &OBJC_CLASS___NSSet,  "setWithArray:",  *(void *)(&v40->super._finished + 1)));
      [v60 minusSet:v61];

      if (qword_10032EC98 != -1) {
        dispatch_once(&qword_10032EC98, &stru_1002E9BD8);
      }
      os_log_t v7 = log;
      v62 = (void *)qword_10032EC60;
      if (os_log_type_enabled((os_log_t)qword_10032EC60, OS_LOG_TYPE_DEFAULT))
      {
        loga = v62;
        id v69 = [v47 count];
        v63 = v58;
        id v64 = [v59 count];
        id v65 = [v60 count];
        v66 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&v76->super.super._error + 2) requestBundleID]);
        *(_DWORD *)buf = 138545154;
        v91 = v76;
        __int16 v92 = 2048;
        id v93 = v69;
        __int16 v94 = 2048;
        id v95 = v64;
        v58 = v63;
        __int16 v96 = 2048;
        id v97 = v65;
        __int16 v98 = 2114;
        v99 = v66;
        __int16 v100 = 2114;
        v101 = v63;
        __int16 v102 = 2114;
        v103 = v59;
        __int16 v104 = 2114;
        id v105 = v60;
        _os_log_impl( (void *)&_mh_execute_header,  loga,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Received %lu products; %lu invalid identifiers, %lu unknown identifiers for %{public}@\n"
          "Valid identifiers: %{public}@\n"
          "Invalid identifiers: %{public}@\n"
          "Unknown identifiers: %{public}@",
          buf,
          0x52u);
      }

      objc_storeStrong((id *)((char *)&v76->_identifierKind + 2), v70);
      uint64_t v67 = objc_claimAutoreleasedReturnValue([v59 allObjects]);
      v68 = *(NSArray **)((char *)&v76->_identifiers + 2);
      *(NSArray **)((char *)&v76->_identifiers + 2) = (NSArray *)v67;

      -[AsyncTask completeWithSuccess](v76, "completeWithSuccess");
      v41 = v70;

      v12 = v75;
      v39 = v79;
    }

    uint64_t v11 = v73;
    id v9 = v74;
    objc_super v14 = obja;
    goto LABEL_64;
  }

  if (qword_10032EC98 != -1) {
    dispatch_once(&qword_10032EC98, &stru_1002E9BD8);
  }
  if (os_log_type_enabled((os_log_t)qword_10032EC60, OS_LOG_TYPE_ERROR)) {
    sub_100262BBC();
  }
  v15 = *(void **)((char *)&self->_identifierKind + 2);
  *(int64_t *)((char *)&self->_identifierKind + 2) = (int64_t)&__NSArray0__struct;

  objc_super v16 = (void *)objc_claimAutoreleasedReturnValue(-[LoadInAppProductsTask identifiers](self, "identifiers"));
  v17 = (NSArray *)[v16 copy];
  v18 = *(NSArray **)((char *)&self->_identifiers + 2);
  *(NSArray **)((char *)&self->_identifiers + 2) = v17;

  -[AsyncTask completeWithError:](self, "completeWithError:", v14);
LABEL_64:
}

- (char)_clientType
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LoadInAppProductsTask client](self, "client"));
  char v3 = objc_msgSend(v2, "objc_clientType");

  return v3;
}

- (id)_processIdentifiers
{
  char v3 = (void *)objc_claimAutoreleasedReturnValue(-[LoadInAppProductsTask identifiers](self, "identifiers"));
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v3 count]));

  objc_super v16 = (void *)objc_claimAutoreleasedReturnValue( -[LoadInAppProductsTask _productIdentifierAllowedCharacterSet]( self,  "_productIdentifierAllowedCharacterSet"));
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LoadInAppProductsTask identifiers](self, "identifiers"));
  id v5 = [v4 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)v8);
        uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0
          && [v9 length]
          && (unint64_t)[v9 length] < 0x101)
        {
          id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 stringByAddingPercentEncodingWithAllowedCharacters:v16]);
          [v17 addObject:v13];
        }

        else
        {
          if (qword_10032EC98 != -1) {
            dispatch_once(&qword_10032EC98, &stru_1002E9BD8);
          }
          uint64_t v11 = (os_log_s *)qword_10032EC60;
          if (os_log_type_enabled((os_log_t)qword_10032EC60, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v12 = *(void *)(&self->super.super._success + 2);
            *(_DWORD *)buf = 138543618;
            uint64_t v23 = v12;
            __int16 v24 = 2114;
            v25 = v9;
            _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Skipping invalid identifier \"%{public}@\"",  buf,  0x16u);
          }
        }

        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }

    while (v6);
  }

  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue([v17 sortedArrayUsingSelector:"compare:"]);
  return v14;
}

- (id)_productIdentifierAllowedCharacterSet
{
  if ((id)-[LoadInAppProductsTask apiVersion](self, "apiVersion") == (id)1)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10006798C;
    block[3] = &unk_1002E7958;
    block[4] = self;
    if (qword_10032EC40 != -1) {
      dispatch_once(&qword_10032EC40, block);
    }
    char v3 = &qword_10032EC30;
  }

  else
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_1000679B0;
    v5[3] = &unk_1002E7958;
    v5[4] = self;
    if (qword_10032EC48 != -1) {
      dispatch_once(&qword_10032EC48, v5);
    }
    char v3 = &qword_10032EC38;
  }

  return (id)*v3;
}

- (id)_newProductIdentifierAllowedCharacterSet
{
  int64_t v2 = -[LoadInAppProductsTask apiVersion](self, "apiVersion");
  char v3 = @"?&=,";
  if (v2 != 2) {
    char v3 = 0LL;
  }
  if (v2 == 1) {
    v4 = @"?&=";
  }
  else {
    v4 = v3;
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet URLQueryAllowedCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "URLQueryAllowedCharacterSet"));
  id v6 = [v5 mutableCopy];

  [v6 removeCharactersInString:v4];
  return v6;
}

- (id)_buildMediaAPIURLWith:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[LoadInAppProductsTask client](self, "client"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 bag]);

  if (-[LoadInAppProductsTask _clientType](self, "_clientType") == 1)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[BagKey mediaAPIHost](&OBJC_CLASS____TtC9storekitd6BagKey, "mediaAPIHost"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 URLForKey:v9]);
    uint64_t v11 = v10;
    uint64_t v50 = 0LL;
    uint64_t v12 = (id *)&v50;
    id v13 = &v50;
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[BagKey mediaAPISandboxHost](&OBJC_CLASS____TtC9storekitd6BagKey, "mediaAPISandboxHost"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 URLForKey:v9]);
    uint64_t v11 = v10;
    uint64_t v49 = 0LL;
    uint64_t v12 = (id *)&v49;
    id v13 = &v49;
  }

  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue([v10 valueWithError:v13]);
  id v15 = *v12;

  if (v15)
  {
    if (a4)
    {
      id v15 = v15;
      objc_super v16 = 0LL;
      *a4 = v15;
    }

    else
    {
      objc_super v16 = 0LL;
    }
  }

  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[BagKey countryCode](&OBJC_CLASS____TtC9storekitd6BagKey, "countryCode"));
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v8 stringForKey:v17]);
    id v48 = 0LL;
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 valueWithError:&v48]);
    id v15 = v48;

    if (v15)
    {
      if (a4)
      {
        id v15 = v15;
        objc_super v16 = 0LL;
        *a4 = v15;
      }

      else
      {
        objc_super v16 = 0LL;
      }
    }

    else
    {
      __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(+[BagKey languageTag](&OBJC_CLASS____TtC9storekitd6BagKey, "languageTag"));
      __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v8 stringForKey:v20]);
      id v47 = 0LL;
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 valueWithError:&v47]);
      id v15 = v47;

      if (v15)
      {
        objc_super v16 = 0LL;
        if (a4) {
          *a4 = v15;
        }
      }

      else
      {
        unsigned int v23 = -[LoadInAppProductsTask _clientType](self, "_clientType");
        __int16 v24 = @"https://";
        if (v23 == 3) {
          __int16 v24 = @"http://";
        }
        v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@/v1/catalog/%@/in-apps",  v24,  v14,  v19));
        objc_super v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLComponents componentsWithString:]( &OBJC_CLASS___NSURLComponents,  "componentsWithString:",  v45));
        uint64_t v25 = objc_claimAutoreleasedReturnValue(-[LoadInAppProductsTask _mediaPlatformString](self, "_mediaPlatformString"));
        v42 = (void *)v25;
        int64_t v26 = -[LoadInAppProductsTask apiVersion](self, "apiVersion");
        v27 = @"kind";
        if (v26 == 1) {
          v27 = @"hostedContent";
        }
        v38 = v27;
        int64_t v28 = -[LoadInAppProductsTask identifierKind](self, "identifierKind");
        int64_t v29 = -[LoadInAppProductsTask identifierKind](self, "identifierKind");
        if (v28 == 1 || v29 == 1) {
          v31 = @"filter[subscriptionFamilyId]";
        }
        else {
          v31 = @"filter[offerName]";
        }
        v46 = v22;
        v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  v31,  v6));
        v51[0] = v44;
        v43 = (void *)objc_claimAutoreleasedReturnValue(-[LoadInAppProductsTask client](self, "client"));
        v41 = (void *)objc_claimAutoreleasedReturnValue([v43 requestBundleID]);
        v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  @"filter[appBundleId]",  v41));
        v51[1] = v40;
        v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  @"platform",  v25));
        v51[2] = v39;
        id v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  @"l",  v22));
        v51[3] = v37;
        uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  @"extend",  v38));
        v51[4] = v32;
        v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  @"with",  @"adHocOffers"));
        v51[5] = v33;
        v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  @"omit[resource]",  @"autos"));
        v51[6] = v34;
        id v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v51, 7LL));
        [v16 setQueryItems:v35];

        id v22 = v46;
      }
    }
  }

  return v16;
}

- (id)_localeIdentifier
{
  char v3 = (void *)objc_claimAutoreleasedReturnValue(-[LoadInAppProductsTask client](self, "client"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 bag]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[BagKey languageTag](&OBJC_CLASS____TtC9storekitd6BagKey, "languageTag"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 stringForKey:v5]);
  id v22 = 0LL;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 valueWithError:&v22]);
  id v8 = v22;

  if (v8)
  {
    if (qword_10032EC98 != -1) {
      dispatch_once(&qword_10032EC98, &stru_1002E9BD8);
    }
    if (os_log_type_enabled((os_log_t)qword_10032EC60, OS_LOG_TYPE_ERROR)) {
      sub_100262C94();
    }
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 componentsSeparatedByString:@"-"]);
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 firstObject]);

    uint64_t v7 = (void *)v10;
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[BagKey countryCode](&OBJC_CLASS____TtC9storekitd6BagKey, "countryCode"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v4 stringForKey:v11]);
  id v21 = v8;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 valueWithError:&v21]);
  id v14 = v21;

  if (!v14) {
    goto LABEL_11;
  }
  if (qword_10032EC98 != -1) {
    dispatch_once(&qword_10032EC98, &stru_1002E9BD8);
  }
  if (os_log_type_enabled((os_log_t)qword_10032EC60, OS_LOG_TYPE_ERROR))
  {
    sub_100262C28();
    if (!v7) {
      goto LABEL_15;
    }
  }

  else
  {
LABEL_11:
    if (!v7) {
      goto LABEL_15;
    }
  }

  if (v13)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 uppercaseString]);
    objc_super v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@_%@", v7, v15));

    goto LABEL_19;
  }

- (id)_mediaPlatformString
{
  return +[AMSDevice sk_defaultMediaAPIPlatform](&OBJC_CLASS___AMSDevice, "sk_defaultMediaAPIPlatform");
}

- (id)_mediaClientIdentifier
{
  unsigned int v2 = -[LoadInAppProductsTask _clientType](self, "_clientType");
  char v3 = @"com.apple.storekit.prod";
  if (v2 == 2) {
    char v3 = @"com.apple.storekit.sandbox";
  }
  if (v2 == 3) {
    return @"com.apple.storekit.xcode";
  }
  else {
    return (id)v3;
  }
}

- (id)_mediaAPIFetchWith:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc(&OBJC_CLASS___AMSMediaTokenService);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[LoadInAppProductsTask _mediaClientIdentifier](self, "_mediaClientIdentifier"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[LoadInAppProductsTask client](self, "client"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 bag]);
  id v11 = [v7 initWithClientIdentifier:v8 bag:v10];

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[LoadInAppProductsTask client](self, "client"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 processInfo]);
  [v11 setClientInfo:v13];

  id v14 = objc_alloc(&OBJC_CLASS___AMSMediaRequestEncoder);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[LoadInAppProductsTask client](self, "client"));
  objc_super v16 = (void *)objc_claimAutoreleasedReturnValue([v15 bag]);
  id v17 = [v14 initWithTokenService:v11 bag:v16];

  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(-[LoadInAppProductsTask client](self, "client"));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 processInfo]);
  [v17 setClientInfo:v19];

  [v17 setLogKey:*(void *)(&self->super.super._success + 2)];
  id v20 = [[AMSMediaProtocolHandler alloc] initWithTokenService:v11];
  id v21 = (void *)objc_opt_new(&OBJC_CLASS___AMSMediaResponseDecoder);
  id v22 = (void *)objc_claimAutoreleasedReturnValue(-[LoadInAppProductsTask client](self, "client"));
  unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue([v22 urlSession]);

  [v23 setProtocolHandler:v20];
  [v23 setResponseDecoder:v21];
  [v11 setSession:v23];
  id v47 = 0LL;
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[LoadInAppProductsTask _buildMediaAPIURLWith:error:](self, "_buildMediaAPIURLWith:error:", v6, &v47));

  id v25 = v47;
  if (!v25)
  {
    v43 = a4;
    v44 = v24;
    int64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v17 requestWithComponents:v24]);
    id v46 = 0LL;
    int64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v28 resultWithTimeout:&v46 error:60.0]);
    id v26 = v46;
    id v30 = [v29 mutableCopy];

    if (v26)
    {
      if (qword_10032EC98 != -1) {
        dispatch_once(&qword_10032EC98, &stru_1002E9BD8);
      }
      if (os_log_type_enabled((os_log_t)qword_10032EC60, OS_LOG_TYPE_ERROR))
      {
        sub_100262D64();
        if (!v43) {
          goto LABEL_14;
        }
      }

      else if (!v43)
      {
LABEL_14:
        v27 = &__NSArray0__struct;
LABEL_33:

        uint64_t v24 = v44;
        goto LABEL_34;
      }

      id v26 = v26;
      id *v43 = v26;
      goto LABEL_14;
    }

    v31 = sub_100026E88(-[LoadInAppProductsTask apiVersion](self, "apiVersion"));
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    [v30 setValue:v32 forHTTPHeaderField:@"X-Apple-Client-StoreKit-Version"];

    v33 = (void *)objc_claimAutoreleasedReturnValue([v23 dataTaskPromiseWithRequest:v30]);
    id v45 = 0LL;
    v34 = (void *)objc_claimAutoreleasedReturnValue([v33 resultWithTimeout:&v45 error:60.0]);
    id v26 = v45;

    int64_t v35 = objc_claimAutoreleasedReturnValue([v34 responseCorrelationId]);
    v36 = *(void **)((char *)&self->_apiVersion + 2);
    *(int64_t *)((char *)&self->_apiVersion + 2) = v35;

    id v37 = (void *)objc_claimAutoreleasedReturnValue([v34 object]);
    v38 = (void *)objc_claimAutoreleasedReturnValue([v37 objectForKeyedSubscript:@"data"]);

    if (v38)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue([v37 objectForKeyedSubscript:@"data"]);
LABEL_32:

      goto LABEL_33;
    }

    if (!v26)
    {
      if (v37)
      {
        v39 = @"Products not found in media api response";
        uint64_t v40 = 513LL;
      }

      else
      {
        v39 = @"Empty media api response";
        uint64_t v40 = 507LL;
      }

      uint64_t v41 = ASDErrorWithTitleAndMessage(ASDErrorDomain, v40, @"Error decoding response", v39);
      id v26 = (id)objc_claimAutoreleasedReturnValue(v41);
    }

    if (qword_10032EC98 != -1) {
      dispatch_once(&qword_10032EC98, &stru_1002E9BD8);
    }
    if (os_log_type_enabled((os_log_t)qword_10032EC60, OS_LOG_TYPE_ERROR))
    {
      sub_100262D00();
      if (!v43) {
        goto LABEL_31;
      }
    }

    else if (!v43)
    {
LABEL_31:
      v27 = &__NSArray0__struct;
      goto LABEL_32;
    }

    id v26 = v26;
    id *v43 = v26;
    goto LABEL_31;
  }

  id v26 = v25;
  if (qword_10032EC98 != -1) {
    dispatch_once(&qword_10032EC98, &stru_1002E9BD8);
  }
  if (os_log_type_enabled((os_log_t)qword_10032EC60, OS_LOG_TYPE_ERROR))
  {
    sub_100262DC8();
    if (!a4) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }

  if (a4)
  {
LABEL_6:
    id v26 = v26;
    *a4 = v26;
  }

- (id)_queryDictionary
{
  char v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LoadInAppProductsTask client](self, "client"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 requestBundleID]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lib_stringByCopyingUTF8StringWithLength:", 256));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v6, @"bid");

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[LoadInAppProductsTask client](self, "client"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 requestBundleVersion]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lib_stringByCopyingUTF8StringWithLength:", 100));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v9, @"bvrs");

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[LoadInAppProductsTask client](self, "client"));
  id v11 = [v10 storeItemID];

  if (v11)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[LoadInAppProductsTask client](self, "client"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v12 storeItemID]));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 stringValue]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v14, @"appAdamId");
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[LoadInAppProductsTask client](self, "client"));
  id v16 = [v15 storeExternalVersionID];

  if (v16)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[LoadInAppProductsTask client](self, "client"));
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v17 storeExternalVersionID]));
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 stringValue]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v19, @"appExtVrsId");
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale autoupdatingCurrentLocale](&OBJC_CLASS___NSLocale, "autoupdatingCurrentLocale"));
  id v21 = v20;
  if (v20)
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v20 localeIdentifier]);
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v22, @"icuLocale");
  }

  unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue(-[LoadInAppProductsTask client](self, "client"));
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 accountMediaType]);

  id v25 = (void *)objc_claimAutoreleasedReturnValue(-[LoadInAppProductsTask client](self, "client"));
  id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 account]);
  v27 = v26;
  if (v26)
  {
    id v28 = v26;
  }

  else
  {
    int64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[ACAccountStore ams_sharedAccountStoreForMediaType:]( &OBJC_CLASS___ACAccountStore,  "ams_sharedAccountStoreForMediaType:",  v24));
    id v28 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "ams_localiTunesAccount"));
  }

  id v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "ams_storefrontForMediaType:", v24));
  if (v30)
  {
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v30, @"sfId");
  }

  else
  {
    if (qword_10032EC98 != -1) {
      dispatch_once(&qword_10032EC98, &stru_1002E9BD8);
    }
    v31 = (void *)qword_10032EC60;
    if (os_log_type_enabled((os_log_t)qword_10032EC60, OS_LOG_TYPE_ERROR)) {
      sub_100262E2C((uint64_t)self, v31);
    }
  }

  return v3;
}

- (id)_requestBatches:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[LoadInAppProductsTask client](self, "client"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 bag]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[LoadInAppProductsTask client](self, "client"));
  uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue([v9 urlRequestEncoder]);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[LoadInAppProductsTask client](self, "client"));
  id v46 = (void *)objc_claimAutoreleasedReturnValue([v10 urlSession]);

  id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v52 = self;
  if (*(_TtC9storekitd6Client **)((char *)&self->_client + 2) != (_TtC9storekitd6Client *)2)
  {
    int64_t v12 = -[LoadInAppProductsTask identifierKind](self, "identifierKind");
    if (*(_TtC9storekitd6Client **)((char *)&self->_client + 2) == (_TtC9storekitd6Client *)1)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[BagKey legacyClientMediaAPIRate]( &OBJC_CLASS____TtC9storekitd6BagKey,  "legacyClientMediaAPIRate"));
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 integerForKey:v13]);
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 valueWithError:0]);

      if (v15)
      {
        [v15 doubleValue];
        double v17 = v16;
      }

      else
      {
        double v17 = 0.0;
      }

      double v19 = (double)arc4random_uniform(0x7FFFFFFFu);
      if (qword_10032EC98 != -1) {
        dispatch_once(&qword_10032EC98, &stru_1002E9BD8);
      }
      id v20 = (os_log_s *)qword_10032EC60;
      double v21 = v19 / 2147483650.0;
      if (os_log_type_enabled((os_log_t)qword_10032EC60, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = *(void *)(&v52->super.super._success + 2);
        *(_DWORD *)buf = 138544130;
        uint64_t v64 = v22;
        if (v21 >= v17) {
          unsigned int v23 = @"NO";
        }
        else {
          unsigned int v23 = @"YES";
        }
        __int16 v65 = 2114;
        v66 = v23;
        __int16 v67 = 2050;
        double v68 = v17;
        __int16 v69 = 2050;
        double v70 = v21;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Using Media API for legacy products request: %{public}@ (Rate: %{public}f, Rolled: %{public}f)",  buf,  0x2Au);
      }

      if (v21 < v17) {
        goto LABEL_18;
      }
LABEL_8:
      uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(-[LoadInAppProductsTask _queryDictionary](v52, "_queryDictionary"));
      int v18 = 0;
      goto LABEL_19;
    }

    if (v12 != 1) {
      goto LABEL_8;
    }
  }

  if (os_variant_has_internal_content("com.apple.storekitd")
    && +[AppDefaultsManager alwaysUseLegacyAPIForStoreKitProductsRequest]( &OBJC_CLASS___AppDefaultsManager,  "alwaysUseLegacyAPIForStoreKitProductsRequest"))
  {
    goto LABEL_8;
  }

- (id)_parseResponse:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 object]);
  id v7 = &_ss13OpaquePointerV16debugDescriptionSSvg_ptr;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) == 0)
  {
    if (qword_10032EC98 != -1) {
      dispatch_once(&qword_10032EC98, &stru_1002E9BD8);
    }
    __int128 v61 = (void *)qword_10032EC60;
    if (os_log_type_enabled((os_log_t)qword_10032EC60, OS_LOG_TYPE_ERROR))
    {
      sub_100262EF0((uint64_t)self, v61, (uint64_t)v5);
      if (a4) {
        goto LABEL_51;
      }
    }

    else if (a4)
    {
LABEL_51:
      uint64_t v62 = ASDErrorWithTitleAndMessage( ASDErrorDomain,  507LL,  @"Error decoding object",  @"Attempted to decode store response");
      __int16 v69 = 0LL;
      *a4 = (id)objc_claimAutoreleasedReturnValue(v62);
      goto LABEL_54;
    }

    __int16 v69 = 0LL;
    goto LABEL_54;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"available-subproducts"]);
  __int16 v69 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v9 count]);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) == 0) {
    goto LABEL_46;
  }
  __int16 v65 = v6;
  id v66 = v5;
  __int128 v86 = 0u;
  __int128 v87 = 0u;
  __int128 v84 = 0u;
  __int128 v85 = 0u;
  uint64_t v64 = v9;
  id obj = v9;
  id v11 = [obj countByEnumeratingWithState:&v84 objects:v95 count:16];
  if (!v11) {
    goto LABEL_45;
  }
  id v12 = v11;
  uint64_t v13 = *(void *)v85;
  uint64_t v67 = *(void *)v85;
  do
  {
    id v14 = 0LL;
    id v70 = v12;
    do
    {
      if (*(void *)v85 != v13) {
        objc_enumerationMutation(obj);
      }
      id v15 = *(void **)(*((void *)&v84 + 1) + 8LL * (void)v14);
      double v16 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      uint64_t v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "tcr_stringForKey:", @"offerName"));
      if (v17)
      {
        int v18 = (void *)v17;
        v76 = v14;
        -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v17, off_100328138[0]);
        double v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "tcr_stringForKey:", @"icu-locale"));

        if (v19)
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v19, @"loc");
          id v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "tcr_stringForKey:", @"description"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v20, @"desc");

          double v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "tcr_stringForKey:", @"title"));
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v16,  "setObject:forKeyedSubscript:",  v21,  off_100327FA8[0]);

          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  objc_msgSend(v15, "tcr_BOOLForKey:", @"is-hosted")));
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v16,  "setObject:forKeyedSubscript:",  v22,  off_100327F88[0]);

          unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  objc_msgSend(v15, "tcr_BOOLForKey:", @"isFamilyShareable")));
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v16,  "setObject:forKeyedSubscript:",  v23,  off_100327F80[0]);

          id v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "tcr_stringForKey:", @"version"));
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v16,  "setObject:forKeyedSubscript:",  v24,  @"hosted-version");

          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "tcr_stringForKey:", @"subscriptionFamilyId"));
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v16,  "setObject:forKeyedSubscript:",  v25,  off_100328080[0]);

          id v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "tcr_stringForKey:", @"recurringSubscriptionPeriod"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v26, @"per");

          uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "tcr_dictionaryForKey:", @"store-offers"));
          v73 = v27;
          if (v27)
          {
            id v28 = v27;
            id v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "tcr_dictionaryForKey:", @"STDQ"));
            if (v29)
            {
              v74 = v15;
              uint64_t v30 = v29;
              uint64_t v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "tcr_numberForKey:", @"price"));

              if (!v31)
              {
                v75 = v30;
                if (qword_10032EC98 != -1) {
                  dispatch_once(&qword_10032EC98, &stru_1002E9BD8);
                }
                id v14 = v76;
                id v57 = (void *)qword_10032EC60;
                if (os_log_type_enabled((os_log_t)qword_10032EC60, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v79 = *(void *)(&self->super.super._success + 2);
                  __int128 v58 = v57;
                  id v28 = v73;
                  uint64_t v59 = objc_opt_class(self);
                  *(_DWORD *)buf = 138543874;
                  uint64_t v90 = v79;
                  __int16 v91 = 2114;
                  uint64_t v92 = v59;
                  __int16 v93 = 2114;
                  uint64_t v94 = 0LL;
                  _os_log_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] %{public}@: Received invalid price %{public}@ in product dictionary",  buf,  0x20u);
                }

                goto LABEL_37;
              }

              -[NSMutableDictionary setObject:forKeyedSubscript:]( v16,  "setObject:forKeyedSubscript:",  v31,  @"pri");
              id v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "tcr_numberForKey:", @"size"));
              -[NSMutableDictionary setObject:forKeyedSubscript:]( v16,  "setObject:forKeyedSubscript:",  v32,  @"hosted-content-length");

              double v19 = (void *)v31;
              id v29 = v30;
              id v15 = v74;
            }

            v72 = v16;
          }

          else
          {
            v72 = v16;
          }

          v75 = v19;
          uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "tcr_arrayForKey:", @"discounts"));
          uint64_t v41 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v40 count]);
          __int128 v80 = 0u;
          __int128 v81 = 0u;
          __int128 v82 = 0u;
          __int128 v83 = 0u;
          id v42 = v40;
          id v43 = [v42 countByEnumeratingWithState:&v80 objects:v88 count:16];
          if (v43)
          {
            id v44 = v43;
            uint64_t v45 = *(void *)v81;
            do
            {
              for (i = 0LL; i != v44; i = (char *)i + 1)
              {
                if (*(void *)v81 != v45) {
                  objc_enumerationMutation(v42);
                }
                uint64_t v47 = *(void **)(*((void *)&v80 + 1) + 8LL * (void)i);
                uint64_t v48 = objc_opt_class(v7[337]);
                if ((objc_opt_isKindOfClass(v47, v48) & 1) != 0)
                {
                  uint64_t v49 = v7;
                  uint64_t v50 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
                  v51 = (void *)objc_claimAutoreleasedReturnValue([v47 objectForKeyedSubscript:@"price"]);
                  -[NSMutableDictionary setObject:forKeyedSubscript:]( v50,  "setObject:forKeyedSubscript:",  v51,  @"pri");

                  v52 = (void *)objc_claimAutoreleasedReturnValue([v47 objectForKeyedSubscript:@"recurringSubscriptionPeriod"]);
                  -[NSMutableDictionary setObject:forKeyedSubscript:]( v50,  "setObject:forKeyedSubscript:",  v52,  @"per");

                  id v53 = (void *)objc_claimAutoreleasedReturnValue([v47 objectForKeyedSubscript:@"numOfPeriods"]);
                  -[NSMutableDictionary setObject:forKeyedSubscript:]( v50,  "setObject:forKeyedSubscript:",  v53,  @"per-count");

                  id v54 = (void *)objc_claimAutoreleasedReturnValue([v47 objectForKeyedSubscript:@"modeType"]);
                  -[NSMutableDictionary setObject:forKeyedSubscript:]( v50,  "setObject:forKeyedSubscript:",  v54,  @"mod");

                  id v55 = (void *)objc_claimAutoreleasedReturnValue([v47 objectForKeyedSubscript:@"type"]);
                  -[NSMutableDictionary setObject:forKeyedSubscript:]( v50,  "setObject:forKeyedSubscript:",  v55,  off_1003280B8[0]);

                  id v56 = (void *)objc_claimAutoreleasedReturnValue([v47 objectForKeyedSubscript:@"id"]);
                  -[NSMutableDictionary setObject:forKeyedSubscript:]( v50,  "setObject:forKeyedSubscript:",  v56,  off_100327F60[0]);

                  -[NSMutableArray addObject:](v41, "addObject:", v50);
                  id v7 = v49;
                }
              }

              id v44 = [v42 countByEnumeratingWithState:&v80 objects:v88 count:16];
            }

            while (v44);
          }

          double v16 = v72;
          if (-[NSMutableArray count](v41, "count")) {
            -[NSMutableDictionary setObject:forKeyedSubscript:](v72, "setObject:forKeyedSubscript:", v41, @"disc");
          }
          -[NSMutableArray addObject:](v69, "addObject:", v72);

          id v12 = v70;
          uint64_t v13 = v67;
          id v14 = v76;
          id v28 = v73;
LABEL_37:

          goto LABEL_38;
        }

        if (qword_10032EC98 != -1) {
          dispatch_once(&qword_10032EC98, &stru_1002E9BD8);
        }
        id v14 = v76;
        id v38 = (void *)qword_10032EC60;
        if (os_log_type_enabled((os_log_t)qword_10032EC60, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v78 = *(void *)(&self->super.super._success + 2);
          v34 = v38;
          uint64_t v39 = objc_opt_class(self);
          *(_DWORD *)buf = 138543874;
          uint64_t v90 = v78;
          __int16 v91 = 2114;
          uint64_t v92 = v39;
          __int16 v93 = 2114;
          uint64_t v94 = 0LL;
          v36 = v34;
          id v37 = "[%{public}@] %{public}@: Received invalid locale %{public}@ in product dictionary";
          goto LABEL_23;
        }
      }

      else
      {
        if (qword_10032EC98 != -1) {
          dispatch_once(&qword_10032EC98, &stru_1002E9BD8);
        }
        v33 = (void *)qword_10032EC60;
        if (os_log_type_enabled((os_log_t)qword_10032EC60, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v77 = *(void *)(&self->super.super._success + 2);
          v34 = v33;
          uint64_t v35 = objc_opt_class(self);
          *(_DWORD *)buf = 138543874;
          uint64_t v90 = v77;
          __int16 v91 = 2114;
          uint64_t v92 = v35;
          __int16 v93 = 2114;
          uint64_t v94 = 0LL;
          v36 = v34;
          id v37 = "[%{public}@] %{public}@: Received invalid identifier %{public}@ in product dictionary";
LABEL_23:
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, v37, buf, 0x20u);
        }
      }

- (id)_parseMediaProducts:(id)a3
{
  id v4 = a3;
  id v44 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v43 = (void *)objc_claimAutoreleasedReturnValue(-[LoadInAppProductsTask _localeIdentifier](self, "_localeIdentifier"));
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  id obj = v4;
  id v45 = [obj countByEnumeratingWithState:&v58 objects:v63 count:16];
  if (v45)
  {
    uint64_t v42 = *(void *)v59;
    id v5 = &_ss13OpaquePointerV16debugDescriptionSSvg_ptr;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v59 != v42) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v58 + 1) + 8 * v6);
        uint64_t v8 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
        id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tcr_dictionaryForKey:", @"attributes"));
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tcr_stringForKey:", @"offerName"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v10, off_100328138[0]);

        id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tcr_dictionaryForKey:", @"description"));
        id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "tcr_stringForKey:", @"standard"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v12, @"desc");

        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tcr_stringForKey:", @"name"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v13, off_100327FA8[0]);

        id v14 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v5[362],  "numberWithBool:",  objc_msgSend(v9, "tcr_BOOLForKey:missingValue:", @"isFamilyShareable", 0)));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v14, off_100327F80[0]);

        id v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tcr_stringForKey:", @"subscriptionFamilyId"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v15, off_100328080[0]);

        double v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tcr_dictionaryForKey:", @"hostedContent"));
        uint64_t v17 = (uint64_t)v16;
        uint64_t v53 = v6;
        uint64_t v49 = v16;
        uint64_t v50 = v11;
        if (v16)
        {
          int v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "tcr_stringForKey:", @"version"));
          double v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v17, "tcr_numberForKey:", @"size"));
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  v18,  @"hosted-version");
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  v19,  @"hosted-content-length");
          if (v18) {
            BOOL v20 = v19 == 0LL;
          }
          else {
            BOOL v20 = 1;
          }
          uint64_t v17 = !v20;
        }

        double v21 = (void *)objc_claimAutoreleasedReturnValue([v5[362] numberWithBool:v17]);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v21, off_100327F88[0]);

        v51 = v9;
        uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tcr_arrayForKey:", @"offers"));
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v48 firstObject]);
        unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "tcr_stringForKey:", @"recurringSubscriptionPeriod"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v23, @"per");

        id v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "tcr_numberForKey:", @"price"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v24, @"pri");

        id v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "tcr_stringForKey:", @"currencyCode"));
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v43 stringByAppendingFormat:@"@currency=%@", v46]);
        v52 = v8;
        -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v25, @"loc");

        id v26 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
        uint64_t v47 = v22;
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "tcr_arrayForKey:", @"discounts"));
        __int128 v54 = 0u;
        __int128 v55 = 0u;
        __int128 v56 = 0u;
        __int128 v57 = 0u;
        id v28 = [v27 countByEnumeratingWithState:&v54 objects:v62 count:16];
        if (v28)
        {
          id v29 = v28;
          uint64_t v30 = *(void *)v55;
          do
          {
            for (i = 0LL; i != v29; i = (char *)i + 1)
            {
              if (*(void *)v55 != v30) {
                objc_enumerationMutation(v27);
              }
              id v32 = *(void **)(*((void *)&v54 + 1) + 8LL * (void)i);
              v33 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
              v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "tcr_numberForKey:", @"price"));
              -[NSMutableDictionary setObject:forKeyedSubscript:]( v33,  "setObject:forKeyedSubscript:",  v34,  @"pri");

              uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "tcr_stringForKey:", @"recurringSubscriptionPeriod"));
              -[NSMutableDictionary setObject:forKeyedSubscript:]( v33,  "setObject:forKeyedSubscript:",  v35,  @"per");

              v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "tcr_numberForKey:", @"numOfPeriods"));
              -[NSMutableDictionary setObject:forKeyedSubscript:]( v33,  "setObject:forKeyedSubscript:",  v36,  @"per-count");

              id v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "tcr_stringForKey:", @"modeType"));
              -[NSMutableDictionary setObject:forKeyedSubscript:]( v33,  "setObject:forKeyedSubscript:",  v37,  @"mod");

              id v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "tcr_stringForKey:", @"type"));
              -[NSMutableDictionary setObject:forKeyedSubscript:]( v33,  "setObject:forKeyedSubscript:",  v38,  off_1003280B8[0]);

              uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "tcr_stringForKey:", @"offerId"));
              -[NSMutableDictionary setObject:forKeyedSubscript:]( v33,  "setObject:forKeyedSubscript:",  v39,  off_100327F60[0]);

              -[NSMutableArray addObject:](v26, "addObject:", v33);
            }

            id v29 = [v27 countByEnumeratingWithState:&v54 objects:v62 count:16];
          }

          while (v29);
        }

        if (-[NSMutableArray count](v26, "count")) {
          -[NSMutableDictionary setObject:forKeyedSubscript:](v52, "setObject:forKeyedSubscript:", v26, @"disc");
        }
        -[NSMutableArray addObject:](v44, "addObject:", v52);

        uint64_t v6 = v53 + 1;
        id v5 = &_ss13OpaquePointerV16debugDescriptionSSvg_ptr;
      }

      while ((id)(v53 + 1) != v45);
      id v45 = [obj countByEnumeratingWithState:&v58 objects:v63 count:16];
    }

    while (v45);
  }

  return v44;
}

- (id)_parseLegacyToMedia:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 object]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tcr_arrayForKey:", @"available-subproducts"));
  if (v5)
  {
    __int128 v60 = v4;
    id v61 = v3;
    uint64_t v64 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v5 count]);
    __int128 v81 = 0u;
    __int128 v82 = 0u;
    __int128 v83 = 0u;
    __int128 v84 = 0u;
    __int128 v59 = v5;
    id obj = v5;
    id v65 = [obj countByEnumeratingWithState:&v81 objects:v89 count:16];
    if (v65)
    {
      uint64_t v63 = *(void *)v82;
      do
      {
        uint64_t v6 = 0LL;
        do
        {
          if (*(void *)v82 != v63) {
            objc_enumerationMutation(obj);
          }
          id v7 = *(void **)(*((void *)&v81 + 1) + 8 * v6);
          unsigned int v8 = objc_msgSend(v7, "tcr_BOOLForKey:", @"isFamilyShareable");
          uint64_t v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tcr_stringForKey:", @"subscriptionFamilyId"));
          uint64_t v10 = (void *)v9;
          unsigned int v67 = v8;
          id v11 = @"Consumable";
          if (v8) {
            id v11 = @"Non-Consumable";
          }
          if (v9) {
            id v12 = @"Auto-Renewable Subscription";
          }
          else {
            id v12 = v11;
          }
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tcr_dictionaryForKey:", @"store-offers"));
          id v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "tcr_dictionaryForKey:", @"STDQ"));
          v73 = v13;
          uint64_t v74 = v6;
          if (objc_msgSend(v7, "tcr_BOOLForKey:", @"is-hosted"))
          {
            id v15 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  2LL);
            double v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tcr_stringForKey:", @"version"));
            -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  v16,  @"version");

            uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "tcr_numberForKey:", @"size"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v17, @"size");
          }

          else
          {
            id v15 = 0LL;
          }

          v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tcr_stringForKey:", @"icu-locale"));
          int v18 = (void *)objc_claimAutoreleasedReturnValue([v71 componentsSeparatedByString:@"@currency="]);
          double v19 = v18;
          if (v18
            && (BOOL v20 = (void *)objc_claimAutoreleasedReturnValue([v18 lastObject]), v20, v20))
          {
            uint64_t v75 = objc_claimAutoreleasedReturnValue([v19 lastObject]);
          }

          else
          {
            uint64_t v75 = 0LL;
          }

          id v70 = v19;
          v72 = v14;
          double v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tcr_arrayForKey:", @"discounts"));
          v76 = v10;
          double v68 = v12;
          __int16 v69 = v21;
          if (v21)
          {
            uint64_t v22 = v21;
            id v66 = v15;
            unsigned int v23 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v21 count]);
            __int128 v77 = 0u;
            __int128 v78 = 0u;
            __int128 v79 = 0u;
            __int128 v80 = 0u;
            id v24 = v22;
            id v25 = [v24 countByEnumeratingWithState:&v77 objects:v88 count:16];
            if (v25)
            {
              id v26 = v25;
              uint64_t v27 = *(void *)v78;
              do
              {
                for (i = 0LL; i != v26; i = (char *)i + 1)
                {
                  if (*(void *)v78 != v27) {
                    objc_enumerationMutation(v24);
                  }
                  id v29 = *(void **)(*((void *)&v77 + 1) + 8LL * (void)i);
                  uint64_t v30 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v29 count]);
                  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "tcr_numberForKey:", @"price"));
                  -[NSMutableDictionary setObject:forKeyedSubscript:]( v30,  "setObject:forKeyedSubscript:",  v31,  @"price");

                  id v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "tcr_stringForKey:", @"price-display"));
                  -[NSMutableDictionary setObject:forKeyedSubscript:]( v30,  "setObject:forKeyedSubscript:",  v32,  @"priceFormatted");

                  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "tcr_stringForKey:", @"recurringSubscriptionPeriod"));
                  -[NSMutableDictionary setObject:forKeyedSubscript:]( v30,  "setObject:forKeyedSubscript:",  v33,  @"recurringSubscriptionPeriod");

                  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "tcr_numberForKey:", @"numOfPeriods"));
                  -[NSMutableDictionary setObject:forKeyedSubscript:]( v30,  "setObject:forKeyedSubscript:",  v34,  @"numOfPeriods");

                  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "tcr_stringForKey:", @"modeType"));
                  -[NSMutableDictionary setObject:forKeyedSubscript:]( v30,  "setObject:forKeyedSubscript:",  v35,  @"modeType");

                  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "tcr_stringForKey:", @"type"));
                  -[NSMutableDictionary setObject:forKeyedSubscript:]( v30,  "setObject:forKeyedSubscript:",  v36,  @"type");

                  id v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "tcr_stringForKey:", @"id"));
                  -[NSMutableDictionary setObject:forKeyedSubscript:]( v30,  "setObject:forKeyedSubscript:",  v37,  @"offerId");

                  -[NSMutableArray addObject:](v23, "addObject:", v30);
                }

                id v26 = [v24 countByEnumeratingWithState:&v77 objects:v88 count:16];
              }

              while (v26);
            }

            uint64_t v10 = v76;
            id v15 = v66;
          }

          else
          {
            unsigned int v23 = 0LL;
          }

          id v38 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  8LL);
          uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tcr_stringForKey:", @"offerName"));
          uint64_t v40 = v38;
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v38,  "setObject:forKeyedSubscript:",  v39,  @"offerName");

          uint64_t v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tcr_stringForKey:", @"description"));
          uint64_t v42 = (void *)v41;
          if (v41)
          {
            __int128 v86 = @"standard";
            uint64_t v87 = v41;
            id v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v87,  &v86,  1LL));
            -[NSMutableDictionary setObject:forKeyedSubscript:]( v40,  "setObject:forKeyedSubscript:",  v43,  @"description");
          }

          id v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tcr_stringForKey:", @"title"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v40, "setObject:forKeyedSubscript:", v44, @"name");

          id v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v67));
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v40,  "setObject:forKeyedSubscript:",  v45,  @"isFamilyShareable");

          -[NSMutableDictionary setObject:forKeyedSubscript:]( v40,  "setObject:forKeyedSubscript:",  v10,  @"subscriptionFamilyId");
          -[NSMutableDictionary setObject:forKeyedSubscript:](v40, "setObject:forKeyedSubscript:", v68, @"kind");
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v40,  "setObject:forKeyedSubscript:",  v15,  @"hostedContent");
          id v46 = v40;
          uint64_t v47 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  5LL);
          uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tcr_stringForKey:", @"recurringSubscriptionPeriod"));
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v47,  "setObject:forKeyedSubscript:",  v48,  @"recurringSubscriptionPeriod");

          uint64_t v49 = v15;
          uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "tcr_numberForKey:", @"price"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v47, "setObject:forKeyedSubscript:", v50, @"price");

          v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "tcr_stringForKey:", @"price-display"));
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v47,  "setObject:forKeyedSubscript:",  v51,  @"priceFormatted");

          v52 = (void *)v75;
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v47,  "setObject:forKeyedSubscript:",  v75,  @"currencyCode");
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v47,  "setObject:forKeyedSubscript:",  v23,  @"discounts");
          __int128 v85 = v47;
          uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v85,  1LL));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v46, "setObject:forKeyedSubscript:", v53, @"offers");

          __int128 v54 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  2LL);
          __int128 v55 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tcr_stringForKey:", @"item-id"));
          if (!v55)
          {
            __int128 v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tcr_numberForKey:", @"item-id"));
            uint64_t v57 = objc_claimAutoreleasedReturnValue([v56 stringValue]);

            if (v57) {
              __int128 v55 = (__CFString *)v57;
            }
            else {
              __int128 v55 = &stru_1002FBA48;
            }
            v52 = (void *)v75;
          }

          -[NSMutableDictionary setObject:forKeyedSubscript:](v54, "setObject:forKeyedSubscript:", v55, @"id");
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v54,  "setObject:forKeyedSubscript:",  v46,  @"attributes");
          -[NSMutableArray addObject:](v64, "addObject:", v54);

          uint64_t v6 = v74 + 1;
        }

        while ((id)(v74 + 1) != v65);
        id v65 = [obj countByEnumeratingWithState:&v81 objects:v89 count:16];
      }

      while (v65);
    }

    id v4 = v60;
    id v3 = v61;
    id v5 = v59;
  }

  else
  {
    if (qword_10032EC98 != -1) {
      dispatch_once(&qword_10032EC98, &stru_1002E9BD8);
    }
    if (os_log_type_enabled((os_log_t)qword_10032EC60, OS_LOG_TYPE_ERROR)) {
      sub_100262FC0();
    }
    uint64_t v64 = (NSMutableArray *)&__NSArray0__struct;
  }

  return v64;
}

- (_TtC9storekitd6Client)client
{
  return *(_TtC9storekitd6Client **)((char *)&self->super.super._error + 2);
}

- (NSArray)identifiers
{
  return *(NSArray **)(&self->super._finished + 1);
}

- (int64_t)identifierKind
{
  return *(int64_t *)((char *)&self->_logKey + 2);
}

- (int64_t)apiVersion
{
  return *(int64_t *)((char *)&self->_client + 2);
}

- (NSArray)invalidIdentifiers
{
  return *(NSArray **)((char *)&self->_identifiers + 2);
}

- (NSArray)products
{
  return *(NSArray **)((char *)&self->_identifierKind + 2);
}

- (NSString)serverCorrelationIdentifier
{
  return *(NSString **)((char *)&self->_apiVersion + 2);
}

- (void).cxx_destruct
{
}

@end