int main(int argc, const char **argv, const char **envp)
{
  void *v3;
  ServiceDelegate *v4;
  void *v5;
  uint8_t v6[16];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "CategoriesService startup requested",  v6,  2u);
  }

  v3 = objc_autoreleasePoolPush();
  v4 = objc_opt_new(&OBJC_CLASS___ServiceDelegate);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener"));
  [v5 setDelegate:v4];
  [v5 resume];
  objc_autoreleasePoolPop(v3);
  dispatch_main();
}

void sub_100001738(uint64_t a1)
{
  v2 = (void *)os_transaction_create("com.apple.categoriesservice.lookupdevice");
  v3 = (os_log_s *)qword_10000CE08;
  if (os_log_type_enabled((os_log_t)qword_10000CE08, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v12 = v2 != 0LL;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "transaction = %d", buf, 8u);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100001874;
  v7[3] = &unk_100008380;
  uint64_t v4 = *(void *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v9 = v2;
  id v10 = v5;
  id v6 = v2;
  +[Categories_Service _lookupGenreIDAndCounterpartIdentifiersInPlist:withCompletionHandler:]( &OBJC_CLASS___Categories_Service,  "_lookupGenreIDAndCounterpartIdentifiersInPlist:withCompletionHandler:",  v4,  v7);
}

void sub_100001874(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = (os_log_s *)qword_10000CE08;
  if (os_log_type_enabled((os_log_t)qword_10000CE08, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138412802;
    uint64_t v10 = v8;
    __int16 v11 = 2080;
    BOOL v12 = "-[Categories_Service genreIDsAndCounterpartIdentifiersForInstalledBundleIDs:replyHandler:]_block_invoke";
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "<%@>::replyHandler %s = %@", (uint8_t *)&v9, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void sub_100001B18(uint64_t a1)
{
  v2 = (void *)os_transaction_create("com.apple.categoriesservice.lookupappstore");
  v3 = (os_log_s *)qword_10000CE08;
  if (os_log_type_enabled((os_log_t)qword_10000CE08, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v14 = v2 != 0LL;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "transaction = %d", buf, 8u);
  }

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(void **)(a1 + 48);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100001C6C;
  v9[3] = &unk_100008380;
  id v10 = v6;
  id v7 = *(id *)(a1 + 56);
  id v11 = v2;
  id v12 = v7;
  id v8 = v2;
  +[Categories_Service _lookupAppStoreUsing:platform:clientApplication:withCompletionHandler:]( &OBJC_CLASS___Categories_Service,  "_lookupAppStoreUsing:platform:clientApplication:withCompletionHandler:",  v4,  v5,  v10,  v9);
}

void sub_100001C6C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (os_log_s *)qword_10000CE08;
  if (os_log_type_enabled((os_log_t)qword_10000CE08, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138412802;
    uint64_t v10 = v8;
    __int16 v11 = 2080;
    id v12 = "-[Categories_Service lookupAppStoreForBundleIDs:platform:replyHandler:]_block_invoke";
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "<%@>::replyHandler %s = %@", (uint8_t *)&v9, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void sub_100001DA4(id a1)
{
  v3[0] = @"6000";
  v3[1] = @"6001";
  v4[0] = CTCategoryIdentifierProductivity;
  v4[1] = CTCategoryIdentifierReadingAndReference;
  v3[2] = @"6002";
  v3[3] = @"6003";
  v4[2] = CTCategoryIdentifierUtilities;
  v4[3] = CTCategoryIdentifierTravel;
  v3[4] = @"6004";
  v3[5] = @"6005";
  v4[4] = CTCategoryIdentifierEntertainment;
  v4[5] = CTCategoryIdentifierSocialNetworking;
  v3[6] = @"6006";
  v3[7] = @"6007";
  v4[6] = CTCategoryIdentifierReadingAndReference;
  v4[7] = CTCategoryIdentifierProductivity;
  v3[8] = @"6008";
  v3[9] = @"6009";
  v4[8] = CTCategoryIdentifierCreativity;
  v4[9] = CTCategoryIdentifierReadingAndReference;
  v3[10] = @"6010";
  v3[11] = @"6011";
  v4[10] = CTCategoryIdentifierTravel;
  v4[11] = CTCategoryIdentifierEntertainment;
  v3[12] = @"6012";
  v3[13] = @"6013";
  v4[12] = CTCategoryIdentifierOther;
  v4[13] = CTCategoryIdentifierHealthAndFitness;
  v3[14] = @"6014";
  v3[15] = @"6015";
  v4[14] = CTCategoryIdentifierGames;
  v4[15] = CTCategoryIdentifierProductivity;
  v3[16] = @"6016";
  v3[17] = @"6017";
  v4[16] = CTCategoryIdentifierEntertainment;
  v4[17] = CTCategoryIdentifierEducation;
  v3[18] = @"6018";
  v3[19] = @"6020";
  v4[18] = CTCategoryIdentifierReadingAndReference;
  v4[19] = CTCategoryIdentifierHealthAndFitness;
  v3[20] = @"6021";
  v3[21] = @"6022";
  v4[20] = CTCategoryIdentifierReadingAndReference;
  v4[21] = CTCategoryIdentifierReadingAndReference;
  v3[22] = @"6023";
  v3[23] = @"6024";
  v4[22] = CTCategoryIdentifierShoppingAndFood;
  v4[23] = CTCategoryIdentifierShoppingAndFood;
  v3[24] = @"6025";
  v3[25] = @"6026";
  v4[24] = CTCategoryIdentifierGames;
  v4[25] = CTCategoryIdentifierProductivity;
  v3[26] = @"6027";
  v4[26] = CTCategoryIdentifierCreativity;
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  27LL));
  v2 = (void *)qword_10000CE10;
  qword_10000CE10 = v1;
}

void sub_100002034(id a1)
{
  v3[0] = @"12001";
  v3[1] = @"12002";
  v4[0] = CTCategoryIdentifierProductivity;
  v4[1] = CTCategoryIdentifierProductivity;
  v3[2] = @"12003";
  v3[3] = @"12004";
  v4[2] = CTCategoryIdentifierEducation;
  v4[3] = CTCategoryIdentifierEntertainment;
  v3[4] = @"12005";
  v3[5] = @"12006";
  v4[4] = CTCategoryIdentifierProductivity;
  v4[5] = CTCategoryIdentifierGames;
  v3[6] = @"12007";
  v3[7] = @"12008";
  v4[6] = CTCategoryIdentifierHealthAndFitness;
  v4[7] = CTCategoryIdentifierOther;
  v3[8] = @"12010";
  v3[9] = @"12011";
  v4[8] = CTCategoryIdentifierHealthAndFitness;
  v4[9] = CTCategoryIdentifierEntertainment;
  v3[10] = @"12012";
  v3[11] = @"12013";
  v4[10] = CTCategoryIdentifierReadingAndReference;
  v4[11] = CTCategoryIdentifierCreativity;
  v3[12] = @"12014";
  v3[13] = @"12015";
  v4[12] = CTCategoryIdentifierProductivity;
  v4[13] = CTCategoryIdentifierReadingAndReference;
  v3[14] = @"12016";
  v3[15] = @"12017";
  v4[14] = CTCategoryIdentifierSocialNetworking;
  v4[15] = CTCategoryIdentifierEntertainment;
  v3[16] = @"12018";
  v3[17] = @"12019";
  v4[16] = CTCategoryIdentifierTravel;
  v4[17] = CTCategoryIdentifierUtilities;
  v3[18] = @"12020";
  v3[19] = @"12021";
  v4[18] = CTCategoryIdentifierCreativity;
  v4[19] = CTCategoryIdentifierReadingAndReference;
  v3[20] = @"12022";
  v4[20] = CTCategoryIdentifierCreativity;
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  21LL));
  v2 = (void *)qword_10000CE20;
  qword_10000CE20 = v1;
}

void sub_100002310( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100002328(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v22 = 0LL;
  id v4 = [[LSApplicationRecord alloc] initWithBundleIdentifier:v3 allowPlaceholder:1 error:&v22];
  id v5 = v22;
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v4 != 0LL;
  id v6 = v4;
  id v7 = v6;
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL))
  {
    id v21 = v5;
    v20 = (void *)objc_claimAutoreleasedReturnValue([v6 iTunesMetadata]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v20 genreIdentifier]));
    int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 stringValue]);

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) _AppStoreIDToDHIDCategoriesMap]);
    id v11 = (id)objc_claimAutoreleasedReturnValue([v10 objectForKey:v9]);

    id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 counterpartIdentifiers]);
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue( +[CTCategory parentAppBundleIdentifierForAppRecord:]( &OBJC_CLASS___CTCategory,  "parentAppBundleIdentifierForAppRecord:",  v7));
    if (!v11) {
      id v11 = CTCategoryIdentifierOther;
    }
    if (v13)
    {
      v25[0] = v13;
      v25[1] = v3;
      id v14 = (id *)v25;
      uint64_t v15 = 2LL;
    }

    else
    {
      id v24 = v3;
      id v14 = &v24;
      uint64_t v15 = 1LL;
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, v15));
    id v23 = v11;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v23, 1LL));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v18 arrayByAddingObjectsFromArray:v17]);

    if (v12)
    {
      uint64_t v19 = objc_claimAutoreleasedReturnValue([v16 arrayByAddingObjectsFromArray:v12]);

      v16 = (void *)v19;
    }

    id v5 = v21;
    [*(id *)(a1 + 32) setObject:v16 forKey:v3];
  }

  else
  {
    __int16 v13 = 0LL;
    id v12 = 0LL;
    v16 = 0LL;
    id v11 = 0LL;
  }
}

