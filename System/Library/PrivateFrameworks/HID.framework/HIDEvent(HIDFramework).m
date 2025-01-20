@interface HIDEvent(HIDFramework)
- (BOOL)conformsToEventType:()HIDFramework;
- (BOOL)isEqualToHIDEvent:()HIDFramework;
- (id)serialize:()HIDFramework error:;
- (uint64_t)appendEvent:()HIDFramework;
- (uint64_t)copyWithZone:()HIDFramework;
- (uint64_t)dataValueForField:()HIDFramework;
- (uint64_t)doubleValueForField:()HIDFramework;
- (uint64_t)initWithBytes:()HIDFramework length:;
- (uint64_t)initWithData:()HIDFramework;
- (uint64_t)integerValueForField:()HIDFramework;
- (uint64_t)isEqual:()HIDFramework;
- (uint64_t)removeEvent:()HIDFramework;
- (uint64_t)setDoubleValue:()HIDFramework forField:;
- (uint64_t)setIntegerValue:()HIDFramework forField:;
- (uint64_t)setOptions:()HIDFramework;
- (uint64_t)setTimestamp:()HIDFramework;
- (void)initWithType:()HIDFramework timestamp:senderID:;
- (void)removeAllEvents;
@end

@implementation HIDEvent(HIDFramework)

- (void)initWithType:()HIDFramework timestamp:senderID:
{
  v2 = (void *)IOHIDEventCreate();

  if (v2)
  {
    IOHIDEventSetSenderID();
    id v3 = v2;
  }

  return v2;
}

- (uint64_t)initWithData:()HIDFramework
{
  uint64_t v4 = MEMORY[0x1895A3204](*MEMORY[0x189604DB0], a3);

  return v4;
}

- (uint64_t)initWithBytes:()HIDFramework length:
{
  uint64_t v5 = MEMORY[0x1895A31F8](*MEMORY[0x189604DB0], a3, a4);

  return v5;
}

- (uint64_t)copyWithZone:()HIDFramework
{
  return IOHIDEventCreateCopy();
}

- (BOOL)isEqualToHIDEvent:()HIDFramework
{
  return a3 && _IOHIDEventEqual() != 0;
}

- (uint64_t)isEqual:()HIDFramework
{
  id v4 = a3;
  if (a1 == v4)
  {
    uint64_t v5 = 1LL;
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      uint64_t v5 = [a1 isEqualToHIDEvent:v4];
    }
    else {
      uint64_t v5 = 0LL;
    }
  }

  return v5;
}

- (id)serialize:()HIDFramework error:
{
  if (a3)
  {
    Data = 0LL;
    if (!a4) {
      return Data;
    }
  }

  else
  {
    Data = (void *)IOHIDEventCreateData();
    if (!a4) {
      return Data;
    }
  }

  if (!Data)
  {
    [MEMORY[0x189607870] errorWithIOReturn:3758097084];
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return Data;
}

- (uint64_t)integerValueForField:()HIDFramework
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setIntegerValue:()HIDFramework forField:
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)doubleValueForField:()HIDFramework
{
  return IOHIDEventGetDoubleValue();
}

- (uint64_t)setDoubleValue:()HIDFramework forField:
{
  return IOHIDEventSetDoubleValue();
}

- (uint64_t)dataValueForField:()HIDFramework
{
  return IOHIDEventGetDataValue();
}

- (uint64_t)appendEvent:()HIDFramework
{
  return IOHIDEventAppendEvent();
}

- (uint64_t)removeEvent:()HIDFramework
{
  return IOHIDEventRemoveEvent();
}

- (void)removeAllEvents
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  objc_msgSend(a1, "children", 0, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0LL;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        IOHIDEventRemoveEvent();
        ++v5;
      }

      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }

    while (v3);
  }
}

- (BOOL)conformsToEventType:()HIDFramework
{
  return IOHIDEventConformsTo() != 0;
}

- (uint64_t)setTimestamp:()HIDFramework
{
  return IOHIDEventSetTimeStamp();
}

- (uint64_t)setOptions:()HIDFramework
{
  return IOHIDEventSetEventFlags();
}

@end