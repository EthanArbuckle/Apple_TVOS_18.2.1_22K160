@interface CLHLocationClassifier
- (BOOL)shouldFetchLocationsOfInterest;
- (BOOL)valid;
- (CLHLocationClassifier)init;
- (NSArray)gymLocations;
- (NSArray)homeLocations;
- (NSArray)schoolLocations;
- (NSArray)workLocations;
- (double)getLocationsOfInterestFetchTimeInterval;
- (id)initInUniverse:(id)a3;
- (id)jsonObject;
- (int64_t)loiTypeForLocation:(id)a3;
- (void)dealloc;
- (void)fetchLocationsOfInterestIfPossibleWithCompletionHandler:(id)a3;
- (void)setGymLocations:(id)a3;
- (void)setHomeLocations:(id)a3;
- (void)setSchoolLocations:(id)a3;
- (void)setValid:(BOOL)a3;
- (void)setWorkLocations:(id)a3;
- (void)updateLocationsOfInterestFetchTimestamp;
@end

@implementation CLHLocationClassifier

- (CLHLocationClassifier)init
{
  self->_lastLocationsOfInterestFetchDate = 0LL;
  self->_locationsOfInterestFetchError = 0;
  self->_numConsecutiveFetchErrors = 0;
  self->_numFetchesOfLocationsOfInterest = 0;
  return 0LL;
}

- (id)initInUniverse:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CLHLocationClassifier;
  v4 = -[CLHLocationClassifier init](&v7, "init");
  if (v4)
  {
    v4->_universe = (CLIntersiloUniverse *)a3;
    -[CLHLocationClassifier setValid:](v4, "setValid:", 1LL);
    v5 = (CLRoutineMonitorServiceProtocol *) objc_msgSend( objc_msgSend(a3, "vendor"),  "proxyForService:",  @"CLRoutineMonitor");
    v4->_routineMonitor = v5;
    -[CLRoutineMonitorServiceProtocol registerDelegate:inSilo:]( v5,  "registerDelegate:inSilo:",  v4,  [a3 silo]);
    -[CLRoutineMonitorServiceProtocol setDelegateEntityName:]( v4->_routineMonitor,  "setDelegateEntityName:",  "CLHLocationClassifier");
  }

  return v4;
}

- (double)getLocationsOfInterestFetchTimeInterval
{
  double result = 86400.0;
  if (self->_locationsOfInterestFetchError) {
    return 10.0;
  }
  return result;
}

- (BOOL)shouldFetchLocationsOfInterest
{
  if (!self->_lastLocationsOfInterestFetchDate) {
    return 1;
  }
  -[CLHLocationClassifier getLocationsOfInterestFetchTimeInterval](self, "getLocationsOfInterestFetchTimeInterval");
  v4 = -[NSDate initWithTimeInterval:sinceDate:]( objc_alloc(&OBJC_CLASS___NSDate),  "initWithTimeInterval:sinceDate:",  self->_lastLocationsOfInterestFetchDate,  v3);
  BOOL v5 = -[NSDate compare:](v4, "compare:", +[NSDate date](&OBJC_CLASS___NSDate, "date")) == NSOrderedAscending;

  return v5;
}

- (void)updateLocationsOfInterestFetchTimestamp
{
  lastLocationsOfInterestFetchDate = self->_lastLocationsOfInterestFetchDate;
  if (lastLocationsOfInterestFetchDate)
  {

    self->_lastLocationsOfInterestFetchDate = 0LL;
  }

  self->_lastLocationsOfInterestFetchDate = objc_alloc_init(&OBJC_CLASS___NSDate);
}

