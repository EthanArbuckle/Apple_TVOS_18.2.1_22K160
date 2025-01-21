@interface WiFiTimeDeferredNetworksAJManager
- (BOOL)canDeferNetwork:(__WiFiNetwork *)a3 withUsageRank:(unint64_t)a4 andMotionState:(int)a5;
- (BOOL)deferNetwork:(__WiFiNetwork *)a3;
- (BOOL)isTimeDeferredNetworksPresent;
- (WiFiTimeDeferredNetworksAJManager)initWithArgs:(__WiFiDeviceManager *)a3;
- (double)deferIntervalSecs;
- (unint64_t)numDaysSinceAssocOverrideDeferral;
- (unint64_t)usageRankForDeferral;
- (void)clearScanResultsForAutoJoinSessionReset;
- (void)dealloc;
- (void)printDeferredNetworks;
- (void)setDeferIntervalSecs:(double)a3;
- (void)setLinkDown;
- (void)setLinkUpForNetwork:(__WiFiNetwork *)a3;
- (void)setNumDaysSinceAssocOverrideDeferral:(unint64_t)a3;
- (void)setScanResultsWithAutoJoinSessionCompletion:(id)a3 complete:(BOOL)a4;
- (void)setUsageRankForDeferral:(unint64_t)a3;
@end

@implementation WiFiTimeDeferredNetworksAJManager

- (WiFiTimeDeferredNetworksAJManager)initWithArgs:(__WiFiDeviceManager *)a3
{
  v5 = objc_autoreleasePoolPush();
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___WiFiTimeDeferredNetworksAJManager;
  v6 = -[WiFiTimeDeferredNetworksAJManager init](&v10, "init");
  if (!v6)
  {
    v9 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: self" message:4 "-[WiFiTimeDeferredNetworksAJManager initWithArgs:]"];
    }
    goto LABEL_11;
  }

  if (!a3)
  {
    v9 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: delegate" message:4 "-[WiFiTimeDeferredNetworksAJManager initWithArgs:]"];
    }
LABEL_11:
    objc_autoreleasePoolPop(v9);

    v6 = 0LL;
    goto LABEL_6;
  }

  v6->_networks = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v6->_cumulativeAutoJoinScanResults = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v6->_deviceManager = a3;
  v7 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [qword_100219F60 WFLog:@"%s: initialized WiFiTimeDeferredNetworksAJManager" message:4 "%s: initialized WiFiTimeDeferredNetworksAJManager" "-[WiFiTimeDeferredNetworksAJManager initWithArgs:]"];
  }
  objc_autoreleasePoolPop(v7);
LABEL_6:
  objc_autoreleasePoolPop(v5);
  return v6;
}

- (void)dealloc
{
  v3 = objc_autoreleasePoolPush();
  -[NSMutableArray removeAllObjects](self->_networks, "removeAllObjects");

  -[NSMutableArray removeAllObjects](self->_cumulativeAutoJoinScanResults, "removeAllObjects");
  currentNetwork = self->_currentNetwork;
  if (currentNetwork)
  {
    CFRelease(currentNetwork);
    self->_currentNetwork = 0LL;
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___WiFiTimeDeferredNetworksAJManager;
  -[WiFiTimeDeferredNetworksAJManager dealloc](&v5, "dealloc");
  objc_autoreleasePoolPop(v3);
}

- (BOOL)canDeferNetwork:(__WiFiNetwork *)a3 withUsageRank:(unint64_t)a4 andMotionState:(int)a5
{
  v9 = objc_autoreleasePoolPush();
  uint64_t v36 = 0LL;
  v37 = &v36;
  uint64_t v38 = 0x2020000000LL;
  char v39 = 0;
  if (!self->_deviceManager)
  {
    v26 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: manager object is NULL" message:3];
    }
    goto LABEL_53;
  }

  if (!a3)
  {
    v26 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: network object is NULL" message:3 "-[WiFiTimeDeferredNetworksAJManager canDeferNetwork:withUsageRank:andMotionState:]"];
    }
    goto LABEL_53;
  }

  if (!-[WiFiTimeDeferredNetworksAJManager usageRankForDeferral](self, "usageRankForDeferral"))
  {
    v26 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: usageRankForDeferral is not correctly initialized" message:3 "-[WiFiTimeDeferredNetworksAJManager canDeferNetwork:withUsageRank:andMotionState:]"];
    }
    goto LABEL_53;
  }

  -[WiFiTimeDeferredNetworksAJManager deferIntervalSecs](self, "deferIntervalSecs");
  if (v10 == 0.0)
  {
    v26 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: deferIntervalSecs is not correctly initialized" message:3 "-[WiFiTimeDeferredNetworksAJManager canDeferNetwork:withUsageRank:andMotionState:]"];
    }
    goto LABEL_53;
  }

  if (!-[WiFiTimeDeferredNetworksAJManager numDaysSinceAssocOverrideDeferral]( self,  "numDaysSinceAssocOverrideDeferral"))
  {
    v26 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: numDaysSinceAssocOverrideDeferral is not correctly initialized" message:3 "-[WiFiTimeDeferredNetworksAJManager canDeferNetwork:withUsageRank:andMotionState:]"];
    }
