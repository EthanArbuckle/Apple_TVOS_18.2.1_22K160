void sub_1888039BC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

LABEL_24:
      v3 = v19;
    }
  }
}

LABEL_11:
}

void sub_1888044B4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
}

HIDAnalyticsEvent *HIDAnalyticsEventCreate(uint64_t a1, void *DeepCopy)
{
  v3 = (HIDAnalyticsEvent *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    if (DeepCopy) {
      DeepCopy = (void *)CFPropertyListCreateDeepCopy((CFAllocatorRef)*MEMORY[0x189604DB0], DeepCopy, 2uLL);
    }
    v3 = -[HIDAnalyticsEvent initWithAttributes:description:]( objc_alloc(&OBJC_CLASS___HIDAnalyticsEvent),  "initWithAttributes:description:",  v4,  DeepCopy);
  }

  else
  {
    DeepCopy = 0LL;
  }

  v5 = v3;

  return v5;
}

void HIDAnalyticsEventAddHistogramField(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = v7;
    [a1 addHistogramFieldWithSegments:v7 segments:a3 count:a4];
    v7 = v8;
  }
}

void HIDAnalyticsEventAddField(void *a1, uint64_t a2)
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    [a1 addField:v3];
    v3 = v4;
  }
}

uint64_t HIDAnalyticsEventSetIntegerValueForField(void *a1, const char *a2, uint64_t a3)
{
  return [a1 setIntegerValue:a3 forField:a2];
}

uint64_t HIDAnalyticsEventSetStringValueForField(void *a1, const char *a2, uint64_t a3)
{
  return [a1 setStringValue:a3 forField:a2];
}

HIDAnalyticsHistogramEvent *HIDAnalyticsHistogramEventCreate( uint64_t a1, void *DeepCopy, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [NSString stringWithString:a3];
  v11 = (void *)v10;
  if (v9) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    v14 = 0LL;
    DeepCopy = 0LL;
  }

  else
  {
    if (DeepCopy) {
      DeepCopy = (void *)CFPropertyListCreateDeepCopy((CFAllocatorRef)*MEMORY[0x189604DB0], DeepCopy, 2uLL);
    }
    v13 = -[HIDAnalyticsHistogramEvent initWithAttributes:description:]( objc_alloc(&OBJC_CLASS___HIDAnalyticsHistogramEvent),  "initWithAttributes:description:",  v9,  DeepCopy);
    v14 = v13;
    if (v13) {
      -[HIDAnalyticsHistogramEvent addHistogramFieldWithSegments:segments:count:]( v13,  "addHistogramFieldWithSegments:segments:count:",  v11,  a4,  a5);
    }
  }

  v15 = v14;

  return v15;
}

uint64_t HIDAnalyticsHistogramEventSetIntegerValue(void *a1, const char *a2)
{
  return [a1 setIntegerValue:a2];
}

LABEL_9:
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___HIDAnalyticsHistogramEventField;
  -[HIDAnalyticsHistogramEventField dealloc](&v6, sel_dealloc);
}
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x18960DAA0]();
}

CFPropertyListRef CFPropertyListCreateDeepCopy( CFAllocatorRef allocator, CFPropertyListRef propertyList, CFOptionFlags mutabilityOption)
{
  return (CFPropertyListRef)MEMORY[0x189602FD8](allocator, propertyList, mutabilityOption);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class( dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1895FAD78](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD80](label, attr);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create( dispatch_source_type_t type, uintptr_t handle, unint64_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1895FAE50](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer( dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1895FAEE8](when, delta);
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1896165C0]();
}

void objc_autoreleasePoolPop(void *context)
{
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1896165E8]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1896165F0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x189616600]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1896166C8](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1896166D8](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x189616700](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616728](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x189616730]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x189616738]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x189616818](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x189616828](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}