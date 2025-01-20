@interface RBCoalition
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (RBCoalition)initWithCoalitionID:(unint64_t)a3;
- (double)creationTime;
- (double)lastModificationTime;
- (id)debugDescription;
- (unint64_t)coalitionID;
- (unint64_t)coalitionLevel;
- (unint64_t)hash;
- (unint64_t)previousCoalitionLevel;
- (void)enumerateProcessesUsingBlock:(id)a3;
- (void)removeProcess:(id)a3;
- (void)setCoalitionLevel:(unint64_t)a3;
- (void)setProcess:(id)a3 withState:(id)a4;
@end

@implementation RBCoalition

- (RBCoalition)initWithCoalitionID:(unint64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___RBCoalition;
  v4 = -[RBCoalition init](&v12, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_coalitionID = a3;
    v4->_level = 0LL;
    v6 = objc_alloc_init(&OBJC_CLASS___RBProcessMap);
    processes = v5->_processes;
    v5->_processes = v6;

    v8 = objc_alloc_init(&OBJC_CLASS___RBProcessMap);
    processStates = v5->_processStates;
    v5->_processStates = v8;

    v5->_previousCoalitionLevel = 0LL;
    [MEMORY[0x189603F50] timeIntervalSinceReferenceDate];
    v5->_creationTime = v10;
    v5->_lastModificationTime = v10;
  }

  return v5;
}

- (unint64_t)coalitionLevel
{
  return self->_level;
}

- (void)setCoalitionLevel:(unint64_t)a3
{
  self->_previousCoalitionLevel = self->_level;
  self->_level = a3;
  [MEMORY[0x189603F50] timeIntervalSinceReferenceDate];
  self->_lastModificationTime = v4;
}

- (void)setProcess:(id)a3 withState:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  [v10 identity];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = -[RBProcessMap setValue:forIdentity:](self->_processes, "setValue:forIdentity:", v10, v7);
  if (v6) {
    id v9 = -[RBProcessMap setValue:forIdentity:](self->_processStates, "setValue:forIdentity:", v6, v7);
  }
}

- (void)removeProcess:(id)a3
{
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = -[RBProcessMap removeValueForIdentity:](self->_processes, "removeValueForIdentity:", v6);
  id v5 = -[RBProcessMap removeValueForIdentity:](self->_processStates, "removeValueForIdentity:", v6);
}

- (void)enumerateProcessesUsingBlock:(id)a3
{
  id v4 = a3;
  processes = self->_processes;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __44__RBCoalition_enumerateProcessesUsingBlock___block_invoke;
  v7[3] = &unk_18A256298;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  -[RBProcessMap enumerateWithBlock:](processes, "enumerateWithBlock:", v7);
}

void __44__RBCoalition_enumerateProcessesUsingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(*(void *)(a1 + 32) + 24LL);
  id v6 = a3;
  [v5 valueForIdentity:a2];
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

- (BOOL)isEmpty
{
  return -[RBProcessMap count](self->_processes, "count") == 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RBCoalition *)a3;
  id v5 = v4;
  if (self == v4) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v4
  }
      && (uint64_t v6 = objc_opt_class(), v6 == objc_opt_class())
      && -[RBCoalition coalitionID](v5, "coalitionID") == self->_coalitionID;

  return v7;
}

- (unint64_t)hash
{
  return self->_coalitionID;
}

- (id)debugDescription
{
  id v3 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = (void *)[v3 initWithFormat:@"<%@| coalitionID:%llu coalitionLevel:%llu previousCoalitionLevel:%llu creationTime:%f lastModificationTime:%f>", v4, self->_coalitionID, self->_level, self->_previousCoalitionLevel, *(void *)&self->_creationTime, *(void *)&self->_lastModificationTime];

  return v5;
}

- (unint64_t)coalitionID
{
  return self->_coalitionID;
}

- (unint64_t)previousCoalitionLevel
{
  return self->_previousCoalitionLevel;
}

- (double)creationTime
{
  return self->_creationTime;
}

- (double)lastModificationTime
{
  return self->_lastModificationTime;
}

- (void).cxx_destruct
{
}

@end