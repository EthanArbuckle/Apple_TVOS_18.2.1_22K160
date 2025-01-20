@interface GTIntKeyedDictionary
@end

@implementation GTIntKeyedDictionary

id __40__GTIntKeyedDictionary_encodeWithCoder___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) encodeObject:a3, +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%llu", a2) forKey];
}

id __38__GTIntKeyedDictionary_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 longLongValue];
  id v5 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class(NSString, v4), +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%llu", v3) forKey];
  if (!v5) {
    __assert_rtn("-[GTIntKeyedDictionary initWithCoder:]_block_invoke", ", 0, "obj"");
  }
  return [*(id *)(a1 + 40) setObject:v5 forIntKey:v3];
}

id __51__GTIntKeyedDictionary_initWithIntKeyedDictionary___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forIntKey:a2];
}

@end