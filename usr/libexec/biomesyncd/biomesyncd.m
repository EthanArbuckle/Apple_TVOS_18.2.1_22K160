}

void sub_100002F3C(_Unwind_Exception *a1)
{
}

void sub_100002F80(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _companionLinkClientInvalidated];
}

void sub_100002FAC(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _companionLinkClientDiscoveredDevice:v3];
}

void sub_100002FF4(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _companionLinkClientLostDevice:v3];
}

void sub_10000303C(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _companionLinkClientActivatedWithError:v3];
}

uint64_t sub_100003BF0(uint64_t result)
{
  *(_BYTE *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 17;
  return result;
}

uint64_t sub_100003C04(uint64_t result)
{
  *(_BYTE *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 17;
  return result;
}

uint64_t sub_100003C18(uint64_t result)
{
  *(_BYTE *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 17;
  return result;
}

void sub_100003CC4(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

BOOL sub_100005428(uint64_t a1, uint64_t a2)
{
  return a2 == 0x7FFFFFFFFFFFFFFELL - a1;
}

NSIndexSet *sub_10000543C(uint64_t a1)
{
  return +[NSIndexSet indexSetWithIndexesInRange:]( &OBJC_CLASS___NSIndexSet,  "indexSetWithIndexesInRange:",  a1,  0x7FFFFFFFFFFFFFFELL - a1);
}

id sub_100005454(uint64_t a1)
{
  if (a1) {
    v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexSet indexSetWithIndexesInRange:]( &OBJC_CLASS___NSIndexSet,  "indexSetWithIndexesInRange:",  1LL));
  }
  else {
    v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](&OBJC_CLASS___NSIndexSet, "indexSetWithIndex:", 0LL));
  }
  return v1;
}

CFStringRef sub_100005EA4(uint64_t a1)
{
  else {
    return off_100068B50[a1 - 1];
  }
}

LABEL_11:
    goto LABEL_16;
  }

  database = self->_database;
  v31 = objc_claimAutoreleasedReturnValue([v17 sessionID]);
  v32 = (void *)v31;
  if (v31) {
    v33 = (const __CFString *)v31;
  }
  else {
    v33 = @"no session ID";
  }
  -[BMSyncDatabase recordAtomMergeResult:inStream:sessionID:messageID:ownerSite:originatingSite:eventCreatedAt:]( database,  "recordAtomMergeResult:inStream:sessionID:messageID:ownerSite:originatingSite:eventCreatedAt:",  a3,  v14,  v33,  [v17 messageID],  v15,  v16,  a7);

LABEL_16:
}
}

uint64_t sub_1000063A4(uint64_t result)
{
  *(_BYTE *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 17;
  return result;
}

void sub_100006464(id a1, NSDictionary *a2)
{
}

void sub_1000064BC( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100006944(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

void sub_1000080FC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained requestTimeoutDidFire];
}

id sub_100008688(uint64_t a1)
{
  return [*(id *)(a1 + 32) registerRequests];
}

id sub_100008714(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startServerWithCompletion:*(void *)(a1 + 40)];
}

id sub_100008828(uint64_t a1)
{
  return [*(id *)(a1 + 32) fetchAtomBatchesIsReciprocal:0 reason:*(void *)(a1 + 56) activity:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

id sub_100008914(uint64_t a1)
{
  return [*(id *)(a1 + 32) fetchAtomBatchesFromDevices:*(void *)(a1 + 40) isReciprocal:0 reason:*(void *)(a1 + 64) activity:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

void sub_100008D90(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 userInfo]);
  id v8 = [v7 mutableCopy];
  v9 = v8;
  if (v8) {
    v10 = (NSMutableDictionary *)v8;
  }
  else {
    v10 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  }
  v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue([v6 domain]);
  unsigned int v13 = [v12 isEqual:@"BMRapportErrorDomain"];

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v11,  "objectForKeyedSubscript:",  NSLocalizedDescriptionKey));
    if (v14)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v11,  "setObject:forKeyedSubscript:",  v14,  NSLocalizedDescriptionKey);
    }

    else
    {
      v15 = BMRapportErrorToString((unint64_t)[v6 code]);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v11,  "setObject:forKeyedSubscript:",  v16,  NSLocalizedDescriptionKey);
    }
  }

  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  uint64_t v29 = a1;
  v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) deliveredToDevices]);
  id v18 = [v17 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v31;
    while (2)
    {
      for (i = 0LL; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v31 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
        v23 = (void *)objc_claimAutoreleasedReturnValue([v22 rapportIdentifier]);
        unsigned int v24 = [v23 isEqual:v5];

        if (v24)
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue([v22 description]);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v25, @"Device");

          goto LABEL_19;
        }
      }

      id v19 = [v17 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v19) {
        continue;
      }
      break;
    }
  }

LABEL_19:
  v26 = *(void **)(v29 + 40);
  v27 = (void *)objc_claimAutoreleasedReturnValue([v6 domain]);
  v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  v27,  [v6 code],  v11));
  [v26 addObject:v28];
}
}

LABEL_8:
    goto LABEL_9;
  }

  [v8 setState:2];
  metricsCollector = self->_metricsCollector;
  v15 = (void *)objc_claimAutoreleasedReturnValue([v8 sessionContext]);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 sessionID]);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase lastRapportSyncDate](self->_primaryDatabase, "lastRapportSyncDate"));
  -[BMSyncSessionMetricsCollector recordSessionEnd:lastSyncDate:]( metricsCollector,  "recordSessionEnd:lastSyncDate:",  v16,  v17);

  primaryDatabase = self->_primaryDatabase;
  id v19 = objc_opt_new(&OBJC_CLASS___NSDate);
  -[BMSyncDatabase setLastRapportSyncDate:](primaryDatabase, "setLastRapportSyncDate:", v19);

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v8 completionHandler]);
  if (v20)
  {
    v21 = __biome_log_for_category(11LL);
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportSyncEngine siteSuffix](self, "siteSuffix"));
      v25 = 138412802;
      v26 = v23;
      v27 = 2112;
      v28 = v9;
      uint64_t v29 = 2112;
      __int128 v30 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "BMRapportSyncEngine%@: completeRequest:deliveredToDevices %@ withErrors:%@",  (uint8_t *)&v25,  0x20u);
    }

    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 completionHandler]);
    (*((void (**)(os_log_s *, id, id))v12 + 2))(v12, v9, v10);
    goto LABEL_8;
  }

  if (self->_shouldAutoClose) {
    -[_bmFMResultSet close](self, "close");
  }
  return v6;
}

LABEL_9:
  currentRequest = self->_currentRequest;
  self->_currentRequest = 0LL;
}

    v16 = __biome_log_for_category(11LL);
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportSyncEngine siteSuffix](self, "siteSuffix"));
      uint64_t v20 = 138412546;
      v21 = v12;
      v22 = 2112;
      v23 = v5;
      unsigned int v13 = "BMRapportSyncEngine%@: current platform disallowed from syncing with non-paired watch: %@";
      goto LABEL_16;
    }

        exit(1);
      }

      id v8 = __biome_log_for_category(11LL);
      v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        v9 = *__error();
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v9;
        uint64_t v4 = "failed to resolve temporary directory: %{darwin.errno}d";
        goto LABEL_7;
      }
    }

    else
    {
      v1 = __biome_log_for_category(11LL);
      v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        id v3 = *__error();
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v3;
        uint64_t v4 = "failed to initialize temporary directory: %{darwin.errno}d";
LABEL_7:
        _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, v4, buf, 8u);
      }
    }
  }

  else
  {
    id v5 = __biome_log_for_category(11LL);
    v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      id v6 = *__error();
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v6;
      uint64_t v4 = "failed to set user dir suffix: %{darwin.errno}d";
      goto LABEL_7;
    }
  }

  goto LABEL_9;
}

void sub_100009690( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, id *a11, id *location, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, id a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, id a39)
{
}

void sub_1000096EC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained[2];
  v7 = *(void **)(a1 + 32);
  uint64_t v6 = a1 + 32;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( [v7 buildAtomBatchRequestWithIsReciprocal:*(unsigned __int8 *)(v6 + 24) syncReason:*(void *)(v6 + 16) sequenceNumber:0 transportType:2 device:v3]);
  if (v8)
  {
    +[BMSyncCore resetEagerExitTimer](&OBJC_CLASS___BMSyncCore, "resetEagerExitTimer");
    [v5 markAsInFlightToDevice:v3];
    uint64_t v9 = __biome_log_for_category(11LL);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)v6 siteSuffix]);
      int v14 = 138412546;
      v15 = v11;
      __int16 v16 = 2112;
      id v17 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "BMRapportSyncEngine%@: sending request to device: %@",  (uint8_t *)&v14,  0x16u);
    }

    [*(id *)v6 sendFetchAtomBatchesRequest:v8 toDevice:v3 forRequest:v5];
  }

  else
  {
    uint64_t v12 = __biome_log_for_category(11LL);
    unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000403A0();
    }
  }
}

void sub_100009884(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  id v3 = objc_loadWeakRetained(a1 + 6);
  uint64_t v4 = __biome_log_for_category(11LL);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a1[4] siteSuffix]);
    *(_DWORD *)buf = 138412290;
    v11 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "BMRapportSyncEngine%@: request timed out because no devices are nearby",  buf,  0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"BMRapportErrorDomain",  9LL,  0LL));
  uint64_t v9 = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
  [WeakRetained completeRequest:v3 deliveredToDevices:&__NSArray0__struct withErrors:v8];
}

void sub_100009E24( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, id *a11, id *location, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, id a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, id a46)
{
}

void sub_100009E88(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained[2];
  v7 = *(void **)(a1 + 32);
  uint64_t v6 = a1 + 32;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( [v7 buildAtomBatchRequestWithIsReciprocal:*(unsigned __int8 *)(v6 + 24) syncReason:*(void *)(v6 + 16) sequenceNumber:0 transportType:2 device:v3]);
  if (v8)
  {
    [v5 markAsInFlightToDevice:v3];
    uint64_t v9 = __biome_log_for_category(11LL);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)v6 siteSuffix]);
      int v14 = 138412546;
      v15 = v11;
      __int16 v16 = 2112;
      id v17 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "BMRapportSyncEngine%@: sending request to device: %@",  (uint8_t *)&v14,  0x16u);
    }

    [*(id *)v6 sendFetchAtomBatchesRequest:v8 toDevice:v3 forRequest:v5];
  }

  else
  {
    uint64_t v12 = __biome_log_for_category(11LL);
    unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000403A0();
    }
  }
}

void sub_10000A014(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  id v3 = objc_loadWeakRetained(a1 + 6);
  uint64_t v4 = __biome_log_for_category(11LL);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a1[4] siteSuffix]);
    *(_DWORD *)buf = 138412290;
    v11 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "BMRapportSyncEngine%@: request timed out because no devices are nearby",  buf,  0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"BMRapportErrorDomain",  9LL,  0LL));
  uint64_t v9 = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
  [WeakRetained completeRequest:v3 deliveredToDevices:&__NSArray0__struct withErrors:v8];
}

void sub_10000A254(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v6 = (void *)a1[4];
  uint64_t v7 = a1[5];
  uint64_t v8 = a1[6];
  uint64_t v9 = (void *)a1[7];
  id v10 = a4;
  id v11 = a3;
  id v12 = a2;
  objc_msgSend( v6,  "handleFetchAtomBatchesResponse:options:error:fromDevice:forRequest:isReciprocal:",  v12,  v11,  v10,  v7,  v8,  objc_msgSend(v9, "isReciprocalRequest"));
}

LABEL_17:
    id v17 = 0;
    goto LABEL_18;
  }

  if (v7 != (id)2
    || (uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 device]),
        uint64_t v9 = [v8 statusFlags],
        v8,
        (v9 & 1) == 0))
  {
    id v10 = __biome_log_for_category(11LL);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportSyncEngine siteSuffix](self, "siteSuffix"));
      uint64_t v20 = 138412546;
      v21 = v12;
      v22 = 2112;
      v23 = v5;
      unsigned int v13 = "BMRapportSyncEngine%@: current watch disallowed from syncing with non-paired device: %@";
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v20, 0x16u);

      goto LABEL_17;
    }

    goto LABEL_17;
  }

  if ([v5 platform] == (id)6) {
    goto LABEL_9;
  }
LABEL_12:
  if (!-[BMDistributedSyncMultiStreamManager supportsSyncingWithPlatform:overTransport:inDirection:]( self->_primarySyncManager,  "supportsSyncingWithPlatform:overTransport:inDirection:",  [v5 platform],  2,  3))
  {
    id v18 = __biome_log_for_category(11LL);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportSyncEngine siteSuffix](self, "siteSuffix"));
      uint64_t v20 = 138412546;
      v21 = v12;
      v22 = 2112;
      v23 = v5;
      unsigned int v13 = "BMRapportSyncEngine%@: syncing with device platform disallowed for device: %@";
      goto LABEL_16;
    }

    goto LABEL_17;
  }

  id v17 = 1;
LABEL_18:

  return v17;
}

LABEL_18:
      *a2 = 1;
      goto LABEL_19;
    }

    goto LABEL_12;
  }

void sub_10000A9D8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 40));
  dispatch_assert_queue_V2(WeakRetained[8]);
  +[BMSyncCore resetEagerExitTimer](&OBJC_CLASS___BMSyncCore, "resetEagerExitTimer");
  v94 = (__CFString *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:RPOptionSenderIDSDeviceID]);
  uint64_t v11 = __biome_log_for_category(11LL);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) siteSuffix]);
    int v14 = v94;
    id v15 = -[__CFString length](v94, "length");
    *(_DWORD *)buf = 138413058;
    uint64_t v109 = (uint64_t)v13;
    __int16 v110 = 2112;
    v111 = v14;
    __int16 v112 = 2112;
    id v113 = v7;
    __int16 v114 = 2112;
    id v115 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "BMRapportSyncEngine%@: received request BMRapportDevice[%@] %@ %@",  buf,  0x2Au);
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"senderModelID"]);
  if (v17 && (uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSString, v16), (objc_opt_isKindOfClass(v17, v18) & 1) != 0))
  {
    v93 = WeakRetained;
    uint64_t v19 = BMDevicePlatformFromModelString(v17);
    if (v19)
    {
      uint64_t v20 = v19;
      id v92 = v7;
      unint64_t v21 = (unint64_t)+[BMDeviceMetadataUtils platform](&OBJC_CLASS___BMDeviceMetadataUtils, "platform");
      v22 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:RPOptionStatusFlags]);
      unsigned int v23 = [v22 unsignedLongValue];

      if ((v20 & 0xFFFFFFFFFFFFFFFDLL) == 5 || (v21 & 0xFFFFFFFFFFFFFFFDLL) == 5)
      {
        if ((*(void *)&v23 & 0x82000LL) == 0)
        {
          uint64_t v50 = __biome_log_for_category(11LL);
          v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
            sub_1000405B8();
          }

          NSErrorUserInfoKey v100 = NSLocalizedDescriptionKey;
          v101 = @"Outside home";
          v26 = &v101;
          v27 = &v100;
          goto LABEL_43;
        }
      }

      else if ((v23 & 0x80000) == 0)
      {
        uint64_t v24 = __biome_log_for_category(11LL);
        v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          sub_1000406B4();
        }

        NSErrorUserInfoKey v102 = NSLocalizedDescriptionKey;
        v103 = @"Cross account";
        v26 = &v103;
        v27 = &v102;
LABEL_43:
        __int128 v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v26,  v27,  1LL));
        __int128 v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"BMRapportErrorDomain",  8LL,  v32));
        (*((void (**)(id, void, void, void *))v9 + 2))(v9, 0LL, 0LL, v33);
        id WeakRetained = v93;
        goto LABEL_20;
      }

      v37 = *(void **)(a1 + 32);
      v36 = (id *)(a1 + 32);
      __int128 v32 = (void *)objc_claimAutoreleasedReturnValue([v37 accountFromRapportOptions:v8]);
      __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([*v36 createDistributedSyncManagerForAccount:v32]);
      if (!v33)
      {
        uint64_t v46 = __biome_log_for_category(11LL);
        v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
        id WeakRetained = v93;
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
          sub_100040634();
        }

        NSErrorUserInfoKey v98 = NSLocalizedDescriptionKey;
        v99 = @"Failed to create sync manager";
        v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v99,  &v98,  1LL));
        v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"BMRapportErrorDomain",  0LL,  v48));
        (*((void (**)(id, void, void, void *))v9 + 2))(v9, 0LL, 0LL, v49);
        goto LABEL_63;
      }

      unsigned int v88 = [*v36 protocolVersion];
      id v38 = -[BMPeerToPeerMessage initFromDictionary:]( objc_alloc(&OBJC_CLASS___BMPeerToPeerMessage),  "initFromDictionary:",  v7);
      v90 = v38;
      if (+[BMDeviceMetadataUtils currentlyInGameMode]( &OBJC_CLASS___BMDeviceMetadataUtils,  "currentlyInGameMode"))
      {
        uint64_t v39 = __biome_log_for_category(11LL);
        v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          v41 = (void *)objc_claimAutoreleasedReturnValue([*v36 siteSuffix]);
          *(_DWORD *)buf = 138412290;
          uint64_t v109 = (uint64_t)v41;
          _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "BMRapportSyncEngine%@: device is currently in game mode, evaluating request reason to determine policy",  buf,  0xCu);
        }

        if ((v40, id v38 = v90, v20 == 6) && ![v90 syncReason]
          || [v90 syncReason] != (id)5 && objc_msgSend(v90, "syncReason") != (id)7)
        {
          uint64_t v80 = __biome_log_for_category(11LL);
          v81 = (os_log_s *)objc_claimAutoreleasedReturnValue(v80);
          if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
          {
            v82 = (void *)objc_claimAutoreleasedReturnValue([*v36 siteSuffix]);
            *(_DWORD *)buf = 138412290;
            uint64_t v109 = (uint64_t)v82;
            _os_log_impl( (void *)&_mh_execute_header,  v81,  OS_LOG_TYPE_DEFAULT,  "BMRapportSyncEngine%@: incoming request is not a user initiated force triggered sync, responding to reques t with temporarily unavailable",  buf,  0xCu);
          }

          NSErrorUserInfoKey v96 = NSLocalizedDescriptionKey;
          v97 = @"Currently in Game Mode";
          v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v97,  &v96,  1LL));
          v87 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"BMRapportErrorDomain",  11LL,  v49));
          (*((void (**)(id, void, void))v9 + 2))(v9, 0LL, 0LL);
          id v7 = v92;
          id WeakRetained = v93;
          v48 = v90;

          goto LABEL_63;
        }
      }

      id v7 = v92;
      id v91 = -[BMFetchAtomBatchesRequest initFromDictionary:]( objc_alloc(&OBJC_CLASS___BMFetchAtomBatchesRequest),  "initFromDictionary:",  v92);
      if ([v38 protocolVersion] == (id)1)
      {
        uint64_t v42 = __biome_log_for_category(11LL);
        v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          v44 = (void *)objc_claimAutoreleasedReturnValue([*v36 siteSuffix]);
          *(_DWORD *)buf = 138412290;
          uint64_t v109 = (uint64_t)v44;
          _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "BMRapportSyncEngine%@: replying with CKXUncompressedFormatVersion atom batch",  buf,  0xCu);
        }

        unsigned __int8 v85 = 1;
        v45 = v91;
      }

      else
      {
        if ([v38 protocolVersion] != (id)v88)
        {
          uint64_t v73 = __biome_log_for_category(11LL);
          v74 = (os_log_s *)objc_claimAutoreleasedReturnValue(v73);
          if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
          {
            v75 = (void *)objc_claimAutoreleasedReturnValue([*v36 siteSuffix]);
            v76 = (const __CFString *)[v90 protocolVersion];
            *(_DWORD *)buf = 138412802;
            uint64_t v109 = (uint64_t)v75;
            __int16 v110 = 2048;
            v111 = v76;
            __int16 v112 = 1024;
            LODWORD(v113) = v88;
            _os_log_impl( (void *)&_mh_execute_header,  v74,  OS_LOG_TYPE_DEFAULT,  "BMRapportSyncEngine%@: mismatched protocol version %lu, expected %d",  buf,  0x1Cu);
          }

          v77 = objc_opt_new(&OBJC_CLASS___BMFetchAtomBatchesResponse);
          -[BMPeerToPeerMessage setProtocolVersion:](v77, "setProtocolVersion:", v88);
          v78 = (void *)objc_claimAutoreleasedReturnValue([v33 peerStatusTracker]);
          v79 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v78,  "localDeviceUpdatingIfNeccesaryWithProtocolVersion:",  objc_msgSend(*v36, "protocolVersion")));
          -[BMPeerToPeerMessage setPeer:](v77, "setPeer:", v79);

          -[BMPeerToPeerMessage setWalltime:](v77, "setWalltime:", CFAbsoluteTimeGetCurrent());
          -[BMPeerToPeerMessage setSyncReason:](v77, "setSyncReason:", [v91 syncReason]);
          v86 = v77;
          v71 = (BMAtomBatchChunker *)objc_claimAutoreleasedReturnValue( -[BMFetchAtomBatchesResponse dictionaryRepresentation]( v77,  "dictionaryRepresentation"));
          v72 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"BMRapportErrorDomain",  7LL,  0LL));
          (*((void (**)(id, BMAtomBatchChunker *, void, void *))v9 + 2))(v9, v71, 0LL, v72);
          id WeakRetained = v93;
          goto LABEL_62;
        }

        v45 = v91;
        unsigned __int8 v85 = [v91 atomBatchVersion];
      }

      v52 = (void *)objc_claimAutoreleasedReturnValue([v45 rangeClockVectors]);

      if (v52)
      {
        uint64_t v53 = objc_claimAutoreleasedReturnValue([v45 rangeClockVectors]);
      }

      else
      {
        v54 = (void *)objc_claimAutoreleasedReturnValue([v45 vectorClock]);
        v55 = (void *)objc_claimAutoreleasedReturnValue( +[BMMultiStreamVectorClockConverter multiStreamVectorClockToTimestampVectorClock:]( &OBJC_CLASS___BMMultiStreamVectorClockConverter,  "multiStreamVectorClockToTimestampVectorClock:",  v54));

        uint64_t v53 = objc_claimAutoreleasedReturnValue( +[BMMultiStreamVectorClockConverter multiStreamRangeClockVectorFromIndexClockVectors:]( &OBJC_CLASS___BMMultiStreamVectorClockConverter,  "multiStreamRangeClockVectorFromIndexClockVectors:",  v55));
      }

      v56 = -[BMAtomBatchChunker initWithChunkerPolicy:]( objc_alloc(&OBJC_CLASS___BMAtomBatchChunker),  "initWithChunkerPolicy:",  v93[4]);
      uint64_t v57 = v85;
      v86 = (void *)v53;
      uint64_t v84 = objc_claimAutoreleasedReturnValue( [v33 atomBatchesForChangesSinceClockVector:v53 targetPlatform:v20 transportType:2 direction:2 ckFormatVersion:v57 chunker:v56]);
      v58 = objc_opt_new(&OBJC_CLASS___BMFetchAtomBatchesResponse);
      -[BMPeerToPeerMessage setProtocolVersion:](v58, "setProtocolVersion:", v88);
      v59 = (void *)objc_claimAutoreleasedReturnValue([v33 peerStatusTracker]);
      v60 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v59,  "localDeviceUpdatingIfNeccesaryWithProtocolVersion:",  objc_msgSend(*v36, "protocolVersion")));
      -[BMPeerToPeerMessage setPeer:](v58, "setPeer:", v60);

      -[BMPeerToPeerMessage setWalltime:](v58, "setWalltime:", CFAbsoluteTimeGetCurrent());
      -[BMPeerToPeerMessage setSyncReason:](v58, "setSyncReason:", [v91 syncReason]);
      -[BMFetchAtomBatchesResponse setUnseenPeers:](v58, "setUnseenPeers:", &__NSArray0__struct);
      -[BMFetchAtomBatchesResponse setAtomBatches:](v58, "setAtomBatches:", v84);
      v89 = v56;
      -[BMFetchAtomBatchesResponse setMoreComing:]( v58,  "setMoreComing:",  -[BMAtomBatchChunker moreComing](v56, "moreComing"));
      -[BMFetchAtomBatchesResponse setBatchSequenceNumber:]( v58,  "setBatchSequenceNumber:",  [v91 batchSequenceNumber]);
      v61 = (void *)objc_claimAutoreleasedReturnValue([v33 deletedLocationsForTransportType:2]);
      -[BMFetchAtomBatchesResponse setDeletedLocations:](v58, "setDeletedLocations:", v61);

      v83 = v58;
      v62 = (void *)objc_claimAutoreleasedReturnValue(-[BMFetchAtomBatchesResponse dictionaryRepresentation](v58, "dictionaryRepresentation"));
      (*((void (**)(id, void *, void, void))v9 + 2))(v9, v62, 0LL, 0LL);
      BOOL v63 = ([v91 isReciprocalRequest] & 1) == 0
         && [v91 batchSequenceNumber] == 0;
      uint64_t v64 = __biome_log_for_category(11LL);
      v65 = (os_log_s *)objc_claimAutoreleasedReturnValue(v64);
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v66 = objc_claimAutoreleasedReturnValue([*v36 siteSuffix]);
        v67 = (void *)v66;
        v68 = @"NO";
        if (v63) {
          v68 = @"YES";
        }
        *(_DWORD *)buf = 138412546;
        uint64_t v109 = v66;
        __int16 v110 = 2112;
        v111 = v68;
        _os_log_impl( (void *)&_mh_execute_header,  v65,  OS_LOG_TYPE_DEFAULT,  "BMRapportSyncEngine%@: should issue reciprocal request, %@",  buf,  0x16u);
      }

      id WeakRetained = v93;
      if (v63)
      {
        v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
        -[dispatch_queue_s setLastRapportSyncAttemptDate:](v93[9], "setLastRapportSyncAttemptDate:", v69);

        id v70 = *v36;
        v95[0] = _NSConcreteStackBlock;
        v95[1] = 3221225472LL;
        v95[2] = sub_10000B6C8;
        v95[3] = &unk_100068CB0;
        v95[4] = v70;
        [v70 fetchAtomBatchesIsReciprocal:1 reason:6 activity:0 completionHandler:v95];
      }

      id v7 = v92;
      v71 = v89;
      v72 = (void *)v84;
LABEL_62:

      v48 = v90;
      v49 = v91;

LABEL_63:
      goto LABEL_20;
    }

    uint64_t v34 = __biome_log_for_category(11LL);
    v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      sub_10004053C();
    }

    NSErrorUserInfoKey v104 = NSLocalizedDescriptionKey;
    v105 = @"Unknown platform";
    __int128 v30 = &v105;
    __int128 v31 = &v104;
  }

  else
  {
    uint64_t v28 = __biome_log_for_category(11LL);
    uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_1000404C0();
    }

    NSErrorUserInfoKey v106 = NSLocalizedDescriptionKey;
    v107 = @"Unable to determine sender model info";
    __int128 v30 = &v107;
    __int128 v31 = &v106;
  }

  __int128 v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v30,  v31,  1LL));
  __int128 v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"BMRapportErrorDomain",  8LL,  v32));
  (*((void (**)(id, void, void, void *))v9 + 2))(v9, 0LL, 0LL, v33);
LABEL_20:
}

void sub_10000B6C8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = __biome_log_for_category(11LL);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) siteSuffix]);
    int v11 = 138412802;
    id v12 = v9;
    __int16 v13 = 2112;
    id v14 = v5;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "BMRapportSyncEngine%@: fetch completion handler is reciprocal, YES, deviceIdentifiers, %@, errors, %@",  (uint8_t *)&v11,  0x20u);
  }

  [*(id *)(*(void *)(a1 + 32) + 72) clearCachedStatements];
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 56LL);
  if (v10) {
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v5, v6);
  }
}

void sub_10000C3E4( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

  ;
}

  ;
}

uint64_t sub_10000C444(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

void sub_10000C4C4(id a1)
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_source_t v2 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v4);
  id v3 = (void *)qword_10007C2F0;
  qword_10007C2F0 = (uint64_t)v2;

  dispatch_source_set_timer((dispatch_source_t)qword_10007C2F0, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0LL);
  dispatch_source_set_event_handler((dispatch_source_t)qword_10007C2F0, &stru_100068D38);
  dispatch_activate((dispatch_object_t)qword_10007C2F0);
}

BOOL sub_10000CF70(id a1, id a2)
{
  id v2 = a2;
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));

  return v3 != v2;
}

LABEL_23:
}

void sub_10000DB04(uint64_t a1, uint64_t a2)
{
  if (a2) {
    [*(id *)(a1 + 32) addObject:a2];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_10000DB34(uint64_t a1)
{
  if ((unint64_t)[*(id *)(a1 + 32) count] <= 1)
  {
    id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) firstObject]);
    if (!v2) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

  uint64_t v3 = *(void *)(a1 + 32);
  NSErrorUserInfoKey v5 = NSMultipleUnderlyingErrorsKey;
  uint64_t v6 = v3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"BMRapportErrorDomain",  1LL,  v4));

  if (v2) {
LABEL_5:
  }
    [*(id *)(a1 + 40) invalidate];
LABEL_6:
  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void sub_10000DF50( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_10000E220( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_10000E244(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  int v11 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _handleResponseUUID:*(void *)(a1 + 40) response:v7 options:v8 error:v9 handler:*(void *)(a1 + 48)];
  }

  else
  {
    uint64_t v12 = __biome_log_for_category(11LL);
    __int16 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      if (v7) {
        id v15 = v7;
      }
      else {
        id v15 = v9;
      }
      int v16 = 138412546;
      uint64_t v17 = v14;
      __int16 v18 = 2112;
      id v19 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "BMRapportClient[%@]: Warning: ignoring response arriving after deallocation: %@",  (uint8_t *)&v16,  0x16u);
    }
  }
}

