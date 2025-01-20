@interface IXSAppDeletionEligibilityManager
+ (id)sharedInstance;
- (IXSAppDeletionEligibilityManager)init;
- (NSMutableDictionary)domainToEligibilityAnswerMap;
- (OS_dispatch_queue)internalQueue;
- (id)_domainToAppIdentitySetMap;
- (id)_systemAppPlaceholderEnumerator;
- (id)_testAppRemovabilityBundleID;
- (id)_test_domainToEligibilityAnswerMap;
- (unint64_t)_eligibilityAnswerForDomain:(unint64_t)a3;
- (void)_onQueue_enumerateSystemAppPlaceholdersAndSetAppRemovability:(id)a3;
- (void)_onQueue_processEligibilityDomainChange;
- (void)_onQueue_setAppRemovabilityForSystemAppPlaceholder:(id)a3;
- (void)_onQueue_setRemovabilityForAppWithIdentity:(id)a3 usingEligibilityAnswer:(unint64_t)a4;
- (void)_onQueue_updateRemovabilityForAppIdentities:(id)a3 usingEligibilityAnswer:(unint64_t)a4;
- (void)_test_modifyDomainToEligibilityAnswerMap:(id)a3;
- (void)eligibilityDidChange;
- (void)reconcileAppRemovabilityForSystemAppPlaceholders;
- (void)setDomainToEligibilityAnswerMap:(id)a3;
@end

@implementation IXSAppDeletionEligibilityManager

- (IXSAppDeletionEligibilityManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___IXSAppDeletionEligibilityManager;
  v2 = -[IXSAppDeletionEligibilityManager init](&v10, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.installcoordination.AppDeletionEligibilityManager.internal", v4);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v5;

    v7 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    domainToEligibilityAnswerMap = v2->_domainToEligibilityAnswerMap;
    v2->_domainToEligibilityAnswerMap = v7;
  }

  return v2;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000A060;
  block[3] = &unk_1000CCB20;
  block[4] = a1;
  if (qword_1000E8E38 != -1) {
    dispatch_once(&qword_1000E8E38, block);
  }
  return (id)qword_1000E8E30;
}

- (void)_onQueue_setRemovabilityForAppWithIdentity:(id)a3 usingEligibilityAnswer:(unint64_t)a4
{
  id v6 = a3;
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSAppDeletionEligibilityManager internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v7);

  if (a4 == 4) {
    unint64_t v8 = 1LL;
  }
  else {
    unint64_t v8 = 3LL;
  }
  v9 = IXStringForAppRemovability(v8);
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = sub_1000047B4((uint64_t)off_1000E8CA0);
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v20 = "-[IXSAppDeletionEligibilityManager _onQueue_setRemovabilityForAppWithIdentity:usingEligibilityAnswer:]";
    __int16 v21 = 2112;
    id v22 = v10;
    __int16 v23 = 2112;
    id v24 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s: Setting IXAppRemovability to %@ for %@",  buf,  0x20u);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[IXSAppRemovabilityManager sharedInstance](&OBJC_CLASS___IXSAppRemovabilityManager, "sharedInstance"));
  id v18 = 0LL;
  unsigned __int8 v14 = [v13 setRemovability:v8 forAppWithIdentity:v6 byClient:4 error:&v18];
  id v15 = v18;

  if ((v14 & 1) == 0)
  {
    v16 = sub_1000047B4((uint64_t)off_1000E8CA0);
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v20 = "-[IXSAppDeletionEligibilityManager _onQueue_setRemovabilityForAppWithIdentity:usingEligibilityAnswer:]";
      __int16 v21 = 2112;
      id v22 = v6;
      __int16 v23 = 2112;
      id v24 = v10;
      __int16 v25 = 2112;
      id v26 = v15;
      _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%s: Unable to set IXAppRemovability for %@ to %@: %@",  buf,  0x2Au);
    }
  }
}

