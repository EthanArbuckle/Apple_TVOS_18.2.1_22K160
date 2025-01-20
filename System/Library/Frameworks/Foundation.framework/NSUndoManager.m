@interface NSUndoManager
+ (void)_endTopLevelGroupings;
+ (void)_setEndsTopLevelGroupingsAfterRunLoopIterations:(BOOL)a3;
+ (void)initialize;
- (BOOL)_endUndoGroupRemovingIfEmpty:(BOOL)a3;
- (BOOL)_shouldCoalesceTypingForText:(id)a3 :(id)a4;
- (BOOL)canRedo;
- (BOOL)canUndo;
- (BOOL)groupsByEvent;
- (BOOL)isRedoing;
- (BOOL)isUndoRegistrationEnabled;
- (BOOL)isUndoing;
- (BOOL)redoActionIsDiscardable;
- (BOOL)undoActionIsDiscardable;
- (NSArray)runLoopModes;
- (NSInteger)groupingLevel;
- (NSString)redoActionName;
- (NSString)redoMenuItemTitle;
- (NSString)redoMenuTitleForUndoActionName:(NSString *)actionName;
- (NSString)undoActionName;
- (NSString)undoMenuItemTitle;
- (NSString)undoMenuTitleForUndoActionName:(NSString *)actionName;
- (NSUInteger)levelsOfUndo;
- (NSUndoManager)init;
- (id)_methodSignatureForTargetSelector:(SEL)a3;
- (id)_undoStack;
- (id)prepareWithInvocationTarget:(id)target;
- (id)redoActionUserInfoValueForKey:(id)a3;
- (id)undoActionUserInfoValueForKey:(id)a3;
- (unint64_t)redoCount;
- (unint64_t)undoCount;
- (void)__redoCommonDoSingle:(BOOL)a3;
- (void)__redoSingle;
- (void)_cancelAutomaticTopLevelGroupEnding;
- (void)_commitUndoGrouping;
- (void)_forwardTargetInvocation:(id)a3;
- (void)_postCheckpointNotification;
- (void)_prepareEventGrouping;
- (void)_processEndOfEventNotification:(id)a3;
- (void)_registerUndoObject:(id)a3;
- (void)_rollbackUndoGrouping;
- (void)_scheduleAutomaticTopLevelGroupEnding;
- (void)_setGroupIdentifier:(id)a3;
- (void)beginUndoGrouping;
- (void)dealloc;
- (void)disableUndoRegistration;
- (void)enableUndoRegistration;
- (void)endUndoGrouping;
- (void)redo;
- (void)registerUndoWithTarget:(id)target handler:(void *)undoHandler;
- (void)registerUndoWithTarget:(id)target selector:(SEL)selector object:(id)anObject;
- (void)removeAllActions;
- (void)removeAllActionsWithTarget:(id)target;
- (void)setActionIsDiscardable:(BOOL)discardable;
- (void)setActionUserInfoValue:(id)a3 forKey:(id)a4;
- (void)setGroupsByEvent:(BOOL)groupsByEvent;
- (void)setLevelsOfUndo:(NSUInteger)levelsOfUndo;
- (void)setRunLoopModes:(NSArray *)runLoopModes;
- (void)undo;
- (void)undoNestedGroup;
@end

@implementation NSUndoManager

+ (void)initialize
{
  if (&OBJC_CLASS___NSUndoManager == a1)
  {
    uint64_t v2 = objc_msgSend( (id)objc_msgSend(MEMORY[0x189604038], "standardUserDefaults"),  "integerForKey:",  @"NSUndoManagerDefaultLevelsOfUndo");
    if (v2) {
      defaultLevelsOfUndo = v2;
    }
  }

- (NSUndoManager)init
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSUndoManager;
  uint64_t v2 = -[NSUndoManager init](&v4, sel_init);
  v2->_undoStack = -[_NSUndoStack init]( +[_NSUndoStack allocWithZone:]( &OBJC_CLASS____NSUndoStack,  "allocWithZone:",  -[NSUndoManager zone](v2, "zone")),  "init");
  v2->_redoStack = -[_NSUndoStack init]( +[_NSUndoStack allocWithZone:]( &OBJC_CLASS____NSUndoStack,  "allocWithZone:",  -[NSUndoManager zone](v2, "zone")),  "init");
  v2->_flags = 0x4000000000LL;
  v2->_target = 0LL;
  v2->_runLoopModes = (NSArray *)(id)[MEMORY[0x189603F18] arrayWithObject:*MEMORY[0x189603A40]];
  -[_NSUndoStack setMax:](v2->_undoStack, "setMax:", defaultLevelsOfUndo);
  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_5_1);
  [(id)qword_18C494A30 removeObject:self];
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_5_1);
  [self->_proxy superRelease];

  -[NSUndoManager _delayAutomaticTermination:](self, "_delayAutomaticTermination:", -1.0);
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSUndoManager;
  -[NSUndoManager dealloc](&v3, sel_dealloc);
}

