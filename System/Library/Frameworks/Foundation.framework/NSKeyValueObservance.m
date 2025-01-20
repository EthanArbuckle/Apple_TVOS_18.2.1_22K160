@interface NSKeyValueObservance
- (BOOL)isEqual:(id)a3;
- (id)_initWithObserver:(id)a3 property:(id)a4 options:(unint64_t)a5 context:(void *)a6 originalObservable:(id)a7;
- (id)description;
- (id)retainedObserver;
- (unint64_t)hash;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation NSKeyValueObservance

- (id)_initWithObserver:(id)a3 property:(id)a4 options:(unint64_t)a5 context:(void *)a6 originalObservable:(id)a7
{
  char v9 = a5;
  uint64_t v22 = *MEMORY[0x1895F89C0];
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___NSKeyValueObservance;
  v12 = -[NSKeyValueObservance init](&v21, sel_init);
  v13 = v12;
  if (v12)
  {
    id inited = objc_initWeakOrNil((id *)&v12->_observer, a3);
    char v15 = *((_BYTE *)v13 + 40);
    if (inited)
    {
      char v16 = v15 | 0x10;
    }

    else
    {
      char v16 = v15 & 0xEF;
      v13->_observer = a3;
    }

    *((_BYTE *)v13 + 40) = v16 & 0xF0 | v9 & 0xB;
    v13->_property = (NSKeyValueProperty *)a4;
    v13->_context = a6;
    Class = (__objc2_class *)object_getClass(a3);
    if (Class == &OBJC_CLASS___NSKeyValueObservance
      || _NSKVONotifyingOriginalClassForIsa((objc_class *)Class) == (objc_class *)&OBJC_CLASS___NSKeyValueObservance)
    {
      *((_BYTE *)v13 + 40) |= 0x20u;
      if (!a7) {
        __assert_rtn( "-[NSKeyValueObservance _initWithObserver:property:options:context:originalObservable:]",  "NSKeyValueObservationInfo.m",  360,  "inOriginalObservableOrNil");
      }
    }

    else
    {
      *((_BYTE *)v13 + 40) &= ~0x20u;
      a7 = a3;
    }

    v13->_originalObservableOrUnownedObserver.originalObservable = a7;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      char v18 = 0;
    }
    else {
      char v18 = 64;
    }
    *((_BYTE *)v13 + 40) = *((_BYTE *)v13 + 40) & 0xBF | v18;
    if ((objc_opt_respondsToSelector() & 1) != 0) {
      char v19 = 0x80;
    }
    else {
      char v19 = 0;
    }
    *((_BYTE *)v13 + 40) = v19 & 0x80 | *((_BYTE *)v13 + 40) & 0x7F;
  }

  return v13;
}

- (id)retainedObserver
{
  if (result)
  {
    v1 = result + 1;
    result = (id *)objc_loadWeakRetained(result + 1);
    if (!result)
    {
      if (_NSKVOIsObservableBeingDeallocated(*v1))
      {
        id v2 = *v1;
        return (id *)*v1;
      }

      else
      {
        return 0LL;
      }
    }
  }

  return result;
}

- (unint64_t)hash
{
  unint64_t v2 = self;
  LODWORD(self) = 0;
  uint64_t v13 = *MEMORY[0x1895F89C0];
  __int128 v10 = *(_OWORD *)(v2 + 8);
  uint64_t v11 = *(_BYTE *)(v2 + 40) & 0xF;
  __int128 v12 = *(_OWORD *)(v2 + 24);
  v3 = (unsigned __int8 *)&v10 + 3;
  for (unint64_t i = 44LL; i > 7; i -= 4LL)
  {
    unsigned int v5 = *(v3 - 3) + 16 * self;
    unsigned int v6 = *(v3 - 2) + 16 * (v5 ^ (16 * (v5 >> 28)));
    unsigned int v7 = *(v3 - 1) + 16 * (v6 ^ (16 * (v6 >> 28)));
    int v8 = *v3;
    v3 += 4;
    int v9 = v8 + 16 * (v7 ^ (16 * (v7 >> 28)));
    self = (v9 ^ ((v9 & 0xF0000000) >> 24)) & ~(v9 & 0xF0000000);
  }

  return self;
}

