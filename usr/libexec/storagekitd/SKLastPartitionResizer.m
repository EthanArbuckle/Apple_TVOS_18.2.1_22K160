@interface SKLastPartitionResizer
- (id)fsResize:(id *)a3;
- (id)partResize:(id *)a3;
- (id)resizeStateMachine:(id *)a3;
- (unint64_t)currentSize;
@end

@implementation SKLastPartitionResizer

- (unint64_t)currentSize
{
  v3 = objc_alloc(&OBJC_CLASS___SKLastPartitions);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase disk](self, "disk"));
  v5 = -[SKLastPartitions initWithDisk:](v3, "initWithDisk:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKLastPartitions resizablePart](v5, "resizablePart"));
  v7 = (char *)[v6 unformattedSize];

  v19 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SKLastPartitions resizablePart](v5, "resizablePart"));
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___SKAPFSStoreDisk);
  char isKindOfClass = objc_opt_isKindOfClass(v8, v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SKLastPartitions resizablePart](v5, "resizablePart"));
  v12 = v11;
  if ((isKindOfClass & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue([v11 container]);

    if (v13)
    {
      v7 = (char *)[v13 totalSpace];
      v19 = v7;
    }
  }

  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue([v11 type]);
    unsigned int v15 = [v14 isEqualToString:kSKDiskTypeHFS];

    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[SKLastPartitions resizablePart](v5, "resizablePart"));
      +[SKLastPartitions hfsMinimalSizeForDisk:currentSize:]( &OBJC_CLASS___SKLastPartitions,  "hfsMinimalSizeForDisk:currentSize:",  v16,  &v19);

      v7 = v19;
    }
  }

  v17 = &v7[-[SKLastPartitions nonResizableSize](v5, "nonResizableSize")];

  return (unint64_t)v17;
}

- (id)partResize:(id *)a3
{
  v5 = objc_alloc(&OBJC_CLASS___SKLastPartitions);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase disk](self, "disk"));
  v7 = -[SKLastPartitions initWithDisk:](v5, "initWithDisk:", v6);

  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[SKLastPartitions resizablePart](v7, "resizablePart"));
  if (!v8) {
    goto LABEL_3;
  }
  uint64_t v9 = (void *)v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SKLastPartitions resizablePart](v7, "resizablePart"));
  unsigned __int8 v11 = [v10 isWholeDisk];

  if ((v11 & 1) != 0) {
    goto LABEL_3;
  }
  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(+[SKError frameworkBundle](&OBJC_CLASS___SKError, "frameworkBundle"));
  v16 = (void *)objc_claimAutoreleasedReturnValue( [v15 localizedStringForKey:@"Resizing partition..." value:&stru_100046600 table:0]);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase progress](self, "progress"));
  [v17 setLocalizedAdditionalDescription:v16];

  unint64_t v18 = -[SKDiskResizerBase requestedSize](self, "requestedSize");
  unint64_t v19 = v18 - -[SKLastPartitions nonResizableSize](v7, "nonResizableSize");
  id v20 = sub_10000E2BC();
  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[SKLastPartitions resizablePart](v7, "resizablePart"));
    int v29 = 136315650;
    v30 = "-[SKLastPartitionResizer partResize:]";
    __int16 v31 = 2112;
    v32 = v22;
    __int16 v33 = 2048;
    unint64_t v34 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%s: Resizing partition %@ to %lld bytes",  (uint8_t *)&v29,  0x20u);
  }

  v23 = objc_alloc(&OBJC_CLASS___SKPartitionTable);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase disk](self, "disk"));
  v25 = -[SKPartitionTable initWithDisk:error:](v23, "initWithDisk:error:", v24, a3);

  if (!v25)
  {
    uint64_t v12 = objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase rollbackResize:](self, "rollbackResize:", a3));
    goto LABEL_4;
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[SKLastPartitions resizablePart](v7, "resizablePart"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[SKPartitionTable partitionIDFromDisk:](&OBJC_CLASS___SKPartitionTable, "partitionIDFromDisk:", v26));

  if (!v27)
  {
    id v28 =  +[SKError errorWithCode:debugDescription:error:]( &OBJC_CLASS___SKError,  "errorWithCode:debugDescription:error:",  117LL,  @"Failed to get the ID of the resized partition",  a3);
    goto LABEL_14;
  }

  if (!-[SKPartitionTable resizePartitionID:size:offset:error:]( v25,  "resizePartitionID:size:offset:error:",  v27,  v19,  0LL,  a3))
  {
LABEL_14:
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase rollbackResize:](self, "rollbackResize:", a3));

    goto LABEL_5;
  }

LABEL_3:
  -[SKDiskResizerBase setCompletedUnitCount:]( self,  "setCompletedUnitCount:",  (char *)-[SKDiskResizerBase completedUnitCount](self, "completedUnitCount") + 10);
  uint64_t v12 = objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase eventFromSize](self, "eventFromSize"));
LABEL_4:
  v13 = (void *)v12;
LABEL_5:

  return v13;
}

