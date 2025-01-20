@interface SAHIDStepSample
- (id)debugDescription;
@end

@implementation SAHIDStepSample

- (id)debugDescription
{
  id v3 = objc_alloc(NSString);
  v4 = -[SATask debugDescription](self->_task, "debugDescription");
  unint64_t startSampleIndex = self->_startSampleIndex;
  unint64_t endSampleIndex = self->_endSampleIndex;
  unint64_t threadId = self->_threadId;
  v8 = -[SATimestamp debugDescription](self->_startTimestamp, "debugDescription");
  v9 = -[SATimestamp debugDescription](self->_endTimestamp, "debugDescription");
  v10 = (void *)[v3 initWithFormat:@"hid step sample %@ thread 0x%llx, %lu-%lu, %@-%@", v4, threadId, startSampleIndex, endSampleIndex, v8, v9];

  return v10;
}

- (void).cxx_destruct
{
}

@end