id sub_100004BB8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setup];
}

id sub_100004CD0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onNotification:*(void *)(a1 + 40)];
}

id sub_100004DFC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fireWithDate:*(void *)(a1 + 40)];
}

id sub_100004E78(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}
}

LABEL_11:
  else {
    v8 = v5;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 dateByAddingTimeInterval:4838400.0]);
  v11 = objc_alloc(&OBJC_CLASS___RTAddress);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v3 addressObject]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v3 _iso3166CountryCode]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v3 _iso3166SubdivisionCode]);
  v16 = [v11 initWithIdentifier:v12 geoAddressObject:v13 subPremises:0 isIsland:v8 creationDate:v9 expirationDate:v10 iso3166CountryCode:v14 iso316 6SubdivisionCode:v15];

  return v16;
}

void sub_100006238(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if ([v7 isEqualToString:CNPostalAddressStreetKey])
  {
    v6 = @"Street";
LABEL_13:
    [*(id *)(a1 + 32) setObject:v5 forKey:v6];
    goto LABEL_14;
  }

  if ([v7 isEqualToString:CNPostalAddressCityKey])
  {
    v6 = @"City";
    goto LABEL_13;
  }

  if ([v7 isEqualToString:CNPostalAddressStateKey])
  {
    v6 = @"State";
    goto LABEL_13;
  }

  if ([v7 isEqualToString:CNPostalAddressPostalCodeKey])
  {
    v6 = @"ZIP";
    goto LABEL_13;
  }

  if ([v7 isEqualToString:CNPostalAddressCountryKey])
  {
    v6 = @"Country";
    goto LABEL_13;
  }

  if ([v7 isEqualToString:CNPostalAddressISOCountryCodeKey])
  {
    v6 = @"CountryCode";
    goto LABEL_13;
  }

LABEL_14:
}

  return v11;
}

    v25 = 0LL;
    goto LABEL_18;
  }

  v52.receiver = self;
  v52.super_class = (Class)&OBJC_CLASS___RTHelperServiceLifeCycleManager;
  v13 = -[RTHelperServiceLifeCycleManager init](&v52, "init");
  v14 = v13;
  if (v13)
  {
    v15 = v13;
    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v16);
    v18 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v15, v18) & 1) != 0)
    {
      v19 = (const char *)-[RTHelperServiceLifeCycleManager UTF8String](v15, "UTF8String");
    }

    else
    {
      v26 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%p",  objc_opt_class(v15),  v15);
      v27 = objc_claimAutoreleasedReturnValue(v26);
      v19 = (const char *)[v27 UTF8String];
    }

    v28 = dispatch_queue_create(v19, v17);

    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)v28;

    objc_storeStrong((id *)&v15->_entitlementProvider, a3);
    objc_storeStrong((id *)&v15->_timerManager, a5);
    v30 = [v10 copy];
    exitHandler = v15->_exitHandler;
    v15->_exitHandler = v30;

    timerManager = v15->_timerManager;
    v33 = (objc_class *)objc_opt_class(v15);
    v34 = NSStringFromClass(v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
    v36 = v15->_queue;
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472LL;
    v50[2] = sub_1000150CC;
    v50[3] = &unk_1000245A8;
    v37 = v15;
    v51 = v37;
    v38 = objc_claimAutoreleasedReturnValue( -[RTTimerManager timerWithIdentifier:queue:handler:]( timerManager,  "timerWithIdentifier:queue:handler:",  v35,  v36,  v50));
    v39 = v37[4];
    v37[4] = (id)v38;

    [v37[4] fireAfterDelay:120.0];
    [v37[4] resume];
    v40 = objc_claimAutoreleasedReturnValue( +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  @"routined",  @"wedge",  @"Routine",  0LL));
    v41 = v37[3];
    v37[3] = (id)v40;

    v42 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    v43 = v37[1];
    v37[1] = v42;

    v44 = v37[1];
    v45 = (void *)objc_opt_class(v37);
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472LL;
    v48[2] = sub_1000150D4;
    v48[3] = &unk_1000245A8;
    v49 = v37;
    v46 = (void *)objc_claimAutoreleasedReturnValue([v45 createSourceForSignal:15 withBlock:v48]);
    [v44 addObject:v46];
  }

  self = v14;
  v25 = self;
LABEL_18:

  return v25;
}

LABEL_28:
LABEL_29:
    v39 = 0;
    goto LABEL_30;
  }

  if (!v7)
  {
    v26 = sub_10000B294(&qword_10002D0A0);
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v25 = "Invalid parameter not satisfying: invocation";
      goto LABEL_13;
    }

    goto LABEL_28;
  }

  if (!sel_isEqual((SEL)[v7 selector], "fetchEnumerableObjectsWithOptions:offset:reply:"))
  {
    entitlementsDictionary = self->_entitlementsDictionary;
    v29 = NSStringFromSelector((SEL)[v8 selector]);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](entitlementsDictionary, "objectForKey:", v30));

    if (!v19)
    {
LABEL_7:
      v20 = sub_10000B294(&qword_10002D0B8);
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        v22 = NSStringFromSelector((SEL)[v8 selector]);
        v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v23;
        _os_log_fault_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_FAULT,  "%@ requires no entitlements.",  buf,  0xCu);
      }

      goto LABEL_28;
    }

    goto LABEL_16;
  }

  *(void *)buf = 0LL;
  [v8 getArgument:buf atIndex:2];
  v9 = *(void *)buf;
  v10 = objc_opt_class(&OBJC_CLASS___RTEnumerationOptions);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) == 0)
  {
    v40 = sub_10000B294(&qword_10002D0A0);
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      goto LABEL_28;
    }
    *(_WORD *)v56 = 0;
    v25 = "Invalid parameter not satisfying: [options isKindOfClass:[RTEnumerationOptions class]]";
    v27 = v56;
    goto LABEL_14;
  }

  v11 = self->_entitlementsDictionary;
  v12 = NSStringFromSelector((SEL)[v8 selector]);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](v11, "objectForKey:", v13));

  v15 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v14, v15) & 1) == 0)
  {
    v44 = sub_10000B294(&qword_10002D0A0);
    v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v56 = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_ERROR,  "Invalid parameter not satisfying: [optionsEntitlements isKindOfClass:[NSDictionary class]]",  v56,  2u);
    }

    goto LABEL_29;
  }

  v16 = (objc_class *)objc_opt_class(*(void *)buf);
  v17 = NSStringFromClass(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:v18]);

  if (!v19) {
    goto LABEL_7;
  }
