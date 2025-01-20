@interface CLMicroLocationEncryption
+ (BOOL)decryptFile:(id)a3 destinationPath:(id)a4 keyLabel:(id)a5 keychainClass:(Class)a6;
+ (BOOL)encryptFile:(id)a3 destinationPath:(id)a4 keyLabel:(id)a5 keychainClass:(Class)a6;
+ (id)decryptData:(id)a3 keyLabel:(id)a4;
+ (id)encryptData:(id)a3 keyLabel:(id)a4;
- (_TtC19microlocation_logic25CLMicroLocationEncryption)init;
@end

@implementation CLMicroLocationEncryption

+ (BOOL)encryptFile:(id)a3 destinationPath:(id)a4 keyLabel:(id)a5 keychainClass:(Class)a6
{
  return sub_10015B0F8((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, sub_10015B7BC);
}

+ (BOOL)decryptFile:(id)a3 destinationPath:(id)a4 keyLabel:(id)a5 keychainClass:(Class)a6
{
  return sub_10015B0F8((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, sub_10015C6C0);
}

+ (id)encryptData:(id)a3 keyLabel:(id)a4
{
  return sub_10015B310( (uint64_t)a1,  (uint64_t)a2,  a3,  a4,  (uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t))sub_10015D620);
}

+ (id)decryptData:(id)a3 keyLabel:(id)a4
{
  return sub_10015B310((uint64_t)a1, (uint64_t)a2, a3, a4, sub_10015DE78);
}

- (_TtC19microlocation_logic25CLMicroLocationEncryption)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CLMicroLocationEncryption();
  return -[CLMicroLocationEncryption init](&v3, "init");
}

@end