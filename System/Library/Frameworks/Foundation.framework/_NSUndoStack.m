@interface _NSUndoStack
- (BOOL)isDiscardable;
- (BOOL)popAndInvoke;
- (_NSUndoStack)init;
- (id)_beginMark;
- (id)description;
- (id)groupIdentifier;
- (id)popUndoObject;
- (id)topUndoObject;
- (id)userInfo;
- (unint64_t)count;
- (unint64_t)max;
- (unint64_t)nestingLevel;
- (unint64_t)topLevelGroupCount;
- (void)_removeBottom;
- (void)dealloc;
- (void)markBegin;
- (void)markEnd;
- (void)push:(id)a3;
- (void)removeAllObjects;
- (void)removeAllObjectsWithTarget:(id)a3;
- (void)removeObject:(id)a3;
- (void)setDiscardable:(BOOL)a3;
- (void)setGroupIdentifier:(id)a3;
- (void)setMax:(unint64_t)max;
- (void)setUserInfo:(id)a3;
@end

@implementation _NSUndoStack

- (void)_removeBottom
{
  previous = self->_head->previous;
  if (-[_NSUndoObject isBeginMark](previous, "isBeginMark"))
  {
    uint64_t v4 = 0LL;
    do
    {
      if (-[_NSUndoObject isBeginMark](previous, "isBeginMark")) {
        uint64_t v5 = 1LL;
      }
      else {
        uint64_t v5 = -[_NSUndoObject isEndMark](previous, "isEndMark") << 63 >> 63;
      }
      v4 += v5;
      previous = previous->previous;
    }

    while (v4);
    self->_head->previous = previous;
    self->_head->previous->next = 0LL;
    --self->_count;
  }

  else
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"Error while removing bottom of undo stack." userInfo:0]);
    -[_NSUndoStack init](v6, v7);
  }

- (_NSUndoStack)init
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSUndoStack;
  result = -[_NSUndoStack init](&v3, sel_init);
  result->_head = 0LL;
  result->_max = 0LL;
  result->_count = 0LL;
  return result;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  while (self->_head)
    -[_NSUndoStack popUndoObject](self, "popUndoObject");
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSUndoStack;
  -[_NSUndoStack dealloc](&v3, sel_dealloc);
}

- (unint64_t)max
{
  return self->_max;
}

- (unint64_t)count
{
  return self->_count;
}

- (unint64_t)topLevelGroupCount
{
  head = self->_head;
  if (head)
  {
    unint64_t v3 = 0LL;
    uint64_t v4 = 0LL;
    while (1)
    {
      if (-[_NSUndoObject isEndMark](head, "isEndMark"))
      {
        if (!v4)
        {
          ++v3;
          uint64_t v4 = -1LL;
          goto LABEL_7;
        }

        --v4;
      }

      v4 += -[_NSUndoObject isBeginMark](head, "isBeginMark");
LABEL_7:
      head = head->next;
      if (!head) {
        return v3;
      }
    }
  }

  return 0LL;
}

