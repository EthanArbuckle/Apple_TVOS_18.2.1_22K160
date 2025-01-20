@interface CPLSuggestionChange
- (void)fillCKRecordBuilder:(id)a3 scopeProvider:(id)a4;
- (void)fillWithCKRecord:(id)a3;
@end

@implementation CPLSuggestionChange

- (void)fillWithCKRecord:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = objc_msgSend( v4,  "cpl_legacyDecryptedObjectForKey:validateClass:",  @"title",  objc_opt_class(NSString));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  -[CPLSuggestionChange setTitle:](v5, "setTitle:", v7);

  id v8 = objc_msgSend( v4,  "cpl_legacyDecryptedObjectForKey:validateClass:",  @"subtitle",  objc_opt_class(NSString));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  -[CPLSuggestionChange setSubtitle:](v5, "setSubtitle:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"activationDate"]);
  -[CPLSuggestionChange setActivationDate:](v5, "setActivationDate:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"relevantUntilDate"]);
  -[CPLSuggestionChange setRelevantUntilDate:](v5, "setRelevantUntilDate:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"expungeDate"]);
  -[CPLSuggestionChange setExpungeDate:](v5, "setExpungeDate:", v12);

  id v13 = objc_msgSend(v4, "cpl_objectForKey:validateClass:", @"state", objc_opt_class(NSNumber));
  v14 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(v13);
  v15 = v14;
  if (!v14) {
    v14 = &off_10025A1A0;
  }
  -[CPLSuggestionChange setState:](v5, "setState:", (unsigned __int16)[v14 integerValue]);

  id v16 = objc_msgSend(v4, "cpl_objectForKey:validateClass:", @"type", objc_opt_class(NSNumber));
  v17 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(v16);
  v18 = v17;
  if (!v17) {
    v17 = &off_10025A1A0;
  }
  -[CPLSuggestionChange setType:](v5, "setType:", (unsigned __int16)[v17 integerValue]);

  id v19 = objc_msgSend(v4, "cpl_objectForKey:validateClass:", @"subtype", objc_opt_class(NSNumber));
  v20 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(v19);
  v21 = v20;
  if (!v20) {
    v20 = &off_10025A1A0;
  }
  -[CPLSuggestionChange setSubtype:](v5, "setSubtype:", (unsigned __int16)[v20 integerValue]);

  v22 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"createDate"]);
  -[CPLSuggestionChange setCreationDate:](v5, "setCreationDate:", v22);

  id v23 = objc_msgSend(v4, "cpl_objectForKey:validateClass:", @"version", objc_opt_class(NSNumber));
  v24 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(v23);
  v25 = v24;
  if (!v24) {
    v24 = &off_10025A1A0;
  }
  -[CPLSuggestionChange setVersion:](v5, "setVersion:", [v24 integerValue]);

  id v26 = objc_msgSend( v4,  "cpl_legacyDecryptedObjectForKey:validateClass:",  @"action",  objc_opt_class(NSData));
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  -[CPLSuggestionChange setActionData:](v5, "setActionData:", v27);

  id v28 = objc_msgSend( v4,  "cpl_legacyDecryptedObjectForKey:validateClass:",  @"features",  objc_opt_class(NSData));
  v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  -[CPLSuggestionChange setFeaturesData:](v5, "setFeaturesData:", v29);

  id v30 = objc_msgSend(v4, "cpl_objectForKey:validateClass:", @"assetList", objc_opt_class(NSData));
  uint64_t v31 = objc_claimAutoreleasedReturnValue(v30);
  v32 = (void *)v31;
  if (v31)
  {
    id v33 = [[CPLSuggestionRecordList alloc] initWithData:v31];
    [v33 setVersion:0];
    [v33 setHasVersion:0];
    -[CPLSuggestionChange setRecordList:](v5, "setRecordList:", v33);
  }

  else
  {
    if (_CPLSilentLogging) {
      goto LABEL_15;
    }
    uint64_t v34 = __CPLGenericOSLogDomain(0LL);
    id v33 = (id)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_ERROR))
    {
      int v38 = 138412290;
      id v39 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v33,  OS_LOG_TYPE_ERROR,  "Failed to find any assetListData for %@",  (uint8_t *)&v38,  0xCu);
    }
  }

LABEL_15:
  id v35 = objc_msgSend( v4,  "cpl_objectForKey:validateClass:",  @"notificationState",  objc_opt_class(NSNumber));
  v36 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(v35);
  v37 = v36;
  if (!v36) {
    v36 = &off_10025A1A0;
  }
  -[CPLSuggestionChange setNotificationState:]( v5,  "setNotificationState:",  (unsigned __int16)[v36 integerValue]);
}

