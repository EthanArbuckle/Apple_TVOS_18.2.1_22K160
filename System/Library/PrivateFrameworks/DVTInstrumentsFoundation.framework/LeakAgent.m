@interface LeakAgent
- (LeakAgent)initWithTask:(unsigned int)a3 pid:(int)a4;
- (id)getSerializedGraphWithFullDiskStackLogs:(id)a3 serializedGraph:(id)a4 error:(id *)a5;
- (id)logAndGenerateReceiptForErrorWithFormat:(id)a3;
- (id)mallocStackLogForAddress:(id)a3 size:(id)a4 isLiteZone:(id)a5;
- (id)serializedGraphWithOptions:(id)a3;
- (id)vmRegionStackLogForAddress:(id)a3 size:(id)a4;
- (void)dealloc;
@end

@implementation LeakAgent

- (LeakAgent)initWithTask:(unsigned int)a3 pid:(int)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___LeakAgent;
  result = -[LeakAgent init](&v7, "init");
  if (result)
  {
    result->_targetTask = a3;
    result->_targetPid = a4;
  }

  return result;
}

- (void)dealloc
{
  mach_port_name_t targetTask = self->_targetTask;
  if (targetTask + 1 >= 2)
  {
    mach_port_deallocate(mach_task_self_, targetTask);
    self->_mach_port_name_t targetTask = 0;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___LeakAgent;
  -[LeakAgent dealloc](&v4, "dealloc");
}

- (id)getSerializedGraphWithFullDiskStackLogs:(id)a3 serializedGraph:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v47 = 0LL;
  if (a5) {
    v9 = a5;
  }
  else {
    v9 = (id *)&v47;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue([v7 stackLogReader]);

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 temporaryDirectory]);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 UUIDString]);
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.memgraph",  v14));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v12 URLByAppendingPathComponent:v15]);

    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472LL;
    v45[2] = sub_1000028C0;
    v45[3] = &unk_100008360;
    id v17 = v16;
    id v46 = v17;
    v18 = objc_retainBlock(v45);
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472LL;
    v42[2] = sub_1000029D0;
    v42[3] = &unk_100008388;
    id v19 = v17;
    id v43 = v19;
    v20 = v18;
    id v44 = v20;
    v21 = objc_retainBlock(v42);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    v23 = (void *)objc_claimAutoreleasedReturnValue([v19 path]);
    [v22 createFileAtPath:v23 contents:0 attributes:0];

    v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSFileHandle fileHandleForWritingToURL:error:]( &OBJC_CLASS___NSFileHandle,  "fileHandleForWritingToURL:error:",  v19,  v9));
    v25 = v24;
    if (!v24)
    {
      ((void (*)(void *, const char *, id))v20[2])(v20, "create", *v9);
      id v30 = 0LL;
LABEL_21:

      goto LABEL_22;
    }

    [v24 truncateFileAtOffset:0];
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472LL;
    v40[2] = sub_100002A64;
    v40[3] = &unk_1000083B0;
    id v41 = v7;
    unsigned __int8 v26 = +[VMUDirectedGraph encapsulateData:to:withSupplementalDataTag:error:dataGeneratorBlock:]( &OBJC_CLASS___VMUDirectedGraph,  "encapsulateData:to:withSupplementalDataTag:error:dataGeneratorBlock:",  v8,  v25,  "DISKLOGS",  v9,  v40);
    [v25 closeFile];
    if ((v26 & 1) == 0)
    {
      if (!*v9)
      {
        NSErrorUserInfoKey v48 = NSLocalizedDescriptionKey;
        v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"failed to write memgraph with full disk stack logs with unknown error"));
        v49 = v35;
        v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v49,  &v48,  1LL));
        id *v9 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"LeakAgent",  -1LL,  v36));
      }

      ((void (*)(void *, const char *))v20[2])(v20, "write to");
      id v37 = (id)((uint64_t (*)(void *))v21[2])(v21);
      id v30 = 0LL;
      goto LABEL_20;
    }

    v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfURL:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfURL:options:error:",  v19,  1LL,  v9));
    if (v27)
    {
      uint64_t v28 = ((uint64_t (*)(void *))v21[2])(v21);
      id v29 = (id)objc_claimAutoreleasedReturnValue(v28);
      id *v9 = v29;
      if (!v29)
      {
        id v30 = v27;
LABEL_19:

LABEL_20:
        goto LABEL_21;
      }
    }

    else
    {
      ((void (*)(void *, const char *, id))v20[2])(v20, "read from", *v9);
      id v38 = (id)((uint64_t (*)(void *))v21[2])(v21);
    }

    id v30 = 0LL;
    goto LABEL_19;
  }

  NSErrorUserInfoKey v52 = NSLocalizedDescriptionKey;
  v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@",  @"stack log reader not present in memgraph, so can't save memgraph with full disk stack logs"));
  v53 = v31;
  v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v53,  &v52,  1LL));
  id *v9 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"LeakAgent",  -1LL,  v32));

  id v33 = sub_100002880();
  id v19 = (id)objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR))
  {
    id v34 = objc_msgSend( @"stack log reader not present in memgraph, so can't save memgraph with full disk stack logs",  "UTF8String");
    *(_DWORD *)buf = 136315138;
    id v51 = v34;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v19, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
  }

  id v30 = 0LL;
