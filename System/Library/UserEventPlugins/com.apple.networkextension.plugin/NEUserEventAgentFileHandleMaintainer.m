@interface NEUserEventAgentFileHandleMaintainer
- (NEUserEventAgentFileHandleMaintainer)init;
@end

@implementation NEUserEventAgentFileHandleMaintainer

- (NEUserEventAgentFileHandleMaintainer)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NEUserEventAgentFileHandleMaintainer;
  result = -[NEUserEventAgentFileHandleMaintainer init](&v3, "init");
  if (result) {
    result->_nesmPIDToken = -1;
  }
  return result;
}

- (void).cxx_destruct
{
}

@end