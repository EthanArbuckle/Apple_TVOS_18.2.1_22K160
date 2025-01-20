@interface CLOdometerAlarm
- (BOOL)invalid;
- (CLOdometerAlarm)init;
- (CLOdometerAlarm)initWithDistance:(double)a3 inUniverse:(id)a4 handler:(id)a5;
- (CLOdometerAlarmManagerProtocol)manager;
- (double)odometerTarget;
- (id)handler;
- (void)dealloc;
- (void)fire:(double)a3 withError:(id)a4;
- (void)invalidate;
- (void)setHandler:(id)a3;
- (void)setInvalid:(BOOL)a3;
- (void)setManager:(id)a3;
- (void)setOdometerTarget:(double)a3;
@end

@implementation CLOdometerAlarm

- (CLOdometerAlarm)init
{
  return 0LL;
}

- (CLOdometerAlarm)initWithDistance:(double)a3 inUniverse:(id)a4 handler:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CLOdometerAlarm;
  v8 = -[CLOdometerAlarm init](&v10, "init");
  if (v8)
  {
    if (objc_msgSend(objc_msgSend(a4, "vendor"), "isServiceEnabled:", @"CLOdometerAlarmManager"))
    {
      -[CLOdometerAlarm setOdometerTarget:](v8, "setOdometerTarget:", a3);
      -[CLOdometerAlarm setHandler:](v8, "setHandler:", a5);
      -[CLOdometerAlarm setManager:]( v8,  "setManager:",  objc_msgSend(objc_msgSend(a4, "vendor"), "proxyForService:", @"CLOdometerAlarmManager"));
      -[CLOdometerAlarmManagerProtocol addAlarm:](-[CLOdometerAlarm manager](v8, "manager"), "addAlarm:", v8);
    }

    else
    {

      return 0LL;
    }
  }

  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLOdometerAlarm;
  -[CLOdometerAlarm dealloc](&v3, "dealloc");
}

- (void)invalidate
{
}

- (void)fire:(double)a3 withError:(id)a4
{
  unsigned __int8 v7 = -[CLOdometerAlarm invalid](self, "invalid");
  objc_sync_exit(self);
  if ((v7 & 1) == 0)
  {
    v8 = -[CLOdometerAlarm handler](self, "handler");
    v8[2](v8, self, a4, a3);
  }

- (double)odometerTarget
{
  return self->odometerTarget;
}

- (void)setOdometerTarget:(double)a3
{
  self->odometerTarget = a3;
}

- (id)handler
{
  return self->handler;
}

- (void)setHandler:(id)a3
{
}

- (BOOL)invalid
{
  return self->invalid;
}

- (void)setInvalid:(BOOL)a3
{
  self->invalid = a3;
}

- (CLOdometerAlarmManagerProtocol)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
}

@end