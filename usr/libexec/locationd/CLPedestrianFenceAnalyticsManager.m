@interface CLPedestrianFenceAnalyticsManager
- (BOOL)isAnySessionActive;
- (CLPedestrianFenceAnalyticsManager)init;
- (NSMutableArray)completedSessionsAwaitingPackets;
- (NSMutableDictionary)activeFenceSessions;
- (NSMutableDictionary)activeIntervalEvents;
- (NSMutableDictionary)activeOdometryClients;
- (NSMutableDictionary)fenceHistoryPerSession;
- (id).cxx_construct;
- (id)aggregateStatsFromPacket:(unint64_t)a3 to:(unint64_t)a4 useAOPDuration:(BOOL)a5;
- (void)cleanupPackets;
- (void)completeIntervalEventForClient:(id)a3 endingAt:(unint64_t)a4 setNew:(BOOL)a5;
- (void)createIntervalEventStartingAt:(unint64_t)a3;
- (void)dealloc;
- (void)endSessionForClient:(id)a3 startingAtTime:(double)a4 stoppingAtTime:(double)a5 sequenceNumber:(unint64_t)a6;
- (void)feedInertialOdometryPacket:(const InertialOdometryAnalytics *)a3 atTime:;
- (void)odometryClient:(id)a3 requestInterval:(double)a4 sequenceNumber:(unint64_t)a5;
- (void)processSingleFenceAnalyticsData:(id)a3;
- (void)sendAnalyticsForAllReadySessions;
- (void)setActiveFenceSessions:(id)a3;
- (void)setActiveIntervalEvents:(id)a3;
- (void)setActiveOdometryClients:(id)a3;
- (void)setCompletedSessionsAwaitingPackets:(id)a3;
- (void)setFenceHistoryPerSession:(id)a3;
- (void)startSessionForClient:(id)a3 sequenceNumber:(unint64_t)a4;
@end

@implementation CLPedestrianFenceAnalyticsManager

- (CLPedestrianFenceAnalyticsManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CLPedestrianFenceAnalyticsManager;
  v2 = -[CLPedestrianFenceAnalyticsManager init](&v4, "init");
  if (v2)
  {
    v2->_activeOdometryClients = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v2->_activeIntervalEvents = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v2->_activeFenceSessions = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v2->_fenceHistoryPerSession = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v2->_completedSessionsAwaitingPackets = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v2->_timestampLastLog = 0.0;
  }

  return v2;
}

- (void)dealloc
{
  self->_activeOdometryClients = 0LL;
  self->_activeIntervalEvents = 0LL;

  self->_activeFenceSessions = 0LL;
  self->_fenceHistoryPerSession = 0LL;

  self->_completedSessionsAwaitingPackets = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLPedestrianFenceAnalyticsManager;
  -[CLPedestrianFenceAnalyticsManager dealloc](&v3, "dealloc");
}