- (void)_onQueue_updateRemovabilityForAppIdentities:(id)a3 usingEligibilityAnswer:(unint64_t)a4
{
  id v6 = a3;
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSAppDeletionEligibilityManager internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v7);

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000A2FC;
  v8[3] = &unk_1000CCEA8;
  v8[4] = self;
  v8[5] = a4;
  [v6 enumerateObjectsUsingBlock:v8];
}

- (unint64_t)_eligibilityAnswerForDomain:(unint64_t)a3
{
  unint64_t v9 = 0LL;
  int domain_answer = os_eligibility_get_domain_answer(a3, &v9, 0LL, 0LL, 0LL);
  if (domain_answer)
  {
    int v5 = domain_answer;
    id v6 = sub_1000047B4((uint64_t)off_1000E8CA0);
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100079BE8(v5, a3, v7);
    }
  }

  return v9;
}

- (id)_domainToAppIdentitySetMap
{
  dispatch_queue_attr_t v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[IXSAppDeletionEligibilityManager _systemAppPlaceholderEnumerator]( self,  "_systemAppPlaceholderEnumerator"));
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v21 objects:v31 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v22;
    *(void *)&__int128 v6 = 136315650LL;
    __int128 v19 = v6;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v4);
        }
        objc_super v10 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "eligibilityDeletionDomain", v19));
        if (v11)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue([v10 bundleIdentifier]);
          v13 = -[IXApplicationIdentity initWithBundleIdentifier:]( objc_alloc(&OBJC_CLASS___IXApplicationIdentity),  "initWithBundleIdentifier:",  v12);
          id v20 = 0LL;
          unsigned __int8 v14 = -[IXApplicationIdentity resolvePersonaWithError:](v13, "resolvePersonaWithError:", &v20);
          id v15 = v20;
          if ((v14 & 1) != 0)
          {
            v16 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", v11));
            if (!v16) {
              v16 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
            }
            -[NSMutableSet addObject:](v16, "addObject:", v13);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v16, v11);
          }

          else
          {
            v17 = sub_1000047B4((uint64_t)off_1000E8CA0);
            v16 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(v17);
            if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v19;
              id v26 = "-[IXSAppDeletionEligibilityManager _domainToAppIdentitySetMap]";
              __int16 v27 = 2112;
              v28 = v12;
              __int16 v29 = 2112;
              id v30 = v15;
              _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v16,  OS_LOG_TYPE_ERROR,  "%s: Failed to resolve persona for %@ : %@. Skipping without setting conditional removability",  buf,  0x20u);
            }
          }
        }
      }

      id v7 = [v4 countByEnumeratingWithState:&v21 objects:v31 count:16];
    }

    while (v7);
  }

  return v3;
}

- (void)_onQueue_processEligibilityDomainChange
{
  dispatch_queue_attr_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSAppDeletionEligibilityManager internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v3);

  uint64_t v13 = 0LL;
  unsigned __int8 v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  char v16 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IXSAppDeletionEligibilityManager _domainToAppIdentitySetMap](self, "_domainToAppIdentitySetMap"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXSAppDeletionEligibilityManager domainToEligibilityAnswerMap](self, "domainToEligibilityAnswerMap"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10000A910;
  v10[3] = &unk_1000CCED0;
  v10[4] = self;
  v12 = &v13;
  id v6 = v4;
  id v11 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:v10];

  if (*((_BYTE *)v14 + 24))
  {
    id v7 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[IXSAppDeletionEligibilityManager domainToEligibilityAnswerMap]( self,  "domainToEligibilityAnswerMap"));
      *(_DWORD *)buf = 136315394;
      id v18 = "-[IXSAppDeletionEligibilityManager _onQueue_processEligibilityDomainChange]";
      __int16 v19 = 2112;
      id v20 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s: Processed eligibility change : %@",  buf,  0x16u);
    }
  }

  _Block_object_dispose(&v13, 8);
}

