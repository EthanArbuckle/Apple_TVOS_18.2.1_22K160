@interface RMGenericAuthenticationCredential
- (BOOL)_prepareSchemeMAIDTask:(id)a3 error:(id *)a4;
- (BOOL)_prepareSchemeMAIDURLRequest:(id)a3 error:(id *)a4;
- (BOOL)prepareTask:(id)a3 error:(id *)a4;
- (BOOL)prepareURLRequest:(id)a3 error:(id *)a4;
- (id)_appleIDContext;
- (id)_createAuthenticationParameters;
- (id)_updateBearerPropertiesAccountIdentifier:(id)a3 afterFailure:(BOOL)a4;
- (id)_updateMAIDPropertiesAccountIdentifier:(id)a3 afterFailure:(BOOL)a4;
- (id)_updateTestPropertiesAccountIdentifier:(id)a3 afterFailure:(BOOL)a4;
- (id)updatePropertiesForAccountIdentifier:(id)a3 afterFailure:(BOOL)a4;
@end

@implementation RMGenericAuthenticationCredential

- (BOOL)prepareURLRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue( -[RMGenericAuthenticationCredential _createAuthenticationParameters]( self,  "_createAuthenticationParameters"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RMGenericAuthenticationCredential authenticationScheme](self, "authenticationScheme"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v8, v7));
  [v6 setValue:v9 forHTTPHeaderField:@"Authorization"];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RMGenericAuthenticationCredential authenticationScheme](self, "authenticationScheme"));
  LODWORD(v8) = [v10 isEqualToString:RMAuthenticationSchemeMAID];

  if ((_DWORD)v8) {
    BOOL v11 = -[RMGenericAuthenticationCredential _prepareSchemeMAIDURLRequest:error:]( self,  "_prepareSchemeMAIDURLRequest:error:",  v6,  a4);
  }
  else {
    BOOL v11 = 1;
  }

  return v11;
}

