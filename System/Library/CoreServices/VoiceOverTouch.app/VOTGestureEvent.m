@interface VOTGestureEvent
+ (id)gestureEventWithEventRepresentation:(id)a3;
- (AXEventRepresentation)eventRepresentation;
- (BOOL)_eventMaskHasTouch;
- (BOOL)_isBogusTouchEvent;
- (BOOL)didFallThruToDevice;
- (BOOL)isCancelEvent;
- (BOOL)isDownEvent;
- (BOOL)isLiftEvent;
- (BOOL)isMovedEvent;
- (BOOL)isNonLiftingInRangeEvent;
- (BOOL)isStylusEvent;
- (id)_initWithDeviceIdentifier:(unint64_t)a3 andEventRepresentation:(id)a4;
- (id)description;
- (void)_addFingerInformation;
- (void)dealloc;
- (void)setEventRepresentation:(id)a3;
@end

@implementation VOTGestureEvent

+ (id)gestureEventWithEventRepresentation:(id)a3
{
  id v3 = a3;
  if ([v3 type] == 3001) {
    id v4 = [objc_allocWithZone((Class)VOTGestureEvent) _initWithDeviceIdentifier:1 andEventRepresentation:v3];
  }
  else {
    id v4 = 0LL;
  }

  return v4;
}

- (id)_initWithDeviceIdentifier:(unint64_t)a3 andEventRepresentation:(id)a4
{
  id v6 = a4;
  v7 = -[VOTGestureEvent initWithDeviceIdentifier:](self, "initWithDeviceIdentifier:", a3);
  v8 = v7;
  if (v7)
  {
    -[VOTGestureEvent setEventRepresentation:](v7, "setEventRepresentation:", v6);
    v9 = v8;
  }

  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___VOTGestureEvent;
  -[VOTGestureEvent dealloc](&v3, "dealloc");
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___VOTGestureEvent;
  id v3 = -[VOTGestureEvent description](&v8, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTGestureEvent eventRepresentation](self, "eventRepresentation"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@\nAXEventRep:%@",  v4,  v5));

  return v6;
}

- (void)setEventRepresentation:(id)a3
{
  p_eventRepresentation = &self->_eventRepresentation;
  objc_storeStrong((id *)&self->_eventRepresentation, a3);
  if (*p_eventRepresentation) {
    -[VOTGestureEvent _addFingerInformation](self, "_addFingerInformation");
  }
}

- (BOOL)isCancelEvent
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AXEventRepresentation handInfo](self->_eventRepresentation, "handInfo"));
  BOOL v3 = [v2 eventType] == 8;

  return v3;
}

- (BOOL)isLiftEvent
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXEventRepresentation handInfo](self->_eventRepresentation, "handInfo"));
  unsigned int v4 = [v3 eventType];

  if (v4 == 6 || v4 == 10) {
    return 1;
  }
  if (v4 == 9) {
    return !-[VOTGestureEvent isNonLiftingInRangeEvent](self, "isNonLiftingInRangeEvent");
  }
  return 0;
}

- (BOOL)_eventMaskHasTouch
{
  id v3 = -[AXEventRepresentation creatorHIDEvent](self->_eventRepresentation, "creatorHIDEvent");
  if (!v3)
  {
    uint64_t v9 = VOTLogEvent(0LL, v4);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      sub_1000F12B0((uint64_t)self, v10, v11, v12, v13, v14, v15, v16);
    }
    goto LABEL_8;
  }

  id v5 = v3;
  uint64_t Type = IOHIDEventGetType();
  if ((_DWORD)Type != 11)
  {
    uint64_t v17 = VOTLogEvent(Type, v7);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      sub_1000F1318((uint64_t)self, v10, v18, v19, v20, v21, v22, v23);
    }
LABEL_8:

    LOBYTE(v8) = 0;
    return v8;
  }

  return ((unint64_t)IOHIDEventGetIntegerValue(v5, 720903LL) >> 1) & 1;
}

- (BOOL)_isBogusTouchEvent
{
  BOOL v3 = -[VOTGestureEvent isStylusEvent](self, "isStylusEvent");
  if (v3)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXEventRepresentation handInfo](self->_eventRepresentation, "handInfo"));
    unsigned int v5 = [v4 eventType];

    if (v5 == 1) {
      LOBYTE(v3) = !-[VOTGestureEvent _eventMaskHasTouch](self, "_eventMaskHasTouch");
    }
    else {
      LOBYTE(v3) = 0;
    }
  }

  return v3;
}

- (BOOL)isNonLiftingInRangeEvent
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXEventRepresentation handInfo](self->_eventRepresentation, "handInfo"));
  unsigned int v4 = [v3 eventType];

  if (v4 == 9) {
    return !-[VOTGestureEvent _eventMaskHasTouch](self, "_eventMaskHasTouch");
  }
  else {
    return 0;
  }
}

- (BOOL)isDownEvent
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXEventRepresentation handInfo](self->_eventRepresentation, "handInfo"));
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (BOOL)isMovedEvent
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXEventRepresentation handInfo](self->_eventRepresentation, "handInfo"));
  else {
    BOOL v4 = -[VOTGestureEvent _isBogusTouchEvent](self, "_isBogusTouchEvent");
  }

  return v4;
}

- (BOOL)isStylusEvent
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AXEventRepresentation handInfo](self->_eventRepresentation, "handInfo"));
  unsigned __int8 v3 = [v2 isStylus];

  return v3;
}

- (void)_addFingerInformation
{
  if (!-[VOTGestureEvent isLiftEvent](self, "isLiftEvent"))
  {
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXEventRepresentation handInfo](self->_eventRepresentation, "handInfo", 0LL));
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 paths]);

    id v5 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v22;
      do
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v22 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
          if (([v9 pathProximity] & 2) != 0)
          {
            [v9 pathLocation];
            double v11 = sub_10004AFBC(v10);
            double v13 = v12;
            unsigned int v14 = [v9 transducerType];
            uint64_t v15 = [v9 pathIndex];
            [v9 orbValue];
            double v17 = v16;
            if (v14)
            {
              -[VOTGestureEvent addFingerWithIdentifier:location:pressure:]( self,  "addFingerWithIdentifier:location:pressure:",  v15,  v11,  v13,  v17);
            }

            else
            {
              [v9 altitude];
              double v19 = v18;
              [v9 azimuth];
              -[VOTGestureEvent addStylusWithIdentifier:location:pressure:altitude:azimuth:]( self,  "addStylusWithIdentifier:location:pressure:altitude:azimuth:",  v15,  v11,  v13,  v17,  v19,  v20);
            }
          }
        }

        id v6 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }

      while (v6);
    }
  }

- (BOOL)didFallThruToDevice
{
  return ((unint64_t)-[AXEventRepresentation additionalFlags](self->_eventRepresentation, "additionalFlags") >> 24) & 1;
}

- (AXEventRepresentation)eventRepresentation
{
  return self->_eventRepresentation;
}

- (void).cxx_destruct
{
}

@end