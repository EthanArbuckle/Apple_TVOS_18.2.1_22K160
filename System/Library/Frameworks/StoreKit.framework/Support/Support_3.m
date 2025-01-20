void sub_1002623A4(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  os_log_s *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  v5 = *(void *)(a1 + 42);
  v6 = a2;
  v7 = (void *)objc_claimAutoreleasedReturnValue([(id)a1 transactionID]);
  v8 = [v7 hash];
  v9 = (void *)objc_claimAutoreleasedReturnValue([(id)a1 client]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 requestBundleID]);
  v11 = 138544130;
  v12 = v5;
  v13 = 2048;
  v14 = v8;
  v15 = 2114;
  v16 = v10;
  v17 = 2114;
  v18 = a3;
  _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "[%{public}@] Error finishing payment %lu for %{public}@ - %{public}@",  (uint8_t *)&v11,  0x2Au);
}

void sub_1002624BC(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 138543362;
  uint64_t v4 = a1;
  sub_100034550( (void *)&_mh_execute_header,  a2,  a3,  "[%{public}@]: Ignoring StoreKit message with invalid bundleID",  (uint8_t *)&v3);
}

void sub_100262528(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Failed to get the revoked product IDs from the push payload",  v1,  2u);
}

void sub_100262568(void *a1, void *a2)
{
  int v3 = a1;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a2 requestBundleID]);
  int v6 = 138543362;
  v7 = v4;
  sub_100034550( (void *)&_mh_execute_header,  v3,  v5,  "Failed to check messages for %{public}@, account has no DSID",  (uint8_t *)&v6);
}

void sub_100262608(uint64_t a1, os_log_s *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Authorization for user notifications denied: %{public}@",  (uint8_t *)&v2,  0xCu);
}

void sub_10026267C()
{
}

void sub_1002626DC()
{
}

void sub_10026273C()
{
}

void sub_10026279C()
{
}

void sub_1002627FC()
{
}

void sub_100262868(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a2;
  objc_opt_class(v2);
  sub_10000E8F8();
  __int16 v8 = 2048;
  uint64_t v9 = v4;
  id v6 = v5;
  _os_log_fault_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_FAULT,  "A consumer of type: %{public}@ was already registered for action type: %ld",  v7,  0x16u);

  sub_100008600();
}

void sub_100262918( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100262980(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  [a2 count];
  sub_10000E8F8();
  __int16 v7 = 2114;
  uint64_t v8 = a3;
  _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "%lu message(s) pending but no consumer available for action type: %{public}@",  v6,  0x16u);

  sub_100008600();
}

void sub_100262A20()
{
}

void sub_100262A80()
{
}

void sub_100262AE0()
{
}

void sub_100262B40()
{
  __int16 v3 = 2113;
  uint64_t v4 = v0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEBUG,  "Connection: %{public}@ received push with no DSID, active is: %{private}@",  v2,  0x16u);
  sub_10000DF54();
}

void sub_100262BBC()
{
}

void sub_100262C28()
{
}

void sub_100262C94()
{
}

void sub_100262D00()
{
}

void sub_100262D64()
{
}

void sub_100262DC8()
{
}

void sub_100262E2C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 42);
  uint64_t v4 = a2;
  int v6 = 138543618;
  uint64_t v7 = v3;
  __int16 v8 = 2114;
  id v9 = (id)objc_opt_class(a1);
  id v5 = v9;
  _os_log_error_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "[%{public}@] [%{public}@]: No storefront available for account.",  (uint8_t *)&v6,  0x16u);
}

void sub_100262EF0(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 42);
  int v6 = a2;
  int v8 = 138543874;
  uint64_t v9 = v5;
  __int16 v10 = 2114;
  id v11 = (id)objc_opt_class(a1);
  __int16 v12 = 2114;
  uint64_t v13 = a3;
  id v7 = v11;
  _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "[%{public}@] [%{public}@]: Invalid response for micro payment products request: %{public}@",  (uint8_t *)&v8,  0x20u);
}

void sub_100262FC0()
{
}

void sub_10026302C()
{
  __assert_rtn("ASDExtendedAttributeAtPath", "ASDExtendedAttributes.m", 16, "path != NULL");
}

void sub_100263054()
{
  __assert_rtn("ASDExtendedAttributeAtPath", "ASDExtendedAttributes.m", 17, "key != NULL");
}

void sub_10026307C()
{
}

void sub_1002630DC()
{
}

void sub_100263140()
{
}

void sub_1002631A4()
{
}

void sub_100263204(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = (void *)sub_100047968();
  sub_10006F17C(v5);
  id v6 = [(id)sub_100025AC0() hashedDescription];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  sub_1000502E4();
  _os_log_error_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_ERROR,  "[%{public}@] Current iTunes account has no DSID: %{public}@",  v8,  0x16u);

  sub_100008600();
}

void sub_1002632AC(void *a1)
{
  uint64_t v3 = (void *)sub_100047968();
  sub_10006F17C(v3);
  id v4 = [(id)sub_100025AC0() hashedDescription];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_1000502E4();
  sub_10006F168( (void *)&_mh_execute_header,  v6,  v7,  "[%@]: Should notify after iTunes account became active: %{public}@",  v8,  v9,  v10,  v11,  v12);

  sub_100008600();
}

void sub_100263340(void *a1)
{
  uint64_t v3 = (void *)sub_100047968();
  sub_10006F17C(v3);
  id v4 = [(id)sub_100025AC0() hashedDescription];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_1000502E4();
  sub_10006F168( (void *)&_mh_execute_header,  v6,  v7,  "[%@]: Should notify after iTunes account became inactive: %{public}@",  v8,  v9,  v10,  v11,  v12);

  sub_100008600();
}

void sub_1002633D4(void *a1)
{
  uint64_t v3 = (void *)sub_100047968();
  sub_10006F17C(v3);
  id v4 = [(id)sub_100025AC0() hashedDescription];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_1000502E4();
  sub_10006F168( (void *)&_mh_execute_header,  v6,  v7,  "[%@]: Should notify after iTunes account changed: %{public}@",  v8,  v9,  v10,  v11,  v12);

  sub_100008600();
}

void sub_100263468(void *a1, void *a2)
{
  uint64_t v3 = a1;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a2 bundleIdentifier]);
  int v5 = 138543362;
  uint64_t v6 = v4;
  _os_log_error_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "(LSBundleRecord) Couldn't create receiptURL, no dataContainerURL was returned: %{public}@",  (uint8_t *)&v5,  0xCu);
}

void sub_10026350C(void *a1, void *a2, uint64_t a3)
{
  int v5 = a1;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a2 client]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 callerBundleID]);
  int v8 = 138543618;
  uint64_t v9 = v7;
  __int16 v10 = 2114;
  uint64_t v11 = a3;
  _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "Failed to terminate client app %{public}@ for invalid receipt: %{public}@",  (uint8_t *)&v8,  0x16u);
}

void sub_1002635D8(uint64_t a1, os_log_s *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Encountered error opening store. Error: %{public}@",  (uint8_t *)&v2,  0xCu);
}

void sub_10026364C()
{
}

void sub_1002636C0()
{
}

void sub_100263724()
{
}

void sub_100263788(void *a1, uint64_t a2, uint64_t a3)
{
  int v5 = a1;
  uint64_t v6 = objc_opt_class(a2);
  int v7 = *(_DWORD *)(a3 + 40);
  int v8 = 138543618;
  uint64_t v9 = v6;
  __int16 v10 = 1024;
  int v11 = v7;
  _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "[%{public}@]: Connection interrupted for pid: %i",  (uint8_t *)&v8,  0x12u);
}

void sub_10026383C()
{
}

void sub_1002638A4()
{
}

void sub_10026390C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100263974( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1002639DC(uint64_t a1, uint64_t *a2, os_log_s *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *a2;
  int v5 = 138543618;
  uint64_t v6 = v3;
  __int16 v7 = 2114;
  uint64_t v8 = v4;
  sub_100018698( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "[%{public}@] Error downloading IAP asset: %{public}@",  (uint8_t *)&v5);
  sub_10000DF54();
}

void sub_100263A5C()
{
  id v2 = [(id)sub_100008624() logKey];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10001C8C4();
  sub_100018698((void *)&_mh_execute_header, v0, v4, "[%{public}@] Error removing download path %{public}@", v5);

  sub_100008600();
}

void sub_100263AE8(void *a1, void *a2, uint64_t a3)
{
  int v5 = (os_log_s *)sub_10001C8F4(a1);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a2 logKey]);
  int v8 = 138543618;
  uint64_t v9 = v6;
  __int16 v10 = 2114;
  uint64_t v11 = a3;
  sub_100018698( (void *)&_mh_execute_header,  v5,  v7,  "[%{public}@] Error installing IAP asset: %{public}@",  (uint8_t *)&v8);

  sub_100008600();
}

void sub_100263B90(void *a1, void *a2, int a3)
{
  int v5 = (os_log_s *)sub_10001C8F4(a1);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a2 logKey]);
  int v7 = 138543618;
  int v8 = v6;
  __int16 v9 = 1024;
  int v10 = a3;
  _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "[%{public}@] BOMCopier failed with error: %d",  (uint8_t *)&v7,  0x12u);

  sub_100008600();
}

void sub_100263C40()
{
  id v2 = [(id)sub_100008624() logKey];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10001C8C4();
  sub_100018698((void *)&_mh_execute_header, v0, v4, "[%{public}@] Error removing downloaded asset: %{public}@", v5);

  sub_100008600();
}

void sub_100263CCC()
{
  id v2 = [(id)sub_100008624() logKey];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10001C8C4();
  sub_100018698((void *)&_mh_execute_header, v0, v4, "[%{public}@] Error moving downloaded asset: %{public}@", v5);

  sub_100008600();
}

void sub_100263D58()
{
  id v2 = [(id)sub_100008624() logKey];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10001C8C4();
  sub_100018698( (void *)&_mh_execute_header,  v0,  v4,  "[%{public}@] Error creating IAP install directory: %{public}@",  v5);

  sub_100008600();
}

void sub_100263DE4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100263E18( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

id objc_msgSend_HTTPUserAgent(void *a1, const char *a2, ...)
{
  return _[a1 HTTPUserAgent];
}

id objc_msgSend_JSONObjectForColumnIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "JSONObjectForColumnIndex:");
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "JSONObjectWithData:options:error:");
}

id objc_msgSend_SQL(void *a1, const char *a2, ...)
{
  return _[a1 SQL];
}

id objc_msgSend_SQLForEntityClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "SQLForEntityClass:");
}

id objc_msgSend_SQLJoinClausesForEntityClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "SQLJoinClausesForEntityClass:");
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _[a1 URL];
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_URLByAppendingPathComponent_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:isDirectory:");
}

id objc_msgSend_URLByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathExtension:");
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 URLByDeletingLastPathComponent];
}

id objc_msgSend_URLForColumnIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLForColumnIndex:");
}

id objc_msgSend_URLForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLForKey:");
}

id objc_msgSend_URLQueryAllowedCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 URLQueryAllowedCharacterSet];
}

id objc_msgSend_URLResponse(void *a1, const char *a2, ...)
{
  return _[a1 URLResponse];
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDForColumnIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UUIDForColumnIndex:");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend__CFURLRequest(void *a1, const char *a2, ...)
{
  return _[a1 _CFURLRequest];
}

id objc_msgSend__URLRequestWithBag_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_URLRequestWithBag:error:");
}

id objc_msgSend__accountWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_accountWithError:");
}

id objc_msgSend__addKnownDatabasePath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addKnownDatabasePath:");
}

id objc_msgSend__aggregateValueForProperty_function_predicate_onConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_aggregateValueForProperty:function:predicate:onConnection:");
}

id objc_msgSend__apiVersionForClientDict_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_apiVersionForClientDict:");
}

id objc_msgSend__appDidLaunch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_appDidLaunch:");
}

id objc_msgSend__appTransactionSyncWithDialogContext_logKey_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_appTransactionSyncWithDialogContext:logKey:completionHandler:");
}

id objc_msgSend__asset_initializeConnectionPools(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_asset_initializeConnectionPools");
}

id objc_msgSend__asset_setConfigurationDefaults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_asset_setConfigurationDefaults");
}

id objc_msgSend__asset_setConfigurationUsingProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_asset_setConfigurationUsingProperties:");
}

id objc_msgSend__authenticateAccount_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_authenticateAccount:error:");
}

id objc_msgSend__authenticateAndRequestReceipt(void *a1, const char *a2, ...)
{
  return _[a1 _authenticateAndRequestReceipt];
}

id objc_msgSend__authenticateWithAccountInfo_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_authenticateWithAccountInfo:error:");
}

id objc_msgSend__authenticateWithDialogContext_logKey_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_authenticateWithDialogContext:logKey:completionHandler:");
}

id objc_msgSend__authorizationOptions(void *a1, const char *a2, ...)
{
  return _[a1 _authorizationOptions];
}

id objc_msgSend__baseQueryForKeyID_additionalCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_baseQueryForKeyID:additionalCapacity:");
}

id objc_msgSend__beginObservingAccountChangeNotification(void *a1, const char *a2, ...)
{
  return _[a1 _beginObservingAccountChangeNotification];
}

id objc_msgSend__beginSessionWithDPInfo_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_beginSessionWithDPInfo:error:");
}

id objc_msgSend__bomInstallFromPath_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_bomInstallFromPath:withError:");
}

id objc_msgSend__bootstrapFamilyIfNeededSuppressDialogs_logKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_bootstrapFamilyIfNeededSuppressDialogs:logKey:error:");
}

id objc_msgSend__buildMediaAPIURLWith_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_buildMediaAPIURLWith:error:");
}

id objc_msgSend__cacheFamilyInfoLookupResult_forAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cacheFamilyInfoLookupResult:forAccount:");
}

id objc_msgSend__cacheLegacyTransaction(void *a1, const char *a2, ...)
{
  return _[a1 _cacheLegacyTransaction];
}

id objc_msgSend__cacheLegacyTransactions_inDataStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cacheLegacyTransactions:inDataStore:");
}

id objc_msgSend__cachedFamilyInfoLookupResultForAccount_ignoreCacheTimeout_logKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cachedFamilyInfoLookupResultForAccount:ignoreCacheTimeout:logKey:");
}

id objc_msgSend__cachedLegacyTransactionsFromDataStore_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cachedLegacyTransactionsFromDataStore:error:");
}

id objc_msgSend__checkServerQueueAndCacheTransactionsWithDataStore_bag_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_checkServerQueueAndCacheTransactionsWithDataStore:bag:error:");
}

id objc_msgSend__checkTransactionAgeAndSyncWithLogKey_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_checkTransactionAgeAndSyncWithLogKey:completionHandler:");
}

id objc_msgSend__checkTransactionAgeOnReadQueueForStatusWithGroupID_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_checkTransactionAgeOnReadQueueForStatusWithGroupID:completionHandler:");
}

id objc_msgSend__clearCachedLegacyTransactionsWithLogKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clearCachedLegacyTransactionsWithLogKey:");
}

id objc_msgSend__clearFamily(void *a1, const char *a2, ...)
{
  return _[a1 _clearFamily];
}

id objc_msgSend__clientType(void *a1, const char *a2, ...)
{
  return _[a1 _clientType];
}

id objc_msgSend__close(void *a1, const char *a2, ...)
{
  return _[a1 _close];
}

id objc_msgSend__columnTypeForColumnIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_columnTypeForColumnIndex:");
}

id objc_msgSend__comparisonTypeString(void *a1, const char *a2, ...)
{
  return _[a1 _comparisonTypeString];
}

id objc_msgSend__completeNetworkActivityWithReason_usingTaskInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_completeNetworkActivityWithReason:usingTaskInfo:");
}

id objc_msgSend__configurationDirectoryPathForBundleID_percentEncoded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configurationDirectoryPathForBundleID:percentEncoded:");
}

id objc_msgSend__connectionForUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_connectionForUUID:");
}

id objc_msgSend__copyErrorForOSStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_copyErrorForOSStatus:");
}

id objc_msgSend__copyIAPProductAtPath_toPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_copyIAPProductAtPath:toPath:");
}

id objc_msgSend__copyTableClusteredValuesWithValues_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_copyTableClusteredValuesWithValues:");
}

id objc_msgSend__currentCachedFamilyInfoWithLogKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_currentCachedFamilyInfoWithLogKey:");
}

id objc_msgSend__currentTime(void *a1, const char *a2, ...)
{
  return _[a1 _currentTime];
}

id objc_msgSend__currentTimeSynchronized(void *a1, const char *a2, ...)
{
  return _[a1 _currentTimeSynchronized];
}

id objc_msgSend__dateFormatter(void *a1, const char *a2, ...)
{
  return _[a1 _dateFormatter];
}

id objc_msgSend__dateFromHeaderValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dateFromHeaderValue:");
}

id objc_msgSend__dateIntervalFrom_to_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dateIntervalFrom:to:");
}

id objc_msgSend__declaredTypeForColumnIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_declaredTypeForColumnIndex:");
}

id objc_msgSend__deleteConfigurationFileWithContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deleteConfigurationFileWithContext:");
}

id objc_msgSend__deleteDataWithContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deleteDataWithContext:");
}

id objc_msgSend__deleteRowFromTable_usingColumn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deleteRowFromTable:usingColumn:");
}

id objc_msgSend__dispatchCompletionBlock(void *a1, const char *a2, ...)
{
  return _[a1 _dispatchCompletionBlock];
}

id objc_msgSend__downloadedBytes_expectedBytes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_downloadedBytes:expectedBytes:");
}

