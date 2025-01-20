@interface HIDTransaction
- (BOOL)commitElements:(id)a3 error:(id *)a4;
- (BOOL)commitElements:(id)a3 error:(id *)a4 timeout:(int64_t)a5 callback:(id)a6;
- (HIDTransaction)initWithDevice:(id)a3;
- (id)description;
- (int64_t)direction;
- (void)dealloc;
- (void)setDirection:(int64_t)a3;
@end

@implementation HIDTransaction

- (HIDTransaction)initWithDevice:(id)a3
{
  v4 = (__IOHIDDevice *)a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___HIDTransaction;
  v5 = -[HIDTransaction init](&v9, sel_init);
  if (v5
    && (IOHIDTransactionRef v6 = IOHIDTransactionCreate((CFAllocatorRef)*MEMORY[0x189604DB0], v4, kIOHIDTransactionDirectionTypeInput, 1u),
        (v5->_transaction = v6) != 0LL))
  {
    v7 = v5;
  }

  else
  {
    v7 = 0LL;
  }

  return v7;
}

- (void)dealloc
{
  transaction = self->_transaction;
  if (transaction) {
    CFRelease(transaction);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___HIDTransaction;
  -[HIDTransaction dealloc](&v4, sel_dealloc);
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@", self->_transaction];
}

- (int64_t)direction
{
  return IOHIDTransactionGetDirection(self->_transaction);
}

- (void)setDirection:(int64_t)a3
{
}

- (BOOL)commitElements:(id)a3 error:(id *)a4
{
  return -[HIDTransaction commitElements:error:timeout:callback:]( self,  "commitElements:error:timeout:callback:",  a3,  a4,  0LL,  0LL);
}

- (BOOL)commitElements:(id)a3 error:(id *)a4 timeout:(int64_t)a5 callback:(id)a6
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a6;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      uint64_t v15 = 0LL;
      do
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v10);
        }
        IOHIDTransactionAddElement(self->_transaction, *(IOHIDElementRef *)(*((void *)&v21 + 1) + 8 * v15++));
      }

      while (v13 != v15);
      uint64_t v13 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v13);
  }

  transaction = self->_transaction;
  if (v11)
  {
    v17 = _Block_copy(v11);
    uint64_t v18 = IOHIDTransactionCommitWithCallback(transaction, (double)a5, (IOHIDCallback)asyncCommitCallback, v17);
  }

  else
  {
    uint64_t v18 = IOHIDTransactionCommit(self->_transaction);
  }

  uint64_t v19 = v18;
  IOHIDTransactionClear(self->_transaction);
  if ((_DWORD)v19)
  {
    if (a4)
    {
      [MEMORY[0x189607870] errorWithIOReturn:v19];
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    if (v11) {
      _Block_release(v11);
    }
  }

  return (_DWORD)v19 == 0;
}

@end