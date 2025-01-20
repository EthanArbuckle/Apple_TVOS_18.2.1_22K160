@interface PLCSTDataCollectionMaintenanceTask
- (BOOL)runTaskWithTransaction:(id)a3;
- (id)generateUuidSelection;
- (id)randomIndexForSampleSize:(unint64_t)a3;
@end

@implementation PLCSTDataCollectionMaintenanceTask

- (BOOL)runTaskWithTransaction:(id)a3
{
  return 1;
}

- (id)generateUuidSelection
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_1000120FC;
  v11 = sub_10001210C;
  id v12 = 0LL;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PLMaintenanceTask photoLibrary](self, "photoLibrary"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100012114;
  v6[3] = &unk_1000212F0;
  v6[4] = self;
  v6[5] = &v7;
  [v3 performTransactionAndWait:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)randomIndexForSampleSize:(unint64_t)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableIndexSet);
  v6 = v4;
  if (a3 - 1 > 9)
  {
    if (a3 < 0xB)
    {
      uint64_t Log = PLBackendGetLog(v4, v5);
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Crowd Sourced Themes Stream Collection: SampleSize is set to 0. Skipping randomIndexing",  v10,  2u);
      }
    }

    else
    {
      do
        -[NSMutableIndexSet addIndex:](v6, "addIndex:", arc4random_uniform(a3));
      while ((unint64_t)-[NSMutableIndexSet count](v6, "count") < 0xA);
    }
  }

  else
  {
    -[NSMutableIndexSet addIndexesInRange:](v4, "addIndexesInRange:", 0LL, a3);
  }

  return v6;
}

@end