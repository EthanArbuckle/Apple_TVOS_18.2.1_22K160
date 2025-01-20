@interface PanicReport
- (PanicReport)initWithPanicString:(id)a3 otherString:(id)a4 buildVersion:(id)a5 panicFlags:(unint64_t)a6 panicType:(id)a7 incidentID:(id)a8 rootsInstalled:(id)a9;
- (id)additionalIPSMetadata;
- (id)appleCareDetails;
- (id)createUUIDString:(unsigned int)a3;
- (id)getBuildVersionString;
- (id)incidentID;
- (id)logType;
- (id)panicString;
- (id)parseExtPaniclog;
- (id)problemType;
- (id)reportNamePrefix;
- (void)generateLogAtLevel:(BOOL)a3 withBlock:(id)a4;
- (void)processExtPaniclogFlags:(unsigned int)a3 data_id:(id)a4 data:(id)a5 additionalBuffers:(id)a6 addToExtPaniclog:(BOOL *)a7;
- (void)setForegroundAppHash:(id)a3;
- (void)setPanicInitiator:(id)a3;
- (void)setPanicString:(id)a3;
- (void)setSOCIdAndRev;
- (void)setUtilizationInfo:(id)a3;
- (void)useExtPaniclog:(id)a3;
- (void)useSocdContainer:(id)a3;
- (void)useSocdNandContainer:(id)a3;
- (void)useStoragePanicData:(id)a3;
@end

@implementation PanicReport

- (PanicReport)initWithPanicString:(id)a3 otherString:(id)a4 buildVersion:(id)a5 panicFlags:(unint64_t)a6 panicType:(id)a7 incidentID:(id)a8 rootsInstalled:(id)a9
{
  id v30 = a3;
  id v29 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  uint64_t v33 = 0LL;
  v20 = (PanicReport *)-[PanicReport initForPid:process:withReason:exceptionCode:exceptionCodeCount:stackshotFlags:]( self,  "initForPid:process:withReason:exceptionCode:exceptionCodeCount:stackshotFlags:",  0LL,  0LL,  0LL,  &v33,  1LL,  0LL);
  v21 = v20;
  if (v20)
  {
    if (v18) {
      -[PanicReport setIncidentID:](v20, "setIncidentID:", v18, v29, v30);
    }
    objc_storeStrong((id *)&v21->_panicString, a3);
    objc_storeStrong((id *)&v21->_otherString, a4);
    objc_storeStrong((id *)&v21->_buildVersion, a5);
    v21->_panicFlags = a6;
    v21->_isBtnReset = (a6 & 0x80) != 0;
    v21->_isInterruptedCoredump = [v17 isEqual:@"interrupted coredump panic"];
    objc_storeStrong((id *)&v21->_rootsInstalled, a9);
    if (&_AnalyticsSendEventLazy)
    {
      if (v21->_isBtnReset)
      {
        AnalyticsSendEventLazy(@"com.apple.coreOS.forceReset", &stru_100030D68);
      }

      else
      {
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472LL;
        v31[2] = sub_100023358;
        v31[3] = &unk_100030D90;
        id v32 = v17;
        AnalyticsSendEventLazy(@"com.apple.stability.panic", v31);
      }
    }

    socdContainerArray = v21->_socdContainerArray;
    v21->_socdContainerArray = 0LL;

    socdNandContainer = v21->_socdNandContainer;
    v21->_socdNandContainer = 0LL;

    extPaniclog = v21->_extPaniclog;
    v21->_extPaniclog = 0LL;

    panicInitiator = v21->_panicInitiator;
    v21->_panicInitiator = 0LL;

    foregroundAppHash = v21->_foregroundAppHash;
    v21->_foregroundAppHash = 0LL;

    v21->_foregroundAppHashSet = 0;
    utilizationInfo = v21->_utilizationInfo;
    v21->_utilizationInfo = 0LL;
  }

  return v21;
}

- (void)setSOCIdAndRev
{
}

- (void)setUtilizationInfo:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_utilizationInfo, a3);
    id v5 = v6;
  }
}

- (void)useSocdNandContainer:(id)a3
{
}

- (void)useExtPaniclog:(id)a3
{
}

- (void)useSocdContainer:(id)a3
{
}

- (void)setForegroundAppHash:(id)a3
{
  self->_foregroundAppHashSet = 1;
}

