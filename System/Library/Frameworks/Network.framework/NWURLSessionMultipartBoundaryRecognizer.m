@interface NWURLSessionMultipartBoundaryRecognizer
- (void)dealloc;
@end

@implementation NWURLSessionMultipartBoundaryRecognizer

- (void)dealloc
{
  if (self)
  {
    pattern = self->_pattern;
    if (pattern)
    {
      free(pattern);
      self->_pattern = 0LL;
    }

    rollbackBuffer = self->_rollbackBuffer;
    if (rollbackBuffer)
    {
      free(rollbackBuffer);
      self->_rollbackBuffer = 0LL;
    }
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NWURLSessionMultipartBoundaryRecognizer;
  -[NWURLSessionMultipartBoundaryRecognizer dealloc](&v5, sel_dealloc);
}

@end