- (void)setMax:(unint64_t)max
{
  for (self->_max = max; max; max = self->_max)
  {
    if (self->_count <= max) {
      break;
    }
    -[_NSUndoStack _removeBottom](self, "_removeBottom");
  }

- (void)push:(id)a3
{
  *((void *)a3 + 1) = self->_head;
  head = self->_head;
  id previous = a3;
  if (head) {
    id previous = head->previous;
  }
  *((void *)a3 + 2) = previous;
  v8 = self->_head;
  if (v8) {
    v8->id previous = (_NSUndoObject *)a3;
  }
  self->_head = (_NSUndoObject *)a3;
  if ([a3 isEndMark])
  {
    unint64_t nestingLevel = self->_nestingLevel;
    if (nestingLevel)
    {
      unint64_t v10 = nestingLevel - 1;
      self->_unint64_t nestingLevel = v10;
      if (!v10)
      {
        unint64_t max = self->_max;
        if (max)
        {
          if (self->_count > max) {
            -[_NSUndoStack _removeBottom](self, "_removeBottom");
          }
        }
      }
    }

    else
    {
      v13 = NSStringFromSelector(a2);
      v14 = (objc_class *)objc_opt_class();
      v15 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@ -- %@ %p pushing more ends than begins onto stack", v13, NSStringFromClass(v14), self), 0 reason userInfo];
      objc_exception_throw(v15);
      -[_NSUndoStack popUndoObject](v16, v17);
    }
  }

  else if ([a3 isBeginMark])
  {
    unint64_t v12 = self->_nestingLevel;
    if (!v12) {
      ++self->_count;
    }
    self->_unint64_t nestingLevel = v12 + 1;
  }

- (id)popUndoObject
{
  head = self->_head;
  if (!head) {
    return 0LL;
  }
  next = head->next;
  self->_head = next;
  if (next) {
    next->id previous = head->previous;
  }
  if (!-[_NSUndoObject isBeginMark](head, "isBeginMark"))
  {
    if (-[_NSUndoObject isEndMark](head, "isEndMark"))
    {
      uint64_t v8 = 1LL;
      uint64_t v9 = 3LL;
      goto LABEL_11;
    }

    return head;
  }

  unint64_t nestingLevel = self->_nestingLevel;
  if (nestingLevel)
  {
    unint64_t v7 = nestingLevel - 1;
    self->_unint64_t nestingLevel = v7;
    if (!v7)
    {
      uint64_t v8 = -1LL;
      uint64_t v9 = 2LL;
LABEL_11:
      (&self->super.isa)[v9] = (Class)((char *)(&self->super.isa)[v9] + v8);
      return head;
    }

    return head;
  }

  v11 = NSStringFromSelector(a2);
  unint64_t v12 = (objc_class *)objc_opt_class();
  v13 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@ -- %@ %p popping more begins than ends from stack", v11, NSStringFromClass(v12), self), 0 reason userInfo];
  objc_exception_throw(v13);
  return -[_NSUndoStack _beginMark](v14, v15);
}

- (id)_beginMark
{
  head = self->_head;
  if (head)
  {
    unint64_t nestingLevel = self->_nestingLevel;
    do
    {
      nestingLevel += -[_NSUndoObject isEndMark](head, "isEndMark");
      if (-[_NSUndoObject isBeginMark](head, "isBeginMark"))
      {
        if (nestingLevel)
        {
          if (!--nestingLevel) {
            break;
          }
        }
      }

      head = head->next;
    }

    while (head);
  }

  return head;
}

- (void)setGroupIdentifier:(id)a3
{
  id v6 = -[_NSUndoStack _beginMark](self, "_beginMark");
  if (v6)
  {
    [v6 setGroupIdentifier:a3];
  }

  else
  {
    unint64_t v7 = NSStringFromSelector(a2);
    uint64_t v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: %@ %p is in invalid state, calling setGroupIdentifier with no begin group mark\n", v7, NSStringFromClass(v8), self), 0 reason userInfo];
    objc_exception_throw(v9);
    -[_NSUndoStack groupIdentifier](v10, v11);
  }

- (id)groupIdentifier
{
  id result = -[_NSUndoStack _beginMark](self, "_beginMark");
  if (result) {
    return (id)[result groupIdentifier];
  }
  return result;
}

- (id)topUndoObject
{
  return self->_head;
}

- (void)markBegin
{
}

- (void)markEnd
{
}

- (BOOL)isDiscardable
{
  id v2 = -[_NSUndoStack _beginMark](self, "_beginMark");
  if (v2) {
    LOBYTE(v2) = [v2 isDiscardable];
  }
  return (char)v2;
}

- (void)setDiscardable:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = -[_NSUndoStack _beginMark](self, "_beginMark");
  if (v6)
  {
    [v6 setDiscardable:v3];
  }

  else
  {
    unint64_t v7 = NSStringFromSelector(a2);
    uint64_t v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: %@ %p is in invalid state, calling setDiscardable with no begin group mark\n", v7, NSStringFromClass(v8), self), 0 reason userInfo];
    objc_exception_throw(v9);
    -[_NSUndoStack userInfo](v10, v11);
  }

- (id)userInfo
{
  id result = -[_NSUndoStack _beginMark](self, "_beginMark");
  if (result) {
    return (id)[result userInfo];
  }
  return result;
}

- (void)setUserInfo:(id)a3
{
  id v6 = -[_NSUndoStack _beginMark](self, "_beginMark");
  if (v6)
  {
    [v6 setUserInfo:a3];
  }

  else
  {
    unint64_t v7 = NSStringFromSelector(a2);
    uint64_t v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: %@ %p is in invalid state, calling setUserInfo with no begin group mark\n", v7, NSStringFromClass(v8), self), 0 reason userInfo];
    objc_exception_throw(v9);
    -[_NSUndoStack popAndInvoke](v10, v11);
  }

- (BOOL)popAndInvoke
{
  head = self->_head;
  if (!head) {
    goto LABEL_4;
  }
  if (-[_NSUndoObject isEndMark](head, "isEndMark"))
  {
    head = self->_head;
LABEL_4:
    uint64_t v5 = 0LL;
    BOOL v6 = 0;
    while (!-[_NSUndoObject isBeginMark](head, "isBeginMark"))
    {
      if (-[_NSUndoObject isEndMark](self->_head, "isEndMark"))
      {
        ++v5;
        goto LABEL_9;
      }

      objc_msgSend(-[_NSUndoStack popUndoObject](self, "popUndoObject"), "invoke");
      BOOL v6 = 1;
LABEL_11:
      head = self->_head;
      if (!head || !v5) {
        return v6;
      }
    }

    --v5;
LABEL_9:
    -[_NSUndoStack popUndoObject](self, "popUndoObject");
    goto LABEL_11;
  }

  uint64_t v8 = NSStringFromSelector(a2);
  uint64_t v9 = (objc_class *)objc_opt_class();
  unint64_t v10 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: %@ %p is in invalid state, call endUndoGrouping on undo manager before calling this method\n", v8, NSStringFromClass(v9), self), 0 reason userInfo];
  objc_exception_throw(v10);
  return -[_NSUndoStack nestingLevel](v11, v12);
}

- (unint64_t)nestingLevel
{
  return self->_nestingLevel;
}

- (void)removeAllObjects
{
  for (i = self->_head; i; i = self->_head)
  {
    self->_head = i->next;
  }

  self->_count = 0LL;
  self->_unint64_t nestingLevel = 0LL;
}

- (void)removeAllObjectsWithTarget:(id)a3
{
  head = self->_head;
  if (head)
  {
    BOOL v6 = 0LL;
    int v7 = 0;
    unint64_t nestingLevel = self->_nestingLevel;
    while (1)
    {
      BOOL v9 = -[_NSUndoObject isEndMark](head, "isEndMark");
      unint64_t v10 = nestingLevel + v9;
      int v11 = v9 | v7;
      BOOL v12 = -[_NSUndoObject isBeginMark](head, "isBeginMark");
      unint64_t nestingLevel = (v12 & v11) != 0 ? v10 - 1 : v10;
      int v7 = (v12 & v11 ^ 1 | (v10 != 1)) & v11;
      if (-[_NSUndoObject target](head, "target") == a3
        && !-[_NSUndoObject isBeginMark](head, "isBeginMark")
        && !-[_NSUndoObject isEndMark](head, "isEndMark"))
      {
        break;
      }

      next = head->next;
LABEL_10:
      BOOL v6 = head;
      head = next;
      if (!next) {
        return;
      }
    }

    next = head->next;
    -[_NSUndoStack removeObject:](self, "removeObject:", head);
    if (next && !-[_NSUndoObject isBeginMark](next, "isBeginMark")
      || v6 && !-[_NSUndoObject isEndMark](v6, "isEndMark"))
    {
      head = v6;
      goto LABEL_10;
    }

    head = v6;
    while (1)
    {
      if (!head) {
        goto LABEL_21;
      }
      id previous = head->previous;
      -[_NSUndoStack removeObject:](self, "removeObject:", head);
      if (next)
      {
        if (previous) {
          break;
        }
      }

      head = previous;
      if (!nestingLevel) {
        goto LABEL_22;
      }
LABEL_23:
      if (!-[_NSUndoObject isBeginMark](next, "isBeginMark") || !-[_NSUndoObject isEndMark](head, "isEndMark")) {
        goto LABEL_10;
      }
    }

    SEL v15 = next->next;
    -[_NSUndoStack removeObject:](self, "removeObject:", next);
    nestingLevel -= v7 & 1;
    head = previous;
    next = v15;
LABEL_21:
    if (nestingLevel) {
      goto LABEL_23;
    }
LABEL_22:
    int v7 = 0;
    --self->_count;
    goto LABEL_23;
  }

- (void)removeObject:(id)a3
{
  uint64_t v4 = *((void *)a3 + 1);
  uint64_t v3 = *((void *)a3 + 2);
  if (v4)
  {
    *(void *)(v4 + 16) = v3;
    uint64_t v5 = *((void *)a3 + 2);
    if (*(void *)(v5 + 8)) {
      *(void *)(v5 + 8) = *((void *)a3 + 1);
    }
  }

  else
  {
    *(void *)(v3 + 8) = 0LL;
    self->_head->id previous = (_NSUndoObject *)*((void *)a3 + 2);
  }

  if (self->_head == a3) {
    self->_head = (_NSUndoObject *)*((void *)a3 + 1);
  }
}

- (id)description
{
  id result = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"Stack: %p\n", self);
  head = self->_head;
  if (head)
  {
    uint64_t v5 = 0LL;
    do
    {
      uint64_t v6 = v5 + 1;
      id result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%ld: %@\n",  result,  v5,  head);
      head = head->next;
      uint64_t v5 = v6;
    }

    while (head);
  }

  return result;
}

@end