@interface PreviousRoam
+ (id)roamWithBssid:(id)a3 andReason:(unint64_t)a4;
+ (void)initialize;
- (NSData)bssid;
- (NSDate)timestamp;
- (NSString)reason;
- (PreviousRoam)initWithBssid:(id)a3 andReason:(unint64_t)a4;
- (id)description;
- (void)dealloc;
- (void)setBssid:(id)a3;
- (void)setReason:(id)a3;
- (void)setTimestamp:(id)a3;
@end

@implementation PreviousRoam

+ (void)initialize
{
  qword_1002197F0 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  [(id)qword_1002197F0 setDateFormat:@"HH:mm:ss"];
}

+ (id)roamWithBssid:(id)a3 andReason:(unint64_t)a4
{
  return [objc_alloc((Class)a1) initWithBssid:a3 andReason:a4];
}

- (PreviousRoam)initWithBssid:(id)a3 andReason:(unint64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PreviousRoam;
  v6 = -[PreviousRoam init](&v8, "init");
  -[PreviousRoam setBssid:](v6, "setBssid:", a3);
  -[PreviousRoam setReason:]( v6,  "setReason:",  +[WiFiRoamManager stringRepresentationWithReason:]( &OBJC_CLASS___WiFiRoamManager,  "stringRepresentationWithReason:",  a4));
  -[PreviousRoam setTimestamp:](v6, "setTimestamp:", +[NSDate date](&OBJC_CLASS___NSDate, "date"));
  return v6;
}

- (id)description
{
  return +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@(%@):%@",  self->_bssid,  self->_reason,  [(id)qword_1002197F0 stringFromDate:self->_timestamp]);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PreviousRoam;
  -[PreviousRoam dealloc](&v3, "dealloc");
}

- (NSData)bssid
{
  return self->_bssid;
}

- (void)setBssid:(id)a3
{
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

@end