LABEL_16:
  v31 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v19, v31) & 1) == 0)
  {
    v42 = sub_10000B294(&qword_10002D0A0);
    v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_ERROR,  "Invalid parameter not satisfying: [requiredEntitlements isKindOfClass:[NSArray class]]",  buf,  2u);
    }

    goto LABEL_29;
  }

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v32 = v19;
  v33 = [v32 countByEnumeratingWithState:&v52 objects:v60 count:16];
  if (!v33)
  {
    v39 = 1;
    goto LABEL_42;
  }

  v34 = v33;
  v35 = *(void *)v53;
  while (2)
  {
    for (i = 0LL; i != v34; i = (char *)i + 1)
    {
      if (*(void *)v53 != v35) {
        objc_enumerationMutation(v32);
      }
      v37 = *(void *)(*((void *)&v52 + 1) + 8LL * (void)i);
      v38 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v37, v38) & 1) == 0)
      {
        v46 = sub_10000B294(&qword_10002D0A0);
        v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
        if (!os_log_type_enabled((os_log_t)v47, OS_LOG_TYPE_ERROR))
        {
LABEL_41:

          v39 = 0;
          goto LABEL_42;
        }

        *(_WORD *)buf = 0;
        v48 = "Invalid parameter not satisfying: [entitlement isKindOfClass:[NSString class]]";
        v49 = (os_log_s *)v47;
        v50 = 2;
LABEL_45:
        _os_log_error_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, v48, buf, v50);
        goto LABEL_41;
      }

      if (!-[RTEntitlementProvider clientConnection:hasEntitlement:]( self,  "clientConnection:hasEntitlement:",  v6,  v37,  (void)v52))
      {
        v51 = sub_10000B294(&qword_10002D0B8);
        v47 = (void *)objc_claimAutoreleasedReturnValue(v51);
        if (!os_log_type_enabled((os_log_t)v47, OS_LOG_TYPE_ERROR)) {
          goto LABEL_41;
        }
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v6;
        v58 = 2112;
        v59 = v37;
        v48 = "%@, does not have entitlement, %@";
        v49 = (os_log_s *)v47;
        v50 = 22;
        goto LABEL_45;
      }
    }

    v34 = [v32 countByEnumeratingWithState:&v52 objects:v60 count:16];
    v39 = 1;
    if (v34) {
      continue;
    }
    break;
  }

LABEL_42:
LABEL_30:
  return v39;
}

void sub_100009ABC(id a1)
{
  v1 = objc_opt_new(&OBJC_CLASS___NSDateFormatter);
  v2 = (void *)qword_10002D1E8;
  qword_10002D1E8 = (uint64_t)v1;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale autoupdatingCurrentLocale](&OBJC_CLASS___NSLocale, "autoupdatingCurrentLocale"));
  [(id)qword_10002D1E8 setLocale:v3];

  [(id)qword_10002D1E8 setDateStyle:1];
  [(id)qword_10002D1E8 setTimeStyle:3];
}

id sub_10000A2A8(uint64_t a1, SEL aSelector)
{
  v3 = NSStringFromSelector(aSelector);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ requires the use of the initializer: %@",  a1,  v4));

  id v6 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  v5,  0LL));
  objc_exception_throw(v6);
  return sub_10000A324(v7);
}

id sub_10000A324(uint64_t a1)
{
  v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid parameter not satisfying: %@",  a1,  NSLocalizedDescriptionKey));
  id v6 = v1;
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));

  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  RTErrorDomain,  7LL,  v2));
  return v3;
}

id sub_10000B294(dispatch_once_t *predicate)
{
  if (*predicate != -1) {
    dispatch_once_f(predicate, predicate, (dispatch_function_t)sub_10000B2D8);
  }
  return (id)predicate[2];
}

os_log_t sub_10000B2D8(uint64_t a1)
{
  os_log_t result = os_log_create("com.apple.CoreRoutine", *(const char **)(a1 + 8));
  *(void *)(a1 + 16) = result;
  return result;
}

LABEL_19:
  return v15;
}

int64_t sub_10000C278(id a1, NSURL *a2, NSURL *a3)
{
  v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL lastPathComponent](a2, "lastPathComponent"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL lastPathComponent](v4, "lastPathComponent"));

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByDeletingPathExtension]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByDeletingPathExtension]);
  id v9 = [v7 compare:v8 options:64];
  if (!v9) {
    id v9 = [v5 compare:v6 options:64];
  }

  return (int64_t)v9;
}

void sub_10000C330(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = objc_opt_new(&OBJC_CLASS___NSMutableString);
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\n=== BEGIN analytics submission for event %@ ===\n",  v3);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 sortedArrayUsingComparator:&stru_1000246D0]);

  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v12]);
        -[NSMutableString appendFormat:](v5, "appendFormat:", @"%@ : %@\n", v12, v13);
      }

      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }

    while (v9);
  }

  -[NSMutableString appendFormat:](v5, "appendFormat:", @"=== END analytics submission for event %@ ===\n", v3);
  id v14 = sub_10000B294(&qword_10002D100);
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v5;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }
}

int64_t sub_10000C520(id a1, NSString *a2, NSString *a3)
{
  return -[NSString compare:](a2, "compare:", a3);
}

int main(int argc, const char **argv, const char **envp)
{
}

void sub_10000C534()
{
  id v0 = sub_10000B294(&qword_10002D0A0);
  v1 = (os_log_s *)objc_claimAutoreleasedReturnValue(v0);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v4 = 0;
    _os_log_error_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_ERROR,  "RTHelperService is not supported on this platform....yet.",  v4,  2u);
  }

  id v2 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"RTHelperService is not supported on this platform....yet.\n"));
  id v3 = (const char *)[v2 UTF8String];
  fputs(v3, __stderrp);

  exit(0);
}

void sub_10000D4D0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 dateByAddingTimeInterval:4838400.0]);
    id v9 = objc_alloc(&OBJC_CLASS___RTMapItem);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    v11 = -[RTMapItem initWithIdentifier:geoMapItem:geoMapItemHandle:source:creationDate:expirationDate:]( v9,  "initWithIdentifier:geoMapItem:geoMapItemHandle:source:creationDate:expirationDate:",  v10,  v5,  *(void *)(a1 + 32),  1024LL,  v7,  v8);
  }

  else
  {
    v11 = 0LL;
  }

  id v12 = sub_10000B294(&qword_10002D0E8);
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = NSStringFromSelector(*(SEL *)(a1 + 56));
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    int v19 = 138412802;
    v20 = v15;
    __int16 v21 = 2112;
    v22 = v11;
    __int16 v23 = 2112;
    id v24 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%@, resolved mapItem from handle, %@, error, %@",  (uint8_t *)&v19,  0x20u);
  }

  uint64_t v16 = *(void *)(a1 + 48);
  id v17 = [(id)objc_opt_class(*(void *)(a1 + 40)) exposedErrorFrom:v6];
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  (*(void (**)(uint64_t, RTMapItem *, void *))(v16 + 16))(v16, v11, v18);
}

LABEL_10:
}

void sub_10000D948(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = sub_10000B294(&qword_10002D0E8);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "failed to resolve mapItem from handle, error, %@, fallback to local attempt",  buf,  0xCu);
    }

    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = *(void **)(*(void *)(a1 + 32) + 8LL);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10000DB40;
    v17[3] = &unk_100024720;
    id v18 = *(id *)(a1 + 64);
    [v10 resolveMapItemLocallyFromHandle:v9 completionHandler:v17];
    v11 = v18;
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
    id v12 = (void *)objc_opt_class(*(void *)(a1 + 32));
    v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) analyticsIdentifier]);
    v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) appIdentifier]);
    if (v5)
    {
      id v19 = v5;
      id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v19, 1LL));
    }

    else
    {
      id v14 = 0LL;
    }

    id v15 = [(id)objc_opt_class(*(void *)(a1 + 32)) exposedErrorFrom:0];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    objc_msgSend( v12,  "submitMetricsForAnalyticsIdentifier:appIdentifier:requestType:mapItems:serviceError:isBackgroundRequest:",  v11,  v13,  5,  v14,  v16,  objc_msgSend(*(id *)(a1 + 48), "useBackgroundTraits"));

    if (v5) {
  }
    }
}

