@interface MCActionTrigger
+ (id)actionTriggerForTargetPlugObjectID:(id)a3 withActionKey:(id)a4;
- (MCActionTrigger)initWithImprint:(id)a3;
- (NSString)actionKey;
- (id)description;
- (id)imprint;
- (void)_copySelfToSnapshot:(id)a3;
- (void)demolish;
- (void)setActionKey:(id)a3;
@end

@implementation MCActionTrigger

+ (id)actionTriggerForTargetPlugObjectID:(id)a3 withActionKey:(id)a4
{
  v6 = objc_alloc_init(&OBJC_CLASS___MCActionTrigger);
  -[MCAction setTargetObjectID:](v6, "setTargetObjectID:", a3);
  -[MCActionTrigger setActionKey:](v6, "setActionKey:", a4);
  return v6;
}

- (MCActionTrigger)initWithImprint:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MCActionTrigger;
  v4 = -[MCAction initWithImprint:](&v6, "initWithImprint:");
  if (v4) {
    v4->_actionKey = (NSString *)[a3 objectForKey:@"actionKey"];
  }
  return v4;
}

- (void)demolish
{
  self->_actionKey = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MCActionTrigger;
  -[MCAction demolish](&v3, "demolish");
}

- (id)imprint
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MCActionTrigger;
  id v3 = -[MCAction imprint](&v7, "imprint");
  v4 = v3;
  actionKey = self->_actionKey;
  if (actionKey) {
    [v3 setObject:actionKey forKey:@"actionKey"];
  }
  return v4;
}

- (void)_copySelfToSnapshot:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MCActionTrigger;
  -[MCAction _copySelfToSnapshot:](&v6, "_copySelfToSnapshot:");
  actionKey = self->_actionKey;
  if (actionKey) {
    *((void *)a3 + 3) = -[NSString copy](actionKey, "copy");
  }
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MCActionTrigger;
  return objc_msgSend( -[MCAction description](&v3, "description"),  "stringByAppendingFormat:",  @", actionKey='%@'",  self->_actionKey);
}

- (NSString)actionKey
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setActionKey:(id)a3
{
}

@end