@interface ExclaveThread
- (NSMutableArray)stackEntries;
- (NSNumber)schedulingContextId;
- (void)addStackEntries:(id)a3;
- (void)setSchedulingContextId:(id)a3;
- (void)setStackEntries:(id)a3;
@end

@implementation ExclaveThread

- (void)addStackEntries:(id)a3
{
  id v4 = a3;
  stackEntries = self->_stackEntries;
  id v8 = v4;
  if (!stackEntries)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    v7 = self->_stackEntries;
    self->_stackEntries = v6;

    id v4 = v8;
    stackEntries = self->_stackEntries;
  }

  -[NSMutableArray addObject:](stackEntries, "addObject:", v4);
}

- (NSMutableArray)stackEntries
{
  return self->_stackEntries;
}

- (void)setStackEntries:(id)a3
{
}

- (NSNumber)schedulingContextId
{
  return self->_schedulingContextId;
}

- (void)setSchedulingContextId:(id)a3
{
}

- (void).cxx_destruct
{
}

@end