LABEL_53:
    objc_autoreleasePoolPop(v26);
    goto LABEL_31;
  }

  v11 = sub_1000D8D10((uint64_t)self->_deviceManager, a3);
  if (v11)
  {
    else {
      unsigned int v12 = [+[WiFiAnalyticsManager sharedWiFiAnalyticsManager]( WiFiAnalyticsManager,  "sharedWiFiAnalyticsManager") isMovingNetwork:a3];
    }
    else {
      unsigned int v13 = [[WiFiAnalyticsManager sharedWiFiAnalyticsManager] isOmnipresentNetwork:a3];
    }
    uint64_t v14 = sub_1000DA400((uint64_t)self->_deviceManager, a3);
    if (!(_DWORD)v14) {
      goto LABEL_20;
    }
    if (sub_10009F9B8((uint64_t)v11) == 1
      || sub_100096670((uint64_t)v11) == 1
      || (v13 & 1) == 0
      && (-[WiFiTimeDeferredNetworksAJManager usageRankForDeferral](self, "usageRankForDeferral") > a4
       || (v12 & 1) == 0 && (a5 > 6 || ((1 << a5) & 0x58) == 0)))
    {
LABEL_30:
      CFRelease(v11);
      goto LABEL_31;
    }

    if (sub_1000973BC((uint64_t)a3)
      || sub_10009CF04((uint64_t)a3)
      || sub_100095318((BOOL)a3)
      || (unint64_t v23 = sub_10009A1FC(v11)) == 0
      || (-[NSDate timeIntervalSinceDate:](+[NSDate date](&OBJC_CLASS___NSDate, "date"), "timeIntervalSinceDate:", v23),
          -[WiFiTimeDeferredNetworksAJManager numDaysSinceAssocOverrideDeferral]( self,  "numDaysSinceAssocOverrideDeferral") < (unint64_t)(v24 / 86400.0)))
    {
LABEL_20:
      *((_BYTE *)v37 + 24) = 1;
    }

    else
    {
      v25 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        [(id)qword_100219F60 WFLog:3, "%s: not deferring %@ because it was recently joined", "-[WiFiTimeDeferredNetworksAJManager canDeferNetwork:withUsageRank:andMotionState:]", sub_100095BC8(v11) message];
      }
      objc_autoreleasePoolPop(v25);
      if (!*((_BYTE *)v37 + 24)) {
        goto LABEL_30;
      }
    }

    uint64_t v32 = 0LL;
    v33 = (double *)&v32;
    uint64_t v34 = 0x2020000000LL;
    uint64_t v35 = 0LL;
    uint64_t v28 = 0LL;
    v29 = &v28;
    uint64_t v30 = 0x2020000000LL;
    uint64_t v31 = 0x7FFFFFFFFFFFFFFFLL;
    networks = self->_networks;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_100139528;
    v27[3] = &unk_1001E6560;
    v27[7] = &v28;
    v27[8] = a3;
    v27[4] = self;
    v27[5] = &v32;
    v27[6] = &v36;
    -[NSMutableArray enumerateObjectsUsingBlock:](networks, "enumerateObjectsUsingBlock:", v27);
    if (*((_BYTE *)v37 + 24))
    {
      unsigned int v16 = -[WiFiTimeDeferredNetworksAJManager deferNetwork:](self, "deferNetwork:", a3);
      *((_BYTE *)v37 + 24) = v16;
      if (v16 && v33[3] != 0.0)
      {
        v17 = objc_autoreleasePoolPush();
        v18 = (void *)qword_100219F60;
        if (qword_100219F60)
        {
          v19 = sub_100095BC8(a3);
          -[WiFiTimeDeferredNetworksAJManager deferIntervalSecs](self, "deferIntervalSecs");
          [v18 WFLog:4, "%s: time-deferring %@ (isMoving:%d isOmnipresent:%d usageRank:%lu isSuitableAfterTd:%d) from auto join for a nother %2.1f seconds", "-[WiFiTimeDeferredNetworksAJManager canDeferNetwork:withUsageRank:andMotionState:]", v19, v12, v13, a4, v14, v20 - v33[3] message];
        }

        objc_autoreleasePoolPop(v17);
      }
    }

    else if (v29[3] != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[NSMutableArray removeObjectAtIndex:](self->_networks, "removeObjectAtIndex:");
      -[WiFiTimeDeferredNetworksAJManager printDeferredNetworks](self, "printDeferredNetworks");
    }

    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&v32, 8);
    goto LABEL_30;
  }

