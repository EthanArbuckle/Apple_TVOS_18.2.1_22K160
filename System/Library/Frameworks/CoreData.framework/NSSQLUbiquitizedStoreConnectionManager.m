@interface NSSQLUbiquitizedStoreConnectionManager
- (BOOL)handleStoreRequest:(id)a3;
- (NSSQLUbiquitizedStoreConnectionManager)initWithSQLCore:(id)a3 priority:(unint64_t)a4 seedConnection:(id)a5;
- (void)dealloc;
- (void)disconnectAllConnections;
- (void)scheduleBarrierBlock:(id)a3;
- (void)scheduleConnectionsBarrier:(id)a3;
- (void)setExclusiveLockingMode:(BOOL)a3;
@end

@implementation NSSQLUbiquitizedStoreConnectionManager

- (NSSQLUbiquitizedStoreConnectionManager)initWithSQLCore:(id)a3 priority:(unint64_t)a4 seedConnection:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NSSQLUbiquitizedStoreConnectionManager;
  v7 = -[NSSQLConnectionManager initWithSQLCore:priority:seedConnection:]( &v10,  sel_initWithSQLCore_priority_seedConnection_,  a3,  a4);
  if (v7)
  {
    if (a5) {
      v8 = (NSSQLiteConnection *)a5;
    }
    else {
      v8 = -[NSSQLiteConnection initForSQLCore:](objc_alloc(&OBJC_CLASS___NSSQLiteConnection), "initForSQLCore:", a3);
    }
    v7->_connection = v8;
  }

  return v7;
}

- (void)dealloc
{
  self->_connection = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSSQLUbiquitizedStoreConnectionManager;
  -[NSSQLConnectionManager dealloc](&v3, sel_dealloc);
}

- (void)disconnectAllConnections
{
  connection = self->_connection;
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __66__NSSQLUbiquitizedStoreConnectionManager_disconnectAllConnections__block_invoke;
  v3[3] = &unk_189EA7758;
  v3[4] = self;
  -[NSSQLiteConnection performAndWait:]((uint64_t)connection, (uint64_t)v3);
}

void __66__NSSQLUbiquitizedStoreConnectionManager_disconnectAllConnections__block_invoke(uint64_t a1)
{
}

- (void)setExclusiveLockingMode:(BOOL)a3
{
  connection = self->_connection;
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __66__NSSQLUbiquitizedStoreConnectionManager_setExclusiveLockingMode___block_invoke;
  v4[3] = &unk_189EA8728;
  v4[4] = self;
  BOOL v5 = a3;
  -[NSSQLiteConnection performAndWait:]((uint64_t)connection, (uint64_t)v4);
}

uint64_t __66__NSSQLUbiquitizedStoreConnectionManager_setExclusiveLockingMode___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) setExclusiveLockingMode:*(unsigned __int8 *)(a1 + 40)];
}

- (BOOL)handleStoreRequest:(id)a3
{
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  uint64_t v11 = 0LL;
  v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  context = (NSSQLiteConnection *)dispatch_get_context(current_queue);
  connection = self->_connection;
  if (context == connection)
  {
    -[NSSQLiteConnection connect]((uint64_t)context);
    char v8 = [a3 executeRequestUsingConnection:self->_connection];
    *((_BYTE *)v12 + 24) = v8;
  }

  else
  {
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __61__NSSQLUbiquitizedStoreConnectionManager_handleStoreRequest___block_invoke;
    v10[3] = &unk_189EA8358;
    v10[5] = a3;
    v10[6] = &v11;
    v10[4] = self;
    -[NSSQLiteConnection performAndWait:]((uint64_t)connection, (uint64_t)v10);
    char v8 = *((_BYTE *)v12 + 24) != 0;
  }

  _Block_object_dispose(&v11, 8);
  return v8;
}

uint64_t __61__NSSQLUbiquitizedStoreConnectionManager_handleStoreRequest___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 40) executeRequestUsingConnection:*(void *)(*(void *)(a1 + 32) + 24)];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = result;
  return result;
}

- (void)scheduleBarrierBlock:(id)a3
{
  connection = self->_connection;
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __63__NSSQLUbiquitizedStoreConnectionManager_scheduleBarrierBlock___block_invoke;
  v4[3] = &unk_189EAA1F0;
  v4[4] = a3;
  -[NSSQLiteConnection performAndWait:]((uint64_t)connection, (uint64_t)v4);
}

uint64_t __63__NSSQLUbiquitizedStoreConnectionManager_scheduleBarrierBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)scheduleConnectionsBarrier:(id)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __69__NSSQLUbiquitizedStoreConnectionManager_scheduleConnectionsBarrier___block_invoke;
  v3[3] = &unk_189EA8A98;
  v3[4] = self;
  void v3[5] = a3;
  -[NSSQLUbiquitizedStoreConnectionManager scheduleBarrierBlock:](self, "scheduleBarrierBlock:", v3);
}

uint64_t __69__NSSQLUbiquitizedStoreConnectionManager_scheduleConnectionsBarrier___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(*(void *)(a1 + 32) + 24LL));
}

@end