uint64_t sub_10000DB40(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

RTMapItem *sub_10000DC4C(void *a1, void *a2)
{
  id v3 = *(void **)(a1[4] + 8LL);
  id v4 = a2;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 handleForMapItem:v4]);
  id v6 = objc_alloc(&OBJC_CLASS___NSString);
  id v7 = -[NSString initWithCString:encoding:](v6, "initWithCString:encoding:", off_10002D120, 1LL);
  id v19 = @"geoMapItemHandleSize";
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v5 length]));
  v20 = v8;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
  sub_10000C330(v7, v9);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"com.apple.%@", v7));
  id v17 = @"geoMapItemHandleSize";
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v5 length]));
  id v18 = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
  AnalyticsSendEvent(v10, v12);

  v13 = objc_alloc(&OBJC_CLASS___RTMapItem);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v15 = -[RTMapItem initWithIdentifier:geoMapItem:geoMapItemHandle:source:creationDate:expirationDate:]( v13,  "initWithIdentifier:geoMapItem:geoMapItemHandle:source:creationDate:expirationDate:",  v14,  v4,  v5,  a1[7],  a1[5],  a1[6]);

  return v15;
}

LABEL_9:
}

void sub_10000E324(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  id v7 = a2;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 _mapItemsFromGEOMapItems:v7 mapItemSource:512]);
  id v9 = sub_10000B294(&qword_10002D0E8);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = NSStringFromSelector(*(SEL *)(a1 + 72));
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    id v13 = [v8 count];
    uint64_t v14 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138413058;
    v25 = v12;
    __int16 v26 = 2048;
    id v27 = v13;
    __int16 v28 = 2112;
    uint64_t v29 = v14;
    __int16 v30 = 2112;
    id v31 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%@, %lu mapItems from local search, %@, error, %@",  buf,  0x2Au);
  }

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10000E54C;
  v23[3] = &unk_100024790;
  v23[4] = *(void *)(a1 + 72);
  [v8 enumerateObjectsUsingBlock:v23];
  uint64_t v15 = *(void *)(a1 + 64);
  id v16 = [(id)objc_opt_class(*(void *)(a1 + 32)) exposedErrorFrom:v5];
  id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  (*(void (**)(uint64_t, void *, void *))(v15 + 16))(v15, v8, v17);

  id v18 = (void *)objc_opt_class(*(void *)(a1 + 32));
  id v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) analyticsIdentifier]);
  v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) appIdentifier]);
  id v21 = [(id)objc_opt_class(*(void *)(a1 + 32)) exposedErrorFrom:v5];
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  objc_msgSend( v18,  "submitMetricsForAnalyticsIdentifier:appIdentifier:requestType:mapItems:serviceError:isBackgroundRequest:",  v19,  v20,  1,  v7,  v22,  objc_msgSend(*(id *)(a1 + 48), "useBackgroundTraits"));
}

void sub_10000E54C(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = sub_10000B294(&qword_10002D0E8);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = NSStringFromSelector(*(SEL *)(a1 + 32));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v10 = 138412802;
    v11 = v9;
    __int16 v12 = 2048;
    uint64_t v13 = a3 + 1;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%@, mapItem %lu, %@", (uint8_t *)&v10, 0x20u);
  }
}

void sub_10000E848(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = sub_10000B294(&qword_10002D0E8);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = NSStringFromSelector(*(SEL *)(a1 + 72));
    int v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    id v11 = [v5 count];
    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) coordinateToString]);
    int v21 = 138413058;
    v22 = v10;
    __int16 v23 = 2048;
    id v24 = v11;
    __int16 v25 = 2112;
    __int16 v26 = v12;
    __int16 v27 = 2112;
    id v28 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%@, %lu geoMapItems from reverseGeocode, %@, error, %@",  (uint8_t *)&v21,  0x2Au);
  }

  uint64_t v13 = *(void *)(a1 + 64);
  id v14 = [(id)objc_opt_class(*(void *)(a1 + 40)) exposedErrorFrom:v6];
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  (*(void (**)(uint64_t, id, void *))(v13 + 16))(v13, v5, v15);

  id v16 = (void *)objc_opt_class(*(void *)(a1 + 40));
  id v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) analyticsIdentifier]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) appIdentifier]);
  id v19 = [(id)objc_opt_class(*(void *)(a1 + 40)) exposedErrorFrom:v6];
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  objc_msgSend( v16,  "submitMetricsForAnalyticsIdentifier:appIdentifier:requestType:mapItems:serviceError:isBackgroundRequest:",  v17,  v18,  3,  v5,  v20,  objc_msgSend(*(id *)(a1 + 48), "useBackgroundTraits"));
}

void sub_10000EBB4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _mapItemsFromGEOMapItems:a2 mapItemSource:1]);
  id v7 = sub_10000B294(&qword_10002D0E8);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = NSStringFromSelector(*(SEL *)(a1 + 56));
    int v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    id v11 = [v6 count];
    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) coordinateToString]);
    *(_DWORD *)buf = 138413058;
    id v18 = v10;
    __int16 v19 = 2048;
    id v20 = v11;
    __int16 v21 = 2112;
    v22 = v12;
    __int16 v23 = 2112;
    id v24 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%@, %lu mapItems from reverseGeocode, %@, error, %@",  buf,  0x2Au);
  }

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10000ED68;
  v16[3] = &unk_100024790;
  v16[4] = *(void *)(a1 + 56);
  [v6 enumerateObjectsUsingBlock:v16];
  uint64_t v13 = *(void *)(a1 + 48);
  id v14 = [(id)objc_opt_class(*(void *)(a1 + 32)) exposedErrorFrom:v5];
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  (*(void (**)(uint64_t, void *, void *))(v13 + 16))(v13, v6, v15);
}

void sub_10000ED68(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = sub_10000B294(&qword_10002D0E8);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = NSStringFromSelector(*(SEL *)(a1 + 32));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v10 = 138412802;
    id v11 = v9;
    __int16 v12 = 2048;
    uint64_t v13 = a3 + 1;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%@, mapItem %lu, %@", (uint8_t *)&v10, 0x20u);
  }
}

