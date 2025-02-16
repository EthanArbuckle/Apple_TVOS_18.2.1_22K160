@interface TSTime
+ (id)timeConverter;
- (BOOL)isEqual:(id)a3;
- (NSDate)taiDate;
- (NSDate)utcDate;
- (TSGPSTime)gpsTime;
- (TSTime)init;
- (TSTime)initWithGPSTime:(id)a3;
- (TSTime)initWithNanosecondsSinceEpoch:(unint64_t)a3;
- (TSTime)initWithTAIDate:(id)a3;
- (TSTime)initWithUTCDate:(id)a3;
- (TSTime)initWithgPTPTime:(id)a3;
- (TSgPTPTime)gPTPTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)timeByAddingNanoseconds:(int64_t)a3;
- (int64_t)nanosecondsSinceTime:(id)a3;
- (unint64_t)hash;
- (unint64_t)nanosecondsSinceEpoch;
@end

@implementation TSTime

+ (id)timeConverter
{
  if (qword_100047C50 != -1) {
    dispatch_once(&qword_100047C50, &stru_10003C7B0);
  }
  return (id)qword_100047C48;
}

- (TSTime)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v4 = -[TSTime initWithUTCDate:](self, "initWithUTCDate:", v3);

  return v4;
}

- (TSTime)initWithUTCDate:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class(self) timeConverter];
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 taiDateFromUTCDate:v4]);

  v8 = -[TSTime initWithTAIDate:](self, "initWithTAIDate:", v7);
  return v8;
}

- (TSTime)initWithTAIDate:(id)a3
{
  id v4 = a3;
  [v4 timeIntervalSince1970];
  v6 = -[TSTime initWithNanosecondsSinceEpoch:]( self,  "initWithNanosecondsSinceEpoch:",  (unint64_t)(v5 * 1000000000.0));
  v7 = v6;
  if (v6)
  {
    *(_WORD *)&v6->_timeTraceable = 257;
    [v4 timeIntervalSince1970];
    if (v8 < 0.0)
    {

      v7 = 0LL;
    }
  }

  return v7;
}

- (TSTime)initWithGPSTime:(id)a3
{
  result = -[TSTime initWithNanosecondsSinceEpoch:]( self,  "initWithNanosecondsSinceEpoch:",  (char *)[a3 nanosecondsSinceEpoch] + 315964819000000000);
  if (result) {
    *(_WORD *)&result->_timeTraceable = 257;
  }
  return result;
}

- (TSTime)initWithgPTPTime:(id)a3
{
  id v4 = a3;
  double v5 = -[TSTime initWithNanosecondsSinceEpoch:]( self,  "initWithNanosecondsSinceEpoch:",  [v4 nanosecondsSinceEpoch]);
  if (v5)
  {
    if ([v4 isTimeTraceable]
      && [v4 isPTPTimescale]
      && [v4 isFrequencyTraceable])
    {
      v5->_grandmasterIdentity = (unint64_t)[v4 grandmasterIdentity];
      v5->_localPortNumber = (unsigned __int16)[v4 localPortNumber];
      v5->_frequencyTraceable = [v4 isFrequencyTraceable];
      v5->_timeTraceable = [v4 isTimeTraceable];
    }

    else
    {

      double v5 = 0LL;
    }
  }

  return v5;
}

- (TSTime)initWithNanosecondsSinceEpoch:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TSTime;
  result = -[TSTime init](&v5, "init");
  if (result)
  {
    result->_nanosecondsSinceEpoch = a3;
    result->_grandmasterIdentity = -1LL;
    result->_localPortNumber = 0;
  }

  return result;
}

- (NSDate)utcDate
{
  id v3 = [(id)objc_opt_class(self) timeConverter];
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[TSTime taiDate](self, "taiDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 utcDateFromTAIDate:v5]);

  return (NSDate *)v6;
}

- (NSDate)taiDate
{
  return +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  (double)self->_nanosecondsSinceEpoch / 1000000000.0);
}

- (TSGPSTime)gpsTime
{
  if (self->_nanosecondsSinceEpoch < 0x46288542E03FE00LL) {
    v2 = 0LL;
  }
  else {
    v2 = -[TSGPSTime initWithNanosecondsSinceEpoch:]( objc_alloc(&OBJC_CLASS___TSGPSTime),  "initWithNanosecondsSinceEpoch:",  self->_nanosecondsSinceEpoch - 315964819000000000LL);
  }
  return v2;
}

- (TSgPTPTime)gPTPTime
{
  return  -[TSgPTPTime initWithNanosecondsSinceEpoch:onGrandmaster:withLocalPortNumber:ptpTimescale:timeTraceable:frequencyTraceable:]( objc_alloc(&OBJC_CLASS___TSgPTPTime),  "initWithNanosecondsSinceEpoch:onGrandmaster:withLocalPortNumber:ptpTimescale:timeTraceable:frequencyTraceable:",  self->_nanosecondsSinceEpoch,  self->_grandmasterIdentity,  self->_localPortNumber,  1LL,  self->_timeTraceable,  self->_frequencyTraceable);
}

- (int64_t)nanosecondsSinceTime:(id)a3
{
  return self->_nanosecondsSinceEpoch - *((void *)a3 + 4);
}

- (id)timeByAddingNanoseconds:(int64_t)a3
{
  if (a3 < 0 && self->_nanosecondsSinceEpoch < a3)
  {
    id v4 = 0LL;
  }

  else
  {
    id v4 = -[TSTime copy](self, "copy");
    v4[4] += a3;
  }

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  *((void *)result + 4) = self->_nanosecondsSinceEpoch;
  *((void *)result + 2) = self->_grandmasterIdentity;
  *((_BYTE *)result + 8) = self->_initedWithgPTP;
  return result;
}

- (unint64_t)hash
{
  return self->_nanosecondsSinceEpoch;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (([v4 isMemberOfClass:objc_opt_class(self)] & 1) != 0
    || -[TSTime isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class(v4)))
  {
    id v5 = -[TSTime nanosecondsSinceEpoch](self, "nanosecondsSinceEpoch");
    BOOL v6 = v5 == [v4 nanosecondsSinceEpoch];
  }

  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)description
{
  unint64_t grandmasterIdentity = self->_grandmasterIdentity;
  unint64_t v4 = -[TSTime nanosecondsSinceEpoch](self, "nanosecondsSinceEpoch");
  if (grandmasterIdentity == -1LL) {
    id v5 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"TAI Time %llu", v4, v7);
  }
  else {
    id v5 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"TAI Time %llu GM 0x%016llx",  v4,  self->_grandmasterIdentity);
  }
  return (id)objc_claimAutoreleasedReturnValue(v5);
}

- (unint64_t)nanosecondsSinceEpoch
{
  return self->_nanosecondsSinceEpoch;
}

@end