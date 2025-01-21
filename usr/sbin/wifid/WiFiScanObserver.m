@interface WiFiScanObserver
- (NSMutableArray)callbacks;
- (WiFiScanObserver)init;
- (id)scanResultsCallback;
- (void)addScanResultsCallback:(id)a3;
- (void)dealloc;
- (void)ingestScanResults:(id)a3 ofType:(unint64_t)a4 clientName:(id)a5 directed:(BOOL)a6;
- (void)removeScanResultsCallback:(id)a3;
- (void)setCallbacks:(id)a3;
- (void)setScanResultsCallback:(id)a3;
@end

@implementation WiFiScanObserver

- (WiFiScanObserver)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___WiFiScanObserver;
  v2 = -[WiFiScanObserver init](&v4, "init");
  if (v2) {
    v2->_callbacks = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  }
  return v2;
}

- (void)addScanResultsCallback:(id)a3
{
  if (a3) {
    -[NSMutableArray addObject:](-[WiFiScanObserver callbacks](self, "callbacks"), "addObject:", _Block_copy(a3));
  }
}

- (void)removeScanResultsCallback:(id)a3
{
  if (a3) {
    -[NSMutableArray removeObject:](-[WiFiScanObserver callbacks](self, "callbacks"), "removeObject:", a3);
  }
}

- (void)ingestScanResults:(id)a3 ofType:(unint64_t)a4 clientName:(id)a5 directed:(BOOL)a6
{
  BOOL v6 = a6;
  v11 = objc_autoreleasePoolPush();
  v12 = (void *)os_transaction_create("com.apple.wifid.WiFiScanObserver");
  if (a3 && -[NSMutableArray count](-[WiFiScanObserver callbacks](self, "callbacks"), "count"))
  {
    BOOL v28 = v6;
    v29 = v12;
    v30 = v11;
    v13 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    v14 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: ingested %lu networks",  "-[WiFiScanObserver ingestScanResults:ofType:clientName:directed:]",  objc_msgSend(a3, "count"));
    }
    objc_autoreleasePoolPop(v14);
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    id v15 = [a3 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v36;
      do
      {
        for (i = 0LL; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v36 != v17) {
            objc_enumerationMutation(a3);
          }
          v19 = -[WiFiScanObserverNetwork initWithWiFiNetworkRef:]( objc_alloc(&OBJC_CLASS___WiFiScanObserverNetwork),  "initWithWiFiNetworkRef:",  *(void *)(*((void *)&v35 + 1) + 8LL * (void)i));
          if (v19)
          {
            v20 = v19;
            -[NSMutableSet addObject:](v13, "addObject:", v19);
            CFRelease(v20);
          }
        }

        id v16 = [a3 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }

      while (v16);
    }

    if (!v13)
    {
      v27 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        [qword_100219F60 WFLog:@"%s: no networks to provide" message:3];
      }
      objc_autoreleasePoolPop(v27);
      v11 = v30;
      if (v12) {
        goto LABEL_30;
      }
      goto LABEL_31;
    }

    v21 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKey:]( v21,  "setObject:forKey:",  +[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4),  @"resultType");
    if (a5) {
      -[NSMutableDictionary setObject:forKey:](v21, "setObject:forKey:", a5, @"clientName");
    }
    if (v28) {
      -[NSMutableDictionary setObject:forKey:]( v21,  "setObject:forKey:",  +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL),  @"directed");
    }
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    v22 = -[WiFiScanObserver callbacks](self, "callbacks");
    id v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v31,  v39,  16LL);
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v32;
      do
      {
        for (j = 0LL; j != v24; j = (char *)j + 1)
        {
          if (*(void *)v32 != v25) {
            objc_enumerationMutation(v22);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v31 + 1) + 8LL * (void)j) + 16LL))();
        }

        id v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v31,  v39,  16LL);
      }

      while (v24);
    }

    if (v21) {
      CFRelease(v21);
    }
    CFRelease(v13);
    v12 = v29;
    v11 = v30;
  }

  if (v12) {
LABEL_30:
  }

LABEL_31:
  objc_autoreleasePoolPop(v11);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___WiFiScanObserver;
  -[WiFiScanObserver dealloc](&v3, "dealloc");
}

- (id)scanResultsCallback
{
  return self->scanResultsCallback;
}

- (void)setScanResultsCallback:(id)a3
{
}

- (NSMutableArray)callbacks
{
  return self->_callbacks;
}

- (void)setCallbacks:(id)a3
{
}

@end