- (void)_scheduleAutomaticTopLevelGroupEnding
{
  if (NSUndoManagerEndsTopLevelGroupingsAfterRunLoopIterations)
  {
    objc_msgSend( (id)objc_msgSend(MEMORY[0x189604008], "currentRunLoop"),  "performSelector:target:argument:order:modes:",  sel__processEndOfEventNotification_,  self,  0,  350000,  -[NSUndoManager runLoopModes](self, "runLoopModes"));
  }

  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_5_1);
    objc_super v3 = (NSHashTable *)qword_18C494A30;
    if (!qword_18C494A30)
    {
      objc_super v3 = -[NSHashTable initWithOptions:capacity:]( objc_alloc(&OBJC_CLASS___NSHashTable),  "initWithOptions:capacity:",  5LL,  0LL);
      qword_18C494A30 = (uint64_t)v3;
    }

    -[NSHashTable addObject:](v3, "addObject:", self);
    os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_5_1);
  }

  self->_flags |= 0x1000000000uLL;
}

- (void)_cancelAutomaticTopLevelGroupEnding
{
  if (NSUndoManagerEndsTopLevelGroupingsAfterRunLoopIterations)
  {
    objc_msgSend( (id)objc_msgSend(MEMORY[0x189604008], "currentRunLoop"),  "cancelPerformSelector:target:argument:",  sel__processEndOfEventNotification_,  self,  0);
  }

  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_5_1);
    [(id)qword_18C494A30 removeObject:self];
    os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_5_1);
  }

  self->_flags &= ~0x1000000000uLL;
}

