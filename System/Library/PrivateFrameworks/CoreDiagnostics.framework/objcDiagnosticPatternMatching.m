@interface objcDiagnosticPatternMatching
- (BOOL)isPatternPayloadAvailable;
- (BOOL)lookForPattern:(id)a3 :(BOOL)a4;
- (int)getMatcherType;
- (objcDiagnosticPatternMatching)initWithSwiftDiagnosticPatternMatching:(id)a3;
- (objcDiagnosticPatternMatching)initWithType:(int)a3;
- (void)lookForPatternAsync:(id)a3 :(BOOL)a4 :(id)a5;
@end

@implementation objcDiagnosticPatternMatching

- (objcDiagnosticPatternMatching)initWithType:(int)a3
{
  v4 = -[_SwiftDiagnosticPatternMatching initWithType:]( objc_alloc(&OBJC_CLASS____SwiftDiagnosticPatternMatching),  "initWithType:",  *(void *)&a3);
  swiftDiagnosticPatternMatching = self->_swiftDiagnosticPatternMatching;
  self->_swiftDiagnosticPatternMatching = v4;

  return self;
}

- (objcDiagnosticPatternMatching)initWithSwiftDiagnosticPatternMatching:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___objcDiagnosticPatternMatching;
  v6 = -[objcDiagnosticPatternMatching init](&v9, sel_init);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_swiftDiagnosticPatternMatching, a3);
  }

  return v7;
}

- (int)getMatcherType
{
  return -[_SwiftDiagnosticPatternMatching getMatcherType](self->_swiftDiagnosticPatternMatching, "getMatcherType");
}

- (BOOL)isPatternPayloadAvailable
{
  return -[_SwiftDiagnosticPatternMatching isPatternPayloadAvailable]( self->_swiftDiagnosticPatternMatching,  "isPatternPayloadAvailable");
}

- (BOOL)lookForPattern:(id)a3 :(BOOL)a4
{
  return -[_SwiftDiagnosticPatternMatching lookForPattern::]( self->_swiftDiagnosticPatternMatching,  "lookForPattern::",  a3,  a4);
}

- (void)lookForPatternAsync:(id)a3 :(BOOL)a4 :(id)a5
{
}

- (void).cxx_destruct
{
}

@end