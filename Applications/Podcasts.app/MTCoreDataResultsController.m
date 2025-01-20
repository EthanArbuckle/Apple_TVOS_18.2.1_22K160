@interface MTCoreDataResultsController
- (MTCoreDataResultsController)initWithEntityName:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5;
- (MTCoreDataResultsController)initWithEntityName:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5 propertyKeys:(id)a6;
- (MTCoreDataResultsController)initWithFetchRequest:(id)a3;
- (MTCoreDataResultsController)initWithFetchRequest:(id)a3 propertyKeys:(id)a4;
- (MTFetchedResultsControllerProtocol)frc;
- (NSArray)propertyKeys;
- (NSArray)sortDescriptors;
- (NSFetchRequest)fetchRequest;
- (NSPredicate)predicate;
- (id)allObjects;
- (id)indexPathForObject:(id)a3;
- (id)objectAtIndexPath:(id)a3;
- (void)_initializeFrc;
- (void)_setFrc:(id)a3;
- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7;
- (void)controllerDidChangeContent:(id)a3;
- (void)controllerWillChangeContent:(id)a3;
- (void)dealloc;
- (void)reloadData;
- (void)setFetchRequest:(id)a3;
- (void)setFrc:(id)a3;
- (void)setPredicate:(id)a3;
- (void)setPropertyKeys:(id)a3;
- (void)setSortDescriptors:(id)a3;
@end

@implementation MTCoreDataResultsController

- (MTCoreDataResultsController)initWithEntityName:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5
{
  return -[MTCoreDataResultsController initWithEntityName:predicate:sortDescriptors:propertyKeys:]( self,  "initWithEntityName:predicate:sortDescriptors:propertyKeys:",  a3,  a4,  a5,  0LL);
}

- (MTCoreDataResultsController)initWithEntityName:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5 propertyKeys:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  v14 = -[NSFetchRequest initWithEntityName:](objc_alloc(&OBJC_CLASS___NSFetchRequest), "initWithEntityName:", v10);
  if ((id)kMTPodcastEntityName == v10)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[MTPodcast predicateForSyncablePodcastsForSyncType:]( &OBJC_CLASS___MTPodcast,  "predicateForSyncablePodcastsForSyncType:",  0LL));
  }

  else
  {
    if ((id)kMTEpisodeEntityName != v10) {
      goto LABEL_6;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForRSSEpisodes](&OBJC_CLASS___MTEpisode, "predicateForRSSEpisodes"));
  }

  v16 = v15;
  uint64_t v17 = objc_claimAutoreleasedReturnValue([v15 AND:v11]);

  id v11 = (id)v17;
LABEL_6:
  -[NSFetchRequest setPredicate:](v14, "setPredicate:", v11);
  if (v13) {
    v18 = v13;
  }
  else {
    v18 = &__NSArray0__struct;
  }
  -[NSFetchRequest setSortDescriptors:](v14, "setSortDescriptors:", v18);

  v19 = -[MTCoreDataResultsController initWithFetchRequest:propertyKeys:]( self,  "initWithFetchRequest:propertyKeys:",  v14,  v12);
  return v19;
}

- (MTCoreDataResultsController)initWithFetchRequest:(id)a3
{
  return -[MTCoreDataResultsController initWithFetchRequest:propertyKeys:]( self,  "initWithFetchRequest:propertyKeys:",  a3,  0LL);
}

- (MTCoreDataResultsController)initWithFetchRequest:(id)a3 propertyKeys:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MTCoreDataResultsController;
  v8 = -[MTCoreDataResultsController init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    -[MTCoreDataResultsController setFetchRequest:](v8, "setFetchRequest:", v6);
    -[MTCoreDataResultsController setPropertyKeys:](v9, "setPropertyKeys:", v7);
    -[MTCoreDataResultsController _initializeFrc](v9, "_initializeFrc");
  }

  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MTCoreDataResultsController;
  -[MTCoreDataResultsController dealloc](&v3, "dealloc");
}

- (void)setPredicate:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MTCoreDataResultsController fetchRequest](self, "fetchRequest"));
  [v5 setPredicate:v4];
}

- (NSPredicate)predicate
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTCoreDataResultsController fetchRequest](self, "fetchRequest"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 predicate]);

  return (NSPredicate *)v3;
}

- (void)setSortDescriptors:(id)a3
{
  id v4 = &__NSArray0__struct;
  if (a3) {
    id v4 = a3;
  }
  id v5 = v4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[MTCoreDataResultsController fetchRequest](self, "fetchRequest"));
  [v6 setSortDescriptors:v5];
}

