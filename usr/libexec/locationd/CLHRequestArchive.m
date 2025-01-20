@interface CLHRequestArchive
- (BOOL)deleteSubArchiveIfInactive:(id)a3;
- (BOOL)isActiveSubArchive;
- (BOOL)primaryDataExists;
- (CLHRequestArchive)init;
- (CLHRequestArchive)initWithDirectory:(id)a3;
- (CLHRequestArchive)initWithDirectory:(id)a3 itemCountThresholdForAutoCleanUp:(int)a4;
- (CLHRequestArchive)initWithDirectory:(id)a3 requestCode:(int)a4;
- (CLHRequestArchive)initWithDirectory:(id)a3 requestCode:(int)a4 itemCountThresholdForAutoCleanUp:(int)a5;
- (NSFileHandle)secondaryFileHandle;
- (NSString)directory;
- (NSString)secondaryPath;
- (double)rotationInterval;
- (id)inactiveSubArchives;
- (id)jsonObject;
- (id)mappedDataByDestructivelyCombiningPrimaryAndSecondaryData;
- (id)mappedPrimaryData;
- (id)mappedSecondaryData;
- (id)mappedSecondaryDataByDestructivelyCombiningAllSecondaryData;
- (id)pathForPrimaryData;
- (id)pathForSecondaryData;
- (id)pruneAndGetSecondaryDataOlderThan:(double)a3;
- (id)secondaryFileURLs;
- (unint64_t)count;
- (unint64_t)fileCount;
- (unint64_t)totalCount;
- (unint64_t)totalCountIncludingAllSubArchives;
- (unint64_t)totalSecondaryPointsUnderAllSubArchives;
- (unsigned)primaryDataSize;
- (unsigned)requestCode;
- (unsigned)secondaryDataSize;
- (void)dealloc;
- (void)eraseAllData;
- (void)generateNewSubArchive;
- (void)incrementCountBy:(unint64_t)a3;
- (void)iterateSecondaryData:(id)a3 forField:(unsigned int)a4 withHandler:(id)a5;
- (void)iterateSubArchivesWithHandler:(id)a3;
- (void)overwritePrimaryData:(id)a3;
- (void)overwritePrimaryObject:(id)a3;
- (void)pruneSecondaryDataOlderThan:(double)a3;
- (void)rotateSecondaryFile;
- (void)setCount:(unint64_t)a3;
- (void)setRotationInterval:(double)a3;
- (void)setSecondaryFileHandle:(id)a3;
- (void)setSecondaryPath:(id)a3;
- (void)setTotalCount:(unint64_t)a3;
- (void)updateCount;
- (void)writeSecondaryData:(id)a3 toField:(unsigned int)a4;
- (void)writeSecondaryObject:(id)a3 toField:(unsigned int)a4;
@end

@implementation CLHRequestArchive

- (void)setCount:(unint64_t)a3
{
  unint64_t count = self->_count;
  unint64_t totalCount = self->_totalCount;
  self->_unint64_t count = a3;
  if (-[CLHRequestArchive isActiveSubArchive](self, "isActiveSubArchive"))
  {
    unint64_t v6 = self->_count - count + self->_totalCount;
    if ((v6 & 0x80000000) == 0) {
      self->_unint64_t totalCount = v6;
    }
  }

  if (qword_1019349B0 != -1) {
    dispatch_once(&qword_1019349B0, &stru_101888098);
  }
  v7 = (os_log_s *)qword_1019349B8;
  if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_DEBUG))
  {
    directory = self->_directory;
    unint64_t v9 = self->_count;
    unint64_t v10 = self->_totalCount;
    *(_DWORD *)buf = 138413314;
    v27 = directory;
    __int16 v28 = 1024;
    int v29 = count;
    __int16 v30 = 1024;
    int v31 = v9;
    __int16 v32 = 1024;
    int v33 = totalCount;
    __int16 v34 = 1024;
    int v35 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "#update-count: archive:%@, oldCount:%d, newCount:%d, oldTotalCount:%d, newTotalCount:%d",  buf,  0x24u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019349B0 != -1) {
      dispatch_once(&qword_1019349B0, &stru_101888098);
    }
    v11 = self->_directory;
    unint64_t v12 = self->_count;
    unint64_t v13 = self->_totalCount;
    int v16 = 138413314;
    v17 = v11;
    __int16 v18 = 1024;
    int v19 = count;
    __int16 v20 = 1024;
    int v21 = v12;
    __int16 v22 = 1024;
    int v23 = totalCount;
    __int16 v24 = 1024;
    int v25 = v13;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019349B8,  2LL,  "#update-count: archive:%@, oldCount:%d, newCount:%d, oldTotalCount:%d, newTotalCount:%d",  &v16,  36);
    v15 = (uint8_t *)v14;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLHRequestArchive setCount:]", "%s\n", v14);
    if (v15 != buf) {
      free(v15);
    }
  }

- (CLHRequestArchive)init
{
  return 0LL;
}

- (CLHRequestArchive)initWithDirectory:(id)a3
{
  return -[CLHRequestArchive initWithDirectory:requestCode:itemCountThresholdForAutoCleanUp:]( self,  "initWithDirectory:requestCode:itemCountThresholdForAutoCleanUp:",  a3,  0LL,  0xFFFFFFFFLL);
}

- (CLHRequestArchive)initWithDirectory:(id)a3 requestCode:(int)a4
{
  return -[CLHRequestArchive initWithDirectory:requestCode:itemCountThresholdForAutoCleanUp:]( self,  "initWithDirectory:requestCode:itemCountThresholdForAutoCleanUp:",  a3,  *(void *)&a4,  0xFFFFFFFFLL);
}

- (CLHRequestArchive)initWithDirectory:(id)a3 itemCountThresholdForAutoCleanUp:(int)a4
{
  return -[CLHRequestArchive initWithDirectory:requestCode:itemCountThresholdForAutoCleanUp:]( self,  "initWithDirectory:requestCode:itemCountThresholdForAutoCleanUp:",  a3,  0LL,  *(void *)&a4);
}

