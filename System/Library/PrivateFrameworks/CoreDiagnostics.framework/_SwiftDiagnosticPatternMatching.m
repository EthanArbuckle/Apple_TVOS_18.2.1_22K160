@interface _SwiftDiagnosticPatternMatching
- (BOOL)isPatternPayloadAvailable;
- (BOOL)lookForPattern:(id)a3 :(BOOL)a4;
- (_SwiftDiagnosticPatternMatching)init;
- (_SwiftDiagnosticPatternMatching)initWithType:(int)a3;
- (int)getMatcherType;
- (void)lookForPatternAsync:(id)a3 :(BOOL)a4 :(id)a5;
@end

@implementation _SwiftDiagnosticPatternMatching

- (_SwiftDiagnosticPatternMatching)initWithType:(int)a3
{
  return (_SwiftDiagnosticPatternMatching *)DiagnosticPatternMatching.init(type:)(a3);
}

- (int)getMatcherType
{
  return *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR____SwiftDiagnosticPatternMatching_type);
}

- (BOOL)isPatternPayloadAvailable
{
  if (v7)
  {
    v3 = self;
    BOOL v4 = sub_189146FFC();
    sub_189142E04((uint64_t)v6);
  }

  else
  {
    sub_189142E04((uint64_t)v6);
    return 0;
  }

  return v4;
}

- (BOOL)lookForPattern:(id)a3 :(BOOL)a4
{
  id v5 = a3;
  v6 = self;
  LOBYTE(self) = _s15CoreDiagnostics25DiagnosticPatternMatchingC07lookForD06report10takeActionSbAA10CriterialsC_SbtF_0(v5);

  return self & 1;
}

- (void)lookForPatternAsync:(id)a3 :(BOOL)a4 :(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  id v9 = a3;
  v10 = self;
  sub_189143684(v9, (uint64_t)sub_189143940, v8);

  swift_release();
}

- (_SwiftDiagnosticPatternMatching)init
{
  result = (_SwiftDiagnosticPatternMatching *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end