@interface FPFootprint
- (id)ioAccelMemoryInfoDetailsAtAddress:(unint64_t)a3 for:(int)a4 error:(id *)a5;
- (id)ioSurfaceExtendedInfoDetailsAtAddress:(unint64_t)a3 for:(int)a4;
- (void)dealloc;
@end

@implementation FPFootprint

- (void)dealloc
{
  memoryObjects = self->_memoryObjects;
  if (memoryObjects) {
    CFRelease(memoryObjects);
  }
  sharedCacheMemoryObjectsTable = self->_sharedCacheMemoryObjectsTable;
  self->_sharedCacheMemoryObjectsTable = 0LL;

  textMemoryObjects = self->_textMemoryObjects;
  if (textMemoryObjects) {
    CFRelease(textMemoryObjects);
  }
  linkeditMemoryObjects = self->_linkeditMemoryObjects;
  if (linkeditMemoryObjects) {
    CFRelease(linkeditMemoryObjects);
  }
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___FPFootprint;
  -[FPFootprint dealloc](&v7, "dealloc");
}

- (id)ioSurfaceExtendedInfoDetailsAtAddress:(unint64_t)a3 for:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  p_allPIDsIOSurfaceDescriptionsLock = &self->_allPIDsIOSurfaceDescriptionsLock;
  os_unfair_lock_lock(&self->_allPIDsIOSurfaceDescriptionsLock);
  allPIDsIOSurfaceDescriptions = self->_allPIDsIOSurfaceDescriptions;
  if (!allPIDsIOSurfaceDescriptions)
  {
    v9 = (NSDictionary *)objc_claimAutoreleasedReturnValue( +[IOSurfaceDebugDescription surfaceDescriptions]( &OBJC_CLASS___IOSurfaceDebugDescription,  "surfaceDescriptions"));
    v10 = self->_allPIDsIOSurfaceDescriptions;
    self->_allPIDsIOSurfaceDescriptions = v9;

    allPIDsIOSurfaceDescriptions = self->_allPIDsIOSurfaceDescriptions;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v4));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](allPIDsIOSurfaceDescriptions, "objectForKey:", v11));

  os_unfair_lock_unlock(p_allPIDsIOSurfaceDescriptionsLock);
  if (v12)
  {
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_1000151BC;
    v25[3] = &unk_100029D60;
    v25[4] = a3;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", v25));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v12 filteredArrayUsingPredicate:v13]);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 firstObject]);

    if (v15)
    {
      v26[0] = @"surfaceID";
      v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v15 surfaceID]));
      v27[0] = v16;
      v26[1] = @"PixelFormat";
      v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v15 pixelFormat]));
      v27[1] = v17;
      v26[2] = @"Width";
      v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v15 width]));
      v27[2] = v18;
      v26[3] = @"Height";
      v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v15 height]));
      v27[3] = v19;
      v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v27,  v26,  4LL));
      id v21 = [v20 mutableCopy];

      v22 = (void *)objc_claimAutoreleasedReturnValue([v15 name]);
      if (v22)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue([v15 name]);
        [v21 setObject:v23 forKey:@"Name"];
      }
    }

    else
    {
      id v21 = 0LL;
    }
  }

  else
  {
    id v21 = 0LL;
  }

  return v21;
}

