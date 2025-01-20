@interface MTListResultsController
- (MTListResultsController)init;
- (MTResultsChangeGenerator)changeGenerator;
- (NSArray)objects;
- (id)indexPathForObject:(id)a3;
- (id)objectAtIndexPath:(id)a3;
- (unint64_t)numberOfObjectsInSection:(unint64_t)a3;
- (unint64_t)startingIndexForDisplay;
- (void)generator:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7;
- (void)setChangeGenerator:(id)a3;
- (void)setObjects:(id)a3;
@end

@implementation MTListResultsController

- (MTListResultsController)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MTListResultsController;
  v2 = -[MTListResultsController init](&v5, "init");
  if (v2)
  {
    v3 = -[MTResultsChangeGenerator initWithDelegate:]( objc_alloc(&OBJC_CLASS___MTResultsChangeGenerator),  "initWithDelegate:",  v2);
    -[MTListResultsController setChangeGenerator:](v2, "setChangeGenerator:", v3);
  }

  return v2;
}

- (unint64_t)startingIndexForDisplay
{
  return 0LL;
}

- (void)setObjects:(id)a3
{
  id v10 = a3;
  if (([v10 isEqualToArray:self->_objects] & 1) == 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTResultsController delegate](self, "delegate"));
    [v4 controllerWillChangeContent:self];

    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTListResultsController changeGenerator](self, "changeGenerator"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTListResultsController objects](self, "objects"));
    [v5 generateChangesForExistingObjects:v6 newObjects:v10 inSection:0];

    v7 = (NSArray *)[v10 copy];
    objects = self->_objects;
    self->_objects = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTResultsController delegate](self, "delegate"));
    [v9 controllerDidChangeContent:self];
  }
}

- (id)objectAtIndexPath:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTListResultsController objects](self, "objects"));
  id v6 = [v4 row];

  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndex:v6]);
  return v7;
}

- (id)indexPathForObject:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTListResultsController objects](self, "objects"));
  id v6 = [v5 indexOfObject:v4];

  return +[NSIndexPath indexPathForRow:inSection:](&OBJC_CLASS___NSIndexPath, "indexPathForRow:inSection:", v6, 0LL);
}

- (unint64_t)numberOfObjectsInSection:(unint64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTListResultsController objects](self, "objects", a3));
  id v4 = [v3 count];

  return (unint64_t)v4;
}

- (void)generator:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v11 = a7;
  id v12 = a5;
  id v13 = a4;
  id v14 = (id)objc_claimAutoreleasedReturnValue(-[MTResultsController delegate](self, "delegate"));
  [v14 controller:self didChangeObject:v13 atIndexPath:v12 forChangeType:a6 newIndexPath:v11];
}

- (NSArray)objects
{
  return self->_objects;
}

- (MTResultsChangeGenerator)changeGenerator
{
  return self->_changeGenerator;
}

- (void)setChangeGenerator:(id)a3
{
}

- (void).cxx_destruct
{
}

@end