- (NSArray)sortDescriptors
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTCoreDataResultsController fetchRequest](self, "fetchRequest"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 sortDescriptors]);

  return (NSArray *)v3;
}

- (void)reloadData
{
}

- (id)objectAtIndexPath:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTCoreDataResultsController frc](self, "frc"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 fetchedObjects]);
    id v7 = [v6 count];

    if ([v4 section] || objc_msgSend(v4, "row") >= v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[IMLogger sharedLogger](&OBJC_CLASS___IMLogger, "sharedLogger"));
      [v8 logFile:"/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Library/FRC/MTCoreDataResultsController.m", 111, @"Unable to retrieve object for index path %@ with total number of objects %ld", v4, v7 lineNumber format];
      v9 = 0LL;
    }

    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTCoreDataResultsController frc](self, "frc"));
      v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexPath:v4]);
    }
  }

  else
  {
    v9 = 0LL;
  }

  return v9;
}

- (id)indexPathForObject:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTCoreDataResultsController frc](self, "frc"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 indexPathForObject:v4]);

  return v6;
}

- (id)allObjects
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTCoreDataResultsController frc](self, "frc"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 fetchedObjects]);

  return v3;
}

- (void)_initializeFrc
{
  if (!self->_frc)
  {
    objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 mainQueueContext]);

    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTCoreDataResultsController propertyKeys](self, "propertyKeys"));
    id v6 = [v5 count];

    if (v6)
    {
      id v7 = objc_alloc(&OBJC_CLASS___MTFetchedResultsController);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTCoreDataResultsController fetchRequest](self, "fetchRequest"));
      v9 = (NSFetchedResultsController *)[v7 initWithFetchRequest:v8 managedObjectContext:v4 sectionNameKeyPath:0 cacheName:0];

      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTCoreDataResultsController propertyKeys](self, "propertyKeys"));
      -[NSFetchedResultsController setPropertyKeys:](v9, "setPropertyKeys:", v10);
    }

    else
    {
      objc_super v11 = objc_alloc(&OBJC_CLASS___NSFetchedResultsController);
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTCoreDataResultsController fetchRequest](self, "fetchRequest"));
      v9 = -[NSFetchedResultsController initWithFetchRequest:managedObjectContext:sectionNameKeyPath:cacheName:]( v11,  "initWithFetchRequest:managedObjectContext:sectionNameKeyPath:cacheName:",  v10,  v4,  0LL,  0LL);
    }

    -[NSFetchedResultsController setDelegate:](v9, "setDelegate:", self);
    id v15 = 0LL;
    unsigned int v12 = -[NSFetchedResultsController performFetch:](v9, "performFetch:", &v15);
    id v13 = v15;
    v14 = v13;
    if (v12) {
      -[MTCoreDataResultsController setFrc:](self, "setFrc:", v9);
    }
    else {
      [v13 logAndThrow:1];
    }
  }

- (void)_setFrc:(id)a3
{
  id v5 = (MTFetchedResultsControllerProtocol *)a3;
  frc = self->_frc;
  id v7 = v5;
  if (frc != v5)
  {
    -[MTFetchedResultsControllerProtocol setDelegate:](frc, "setDelegate:", 0LL);
    -[MTFetchedResultsControllerProtocol setDelegate:](v7, "setDelegate:", self);
    objc_storeStrong((id *)&self->_frc, a3);
  }
}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v11 = a7;
  id v12 = a5;
  id v13 = a4;
  id v14 = (id)objc_claimAutoreleasedReturnValue(-[MTResultsController delegate](self, "delegate"));
  [v14 controller:self didChangeObject:v13 atIndexPath:v12 forChangeType:a6 newIndexPath:v11];
}

- (void)controllerWillChangeContent:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[MTResultsController delegate](self, "delegate", a3));
  [v4 controllerWillChangeContent:self];
}

- (void)controllerDidChangeContent:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[MTResultsController delegate](self, "delegate", a3));
  [v4 controllerDidChangeContent:self];
}

- (NSArray)propertyKeys
{
  return self->_propertyKeys;
}

- (void)setPropertyKeys:(id)a3
{
}

- (NSFetchRequest)fetchRequest
{
  return self->_fetchRequest;
}

- (void)setFetchRequest:(id)a3
{
}

- (MTFetchedResultsControllerProtocol)frc
{
  return self->_frc;
}

- (void)setFrc:(id)a3
{
}

- (void).cxx_destruct
{
}

@end