- (BOOL)_prepareSchemeMAIDURLRequest:(id)a3 error:(id *)a4
{
  id v5 = a3;
  objc_msgSend(v5, "ak_addDeviceUDIDHeader");
  objc_msgSend(v5, "ak_addClientInfoHeader");
  objc_msgSend(v5, "ak_addDeviceSerialNumberHeader");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[RMGenericAuthenticationCredential properties](self, "properties"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:RMAuthenticationSchemeMAIDFieldAltDSID]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:RMAuthenticationSchemeMAIDFieldShortLivedToken]);
  v9 = v8;
  if (v7) {
    BOOL v10 = v8 == 0LL;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    id v11 = v8;
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSString, v12);
    if ((objc_opt_isKindOfClass(v11, v13) & 1) != 0)
    {
      id v15 = v11;
    }

    else
    {
      uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSNumber, v14);
      if ((objc_opt_isKindOfClass(v11, v16) & 1) != 0)
      {
        id v15 = (id)objc_claimAutoreleasedReturnValue([v11 stringValue]);
      }

      else
      {
        uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSDate, v17);
        if ((objc_opt_isKindOfClass(v11, v18) & 1) != 0)
        {
          id v15 = (id)objc_claimAutoreleasedReturnValue(+[RMDateFormat stringUTCWithDate:](&OBJC_CLASS___RMDateFormat, "stringUTCWithDate:", v11));
        }

        else
        {
          uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSData, v19);
          if ((objc_opt_isKindOfClass(v11, v20) & 1) != 0) {
            id v15 = (id)objc_claimAutoreleasedReturnValue([v11 base64EncodedStringWithOptions:0]);
          }
          else {
            id v15 = (id)objc_claimAutoreleasedReturnValue([v11 description]);
          }
        }
      }
    }

    v21 = v15;

    id v22 = v7;
    uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSString, v23);
    if ((objc_opt_isKindOfClass(v22, v24) & 1) != 0)
    {
      id v26 = v22;
    }

    else
    {
      uint64_t v27 = objc_opt_class(&OBJC_CLASS___NSNumber, v25);
      if ((objc_opt_isKindOfClass(v22, v27) & 1) != 0)
      {
        id v26 = (id)objc_claimAutoreleasedReturnValue([v22 stringValue]);
      }

      else
      {
        uint64_t v29 = objc_opt_class(&OBJC_CLASS___NSDate, v28);
        if ((objc_opt_isKindOfClass(v22, v29) & 1) != 0)
        {
          id v26 = (id)objc_claimAutoreleasedReturnValue(+[RMDateFormat stringUTCWithDate:](&OBJC_CLASS___RMDateFormat, "stringUTCWithDate:", v22));
        }

        else
        {
          uint64_t v31 = objc_opt_class(&OBJC_CLASS___NSData, v30);
          if ((objc_opt_isKindOfClass(v22, v31) & 1) != 0) {
            id v26 = (id)objc_claimAutoreleasedReturnValue([v22 base64EncodedStringWithOptions:0]);
          }
          else {
            id v26 = (id)objc_claimAutoreleasedReturnValue([v22 description]);
          }
        }
      }
    }

    v32 = v26;

    objc_msgSend(v5, "ak_addAuthorizationHeaderWithServiceToken:forAltDSID:", v21, v32);
  }

  v33 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:RMAuthenticationSchemeMAIDFieldDSID]);
  uint64_t v34 = objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:RMAuthenticationSchemeMAIDFieldLongLivedToken]);
  v35 = (void *)v34;
  if (v33) {
    BOOL v36 = v34 == 0;
  }
  else {
    BOOL v36 = 1;
  }
  if (!v36)
  {
    id v37 = v33;
    uint64_t v39 = objc_opt_class(&OBJC_CLASS___NSString, v38);
    if ((objc_opt_isKindOfClass(v37, v39) & 1) != 0)
    {
      id v41 = v37;
    }

    else
    {
      uint64_t v42 = objc_opt_class(&OBJC_CLASS___NSNumber, v40);
      if ((objc_opt_isKindOfClass(v37, v42) & 1) != 0)
      {
        id v41 = (id)objc_claimAutoreleasedReturnValue([v37 stringValue]);
      }

      else
      {
        uint64_t v44 = objc_opt_class(&OBJC_CLASS___NSDate, v43);
        if ((objc_opt_isKindOfClass(v37, v44) & 1) != 0)
        {
          id v41 = (id)objc_claimAutoreleasedReturnValue(+[RMDateFormat stringUTCWithDate:](&OBJC_CLASS___RMDateFormat, "stringUTCWithDate:", v37));
        }

        else
        {
          uint64_t v46 = objc_opt_class(&OBJC_CLASS___NSData, v45);
          if ((objc_opt_isKindOfClass(v37, v46) & 1) != 0) {
            id v41 = (id)objc_claimAutoreleasedReturnValue([v37 base64EncodedStringWithOptions:0]);
          }
          else {
            id v41 = (id)objc_claimAutoreleasedReturnValue([v37 description]);
          }
        }
      }
    }

    v47 = v41;

    id v48 = v35;
    uint64_t v50 = objc_opt_class(&OBJC_CLASS___NSString, v49);
    if ((objc_opt_isKindOfClass(v48, v50) & 1) != 0)
    {
      id v52 = v48;
    }

    else
    {
      uint64_t v53 = objc_opt_class(&OBJC_CLASS___NSNumber, v51);
      if ((objc_opt_isKindOfClass(v48, v53) & 1) != 0)
      {
        id v52 = (id)objc_claimAutoreleasedReturnValue([v48 stringValue]);
      }

      else
      {
        uint64_t v55 = objc_opt_class(&OBJC_CLASS___NSDate, v54);
        if ((objc_opt_isKindOfClass(v48, v55) & 1) != 0)
        {
          id v52 = (id)objc_claimAutoreleasedReturnValue(+[RMDateFormat stringUTCWithDate:](&OBJC_CLASS___RMDateFormat, "stringUTCWithDate:", v48));
        }

        else
        {
          uint64_t v57 = objc_opt_class(&OBJC_CLASS___NSData, v56);
          if ((objc_opt_isKindOfClass(v48, v57) & 1) != 0) {
            id v52 = (id)objc_claimAutoreleasedReturnValue([v48 base64EncodedStringWithOptions:0]);
          }
          else {
            id v52 = (id)objc_claimAutoreleasedReturnValue([v48 description]);
          }
        }
      }
    }

    v58 = v52;

    v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@:%@", v47, v58));
    v60 = (void *)objc_claimAutoreleasedReturnValue([v59 dataUsingEncoding:4]);
    v61 = (void *)objc_claimAutoreleasedReturnValue([v60 base64EncodedStringWithOptions:0]);
    [v5 setValue:v61 forHTTPHeaderField:@"X-Apple-RM-MDM-Token"];
  }

  return 1;
}

- (BOOL)prepareTask:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RMGenericAuthenticationCredential authenticationScheme](self, "authenticationScheme"));
  unsigned int v8 = [v7 isEqualToString:RMAuthenticationSchemeMAID];

  if (v8) {
    BOOL v9 = -[RMGenericAuthenticationCredential _prepareSchemeMAIDTask:error:]( self,  "_prepareSchemeMAIDTask:error:",  v6,  a4);
  }
  else {
    BOOL v9 = 1;
  }

  return v9;
}

- (BOOL)_prepareSchemeMAIDTask:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[RMGenericAuthenticationCredential _appleIDContext](self, "_appleIDContext"));
    [v5 _setAppleIDContext:v6];
  }

  return 1;
}

