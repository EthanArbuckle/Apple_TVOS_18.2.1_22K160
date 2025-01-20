@interface TBTileItemDescriptor
+ (id)tileItemDescriptorWithKey:(id)a3;
- (NSNumber)key;
- (NSString)etag;
- (TBTileItemDescriptor)initWithKey:(id)a3 etag:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setEtag:(id)a3;
- (void)setKey:(id)a3;
@end

@implementation TBTileItemDescriptor

+ (id)tileItemDescriptorWithKey:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithKey:v4 etag:0];

  return v5;
}

- (TBTileItemDescriptor)initWithKey:(id)a3 etag:(id)a4
{
  v6 = (NSNumber *)a3;
  v7 = (NSString *)a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TBTileItemDescriptor;
  v8 = -[TBTileItemDescriptor init](&v13, sel_init);
  key = v8->_key;
  v8->_key = v6;
  v10 = v6;

  etag = v8->_etag;
  v8->_etag = v7;

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc_init((Class)objc_opt_class());
  v6 = -[TBTileItemDescriptor etag](self, "etag");
  v7 = (void *)[v6 copyWithZone:a3];
  [v5 setEtag:v7];
  v8 = -[TBTileItemDescriptor key](self, "key");
  v9 = (void *)[v8 copyWithZone:a3];
  [v5 setKey:v9];

  return v5;
}

- (NSString)etag
{
  return self->_etag;
}

- (void)setEtag:(id)a3
{
}

- (NSNumber)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (void).cxx_destruct
{
}

@end