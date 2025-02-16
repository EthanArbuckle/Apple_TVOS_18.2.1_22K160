@interface MTConditionalNullResultsController
- (BOOL)hasResults;
- (MTResultsChangeGenerator)changeGenerator;
- (id)_extraObjects;
- (id)allObjects;
- (unint64_t)numberOfPlaceholderObjects;
- (void)_initializeFrc;
- (void)controllerDidChangeContent:(id)a3;
- (void)generator:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7;
- (void)setChangeGenerator:(id)a3;
- (void)setHasResults:(BOOL)a3;
- (void)setNumberOfPlaceholderObjects:(unint64_t)a3;
@end

@implementation MTConditionalNullResultsController

- (void)_initializeFrc
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MTConditionalNullResultsController;
  -[MTCoreDataResultsController _initializeFrc](&v5, "_initializeFrc");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTCoreDataResultsController frc](self, "frc"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 fetchedObjects]);
  -[MTConditionalNullResultsController setHasResults:](self, "setHasResults:", [v4 count] != 0);
}

- (id)allObjects
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTCoreDataResultsController frc](self, "frc"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 fetchedObjects]);
  id v5 = [v4 count];

  if (v5) {
    v6 = &__NSArray0__struct;
  }
  else {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTConditionalNullResultsController _extraObjects](self, "_extraObjects"));
  }
  return v6;
}

- (id)_extraObjects
{
  v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  unint64_t v4 = -[MTConditionalNullResultsController numberOfPlaceholderObjects](self, "numberOfPlaceholderObjects");
  if (v4)
  {
    unint64_t v5 = v4;
    do
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      -[NSMutableArray addObject:](v3, "addObject:", v6);

      --v5;
    }

    while (v5);
  }

  id v7 = -[NSMutableArray copy](v3, "copy");

  return v7;
}

- (MTResultsChangeGenerator)changeGenerator
{
  changeGenerator = self->_changeGenerator;
  if (!changeGenerator)
  {
    unint64_t v4 = -[MTResultsChangeGenerator initWithDelegate:]( objc_alloc(&OBJC_CLASS___MTResultsChangeGenerator),  "initWithDelegate:",  self);
    unint64_t v5 = self->_changeGenerator;
    self->_changeGenerator = v4;

    changeGenerator = self->_changeGenerator;
  }

  return changeGenerator;
}

- (void)controllerDidChangeContent:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTCoreDataResultsController frc](self, "frc"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 fetchedObjects]);

  id v7 = [v6 count];
  if ((v7 != 0LL) != -[MTConditionalNullResultsController hasResults](self, "hasResults"))
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue(-[MTConditionalNullResultsController _extraObjects](self, "_extraObjects"));
    if (v7) {
      v9 = &__NSArray0__struct;
    }
    else {
      v9 = (void *)v8;
    }
    if (v7) {
      v10 = (void *)v8;
    }
    else {
      v10 = &__NSArray0__struct;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTConditionalNullResultsController changeGenerator](self, "changeGenerator"));
    [v11 generateChangesForExistingObjects:v10 newObjects:v9 inSection:0];
  }

  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MTConditionalNullResultsController;
  -[MTCoreDataResultsController controllerDidChangeContent:](&v12, "controllerDidChangeContent:", v4);
  -[MTConditionalNullResultsController setHasResults:](self, "setHasResults:", v7 != 0LL);
}

- (void)generator:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v11 = a7;
  id v12 = a5;
  id v13 = a4;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTCoreDataResultsController frc](self, "frc"));
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___MTConditionalNullResultsController;
  -[MTCoreDataResultsController controller:didChangeObject:atIndexPath:forChangeType:newIndexPath:]( &v15,  "controller:didChangeObject:atIndexPath:forChangeType:newIndexPath:",  v14,  v13,  v12,  a6,  v11);
}

- (unint64_t)numberOfPlaceholderObjects
{
  return self->_numberOfPlaceholderObjects;
}

- (void)setNumberOfPlaceholderObjects:(unint64_t)a3
{
  self->_numberOfPlaceholderObjects = a3;
}

- (void)setChangeGenerator:(id)a3
{
}

- (BOOL)hasResults
{
  return self->_hasResults;
}

- (void)setHasResults:(BOOL)a3
{
  self->_hasResults = a3;
}

- (void).cxx_destruct
{
}

@end