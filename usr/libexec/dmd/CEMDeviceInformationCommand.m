@interface CEMDeviceInformationCommand
+ (id)deviceInfoDeviceChannelKeys;
+ (id)deviceInfoKeyFromDMFKey:(id)a3;
+ (id)deviceInfoRMDKeys;
+ (id)deviceInfoSupervisedKeys;
+ (id)deviceInfoUserChannelKeys;
+ (id)dmfKeyFromDeviceInfoKey:(id)a3;
- (BOOL)dmf_requestExecutesWithoutReturning;
- (id)dmf_executeOperationWithContext:(id)a3 error:(id *)a4;
- (id)dmf_executeRequestWithContext:(id)a3 error:(id *)a4;
- (id)dmf_statusForResult:(id)a3 context:(id)a4;
- (id)filterQueryForScope;
- (void)addRMDSpecificResultsToDictionary:(id)a3 errors:(id)a4;
@end

@implementation CEMDeviceInformationCommand

+ (id)deviceInfoSupervisedKeys
{
  if (qword_1000CCB18 != -1) {
    dispatch_once(&qword_1000CCB18, &stru_10009D6F0);
  }
  return (id)qword_1000CCB20;
}

+ (id)deviceInfoDeviceChannelKeys
{
  if (qword_1000CCB28 != -1) {
    dispatch_once(&qword_1000CCB28, &stru_10009D710);
  }
  return (id)qword_1000CCB30;
}

+ (id)deviceInfoUserChannelKeys
{
  if (qword_1000CCB38 != -1) {
    dispatch_once(&qword_1000CCB38, &stru_10009D730);
  }
  return (id)qword_1000CCB40;
}

+ (id)deviceInfoRMDKeys
{
  if (qword_1000CCB48 != -1) {
    dispatch_once(&qword_1000CCB48, &stru_10009D750);
  }
  return (id)qword_1000CCB50;
}

+ (id)dmfKeyFromDeviceInfoKey:(id)a3
{
  uint64_t v3 = qword_1000CCB58;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_1000CCB58, &stru_10009D770);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_1000CCB60 objectForKeyedSubscript:v4]);

  return v5;
}

+ (id)deviceInfoKeyFromDMFKey:(id)a3
{
  uint64_t v3 = qword_1000CCB68;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_1000CCB68, &stru_10009D790);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_1000CCB70 objectForKeyedSubscript:v4]);

  return v5;
}

- (id)dmf_executeRequestWithContext:(id)a3 error:(id *)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CEMDeviceInformationCommand filterQueryForScope](self, "filterQueryForScope", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v4 count]));
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      v10 = 0LL;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = (void *)objc_claimAutoreleasedReturnValue( +[CEMDeviceInformationCommand dmfKeyFromDeviceInfoKey:]( &OBJC_CLASS___CEMDeviceInformationCommand,  "dmfKeyFromDeviceInfoKey:",  *(void *)(*((void *)&v14 + 1) + 8LL * (void)v10),  (void)v14));
        if (v11) {
          [v5 addObject:v11];
        }

        v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v8);
  }

  v12 = (void *)objc_opt_new(&OBJC_CLASS___DMFFetchDevicePropertiesRequest);
  [v12 setPropertyKeys:v5];

  return v12;
}

- (id)dmf_executeOperationWithContext:(id)a3 error:(id *)a4
{
  return 0LL;
}

- (BOOL)dmf_requestExecutesWithoutReturning
{
  return 0;
}

