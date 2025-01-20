void sub_100001A1C(void *a1, void *a2, void *a3)
{
  uint64_t v3;
  objc_class *v4;
  NSString *v5;
  id v6;
  id v7;
  id v8;
  id v11;
  BOOL v12;
  id v13;
  uint64_t v14;
  id v15[2];
  id v16;
  id location[2];
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v16 = 0LL;
  objc_storeStrong(&v16, a3);
  v15[1] = a1;
  v15[0] = location[0];
  v14 = -1LL;
  v11 = [v15[0] records];
  v12 = [v11 count] == 0;

  if (!v12)
  {
    v7 = [v15[0] records];
    v13 = [v7 firstObject];

    v8 = [v13 valueForKey:@"index"];
    v14 = (int)[v8 intValue];

    objc_storeStrong(&v13, 0LL);
  }

  v6 = location[0];
  v3 = objc_opt_class(&OBJC_CLASS___WCAFetchSQLiteResponse);
  if ((objc_opt_isKindOfClass(v6, v3) & 1) != 0)
  {
    if (a1[4]) {
      (*(void (**)(void))(a1[4] + 16LL))();
    }
  }

  else
  {
    v4 = (objc_class *)objc_opt_class(location[0]);
    v5 = NSStringFromClass(v4);
    NSLog(@"Error: Response is not of type WCAFetchKeyValuesResponse, instead its %@", v5);

    if (a1[4]) {
      (*(void (**)(void))(a1[4] + 16LL))();
    }
  }

  objc_storeStrong(v15, 0LL);
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_100002258(id a1)
{
  v1 = objc_opt_new(&OBJC_CLASS___WCAServer);
  v2 = (void *)qword_100011568;
  qword_100011568 = (uint64_t)v1;
}

void sub_10000255C(uint64_t a1)
{
}

void sub_1000025A4(id a1)
{
}

void sub_10000262C(id a1)
{
}

void sub_100002858(id *a1)
{
  v10[2] = a1;
  v10[1] = a1;
  id v2 = a1[4];
  v3 = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  v6 = sub_100002958;
  v7 = &unk_10000CA60;
  id v8 = a1[4];
  id v9 = a1[5];
  v10[0] = a1[6];
  objc_msgSend(v2, "_findLocallyInstalledAssetWithCompletion:");
  objc_storeStrong(v10, 0LL);
  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(&v8, 0LL);
}

void sub_100002958(uint64_t a1)
{
  uint64_t v23 = a1;
  uint64_t v22 = a1;
  v14 = *(void **)(*(void *)(a1 + 32) + 8LL);
  id v15 = [*(id *)(a1 + 40) asset];
  id v16 = objc_msgSend(v14, "indexOfObject:");

  id v21 = v16;
  id v20 = 0LL;
  if (v16 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v1 = [*(id *)(*(void *)(a1 + 32) + 8) objectAtIndexedSubscript:v21];
    id v2 = v20;
    id v20 = v1;
  }

  id v19 = 0LL;
  uint64_t v12 = *(void *)(a1 + 40);
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___WCAFetchKeyValuesRequest);
  if ((objc_opt_isKindOfClass(v12, v3) & 1) != 0)
  {
    id v18 = *(id *)(a1 + 40);
    v10 = *(void **)(a1 + 32);
    id v11 = [v18 keys];
    id v4 = objc_msgSend(v10, "_readInstalledKeys:ofAsset:");
    id v5 = v19;
    id v19 = v4;

    objc_storeStrong(&v18, 0LL);
  }

  else
  {
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___WCAFetchSQLiteRequest);
    if ((objc_opt_isKindOfClass(v9, v6) & 1) != 0)
    {
      id v17 = *(id *)(a1 + 40);
      id v7 = [*(id *)(a1 + 32) _readSQLiteDataBase:v17 ofAsset:v20];
      id v8 = v19;
      id v19 = v7;

      objc_storeStrong(&v17, 0LL);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  objc_storeStrong(&v19, 0LL);
  objc_storeStrong(&v20, 0LL);
}

void sub_100002DE4(uint64_t a1)
{
}

NSDictionary *__cdecl sub_100002FFC(id a1)
{
  id v2 = @"event";
  uint64_t v3 = @"no-network-connectivity";
  return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v3,  &v2,  1LL);
}