- (void)fetchLocationsOfInterestIfPossibleWithCompletionHandler:(id)a3
{
  if (!a3) {
    sub_10127A634();
  }
  if (-[CLHLocationClassifier shouldFetchLocationsOfInterest](self, "shouldFetchLocationsOfInterest"))
  {
    ++self->_numFetchesOfLocationsOfInterest;
    if (qword_1019349B0 != -1) {
      dispatch_once(&qword_1019349B0, &stru_10188EE80);
    }
    BOOL v5 = (os_log_s *)qword_1019349B8;
    if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t numFetchesOfLocationsOfInterest = self->_numFetchesOfLocationsOfInterest;
      *(void *)buf = 68289282LL;
      *(_WORD *)v19 = 2082;
      *(void *)&v19[2] = "";
      *(_WORD *)&v19[10] = 2050;
      *(void *)&v19[12] = numFetchesOfLocationsOfInterest;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:Fetching locations of interest, NumFetches:%{public}ld}",  buf,  0x1Cu);
    }

    -[CLHLocationClassifier updateLocationsOfInterestFetchTimestamp](self, "updateLocationsOfInterestFetchTimestamp");
    self->_locationsOfInterestFetchError = 0;
    *(void *)buf = 0LL;
    *(void *)v19 = buf;
    *(void *)&v19[8] = 0x3052000000LL;
    *(void *)&v19[16] = sub_100F6EE70;
    v20 = sub_100F6EE80;
    dispatch_group_t v21 = dispatch_group_create();
    dispatch_group_enter(*(dispatch_group_t *)(*(void *)v19 + 40LL));
    routineMonitor = self->_routineMonitor;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100F6EE8C;
    v17[3] = &unk_10188EE40;
    v17[4] = self;
    v17[5] = buf;
    -[CLRoutineMonitorServiceProtocol fetchLocationsOfInterestOfType:withReply:]( routineMonitor,  "fetchLocationsOfInterestOfType:withReply:",  0LL,  v17);
    dispatch_group_enter(*(dispatch_group_t *)(*(void *)v19 + 40LL));
    v8 = self->_routineMonitor;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100F6F068;
    v16[3] = &unk_10188EE40;
    v16[4] = self;
    v16[5] = buf;
    -[CLRoutineMonitorServiceProtocol fetchLocationsOfInterestOfType:withReply:]( v8,  "fetchLocationsOfInterestOfType:withReply:",  1LL,  v16);
    dispatch_group_enter(*(dispatch_group_t *)(*(void *)v19 + 40LL));
    v9 = self->_routineMonitor;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100F6F244;
    v15[3] = &unk_10188EE40;
    v15[4] = self;
    v15[5] = buf;
    -[CLRoutineMonitorServiceProtocol fetchLocationsOfInterestOfType:withReply:]( v9,  "fetchLocationsOfInterestOfType:withReply:",  2LL,  v15);
    dispatch_group_enter(*(dispatch_group_t *)(*(void *)v19 + 40LL));
    v10 = self->_routineMonitor;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100F6F420;
    v14[3] = &unk_10188EE40;
    v14[4] = self;
    v14[5] = buf;
    -[CLRoutineMonitorServiceProtocol fetchLocationsOfInterestOfType:withReply:]( v10,  "fetchLocationsOfInterestOfType:withReply:",  3LL,  v14);
    v11 = *(dispatch_group_s **)(*(void *)v19 + 40LL);
    v12 = (dispatch_queue_s *)objc_msgSend(-[CLIntersiloUniverse silo](self->_universe, "silo"), "queue");
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100F6F5FC;
    block[3] = &unk_10187B098;
    block[4] = self;
    block[5] = a3;
    block[6] = buf;
    dispatch_group_notify(v11, v12, block);
    _Block_object_dispose(buf, 8);
  }

