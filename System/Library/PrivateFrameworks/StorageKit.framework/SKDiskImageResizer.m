@interface SKDiskImageResizer
- (id)resizeStateMachine:(id *)a3;
@end

@implementation SKDiskImageResizer

- (id)resizeStateMachine:(id *)a3
{
  v24[8] = *MEMORY[0x1895F89C0];
  v5 = -[SKDiskImageResizerBase limits](self, "limits");
  uint64_t v6 = objc_opt_class();
  v7 = -[SKDiskResizerBase disk](self, "disk");
  [v7 type];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = [(id)v6 isSupportedWholeDisk:v8];

  if ((v6 & 1) != 0)
  {
    transitionEntrySEL( (uint64_t)@"kImageResize",  (uint64_t)kGrowEvent,  (uint64_t)sel_imageResize_,  (uint64_t)@"kMoveRecovery");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v23;
    transitionEntrySEL( (uint64_t)@"kMoveRecovery",  (uint64_t)kGrowEvent,  (uint64_t)sel_moveRecovery_,  (uint64_t)kDoneGrow);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v22;
    endTransitionEntrySEL((uint64_t)kDoneGrow, (uint64_t)kGrowEvent, (uint64_t)sel_fitToSize_);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v24[2] = v9;
    transitionEntrySEL( (uint64_t)kDoneGrow,  (uint64_t)kShrinkEvent,  (uint64_t)sel_moveRecovery_,  (uint64_t)@"kImageResize");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v24[3] = v10;
    transitionEntrySEL( (uint64_t)@"kMoveRecovery",  (uint64_t)kShrinkEvent,  (uint64_t)sel_moveRecovery_,  (uint64_t)@"kImageResize");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24[4] = v11;
    transitionEntrySEL( (uint64_t)@"kImageResize",  (uint64_t)kShrinkEvent,  (uint64_t)sel_imageResize_,  (uint64_t)kDoneShrink);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24[5] = v12;
    endTransitionEntrySEL((uint64_t)kDoneShrink, (uint64_t)kShrinkEvent, (uint64_t)sel_fitToSize_);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24[6] = v13;
    transitionEntrySEL( (uint64_t)kDoneShrink,  (uint64_t)kGrowEvent,  (uint64_t)sel_imageResize_,  (uint64_t)@"kMoveRecovery");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24[7] = v14;
    [MEMORY[0x189603F18] arrayWithObjects:v24 count:8];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = +[SKStateTransitionTable tableWithTransitionEntries:selectorTarget:]( &OBJC_CLASS___SKStateTransitionTable,  "tableWithTransitionEntries:selectorTarget:",  v15,  self);    v17 = -[SKDiskResizerBase eventFromSize](self, "eventFromSize");
    else {
      v18 = @"kMoveRecovery";
    }
    v19 = -[SKDiskResizerBase eventFromSize](self, "eventFromSize", &OBJC_CLASS___SKStateTransitionTable);
    v20 = +[SKStateMachine machineWithStateTransitionTable:startState:startEvent:]( &OBJC_CLASS___SKStateMachine,  "machineWithStateTransitionTable:startState:startEvent:",  v16,  v18,  v19);
    return v20;
  }

  else
  {
    +[SKError nilWithPOSIXCode:error:](&OBJC_CLASS___SKError, "nilWithPOSIXCode:error:", 45LL, a3);
    return (id)objc_claimAutoreleasedReturnValue();
  }

@end