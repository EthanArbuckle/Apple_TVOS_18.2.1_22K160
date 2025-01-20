@interface DBGCachedFormatSpecifiers
@end

@implementation DBGCachedFormatSpecifiers

void __DBGCachedFormatSpecifiers_block_invoke(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v2 = (void *)DBGCachedFormatSpecifiers_dict;
  DBGCachedFormatSpecifiers_dict = v1;
}

@end