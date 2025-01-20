@interface PurchaseManifest
+ (id)_sharedManifestWithManifestType:(int64_t)a3;
+ (id)sharedManifestForDownloadKind:(id)a3;
+ (void)_handleMessage:(id)a3 connection:(id)a4 usingBlock:(id)a5;
+ (void)getPathsWithMessage:(id)a3 connection:(id)a4;
+ (void)jetsam;
+ (void)observeXPCServer:(id)a3;
+ (void)rebuildWithMessage:(id)a3 connection:(id)a4;
+ (void)removeItemWithMessage:(id)a3 connection:(id)a4;
- (BOOL)_writeToFile;
- (NSArray)purchaseManifestItems;
- (NSString)path;
- (PurchaseManifest)init;
- (PurchaseManifest)initWithPurchaseDirectory:(id)a3;
- (id)_dictionary;
- (id)removeItemsWithAssetPaths:(id)a3 error:(id *)a4;
- (void)addCompletedItem:(id)a3;
- (void)dealloc;
- (void)jetsam;
- (void)rebuildManifest;
@end

@implementation PurchaseManifest

- (PurchaseManifest)init
{
  return -[PurchaseManifest initWithPurchaseDirectory:](self, "initWithPurchaseDirectory:", 0LL);
}

- (PurchaseManifest)initWithPurchaseDirectory:(id)a3
{
  if (!a3) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"PurchaseManifest.m",  66LL,  @"Must have directory path");
  }
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PurchaseManifest;
  v5 = -[PurchaseManifest init](&v7, "init");
  if (v5)
  {
    v5->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.itunesstored.PurchaseManifest", 0LL);
    v5->_path = (NSString *)[a3 stringByAppendingPathComponent:@"StorePurchasesInfo.plist"];
  }

  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PurchaseManifest;
  -[PurchaseManifest dealloc](&v3, "dealloc");
}

+ (void)jetsam
{
  id v2 = [(id)qword_1003A31A8 copy];
  pthread_mutex_unlock(&stru_1003A1E40);
  [v2 makeObjectsPerformSelector:"jetsam"];
}

+ (id)sharedManifestForDownloadKind:(id)a3
{
  if ((SSDownloadKindIsMediaKind(a3) & 1) == 0
    && (SSDownloadKindIsPodcastKind(a3) & 1) == 0
    && !SSDownloadKindIsToneKind(a3))
  {
    return 0LL;
  }

  pthread_mutex_lock(&stru_1003A1E40);
  if (!qword_1003A31A8) {
    qword_1003A31A8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  }
  id v4 = sub_10015AF78(a3);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  v5 = (void *)qword_1003A31A8;
  id v6 = [(id)qword_1003A31A8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
LABEL_8:
    uint64_t v9 = 0LL;
    while (1)
    {
      if (*(void *)v14 != v8) {
        objc_enumerationMutation(v5);
      }
      v10 = *(PurchaseManifest **)(*((void *)&v13 + 1) + 8 * v9);
      if (-[NSString isEqualToString:]( -[NSString stringByDeletingLastPathComponent]( -[PurchaseManifest path](v10, "path"),  "stringByDeletingLastPathComponent"),  "isEqualToString:",  v4))
      {
        break;
      }

      if (v7 == (id)++v9)
      {
        id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          goto LABEL_8;
        }
        goto LABEL_16;
      }
    }

    if (v10) {
      goto LABEL_17;
    }
  }

- (void)addCompletedItem:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10000AC10;
  v4[3] = &unk_10034AE70;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (void)jetsam
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000AEA0;
  block[3] = &unk_10034AE98;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
}

- (NSString)path
{
  return self->_path;
}

- (NSArray)purchaseManifestItems
{
  objc_super v3 = (NSArray *)+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000AF5C;
  v6[3] = &unk_10034AE70;
  v6[4] = self;
  v6[5] = v3;
  dispatch_sync(dispatchQueue, v6);
  return v3;
}

- (void)rebuildManifest
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000B0D8;
  block[3] = &unk_10034AE98;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
}

