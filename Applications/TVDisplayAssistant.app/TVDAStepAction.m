@interface TVDAStepAction
- (BOOL)isEqual:(id)a3;
- (NSMutableArray)handlers;
- (NSMutableArray)timerStatusHandlers;
- (NSString)debugDescription;
- (NSString)title;
- (NSTimer)timer;
- (TVDAMeasurement)measurement;
- (TVDAStepAction)init;
- (TVDAStepAction)initWithTitle:(id)a3 flow:(int64_t)a4 handler:(id)a5;
- (double)idleSecondsToTrigger;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)flow;
- (unint64_t)hash;
- (void)_destroyTimer;
- (void)addHandler:(id)a3;
- (void)addSecondsToTriggerStatusHandler:(id)a3;
- (void)forceRunHandlers;
- (void)resetTimer;
- (void)setHandlers:(id)a3;
- (void)setIdleSecondsToTrigger:(double)a3;
- (void)setMeasurement:(id)a3;
- (void)setTimer:(id)a3;
- (void)setTimerStatusHandlers:(id)a3;
- (void)startTimer;
- (void)stopTimer;
@end

@implementation TVDAStepAction

- (TVDAStepAction)init
{
  id location = self;
  objc_storeStrong(&location, 0LL);
  return 0LL;
}

- (TVDAStepAction)initWithTitle:(id)a3 flow:(int64_t)a4 handler:(id)a5
{
  v21 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  int64_t v19 = a4;
  id v18 = 0LL;
  objc_storeStrong(&v18, a5);
  v5 = v21;
  v21 = 0LL;
  v17.receiver = v5;
  v17.super_class = (Class)&OBJC_CLASS___TVDAStepAction;
  v21 = -[TVDAStepAction init](&v17, "init");
  objc_storeStrong((id *)&v21, v21);
  if (v21)
  {
    objc_storeStrong((id *)&v21->_title, location[0]);
    v21->_flow = v19;
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    handlers = v21->_handlers;
    v21->_handlers = v6;

    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    timerStatusHandlers = v21->_timerStatusHandlers;
    v21->_timerStatusHandlers = v8;

    if (v18)
    {
      v12 = v21->_handlers;
      id v14 = [v18 copy];
      id v13 = objc_retainBlock(v14);
      -[NSMutableArray addObject:](v12, "addObject:");
    }
  }

  v11 = v21;
  objc_storeStrong(&v18, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v21, 0LL);
  return v11;
}

- (void)addHandler:(id)a3
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    handlers = v7->_handlers;
    id v5 = [location[0] copy];
    id v4 = objc_retainBlock(v5);
    -[NSMutableArray addObject:](handlers, "addObject:");
  }

  objc_storeStrong(location, 0LL);
}

- (void)addSecondsToTriggerStatusHandler:(id)a3
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    timerStatusHandlers = v7->_timerStatusHandlers;
    id v5 = [location[0] copy];
    id v4 = objc_retainBlock(v5);
    -[NSMutableArray addObject:](timerStatusHandlers, "addObject:");
  }

  objc_storeStrong(location, 0LL);
}

