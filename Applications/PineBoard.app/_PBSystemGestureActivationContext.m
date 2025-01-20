@interface _PBSystemGestureActivationContext
+ (id)cancellationContext;
+ (id)contextWithGestureRecognizer:(id)a3 type:(unint64_t)a4;
+ (id)indirectActivationContext;
- (BOOL)isSystemGestureCancellation;
- (NSNumber)timestamp;
- (NSString)debugDescription;
- (NSString)description;
- (UIGestureRecognizer)gestureRecognizer;
- (_PBSystemGestureActivationContext)initWithGestureRecognizer:(id)a3 state:(int64_t)a4 type:(unint64_t)a5;
- (__IOHIDEvent)HIDEvent;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)state;
- (unint64_t)gestureRecognizerType;
- (unint64_t)senderID;
- (void)dealloc;
- (void)invalidate;
@end

@implementation _PBSystemGestureActivationContext

+ (id)cancellationContext
{
  return [objc_alloc((Class)a1) initWithGestureRecognizer:0 state:4 type:0];
}

+ (id)indirectActivationContext
{
  return [objc_alloc((Class)a1) initWithGestureRecognizer:0 state:3 type:0];
}

+ (id)contextWithGestureRecognizer:(id)a3 type:(unint64_t)a4
{
  id v6 = a3;
  id v7 = objc_msgSend(objc_alloc((Class)a1), "initWithGestureRecognizer:state:type:", v6, objc_msgSend(v6, "state"), a4);

  return v7;
}

- (_PBSystemGestureActivationContext)initWithGestureRecognizer:(id)a3 state:(int64_t)a4 type:(unint64_t)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS____PBSystemGestureActivationContext;
  v10 = -[_PBSystemGestureActivationContext init](&v13, "init");
  v11 = v10;
  if (v10)
  {
    v10->_gestureRecognizerType = a5;
    v10->_state = a4;
    objc_storeStrong((id *)&v10->_gestureRecognizer, a3);
  }

  return v11;
}

- (void)dealloc
{
  HIDEvent = self->_HIDEvent;
  if (HIDEvent) {
    CFRelease(HIDEvent);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____PBSystemGestureActivationContext;
  -[_PBSystemGestureActivationContext dealloc](&v4, "dealloc");
}

- (__IOHIDEvent)HIDEvent
{
  if (!self->_HIDEvent)
  {
    gestureRecognizer = self->_gestureRecognizer;
    if (gestureRecognizer)
    {
      objc_super v4 = -[UIGestureRecognizer pb_eventRef](gestureRecognizer, "pb_eventRef");
      if (v4)
      {
        self->_HIDEvent = v4;
        CFRetain(v4);
      }
    }
  }

  return self->_HIDEvent;
}

- (BOOL)isSystemGestureCancellation
{
  return self->_state == 4 && self->_gestureRecognizerType == 0;
}

- (unint64_t)senderID
{
  unint64_t result = -[_PBSystemGestureActivationContext HIDEvent](self, "HIDEvent");
  if (result) {
    return IOHIDEventGetSenderID(result);
  }
  return result;
}

- (NSNumber)timestamp
{
  v2 = -[_PBSystemGestureActivationContext HIDEvent](self, "HIDEvent");
  if (v2)
  {
    v3 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  IOHIDEventGetTimeStamp(v2));
    v2 = (__IOHIDEvent *)objc_claimAutoreleasedReturnValue(v3);
  }

  return (NSNumber *)v2;
}

- (void)invalidate
{
  gestureRecognizer = self->_gestureRecognizer;
  self->_gestureRecognizer = 0LL;

  HIDEvent = self->_HIDEvent;
  if (HIDEvent)
  {
    CFRelease(HIDEvent);
    self->_HIDEvent = 0LL;
  }

- (id)succinctDescription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_PBSystemGestureActivationContext succinctDescriptionBuilder](self, "succinctDescriptionBuilder"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 build]);

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  objc_super v4 = sub_10008D608(self->_gestureRecognizerType);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  [v3 appendString:v5 withName:0];

  id v6 = sub_1001662FC(self->_state);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v3 appendString:v7 withName:@"state"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[_PBSystemGestureActivationContext descriptionBuilderWithMultilinePrefix:]( self,  "descriptionBuilderWithMultilinePrefix:",  a3));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_PBSystemGestureActivationContext succinctDescriptionBuilder](self, "succinctDescriptionBuilder"));
  [v5 setActiveMultilinePrefix:v4];

  if (self->_gestureRecognizer)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder succinctDescriptionForObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "succinctDescriptionForObject:"));
    [v5 appendString:v6 withName:0];
  }

  return v5;
}

- (NSString)description
{
  return (NSString *)(id)objc_claimAutoreleasedReturnValue( -[_PBSystemGestureActivationContext succinctDescription]( self,  "succinctDescription"));
}

- (NSString)debugDescription
{
  return (NSString *)(id)objc_claimAutoreleasedReturnValue( -[_PBSystemGestureActivationContext descriptionWithMultilinePrefix:]( self,  "descriptionWithMultilinePrefix:",  0LL));
}

- (UIGestureRecognizer)gestureRecognizer
{
  return self->_gestureRecognizer;
}

- (unint64_t)gestureRecognizerType
{
  return self->_gestureRecognizerType;
}

- (int64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
}

@end