- (id)dmf_statusForResult:(id)a3 context:(id)a4
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___DMFFetchDevicePropertiesResultObject);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    id v49 = v4;
    id v6 = v4;
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 valuesByPropertyKey]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v7 count]));

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 errorsByPropertyKey]);
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v9 count]));

    __int128 v63 = 0u;
    __int128 v64 = 0u;
    __int128 v61 = 0u;
    __int128 v62 = 0u;
    v52 = v6;
    v11 = (void *)objc_claimAutoreleasedReturnValue([v6 valuesByPropertyKey]);
    id v12 = [v11 countByEnumeratingWithState:&v61 objects:v73 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v62;
      do
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v62 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v61 + 1) + 8LL * (void)i);
          __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( +[CEMDeviceInformationCommand deviceInfoKeyFromDMFKey:]( &OBJC_CLASS___CEMDeviceInformationCommand,  "deviceInfoKeyFromDMFKey:",  v16));
          v18 = (void *)objc_claimAutoreleasedReturnValue([v52 valuesByPropertyKey]);
          v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:v16]);

          uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSNull);
          if ((objc_opt_isKindOfClass(v19, v20) & 1) != 0)
          {
            v71 = @"Code";
            v72 = @"Not Supported";
            v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v72,  &v71,  1LL));
            [v10 setObject:v21 forKeyedSubscript:v17];
          }

          else
          {
            [v8 setObject:v19 forKeyedSubscript:v17];
          }
        }

        id v13 = [v11 countByEnumeratingWithState:&v61 objects:v73 count:16];
      }

      while (v13);
    }

    v48 = v8;

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CEMDeviceInformationCommand payloadQueries](self, "payloadQueries"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v22));

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CEMDeviceInformationCommand filterQueryForScope](self, "filterQueryForScope"));
    [v23 minusSet:v24];

    __int128 v59 = 0u;
    __int128 v60 = 0u;
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    id v25 = v23;
    id v26 = [v25 countByEnumeratingWithState:&v57 objects:v70 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v58;
      do
      {
        for (j = 0LL; j != v27; j = (char *)j + 1)
        {
          if (*(void *)v58 != v28) {
            objc_enumerationMutation(v25);
          }
          uint64_t v30 = *(void *)(*((void *)&v57 + 1) + 8LL * (void)j);
          v68 = @"Code";
          v69 = @"Not Allowed";
          v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v69,  &v68,  1LL));
          [v10 setObject:v31 forKeyedSubscript:v30];
        }

        id v27 = [v25 countByEnumeratingWithState:&v57 objects:v70 count:16];
      }

      while (v27);
    }

    id v46 = v25;

    __int128 v55 = 0u;
    __int128 v56 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue([v52 errorsByPropertyKey]);
    id v32 = [obj countByEnumeratingWithState:&v53 objects:v67 count:16];
    if (v32)
    {
      id v33 = v32;
      uint64_t v34 = *(void *)v54;
      do
      {
        for (k = 0LL; k != v33; k = (char *)k + 1)
        {
          if (*(void *)v54 != v34) {
            objc_enumerationMutation(obj);
          }
          uint64_t v36 = *(void *)(*((void *)&v53 + 1) + 8LL * (void)k);
          v37 = (void *)objc_claimAutoreleasedReturnValue( +[CEMDeviceInformationCommand deviceInfoKeyFromDMFKey:]( &OBJC_CLASS___CEMDeviceInformationCommand,  "deviceInfoKeyFromDMFKey:",  v36,  v46));
          v38 = (void *)objc_claimAutoreleasedReturnValue([v52 errorsByPropertyKey]);
          v39 = (void *)objc_claimAutoreleasedReturnValue([v38 objectForKeyedSubscript:v36]);

          v65[1] = @"ErrorChain";
          v66[0] = @"Failed";
          v65[0] = @"Code";
          id v40 = DMDErrorChainFromError(v39);
          v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
          v66[1] = v41;
          v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v66,  v65,  2LL));
          [v10 setObject:v42 forKeyedSubscript:v37];
        }

        id v33 = [obj countByEnumeratingWithState:&v53 objects:v67 count:16];
      }

      while (v33);
    }

    -[CEMDeviceInformationCommand addRMDSpecificResultsToDictionary:errors:]( self,  "addRMDSpecificResultsToDictionary:errors:",  v48,  v10);
    v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  2LL));
    [v43 setObject:v48 forKeyedSubscript:@"QueryResponses"];
    id v4 = v49;
    if ([v10 count]) {
      [v43 setObject:v10 forKeyedSubscript:@"ErrorResponses"];
    }
    id v44 = objc_msgSend(v43, "copy", v46);
  }

  else
  {
    id v44 = 0LL;
  }

  return v44;
}

- (id)filterQueryForScope
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CEMDeviceInformationCommand payloadQueries](self, "payloadQueries"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v2));

  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[CEMDeviceInformationCommand deviceInfoDeviceChannelKeys]( &OBJC_CLASS___CEMDeviceInformationCommand,  "deviceInfoDeviceChannelKeys"));
  [v3 intersectSet:v4];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[CEMDeviceInformationCommand deviceInfoRMDKeys]( &OBJC_CLASS___CEMDeviceInformationCommand,  "deviceInfoRMDKeys"));
  [v3 minusSet:v5];

  return v3;
}

- (void)addRMDSpecificResultsToDictionary:(id)a3 errors:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CEMDeviceInformationCommand payloadQueries](self, "payloadQueries"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v6));

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[CEMDeviceInformationCommand deviceInfoRMDKeys]( &OBJC_CLASS___CEMDeviceInformationCommand,  "deviceInfoRMDKeys"));
  [v7 intersectSet:v8];

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      id v13 = 0LL;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)v13);
        uint64_t v20 = @"Code";
        v21 = @"Not Supported";
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL,  (void)v16));
        [v5 setObject:v15 forKeyedSubscript:v14];

        id v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }

    while (v11);
  }
}

@end