@interface TMTime
+ (BOOL)supportsSecureCoding;
+ (id)timeWithDictionary:(id)a3;
+ (id)timeWithUtc_s:(double)a3 utcUnc_s:(double)a4 rtc_s:(double)a5 sf:(double)a6 source:(id)a7;
- (BOOL)isEquivalent:(id)a3;
- (BOOL)isSynthesized;
- (BOOL)reliability;
- (NSString)source;
- (TMTime)init;
- (TMTime)initWithCoder:(id)a3;
- (TMTime)initWithUtc_ns:(int64_t)a3 utcUnc_s:(double)a4 rtc_ns:(int64_t)a5 sf:(double)a6 sfUnc:(double)a7 source:(id)a8;
- (double)propagatedTimeAtRTC:(double)a3;
- (double)propagatedUncertaintyAtRTC:(double)a3;
- (double)rtc_s;
- (double)sf;
- (double)sfUnc;
- (double)utcUnc_s;
- (double)utc_s;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionary;
- (int64_t)rtc_ns;
- (int64_t)utc_ns;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setReliability:(BOOL)a3;
- (void)setRtc_ns:(int64_t)a3;
- (void)setRtc_s:(double)a3;
- (void)setSf:(double)a3;
- (void)setSfUnc:(double)a3;
- (void)setSource:(id)a3;
- (void)setSynthesized:(BOOL)a3;
- (void)setUtcUnc_s:(double)a3;
- (void)setUtc_ns:(int64_t)a3;
- (void)setUtc_s:(double)a3;
@end

@implementation TMTime

- (TMTime)init
{
  return -[TMTime initWithUtc_ns:utcUnc_s:rtc_ns:sf:sfUnc:source:]( self,  "initWithUtc_ns:utcUnc_s:rtc_ns:sf:sfUnc:source:",  0LL,  0LL,  0LL,  0.0,  0.0,  0.0);
}

- (TMTime)initWithUtc_ns:(int64_t)a3 utcUnc_s:(double)a4 rtc_ns:(int64_t)a5 sf:(double)a6 sfUnc:(double)a7 source:(id)a8
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___TMTime;
  v14 = -[TMTime init](&v17, "init");
  v15 = v14;
  if (v14)
  {
    v14->_rtc_ns = a5;
    v14->_utc_ns = a3;
    v14->_utcUnc_s = a4;
    v14->_sf = a6;
    v14->_sfUnc = a7;
    v14->_source = (NSString *)[a8 copy];
    v15->_reliability = 1;
  }

  return v15;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TMTime;
  -[TMTime dealloc](&v3, "dealloc");
}

