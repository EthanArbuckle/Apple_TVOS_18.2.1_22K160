@interface MPActionTrigger
+ (id)actionTrigger;
- (MPActionTrigger)init;
- (NSString)actionKey;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
- (void)setAction:(id)a3;
- (void)setActionKey:(id)a3;
@end

@implementation MPActionTrigger

+ (id)actionTrigger
{
  return objc_alloc_init(&OBJC_CLASS___MPActionTrigger);
}

- (MPActionTrigger)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MPActionTrigger;
  result = -[MPAction init](&v3, "init");
  if (result) {
    result->_actionKey = 0LL;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MPActionTrigger;
  -[MPAction dealloc](&v3, "dealloc");
}

- (void)setActionKey:(id)a3
{
  actionKey = self->_actionKey;
  if (actionKey)
  {

    self->_actionKey = 0LL;
  }

  self->_actionKey = (NSString *)[a3 copy];
  action = self->super._action;
  if (action) {
    -[MCAction setActionKey:](action, "setActionKey:", a3);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MPActionTrigger;
  id v4 = -[MPAction copyWithZone:](&v6, "copyWithZone:", a3);
  [v4 setActionKey:self->_actionKey];
  return v4;
}

- (void)setAction:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MPActionTrigger;
  -[MPAction setAction:](&v5, "setAction:", a3);
  action = self->super._action;
  if (action) {
    -[MCAction setActionKey:](action, "setActionKey:", self->_actionKey);
  }
}

- (NSString)actionKey
{
  return self->_actionKey;
}

@end