- (int64_t)loiTypeForLocation:(id)a3
{
  HIDWORD(v5) = -286331153 * rand() + 143165576;
  LODWORD(v5) = HIDWORD(v5);
  if ((v5 >> 1) <= 0x8888888)
  {
    if (qword_1019349B0 != -1) {
      dispatch_once(&qword_1019349B0, &stru_10188EE80);
    }
    v6 = (os_log_s *)qword_1019349B8;
    if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_DEFAULT))
    {
      NSUInteger v7 = -[NSArray count](self->_homeLocations, "count");
      NSUInteger v8 = -[NSArray count](self->_workLocations, "count");
      NSUInteger v9 = -[NSArray count](self->_schoolLocations, "count");
      NSUInteger v10 = -[NSArray count](self->_gymLocations, "count");
      uint64_t buf = 68290050LL;
      __int16 v54 = 2082;
      v55 = "";
      __int16 v56 = 2050;
      NSUInteger v57 = v7;
      __int16 v58 = 2050;
      NSUInteger v59 = v8;
      __int16 v60 = 2050;
      NSUInteger v61 = v9;
      __int16 v62 = 2050;
      NSUInteger v63 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:fetched locations of interest, Home:%{public}ld, Work:%{public}ld, School:% {public}ld, Gym:%{public}ld}",  (uint8_t *)&buf,  0x3Au);
    }
  }

  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  homeLocations = self->_homeLocations;
  id v12 = -[NSArray countByEnumeratingWithState:objects:count:]( homeLocations,  "countByEnumeratingWithState:objects:count:",  &v45,  v52,  16LL);
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v46;
    while (2)
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v46 != v14) {
          objc_enumerationMutation(homeLocations);
        }
      }

      id v13 = -[NSArray countByEnumeratingWithState:objects:count:]( homeLocations,  "countByEnumeratingWithState:objects:count:",  &v45,  v52,  16LL);
      if (v13) {
        continue;
      }
      break;
    }
  }

  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  workLocations = self->_workLocations;
  id v17 = -[NSArray countByEnumeratingWithState:objects:count:]( workLocations,  "countByEnumeratingWithState:objects:count:",  &v41,  v51,  16LL);
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v42;
    int64_t v20 = 1LL;
LABEL_16:
    uint64_t v21 = 0LL;
    while (1)
    {
      if (*(void *)v42 != v19) {
        objc_enumerationMutation(workLocations);
      }
      if (v18 == (id)++v21)
      {
        id v18 = -[NSArray countByEnumeratingWithState:objects:count:]( workLocations,  "countByEnumeratingWithState:objects:count:",  &v41,  v51,  16LL);
        if (v18) {
          goto LABEL_16;
        }
        goto LABEL_22;
      }
    }
  }

  else
  {
LABEL_22:
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    schoolLocations = self->_schoolLocations;
    id v23 = -[NSArray countByEnumeratingWithState:objects:count:]( schoolLocations,  "countByEnumeratingWithState:objects:count:",  &v37,  v50,  16LL);
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v38;
      int64_t v20 = 2LL;
LABEL_24:
      uint64_t v26 = 0LL;
      while (1)
      {
        if (*(void *)v38 != v25) {
          objc_enumerationMutation(schoolLocations);
        }
        if (v24 == (id)++v26)
        {
          id v24 = -[NSArray countByEnumeratingWithState:objects:count:]( schoolLocations,  "countByEnumeratingWithState:objects:count:",  &v37,  v50,  16LL);
          if (v24) {
            goto LABEL_24;
          }
          goto LABEL_30;
        }
      }
    }

    else
    {
LABEL_30:
      __int128 v35 = 0u;
      __int128 v36 = 0u;
      __int128 v33 = 0u;
      __int128 v34 = 0u;
      gymLocations = self->_gymLocations;
      id v28 = -[NSArray countByEnumeratingWithState:objects:count:]( gymLocations,  "countByEnumeratingWithState:objects:count:",  &v33,  v49,  16LL);
      if (v28)
      {
        id v29 = v28;
        uint64_t v30 = *(void *)v34;
        while (2)
        {
          for (j = 0LL; j != v29; j = (char *)j + 1)
          {
            if (*(void *)v34 != v30) {
              objc_enumerationMutation(gymLocations);
            }
          }

          id v29 = -[NSArray countByEnumeratingWithState:objects:count:]( gymLocations,  "countByEnumeratingWithState:objects:count:",  &v33,  v49,  16LL);
          int64_t v20 = -1LL;
          if (v29) {
            continue;
          }
          break;
        }
      }

      else
      {
        return -1LL;
      }
    }
  }

  return v20;
}

