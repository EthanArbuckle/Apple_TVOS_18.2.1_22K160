@interface TMCache
- (BOOL)isValid;
- (BOOL)readValidCache:(id)a3 clock:(id)a4;
- (BOOL)rtcReset;
- (BOOL)systemTimeSet;
- (NSData)STF;
- (NSData)TDTF;
- (NSUUID)bootUUID;
- (NSUUID)hostUUID;
- (TMCache)initWithDictionary:(id)a3 clock:(id)a4;
- (TMCache)initWithPath:(id)a3 clock:(id)a4;
- (double)accessoryUnc_s;
- (double)lastNTPFetchAttempt;
- (double)lastRtcTime;
- (id)filesystemTimestampOfPath:(id)a3;
- (unsigned)rtcResetCount;
- (void)dealloc;
- (void)emptyPath:(id)a3;
- (void)saveDict:(id)a3 toPath:(id)a4;
- (void)savePath:(id)a3;
- (void)setAccessoryUnc_s:(double)a3;
- (void)setBootUUID:(id)a3;
- (void)setHostUUID:(id)a3;
- (void)setLastNTPFetchAttempt:(double)a3;
- (void)setLastRtcTime:(double)a3;
- (void)setRtcResetCount:(unsigned int)a3;
- (void)setSTF:(id)a3;
- (void)setSystemTimeSet:(BOOL)a3;
- (void)setTDTF:(id)a3;
- (void)touchPath:(id)a3 tv:(timeval *)a4;
@end

@implementation TMCache

- (TMCache)initWithPath:(id)a3 clock:(id)a4
{
  v7 = (os_log_s *)qword_1000338F8;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v15) = sub_100006CF4();
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "PMU presence: %d", buf, 8u);
    v7 = (os_log_s *)qword_1000338F8;
  }

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_10001A278();
  }
  id v13 = 0LL;
  v8 = -[NSDictionary initWithContentsOfURL:error:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithContentsOfURL:error:",  +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", a3),  &v13);
  v9 = (os_log_s *)qword_1000338F8;
  if (!v8 && os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (NSDictionary *)[v13 userInfo];
    *(_DWORD *)buf = 138412290;
    v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Failed to read cache: %@", buf, 0xCu);
    v9 = (os_log_s *)qword_1000338F8;
  }

  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "read cache: %@", buf, 0xCu);
  }

  v11 = -[TMCache initWithDictionary:clock:](self, "initWithDictionary:clock:", v8, a4);

  return v11;
}

- (TMCache)initWithDictionary:(id)a3 clock:(id)a4
{
  v6 = -[TMCache init](self, "init");
  if (v6)
  {
    -[TMCache setSystemTimeSet:]( v6,  "setSystemTimeSet:",  objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"TMSystemTimeSet"), "BOOLValue"));
    v6->_clock = (TMMonotonicClock *)a4;
    if (-[TMCache readValidCache:clock:](v6, "readValidCache:clock:", a3, a4))
    {
      objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"TMLastRtcTime"), "doubleValue");
      -[TMCache setLastRtcTime:](v6, "setLastRtcTime:");
      objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"TMLastNtpFetchAttempt"), "doubleValue");
      -[TMCache setLastNTPFetchAttempt:](v6, "setLastNTPFetchAttempt:");
      -[TMCache setRtcResetCount:]( v6,  "setRtcResetCount:",  objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"RTCResetCount"), "unsignedIntValue"));
      v7 = (_UNKNOWN **)[a3 objectForKeyedSubscript:@"TMAccessoryUnc_s"];
      if (!v7) {
        v7 = &off_10002C258;
      }
      [v7 doubleValue];
      -[TMCache setAccessoryUnc_s:](v6, "setAccessoryUnc_s:");
      if ([a3 objectForKeyedSubscript:@"BootUUID"]) {
        v6->_bootUUID = -[NSUUID initWithUUIDString:]( [NSUUID alloc],  "initWithUUIDString:",  [a3 objectForKeyedSubscript:@"BootUUID"]);
      }
      if ([a3 objectForKeyedSubscript:@"TDTF"]) {
        -[TMCache setTDTF:](v6, "setTDTF:", [a3 objectForKeyedSubscript:@"TDTF"]);
      }
      if ([a3 objectForKeyedSubscript:@"STF"]) {
        -[TMCache setSTF:](v6, "setSTF:", [a3 objectForKeyedSubscript:@"STF"]);
      }
      v6->_valid = 1;
    }
  }

  return v6;
}

