@interface MCActionForEachPlug
+ (id)forEachPlugActionForTargetPlugObjectID:(id)a3 withAction:(id)a4 andPrefix:(id)a5;
- (MCAction)action;
- (MCActionForEachPlug)initWithImprint:(id)a3;
- (NSString)prefix;
- (id)description;
- (id)imprint;
- (void)_copySelfToSnapshot:(id)a3;
- (void)demolish;
- (void)setAction:(id)a3;
- (void)setPrefix:(id)a3;
@end

@implementation MCActionForEachPlug

+ (id)forEachPlugActionForTargetPlugObjectID:(id)a3 withAction:(id)a4 andPrefix:(id)a5
{
  v8 = objc_alloc_init(&OBJC_CLASS___MCActionForEachPlug);
  -[MCAction setTargetObjectID:](v8, "setTargetObjectID:", a3);
  -[MCActionForEachPlug setAction:](v8, "setAction:", a4);
  -[MCActionForEachPlug setPrefix:](v8, "setPrefix:", a5);
  return v8;
}

- (MCActionForEachPlug)initWithImprint:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MCActionForEachPlug;
  v4 = -[MCAction initWithImprint:](&v6, "initWithImprint:");
  if (v4)
  {
    v4->_action = (MCAction *) +[MCObjectLight objectWithImprint:]( MCObjectLight,  "objectWithImprint:",  [a3 objectForKey:@"action"]);
    v4->_prefix = (NSString *)[a3 objectForKey:@"prefix"];
  }

  return v4;
}

- (void)demolish
{
  self->_action = 0LL;
  self->_prefix = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MCActionForEachPlug;
  -[MCAction demolish](&v3, "demolish");
}

- (id)imprint
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MCActionForEachPlug;
  id v3 = -[MCAction imprint](&v7, "imprint");
  action = self->_action;
  if (action) {
    objc_msgSend(v3, "setObject:forKey:", -[MCAction imprint](action, "imprint"), @"action");
  }
  prefix = self->_prefix;
  if (prefix) {
    [v3 setObject:prefix forKey:@"prefix"];
  }
  return v3;
}

- (void)_copySelfToSnapshot:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MCActionForEachPlug;
  -[MCAction _copySelfToSnapshot:](&v7, "_copySelfToSnapshot:");
  action = self->_action;
  if (action) {
    *((void *)a3 + 3) = -[MCAction snapshot](action, "snapshot");
  }
  prefix = self->_prefix;
  if (prefix) {
    *((void *)a3 + 4) = -[NSString copy](prefix, "copy");
  }
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MCActionForEachPlug;
  return objc_msgSend( -[MCAction description](&v3, "description"),  "stringByAppendingFormat:",  @"\n\taction=%@\n\tprefix='%@'",  self->_action,  self->_prefix);
}

- (MCAction)action
{
  return (MCAction *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setAction:(id)a3
{
}

- (NSString)prefix
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setPrefix:(id)a3
{
}

@end