void sub_100002938( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31)
{
}

uint64_t sub_100002980(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100002990(uint64_t a1)
{
}

void sub_100002998(void *a1, void *a2, void *a3, int a4)
{
  id v7 = a2;
  id v8 = a3;
  int v9 = objc_autoreleasePoolPush();
  uint64_t v10 = (os_log_s *)qword_10000CE08;
  if (os_log_type_enabled((os_log_t)qword_10000CE08, OS_LOG_TYPE_INFO))
  {
    id v11 = (void *)a1[4];
    *(_DWORD *)buf = 138478083;
    v52 = v11;
    __int16 v53 = 2112;
    id v54 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "_lookupAppStoreUsing:%{private}@ == %@",  buf,  0x16u);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 allValues]);
  id v13 = [v12 count];

  if (v13)
  {
    v41 = v9;
    int v42 = a4;
    v45 = a1;
    id v43 = v8;
    id v44 = v7;
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v7 allValues]);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 firstObject]);

    __int128 v48 = 0u;
    __int128 v49 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    id v16 = v15;
    id v17 = [v16 countByEnumeratingWithState:&v46 objects:v57 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v47;
      do
      {
        for (i = 0LL; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v47 != v19) {
            objc_enumerationMutation(v16);
          }
          id v21 = *(void **)(*((void *)&v46 + 1) + 8LL * (void)i);
          id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 genreIDs]);
          if ([v22 count])
          {
            id v23 = (void *)objc_claimAutoreleasedReturnValue( +[Categories_Service _AppStoreIDToDHIDCategoriesMap]( &OBJC_CLASS___Categories_Service,  "_AppStoreIDToDHIDCategoriesMap"));
            id v24 = (void *)objc_claimAutoreleasedReturnValue([v22 firstObject]);
            v25 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKey:v24]);

            if (!v25)
            {
              v26 = (void *)objc_claimAutoreleasedReturnValue( +[Categories_Service _macAppStoreIDToDHIDCategoriesMap]( &OBJC_CLASS___Categories_Service,  "_macAppStoreIDToDHIDCategoriesMap"));
              v27 = (void *)objc_claimAutoreleasedReturnValue([v22 firstObject]);
              v25 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKey:v27]);
            }

            v28 = (void *)qword_10000CE08;
            if (os_log_type_enabled((os_log_t)qword_10000CE08, OS_LOG_TYPE_INFO))
            {
              v29 = v28;
              v30 = (void *)objc_claimAutoreleasedReturnValue([v21 bundleID]);
              v31 = (void *)objc_claimAutoreleasedReturnValue([v22 firstObject]);
              *(_DWORD *)buf = 138478339;
              v52 = v30;
              __int16 v53 = 2112;
              id v54 = v31;
              __int16 v55 = 2112;
              v56 = v25;
              _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_INFO,  "itunes.apple.com AppStore category: %{private}@ = %@ -> %@",  buf,  0x20u);
            }

            if (v25)
            {
              v32 = (void *)v45[5];
              v50[0] = v25;
              v33 = (void *)objc_claimAutoreleasedReturnValue([v21 bundleID]);
              v50[1] = v33;
              v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v50,  2LL));
              v35 = (void *)objc_claimAutoreleasedReturnValue([v21 bundleID]);
              [v32 setObject:v34 forKey:v35];
            }
          }
        }

        id v18 = [v16 countByEnumeratingWithState:&v46 objects:v57 count:16];
      }

      while (v18);
    }

    id v8 = v43;
    id v7 = v44;
    a1 = v45;
    a4 = v42;
    int v9 = v41;
  }

  objc_autoreleasePoolPop(v9);
  if (a4)
  {
    uint64_t v36 = objc_claimAutoreleasedReturnValue([v8 objectForKey:@"CTStorePlatformiOS"]);
    uint64_t v37 = *(void *)(a1[7] + 8LL);
    v38 = *(void **)(v37 + 40);
    *(void *)(v37 + 40) = v36;

    v39 = (os_log_s *)qword_10000CE08;
    if (os_log_type_enabled((os_log_t)qword_10000CE08, OS_LOG_TYPE_INFO))
    {
      v40 = *(void **)(*(void *)(a1[7] + 8LL) + 40LL);
      *(_DWORD *)buf = 138412290;
      v52 = v40;
      _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_INFO,  "Done _lookupAppStoreUsing: error = %@",  buf,  0xCu);
    }

    (*(void (**)(void))(a1[6] + 16LL))();
  }
}

