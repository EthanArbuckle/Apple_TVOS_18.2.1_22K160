@interface SCATMIDIInputSource
- (AXMIDIManager)midiManager;
- (BOOL)isMIDIInputSource;
- (SCATMIDIInputSource)init;
- (id)switchSource;
- (int64_t)_switchKeyForEvent:(id)a3;
- (int64_t)switchKeyForSwitch:(id)a3;
- (void)_handleMIDIEvent:(id)a3 device:(id)a4 entity:(id)a5 endpoint:(id)a6;
- (void)setMidiManager:(id)a3;
@end

@implementation SCATMIDIInputSource

- (SCATMIDIInputSource)init
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___SCATMIDIInputSource;
  v2 = -[SCATInputSource init](&v13, "init");
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = objc_alloc(&OBJC_CLASS___AXMIDIManager);
    v7 = _NSConcreteStackBlock;
    uint64_t v8 = 3221225472LL;
    v9 = sub_1000A598C;
    v10 = &unk_100124CB0;
    objc_copyWeak(&v11, &location);
    v4 = -[AXMIDIManager initWithIdentifier:eventHandler:]( v3,  "initWithIdentifier:eventHandler:",  @"SwitchControl",  &v7);
    midiManager = v2->_midiManager;
    v2->_midiManager = v4;

    -[AXMIDIManager printAttachedDevices](v2->_midiManager, "printAttachedDevices", v7, v8, v9, v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

  return v2;
}

- (int64_t)_switchKeyForEvent:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 channel];
  unsigned int v5 = [v3 note];

  return v5 | (unint64_t)(v4 << 8);
}

- (void)_handleMIDIEvent:(id)a3 device:(id)a4 entity:(id)a5 endpoint:(id)a6
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000A5ADC;
  v7[3] = &unk_100122168;
  v7[4] = self;
  id v8 = a3;
  id v6 = v8;
  AXPerformBlockOnMainThread(v7);
}

- (BOOL)isMIDIInputSource
{
  return 1;
}

- (id)switchSource
{
  return SCATSwitchSourceMIDI;
}

- (int64_t)switchKeyForSwitch:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a3 midiEvent]);
  int64_t v5 = -[SCATMIDIInputSource _switchKeyForEvent:](self, "_switchKeyForEvent:", v4);

  return v5;
}

- (AXMIDIManager)midiManager
{
  return self->_midiManager;
}

- (void)setMidiManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end