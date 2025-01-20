@interface IPodLibrary
+ (id)deviceIPodLibrary;
+ (void)deleteIPodPurchaseWithMessage:(id)a3 connection:(id)a4;
+ (void)observeXPCServer:(id)a3;
- (BOOL)_addLibraryItems:(id)a3 toMusicLibrary:(id)a4 itemPids:(int64_t *)a5 error:(id *)a6;
- (BOOL)_removeDownloadWithIdentifier:(int64_t)a3 canceled:(BOOL)a4 inLibrary:(id)a5;
- (BOOL)addLibraryItems:(id)a3 error:(id *)a4;
- (IPodLibrary)init;
- (int64_t)addLibraryItem:(id)a3 error:(id *)a4;
- (void)_commitScheduledLibraryItems;
- (void)_dispatchAsync:(id)a3;
- (void)_setDownloadPropertiesForTrack:(id)a3 usingLibraryItem:(id)a4;
- (void)commitScheduledLibraryItems;
- (void)dealloc;
- (void)deleteAllOTATracks;
- (void)removeDownloadWithIdentifier:(int64_t)a3 canceled:(BOOL)a4;
- (void)removeDownloadsWithIdentifiers:(id)a3 canceled:(BOOL)a4;
- (void)scheduleLibraryItem:(id)a3;
- (void)scheduleLibraryItems:(id)a3;
- (void)setAppleIdentifier:(id)a3 forAccountIdentifier:(unint64_t)a4;
@end

@implementation IPodLibrary

- (IPodLibrary)init
{
  if (+[SSDevice deviceIsAppleTV](&OBJC_CLASS___SSDevice, "deviceIsAppleTV"))
  {

    return 0LL;
  }

  else
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___IPodLibrary;
    v3 = -[IPodLibrary init](&v6, "init");
    if (v3)
    {
      v3->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.itunesstored.IPodLibrary", 0LL);
      v4 = objc_alloc_init(&OBJC_CLASS___ISOperationQueue);
      v3->_operationQueue = v4;
      -[ISOperationQueue setAdjustsMaxConcurrentOperationCount:](v4, "setAdjustsMaxConcurrentOperationCount:", 0LL);
      -[ISOperationQueue setMaxConcurrentOperationCount:](v3->_operationQueue, "setMaxConcurrentOperationCount:", 3LL);
      objc_msgSend(+[Daemon daemon](Daemon, "daemon"), "addKeepAliveOperationQueue:", v3->_operationQueue);
    }
  }

  return v3;
}

- (void)dealloc
{
  dispatchQueue = (dispatch_object_s *)self->_dispatchQueue;
  if (dispatchQueue) {
    dispatch_release(dispatchQueue);
  }
  scheduledItemTimer = self->_scheduledItemTimer;
  if (scheduledItemTimer)
  {
    dispatch_source_cancel((dispatch_source_t)scheduledItemTimer);
    dispatch_release((dispatch_object_t)self->_scheduledItemTimer);
  }

  if (self->_operationQueue)
  {
    objc_msgSend( +[Daemon daemon](Daemon, "daemon"),  "removeKeepAliveOperationQueue:",  self->_operationQueue);
    -[ISOperationQueue cancelAllOperations](self->_operationQueue, "cancelAllOperations");
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___IPodLibrary;
  -[IPodLibrary dealloc](&v5, "dealloc");
}

+ (id)deviceIPodLibrary
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000AE7E4;
  block[3] = &unk_10034AE98;
  block[4] = a1;
  if (qword_1003A3348 != -1) {
    dispatch_once(&qword_1003A3348, block);
  }
  return (id)qword_1003A3340;
}

- (int64_t)addLibraryItem:(id)a3 error:(id *)a4
{
  int64_t v5 = 0LL;
  id v6 = a3;
  -[IPodLibrary _addLibraryItems:toMusicLibrary:itemPids:error:]( self,  "_addLibraryItems:toMusicLibrary:itemPids:error:",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL),  +[ML3MusicLibrary sharedLibrary](&OBJC_CLASS___ML3MusicLibrary, "sharedLibrary"),  &v5,  a4);
  return v5;
}