- (void)processSingleFenceAnalyticsData:(id)a3
{
  if ([a3 hasValidData])
  {
    id v5 = -[NSMutableDictionary objectForKeyedSubscript:]( -[CLPedestrianFenceAnalyticsManager fenceHistoryPerSession](self, "fenceHistoryPerSession"),  "objectForKeyedSubscript:",  [a3 clientIdentifier]);
    if (!v5)
    {
      id v5 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
      -[NSMutableDictionary setObject:forKeyedSubscript:]( -[CLPedestrianFenceAnalyticsManager fenceHistoryPerSession](self, "fenceHistoryPerSession"),  "setObject:forKeyedSubscript:",  v5,  [a3 clientIdentifier]);
    }

    v13[0] = @"timestamp";
    [a3 timeFenceStart];
    v13[1] = @"isFenceStartEvent";
    v14[0] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
    v14[1] = &__kCFBooleanTrue;
    objc_msgSend( v5,  "addObject:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  2));
    v11[0] = @"timestamp";
    [a3 timeFenceExit];
    v11[1] = @"isFenceStartEvent";
    v12[0] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
    v12[1] = &__kCFBooleanFalse;
    objc_msgSend( v5,  "addObject:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  2));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100741CE0;
    v9[3] = &unk_101820740;
    v9[4] = a3;
    AnalyticsSendEventLazy(@"com.apple.CoreMotion.PedestrianFenceTrigger", v9);
  }

  else
  {
    if (qword_101934780 != -1) {
      dispatch_once(&qword_101934780, &stru_10184D750);
    }
    v6 = (os_log_s *)qword_101934788;
    if (os_log_type_enabled((os_log_t)qword_101934788, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "[Analytics] Invalid fence metadata received, skipping",  buf,  2u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934780 != -1) {
        dispatch_once(&qword_101934780, &stru_10184D750);
      }
      v10[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934788,  16LL,  "[Analytics] Invalid fence metadata received, skipping",  v10,  2);
      v8 = (uint8_t *)v7;
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLPedestrianFenceAnalyticsManager processSingleFenceAnalyticsData:]",  "%s\n",  v7);
      if (v8 != buf) {
        free(v8);
      }
    }
  }

- (void)startSessionForClient:(id)a3 sequenceNumber:(unint64_t)a4
{
}

- (void)endSessionForClient:(id)a3 startingAtTime:(double)a4 stoppingAtTime:(double)a5 sequenceNumber:(unint64_t)a6
{
  id v11 = -[NSMutableDictionary objectForKeyedSubscript:]( -[CLPedestrianFenceAnalyticsManager fenceHistoryPerSession](self, "fenceHistoryPerSession"),  "objectForKeyedSubscript:",  a3);
  id v12 = -[NSMutableDictionary objectForKeyedSubscript:]( -[CLPedestrianFenceAnalyticsManager activeFenceSessions](self, "activeFenceSessions"),  "objectForKeyedSubscript:",  a3);
  if (v12)
  {
    id v34 = v12;
    unint64_t v35 = a6;
    id v36 = a3;
    id v13 = [v11 sortedArrayUsingComparator:&stru_10184D730];
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    id v14 = [v13 countByEnumeratingWithState:&v37 objects:v43 count:16];
    if (v14)
    {
      id v15 = v14;
      unint64_t v16 = 0LL;
      int v17 = 0;
      uint64_t v18 = *(void *)v38;
      double v19 = 0.0;
      double v20 = 0.0;
      do
      {
        for (i = 0LL; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v38 != v18) {
            objc_enumerationMutation(v13);
          }
          v22 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)i);
          if (objc_msgSend( objc_msgSend(v22, "objectForKeyedSubscript:", @"isFenceStartEvent"),  "BOOLValue"))
          {
            if (v17)
            {
              ++v17;
            }

            else
            {
              objc_msgSend(objc_msgSend(v22, "objectForKeyedSubscript:", @"timestamp"), "doubleValue");
              double v20 = v24;
              int v17 = 1;
            }
          }

          else
          {
            ++v16;
            if (!--v17)
            {
              objc_msgSend(objc_msgSend(v22, "objectForKeyedSubscript:", @"timestamp"), "doubleValue");
              double v19 = v19 + v23 - v20;
            }
          }
        }

        id v15 = [v13 countByEnumeratingWithState:&v37 objects:v43 count:16];
      }

      while (v15);
    }

    else
    {
      unint64_t v16 = 0LL;
      double v19 = 0.0;
    }

    id v26 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
    v42[0] = v36;
    v41[0] = @"fenceId";
    v41[1] = @"sessionDuration";
    double v27 = a5 - a4;
    v42[1] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v27);
    v41[2] = @"totalDurationInFence";
    v42[2] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v19);
    v41[3] = @"totalFenceCrossingCount";
    v42[3] = +[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", v16);
    v41[4] = @"fenceTriggerRate";
    v42[4] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", (double)v16 * 3600.0 / v27);
    v42[5] = v34;
    v41[5] = @"sequenceNumberStart";
    v41[6] = @"sequenceNumberEnd";
    v28 = +[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v35);
    v41[7] = @"metricType";
    v42[6] = v28;
    v42[7] = &off_1018D38A8;
    objc_msgSend( v26,  "addEntriesFromDictionary:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v42,  v41,  8));
    if (v16)
    {
      objc_msgSend( v26,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v19 / (double)v16),  @"avgTimeInFence");
      if (v16 != 1)
      {
        objc_msgSend(objc_msgSend(objc_msgSend(v13, "firstObject"), "objectForKey:", @"timestamp"), "doubleValue");
        double v30 = v29;
        objc_msgSend(objc_msgSend(objc_msgSend(v13, "lastObject"), "objectForKey:", @"timestamp"), "doubleValue");
        objc_msgSend( v26,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithDouble:]( NSNumber,  "numberWithDouble:",  (v31 - v30 - v19) / (double)(v16 - 1)),  @"avgTimeBetweenFences");
      }
    }

    -[NSMutableArray addObject:]( -[CLPedestrianFenceAnalyticsManager completedSessionsAwaitingPackets](self, "completedSessionsAwaitingPackets"),  "addObject:",  v26);
    -[NSMutableDictionary removeObjectForKey:]( -[CLPedestrianFenceAnalyticsManager activeFenceSessions](self, "activeFenceSessions"),  "removeObjectForKey:",  v36);
    -[NSMutableDictionary removeObjectForKey:]( -[CLPedestrianFenceAnalyticsManager fenceHistoryPerSession](self, "fenceHistoryPerSession"),  "removeObjectForKey:",  v36);
    -[CLPedestrianFenceAnalyticsManager sendAnalyticsForAllReadySessions](self, "sendAnalyticsForAllReadySessions");
  }

  else
  {
    if (qword_101934780 != -1) {
      dispatch_once(&qword_101934780, &stru_10184D750);
    }
    v25 = (os_log_s *)qword_101934788;
    if (os_log_type_enabled((os_log_t)qword_101934788, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v47 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "[Analytics] Can't end fence session for client %{public}@ that never started",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934780 != -1) {
        dispatch_once(&qword_101934780, &stru_10184D750);
      }
      int v44 = 138543362;
      id v45 = a3;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934788,  16LL,  "[Analytics] Can't end fence session for client %{public}@ that never started",  &v44,  12);
      v33 = (uint8_t *)v32;
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLPedestrianFenceAnalyticsManager endSessionForClient:startingAtTime:stoppingAtTime:sequenceNumber:]",  "%s\n",  v32);
      if (v33 != buf) {
        free(v33);
      }
    }

    -[NSMutableDictionary removeObjectForKey:]( -[CLPedestrianFenceAnalyticsManager fenceHistoryPerSession](self, "fenceHistoryPerSession"),  "removeObjectForKey:",  a3);
  }

