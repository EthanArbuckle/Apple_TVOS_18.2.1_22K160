@interface NSTimeZone
+ (BOOL)supportsSecureCoding;
+ (NSArray)knownTimeZoneNames;
+ (NSDictionary)abbreviationDictionary;
+ (NSString)timeZoneDataVersion;
+ (NSTimeZone)allocWithZone:(_NSZone *)a3;
+ (NSTimeZone)defaultTimeZone;
+ (NSTimeZone)localTimeZone;
+ (NSTimeZone)systemTimeZone;
+ (NSTimeZone)timeZoneForSecondsFromGMT:(NSInteger)seconds;
+ (NSTimeZone)timeZoneWithAbbreviation:(NSString *)abbreviation;
+ (NSTimeZone)timeZoneWithName:(NSString *)tzName;
+ (NSTimeZone)timeZoneWithName:(NSString *)tzName data:(NSData *)aData;
+ (void)resetSystemTimeZone;
+ (void)setAbbreviationDictionary:(NSDictionary *)abbreviationDictionary;
+ (void)setDefaultTimeZone:(NSTimeZone *)defaultTimeZone;
- (BOOL)isDaylightSavingTime;
- (BOOL)isDaylightSavingTimeForDate:(NSDate *)aDate;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTimeZone:(NSTimeZone *)aTimeZone;
- (BOOL)isNSTimeZone__;
- (NSData)data;
- (NSDate)nextDaylightSavingTimeTransition;
- (NSDate)nextDaylightSavingTimeTransitionAfterDate:(NSDate *)aDate;
- (NSInteger)secondsFromGMT;
- (NSInteger)secondsFromGMTForDate:(NSDate *)aDate;
- (NSString)abbreviation;
- (NSString)abbreviationForDate:(NSDate *)aDate;
- (NSString)description;
- (NSString)localizedName:(NSTimeZoneNameStyle)style locale:(NSLocale *)locale;
- (NSString)name;
- (NSTimeInterval)daylightSavingTimeOffset;
- (NSTimeInterval)daylightSavingTimeOffsetForDate:(NSDate *)aDate;
- (NSTimeZone)initWithCoder:(id)a3;
- (NSTimeZone)initWithName:(NSString *)tzName;
- (NSTimeZone)initWithName:(NSString *)tzName data:(NSData *)aData;
- (unint64_t)hash;
@end

@implementation NSTimeZone

- (NSTimeInterval)daylightSavingTimeOffsetForDate:(NSDate *)aDate
{
  return 0.0;
}

- (NSDate)nextDaylightSavingTimeTransitionAfterDate:(NSDate *)aDate
{
  return 0LL;
}

- (BOOL)isNSTimeZone__
{
  return 1;
}

+ (NSTimeZone)systemTimeZone
{
  return (NSTimeZone *)+[NSTimeZone _current](&OBJC_CLASS___NSTimeZone, "_current");
}

+ (void)resetSystemTimeZone
{
}

+ (NSTimeZone)defaultTimeZone
{
  return (NSTimeZone *)+[NSTimeZone _default](&OBJC_CLASS___NSTimeZone, "_default");
}

+ (void)setDefaultTimeZone:(NSTimeZone *)defaultTimeZone
{
}

+ (NSTimeZone)localTimeZone
{
  return (NSTimeZone *)+[NSTimeZone _autoupdating](&OBJC_CLASS___NSTimeZone, "_autoupdating");
}

+ (NSArray)knownTimeZoneNames
{
  return (NSArray *)+[NSTimeZone _knownTimeZoneIdentifiers](&OBJC_CLASS___NSTimeZone, "_knownTimeZoneIdentifiers");
}

+ (NSDictionary)abbreviationDictionary
{
  return (NSDictionary *)+[NSTimeZone _abbreviationDictionary](&OBJC_CLASS___NSTimeZone, "_abbreviationDictionary");
}

+ (void)setAbbreviationDictionary:(NSDictionary *)abbreviationDictionary
{
}

+ (NSString)timeZoneDataVersion
{
  return (NSString *)+[NSTimeZone _timeZoneDataVersion](&OBJC_CLASS___NSTimeZone, "_timeZoneDataVersion");
}

- (NSInteger)secondsFromGMT
{
  return -[NSTimeZone secondsFromGMTForDate:]( self,  "secondsFromGMTForDate:",  +[NSDate date](&OBJC_CLASS___NSDate, "date"));
}

- (NSString)abbreviation
{
  return -[NSTimeZone abbreviationForDate:](self, "abbreviationForDate:", +[NSDate date](&OBJC_CLASS___NSDate, "date"));
}

- (BOOL)isDaylightSavingTime
{
  return -[NSTimeZone isDaylightSavingTimeForDate:]( self,  "isDaylightSavingTimeForDate:",  +[NSDate date](&OBJC_CLASS___NSDate, "date"));
}

- (NSTimeInterval)daylightSavingTimeOffset
{
  return result;
}