LABEL_12:
    goto LABEL_13;
  }

  if (v12) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_outstandingResponseHandlers,  "setObject:forKeyedSubscript:",  0LL,  v12);
  }
  if (!v16)
  {
    unint64_t v21 = __biome_log_for_category(11LL);
    __int16 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v22 = self->_loggingIdentifier;
      if (v13) {
        unsigned int v23 = v13;
      }
      else {
        unsigned int v23 = v15;
      }
      uint64_t v24 = 138412546;
      v25 = v22;
      v26 = 2112;
      v27 = v23;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "BMRapportClient[%@]: Warning: ignoring response because no response handler is set: %@",  (uint8_t *)&v24,  0x16u);
    }

    goto LABEL_12;
  }

  v16[2](v16, v13, v14, v15);
LABEL_13:
}

    unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) location]);
    uint64_t v24 = [v23 isEqual:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];

    if ((v24 & 1) == 0)
    {
      v25 = objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) location]);
      v26 = *(void *)(*(void *)(a1 + 72) + 8LL);
      v27 = *(void **)(v26 + 40);
      *(void *)(v26 + 40) = v25;

      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 72) syncPolicy]);
      uint64_t v29 = [v28 supportsTransport:3 direction:3];

      if ((v29 & 1) != 0) {
        [*(id *)(*(void *)v11 + 48) upsertCKRecordWithLocation:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) inStream:*(void *)(*(void *)v11 + 16)];
      }
    }

    goto LABEL_15;
  }

  if ((v7 & 0xFFFFFFFE) == 2)
  {
    uint64_t v17 = __biome_log_for_category(11LL);
    __int16 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      id v19 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
      id v38 = 138412546;
      uint64_t v39 = v19;
      v40 = 2048;
      v41 = [v4 offset];
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "read new deleted BMStoreEvent: %@ at offset %lu",  (uint8_t *)&v38,  0x16u);
    }

    int v11 = a1 + 32;
    uint64_t v20 = objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) ckAtomTableRecordForEvent:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) ofType:0 atBookmark:v4 previousTableRecord:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) siteIdentifier:*(void *)(a1 + 40)]);
    unint64_t v21 = *(void *)(*(void *)(a1 + 64) + 8LL);
    v22 = *(void **)(v21 + 40);
    *(void *)(v21 + 40) = v20;

    if (([*(id *)(*(void *)v11 + 48) addCKAtomRow:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) inStream:*(void *)(*(void *)v11 + 16)] & 1) == 0)
    {
      __int128 v33 = __biome_log_for_category(11LL);
      int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
LABEL_20:
        uint64_t v34 = *(void *)(a1 + 56);
        v35 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
        v36 = *(void **)(*(void *)(v34 + 8) + 40LL);
        v37 = [v4 offset];
        id v38 = 138412802;
        uint64_t v39 = v35;
        v40 = 2112;
        v41 = v36;
        uint64_t v42 = 2048;
        v43 = v37;
        _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "failed to insert record %@ for BMStoreEvent: %@ at offset %lu",  (uint8_t *)&v38,  0x20u);
      }

  return v13;
}

void sub_10000F074( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_10000F08C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) += a4;
  return result;
}

void start()
{
  v0 = objc_autoreleasePoolPush();
  bzero(v51, 0x400uLL);
  if ((_set_user_dir_suffix("com.apple.biomesyncd") & 1) != 0)
  {
    if (confstr(65537, (char *)v51, 0x400uLL))
    {
      id v7 = realpath_DARWIN_EXTSN((const char *)v51, 0LL);
      if (v7)
      {
        free(v7);
        +[NSError _setFileNameLocalizationEnabled:](&OBJC_CLASS___NSError, "_setFileNameLocalizationEnabled:", 0LL);
        *(void *)buf = 0LL;
        if (!vproc_swap_integer(0LL, 5LL, 0LL, buf) && *(void *)buf)
        {
          uint64_t v10 = __biome_log_for_category(11LL);
          int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v51 = 0;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "biomesyncd launched", v51, 2u);
          }

          uint64_t v49 = 0LL;
          if (!vproc_swap_integer(0LL, 1LL, 0LL, &v49))
          {
            uint64_t v12 = __biome_log_for_category(11LL);
            __int16 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v51 = 134217984;
              uint64_t v52 = v49;
              _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "biomesyncd last exit status: %lld",  v51,  0xCu);
            }
          }

          dispatch_queue_attr_t v14 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
          id v15 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v14);
          dispatch_queue_t v16 = dispatch_queue_create("com.apple.biomesyncd", v15);

          uint64_t v17 = -[BMSyncCore initWithQueue:](objc_alloc(&OBJC_CLASS___BMSyncCore), "initWithQueue:", v16);
          dispatch_queue_attr_t v18 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
          id v19 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v18);
          dispatch_queue_t v20 = dispatch_queue_create("com.apple.biomesyncd.cascde", v19);

          unint64_t v21 = -[CCPersonaSyncManager initWithQueue:]( objc_alloc(&OBJC_CLASS___CCPersonaSyncManager),  "initWithQueue:",  v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[CCPersonaSyncManager syncEngineForCurrentPersona](v21, "syncEngineForCurrentPersona"));
          sub_10000F97C(v22);

          unsigned int v23 = -[BMSyncServiceServer initWithQueue:biomeSyncCore:cascadeSyncManager:]( objc_alloc(&OBJC_CLASS___BMSyncServiceServer),  "initWithQueue:biomeSyncCore:cascadeSyncManager:",  v16,  v17,  v21);
          uint64_t v24 = (void *)qword_10007C300;
          qword_10007C300 = (uint64_t)v23;

          handler[0] = _NSConcreteStackBlock;
          handler[1] = 3221225472LL;
          handler[2] = sub_10000FA04;
          handler[3] = &unk_100068E90;
          v25 = v16;
          v47 = v25;
          v26 = v17;
          v48 = v26;
          xpc_activity_register("com.apple.biomesyncd.metrics-collection", XPC_ACTIVITY_CHECK_IN, handler);
          v43[0] = _NSConcreteStackBlock;
          v43[1] = 3221225472LL;
          v43[2] = sub_10000FC94;
          v43[3] = &unk_100068E90;
          v27 = v25;
          v44 = v27;
          uint64_t v28 = v26;
          v45 = v28;
          xpc_activity_register("com.apple.biomesyncd.database-maintenance", XPC_ACTIVITY_CHECK_IN, v43);
          sub_10000FECC("com.apple.biomesyncd.post-install-immediate-sync", 7LL, v27, v28);
          sub_10000FECC("com.apple.biomesyncd.periodic-sync", 1LL, v27, v28);
          v40[0] = _NSConcreteStackBlock;
          v40[1] = 3221225472LL;
          v40[2] = sub_10000FF84;
          v40[3] = &unk_100068E90;
          uint64_t v29 = v27;
          v41 = v29;
          __int128 v30 = v28;
          uint64_t v42 = v30;
          xpc_set_event_stream_handler("com.apple.notifyd.matching", 0LL, v40);
          v36[0] = _NSConcreteStackBlock;
          v36[1] = 3221225472LL;
          v36[2] = sub_100010218;
          v36[3] = &unk_100068F08;
          v37 = v21;
          id v38 = v29;
          uint64_t v39 = v30;
          __int128 v31 = v30;
          __int128 v32 = v29;
          __int128 v33 = v21;
          xpc_set_event_stream_handler("com.apple.rapport.matching", 0LL, v36);
          signal(15, (void (__cdecl *)(int))1);
          dispatch_source_t v34 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0LL, 0LL);
          v35 = (void *)qword_10007C308;
          qword_10007C308 = (uint64_t)v34;

          dispatch_source_set_event_handler((dispatch_source_t)qword_10007C308, &stru_100068F28);
          dispatch_activate((dispatch_object_t)qword_10007C308);

          objc_autoreleasePoolPop(v0);
          dispatch_main();
        }

void sub_10000F97C(void *a1)
{
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100010670;
  handler[3] = &unk_100068F78;
  id v3 = a1;
  id v1 = v3;
  xpc_activity_register("com.apple.biomesyncd.cascade.periodic-sync", XPC_ACTIVITY_CHECK_IN, handler);
}

void sub_10000FA04(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_activity_get_state(v3) == 2)
  {
    uint64_t v4 = objc_autoreleasePoolPush();
    if (xpc_activity_should_defer(v3))
    {
      if (!xpc_activity_set_state(v3, 3LL))
      {
        uint64_t v5 = __biome_log_for_category(11LL);
        int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          sub_100040C58(v6, v7, v8, v9, v10, v11, v12, v13);
        }

        xpc_activity_set_state(v3, 5LL);
      }
    }

    else
    {
      uint64_t v14 = __biome_log_for_category(11LL);
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "biome activity fired com.apple.biomesyncd.metrics-collection",  buf,  2u);
      }

      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_10000FB54;
      v17[3] = &unk_100068E68;
      dispatch_queue_t v16 = *(dispatch_queue_s **)(a1 + 32);
      id v18 = *(id *)(a1 + 40);
      id v19 = v3;
      dispatch_sync(v16, v17);
    }

    objc_autoreleasePoolPop(v4);
  }
}

void sub_10000FB54(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  unsigned __int8 v3 = [*(id *)(a1 + 32) start];
  uint64_t v4 = __biome_log_for_category(11LL);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if ((v3 & 1) != 0)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "biome running activity com.apple.biomesyncd.metrics-collection",  buf,  2u);
    }

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) primaryDatabase]);
    [v7 runMetricsCollectionTask:*(void *)(a1 + 40)];

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10000FC88;
    v8[3] = &unk_100068E40;
    uint64_t v9 = (os_log_s *)*(id *)(a1 + 40);
    +[BMSyncDatabase enumerateAccountSpecificDatabasesWithBlock:]( &OBJC_CLASS___BMSyncDatabase,  "enumerateAccountSpecificDatabasesWithBlock:",  v8);
    uint64_t v5 = v9;
  }

  else if (v6)
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Database unavailable for activity com.apple.biomesyncd.metrics-collection",  buf,  2u);
  }

  objc_autoreleasePoolPop(v2);
}

id sub_10000FC88(uint64_t a1, void *a2)
{
  return [a2 runMetricsCollectionTask:*(void *)(a1 + 32)];
}

void sub_10000FC94(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_activity_get_state((xpc_activity_t)v3) == 2)
  {
    uint64_t v4 = objc_autoreleasePoolPush();
    uint64_t v5 = __biome_log_for_category(11LL);
    BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "biome activity fired com.apple.biomesyncd.database-maintenance",  buf,  2u);
    }

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10000FD8C;
    v8[3] = &unk_100068E68;
    uint64_t v7 = *(dispatch_queue_s **)(a1 + 32);
    id v9 = *(id *)(a1 + 40);
    id v10 = v3;
    dispatch_sync(v7, v8);

    objc_autoreleasePoolPop(v4);
  }
}

void sub_10000FD8C(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  unsigned __int8 v3 = [*(id *)(a1 + 32) start];
  uint64_t v4 = __biome_log_for_category(11LL);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if ((v3 & 1) != 0)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "biome running activity com.apple.biomesyncd.database-maintenance",  buf,  2u);
    }

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) primaryDatabase]);
    [v7 runVacuumingTask:*(void *)(a1 + 40)];

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10000FEC0;
    v8[3] = &unk_100068E40;
    id v9 = (os_log_s *)*(id *)(a1 + 40);
    +[BMSyncDatabase enumerateAccountSpecificDatabasesWithBlock:]( &OBJC_CLASS___BMSyncDatabase,  "enumerateAccountSpecificDatabasesWithBlock:",  v8);
    uint64_t v5 = v9;
  }

  else if (v6)
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "database unavailable for activity com.apple.biomesyncd.database-maintenance",  buf,  2u);
  }

  objc_autoreleasePoolPop(v2);
}

id sub_10000FEC0(uint64_t a1, void *a2)
{
  return [a2 runVacuumingTask:*(void *)(a1 + 32)];
}

void sub_10000FECC(const char *a1, uint64_t a2, void *a3, void *a4)
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10001084C;
  v9[3] = &unk_100068FC8;
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = a1;
  uint64_t v13 = a2;
  id v7 = v11;
  id v8 = v10;
  xpc_activity_register(a1, XPC_ACTIVITY_CHECK_IN, v9);
}

void sub_10000FF84(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_dictionary
    && (string = xpc_dictionary_get_string(v3, "Notification")) != 0LL)
  {
    uint64_t v13 = string;
    uint64_t v14 = __biome_log_for_category(11LL);
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      unint64_t v21 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "Received com.apple.notifyd.matching: %s",  buf,  0xCu);
    }

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1000100E4;
    v17[3] = &unk_100068EB8;
    id v19 = v13;
    dispatch_queue_t v16 = *(dispatch_queue_s **)(a1 + 32);
    id v18 = (os_log_s *)*(id *)(a1 + 40);
    dispatch_sync(v16, v17);
    uint64_t v5 = v18;
  }

  else
  {
    uint64_t v4 = __biome_log_for_category(11LL);
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_100040CC8((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
    }
  }
}

void sub_1000100E4(uint64_t a1)
{
  uint64_t v2 = __biome_log_for_category(11LL);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    int v7 = 136315138;
    uint64_t v8 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Handling com.apple.notifyd.matching: %s",  (uint8_t *)&v7,  0xCu);
  }

  if (!strcmp(*(const char **)(a1 + 40), "com.apple.rapport.CompanionLinkDeviceAdded"))
  {
    if ([*(id *)(a1 + 32) start])
    {
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) syncScheduler]);
      [v5 syncNowIfPolicyAllowsWithReason:3 transportType:2 activity:0];
    }

    else
    {
      uint64_t v6 = __biome_log_for_category(11LL);
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v7) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v5,  OS_LOG_TYPE_DEFAULT,  "Database unavailable to handle com.apple.rapport.CompanionLinkDeviceAdded",  (uint8_t *)&v7,  2u);
      }
    }
  }

void sub_100010218(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_dictionary
    && (string = xpc_dictionary_get_string(v3, _xpc_event_key_name)) != 0LL)
  {
    uint64_t v13 = string;
    uint64_t v14 = __biome_log_for_category(11LL);
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v24 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Received com.apple.rapport.matching: %s",  buf,  0xCu);
    }

    if (!strcmp(v13, "CascadeRapportWake"))
    {
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) syncEngineForCurrentPersona]);
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_100010400;
      v21[3] = &unk_100068B70;
      id v22 = v3;
      [v5 startServerWithCompletion:v21];
    }

    else
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_100010430;
      v17[3] = &unk_100068EE0;
      dispatch_queue_t v20 = v13;
      dispatch_queue_t v16 = *(dispatch_queue_s **)(a1 + 40);
      id v18 = *(id *)(a1 + 48);
      id v19 = v3;
      dispatch_sync(v16, v17);

      uint64_t v5 = v18;
    }
  }

  else
  {
    uint64_t v4 = __biome_log_for_category(11LL);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_FAULT)) {
      sub_100040D2C((uint64_t)v3, (os_log_s *)v5, v6, v7, v8, v9, v10, v11);
    }
  }
}

void sub_100010400(uint64_t a1)
{
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  if (reply)
  {
    id v2 = reply;
    xpc_dictionary_send_reply();
    xpc_object_t reply = v2;
  }
}

void sub_100010430(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  uint64_t v3 = __biome_log_for_category(11LL);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 136315138;
    uint64_t v12 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Handling com.apple.rapport.matching: %s",  buf,  0xCu);
  }

  if ([*(id *)(a1 + 32) start])
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) rapportSyncEngine]);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1000105A4;
    v9[3] = &unk_100068B70;
    uint64_t v10 = (os_log_s *)*(id *)(a1 + 40);
    [v6 _startServerWithCompletion:v9];

    uint64_t v7 = v10;
  }

  else
  {
    uint64_t v8 = __biome_log_for_category(11LL);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Database unavailable to handle RapportWake",  buf,  2u);
    }
  }

  objc_autoreleasePoolPop(v2);
}

void sub_1000105A4(uint64_t a1)
{
  if (xpc_dictionary_get_BOOL(*(xpc_object_t *)(a1 + 32), "replyRequired"))
  {
    xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
    if (reply)
    {
      id v3 = reply;
      xpc_dictionary_send_reply();
      xpc_object_t reply = v3;
    }
  }

void sub_100010604(id a1)
{
  uint64_t v1 = __biome_log_for_category(11LL);
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Received SIGTERM", v3, 2u);
  }

  xpc_transaction_exit_clean();
}

void sub_100010670(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_activity_get_state(v3) == 2)
  {
    uint64_t v4 = objc_autoreleasePoolPush();
    if (xpc_activity_should_defer(v3))
    {
      if (!xpc_activity_set_state(v3, 3LL))
      {
        uint64_t v5 = __biome_log_for_category(17LL);
        uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          sub_100040D90(v6, v7, v8, v9, v10, v11, v12, v13);
        }

        xpc_activity_set_state(v3, 5LL);
      }
    }

    else
    {
      uint64_t v14 = __biome_log_for_category(17LL);
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        unint64_t v21 = "com.apple.biomesyncd.cascade.periodic-sync";
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "cascade activity fired %s", buf, 0xCu);
      }

      xpc_activity_set_state(v3, 4LL);
      [*(id *)(a1 + 32) startClient];
      dispatch_queue_t v16 = *(void **)(a1 + 32);
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_100010820;
      v17[3] = &unk_100068F50;
      id v18 = v16;
      id v19 = v3;
      [v18 syncNowWithReason:1 activity:v19 completionHandler:v17];
    }

    objc_autoreleasePoolPop(v4);
  }
}

BOOL sub_100010820(uint64_t a1)
{
  return xpc_activity_set_state(*(xpc_activity_t *)(a1 + 40), 5LL);
}

void sub_10001084C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_activity_get_state(v3) == 2)
  {
    uint64_t v4 = objc_autoreleasePoolPush();
    if (xpc_activity_should_defer(v3))
    {
      if (!xpc_activity_set_state(v3, 3LL))
      {
        uint64_t v5 = __biome_log_for_category(11LL);
        uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          sub_100040E00(a1, v6, v7, v8, v9, v10, v11, v12);
        }

        xpc_activity_set_state(v3, 5LL);
      }
    }

    else
    {
      uint64_t v13 = __biome_log_for_category(11LL);
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        uint64_t v15 = *(void *)(a1 + 48);
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "biome activity fired %s",  (uint8_t *)&buf,  0xCu);
      }

      *(void *)&__int128 buf = 0LL;
      *((void *)&buf + 1) = &buf;
      uint64_t v25 = 0x2020000000LL;
      char v26 = 0;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100010A48;
      block[3] = &unk_100068FA0;
      dispatch_queue_t v16 = *(dispatch_queue_s **)(a1 + 32);
      id v17 = *(id *)(a1 + 40);
      uint64_t v18 = *(void *)(a1 + 48);
      p___int128 buf = &buf;
      uint64_t v23 = v18;
      id v21 = v17;
      dispatch_sync(v16, block);
      if (!*(_BYTE *)(*((void *)&buf + 1) + 24LL))
      {
        id v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) syncScheduler]);
        [v19 syncAllTransportsNowIfPolicyAllowsWithReason:*(void *)(a1 + 56) activity:v3];
      }

      _Block_object_dispose(&buf, 8);
    }

    objc_autoreleasePoolPop(v4);
  }
}

void sub_100010A28( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100010A48(uint64_t a1)
{
  unsigned __int8 v2 = [*(id *)(a1 + 32) start];
  uint64_t v3 = __biome_log_for_category(11LL);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if ((v2 & 1) != 0)
  {
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 48);
      int v8 = 136315138;
      uint64_t v9 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "biome running activity %s",  (uint8_t *)&v8,  0xCu);
    }
  }

  else
  {
    if (v5)
    {
      uint64_t v7 = *(void *)(a1 + 48);
      int v8 = 136315138;
      uint64_t v9 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Database unavailable for activity %s",  (uint8_t *)&v8,  0xCu);
    }

    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }

void sub_100010B5C( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

uint64_t sub_100011B14(uint64_t result)
{
  *(_BYTE *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 17;
  return result;
}

uint64_t sub_100011DC4(uint64_t result)
{
  *(_BYTE *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 17;
  return result;
}

LABEL_20:
  return v28;
}

  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  id v22 = 0LL;
  id v38 = 1;
LABEL_21:
  v42[0] = v23;
  v42[1] = v15;
  v40 = v15;
  v41[1] = @"record_name";
  v41[2] = @"stream_identifier";
  uint64_t v29 = &__kCFBooleanFalse;
  __int128 v30 = v11;
  if (v11) {
    uint64_t v29 = v11;
  }
  v42[2] = v18;
  v42[3] = v29;
  v41[3] = @"sync_to_cloud_kit";
  v41[4] = @"deleted_crdt";
  __int128 v31 = v12;
  if (!v12) {
    __int128 v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v42[4] = v31;
  v41[5] = @"record_type";
  __int128 v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a5));
  v42[5] = v32;
  __int128 v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v42,  v41,  6LL));
  dispatch_source_t v34 = -[_bmFMDatabase INSERT_INTO:VALUES:](fmdb, "INSERT_INTO:VALUES:", @"CKRecord", v33);

  if (!v12) {
  if (v38)
  }

  uint64_t v11 = v30;
  uint64_t v15 = v40;
  if ((v34 & 1) == 0)
  {
LABEL_30:
    v35 = __biome_log_for_category(11LL);
    v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT)) {
      sub_1000433B8();
    }
  }

    if (v7
      && !-[_bmFMDatabase bindStatement:WithArgumentsInArray:orDictionary:orVAList:]( self,  "bindStatement:WithArgumentsInArray:orDictionary:orVAList:",  ppStmt,  v14,  v15,  a6))
    {
      dispatch_queue_t v16 = 0LL;
    }

    else
    {
      if (!v19)
      {
        id v19 = objc_alloc_init(&OBJC_CLASS____bmFMStatement);
        -[_bmFMStatement setStatement:](v19, "setStatement:", ppStmt);
        if (v13)
        {
          if (self->_shouldCacheStatements) {
            -[_bmFMDatabase setCachedStatement:forQuery:](self, "setCachedStatement:forQuery:", v19, v13);
          }
        }
      }

      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[_bmFMResultSet resultSetWithStatement:usingParentDatabase:shouldAutoClose:]( &OBJC_CLASS____bmFMResultSet,  "resultSetWithStatement:usingParentDatabase:shouldAutoClose:",  v19,  self,  v7));
      [v24 setQuery:v13];
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithNonretainedObject:](&OBJC_CLASS___NSValue, "valueWithNonretainedObject:", v24));
      -[NSMutableSet addObject:](self->_openResultSets, "addObject:", v25);
      -[_bmFMStatement setUseCount:](v19, "setUseCount:", (char *)-[_bmFMStatement useCount](v19, "useCount") + 1);
      self->_isExecutingStatement = 0;
      dispatch_queue_t v16 = v24;
    }

    goto LABEL_28;
  }

  -[_bmFMDatabase warnInUse](self, "warnInUse");
LABEL_4:
  dispatch_queue_t v16 = 0LL;
LABEL_5:

  return v16;
}

uint64_t sub_1000120B8(uint64_t result)
{
  *(_BYTE *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 17;
  return result;
}

void sub_100012418(uint64_t a1, void *a2)
{
  id v14 = a2;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v14 timestamp]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) timestamp]);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 siteIdentifier]);
  [v3 setSiteIdentifier:v5];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v14 timestamp]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) timestamp]);
  objc_msgSend(v6, "setClock:", objc_msgSend(v7, "clockValue"));

  int v8 = (void *)objc_claimAutoreleasedReturnValue([v14 timestamp]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) timestamp]);
  objc_msgSend(v8, "setModifier:", objc_msgSend(v9, "modifier"));

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v14 timestamp]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) timestamp]);
  objc_msgSend(v10, "setUnordered:", objc_msgSend(v11, "unordered"));

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v14 references]);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100012604;
  v15[3] = &unk_100068FF0;
  id v16 = *(id *)(a1 + 32);
  [v12 appendWithProxyBlock:v15];

  objc_msgSend(v14, "setAtomType:", objc_msgSend(*(id *)(a1 + 32), "type"));
  if (![*(id *)(a1 + 32) type])
  {
    uint64_t v13 = 0LL;
    goto LABEL_6;
  }

  if ([*(id *)(a1 + 32) type] == (id)2 || objc_msgSend(*(id *)(a1 + 32), "type") == (id)1)
  {
    uint64_t v13 = 1LL;
LABEL_6:
    [v14 setAtomBehavior:v13];
  }

  [v14 setValue:*(void *)(a1 + 40)];
  [v14 setVersion:*(void *)(a1 + 48)];
}

void sub_100012604(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setType:0];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 location]);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) causalReference]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 location]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  [v4 setIdentifier:v7];

  int v8 = (void *)objc_claimAutoreleasedReturnValue([v3 timestamp]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) causalReference]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 timestamp]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 siteIdentifier]);
  [v8 setSiteIdentifier:v11];

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v3 timestamp]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) causalReference]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 timestamp]);
  objc_msgSend(v12, "setClock:", objc_msgSend(v14, "clockValue"));

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v3 timestamp]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) causalReference]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 timestamp]);
  objc_msgSend(v15, "setModifier:", objc_msgSend(v17, "modifier"));

  id v20 = (id)objc_claimAutoreleasedReturnValue([v3 timestamp]);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) causalReference]);
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 timestamp]);
  objc_msgSend(v20, "setUnordered:", objc_msgSend(v19, "unordered"));
}

void sub_1000127CC(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v3 timestamp]);
  id v12 = (id)objc_claimAutoreleasedReturnValue([v5 siteIdentifierObject]);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 timestamp]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 distributedSiteIdentifier]);
  int v8 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
  [v7 setIdentifier:v8];

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 timestamp]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) timestamp]);
  objc_msgSend(v9, "setClock:", objc_msgSend(v10, "clockValue"));

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 references]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10001293C;
  v13[3] = &unk_100068FF0;
  id v14 = *(id *)(a1 + 32);
  [v11 appendWithProxyBlock:v13];

  objc_msgSend(v4, "setAtomType:", objc_msgSend(*(id *)(a1 + 32), "type"));
  [v4 setValue:*(void *)(a1 + 40)];
  [v4 setVersion:*(void *)(a1 + 48)];
}

void sub_10001293C(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setType:0];
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 location]);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) causalReference]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mergeableValueID]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  [v4 setIdentifier:v7];

  int v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) causalReference]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 timestamp]);
  id v16 = (id)objc_claimAutoreleasedReturnValue([v9 siteIdentifierObject]);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v3 timestamp]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 distributedSiteIdentifier]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v16 identifier]);
  [v11 setIdentifier:v12];

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v3 timestamp]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) causalReference]);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 timestamp]);
  objc_msgSend(v13, "setClock:", objc_msgSend(v15, "clockValue"));
}

void sub_100013428( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, char a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, char a47)
{
}

uint64_t sub_1000134A0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000134B0(uint64_t a1)
{
}

uint64_t sub_1000134B8(uint64_t result)
{
  *(_BYTE *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 17;
  return result;
}

void sub_1000134CC(uint64_t a1, _BYTE *a2)
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) bookmark]);
  BOOL v5 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
  if (!v5) {
    goto LABEL_18;
  }
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 frame]);
  unsigned int v7 = [v6 state];

  if (v7 == 1)
  {
    uint64_t v8 = __biome_log_for_category(11LL);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
      int v38 = 138412546;
      uint64_t v39 = v10;
      __int16 v40 = 2048;
      id v41 = [v4 offset];
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "read new appended BMStoreEvent: %@ at offset %lu",  (uint8_t *)&v38,  0x16u);
    }

    uint64_t v11 = a1 + 32;
    uint64_t v12 = objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) ckAtomTableRecordForEvent:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) ofType:0 atBookmark:v4 previousTableRecord:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) siteIdentifier:*(void *)(a1 + 40)]);
    uint64_t v13 = *(void *)(*(void *)(a1 + 64) + 8LL);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    if (([*(id *)(*(void *)v11 + 48) addCKAtomRow:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) inStream:*(void *)(*(void *)v11 + 16)] & 1) == 0)
    {
      uint64_t v15 = __biome_log_for_category(11LL);
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        goto LABEL_20;
      }
      goto LABEL_17;
    }

LABEL_15:
  uint64_t v30 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) nextEvent]);
  uint64_t v31 = *(void *)(*(void *)(a1 + 56) + 8LL);
  __int128 v32 = *(void **)(v31 + 40);
  *(void *)(v31 + 40) = v30;

LABEL_19:
}

void sub_10001390C(uint64_t a1, _BYTE *a2)
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) nextEvent]);
  BOOL v5 = v4;
  if (v4)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 bookmark]);
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8LL);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 eventBody]);
    id v10 = objc_alloc(&OBJC_CLASS___BMStoreBookmark);
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8LL);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 segmentName]);
    id v13 = objc_msgSend( v10,  "initWithStream:segment:iterationStartTime:offset:",  v11,  v12,  objc_msgSend(v9, "offset"),  1.79769313e308);

    uint64_t v14 = __biome_log_for_category(11LL);
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
      *(_DWORD *)__int128 buf = 138412546;
      *(void *)&uint8_t buf[4] = v9;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "read BMStoreEvent tombstone: %@ at tombstone bookmark %@",  buf,  0x16u);
    }

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v5 eventBody]);
    unint64_t v18 = (unint64_t)[v17 deletionReason];

    if (v18 == 1)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL), v9);
    }

    else if ((v18 & 0xFFFFFFFFFFFFFFFDLL) != 0)
    {
      uint64_t v19 = __biome_log_for_category(11LL);
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      *(void *)__int128 buf = 0LL;
      *(void *)&uint8_t buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x2020000000LL;
      LOBYTE(v36) = 16;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100013D34;
      block[3] = &unk_100068AD8;
      void block[4] = buf;
      if (qword_10007C330 != -1) {
        dispatch_once(&qword_10007C330, block);
      }
      os_log_type_t v21 = *(_BYTE *)(*(void *)&buf[8] + 24LL);
      _Block_object_dispose(buf, 8);
      if (os_log_type_enabled(v20, v21))
      {
        uint64_t v22 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
        *(_DWORD *)__int128 buf = 138412802;
        *(void *)&uint8_t buf[4] = v9;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v22;
        *(_WORD *)&buf[22] = 2048;
        unint64_t v36 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  v21,  "BMStoreEvent tombstone: %@ at tombstone bookmark: %@ with unexpected deletion reason %lu",  buf,  0x20u);
      }
    }

    else
    {
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 40) ckAtomTableRecordForEvent:0 ofType:2 atBookmark:v13 previousTableRecord:0 siteIdentifier:*(void *)(a1 + 48)]);
      if (v23)
      {
        if ([*(id *)(*(void *)(a1 + 40) + 48) addCKAtomRow:v23 inStream:*(void *)(*(void *)(a1 + 40) + 16)])
        {
          unsigned __int8 v24 = (void *)objc_claimAutoreleasedReturnValue([v23 location]);
          unsigned __int8 v25 = [v24 isEqual:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];

          if ((v25 & 1) == 0)
          {
            uint64_t v26 = objc_claimAutoreleasedReturnValue([v23 location]);
            uint64_t v27 = *(void *)(*(void *)(a1 + 72) + 8LL);
            uint64_t v28 = *(void **)(v27 + 40);
            *(void *)(v27 + 40) = v26;

            unsigned __int8 v29 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 40) + 72) syncPolicy]);
            unsigned int v30 = [v29 supportsTransport:3 direction:3];

            if (v30) {
              [*(id *)(*(void *)(a1 + 40) + 48) upsertCKRecordWithLocation:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) inStream:*(void *)(*(void *)(a1 + 40) + 16)];
            }
          }
        }

        else
        {
          uint64_t v31 = __biome_log_for_category(11LL);
          __int128 v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            unint64_t v33 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
            *(_DWORD *)__int128 buf = 138412802;
            *(void *)&uint8_t buf[4] = v23;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v9;
            *(_WORD *)&buf[22] = 2112;
            unint64_t v36 = v33;
            _os_log_error_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_ERROR,  "failed to insert record %@ for BMStoreEvent tombstone: %@ at tombstone bookmark: %@",  buf,  0x20u);
          }

          *a2 = 1;
        }
      }
    }
  }

  else
  {
    *a2 = 1;
  }
}

