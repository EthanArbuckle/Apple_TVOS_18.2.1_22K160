@interface _PBAppInfoStoreUpdate
+ (id)addApplicationInfos:(id)a3;
+ (id)addPlaceholders:(id)a3;
+ (id)demoteApplicationInfos:(id)a3;
+ (id)removeApplicationInfos:(id)a3;
+ (id)removePlaceholders:(id)a3;
+ (id)updateAlternateAppIcons:(id)a3;
+ (id)updateApplicationInfos:(id)a3;
+ (id)updateDynamicState;
+ (id)updateLocalizations:(id)a3;
+ (id)updatePlaceholders:(id)a3;
+ (id)updatePolicy;
- (NSSet)applicationInfos;
- (NSSet)placeholders;
- (_PBAppInfoStoreUpdate)initWithType:(int64_t)a3 applicationInfos:(id)a4 placeholders:(id)a5;
- (id)description;
- (int64_t)updateType;
@end

@implementation _PBAppInfoStoreUpdate

+ (id)addApplicationInfos:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithType:0 applicationInfos:v4 placeholders:0];

  return v5;
}

+ (id)removeApplicationInfos:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithType:1 applicationInfos:v4 placeholders:0];

  return v5;
}

+ (id)updateApplicationInfos:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithType:2 applicationInfos:v4 placeholders:0];

  return v5;
}

+ (id)demoteApplicationInfos:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithType:3 applicationInfos:v4 placeholders:0];

  return v5;
}

+ (id)updateAlternateAppIcons:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithType:9 applicationInfos:v4 placeholders:0];

  return v5;
}

+ (id)updateLocalizations:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithType:10 applicationInfos:v4 placeholders:0];

  return v5;
}

+ (id)addPlaceholders:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithType:4 applicationInfos:0 placeholders:v4];

  return v5;
}

+ (id)removePlaceholders:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithType:5 applicationInfos:0 placeholders:v4];

  return v5;
}

+ (id)updatePlaceholders:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithType:6 applicationInfos:0 placeholders:v4];

  return v5;
}

+ (id)updatePolicy
{
  return [objc_alloc((Class)a1) initWithType:7 applicationInfos:0 placeholders:0];
}

+ (id)updateDynamicState
{
  return [objc_alloc((Class)a1) initWithType:8 applicationInfos:0 placeholders:0];
}

- (_PBAppInfoStoreUpdate)initWithType:(int64_t)a3 applicationInfos:(id)a4 placeholders:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS____PBAppInfoStoreUpdate;
  v10 = -[_PBAppInfoStoreUpdate init](&v17, "init");
  v11 = v10;
  if (v10)
  {
    v10->_updateType = a3;
    if (v8)
    {
      v12 = -[NSSet initWithArray:](objc_alloc(&OBJC_CLASS___NSSet), "initWithArray:", v8);
      applicationInfos = v11->_applicationInfos;
      v11->_applicationInfos = v12;
    }

    else
    {
      applicationInfos = v10->_applicationInfos;
      v10->_applicationInfos = 0LL;
    }

    if (v9)
    {
      v14 = -[NSSet initWithArray:](objc_alloc(&OBJC_CLASS___NSSet), "initWithArray:", v9);
      placeholders = v11->_placeholders;
      v11->_placeholders = v14;
    }

    else
    {
      placeholders = v11->_placeholders;
      v11->_placeholders = 0LL;
    }
  }

  return v11;
}

- (id)description
{
  if (qword_10046FF98 != -1) {
    dispatch_once(&qword_10046FF98, &stru_1003D0BC0);
  }
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS____PBAppInfoStoreUpdate;
  id v4 = -[_PBAppInfoStoreUpdate description](&v11, "description");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)qword_10046FF90;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", self->_updateType));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v7]);
  id v9 = -[NSString initWithFormat:]( v3,  "initWithFormat:",  @"%@ - %@ (%@)(%@)",  v5,  v8,  self->_applicationInfos,  self->_placeholders);

  return v9;
}

- (int64_t)updateType
{
  return self->_updateType;
}

- (NSSet)applicationInfos
{
  return self->_applicationInfos;
}

- (NSSet)placeholders
{
  return self->_placeholders;
}

- (void).cxx_destruct
{
}

@end