- (void)dealloc
{
  self->_clock = 0LL;
  -[TMCache setBootUUID:](self, "setBootUUID:", 0LL);
  -[TMCache setHostUUID:](self, "setHostUUID:", 0LL);
  -[TMCache setSTF:](self, "setSTF:", 0LL);
  -[TMCache setTDTF:](self, "setTDTF:", 0LL);
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TMCache;
  -[TMCache dealloc](&v3, "dealloc");
}

- (void)touchPath:(id)a3 tv:(timeval *)a4
{
  if (utimes( (const char *)objc_msgSend( a3,  "UTF8String",  a4->tv_sec,  *(void *)&a4->tv_usec,  a4->tv_sec,  *(void *)&a4->tv_usec),  &v4))
  {
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
      sub_10001A2D8();
    }
  }

- (void)emptyPath:(id)a3
{
  self->_valid = 0;
  v5 = -[NSURL initFileURLWithPath:](objc_alloc(&OBJC_CLASS___NSURL), "initFileURLWithPath:", a3);
  if (v5)
  {
    uint64_t v13 = 0LL;
    if (!-[NSFileManager removeItemAtURL:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtURL:error:",  v5,  &v13))
    {
      v6 = (os_log_s *)qword_1000338F8;
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
        sub_10001A338((uint64_t)&v13, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
}

- (void)savePath:(id)a3
{
  v5 = +[NSMutableDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObject:forKey:",  +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[TMCache systemTimeSet](self, "systemTimeSet")),  @"TMSystemTimeSet");
  -[TMCache lastRtcTime](self, "lastRtcTime");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"),  @"TMLastRtcTime");
  -[TMCache lastNTPFetchAttempt](self, "lastNTPFetchAttempt");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"),  @"TMLastNtpFetchAttempt");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  &off_10002C298,  @"TMVersionKey");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  -[TMCache rtcResetCount](self, "rtcResetCount")),  @"RTCResetCount");
  -[TMCache accessoryUnc_s](self, "accessoryUnc_s");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"),  @"TMAccessoryUnc_s");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  -[NSUUID UUIDString](-[TMCache hostUUID](self, "hostUUID"), "UUIDString"),  @"HostUUID");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  -[NSUUID UUIDString](-[TMCache bootUUID](self, "bootUUID"), "UUIDString"),  @"BootUUID");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  -[TMCache STF](self, "STF"),  @"STF");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  -[TMCache TDTF](self, "TDTF"),  @"TDTF");
  -[TMCache saveDict:toPath:](self, "saveDict:toPath:", v5, a3);
}

- (id)filesystemTimestampOfPath:(id)a3
{
  id result = -[NSURL initFileURLWithPath:](objc_alloc(&OBJC_CLASS___NSURL), "initFileURLWithPath:", a3);
  if (!result) {
    return result;
  }
  id v5 = result;
  uint64_t v18 = 0LL;
  v6 = -[NSFileManager attributesOfItemAtPath:error:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "attributesOfItemAtPath:error:",  [result path],  &v18);

  if (!v6)
  {
    uint64_t v14 = qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v18;
      v15 = "Unable to stat cache for modification timestamp: %@";
      v16 = (os_log_s *)v14;
      uint32_t v17 = 12;
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
    }

    return 0LL;
  }

  uint64_t v7 = -[NSDictionary fileModificationDate](v6, "fileModificationDate");
  uint64_t v8 = (os_log_s *)qword_1000338F8;
  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v15 = "Unable to access the modification timestamp for cache";
      v16 = v8;
      uint32_t v17 = 2;
      goto LABEL_15;
    }

    return 0LL;
  }

  uint64_t v9 = v7;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Saving modification timestamp from cache", buf, 2u);
  }

  -[NSDate timeIntervalSinceReferenceDate](v9, "timeIntervalSinceReferenceDate");
  double v11 = v10;
  v19[0] = @"TMCommand";
  v19[1] = @"TMSource";
  v20[0] = @"TMSetSourceTime";
  v20[1] = @"FilesystemTimestamp";
  v19[2] = @"TMCurrentTime";
  v20[2] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
  v20[3] = &off_10002C268;
  v19[3] = @"TMTimeError";
  v19[4] = @"TMRtcTime";
  -[TMMonotonicClock coarseMonotonicTime](self->_clock, "coarseMonotonicTime");
  v20[4] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
  v19[5] = @"TMMachTime";
  v20[5] = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  mach_absolute_time());
  v19[6] = @"TMAbsoluteNanoTime";
  if (v11 >= 9223372040.0) {
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInFunction:file:lineNumber:description:",  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"),  @"TMUtilities_Private.h",  56LL,  @"CFTimeInterval too large for TMNanoTimeInterval: %lf",  *(void *)&v11);
  }
  if (v11 <= -9223372040.0) {
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInFunction:file:lineNumber:description:",  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"),  @"TMUtilities_Private.h",  57LL,  @"CFTimeInterval too small for TMNanoTimeInterval: %lf",  *(void *)&v11);
  }
  double v12 = modf(v11, (double *)buf);
  v20[6] = +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  llround(v12 * 1000000000.0) + 1000000000 * (uint64_t)*(double *)buf);
  v19[7] = @"TMNanoTimeError";
  double v13 = modf(1500000000.0, (double *)buf);
  v20[7] = +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  llround(v13 * 1000000000.0) + 1000000000 * (uint64_t)*(double *)buf);
  return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  v19,  8LL);
}