id objc_msgSend__enumerateAllConnectionsWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_enumerateAllConnectionsWithBlock:");
}

id objc_msgSend__enumerateSubscriptionStatusForBundleID_alsoMatchingPredicate_ignoreEmptyStatus_usingBlock_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "_enumerateSubscriptionStatusForBundleID:alsoMatchingPredicate:ignoreEmptyStatus:usingBlock:");
}

id objc_msgSend__executeStatement_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_executeStatement:error:");
}

id objc_msgSend__executeWithError_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_executeWithError:usingBlock:");
}

id objc_msgSend__familyMembersFromDictionaryRepresentation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_familyMembersFromDictionaryRepresentation:");
}

id objc_msgSend__familyMembersSuppressDialogs_logKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_familyMembersSuppressDialogs:logKey:error:");
}

id objc_msgSend__finalizeAllStatements(void *a1, const char *a2, ...)
{
  return _[a1 _finalizeAllStatements];
}

id objc_msgSend__finalizeTaskWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_finalizeTaskWithError:");
}

id objc_msgSend__findSessionUsingTaskInfo_withProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_findSessionUsingTaskInfo:withProperties:");
}

id objc_msgSend__finishPromiseUsingTaskInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_finishPromiseUsingTaskInfo:");
}

id objc_msgSend__flushAfterTransactionBlocks(void *a1, const char *a2, ...)
{
  return _[a1 _flushAfterTransactionBlocks];
}

id objc_msgSend__flushPendingMessagesWithActionType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_flushPendingMessagesWithActionType:");
}

id objc_msgSend__fromDataStore_getCachedAccountToken_lastUpdated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fromDataStore:getCachedAccountToken:lastUpdated:");
}

id objc_msgSend__global(void *a1, const char *a2, ...)
{
  return _[a1 _global];
}

id objc_msgSend__hashBuffer_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_hashBuffer:length:");
}

id objc_msgSend__hashData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_hashData:");
}

id objc_msgSend__hashForServerDate_systemUptime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_hashForServerDate:systemUptime:");
}

id objc_msgSend__ignoreHasEverHadIAPsWithBag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_ignoreHasEverHadIAPsWithBag:");
}

id objc_msgSend__includeFinishedConsumables(void *a1, const char *a2, ...)
{
  return _[a1 _includeFinishedConsumables];
}

id objc_msgSend__init(void *a1, const char *a2, ...)
{
  return _[a1 _init];
}

id objc_msgSend__initWithCFURLRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initWithCFURLRequest:");
}

id objc_msgSend__initWithTargetURL_isContainer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initWithTargetURL:isContainer:");
}

id objc_msgSend__initializeConnectionsAndSkipEnvironmentCheck_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initializeConnectionsAndSkipEnvironmentCheck:");
}

id objc_msgSend__insertValues_intoTable_withPersistentID_onConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_insertValues:intoTable:withPersistentID:onConnection:");
}

id objc_msgSend__install(void *a1, const char *a2, ...)
{
  return _[a1 _install];
}

id objc_msgSend__installReceiptData_atBundlePath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_installReceiptData:atBundlePath:");
}

id objc_msgSend__invalidateLegacyTransactionCacheInDataStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_invalidateLegacyTransactionCacheInDataStore:");
}

id objc_msgSend__invalidateLegacyTransactionCacheInDataStore_bundleID_logKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_invalidateLegacyTransactionCacheInDataStore:bundleID:logKey:");
}

id objc_msgSend__invalidateUnfinishedTransactionsForBundleID_logKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_invalidateUnfinishedTransactionsForBundleID:logKey:");
}

id objc_msgSend__isClientValidForReview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isClientValidForReview:");
}

id objc_msgSend__isKnownDatabasePath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isKnownDatabasePath:");
}

id objc_msgSend__isUnifiedReceiptValidAndCurrentAtBundleURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isUnifiedReceiptValidAndCurrentAtBundleURL:");
}

id objc_msgSend__latestTransactionReceiptForUnarchivedRenewalInfo_subscriptionGroupID_bundleID_outProductID_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "_latestTransactionReceiptForUnarchivedRenewalInfo:subscriptionGroupID:bundleID:outProductID:");
}

id objc_msgSend__latestTransactionWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_latestTransactionWithCompletion:");
}

id objc_msgSend__lib_analyticsEventDictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lib_analyticsEventDictionary");
}

id objc_msgSend__lib_deleteLastValidComponentOfPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lib_deleteLastValidComponentOfPath:");
}

id objc_msgSend__lib_getBytes_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lib_getBytes:count:");
}

id objc_msgSend__lib_receiptName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lib_receiptName");
}

id objc_msgSend__lib_setAnalyticsEventDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lib_setAnalyticsEventDictionary:");
}

id objc_msgSend__loadMetadataFromBundleContainerURLWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadMetadataFromBundleContainerURLWithError:");
}

id objc_msgSend__loadMetadataFromExtendedAttributeWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadMetadataFromExtendedAttributeWithError:");
}

id objc_msgSend__loadMetadataWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadMetadataWithError:");
}

id objc_msgSend__loaderForApplicationRecord_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loaderForApplicationRecord:error:");
}

id objc_msgSend__localeIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 _localeIdentifier];
}

id objc_msgSend__logExitForMethod_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_logExitForMethod:context:");
}

id objc_msgSend__logState(void *a1, const char *a2, ...)
{
  return _[a1 _logState];
}

id objc_msgSend__mediaAPIFetchWith_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_mediaAPIFetchWith:error:");
}

id objc_msgSend__mediaClientIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 _mediaClientIdentifier];
}

id objc_msgSend__mediaPlatformString(void *a1, const char *a2, ...)
{
  return _[a1 _mediaPlatformString];
}

id objc_msgSend__messageForProtectionSpace_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_messageForProtectionSpace:");
}

id objc_msgSend__modifyUsingTransactionClass_withBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_modifyUsingTransactionClass:withBlock:");
}

id objc_msgSend__needsSubscriptionStatusSyncForStatusDictionary_logKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_needsSubscriptionStatusSyncForStatusDictionary:logKey:");
}

id objc_msgSend__newConnectionForEnvironment_dispatchQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_newConnectionForEnvironment:dispatchQueue:");
}

id objc_msgSend__newDataStore(void *a1, const char *a2, ...)
{
  return _[a1 _newDataStore];
}

id objc_msgSend__newProductIdentifierAllowedCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 _newProductIdentifierAllowedCharacterSet];
}

id objc_msgSend__newSelectSQLWithProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_newSelectSQLWithProperties:");
}

id objc_msgSend__newSelectSQLWithProperties_columns_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_newSelectSQLWithProperties:columns:");
}

id objc_msgSend__notificationCategories(void *a1, const char *a2, ...)
{
  return _[a1 _notificationCategories];
}

id objc_msgSend__notifyObserversDownloadStatusChanged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_notifyObserversDownloadStatusChanged:");
}

id objc_msgSend__open(void *a1, const char *a2, ...)
{
  return _[a1 _open];
}

id objc_msgSend__parseLegacyToMedia_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_parseLegacyToMedia:");
}

id objc_msgSend__parseMediaProducts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_parseMediaProducts:");
}

id objc_msgSend__parseResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_parseResponse:");
}

id objc_msgSend__parseResponse_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_parseResponse:error:");
}

id objc_msgSend__pathForCachedFamilyInfoLookupResult(void *a1, const char *a2, ...)
{
  return _[a1 _pathForCachedFamilyInfoLookupResult];
}

id objc_msgSend__pendingTransactionsCountWithParameters_requestEncoder_bag_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pendingTransactionsCountWithParameters:requestEncoder:bag:error:");
}

id objc_msgSend__pendingTransactionsResponseWithParameters_requestEncoder_bag_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pendingTransactionsResponseWithParameters:requestEncoder:bag:error:");
}

id objc_msgSend__performFamilyInfoRequestForAccount_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performFamilyInfoRequestForAccount:error:");
}

id objc_msgSend__performMigrationIfNeededForStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performMigrationIfNeededForStore:");
}

id objc_msgSend__performPurchase(void *a1, const char *a2, ...)
{
  return _[a1 _performPurchase];
}

id objc_msgSend__performResetAfterCorruptionError(void *a1, const char *a2, ...)
{
  return _[a1 _performResetAfterCorruptionError];
}

id objc_msgSend__persistentStatePath(void *a1, const char *a2, ...)
{
  return _[a1 _persistentStatePath];
}

id objc_msgSend__postAccountDidChangeFromOldAccount_withAccountStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_postAccountDidChangeFromOldAccount:withAccountStore:");
}

id objc_msgSend__predicateForKindOfClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_predicateForKindOfClass:");
}

id objc_msgSend__prepareStatement_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_prepareStatement:error:");
}

id objc_msgSend__presentSystemDialogWithTitle_dialogMessage_actionURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_presentSystemDialogWithTitle:dialogMessage:actionURL:");
}

id objc_msgSend__processDownloadsForTransactions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processDownloadsForTransactions:");
}

id objc_msgSend__processIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 _processIdentifiers];
}

id objc_msgSend__processPayment_excludeReceipt_privacyAcknowledgementRequired_forClient_apiVersion_paymentDelegate_isProcessingInterruptedBuy_reply_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "_processPayment:excludeReceipt:privacyAcknowledgementRequired:forClient:apiVersion:paymentDelegate:isProcessi ngInterruptedBuy:reply:");
}

id objc_msgSend__processPurchaseResult_authorizationResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processPurchaseResult:authorizationResult:");
}

id objc_msgSend__processURLResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processURLResult:");
}

id objc_msgSend__productIdentifierAllowedCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 _productIdentifierAllowedCharacterSet];
}

id objc_msgSend__propertyForKey_bundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_propertyForKey:bundleID:");
}

id objc_msgSend__pushHandlerWithBagContract_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pushHandlerWithBagContract:");
}

id objc_msgSend__queryDictionary(void *a1, const char *a2, ...)
{
  return _[a1 _queryDictionary];
}

id objc_msgSend__queuePendingMessage_withActionType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_queuePendingMessage:withActionType:");
}

id objc_msgSend__readState(void *a1, const char *a2, ...)
{
  return _[a1 _readState];
}

id objc_msgSend__readUsingSession_withBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_readUsingSession:withBlock:");
}

id objc_msgSend__reentrantSafePerformBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_reentrantSafePerformBlock:");
}

id objc_msgSend__refreshReceiptForBundleID_logKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_refreshReceiptForBundleID:logKey:");
}

id objc_msgSend__removeIAPProductAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeIAPProductAtPath:");
}

id objc_msgSend__removeKnownDatabasePath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeKnownDatabasePath:");
}

id objc_msgSend__replaceDate_ifBeforeDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_replaceDate:ifBeforeDate:");
}

id objc_msgSend__reportMetricsForTaskInfo_withCompletionError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_reportMetricsForTaskInfo:withCompletionError:");
}

id objc_msgSend__requestBatches_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_requestBatches:error:");
}

id objc_msgSend__requestBody(void *a1, const char *a2, ...)
{
  return _[a1 _requestBody];
}

id objc_msgSend__requestReceiptStringError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_requestReceiptStringError:");
}

id objc_msgSend__resetAfterCorruptionError(void *a1, const char *a2, ...)
{
  return _[a1 _resetAfterCorruptionError];
}

id objc_msgSend__resetAfterIOError(void *a1, const char *a2, ...)
{
  return _[a1 _resetAfterIOError];
}

id objc_msgSend__resetDecryptionBufferAndDigestVerifier(void *a1, const char *a2, ...)
{
  return _[a1 _resetDecryptionBufferAndDigestVerifier];
}

id objc_msgSend__resetLastUpdatedForLegacyTransactionsWithLogKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_resetLastUpdatedForLegacyTransactionsWithLogKey:");
}

id objc_msgSend__resizeSampleSizeArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_resizeSampleSizeArray:");
}

id objc_msgSend__runRequestWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_runRequestWithError:");
}

id objc_msgSend__saveValueToKeychain_forKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_saveValueToKeychain:forKey:error:");
}

id objc_msgSend__sendDownloadStatus(void *a1, const char *a2, ...)
{
  return _[a1 _sendDownloadStatus];
}

id objc_msgSend__serviceConnection(void *a1, const char *a2, ...)
{
  return _[a1 _serviceConnection];
}

id objc_msgSend__setRequiresShortConnectionTimeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setRequiresShortConnectionTimeout:");
}

id objc_msgSend__setTransactionInfo_unfinishedIDs_includesFinishedConsumables_forRevision_logKey_containsSubscriptions_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "_setTransactionInfo:unfinishedIDs:includesFinishedConsumables:forRevision:logKey:containsSubscriptions:");
}

id objc_msgSend__setUserVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setUserVersion:");
}

id objc_msgSend__shouldCheckServerQueueWithDataStore_bag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldCheckServerQueueWithDataStore:bag:");
}

id objc_msgSend__shouldNotifyChangeFromExistingAccount_toCurrentAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldNotifyChangeFromExistingAccount:toCurrentAccount:");
}

id objc_msgSend__silentAuthWithClientInfo_account_logKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_silentAuthWithClientInfo:account:logKey:");
}

id objc_msgSend__startNetworkActivityUsingTaskInfo_withTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startNetworkActivityUsingTaskInfo:withTask:");
}

id objc_msgSend__startObservingIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _startObservingIfNecessary];
}

id objc_msgSend__startTaskUsingTaskInfo_withRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startTaskUsingTaskInfo:withRequest:");
}

id objc_msgSend__statementForPreparedStatement_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_statementForPreparedStatement:error:");
}

id objc_msgSend__statusesForRenewalInfoBlob_subscriptionGroupID_bundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_statusesForRenewalInfoBlob:subscriptionGroupID:bundleID:");
}

id objc_msgSend__stopObservingIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _stopObservingIfNecessary];
}

id objc_msgSend__stringRepresentationForDigest_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stringRepresentationForDigest:length:");
}

id objc_msgSend__syncSubscriptionStatusWithReason_logKey_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_syncSubscriptionStatusWithReason:logKey:completionHandler:");
}

id objc_msgSend__syncTransactionsAndSubscriptionStatusWithReason_logKey_completionHandler_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_syncTransactionsAndSubscriptionStatusWithReason:logKey:completionHandler:");
}

id objc_msgSend__syncTransactionsWithReason_logKey_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_syncTransactionsWithReason:logKey:completionHandler:");
}

id objc_msgSend__synchronizeWithURLResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_synchronizeWithURLResult:");
}

id objc_msgSend__tcr_associateWithReader_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_tcr_associateWithReader:");
}

id objc_msgSend__tcr_associatedReader(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_tcr_associatedReader");
}

id objc_msgSend__tcr_valueOfClass_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_tcr_valueOfClass:forKey:");
}

id objc_msgSend__testingAppsDataWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_testingAppsDataWithError:");
}

id objc_msgSend__timeIntervalSinceLastServerResponse(void *a1, const char *a2, ...)
{
  return _[a1 _timeIntervalSinceLastServerResponse];
}

id objc_msgSend__titleForProtectionSpace_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_titleForProtectionSpace:");
}

id objc_msgSend__transactionsFromQueueCheckWithBag_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_transactionsFromQueueCheckWithBag:error:");
}

id objc_msgSend__transformedSQLForEntityClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_transformedSQLForEntityClass:");
}

id objc_msgSend__updateDownloadStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateDownloadStatus:");
}

id objc_msgSend__updateFamilyInfoFollowingAccountChangeIfNeeded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateFamilyInfoFollowingAccountChangeIfNeeded:");
}

id objc_msgSend__useVPPBagURL(void *a1, const char *a2, ...)
{
  return _[a1 _useVPPBagURL];
}

id objc_msgSend__validateAndResetDigestError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_validateAndResetDigestError:");
}

id objc_msgSend__validateMethodCall_context_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_validateMethodCall:context:error:");
}

id objc_msgSend__valueFromKeychainForKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_valueFromKeychainForKey:error:");
}

id objc_msgSend__verifiedStatementForPreparedStatement_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_verifiedStatementForPreparedStatement:error:");
}

id objc_msgSend__verifiedStatementForSQL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_verifiedStatementForSQL:error:");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return _[a1 absoluteString];
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return _[a1 account];
}

id objc_msgSend_accountID(void *a1, const char *a2, ...)
{
  return _[a1 accountID];
}

id objc_msgSend_accountMediaType(void *a1, const char *a2, ...)
{
  return _[a1 accountMediaType];
}

id objc_msgSend_accountTokenForBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountTokenForBundleID:");
}

id objc_msgSend_action(void *a1, const char *a2, ...)
{
  return _[a1 action];
}

id objc_msgSend_actionType(void *a1, const char *a2, ...)
{
  return _[a1 actionType];
}

id objc_msgSend_actionWithIdentifier_title_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionWithIdentifier:title:options:");
}

id objc_msgSend_actionWithTitle_identifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionWithTitle:identifier:");
}

id objc_msgSend_actionWithTitle_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionWithTitle:style:");
}

id objc_msgSend_activeAccount(void *a1, const char *a2, ...)
{
  return _[a1 activeAccount];
}

id objc_msgSend_activePort(void *a1, const char *a2, ...)
{
  return _[a1 activePort];
}

id objc_msgSend_addButtonAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addButtonAction:");
}

id objc_msgSend_addConnectionWithBundleID_connection_type_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addConnectionWithBundleID:connection:type:");
}

id objc_msgSend_addDownloadObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addDownloadObserver:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addErrorBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addErrorBlock:");
}