- (void)fillCKRecordBuilder:(id)a3 scopeProvider:(id)a4
{
  id v24 = a3;
  id v6 = self;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a4 fingerprintContext]);
  if (-[CPLSuggestionChange hasChangeType:](v6, "hasChangeType:", 2LL))
  {
    if (-[CPLSuggestionChange shouldApplyPropertiesWithSelector:]( v6,  "shouldApplyPropertiesWithSelector:",  NSSelectorFromString(@"title")))
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLSuggestionChange title](v6, "title"));
      if (v8) {
        [v24 setLegacyEncryptedObject:v8 forKey:@"title"];
      }
    }

    if (-[CPLSuggestionChange shouldApplyPropertiesWithSelector:]( v6,  "shouldApplyPropertiesWithSelector:",  NSSelectorFromString(@"subtitle")))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLSuggestionChange subtitle](v6, "subtitle"));
      if (v9) {
        [v24 setLegacyEncryptedObject:v9 forKey:@"subtitle"];
      }
    }

    if (-[CPLSuggestionChange shouldApplyPropertiesWithSelector:]( v6,  "shouldApplyPropertiesWithSelector:",  NSSelectorFromString(@"activationDate")))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLSuggestionChange activationDate](v6, "activationDate"));
      if (v10) {
        [v24 setObject:v10 forKey:@"activationDate"];
      }
    }

    if (-[CPLSuggestionChange shouldApplyPropertiesWithSelector:]( v6,  "shouldApplyPropertiesWithSelector:",  NSSelectorFromString(@"relevantUntilDate")))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLSuggestionChange relevantUntilDate](v6, "relevantUntilDate"));
      if (v11) {
        [v24 setObject:v11 forKey:@"relevantUntilDate"];
      }
    }

    if (-[CPLSuggestionChange shouldApplyPropertiesWithSelector:]( v6,  "shouldApplyPropertiesWithSelector:",  NSSelectorFromString(@"expungeDate")))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLSuggestionChange expungeDate](v6, "expungeDate"));
      if (v12) {
        [v24 setObject:v12 forKey:@"expungeDate"];
      }
    }

    if (-[CPLSuggestionChange shouldApplyPropertiesWithSelector:]( v6,  "shouldApplyPropertiesWithSelector:",  NSSelectorFromString(@"state")))
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedShort:",  -[CPLSuggestionChange state](v6, "state")));
      [v24 setObject:v13 forKey:@"state"];
    }

    if (-[CPLSuggestionChange shouldApplyPropertiesWithSelector:]( v6,  "shouldApplyPropertiesWithSelector:",  NSSelectorFromString(@"type")))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedShort:",  -[CPLSuggestionChange type](v6, "type")));
      [v24 setObject:v14 forKey:@"type"];
    }

    if (-[CPLSuggestionChange shouldApplyPropertiesWithSelector:]( v6,  "shouldApplyPropertiesWithSelector:",  NSSelectorFromString(@"subtype")))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedShort:",  -[CPLSuggestionChange subtype](v6, "subtype")));
      [v24 setObject:v15 forKey:@"subtype"];
    }

    if (-[CPLSuggestionChange shouldApplyPropertiesWithSelector:]( v6,  "shouldApplyPropertiesWithSelector:",  NSSelectorFromString(@"creationDate")))
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CPLSuggestionChange creationDate](v6, "creationDate"));
      [v24 setObject:v16 forKey:@"createDate"];
    }

    if (-[CPLSuggestionChange shouldApplyPropertiesWithSelector:]( v6,  "shouldApplyPropertiesWithSelector:",  NSSelectorFromString(@"version")))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[CPLSuggestionChange version](v6, "version")));
      [v24 setObject:v17 forKey:@"version"];
    }

    if (-[CPLSuggestionChange shouldApplyPropertiesWithSelector:]( v6,  "shouldApplyPropertiesWithSelector:",  NSSelectorFromString(@"actionData")))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[CPLSuggestionChange actionData](v6, "actionData"));
      if (v18) {
        [v24 setLegacyEncryptedObject:v18 forKey:@"action"];
      }
    }

    if (-[CPLSuggestionChange shouldApplyPropertiesWithSelector:]( v6,  "shouldApplyPropertiesWithSelector:",  NSSelectorFromString(@"featuresData")))
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue(-[CPLSuggestionChange featuresData](v6, "featuresData"));
      if (v19) {
        [v24 setLegacyEncryptedObject:v19 forKey:@"features"];
      }
    }

    if (-[CPLSuggestionChange shouldApplyPropertiesWithSelector:]( v6,  "shouldApplyPropertiesWithSelector:",  NSSelectorFromString(@"recordList")))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[CPLSuggestionChange recordList](v6, "recordList"));
      v21 = v20;
      if (v20)
      {
        [v20 setVersion:kCPLSuggestionListCurrentVersion];
        v22 = (void *)objc_claimAutoreleasedReturnValue([v21 data]);
        [v24 setObject:v22 forKey:@"assetList"];
      }
    }

    if (-[CPLSuggestionChange shouldApplyPropertiesWithSelector:]( v6,  "shouldApplyPropertiesWithSelector:",  NSSelectorFromString(@"notificationState")))
    {
      id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedShort:",  -[CPLSuggestionChange notificationState](v6, "notificationState")));
      [v24 setObject:v23 forKey:@"notificationState"];
    }
  }
}

@end