- (BOOL)readValidCache:(id)a3 clock:(id)a4
{
  if (![a3 count])
  {
    v15 = (os_log_s *)qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v28) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Cache is empty.", (uint8_t *)&v28, 2u);
    }

    return 1;
  }

  id v7 = objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"TMVersionKey"), "integerValue");
  if (v7 != (id)18)
  {
    double v16 = *(double *)&v7;
    uint64_t v17 = qword_1000338F8;
    BOOL v18 = os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v18) {
      return result;
    }
    int v28 = 134218240;
    double v29 = v16;
    __int16 v30 = 2048;
    uint64_t v31 = 18LL;
    v19 = "Cache format changed from %ld to %ld. Cache invalid.";
LABEL_14:
    v20 = (os_log_s *)v17;
    uint32_t v21 = 22;
LABEL_25:
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v28, v21);
    return 0;
  }

  objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"TMLastRtcTime"), "doubleValue");
  double v9 = v8;
  [a4 coarseMonotonicTime];
  double v11 = v10;
  double v12 = (os_log_s *)qword_1000338F8;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
  {
    int v28 = 134218240;
    double v29 = v11;
    __int16 v30 = 2048;
    uint64_t v31 = *(void *)&v9;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "Current RTC: %lf Cached RTC: %lf",  (uint8_t *)&v28,  0x16u);
  }

  if (v9 <= v11)
  {
    if (sub_1000073FC(0LL))
    {
      if ((sub_100006CF4() & 1) != 0)
      {
        double v22 = COERCE_DOUBLE([a3 objectForKeyedSubscript:@"HostUUID"]);
        v23 = -[NSUUID UUIDString](-[TMCache hostUUID](self, "hostUUID"), "UUIDString");
        if (([*(id *)&v22 isEqual:v23] & 1) == 0)
        {
          uint64_t v17 = qword_1000338F8;
          BOOL v24 = os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT);
          BOOL result = 0;
          if (!v24) {
            return result;
          }
          int v28 = 138412546;
          double v29 = v22;
          __int16 v30 = 2112;
          uint64_t v31 = (uint64_t)v23;
          v19 = "Host UUID has changed. Cache Invalid. Cached:%@ Host:%@";
          goto LABEL_14;
        }

        return 1;
      }

      uint64_t v25 = qword_1000338F8;
      BOOL v27 = os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT);
      BOOL result = 0;
      if (!v27) {
        return result;
      }
      LOWORD(v28) = 0;
      v19 = "This platform is not equipped with a PMU RTC. Cache invalid.";
    }

    else
    {
      uint64_t v25 = qword_1000338F8;
      BOOL v26 = os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT);
      BOOL result = 0;
      if (!v26) {
        return result;
      }
      LOWORD(v28) = 0;
      v19 = "Current RTC offset is zero. RTC reset likely. Cache invalid.";
    }

    v20 = (os_log_s *)v25;
    uint32_t v21 = 2;
    goto LABEL_25;
  }

  double v13 = (os_log_s *)qword_1000338F8;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v28) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Current RTC value older than cache. RTC reset likely. Cache invalid.",  (uint8_t *)&v28,  2u);
  }

  BOOL result = 0;
  self->_rtcReset = 1;
  return result;
}