- (BOOL)isEqual:(id)a3
{
  return self->_observer == *((void *)a3 + 1)
      && self->_property == (NSKeyValueProperty *)*((void *)a3 + 2)
      && ((*((_BYTE *)a3 + 40) ^ *((_BYTE *)self + 40)) & 0xF) == 0
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  observer = self->_observer;
  id v5 = -[NSKeyValueProperty keyPath](self->_property, "keyPath");
  if ((*((_BYTE *)self + 40) & 1) != 0) {
    unsigned int v6 = @"YES";
  }
  else {
    unsigned int v6 = @"NO";
  }
  if ((*((_BYTE *)self + 40) & 2) != 0) {
    unsigned int v7 = @"YES";
  }
  else {
    unsigned int v7 = @"NO";
  }
  if ((*((_BYTE *)self + 40) & 8) != 0) {
    int v8 = @"YES";
  }
  else {
    int v8 = @"NO";
  }
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ %p: Observer: %p, Key path: %@, Options: <New: %@, Old: %@, Prior: %@> Context: %p, Property: %p>",  v3,  self,  observer,  v5,  v6,  v7,  v8,  self->_context,  self->_property);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7 = a5;
  uint64_t v19 = *MEMORY[0x1895F89C0];
  uint64_t v9 = objc_msgSend(a5, "objectForKey:", 0x189CB26A8, a4);
  if (v9)
  {
    __int128 v10 = (void *)v9;
    if (a6)
    {
      uint64_t v11 = [a6 dependentValueKeyOrKeysIsASet:&v18];
      int v12 = objc_msgSend((id)objc_msgSend(v7, "objectForKey:", @"notificationIsPrior"), "BOOLValue");
      BOOL v13 = v18 != 0;
      if (v12) {
        NSKeyValueWillChangeWithPerThreadPendingNotifications( v10,  v11,  v13,  (void (*)(__int128 *__return_ptr, uint64_t, uint64_t, void, void, uint64_t, char *))NSKeyValueWillChangeBySetting,  0LL,  (uint64_t)self);
      }
      else {
        NSKeyValueDidChangeWithPerThreadPendingNotifications( v10,  v11,  v13,  (void (*)(__int128 *__return_ptr, uint64_t, uint64_t, uint64_t, BOOL, uint64_t, _OWORD *))NSKeyValueDidChangeBySetting,  (uint64_t)self);
      }
    }

    else
    {
      v17 = -[NSKeyValueObservance retainedObserver]((id *)&self->super.isa);
      if (v17)
      {
        if (self && (*((_BYTE *)self + 40) & 0x20) != 0) {
          originalObservable = self->_originalObservableOrUnownedObserver.originalObservable;
        }
        else {
          originalObservable = 0LL;
        }
        Class = (__objc2_class *)object_getClass(v7);
        if (Class == &OBJC_CLASS___NSKeyValueChangeDictionary)
        {
          [v7 setOriginalObservable:originalObservable];
        }

        else
        {
          char v16 = (void *)[v7 mutableCopy];
          id v7 = v16;
          if (originalObservable) {
            [v16 setObject:originalObservable forKey:0x189CB26A8];
          }
          else {
            [v16 removeObjectForKey:0x189CB26A8];
          }
        }

        NSKVONotify( v17,  (uint64_t)-[NSKeyValueProperty keyPath](self->_property, "keyPath"),  (uint64_t)v10,  (uint64_t)v7,  (uint64_t)self->_context);
        if (Class != &OBJC_CLASS___NSKeyValueChangeDictionary) {
      }
        }
    }
  }

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  if ((*((_BYTE *)self + 40) & 0x10) != 0) {
    objc_destroyWeak((id *)&self->_observer);
  }
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSKeyValueObservance;
  -[NSKeyValueObservance dealloc](&v3, sel_dealloc);
}

@end