- (void)feedInertialOdometryPacket:(const InertialOdometryAnalytics *)a3 atTime:
{
  objc_super v4 = v3;
  __int128 v7 = *(_OWORD *)&a3->var14;
  __int128 v22 = *(_OWORD *)&a3->var10;
  __int128 v23 = v7;
  __int128 v24 = *(_OWORD *)&a3->var18;
  LOBYTE(v25) = a3[1].var5;
  __int128 v8 = *(_OWORD *)a3->var6;
  *(_OWORD *)buf = *(_OWORD *)&a3->var0;
  __int128 v19 = v8;
  __int128 v9 = *(_OWORD *)&a3->var8[2];
  __int128 v20 = *(_OWORD *)&a3->var6[4];
  __int128 v21 = v9;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  id v11 = sub_1007425A8((uint64_t **)&self->_odometryPackets, (unint64_t *)(&a3->var4 + 1));
  *((_OWORD *)v11 + 4) = v22;
  *((_OWORD *)v11 + 5) = v23;
  *((_OWORD *)v11 + 6) = v24;
  v11[14] = v25;
  *(_OWORD *)id v11 = *(_OWORD *)buf;
  *((_OWORD *)v11 + 1) = v19;
  *((_OWORD *)v11 + 2) = v20;
  *((_OWORD *)v11 + 3) = v21;
  v11[15] = v4;
  *((CFAbsoluteTime *)v11 + 16) = Current;
  -[CLPedestrianFenceAnalyticsManager sendAnalyticsForAllReadySessions](self, "sendAnalyticsForAllReadySessions");
  if (self->_odometryPackets.__tree_.__pair3_.__value_ >= 0x5DD)
  {
    if (qword_101934780 != -1) {
      dispatch_once(&qword_101934780, &stru_10184D750);
    }
    id v12 = (os_log_s *)qword_101934788;
    if (os_log_type_enabled((os_log_t)qword_101934788, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "[Analytics] Too many packets accumulated, purging them",  buf,  2u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934780 != -1) {
        dispatch_once(&qword_101934780, &stru_10184D750);
      }
      v17[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934788,  16LL,  "[Analytics] Too many packets accumulated, purging them",  v17,  2);
      unint64_t v16 = (uint8_t *)v15;
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLPedestrianFenceAnalyticsManager feedInertialOdometryPacket:atTime:]",  "%s\n",  v15);
      if (v16 != buf) {
        free(v16);
      }
    }

    left = self->_odometryPackets.__tree_.__pair1_.__value_.__left_;
    p_pair1 = &self->_odometryPackets.__tree_.__pair1_;
    sub_100352B38(left);
    p_pair1[-1].__value_.__left_ = p_pair1;
    p_pair1->__value_.__left_ = 0LL;
    p_pair1[1].__value_.__left_ = 0LL;
  }

- (void)odometryClient:(id)a3 requestInterval:(double)a4 sequenceNumber:(unint64_t)a5
{
  id v9 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  v31[0] = @"eventTime";
  -[NSDate timeIntervalSince1970](+[NSDate date](&OBJC_CLASS___NSDate, "date"), "timeIntervalSince1970");
  v32[0] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
  v32[1] = a3;
  v31[1] = @"identifier";
  v31[2] = @"odometryEvent";
  if (a4 == 0.0) {
    v10 = @"stop";
  }
  else {
    v10 = @"start";
  }
  v32[2] = v10;
  objc_msgSend( v9,  "addEntriesFromDictionary:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v32,  v31,  3));
  if (a4 != 0.0)
  {
    v23[0] = @"updateInterval";
    v24[0] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a4);
    v23[1] = @"sequenceNumberStart";
    v24[1] = +[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a5);
    v23[2] = @"timeSessionStart";
    v24[2] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", sub_101171D4C());
    -[NSMutableDictionary setObject:forKeyedSubscript:]( -[CLPedestrianFenceAnalyticsManager activeOdometryClients](self, "activeOdometryClients"),  "setObject:forKeyedSubscript:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v24,  v23,  3LL),  a3);
    -[CLPedestrianFenceAnalyticsManager completeIntervalEventForClient:endingAt:setNew:]( self,  "completeIntervalEventForClient:endingAt:setNew:",  a3,  a5,  1LL);
LABEL_21:
    objc_msgSend( v9,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a4),  @"updateInterval");
    sub_100E575BC((uint64_t)v9, (uint64_t)"InertialOdometryPowerMetric");
    return;
  }

  id v11 = -[NSMutableDictionary objectForKey:]( -[CLPedestrianFenceAnalyticsManager activeOdometryClients](self, "activeOdometryClients"),  "objectForKey:",  a3);
  if (v11)
  {
    id v12 = v11;
    -[CLPedestrianFenceAnalyticsManager completeIntervalEventForClient:endingAt:setNew:]( self,  "completeIntervalEventForClient:endingAt:setNew:",  a3,  a5,  0LL);
    v26[0] = a3;
    v25[0] = @"clientId";
    v25[1] = @"updateRate";
    objc_msgSend(objc_msgSend(v12, "objectForKeyedSubscript:", @"updateInterval"), "doubleValue");
    double v14 = v13;
    double v15 = 0.0;
    if (v14 != 0.0)
    {
      if (v14 <= 1.0) {
        double v15 = 1.0 / v14;
      }
      else {
        double v15 = -v14;
      }
    }

    v26[1] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v15);
    v25[2] = @"sessionDuration";
    double v19 = sub_101171D4C();
    objc_msgSend(objc_msgSend(v12, "objectForKeyedSubscript:", @"timeSessionStart"), "doubleValue");
    v26[2] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v19 - v20);
    v25[3] = @"sequenceNumberStart";
    v26[3] = objc_msgSend(v12, "objectForKeyedSubscript:");
    v25[4] = @"sequenceNumberEnd";
    v25[5] = @"metricType";
    v26[4] = +[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a5);
    v26[5] = &off_1018D38C0;
    id v21 = -[NSDictionary mutableCopy]( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v26,  v25,  6LL),  "mutableCopy");
    -[NSMutableArray addObject:]( -[CLPedestrianFenceAnalyticsManager completedSessionsAwaitingPackets](self, "completedSessionsAwaitingPackets"),  "addObject:",  v21);

    objc_msgSend(objc_msgSend(v12, "objectForKeyedSubscript:", @"updateInterval"), "doubleValue");
    a4 = v22;
    -[NSMutableDictionary removeObjectForKey:]( -[CLPedestrianFenceAnalyticsManager activeOdometryClients](self, "activeOdometryClients"),  "removeObjectForKey:",  a3);
    -[CLPedestrianFenceAnalyticsManager sendAnalyticsForAllReadySessions](self, "sendAnalyticsForAllReadySessions");
    goto LABEL_21;
  }

  if (qword_101934780 != -1) {
    dispatch_once(&qword_101934780, &stru_10184D750);
  }
  unint64_t v16 = (os_log_s *)qword_101934788;
  if (os_log_type_enabled((os_log_t)qword_101934788, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v30 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "[Analytics] Can't end fence session for client %{public}@ that never started",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934780 != -1) {
      dispatch_once(&qword_101934780, &stru_10184D750);
    }
    int v27 = 138543362;
    id v28 = a3;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934788,  16LL,  "[Analytics] Can't end fence session for client %{public}@ that never started",  &v27,  12);
    uint64_t v18 = (uint8_t *)v17;
    sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLPedestrianFenceAnalyticsManager odometryClient:requestInterval:sequenceNumber:]",  "%s\n",  v17);
    if (v18 != buf) {
      free(v18);
    }
  }

