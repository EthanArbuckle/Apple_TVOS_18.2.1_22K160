@interface _CPLCloudKitDownloadGroup
- (BOOL)addDownloadTask:(id)a3;
- (BOOL)cancelDownloadTask:(id)a3;
- (BOOL)hasDownloadTasks;
- (BOOL)isHighPriority;
- (BOOL)shouldBoostPriority;
- (CPLFingerprintContext)fingerprintContext;
- (NSArray)allSourceBundleIdentifiers;
- (NSArray)recordScopedIdentifiers;
- (NSString)defaultSourceBundleIdentifier;
- (NSString)mainSourceBundleIdentifier;
- (NSString)resourceTypeDescription;
- (_CPLCloudKitDownloadGroup)initWithResourceType:(unint64_t)a3 defaultSourceBundleIdentifier:(id)a4 fingerprintContext:(id)a5;
- (double)downloadProgress;
- (id)cloudResourceForRecordWithScopedIdentifier:(id)a3;
- (id)description;
- (id)propertyKeys;
- (unint64_t)countOfDownloadTasks;
- (unint64_t)downloadSize;
- (unint64_t)resourceType;
- (void)allDownloadsDidFailWithError:(id)a3;
- (void)allDownloadsDidStartWithOperationID:(id)a3;
- (void)enumerateRecordScopedIdentifiersAndTasksWithBlock:(id)a3;
- (void)resourceWithRecordScopedIdentifier:(id)a3 didDownloadCKAsset:(id)a4 withOperationType:(int64_t)a5 transcoderVersion:(int64_t)a6 withFingerPrint:(id)a7 andFileUTI:(id)a8;
- (void)resourceWithRecordScopedIdentifier:(id)a3 didFailToDownloadWithError:(id)a4;
- (void)resourceWithRecordScopedIdentifier:(id)a3 didProgress:(double)a4;
- (void)resourceWithRecordScopedIdentifierDidStart:(id)a3 operationID:(id)a4;
@end

@implementation _CPLCloudKitDownloadGroup

- (_CPLCloudKitDownloadGroup)initWithResourceType:(unint64_t)a3 defaultSourceBundleIdentifier:(id)a4 fingerprintContext:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS____CPLCloudKitDownloadGroup;
  v10 = -[_CPLCloudKitDownloadGroup init](&v22, "init");
  if (v10)
  {
    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    tasks = v10->_tasks;
    v10->_tasks = v11;

    v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    resourceSizes = v10->_resourceSizes;
    v10->_resourceSizes = v13;

    v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    downloadedSizes = v10->_downloadedSizes;
    v10->_downloadedSizes = v15;

    v17 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    sourceBundleIdentifiers = v10->_sourceBundleIdentifiers;
    v10->_sourceBundleIdentifiers = v17;

    v10->_resourceType = a3;
    v19 = (NSString *)[v8 copy];
    defaultSourceBundleIdentifier = v10->_defaultSourceBundleIdentifier;
    v10->_defaultSourceBundleIdentifier = v19;

    objc_storeStrong((id *)&v10->_fingerprintContext, a5);
    v10->_maxDownloadSize = (unint64_t)+[CPLEngineResourceDownloadTask maximumResourceDownloadSizeForResourceType:]( &OBJC_CLASS___CPLEngineResourceDownloadTask,  "maximumResourceDownloadSizeForResourceType:",  v10->_resourceType);
  }

  return v10;
}

