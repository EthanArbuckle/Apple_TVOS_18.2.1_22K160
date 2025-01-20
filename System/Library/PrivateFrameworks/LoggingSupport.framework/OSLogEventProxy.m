@interface OSLogEventProxy
+ (id)_make;
- ($8814E4F230000EB768D7E307C62B5F7C)lossCount;
- (BOOL)_setLogEvent:(id *)a3 rangeUUIDIndex:(unint64_t)a4 machTimebase:(mach_timebase_info *)a5 traceFilename:(id)a6;
- (BOOL)_shouldIncludeSensitive;
- (BOOL)_unreliableIdentifier;
- (BOOL)respondsToSelector:(SEL)a3;
- (NSDate)date;
- (NSString)_tracepoint_id;
- (NSString)category;
- (NSString)composedMessage;
- (NSString)formatString;
- (NSString)process;
- (NSString)processImagePath;
- (NSString)sender;
- (NSString)senderImagePath;
- (NSString)signpostName;
- (NSString)subsystem;
- (NSTimeZone)timeZone;
- (NSUUID)bootUUID;
- (NSUUID)processImageUUID;
- (NSUUID)senderImageUUID;
- (OSLogEventBacktrace)backtrace;
- (OSLogEventDecomposedMessage)decomposedMessage;
- (OSLogEventProxy)init;
- (OSLogEventProxy)retain;
- (const)processImageUUIDBytes;
- (const)senderImageUUIDBytes;
- (id)description;
- (id)methodSignatureForSelector:(SEL)a3;
- (int)processIdentifier;
- (timeval)lossEndUnixDate;
- (timeval)lossStartUnixDate;
- (timeval)unixDate;
- (timezone)lossEndUnixTimeZone;
- (timezone)lossStartUnixTimeZone;
- (timezone)unixTimeZone;
- (unint64_t)_timesyncRangeUUIDIndex;
- (unint64_t)activityIdentifier;
- (unint64_t)continuousNanosecondsSinceBoot;
- (unint64_t)creatorActivityIdentifier;
- (unint64_t)creatorProcessUniqueIdentifier;
- (unint64_t)logType;
- (unint64_t)lossEndMachContinuousTimestamp;
- (unint64_t)lossStartMachContinuousTimestamp;
- (unint64_t)machContinuousTimestamp;
- (unint64_t)parentActivityIdentifier;
- (unint64_t)processUniqueIdentifier;
- (unint64_t)senderImageOffset;
- (unint64_t)signpostIdentifier;
- (unint64_t)signpostScope;
- (unint64_t)signpostType;
- (unint64_t)size;
- (unint64_t)threadIdentifier;
- (unint64_t)timeToLive;
- (unint64_t)traceIdentifier;
- (unint64_t)transitionActivityIdentifier;
- (unint64_t)type;
- (unsigned)_oversizeIdentifier;
- (unsigned)processIdentifierVersion;
- (unsigned)userIdentifier;
- (void)_assertBalanced;
- (void)_fillFromXPCEventObject:(id)a3;
- (void)_setBuffer:(const void *)a3 size:(unint64_t)a4 privateBuffer:(const void *)a5 privateSize:(unint64_t)a6;
- (void)_setDoNotTrackActivites:(BOOL)a3;
- (void)_setFallbackTimezone;
- (void)_setIncludeSensitive:(BOOL)a3;
- (void)_setThreadCrumb;
- (void)_setTimesyncDatabase:(_os_timesync_db_s *)a3;
- (void)_setUUIDDBFileDescriptor:(int)a3;
- (void)_unmake;
- (void)release;
- (void)set_timesyncRangeUUIDIndex:(unint64_t)a3;
- (void)set_tracepoint_id:(id)a3;
- (void)set_unreliableIdentifier:(BOOL)a3;
@end

@implementation OSLogEventProxy

+ (id)_make
{
  id result = NSAllocateObject((Class)a1, 0LL, 0LL);
  *((void *)result + 46) = *(void *)_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  *((void *)result + 47) = 0LL;
  *((_BYTE *)result + 365) = 1;
  *((_BYTE *)result + 424) = 0;
  *((void *)result + 39) = 0LL;
  *(_OWORD *)((char *)result + 248) = 0u;
  *(_OWORD *)((char *)result + 232) = 0u;
  *(_OWORD *)((char *)result + 216) = 0u;
  *(_OWORD *)((char *)result + 200) = 0u;
  *(_OWORD *)((char *)result + 184) = 0u;
  *(_OWORD *)((char *)result + 168) = 0u;
  *(_OWORD *)((char *)result + 152) = 0u;
  *(_OWORD *)((char *)result + 136) = 0u;
  *(_OWORD *)((char *)result + 120) = 0u;
  *(_OWORD *)((char *)result + 104) = 0u;
  *(_OWORD *)((char *)result + 88) = 0u;
  *(_OWORD *)((char *)result + 72) = 0u;
  *(_OWORD *)((char *)result + 56) = 0u;
  *(_OWORD *)((char *)result + 40) = 0u;
  *(_OWORD *)((char *)result + 24) = 0u;
  *((void *)result + 55) = 0LL;
  *(_OWORD *)((char *)result + 8) = 0u;
  *(_OWORD *)((char *)result + 280) = 0u;
  *(_OWORD *)((char *)result + 296) = 0u;
  *(_OWORD *)((char *)result + 264) = 0u;
  return result;
}