- (void)_prepareEventGrouping
{
  unint64_t flags = self->_flags;
  if ((flags & 0x5000000000LL) == 0x4000000000LL)
  {
    BOOL v4 = (flags & 0x100000000LL) == 0;
    uint64_t v5 = 2LL;
    if (v4) {
      uint64_t v5 = 1LL;
    }
    if (!-[objc_class nestingLevel]((&self->super.isa)[v5], "nestingLevel"))
    {
      -[NSUndoManager _scheduleAutomaticTopLevelGroupEnding](self, "_scheduleAutomaticTopLevelGroupEnding");
      -[NSUndoManager beginUndoGrouping](self, "beginUndoGrouping");
    }
  }

- (void)_postCheckpointNotification
{
  unint64_t flags = self->_flags;
  if ((flags & 0x2000000000LL) == 0)
  {
    self->_unint64_t flags = flags | 0x2000000000LL;
    -[NSNotificationCenter postNotificationName:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "postNotificationName:object:",  @"NSUndoManagerCheckpointNotification",  self);
    self->_flags &= ~0x2000000000uLL;
  }

- (void)beginUndoGrouping
{
  unint64_t flags = self->_flags;
  if (!(flags >> 40))
  {
    if ((flags & 0x300000000LL) == 0)
    {
      -[NSUndoManager _prepareEventGrouping](self, "_prepareEventGrouping");
      unint64_t flags = self->_flags;
    }

    uint64_t v4 = 2LL;
    if ((flags & 0x100000000LL) == 0) {
      uint64_t v4 = 1LL;
    }
    Class v5 = (&self->super.isa)[v4];
    if ((flags & 0x4000000000LL) == 0 || -[objc_class nestingLevel]((&self->super.isa)[v4], "nestingLevel")) {
      -[NSUndoManager _postCheckpointNotification](self, "_postCheckpointNotification");
    }
    -[objc_class markBegin](v5, "markBegin");
    if ((self->_flags & 0x300000000LL) == 0) {
      -[NSNotificationCenter postNotificationName:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "postNotificationName:object:",  @"NSUndoManagerDidOpenUndoGroupNotification",  self);
    }
  }

- (NSInteger)groupingLevel
{
  uint64_t v2 = 2LL;
  if ((self->_flags & 0x100000000LL) == 0) {
    uint64_t v2 = 1LL;
  }
  return -[objc_class nestingLevel]((&self->super.isa)[v2], "nestingLevel");
}

- (BOOL)_endUndoGroupRemovingIfEmpty:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v6 = 2LL;
  if ((self->_flags & 0x100000000LL) == 0) {
    uint64_t v6 = 1LL;
  }
  Class v7 = (&self->super.isa)[v6];
  -[NSUndoManager _postCheckpointNotification](self, "_postCheckpointNotification");
  if (-[objc_class nestingLevel](v7, "nestingLevel"))
  {
    uint64_t v8 = objc_msgSend((id)-[objc_class topUndoObject](v7, "topUndoObject"), "isBeginMark");
    if ((self->_flags & 0x300000000LL) == 0)
    {
      if (v3) {
        uint64_t v9 = objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObject:forKey:",  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v8),  @"NSUndoManagerGroupIsEmpty");
      }
      else {
        uint64_t v9 = 0LL;
      }
      -[NSNotificationCenter postNotificationName:object:userInfo:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "postNotificationName:object:userInfo:",  @"NSUndoManagerWillCloseUndoGroupNotification",  self,  v9);
    }

    int v10 = -[objc_class isDiscardable](v7, "isDiscardable");
    if ((v8 & v3) == 1)
    {
      -[objc_class popUndoObject](v7, "popUndoObject");
    }

    else
    {
      int v11 = v10;
      if ((_DWORD)v8 && (self->_flags & 0x300000000LL) == 0) {
        -[_NSUndoStack removeAllObjects](self->_redoStack, "removeAllObjects");
      }
      -[objc_class markEnd](v7, "markEnd");
      if ((self->_flags & 0x300000000LL) == 0)
      {
        if (v11) {
          uint64_t v12 = objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObject:forKey:",  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1),  @"NSUndoManagerGroupIsDiscardableKey");
        }
        else {
          uint64_t v12 = 0LL;
        }
        -[NSNotificationCenter postNotificationName:object:userInfo:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "postNotificationName:object:userInfo:",  @"NSUndoManagerDidCloseUndoGroupNotification",  self,  v12);
      }
    }

    return v8 ^ 1;
  }

  else
  {
    v14 = NSStringFromSelector(a2);
    v15 = (objc_class *)objc_opt_class();
    v16 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: %@ %p is in invalid state, endUndoGrouping called with no matching begin\n", v14, NSStringFromClass(v15), self), 0 reason userInfo];
    objc_exception_throw(v16);
    -[NSUndoManager endUndoGrouping](v17, v18);
  }

  return result;
}

- (void)endUndoGrouping
{
  if (!(self->_flags >> 40)) {
    -[NSUndoManager _endUndoGroupRemovingIfEmpty:](self, "_endUndoGroupRemovingIfEmpty:", 0LL);
  }
}

- (void)disableUndoRegistration
{
  self->_flags += 0x10000000000LL;
}

- (void)enableUndoRegistration
{
  unint64_t flags = self->_flags;
  if (flags >> 40)
  {
    self->_unint64_t flags = flags - 0x10000000000LL;
  }

  else
  {
    uint64_t v4 = NSStringFromSelector(a2);
    Class v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: %@ %p is in invalid state, enableUndoRegistration may only be invoked with matching call to disableUndoRegistration\n", v4, NSStringFromClass(v5), self), 0 reason userInfo];
    objc_exception_throw(v6);
    -[NSUndoManager isUndoRegistrationEnabled](v7, v8);
  }

- (BOOL)isUndoRegistrationEnabled
{
  return self->_flags >> 40 == 0;
}

- (BOOL)groupsByEvent
{
  return (BYTE4(self->_flags) >> 6) & 1;
}

- (void)setGroupsByEvent:(BOOL)groupsByEvent
{
  uint64_t v3 = 0x4000000000LL;
  if (!groupsByEvent) {
    uint64_t v3 = 0LL;
  }
  self->_unint64_t flags = self->_flags & 0xFFFFFFBFFFFFFFFFLL | v3;
}

- (void)setLevelsOfUndo:(NSUInteger)levelsOfUndo
{
}

- (NSUInteger)levelsOfUndo
{
  return -[_NSUndoStack max](self->_undoStack, "max");
}

- (void)setRunLoopModes:(NSArray *)runLoopModes
{
  uint64_t v3 = self->_runLoopModes;
  self->_runLoopModes = (NSArray *)-[NSArray copyWithZone:]( runLoopModes,  "copyWithZone:",  -[NSUndoManager zone](self, "zone"));
}

- (NSArray)runLoopModes
{
  return self->_runLoopModes;
}

- (void)undo
{
  if ((self->_flags & 0x1000000000LL) != 0 && -[_NSUndoStack nestingLevel](self->_undoStack, "nestingLevel") == 1)
  {
    -[NSUndoManager endUndoGrouping](self, "endUndoGrouping");
    -[NSUndoManager _cancelAutomaticTopLevelGroupEnding](self, "_cancelAutomaticTopLevelGroupEnding");
  }

  if (-[_NSUndoStack nestingLevel](self->_undoStack, "nestingLevel"))
  {
    uint64_t v4 = NSStringFromSelector(a2);
    Class v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: %@ %p is in invalid state, undo was called with too many nested undo groups", v4, NSStringFromClass(v5), self), 0 reason userInfo];
    objc_exception_throw(v6);
    -[NSUndoManager undoNestedGroup](v7, v8);
  }

  else
  {
    -[NSUndoManager undoNestedGroup](self, "undoNestedGroup");
  }

- (void)undoNestedGroup
{
  v13[1] = *MEMORY[0x1895F89C0];
  -[NSUndoManager _postCheckpointNotification](self, "_postCheckpointNotification");
  self->_flags |= 0x100000000uLL;
  id v4 = -[_NSUndoStack topUndoObject](self->_undoStack, "topUndoObject");
  if (!v4)
  {
LABEL_13:
    self->_flags &= ~0x100000000uLL;
    return;
  }

  if ([v4 isEndMark])
  {
    -[NSNotificationCenter postNotificationName:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "postNotificationName:object:",  @"NSUndoManagerWillUndoChangeNotification",  self);
    -[NSUndoManager beginUndoGrouping](self, "beginUndoGrouping");
    BOOL v5 = -[_NSUndoStack isDiscardable](self->_undoStack, "isDiscardable");
    if (!(self->_flags >> 40))
    {
      -[_NSUndoStack setGroupIdentifier:]( self->_redoStack,  "setGroupIdentifier:",  -[_NSUndoStack groupIdentifier](self->_undoStack, "groupIdentifier"));
      if (!(self->_flags >> 40))
      {
        -[_NSUndoStack setUserInfo:]( self->_redoStack,  "setUserInfo:",  -[_NSUndoStack userInfo](self->_undoStack, "userInfo"));
        if (!(self->_flags >> 40)) {
          -[_NSUndoStack setDiscardable:](self->_redoStack, "setDiscardable:", v5);
        }
      }
    }

    -[_NSUndoStack popAndInvoke](self->_undoStack, "popAndInvoke");
    if (!(self->_flags >> 40)) {
      -[NSUndoManager _endUndoGroupRemovingIfEmpty:](self, "_endUndoGroupRemovingIfEmpty:", 1LL);
    }
    if (v5)
    {
      uint64_t v12 = @"NSUndoManagerGroupIsDiscardableKey";
      v13[0] = MEMORY[0x189604A88];
      uint64_t v6 = [MEMORY[0x189603F68] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    }

    else
    {
      uint64_t v6 = 0LL;
    }

    -[NSNotificationCenter postNotificationName:object:userInfo:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "postNotificationName:object:userInfo:",  @"NSUndoManagerDidUndoChangeNotification",  self,  v6);
    goto LABEL_13;
  }

  self->_flags &= ~0x100000000uLL;
  Class v7 = NSStringFromSelector(a2);
  SEL v8 = (objc_class *)objc_opt_class();
  uint64_t v9 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: %@ %p is in invalid state, call endUndoGrouping before calling this method\n", v7, NSStringFromClass(v8), self), 0 reason userInfo];
  objc_exception_throw(v9);
  -[NSUndoManager redo](v10, v11);
}

- (void)redo
{
}

- (void)__redoSingle
{
}

- (void)__redoCommonDoSingle:(BOOL)a3
{
  if (-[NSUndoManager canRedo](self, "canRedo", a3))
  {
    self->_flags |= 0x200000000uLL;
    id v5 = -[_NSUndoStack topUndoObject](self->_redoStack, "topUndoObject");
    if (v5)
    {
      if (([v5 isEndMark] & 1) == 0)
      {
        self->_flags &= ~0x200000000uLL;
        SEL v8 = NSStringFromSelector(a2);
        uint64_t v9 = (objc_class *)objc_opt_class();
        int v10 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: %@ %p is in invalid state, do not invoke this method while undoing\n", v8, NSStringFromClass(v9), self), 0 reason userInfo];
        objc_exception_throw(v10);
        -[NSUndoManager canUndo](v11, v12);
        return;
      }

      -[NSNotificationCenter postNotificationName:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "postNotificationName:object:",  @"NSUndoManagerWillRedoChangeNotification",  self);
      -[NSUndoManager beginUndoGrouping](self, "beginUndoGrouping");
      BOOL v6 = -[_NSUndoStack isDiscardable](self->_redoStack, "isDiscardable");
      if (!(self->_flags >> 40))
      {
        -[_NSUndoStack setGroupIdentifier:]( self->_undoStack,  "setGroupIdentifier:",  -[_NSUndoStack groupIdentifier](self->_redoStack, "groupIdentifier"));
        if (!(self->_flags >> 40))
        {
          -[_NSUndoStack setUserInfo:]( self->_undoStack,  "setUserInfo:",  -[_NSUndoStack userInfo](self->_redoStack, "userInfo"));
          if (!(self->_flags >> 40)) {
            -[_NSUndoStack setDiscardable:](self->_undoStack, "setDiscardable:", v6);
          }
        }
      }

      -[_NSUndoStack popAndInvoke](self->_redoStack, "popAndInvoke");
      -[NSUndoManager _postCheckpointNotification](self, "_postCheckpointNotification");
      -[NSUndoManager endUndoGrouping](self, "endUndoGrouping");
      if (v6) {
        uint64_t v7 = objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObject:forKey:",  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1),  @"NSUndoManagerGroupIsDiscardableKey");
      }
      else {
        uint64_t v7 = 0LL;
      }
      -[NSNotificationCenter postNotificationName:object:userInfo:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "postNotificationName:object:userInfo:",  @"NSUndoManagerDidRedoChangeNotification",  self,  v7);
    }

    self->_flags &= ~0x200000000uLL;
  }

- (BOOL)canUndo
{
  return -[_NSUndoStack count](self->_undoStack, "count") != 0;
}

- (unint64_t)undoCount
{
  return -[_NSUndoStack topLevelGroupCount](self->_undoStack, "topLevelGroupCount");
}

- (unint64_t)redoCount
{
  return -[_NSUndoStack topLevelGroupCount](self->_redoStack, "topLevelGroupCount");
}

- (BOOL)canRedo
{
  return -[_NSUndoStack count](self->_redoStack, "count") != 0;
}

- (BOOL)isUndoing
{
  return BYTE4(self->_flags) & 1;
}

- (BOOL)isRedoing
{
  return (BYTE4(self->_flags) >> 1) & 1;
}

- (void)removeAllActions
{
  unint64_t flags = self->_flags;
  self->_unint64_t flags = flags & 0xFCFFFFFFFFLL;
  self->_target = 0LL;
  if ((flags & 0x1000000000LL) != 0) {
    -[NSUndoManager _cancelAutomaticTopLevelGroupEnding](self, "_cancelAutomaticTopLevelGroupEnding");
  }
  -[NSUndoManager _delayAutomaticTermination:](self, "_delayAutomaticTermination:", -1.0);
}

- (void)removeAllActionsWithTarget:(id)target
{
}

- (id)prepareWithInvocationTarget:(id)target
{
  self->_target = target;
  proxy = (NSUndoManagerProxy *)self->_proxy;
  if (!proxy)
  {
    proxy = -[NSUndoManagerProxy initWithManager:]( objc_alloc(&OBJC_CLASS___NSUndoManagerProxy),  "initWithManager:",  self);
    self->_proxy = proxy;
  }

  -[NSUndoManagerProxy setTargetClass:](proxy, "setTargetClass:", objc_opt_class());
  return self->_proxy;
}

- (id)_methodSignatureForTargetSelector:(SEL)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSUndoManager;
  id result = -[NSUndoManager methodSignatureForSelector:](&v6, sel_methodSignatureForSelector_);
  if (!result)
  {
    id result = self->_target;
    if (result) {
      return (id)[result methodSignatureForSelector:a3];
    }
  }

  return result;
}

- (void)_registerUndoObject:(id)a3
{
  unint64_t flags = self->_flags;
  if (flags >> 40)
  {
  }

  else
  {
    if ((flags & 0x300000000LL) == 0) {
      -[_NSUndoStack removeAllObjects](self->_redoStack, "removeAllObjects");
    }
    -[NSUndoManager _prepareEventGrouping](self, "_prepareEventGrouping");
    uint64_t v6 = 2LL;
    if ((self->_flags & 0x100000000LL) == 0) {
      uint64_t v6 = 1LL;
    }
    Class v7 = (&self->super.isa)[v6];
    if (-[objc_class nestingLevel](v7, "nestingLevel"))
    {
      -[objc_class push:](v7, "push:", a3);
      if (-[NSUndoManager groupsByEvent](self, "groupsByEvent")) {
        -[NSUndoManager _delayAutomaticTermination:](self, "_delayAutomaticTermination:", 28800.0);
      }
    }

    else
    {
      SEL v8 = NSStringFromSelector(a2);
      uint64_t v9 = (objc_class *)objc_opt_class();
      int v10 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: %@ %p is in invalid state, must begin a group before registering undo\n", v8, NSStringFromClass(v9), self), 0 reason userInfo];
      objc_exception_throw(v10);
      -[NSUndoManager _forwardTargetInvocation:](v11, v12, v13);
    }
  }

- (void)_forwardTargetInvocation:(id)a3
{
  if (self->_target)
  {
    [a3 setTarget:0];
    -[NSUndoManager _registerUndoObject:]( self,  "_registerUndoObject:",  [objc_allocWithZone((Class)_NSUndoInvocation) initWithTarget:self->_target invocation:a3]);
    self->_target = 0LL;
  }

  else
  {
    id v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    Class v7 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: %@ %p received forwarded invocation while invocation target is nil. Call prepareWithInvocationTarget: before invoking %@", @"forwardInvocation:", v6, self, NSStringFromSelector((SEL)objc_msgSend(a3, "selector"))), 0 reason userInfo];
    objc_exception_throw(v7);
    -[NSUndoManager registerUndoWithTarget:selector:object:](v8, v9, v10, v11, v12);
  }

- (void)registerUndoWithTarget:(id)target selector:(SEL)selector object:(id)anObject
{
}

- (void)registerUndoWithTarget:(id)target handler:(void *)undoHandler
{
  if (!target)
  {
    uint64_t v6 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"*** %s: targetcannot be nil",  undoHandler,  "-[NSUndoManager registerUndoWithTarget:handler:]");
LABEL_8:
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v6 userInfo:0]);
    -[NSUndoManager _registerUndoWithTarget:handler:](v7, v8, v9, v10);
    return;
  }

  if (!undoHandler)
  {
    uint64_t v6 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"*** %s: handlercannot be nil",  0LL,  "-[NSUndoManager registerUndoWithTarget:handler:]");
    goto LABEL_8;
  }

  id v5 = -[_NSUndoBlockInvocation initWithTarget:handler:]( objc_alloc(&OBJC_CLASS____NSUndoBlockInvocation),  "initWithTarget:handler:",  target,  undoHandler);
  if (v5) {
    -[NSUndoManager _registerUndoObject:](self, "_registerUndoObject:", v5);
  }
}

- (NSString)undoActionName
{
  id result = -[_NSUndoStack groupIdentifier](self->_undoStack, "groupIdentifier");
  if (!result) {
    return (NSString *)&stru_189CA6A28;
  }
  return result;
}

- (NSString)redoActionName
{
  id result = -[_NSUndoStack groupIdentifier](self->_redoStack, "groupIdentifier");
  if (!result) {
    return (NSString *)&stru_189CA6A28;
  }
  return result;
}

- (void)_setGroupIdentifier:(id)a3
{
  if (a3 && !(self->_flags >> 40))
  {
    -[NSUndoManager _prepareEventGrouping](self, "_prepareEventGrouping");
    uint64_t v6 = 2LL;
    if ((self->_flags & 0x100000000LL) == 0) {
      uint64_t v6 = 1LL;
    }
    Class v7 = (&self->super.isa)[v6];
    if (-[objc_class nestingLevel](v7, "nestingLevel"))
    {
      -[objc_class setGroupIdentifier:](v7, "setGroupIdentifier:", a3);
    }

    else
    {
      SEL v8 = NSStringFromSelector(a2);
      id v9 = (objc_class *)objc_opt_class();
      id v10 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: %@ %p is in invalid state, must begin a group before registering undo\n", v8, NSStringFromClass(v9), self), 0 reason userInfo];
      objc_exception_throw(v10);
      -[NSUndoManager setActionName:](v11, v12, v13);
    }
  }

- (void)setActionIsDiscardable:(BOOL)discardable
{
  if (!(self->_flags >> 40))
  {
    BOOL v3 = discardable;
    -[NSUndoManager _prepareEventGrouping](self, "_prepareEventGrouping");
    uint64_t v6 = 2LL;
    if ((self->_flags & 0x100000000LL) == 0) {
      uint64_t v6 = 1LL;
    }
    Class v7 = (&self->super.isa)[v6];
    if (-[objc_class nestingLevel](v7, "nestingLevel"))
    {
      -[objc_class setDiscardable:](v7, "setDiscardable:", v3);
    }

    else
    {
      SEL v8 = NSStringFromSelector(a2);
      id v9 = (objc_class *)objc_opt_class();
      id v10 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: %@ %p is in invalid state, must begin a group before setting undo action discardability\n", v8, NSStringFromClass(v9), self), 0 reason userInfo];
      objc_exception_throw(v10);
      -[NSUndoManager undoActionIsDiscardable](v11, v12);
    }
  }

- (BOOL)undoActionIsDiscardable
{
  return -[_NSUndoStack isDiscardable](self->_undoStack, "isDiscardable");
}

- (BOOL)redoActionIsDiscardable
{
  return -[_NSUndoStack isDiscardable](self->_redoStack, "isDiscardable");
}

- (void)setActionUserInfoValue:(id)a3 forKey:(id)a4
{
  if (!(self->_flags >> 40))
  {
    -[NSUndoManager _prepareEventGrouping](self, "_prepareEventGrouping");
    uint64_t v8 = 2LL;
    if ((self->_flags & 0x100000000LL) == 0) {
      uint64_t v8 = 1LL;
    }
    Class v9 = (&self->super.isa)[v8];
    if (-[objc_class nestingLevel](v9, "nestingLevel"))
    {
      if (-[objc_class userInfo](v9, "userInfo")) {
        objc_msgSend((id)-[objc_class userInfo](v9, "userInfo"), "setObject:forKey:", a3, a4);
      }
      else {
        -[objc_class setUserInfo:]( v9,  "setUserInfo:",  objc_msgSend(MEMORY[0x189603FC8], "dictionaryWithObjectsAndKeys:", a3, a4, 0));
      }
    }

    else
    {
      id v10 = NSStringFromSelector(a2);
      SEL v11 = (objc_class *)objc_opt_class();
      SEL v12 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: %@ %p is in invalid state, must begin a group before setting undo action user info\n", v10, NSStringFromClass(v11), self), 0 reason userInfo];
      objc_exception_throw(v12);
      -[NSUndoManager undoActionUserInfoValueForKey:](v13, v14, v15);
    }
  }

- (id)undoActionUserInfoValueForKey:(id)a3
{
  return (id)objc_msgSend(-[_NSUndoStack userInfo](self->_undoStack, "userInfo"), "objectForKey:", a3);
}

- (id)redoActionUserInfoValueForKey:(id)a3
{
  return (id)objc_msgSend(-[_NSUndoStack userInfo](self->_redoStack, "userInfo"), "objectForKey:", a3);
}

- (NSString)undoMenuItemTitle
{
  if (-[NSUndoManager canUndo](self, "canUndo")
    && (BOOL v3 = -[NSUndoManager undoActionName](self, "undoActionName"),
        !-[NSString isEqual:](v3, "isEqual:", &stru_189CA6A28)))
  {
    return -[NSUndoManager undoMenuTitleForUndoActionName:](self, "undoMenuTitleForUndoActionName:", v3);
  }

  else
  {
    return (NSString *)[(id)_NSFoundationBundle() localizedStringForKey:@"Undo" value:&stru_189CA6A28 table:@"Undo"];
  }

- (NSString)redoMenuItemTitle
{
  if (-[NSUndoManager canRedo](self, "canRedo")
    && (BOOL v3 = -[NSUndoManager redoActionName](self, "redoActionName"),
        !-[NSString isEqual:](v3, "isEqual:", &stru_189CA6A28)))
  {
    return -[NSUndoManager redoMenuTitleForUndoActionName:](self, "redoMenuTitleForUndoActionName:", v3);
  }

  else
  {
    return (NSString *)[(id)_NSFoundationBundle() localizedStringForKey:@"Redo" value:&stru_189CA6A28 table:@"Undo"];
  }

- (NSString)undoMenuTitleForUndoActionName:(NSString *)actionName
{
  id v4 = (const __CFString *)[(id)_NSFoundationBundle() localizedStringForKey:@"Undo %@" value:&stru_189CA6A28 table:@"Undo"];
  return (NSString *)(id)CFStringCreateWithFormat(0LL, 0LL, v4, actionName);
}

- (NSString)redoMenuTitleForUndoActionName:(NSString *)actionName
{
  id v4 = (const __CFString *)[(id)_NSFoundationBundle() localizedStringForKey:@"Redo %@" value:&stru_189CA6A28 table:@"Undo"];
  return (NSString *)(id)CFStringCreateWithFormat(0LL, 0LL, v4, actionName);
}

- (id)_undoStack
{
  return self->_undoStack;
}

- (BOOL)_shouldCoalesceTypingForText:(id)a3 :(id)a4
{
  uint64_t v6 = objc_msgSend(-[NSUndoManager _undoStack](self, "_undoStack"), "topUndoObject");
  if (v6)
  {
    Class v7 = (void *)v6;
    while ((id)[v7 target] != a4
         || object_getClass(v7) != (Class)&OBJC_CLASS____NSUndoLightInvocation
         || (id)[v7 _argument] != a3)
    {
      LODWORD(v6) = [v7 isEndMark];
      if (!(_DWORD)v6) {
        return v6;
      }
      Class v7 = (void *)v7[1];
      if (!v7)
      {
        LOBYTE(v6) = 0;
        return v6;
      }
    }

    LOBYTE(v6) = 1;
  }

  return v6;
}

+ (void)_setEndsTopLevelGroupingsAfterRunLoopIterations:(BOOL)a3
{
  NSUndoManagerEndsTopLevelGroupingsAfterRunLoopIterations = a3;
}

- (void)_processEndOfEventNotification:(id)a3
{
  unint64_t flags = self->_flags;
  if ((~flags & 0x5000000000LL) == 0)
  {
    self->_unint64_t flags = flags & 0xFFFFFFEFFFFFFFFFLL;
    -[NSUndoManager endUndoGrouping](self, "endUndoGrouping", a3);
  }

+ (void)_endTopLevelGroupings
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (!+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread")) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  a1,  @"NSUndoManager.m",  1158LL,  @"+[NSUndoManager(NSInternal) _endTopLevelGroupings] is only safe to invoke on the main thread.");
  }
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_5_1);
  id v4 = (void *)qword_18C494A30;
  qword_18C494A30 = 0LL;
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_5_1);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v9 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v8++) _processEndOfEventNotification:0];
      }

      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v9 count:16];
    }

    while (v6);
  }
}

- (void)_commitUndoGrouping
{
  if (!(self->_flags >> 40)) {
    -[NSUndoManager _endUndoGroupRemovingIfEmpty:](self, "_endUndoGroupRemovingIfEmpty:", 1LL);
  }
}

- (void)_rollbackUndoGrouping
{
  if (!(self->_flags >> 40))
  {
    if (-[NSUndoManager _endUndoGroupRemovingIfEmpty:](self, "_endUndoGroupRemovingIfEmpty:", 1LL))
    {
      -[NSUndoManager disableUndoRegistration](self, "disableUndoRegistration");
      -[NSUndoManager undoNestedGroup](self, "undoNestedGroup");
      -[NSUndoManager enableUndoRegistration](self, "enableUndoRegistration");
    }
  }

@end