- (id)removeItemsWithAssetPaths:(id)a3 error:(id *)a4
{
  id v5 = +[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set");
  v78 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
  uint64_t v92 = 0LL;
  v93 = &v92;
  uint64_t v94 = 0x3052000000LL;
  v95 = sub_10000BF74;
  v96 = sub_10000BF84;
  uint64_t v97 = 0LL;
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v7 = -[NSString stringByDeletingLastPathComponent](self->_path, "stringByDeletingLastPathComponent");
  v79 = v6;
  v81 = self;
  v77 = v5;
  __int128 v90 = 0u;
  __int128 v91 = 0u;
  __int128 v88 = 0u;
  __int128 v89 = 0u;
  id v8 = [a3 countByEnumeratingWithState:&v88 objects:v105 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v89;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v89 != v9) {
          objc_enumerationMutation(a3);
        }
        v11 = *(void **)(*((void *)&v88 + 1) + 8LL * (void)i);
        id v12 = objc_msgSend(v11, "length", v72);
        if (v12 > (id)-[NSString length](v7, "length") && ([v11 hasPrefix:v7] & 1) != 0)
        {
          -[NSMutableSet addObject:]( v79,  "addObject:",  objc_msgSend(v11, "substringFromIndex:", (char *)-[NSString length](v7, "length") + 1));
        }

        else
        {
          id v13 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
          if (!v13) {
            id v13 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
          }
          unsigned int v14 = [v13 shouldLog];
          unsigned int v15 = [v13 shouldLogToDisk];
          __int128 v16 = (os_log_s *)[v13 OSLogObject];
          v17 = v16;
          if (v15) {
            unsigned int v18 = v14 | 2;
          }
          else {
            unsigned int v18 = v14;
          }
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
            uint64_t v19 = v18;
          }
          else {
            uint64_t v19 = v18 & 2;
          }
          if ((_DWORD)v19)
          {
            uint64_t v20 = objc_opt_class(v81);
            int v99 = 138412802;
            uint64_t v100 = v20;
            __int16 v101 = 2112;
            id v102 = v11;
            __int16 v103 = 2112;
            v104 = v7;
            LODWORD(v75) = 32;
            uint64_t v21 = _os_log_send_and_compose_impl( v19,  0LL,  0LL,  0LL,  &_mh_execute_header,  v17,  0LL,  "%@: Path: %@ not valid for manifest: %@",  &v99,  v75);
            if (v21)
            {
              v22 = (void *)v21;
              v23 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v21,  4LL);
              free(v22);
              v72 = v23;
              SSFileLog(v13, @"%@");
            }
          }
        }
      }

      id v8 = [a3 countByEnumeratingWithState:&v88 objects:v105 count:16];
    }

    while (v8);
  }

  v24 = v77;
  id v25 = -[NSMutableSet count](v79, "count", v72);
  if (v25 != [a3 count])
  {
    v26 =  +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  SSErrorDomain,  601LL,  0LL);
    v93[5] = (uint64_t)v26;
  }

  if (-[NSMutableSet count](v79, "count"))
  {
    dispatchQueue = (dispatch_queue_s *)v81->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000BF90;
    block[3] = &unk_10034AED8;
    block[4] = v81;
    void block[5] = v79;
    block[6] = v77;
    block[7] = v7;
    block[8] = v78;
    block[9] = &v92;
    dispatch_sync(dispatchQueue, block);
  }

  id v28 = [v77 count];
  if (v28 == [a3 count])
  {
    if (-[NSMutableOrderedSet count](v78, "count"))
    {
      v29 = objc_alloc_init(&OBJC_CLASS___NSFileManager);
      id v30 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
      if (!v30) {
        id v30 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      }
      unsigned int v31 = [v30 shouldLog];
      unsigned int v32 = [v30 shouldLogToDisk];
      v33 = (os_log_s *)[v30 OSLogObject];
      v34 = v33;
      if (v32) {
        unsigned int v35 = v31 | 2;
      }
      else {
        unsigned int v35 = v31;
      }
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO)) {
        uint64_t v36 = v35;
      }
      else {
        uint64_t v36 = v35 & 2;
      }
      if ((_DWORD)v36)
      {
        uint64_t v37 = objc_opt_class(v81);
        id v38 = -[NSMutableOrderedSet count](v78, "count");
        v39 = (NSString *)[v77 count];
        int v99 = 138412802;
        uint64_t v100 = v37;
        __int16 v101 = 2048;
        id v102 = v38;
        __int16 v103 = 2048;
        v104 = v39;
        LODWORD(v75) = 32;
        uint64_t v40 = _os_log_send_and_compose_impl( v36,  0LL,  0LL,  0LL,  &_mh_execute_header,  v34,  1LL,  "%@: Deleting %lu secondary files for %lu removed manifest items",  &v99,  v75);
        if (v40)
        {
          v41 = (void *)v40;
          v42 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v40, 4LL);
          free(v41);
          v73 = v42;
          SSFileLog(v30, @"%@");
        }
      }

      __int128 v85 = 0u;
      __int128 v86 = 0u;
      __int128 v83 = 0u;
      __int128 v84 = 0u;
      id v43 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( v78,  "countByEnumeratingWithState:objects:count:",  &v83,  v98,  16LL,  v73);
      if (v43)
      {
        uint64_t v44 = *(void *)v84;
        do
        {
          for (j = 0LL; j != v43; j = (char *)j + 1)
          {
            if (*(void *)v84 != v44) {
              objc_enumerationMutation(v78);
            }
            v46 = *(void **)(*((void *)&v83 + 1) + 8LL * (void)j);
            uint64_t v82 = 0LL;
            if (-[NSFileManager removeItemAtPath:error:](v29, "removeItemAtPath:error:", v46, &v82, v74))
            {
              id v47 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
              if (!v47) {
                id v47 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
              }
              unsigned int v48 = [v47 shouldLog];
              unsigned int v49 = [v47 shouldLogToDisk];
              v50 = (os_log_s *)[v47 OSLogObject];
              v51 = v50;
              if (v49) {
                unsigned int v52 = v48 | 2;
              }
              else {
                unsigned int v52 = v48;
              }
              if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO)) {
                uint64_t v53 = v52;
              }
              else {
                uint64_t v53 = v52 & 2;
              }
              if ((_DWORD)v53)
              {
                uint64_t v54 = objc_opt_class(v81);
                int v99 = 138412546;
                uint64_t v100 = v54;
                __int16 v101 = 2112;
                id v102 = v46;
                LODWORD(v75) = 22;
                uint64_t v55 = _os_log_send_and_compose_impl( v53,  0LL,  0LL,  0LL,  &_mh_execute_header,  v51,  1LL,  "%@: Deleted secondary file: %@",  &v99,  v75);
                if (v55)
                {
                  v56 = (void *)v55;
                  v57 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v55,  4LL);
                  free(v56);
                  v74 = v57;
                  SSFileLog(v47, @"%@");
                }
              }
            }

            else
            {
              id v58 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
              if (!v58) {
                id v58 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
              }
              unsigned int v59 = [v58 shouldLog];
              unsigned int v60 = [v58 shouldLogToDisk];
              v61 = (os_log_s *)[v58 OSLogObject];
              v62 = v61;
              if (v60) {
                unsigned int v63 = v59 | 2;
              }
              else {
                unsigned int v63 = v59;
              }
              if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT)) {
                uint64_t v64 = v63;
              }
              else {
                uint64_t v64 = v63 & 2;
              }
              if ((_DWORD)v64)
              {
                uint64_t v65 = objc_opt_class(v81);
                v66 = (void *)v93[5];
                int v99 = 138412802;
                uint64_t v100 = v65;
                __int16 v101 = 2112;
                id v102 = v66;
                __int16 v103 = 2112;
                v104 = (NSString *)v46;
                LODWORD(v75) = 32;
                uint64_t v67 = _os_log_send_and_compose_impl( v64,  0LL,  0LL,  0LL,  &_mh_execute_header,  v62,  0LL,  "%@: Could not delete secondary file: %@: %@",  &v99,  v75);
                if (v67)
                {
                  v68 = (void *)v67;
                  v69 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v67,  4LL);
                  free(v68);
                  v74 = v69;
                  SSFileLog(v58, @"%@");
                }
              }
            }
          }

          id v43 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( v78,  "countByEnumeratingWithState:objects:count:",  &v83,  v98,  16LL);
        }

        while (v43);
      }

      v24 = v77;
    }
  }

  else if (a4)
  {
    *a4 = (id)v93[5];
  }

  id v70 = (id)v93[5];
  _Block_object_dispose(&v92, 8);
  return v24;
}