uint64_t sub_100013D34(uint64_t result)
{
  *(_BYTE *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 17;
  return result;
}

void sub_1000142D8(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5 = a2;
  uint64_t v6 = __biome_log_for_category(11LL);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100040FE0();
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 location]);
  id v9 = [v8 state];

  if (v9 == (id)2)
  {
    if ([v5 type])
    {
      id v10 = 0LL;
      goto LABEL_41;
    }

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v5 location]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 location]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v13 siteIdentifier]);

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:v10]);
    if (!v14)
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) readerForSiteIdentifier:v10]);
      [*(id *)(a1 + 32) setObject:v14 forKeyedSubscript:v10];
    }

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) bookmarkForAtomRow:v5]);
    if (!v15)
    {
      uint64_t v21 = __biome_log_for_category(11LL);
      uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      *(void *)__int128 buf = 0LL;
      *(void *)&uint8_t buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x2020000000LL;
      LOBYTE(v5_Block_object_dispose((const void *)(v47 - 176), 8) = 16;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100014AAC;
      block[3] = &unk_100068AD8;
      void block[4] = buf;
      if (qword_10007C338 != -1) {
        dispatch_once(&qword_10007C338, block);
      }
      os_log_type_t v23 = *(_BYTE *)(*(void *)&buf[8] + 24LL);
      _Block_object_dispose(buf, 8);
      if (os_log_type_enabled(v22, v23))
      {
        *(_DWORD *)__int128 buf = 138412290;
        *(void *)&uint8_t buf[4] = v5;
        _os_log_impl((void *)&_mh_execute_header, v22, v23, "BMSyncCKAtomRow missing bookmark %@", buf, 0xCu);
      }

      goto LABEL_45;
    }

    uint64_t v16 = v15;
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v15 segmentName]);
    unsigned __int8 v18 = [v17 isEqualToString:@"DOA"];

    if ((v18 & 1) != 0)
    {
      uint64_t v19 = __biome_log_for_category(11LL);
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "bookmark is DOA, not attempting to resolve event",  buf,  2u);
      }

      goto LABEL_39;
    }

    unsigned __int8 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) objectForKeyedSubscript:v10]);
    if (!v24)
    {
      unsigned int v30 = (os_log_s *)[v14 newEnumeratorFromBookmark:v16 options:7];
LABEL_30:
      [*(id *)(a1 + 48) setObject:v30 forKeyedSubscript:v10];
      uint64_t v20 = v30;
      goto LABEL_31;
    }

    uint64_t v20 = v24;
    unsigned __int8 v25 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s bookmark](v24, "bookmark"));
    unsigned __int8 v26 = [v25 isEqual:v16];

    if ((v26 & 1) == 0)
    {
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s bookmark](v20, "bookmark"));
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v27 segmentName]);
      unsigned __int8 v29 = (void *)objc_claimAutoreleasedReturnValue([v16 segmentName]);
      if ([v28 isEqualToString:v29])
      {

LABEL_25:
        uint64_t v32 = __biome_log_for_category(11LL);
        unint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
        *(void *)__int128 buf = 0LL;
        *(void *)&uint8_t buf[8] = buf;
        *(void *)&uint8_t buf[16] = 0x2020000000LL;
        LOBYTE(v5_Block_object_dispose((const void *)(v47 - 176), 8) = 16;
        v55[0] = _NSConcreteStackBlock;
        v55[1] = 3221225472LL;
        v55[2] = sub_100014AC0;
        v55[3] = &unk_100068AD8;
        v55[4] = buf;
        if (qword_10007C340 != -1) {
          dispatch_once(&qword_10007C340, v55);
        }
        os_log_type_t v34 = *(_BYTE *)(*(void *)&buf[8] + 24LL);
        _Block_object_dispose(buf, 8);
        if (os_log_type_enabled(v33, v34))
        {
          uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s bookmark](v20, "bookmark"));
          *(_DWORD *)__int128 buf = 138412546;
          *(void *)&uint8_t buf[4] = v35;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v16;
          _os_log_impl( (void *)&_mh_execute_header,  v33,  v34,  "Next enumerator bookmark %@ doesn't match expected %@",  buf,  0x16u);
        }

        unsigned int v30 = (os_log_s *)[v14 newEnumeratorFromBookmark:v16 options:7];
        goto LABEL_30;
      }

      uint64_t v52 = v27;
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s currentFrameStore](v20, "currentFrameStore"));
      unsigned __int8 v50 = objc_msgSend(v31, "offsetIsStartOfFrameStore:", objc_msgSend(v16, "offset"));

      if ((v50 & 1) == 0) {
        goto LABEL_25;
      }
    }

LABEL_31:
    unint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s nextEvent](v20, "nextEvent"));
    uint64_t v37 = __biome_log_for_category(11LL);
    int v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue([v36 eventBodyData]);
      id v49 = [v53 length];
      id v48 = [v16 offset];
      v51 = (void *)objc_claimAutoreleasedReturnValue([v5 timestamp]);
      uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "bm_description"));
      *(_DWORD *)__int128 buf = 134218498;
      *(void *)&uint8_t buf[4] = v49;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v48;
      *(_WORD *)&buf[22] = 2112;
      v58 = v47;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEBUG,  "Read event of size %llu at offset %lu for atom %@",  buf,  0x20u);
    }

    uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v36 bookmark]);
    unsigned __int8 v40 = [v39 isEqual:v16];

    if ((v40 & 1) != 0) {
      goto LABEL_40;
    }
    uint64_t v41 = __biome_log_for_category(11LL);
    __int16 v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
    *(void *)__int128 buf = 0LL;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x2020000000LL;
    LOBYTE(v5_Block_object_dispose((const void *)(v47 - 176), 8) = 16;
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472LL;
    v54[2] = sub_100014AD4;
    v54[3] = &unk_100068AD8;
    v54[4] = buf;
    if (qword_10007C348 != -1) {
      dispatch_once(&qword_10007C348, v54);
    }
    os_log_type_t v43 = *(_BYTE *)(*(void *)&buf[8] + 24LL);
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v42, v43))
    {
      *(_DWORD *)__int128 buf = 138412290;
      *(void *)&uint8_t buf[4] = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v42,  v43,  "populateAtomBatch missing event for bookmark %@, adding a placeholder append",  buf,  0xCu);
    }

LABEL_39:
    unint64_t v36 = 0LL;
LABEL_40:

    id v10 = v36;
LABEL_41:
    v44 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(a1 + 40),  "atomValueFromEvent:ofType:version:",  v10,  objc_msgSend(v5, "type"),  *(void *)(a1 + 72)));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v44 serialize]);

    if (([*(id *)(a1 + 40) addAtomToAtomBatch:*(void *)(a1 + 56) ifChunkerAllows:*(void *)(a1 + 64) fromAtomTableRecord:v5 atomValueData:v14 version:*(unsigned __int8 *)(a1 + 80) atomValueVersion:*(void *)(a1 + 72)] & 1) == 0)
    {
      uint64_t v45 = __biome_log_for_category(11LL);
      uint64_t v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_INFO,  "chunker hit defined limit, returning and setting moreComing bit",  buf,  2u);
      }

      [*(id *)(a1 + 64) setMoreComing:1];
      *a3 = 1;
    }

    os_log_type_t v34 = v20;
    if (v20)
    {
LABEL_32:
      [v10 appendString:@"?"];
      [v11 addObject:v34];

      goto LABEL_48;
    }

    goto LABEL_43;
  }

LABEL_45:
    goto LABEL_46;
  }

  uint64_t v11 = __biome_log_for_category(11LL);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    *(void *)&uint8_t buf[4] = v5;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v10,  OS_LOG_TYPE_DEFAULT,  "%@ location is not active",  buf,  0xCu);
  }

LABEL_46:
}

uint64_t sub_100014AAC(uint64_t result)
{
  *(_BYTE *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 17;
  return result;
}

uint64_t sub_100014AC0(uint64_t result)
{
  *(_BYTE *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 17;
  return result;
}

uint64_t sub_100014AD4(uint64_t result)
{
  *(_BYTE *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 17;
  return result;
}

void sub_100014DA0(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6 = a2;
  uint64_t v7 = __biome_log_for_category(11LL);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "creating new batch with location %@", buf, 0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 location]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 ckMergeableValueIDWithFormatVersion:0]);

  id v15 = 0LL;
  id v11 = [[CKAtomBatch alloc] initWriterWithMergeableValueID:v10 metadata:0 formatVersion:2 error:&v15];
  id v12 = v15;
  if (v12)
  {
    uint64_t v13 = __biome_log_for_category(11LL);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1000410B4();
    }
  }

  else
  {
    [*(id *)(a1 + 32) populateAtomBatch:v11 withAtomsInClockVector:*(void *)(a1 + 40) forLocation:v6 ckFormatVersion:*(unsigned __int8 *)(a1 + 64) valueVersion:0 chunker:*(void *)(a1 + 48)];
    if ([v11 count]) {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
    }
    *a4 = [*(id *)(a1 + 48) moreComing];
  }
}

void sub_100015328( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_10001534C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bookmarkForAtomRow:v3]);
  id v5 = v4;
  if (v4
    && (id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 segmentName]),
        unsigned int v7 = [v6 isEqual:@"DOA"],
        v6,
        !v7))
  {
    uint64_t v10 = __biome_log_for_category(11LL);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v20 = v5;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "deleting event at bookmark %@", buf, 0xCu);
    }

    id v12 = *(void **)(a1 + 40);
    id v18 = 0LL;
    unsigned __int8 v13 = [v12 deleteEventAtBookmark:v5 outTombstoneBookmark:&v18];
    id v14 = v18;
    if ((v13 & 1) == 0)
    {
      uint64_t v15 = __biome_log_for_category(11LL);
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        sub_100041114();
      }
    }

    uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 8LL);
    id v9 = *(os_log_s **)(v17 + 40);
    *(void *)(v17 + 40) = v14;
  }

  else
  {
    uint64_t v8 = __biome_log_for_category(11LL);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v20 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "bookmark is nil, presumably because the referenced atom was a placeholder append (dead on arrival) %@",  buf,  0xCu);
    }
  }
}

LABEL_49:
    uint64_t v32 = (os_log_s *)v68;
    goto LABEL_50;
  }

  unsigned int v30 = __biome_log_for_category(11LL);
  uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
  uint64_t v32 = v31;
  if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
  {
    sub_100041200();
    uint64_t v32 = v31;
  }

LABEL_50:
}

void sub_100015FA4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
}

void sub_100016034(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6 = a2;
  [*(id *)(a1 + 32) markOperationStarted];
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 timestamp]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 timestamp]);

  uint64_t v9 = a1 + 40;
  if ([*(id *)(*(void *)(a1 + 40) + 48) containsCKAtomRowWithTimestamp:v8 inStream:*(void *)(*(void *)(a1 + 40) + 16) onDisk:1])
  {
    uint64_t v10 = __biome_log_for_category(11LL);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bm_description"));
      uint64_t v13 = *(void *)(*(void *)v9 + 8LL);
      *(_DWORD *)__int128 buf = 138412546;
      v71 = v12;
      __int16 v72 = 2112;
      uint64_t v73 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Warning: dropping atom %@ in stream %@ because it is already merged",  buf,  0x16u);
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) originatingSiteIdentifier]);
    uint64_t v15 = objc_alloc(&OBJC_CLASS___NSString);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v6 timestamp]);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 siteIdentifier]);
    id v18 = -[NSString initWithData:encoding:](v15, "initWithData:encoding:", v17, 4LL);

    uint64_t v19 = *(void *)(a1 + 40);
    id v20 = *(void **)(v19 + 80);
    uint64_t v21 = *(void *)(v19 + 16);
    NSUInteger v22 = -[NSString length](v18, "length");
    os_log_type_t v23 = v18;
    if (!v22) {
      os_log_type_t v23 = *(NSString **)(a1 + 56);
    }
    [v20 recordAtomMergeResult:1 inStream:v21 ownerSite:v23 originatingSite:v14 eventCreatedAt:*(void *)(a1 + 48) sessionContext:0.0];
    goto LABEL_10;
  }

  if (![*(id *)(*(void *)v9 + 48) containsCKAtomRowWithTimestamp:v8 inStream:*(void *)(*(void *)v9 + 16) onDisk:0])
  {
    unsigned __int8 v26 = (void *)objc_claimAutoreleasedReturnValue([v6 references]);
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 proxyAtIndex:0]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v27 reference]);

    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v14 timestamp]);
    id v29 = [v28 clockValue];

    if (v29)
    {
      uint64_t v30 = objc_claimAutoreleasedReturnValue([v14 mergeableValueID]);
      if (!v30
        || (uint64_t v31 = (void *)v30,
            uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v14 mergeableValueID]),
            unint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v32 identifier]),
            v33,
            v32,
            v31,
            !v33))
      {
        uint64_t v45 = __biome_log_for_category(11LL);
        uint64_t v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT)) {
          sub_100041480();
        }

        *a4 = 1;
        goto LABEL_11;
      }

      os_log_type_t v34 = *(void **)(a1 + 64);
      uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v14 mergeableValueID]);
      unint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v35 name]);
      uint64_t v37 = (BMStreamCRDTLocation *)objc_claimAutoreleasedReturnValue([v34 objectForKey:v36]);

      if (!v37)
      {
        int v38 = objc_alloc(&OBJC_CLASS___BMStreamCRDTLocation);
        uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v14 mergeableValueID]);
        uint64_t v37 = -[BMStreamCRDTLocation initWithCKMergeableValueID:streamName:]( v38,  "initWithCKMergeableValueID:streamName:",  v39,  *(void *)(*(void *)(a1 + 40) + 16LL));

        unsigned __int8 v40 = *(void **)(a1 + 64);
        uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v14 mergeableValueID]);
        __int16 v42 = (void *)objc_claimAutoreleasedReturnValue([v41 name]);
        [v40 setObject:v37 forKey:v42];
      }

      uint64_t v43 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 72) objectForKey:v37]);
      v68 = a4;
      v69 = v8;
      v67 = v37;
      if (!v37 || v43)
      {
        uint64_t v44 = v43;
      }

      else
      {
        uint64_t v44 = objc_claimAutoreleasedReturnValue([*(id *)(*(void *)v9 + 48) locationRowWithLocation:v37]);
        if (!v44)
        {
          uint64_t v44 = objc_claimAutoreleasedReturnValue([*(id *)(*(void *)v9 + 48) insertLocationIfNotExists:v37 withState:1]);
          if (!v44)
          {
            uint64_t v62 = __biome_log_for_category(11LL);
            BOOL v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
            if (os_log_type_enabled(v63, OS_LOG_TYPE_FAULT)) {
              sub_1000414AC();
            }

            *a4 = 1;
            goto LABEL_11;
          }
        }

        [*(id *)(a1 + 72) setObject:v44 forKey:v37];
      }
    }

    else
    {
      v68 = a4;
      v69 = v8;

      uint64_t v44 = 0LL;
      v67 = 0LL;
      id v14 = 0LL;
    }

    uint64_t v47 = objc_alloc(&OBJC_CLASS___BMSyncCKAtomRow);
    uint64_t v64 = *(void *)(a1 + 80);
    v65 = v47;
    id v48 = (void *)objc_claimAutoreleasedReturnValue([v6 timestamp]);
    id v49 = (void *)objc_claimAutoreleasedReturnValue([v48 timestamp]);
    id v50 = [v6 atomType];
    id v51 = [v6 version];
    uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue([v6 value]);
    uint64_t v53 = v65;
    uint64_t v66 = (void *)v44;
    v54 = -[BMSyncCKAtomRow initWithLocation:timestamp:referenceLocation:causalReference:type:valueVersion:valueData:]( v53,  "initWithLocation:timestamp:referenceLocation:causalReference:type:valueVersion:valueData:",  v64,  v49,  v44,  v14,  v50,  v51,  v52);

    uint64_t v55 = __biome_log_for_category(11LL);
    v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG)) {
      sub_10004138C(v54, v56);
    }

    if ([*(id *)(*(void *)v9 + 48) addCKAtomRow:v54 inStream:*(void *)(*(void *)v9 + 16)])
    {
      v58 = v66;
      uint64_t v57 = v67;
      if ([*(id *)(a1 + 32) markOperationComplete])
      {
LABEL_37:

        uint64_t v8 = v69;
        goto LABEL_11;
      }

      uint64_t v59 = __biome_log_for_category(11LL);
      v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
        sub_100041268();
      }
    }

    else
    {
      uint64_t v61 = __biome_log_for_category(11LL);
      v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
        sub_100041294(v54, v9, v60);
      }
      v58 = v66;
      uint64_t v57 = v67;
    }

    _BYTE *v68 = 1;
    goto LABEL_37;
  }

  uint64_t v24 = __biome_log_for_category(11LL);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bm_description"));
    uint64_t v25 = *(void *)(*(void *)v9 + 8LL);
    *(_DWORD *)__int128 buf = 138412546;
    v71 = v18;
    __int16 v72 = 2112;
    uint64_t v73 = v25;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v14,  OS_LOG_TYPE_DEFAULT,  "Warning: atom %@ in stream %@ already in table but not on disk",  buf,  0x16u);
LABEL_10:
  }

void sub_10001665C(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5 = a2;
  if (![v5 type])
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) frame]);
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 data]);

    LODWORD(v6) = bm_generateChecksum([v7 bytes], objc_msgSend(v7, "length"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 valueData]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[BMSyncAtomValue atomValueFromData:version:]( BMSyncAtomValue,  "atomValueFromData:version:",  v8,  [v5 valueVersion]));

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 value]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 eventData]);
    if ((_DWORD)v6 == bm_generateChecksum([v11 bytes], objc_msgSend(v11, "length")))
    {
      id v29 = v10;
      uint64_t v30 = v9;
      uint64_t v31 = v7;
      uint64_t v32 = a3;
      uint64_t v27 = objc_alloc(&OBJC_CLASS___BMSyncCKAtomRow);
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 location]);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v5 timestamp]);
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v5 referenceLocation]);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v5 causalReference]);
      id v26 = [v5 type];
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) bookmark]);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 segmentName]);
      id v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) bookmark]);
      uint64_t v28 = -[BMSyncCKAtomRow initWithLocation:timestamp:referenceLocation:causalReference:type:segmentName:segmentOffset:]( v27,  "initWithLocation:timestamp:referenceLocation:causalReference:type:segmentName:segmentOffset:",  v12,  v13,  v14,  v15,  v26,  v17,  [v18 offset]);

      uint64_t v19 = __biome_log_for_category(11LL);
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138412290;
        id v34 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "updating row for atom inferred to be applied to disk %@",  buf,  0xCu);
      }

      unsigned int v7 = v31;
      a3 = v32;
      uint64_t v10 = v29;
      uint64_t v9 = v30;
      if ((objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "updateCKAtomRow:inStream:") & 1) == 0)
      {
        uint64_t v21 = __biome_log_for_category(11LL);
        NSUInteger v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          sub_100041510();
        }
      }
    }
  }

  uint64_t v23 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) nextEvent]);
  uint64_t v24 = *(void *)(*(void *)(a1 + 48) + 8LL);
  uint64_t v25 = *(void **)(v24 + 40);
  *(void *)(v24 + 40) = v23;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL)) {
    *a3 = 1;
  }
}

void sub_100016984(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5 = a2;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) originatingSiteIdentifier]);
  unsigned int v7 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 timestamp]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 siteIdentifierObject]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
  id v11 = -[NSString initWithData:encoding:](v7, "initWithData:encoding:", v10, 4LL);

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 causalReference]);
  unsigned __int8 v13 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) isEqualToReference:v12];
  if (!v12) {
    goto LABEL_8;
  }
  if ((v13 & 1) != 0) {
    goto LABEL_8;
  }
  id v14 = *(void **)(*(void *)(a1 + 40) + 48LL);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v12 timestamp]);
  LOBYTE(v14) = [v14 containsCKAtomRowWithTimestamp:v15 inStream:*(void *)(*(void *)(a1 + 40) + 16) onDisk:1];

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v5 referenceLocation]);
  uint64_t v17 = (char *)[v16 state];

  uint64_t v18 = __biome_log_for_category(11LL);
  uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  id v20 = v19;
  if ((unint64_t)(v17 - 3) <= 1)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v5 referenceLocation]);
      *(_DWORD *)__int128 buf = 138412290;
      v71 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "causal reference location %@ points to dead location, not a violation",  buf,  0xCu);
    }

LABEL_8:
    uint64_t v22 = __biome_log_for_category(11LL);
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      sub_100041620(v5, v23);
    }

    if ([v5 type])
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 24LL) = 1;
      uint64_t v24 = *(void **)(a1 + 40);
      uint64_t v25 = *(void *)(a1 + 56);
      id v67 = 0LL;
      id v68 = 0LL;
      unsigned __int8 v26 = [v24 handleDeleteAtomRow:v5 usingPruner:v25 outBookmark:&v68 outTombstoneBookmark:&v67];
      unint64_t v27 = (unint64_t)v68;
      id v28 = v67;
      [*(id *)(*(void *)(a1 + 40) + 48) saveLatestTombstoneBookmark:v28 forSiteIdentifier:*(void *)(a1 + 64) inStream:*(void *)(*(void *)(a1 + 40) + 16)];
      id v29 = 0LL;
      if ((v26 & 1) == 0)
      {
LABEL_28:
        uint64_t v60 = __biome_log_for_category(11LL);
        uint64_t v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
          sub_100041570(v5, v44);
        }
LABEL_30:

        goto LABEL_31;
      }
    }

    else
    {
      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v5 valueData]);
      id v29 = (void *)objc_claimAutoreleasedReturnValue( +[BMSyncAtomValue atomValueFromData:version:]( BMSyncAtomValue,  "atomValueFromData:version:",  v30,  [v5 valueVersion]));

      if (!v29)
      {
        unint64_t v27 = 0LL;
        id v28 = 0LL;
        goto LABEL_28;
      }

      *(_BYTE *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL) = 1;
      uint64_t v31 = *(void **)(a1 + 40);
      uint64_t v32 = *(void *)(a1 + 48);
      id v69 = 0LL;
      unsigned __int8 v33 = [v31 writeAtomValue:v29 fromAtomRow:v5 usingWriter:v32 outBookmark:&v69];
      unint64_t v27 = (unint64_t)v69;
      id v28 = 0LL;
      if ((v33 & 1) == 0) {
        goto LABEL_28;
      }
    }

    uint64_t v61 = a3;
    id v62 = v28;
    uint64_t v64 = v12;
    v65 = v11;
    uint64_t v66 = v6;
    BOOL v63 = v29;
    id v34 = (void *)objc_claimAutoreleasedReturnValue([v29 value]);
    uint64_t v35 = objc_claimAutoreleasedReturnValue([v34 eventData]);
    unint64_t v36 = v35 | v27;

    if (!v36) {
      unint64_t v27 = (unint64_t)[[BMStoreBookmark alloc] initWithStream:*(void *)(*(void *)(a1 + 40) + 8) segment:@"DOA" iterationStartTime:clock_gettime_nsec_np(_CLOCK_MONOTONIC) offset:0.0];
    }
    uint64_t v37 = objc_alloc(&OBJC_CLASS___BMSyncCKAtomRow);
    int v38 = (void *)objc_claimAutoreleasedReturnValue([v5 location]);
    uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v5 timestamp]);
    unsigned __int8 v40 = (void *)objc_claimAutoreleasedReturnValue([v5 referenceLocation]);
    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v5 causalReference]);
    id v42 = [v5 type];
    uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue([(id)v27 segmentName]);
    uint64_t v44 = -[BMSyncCKAtomRow initWithLocation:timestamp:referenceLocation:causalReference:type:segmentName:segmentOffset:]( v37,  "initWithLocation:timestamp:referenceLocation:causalReference:type:segmentName:segmentOffset:",  v38,  v39,  v40,  v41,  v42,  v43,  [(id)v27 offset]);

    if ([*(id *)(*(void *)(a1 + 40) + 48) updateCKAtomRow:v44 inStream:*(void *)(*(void *)(a1 + 40) + 16)])
    {
      id v11 = v65;
      id v28 = v62;
      if (![v5 type])
      {
        uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue([v5 location]);
        uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue([v45 location]);
        uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue([v46 ckMergeableValueIDWithFormatVersion:0]);

        id v48 = objc_alloc(&OBJC_CLASS___CKAtomReference);
        id v49 = (void *)objc_claimAutoreleasedReturnValue([v5 timestamp]);
        id v50 = -[CKAtomReference initWithMergeableValueID:timestamp:type:]( v48,  "initWithMergeableValueID:timestamp:type:",  v47,  v49,  0LL);
        uint64_t v51 = *(void *)(*(void *)(a1 + 72) + 8LL);
        uint64_t v52 = *(void **)(v51 + 40);
        *(void *)(v51 + 40) = v50;
      }

      uint64_t v53 = *(void *)(a1 + 40);
      v54 = *(void **)(v53 + 80);
      uint64_t v55 = *(void *)(v53 + 16);
      id v29 = v63;
      v56 = (void *)objc_claimAutoreleasedReturnValue([v63 value]);
      [v56 dataTimestamp];
      uint64_t v57 = v55;
      id v6 = v66;
      objc_msgSend( v54,  "recordAtomMergeResult:inStream:ownerSite:originatingSite:eventCreatedAt:sessionContext:",  3,  v57,  v65,  v66,  *(void *)(a1 + 32));

      id v12 = v64;
    }

    else
    {
      uint64_t v58 = __biome_log_for_category(11LL);
      uint64_t v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
      id v11 = v65;
      id v28 = v62;
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
        sub_100041510();
      }

      _BYTE *v61 = 1;
      id v6 = v66;
      id v29 = v63;
      id v12 = v64;
    }

    goto LABEL_30;
  }

  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    sub_1000416C8(v5, v12, v20);
  }

  [*(id *)(*(void *)(a1 + 40) + 80) recordAtomMergeResult:2 inStream:*(void *)(*(void *)(a1 + 40) + 16) ownerSite:v11 originatingSite:v6 eventCreatedAt:*(void *)(a1 + 32) sessionContext:0.0];
  *a3 = 1;
LABEL_31:
}

void sub_100017084(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_100017090( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_1000170A0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void sub_1000170D4(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

id sub_1000170E0()
{
  return [v0 type];
}

  ;
}

uint64_t sub_100017100(uint64_t result)
{
  if (result)
  {
    if ((*(_BYTE *)(result + 24) & 1) != 0) {
      return *(unsigned int *)(result + 8);
    }
    else {
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_10001712C(uint64_t result, int a2)
{
  if (result)
  {
    *(_BYTE *)(result + 24) |= 1u;
    *(_DWORD *)(result + _Block_object_dispose(&STACK[0x210], 8) = a2;
  }

  return result;
}

uint64_t sub_100017154(uint64_t result, char a2)
{
  if (result) {
    *(_BYTE *)(result + 24) = *(_BYTE *)(result + 24) & 0xFE | a2;
  }
  return result;
}

uint64_t sub_100017174(uint64_t result)
{
  if (result) {
    return *(_BYTE *)(result + 24) & 1;
  }
  return result;
}

__CFString *sub_10001718C(void *a1, uint64_t a2)
{
  if (a1)
  {
    a1 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  a2));
  }

  return (__CFString *)a1;
}

uint64_t sub_1000171DC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = v3;
    if ([v5 isEqualToString:@"Append"])
    {
      uint64_t v6 = 0LL;
    }

    else if ([v5 isEqualToString:@"TTLDelete"])
    {
      uint64_t v6 = 1LL;
    }

    else if ([v5 isEqualToString:@"RandomDelete"])
    {
      uint64_t v6 = 2LL;
    }

    else if ([v5 isEqualToString:@"Modify"])
    {
      uint64_t v6 = 3LL;
    }

    else if ([v5 isEqualToString:@"Unknown"])
    {
      uint64_t v6 = 4LL;
    }

    else
    {
      uint64_t v6 = 0LL;
    }
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  return v6;
}

BOOL sub_1000172B0(BOOL result)
{
  if (result) {
    return *(void *)(result + 16) != 0LL;
  }
  return result;
}

uint64_t sub_100017440(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0LL;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1LL || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        unint64_t v6 = 0LL;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }

    *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0LL;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    if ((v6 >> 3) == 2)
    {
      uint64_t v17 = objc_alloc_init(&OBJC_CLASS___BMPBStoreEventAtomValue);
      objc_storeStrong((id *)(a1 + 16), v17);
      if (!PBReaderPlaceMark(a2, v19) || (sub_100034154((uint64_t)v17, a2) & 1) == 0)
      {

        return 0LL;
      }

      PBReaderRecallMark(a2, v19);
    }

    else if ((v6 >> 3) == 1)
    {
      char v12 = 0;
      unsigned int v13 = 0;
      uint64_t v14 = 0LL;
      *(_BYTE *)(a1 + 24) |= 1u;
      while (1)
      {
        unint64_t v15 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v15 == -1LL || v15 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v16 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v15);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v15 + 1;
        v14 |= (unint64_t)(v16 & 0x7F) << v12;
        if ((v16 & 0x80) == 0) {
          goto LABEL_32;
        }
        v12 += 7;
        BOOL v9 = v13++ >= 9;
        if (v9)
        {
          LODWORD(v14) = 0;
          goto LABEL_34;
        }
      }

      *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_32:
      if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        LODWORD(v14) = 0;
      }
LABEL_34:
      *(_DWORD *)(a1 + _Block_object_dispose(&STACK[0x210], 8) = v14;
    }

    else
    {
      uint64_t result = PBReaderSkipValueWithTag(a2);
      if (!(_DWORD)result) {
        return result;
      }
    }
  }

  return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

void sub_100017740(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    if ((*(_BYTE *)(a1 + 24) & 1) != 0)
    {
      v3[2] = *(_DWORD *)(a1 + 8);
      *((_BYTE *)v3 + 24) |= 1u;
    }

    char v4 = *(void **)(a1 + 16);
    if (v4)
    {
      unsigned int v5 = v3;
      sub_1000177B8((uint64_t)v3, v4);
      id v3 = v5;
    }
  }
}

