@interface RPConnectionMetrics
+ (id)sharedMetrics;
- (NSMutableDictionary)rttMetrics;
- (RPConnectionMetrics)init;
- (unsigned)lengthToBucketIndex:(unint64_t)a3;
- (unsigned)linkTypeToBucketIndex:(int)a3;
- (unsigned)rttToBucketIndex:(unint64_t)a3;
- (void)logConnectionWithDeviceModelFrom:(id)a3 deviceModelTo:(id)a4 error:(id)a5 initiator:(id)a6 isOnDemand:(BOOL)a7 isStereoPair:(BOOL)a8 lifetime:(unint64_t)a9 linkType:(int)a10;
- (void)logMessageForClient:(id)a3 length:(unint64_t)a4 linkType:(int)a5;
- (void)logRequestOnLinkType:(int)a3 length:(unint64_t)a4 rtt:(unint64_t)a5;
- (void)reportMetrics;
- (void)setRttMetrics:(id)a3;
@end

@implementation RPConnectionMetrics

- (RPConnectionMetrics)init
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___RPConnectionMetrics;
  v2 = -[RPConnectionMetrics init](&v18, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_reportLock._os_unfair_lock_opaque = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_BACKGROUND, 0);
    v5 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();

    dispatch_queue_t v6 = dispatch_queue_create("RPConnectionMetrics", v5);
    reportQueue = v3->_reportQueue;
    v3->_reportQueue = (OS_dispatch_queue *)v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    rttMetrics = v3->_rttMetrics;
    v3->_rttMetrics = v8;

    dispatch_source_t v10 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, (dispatch_queue_t)v3->_reportQueue);
    reportTimer = v3->_reportTimer;
    v3->_reportTimer = (OS_dispatch_source *)v10;

    v12 = (dispatch_source_s *)v3->_reportTimer;
    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 3221225472LL;
    handler[2] = __27__RPConnectionMetrics_init__block_invoke;
    handler[3] = &unk_18A031A30;
    v13 = v3;
    v17 = v13;
    dispatch_source_set_event_handler(v12, handler);
    CUDispatchTimerSet();
    dispatch_resume((dispatch_object_t)v3->_reportTimer);
    v13->_eventCount = 0LL;
    v14 = v13;
  }

  return v3;
}

uint64_t __27__RPConnectionMetrics_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reportMetrics];
}

+ (id)sharedMetrics
{
  if (sharedMetrics_sOnce != -1) {
    dispatch_once(&sharedMetrics_sOnce, &__block_literal_global_2);
  }
  return (id)gMetrics;
}

void __36__RPConnectionMetrics_sharedMetrics__block_invoke()
{
  v0 = objc_alloc_init(&OBJC_CLASS___RPConnectionMetrics);
  v1 = (void *)gMetrics;
  gMetrics = (uint64_t)v0;
}

- (unsigned)lengthToBucketIndex:(unint64_t)a3
{
  if (a3 < 0x7D001) {
    char v3 = 3;
  }
  else {
    char v3 = 4;
  }
  if (a3 <= 0x19000) {
    char v3 = 2;
  }
  if (a3 >= 0x2801) {
    unsigned __int8 v4 = v3;
  }
  else {
    unsigned __int8 v4 = 1;
  }
  if (a3 < 0x401) {
    return 0;
  }
  return v4;
}

- (unsigned)linkTypeToBucketIndex:(int)a3
{
  if ((a3 & 0xFFFFFFFE) == 8) {
    char v3 = 3;
  }
  else {
    char v3 = 4;
  }
  if (a3 == 6) {
    char v3 = 2;
  }
  if (a3 == 4) {
    unsigned __int8 v4 = 1;
  }
  else {
    unsigned __int8 v4 = v3;
  }
  else {
    return 0;
  }
}

- (unsigned)rttToBucketIndex:(unint64_t)a3
{
  if (a3 < 0x1F5) {
    char v3 = 4;
  }
  else {
    char v3 = 5;
  }
  if (a3 >= 0xC9) {
    char v4 = v3;
  }
  else {
    char v4 = 3;
  }
  if (a3 >= 0x65) {
    char v5 = v4;
  }
  else {
    char v5 = 2;
  }
  if (a3 >= 0x33) {
    unsigned __int8 v6 = v5;
  }
  else {
    unsigned __int8 v6 = 1;
  }
  if (a3 < 0xB) {
    return 0;
  }
  return v6;
}

- (void)logConnectionWithDeviceModelFrom:(id)a3 deviceModelTo:(id)a4 error:(id)a5 initiator:(id)a6 isOnDemand:(BOOL)a7 isStereoPair:(BOOL)a8 lifetime:(unint64_t)a9 linkType:(int)a10
{
  BOOL v29 = a8;
  BOOL v10 = a7;
  v32[8] = *MEMORY[0x1895F89C0];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  objc_super v18 = (__CFString *)a6;
  os_unfair_lock_t lock = &self->_reportLock;
  os_unfair_lock_lock(&self->_reportLock);
  if (v17)
  {
    id v28 = v17;
    NSAppendPrintF();
    v19 = (__CFString *)0LL;
  }

  else
  {
    v19 = @"NoError";
  }

  if (v18) {
    v20 = v18;
  }
  else {
    v20 = @"Uknown";
  }
  int v21 = -[RPConnectionMetrics linkTypeToBucketIndex:](self, "linkTypeToBucketIndex:", a10, v28);
  v31[0] = @"deviceModelFrom";
  v31[1] = @"deviceModelTo";
  v22 = v15;
  v32[0] = v15;
  v32[1] = v16;
  v31[2] = @"error";
  v31[3] = @"initiator";
  v32[2] = v19;
  v32[3] = v20;
  v31[4] = @"isOnDemand";
  [MEMORY[0x189607968] numberWithBool:v10];
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v32[4] = v23;
  v31[5] = @"isStereoPair";
  [MEMORY[0x189607968] numberWithBool:v29];
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v32[5] = v24;
  v31[6] = @"lifetime";
  [MEMORY[0x189607968] numberWithUnsignedLongLong:a9];
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v32[6] = v25;
  v31[7] = @"linkType";
  [NSString stringWithCString:LinkTypeLabels[v21] encoding:4];
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v32[7] = v26;
  [MEMORY[0x189603F68] dictionaryWithObjects:v32 forKeys:v31 count:8];
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  CUMetricsLog();
  os_unfair_lock_unlock(lock);
}