- (BOOL)isAnySessionActive
{
  return -[NSMutableDictionary count]( -[CLPedestrianFenceAnalyticsManager activeFenceSessions](self, "activeFenceSessions"),  "count")
      || -[NSMutableDictionary count]( -[CLPedestrianFenceAnalyticsManager activeOdometryClients](self, "activeOdometryClients"),  "count") != 0LL;
}

- (void)createIntervalEventStartingAt:(unint64_t)a3
{
  if (-[NSMutableDictionary count]( -[CLPedestrianFenceAnalyticsManager activeFenceSessions](self, "activeFenceSessions"),  "count"))
  {
    -[CLPedestrianFenceAnalyticsManager completeIntervalEventForClient:endingAt:setNew:]( self,  "completeIntervalEventForClient:endingAt:setNew:",  @"fenceClient",  a3,  1LL);
  }

  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v5 = -[CLPedestrianFenceAnalyticsManager activeOdometryClients](self, "activeOdometryClients", 0LL);
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
        -[CLPedestrianFenceAnalyticsManager completeIntervalEventForClient:endingAt:setNew:]( self,  "completeIntervalEventForClient:endingAt:setNew:",  *(void *)(*((void *)&v10 + 1) + 8LL * (void)v9),  a3,  1LL);
        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v7);
  }