id objc_msgSend_addFinishBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addFinishBlock:");
}

id objc_msgSend_addFunction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addFunction:");
}

id objc_msgSend_addMessage_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addMessage:error:");
}

id objc_msgSend_addMessageInfo_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addMessageInfo:withError:");
}

id objc_msgSend_addMessageStatus_forBundleID_accountID_allowDeveloperControl_messageType_error_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addMessageStatus:forBundleID:accountID:allowDeveloperControl:messageType:error:");
}

id objc_msgSend_addNotificationRequest_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addNotificationRequest:withCompletionHandler:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addOperation:");
}

id objc_msgSend_addOperationWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addOperationWithBlock:");
}

id objc_msgSend_addRevocationInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRevocationInfo:");
}

id objc_msgSend_addTextField_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTextField:");
}

id objc_msgSend_addTimer_forMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTimer:forMode:");
}

id objc_msgSend_allConnections(void *a1, const char *a2, ...)
{
  return _[a1 allConnections];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_allOnConnection_predicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allOnConnection:predicate:");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allocWithZone:");
}

id objc_msgSend_allowDeveloperControl(void *a1, const char *a2, ...)
{
  return _[a1 allowDeveloperControl];
}

id objc_msgSend_allowsCellularAccess(void *a1, const char *a2, ...)
{
  return _[a1 allowsCellularAccess];
}

id objc_msgSend_allowsConstrainedNetworkAccess(void *a1, const char *a2, ...)
{
  return _[a1 allowsConstrainedNetworkAccess];
}

id objc_msgSend_allowsExpensiveNetworkAccess(void *a1, const char *a2, ...)
{
  return _[a1 allowsExpensiveNetworkAccess];
}

id objc_msgSend_allowsWatchCellularAccess(void *a1, const char *a2, ...)
{
  return _[a1 allowsWatchCellularAccess];
}

id objc_msgSend_alphanumericCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 alphanumericCharacterSet];
}

id objc_msgSend_alwaysUseLegacyAPIForStoreKitProductsRequest(void *a1, const char *a2, ...)
{
  return _[a1 alwaysUseLegacyAPIForStoreKitProductsRequest];
}

id objc_msgSend_ams_DSID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_DSID");
}

id objc_msgSend_ams_activeiCloudAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_activeiCloudAccount");
}

id objc_msgSend_ams_activeiTunesAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_activeiTunesAccount");
}

id objc_msgSend_ams_altDSID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_altDSID");
}

id objc_msgSend_ams_dictionaryByAddingEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_dictionaryByAddingEntriesFromDictionary:");
}

id objc_msgSend_ams_localiTunesAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_localiTunesAccount");
}

id objc_msgSend_ams_localiTunesAccountForAccountMediaType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_localiTunesAccountForAccountMediaType:");
}

id objc_msgSend_ams_secureTokenForAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_secureTokenForAccount:");
}

id objc_msgSend_ams_setNullableObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_setNullableObject:forKey:");
}

id objc_msgSend_ams_sharedAccountStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_sharedAccountStore");
}

id objc_msgSend_ams_sharedAccountStoreForMediaType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_sharedAccountStoreForMediaType:");
}

id objc_msgSend_ams_storefront(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_storefront");
}

id objc_msgSend_ams_storefrontForMediaType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_storefrontForMediaType:");
}

id objc_msgSend_anyOnConnection_predicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "anyOnConnection:predicate:");
}

id objc_msgSend_apiVersion(void *a1, const char *a2, ...)
{
  return _[a1 apiVersion];
}

id objc_msgSend_appDidLaunchWithBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appDidLaunchWithBundleID:");
}

id objc_msgSend_appLaunch(void *a1, const char *a2, ...)
{
  return _[a1 appLaunch];
}

id objc_msgSend_appRemovedWithBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appRemovedWithBundleID:");
}

id objc_msgSend_appTransactionForBundleID_bundleVersion_accountToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appTransactionForBundleID:bundleVersion:accountToken:");
}

id objc_msgSend_appTransactionWithDialogContext_ignoreCache_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appTransactionWithDialogContext:ignoreCache:completionHandler:");
}

id objc_msgSend_appendData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendData:");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendString:");
}

id objc_msgSend_applicationExtensionRecords(void *a1, const char *a2, ...)
{
  return _[a1 applicationExtensionRecords];
}

id objc_msgSend_applicationUsername(void *a1, const char *a2, ...)
{
  return _[a1 applicationUsername];
}

id objc_msgSend_applyBinding_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyBinding:atIndex:");
}

id objc_msgSend_applyTransformBinding_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyTransformBinding:atIndex:");
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_argumentCount(void *a1, const char *a2, ...)
{
  return _[a1 argumentCount];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObject:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_assetPromiseWithRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetPromiseWithRequest:");
}

id objc_msgSend_asset_backgroundSessionConfigurationUsingProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "asset_backgroundSessionConfigurationUsingProperties:");
}

id objc_msgSend_asset_cdnUUID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "asset_cdnUUID");
}

id objc_msgSend_asset_configurationIdentifierUsingProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "asset_configurationIdentifierUsingProperties:");
}

id objc_msgSend_asset_ephemeralSessionConfigurationUsingProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "asset_ephemeralSessionConfigurationUsingProperties:");
}

id objc_msgSend_asset_rangeOffset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "asset_rangeOffset");
}

id objc_msgSend_asset_setRangeOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "asset_setRangeOffset:");
}

id objc_msgSend_asset_statusCode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "asset_statusCode");
}

id objc_msgSend_attributesOfFileSystemForPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributesOfFileSystemForPath:error:");
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return _[a1 auditToken];
}

id objc_msgSend_authenticateAndSyncWithDialogContext_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "authenticateAndSyncWithDialogContext:completionHandler:");
}

id objc_msgSend_authorizationCredential(void *a1, const char *a2, ...)
{
  return _[a1 authorizationCredential];
}

id objc_msgSend_authorizationResult(void *a1, const char *a2, ...)
{
  return _[a1 authorizationResult];
}

id objc_msgSend_autoupdatingCurrentLocale(void *a1, const char *a2, ...)
{
  return _[a1 autoupdatingCurrentLocale];
}

id objc_msgSend_availableDiskSpaceAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "availableDiskSpaceAtPath:");
}

id objc_msgSend_backgroundSessionConfigurationWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundSessionConfigurationWithIdentifier:");
}

id objc_msgSend_bag(void *a1, const char *a2, ...)
{
  return _[a1 bag];
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "base64EncodedStringWithOptions:");
}

id objc_msgSend_bindArray_atPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bindArray:atPosition:");
}

id objc_msgSend_bindData_atPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bindData:atPosition:");
}

id objc_msgSend_bindDictionary_atPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bindDictionary:atPosition:");
}

id objc_msgSend_bindDouble_atPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bindDouble:atPosition:");
}

id objc_msgSend_bindInt64_atPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bindInt64:atPosition:");
}

id objc_msgSend_bindNullAtPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bindNullAtPosition:");
}

id objc_msgSend_bindNumber_atPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bindNumber:atPosition:");
}

id objc_msgSend_bindString_atPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bindString:atPosition:");
}

id objc_msgSend_bindUUID_atPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bindUUID:atPosition:");
}

id objc_msgSend_bodyData(void *a1, const char *a2, ...)
{
  return _[a1 bodyData];
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bundleContainerURL(void *a1, const char *a2, ...)
{
  return _[a1 bundleContainerURL];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return _[a1 bundleID];
}

id objc_msgSend_bundleIDData(void *a1, const char *a2, ...)
{
  return _[a1 bundleIDData];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_bundleRecordWithBundleIdentifier_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleRecordWithBundleIdentifier:allowPlaceholder:error:");
}

id objc_msgSend_bundleVersion(void *a1, const char *a2, ...)
{
  return _[a1 bundleVersion];
}

id objc_msgSend_bundleWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleWithIdentifier:");
}

id objc_msgSend_bundleWithURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleWithURL:");
}

id objc_msgSend_buyParameters(void *a1, const char *a2, ...)
{
  return _[a1 buyParameters];
}

id objc_msgSend_buyParams_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buyParams:completionHandler:");
}

id objc_msgSend_buyParamsWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buyParamsWithString:");
}

id objc_msgSend_buyProductWithConfiguration_withContext_withReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buyProductWithConfiguration:withContext:withReply:");
}

id objc_msgSend_buyProductWithConfiguration_withReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buyProductWithConfiguration:withReply:");
}

id objc_msgSend_buyProductWithID_bundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buyProductWithID:bundleID:");
}

id objc_msgSend_buyProductWithID_withContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buyProductWithID:withContext:");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _[a1 bytes];
}

id objc_msgSend_bytesPerSecondLimit(void *a1, const char *a2, ...)
{
  return _[a1 bytesPerSecondLimit];
}

id objc_msgSend_bytesReceived(void *a1, const char *a2, ...)
{
  return _[a1 bytesReceived];
}

id objc_msgSend_bytesValidated(void *a1, const char *a2, ...)
{
  return _[a1 bytesValidated];
}

id objc_msgSend_cacheIncludesFinishedConsumablesForBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cacheIncludesFinishedConsumablesForBundleID:");
}

id objc_msgSend_cacheLegacyTransactionsForBundleID_transactions_logKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cacheLegacyTransactionsForBundleID:transactions:logKey:");
}

id objc_msgSend_cacheSize(void *a1, const char *a2, ...)
{
  return _[a1 cacheSize];
}

id objc_msgSend_cachedFamilyInfoWithLogKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cachedFamilyInfoWithLogKey:");
}

id objc_msgSend_cachedSession_maximumWatchCellularTransferSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cachedSession:maximumWatchCellularTransferSize:");
}

id objc_msgSend_callerBundleID(void *a1, const char *a2, ...)
{
  return _[a1 callerBundleID];
}

id objc_msgSend_callerBundleURL(void *a1, const char *a2, ...)
{
  return _[a1 callerBundleURL];
}

id objc_msgSend_canCreatePayload(void *a1, const char *a2, ...)
{
  return _[a1 canCreatePayload];
}

id objc_msgSend_canMakePayments(void *a1, const char *a2, ...)
{
  return _[a1 canMakePayments];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return _[a1 cancel];
}

id objc_msgSend_cancelDownloadWithID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelDownloadWithID:");
}

id objc_msgSend_cancelTransactionWithIdentifier_forBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelTransactionWithIdentifier:forBundleID:");
}

id objc_msgSend_categoryIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 categoryIdentifier];
}

id objc_msgSend_categoryWithIdentifier_actions_intentIdentifiers_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "categoryWithIdentifier:actions:intentIdentifiers:options:");
}

id objc_msgSend_changeAutoRenewStatus_transactionID_bundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "changeAutoRenewStatus:transactionID:bundleID:");
}

id objc_msgSend_changeAutoRenewStatus_withContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "changeAutoRenewStatus:withContext:");
}

id objc_msgSend_characterSetWithCharactersInString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characterSetWithCharactersInString:");
}

id objc_msgSend_checkForMessages(void *a1, const char *a2, ...)
{
  return _[a1 checkForMessages];
}

id objc_msgSend_checkPendingQueue(void *a1, const char *a2, ...)
{
  return _[a1 checkPendingQueue];
}

id objc_msgSend_checkServerQueueForClientIfNecessary_forceCheck_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkServerQueueForClientIfNecessary:forceCheck:reply:");
}

id objc_msgSend_checkServerQueueForQueue_withClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkServerQueueForQueue:withClient:");
}

id objc_msgSend_chunkDigests(void *a1, const char *a2, ...)
{
  return _[a1 chunkDigests];
}

id objc_msgSend_chunkSize(void *a1, const char *a2, ...)
{
  return _[a1 chunkSize];
}

id objc_msgSend_chunkType(void *a1, const char *a2, ...)
{
  return _[a1 chunkType];
}

id objc_msgSend_clearBindings(void *a1, const char *a2, ...)
{
  return _[a1 clearBindings];
}

id objc_msgSend_clearLegacyTransactionsLastUpdatedForBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearLegacyTransactionsLastUpdatedForBundleID:");
}

id objc_msgSend_clearOverridesForBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearOverridesForBundleID:");
}

id objc_msgSend_clearOverridesWithContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearOverridesWithContext:");
}

id objc_msgSend_clearTransactionCache(void *a1, const char *a2, ...)
{
  return _[a1 clearTransactionCache];
}

id objc_msgSend_clearTransactions(void *a1, const char *a2, ...)
{
  return _[a1 clearTransactions];
}

id objc_msgSend_client(void *a1, const char *a2, ...)
{
  return _[a1 client];
}

id objc_msgSend_clientID(void *a1, const char *a2, ...)
{
  return _[a1 clientID];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return _[a1 close];
}

id objc_msgSend_closeAndReturnError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "closeAndReturnError:");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_column_existsInTable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "column:existsInTable:");
}

id objc_msgSend_columnIndexForColumnName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "columnIndexForColumnName:");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:");
}

id objc_msgSend_compare_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:options:");
}

id objc_msgSend_comparisonType(void *a1, const char *a2, ...)
{
  return _[a1 comparisonType];
}

id objc_msgSend_completeAskToBuyRequestWithResponse_transactionID_forBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "completeAskToBuyRequestWithResponse:transactionID:forBundleID:");
}

id objc_msgSend_completeAskToBuyRequestWithResponse_withContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "completeAskToBuyRequestWithResponse:withContext:");
}

id objc_msgSend_completePriceConsentRequestWithResponse_transactionIdentifier_forBundleID_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "completePriceConsentRequestWithResponse:transactionIdentifier:forBundleID:");
}

id objc_msgSend_completeWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "completeWithError:");
}

id objc_msgSend_completeWithSuccess(void *a1, const char *a2, ...)
{
  return _[a1 completeWithSuccess];
}

id objc_msgSend_completedUnitCount(void *a1, const char *a2, ...)
{
  return _[a1 completedUnitCount];
}

id objc_msgSend_completionBlock(void *a1, const char *a2, ...)
{
  return _[a1 completionBlock];
}

id objc_msgSend_completionHandlerAdapter(void *a1, const char *a2, ...)
{
  return _[a1 completionHandlerAdapter];
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_componentsSeparatedByCharactersInSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByCharactersInSet:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_componentsWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsWithString:");
}

id objc_msgSend_componentsWithURL_resolvingAgainstBaseURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsWithURL:resolvingAgainstBaseURL:");
}

id objc_msgSend_composingTransforms_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "composingTransforms:");
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return _[a1 configuration];
}

id objc_msgSend_configurationDataForBundleID_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationDataForBundleID:error:");
}

id objc_msgSend_configurationID(void *a1, const char *a2, ...)
{
  return _[a1 configurationID];
}

id objc_msgSend_configureWithClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureWithClient:");
}

id objc_msgSend_configureWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureWithError:");
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conformsToProtocol:");
}

id objc_msgSend_connectEndDate(void *a1, const char *a2, ...)
{
  return _[a1 connectEndDate];
}

id objc_msgSend_connectStartDate(void *a1, const char *a2, ...)
{
  return _[a1 connectStartDate];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return _[a1 connection];
}

id objc_msgSend_connectionForClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectionForClient:");
}

id objc_msgSend_connectionNeedsResetForCorruption_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectionNeedsResetForCorruption:");
}

id objc_msgSend_connectionNeedsResetForReopen_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectionNeedsResetForReopen:");
}

id objc_msgSend_connectionPointer(void *a1, const char *a2, ...)
{
  return _[a1 connectionPointer];
}

id objc_msgSend_connectionPool(void *a1, const char *a2, ...)
{
  return _[a1 connectionPool];
}

id objc_msgSend_connectionsForBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectionsForBundleID:");
}

id objc_msgSend_consumeData_andWaitWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "consumeData:andWaitWithCompletionHandler:");
}

id objc_msgSend_consumeData_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "consumeData:withCompletionHandler:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsPredicateWithProperty_values_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsPredicateWithProperty:values:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsString:");
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return _[a1 content];
}

id objc_msgSend_contextWithBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contextWithBundleID:");
}

id objc_msgSend_contextWithBundleID_transactionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contextWithBundleID:transactionID:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_copyIAPProductAtPath_toPath_withReplyHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyIAPProductAtPath:toPath:withReplyHandler:");
}

id objc_msgSend_copyRequestProperties(void *a1, const char *a2, ...)
{
  return _[a1 copyRequestProperties];
}

id objc_msgSend_copySelectSQLWithProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copySelectSQLWithProperties:");
}

id objc_msgSend_copyWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyWithZone:");
}

id objc_msgSend_correlationID(void *a1, const char *a2, ...)
{
  return _[a1 correlationID];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_countForObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countForObject:");
}

id objc_msgSend_countOfBytesExpectedToReceive(void *a1, const char *a2, ...)
{
  return _[a1 countOfBytesExpectedToReceive];
}

id objc_msgSend_countOfBytesReceived(void *a1, const char *a2, ...)
{
  return _[a1 countOfBytesReceived];
}

id objc_msgSend_countOfResponseBodyBytesReceived(void *a1, const char *a2, ...)
{
  return _[a1 countOfResponseBodyBytesReceived];
}

id objc_msgSend_countryCode(void *a1, const char *a2, ...)
{
  return _[a1 countryCode];
}

id objc_msgSend_createActivityGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createActivityGroup:");
}

id objc_msgSend_createAppReceiptURL(void *a1, const char *a2, ...)
{
  return _[a1 createAppReceiptURL];
}

