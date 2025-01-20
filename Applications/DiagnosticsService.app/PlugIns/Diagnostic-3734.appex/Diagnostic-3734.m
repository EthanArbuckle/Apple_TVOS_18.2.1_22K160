BOOL sub_100001F04(id a1, id a2)
{
  id v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  v2 = a2;
  v3 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
  {
    v4 = (unint64_t)[v2 length] < 0x33;
  }

  else
  {
    v5 = objc_opt_class(&OBJC_CLASS___NSNumber);
    v4 = (objc_opt_isKindOfClass(v2, v5) & 1) == 0 || (uint64_t)[v2 integerValue] > 0;
  }

  return v4;
}

BOOL sub_100002068(id a1, id a2)
{
  return (unint64_t)[a2 length] < 0x65;
}

void sub_1000024DC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, id location)
{
}

id sub_100002514(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  id v5 = [WeakRetained isCancelled];

  if ((v5 & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v3 type]);
    unsigned int v7 = [v6 isEqualToString:@"109"];

    if (v7) {
      unsigned __int8 v8 = [v3 BOOLFromFieldAtIndex:7];
    }
    else {
      unsigned __int8 v8 = 0;
    }
    id v9 = objc_loadWeakRetained(a1 + 7);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleID]);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue([v9 userFriendlyAppNameForBundleID:v10]);

    if (v11 && (v8 & 1) == 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue([a1[4] objectForKeyedSubscript:v11]);
      v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v12 intValue] + 1));
      [a1[4] setObject:v13 forKeyedSubscript:v11];
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue([v3 fields]);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 componentsJoinedByString:@" "]);

    v16 = (void *)objc_claimAutoreleasedReturnValue([v3 type]);
    if ([v16 isEqualToString:@"210"])
    {
      unsigned __int8 v17 = [a1[5] containsObject:v15];

      if ((v17 & 1) == 0)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleID]);

        if (v18)
        {
          if (!v11) {
            goto LABEL_16;
          }
        }

        else
        {

          v11 = @"System Process";
        }

        v19 = (void *)objc_claimAutoreleasedReturnValue([a1[6] objectForKeyedSubscript:v11]);
        v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v19 intValue] + 1));
        [a1[6] setObject:v20 forKeyedSubscript:v11];

        [a1[5] addObject:v15];
      }
    }

    else
    {
    }

LABEL_16:
  }

  return v5;
}

void sub_100002738(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  v6 = v5;
  if (*(double *)(a1 + 48) == 0.0)
  {
    int v7 = 0;
  }

  else
  {
    [v5 doubleValue];
    int v7 = (int)(v8 / *(double *)(a1 + 48));
  }

  int v9 = [v6 intValue];
  v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) inputs]);
  if (v9 <= (int)[v10 minCrashesToConsider])
  {
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) inputs]);
    signed int v12 = [v11 avgCrashesToConsider];

    if (v7 > v12) {
      [*(id *)(a1 + 40) addObject:v13];
    }
  }
}

void sub_100002A40(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Bundle record not found for ID %@: %@",  (uint8_t *)&v3,  0x16u);
}

id objc_msgSend_whitelist(void *a1, const char *a2, ...)
{
  return [a1 whitelist];
}