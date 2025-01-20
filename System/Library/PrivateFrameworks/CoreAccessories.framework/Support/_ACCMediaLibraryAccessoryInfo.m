@interface _ACCMediaLibraryAccessoryInfo
- (NSMutableSet)nextUpdateStartFull;
- (NSString)accessoryUID;
- (_ACCMediaLibraryAccessoryInfo)initWithUID:(id)a3 windowPerLibrary:(unsigned int)a4;
- (id)description;
- (unsigned)windowPerLibrary;
- (void)dealloc;
- (void)setAccessoryUID:(id)a3;
- (void)setNextUpdateStartFull:(id)a3;
- (void)setWindowPerLibrary:(unsigned int)a3;
@end

@implementation _ACCMediaLibraryAccessoryInfo

- (_ACCMediaLibraryAccessoryInfo)initWithUID:(id)a3 windowPerLibrary:(unsigned int)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS____ACCMediaLibraryAccessoryInfo;
  v8 = -[_ACCMediaLibraryAccessoryInfo init](&v13, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_accessoryUID, a3);
    v9->_windowPerLibrary = a4;
    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    nextUpdateStartFull = v9->_nextUpdateStartFull;
    v9->_nextUpdateStartFull = v10;
  }

  return v9;
}

- (void)dealloc
{
  accessoryUID = self->_accessoryUID;
  self->_accessoryUID = 0LL;

  nextUpdateStartFull = self->_nextUpdateStartFull;
  self->_nextUpdateStartFull = 0LL;

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS____ACCMediaLibraryAccessoryInfo;
  -[_ACCMediaLibraryAccessoryInfo dealloc](&v5, "dealloc");
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<_ACCMediaLibraryAccessoryInfo>[%@ windowPerLibrary=%d]",  self->_accessoryUID,  self->_windowPerLibrary);
}

- (NSString)accessoryUID
{
  return self->_accessoryUID;
}

- (void)setAccessoryUID:(id)a3
{
}

- (unsigned)windowPerLibrary
{
  return self->_windowPerLibrary;
}

- (void)setWindowPerLibrary:(unsigned int)a3
{
  self->_windowPerLibrary = a3;
}

- (NSMutableSet)nextUpdateStartFull
{
  return self->_nextUpdateStartFull;
}

- (void)setNextUpdateStartFull:(id)a3
{
}

- (void).cxx_destruct
{
}

@end