+ (void)getPathsWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10000C42C;
  v4[3] = &unk_10034AF00;
  v4[4] = a4;
  v4[5] = a3;
  void v4[6] = a1;
  [a1 _handleMessage:a3 connection:a4 usingBlock:v4];
}

+ (void)observeXPCServer:(id)a3
{
}

+ (void)rebuildWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10000C70C;
  v4[3] = &unk_10034AF00;
  v4[4] = a4;
  v4[5] = a3;
  void v4[6] = a1;
  [a1 _handleMessage:a3 connection:a4 usingBlock:v4];
}

+ (void)removeItemWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10000C7D0;
  v4[3] = &unk_10034AF00;
  v4[4] = a4;
  v4[5] = a3;
  void v4[6] = a1;
  [a1 _handleMessage:a3 connection:a4 usingBlock:v4];
}

+ (void)_handleMessage:(id)a3 connection:(id)a4 usingBlock:(id)a5
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000CA54;
  block[3] = &unk_10034AF28;
  void block[5] = a4;
  block[6] = a5;
  block[4] = a3;
  dispatch_async(global_queue, block);
}

+ (id)_sharedManifestWithManifestType:(int64_t)a3
{
  if (!a3)
  {
    objc_super v3 = &SSDownloadKindMusic;
    return [a1 sharedManifestForDownloadKind:*v3];
  }

  if (a3 == 1)
  {
    objc_super v3 = &SSDownloadKindPodcast;
    return [a1 sharedManifestForDownloadKind:*v3];
  }

  return 0LL;
}