- (void)sendAnalyticsForAllReadySessions
{
  if (self->_odometryPackets.__tree_.__pair3_.__value_)
  {
    left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, (anonymous namespace)::OdometryPacket>, void *>>> **)self->_odometryPackets.__tree_.__pair1_.__value_.__left_;
    p_pair1 = &self->_odometryPackets.__tree_.__pair1_;
    if (left)
    {
      do
      {
        objc_super v4 = left;
        left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, (anonymous namespace)::OdometryPacket>, void *>>> **)left[1];
      }

      while (left);
    }

    else
    {
      id v5 = &self->_odometryPackets.__tree_.__pair1_;
      do
      {
        objc_super v4 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, (anonymous namespace)::OdometryPacket>, void *>>> **)v5[2].__value_.__left_;
        BOOL v6 = *v4 == v5;
        id v5 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, (anonymous namespace)::OdometryPacket>, void *>>> *)v4;
      }

      while (v6);
    }

    unint64_t v51 = (unint64_t)v4[4];
    id v48 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    v52 = self;
    obj = -[CLPedestrianFenceAnalyticsManager completedSessionsAwaitingPackets]( self,  "completedSessionsAwaitingPackets");
    id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v55,  v79,  16LL);
    if (v7)
    {
      p_odometryPackets = (uint64_t **)&self->_odometryPackets;
      uint64_t v50 = *(void *)v56;
      do
      {
        uint64_t v8 = 0LL;
        do
        {
          if (*(void *)v56 != v50) {
            objc_enumerationMutation(obj);
          }
          id v9 = *(void **)(*((void *)&v55 + 1) + 8LL * (void)v8);
          uint64_t v10 = objc_msgSend( objc_msgSend(v9, "objectForKeyedSubscript:", @"sequenceNumberEnd"),  "unsignedShortValue");
          unint64_t v11 = v10 - 1;
          if (v51 < v10 - 1) {
            goto LABEL_55;
          }
          unint64_t v12 = objc_msgSend( objc_msgSend(v9, "objectForKeyedSubscript:", @"sequenceNumberStart"),  "unsignedShortValue");
          unint64_t v54 = v12;
          unsigned int v13 = objc_msgSend( objc_msgSend(v9, "objectForKeyedSubscript:", @"metricType"),  "intValue");
          [v9 removeObjectForKey:@"sequenceNumberStart"];
          [v9 removeObjectForKey:@"sequenceNumberEnd"];
          if (!v13) {
            [v9 removeObjectForKey:@"metricType"];
          }
          id v14 = -[CLPedestrianFenceAnalyticsManager aggregateStatsFromPacket:to:useAOPDuration:]( v52,  "aggregateStatsFromPacket:to:useAOPDuration:",  v12,  v10,  v13 == 2);
          [v9 addEntriesFromDictionary:v14];
          double v15 = sub_101171D4C();
          double v16 = v15;
          if (v13 == 2 && v15 - v52->_timestampLastLog <= 0.5) {
            goto LABEL_49;
          }
          int v17 = (uint64_t *)p_pair1->__value_.__left_;
          if (!p_pair1->__value_.__left_)
          {
            double v20 = 0LL;
            goto LABEL_32;
          }

          uint64_t v18 = p_pair1->__value_.__left_;
          do
          {
            unint64_t v19 = v18[4];
            if (v19 <= v12)
            {
              if (v19 >= v12)
              {
                double v20 = sub_1007425A8(p_odometryPackets, &v54)[15];
                int v17 = (uint64_t *)p_pair1->__value_.__left_;
                if (p_pair1->__value_.__left_) {
                  goto LABEL_27;
                }
LABEL_32:
                __int128 v23 = 0LL;
                goto LABEL_33;
              }

              ++v18;
            }

            uint64_t v18 = (void *)*v18;
          }

          while (v18);
          double v20 = 0LL;
          if (!v17) {
            goto LABEL_32;
          }
LABEL_27:
          id v21 = v17;
          while (2)
          {
            unint64_t v22 = v21[4];
            if (v11 < v22)
            {
LABEL_31:
              id v21 = (uint64_t *)*v21;
              if (!v21) {
                goto LABEL_32;
              }
              continue;
            }

            break;
          }

          if (v22 < v11)
          {
            ++v21;
            goto LABEL_31;
          }

          do
          {
            while (1)
            {
              v32 = (uint64_t **)v17;
              unint64_t v33 = v17[4];
              if (v11 >= v33) {
                break;
              }
              int v17 = *v32;
              if (!*v32)
              {
                id v34 = v32;
                goto LABEL_63;
              }
            }

            if (v33 >= v11) {
              goto LABEL_64;
            }
            int v17 = v32[1];
          }

          while (v17);
          id v34 = v32 + 1;
LABEL_63:
          unint64_t v35 = (char *)operator new(0xB0uLL);
          *((void *)v35 + 4) = v11;
          *(_OWORD *)(v35 + 40) = 0u;
          *(_OWORD *)(v35 + 56) = 0u;
          *(_OWORD *)(v35 + 72) = 0u;
          *(_OWORD *)(v35 + 88) = 0u;
          *(_OWORD *)(v35 + 104) = 0u;
          *(_OWORD *)(v35 + 120) = 0u;
          *(_OWORD *)(v35 + 136) = 0u;
          *(_OWORD *)(v35 + 152) = 0u;
          *((void *)v35 + 21) = 0LL;
          sub_1000085FC(p_odometryPackets, (uint64_t)v32, v34, (uint64_t *)v35);
          v32 = (uint64_t **)v35;
LABEL_64:
          __int128 v23 = v32[21];
LABEL_33:
          if (qword_101934780 != -1) {
            dispatch_once(&qword_101934780, &stru_10184D750);
          }
          __int128 v24 = (os_log_s *)qword_101934788;
          if (os_log_type_enabled((os_log_t)qword_101934788, OS_LOG_TYPE_DEFAULT))
          {
            v25 = "unexpected";
            if (v13 == 2) {
              v25 = "interval";
            }
            if (v13 == 1) {
              v25 = "odometrySession";
            }
            if (v13) {
              id v26 = v25;
            }
            else {
              id v26 = "fenceSession";
            }
            if (v13) {
              int v27 = @"clientId";
            }
            else {
              int v27 = @"fenceId";
            }
            id v28 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v26);
            id v29 = [v9 objectForKeyedSubscript:v27];
            *(_DWORD *)buf = 138544386;
            v70 = v28;
            __int16 v71 = 2114;
            id v72 = v29;
            __int16 v73 = 2050;
            v74 = v20;
            __int16 v75 = 2050;
            v76 = v23;
            __int16 v77 = 2114;
            id v78 = v14;
            _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "[Analytics] type,%{public}@,client,%{public}@,from,%{public}f,to,%{public}f: %{public}@",  buf,  0x34u);
          }

          if (sub_1002921D0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_101934780 != -1) {
              dispatch_once(&qword_101934780, &stru_10184D750);
            }
            uint64_t v36 = qword_101934788;
            __int128 v37 = "unexpected";
            if (v13 == 2) {
              __int128 v37 = "interval";
            }
            if (v13 == 1) {
              __int128 v37 = "odometrySession";
            }
            if (v13) {
              __int128 v38 = v37;
            }
            else {
              __int128 v38 = "fenceSession";
            }
            if (v13) {
              __int128 v39 = @"clientId";
            }
            else {
              __int128 v39 = @"fenceId";
            }
            __int128 v40 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v38);
            id v41 = [v9 objectForKeyedSubscript:v39];
            int v59 = 138544386;
            v60 = v40;
            __int16 v61 = 2114;
            id v62 = v41;
            __int16 v63 = 2050;
            v64 = v20;
            __int16 v65 = 2050;
            v66 = v23;
            __int16 v67 = 2114;
            id v68 = v14;
            LODWORD(v45) = 52;
            _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v36,  0LL,  "[Analytics] type,%{public}@,client,%{public}@,from,%{public}f,to,%{public}f: %{public}@",  &v59,  v45);
            v43 = (uint8_t *)v42;
            sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLPedestrianFenceAnalyticsManager sendAnalyticsForAllReadySessions]",  "%s\n",  v42);
            if (v43 != buf) {
              free(v43);
            }
          }

          v52->_timestampLastLog = v16;
          if (v13 == 2)
          {
LABEL_49:
            if ((objc_msgSend( objc_msgSend(v9, "objectForKeyedSubscript:", @"clientId"),  "isEqualToString:",  @"fenceClient") & 1) == 0) {
              goto LABEL_50;
            }
          }

          else
          {
LABEL_50:
            if (v13) {
              id v30 = @"com.apple.CoreMotion.InertialOdometry";
            }
            else {
              id v30 = @"com.apple.CoreMotion.PedestrianFenceSession";
            }
            double v31 = +[NSDictionary dictionaryWithDictionary:](&OBJC_CLASS___NSDictionary, "dictionaryWithDictionary:", v9);
            v53[0] = _NSConcreteStackBlock;
            v53[1] = 3221225472LL;
            v53[2] = sub_100743334;
            v53[3] = &unk_101820740;
            v53[4] = v31;
            AnalyticsSendEventLazy(v30, v53);
          }

          [v48 addObject:v9];
