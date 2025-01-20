@interface CryptexPathMap
- (CryptexPathMap)init;
- (NSMutableDictionary)dict;
@end

@implementation CryptexPathMap

- (CryptexPathMap)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CryptexPathMap;
  v2 = -[CryptexPathMap init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    dict = v2->_dict;
    v2->_dict = v3;
  }

  return v2;
}

- (NSMutableDictionary)dict
{
  return self->_dict;
}

- (void).cxx_destruct
{
}

@end