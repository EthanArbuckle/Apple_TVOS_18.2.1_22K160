@interface SYDictionaryObject
- (NSDictionary)properties;
- (NSString)syncId;
- (SYDictionaryObject)initWithProperties:(id)a3;
- (void)setProperties:(id)a3;
- (void)setSyncId:(id)a3;
@end

@implementation SYDictionaryObject

- (SYDictionaryObject)initWithProperties:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SYDictionaryObject;
  return -[SYDictionaryObject init](&v4, "init", a3);
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
}

- (NSString)syncId
{
  return self->_syncId;
}

- (void)setSyncId:(id)a3
{
}

@end