void sub_1000177B8(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

void sub_10001796C(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = v3;
  if (a1)
  {
    if ((*((_BYTE *)v3 + 24) & 1) != 0)
    {
      *(_DWORD *)(a1 + _Block_object_dispose(&STACK[0x210], 8) = *((_DWORD *)v3 + 2);
      *(_BYTE *)(a1 + 24) |= 1u;
    }

    unsigned int v5 = (void *)*((void *)v3 + 2);
    if (*(void *)(a1 + 16))
    {
      if (v5)
      {
        id v6 = v3;
        sub_1000347BC(*(void *)(a1 + 16), v5);
LABEL_9:
        char v4 = v6;
      }
    }

    else if (v5)
    {
      id v6 = v3;
      objc_storeStrong((id *)(a1 + 16), v5);
      goto LABEL_9;
    }
  }
}

uint64_t sub_100017A08(uint64_t result)
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

id sub_10001852C(uint64_t a1)
{
  uint64_t v2 = __biome_log_for_category(11LL);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "BMRapportManager: received SIGTERM", v5, 2u);
  }

  return [*(id *)(a1 + 32) invalidate];
}

void sub_100018728(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 40LL));
  if (v3)
  {
    uint64_t v4 = __biome_log_for_category(11LL);
    unsigned int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000417F4((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
    }

    [*(id *)(a1 + 40) addObject:v3];
    uint64_t v12 = *(void *)(a1 + 32);
    unsigned int v13 = *(void **)(v12 + 8);
    *(void *)(v12 + _Block_object_dispose(&STACK[0x210], 8) = 0LL;
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void sub_1000187BC(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 40LL));
  if (v3)
  {
    uint64_t v4 = __biome_log_for_category(11LL);
    unsigned int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10004185C((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
    }

    [*(id *)(a1 + 40) addObject:v3];
    uint64_t v12 = *(void *)(a1 + 32);
    unsigned int v13 = *(void **)(v12 + 16);
    *(void *)(v12 + 16) = 0LL;
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void sub_100018850(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) count];
  uint64_t v3 = *(void *)(a1 + 40);
  if ((unint64_t)v2 > 1)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    NSErrorUserInfoKey v8 = NSMultipleUnderlyingErrorsKey;
    uint64_t v9 = v4;
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"BMRapportErrorDomain",  1LL,  v5));
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v6);
  }

  else
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) firstObject]);
    (*(void (**)(uint64_t))(v3 + 16))(v3);
  }

void sub_100019170( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, id location, id a22)
{
}

void sub_1000191D4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidateClientWithError:0];
}

void sub_100019204(uint64_t a1, void *a2)
{
  uint64_t v3 = (id *)(a1 + 32);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained handleActivationForDevice:v5 error:v4];
}

void sub_1000197DC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_100019808(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v9 = a4;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  if ([v9 code] == (id)-71148
    && (id v5 = (void *)objc_claimAutoreleasedReturnValue([v9 domain]),
        unsigned int v6 = [v5 isEqualToString:RPErrorDomain],
        v5,
        v6))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained invalidateClientWithError:v9];
  }

  else
  {
    NSErrorUserInfoKey v8 = *(void **)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [v8 sendNextRequestToDevice:WeakRetained];
  }
}

void sub_10001BF6C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v10 = (id)objc_claimAutoreleasedReturnValue([v3 stringForColumnIndex:0]);
  id v4 = objc_alloc(&OBJC_CLASS___CKDistributedSiteIdentifier);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v10 dataUsingEncoding:4]);
  id v6 = [v4 initWithIdentifier:v5];

  id v7 = objc_alloc(&OBJC_CLASS___NSIndexSet);
  id v8 = [v3 unsignedLongLongIntForColumnIndex:1];

  id v9 = -[NSIndexSet initWithIndex:](v7, "initWithIndex:", v8);
  [*(id *)(a1 + 32) addClockValuesInIndexSet:v9 forSiteIdentifier:v6];
}

id sub_10001C338(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addIndex:", (int)objc_msgSend(a2, "intForColumn:", @"clock"));
}

void sub_10001C5A0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_10001C5C4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10001C5D4(uint64_t a1)
{
}

void sub_10001C5DC(uint64_t a1, void *a2)
{
  id v15 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v15 stringForColumn:@"site"]);
  id v4 = objc_alloc(&OBJC_CLASS___CKDistributedSiteIdentifier);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 dataUsingEncoding:4]);
  id v6 = [v4 initWithIdentifier:v5];

  unsigned int v7 = [v15 intForColumn:@"type"];
  id v8 = -[NSIndexSet initWithIndex:]( [NSIndexSet alloc],  "initWithIndex:",  (int)[v15 intForColumn:@"clock"]);
  if (v7 == 2)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addClockValuesInIndexSet:v8 withAtomState:1 forSiteIdentifier:v6];
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v15 stringForColumn:@"ref_site"]);
    id v10 = v9;
    if (v9 && [v9 length])
    {
      id v11 = objc_alloc(&OBJC_CLASS___CKDistributedSiteIdentifier);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 dataUsingEncoding:4]);
      id v13 = [v11 initWithIdentifier:v12];

      uint64_t v14 = -[NSIndexSet initWithIndex:]( [NSIndexSet alloc],  "initWithIndex:",  (int)[v15 intForColumn:@"ref_clock"]);
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addClockValuesInIndexSet:v14 withAtomState:2 forSiteIdentifier:v13];
    }
  }

  else if (!v7)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addClockValuesInIndexSet:v8 withAtomState:1 forSiteIdentifier:v6];
  }
}

void sub_10001D95C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = -[BMSyncCKAtomRow initWithFMResultSet:]( objc_alloc(&OBJC_CLASS___BMSyncCKAtomRow),  "initWithFMResultSet:",  *(void *)(a1 + 32));
  (*(void (**)(uint64_t, BMSyncCKAtomRow *, uint64_t))(v4 + 16))(v4, v5, a3);
}

void sub_10001DBF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = -[BMSyncCKAtomRow initWithFMResultSet:]( objc_alloc(&OBJC_CLASS___BMSyncCKAtomRow),  "initWithFMResultSet:",  *(void *)(a1 + 32));
  (*(void (**)(uint64_t, BMSyncCKAtomRow *, uint64_t))(v4 + 16))(v4, v5, a3);
}

void sub_10001E364( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, char a43)
{
}

void sub_10001E3B0(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
  unint64_t v5 = *(void *)(v4 + 24);
  *(void *)(v4 + 24) = v5 + 1;
  if (v5 < 0x1F5)
  {
    if (a3 == 1)
    {
      uint64_t v19 = *(void **)(a1 + 32);
      if (*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL)) {
        id v20 = @"AND clock = ? ";
      }
      else {
        id v20 = @"OR clock = ? ";
      }
    }

    else
    {
      BOOL v21 = sub_100005428(a2, a3);
      uint64_t v19 = *(void **)(a1 + 32);
      if (!v21)
      {
        if (*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL)) {
          uint64_t v25 = @"AND clock BETWEEN ? ";
        }
        else {
          uint64_t v25 = @"OR clock BETWEEN ? ";
        }
        [v19 addObject:v25];
        unsigned __int8 v26 = *(void **)(a1 + 32);
        unint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a2));
        [v26 addObject:v27];

        [*(id *)(a1 + 32) addObject:@" AND ?"];
        id v28 = *(void **)(a1 + 32);
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  a3 + a2 - 1));
        uint64_t v24 = v28;
        goto LABEL_18;
      }

      if (*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL)) {
        id v20 = @"AND clock >= ? ";
      }
      else {
        id v20 = @"OR clock >= ? ";
      }
    }

    [v19 addObject:v20];
    uint64_t v22 = *(void **)(a1 + 32);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a2));
    uint64_t v24 = v22;
LABEL_18:
    [v24 addObject:v23];

    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
    return;
  }

  uint64_t v7 = __biome_log_for_category(11LL);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_100041D6C(v8, v9, v10, v11, v12, v13, v14, v15);
  }

  *a4 = 1;
}

void sub_10001E564(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*(void *)(a1 + 32) + 8),  "SELECT_FROM:COLUMNS:JOIN:WHERE:GROUP_BY:HAVING:ORDER_BY:LIMIT:",  @"CKAtom",  &off_10006EA38,  &off_10006EA50,  *(void *)(a1 + 40),  &off_10006EA68,  0,  &off_10006EA80,  0));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10001E660;
  v6[3] = &unk_1000692F0;
  id v7 = v2;
  id v8 = *(id *)(a1 + 48);
  __int128 v5 = *(_OWORD *)(a1 + 56);
  id v3 = (id)v5;
  __int128 v9 = v5;
  id v4 = v2;
  [v4 enumerateWithBlock:v6];
  [v4 close];
}

void sub_10001E660(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  __int128 v5 = -[BMSyncCRDTLocationRow initWithFMResultSet:modifier:]( objc_alloc(&OBJC_CLASS___BMSyncCRDTLocationRow),  "initWithFMResultSet:modifier:",  *(void *)(a1 + 32),  1LL);
  if (v5)
  {
    [*(id *)(a1 + 40) addObject:v5];
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"received nil CRDTLocation while enumerating active locations for stream: %@",  *(void *)(a1 + 48),  NSDebugDescriptionErrorKey));
    uint64_t v12 = v6;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));
    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"BMSyncDatabaseErrorDomain",  1LL,  v7));
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8LL);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    *a3 = 1;
  }
}

void sub_10001EB50( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, char a41)
{
}

void sub_10001EB98(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
  unint64_t v5 = *(void *)(v4 + 24);
  *(void *)(v4 + 24) = v5 + 1;
  if (v5 < 0x1F5)
  {
    if (a3 == 1)
    {
      uint64_t v19 = *(void **)(a1 + 32);
      if (*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL)) {
        id v20 = @"AND clock = ? ";
      }
      else {
        id v20 = @"OR clock = ? ";
      }
    }

    else
    {
      BOOL v21 = sub_100005428(a2, a3);
      uint64_t v19 = *(void **)(a1 + 32);
      if (!v21)
      {
        if (*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL)) {
          uint64_t v25 = @"AND clock BETWEEN ? ";
        }
        else {
          uint64_t v25 = @"OR clock BETWEEN ? ";
        }
        [v19 addObject:v25];
        unsigned __int8 v26 = *(void **)(a1 + 32);
        unint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a2));
        [v26 addObject:v27];

        [*(id *)(a1 + 32) addObject:@" AND ?"];
        id v28 = *(void **)(a1 + 32);
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  a3 + a2 - 1));
        uint64_t v24 = v28;
        goto LABEL_18;
      }

      if (*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL)) {
        id v20 = @"AND clock >= ? ";
      }
      else {
        id v20 = @"OR clock >= ? ";
      }
    }

    [v19 addObject:v20];
    uint64_t v22 = *(void **)(a1 + 32);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a2));
    uint64_t v24 = v22;
LABEL_18:
    [v24 addObject:v23];

    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
    return;
  }

  uint64_t v7 = __biome_log_for_category(11LL);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_100041D6C(v8, v9, v10, v11, v12, v13, v14, v15);
  }

  *a4 = 1;
}

void sub_10001ED4C(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(a1 + 32),  "SELECT_ATOMS_WHERE:ORDER_BY:LIMIT:",  *(void *)(a1 + 40),  &off_10006EA98,  0));
  unint64_t v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472LL;
  uint64_t v7 = sub_10001EDF4;
  uint64_t v8 = &unk_1000692A0;
  id v3 = *(id *)(a1 + 48);
  id v9 = v2;
  id v10 = v3;
  id v4 = v2;
  [v4 enumerateWithBlock:&v5];
  objc_msgSend(v4, "close", v5, v6, v7, v8);
}

void sub_10001EDF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 40);
  unint64_t v5 = -[BMSyncCKAtomRow initWithFMResultSet:]( objc_alloc(&OBJC_CLASS___BMSyncCKAtomRow),  "initWithFMResultSet:",  *(void *)(a1 + 32));
  (*(void (**)(uint64_t, BMSyncCKAtomRow *, uint64_t))(v4 + 16))(v4, v5, a3);
}

void sub_10001F24C( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_10001F5BC(void *a1)
{
  if (([*(id *)(a1[4] + 8) start] & 1) == 0)
  {
    uint64_t v2 = a1[5];
    if (v2)
    {
      id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  BMSyncErrorDomain,  2LL,  0LL));
      (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
    }

    uint64_t v4 = a1[6];
    if (v4)
    {
      unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  BMSyncErrorDomain,  2LL,  0LL));
      uint64_t v7 = v5;
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 1LL));
      (*(void (**)(uint64_t, void *, void *))(v4 + 16))(v4, &__NSArray0__struct, v6);
    }
  }

uint64_t sub_10001F6D4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_10001F6E8(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0LL);
  }
  return result;
}

void sub_10001F7A8(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 8) start])
  {
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 8) syncScheduler]);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10001F940;
    v9[3] = &unk_100069368;
    id v10 = *(id *)(a1 + 48);
    [v2 syncRapportNowIfPolicyAllowsWithReason:5 activity:0 completionHandler:v9];

    uint64_t v3 = *(void *)(a1 + 40);
    if (v3) {
      (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0LL);
    }
    uint64_t v4 = v10;
    goto LABEL_9;
  }

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  BMSyncErrorDomain,  2LL,  0LL));
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  }

  uint64_t v7 = *(void *)(a1 + 48);
  if (v7)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  BMSyncErrorDomain,  2LL,  0LL));
    uint64_t v11 = v4;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
    (*(void (**)(uint64_t, void *, void *))(v7 + 16))(v7, &__NSArray0__struct, v8);

LABEL_9:
  }

uint64_t sub_10001F940(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_10001FA28(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 8) start])
  {
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 8) syncScheduler]);
    uint64_t v3 = *(void *)(a1 + 40);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10001FBC8;
    v10[3] = &unk_100069368;
    id v11 = *(id *)(a1 + 56);
    [v2 syncRapportNowIfPolicyAllowsWithDevices:v3 reason:5 activity:0 completionHandler:v10];

    uint64_t v4 = *(void *)(a1 + 48);
    if (v4) {
      (*(void (**)(uint64_t, void))(v4 + 16))(v4, 0LL);
    }
    uint64_t v5 = v11;
    goto LABEL_9;
  }

  uint64_t v6 = *(void *)(a1 + 48);
  if (v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  BMSyncErrorDomain,  2LL,  0LL));
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }

  uint64_t v8 = *(void *)(a1 + 56);
  if (v8)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  BMSyncErrorDomain,  2LL,  0LL));
    uint64_t v12 = v5;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 1LL));
    (*(void (**)(uint64_t, void *, void *))(v8 + 16))(v8, &__NSArray0__struct, v9);

LABEL_9:
  }

uint64_t sub_10001FBC8(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_10001FCEC(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_10001FE30(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_10001FF3C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100020110(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) teardown];
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6) {
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);
  }
}

void sub_10002036C(id *a1)
{
  if ([*((id *)a1[4] + 1) start])
  {
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*((id *)a1[4] + 1) primaryDatabase]);
    uint64_t v3 = (uint64_t)a1[5];
    if (v3)
    {
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[BMSyncDatabase createDatabaseForAccount:queue:]( &OBJC_CLASS___BMSyncDatabase,  "createDatabaseForAccount:queue:",  v3,  *((void *)a1[4] + 2)));

      if (([v4 open] & 1) == 0)
      {
        uint64_t v29 = __biome_log_for_category(11LL);
        uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          sub_100041DA0(a1 + 5, v30);
        }

        uint64_t v31 = (void (**)(id, void *))a1[6];
        id obj = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  BMSyncErrorDomain,  3LL,  0LL));
        v31[2](v31, &__NSArray0__struct);
        goto LABEL_25;
      }

      uint64_t v32 = a1;
      uint64_t v2 = v4;
    }

    else
    {
      uint64_t v32 = a1;
    }

    uint64_t v6 = -[BMSyncDevicePeerStatusTracker initWithDatabase:]( objc_alloc(&OBJC_CLASS___BMSyncDevicePeerStatusTracker),  "initWithDatabase:",  v2);
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( -[BMSyncDevicePeerStatusTracker localDeviceIdentifierCreatingIfNecessary]( v6,  "localDeviceIdentifierCreatingIfNecessary"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDevicePeerStatusTracker allPeers](v6, "allPeers"));
    if (a1[5]) {
      [v2 close];
    }

    uint64_t v8 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    id obj = v7;
    id v9 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v39;
      unsigned __int8 v33 = v8;
      id v34 = v4;
      do
      {
        uint64_t v12 = 0LL;
        id v35 = v10;
        do
        {
          if (*(void *)v39 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)v12);
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 deviceIdentifier]);
          unsigned __int8 v15 = [v14 isEqualToString:v4];

          if ((v15 & 1) == 0)
          {
            id v16 = objc_alloc(&OBJC_CLASS___BMDevice);
            uint64_t v17 = objc_claimAutoreleasedReturnValue([v13 deviceIdentifier]);
            uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v13 idsDeviceIdentifier]);
            uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v13 metadata]);
            id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 name]);
            BOOL v21 = (void *)objc_claimAutoreleasedReturnValue([v13 metadata]);
            uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 model]);
            uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v13 metadata]);
            id v24 = [v23 platform];
            uint64_t v25 = v16;
            unsigned __int8 v26 = (void *)v17;
            id v27 = [v25 initWithDeviceIdentifier:v17 idsDeviceIdentifier:v18 name:v20 model:v22 platform:v24];

            id v10 = v35;
            uint64_t v8 = v33;

            uint64_t v4 = v34;
            -[NSMutableArray addObject:](v33, "addObject:", v27);
          }

          uint64_t v12 = (char *)v12 + 1;
        }

        while (v10 != v12);
        id v10 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
      }

      while (v10);
    }

    id v28 = (void (**)(id, NSMutableArray *, void))v32[6];
    if (v28) {
      v28[2](v28, v8, 0LL);
    }

LABEL_25:
    return;
  }

  id v5 = (void (**)(id, void *))a1[6];
  if (v5)
  {
    id obja = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  BMSyncErrorDomain,  2LL,  0LL));
    v5[2](v5, &__NSArray0__struct);
  }

void sub_1000207D4(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 8) start])
  {
    uint64_t v2 = objc_alloc(&OBJC_CLASS___BMSyncDevicePeerStatusTracker);
    uint64_t v23 = a1;
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 8) primaryDatabase]);
    uint64_t v4 = -[BMSyncDevicePeerStatusTracker initWithDatabase:](v2, "initWithDatabase:", v3);

    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDevicePeerStatusTracker allPeers](v4, "allPeers"));
    uint64_t v22 = v4;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[BMSyncDevicePeerStatusTracker localDeviceIdentifierCreatingIfNecessary]( v4,  "localDeviceIdentifierCreatingIfNecessary"));
    id v7 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    id obj = v5;
    id v8 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v27;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v27 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 dictionaryRepresentation]);
          id v14 = [v13 mutableCopy];

          unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue([v12 deviceIdentifier]);
          unsigned int v16 = [v15 isEqual:v6];

          if (v16) {
            [v14 setObject:&__kCFBooleanTrue forKeyedSubscript:@"isMe"];
          }
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v12 metadata]);
          uint64_t Description = BMDevicePlatformGetDescription([v17 platform]);
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(Description);
          [v14 setObject:v19 forKeyedSubscript:@"platformDescription"];

          -[NSMutableArray addObject:](v7, "addObject:", v14);
        }

        id v9 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      }

      while (v9);
    }

    uint64_t v20 = *(void *)(v23 + 40);
    if (v20) {
      (*(void (**)(uint64_t, NSMutableArray *, void))(v20 + 16))(v20, v7, 0LL);
    }
  }

  else
  {
    uint64_t v21 = *(void *)(a1 + 40);
    if (v21)
    {
      id obja = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  BMSyncErrorDomain,  2LL,  0LL));
      (*(void (**)(uint64_t, void *))(v21 + 16))(v21, &__NSArray0__struct);
    }
  }

void sub_100020B38(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___BMSyncDevice);
  uint64_t v2 = (void *)qword_10007C350;
  qword_10007C350 = (uint64_t)v1;

  id v3 = +[BMDeviceMetadataUtils platform](&OBJC_CLASS___BMDeviceMetadataUtils, "platform");
  *(void *)(qword_10007C350 + _Block_object_dispose(va, 8) = v3;
}

__CFString *BMRapportErrorToString(unint64_t a1)
{
  if (a1 >= 0xF) {
    return (__CFString *)(id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unknown error (code %ld)",  a1));
  }
  else {
    return off_1000694A0[a1];
  }
}

id sub_100020E58(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _validateDevice:a2];
}

NSString *sub_100023274(unint64_t a1)
{
  if (a1 >= 5) {
    uint64_t v1 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"BMSyncAtomType(%llu)",  a1);
  }
  else {
    uint64_t v1 = (NSString *)*(&off_100069540 + a1);
  }
  return v1;
}

uint64_t sub_1000237B8(uint64_t result)
{
  *(_BYTE *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 17;
  return result;
}

uint64_t sub_100023A48(uint64_t result)
{
  *(_BYTE *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 17;
  return result;
}

uint64_t sub_100023A5C(uint64_t result)
{
  *(_BYTE *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 17;
  return result;
}

uint64_t sub_100023FCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_opt_class(a1, a2, a3, a4);
}

void sub_100024038(id a1)
{
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue( +[BMStreamSyncPolicy syncableStreamConfigurations]( &OBJC_CLASS___BMStreamSyncPolicy,  "syncableStreamConfigurations"));
  id v1 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v1)
  {
    id v3 = v1;
    uint64_t v4 = *(void *)v39;
    uint64_t v5 = BMUseCaseLegacy;
    uint64_t v6 = &BMDevicePlatformFromModelString_ptr;
    *(void *)&__int128 v2 = 138412546LL;
    __int128 v33 = v2;
    do
    {
      for (i = 0LL; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v39 != v4) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)i);
        id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "storeConfig", v33));
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 datastorePath]);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 streamIdentifier]);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 stringByAppendingPathComponent:v11]);

        id v13 = [v6[34] fileManagerWithMediatedAccessToDirectory:v12 useCase:v5 domain:0 user:getuid()];
        id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        uint64_t v15 = objc_claimAutoreleasedReturnValue(+[BMStoreDirectory remoteDevices](&OBJC_CLASS___BMStoreDirectory, "remoteDevices"));
        unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v12 stringByAppendingPathComponent:v15]);

        id v37 = 0LL;
        LOBYTE(v15) = [v14 removeDirectoryAtPath:v16 error:&v37];
        id v17 = v37;
        uint64_t v18 = v17;
        if ((v15 & 1) == 0)
        {
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v17 userInfo]);
          id v35 = v18;
          uint64_t v20 = v14;
          uint64_t v21 = v6;
          id v22 = v3;
          uint64_t v23 = v5;
          uint64_t v24 = v4;
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:NSUnderlyingErrorKey]);
          unint64_t v36 = v16;
          __int128 v26 = v8;
          id v27 = [v25 code];

          uint64_t v4 = v24;
          uint64_t v5 = v23;
          id v3 = v22;
          uint64_t v6 = v21;
          id v14 = v20;
          uint64_t v18 = v35;

          BOOL v28 = v27 == (id)2;
          __int128 v29 = v26;
          unsigned int v16 = v36;
          if (!v28)
          {
            uint64_t v30 = __biome_log_for_category(11LL);
            uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v29 streamIdentifier]);
              *(_DWORD *)__int128 buf = v33;
              uint64_t v43 = v32;
              __int16 v44 = 2112;
              uint64_t v45 = v35;
              _os_log_error_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "failed to delete remotes for stream %@: %@",  buf,  0x16u);
            }
          }
        }
      }

      id v3 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
    }

    while (v3);
  }
}

void sub_100024490(uint64_t a1)
{
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue( +[BMStreamSyncPolicy syncableStreamConfigurations]( &OBJC_CLASS___BMStreamSyncPolicy,  "syncableStreamConfigurations"));
  id v1 = [obj countByEnumeratingWithState:&v30 objects:v40 count:16];
  if (v1)
  {
    id v3 = v1;
    uint64_t v26 = *(void *)v31;
    uint64_t v25 = BMUseCaseLegacy;
    *(void *)&__int128 v2 = 138412802LL;
    __int128 v23 = v2;
    do
    {
      uint64_t v4 = 0LL;
      do
      {
        if (*(void *)v31 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)v4);
        uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[BMPaths pathForSharedSyncWithAccount:streamType:domain:]( &OBJC_CLASS___BMPaths,  "pathForSharedSyncWithAccount:streamType:domain:",  *(void *)(a1 + 32),  2LL,  0LL,  v23));
        id v7 = +[BMFileManager fileManagerWithMediatedAccessToDirectory:useCase:domain:user:]( &OBJC_CLASS___BMFileManager,  "fileManagerWithMediatedAccessToDirectory:useCase:domain:user:",  v6,  v25,  0LL,  getuid());
        id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
        uint64_t v9 = objc_claimAutoreleasedReturnValue(+[BMStoreDirectory remoteDevices](&OBJC_CLASS___BMStoreDirectory, "remoteDevices"));
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:v9]);

        id v29 = 0LL;
        LOBYTE(v9) = [v8 removeDirectoryAtPath:v10 error:&v29];
        id v11 = v29;
        uint64_t v12 = v11;
        if ((v9 & 1) == 0)
        {
          id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 userInfo]);
          id v27 = v8;
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:NSUnderlyingErrorKey]);
          uint64_t v15 = v5;
          unsigned int v16 = v10;
          id v17 = [v14 code];

          id v8 = v27;
          BOOL v18 = v17 == (id)2;
          uint64_t v10 = v16;
          if (!v18)
          {
            uint64_t v19 = __biome_log_for_category(11LL);
            uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v15 streamIdentifier]);
              uint64_t v22 = *(void *)(a1 + 32);
              *(_DWORD *)__int128 buf = v23;
              id v35 = v21;
              __int16 v36 = 2112;
              uint64_t v37 = v22;
              __int16 v38 = 2112;
              __int128 v39 = v12;
              _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "failed to delete remotes for stream %@ BM Account %@: %@",  buf,  0x20u);

              id v8 = v27;
            }
          }
        }

        uint64_t v4 = (char *)v4 + 1;
      }

      while (v3 != v4);
      id v3 = [obj countByEnumeratingWithState:&v30 objects:v40 count:16];
    }

    while (v3);
  }
}

id sub_100024978(id result)
{
  if (result)
  {
    id v1 = (void *)objc_claimAutoreleasedReturnValue([result syncPolicy]);
    id v2 = [v1 supportsTransport:3 direction:3];

    return v2;
  }

  return result;
}

__CFString *sub_100024A18(unint64_t a1)
{
  if (a1 >= 4)
  {
    uint64_t v3 = __biome_log_for_category(11LL);
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_10004224C();
    }

    id v2 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %lu)",  a1));
  }

  else
  {
    id v2 = off_100069860[a1];
  }

  return v2;
}

uint64_t sub_100024AA0(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"syncRecord"])
  {
    uint64_t v2 = 1LL;
  }

  else if ([v1 isEqualToString:@"zoneVersion"])
  {
    uint64_t v2 = 2LL;
  }

  else if ([v1 isEqualToString:@"highestDeletedLocation"])
  {
    uint64_t v2 = 3LL;
  }

  else
  {
    uint64_t v2 = 0LL;
  }

  return v2;
}

void sub_1000250B8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_1000250F4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained syncSessionDidStartWithReason:*(void *)(a1 + 48)];
  uint64_t v5 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  uint64_t v6 = (void *)WeakRetained[3];
  WeakRetained[3] = v5;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000251BC;
  v8[3] = &unk_1000695E8;
  void v8[4] = WeakRetained;
  id v9 = *(id *)(a1 + 32);
  id v10 = v3;
  id v7 = v3;
  [WeakRetained fetchChangesWithError:v8];
}

void sub_1000251BC(uint64_t a1, void *a2)
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10002526C;
  v6[3] = &unk_1000695C0;
  id v7 = a2;
  id v3 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = v4;
  id v10 = *(id *)(a1 + 48);
  id v5 = v7;
  [v3 uploadChangesWithError:v6];
}

void sub_10002526C(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 2LL));
  id v4 = v3;
  if (*(void *)(a1 + 32)) {
    objc_msgSend(v3, "addObject:");
  }
  if (v7) {
    [v4 addObject:v7];
  }
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 40) + 24) allObjects]);
  (*(void (**)(uint64_t, void *, void *))(v5 + 16))(v5, v6, v4);

  (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
  [*(id *)(a1 + 40) syncSessionDidEnd];
}

void sub_100025478(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 40);
  uint64_t v5 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 48LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100025508;
  block[3] = &unk_100069638;
  id v8 = v3;
  id v9 = v4;
  id v6 = v3;
  dispatch_sync(v5, block);
}