- (void)startTimer
{
  objc_super v17 = self;
  SEL v16 = a2;
  if (self->_idleSecondsToTrigger > 0.0 && !v17->_timer)
  {
    v12[0] = 0LL;
    v12[1] = v12;
    int v13 = 0x20000000;
    int v14 = 32;
    double idleSecondsToTrigger = v17->_idleSecondsToTrigger;
    objc_initWeak(&location, v17);
    id v4 = _NSConcreteStackBlock;
    int v5 = -1073741824;
    int v6 = 0;
    v7 = sub_100001F98;
    v8 = &unk_100028438;
    objc_copyWeak(&v10, &location);
    v9 = v12;
    v2 =  +[NSTimer scheduledTimerWithTimeInterval:repeats:block:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:repeats:block:",  1LL,  &v4,  1.0);
    timer = v17->_timer;
    v17->_timer = v2;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
    _Block_object_dispose(v12, 8);
  }

- (void)stopTimer
{
  v2 = -[TVDAStepAction timerStatusHandlers](self, "timerStatusHandlers");
  -[NSMutableArray removeAllObjects](v2, "removeAllObjects");
}

- (void)resetTimer
{
}

- (void)forceRunHandlers
{
  v27 = self;
  location[1] = (id)a2;
  location[0] = sub_10001A69C();
  char v25 = 16;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_ERROR))
  {
    log = (os_log_s *)location[0];
    os_log_type_t type = v25;
    sub_100002910(v24);
    _os_log_error_impl((void *)&_mh_execute_header, log, type, "Force Running Handlers...", v24, 2u);
  }

  objc_storeStrong(location, 0LL);
  id v10 = -[TVDAStepAction handlers](v27, "handlers");
  id v23 = -[NSMutableArray copy](v10, "copy");

  v11 = -[TVDAStepAction handlers](v27, "handlers");
  -[NSMutableArray removeAllObjects](v11, "removeAllObjects");

  memset(__b, 0, sizeof(__b));
  id obj = v23;
  id v13 = [obj countByEnumeratingWithState:__b objects:v29 count:16];
  if (v13)
  {
    uint64_t v7 = *(void *)__b[2];
    uint64_t v8 = 0LL;
    id v9 = v13;
    while (1)
    {
      uint64_t v6 = v8;
      if (*(void *)__b[2] != v7) {
        objc_enumerationMutation(obj);
      }
      uint64_t v22 = *(void *)(__b[1] + 8 * v8);
      id v20 = 0LL;
      id v19 = 0LL;
      char v5 = (*(uint64_t (**)(void))(v22 + 16))();
      objc_storeStrong(&v20, v19);
      if ((v5 & 1) == 0)
      {
        os_log_t oslog = (os_log_t)sub_10001A69C();
        os_log_type_t v17 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          v2 = oslog;
          os_log_type_t v3 = v17;
          id v4 = -[TVDAStepAction title](v27, "title");
          SEL v16 = v4;
          sub_1000024B4((uint64_t)v28, (uint64_t)v16, (uint64_t)v20);
          _os_log_error_impl( (void *)&_mh_execute_header,  v2,  v3,  "Could not execute handler for action %{public}@ error: %{public}@",  v28,  0x16u);

          objc_storeStrong((id *)&v16, 0LL);
        }

        objc_storeStrong((id *)&oslog, 0LL);
      }

      objc_storeStrong(&v20, 0LL);
      ++v8;
      if (v6 + 1 >= (unint64_t)v9)
      {
        uint64_t v8 = 0LL;
        id v9 = [obj countByEnumeratingWithState:__b objects:v29 count:16];
        if (!v9) {
          break;
        }
      }
    }
  }

  objc_storeStrong(&v23, 0LL);
}