LABEL_55:
          uint64_t v8 = (char *)v8 + 1;
        }

        while (v8 != v7);
        id v44 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v55,  v79,  16LL);
        id v7 = v44;
      }

      while (v44);
    }

    -[NSMutableArray removeObjectsInArray:]( -[CLPedestrianFenceAnalyticsManager completedSessionsAwaitingPackets](v52, "completedSessionsAwaitingPackets"),  "removeObjectsInArray:",  v48);
    -[CLPedestrianFenceAnalyticsManager cleanupPackets](v52, "cleanupPackets");
  }

- (id)aggregateStatsFromPacket:(unint64_t)a3 to:(unint64_t)a4 useAOPDuration:(BOOL)a5
{
  HIDWORD(v5) = 0;
  char v56 = 0;
  memset(v55, 0, sizeof(v55));
  *(_DWORD *)((char *)&v55[4] + 1) = 2139095039;
  *(_DWORD *)((char *)&v55[5] + 1) = 2139095039;
  unint64_t v54 = a3;
  if (a3 >= a4) {
    return &__NSDictionary0__struct;
  }
  unint64_t v7 = a3;
  BOOL v47 = a5;
  uint64_t v53 = 0LL;
  unsigned __int16 v9 = 0;
  p_odometryPackets = (uint64_t **)&self->_odometryPackets;
  int v10 = 0;
  LODWORD(v5) = 2139095039;
  float v11 = 0.0;
  float v12 = 0.0;
  double v49 = v5;
  double v51 = v5;
  double v52 = 0.0;
  float v13 = 0.0;
  float v14 = 0.0;
  float v50 = 0.0;
  float v15 = 0.0;
  float v16 = 0.0;
  do
  {
    for (i = self->_odometryPackets.__tree_.__pair1_.__value_.__left_; i; i = (void *)*i)
    {
      unint64_t v18 = i[4];
      if (v7 >= v18)
      {
        if (v18 >= v7)
        {
          unint64_t v22 = sub_1007425A8(p_odometryPackets, &v54);
          for (uint64_t j = 0LL; j != 20; j += 4LL)
          {
            float v24 = *(float *)((char *)v22 + j + 13);
            *(float *)(((unint64_t)v55 | 0xD) + j) = v24 + *(float *)(((unint64_t)v55 | 0xD) + j);
            float v16 = v16 + v24;
          }

          uint64_t v25 = 0LL;
          float v15 = *(float *)((char *)v22 + 33) + *(float *)((char *)&v55[2] + 1);
          *(float *)((char *)&v55[2] + 1) = v15;
          do
          {
            v25 += 4LL;
          }

          while (v25 != 20);
          int8x8_t v26 = *(int8x8_t *)((char *)v22 + 65);
          *(float32x2_t *)((char *)&v55[3] + 9) = vadd_f32( *(float32x2_t *)((char *)v22 + 57),  *(float32x2_t *)((char *)&v55[3] + 9));
          *(int8x8_t *)((char *)&v55[4] + 1) = vbsl_s8( (int8x8_t)vcgt_f32( (float32x2_t)__PAIR64__( v26.u32[1],  *(unsigned int *)((char *)&v55[4] + 1)),  (float32x2_t)__PAIR64__( *(unsigned int *)((char *)&v55[4] + 5),  v26.u32[0])),  v26,  *(int8x8_t *)((char *)&v55[4] + 1));
          int8x8_t v27 = *(int8x8_t *)((char *)v22 + 81);
          *(float32x2_t *)((char *)&v55[4] + 9) = vadd_f32( *(float32x2_t *)((char *)v22 + 73),  *(float32x2_t *)((char *)&v55[4] + 9));
          *(int8x8_t *)((char *)&v55[5] + 1) = vbsl_s8( (int8x8_t)vcgt_f32( (float32x2_t)__PAIR64__( v27.u32[1],  *(unsigned int *)((char *)&v55[5] + 1)),  (float32x2_t)__PAIR64__( *(unsigned int *)((char *)&v55[5] + 5),  v27.u32[0])),  v27,  *(int8x8_t *)((char *)&v55[5] + 1));
          float v11 = *(float *)((char *)v22 + 89) + *(float *)((char *)&v55[5] + 9);
          *(float *)((char *)&v55[5] + 9) = v11;
          v9 += *(_WORD *)((char *)v22 + 93);
          LOWORD(v53) = v53 + *(_WORD *)((char *)v22 + 95);
          WORD2(v53) += *(_WORD *)((char *)v22 + 97);
          float v50 = *(float *)((char *)&v55[3] + 9);
          double v51 = *(double *)((char *)&v55[4] + 1);
          float v14 = *(float *)((char *)&v55[3] + 13);
          double v52 = *(double *)((char *)&v55[4] + 9);
          float v12 = *(float *)((char *)&v55[4] + 13);
          float v13 = *(float *)((char *)&v55[4] + 5);
          double v49 = *(double *)((char *)&v55[5] + 1);
          int v10 = *(_DWORD *)((char *)&v55[5] + 5);
          goto LABEL_22;
        }

        ++i;
      }
    }

    if (qword_101934780 != -1) {
      dispatch_once(&qword_101934780, &stru_10184D750);
    }
    unint64_t v19 = (os_log_s *)qword_101934788;
    if (os_log_type_enabled((os_log_t)qword_101934788, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349056;
      unint64_t v60 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Missing packet with sequence number: %{public}llu",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934780 != -1) {
        dispatch_once(&qword_101934780, &stru_10184D750);
      }
      int v57 = 134349056;
      unint64_t v58 = v7;
      LODWORD(v46) = 12;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934788,  0LL,  "Missing packet with sequence number: %{public}llu",  &v57,  v46);
      id v21 = (uint8_t *)v20;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLPedestrianFenceAnalyticsManager aggregateStatsFromPacket:to:useAOPDuration:]",  "%s\n",  v20);
      if (v21 != buf) {
        free(v21);
      }
    }

