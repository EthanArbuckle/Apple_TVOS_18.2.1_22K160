@interface SAHIDStep
+ (SAHIDStep)hidStepWithDebugId:(int)a3 pid:(unint64_t)a4 tid:;
- (NSString)debugidString;
- (SATimestamp)timestamp;
- (id)debugDescription;
- (int)pid;
- (unint64_t)tid;
- (unsigned)debugid;
@end

@implementation SAHIDStep

+ (SAHIDStep)hidStepWithDebugId:(int)a3 pid:(unint64_t)a4 tid:
{
  v7 = objc_alloc_init(&OBJC_CLASS___SAHIDStep);
  v7->_debugid = a2;
  v7->_pid = a3;
  v7->_tid = a4;
  return v7;
}

- (NSString)debugidString
{
  signed int debugid = self->_debugid;
  if (debugid <= 736428043)
  {
    if (debugid <= 730268059)
    {
      if (debugid > 730267907)
      {
        if (debugid == 730267908)
        {
          v3 = @"UIKit HID callback start";
          return (NSString *)v3;
        }

        if (debugid == 730268056)
        {
          v3 = @"Keyboard event start";
          return (NSString *)v3;
        }
      }

      else
      {
        if (debugid == 730267892)
        {
          v3 = @"Event dispatch begin";
          return (NSString *)v3;
        }

        if (debugid == 730267896)
        {
          v3 = @"Event dispatch end";
          return (NSString *)v3;
        }
      }
    }

    else if (debugid <= 735576101)
    {
      if (debugid == 730268060)
      {
        v3 = @"Keyboard event stop";
        return (NSString *)v3;
      }

      if (debugid == 735576101)
      {
        v3 = @"Entry to NSApplication sendEvent";
        return (NSString *)v3;
      }
    }

    else
    {
      switch(debugid)
      {
        case 735576102:
          v3 = @"Return from NSApplication sendEvent";
          return (NSString *)v3;
        case 736428036:
          v3 = @"hid_translation_state_append_wrapped_nxevent";
          return (NSString *)v3;
        case 736428040:
          v3 = @"CGXGetNextEvent";
          return (NSString *)v3;
      }
    }

- (id)debugDescription
{
  id v3 = objc_alloc(NSString);
  v4 = -[SATimestamp debugDescription](self->_timestamp, "debugDescription");
  uint64_t debugid = self->_debugid;
  v6 = -[SAHIDStep debugidString](self, "debugidString");
  v7 = (void *)[v3 initWithFormat:@"%@ %#10x (%@) [%d] thread 0x%llx", v4, debugid, v6, self->_pid, self->_tid];

  return v7;
}

- (unsigned)debugid
{
  return self->_debugid;
}

- (SATimestamp)timestamp
{
  return (SATimestamp *)objc_getProperty(self, a2, 16LL, 1);
}

- (int)pid
{
  return self->_pid;
}

- (unint64_t)tid
{
  return self->_tid;
}

- (void).cxx_destruct
{
}

@end