void sub_10000F014(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _mapItemsFromGEOMapItems:v5 mapItemSource:1]);
  id v8 = sub_10000B294(&qword_10002D0E8);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = NSStringFromSelector(*(SEL *)(a1 + 64));
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    id v12 = [v7 count];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) coordinateToString]);
    *(_DWORD *)buf = 138413058;
    id v28 = v11;
    __int16 v29 = 2048;
    id v30 = v12;
    __int16 v31 = 2112;
    v32 = v13;
    __int16 v33 = 2112;
    id v34 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%@, %lu mapItems from reverseGeocode, %@, error, %@",  buf,  0x2Au);
  }

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_10000F25C;
  v26[3] = &unk_100024790;
  v26[4] = *(void *)(a1 + 64);
  [v7 enumerateObjectsUsingBlock:v26];
  if (v6) {
    [*(id *)(a1 + 48) addObject:v6];
  }
  __int16 v14 = *(void **)(a1 + 32);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10000F34C;
  v19[3] = &unk_100024800;
  uint64_t v25 = *(void *)(a1 + 64);
  id v20 = v5;
  id v21 = v6;
  id v22 = *(id *)(a1 + 48);
  id v15 = *(id *)(a1 + 56);
  id v23 = v7;
  id v24 = v15;
  id v16 = v7;
  id v17 = v6;
  id v18 = v5;
  [v14 _relatedPlacesMapItemsIdentifiersForGEOMapItems:v18 relatedPlaceListType:2 handler:v19];
}

void sub_10000F25C(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = sub_10000B294(&qword_10002D0E8);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = NSStringFromSelector(*(SEL *)(a1 + 32));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v10 = 138412802;
    id v11 = v9;
    __int16 v12 = 2048;
    uint64_t v13 = a3 + 1;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%@, mapItem %lu, %@", (uint8_t *)&v10, 0x20u);
  }
}

void sub_10000F34C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = sub_10000B294(&qword_10002D0E8);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = NSStringFromSelector(*(SEL *)(a1 + 72));
    int v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    id v11 = [v5 count];
    id v12 = [*(id *)(a1 + 32) count];
    uint64_t v13 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138413058;
    id v20 = v10;
    __int16 v21 = 2048;
    id v22 = v11;
    __int16 v23 = 2048;
    id v24 = v12;
    __int16 v25 = 2112;
    uint64_t v26 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%@, %lu, mapItemsIdentifiers for reverseGeocode relatedPlaces, %lu, mapItems, %@, error",  buf,  0x2Au);
  }

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10000F510;
  v18[3] = &unk_1000247D8;
  v18[4] = *(void *)(a1 + 72);
  [v5 enumerateObjectsUsingBlock:v18];
  if (v6) {
    [*(id *)(a1 + 48) addObject:v6];
  }
  if ([*(id *)(a1 + 48) count])
  {
    uint64_t v14 = _RTSafeArray(*(void *)(a1 + 48));
    id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    uint64_t v16 = _RTMultiErrorCreate();
    id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  }

  else
  {
    id v17 = 0LL;
  }

  (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
}

void sub_10000F510(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = sub_10000B294(&qword_10002D0E8);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = NSStringFromSelector(*(SEL *)(a1 + 32));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v10 = 138412802;
    id v11 = v9;
    __int16 v12 = 2048;
    uint64_t v13 = a3 + 1;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%@, related mapItem %lu, %@",  (uint8_t *)&v10,  0x20u);
  }
}

void sub_10000F7F0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 72);
  id v8 = a2;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 _mapItemsFromGEOMapItems:v8 mapItemSource:v7]);
  id v10 = sub_10000B294(&qword_10002D0E8);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    __int16 v12 = NSStringFromSelector(*(SEL *)(a1 + 80));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    id v14 = [v9 count];
    id v15 = [*(id *)(a1 + 40) count];
    *(_DWORD *)buf = 138413058;
    uint64_t v26 = v13;
    __int16 v27 = 2048;
    id v28 = v14;
    __int16 v29 = 2048;
    id v30 = v15;
    __int16 v31 = 2112;
    id v32 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%@, %lu mapItems from %lu GEOMapItem identifiers, error, %@",  buf,  0x2Au);
  }

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_10000FA24;
  v24[3] = &unk_100024790;
  v24[4] = *(void *)(a1 + 80);
  [v9 enumerateObjectsUsingBlock:v24];
  uint64_t v16 = *(void *)(a1 + 64);
  id v17 = [(id)objc_opt_class(*(void *)(a1 + 32)) exposedErrorFrom:v5];
  id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  (*(void (**)(uint64_t, void *, void *))(v16 + 16))(v16, v9, v18);

  __int16 v19 = (void *)objc_opt_class(*(void *)(a1 + 32));
  id v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) analyticsIdentifier]);
  __int16 v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) appIdentifier]);
  id v22 = [(id)objc_opt_class(*(void *)(a1 + 32)) exposedErrorFrom:v5];
  __int16 v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  objc_msgSend( v19,  "submitMetricsForAnalyticsIdentifier:appIdentifier:requestType:mapItems:serviceError:isBackgroundRequest:",  v20,  v21,  7,  v8,  v23,  objc_msgSend(*(id *)(a1 + 48), "useBackgroundTraits"));
}

void sub_10000FA24(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = sub_10000B294(&qword_10002D0E8);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = NSStringFromSelector(*(SEL *)(a1 + 32));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v10 = 138412802;
    id v11 = v9;
    __int16 v12 = 2048;
    uint64_t v13 = a3 + 1;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%@, mapItem %lu, %@", (uint8_t *)&v10, 0x20u);
  }
}

id sub_10000FCC4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) fetchRelatedPlacesMapItemsForGEOMapItem:a2 relatedPlaceListType:*(unsigned int *)(a1 + 64) options:*(void *)(a1 + 40) source:*(void *)(a1 + 56) handler:*(void *)(a1 + 48)];
}

id sub_10000FD9C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) fetchMapItemsFromIdentifiers:a2 options:*(void *)(a1 + 40) source:*(void *)(a1 + 56) handler:*(void *)(a1 + 48)];
}

void sub_10000FFAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(unsigned int *)(a1 + 56);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100010048;
  v6[3] = &unk_1000248A0;
  id v5 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  [v5 _relatedPlacesMapItemsIdentifiersForGEOMapItem:a2 relatedPlaceListType:v4 handler:v6];
}

void sub_100010048(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([v6 count]) {
    [*(id *)(a1 + 32) addObjectsFromArray:v6];
  }
  if (v5) {
    [*(id *)(a1 + 40) addObject:v5];
  }
}

