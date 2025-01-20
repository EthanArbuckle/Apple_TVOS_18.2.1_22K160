@interface FamilyCircleOperation
- (BOOL)fetchITunesAccountNames;
- (NSData)clientAuditTokenData;
- (NSString)userAgent;
- (SSFamilyCircle)familyCircle;
- (id)_cachePath;
- (id)_cachedFamilyCircleWithAccountIdentifier:(id)a3;
- (id)_familyCircleForDictionary:(id)a3;
- (int64_t)authenticationPromptStyle;
- (void)_writeCacheWithFamilyCircle:(id)a3 accountIdentifier:(id)a4;
- (void)dealloc;
- (void)run;
- (void)setAuthenticationPromptStyle:(int64_t)a3;
- (void)setClientAuditTokenData:(id)a3;
- (void)setFetchITunesAccountNames:(BOOL)a3;
- (void)setUserAgent:(id)a3;
@end

@implementation FamilyCircleOperation

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___FamilyCircleOperation;
  -[FamilyCircleOperation dealloc](&v3, "dealloc");
}

- (void)run
{
  uint64_t v33 = 0LL;
  id v3 = objc_msgSend(+[SSAccountStore defaultStore](SSAccountStore, "defaultStore"), "activeAccount");
  if (!v3)
  {
    id v14 = 0LL;
    goto LABEL_36;
  }

  v4 = v3;
  v5 = +[SSURLBagContext contextWithBagType:](&OBJC_CLASS___SSURLBagContext, "contextWithBagType:", 0LL);
  uint64_t v6 = SSHTTPHeaderUserAgent;
  -[SSURLBagContext setValue:forHTTPHeaderField:]( v5,  "setValue:forHTTPHeaderField:",  self->_userAgent,  SSHTTPHeaderUserAgent);
  id v7 = -[FamilyCircleOperation loadedURLBagWithContext:returningError:]( self,  "loadedURLBagWithContext:returningError:",  v5,  &v33);
  if (!v7)
  {
    id v15 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v15) {
      id v15 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v16 = [v15 shouldLog];
    else {
      LODWORD(v17) = v16;
    }
    v18 = (os_log_s *)[v15 OSLogObject];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v17 = v17;
    }
    else {
      v17 &= 2u;
    }
    if ((_DWORD)v17)
    {
      uint64_t v19 = objc_opt_class(self);
      int v34 = 138412290;
      uint64_t v35 = v19;
      uint64_t v20 = _os_log_send_and_compose_impl( v17,  0LL,  0LL,  0LL,  &_mh_execute_header,  v18,  0LL,  "%@: Couldn't load bag to get family-info url",  &v34,  12);
      if (v20)
      {
        v21 = (void *)v20;
        v22 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v20, 4LL);
        free(v21);
        v31 = v22;
        SSFileLog(v15, @"%@");
      }
    }

    goto LABEL_23;
  }

  v8 = +[NSURL URLWithString:]( NSURL,  "URLWithString:",  [v7 valueForKey:@"family-info"]);
  v9 = v8;
  if (self->_fetchITunesAccountNames) {
    v9 = (NSURL *)-[NSURL URLByAppendingQueryParameter:value:]( v8,  "URLByAppendingQueryParameter:value:",  @"fetchAccountNames",  @"true");
  }
  if (!v9) {
    goto LABEL_23;
  }
  v10 = objc_alloc_init(&OBJC_CLASS___SSMutableURLRequestProperties);
  -[SSMutableURLRequestProperties setClientAuditTokenData:]( v10,  "setClientAuditTokenData:",  -[FamilyCircleOperation clientAuditTokenData](self, "clientAuditTokenData"));
  -[SSMutableURLRequestProperties setURL:](v10, "setURL:", v9);
  -[SSMutableURLRequestProperties setCachePolicy:](v10, "setCachePolicy:", 1LL);
  -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:]( v10,  "setValue:forHTTPHeaderField:",  -[FamilyCircleOperation userAgent](self, "userAgent"),  v6);
  v11 = -[SSMutableAuthenticationContext initWithAccount:]( objc_alloc(&OBJC_CLASS___SSMutableAuthenticationContext),  "initWithAccount:",  v4);
  -[SSMutableAuthenticationContext setPromptStyle:]( v11,  "setPromptStyle:",  -[FamilyCircleOperation authenticationPromptStyle](self, "authenticationPromptStyle"));
  id v12 = objc_alloc_init(&OBJC_CLASS___ISStoreURLOperation);
  [v12 setAuthenticationContext:v11];
  [v12 setRequestProperties:v10];
  objc_msgSend( v12,  "setDataProvider:",  +[ISProtocolDataProvider provider](ISProtocolDataProvider, "provider"));
  if (!-[FamilyCircleOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v12,  &v33)) {
    goto LABEL_21;
  }
  id v13 = objc_msgSend(objc_msgSend(v12, "dataProvider"), "output");
  if (v13)
  {
    id v14 = -[FamilyCircleOperation _familyCircleForDictionary:](self, "_familyCircleForDictionary:", v13);
    -[FamilyCircleOperation _writeCacheWithFamilyCircle:accountIdentifier:]( self,  "_writeCacheWithFamilyCircle:accountIdentifier:",  v14,  [v4 uniqueIdentifier]);
  }

  else
  {
LABEL_21:
    id v14 = 0LL;
  }

  if (!v14)
  {
LABEL_23:
    id v14 = -[FamilyCircleOperation _cachedFamilyCircleWithAccountIdentifier:]( self,  "_cachedFamilyCircleWithAccountIdentifier:",  objc_msgSend(v4, "uniqueIdentifier", v31));
    if (v14)
    {
      id v23 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
      if (!v23) {
        id v23 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      }
      unsigned int v24 = [v23 shouldLog];
      else {
        LODWORD(v25) = v24;
      }
      v26 = (os_log_s *)[v23 OSLogObject];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v25 = v25;
      }
      else {
        v25 &= 2u;
      }
      if ((_DWORD)v25)
      {
        uint64_t v27 = objc_opt_class(self);
        int v34 = 138412546;
        uint64_t v35 = v27;
        __int16 v36 = 2112;
        uint64_t v37 = v33;
        LODWORD(v32) = 22;
        uint64_t v28 = _os_log_send_and_compose_impl( v25,  0LL,  0LL,  0LL,  &_mh_execute_header,  v26,  0LL,  "%@: Using cached family after error: %@",  &v34,  v32);
        if (v28)
        {
          v29 = (void *)v28;
          v30 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v28, 4LL);
          free(v29);
          v31 = v30;
          SSFileLog(v23, @"%@");
        }
      }

      uint64_t v33 = 0LL;
    }
  }