- (CLHRequestArchive)initWithDirectory:(id)a3 requestCode:(int)a4 itemCountThresholdForAutoCleanUp:(int)a5
{
  v58.receiver = self;
  v58.super_class = (Class)&OBJC_CLASS___CLHRequestArchive;
  v8 = -[CLHRequestArchive init](&v58, "init");
  unint64_t v9 = v8;
  if (!v8) {
    return v9;
  }
  v8->_rotationInterval = 1800.0;
  v8->_lastRotationTime = CFAbsoluteTimeGetCurrent();
  unint64_t v10 = (NSString *)a3;
  v9->_directory = v10;
  v9->_requestCode = a4;
  v11 = &CMOnBodyStatusManagerManufacturer_ptr;
  if (a5 == -1)
  {
    if (qword_1019349B0 != -1) {
      dispatch_once(&qword_1019349B0, &stru_101888098);
    }
    uint64_t v23 = qword_1019349B8;
    if (!os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_26;
    }
    __int16 v24 = -[NSString UTF8String](v10, "UTF8String");
    uint64_t buf = 68289282LL;
    __int16 v72 = 2082;
    v73 = "";
    __int16 v74 = 2082;
    id v75 = (id)v24;
    int v25 = "{msg%{public}.0s:CLHRequestArchive auto clean-up, threshold none, dir:%{public, location:escape_only}s}";
LABEL_24:
    v27 = (os_log_s *)v23;
    os_log_type_t v28 = OS_LOG_TYPE_DEBUG;
    goto LABEL_25;
  }

  if (!-[NSFileManager fileExistsAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "fileExistsAtPath:",  v10))
  {
    if (qword_1019349B0 != -1) {
      dispatch_once(&qword_1019349B0, &stru_101888098);
    }
    uint64_t v23 = qword_1019349B8;
    if (!os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_26;
    }
    v26 = -[NSString UTF8String](v10, "UTF8String");
    uint64_t buf = 68289282LL;
    __int16 v72 = 2082;
    v73 = "";
    __int16 v74 = 2082;
    id v75 = (id)v26;
    int v25 = "{msg%{public}.0s:CLHRequestArchive auto clean-up. dir not exists, dir:%{public, location:escape_only}s}";
    goto LABEL_24;
  }

  unint64_t v12 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v10);
  if (v12)
  {
    unint64_t v13 = v12;
    int v53 = a5;
    id v51 = a3;
    v52 = v10;
    v14 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
    NSURLResourceKey v78 = NSURLNameKey;
    v50 = v13;
    v15 = -[NSFileManager enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:]( v14,  "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:",  v13,  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v78, 1LL),  5LL,  &stru_1018880D8);
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    __int128 v61 = 0u;
    __int128 v62 = 0u;
    id v16 = -[NSDirectoryEnumerator countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v59,  &buf,  16LL);
    if (v16)
    {
      id v17 = v16;
      int v18 = 0;
      uint64_t v19 = *(void *)v60;
      do
      {
        for (i = 0LL; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v60 != v19) {
            objc_enumerationMutation(v15);
          }
          int v21 = *(void **)(*((void *)&v59 + 1) + 8LL * (void)i);
          __int16 v22 = objc_autoreleasePoolPush();
          [v21 getResourceValue:v64 forKey:NSURLNameKey error:0];
          if (([*(id *)v64 hasPrefix:@"secondary"] & 1) != 0
            || [*(id *)v64 hasPrefix:@"sub"])
          {
            ++v18;
          }

          objc_autoreleasePoolPop(v22);
        }

        id v17 = -[NSDirectoryEnumerator countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v59,  &buf,  16LL);
      }

      while (v17);
    }

    else
    {
      int v18 = 0;
    }

    if (qword_1019349B0 != -1) {
      dispatch_once(&qword_1019349B0, &stru_101888098);
    }
    a3 = v51;
    v11 = &CMOnBodyStatusManagerManufacturer_ptr;
    v41 = (os_log_s *)qword_1019349B8;
    if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_DEFAULT))
    {
      v42 = -[NSString UTF8String](v52, "UTF8String");
      *(_DWORD *)v64 = 68289794;
      *(_DWORD *)&v64[4] = 0;
      __int16 v65 = 2082;
      v66 = "";
      __int16 v67 = 1026;
      *(_DWORD *)v68 = v53;
      *(_WORD *)&v68[4] = 2082;
      *(void *)&v68[6] = v42;
      __int16 v69 = 1026;
      int v70 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:CLHRequestArchive auto clean-up completed, threshold:%{public}u, dir:%{public, location:escape_only}s, total-items:%{public}u}",  v64,  0x28u);
    }

    if (v18 >= v53)
    {
      BOOL v43 = sub_100E53DB4(v50);
      if (qword_1019349B0 != -1) {
        dispatch_once(&qword_1019349B0, &stru_101888098);
      }
      v44 = (os_log_s *)qword_1019349B8;
      if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_DEBUG))
      {
        v45 = -[NSString UTF8String](v52, "UTF8String");
        *(_DWORD *)v64 = 68289538;
        *(_DWORD *)&v64[4] = 0;
        __int16 v65 = 2082;
        v66 = "";
        __int16 v67 = 2082;
        *(void *)v68 = v45;
        *(_WORD *)&v68[8] = 1026;
        *(_DWORD *)&v68[10] = v43;
        _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:CLHRequestArchive auto clean-up. dir deleted., dir:%{public, location:escape_only }s, status:%{public}hhd}",  v64,  0x22u);
        if (qword_1019349B0 != -1) {
          dispatch_once(&qword_1019349B0, &stru_101888098);
        }
      }

      v46 = (os_log_s *)qword_1019349B8;
      if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_FAULT))
      {
        v47 = -[NSString UTF8String](v52, "UTF8String");
        *(_DWORD *)v64 = 68289794;
        *(_DWORD *)&v64[4] = 0;
        __int16 v65 = 2082;
        v66 = "";
        __int16 v67 = 1026;
        *(_DWORD *)v68 = v53;
        *(_WORD *)&v68[4] = 2082;
        *(void *)&v68[6] = v47;
        __int16 v69 = 1026;
        int v70 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:CLHRequestArchive auto clean-up threshold crossed, threshold:%{public}u, dir: %{public, location:escape_only}s, total-items:%{public}u}",  v64,  0x28u);
        if (qword_1019349B0 != -1) {
          dispatch_once(&qword_1019349B0, &stru_101888098);
        }
      }

      v48 = (os_log_s *)qword_1019349B8;
      if (os_signpost_enabled((os_log_t)qword_1019349B8))
      {
        v49 = -[NSString UTF8String](v52, "UTF8String");
        *(_DWORD *)v64 = 68289794;
        *(_DWORD *)&v64[4] = 0;
        __int16 v65 = 2082;
        v66 = "";
        __int16 v67 = 1026;
        *(_DWORD *)v68 = v53;
        *(_WORD *)&v68[4] = 2082;
        *(void *)&v68[6] = v49;
        __int16 v69 = 1026;
        int v70 = v18;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v48,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "CLHRequestArchive auto clean-up threshold crossed",  "{msg%{public}.0s:CLHRequestArchive auto clean-up threshold crossed, threshold:%{public}u, dir: %{public, location:escape_only}s, total-items:%{public}u}",  v64,  0x28u);
      }
    }

    goto LABEL_26;
  }

  if (qword_1019349B0 != -1) {
    dispatch_once(&qword_1019349B0, &stru_101888098);
  }
  uint64_t v39 = qword_1019349B8;
  if (!os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_26;
  }
  v40 = -[NSString UTF8String](v10, "UTF8String");
  uint64_t buf = 68289282LL;
  __int16 v72 = 2082;
  v73 = "";
  __int16 v74 = 2082;
  id v75 = (id)v40;
  int v25 = "{msg%{public}.0s:#warning CLHRequestArchive auto clean-up, directory-url nil, dir:%{public, location:escape_only}s}";
  v27 = (os_log_s *)v39;
  os_log_type_t v28 = OS_LOG_TYPE_DEFAULT;