- (void)saveDict:(id)a3 toPath:(id)a4
{
  uint64_t v19 = 0LL;
  id v5 = +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  a3,  200LL,  0LL,  &v19);
  if (v19)
  {
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
      sub_10001A4A8();
    }
  }

  else
  {
    v6 = v5;
    id v7 = -[NSURL initFileURLWithPath:](objc_alloc(&OBJC_CLASS___NSURL), "initFileURLWithPath:", a4);
    if (v7)
    {
      uint64_t v18 = 0LL;
      unsigned int v8 = -[NSData writeToURL:options:error:](v6, "writeToURL:options:error:", v7, 268435457LL, &v18);
      double v9 = (os_log_s *)qword_1000338F8;
      if (v8)
      {
        if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)uint64_t v17 = 0;
          _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Cached state.", v17, 2u);
          double v9 = (os_log_s *)qword_1000338F8;
        }

        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
          sub_10001A3E0();
        }
      }

      else if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR))
      {
        sub_10001A440((uint64_t)&v18, v9, v11, v12, v13, v14, v15, v16);
      }
    }

    else
    {
      double v10 = (os_log_s *)qword_1000338F8;
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
        sub_10001A3A0(v10);
      }
    }
  }

- (NSUUID)hostUUID
{
  BOOL result = self->_hostUUID;
  if (!result)
  {
    v4.tv_sec = 0LL;
    v4.tv_nsec = 0LL;
    gethostuuid(v5, &v4);
    BOOL result = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", v5);
    self->_hostUUID = result;
  }

  return result;
}

- (BOOL)systemTimeSet
{
  return self->_systemTimeSet;
}

- (void)setSystemTimeSet:(BOOL)a3
{
  self->_systemTimeSet = a3;
}

- (double)lastRtcTime
{
  return self->_lastRtcTime;
}

- (void)setLastRtcTime:(double)a3
{
  self->_lastRtcTime = a3;
}

- (double)lastNTPFetchAttempt
{
  return self->_lastNTPFetchAttempt;
}

- (void)setLastNTPFetchAttempt:(double)a3
{
  self->_lastNTPFetchAttempt = a3;
}

- (unsigned)rtcResetCount
{
  return self->_rtcResetCount;
}

- (void)setRtcResetCount:(unsigned int)a3
{
  self->_rtcResetCount = a3;
}

- (double)accessoryUnc_s
{
  return self->_accessoryUnc_s;
}

- (void)setAccessoryUnc_s:(double)a3
{
  self->_accessoryUnc_s = a3;
}

- (NSUUID)bootUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setBootUUID:(id)a3
{
}

- (NSData)STF
{
  return (NSData *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setSTF:(id)a3
{
}

- (NSData)TDTF
{
  return (NSData *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setTDTF:(id)a3
{
}

- (BOOL)rtcReset
{
  return self->_rtcReset;
}

- (BOOL)isValid
{
  return self->_valid;
}

- (void)setHostUUID:(id)a3
{
}

@end