- (id)_cachedFamilyCircleWithAccountIdentifier:(id)a3
{
  id v4 = -[FamilyCircleOperation _cachePath](self, "_cachePath");
  if (v4
    && (v5 = -[NSData initWithContentsOfFile:](objc_alloc(&OBJC_CLASS___NSData), "initWithContentsOfFile:", v4)) != 0LL)
  {
    uint64_t v6 = v5;
    id v7 = +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v5,  0LL,  0LL,  0LL);
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    v9 = 0LL;
    if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    {
      id v10 = [v7 objectForKey:@"account"];
      id v11 = [v7 objectForKey:@"circle"];
      id v12 = [v7 objectForKey:@"timestamp"];
      uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSNumber);
      if ((objc_opt_isKindOfClass(v10, v13) & 1) != 0
        && (uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSDictionary), (objc_opt_isKindOfClass(v11, v14) & 1) != 0)
        && (uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSDate), (objc_opt_isKindOfClass(v12, v15) & 1) != 0))
      {
        -[NSDate timeIntervalSinceDate:](+[NSDate date](&OBJC_CLASS___NSDate, "date"), "timeIntervalSinceDate:", v12);
        double v17 = v16;
        unsigned int v18 = [v10 isEqualToNumber:a3];
        v9 = 0LL;
        if (v18 && v17 > 2.22044605e-16 && v17 < 604800.0) {
          v9 = -[SSFamilyCircle initWithCacheRepresentation:]( objc_alloc(&OBJC_CLASS___SSFamilyCircle),  "initWithCacheRepresentation:",  v11);
        }
      }

      else
      {
        v9 = 0LL;
      }
    }
  }

  else
  {
    v9 = 0LL;
  }

  return v9;
}