LABEL_25:
  _os_log_impl((void *)&_mh_execute_header, v27, v28, v25, (uint8_t *)&buf, 0x1Cu);
LABEL_26:
  *(void *)&__int128 v59 = 0LL;
  objc_msgSend( objc_msgSend(v11[411], "defaultManager"),  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  a3,  1,  0,  &v59);
  if ((void)v59)
  {
    if (qword_1019349B0 != -1) {
      dispatch_once(&qword_1019349B0, &stru_101888098);
    }
    int v29 = (os_log_s *)qword_1019349B8;
    if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_FAULT))
    {
      uint64_t buf = 68289539LL;
      __int16 v72 = 2082;
      v73 = "";
      __int16 v74 = 2113;
      id v75 = a3;
      __int16 v76 = 2113;
      uint64_t v77 = v59;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:failed to create archive dir, path:%{private, location:escape_only}@, error:%{p rivate, location:escape_only}@}",  (uint8_t *)&buf,  0x26u);
      if (qword_1019349B0 != -1) {
        dispatch_once(&qword_1019349B0, &stru_101888098);
      }
    }

    __int16 v30 = (os_log_s *)qword_1019349B8;
    if (os_signpost_enabled((os_log_t)qword_1019349B8))
    {
      uint64_t buf = 68289539LL;
      __int16 v72 = 2082;
      v73 = "";
      __int16 v74 = 2113;
      id v75 = a3;
      __int16 v76 = 2113;
      uint64_t v77 = v59;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v30,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "failed to create archive dir",  "{msg%{public}.0s:failed to create archive dir, path:%{private, location:escape_only}@, error:%{p rivate, location:escape_only}@}",  (uint8_t *)&buf,  0x26u);
    }
  }

  else
  {
    if (qword_1019349B0 != -1) {
      dispatch_once(&qword_1019349B0, &stru_101888098);
    }
    int v31 = (os_log_s *)qword_1019349B8;
    if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t buf = 68289283LL;
      __int16 v72 = 2082;
      v73 = "";
      __int16 v74 = 2113;
      id v75 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:archive dir now exists, path:%{private, location:escape_only}@}",  (uint8_t *)&buf,  0x1Cu);
    }
  }

  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  id v32 = -[CLHRequestArchive secondaryFileURLs](v9, "secondaryFileURLs");
  id v33 = [v32 countByEnumeratingWithState:&v54 objects:v63 count:16];
  if (v33)
  {
    id v34 = v33;
    uint64_t v35 = *(void *)v55;
    do
    {
      for (j = 0LL; j != v34; j = (char *)j + 1)
      {
        if (*(void *)v55 != v35) {
          objc_enumerationMutation(v32);
        }
        sub_1005D4368(*(void **)(*((void *)&v54 + 1) + 8LL * (void)j));
        v9->_count += v37;
      }

      id v34 = [v32 countByEnumeratingWithState:&v54 objects:v63 count:16];
    }

    while (v34);
  }

  v9->_unint64_t totalCount = -[CLHRequestArchive totalSecondaryPointsUnderAllSubArchives]( v9,  "totalSecondaryPointsUnderAllSubArchives");
  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLHRequestArchive;
  -[CLHRequestArchive dealloc](&v3, "dealloc");
}

- (NSFileHandle)secondaryFileHandle
{
  double Current = CFAbsoluteTimeGetCurrent();
  double rotationInterval = self->_rotationInterval;
  double lastRotationTime = self->_lastRotationTime;
  BOOL v6 = rotationInterval >= 0.0;
  if (lastRotationTime <= 0.0) {
    BOOL v6 = 1;
  }
  if (Current <= lastRotationTime + rotationInterval) {
    BOOL v6 = 0;
  }
  if (self->_secondaryPath) {
    BOOL v7 = !v6;
  }
  else {
    BOOL v7 = 0;
  }
  if (!v7) {
    -[CLHRequestArchive rotateSecondaryFile](self, "rotateSecondaryFile");
  }
  return self->_secondaryFileHandle;
}

- (void)rotateSecondaryFile
{
  id v3 = -[CLHRequestArchive pathForSecondaryData](self, "pathForSecondaryData");
  if (qword_1019349B0 != -1) {
    dispatch_once(&qword_1019349B0, &stru_101888098);
  }
  v4 = (os_log_s *)qword_1019349B8;
  if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_DEFAULT))
  {
    secondaryPath = self->_secondaryPath;
    int v9 = 68289539;
    int v10 = 0;
    __int16 v11 = 2082;
    unint64_t v12 = "";
    __int16 v13 = 2113;
    v14 = secondaryPath;
    __int16 v15 = 2113;
    id v16 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:rotating secondary file, from:%{private, location:escape_only}@, to:%{private, lo cation:escape_only}@}",  (uint8_t *)&v9,  0x26u);
  }

  -[CLHRequestArchive setSecondaryPath:](self, "setSecondaryPath:", v3);
  uint64_t v6 = sub_1005D43B0(self->_secondaryPath);
  if ((_DWORD)v6 == -1)
  {
    if (qword_1019349B0 != -1) {
      dispatch_once(&qword_1019349B0, &stru_101888098);
    }
    BOOL v7 = (os_log_s *)qword_1019349B8;
    if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_INFO))
    {
      v8 = self->_secondaryPath;
      int v9 = 68289283;
      int v10 = 0;
      __int16 v11 = 2082;
      unint64_t v12 = "";
      __int16 v13 = 2113;
      v14 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:#Warning could not open file, path:%{private, location:escape_only}@}",  (uint8_t *)&v9,  0x1Cu);
    }
  }

  else
  {
    -[CLHRequestArchive setSecondaryFileHandle:]( self,  "setSecondaryFileHandle:",   -[NSFileHandle initWithFileDescriptor:closeOnDealloc:]( objc_alloc(&OBJC_CLASS___NSFileHandle),  "initWithFileDescriptor:closeOnDealloc:",  v6,  1LL));
    self->_double lastRotationTime = CFAbsoluteTimeGetCurrent();
  }

- (unint64_t)count
{
  return self->_count;
}

- (unint64_t)totalCountIncludingAllSubArchives
{
  unsigned int v3 = -[CLHRequestArchive isActiveSubArchive](self, "isActiveSubArchive");
  uint64_t v4 = 5LL;
  if (v3) {
    uint64_t v4 = 6LL;
  }
  return (unint64_t)(&self->super.isa)[v4];
}