- (id)ioAccelMemoryInfoDetailsAtAddress:(unint64_t)a3 for:(int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  objc_opt_self(&OBJC_CLASS___FPFootprint);
  if (!objc_opt_class(&OBJC_CLASS___IOAccelMemoryInfo)) {
    return 0LL;
  }
  os_unfair_lock_lock(&self->_allPIDsIOAccelMemoryInfosLock);
  if (!self->_allPIDsIOAccelMemoryInfos)
  {
    uint64_t v59 = 0LL;
    v60 = &v59;
    uint64_t v61 = 0x3032000000LL;
    v62 = sub_100015874;
    v63 = sub_100015884;
    id v64 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    uint64_t v55 = 0LL;
    v56 = &v55;
    uint64_t v57 = 0x2020000000LL;
    char v58 = 0;
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0LL);
    dispatch_queue_attr_t v10 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v10);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.footprint.ioaccelmemoryinfo", v11);

    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472LL;
    v51[2] = sub_10001588C;
    v51[3] = &unk_100029DC0;
    v53 = &v55;
    v54 = &v59;
    v13 = v9;
    v52 = v13;
    +[IOAccelMemoryInfo collectDataWithCompletionQueue:completionBlock:]( &OBJC_CLASS___IOAccelMemoryInfo,  "collectDataWithCompletionQueue:completionBlock:",  v12,  v51);
    dispatch_time_t v14 = dispatch_time(0LL, 60000000000LL);
    dispatch_semaphore_wait(v13, v14);
    if (a5 && !*((_BYTE *)v56 + 24) && !*a5)
    {
      NSErrorUserInfoKey v67 = NSLocalizedDescriptionKey;
      v68 = @"Timed out waiting to fetch IOAccelMemory region infos";
      v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v68,  &v67,  1LL));
      *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"FootprintErrorDomain",  1LL,  v15));
    }

    v16 = (NSDictionary *)[(id)v60[5] copy];
    allPIDsIOAccelMemoryInfos = self->_allPIDsIOAccelMemoryInfos;
    self->_allPIDsIOAccelMemoryInfos = v16;

    _Block_object_dispose(&v55, 8);
    _Block_object_dispose(&v59, 8);
  }

  os_unfair_lock_unlock(&self->_allPIDsIOAccelMemoryInfosLock);
  v18 = self->_allPIDsIOAccelMemoryInfos;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v6));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v18, "objectForKeyedSubscript:", v19));

  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  id v21 = v20;
  id v22 = [v21 countByEnumeratingWithState:&v47 objects:v66 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v48;
    while (2)
    {
      for (i = 0LL; i != v22; i = (char *)i + 1)
      {
        if (*(void *)v48 != v23) {
          objc_enumerationMutation(v21);
        }
        v25 = *(void **)(*((void *)&v47 + 1) + 8LL * (void)i);
        v26 = (void *)objc_claimAutoreleasedReturnValue([v25 mappings]);
        __int128 v45 = 0u;
        __int128 v46 = 0u;
        __int128 v43 = 0u;
        __int128 v44 = 0u;
        id v27 = v26;
        id v28 = [v27 countByEnumeratingWithState:&v43 objects:v65 count:16];
        if (v28)
        {
          uint64_t v29 = *(void *)v44;
LABEL_15:
          uint64_t v30 = 0LL;
          while (1)
          {
            if (*(void *)v44 != v29) {
              objc_enumerationMutation(v27);
            }
            if ([*(id *)(*((void *)&v43 + 1) + 8 * v30) address] == (id)a3) {
              break;
            }
            if (v28 == (id)++v30)
            {
              id v28 = [v27 countByEnumeratingWithState:&v43 objects:v65 count:16];
              if (v28) {
                goto LABEL_15;
              }
              goto LABEL_21;
            }
          }

          id v31 = v25;

          if (!v31) {
            continue;
          }

          v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
          v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v31 surfaceID]));
          [v32 setObject:v34 forKeyedSubscript:@"SurfaceID"];

          v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v31 length]));
          [v32 setObject:v35 forKeyedSubscript:@"Size"];

          v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v31 dirtyLength]));
          [v32 setObject:v36 forKeyedSubscript:@"DirtySize"];

          v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v31 residentLength]));
          [v32 setObject:v37 forKeyedSubscript:@"ResidentSize"];

          v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v31 wired]));
          [v32 setObject:v38 forKeyedSubscript:@"IsWired"];

          v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v31 purgeable]));
          [v32 setObject:v39 forKeyedSubscript:@"IsPurgeable"];

          v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v31 cachedCopy]));
          [v32 setObject:v40 forKeyedSubscript:@"CachedCopy"];

          v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v31 memoryPool]));
          [v32 setObject:v41 forKeyedSubscript:@"MemoryPool"];

          v42 = (void *)objc_claimAutoreleasedReturnValue([v31 formattedDescriptions]);
          [v32 setObject:v42 forKeyedSubscript:@"Descriptions"];

          goto LABEL_28;
        }

- (void).cxx_destruct
{
}

@end