@interface UMLogMessage
- (UMLogMessage)init;
@end

@implementation UMLogMessage

- (UMLogMessage)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___UMLogMessage;
  v2 = -[UMLogMessage init](&v8, sel_init);
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    publicStrings = v2->_publicStrings;
    v2->_publicStrings = (NSMutableArray *)v3;

    uint64_t v5 = objc_opt_new();
    privateStrings = v2->_privateStrings;
    v2->_privateStrings = (NSMutableArray *)v5;
  }

  return v2;
}

- (void).cxx_destruct
{
}

@end