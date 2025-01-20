@interface NSObserverList
@end

@implementation NSObserverList

size_t __59___NSObserverList__copyObserversOfObject_creatingIfAbsent___block_invoke()
{
  qword_18C4972C8 = objc_opt_class();
  size_t result = class_getInstanceSize((Class)qword_18C4972C8);
  qword_18C4972C0 = result;
  return result;
}

size_t __48___NSObserverList_destroyObserverListForObject___block_invoke(uint64_t a1)
{
  size_t result = class_getInstanceSize(*(Class *)(a1 + 32));
  qword_18C4972D8 = result;
  return result;
}

void __31___NSObserverList__receiveBox___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  v22[1] = *MEMORY[0x1895F89C0];
  if (a3 < 2)
  {
    if (!a3) {
      return;
    }
    int v6 = 0;
  }

  else if ([*(id *)(a1 + 32) _isToManyChangeInformation])
  {
    int v6 = 1;
  }

  else
  {
    int v6 = [*(id *)(*(void *)(a1 + 32) + 8) conformsToProtocol:&unk_18C6509F8];
  }

  uint64_t v7 = 0LL;
  do
  {
    if (*(void *)(a2 + 8 * v7))
    {
      v8 = *(void **)(*(void *)(a1 + 32) + 8LL);
      if (v6) {
        id v9 = (id)[v8 copyWithZone:0];
      }
      else {
        id v9 = v8;
      }
      v10 = v9;
      int v11 = *(_DWORD *)(*(void *)(a1 + 32) + 24LL);
      uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8LL);
      v17[0] = MEMORY[0x1895F87A8];
      v17[1] = 3221225472LL;
      v18 = __31___NSObserverList__receiveBox___block_invoke_2;
      v19 = &__block_descriptor_48_e25_v16__0__NSObservedValue_8l;
      uint64_t v20 = a2;
      uint64_t v21 = v7;
      uint64_t StackObservedValueClassAndBoxSize = getStackObservedValueClassAndBoxSize(v22);
      MEMORY[0x1895F8858](StackObservedValueClassAndBoxSize);
      v16 = objc_constructInstance(v15, (char *)v17 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL));
      v16[6] = v11;
      *((void *)v16 + 1) = v10;
      *((void *)v16 + 2) = v12;
      v18((uint64_t)v17, (uint64_t)v16);
    }

    ++v7;
  }

  while (a3 != v7);
}

uint64_t __31___NSObserverList__receiveBox___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 8 * *(void *)(a1 + 40)) _receiveBox:a2];
}

uint64_t __30___NSObserverList_description__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  int v6 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = [a2 count];
  uint64_t result = -[NSString initWithFormat:]( v6,  "initWithFormat:",  @"%@(%p) of %lu observers of %@: %@",  v7,  v8,  v9,  *(void *)(*(void *)(a1 + 32) + 8),  [MEMORY[0x189603F18] arrayWithObjects:a2 count:a3]);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) = result;
  return result;
}

@end