- (void)_unmake
{
  if (self->_retainCount) {
    __LOGEVENTPROXY_RETAINED_OUTSIDE_OF_ITERATION__();
  }
  processImagePath = self->_processImagePath;
  if (processImagePath)
  {

    self->_processImagePath = 0LL;
  }

  senderImagePath = self->_senderImagePath;
  if (senderImagePath)
  {

    self->_senderImagePath = 0LL;
  }

  backtrace = self->_backtrace;
  if (backtrace)
  {

    self->_backtrace = 0LL;
  }

  logMessage = self->_logMessage;
  if (logMessage)
  {

    self->_logMessage = 0LL;
  }

  decomposedMessage = self->_decomposedMessage;
  if (decomposedMessage)
  {

    self->_decomposedMessage = 0LL;
  }

  _os_activity_map_destroy((void **)self->_aid_map);
  NSDeallocateObject(self);
}

- (OSLogEventProxy)init
{
  qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: OSLogEventProxy should not be created";
  __break(1u);
  return self;
}

- (OSLogEventProxy)retain
{
  unint64_t thread = self->_thread;
  if (!thread)
  {
    qword_18C695DA0 = (uint64_t)"BUG IN LIBTRACE: _thread is not set on OSLogEventProxy";
    qword_18C695DD0 = 0LL;
    __break(1u);
LABEL_5:
    __LOGEVENTPROXY_RETAINED_OUTSIDE_OF_ITERATION__();
  }

  if (thread != *(void *)_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3))) {
    goto LABEL_5;
  }
  ++self->_retainCount;
  return self;
}

- (void)release
{
  unint64_t thread = self->_thread;
  if (!thread)
  {
    qword_18C695DA0 = (uint64_t)"BUG IN LIBTRACE: _thread is not set on OSLogEventProxy";
    qword_18C695DD0 = 0LL;
    __break(1u);
LABEL_5:
    __LOGEVENTPROXY_RETAINED_OUTSIDE_OF_ITERATION__();
  }

  if (thread != *(void *)_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3))) {
    goto LABEL_5;
  }
  --self->_retainCount;
}

- (void)_assertBalanced
{
  if (self->_retainCount) {
    __LOGEVENTPROXY_RETAINED_OUTSIDE_OF_ITERATION__();
  }
}

- (void)_setThreadCrumb
{
  self->_unint64_t thread = *(void *)_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
}

- (void)_setIncludeSensitive:(BOOL)a3
{
  self->_sensitive = a3;
}

- (BOOL)_shouldIncludeSensitive
{
  return self->_sensitive;
}

- (void)_setTimesyncDatabase:(_os_timesync_db_s *)a3
{
  self->_tsdb = a3;
}

- (void)_setUUIDDBFileDescriptor:(int)a3
{
  self->_uuiddbfd = a3;
}

- (void)_setFallbackTimezone
{
  time_t v6 = time(0LL);
  localtime_r(&v6, &v5);
  int tm_isdst = v5.tm_isdst;
  self->_tz.tz_dsttime = v5.tm_isdst;
  unint64_t v4 = ((unsigned __int128)(v5.tm_gmtoff * (__int128)0x7777777777777777LL) >> 64) - v5.tm_gmtoff;
  self->_tz.tz_minuteswest = (v4 >> 5) + (v4 >> 63) + 60 * tm_isdst;
}

- (void)_setDoNotTrackActivites:(BOOL)a3
{
  self->_trackActivities = !a3;
}

- (void)_setBuffer:(const void *)a3 size:(unint64_t)a4 privateBuffer:(const void *)a5 privateSize:(unint64_t)a6
{
  if (self->_eint.var0.timesync.flags)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
  }

  else
  {
    self->_eint.var0.activity_create.creator_aid = (unint64_t)a3;
    self->_eint.var0.activity_create.unique_pid = a4;
    self->_eint.var0.loss.end.tv_gmt.tv_sec = (__darwin_time_t)a5;
    self->_eint.var0.log_message.privdata_sz = a6;
    self->_eint.common.sz += a6 + a4;
  }