- (BOOL)addLibraryItems:(id)a3 error:(id *)a4
{
  return -[IPodLibrary _addLibraryItems:toMusicLibrary:itemPids:error:]( self,  "_addLibraryItems:toMusicLibrary:itemPids:error:",  a3,  +[ML3MusicLibrary sharedLibrary](&OBJC_CLASS___ML3MusicLibrary, "sharedLibrary"),  0LL,  a4);
}

- (void)commitScheduledLibraryItems
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1000AE944;
  v2[3] = &unk_10034AE98;
  v2[4] = self;
  -[IPodLibrary _dispatchAsync:](self, "_dispatchAsync:", v2);
}

- (void)deleteAllOTATracks
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
    int v11 = 138412290;
    uint64_t v12 = objc_opt_class(self);
    uint64_t v7 = _os_log_send_and_compose_impl( v5,  0LL,  0LL,  0LL,  &_mh_execute_header,  v6,  1LL,  "%@: Deleting all OTA tracks",  &v11,  12);
    if (v7)
    {
      v8 = (void *)v7;
      v9 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v7, 4LL);
      free(v8);
      v10 = v9;
      SSFileLog(v3, @"%@");
    }
  }

  -[IPodLibrary _dispatchAsync:](self, "_dispatchAsync:", &stru_10034D708, v10);
}

- (void)removeDownloadsWithIdentifiers:(id)a3 canceled:(BOOL)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000AEBA4;
  v4[3] = &unk_10034BB48;
  v4[4] = a3;
  v4[5] = self;
  BOOL v5 = a4;
  -[IPodLibrary _dispatchAsync:](self, "_dispatchAsync:", v4);
}

- (void)removeDownloadWithIdentifier:(int64_t)a3 canceled:(BOOL)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000AED94;
  v4[3] = &unk_10034D7A8;
  v4[4] = self;
  v4[5] = a3;
  BOOL v5 = a4;
  -[IPodLibrary _dispatchAsync:](self, "_dispatchAsync:", v4);
}

- (void)scheduleLibraryItem:(id)a3
{
  unsigned int v4 = -[NSArray initWithObjects:](objc_alloc(&OBJC_CLASS___NSArray), "initWithObjects:", a3, 0LL);
  -[IPodLibrary scheduleLibraryItems:](self, "scheduleLibraryItems:", v4);
}

- (void)scheduleLibraryItems:(id)a3
{
  if ([a3 count])
  {
    id v5 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v5) {
      id v5 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v6 = [v5 shouldLog];
    else {
      LODWORD(v7) = v6;
    }
    v8 = (os_log_s *)[v5 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
      uint64_t v7 = v7;
    }
    else {
      v7 &= 2u;
    }
    if ((_DWORD)v7)
    {
      int v14 = 138412546;
      uint64_t v15 = objc_opt_class(self);
      __int16 v16 = 2048;
      id v17 = [a3 count];
      uint64_t v9 = _os_log_send_and_compose_impl( v7,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  1LL,  "%@: Scheduling %lu iPod library items",  &v14,  22);
      if (v9)
      {
        v10 = (void *)v9;
        int v11 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v9, 4LL);
        free(v10);
        uint64_t v12 = v11;
        SSFileLog(v5, @"%@");
      }
    }

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000AF02C;
    v13[3] = &unk_10034AE70;
    v13[4] = self;
    v13[5] = a3;
    -[IPodLibrary _dispatchAsync:](self, "_dispatchAsync:", v13, v12);
  }

- (void)setAppleIdentifier:(id)a3 forAccountIdentifier:(unint64_t)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000AF1A4;
  v4[3] = &unk_10034B300;
  v4[4] = a3;
  v4[5] = a4;
  -[IPodLibrary _dispatchAsync:](self, "_dispatchAsync:", v4);
}

+ (void)deleteIPodPurchaseWithMessage:(id)a3 connection:(id)a4
{
}

+ (void)observeXPCServer:(id)a3
{
}