id objc_msgSend_createDeviceIdentifierWithVendorName_bundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDeviceIdentifierWithVendorName:bundleIdentifier:");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createOrMigrateStoreUsingSchema_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createOrMigrateStoreUsingSchema:");
}

id objc_msgSend_createPayload(void *a1, const char *a2, ...)
{
  return _[a1 createPayload];
}

id objc_msgSend_createVPPReceiptURL(void *a1, const char *a2, ...)
{
  return _[a1 createVPPReceiptURL];
}

id objc_msgSend_creationDate(void *a1, const char *a2, ...)
{
  return _[a1 creationDate];
}

id objc_msgSend_currentAccountToken(void *a1, const char *a2, ...)
{
  return _[a1 currentAccountToken];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return _[a1 currentConnection];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return _[a1 currentLocale];
}

id objc_msgSend_currentProcess(void *a1, const char *a2, ...)
{
  return _[a1 currentProcess];
}

id objc_msgSend_currentRequest(void *a1, const char *a2, ...)
{
  return _[a1 currentRequest];
}

id objc_msgSend_currentRevisionForBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentRevisionForBundleID:");
}

id objc_msgSend_currentSchemaVersion(void *a1, const char *a2, ...)
{
  return _[a1 currentSchemaVersion];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _[a1 data];
}

id objc_msgSend_dataConsumer(void *a1, const char *a2, ...)
{
  return _[a1 dataConsumer];
}

id objc_msgSend_dataContainerURL(void *a1, const char *a2, ...)
{
  return _[a1 dataContainerURL];
}

id objc_msgSend_dataForColumnIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataForColumnIndex:");
}

id objc_msgSend_dataTaskPromiseWithRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataTaskPromiseWithRequest:");
}

id objc_msgSend_dataTaskWithRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataTaskWithRequest:");
}

id objc_msgSend_dataTaskWithRequest_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataTaskWithRequest:completionHandler:");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithBytesNoCopy:length:freeWhenDone:");
}

id objc_msgSend_dataWithContentsOfURL_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithContentsOfURL:options:error:");
}

id objc_msgSend_dataWithJSONObject_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithJSONObject:options:error:");
}

id objc_msgSend_dataWithPropertyList_format_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithPropertyList:format:options:error:");
}

id objc_msgSend_databaseEntityClass(void *a1, const char *a2, ...)
{
  return _[a1 databaseEntityClass];
}

id objc_msgSend_databaseID(void *a1, const char *a2, ...)
{
  return _[a1 databaseID];
}

id objc_msgSend_databasePath(void *a1, const char *a2, ...)
{
  return _[a1 databasePath];
}

id objc_msgSend_databasePathsForBundleID_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "databasePathsForBundleID:error:");
}

id objc_msgSend_databaseStore(void *a1, const char *a2, ...)
{
  return _[a1 databaseStore];
}

id objc_msgSend_databaseTable(void *a1, const char *a2, ...)
{
  return _[a1 databaseTable];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateByAddingTimeInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateByAddingTimeInterval:");
}

id objc_msgSend_dateForColumnIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateForColumnIndex:");
}

id objc_msgSend_dateFromString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateFromString:");
}

id objc_msgSend_dateWithTimeIntervalSince1970_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSince1970:");
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceReferenceDate:");
}

id objc_msgSend_decodeBoolForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeBoolForKey:");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_decodeObjectOfClasses_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClasses:forKey:");
}

id objc_msgSend_defaultBag(void *a1, const char *a2, ...)
{
  return _[a1 defaultBag];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_defaultProperties(void *a1, const char *a2, ...)
{
  return _[a1 defaultProperties];
}

id objc_msgSend_defaultService(void *a1, const char *a2, ...)
{
  return _[a1 defaultService];
}

id objc_msgSend_defaultSession(void *a1, const char *a2, ...)
{
  return _[a1 defaultSession];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return _[a1 defaultWorkspace];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_deleteAllEntities(void *a1, const char *a2, ...)
{
  return _[a1 deleteAllEntities];
}

id objc_msgSend_deleteAllTransactionsForBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteAllTransactionsForBundleID:");
}

id objc_msgSend_deleteAllTransactionsWithContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteAllTransactionsWithContext:");
}

id objc_msgSend_deleteDataWithContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteDataWithContext:");
}

id objc_msgSend_deleteFromDatabase(void *a1, const char *a2, ...)
{
  return _[a1 deleteFromDatabase];
}

id objc_msgSend_deleteTransactionWithIdentifier_forBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteTransactionWithIdentifier:forBundleID:");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_deviceGUID(void *a1, const char *a2, ...)
{
  return _[a1 deviceGUID];
}

id objc_msgSend_deviceVendorID(void *a1, const char *a2, ...)
{
  return _[a1 deviceVendorID];
}

id objc_msgSend_dialogContext(void *a1, const char *a2, ...)
{
  return _[a1 dialogContext];
}

id objc_msgSend_dialogRequestWithTitle_dialogMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dialogRequestWithTitle:dialogMessage:");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 dictionaryRepresentation];
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithCapacity:");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dictionaryWithSharedKeySet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithSharedKeySet:");
}

id objc_msgSend_disambiguatedSQLForProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disambiguatedSQLForProperty:");
}

id objc_msgSend_discretionaryType(void *a1, const char *a2, ...)
{
  return _[a1 discretionaryType];
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return _[a1 distantPast];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_domainLookupEndDate(void *a1, const char *a2, ...)
{
  return _[a1 domainLookupEndDate];
}

id objc_msgSend_domainLookupStartDate(void *a1, const char *a2, ...)
{
  return _[a1 domainLookupStartDate];
}

id objc_msgSend_doubleForColumnIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doubleForColumnIndex:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_downloadAdded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadAdded:");
}

id objc_msgSend_downloadID(void *a1, const char *a2, ...)
{
  return _[a1 downloadID];
}

id objc_msgSend_downloadManager_updatedStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadManager:updatedStatus:");
}

id objc_msgSend_downloadRemoved_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadRemoved:");
}

id objc_msgSend_downloadStatusChanged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadStatusChanged:");
}

id objc_msgSend_duetBudgetingIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 duetBudgetingIdentifier];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return _[a1 duration];
}

id objc_msgSend_eligibilityBasedOnStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eligibilityBasedOnStatus:");
}

id objc_msgSend_encodeBool_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeBool:forKey:");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_encryptionKeyId(void *a1, const char *a2, ...)
{
  return _[a1 encryptionKeyId];
}

id objc_msgSend_enforceATS(void *a1, const char *a2, ...)
{
  return _[a1 enforceATS];
}

id objc_msgSend_enqueueEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enqueueEvent:");
}

id objc_msgSend_ensureAvailableDiskSpace_atPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ensureAvailableDiskSpace:atPath:");
}

id objc_msgSend_entityClass(void *a1, const char *a2, ...)
{
  return _[a1 entityClass];
}

id objc_msgSend_enumerateCurrentReceiptsForProductID_bundleID_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateCurrentReceiptsForProductID:bundleID:usingBlock:");
}

id objc_msgSend_enumerateCurrentReceiptsForProductID_usingBlock_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateCurrentReceiptsForProductID:usingBlock:completionHandler:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateMemoryEntitiesUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateMemoryEntitiesUsingBlock:");
}

id objc_msgSend_enumerateMemoryEntitiesWithProperties_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateMemoryEntitiesWithProperties:usingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_enumeratePersistentIDsAndProperties_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumeratePersistentIDsAndProperties:usingBlock:");
}

id objc_msgSend_enumeratePersistentIDsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumeratePersistentIDsUsingBlock:");
}

id objc_msgSend_enumerateReceiptsForProductID_bundleID_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateReceiptsForProductID:bundleID:usingBlock:");
}

id objc_msgSend_enumerateReceiptsForProductID_usingBlock_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateReceiptsForProductID:usingBlock:completionHandler:");
}

id objc_msgSend_enumerateReceiptsForSubscriptionsInGracePeriodForBundleID_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateReceiptsForSubscriptionsInGracePeriodForBundleID:usingBlock:");
}

id objc_msgSend_enumerateRowsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateRowsUsingBlock:");
}

id objc_msgSend_enumerateSubscriptionStatusForBundleID_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateSubscriptionStatusForBundleID:usingBlock:");
}

id objc_msgSend_enumerateSubscriptionStatusUsingBlock_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateSubscriptionStatusUsingBlock:completionHandler:");
}

id objc_msgSend_enumerateUnfinishedTransactionReceiptsForBundleID_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateUnfinishedTransactionReceiptsForBundleID:usingBlock:");
}

id objc_msgSend_enumerateUnfinishedTransactionsUsingBlock_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateUnfinishedTransactionsUsingBlock:completionHandler:");
}

id objc_msgSend_enumeratorForObjectsOfClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumeratorForObjectsOfClass:");
}

id objc_msgSend_ephemeralSessionConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 ephemeralSessionConfiguration];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return _[a1 error];
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_estimatedTimeRemaining(void *a1, const char *a2, ...)
{
  return _[a1 estimatedTimeRemaining];
}

id objc_msgSend_eventBody(void *a1, const char *a2, ...)
{
  return _[a1 eventBody];
}

id objc_msgSend_eventName(void *a1, const char *a2, ...)
{
  return _[a1 eventName];
}

id objc_msgSend_exceptionWithName_reason_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exceptionWithName:reason:userInfo:");
}

id objc_msgSend_execute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "execute:");
}

id objc_msgSend_executePreparedStatement_error_bindings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executePreparedStatement:error:bindings:");
}

id objc_msgSend_executeQuery_withResults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeQuery:withResults:");
}

id objc_msgSend_executeStatement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeStatement:");
}

id objc_msgSend_executeStatement_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeStatement:error:");
}

id objc_msgSend_executeStatement_error_bindings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeStatement:error:bindings:");
}

id objc_msgSend_executeWithError_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeWithError:usingBlock:");
}

id objc_msgSend_existsInDatabase(void *a1, const char *a2, ...)
{
  return _[a1 existsInDatabase];
}

id objc_msgSend_expectedContentLength(void *a1, const char *a2, ...)
{
  return _[a1 expectedContentLength];
}

id objc_msgSend_expirationDate(void *a1, const char *a2, ...)
{
  return _[a1 expirationDate];
}

id objc_msgSend_expireOrRenewSubscriptionWithIdentifier_expire_forBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "expireOrRenewSubscriptionWithIdentifier:expire:forBundleID:");
}

id objc_msgSend_expireOrRenewSubscriptionWithIdentifier_expire_withContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "expireOrRenewSubscriptionWithIdentifier:expire:withContext:");
}

id objc_msgSend_externalID(void *a1, const char *a2, ...)
{
  return _[a1 externalID];
}

id objc_msgSend_externalPropertyValues(void *a1, const char *a2, ...)
{
  return _[a1 externalPropertyValues];
}

id objc_msgSend_extractJSONAtKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extractJSONAtKey:");
}

id objc_msgSend_extractJWSPayload(void *a1, const char *a2, ...)
{
  return _[a1 extractJWSPayload];
}

id objc_msgSend_fairplayContextWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fairplayContextWithError:");
}

id objc_msgSend_familyID(void *a1, const char *a2, ...)
{
  return _[a1 familyID];
}

id objc_msgSend_familyMembers(void *a1, const char *a2, ...)
{
  return _[a1 familyMembers];
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileExistsAtPath_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:isDirectory:");
}

id objc_msgSend_fileHandleForUpdatingAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileHandleForUpdatingAtPath:");
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 fileSystemRepresentation];
}

id objc_msgSend_fileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:isDirectory:");
}

id objc_msgSend_filterWithKeyPath_comparison_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filterWithKeyPath:comparison:value:");
}

id objc_msgSend_filterWithKeyPath_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filterWithKeyPath:value:");
}

id objc_msgSend_filteredArrayUsingPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filteredArrayUsingPredicate:");
}

id objc_msgSend_finalAndCompute(void *a1, const char *a2, ...)
{
  return _[a1 finalAndCompute];
}

id objc_msgSend_finalAndVerifyError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finalAndVerifyError:");
}

id objc_msgSend_finalizePreparedStatement_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finalizePreparedStatement:error:");
}

id objc_msgSend_finalizeStatement(void *a1, const char *a2, ...)
{
  return _[a1 finalizeStatement];
}

id objc_msgSend_finishTransactionURL(void *a1, const char *a2, ...)
{
  return _[a1 finishTransactionURL];
}

id objc_msgSend_finishWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishWithCompletionHandler:");
}

id objc_msgSend_finishWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishWithError:");
}

id objc_msgSend_finishWithResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishWithResult:");
}

id objc_msgSend_finishWithSuccess(void *a1, const char *a2, ...)
{
  return _[a1 finishWithSuccess];
}

id objc_msgSend_firstInt64Value(void *a1, const char *a2, ...)
{
  return _[a1 firstInt64Value];
}

id objc_msgSend_firstName(void *a1, const char *a2, ...)
{
  return _[a1 firstName];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_flags(void *a1, const char *a2, ...)
{
  return _[a1 flags];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _[a1 floatValue];
}

id objc_msgSend_forceServerCheck(void *a1, const char *a2, ...)
{
  return _[a1 forceServerCheck];
}

id objc_msgSend_foreignDatabaseColumnForProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "foreignDatabaseColumnForProperty:");
}

id objc_msgSend_foreignDatabaseTableForProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "foreignDatabaseTableForProperty:");
}

id objc_msgSend_foreignDatabaseTablesToDelete(void *a1, const char *a2, ...)
{
  return _[a1 foreignDatabaseTablesToDelete];
}

id objc_msgSend_foreignKeyColumnForTable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "foreignKeyColumnForTable:");
}

id objc_msgSend_formUnionWithCharacterSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "formUnionWithCharacterSet:");
}

id objc_msgSend_generateSKANPostbackSignature_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateSKANPostbackSignature:");
}

id objc_msgSend_getBoolValueForIdentifier_withContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getBoolValueForIdentifier:withContext:");
}

id objc_msgSend_getBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getBytes:length:");
}

id objc_msgSend_getBytes_maxLength_usedLength_encoding_options_range_remainingRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:");
}

id objc_msgSend_getIntegerValueForIdentifier_forBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getIntegerValueForIdentifier:forBundleID:");
}

id objc_msgSend_getIntegerValueForIdentifier_forBundleID_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getIntegerValueForIdentifier:forBundleID:completion:");
}

id objc_msgSend_getIntegerValueForIdentifier_withContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getIntegerValueForIdentifier:withContext:");
}

id objc_msgSend_getRevokedProductsMap(void *a1, const char *a2, ...)
{
  return _[a1 getRevokedProductsMap];
}

id objc_msgSend_getStorefrontForBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getStorefrontForBundleID:");
}

id objc_msgSend_getStorefrontWithContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getStorefrontWithContext:");
}

id objc_msgSend_getStringValueForIdentifier_forBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getStringValueForIdentifier:forBundleID:");
}

id objc_msgSend_getStringValueForIdentifier_withContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getStringValueForIdentifier:withContext:");
}

id objc_msgSend_getTransactionDataForBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getTransactionDataForBundleID:");
}

id objc_msgSend_getTransactionDataWithContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getTransactionDataWithContext:");
}

id objc_msgSend_getUUIDBytes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getUUIDBytes:");
}

id objc_msgSend_getValuesForProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getValuesForProperties:");
}

id objc_msgSend_globalStore(void *a1, const char *a2, ...)
{
  return _[a1 globalStore];
}

id objc_msgSend_groupWithName_maxConcurrent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupWithName:maxConcurrent:");
}

id objc_msgSend_handleAuthenticateRequest_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleAuthenticateRequest:completionHandler:");
}

id objc_msgSend_handleDialogRequest_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleDialogRequest:completionHandler:");
}

id objc_msgSend_handleEngagementRequest_bag_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleEngagementRequest:bag:completionHandler:");
}

id objc_msgSend_handleNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleNotification:");
}

id objc_msgSend_handlePurchase_paymentSheetDelegate_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handlePurchase:paymentSheetDelegate:completionHandler:");
}

id objc_msgSend_hasEverHadIAPs(void *a1, const char *a2, ...)
{
  return _[a1 hasEverHadIAPs];
}

id objc_msgSend_hasRows(void *a1, const char *a2, ...)
{
  return _[a1 hasRows];
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasSuffix:");
}

id objc_msgSend_hasTransactionWithSubscriptionOfferType_forSubscriptionGroupID_bundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasTransactionWithSubscriptionOfferType:forSubscriptionGroupID:bundleID:");
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _[a1 hash];
}

id objc_msgSend_hashTableWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hashTableWithOptions:");
}

id objc_msgSend_hashedDescription(void *a1, const char *a2, ...)
{
  return _[a1 hashedDescription];
}

id objc_msgSend_holdKeepAliveTransaction_whilePerformingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "holdKeepAliveTransaction:whilePerformingBlock:");
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return _[a1 host];
}

id objc_msgSend_iCloudDSID(void *a1, const char *a2, ...)
{
  return _[a1 iCloudDSID];
}

id objc_msgSend_iCloudUsername(void *a1, const char *a2, ...)
{
  return _[a1 iCloudUsername];
}

id objc_msgSend_iTunesDSID(void *a1, const char *a2, ...)
{
  return _[a1 iTunesDSID];
}

id objc_msgSend_iTunesUsername(void *a1, const char *a2, ...)
{
  return _[a1 iTunesUsername];
}

