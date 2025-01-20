@interface NSBasicObjectID
+ (char)generatedNameSuffix;
- (NSBasicObjectID)initWithObject:(id)a3;
- (id)_referenceData;
- (id)_retainedURIString;
- (void)dealloc;
@end

@implementation NSBasicObjectID

+ (char)generatedNameSuffix
{
  return "id";
}

- (NSBasicObjectID)initWithObject:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NSBasicObjectID;
  v4 = -[NSBasicObjectID init](&v9, sel_init);
  if (v4)
  {
    v4->_referenceData = a3;
    Class Class = object_getClass(v4);
    IndexedIvars = (unsigned int *)object_getIndexedIvars(Class);
    do
      unsigned int v7 = __ldxr(IndexedIvars);
    while (__stxr(v7 + 1, IndexedIvars));
  }

  return v4;
}

- (void)dealloc
{
  self->_referenceData = 0LL;
  _PFDeallocateObject(self);
}

- (id)_retainedURIString
{
  v3 = -[_NSCoreManagedObjectID _storeIdentifier](self, "_storeIdentifier");
  if (v3) {
    v4 = v3;
  }
  else {
    v4 = &stru_189EAC2E8;
  }
  return (id)[objc_alloc(NSString) initWithFormat:@"%@://%@/%@/p%@", @"x-coredata", v4, objc_msgSend(-[_NSCoreManagedObjectID entity](self, "entity"), "name"), self->_referenceData];
}

- (id)_referenceData
{
  return self->_referenceData;
}

@end