- (BOOL)deferNetwork:(__WiFiNetwork *)a3
{
  objc_super v5 = objc_autoreleasePoolPush();
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  networks = self->_networks;
  id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( networks,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
  if (!v7) {
    goto LABEL_12;
  }
  id v8 = v7;
  char v9 = 0;
  uint64_t v10 = *(void *)v18;
  do
  {
    for (i = 0LL; i != v8; i = (char *)i + 1)
    {
      if (*(void *)v18 != v10) {
        objc_enumerationMutation(networks);
      }
      unsigned int v12 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
      if ([v12 doesContain:a3])
      {
        [v12 setDeferredNetwork:a3];
        char v9 = 1;
      }
    }

    id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( networks,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
  }

  while (v8);
  if ((v9 & 1) != 0)
  {
    LOBYTE(v13) = 1;
  }

  else
  {
LABEL_12:
    uint64_t v14 = objc_alloc_init(&OBJC_CLASS___DeferredNetwork);
    if (v14)
    {
      v15 = v14;
      unsigned int v13 = -[DeferredNetwork setDeferredNetwork:](v14, "setDeferredNetwork:", a3);
      if (v13) {
        -[NSMutableArray addObject:](self->_networks, "addObject:", v15);
      }
    }

    else
    {
      LOBYTE(v13) = 0;
    }
  }

  objc_autoreleasePoolPop(v5);
  return v13;
}

- (void)clearScanResultsForAutoJoinSessionReset
{
}

- (void)setScanResultsWithAutoJoinSessionCompletion:(id)a3 complete:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = objc_autoreleasePoolPush();
  if (!a3)
  {
    unsigned int v12 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: scanResults NULL" message:4 "-[WiFiTimeDeferredNetworksAJManager setScanResultsWithAutoJoinSessionCompletion:complete:]"];
    }
    goto LABEL_15;
  }

  if (![a3 count])
  {
    unsigned int v12 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: no scan results" message:4 "-[WiFiTimeDeferredNetworksAJManager setScanResultsWithAutoJoinSessionCompletion:complete:]"];
    }
LABEL_15:
    objc_autoreleasePoolPop(v12);
    goto LABEL_10;
  }

  -[NSMutableArray addObjectsFromArray:](self->_cumulativeAutoJoinScanResults, "addObjectsFromArray:", a3);
  if (v4)
  {
    uint64_t v20 = 0LL;
    char v21 = &v20;
    uint64_t v22 = 0x3052000000LL;
    unint64_t v23 = sub_100139A34;
    double v24 = sub_100139A44;
    v25 = (NSMutableString *)0xAAAAAAAAAAAAAAAALL;
    v25 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
    uint64_t v14 = 0LL;
    v15 = &v14;
    uint64_t v16 = 0x3052000000LL;
    __int128 v17 = sub_100139A34;
    __int128 v18 = sub_100139A44;
    id v19 = (id)0xAAAAAAAAAAAAAAAALL;
    id v19 = +[NSMutableIndexSet indexSet](&OBJC_CLASS___NSMutableIndexSet, "indexSet");
    networks = self->_networks;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100139A50;
    v13[3] = &unk_1001E6588;
    v13[4] = self;
    v13[5] = &v14;
    v13[6] = &v20;
    -[NSMutableArray enumerateObjectsUsingBlock:](networks, "enumerateObjectsUsingBlock:", v13);
    id v9 = [(id)v15[5] count];
    uint64_t v10 = v21;
    if (v9 && v21[5])
    {
      v11 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        [(id)qword_100219F60 WFLog:3, "%s: Removing networks not found in cumulative AJ scan from time-deferred list: %@", "-[WiFiTimeDeferredNetworksAJManager setScanResultsWithAutoJoinSessionCompletion:complete:]", v21[5] message];
      }
      objc_autoreleasePoolPop(v11);
      -[NSMutableArray removeObjectsAtIndexes:](self->_networks, "removeObjectsAtIndexes:", v15[5]);
      -[WiFiTimeDeferredNetworksAJManager printDeferredNetworks](self, "printDeferredNetworks");
      uint64_t v10 = v21;
    }

    -[NSMutableArray removeAllObjects](self->_cumulativeAutoJoinScanResults, "removeAllObjects");
    _Block_object_dispose(&v14, 8);
    _Block_object_dispose(&v20, 8);
  }