- (id)_appleIDContext
{
  if (qword_1000CEF80 != -1) {
    dispatch_once(&qword_1000CEF80, &stru_1000B8E50);
  }
  id v3 = (id)qword_1000CEF78;
  objc_sync_enter(v3);
  id AssociatedObject = objc_getAssociatedObject(self, @"AssociatedKeyAppleIDContext");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  if (!v5)
  {
    id v5 = (void *)objc_opt_new(&OBJC_CLASS___AKAppleIDSession);
    objc_setAssociatedObject(self, @"AssociatedKeyAppleIDContext", v5, (void *)0x301);
  }

  objc_sync_exit(v3);

  return v5;
}

- (id)updatePropertiesForAccountIdentifier:(id)a3 afterFailure:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RMGenericAuthenticationCredential authenticationScheme](self, "authenticationScheme"));
  unsigned int v8 = [v7 isEqualToString:RMAuthenticationSchemeTest];

  if (v8)
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue( -[RMGenericAuthenticationCredential _updateTestPropertiesAccountIdentifier:afterFailure:]( self,  "_updateTestPropertiesAccountIdentifier:afterFailure:",  v6,  v4));
  }

  else
  {
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[RMGenericAuthenticationCredential authenticationScheme](self, "authenticationScheme"));
    unsigned int v11 = [v10 isEqualToString:RMAuthenticationSchemeBearer];

    if (v11)
    {
      uint64_t v9 = objc_claimAutoreleasedReturnValue( -[RMGenericAuthenticationCredential _updateBearerPropertiesAccountIdentifier:afterFailure:]( self,  "_updateBearerPropertiesAccountIdentifier:afterFailure:",  v6,  v4));
    }

    else
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[RMGenericAuthenticationCredential authenticationScheme](self, "authenticationScheme"));
      unsigned int v13 = [v12 isEqualToString:RMAuthenticationSchemeMAID];

      if (!v13)
      {
        uint64_t v14 = 0LL;
        goto LABEL_8;
      }

      uint64_t v9 = objc_claimAutoreleasedReturnValue( -[RMGenericAuthenticationCredential _updateMAIDPropertiesAccountIdentifier:afterFailure:]( self,  "_updateMAIDPropertiesAccountIdentifier:afterFailure:",  v6,  v4));
    }
  }

  uint64_t v14 = (void *)v9;
LABEL_8:

  return v14;
}

- (id)_updateTestPropertiesAccountIdentifier:(id)a3 afterFailure:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[RMGenericAuthenticationCredential properties](self, "properties", a3));
  id v7 = [v6 mutableCopy];

  if (v4)
  {
    unsigned int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog genericAuthenticationCredential](&OBJC_CLASS___RMLog, "genericAuthenticationCredential"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_10000B84C(self, v8);
    }

    uint64_t v9 = objc_opt_new(&OBJC_CLASS___NSUUID);
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v9, "UUIDString"));
    [v7 setObject:v10 forKeyedSubscript:RMAuthenticationSchemeTestFieldToken];

    unsigned int v11 = objc_alloc(&OBJC_CLASS___RMGenericAuthenticationCredential);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[RMGenericAuthenticationCredential authenticationScheme](self, "authenticationScheme"));
    unsigned int v13 = -[RMGenericAuthenticationCredential initWithAuthenticationScheme:properties:]( v11,  "initWithAuthenticationScheme:properties:",  v12,  v7);
  }

  else
  {
    unsigned int v13 = 0LL;
  }

  return v13;
}

- (id)_updateBearerPropertiesAccountIdentifier:(id)a3 afterFailure:(BOOL)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[RMGenericAuthenticationCredential properties](self, "properties"));
  id v7 = [v6 mutableCopy];

  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[RMGenericAuthenticationCredential properties](self, "properties"));
  uint64_t v9 = RMAuthenticationSchemeBearerFieldAccessToken;
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:RMAuthenticationSchemeBearerFieldAccessToken]);

  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore rm_defaultStore](&OBJC_CLASS___ACAccountStore, "rm_defaultStore"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "rm_remoteManagementAccountForIdentifier:", v5));
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "rm_bearerToken"));
  uint64_t v14 = v13;
  if (v13 && ([v13 isEqualToString:v10] & 1) == 0)
  {
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog genericAuthenticationCredential](&OBJC_CLASS___RMLog, "genericAuthenticationCredential"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_10000B8F8();
    }

    [v7 setObject:v14 forKeyedSubscript:v9];
    uint64_t v17 = objc_alloc(&OBJC_CLASS___RMGenericAuthenticationCredential);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[RMGenericAuthenticationCredential authenticationScheme](self, "authenticationScheme"));
    id v15 = -[RMGenericAuthenticationCredential initWithAuthenticationScheme:properties:]( v17,  "initWithAuthenticationScheme:properties:",  v18,  v7);
  }

  else
  {
    id v15 = 0LL;
  }

  return v15;
}