- (BOOL)addDownloadTask:(id)a3
{
  id v5 = a3;
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 cloudResource]);
  if (!v6) {
    sub_1001964F8(v5, (uint64_t)a2, (uint64_t)self);
  }
  v7 = (void *)v6;
  if (+[CPLCloudKitFakeDynamicDerivatives realResourceTypeForResource:]( &OBJC_CLASS___CPLCloudKitFakeDynamicDerivatives,  "realResourceTypeForResource:",  v6) == self->_resourceType)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 itemScopedIdentifier]);
    id v9 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_tasks,  "objectForKeyedSubscript:",  v8));
    if (v9)
    {
      v10 = v9;
      -[NSMutableArray addObject:](v9, "addObject:", v5);
    }

    else
    {
      id v12 = [v7 estimatedResourceSize];
      id v13 = v12;
      unint64_t downloadSize = self->_downloadSize;
      unint64_t maxDownloadSize = self->_maxDownloadSize;
      BOOL v16 = maxDownloadSize > downloadSize;
      unint64_t v17 = maxDownloadSize - downloadSize;
      if ((!v16 || v17 < (unint64_t)v12) && -[NSMutableDictionary count](self->_tasks, "count"))
      {
        BOOL v11 = 0;
LABEL_23:

        goto LABEL_24;
      }

      v10 = -[NSMutableArray initWithObjects:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithObjects:", v5, 0LL);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tasks, "setObject:forKeyedSubscript:", v10, v8);
      v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v13));
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_resourceSizes, "setObject:forKeyedSubscript:", v18, v8);

      self->_downloadSize += (unint64_t)v13;
    }

    v19 = (NSString *)objc_claimAutoreleasedReturnValue([v5 clientBundleID]);
    if (!v19) {
      v19 = self->_defaultSourceBundleIdentifier;
    }
    if (!self->_mainBundleIdentifierIsDefault)
    {
      if (-[NSString isEqualToString:](v19, "isEqualToString:", self->_defaultSourceBundleIdentifier))
      {
        objc_storeStrong((id *)&self->_mainSourceBundleIdentifier, self->_defaultSourceBundleIdentifier);
        self->_mainBundleIdentifierIsDefault = 1;
      }

      else if (!self->_mainSourceBundleIdentifier)
      {
        objc_storeStrong((id *)&self->_mainSourceBundleIdentifier, v19);
      }
    }

    -[NSMutableSet addObject:](self->_sourceBundleIdentifiers, "addObject:", v19);
    if (self->_highPriority) {
      unsigned __int8 v20 = 1;
    }
    else {
      unsigned __int8 v20 = [v5 isHighPriority];
    }
    self->_highPriority = v20;

    BOOL v11 = 1;
    goto LABEL_23;
  }

  BOOL v11 = 0;
LABEL_24:

  return v11;
}

- (void)allDownloadsDidStartWithOperationID:(id)a3
{
  id v4 = a3;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v5 = self->_tasks;
  id v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[_CPLCloudKitDownloadGroup resourceWithRecordScopedIdentifierDidStart:operationID:]( self,  "resourceWithRecordScopedIdentifierDidStart:operationID:",  *(void *)(*((void *)&v10 + 1) + 8LL * (void)v9),  v4,  (void)v10);
        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v7);
  }
}

- (void)resourceWithRecordScopedIdentifierDidStart:(id)a3 operationID:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_tasks, "objectForKeyedSubscript:", a3));
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        __int128 v12 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        [v12 setTransportIdentifier:v6];
        uint64_t v13 = objc_claimAutoreleasedReturnValue([v12 didStartHandler]);
        v14 = (void *)v13;
        if (v13) {
          (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v12);
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v9);
  }
}

- (void)resourceWithRecordScopedIdentifier:(id)a3 didProgress:(double)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_tasks, "objectForKeyedSubscript:", v6));
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        uint64_t v14 = objc_claimAutoreleasedReturnValue([v13 progressHandler]);
        __int128 v15 = (void *)v14;
        if (v14)
        {
          float v11 = a4;
          (*(void (**)(uint64_t, void *, float))(v14 + 16))(v14, v13, v11);
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v9);
  }

  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_resourceSizes, "objectForKeyedSubscript:", v6));
  [v16 doubleValue];
  if ((unint64_t)(v17 * a4))
  {
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_downloadedSizes, "setObject:forKeyedSubscript:", v18, v6);
  }

  else
  {
    -[NSMutableDictionary removeObjectForKey:](self->_downloadedSizes, "removeObjectForKey:", v6);
  }
}

