@interface MTCoreDataResultsWithExtrasController
- (BOOL)_hasResults;
- (MTResultsChangeGenerator)changeGenerator;
- (id)_extraObjects;
- (id)allObjects;
- (unint64_t)numberOfExtraObjects;
- (unint64_t)numberOfResults;
- (void)_initializeFrc;
- (void)controllerDidChangeContent:(id)a3;
- (void)generator:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7;
- (void)setChangeGenerator:(id)a3;
- (void)setNumberOfExtraObjects:(unint64_t)a3;
- (void)setNumberOfResults:(unint64_t)a3;
@end

@implementation MTCoreDataResultsWithExtrasController

- (void)_initializeFrc
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MTCoreDataResultsWithExtrasController;
  -[MTCoreDataResultsController _initializeFrc](&v5, "_initializeFrc");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTCoreDataResultsController frc](self, "frc"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 fetchedObjects]);
  -[MTCoreDataResultsWithExtrasController setNumberOfResults:](self, "setNumberOfResults:", [v4 count]);
}

- (id)allObjects
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTCoreDataResultsWithExtrasController;
  id v3 = -[MTCoreDataResultsController allObjects](&v8, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if ([v4 count])
  {
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTCoreDataResultsWithExtrasController _extraObjects](self, "_extraObjects"));
    if ([v5 count])
    {
      uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 arrayByAddingObjectsFromArray:v5]);

      v4 = (void *)v6;
    }
  }

  return v4;
}

- (id)_extraObjects
{
  id v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  unint64_t v4 = -[MTCoreDataResultsWithExtrasController numberOfExtraObjects](self, "numberOfExtraObjects");
  if (v4)
  {
    unint64_t v5 = v4;
    do
    {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      -[NSMutableArray addObject:](v3, "addObject:", v6);

      --v5;
    }

    while (v5);
  }

  id v7 = -[NSMutableArray copy](v3, "copy");

  return v7;
}

- (BOOL)_hasResults
{
  return -[MTCoreDataResultsWithExtrasController numberOfResults](self, "numberOfResults") != 0;
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
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 fetchedObjects]);

  id v7 = [v6 count];
  if ((v7 != 0LL) != -[MTCoreDataResultsWithExtrasController _hasResults](self, "_hasResults"))
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTCoreDataResultsWithExtrasController _extraObjects](self, "_extraObjects"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 arrayByAddingObjectsFromArray:v8]);

    if (v7) {
      v10 = v6;
    }
    else {
      v10 = v9;
    }
    if (v7) {
      v11 = v9;
    }
    else {
      v11 = v6;
    }
    id v12 = v11;
    id v13 = v10;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTCoreDataResultsWithExtrasController changeGenerator](self, "changeGenerator"));
    [v14 generateChangesForExistingObjects:v13 newObjects:v12 inSection:0];
  }

  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___MTCoreDataResultsWithExtrasController;
  -[MTCoreDataResultsController controllerDidChangeContent:](&v15, "controllerDidChangeContent:", v4);
  -[MTCoreDataResultsWithExtrasController setNumberOfResults:](self, "setNumberOfResults:", v7);
}

- (void)generator:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v15 = a4;
  id v11 = a5;
  id v12 = a7;
  if (v11 && a6 == 2 && -[MTCoreDataResultsWithExtrasController _hasResults](self, "_hasResults"))
  {
    uint64_t v13 = objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForRow:inSection:]( NSIndexPath,  "indexPathForRow:inSection:",  (char *)[v11 row]
            + -[MTCoreDataResultsWithExtrasController numberOfResults](self, "numberOfResults"),
              [v11 section]));

    id v11 = (id)v13;
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTCoreDataResultsController frc](self, "frc"));
  -[MTCoreDataResultsController controller:didChangeObject:atIndexPath:forChangeType:newIndexPath:]( self,  "controller:didChangeObject:atIndexPath:forChangeType:newIndexPath:",  v14,  v15,  v11,  a6,  v12);
}

- (unint64_t)numberOfExtraObjects
{
  return self->_numberOfExtraObjects;
}

- (void)setNumberOfExtraObjects:(unint64_t)a3
{
  self->_numberOfExtraObjects = a3;
}

- (void)setChangeGenerator:(id)a3
{
}

- (unint64_t)numberOfResults
{
  return self->_numberOfResults;
}

- (void)setNumberOfResults:(unint64_t)a3
{
  self->_numberOfResults = a3;
}

- (void).cxx_destruct
{
}

@end