- (NSString)directory
{
  return self->_directory;
}

- (unint64_t)fileCount
{
  return (unint64_t)objc_msgSend(-[CLHRequestArchive secondaryFileURLs](self, "secondaryFileURLs"), "count");
}

- (unsigned)primaryDataSize
{
  id v3 = 0LL;
  -[NSURL getResourceValue:forKey:error:]( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  -[CLHRequestArchive pathForPrimaryData](self, "pathForPrimaryData")),  "getResourceValue:forKey:error:",  &v3,  NSURLFileSizeKey,  0LL);
  return [v3 unsignedIntValue];
}

- (unsigned)secondaryDataSize
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v2 = -[CLHRequestArchive secondaryFileURLs](self, "secondaryFileURLs");
  id v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v3) {
    return 0;
  }
  id v4 = v3;
  unsigned int v5 = 0;
  uint64_t v6 = *(void *)v12;
  do
  {
    for (i = 0LL; i != v4; i = (char *)i + 1)
    {
      if (*(void *)v12 != v6) {
        objc_enumerationMutation(v2);
      }
      v8 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
      id v10 = 0LL;
      [v8 getResourceValue:&v10 forKey:NSURLFileSizeKey error:0];
      v5 += [v10 unsignedIntValue];
    }

    id v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  }

  while (v4);
  return v5;
}

- (id)mappedDataByDestructivelyCombiningPrimaryAndSecondaryData
{
  id v3 = objc_alloc_init(&OBJC_CLASS___PBDataWriter);
  [v3 writeData:sub_100FF9CF8()];
  [v3 writeBigEndianFixed32:self->_requestCode];
  objc_msgSend( v3,  "writeBigEndianFixed32:",  -[CLHRequestArchive secondaryDataSize](self, "secondaryDataSize")
  + -[CLHRequestArchive primaryDataSize](self, "primaryDataSize"));
  id v4 = -[NSString stringByAppendingPathComponent:]( self->_directory,  "stringByAppendingPathComponent:",  @"conglomerate");
  unsigned int v5 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v4);
  if (v5) {
    sub_100E53DB4(v5);
  }
  uint64_t v6 = sub_1005D43B0(v4);
  if ((_DWORD)v6 == -1)
  {
    if (qword_1019349B0 != -1) {
      dispatch_once(&qword_1019349B0, &stru_101888098);
    }
    __int16 v20 = (os_log_s *)qword_1019349B8;
    if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_INFO))
    {
      uint64_t buf = 68289283LL;
      __int16 v28 = 2082;
      int v29 = "";
      __int16 v30 = 2113;
      int v31 = (const char *)v4;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:#Warning could not open file, path:%{private, location:escape_only}@}",  (uint8_t *)&buf,  0x1Cu);
    }

    return 0LL;
  }

  else
  {
    BOOL v7 = -[NSFileHandle initWithFileDescriptor:closeOnDealloc:]( objc_alloc(&OBJC_CLASS___NSFileHandle),  "initWithFileDescriptor:closeOnDealloc:",  v6,  1LL);
    id v25 = 0LL;
    -[NSFileHandle writeData:error:](v7, "writeData:error:", [v3 immutableData], &v25);
    if (v25)
    {
      if (qword_1019349B0 != -1) {
        dispatch_once(&qword_1019349B0, &stru_101888098);
      }
      v8 = (os_log_s *)qword_1019349B8;
      if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_ERROR))
      {
        int v9 = -[NSString UTF8String](v4, "UTF8String");
        id v10 = objc_msgSend(objc_msgSend(v25, "description"), "UTF8String");
        uint64_t buf = 68289538LL;
        __int16 v28 = 2082;
        int v29 = "";
        __int16 v30 = 2082;
        int v31 = v9;
        __int16 v32 = 2082;
        id v33 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "{msg%{public}.0s:CLHRequestArchive error writing conglomerate(parimary and secondaries), file:%{pu blic, location:escape_only}s, Error:%{public, location:escape_only}s}",  (uint8_t *)&buf,  0x26u);
        if (qword_1019349B0 != -1) {
          dispatch_once(&qword_1019349B0, &stru_101888098);
        }
      }

      __int128 v11 = (os_log_s *)qword_1019349B8;
      if (os_signpost_enabled((os_log_t)qword_1019349B8))
      {
        __int128 v12 = -[NSString UTF8String](v4, "UTF8String");
        id v13 = objc_msgSend(objc_msgSend(v25, "description"), "UTF8String");
        uint64_t buf = 68289538LL;
        __int16 v28 = 2082;
        int v29 = "";
        __int16 v30 = 2082;
        int v31 = v12;
        __int16 v32 = 2082;
        id v33 = v13;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v11,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "CLHRequestArchive error writing conglomerate(parimary and secondaries)",  "{msg%{public}.0s:CLHRequestArchive error writing conglomerate(parimary and secondaries), file:%{pu blic, location:escape_only}s, Error:%{public, location:escape_only}s}",  (uint8_t *)&buf,  0x26u);
      }
    }

    sub_1005D45F8(v4, -[CLHRequestArchive pathForPrimaryData](self, "pathForPrimaryData"), 1);
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    id v14 = -[CLHRequestArchive secondaryFileURLs](self, "secondaryFileURLs", 0LL);
    id v15 = [v14 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v22;
      do
      {
        for (i = 0LL; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v14);
          }
          sub_1005D45F8(v4, [*(id *)(*((void *)&v21 + 1) + 8 * (void)i) path], 1);
        }

        id v16 = [v14 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }

      while (v16);
    }

    -[CLHRequestArchive rotateSecondaryFile](self, "rotateSecondaryFile");
    -[CLHRequestArchive updateCount](self, "updateCount");
    return sub_100E538F8(v4, 1);
  }

