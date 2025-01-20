@interface INAddMediaMediaItemResolutionResult
- (BOOL)_isResolutionFailure;
@end

@implementation INAddMediaMediaItemResolutionResult

- (BOOL)_isResolutionFailure
{
  LODWORD(v3) = -[INAddMediaMediaItemResolutionResult _isResolutionTerminal]( self,  "_isResolutionTerminal");
  if ((_DWORD)v3)
  {
    if (-[INAddMediaMediaItemResolutionResult resolutionResultCode](self, "resolutionResultCode") == (id)1)
    {
      unint64_t v3 = (unint64_t)-[INAddMediaMediaItemResolutionResult unsupportedReason](self, "unsupportedReason");
      if (v3 <= 8) {
        LOBYTE(v3) = (0xA7u >> v3) & 1;
      }
      else {
        LOBYTE(v3) = 1;
      }
    }

    else
    {
      LOBYTE(v3) = 1;
    }
  }

  return v3;
}

@end