- (id)_cachePath
{
  v2 = -[NSArray initWithObjects:]( objc_alloc(&OBJC_CLASS___NSArray),  "initWithObjects:",  -[NSArray lastObject](NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1), "lastObject"),  @"com.apple.itunesstored",  @"JFamilyCircle.plist",  0LL);
  id v3 = +[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v2);

  return v3;
}

- (id)_familyCircleForDictionary:(id)a3
{
  id v44 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  id v41 = a3;
  id v4 = [a3 objectForKey:@"family"];
  v5 = &ACSLocateCachingServer_ptr;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    id v7 = [v4 objectForKey:@"members"];
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    id v8 = [v7 countByEnumeratingWithState:&v51 objects:v56 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v52;
      uint64_t v42 = *(void *)v52;
      id v43 = v7;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v52 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v51 + 1) + 8LL * (void)i);
          uint64_t v13 = objc_opt_class(v5[360]);
          if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
          {
            id v14 = [v12 objectForKey:@"ITunesPreferredDsid"];
            if ((objc_opt_respondsToSelector(v14, "longLongValue") & 1) != 0)
            {
              id v15 = [v12 objectForKey:@"ICloudDsid"];
              if ((objc_opt_respondsToSelector(v15, "longLongValue") & 1) != 0) {
                double v16 = +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v15 longLongValue]);
              }
              else {
                double v16 = 0LL;
              }
              id v17 = [v12 objectForKey:@"firstName"];
              uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSString);
              if ((objc_opt_isKindOfClass(v17, v18) & 1) == 0) {
                id v17 = 0LL;
              }
              id v19 = [v12 objectForKey:@"lastName"];
              uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSString);
              if ((objc_opt_isKindOfClass(v19, v20) & 1) == 0) {
                id v19 = 0LL;
              }
              id v21 = [v12 objectForKey:@"accountName"];
              uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSString);
              if ((objc_opt_isKindOfClass(v21, v22) & 1) == 0) {
                id v21 = 0LL;
              }
              id v23 = [v12 objectForKey:@"sharingPurchases"];
              id v24 = objc_alloc_init(&OBJC_CLASS___SSFamilyMember);
              objc_msgSend( v24,  "setITunesIdentifier:",  +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  objc_msgSend(v14, "longLongValue")));
              [v24 setFirstName:v17];
              [v24 setLastName:v19];
              [v24 setICloudAccountName:v21];
              [v24 setICloudIdentifier:v16];
              objc_msgSend(v24, "setSharingPurchases:", objc_msgSend(v23, "BOOLValue"));
              [v44 addObject:v24];

              v5 = &ACSLocateCachingServer_ptr;
              uint64_t v10 = v42;
              id v7 = v43;
            }
          }
        }

        id v9 = [v7 countByEnumeratingWithState:&v51 objects:v56 count:16];
      }

      while (v9);
    }
  }

  id v25 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  id v26 = [v41 objectForKey:@"iTunesAccountNames"];
  uint64_t v27 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v26, v27) & 1) != 0)
  {
    __int128 v50 = 0u;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    __int128 v47 = 0u;
    id v28 = [v26 countByEnumeratingWithState:&v47 objects:v55 count:16];
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v48;
      do
      {
        for (j = 0LL; j != v29; j = (char *)j + 1)
        {
          if (*(void *)v48 != v30) {
            objc_enumerationMutation(v26);
          }
          uint64_t v32 = *(void *)(*((void *)&v47 + 1) + 8LL * (void)j);
          uint64_t v33 = objc_opt_class(&OBJC_CLASS___NSString);
          if ((objc_opt_isKindOfClass(v32, v33) & 1) != 0) {
            [v25 addObject:v32];
          }
        }

        id v29 = [v26 countByEnumeratingWithState:&v47 objects:v55 count:16];
      }

      while (v29);
    }
  }

  if (![v44 count]) {
    return 0LL;
  }
  id v34 = objc_msgSend( objc_msgSend(+[SSAccountStore defaultStore](SSAccountStore, "defaultStore"), "activeAccount"),  "uniqueIdentifier");
  ISWeakLinkerLoadLibrary(12LL);
  uint64_t v35 = objc_alloc_init(&OBJC_CLASS___ACAccountStore);
  id v36 = objc_msgSend(-[ACAccountStore aa_primaryAppleAccount](v35, "aa_primaryAppleAccount"), "aa_personID");

  id v37 = 0LL;
  if (v34 && v36)
  {
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472LL;
    v46[2] = sub_10000DE28;
    v46[3] = &unk_10034AF50;
    v46[4] = v36;
    v46[5] = v34;
    id v37 = objc_msgSend( objc_msgSend( v44,  "filteredArrayUsingPredicate:",  +[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v46)),  "firstObject");
  }

  if (v34 && !v37)
  {
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472LL;
    v45[2] = sub_10000DE78;
    v45[3] = &unk_10034AF78;
    v45[4] = v34;
    id v38 = objc_msgSend( v44,  "filteredArrayUsingPredicate:",  +[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v45));
    if ([v38 count] == (id)1) {
      id v37 = [v38 firstObject];
    }
    else {
      id v37 = 0LL;
    }
  }

  [v37 setMe:1];
  [v44 sortUsingComparator:&stru_10034AFB8];
  v39 = objc_alloc_init(&OBJC_CLASS___SSFamilyCircle);
  -[SSFamilyCircle setITunesAccountNames:](v39, "setITunesAccountNames:", v25);
  -[SSFamilyCircle setFamilyMembers:](v39, "setFamilyMembers:", v44);
  return v39;
}

