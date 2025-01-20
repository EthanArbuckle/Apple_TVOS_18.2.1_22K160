@interface NSPOutageDurationStats
- (id)analyticsDict;
- (id)eventName;
- (id)outageTypeToString;
- (unint64_t)outageDurationSec;
- (unint64_t)outageType;
- (void)setOutageDurationSec:(unint64_t)a3;
- (void)setOutageType:(unint64_t)a3;
@end

@implementation NSPOutageDurationStats

- (id)eventName
{
  return @"com.apple.nsp.OutageDurationStats";
}

- (id)outageTypeToString
{
  unint64_t v2 = -[NSPOutageDurationStats outageType](self, "outageType");
  if (v2 - 1 > 4) {
    return @"Unknown";
  }
  else {
    return *(&off_1000F9F28 + v2 - 1);
  }
}

- (id)analyticsDict
{
  if (-[NSPOutageDurationStats outageType](self, "outageType"))
  {
    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSPOutageDurationStats outageTypeToString](self, "outageTypeToString"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v6, @"OutageType");

    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSPOutageDurationStats outageDurationSec](self, "outageDurationSec")));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v7, @"OutageDuration");

    return v5;
  }

  else
  {
    uint64_t v9 = nplog_obj(0LL, v3, v4);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      int v11 = 136315138;
      v12 = "-[NSPOutageDurationStats analyticsDict]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_FAULT,  "%s called with null self.outageType",  (uint8_t *)&v11,  0xCu);
    }

    return 0LL;
  }

- (unint64_t)outageType
{
  return self->_outageType;
}

- (void)setOutageType:(unint64_t)a3
{
  self->_outageType = a3;
}

- (unint64_t)outageDurationSec
{
  return self->_outageDurationSec;
}

- (void)setOutageDurationSec:(unint64_t)a3
{
  self->_outageDurationSec = a3;
}

@end