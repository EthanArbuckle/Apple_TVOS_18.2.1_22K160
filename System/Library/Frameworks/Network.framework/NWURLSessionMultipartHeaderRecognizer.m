@interface NWURLSessionMultipartHeaderRecognizer
- (NWURLSessionMultipartHeaderRecognizer)init;
@end

@implementation NWURLSessionMultipartHeaderRecognizer

- (NWURLSessionMultipartHeaderRecognizer)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NWURLSessionMultipartHeaderRecognizer;
  result = -[NWURLSessionMultipartHeaderRecognizer init](&v3, sel_init);
  if (result) {
    *(_WORD *)&result->_last = 0;
  }
  return result;
}

@end