void sub_10000308C(id *a1, void *a2)
{
  v12[3] = a1;
  v12[2] = a2;
  v12[1] = a1;
  if (a2)
  {
    id v2 = [a1[5] name];
    NSLog( @"[%s][%@] Metdata download failed",  "-[WCAServer _fetchAssetCatalogueFromServer:completion:]_block_invoke_2",  v2);

    AnalyticsSendEventLazy(@"com.apple.com.wifi.wificloudasset.event", &stru_10000CAE8);
    (*((void (**)(void))a1[6] + 2))();
  }

  else
  {
    id v4 = a1[4];
    id v3 = a1[5];
    uint64_t v6 = _NSConcreteStackBlock;
    int v7 = -1073741824;
    int v8 = 0;
    uint64_t v9 = sub_1000031F0;
    v10 = &unk_10000CAC8;
    id v11 = a1[4];
    v12[0] = a1[6];
    [v4 _queryAndFindBestVersionOfAsset:v3 completion:&v6];
    objc_storeStrong(v12, 0LL);
    objc_storeStrong(&v11, 0LL);
  }
}

uint64_t sub_1000031F0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

NSDictionary *__cdecl sub_100003238(id a1)
{
  id v2 = @"event";
  id v3 = @"metdata-download-failed";
  return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v3,  &v2,  1LL);
}

