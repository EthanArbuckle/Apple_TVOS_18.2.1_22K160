@interface __PFExampleClass
- (__PFExampleClass)init;
- (void)pfExampleFunction;
@end

@implementation __PFExampleClass

- (void)pfExampleFunction
{
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1868D58D0;
  *(void *)(v3 + 56) = MEMORY[0x189617FA8];
  *(void *)(v3 + 32) = 0xD000000000000011LL;
  *(void *)(v3 + 40) = 0x80000001868D6C50LL;
  v4 = self;
  print(_:separator:terminator:)();

  swift_bridgeObjectRelease();
}

- (__PFExampleClass)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for _PFExampleClass();
  return -[__PFExampleClass init](&v3, sel_init);
}

@end