- (void)setPanicString:(id)a3
{
}

- (void)setPanicInitiator:(id)a3
{
}

- (id)getBuildVersionString
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 productNameVersionBuildString]);

  if (-[NSString length](self->_buildVersion, "length"))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 productName]);
    uint64_t v7 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  v6,  self->_buildVersion));

    v4 = (void *)v7;
  }

  return v4;
}

- (id)additionalIPSMetadata
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PanicReport incidentID](self, "incidentID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObject:forKey:",  v3,  kOSALogMetadataIncidentID));

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PanicReport getBuildVersionString](self, "getBuildVersionString"));
  [v4 setObject:v5 forKeyedSubscript:@"os_version"];

  id v6 = self->_rootsInstalled;
  if (v6
    || (size_t v8 = 8LL, !sysctlbyname("kern.roots_installed", &v9, &v8, 0LL, 0LL))
    && (id v6 = (NSNumber *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v9))) != 0LL)
  {
    [v4 setObject:v6 forKeyedSubscript:@"roots_installed"];
  }

  return v4;
}

- (void)useStoragePanicData:(id)a3
{
}

- (id)problemType
{
  if (self->_isBtnReset) {
    return @"151";
  }
  else {
    return @"210";
  }
}

- (id)appleCareDetails
{
  return &__NSArray0__struct;
}

- (id)reportNamePrefix
{
  if (-[PanicReport ss_sequence](self, "ss_sequence") == -1)
  {
    if (self->_storagePanicData)
    {
      v3 = @"-base+storage_crash";
    }

    else if (self->_socdContainerArray)
    {
      v3 = @"-base+socd";
    }

    else
    {
      v3 = @"-base";
    }
  }

  else
  {
    v3 = @"-full";
  }

  if (self->_isBtnReset) {
    v4 = @"forceReset";
  }
  else {
    v4 = @"panic";
  }
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@%@", v4, v3);
}

- (id)createUUIDString:(unsigned int)a3
{
  id v5 = objc_alloc(&OBJC_CLASS___NSUUID);
  id v6 = objc_claimAutoreleasedReturnValue(-[NSData subdataWithRange:](self->_extPaniclog, "subdataWithRange:", a3, 16LL));
  uint64_t v7 = -[NSUUID initWithUUIDBytes:](v5, "initWithUUIDBytes:", [v6 bytes]);

  if (v7)
  {
    size_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v7, "UUIDString"));
    uint64_t v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }

    else
    {
      v12 = (os_log_s *)qword_100036568;
      if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v14 = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Unable to create UUID String", v14, 2u);
      }
    }
  }

  else
  {
    v11 = (os_log_s *)qword_100036568;
    if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Unable to create UUID object", buf, 2u);
    }

    uint64_t v9 = 0LL;
  }

  return v9;
}

