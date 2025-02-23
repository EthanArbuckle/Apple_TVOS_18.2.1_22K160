@interface PFRoutines
@end

@implementation PFRoutines

uint64_t __25___PFRoutines_initialize__block_invoke()
{
  return objc_opt_self();
}

void __29___PFRoutines__frameworkHash__block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8,  uint64_t a9)
{
  uint32_t v9 = _dyld_image_count();
  if (!v9) {
    goto LABEL_6;
  }
  uint32_t v16 = v9;
  uint32_t v17 = 0;
  while (1)
  {
    image_name = _dyld_get_image_name(v17);
    size_t v19 = strlen(image_name);
    if (v19 >= 8 && !strncmp("CoreData", &image_name[v19 - 8], 8uLL)) {
      break;
    }
    if (v16 == ++v17) {
      goto LABEL_6;
    }
  }

  image_header = _dyld_get_image_header(v17);
  if (!image_header)
  {
LABEL_6:
    _NSCoreDataLog(1LL, (uint64_t)@" Can't find CoreData image header.", v10, v11, v12, v13, v14, v15, a9);
    return;
  }

  uint32_t ncmds = image_header->ncmds;
  if (!ncmds)
  {
LABEL_12:
    if (qword_18C4AB8D8) {
      return;
    }
    goto LABEL_13;
  }

  v22 = (_DWORD *)(((unint64_t)&image_header[1].cputype + 3) & 0xFFFFFFFFFFFFFFF8LL);
  while (*v22 != 27)
  {
    v22 = (_DWORD *)((char *)v22 + v22[1]);
    if (!--ncmds) {
      goto LABEL_12;
    }
  }

  qword_18C4AB8D8 = [objc_alloc(MEMORY[0x189603F48]) initWithBytes:v22 + 2 length:(v22[1] - 8)];
  if (!qword_18C4AB8D8)
  {
LABEL_13:
    NSLog((NSString *)@"Can't find the hash for some reason, using empty data");
    qword_18C4AB8D8 = (uint64_t)(id)[MEMORY[0x189603F48] data];
  }

uint64_t __41___PFRoutines__groupObjectsByRootEntity___block_invoke()
{
  return 1LL;
}

uint64_t __46___PFRoutines_attributeClassesForSecureCoding__block_invoke()
{
  id v15 = objc_alloc(MEMORY[0x189604010]);
  uint64_t v14 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v0 = objc_opt_class();
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t result = objc_msgSend( v15,  "initWithObjects:",  v14,  v13,  v12,  v11,  v0,  v1,  v2,  v3,  v4,  v5,  v6,  v7,  v8,  v9,  objc_opt_class(),  0);
  qword_18C4AB8E0 = result;
  return result;
}

uint64_t __61___PFRoutines_xpcStoreArchiverObjectIDClassesForSecureCoding__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x189604010]);
  uint64_t v1 = objc_opt_class();
  uint64_t result = objc_msgSend(v0, "initWithObjects:", v1, objc_opt_class(), 0);
  qword_18C4AB8F0 = result;
  return result;
}

uint64_t __56___PFRoutines_historyChangesArrayClassesForSecureCoding__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x189604010]);
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t result = objc_msgSend(v0, "initWithObjects:", v1, v2, objc_opt_class(), 0);
  qword_18C4AB900 = result;
  return result;
}

uint64_t __56___PFRoutines_historyQueryGenDataClassesForSecureCoding__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x189604010]);
  uint64_t v1 = objc_opt_class();
  uint64_t result = objc_msgSend(v0, "initWithObjects:", v1, objc_opt_class(), 0);
  qword_18C4AB910 = result;
  return result;
}

uint64_t __42___PFRoutines_plistClassesForSecureCoding__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x189604010]);
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t result = objc_msgSend(v0, "initWithObjects:", v1, v2, v3, v4, v5, v6, v7, objc_opt_class(), 0);
  qword_18C4AB920 = result;
  return result;
}

void __67___PFRoutines_fetchHeterogeneousCollectionByObjectIDs_intoContext___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  if (a2)
  {
    uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSFetchRequest);
    -[NSFetchRequest setEntity:](v7, "setEntity:", a2);
    -[NSFetchRequest setIncludesSubentities:](v7, "setIncludesSubentities:", 1LL);
    -[NSFetchRequest setIncludesPendingChanges:](v7, "setIncludesPendingChanges:", 0LL);
    -[NSFetchRequest setReturnsObjectsAsFaults:](v7, "setReturnsObjectsAsFaults:", 0LL);
    -[NSFetchRequest setPredicate:]( v7,  "setPredicate:",  [MEMORY[0x1896079C8] predicateWithFormat:@"self IN %@", a3]);
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __67___PFRoutines_fetchHeterogeneousCollectionByObjectIDs_intoContext___block_invoke_2;
    v8[3] = &unk_189EA72B0;
    uint64_t v6 = *(void *)(a1 + 40);
    id v9 = *(id *)(a1 + 32);
    uint64_t v10 = v7;
    uint64_t v11 = v6;
    if ([v9 concurrencyType] == 1 || objc_msgSend(*(id *)(a1 + 32), "concurrencyType") == 2) {
      [*(id *)(a1 + 32) performBlockAndWait:v8];
    }
    else {
      __67___PFRoutines_fetchHeterogeneousCollectionByObjectIDs_intoContext___block_invoke_2((uint64_t)v8);
    }
  }

uint64_t __67___PFRoutines_fetchHeterogeneousCollectionByObjectIDs_intoContext___block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1896077E8]);
  uint64_t v5 = 0LL;
  uint64_t v3 = [*(id *)(a1 + 32) executeFetchRequest:*(void *)(a1 + 40) error:&v5];
  if (v3) {
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObjectsFromArray:v3];
  }
  return [v2 drain];
}

@end