- (void)completeIntervalEventForClient:(id)a3 endingAt:(unint64_t)a4 setNew:(BOOL)a5
{
  BOOL v5 = a5;
  if (-[NSMutableDictionary objectForKey:]( -[CLPedestrianFenceAnalyticsManager activeIntervalEvents](self, "activeIntervalEvents"),  "objectForKey:",  a3)
    && objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:]( -[CLPedestrianFenceAnalyticsManager activeIntervalEvents](self, "activeIntervalEvents"),  "objectForKeyedSubscript:",  a3),  "unsignedLongLongValue") != (id)a4)
  {
    id v9 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
    v15[0] = a3;
    v14[0] = @"clientId";
    v14[1] = @"sequenceNumberStart";
    v15[1] = -[NSMutableDictionary objectForKeyedSubscript:]( -[CLPedestrianFenceAnalyticsManager activeIntervalEvents](self, "activeIntervalEvents"),  "objectForKeyedSubscript:",  a3);
    void v14[2] = @"sequenceNumberEnd";
    v14[3] = @"metricType";
    v15[2] = +[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4);
    v15[3] = &off_1018D38D8;
    objc_msgSend( v9,  "addEntriesFromDictionary:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  4));
    id v10 = -[NSMutableDictionary objectForKeyedSubscript:]( -[CLPedestrianFenceAnalyticsManager activeOdometryClients](self, "activeOdometryClients"),  "objectForKeyedSubscript:",  a3);
    if (v10)
    {
      objc_msgSend(objc_msgSend(v10, "objectForKeyedSubscript:", @"updateInterval"), "doubleValue");
      double v12 = v11;
      double v13 = 0.0;
      if (v12 != 0.0)
      {
        if (v12 <= 1.0) {
          double v13 = 1.0 / v12;
        }
        else {
          double v13 = -v12;
        }
      }

      objc_msgSend( v9,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v13),  @"updateRate");
    }

    -[NSMutableArray addObject:]( -[CLPedestrianFenceAnalyticsManager completedSessionsAwaitingPackets](self, "completedSessionsAwaitingPackets"),  "addObject:",  v9);
  }

  if (v5) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( -[CLPedestrianFenceAnalyticsManager activeIntervalEvents](self, "activeIntervalEvents"),  "setObject:forKeyedSubscript:",  +[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4),  a3);
  }
  else {
    -[NSMutableDictionary removeObjectForKey:]( -[CLPedestrianFenceAnalyticsManager activeIntervalEvents](self, "activeIntervalEvents"),  "removeObjectForKey:",  a3);
  }
}