- (id)_updateMAIDPropertiesAccountIdentifier:(id)a3 afterFailure:(BOOL)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[RMGenericAuthenticationCredential properties](self, "properties", a3, a4));
  id v35 = [v5 mutableCopy];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[RMGenericAuthenticationCredential properties](self, "properties"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:RMAuthenticationSchemeMAIDFieldAltDSID]);

  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[RMGenericAuthenticationCredential properties](self, "properties"));
  uint64_t v9 = RMAuthenticationSchemeMAIDFieldShortLivedToken;
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:RMAuthenticationSchemeMAIDFieldShortLivedToken]);

  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[RMGenericAuthenticationCredential properties](self, "properties"));
  uint64_t v34 = RMAuthenticationSchemeMAIDFieldLongLivedToken;
  BOOL v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:"));

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore rm_defaultStore](&OBJC_CLASS___ACAccountStore, "rm_defaultStore"));
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "aida_accountForAltDSID:", v7));
  if (!v13)
  {
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog genericAuthenticationCredential](&OBJC_CLASS___RMLog, "genericAuthenticationCredential"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10000BB44();
    }
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "aida_tokenForService:", @"com.apple.gs.mdm.auth"));
  if (!v15)
  {
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog genericAuthenticationCredential](&OBJC_CLASS___RMLog, "genericAuthenticationCredential"));
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10000BA80();
    }

    goto LABEL_13;
  }

  if ([v10 isEqualToString:v15])
  {
LABEL_13:
    int v17 = 0;
    goto LABEL_14;
  }

  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog genericAuthenticationCredential](&OBJC_CLASS___RMLog, "genericAuthenticationCredential"));
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    sub_10000BAE0();
  }

  [v35 setObject:v15 forKeyedSubscript:v9];
  int v17 = 1;
LABEL_14:
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "rm_iCloudAccountForRemoteManagingAccountWithAltDSID:", v7));
  if (!v19)
  {
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog genericAuthenticationCredential](&OBJC_CLASS___RMLog, "genericAuthenticationCredential"));
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10000BA20();
    }
  }

  id v21 = v19;
  id v22 = (void *)objc_claimAutoreleasedReturnValue(+[RMFeatureOverrides maidLongLivedToken](&OBJC_CLASS___RMFeatureOverrides, "maidLongLivedToken"));
  uint64_t v23 = v22;
  if (!v22)
  {
    id v24 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "aa_mdmServerToken"));
    goto LABEL_22;
  }

  if ([v22 length])
  {
    id v24 = v23;
LABEL_22:
    uint64_t v25 = v24;
    goto LABEL_24;
  }

  uint64_t v25 = 0LL;
LABEL_24:

  if (v25)
  {
LABEL_31:
    uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog genericAuthenticationCredential](&OBJC_CLASS___RMLog, "genericAuthenticationCredential"));
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
      sub_10000B95C();
    }

    [v35 setObject:v25 forKeyedSubscript:v34];
    goto LABEL_34;
  }

  uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog genericAuthenticationCredential](&OBJC_CLASS___RMLog, "genericAuthenticationCredential"));
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
    sub_10000B9C0();
  }

  if (v36) {
    goto LABEL_31;
  }
LABEL_26:
  if (v17)
  {
LABEL_34:
    uint64_t v30 = objc_alloc(&OBJC_CLASS___RMGenericAuthenticationCredential);
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[RMGenericAuthenticationCredential authenticationScheme](self, "authenticationScheme"));
    v32 = v30;
    uint64_t v27 = v35;
    id v26 = -[RMGenericAuthenticationCredential initWithAuthenticationScheme:properties:]( v32,  "initWithAuthenticationScheme:properties:",  v31,  v35);

    goto LABEL_35;
  }

  id v26 = 0LL;
  uint64_t v27 = v35;
LABEL_35:

  return v26;
}

- (id)_createAuthenticationParameters
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[RMGenericAuthenticationCredential authenticationScheme](self, "authenticationScheme"));
  unsigned int v4 = [v3 isEqualToString:RMAuthenticationSchemeBearer];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[RMGenericAuthenticationCredential properties](self, "properties"));
  id v6 = v5;
  if (v4)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:RMAuthenticationSchemeBearerFieldAccessToken]);
  }

  else
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10000B6DC;
    v11[3] = &unk_1000B8E78;
    id v12 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v5 count]));
    id v8 = v12;
    [v6 enumerateKeysAndObjectsUsingBlock:v11];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 sortedArrayUsingSelector:"caseInsensitiveCompare:"]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "componentsJoinedByString:", @", "));
  }

  return v7;
}

@end