- (BOOL)_addLibraryItems:(id)a3 toMusicLibrary:(id)a4 itemPids:(int64_t *)a5 error:(id *)a6
{
  id v6 = a3;
  v141 = +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [a3 count]);
  __int128 v146 = 0u;
  __int128 v147 = 0u;
  __int128 v148 = 0u;
  __int128 v149 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v146 objects:v154 count:16];
  id obj = v6;
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v147;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v147 != v9) {
          objc_enumerationMutation(obj);
        }
        int v11 = *(void **)(*((void *)&v146 + 1) + 8LL * (void)i);
        unsigned int v12 = +[IPodLibraryItem mediaTypeForStoreDownload:]( IPodLibraryItem,  "mediaTypeForStoreDownload:",  objc_msgSend(v11, "itemMetadata", v123));
        id v13 = [v11 libraryPersistentIdentifier];
        id v14 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
        if (!v14) {
          id v14 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
        }
        LODWORD(v15) = [v14 shouldLog];
        __int16 v16 = (os_log_s *)[v14 OSLogObject];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
          uint64_t v15 = v15;
        }
        else {
          v15 &= 2u;
        }
        if ((_DWORD)v15)
        {
          uint64_t v17 = objc_opt_class(self);
          int v150 = 138412546;
          uint64_t v151 = v17;
          __int16 v152 = 2048;
          *(void *)v153 = v13;
          LODWORD(v131) = 22;
          uint64_t v18 = _os_log_send_and_compose_impl( v15,  0LL,  0LL,  0LL,  &_mh_execute_header,  v16,  1LL,  "%@: importing item with existing library pid %lld",  &v150,  v131);
          if (v18)
          {
            v19 = (void *)v18;
            v20 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v18,  4LL);
            free(v19);
            v123 = v20;
            SSFileLog(v14, @"%@");
          }
        }

        if (v13) {
          BOOL v21 = v12 == 8;
        }
        else {
          BOOL v21 = 0;
        }
        if (v21)
        {
          id v22 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
          if (!v22) {
            id v22 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
          }
          LODWORD(v23) = objc_msgSend(v22, "shouldLog", v123);
          v24 = (os_log_s *)[v22 OSLogObject];
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO)) {
            uint64_t v23 = v23;
          }
          else {
            v23 &= 2u;
          }
          if ((_DWORD)v23)
          {
            uint64_t v25 = objc_opt_class(self);
            int v150 = 138412546;
            uint64_t v151 = v25;
            __int16 v152 = 2048;
            *(void *)v153 = v13;
            LODWORD(v131) = 22;
            uint64_t v26 = _os_log_send_and_compose_impl( v23,  0LL,  0LL,  0LL,  &_mh_execute_header,  v24,  1LL,  "%@: skipping import of item with existing library pid %lld",  &v150,  v131);
            if (v26)
            {
              v27 = (void *)v26;
              v28 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v26,  4LL);
              free(v27);
              v123 = v28;
              SSFileLog(v22, @"%@");
            }
          }
        }

        else
        {
          -[NSMutableArray addObject:](v141, "addObject:", v11);
        }
      }

      id v6 = obj;
      id v8 = [obj countByEnumeratingWithState:&v146 objects:v154 count:16];
    }

    while (v8);
  }

  if (-[NSMutableArray count](v141, "count", v123))
  {
    v29 = +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v6 count]);
    v139 = objc_alloc_init(&OBJC_CLASS___IPodLibraryML3TrackImporter);
    unsigned int v30 = -[IPodLibraryML3TrackImporter importLibraryItems:toMusicLibrary:importedItemPids:]( v139,  "importLibraryItems:toMusicLibrary:importedItemPids:",  v141,  a4,  v29);
    id v31 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v31) {
      id v31 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v32 = [v31 shouldLog];
    v33 = (os_log_s *)[v31 OSLogObject];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO)) {
      uint64_t v34 = v32;
    }
    else {
      uint64_t v34 = v32 & 2;
    }
    if ((_DWORD)v34)
    {
      uint64_t v35 = objc_opt_class(self);
      v36 = "failed";
      if (v30) {
        v36 = "succeeded";
      }
      int v150 = 138412546;
      uint64_t v151 = v35;
      __int16 v152 = 2080;
      *(void *)v153 = v36;
      LODWORD(v131) = 22;
      uint64_t v37 = _os_log_send_and_compose_impl( v34,  0LL,  0LL,  0LL,  &_mh_execute_header,  v33,  1LL,  "%@: import %s",  &v150,  v131);
      if (v37)
      {
        v38 = (void *)v37;
        v39 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v37, 4LL);
        free(v38);
        v124 = v39;
        SSFileLog(v31, @"%@");
      }
    }

    if (!v30)
    {
      BOOL v121 = 0;
      goto LABEL_159;
    }

    if (-[NSMutableArray count](v141, "count"))
    {
      unint64_t v40 = 0LL;
      do
      {
        objc_msgSend( -[NSMutableArray objectAtIndex:](v141, "objectAtIndex:", v40, v124),  "setLibraryPersistentIdentifier:",  objc_msgSend(-[NSMutableArray objectAtIndex:](v29, "objectAtIndex:", v40), "longLongValue"));
        ++v40;
      }

      while ((unint64_t)-[NSMutableArray count](v141, "count") > v40);
    }

    id v6 = obj;
  }

  v138 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v139 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  if ([v6 count])
  {
    unint64_t v41 = 0LL;
    uint64_t v134 = ML3TrackPropertyBaseLocationID;
    uint64_t v135 = ML3TrackPropertyLocationFileName;
    uint64_t v133 = ML3TrackPropertyStoreFamilyAccountID;
    do
    {
      id v42 = objc_msgSend(v6, "objectAtIndex:", v41, v124);
      id v43 = [v42 itemMediaPath];
      v142 = v42;
      id v44 = [v42 libraryPersistentIdentifier];
      id v45 = v44;
      if (a5) {
        a5[v41] = (int64_t)v44;
      }
      id v46 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
      if (!v46) {
        id v46 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      }
      LODWORD(v47) = [v46 shouldLog];
      v48 = (os_log_s *)[v46 OSLogObject];
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO)) {
        uint64_t v47 = v47;
      }
      else {
        v47 &= 2u;
      }
      if ((_DWORD)v47)
      {
        uint64_t v49 = objc_opt_class(self);
        int v150 = 138412802;
        uint64_t v151 = v49;
        __int16 v152 = 1024;
        *(_DWORD *)v153 = v41;
        *(_WORD *)&v153[4] = 2048;
        *(void *)&v153[6] = v45;
        LODWORD(v131) = 28;
        uint64_t v50 = _os_log_send_and_compose_impl( v47,  0LL,  0LL,  0LL,  &_mh_execute_header,  v48,  1LL,  "%@: post process item %d. pid=%lld",  &v150,  v131);
        if (v50)
        {
          v51 = (void *)v50;
          v52 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v50, 4LL);
          free(v51);
          v125 = v52;
          SSFileLog(v46, @"%@");
        }
      }

      uint64_t v53 = (uint64_t)v45;
      id v54 = [[ML3Track alloc] initWithPersistentID:v45 inLibrary:a4];
      id v140 = [v54 valueForProperty:v135];
      id v55 = objc_msgSend(objc_msgSend(v54, "valueForProperty:", v134), "longLongValue");
      id v144 = v43;
      uint64_t v56 = ML3BaseLocationIDFromMediaRelativePathInLibrary( objc_msgSend(objc_msgSend(v43, "stringByDeletingLastPathComponent"), "lastPathComponent"),  a4);
      id v57 = [v54 valueForProperty:v133];
      id v58 = [v57 longLongValue];
      id v59 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
      if (!v59) {
        id v59 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      }
      LODWORD(v60) = objc_msgSend(v59, "shouldLog", v125);
      v61 = (os_log_s *)[v59 OSLogObject];
      if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO)) {
        uint64_t v60 = v60;
      }
      else {
        v60 &= 2u;
      }
      if ((_DWORD)v60)
      {
        uint64_t v62 = objc_opt_class(self);
        int v150 = 138412802;
        uint64_t v151 = v62;
        __int16 v152 = 2112;
        *(void *)v153 = v140;
        *(_WORD *)&v153[8] = 2112;
        *(void *)&v153[10] = v57;
        LODWORD(v131) = 32;
        uint64_t v63 = _os_log_send_and_compose_impl( v60,  0LL,  0LL,  0LL,  &_mh_execute_header,  v61,  1LL,  "%@: existingPath=%@, existingFamilyAccoundID=%@",  &v150,  v131);
        if (v63)
        {
          v64 = (void *)v63;
          v65 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v63, 4LL);
          free(v64);
          v126 = v65;
          SSFileLog(v59, @"%@");
        }
      }

      if (v144)
      {
        id v66 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
        id v67 = v66;
        if ((uint64_t)v55 <= v56 || v58)
        {
          if (!v66) {
            id v67 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
          }
          unsigned int v83 = objc_msgSend(v67, "shouldLog", v126);
          else {
            LODWORD(v84) = v83;
          }
          v85 = (os_log_s *)[v67 OSLogObject];
          if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO)) {
            uint64_t v84 = v84;
          }
          else {
            v84 &= 2u;
          }
          id v6 = obj;
          if ((_DWORD)v84)
          {
            uint64_t v86 = objc_opt_class(self);
            id v87 = [v54 persistentID];
            int v150 = 138412546;
            uint64_t v151 = v86;
            __int16 v152 = 2048;
            *(void *)v153 = v87;
            LODWORD(v131) = 22;
            uint64_t v88 = _os_log_send_and_compose_impl( v84,  0LL,  0LL,  0LL,  &_mh_execute_header,  v85,  1LL,  "%@: Defering populating artwork for %lld",  &v150,  v131);
            if (v88)
            {
              v89 = (void *)v88;
              v90 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v88,  4LL);
              free(v89);
              v129 = v90;
              SSFileLog(v67, @"%@");
            }
          }

          -[NSMutableArray addObject:](v138, "addObject:", v142, v129);
          -[IPodLibraryML3TrackImporter addObject:](v139, "addObject:", v54);
        }

        else
        {
          if (!v66) {
            id v67 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
          }
          unsigned int v68 = objc_msgSend(v67, "shouldLog", v126);
          else {
            LODWORD(v69) = v68;
          }
          v70 = (os_log_s *)[v67 OSLogObject];
          if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO)) {
            uint64_t v69 = v69;
          }
          else {
            v69 &= 2u;
          }
          if ((_DWORD)v69)
          {
            uint64_t v71 = objc_opt_class(self);
            int v150 = 138412802;
            uint64_t v151 = v71;
            __int16 v152 = 2048;
            *(void *)v153 = v53;
            *(_WORD *)&v153[8] = 2112;
            *(void *)&v153[10] = v140;
            LODWORD(v131) = 32;
            uint64_t v72 = _os_log_send_and_compose_impl( v69,  0LL,  0LL,  0LL,  &_mh_execute_header,  v70,  1LL,  "%@: Skipping existing track with location data: %lld: \"%@\"",  &v150,  v131);
            if (v72)
            {
              v73 = (void *)v72;
              v74 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v72,  4LL);
              free(v73);
              v127 = v74;
              SSFileLog(v67, @"%@");
            }
          }

          if (objc_msgSend(v142, "isDownloading", v127)) {
            -[IPodLibrary _setDownloadPropertiesForTrack:usingLibraryItem:]( self,  "_setDownloadPropertiesForTrack:usingLibraryItem:",  v54,  v142);
          }
          +[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v144);
          ML3DeleteAssetsAtPaths();
          id v6 = obj;
        }
      }

      else
      {
        id v75 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
        id v6 = obj;
        if (!v75) {
          id v75 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
        }
        unsigned int v76 = objc_msgSend(v75, "shouldLog", v126);
        else {
          LODWORD(v77) = v76;
        }
        v78 = (os_log_s *)[v75 OSLogObject];
        if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO)) {
          uint64_t v77 = v77;
        }
        else {
          v77 &= 2u;
        }
        if ((_DWORD)v77)
        {
          uint64_t v79 = objc_opt_class(self);
          int v150 = 138412546;
          uint64_t v151 = v79;
          __int16 v152 = 2048;
          *(void *)v153 = v53;
          LODWORD(v131) = 22;
          uint64_t v80 = _os_log_send_and_compose_impl( v77,  0LL,  0LL,  0LL,  &_mh_execute_header,  v78,  1LL,  "%@: Skipping existing track, no location data: %lld",  &v150,  v131);
          if (v80)
          {
            v81 = (void *)v80;
            v82 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v80,  4LL);
            free(v81);
            v128 = v82;
            SSFileLog(v75, @"%@");
          }
        }

        if (objc_msgSend(v142, "isDownloading", v128))
        {
          -[IPodLibrary _setDownloadPropertiesForTrack:usingLibraryItem:]( self,  "_setDownloadPropertiesForTrack:usingLibraryItem:",  v54,  v142);
        }

        else if ([v142 updateType] == (id)2)
        {
          id v91 = [v142 itemArtworkData];
          if ([v91 length]) {
            [v54 populateArtworkCacheWithArtworkData:v91];
          }
        }
      }

      id v92 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
      if (!v92) {
        id v92 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      }
      unsigned int v93 = [v92 shouldLog];
      else {
        unsigned int v94 = v93;
      }
      v95 = (os_log_s *)[v92 OSLogObject];
      if (os_log_type_enabled(v95, OS_LOG_TYPE_INFO)) {
        uint64_t v96 = v94;
      }
      else {
        uint64_t v96 = v94 & 2;
      }
      if ((_DWORD)v96)
      {
        int v150 = 134217984;
        uint64_t v151 = v53;
        uint64_t v97 = _os_log_send_and_compose_impl( v96,  0LL,  0LL,  0LL,  &_mh_execute_header,  v95,  1LL,  "inserted track id %lld",  &v150);
        if (v97)
        {
          v98 = (void *)v97;
          v99 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v97, 4LL);
          free(v98);
          v124 = v99;
          SSFileLog(v92, @"%@");
        }
      }

      ++v41;
    }

    while ((unint64_t)[v6 count] > v41);
  }

  v100 = v138;
  if (-[NSMutableArray count](v138, "count", v124))
  {
    unint64_t v101 = 0LL;
    uint64_t v102 = ML3TrackPropertyStoreFamilyAccountID;
    do
    {
      id v103 = -[NSMutableArray objectAtIndex:](v100, "objectAtIndex:", v101);
      id v104 = -[IPodLibraryML3TrackImporter objectAtIndex:](v139, "objectAtIndex:", v101);
      id v105 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
      if (!v105) {
        id v105 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      }
      LODWORD(v106) = [v105 shouldLog];
      v107 = (os_log_s *)[v105 OSLogObject];
      if (os_log_type_enabled(v107, OS_LOG_TYPE_INFO)) {
        uint64_t v106 = v106;
      }
      else {
        v106 &= 2u;
      }
      if ((_DWORD)v106)
      {
        uint64_t v108 = objc_opt_class(self);
        id v109 = [v104 persistentID];
        int v150 = 138412546;
        uint64_t v151 = v108;
        __int16 v152 = 2048;
        *(void *)v153 = v109;
        LODWORD(v131) = 22;
        uint64_t v110 = _os_log_send_and_compose_impl( v106,  0LL,  0LL,  0LL,  &_mh_execute_header,  v107,  1LL,  "%@: Setting location data for track: %lld",  &v150,  v131);
        if (v110)
        {
          v111 = (void *)v110;
          v112 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v110,  4LL);
          free(v111);
          v130 = v112;
          SSFileLog(v105, @"%@");
        }
      }

      id v113 = objc_msgSend(v103, "itemArtworkData", v130);
      if ([v113 length]) {
        [v104 populateArtworkCacheWithArtworkData:v113];
      }
      id v114 = [v103 protectionType];
      id v115 = v114;
      if (v114 != (id)2 && v114 != (id)1)
      {
        if (!v114
          && (id v116 = objc_msgSend(objc_msgSend(v103, "itemMetadata"), "sinfs"),
              uint64_t v117 = objc_opt_class(&OBJC_CLASS___NSArray),
              (objc_opt_isKindOfClass(v116, v117) & 1) != 0)
          && [v116 count])
        {
          v118 = -[DownloadDRM initWithSinfArray:](objc_alloc(&OBJC_CLASS___DownloadDRM), "initWithSinfArray:", v116);
          id v115 = (id)(-[DownloadDRM isDRMFree](v118, "isDRMFree") ^ 1);
        }

        else
        {
          id v115 = 0LL;
        }
      }

      objc_msgSend( v104,  "populateLocationPropertiesWithPath:protectionType:",  objc_msgSend(v103, "itemMediaPath"),  v115);
      v119 = (_UNKNOWN **)objc_msgSend(objc_msgSend(v103, "itemMetadata"), "familyAccountIdentifier");
      if (v119) {
        v120 = v119;
      }
      else {
        v120 = &off_10036D728;
      }
      [v104 setValue:v120 forProperty:v102];
      -[IPodLibrary _setDownloadPropertiesForTrack:usingLibraryItem:]( self,  "_setDownloadPropertiesForTrack:usingLibraryItem:",  v104,  0LL);
      ++v101;
      v100 = v138;
    }

    while (v101 < (unint64_t)-[NSMutableArray count](v138, "count"));
  }

  BOOL v121 = 1;
