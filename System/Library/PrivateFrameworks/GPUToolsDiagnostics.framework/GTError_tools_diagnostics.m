@interface GTError_tools_diagnostics
- (id)dy_errorSignature;
- (id)localizedDescription;
@end

@implementation GTError_tools_diagnostics

- (id)localizedDescription
{
  id v3 = -[GTError_tools_diagnostics userInfo](self, "userInfo");
  if (!v3 || (id result = [v3 objectForKey:NSLocalizedDescriptionKey]) == 0)
  {
    id v5 = -[GTError_tools_diagnostics code](self, "code");
    if (!objc_msgSend( -[GTError_tools_diagnostics domain](self, "domain"),  "isEqualToString:",  @"DYErrorDomain")
      || (id result = (id)_StringForError((uint64_t)v5)) == 0LL)
    {
      v6.receiver = self;
      v6.super_class = (Class)&OBJC_CLASS___GTError_tools_diagnostics;
      return -[GTError_tools_diagnostics localizedDescription](&v6, "localizedDescription");
    }
  }

  return result;
}

- (id)dy_errorSignature
{
  id result = (id)_StringForError((uint64_t)-[GTError_tools_diagnostics code](self, "code"));
  if (!result)
  {
    v4.receiver = self;
    v4.super_class = (Class)&OBJC_CLASS___GTError_tools_diagnostics;
    return -[GTError_tools_diagnostics dy_errorSignature](&v4, "dy_errorSignature");
  }

  return result;
}

@end