uint64_t sub_100025508(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void sub_100025D9C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 80) recordIDsToSave]);
  if ([v4 count])
  {
  }

  else
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 80) recordIDsToDelete]);
    id v6 = [v5 count];

    if (!v6)
    {
      id v17 = *(void **)(a1 + 40);
      BOOL v18 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 48LL);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100026044;
      block[3] = &unk_100069638;
      id v21 = v3;
      id v22 = v17;
      id v19 = v3;
      dispatch_sync(v18, block);

      unsigned int v16 = v22;
      goto LABEL_7;
    }
  }

  uint64_t v7 = __biome_log_for_category(11LL);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 80) recordIDsToSave]);
    id v10 = [v9 count];
    id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 80) recordIDsToDelete]);
    *(_DWORD *)__int128 buf = 134218240;
    id v27 = v10;
    __int16 v28 = 2048;
    id v29 = [v11 count];
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "after modifying changes, we have %lu records to sync and %lu records to delete as a result of error handling",  buf,  0x16u);
  }

  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = *(void **)(a1 + 40);
  id v14 = *(void **)(v12 + 80);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100025FAC;
  v23[3] = &unk_100069688;
  v23[4] = v12;
  id v24 = v3;
  id v25 = v13;
  id v15 = v3;
  [v14 modifyPendingChangesWithCompletionHandler:v23];

  unsigned int v16 = v25;
LABEL_7:
}

void sub_100025FAC(uint64_t a1)
{
  uint64_t v2 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 48LL);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100026034;
  v3[3] = &unk_100069638;
  id v5 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  dispatch_sync(v2, v3);
}

uint64_t sub_100026034(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

uint64_t sub_100026044(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void sub_100026344(_Unwind_Exception *a1)
{
}

void sub_10002635C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (!v2[8] || !v2[9] || !v2[10])
  {
    id v3 = (void *)objc_opt_new(&OBJC_CLASS___CKContainerOptions);
    [v3 setFetchChangesForMergeableValues:1];
    id v4 = [[CKContainerID alloc] initWithContainerIdentifier:@"com.apple.biome.sync" environment:1];
    id v5 = -[CKContainer initWithContainerID:options:]( objc_alloc(&OBJC_CLASS___CKContainer),  "initWithContainerID:options:",  v4,  v3);
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(v6 + 64);
    *(void *)(v6 + 64) = v5;

    if (!*(void *)(*(void *)(a1 + 32) + 64LL))
    {
      uint64_t v8 = __biome_log_for_category(11LL);
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10004247C();
      }

      *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
    }

    if (*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL))
    {
      [*(id *)(a1 + 32) handleTransitionToNewMergeableValueRecordValueKey];
      id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 16) ckSyncEngineMetaData]);
      id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
      unsigned int v12 = [v10 isEqual:v11];

      if (v12)
      {

        id v10 = 0LL;
      }

      id v13 = objc_alloc(&OBJC_CLASS___CKSyncEngineConfiguration);
      id v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 64) privateCloudDatabase]);
      id v15 = -[CKSyncEngineConfiguration initWithDatabase:dataSource:metadata:]( v13,  "initWithDatabase:dataSource:metadata:",  v14,  *(void *)(a1 + 32),  v10);
      uint64_t v16 = *(void *)(a1 + 32);
      id v17 = *(void **)(v16 + 72);
      *(void *)(v16 + 72) = v15;

      if (!*(void *)(*(void *)(a1 + 32) + 72LL))
      {
        uint64_t v18 = __biome_log_for_category(11LL);
        id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          sub_100042450();
        }

        *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
      }

      if (*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL))
      {
        [*(id *)(*(void *)(a1 + 32) + 72) setAutomaticSyncingEnabled:0];
        uint64_t v20 = -[CKSyncEngine initWithConfiguration:]( objc_alloc(&OBJC_CLASS___CKSyncEngine),  "initWithConfiguration:",  *(void *)(*(void *)(a1 + 32) + 72LL));
        uint64_t v21 = *(void *)(a1 + 32);
        id v22 = *(void **)(v21 + 80);
        *(void *)(v21 + 80) = v20;

        if (!*(void *)(*(void *)(a1 + 32) + 80LL))
        {
          uint64_t v23 = __biome_log_for_category(11LL);
          id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
            sub_100042424();
          }

          *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
        }
      }
    }
  }

void sub_1000265D0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = __biome_log_for_category(11LL);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000424A8();
    }
  }

  (*(void (**)(void, id, id))(*(void *)(a1 + 40) + 16))( *(void *)(a1 + 40),  [*(id *)(a1 + 32) isManateeAvailable:v5],  v6);
}

void sub_100026C1C(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  [*(id *)(*(void *)(a1 + 32) + 16) deleteCKRecordAtLocation:*(void *)(a1 + 40)];
  objc_autoreleasePoolPop(v2);
}

void sub_100026ECC(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) recordID]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 recordName]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) recordID]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 zoneID]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneName]);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:@"crdtDeleted"]);
  id v9 = *(void **)(a1 + 40);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) recordID]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 zoneID]);
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v9 streamConfigurationForZoneID:v11]);

  if (![v8 isEqual:&__kCFBooleanFalse])
  {
    [*(id *)(*(void *)(a1 + 40) + 16) resetMetadataForRecord:v4 zoneName:v7];
    id v15 = 0LL;
    goto LABEL_10;
  }

  if (sub_100024978(v12)
    && [*(id *)(a1 + 40) isRecordNewerThanMostRecentDeleteForSiteIdentifier:*(void *)(a1 + 32)])
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) encryptedValues]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) mergeableRecordValueKey]);
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v14]);

    if (!v15)
    {
      id v24 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) encryptedValues]);
      id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKeyedSubscript:@"biomeCRDT"]);

      if (v25) {
        goto LABEL_20;
      }
      uint64_t v26 = __biome_log_for_category(11LL);
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        sub_100042568();
      }
LABEL_19:

LABEL_20:
      goto LABEL_21;
    }

    id v27 = 0LL;
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v15,  1LL,  &v27));
    id v17 = v27;
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = __biome_log_for_category(11LL);
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)__int128 buf = 138543874;
        id v29 = v4;
        __int16 v30 = 2114;
        __int128 v31 = v7;
        __int16 v32 = 2114;
        __int128 v33 = v18;
        _os_log_fault_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_FAULT,  "Error encoding serverValue for %{public}@ %{public}@, %{public}@",  buf,  0x20u);
      }

LABEL_18:
      goto LABEL_19;
    }

    id v15 = v16;
LABEL_10:
    uint64_t v16 = -[BMStreamCRDTLocation initWithZoneName:recordName:]( objc_alloc(&OBJC_CLASS___BMStreamCRDTLocation),  "initWithZoneName:recordName:",  v7,  v4);
    if (v16)
    {
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(a1 + 40) + 16) insertLocationIfNotExists:v16 withState:2]);
      if (([*(id *)(*(void *)(a1 + 40) + 16) saveCKRecordServerMergeableValue:v15 recordName:v4 zoneName:v7 locationRow:v18] & 1) == 0)
      {
        uint64_t v21 = __biome_log_for_category(11LL);
        id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
          sub_100042628();
        }
      }

      [*(id *)(*(void *)(a1 + 40) + 16) saveSystemFieldsDataForRecord:*(void *)(a1 + 32) syncToCloudKit:0 recordType:1 crdtDeleted:0];
    }

    else
    {
      uint64_t v23 = __biome_log_for_category(11LL);
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_FAULT)) {
        sub_1000425C8();
      }
    }

    goto LABEL_18;
  }

LABEL_21:
  objc_autoreleasePoolPop(v2);
}

void sub_1000272F4(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) recordID]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 zoneID]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 zoneName]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 40) + 16) ckZoneForZoneName:v5]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneUUID]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:@"zoneVersionUUID"]);
  if (!v7 || ([v7 isEqualToString:v8] & 1) == 0)
  {
    if ([*(id *)(*(void *)(a1 + 40) + 16) resetCKRecordsMetaDataAndSetToSyncForZone:v5]) {
      [*(id *)(*(void *)(a1 + 40) + 16) ckZoneSetZoneVersionUUID:v8 forZoneName:v5];
    }
  }

  [*(id *)(*(void *)(a1 + 40) + 16) saveSystemFieldsDataForRecord:*(void *)(a1 + 32) syncToCloudKit:0 recordType:2 crdtDeleted:0];

  objc_autoreleasePoolPop(v2);
}

void sub_100027478(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) recordID]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 zoneID]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 zoneName]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) recordID]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 recordName]);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(a1 + 40) + 16) highestDeletedLocationForSiteIdentifier:v7 inStream:v5]);
  id v9 = v8;
  if (v8)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 location]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 day]);
    [v11 timeIntervalSinceReferenceDate];
    uint64_t v13 = (uint64_t)v12;
  }

  else
  {
    uint64_t v13 = 0LL;
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:@"day"]);
  id v15 = [v14 longValue];

  if (v13 < (uint64_t)v15)
  {
    uint64_t v16 = -[NSDate initWithTimeIntervalSinceReferenceDate:]( objc_alloc(&OBJC_CLASS___NSDate),  "initWithTimeIntervalSinceReferenceDate:",  (double)(uint64_t)v15);
    id v17 = -[BMStreamCRDTLocation initWithStreamName:siteIdentifier:day:]( objc_alloc(&OBJC_CLASS___BMStreamCRDTLocation),  "initWithStreamName:siteIdentifier:day:",  v5,  v7,  v16);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 40) + 8) distributedSyncManagers]);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:v5]);

    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 streamCRDT]);
    [v20 handleDeletedLocation:v17 deleteCKRecord:1];

    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(a1 + 40) + 16) ckRecordForRecordName:v7 zoneName:v5 recordType:3]);
    id v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 40) + 16) locationRowWithLocation:v17]);
    [*(id *)(*(void *)(a1 + 40) + 16) saveCKRecordHighestDeletedLocationRow:v22 recordName:v7 zoneName:v5 recordExists:v21 != 0];
  }

  [*(id *)(*(void *)(a1 + 40) + 16) saveSystemFieldsDataForRecord:*(void *)(a1 + 32) syncToCloudKit:0 recordType:3 crdtDeleted:0];

  objc_autoreleasePoolPop(v2);
}

void sub_100027918(void *a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  [*(id *)(a1[4] + 16) saveSystemFieldsDataForRecord:a1[5] syncToCloudKit:0 recordType:2 crdtDeleted:0];
  [*(id *)(a1[4] + 16) ckZoneSetZoneVersionUUID:a1[6] forZoneName:a1[7]];
  objc_autoreleasePoolPop(v2);
}

void sub_1000279E4(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  [*(id *)(*(void *)(a1 + 32) + 16) saveSystemFieldsDataForRecord:*(void *)(a1 + 40) syncToCloudKit:0 recordType:3 crdtDeleted:0];
  objc_autoreleasePoolPop(v2);
}

void sub_100027B5C(id *a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  [*((id *)a1[4] + 2) saveSystemFieldsDataForRecord:a1[5] syncToCloudKit:&__kCFBooleanFalse recordType:1 crdtDeleted:a1[6]];
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a1[5] encryptedValues]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a1[4] mergeableRecordValueKey]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:v4]);

  if (v5)
  {
    id v6 = a1 + 7;
    uint64_t v7 = a1 + 8;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*((id *)a1[4] + 2) ckRecordForRecordName:a1[7] zoneName:a1[8] recordType:1]);
    id v9 = v8;
    if (v8)
    {
      uint64_t v10 = objc_claimAutoreleasedReturnValue([v8 localMergeableValue]);
      if (v10)
      {
        double v12 = (void *)v10;
        uint64_t v13 = objc_opt_class(&OBJC_CLASS___CKMergeableRecordValue, v11);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 localMergeableValue]);
        id v39 = 0LL;
        id v15 = (id)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  v13,  v14,  &v39));
        id v16 = v39;

        if (v16)
        {
          uint64_t v17 = __biome_log_for_category(11LL);
          uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
          {
            __int128 v33 = *v6;
            id v34 = *v7;
            *(_DWORD *)__int128 buf = 138543874;
            __int128 v41 = v33;
            __int16 v42 = 2114;
            uint64_t v43 = v34;
            __int16 v44 = 2114;
            id v45 = v16;
            _os_log_fault_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_FAULT,  "handleDidSaveRecordSyncRecord: Unable to unarchive localMergeableValue for %{public}@ %{public}@ %{public}@",  buf,  0x20u);
          }
        }

        if (v15)
        {
LABEL_9:
          if (([v15 isEqual:v5] & 1) == 0)
          {
            id v38 = 0LL;
            [v15 mergeRecordValue:v5 error:&v38];
            id v19 = v38;
            if (v19)
            {
              uint64_t v20 = __biome_log_for_category(11LL);
              uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
              if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
              {
                id v35 = *v6;
                __int16 v36 = *v7;
                *(_DWORD *)__int128 buf = 138544130;
                __int128 v41 = v5;
                __int16 v42 = 2114;
                uint64_t v43 = v35;
                __int16 v44 = 2114;
                id v45 = v36;
                __int16 v46 = 2114;
                id v47 = v19;
                _os_log_fault_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_FAULT,  "Error [localRecordValue mergeRecordValue:serverValue] for serverValue:%{public}@ record:%{public}@ zon e:%{public}@ %{public}@",  buf,  0x2Au);
              }
            }

            goto LABEL_27;
          }

LABEL_26:
          id v19 = 0LL;
LABEL_27:
          id v37 = v19;
          __int16 v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v15,  1LL,  &v37));
          id v22 = v37;

          if (v22)
          {
            uint64_t v29 = __biome_log_for_category(11LL);
            __int16 v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
            if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
              sub_100042820();
            }
          }

          else
          {
            __int128 v31 = (void *)*((void *)a1[4] + 2);
            __int16 v32 = -[BMStreamCRDTLocation initWithZoneName:recordName:]( objc_alloc(&OBJC_CLASS___BMStreamCRDTLocation),  "initWithZoneName:recordName:",  a1[8],  a1[7]);
            __int16 v30 = (os_log_s *)objc_claimAutoreleasedReturnValue([v31 locationRowWithLocation:v32]);

            [*((id *)a1[4] + 2) saveCKRecordLocalMergeableValue:v28 recordName:a1[7] zoneName:a1[8] locationRow:v30];
          }

          goto LABEL_32;
        }
      }

      else
      {
        id v15 = (id)objc_opt_new(&OBJC_CLASS___CKMergeableRecordValue);
        if (v15) {
          goto LABEL_9;
        }
      }

      uint64_t v26 = __biome_log_for_category(11LL);
      id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
        sub_100042880();
      }

      id v15 = v5;
      goto LABEL_26;
    }

    uint64_t v23 = __biome_log_for_category(11LL);
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
      sub_1000427B8();
    }

LABEL_21:
    id v22 = 0LL;
LABEL_32:

    goto LABEL_33;
  }

  if (([a1[6] isEqual:&__kCFBooleanTrue] & 1) == 0)
  {
    uint64_t v25 = __biome_log_for_category(11LL);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_FAULT)) {
      sub_100042750();
    }
    goto LABEL_21;
  }

  id v22 = 0LL;
LABEL_33:

  objc_autoreleasePoolPop(v2);
}

void sub_1000282FC(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 16) ckZoneForZoneName:*(void *)(a1 + 40)]);
  if ([v3 recoveryState])
  {
    id v4 = objc_autoreleasePoolPush();
    [*(id *)(*(void *)(a1 + 32) + 16) ckZoneSetAttemptingRecoveryForZoneName:*(void *)(a1 + 40) state:0];
    objc_autoreleasePoolPop(v4);
  }

  objc_autoreleasePoolPop(v2);
}

void sub_1000283E8(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  [*(id *)(*(void *)(a1 + 32) + 16) saveCKSyncEngineMetaData:*(void *)(a1 + 40)];
  objc_autoreleasePoolPop(v2);
}

void sub_100028658(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 16) ckZoneForZoneName:*(void *)(a1 + 40)]);
  if ([v3 recoveryState])
  {
    uint64_t v4 = __biome_log_for_category(11LL);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      int v7 = 138543618;
      uint64_t v8 = v6;
      __int16 v9 = 1026;
      unsigned int v10 = [v3 recoveryState];
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "failedToSaveRecordZone: %{public}@ and recoveryState:%{public}d",  (uint8_t *)&v7,  0x12u);
    }

    [*(id *)(*(void *)(a1 + 32) + 16) ckZoneSetAttemptingRecoveryForZoneName:*(void *)(a1 + 40) state:0];
  }

  objc_autoreleasePoolPop(v2);
}

void sub_1000288B8(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  id v3 = *(void **)(*(void *)(a1 + 32) + 16LL);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) recordID]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 recordName]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) recordID]);
  int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneID]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 zoneName]);
  [v3 resetMetadataForRecord:v5 zoneName:v8];

  objc_autoreleasePoolPop(v2);
}

void sub_100028B80(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  [*(id *)(*(void *)(a1 + 32) + 16) saveSystemFieldsDataForRecord:*(void *)(a1 + 40) syncToCloudKit:0 recordType:1 crdtDeleted:0];
  objc_autoreleasePoolPop(v2);
}

void sub_100028CA8(id *a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a1[4] userInfo]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:CKRecordChangedErrorServerRecordKey]);

  if (v4)
  {
    id v49 = v2;
    id v5 = (void *)objc_claimAutoreleasedReturnValue([a1[4] userInfo]);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:CKRecordChangedErrorClientRecordKey]);

    int v7 = (void *)objc_claimAutoreleasedReturnValue([v4 encryptedValues]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([a1[5] mergeableRecordValueKey]);
    id v9 = (id)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v8]);

    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v6 encryptedValues]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([a1[5] mergeableRecordValueKey]);
    double v12 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v11]);

    uint64_t v13 = __biome_log_for_category(11LL);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    id v15 = v14;
    id v47 = v12;
    id v48 = v6;
    if (v9)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 138543618;
        uint64_t v55 = v12;
        __int16 v56 = 2114;
        id v57 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "Handling handleFailedToSaveSyncRecordServerRecordChanged: Merging clientCRDT into serverCRDT %{public}@ -> %{public}@",  buf,  0x16u);
      }

      if (([v9 isEqual:v12] & 1) == 0)
      {
        id v51 = 0LL;
        [v9 mergeRecordValue:v12 error:&v51];
        id v16 = v51;
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = __biome_log_for_category(11LL);
          id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
            sub_100042B08();
          }
        }
      }
    }

    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        sub_100042A90((uint64_t *)a1 + 4, v15, v22);
      }

      id v9 = v12;
      if (!v9)
      {
        id v24 = 0LL;
        uint64_t v23 = 0LL;
LABEL_19:
        __int128 v33 = (void *)*((void *)a1[5] + 2);
        id v34 = objc_alloc(&OBJC_CLASS___BMStreamCRDTLocation);
        id v35 = (void *)objc_claimAutoreleasedReturnValue([a1[6] zoneName]);
        __int16 v36 = (void *)objc_claimAutoreleasedReturnValue([v4 recordID]);
        id v37 = (void *)objc_claimAutoreleasedReturnValue([v36 recordName]);
        id v38 = -[BMStreamCRDTLocation initWithZoneName:recordName:](v34, "initWithZoneName:recordName:", v35, v37);
        id v39 = (void *)objc_claimAutoreleasedReturnValue([v33 locationRowWithLocation:v38]);

        __int128 v40 = (void *)*((void *)a1[5] + 2);
        __int128 v41 = (void *)objc_claimAutoreleasedReturnValue([v4 recordID]);
        __int16 v42 = (void *)objc_claimAutoreleasedReturnValue([v41 recordName]);
        uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue([a1[6] zoneName]);
        [v40 saveCKRecordLocalMergeableValue:v23 recordName:v42 zoneName:v43 locationRow:v39];

        [*((id *)a1[5] + 2) saveSystemFieldsDataForRecord:v4 syncToCloudKit:&__kCFBooleanFalse recordType:1 crdtDeleted:0];
        __int16 v44 = (void *)*((void *)a1[5] + 10);
        id v45 = (void *)objc_claimAutoreleasedReturnValue([v4 recordID]);
        uint64_t v53 = v45;
        __int16 v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v53, 1LL));
        [v44 addRecordIDsToSave:v46 recordIDsToDelete:0];

        uint64_t v21 = v48;
        uint64_t v2 = v49;
        goto LABEL_20;
      }
    }

    id v50 = 0LL;
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v9,  1LL,  &v50));
    id v24 = v50;
    if (v24)
    {
      uint64_t v25 = __biome_log_for_category(11LL);
      uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
        sub_100042A28((uint64_t)(a1 + 4), v26, v27, v28, v29, v30, v31, v32);
      }
    }

    goto LABEL_19;
  }

  [*((id *)a1[5] + 2) saveSystemFieldsDataForRecord:a1[7] syncToCloudKit:&__kCFBooleanFalse recordType:1 crdtDeleted:0];
  uint64_t v20 = (void *)*((void *)a1[5] + 10);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([a1[7] recordID]);
  uint64_t v52 = v21;
  id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v52, 1LL));
  [v20 addRecordIDsToSave:v9 recordIDsToDelete:0];
LABEL_20:

  objc_autoreleasePoolPop(v2);
}

void sub_1000292A4(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) zoneName]);
  [v3 handleZoneReset:v4];

  objc_autoreleasePoolPop(v2);
}

void sub_1000294D4(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  [*(id *)(*(void *)(a1 + 32) + 16) saveSystemFieldsDataForRecord:*(void *)(a1 + 40) syncToCloudKit:0 recordType:2 crdtDeleted:0];
  objc_autoreleasePoolPop(v2);
}

void sub_100029628(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  [*(id *)(*(void *)(a1 + 32) + 16) saveSystemFieldsDataForRecord:*(void *)(a1 + 40) syncToCloudKit:0 recordType:3 crdtDeleted:0];
  objc_autoreleasePoolPop(v2);
}

void sub_100029AC8()
{
}

uint64_t sub_100029C20(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100029C30(uint64_t a1)
{
}

void sub_100029C38(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) recordName]);
  uint64_t v4 = *(void **)(a1 + 40);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) zoneID]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 streamConfigurationForZoneID:v5]);

  int v7 = *(void **)(*(void *)(a1 + 40) + 16LL);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 syncIdentifier]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 ckRecordForRecordName:v3 zoneName:v8 recordType:3]);

  unsigned int v10 = *(void **)(*(void *)(a1 + 40) + 16LL);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 locationID]);
  double v12 = (void *)objc_claimAutoreleasedReturnValue([v10 locationRowWithLocationID:v11]);

  if (v12)
  {
    uint64_t v13 = objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(a1 + 40) + 16) createCKRecordFromRecordID:*(void *)(a1 + 32) newRecord:0 recordType:3]);
    uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8LL);
    id v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    id v16 = (void *)objc_claimAutoreleasedReturnValue([v12 location]);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 day]);
    [v17 timeIntervalSinceReferenceDate];
    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", (uint64_t)v18));
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v19 forKeyedSubscript:@"day"];

    uint64_t v20 = objc_alloc(&OBJC_CLASS___BMStreamCRDTLocation);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v6 syncIdentifier]);
    uint64_t v22 = objc_opt_new(&OBJC_CLASS___NSDate);
    uint64_t v23 = -[BMStreamCRDTLocation initWithStreamName:siteIdentifier:day:]( v20,  "initWithStreamName:siteIdentifier:day:",  v21,  v3,  v22);

    -[BMStreamCRDTLocation secondsUntilExpirationWithStreamConfiguration:]( v23,  "secondsUntilExpirationWithStreamConfiguration:",  v6);
    id v24 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    [v24 setExpirationAfterTimeInterval:v25];
  }

  objc_autoreleasePoolPop(v2);
}

void sub_100029F20(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  id v3 = objc_alloc_init(&OBJC_CLASS___NSUUID);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v3, "UUIDString"));

  id v5 = -[CKRecord initWithRecordType:recordID:]( objc_alloc(&OBJC_CLASS___CKRecord),  "initWithRecordType:recordID:",  @"zoneVersion",  *(void *)(a1 + 32));
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8LL);
  int v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v4 forKeyedSubscript:@"zoneVersionUUID"];
  objc_autoreleasePoolPop(v2);
}

void sub_10002A160( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, char a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

void sub_10002A194(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 8) distributedSyncManagers]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:*(void *)(a1 + 40)]);

  id v5 = -[BMStreamCRDTLocation initWithZoneName:recordName:]( objc_alloc(&OBJC_CLASS___BMStreamCRDTLocation),  "initWithZoneName:recordName:",  *(void *)(a1 + 40),  *(void *)(a1 + 48));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 16) locationRowWithLocation:v5]);
  int v7 = v6;
  if (!v6)
  {
    uint64_t v29 = __biome_log_for_category(11LL);
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100042C88(a1, v19, v30, v31, v32, v33, v34, v35);
    }
    goto LABEL_36;
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 location]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 streamConfiguration]);
  [v8 secondsUntilExpirationWithStreamConfiguration:v9];
  double v11 = v10;

  if (v11 <= 60.0)
  {
    uint64_t v36 = __biome_log_for_category(11LL);
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v37 = *(void *)(a1 + 56);
      *(_DWORD *)__int128 buf = 134218242;
      double v69 = v11;
      __int16 v70 = 2114;
      uint64_t v71 = v37;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "record is almost expired: %f, not saving recordID: %{public}@ because it will be TTL'd",  buf,  0x16u);
    }

    goto LABEL_36;
  }

  unsigned __int8 v67 = 0;
  uint64_t v12 = objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(a1 + 32) + 16) createCKRecordFromRecordID:*(void *)(a1 + 56) newRecord:&v67 recordType:1]);
  uint64_t v13 = *(void *)(*(void *)(a1 + 64) + 8LL);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL))
  {
    uint64_t v15 = __biome_log_for_category(11LL);
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 67109120;
      LODWORD(v69) = v67;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "recordToSaveForRecordID: newRecord? %d",  buf,  8u);
    }

    if (v67)
    {
      uint64_t v17 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
      double v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v11));
      [v17 setExpirationAfterTimeInterval:v18];
    }

    if ([*(id *)(a1 + 32) isSiriCloudSyncEnabled])
    {
      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 streamCRDT]);
      if (v19)
      {
        uint64_t v20 = -[BMStreamCKRecordCRDT initWithStreamCRDT:locationRow:database:queue:maxDeltaSize:sessionContext:]( objc_alloc(&OBJC_CLASS___BMStreamCKRecordCRDT),  "initWithStreamCRDT:locationRow:database:queue:maxDeltaSize:sessionContext:",  v19,  v7,  *(void *)(*(void *)(a1 + 32) + 16LL),  *(void *)(*(void *)(a1 + 32) + 48LL),  +[CKMergeableDelta suggestedDeltaSizeForContainer:]( &OBJC_CLASS___CKMergeableDelta,  "suggestedDeltaSizeForContainer:",  *(void *)(*(void *)(a1 + 32) + 64LL)),  0LL);
        uint64_t v21 = *(void *)(*(void *)(a1 + 72) + 8LL);
        uint64_t v22 = *(void **)(v21 + 40);
        *(void *)(v21 + 40) = v20;

        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(a1 + 32) + 16) ckRecordForRecordName:*(void *)(a1 + 48) zoneName:*(void *)(a1 + 40) recordType:1]);
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v23 localMergeableValue]);
        BOOL v63 = v23;
        if (v25)
        {
          uint64_t v26 = objc_opt_class(&OBJC_CLASS___CKMergeableRecordValue, v24);
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localMergeableValue", v23));
          id v66 = 0LL;
          uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  v26,  v23,  &v66));
          uint64_t v28 = (os_log_s *)v66;
        }

        else
        {
          uint64_t v27 = (void *)objc_opt_new(&OBJC_CLASS___CKMergeableRecordValue);
          uint64_t v28 = 0LL;
        }

        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 40LL), v27);
        if (v25)
        {

          uint64_t v27 = v23;
        }

        if (v28)
        {
          uint64_t v43 = __biome_log_for_category(11LL);
          __int16 v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
          if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
          {
            uint64_t v60 = *(void *)(a1 + 40);
            double v59 = *(double *)(a1 + 48);
            *(_DWORD *)__int128 buf = 138543874;
            double v69 = v59;
            __int16 v70 = 2114;
            uint64_t v71 = v60;
            __int16 v72 = 2114;
            uint64_t v73 = v28;
            _os_log_fault_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_FAULT,  "handleSyncRecordRecordToSaveForRecordID: Unable to unarchive localMergeableValue for %{public}@ %{public}@ %{public}@",  buf,  0x20u);
          }

          uint64_t v45 = objc_opt_new(&OBJC_CLASS___CKMergeableRecordValue);
          uint64_t v46 = *(void *)(*(void *)(a1 + 80) + 8LL);
          id v47 = *(void **)(v46 + 40);
          *(void *)(v46 + 40) = v45;
        }

        uint64_t v48 = __biome_log_for_category(11LL);
        id v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          double v50 = *(double *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 40LL);
          *(_DWORD *)__int128 buf = 138543362;
          double v69 = v50;
          _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "recordValue %{public}@", buf, 0xCu);
        }

        id v51 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8LL) + 40LL);
        uint64_t v52 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL);
        v65 = v28;
        unsigned __int8 v53 = [v51 addDeltasToSaveFromMergeable:v52 error:&v65];
        __int128 v40 = v65;

        if ((v53 & 1) == 0)
        {
          uint64_t v54 = __biome_log_for_category(11LL);
          uint64_t v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
          if (os_log_type_enabled(v55, OS_LOG_TYPE_FAULT))
          {
            uint64_t v62 = *(void *)(a1 + 40);
            double v61 = *(double *)(a1 + 48);
            *(_DWORD *)__int128 buf = 138543874;
            double v69 = v61;
            __int16 v70 = 2114;
            uint64_t v71 = v62;
            __int16 v72 = 2114;
            uint64_t v73 = v40;
            _os_log_fault_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_FAULT,  "Error adding deltas to save for %{public}@ %{public}@ %{public}@",  buf,  0x20u);
          }
        }

        objc_msgSend( *(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40),  "setObject:forKeyedSubscript:",  &__kCFBooleanFalse,  @"crdtDeleted",  v63);
        uint64_t v56 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 40LL);
        uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) mergeableRecordValueKey]);
        [v57 setObject:v56 forKeyedSubscript:v58];
      }

      else
      {
        uint64_t v41 = __biome_log_for_category(11LL);
        __int128 v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          double v42 = *(double *)(a1 + 56);
          *(_DWORD *)__int128 buf = 138412290;
          double v69 = v42;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "streamCRDT is nil %@", buf, 0xCu);
        }
      }
    }

    else
    {
      uint64_t v38 = __biome_log_for_category(11LL);
      id v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "Sync to iCloud for Siri disabled", buf, 2u);
      }

      [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setObject:&__kCFBooleanTrue forKeyedSubscript:@"crdtDeleted"];
      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                             + 40LL), "encryptedValues"));
      __int128 v40 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) mergeableRecordValueKey]);
      -[os_log_s setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", 0LL, v40);
    }

