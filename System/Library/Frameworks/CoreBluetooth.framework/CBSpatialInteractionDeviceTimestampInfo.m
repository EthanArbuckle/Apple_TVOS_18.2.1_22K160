@interface CBSpatialInteractionDeviceTimestampInfo
- (double)timestamp;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (unsigned)duplicateCount;
- (unsigned)reason;
- (void)setDuplicateCount:(unsigned __int8)a3;
- (void)setReason:(unsigned __int8)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation CBSpatialInteractionDeviceTimestampInfo

- (id)description
{
  return -[CBSpatialInteractionDeviceTimestampInfo descriptionWithLevel:](self, "descriptionWithLevel:", 50LL);
}

- (id)descriptionWithLevel:(int)a3
{
  if (a3 > 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%f", *(void *)&self->_timestamp);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_timestamp == 0.0) {
      goto LABEL_5;
    }
LABEL_8:
    NSAppendPrintF_safe();
    id v7 = 0LL;
    if (!self->_reason) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }

  if (qword_18C4B7D90 != -1) {
    dispatch_once(&qword_18C4B7D90, &__block_literal_global_636);
  }
  v4 = (void *)qword_18C4B7D88;
  [MEMORY[0x189603F50] dateWithTimeIntervalSince1970:self->_timestamp];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 stringFromDate:v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_timestamp != 0.0) {
    goto LABEL_8;
  }
LABEL_5:
  id v7 = 0LL;
  if (self->_reason)
  {
LABEL_9:
    CUPrintFlags32();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    id v8 = v7;

    id v7 = v8;
  }

uint64_t __64__CBSpatialInteractionDeviceTimestampInfo_descriptionWithLevel___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x189607848]);
  v1 = (void *)qword_18C4B7D88;
  qword_18C4B7D88 = (uint64_t)v0;

  return [(id)qword_18C4B7D88 setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
}

- (unsigned)duplicateCount
{
  return self->_duplicateCount;
}

- (void)setDuplicateCount:(unsigned __int8)a3
{
  self->_duplicateCount = a3;
}

- (unsigned)reason
{
  return self->_reason;
}

- (void)setReason:(unsigned __int8)a3
{
  self->_reason = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

@end