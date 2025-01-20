@interface GDIntelligencePlatformDiagnosticExtension
- (GDIntelligencePlatformDiagnosticExtension)init;
- (id)attachmentList;
- (id)attachmentsForParameters:(id)a3;
@end

@implementation GDIntelligencePlatformDiagnosticExtension

- (id)attachmentList
{
  return -[GDIPDiagnosticExtension attachmentList](self->_swiftDiagnosticExtension, "attachmentList");
}

- (id)attachmentsForParameters:(id)a3
{
  return -[GDIPDiagnosticExtension attachmentsForParameters:]( self->_swiftDiagnosticExtension,  "attachmentsForParameters:",  a3);
}

- (GDIntelligencePlatformDiagnosticExtension)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___GDIntelligencePlatformDiagnosticExtension;
  v2 = -[GDIntelligencePlatformDiagnosticExtension init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(&OBJC_CLASS___GDIPDiagnosticExtension);
    swiftDiagnosticExtension = v2->_swiftDiagnosticExtension;
    v2->_swiftDiagnosticExtension = v3;
  }

  return v2;
}

- (void).cxx_destruct
{
}

@end