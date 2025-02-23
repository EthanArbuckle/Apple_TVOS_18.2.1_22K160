@interface _NSDefaultSectionInfo
- (NSArray)objects;
- (NSString)indexTitle;
- (NSString)name;
- (id)sectionId;
- (uint64_t)sectionNumber;
- (unint64_t)numberOfObjects;
- (void)dealloc;
- (void)initWithController:(void *)a3 name:(void *)a4 sectionId:(void *)a5 indexTitle:(uint64_t)a6 sectionOffset:;
@end

@implementation _NSDefaultSectionInfo

- (void)initWithController:(void *)a3 name:(void *)a4 sectionId:(void *)a5 indexTitle:(uint64_t)a6 sectionOffset:
{
  if (!a1) {
    return 0LL;
  }
  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_CLASS____NSDefaultSectionInfo;
  v11 = objc_msgSendSuper2(&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11[1] = a2;
    v11[2] = [a3 copy];
    v12[3] = [a5 copy];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      v12[8] = a4;
    }
    v12[7] = 0LL;
    v12[4] = a6;
    v12[5] = 0LL;
  }

  return v12;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSDefaultSectionInfo;
  -[_NSDefaultSectionInfo dealloc](&v3, sel_dealloc);
}

- (id)sectionId
{
  if (!self->_controller) {
    return 0LL;
  }
  id result = self->_sectionId;
  if (!result)
  {
    id result = (id)objc_msgSend( -[NSArray firstObject](-[_NSDefaultSectionInfo objects](self, "objects"), "firstObject"),  "valueForKeyPath:",  -[NSFetchedResultsController sectionNameKeyPath](self->_controller, "sectionNameKeyPath"));
    self->_sectionId = result;
  }

  return result;
}

- (uint64_t)sectionNumber
{
  if (result)
  {
    v1 = (void *)result;
    uint64_t v2 = *(void *)(result + 8);
    if (!v2
      || (objc_super v3 = *(void **)(v2 + 104)) == 0LL
      || (id result = [v3 indexOfObject:v1], result == 0x7FFFFFFFFFFFFFFFLL))
    {
      uint64_t v4 = [v1 name];
      _NSCoreDataLog( 1LL,  (uint64_t)@"(NSFetchedResultsController) section '%@' not found in controller",  v5,  v6,  v7,  v8,  v9,  v10,  v4);
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }

  return result;
}

- (NSArray)objects
{
  id result = (NSArray *)self->_controller;
  if (result)
  {
    sectionObjects = self->_sectionObjects;
    if (sectionObjects)
    {
      uint64_t v5 = sectionObjects;
      return v5;
    }

    uint64_t v6 = (void *)-[NSArray _fetchedObjects](result, "_fetchedObjects");
    uint64_t v7 = v6;
    unint64_t sectionOffset = self->_sectionOffset;
    if (sectionOffset)
    {
      unint64_t numberOfObjects = self->_numberOfObjects;
    }

    else
    {
      uint64_t v10 = [v6 count];
      unint64_t numberOfObjects = self->_numberOfObjects;
      if (v10 == numberOfObjects)
      {
        v11 = -[NSFetchedResultsController fetchedObjects](self->_controller, "fetchedObjects");
LABEL_11:
        v12 = v11;
        self->_sectionObjects = v12;
        uint64_t v5 = v12;
        return v5;
      }

      unint64_t sectionOffset = self->_sectionOffset;
    }

    v11 = (NSArray *)objc_msgSend(v7, "subarrayWithRange:", sectionOffset, numberOfObjects);
    goto LABEL_11;
  }

  return result;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)indexTitle
{
  return self->_indexTitle;
}

- (unint64_t)numberOfObjects
{
  return self->_numberOfObjects;
}

@end