void sub_10001083C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v40 = a3;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v42 objects:v58 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v43;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v43 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = *(void **)(*((void *)&v42 + 1) + 8LL * (void)i);
        id v11 = *(void **)(a1 + 32);
        uint64_t v12 = *(void *)(a1 + 40);
        uint64_t v13 = *(void *)(a1 + 48);
        __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([v10 timezone]);
        [v11 confidenceWeightForGeoMapItem:v10 startDate:v12 endDate:v13 timeZone:v14];
        double v16 = v15;

        id v17 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) _mapItemFromGEOMapItem:v10 mapItemSource:0x4000 confidenceScalingFactor:v16 * 0.001]);
        id v18 = v17;
        if (v17)
        {
          __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([v17 extendedAttributes]);
          [v19 wifiConfidence];
          double v21 = v20;

          if (v21 > 0.0) {
            [*(id *)(a1 + 56) addObject:v18];
          }
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v42 objects:v58 count:16];
    }

    while (v7);
  }

  id v22 = sub_10000B294(&qword_10002D0E8);
  __int16 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    id v24 = NSStringFromSelector(*(SEL *)(a1 + 104));
    __int16 v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    id v26 = [*(id *)(a1 + 56) count];
    __int16 v27 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) firstObject]);
    id v28 = [*(id *)(a1 + 64) count];
    id v29 = [*(id *)(a1 + 72) count];
    *(_DWORD *)buf = 138413570;
    v47 = v25;
    __int16 v48 = 2048;
    id v49 = v26;
    __int16 v50 = 2112;
    v51 = v27;
    __int16 v52 = 2048;
    id v53 = v28;
    __int16 v54 = 2048;
    id v55 = v29;
    __int16 v56 = 2112;
    id v57 = v40;
    _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "%@, %lu mapItems from bluePoi, location, %@, locations, %lu, accessPoints, %lu, error, %@",  buf,  0x3Eu);
  }

  id v30 = *(void **)(a1 + 56);
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472LL;
  v41[2] = sub_100010BA8;
  v41[3] = &unk_100024790;
  v41[4] = *(void *)(a1 + 104);
  [v30 enumerateObjectsUsingBlock:v41];
  uint64_t v31 = *(void *)(a1 + 96);
  uint64_t v32 = *(void *)(a1 + 56);
  id v33 = [(id)objc_opt_class(*(void *)(a1 + 32)) exposedErrorFrom:v40];
  id v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
  (*(void (**)(uint64_t, uint64_t, void *))(v31 + 16))(v31, v32, v34);

  v35 = (void *)objc_opt_class(*(void *)(a1 + 32));
  v36 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 80) analyticsIdentifier]);
  v37 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 88) appIdentifier]);
  id v38 = [(id)objc_opt_class(*(void *)(a1 + 32)) exposedErrorFrom:v40];
  v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
  objc_msgSend( v35,  "submitMetricsForAnalyticsIdentifier:appIdentifier:requestType:mapItems:serviceError:isBackgroundRequest:",  v36,  v37,  4,  v5,  v39,  objc_msgSend(*(id *)(a1 + 80), "useBackgroundTraits"));
}

void sub_100010BA8(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = sub_10000B294(&qword_10002D0E8);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = NSStringFromSelector(*(SEL *)(a1 + 32));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    uint64_t v10 = a3 + 1;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 extendedAttributes]);
    [v11 wifiConfidence];
    uint64_t v13 = v12;
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([v5 extendedAttributes]);
    int v15 = 138413314;
    double v16 = v9;
    __int16 v17 = 2048;
    uint64_t v18 = v10;
    __int16 v19 = 2112;
    id v20 = v5;
    __int16 v21 = 2048;
    uint64_t v22 = v13;
    __int16 v23 = 2048;
    id v24 = [v14 wifiFingerprintLabelType];
    _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "%@, mapItem %lu, %@, confidence, %lf, type, %ld",  (uint8_t *)&v15,  0x34u);
  }
}

void sub_100010ED8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  id v7 = a2;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 _mapItemsFromGEOMapItems:v7 mapItemSource:2]);
  id v9 = sub_10000B294(&qword_10002D0E8);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = NSStringFromSelector(*(SEL *)(a1 + 72));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    id v13 = [v8 count];
    uint64_t v14 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138413058;
    __int16 v25 = v12;
    __int16 v26 = 2048;
    id v27 = v13;
    __int16 v28 = 2112;
    uint64_t v29 = v14;
    __int16 v30 = 2112;
    id v31 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%@, %lu mapItems from forwardGeocode, addressString, %@, error, %@",  buf,  0x2Au);
  }

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100011100;
  v23[3] = &unk_100024790;
  v23[4] = *(void *)(a1 + 72);
  [v8 enumerateObjectsUsingBlock:v23];
  uint64_t v15 = *(void *)(a1 + 64);
  id v16 = [(id)objc_opt_class(*(void *)(a1 + 32)) exposedErrorFrom:v5];
  __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  (*(void (**)(uint64_t, void *, void *))(v15 + 16))(v15, v8, v17);

  uint64_t v18 = (void *)objc_opt_class(*(void *)(a1 + 32));
  __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) analyticsIdentifier]);
  id v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) appIdentifier]);
  id v21 = [(id)objc_opt_class(*(void *)(a1 + 32)) exposedErrorFrom:v5];
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  objc_msgSend( v18,  "submitMetricsForAnalyticsIdentifier:appIdentifier:requestType:mapItems:serviceError:isBackgroundRequest:",  v19,  v20,  2,  v7,  v22,  objc_msgSend(*(id *)(a1 + 48), "useBackgroundTraits"));
}

void sub_100011100(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = sub_10000B294(&qword_10002D0E8);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = NSStringFromSelector(*(SEL *)(a1 + 32));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v10 = 138412802;
    id v11 = v9;
    __int16 v12 = 2048;
    uint64_t v13 = a3 + 1;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%@, mapItem %lu, %@", (uint8_t *)&v10, 0x20u);
  }
}

void sub_10001141C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  id v7 = a2;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 _mapItemsFromGEOMapItems:v7 mapItemSource:2]);
  id v9 = sub_10000B294(&qword_10002D0E8);
  int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = NSStringFromSelector(*(SEL *)(a1 + 72));
    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    id v13 = [v8 count];
    uint64_t v14 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138413058;
    __int16 v25 = v12;
    __int16 v26 = 2048;
    id v27 = v13;
    __int16 v28 = 2112;
    uint64_t v29 = v14;
    __int16 v30 = 2112;
    id v31 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%@, %lu mapItems from forwardGeocode, addressDictionary, %@, error, %@",  buf,  0x2Au);
  }

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100011644;
  v23[3] = &unk_100024790;
  v23[4] = *(void *)(a1 + 72);
  [v8 enumerateObjectsUsingBlock:v23];
  uint64_t v15 = *(void *)(a1 + 64);
  id v16 = [(id)objc_opt_class(*(void *)(a1 + 32)) exposedErrorFrom:v5];
  __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  (*(void (**)(uint64_t, void *, void *))(v15 + 16))(v15, v8, v17);

  uint64_t v18 = (void *)objc_opt_class(*(void *)(a1 + 32));
  __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) analyticsIdentifier]);
  id v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) appIdentifier]);
  id v21 = [(id)objc_opt_class(*(void *)(a1 + 32)) exposedErrorFrom:v5];
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  objc_msgSend( v18,  "submitMetricsForAnalyticsIdentifier:appIdentifier:requestType:mapItems:serviceError:isBackgroundRequest:",  v19,  v20,  2,  v7,  v22,  objc_msgSend(*(id *)(a1 + 48), "useBackgroundTraits"));
}

void sub_100011644(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = sub_10000B294(&qword_10002D0E8);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = NSStringFromSelector(*(SEL *)(a1 + 32));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v10 = 138412802;
    id v11 = v9;
    __int16 v12 = 2048;
    uint64_t v13 = a3 + 1;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%@, mapItem %lu, %@", (uint8_t *)&v10, 0x20u);
  }
}