LABEL_22:

  return v30;
}

- (id)logAndGenerateReceiptForErrorWithFormat:(id)a3
{
  id v4 = a3;
  v5 = -[NSString initWithFormat:arguments:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:arguments:", v4, &v21);

  id v6 = sub_100002880();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int targetPid = self->_targetPid;
    *(_DWORD *)buf = 67109378;
    int v18 = targetPid;
    __int16 v19 = 2112;
    v20 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Failed to generate memory graph for pid %u: %@",  buf,  0x12u);
  }

  v9 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Failed to generate memory graph for pid %u: %@",  self->_targetPid,  v5);
  v10 = (void *)objc_opt_new(&OBJC_CLASS___DTXRemoteInvocationReceipt);
  v11 = objc_alloc(&OBJC_CLASS___NSError);
  NSErrorUserInfoKey v15 = NSLocalizedDescriptionKey;
  v16 = v9;
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
  v13 = -[NSError initWithDomain:code:userInfo:](v11, "initWithDomain:code:userInfo:", @"LeakAgent", -1LL, v12);

  [v10 invokeCompletionWithReturnValue:0 error:v13];
  return v10;
}

- (id)serializedGraphWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = sub_100002880();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int targetPid = self->_targetPid;
    unsigned int targetTask = self->_targetTask;
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v138 = targetPid;
    *(_WORD *)&v138[4] = 1024;
    *(_DWORD *)&v138[6] = targetTask;
    __int16 v139 = 2112;
    v140[0] = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "requested memgraph for %u (%#x) with options: %@",  buf,  0x18u);
  }

  id v9 = sub_100002880();
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v10,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "Request memgraph",  (const char *)&unk_1000074FF,  buf,  2u);
  }

  if (self->_targetTask + 1 > 1)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"LeakedCount"]);
    unsigned int v114 = [v12 BOOLValue];

    v13 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"LeakedAddresses"]);
    unsigned int v119 = [v13 BOOLValue];

    v14 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"MarkedCount"]);
    unsigned int v113 = [v14 BOOLValue];

    NSErrorUserInfoKey v15 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"MarkedAddresses"]);
    unsigned int v115 = [v15 BOOLValue];

    v16 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"AnalyzeCorpse"]);
    v121 = v16;
    if (v16) {
      unsigned int v17 = [v16 BOOLValue];
    }
    else {
      unsigned int v17 = 0;
    }
    int v18 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"LeakedGraphOnly"]);
    unsigned int v118 = [v18 BOOLValue];

    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"CompressionOption"]);
    id v120 = 0LL;
    uint64_t v132 = 0LL;
    v133 = &v132;
    uint64_t v134 = 0x2020000000LL;
    int v135 = 0;
    if (v119)
    {
      id v120 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"RegionDescriptionOptions"]);

    if (v20)
    {
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"RegionDescriptionOptions"]);
      id v22 = [v21 unsignedLongValue];
    }

    else
    {
      if ((v118 & 1) == 0)
      {
        id v22 = (id)(VMUGetFlagsForAllVMRegionStatistics() | 0xC000);
        if (v19) {
          goto LABEL_17;
        }
        goto LABEL_19;
      }

      id v22 = 0LL;
    }

    if (v19)
    {
LABEL_17:
      BOOL v23 = (int)[v19 intValue] > 0;
      goto LABEL_20;
    }

