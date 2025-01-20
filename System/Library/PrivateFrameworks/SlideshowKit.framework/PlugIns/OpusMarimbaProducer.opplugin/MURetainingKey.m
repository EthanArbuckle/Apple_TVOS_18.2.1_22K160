@interface MURetainingKey
+ ($C3997F145DA9CFB88D7C332041F986CA)poolInfo;
+ (BOOL)clearVars;
+ (id)retainingKeyWithObject:(id)a3;
- (BOOL)isEqual:(id)a3;
- (MURetainingKey)initWithObject:(id)a3;
- (NSObject)object;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
- (void)purge;
@end

@implementation MURetainingKey

+ ($C3997F145DA9CFB88D7C332041F986CA)poolInfo
{
  return ($C3997F145DA9CFB88D7C332041F986CA *)&unk_2AE3C0;
}

+ (BOOL)clearVars
{
  return 0;
}

+ (id)retainingKeyWithObject:(id)a3
{
  return -[MURetainingKey initWithObject:](objc_alloc(&OBJC_CLASS___MURetainingKey), "initWithObject:", a3);
}

- (MURetainingKey)initWithObject:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MURetainingKey;
  v4 = -[MURetainingKey init](&v6, "init");
  if (v4) {
    v4->_object = a3;
  }
  return v4;
}

- (void)purge
{
  self->_object = 0LL;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MURetainingKey;
  -[MURetainingKey dealloc](&v3, "dealloc");
}

- (unint64_t)hash
{
  return (unint64_t)self->_object >> 4;
}

- (BOOL)isEqual:(id)a3
{
  return (objc_opt_respondsToSelector(a3, "purge") & 1) != 0 && *((void *)a3 + 2) == self->_object;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MURetainingKey;
  return objc_msgSend( -[MURetainingKey description](&v3, "description"),  "stringByAppendingFormat:",  @" %p",  self->_object);
}

- (NSObject)object
{
  return self->_object;
}

@end