- (void)overwritePrimaryData:(id)a3
{
  unsigned int v5 = +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  -[CLHRequestArchive pathForPrimaryData](self, "pathForPrimaryData"),  0LL);
  if (v5)
  {
    uint64_t v6 = v5;
    if (qword_1019349B0 != -1) {
      dispatch_once(&qword_1019349B0, &stru_101888098);
    }
    BOOL v7 = (os_log_s *)qword_1019349B8;
    if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289283;
      int v20 = 0;
      __int16 v21 = 2082;
      __int128 v22 = "";
      __int16 v23 = 2113;
      __int128 v24 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:removing primary file, url:%{private, location:escape_only}@}",  buf,  0x1Cu);
    }

    sub_100E53DB4(v6);
  }

  v8 = -[CLHRequestArchive pathForPrimaryData](self, "pathForPrimaryData");
  uint64_t v9 = sub_1005D43B0(v8);
  if ((_DWORD)v9 == -1)
  {
    if (qword_1019349B0 != -1) {
      dispatch_once(&qword_1019349B0, &stru_101888098);
    }
    uint64_t v17 = (os_log_s *)qword_1019349B8;
    if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t buf = 68289283;
      int v20 = 0;
      __int16 v21 = 2082;
      __int128 v22 = "";
      __int16 v23 = 2113;
      __int128 v24 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:#Warning could not open file, path:%{private, location:escape_only}@}",  buf,  0x1Cu);
    }
  }

  else
  {
    id v10 = -[NSFileHandle initWithFileDescriptor:closeOnDealloc:]( objc_alloc(&OBJC_CLASS___NSFileHandle),  "initWithFileDescriptor:closeOnDealloc:",  v9,  1LL);
    id v18 = 0LL;
    -[NSFileHandle writeData:error:](v10, "writeData:error:", a3, &v18);
    if (v18)
    {
      if (qword_1019349B0 != -1) {
        dispatch_once(&qword_1019349B0, &stru_101888098);
      }
      __int128 v11 = (os_log_s *)qword_1019349B8;
      if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_ERROR))
      {
        __int128 v12 = (NSURL *)-[NSURL UTF8String](v8, "UTF8String");
        id v13 = objc_msgSend(objc_msgSend(v18, "description"), "UTF8String");
        *(_DWORD *)uint64_t buf = 68289538;
        int v20 = 0;
        __int16 v21 = 2082;
        __int128 v22 = "";
        __int16 v23 = 2082;
        __int128 v24 = v12;
        __int16 v25 = 2082;
        id v26 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "{msg%{public}.0s:CLHRequestArchive error over-writing primary data, file:%{public, location:escape _only}s, Error:%{public, location:escape_only}s}",  buf,  0x26u);
        if (qword_1019349B0 != -1) {
          dispatch_once(&qword_1019349B0, &stru_101888098);
        }
      }

      id v14 = (os_log_s *)qword_1019349B8;
      if (os_signpost_enabled((os_log_t)qword_1019349B8))
      {
        id v15 = (NSURL *)-[NSURL UTF8String](v8, "UTF8String");
        id v16 = objc_msgSend(objc_msgSend(v18, "description"), "UTF8String");
        *(_DWORD *)uint64_t buf = 68289538;
        int v20 = 0;
        __int16 v21 = 2082;
        __int128 v22 = "";
        __int16 v23 = 2082;
        __int128 v24 = v15;
        __int16 v25 = 2082;
        id v26 = v16;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v14,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "CLHRequestArchive error over-writing primary data",  "{msg%{public}.0s:CLHRequestArchive error over-writing primary data, file:%{public, location:escape _only}s, Error:%{public, location:escape_only}s}",  buf,  0x26u);
      }
    }
  }

- (void)overwritePrimaryObject:(id)a3
{
}

- (id)mappedPrimaryData
{
  return sub_100E538F8(-[CLHRequestArchive pathForPrimaryData](self, "pathForPrimaryData"), 0);
}

- (BOOL)primaryDataExists
{
  return -[NSFileManager fileExistsAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "fileExistsAtPath:",  -[CLHRequestArchive pathForPrimaryData](self, "pathForPrimaryData"));
}

- (void)incrementCountBy:(unint64_t)a3
{
  uint64_t v6 = v5;
  -[CLHRequestArchive setCount:](self, "setCount:", self->_count + a3);
  *(double *)&uint64_t v7 = CFAbsoluteTimeGetCurrent();
  uint64_t v15 = 0LL;
  v8 = -[NSString stringByAppendingPathComponent:]( self->_directory,  "stringByAppendingPathComponent:",  sub_1005D437C(v7, v6 + a3));
  -[NSFileManager moveItemAtPath:toPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "moveItemAtPath:toPath:error:",  self->_secondaryPath,  v8,  &v15);
  if (v15)
  {
    if (qword_1019349B0 != -1) {
      dispatch_once(&qword_1019349B0, &stru_101888098);
    }
    uint64_t v9 = (os_log_s *)qword_1019349B8;
    if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_ERROR))
    {
      secondaryPath = self->_secondaryPath;
      *(_DWORD *)uint64_t buf = 68289795;
      int v17 = 0;
      __int16 v18 = 2082;
      uint64_t v19 = "";
      __int16 v20 = 2113;
      __int16 v21 = secondaryPath;
      __int16 v22 = 2113;
      __int16 v23 = v8;
      __int16 v24 = 2113;
      uint64_t v25 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "{msg%{public}.0s:failed to update secondary filename, from:%{private, location:escape_only}@, to :%{private, location:escape_only}@, error:%{private, location:escape_only}@}",  buf,  0x30u);
      if (qword_1019349B0 != -1) {
        dispatch_once(&qword_1019349B0, &stru_101888098);
      }
    }

    __int128 v11 = (os_log_s *)qword_1019349B8;
    if (os_signpost_enabled((os_log_t)qword_1019349B8))
    {
      __int128 v12 = self->_secondaryPath;
      *(_DWORD *)uint64_t buf = 68289795;
      int v17 = 0;
      __int16 v18 = 2082;
      uint64_t v19 = "";
      __int16 v20 = 2113;
      __int16 v21 = v12;
      __int16 v22 = 2113;
      __int16 v23 = v8;
      __int16 v24 = 2113;
      uint64_t v25 = v15;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v11,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "failed to update secondary filename",  "{msg%{public}.0s:failed to update secondary filename, from:%{private, location:escape_only}@, to :%{private, location:escape_only}@, error:%{private, location:escape_only}@}",  buf,  0x30u);
    }
  }

  else
  {
    -[CLHRequestArchive setSecondaryPath:](self, "setSecondaryPath:", v8);
    if (qword_1019349B0 != -1) {
      dispatch_once(&qword_1019349B0, &stru_101888098);
    }
    id v13 = (os_log_s *)qword_1019349B8;
    if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_DEBUG))
    {
      id v14 = self->_secondaryPath;
      *(_DWORD *)uint64_t buf = 68289283;
      int v17 = 0;
      __int16 v18 = 2082;
      uint64_t v19 = "";
      __int16 v20 = 2113;
      __int16 v21 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:updated secondary filename, to:%{private, location:escape_only}@}",  buf,  0x1Cu);
    }
  }

- (void)writeSecondaryObject:(id)a3 toField:(unsigned int)a4
{
}

