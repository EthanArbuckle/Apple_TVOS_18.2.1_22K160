@interface _DASSystemWorkloadRecorder
+ (id)sharedInstance;
+ (unint64_t)bucketizedWorkload:(unint64_t)a3;
- (BOOL)recordWorkload:(unint64_t)a3 ofCategory:(unint64_t)a4 error:(id *)a5;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (PPSTelemetryIdentifier)ppsID;
- (_DASSystemWorkloadRecorder)init;
- (void)sendToPPS:(id)a3;
- (void)setLog:(id)a3;
- (void)setPpsID:(PPSTelemetryIdentifier *)a3;
- (void)setQueue:(id)a3;
@end

@implementation _DASSystemWorkloadRecorder

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100040794;
  block[3] = &unk_100114FE0;
  block[4] = a1;
  if (qword_1001578A0 != -1) {
    dispatch_once(&qword_1001578A0, block);
  }
  return (id)qword_100157898;
}

- (_DASSystemWorkloadRecorder)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS____DASSystemWorkloadRecorder;
  v2 = -[_DASSystemWorkloadRecorder init](&v10, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"systemWorkloadRecorder"));
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.duetactivityscheduler.systemWorkloadRecorder", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;
  }

  return v2;
}

+ (unint64_t)bucketizedWorkload:(unint64_t)a3
{
  unint64_t result = 100000LL;
  if (a3 > 0x186A0) {
    return 120000LL;
  }
  if (a3 <= 0x13880)
  {
    unint64_t result = 80000LL;
    if (a3 <= 0xFDE8)
    {
      if (a3 <= 0xC350)
      {
        if (a3 <= 0x9C40)
        {
          if (a3 <= 0x7530)
          {
            if (a3 <= 0x4E20)
            {
              if (a3 <= 0x2710)
              {
                if (a3 <= 0x1388)
                {
                  if (a3 <= 0x7D0)
                  {
                    if (a3 <= 0x1F4)
                    {
                      if (a3 <= 0x64)
                      {
                        if (a3) {
                          return 100LL;
                        }
                        else {
                          return 0LL;
                        }
                      }

                      else
                      {
                        return 500LL;
                      }
                    }

                    else
                    {
                      return 2000LL;
                    }
                  }

                  else
                  {
                    return 5000LL;
                  }
                }

                else
                {
                  return 10000LL;
                }
              }

              else
              {
                return 20000LL;
              }
            }

            else
            {
              return 30000LL;
            }
          }

          else
          {
            return 40000LL;
          }
        }

        else
        {
          return 50000LL;
        }
      }

      else
      {
        return 65000LL;
      }
    }
  }

  return result;
}

- (BOOL)recordWorkload:(unint64_t)a3 ofCategory:(unint64_t)a4 error:(id *)a5
{
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary", a3, a4, a5));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
  [v8 setObject:v9 forKeyedSubscript:@"WorkloadType"];

  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  +[_DASSystemWorkloadRecorder bucketizedWorkload:]( &OBJC_CLASS____DASSystemWorkloadRecorder,  "bucketizedWorkload:",  a3)));
  [v8 setObject:v10 forKeyedSubscript:@"Size"];

  -[_DASSystemWorkloadRecorder sendToPPS:](self, "sendToPPS:", v8);
  return 1;
}

- (void)sendToPPS:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[_DASPPSDataManager sharedInstance](&OBJC_CLASS____DASPPSDataManager, "sharedInstance"));
  [v4 sendDataToPPS:v3 subsystem:@"BackgroundProcessing" category:@"WorkloadInformation"];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (PPSTelemetryIdentifier)ppsID
{
  return self->_ppsID;
}

- (void)setPpsID:(PPSTelemetryIdentifier *)a3
{
  self->_ppsID = a3;
}

- (void).cxx_destruct
{
}

@end