@interface __CFPrefsWeakObservers
- (__CFPrefsWeakObservers)init;
- (id)debugDescription;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)approximateCount;
- (unint64_t)borrowObjects:(id *)a3 count:(unint64_t)a4;
- (unsigned)addObject:(id)a3;
- (unsigned)removeObject:(id)a3;
- (void)dealloc;
@end

@implementation __CFPrefsWeakObservers

- (__CFPrefsWeakObservers)init
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS_____CFPrefsWeakObservers;
  result = -[__CFPrefsWeakObservers init](&v3, sel_init);
  if (result)
  {
    result->values.slot = 0LL;
    result->values.var0 = 0LL;
    result->count = 0LL;
  }

  return result;
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  objc_storeWeak((id *)&self->values.slot, 0LL);
  var0 = self->values.var0;
  if (var0)
  {
    do
    {
      uint64_t v4 = var0->var0;
      objc_destroyWeak((id *)&var0->slot);
      free(var0);
      var0 = v4;
    }

    while (v4);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS_____CFPrefsWeakObservers;
  -[__CFPrefsWeakObservers dealloc](&v5, sel_dealloc);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v6[5] = *MEMORY[0x1895F89C0];
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS_____CFPrefsWeakObservers);
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __46____CFPrefsWeakObservers_mutableCopyWithZone___block_invoke;
  v6[3] = &unk_18999B518;
  v6[4] = v4;
  visit((uint64_t)self, 2, (uint64_t)v6);
  return v4;
}

- (unsigned)addObject:(id)a3
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (!a3) {
    -[__CFPrefsWeakObservers addObject:].cold.1();
  }
  uint64_t v10 = 0LL;
  v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  char v13 = 0;
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __36____CFPrefsWeakObservers_addObject___block_invoke;
  v9[3] = &unk_18999B540;
  v9[4] = a3;
  v9[5] = &v10;
  objc_super v5 = (id *)visit((uint64_t)self, 0, (uint64_t)v9);
  int v6 = *((unsigned __int8 *)v11 + 24);
  if (!*((_BYTE *)v11 + 24))
  {
    objc_storeWeak(v5, a3);
    ++self->count;
    int v6 = *((unsigned __int8 *)v11 + 24);
  }

  unsigned __int8 v7 = v6 == 0;
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (unsigned)removeObject:(id)a3
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (!a3) {
    -[__CFPrefsWeakObservers removeObject:].cold.1();
  }
  uint64_t v6 = 0LL;
  unsigned __int8 v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __39____CFPrefsWeakObservers_removeObject___block_invoke;
  v5[3] = &unk_18999B540;
  v5[4] = a3;
  v5[5] = &v6;
  visit((uint64_t)self, 1, (uint64_t)v5);
  if (*((_BYTE *)v7 + 24)) {
    --self->count;
  }
  _Block_object_dispose(&v6, 8);
  return 1;
}

- (unint64_t)borrowObjects:(id *)a3 count:(unint64_t)a4
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  uint64_t v10 = 0LL;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __46____CFPrefsWeakObservers_borrowObjects_count___block_invoke;
  v6[3] = &unk_18999B568;
  v6[4] = &v7;
  v6[5] = a4;
  void v6[6] = a3;
  visit((uint64_t)self, 2, (uint64_t)v6);
  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (unint64_t)approximateCount
{
  return self->count;
}

- (id)debugDescription
{
  v5[5] = *MEMORY[0x1895F89C0];
  CFMutableStringRef Mutable = CFStringCreateMutable(0LL, 1024LL);
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __42____CFPrefsWeakObservers_debugDescription__block_invoke;
  v5[3] = &__block_descriptor_40_e15_v32__0__8_16_24l;
  v5[4] = Mutable;
  visit((uint64_t)self, 2, (uint64_t)v5);
  return Mutable;
}

- (void)addObject:.cold.1()
{
  qword_18C539A70 = (uint64_t)"invalid NULL observer";
  __break(1u);
}

- (void)removeObject:.cold.1()
{
  qword_18C539A70 = (uint64_t)"invalid NULL observer";
  __break(1u);
}

@end