- (void)resourceWithRecordScopedIdentifier:(id)a3 didDownloadCKAsset:(id)a4 withOperationType:(int64_t)a5 transcoderVersion:(int64_t)a6 withFingerPrint:(id)a7 andFileUTI:(id)a8
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  id v15 = a8;
  v78 = v14;
  if (v14)
  {
    v82 = (void *)objc_claimAutoreleasedReturnValue([v13 fileURL]);
    if (v82)
    {
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_tasks, "objectForKeyedSubscript:", v12));
      v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      v84 = (void *)objc_claimAutoreleasedReturnValue([v16 lastObject]);
      __int128 v91 = 0u;
      __int128 v92 = 0u;
      __int128 v93 = 0u;
      __int128 v94 = 0u;
      id v17 = v16;
      id v86 = [v17 countByEnumeratingWithState:&v91 objects:v103 count:16];
      if (v86)
      {
        v79 = self;
        v74 = v13;
        id v73 = v12;
        char v76 = 0;
        uint64_t v85 = *(void *)v92;
        __int128 v18 = &OBJC_METACLASS___CPLCloudKitComputeStateEncryptionHelper;
        id v77 = v15;
        __int128 v19 = v82;
        id v83 = v17;
        while (1)
        {
          for (i = 0LL; i != v86; i = (char *)i + 1)
          {
            if (*(void *)v92 != v85) {
              objc_enumerationMutation(v17);
            }
            __int128 v21 = *(void **)(*((void *)&v91 + 1) + 8LL * (void)i);
            __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 cloudResource]);
            v23 = (void *)objc_claimAutoreleasedReturnValue([v22 identity]);
            v24 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([v21 completionHandler]);
            v25 = (void *)objc_claimAutoreleasedReturnValue([v23 fileURL]);
            if (!v25)
            {
              uint64_t v28 = objc_claimAutoreleasedReturnValue( +[CPLErrors incorrectParametersErrorForParameter:]( &OBJC_CLASS___CPLErrors,  "incorrectParametersErrorForParameter:",  @"fileURL"));
              ((void (**)(void, void *, uint64_t))v24)[2](v24, v21, v28);
              goto LABEL_49;
            }

            if ([&v18[30] isFakeDerivative:v22])
            {
              id v90 = 0LL;
              unsigned int v26 = [&v18[30] transformFromURL:v19 fileType:v15 toTargetURL:v25 matchingResource:v22 error:&v90];
              id v27 = v90;
              uint64_t v28 = (uint64_t)v27;
              if (v26) {
                id v29 = 0LL;
              }
              else {
                id v29 = v27;
              }
              ((void (**)(void, void *, id))v24)[2](v24, v21, v29);
              if (v21 == v84)
              {
                [v81 removeItemAtURL:v19 error:0];
                char v76 = 1;
              }

              goto LABEL_23;
            }

            if ((CPLCloudKitUseGateKeeperForOperationType(a5) & 1) == 0)
            {
              uint64_t v28 = (uint64_t)(id)objc_claimAutoreleasedReturnValue([v23 fingerPrint]);
              id v30 = v78;
              else {
                v31 = v30;
              }

              id v32 = v31;
              if (v32)
              {
LABEL_22:
                v33 = (void *)objc_claimAutoreleasedReturnValue(-[_CPLCloudKitDownloadGroup resourceTypeDescription](v79, "resourceTypeDescription"));
                v34 = (void *)objc_claimAutoreleasedReturnValue( +[CPLErrors cplErrorWithCode:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:description:",  27LL,  @"Resource %@ in the cloud is stale (fingerprint is %@ vs. expected %@)",  v33,  v32,  v28));
                ((void (**)(void, void *, void *))v24)[2](v24, v21, v34);

                id v15 = v77;
                __int128 v19 = v82;
LABEL_23:
                id v17 = v83;
                goto LABEL_49;
              }

              fingerprintContext = v79->_fingerprintContext;
              v36 = (void *)objc_claimAutoreleasedReturnValue([v74 signature]);
              v37 = (void *)objc_claimAutoreleasedReturnValue( -[CPLFingerprintContext fingerprintSchemeForSignature:]( fingerprintContext,  "fingerprintSchemeForSignature:",  v36));
              unsigned int v38 = [v37 canMatchSignatureToFingerprint];

              if (v38)
              {
                uint64_t v39 = objc_claimAutoreleasedReturnValue([v74 cplFingerPrint]);
                id v40 = (id)v28;
                v41 = v40;
                if (v28 && v39)
                {
                  unsigned __int8 v42 = [v40 isEqual:v39];

                  v43 = (void *)v39;
                  if ((v42 & 1) == 0) {
                    goto LABEL_31;
                  }
LABEL_30:
                  v43 = 0LL;
                }

                else
                {

                  v43 = (void *)v39;
                  if (!(v28 | v39)) {
                    goto LABEL_30;
                  }
                }

- (void)resourceWithRecordScopedIdentifier:(id)a3 didFailToDownloadWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_tasks, "objectForKeyedSubscript:", v6));
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        id v14 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([v13 completionHandler]);
        ((void (**)(void, void *, id))v14)[2](v14, v13, v7);
      }

      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v10);
  }

  -[NSMutableDictionary removeObjectForKey:](self->_tasks, "removeObjectForKey:", v6);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_resourceSizes, "objectForKeyedSubscript:", v6));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_downloadedSizes, "setObject:forKeyedSubscript:", v15, v6);
}

- (void)allDownloadsDidFailWithError:(id)a3
{
  id v4 = a3;
  tasks = self->_tasks;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10008904C;
  v7[3] = &unk_100241AB0;
  id v8 = v4;
  id v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](tasks, "enumerateKeysAndObjectsUsingBlock:", v7);
  -[NSMutableDictionary removeAllObjects](self->_tasks, "removeAllObjects");
}