- (void)writeSecondaryData:(id)a3 toField:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v7 = objc_alloc_init(&OBJC_CLASS___PBDataWriter);
  [v7 writeData:a3 forTag:v4];
  id v14 = 0LL;
  -[NSFileHandle writeData:error:]( -[CLHRequestArchive secondaryFileHandle](self, "secondaryFileHandle"),  "writeData:error:",  [v7 immutableData],  &v14);

  if (v14)
  {
    if (qword_1019349B0 != -1) {
      dispatch_once(&qword_1019349B0, &stru_101888098);
    }
    v8 = (os_log_s *)qword_1019349B8;
    if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = -[NSString UTF8String](self->_secondaryPath, "UTF8String");
      id v10 = objc_msgSend(objc_msgSend(v14, "description"), "UTF8String");
      *(_DWORD *)uint64_t buf = 68289538;
      int v16 = 0;
      __int16 v17 = 2082;
      __int16 v18 = "";
      __int16 v19 = 2082;
      __int16 v20 = v9;
      __int16 v21 = 2082;
      id v22 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "{msg%{public}.0s:CLHRequestArchive secondary-data write failed, secondaryFilePath:%{public, location :escape_only}s, Error:%{public, location:escape_only}s}",  buf,  0x26u);
      if (qword_1019349B0 != -1) {
        dispatch_once(&qword_1019349B0, &stru_101888098);
      }
    }

    __int128 v11 = (os_log_s *)qword_1019349B8;
    if (os_signpost_enabled((os_log_t)qword_1019349B8))
    {
      __int128 v12 = -[NSString UTF8String](self->_secondaryPath, "UTF8String");
      id v13 = objc_msgSend(objc_msgSend(v14, "description"), "UTF8String");
      *(_DWORD *)uint64_t buf = 68289538;
      int v16 = 0;
      __int16 v17 = 2082;
      __int16 v18 = "";
      __int16 v19 = 2082;
      __int16 v20 = v12;
      __int16 v21 = 2082;
      id v22 = v13;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v11,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "CLHRequestArchive secondary-data write failed",  "{msg%{public}.0s:CLHRequestArchive secondary-data write failed, secondaryFilePath:%{public, location :escape_only}s, Error:%{public, location:escape_only}s}",  buf,  0x26u);
    }
  }

  else
  {
    -[CLHRequestArchive incrementCountBy:](self, "incrementCountBy:", 1LL);
  }

- (id)mappedSecondaryDataByDestructivelyCombiningAllSecondaryData
{
  id v3 = -[NSString stringByAppendingPathComponent:]( self->_directory,  "stringByAppendingPathComponent:",  @"allSecondaryCombined");
  uint64_t v4 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v3);
  if (v4) {
    sub_100E53DB4(v4);
  }
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v5 = -[CLHRequestArchive secondaryFileURLs](self, "secondaryFileURLs", 0LL);
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        sub_1005D45F8(v3, [*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) path], 1);
        uint64_t v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v7);
  }

  -[CLHRequestArchive rotateSecondaryFile](self, "rotateSecondaryFile");
  -[CLHRequestArchive updateCount](self, "updateCount");
  return sub_100E538F8(v3, 1);
}

- (id)mappedSecondaryData
{
  id v3 = -[NSString stringByAppendingPathComponent:]( self->_directory,  "stringByAppendingPathComponent:",  @"allSecondaryCombined");
  uint64_t v4 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v3);
  if (v4) {
    sub_100E53DB4(v4);
  }
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v5 = -[CLHRequestArchive secondaryFileURLs](self, "secondaryFileURLs", 0LL);
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        sub_1005D45F8(v3, [*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) path], 0);
        uint64_t v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v7);
  }

  return sub_100E538F8(v3, 1);
}

- (void)pruneSecondaryDataOlderThan:(double)a3
{
  id v5 = -[CLHRequestArchive secondaryFileURLs](self, "secondaryFileURLs");
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        double v11 = COERCE_DOUBLE(sub_1005D4368(v10));
        if (v11 < a3 && sub_100E53DB4(v10))
        {
          unint64_t count = self->_count;
          sub_1005D4368(v10);
          -[CLHRequestArchive setCount:](self, "setCount:", count - v13);
        }
      }

      id v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16, v11);
    }

    while (v7);
  }

- (id)pruneAndGetSecondaryDataOlderThan:(double)a3
{
  id v5 = -[NSString stringByAppendingPathComponent:]( self->_directory,  "stringByAppendingPathComponent:",  @"prunedSecondaryCombined");
  id v6 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v5);
  if (v6) {
    sub_100E53DB4(v6);
  }
  id v7 = -[CLHRequestArchive secondaryFileURLs](self, "secondaryFileURLs");
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        __int128 v12 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        double v13 = COERCE_DOUBLE(sub_1005D4368(v12));
        if (v13 < a3)
        {
          sub_1005D45F8(v5, objc_msgSend(v12, "path", v13), 0);
          if (sub_100E53DB4(v12))
          {
            unint64_t count = self->_count;
            sub_1005D4368(v12);
            -[CLHRequestArchive setCount:](self, "setCount:", count - v15);
          }
        }
      }

      id v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16, v13);
    }

    while (v9);
  }

  return sub_100E538F8(v5, 1);
}