- (void)processExtPaniclogFlags:(unsigned int)a3 data_id:(id)a4 data:(id)a5 additionalBuffers:(id)a6 addToExtPaniclog:(BOOL *)a7
{
  if ((a3 & 1) != 0)
  {
    [a6 setObject:a5 forKey:a4];
    *a7 = 0;
  }

- (id)parseExtPaniclog
{
  v34 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v35 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v36 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  extPaniclog = self->_extPaniclog;
  id v4 = objc_claimAutoreleasedReturnValue(-[NSData subdataWithRange:](self->_extPaniclog, "subdataWithRange:", 0LL, 4LL));
  unsigned int v5 = *(_DWORD *)[v4 bytes];

  if (v5 != 2)
  {
    size_t v8 = (os_log_s *)qword_100036568;
    if (!os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    *(_DWORD *)buf = 67109120;
    unsigned int v39 = v5;
    uint64_t v9 = "Invalid version. Version in paniclog: %d\n";
    goto LABEL_25;
  }

  id v6 = objc_claimAutoreleasedReturnValue(-[NSData subdataWithRange:](self->_extPaniclog, "subdataWithRange:", 4LL, 4LL));
  unsigned int v7 = *(_DWORD *)[v6 bytes];

  if (v7 > 0x64)
  {
    size_t v8 = (os_log_s *)qword_100036568;
    if (!os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    *(_DWORD *)buf = 67109120;
    unsigned int v39 = v7;
    uint64_t v9 = "Invalid no_of_logs %d";
LABEL_25:
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, v9, buf, 8u);
    goto LABEL_8;
  }

  if (!v7) {
    goto LABEL_41;
  }
  uint64_t v12 = 8LL;
  while (1)
  {
    uint64_t v13 = objc_claimAutoreleasedReturnValue(-[PanicReport createUUIDString:](self, "createUUIDString:", v12));
    if (!v13) {
      goto LABEL_41;
    }
    uint64_t v33 = (void *)v13;
    id v14 = objc_claimAutoreleasedReturnValue( -[NSData subdataWithRange:]( self->_extPaniclog, "subdataWithRange:", (v12 + 16), 4LL));
    uint64_t v15 = *(unsigned int *)[v14 bytes];

    size_t v16 = strnlen((const char *)-[NSData bytes](self->_extPaniclog, "bytes") + (v12 + 20), 0x1FuLL);
    id v17 = objc_alloc(&OBJC_CLASS___NSString);
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSData subdataWithRange:](self->_extPaniclog, "subdataWithRange:", (v12 + 20), v16));
    id v19 = -[NSString initWithData:encoding:](v17, "initWithData:encoding:", v18, 4LL);

    if (!v19)
    {
      v28 = (os_log_s *)qword_100036568;
      if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "Unable to create Data ID String",  buf,  2u);
      }

      id v19 = 0LL;
      goto LABEL_34;
    }

    unsigned int v20 = v12 + v16 + 21;
    id v21 = objc_claimAutoreleasedReturnValue(-[NSData subdataWithRange:](self->_extPaniclog, "subdataWithRange:", v20, 4LL));
    uint64_t v22 = *(unsigned int *)[v21 bytes];

    if (v22 > 0x8000)
    {
      id v29 = (os_log_s *)qword_100036568;
      if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        unsigned int v39 = v22;
        _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Data len is invalid: %d", buf, 8u);
      }

      goto LABEL_34;
    }

    unsigned int v23 = v20 + 4;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSData subdataWithRange:](self->_extPaniclog, "subdataWithRange:", v20 + 4, v22));
    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 base64EncodedStringWithOptions:0]);

    if (!v25)
    {
      id v30 = (os_log_s *)qword_100036568;
      if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "Unable to create Buffer data string",  buf,  2u);
      }

