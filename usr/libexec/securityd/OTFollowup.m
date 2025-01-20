@interface OTFollowup
- (BOOL)clearFollowUp:(unsigned __int8)a3 activeAccount:(id)a4 error:(id *)a5;
- (BOOL)hasPosted:(unsigned __int8)a3;
- (BOOL)postFollowUp:(unsigned __int8)a3 activeAccount:(id)a4 error:(id *)a5;
- (NSMutableSet)postedCFUTypes;
- (OTFollowup)initWithFollowupController:(id)a3;
- (OctagonFollowUpControllerProtocol)cdpd;
- (double)followupEnd;
- (double)followupStart;
- (double)previousFollowupEnd;
- (id)createCDPFollowupContext:(unsigned __int8)a3;
- (id)sfaStatus;
- (id)sysdiagnoseStatus;
- (void)clearAllPostedFlags;
- (void)setCdpd:(id)a3;
- (void)setFollowupEnd:(double)a3;
- (void)setFollowupStart:(double)a3;
- (void)setPostedCFUTypes:(id)a3;
- (void)setPreviousFollowupEnd:(double)a3;
@end

@implementation OTFollowup

- (OTFollowup)initWithFollowupController:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___OTFollowup;
  v5 = -[OTFollowup init](&v10, "init");
  v6 = v5;
  if (v5)
  {
    -[OTFollowup setCdpd:](v5, "setCdpd:", v4);
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    postedCFUTypes = v6->_postedCFUTypes;
    v6->_postedCFUTypes = (NSMutableSet *)v7;
  }

  return v6;
}

- (id)createCDPFollowupContext:(unsigned __int8)a3
{
  switch(a3)
  {
    case 4u:
      v3 = (void *)objc_claimAutoreleasedReturnValue( +[CDPFollowUpContext contextForSecureTerms]( &OBJC_CLASS___CDPFollowUpContext,  "contextForSecureTerms"));
      break;
    case 3u:
      v3 = (void *)objc_claimAutoreleasedReturnValue( +[CDPFollowUpContext contextForConfirmExistingSecret]( &OBJC_CLASS___CDPFollowUpContext,  "contextForConfirmExistingSecret"));
      break;
    case 2u:
      v3 = (void *)objc_claimAutoreleasedReturnValue( +[CDPFollowUpContext contextForStateRepair]( &OBJC_CLASS___CDPFollowUpContext,  "contextForStateRepair"));
      break;
    default:
      v3 = 0LL;
      break;
  }

  return v3;
}

- (BOOL)postFollowUp:(unsigned __int8)a3 activeAccount:(id)a4 error:(id *)a5
{
  uint64_t v6 = a3;
  id v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTFollowup createCDPFollowupContext:](self, "createCDPFollowupContext:", v6));
  if (qword_1002DEB70 != -1) {
    dispatch_once(&qword_1002DEB70, &stru_10028EFA8);
  }
  if (byte_1002DEB68)
  {
    objc_super v10 = sub_10001267C("followup");
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue([v8 altDSID]);
      v13 = (void *)objc_claimAutoreleasedReturnValue([v8 personaUniqueString]);
      *(_DWORD *)buf = 138412546;
      v27 = v12;
      __int16 v28 = 2112;
      v29 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Setting altdsid (%@) on context for persona (%@)",  buf,  0x16u);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue([v8 altDSID]);
    [v9 setAltDSID:v14];
  }

  if (v9)
  {
    v15 = sub_10001267C("followup");
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      else {
        v17 = *(&off_1002903C8 + (v6 - 2));
      }
      *(_DWORD *)buf = 138412290;
      v27 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Posting a follow up (for Octagon) of type %@",  buf,  0xCu);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[OTFollowup cdpd](self, "cdpd"));
    id v25 = 0LL;
    unsigned int v18 = [v19 postFollowUpWithContext:v9 error:&v25];
    id v20 = v25;

    if (v18)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[OTFollowup postedCFUTypes](self, "postedCFUTypes"));
      v22 = v21;
      else {
        v23 = *(&off_1002903C8 + (v6 - 2));
      }
      [v21 addObject:v23];
    }

    else if (a5)
    {
      *a5 = v20;
    }
  }

  else
  {
    LOBYTE(v18) = 0;
  }

  return v18;
}