- (void)iterateSecondaryData:(id)a3 forField:(unsigned int)a4 withHandler:(id)a5
{
  if ([a3 length])
  {
    id v8 = [[PBDataReader alloc] initWithData:a3];
    if ([v8 hasMoreData])
    {
      do
      {
        id v9 = objc_autoreleasePoolPush();
        [v8 readTag:&v13 type:&v12];
        if (v13 == a4 && v12 == 2)
        {
          id v11 = [v8 readData];
          if (v11) {
            (*((void (**)(id, id))a5 + 2))(a5, v11);
          }
        }

        objc_autoreleasePoolPop(v9);
      }

      while (([v8 hasMoreData] & 1) != 0);
    }
  }

- (void)generateNewSubArchive
{
  if (!-[CLHRequestArchive isActiveSubArchive](self, "isActiveSubArchive"))
  {
    id v3 = -[CLHRequestArchive secondaryFileURLs](self, "secondaryFileURLs");
    if ([v3 count])
    {
      if (qword_1019349B0 != -1) {
        dispatch_once(&qword_1019349B0, &stru_101888098);
      }
      uint64_t v4 = (os_log_s *)qword_1019349B8;
      if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_DEFAULT))
      {
        directory = self->_directory;
        *(_DWORD *)uint64_t buf = 68289283;
        int v21 = 0;
        __int16 v22 = 2082;
        __int16 v23 = "";
        __int16 v24 = 2113;
        uint64_t v25 = directory;
        _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#Warning Turning on sub-archiving on an archive with existing data erases existing data ., directory:%{private, location:escape_only}@}",  buf,  0x1Cu);
      }

      __int128 v18 = 0u;
      __int128 v19 = 0u;
      __int128 v16 = 0u;
      __int128 v17 = 0u;
      id v6 = [v3 countByEnumeratingWithState:&v16 objects:v28 count:16];
      if (v6)
      {
        id v7 = v6;
        uint64_t v8 = *(void *)v17;
        do
        {
          for (i = 0LL; i != v7; i = (char *)i + 1)
          {
            if (*(void *)v17 != v8) {
              objc_enumerationMutation(v3);
            }
            sub_100E53DB4(*(void **)(*((void *)&v16 + 1) + 8LL * (void)i));
          }

          id v7 = [v3 countByEnumeratingWithState:&v16 objects:v28 count:16];
        }

        while (v7);
      }
    }
  }

  unsigned int v10 = -[CLHRequestArchive isActiveSubArchive](self, "isActiveSubArchive");
  id v11 = self->_directory;
  if (v10) {
    id v11 = -[NSString stringByDeletingLastPathComponent](self->_directory, "stringByDeletingLastPathComponent");
  }
  char v12 = -[NSString stringByAppendingPathComponent:]( v11,  "stringByAppendingPathComponent:",  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"sub_%@",  -[NSUUID UUIDString](+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"), "UUIDString")));
  uint64_t v15 = 0LL;
  -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  v12,  1LL,  0LL,  &v15);
  if (v15)
  {
    if (qword_1019349B0 != -1) {
      dispatch_once(&qword_1019349B0, &stru_101888098);
    }
    int v13 = (os_log_s *)qword_1019349B8;
    if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)uint64_t buf = 68289539;
      int v21 = 0;
      __int16 v22 = 2082;
      __int16 v23 = "";
      __int16 v24 = 2113;
      uint64_t v25 = v12;
      __int16 v26 = 2113;
      uint64_t v27 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:failed to create sub-archive, path:%{private, location:escape_only}@, error:%{p rivate, location:escape_only}@}",  buf,  0x26u);
      if (qword_1019349B0 != -1) {
        dispatch_once(&qword_1019349B0, &stru_101888098);
      }
    }

    __int128 v14 = (os_log_s *)qword_1019349B8;
    if (os_signpost_enabled((os_log_t)qword_1019349B8))
    {
      *(_DWORD *)uint64_t buf = 68289539;
      int v21 = 0;
      __int16 v22 = 2082;
      __int16 v23 = "";
      __int16 v24 = 2113;
      uint64_t v25 = v12;
      __int16 v26 = 2113;
      uint64_t v27 = v15;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v14,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "failed to create sub-archive",  "{msg%{public}.0s:failed to create sub-archive, path:%{private, location:escape_only}@, error:%{p rivate, location:escape_only}@}",  buf,  0x26u);
    }
  }

  self->_double rotationInterval = 1800.0;
  self->_double lastRotationTime = CFAbsoluteTimeGetCurrent();
  -[CLHRequestArchive setSecondaryPath:](self, "setSecondaryPath:", 0LL);

  self->_directory = v12;
  self->_unint64_t count = 0LL;
}

- (void)iterateSubArchivesWithHandler:(id)a3
{
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = -[CLHRequestArchive inactiveSubArchives](self, "inactiveSubArchives", 0LL);
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        unsigned int v10 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        id v11 = [v10 count];
        (*((void (**)(id, void *))a3 + 2))(a3, v10);
        unint64_t v12 = self->_totalCount + (_BYTE *)[v10 count] - v11;
        if ((v12 & 0x80000000) == 0) {
          self->_unint64_t totalCount = v12;
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v7);
  }

  (*((void (**)(id, CLHRequestArchive *))a3 + 2))(a3, self);
}

- (BOOL)deleteSubArchiveIfInactive:(id)a3
{
  if (!-[NSString hasPrefix:]( -[NSString lastPathComponent](self->_directory, "lastPathComponent"),  "hasPrefix:",  @"sub"))
  {
    if (qword_1019349B0 != -1) {
      dispatch_once(&qword_1019349B0, &stru_101888098);
    }
    id v7 = (os_log_s *)qword_1019349B8;
    if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_FAULT))
    {
      uint64_t v8 = -[NSString UTF8String](self->_directory, "UTF8String");
      int v17 = 68289282;
      int v18 = 0;
      __int16 v19 = 2082;
      __int128 v20 = "";
      __int16 v21 = 2082;
      __int16 v22 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#SubArchiving delete inactive. receiver not sub-archive, receiver:%{public, locatio n:escape_only}s}",  (uint8_t *)&v17,  0x1Cu);
      if (qword_1019349B0 != -1) {
        dispatch_once(&qword_1019349B0, &stru_101888098);
      }
    }

    uint64_t v9 = qword_1019349B8;
    if (!os_signpost_enabled((os_log_t)qword_1019349B8)) {
      return 0;
    }
    unsigned int v10 = -[NSString UTF8String](self->_directory, "UTF8String");
    int v17 = 68289282;
    int v18 = 0;
    __int16 v19 = 2082;
    __int128 v20 = "";
    __int16 v21 = 2082;
    __int16 v22 = v10;
    id v11 = "#SubArchiving delete inactive. receiver not sub-archive";
    unint64_t v12 = "{msg%{public}.0s:#SubArchiving delete inactive. receiver not sub-archive, receiver:%{public, locat"
          "ion:escape_only}s}";
    __int128 v13 = (os_log_s *)v9;
LABEL_20:
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v13,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  v11,  v12,  (uint8_t *)&v17,  0x1Cu);
    return 0;
  }

  if ((objc_msgSend( objc_msgSend(objc_msgSend(a3, "directory"), "lastPathComponent"),  "hasPrefix:",  @"sub") & 1) == 0)
  {
    if (qword_1019349B0 != -1) {
      dispatch_once(&qword_1019349B0, &stru_101888098);
    }
    __int128 v14 = (os_log_s *)qword_1019349B8;
    if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_FAULT))
    {
      int v17 = 68289282;
      int v18 = 0;
      __int16 v19 = 2082;
      __int128 v20 = "";
      __int16 v21 = 2082;
      __int16 v22 = (const char *)objc_msgSend(objc_msgSend(a3, "directory"), "UTF8String");
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#SubArchiving delete inactive. archiveToDelete not sub-archive, archiveToDelete:%{p ublic, location:escape_only}s}",  (uint8_t *)&v17,  0x1Cu);
      if (qword_1019349B0 != -1) {
        dispatch_once(&qword_1019349B0, &stru_101888098);
      }
    }

    uint64_t v15 = qword_1019349B8;
    if (!os_signpost_enabled((os_log_t)qword_1019349B8)) {
      return 0;
    }
    __int128 v16 = (const char *)objc_msgSend(objc_msgSend(a3, "directory"), "UTF8String");
    int v17 = 68289282;
    int v18 = 0;
    __int16 v19 = 2082;
    __int128 v20 = "";
    __int16 v21 = 2082;
    __int16 v22 = v16;
    id v11 = "#SubArchiving delete inactive. archiveToDelete not sub-archive";
    unint64_t v12 = "{msg%{public}.0s:#SubArchiving delete inactive. archiveToDelete not sub-archive, archiveToDelete:%"
          "{public, location:escape_only}s}";
    __int128 v13 = (os_log_s *)v15;
    goto LABEL_20;
  }

  if (!-[NSString isEqualToString:]( -[NSString lastPathComponent](self->_directory, "lastPathComponent"),  "isEqualToString:",  objc_msgSend(objc_msgSend(a3, "directory"), "lastPathComponent")))
  {
    id v5 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", [a3 directory]);
    if (v5) {
      return sub_100E53DB4(v5);
    }
  }

  return 0;
}