- (void)dealloc
{
  lastLocationsOfInterestFetchDate = self->_lastLocationsOfInterestFetchDate;
  if (lastLocationsOfInterestFetchDate)
  {

    self->_lastLocationsOfInterestFetchDate = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CLHLocationClassifier;
  -[CLHLocationClassifier dealloc](&v4, "dealloc");
}

- (id)jsonObject
{
  double v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  homeLocations = self->_homeLocations;
  id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( homeLocations,  "countByEnumeratingWithState:objects:count:",  &v41,  v50,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v42;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v42 != v7) {
          objc_enumerationMutation(homeLocations);
        }
        -[NSMutableArray addObject:]( v3,  "addObject:",  sub_100F70000(*(void **)(*((void *)&v41 + 1) + 8LL * (void)i)));
      }

      id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( homeLocations,  "countByEnumeratingWithState:objects:count:",  &v41,  v50,  16LL);
    }

    while (v6);
  }

  NSUInteger v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  workLocations = self->_workLocations;
  id v11 = -[NSArray countByEnumeratingWithState:objects:count:]( workLocations,  "countByEnumeratingWithState:objects:count:",  &v37,  v49,  16LL);
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v38;
    do
    {
      for (j = 0LL; j != v12; j = (char *)j + 1)
      {
        if (*(void *)v38 != v13) {
          objc_enumerationMutation(workLocations);
        }
        -[NSMutableArray addObject:]( v9,  "addObject:",  sub_100F70000(*(void **)(*((void *)&v37 + 1) + 8LL * (void)j)));
      }

      id v12 = -[NSArray countByEnumeratingWithState:objects:count:]( workLocations,  "countByEnumeratingWithState:objects:count:",  &v37,  v49,  16LL);
    }

    while (v12);
  }

  v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  schoolLocations = self->_schoolLocations;
  id v17 = -[NSArray countByEnumeratingWithState:objects:count:]( schoolLocations,  "countByEnumeratingWithState:objects:count:",  &v33,  v48,  16LL);
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v34;
    do
    {
      for (k = 0LL; k != v18; k = (char *)k + 1)
      {
        if (*(void *)v34 != v19) {
          objc_enumerationMutation(schoolLocations);
        }
        -[NSMutableArray addObject:]( v15,  "addObject:",  sub_100F70000(*(void **)(*((void *)&v33 + 1) + 8LL * (void)k)));
      }

      id v18 = -[NSArray countByEnumeratingWithState:objects:count:]( schoolLocations,  "countByEnumeratingWithState:objects:count:",  &v33,  v48,  16LL);
    }

    while (v18);
  }

  uint64_t v21 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  gymLocations = self->_gymLocations;
  id v23 = -[NSArray countByEnumeratingWithState:objects:count:]( gymLocations,  "countByEnumeratingWithState:objects:count:",  &v29,  v47,  16LL);
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v30;
    do
    {
      for (m = 0LL; m != v24; m = (char *)m + 1)
      {
        if (*(void *)v30 != v25) {
          objc_enumerationMutation(gymLocations);
        }
        -[NSMutableArray addObject:]( v21,  "addObject:",  sub_100F70000(*(void **)(*((void *)&v29 + 1) + 8LL * (void)m)));
      }

      id v24 = -[NSArray countByEnumeratingWithState:objects:count:]( gymLocations,  "countByEnumeratingWithState:objects:count:",  &v29,  v47,  16LL);
    }

    while (v24);
  }

  v45[0] = @"home";
  v45[1] = @"work";
  v46[0] = v3;
  v46[1] = v9;
  v45[2] = @"school";
  v45[3] = @"gym";
  v46[2] = v15;
  v46[3] = v21;
  v27 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v46,  v45,  4LL);

  return v27;
}

- (BOOL)valid
{
  return self->valid;
}

- (void)setValid:(BOOL)a3
{
  self->valid = a3;
}

- (NSArray)homeLocations
{
  return self->_homeLocations;
}

- (void)setHomeLocations:(id)a3
{
}

- (NSArray)workLocations
{
  return self->_workLocations;
}

- (void)setWorkLocations:(id)a3
{
}

- (NSArray)schoolLocations
{
  return self->_schoolLocations;
}

- (void)setSchoolLocations:(id)a3
{
}

- (NSArray)gymLocations
{
  return self->_gymLocations;
}

- (void)setGymLocations:(id)a3
{
}

@end