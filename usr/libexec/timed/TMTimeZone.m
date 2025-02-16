@interface TMTimeZone
+ (TMTimeZone)timeZoneWithOlsonName:(id)a3 fromSource:(id)a4;
- (BOOL)hasSameOlsonNameAs:(id)a3;
- (NSString)olsonName;
- (NSString)source;
- (TMTimeZone)initWithDictionary:(id)a3;
- (TMTimeZone)initWithOlsonName:(id)a3 fromSource:(id)a4;
- (id)description;
- (void)dealloc;
- (void)setOlsonName:(id)a3;
- (void)setSource:(id)a3;
@end

@implementation TMTimeZone

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TMTimeZone;
  -[TMTimeZone dealloc](&v3, "dealloc");
}

- (TMTimeZone)initWithDictionary:(id)a3
{
  v4 = -[TMTimeZone init](self, "init");
  if (v4)
  {
    -[TMTimeZone setSource:](v4, "setSource:", [a3 objectForKeyedSubscript:@"TMSource"]);
    -[TMTimeZone setOlsonName:](v4, "setOlsonName:", [a3 objectForKeyedSubscript:@"TMTimeZone"]);
  }

  return v4;
}

- (TMTimeZone)initWithOlsonName:(id)a3 fromSource:(id)a4
{
  v6 = -[TMTimeZone init](self, "init");
  v7 = v6;
  if (v6)
  {
    -[TMTimeZone setSource:](v6, "setSource:", a4);
    -[TMTimeZone setOlsonName:](v7, "setOlsonName:", a3);
  }

  return v7;
}

+ (TMTimeZone)timeZoneWithOlsonName:(id)a3 fromSource:(id)a4
{
  return  -[TMTimeZone initWithOlsonName:fromSource:]( objc_alloc(&OBJC_CLASS___TMTimeZone),  "initWithOlsonName:fromSource:",  a3,  a4);
}

- (BOOL)hasSameOlsonNameAs:(id)a3
{
  return -[NSString isEqualToString:]( -[TMTimeZone olsonName](self, "olsonName"),  "isEqualToString:",  [a3 olsonName]);
}

- (id)description
{
  objc_super v3 = (objc_class *)objc_opt_class(self);
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p (%@: %@)>",  NSStringFromClass(v3),  self,  self->_source,  self->_olsonName);
}

- (NSString)source
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setSource:(id)a3
{
}

- (NSString)olsonName
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setOlsonName:(id)a3
{
}

@end