- (BOOL)cancelDownloadTask:(id)a3
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 cloudResource]);
  if (!v6) {
    sub_100196608(v5, (uint64_t)a2, (uint64_t)self);
  }
  id v7 = v6;
  if ([v6 resourceType] == (id)self->_resourceType)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 itemScopedIdentifier]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_tasks, "objectForKeyedSubscript:", v8));
    unsigned int v10 = [v9 containsObject:v5];
    if (v10)
    {
      uint64_t v11 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([v5 completionHandler]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[CPLErrors operationCancelledError](&OBJC_CLASS___CPLErrors, "operationCancelledError"));
      ((void (**)(void, id, void *))v11)[2](v11, v5, v12);

      if ([v9 count] == (id)1) {
        -[NSMutableDictionary removeObjectForKey:](self->_tasks, "removeObjectForKey:", v8);
      }
      else {
        [v9 removeObject:v5];
      }
    }
  }

  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (BOOL)hasDownloadTasks
{
  return -[NSMutableDictionary count](self->_tasks, "count") != 0LL;
}

- (unint64_t)countOfDownloadTasks
{
  return (unint64_t)-[NSMutableDictionary count](self->_tasks, "count");
}

- (NSArray)allSourceBundleIdentifiers
{
  return (NSArray *)-[NSMutableSet allObjects](self->_sourceBundleIdentifiers, "allObjects");
}

- (double)downloadProgress
{
  if (!self->_downloadSize) {
    return 0.0;
  }
  uint64_t v7 = 0LL;
  id v8 = (double *)&v7;
  uint64_t v9 = 0x2020000000LL;
  uint64_t v10 = 0LL;
  downloadedSizes = self->_downloadedSizes;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100089384;
  v6[3] = &unk_100241AD8;
  v6[4] = &v7;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](downloadedSizes, "enumerateKeysAndObjectsUsingBlock:", v6);
  double v4 = v8[3] / (double)self->_downloadSize;
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)shouldBoostPriority
{
  if (self->_highPriority) {
    return +[CPLResource hasPriorityBoostForResourceType:]( &OBJC_CLASS___CPLResource,  "hasPriorityBoostForResourceType:",  self->_resourceType);
  }
  else {
    return 0;
  }
}

- (NSArray)recordScopedIdentifiers
{
  return (NSArray *)-[NSMutableDictionary allKeys](self->_tasks, "allKeys");
}

- (void)enumerateRecordScopedIdentifiersAndTasksWithBlock:(id)a3
{
  id v4 = a3;
  tasks = self->_tasks;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100089464;
  v7[3] = &unk_100241B00;
  id v8 = v4;
  id v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](tasks, "enumerateKeysAndObjectsUsingBlock:", v7);
}

- (id)cloudResourceForRecordWithScopedIdentifier:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_tasks, "objectForKeyedSubscript:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 firstObject]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 cloudResource]);

  return v5;
}

- (id)propertyKeys
{
  return sub_1000896D4((uint64_t)&OBJC_CLASS___CPLCloudKitResourceKeys, self->_resourceType);
}

- (NSString)resourceTypeDescription
{
  return (NSString *)+[CPLResource shortDescriptionForResourceType:]( &OBJC_CLASS___CPLResource,  "shortDescriptionForResourceType:",  self->_resourceType);
}

- (id)description
{
  uint64_t v3 = objc_opt_class(self);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[_CPLCloudKitDownloadGroup resourceTypeDescription](self, "resourceTypeDescription"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSByteCountFormatter stringFromByteCount:countStyle:]( &OBJC_CLASS___NSByteCountFormatter,  "stringFromByteCount:countStyle:",  self->_downloadSize,  3LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_tasks, "allKeys"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "componentsJoinedByString:", @", "));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ %@ %@ %@>",  v3,  v4,  v5,  v7));

  return v8;
}

- (unint64_t)resourceType
{
  return self->_resourceType;
}

- (NSString)defaultSourceBundleIdentifier
{
  return self->_defaultSourceBundleIdentifier;
}

- (CPLFingerprintContext)fingerprintContext
{
  return self->_fingerprintContext;
}

- (unint64_t)downloadSize
{
  return self->_downloadSize;
}

- (BOOL)isHighPriority
{
  return self->_highPriority;
}

- (NSString)mainSourceBundleIdentifier
{
  return self->_mainSourceBundleIdentifier;
}

- (void).cxx_destruct
{
}

@end