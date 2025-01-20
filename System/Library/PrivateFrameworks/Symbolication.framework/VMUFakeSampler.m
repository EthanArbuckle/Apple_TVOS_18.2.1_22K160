@interface VMUFakeSampler
- (VMUFakeSampler)initWithProcessObjectGraph:(id)a3;
- (id)threadDescriptionStringForBacktrace:(id)a3 returnedAddress:(unint64_t *)a4;
@end

@implementation VMUFakeSampler

- (VMUFakeSampler)initWithProcessObjectGraph:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___VMUFakeSampler;
  v6 = -[VMUFakeSampler init](&v9, sel_init);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_graph, a3);
  }

  return v7;
}

- (id)threadDescriptionStringForBacktrace:(id)a3 returnedAddress:(unint64_t *)a4
{
  id v5 = a3;
  if ([v5 backtraceLength])
  {
    v6 = -[VMUProcessObjectGraph threadNameForAddress:]( self->_graph,  "threadNameForAddress:",  *(void *)[v5 stackFramePointers]);
    if (!v6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Thread_%u", objc_msgSend(v5, "thread"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    v6 = 0LL;
  }

  return v6;
}

- (void).cxx_destruct
{
}

@end