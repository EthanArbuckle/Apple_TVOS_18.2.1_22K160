@interface MCCellularPayloadHandler
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (NSDictionary)setAsideDictionary;
- (void)remove;
- (void)setAside;
- (void)setSetAsideDictionary:(id)a3;
- (void)unsetAside;
@end

@implementation MCCellularPayloadHandler

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  if (MCCTHasCellular(self, a2, a3, a4, a5))
  {
    id v37 = 0LL;
    MCCTGetManagedCellularProfile(&v37, 0LL);
    id v8 = v37;
    if (v8)
    {
      uint64_t v9 = MCCellularErrorDomain;
      uint64_t v10 = MCErrorArray(@"CELLULAR_ALREADY_CONFIGURED");
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      id v12 = (id)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v9,  36000LL,  v11,  MCErrorTypeFatal,  0LL));
    }

    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      v16 = (void *)objc_claimAutoreleasedReturnValue([v11 attachAPN]);
      v17 = v16;
      if (v16)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue([v16 telephonyRepresentation]);
        [v15 setObject:v18 forKeyedSubscript:@"AttachAPN"];
      }

      v19 = (void *)objc_claimAutoreleasedReturnValue([v11 APNs]);
      id v20 = [v19 count];

      if (v20)
      {
        v30 = v17;
        v21 = (void *)objc_claimAutoreleasedReturnValue([v11 APNs]);
        v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v21 count]));

        __int128 v35 = 0u;
        __int128 v36 = 0u;
        __int128 v33 = 0u;
        __int128 v34 = 0u;
        v23 = (void *)objc_claimAutoreleasedReturnValue([v11 APNs]);
        id v24 = [v23 countByEnumeratingWithState:&v33 objects:v38 count:16];
        if (v24)
        {
          id v25 = v24;
          uint64_t v26 = *(void *)v34;
          do
          {
            for (i = 0LL; i != v25; i = (char *)i + 1)
            {
              if (*(void *)v34 != v26) {
                objc_enumerationMutation(v23);
              }
              [v22 addObject:v28];
            }

            id v25 = [v23 countByEnumeratingWithState:&v33 objects:v38 count:16];
          }

          while (v25);
        }

        [v15 setObject:v22 forKeyedSubscript:@"APNs"];
        v17 = v30;
      }

      id v32 = 0LL;
      MCCTSetManagedCellularProfile(v15, &v32);
      id v12 = v32;
    }

    BOOL v14 = v12 != 0LL;
    if (a6 && v12)
    {
      id v12 = v12;
      *a6 = v12;
      BOOL v14 = 1;
    }
  }

  else
  {
    v13 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "APN payload was skipped because this device is not compatible with it.",  buf,  2u);
    }

    BOOL v14 = 0;
    id v12 = 0LL;
  }

  return !v14;
}

- (void)setAside
{
  id v9 = 0LL;
  id v10 = 0LL;
  int v3 = MCCTGetManagedCellularProfile(&v10, &v9);
  id v4 = v10;
  id v5 = v9;
  if (v3)
  {
    -[MCCellularPayloadHandler setSetAsideDictionary:](self, "setSetAsideDictionary:", v4);
  }

  else
  {
    os_log_t v6 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      v7 = v6;
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 MCVerboseDescription]);
      *(_DWORD *)buf = 138543362;
      id v12 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Could not set aside managed cellular settings. Error: %{public}@",  buf,  0xCu);
    }
  }

  MCCTClearManagedCellularProfile(0LL);
}

- (void)unsetAside
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCCellularPayloadHandler setAsideDictionary](self, "setAsideDictionary"));

  if (v3)
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(-[MCCellularPayloadHandler setAsideDictionary](self, "setAsideDictionary"));
    MCCTSetManagedCellularProfile(v4, 0LL);
  }

- (void)remove
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  unsigned __int8 v3 = [v2 isSetAside];

  if ((v3 & 1) == 0)
  {
    id v9 = 0LL;
    char v4 = MCCTClearManagedCellularProfile(&v9);
    id v5 = v9;
    if ((v4 & 1) == 0)
    {
      os_log_t v6 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        v7 = v6;
        id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 MCVerboseDescription]);
        *(_DWORD *)buf = 138543362;
        v11 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Could not clear managed cellular settings. Ignoring. Error: %{public}@",  buf,  0xCu);
      }
    }
  }

- (NSDictionary)setAsideDictionary
{
  return self->_setAsideDictionary;
}

- (void)setSetAsideDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end