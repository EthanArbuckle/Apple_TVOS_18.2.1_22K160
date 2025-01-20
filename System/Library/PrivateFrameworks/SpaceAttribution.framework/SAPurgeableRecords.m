@interface SAPurgeableRecords
+ (id)newWithActivity:(id)a3 withRunMode:(unint64_t)a4;
- (NSDictionary)SUPurgeableUrgencyData;
- (OS_dispatch_group)group;
- (OS_dispatch_queue)queue;
- (SAActivity)activity;
- (SAPurgeableRecords)initWithActivity:(id)a3 withRunMode:(unint64_t)a4;
- (unint64_t)mode;
- (unsigned)waitForProcessingSUPurgeableUrgencyFiles;
- (void)asyncStartProcessingSUPurgeableUrgencyFilesUsingPathList:(id)a3 andDirKeyCacheList:(id)a4;
- (void)processAttributionTagsPurgeableWithReply:(id)a3;
- (void)setActivity:(id)a3;
- (void)setGroup:(id)a3;
- (void)setMode:(unint64_t)a3;
- (void)setQueue:(id)a3;
- (void)setSUPurgeableUrgencyData:(id)a3;
@end

@implementation SAPurgeableRecords

- (SAPurgeableRecords)initWithActivity:(id)a3 withRunMode:(unint64_t)a4
{
  id v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___SAPurgeableRecords;
  v8 = -[SAPurgeableRecords init](&v15, "init");
  if (v8)
  {
    dispatch_group_t v9 = dispatch_group_create();
    group = v8->_group;
    v8->_group = (OS_dispatch_group *)v9;

    dispatch_queue_global_t global_queue = dispatch_get_global_queue(2LL, 0LL);
    uint64_t v12 = objc_claimAutoreleasedReturnValue(global_queue);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v8->_activity, a3);
    v8->_mode = a4;
  }

  return v8;
}

+ (id)newWithActivity:(id)a3 withRunMode:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [objc_alloc((Class)a1) initWithActivity:v6 withRunMode:a4];

  return v7;
}

- (void)asyncStartProcessingSUPurgeableUrgencyFilesUsingPathList:(id)a3 andDirKeyCacheList:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  group = self->_group;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100023D80;
  block[3] = &unk_10004D1C0;
  id v13 = v7;
  v14 = self;
  id v15 = v6;
  id v10 = v6;
  id v11 = v7;
  dispatch_group_async((dispatch_group_t)group, (dispatch_queue_t)queue, block);
}

- (unsigned)waitForProcessingSUPurgeableUrgencyFiles
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(+[SAAppSizerScan appSizerScan](&OBJC_CLASS___SAAppSizerScan, "appSizerScan"));
  v4 = (void *)v3;
  unint64_t mode = self->_mode;
  if (mode == 2)
  {
    group = self->_group;
    dispatch_time_t v13 = dispatch_time(0LL, 60000000000LL);
    dispatch_group_wait((dispatch_group_t)group, v13);
LABEL_8:
    unsigned __int8 v14 = 0;
  }

  else if (mode == 1)
  {
    while (1)
    {
      id v6 = self->_group;
      dispatch_time_t v7 = dispatch_time(0LL, 2000000000LL);
      uint64_t v8 = dispatch_group_wait((dispatch_group_t)v6, v7);
      dispatch_group_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SAPurgeableRecords activity](self, "activity"));
      unsigned int v10 = [v9 shouldDefer];

      if (v10) {
        break;
      }
      if ([v4 runMode] == (id)2)
      {
        uint64_t v19 = SALog(2LL);
        v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          int v24 = 136315138;
          v25 = "-[SAPurgeableRecords waitForProcessingSUPurgeableUrgencyFiles]";
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%s: Activity interrupted, stopping",  (uint8_t *)&v24,  0xCu);
        }

        unsigned __int8 v14 = 4;
        goto LABEL_18;
      }

      if (!v8) {
        goto LABEL_8;
      }
    }

    uint64_t v17 = SALog(v11);
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 136315138;
      v25 = "-[SAPurgeableRecords waitForProcessingSUPurgeableUrgencyFiles]";
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%s: Activity should defer, stopping",  (uint8_t *)&v24,  0xCu);
    }

    unsigned __int8 v14 = 2;
LABEL_18:

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SAPurgeableRecords activity](self, "activity"));
    [v20 setShouldStop:1];

    v21 = self->_group;
    dispatch_time_t v22 = dispatch_time(0LL, 60000000000LL);
    dispatch_group_wait((dispatch_group_t)v21, v22);
  }

  else
  {
    uint64_t v15 = SALog(v3);
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_1000332C4(v4, v16);
    }

    unsigned __int8 v14 = 3;
  }

  return v14;
}