- (id)fsResize:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SKError frameworkBundle](&OBJC_CLASS___SKError, "frameworkBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( [v5 localizedStringForKey:@"Resizing file system..." value:&stru_100046600 table:0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase progress](self, "progress"));
  [v7 setLocalizedAdditionalDescription:v6];

  uint64_t v8 = objc_alloc(&OBJC_CLASS___SKLastPartitions);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase disk](self, "disk"));
  v10 = -[SKLastPartitions initWithDisk:](v8, "initWithDisk:", v9);

  unint64_t v11 = -[SKDiskResizerBase requestedSize](self, "requestedSize");
  unint64_t v12 = v11 - -[SKLastPartitions nonResizableSize](v10, "nonResizableSize");
  id v13 = sub_10000E2BC();
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(-[SKLastPartitions resizablePart](v10, "resizablePart"));
    *(_DWORD *)buf = 136315650;
    v47 = "-[SKLastPartitionResizer fsResize:]";
    __int16 v48 = 2112;
    v49 = v15;
    __int16 v50 = 2048;
    unint64_t v51 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s: Resizing filesystem on %@ to %lld",  buf,  0x20u);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SKLastPartitions resizablePart](v10, "resizablePart"));
  uint64_t v17 = objc_opt_class(&OBJC_CLASS___SKAPFSStoreDisk);
  char isKindOfClass = objc_opt_isKindOfClass(v16, v17);

  if ((isKindOfClass & 1) == 0)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[SKLastPartitions resizablePart](v10, "resizablePart"));
    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 type]);
    unsigned int v26 = [v25 isEqualToString:kSKDiskTypeHFS];

    if (v26)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[SKLastPartitions resizablePart](v10, "resizablePart"));
      id v28 = +[SKPartitionTable createMediaRefWithDisk:error:]( &OBJC_CLASS___SKPartitionTable,  "createMediaRefWithDisk:error:",  v27,  a3);

      if (!v28)
      {
LABEL_16:
        uint64_t v23 = objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase rollbackResize:](self, "rollbackResize:", a3));
LABEL_25:
        v42 = (void *)v23;
        goto LABEL_26;
      }

      int v29 = (void *)objc_claimAutoreleasedReturnValue(-[SKLastPartitions resizablePart](v10, "resizablePart"));
      unsigned int v30 = [v29 getSectorSize];

      if (v30) {
        unint64_t v31 = v30;
      }
      else {
        unint64_t v31 = 512LL;
      }
      uint64_t v32 = MKHFSResizeVolume(v12 / v31, v28, 0LL);
      CFRelease(v28);
      if ((_DWORD)v32)
      {
        id v33 = +[SKError errorWithOSStatus:error:](&OBJC_CLASS___SKError, "errorWithOSStatus:error:", v32, a3);
        goto LABEL_16;
      }
    }

- (id)resizeStateMachine:(id *)a3
{
  v4 = sub_10000CA08( (uint64_t)@"kPartitionResize",  (uint64_t)off_100051918,  (uint64_t)"partResize:",  (uint64_t)@"kFSResize");
  unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v27[0] = v26;
  v5 = sub_10000CA08((uint64_t)@"kFSResize", (uint64_t)off_100051918, (uint64_t)"fsResize:", (uint64_t)off_100051930);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v27[1] = v6;
  id v7 = sub_10000CA3C((uint64_t)off_100051930, (uint64_t)off_100051918);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v27[2] = v8;
  uint64_t v9 = sub_10000CA08( (uint64_t)off_100051930,  (uint64_t)off_100051920,  (uint64_t)"fsResize:",  (uint64_t)@"kPartitionResize");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v27[3] = v10;
  unint64_t v11 = sub_10000CA08( (uint64_t)@"kFSResize",  (uint64_t)off_100051920,  (uint64_t)"fsResize:",  (uint64_t)@"kPartitionResize");
  unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v27[4] = v12;
  id v13 = sub_10000CA08( (uint64_t)@"kPartitionResize",  (uint64_t)off_100051920,  (uint64_t)"partResize:",  (uint64_t)off_100051938);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v27[5] = v14;
  id v15 = sub_10000CA3C((uint64_t)off_100051938, (uint64_t)off_100051920);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v27[6] = v16;
  uint64_t v17 = sub_10000CA08( (uint64_t)off_100051938,  (uint64_t)off_100051918,  (uint64_t)"partResize:",  (uint64_t)@"kFSResize");
  unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v27[7] = v18;
  unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v27, 8LL));
  id v20 = (void *)objc_claimAutoreleasedReturnValue( +[SKStateTransitionTable tableWithTransitionEntries:selectorTarget:]( &OBJC_CLASS___SKStateTransitionTable,  "tableWithTransitionEntries:selectorTarget:",  v19,  self));

  id v21 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase eventFromSize](self, "eventFromSize"));
  else {
    v22 = @"kFSResize";
  }
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase eventFromSize](self, "eventFromSize"));
  v24 = (void *)objc_claimAutoreleasedReturnValue( +[SKStateMachine machineWithStateTransitionTable:startState:startEvent:]( &OBJC_CLASS___SKStateMachine,  "machineWithStateTransitionTable:startState:startEvent:",  v20,  v22,  v23));

  return v24;
}

@end