- (void)eligibilityDidChange
{
  dispatch_queue_attr_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSAppDeletionEligibilityManager internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000AA90;
  block[3] = &unk_1000CCE58;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (void)_onQueue_setAppRemovabilityForSystemAppPlaceholder:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSAppDeletionEligibilityManager internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]);
  id v7 = -[IXApplicationIdentity initWithBundleIdentifier:]( objc_alloc(&OBJC_CLASS___IXApplicationIdentity),  "initWithBundleIdentifier:",  v6);
  id v18 = 0LL;
  unsigned __int8 v8 = -[IXApplicationIdentity resolvePersonaWithError:](v7, "resolvePersonaWithError:", &v18);
  id v9 = v18;
  if ((v8 & 1) != 0)
  {
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue([v4 eligibilityDeletionDomain]);
    id v11 = v10;
    if (v10)
    {
      unint64_t v12 = -[IXSAppDeletionEligibilityManager _eligibilityAnswerForDomain:]( self,  "_eligibilityAnswerForDomain:",  [v10 longLongValue]);
      if (v12)
      {
        unint64_t v13 = v12;
        unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v12));
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[IXSAppDeletionEligibilityManager domainToEligibilityAnswerMap]( self,  "domainToEligibilityAnswerMap"));
        [v15 setObject:v14 forKeyedSubscript:v11];

        -[IXSAppDeletionEligibilityManager _onQueue_setRemovabilityForAppWithIdentity:usingEligibilityAnswer:]( self,  "_onQueue_setRemovabilityForAppWithIdentity:usingEligibilityAnswer:",  v7,  v13);
      }
    }
  }

  else
  {
    char v16 = sub_1000047B4((uint64_t)off_1000E8CA0);
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100079C8C((uint64_t)v6, (uint64_t)v9, v17);
    }

    id v11 = 0LL;
  }
}

- (void)_onQueue_enumerateSystemAppPlaceholdersAndSetAppRemovability:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSAppDeletionEligibilityManager internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v5);

  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      objc_super v10 = 0LL;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[IXSAppDeletionEligibilityManager _onQueue_setAppRemovabilityForSystemAppPlaceholder:]( self,  "_onQueue_setAppRemovabilityForSystemAppPlaceholder:",  *(void *)(*((void *)&v11 + 1) + 8LL * (void)v10),  (void)v11);
        objc_super v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v8);
  }
}

- (id)_systemAppPlaceholderEnumerator
{
  return +[LSApplicationRecord systemPlaceholderEnumerator]( &OBJC_CLASS___LSApplicationRecord,  "systemPlaceholderEnumerator");
}

- (void)reconcileAppRemovabilityForSystemAppPlaceholders
{
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[IXSAppDeletionEligibilityManager _systemAppPlaceholderEnumerator]( self,  "_systemAppPlaceholderEnumerator"));
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSAppDeletionEligibilityManager internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000ADD0;
  block[3] = &unk_1000CCCB8;
  block[4] = self;
  id v7 = v3;
  id v5 = v3;
  dispatch_sync(v4, block);
}

- (id)_test_domainToEligibilityAnswerMap
{
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  objc_super v10 = sub_10000AEBC;
  __int128 v11 = sub_10000AECC;
  id v12 = 0LL;
  dispatch_queue_attr_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSAppDeletionEligibilityManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000AED4;
  v6[3] = &unk_1000CCEF8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = [(id)v8[5] copy];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)_testAppRemovabilityBundleID
{
  return 0LL;
}

- (void)_test_modifyDomainToEligibilityAnswerMap:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSAppDeletionEligibilityManager internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000AFC4;
  block[3] = &unk_1000CCCB8;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (NSMutableDictionary)domainToEligibilityAnswerMap
{
  return self->_domainToEligibilityAnswerMap;
}

- (void)setDomainToEligibilityAnswerMap:(id)a3
{
}

- (void).cxx_destruct
{
}

@end