- (void)logMessageForClient:(id)a3 length:(unint64_t)a4 linkType:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  v14[3] = *MEMORY[0x1895F89C0];
  p_reportLock = &self->_reportLock;
  id v9 = a3;
  os_unfair_lock_lock(p_reportLock);
  LODWORD(v5) = -[RPConnectionMetrics linkTypeToBucketIndex:](self, "linkTypeToBucketIndex:", v5);
  v14[0] = v9;
  v13[0] = @"client";
  v13[1] = @"lengthKB";
  [MEMORY[0x189607968] numberWithUnsignedInteger:a4 >> 10];
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v10;
  v13[2] = @"linkType";
  [NSString stringWithCString:LinkTypeLabels[v5] encoding:4];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v11;
  [MEMORY[0x189603F68] dictionaryWithObjects:v14 forKeys:v13 count:3];
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  CUMetricsLog();
  os_unfair_lock_unlock(p_reportLock);
}

- (void)logRequestOnLinkType:(int)a3 length:(unint64_t)a4 rtt:(unint64_t)a5
{
  uint64_t v7 = *(void *)&a3;
  p_reportLock = &self->_reportLock;
  os_unfair_lock_lock(&self->_reportLock);
  unint64_t v10 = self->_eventCount + 1;
  self->_eventCount = v10;
  if (v10 > 0x19)
  {
    int v11 = -[RPConnectionMetrics linkTypeToBucketIndex:](self, "linkTypeToBucketIndex:", v7);
    int v12 = -[RPConnectionMetrics lengthToBucketIndex:](self, "lengthToBucketIndex:", a4);
    int v13 = -[RPConnectionMetrics rttToBucketIndex:](self, "rttToBucketIndex:", a5);
    id v19 = (id)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%s,%s,%s",  LinkTypeLabels[v11],  LengthLabels[v12],  RTTLabels[v13]);
    v14 = -[NSMutableDictionary objectForKeyedSubscript:](self->_rttMetrics, "objectForKeyedSubscript:");
    rttMetrics = self->_rttMetrics;
    if (v14)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](rttMetrics, "objectForKeyedSubscript:", v19);
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = [v16 unsignedIntegerValue];

      [MEMORY[0x189607968] numberWithUnsignedInteger:v17 + 1];
      objc_super v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_rttMetrics, "setObject:forKeyedSubscript:", v18, v19);
    }

    else
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( rttMetrics,  "setObject:forKeyedSubscript:",  &unk_18A04DE70,  v19);
    }

    self->_sendReport = 1;
    os_unfair_lock_unlock(p_reportLock);
  }

  else
  {
    os_unfair_lock_unlock(p_reportLock);
  }

- (void)reportMetrics
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  p_reportLock = &self->_reportLock;
  os_unfair_lock_lock(&self->_reportLock);
  if (self->_sendReport)
  {
    os_unfair_lock_t lock = p_reportLock;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    -[NSMutableDictionary allKeys](self->_rttMetrics, "allKeys");
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = [obj countByEnumeratingWithState:&v19 objects:v25 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v20;
      do
      {
        for (uint64_t i = 0LL; i != v5; ++i)
        {
          if (*(void *)v20 != v6) {
            objc_enumerationMutation(obj);
          }
          v8 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          [v8 componentsSeparatedByString:@","];
          id v9 = (void *)objc_claimAutoreleasedReturnValue();
          v23[0] = @"rttCount";
          -[NSMutableDictionary objectForKey:](self->_rttMetrics, "objectForKey:", v8);
          unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
          v24[0] = v10;
          v23[1] = @"linkType";
          [v9 objectAtIndexedSubscript:0];
          int v11 = (void *)objc_claimAutoreleasedReturnValue();
          v24[1] = v11;
          v23[2] = @"lengthBytes";
          [v9 objectAtIndexedSubscript:1];
          int v12 = (void *)objc_claimAutoreleasedReturnValue();
          v24[2] = v12;
          v23[3] = @"rttMs";
          [v9 objectAtIndexedSubscript:2];
          int v13 = (void *)objc_claimAutoreleasedReturnValue();
          v24[3] = v13;
          [MEMORY[0x189603F68] dictionaryWithObjects:v24 forKeys:v23 count:4];
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          CUMetricsLog();
        }

        uint64_t v5 = [obj countByEnumeratingWithState:&v19 objects:v25 count:16];
      }

      while (v5);
    }

    [MEMORY[0x189603FC8] dictionary];
    id v15 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    rttMetrics = self->_rttMetrics;
    self->_rttMetrics = v15;

    self->_sendReport = 0;
    self->_eventCount = 0LL;
    os_unfair_lock_unlock(lock);
  }

  else
  {
    os_unfair_lock_unlock(p_reportLock);
  }

- (NSMutableDictionary)rttMetrics
{
  return self->_rttMetrics;
}

- (void)setRttMetrics:(id)a3
{
}

- (void).cxx_destruct
{
}

@end