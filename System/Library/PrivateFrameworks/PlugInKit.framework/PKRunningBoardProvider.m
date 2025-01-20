@interface PKRunningBoardProvider
- (id)processAssertionWithPID:(int)a3 flags:(unsigned int)a4 reason:(unsigned int)a5 name:(id)a6;
- (id)taskStatesForPID:(id)a3 error:(id *)a4;
- (void)plugInHandshakeComplete;
@end

@implementation PKRunningBoardProvider

- (id)processAssertionWithPID:(int)a3 flags:(unsigned int)a4 reason:(unsigned int)a5 name:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  uint64_t v7 = *(void *)&a4;
  uint64_t v8 = *(void *)&a3;
  id v9 = a6;
  v10 = objc_alloc(&OBJC_CLASS___PKProcessAssertionProxy);
  v12 = (void *)objc_msgSend_initWithPID_flags_reason_name_(v10, v11, v8, v7, v6, v9);

  return v12;
}

- (id)taskStatesForPID:(id)a3 error:(id *)a4
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_descriptor(MEMORY[0x189612340], v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValues_(v11, v12, 1, v13, v14);
  objc_msgSend_statesForPredicate_withDescriptor_error_( MEMORY[0x189612330],  v15,  (uint64_t)v6,  (uint64_t)v11,  (uint64_t)a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)plugInHandshakeComplete
{
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_plugInHandshakeComplete(v9, v5, v6, v7, v8);
}

@end