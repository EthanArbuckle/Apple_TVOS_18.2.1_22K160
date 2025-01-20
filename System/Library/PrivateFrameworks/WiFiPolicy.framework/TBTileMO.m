@interface TBTileMO
+ (id)entityName;
+ (id)fetchRequest;
+ (id)generateNewTileObjectFromMOC:(id)a3;
+ (void)removeAllTilesInMOC:(id)a3;
+ (void)removeTilesUsingPredicate:(id)a3 moc:(id)a4;
@end

@implementation TBTileMO

+ (id)entityName
{
  return @"Tile";
}

+ (id)generateNewTileObjectFromMOC:(id)a3
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x1895BA820]();
  uint64_t v11 = 0LL;
  v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  v14 = __Block_byref_object_copy__3;
  v15 = __Block_byref_object_dispose__3;
  id v16 = 0LL;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __41__TBTileMO_generateNewTileObjectFromMOC___block_invoke;
  v8[3] = &unk_18A16D900;
  v10 = &v11;
  id v5 = v3;
  id v9 = v5;
  [v5 performBlockAndWait:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  objc_autoreleasePoolPop(v4);

  return v6;
}

void __41__TBTileMO_generateNewTileObjectFromMOC___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1896024D0];
  +[TBTileMO entityName](&OBJC_CLASS___TBTileMO, "entityName");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 insertNewObjectForEntityForName:v6 inManagedObjectContext:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

+ (void)removeTilesUsingPredicate:(id)a3 moc:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x1895BA820]();
  [a1 fetchRequest];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 setPredicate:v6];
  v10 = (void *)[objc_alloc(MEMORY[0x1896024B0]) initWithFetchRequest:v9];
  [v10 setResultType:2];
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __42__TBTileMO_removeTilesUsingPredicate_moc___block_invoke;
  v14[3] = &unk_18A16D218;
  id v11 = v7;
  id v15 = v11;
  id v16 = v10;
  id v13 = v6;
  id v17 = v13;
  id v12 = v10;
  [v11 performBlockAndWait:v14];

  objc_autoreleasePoolPop(v8);
}

void __42__TBTileMO_removeTilesUsingPredicate_moc___block_invoke(void *a1)
{
  v2 = (void *)MEMORY[0x1895BA820]();
  uint64_t v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  id v9 = 0LL;
  [v3 executeRequest:v4 error:&v9];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = v9;
  [v5 result];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 unsignedIntegerValue];

  NSLog( @"%s: Removed %lu tiles that match supplied predicate <%@>",  "+[TBTileMO removeTilesUsingPredicate:moc:]_block_invoke",  v8,  a1[6]);
  objc_autoreleasePoolPop(v2);
}

+ (void)removeAllTilesInMOC:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x1895BA820]();
  id v5 = objc_alloc(MEMORY[0x1896024B0]);
  +[TBTileMO fetchRequest](&OBJC_CLASS___TBTileMO, "fetchRequest");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = (void *)[v5 initWithFetchRequest:v6];

  [v7 setResultType:2];
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __32__TBTileMO_removeAllTilesInMOC___block_invoke;
  v10[3] = &unk_18A16C748;
  id v9 = v3;
  id v11 = v9;
  id v12 = v7;
  id v8 = v7;
  [v9 performBlockAndWait:v10];

  objc_autoreleasePoolPop(v4);
}

void __32__TBTileMO_removeAllTilesInMOC___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1895BA820]();
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v10 = 0LL;
  [v3 executeRequest:v4 error:&v10];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = v10;
  id v7 = v6;
  if (v6)
  {
    NSLog(@"%s: error %@", "+[TBTileMO removeAllTilesInMOC:]_block_invoke", v6);
  }

  else
  {
    [v5 result];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v8 unsignedIntegerValue];

    NSLog(@"%s: Removed %lu tiles", "+[TBTileMO removeAllTilesInMOC:]_block_invoke", v9);
  }

  objc_autoreleasePoolPop(v2);
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1896024E8] fetchRequestWithEntityName:@"Tile"];
}

@end