- (BOOL)clearFollowUp:(unsigned __int8)a3 activeAccount:(id)a4 error:(id *)a5
{
  uint64_t v6 = a3;
  id v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTFollowup createCDPFollowupContext:](self, "createCDPFollowupContext:", v6));
  if (qword_1002DEB70 != -1) {
    dispatch_once(&qword_1002DEB70, &stru_10028EFA8);
  }
  if (byte_1002DEB68)
  {
    objc_super v10 = sub_10001267C("followup");
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue([v8 altDSID]);
      v13 = (void *)objc_claimAutoreleasedReturnValue([v8 personaUniqueString]);
      int v25 = 138412546;
      v26 = v12;
      __int16 v27 = 2112;
      __int16 v28 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Setting altdsid (%@) on context for persona (%@)",  (uint8_t *)&v25,  0x16u);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue([v8 altDSID]);
    [v9 setAltDSID:v14];
  }

  if (!v9) {
    goto LABEL_16;
  }
  v15 = sub_10001267C("followup");
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    else {
      v17 = *(&off_1002903C8 + (v6 - 2));
    }
    int v25 = 138412290;
    v26 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Clearing follow ups (for Octagon) of type %@",  (uint8_t *)&v25,  0xCu);
  }

  unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(-[OTFollowup cdpd](self, "cdpd"));
  unsigned int v19 = [v18 clearFollowUpWithContext:v9 error:a5];

  if (v19)
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[OTFollowup postedCFUTypes](self, "postedCFUTypes"));
    v21 = v20;
    else {
      v22 = *(&off_1002903C8 + (v6 - 2));
    }
    [v20 removeObject:v22];

    BOOL v23 = 1;
  }

  else
  {
LABEL_16:
    BOOL v23 = 0;
  }

  return v23;
}

- (id)sysdiagnoseStatus
{
  if (objc_opt_class(&OBJC_CLASS___FLFollowUpController))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    id v3 = [[FLFollowUpController alloc] initWithClientIdentifier:0];
    id v23 = 0LL;
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 pendingFollowUpItems:&v23]);
    id v5 = v23;
    if (v5)
    {
      uint64_t v6 = sub_10001267C("octagon");
      uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v26 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Fetching pending follow ups failed with: %@",  buf,  0xCu);
      }

      id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 description]);
      [v2 setObject:v8 forKeyedSubscript:@"error"];
    }

    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id v9 = v4;
    id v10 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v20;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "notification", (void)v19));
          v16 = (void *)objc_claimAutoreleasedReturnValue([v15 creationDate]);

          v17 = (void *)objc_claimAutoreleasedReturnValue([v14 uniqueIdentifier]);
          [v2 setObject:v16 forKeyedSubscript:v17];
        }

        id v11 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }

      while (v11);
    }
  }

  else
  {
    v2 = 0LL;
  }

  return v2;
}

- (id)sfaStatus
{
  id v23 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if (objc_opt_class(&OBJC_CLASS___FLFollowUpController))
  {
    id v28 = 0LL;
    id v21 = [[FLFollowUpController alloc] initWithClientIdentifier:0];
    v2 = (void *)objc_claimAutoreleasedReturnValue([v21 pendingFollowUpItems:&v28]);
    id v3 = v28;
    if (v3)
    {
      id v4 = sub_10001267C("octagon");
      id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v31 = v3;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Fetching pending follow ups failed with: %@",  buf,  0xCu);
      }
    }

    __int128 v20 = v3;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    id obj = v2;
    id v6 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v25;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v25 != v8) {
            objc_enumerationMutation(obj);
          }
          id v10 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
          id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 notification]);
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 creationDate]);

          if (v12) {
            uint64_t v13 = (uint64_t)+[CKKSAnalytics fuzzyDaysSinceDate:](&OBJC_CLASS___CKKSAnalytics, "fuzzyDaysSinceDate:", v12);
          }
          else {
            uint64_t v13 = 10000LL;
          }
          v14 = (void *)objc_claimAutoreleasedReturnValue([v10 uniqueIdentifier]);
          v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"OACFU-%@",  v14));

          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v13));
          [v23 setObject:v16 forKeyedSubscript:v15];
        }

        id v7 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
      }

      while (v7);
    }

    v17 = sub_10001267C("octagon");
    unsigned int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v23;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Analytics CFUs are %@", buf, 0xCu);
    }
  }

  return v23;
}

- (OctagonFollowUpControllerProtocol)cdpd
{
  return (OctagonFollowUpControllerProtocol *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setCdpd:(id)a3
{
}

- (double)previousFollowupEnd
{
  return self->_previousFollowupEnd;
}

- (void)setPreviousFollowupEnd:(double)a3
{
  self->_previousFollowupEnd = a3;
}

- (double)followupStart
{
  return self->_followupStart;
}

- (void)setFollowupStart:(double)a3
{
  self->_followupStart = a3;
}

- (double)followupEnd
{
  return self->_followupEnd;
}

- (void)setFollowupEnd:(double)a3
{
  self->_followupEnd = a3;
}

- (NSMutableSet)postedCFUTypes
{
  return (NSMutableSet *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setPostedCFUTypes:(id)a3
{
}

- (void).cxx_destruct
{
}

- (BOOL)hasPosted:(unsigned __int8)a3
{
  int v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[OTFollowup postedCFUTypes](self, "postedCFUTypes"));
  id v5 = v4;
  else {
    id v6 = *(&off_1002903C8 + (v3 - 2));
  }
  unsigned __int8 v7 = [v4 containsObject:v6];

  return v7;
}

- (void)clearAllPostedFlags
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[OTFollowup postedCFUTypes](self, "postedCFUTypes"));
  [v2 removeAllObjects];
}

@end