LABEL_36:
  }

  objc_autoreleasePoolPop(v2);
}

void sub_10002AB00(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 16) ckZoneForZoneName:*(void *)(a1 + 40)]);
  if ([v3 recoveryState]) {
    [*(id *)(*(void *)(a1 + 32) + 16) ckZoneSetAttemptingRecoveryForZoneName:*(void *)(a1 + 40) state:0];
  }

  objc_autoreleasePoolPop(v2);
}

void sub_10002AC8C(void *a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1[4] + 16) ckZoneForZoneName:a1[5]]);
  unsigned int v4 = [v3 recoveryState];
  uint64_t v5 = __biome_log_for_category(11LL);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v4 == 1)
  {
    if (v7)
    {
      uint64_t v8 = (void *)a1[5];
      int v22 = 138543362;
      id v23 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "didDeleteRecordZoneWithID re-creating zone:%{public}@",  (uint8_t *)&v22,  0xCu);
    }

    id v9 = -[CKRecordZone initWithZoneName:](objc_alloc(&OBJC_CLASS___CKRecordZone), "initWithZoneName:", a1[5]);
    double v10 = *(void **)(a1[4] + 80LL);
    uint64_t v26 = v9;
    double v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v26, 1LL));
    [v10 addRecordZonesToSave:v11 recordZoneIDsToDelete:0];

    uint64_t v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    uint64_t v13 = (void *)a1[4];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordZone zoneID](v9, "zoneID"));
    id v15 = [v13 newZoneVersionRecordIDForZone:v14];

    -[NSMutableArray addObject:](v12, "addObject:", v15);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1[4] + 16) ckRecordsToSyncToCloudKitForZone:a1[5]]);
    if ([v16 count])
    {
      uint64_t v17 = __biome_log_for_category(11LL);
      double v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        id v19 = [v16 count];
        uint64_t v20 = a1[5];
        int v22 = 134218242;
        id v23 = v19;
        __int16 v24 = 2114;
        uint64_t v25 = v20;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "didDeleteRecordZoneWithID syncing %lu records for zone:%{public}@",  (uint8_t *)&v22,  0x16u);
      }

      -[NSMutableArray addObjectsFromArray:](v12, "addObjectsFromArray:", v16);
    }

    [*(id *)(a1[4] + 80) addRecordIDsToSave:v12 recordIDsToDelete:0];
    [*(id *)(a1[4] + 16) ckZoneSetAttemptingRecoveryForZoneName:a1[5] state:2];
  }

  else
  {
    if (v7)
    {
      uint64_t v21 = (void *)a1[5];
      int v22 = 138543362;
      id v23 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "didDeleteRecordZoneWithID not re-creating zone:%{public}@, removing all local records in zone",  (uint8_t *)&v22,  0xCu);
    }

    [*(id *)(a1[4] + 16) deleteAllCKRecordsInZone:a1[6]];
  }

  objc_autoreleasePoolPop(v2);
}

void sub_10002B054(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  id v3 = *(void **)(*(void *)(a1 + 32) + 16LL);
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) zoneName]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 ckZoneForZoneName:v4]);

  objc_autoreleasePoolPop(v2);
}

void sub_10002B148(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) zoneID]);
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 zoneName]);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 40) + 8) distributedSyncManagers]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);

  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 streamCRDT]);
  uint64_t v8 = objc_alloc(&OBJC_CLASS___BMStreamCRDTLocation);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) recordName]);
  double v10 = -[BMStreamCRDTLocation initWithZoneName:recordName:](v8, "initWithZoneName:recordName:", v4, v9);

  if (v7)
  {
    [v7 handleDeletedLocation:v10 deleteCKRecord:1];
  }

  else
  {
    uint64_t v11 = __biome_log_for_category(11LL);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      int v14 = 138543362;
      uint64_t v15 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "streamCRDT is nil %{public}@",  (uint8_t *)&v14,  0xCu);
    }
  }

  objc_autoreleasePoolPop(v2);
}

void sub_10002B4EC(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v3 = *(void *)(a1 + 32);
  unsigned int v4 = *(void **)(v3 + 16);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10002B55C;
  v5[3] = &unk_100069818;
  v5[4] = v3;
  [v4 enumerateRecordsWithBlock:v5];
  objc_autoreleasePoolPop(v2);
}

void sub_10002B55C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v82 = 0LL;
  v83[0] = &v82;
  v83[1] = 0x3032000000LL;
  v83[2] = sub_100029C20;
  v83[3] = sub_100029C30;
  id v84 = 0LL;
  uint64_t v4 = __biome_log_for_category(11LL);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 recordName]);
    *(_DWORD *)__int128 buf = 138543362;
    *(void *)&uint8_t buf[4] = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "*** recordName:%{public}@", buf, 0xCu);
  }

  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v3 localMergeableValue]);
  if (v7)
  {
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___CKMergeableRecordValue, v8);
    double v10 = (void *)objc_claimAutoreleasedReturnValue([v3 localMergeableValue]);
    id v81 = 0LL;
    uint64_t v11 = objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  v9,  v10,  &v81));
    uint64_t v12 = (os_log_s *)v81;
    uint64_t v13 = *(void **)(v83[0] + 40LL);
    *(void *)(v83[0] + 40LL) = v11;

    if (v12)
    {
      uint64_t v14 = __biome_log_for_category(11LL);
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v3 recordName]);
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v3 streamIdentifier]);
        *(_DWORD *)__int128 buf = 138543874;
        *(void *)&uint8_t buf[4] = v16;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v17;
        *(_WORD *)&buf[22] = 2114;
        id v92 = v12;
        _os_log_fault_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_FAULT,  "syncEngineDidEndFetchingChanges: Unable to unarchive localMergeableValue for %{public}@ %{public}@ %{public}@",  buf,  0x20u);
      }
    }

    else
    {
      uint64_t v19 = __biome_log_for_category(11LL);
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        uint64_t v20 = *(void *)(v83[0] + 40LL);
        *(_DWORD *)__int128 buf = 138543362;
        *(void *)&uint8_t buf[4] = v20;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "Has a localMergeableValue: %{public}@",  buf,  0xCu);
      }
    }
  }

  else
  {
    uint64_t v18 = __biome_log_for_category(11LL);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Has no localMergeableValue", buf, 2u);
    }
  }

  *(void *)__int128 buf = 0LL;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000LL;
  LOBYTE(v92) = 0;
  uint64_t v21 = *(void **)(*(void *)(a1 + 32) + 16LL);
  int v22 = (void *)objc_claimAutoreleasedReturnValue([v3 recordName]);
  id v23 = (void *)objc_claimAutoreleasedReturnValue([v3 streamIdentifier]);
  v77[0] = _NSConcreteStackBlock;
  v77[1] = 3221225472LL;
  v77[2] = sub_10002BEF4;
  v77[3] = &unk_1000697F0;
  v79 = buf;
  id v24 = v3;
  id v78 = v24;
  uint64_t v80 = &v82;
  [v21 enumerateMergeableRecordValuesForRecordName:v22 zoneName:v23 withBlock:v77];

  uint64_t v25 = __biome_log_for_category(11LL);
  uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    if (*(_BYTE *)(*(void *)&buf[8] + 24LL)) {
      uint64_t v27 = "YES";
    }
    else {
      uint64_t v27 = "NO";
    }
    *(_DWORD *)unsigned __int8 v85 = 136446210;
    v86 = (BMStreamCRDTLocation *)v27;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_INFO,  "Were there mergeableRecordValues: %{public}s",  v85,  0xCu);
  }

  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 8) distributedSyncManagers]);
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v24 streamIdentifier]);
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKeyedSubscript:v29]);
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v30 streamCRDT]);

  uint64_t v32 = objc_alloc(&OBJC_CLASS___BMStreamCRDTLocation);
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v24 streamIdentifier]);
  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v24 recordName]);
  uint64_t v35 = -[BMStreamCRDTLocation initWithZoneName:recordName:](v32, "initWithZoneName:recordName:", v33, v34);

  uint64_t v36 = __biome_log_for_category(11LL);
  uint64_t v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)unsigned __int8 v85 = 138543362;
    v86 = v35;
    _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_INFO,  "syncEngineDidEndFetchingChanges location: %{public}@",  v85,  0xCu);
  }

  if (v35)
  {
    uint64_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 16) locationRowWithLocation:v35]);
    uint64_t v39 = __biome_log_for_category(11LL);
    __int128 v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)unsigned __int8 v85 = 138543362;
      v86 = (BMStreamCRDTLocation *)v38;
      _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_INFO,  "syncEngineDidEndFetchingChanges locationRow: %{public}@",  v85,  0xCu);
    }

    if (v38)
    {
      id v41 = +[CKMergeableDelta suggestedDeltaSizeForContainer:]( &OBJC_CLASS___CKMergeableDelta,  "suggestedDeltaSizeForContainer:",  *(void *)(*(void *)(a1 + 32) + 64LL));
      double v42 = objc_alloc(&OBJC_CLASS___BMStreamCKRecordCRDT);
      uint64_t v43 = *(void **)(a1 + 32);
      uint64_t v44 = v43[2];
      uint64_t v45 = v43[6];
      uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue([v43 sessionContext]);
      v74 = -[BMStreamCKRecordCRDT initWithStreamCRDT:locationRow:database:queue:maxDeltaSize:sessionContext:]( v42,  "initWithStreamCRDT:locationRow:database:queue:maxDeltaSize:sessionContext:",  v31,  v38,  v44,  v45,  v41,  v46);

      uint64_t v47 = __biome_log_for_category(11LL);
      uint64_t v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        id v49 = *(BMStreamCRDTLocation **)(v83[0] + 40LL);
        *(_DWORD *)unsigned __int8 v85 = 138543362;
        v86 = v49;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "recordValue %{public}@", v85, 0xCu);
      }

      double v50 = objc_autoreleasePoolPush();
      id v51 = *(void **)(v83[0] + 40LL);
      id v76 = 0LL;
      [v51 mergeIntoMergeable:v74 error:&v76];
      id v52 = v76;
      objc_autoreleasePoolPop(v50);
      if (v52)
      {
        uint64_t v53 = __biome_log_for_category(11LL);
        uint64_t v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
        if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT))
        {
          __int16 v72 = (BMStreamCRDTLocation *)objc_claimAutoreleasedReturnValue([v24 recordName]);
          uint64_t v73 = (void *)objc_claimAutoreleasedReturnValue([v24 streamIdentifier]);
          *(_DWORD *)unsigned __int8 v85 = 138543874;
          v86 = v72;
          __int16 v87 = 2114;
          unsigned int v88 = v73;
          __int16 v89 = 2114;
          id v90 = v52;
          _os_log_fault_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_FAULT,  "Unable to  [recordValue mergeIntoMergeable:recordCRDT] for recordName:%{public}@ site:%{public}@ error:%{public}@",  v85,  0x20u);
        }
      }

      uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue(-[BMStreamCRDTLocation streamName](v35, "streamName"));

      if (*(void *)(v83[0] + 40LL))
      {
        uint64_t v56 = objc_autoreleasePoolPush();
        uint64_t v57 = *(void *)(v83[0] + 40LL);
        id v75 = 0LL;
        uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v57,  1LL,  &v75));
        double v59 = (os_log_s *)v75;
        objc_autoreleasePoolPop(v56);
        if (v59)
        {
          uint64_t v60 = __biome_log_for_category(11LL);
          double v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
          if (os_log_type_enabled(v61, OS_LOG_TYPE_FAULT)) {
            sub_100042DB4((uint64_t)v83, (uint64_t)v59, v61);
          }
        }

        else
        {
          id v66 = *(void **)(*(void *)(a1 + 32) + 16LL);
          double v61 = (os_log_s *)objc_claimAutoreleasedReturnValue([v24 recordName]);
          [v66 saveCKRecordLocalMergeableValue:v58 recordName:v61 zoneName:v55 locationRow:v38];
          double v59 = 0LL;
        }
      }

      else
      {
        double v59 = 0LL;
        uint64_t v58 = 0LL;
      }

      unsigned __int8 v67 = *(void **)(*(void *)(a1 + 32) + 24LL);
      id v68 = (void *)objc_claimAutoreleasedReturnValue(-[BMStreamCRDTLocation siteIdentifier](v35, "siteIdentifier"));
      [v67 addObject:v68];

      double v69 = *(void **)(*(void *)(a1 + 32) + 16LL);
      __int16 v70 = (void *)objc_claimAutoreleasedReturnValue([v24 recordName]);
      uint64_t v71 = (void *)objc_claimAutoreleasedReturnValue([v24 streamIdentifier]);
      [v69 clearCKMergeableRecordValueServerMergeableValuesForRecordName:v70 zoneName:v71];
    }

    else
    {
      uint64_t v65 = __biome_log_for_category(11LL);
      double v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);
      if (os_log_type_enabled(v59, OS_LOG_TYPE_FAULT)) {
        sub_100042D54();
      }
    }
  }

  else
  {
    uint64_t v62 = __biome_log_for_category(11LL);
    uint64_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
    {
      BOOL v63 = (void *)objc_claimAutoreleasedReturnValue([v24 streamIdentifier]);
      id v64 = (void *)objc_claimAutoreleasedReturnValue([v24 recordName]);
      sub_100042CF0(v63, v64, (uint64_t)v85, v38);
    }
  }

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v82, 8);
}

void sub_10002BE60( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_10002BEF4(uint64_t a1, void *a2)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  id v3 = a2;
  id v24 = 0LL;
  id v5 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___CKMergeableRecordValue, v4),  v3,  &v24);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  id v7 = v24;
  if (v7)
  {
    uint64_t v8 = __biome_log_for_category(11LL);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      sub_100042ED0(a1, (uint64_t)v7, v9);
    }

    uint64_t v10 = objc_opt_new(&OBJC_CLASS___CKMergeableRecordValue);
    uint64_t v6 = (void *)v10;
  }

  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8LL);
  uint64_t v13 = *(void *)(v11 + 40);
  uint64_t v12 = (id *)(v11 + 40);
  if (!v13) {
    objc_storeStrong(v12, v6);
  }
  uint64_t v14 = __biome_log_for_category(11LL);
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    id v16 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
    *(_DWORD *)__int128 buf = 138543362;
    uint64_t v26 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Merging recordValue %{public}@", buf, 0xCu);
  }

  uint64_t v17 = __biome_log_for_category(11LL);
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 138543362;
    uint64_t v26 = v6;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Merging serverValue %{public}@", buf, 0xCu);
  }

  if (([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) isEqual:v6] & 1) == 0)
  {
    uint64_t v19 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
    id v23 = v7;
    [v19 mergeRecordValue:v6 error:&v23];
    id v20 = v23;

    id v7 = v20;
  }

  if (v7)
  {
    uint64_t v21 = __biome_log_for_category(11LL);
    int v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      sub_100042E2C(a1, (uint64_t)v7, v22);
    }
  }
}

void sub_10002C260(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  uint64_t v10 = sub_100029C20;
  uint64_t v11 = sub_100029C30;
  uint64_t v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v3 = objc_autoreleasePoolPush();
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 16);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10002C37C;
  v6[3] = &unk_100069840;
  void v6[4] = v4;
  v6[5] = &v7;
  [v5 enumerateZonesWithBlock:v6];
  objc_autoreleasePoolPop(v3);
  if ([(id)v8[5] count]) {
    [*(id *)(*(void *)(a1 + 32) + 80) addRecordZonesToSave:&__NSArray0__struct recordZoneIDsToDelete:v8[5]];
  }
  _Block_object_dispose(&v7, 8);

  objc_autoreleasePoolPop(v2);
}

void sub_10002C364( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10002C37C(uint64_t a1, void *a2)
{
  id v8 = a2;
  if ([v8 recoveryState] == 1)
  {
    id v3 = *(void **)(*(void *)(a1 + 32) + 16LL);
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v8 zoneName]);
    [v3 resetCKRecordsMetaDataAndSetToSyncForZone:v4];

    id v5 = objc_alloc(&OBJC_CLASS___CKRecordZoneID);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v8 zoneName]);
    uint64_t v7 = -[CKRecordZoneID initWithZoneName:ownerName:](v5, "initWithZoneName:ownerName:", v6, CKCurrentUserDefaultName);

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v7];
  }
}

void sub_10002C564(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

void sub_10002C578(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

  ;
}

  ;
}

void sub_10002C5D4(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

  ;
}

uint64_t sub_10002CE24(uint64_t result)
{
  *(_BYTE *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 17;
  return result;
}

void sub_10002CF24(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_autoreleasePoolPush();
  id v10 = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 dataWithError:&v10]);
  id v6 = v10;
  if (v6) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v5 == 0LL;
  }
  if (v7)
  {
    uint64_t v8 = __biome_log_for_category(11LL);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100042F74((uint64_t)v3, (uint64_t)v6, v9);
    }
  }

  else
  {
    [*(id *)(a1 + 32) addObject:v5];
  }

  objc_autoreleasePoolPop(v4);
}

void sub_10002F2F4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, id location)
{
}

void sub_10002F31C(uint64_t a1, void *a2, void *a3, void *a4)
{
  BOOL v7 = (id *)(a1 + 40);
  id v8 = a4;
  id v9 = a3;
  id v10 = a2;
  id WeakRetained = objc_loadWeakRetained(v7);
  [WeakRetained _handleRequestID:*(void *)(a1 + 32) request:v10 options:v9 responseHandler:v8];
}

LABEL_13:
    -[NSMutableDictionary setObject:forKey:](v24, "setObject:forKey:", v11, @"sync_to_cloud_kit");
    goto LABEL_14;
  }

  uint64_t v21 = -[NSKeyedArchiver initRequiringSecureCoding:]( objc_alloc(&OBJC_CLASS___NSKeyedArchiver),  "initRequiringSecureCoding:",  1LL);
  [v10 encodeSystemFieldsWithCoder:v21];
  int v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSKeyedArchiver encodedData](v21, "encodedData"));

  if ((v19 & 1) != 0) {
    goto LABEL_9;
  }
  fmdb = self->_fmdb;
  v41[0] = @"record_metadata";
  if (v22)
  {
    uint64_t v38 = 0;
    id v23 = v22;
    goto LABEL_21;
  }

LABEL_34:
}

void sub_100031AB0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_100031AC8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100031AD8(uint64_t a1)
{
}

void sub_100031AE0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  id v8 = v3;
  if (!v4)
  {
    id v5 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8LL);
    BOOL v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    id v3 = v8;
    uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  }

  [v4 addObject:v3];
}

id sub_1000324C0(uint64_t a1)
{
  *(_BYTE *)(*(void *)(a1 + 32) + 8LL) = 0;
  [*(id *)(a1 + 32) didChangeValueForKey:@"isExecuting"];
  [*(id *)(a1 + 32) willChangeValueForKey:@"isFinished"];
  *(_BYTE *)(*(void *)(a1 + 32) + 9LL) = 1;
  return [*(id *)(a1 + 32) didChangeValueForKey:@"isFinished"];
}

void sub_100032970(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000329F0;
  v4[3] = &unk_100068CB0;
  uint64_t v3 = *(void *)(a1 + 56);
  id v5 = *(id *)(a1 + 48);
  [v1 syncRapportNowIfPolicyAllowsWithReason:v3 activity:v2 completionHandler:v4];
}

void sub_1000329F0(uint64_t a1)
{
}

void sub_1000329F8(uint64_t a1)
{
}

BOOL sub_100032A00(BOOL result)
{
  if (*(void *)(result + 32))
  {
    uint64_t v1 = result;
    uint64_t v2 = __biome_log_for_category(11LL);
    uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "syncNowIfPolicyAllowsWithReason: group_notify done",  v4,  2u);
    }

    return xpc_activity_set_state(*(xpc_activity_t *)(v1 + 32), 5LL);
  }

  return result;
}

void sub_100032F90(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1[4] + 40LL));
  uint64_t v7 = __biome_log_for_category(11LL);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v5;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Rapport syncNowWithCompletionHandler %@, errors: %@",  (uint8_t *)&v11,  0x16u);
  }

  [*(id *)(a1[4] + 32) clearCachedStatements];
  id v9 = (id)objc_opt_self(a1[5]);
  uint64_t v10 = a1[6];
  if (v10) {
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v5, v6);
  }
}

void sub_1000333EC(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1[4] + 40LL));
  uint64_t v7 = __biome_log_for_category(11LL);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v5;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Rapport syncNowWithDevicesCompletionHandler %@, errors: %@",  (uint8_t *)&v11,  0x16u);
  }

  [*(id *)(a1[4] + 32) clearCachedStatements];
  id v9 = (id)objc_opt_self(a1[5]);
  uint64_t v10 = a1[6];
  if (v10) {
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v5, v6);
  }
}

void sub_100033630( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_10003364C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10003365C(uint64_t a1)
{
}

void sub_100033664(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v3 = objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 32) lastCloudKitSyncAttemptDate]);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  objc_autoreleasePoolPop(v2);
}

void sub_100033908(_Unwind_Exception *a1)
{
}

void sub_100033924(void *a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  if (([*(id *)(a1[4] + 32) open] & 1) == 0)
  {
    uint64_t v3 = __biome_log_for_category(11LL);
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Unable to perform CloudKit sync now, because database is not currently accessible",  v10,  2u);
    }

    id v5 = [*(id *)(a1[4] + 32) state];
    uint64_t v6 = a1[5];
    if (v6)
    {
      if (v5 == (id)2) {
        uint64_t v7 = 2LL;
      }
      else {
        uint64_t v7 = 3LL;
      }
      id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  BMSyncErrorDomain,  v7,  0LL));
      int v11 = v8;
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
      (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0LL, v9);
    }

    *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = 1;
  }

  objc_autoreleasePoolPop(v2);
}

void sub_100033A7C(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  [*(id *)(*(void *)(a1 + 32) + 32) setLastCloudKitSyncAttemptDate:v3];

  objc_autoreleasePoolPop(v2);
}

void sub_100033AD4(uint64_t a1, int a2, uint64_t a3)
{
  if (a2)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void **)(v4 + 16);
    uint64_t v7 = *(void *)(a1 + 64);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100033CC8;
    v15[3] = &unk_100069900;
    void v15[4] = v4;
    id v16 = *(id *)(a1 + 48);
    id v17 = *(id *)(a1 + 56);
    [v6 syncNowWithReason:v7 activity:v5 completionHandler:v15];
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[BMCloudKitSyncEngine start] failed: %@",  a3));
    NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
    int v22 = v8;
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"BMSyncScheduler",  1LL,  v9));

    uint64_t v11 = __biome_log_for_category(11LL);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v20 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }

    uint64_t v13 = *(void *)(a1 + 56);
    if (v13)
    {
      uint64_t v18 = v10;
      id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));
      (*(void (**)(uint64_t, void *, void *))(v13 + 16))(v13, &__NSArray0__struct, v14);
    }
  }

void sub_100033CC8(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = __biome_log_for_category(11LL);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v5;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "CloudKit syncNowWithCompletionHandler %@, errors: %@",  (uint8_t *)&v11,  0x16u);
  }

  [*(id *)(a1[4] + 32) clearCachedStatements];
  id v9 = (id)objc_opt_self(a1[5]);
  uint64_t v10 = a1[6];
  if (v10) {
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v5, v6);
  }
}

void sub_100033DD0(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 16) metricsCollector]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 sessionContext]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 sessionID]);
  [v3 recordSessionStart:v5 transport:3 reason:2 isReciprocal:0];

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 sessionID]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 32) lastCloudKitSyncDate]);
  [v3 recordSessionEnd:v6 lastSyncDate:v7];

  [*(id *)(*(void *)(a1 + 32) + 32) clearCachedStatements];
  objc_autoreleasePoolPop(v2);
}

uint64_t sub_100033EF4(uint64_t result, int a2)
{
  if (result)
  {
    *(_BYTE *)(result + 32) |= 2u;
    *(_DWORD *)(result + 16) = a2;
  }

  return result;
}

uint64_t sub_100033F1C(uint64_t result, int a2)
{
  if (result)
  {
    if (a2) {
      char v2 = 2;
    }
    else {
      char v2 = 0;
    }
    *(_BYTE *)(result + 32) = *(_BYTE *)(result + 32) & 0xFD | v2;
  }

  return result;
}

uint64_t sub_100033F48(uint64_t result)
{
  if (result) {
    return (*(unsigned __int8 *)(result + 32) >> 1) & 1;
  }
  return result;
}

