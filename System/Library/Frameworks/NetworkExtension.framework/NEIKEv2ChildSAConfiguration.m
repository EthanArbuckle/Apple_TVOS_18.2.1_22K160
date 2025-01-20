@interface NEIKEv2ChildSAConfiguration
- (BOOL)opportunisticPFS;
- (BOOL)preferInitiatorProposalOrder;
- (BOOL)sequencePerTrafficClass;
- (NEIKEv2ChildSAConfiguration)init;
- (NSArray)localTrafficSelectors;
- (NSArray)proposals;
- (NSArray)remoteTrafficSelectors;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (unint64_t)mode;
- (unsigned)replayWindowSize;
- (void)setLocalTrafficSelectors:(id)a3;
- (void)setMode:(unint64_t)a3;
- (void)setOpportunisticPFS:(BOOL)a3;
- (void)setPreferInitiatorProposalOrder:(BOOL)a3;
- (void)setProposals:(id)a3;
- (void)setRemoteTrafficSelectors:(id)a3;
- (void)setReplayWindowSize:(unsigned int)a3;
- (void)setSequencePerTrafficClass:(BOOL)a3;
@end

@implementation NEIKEv2ChildSAConfiguration

- (NEIKEv2ChildSAConfiguration)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NEIKEv2ChildSAConfiguration;
  v2 = -[NEIKEv2ChildSAConfiguration init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    -[NEIKEv2ChildSAConfiguration setReplayWindowSize:](v2, "setReplayWindowSize:", 4LL);
    v4 = v3;
  }

  else
  {
    ne_log_obj();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_fault_impl(&dword_1876B1000, v6, OS_LOG_TYPE_FAULT, "[super init] failed", v7, 2u);
    }
  }

  return v3;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v7 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithCapacity:0];
  ChildSAModeString = NEIKEv2CreateChildSAModeString(-[NEIKEv2ChildSAConfiguration mode](self, "mode"));
  [v7 appendPrettyObject:ChildSAModeString withName:@"Mode" andIndent:v5 options:a4];

  objc_msgSend( v7,  "appendPrettyInt:withName:andIndent:options:",  -[NEIKEv2ChildSAConfiguration replayWindowSize](self, "replayWindowSize"),  @"Replay Window Size",  v5,  a4);
  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEIKEv2ChildSAConfiguration sequencePerTrafficClass](self, "sequencePerTrafficClass"),  @"Sequence Per Traffic Class",  v5,  a4);
  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEIKEv2ChildSAConfiguration preferInitiatorProposalOrder](self, "preferInitiatorProposalOrder"),  @"Prefer Initiator Proposal Order",  v5,  a4);
  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEIKEv2ChildSAConfiguration opportunisticPFS](self, "opportunisticPFS"),  @"Opportunistic PFS",  v5,  a4);
  v9 = -[NEIKEv2ChildSAConfiguration proposals](self, "proposals");
  [v7 appendPrettyObject:v9 withName:@"Proposals" andIndent:v5 options:a4];
  v10 = -[NEIKEv2ChildSAConfiguration localTrafficSelectors](self, "localTrafficSelectors");
  [v7 appendPrettyObject:v10 withName:@"Local Traffic Selectors" andIndent:v5 options:a4];
  v11 = -[NEIKEv2ChildSAConfiguration remoteTrafficSelectors](self, "remoteTrafficSelectors");
  [v7 appendPrettyObject:v11 withName:@"Remote Traffic Selectors" andIndent:v5 options:a4];

  return v7;
}

- (id)description
{
  return -[NEIKEv2ChildSAConfiguration descriptionWithIndent:options:]( self,  "descriptionWithIndent:options:",  0LL,  14LL);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setMode:", -[NEIKEv2ChildSAConfiguration mode](self, "mode"));
  objc_msgSend(v4, "setReplayWindowSize:", -[NEIKEv2ChildSAConfiguration replayWindowSize](self, "replayWindowSize"));
  objc_msgSend( v4,  "setSequencePerTrafficClass:",  -[NEIKEv2ChildSAConfiguration sequencePerTrafficClass](self, "sequencePerTrafficClass"));
  objc_msgSend( v4,  "setPreferInitiatorProposalOrder:",  -[NEIKEv2ChildSAConfiguration preferInitiatorProposalOrder](self, "preferInitiatorProposalOrder"));
  -[NEIKEv2ChildSAConfiguration proposals](self, "proposals");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x189603F18]);
    v7 = -[NEIKEv2ChildSAConfiguration proposals](self, "proposals");
    objc_super v8 = (void *)[v6 initWithArray:v7 copyItems:1];
    [v4 setProposals:v8];
  }
  v9 = -[NEIKEv2ChildSAConfiguration localTrafficSelectors](self, "localTrafficSelectors");
  if (v9)
  {
    id v10 = objc_alloc(MEMORY[0x189603F18]);
    v11 = -[NEIKEv2ChildSAConfiguration localTrafficSelectors](self, "localTrafficSelectors");
    v12 = (void *)[v10 initWithArray:v11 copyItems:1];
    [v4 setLocalTrafficSelectors:v12];
  }
  v13 = -[NEIKEv2ChildSAConfiguration remoteTrafficSelectors](self, "remoteTrafficSelectors");
  if (v13)
  {
    id v14 = objc_alloc(MEMORY[0x189603F18]);
    v15 = -[NEIKEv2ChildSAConfiguration remoteTrafficSelectors](self, "remoteTrafficSelectors");
    v16 = (void *)[v14 initWithArray:v15 copyItems:1];
    [v4 setRemoteTrafficSelectors:v16];
  }

  return v4;
}

- (NSArray)proposals
{
  return self->_proposals;
}

- (void)setProposals:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  v4 = (NSArray *)[a3 copy];
  proposals = self->_proposals;
  self->_proposals = v4;

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v6 = self->_proposals;
  uint64_t v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v7)
  {
    uint64_t v8 = v7;
    char v9 = 0;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        ++v9;
        if (v12) {
          *(_BYTE *)(v12 + 8) = v9;
        }
      }

      uint64_t v8 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v8);
  }
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (unsigned)replayWindowSize
{
  return self->_replayWindowSize;
}

- (void)setReplayWindowSize:(unsigned int)a3
{
  self->_replayWindowSize = a3;
}

- (BOOL)sequencePerTrafficClass
{
  return self->_sequencePerTrafficClass;
}

- (void)setSequencePerTrafficClass:(BOOL)a3
{
  self->_sequencePerTrafficClass = a3;
}

- (BOOL)preferInitiatorProposalOrder
{
  return self->_preferInitiatorProposalOrder;
}

- (void)setPreferInitiatorProposalOrder:(BOOL)a3
{
  self->_preferInitiatorProposalOrder = a3;
}

- (BOOL)opportunisticPFS
{
  return self->_opportunisticPFS;
}

- (void)setOpportunisticPFS:(BOOL)a3
{
  self->_opportunisticPFS = a3;
}

- (NSArray)localTrafficSelectors
{
  return (NSArray *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setLocalTrafficSelectors:(id)a3
{
}

- (NSArray)remoteTrafficSelectors
{
  return (NSArray *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setRemoteTrafficSelectors:(id)a3
{
}

- (void).cxx_destruct
{
}

@end