@interface SAHIDEventEmbedded
+ (void)parseKTrace:(ktrace_session *)a3 findingHIDEvents:(id)a4;
- (double)thresholdToGroupSameEventType;
- (id)hidEventTypeString;
@end

@implementation SAHIDEventEmbedded

- (id)hidEventTypeString
{
  unsigned int v3 = -[SAHIDEvent hidEventType](self, "hidEventType");
  if (v3 > 0x27) {
    v4 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"UNKNOWN(%d)",  -[SAHIDEvent hidEventType](self, "hidEventType"));
  }
  else {
    v4 = (void *)*((void *)&off_189F64A10 + (int)v3);
  }
  return v4;
}

- (double)thresholdToGroupSameEventType
{
  unsigned int v2 = -[SAHIDEvent hidEventType](self, "hidEventType");
  double result = 0.03;
  if (v2 != 11) {
    return 0.0;
  }
  return result;
}

+ (void)parseKTrace:(ktrace_session *)a3 findingHIDEvents:(id)a4
{
  id v5 = a4;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __51__SAHIDEventEmbedded_parseKTrace_findingHIDEvents___block_invoke;
  v8[3] = &unk_189F64940;
  id v9 = v5;
  v10 = a3;
  id v6 = v5;
  v7 = (void *)MEMORY[0x186E47C94](v8);
  ktrace_events_range();
}

void __51__SAHIDEventEmbedded_parseKTrace_findingHIDEvents___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = HIDEventTimestampForKTraceEvent(a2);
  if (v4 && *(_DWORD *)(a2 + 48) == 730267908)
  {
    int v5 = *(_DWORD *)(a2 + 16);
    if (v5)
    {
      +[SATimestamp timestampWithMachAbsTime:fromKtraceSession:]((uint64_t)&OBJC_CLASS___SATimestamp, v4);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      +[SAHIDEvent hidEventWithHIDEventType:atTimestamp:]((uint64_t)&OBJC_CLASS___SAHIDEventEmbedded, v5, v7);
      id v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SAHIDEvent addKTraceEvent:fromSession:]((uint64_t)v6, a2);
      (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
    }
  }

@end