@interface APSTopicAttributes
+ (APSTopicAttributes)topicAttributesWithFilter:(int64_t)a3 darkWakeEnabled:(BOOL)a4 pushWakeEnabled:(BOOL)a5 criticalWakeEnabled:(BOOL)a6 ultraConstrainedEnabled:(BOOL)a7;
- (APSTopicAttributes)initWithFilter:(int64_t)a3 darkWakeEnabled:(BOOL)a4 pushWakeEnabled:(BOOL)a5 criticalWakeEnabled:(BOOL)a6 ultraConstrainedEnabled:(BOOL)a7;
- (BOOL)isCriticalWakeEnabled;
- (BOOL)isDarkWakeEnabled;
- (BOOL)isPushWakeEnabled;
- (BOOL)isUltraConstrainedEnabled;
- (id)description;
- (int64_t)filter;
- (void)setCriticalWakeEnabled:(BOOL)a3;
- (void)setDarkWakeEnabled:(BOOL)a3;
- (void)setPushWakeEnabled:(BOOL)a3;
- (void)setUltraConstrainedEnabled:(BOOL)a3;
@end

@implementation APSTopicAttributes

- (APSTopicAttributes)initWithFilter:(int64_t)a3 darkWakeEnabled:(BOOL)a4 pushWakeEnabled:(BOOL)a5 criticalWakeEnabled:(BOOL)a6 ultraConstrainedEnabled:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___APSTopicAttributes;
  result = -[APSTopicAttributes init](&v16, "init");
  if (result)
  {
    result->_filter = a3;
    if (v9) {
      char v13 = 2;
    }
    else {
      char v13 = 0;
    }
    if (v8) {
      char v14 = 4;
    }
    else {
      char v14 = 0;
    }
    if (v7) {
      char v15 = 8;
    }
    else {
      char v15 = 0;
    }
    *((_BYTE *)result + 16) = v13 | a4 | v14 | v15 | *((_BYTE *)result + 16) & 0xF0;
  }

  return result;
}

+ (APSTopicAttributes)topicAttributesWithFilter:(int64_t)a3 darkWakeEnabled:(BOOL)a4 pushWakeEnabled:(BOOL)a5 criticalWakeEnabled:(BOOL)a6 ultraConstrainedEnabled:(BOOL)a7
{
  return  -[APSTopicAttributes initWithFilter:darkWakeEnabled:pushWakeEnabled:criticalWakeEnabled:ultraConstrainedEnabled:]( objc_alloc(&OBJC_CLASS___APSTopicAttributes),  "initWithFilter:darkWakeEnabled:pushWakeEnabled:criticalWakeEnabled:ultraConstrainedEnabled:",  a3,  a4,  a5,  a6,  a7);
}

- (id)description
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___APSTopicAttributes;
  id v3 = -[APSTopicAttributes description](&v14, "description");
  uint64_t v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)v4;
  unint64_t filter = self->_filter;
  if (filter > 5) {
    BOOL v7 = @"UNKNOWN";
  }
  else {
    BOOL v7 = off_10011F548[filter];
  }
  if ((*((_BYTE *)self + 16) & 1) != 0) {
    BOOL v8 = @"YES";
  }
  else {
    BOOL v8 = @"NO";
  }
  if ((*((_BYTE *)self + 16) & 2) != 0) {
    BOOL v9 = @"YES";
  }
  else {
    BOOL v9 = @"NO";
  }
  if ((*((_BYTE *)self + 16) & 4) != 0) {
    v10 = @"YES";
  }
  else {
    v10 = @"NO";
  }
  if ((*((_BYTE *)self + 16) & 8) != 0) {
    v11 = @"YES";
  }
  else {
    v11 = @"NO";
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: filter=%@, darkWakeEnabled=%@, pushWakeEnabled=%@, criticalWakeEnabled=%@, ultraConstrainedEnabled=%@>",  v4,  v7,  v8,  v9,  v10,  v11));

  return v12;
}

- (BOOL)isDarkWakeEnabled
{
  return *((_BYTE *)self + 16) & 1;
}

- (void)setDarkWakeEnabled:(BOOL)a3
{
  *((_BYTE *)self + 16) = *((_BYTE *)self + 16) & 0xFE | a3;
}

- (BOOL)isPushWakeEnabled
{
  return (*((unsigned __int8 *)self + 16) >> 1) & 1;
}

- (void)setPushWakeEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((_BYTE *)self + 16) = *((_BYTE *)self + 16) & 0xFD | v3;
}

- (BOOL)isCriticalWakeEnabled
{
  return (*((unsigned __int8 *)self + 16) >> 2) & 1;
}

- (void)setCriticalWakeEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *((_BYTE *)self + 16) = *((_BYTE *)self + 16) & 0xFB | v3;
}

- (BOOL)isUltraConstrainedEnabled
{
  return (*((unsigned __int8 *)self + 16) >> 3) & 1;
}

- (void)setUltraConstrainedEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *((_BYTE *)self + 16) = *((_BYTE *)self + 16) & 0xF7 | v3;
}

- (int64_t)filter
{
  return self->_filter;
}

@end