uint64_t sub_100033F60(uint64_t result, double a2)
{
  if (result)
  {
    *(_BYTE *)(result + 32) |= 1u;
    *(double *)(result + _Block_object_dispose((const void *)(v1 - 128), 8) = a2;
  }

  return result;
}

uint64_t sub_100033F88(uint64_t result, char a2)
{
  if (result) {
    *(_BYTE *)(result + 32) = *(_BYTE *)(result + 32) & 0xFE | a2;
  }
  return result;
}

uint64_t sub_100033FA8(uint64_t result)
{
  if (result) {
    return *(_BYTE *)(result + 32) & 1;
  }
  return result;
}

BOOL sub_100033FC0(BOOL result)
{
  if (result) {
    return *(void *)(result + 24) != 0LL;
  }
  return result;
}

uint64_t sub_100034154(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0LL;
    while (1)
    {
      uint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      unint64_t v8 = v7 + 1;
      if (v7 == -1 || v8 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v9 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v8;
      v6 |= (unint64_t)(v9 & 0x7F) << v4;
      if ((v9 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v10 = v5++ >= 9;
      if (v10)
      {
        unint64_t v6 = 0LL;
        int v11 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }

    *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v11 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0LL;
    }
LABEL_13:
    if (v11 || (v6 & 7) == 4) {
      break;
    }
    unint64_t v13 = v6 >> 3;
    if ((v6 >> 3) == 3)
    {
      uint64_t Data = PBReaderReadData(a2);
      uint64_t v21 = objc_claimAutoreleasedReturnValue(Data);
      int v22 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v21;
    }

    else if ((_DWORD)v13 == 2)
    {
      *(_BYTE *)(a1 + 32) |= 1u;
      unint64_t v23 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v23 <= 0xFFFFFFFFFFFFFFF7LL && v23 + 8 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
      {
        uint64_t v24 = *(void *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v23);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v23 + 8;
      }

      else
      {
        *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
        uint64_t v24 = 0LL;
      }

      *(void *)(a1 + _Block_object_dispose((const void *)(v1 - 128), 8) = v24;
    }

    else if ((_DWORD)v13 == 1)
    {
      char v14 = 0;
      unsigned int v15 = 0;
      uint64_t v16 = 0LL;
      *(_BYTE *)(a1 + 32) |= 2u;
      while (1)
      {
        uint64_t v17 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        unint64_t v18 = v17 + 1;
        if (v17 == -1 || v18 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v19 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v17);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v18;
        v16 |= (unint64_t)(v19 & 0x7F) << v14;
        if ((v19 & 0x80) == 0) {
          goto LABEL_34;
        }
        v14 += 7;
        BOOL v10 = v15++ >= 9;
        if (v10)
        {
          LODWORD(v16) = 0;
          goto LABEL_36;
        }
      }

      *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_34:
      if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        LODWORD(v16) = 0;
      }
LABEL_36:
      *(_DWORD *)(a1 + 16) = v16;
    }

    else
    {
      uint64_t result = PBReaderSkipValueWithTag(a2);
      if (!(_DWORD)result) {
        return result;
      }
    }
  }

  return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

void sub_100034494(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  if (a1)
  {
    char v4 = *(_BYTE *)(a1 + 32);
    if ((v4 & 2) != 0)
    {
      void v3[4] = *(_DWORD *)(a1 + 16);
      *((_BYTE *)v3 + 32) |= 2u;
      char v4 = *(_BYTE *)(a1 + 32);
    }

    if ((v4 & 1) != 0)
    {
      *((void *)v3 + 1) = *(void *)(a1 + 8);
      *((_BYTE *)v3 + 32) |= 1u;
    }

    unsigned int v5 = *(void **)(a1 + 24);
    if (v5)
    {
      unint64_t v6 = v3;
      sub_100034534((uint64_t)v3, v5);
      uint64_t v3 = v6;
    }
  }
}

void sub_100034534(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

void sub_1000347BC(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  if (a1)
  {
    char v4 = v3[32];
    if ((v4 & 2) != 0)
    {
      *(_DWORD *)(a1 + 16) = *((_DWORD *)v3 + 4);
      *(_BYTE *)(a1 + 32) |= 2u;
      char v4 = v3[32];
    }

    if ((v4 & 1) != 0)
    {
      *(void *)(a1 + _Block_object_dispose((const void *)(v1 - 128), 8) = *((void *)v3 + 1);
      *(_BYTE *)(a1 + 32) |= 1u;
    }

    unsigned int v5 = (void *)*((void *)v3 + 3);
    if (v5)
    {
      unint64_t v6 = v3;
      objc_storeStrong((id *)(a1 + 24), v5);
      uint64_t v3 = v6;
    }
  }
}

uint64_t sub_100034860(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result + 16);
  }
  return result;
}

double sub_100034874(uint64_t a1)
{
  if (a1) {
    return *(double *)(a1 + 8);
  }
  else {
    return 0.0;
  }
}

uint64_t sub_100034890(uint64_t result)
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

uint64_t sub_1000348B8()
{
  return 31LL;
}

CFStringRef sub_1000348C0()
{
  return (id)CFStringCreateWithCStringNoCopy( kCFAllocatorDefault,  aCreateTableMet,  0x8000100u,  kCFAllocatorNull);
}

id sub_1000348FC()
{
  v17[0] = &off_10006EF30;
  uint64_t v16 = -[BMSyncDatabaseCustomFunctionMigration initWithCustomFunctionName:]( objc_alloc(&OBJC_CLASS___BMSyncDatabaseCustomFunctionMigration),  "initWithCustomFunctionName:",  @"migration_StarSkySchema11ToSydRoSchema12");
  v18[0] = v16;
  v17[1] = &off_10006EF48;
  unsigned int v15 = -[BMSyncDatabaseSQLStatementMigration initWithSQLStatements:]( objc_alloc(&OBJC_CLASS___BMSyncDatabaseSQLStatementMigration),  "initWithSQLStatements:",  &off_10006ECF0);
  v18[1] = v15;
  v17[2] = &off_10006EF60;
  char v14 = -[BMSyncDatabaseSQLStatementMigration initWithSQLStatements:]( objc_alloc(&OBJC_CLASS___BMSyncDatabaseSQLStatementMigration),  "initWithSQLStatements:",  &off_10006ED08);
  v18[2] = v14;
  v17[3] = &off_10006EF78;
  unint64_t v13 = -[BMSyncDatabaseSQLStatementMigration initWithSQLStatements:]( objc_alloc(&OBJC_CLASS___BMSyncDatabaseSQLStatementMigration),  "initWithSQLStatements:",  &off_10006ED20);
  v18[3] = v13;
  void v17[4] = &off_10006EF90;
  id v12 = -[BMSyncDatabaseSQLStatementMigration initWithSQLStatements:]( objc_alloc(&OBJC_CLASS___BMSyncDatabaseSQLStatementMigration),  "initWithSQLStatements:",  &off_10006ED38);
  v18[4] = v12;
  v18[5] = &__NSArray0__struct;
  v17[5] = &off_10006EFA8;
  v17[6] = &off_10006EFC0;
  int v11 = -[BMSyncDatabaseCustomFunctionMigration initWithCustomFunctionName:]( objc_alloc(&OBJC_CLASS___BMSyncDatabaseCustomFunctionMigration),  "initWithCustomFunctionName:",  @"migration_Schema20ToSchema21");
  v18[6] = v11;
  v17[7] = &off_10006EFD8;
  v0 = -[BMSyncDatabaseSQLStatementMigration initWithSQLStatements:]( objc_alloc(&OBJC_CLASS___BMSyncDatabaseSQLStatementMigration),  "initWithSQLStatements:",  &off_10006ED50);
  v18[7] = v0;
  v17[8] = &off_10006EFF0;
  uint64_t v1 = -[BMSyncDatabaseSQLStatementMigration initWithSQLStatements:]( objc_alloc(&OBJC_CLASS___BMSyncDatabaseSQLStatementMigration),  "initWithSQLStatements:",  &off_10006ED68);
  v18[8] = v1;
  v17[9] = &off_10006F008;
  char v2 = -[BMSyncDatabaseSQLStatementMigration initWithSQLStatements:]( objc_alloc(&OBJC_CLASS___BMSyncDatabaseSQLStatementMigration),  "initWithSQLStatements:",  &off_10006ED80);
  v18[9] = v2;
  v17[10] = &off_10006F020;
  uint64_t v3 = -[BMSyncDatabaseSQLStatementMigration initWithSQLStatements:]( objc_alloc(&OBJC_CLASS___BMSyncDatabaseSQLStatementMigration),  "initWithSQLStatements:",  &off_10006ED98);
  v18[10] = v3;
  v17[11] = &off_10006F038;
  char v4 = -[BMSyncDatabaseSQLStatementMigration initWithSQLStatements:]( objc_alloc(&OBJC_CLASS___BMSyncDatabaseSQLStatementMigration),  "initWithSQLStatements:",  &off_10006EDB0);
  v18[11] = v4;
  v17[12] = &off_10006F050;
  unsigned int v5 = -[BMSyncDatabaseSQLStatementMigration initWithSQLStatements:]( objc_alloc(&OBJC_CLASS___BMSyncDatabaseSQLStatementMigration),  "initWithSQLStatements:",  &off_10006EDC8);
  v18[12] = v5;
  v17[13] = &off_10006F068;
  unint64_t v6 = -[BMSyncDatabaseCustomFunctionMigration initWithCustomFunctionName:]( objc_alloc(&OBJC_CLASS___BMSyncDatabaseCustomFunctionMigration),  "initWithCustomFunctionName:",  @"migration_Schema27ToSchema28");
  v18[13] = v6;
  v17[14] = &off_10006F080;
  uint64_t v7 = -[BMSyncDatabaseSQLStatementMigration initWithSQLStatements:]( objc_alloc(&OBJC_CLASS___BMSyncDatabaseSQLStatementMigration),  "initWithSQLStatements:",  &off_10006EDE0);
  v18[14] = v7;
  v17[15] = &off_10006F098;
  unint64_t v8 = -[BMSyncDatabaseSQLStatementMigration initWithSQLStatements:]( objc_alloc(&OBJC_CLASS___BMSyncDatabaseSQLStatementMigration),  "initWithSQLStatements:",  &off_10006EDF8);
  v18[15] = v8;
  char v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v18,  v17,  16LL));

  return v9;
}

LABEL_95:
        unint64_t v8 = &stru_100069BD0;
LABEL_96:
        char v9 = self;
        BOOL v10 = 9LL;
        goto LABEL_97;
      }

      id v20 = -[_bmFMDatabase userVersion](self->_fmdb, "userVersion");
      if (v20 >= 0x20)
      {
        unint64_t v8 = @"version too new";
LABEL_78:
        char v9 = self;
        BOOL v10 = 7LL;
        goto LABEL_97;
      }

      id v75 = v20;
      has_internal_diagnostics = os_variant_has_internal_diagnostics("com.apple.Biome");
      if (v75 <= 0x10 && has_internal_diagnostics)
      {
        unint64_t v8 = @"internal build version < 17";
        goto LABEL_78;
      }

      uint64_t v80 = os_variant_has_internal_diagnostics("com.apple.Biome");
      if (v75 - 17 <= 2 && v80)
      {
        unint64_t v8 = @"internal build version between 17 and 19";
        goto LABEL_78;
      }

      if (v75 > 0x1E) {
        goto LABEL_80;
      }
      unint64_t v8 = &stru_100069BD0;
      char v9 = self;
      BOOL v10 = 8LL;
LABEL_97:
      -[BMSyncDatabase setState:errorFormat:](v9, "setState:errorFormat:", v10, v8, v81);
      uint64_t v21 = self;
      int v22 = a2;
      unint64_t v23 = v7;
      return -[BMSyncDatabase performSelector:withObject:](v21, "performSelector:withObject:", v22, v23) != 0LL;
    case 4uLL:
      return v6;
    case 6uLL:
      if (v7) {
        return 0;
      }
      -[BMSyncDatabase setState:errorFormat:](self, "setState:errorFormat:", 3LL, &stru_100069BD0);
      uint64_t v21 = self;
      int v22 = a2;
      unint64_t v23 = 0LL;
      return -[BMSyncDatabase performSelector:withObject:](v21, "performSelector:withObject:", v22, v23) != 0LL;
    case 7uLL:
      if ((self->_flags & 1) != 0) {
        goto LABEL_95;
      }
      -[_bmFMDatabase close](self->_fmdb, "close");
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase databasePath](self->_fmdb, "databasePath"));
      id v84 = 0LL;
      uint64_t v26 = [v24 removeItemAtPath:v25 error:&v84];
      id v12 = v84;

      if (v26 && !v12) {
        goto LABEL_28;
      }
      uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue([v12 domain]);
      if (![v65 isEqual:NSCocoaErrorDomain])
      {

LABEL_82:
        -[BMSyncDatabase setState:errorFormat:]( self,  "setState:errorFormat:",  9LL,  @"failed to delete corrupt database file: %@",  v12);
        goto LABEL_103;
      }

      id v66 = [v12 code];

      if (v66 != (id)4) {
        goto LABEL_82;
      }
LABEL_28:

      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase databasePath](self->_fmdb, "databasePath"));
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v28 stringByAppendingString:@"-wal"]);
      v83 = 0LL;
      uint64_t v30 = [v27 removeItemAtPath:v29 error:&v83];
      id v12 = v83;

      if (v30 && !v12) {
        goto LABEL_32;
      }
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v12 domain]);
      if ([v31 isEqual:NSCocoaErrorDomain])
      {
        uint64_t v32 = [v12 code];

        if (v32 == (id)4)
        {
LABEL_32:

          uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
          uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase databasePath](self->_fmdb, "databasePath"));
          uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v34 stringByAppendingString:@"-shm"]);
          uint64_t v82 = 0LL;
          uint64_t v36 = [v33 removeItemAtPath:v35 error:&v82];
          id v12 = v82;

          if (v36 && !v12)
          {
LABEL_36:
            uint64_t v39 = objc_claimAutoreleasedReturnValue(-[BMSyncDatabase corruptionHandler](self, "corruptionHandler"));
            unsigned int v15 = (id)v39;
            if (v39) {
              (*(void (**)(uint64_t))(v39 + 16))(v39);
            }
LABEL_11:
            self->_flags |= 1uLL;
            -[BMSyncDatabase setState:errorFormat:](self, "setState:errorFormat:", 3LL, &stru_100069BD0);
LABEL_61:
            uint64_t v60 = -[BMSyncDatabase performSelector:withObject:](self, "performSelector:withObject:", a2, v7);

            goto LABEL_104;
          }

          uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v12 domain]);
          if ([v37 isEqual:NSCocoaErrorDomain])
          {
            uint64_t v38 = [v12 code];

            if (v38 == (id)4) {
              goto LABEL_36;
            }
          }

          else
          {
          }

          id v81 = (unint64_t)v12;
          v77 = @"failed to delete corrupt database SHM file: %@";
          goto LABEL_102;
        }
      }

      else
      {
      }

      -[BMSyncDatabase setState:errorFormat:]( self,  "setState:errorFormat:",  9LL,  @"failed to delete corrupt database WAL file: %@",  v12);
LABEL_103:
      uint64_t v60 = -[BMSyncDatabase performSelector:withObject:](self, "performSelector:withObject:", a2, v7);
LABEL_104:
      unint64_t v6 = v60 != 0LL;

      return v6;
    case 8uLL:
      __int128 v40 = -[_bmFMDatabase userVersion](self->_fmdb, "userVersion");
      if (v40 > 0x1E) {
        goto LABEL_80;
      }
      LODWORD(v41) = v40;
      while (2)
      {
        id v41 = (v41 + 1);
        double v42 = __biome_log_for_category(11LL);
        uint64_t v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          loggingSuffix = self->_loggingSuffix;
          *(_DWORD *)__int128 buf = 138412546;
          id v92 = loggingSuffix;
          v93 = 1024;
          v94 = v41;
          _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_INFO,  "BMSyncDatabase%@ Migrating database to version %u",  buf,  0x12u);
        }

        uint64_t v45 = sub_1000348FC();
        uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
        uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v41));
        id v12 = (id)objc_claimAutoreleasedReturnValue([v46 objectForKeyedSubscript:v47]);

        id v49 = objc_opt_class(&OBJC_CLASS___BMSyncDatabaseCustomFunctionMigration, v48);
        if ((objc_opt_isKindOfClass(v12, v49) & 1) != 0)
        {
          id v51 = (NSString *)objc_claimAutoreleasedReturnValue([v12 customFunctionName]);
          id v52 = NSSelectorFromString(v51);
          if (v52)
          {
            if ((((uint64_t (*)(BMSyncDatabase *, SEL))-[BMSyncDatabase methodForSelector:]( self,  "methodForSelector:",  v52))( self,  v52) & 1) != 0) {
              goto LABEL_45;
            }
            v79 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase lastError](self->_fmdb, "lastError"));
            -[BMSyncDatabase setState:errorFormat:]( self,  "setState:errorFormat:",  7LL,  @"custom migration to version %u failed with error %@",  v41,  v79);

LABEL_108:
            uint64_t v60 = -[BMSyncDatabase performSelector:withObject:](self, "performSelector:withObject:", a2, v7);
LABEL_67:

            goto LABEL_104;
          }
        }

        else
        {
          uint64_t v53 = objc_opt_class(&OBJC_CLASS___BMSyncDatabaseSQLStatementMigration, v50);
          if ((objc_opt_isKindOfClass(v12, v53) & 1) == 0)
          {
            -[_bmFMDatabase beginTransaction](self->_fmdb, "beginTransaction");
            -[_bmFMDatabase setUserVersion:](self->_fmdb, "setUserVersion:", v41);
            if (!-[_bmFMDatabase commit](self->_fmdb, "commit"))
            {
              v77 = &stru_100069BD0;
LABEL_102:
              -[BMSyncDatabase setState:errorFormat:](self, "setState:errorFormat:", 9LL, v77, v81);
              goto LABEL_103;
            }

LABEL_58:
            if ((_DWORD)v41 == 31) {
              goto LABEL_80;
            }
            continue;
          }

          uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue([v12 sqlStatements]);
          -[_bmFMDatabase beginTransaction](self->_fmdb, "beginTransaction");
          unsigned __int8 v85 = 0u;
          v86 = 0u;
          __int16 v87 = 0u;
          unsigned int v88 = 0u;
          id v51 = v54;
          uint64_t v55 = -[NSString countByEnumeratingWithState:objects:count:]( v51,  "countByEnumeratingWithState:objects:count:",  &v85,  v90,  16LL);
          if (v55)
          {
            uint64_t v56 = v55;
            uint64_t v57 = *(void *)v86;
            while (2)
            {
              for (i = 0LL; i != v56; i = (char *)i + 1)
              {
                if (*(void *)v86 != v57) {
                  objc_enumerationMutation(v51);
                }
                if (!-[_bmFMDatabase executeStatements:]( self->_fmdb,  "executeStatements:",  *(void *)(*((void *)&v85 + 1) + 8LL * (void)i)))
                {
                  uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase lastError](self->_fmdb, "lastError"));
                  -[BMSyncDatabase setState:errorFormat:]( self,  "setState:errorFormat:",  7LL,  @"migration to version %u failed with error %@",  v41,  v62);

                  uint64_t v60 = -[BMSyncDatabase performSelector:withObject:](self, "performSelector:withObject:", a2, v7);
                  goto LABEL_67;
                }
              }

              uint64_t v56 = -[NSString countByEnumeratingWithState:objects:count:]( v51,  "countByEnumeratingWithState:objects:count:",  &v85,  v90,  16LL);
              if (v56) {
                continue;
              }
              break;
            }
          }

          -[_bmFMDatabase setUserVersion:](self->_fmdb, "setUserVersion:", v41);
          if (-[_bmFMDatabase commit](self->_fmdb, "commit"))
          {
LABEL_45:

            goto LABEL_58;
          }
        }

        break;
      }

      -[BMSyncDatabase setState:errorFormat:](self, "setState:errorFormat:", 9LL, &stru_100069BD0);
      goto LABEL_108;
    case 9uLL:
      return 0;
    default:
      id v81 = -[BMSyncDatabase internalState](self, "internalState");
      unint64_t v8 = @"unhandled state %llu";
      goto LABEL_96;
  }

void sub_100035F3C(_Unwind_Exception *a1)
{
}

void sub_100035F58()
{
}

void sub_1000367E0(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose((const void *)(v1 - 128), 8) = a1;
}

BOOL sub_100037970(uint64_t a1)
{
  BOOL should_defer = xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32));
  if (should_defer) {
    xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 5LL);
  }
  return !should_defer;
}

LABEL_18:
  return v22;
}

LABEL_27:
  return v22;
}

void sub_100038994(id a1)
{
  uint64_t v1 = objc_opt_new(&OBJC_CLASS___BMDateFormatterVendor);
  char v2 = (void *)qword_10007C380;
  qword_10007C380 = (uint64_t)v1;
}

void sub_10003995C(uint64_t a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) FMDBUserVersion]);
  char v2 = (void *)objc_claimAutoreleasedReturnValue([v1 componentsSeparatedByString:@"."]);
  id v3 = [v2 count];

  if ((unint64_t)v3 > 2)
  {
    unint64_t v6 = v1;
  }

  else
  {
    do
    {
      id v11 = (id)objc_claimAutoreleasedReturnValue([v1 stringByAppendingString:@".0"]);

      char v4 = (void *)objc_claimAutoreleasedReturnValue([v11 componentsSeparatedByString:@"."]);
      id v5 = [v4 count];

      unint64_t v6 = v11;
      uint64_t v1 = v11;
    }

    while ((unint64_t)v5 < 3);
  }

  id v12 = v6;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 componentsSeparatedByString:@"."]);
  for (uint64_t i = 0LL; i != 3; ++i)
  {
    char v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:i]);
    int v10 = [v9 intValue];

    if (v10 >= 16)
    {
      NSLog(@"FMDBVersion is invalid: Please use FMDBUserVersion instead.");
      int v10 = 15;
    }

    dword_10007C398 = v10 | (16 * dword_10007C398);
  }
}

uint64_t sub_100039DCC(void *a1, int a2)
{
  id v3 = a1;
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  if (a2)
  {
    double v5 = v4 - v3[3];
    [v3 maxBusyRetryTimeInterval];
    if (v5 >= v6)
    {
      uint64_t v10 = 0LL;
      goto LABEL_8;
    }

    uint32_t v7 = arc4random_uniform(0x32u);
    uint64_t v8 = v7 + 50;
    uint64_t v9 = sqlite3_sleep(v7 + 50);
    if ((_DWORD)v9 != (_DWORD)v8) {
      NSLog( @"WARNING: Requested sleep of %i milliseconds, but SQLite returned %i. Maybe SQLite wasn't built with HAVE_USLEEP=1?",  v8,  v9);
    }
  }

  else
  {
    v3[3] = v4;
  }

  uint64_t v10 = 1LL;
LABEL_8:

  return v10;
}

BOOL sub_10003A278(id a1, _bmFMStatement *a2, BOOL *a3)
{
  BOOL result = !-[_bmFMStatement inUse](a2, "inUse");
  *a3 = result;
  return result;
}

LABEL_30:
                  uint64_t v16 = sqlite3_bind_double(a5, a4, v37);
                  goto LABEL_9;
                }

                id v41 = [v32 unsignedLongLongValue];
              }
            }
          }

          __int128 v40 = (sqlite3_int64)v41;
        }

        uint64_t v16 = sqlite3_bind_int64(a5, a4, v40);
        goto LABEL_9;
      }

      uint64_t v39 = [v23 charValue];
      goto LABEL_39;
    }
  }

  uint64_t v16 = sqlite3_bind_null(a5, a4);
LABEL_9:
  uint64_t v17 = v16;
LABEL_10:

  return v17;
}

LABEL_48:
      if (++v15 >= v13) {
        goto LABEL_53;
      }
    }

    if ((int)v17 > 98)
    {
      switch((int)v17)
      {
        case 'c':
          unint64_t v18 = objc_alloc(&OBJC_CLASS___NSString);
          char v19 = (unsigned int *)v44;
          v44 += 8;
          id v20 = -[NSString initWithFormat:](v18, "initWithFormat:", @"%c", *v19);
          goto LABEL_31;
        case 'd':
        case 'i':
          goto LABEL_13;
        case 'f':
          unint64_t v23 = (double *)v44;
          v44 += 8;
          id v20 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *v23));
          goto LABEL_31;
        case 'g':
          uint64_t v24 = v44;
          v44 += 8;
          uint64_t v25 = *(double *)v24;
          *(float *)&uint64_t v25 = *(double *)v24;
          id v20 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v25));
          goto LABEL_31;
        case 'h':
          uint64_t v26 = v15 + 1;
          if (v15 + 1 >= v13) {
            goto LABEL_36;
          }
          if ([v9 characterAtIndex:v15 + 1] == 105)
          {
            uint64_t v27 = v44;
            v44 += 8;
            uint64_t v28 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithShort:]( &OBJC_CLASS___NSNumber,  "numberWithShort:",  *(__int16 *)v27));
            goto LABEL_42;
          }

          if ([v9 characterAtIndex:v15 + 1] == 117)
          {
            uint64_t v36 = (unsigned __int16 *)v44;
            v44 += 8;
            uint64_t v28 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](&OBJC_CLASS___NSNumber, "numberWithUnsignedShort:", *v36));
            goto LABEL_42;
          }

LABEL_36:
          uint64_t v35 = 104LL;
          goto LABEL_46;
        case 'l':
          uint64_t v26 = v15 + 1;
          if (v15 + 1 >= v13) {
            goto LABEL_33;
          }
          uint64_t v29 = [v9 characterAtIndex:v15 + 1];
          if (v29 == 100)
          {
            uint64_t v38 = v44;
            v44 += 8;
            uint64_t v28 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", *(void *)v38));
            goto LABEL_42;
          }

          if (v29 == 117)
          {
            uint64_t v39 = v44;
            v44 += 8;
            uint64_t v28 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLong:",  *(void *)v39));
            goto LABEL_42;
          }

          if (v29 != 108)
          {
LABEL_33:
            uint64_t v35 = 108LL;
            goto LABEL_46;
          }

          v15 += 2LL;
          if (v15 < v13)
          {
            if ([v9 characterAtIndex:v15] == 100)
            {
              uint64_t v30 = v44;
              v44 += 8;
              id v20 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  *(void *)v30));
              goto LABEL_31;
            }

            if ([v9 characterAtIndex:v15] == 117)
            {
              double v42 = v44;
              v44 += 8;
              id v20 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *(void *)v42));
              goto LABEL_31;
            }
          }

          uint64_t v35 = 108LL;
          unsigned int v15 = v26;
          goto LABEL_46;
        case 'q':
          uint64_t v26 = v15 + 1;
          if (v15 + 1 >= v13) {
            goto LABEL_39;
          }
          if ([v9 characterAtIndex:v15 + 1] == 105)
          {
            uint64_t v31 = v44;
            v44 += 8;
            uint64_t v28 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", *(void *)v31));
          }

          else
          {
            if ([v9 characterAtIndex:v15 + 1] != 117)
            {
LABEL_39:
              uint64_t v35 = 113LL;
              goto LABEL_46;
            }

            uint64_t v37 = v44;
            v44 += 8;
            uint64_t v28 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *(void *)v37));
          }

LABEL_42:
          uint64_t v34 = (void *)v28;
          unsigned int v15 = v26;
          if (!v28) {
            goto LABEL_43;
          }
          goto LABEL_32;
        case 's':
          uint64_t v32 = v44;
          v44 += 8;
          id v20 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  *(void *)v32));
          goto LABEL_31;
        case 'u':
          goto LABEL_12;
        default:
          goto LABEL_43;
      }
    }

    switch((_DWORD)v17)
    {
      case '@':
        uint64_t v33 = (id *)v44;
        v44 += 8;
        id v20 = (NSString *)*v33;
        break;
      case 'D':
LABEL_13:
        int v22 = (unsigned int *)v44;
        v44 += 8;
        id v20 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", *v22));
        break;
      case 'U':
LABEL_12:
        uint64_t v21 = (unsigned int *)v44;
        v44 += 8;
        id v20 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", *v21));
        break;
      default:
LABEL_43:
        if ((_DWORD)v14 == 64)
        {
          __int128 v40 = v10;
          id v41 = @"NULL";
LABEL_47:
          objc_msgSend(v40, "appendFormat:", v41, v43);
          goto LABEL_48;
        }

        goto LABEL_45;
    }

LABEL_53:
}

void *sub_10003BA6C(void *result, int a2, void *a3, void *a4)
{
  if (result)
  {
    uint32_t v7 = objc_retainBlock(result);
    uint64_t v8 = a2;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  a2));
    if (a2 >= 1)
    {
      do
      {
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", *a4));
        if (*a3) {
          uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:"));
        }
        else {
          uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
        }
        id v12 = (void *)v11;
        if (!v11) {
          id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
        }
        [v9 setObject:v12 forKey:v10];

        ++a3;
        ++a4;
        --v8;
      }

      while (v8);
    }

    uint64_t v13 = v7[2](v7, v9);

    return (void *)v13;
  }

  return result;
}

void sub_10003C3F8(sqlite3_context *a1, uint64_t a2, uint64_t a3)
{
  double v6 = sqlite3_user_data(a1);
  uint64_t v8 = (void (**)(id, sqlite3_context *, uint64_t, uint64_t))objc_claimAutoreleasedReturnValue(v6);
  if (v8)
  {
    uint32_t v7 = objc_autoreleasePoolPush();
    v8[2](v8, a1, a2, a3);
    objc_autoreleasePoolPop(v7);
  }
}

void sub_10003C940()
{
}

void sub_10003C968(uint64_t a1, uint64_t a2)
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  [v4 handleFailureInMethod:a1, a2, @"FMDatabase.m", 550, @"The _bmFMDatabase %@ is currently in use.", a2 object file lineNumber description];

  abort();
}

void sub_10003C9C4(uint64_t a1, uint64_t a2)
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  [v4 handleFailureInMethod:a1, a2, @"FMDatabase.m", 564, @"The _bmFMDatabase %@ is not open.", a2 object file lineNumber description];

  abort();
}

void sub_10003CA20(void *a1, uint64_t a2)
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  id v5 = [a1 lastErrorCode];
  double v6 = (void *)objc_claimAutoreleasedReturnValue([a1 lastErrorMessage]);
  [v4 handleFailureInMethod:a2, a1, @"FMDatabase.m", 875, @"DB Error: %d %@", v5, v6 object file lineNumber description];

  abort();
}

void sub_10003CAA4(void *a1, uint64_t a2)
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1 lastErrorMessage]);
  [v4 handleFailureInMethod:a2, a1, @"FMDatabase.m", 1351, @"%@", v5 object file lineNumber description];

  abort();
}

void sub_10003E4B0(id *a1, uint64_t a2, int a3)
{
  id v5 = a1;
  double v6 = (void *)objc_claimAutoreleasedReturnValue([*a1 lastErrorMessage]);
  unsigned int v7 = [*v5 lastErrorCode];
  LODWORD(v5) = [*v5 lastExtendedErrorCode];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a2 + 40) query]);
  int v9 = 138413314;
  uint64_t v10 = v6;
  __int16 v11 = 1024;
  unsigned int v12 = v7;
  __int16 v13 = 1024;
  int v14 = (int)v5;
  __int16 v15 = 1024;
  int v16 = a3;
  __int16 v17 = 2112;
  unint64_t v18 = v8;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "fmdb: error: %@ errCode: %u extendedErrCode: %u while fetching column %u for statement: %@",  (uint8_t *)&v9,  0x28u);
}

id sub_10003EA3C(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 16) containsObject:*(void *)(a1 + 40)])
  {
    char v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"Database already in pool",  @"The _bmFMDatabase being put back into the pool is already present in the pool",  0LL));
    [v2 raise];
  }

  [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 40)];
  return [*(id *)(*(void *)(a1 + 32) + 24) removeObject:*(void *)(a1 + 40)];
}

void sub_10003EB58( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_10003EB70(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10003EB80(uint64_t a1)
{
}

void sub_10003EB88(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 16) lastObject]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  double v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v8 = *(void *)(v7 + 40);
  if (v8)
  {
    [*(id *)(v6 + 24) addObject:*(void *)(v7 + 40)];
    [*(id *)(*(void *)(a1 + 32) + 16) removeLastObject];
  }

  else
  {
    if (*(void *)(v6 + 56))
    {
      int v9 = (char *)[*(id *)(v6 + 24) count];
      uint64_t v10 = &v9[(void)[*(id *)(*(void *)(a1 + 32) + 16) count]];
      uint64_t v6 = *(void *)(a1 + 32);
      if ((unint64_t)v10 >= *(void *)(v6 + 56))
      {
        NSLog(@"Maximum number of databases (%ld) has already been reached!", v10);
        return;
      }
    }

    id v11 = objc_msgSend( objc_msgSend((id)objc_opt_class(v6, v5), "databaseClass"),  "databaseWithPath:",  *(void *)(*(void *)(a1 + 32) + 40));
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8LL);
    int v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }

  unsigned int v15 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) openWithFlags:*(unsigned int *)(*(void *)(a1 + 32) + 32) vfs:*(void *)(*(void *)(a1 + 32) + 64)];
  uint64_t v16 = *(void *)(a1 + 32);
  if (!v15)
  {
    NSLog(@"Could not open up the database at path %@", *(void *)(v16 + 40));
LABEL_17:
    uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8LL);
    unint64_t v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = 0LL;

    return;
  }

  if ((objc_opt_respondsToSelector(*(void *)(v16 + 48), "databasePool:shouldAddDatabaseToPool:") & 1) != 0
    && ([*(id *)(*(void *)(a1 + 32) + 48) databasePool:*(void *)(a1 + 32) shouldAddDatabaseToPool:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)] & 1) == 0)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) close];
    goto LABEL_17;
  }

  if (([*(id *)(*(void *)(a1 + 32) + 24) containsObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)] & 1) == 0)
  {
    [*(id *)(*(void *)(a1 + 32) + 24) addObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    if (!v8
      && (objc_opt_respondsToSelector(*(void *)(*(void *)(a1 + 32) + 48LL), "databasePool:didAddDatabase:") & 1) != 0)
    {
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "databasePool:didAddDatabase:");
    }
  }

void sub_10003EDFC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

id sub_10003EE14(uint64_t a1)
{
  id result = [*(id *)(*(void *)(a1 + 32) + 16) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = result;
  return result;
}

void sub_10003EECC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

id sub_10003EEE4(uint64_t a1)
{
  id result = [*(id *)(*(void *)(a1 + 32) + 24) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = result;
  return result;
}

void sub_10003EF9C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

id sub_10003EFB4(uint64_t a1)
{
  uint64_t v2 = (char *)[*(id *)(*(void *)(a1 + 32) + 24) count];
  id result = [*(id *)(*(void *)(a1 + 32) + 16) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = &v2[(void)result];
  return result;
}

id sub_10003F04C(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
}

void sub_10003F808(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0LL;
}

void sub_10003F9B0(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) database]);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_10003FA9C(uint64_t a1)
{
  unsigned __int8 v8 = 0;
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2 == 2)
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) database]);
    [v3 beginImmediateTransaction];
  }

  else if (v2 == 1)
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) database]);
    [v3 beginDeferredTransaction];
  }

  else
  {
    if (v2) {
      goto LABEL_8;
    }
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) database]);
    [v3 beginTransaction];
  }