- (void)processAttributionTagsPurgeableWithReply:(id)a3
{
  id v44 = a3;
  v52 = (void *)objc_claimAutoreleasedReturnValue(+[SAAppSizerScan appSizerScan](&OBJC_CLASS___SAAppSizerScan, "appSizerScan"));
  v43 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  id v3 = [&off_10004FC90 countByEnumeratingWithState:&v60 objects:v74 count:16];
  id v45 = v3;
  uint64_t v5 = 0LL;
  uint64_t v6 = 0LL;
  if (v3)
  {
    uint64_t v46 = *(void *)v61;
    *(void *)&__int128 v4 = 67109634LL;
    __int128 v42 = v4;
    while (1)
    {
      uint64_t v7 = 0LL;
LABEL_4:
      if (*(void *)v61 != v46) {
        objc_enumerationMutation(&off_10004FC90);
      }
      uint64_t v8 = *(void **)(*((void *)&v60 + 1) + 8 * v7);
      uint64_t v9 = SALog(v3);
      unsigned int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "-[SAPurgeableRecords processAttributionTagsPurgeableWithReply:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v8;
        _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s for %@", buf, 0x16u);
      }

      uint64_t v11 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
      v51 = (char *)[v8 fileSystemRepresentation];
      uint64_t v12 = (char *)malloc(0x8000uLL);
      if (!v12) {
        break;
      }
      uint64_t v47 = v7;
      v48 = v12;
      __int128 v71 = 0u;
      __int128 v72 = 0u;
      *(void *)&buf[8] = 0LL;
      v73 = v12;
      v49 = (uint64_t *)(v12 + 56);
      *(void *)&buf[16] = 512LL;
      *(void *)buf = 10LL;
      while (1)
      {
        dispatch_time_t v13 = objc_autoreleasePoolPush();
        gettimeofday(&v59, 0LL);
        if ([v52 shouldDefer:self->_mode activity:self->_activity])
        {
          free(v48);
          objc_autoreleasePoolPop(v13);
          goto LABEL_30;
        }

        uint64_t v14 = fsctl(v51, 0xC0404A83uLL, buf, 0);
        if ((_DWORD)v14) {
          break;
        }
        uint64_t v57 = v5;
        gettimeofday(&v58, 0LL);
        __darwin_time_t tv_sec = v59.tv_sec;
        __darwin_time_t v54 = v58.tv_sec;
        unint64_t v15 = *((void *)&v72 + 1);
        uint64_t tv_usec = v59.tv_usec;
        uint64_t v56 = v58.tv_usec;
        if (*((void *)&v72 + 1))
        {
          unint64_t v16 = 0LL;
          uint64_t v17 = v49;
          do
          {
            uint64_t v18 = *v17;
            if (*v17 && (*((_BYTE *)v17 - 47) & 0xC0) == 0)
            {
              uint64_t v19 = (char *)*(v17 - 1);
              v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *v17));
              v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v20));

              if (v21) {
                dispatch_time_t v22 = &v19[(void)[v21 unsignedLongLongValue]];
              }
              else {
                dispatch_time_t v22 = v19;
              }
              v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v22,  v42));
              int v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v18));
              -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v23, v24);

              unint64_t v15 = *((void *)&v72 + 1);
            }

            ++v16;
            v17 += 8;
          }

          while (v15 > v16);
        }

        uint64_t v5 = v57 - tv_usec + v56 + 1000000 * (v54 - tv_sec);
        v6 += v15;
        objc_autoreleasePoolPop(v13);
        if (!(void)v72) {
          goto LABEL_26;
        }
      }

      int v25 = v14;
      uint64_t v26 = SALog(v14);
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        int v28 = *__error();
        v29 = __error();
        v30 = strerror(*v29);
        *(_DWORD *)v64 = v42;
        int v65 = v25;
        __int16 v66 = 1024;
        int v67 = v28;
        __int16 v68 = 2080;
        v69 = v30;
        _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "err %d, errno %d %s", v64, 0x18u);
      }

      objc_autoreleasePoolPop(v13);
LABEL_26:
      free(v48);

      uint64_t v7 = v47 + 1;
      if ((id)(v47 + 1) != v45) {
        goto LABEL_4;
      }
      id v3 = [&off_10004FC90 countByEnumeratingWithState:&v60 objects:v74 count:16];
      id v45 = v3;
      if (!v3) {
        goto LABEL_28;
      }
    }

    uint64_t v33 = SALog(0LL);
    v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      sub_100033254(v34, v35, v36, v37, v38, v39, v40, v41);
    }

LABEL_30:
    v32 = v43;
    v31 = v44;
  }

  else
  {
LABEL_28:
    v32 = v43;
    v31 = v44;
    (*((void (**)(id, NSMutableDictionary *, uint64_t, uint64_t))v44 + 2))(v44, v43, v5, v6);
  }
}

- (NSDictionary)SUPurgeableUrgencyData
{
  return (NSDictionary *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setSUPurgeableUrgencyData:(id)a3
{
}

- (SAActivity)activity
{
  return (SAActivity *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setActivity:(id)a3
{
}

- (OS_dispatch_group)group
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setGroup:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setQueue:(id)a3
{
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_unint64_t mode = a3;
}

- (void).cxx_destruct
{
}

@end