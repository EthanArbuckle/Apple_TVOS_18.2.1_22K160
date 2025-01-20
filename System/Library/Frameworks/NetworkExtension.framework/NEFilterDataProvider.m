@interface NEFilterDataProvider
- (NEFilterDataVerdict)handleInboundDataCompleteForFlow:(NEFilterFlow *)flow;
- (NEFilterDataVerdict)handleInboundDataFromFlow:(NEFilterFlow *)flow readBytesStartOffset:(NSUInteger)offset readBytes:(NSData *)readBytes;
- (NEFilterDataVerdict)handleOutboundDataCompleteForFlow:(NEFilterFlow *)flow;
- (NEFilterDataVerdict)handleOutboundDataFromFlow:(NEFilterFlow *)flow readBytesStartOffset:(NSUInteger)offset readBytes:(NSData *)readBytes;
- (NEFilterNewFlowVerdict)handleNewFlow:(NEFilterFlow *)flow;
- (NEFilterRemediationVerdict)handleRemediationForFlow:(NEFilterFlow *)flow;
- (void)applySettings:(NEFilterSettings *)settings completionHandler:(void *)completionHandler;
- (void)resumeFlow:(NEFilterFlow *)flow withVerdict:(NEFilterVerdict *)verdict;
- (void)updateFlow:(NEFilterSocketFlow *)flow usingVerdict:(NEFilterDataVerdict *)verdict forDirection:(NETrafficDirection)direction;
@end

@implementation NEFilterDataProvider

- (NEFilterNewFlowVerdict)handleNewFlow:(NEFilterFlow *)flow
{
  return 0LL;
}

- (NEFilterDataVerdict)handleInboundDataFromFlow:(NEFilterFlow *)flow readBytesStartOffset:(NSUInteger)offset readBytes:(NSData *)readBytes
{
  return 0LL;
}

- (NEFilterDataVerdict)handleOutboundDataFromFlow:(NEFilterFlow *)flow readBytesStartOffset:(NSUInteger)offset readBytes:(NSData *)readBytes
{
  return 0LL;
}

- (NEFilterDataVerdict)handleInboundDataCompleteForFlow:(NEFilterFlow *)flow
{
  return 0LL;
}

- (NEFilterDataVerdict)handleOutboundDataCompleteForFlow:(NEFilterFlow *)flow
{
  return 0LL;
}

- (NEFilterRemediationVerdict)handleRemediationForFlow:(NEFilterFlow *)flow
{
  return 0LL;
}

- (void)applySettings:(NEFilterSettings *)settings completionHandler:(void *)completionHandler
{
  v18[1] = *MEMORY[0x1895F89C0];
  v6 = settings;
  v7 = completionHandler;
  id v8 = objc_alloc_init(MEMORY[0x189603FA8]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (-[NEFilterSettings checkValidityAndCollectErrors:](v6, "checkValidityAndCollectErrors:", v8))
    {
      v9 = -[NEProvider context](self, "context");
      [v9 applySettings:v6 completionHandler:v7];
    }

    else
    {
      if ([v8 count])
      {
        uint64_t v15 = *MEMORY[0x1896075E0];
        [v8 componentsJoinedByString:@"\n"];
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v13;
        [MEMORY[0x189603F68] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        v9 = 0LL;
      }

      [MEMORY[0x189607870] errorWithDomain:@"NEFilterErrorDomain" code:1 userInfo:v9];
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v14);
    }
  }

  else
  {
    id v10 = objc_alloc(MEMORY[0x189607870]);
    uint64_t v17 = *MEMORY[0x1896075E0];
    NEResourcesCopyLocalizedNSString( @"FILTER_SETTINGS_NOT_A_SETTINGS_OBJECT",  @"FILTER_SETTINGS_NOT_A_SETTINGS_OBJECT");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v11;
    [MEMORY[0x189603F68] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)[v10 initWithDomain:@"NEFilterErrorDomain" code:1 userInfo:v12];

    v7[2](v7, v9);
  }
}

- (void)resumeFlow:(NEFilterFlow *)flow withVerdict:(NEFilterVerdict *)verdict
{
  v6 = verdict;
  v7 = flow;
  -[NEProvider context](self, "context");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 resumeFlow:v7 withVerdict:v6];
}

- (void)updateFlow:(NEFilterSocketFlow *)flow usingVerdict:(NEFilterDataVerdict *)verdict forDirection:(NETrafficDirection)direction
{
  id v8 = verdict;
  v9 = flow;
  -[NEProvider context](self, "context");
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v10 updateFlow:v9 withVerdict:v8 forDirection:direction];
}

@end