void sub_1000118B0(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = a3;
  id v10 = (id)objc_claimAutoreleasedReturnValue([a2 geoAddress]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v10 postalAddress]);
  id v8 = [(id)objc_opt_class(*(void *)(a1 + 32)) exposedErrorFrom:v6];
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  (*(void (**)(uint64_t, void *, void *))(v5 + 16))(v5, v7, v9);
}

void sub_100011AC0(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

  else
  {
    id v6 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 _quickLinks]);
    id v8 = [v7 count];

    if (v8)
    {
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_quickLinks", 0));
      id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v19;
        do
        {
          for (i = 0LL; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v19 != v12) {
              objc_enumerationMutation(v9);
            }
            __int16 v14 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
            if ([v14 type] == (id)2)
            {
              id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 URLString]);
              id v16 = [v15 length];

              if (v16)
              {
                __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v14 URLString]);
                -[NSMutableArray addObject:](v6, "addObject:", v17);
              }
            }
          }

          id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }

        while (v11);
      }
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
}

void sub_100012234(uint64_t a1, uint64_t a2)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _buildingPolygonsFromGEOBuilding:a2]);
  if ([v3 count]) {
    [*(id *)(a1 + 40) addObjectsFromArray:v3];
  }
}

void sub_100012284(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = sub_10000B294(&qword_10002D0E8);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 56));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) coordinateToString]);
    id v8 = *(void **)(a1 + 64);
    id v9 = [*(id *)(a1 + 40) count];
    *(_DWORD *)buf = 138413314;
    id v33 = v6;
    __int16 v34 = 2112;
    v35 = v7;
    __int16 v36 = 2048;
    v37 = v8;
    __int16 v38 = 2048;
    id v39 = v9;
    __int16 v40 = 2112;
    id v41 = v2;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%@, location, %@, radius, %.2f, building polygons count, %lu, error, %@",  buf,  0x34u);
  }

  if (v2)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }

  else
  {
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    id v10 = *(id *)(a1 + 40);
    id v11 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = 0LL;
      uint64_t v14 = *(void *)v28;
      do
      {
        id v15 = 0LL;
        uint64_t v26 = v13;
        do
        {
          if (*(void *)v28 != v14) {
            objc_enumerationMutation(v10);
          }
          id v16 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)v15);
          id v17 = sub_10000B294(&qword_10002D0E8);
          __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            __int128 v19 = (char *)v15 + v13;
            __int128 v20 = NSStringFromSelector(*(SEL *)(a1 + 56));
            __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
            uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v16 centroid]);
            __int16 v23 = (void *)objc_claimAutoreleasedReturnValue([v16 vertices]);
            id v24 = [v23 count];
            *(_DWORD *)buf = 138413058;
            id v33 = v21;
            __int16 v34 = 2048;
            v35 = v19;
            __int16 v36 = 2112;
            v37 = v22;
            __int16 v38 = 2048;
            id v39 = v24;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "%@, polygon idx, %lu, centroid, %@, vertices count, %lu",  buf,  0x2Au);

            uint64_t v13 = v26;
          }

          id v15 = (char *)v15 + 1;
        }

        while (v12 != v15);
        id v12 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
        v13 += (uint64_t)v15;
      }

      while (v12);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
    id v2 = 0LL;
  }
}

void sub_1000126E8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = sub_10000B294(&qword_10002D0E8);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = NSStringFromSelector(*(SEL *)(a1 + 56));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    id v11 = *(void **)(a1 + 64);
    *(_DWORD *)buf = 138413058;
    __int16 v48 = v10;
    __int16 v49 = 2048;
    id v50 = v11;
    __int16 v51 = 2048;
    id v52 = [v5 count];
    __int16 v53 = 2112;
    id v54 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%@, muid, %lu, geoMapItem count, %lu, error, %@",  buf,  0x2Au);
  }

  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    id v13 = v5;
    id v14 = [v13 countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v43;
      do
      {
        for (i = 0LL; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v43 != v16) {
            objc_enumerationMutation(v13);
          }
          __int128 v18 = *(void **)(*((void *)&v42 + 1) + 8LL * (void)i);
        }

        id v15 = [v13 countByEnumeratingWithState:&v42 objects:v46 count:16];
      }

      while (v15);
    }

    if ([v12 count])
    {
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v12 firstObject]);
      id v20 = sub_10000B294(&qword_10002D0E8);
      __int128 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        uint64_t v22 = NSStringFromSelector(*(SEL *)(a1 + 56));
        __int16 v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        id v35 = [v19 _muid];
        id v24 = (void *)objc_claimAutoreleasedReturnValue([v19 _poiCategory]);
        __int16 v25 = (void *)objc_claimAutoreleasedReturnValue([v19 name]);
        *(_DWORD *)buf = 138413058;
        __int16 v48 = v23;
        __int16 v49 = 2048;
        id v50 = v35;
        __int16 v51 = 2112;
        id v52 = v24;
        __int16 v53 = 2112;
        id v54 = v25;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "%@, found geoMapItem, muid, %lu, category, %@, name, %@",  buf,  0x2Au);
      }

      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v19 _businessHours]);
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472LL;
      v41[2] = sub_100012ACC;
      v41[3] = &unk_100024988;
      v41[4] = *(void *)(a1 + 56);
      [v26 enumerateObjectsUsingBlock:v41];

      id v27 = objc_alloc(&OBJC_CLASS___RTCoordinate);
      [v19 coordinate];
      double v29 = v28;
      [v19 coordinate];
      id v30 = objc_msgSend(v27, "initWithLatitude:longitude:", v29);
      id v31 = *(void **)(a1 + 32);
      uint64_t v32 = *(void *)(a1 + 40);
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472LL;
      v37[2] = sub_100012BD4;
      v37[3] = &unk_1000249B0;
      uint64_t v40 = *(void *)(a1 + 64);
      id v38 = v19;
      __int128 v36 = *(_OWORD *)(a1 + 48);
      id v33 = (id)v36;
      __int128 v39 = v36;
      id v34 = v19;
      [v31 fetchPointOfInterestsAroundCoordinate:v30 radius:v32 options:v37 handler:200.0];
    }
  }
}

void sub_100012ACC(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = sub_10000B294(&qword_10002D0E8);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = NSStringFromSelector(*(SEL *)(a1 + 32));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 placeDailyHours]);
    int v11 = 138412802;
    id v12 = v9;
    __int16 v13 = 2048;
    uint64_t v14 = a3;
    __int16 v15 = 2112;
    uint64_t v16 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%@, idx, %lu, business hours, %@",  (uint8_t *)&v11,  0x20u);
  }
}

