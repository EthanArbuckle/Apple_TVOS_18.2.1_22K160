@interface NSManagedObject
+ (id)_gkFetchRequest;
+ (id)_gkObjectsFromFetchRequest:(id)a3 withContext:(id)a4;
+ (id)_gkObjectsMatchingPredicate:(id)a3 withContext:(id)a4;
+ (id)_gkRetrieveCleanEntry:(id)a3 request:(id)a4;
- (BOOL)_gkIsExpired:(id)a3;
@end

@implementation NSManagedObject

- (BOOL)_gkIsExpired:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](&OBJC_CLASS___GKPreferences, "shared"));
  unsigned __int8 v5 = [v4 networkManagerIgnoreCache];

  BOOL v6 = 1;
  if (v3 && (v5 & 1) == 0)
  {
    [v3 timeIntervalSinceNow];
    BOOL v6 = v7 <= 0.0;
  }

  return v6;
}

+ (id)_gkFetchRequest
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([a1 fetchRequest]);
  [v2 setIncludesSubentities:1];
  [v2 setIncludesPropertyValues:1];
  [v2 setIncludesPendingChanges:1];
  [v2 setReturnsObjectsAsFaults:0];
  return v2;
}

+ (id)_gkRetrieveCleanEntry:(id)a3 request:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v16 = 0LL;
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v5 executeFetchRequest:v6 error:&v16]);
  id v8 = v16;
  v9 = v8;
  if (v8)
  {
    if (!os_log_GKGeneral) {
      id v10 = (id)GKOSLoggers(v8);
    }
    v11 = (void *)os_log_GKError;
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
      sub_100039914((uint64_t)v9, v11, v6);
    }
    unint64_t v12 = 0LL;
  }

  else
  {
    if ([v7 count] == (id)1) {
      goto LABEL_11;
    }
    unint64_t v12 = 1LL;
  }

  while ((unint64_t)[v7 count] > v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:v12]);
    [v5 deleteObject:v13];

    ++v12;
  }

+ (id)_gkObjectsMatchingPredicate:(id)a3 withContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _gkFetchRequest]);
  [v8 setPredicate:v7];

  v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _gkObjectsFromFetchRequest:v8 withContext:v6]);
  return v9;
}

+ (id)_gkObjectsFromFetchRequest:(id)a3 withContext:(id)a4
{
  id v13 = 0LL;
  v4 = (void *)objc_claimAutoreleasedReturnValue([a4 executeFetchRequest:a3 error:&v13]);
  id v5 = v13;
  id v6 = v5;
  if (v5)
  {
    if (!os_log_GKGeneral) {
      id v7 = (id)GKOSLoggers(v5);
    }
    id v8 = (os_log_s *)os_log_GKError;
    BOOL v9 = os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR);
    if (v9) {
      sub_1000399D0(v8);
    }
    id v10 = (os_log_s *)os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v11 = (id)GKOSLoggers(v9);
      id v10 = (os_log_s *)os_log_GKGeneral;
    }

    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Fetch request error: %@", buf, 0xCu);
    }
  }

  return v4;
}

@end