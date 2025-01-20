@interface NSSQLConnectionManager
- (BOOL)handleStoreRequest:(id)a3;
- (NSSQLConnectionManager)initWithSQLCore:(id)a3 priority:(unint64_t)a4 seedConnection:(id)a5;
- (NSSQLConnectionManager)initWithSQLCore:(id)a3 seedConnection:(id)a4;
- (id)sqlCore;
- (void)dealloc;
- (void)disconnectAllConnections;
- (void)scheduleBarrierBlock:(id)a3;
- (void)scheduleConnectionsBarrier:(id)a3;
- (void)setExclusiveLockingMode:(BOOL)a3;
@end

@implementation NSSQLConnectionManager

uint64_t __66__NSSQLConnectionManager_initWithSQLCore_priority_seedConnection___block_invoke()
{
  return 1LL;
}

- (NSSQLConnectionManager)initWithSQLCore:(id)a3 seedConnection:(id)a4
{
  return -[NSSQLConnectionManager initWithSQLCore:priority:seedConnection:]( self,  "initWithSQLCore:priority:seedConnection:",  a3,  2LL,  a4);
}

- (NSSQLConnectionManager)initWithSQLCore:(id)a3 priority:(unint64_t)a4 seedConnection:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NSSQLConnectionManager;
  v6 = -[NSSQLConnectionManager init](&v9, sel_init, a3, a4, a5);
  v7 = v6;
  if (v6)
  {
    v6->_sqlCore = (NSSQLCore *)a3;
    v6->_filter = (id)[&__block_literal_global_10 copy];
  }

  return v7;
}

- (void)dealloc
{
  self->_sqlCore = 0LL;
  self->_filter = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSSQLConnectionManager;
  -[NSSQLConnectionManager dealloc](&v3, sel_dealloc);
}

- (id)sqlCore
{
  return self->_sqlCore;
}

- (void)disconnectAllConnections
{
}

- (void)setExclusiveLockingMode:(BOOL)a3
{
}

- (BOOL)handleStoreRequest:(id)a3
{
  return 0;
}

- (void)scheduleBarrierBlock:(id)a3
{
}

- (void)scheduleConnectionsBarrier:(id)a3
{
}

@end