@interface NSDocumentSerializer
- (unint64_t)serializePListValueIn:(id)a3 key:(id)a4 value:(id)a5;
@end

@implementation NSDocumentSerializer

- (unint64_t)serializePListValueIn:(id)a3 key:(id)a4 value:(id)a5
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NSDocumentSerializer;
  return -[NSAKSerializer serializePListValueIn:key:value:](&v10, sel_serializePListValueIn_key_value_, a3, a4, a5);
}

@end