+ (id)timeWithUtc_s:(double)a3 utcUnc_s:(double)a4 rtc_s:(double)a5 sf:(double)a6 source:(id)a7
{
  if (a3 >= 9223372040.0) {
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInFunction:file:lineNumber:description:",  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"),  @"TMUtilities_Private.h",  56LL,  @"CFTimeInterval too large for TMNanoTimeInterval: %lf",  *(void *)&a3);
  }
  if (a3 <= -9223372040.0) {
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInFunction:file:lineNumber:description:",  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"),  @"TMUtilities_Private.h",  57LL,  @"CFTimeInterval too small for TMNanoTimeInterval: %lf",  *(void *)&a3);
  }
  double v13 = modf(a3, &v17);
  double v14 = v17;
  if (a5 >= 9223372040.0) {
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInFunction:file:lineNumber:description:",  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"),  @"TMUtilities_Private.h",  56LL,  @"CFTimeInterval too large for TMNanoTimeInterval: %lf",  *(void *)&a5);
  }
  if (a5 <= -9223372040.0) {
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInFunction:file:lineNumber:description:",  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"),  @"TMUtilities_Private.h",  57LL,  @"CFTimeInterval too small for TMNanoTimeInterval: %lf",  *(void *)&a5);
  }
  double v15 = modf(a5, &v17);
  return  objc_msgSend( objc_alloc((Class)objc_opt_class(a1)),  "initWithUtc_ns:utcUnc_s:rtc_ns:sf:sfUnc:source:",  llround(v13 * 1000000000.0) + 1000000000 * (uint64_t)v14,  llround(v15 * 1000000000.0) + 1000000000 * (uint64_t)v17,  a7,  a4,  a6,  0.00002);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend( objc_alloc((Class)objc_opt_class(self)),  "initWithUtc_ns:utcUnc_s:rtc_ns:sf:sfUnc:source:",  self->_utc_ns,  self->_rtc_ns,  self->_source,  self->_utcUnc_s,  self->_sf,  self->_sfUnc);
  *((_BYTE *)result + 8) = self->_synthesized;
  *((_BYTE *)result + 9) = self->_reliability;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (TMTime)initWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TMTime;
  v4 = -[TMTime init](&v9, "init");
  if (v4)
  {
    v4->_rtc_ns = (int64_t)[a3 decodeInt64ForKey:@"rtc_ns"];
    v4->_utc_ns = (int64_t)[a3 decodeInt64ForKey:@"utc_ns"];
    [a3 decodeDoubleForKey:@"utcUnc_s"];
    v4->_utcUnc_s = v5;
    [a3 decodeDoubleForKey:@"sf"];
    v4->_sf = v6;
    [a3 decodeDoubleForKey:@"sfUnc"];
    v4->_sfUnc = v7;
    v4->_source = (NSString *) [a3 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"source"];
    v4->_synthesized = [a3 decodeBoolForKey:@"synthesized"];
    v4->_reliability = [a3 decodeBoolForKey:@"reliability"];
  }

  return v4;
}

- (id)description
{
  uint64_t v4 = v3;
  -[TMTime utcUnc_s](self, "utcUnc_s");
  uint64_t v6 = v5;
  -[TMTime rtc_s](self, "rtc_s");
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%f±%f at %f from '%@'",  v4,  v6,  v7,  -[TMTime source](self, "source"));
}

- (BOOL)isEquivalent:(id)a3
{
  double v6 = v5;
  objc_msgSend(a3, "utc_s");
  if (v6 >= v7) {
    double v8 = v6;
  }
  else {
    double v8 = v7;
  }
  if (v6 < v7) {
    double v7 = v6;
  }
  if (v8 - v7 > 0.000001) {
    return 0;
  }
  -[TMTime utcUnc_s](self, "utcUnc_s");
  double v10 = v9;
  objc_msgSend(a3, "utcUnc_s");
  if (v10 >= v11) {
    double v12 = v10;
  }
  else {
    double v12 = v11;
  }
  if (v10 < v11) {
    double v11 = v10;
  }
  if (v12 - v11 > 0.000001) {
    return 0;
  }
  -[TMTime rtc_s](self, "rtc_s");
  double v15 = v14;
  objc_msgSend(a3, "rtc_s");
  if (v15 >= v16) {
    double v17 = v15;
  }
  else {
    double v17 = v16;
  }
  if (v15 < v16) {
    double v16 = v15;
  }
  return v17 - v16 <= 0.000001;
}

- (double)propagatedTimeAtRTC:(double)a3
{
  double v6 = (a3 - v5) * self->_sf;
  -[TMTime utc_s](self, "utc_s");
  return v7 + v6;
}

- (double)propagatedUncertaintyAtRTC:(double)a3
{
  return sub_1000078B4(self->_utcUnc_s, a3 - v5);
}

- (int64_t)rtc_ns
{
  return self->_rtc_ns;
}

- (void)setRtc_ns:(int64_t)a3
{
  self->_rtc_ns = a3;
}

- (int64_t)utc_ns
{
  return self->_utc_ns;
}

- (void)setUtc_ns:(int64_t)a3
{
  self->_utc_ns = a3;
}

- (double)utcUnc_s
{
  return self->_utcUnc_s;
}

- (void)setUtcUnc_s:(double)a3
{
  self->_utcUnc_s = a3;
}

- (double)sf
{
  return self->_sf;
}

- (void)setSf:(double)a3
{
  self->_sf = a3;
}

- (double)sfUnc
{
  return self->_sfUnc;
}