id objc_msgSend_iaps(void *a1, const char *a2, ...)
{
  return _[a1 iaps];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_identifierKind(void *a1, const char *a2, ...)
{
  return _[a1 identifierKind];
}

id objc_msgSend_identifierWithPid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identifierWithPid:");
}

id objc_msgSend_identifiers(void *a1, const char *a2, ...)
{
  return _[a1 identifiers];
}

id objc_msgSend_ignoreAssetCache(void *a1, const char *a2, ...)
{
  return _[a1 ignoreAssetCache];
}

id objc_msgSend_ignoreIAPQueueCheckSuppression(void *a1, const char *a2, ...)
{
  return _[a1 ignoreIAPQueueCheckSuppression];
}

id objc_msgSend_implementation(void *a1, const char *a2, ...)
{
  return _[a1 implementation];
}

id objc_msgSend_inMemoryDatabaseFlag(void *a1, const char *a2, ...)
{
  return _[a1 inMemoryDatabaseFlag];
}

id objc_msgSend_inMemoryDatabaseSharedCacheFlag(void *a1, const char *a2, ...)
{
  return _[a1 inMemoryDatabaseSharedCacheFlag];
}

id objc_msgSend_includeFinishedConsumables(void *a1, const char *a2, ...)
{
  return _[a1 includeFinishedConsumables];
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_indexOfObjectPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObjectPassingTest:");
}

id objc_msgSend_indexesOfObjectsPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexesOfObjectsPassingTest:");
}

id objc_msgSend_info(void *a1, const char *a2, ...)
{
  return _[a1 info];
}

id objc_msgSend_infoDictionary(void *a1, const char *a2, ...)
{
  return _[a1 infoDictionary];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return _[a1 init];
}

id objc_msgSend_initForGroupID_bundleID_storefrontID_logKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initForGroupID:bundleID:storefrontID:logKey:");
}

id objc_msgSend_initOnConnection_descriptor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initOnConnection:descriptor:");
}

id objc_msgSend_initWithAccount_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccount:options:");
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithAuditTokenData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAuditTokenData:");
}

id objc_msgSend_initWithBag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBag:");
}

id objc_msgSend_initWithBase64EncodedString_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBase64EncodedString:options:");
}

id objc_msgSend_initWithBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleID:");
}

id objc_msgSend_initWithBundleID_bundleURL_processInfo_dialogObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleID:bundleURL:processInfo:dialogObserver:");
}

id objc_msgSend_initWithBundleID_connection_type_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleID:connection:type:");
}

id objc_msgSend_initWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:");
}

id objc_msgSend_initWithBundleIdentifier_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:allowPlaceholder:error:");
}

id objc_msgSend_initWithBuyParams_client_apiVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBuyParams:client:apiVersion:");
}

id objc_msgSend_initWithBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBytes:length:");
}

id objc_msgSend_initWithBytesNoCopy_length_freeWhenDone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBytesNoCopy:length:freeWhenDone:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithChunkedDigest_resumptionOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithChunkedDigest:resumptionOffset:");
}

id objc_msgSend_initWithClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithClient:");
}

id objc_msgSend_initWithClient_pid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithClient:pid:");
}

id objc_msgSend_initWithClientID_teamID_serviceID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithClientID:teamID:serviceID:");
}

id objc_msgSend_initWithClientIdentifier_bag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithClientIdentifier:bag:");
}

id objc_msgSend_initWithConfiguration_bag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfiguration:bag:");
}

id objc_msgSend_initWithConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConnection:");
}

id objc_msgSend_initWithConnection_SQL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConnection:SQL:");
}

id objc_msgSend_initWithConnection_overridesDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConnection:overridesDictionary:");
}

id objc_msgSend_initWithConnection_schemaName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConnection:schemaName:");
}

id objc_msgSend_initWithConnectionOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConnectionOptions:");
}

id objc_msgSend_initWithContainerID_bag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContainerID:bag:");
}

id objc_msgSend_initWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContentsOfFile:");
}

id objc_msgSend_initWithContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContext:");
}

id objc_msgSend_initWithDPInfo_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDPInfo:error:");
}

id objc_msgSend_initWithDSID_altDSID_username_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDSID:altDSID:username:options:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithDatabase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDatabase:");
}

id objc_msgSend_initWithDatabaseEntity_properties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDatabaseEntity:properties:");
}

id objc_msgSend_initWithDatabaseID_propertyValues_externalPropertyValues_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDatabaseID:propertyValues:externalPropertyValues:");
}

id objc_msgSend_initWithDatabasePath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDatabasePath:");
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDictionary:");
}

id objc_msgSend_initWithDictionary_copyItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDictionary:copyItems:");
}

id objc_msgSend_initWithDictionaryRepresentation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDictionaryRepresentation:");
}

id objc_msgSend_initWithDictionaryRepresentation_cached_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDictionaryRepresentation:cached:");
}

id objc_msgSend_initWithDigestType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDigestType:");
}

id objc_msgSend_initWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDomain:code:userInfo:");
}

id objc_msgSend_initWithDownloadID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDownloadID:");
}

id objc_msgSend_initWithDownloadID_info_bundleID_containerID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDownloadID:info:bundleID:containerID:");
}

id objc_msgSend_initWithDownloadPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDownloadPath:");
}

id objc_msgSend_initWithEntityClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEntityClass:");
}

id objc_msgSend_initWithEntityClass_memoryEntityClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEntityClass:memoryEntityClass:");
}

id objc_msgSend_initWithEnvironment_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEnvironment:queue:");
}

id objc_msgSend_initWithEnvironmentName_namedDelegatePort_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEnvironmentName:namedDelegatePort:queue:");
}

id objc_msgSend_initWithExplanation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithExplanation:");
}

id objc_msgSend_initWithFamilyID_sceneID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFamilyID:sceneID:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithFormat_locale_arguments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFormat:locale:arguments:");
}

id objc_msgSend_initWithHoldTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHoldTime:");
}

id objc_msgSend_initWithIdentifier_targetQueue_waking_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:targetQueue:waking:");
}

id objc_msgSend_initWithIdentifier_transactionIdentifier_info_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:transactionIdentifier:info:");
}

id objc_msgSend_initWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInt:");
}

id objc_msgSend_initWithLength_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLength:");
}

id objc_msgSend_initWithLocalRevision_reason_includeFinishedConsumables_client_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLocalRevision:reason:includeFinishedConsumables:client:");
}

id objc_msgSend_initWithLocaleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLocaleIdentifier:");
}

id objc_msgSend_initWithLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLongLong:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithMaxValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMaxValue:");
}

id objc_msgSend_initWithMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMessage:");
}

id objc_msgSend_initWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:");
}

id objc_msgSend_initWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithObjects:");
}

id objc_msgSend_initWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithObjectsAndKeys:");
}

id objc_msgSend_initWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithOptions:");
}

id objc_msgSend_initWithPersistentID_onConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPersistentID:onConnection:");
}

id objc_msgSend_initWithPinningID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPinningID:");
}

id objc_msgSend_initWithPredicate_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPredicate:context:");
}

id objc_msgSend_initWithProductIdentifier_quantity_client_apiVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithProductIdentifier:quantity:client:apiVersion:");
}

id objc_msgSend_initWithPropertyValues_onConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPropertyValues:onConnection:");
}

id objc_msgSend_initWithPurchase_bag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPurchase:bag:");
}

id objc_msgSend_initWithPurchaseSIWA_bag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPurchaseSIWA:bag:");
}

id objc_msgSend_initWithPurchaseType_buyParams_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPurchaseType:buyParams:");
}

id objc_msgSend_initWithRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRequest:");
}

id objc_msgSend_initWithRequest_properties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRequest:properties:");
}

id objc_msgSend_initWithRequestID_promiseBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRequestID:promiseBlock:");
}

id objc_msgSend_initWithService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithService:");
}

id objc_msgSend_initWithServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithServiceName:");
}

id objc_msgSend_initWithSingle_multi_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSingle:multi:");
}

id objc_msgSend_initWithStartDate_duration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStartDate:duration:");
}

id objc_msgSend_initWithStatement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStatement:");
}

id objc_msgSend_initWithStatement_onConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStatement:onConnection:");
}

id objc_msgSend_initWithStoreItemIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStoreItemIdentifier:error:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithSubscriptionGroupID_reason_client_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSubscriptionGroupID:reason:client:");
}

id objc_msgSend_initWithTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTask:");
}

id objc_msgSend_initWithTask_metrics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTask:metrics:");
}

id objc_msgSend_initWithTermsOfService_privacyPolicyText_privacyPolicyURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTermsOfService:privacyPolicyText:privacyPolicyURL:");
}

id objc_msgSend_initWithTokenService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTokenService:");
}

id objc_msgSend_initWithTokenService_bag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTokenService:bag:");
}

id objc_msgSend_initWithTransactionID_client_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTransactionID:client:");
}

id objc_msgSend_initWithURL_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:allowPlaceholder:error:");
}

id objc_msgSend_initWithURL_overridesDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:overridesDictionary:");
}

id objc_msgSend_initWithURL_properties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:properties:");
}

id objc_msgSend_initWithURL_resolvingAgainstBaseURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:resolvingAgainstBaseURL:");
}

id objc_msgSend_initWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUTF8String:");
}

id objc_msgSend_initWithUUIDBytes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUUIDBytes:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_initWithUserID_bundleID_productID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUserID:bundleID:productID:");
}

id objc_msgSend_initWithUserID_bundleID_status_allowDeveloperControl_messageType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUserID:bundleID:status:allowDeveloperControl:messageType:");
}

id objc_msgSend_insertObject_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertObject:atIndex:");
}

id objc_msgSend_installPath(void *a1, const char *a2, ...)
{
  return _[a1 installPath];
}

id objc_msgSend_installReceiptData_atBundlePath_withReplyHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "installReceiptData:atBundlePath:withReplyHandler:");
}

id objc_msgSend_int64ForColumnIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "int64ForColumnIndex:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_integerForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "integerForKey:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_intersectSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intersectSet:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_invalidateCacheForBundleID_withLogKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidateCacheForBundleID:withLogKey:");
}

id objc_msgSend_invalidateLegacyTransactionCache(void *a1, const char *a2, ...)
{
  return _[a1 invalidateLegacyTransactionCache];
}

id objc_msgSend_invertedSet(void *a1, const char *a2, ...)
{
  return _[a1 invertedSet];
}

id objc_msgSend_isAbsolutePath(void *a1, const char *a2, ...)
{
  return _[a1 isAbsolutePath];
}

id objc_msgSend_isAppStoreVendable(void *a1, const char *a2, ...)
{
  return _[a1 isAppStoreVendable];
}

id objc_msgSend_isAskToBuyEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isAskToBuyEnabled];
}

id objc_msgSend_isAsynchronous(void *a1, const char *a2, ...)
{
  return _[a1 isAsynchronous];
}

id objc_msgSend_isBeta(void *a1, const char *a2, ...)
{
  return _[a1 isBeta];
}

id objc_msgSend_isCached(void *a1, const char *a2, ...)
{
  return _[a1 isCached];
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return _[a1 isCancelled];
}

id objc_msgSend_isClip(void *a1, const char *a2, ...)
{
  return _[a1 isClip];
}

id objc_msgSend_isCurrentSignedInUser(void *a1, const char *a2, ...)
{
  return _[a1 isCurrentSignedInUser];
}

id objc_msgSend_isEligibleForIntroductoryOfferForSubscriptionGroupID_storefrontID_completionHandler_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEligibleForIntroductoryOfferForSubscriptionGroupID:storefrontID:completionHandler:");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToData:");
}

id objc_msgSend_isEqualToDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToDictionary:");
}

id objc_msgSend_isEqualToMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToMessage:");
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToNumber:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isExecuting(void *a1, const char *a2, ...)
{
  return _[a1 isExecuting];
}

id objc_msgSend_isFileURL(void *a1, const char *a2, ...)
{
  return _[a1 isFileURL];
}

id objc_msgSend_isFinished(void *a1, const char *a2, ...)
{
  return _[a1 isFinished];
}

id objc_msgSend_isNegative(void *a1, const char *a2, ...)
{
  return _[a1 isNegative];
}

id objc_msgSend_isNullPredicateWithProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isNullPredicateWithProperty:");
}

id objc_msgSend_isProfileValidated(void *a1, const char *a2, ...)
{
  return _[a1 isProfileValidated];
}

id objc_msgSend_isProxy(void *a1, const char *a2, ...)
{
  return _[a1 isProxy];
}

id objc_msgSend_isReadOnly(void *a1, const char *a2, ...)
{
  return _[a1 isReadOnly];
}

id objc_msgSend_isRevoked(void *a1, const char *a2, ...)
{
  return _[a1 isRevoked];
}

id objc_msgSend_isSharingPurchases(void *a1, const char *a2, ...)
{
  return _[a1 isSharingPurchases];
}

id objc_msgSend_isTransactionFinishedForID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isTransactionFinishedForID:");
}

id objc_msgSend_isTransactionFinishedForID_bundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isTransactionFinishedForID:bundleID:");
}

id objc_msgSend_isVPPLicensed(void *a1, const char *a2, ...)
{
  return _[a1 isVPPLicensed];
}

id objc_msgSend_isValidEnvironment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValidEnvironment:");
}

id objc_msgSend_isValidJSONObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValidJSONObject:");
}

id objc_msgSend_joinClauseForProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "joinClauseForProperty:");
}

id objc_msgSend_kSKUserDefaultsIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 kSKUserDefaultsIdentifier];
}

id objc_msgSend_keepAliveWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keepAliveWithFormat:");
}

id objc_msgSend_keyEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 keyEnumerator];
}

id objc_msgSend_languageTag(void *a1, const char *a2, ...)
{
  return _[a1 languageTag];
}

id objc_msgSend_lastName(void *a1, const char *a2, ...)
{
  return _[a1 lastName];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 lastPathComponent];
}

id objc_msgSend_lastUpdated(void *a1, const char *a2, ...)
{
  return _[a1 lastUpdated];
}

id objc_msgSend_lastUpdatedForBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastUpdatedForBundleID:");
}

id objc_msgSend_legacyClientMediaAPIRate(void *a1, const char *a2, ...)
{
  return _[a1 legacyClientMediaAPIRate];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_lib_URLByAppendingPathComponents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lib_URLByAppendingPathComponents:");
}

id objc_msgSend_lib_URLByAppendingQueryDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lib_URLByAppendingQueryDictionary:");
}

id objc_msgSend_lib_analyticsActionName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lib_analyticsActionName");
}

id objc_msgSend_lib_digestMD5(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lib_digestMD5");
}

id objc_msgSend_lib_ensureDirectoryExistsAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lib_ensureDirectoryExistsAtPath:");
}

id objc_msgSend_lib_enumerateSubdataWithOffset_length_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lib_enumerateSubdataWithOffset:length:usingBlock:");
}

id objc_msgSend_lib_logUUID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lib_logUUID");
}

id objc_msgSend_lib_loggableDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lib_loggableDate");
}

id objc_msgSend_lib_mapAndFilterUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lib_mapAndFilterUsingBlock:");
}

id objc_msgSend_lib_receiptURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lib_receiptURL");
}

id objc_msgSend_lib_responseInterval(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lib_responseInterval");
}

id objc_msgSend_lib_sanitizedDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lib_sanitizedDescription");
}

id objc_msgSend_lib_sharedInstanceWithContainerId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lib_sharedInstanceWithContainerId:");
}

id objc_msgSend_lib_shortDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lib_shortDescription");
}

id objc_msgSend_lib_shortDigestMD5(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lib_shortDigestMD5");
}

id objc_msgSend_lib_shortLogKey(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lib_shortLogKey");
}

id objc_msgSend_lib_shortLogKeyWithAPIVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lib_shortLogKeyWithAPIVersion:");
}

id objc_msgSend_lib_signpostId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lib_signpostId");
}

id objc_msgSend_lib_stringByCopyingUTF8StringWithLength_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lib_stringByCopyingUTF8StringWithLength:");
}

id objc_msgSend_lib_stringByLimitingToLength_addElipsis_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lib_stringByLimitingToLength:addElipsis:");
}

id objc_msgSend_lib_walkUnderlyingErrorsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lib_walkUnderlyingErrorsUsingBlock:");
}

id objc_msgSend_limitCount(void *a1, const char *a2, ...)
{
  return _[a1 limitCount];
}

id objc_msgSend_loadingPriority(void *a1, const char *a2, ...)
{
  return _[a1 loadingPriority];
}

id objc_msgSend_localRevision(void *a1, const char *a2, ...)
{
  return _[a1 localRevision];
}

id objc_msgSend_localeIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 localeIdentifier];
}

id objc_msgSend_localizedCaseInsensitiveCompare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedCaseInsensitiveCompare:");
}

id objc_msgSend_localizedMessage(void *a1, const char *a2, ...)
{
  return _[a1 localizedMessage];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return _[a1 localizedName];
}

id objc_msgSend_localizedRecoveryOptions(void *a1, const char *a2, ...)
{
  return _[a1 localizedRecoveryOptions];
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_localizedStringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringWithFormat:");
}

id objc_msgSend_localizedTitle(void *a1, const char *a2, ...)
{
  return _[a1 localizedTitle];
}

id objc_msgSend_localizedUserNotificationStringForKey_arguments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedUserNotificationStringForKey:arguments:");
}

id objc_msgSend_locateActionWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "locateActionWithIdentifier:");
}