void sub_100002DD0(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
  id v6 = a3;
  id v7 = a2;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allKeys]);
  int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v8));
  [v5 minusSet:v9];

  id v10 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count];
  id v11 = *(void (**)(void))(*(void *)(a1 + 40) + 16LL);
  if (v10)
  {
    v11();

    id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) allObjects]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 componentsJoinedByString:@","]);

    id v14 = *(void **)(a1 + 32);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100002F60;
    v17[3] = &unk_1000084D0;
    __int128 v16 = *(_OWORD *)(a1 + 40);
    id v15 = (id)v16;
    __int128 v20 = v16;
    id v18 = *(id *)(a1 + 32);
    id v19 = v13;
    id v7 = v13;
    [v14 lookupAppWithBundleIDs:v7 deviceFamily:1 completionHandler:v17];

    id v6 = (id)v20;
  }

  else
  {
    v11();
  }
}

void sub_100002F60(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
  id v6 = a3;
  id v7 = a2;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allKeys]);
  int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v8));
  [v5 minusSet:v9];

  id v10 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count];
  id v11 = *(void (**)(void))(*(void *)(a1 + 48) + 16LL);
  if (v10)
  {
    v11();

    id v12 = *(void **)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 40);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100003090;
    v14[3] = &unk_1000084A8;
    id v15 = *(id *)(a1 + 48);
    [v12 lookupAppWithBundleIDs:v13 deviceFamily:8 completionHandler:v14];
    id v7 = v15;
  }

  else
  {
    v11();
  }
}