- (id)mallocStackLogForAddress:(id)a3 size:(id)a4 isLiteZone:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_targetTask + 1 <= 1)
  {
    id v28 = sub_100002880();
    id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      int targetPid = self->_targetPid;
      unsigned int targetTask = self->_targetTask;
      *(_DWORD *)buf = 67109376;
      int v41 = targetPid;
      __int16 v42 = 1024;
      unsigned int v43 = targetTask;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "no valid task available for target: %u (%#x)",  buf,  0xEu);
    }

    exit(4);
  }

  uint64_t v11 = v10;
  if (self->_stackLogReader
    || (v12 = -[VMUTaskStackLogReader initWithTask:]( objc_alloc(&OBJC_CLASS___VMUTaskStackLogReader),  "initWithTask:",  self->_targetTask),  stackLogReader = self->_stackLogReader,  self->_stackLogReader = v12,  stackLogReader,  self->_stackLogReader))
  {
    v14 = (char *)[v8 unsignedLongLongValue];
    id v15 = [v9 unsignedLongLongValue];
    id v16 = [v11 BOOLValue];
    task_start_peeking(self->_targetTask);
    id v17 = -[VMUTaskStackLogReader getFramesForAddress:size:inLiteZone:stackFramesBuffer:]( self->_stackLogReader,  "getFramesForAddress:size:inLiteZone:stackFramesBuffer:",  v14,  v15,  v16,  buf);
    task_stop_peeking(self->_targetTask);
    if (v17 == (id)-1LL)
    {
      id v24 = sub_100002880();
      id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        unsigned __int8 v26 = "NO";
        int v32 = 134218754;
        id v33 = v14;
        __int16 v34 = 2048;
        if ((_DWORD)v16) {
          unsigned __int8 v26 = "YES";
        }
        v35 = &v14[(void)v15];
        __int16 v36 = 2048;
        id v37 = v15;
        __int16 v38 = 2080;
        v39 = v26;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_INFO,  "unable to get malloc stack log for %#llx-%#llx [%llu] (liteZone: %s)",  (uint8_t *)&v32,  0x2Au);
      }

      __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
    }

    else
    {
      uint64_t v18 = (uint64_t)v17
          - (((uint64_t)v17 > 0) & ~-[VMUTaskStackLogReader usesLiteMode]( self->_stackLogReader,  "usesLiteMode"));
      __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", v18));
      if (v18 >= 1)
      {
        uint64_t v20 = 0LL;
        unsigned int v21 = 1;
        do
        {
          id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *(void *)&buf[8 * v20]));
          [v19 setObject:v22 atIndexedSubscript:v20];

          uint64_t v20 = v21;
        }

        while (v18 > v21++);
      }
    }
  }

  else
  {
    __int16 v19 = 0LL;
  }

  return v19;
}

- (id)vmRegionStackLogForAddress:(id)a3 size:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_targetTask + 1 <= 1)
  {
    id v31 = sub_100002880();
    int v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      int targetPid = self->_targetPid;
      unsigned int targetTask = self->_targetTask;
      *(_DWORD *)buf = 67109376;
      int v42 = targetPid;
      __int16 v43 = 1024;
      unsigned int v44 = targetTask;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_ERROR,  "no valid task available for target: %u (%#x)",  buf,  0xEu);
    }

    exit(4);
  }

  id v8 = v7;
  if (self->_stackLogReader
    || (id v9 = -[VMUTaskStackLogReader initWithTask:]( objc_alloc(&OBJC_CLASS___VMUTaskStackLogReader),  "initWithTask:",  self->_targetTask),  v10 = self->_stackLogReader,  self->_stackLogReader = v9,  v10,  self->_stackLogReader))
  {
    uint64_t v11 = (char *)[v6 unsignedLongLongValue];
    id v12 = [v8 unsignedLongLongValue];
    unsigned int v13 = -[VMUTaskStackLogReader usesLiteMode](self->_stackLogReader, "usesLiteMode");
    stackLogReader = self->_stackLogReader;
    if (v13)
    {
      uint64_t uniquing_table_index = msl_payload_get_uniquing_table_index( -[VMUTaskStackLogReader liteMSLPayloadforVMregionAddress:]( stackLogReader,  "liteMSLPayloadforVMregionAddress:",  v11));
    }

    else
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[VMUTaskStackLogReader regionTracker](stackLogReader, "regionTracker"));
      id v17 = v16;
      if (v16)
      {
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "vmRegionRangeInfoForRange:", v11, v12));
        uint64_t uniquing_table_index = (uint64_t)[v18 stackIdentifier];
      }

      else
      {
        uint64_t uniquing_table_index = -1LL;
      }
    }

    if (uniquing_table_index == -1
      || (id v19 = -[VMUTaskStackLogReader getFramesForStackID:stackFramesBuffer:]( self->_stackLogReader,  "getFramesForStackID:stackFramesBuffer:",  uniquing_table_index,  buf),  v19 == (id)-1LL))
    {
      id v28 = sub_100002880();
      id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        int v35 = 134218496;
        __int16 v36 = v11;
        __int16 v37 = 2048;
        __int16 v38 = &v11[(void)v12];
        __int16 v39 = 2048;
        id v40 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_INFO,  "unable to get VM region stack log for %#llx-%#llx [%llu]",  (uint8_t *)&v35,  0x20u);
      }

      BOOL v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
    }

    else
    {
      uint64_t v20 = (uint64_t)v19;
      LODWORD(v21) = -[VMUTaskStackLogReader usesLiteMode](self->_stackLogReader, "usesLiteMode") ^ 1;
      if (v20 > 0) {
        uint64_t v21 = v21;
      }
      else {
        uint64_t v21 = 0LL;
      }
      uint64_t v22 = v20 - v21;
      BOOL v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( &OBJC_CLASS___NSMutableArray,  "arrayWithCapacity:",  v20 - v21));
      if (v22 >= 1)
      {
        uint64_t v24 = 0LL;
        unsigned int v25 = 1;
        do
        {
          unsigned __int8 v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *(void *)&buf[8 * v24]));
          [v23 setObject:v26 atIndexedSubscript:v24];

          uint64_t v24 = v25;
        }

        while (v22 > v25++);
      }
    }
  }

  else
  {
    BOOL v23 = 0LL;
  }

  return v23;
}

- (void).cxx_destruct
{
}

@end