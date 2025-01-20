@interface NSObservableKeyPath
- (BOOL)_wantsChanges;
- (NSObservable)changes;
- (NSString)description;
- (id)addObserver:(id)a3;
- (void)removeObservation:(id)a3;
@end

@implementation NSObservableKeyPath

- (id)addObserver:(id)a3
{
  return (id)objc_msgSend( -[NSBoundKeyPath rootObject](self, "rootObject"),  "addObserver:forObservableKeyPath:",  a3,  self);
}

- (void)removeObservation:(id)a3
{
}

- (NSString)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p> @observable(%@)",  objc_opt_class(),  self,  self->super._keyPath);
}

- (NSObservable)changes
{
  return (NSObservable *) +[NSBoundKeyPath newKeyPathWithRootObject:keyPathString:]( &OBJC_CLASS____NSObservableKeyPathChangeAdaptor,  "newKeyPathWithRootObject:keyPathString:",  -[NSBoundKeyPath rootObject](self, "rootObject"),  self->super._keyPath);
}

- (BOOL)_wantsChanges
{
  return 0;
}

@end