- (id)_dictionary
{
  if (!self->_dictionary
    && +[NSFileManager ensureDirectoryExists:]( &OBJC_CLASS___NSFileManager,  "ensureDirectoryExists:",  -[NSString stringByDeletingLastPathComponent](self->_path, "stringByDeletingLastPathComponent")))
  {
    if (stat(-[NSString fileSystemRepresentation](self->_path, "fileSystemRepresentation"), &v22))
    {
      if (*__error() == 2)
      {
        id v3 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
        if (!v3) {
          id v3 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
        }
        unsigned int v4 = [v3 shouldLog];
        else {
          LODWORD(v5) = v4;
        }
        id v6 = (os_log_s *)[v3 OSLogObject];
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
          uint64_t v5 = v5;
        }
        else {
          v5 &= 2u;
        }
        if ((_DWORD)v5)
        {
          uint64_t v7 = objc_opt_class(self);
          path = self->_path;
          int v23 = 138412546;
          uint64_t v24 = v7;
          __int16 v25 = 2112;
          v26 = path;
          uint64_t v9 = _os_log_send_and_compose_impl( v5,  0LL,  0LL,  0LL,  &_mh_execute_header,  v6,  1LL,  "%@: Path does not exist: %@",  &v23,  22);
          if (v9)
          {
            v10 = (void *)v9;
            +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v9, 4LL);
            free(v10);
            SSFileLog(v3, @"%@");
          }
        }

        self->_dictionary = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      }
    }

    else if ((__int16)v22.st_mode < 0)
    {
      v11 = sub_10003A780((uint64_t)self->_path);
      if (-[__CFDictionary length](v11, "length"))
      {
        id v12 = (NSMutableDictionary *) +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v11,  1LL,  0LL,  0LL);
      }

      else
      {
        id v13 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
        if (!v13) {
          id v13 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
        }
        unsigned int v14 = [v13 shouldLog];
        else {
          LODWORD(v15) = v14;
        }
        __int128 v16 = (os_log_s *)[v13 OSLogObject];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
          uint64_t v15 = v15;
        }
        else {
          v15 &= 2u;
        }
        if ((_DWORD)v15)
        {
          uint64_t v17 = objc_opt_class(self);
          unsigned int v18 = self->_path;
          int v23 = 138412546;
          uint64_t v24 = v17;
          __int16 v25 = 2112;
          v26 = v18;
          uint64_t v19 = _os_log_send_and_compose_impl( v15,  0LL,  0LL,  0LL,  &_mh_execute_header,  v16,  1LL,  "%@: Path returned empty plist: %@",  &v23,  22);
          if (v19)
          {
            uint64_t v20 = (void *)v19;
            +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v19, 4LL);
            free(v20);
            SSFileLog(v13, @"%@");
          }
        }

        id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      }

      self->_dictionary = v12;
    }
  }

  return self->_dictionary;
}

- (BOOL)_writeToFile
{
  dictionary = self->_dictionary;
  if (!dictionary) {
    return 0;
  }
  unsigned int v4 = +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  dictionary,  200LL,  0LL,  0LL);
  if (!-[NSData length](v4, "length")) {
    return 0;
  }
  unsigned int v5 = sub_10003A590((const __CFData *)v4, (uint64_t)self->_path);
  BOOL v6 = v5 != 0;
  id v7 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  if (!v7) {
    id v7 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v8 = [v7 shouldLog];
  else {
    LODWORD(v9) = v8;
  }
  v10 = (os_log_s *)[v7 OSLogObject];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
    uint64_t v9 = v9;
  }
  else {
    v9 &= 2u;
  }
  if ((_DWORD)v9)
  {
    int v14 = 138412546;
    uint64_t v15 = objc_opt_class(self);
    __int16 v16 = 1024;
    BOOL v17 = v5 != 0;
    uint64_t v11 = _os_log_send_and_compose_impl( v9,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  1LL,  "%@: Wrote dictionary (success: %d)",  &v14,  18);
    if (v11)
    {
      id v12 = (void *)v11;
      +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v11, 4LL);
      free(v12);
      SSFileLog(v7, @"%@");
    }
  }

  return v6;
}

@end