- (void)setLinkUpForNetwork:(__WiFiNetwork *)a3
{
  objc_super v5 = objc_autoreleasePoolPush();
  uint64_t v9 = 0LL;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000LL;
  uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  networks = self->_networks;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100139D10;
  v8[3] = &unk_1001E65B0;
  v8[4] = &v9;
  v8[5] = a3;
  -[NSMutableArray enumerateObjectsUsingBlock:](networks, "enumerateObjectsUsingBlock:", v8);
  if (v10[3] != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSMutableArray removeObjectAtIndex:](self->_networks, "removeObjectAtIndex:");
    -[WiFiTimeDeferredNetworksAJManager printDeferredNetworks](self, "printDeferredNetworks");
  }

  currentNetwork = self->_currentNetwork;
  if (currentNetwork)
  {
    CFRelease(currentNetwork);
    self->_currentNetwork = 0LL;
  }

  self->_currentNetwork = (__WiFiNetwork *)sub_100094E60((uint64_t)kCFAllocatorDefault, (uint64_t)a3);
  _Block_object_dispose(&v9, 8);
  objc_autoreleasePoolPop(v5);
}

- (void)setLinkDown
{
  v3 = objc_autoreleasePoolPush();
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  networks = self->_networks;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100139E54;
  v6[3] = &unk_1001E65D8;
  v6[4] = self;
  v6[5] = &v7;
  -[NSMutableArray enumerateObjectsUsingBlock:](networks, "enumerateObjectsUsingBlock:", v6);
  if (v8[3] != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSMutableArray removeObjectAtIndex:](self->_networks, "removeObjectAtIndex:");
    -[WiFiTimeDeferredNetworksAJManager printDeferredNetworks](self, "printDeferredNetworks");
  }

  currentNetwork = self->_currentNetwork;
  if (currentNetwork)
  {
    CFRelease(currentNetwork);
    self->_currentNetwork = 0LL;
  }

  _Block_object_dispose(&v7, 8);
  objc_autoreleasePoolPop(v3);
}

- (BOOL)isTimeDeferredNetworksPresent
{
  return -[NSMutableArray count](self->_networks, "count") != 0LL;
}

- (void)printDeferredNetworks
{
  v3 = objc_autoreleasePoolPush();
  uint64_t v14 = 0LL;
  v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  id v17 = (id)0xAAAAAAAAAAAAAAAALL;
  id v17 = -[NSMutableArray count](self->_networks, "count");
  uint64_t v8 = 0LL;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000LL;
  uint64_t v11 = sub_100139A34;
  uint64_t v12 = sub_100139A44;
  unsigned int v13 = (NSMutableString *)0xAAAAAAAAAAAAAAAALL;
  unsigned int v13 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  if (v15[3])
  {
    if (v9[5])
    {
      networks = self->_networks;
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472LL;
      v7[2] = sub_10013A0A0;
      v7[3] = &unk_1001E6600;
      v7[4] = &v8;
      v7[5] = &v14;
      -[NSMutableArray enumerateObjectsUsingBlock:](networks, "enumerateObjectsUsingBlock:", v7);
      objc_super v5 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        [(id)qword_100219F60 WFLog:3, "%s: time-deferred networks list: %@", "-[WiFiTimeDeferredNetworksAJManager printDeferredNetworks]", v9[5] message];
      }
    }

    else
    {
      objc_super v5 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        [qword_100219F60 WFLog:@"%s: logString alloc failed" message:4];
      }
    }

    objc_autoreleasePoolPop(v5);
  }

  v6 = (void *)v9[5];
  if (v6) {

  }
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v14, 8);
  objc_autoreleasePoolPop(v3);
}

- (unint64_t)usageRankForDeferral
{
  return self->_usageRankForDeferral;
}

- (void)setUsageRankForDeferral:(unint64_t)a3
{
  self->_usageRankForDeferral = a3;
}

- (double)deferIntervalSecs
{
  return self->_deferIntervalSecs;
}

- (void)setDeferIntervalSecs:(double)a3
{
  self->_deferIntervalSecs = a3;
}

- (unint64_t)numDaysSinceAssocOverrideDeferral
{
  return self->_numDaysSinceAssocOverrideDeferral;
}

- (void)setNumDaysSinceAssocOverrideDeferral:(unint64_t)a3
{
  self->_numDaysSinceAssocOverrideDeferral = a3;
}

@end