LABEL_8:
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) database]);
  (*(void (**)(uint64_t, void *, unsigned __int8 *))(v4 + 16))(v4, v5, &v8);

  LODWORD(v4) = v8;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) database]);
  uint64_t v7 = v6;
  if ((_DWORD)v4) {
    [v6 rollback];
  }
  else {
    [v6 commit];
  }
}

uint64_t sub_10003FC80(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10003FC90(uint64_t a1)
{
}

void sub_10003FC98(uint64_t a1)
{
  uint64_t v2 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v3 = qword_10007C3B0++;
  uint64_t v4 = -[NSString initWithFormat:](v2, "initWithFormat:", @"savePoint%ld", v3);
  char v17 = 0;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) database]);
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id obj = *(id *)(v6 + 40);
  unsigned int v7 = [v5 startSavePointWithName:v4 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);

  if (v7)
  {
    uint64_t v8 = *(void *)(a1 + 40);
    int v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) database]);
    (*(void (**)(uint64_t, void *, char *))(v8 + 16))(v8, v9, &v17);

    if (v17)
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) database]);
      uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8LL);
      id v15 = *(id *)(v11 + 40);
      [v10 rollbackToSavePointWithName:v4 error:&v15];
      objc_storeStrong((id *)(v11 + 40), v15);
    }

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) database]);
    uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8LL);
    id v14 = *(id *)(v13 + 40);
    [v12 releaseSavePointWithName:v4 error:&v14];
    objc_storeStrong((id *)(v13 + 40), v14);
  }
}

void sub_10003FEE8(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) database]);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 checkpoint:*(unsigned int *)(a1 + 80) name:*(void *)(a1 + 40) logFrameCount:*(void *)(a1 + 56) checkpointCount:*(void *)(a1 + 64) error:*(void *)(a1 + 72)];
}

void sub_10003FFB8()
{
  __assert_rtn( "-[_bmFMDatabaseQueue inDatabase:]",  "FMDatabaseQueue.m",  185,  "currentSyncQueue != self && inDatabase: was called reentrantly on the same queue, which would lead to a deadlock");
}

void sub_10003FFE0(uint64_t a1, os_log_s *a2)
{
  uint64_t v2 = *(void *)(a1 + 64);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "BMRapportClient[%@]: invalidated",  (uint8_t *)&v3,  0xCu);
}

void sub_100040058(uint64_t a1, os_log_s *a2)
{
  uint64_t v2 = *(void *)(a1 + 64);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "BMRapportClient[%@]: Must be inactive before creating and activating companion link client",  (uint8_t *)&v3,  0xCu);
}

void sub_1000400D0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "locationRow is nil, returning empty state vector",  v1,  2u);
}

void sub_100040110(uint8_t *a1, void *a2, os_log_s *a3)
{
  *(_DWORD *)a1 = 138412290;
  *a2 = 0LL;
  sub_100003CC4( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "BMStreamCKRecordCRDT: failed to calculate batch size with error %@",  a1);
}

void sub_10004014C(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 138412290;
  uint64_t v4 = 0LL;
  sub_100003CC4( (void *)&_mh_execute_header,  a1,  a3,  "BMStreamCKRecordCRDT: failed to split atom batch with error %@",  (uint8_t *)&v3);
}

void sub_1000401BC(uint64_t a1, os_log_s *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "unexpected modifier %lu",  (uint8_t *)&v2,  0xCu);
}

void sub_100040230(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "BMMultiStreamVectorClockConverter found nil modifier on siteIdentifier: %@",  (uint8_t *)&v2,  0xCu);
}

void sub_1000402A4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000402D8()
{
}

void sub_10004033C()
{
}

void sub_1000403A0()
{
  os_log_t v1 = (void *)objc_claimAutoreleasedReturnValue([*v0 siteSuffix]);
  sub_10000C408();
  sub_10000C3E4( (void *)&_mh_execute_header,  v2,  v3,  "BMRapportSyncEngine%@: fetchAtomBatchRequest is nil, skip sending request to device: %@",  v4,  v5,  v6,  v7,  v8);

  sub_10000C3F8();
}

void sub_100040420()
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 siteSuffix]);
  int v9 = (void *)objc_claimAutoreleasedReturnValue([v0 account]);
  sub_10000C3E4( (void *)&_mh_execute_header,  v3,  v4,  "BMRapportSyncEngine%@: unable to create a sync manager for account %@",  v5,  v6,  v7,  v8,  2u);

  sub_10000C3F8();
}

void sub_1000404C0()
{
  id v1 = [(id)sub_10000C444(v0) siteSuffix];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_10000C408();
  sub_10000C3E4( (void *)&_mh_execute_header,  v3,  v4,  "BMRapportSyncEngine%@: unable to determine sender model info: %@",  v5,  v6,  v7,  v8,  v9);

  sub_10000C3F8();
}

void sub_10004053C()
{
  id v1 = [(id)sub_10000C444(v0) siteSuffix];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_10000C42C();
  sub_10000C3E4( (void *)&_mh_execute_header,  v3,  v4,  "BMRapportSyncEngine%@: unable to determine platform for model %{public}@",  v5,  v6,  v7,  v8,  v9);

  sub_10000C3F8();
}

void sub_1000405B8()
{
  id v1 = [(id)sub_10000C444(v0) siteSuffix];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_10000C408();
  sub_10000C3E4( (void *)&_mh_execute_header,  v3,  v4,  "BMRapportSyncEngine%@: rejecting request from communal device to sync outside home %@",  v5,  v6,  v7,  v8,  v9);

  sub_10000C3F8();
}

void sub_100040634()
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([*v0 siteSuffix]);
  sub_10000C42C();
  sub_10000C3E4( (void *)&_mh_execute_header,  v2,  v3,  "BMRapportSyncEngine%@: unable to create sync manager for %{public}@",  v4,  v5,  v6,  v7,  v8);

  sub_10000C3F8();
}

void sub_1000406B4()
{
  id v1 = [(id)sub_10000C444(v0) siteSuffix];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_10000C408();
  sub_10000C3E4( (void *)&_mh_execute_header,  v3,  v4,  "BMRapportSyncEngine%@: rejecting request from personal device to sync cross account %@",  v5,  v6,  v7,  v8,  v9);

  sub_10000C3F8();
}

void sub_100040730()
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([v0 siteSuffix]);
  sub_10000C42C();
  sub_10000C3E4( (void *)&_mh_execute_header,  v2,  v3,  "BMRapportSyncEngine%@: unable to create sync manager for %{public}@",  v4,  v5,  v6,  v7,  v8);

  sub_10000C3F8();
}

void sub_1000407AC()
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([v0 siteSuffix]);
  sub_10000C408();
  sub_10000C3E4( (void *)&_mh_execute_header,  v2,  v3,  "BMRapportSyncEngine%@: fetchAtomBatchRequest is nil, skip sending request to device: %@",  v4,  v5,  v6,  v7,  v8);

  sub_10000C3F8();
}

void sub_100040828()
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([v0 siteSuffix]);
  sub_10000C408();
  sub_10000C3E4( (void *)&_mh_execute_header,  v2,  v3,  "BMRapportSyncEngine%@: createDistributedSyncManagerFromOptions unable to determine sender account info: %@",  v4,  v5,  v6,  v7,  v8);

  sub_10000C3F8();
}

void sub_1000408A4()
{
}

void sub_100040908()
{
}

void sub_10004096C()
{
}

void sub_1000409D8(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 identifier]);
  sub_10000CD34();
  sub_100003CC4((void *)&_mh_execute_header, a2, v4, "failed to open database for account: %@", v5);
}

void sub_100040A60( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100040AC8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100040B30(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v4 = (objc_class *)objc_opt_class(a1, a2);
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  sub_10000C408();
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "%@ - has validStreamNames: %@", v7, 0x16u);

  sub_10000C3F8();
}

void sub_100040BC4(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v4 = (objc_class *)objc_opt_class(a1, a2);
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  sub_10000C408();
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "%@ could not archive state vector: %@",  v7,  0x16u);

  sub_10000C3F8();
}

void sub_100040C58( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100040CC8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100040D2C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100040D90( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100040E00( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100040E68()
{
}

void sub_100040EC8()
{
}

void sub_100040EF4()
{
}

void sub_100040F20()
{
}

void sub_100040F80()
{
}

void sub_100040FE0()
{
}

void sub_100041040()
{
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  sub_1000170D4( (void *)&_mh_execute_header,  v1,  (uint64_t)v1,  "currentRangeClockVector %@ minusVector clockVector %@",  v2);
  sub_10000CD40();
}

void sub_1000410B4()
{
}

void sub_100041114()
{
}

void sub_100041178(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 mergeableValueID]);
  sub_10000CD34();
  sub_100017084( (void *)&_mh_execute_header,  a2,  v4,  "location is unexpectedly nil, unable to parse from mergeableValueID %@",  v5);
}

void sub_100041200()
{
}

void sub_10004122C(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *__int128 buf = 0;
  *a2 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "storing atom batches operations failed to commit transactions",  buf,  2u);
}

void sub_100041268()
{
}

void sub_100041294(void *a1, uint64_t a2, os_log_s *a3)
{
  uint8_t v6 = (void *)objc_claimAutoreleasedReturnValue([a1 timestamp]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bm_description"));
  uint8_t v8 = sub_100023274((unint64_t)[a1 type]);
  uint8_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = *(void *)(*(void *)a2 + 16LL);
  int v11 = 138413058;
  uint64_t v12 = v7;
  __int16 v13 = 2112;
  id v14 = v9;
  __int16 v15 = 2112;
  uint64_t v16 = v10;
  __int16 v17 = 2112;
  unint64_t v18 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "Failed to insert record for atom: %@ (%@), stream: %@, record: %@",  (uint8_t *)&v11,  0x2Au);
}

void sub_10004138C(void *a1, os_log_s *a2)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a1 timestamp]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bm_description"));
  uint8_t v6 = sub_100023274((unint64_t)[a1 type]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint8_t v8 = (void *)objc_claimAutoreleasedReturnValue([a1 valueData]);
  [v8 length];
  sub_1000170EC();
  int v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = v9;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "Received atom: %@ (%@), size: %llu",  v10,  0x20u);
}

void sub_100041480()
{
}

void sub_1000414AC()
{
}

void sub_100041510()
{
}

void sub_100041570(void *a1, os_log_s *a2)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a1 timestamp]);
  objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bm_description"));
  id v5 = sub_1000170E0();
  uint8_t v6 = sub_100023274((unint64_t)v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  sub_1000170B0();
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "failed to apply atom %@ (%@) to disk",  v8,  0x16u);

  sub_10000C3F8();
}

void sub_100041620(void *a1, os_log_s *a2)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a1 timestamp]);
  objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bm_description"));
  id v5 = sub_1000170E0();
  uint8_t v6 = sub_100023274((unint64_t)v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  sub_1000170B0();
  sub_1000170D4((void *)&_mh_execute_header, a2, v8, "Applying atom to disk: %@ (%@)", v9);

  sub_10000C3F8();
}

void sub_1000416C8(void *a1, void *a2, os_log_s *a3)
{
  uint8_t v6 = (void *)objc_claimAutoreleasedReturnValue([a1 timestamp]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bm_description"));
  uint64_t v8 = sub_100023274((unint64_t)[a1 type]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([a2 timestamp]);
  int v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bm_description"));
  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue([a1 referenceLocation]);
  sub_1000170EC();
  uint64_t v16 = v9;
  __int16 v17 = v13;
  unint64_t v18 = v11;
  __int16 v19 = v13;
  id v20 = a1;
  __int16 v21 = v13;
  uint64_t v22 = v14;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "causal reference violation: %@ -(%@)-> %@\nAtom: %@\nReference location: %@",  v15,  0x34u);
}

void sub_1000417F4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10004185C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000418C4()
{
}

void sub_1000418F0()
{
}

void sub_100041928()
{
}

void sub_100041954(void *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1 shortenedRapportIdentifier]);
  int v6 = 138412546;
  uint64_t v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_FAULT,  "BMRapportDevice[%@]: expected request id and response handler in %@",  (uint8_t *)&v6,  0x16u);
}

void sub_100041A04()
{
}

void sub_100041A30()
{
}

void sub_100041A90()
{
}

void sub_100041AF0()
{
}

void sub_100041B50()
{
}

void sub_100041BB0()
{
}

void sub_100041C10(id *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([*a1 lastErrorMessage]);
  sub_10000CD34();
  sub_10001F24C((void *)&_mh_execute_header, v2, v3, "Failed to insert: %@", v4, v5, v6, v7, v8);

  sub_10001F260();
}

void sub_100041C8C(id *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([*a1 lastErrorMessage]);
  sub_10000CD34();
  sub_10001F24C((void *)&_mh_execute_header, v2, v3, "Failed to update: %@", v4, v5, v6, v7, v8);

  sub_10001F260();
}

void sub_100041D08()
{
}

void sub_100041D6C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100041DA0(id *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*a1 identifier]);
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "failed to open database for account: %@",  (uint8_t *)&v4,  0xCu);
}

void sub_100041E38()
{
}

void sub_100041EA8()
{
}

void sub_100041F18()
{
}

void sub_100041F88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v4 = (objc_class *)sub_100023FCC(a1, a2, a3, a4);
  uint64_t v5 = NSStringFromClass(v4);
  uint8_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  sub_10000CD34();
  sub_10001F24C( (void *)&_mh_execute_header,  v7,  v8,  "%@: tried to initialize a BMPBSyncAtomValue proto, missing type or value",  v9,  v10,  v11,  v12,  v13);

  sub_10001F260();
}

void sub_100042000(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v4 = (objc_class *)sub_100023FCC(a1, a2, a3, a4);
  uint64_t v5 = NSStringFromClass(v4);
  uint8_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  sub_10000CD34();
  sub_10001F24C( (void *)&_mh_execute_header,  v7,  v8,  "%@: tried to initialize with a non-BMPBSyncAtomValue proto",  v9,  v10,  v11,  v12,  v13);

  sub_10001F260();
}

void sub_100042078()
{
}

void sub_1000420E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v4 = (objc_class *)sub_100023FCC(a1, a2, a3, a4);
  uint64_t v5 = NSStringFromClass(v4);
  uint8_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  sub_10000CD34();
  sub_10001F24C( (void *)&_mh_execute_header,  v7,  v8,  "%@: tried to initialize a BMPBStoreEventAtomValue proto: missing dataVersion or dataTimestamp",  v9,  v10,  v11,  v12,  v13);

  sub_10001F260();
}

void sub_100042160(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v4 = (objc_class *)sub_100023FCC(a1, a2, a3, a4);
  uint64_t v5 = NSStringFromClass(v4);
  uint8_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  sub_10000CD34();
  sub_10001F24C( (void *)&_mh_execute_header,  v7,  v8,  "%@: tried to initialize with a non-BMPBStoreEventAtomValue proto",  v9,  v10,  v11,  v12,  v13);

  sub_10001F260();
}

void sub_1000421D8(uint8_t *a1, void *a2, void *a3, os_log_s *a4)
{
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a2 identifier]);
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl( (void *)&_mh_execute_header,  a4,  OS_LOG_TYPE_ERROR,  "failed to open database for account: %@",  a1,  0xCu);
}

void sub_10004224C()
{
}

void sub_1000422AC()
{
}

void sub_1000422D8()
{
}

void sub_100042338()
{
}

void sub_100042398()
{
}

void sub_1000423F8()
{
}

void sub_100042424()
{
}

void sub_100042450()
{
}

void sub_10004247C()
{
}

void sub_1000424A8()
{
  sub_10000DF50( (void *)&_mh_execute_header,  v0,  v1,  "accountInfoWithCompletionHandler returned error: %@",  v2,  v3,  v4,  v5,  v6);
  sub_10000CD40();
}

void sub_100042508()
{
}

void sub_100042568()
{
}

void sub_1000425C8()
{
}

void sub_100042628()
{
  __int16 v3 = v0;
  uint64_t v4 = 0LL;
  sub_10002C5D4( (void *)&_mh_execute_header,  v1,  (uint64_t)v1,  "Error saving [saveCKRecordServerMergeableValue:serverValueData] for %{public}@ %{public}@, %{public}@",  v2);
}

void sub_10004269C(void *a1, os_log_s *a2)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a1 recordID]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 recordName]);
  uint8_t v6 = (void *)objc_claimAutoreleasedReturnValue([a1 recordType]);
  int v8 = 138543618;
  uint64_t v9 = v5;
  sub_10002C5E0();
  sub_10002C578( (void *)&_mh_execute_header,  a2,  v7,  "didFetchRecord: unknown record %{public}@ type: %{public}@",  (uint8_t *)&v8);

  sub_10000C3F8();
}

void sub_100042750()
{
}

void sub_1000427B8()
{
}

void sub_100042820()
{
}

void sub_100042880()
{
}

void sub_1000428E8(void *a1, os_log_s *a2)
{
  __int16 v3 = (void *)objc_claimAutoreleasedReturnValue([a1 recordID]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 recordName]);
  sub_10000CD34();
  sub_100003CC4((void *)&_mh_execute_header, a2, v5, "Zone ID is nil; record dropped %{public}@", v6);

  sub_10000C3F8();
}

void sub_10004297C(void *a1, void *a2)
{
  __int16 v3 = (void *)objc_claimAutoreleasedReturnValue([a1 zoneName]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a2 recordID]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 recordName]);
  sub_10002C5E0();
  sub_10000C3E4( (void *)&_mh_execute_header,  v6,  v7,  "Add zone and add record request made %{public}@ %{public}@.",  v8,  v9,  v10,  v11,  2u);

  sub_10000C3F8();
}

void sub_100042A28( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100042A90(uint64_t *a1, os_log_s *a2, uint64_t a3)
{
  uint64_t v3 = *a1;
  int v4 = 138543618;
  uint64_t v5 = 0LL;
  __int16 v6 = 2114;
  uint64_t v7 = v3;
  sub_10002C578( (void *)&_mh_execute_header,  a2,  a3,  "handleFailedToSaveSyncRecordServerRecordChanged: serverCRDT is nil for record: %{public}@ for error: %{public}@",  (uint8_t *)&v4);
  sub_10000CD40();
}

void sub_100042B08()
{
    v2,
    v3,
    v4,
    v5,
    v6);
  sub_10000CD40();
}

void sub_100042B68()
{
}

void sub_100042BC8()
{
}

void sub_100042C28()
{
}

void sub_100042C88( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100042CF0(void *a1, void *a2, uint64_t a3, os_log_s *a4)
{
  *(_DWORD *)a3 = 138543618;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(void *)(a3 + 14) = a2;
  sub_10002C578( (void *)&_mh_execute_header,  a4,  a3,  "syncEngineDidEndFetchingChanges: Can't build location from record stream:%{public}@ recordName:%{public}@",  (uint8_t *)a3);
}

void sub_100042D54()
{
}

void sub_100042DB4(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)uint64_t v3 = 138543618;
  *(void *)&void v3[4] = *(void *)(*(void *)a1 + 40LL);
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  sub_10002C564( (void *)&_mh_execute_header,  a2,  a3,  "Unable to archive recordValue %{public}@ %{public}@",  *(void *)v3,  *(void *)&v3[8],  *(void *)&v3[16]);
  sub_10000CD40();
}

void sub_100042E2C(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) recordName]);
  uint8_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) streamIdentifier]);
  sub_10002C5B4();
  sub_10002C5D4( (void *)&_mh_execute_header,  a3,  v7,  "Unable to [recordValue mergeRecordValue:serverValue for %{public}@ %{public}@ %{public}@",  v8);

  sub_10002C5F0();
}

void sub_100042ED0(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) recordName]);
  uint8_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) streamIdentifier]);
  sub_10002C5B4();
  sub_10002C5D4( (void *)&_mh_execute_header,  a3,  v7,  "syncEngineDidEndFetchingChanges: Unable to unarchive mergeableRecordValue for %{public}@ %{public}@ %{public}@",  v8);

  sub_10002C5F0();
}

void sub_100042F74(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Could not generate atom data from atomBatch: %@, error: %@",  (uint8_t *)&v3,  0x16u);
}

void sub_100042FF8()
{
  uint64_t Description = BMDevicePlatformGetDescription(0LL);
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(Description);
  sub_10001F24C( (void *)&_mh_execute_header,  v2,  v3,  "BMRapportManager: could not determine appropriate control flags for device platform: %@",  v4,  v5,  v6,  v7,  2u);

  sub_10001F260();
}

void sub_100043078(uint64_t a1)
{
  uint64_t Description = BMDevicePlatformGetDescription(a1);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(Description);
  sub_10001F24C( (void *)&_mh_execute_header,  v3,  v4,  "BMRapportManager: could not determine appropriate control flags for device platform: %@",  v5,  v6,  v7,  v8,  2u);

  sub_10001F260();
}

void sub_1000430F4(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 identifier]);
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "failed to open database for account: %@",  (uint8_t *)&v4,  0xCu);
}

void sub_100043188(uint64_t a1, os_log_s *a2)
{
  uint64_t v2 = *(void *)(a1 + 64);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "BMRapportClient[%@]: Requests must be added before activation",  (uint8_t *)&v3,  0xCu);
}

void sub_10004320C(uint64_t a1, os_log_s *a2)
{
  uint64_t v2 = *(void *)(a1 + 64);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "BMRapportClient[%@]: Requests must be registered during activation",  (uint8_t *)&v3,  0xCu);
}

void sub_100043290()
{
}

void sub_1000432F0()
{
}

void sub_100043354()
{
}

void sub_1000433B8()
{
}

void sub_100043424()
{
}

void sub_100043484()
{
}

void sub_1000434E4()
{
}

void sub_100043544()
{
}

void sub_1000435A4()
{
}

void sub_100043604()
{
}

void sub_100043664(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 zoneName]);
  sub_10000CD34();
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Failed to delete all data associated with zone %@",  v4,  0xCu);

  sub_10001F260();
}

void sub_1000436EC(id *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*a1 lastErrorMessage]);
  sub_10000CD34();
  sub_100017084((void *)&_mh_execute_header, a2, v4, "Failed to insert: %@", v5);

  sub_10001F260();
}

void sub_100043770()
{
}

void sub_1000437D0()
{
}

void sub_100043840()
{
  uint64_t v3 = @"unknown";
  if (v0) {
    uint64_t v3 = (const __CFString *)v0;
  }
  *(_DWORD *)uint64_t v4 = 138412546;
  *(void *)&void v4[4] = v2;
  *(_WORD *)&v4[12] = 2112;
  *(void *)&v4[14] = v3;
  sub_10002C564( (void *)&_mh_execute_header,  v0,  v1,  "BMSyncDatabase%@ unrecoverable error: %@",  *(void *)v4,  *(void *)&v4[8],  *(void *)&v4[16]);
  sub_10000CD40();
}

void sub_1000438C0()
{
}

void sub_100043924()
{
}

void sub_100043984(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Could not enable WAL and foreign_keys on sync database",  v1,  2u);
}

void sub_1000439C4()
{
}

void sub_100043A28(uint64_t a1, id *a2, os_log_s *a3)
{
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*a2 lastError]);
  int v6 = 138412546;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_FAULT,  "BMSyncDatabase%@ failed to close db %@",  (uint8_t *)&v6,  0x16u);
}

void sub_100043AD8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100043B08(uint64_t a1, os_log_s *a2)
{
  int v3 = 138412290;
  uint64_t v4 = objc_opt_class(a1, a2);
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "%@ received nil deviceIdentifier",  (uint8_t *)&v3,  0xCu);
}

void sub_100043B90(uint64_t a1, os_log_s *a2)
{
  int v3 = sub_100005EA4(a1);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  int v5 = 138412290;
  int v6 = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Merge result: %@", (uint8_t *)&v5, 0xCu);
}

void sub_100043C24( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100043C88( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100043CEC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100043D1C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100043D4C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100043D7C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100043DE0(uint64_t a1, id *a2, os_log_s *a3)
{
  int v5 = (void *)objc_claimAutoreleasedReturnValue([*a2 lastError]);
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_FAULT,  "Something went wrong when attempting to delete all site identifiers except %@, error, %@",  (uint8_t *)&v6,  0x16u);
}

void sub_100043E90(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "can not determine streamName", v1, 2u);
}

void sub_100043ED0(void *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (*a1) {
    uint64_t v4 = @"empty";
  }
  else {
    uint64_t v4 = @"nil";
  }
  int v5 = 138412546;
  int v6 = v4;
  __int16 v7 = 2112;
  uint64_t v8 = v3;
  _os_log_fault_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_FAULT,  "_streamName is %@ for %@",  (uint8_t *)&v5,  0x16u);
}

void sub_100043F74(uint64_t a1, os_log_s *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "unknown mergeable value ID format version %lu",  (uint8_t *)&v2,  0xCu);
}

id objc_msgSend_addAtomToAtomBatch_ifChunkerAllows_fromAtomTableRecord_atomValueData_version_atomValueVersion_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "addAtomToAtomBatch:ifChunkerAllows:fromAtomTableRecord:atomValueData:version:atomValueVersion:");
}

id objc_msgSend_addAtomWithValueData_toAtomBatch_fromAtomTableRecord_version_atomValueVersion_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAtomWithValueData:toAtomBatch:fromAtomTableRecord:version:atomValueVersion:");
}

id objc_msgSend_atomBatchesForChangesSinceClockVector_ckFormatVersion_chunker_transportType_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "atomBatchesForChangesSinceClockVector:ckFormatVersion:chunker:transportType:");
}

id objc_msgSend_atomBatchesForChangesSinceClockVector_targetPlatform_transportType_direction_ckFormatVersion_chunker_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "atomBatchesForChangesSinceClockVector:targetPlatform:transportType:direction:ckFormatVersion:chunker:");
}

id objc_msgSend_atomsForChangesSinceClockVector_ckFormatVersion_chunker_transportType_enumerateWithBlock_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "atomsForChangesSinceClockVector:ckFormatVersion:chunker:transportType:enumerateWithBlock:");
}

id objc_msgSend_buildAtomBatchRequestWithIsReciprocal_syncReason_sequenceNumber_transportType_device_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buildAtomBatchRequestWithIsReciprocal:syncReason:sequenceNumber:transportType:device:");
}

id objc_msgSend_ckAtomTableRecordForEvent_ofType_atBookmark_previousTableRecord_siteIdentifier_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ckAtomTableRecordForEvent:ofType:atBookmark:previousTableRecord:siteIdentifier:");
}

id objc_msgSend_computeHighestLocationToDeleteUpToBookmark_forSiteIdentifier_inStream_offsetsIncrease_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "computeHighestLocationToDeleteUpToBookmark:forSiteIdentifier:inStream:offsetsIncrease:");
}

id objc_msgSend_getLatestTombstoneBookmarkForSiteIdentifier_inStream_segmentName_segmentOffset_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getLatestTombstoneBookmarkForSiteIdentifier:inStream:segmentName:segmentOffset:");
}

id objc_msgSend_handleFetchAtomBatchesResponse_options_error_fromDevice_forRequest_isReciprocal_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFetchAtomBatchesResponse:options:error:fromDevice:forRequest:isReciprocal:");
}

id objc_msgSend_initWithLocation_timestamp_referenceLocation_causalReference_type_segmentName_segmentOffset_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithLocation:timestamp:referenceLocation:causalReference:type:segmentName:segmentOffset:");
}

id objc_msgSend_initWithLocation_timestamp_referenceLocation_causalReference_type_valueVersion_valueData_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithLocation:timestamp:referenceLocation:causalReference:type:valueVersion:valueData:");
}

id objc_msgSend_initWithRapportSyncEngine_cloudKitSyncEngine_peerStatusTracker_database_queue_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRapportSyncEngine:cloudKitSyncEngine:peerStatusTracker:database:queue:");
}

id objc_msgSend_initWithStream_permission_config_includeTombstones_eventDataClass_useCase_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStream:permission:config:includeTombstones:eventDataClass:useCase:");
}

id objc_msgSend_initWithStreamCRDT_locationRow_database_queue_maxDeltaSize_sessionContext_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStreamCRDT:locationRow:database:queue:maxDeltaSize:sessionContext:");
}

id objc_msgSend_initWithStreamConfiguration_locationAssignerPolicy_localSiteIdentifier_database_changeReporter_account_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithStreamConfiguration:locationAssignerPolicy:localSiteIdentifier:database:changeReporter:account:");
}

id objc_msgSend_initWithStreamConfiguration_streamCRDT_database_localSiteIdentifier_changeReporter_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStreamConfiguration:streamCRDT:database:localSiteIdentifier:changeReporter:");
}

id objc_msgSend_populateAtomBatch_withAtomsInClockVector_forLocation_ckFormatVersion_valueVersion_chunker_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "populateAtomBatch:withAtomsInClockVector:forLocation:ckFormatVersion:valueVersion:chunker:");
}

id objc_msgSend_recordAtomMergeResult_inStream_ownerSite_originatingSite_eventCreatedAt_sessionContext_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordAtomMergeResult:inStream:ownerSite:originatingSite:eventCreatedAt:sessionContext:");
}

id objc_msgSend_recordAtomMergeResult_inStream_sessionID_messageID_ownerSite_originatingSite_eventCreatedAt_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "recordAtomMergeResult:inStream:sessionID:messageID:ownerSite:originatingSite:eventCreatedAt:");
}

id objc_msgSend_recordMessageToDeviceIdentifier_reachable_bytes_isReciprocal_sessionContext_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordMessageToDeviceIdentifier:reachable:bytes:isReciprocal:sessionContext:");
}

id objc_msgSend_recordMessageToDeviceIdentifier_sessionID_messageID_reachable_bytes_isReciprocal_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordMessageToDeviceIdentifier:sessionID:messageID:reachable:bytes:isReciprocal:");
}

id objc_msgSend_syncRapportNowIfPolicyAllowsWithDevices_reason_activity_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "syncRapportNowIfPolicyAllowsWithDevices:reason:activity:completionHandler:");
}

id objc_msgSend_zoneUUID(void *a1, const char *a2, ...)
{
  return [a1 zoneUUID];
}