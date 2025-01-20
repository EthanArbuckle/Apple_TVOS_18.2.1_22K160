@interface CPLCloudKitUploadOperationContext
- (id)extendedStatusDescriptionStrings;
- (id)recordForRecordID:(id)a3;
- (void)addRecord:(id)a3 forRecordID:(id)a4 ignoreResources:(BOOL)a5;
- (void)recordCompletionForRecordID:(id)a3 withError:(id)a4;
- (void)updateProgress:(double)a3 forRecordID:(id)a4;
@end

@implementation CPLCloudKitUploadOperationContext

- (void)addRecord:(id)a3 forRecordID:(id)a4 ignoreResources:(BOOL)a5
{
  BOOL v5 = a5;
  id v17 = a3;
  id v8 = a4;
  recordIDToProgressMap = self->_recordIDToProgressMap;
  if (!recordIDToProgressMap)
  {
    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v11 = self->_recordIDToProgressMap;
    self->_recordIDToProgressMap = v10;

    v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    recordIDToCPLRecordMap = self->_recordIDToCPLRecordMap;
    self->_recordIDToCPLRecordMap = v12;

    recordIDToProgressMap = self->_recordIDToProgressMap;
  }

  -[NSMutableDictionary setObject:forKey:](recordIDToProgressMap, "setObject:forKey:", &off_10025A050, v8);
  -[NSMutableDictionary setObject:forKey:](self->_recordIDToCPLRecordMap, "setObject:forKey:", v17, v8);
  if (v5)
  {
    ignoreResourcesForRecordIDs = self->_ignoreResourcesForRecordIDs;
    if (!ignoreResourcesForRecordIDs)
    {
      v15 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      v16 = self->_ignoreResourcesForRecordIDs;
      self->_ignoreResourcesForRecordIDs = v15;

      ignoreResourcesForRecordIDs = self->_ignoreResourcesForRecordIDs;
    }

    -[NSMutableSet addObject:](ignoreResourcesForRecordIDs, "addObject:", v8);
  }
}

- (void)updateProgress:(double)a3 forRecordID:(id)a4
{
  id v8 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_recordIDToProgressMap, "objectForKey:"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", (uint64_t)(a3 * 100.0)));
    -[NSMutableDictionary setObject:forKey:](self->_recordIDToProgressMap, "setObject:forKey:", v7, v8);
  }
}

- (void)recordCompletionForRecordID:(id)a3 withError:(id)a4
{
  id v8 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_recordIDToProgressMap, "objectForKey:"));

  if (v6)
  {
    if (a4) {
      v7 = &off_10025A068;
    }
    else {
      v7 = &off_10025A080;
    }
    -[NSMutableDictionary setObject:forKey:](self->_recordIDToProgressMap, "setObject:forKey:", v7, v8);
  }
}

- (id)recordForRecordID:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->_recordIDToCPLRecordMap, "objectForKey:", a3);
}

- (id)extendedStatusDescriptionStrings
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v4 = -[NSMutableDictionary count](self->_recordIDToProgressMap, "count");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned __int8 v6 = [v5 BOOLForKey:@"CPLUseCompactCloudKitStatus"];

  if (v4)
  {
    uint64_t v34 = 0LL;
    v35 = &v34;
    uint64_t v36 = 0x2020000000LL;
    uint64_t v37 = 0LL;
    uint64_t v30 = 0LL;
    v31 = &v30;
    uint64_t v32 = 0x2020000000LL;
    uint64_t v33 = 0LL;
    uint64_t v26 = 0LL;
    v27 = &v26;
    uint64_t v28 = 0x2020000000LL;
    uint64_t v29 = 0LL;
    recordIDToProgressMap = self->_recordIDToProgressMap;
    v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472LL;
    v18 = sub_1000402E8;
    v19 = &unk_10023F960;
    v20 = self;
    v22 = &v26;
    char v25 = v6 ^ 1;
    id v8 = v3;
    v21 = v8;
    v23 = &v30;
    v24 = &v34;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( recordIDToProgressMap,  "enumerateKeysAndObjectsUsingBlock:",  &v16);
    if ((v6 & 1) != 0 || (unint64_t)v31[3] >= 2)
    {
      v9 = objc_alloc(&OBJC_CLASS___NSString);
      uint64_t v10 = v31[3];
      v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSByteCountFormatter stringFromByteCount:countStyle:]( &OBJC_CLASS___NSByteCountFormatter,  "stringFromByteCount:countStyle:",  v35[3],  3LL));
      v12 = -[NSString initWithFormat:]( v9,  "initWithFormat:",  @"\tTotal for %lu resources in operation: %@",  v10,  v11,  v16,  v17,  v18,  v19,  v20);

      -[NSMutableArray addObject:](v8, "addObject:", v12);
    }

    if (v27[3])
    {
      v13 = objc_alloc(&OBJC_CLASS___NSString);
      v14 = -[NSString initWithFormat:](v13, "initWithFormat:", @"\t\t%lu records uploaded", v27[3]);
      -[NSMutableArray addObject:](v8, "addObject:", v14);
    }

    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(&v34, 8);
  }

  return v3;
}

- (void).cxx_destruct
{
}

@end