LABEL_159:

  if (a6) {
    *a6 = 0LL;
  }
  return v121;
}

- (void)_commitScheduledLibraryItems
{
  if (-[NSMutableArray count](self->_scheduledItems, "count"))
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
      id v8 = -[NSMutableArray count](self->_scheduledItems, "count");
      int v14 = 138412546;
      uint64_t v15 = v7;
      __int16 v16 = 2048;
      id v17 = v8;
      uint64_t v9 = _os_log_send_and_compose_impl( v5,  0LL,  0LL,  0LL,  &_mh_execute_header,  v6,  1LL,  "%@: Adding %lu scheduled iPod library items",  &v14,  22);
      if (v9)
      {
        v10 = (void *)v9;
        int v11 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v9, 4LL);
        free(v10);
        id v13 = v11;
        SSFileLog(v3, @"%@");
      }
    }

    -[IPodLibrary addLibraryItems:error:](self, "addLibraryItems:error:", self->_scheduledItems, 0LL, v13);
    -[NSMutableArray removeAllObjects](self->_scheduledItems, "removeAllObjects");
    objc_msgSend( +[Daemon daemon](Daemon, "daemon"),  "releaseKeepAliveAssertion:",  @"com.apple.itunesstored.IPodLibrary");
  }

  scheduledItemTimer = self->_scheduledItemTimer;
  if (scheduledItemTimer)
  {
    dispatch_source_cancel((dispatch_source_t)scheduledItemTimer);
    dispatch_release((dispatch_object_t)self->_scheduledItemTimer);
    self->_scheduledItemTimer = 0LL;
  }

