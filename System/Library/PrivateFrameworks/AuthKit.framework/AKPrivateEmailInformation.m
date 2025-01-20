@interface AKPrivateEmailInformation
- (AKPrivateEmailInformation)initWithResponseBody:(id)a3;
- (BOOL)invalidListVersionSupplied;
- (BOOL)shouldSyncWithServer;
- (NSArray)addedPrivateEmails;
- (NSArray)removedPrivateEmails;
- (NSString)privateEmailListVersion;
- (id)description;
- (int)protocolVersion;
- (void)_processDictionary:(id)a3 addedPrivateEmails:(id *)a4 removedPrivateEmails:(id *)a5;
- (void)setShouldSyncWithServer:(BOOL)a3;
@end

@implementation AKPrivateEmailInformation

- (AKPrivateEmailInformation)initWithResponseBody:(id)a3
{
  id v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)&OBJC_CLASS___AKPrivateEmailInformation;
  v5 = -[AKPrivateEmailInformation init](&v52, "init");
  v6 = v5;
  if (v5)
  {
    v5->_shouldSyncWithServer = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:AKPrivateEmailListVersionKey]);
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString, v8);
    if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0) {
      v10 = v7;
    }
    else {
      v10 = 0LL;
    }
    objc_storeStrong((id *)&v6->_privateEmailListVersion, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"invalidListVersion"]);
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSNumber, v12);
    char isKindOfClass = objc_opt_isKindOfClass(v11, v13);
    unsigned __int8 v15 = 0;
    if ((isKindOfClass & 1) != 0) {
      unsigned __int8 v15 = [v11 BOOLValue];
    }
    v6->_invalidListVersionSupplied = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"hmeProtocolVersion"]);
    uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSNumber, v17);
    if ((objc_opt_isKindOfClass(v16, v18) & 1) != 0) {
      unsigned int v19 = [v16 intValue];
    }
    else {
      unsigned int v19 = AKPrivateEmailInitialProtocolVersion;
    }
    v6->_protocolVersion = v19;
    v20 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v21 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v22 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"hmeMappings"]);
    uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSArray, v23);
    uint64_t v25 = objc_opt_isKindOfClass(v22, v24);
    if ((v25 & 1) != 0)
    {
      v43 = v16;
      v44 = v11;
      v45 = v7;
      __int128 v50 = 0u;
      __int128 v51 = 0u;
      __int128 v48 = 0u;
      __int128 v49 = 0u;
      v42 = v22;
      id v27 = v22;
      id v28 = [v27 countByEnumeratingWithState:&v48 objects:v53 count:16];
      if (v28)
      {
        id v29 = v28;
        uint64_t v30 = *(void *)v49;
        do
        {
          v31 = 0LL;
          v32 = v21;
          v33 = v20;
          do
          {
            if (*(void *)v49 != v30) {
              objc_enumerationMutation(v27);
            }
            uint64_t v34 = *(void *)(*((void *)&v48 + 1) + 8LL * (void)v31);
            v46 = v32;
            v47 = v33;
            -[AKPrivateEmailInformation _processDictionary:addedPrivateEmails:removedPrivateEmails:]( v6,  "_processDictionary:addedPrivateEmails:removedPrivateEmails:",  v34,  &v47,  &v46,  v42,  v43,  v44,  v45);
            v20 = v47;

            v21 = v46;
            v31 = (char *)v31 + 1;
            v32 = v21;
            v33 = v20;
          }

          while (v29 != v31);
          id v29 = [v27 countByEnumeratingWithState:&v48 objects:v53 count:16];
        }

        while (v29);
      }

      v11 = v44;
      v7 = v45;
      v22 = v42;
      v16 = v43;
    }

    else if (!v6->_privateEmailListVersion || v22)
    {
      uint64_t v35 = _AKLogHme(v25, v26);
      v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        sub_100137054((uint64_t)v22, (uint64_t *)&v6->_privateEmailListVersion, v36);
      }
    }

    else
    {
      v6->_shouldSyncWithServer = 1;
    }

    v37 = (NSArray *)-[NSMutableArray copy](v20, "copy", v42, v43, v44, v45);
    addedPrivateEmails = v6->_addedPrivateEmails;
    v6->_addedPrivateEmails = v37;

    v39 = (NSArray *)-[NSMutableArray copy](v21, "copy");
    removedPrivateEmails = v6->_removedPrivateEmails;
    v6->_removedPrivateEmails = v39;
  }

  return v6;
}

- (void)_processDictionary:(id)a3 addedPrivateEmails:(id *)a4 removedPrivateEmails:(id *)a5
{
  id v21 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:@"d"]);
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString, v8);
  char isKindOfClass = objc_opt_isKindOfClass(v7, v9);
  uint64_t v11 = objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:@"op"]);
  uint64_t v13 = (__CFString *)v11;
  if ((isKindOfClass & 1) != 0)
  {
    if (v11)
    {
      uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSString, v12);
      char v15 = objc_opt_isKindOfClass(v13, v14);
      uint64_t v16 = objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:@"hme"]);
      uint64_t v17 = (__CFString *)v16;
      if ((v15 & 1) == 0)
      {
        id v18 = (id)v16;
        goto LABEL_6;
      }
    }

    else
    {
      uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:@"hme"]);
      uint64_t v13 = @"A";
    }

    if (-[__CFString isEqualToString:](v13, "isEqualToString:", @"A"))
    {
      uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSString, v19);
      if ((objc_opt_isKindOfClass(v17, v20) & 1) == 0) {
        goto LABEL_18;
      }
    }

    else if (-[__CFString isEqualToString:](v13, "isEqualToString:", @"D"))
    {

      uint64_t v17 = &stru_1001D1450;
    }

    id v18 = [[AKPrivateEmail alloc] initWithAddress:v17 forKey:v7];
    if ((-[__CFString isEqualToString:](v13, "isEqualToString:", @"D") & 1) != 0
      || (a5 = a4, -[__CFString isEqualToString:](v13, "isEqualToString:", @"A")))
    {
      [*a5 addObject:v18];
    }

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Hide My Email info {added=%@, removed=%@, invalid=%d, shouldSync=%d}",  self->_addedPrivateEmails,  self->_removedPrivateEmails,  self->_invalidListVersionSupplied,  self->_shouldSyncWithServer);
}

- (NSString)privateEmailListVersion
{
  return self->_privateEmailListVersion;
}

- (BOOL)invalidListVersionSupplied
{
  return self->_invalidListVersionSupplied;
}

- (NSArray)addedPrivateEmails
{
  return self->_addedPrivateEmails;
}

- (NSArray)removedPrivateEmails
{
  return self->_removedPrivateEmails;
}

- (BOOL)shouldSyncWithServer
{
  return self->_shouldSyncWithServer;
}

- (void)setShouldSyncWithServer:(BOOL)a3
{
  self->_shouldSyncWithServer = a3;
}

- (int)protocolVersion
{
  return self->_protocolVersion;
}

- (void).cxx_destruct
{
}

@end