uint64_t sub_100003090(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100003870( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100003880(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

  ;
}

void sub_1000038A0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100003910(uint8_t *a1, uint64_t a2, void *a3)
{
  *(_DWORD *)a1 = 138477827;
  *a3 = a2;
  sub_100003880( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  (uint64_t)a3,  "Could not resolve app from search result record: %{private}@",  a1);
}

void sub_100003950(uint8_t *buf, uint64_t a2, void *a3)
{
  *(_DWORD *)buf = 138477827;
  *a3 = a2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "Successfully resolved search result: %{private}@",  buf,  0xCu);
}

void sub_100003998(uint8_t *a1, uint64_t a2, void *a3)
{
  *(_DWORD *)a1 = 138477827;
  *a3 = a2;
  sub_100003880( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  (uint64_t)a3,  "Corrupt result record: %{private}@",  a1);
}

void sub_1000039D8()
{
}

void sub_100003A40()
{
}

void sub_100003AA8()
{
}

void sub_100003B10()
{
}

void sub_100003B78()
{
}

void sub_100003DBC()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Error getting reachability flags",  v0,  2u);
}

void sub_100003ED0(id a1)
{
  uint64_t v1 = objc_opt_new(&OBJC_CLASS___NSCache);
  uint64_t v2 = (void *)qword_10000CE30;
  qword_10000CE30 = (uint64_t)v1;
}

void sub_100004318(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  id v8 = [*(id *)(a1 + 32) mutableCopy];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_1000044D0;
  v28[3] = &unk_100008558;
  id v10 = *(void **)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  id v29 = v5;
  uint64_t v30 = v9;
  id v11 = v8;
  id v31 = v11;
  id v12 = v7;
  v32 = v12;
  id v20 = v5;
  [v10 enumerateKeysAndObjectsUsingBlock:v28];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_100004688;
  v24[3] = &unk_100008580;
  uint64_t v13 = *(void *)(a1 + 48);
  v25 = v12;
  uint64_t v26 = v13;
  id v14 = v11;
  id v27 = v14;
  id v15 = v12;
  [v20 enumerateKeysAndObjectsUsingBlock:v24];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100004824;
  v21[3] = &unk_1000085A8;
  uint64_t v16 = *(void *)(a1 + 48);
  id v22 = v14;
  uint64_t v23 = v16;
  id v17 = v14;
  [v6 enumerateKeysAndObjectsUsingBlock:v21];
  uint64_t v18 = *(void *)(a1 + 56);
  id v19 = -[NSMutableDictionary copy](v15, "copy");
  (*(void (**)(uint64_t, id, id))(v18 + 16))(v18, v19, v6);
}

