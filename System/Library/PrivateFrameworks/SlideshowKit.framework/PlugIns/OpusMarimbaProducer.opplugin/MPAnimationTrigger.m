@interface MPAnimationTrigger
+ (id)animationTrigger;
- (MPAnimationTrigger)init;
- (NSDictionary)animationAttributes;
- (NSString)animationKey;
- (id)animationAttributeForKey:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
- (void)setAction:(id)a3;
- (void)setAnimationAttributes:(id)a3;
- (void)setAnimationKey:(id)a3;
@end

@implementation MPAnimationTrigger

+ (id)animationTrigger
{
  return objc_alloc_init(&OBJC_CLASS___MPAnimationTrigger);
}

- (MPAnimationTrigger)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MPAnimationTrigger;
  result = -[MPAction init](&v3, "init");
  if (result)
  {
    result->_animationKey = 0LL;
    result->_animationAttributes = 0LL;
  }

  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MPAnimationTrigger;
  -[MPAction dealloc](&v3, "dealloc");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MPAnimationTrigger;
  id v4 = -[MPAction copyWithZone:](&v6, "copyWithZone:", a3);
  [v4 setAnimationKey:self->_animationKey];
  [v4 setAnimationAttributes:self->_animationAttributes];
  return v4;
}

- (id)animationAttributeForKey:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->_animationAttributes, "objectForKey:", a3);
}

- (void)setAnimationKey:(id)a3
{
  animationKey = self->_animationKey;
  if (animationKey)
  {

    self->_animationKey = 0LL;
  }

  objc_super v6 = (NSString *)[a3 copy];
  self->_animationKey = v6;
  action = self->super._action;
  if (action) {
    -[MCAction setAnimationKey:](action, "setAnimationKey:", v6);
  }
}

- (void)setAnimationAttributes:(id)a3
{
  animationAttributes = self->_animationAttributes;
  if (animationAttributes)
  {

    self->_animationAttributes = 0LL;
  }

  objc_super v6 = (NSMutableDictionary *)[a3 mutableCopy];
  self->_animationAttributes = v6;
  action = self->super._action;
  if (action) {
    -[MCAction setAnimationAttributes:](action, "setAnimationAttributes:", v6);
  }
}

- (void)setAction:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MPAnimationTrigger;
  -[MPAction setAction:](&v5, "setAction:", a3);
  action = self->super._action;
  if (action)
  {
    -[MCAction setAnimationKey:](action, "setAnimationKey:", self->_animationKey);
    -[MCAction setAnimationAttributes:](self->super._action, "setAnimationAttributes:", self->_animationAttributes);
  }

- (NSString)animationKey
{
  return self->_animationKey;
}

- (NSDictionary)animationAttributes
{
  return &self->_animationAttributes->super;
}

@end