uint64_t sub_100003424(uint64_t a1, uint64_t a2)
{
  uint64_t v20 = a1;
  uint64_t v19 = a2;
  uint64_t v18 = a1;
  NSLog(@"Query MAQueryResult: %ld", a2);
  id v13 = [*(id *)(a1 + 32) results];
  BOOL v14 = [v13 count] == 0;

  if (!v14)
  {
    memset(__b, 0, sizeof(__b));
    id obj = [*(id *)(a1 + 32) results];
    id v11 = [obj countByEnumeratingWithState:__b objects:v21 count:16];
    if (v11)
    {
      uint64_t v7 = *(void *)__b[2];
      uint64_t v8 = 0LL;
      id v9 = v11;
      while (1)
      {
        uint64_t v6 = v8;
        if (*(void *)__b[2] != v7) {
          objc_enumerationMutation(obj);
        }
        id v17 = *(id *)(__b[1] + 8 * v8);
        id v3 = [v17 attributes];
        id v15 = [v3 objectForKeyedSubscript:@"WiFiCloudAssetType"];

        id v4 = *(void **)(*(void *)(a1 + 40) + 40LL);
        id v5 = [v17 getLocalUrl];
        objc_msgSend(v4, "setObject:forKey:");

        objc_storeStrong(&v15, 0LL);
        ++v8;
        if (v6 + 1 >= (unint64_t)v9)
        {
          uint64_t v8 = 0LL;
          id v9 = [obj countByEnumeratingWithState:__b objects:v21 count:16];
          if (!v9) {
            break;
          }
        }
      }
    }
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void sub_100003BA0(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    NSLog(@"Query MAQueryResult: %ld", a2);
    (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
  }

  else
  {
    id v6 = [*(id *)(a1 + 32) results];
    BOOL v7 = [v6 count] == 0;

    if (v7)
    {
      id v2 = [*(id *)(a1 + 48) name];
      NSLog( @"[%s][%@] Empty results for asset update query",  "-[WCAServer _queryAndFindBestVersionOfAsset:completion:]_block_invoke",  v2);

      (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
    }

    else
    {
      id v4 = *(void **)(a1 + 40);
      uint64_t v3 = *(void *)(a1 + 48);
      id v5 = [*(id *)(a1 + 32) results];
      objc_msgSend(v4, "_findBestVersionOfAsset:fromResults:completion:", v3);
    }
  }

void sub_1000046C4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) name];
  NSLog( @"[%s][%@] %s: Asset version %@ purged",  "-[WCAServer _findBestVersionOfAsset:fromResults:completion:]_block_invoke",  v2,  "-[WCAServer _findBestVersionOfAsset:fromResults:completion:]_block_invoke",  *(void *)(a1 + 40));
}

void sub_1000048B0(id a1, MAProgressNotification *a2)
{
  id v2 = a1;
  location[1] = a1;
  id v4 = location;
  id v5 = 0LL;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v6 = v2;
  id v3 = [location[0] totalWritten];
  NSLog(@"Progress callback: %lld %lld", v3, [location[0] totalExpected]);
  objc_storeStrong(v4, v5);
}

uint64_t sub_100004934(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = a1;
  uint64_t v24 = a1;
  uint64_t v23 = a2;
  v22[1] = a1;
  id v10 = [*(id *)(a1 + 32) assetType];
  id v9 = [*(id *)(v8 + 32) getLocalUrl];
  NSLog(@"Got the download asset reply: %@, and %@", v10, v9);

  if (v23)
  {
    id v3 = [*(id *)(v8 + 40) name];
    NSLog( @"[%s][%@] %s: Asset download failed - error %ld",  "-[WCAServer _downloadAsset:withLocalAsset:completion:]_block_invoke_2",  v3,  "-[WCAServer _downloadAsset:withLocalAsset:completion:]_block_invoke_2",  v23);

    id v11 = _NSConcreteStackBlock;
    int v12 = -1073741824;
    int v13 = 0;
    BOOL v14 = sub_100004C64;
    id v15 = &unk_10000CBE8;
    uint64_t v16 = v23;
    AnalyticsSendEventLazy(@"com.apple.com.wifi.wificloudasset.event", &v11);
  }

  else
  {
    id v4 = [*(id *)(v8 + 40) name];
    NSLog( @"[%s][%@] %s: Asset download completed",  "-[WCAServer _downloadAsset:withLocalAsset:completion:]_block_invoke_2",  v4,  "-[WCAServer _downloadAsset:withLocalAsset:completion:]_block_invoke_2");

    id v5 = &v17;
    id v17 = _NSConcreteStackBlock;
    int v18 = -1073741824;
    int v19 = 0;
    uint64_t v20 = sub_100004B84;
    id v21 = &unk_10000CBC8;
    location = (id *)v22;
    v22[0] = *(id *)(v8 + 32);
    AnalyticsSendEventLazy(@"com.apple.com.wifi.wificloudasset.event", v5);
    id v6 = [*(id *)(v8 + 40) latestNotInstalledAsset];
    objc_msgSend(*(id *)(v8 + 40), "setLatestInstalledAsset:");

    objc_storeStrong(location, 0LL);
  }

  return (*(uint64_t (**)(void))(*(void *)(v8 + 48) + 16LL))();
}

NSDictionary *sub_100004B84(uint64_t a1)
{
  v4[0] = @"event";
  v5[0] = @"asset-download-completed";
  v4[1] = @"asset-type";
  id v2 = [*(id *)(a1 + 32) assetType];
  v5[1] = v2;
  id v3 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v5,  v4,  2LL);

  return v3;
}

NSDictionary *sub_100004C64(uint64_t a1)
{
  v4[0] = @"event";
  v5[0] = @"asset-download-failed";
  v4[1] = @"error";
  id v2 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", *(void *)(a1 + 32));
  v5[1] = v2;
  id v3 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v5,  v4,  2LL);

  return v3;
}

NSDictionary *__cdecl sub_100005704(id a1)
{
  id v2 = @"event";
  id v3 = @"default-assets";
  return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v3,  &v2,  1LL);
}

NSDictionary *__cdecl sub_100005794(id a1)
{
  id v2 = @"event";
  id v3 = @"locally-installed-assets";
  return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v3,  &v2,  1LL);
}

NSDictionary *sub_100005824(uint64_t a1)
{
  v6[0] = @"event";
  v7[0] = @"found-local-overrides";
  v6[1] = @"key";
  id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"KeyPath"];
  v7[1] = v5;
  v6[2] = @"value";
  id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"Value"];
  v7[2] = v3;
  id v4 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v7,  v6,  3LL);

  return v4;
}

uint64_t sub_100005BB4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100006140(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  (*(void (**)(void))(a1[4] + 16LL))();
  objc_storeStrong(location, 0LL);
}

