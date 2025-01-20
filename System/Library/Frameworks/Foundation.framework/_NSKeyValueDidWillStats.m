@interface _NSKeyValueDidWillStats
- (void)_recordThread;
- (void)dealloc;
@end

@implementation _NSKeyValueDidWillStats

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSKeyValueDidWillStats;
  -[_NSKeyValueDidWillStats dealloc](&v3, sel_dealloc);
}

- (void)_recordThread
{
  objc_super v3 = +[NSThread currentThread](&OBJC_CLASS___NSThread, "currentThread");
  originalThread = self->_originalThread;
  if (originalThread) {
    self->_detectedIssues.hasWillDidThreadMismatch = originalThread != v3;
  }
  else {
    self->_originalThread = v3;
  }
}

@end