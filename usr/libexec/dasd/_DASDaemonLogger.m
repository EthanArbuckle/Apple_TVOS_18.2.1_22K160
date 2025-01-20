@interface _DASDaemonLogger
+ (id)defaultCategory;
+ (id)logForCategory:(id)a3;
+ (id)signpostForCategory:(id)a3;
+ (unint64_t)makeIDForString:(id)a3 forLog:(id)a4;
+ (unint64_t)removeIDForString:(id)a3;
+ (void)initialize;
@end

@implementation _DASDaemonLogger

+ (void)initialize
{
  if (qword_100157C58 != -1) {
    dispatch_once(&qword_100157C58, &stru_100117290);
  }
}

+ (id)defaultCategory
{
  return (id)qword_100157C60;
}

+ (id)logForCategory:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&dword_100157C80);
  os_log_t v4 = (os_log_t)objc_claimAutoreleasedReturnValue([(id)qword_100157C68 objectForKeyedSubscript:v3]);
  if (!v4) {
    os_log_t v4 = os_log_create( "com.apple.duetactivityscheduler", (const char *)[v3 UTF8String]);
  }
  [(id)qword_100157C68 setObject:v4 forKeyedSubscript:v3];
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_100157C80);

  return v4;
}

+ (id)signpostForCategory:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&dword_100157C80);
  os_log_t v4 = (os_log_t)objc_claimAutoreleasedReturnValue([(id)qword_100157C70 objectForKeyedSubscript:v3]);
  if (!v4) {
    os_log_t v4 = os_log_create("com.apple.dasd.signpost", (const char *)[v3 UTF8String]);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_100157C80);

  return v4;
}

+ (unint64_t)makeIDForString:(id)a3 forLog:(id)a4
{
  id v5 = a3;
  os_signpost_id_t v6 = os_signpost_id_generate((os_log_t)a4);
  os_unfair_lock_lock((os_unfair_lock_t)&dword_100157C80);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v6));
  [(id)qword_100157C78 setObject:v7 forKeyedSubscript:v5];

  os_unfair_lock_unlock((os_unfair_lock_t)&dword_100157C80);
  return v6;
}

+ (unint64_t)removeIDForString:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&dword_100157C80);
  os_log_t v4 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100157C78 objectForKeyedSubscript:v3]);
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 unsignedLongLongValue];
    [(id)qword_100157C78 removeObjectForKey:v3];
  }

  else
  {
    id v6 = 0LL;
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&dword_100157C80);

  return (unint64_t)v6;
}

@end