@interface FFConfiguration(Disclosure)
@end

@implementation FFConfiguration(Disclosure)

- (void)addDisclosure:()Disclosure atLevel:.cold.1(uint64_t a1)
{
  qword_18C68EFE0 = (uint64_t)"BUG IN LIBFEATUREFLAGS: call to addDisclosure with a level that is not permitted";
  qword_18C68F010 = a1;
  __break(1u);
}

- (void)addDisclosure:()Disclosure atLevel:.cold.2()
{
  qword_18C68EFE0 = (uint64_t)"BUG IN LIBFEATUREFLAGS: call to addDisclosure with a level that is not permitted";
  qword_18C68F010 = 2LL;
  __break(1u);
}

- (void)removeDisclosure:()Disclosure atLevel:.cold.1(uint64_t a1)
{
  qword_18C68EFE0 = (uint64_t)"BUG IN LIBFEATUREFLAGS: call to removeDisclosure with a level that is not permitted";
  qword_18C68F010 = a1;
  __break(1u);
}

- (void)removeDisclosure:()Disclosure atLevel:.cold.2()
{
  qword_18C68EFE0 = (uint64_t)"BUG IN LIBFEATUREFLAGS: call to removeDisclosure with a level that is not permitted";
  qword_18C68F010 = 2LL;
  __break(1u);
}

- (void)removeAllDisclosuresAtLevelIndex:()Disclosure .cold.1(uint64_t a1)
{
  qword_18C68EFE0 = (uint64_t)"BUG IN LIBFEATUREFLAGS: call to removeAllDisclosures with a level that is not permitted";
  qword_18C68F010 = a1;
  __break(1u);
}

- (void)removeAllDisclosuresAtLevelIndex:()Disclosure .cold.2()
{
  qword_18C68EFE0 = (uint64_t)"BUG IN LIBFEATUREFLAGS: call to removeAllDisclosure with a level that is not permitted";
  qword_18C68F010 = 4LL;
  __break(1u);
}

@end