id WFRunSqliteQuery(void *a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id location = 0LL;
  objc_storeStrong(&location, a1);
  id v87 = 0LL;
  objc_storeStrong(&v87, a2);
  id v86 = 0LL;
  objc_storeStrong(&v86, a3);
  id v85 = 0LL;
  objc_storeStrong(&v85, a4);
  uint64_t v84 = a5;
  id v83 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  memset(__b, 0, sizeof(__b));
  id v47 = v85;
  id v48 = [v47 countByEnumeratingWithState:__b objects:v93 count:16];
  if (v48)
  {
    uint64_t v40 = *(void *)__b[2];
    uint64_t v41 = 0LL;
    id v42 = v48;
    while (1)
    {
      uint64_t v39 = v41;
      if (*(void *)__b[2] != v40) {
        objc_enumerationMutation(v47);
      }
      uint64_t v82 = *(void *)(__b[1] + 8 * v41);
      id v37 = v83;
      v38 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v82);
      objc_msgSend(v37, "addObject:");

      ++v41;
      if (v39 + 1 >= (unint64_t)v42)
      {
        uint64_t v41 = 0LL;
        id v42 = [v47 countByEnumeratingWithState:__b objects:v93 count:16];
        if (!v42) {
          break;
        }
      }
    }
  }

  id v80 = 0LL;
  if ([v83 count])
  {
    id v5 = [v83 componentsJoinedByString:@","];
    id v6 = v80;
    id v80 = v5;
  }

  else
  {
    objc_storeStrong(&v80, @"*");
  }

  v79 = 0LL;
  if (sqlite3_open_v2( (const char *)[location fileSystemRepresentation], &v79, 1, 0))
  {
    sqlite3_close(v79);
    NSLog(@"Failed to open db connection");
    id v89 = 0LL;
    int v77 = 1;
  }

  else
  {
    id v76 = objc_opt_new(&OBJC_CLASS___NSMutableString);
    [v76 appendFormat:@"SELECT %@ FROM %@ WHERE ", v80, v86];
    id v75 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    memset(v73, 0, sizeof(v73));
    id v35 = v87;
    id v36 = [v35 countByEnumeratingWithState:v73 objects:v92 count:16];
    if (v36)
    {
      uint64_t v32 = *(void *)v73[2];
      uint64_t v33 = 0LL;
      id v34 = v36;
      while (1)
      {
        uint64_t v31 = v33;
        if (*(void *)v73[2] != v32) {
          objc_enumerationMutation(v35);
        }
        uint64_t v74 = *(void *)(v73[1] + 8 * v33);
        id v29 = v75;
        v30 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"(%@ = ?)", v74);
        objc_msgSend(v29, "addObject:");

        ++v33;
        if (v31 + 1 >= (unint64_t)v34)
        {
          uint64_t v33 = 0LL;
          id v34 = [v35 countByEnumeratingWithState:v73 objects:v92 count:16];
          if (!v34) {
            break;
          }
        }
      }
    }

    id v72 = [v75 componentsJoinedByString:@" AND "];
    char v69 = 0;
    if (v84 <= 0)
    {
      BOOL v7 = &stru_10000E688;
    }

    else
    {
      v70 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"LIMIT %d", v84);
      char v69 = 1;
      BOOL v7 = v70;
    }

    id v71 = v7;
    if ((v69 & 1) != 0) {

    }
    [v76 appendFormat:@"%@ %@;", v72, v71];
    v68 = 0LL;
    int v67 = sqlite3_prepare_v2(v79, (const char *)[v76 UTF8String], -1, &v68, 0);
    if (v67)
    {
      id v89 = 0LL;
      int v77 = 1;
    }

    else
    {
      int v66 = 1;
      memset(v64, 0, sizeof(v64));
      id v27 = v87;
      id v28 = [v27 countByEnumeratingWithState:v64 objects:v91 count:16];
      if (v28)
      {
        uint64_t v24 = *(void *)v64[2];
        uint64_t v25 = 0LL;
        id v26 = v28;
        while (1)
        {
          uint64_t v23 = v25;
          if (*(void *)v64[2] != v24) {
            objc_enumerationMutation(v27);
          }
          uint64_t v65 = *(void *)(v64[1] + 8 * v25);
          id v63 = [v87 objectForKeyedSubscript:v65];
          id v22 = v63;
          uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSNumber);
          if ((objc_opt_isKindOfClass(v22, v8) & 1) != 0)
          {
            id v62 = v63;
            if (!strcmp((const char *)[v62 objCType], "i")
              || !strcmp((const char *)[v62 objCType], "B"))
            {
              sqlite3_bind_int(v68, v66, (int)[v62 intValue]);
            }

            else if (!strcmp((const char *)[v62 objCType], "f"))
            {
              uint64_t v20 = v68;
              int v21 = v66;
              [v62 doubleValue];
              sqlite3_bind_double(v20, v21, v9);
            }

            else if (!strcmp((const char *)[v62 objCType], "q"))
            {
              sqlite3_bind_int64(v68, v66, (sqlite3_int64)[v62 longLongValue]);
            }

            objc_storeStrong(&v62, 0LL);
          }

          else
          {
            id v61 = [v63 description];
            int v60 = objc_msgSend(v61, "lengthOfBytesUsingEncoding:");
            v59 = (const char *)[v61 cStringUsingEncoding:4];
            sqlite3_bind_text(v68, v66, v59, v60, 0LL);
            objc_storeStrong(&v61, 0LL);
          }

          ++v66;
          objc_storeStrong(&v63, 0LL);
          ++v25;
          if (v23 + 1 >= (unint64_t)v26)
          {
            uint64_t v25 = 0LL;
            id v26 = [v27 countByEnumeratingWithState:v64 objects:v91 count:16];
            if (!v26) {
              break;
            }
          }
        }
      }

      char v58 = 0;
      id v57 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
      id v56 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
      while (1)
      {
        int v67 = sqlite3_step(v68);
        if (v67 != 100) {
          break;
        }
        if ((v58 & 1) == 0)
        {
          int v55 = sqlite3_column_count(v68);
          for (int N = 0; N < v55; ++N)
          {
            v53 =  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  sqlite3_column_name(v68, N));
            [v57 addObject:v53];
            objc_storeStrong((id *)&v53, 0LL);
          }

          char v58 = 1;
        }

        v52 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
        int iCol = 0;
        memset(v50, 0, 0x40uLL);
        id v18 = v57;
        id v19 = [v18 countByEnumeratingWithState:v50 objects:v90 count:16];
        if (v19)
        {
          uint64_t v15 = *(void *)v50[2];
          uint64_t v16 = 0LL;
          id v17 = v19;
          while (1)
          {
            uint64_t v14 = v16;
            if (*(void *)v50[2] != v15) {
              objc_enumerationMutation(v18);
            }
            v50[8] = *(void *)(v50[1] + 8 * v16);
            int v49 = sqlite3_column_type(v68, iCol);
            switch(v49)
            {
              case 1:
                int v13 =  +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  sqlite3_column_int64(v68, iCol));
                -[NSMutableDictionary setObject:forKeyedSubscript:](v52, "setObject:forKeyedSubscript:");

                break;
              case 2:
                int v12 =  +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  sqlite3_column_double(v68, iCol));
                -[NSMutableDictionary setObject:forKeyedSubscript:](v52, "setObject:forKeyedSubscript:");

                break;
              case 3:
                id v11 =  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  sqlite3_column_text(v68, iCol));
                -[NSMutableDictionary setObject:forKeyedSubscript:](v52, "setObject:forKeyedSubscript:");

                break;
            }

            ++iCol;
            ++v16;
            if (v14 + 1 >= (unint64_t)v17)
            {
              uint64_t v16 = 0LL;
              id v17 = [v18 countByEnumeratingWithState:v50 objects:v90 count:16];
              if (!v17) {
                break;
              }
            }
          }
        }

        [v56 addObject:v52];
        objc_storeStrong((id *)&v52, 0LL);
      }

      id v89 = v56;
      int v77 = 1;
      objc_storeStrong(&v56, 0LL);
      objc_storeStrong(&v57, 0LL);
    }

    objc_storeStrong(&v71, 0LL);
    objc_storeStrong(&v72, 0LL);
    objc_storeStrong(&v75, 0LL);
    objc_storeStrong(&v76, 0LL);
  }

  objc_storeStrong(&v80, 0LL);
  objc_storeStrong(&v83, 0LL);
  objc_storeStrong(&v85, 0LL);
  objc_storeStrong(&v86, 0LL);
  objc_storeStrong(&v87, 0LL);
  objc_storeStrong(&location, 0LL);
  return v89;
}

