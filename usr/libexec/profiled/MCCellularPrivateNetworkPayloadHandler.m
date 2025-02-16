@interface MCCellularPrivateNetworkPayloadHandler
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (id)_ctPrivateNetworkProfile:(id)a3;
- (id)_installPrivateNetworkProfile;
- (void)_uninstallPrivateNetworkProfile;
- (void)remove;
- (void)setAside;
- (void)unsetAside;
@end

@implementation MCCellularPrivateNetworkPayloadHandler

- (id)_ctPrivateNetworkProfile:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_opt_new(&OBJC_CLASS___CTGeofenceProfile);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 dataSetName]);
  [v4 setDataSetName:v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 versionNumber]);
  [v4 setVersionNumber:v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 csgNetworkIdentifier]);
  [v4 setCsgNetworkIdentifier:v7];

  v8 = (void *)objc_claimAutoreleasedReturnValue([v3 networkIdentifier]);
  [v4 setNetworkIdentifier:v8];

  return v4;
}

- (id)_installPrivateNetworkProfile
{
  v38 = -[CoreTelephonyClient initWithQueue:](objc_alloc(&OBJC_CLASS___CoreTelephonyClient), "initWithQueue:", 0LL);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[MCCellularPrivateNetworkPayloadHandler _ctPrivateNetworkProfile:]( self,  "_ctPrivateNetworkProfile:",  v3));
  objc_msgSend(v4, "setCellularDataPreferred:", objc_msgSend(v3, "cellularDataPreferred"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 enableNRStandalone]);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v3 enableNRStandalone]);
    unsigned __int8 v7 = [v6 BOOLValue];

    if ((v7 & 1) != 0)
    {
      uint64_t v8 = 1LL;
    }

    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue([v3 enableNRStandalone]);
      unsigned __int8 v10 = [v9 BOOLValue];

      if ((v10 & 1) != 0) {
        goto LABEL_8;
      }
      uint64_t v8 = 2LL;
    }
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  [v4 setNRStandaloneMode:v8];
LABEL_8:
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  v12 = (void *)objc_claimAutoreleasedReturnValue([v3 geofenceList]);
  id v13 = [v12 countByEnumeratingWithState:&v39 objects:v47 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v40;
    do
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v40 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v39 + 1) + 8LL * (void)i);
        v18 = (void *)objc_opt_new(&OBJC_CLASS___CTGeofenceInfo);
        v19 = (void *)objc_claimAutoreleasedReturnValue([v17 longitude]);
        [v18 setLongitude:v19];

        v20 = (void *)objc_claimAutoreleasedReturnValue([v17 latitude]);
        [v18 setLatitude:v20];

        v21 = (void *)objc_claimAutoreleasedReturnValue([v17 radius]);
        [v18 setRadius:v21];

        v22 = (void *)objc_claimAutoreleasedReturnValue([v17 geofenceId]);
        [v18 setGeofenceId:v22];

        [v11 addObject:v18];
      }

      id v14 = [v12 countByEnumeratingWithState:&v39 objects:v47 count:16];
    }

    while (v14);
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v11));
  [v4 setGeofenceList:v23];

  os_log_t v24 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    v25 = v24;
    v26 = (void *)objc_claimAutoreleasedReturnValue([v3 dataSetName]);
    v27 = (void *)objc_claimAutoreleasedReturnValue([v3 versionNumber]);
    *(_DWORD *)buf = 138412546;
    v44 = v26;
    __int16 v45 = 2112;
    v46 = v27;
    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Attempting to install new private network payload %@ - %@",  buf,  0x16u);
  }

  uint64_t v28 = objc_claimAutoreleasedReturnValue(-[CoreTelephonyClient installPrivateNetworkProfile:](v38, "installPrivateNetworkProfile:", v4));
  if (v28)
  {
    v29 = (void *)v28;
    v30 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v44 = v29;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "Installing private network payload failed with error %@",  buf,  0xCu);
    }

    id v31 = [v29 code];
    uint64_t v32 = MCPrivateNetworkErrorDomain;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v31));
    uint64_t v34 = MCErrorArray(@"PRIVATE_NETWORK_INSTALLATION_FAILED_P_CODE");
    v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v32,  64000LL,  v35,  MCErrorTypeFatal,  v33,  0LL));
  }

  else
  {
    v36 = 0LL;
  }

  return v36;
}