id objc_msgSend_locateAssetCache(void *a1, const char *a2, ...)
{
  return _[a1 locateAssetCache];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return _[a1 lock];
}

id objc_msgSend_logKey(void *a1, const char *a2, ...)
{
  return _[a1 logKey];
}

id objc_msgSend_logUUID(void *a1, const char *a2, ...)
{
  return _[a1 logUUID];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return _[a1 longLongValue];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return _[a1 lowercaseString];
}

id objc_msgSend_main(void *a1, const char *a2, ...)
{
  return _[a1 main];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 mainRunLoop];
}

id objc_msgSend_manager(void *a1, const char *a2, ...)
{
  return _[a1 manager];
}

id objc_msgSend_managerForClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "managerForClient:");
}

id objc_msgSend_mapTableWithKeyOptions_valueOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mapTableWithKeyOptions:valueOptions:");
}

id objc_msgSend_matchesNull(void *a1, const char *a2, ...)
{
  return _[a1 matchesNull];
}

id objc_msgSend_maximumWatchCellularTransferSize(void *a1, const char *a2, ...)
{
  return _[a1 maximumWatchCellularTransferSize];
}

id objc_msgSend_mediaAPIHost(void *a1, const char *a2, ...)
{
  return _[a1 mediaAPIHost];
}

id objc_msgSend_mediaAPISandboxHost(void *a1, const char *a2, ...)
{
  return _[a1 mediaAPISandboxHost];
}

id objc_msgSend_memoryEntityClass(void *a1, const char *a2, ...)
{
  return _[a1 memoryEntityClass];
}

id objc_msgSend_messageForBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messageForBundleID:");
}

id objc_msgSend_messageForUserID_inApp_messageType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messageForUserID:inApp:messageType:");
}

id objc_msgSend_messageOfTypeForBundleID_messageReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messageOfTypeForBundleID:messageReason:");
}

id objc_msgSend_metadataFromPlistAtURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metadataFromPlistAtURL:error:");
}

id objc_msgSend_metrics(void *a1, const char *a2, ...)
{
  return _[a1 metrics];
}

id objc_msgSend_migrateToVersion_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "migrateToVersion:usingBlock:");
}

id objc_msgSend_minusSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "minusSet:");
}

id objc_msgSend_modifyUsingTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "modifyUsingTransaction:");
}

id objc_msgSend_more(void *a1, const char *a2, ...)
{
  return _[a1 more];
}

id objc_msgSend_moveItemAtPath_toPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveItemAtPath:toPath:error:");
}

id objc_msgSend_multi(void *a1, const char *a2, ...)
{
  return _[a1 multi];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return _[a1 mutableBytes];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_mutableCopyWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutableCopyWithZone:");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_networkActivity(void *a1, const char *a2, ...)
{
  return _[a1 networkActivity];
}

id objc_msgSend_networkBudgetingIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 networkBudgetingIdentifier];
}

id objc_msgSend_notifyOfRevokedProductIdentifiers_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyOfRevokedProductIdentifiers:reply:");
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return _[a1 now];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _[a1 null];
}

id objc_msgSend_numberForColumnIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberForColumnIndex:");
}

id objc_msgSend_numberFromString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberFromString:");
}

id objc_msgSend_numberValueForProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberValueForProperty:");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_numberWithUnsignedChar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedChar:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_objCType(void *a1, const char *a2, ...)
{
  return _[a1 objCType];
}

id objc_msgSend_objc_clientDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objc_clientDescription");
}

id objc_msgSend_objc_clientType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objc_clientType");
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return _[a1 object];
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 objectEnumerator];
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_observerCountForEventIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "observerCountForEventIdentifier:");
}

id objc_msgSend_octaneConnectionForBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "octaneConnectionForBundleID:");
}

id objc_msgSend_opaqueDSIDData(void *a1, const char *a2, ...)
{
  return _[a1 opaqueDSIDData];
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return _[a1 open];
}

id objc_msgSend_openURL_withOptions_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openURL:withOptions:error:");
}

id objc_msgSend_optionalWithNone(void *a1, const char *a2, ...)
{
  return _[a1 optionalWithNone];
}

id objc_msgSend_optionalWithSome_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "optionalWithSome:");
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return _[a1 options];
}

id objc_msgSend_originalRequest(void *a1, const char *a2, ...)
{
  return _[a1 originalRequest];
}

id objc_msgSend_outputStreamToFileAtPath_append_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "outputStreamToFileAtPath:append:");
}

id objc_msgSend_parameterForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parameterForKey:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_pathWithComponents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathWithComponents:");
}

id objc_msgSend_pause(void *a1, const char *a2, ...)
{
  return _[a1 pause];
}

id objc_msgSend_pauseDownloadWithID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pauseDownloadWithID:");
}

id objc_msgSend_pendingLegacyTransactionsAccountTokenForBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pendingLegacyTransactionsAccountTokenForBundleID:");
}

id objc_msgSend_pendingLegacyTransactionsForBundleID_logKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pendingLegacyTransactionsForBundleID:logKey:error:");
}

id objc_msgSend_pendingLegacyTransactionsLastUpdatedForBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pendingLegacyTransactionsLastUpdatedForBundleID:");
}

id objc_msgSend_pendingTransactionsCountURL(void *a1, const char *a2, ...)
{
  return _[a1 pendingTransactionsCountURL];
}

id objc_msgSend_pendingTransactionsURL(void *a1, const char *a2, ...)
{
  return _[a1 pendingTransactionsURL];
}

id objc_msgSend_performAction_withContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performAction:withContext:");
}

id objc_msgSend_performAuthentication(void *a1, const char *a2, ...)
{
  return _[a1 performAuthentication];
}

id objc_msgSend_performFamilyInfoLookup(void *a1, const char *a2, ...)
{
  return _[a1 performFamilyInfoLookup];
}

id objc_msgSend_performPurchase(void *a1, const char *a2, ...)
{
  return _[a1 performPurchase];
}

id objc_msgSend_performPurchaseSIWA(void *a1, const char *a2, ...)
{
  return _[a1 performPurchaseSIWA];
}

id objc_msgSend_performSavepoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSavepoint:");
}

id objc_msgSend_performTaskWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performTaskWithBlock:");
}

id objc_msgSend_performTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performTransaction:");
}

id objc_msgSend_persistentID(void *a1, const char *a2, ...)
{
  return _[a1 persistentID];
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return _[a1 pid];
}

id objc_msgSend_pinningID(void *a1, const char *a2, ...)
{
  return _[a1 pinningID];
}

id objc_msgSend_port(void *a1, const char *a2, ...)
{
  return _[a1 port];
}

id objc_msgSend_portUpdated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "portUpdated:");
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:userInfo:");
}

id objc_msgSend_predicate(void *a1, const char *a2, ...)
{
  return _[a1 predicate];
}

id objc_msgSend_predicateMatchingAllPredicates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateMatchingAllPredicates:");
}

id objc_msgSend_predicateMatchingAnyPredicates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateMatchingAnyPredicates:");
}

id objc_msgSend_predicateMatchingIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateMatchingIdentifier:");
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithFormat:");
}

id objc_msgSend_predicateWithProperty_equalToLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithProperty:equalToLongLong:");
}

id objc_msgSend_predicateWithProperty_equalToValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithProperty:equalToValue:");
}

id objc_msgSend_predicateWithProperty_value_comparisonType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithProperty:value:comparisonType:");
}

id objc_msgSend_predicates(void *a1, const char *a2, ...)
{
  return _[a1 predicates];
}

id objc_msgSend_prepareStatement_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareStatement:error:");
}

id objc_msgSend_prepareWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareWithCompletionHandler:");
}

id objc_msgSend_present(void *a1, const char *a2, ...)
{
  return _[a1 present];
}

id objc_msgSend_presentAuthenticateRequest_withResultHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentAuthenticateRequest:withResultHandler:");
}

id objc_msgSend_presentDialogRequest_withResultHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentDialogRequest:withResultHandler:");
}

id objc_msgSend_presentEngagementRequest_withResultHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentEngagementRequest:withResultHandler:");
}

id objc_msgSend_presentingSceneID(void *a1, const char *a2, ...)
{
  return _[a1 presentingSceneID];
}

id objc_msgSend_privacyPolicyText(void *a1, const char *a2, ...)
{
  return _[a1 privacyPolicyText];
}

id objc_msgSend_privacyPolicyURL(void *a1, const char *a2, ...)
{
  return _[a1 privacyPolicyURL];
}

id objc_msgSend_processDownloadsForTransactions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processDownloadsForTransactions:");
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 processIdentifier];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return _[a1 processInfo];
}

id objc_msgSend_productID(void *a1, const char *a2, ...)
{
  return _[a1 productID];
}

id objc_msgSend_productIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 productIdentifier];
}

id objc_msgSend_productURLForAppWithID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "productURLForAppWithID:");
}

id objc_msgSend_productsBatchLimit(void *a1, const char *a2, ...)
{
  return _[a1 productsBatchLimit];
}

id objc_msgSend_productsURL(void *a1, const char *a2, ...)
{
  return _[a1 productsURL];
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return _[a1 progress];
}

id objc_msgSend_progressWithTotalUnitCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "progressWithTotalUnitCount:");
}

id objc_msgSend_promise(void *a1, const char *a2, ...)
{
  return _[a1 promise];
}

id objc_msgSend_promotionInfoForProductIdentifiers_bundleID_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "promotionInfoForProductIdentifiers:bundleID:error:");
}

id objc_msgSend_properties(void *a1, const char *a2, ...)
{
  return _[a1 properties];
}

id objc_msgSend_property(void *a1, const char *a2, ...)
{
  return _[a1 property];
}

id objc_msgSend_propertyForKey_inRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyForKey:inRequest:");
}

id objc_msgSend_propertyListWithData_options_format_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyListWithData:options:format:error:");
}

id objc_msgSend_propertyValues(void *a1, const char *a2, ...)
{
  return _[a1 propertyValues];
}

id objc_msgSend_proposedCredential(void *a1, const char *a2, ...)
{
  return _[a1 proposedCredential];
}

id objc_msgSend_protectionSpace(void *a1, const char *a2, ...)
{
  return _[a1 protectionSpace];
}

id objc_msgSend_protectionType(void *a1, const char *a2, ...)
{
  return _[a1 protectionType];
}

id objc_msgSend_protocol(void *a1, const char *a2, ...)
{
  return _[a1 protocol];
}

id objc_msgSend_protocolClasses(void *a1, const char *a2, ...)
{
  return _[a1 protocolClasses];
}

id objc_msgSend_publicToken(void *a1, const char *a2, ...)
{
  return _[a1 publicToken];
}

id objc_msgSend_publisher(void *a1, const char *a2, ...)
{
  return _[a1 publisher];
}

id objc_msgSend_purchase(void *a1, const char *a2, ...)
{
  return _[a1 purchase];
}

id objc_msgSend_purchaseIntakeWithMetrics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "purchaseIntakeWithMetrics:");
}

id objc_msgSend_purchaseResult(void *a1, const char *a2, ...)
{
  return _[a1 purchaseResult];
}

id objc_msgSend_pushConnection_didRecieveMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pushConnection:didRecieveMessage:");
}

id objc_msgSend_pushEnvironment(void *a1, const char *a2, ...)
{
  return _[a1 pushEnvironment];
}

id objc_msgSend_pushService_didReceiveMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pushService:didReceiveMessage:");
}

id objc_msgSend_qosClass(void *a1, const char *a2, ...)
{
  return _[a1 qosClass];
}

id objc_msgSend_quantity(void *a1, const char *a2, ...)
{
  return _[a1 quantity];
}

id objc_msgSend_query(void *a1, const char *a2, ...)
{
  return _[a1 query];
}

id objc_msgSend_queryDescriptor(void *a1, const char *a2, ...)
{
  return _[a1 queryDescriptor];
}

id objc_msgSend_queryItemWithName_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queryItemWithName:value:");
}

id objc_msgSend_queryItems(void *a1, const char *a2, ...)
{
  return _[a1 queryItems];
}

id objc_msgSend_queryOnConnection_predicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queryOnConnection:predicate:");
}

id objc_msgSend_queryOnConnection_predicate_orderingProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queryOnConnection:predicate:orderingProperties:");
}

id objc_msgSend_queryOnConnection_predicate_orderingProperties_orderingDirections_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queryOnConnection:predicate:orderingProperties:orderingDirections:");
}

id objc_msgSend_queryWith_customReceiptURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queryWith:customReceiptURL:");
}

id objc_msgSend_raise_format_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "raise:format:");
}

id objc_msgSend_rangeOfString_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfString:options:");
}

id objc_msgSend_rangeOffset(void *a1, const char *a2, ...)
{
  return _[a1 rangeOffset];
}

id objc_msgSend_readDataUpToLength_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readDataUpToLength:error:");
}

id objc_msgSend_readQueue(void *a1, const char *a2, ...)
{
  return _[a1 readQueue];
}

id objc_msgSend_readUsingSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readUsingSession:");
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return _[a1 reason];
}

id objc_msgSend_receiptFlags(void *a1, const char *a2, ...)
{
  return _[a1 receiptFlags];
}

id objc_msgSend_receiptFromBundleAtURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receiptFromBundleAtURL:");
}

id objc_msgSend_receiptInstallURL(void *a1, const char *a2, ...)
{
  return _[a1 receiptInstallURL];
}

id objc_msgSend_receiptRefreshMinAge(void *a1, const char *a2, ...)
{
  return _[a1 receiptRefreshMinAge];
}

id objc_msgSend_receiptString(void *a1, const char *a2, ...)
{
  return _[a1 receiptString];
}

id objc_msgSend_receiptWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receiptWithData:");
}

id objc_msgSend_receipts(void *a1, const char *a2, ...)
{
  return _[a1 receipts];
}

id objc_msgSend_receiveEventOfType_eventData_identifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receiveEventOfType:eventData:identifier:");
}

id objc_msgSend_receiveEventOfType_withData_onAllObserversWithID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receiveEventOfType:withData:onAllObserversWithID:");
}

id objc_msgSend_receivedStatuses_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receivedStatuses:");
}

id objc_msgSend_receivedTransactions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receivedTransactions:");
}

id objc_msgSend_receivesCredentialSecurely(void *a1, const char *a2, ...)
{
  return _[a1 receivesCredentialSecurely];
}

id objc_msgSend_reconcileUnfinishedTransactionIDs_forBundleID_logKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reconcileUnfinishedTransactionIDs:forBundleID:logKey:");
}

id objc_msgSend_recordTaskInfo_forTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordTaskInfo:forTask:");
}

id objc_msgSend_redeemCodeURL(void *a1, const char *a2, ...)
{
  return _[a1 redeemCodeURL];
}

id objc_msgSend_refundTransactionWithIdentifier_forBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "refundTransactionWithIdentifier:forBundleID:");
}

id objc_msgSend_registerConsumer_forActionType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerConsumer:forActionType:");
}

id objc_msgSend_registerForEventOfType_filterData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerForEventOfType:filterData:");
}

id objc_msgSend_registerForEventOfType_withFilterData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerForEventOfType:withFilterData:");
}

id objc_msgSend_registerObservationID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerObservationID:");
}

id objc_msgSend_releaseKeepAliveTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "releaseKeepAliveTransaction:");
}

id objc_msgSend_reloadFromDatabaseEntity_properties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadFromDatabaseEntity:properties:");
}

id objc_msgSend_remoteObject(void *a1, const char *a2, ...)
{
  return _[a1 remoteObject];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return _[a1 remoteObjectProxy];
}

id objc_msgSend_remoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeCachedLegacyTransactionWithID_forBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeCachedLegacyTransactionWithID:forBundleID:");
}

id objc_msgSend_removeCachedLegacyTransactionsForBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeCachedLegacyTransactionsForBundleID:");
}

id objc_msgSend_removeCharactersInString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeCharactersInString:");
}

id objc_msgSend_removeConnectionWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeConnectionWithUUID:");
}

id objc_msgSend_removeDeliveredNotificationsWithIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeDeliveredNotificationsWithIdentifiers:");
}

id objc_msgSend_removeDeviceIdentifierForVendorName_bundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeDeviceIdentifierForVendorName:bundleIdentifier:");
}

id objc_msgSend_removeDownloadsForTransactionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeDownloadsForTransactionID:");
}

id objc_msgSend_removeFunctionNamed_withArgumentCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeFunctionNamed:withArgumentCount:");
}

id objc_msgSend_removeIAPProductAtPath_withReplyHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeIAPProductAtPath:withReplyHandler:");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_removeMessageInfoForUser_inApp_type_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeMessageInfoForUser:inApp:type:withError:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObjectsAtIndexes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsAtIndexes:");
}

id objc_msgSend_removePropertyForKey_inRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removePropertyForKey:inRequest:");
}

id objc_msgSend_removeReceiptsForBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeReceiptsForBundleID:");
}

id objc_msgSend_removeRevocationInfoForUser_inApp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeRevocationInfoForUser:inApp:");
}

id objc_msgSend_removeStatusesForBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeStatusesForBundleID:");
}

id objc_msgSend_removeTaskInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeTaskInfo:");
}

id objc_msgSend_removedEntitlementsForProductIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removedEntitlementsForProductIdentifiers:");
}

id objc_msgSend_renewReceiptWithOptions_client_replyBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "renewReceiptWithOptions:client:replyBlock:");
}

id objc_msgSend_repairAppWithOptions_replyHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "repairAppWithOptions:replyHandler:");
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return _[a1 request];
}