- (BOOL)isActiveSubArchive
{
  return -[NSString hasPrefix:]( -[NSString lastPathComponent](-[CLHRequestArchive directory](self, "directory"), "lastPathComponent"),  "hasPrefix:",  @"sub_");
}

- (id)inactiveSubArchives
{
  if (!-[CLHRequestArchive isActiveSubArchive](self, "isActiveSubArchive")) {
    sub_101274514();
  }
  id v3 = -[NSArray filteredArrayUsingPredicate:]( sub_100E55740((uint64_t)-[NSString stringByDeletingLastPathComponent]( self->_directory,  "stringByDeletingLastPathComponent")),  "filteredArrayUsingPredicate:",  +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"self.lastPathComponent BEGINSWITH 'sub_'"));
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)v8);
        if (!-[NSString isEqualToString:]( -[NSString lastPathComponent](self->_directory, "lastPathComponent"),  "isEqualToString:",  [v9 lastPathComponent]))
        {
          unsigned int v10 = -[CLHRequestArchive initWithDirectory:requestCode:]( [CLHRequestArchive alloc],  "initWithDirectory:requestCode:",  [v9 path],  self->_requestCode);
          -[NSMutableArray addObject:](v4, "addObject:", v10);
        }

        uint64_t v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v6);
  }

  return v4;
}

- (void)updateCount
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v3 = -[CLHRequestArchive secondaryFileURLs](self, "secondaryFileURLs", 0LL);
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    int v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        sub_1005D4368(*(void **)(*((void *)&v11 + 1) + 8LL * (void)i));
        v6 += v9;
      }

      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v5);
    uint64_t v10 = v6;
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  -[CLHRequestArchive setCount:](self, "setCount:", v10);
}

- (id)pathForPrimaryData
{
  return -[NSString stringByAppendingPathComponent:]( self->_directory,  "stringByAppendingPathComponent:",  @"primary");
}

- (id)pathForSecondaryData
{
  *(double *)&uint64_t v3 = CFAbsoluteTimeGetCurrent();
  return -[NSString stringByAppendingPathComponent:]( self->_directory,  "stringByAppendingPathComponent:",  sub_1005D437C(v3, 0LL));
}

- (id)secondaryFileURLs
{
  return -[NSArray sortedArrayUsingComparator:]( -[NSArray filteredArrayUsingPredicate:]( sub_100E55740((uint64_t)self->_directory),  "filteredArrayUsingPredicate:",  +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"self.lastPathComponent BEGINSWITH 'secondary-'")),  "sortedArrayUsingComparator:",  &stru_101888018);
}

- (unint64_t)totalSecondaryPointsUnderAllSubArchives
{
  context = objc_autoreleasePoolPush();
  uint64_t v3 = +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"self.lastPathComponent BEGINSWITH 'sub_'");
  id v4 = +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"self.lastPathComponent BEGINSWITH 'secondary-'");
  __int128 v20 = self;
  id v5 = -[NSArray filteredArrayUsingPredicate:]( sub_100E55740((uint64_t)self->_directory),  "filteredArrayUsingPredicate:",  v3);
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v26,  v39,  16LL);
  if (v6)
  {
    id v7 = v6;
    unint64_t v8 = 0LL;
    uint64_t v9 = *(void *)v27;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v5);
        }
        __int128 v11 = -[NSArray filteredArrayUsingPredicate:]( sub_100E55740((uint64_t)objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * (void)i), "path", v20)),  "filteredArrayUsingPredicate:",  v4);
        __int128 v22 = 0u;
        __int128 v23 = 0u;
        __int128 v24 = 0u;
        __int128 v25 = 0u;
        id v12 = -[NSArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v22,  v38,  16LL);
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v23;
          do
          {
            for (j = 0LL; j != v13; j = (char *)j + 1)
            {
              if (*(void *)v23 != v14) {
                objc_enumerationMutation(v11);
              }
              sub_1005D4368(*(void **)(*((void *)&v22 + 1) + 8LL * (void)j));
              v8 += v16;
            }

            id v13 = -[NSArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v22,  v38,  16LL);
          }

          while (v13);
        }
      }

      id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v26,  v39,  16LL);
    }

    while (v7);
  }

  else
  {
    unint64_t v8 = 0LL;
  }

  objc_autoreleasePoolPop(context);
  if (qword_1019349B0 != -1) {
    dispatch_once(&qword_1019349B0, &stru_101888098);
  }
  int v17 = (os_log_s *)qword_1019349B8;
  if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_DEBUG))
  {
    directory = v20->_directory;
    *(_DWORD *)uint64_t buf = 68289538;
    int v31 = 0;
    __int16 v32 = 2082;
    id v33 = "";
    __int16 v34 = 2114;
    uint64_t v35 = directory;
    __int16 v36 = 1026;
    int v37 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:totalSecondaryPointsUnderAllSubArchives, archive:%{public, location:escape_only}@,  totalCount:%{public}d}",  buf,  0x22u);
  }

  return v8;
}

- (void)eraseAllData
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  uint64_t v3 = sub_100E55740((uint64_t)self->_directory);
  id v4 = -[NSArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        sub_100E53DB4(*(void **)(*((void *)&v8 + 1) + 8LL * (void)v7));
        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
    }

    while (v5);
  }

  -[CLHRequestArchive setCount:](self, "setCount:", 0LL, (void)v8);
}

- (id)jsonObject
{
  v5[0] = @"identifier";
  uint64_t v3 = -[NSString lastPathComponent](self->_directory, "lastPathComponent");
  v5[1] = @"count";
  v6[0] = v3;
  v6[1] = +[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", self->_count);
  return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v6,  v5,  2LL);
}

- (double)rotationInterval
{
  return self->_rotationInterval;
}

- (void)setRotationInterval:(double)a3
{
  self->_double rotationInterval = a3;
}

- (unsigned)requestCode
{
  return self->_requestCode;
}

- (NSString)secondaryPath
{
  return self->_secondaryPath;
}

- (void)setSecondaryPath:(id)a3
{
}

- (void)setSecondaryFileHandle:(id)a3
{
}

- (unint64_t)totalCount
{
  return self->_totalCount;
}

- (void)setTotalCount:(unint64_t)a3
{
  self->_unint64_t totalCount = a3;
}

@end