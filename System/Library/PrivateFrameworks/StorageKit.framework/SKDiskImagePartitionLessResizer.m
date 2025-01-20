@interface SKDiskImagePartitionLessResizer
- (id)resizeStateMachine:(id *)a3;
@end

@implementation SKDiskImagePartitionLessResizer

- (id)resizeStateMachine:(id *)a3
{
  v24[8] = *MEMORY[0x1895F89C0];
  v5 = -[SKDiskResizerBase disk](self, "disk");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
  }

  else
  {
    v6 = -[SKDiskResizerBase disk](self, "disk");
    [v6 type];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    char v8 = [v7 isEqualToString:kSKDiskTypeHFS[0]];

    if ((v8 & 1) == 0)
    {
      +[SKError nilWithPOSIXCode:error:](&OBJC_CLASS___SKError, "nilWithPOSIXCode:error:", 45LL, a3);
      return (id)objc_claimAutoreleasedReturnValue();
    }
  }

  transitionEntrySEL( (uint64_t)@"kImageResize",  (uint64_t)kGrowEvent,  (uint64_t)sel_imageResize_,  (uint64_t)@"kVolumeResize");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v23;
  transitionEntrySEL( (uint64_t)@"kVolumeResize",  (uint64_t)kGrowEvent,  (uint64_t)sel_volumeResize_,  (uint64_t)kDoneGrow);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v9;
  endTransitionEntry((uint64_t)kDoneGrow, (uint64_t)kGrowEvent);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v10;
  transitionEntrySEL( (uint64_t)kDoneGrow,  (uint64_t)kShrinkEvent,  (uint64_t)sel_volumeResize_,  (uint64_t)@"kImageResize");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v11;
  transitionEntrySEL( (uint64_t)@"kVolumeResize",  (uint64_t)kShrinkEvent,  (uint64_t)sel_volumeResize_,  (uint64_t)@"kImageResize");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v12;
  transitionEntrySEL( (uint64_t)@"kImageResize",  (uint64_t)kShrinkEvent,  (uint64_t)sel_imageResize_,  (uint64_t)kDoneShrink);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[5] = v13;
  endTransitionEntry((uint64_t)kDoneShrink, (uint64_t)kShrinkEvent);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[6] = v14;
  transitionEntrySEL( (uint64_t)kDoneShrink,  (uint64_t)kGrowEvent,  (uint64_t)sel_imageResize_,  (uint64_t)@"kVolumeResize");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[7] = v15;
  [MEMORY[0x189603F18] arrayWithObjects:v24 count:8];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = +[SKStateTransitionTable tableWithTransitionEntries:selectorTarget:]( &OBJC_CLASS___SKStateTransitionTable,  "tableWithTransitionEntries:selectorTarget:",  v16,  self);  v18 = -[SKDiskResizerBase eventFromSize](self, "eventFromSize");
  else {
    v19 = @"kVolumeResize";
  }
  v20 = -[SKDiskResizerBase eventFromSize](self, "eventFromSize");
  v21 = +[SKStateMachine machineWithStateTransitionTable:startState:startEvent:]( &OBJC_CLASS___SKStateMachine,  "machineWithStateTransitionTable:startState:startEvent:",  v17,  v19,  v20);
  return v21;
}

@end