id objc_msgSend_requestAuthorizationWithOptions_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestAuthorizationWithOptions:completionHandler:");
}

id objc_msgSend_requestBundleID(void *a1, const char *a2, ...)
{
  return _[a1 requestBundleID];
}

id objc_msgSend_requestBundleVersion(void *a1, const char *a2, ...)
{
  return _[a1 requestBundleVersion];
}

id objc_msgSend_requestEndDate(void *a1, const char *a2, ...)
{
  return _[a1 requestEndDate];
}

id objc_msgSend_requestOffset(void *a1, const char *a2, ...)
{
  return _[a1 requestOffset];
}

id objc_msgSend_requestReason(void *a1, const char *a2, ...)
{
  return _[a1 requestReason];
}

id objc_msgSend_requestStartDate(void *a1, const char *a2, ...)
{
  return _[a1 requestStartDate];
}

id objc_msgSend_requestUUID(void *a1, const char *a2, ...)
{
  return _[a1 requestUUID];
}

id objc_msgSend_requestUnifiedAppReceiptWithDialogContext_logKey_options_completionHandler_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestUnifiedAppReceiptWithDialogContext:logKey:options:completionHandler:");
}

id objc_msgSend_requestWithComponents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestWithComponents:");
}

id objc_msgSend_requestWithMethod_URL_headers_parameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestWithMethod:URL:headers:parameters:");
}

id objc_msgSend_requestWithMethod_URL_parameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestWithMethod:URL:parameters:");
}

id objc_msgSend_requestWithMethod_bagURL_parameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestWithMethod:bagURL:parameters:");
}

id objc_msgSend_requestWithTitle_message_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestWithTitle:message:");
}

id objc_msgSend_requestWithURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestWithURL:");
}

id objc_msgSend_requestWithURL_cachePolicy_timeoutInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestWithURL:cachePolicy:timeoutInterval:");
}

id objc_msgSend_requiresPowerPluggedIn(void *a1, const char *a2, ...)
{
  return _[a1 requiresPowerPluggedIn];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return _[a1 reset];
}

id objc_msgSend_resetLegacyTransactionsLastUpdatedForBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetLegacyTransactionsLastUpdatedForBundleID:");
}

id objc_msgSend_resetWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetWithCompletionHandler:");
}

id objc_msgSend_resolveIssueForTransactionWithIdentifier_forBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resolveIssueForTransactionWithIdentifier:forBundleID:");
}

id objc_msgSend_response(void *a1, const char *a2, ...)
{
  return _[a1 response];
}

id objc_msgSend_responseCorrelationId(void *a1, const char *a2, ...)
{
  return _[a1 responseCorrelationId];
}

id objc_msgSend_responseDictionary(void *a1, const char *a2, ...)
{
  return _[a1 responseDictionary];
}

id objc_msgSend_responseEndDate(void *a1, const char *a2, ...)
{
  return _[a1 responseEndDate];
}

id objc_msgSend_responseHeaders(void *a1, const char *a2, ...)
{
  return _[a1 responseHeaders];
}

id objc_msgSend_responseStartDate(void *a1, const char *a2, ...)
{
  return _[a1 responseStartDate];
}

id objc_msgSend_restartServerIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 restartServerIfNecessary];
}

id objc_msgSend_restoreTransactionsURL(void *a1, const char *a2, ...)
{
  return _[a1 restoreTransactionsURL];
}

id objc_msgSend_resultWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resultWithError:");
}

id objc_msgSend_resultWithTimeout_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resultWithTimeout:error:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_revocationsForClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "revocationsForClient:");
}

id objc_msgSend_revocationsForUserID_inApp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "revocationsForUserID:inApp:");
}

id objc_msgSend_revokeProductIdentifiers_forBundleID_accountID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "revokeProductIdentifiers:forBundleID:accountID:");
}

id objc_msgSend_saveSigningData_withContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveSigningData:withContext:");
}

id objc_msgSend_scanInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scanInteger:");
}

id objc_msgSend_scanUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scanUnsignedLongLong:");
}

id objc_msgSend_scannerWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scannerWithString:");
}

id objc_msgSend_sceneID(void *a1, const char *a2, ...)
{
  return _[a1 sceneID];
}

id objc_msgSend_schemaName(void *a1, const char *a2, ...)
{
  return _[a1 schemaName];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return _[a1 scheme];
}

id objc_msgSend_secureConnectionEndDate(void *a1, const char *a2, ...)
{
  return _[a1 secureConnectionEndDate];
}

id objc_msgSend_secureConnectionStartDate(void *a1, const char *a2, ...)
{
  return _[a1 secureConnectionStartDate];
}

id objc_msgSend_selectedActionIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 selectedActionIdentifier];
}

id objc_msgSend_sendLazy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendLazy:");
}

id objc_msgSend_serialNumber(void *a1, const char *a2, ...)
{
  return _[a1 serialNumber];
}

id objc_msgSend_serverCorrelationID(void *a1, const char *a2, ...)
{
  return _[a1 serverCorrelationID];
}

id objc_msgSend_serverCorrelationIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 serverCorrelationIdentifier];
}

id objc_msgSend_serverRevision(void *a1, const char *a2, ...)
{
  return _[a1 serverRevision];
}

id objc_msgSend_serviceID(void *a1, const char *a2, ...)
{
  return _[a1 serviceID];
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return _[a1 session];
}

id objc_msgSend_sessionClass(void *a1, const char *a2, ...)
{
  return _[a1 sessionClass];
}

id objc_msgSend_sessionWithConfiguration_delegate_delegateQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionWithConfiguration:delegate:delegateQueue:");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccount:");
}

id objc_msgSend_setAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAction:");
}

id objc_msgSend_setAdditionalBuyParams_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdditionalBuyParams:");
}

id objc_msgSend_setAdditionalHeaders_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdditionalHeaders:");
}

id objc_msgSend_setAllowsCellularAccess_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsCellularAccess:");
}

id objc_msgSend_setAllowsConstrainedNetworkAccess_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsConstrainedNetworkAccess:");
}

id objc_msgSend_setAllowsExpensiveNetworkAccess_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsExpensiveNetworkAccess:");
}

id objc_msgSend_setApiVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setApiVersion:");
}

id objc_msgSend_setAppAccountToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppAccountToken:");
}

id objc_msgSend_setAppTransaction_forBundleID_bundleVersion_token_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppTransaction:forBundleID:bundleVersion:token:");
}

id objc_msgSend_setApplicationUsername_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setApplicationUsername:");
}

id objc_msgSend_setAuthenticationType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAuthenticationType:");
}

id objc_msgSend_setBag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBag:");
}

id objc_msgSend_setBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBundleID:");
}

id objc_msgSend_setButtonActions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setButtonActions:");
}

id objc_msgSend_setBytesReceived_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBytesReceived:");
}

id objc_msgSend_setCachePolicy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCachePolicy:");
}

id objc_msgSend_setCacheSizeWithNumberOfKilobytes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCacheSizeWithNumberOfKilobytes:");
}

id objc_msgSend_setChunkDigests_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setChunkDigests:");
}

id objc_msgSend_setChunkSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setChunkSize:");
}

id objc_msgSend_setChunkType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setChunkType:");
}

id objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:");
}

id objc_msgSend_setClientInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClientInfo:");
}

id objc_msgSend_setCompletedUnitCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompletedUnitCount:");
}

id objc_msgSend_setCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompletionBlock:");
}

id objc_msgSend_setConfigurationID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfigurationID:");
}

id objc_msgSend_setCurrentSignedInUser_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentSignedInUser:");
}

id objc_msgSend_setCurrentValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentValue:");
}

id objc_msgSend_setCustomBuyParams_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCustomBuyParams:");
}

id objc_msgSend_setDataConsumer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDataConsumer:");
}

id objc_msgSend_setDatabaseID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDatabaseID:");
}

id objc_msgSend_setDateFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDateFormat:");
}

id objc_msgSend_setDebugReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDebugReason:");
}

id objc_msgSend_setDefaultAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDefaultAction:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDialogContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDialogContext:");
}

id objc_msgSend_setDialogOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDialogOptions:");
}

id objc_msgSend_setDigest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDigest:");
}

id objc_msgSend_setDiscountIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDiscountIdentifier:");
}

id objc_msgSend_setDiscountKeyIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDiscountKeyIdentifier:");
}

id objc_msgSend_setDiscountNonceString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDiscountNonceString:");
}

id objc_msgSend_setDiscountSignature_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDiscountSignature:");
}

id objc_msgSend_setDiscountTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDiscountTimestamp:");
}

id objc_msgSend_setDiscretionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDiscretionary:");
}

id objc_msgSend_setEnabledActionTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnabledActionTypes:");
}

id objc_msgSend_setEnabledTopics_ignoredTopics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnabledTopics:ignoredTopics:");
}

id objc_msgSend_setEnvironment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnvironment:");
}

id objc_msgSend_setError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setError:");
}

id objc_msgSend_setExcludeReceiptFromRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExcludeReceiptFromRequest:");
}

id objc_msgSend_setExecuting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExecuting:");
}

id objc_msgSend_setExitReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExitReason:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setFinished_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFinished:");
}

id objc_msgSend_setFinishedForTransactionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFinishedForTransactionID:");
}

id objc_msgSend_setFinishedForTransactionID_bundleID_logKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFinishedForTransactionID:bundleID:logKey:");
}

id objc_msgSend_setForceAuthentication_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setForceAuthentication:");
}

id objc_msgSend_setForceServerCheck_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setForceServerCheck:");
}

id objc_msgSend_setHTTPCookieAcceptPolicy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHTTPCookieAcceptPolicy:");
}

id objc_msgSend_setHTTPShouldSetCookies_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHTTPShouldSetCookies:");
}

id objc_msgSend_setHTTPShouldUsePipelining_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHTTPShouldUsePipelining:");
}

id objc_msgSend_setHTTPUserAgent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHTTPUserAgent:");
}

id objc_msgSend_setHideConfirmation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHideConfirmation:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setIgnoreAssetCache_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIgnoreAssetCache:");
}

id objc_msgSend_setInstallPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInstallPath:");
}

id objc_msgSend_setIntegerValue_forIdentifier_forBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIntegerValue:forIdentifier:forBundleID:");
}

id objc_msgSend_setIntegerValue_forIdentifier_withContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIntegerValue:forIdentifier:withContext:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setIsProcessingInterruptedBuy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsProcessingInterruptedBuy:");
}

id objc_msgSend_setKeepAlive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeepAlive:");
}

id objc_msgSend_setKeyboardType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeyboardType:");
}

id objc_msgSend_setLegacyTransactionsLastUpdatedForBundleID_token_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLegacyTransactionsLastUpdatedForBundleID:token:");
}

id objc_msgSend_setLength_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLength:");
}

id objc_msgSend_setLimitCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLimitCount:");
}

id objc_msgSend_setLocale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocale:");
}

id objc_msgSend_setLogKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLogKey:");
}

id objc_msgSend_setLogUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLogUUID:");
}

id objc_msgSend_setMaxConcurrentOperationCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaxConcurrentOperationCount:");
}

id objc_msgSend_setMaximumWatchCellularTransferSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaximumWatchCellularTransferSize:");
}

id objc_msgSend_setMetrics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetrics:");
}

id objc_msgSend_setModifiedOrAddedStatusesCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModifiedOrAddedStatusesCount:");
}

id objc_msgSend_setModifiedOrAddedTransactionsCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModifiedOrAddedTransactionsCount:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setName:");
}

id objc_msgSend_setNetworkActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNetworkActivity:");
}

id objc_msgSend_setNetworkBudgetingIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNetworkBudgetingIdentifier:");
}

id objc_msgSend_setNotificationCategories_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNotificationCategories:");
}

id objc_msgSend_setNumberStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberStyle:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOrderingDirections_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOrderingDirections:");
}

id objc_msgSend_setOrderingProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOrderingProperties:");
}

id objc_msgSend_setParameter_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setParameter:forKey:");
}

id objc_msgSend_setPartnerIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPartnerIdentifier:");
}

id objc_msgSend_setPartnerTransactionIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPartnerTransactionIdentifier:");
}

id objc_msgSend_setPaymentDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPaymentDelegate:");
}

id objc_msgSend_setPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPredicate:");
}

id objc_msgSend_setPresentingSceneID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPresentingSceneID:");
}

id objc_msgSend_setPresentingSceneIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPresentingSceneIdentifier:");
}

id objc_msgSend_setPriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPriority:");
}

id objc_msgSend_setPrivacyAcknowledgementRequired_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrivacyAcknowledgementRequired:");
}

id objc_msgSend_setProductKind_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProductKind:");
}

id objc_msgSend_setProgress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProgress:");
}

id objc_msgSend_setPromise_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPromise:");
}

id objc_msgSend_setPromotionInfo_forBundleID_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPromotionInfo:forBundleID:error:");
}

id objc_msgSend_setProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProperties:");
}

id objc_msgSend_setProperty_forKey_inRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProperty:forKey:inRequest:");
}

id objc_msgSend_setProtocolClasses_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProtocolClasses:");
}

id objc_msgSend_setProtocolHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProtocolHandler:");
}

id objc_msgSend_setQosClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQosClass:");
}

id objc_msgSend_setQueryItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQueryItems:");
}

id objc_msgSend_setReadOnly_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReadOnly:");
}

id objc_msgSend_setReceiptFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReceiptFlags:");
}

id objc_msgSend_setReceiptInstallURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReceiptInstallURL:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequest:");
}

id objc_msgSend_setRequestCachePolicy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequestCachePolicy:");
}

id objc_msgSend_setRequestData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequestData:");
}

id objc_msgSend_setRequestEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequestEncoding:");
}

id objc_msgSend_setRequestOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequestOffset:");
}

id objc_msgSend_setRequestReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequestReason:");
}

id objc_msgSend_setResponseDecoder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResponseDecoder:");
}

id objc_msgSend_setRevision_includesFinishedConsumables_token_forBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRevision:includesFinishedConsumables:token:forBundleID:");
}

id objc_msgSend_setSchemaName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSchemaName:");
}

id objc_msgSend_setScheme_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScheme:");
}

id objc_msgSend_setSendBlindedData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSendBlindedData:");
}

id objc_msgSend_setServerCorrelationID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServerCorrelationID:");
}

id objc_msgSend_setServiceID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServiceID:");
}

id objc_msgSend_setSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSession:");
}

id objc_msgSend_setSessionClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSessionClass:");
}

id objc_msgSend_setSignpostId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSignpostId:");
}

id objc_msgSend_setSimulateAskToBuy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSimulateAskToBuy:");
}

id objc_msgSend_setSiwaAuthorizationInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSiwaAuthorizationInfo:");
}

id objc_msgSend_setState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setState:");
}

id objc_msgSend_setStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStatus:");
}

id objc_msgSend_setStatusBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStatusBlock:");
}

id objc_msgSend_setStoreKitError_forCategory_bundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStoreKitError:forCategory:bundleID:");
}

id objc_msgSend_setStoreOriginated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStoreOriginated:");
}

id objc_msgSend_setStorefront_forBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStorefront:forBundleID:");
}

id objc_msgSend_setStorefront_withContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStorefront:withContext:");
}

id objc_msgSend_setStorefrontCountryCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStorefrontCountryCode:");
}

id objc_msgSend_setStorekitViewInitiated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStorekitViewInitiated:");
}

id objc_msgSend_setStreamAdapter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStreamAdapter:");
}

id objc_msgSend_setStringValue_forIdentifier_forBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStringValue:forIdentifier:forBundleID:");
}

id objc_msgSend_setStringValue_forIdentifier_withContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStringValue:forIdentifier:withContext:");
}

id objc_msgSend_setStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStyle:");
}

id objc_msgSend_setSubscriptionPeriod_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSubscriptionPeriod:");
}

id objc_msgSend_setSubscriptionRenewalInfo_forGroupID_bundleID_gracePeriodExpirationDate_logKey_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSubscriptionRenewalInfo:forGroupID:bundleID:gracePeriodExpirationDate:logKey:");
}

id objc_msgSend_setSuppressDialogs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSuppressDialogs:");
}

id objc_msgSend_setTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTask:");
}

id objc_msgSend_setTaskPriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTaskPriority:");
}

id objc_msgSend_setTeamID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTeamID:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTimeRemaining_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeRemaining:");
}

id objc_msgSend_setTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransaction:");
}

id objc_msgSend_setTransactionClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransactionClass:");
}

id objc_msgSend_setTransactionInfo_unfinishedIDs_forBundleID_logKey_containsSubscriptions_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransactionInfo:unfinishedIDs:forBundleID:logKey:containsSubscriptions:");
}

id objc_msgSend_setTransactionInfo_unfinishedIDs_forRevision_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransactionInfo:unfinishedIDs:forRevision:");
}

id objc_msgSend_setTransactionsCountDifference_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransactionsCountDifference:");
}

id objc_msgSend_setTransform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransform:");
}

id objc_msgSend_setTransporterConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransporterConfiguration:");
}

id objc_msgSend_setURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setURL:");
}

id objc_msgSend_setUnderlyingQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUnderlyingQueue:");
}

id objc_msgSend_setUserInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInfo:");
}

id objc_msgSend_setUserInitiated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInitiated:");
}

id objc_msgSend_setValue_forHTTPHeaderField_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forHTTPHeaderField:");
}

id objc_msgSend_setValue_forProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forProperty:");
}

id objc_msgSend_setValues_forExternalProperties_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValues:forExternalProperties:count:");
}