- (void)_uninstallPrivateNetworkProfile
{
  id v3 = -[CoreTelephonyClient initWithQueue:](objc_alloc(&OBJC_CLASS___CoreTelephonyClient), "initWithQueue:", 0LL);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[MCCellularPrivateNetworkPayloadHandler _ctPrivateNetworkProfile:]( self,  "_ctPrivateNetworkProfile:",  v4));
  os_log_t v6 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v7 = v6;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 dataSetName]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 versionNumber]);
    int v15 = 138412546;
    v16 = v8;
    __int16 v17 = 2112;
    v18 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Attempting to uninstall private network payload %@ - %@",  (uint8_t *)&v15,  0x16u);
  }

  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(-[CoreTelephonyClient removePrivateNetworkProfile:](v3, "removePrivateNetworkProfile:", v5));
  if (v10)
  {
    os_log_t v11 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      v12 = v11;
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 dataSetName]);
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v4 versionNumber]);
      int v15 = 138412802;
      v16 = v13;
      __int16 v17 = 2112;
      v18 = v14;
      __int16 v19 = 2112;
      v20 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Uninstall private network payload %@ - %@ failed with error %@",  (uint8_t *)&v15,  0x20u);
    }
  }
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue( -[MCCellularPrivateNetworkPayloadHandler _installPrivateNetworkProfile]( self,  "_installPrivateNetworkProfile",  a3,  a4,  a5));
  uint64_t v8 = v7;
  if (a6 && v7) {
    *a6 = v7;
  }

  return v8 == 0LL;
}

- (void)remove
{
}

- (void)setAside
{
  id v3 = -[CoreTelephonyClient initWithQueue:](objc_alloc(&OBJC_CLASS___CoreTelephonyClient), "initWithQueue:", 0LL);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[MCCellularPrivateNetworkPayloadHandler _ctPrivateNetworkProfile:]( self,  "_ctPrivateNetworkProfile:",  v4));
  os_log_t v6 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v7 = v6;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 dataSetName]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 versionNumber]);
    int v15 = 138412546;
    v16 = v8;
    __int16 v17 = 2112;
    v18 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Setting aside private network payload %@ - %@ aside",  (uint8_t *)&v15,  0x16u);
  }

  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue( -[CoreTelephonyClient updatePrivateNetworkProfile:setProfileAside:]( v3,  "updatePrivateNetworkProfile:setProfileAside:",  v5,  1LL));
  if (v10)
  {
    os_log_t v11 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      v12 = v11;
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 dataSetName]);
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v4 versionNumber]);
      int v15 = 138412802;
      v16 = v13;
      __int16 v17 = 2112;
      v18 = v14;
      __int16 v19 = 2112;
      v20 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Setting aside private network payload %@ - %@ failed with error %@",  (uint8_t *)&v15,  0x20u);
    }
  }
}

- (void)unsetAside
{
  id v3 = -[CoreTelephonyClient initWithQueue:](objc_alloc(&OBJC_CLASS___CoreTelephonyClient), "initWithQueue:", 0LL);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[MCCellularPrivateNetworkPayloadHandler _ctPrivateNetworkProfile:]( self,  "_ctPrivateNetworkProfile:",  v4));
  os_log_t v6 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v7 = v6;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 dataSetName]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 versionNumber]);
    int v15 = 138412546;
    v16 = v8;
    __int16 v17 = 2112;
    v18 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Unsetting aside private network payload %@ - %@ aside",  (uint8_t *)&v15,  0x16u);
  }

  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue( -[CoreTelephonyClient updatePrivateNetworkProfile:setProfileAside:]( v3,  "updatePrivateNetworkProfile:setProfileAside:",  v5,  0LL));
  if (v10)
  {
    os_log_t v11 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      v12 = v11;
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 dataSetName]);
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v4 versionNumber]);
      int v15 = 138412802;
      v16 = v13;
      __int16 v17 = 2112;
      v18 = v14;
      __int16 v19 = 2112;
      v20 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Unsetting aside private network payload %@ - %@ failed with error %@",  (uint8_t *)&v15,  0x20u);
    }
  }
}

@end