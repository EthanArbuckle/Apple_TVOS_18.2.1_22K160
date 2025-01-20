@interface CLMapHelperServiceDelegate
- (BOOL)clientConnection:(id)a3 hasEntitlement:(id)a4;
- (BOOL)isExecutableAllowed:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (id)executablePathOfConnection:(id)a3;
@end

@implementation CLMapHelperServiceDelegate

- (BOOL)clientConnection:(id)a3 hasEntitlement:(id)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue([a3 valueForEntitlement:a4]);
  *(_WORD *)&self->hasEntitlementForRoadData = 0;
  p_hasEntitlementForRoadData = &self->hasEntitlementForRoadData;
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSArray);
  BOOL v8 = 0;
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
  {
    id v9 = v5;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v30) = [v9 count];
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "CLTSP,MapHelperService,entitlementCheck,arrayEntries,%d",  buf,  8u);
    }

    v24 = v5;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    id v10 = v9;
    id v11 = [v10 countByEnumeratingWithState:&v25 objects:v37 count:16];
    if (v11)
    {
      id v12 = v11;
      char v13 = 0;
      uint64_t v14 = *(void *)v26;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v26 != v14) {
            objc_enumerationMutation(v10);
          }
          uint64_t v16 = *(void *)(*((void *)&v25 + 1) + 8LL * (void)i);
          uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSString);
          if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
          {
            unsigned __int8 v18 = [@"road-tiles" isEqualToString:v16];
            v19 = p_hasEntitlementForRoadData;
            if ((v18 & 1) != 0
              || (unsigned int v20 = [@"building-tiles" isEqualToString:v16],
                  v19 = p_hasEntitlementForRoadData + 1,
                  v20))
            {
              char v13 = 1;
              BOOL *v19 = 1;
            }

            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              BOOL v21 = *p_hasEntitlementForRoadData;
              BOOL v22 = p_hasEntitlementForRoadData[1];
              *(_DWORD *)buf = 138413058;
              uint64_t v30 = v16;
              __int16 v31 = 1024;
              int v32 = v13 & 1;
              __int16 v33 = 1024;
              BOOL v34 = v21;
              __int16 v35 = 1024;
              BOOL v36 = v22;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "CLTSP,MapHelperService,entitlementCheck,entry,%@,returnValue,%d,road,%d,building,%d",  buf,  0x1Eu);
            }
          }
        }

        id v12 = [v10 countByEnumeratingWithState:&v25 objects:v37 count:16];
      }

      while (v12);
    }

    else
    {
      char v13 = 0;
    }

    BOOL v8 = v13 & 1;
    v5 = v24;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v30) = v8;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "CLTSP,MapHelperService,returnValue,%d",  buf,  8u);
  }

  return v8;
}

- (id)executablePathOfConnection:(id)a3
{
  id v3 = a3;
  bzero(buffer, 0x1000uLL);
  if (v3) {
    [v3 auditToken];
  }
  else {
    memset(&v6, 0, sizeof(v6));
  }
  if (proc_pidpath_audittoken(&v6, buffer, 0x1000u) < 1) {
    v4 = 0LL;
  }
  else {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", buffer));
  }

  return v4;
}

- (BOOL)isExecutableAllowed:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  @"routined",  @"locationd",  @"CLLogger",  @"wedge",  0LL));
  audit_token_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CLMapHelperServiceDelegate executablePathOfConnection:](self, "executablePathOfConnection:", v4));

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 lastPathComponent]);
  LOBYTE(v6) = [v5 containsObject:v7];

  return (char)v6;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  if (!-[CLMapHelperServiceDelegate clientConnection:hasEntitlement:]( self,  "clientConnection:hasEntitlement:",  v5,  @"com.apple.private.corelocation.map-helper-service"))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "CLTSP,MapHelperService,Application does not have correct entitlement",  (uint8_t *)&v12,  2u);
    }

    goto LABEL_8;
  }

  if (!-[CLMapHelperServiceDelegate isExecutableAllowed:](self, "isExecutableAllowed:", v5))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CLMapHelperServiceDelegate executablePathOfConnection:](self, "executablePathOfConnection:", v5));
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 lastPathComponent]);
      int v12 = 138412290;
      char v13 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "CLTSP,MapHelperService,Application not allowed to establish connection,%@",  (uint8_t *)&v12,  0xCu);
    }

@end