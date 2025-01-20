@interface CSGestureDropEvent
- (CSGestureDropEvent)initWithDroppingPrediction:(double)a3 droppedPrediction:(double)a4 timestamp:(double)a5;
- (CSGestureDropEvent)initWithXPCObject:(id)a3;
- (OS_xpc_object)xpcObject;
- (double)droppedPrediction;
- (double)droppingPrediction;
- (double)timestamp;
- (id)toString;
@end

@implementation CSGestureDropEvent

- (CSGestureDropEvent)initWithDroppingPrediction:(double)a3 droppedPrediction:(double)a4 timestamp:(double)a5
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CSGestureDropEvent;
  result = -[CSGestureDropEvent init](&v9, "init");
  if (result)
  {
    result->_droppingPrediction = a3;
    result->_droppedPrediction = a4;
    result->_timestamp = a5;
  }

  return result;
}

- (CSGestureDropEvent)initWithXPCObject:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CSGestureDropEvent;
  v5 = -[CSGestureDropEvent init](&v7, "init");
  if (v5)
  {
    v5->_droppingPrediction = xpc_dictionary_get_double(v4, "droppingPrediction");
    v5->_droppedPrediction = xpc_dictionary_get_double(v4, "droppedPrediction");
    v5->_timestamp = xpc_dictionary_get_double(v4, "timestamp");
  }

  return v5;
}

- (OS_xpc_object)xpcObject
{
  keys[0] = "droppingPrediction";
  keys[1] = "droppedPrediction";
  keys[2] = "timestamp";
  values[0] = xpc_double_create(self->_droppingPrediction);
  values[1] = xpc_double_create(self->_droppedPrediction);
  values[2] = xpc_double_create(self->_timestamp);
  xpc_object_t v3 = xpc_dictionary_create((const char *const *)keys, values, 3uLL);
  for (uint64_t i = 2LL; i != -1; --i)

  return (OS_xpc_object *)v3;
}

- (id)toString
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Dpg:%.3f Dpd:%.3f T:%.3f",  *(void *)&self->_droppingPrediction,  *(void *)&self->_droppedPrediction,  *(void *)&self->_timestamp);
}

- (double)droppingPrediction
{
  return self->_droppingPrediction;
}

- (double)droppedPrediction
{
  return self->_droppedPrediction;
}

- (double)timestamp
{
  return self->_timestamp;
}

@end