id objc_msgSend_setValues_forProperties_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValues:forProperties:count:");
}

id objc_msgSend_setValuesWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValuesWithDictionary:");
}

id objc_msgSend_setWantsNotificationResponsesDelivered(void *a1, const char *a2, ...)
{
  return _[a1 setWantsNotificationResponsesDelivered];
}

id objc_msgSend_setWinbackOfferIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWinbackOfferIdentifier:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_set_atsContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_atsContext:");
}

id objc_msgSend_set_bytesPerSecondLimit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_bytesPerSecondLimit:");
}

id objc_msgSend_set_connectionCachePurgeTimeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_connectionCachePurgeTimeout:");
}

id objc_msgSend_set_connectionPoolName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_connectionPoolName:");
}

id objc_msgSend_set_infersDiscretionaryFromOriginatingClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_infersDiscretionaryFromOriginatingClient:");
}

id objc_msgSend_set_loadingPriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_loadingPriority:");
}

id objc_msgSend_set_longLivedConnectionCachePurgeTimeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_longLivedConnectionCachePurgeTimeout:");
}

id objc_msgSend_set_nw_activity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_nw_activity:");
}

id objc_msgSend_set_preventsIdleSleepOnceConnected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_preventsIdleSleepOnceConnected:");
}

id objc_msgSend_set_priority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_priority:");
}

id objc_msgSend_set_requiresPowerPluggedIn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_requiresPowerPluggedIn:");
}

id objc_msgSend_set_sourceApplicationBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_sourceApplicationBundleIdentifier:");
}

id objc_msgSend_set_sourceApplicationSecondaryIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_sourceApplicationSecondaryIdentifier:");
}

id objc_msgSend_sha1(void *a1, const char *a2, ...)
{
  return _[a1 sha1];
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return _[a1 shared];
}

id objc_msgSend_sharedDatabaseContext(void *a1, const char *a2, ...)
{
  return _[a1 sharedDatabaseContext];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedKeySetForKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedKeySetForKeys:");
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedManager];
}

id objc_msgSend_sharedScheduler(void *a1, const char *a2, ...)
{
  return _[a1 sharedScheduler];
}

id objc_msgSend_shouldCollectMetricsForContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldCollectMetricsForContext:");
}

id objc_msgSend_shouldContinueTransactionWithNewStorefront_replyBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldContinueTransactionWithNewStorefront:replyBlock:");
}

id objc_msgSend_shouldHandleNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldHandleNotification:");
}

id objc_msgSend_shouldInstallParentAppWithBuyParams_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldInstallParentAppWithBuyParams:");
}

id objc_msgSend_shutdown(void *a1, const char *a2, ...)
{
  return _[a1 shutdown];
}

id objc_msgSend_signpostId(void *a1, const char *a2, ...)
{
  return _[a1 signpostId];
}

id objc_msgSend_simulatedStoreKitErrorFor_client_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "simulatedStoreKitErrorFor:client:");
}

id objc_msgSend_single(void *a1, const char *a2, ...)
{
  return _[a1 single];
}

id objc_msgSend_sinkWithCompletion_receiveInput_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sinkWithCompletion:receiveInput:");
}

id objc_msgSend_siwaAuthorizationInfo(void *a1, const char *a2, ...)
{
  return _[a1 siwaAuthorizationInfo];
}

id objc_msgSend_sk_allowArcade(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sk_allowArcade");
}

id objc_msgSend_sk_allowClientOverride(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sk_allowClientOverride");
}

id objc_msgSend_sk_allowPaymentRequestData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sk_allowPaymentRequestData");
}

id objc_msgSend_sk_bootSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sk_bootSession");
}

id objc_msgSend_sk_clientID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sk_clientID");
}

id objc_msgSend_sk_connectionIsOctaneService(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sk_connectionIsOctaneService");
}

id objc_msgSend_sk_downloadURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sk_downloadURL");
}

id objc_msgSend_sk_isOctanePrivileged(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sk_isOctanePrivileged");
}

id objc_msgSend_sk_persistedDataURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sk_persistedDataURL");
}

id objc_msgSend_sk_processName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sk_processName");
}

id objc_msgSend_sk_userDatabaseURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sk_userDatabaseURL");
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_sortedArrayUsingSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingSelector:");
}

id objc_msgSend_sqlite3_stmt(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sqlite3_stmt");
}

id objc_msgSend_startAccessingReturningError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startAccessingReturningError:");
}

id objc_msgSend_startDownloadWithID_client_auditToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startDownloadWithID:client:auditToken:");
}

id objc_msgSend_startPriceIncreaseForTransactionID_bundleID_needsConsent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startPriceIncreaseForTransactionID:bundleID:needsConsent:");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _[a1 state];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return _[a1 status];
}

id objc_msgSend_statusBlock(void *a1, const char *a2, ...)
{
  return _[a1 statusBlock];
}

id objc_msgSend_statusHashesForBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "statusHashesForBundleID:");
}

id objc_msgSend_statuses(void *a1, const char *a2, ...)
{
  return _[a1 statuses];
}

id objc_msgSend_stopAccessing(void *a1, const char *a2, ...)
{
  return _[a1 stopAccessing];
}

id objc_msgSend_storeDescriptor(void *a1, const char *a2, ...)
{
  return _[a1 storeDescriptor];
}

id objc_msgSend_storeExternalVersionID(void *a1, const char *a2, ...)
{
  return _[a1 storeExternalVersionID];
}

id objc_msgSend_storeItemID(void *a1, const char *a2, ...)
{
  return _[a1 storeItemID];
}

id objc_msgSend_storeKitErrorForCategory_bundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeKitErrorForCategory:bundleID:");
}

id objc_msgSend_storefrontCountryCodeForClient_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storefrontCountryCodeForClient:completionHandler:");
}

id objc_msgSend_storefrontIdentifierForClient_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storefrontIdentifierForClient:completionHandler:");
}

id objc_msgSend_streamError(void *a1, const char *a2, ...)
{
  return _[a1 streamError];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _[a1 string];
}

id objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAddingPercentEncodingWithAllowedCharacters:");
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingFormat:");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return _[a1 stringByDeletingPathExtension];
}

id objc_msgSend_stringByPaddingToLength_withString_startingAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByPaddingToLength:withString:startingAtIndex:");
}

id objc_msgSend_stringByRemovingPercentEncoding(void *a1, const char *a2, ...)
{
  return _[a1 stringByRemovingPercentEncoding];
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringForColumnIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForColumnIndex:");
}

id objc_msgSend_stringForColumnName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForColumnName:");
}

id objc_msgSend_stringForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForKey:");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _[a1 stringValue];
}

id objc_msgSend_stringWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithCapacity:");
}

id objc_msgSend_stringWithFileSystemRepresentation_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFileSystemRepresentation:length:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithString:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithValidatedFormat:validFormatSpecifiers:error:");
}

id objc_msgSend_strongToStrongObjectsMapTable(void *a1, const char *a2, ...)
{
  return _[a1 strongToStrongObjectsMapTable];
}

id objc_msgSend_strongToWeakObjectsMapTable(void *a1, const char *a2, ...)
{
  return _[a1 strongToWeakObjectsMapTable];
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return _[a1 style];
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subarrayWithRange:");
}

id objc_msgSend_subdataWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subdataWithRange:");
}

id objc_msgSend_subscribeOn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscribeOn:");
}

id objc_msgSend_subscriptionGroupID(void *a1, const char *a2, ...)
{
  return _[a1 subscriptionGroupID];
}

id objc_msgSend_subscriptionStateWithCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscriptionStateWithCompletionBlock:");
}

id objc_msgSend_subscriptionStatusForSubscriptionGroupID_bundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscriptionStatusForSubscriptionGroupID:bundleID:");
}

id objc_msgSend_subscriptionStatusForSubscriptionGroupID_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscriptionStatusForSubscriptionGroupID:completionHandler:");
}

id objc_msgSend_subscriptionStatusMaxAge(void *a1, const char *a2, ...)
{
  return _[a1 subscriptionStatusMaxAge];
}

id objc_msgSend_subscriptionStatusURL(void *a1, const char *a2, ...)
{
  return _[a1 subscriptionStatusURL];
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringToIndex:");
}

id objc_msgSend_success(void *a1, const char *a2, ...)
{
  return _[a1 success];
}

id objc_msgSend_suppressDialogs(void *a1, const char *a2, ...)
{
  return _[a1 suppressDialogs];
}

id objc_msgSend_suspendWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "suspendWithCompletionHandler:");
}

id objc_msgSend_syncLock(void *a1, const char *a2, ...)
{
  return _[a1 syncLock];
}

id objc_msgSend_syncQueue(void *a1, const char *a2, ...)
{
  return _[a1 syncQueue];
}

id objc_msgSend_syncReceiptsWithReason_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncReceiptsWithReason:completionHandler:");
}

id objc_msgSend_syncSubscriptionStatusWithReason_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncSubscriptionStatusWithReason:completionHandler:");
}

id objc_msgSend_synchronizeWithURLResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "synchronizeWithURLResult:");
}

id objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "synchronousRemoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_systemUptime(void *a1, const char *a2, ...)
{
  return _[a1 systemUptime];
}

id objc_msgSend_tableExists_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tableExists:");
}

id objc_msgSend_takeKeepAliveTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "takeKeepAliveTransaction:");
}

id objc_msgSend_task(void *a1, const char *a2, ...)
{
  return _[a1 task];
}

id objc_msgSend_taskIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 taskIdentifier];
}

id objc_msgSend_taskInfoForTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "taskInfoForTask:");
}

id objc_msgSend_taskPriority(void *a1, const char *a2, ...)
{
  return _[a1 taskPriority];
}

id objc_msgSend_tcr_arrayForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tcr_arrayForKey:");
}

id objc_msgSend_tcr_BOOLForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tcr_BOOLForKey:");
}

id objc_msgSend_tcr_BOOLForKey_missingValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tcr_BOOLForKey:missingValue:");
}

id objc_msgSend_tcr_dataForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tcr_dataForKey:");
}

id objc_msgSend_tcr_dateForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tcr_dateForKey:");
}

id objc_msgSend_tcr_dictionaryForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tcr_dictionaryForKey:");
}

id objc_msgSend_tcr_integerValueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tcr_integerValueForKey:");
}

id objc_msgSend_tcr_integerValueForKey_missingValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tcr_integerValueForKey:missingValue:");
}

id objc_msgSend_tcr_numberForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tcr_numberForKey:");
}

id objc_msgSend_tcr_numberForKeyPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tcr_numberForKeyPath:");
}

id objc_msgSend_tcr_stringEnumerator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tcr_stringEnumerator");
}

id objc_msgSend_tcr_stringForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tcr_stringForKey:");
}

id objc_msgSend_tcr_stringForKeyPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tcr_stringForKeyPath:");
}

id objc_msgSend_tcr_unsignedLongLongForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tcr_unsignedLongLongForKey:");
}

id objc_msgSend_tcr_urlForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tcr_urlForKey:");
}

id objc_msgSend_tcr_urlForKeyPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tcr_urlForKeyPath:");
}

id objc_msgSend_teamID(void *a1, const char *a2, ...)
{
  return _[a1 teamID];
}

id objc_msgSend_terminateClientApplication(void *a1, const char *a2, ...)
{
  return _[a1 terminateClientApplication];
}

id objc_msgSend_termsOfService(void *a1, const char *a2, ...)
{
  return _[a1 termsOfService];
}

id objc_msgSend_testAccountID(void *a1, const char *a2, ...)
{
  return _[a1 testAccountID];
}

id objc_msgSend_textFieldWithPlaceholder_secure_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textFieldWithPlaceholder:secure:");
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timeRemaining(void *a1, const char *a2, ...)
{
  return _[a1 timeRemaining];
}

id objc_msgSend_timerWithTimeInterval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timerWithTimeInterval:target:selector:userInfo:repeats:");
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return _[a1 timestamp];
}

id objc_msgSend_toASDErrorWithMetadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "toASDErrorWithMetadata:");
}

id objc_msgSend_transaction(void *a1, const char *a2, ...)
{
  return _[a1 transaction];
}

id objc_msgSend_transactionClass(void *a1, const char *a2, ...)
{
  return _[a1 transactionClass];
}

id objc_msgSend_transactionDeleted_forBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transactionDeleted:forBundleID:");
}

id objc_msgSend_transactionForID_bundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transactionForID:bundleID:");
}

id objc_msgSend_transactionHashesForBundleID_totalCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transactionHashesForBundleID:totalCount:");
}

id objc_msgSend_transactionID(void *a1, const char *a2, ...)
{
  return _[a1 transactionID];
}

id objc_msgSend_transactionIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 transactionIdentifier];
}

id objc_msgSend_transactionMetrics(void *a1, const char *a2, ...)
{
  return _[a1 transactionMetrics];
}

id objc_msgSend_transactionReceiptsMaxAge(void *a1, const char *a2, ...)
{
  return _[a1 transactionReceiptsMaxAge];
}

id objc_msgSend_transactionReceiptsMaxCount(void *a1, const char *a2, ...)
{
  return _[a1 transactionReceiptsMaxCount];
}

id objc_msgSend_transactionReceiptsURL(void *a1, const char *a2, ...)
{
  return _[a1 transactionReceiptsURL];
}

id objc_msgSend_transactionReceiptsURLv2(void *a1, const char *a2, ...)
{
  return _[a1 transactionReceiptsURLv2];
}

id objc_msgSend_transactionUpdated_forBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transactionUpdated:forBundleID:");
}

id objc_msgSend_transactions(void *a1, const char *a2, ...)
{
  return _[a1 transactions];
}

id objc_msgSend_transform(void *a1, const char *a2, ...)
{
  return _[a1 transform];
}

id objc_msgSend_transformSQLWithRoot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transformSQLWithRoot:");
}

id objc_msgSend_transporterConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 transporterConfiguration];
}

id objc_msgSend_truncateAtOffset_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "truncateAtOffset:error:");
}

id objc_msgSend_truncateWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "truncateWithCompletionHandler:");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:");
}

id objc_msgSend_unarchivedObjectOfClasses_fromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchivedObjectOfClasses:fromData:error:");
}

id objc_msgSend_unfinishedTransactionIDs(void *a1, const char *a2, ...)
{
  return _[a1 unfinishedTransactionIDs];
}

id objc_msgSend_unionSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unionSet:");
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return _[a1 unlock];
}

id objc_msgSend_unregisterForEventWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unregisterForEventWithIdentifier:");
}

id objc_msgSend_unregisterObservationID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unregisterObservationID:");
}

id objc_msgSend_unsignedCharValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedCharValue];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedLongLongValue];
}

id objc_msgSend_updateWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithData:");
}

id objc_msgSend_updatedTransactions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatedTransactions:");
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return _[a1 uppercaseString];
}

id objc_msgSend_urlRequestEncoder(void *a1, const char *a2, ...)
{
  return _[a1 urlRequestEncoder];
}

id objc_msgSend_urlSession(void *a1, const char *a2, ...)
{
  return _[a1 urlSession];
}

id objc_msgSend_urlTypeFor_bag_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "urlTypeFor:bag:error:");
}

id objc_msgSend_useConfigurationDirectory_forBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "useConfigurationDirectory:forBundleID:");
}

id objc_msgSend_user(void *a1, const char *a2, ...)
{
  return _[a1 user];
}

id objc_msgSend_userAgentForProcessInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userAgentForProcessInfo:");
}

id objc_msgSend_userDatabase(void *a1, const char *a2, ...)
{
  return _[a1 userDatabase];
}

id objc_msgSend_userID(void *a1, const char *a2, ...)
{
  return _[a1 userID];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return _[a1 username];
}

id objc_msgSend_usingVoucherForExternalID_applyQOSClass_executeBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "usingVoucherForExternalID:applyQOSClass:executeBlock:");
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return _[a1 value];
}

id objc_msgSend_valueForHTTPHeaderField_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForHTTPHeaderField:");
}

id objc_msgSend_valueForKeyPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKeyPath:");
}

id objc_msgSend_valueForProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForProperty:");
}

id objc_msgSend_valueForUserInfoKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForUserInfoKey:");
}

id objc_msgSend_valueOfClass_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueOfClass:forKey:");
}

id objc_msgSend_valueOfClass_forKeyPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueOfClass:forKeyPath:");
}

id objc_msgSend_valueWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithError:");
}

id objc_msgSend_values(void *a1, const char *a2, ...)
{
  return _[a1 values];
}

id objc_msgSend_vendorName(void *a1, const char *a2, ...)
{
  return _[a1 vendorName];
}

id objc_msgSend_verifyData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verifyData:error:");
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return _[a1 weakObjectsHashTable];
}

id objc_msgSend_willChangeValueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willChangeValueForKey:");
}

id objc_msgSend_withUnsafePropertyPointers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "withUnsafePropertyPointers:");
}

id objc_msgSend_write_maxLength_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "write:maxLength:");
}

id objc_msgSend_writeReceiptData_forBundleURL_logKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeReceiptData:forBundleURL:logKey:error:");
}

id objc_msgSend_writeReceiptData_toURL_logKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeReceiptData:toURL:logKey:error:");
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToFile:options:error:");
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToURL:options:error:");
}

id objc_msgSend_xDestroy(void *a1, const char *a2, ...)
{
  return _[a1 xDestroy];
}

id objc_msgSend_xFunc(void *a1, const char *a2, ...)
{
  return _[a1 xFunc];
}