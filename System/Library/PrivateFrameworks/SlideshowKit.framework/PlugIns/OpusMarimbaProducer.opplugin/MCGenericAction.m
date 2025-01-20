@interface MCGenericAction
+ (id)genericActionForTargetPlugObjectID:(id)a3 withAttributes:(id)a4;
- (MCGenericAction)initWithImprint:(id)a3;
- (NSDictionary)attributes;
- (id)description;
- (id)imprint;
- (void)_copySelfToSnapshot:(id)a3;
- (void)demolish;
- (void)setAttributes:(id)a3;
@end

@implementation MCGenericAction

+ (id)genericActionForTargetPlugObjectID:(id)a3 withAttributes:(id)a4
{
  v6 = objc_alloc_init(&OBJC_CLASS___MCGenericAction);
  -[MCAction setTargetObjectID:](v6, "setTargetObjectID:", a3);
  -[MCGenericAction setAttributes:](v6, "setAttributes:", a4);
  return v6;
}

- (MCGenericAction)initWithImprint:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MCGenericAction;
  v4 = -[MCAction initWithImprint:](&v6, "initWithImprint:");
  if (v4) {
    v4->_attributes = -[NSMutableDictionary initWithDictionary:]( [NSMutableDictionary alloc],  "initWithDictionary:",  [a3 objectForKey:@"attributes"]);
  }
  return v4;
}

- (void)demolish
{
  self->_attributes = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MCGenericAction;
  -[MCAction demolish](&v3, "demolish");
}

- (id)imprint
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MCGenericAction;
  id v3 = -[MCAction imprint](&v7, "imprint");
  v4 = v3;
  attributes = self->_attributes;
  if (attributes) {
    [v3 setObject:attributes forKey:@"attributes"];
  }
  return v4;
}

- (void)_copySelfToSnapshot:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MCGenericAction;
  -[MCAction _copySelfToSnapshot:](&v6, "_copySelfToSnapshot:", a3);
  attributes = self->_attributes;
  if (attributes) {
    *((void *)a3 + 3) = -[NSMutableDictionary copy](attributes, "copy");
  }
  objc_sync_exit(self);
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MCGenericAction;
  return objc_msgSend( -[MCAction description](&v3, "description"),  "stringByAppendingFormat:",  @", attributes=%@",  self->_attributes);
}

- (NSDictionary)attributes
{
  return (NSDictionary *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setAttributes:(id)a3
{
}

@end