void sub_1000072C8(void *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v37 = 0LL;
  objc_storeStrong(&v37, a3);
  id v36 = a1;
  id v32 = location[0];
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___WCAFetchKeyValuesResponse);
  if ((objc_opt_isKindOfClass(v32, v3) & 1) != 0)
  {
    id v34 = location[0];
    id v33 = objc_opt_new(&OBJC_CLASS___WCAFetchWiFiBehaviorParameters);
    id v7 = [v34 keyValues];
    id v6 = [v7 objectForKeyedSubscript:@"WiFiInternalSSIDs"];
    id v5 = [v6 arrayValue];
    objc_msgSend(v33, "setInternalSSIDs:");

    id v10 = [v34 keyValues];
    id v9 = [v10 objectForKeyedSubscript:@"MacRandomization"];
    id v8 = [v9 dictionaryValue];
    objc_msgSend(v33, "setDisabledMacRandomizationVersions:");

    id v13 = [v34 keyValues];
    id v12 = [v13 objectForKeyedSubscript:@"SoftErrors"];
    id v11 = [v12 dictionaryValue];
    objc_msgSend(v33, "setSoftErrors:");

    id v16 = [v34 keyValues];
    id v15 = [v16 objectForKeyedSubscript:@"DataPathTelemetry"];
    id v14 = [v15 dictionaryValue];
    objc_msgSend(v33, "setDatapathTelemetry:");

    id v19 = [v34 keyValues];
    id v18 = [v19 objectForKeyedSubscript:@"JTRN"];
    id v17 = [v18 dictionaryValue];
    objc_msgSend(v33, "setJtrnDefaults:");

    id v22 = [v34 keyValues];
    id v21 = [v22 objectForKeyedSubscript:@"WiFiAmbiguousSSIDs"];
    id v20 = [v21 arrayValue];
    objc_msgSend(v33, "setAmbiguousSSIDs:");

    id v25 = [v34 keyValues];
    id v24 = [v25 objectForKeyedSubscript:@"AccessPointProfile"];
    id v23 = [v24 dictionaryValue];
    objc_msgSend(v33, "setApProfile:");

    id v28 = [v34 keyValues];
    id v27 = [v28 objectForKeyedSubscript:@"BeaconParsing"];
    id v26 = [v27 dictionaryValue];
    objc_msgSend(v33, "setBeaconParsing:");

    if (a1[4]) {
      (*(void (**)(void))(a1[4] + 16LL))();
    }
    objc_storeStrong(&v33, 0LL);
    objc_storeStrong(&v34, 0LL);
    int v35 = 0;
  }

  else
  {
    id v4 = (objc_class *)objc_opt_class(location[0]);
    id v29 = NSStringFromClass(v4);
    NSLog(@"Error: Response is not of type WCAFetchKeyValuesResponse, instead its %@", v29);

    if (a1[4]) {
      (*(void (**)(void))(a1[4] + 16LL))();
    }
    int v35 = 1;
  }

  objc_storeStrong(&v37, 0LL);
  objc_storeStrong(location, 0LL);
}

int main(int argc, const char **argv, const char **envp)
{
  int v7 = 0;
  int v6 = argc;
  v5[1] = argv;
  v5[0] = objc_opt_new(&OBJC_CLASS___ServiceDelegate);
  id v4 = +[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener");
  -[NSXPCListener setDelegate:](v4, "setDelegate:", v5[0]);
  -[NSXPCListener resume](v4, "resume");
  int v7 = 0;
  objc_storeStrong((id *)&v4, 0LL);
  objc_storeStrong(v5, 0LL);
  return v7;
}

id objc_msgSend_wlanWfaIeWmeQosInfo(void *a1, const char *a2, ...)
{
  return [a1 wlanWfaIeWmeQosInfo];
}