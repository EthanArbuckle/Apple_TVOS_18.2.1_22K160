@interface MCAnimationTrigger
+ (id)animationTriggerForTargetPlugObjectID:(id)a3 withAnimationKey:(id)a4;
- (MCAnimationTrigger)initWithImprint:(id)a3;
- (NSDictionary)animationAttributes;
- (NSString)animationKey;
- (id)description;
- (id)imprint;
- (void)_copySelfToSnapshot:(id)a3;
- (void)demolish;
- (void)setAnimationAttributes:(id)a3;
- (void)setAnimationKey:(id)a3;
@end

@implementation MCAnimationTrigger

+ (id)animationTriggerForTargetPlugObjectID:(id)a3 withAnimationKey:(id)a4
{
  v6 = objc_alloc_init(&OBJC_CLASS___MCAnimationTrigger);
  -[MCAction setTargetObjectID:](v6, "setTargetObjectID:", a3);
  -[MCAnimationTrigger setAnimationKey:](v6, "setAnimationKey:", a4);
  return v6;
}

- (MCAnimationTrigger)initWithImprint:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MCAnimationTrigger;
  v4 = -[MCAction initWithImprint:](&v6, "initWithImprint:");
  if (v4)
  {
    v4->_animationKey = (NSString *)[a3 objectForKey:@"animationKey"];
    v4->_animationAttributes = -[NSMutableDictionary initWithDictionary:]( [NSMutableDictionary alloc],  "initWithDictionary:",  [a3 objectForKey:@"animationAttributes"]);
  }

  return v4;
}

- (void)demolish
{
  self->_animationKey = 0LL;
  self->_animationAttributes = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MCAnimationTrigger;
  -[MCAction demolish](&v3, "demolish");
}

- (id)imprint
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MCAnimationTrigger;
  id v3 = -[MCAction imprint](&v8, "imprint");
  v4 = v3;
  animationKey = self->_animationKey;
  if (animationKey) {
    [v3 setObject:animationKey forKey:@"animationKey"];
  }
  animationAttributes = self->_animationAttributes;
  if (animationAttributes) {
    [v4 setObject:animationAttributes forKey:@"animationAttributes"];
  }
  return v4;
}

- (void)_copySelfToSnapshot:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MCAnimationTrigger;
  -[MCAction _copySelfToSnapshot:](&v7, "_copySelfToSnapshot:", a3);
  animationKey = self->_animationKey;
  if (animationKey) {
    *((void *)a3 + 4) = -[NSString copy](animationKey, "copy");
  }
  animationAttributes = self->_animationAttributes;
  if (animationAttributes) {
    *((void *)a3 + 3) = -[NSMutableDictionary copy](animationAttributes, "copy");
  }
  objc_sync_exit(self);
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MCAnimationTrigger;
  return objc_msgSend( -[MCAction description](&v3, "description"),  "stringByAppendingFormat:",  @", animationKey='%@', attributes=%@",  self->_animationKey,  self->_animationAttributes);
}

- (NSString)animationKey
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setAnimationKey:(id)a3
{
}

- (NSDictionary)animationAttributes
{
  return &self->_animationAttributes->super;
}

- (void)setAnimationAttributes:(id)a3
{
}

@end