- (void)_dispatchAsync:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000B049C;
  block[3] = &unk_10034BB20;
  block[4] = a3;
  dispatch_async(dispatchQueue, block);
}

- (BOOL)_removeDownloadWithIdentifier:(int64_t)a3 canceled:(BOOL)a4 inLibrary:(id)a5
{
  BOOL v6 = a4;
  id v8 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"%lld", a3);
  uint64_t v9 = ML3TrackPropertyDownloadIdentifier;
  id v10 = +[ML3Track anyInLibrary:predicate:]( &OBJC_CLASS___ML3Track,  "anyInLibrary:predicate:",  a5,  +[ML3ComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___ML3ComparisonPredicate,  "predicateWithProperty:equalToValue:",  ML3TrackPropertyDownloadIdentifier,  v8));
  if (!v10)
  {
LABEL_26:
    unsigned __int8 v22 = 1;
    goto LABEL_27;
  }

  int v11 = v10;
  v39[0] = ML3TrackPropertyLocationFileName;
  v39[1] = ML3TrackPropertyStoreSagaID;
  v39[2] = ML3TrackPropertyPurchaseHistoryID;
  v39[3] = ML3TrackPropertyStoreIsSubscription;
  v39[4] = ML3TrackPropertyIsRental;
  [v10 getValues:&v34 forProperties:v39 count:5];
  unsigned int v12 = v38;
  id v13 = v34;
  uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0 && [v34 length]
    || v35 && [v35 longLongValue]
    || v36 && [v36 longLongValue]
    || v37 && ([v37 BOOLValue] & 1) != 0)
  {
    id v15 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v15) {
      id v15 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v16 = [v15 shouldLog];
    else {
      LODWORD(v17) = v16;
    }
    uint64_t v18 = (os_log_s *)[v15 OSLogObject];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
      uint64_t v17 = v17;
    }
    else {
      v17 &= 2u;
    }
    if ((_DWORD)v17)
    {
      *(_DWORD *)v33 = 138412546;
      *(void *)&v33[4] = objc_opt_class(self);
      *(_WORD *)&v33[12] = 2048;
      *(void *)&v33[14] = [v11 persistentID];
      uint64_t v19 = _os_log_send_and_compose_impl( v17,  0LL,  0LL,  0LL,  &_mh_execute_header,  v18,  1LL,  "%@: Removing download properties from iPod library: %lld",  v33,  22);
      if (v19)
      {
        v20 = (void *)v19;
        BOOL v21 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v19, 4LL);
        free(v20);
        id v31 = v21;
        SSFileLog(v15, @"%@");
      }
    }

    *(void *)v33 = v9;
    *(void *)&v33[8] = ML3TrackPropertyNeedsRestore;
    __int128 v32 = unk_10034D7C8;
    objc_msgSend(v11, "setValues:forProperties:count:", &v32, v33, 2, v31);
    if (v6) {
      [v11 setValue:&off_10036D740 forProperty:ML3EntityPropertyKeepLocal];
    }
    goto LABEL_26;
  }

  id v24 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  if (!v24) {
    id v24 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v25 = [v24 shouldLog];
  else {
    LODWORD(v26) = v25;
  }
  v27 = (os_log_s *)[v24 OSLogObject];
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO)) {
    uint64_t v26 = v26;
  }
  else {
    v26 &= 2u;
  }
  if ((_DWORD)v26)
  {
    *(_DWORD *)v33 = 138412546;
    *(void *)&v33[4] = objc_opt_class(self);
    *(_WORD *)&v33[12] = 2048;
    *(void *)&v33[14] = [v11 persistentID];
    uint64_t v28 = _os_log_send_and_compose_impl( v26,  0LL,  0LL,  0LL,  &_mh_execute_header,  v27,  1LL,  "%@: Deleting download from iPod library: %lld",  v33,  22);
    if (v28)
    {
      v29 = (void *)v28;
      unsigned int v30 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v28, 4LL);
      free(v29);
      id v31 = v30;
      SSFileLog(v24, @"%@");
    }
  }

  unsigned __int8 v22 = objc_msgSend(v11, "deleteFromLibrary", v31);
LABEL_27:

  return v22;
}

- (void)_setDownloadPropertiesForTrack:(id)a3 usingLibraryItem:(id)a4
{
  v7[0] = [a4 itemDownloadIdentifier];
  v7[1] = &__kCFBooleanFalse;
  v6[0] = ML3TrackPropertyDownloadIdentifier;
  v6[1] = ML3TrackPropertyNeedsRestore;
  if (v7[0]) {
    uint64_t v5 = 1LL;
  }
  else {
    uint64_t v5 = 2LL;
  }
  [a3 setValues:v7 forProperties:v6 count:v5];
}

@end