@interface TVIOServiceNotifier
- (TVIOServiceNotifier)initWithRegID:(unint64_t)a3 ioNotification:(unsigned int)a4;
- (unint64_t)regID;
- (unsigned)ioNotification;
- (void)dealloc;
@end

@implementation TVIOServiceNotifier

- (TVIOServiceNotifier)initWithRegID:(unint64_t)a3 ioNotification:(unsigned int)a4
{
  SEL v8 = a2;
  unint64_t v7 = a3;
  io_object_t v6 = a4;
  id v9 = 0LL;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVIOServiceNotifier;
  id v9 = -[TVIOServiceNotifier init](&v5, "init");
  objc_storeStrong(&v9, v9);
  if (v9)
  {
    *((void *)v9 + 2) = v7;
    if (!v6 || (*((_DWORD *)v9 + 2) = v6, IOObjectRetain(v6))) {
      v10 = 0LL;
    }
    else {
      v10 = (TVIOServiceNotifier *)v9;
    }
  }

  else
  {
    v10 = (TVIOServiceNotifier *)0LL;
  }

  objc_storeStrong(&v9, 0LL);
  return v10;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  if (self->_ioNotification)
  {
    IOObjectRelease(v4->_ioNotification);
    v4->_ioNotification = 0;
  }

  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVIOServiceNotifier;
  -[TVIOServiceNotifier dealloc](&v2, "dealloc");
}

- (unint64_t)regID
{
  return self->_regID;
}

- (unsigned)ioNotification
{
  return self->_ioNotification;
}

@end