void sub_1000044D0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:v5]);
  id v8 = v7;
  if (v7)
  {
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v22;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
          id v14 = [(id)objc_opt_class(*(void *)(a1 + 40)) resultByBundleID];
          id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v13 bundleID]);
          [v15 setObject:v13 forKey:v16];

          id v17 = *(void **)(a1 + 48);
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v13 bundleID]);
          [v17 removeObject:v18];
        }

        id v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }

      while (v10);
    }

    id v19 = (id)objc_claimAutoreleasedReturnValue([v8 arrayByAddingObjectsFromArray:v6]);
  }

  else
  {
    id v19 = [v6 copy];
  }

  id v20 = v19;
  [*(id *)(a1 + 56) setObject:v19 forKeyedSubscript:v5];
}

void sub_100004688(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:v5]);

  if (!v7)
  {
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        id v12 = 0LL;
        do
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)v12);
          id v14 = (void *)objc_opt_class(*(void *)(a1 + 40));
          id v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "resultByBundleID", (void)v19));
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v13 bundleID]);
          [v15 setObject:v13 forKey:v16];

          id v17 = *(void **)(a1 + 48);
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v13 bundleID]);
          [v17 removeObject:v18];

          id v12 = (char *)v12 + 1;
        }

        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }

      while (v10);
    }

    [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v5];
  }
}

void sub_100004824(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:CTErrorKeyHTTPResponse]);

  if ([v7 statusCode] == (id)502 || objc_msgSend(v7, "statusCode") == (id)503)
  {
    uint64_t v18 = v7;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v25 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "iTunes server is overloaded. Caching empty results for: %{public}@",  buf,  0xCu);
    }

    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id v9 = *(id *)(a1 + 32);
    id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v20;
      do
      {
        uint64_t v13 = 0LL;
        do
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8LL * (void)v13);
          id v15 = -[CTAppStoreSearchResult initWithBundleID:platform:]( objc_alloc(&OBJC_CLASS___CTAppStoreSearchResult),  "initWithBundleID:platform:",  v14,  v5);
          id v16 = [(id)objc_opt_class(*(void *)(a1 + 40)) resultByBundleID];
          id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
          [v17 setObject:v15 forKey:v14];

          uint64_t v13 = (char *)v13 + 1;
        }

        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }

      while (v11);
    }

    id v7 = v18;
  }
}

void sub_100004F54( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, char a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, char a39)
{
}

uint64_t sub_100004FCC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100004FDC(uint64_t a1)
{
}

void sub_100004FE4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v20 = 138477827;
    uint64_t v21 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "STORELOOKUP END: %{private}@",  (uint8_t *)&v20,  0xCu);
  }

  id v11 = v8;
  if ([v11 statusCode] == (id)200)
  {
    uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8LL);
    id v13 = v7;
    uint64_t v14 = *(NSMutableDictionary **)(v12 + 40);
    *(void *)(v12 + 40) = v13;
LABEL_8:

    goto LABEL_9;
  }

  id v15 = *(os_log_s **)(*(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL) + 8LL);
  if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    if (v9) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }

  sub_10000540C(a1, v15);
  if (!v9)
  {
LABEL_7:
    uint64_t v14 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v11, CTErrorKeyHTTPResponse);
    -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v7, CTErrorKeyHTTPResponseData);
    id v16 = objc_alloc(&OBJC_CLASS___NSError);
    id v17 = -[NSError initWithDomain:code:userInfo:](v16, "initWithDomain:code:userInfo:", CTErrorDomain, -2001LL, v14);
    uint64_t v18 = *(void *)(*(void *)(a1 + 72) + 8LL);
    __int128 v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;

    goto LABEL_8;
  }

LABEL_9:
  if (!--*(void *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL)) {
    [*(id *)(a1 + 40) handleSearchResultsWithTaskData:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) platform:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) error:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) completionHandler:*(void *)(a1 + 48)];
  }
}

void sub_10000540C(uint64_t a1, os_log_s *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138477827;
  uint64_t v4 = v2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "STORELOOKUP LOOKUP FAILED: %{private}@",  (uint8_t *)&v3,  0xCu);
}

void sub_100005484(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "_lookupAppStoreUsing: NETWORK UNREACHABLE : %@",  (uint8_t *)&v2,  0xCu);
}

id objc_msgSend_performiTunesQueryWithURLComponents_queryItems_deviceFamily_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performiTunesQueryWithURLComponents:queryItems:deviceFamily:completionHandler:");
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}