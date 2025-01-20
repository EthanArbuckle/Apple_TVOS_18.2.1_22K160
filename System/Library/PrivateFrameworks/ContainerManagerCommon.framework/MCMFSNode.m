@interface MCMFSNode
- (BOOL)isDirectory;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToFSNode:(id)a3;
- (BOOL)isSymlink;
- (MCMFSNode)initWithINode:(unint64_t)a3 device:(int)a4 ctime:(timespec)a5 mtime:(timespec)a6 birthtime:(timespec)a7 isDirectory:(BOOL)a8 isSymlink:(BOOL)a9;
- (MCMFSNode)initWithStat:(stat *)a3;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (int)device;
- (timespec)birthtime;
- (timespec)ctime;
- (timespec)mtime;
- (unint64_t)hash;
- (unint64_t)inode;
@end

@implementation MCMFSNode

- (MCMFSNode)initWithINode:(unint64_t)a3 device:(int)a4 ctime:(timespec)a5 mtime:(timespec)a6 birthtime:(timespec)a7 isDirectory:(BOOL)a8 isSymlink:(BOOL)a9
{
  uint64_t tv_nsec = a6.tv_nsec;
  __darwin_time_t tv_sec = a6.tv_sec;
  uint64_t v11 = a5.tv_nsec;
  __darwin_time_t v12 = a5.tv_sec;
  uint64_t v17 = *MEMORY[0x1895F89C0];
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___MCMFSNode;
  result = -[MCMFSNode init](&v16, sel_init);
  if (result)
  {
    result->_device = a4;
    result->_inode = a3;
    result->_ctime.__darwin_time_t tv_sec = v12;
    result->_ctime.uint64_t tv_nsec = v11;
    result->_mtime.__darwin_time_t tv_sec = tv_sec;
    result->_mtime.uint64_t tv_nsec = tv_nsec;
    result->_birthtime = a7;
    result->_isDirectory = a8;
    result->_isSymlink = a9;
  }

  return result;
}

- (MCMFSNode)initWithStat:(stat *)a3
{
  if (a3)
  {
    int v3 = a3->st_mode & 0xF000;
    BYTE1(v6) = v3 == 40960;
    LOBYTE(v6) = v3 == 0x4000;
    self =  -[MCMFSNode initWithINode:device:ctime:mtime:birthtime:isDirectory:isSymlink:]( self,  "initWithINode:device:ctime:mtime:birthtime:isDirectory:isSymlink:",  a3->st_ino,  a3->st_dev,  a3->st_ctimespec.tv_sec,  a3->st_ctimespec.tv_nsec,  a3->st_mtimespec.tv_sec,  a3->st_mtimespec.tv_nsec,  a3->st_birthtimespec.tv_sec,  a3->st_birthtimespec.tv_nsec,  v6);
    v4 = self;
  }

  else
  {
    v4 = 0LL;
  }

  return v4;
}

- (NSString)description
{
  v20 = (void *)NSString;
  int v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v19 = -[MCMFSNode inode](self, "inode");
  uint64_t v18 = -[MCMFSNode device](self, "device");
  uint64_t v17 = -[MCMFSNode ctime](self, "ctime");
  -[MCMFSNode ctime](self, "ctime");
  uint64_t v6 = v5;
  uint64_t v7 = -[MCMFSNode mtime](self, "mtime");
  -[MCMFSNode mtime](self, "mtime");
  uint64_t v9 = v8;
  uint64_t v10 = -[MCMFSNode birthtime](self, "birthtime");
  -[MCMFSNode birthtime](self, "birthtime");
  uint64_t v12 = v11;
  if (-[MCMFSNode isDirectory](self, "isDirectory")) {
    v13 = @"YES";
  }
  else {
    v13 = @"NO";
  }
  if (-[MCMFSNode isSymlink](self, "isSymlink")) {
    v14 = @"YES";
  }
  else {
    v14 = @"NO";
  }
  objc_msgSend( v20,  "stringWithFormat:",  @"<%@: %p; inode = %llu, device = %d, ctime = %ld.%09ld, mtime = %ld.%09ld, birthtime = %ld.%09ld, isDirectory = %@, isSymlink = %@>",
    v4,
    self,
    v19,
    v18,
    v17,
    v6,
    v7,
    v9,
    v10,
    v12,
    v13,
    v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v15;
}

- (unint64_t)hash
{
  return self->_inode ^ self->_device ^ self->_isDirectory ^ (2LL * self->_isSymlink);
}

- (BOOL)isEqualToFSNode:(id)a3
{
  v4 = a3;
  BOOL v5 = self->_inode == v4[2]
    && self->_device == *((_DWORD *)v4 + 3)

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MCMFSNode *)a3;
  BOOL v5 = self == v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    BOOL v5 = -[MCMFSNode isEqualToFSNode:](self, "isEqualToFSNode:", v4);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (result)
  {
    *((void *)result + 2) = self->_inode;
    *((_DWORD *)result + 3) = self->_device;
    *(timespec *)((char *)result + 24) = self->_ctime;
    *(timespec *)((char *)result + 40) = self->_mtime;
    *(timespec *)((char *)result + 56) = self->_birthtime;
    *((_BYTE *)result + 8) = self->_isDirectory;
    *((_BYTE *)result + 9) = self->_isSymlink;
  }

  return result;
}

- (unint64_t)inode
{
  return self->_inode;
}

- (int)device
{
  return self->_device;
}

- (timespec)ctime
{
  __darwin_time_t tv_sec = self->_ctime.tv_sec;
  uint64_t tv_nsec = self->_ctime.tv_nsec;
  result.uint64_t tv_nsec = tv_nsec;
  result.__darwin_time_t tv_sec = tv_sec;
  return result;
}

- (timespec)mtime
{
  __darwin_time_t tv_sec = self->_mtime.tv_sec;
  uint64_t tv_nsec = self->_mtime.tv_nsec;
  result.uint64_t tv_nsec = tv_nsec;
  result.__darwin_time_t tv_sec = tv_sec;
  return result;
}

- (timespec)birthtime
{
  __darwin_time_t tv_sec = self->_birthtime.tv_sec;
  uint64_t tv_nsec = self->_birthtime.tv_nsec;
  result.uint64_t tv_nsec = tv_nsec;
  result.__darwin_time_t tv_sec = tv_sec;
  return result;
}

- (BOOL)isDirectory
{
  return self->_isDirectory;
}

- (BOOL)isSymlink
{
  return self->_isSymlink;
}

@end