- (void)_destroyTimer
{
  v2 = -[TVDAStepAction timer](self, "timer");
  -[NSTimer invalidate](v2, "invalidate");

  -[TVDAStepAction setTimer:](self, "setTimer:", 0LL);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v28 = self;
  v27[2] = (id)a2;
  v27[1] = a3;
  id v19 = objc_alloc(&OBJC_CLASS___TVDAStepAction);
  id v20 = -[NSString copy](v28->_title, "copy");
  v27[0] = -[TVDAStepAction initWithTitle:flow:handler:](v19, "initWithTitle:flow:handler:");

  [v27[0] setMeasurement:v28->_measurement];
  [v27[0] setIdleSecondsToTrigger:v28->_idleSecondsToTrigger];
  memset(__b, 0, sizeof(__b));
  id obj = v28->_handlers;
  id v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v30,  16LL);
  if (v22)
  {
    uint64_t v16 = *(void *)__b[2];
    uint64_t v17 = 0LL;
    id v18 = v22;
    while (1)
    {
      uint64_t v15 = v17;
      if (*(void *)__b[2] != v16) {
        objc_enumerationMutation(obj);
      }
      id v26 = *(id *)(__b[1] + 8 * v17);
      id v13 = v27[0];
      id v14 = [v26 copy];
      objc_msgSend(v13, "addHandler:");

      ++v17;
      if (v15 + 1 >= (unint64_t)v18)
      {
        uint64_t v17 = 0LL;
        id v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v30,  16LL);
        if (!v18) {
          break;
        }
      }
    }
  }

  memset(v23, 0, sizeof(v23));
  v11 = v28->_timerStatusHandlers;
  id v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  v23,  v29,  16LL);
  if (v12)
  {
    uint64_t v8 = *(void *)v23[2];
    uint64_t v9 = 0LL;
    id v10 = v12;
    while (1)
    {
      uint64_t v7 = v9;
      if (*(void *)v23[2] != v8) {
        objc_enumerationMutation(v11);
      }
      id v24 = *(id *)(v23[1] + 8 * v9);
      id v5 = v27[0];
      id v6 = [v24 copy];
      objc_msgSend(v5, "addSecondsToTriggerStatusHandler:");

      ++v9;
      if (v7 + 1 >= (unint64_t)v10)
      {
        uint64_t v9 = 0LL;
        id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  v23,  v29,  16LL);
        if (!v10) {
          break;
        }
      }
    }
  }

  id v4 = v27[0];
  objc_storeStrong(v27, 0LL);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v21 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (v21 == location[0])
  {
    char v22 = 1;
    int v19 = 1;
  }

  else
  {
    id v15 = location[0];
    uint64_t v3 = objc_opt_class(&OBJC_CLASS___TVDAStepAction);
    if ((objc_opt_isKindOfClass(v15, v3) & 1) != 0)
    {
      id v18 = location[0];
      title = v21->_title;
      id v12 = [v18 title];
      unsigned __int8 v13 = -[NSString isEqualToString:](title, "isEqualToString:");

      BOOL v14 = 0;
      if ((v13 & 1) != 0)
      {
        id flow = (id)v21->_flow;
        BOOL v14 = flow == [v18 flow];
      }

      char v16 = 0;
      unsigned __int8 v9 = 0;
      if (v14)
      {
        measurement = v21->_measurement;
        id v17 = [v18 measurement];
        char v16 = 1;
        unsigned __int8 v9 = -[TVDAMeasurement isEqual:](measurement, "isEqual:");
      }

      if ((v16 & 1) != 0) {

      }
      BOOL v7 = 0;
      if ((v9 & 1) != 0)
      {
        double idleSecondsToTrigger = v21->_idleSecondsToTrigger;
        [v18 idleSecondsToTrigger];
        BOOL v7 = idleSecondsToTrigger == v4;
      }

      char v22 = v7;
      int v19 = 1;
      objc_storeStrong(&v18, 0LL);
    }

    else
    {
      char v22 = 0;
      int v19 = 1;
    }
  }

  objc_storeStrong(location, 0LL);
  return v22 & 1;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_title, "hash", a2) ^ self->_flow;
}

- (NSString)debugDescription
{
  double v4 = objc_alloc(&OBJC_CLASS___NSString);
  v2 = (objc_class *)objc_opt_class(self);
  id v5 = NSStringFromClass(v2);
  id v6 = -[NSString initWithFormat:](v4, "initWithFormat:", @"<%@: %p> \"%@\"", v5, self, self->_title);

  return v6;
}

- (NSString)title
{
  return self->_title;
}

- (int64_t)flow
{
  return self->_flow;
}

- (double)idleSecondsToTrigger
{
  return self->_idleSecondsToTrigger;
}

- (void)setIdleSecondsToTrigger:(double)a3
{
  self->_double idleSecondsToTrigger = a3;
}

- (NSMutableArray)handlers
{
  return self->_handlers;
}

- (void)setHandlers:(id)a3
{
}

- (NSMutableArray)timerStatusHandlers
{
  return self->_timerStatusHandlers;
}

- (void)setTimerStatusHandlers:(id)a3
{
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (TVDAMeasurement)measurement
{
  return self->_measurement;
}

- (void)setMeasurement:(id)a3
{
}

- (void).cxx_destruct
{
}

@end