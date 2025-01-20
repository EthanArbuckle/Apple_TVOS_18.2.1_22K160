@interface InAppReceiptDatabaseShared
+ (id)databasePathsForBundleID:(id)a3 error:(id *)a4;
@end

@implementation InAppReceiptDatabaseShared

+ (id)databasePathsForBundleID:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v18 = 0LL;
  id v6 = [[LSApplicationRecord alloc] initWithBundleIdentifier:v5 allowPlaceholder:0 error:&v18];

  id v7 = v18;
  v8 = v7;
  if (v7)
  {
    v9 = 0LL;
    if (a4) {
      *a4 = v7;
    }
  }

  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 dataContainerURL]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 path]);

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue([v11 stringByAppendingPathComponent:@"/Library/Caches/StoreKit/"]);
      v13 = (void *)objc_claimAutoreleasedReturnValue([v12 stringByAppendingPathComponent:@"receipts.db"]);
      v19[0] = v13;
      v14 = (void *)objc_claimAutoreleasedReturnValue([v12 stringByAppendingPathComponent:@"receipts.db-shm"]);
      v19[1] = v14;
      v15 = (void *)objc_claimAutoreleasedReturnValue([v12 stringByAppendingPathComponent:@"receipts.db-wal"]);
      v19[2] = v15;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v19, 3LL));
    }

    else if (a4)
    {
      uint64_t v16 = ASDErrorWithTitleAndMessage( ASDErrorDomain,  950LL,  @"No data container found for app",  &stru_1002FBA48);
      v9 = 0LL;
      *a4 = (id)objc_claimAutoreleasedReturnValue(v16);
    }

    else
    {
      v9 = 0LL;
    }
  }

  return v9;
}

@end