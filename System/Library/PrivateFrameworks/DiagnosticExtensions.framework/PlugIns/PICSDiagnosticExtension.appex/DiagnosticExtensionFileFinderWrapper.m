@interface DiagnosticExtensionFileFinderWrapper
- (_TtC23PICSDiagnosticExtension36DiagnosticExtensionFileFinderWrapper)init;
- (id)getFileList;
@end

@implementation DiagnosticExtensionFileFinderWrapper

- (id)getFileList
{
  id v3 = objc_allocWithZone((Class)type metadata accessor for DiagnosticExtensionFileFinder(0LL, a2));
  v4 = self;
  id v5 = [v3 init];
  v6 = (void *)dispatch thunk of DiagnosticExtensionFileFinder.getFileList()();

  return v6;
}

- (_TtC23PICSDiagnosticExtension36DiagnosticExtensionFileFinderWrapper)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DiagnosticExtensionFileFinderWrapper();
  return -[DiagnosticExtensionFileFinderWrapper init](&v3, "init");
}

@end