@interface IDSUTunTimingLogger
+ (id)incomingEventWithTimestamp:(double)a3 duration:(double)a4 processTime:(double)a5 compressionTime:(double)a6 kernelTime:(double)a7 bytes:(int64_t)a8;
+ (id)kernelTestEventWithTimestamp:(double)a3 kernelTime:(double)a4 bytes:(int64_t)a5;
+ (id)outgoingEventWithTimestamp:(double)a3 duration:(double)a4 processTime:(double)a5 compressionTime:(double)a6 sendTime:(double)a7 bytes:(int64_t)a8;
- (IDSUTunTimingLogger)init;
- (void)addEvent:(id)a3;
- (void)printCurrent;
@end

@implementation IDSUTunTimingLogger

- (IDSUTunTimingLogger)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___IDSUTunTimingLogger;
  v2 = -[IDSUTunTimingLogger init](&v10, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.ids.utuntiminglogger", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    timingEvents = v2->_timingEvents;
    v2->_timingEvents = v7;
  }

  return v2;
}

+ (id)outgoingEventWithTimestamp:(double)a3 duration:(double)a4 processTime:(double)a5 compressionTime:(double)a6 sendTime:(double)a7 bytes:(int64_t)a8
{
  return  -[IDSUTunTimingEventOutgoing initWithTimestamp:duration:processTime:compressionTime:sendTime:bytes:]( objc_alloc(&OBJC_CLASS___IDSUTunTimingEventOutgoing),  "initWithTimestamp:duration:processTime:compressionTime:sendTime:bytes:",  a8,  a3,  a4,  a5,  a6,  a7);
}

+ (id)incomingEventWithTimestamp:(double)a3 duration:(double)a4 processTime:(double)a5 compressionTime:(double)a6 kernelTime:(double)a7 bytes:(int64_t)a8
{
  return  -[IDSUTunTimingEventIncoming initWithTimestamp:duration:processTime:compressionTime:kernelTime:bytes:]( objc_alloc(&OBJC_CLASS___IDSUTunTimingEventIncoming),  "initWithTimestamp:duration:processTime:compressionTime:kernelTime:bytes:",  a8,  a3,  a4,  a5,  a6,  a7);
}

+ (id)kernelTestEventWithTimestamp:(double)a3 kernelTime:(double)a4 bytes:(int64_t)a5
{
  return  -[IDSUTunTimingEventKernelTest initWithTimestamp:kernelTime:bytes:]( objc_alloc(&OBJC_CLASS___IDSUTunTimingEventKernelTest),  "initWithTimestamp:kernelTime:bytes:",  a5,  a3,  a4);
}

- (void)addEvent:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    if (!-[NSMutableArray count](self->_timingEvents, "count"))
    {
      if (qword_1009C0BE0 != -1) {
        dispatch_once(&qword_1009C0BE0, &stru_100901B20);
      }
      self->_lastPrintTime = *(double *)&qword_1009C0B68 * (double)mach_continuous_time();
    }

    -[NSMutableArray addObject:](self->_timingEvents, "addObject:", v5);
    if (qword_1009C0BE0 != -1) {
      dispatch_once(&qword_1009C0BE0, &stru_100901B20);
    }
    double v4 = *(double *)&qword_1009C0B68 * (double)mach_continuous_time();
    if (v4 - self->_lastPrintTime > 1.0)
    {
      self->_lastPrintTime = v4;
      -[IDSUTunTimingLogger printCurrent](self, "printCurrent");
    }
  }
}

- (void)printCurrent
{
  dispatch_queue_attr_t v3 = self->_timingEvents;
  double v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  timingEvents = self->_timingEvents;
  self->_timingEvents = v4;

  uint64_t v6 = mach_continuous_time();
  v7 = -[NSMutableString initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableString), "initWithCapacity:", 5000LL);
  -[NSMutableString appendFormat:]( v7,  "appendFormat:",  @"                [  timestamp  ]        total-time   processing-time  compression-only            kernel             bytes \n");
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  v8 = v3;
  id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v15,  v23,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      v12 = 0LL;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * (void)v12), "appendToString:", v7, (void)v15);
        v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v15,  v23,  16LL);
    }

    while (v10);
  }

  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utunController](&OBJC_CLASS___IDSFoundationLog, "utunController"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = mach_continuous_time();
    *(_DWORD *)buf = 134218242;
    double v20 = *(double *)&qword_1009C0B68 * (double)(v14 - v6);
    __int16 v21 = 2112;
    v22 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Timing events: (%0.9f to generate)\n%@",  buf,  0x16u);
  }
}

- (void).cxx_destruct
{
}

@end