- (void)setSfUnc:(double)a3
{
  self->_sfUnc = a3;
}

- (NSString)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
}

- (BOOL)isSynthesized
{
  return self->_synthesized;
}

- (void)setSynthesized:(BOOL)a3
{
  self->_synthesized = a3;
}

- (BOOL)reliability
{
  return self->_reliability;
}

- (void)setReliability:(BOOL)a3
{
  self->_reliability = a3;
}

+ (id)timeWithDictionary:(id)a3
{
  id v5 = [a3 objectForKeyedSubscript:@"TMScaleFactor"];
  double v6 = (void *)objc_opt_class(a1);
  objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"TMCurrentTime"), "doubleValue");
  double v8 = v7;
  objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"TMTimeError"), "doubleValue");
  double v10 = v9;
  objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"TMRtcTime"), "doubleValue");
  double v12 = v11;
  if (v5)
  {
    [v5 doubleValue];
    double v14 = v13;
  }

  else
  {
    double v14 = 1.0;
  }

  return objc_msgSend( v6,  "timeWithUtc_s:utcUnc_s:rtc_s:sf:source:",  objc_msgSend(a3, "objectForKeyedSubscript:", @"TMSource"),  v8,  v10,  v12,  v14);
}

- (id)dictionary
{
  v4[0] = @"TMCurrentTime";
  -[TMTime utc_s](self, "utc_s");
  v5[0] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
  v4[1] = @"TMTimeError";
  -[TMTime utcUnc_s](self, "utcUnc_s");
  v5[1] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
  v4[2] = @"TMRtcTime";
  -[TMTime rtc_s](self, "rtc_s");
  v5[2] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
  v4[3] = @"TMSource";
  v5[3] = -[TMTime source](self, "source");
  v4[4] = @"TMScaleFactor";
  -[TMTime sf](self, "sf");
  v5[4] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
  v4[5] = @"TMScaleFactorError";
  -[TMTime sfUnc](self, "sfUnc");
  v5[5] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
  v4[6] = @"TMReliability";
  v5[6] = +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[TMTime reliability](self, "reliability"));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v5,  v4,  7LL);
}

- (double)rtc_s
{
  int64_t v2 = -[TMTime rtc_ns](self, "rtc_ns");
  return (double)(v2 % 1000000000) / 1000000000.0 + (double)(v2 / 1000000000);
}

- (void)setRtc_s:(double)a3
{
  if (a3 >= 9223372040.0) {
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInFunction:file:lineNumber:description:",  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"),  @"TMUtilities_Private.h",  56LL,  @"CFTimeInterval too large for TMNanoTimeInterval: %lf",  *(void *)&a3);
  }
  if (a3 <= -9223372040.0) {
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInFunction:file:lineNumber:description:",  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"),  @"TMUtilities_Private.h",  57LL,  @"CFTimeInterval too small for TMNanoTimeInterval: %lf",  *(void *)&a3);
  }
  double v5 = modf(a3, &v6);
  -[TMTime setRtc_ns:](self, "setRtc_ns:", llround(v5 * 1000000000.0) + 1000000000 * (uint64_t)v6);
}

- (double)utc_s
{
  int64_t v2 = -[TMTime utc_ns](self, "utc_ns");
  return (double)(v2 % 1000000000) / 1000000000.0 + (double)(v2 / 1000000000);
}

- (void)setUtc_s:(double)a3
{
  if (a3 >= 9223372040.0) {
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInFunction:file:lineNumber:description:",  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"),  @"TMUtilities_Private.h",  56LL,  @"CFTimeInterval too large for TMNanoTimeInterval: %lf",  *(void *)&a3);
  }
  if (a3 <= -9223372040.0) {
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInFunction:file:lineNumber:description:",  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"),  @"TMUtilities_Private.h",  57LL,  @"CFTimeInterval too small for TMNanoTimeInterval: %lf",  *(void *)&a3);
  }
  double v5 = modf(a3, &v6);
  -[TMTime setUtc_ns:](self, "setUtc_ns:", llround(v5 * 1000000000.0) + 1000000000 * (uint64_t)v6);
}

@end