- (void)cleanupPackets
{
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  id v3 = -[NSMutableDictionary allValues]( -[CLPedestrianFenceAnalyticsManager activeOdometryClients](self, "activeOdometryClients"),  "allValues");
  id v4 = [v3 countByEnumeratingWithState:&v42 objects:v49 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v43;
    unint64_t v6 = -1LL;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v43 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v42 + 1) + 8LL * (void)i);
        if (v6 >= objc_msgSend( objc_msgSend(v8, "objectForKeyedSubscript:", @"sequenceNumberStart"),  "unsignedShortValue")) {
          unint64_t v6 = objc_msgSend( objc_msgSend(v8, "objectForKeyedSubscript:", @"sequenceNumberStart"),  "unsignedShortValue");
        }
      }

      id v4 = [v3 countByEnumeratingWithState:&v42 objects:v49 count:16];
    }

    while (v4);
  }

  else
  {
    unint64_t v6 = -1LL;
  }

  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  id v9 = -[NSMutableDictionary allValues]( -[CLPedestrianFenceAnalyticsManager activeFenceSessions](self, "activeFenceSessions"),  "allValues");
  id v10 = [v9 countByEnumeratingWithState:&v38 objects:v48 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v39;
    do
    {
      for (uint64_t j = 0LL; j != v10; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v39 != v11) {
          objc_enumerationMutation(v9);
        }
        double v13 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)j);
      }

      id v10 = [v9 countByEnumeratingWithState:&v38 objects:v48 count:16];
    }

    while (v10);
  }

  if (!-[NSMutableDictionary count]( -[CLPedestrianFenceAnalyticsManager activeFenceSessions](self, "activeFenceSessions"),  "count")
    && !-[NSMutableDictionary count]( -[CLPedestrianFenceAnalyticsManager activeOdometryClients](self, "activeOdometryClients"),  "count"))
  {
    -[NSMutableDictionary removeAllObjects]( -[CLPedestrianFenceAnalyticsManager activeIntervalEvents](self, "activeIntervalEvents"),  "removeAllObjects");
  }

  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id v14 = -[NSMutableDictionary allValues]( -[CLPedestrianFenceAnalyticsManager activeIntervalEvents](self, "activeIntervalEvents"),  "allValues");
  id v15 = [v14 countByEnumeratingWithState:&v34 objects:v47 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v35;
    do
    {
      for (k = 0LL; k != v15; k = (char *)k + 1)
      {
        if (*(void *)v35 != v16) {
          objc_enumerationMutation(v14);
        }
        unint64_t v18 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)k);
      }

      id v15 = [v14 countByEnumeratingWithState:&v34 objects:v47 count:16];
    }

    while (v15);
  }

  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  unint64_t v19 = -[CLPedestrianFenceAnalyticsManager completedSessionsAwaitingPackets]( self,  "completedSessionsAwaitingPackets",  0LL);
  id v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v19,  "countByEnumeratingWithState:objects:count:",  &v30,  v46,  16LL);
  if (v20)
  {
    uint64_t v21 = *(void *)v31;
    do
    {
      for (m = 0LL; m != v20; m = (char *)m + 1)
      {
        if (*(void *)v31 != v21) {
          objc_enumerationMutation(v19);
        }
        __int128 v23 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)m);
        if (v6 >= objc_msgSend( objc_msgSend(v23, "objectForKeyedSubscript:", @"sequenceNumberStart"),  "unsignedShortValue")) {
          unint64_t v6 = objc_msgSend( objc_msgSend(v23, "objectForKeyedSubscript:", @"sequenceNumberStart"),  "unsignedShortValue");
        }
      }

      id v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v19,  "countByEnumeratingWithState:objects:count:",  &v30,  v46,  16LL);
    }

    while (v20);
  }

  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, (anonymous namespace)::OdometryPacket>, void *>>> *)self->_odometryPackets.__tree_.__begin_node_;
  if (begin_node != &self->_odometryPackets.__tree_.__pair1_)
  {
    do
    {
      left = (CLPedestrianFenceAnalyticsManager *)begin_node[1].__value_.__left_;
      if (begin_node[4].__value_.__left_ >= (void *)v6)
      {
        if (left)
        {
          do
          {
            int8x8_t v27 = left;
            left = (CLPedestrianFenceAnalyticsManager *)left->super.isa;
          }

          while (left);
        }

        else
        {
          do
          {
            int8x8_t v27 = (CLPedestrianFenceAnalyticsManager *)begin_node[2].__value_.__left_;
            BOOL v28 = v27->super.isa == (Class)begin_node;
            begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, (anonymous namespace)::OdometryPacket>, void *>>> *)v27;
          }

          while (!v28);
        }
      }

      else
      {
        int8x8_t v26 = (CLPedestrianFenceAnalyticsManager *)begin_node;
        if (left)
        {
          do
          {
            int8x8_t v27 = left;
            left = (CLPedestrianFenceAnalyticsManager *)left->super.isa;
          }

          while (left);
        }

        else
        {
          do
          {
            int8x8_t v27 = (CLPedestrianFenceAnalyticsManager *)v26->_odometryPackets.__tree_.__begin_node_;
            BOOL v28 = v27->super.isa == (Class)v26;
            int8x8_t v26 = v27;
          }

          while (!v28);
        }

        if (self->_odometryPackets.__tree_.__begin_node_ == begin_node) {
          self->_odometryPackets.__tree_.__begin_node_ = v27;
        }
        double v29 = (uint64_t *)self->_odometryPackets.__tree_.__pair1_.__value_.__left_;
        --self->_odometryPackets.__tree_.__pair3_.__value_;
        sub_100008858(v29, (uint64_t *)begin_node);
        operator delete(begin_node);
      }

      begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, (anonymous namespace)::OdometryPacket>, void *>>> *)v27;
    }

    while (v27 != (CLPedestrianFenceAnalyticsManager *)&self->_odometryPackets.__tree_.__pair1_);
  }

- (NSMutableDictionary)activeOdometryClients
{
  return self->_activeOdometryClients;
}

- (void)setActiveOdometryClients:(id)a3
{
}

- (NSMutableDictionary)activeIntervalEvents
{
  return self->_activeIntervalEvents;
}

- (void)setActiveIntervalEvents:(id)a3
{
}

- (NSMutableDictionary)activeFenceSessions
{
  return self->_activeFenceSessions;
}

- (void)setActiveFenceSessions:(id)a3
{
}

- (NSMutableArray)completedSessionsAwaitingPackets
{
  return self->_completedSessionsAwaitingPackets;
}

- (void)setCompletedSessionsAwaitingPackets:(id)a3
{
}

- (NSMutableDictionary)fenceHistoryPerSession
{
  return self->_fenceHistoryPerSession;
}

- (void)setFenceHistoryPerSession:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0LL;
  *((void *)self + 3) = 0LL;
  *((void *)self + 2) = (char *)self + 24;
  return self;
}

@end