- (BOOL)_setLogEvent:(id *)a3 rangeUUIDIndex:(unint64_t)a4 machTimebase:(mach_timebase_info *)a5 traceFilename:(id)a6
{
  event = a3;
  self->_uuidi = a4;
  self->_tracepoint_id = (NSString *)[NSString stringWithFormat:@"%@-%llu-%llu", a6, a3->var3, a3->var4];
  processImagePath = self->_processImagePath;
  if (processImagePath)
  {

    self->_processImagePath = 0LL;
  }

  senderImagePath = self->_senderImagePath;
  if (senderImagePath)
  {

    self->_senderImagePath = 0LL;
  }

  backtrace = self->_backtrace;
  if (backtrace)
  {

    self->_backtrace = 0LL;
  }

  logMessage = self->_logMessage;
  if (logMessage)
  {

    self->_logMessage = 0LL;
  }

  decomposedMessage = self->_decomposedMessage;
  if (decomposedMessage) {
    -[OSLogEventDecomposedMessage _unmake](decomposedMessage, "_unmake");
  }
  *(_OWORD *)&self->_eint.type = 0u;
  *(void *)&self->_eint.statedump.ttl = 0LL;
  *(_OWORD *)((char *)&self->_eint.var0.loss + 88) = 0u;
  *(_OWORD *)((char *)&self->_eint.var0.loss + 104) = 0u;
  *(_OWORD *)&self->_eint.var0.loss.end.tz.tz_minuteswest = 0u;
  *(_OWORD *)(&self->_eint.var0.loss + 1) = 0u;
  *(_OWORD *)&self->_eint.var0.loss.start.tz.tz_minuteswest = 0u;
  self->_eint.var0.loss.end.tv_gmt = 0u;
  *(_OWORD *)&self->_eint.common.sz = 0u;
  self->_eint.var0.loss.start.tv_gmt = 0u;
  *(_OWORD *)&self->_eint.common.offset = 0u;
  *(_OWORD *)&self->_eint.common.opaque_flags = 0u;
  *(_OWORD *)&self->_eint.common.image_path = 0u;
  *(_OWORD *)&self->_eint.common.tv_gmt.tv_usec = 0u;
  *(_OWORD *)&self->_eint.common.unint64_t thread = 0u;
  *(_OWORD *)&self->_eint.common.dsc_uuid = 0u;
  *(_OWORD *)&self->_eint.activity_id = 0u;
  *(_OWORD *)&self->_eint.common.trace_id = 0u;
  *(_OWORD *)&self->_eint.proc_id = 0u;
  *(_OWORD *)&self->_eint.proc_imageuuid = 0u;
  self->_event = event;
  self->_efv = 0LL;
  unsigned int var0 = event->var0;
  if (event->var0 == 1)
  {
    self->_eint.var0.activity_create = *($4BF962EE7E2B2B120654451D05F5F741 *)&event->var5.var0.var0;
    self->_eint.type = 1280LL;
    self->_eint.var0.timesync.continuous_time = event->var5.var1.var1.var1;
    self->_eint.var0.timesync.wallclock_nsec = event->var5.var1.var1.var2;
    self->_eint.common.timestamp = event->var5.var1.var1.var1;
    self->_eint.common.timebase = *a5;
    self->_eint.common.tz = (timezone)event->var5.var0.var2.var2.iov_len;
    unint64_t var2 = event->var5.var1.var1.var2;
    self->_eint.common.tv_gmt.tv_sec = var2 / 0x3B9ACA00;
    self->_eint.common.tv_gmt.tv_usec = var2 % 0x3B9ACA00 / 0x3E8;
LABEL_29:
    LOBYTE(logMessage) = 1;
    return logMessage & 1;
  }

  if (var0 == 2)
  {
    self->_eint.var0.activity_create = *($4BF962EE7E2B2B120654451D05F5F741 *)&event->var5.var0.var0;
    self->_eint.type = 1280LL;
    self->_eint.var0.timesync.flags = 1LL;
    self->_eint.var0.timesync.ttl = event->var5.var2.var1;
    self->_eint.common.timebase = *a5;
    if (event->var5.var2.var2) {
      self->_eint.var0.timesync.flags = 3LL;
    }
    tsdb = self->_tsdb;
    if (tsdb)
    {
      unint64_t v33 = _timesync_continuous_to_wall_time( (uint64_t)tsdb,  &self->_eint.var0.activity_create.creator_aid,  event->var1,  &self->_eint.common.tz);
      self->_eint.common.tv_gmt.tv_sec = v33 / 0x3B9ACA00;
      self->_eint.common.tv_gmt.tv_usec = v33 % 0x3B9ACA00 / 0x3E8;
    }

    goto LABEL_29;
  }

  if (var0 != 3) {
    return logMessage & 1;
  }
  v16 = event->var5.var0.var2.var0;
  var1 = event->var5.var0.var2.var1;
  var3 = event->var5.var0.var2.var3;
  v17 = event->var5.var0.var3;
  if (var3)
  {
    unsigned int var4 = var3->var4;
    unsigned int var5 = var3->var5;
    self->_eint.pid = var3->var2;
    self->_eint.uid = var5;
    self->_eint.proc_id = var3->var3;
    self->_eint.pidversion = var4;
    self->_eint.proc_imageuuid = (char *)var3->var6;
    if ((var3->var1 & 1) != 0) {
      self->_eint.common.opaque_flags = 1;
    }
  }

  unsigned int v21 = v16->var0.var0;
  if (v21 == 24580)
  {
    v34 = event->var5.var0.var2.var0;
    if (v34->var0.var0 == 24580 && !v34->var0.var1 && v34->var0.var2 >= 0x49)
    {
      self->_eint.type = 1024LL;
      self->_eint.common.opaque_flags = 2;
      self->_eint.activity_id = 0LL;
      unint64_t var6 = v34->var1.var2.var6;
      v36 = (mach_timebase_info *)event->var5.var0.var0;
      self->_eint.common.timestamp = var6;
      self->_eint.common.timebase = v36[2];
      v37 = event->var5.var0.var0;
      v38 = self->_tsdb;
      if (v38)
      {
        unint64_t v39 = _timesync_continuous_to_wall_time((uint64_t)v38, &v37->var1.var10[128], var6, &self->_eint.common.tz);
        __darwin_time_t v40 = v39 / 0x3B9ACA00;
        int v41 = v39 % 0x3B9ACA00 / 0x3E8;
        event = self->_event;
        unint64_t v42 = self->_efv | 1;
      }

      else
      {
        __darwin_time_t v40 = v37->var1.var0.var2;
        int v41 = v37->var1.var0.var3;
        self->_eint.common.tz = self->_tz;
        unint64_t v63 = v37->var1.var0.var8.var0;
        if (v63 != var6)
        {
          uint64_t numer = v37->var1.var0.var0.numer;
          unint64_t denom = v37->var1.var0.var0.denom;
          if (v63 >= var6)
          {
            unint64_t v71 = (v63 - var6) * numer / denom;
            v40 -= v71 / 0x3B9ACA00;
            v41 -= v71 % 0x3B9ACA00 / 0x3E8;
            if (v41 < 0)
            {
              --v40;
              v41 += 1000000;
            }
          }

          else
          {
            unint64_t v66 = (var6 - v63) * numer / denom;
            v40 += v66 / 0x3B9ACA00;
            v41 += v66 % 0x3B9ACA00 / 0x3E8;
            if (v41 > 999999)
            {
              ++v40;
              v41 -= 1000000;
            }
          }
        }

        unint64_t v42 = 1LL;
      }

      self->_eint.common.tv_gmt.tv_sec = v40;
      *(void *)&self->_eint.common.tv_gmt.tv_usec = v41;
      self->_eint.common.dsc_uuid = (char *)v34->var1.var9.var9;
      self->_eint.common.image_uuid = (char *)&v34->var1.var8.var6[8];
      unint64_t v72 = v34->var1.var8.var5;
      self->_eint.common.offset = v34->var1.var9.var7;
      self->_eint.common.unint64_t thread = v72;
      self->_efv = v42;
      self->_eint.var0.log_message.ttl = v34->var1.var3.var2;
      uint64_t v73 = _simple_support_validate_payload((uint64_t)event->var5.var0.var2.var0, &self->_eint.common.sz);
      self->_eint.common.trace_id = (unint64_t)v34->var1.var3.var3[0] << 8;
      v74 = self->_event;
      uint64_t v75 = (uint64_t)v74->var5.var0.var2.var0;
      if (*(_DWORD *)v75 != 24580) {
        goto LABEL_81;
      }
      if (!*(_DWORD *)(v75 + 4)
        && *(void *)(v75 + 8) >= 0x49uLL
        && (uint64_t v76 = _simple_support_validate_payload(v75, 0LL)) != 0
        && *(_DWORD *)(v76 + 4))
      {
        self->_eint.var0.log_message.subsystem = (char *)(v76 + 12);
        v77 = (objc_class *)&_CTF_NULLSTR;
        uint64_t v78 = 32LL;
      }

      else
      {
LABEL_81:
        v77 = 0LL;
        uint64_t v78 = 31LL;
      }

      (&self->super.isa)[v78] = v77;
      if (v73)
      {
        logMessage = (NSString *)v74->var5.var0.var2.var3;
        goto LABEL_84;
      }
    }

- (BOOL)respondsToSelector:(SEL)a3
{
  return 0;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v3 = NSStringFromSelector(a3);
  NSLog(@"%@", v3);
  return 0LL;
}

- (void)_fillFromXPCEventObject:(id)a3
{
  if (_fillFromXPCEventObject__onceToken != -1) {
    dispatch_once(&_fillFromXPCEventObject__onceToken, &__block_literal_global_207);
  }
  processImagePath = self->_processImagePath;
  if (processImagePath)
  {

    self->_processImagePath = 0LL;
  }

  senderImagePath = self->_senderImagePath;
  if (senderImagePath)
  {

    self->_senderImagePath = 0LL;
  }

  backtrace = self->_backtrace;
  if (backtrace)
  {

    self->_backtrace = 0LL;
  }

  logMessage = self->_logMessage;
  if (logMessage)
  {

    self->_logMessage = 0LL;
  }

  decomposedMessage = self->_decomposedMessage;
  if (decomposedMessage) {
    -[OSLogEventDecomposedMessage _unmake](decomposedMessage, "_unmake");
  }
  *(_OWORD *)&self->_eint.uint64_t type = 0u;
  p_eint = &self->_eint;
  *(void *)&self->_eint.statedump.ttl = 0LL;
  *(_OWORD *)&self->_eint.var0.loss.end.tz.tz_minuteswest = 0u;
  self->_eint.var0.loss.end.tv_gmt = 0u;
  *(_OWORD *)&self->_eint.var0.loss.start.tz.tz_minuteswest = 0u;
  self->_eint.var0.loss.start.tv_gmt = 0u;
  *(_OWORD *)&self->_eint.common.sz = 0u;
  *(_OWORD *)&self->_eint.common.opaque_flags = 0u;
  *(_OWORD *)&self->_eint.common.offset = 0u;
  *(_OWORD *)&self->_eint.common.tv_gmt.tv_usec = 0u;
  *(_OWORD *)&self->_eint.common.image_path = 0u;
  *(_OWORD *)&self->_eint.common.dsc_uuid = 0u;
  *(_OWORD *)&self->_eint.common.unint64_t thread = 0u;
  *(_OWORD *)&self->_eint.common.trace_id = 0u;
  *(_OWORD *)&self->_eint.activity_id = 0u;
  *(_OWORD *)&self->_eint.proc_imageuuid = 0u;
  *(_OWORD *)&self->_eint.proc_id = 0u;
  *(_OWORD *)((char *)&self->_eint.var0.loss + 88) = 0u;
  *(_OWORD *)((char *)&self->_eint.var0.loss + 104) = 0u;
  *(_OWORD *)(&self->_eint.var0.loss + 1) = 0u;
  self->_event = 0LL;
  self->_efv = 0LL;
  self->_eint.pid = xpc_dictionary_get_uint64(a3, "pid");
  self->_eint.proc_id = xpc_dictionary_get_uint64(a3, "procid");
  self->_eint.uid = xpc_dictionary_get_uint64(a3, "uid");
  self->_eint.proc_imageuuid = (char *)xpc_dictionary_get_uuid(a3, "procuuid");
  string = (char *)xpc_dictionary_get_string(a3, "procpath");
  self->_eint.proc_imagepath = string;
  if (!string)
  {
    proc_imageuuid = self->_eint.proc_imageuuid;
    if (proc_imageuuid) {
      uuidpath_lookup_fd(-3, proc_imageuuid, &self->_eint.proc_imagepath);
    }
  }

  self->_eint.activity_id = xpc_dictionary_get_uint64(a3, "aid");
  self->_eint.parent_id = xpc_dictionary_get_uint64(a3, "paid");
  self->_eint.uint64_t type = xpc_dictionary_get_uint64(a3, "type");
  self->_eint.common.tz.tz_dsttime = xpc_dictionary_get_int64(a3, "timezoneDSTflag");
  self->_eint.common.tz.tz_minuteswest = xpc_dictionary_get_int64(a3, "timezoneMinutesWest");
  self->_eint.common.tv_gmt.tv_sec = xpc_dictionary_get_int64(a3, "timeGMTsec");
  self->_eint.common.tv_gmt.tv_usec = xpc_dictionary_get_int64(a3, "timeGMTusec");
  if (xpc_dictionary_get_BOOL(a3, "32bits")) {
    self->_eint.common.opaque_flags = 1;
  }
  uint64_t uint64 = xpc_dictionary_get_uint64(a3, "traceid");
  int v14 = uint64;
  self->_eint.common.trace_id = uint64;
  self->_eint.common.unint64_t thread = xpc_dictionary_get_uint64(a3, "thread");
  self->_eint.common.timestamp = xpc_dictionary_get_uint64(a3, "timestamp");
  self->_eint.common.offset = xpc_dictionary_get_uint64(a3, "offset");
  self->_eint.common.format_offset = xpc_dictionary_get_uint64(a3, "formatoffset");
  self->_eint.common.image_uuid = (char *)xpc_dictionary_get_uuid(a3, "imageuuid");
  p_image_uuid = &self->_eint.common.image_uuid;
  self->_eint.common.image_path = (char *)xpc_dictionary_get_string(a3, "imagepath");
  p_image_path = &self->_eint.common.image_path;
  self->_eint.common.timebase = (mach_timebase_info)_fillFromXPCEventObject__timebase;
  v17 = (char *)xpc_dictionary_get_string(a3, "formatstring");
  self->_eint.common.message = v17;
  if (!v17 && (v18 = (char *)xpc_dictionary_get_string(a3, "name"), (self->_eint.common.message = v18) == 0LL)
    || !*p_image_path)
  {
    v19 = (__n128 *)*p_image_uuid;
    if (*p_image_uuid)
    {
      if ((BYTE2(v14) & 6 | 8) == 0xC) {
        uuidpath_sharedcache_resolve_fd( 0xFFFFFFFFLL,  v19,  self->_eint.common.format_offset,  self->_eint.common.offset,  0LL,  (const char **)&self->_eint.common.message,  0LL,  &self->_eint.common.image_uuid,  (unint64_t)&self->_eint.common.image_path,  0LL,  0LL);
      }
      else {
        uuidpath_resolve( 0LL,  v19,  self->_eint.common.format_offset,  0LL,  (const char **)&self->_eint.common.message,  0LL,  &self->_eint.common.image_path,  0LL);
      }
    }
  }

  uint64_t type = p_eint->type;
  if ((uint64_t)p_eint->type > 1023)
  {
    if (type != 1024)
    {
      if (type != 1536) {
        goto LABEL_39;
      }
      self->_eint.var0.log_message.signpost_id = xpc_dictionary_get_uint64(a3, "signpostid");
      self->_eint.var0.log_message.signpost_name = (char *)xpc_dictionary_get_string(a3, "signpostname");
      self->_eint.var0.log_message.signpost_uint64_t type = BYTE1(v14) & 0x3F;
      self->_eint.var0.log_message.signpost_scope = BYTE1(v14) & 0xC0;
    }

    if ((self->_eint.common.opaque_flags & 2) == 0)
    {
      self->_eint.var0.activity_create.creator_aid = (unint64_t)xpc_dictionary_get_data( a3,  "buffer",  &self->_eint.var0.activity_create.unique_pid);
      self->_eint.var0.loss.end.tv_gmt.tv_sec = (__darwin_time_t)xpc_dictionary_get_data( a3,  "privdata",  &self->_eint.var0.log_message.privdata_sz);
      self->_eint.var0.log_message.category = (char *)xpc_dictionary_get_string(a3, "category");
      self->_eint.var0.log_message.subsystem = (char *)xpc_dictionary_get_string(a3, "subsystem");
      self->_eint.var0.log_message.persisted = xpc_dictionary_get_BOOL(a3, "persisted");
      unsigned __int8 v21 = xpc_dictionary_get_uint64(a3, "timeToLive") > 0xFE ? -1 : xpc_dictionary_get_uint64(a3, "timeToLive");
      self->_eint.var0.log_message.ttl = v21;
      if ((v14 & 0x10000000) != 0) {
        self->_eint.var0.log_message.has_context_data = 1;
      }
    }
  }

  else if (type == 515)
  {
    self->_eint.var0.useraction.persisted = xpc_dictionary_get_BOOL(a3, "persisted");
  }

  else if (type == 768)
  {
    xpc_dictionary_get_value(a3, "payload");
    self->_eint.var0.activity_create.creator_aid = (unint64_t)xpc_dictionary_get_data( a3,  "buffer",  &self->_eint.var0.activity_create.unique_pid);
  }

- (id)description
{
  v3 = (void *)NSString;
  unint64_t v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p, %p, %02x, %d, %s>", NSStringFromClass(v4), self, self->_event, self->_eint.type, self->_eint.pid, self->_eint.common.message];
}

- (unsigned)_oversizeIdentifier
{
  return self->_eint.var0.log_message.oversize_id;
}

- (NSString)composedMessage
{
  BOOL result = 0LL;
  uint64_t v18 = *MEMORY[0x1895F89C0];
  int64_t type = self->_eint.type;
  if (type <= 1023)
  {
    if (type > 514)
    {
      if (type != 515)
      {
        if (type != 768) {
          return result;
        }
        goto LABEL_18;
      }
    }

    else if (type != 513)
    {
      if (type == 514) {
        return (NSString *)objc_msgSend( NSString,  "stringWithFormat:",  @"Transition to 0x%llx",  self->_eint.var0.activity_create.creator_aid & 0xFFFFFFFFFFFFFFLL);
      }
      return result;
    }

    if ((self->_efv & 3) == 1) {
      _resolve_uuid_slow((uint64_t)self);
    }
    return 0LL;
  }

  if (type <= 1535)
  {
    if (type == 1024)
    {
LABEL_18:
      BOOL result = self->_logMessage;
      if (!result) {
        return (NSString *)_compose_log_message((uint64_t)self);
      }
      return result;
    }

    if (type != 1280) {
      return result;
    }
    hdr = self->_eint.var0.log_message.hdr;
    if ((hdr & 1) == 0)
    {
      if (self->_eint.var0.timesync.continuous_time)
      {
        time_t v6 = "=== system wallclock time adjusted";
LABEL_41:
        v10 = (void *)NSString;
        v11 = v6;
        return (NSString *)[v10 stringWithUTF8String:v11];
      }

      uuid_unparse_upper((const unsigned __int8 *)&self->_eint.var0, out);
      v15 = out;
      int v14 = "=== system boot: %s";
LABEL_40:
      time_t v6 = __str;
      snprintf(__str, 0x80uLL, v14, v15);
      goto LABEL_41;
    }

    if ((hdr & 2) == 0)
    {
      unsigned int ttl = self->_eint.var0.timesync.ttl;
      if (ttl <= 6)
      {
        if (ttl == 1)
        {
          v13 = "TTL less than 1 day";
          goto LABEL_38;
        }

        if (ttl == 3)
        {
          v13 = "TTL less than 3 days";
          goto LABEL_38;
        }
      }

      else
      {
        switch(ttl)
        {
          case 7u:
            v13 = "TTL less than 7 days";
            goto LABEL_38;
          case 0xEu:
            v13 = "TTL less than 14 days";
            goto LABEL_38;
          case 0x1Eu:
            v13 = "TTL more than 14 days";
LABEL_38:
            v15 = (char *)v13;
            int v14 = "=== log class: %s begins";
            goto LABEL_40;
        }
      }

      v13 = "persist";
      goto LABEL_38;
    }

    v13 = "in-memory";
    goto LABEL_38;
  }

  if (type != 2560)
  {
    if (type != 1792)
    {
      if (type != 1536) {
        return result;
      }
      goto LABEL_18;
    }

    unsigned int count = self->_eint.var0.loss.count;
    v9 = (const char *)&_CTF_NULLSTR;
    if (count == 63) {
      v9 = ">=";
    }
    snprintf( __str,  0x100uLL,  "lost %s%u unreliable messages from %llu-%llu (Mach continuous exact start-approx. end)",  v9,  count,  self->_eint.var0.activity_create.creator_aid,  self->_eint.var0.timesync.wallclock_nsec);
    v10 = (void *)NSString;
    v11 = __str;
    return (NSString *)[v10 stringWithUTF8String:v11];
  }

  BOOL result = (NSString *)_state_support_create_message( (uint64_t)self->_event->var5.var0.var2.var0,  &self->_eint.statedump.message_size);
  if (result)
  {
    v7 = result;
    BOOL result = (NSString *)(id)[objc_alloc(NSString) initWithBytesNoCopy:v7 length:strlen((const char *)v7) encoding:4 freeWhenDone:1];
    if (!result)
    {
      free(v7);
      return 0LL;
    }
  }

  return result;
}

- (OSLogEventDecomposedMessage)decomposedMessage
{
  unint64_t type = self->_eint.type;
  decomposedMessage = self->_decomposedMessage;
  if (!decomposedMessage)
  {
    decomposedMessage = -[OSLogEventDecomposedMessage initWithEventProxy:]( objc_alloc(&OBJC_CLASS___OSLogEventDecomposedMessage),  "initWithEventProxy:",  self);
    self->_decomposedMessage = decomposedMessage;
  }

  -[OSLogEventDecomposedMessage _populateFields](decomposedMessage, "_populateFields");
  return self->_decomposedMessage;
}

- (unint64_t)type
{
  return self->_eint.type;
}

- (unint64_t)logType
{
  unint64_t type = self->_eint.type;
  if (type != 1024 && type != 768) {
    return 0LL;
  }
  event = self->_event;
  else {
    return *((unsigned __int8 *)event->var5.var0.var3 + 1);
  }
}

- (unint64_t)size
{
  return self->_eint.common.sz;
}

- (unint64_t)traceIdentifier
{
  return self->_eint.common.trace_id;
}

- (unint64_t)threadIdentifier
{
  return self->_eint.common.thread;
}

- (unint64_t)timeToLive
{
  *((void *)&v3 + 1) = self->_eint.type;
  *(void *)&__int128 v3 = *((void *)&v3 + 1) - 768LL;
  unint64_t v2 = v3 >> 8;
  if (v2 >= 2)
  {
    if (v2 == 7) {
      return self->_eint.statedump.ttl;
    }
    if (v2 != 3) {
      return 0;
    }
  }

  return self->_eint.var0.log_message.ttl;
}

- (NSDate)date
{
  return (NSDate *)[MEMORY[0x189603F50] dateWithTimeIntervalSince1970:(double)self->_eint.common.tv_gmt.tv_usec / 1000000.0 + (double)self->_eint.common.tv_gmt.tv_sec];
}

- (NSTimeZone)timeZone
{
  return (NSTimeZone *)[MEMORY[0x189604020] timeZoneForSecondsFromGMT:3600 * self->_eint.common.tz.tz_dsttime + -60 * self->_eint.common.tz.tz_minuteswest];
}

- (timeval)unixDate
{
  return &self->_eint.common.tv_gmt;
}

- (timezone)unixTimeZone
{
  return &self->_eint.common.tz;
}

- (int)processIdentifier
{
  return self->_eint.pid;
}

- (unsigned)processIdentifierVersion
{
  return self->_eint.pidversion;
}

- (unsigned)userIdentifier
{
  return self->_eint.uid;
}

- (unint64_t)activityIdentifier
{
  return self->_eint.activity_id & 0xFFFFFFFFFFFFFFLL;
}

- (unint64_t)parentActivityIdentifier
{
  return self->_eint.parent_id & 0xFFFFFFFFFFFFFFLL;
}

- (unint64_t)transitionActivityIdentifier
{
  else {
    return 0LL;
  }
}

- (NSUUID)bootUUID
{
  event = self->_event;
  if (!event) {
    return 0LL;
  }
  unsigned int var0 = event->var0;
  if (var0 == 1 || var0 == 2)
  {
    id v5 = objc_alloc(MEMORY[0x189607AB8]);
    p_unsigned int var5 = &self->_event->var5;
    return (NSUUID *)(id)[v5 initWithUUIDBytes:p_var5];
  }

  if (var0 != 3) {
    return 0LL;
  }
  id v5 = objc_alloc(MEMORY[0x189607AB8]);
  p_unsigned int var5 = ($39934A02578A7E7203715B748868836E *)&self->_event->var5.var0.var0->var1.var10[128];
  return (NSUUID *)(id)[v5 initWithUUIDBytes:p_var5];
}

- (unint64_t)continuousNanosecondsSinceBoot
{
  return self->_eint.common.timestamp * self->_eint.common.timebase.numer / self->_eint.common.timebase.denom;
}

- (unint64_t)machContinuousTimestamp
{
  return self->_eint.common.timestamp;
}

- (unint64_t)processUniqueIdentifier
{
  return self->_eint.proc_id;
}

- (NSUUID)processImageUUID
{
  if (self->_eint.proc_imageuuid) {
    return (NSUUID *)(id)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:self->_eint.proc_imageuuid];
  }
  else {
    return 0LL;
  }
}

- (const)processImageUUIDBytes
{
  return self->_eint.proc_imageuuid;
}

- (NSString)processImagePath
{
  if ((self->_efv & 3) == 1) {
    _resolve_uuid_slow((uint64_t)self);
  }
  return self->_processImagePath;
}

- (NSString)process
{
  return -[NSString lastPathComponent]( -[OSLogEventProxy processImagePath](self, "processImagePath"),  "lastPathComponent");
}

- (NSUUID)senderImageUUID
{
  if ((self->_efv & 3) == 1
    && self->_eint.type != 2560
    && (self->_eint.common.opaque_flags & 2) == 0
    && (*((_WORD *)self->_event->var5.var0.var3 + 1) & 6 | 8) == 0xC)
  {
    _resolve_uuid_slow((uint64_t)self);
  }

  if (self->_eint.common.image_uuid) {
    return (NSUUID *)(id)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:self->_eint.common.image_uuid];
  }
  else {
    return 0LL;
  }
}

- (const)senderImageUUIDBytes
{
  if ((self->_efv & 3) == 1
    && self->_eint.type != 2560
    && (self->_eint.common.opaque_flags & 2) == 0
    && (*((_WORD *)self->_event->var5.var0.var3 + 1) & 6 | 8) == 0xC)
  {
    _resolve_uuid_slow((uint64_t)self);
  }

  return self->_eint.common.image_uuid;
}

- (NSString)senderImagePath
{
  if ((self->_efv & 3) == 1) {
    _resolve_uuid_slow((uint64_t)self);
  }
  return self->_senderImagePath;
}

- (NSString)sender
{
  return -[NSString lastPathComponent](-[OSLogEventProxy senderImagePath](self, "senderImagePath"), "lastPathComponent");
}

- (unint64_t)senderImageOffset
{
  if ((self->_efv & 3) == 1
    && self->_eint.type != 2560
    && (self->_eint.common.opaque_flags & 2) == 0
    && (*((_WORD *)self->_event->var5.var0.var3 + 1) & 6 | 8) == 0xC)
  {
    _resolve_uuid_slow((uint64_t)self);
  }

  return self->_eint.common.offset;
}

- (OSLogEventBacktrace)backtrace
{
  BOOL result = self->_backtrace;
  if (!result)
  {
    if (!self->_eint.var0.timesync.flags) {
      self->_eint.var0.timesync.flags = (unint64_t)os_log_fmt_extract_pubdata( self->_eint.var0.log_message.buffer,  LOWORD(self->_eint.var0.loss.start.tv_gmt.tv_sec),  &self->_eint.var0.timesync.continuous_time,  &self->_eint.var0.log_message.pubdata_sz);
    }
    pubdata = self->_eint.var0.log_message.pubdata;
    if (pubdata
      && (*pubdata & 1) != 0
      && (uint64_t v6 = self->_eint.var0.log_message.pubdata_sz - 2LL,
          v7 = pubdata + 1,
          (uint64_t v5 = os_log_backtrace_create_from_buffer()) != 0))
    {
      self->_backtrace = -[OSLogEventBacktrace initWithBacktrace:]( objc_alloc(&OBJC_CLASS___OSLogEventBacktrace),  "initWithBacktrace:",  v5,  v6,  v7);
      os_log_backtrace_destroy();
    }

    else
    {
LABEL_15:
      if (-[OSLogEventProxy senderImageUUIDBytes](self, "senderImageUUIDBytes", v6, v7))
      {
        BOOL result = -[OSLogEventBacktrace initWithSingleFrame:]( objc_alloc(&OBJC_CLASS___OSLogEventBacktrace),  "initWithSingleFrame:",   -[OSLogEventBacktraceFrame initWithUUIDBytes:andOffset:]( objc_alloc(&OBJC_CLASS___OSLogEventBacktraceFrame),  "initWithUUIDBytes:andOffset:",  -[OSLogEventProxy senderImageUUIDBytes](self, "senderImageUUIDBytes"),  -[OSLogEventProxy senderImageOffset](self, "senderImageOffset")));
        self->_backtrace = result;
        return result;
      }
    }

    return self->_backtrace;
  }

  return result;
}

- (NSString)subsystem
{
  else {
    return 0LL;
  }
}

- (NSString)category
{
  else {
    return 0LL;
  }
}

- (unint64_t)signpostIdentifier
{
  else {
    return 0LL;
  }
}

- (unint64_t)signpostType
{
  else {
    return 0LL;
  }
}

- (unint64_t)signpostScope
{
  else {
    return 0LL;
  }
}

- (NSString)signpostName
{
  if ((self->_efv & 3) == 1) {
    _resolve_uuid_slow((uint64_t)self);
  }
  if (self->_eint.var0.log_message.signpost_name)
  {
    __int128 v3 = (void *)NSString;
    return (NSString *)objc_msgSend(v3, "stringWithUTF8String:");
  }

  uint64_t v5 = strchr(self->_eint.common.message, 32);
  __int128 v3 = (void *)NSString;
  if (!v5) {
    return (NSString *)objc_msgSend(v3, "stringWithUTF8String:");
  }
  return (NSString *)(id)[objc_alloc(NSString) initWithBytes:self->_eint.common.message length:v5 - self->_eint.common.message encoding:4];
}

- (NSString)formatString
{
  unint64_t type = self->_eint.type;
  if (type == 768)
  {
LABEL_8:
    if ((self->_efv & 3) == 1) {
      _resolve_uuid_slow((uint64_t)self);
    }
    if (self->_eint.common.message)
    {
      unint64_t v4 = (void *)NSString;
      return (NSString *)objc_msgSend(v4, "stringWithUTF8String:");
    }

    return 0LL;
  }

  if (type == 1024) {
    goto LABEL_7;
  }
  if (type != 1536) {
    return 0LL;
  }
  if ((self->_efv & 3) == 1) {
    _resolve_uuid_slow((uint64_t)self);
  }
  if (self->_eint.var0.log_message.signpost_name)
  {
LABEL_7:
    goto LABEL_8;
  }

  message = self->_eint.common.message;
  if (message)
  {
    strchr(message, 32);
    unint64_t v4 = (void *)NSString;
    return (NSString *)objc_msgSend(v4, "stringWithUTF8String:");
  }

  return 0LL;
}

- (unint64_t)creatorActivityIdentifier
{
  else {
    return 0LL;
  }
}

- (unint64_t)creatorProcessUniqueIdentifier
{
  else {
    return 0LL;
  }
}

- (unint64_t)lossStartMachContinuousTimestamp
{
  else {
    return 0LL;
  }
}

- (timeval)lossStartUnixDate
{
  else {
    return 0LL;
  }
}

- (timezone)lossStartUnixTimeZone
{
  else {
    return 0LL;
  }
}

- (unint64_t)lossEndMachContinuousTimestamp
{
  else {
    return 0LL;
  }
}

- (timeval)lossEndUnixDate
{
  else {
    return 0LL;
  }
}

- (timezone)lossEndUnixTimeZone
{
  else {
    return 0LL;
  }
}

- ($8814E4F230000EB768D7E307C62B5F7C)lossCount
{
  else {
    return ($8814E4F230000EB768D7E307C62B5F7C)0LL;
  }
}

- (unint64_t)_timesyncRangeUUIDIndex
{
  return self->_uuidi;
}

- (void)set_timesyncRangeUUIDIndex:(unint64_t)a3
{
  self->_uuidi = a3;
}

- (NSString)_tracepoint_id
{
  return self->_tracepoint_id;
}

- (void)set_tracepoint_id:(id)a3
{
  self->_tracepoint_id = (NSString *)a3;
}

- (BOOL)_unreliableIdentifier
{
  return self->_unreliableIdentifier;
}

- (void)set_unreliableIdentifier:(BOOL)a3
{
  self->_unreliableIdentifier = a3;
}

uint64_t __43__OSLogEventProxy__fillFromXPCEventObject___block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&_fillFromXPCEventObject__timebase);
}

@end