void sub_100012BD4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_10000B294(&qword_10002D0E8);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = NSStringFromSelector(*(SEL *)(a1 + 48));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    id v8 = *(void **)(a1 + 56);
    *(_DWORD *)buf = 138412802;
    uint64_t v26 = v7;
    __int16 v27 = 2048;
    id v28 = v8;
    __int16 v29 = 2048;
    id v30 = [v3 count];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%@, muid, %lu, nearby POI count, %lu", buf, 0x20u);
  }

  if ([*(id *)(a1 + 32) _hasAnyAmenities])
  {
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_amenities", 0));
    uint64_t v10 = (uint64_t)[v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0LL; i != v10; ++i)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v9);
          }
          if ([*(id *)(*((void *)&v20 + 1) + 8 * i) isApplePayAmenity])
          {
            uint64_t v10 = 1LL;
            goto LABEL_15;
          }
        }

        uint64_t v10 = (uint64_t)[v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

LABEL_15:
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  id v13 = objc_alloc(&OBJC_CLASS___RTPointOfInterestAttributes);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _poiCategory]);
  id v15 = objc_msgSend( v13,  "initWithApplePaySupport:category:muid:nearbyPoiCount:",  v10,  v14,  *(void *)(a1 + 56),  objc_msgSend(v3, "count"));

  id v16 = sub_10000B294(&qword_10002D0E8);
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    __int128 v18 = NSStringFromSelector(*(SEL *)(a1 + 48));
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    *(_DWORD *)buf = 138412546;
    uint64_t v26 = v19;
    __int16 v27 = 2112;
    id v28 = v15;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%@, POI attributes, %@", buf, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

  id v31 = sub_10000B294(&qword_10002D0A0);
  uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v48 = "-[RTHelperService createMapItemWithIdentifier:geoMapItemStorage:source:creationDate:handler:]";
    __int16 v49 = 1024;
    id v50 = 1338;
    _os_log_error_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_ERROR,  "Invalid parameter not satisfying: creationDate (in %s:%d)",  buf,  0x12u);
  }

  if (v15)
  {
LABEL_5:
    if (v12)
    {
      if (v13)
      {
        if (v14)
        {
          id v16 = (void *)objc_claimAutoreleasedReturnValue(-[GEOMapService handleForMapItem:](self->_geoMapService, "handleForMapItem:", v13));
          id v17 = objc_alloc(&OBJC_CLASS___NSString);
          __int128 v18 = -[NSString initWithCString:encoding:](v17, "initWithCString:encoding:", off_10002D120, 1LL);
          __int128 v39 = @"geoMapItemHandleSize";
          __int128 v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v16 length]));
          uint64_t v40 = v19;
          __int128 v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v40,  &v39,  1LL));
          sub_10000C330(v18, v20);

          __int128 v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.%@",  v18));
          v37 = @"geoMapItemHandleSize";
          __int128 v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v16 length]));
          id v38 = v22;
          __int128 v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v38,  &v37,  1LL));
          AnalyticsSendEvent(v21, v23);

          id v24 = objc_alloc(&OBJC_CLASS___RTMapItem);
          __int16 v25 = (void *)objc_claimAutoreleasedReturnValue([v14 dateByAddingTimeInterval:4838400.0]);
          uint64_t v26 = -[RTMapItem initWithIdentifier:geoMapItem:geoMapItemHandle:source:creationDate:expirationDate:]( v24,  "initWithIdentifier:geoMapItem:geoMapItemHandle:source:creationDate:expirationDate:",  v12,  v13,  v16,  a5,  v14,  v25);

          v15[2](v15, v26, 0LL);
LABEL_24:

          goto LABEL_25;
        }

        id v34 = RTErrorDomain;
        id v41 = NSLocalizedDescriptionKey;
        __int128 v42 = @"requires a valid creationDate.";
        id v35 = &v42;
        __int128 v36 = &v41;
      }

      else
      {
        id v34 = RTErrorDomain;
        __int128 v43 = NSLocalizedDescriptionKey;
        __int128 v44 = @"requires a valid geoMapItemStorage.";
        id v35 = &v44;
        __int128 v36 = &v43;
      }
    }

    else
    {
      id v34 = RTErrorDomain;
      __int128 v45 = NSLocalizedDescriptionKey;
      v46 = @"requires a valid identifier.";
      id v35 = &v46;
      __int128 v36 = &v45;
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v35,  v36,  1LL));
    uint64_t v26 = (RTMapItem *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v34,  7LL,  v16));
    ((void (**)(id, id, RTMapItem *))v15)[2](v15, 0LL, v26);
    goto LABEL_24;
  }

void sub_100013028(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    (*(void (**)(void, void, uint64_t))(*(void *)(a1 + 64) + 16LL))(*(void *)(a1 + 64), 0LL, a2);
  }

  else
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) mapItemsForParameters:*(void *)(a1 + 40)]);
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v3 count]));
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (uint64_t i = 0LL; i != v7; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
          if ([v10 _hasMUID])
          {
            uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v10 _muid]));
            [v4 addObject:v11];
          }
        }

        id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }

      while (v7);
    }

    if ([v4 count])
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(a1 + 48) + 8) ticketForMUIDs:v4 traits:*(void *)(a1 + 56)]);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_100013278;
      v13[3] = &unk_100024A00;
      v13[4] = *(void *)(a1 + 48);
      id v14 = *(id *)(a1 + 64);
      [v12 submitWithHandler:v13 networkActivity:0];
    }

    else
    {
      (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
    }
  }

void sub_100013278(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0LL; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
      }

      id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v10);
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _mapItemsFromGEOMapItems:v7 mapItemSource:0]);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

LABEL_18:
  id v33 = sub_10000B294(&qword_10002D0A0);
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v48 = "-[RTHelperService createMapItemWithIdentifier:geoMapItemStorage:source:creationDate:handler:]";
    __int16 v49 = 1024;
    id v50 = 1339;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v16,  OS_LOG_TYPE_ERROR,  "Invalid parameter not satisfying: handler (in %s:%d)",  buf,  0x12u);
  }

LABEL_25:
}

id sub_100014B54(uint64_t a1)
{
  return +[RTHelperService computeMetricsForAnalyticsIdentifier:appIdentifier:requestType:mapItems:serviceError:isBackgroundRequest:]( &OBJC_CLASS___RTHelperService,  "computeMetricsForAnalyticsIdentifier:appIdentifier:requestType:mapItems:serviceError:isBackgroundRequest:",  *(void *)(a1 + 32),  *(void *)(a1 + 40),  *(void *)(a1 + 64),  *(void *)(a1 + 48),  *(void *)(a1 + 56),  *(unsigned __int8 *)(a1 + 72));
}

id sub_100014B74(uint64_t a1)
{
  uint64_t v2 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10000C330(*(void **)(a1 + 32), v3);
  return v3;
}

id sub_1000150CC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleLifeCycleTimerExpiration];
}

uint64_t sub_1000150D4(uint64_t a1)
{
  id v2 = sub_10000B294(&qword_10002D0D0);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "handle SIGTERM", v5, 2u);
  }

  uint64_t result = *(void *)(*(void *)(a1 + 32) + 48LL);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

id sub_100015400(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
}