- (void)generateLogAtLevel:(BOOL)a3 withBlock:(id)a4
{
  unsigned int v5 = (void (**)(id, void *))a4;
  v119[0] = @"incident";
  v82 = (void *)objc_claimAutoreleasedReturnValue(-[PanicReport incidentID](self, "incidentID"));
  v120[0] = v82;
  v119[1] = @"crashReporterKey";
  v80 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance"));
  v79 = (void *)objc_claimAutoreleasedReturnValue([v80 crashReporterKey]);
  v120[1] = v79;
  v119[2] = @"product";
  v78 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance"));
  v77 = (void *)objc_claimAutoreleasedReturnValue([v78 modelCode]);
  v120[2] = v77;
  v119[3] = @"socId";
  v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%x", self->_socId));
  v120[3] = v76;
  v119[4] = @"socRevision";
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%x", self->_socRev));
  v120[4] = v6;
  v119[5] = @"build";
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[PanicReport getBuildVersionString](self, "getBuildVersionString"));
  v120[5] = v7;
  v119[6] = @"kernel";
  id v8 = [(id)objc_opt_class(self) kernelVersionDescription];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v120[6] = v9;
  v119[7] = @"date";
  uint64_t v10 = OSADateFormat(1LL, *(double *)&self->OSAStackShotReport_opaque[OBJC_IVAR___OSAReport__capture_time]);
  uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
  uint64_t v12 = (void *)v11;
  if (self->_isBtnReset) {
    uint64_t v13 = @"string";
  }
  else {
    uint64_t v13 = @"panicString";
  }
  panicString = (const __CFString *)self->_panicString;
  if (!panicString) {
    panicString = @"<mysterious>";
  }
  v120[7] = v11;
  v120[8] = panicString;
  v119[8] = v13;
  v119[9] = @"panicFlags";
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"0x%llx",  self->_panicFlags));
  v120[9] = v15;
  v119[10] = @"codeSigningMonitor";
  size_t v16 = +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [(id)objc_opt_class(self) codeSigningMonitor]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v120[10] = v17;
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v120,  v119,  11LL));
  v5[2](v5, v18);

  id v19 = v5;
  uint64_t v117 = kOSALogMetadataBugType;
  unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue(-[PanicReport problemType](self, "problemType"));
  v118 = v20;
  id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v118,  &v117,  1LL));
  v5[2](v5, v21);

  panicInitiator = self->_panicInitiator;
  if (panicInitiator)
  {
    v115 = @"panicInitiator";
    v116 = panicInitiator;
    unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v116,  &v115,  1LL));
    v5[2](v5, v23);
  }

  if (self->_isInterruptedCoredump) {
    v5[2](v5, &off_100033968);
  }
  if (-[NSString length](self->_otherString, "length"))
  {
    v113 = @"otherString";
    otherString = self->_otherString;
    v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &otherString,  &v113,  1LL));
    v5[2](v5, v24);
  }

  if (self->_foregroundAppHashSet)
  {
    foregroundAppHash = self->_foregroundAppHash;
    if (foregroundAppHash)
    {
      v111 = @"foregroundAppHash";
      v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@",  foregroundAppHash));
      v112 = v26;
      v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v112,  &v111,  1LL));
      v5[2](v5, v27);
    }
  }

  if ((self->_panicFlags & 0x40) != 0) {
    [*(id *)&self->OSAStackShotReport_opaque[OBJC_IVAR___OSAReport__notes] addObject:@"nested panic occurred"];
  }
  utilizationInfo = self->_utilizationInfo;
  if (utilizationInfo)
  {
    v109 = @"PanicLogUtilizationMetrics";
    v110 = utilizationInfo;
    id v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v110,  &v109,  1LL));
    v5[2](v5, v29);
  }

  if (-[NSString length](self->_socdNandContainer, "length"))
  {
    v107 = @"SOCDNandContainer";
    socdNandContainer = self->_socdNandContainer;
    id v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &socdNandContainer,  &v107,  1LL));
    v5[2](v5, v30);
  }

  if (os_variant_has_internal_diagnostics("com.apple.dumppanic"))
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[PanicReport parseExtPaniclog](self, "parseExtPaniclog"));
    id v32 = v31;
    if (v31)
    {
      uint64_t v33 = self;
      v34 = (void *)objc_claimAutoreleasedReturnValue([v31 objectForKeyedSubscript:@"extPaniclogData"]);
      if (v34)
      {
        v105 = @"ExtensiblePaniclog";
        v35 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKeyedSubscript:@"extPaniclogData"]);
        v106 = v35;
        v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v106,  &v105,  1LL));
        v5[2](v5, v36);
      }

      char v37 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKeyedSubscript:@"additionalData"]);
      v38 = v37;
      if (v37)
      {
        __int128 v91 = 0u;
        __int128 v92 = 0u;
        __int128 v89 = 0u;
        __int128 v90 = 0u;
        id v39 = [v37 countByEnumeratingWithState:&v89 objects:v104 count:16];
        if (v39)
        {
          id v40 = v39;
          uint64_t v41 = *(void *)v90;
          do
          {
            for (i = 0LL; i != v40; i = (char *)i + 1)
            {
              if (*(void *)v90 != v41) {
                objc_enumerationMutation(v38);
              }
              uint64_t v43 = *(void *)(*((void *)&v89 + 1) + 8LL * (void)i);
              v44 = (void *)objc_claimAutoreleasedReturnValue([v38 objectForKeyedSubscript:v43]);
              uint64_t v102 = v43;
              v103 = v44;
              v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v103,  &v102,  1LL));
              v19[2](v19, v45);
            }

            id v40 = [v38 countByEnumeratingWithState:&v89 objects:v104 count:16];
          }

          while (v40);
        }
      }

      self = v33;
    }
  }

  if (-[NSString length](self->_storagePanicData, "length"))
  {
    storagePanicData = self->_storagePanicData;
    v100 = @"storagePanicData";
    v101 = storagePanicData;
    v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v101,  &v100,  1LL));
    v19[2](v19, v47);
  }

  v81 = v19;
  v83 = self;
  v84 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v85 = 0u;
  __int128 v86 = 0u;
  __int128 v87 = 0u;
  __int128 v88 = 0u;
  v48 = self->_socdContainerArray;
  id v49 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v48,  "countByEnumeratingWithState:objects:count:",  &v85,  v99,  16LL);
  if (v49)
  {
    id v50 = v49;
    uint64_t v51 = *(void *)v86;
    do
    {
      for (j = 0LL; j != v50; j = (char *)j + 1)
      {
        if (*(void *)v86 != v51) {
          objc_enumerationMutation(v48);
        }
        v53 = *(void **)(*((void *)&v85 + 1) + 8LL * (void)j);
        if ([v53 count])
        {
          v54 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          v55 = (void *)objc_claimAutoreleasedReturnValue([v53 objectAtIndex:0]);
          v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
          unsigned __int8 v57 = [v55 isEqual:v56];

          if ((v57 & 1) == 0)
          {
            v58 = (void *)objc_claimAutoreleasedReturnValue([v53 objectAtIndex:0]);
            if ([v58 length]) {
              -[NSMutableDictionary setObject:forKey:](v54, "setObject:forKey:", v58, @"SOCDContainer");
            }
          }

          v59 = (void *)objc_claimAutoreleasedReturnValue([v53 objectAtIndex:1]);
          v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
          unsigned __int8 v61 = [v59 isEqual:v60];

          if ((v61 & 1) == 0)
          {
            v62 = (void *)objc_claimAutoreleasedReturnValue([v53 objectAtIndex:1]);
            if ([v62 length]) {
              -[NSMutableDictionary setObject:forKey:](v54, "setObject:forKey:", v62, @"SOCDPanicString");
            }
          }

          if (-[NSMutableDictionary count](v54, "count")) {
            -[NSMutableArray addObject:](v84, "addObject:", v54);
          }
        }
      }

      id v50 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v48,  "countByEnumeratingWithState:objects:count:",  &v85,  v99,  16LL);
    }

    while (v50);
  }

  if (-[NSMutableArray count](v84, "count"))
  {
    v97 = @"SOCDContainers";
    v98 = v84;
    v63 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v98,  &v97,  1LL));
    v81[2](v81, v63);
  }

  id v64 = objc_alloc_init(&OBJC_CLASS___OSABinaryImageCatalog);
  v65 = v83;
  -[PanicReport decodeKCDataWithBlock:withTuning:usingCatalog:]( v83,  "decodeKCDataWithBlock:withTuning:usingCatalog:",  v81,  &off_100033990,  v64);
  v95 = @"binaryImages";
  v66 = (void *)objc_claimAutoreleasedReturnValue([v64 reportUsedImages]);
  v96 = v66;
  v67 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v96,  &v95,  1LL));
  v81[2](v81, v67);

  uint64_t v68 = OBJC_IVAR___OSAReport__notes;
  [v64 appendNotesTo:*(void *)&v83->OSAStackShotReport_opaque[OBJC_IVAR___OSAReport__notes]];
  if (os_variant_has_internal_diagnostics("com.apple.DumpPanic"))
  {
    int v69 = sub_10000E5F4();
    uint64_t v71 = v70;
    if ((v69 & 0x100) != 0) {
      [*(id *)&v83->OSAStackShotReport_opaque[v68] addObject:@"test automation device"];
    }
    if ((v69 & 0x10000) != 0) {
      [*(id *)&v83->OSAStackShotReport_opaque[v68] addObject:@"intentional panic"];
    }
    v65 = v83;
    if (v71)
    {
      v72 = *(void **)&v83->OSAStackShotReport_opaque[v68];
      v73 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"test plan id: %llu",  v71));
      [v72 addObject:v73];
    }
  }

  if ([*(id *)&v65->OSAStackShotReport_opaque[v68] count])
  {
    uint64_t v74 = *(void *)&v65->OSAStackShotReport_opaque[v68];
    v93 = @"notes";
    uint64_t v94 = v74;
    v75 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v94,  &v93,  1LL));
    v81[2](v81, v75);
  }
}

- (id)panicString
{
  return self->_panicString;
}

- (id)incidentID
{
  v2 = *(void **)&self->OSAStackShotReport_opaque[OBJC_IVAR___OSAReport__incidentID];
  if (v2) {
    return v2;
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PanicReport;
  id v4 = -[PanicReport incidentID](&v5, "incidentID");
  return (id)objc_claimAutoreleasedReturnValue(v4);
}

- (id)logType
{
  return *(id *)&self->OSAStackShotReport_opaque[OBJC_IVAR___OSAReport__logType];
}

- (void).cxx_destruct
{
}

@end