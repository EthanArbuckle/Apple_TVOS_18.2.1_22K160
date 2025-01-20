@interface IDSHKDFWrapper
+ (id)deriveKeyMaterialFrom:(id)a3 info:(id)a4;
+ (id)deriveRandomDataFrom:(id)a3 info:(id)a4;
- (_TtC17identityservicesd14IDSHKDFWrapper)init;
@end

@implementation IDSHKDFWrapper

+ (id)deriveKeyMaterialFrom:(id)a3 info:(id)a4
{
  return sub_10043CBA0( (uint64_t)a1,  (uint64_t)a2,  a3,  a4,  (uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t))sub_10043D2DC);
}

+ (id)deriveRandomDataFrom:(id)a3 info:(id)a4
{
  return sub_10043CBA0( (uint64_t)a1,  (uint64_t)a2,  a3,  a4,  (uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t))sub_10043D4B8);
}

- (_TtC17identityservicesd14IDSHKDFWrapper)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for IDSHKDFWrapper();
  return -[IDSHKDFWrapper init](&v3, "init");
}

@end