void sub_100015654( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

uint64_t sub_100015674(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100015684(uint64_t a1)
{
}

void sub_10001568C(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 64))
  {
    [*(id *)(a1 + 40) invoke];
    uint64_t v2 = *(void *)(*(void *)(a1 + 56) + 8LL);
    id v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0LL;
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    id v5 = sub_10000B294(&qword_10002D0B8);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      id v13 = NSStringFromSelector((SEL)[*(id *)(a1 + 40) selector]);
      id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v12;
      __int16 v51 = 2112;
      id v52 = v14;
      _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "client, %@, called, %@", buf, 0x16u);
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) target]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 16) protocol]);
    unsigned int v9 = [v7 conformsToProtocol:v8];

    if (v9)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) exportedInterface]);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "replyBlockSignatureForSelector:", objc_msgSend(*(id *)(a1 + 40), "selector")));
    }

    else
    {
      uint64_t v11 = 0LL;
    }

    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( +[RTXPC executablePathOfConnection:]( &OBJC_CLASS___RTXPC,  "executablePathOfConnection:",  *(void *)(a1 + 48)));
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 lastPathComponent]);

    unsigned __int8 v17 = [*(id *)(*(void *)(a1 + 32) + 24) containsObject:v16];
    unsigned int v18 = [*(id *)(*(void *)(a1 + 32) + 16) clientConnection:*(void *)(a1 + 48) satisfiesEntitlementRequirementsForInvocation:*(void *)(a1 + 40)];
    if (v11)
    {
      if ((v18 & 1) != 0)
      {
        if ((v17 & 1) != 0)
        {
          id v19 = [*(id *)(a1 + 40) blockArgumentIndex];
          *(void *)buf = 0LL;
          [*(id *)(a1 + 40) getArgument:buf atIndex:v19];
          __int128 v20 = NSStringFromSelector((SEL)[*(id *)(a1 + 40) selector]);
          __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
          id v22 = [*(id *)buf copy];
          id v23 = [v11 UTF8String];
          v41[0] = _NSConcreteStackBlock;
          v41[1] = 3221225472LL;
          v41[2] = sub_100015B94;
          v41[3] = &unk_100024AA0;
          id v42 = v21;
          id v43 = v4;
          id v44 = v22;
          id v24 = v22;
          id v25 = v21;
          id v45 = (id)__NSMakeSpecialForwardingCaptureBlock(v23, v41);
          [*(id *)(a1 + 40) setArgument:&v45 atIndex:v19];
          [*(id *)(a1 + 40) invoke];
          uint64_t v26 = *(void *)(*(void *)(a1 + 56) + 8LL);
          __int16 v27 = *(void **)(v26 + 40);
          *(void *)(v26 + 40) = 0LL;
        }

        else
        {
          NSErrorUserInfoKey v46 = NSLocalizedDescriptionKey;
          __int128 v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"This operation is unavailable for %@.",  v16));
          v47 = v36;
          v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v47,  &v46,  1LL));

          id v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  RTErrorDomain,  2LL,  v37));
          [*(id *)(a1 + 48) rejectInvocation:*(void *)(a1 + 40) withError:v38 replyTypes:v11];
          uint64_t v39 = *(void *)(*(void *)(a1 + 56) + 8LL);
          uint64_t v40 = *(void **)(v39 + 40);
          *(void *)(v39 + 40) = 0LL;
        }
      }

      else
      {
        NSErrorUserInfoKey v48 = NSLocalizedDescriptionKey;
        id v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ is not entitled for this operation.",  v16));
        __int16 v49 = v30;
        id v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v49,  &v48,  1LL));

        uint64_t v32 = objc_alloc(&OBJC_CLASS___NSError);
        id v33 = -[NSError initWithDomain:code:userInfo:](v32, "initWithDomain:code:userInfo:", RTErrorDomain, 3LL, v31);
        [*(id *)(a1 + 48) rejectInvocation:*(void *)(a1 + 40) withError:v33 replyTypes:v11];
        uint64_t v34 = *(void *)(*(void *)(a1 + 56) + 8LL);
        id v35 = *(void **)(v34 + 40);
        *(void *)(v34 + 40) = 0LL;
      }
    }

    else
    {
      uint64_t v28 = *(void *)(*(void *)(a1 + 56) + 8LL);
      __int16 v29 = *(void **)(v28 + 40);
      *(void *)(v28 + 40) = 0LL;
    }
  }

void sub_100015B94(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_10000B294(&qword_10002D0B8);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = a1[4];
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v7 timeIntervalSinceDate:a1[5]];
    int v9 = 138412546;
    uint64_t v10 = v6;
    __int16 v11 = 2048;
    uint64_t v12 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Sending reply for request %@, latency, %.2f",  (uint8_t *)&v9,  0x16u);
  }

  [v3 setTarget:a1[6]];
  [v3 invoke];
}

id objc_msgSend__relatedPlacesMapItemsIdentifiersForGEOMapItem_relatedPlaceListType_handler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_relatedPlacesMapItemsIdentifiersForGEOMapItem:relatedPlaceListType:handler:");
}

id objc_msgSend__relatedPlacesMapItemsIdentifiersForGEOMapItems_relatedPlaceListType_handler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_relatedPlacesMapItemsIdentifiersForGEOMapItems:relatedPlaceListType:handler:");
}

id objc_msgSend_initWithIdentifier_geoAddressObject_subPremises_isIsland_creationDate_expirationDate_iso3166CountryCode_iso3166SubdivisionCode_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithIdentifier:geoAddressObject:subPremises:isIsland:creationDate:expirationDate:iso3166CountryCode:iso31 66SubdivisionCode:");
}

id objc_msgSend_initWithIdentifier_geoMapItem_geoMapItemHandle_source_creationDate_expirationDate_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIdentifier:geoMapItem:geoMapItemHandle:source:creationDate:expirationDate:");
}

id objc_msgSend_initWithIdentifier_geoMapItem_geoMapItemHandle_source_creationDate_expirationDate_confidenceScalingFactor_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithIdentifier:geoMapItem:geoMapItemHandle:source:creationDate:expirationDate:confidenceScalingFactor:");
}

id objc_msgSend_initWithIdentifier_name_category_address_location_source_mapItemPlaceType_muid_resultProviderID_geoMapItemHandle_creationDate_expirationDate_extendedAttributes_displayLanguage_disputed_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithIdentifier:name:category:address:location:source:mapItemPlaceType:muid:resultProviderID:geoMapItemHan dle:creationDate:expirationDate:extendedAttributes:displayLanguage:disputed:");
}

id objc_msgSend_submitMetricsForAnalyticsIdentifier_appIdentifier_requestType_mapItems_serviceError_isBackgroundRequest_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "submitMetricsForAnalyticsIdentifier:appIdentifier:requestType:mapItems:serviceError:isBackgroundRequest:");
}

id objc_msgSend_ticketForReverseGeocodeLocation_preserveOriginalLocation_placeTypeLimit_traits_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ticketForReverseGeocodeLocation:preserveOriginalLocation:placeTypeLimit:traits:");
}

id objc_msgSend_ticketForWifiFingerprintWithLocations_wifiAccessPoints_maxLabels_entryTime_exitTime_traits_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ticketForWifiFingerprintWithLocations:wifiAccessPoints:maxLabels:entryTime:exitTime:traits:");
}

id objc_msgSend_withBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "withBlock:");
}