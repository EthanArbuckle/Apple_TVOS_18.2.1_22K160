@interface TSGPSTime
- (BOOL)isEqual:(id)a3;
- (TSGPSTime)initWithExtendedWeek:(unsigned int)a3 nanoseconds:(unint64_t)a4;
- (TSGPSTime)initWithExtendedWeek:(unsigned int)a3 seconds:(double)a4;
- (TSGPSTime)initWithNanosecondsSinceEpoch:(unint64_t)a3;
- (TSGPSTime)initWithWeek:(unsigned int)a3 nanoseconds:(unint64_t)a4 rollovers:(unsigned __int16)a5;
- (TSGPSTime)initWithWeek:(unsigned int)a3 seconds:(double)a4 rollovers:(unsigned __int16)a5;
- (double)seconds;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)nanoseconds;
- (unint64_t)nanosecondsSinceEpoch;
- (unsigned)extendedWeek;
- (unsigned)week;
@end

@implementation TSGPSTime

- (TSGPSTime)initWithNanosecondsSinceEpoch:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TSGPSTime;
  result = -[TSGPSTime init](&v5, "init");
  if (result) {
    result->_nanosecondsSinceEpoch = a3;
  }
  return result;
}

- (TSGPSTime)initWithExtendedWeek:(unsigned int)a3 seconds:(double)a4
{
  return -[TSGPSTime initWithExtendedWeek:nanoseconds:]( self,  "initWithExtendedWeek:nanoseconds:",  *(void *)&a3,  (unint64_t)(a4 * 1000000000.0));
}

- (TSGPSTime)initWithExtendedWeek:(unsigned int)a3 nanoseconds:(unint64_t)a4
{
  return -[TSGPSTime initWithNanosecondsSinceEpoch:]( self,  "initWithNanosecondsSinceEpoch:",  a4 + 604800000000000LL * a3);
}

- (TSGPSTime)initWithWeek:(unsigned int)a3 seconds:(double)a4 rollovers:(unsigned __int16)a5
{
  int v5 = a5 << 10;
  if (a3 >= 0x400) {
    int v5 = 0;
  }
  return -[TSGPSTime initWithExtendedWeek:seconds:](self, "initWithExtendedWeek:seconds:", v5 + a3, a4);
}

- (TSGPSTime)initWithWeek:(unsigned int)a3 nanoseconds:(unint64_t)a4 rollovers:(unsigned __int16)a5
{
  int v5 = a5 << 10;
  if (a3 >= 0x400) {
    int v5 = 0;
  }
  return -[TSGPSTime initWithExtendedWeek:nanoseconds:](self, "initWithExtendedWeek:nanoseconds:", v5 + a3, a4);
}

- (unsigned)extendedWeek
{
  return self->_nanosecondsSinceEpoch / 0x2260FF9290000LL;
}

- (unsigned)week
{
  return (unsigned __int16)-[TSGPSTime extendedWeek](self, "extendedWeek") & 0x3FF;
}

- (double)seconds
{
  return (double)-[TSGPSTime nanoseconds](self, "nanoseconds") / 1000000000.0;
}

- (unint64_t)nanoseconds
{
  return self->_nanosecondsSinceEpoch % 0x2260FF9290000LL;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  *((void *)result + 1) = self->_nanosecondsSinceEpoch;
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
    || -[TSGPSTime isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class(v4)))
  {
    id v5 = -[TSGPSTime nanosecondsSinceEpoch](self, "nanosecondsSinceEpoch");
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
  uint64_t v3 = -[TSGPSTime extendedWeek](self, "extendedWeek");
  -[TSGPSTime seconds](self, "seconds");
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"GPS Time week %u seconds %0.9f",  v3,  v4);
}

- (unint64_t)nanosecondsSinceEpoch
{
  return self->_nanosecondsSinceEpoch;
}

@end