- (NSDate)nextDaylightSavingTimeTransition
{
  return -[NSTimeZone nextDaylightSavingTimeTransitionAfterDate:]( self,  "nextDaylightSavingTimeTransitionAfterDate:",  +[NSDate date](&OBJC_CLASS___NSDate, "date"));
}

- (NSString)localizedName:(NSTimeZoneNameStyle)style locale:(NSLocale *)locale
{
  return 0LL;
}

- (unint64_t)hash
{
  return CFHash(-[NSTimeZone name](self, "name"));
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v5) = 1;
  }

  else if (a3)
  {
    int v5 = _NSIsNSTimeZone((uint64_t)a3);
    if (v5) {
      LOBYTE(v5) = -[NSTimeZone isEqualToTimeZone:](self, "isEqualToTimeZone:", a3);
    }
  }

  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)isEqualToTimeZone:(NSTimeZone *)aTimeZone
{
  if (!aTimeZone) {
    return 0;
  }
  if (aTimeZone == self) {
    return 1;
  }
  v4 = -[NSTimeZone name](self, "name");
  int v5 = -[NSTimeZone name](aTimeZone, "name");
  BOOL result = 0;
  if (v4)
  {
    if (v5) {
      return CFEqual(v4, v5) != 0;
    }
  }

  return result;
}

- (NSString)description
{
  v3 = -[NSTimeZone name](self, "name");
  v4 = -[NSTimeZone abbreviation](self, "abbreviation");
  NSInteger v5 = -[NSTimeZone secondsFromGMT](self, "secondsFromGMT");
  BOOL v6 = -[NSTimeZone isDaylightSavingTime](self, "isDaylightSavingTime");
  v7 = "";
  if (v6) {
    v7 = " (Daylight)";
  }
  CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"%@ (%@) offset %ld%s",  v3,  v4,  v5,  v7);
  return (NSString *)_CFAutoreleasePoolAddObject();
}

+ (NSTimeZone)allocWithZone:(_NSZone *)a3
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  if (&OBJC_CLASS___NSTimeZone == a1) {
    return (NSTimeZone *)&___immutablePlaceholderTimeZone;
  }
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSTimeZone;
  return (NSTimeZone *)objc_msgSendSuper2(&v4, sel_allocWithZone_, a3);
}

+ (NSTimeZone)timeZoneWithName:(NSString *)tzName data:(NSData *)aData
{
  return (NSTimeZone *)(id)[objc_alloc((Class)a1) initWithName:tzName data:aData];
}

+ (NSTimeZone)timeZoneWithName:(NSString *)tzName
{
  return (NSTimeZone *)(id)[objc_alloc((Class)a1) initWithName:tzName];
}

+ (NSTimeZone)timeZoneWithAbbreviation:(NSString *)abbreviation
{
  if (abbreviation) {
    return (NSTimeZone *)+[NSTimeZone _timeZoneWithAbbreviation:]( &OBJC_CLASS___NSTimeZone,  "_timeZoneWithAbbreviation:");
  }
  else {
    return 0LL;
  }
}

+ (NSTimeZone)timeZoneForSecondsFromGMT:(NSInteger)seconds
{
  return (NSTimeZone *)+[NSTimeZone _timeZoneWithSecondsFromGMT:]( &OBJC_CLASS___NSTimeZone,  "_timeZoneWithSecondsFromGMT:",  seconds);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSTimeZone)initWithCoder:(id)a3
{
  return 0LL;
}

- (NSString)name
{
  v2 = __CFLookUpClass("NSTimeZone");
  OUTLINED_FUNCTION_0_24(v2);
  OUTLINED_FUNCTION_1_16();
  return result;
}

- (NSData)data
{
  v2 = __CFLookUpClass("NSTimeZone");
  OUTLINED_FUNCTION_0_24(v2);
  OUTLINED_FUNCTION_1_16();
  return result;
}

- (NSInteger)secondsFromGMTForDate:(NSDate *)aDate
{
  v3 = __CFLookUpClass("NSTimeZone");
  OUTLINED_FUNCTION_0_24(v3);
  OUTLINED_FUNCTION_1_16();
  return result;
}

- (NSString)abbreviationForDate:(NSDate *)aDate
{
  v3 = __CFLookUpClass("NSTimeZone");
  OUTLINED_FUNCTION_0_24(v3);
  OUTLINED_FUNCTION_1_16();
  return result;
}

- (BOOL)isDaylightSavingTimeForDate:(NSDate *)aDate
{
  v3 = __CFLookUpClass("NSTimeZone");
  OUTLINED_FUNCTION_0_24(v3);
  return 0;
}

- (NSTimeZone)initWithName:(NSString *)tzName data:(NSData *)aData
{
  objc_super v4 = __CFLookUpClass("NSTimeZone");
  OUTLINED_FUNCTION_0_24(v4);
  OUTLINED_FUNCTION_1_16();
  return result;
}

- (NSTimeZone)initWithName:(NSString *)tzName
{
  v3 = __CFLookUpClass("NSTimeZone");
  OUTLINED_FUNCTION_0_24(v3);
  OUTLINED_FUNCTION_1_16();
  return result;
}

@end