- (void)_writeCacheWithFamilyCircle:(id)a3 accountIdentifier:(id)a4
{
  id v10 = [a3 newCacheRepresentation];
  if (v10)
  {
    id v6 = -[FamilyCircleOperation _cachePath](self, "_cachePath");
    if (v6)
    {
      id v7 = v6;
      id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", a4, @"account");
      -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v10, @"circle");
      -[NSMutableDictionary setObject:forKey:]( v8,  "setObject:forKey:",  +[NSDate date](&OBJC_CLASS___NSDate, "date"),  @"timestamp");
      id v9 = +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v8,  200LL,  0LL,  0LL);
      if (v9) {
        -[NSData writeToFile:options:error:](v9, "writeToFile:options:error:", v7, 1LL, 0LL);
      }
    }
  }

- (int64_t)authenticationPromptStyle
{
  return self->_authenticationPromptStyle;
}

- (void)setAuthenticationPromptStyle:(int64_t)a3
{
  self->_authenticationPromptStyle = a3;
}

- (NSData)clientAuditTokenData
{
  return self->_clientAuditTokenData;
}

- (void)setClientAuditTokenData:(id)a3
{
}

- (SSFamilyCircle)familyCircle
{
  return self->_familyCircle;
}

- (BOOL)fetchITunesAccountNames
{
  return self->_fetchITunesAccountNames;
}

- (void)setFetchITunesAccountNames:(BOOL)a3
{
  self->_fetchITunesAccountNames = a3;
}

- (NSString)userAgent
{
  return self->_userAgent;
}

- (void)setUserAgent:(id)a3
{
}

@end