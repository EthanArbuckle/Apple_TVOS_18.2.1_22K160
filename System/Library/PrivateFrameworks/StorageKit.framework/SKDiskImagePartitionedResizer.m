@interface SKDiskImagePartitionedResizer
- (id)resizeStateMachine:(id *)a3;
@end

@implementation SKDiskImagePartitionedResizer

- (id)resizeStateMachine:(id *)a3
{
  v26[10] = *MEMORY[0x1895F89C0];
  v5 = -[SKDiskImageResizerBase limits](self, "limits");
  uint64_t v6 = objc_opt_class();
  v7 = -[SKDiskResizerBase disk](self, "disk");
  [v7 type];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = [(id)v6 isSupportedWholeDisk:v8];

  if ((v6 & 1) != 0)
  {
    transitionEntrySEL( (uint64_t)@"kImageResize",  (uint64_t)kGrowEvent,  (uint64_t)sel_imageResize_,  (uint64_t)@"kMoveRecovery");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v25;
    transitionEntrySEL( (uint64_t)@"kMoveRecovery",  (uint64_t)kGrowEvent,  (uint64_t)sel_moveRecovery_,  (uint64_t)@"kVolumeResize");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v24;
    transitionEntrySEL( (uint64_t)@"kVolumeResize",  (uint64_t)kGrowEvent,  (uint64_t)sel_volumeResize_,  (uint64_t)kDoneGrow);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26[2] = v23;
    endTransitionEntrySEL((uint64_t)kDoneGrow, (uint64_t)kGrowEvent, (uint64_t)sel_fitToSize_);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26[3] = v22;
    transitionEntrySEL( (uint64_t)kDoneGrow,  (uint64_t)kShrinkEvent,  (uint64_t)sel_volumeResize_,  (uint64_t)@"kMoveRecovery");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v26[4] = v9;
    transitionEntrySEL( (uint64_t)@"kVolumeResize",  (uint64_t)kShrinkEvent,  (uint64_t)sel_volumeResize_,  (uint64_t)@"kMoveRecovery");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v26[5] = v10;
    transitionEntrySEL( (uint64_t)@"kMoveRecovery",  (uint64_t)kShrinkEvent,  (uint64_t)sel_moveRecovery_,  (uint64_t)@"kImageResize");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v26[6] = v11;
    transitionEntrySEL( (uint64_t)@"kImageResize",  (uint64_t)kShrinkEvent,  (uint64_t)sel_imageResize_,  (uint64_t)kDoneShrink);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v26[7] = v12;
    endTransitionEntrySEL((uint64_t)kDoneShrink, (uint64_t)kShrinkEvent, (uint64_t)sel_fitToSize_);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v26[8] = v13;
    transitionEntrySEL( (uint64_t)kDoneShrink,  (uint64_t)kGrowEvent,  (uint64_t)sel_imageResize_,  (uint64_t)@"kMoveRecovery");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v26[9] = v14;
    [MEMORY[0x189603F18] arrayWithObjects:v26 count:10];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = +[SKStateTransitionTable tableWithTransitionEntries:selectorTarget:]( &OBJC_CLASS___SKStateTransitionTable,  "tableWithTransitionEntries:selectorTarget:",  v15,  self);    v17 = -[SKDiskResizerBase eventFromSize](self, "eventFromSize");
    else {
      v18 = @"kVolumeResize";
    }
    v19 = -[SKDiskResizerBase eventFromSize](self, "eventFromSize", v22);
    v20 = +[SKStateMachine machineWithStateTransitionTable:startState:startEvent:]( &OBJC_CLASS___SKStateMachine,  "machineWithStateTransitionTable:startState:startEvent:",  v16,  v18,  v19);
    return v20;
  }

  else
  {
    +[SKError nilWithPOSIXCode:error:](&OBJC_CLASS___SKError, "nilWithPOSIXCode:error:", 45LL, a3);
    return (id)objc_claimAutoreleasedReturnValue();
  }

@end