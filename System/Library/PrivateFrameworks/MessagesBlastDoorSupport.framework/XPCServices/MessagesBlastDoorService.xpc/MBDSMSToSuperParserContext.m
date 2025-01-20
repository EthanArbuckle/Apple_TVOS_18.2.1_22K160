@interface MBDSMSToSuperParserContext
- (BOOL)supportsMessagePartNumbersInAttributes;
- (NSArray)orderedParts;
- (id)name;
- (void)_addPart:(id)a3;
@end

@implementation MBDSMSToSuperParserContext

- (id)name
{
  return @"MBDSMSToSuper";
}

- (void)_addPart:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    orderedParts = self->_orderedParts;
    id v8 = v4;
    if (!orderedParts)
    {
      v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      v7 = self->_orderedParts;
      self->_orderedParts = v6;

      orderedParts = self->_orderedParts;
    }

    -[NSMutableArray addObject:](orderedParts, "addObject:", v8);
    id v4 = v8;
  }
}

- (BOOL)supportsMessagePartNumbersInAttributes
{
  return 0;
}

- (NSArray)orderedParts
{
  return &self->_orderedParts->super;
}

- (void).cxx_destruct
{
}

@end