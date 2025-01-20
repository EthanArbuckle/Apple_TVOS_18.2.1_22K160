LABEL_978:
    objc_autoreleasePoolPop(v1062);
    v1067 = (char *)v1067 + 1;
    if (v1067 == (void *)v1052)
    {
      v1052 = [v1047 countByEnumeratingWithState:&v1146 objects:v1288 count:16];
      if (!v1052) {
        goto LABEL_980;
      }
      goto LABEL_908;
    }
  }

  if (*(_BYTE *)(v1141 + 64))
  {
    v971 = [v1072 name];
    _NSCoreDataLog( 4LL,  (uint64_t)@"Executing inferred mapping validation: %@",  v972,  v973,  v974,  v975,  v976,  v977,  v971);
  }

  v979 = *(void *)(v1141 + 32);
  v978 = *(void *)(v1141 + 40);
  if (!v979) {
    goto LABEL_993;
  }
  v1044 = *(void **)(v978 + 8);
  v980 = (id *)objc_msgSend(*(id *)(v979 + 16), "entityNamed:", objc_msgSend(v1072, "destinationEntityName"));
  v1361 = 0u;
  v1360 = 0u;
  v1359 = 0u;
  v1358 = 0u;
  v981 = (void *)[v1072 attributeMappings];
  v982 = [v981 countByEnumeratingWithState:&v1358 objects:&v1372 count:16];
  if (!v982)
  {
LABEL_945:
    v1353 = 0u;
    v1352 = 0u;
    v1351 = 0u;
    v1350 = 0u;
    v994 = (void *)[v1072 relationshipMappings];
    v995 = [v994 countByEnumeratingWithState:&v1350 objects:&v1366 count:16];
    if (!v995) {
      goto LABEL_978;
    }
    v1094 = *(id *)v1351;
    objf = v994;
    while (1)
    {
      v996 = 0LL;
      v1107 = (char *)v995;
      do
      {
        if (*(id *)v1351 != v1094) {
          objc_enumerationMutation(v994);
        }
        v997 = *(void **)(*((void *)&v1350 + 1) + 8LL * (void)v996);
        v1346 = 0u;
        v1347 = 0u;
        v1348 = 0u;
        v1349 = 0u;
        if (v997) {
          v998 = (void *)v997[2];
        }
        else {
          v998 = 0LL;
        }
        v999 = [v998 countByEnumeratingWithState:&v1346 objects:&v1362 count:16];
        v1124 = v996;
        if (v999)
        {
          v1000 = *(void *)v1347;
          do
          {
            v1001 = 0LL;
            do
            {
              if (*(void *)v1347 != v1000) {
                objc_enumerationMutation(v998);
              }
              if (![*(id *)(*((void *)&v1346 + 1) + 8 * v1001) isEqualToString:NSPropertyTransformMandatoryPropertyValidation])
              {
                v1024 = (void *)MEMORY[0x189603F70];
                v1025 = [MEMORY[0x189603F68] dictionaryWithObject:v997 forKey:@"propertyMapping"];
                goto LABEL_989;
              }

              v1002 = [v997 name];
              if (!v980
                || (v1003 = (__CFString *)[v980[5] objectForKey:v1002], (v1004 = v1003) == 0))
              {
                if (([0 isToMany] & 1) == 0) {
                  goto LABEL_969;
                }
                v1004 = 0LL;
                length = 0LL;
                goto LABEL_965;
              }

              if (LOBYTE(v1003->length) == 7)
              {
                if (-[_NSSQLiteStoreMigrator _countNullsInColumn:forEntity:]( v979,  (void *)-[__CFString foreignKey](v1003, "foreignKey"),  (uint64_t)v980) >= 1)
                {
                  v1026 = (void *)MEMORY[0x189607870];
                  v1027 = objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  @"Validation error missing attribute values on mandatory destination relationship",  @"reason",  objc_msgSend(v980, "name"),  @"entity",  -[__CFString name](v1004, "name"),  @"attribute",  0);
                  goto LABEL_992;
                }

                goto LABEL_969;
              }

              if (-[__CFString isToMany](v1003, "isToMany"))
              {
                length = (void *)v1004[1].length;
LABEL_965:
                if (-[_NSSQLiteStoreMigrator _countUnreferencedPrimaryKeysForEntity:inForeignKeyColumnName:fromTable:]( v979,  (uint64_t)v980,  objc_msgSend((id)objc_msgSend(length, "foreignKey"), "columnName"),  objc_msgSend((id)-[__CFString destinationEntity](v1004, "destinationEntity"), "tableName")) >= 1) {
                  goto LABEL_991;
                }
                goto LABEL_969;
              }

              if (LOBYTE(v1004->length) == 9)
              {
                v1006 = -[NSSQLManyToMany inverseColumnName](v1004);
                if (-[_NSSQLiteStoreMigrator _countUnreferencedPrimaryKeysForEntity:inForeignKeyColumnName:fromTable:]( v979,  (uint64_t)v980,  (uint64_t)v1006,  -[__CFString correlationTableName](v1004, "correlationTableName")) >= 1)
                {
LABEL_991:
                  v1026 = (void *)MEMORY[0x189607870];
                  v1027 = objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  @"Validation error missing relationship values on mandatory destination destination",  @"reason",  objc_msgSend(v980, "name"),  @"entity",  -[__CFString name](v1004, "name"),  @"relationship",  0);
                  goto LABEL_992;
                }
              }

LABEL_969:
              ++v1001;
            }

            while (v999 != v1001);
            v1007 = [v998 countByEnumeratingWithState:&v1346 objects:&v1362 count:16];
            v999 = v1007;
          }

          while (v1007);
        }

        v996 = v1124 + 1;
        v994 = objf;
      }

      while (v1124 + 1 != v1107);
      v995 = [objf countByEnumeratingWithState:&v1350 objects:&v1366 count:16];
      if (!v995) {
        goto LABEL_978;
      }
    }
  }

  v1093 = *(id *)v1359;
  obje = v981;
LABEL_918:
  v1106 = (id)v982;
  v1123 = 0LL;
  while (1)
  {
    if (*(id *)v1359 != v1093) {
      objc_enumerationMutation(v981);
    }
    v983 = *(void **)(*((void *)&v1358 + 1) + 8LL * (void)v1123);
    v1354 = 0u;
    v1355 = 0u;
    v1356 = 0u;
    v1357 = 0u;
    v984 = v983 ? (void *)v983[2] : 0LL;
    v985 = [v984 countByEnumeratingWithState:&v1354 objects:&v1370 count:16];
    if (v985) {
      break;
    }
LABEL_941:
    v1123 = (char *)v1123 + 1;
    v981 = obje;
    if (v1123 == v1106)
    {
      v993 = [obje countByEnumeratingWithState:&v1358 objects:&v1372 count:16];
      v982 = v993;
      if (!v993) {
        goto LABEL_945;
      }
      goto LABEL_918;
    }
  }

  v986 = *(void *)v1355;
LABEL_925:
  v987 = 0LL;
  while (1)
  {
    if (*(void *)v1355 != v986) {
      objc_enumerationMutation(v984);
    }
    if (![*(id *)(*((void *)&v1354 + 1) + 8 * v987) isEqualToString:NSPropertyTransformMandatoryPropertyValidation])
    {
      v1024 = (void *)MEMORY[0x189603F70];
      v1025 = [MEMORY[0x189603F68] dictionaryWithObject:v983 forKey:@"propertyMapping"];
LABEL_989:
      objc_exception_throw((id)[v1024 exceptionWithName:*MEMORY[0x189603A58] reason:@"Unrecognized transform validation in property mapping" userInfo:v1025]);
      goto LABEL_1015;
    }

    v988 = [v983 name];
    if (v980) {
      v989 = (void *)[v980[5] objectForKey:v988];
    }
    else {
      v989 = 0LL;
    }
    v990 = (void *)[v989 propertyDescription];
    if (v990 && [v990 superCompositeAttribute])
    {
      v991 = (void *)objc_msgSend((id)objc_msgSend(v989, "propertyDescription"), "superCompositeAttribute");
      while (([v991 isOptional] & 1) == 0)
      {
        v991 = (void *)[v991 superCompositeAttribute];
        if (!v991) {
          goto LABEL_936;
        }
      }

      goto LABEL_937;
    }

LABEL_936:
LABEL_937:
    if (++v987 == v985)
    {
      v992 = [v984 countByEnumeratingWithState:&v1354 objects:&v1370 count:16];
      v985 = v992;
      if (!v992) {
        goto LABEL_941;
      }
      goto LABEL_925;
    }
  }

  v1026 = (void *)MEMORY[0x189607870];
  v1027 = objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  @"Validation error missing attribute values on mandatory destination attribute",  @"reason",  objc_msgSend(v980, "name"),  @"entity",  objc_msgSend(v989, "name"),  @"attribute",  0);
LABEL_992:
  v1044[5] = [v1026 errorWithDomain:*MEMORY[0x189607460] code:134110 userInfo:v1027];
  v978 = *(void *)(v1141 + 40);
LABEL_993:
  v1028 = *(id *)(*(void *)(v978 + 8) + 40LL);
  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:@"validation error" reason:@"validation failed" userInfo:0]);
LABEL_1015:
  __break(1u);
}

void sub_186845138()
{
}

void sub_186845A3C(_Unwind_Exception *a1)
{
}

void sub_18684656C(void *a1)
{
}

void sub_186846580(_Unwind_Exception *a1)
{
}

void sub_1868467C4(void *a1)
{
}

void sub_1868467D8(_Unwind_Exception *a1)
{
}

void sub_1868492BC(uint64_t a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x18684928CLL);
  }

  JUMPOUT(0x186849270LL);
}

void __Block_byref_object_copy__35(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__35(uint64_t a1)
{
}

void sub_18684A95C( _Unwind_Exception *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21)
{
  if (a2)
  {
    objc_begin_catch(exc_buf);
    JUMPOUT(0x18684A7CCLL);
  }

  _Unwind_Resume(exc_buf);
}

void sub_18684ADFC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
}

LABEL_143:
                  v131 = *(void *)(v374 + 48);
                  v132 = -[NSManagedObject objectID](v375, "objectID");
                  if (v131
                    && (objc_msgSend( (id)objc_msgSend(*(id *)(v131 + 48), "objectForKey:", v132),  "containsObject:",  v57) & 1) != 0)
                  {
                    v133 = [v56 usesMergeableStorage];
                    v134 = (void *)MEMORY[0x186E3E5D8]();
                    if (v133)
                    {
                      objc_msgSend(v63, "merge:", -[NSManagedObject valueForKey:](v375, "valueForKey:", v57));
                      v135 = [v63 copy];

                      -[NSManagedObject setValue:forKey:](v375, "setValue:forKey:", v135, v57);
                      objc_autoreleasePoolPop(v134);
                      v110 = v361;
                      v63 = (id)v135;
                      goto LABEL_153;
                    }

                    else {
                      v136 = __ckLoggingOverride;
                    }
                    v137 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Importer is rejecting updated value for '%@' on '%@' because there are pending local edits that haven't been exported yet."];
                    -[NSManagedObject objectID](v375, "objectID");
                    _NSCoreDataLog( v136,  v137,  v138,  v139,  v140,  v141,  v142,  v143,  (uint64_t)"-[PFCloudKitSerializer updateAttributes:andRelationships:onManagedObject:fromRecord:withR ecordMetadata:importContext:error:]");
                    objc_autoreleasePoolPop(v134);
                  }

                  else
                  {
                    -[NSManagedObject setValue:forKey:](v375, "setValue:forKey:", v63, v57);
                  }

                  v110 = v361;
LABEL_153:

                  if ((v110 & 1) == 0)
                  {
                    v49 = v355;
                    if (!v420)
                    {
                      v191 = [NSString stringWithUTF8String:"Attribute serialization failed but did not set an error: %@.%@"];
                      v192 = objc_msgSend((id)objc_msgSend(v56, "entity"), "name");
                      [v56 name];
                      _NSCoreDataLog(17LL, v191, v193, v194, v195, v196, v197, v198, v192);
                      v199 = (os_log_s *)__pflogFaultLog;
                      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                      {
                        v262 = objc_msgSend((id)objc_msgSend(v56, "entity"), "name");
                        v263 = [v56 name];
                        *(_DWORD *)buf = 138412546;
                        *(void *)&buf[4] = v262;
                        v429 = 2112;
                        v430 = (NSManagedObject *)v263;
                        _os_log_fault_impl( &dword_186681000,  v199,  OS_LOG_TYPE_FAULT,  "CoreData: Attribute serialization failed but did not set an error: %@.%@",  buf,  0x16u);
                      }
                    }

LABEL_184:
                    if ((v361 & 1) != 0)
                    {
LABEL_185:
                      v200 = v372;
                      if (!v372) {
                        v200 = -[NSDictionary allValues]( -[NSEntityDescription relationshipsByName]( -[NSManagedObject entity](v375, "entity"),  "relationshipsByName"),  "allValues");
                      }
                      v414 = 0u;
                      v415 = 0u;
                      v412 = 0u;
                      v413 = 0u;
                      v373 = v200;
                      v201 = -[NSArray countByEnumeratingWithState:objects:count:]( v200,  "countByEnumeratingWithState:objects:count:",  &v412,  v427,  16LL);
                      if (v201)
                      {
                        v202 = *(void *)v413;
                        do
                        {
                          for (i = 0LL; i != v201; ++i)
                          {
                            if (*(void *)v413 != v202) {
                              objc_enumerationMutation(v373);
                            }
                            v204 = *(void **)(*((void *)&v412 + 1) + 8 * i);
                            if ((![v204 isToMany]
                               || (objc_msgSend((id)objc_msgSend(v204, "inverseRelationship"), "isToMany") & 1) == 0)
                              && ([v204 isToMany] & 1) == 0)
                            {
                              v205 = *(void *)(v374 + 48);
                              v206 = [v204 name];
                              v207 = -[NSManagedObject objectID](v375, "objectID");
                              if (v205
                                && (objc_msgSend( (id)objc_msgSend(*(id *)(v205 + 48), "objectForKey:", v207),  "containsObject:",  v206) & 1) != 0)
                              {
                                v208 = (void *)MEMORY[0x186E3E5D8]();
                                else {
                                  v209 = __ckLoggingOverride;
                                }
                                v210 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Importer is rejecting updated value for '%@' on '%@' because there are pending local edits that haven't been exported yet."];
                                [v204 name];
                                -[NSManagedObject objectID](v375, "objectID");
                                _NSCoreDataLog( v209,  v210,  v211,  v212,  v213,  v214,  v215,  v216,  (uint64_t)"-[PFCloudKitSerializer updateAttributes:andRelationships:onManagedObject:from Record:withRecordMetadata:importContext:error:]");
                                objc_autoreleasePoolPop(v208);
                              }

                              else
                              {
                                v217 = [v204 name];
                                v218 = (void *)v217;
                                if (v368)
                                {
                                  objc_opt_self();
                                  v218 = (void *)[@"CD_" stringByAppendingString:v217];
                                }

                                v219 = [*(id *)(v374 + 24) useDeviceToDeviceEncryption];
                                v220 = v371;
                                if (v219)
                                {
                                  v221 = [v218 hasSuffix:@"_ckAsset"];
                                  v220 = v371;
                                  if ((v221 & 1) == 0) {
                                    v220 = (void *)[v371 encryptedValues];
                                  }
                                }

                                v222 = [v220 objectForKey:v218];
                                if (v222)
                                {
                                  v223 = (void *)-[NSCKRecordMetadata createRecordID](v367);
                                  v224 = (void *)objc_msgSend( objc_alloc(getCloudKitCKRecordIDClass()),  "initWithRecordName:zoneID:",  v222,  objc_msgSend(v223, "zoneID"));
                                  v225 = (void *)MEMORY[0x186E3E5D8]();
                                  else {
                                    v226 = __ckLoggingOverride;
                                  }
                                  v227 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Adding mirrored relationship to link for record %@ related to %@ by %@"];
                                  [v204 name];
                                  _NSCoreDataLog( v226,  v227,  v228,  v229,  v230,  v231,  v232,  v233,  (uint64_t)"-[PFCloudKitSerializer updateAttributes:andRelationships:onManagedObject:fr omRecord:withRecordMetadata:importContext:error:]");
                                  objc_autoreleasePoolPop(v225);
                                  v234 = +[PFMirroredRelationship mirroredRelationshipWithManagedObject:withRecordID:relatedToObjectWithRecordID:byRelationship:]( (uint64_t)&OBJC_CLASS___PFMirroredRelationship,  (uint64_t)v375,  (uint64_t)v223,  (uint64_t)v224,  (uint64_t)v204);
                                  -[PFCloudKitImportZoneContext addMirroredRelationshipToLink:](v370, v234);
                                }

                                else if (([v204 isTransient] & 1) == 0)
                                {
                                  -[NSManagedObject setValue:forKey:](v375, "setValue:forKey:", 0LL, v217);
                                }
                              }
                            }
                          }

                          v201 = -[NSArray countByEnumeratingWithState:objects:count:]( v373,  "countByEnumeratingWithState:objects:count:",  &v412,  v427,  16LL);
                        }

                        while (v201);
                      }

                      goto LABEL_221;
                    }

LABEL_216:
                    if (v420)
                    {
                      *(void *)(v49 + 40) = v420;
                    }

                    else
                    {
                      v235 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
                      _NSCoreDataLog( 17LL,  v235,  v236,  v237,  v238,  v239,  v240,  v241,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitSerializer.m");
                      v242 = (os_log_s *)__pflogFaultLog;
                      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                      {
                        *(_DWORD *)buf = 136315394;
                        *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitSerializer.m";
                        v429 = 1024;
                        LODWORD(v430) = 1519;
                        _os_log_fault_impl( &dword_186681000,  v242,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
                      }
                    }

LABEL_221:
            if (*(_BYTE *)(*(void *)(*(void *)(v376 + 96) + 8LL) + 24LL))
            {
              v244 = *(void *)(v376 + 40);
              if (v244)
              {
                v245 = v371;
              }

              else
              {
                v245 = 0LL;
              }

              objc_opt_self();
              v246 = (id)objc_msgSend( v245,  "objectForKey:",  objc_msgSend(@"CD_", "stringByAppendingString:", @"moveReceipt"));
              if (v246)
              {
LABEL_226:
                if (*(_BYTE *)(*(void *)(*(void *)(v376 + 96) + 8LL) + 24LL)
                  && (-[NSManagedObject mergeMoveReceiptsWithData:error:]( v367,  "mergeMoveReceiptsWithData:error:",  v246,  *(void *)(*(void *)(v376 + 88) + 8LL) + 40LL) & 1) == 0)
                {
                  *(_BYTE *)(*(void *)(*(void *)(v376 + 96) + 8LL) + 24LL) = 0;
                  v247 = *(id *)(*(void *)(*(void *)(v376 + 88) + 8LL) + 40LL);
                }
              }

              else
              {
                objc_opt_self();
                v248 = (void *)[@"CD_" stringByAppendingString:@"moveReceipt"];
                objc_opt_self();
                v249 = objc_msgSend( v371,  "objectForKey:",  objc_msgSend(v248, "stringByAppendingString:", @"_ckAsset"));
                if (v249)
                {
                  v250 = [WeakRetained cloudKitSerializer:*(void *)(v376 + 40) safeSaveURLForAsset:v249];
                  v246 = (id)[objc_alloc(MEMORY[0x189603F48]) initWithContentsOfURL:v250 options:0 error:*(void *)(*(void *)(v376 + 88) + 8) + 40];
                  if (v246) {
                    goto LABEL_226;
                  }
                  v251 = (void *)MEMORY[0x186E3E5D8]();
                  v252 = __ckLoggingOverride;
                  v253 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Error attempting to read move receipt CKAsset file: %@"];
                  _NSCoreDataLog( v252 != 0,  v253,  v254,  v255,  v256,  v257,  v258,  v259,  (uint64_t)"-[PFCloudKitSerializer applyUpdatedRecords:deletedRecordIDs:toStore:inManagedObjectContext: onlyUpdatingAttributes:andRelationships:madeChanges:error:]_block_invoke");
                  objc_autoreleasePoolPop(v251);
                  *(_BYTE *)(*(void *)(*(void *)(v376 + 96) + 8LL) + 24LL) = 0;
                  v260 = *(id *)(*(void *)(*(void *)(v376 + 88) + 8LL) + 40LL);
                }

                v246 = 0LL;
              }
            }
          }

          else
          {
            v19 = (void *)MEMORY[0x186E3E5D8]();
            else {
              v20 = __ckLoggingOverride;
            }
            v21 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Skipping record because its entity '%@' is no longer in the managed object model's configured entities: %@\n%@"];
            [v360 allKeys];
            _NSCoreDataLog( v20,  v21,  v22,  v23,  v24,  v25,  v26,  v27,  (uint64_t)"-[PFCloudKitSerializer applyUpdatedRecords:deletedRecordIDs:toStore:inManagedObjectContext:onlyUp datingAttributes:andRelationships:madeChanges:error:]_block_invoke");
            objc_autoreleasePoolPop(v19);
          }

LABEL_234:
          v261 = *(unsigned __int8 *)(*(void *)(*(void *)(v376 + 96) + 8LL) + 24LL);
          objc_autoreleasePoolPop(context);
          if (!v261) {
            goto LABEL_241;
          }
          ++v366;
        }

        while (v366 != v359);
        v264 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v407,  v426,  16LL);
        v359 = v264;
      }

      while (v264);
    }

LABEL_263:
  v277 = *(void *)(v376 + 96);
  if (!*(_BYTE *)(*(void *)(v277 + 8) + 24LL)) {
    goto LABEL_270;
  }
  v278 = -[PFCloudKitImportZoneContext linkInsertedObjectsAndMetadataInContext:error:]( v370,  *(void **)(v376 + 32),  (uint64_t *)(*(void *)(*(void *)(v376 + 88) + 8LL) + 40LL));
  v279 = v376;
  *(_BYTE *)(*(void *)(*(void *)(v376 + 96) + 8LL) + 24LL) = v278;
  if (*(_BYTE *)(*(void *)(*(void *)(v376 + 96) + 8LL) + 24LL))
  {
    v280 = [*(id *)(v376 + 32) save:*(void *)(*(void *)(v376 + 88) + 8) + 40];
    v277 = *(void *)(v376 + 96);
    if ((v280 & 1) != 0) {
      goto LABEL_270;
    }
    *(_BYTE *)(*(void *)(v277 + 8) + 24LL) = 0;
    v279 = v376;
  }

  v281 = *(id *)(*(void *)(*(void *)(v279 + 88) + 8LL) + 40LL);
  v277 = *(void *)(v376 + 96);
LABEL_270:
  if (*(_BYTE *)(*(void *)(v277 + 8) + 24LL))
  {
    v282 = v370 ? *(void **)(v370 + 48) : 0LL;
    v394[0] = MEMORY[0x1895F87A8];
    v394[1] = 3221225472LL;
    v394[2] = __150__PFCloudKitSerializer_applyUpdatedRecords_deletedRecordIDs_toStore_inManagedObjectContext_onlyUpdatingAttributes_andRelationships_madeChanges_error___block_invoke_2_62;
    v394[3] = &unk_189EAAC68;
    v283 = *(void *)(v376 + 32);
    v284 = *(void *)(v376 + 40);
    v394[4] = v370;
    v394[5] = v283;
    v394[6] = WeakRetained;
    v394[7] = v284;
    [v282 enumerateObjectsUsingBlock:v394];
    if (*(_BYTE *)(*(void *)(*(void *)(v376 + 96) + 8LL) + 24LL))
    {
      if (!-[PFCloudKitImportZoneContext populateUnresolvedIDsInStore:withManagedObjectContext:error:]( v370,  *(void *)(v376 + 48),  *(void **)(v376 + 32),  (void *)(*(void *)(*(void *)(v376 + 88) + 8LL) + 40LL))) {
        goto LABEL_354;
      }
      if (v370) {
        v285 = (id)[*(id *)(v370 + 40) copy];
      }
      else {
        v285 = 0LL;
      }
      v388[0] = MEMORY[0x1895F87A8];
      v388[1] = 3221225472LL;
      v388[2] = __150__PFCloudKitSerializer_applyUpdatedRecords_deletedRecordIDs_toStore_inManagedObjectContext_onlyUpdatingAttributes_andRelationships_madeChanges_error___block_invoke_3;
      v388[3] = &unk_189EAAC90;
      v389 = *(_OWORD *)(v376 + 40);
      v286 = *(void *)(v376 + 32);
      v393 = vextq_s8(*(int8x16_t *)(v376 + 88), *(int8x16_t *)(v376 + 88), 8uLL);
      v390 = v286;
      v391 = v370;
      v392 = WeakRetained;
      [v285 enumerateObjectsUsingBlock:v388];
      if (*(_BYTE *)(*(void *)(*(void *)(v376 + 96) + 8LL) + 24LL))
      {
        if ([*(id *)(v376 + 32) hasChanges])
        {
          **(_BYTE **)(v376 + 104) = 1;
          if (([*(id *)(v376 + 32) save:*(void *)(*(void *)(v376 + 88) + 8) + 40] & 1) == 0)
          {
            *(_BYTE *)(*(void *)(*(void *)(v376 + 96) + 8LL) + 24LL) = 0;
            v287 = *(id *)(*(void *)(*(void *)(v376 + 88) + 8LL) + 40LL);
          }
        }
      }

      if (*(_BYTE *)(*(void *)(*(void *)(v376 + 96) + 8LL) + 24LL))
      {
        v288 = +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  +[NSCKImportPendingRelationship entityPath]());
        -[NSFetchRequest setFetchBatchSize:](v288, "setFetchBatchSize:", 200LL);
        -[NSFetchRequest setReturnsObjectsAsFaults:](v288, "setReturnsObjectsAsFaults:", 0LL);
        v289 = *(void **)(v376 + 32);
        v385[0] = MEMORY[0x1895F87A8];
        v385[1] = 3221225472LL;
        v385[2] = __150__PFCloudKitSerializer_applyUpdatedRecords_deletedRecordIDs_toStore_inManagedObjectContext_onlyUpdatingAttributes_andRelationships_madeChanges_error___block_invoke_73;
        v385[3] = &unk_189EAACB8;
        v385[4] = v289;
        v385[5] = v370;
        v290 = *(void *)(v376 + 48);
        v386 = vextq_s8(*(int8x16_t *)(v376 + 88), *(int8x16_t *)(v376 + 88), 8uLL);
        v385[6] = v290;
        v385[7] = v356;
        v387 = *(void *)(v376 + 104);
        +[_PFRoutines efficientlyEnumerateManagedObjectsInFetchRequest:usingManagedObjectContext:andApplyBlock:]( (uint64_t)&OBJC_CLASS____PFRoutines,  (uint64_t)v288,  v289,  (uint64_t)v385);
        if (*(_BYTE *)(*(void *)(*(void *)(v376 + 96) + 8LL) + 24LL))
        {
          v291 = (void *)+[NSCKMirroredRelationship fetchPendingMirroredRelationshipsInStore:withManagedObjectContext:error:]( (uint64_t)&OBJC_CLASS___NSCKMirroredRelationship,  *(void *)(v376 + 48),  *(void **)(v376 + 32),  (void *)(*(void *)(*(void *)(v376 + 88) + 8LL) + 40LL));
          v292 = v291;
          if (v291)
          {
            v383 = 0u;
            v384 = 0u;
            v381 = 0u;
            v382 = 0u;
            v293 = [v291 countByEnumeratingWithState:&v381 objects:v422 count:16];
            if (v293)
            {
              v294 = *(void *)v382;
              do
              {
                v295 = 0LL;
                do
                {
                  if (*(void *)v382 != v294) {
                    objc_enumerationMutation(v292);
                  }
                  v296 = *(void **)(*((void *)&v381 + 1) + 8 * v295);
                  v297 = -[NSCKMirroredRelationship createRecordIDForRecord](v296);
                  v298 = -[NSCKMirroredRelationship createRecordIDForRelatedRecord](v296);
                  v299 = [v296 cdEntityName];
                  if (v370) {
                    v300 = objc_msgSend( (id)objc_msgSend(*(id *)(v370 + 64), "objectForKey:", v299),  "objectForKey:",  v297);
                  }
                  else {
                    v300 = 0LL;
                  }
                  v301 = [v296 relatedEntityName];
                  if (v370) {
                    v302 = objc_msgSend( (id)objc_msgSend(*(id *)(v370 + 64), "objectForKey:", v301),  "objectForKey:",  v298);
                  }
                  else {
                    v302 = 0LL;
                  }

                  if (v300 && v302)
                  {
                    *(void *)buf = 0LL;
                    if (-[NSCKMirroredRelationship updateRelationshipValueUsingImportContext:andManagedObjectContext:isDelete:error:]( (BOOL)v296,  v370,  *(void **)(v376 + 32),  objc_msgSend((id)objc_msgSend(v296, "needsDelete"), "BOOLValue"),  (uint64_t *)buf))
                    {
                      goto LABEL_296;
                    }

                    v303 = (void *)MEMORY[0x186E3E5D8]();
                    v304 = __ckLoggingOverride;
                    v305 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to resolve pending relationship: %@\n%@"];
                    if (v304 >= 9) {
                      v312 = 9LL;
                    }
                    else {
                      v312 = v304;
                    }
                    _NSCoreDataLog( v312,  v305,  v306,  v307,  v308,  v309,  v310,  v311,  (uint64_t)"-[PFCloudKitSerializer applyUpdatedRecords:deletedRecordIDs:toStore:inManagedObjectContex t:onlyUpdatingAttributes:andRelationships:madeChanges:error:]_block_invoke_2");
                    objc_autoreleasePoolPop(v303);
                  }

                  else if (objc_msgSend((id)objc_msgSend(v296, "needsDelete"), "BOOLValue"))
                  {
LABEL_296:
                    [v296 setIsPending:MEMORY[0x189604A80]];
                  }

                  ++v295;
                }

                while (v293 != v295);
                v313 = [v292 countByEnumeratingWithState:&v381 objects:v422 count:16];
                v293 = v313;
              }

              while (v313);
            }
          }

          else
          {
            *(_BYTE *)(*(void *)(*(void *)(v376 + 96) + 8LL) + 24LL) = 0;
            v321 = *(id *)(*(void *)(*(void *)(v376 + 88) + 8LL) + 40LL);
          }
        }
      }

      if (*(_BYTE *)(*(void *)(*(void *)(v376 + 96) + 8LL) + 24LL))
      {
        v379 = 0u;
        v380 = 0u;
        v377 = 0u;
        v378 = 0u;
        v322 = v370 ? *(void **)(v370 + 48) : 0LL;
        v323 = [v322 countByEnumeratingWithState:&v377 objects:v421 count:16];
        if (v323)
        {
          v324 = *(void *)v378;
          v325 = *MEMORY[0x189607460];
          v326 = MEMORY[0x189604A88];
          do
          {
            for (n = 0LL; n != v323; ++n)
            {
              if (*(void *)v378 != v324) {
                objc_enumerationMutation(v322);
              }
              v328 = *(void *)(*((void *)&v377 + 1) + 8 * n);
              v329 = +[NSCKMirroredRelationship mirroredRelationshipForManyToMany:inStore:withManagedObjectContext:error:]( (uint64_t)&OBJC_CLASS___NSCKMirroredRelationship,  v328,  *(void *)(v376 + 48),  *(void **)(v376 + 32),  *(void *)(*(void *)(v376 + 88) + 8LL) + 40LL);
              v330 = v329;
              if (v329)
              {
                [v329 setNeedsDelete:v326];
                *(void *)buf = 0LL;
                if (!-[NSCKMirroredRelationship updateRelationshipValueUsingImportContext:andManagedObjectContext:isDelete:error:]( (BOOL)v330,  v370,  *(void **)(v376 + 32),  1,  (uint64_t *)buf))
                {
                  if (objc_msgSend((id)objc_msgSend(*(id *)buf, "domain"), "isEqualToString:", v325)
                    && ([*(id *)buf code] == 134412 || objc_msgSend(*(id *)buf, "code") == 134413))
                  {
                    v331 = (void *)MEMORY[0x186E3E5D8]();
                    v332 = __ckLoggingOverride;
                    v333 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Marking deleted mirrored relationship fulfilled, one or more of the related objects is missing: %@"];
                    if (v332 >= 9) {
                      v340 = 9LL;
                    }
                    else {
                      v340 = v332;
                    }
                    _NSCoreDataLog( v340,  v333,  v334,  v335,  v336,  v337,  v338,  v339,  (uint64_t)"-[PFCloudKitSerializer applyUpdatedRecords:deletedRecordIDs:toStore:inManagedObjectContex t:onlyUpdatingAttributes:andRelationships:madeChanges:error:]_block_invoke_2");
                    objc_autoreleasePoolPop(v331);
                    [v330 setNeedsDelete:v326];
                    [v330 setIsPending:MEMORY[0x189604A80]];
                  }

                  else
                  {
                    [v330 setIsPending:v326];
                    v342 = (void *)MEMORY[0x186E3E5D8]( [WeakRetained cloudKitSerializer:*(void *)(v376 + 40) failedToUpdateRelationship:v328 withError:*(void *)buf]);
                    v343 = __ckLoggingOverride;
                    v344 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to update deleted mirrored relationship: %@\n%@"];
                    if (v343 >= 0x10) {
                      v351 = 16LL;
                    }
                    else {
                      v351 = v343;
                    }
                    _NSCoreDataLog( v351,  v344,  v345,  v346,  v347,  v348,  v349,  v350,  (uint64_t)"-[PFCloudKitSerializer applyUpdatedRecords:deletedRecordIDs:toStore:inManagedObjectContex t:onlyUpdatingAttributes:andRelationships:madeChanges:error:]_block_invoke_2");
                    objc_autoreleasePoolPop(v342);
                  }
                }
              }

              else if (*(void *)(*(void *)(*(void *)(v376 + 88) + 8LL) + 40LL))
              {
                *(_BYTE *)(*(void *)(*(void *)(v376 + 96) + 8LL) + 24LL) = 0;
                v341 = *(id *)(*(void *)(*(void *)(v376 + 88) + 8LL) + 40LL);
              }
            }

            v323 = [v322 countByEnumeratingWithState:&v377 objects:v421 count:16];
          }

          while (v323);
        }
      }

      if (*(_BYTE *)(*(void *)(*(void *)(v376 + 96) + 8LL) + 24LL))
      {
        v352 = v370 ? *(void **)(v370 + 56) : 0LL;
        if ((+[NSCKMirroredRelationship purgeMirroredRelationshipsWithRecordIDs:fromStore:withManagedObjectContext:error:]( (uint64_t)NSCKMirroredRelationship,  (void *)[v352 allObjects],  *(void *)(v376 + 48),  *(void **)(v376 + 32),  (void *)(*(void *)(*(void *)(v376 + 88) + 8) + 40)) & 1) == 0)
        {
LABEL_354:
          *(_BYTE *)(*(void *)(*(void *)(v376 + 96) + 8LL) + 24LL) = 0;
          v353 = *(id *)(*(void *)(*(void *)(v376 + 88) + 8LL) + 40LL);
        }
      }
    }
  }
}

void sub_18684D6F0(_Unwind_Exception *a1, int a2)
{
  if (a2)
  {
    objc_terminate();
    v3 = v2;
    if (v4)
    {
      objc_begin_catch(v2);
      JUMPOUT(0x18684D644LL);
    }
  }

  else
  {
    v3 = a1;
  }

  _Unwind_Resume(v3);
}

void _PF_Leopard_CFDictionaryDestroy(void *ptr)
{
  uint64_t v2 = ptr[1];
  if (v2 >= 1)
  {
    for (uint64_t i = 0LL; i != v2; ++i)
    {
      unint64_t v4 = ptr[8];
      v5 = *(const void **)(ptr[9] + 8 * i);
      if ((const void *)v4 != v5 && v5 != (const void *)~v4)
      {
        CFRelease(v5);
        CFRelease(*(CFTypeRef *)(ptr[10] + 8 * i));
      }
    }
  }

  v7 = (void *)ptr[9];
  if (v7)
  {
    v8 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone)
    {
      v8 = malloc_default_zone();
      v7 = (void *)ptr[9];
    }

    malloc_zone_free(v8, v7);
  }

  v9 = (void *)ptr[10];
  if (v9)
  {
    v10 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone)
    {
      v10 = malloc_default_zone();
      v9 = (void *)ptr[10];
    }

    malloc_zone_free(v10, v9);
  }

  v11 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
  if (!_PF_Private_Malloc_Zone) {
    v11 = malloc_default_zone();
  }
  malloc_zone_free(v11, ptr);
}

void *_PF_Leopard_CFDictionaryCreate()
{
  v0 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
  if (!_PF_Private_Malloc_Zone) {
    v0 = malloc_default_zone();
  }
  v1 = (char *)malloc_zone_calloc(v0, 1uLL, 0x58uLL);
  uint64_t v2 = v1;
  if (v1)
  {
    *(void *)v1 = 0LL;
    *((void *)v1 + 2) = 0LL;
    *((void *)v1 + 5) = 0LL;
    *((void *)v1 + 6) = 0LL;
    *((void *)v1 + 4) = 1LL;
    *(_OWORD *)(v1 + 56) = xmmword_1868D6420;
    *((void *)v1 + 3) = 3LL << flsl(0LL);
    v2[1] = 0LL;
    v2[9] = 0LL;
    v2[10] = 0LL;
  }

  return v2;
}

uint64_t _PF_Leopard_CFDictionaryGetValue(void *a1, __CFString *a2)
{
  if (a1[2])
  {
    int v4 = _PF_Leopard_CFStringHashNSString(a2);
    unsigned int v5 = (1264676453 - v4) ^ ((v4 - 1) << 8);
    unsigned int v6 = (2 - v4 - v5) ^ (v5 >> 13);
    int v7 = (v4 - 1 - v5 - v6) ^ (v6 >> 12);
    unsigned int v8 = (v5 - v6 - v7) ^ (v7 << 16);
    unsigned int v9 = (v6 - v7 - v8) ^ (v8 >> 5);
    int v10 = (v7 - v8 - v9) ^ (v9 >> 3);
    unsigned int v11 = (v9 - v10 - ((v8 - v9 - v10) ^ (v10 << 10))) ^ (((v8 - v9 - v10) ^ (v10 << 10)) >> 15);
    unint64_t v13 = a1[8];
    uint64_t v12 = a1[9];
    uint64_t v14 = a1[1];
    uint64_t v15 = ((_DWORD)v14 - 1) & v11;
    uint64_t v16 = v15;
    do
    {
      uint64_t v17 = *(__CFString **)(v12 + 8 * v16);
      if ((__CFString *)v13 == v17) {
        break;
      }
      if (v17 != (__CFString *)~v13)
      {
        if (v17 == a2 || CFEqual(v17, a2))
        {
          if (v16 == -1) {
            return 0LL;
          }
          return *(void *)(a1[10] + 8 * v16);
        }

        uint64_t v14 = a1[1];
      }

      uint64_t v18 = v16 + 1;
      if (v14 <= v16 + 1) {
        uint64_t v19 = v14;
      }
      else {
        uint64_t v19 = 0LL;
      }
      uint64_t v16 = v18 - v19;
    }

    while (v15 != v18 - v19);
  }

  return 0LL;
}

CFTypeRef _PF_Leopard_CFDictionarySetValue(void *a1, __CFString *a2, const void *a3)
{
  uint64_t v6 = a1[2];
  int v7 = (__CFString **)a1[9];
  if (v6 == a1[3] || !v7)
  {
    unsigned int v8 = (void *)a1[10];
    uint64_t v9 = a1[1];
    char v10 = flsl(v6 / 3);
    a1[3] = 3LL << v10;
    uint64_t v11 = 4LL << flsl(((3LL << v10) - 1) / 3);
    a1[1] = v11;
    a1[5] = 0LL;
    uint64_t v12 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone)
    {
      uint64_t v12 = malloc_default_zone();
      uint64_t v11 = a1[1];
    }

    a1[9] = malloc_zone_calloc(v12, 1uLL, 8 * v11);
    unint64_t v13 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone) {
      unint64_t v13 = malloc_default_zone();
    }
    uint64_t v14 = malloc_zone_calloc(v13, 1uLL, 8LL * a1[1]);
    a1[10] = v14;
    uint64_t v15 = a1[1];
    if (v15 >= 1)
    {
      uint64_t v16 = (void *)a1[9];
      do
      {
        *v16++ = a1[8];
        *v14++ = 0LL;
        --v15;
      }

      while (v15);
    }

    if (v7)
    {
      if (v9 >= 1)
      {
        uint64_t v17 = v7;
        uint64_t v18 = v8;
        do
        {
          uint64_t v19 = *v17;
          v20 = (__CFString *)a1[8];
          if (v20 != *v17 && v19 != (__CFString *)~(unint64_t)v20)
          {
            _PF_Leopard_CFDictionaryFindBuckets2((uint64_t)a1, v19, &v41, &v40);
            if (v40 != -1)
            {
              *(void *)(a1[9] + 8 * v40) = *v17;
              *(void *)(a1[10] + 8 * v40) = *v18;
            }
          }

          ++v18;
          ++v17;
          --v9;
        }

        while (v9);
      }

      v22 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
      if (!_PF_Private_Malloc_Zone) {
        v22 = malloc_default_zone();
      }
      malloc_zone_free(v22, v7);
      v23 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
      if (!_PF_Private_Malloc_Zone) {
        v23 = malloc_default_zone();
      }
      malloc_zone_free(v23, v8);
    }
  }

  ++a1[4];
  _PF_Leopard_CFDictionaryFindBuckets2((uint64_t)a1, a2, &v41, &v40);
  uint64_t v24 = v41;
  if (v41 == -1)
  {
    uint64_t v27 = a1[8];
    uint64_t v26 = a1[9];
    if ((__CFString *)v27 == a2 || (unint64_t v28 = ~v27, (__CFString *)~v27 == a2))
    {
      uint64_t v29 = a1[1];
      v30 = (__CFString *)(v27 - 1);
      if (v29 >= 1)
      {
LABEL_30:
        uint64_t v31 = -v27;
        uint64_t v27 = (uint64_t)v30;
        uint64_t v32 = a1[1];
        v33 = (__CFString **)a1[9];
        do
        {
          v35 = *v33++;
          v34 = v35;
          if ((__CFString *)v27 == v35 || v34 == (__CFString *)v31)
          {
            v30 = (__CFString *)(v27 - 1);
            goto LABEL_30;
          }

          --v32;
        }

        while (v32);
        v37 = (uint64_t *)a1[9];
        do
        {
          uint64_t v38 = a1[8];
          uint64_t v39 = v27;
          if (v38 == *v37 || (uint64_t v39 = v31, *v37 == ~v38)) {
            uint64_t *v37 = v39;
          }
          ++v37;
          --v29;
        }

        while (v29);
        v30 = (__CFString *)v27;
      }

      a1[8] = v30;
      unint64_t v28 = ~(unint64_t)v30;
    }

    if (*(void *)(v26 + 8 * v40) == v28) {
      --a1[5];
    }
    CFRetain(a2);
    CFTypeRef result = CFRetain(a3);
    *(void *)(a1[9] + 8 * v40) = a2;
    *(void *)(a1[10] + 8 * v40) = a3;
    ++a1[2];
    ++*a1;
  }

  else
  {
    CFRelease(*(CFTypeRef *)(a1[10] + 8 * v41));
    CFTypeRef result = CFRetain(a3);
    *(void *)(a1[10] + 8 * v24) = a3;
  }

  return result;
}

__CFString *_PF_Leopard_CFDictionaryFindBuckets2(uint64_t a1, __CFString *a2, void *a3, void *a4)
{
  int v8 = _PF_Leopard_CFStringHashNSString(a2);
  unsigned int v9 = (1264676453 - v8) ^ ((v8 - 1) << 8);
  unsigned int v10 = (2 - v8 - v9) ^ (v9 >> 13);
  int v11 = (v8 - 1 - v9 - v10) ^ (v10 >> 12);
  unsigned int v12 = (v9 - v10 - v11) ^ (v11 << 16);
  unsigned int v13 = (v10 - v11 - v12) ^ (v12 >> 5);
  int v14 = (v11 - v12 - v13) ^ (v13 >> 3);
  unint64_t v16 = *(void *)(a1 + 64);
  uint64_t v15 = *(void *)(a1 + 72);
  uint64_t v17 = (*(_DWORD *)(a1 + 8) - 1) & ((v13 - v14 - ((v12 - v13 - v14) ^ (v14 << 10))) ^ (((v12 - v13 - v14) ^ (v14 << 10)) >> 15));
  *a3 = -1LL;
  *a4 = -1LL;
  uint64_t v18 = v17;
  while (1)
  {
    CFTypeRef result = *(__CFString **)(v15 + 8 * v18);
    if ((__CFString *)v16 == result) {
      break;
    }
    if (result == (__CFString *)~v16)
    {
      if (a4)
      {
        *a4 = v18;
        a4 = 0LL;
      }
    }

    else if (result == a2 || (CFTypeRef result = (__CFString *)CFEqual(result, a2), (_DWORD)result))
    {
      a4 = a3;
      goto LABEL_15;
    }

    uint64_t v20 = v18 + 1;
    uint64_t v21 = *(void *)(a1 + 8);
    if (v21 > v18 + 1) {
      uint64_t v21 = 0LL;
    }
    uint64_t v18 = v20 - v21;
    if (v17 == v20 - v21) {
      return result;
    }
  }

  if (!a4) {
    return result;
  }
LABEL_15:
  *a4 = v18;
  return result;
}

uint64_t _PF_Leopard_CFStringHashNSString(__CFString *a1)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  CFIndex Length = CFStringGetLength(a1);
  v3 = v9;
  if (Length >= 97)
  {
    -[__CFString getCharacters:range:](a1, "getCharacters:range:", v9, 0LL, 32LL);
    -[__CFString getCharacters:range:](a1, "getCharacters:range:", &v10, ((unint64_t)Length >> 1) - 16, 32LL);
    -[__CFString getCharacters:range:](a1, "getCharacters:range:", &v11, Length - 32, 32LL);
    int v4 = (unsigned __int16 *)&v12;
    unsigned int v5 = (unsigned __int16 *)&v12;
LABEL_5:
    v3 = v9;
    int v6 = Length;
    do
    {
      int v6 = 67503105 * v6 + 16974593 * *v3 + 66049 * v3[1] + 257 * v3[2] + v3[3];
      v3 += 4;
    }

    while (v3 < v5);
    goto LABEL_10;
  }

  -[__CFString getCharacters:range:](a1, "getCharacters:range:", v9, 0LL, Length);
  int v4 = &v9[Length];
  if ((uint64_t)(Length & 0xFFFFFFFFFFFFFFFCLL) >= 1)
  {
    unsigned int v5 = &v9[Length & 0xFFFFFFFFFFFFFFFCLL];
    goto LABEL_5;
  }

  int v6 = Length;
LABEL_10:
  while (v3 < v4)
  {
    int v7 = *v3++;
    int v6 = 257 * v6 + v7;
  }

  return ((v6 << Length) + v6);
}

void sub_1868509FC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, void (*a12)(char *))
{
}

id returnBoolThing1(void *a1, const char *a2)
{
  return objc_msgSend((id)objc_msgSend(a1, "_underlyingProperty"), a2);
}

id returnIdThing1(void *a1, const char *a2)
{
  return objc_msgSend((id)objc_msgSend(a1, "_underlyingProperty"), a2);
}

id returnUIntegerThing1(void *a1, const char *a2)
{
  return objc_msgSend((id)objc_msgSend(a1, "_underlyingProperty"), a2);
}

void sub_186851808(uint64_t a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x1868517D8LL);
  }

  JUMPOUT(0x1868517B8LL);
}

uint64_t _readDerivedAttributeIntoShellFromBytes( uint64_t a1, uint64_t a2, unint64_t *a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unint64_t *a9)
{
  uint64_t AttributeIntoShellFromBytes = _readAttributeIntoShellFromBytes(a1, a2, a3, a4, a5, a6, a7, a8, a9);
  if ((_DWORD)AttributeIntoShellFromBytes)
  {
    unint64_t v15 = *a3;
    unint64_t v16 = (*a3 + 3) & 0xFFFFFFFFFFFFFFFCLL;
    unint64_t v17 = v16 + 4;
    if (v16 + 4 <= a4)
    {
      unsigned int v18 = *(_DWORD *)(a2 + v16);
      if (v18)
      {
        uint64_t v30 = *(void *)(a7 + 8LL * bswap32(v18));
        uint64_t v19 = (void *)MEMORY[0x189604010];
        uint64_t v20 = objc_opt_class();
        uint64_t v21 = objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
        *(void *)(a5 + 120) = (id)+[_PFRoutines unarchiveCylicGraphObjectOfClasses:fromData:error:]( (uint64_t)&OBJC_CLASS____PFRoutines,  v21,  v30,  (uint64_t)a9);
      }

      unint64_t v15 = v17;
    }

    unint64_t v22 = (v15 + 3) & 0xFFFFFFFFFFFFFFFCLL;
    unint64_t v23 = v22 + 4;
    if (v22 + 4 <= a4)
    {
      unsigned int v24 = *(_DWORD *)(a2 + v22);
      if (v24)
      {
        uint64_t v25 = *(void *)(a7 + 8LL * bswap32(v24));
        uint64_t v26 = (void *)MEMORY[0x189604010];
        uint64_t v27 = objc_opt_class();
        uint64_t v28 = objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
        *(void *)(a5 + 12_Block_object_dispose((const void *)(v17 - 96), 8) = (id)+[_PFRoutines unarchiveCylicGraphObjectOfClasses:fromData:error:]( (uint64_t)&OBJC_CLASS____PFRoutines,  v28,  v25,  (uint64_t)a9);
      }

      unint64_t v15 = v23;
    }

    *a3 = v15;
  }

  return AttributeIntoShellFromBytes;
}

void sub_18685411C(_Unwind_Exception *a1)
{
}

void sub_186854218(_Unwind_Exception *a1)
{
}

void sub_186854558(_Unwind_Exception *a1)
{
}

void sub_186854770(void *a1)
{
}

void sub_18685478C(_Unwind_Exception *a1)
{
}

LABEL_126:
    ++v65;
  }

  while (v65 != v10);
  if (v67)
  {
    if (v67 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_129;
    }
    v74 = *(void *)(a1 + 32);
    v75 = *(unsigned int *)(v74 + 4 * v67 - 4);
    if (v67 >= 1 && v67 + (v10 ^ 0xFFFFFFFFLL) <= v75)
    {
      v76 = v74 - 4;
      while (1)
      {
        v75 = *(unsigned int *)(v76 + 4 * v67);
      }
    }

    else {
      v79 = (v75 ^ 0xFFFFFFFFLL) / (v10 - v67);
    }
    if (v10 > v67)
    {
      v84 = v79 + v75;
      if (v84 <= 1) {
        LODWORD(v84) = 1;
      }
      do
      {
        *(_DWORD *)(*(void *)(a1 + 32) + 4 * v67) = v84;
        if (v64) {
          v53[v67] = 1;
        }
        ++v67;
        LODWORD(v84) = v84 + v79;
      }

      while (v10 != v67);
    }

    v73 = v87;
    if (v64)
    {
LABEL_160:
      v85 = *(unsigned int **)(a1 + 32);
      do
      {
        v86 = *v85++;
        *v11++ = v86;
        --v73;
      }

      while (v73);
    }
  }

  else
  {
LABEL_141:
    else {
      v78 = 0xFFFFFFFF / ((int)v10 + 1);
    }
    v80 = 0LL;
    v81 = 2 * v78;
    do
    {
      *(_DWORD *)(*(void *)(a1 + 32) + 4 * v80) = v81;
      v81 += v78;
      ++v80;
    }

    while (v10 != v80);
    if (v64)
    {
      memset(v53, 1, v10);
      v82 = *(unsigned int **)(a1 + 32);
      do
      {
        v83 = *v82++;
        *v11++ = v83;
        --v18;
      }

      while (v18);
    }
  }

uint64_t preserveOrderKeysByForwardSkip(unsigned int *a1, int a2, int a3, char a4)
{
  if (a2 < 1) {
    return 0LL;
  }
  uint64_t result = 0LL;
  unsigned int v6 = 0;
  uint64_t v7 = a2;
  do
  {
    if (*a1)
    {
      if (*a1 <= v6)
      {
        if ((a4 & 1) != 0)
        {
        }

        else
        {
          *a1 = 0;
        }
      }

      else
      {
        uint64_t result = (result + 1);
        unsigned int v6 = *a1;
      }
    }

    else if (v6)
    {
      ++v6;
    }

    else
    {
      unsigned int v6 = 0;
    }

    ++a1;
    --v7;
  }

  while (v7);
  return result;
}

uint64_t preserveOrderKeysByReverseSkip(uint64_t a1, int a2, int a3, char a4)
{
  if (a2 < 1) {
    return 0LL;
  }
  uint64_t result = 0LL;
  int v6 = 0;
  uint64_t v7 = a2;
  do
  {
    uint64_t v8 = v7 - 1;
    unsigned int v9 = *(_DWORD *)(a1 + 4LL * (v7 - 1));
    if (v9)
    {
      if (v6 - 1 >= v9)
      {
        uint64_t result = (result + 1);
        int v6 = *(_DWORD *)(a1 + 4LL * (v7 - 1));
      }

      else if ((a4 & 1) != 0)
      {
      }

      else
      {
        *(_DWORD *)(a1 + 4LL * (v7 - 1)) = 0;
      }
    }

    else if (v6-- == 0)
    {
      int v6 = 0;
    }

    --v7;
  }

  while ((unint64_t)(v8 + 1) > 1);
  return result;
}

unint64_t _PF_SnowLeopard_CFDictionaryCreateWithObjectsAndKeys( uint64_t *a1, __CFString **a2, unint64_t a3)
{
  int v6 = malloc(0x28uLL);
  unint64_t v7 = (unint64_t)v6;
  *int v6 = 1;
  v6[4] = 0;
  *((void *)v6 + 1) = 0LL;
  *((_DWORD *)v6 + 4) = 0x10000;
  *((_WORD *)v6 + 1) = -1;
  *((void *)v6 + 3) = 0LL;
  *((void *)v6 + 4) = 0LL;
  if (a3 < 5)
  {
    if (!a3) {
      return v7;
    }
  }

  else
  {
    *((_WORD *)v6 + 9) = 2;
    _PF_SnowLeopard_CFBasicHashRehash((uint64_t)v6, a3);
  }

  do
  {
    unsigned int v9 = *a2++;
    uint64_t v8 = v9;
    uint64_t v10 = *a1++;
    _PF_SnowLeopard_CFBasicHashSetValue(v7, v8, v10);
    --a3;
  }

  while (a3);
  return v7;
}

void _PF_SnowLeopard_CFDictionaryDestroy(uint64_t a1)
{
  uint64_t v2 = a1 + 24;
  free(*(void **)(a1 + 24));
  free(*(void **)(v2 + (((unint64_t)*(unsigned __int16 *)(a1 + 2) >> 12) & 8)));
  free((void *)a1);
}

uint64_t _PF_SnowLeopard_CFStringHashNSString(__CFString *a1)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  CFIndex Length = CFStringGetLength(a1);
  uint64_t v3 = Length;
  int v4 = v9;
  if (Length >= 97)
  {
    -[__CFString getCharacters:range:](a1, "getCharacters:range:", v9, 0LL, 32LL);
    -[__CFString getCharacters:range:](a1, "getCharacters:range:", &v10, ((unint64_t)Length >> 1) - 16, 32LL);
    -[__CFString getCharacters:range:](a1, "getCharacters:range:", &v11, Length - 32, 32LL);
    unsigned int v5 = (unsigned __int16 *)&v12;
    int v6 = (unsigned __int16 *)&v12;
LABEL_5:
    int v4 = v9;
    do
    {
      uint64_t v3 = 16974593 * *v4 + 67503105 * v3 + 66049 * v4[1] + 257LL * v4[2] + v4[3];
      v4 += 4;
    }

    while (v4 < v6);
    goto LABEL_9;
  }

  -[__CFString getCharacters:range:](a1, "getCharacters:range:", v9, 0LL, Length);
  unsigned int v5 = &v9[Length];
  if ((uint64_t)(Length & 0xFFFFFFFFFFFFFFFCLL) >= 1)
  {
    int v6 = &v9[Length & 0xFFFFFFFFFFFFFFFCLL];
    goto LABEL_5;
  }

unint64_t _PF_SnowLeopard_CFBasicHashFindBucket_NoCollision(uint64_t a1, __CFString *a2)
{
  if (!*(_BYTE *)(a1 + 4)) {
    return -1LL;
  }
  else {
    unint64_t v3 = _PF_SnowLeopard_CFBasicHashTableSizes[*(unsigned __int8 *)(a1 + 4)];
  }
  unint64_t result = _PF_SnowLeopard_CFStringHashNSString(a2) % v3;
  unint64_t v5 = v3;
  while (*(void *)(*(void *)(a1 + (((unint64_t)*(unsigned __int16 *)(a1 + 2) >> 12) & 8) + 24) + 8 * result))
  {
    if (v3 <= result + 1) {
      unint64_t v6 = v3;
    }
    else {
      unint64_t v6 = 0LL;
    }
    unint64_t result = result + 1 - v6;
    if (!--v5) {
      return -1LL;
    }
  }

  return result;
}

unint64_t _PF_SnowLeopard_CFBasicHashFindBucket@<X0>( unint64_t result@<X0>, __CFString *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3 = *(unsigned __int8 *)(result + 4);
  if (!*(_BYTE *)(result + 4))
  {
    *(_OWORD *)a3 = xmmword_1868D6430;
    *(_OWORD *)(a3 + 16) = unk_1868D6440;
    return result;
  }

  unint64_t v5 = result;
  if (_PF_SnowLeopard_CFBasicHashTableSizes[v3] <= 1uLL) {
    unint64_t v6 = 1LL;
  }
  else {
    unint64_t v6 = _PF_SnowLeopard_CFBasicHashTableSizes[v3];
  }
  unint64_t result = _PF_SnowLeopard_CFStringHashNSString(a2);
  unint64_t v7 = result % v6;
  uint64_t v8 = *(void *)(v5 + (((unint64_t)*(unsigned __int16 *)(v5 + 2) >> 12) & 8) + 24);
  uint64_t v9 = -1LL;
  unint64_t v10 = v6;
  while (1)
  {
    uint64_t v11 = *(void *)(v8 + 8 * v7);
    if (v11 == -1)
    {
      if (v9 == -1) {
        uint64_t v9 = v7;
      }
      goto LABEL_18;
    }

    if (!v11) {
      break;
    }
    if (v11 == 2814029233LL) {
      uint64_t v11 = 0LL;
    }
    if (v11 == 2780474809LL) {
      uint64_t v12 = -1LL;
    }
    else {
      uint64_t v12 = v11;
    }
    if ((__CFString *)v12 == a2)
    {
      uint64_t v12 = (uint64_t)a2;
LABEL_29:
      uint64_t v14 = a3;
      *(void *)a3 = v7;
      uint64_t v16 = *(void *)(*(void *)(v5 + 24) + 8 * v7);
      if (v16 == 2814029233LL)
      {
        uint64_t v16 = 0LL;
      }

      else if (v16 == 2780474809LL)
      {
        uint64_t v16 = -1LL;
      }

      *(void *)(a3 + _Block_object_dispose((const void *)(v17 - 96), 8) = v12;
      *(void *)(a3 + 16) = v16;
      uint64_t v11 = 1LL;
      goto LABEL_34;
    }

    unint64_t result = [(id)v12 isEqual:a2];
    if ((_DWORD)result) {
      goto LABEL_29;
    }
LABEL_18:
    if (v6 <= v7 + 1) {
      unint64_t v13 = v6;
    }
    else {
      unint64_t v13 = 0LL;
    }
    unint64_t v7 = v7 + 1 - v13;
    if (!--v10)
    {
      uint64_t v11 = 0LL;
      uint64_t v14 = a3;
      *(void *)a3 = v9;
      goto LABEL_34;
    }
  }

  if (v9 == -1) {
    uint64_t v15 = v7;
  }
  else {
    uint64_t v15 = v9;
  }
  uint64_t v14 = a3;
  *(void *)a3 = v15;
LABEL_34:
  *(void *)(v14 + 24) = v11;
  return result;
}

void _PF_SnowLeopard_CFBasicHashRehash(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 4);
  if (a2)
  {
    uint64_t v3 = 0LL;
    while (_PF_SnowLeopard_CFBasicHashTableCapacities[v3] < (unint64_t)*(unsigned int *)(a1 + 8) + a2)
    {
      if (++v3 == 64)
      {
        uint64_t v3 = 0LL;
        break;
      }
    }
  }

  uint64_t v4 = _PF_SnowLeopard_CFBasicHashTableSizes[v3];
  uint64_t v5 = _PF_SnowLeopard_CFBasicHashTableSizes[*(unsigned __int8 *)(a1 + 4)];
  if (v4 < 1)
  {
    unint64_t v10 = 0LL;
    uint64_t v9 = 0LL;
    uint64_t v8 = (__int16 *)(a1 + 2);
    int v11 = *(__int16 *)(a1 + 2);
    *(_BYTE *)(a1 + 4) = v3;
    *(_WORD *)(a1 + 16) = 0;
    uint64_t v21 = *(uint64_t **)(a1 + 24);
    *(void *)(a1 + 24) = 0LL;
    if ((v11 & 0x80000000) == 0) {
      goto LABEL_13;
    }
  }

  else
  {
    size_t v6 = 8 * v4;
    unint64_t v7 = malloc(8 * v4);
    bzero(v7, v6);
    uint64_t v8 = (__int16 *)(a1 + 2);
    if ((*(__int16 *)(a1 + 2) & 0x80000000) == 0)
    {
      uint64_t v9 = 0LL;
      *(_BYTE *)(a1 + 4) = v3;
      *(_WORD *)(a1 + 16) = 0;
      uint64_t v21 = *(uint64_t **)(a1 + 24);
      *(void *)(a1 + 24) = v7;
      goto LABEL_13;
    }

    unint64_t v10 = malloc(v6);
    bzero(v10, v6);
    *(_BYTE *)(a1 + 4) = v3;
    *(_WORD *)(a1 + 16) = 0;
    uint64_t v21 = *(uint64_t **)(a1 + 24);
    *(void *)(a1 + 24) = v7;
  }

  uint64_t v9 = *(uint64_t **)(a1 + 32);
  *(void *)(a1 + 32) = v10;
LABEL_13:
  if (v5 >= 1)
  {
    uint64_t v12 = v21;
    unint64_t v13 = v9;
    do
    {
      uint64_t v15 = *v12++;
      uint64_t v14 = v15;
      if ((unint64_t)(v15 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        if (v14 == 2814029233LL) {
          uint64_t v14 = 0LL;
        }
        if (v14 == 2780474809LL) {
          uint64_t v16 = -1LL;
        }
        else {
          uint64_t v16 = v14;
        }
        int v17 = *v8;
        if (v17 < 0 && v9)
        {
          if (*v13 == 2780474809LL) {
            uint64_t v18 = -1LL;
          }
          else {
            uint64_t v18 = *v13;
          }
          if (*v13 == 2814029233LL) {
            uint64_t v19 = 0LL;
          }
          else {
            uint64_t v19 = (__CFString *)v18;
          }
          unint64_t Bucket_NoCollision = _PF_SnowLeopard_CFBasicHashFindBucket_NoCollision(a1, v19);
          *(void *)(*(void *)(a1 + 24) + 8 * Bucket_NoCollision) = v16;
        }

        else
        {
          if (v17 < 0) {
            uint64_t v19 = 0LL;
          }
          else {
            uint64_t v19 = (__CFString *)v16;
          }
          unint64_t Bucket_NoCollision = _PF_SnowLeopard_CFBasicHashFindBucket_NoCollision(a1, v19);
          *(void *)(*(void *)(a1 + 24) + 8 * Bucket_NoCollision) = v16;
          if (!v9) {
            goto LABEL_35;
          }
        }
      }

unint64_t _PF_SnowLeopard_CFBasicHashAddValue( unint64_t result, unint64_t a2, __CFString *a3, uint64_t a4)
{
  uint64_t v6 = result;
  uint64_t v7 = 0LL;
  ++*(_WORD *)(result + 18);
  unint64_t v8 = *(unsigned int *)(result + 8);
  while (1)
  {
    unint64_t v9 = _PF_SnowLeopard_CFBasicHashTableCapacities[v7];
    if (v9 >= v8) {
      break;
    }
    if (++v7 == 64)
    {
      unint64_t v9 = 0LL;
      break;
    }
  }

  unint64_t v10 = (v8 + 1);
  if (v9 >= v10)
  {
    uint64_t v11 = *(void *)(result + 24);
    if (*(void *)(v11 + 8 * a2) == -1LL) {
      --*(_WORD *)(result + 16);
    }
  }

  else
  {
    _PF_SnowLeopard_CFBasicHashRehash(result, 1LL);
    unint64_t result = _PF_SnowLeopard_CFBasicHashFindBucket_NoCollision(v6, a3);
    a2 = result;
    uint64_t v11 = *(void *)(v6 + 24);
    LODWORD(v10) = *(_DWORD *)(v6 + 8) + 1;
  }

  *(void *)(v11 + 8 * a2) = a4;
  *(void *)(*(void *)(v6 + (((unint64_t)*(unsigned __int16 *)(v6 + 2) >> 12) & 8) + 24) + 8 * a2) = a3;
  *(_DWORD *)(v6 + _Block_object_dispose((const void *)(v17 - 96), 8) = v10;
  return result;
}

unint64_t _PF_SnowLeopard_CFBasicHashSetValue(unint64_t a1, __CFString *a2, uint64_t a3)
{
  unint64_t result = _PF_SnowLeopard_CFBasicHashFindBucket(a1, a2, (uint64_t)v10);
  unint64_t v7 = v10[0];
  if (!v10[3]) {
    return _PF_SnowLeopard_CFBasicHashAddValue(a1, v10[0], a2, a3);
  }
  uint64_t v9 = *(void *)(a1 + 24);
  unint64_t v8 = a1 + 24;
  ++*(_WORD *)(v8 - 6);
  *(void *)(v9 + 8 * v7) = a3;
  *(void *)(*(void *)(v8 + (((unint64_t)*(unsigned __int16 *)(v8 - 22) >> 12) & 8)) + 8 * v7) = a2;
  return result;
}

uint64_t _PF_SnowLeopard_CFBasicHashGetBucket@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = a2;
  uint64_t v3 = *(void *)(*(void *)(result + 24) + 8 * a2);
  if ((unint64_t)(v3 - 1) >= 0xFFFFFFFFFFFFFFFELL)
  {
    a3[1] = 0LL;
    a3[2] = 0LL;
    a3[3] = 0LL;
  }

  else
  {
    uint64_t v4 = -1LL;
    if (v3 != 2780474809LL) {
      uint64_t v4 = *(void *)(*(void *)(result + 24) + 8 * a2);
    }
    if (v3 == 2814029233LL) {
      uint64_t v5 = 0LL;
    }
    else {
      uint64_t v5 = v4;
    }
    a3[2] = v5;
    a3[3] = 1LL;
    if (v6 == 2814029233LL)
    {
      uint64_t v6 = 0LL;
    }

    else if (v6 == 2780474809LL)
    {
      uint64_t v6 = -1LL;
    }

    a3[1] = v6;
  }

  return result;
}

uint64_t _PF_SnowLeopard_CFDictionaryGetValues(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(unsigned int *)(result + 8);
  uint64_t v3 = _PF_SnowLeopard_CFBasicHashTableSizes[*(unsigned __int8 *)(result + 4)];
  if ((_DWORD)v2) {
    BOOL v4 = v3 < 1;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    uint64_t v6 = result;
    uint64_t v7 = 0LL;
    uint64_t v8 = 0LL;
    do
    {
      unint64_t result = _PF_SnowLeopard_CFBasicHashGetBucket(v6, v7, v12);
      if (v13)
      {
        --v2;
        if (v8 < v3)
        {
          uint64_t v9 = v12[2];
          uint64_t v10 = v13 - 1;
          do
          {
            *(void *)(a2 + 8 * v8++) = v9;
            BOOL v11 = v10-- != 0;
          }

          while (v11 && v8 < v3);
        }
      }

      if (v2 < 1) {
        break;
      }
      ++v7;
    }

    while (v7 < v3);
  }

  return result;
}

unsigned int *snapshot_set_int16(char *a1, unsigned int a2, __int16 a3)
{
  Class Class = object_getClass(a1);
  unint64_t result = (unsigned int *)object_getIndexedIvars(Class);
  a1[((unint64_t)a2 >> 3) + 28] &= ~(1 << (a2 & 7));
  *(_WORD *)&a1[result[a2 + 19]] = a3;
  return result;
}

unsigned int *snapshot_set_int32(char *a1, unsigned int a2, int a3)
{
  Class Class = object_getClass(a1);
  unint64_t result = (unsigned int *)object_getIndexedIvars(Class);
  a1[((unint64_t)a2 >> 3) + 28] &= ~(1 << (a2 & 7));
  *(_DWORD *)&a1[result[a2 + 19]] = a3;
  return result;
}

unsigned int *snapshot_set_float(char *a1, unsigned int a2, float a3)
{
  Class Class = object_getClass(a1);
  unint64_t result = (unsigned int *)object_getIndexedIvars(Class);
  a1[((unint64_t)a2 >> 3) + 28] &= ~(1 << (a2 & 7));
  *(float *)&a1[result[a2 + 19]] = a3;
  return result;
}

void snapshot_set_null(char *a1, unsigned int a2)
{
  Class Class = object_getClass(a1);
  IndexedIvars = object_getIndexedIvars(Class);
  a1[((unint64_t)a2 >> 3) + 28] |= 1 << (a2 & 7);
  uint64_t v6 = *((unsigned int *)IndexedIvars + a2 + 19);
  int v7 = *(char *)(IndexedIvars[7] + a2);
  switch(*(_BYTE *)(IndexedIvars[7] + a2))
  {
    case 'c':
      a1[v6] = 0;
      return;
    case 'd':
      goto LABEL_6;
    case 'e':
    case 'g':
    case 'h':
      goto LABEL_7;
    case 'f':
    case 'i':
      *(_DWORD *)&a1[v6] = 0;
      return;
    default:
      if (v7 == 113)
      {
LABEL_6:
        *(void *)&a1[v6] = 0LL;
      }

      else if (v7 == 115)
      {
        *(_WORD *)&a1[v6] = 0;
      }

      else
      {
LABEL_7:
        uint64_t v8 = *(void **)&a1[v6];
        *(void *)&a1[v6] = 0LL;
        if (v8) {
      }
        }

      return;
  }

#error "18685A7F8: call analysis failed (funcsize=69)"
void sub_18685A8A4(uint64_t a1, int a2)
{
  id v2;
  SEL v3;
  if (!a2) {
    JUMPOUT(0x18685A864LL);
  }
  objc_terminate();
  +[_CDSnapshot initialize](v2, v3);
}

void sub_18685B3A4()
{
}

_CDSnapshot *sub_18685B3B0(uint64_t a1, int a2)
{
  if (!a2) {
    JUMPOUT(0x18685B3B4LL);
  }
  objc_terminate();
  return +[_CDSnapshot allocWithZone:](v2, v3, v4);
}

#error "18685B548: call analysis failed (funcsize=67)"
id __cdecl -[_CDSnapshot copy](_CDSnapshot *self, SEL a2)
{
  id result;
  if ((*(_BYTE *)&self->_cd_flags & 1) != 0) {
    return self;
  }
  unint64_t result = -[_CDSnapshot mutableCopy](self, "mutableCopy");
  *(_BYTE *)&self->_cd_flags |= 1u;
  return result;
}

void snapshot_set_objectID(uint64_t a1, void *a2)
{
  SEL v3 = *(void **)(a1 + 16);
  if (v3 != a2)
  {
    id v4 = v3;
    *(void *)(a1 + 16) = a2;
    if (v4) {
  }
    }

os_log_t __PFInstrumentsGetLog_block_invoke()
{
  os_log_t result = os_log_create("com.apple.coredata", "instruments");
  PFInstrumentsGetLog_coreDataInstrumentsLog = (uint64_t)result;
  return result;
}

void sub_18685F69C(_Unwind_Exception *exception_object)
{
  if ((v1 & 1) != 0) {
    objc_end_catch();
  }
  _Unwind_Resume(exception_object);
}

void sub_186861284( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_18686219C(uint64_t a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x186862008LL);
  }

  JUMPOUT(0x1868621BCLL);
}

#error "186862480: call analysis failed (funcsize=25)"
void sub_1868624D4(void *exc_buf)
{
  os_unfair_lock_s *v1;
  objc_begin_catch(exc_buf);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
  __break(1u);
}

void sub_1868624FC(_Unwind_Exception *a1)
{
}

void sub_18686281C(_Unwind_Exception *a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    objc_begin_catch(a1);
    JUMPOUT(0x186862690LL);
  }

  _Unwind_Resume(a1);
}

void sub_186862848(_Unwind_Exception *a1)
{
  if (v1) {
    JUMPOUT(0x186862850LL);
  }
  _Unwind_Resume(a1);
}

void sub_186862858(uint64_t a1, int a2)
{
  if (!a2) {
    JUMPOUT(0x186862860LL);
  }
  objc_terminate();
  -[NSXPCStoreConnectionManager disconnectAllConnections:](v2, v3);
}

void sub_186862924( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void __Block_byref_object_copy__36(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__36(uint64_t a1)
{
}

void sub_186862E00(_Unwind_Exception *a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    objc_begin_catch(a1);
    JUMPOUT(0x186862B80LL);
  }

  _Unwind_Resume(a1);
}

void sub_186862E2C(uint64_t a1, int a2)
{
  if (!a2) {
    JUMPOUT(0x186862E34LL);
  }
  objc_terminate();
}

void *standardizedURL(void *a1)
{
  int v1 = a1;
  if ([a1 isFileURL])
  {
    uint64_t v2 = realpath_DARWIN_EXTSN((const char *)objc_msgSend((id)objc_msgSend(v1, "path"), "UTF8String"), 0);
    if (v2)
    {
      char v3 = v2;
      uint64_t v4 = objc_msgSend( MEMORY[0x189604030],  "fileURLWithPath:isDirectory:",  objc_msgSend(NSString, "stringWithUTF8String:", v2),  0);
LABEL_6:
      int v1 = (void *)v4;
      free(v3);
      return v1;
    }

    uint64_t v5 = [v1 lastPathComponent];
    uint64_t v6 = realpath_DARWIN_EXTSN( (const char *)objc_msgSend( (id)objc_msgSend((id)objc_msgSend(v1, "URLByDeletingLastPathComponent"), "path"),  "UTF8String"),  0);
    if (v6)
    {
      char v3 = v6;
      uint64_t v4 = objc_msgSend( (id)objc_msgSend( MEMORY[0x189604030],  "fileURLWithPath:isDirectory:",  objc_msgSend(NSString, "stringWithUTF8String:", v6),  1),  "URLByAppendingPathComponent:",  v5);
      goto LABEL_6;
    }
  }

  return v1;
}

void sub_186864604(_Unwind_Exception *a1)
{
}

void sub_186866B30( _Unwind_Exception *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, int a26, int a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35)
{
  if (a2)
  {
    if (a2 == 2)
    {
      id v35 = objc_begin_catch(exc_buf);
      objc_end_catch();
    }

    else
    {
      objc_begin_catch(exc_buf);
    }

    JUMPOUT(0x186866498LL);
  }

  _Unwind_Resume(exc_buf);
}

void sub_1868680C8()
{
}

void sub_1868680D4()
{
  if (v0) {
    JUMPOUT(0x1868680DCLL);
  }
  JUMPOUT(0x1868680E0LL);
}

void sub_186868C58()
{
}

void sub_186868C64()
{
}

void sub_186868CC8(_Unwind_Exception *a1)
{
}

void sub_1868699E0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void __Block_byref_object_copy__37(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__37(uint64_t a1)
{
}

void sub_18686A428(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  _Block_object_dispose(&STACK[0x240], 8);
  _Block_object_dispose(&STACK[0x270], 8);
  objc_begin_catch(a1);
  JUMPOUT(0x18686A36CLL);
}

void __Block_byref_object_copy__38(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__38(uint64_t a1)
{
}

void sub_18686AF00( _Unwind_Exception *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  if (a2)
  {
    objc_begin_catch(exc_buf);
    JUMPOUT(0x18686ADFCLL);
  }

  _Unwind_Resume(exc_buf);
}

void sub_18686B2A0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_18686B440(_Unwind_Exception *a1)
{
}

void sub_18686B45C()
{
}

void sub_18686BF54( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location, uint64_t a20, void (*a21)(uint64_t a1), void *a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, const __CFString *a27, const __CFString *a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32)
{
  if (a2 == 1)
  {
    id v40 = objc_begin_catch(a1);
    uint64_t v41 = (void *)MEMORY[0x189607870];
    uint64_t v42 = *MEMORY[0x1896075F0];
    *(void *)(v36 - 176) = @"CloudKit setup failed because it couldn't register a handler for the setup activity. There is another instance of this persistent store actively syncing with CloudKit in this process.";
    uint64_t v43 = *MEMORY[0x189607760];
    a25 = v42;
    a26 = v43;
    *(void *)(v36 - 16_Block_object_dispose((const void *)(v9 - 80), 8) = [v33 URL];
    *(void *)(v36 - 160) = v40;
    a27 = @"NSUnderlyingException";
    a28 = @"activityIdentifier";
    *(void *)(v36 - 152) = *(void *)(v32 + 192);
    uint64_t v44 = [MEMORY[0x189603F68] dictionaryWithObjects:v36 - 176 forKeys:&a25 count:4];
    v45 = (void *)[v41 errorWithDomain:*MEMORY[0x189607460] code:134422 userInfo:v44];
    objc_end_catch();
    objc_destroyWeak(&location);
    -[NSCloudKitMirroringDelegate resetAfterError:andKeepContainer:](v32, v45);
    v46 = *(void **)(v35 + 2600);
    [v45 domain];
    [v45 code];
    uint64_t v47 = [v46 stringWithFormat:@"Error %@:%ld"];
    a20 = v37;
    a21 = __40__NSCloudKitMirroringDelegate_tearDown___block_invoke;
    a22 = &unk_189EAB0A8;
    a23 = v32;
    a24 = v47;
    -[NSCloudKitMirroringDelegate _openTransactionWithLabel:assertionLabel:andExecuteWorkBlock:]( v32,  (uint64_t)@"com.apple.coredata.cloudkit.teardown",  (uint64_t)@"CoreData: CloudKit Teardown",  (uint64_t)&location);
    JUMPOUT(0x18686BF0CLL);
  }

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18686CD7C(_Unwind_Exception *a1)
{
}

void sub_18686D2C4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_18686D654(_Unwind_Exception *exception_object)
{
}

void sub_18686E1EC()
{
}

void sub_18686E1F8()
{
  if (v0) {
    JUMPOUT(0x18686E200LL);
  }
  JUMPOUT(0x18686E204LL);
}

void sub_18686FD74( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30)
{
}

void sub_186870040(_Unwind_Exception *a1)
{
}

void sub_186870280(_Unwind_Exception *a1)
{
}

void sub_1868703E0(_Unwind_Exception *a1)
{
}

void sub_1868703FC()
{
}

void sub_186870AB8(_Unwind_Exception *a1)
{
}

void sub_186870C20(_Unwind_Exception *a1)
{
}

void sub_186870C3C()
{
}

void sub_186871034(_Unwind_Exception *a1)
{
}

void sub_186871644( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, id location)
{
  if (a2)
  {
    objc_destroyWeak(v24);
    objc_destroyWeak(&location);
    objc_begin_catch(exception_object);
    JUMPOUT(0x1868715D8LL);
  }

  _Unwind_Resume(exception_object);
}

void sub_186871920(_Unwind_Exception *exc_buf, int a2)
{
  if (a2)
  {
    objc_begin_catch(exc_buf);
    JUMPOUT(0x1868718D8LL);
  }

  _Unwind_Resume(exc_buf);
}

void sub_186871BB0(_Unwind_Exception *a1)
{
}

void sub_186871D18(_Unwind_Exception *a1)
{
}

void sub_186871D34()
{
}

void sub_186871EE0(_Unwind_Exception *a1)
{
}

void sub_186871EFC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v12 = v11;
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v10 - 64), 8);
  objc_begin_catch(v12);
  JUMPOUT(0x186871E90LL);
}

void __Block_byref_object_copy__39(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__39(uint64_t a1)
{
}

void sub_1868723A4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_186872608( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
}

void sub_186872C50( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_186873154( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, char a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29)
{
}

void sub_1868735D4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
}

void sub_186873D78(_Unwind_Exception *a1)
{
}

void sub_186874AC8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, char a35)
{
}

void sub_186875D0C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

#error "1868770DC: call analysis failed (funcsize=29)"
uint64_t __84__NSCloudKitMirroringDelegate__recoverFromUnknownShareRecordIDs_forStore_inMonitor___block_invoke( uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  void **p_cache;
  uint64_t v6;
  void *v7;
  NSManagedObject *v8;
  NSManagedObject *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  os_log_s *v43;
  void *v44;
  BOOL v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  BOOL v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  BOOL v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  char *v74;
  uint64_t v75;
  void *context;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint64_t v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint8_t buf[4];
  void *v87;
  __int16 v88;
  NSManagedObject *v89;
  _BYTE v90[128];
  _BYTE v91[128];
  uint64_t v92;
  v92 = *MEMORY[0x1895F89C0];
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  uint64_t v2 = *(void **)(a1 + 32);
  os_log_t result = [v2 countByEnumeratingWithState:&v82 objects:v91 count:16];
  if (result)
  {
    uint64_t v4 = result;
    p_cache = &OBJC_CLASS___NSSQLUpdateIntermediate.cache;
    v75 = *(void *)v83;
    v71 = v2;
    do
    {
      uint64_t v6 = 0LL;
      v72 = v4;
      do
      {
        if (*(void *)v83 != v75) {
          objc_enumerationMutation(v2);
        }
        int v7 = *(void **)(*((void *)&v82 + 1) + 8 * v6);
        context = (void *)MEMORY[0x186E3E5D8]();
        v81 = 0LL;
        uint64_t v8 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]( (uint64_t)(p_cache + 478),  (void *)[v7 zoneID],  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 8), "databaseScope"),  *(void *)(a1 + 48),  *(void **)(a1 + 56),  (uint64_t)&v81);
        if (v8)
        {
          uint64_t v9 = v8;
          if (-[NSManagedObject encodedShareData](v8, "encodedShareData"))
          {
            uint64_t v10 = (char *)-[NSCKRecordZoneMetadata createRecordZoneID](v9);
            BOOL v11 = *(void *)(*(void *)(a1 + 40) + 8LL);
            if (v11) {
              uint64_t v12 = *(void *)(v11 + 136);
            }
            else {
              uint64_t v12 = 0LL;
            }
            v74 = v10;
            uint64_t v13 = -[PFCloudKitArchivingUtilities shareFromEncodedData:inZoneWithID:error:]( v12,  (void *)-[NSManagedObject encodedShareData](v9, "encodedShareData"),  v10,  &v81);
            v73 = v13;
            if (v13)
            {
              uint64_t v14 = v13;
              uint64_t v15 = (void *)objc_msgSend( objc_alloc(getCloudKitCKShareClass()),  "initWithRecordZoneID:",  objc_msgSend(v7, "zoneID"));
              v77 = 0u;
              v78 = 0u;
              v79 = 0u;
              v80 = 0u;
              uint64_t v16 = (void *)[v14 participants];
              int v17 = [v16 countByEnumeratingWithState:&v77 objects:v90 count:16];
              if (v17)
              {
                uint64_t v18 = v17;
                uint64_t v19 = *(void *)v78;
                do
                {
                  for (uint64_t i = 0LL; i != v18; ++i)
                  {
                    if (*(void *)v78 != v19) {
                      objc_enumerationMutation(v16);
                    }
                    uint64_t v21 = *(void **)(*((void *)&v77 + 1) + 8 * i);
                    if ([v21 role] != 1) {
                      [v15 addParticipant:v21];
                    }
                  }

                  uint64_t v18 = [v16 countByEnumeratingWithState:&v77 objects:v90 count:16];
                }

                while (v18);
              }

              unint64_t v22 = *(void *)(*(void *)(a1 + 40) + 8LL);
              if (v22
                && (unint64_t v23 = *(void *)(v22 + 136)) != 0
                && (unsigned int v24 = -[PFCloudKitArchivingUtilities encodeRecord:error:](v23, (uint64_t)v15, &v81)) != 0LL)
              {
                uint64_t v25 = v24;
                -[NSManagedObject setEncodedShareData:](v9, "setEncodedShareData:", v24);
                p_cache = (void **)(&OBJC_CLASS___NSSQLUpdateIntermediate + 16);
                if ([*(id *)(a1 + 56) save:&v81])
                {
                  *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 1;
                }

                else
                {
                  v62 = (void *)MEMORY[0x186E3E5D8]();
                  v63 = __ckLoggingOverride != 0;
                  v64 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to recover from an unknown item error because the share recovery save failed: %@\n%@"];
                  _NSCoreDataLog( v63,  v64,  v65,  v66,  v67,  v68,  v69,  v70,  (uint64_t)"-[NSCloudKitMirroringDelegate _recoverFromUnknownShareRecordIDs:forStore:inMonitor:]_block_invoke");
                  objc_autoreleasePoolPop(v62);
                }
              }

              else
              {
                v53 = (void *)MEMORY[0x186E3E5D8]();
                v54 = __ckLoggingOverride != 0;
                v55 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to recover from an unknown item error because the replacement share record couldn't be encoded: %@\n%@"];
                _NSCoreDataLog( v54,  v55,  v56,  v57,  v58,  v59,  v60,  v61,  (uint64_t)"-[NSCloudKitMirroringDelegate _recoverFromUnknownShareRecordIDs:forStore:inMonitor:]_block_invoke");
                objc_autoreleasePoolPop(v53);
                uint64_t v25 = 0LL;
                p_cache = (void **)(&OBJC_CLASS___NSSQLUpdateIntermediate + 16);
              }

              uint64_t v35 = context;

              uint64_t v2 = v71;
              uint64_t v4 = v72;
            }

            else
            {
              uint64_t v44 = (void *)MEMORY[0x186E3E5D8]();
              v45 = __ckLoggingOverride != 0;
              v46 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to recover from unknown item error because the current share couldn't be decoded: %@ - %@"];
              _NSCoreDataLog( v45,  v46,  v47,  v48,  v49,  v50,  v51,  v52,  (uint64_t)"-[NSCloudKitMirroringDelegate _recoverFromUnknownShareRecordIDs:forStore:inMonitor:]_block_invoke");
              objc_autoreleasePoolPop(v44);
              uint64_t v35 = context;
            }
          }

          else
          {
            uint64_t v36 = [NSString stringWithUTF8String:"Got an unknown item error for a zone metadata without a share: %@ - %@"];
            _NSCoreDataLog(17LL, v36, v37, v38, v39, v40, v41, v42, (uint64_t)v7);
            uint64_t v43 = (os_log_s *)__pflogFaultLog;
            uint64_t v35 = context;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              v87 = v7;
              v88 = 2112;
              v89 = v9;
              _os_log_fault_impl( &dword_186681000,  v43,  OS_LOG_TYPE_FAULT,  "CoreData: Got an unknown item error for a zone metadata without a share: %@ - %@",  buf,  0x16u);
            }
          }
        }

        else
        {
          uint64_t v26 = (void *)MEMORY[0x186E3E5D8]();
          uint64_t v27 = __ckLoggingOverride != 0;
          uint64_t v28 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to recover from an unknown item error for '%@' because the zone metadata couldn't be fetched: %@"];
          _NSCoreDataLog( v27,  v28,  v29,  v30,  v31,  v32,  v33,  v34,  (uint64_t)"-[NSCloudKitMirroringDelegate _recoverFromUnknownShareRecordIDs:forStore:inMonitor:]_block_invoke");
          objc_autoreleasePoolPop(v26);
          uint64_t v35 = context;
        }

        objc_autoreleasePoolPop(v35);
        ++v6;
      }

      while (v6 != v4);
      os_log_t result = [v2 countByEnumeratingWithState:&v82 objects:v91 count:16];
      uint64_t v4 = result;
    }

    while (result);
  }

  return result;
}

void sub_186878540( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
}

void sub_186878C9C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

void sub_1868794D0( _Unwind_Exception *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, const __CFString *a39, uint64_t a40, uint64_t a41, const __CFString *a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46)
{
  if (!a2) {
    _Unwind_Resume(exc_buf);
  }
  if (a2 == 2)
  {
    id v47 = objc_begin_catch(exc_buf);
    *(_BYTE *)(*(void *)(*(void *)(v46 + 64) + 8LL) + 24LL) = 0;
    id v48 = objc_alloc(MEMORY[0x189607870]);
    uint64_t v49 = *MEMORY[0x1896075F0];
    a39 = @"NSUnderlyingException";
    a40 = v49;
    a41 = (uint64_t)v47;
    a42 = @"Attempt to schedule an import failed because of an unhandled exception.";
    uint64_t v50 = [MEMORY[0x189603F68] dictionaryWithObjects:&a41 forKeys:&a39 count:2];
    *(void *)(*(void *)(*(void *)(v46 + 72) + 8) + 40) = [v48 initWithDomain:*MEMORY[0x189607460] code:134421 userInfo:v50];
    objc_end_catch();
    JUMPOUT(0x186879414LL);
  }

  objc_begin_catch(exc_buf);
  JUMPOUT(0x186879418LL);
}

void sub_18687A920(_Unwind_Exception *exception_object)
{
}

void sub_18687A92C( void *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, const __CFString *a23, uint64_t a24, uint64_t a25, const __CFString *a26)
{
  if (a2 == 1)
  {
    id v27 = objc_begin_catch(exc_buf);
    *(_BYTE *)(*(void *)(*(void *)(v26 + 72) + 8LL) + 24LL) = 0;
    id v28 = objc_alloc(MEMORY[0x189607870]);
    uint64_t v29 = *MEMORY[0x1896075F0];
    a23 = @"NSUnderlyingException";
    a24 = v29;
    a25 = (uint64_t)v27;
    a26 = @"Encountered an unhandled exception while marking zones needing recovery from Manatee identity loss.";
    uint64_t v30 = [MEMORY[0x189603F68] dictionaryWithObjects:&a25 forKeys:&a23 count:2];
    *(void *)(*(void *)(*(void *)(v26 + 64) + 8) + 40) = [v28 initWithDomain:*MEMORY[0x189607460] code:134421 userInfo:v30];
    objc_end_catch();
    JUMPOUT(0x18687A8A8LL);
  }

  JUMPOUT(0x18687A924LL);
}

void sub_18687A9E8()
{
}

void sub_18687AC20( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

void sub_18687B210( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, char a37)
{
}

void sub_18687C24C(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    os_unfair_lock_unlock(v2);
    objc_exception_rethrow();
    __break(1u);
    JUMPOUT(0x18687C278LL);
  }

  _Unwind_Resume(exception_object);
}

void sub_18687C9C0(_Unwind_Exception *a1)
{
}

void sub_18687C9F0(void *a1, int a2)
{
  if (a2)
  {
    objc_begin_catch(a1);
    JUMPOUT(0x18687C97CLL);
  }

  JUMPOUT(0x18687C9E0LL);
}

void __Block_byref_object_copy__40(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__40(uint64_t a1)
{
}

#error "18687D180: call analysis failed (funcsize=50)"
void __81__PFCloudKitImportRecordsWorkItem_newMirroringResultByApplyingAccumulatedChanges__block_invoke_2( uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void v30[6];
  v30[5] = *MEMORY[0x1895F89C0];
  if (!+[_PFRoutines _isInMemoryStore:]((uint64_t)&OBJC_CLASS____PFRoutines, *(unsigned __int8 **)(a1 + 32)))
  {
    v30[0] = 0LL;
    if ((objc_msgSend( *(id *)(a1 + 40),  "setQueryGenerationFromToken:error:",  +[NSQueryGenerationToken currentQueryGenerationToken]( NSQueryGenerationToken,  "currentQueryGenerationToken"),  v30) & 1) == 0)
    {
      uint64_t v2 = (void *)MEMORY[0x186E3E5D8]();
      char v3 = __ckLoggingOverride;
      uint64_t v4 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Unable to set query generation on moc: %@"];
      _NSCoreDataLog( v3 != 0,  v4,  v5,  v6,  v7,  v8,  v9,  v10,  (uint64_t)"-[PFCloudKitImportRecordsWorkItem newMirroringResultByApplyingAccumulatedChanges]_block_invoke_2");
      objc_autoreleasePoolPop(v2);
    }
  }

  if (!-[PFCloudKitImportRecordsWorkItem checkForActiveImportOperationInStore:inManagedObjectContext:error:]( *(void *)(a1 + 48),  *(void *)(a1 + 32),  *(void **)(a1 + 40),  (uint64_t *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL)))
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
    BOOL v11 = (void *)MEMORY[0x186E3E5D8]();
    uint64_t v12 = __ckLoggingOverride;
    uint64_t v13 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to fetch import operation with identifier '%@': %@"];
    _NSCoreDataLog( v12 != 0,  v13,  v14,  v15,  v16,  v17,  v18,  v19,  (uint64_t)"-[PFCloudKitImportRecordsWorkItem newMirroringResultByApplyingAccumulatedChanges]_block_invoke_2");
    objc_autoreleasePoolPop(v11);
LABEL_10:
    uint64_t v20 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
    return;
  }

  if (![*(id *)(a1 + 48) commitMetadataChangesWithContext:*(void *)(a1 + 40) forStore:*(void *)(a1 + 32) error:*(void *)(*(void *)(a1 + 56) + 8) + 40])
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
    goto LABEL_10;
  }

  if ([*(id *)(a1 + 40) save:*(void *)(*(void *)(a1 + 56) + 8) + 40])
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 1;
  }

  else if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL))
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
    uint64_t v21 = (void *)MEMORY[0x186E3E5D8](*(id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL));
    unint64_t v22 = __ckLoggingOverride;
    unint64_t v23 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to save changes from import: %@"];
    _NSCoreDataLog( v22 != 0,  v23,  v24,  v25,  v26,  v27,  v28,  v29,  (uint64_t)"-[PFCloudKitImportRecordsWorkItem newMirroringResultByApplyingAccumulatedChanges]_block_invoke_2");
    objc_autoreleasePoolPop(v21);
  }

void sub_18687D4B0(_Unwind_Exception *exception_object)
{
}

void sub_18687D4BC( void *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, const __CFString *a14, uint64_t a15, uint64_t a16, const __CFString *a17)
{
  if (a2 == 1)
  {
    id v18 = objc_begin_catch(exc_buf);
    *(_BYTE *)(*(void *)(*(void *)(v17 + 64) + 8LL) + 24LL) = 0;
    id v19 = objc_alloc(MEMORY[0x189607870]);
    uint64_t v20 = *MEMORY[0x1896075F0];
    a14 = @"NSUnderlyingException";
    a15 = v20;
    a16 = (uint64_t)v18;
    a17 = @"Import failed because committing the metadata changes hit an unhandled exception.";
    uint64_t v21 = [MEMORY[0x189603F68] dictionaryWithObjects:&a16 forKeys:&a14 count:2];
    *(void *)(*(void *)(*(void *)(v17 + 56) + 8) + 40) = [v19 initWithDomain:*MEMORY[0x189607460] code:134421 userInfo:v21];
    objc_end_catch();
    JUMPOUT(0x18687D3F0LL);
  }

  JUMPOUT(0x18687D4B4LL);
}

void sub_18687D56C()
{
}

void sub_18687DAF4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, char a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29)
{
}

void sub_18687E744( _Unwind_Exception *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, const __CFString *a45, uint64_t a46, uint64_t a47, const __CFString *a48)
{
  if (a2)
  {
    if (a2 == 2)
    {
      id v49 = objc_begin_catch(exc_buf);
      *(_BYTE *)(*(void *)(*(void *)(v48 + 72) + 8LL) + 24LL) = 0;
      id v50 = objc_alloc(MEMORY[0x189607870]);
      uint64_t v51 = *MEMORY[0x1896075F0];
      a45 = @"NSUnderlyingException";
      a46 = v51;
      a47 = (uint64_t)v49;
      a48 = @"Import failed because applying the accumulated changes hit an unhandled exception.";
      uint64_t v52 = [MEMORY[0x189603F68] dictionaryWithObjects:&a47 forKeys:&a45 count:2];
      *(void *)(*(void *)(*(void *)(v48 + 56) + 8) + 40) = [v50 initWithDomain:*MEMORY[0x189607460] code:134421 userInfo:v52];
      objc_end_catch();
      JUMPOUT(0x18687E4E8LL);
    }

    objc_begin_catch(exc_buf);
    JUMPOUT(0x18687E4ECLL);
  }

  _Unwind_Resume(exc_buf);
}

void sub_18687FA68(uint64_t a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x18687FA3CLL);
  }

  JUMPOUT(0x18687FA14LL);
}

#error "186880130: call analysis failed (funcsize=49)"
void __64__PFCloudKitImportRecordsWorkItem_checkAndApplyChangesIfNeeded___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  os_log_s *v10;
  uint64_t v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if ([*(id *)(a1 + 32) hasChanges])
  {
    uint64_t v2 = [NSString stringWithUTF8String:"Incremental import left uncommitted changes in the managed object context: %@"];
    uint64_t v9 = *(void *)(a1 + 40);
    if (v9) {
      uint64_t v9 = *(void *)(v9 + 16);
    }
    _NSCoreDataLog(17LL, v2, v3, v4, v5, v6, v7, v8, v9);
    uint64_t v10 = (os_log_s *)__pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      BOOL v11 = *(void *)(a1 + 40);
      if (v11) {
        BOOL v11 = *(void *)(v11 + 16);
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v13 = v11;
      _os_log_fault_impl( &dword_186681000,  v10,  OS_LOG_TYPE_FAULT,  "CoreData: Incremental import left uncommitted changes in the managed object context: %@",  buf,  0xCu);
    }
  }

void sub_186880AA0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__41(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__41(uint64_t a1)
{
}

void sub_186880BD0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_1868811C0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_186881484( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_186881560( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_186881634( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1868824CC(_Unwind_Exception *a1)
{
}

void sub_186883158( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_186883B0C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, char a49, uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
}

void __Block_byref_object_copy__42(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__42(uint64_t a1)
{
}

void sub_1868849B0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, char a39, uint64_t a40, uint64_t a41, uint64_t a42, char a43)
{
}

void sub_186885524( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, char a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, char a43)
{
}

void sub_186885C30( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, char a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

void sub_1868867F4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  if (a2 != 1) {
    _Unwind_Resume(exception_object);
  }
  id v17 = objc_begin_catch(exception_object);
  if (v16) {
    objc_setProperty_nonatomic(v16, v18, v17, 48LL);
  }
  objc_end_catch();
}

void sub_186886938(_Unwind_Exception *a1)
{
}

void sub_186886954()
{
  if (v2 == 2)
  {
    id v3 = objc_begin_catch(v1);
    if (v0) {
      objc_setProperty_nonatomic(v0, v4, v3, 48LL);
    }
    objc_end_catch();
    JUMPOUT(0x1868868FCLL);
  }

  objc_begin_catch(v1);
  JUMPOUT(0x186886900LL);
}

void sub_186888190(_Unwind_Exception *a1)
{
}

void sub_186888C24(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    JUMPOUT(0x186888AC4LL);
  }

  _Unwind_Resume(exception_object);
}

void sub_18688A650(_Unwind_Exception *a1)
{
}

void sub_18688A6F4(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  _Unwind_Resume(a1);
}

LABEL_205:
LABEL_206:
                v122 = v179;
                if (v179)
                {
                  v123 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
                  if (!_PF_Private_Malloc_Zone)
                  {
                    v123 = malloc_default_zone();
                    v122 = v179;
                  }

                  malloc_zone_free(v123, v122);
                  v124 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
                  if (!_PF_Private_Malloc_Zone) {
                    v124 = malloc_default_zone();
                  }
                  malloc_zone_free(v124, v180);
                }

                v54 = v160;
                goto LABEL_213;
              }

              if ((*(_BYTE *)(v176 + 148) & 1) != 0) {
                v99 = objc_alloc_init(MEMORY[0x189603FA8]);
              }
              else {
                v99 = 0LL;
              }
              v106 = [v30 count];
              if (v106)
              {
                v171 = (void *)+[_PFRoutines newArrayOfObjectIDsFromCollection:]( (uint64_t)&OBJC_CLASS____PFRoutines,  v30);
                v104 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:2 * v106];
              }

              else
              {
                v171 = 0LL;
                v104 = 0LL;
              }

              if ((_DWORD)v175)
              {
                v175 = objc_alloc_init(MEMORY[0x189603FA8]);
                v107 = objc_alloc(MEMORY[0x189603FE0]);
                v108 = (void *)[v107 initWithArray:v171];
                v109 = [v169 count];
                if (v109)
                {
                  for (m = 0LL; v109 != m; ++m)
                  {
                    v111 = [v169 objectAtIndex:m];
                    if (v173[8])
                    {
                      if ([v108 containsObject:v111])
                      {
                        v112 = v99 == 0LL;
                        [v104 addObject:v111];
                        objc_msgSend(v104, "addObject:", objc_msgSend(v177, "objectAtIndex:", m));
                        goto LABEL_184;
                      }

                      if (v179[m])
                      {
LABEL_183:
                        v112 = v99 == 0LL;
                        [v175 addObject:v111];
                        v113 = [v177 objectAtIndex:m];
                        [v175 addObject:v113];
LABEL_184:
                        if (!v112)
                        {
                          [v99 addObject:v111];
                          objc_msgSend(v99, "addObject:", objc_msgSend(v177, "objectAtIndex:", m));
                        }
                      }
                    }

                    else if (v179[m])
                    {
                      goto LABEL_183;
                    }
                  }
                }
              }

              else
              {
                v175 = 0LL;
                v108 = v104;
                v104 = v171;
                v171 = 0LL;
              }

              if (v173[8])
              {
                v114 = (void *)+[_PFRoutines newArrayOfObjectIDsFromCollection:]( (uint64_t)&OBJC_CLASS____PFRoutines,  v168);
                v115 = -[NSSQLSavePlan _correlationTableUpdateTrackerForRelationship:](v176, v173);
                -[NSSQLCorrelationTableUpdateTracker trackInserts:deletes:reorders:forObjectWithID:]( (uint64_t)v115,  v104,  v114,  v175,  (uint64_t)v155);
                if (v99)
                {
                  v116 = v114;

LABEL_194:
                  if ([v99 count]) {
                    v118 = (uint64_t)v99;
                  }
                  else {
                    v118 = 0LL;
                  }
                  if ([v116 count]) {
                    v119 = (uint64_t)v116;
                  }
                  else {
                    v119 = 0LL;
                  }
                  -[NSSQLSavePlan _registerChangedFOKs:deletions:forSourceObject:andRelationship:]( v176,  v118,  v119,  v155,  v174);
                  goto LABEL_204;
                }
              }

              else
              {
                v117 = -[NSSQLSavePlan _correlationTableUpdateTrackerForRelationship:](v176, v173[7]);
                -[NSSQLCorrelationTableUpdateTracker trackReorders:forObjectWithID:]((uint64_t)v117, v175, (uint64_t)v155);
                if (v99)
                {
                  v116 = (id)+[_PFRoutines newArrayOfObjectIDsFromCollection:]((uint64_t)&OBJC_CLASS____PFRoutines, v168);
                  goto LABEL_194;
                }
              }

              v116 = 0LL;
LABEL_204:

              goto LABEL_205;
            }
          }

          else
          {
            v177 = (id)NSArray_EmptyArray;
            -[NSPersistentCacheRow setRelatedObjectIDs:forProperty:options:andTimestamp:](v159, v169, v174, a5);
          }

          -[NSPersistentCacheRow setAncillaryOrderKeys:forProperty:options:andTimestamp:](v159, v177, v174);
          goto LABEL_112;
        }
      }

      -[NSPersistentCacheRow setRelatedObjectIDs:forProperty:options:andTimestamp:](v159, v169, v174, a5);
      v177 = 0LL;
      goto LABEL_112;
    }

    if (!v25 || !v25[4])
    {
      [v171 count];
      uint64_t v46 = 0LL;
      goto LABEL_84;
    }

    uint64_t v46 = -[_NSFaultingMutableOrderedSet _newOrderKeys]((uint64_t)v25);
    id v47 = (os_unfair_lock_s *)[*(id *)(v176 + 8) rowCache];
    uint64_t v48 = -[NSPersistentStoreCache ancillaryOrderKeysForSourceObjectID:forProperty:afterTimestamp:]( v47,  v155,  v174,  *(double *)&NSSQLDistantPastTimeInterval);
    id v49 = [v171 count];
    if (!v48
      || (id v50 = v49, v51 = [v46 count], v51 != -[os_unfair_lock_s count](v48, "count"))
      || v50 != -[os_unfair_lock_s count](v48, "count"))
    {
LABEL_84:

      goto LABEL_85;
    }

    if (v50)
    {
      uint64_t v52 = 0LL;
      do
      {
        v53 = [v171 objectAtIndex:v52];
        if (v53 != [v25 objectAtIndex:v52]
          || (objc_msgSend( (id)objc_msgSend(v46, "objectAtIndex:", v52),  "isEqual:",  -[os_unfair_lock_s objectAtIndex:](v48, "objectAtIndex:", v52)) & 1) == 0)
        {
          goto LABEL_84;
        }
      }

      while (v50 != ++v52);
    }

LABEL_78:
    if (v154 && *(_DWORD *)(v159[5] + 12LL) == 1)
    {
      -[NSPersistentCacheRow setRelatedObjectIDs:forProperty:options:andTimestamp:]( v159,  (void *)NSArray_EmptyArray,  v174,  a5);
      if ((_DWORD)v175) {
        -[NSPersistentCacheRow setAncillaryOrderKeys:forProperty:options:andTimestamp:]( v159,  (void *)NSArray_EmptyArray,  v174);
      }
    }

    v161 = 0LL;
    v54 = 0LL;
    v177 = 0LL;
LABEL_213:

LABEL_214:
    objc_autoreleasePoolPop(v170);
    ++v178;
  }

  while (v178 != v162);
}

                          objc_autoreleasePoolPop(v108);
                          ++v106;
                        }

                        while (v104 != v106);
                        v133 = [v247 countByEnumeratingWithState:&v297 objects:v313 count:16];
                        v104 = v133;
                      }

                      while (v133);
                    }

                    -[NSSQLFetchRequestContext addObjectIDsToRegister:](v253, (uint64_t)v240);
                    -[NSSQLFetchRequestContext addObjectsToAwaken:](v253, (uint64_t)v235);
                  }

                  v232 = [v252 count];
                  if (v256[24] != 9) {
                    goto LABEL_231;
                  }
                  v134 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:v232];
                  v135 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:v232];
                  v295 = 0u;
                  v296 = 0u;
                  v293 = 0u;
                  v294 = 0u;
                  v136 = [v252 countByEnumeratingWithState:&v293 objects:v312 count:16];
                  if (!v136) {
                    goto LABEL_230;
                  }
                  v137 = *(void *)v294;
                  do
                  {
                    v138 = 0LL;
                    do
                    {
                      if (*(void *)v294 != v137) {
                        objc_enumerationMutation(v252);
                      }
                      v139 = *(void **)(*((void *)&v293 + 1) + 8 * v138);
                      v140 = (void *)MEMORY[0x186E3E5D8]();
                      v141 = (void *)[v139 objectID];
                      if (v22) {
                        v142 = _PFRetainedObjectIDCore((uint64_t)v22, v141, 0LL, 1);
                      }
                      else {
                        v142 = 0LL;
                      }
                      if (v264 && [v142 isFault])
                      {
                        _PFFaultHandlerFulfillFault((uint64_t)v259, (uint64_t)v142, (uint64_t)v22, v139, 0);
                        [v135 addObject:v142];
                      }

                      if (v142)
                      {
                        v143 = v142[4];
                        if ((v143 & 0x200) != 0) {
                          goto LABEL_226;
                        }
                        v142[4] = v143 | 0x200;
                      }

                      [v134 addObject:v141];
LABEL_226:

                      objc_autoreleasePoolPop(v140);
                      ++v138;
                    }

                    while (v136 != v138);
                    v144 = [v252 countByEnumeratingWithState:&v293 objects:v312 count:16];
                    v136 = v144;
                  }

                  while (v144);
LABEL_230:
                  -[NSSQLFetchRequestContext addObjectIDsToRegister:](v253, (uint64_t)v134);
                  -[NSSQLFetchRequestContext addObjectsToAwaken:](v253, (uint64_t)v135);

LABEL_231:
                  v230 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:v232];
                  v257 = objc_alloc_init(MEMORY[0x189603FA8]);
                  if (v254) {
                    v224 = objc_alloc_init(MEMORY[0x189603FA8]);
                  }
                  else {
                    v224 = 0LL;
                  }
                  if (v232) {
                    Current = CFAbsoluteTimeGetCurrent();
                  }
                  contextb = objc_alloc_init(MEMORY[0x189603FC8]);
                  v218 = objc_alloc_init(MEMORY[0x189603FA8]);
                  if (v232)
                  {
                    v241 = 0LL;
                    v245 = 0LL;
                    v145 = 0LL;
                    v146 = 0LL;
                    v215 = v227;
                    while (2)
                    {
                      v234 = (void *)MEMORY[0x186E3E5D8]();
                      v238 = (_DWORD *)[v252 objectAtIndex:v241];
                      v236 = [v238 objectID];
                      [v230 addObject:v236];
                      if (!v231 || !v229 || *(_BYTE *)(v229 + 24) != 7) {
                        goto LABEL_284;
                      }
                      [contextb setObject:v238 forKey:v236];
                      v228 = -[NSSQLRow foreignKeyForSlot:]((uint64_t)v238, v221);
                      if (v228 == v145) {
                        goto LABEL_250;
                      }
                      if (!v145)
                      {
                        v146 = v238;
                        v145 = v228;
LABEL_250:
                        [v257 addObject:v236];
                        if (v254) {
                          goto LABEL_280;
                        }
                        goto LABEL_284;
                      }

                      if (v217)
                      {
                        do
                        {
                          v147 = (void *)[v247 objectAtIndex:v245];
                          if ([v147 _referenceData64] == v145)
                          {
                            v148 = v147;
                          }

                          else
                          {
                            v148 = 0LL;
                            ++v245;
                          }
                        }

                        while (!v148);
                      }

                      else
                      {
                        v148 = (id)[v146 newObjectIDForToOne:v229];
                      }

                      v225 = v148;
                      v149 = [(id)v253 rowCache];
                      if (v149) {
                        -[NSPersistentStoreCache registerToMany:withOrderKeys:forSourceObjectID:forProperty:options:andTimestamp:]( v149,  v257,  v224,  v225,  v261,  Current);
                      }
                      [v226 removeObject:v225];
                      if (v22) {
                        v222 = (unsigned int *)_PFRetainedObjectIDCore((uint64_t)v22, v225, 0LL, 1);
                      }
                      else {
                        v222 = 0LL;
                      }
                      v150 = objc_alloc_init(MEMORY[0x189603FA8]);
                      v151 = objc_alloc_init(MEMORY[0x189603FA8]);
                      v152 = objc_alloc_init(MEMORY[0x189603FA8]);
                      v291 = 0u;
                      v292 = 0u;
                      v289 = 0u;
                      v290 = 0u;
                      v153 = [v257 countByEnumeratingWithState:&v289 objects:v311 count:16];
                      if (v153)
                      {
                        v154 = *(void *)v290;
                        do
                        {
                          v155 = 0LL;
                          do
                          {
                            if (*(void *)v290 != v154) {
                              objc_enumerationMutation(v257);
                            }
                            v156 = *(void **)(*((void *)&v289 + 1) + 8 * v155);
                            v158 = (void *)MEMORY[0x186E3E5D8]();
                            if (v22) {
                              v159 = _PFRetainedObjectIDCore((uint64_t)v22, v156, 0LL, 1);
                            }
                            else {
                              v159 = 0LL;
                            }
                            if (v264)
                            {
                              if ([v159 isFault])
                              {
                                v157 = (void *)[contextb objectForKey:v156];
                                if (v157)
                                {
                                  _PFFaultHandlerFulfillFault((uint64_t)v259, (uint64_t)v159, (uint64_t)v22, v157, 0);
                                  [v152 addObject:v159];
                                }
                              }
                            }

                            if (v159)
                            {
                              v160 = v159[4];
                              if ((v160 & 0x200) != 0) {
                                goto LABEL_272;
                              }
                              v159[4] = v160 | 0x200;
                            }

                            objc_msgSend(v151, "addObject:", v156, v157);
LABEL_272:
                            objc_msgSend(v150, "addObject:", v159, v157);

                            objc_autoreleasePoolPop(v158);
                            ++v155;
                          }

                          while (v153 != v155);
                          v161 = [v257 countByEnumeratingWithState:&v289 objects:v311 count:16];
                          v153 = v161;
                        }

                        while (v161);
                      }

                      -[NSSQLFetchRequestContext addObjectIDsToRegister:](v253, (uint64_t)v151);
                      -[NSSQLFetchRequestContext addObjectsToAwaken:](v253, (uint64_t)v152);

                      v162 = off_189EA56C0;
                      if (!v254) {
                        v162 = off_189EA56C8;
                      }
                      v163 = (void *)[objc_alloc(*v162) initWithSource:v222 destinations:v150 forRelationship:v261 inContext:v22];

                      _PFFaultHandlerPreconnectRelationship((int)v259, v222, v261, v163);
                      [v218 addObject:v225];

                      if (v254)
                      {

                        v257 = objc_alloc_init(MEMORY[0x189603FA8]);
                        v224 = objc_alloc_init(MEMORY[0x189603FA8]);
                        [v257 addObject:v236];
                        v145 = v228;
                        v146 = v238;
LABEL_280:
                        v164 = v238
                        objc_msgSend( v224,  "addObject:",  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", v164));
                      }

                      else
                      {
                        v257 = objc_alloc_init(MEMORY[0x189603FA8]);
                        [v257 addObject:v236];
                        v146 = v238;
                        v145 = v228;
                      }

void sub_18688BB60(_Unwind_Exception *a1)
{
}

void sub_18688BB78(uint64_t a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  JUMPOUT(0x18688BB84LL);
}

void sub_18688BCEC(_Unwind_Exception *a1)
{
}

void sub_18688BD08()
{
}

void sub_18688D934( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

void __Block_byref_object_copy__43(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__43(uint64_t a1)
{
}

void sub_18688E7BC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, id a38)
{
}

void sub_18688ED3C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void __Block_byref_object_copy__44(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__44(uint64_t a1)
{
}

void sub_18688F2C4(_Unwind_Exception *a1)
{
}

void sub_18688F310()
{
}

void sub_18688F328( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
}

void sub_186890B04( _Unwind_Exception *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
  if (a2)
  {
    objc_begin_catch(exc_buf);
    JUMPOUT(0x186890908LL);
  }

  _Unwind_Resume(exc_buf);
}

void sub_186890C14(void *exc_buf, int a2)
{
  if (a2)
  {
    objc_begin_catch(exc_buf);
    JUMPOUT(0x186890248LL);
  }

  JUMPOUT(0x186890C00LL);
}

void sub_186891E54(uint64_t a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x186891E2CLL);
  }

  JUMPOUT(0x186891EA0LL);
}

void sub_186891E64()
{
}

void sub_186891E70()
{
  if ((v0 & 1) != 0) {
    JUMPOUT(0x186891E78LL);
  }
  JUMPOUT(0x186891E7CLL);
}

void sub_186891EA8(uint64_t a1, int a2)
{
  if (!a2) {
    JUMPOUT(0x186891EA0LL);
  }
  objc_terminate();
  __101__PFCloudKitExportContext_newOperationBySerializingDirtyObjectsInStore_inManagedObjectContext_error___block_invoke(v2);
}

void sub_186893380(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  _Unwind_Resume(a1);
}

void sub_186893484(void *a1, int a2)
{
  if (a2)
  {
    objc_begin_catch(a1);
    JUMPOUT(0x186893198LL);
  }

  JUMPOUT(0x18689347CLL);
}

void sub_186893A20( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

void sub_1868946F0( _Unwind_Exception *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  if (a2)
  {
    objc_begin_catch(exc_buf);
    JUMPOUT(0x186894664LL);
  }

  _Unwind_Resume(exc_buf);
}

void sub_18689480C(void *exc_buf, int a2)
{
  if (a2)
  {
    objc_begin_catch(exc_buf);
    JUMPOUT(0x186894678LL);
  }

  JUMPOUT(0x1868947E0LL);
}

uint64_t recordIDComparator_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(a2, "recordName"), "caseInsensitiveCompare:", objc_msgSend(a3, "recordName"));
  if (!result)
  {
    uint64_t result = objc_msgSend( (id)objc_msgSend((id)objc_msgSend(a2, "zoneID"), "zoneName"),  "caseInsensitiveCompare:",  objc_msgSend((id)objc_msgSend(a3, "zoneID"), "zoneName"));
    if (!result) {
      return objc_msgSend( (id)objc_msgSend((id)objc_msgSend(a2, "zoneID"), "ownerName"),  "caseInsensitiveCompare:",  objc_msgSend((id)objc_msgSend(a3, "zoneID"), "ownerName"));
    }
  }

  return result;
}

void sub_1868950A8(_Unwind_Exception *a1)
{
}

void __Block_byref_object_copy__45(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__45(uint64_t a1)
{
}

void sub_18689687C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, char a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, char a45)
{
}

void sub_186897DD4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
}

void sub_1868988FC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
}

void sub_186899070( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, char a33, uint64_t a34, uint64_t a35, uint64_t a36, char a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, char a43, uint64_t a44, uint64_t a45, uint64_t a46, char a47)
{
}

void sub_186899610( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, char a25)
{
}

void sub_18689BAF4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, void (*a12)(char *))
{
}

void sub_18689CFC0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void __Block_byref_object_copy__46(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__46(uint64_t a1)
{
}

void sub_18689D6D0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_18689D7E4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_18689ED4C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void __Block_byref_object_copy__47(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__47(uint64_t a1)
{
}

void sub_1868A07D4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    JUMPOUT(0x1868A0724LL);
  }

  _Unwind_Resume(exception_object);
}

void sub_1868A1224(_Unwind_Exception *exc_buf, int a2)
{
  if (a2)
  {
    objc_begin_catch(exc_buf);
    JUMPOUT(0x1868A110CLL);
  }

  _Unwind_Resume(exc_buf);
}

void sub_1868A1778(_Unwind_Exception *exc_buf, int a2)
{
  if (a2)
  {
    objc_begin_catch(exc_buf);
    JUMPOUT(0x1868A16D8LL);
  }

  _Unwind_Resume(exc_buf);
}

void sub_1868A379C()
{
  if ((v0 & 1) != 0) {
    JUMPOUT(0x1868A37A4LL);
  }
  JUMPOUT(0x1868A37A8LL);
}

void __Block_byref_object_copy__48(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__48(uint64_t a1)
{
}

void sub_1868A3C80( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

#error "1868A3FD0: call analysis failed (funcsize=68)"
void -[PFCloudKitMetadataModelMigrator addMigrationStatementToContext:forRenamingAttributeNamed:withOldColumnName:toAttributeName:onOldSQLEntity:andCurrentSQLEntity:]( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  id *a6)
{
  uint64_t v12;
  void *v13;
  void *v14;
  NSSQLiteStatement *v15;
  NSSQLiteStatement *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  os_log_s *v24;
  NSSQLiteStatement *v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  id *v31;
  uint64_t v32;
  uint64_t v32 = *MEMORY[0x1895F89C0];
  if (a6 && (uint64_t v12 = [a6[5] objectForKey:a4]) != 0)
  {
    uint64_t v13 = (void *)v12;
    if (a5)
    {
      uint64_t v14 = (void *)[*(id *)(a5 + 40) objectForKey:a2];
      if (v14) {
        a3 = [v14 columnName];
      }
    }

    uint64_t v15 = objc_alloc(&OBJC_CLASS___NSSQLiteStatement);
    uint64_t v16 = -[NSSQLiteStatement initWithEntity:sqlString:]( v15,  "initWithEntity:sqlString:",  a6,  [NSString stringWithFormat:@"ALTER TABLE %@ RENAME COLUMN %@ TO %@", objc_msgSend(a6, "tableName"), a3, objc_msgSend(v13, "columnName")]);
    if (a1)
    {
      uint64_t v25 = v16;
      [*(id *)(a1 + 8) addObject:v16];
      uint64_t v16 = v25;
      *(_BYTE *)(a1 + 32) = 1;
    }
  }

  else
  {
    id v17 = [NSString stringWithUTF8String:"Unable to find attribute to migrate to '%@' from '%@' on entity: %@"];
    _NSCoreDataLog(17LL, v17, v18, v19, v20, v21, v22, v23, a4);
    unsigned int v24 = (os_log_s *)__pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v27 = a4;
      id v28 = 2112;
      uint64_t v29 = a2;
      uint64_t v30 = 2112;
      uint64_t v31 = a6;
      _os_log_fault_impl( &dword_186681000,  v24,  OS_LOG_TYPE_FAULT,  "CoreData: Unable to find attribute to migrate to '%@' from '%@' on entity: %@",  buf,  0x20u);
    }
  }

void sub_1868A4508(_Unwind_Exception *a1)
{
}

void sub_1868A4544(uint64_t a1, int a2)
{
  if (a2) {
    JUMPOUT(0x1868A454CLL);
  }
  JUMPOUT(0x1868A4528LL);
}

void sub_1868A45EC(uint64_t a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x1868A45F8LL);
  }

  JUMPOUT(0x1868A4528LL);
}

LABEL_159:
  v87 = *(void *)(v121 + 40);
  if (*(_BYTE *)(*(void *)(v87 + 8) + 24LL)) {
    v125 = v120;
  }
  else {
    v125 = 1;
  }
  if ((v125 & 1) != 0) {
    goto LABEL_168;
  }
  if (-[PFCloudKitMetadataModelMigrator cleanUpAfterClientMigrationWithStore:andContext:error:]( *(void *)(a1 + 32),  *(void **)(*(void *)(a1 + 32) + 8LL),  *(void **)(*(void *)(a1 + 32) + 16LL),  &v172))
  {
    v126 = +[NSCKMetadataEntry updateOrInsertMetadataEntryWithKey:transformedValue:forStore:intoManagedObjectContext:error:]( (uint64_t)NSCKMetadataEntry,  (uint64_t)@"PFCloudKitMetadataClientVersionHashesKey",  objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "persistentStoreCoordinator"),  "managedObjectModel"),  "entityVersionHashesByName"),  *(void *)(*(void *)(a1 + 32) + 8),  *(void **)(*(void *)(a1 + 32) + 16),  &v172);
    v87 = *(void *)(a1 + 40);
    if (v126) {
      goto LABEL_168;
    }
    *(_BYTE *)(*(void *)(v87 + 8) + 24LL) = 0;
    v127 = v172;
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
    v127 = v172;
  }

  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) = v127;
  v87 = *(void *)(a1 + 40);
LABEL_168:
  if (*(_BYTE *)(*(void *)(v87 + 8) + 24LL))
  {
    PFBundleVersion = +[_PFRoutines _getPFBundleVersionNumber]();
    if (!+[NSCKMetadataEntry updateOrInsertMetadataEntryWithKey:integerValue:forStore:intoManagedObjectContext:error:]( (uint64_t)&OBJC_CLASS___NSCKMetadataEntry,  (uint64_t)@"PFCloudKitMetadataFrameworkVersionKey",  PFBundleVersion,  *(void *)(*(void *)(a1 + 32) + 8LL),  *(void **)(*(void *)(a1 + 32) + 16LL),  &v172)
      || (v129 = *(void *)(a1 + 32), (v130 = *(void *)(v129 + 24)) != 0)
      && *(_BYTE *)(v130 + 33)
      && !+[NSCKMetadataEntry updateOrInsertMetadataEntryWithKey:BOOLValue:forStore:intoManagedObjectContext:error:]( (uint64_t)&OBJC_CLASS___NSCKMetadataEntry,  (uint64_t)@"PFCloudKitMetadataNeedsMetadataMigrationKey",  1,  *(void *)(v129 + 8),  *(void **)(v129 + 16),  &v172))
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) = v172;
    }
  }

  v131 = a1;
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL)) {
    return;
  }
  v132 = *(void *)(*(void *)(a1 + 32) + 24LL);
  if (v132 && *(_BYTE *)(v132 + 36))
  {
    v133 = -[NSBatchUpdateRequest initWithEntityName:]( objc_alloc(&OBJC_CLASS___NSBatchUpdateRequest),  "initWithEntityName:",  +[NSCKRecordZoneMetadata entityPath](&OBJC_CLASS___NSCKRecordZoneMetadata, "entityPath"));
    v183[0] = @"needsImport";
    v184[0] = [MEMORY[0x189607878] expressionForConstantValue:MEMORY[0x189604A88]];
    v183[1] = @"currentChangeToken";
    v184[1] = [MEMORY[0x189607878] expressionForConstantValue:0];
    v183[2] = @"lastFetchDate";
    v184[2] = [MEMORY[0x189607878] expressionForConstantValue:0];
    -[NSBatchUpdateRequest setPropertiesToUpdate:]( v133,  "setPropertiesToUpdate:",  [MEMORY[0x189603F68] dictionaryWithObjects:v184 forKeys:v183 count:3]);
    -[NSBatchUpdateRequest setResultType:](v133, "setResultType:", 0LL);
    if ((objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "executeRequest:error:", v133, &v172),  "result"),  "BOOLValue") & 1) == 0)
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) = v172;

      v133 = 0LL;
    }

    v131 = a1;
    if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL)) {
      return;
    }
  }

  v134 = [*(id *)(*(void *)(v131 + 32) + 16) save:&v172];
  v135 = a1;
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v134;
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL))
  {
    v136 = v172;
    v135 = a1;
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) = v136;
    if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL)) {
      return;
    }
  }

  v137 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(v135 + 32) + 8), "metadata"), "mutableCopy");
  v156 = 0u;
  v157 = 0u;
  v154 = 0u;
  v155 = 0u;
  v138 = (void *)+[NSCloudKitMirroringDelegatePreJazzkonMetadata allDefaultsKeys]();
  v139 = [v138 countByEnumeratingWithState:&v154 objects:v182 count:16];
  if (v139)
  {
    v140 = *(void *)v155;
    do
    {
      for (k = 0LL; k != v139; ++k)
      {
        if (*(void *)v155 != v140) {
          objc_enumerationMutation(v138);
        }
        [v137 removeObjectForKey:*(void *)(*((void *)&v154 + 1) + 8 * k)];
      }

      v139 = [v138 countByEnumeratingWithState:&v154 objects:v182 count:16];
    }

    while (v139);
  }

  [v137 removeObjectForKey:@"_NSStoreAncillaryModelVersionHashesMetadataKey"];
  [v137 removeObjectForKey:@"PFCloudKitMetadataNeedsZoneFetchAfterClientMigrationKey"];
  [*(id *)(*(void *)(a1 + 32) + 8) setMetadata:v137];

  v142 = [*(id *)(*(void *)(a1 + 32) + 16) save:&v172];
  unsigned int v24 = a1;
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v142;
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL)) {
    goto LABEL_15;
  }
  unint64_t v23 = v172;
LABEL_14:
  unsigned int v24 = a1;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) = v23;
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL)) {
    return;
  }
LABEL_15:
  uint64_t v25 = (void *)+[NSCKMetadataEntry entryForKey:fromStore:inManagedObjectContext:error:]( (uint64_t)&OBJC_CLASS___NSCKMetadataEntry,  (uint64_t)@"PFCloudKitMetadataNeedsMetadataMigrationKey",  *(void *)(*(void *)(v24 + 32) + 8LL),  *(void **)(*(void *)(v24 + 32) + 16LL),  (uint64_t)&v172);
  uint64_t v26 = v172;
  if (v172)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
    id v27 = v26;
LABEL_17:
    id v28 = *(void *)(a1 + 48);
LABEL_18:
    *(void *)(*(void *)(v28 + 8) + 40LL) = v27;
    return;
  }

  if ([v25 BOOLValue])
  {
    uint64_t v29 = *(void *)(a1 + 32);
    uint64_t v30 = *(void **)(v29 + 8);
    uint64_t v31 = *(void **)(v29 + 16);
    v151 = v29;
    v178 = 0LL;
    v179 = &v178;
    v180 = 0x2020000000LL;
    v181 = 1;
    *(void *)v197 = 0LL;
    v198 = v197;
    v199 = 0x3052000000LL;
    v200 = __Block_byref_object_copy__48;
    v201 = __Block_byref_object_dispose__48;
    v202 = 0LL;
    uint64_t v32 = (void *)objc_msgSend( (id)objc_msgSend((id)objc_msgSend(v31, "persistentStoreCoordinator"), "managedObjectModel"),  "entitiesForConfiguration:",  objc_msgSend(v30, "configurationName"));
    v176 = 0u;
    v177 = 0u;
    v174 = 0u;
    v175 = 0u;
    v33 = [v32 countByEnumeratingWithState:&v174 objects:v196 count:16];
    if (v33)
    {
      v34 = *(void *)v175;
LABEL_22:
      uint64_t v35 = 0LL;
      while (1)
      {
        if (*(void *)v175 != v34) {
          objc_enumerationMutation(v32);
        }
        uint64_t v36 = *(void **)(*((void *)&v174 + 1) + 8 * v35);
        if (objc_msgSend((id)objc_msgSend(v36, "attributesByName"), "objectForKey:", @"ckRecordID"))
        {
          if (objc_msgSend((id)objc_msgSend(v36, "attributesByName"), "objectForKey:", @"ckRecordSystemFields"))
          {
            uint64_t v37 = +[NSFetchRequest fetchRequestWithEntityName:]( NSFetchRequest,  "fetchRequestWithEntityName:",  [v36 name]);
            v195[0] = @"ckRecordID";
            v195[1] = @"ckRecordSystemFields";
            -[NSFetchRequest setPropertiesToFetch:]( v37,  "setPropertiesToFetch:",  [MEMORY[0x189603F18] arrayWithObjects:v195 count:2]);
            -[NSFetchRequest setPredicate:]( v37,  "setPredicate:",  objc_msgSend(MEMORY[0x1896079C8], "predicateWithFormat:", @"%K != nil", @"ckRecordID"));
            -[NSFetchRequest setFetchBatchSize:](v37, "setFetchBatchSize:", 200LL);
            v194 = v30;
            -[NSFetchRequest setAffectedStores:]( v37,  "setAffectedStores:",  [MEMORY[0x189603F18] arrayWithObjects:&v194 count:1]);
            v173[0] = MEMORY[0x1895F87A8];
            v173[1] = 3221225472LL;
            v173[2] = __107__PFCloudKitMetadataModelMigrator_migrateMetadataForObjectsInStore_toNSCKRecordMetadataUsingContext_error___block_invoke;
            v173[3] = &unk_189EABBA8;
            v173[4] = v151;
            v173[5] = v30;
            v173[6] = v31;
            v173[7] = v197;
            v173[8] = &v178;
            +[_PFRoutines efficientlyEnumerateManagedObjectsInFetchRequest:usingManagedObjectContext:andApplyBlock:]( (uint64_t)&OBJC_CLASS____PFRoutines,  (uint64_t)v37,  v31,  (uint64_t)v173);
            if (!*((_BYTE *)v179 + 24)) {
              break;
            }
          }
        }

        if (v33 == ++v35)
        {
          v33 = [v32 countByEnumeratingWithState:&v174 objects:v196 count:16];
          if (v33) {
            goto LABEL_22;
          }
          break;
        }
      }
    }

    if (!*((_BYTE *)v179 + 24))
    {
      uint64_t v38 = *((id *)v198 + 5);
      if (v38)
      {
        v172 = v38;
      }

      else
      {
        v71 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
        _NSCoreDataLog( 17LL,  v71,  v72,  v73,  v74,  v75,  v76,  v77,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m");
        v78 = (os_log_s *)__pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          v191 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m";
          v192 = 1024;
          v193 = 1527;
          _os_log_fault_impl( &dword_186681000,  v78,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
        }
      }
    }

    *((void *)v198 + 5) = 0LL;
    v79 = *((unsigned __int8 *)v179 + 24);
    _Block_object_dispose(v197, 8);
    _Block_object_dispose(&v178, 8);
    if (v79)
    {
      if (!+[NSCKMetadataEntry updateOrInsertMetadataEntryWithKey:BOOLValue:forStore:intoManagedObjectContext:error:]( (uint64_t)&OBJC_CLASS___NSCKMetadataEntry,  (uint64_t)@"PFCloudKitMetadataNeedsMetadataMigrationKey",  0,  *(void *)(*(void *)(a1 + 32) + 8LL),  *(void **)(*(void *)(a1 + 32) + 16LL),  &v172))
      {
        *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
        id v27 = v172;
        goto LABEL_17;
      }

      v80 = +[NSCKMetadataEntry entryForKey:fromStore:inManagedObjectContext:error:]( (uint64_t)&OBJC_CLASS___NSCKMetadataEntry,  (uint64_t)@"PFCloudKitMetadataModelMigratorMigrationBeganCommitKey",  *(void *)(*(void *)(a1 + 32) + 8LL),  *(void **)(*(void *)(a1 + 32) + 16LL),  (uint64_t)&v172);
      if (v80)
      {
        v81 = (void *)a1;
        [*(id *)(*(void *)(a1 + 32) + 16) deleteObject:v80];
      }

      else
      {
        v82 = v172;
        v81 = (void *)a1;
        if (v172)
        {
          *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
          *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) = v82;
        }
      }

      if (*(_BYTE *)(*(void *)(v81[5] + 8LL) + 24LL)
        && ([*(id *)(v81[4] + 16) save:&v172] & 1) == 0)
      {
        *(_BYTE *)(*(void *)(v81[5] + 8LL) + 24LL) = 0;
        id v27 = v172;
        id v28 = v81[6];
        goto LABEL_18;
      }
    }

    else
    {
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) = v172;
      *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
    }
  }

void sub_1868A62B8()
{
}

void sub_1868A6C6C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, char a21, uint64_t a22, uint64_t a23, uint64_t a24, char a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31)
{
}

void sub_1868A7188( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, char a37)
{
}

void sub_1868A7768( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, char a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, char a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, char a41, uint64_t a42, uint64_t a43, uint64_t a44, char a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,char a51)
{
}

LABEL_161:
        ++v349;
      }

      while (v349 != v59);
      v312 = [(id)v52 countByEnumeratingWithState:&v397 objects:&v440 count:16];
      v59 = v312;
    }

    while (v312);
  }

LABEL_354:
  if (!*((_BYTE *)v408 + 24))
  {
    v313 = (id)v402[5];
    if (v313)
    {
      *(void *)(v339 + 40) = v313;
    }

    else
    {
      v314 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v314,  v315,  v316,  v317,  v318,  v319,  v320,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m");
      v321 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)v446 = 136315394;
        *(void *)&v446[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataModelMigrator.m";
        *(_WORD *)&v446[12] = 1024;
        *(_DWORD *)&v446[14] = 542;
        _os_log_fault_impl( &dword_186681000,  v321,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  v446,  0x12u);
      }
    }
  }

  v402[5] = 0LL;
  v322 = *((unsigned __int8 *)v408 + 24);
  _Block_object_dispose(&v401, 8);
  _Block_object_dispose(&v407, 8);
  if (!v322) {
    goto LABEL_386;
  }
  v323 = a1[4];
  if (a2)
  {
    v324 = *(void *)(a2 + 24);
    if (v323) {
      goto LABEL_362;
    }
LABEL_386:
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 0;
    v338 = *(id *)(*(void *)(a1[6] + 8LL) + 40LL);
    return;
  }

  v324 = 0LL;
  if (!v323) {
    goto LABEL_386;
  }
LABEL_362:
  v325 = *(void *)(v323 + 24);
  if (v325 && *(_BYTE *)(v325 + 32))
  {
    -[NSSQLiteConnection connect](v324);
    -[NSSQLiteConnection beginTransaction](v324);
    v432 = 0u;
    v431 = 0u;
    v430 = 0u;
    v429 = 0u;
    v326 = *(void *)(v323 + 24);
    if (v326) {
      v327 = *(void **)(v326 + 24);
    }
    else {
      v327 = 0LL;
    }
    v328 = [v327 countByEnumeratingWithState:&v429 objects:v446 count:16];
    if (v328)
    {
      v329 = *(void *)v430;
      do
      {
        for (iuint64_t i = 0LL; ii != v328; ++ii)
        {
          if (*(void *)v430 != v329) {
            objc_enumerationMutation(v327);
          }
          -[NSSQLiteConnection dedupeRowsForUniqueConstraintsInCloudKitMetadataEntity:]( v324,  *(void *)(*((void *)&v429 + 1) + 8 * ii));
        }

        v328 = [v327 countByEnumeratingWithState:&v429 objects:v446 count:16];
      }

      while (v328);
    }

    v428 = 0u;
    v427 = 0u;
    v426 = 0u;
    v425 = 0u;
    v331 = *(void *)(v323 + 24);
    if (v331) {
      v332 = *(void **)(v331 + 8);
    }
    else {
      v332 = 0LL;
    }
    v333 = [v332 countByEnumeratingWithState:&v425 objects:&v440 count:16];
    if (v333)
    {
      v334 = *(void *)v426;
      do
      {
        for (jj = 0LL; jj != v333; ++jj)
        {
          if (*(void *)v426 != v334) {
            objc_enumerationMutation(v332);
          }
          -[NSSQLiteConnection prepareAndExecuteSQLStatement:](v324, *(void **)(*((void *)&v425 + 1) + 8 * jj));
        }

        v333 = [v332 countByEnumeratingWithState:&v425 objects:&v440 count:16];
      }

      while (v333);
    }

    v336 = *(void *)(v323 + 24);
    if (v336) {
      v337 = *(void **)(v336 + 16);
    }
    else {
      v337 = 0LL;
    }
    -[NSSQLiteConnection createTablesForEntities:](v324, v337);
    -[NSSQLiteConnection commitTransaction](v324);
  }

  -[NSSQLiteConnection endFetchAndRecycleStatement:](v324, 0);
}

void sub_1868A9FBC(_Unwind_Exception *a1)
{
}

#error "1868AA9B8: call analysis failed (funcsize=86)"
void sub_1868AAA34(uint64_t a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x1868AA9ECLL);
  }

  JUMPOUT(0x1868AA890LL);
}

NSAttributeDescription *makeAttribute(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSAttributeDescription);
  -[NSPropertyDescription setName:](v4, "setName:", a1);
  -[NSAttributeDescription setAttributeType:](v4, "setAttributeType:", a2);
  return v4;
}

#error "1868AC898: call analysis failed (funcsize=52)"
unint64_t __cdecl +[NSSQLiteIndexTrackingModel ancillaryEntityCount](id a1, SEL a2)
{
  return 1LL;
}

void sub_1868AD904(_Unwind_Exception *a1)
{
}

void sub_1868AE0D8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_1868AE584()
{
}

void sub_1868AE590(_Unwind_Exception *a1)
{
}

void sub_1868AE6C0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void __Block_byref_object_copy__49(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__49(uint64_t a1)
{
}

os_signpost_id_t ___executeObjectFaultRequest_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (PFInstrumentsGetLog_logtoken != -1) {
    dispatch_once(&PFInstrumentsGetLog_logtoken, &__block_literal_global_24);
  }
  os_signpost_id_t v2 = os_signpost_id_generate((os_log_t)PFInstrumentsGetLog_coreDataInstrumentsLog);
  if (PFInstrumentsGetLog_logtoken != -1) {
    dispatch_once(&PFInstrumentsGetLog_logtoken, &__block_literal_global_24);
  }
  id v3 = (os_log_s *)PFInstrumentsGetLog_coreDataInstrumentsLog;
  kdebug_trace();
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138412290;
    uint64_t v7 = v4;
    _os_signpost_emit_with_name_impl( &dword_186681000,  v3,  OS_SIGNPOST_INTERVAL_BEGIN,  v2,  "Fault",  "%@",  (uint8_t *)&v6,  0xCu);
  }

  return v2;
}

os_signpost_id_t ___newFetchedPKsForRelationshipFaultRequest_block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  if (PFInstrumentsGetLog_logtoken != -1) {
    dispatch_once(&PFInstrumentsGetLog_logtoken, &__block_literal_global_24);
  }
  os_signpost_id_t v2 = os_signpost_id_generate((os_log_t)PFInstrumentsGetLog_coreDataInstrumentsLog);
  if (PFInstrumentsGetLog_logtoken != -1) {
    dispatch_once(&PFInstrumentsGetLog_logtoken, &__block_literal_global_24);
  }
  id v3 = (os_log_s *)PFInstrumentsGetLog_coreDataInstrumentsLog;
  kdebug_trace();
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = [*(id *)(a1 + 40) name];
    int v7 = 138412546;
    uint64_t v8 = v4;
    __int16 v9 = 2112;
    uint64_t v10 = v5;
    _os_signpost_emit_with_name_impl( &dword_186681000,  v3,  OS_SIGNPOST_INTERVAL_BEGIN,  v2,  "RelationshipFault",  "%@ - %@",  (uint8_t *)&v7,  0x16u);
  }

  return v2;
}

void *_rawSQLForToManyFaultStatement(void *a1, int a2, int a3)
{
  int v6 = (void *)[a1 sqlString];
  uint64_t v7 = [v6 rangeOfString:@" FROM " options:6];
  uint64_t v9 = v8;
  uint64_t v10 = [v6 rangeOfString:@" WHERE " options:6];
  uint64_t v12 = stripEmptyStringsFromArray((void *)objc_msgSend( (id)objc_msgSend(v6, "substringWithRange:", v7 + 1, v10 - v7 + v11 - 2),  "componentsSeparatedByString:",  @" "));
  else {
    uint64_t v13 = (const __CFString *)objc_msgSend( (id)objc_msgSend(v12, "objectAtIndex:", 2),  "stringByAppendingString:",  @".");
  }
  if ((unint64_t)[v12 count] < 6)
  {
    uint64_t v15 = objc_msgSend(MEMORY[0x189607940], "stringWithString:", objc_msgSend(v6, "substringFromIndex:", v7 + v9));
  }

  else
  {
    uint64_t v14 = (void *)objc_msgSend(v12, "subarrayWithRange:", 6, objc_msgSend(v12, "count") - 7);
    uint64_t v15 = [MEMORY[0x189607940] stringWithFormat:@"%@ %@ JOIN %@ %@ %@%@", objc_msgSend(v12, "objectAtIndex:", 4), objc_msgSend(v12, "objectAtIndex:", 5), objc_msgSend(v12, "objectAtIndex:", 1), objc_msgSend(v12, "objectAtIndex:", 2), objc_msgSend(v14, "componentsJoinedByString:", @" "), objc_msgSend(v6, "substringFromIndex:", v10)];
  }

  uint64_t v16 = (void *)v15;
  uint64_t v17 = [a1 entity];
  if (!v17 || (id v18 = *(void **)(v17 + 152)) == 0LL)
  {
    uint64_t v20 = (void *)NSString;
LABEL_13:
    if (a3) {
      uint64_t v23 = [v20 stringWithFormat:@"SELECT %@%@ FROM ", v13, @"Z_PK", v29, v30];
    }
    else {
      uint64_t v23 = [v20 stringWithFormat:@"SELECT 0, %@%@ FROM ", v13, @"Z_PK", v29, v30];
    }
    goto LABEL_18;
  }

  uint64_t v19 = [v18 count];
  uint64_t v20 = (void *)NSString;
  if (!v19) {
    goto LABEL_13;
  }
  if (a3)
  {
    uint64_t v21 = @"Z_PK";
    unint64_t v22 = NSSQLEntityColumnName;
  }

  else
  {
    uint64_t v21 = @"Z_ENT";
    unint64_t v22 = NSSQLPKColumnName;
  }

  uint64_t v23 = [NSString stringWithFormat:@"SELECT %@%@, %@%@ FROM ", v13, v21, v13, *v22];
LABEL_18:
  [v16 insertString:v23 atIndex:0];
  if (a2 && objc_msgSend((id)objc_msgSend(a1, "bindVariables"), "count"))
  {
    unsigned int v24 = (void *)[v16 componentsSeparatedByString:@" ?"];
    uint64_t v16 = (void *)objc_msgSend(MEMORY[0x189607940], "stringWithCapacity:", objc_msgSend(v16, "length"));
    uint64_t v25 = [v24 count];
    uint64_t v26 = v25 - 1;
    if (v25 != 1)
    {
      uint64_t v27 = 0LL;
      do
      {
        objc_msgSend(v16, "appendString:", objc_msgSend(v24, "objectAtIndex:", v27));
        objc_msgSend( v16,  "appendFormat:",  @" %qi",  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "bindVariables"), "objectAtIndex:", v27++), "int64"));
      }

      while (v26 != v27);
    }

    objc_msgSend(v16, "appendString:", objc_msgSend(v24, "objectAtIndex:", v26));
  }

  return v16;
}

unint64_t sortRawRowsForOrderedFaulting(id *a1, void **a2)
{
  os_signpost_id_t v2 = *a2;
  uint64_t v3 = objc_msgSend((id)objc_msgSend(*a1, "valueAtIndex:", 1), "longLongValue");
  uint64_t v4 = objc_msgSend((id)objc_msgSend(v2, "valueAtIndex:", 1), "longLongValue");
  return (v3 > v4) - (unint64_t)(v3 < v4);
}

NSBatchInsertResult *_executeBatchInsertRequest(uint64_t a1)
{
  uint64_t v89 = *MEMORY[0x1895F89C0];
  os_signpost_id_t v2 = (void *)[(id)a1 persistentStoreRequest];
  uint64_t v3 = v2;
  v69 = v2;
  if (!a1)
  {
    int v55 = [v2 _secureOperation];
    uint64_t v8 = [v3 resultType];
    id v56 = (id)[0 mergePolicy];
    uint64_t v4 = 0LL;
    int v7 = 0;
    int v68 = 0;
    BOOL v10 = v56 == NSMergeByPropertyObjectTrumpMergePolicy;
    if (!v55) {
      goto LABEL_10;
    }
    goto LABEL_5;
  }

  uint64_t v4 = *(void **)(a1 + 24);
  char v5 = [v2 _secureOperation];
  uint64_t v6 = *(void *)(a1 + 8);
  if (v6) {
    int v7 = (*(unsigned __int8 *)(v6 + 201) >> 2) & 1;
  }
  else {
    int v7 = 0;
  }
  uint64_t v8 = [v3 resultType];
  id v9 = (id)[*(id *)(a1 + 32) mergePolicy];
  BOOL v10 = v9 == NSMergeByPropertyObjectTrumpMergePolicy;
  if ((v5 & 1) != 0)
  {
LABEL_5:
    -[NSSQLiteConnection setSecureDeleteMode:]((uint64_t)v4, 1);
    int v68 = 1;
    if (!a1) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }

  int v68 = 0;
LABEL_8:
  uint64_t v11 = *(void *)(a1 + 8);
  if (v11) {
    [*(id *)(v11 + 216) lock];
  }
LABEL_10:
  -[NSSQLiteConnection beginTransaction]((uint64_t)v4);
  if (v8 == 1) {
    int v12 = 1;
  }
  else {
    int v12 = v7;
  }
  uint64_t v67 = v8;
  if (v12 == 1
    && (!a1
      ? (uint64_t v13 = 0LL)
      : (uint64_t v13 = (void *)-[NSSQLBatchOperationRequestContext createObjectIDCaptureStatementsForDrop:](a1, 0)),
        __int128 v80 = 0u,
        __int128 v81 = 0u,
        __int128 v78 = 0u,
        __int128 v79 = 0u,
        (uint64_t v14 = [v13 countByEnumeratingWithState:&v78 objects:v88 count:16]) != 0))
  {
    uint64_t v15 = *(void *)v79;
    do
    {
      for (uint64_t i = 0LL; i != v14; ++i)
      {
        if (*(void *)v79 != v15) {
          objc_enumerationMutation(v13);
        }
        -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)v4, *(void **)(*((void *)&v78 + 1) + 8 * i));
        int v17 = 1;
      }

      uint64_t v14 = [v13 countByEnumeratingWithState:&v78 objects:v88 count:16];
    }

    while (v14);
  }

  else
  {
    int v17 = 0;
  }

  if (a1) {
    id v18 = *(void **)(a1 + 8);
  }
  else {
    id v18 = 0LL;
  }
  uint64_t v19 = (id *)_sqlCoreLookupSQLEntityForEntityDescription(v18, (void *)[v69 entity]);
  if ([v69 objectsToInsert])
  {
    uint64_t v20 = -[NSSQLiteConnection insertArray:forEntity:includeOnConflict:]( (uint64_t)v4,  (void *)[v69 objectsToInsert],  (uint64_t)v19,  v10);
    goto LABEL_33;
  }

  if ([v69 dictionaryHandler])
  {
    -[NSSQLiteConnection insertDictionaryBlock:forEntity:includeOnConflict:]( (sqlite3_int64)v4,  [v69 dictionaryHandler],  v19,  v10);
    goto LABEL_33;
  }

  if ([v69 managedObjectHandler])
  {
    -[NSSQLiteConnection insertManagedObjectBlock:forEntity:includeOnConflict:]( (sqlite3_int64)v4,  [v69 managedObjectHandler],  v19,  v10);
LABEL_33:
    uint64_t v21 = v20;
    if (v12) {
      goto LABEL_34;
    }
LABEL_51:
    uint64_t v25 = 0LL;
    uint64_t v30 = 0LL;
    goto LABEL_52;
  }

  uint64_t v21 = 0LL;
  if (!v12) {
    goto LABEL_51;
  }
LABEL_34:
  if (a1) {
    uint64_t v22 = *(void *)(a1 + 88);
  }
  else {
    uint64_t v22 = 0LL;
  }
  uint64_t v23 = (void *)-[NSSQLiteConnection gatherObjectIDsFromTable:]((uint64_t)v4, v22);
  uint64_t v24 = (uint64_t)v23;
  if (v7 && [v23 count])
  {
    -[NSSQLiteConnection processInsertRequest:]((uint64_t)v4, (void *)a1);
    if (!a1)
    {
      uint64_t v25 = 0LL;
      uint64_t v26 = 0LL;
      goto LABEL_42;
    }

    uint64_t v25 = *(void **)(a1 + 72);
    goto LABEL_41;
  }

  uint64_t v25 = 0LL;
  uint64_t v26 = 0LL;
  if (a1) {
LABEL_41:
  }
    uint64_t v26 = (void *)-[NSSQLBatchOperationRequestContext createObjectIDCaptureStatementsForDrop:](a1, 1);
LABEL_42:
  __int128 v76 = 0u;
  __int128 v77 = 0u;
  __int128 v74 = 0u;
  __int128 v75 = 0u;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v74 objects:v87 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v75;
    do
    {
      for (uint64_t j = 0LL; j != v27; ++j)
      {
        if (*(void *)v75 != v28) {
          objc_enumerationMutation(v26);
        }
        -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)v4, *(void **)(*((void *)&v74 + 1) + 8 * j));
      }

      uint64_t v27 = [v26 countByEnumeratingWithState:&v74 objects:v87 count:16];
    }

    while (v27);
  }

  int v17 = 0;
  uint64_t v30 = v24;
LABEL_52:
  -[NSSQLiteConnection commitTransaction]((uint64_t)v4);
  if (a1)
  {
    uint64_t v31 = *(void *)(a1 + 8);
    if (v31)
    {
      if (atomic_load((unint64_t *)(v31 + 208)))
      {
        if (v21)
        {
          uint64_t v33 = [v4 registerCurrentQueryGenerationWithStore:*(void *)(a1 + 8)];
          if ((_DWORD)v33)
          {
            uint64_t v34 = [NSString stringWithUTF8String:"Batch insert failed to generate a post transaction query generation with error %d"];
            _NSCoreDataLog(17LL, v34, v35, v36, v37, v38, v39, v40, v33);
            uint64_t v41 = (os_log_s *)__pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 67109120;
              LODWORD(v83) = v33;
              _os_log_fault_impl( &dword_186681000,  v41,  OS_LOG_TYPE_FAULT,  "CoreData: Batch insert failed to generate a post transaction query generation with error %d",  buf,  8u);
            }
          }
        }

        else if ((int)-[NSSQLStoreRequestContext debugLogLevel](a1) >= 1)
        {
          _NSCoreDataLog( 6LL,  (uint64_t)@"Batch insert did not affect any rows, not registering a query generation",  v42,  v43,  v44,  v45,  v46,  v47,  v66);
        }
      }
    }
  }

  if (v67 == 2) {
    uint64_t v30 = [MEMORY[0x189607968] numberWithUnsignedInteger:v21];
  }
  if (![v69 resultType]) {
    uint64_t v30 = [MEMORY[0x189607968] numberWithBool:1];
  }
  if (a1) {
    uint64_t v48 = *(void *)(a1 + 24);
  }
  else {
    uint64_t v48 = 0LL;
  }
  -[NSSQLiteConnection _performPostSaveTasks:andForceFullVacuum:](v48, v68, 0);
  if (a1 && (uint64_t v49 = *(void *)(a1 + 8)) != 0)
  {
    [*(id *)(v49 + 216) unlock];
    uint64_t v50 = *(void *)(a1 + 8);
  }

  else
  {
    uint64_t v50 = 0LL;
  }

  -[NSSQLCore _postChangeNotificationWithTransactionID:](v50, v25);
  -[NSSQLiteConnection endFetchAndRecycleStatement:]((uint64_t)v4, 0);
  if (v17)
  {
    uint64_t v51 = a1 ? (void *)-[NSSQLBatchOperationRequestContext createObjectIDCaptureStatementsForDrop:](a1, 1) : 0LL;
    __int128 v72 = 0u;
    __int128 v73 = 0u;
    __int128 v70 = 0u;
    __int128 v71 = 0u;
    uint64_t v52 = [v51 countByEnumeratingWithState:&v70 objects:v86 count:16];
    if (v52)
    {
      uint64_t v53 = *(void *)v71;
      do
      {
        for (uint64_t k = 0LL; k != v52; ++k)
        {
          if (*(void *)v71 != v53) {
            objc_enumerationMutation(v51);
          }
          -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)v4, *(void **)(*((void *)&v70 + 1) + 8 * k));
        }

        uint64_t v52 = [v51 countByEnumeratingWithState:&v70 objects:v86 count:16];
      }

      while (v52);
    }
  }

  if (v68) {
    -[NSSQLiteConnection setSecureDeleteMode:]((uint64_t)v4, 0);
  }
  if (v30) {
    return  -[NSBatchInsertResult initWithResultType:andObject:]( [NSBatchInsertResult alloc],  "initWithResultType:andObject:",  [v69 resultType],  v30);
  }
  uint64_t v58 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
  _NSCoreDataLog( 17LL,  v58,  v59,  v60,  v61,  v62,  v63,  v64,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLCore_Functions.m");
  v65 = (os_log_s *)__pflogFaultLog;
  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315394;
    v83 = "/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLCore_Functions.m";
    __int16 v84 = 1024;
    int v85 = 750;
    _os_log_fault_impl( &dword_186681000,  v65,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
  }

  return 0LL;
}

void sub_1868AF9CC(_Unwind_Exception *a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x1868AF984LL);
  }

  _Unwind_Resume(a1);
}

void sub_1868AF9E0(_Unwind_Exception *a1)
{
  if (v1) {
    objc_end_catch();
  }
  _Unwind_Resume(a1);
}

void sub_1868AFA10(uint64_t a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  JUMPOUT(0x1868AFA1CLL);
}

uint64_t _executeBatchDeleteStatements(void *a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  uint64_t v4 = [a1 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (!v4) {
    return 0LL;
  }
  uint64_t v5 = v4;
  uint64_t v6 = 0LL;
  uint64_t v7 = *(void *)v14;
  do
  {
    uint64_t v8 = 0LL;
    do
    {
      if (*(void *)v14 != v7) {
        objc_enumerationMutation(a1);
      }
      uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * v8);
      -[NSSQLiteConnection prepareAndExecuteSQLStatement:](a2, (void *)v9);
      if (v9 && *(_BYTE *)(v9 + 41))
      {
        if (a2) {
          int v10 = sqlite3_changes(*(sqlite3 **)(a2 + 72));
        }
        else {
          int v10 = 0;
        }
        uint64_t v6 = (v10 + v6);
      }

      ++v8;
    }

    while (v5 != v8);
    uint64_t v11 = [a1 countByEnumeratingWithState:&v13 objects:v17 count:16];
    uint64_t v5 = v11;
  }

  while (v11);
  return v6;
}

void _executeBatchDeleteRequest(uint64_t a1, void *a2)
{
  uint64_t v98 = *MEMORY[0x1895F89C0];
  uint64_t v4 = (void *)[(id)a1 request];
  uint64_t v5 = v4;
  if (a1) {
    __int16 v84 = *(void **)(a1 + 24);
  }
  else {
    __int16 v84 = 0LL;
  }
  __int128 v71 = a2;
  uint64_t v74 = [v4 resultType];
  int v6 = objc_msgSend((id)objc_msgSend((id)a1, "request"), "_secureOperation");
  __int128 v73 = v5;
  if (!a1)
  {
    BOOL v72 = 0;
    uint64_t v7 = 0LL;
    BOOL v80 = 0;
LABEL_11:
    unsigned int entityID = 0;
    goto LABEL_17;
  }

  uint64_t v7 = *(NSSQLFetchRequestContext **)(a1 + 120);
  if (!v7)
  {
    uint64_t v7 = -[NSSQLBatchDeleteRequestContext _createFetchRequestContextForObjectsToDelete]((NSSQLFetchRequestContext *)a1);
    *(void *)(a1 + 120) = v7;
  }

  uint64_t v8 = *(void **)(a1 + 128);
  uint64_t v9 = *(void *)(a1 + 8);
  if (!v9)
  {
    BOOL v72 = 0;
    if (v8) {
      goto LABEL_8;
    }
LABEL_13:
    BOOL v80 = 0;
    goto LABEL_14;
  }

  unint64_t v10 = atomic_load((unint64_t *)(v9 + 208));
  BOOL v72 = v10 != 0;
  if (!v8) {
    goto LABEL_13;
  }
LABEL_8:
  BOOL v80 = [v8 count] != 0;
LABEL_14:
  if (!v7) {
    goto LABEL_11;
  }
  sqlEntity = v7->_sqlEntity;
  if (!sqlEntity) {
    goto LABEL_11;
  }
  unsigned int entityID = sqlEntity->_entityID;
LABEL_17:
  int v76 = v6;
  if (v6) {
    -[NSSQLiteConnection setSecureDeleteMode:]((uint64_t)v84, 1);
  }
  if (a1)
  {
    uint64_t v12 = *(void *)(a1 + 8);
    if (v12) {
      [*(id *)(v12 + 216) lock];
    }
  }

  -[NSSQLiteConnection beginTransaction]((uint64_t)v84);
  if (v74 == 1)
  {
    if (a1) {
      __int128 v13 = *(void **)(a1 + 24);
    }
    else {
      __int128 v13 = 0LL;
    }
    -[NSSQLStoreRequestContext setConnection:]((uint64_t)v7, v13);
    Request = _executeFetchRequest((uint64_t)v7);
    -[NSSQLStoreRequestContext setConnection:]((uint64_t)v7, 0LL);
    if (!a1)
    {
      BOOL v81 = 0;
      BOOL v34 = 0;
      uint64_t v16 = 0LL;
      uint64_t v70 = 0LL;
      __int128 v77 = 0LL;
      uint64_t v35 = 0LL;
      BOOL v36 = 0;
      char v37 = 1;
      int v17 = 1;
      goto LABEL_95;
    }

    objc_setProperty_nonatomic((id)a1, v15, Request, 112LL);
    uint64_t v75 = *(void *)(a1 + 112);
  }

  else
  {
    uint64_t v16 = 0LL;
    if (!a1)
    {
      BOOL v81 = 0;
      BOOL v34 = 0;
      BOOL v36 = 0;
      char v37 = 1;
      uint64_t v70 = 0LL;
      __int128 v77 = 0LL;
      uint64_t v35 = 0LL;
      int v17 = 1;
      goto LABEL_95;
    }

    uint64_t v75 = 0LL;
  }

  if (*(void *)(a1 + 104))
  {
    __int128 v79 = *(void **)(a1 + 104);
    __int128 v77 = *(void **)(a1 + 128);
  }

  else
  {
    int v17 = 1;
    -[NSSQLBatchDeleteRequestContext _createDeleteStatements](a1);
    __int128 v77 = *(void **)(a1 + 128);
    if (!*(void *)(a1 + 104))
    {
      BOOL v81 = 0;
      BOOL v34 = 0;
      uint64_t v70 = 0LL;
      uint64_t v35 = 0LL;
      BOOL v36 = 0;
      uint64_t v16 = *(void *)(a1 + 40);
      char v37 = 1;
      goto LABEL_95;
    }

    __int128 v79 = *(void **)(a1 + 104);
  }

  if ([v79 count] == 3)
  {
    _executeBatchDeleteStatements((void *)[v79 objectAtIndexedSubscript:0], (uint64_t)v84);
    if (v72)
    {
      __int128 v87 = 0u;
      __int128 v88 = 0u;
      __int128 v85 = 0u;
      __int128 v86 = 0u;
      uint64_t v18 = (void *)[v79 objectAtIndexedSubscript:1];
      uint64_t v19 = [v18 countByEnumeratingWithState:&v85 objects:v97 count:16];
      if (v19)
      {
        uint64_t v20 = *(void *)v86;
        do
        {
          for (uint64_t i = 0LL; i != v19; ++i)
          {
            if (*(void *)v86 != v20) {
              objc_enumerationMutation(v18);
            }
            uint64_t v22 = *(void *)(*((void *)&v85 + 1) + 8 * i);
            if (v22) {
              *(_BYTE *)(v22 + 41) = 1;
            }
          }

          uint64_t v19 = [v18 countByEnumeratingWithState:&v85 objects:v97 count:16];
        }

        while (v19);
      }
    }

    if (v80)
    {
      _executeBatchDeleteStatements((void *)[v77 objectAtIndexedSubscript:0], (uint64_t)v84);
      int v78 = 1;
    }

    else
    {
      int v78 = 0;
    }

    uint64_t v27 = *(void *)(a1 + 8);
    if (v27 && (*(_BYTE *)(v27 + 201) & 4) != 0)
    {
      uint64_t v25 = objc_msgSend( (id)objc_msgSend( (id)objc_msgSend( (id)objc_msgSend((id)objc_msgSend(v84, "adapter"), "sqlCore"),  "ancillarySQLModels"),  "objectForKey:",  @"NSPersistentHistoryTrackingKey"),  "entityNamed:",  @"CHANGE");
      uint64_t v28 = (NSSQLiteStatement *)[v84 adapter];
      uint64_t v29 = -[NSSQLEntity tempTableName](v25);
      uint64_t v30 = -[NSSQLiteAdapter newDropTableStatementForTableNamed:](v28, v29);
      v96 = v30;
      _executeBatchDeleteStatements( (void *)[MEMORY[0x189603F18] arrayWithObjects:&v96 count:1],  (uint64_t)v84);

      uint64_t v31 = (const __CFString *)[v84 adapter];
      if (v25)
      {
        v94[0] = [*(id *)(v25 + 40) objectForKey:@"ENTITY"];
        uint64_t v32 = [*(id *)(v25 + 40) objectForKey:@"ENTITYPK"];
      }

      else
      {
        uint64_t v32 = 0LL;
        v94[0] = 0LL;
      }

      v94[1] = v32;
      uint64_t v95 = [MEMORY[0x189603F18] arrayWithObjects:v94 count:2];
      uint64_t v33 = -[NSSQLiteAdapter newCreateTempTableStatementForEntity:withAttributesToConstrain:]( v31,  v25,  (void *)[MEMORY[0x189603F18] arrayWithObjects:&v95 count:1]);
      v93 = v33;
      _executeBatchDeleteStatements( (void *)[MEMORY[0x189603F18] arrayWithObjects:&v93 count:1],  (uint64_t)v84);

      int v82 = 1;
    }

    else
    {
      int v82 = 0;
      uint64_t v25 = 0LL;
    }

    int v69 = _executeBatchDeleteStatements((void *)[v79 objectAtIndexedSubscript:1], (uint64_t)v84);
    switch(v74)
    {
      case 2LL:
        uint64_t v75 = [MEMORY[0x189607968] numberWithInteger:v69];
        break;
      case 1LL:
        uint64_t v75 = *(void *)(a1 + 112);
        break;
      case 0LL:
        uint64_t v75 = [MEMORY[0x189607968] numberWithBool:1];
        break;
    }

    int v24 = v78;
    if (v80)
    {
      _executeBatchDeleteStatements((void *)[v77 objectAtIndexedSubscript:1], (uint64_t)v84);
      int v24 = 0;
    }

    _executeBatchDeleteStatements((void *)[v79 objectAtIndexedSubscript:2], (uint64_t)v84);
    int v26 = v82;
    goto LABEL_72;
  }

  uint64_t v23 = [v73 resultType];
  if (!v23)
  {
    uint64_t v25 = 0LL;
    uint64_t v75 = [MEMORY[0x189607968] numberWithBool:0];
    goto LABEL_64;
  }

  if (v23 == 2)
  {
    uint64_t v25 = 0LL;
    uint64_t v75 = [MEMORY[0x189607968] numberWithInteger:0];
LABEL_64:
    int v78 = 0;
    int v24 = 0;
LABEL_66:
    int v69 = 0;
    int v26 = 0;
    goto LABEL_72;
  }

  if (v23 != 1)
  {
    int v78 = 0;
    int v24 = 0;
    uint64_t v25 = 0LL;
    goto LABEL_66;
  }

  int v78 = 0;
  int v24 = 0;
  uint64_t v25 = 0LL;
  int v69 = 0;
  int v26 = 0;
  uint64_t v75 = MEMORY[0x189604A58];
LABEL_72:
  BOOL v34 = v24 != 0;
   -[NSBatchDeleteResult initWithResultType:andObject:]( [NSBatchDeleteResult alloc],  "initWithResultType:andObject:",  [v73 resultType],  v75);
  -[NSSQLiteConnection endFetchAndRecycleStatement:]((uint64_t)v84, 0);
  if (v80)
  {
    -[NSSQLiteConnection processExternalDataReferenceFilesDeletedByRequest:]((uint64_t)v84, (uint64_t *)a1);
    uint64_t v38 = *(void **)(a1 + 136);
    if (v38) {
      _deleteExternalDataReferences(v38);
    }
    uint64_t v39 = *(void **)(a1 + 144);
    if (v39) {
      _deleteFileBackedFutures(v39);
    }
    _executeBatchDeleteStatements((void *)[v77 objectAtIndexedSubscript:3], (uint64_t)v84);
    int v78 = 0;
  }

  uint64_t v40 = *(void *)(a1 + 8);
  if (v40 && (*(_BYTE *)(v40 + 201) & 4) != 0)
  {
    -[NSSQLiteConnection processDeleteRequest:]((sqlite3_int64)v84, a1);
    uint64_t v41 = *(void **)(a1 + 72);
    if (v25)
    {
      uint64_t v42 = (NSSQLiteStatement *)[v84 adapter];
      uint64_t v43 = -[NSSQLEntity tempTableName](v25);
      uint64_t v44 = -[NSSQLiteAdapter newDropTableStatementForTableNamed:](v42, v43);
      v92 = v44;
      _executeBatchDeleteStatements( (void *)[MEMORY[0x189603F18] arrayWithObjects:&v92 count:1],  (uint64_t)v84);

      int v26 = 0;
    }
  }

  else
  {
    uint64_t v41 = 0LL;
  }

  BOOL v83 = v26 != 0;
  -[NSSQLiteConnection commitTransaction]((uint64_t)v84);
  if (v72)
  {
    if (v69 < 1)
    {
      if ((int)-[NSSQLStoreRequestContext debugLogLevel](a1) >= 1) {
        _NSCoreDataLog( 6LL,  (uint64_t)@"Batch delete did not affect any rows, not registering a query generation",  v54,  v55,  v56,  v57,  v58,  v59,  v67);
      }
    }

    else
    {
      uint64_t v45 = [v84 registerCurrentQueryGenerationWithStore:*(void *)(a1 + 8)];
      if ((_DWORD)v45)
      {
        uint64_t v46 = [NSString stringWithUTF8String:"Batch delete failed to generate a post transaction query generation with error %d"];
        _NSCoreDataLog(17LL, v46, v47, v48, v49, v50, v51, v52, v45);
        uint64_t v53 = (os_log_s *)__pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v91) = v45;
          _os_log_fault_impl( &dword_186681000,  v53,  OS_LOG_TYPE_FAULT,  "CoreData: Batch delete failed to generate a post transaction query generation with error %d",  buf,  8u);
        }
      }
    }
  }

  -[NSSQLiteConnection _performPostSaveTasks:andForceFullVacuum:](*(void *)(a1 + 24), v76, 0);
  uint64_t v60 = *(void *)(a1 + 8);
  if (v60) {
    [*(id *)(v60 + 216) unlock];
  }
  if (entityID <= 0x3A98) {
    -[NSSQLCore _postChangeNotificationWithTransactionID:](*(void *)(a1 + 8), v41);
  }
  char v37 = 0;
  uint64_t v16 = 0LL;
  int v17 = 0;
  BOOL v81 = v78 != 0;
  uint64_t v70 = v25;
  uint64_t v35 = v79;
  BOOL v36 = v83;
LABEL_95:
  -[NSSQLiteConnection endFetchAndRecycleStatement:]((uint64_t)v84, 0);
  if (v35 && [v35 count] == 3)
  {
    uint64_t v61 = v16;
    if (v34)
    {
      _executeBatchDeleteStatements((void *)[v77 objectAtIndexedSubscript:1], (uint64_t)v84);
      -[NSSQLiteConnection endFetchAndRecycleStatement:]((uint64_t)v84, 0);
    }

    if (v81)
    {
      _executeBatchDeleteStatements((void *)[v77 objectAtIndexedSubscript:3], (uint64_t)v84);
      -[NSSQLiteConnection endFetchAndRecycleStatement:]((uint64_t)v84, 0);
    }
  }

  else
  {
    uint64_t v61 = v16;
  }

  if (v36)
  {
    uint64_t v62 = (NSSQLiteStatement *)[v84 adapter];
    uint64_t v63 = -[NSSQLEntity tempTableName](v70);
    uint64_t v64 = -[NSSQLiteAdapter newDropTableStatementForTableNamed:](v62, v63);
    uint64_t v89 = v64;
    _executeBatchDeleteStatements( (void *)[MEMORY[0x189603F18] arrayWithObjects:&v89 count:1],  (uint64_t)v84);

    -[NSSQLiteConnection endFetchAndRecycleStatement:]((uint64_t)v84, 0);
  }

  if (v17) {
    -[NSSQLiteConnection rollbackTransaction]((uint64_t)v84);
  }
  char v65 = v37 ^ 1;
  if (!a1) {
    char v65 = 1;
  }
  if ((v65 & 1) == 0)
  {
    uint64_t v66 = *(void *)(a1 + 8);
    if (v66) {
      [*(id *)(v66 + 216) unlock];
    }
  }

  if (v76) {
    -[NSSQLiteConnection setSecureDeleteMode:]((uint64_t)v84, 0);
  }
  if (v71)
  {
    if (v61) {
      *__int128 v71 = v61;
    }
  }

void sub_1868B0F3C(uint64_t a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x1868B0E98LL);
  }

  JUMPOUT(0x1868B0D84LL);
}

uint64_t _deleteExternalDataReferences(void *a1)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  __int128 v6 = 0u;
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  uint64_t result = [a1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0LL;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(a1);
        }
        [*(id *)(*((void *)&v6 + 1) + 8 * v5++) _deleteExternalReferenceFromPermanentLocation];
      }

      while (v3 != v5);
      uint64_t result = [a1 countByEnumeratingWithState:&v6 objects:v10 count:16];
      uint64_t v3 = result;
    }

    while (result);
  }

  return result;
}

uint64_t _deleteFileBackedFutures(void *a1)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  uint64_t result = [a1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void *)v10;
    do
    {
      uint64_t v5 = 0LL;
      do
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(a1);
        }
        uint64_t v6 = *(void *)(*((void *)&v9 + 1) + 8 * v5);
        if (v6) {
          __int128 v7 = *(void **)(v6 + 8);
        }
        else {
          __int128 v7 = 0LL;
        }
        uint64_t v8 = [v7 path];
        objc_msgSend((id)objc_msgSend(MEMORY[0x1896078A8], "defaultManager"), "removeItemAtPath:error:", v8, 0);
        ++v5;
      }

      while (v3 != v5);
      uint64_t result = [a1 countByEnumeratingWithState:&v9 objects:v13 count:16];
      uint64_t v3 = result;
    }

    while (result);
  }

  return result;
}

void _executeBatchUpdateRequest(void *a1, uint64_t *a2)
{
  uint64_t v85 = *MEMORY[0x1895F89C0];
  uint64_t v67 = (void *)[a1 request];
  if (a1) {
    uint64_t v4 = (sqlite3 **)a1[3];
  }
  else {
    uint64_t v4 = 0LL;
  }
  int v66 = objc_msgSend((id)objc_msgSend(a1, "request"), "_secureOperation");
  uint64_t v64 = a2;
  if (a1 && (uint64_t v5 = a1[1]) != 0) {
    int v6 = (*(unsigned __int8 *)(v5 + 201) >> 2) & 1;
  }
  else {
    int v6 = 0;
  }
  uint64_t v7 = [v67 resultType];
  uint64_t v8 = objc_msgSend((id)objc_msgSend(v67, "propertiesToUpdate"), "count");
  if (v8) {
    uint64_t v14 = &unk_189F04120;
  }
  else {
    uint64_t v14 = &unk_189F040F8;
  }
  if (!a1 || !v8) {
    goto LABEL_17;
  }
  uint64_t v15 = a1[12];
  if (!v15)
  {
    uint64_t v14 = &unk_189F04120;
LABEL_17:
    uint64_t v18 = [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:134030 userInfo:v14];
    uint64_t v62 = 0LL;
    int v63 = 1;
    BOOL v19 = 0;
    goto LABEL_74;
  }

  if (*(_BYTE *)(v15 + 40))
  {
    _NSCoreDataLog( 6LL,  (uint64_t)@"Short-circuiting batch update: impossible condition in where clause (2)",  v9,  v10,  (uint64_t)v14,  v11,  v12,  v13,  v61);
    uint64_t v16 = [v67 resultType];
    if (v16 == 1)
    {
      uint64_t v27 = [MEMORY[0x189603F18] array];
    }

    else
    {
      if (v16 == 2)
      {
        int v17 = &unk_189F04668;
LABEL_37:
         -[NSBatchUpdateResult initWithResultType:andObject:]( [NSBatchUpdateResult alloc],  "initWithResultType:andObject:",  [v67 resultType],  v17);
        uint64_t v18 = 0LL;
        BOOL v19 = 0;
        uint64_t v62 = 0LL;
        int v63 = 1;
        goto LABEL_74;
      }

      uint64_t v27 = [MEMORY[0x189607968] numberWithBool:0];
    }

    int v17 = (void *)v27;
    goto LABEL_37;
  }

  if (v66) {
    -[NSSQLiteConnection setSecureDeleteMode:]((uint64_t)v4, 1);
  }
  uint64_t v20 = a1[1];
  if (v20) {
    [*(id *)(v20 + 216) lock];
  }
  -[NSSQLiteConnection beginTransaction]((uint64_t)v4);
  if (v7 == 1) {
    int v21 = 1;
  }
  else {
    int v21 = v6;
  }
  uint64_t v65 = v7;
  if (v21 == 1)
  {
    uint64_t v22 = (void *)-[NSSQLBatchOperationRequestContext createObjectIDCaptureStatementsForDrop:]((uint64_t)a1, 0);
    __int128 v78 = 0u;
    __int128 v79 = 0u;
    __int128 v76 = 0u;
    __int128 v77 = 0u;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v76 objects:v84 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v77;
      do
      {
        for (uint64_t i = 0LL; i != v23; ++i)
        {
          if (*(void *)v77 != v24) {
            objc_enumerationMutation(v22);
          }
          -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)v4, *(void **)(*((void *)&v76 + 1) + 8 * i));
          int v26 = 1;
        }

        uint64_t v23 = [v22 countByEnumeratingWithState:&v76 objects:v84 count:16];
      }

      while (v23);
    }

    else
    {
      int v26 = 0;
    }

    int v21 = 1;
  }

  else
  {
    int v26 = 0;
  }

  -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)v4, (void *)v15);
  if (v4)
  {
    int v28 = sqlite3_changes(v4[9]);
    if (v21) {
      goto LABEL_43;
    }
  }

  else
  {
    int v28 = 0;
    if (v21)
    {
LABEL_43:
      uint64_t v29 = (void *)-[NSSQLiteConnection gatherObjectIDsFromTable:]((uint64_t)v4, a1[11]);
      uint64_t v30 = (uint64_t)v29;
      if (v6 && [v29 count])
      {
        uint64_t v31 = (void *)objc_msgSend( (id)-[NSSQLiteConnection gatherHistoryChangesFromTable:]((uint64_t)v4, a1[11]),  "valueForKey:",  @"updates");
        -[NSSQLiteConnection processUpdateRequest:withOIDs:forAttributes:]( (sqlite3_int64)v4,  a1,  v31,  (void *)objc_msgSend((id)objc_msgSend(v67, "propertiesToUpdate"), "allKeys"));
        uint64_t v32 = (void *)a1[9];
      }

      else
      {
        uint64_t v32 = 0LL;
      }

      uint64_t v33 = (void *)-[NSSQLBatchOperationRequestContext createObjectIDCaptureStatementsForDrop:]((uint64_t)a1, 1);
      __int128 v74 = 0u;
      __int128 v75 = 0u;
      __int128 v72 = 0u;
      __int128 v73 = 0u;
      uint64_t v34 = [v33 countByEnumeratingWithState:&v72 objects:v83 count:16];
      if (v34)
      {
        uint64_t v35 = *(void *)v73;
        do
        {
          for (uint64_t j = 0LL; j != v34; ++j)
          {
            if (*(void *)v73 != v35) {
              objc_enumerationMutation(v33);
            }
            -[NSSQLiteConnection prepareAndExecuteSQLStatement:]( (uint64_t)v4,  *(void **)(*((void *)&v72 + 1) + 8 * j));
          }

          uint64_t v34 = [v33 countByEnumeratingWithState:&v72 objects:v83 count:16];
        }

        while (v34);
      }

      int v26 = 0;
      uint64_t v62 = v30;
      goto LABEL_59;
    }
  }

  uint64_t v32 = 0LL;
  uint64_t v62 = 0LL;
LABEL_59:
  -[NSSQLiteConnection commitTransaction]((uint64_t)v4);
  uint64_t v37 = v28;
  uint64_t v38 = a1[1];
  if (v38)
  {
    if (atomic_load((unint64_t *)(v38 + 208)))
    {
      if (v28)
      {
        uint64_t v40 = [v4 registerCurrentQueryGenerationWithStore:a1[1]];
        if ((_DWORD)v40)
        {
          uint64_t v41 = [NSString stringWithUTF8String:"Batch update failed to generate a post transaction query generation with error %d"];
          _NSCoreDataLog(17LL, v41, v42, v43, v44, v45, v46, v47, v40);
          uint64_t v48 = (os_log_s *)__pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 67109120;
            int v82 = v40;
            _os_log_fault_impl( &dword_186681000,  v48,  OS_LOG_TYPE_FAULT,  "CoreData: Batch update failed to generate a post transaction query generation with error %d",  buf,  8u);
          }
        }
      }

      else if ((int)-[NSSQLStoreRequestContext debugLogLevel]((uint64_t)a1) >= 1)
      {
        _NSCoreDataLog( 6LL,  (uint64_t)@"Batch update did not affect any rows, not registering a query generation",  v49,  v50,  v51,  v52,  v53,  v54,  v61);
      }
    }
  }

  if (v65 == 2) {
    uint64_t v62 = [MEMORY[0x189607968] numberWithUnsignedInteger:v37];
  }
  if (![v67 resultType]) {
    uint64_t v62 = [MEMORY[0x189607968] numberWithBool:1];
  }
  -[NSSQLiteConnection _performPostSaveTasks:andForceFullVacuum:](a1[3], v66, 0);
  uint64_t v55 = a1[1];
  if (v55)
  {
    [*(id *)(v55 + 216) unlock];
    uint64_t v56 = a1[1];
  }

  else
  {
    uint64_t v56 = 0LL;
  }

  -[NSSQLCore _postChangeNotificationWithTransactionID:](v56, v32);
  int v63 = 0;
  uint64_t v18 = 0LL;
  BOOL v19 = v26 != 0;
LABEL_74:
  -[NSSQLiteConnection endFetchAndRecycleStatement:]((uint64_t)v4, 0);
  if (v19)
  {
    uint64_t v57 = a1
    __int128 v70 = 0u;
    __int128 v71 = 0u;
    __int128 v68 = 0u;
    __int128 v69 = 0u;
    uint64_t v58 = [v57 countByEnumeratingWithState:&v68 objects:v80 count:16];
    if (v58)
    {
      uint64_t v59 = *(void *)v69;
      do
      {
        for (uint64_t k = 0LL; k != v58; ++k)
        {
          if (*(void *)v69 != v59) {
            objc_enumerationMutation(v57);
          }
          -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)v4, *(void **)(*((void *)&v68 + 1) + 8 * k));
        }

        uint64_t v58 = [v57 countByEnumeratingWithState:&v68 objects:v80 count:16];
      }

      while (v58);
    }
  }

  if (v66) {
    -[NSSQLiteConnection setSecureDeleteMode:]((uint64_t)v4, 0);
  }
  if (v64 && v18) {
    *uint64_t v64 = v18;
  }
  if ((v63 | 4) == 4)
  {
    if (v62) {
       -[NSBatchUpdateResult initWithResultType:andObject:]( [NSBatchUpdateResult alloc],  "initWithResultType:andObject:",  [v67 resultType],  v62);
    }
  }

void sub_1868B1B40(uint64_t a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x1868B1B10LL);
  }

  JUMPOUT(0x1868B1A58LL);
}

void sub_1868B1B90()
{
}

void _executeChangeRequest(void *a1, uint64_t *a2)
{
  v150[3] = *MEMORY[0x1895F89C0];
  uint64_t v3 = (void *)[a1 request];
  uint64_t v4 = v3;
  uint64_t v131 = 0LL;
  if (a1) {
    v118 = (id *)a1[3];
  }
  else {
    v118 = 0LL;
  }
  if ([v3 transactionNumber]
    && objc_msgSend((id)objc_msgSend(v4, "transactionNumber"), "integerValue") >= 1)
  {
    if (a1) {
      uint64_t v5 = (void *)a1[4];
    }
    else {
      uint64_t v5 = 0LL;
    }
    int v6 = objc_msgSend((id)objc_msgSend(v5, "_queryGenerationToken"), "_isEnabled");
    if (v6)
    {
      -[NSSQLiteConnection beginReadTransaction]((uint64_t)v118);
      if (a1) {
        uint64_t v7 = (void *)a1[4];
      }
      else {
        uint64_t v7 = 0LL;
      }
      uint64_t v8 = [v7 _queryGenerationToken];
      if (a1) {
        uint64_t v9 = (void *)a1[1];
      }
      else {
        uint64_t v9 = 0LL;
      }
      uint64_t v10 = -[_NSQueryGenerationToken _generationalComponentForStore:](v8, v9);
      if (v10) {
        uint64_t v11 = *((void *)v10 + 3);
      }
      else {
        uint64_t v11 = 0LL;
      }
      uint64_t v12 = -[NSSQLiteConnection adoptQueryGenerationWithIdentifier:]((uint64_t)v118, v11);
      if ((_DWORD)v12)
      {
        uint64_t v13 = [NSString stringWithUTF8String:"Persistent history request failed to adopt a query generation with error %d"];
        _NSCoreDataLog(17LL, v13, v14, v15, v16, v17, v18, v19, v12);
        uint64_t v20 = (os_log_s *)__pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)v132 = 67109120;
          *(_DWORD *)&v132[4] = v12;
          _os_log_fault_impl( &dword_186681000,  v20,  OS_LOG_TYPE_FAULT,  "CoreData: Persistent history request failed to adopt a query generation with error %d",  v132,  8u);
        }
      }

      int v21 = 1;
    }

    else
    {
      int v21 = 0;
    }

    -[NSSQLiteConnection hasHistoryTransactionWithNumber:](v118, [v4 transactionNumber]);
    char v24 = v23;
    if ((v23 & 1) == 0)
    {
      if (a1) {
        uint64_t v25 = (void *)a1[1];
      }
      else {
        uint64_t v25 = 0LL;
      }
      uint64_t v26 = [NSString stringWithFormat:@"Persistent History Token is expired for store at %@", objc_msgSend(v25, "URL")];
      uint64_t v27 = (void *)MEMORY[0x189607870];
      v150[0] = v26;
      v149[0] = @"message";
      v149[1] = @"NSStoreUUID";
      if (a1) {
        int v28 = (void *)a1[1];
      }
      else {
        int v28 = 0LL;
      }
      v150[1] = [v28 identifier];
      v149[2] = *MEMORY[0x1896074F8];
      if (a1) {
        uint64_t v29 = (void *)a1[1];
      }
      else {
        uint64_t v29 = 0LL;
      }
      v150[2] = objc_msgSend((id)objc_msgSend(v29, "URL"), "path");
      uint64_t v30 = [MEMORY[0x189603F68] dictionaryWithObjects:v150 forKeys:v149 count:3];
      uint64_t v131 = [v27 errorWithDomain:*MEMORY[0x189607460] code:134301 userInfo:v30];
    }

    if (v6)
    {
      -[NSSQLiteConnection commitTransaction]((uint64_t)v118);
      int v21 = 0;
    }

    BOOL v31 = v21 != 0;
    if ((v24 & 1) == 0) {
      goto LABEL_167;
    }
LABEL_51:
    int v116 = v21;
    BOOL v31 = v21 != 0;
    if ([a1 isWritingRequest])
    {
      if ([v4 isPercentageDelete]
        && (unint64_t v51 = -[NSSQLiteConnection percentageUsedByPersistentHistory]((uint64_t)v118),
            v51 <= [v4 percentageOfDB]))
      {
        -[NSSQLiteConnection endFetchAndRecycleStatement:]((uint64_t)v118, 0);
        uint64_t v144 = [MEMORY[0x189607968] numberWithBool:0];
        [MEMORY[0x189603F18] arrayWithObjects:&v144 count:1];
        uint64_t v52 = 0LL;
        char v85 = 0;
      }

      else
      {
        uint64_t v52 = [a1 createDeleteTransactionsRequestContext];
        -[NSSQLStoreRequestContext setConnection:](v52, v118);
        _executeBatchDeleteRequest(v52, &v131);
        uint64_t v54 = v53;
        if (!v131)
        {
          uint64_t v143 = [MEMORY[0x189607968] numberWithBool:1];
          [MEMORY[0x189603F18] arrayWithObjects:&v143 count:1];
        }

        if ((int)objc_msgSend((id)objc_msgSend(v54, "result"), "intValue") >= 1)
        {
          if (v52) {
            uint64_t v84 = *(void *)(v52 + 24);
          }
          else {
            uint64_t v84 = 0LL;
          }
          -[NSSQLiteConnection _performPostSaveTasks:andForceFullVacuum:]( v84,  objc_msgSend((id)objc_msgSend(a1, "request"), "_secureOperation"),  0);
        }

        char v85 = 1;
      }

      -[NSSQLStoreRequestContext setConnection:](v52, 0LL);
      if ((v85 & 1) == 0) {
        goto LABEL_167;
      }
      goto LABEL_166;
    }

    if ([v4 resultType] != 2 && objc_msgSend(v4, "resultType") != 6 && objc_msgSend(v4, "resultType"))
    {
      if (a1) {
        uint64_t v55 = (void *)a1[4];
      }
      else {
        uint64_t v55 = 0LL;
      }
      -[NSSQLiteConnection beginReadTransaction]((uint64_t)v118);
      if (a1) {
        uint64_t v56 = (void *)a1[4];
      }
      else {
        uint64_t v56 = 0LL;
      }
      uint64_t v57 = [v56 _queryGenerationToken];
      if (a1) {
        uint64_t v58 = (void *)a1[1];
      }
      else {
        uint64_t v58 = 0LL;
      }
      uint64_t v59 = -[_NSQueryGenerationToken _generationalComponentForStore:](v57, v58);
      if (v59) {
        uint64_t v60 = *((void *)v59 + 3);
      }
      else {
        uint64_t v60 = 0LL;
      }
      uint64_t v61 = -[NSSQLiteConnection adoptQueryGenerationWithIdentifier:]((uint64_t)v118, v60);
      if (!(_DWORD)v61)
      {
        int v116 = 1;
LABEL_70:
        uint64_t v62 = [a1 fetchRequestContextForChanges];
        int v63 = (void *)v62;
        if (a1) {
          uint64_t v64 = (void *)a1[3];
        }
        else {
          uint64_t v64 = 0LL;
        }
        -[NSSQLStoreRequestContext setConnection:](v62, v64);
        Request = _executeFetchRequest((uint64_t)v63);
        if (v116)
        {
          -[NSSQLiteConnection endFetchAndRecycleStatement:]((uint64_t)v118, 0);
          -[NSSQLiteConnection commitTransaction]((uint64_t)v118);
        }

        int v116 = 0;
        -[NSSQLiteConnection endFetchAndRecycleStatement:]((uint64_t)v118, 0);
        -[NSSQLStoreRequestContext setConnection:]((uint64_t)v63, 0LL);
        if ([v4 resultType] != 5
          || (objc_msgSend( (id)objc_msgSend((id)objc_msgSend(v63, "request"), "entityName"),  "isEqualToString:",  @"CHANGE") & 1) != 0 || (objc_msgSend(a1, "shouldUseBatches") & 1) != 0 || !-[_PFArray count](Request, "count"))
        {
          if (([v4 resultType] == 1 || objc_msgSend(v4, "resultType") == 4)
            && objc_msgSend( (id)objc_msgSend((id)objc_msgSend(v63, "request"), "entityName"),  "isEqualToString:",  @"TRANSACTION"))
          {
            v94 = (void *)objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", -[_PFArray count](Request, "count"));
            __int128 v125 = 0u;
            __int128 v126 = 0u;
            __int128 v123 = 0u;
            __int128 v124 = 0u;
            uint64_t v95 = -[_PFArray countByEnumeratingWithState:objects:count:]( Request,  "countByEnumeratingWithState:objects:count:",  &v123,  v135,  16LL);
            if (v95)
            {
              uint64_t v96 = *(void *)v124;
              do
              {
                for (uint64_t i = 0LL; i != v95; ++i)
                {
                  if (*(void *)v124 != v96) {
                    objc_enumerationMutation(Request);
                  }
                  uint64_t v98 = *(void **)(*((void *)&v123 + 1) + 8 * i);
                  v99 = (void *)MEMORY[0x186E3E5D8]();
                  objc_msgSend(v94, "addObject:", objc_msgSend(v98, "objectForKey:", @"self"));
                  objc_autoreleasePoolPop(v99);
                }

                uint64_t v95 = -[_PFArray countByEnumeratingWithState:objects:count:]( Request,  "countByEnumeratingWithState:objects:count:",  &v123,  v135,  16LL);
              }

              while (v95);
            }

            if ([v94 count])
            {
              v100 = (void *)[a1 createRequestContextForChangesWithTransactionIDs:v94];
              objc_msgSend((id)objc_msgSend(v100, "request"), "setResultType:", objc_msgSend(v4, "resultType"));
              if (a1) {
                v101 = (void *)a1[3];
              }
              else {
                v101 = 0LL;
              }
              -[NSSQLStoreRequestContext setConnection:]((uint64_t)v100, v101);
              _executeChangeRequest(v100, &v131);
            }

            else
            {
              v100 = 0LL;
            }

            -[NSSQLStoreRequestContext setConnection:]((uint64_t)v100, 0LL);
          }

          else if (([v4 resultType] == 3 || objc_msgSend(v4, "resultType") == 5) {
                 && objc_msgSend( (id)objc_msgSend((id)objc_msgSend(v63, "request"), "entityName"),  "isEqualToString:",  @"CHANGE"))
          }
          {
            v102 = (void *)objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", -[_PFArray count](Request, "count"));
            __int128 v121 = 0u;
            __int128 v122 = 0u;
            __int128 v119 = 0u;
            __int128 v120 = 0u;
            uint64_t v103 = -[_PFArray countByEnumeratingWithState:objects:count:]( Request,  "countByEnumeratingWithState:objects:count:",  &v119,  v134,  16LL);
            if (v103)
            {
              uint64_t v104 = *(void *)v120;
              do
              {
                for (uint64_t j = 0LL; j != v103; ++j)
                {
                  if (*(void *)v120 != v104) {
                    objc_enumerationMutation(Request);
                  }
                  v106 = *(void **)(*((void *)&v119 + 1) + 8 * j);
                  v107 = (void *)MEMORY[0x186E3E5D8]();
                  objc_msgSend(v102, "addObject:", objc_msgSend(v106, "objectForKey:", @"TRANSACTIONID"));
                  objc_autoreleasePoolPop(v107);
                }

                uint64_t v103 = -[_PFArray countByEnumeratingWithState:objects:count:]( Request,  "countByEnumeratingWithState:objects:count:",  &v119,  v134,  16LL);
              }

              while (v103);
            }

            if ([v102 count])
            {
              v108 = (void *)[a1 createRequestContextForChangesWithTransactionIDs:v102];
              objc_msgSend((id)objc_msgSend(v108, "request"), "setResultType:", 3);
              if (a1) {
                v109 = (void *)a1[3];
              }
              else {
                v109 = 0LL;
              }
              -[NSSQLStoreRequestContext setConnection:]((uint64_t)v108, v109);
              uint64_t v110 = _executeChangeRequest(v108, &v131);
              if (!v131)
              {
                uint64_t v111 = v110;
                if (v110)
                {
                  if ([v4 resultType] == 5)
                  {
                    v133[0] = v111;
                    v133[1] = Request;
                    [MEMORY[0x189603F18] arrayWithObjects:v133 count:2];
                  }
                }
              }
            }

            else
            {
              v108 = 0LL;
            }

            -[NSSQLStoreRequestContext setConnection:]((uint64_t)v108, 0LL);
          }
        }

        else
        {
          int v66 = (void *)objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", -[_PFArray count](Request, "count"));
          __int128 v129 = 0u;
          __int128 v130 = 0u;
          __int128 v127 = 0u;
          __int128 v128 = 0u;
          uint64_t v67 = -[_PFArray countByEnumeratingWithState:objects:count:]( Request,  "countByEnumeratingWithState:objects:count:",  &v127,  v138,  16LL);
          if (v67)
          {
            uint64_t v68 = *(void *)v128;
            do
            {
              for (uint64_t k = 0LL; k != v67; ++k)
              {
                if (*(void *)v128 != v68) {
                  objc_enumerationMutation(Request);
                }
                __int128 v70 = *(void **)(*((void *)&v127 + 1) + 8 * k);
                __int128 v71 = (void *)MEMORY[0x186E3E5D8]();
                objc_msgSend(v66, "addObject:", objc_msgSend(v70, "objectForKey:", @"self"));
                objc_autoreleasePoolPop(v71);
              }

              uint64_t v67 = -[_PFArray countByEnumeratingWithState:objects:count:]( Request,  "countByEnumeratingWithState:objects:count:",  &v127,  v138,  16LL);
            }

            while (v67);
          }

          if ([v66 count])
          {
            uint64_t v72 = [a1 createRequestContextForChangesWithTransactionIDs:v66];
            uint64_t v73 = v72;
            if (a1) {
              __int128 v74 = (void *)a1[3];
            }
            else {
              __int128 v74 = 0LL;
            }
            -[NSSQLStoreRequestContext setConnection:](v72, v74);
            uint64_t v75 = _executeChangeRequest(v73, &v131);
            if (!v131 && v75)
            {
              v137[0] = Request;
              v137[1] = v75;
              [MEMORY[0x189603F18] arrayWithObjects:v137 count:2];
            }
          }

          else
          {
            uint64_t v73 = 0LL;
            if (Request)
            {
              v136[0] = Request;
              v136[1] = MEMORY[0x189604A58];
              [MEMORY[0x189603F18] arrayWithObjects:v136 count:2];
            }
          }

          -[NSSQLStoreRequestContext setConnection:](v73, 0LL);
        }

void sub_1868B30A8(uint64_t a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x1868B2FE8LL);
  }

  JUMPOUT(0x1868B2F30LL);
}

void *_executeCountRequest(uint64_t a1)
{
  if (a1) {
    os_signpost_id_t v2 = *(void **)(a1 + 24);
  }
  else {
    os_signpost_id_t v2 = 0LL;
  }
  uint64_t v3 = (void *)[(id)a1 request];
  id v4 = objc_alloc_init(MEMORY[0x1896077E8]);
  else {
    double Current = CFAbsoluteTimeGetCurrent();
  }
  int v6 = -[NSSQLColumn initWithColumnName:sqlType:]( objc_alloc(&OBJC_CLASS___NSSQLColumn),  "initWithColumnName:sqlType:",  @"COUNT(*)",  1LL);
  id v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x189603F18]), "initWithObjects:", v6, 0);

  -[NSSQLiteConnection setColumnsToFetch:](v2, v7);
  uint64_t v8 = (_BYTE *)[(id)a1 fetchStatement];
  int v9 = -[NSSQLiteConnection selectCountWithStatement:]((uint64_t)v2, v8);
  -[NSSQLiteConnection setColumnsToFetch:](v2, v7);
  if (v9)
  {
    uint64_t v10 = -[NSSQLiteConnection newFetchedArray]((uint64_t)v2);
    unint64_t v11 = [v3 fetchLimit];
    unsigned int v12 = objc_msgSend((id)objc_msgSend(v10, "objectAtIndex:", 0), "unsignedIntValue");
    if (v11 && v11 < v12)
    {

      uint64_t v13 = (void *)[objc_alloc(MEMORY[0x189607968]) initWithUnsignedLong:v11];
      uint64_t v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603F18]), "initWithObjects:", v13, 0);
    }
  }

  else
  {
    uint64_t v14 = (void *)[objc_alloc(MEMORY[0x189607968]) initWithInt:0];
    uint64_t v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603F18]), "initWithObjects:", v14, 0);
  }

  if ((int)-[NSSQLStoreRequestContext debugLogLevel](a1) >= 1)
  {
    objc_msgSend((id)objc_msgSend(v10, "objectAtIndex:", 0), "unsignedIntValue");
    if ((int)-[NSSQLStoreRequestContext debugLogLevel](a1) >= 2)
    {
      if ((v9 & 1) == 0) {
        _NSCoreDataLog( 4LL,  (uint64_t)@"logically false count request %@ short circuits.",  v21,  v22,  v23,  v24,  v25,  v26,  (uint64_t)v3);
      }
      _NSCoreDataLog(4LL, (uint64_t)@"count request %@ returned %d", v21, v22, v23, v24, v25, v26, (uint64_t)v3);
    }

    double v27 = 0.0;
    if (v9) {
      double v27 = CFAbsoluteTimeGetCurrent() - Current;
    }
    int v28 = @"total count request execution time: %.4fs for count of %d.";
    if (a1 && *(_BYTE *)(a1 + 80)) {
      int v28 = @"total count request execution time: \x1B[31m%.4f\x1B[0ms for count of %d.";
    }
    _NSCoreDataLog(4LL, (uint64_t)v28, v21, v22, v23, v24, v25, v26, *(uint64_t *)&v27);
  }

  -[NSSQLiteConnection endFetchAndRecycleStatement:]((uint64_t)v2, 0);
  [v4 drain];
  id v29 = v10;
  return v10;
}

void sub_1868B3428()
{
}

CFMutableArrayRef _rowsForConflictDetection(void *a1, void *a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  uint64_t v5 = objc_msgSend((id)objc_msgSend(a2, "objectAtIndex:", 0), "entity");
  if (v5)
  {
    if ((*(_BYTE *)(v5 + 120) & 4) != 0)
    {
      int v6 = *(void **)(v5 + 72);
    }

    else
    {
      do
      {
        int v6 = (void *)v5;
        uint64_t v5 = [(id)v5 superentity];
      }

      while (v5);
    }
  }

  else
  {
    int v6 = 0LL;
  }

  uint64_t v15 = objc_msgSend((id)_sqlCoreLookupSQLEntityForEntityDescription(a1, v6), "tableName");
  id v7 = (void *)[MEMORY[0x189607940] string];
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  uint64_t v8 = [a2 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    unint64_t v11 = @"%qi";
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(a2);
        }
        uint64_t v13 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  v11,  objc_msgSend( (id)objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v12), "objectID"),  "_referenceData64"));
        [v7 appendString:v13];

        ++v12;
        unint64_t v11 = @", %qi";
      }

      while (v9 != v12);
      uint64_t v9 = [a2 countByEnumeratingWithState:&v17 objects:v21 count:16];
      unint64_t v11 = @", %qi";
    }

    while (v9);
  }

  return -[NSSQLiteConnection copyRawIntegerRowsForSQL:]( a3,  (void *)[NSString stringWithFormat:@"SELECT %@,%@ FROM %@ WHERE %@ IN (%@) ORDER BY %@", @"Z_PK", @"Z_OPT", v15, @"Z_PK", v7, @"Z_PK"]);
}

uint64_t compareManagedObjectsBySQLPKs(void *a1, void *a2)
{
  uint64_t v3 = objc_msgSend((id)objc_msgSend(a1, "objectID"), "_referenceData64");
  uint64_t v4 = objc_msgSend((id)objc_msgSend(a2, "objectID"), "_referenceData64");
  uint64_t v5 = -1LL;
  if (v3 >= v4) {
    uint64_t v5 = 1LL;
  }
  if (v3 == v4) {
    return 0LL;
  }
  else {
    return v5;
  }
}

NSKnownKeysDictionary *_newObjectGraphStyleForSQLRow(void *a1, void *a2)
{
  if (!a1) {
    return (NSKnownKeysDictionary *)objc_alloc_init(MEMORY[0x189603F68]);
  }
  uint64_t v4 = [a2 entity];
  uint64_t v5 = (void **)[a2 managedObjectContext];
  if (a2) {
    uint64_t v6 = _insertion_fault_handler;
  }
  else {
    uint64_t v6 = 0LL;
  }
  id v7 = objc_alloc(&OBJC_CLASS___NSKnownKeysDictionary);
  if (v4) {
    uint64_t v8 = *(void *)(v4 + 104);
  }
  else {
    uint64_t v8 = 0LL;
  }
  uint64_t v10 = -[NSKnownKeysDictionary initWithSearchStrategy:](v7, "initWithSearchStrategy:", v8);
  uint64_t v11 = -[NSKnownKeysDictionary values](v10, "values");
  uint64_t v12 = [a1 knownKeyValuesPointer];
  id v32 = v10;
  uint64_t v13 = -[NSKnownKeysMappingStrategy keys](-[NSKnownKeysDictionary mapping](v10, "mapping"), "keys");
  uint64_t v14 = [MEMORY[0x189603FE8] null];
  uint64_t v15 = *(void **)(v4 + 112);
  unint64_t v16 = v15[6];
  uint64_t v17 = v15[7];
  if (v16 < v17 + v16)
  {
    uint64_t v30 = v13;
    uint64_t v31 = v11;
    __int128 v18 = (void *)(v11 + 8 * v16);
    __int128 v19 = (void *)(v13 + 8 * v16);
    __int128 v20 = (void **)(v12 + 8 * v16);
    do
    {
      if (v12) {
        uint64_t v21 = *v20;
      }
      else {
        uint64_t v21 = (void *)[a1 valueForKey:*v19];
      }
      id v22 = (id)v14;
      if (v21) {
        id v22 = v21;
      }
      *v18++ = v22;
      ++v19;
      ++v20;
      --v17;
    }

    while (v17);
    uint64_t v15 = *(void **)(v4 + 112);
    uint64_t v13 = v30;
    uint64_t v11 = v31;
  }

  unint64_t v23 = v15[12];
  uint64_t v24 = v15[13];
  if (v23 < v24 + v23)
  {
    uint64_t v25 = (void *)(v11 + 8 * v23);
    uint64_t v26 = (void *)(v13 + 8 * v23);
    double v27 = (void **)(v12 + 8 * v23);
    do
    {
      if (v12) {
        int v28 = *v27;
      }
      else {
        int v28 = (void *)[a1 valueForKey:*v26];
      }
      id v29 = (id)v14;
      if (v28)
      {
        if ((_BYTE)z9dsptsiQ80etb9782fsrs98bfdle88) {
          id v29 = v28;
        }
        else {
          id v29 = -[NSManagedObjectContext _retainedObjectWithID:optionalHandler:withInlineStorage:](v5, v28, v6);
        }
      }

      *v25++ = v29;
      ++v26;
      ++v27;
      --v24;
    }

    while (v24);
  }

  return v32;
}

uint64_t _newConflictRecordForObject(void *a1, void *a2, unint64_t a3, int a4)
{
  uint64_t v8 = _newObjectGraphStyleForSQLRow(a2, a1);
  uint64_t v9 = _newObjectGraphStyleForSQLRow((void *)a3, a1);
  uint64_t v10 = objc_alloc(&OBJC_CLASS___NSMergeConflict);
  if (a3) {
    a3 = [(id)a3 _versionNumber];
  }
  if (a2) {
    uint64_t v11 = [a2 _versionNumber];
  }
  else {
    uint64_t v11 = 0LL;
  }
  if (a4) {
    uint64_t v12 = 0LL;
  }
  else {
    uint64_t v12 = v9;
  }
  uint64_t v13 = -[NSMergeConflict initWithSource:newVersion:oldVersion:cachedSnapshot:persistedSnapshot:]( v10,  "initWithSource:newVersion:oldVersion:cachedSnapshot:persistedSnapshot:",  a1,  a3,  v11,  v8,  v12);

  return v13;
}

void *_performExhaustiveOptimisticLockingDetectionForSaveRequest(uint64_t a1, void *a2, int a3)
{
  uint64_t v81 = *MEMORY[0x1895F89C0];
  __int128 v70 = (NSSQLObjectFaultRequestContext *)a1;
  if (a1 && (a1 = *(void *)(a1 + 96)) != 0 && (uint64_t v4 = *(void *)(a1 + 8)) != 0) {
    uint64_t v5 = *(void **)(v4 + 32);
  }
  else {
    uint64_t v5 = 0LL;
  }
  id v6 = -[NSSQLSavePlan newObjectsForExhaustiveLockConflictDetection](a1);
  if (v5)
  {
    if ([a2 count])
    {
      __int128 v77 = 0u;
      __int128 v78 = 0u;
      __int128 v75 = 0u;
      __int128 v76 = 0u;
      uint64_t v7 = [a2 countByEnumeratingWithState:&v75 objects:v80 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v76;
        do
        {
          for (uint64_t i = 0LL; i != v7; ++i)
          {
            if (*(void *)v76 != v8) {
              objc_enumerationMutation(a2);
            }
            objc_msgSend( v6,  "addObject:",  objc_msgSend(v5, "objectWithID:", *(void *)(*((void *)&v75 + 1) + 8 * i)));
          }

          uint64_t v7 = [a2 countByEnumeratingWithState:&v75 objects:v80 count:16];
        }

        while (v7);
      }
    }
  }

  uint64_t v68 = (void *)[MEMORY[0x189603FE0] set];
  __int128 v73 = 0u;
  __int128 v74 = 0u;
  __int128 v71 = 0u;
  __int128 v72 = 0u;
  uint64_t v10 = [a2 countByEnumeratingWithState:&v71 objects:v79 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v72;
    do
    {
      for (uint64_t j = 0LL; j != v10; ++j)
      {
        if (*(void *)v72 != v11) {
          objc_enumerationMutation(a2);
        }
        uint64_t v13 = *(void **)(*((void *)&v71 + 1) + 8 * j);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          uint64_t v13 = (void *)[v13 objectID];
        }
        if (v13) {
          [v68 addObject:v13];
        }
      }

      uint64_t v10 = [a2 countByEnumeratingWithState:&v71 objects:v79 count:16];
    }

    while (v10);
  }

  uint64_t v64 = -[NSSQLStoreRequestContext rowCache](v70, "rowCache");
  if (v70) {
    uint64_t connection = (uint64_t)v70->super._connection;
  }
  else {
    uint64_t connection = 0LL;
  }
  uint64_t v14 = [v6 count];
  uint64_t v62 = (void *)[MEMORY[0x189603FA8] array];
  if (v14)
  {
    uint64_t v60 = (void *)+[_PFRoutines _groupObjectsByRootEntity:]((uint64_t)&OBJC_CLASS____PFRoutines, v6);
    uint64_t v59 = [v60 count];
    if (v59)
    {
      CFMutableArrayRef cf = 0LL;
      uint64_t v15 = 0LL;
      while (1)
      {
        uint64_t v67 = (void *)objc_msgSend( (id)objc_msgSend(v60, "objectAtIndex:", v15),  "sortedArrayUsingFunction:context:",  compareManagedObjectsBySQLPKs,  0);
        if (cf) {
          CFRelease(cf);
        }
        unint64_t v16 = v70 ? v70->super._sqlCore : 0LL;
        CFMutableArrayRef cf = _rowsForConflictDetection(v16, v67, connection);
        unint64_t Count = CFArrayGetCount(cf);
        uint64_t v66 = [v67 count];
        if (v66) {
          break;
        }
LABEL_75:
        if (++v15 == v59)
        {
          if (cf) {
            CFRelease(cf);
          }
          goto LABEL_80;
        }
      }

      uint64_t v17 = 0LL;
      unint64_t idx = 1LL;
      while (1)
      {
        __int128 v18 = (void *)MEMORY[0x186E3E5D8]();
        if (idx >= Count) {
          ValueAtIndex = 0LL;
        }
        else {
          ValueAtIndex = CFArrayGetValueAtIndex(cf, idx);
        }
        __int128 v20 = (void *)[v67 objectAtIndex:v17];
        uint64_t v21 = (void *)[v20 objectID];
        id v22 = -[NSSQLSaveChangesRequestContext originalRowForObjectID:]((uint64_t)v70, v21);
        if (!v22)
        {
          unint64_t v23 = -[NSSQLStoreRequestContext createNestedObjectFaultContextForObjectWithID:](v70, (uint64_t)v21);
          p_isa = (id *)&v23->super.super.isa;
          if (v23) {
            v23->_forConflictAnalysis = 1;
          }
          if (v70) {
            uint64_t v25 = v70->super._connection;
          }
          else {
            uint64_t v25 = 0LL;
          }
          -[NSSQLStoreRequestContext setConnection:]((uint64_t)v23, v25);
          -[NSSQLStoreRequestContext setQueryGenerationToken:](p_isa, 0LL);
          uint64_t v26 = _executeObjectFaultRequest((uint64_t)p_isa);
          id v22 = (os_unfair_lock_s *)v26;
          if (v70 && v26) {
            -[NSSQLiteConnection setObject:forKey:](v70[1].super._connection, "setObject:forKey:", v26, v21);
          }
          -[NSSQLStoreRequestContext setConnection:]((uint64_t)p_isa, 0LL);
        }

        if (!ValueAtIndex || [v21 _referenceData64] != *ValueAtIndex) {
          break;
        }
        if (v22) {
          uint64_t v27 = *(unsigned int *)(*(void *)&v22[10]._os_unfair_lock_opaque + 12LL);
        }
        else {
          uint64_t v27 = 0LL;
        }
        if (v27 != ValueAtIndex[1]
          || objc_msgSend(v68, "containsObject:", -[os_unfair_lock_s objectID](v22, "objectID")))
        {
          int v28 = -[NSSQLStoreRequestContext createNestedObjectFaultContextForObjectWithID:](v70, (uint64_t)v21);
          id v29 = (id *)&v28->super.super.isa;
          if (v28) {
            v28->_forConflictAnalysis = 1;
          }
          if (v70) {
            uint64_t v30 = v70->super._connection;
          }
          else {
            uint64_t v30 = 0LL;
          }
          -[NSSQLStoreRequestContext setConnection:]((uint64_t)v28, v30);
          -[NSSQLStoreRequestContext setQueryGenerationToken:](v29, 0LL);
          uint64_t v31 = _executeObjectFaultRequest((uint64_t)v29);
          -[NSSQLStoreRequestContext setConnection:]((uint64_t)v29, 0LL);

          id v32 = (void *)_newConflictRecordForObject(v20, v22, (unint64_t)v31, a3);
          if ((int)-[NSSQLStoreRequestContext debugLogLevel]((uint64_t)v70) < 2)
          {
            if ((int)-[NSSQLStoreRequestContext debugLogLevel]((uint64_t)v70) >= 1) {
              _NSCoreDataLog( 4LL,  (uint64_t)@"Optimistic locking failure for %@.  Row was updated.",  v51,  v52,  v53,  v54,  v55,  v56,  (uint64_t)v21);
            }
          }

          else
          {
            _NSCoreDataLog( 4LL,  (uint64_t)@"Optimistic locking failure for %@.  Row was updated.  Original row = %@ New Row = %@",  v33,  v34,  v35,  v36,  v37,  v38,  (uint64_t)v21);
          }

          goto LABEL_65;
        }

void sub_1868B3F7C()
{
}

void sub_1868B3F9C()
{
  if (v0) {
    JUMPOUT(0x1868B3FA4LL);
  }
  JUMPOUT(0x1868B3FB8LL);
}

void sub_1868B3FAC(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  _Unwind_Resume(a1);
}

id faultRowWithObjectID(uint64_t a1, NSSQLObjectFaultRequestContext *a2)
{
  uint64_t v3 = -[NSSQLStoreRequestContext createNestedObjectFaultContextForObjectWithID:](a2, a1);
  uint64_t v4 = v3;
  if (v3) {
    v3->_forConflictAnalysis = 1;
  }
  if (a2) {
    uint64_t connection = a2->super._connection;
  }
  else {
    uint64_t connection = 0LL;
  }
  -[NSSQLStoreRequestContext setConnection:]((uint64_t)v3, connection);
  id v7 = _executeNewRowValuesForObjectFaultRequest(v4);
  if (!v7)
  {
    if (v4)
    {
      error = v4->super._error;
      if (a2)
      {
LABEL_8:
        objc_setProperty_nonatomic(a2, v6, error, 40LL);
        id v7 = 0LL;
        goto LABEL_9;
      }
    }

    else
    {
      error = 0LL;
      if (a2) {
        goto LABEL_8;
      }
    }

    id v7 = 0LL;
  }

void sub_1868B4080(_Unwind_Exception *a1)
{
}

void sub_1868B409C()
{
}

id _performExhaustiveUniquenessConflictDetectionForSaveRequest(uint64_t a1, void *a2)
{
  uint64_t v2 = a1;
  uint64_t v247 = *MEMORY[0x1895F89C0];
  if (a1) {
    a1 = *(void *)(a1 + 96);
  }
  id v146 = -[NSSQLSavePlan newObjectsForUniquenessConflictDetectionGivenReportedFailures:](a1, a2);
  obuint64_t j = (id)+[_PFRoutines _rootEntityGroupsForObjects:passingBlock:]( (uint64_t)&OBJC_CLASS____PFRoutines,  v146,  (uint64_t)&__block_literal_global_30);
  id v147 = objc_alloc_init(MEMORY[0x1896077E8]);
  v205 = (NSSQLObjectFaultRequestContext *)v2;
  if (v2)
  {
    uint64_t v154 = *(void *)(v2 + 24);
    v164 = *(void **)(v2 + 32);
    uint64_t v171 = [*(id *)(v2 + 8) model];
    v166 = *(void **)(v2 + 8);
  }

  else
  {
    uint64_t v171 = 0LL;
    uint64_t v154 = 0LL;
    v164 = 0LL;
    v166 = 0LL;
  }

  v201 = (void *)[MEMORY[0x189603FA8] array];
  __int128 v210 = 0u;
  __int128 v211 = 0u;
  __int128 v212 = 0u;
  __int128 v213 = 0u;
  uint64_t v160 = [obj countByEnumeratingWithState:&v210 objects:v245 count:16];
  if (v160)
  {
    id v158 = *(id *)v211;
LABEL_7:
    id v173 = 0LL;
    while (1)
    {
      if (*(id *)v211 != v158) {
        objc_enumerationMutation(obj);
      }
      id v168 = *(id *)(*((void *)&v210 + 1) + 8LL * (void)v173);
      uint64_t v3 = objc_msgSend((id)objc_msgSend(v168, "lastObject"), "entity");
      if (v3)
      {
        if ((*(_BYTE *)(v3 + 120) & 4) != 0)
        {
          uint64_t v4 = *(void **)(v3 + 72);
        }

        else
        {
          do
          {
            uint64_t v4 = (void *)v3;
            uint64_t v3 = [(id)v3 superentity];
          }

          while (v3);
        }
      }

      else
      {
        uint64_t v4 = 0LL;
      }

      v184 = (void *)_sqlCoreLookupSQLEntityForEntityDescription(v166, v4);
      uint64_t v179 = objc_msgSend((id)objc_msgSend(v4, "subentities"), "count");
      if (v184) {
        uint64_t v5 = (void *)v184[26];
      }
      else {
        uint64_t v5 = 0LL;
      }
      id v199 = v5;
      if (![v5 count]) {
        goto LABEL_121;
      }
      id v6 = objc_alloc_init(MEMORY[0x1896077E8]);
      id v7 = +[NSSQLiteAdapter generateStatementForCheckingUniqueProperties:onObjects:usingSQLCore:]( (uint64_t)&OBJC_CLASS___NSSQLiteAdapter,  v199,  v168,  v166);
      uint64_t v8 = v7;
      [v6 drain];
      uint64_t v9 = v7;
      id v10 = objc_alloc_init(MEMORY[0x189603FA8]);
      uint64_t v11 = v10;
      if (!v184) {
        break;
      }
      [v10 addObject:v184[16]];
      if (v179)
      {
        uint64_t v12 = v184[17];
LABEL_21:
        [v11 addObject:v12];
      }

LABEL_193:
                          uint64_t v103 = [NSString stringWithUTF8String:"Unsupported unique attribute type: %@"];
                          _NSCoreDataLog(17LL, v103, v104, v105, v106, v107, v108, v109, v99);
                          uint64_t v110 = (os_log_s *)__pflogFaultLog;
                          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                          {
                            *(_DWORD *)v237 = 138412290;
                            *(void *)&v237[4] = v99;
                            _os_log_fault_impl( &dword_186681000,  v110,  OS_LOG_TYPE_FAULT,  "CoreData: Unsupported unique attribute type: %@",  v237,  0xCu);
                          }

                          id v102 = 0LL;
                        }

void sub_1868B55AC(_Unwind_Exception *a1)
{
}

void sub_1868B55C4(_Unwind_Exception *a1)
{
}

void sub_1868B55DC(uint64_t a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  JUMPOUT(0x1868B55E8LL);
}

uint64_t ___performExhaustiveUniquenessConflictDetectionForSaveRequest_block_invoke(uint64_t a1, void *a2)
{
  return -[NSEntityDescription _hasUniqueProperties]([a2 entity]);
}

uint64_t _rollbackTransactionForSaveRequest(void *a1)
{
  if (a1)
  {
    uint64_t v2 = a1[3];
    uint64_t v3 = a1[12];
    if (v2 && *(_BYTE *)(v2 + 40)) {
      -[NSSQLiteConnection rollbackTransaction](v2);
    }
    uint64_t v4 = a1[1];
  }

  else
  {
    uint64_t v3 = 0LL;
    uint64_t v4 = 0LL;
  }

  uint64_t v5 = (void *)MEMORY[0x189607950];
  id v6 = (void *)MEMORY[0x189603F68];
  uint64_t v7 = [MEMORY[0x189607968] numberWithInt:4];
  if (!v3)
  {
    uint64_t v9 = [MEMORY[0x189607968] numberWithInt:0];
    id v10 = 0LL;
    goto LABEL_13;
  }

  uint64_t v8 = atomic_load((unsigned int *)(v3 + 144));
  uint64_t v9 = [MEMORY[0x189607968] numberWithInt:v8];
  id v10 = *(void **)(v3 + 8);
  if (!v10)
  {
LABEL_13:
    uint64_t v11 = 0LL;
    goto LABEL_10;
  }

  id v10 = (void *)[v10 persistentStoreRequest];
  uint64_t v11 = *(void *)(v3 + 8);
  if (v11) {
    uint64_t v11 = *(void *)(v11 + 32);
  }
LABEL_10:
  uint64_t v12 = objc_msgSend( v5,  "notificationWithName:object:userInfo:",  @"_NSSQLCoreTransactionStateChangeNotification",  v4,  objc_msgSend( v6,  "dictionaryWithObjectsAndKeys:",  v7,  @"_NSSQLCoreTransactionType",  v9,  @"_NSSQLCoreTransientSequenceNumber",  v10,  @"_NSSQLCoreActiveSaveRequest",  v11,  @"_NSSQLCoreActiveSavingContext",  a1,  @"requestContext",  0));
  return objc_msgSend((id)objc_msgSend(MEMORY[0x189607958], "defaultCenter"), "postNotification:", v12);
}

void _executeSaveChangesRequest(NSSQLObjectFaultRequestContext *a1)
{
  uint64_t v262 = *MEMORY[0x1895F89C0];
  id v201 = objc_alloc_init(MEMORY[0x1896077E8]);
  if (!a1 || !a1->super._connection) {
    goto LABEL_293;
  }
  fetchRequest = a1->_fetchRequest;
  BOOL v202 = -[NSPersistentStoreRequest _secureOperation]( -[NSSQLStoreRequestContext persistentStoreRequest](a1, "persistentStoreRequest"),  "_secureOperation");
  self = a1;
  -[NSSQLiteConnection _setSaveRequest:]((id *)&a1->super._connection->super.isa, a1);
  if (v202) {
    -[NSSQLiteConnection setSecureDeleteMode:]((uint64_t)a1->super._connection, 1);
  }
  uint64_t v2 = a1;
  if (!a1->_objectID)
  {
    uint64_t v3 = a1->_fetchRequest;
    if (!v3)
    {
      int v204 = 0;
      goto LABEL_117;
    }

    uint64_t v2 = self;
    if ((BYTE4(v3[1]._additionalPrivateIvars) & 2) == 0)
    {
      int v204 = 0;
LABEL_23:
      if ((BYTE4(v3[1]._additionalPrivateIvars) & 2) != 0)
      {
        __int128 v18 = -[NSSQLSavePlan newObjectsForFastLockConflictDetection](&self->_fetchRequest->super.super.isa);
        uint64_t connection = (uint64_t)self->super._connection;
        if ([v18 count]
          && (__int128 v20 = (void *)+[_PFRoutines _groupObjectsByRootEntity:]((uint64_t)&OBJC_CLASS____PFRoutines, v18),
              (uint64_t v21 = [v20 count]) != 0))
        {
          uint64_t v22 = 0LL;
          id v197 = v20;
          uint64_t v199 = connection;
          v196 = (char *)v21;
          while (1)
          {
            id v210 = (id)objc_msgSend( (id)objc_msgSend(v20, "objectAtIndex:", v22),  "sortedArrayUsingFunction:context:",  compareManagedObjectsBySQLPKs,  0);
            uint64_t v23 = _rowsForConflictDetection(self->super._sqlCore, v210, connection);
            int Count = CFArrayGetCount(v23);
            uint64_t v25 = [v210 count];
            uint64_t v26 = v25;
            if (Count - 1 != v25)
            {
              if (v23) {
                CFRelease(v23);
              }
              goto LABEL_117;
            }

            obuint64_t j = v22;
            if (v25) {
              break;
            }
LABEL_41:
            uint64_t v22 = obj + 1;
            __int128 v20 = v197;
            uint64_t connection = v199;
            if (obj + 1 == v196)
            {
              if (v23) {
                CFRelease(v23);
              }
              goto LABEL_44;
            }
          }

          CFIndex v27 = 1LL;
          while (1)
          {
            uint64_t v28 = (void *)MEMORY[0x186E3E5D8]();
            ValueAtIndex = CFArrayGetValueAtIndex(v23, v27);
            CFIndex v30 = v27 - 1;
            uint64_t v31 = (void *)objc_msgSend((id)objc_msgSend(v210, "objectAtIndex:", v27 - 1), "objectID");
            int v32 = -[NSSQLSaveChangesRequestContext originalRowForObjectID:]((uint64_t)self, v31);
            if (!v32)
            {
              id v33 = -[NSSQLStoreRequestContext createNestedObjectFaultContextForObjectWithID:](self, (uint64_t)v31);
              -[NSSQLStoreRequestContext setConnection:]((uint64_t)v33, self->super._connection);
              -[NSSQLStoreRequestContext setQueryGenerationToken:]((id *)&v33->super.super.isa, 0LL);
              int v32 = _executeObjectFaultRequest((uint64_t)v33);
              if (v32) {
                -[NSSQLiteConnection setObject:forKey:](self[1].super._connection, "setObject:forKey:", v32, v31);
              }
              -[NSSQLStoreRequestContext setConnection:]((uint64_t)v33, 0LL);
            }

            if ([v31 _referenceData64] != *ValueAtIndex) {
              break;
            }
            uint64_t v34 = v32 ? *(unsigned int *)(v32[5] + 12LL) : 0LL;
            if (v34 != ValueAtIndex[1]) {
              break;
            }
            objc_autoreleasePoolPop(v28);
            CFIndex v27 = v30 + 2;
            if (v30 + 1 == v26) {
              goto LABEL_41;
            }
          }

          CFRelease(v23);
          objc_autoreleasePoolPop(v28);
        }

        else
        {
LABEL_44:
          uint64_t v35 = (uint64_t)self->super._connection;
          uint64_t v36 = self->_fetchRequest;
          id v211 = objc_alloc_init(MEMORY[0x189603FA8]);
          if (v36) {
            obja = v36->_valuesToFetch;
          }
          else {
            obja = 0LL;
          }
          uint64_t v200 = (uint64_t)v36;
          __int128 v236 = 0u;
          __int128 v237 = 0u;
          __int128 v234 = 0u;
          __int128 v235 = 0u;
          uint64_t v37 = -[NSArray countByEnumeratingWithState:objects:count:]( obja,  "countByEnumeratingWithState:objects:count:",  &v234,  buf,  16LL);
          if (v37)
          {
            uint64_t v38 = *(void *)v235;
            while (2)
            {
              for (uint64_t i = 0LL; i != v37; ++i)
              {
                if (*(void *)v235 != v38) {
                  objc_enumerationMutation(obja);
                }
                uint64_t v40 = *(void **)(*((void *)&v234 + 1) + 8 * i);
                uint64_t v41 = (void *)MEMORY[0x186E3E5D8]();
                if ((-[NSSQLiteConnection deleteRow:forRequestContext:](v35, (uint64_t)v40, (uint64_t)self) & 1) == 0)
                {
                  uint64_t v42 = [v40 objectID];
                  uint64_t v43 = -[NSSQLStoreRequestContext createNestedObjectFaultContextForObjectWithID:]( self,  [v40 objectID]);
                  -[NSSQLStoreRequestContext setConnection:]((uint64_t)v43, self->super._connection);
                  -[NSSQLStoreRequestContext setQueryGenerationToken:]((id *)&v43->super.super.isa, 0LL);
                  uint64_t v44 = _executeObjectFaultRequest((uint64_t)v43);
                  -[NSSQLStoreRequestContext setConnection:]((uint64_t)v43, 0LL);

                  if (v44)
                  {
                    if ((int)-[NSSQLStoreRequestContext debugLogLevel]((uint64_t)self) < 2)
                    {
                      if ((int)-[NSSQLStoreRequestContext debugLogLevel]((uint64_t)self) >= 1) {
                        _NSCoreDataLog( 4LL,  (uint64_t)@"Optimistic locking failure for %@.  During write changes, deletion failed.  Row was updated.",  v184,  v185,  v186,  v187,  v188,  v189,  v42);
                      }
                    }

                    else
                    {
                      _NSCoreDataLog( 4LL,  (uint64_t)@"Optimistic locking failure for %@.  During write changes, deletion failed.  Row was updated.  Original row = %@ New Row = %@",  v178,  v179,  v180,  v181,  v182,  v183,  v42);
                    }

                    v249 = @"_NSCoreDataOptimisticLockingFailureConflictsKey";
                    uint64_t v248 = v42;
                    uint64_t v250 = [MEMORY[0x189603F18] arrayWithObjects:&v248 count:1];
                    uint64_t v190 = [MEMORY[0x189603F68] dictionaryWithObjects:&v250 forKeys:&v249 count:1];
                    objc_exception_throw( +[_NSCoreDataOptimisticLockingException exceptionWithName:reason:userInfo:]( &OBJC_CLASS____NSCoreDataOptimisticLockingException,  "exceptionWithName:reason:userInfo:",  *MEMORY[0x189603A58],  @"optimistic locking failure",  v190));
                    goto LABEL_293;
                  }
                }

                objc_autoreleasePoolPop(v41);
              }

              uint64_t v37 = -[NSArray countByEnumeratingWithState:objects:count:]( obja,  "countByEnumeratingWithState:objects:count:",  &v234,  buf,  16LL);
              if (v37) {
                continue;
              }
              break;
            }
          }

          id v198 = (void *)[MEMORY[0x189603FE0] set];
          __int128 v232 = 0u;
          __int128 v233 = 0u;
          __int128 v230 = 0u;
          __int128 v231 = 0u;
          CFArrayRef theArray = (CFArrayRef)-[NSSQLSavePlan newInsertedRows](v200);
          uint64_t v45 = -[__CFArray countByEnumeratingWithState:objects:count:]( theArray,  "countByEnumeratingWithState:objects:count:",  &v230,  v259,  16LL);
          if (v45)
          {
            uint64_t v46 = *(void *)v231;
            do
            {
              for (uint64_t j = 0LL; j != v45; ++j)
              {
                if (*(void *)v231 != v46) {
                  objc_enumerationMutation(theArray);
                }
                uint64_t v48 = *(void *)(*((void *)&v230 + 1) + 8 * j);
                uint64_t v49 = (void *)MEMORY[0x186E3E5D8]();
                if (!v48 || (*(_BYTE *)(v48 + 16) & 1) != 0) {
                  uint64_t v50 = 0LL;
                }
                else {
                  uint64_t v50 = (void *)[*(id *)(*(void *)(v48 + 40) + 16) _storeInfo1];
                }
                -[NSSQLiteConnection insertRow:](v35, v48);
                objc_autoreleasePoolPop(v49);
              }

              uint64_t v45 = -[__CFArray countByEnumeratingWithState:objects:count:]( theArray,  "countByEnumeratingWithState:objects:count:",  &v230,  v259,  16LL);
            }

            while (v45);
          }

          if (v200) {
            uint64_t v51 = (void *)[*(id *)(v200 + 48) mutableCopy];
          }
          else {
            uint64_t v51 = 0LL;
          }
          __int128 v228 = 0u;
          __int128 v229 = 0u;
          __int128 v226 = 0u;
          __int128 v227 = 0u;
          uint64_t v52 = v51;
          uint64_t v53 = [v51 countByEnumeratingWithState:&v226 objects:&v255 count:16];
          if (v53)
          {
            uint64_t v54 = *(void *)v227;
            do
            {
              for (uint64_t k = 0LL; k != v53; ++k)
              {
                if (*(void *)v227 != v54) {
                  objc_enumerationMutation(v52);
                }
                uint64_t v56 = *(void *)(*((void *)&v226 + 1) + 8 * k);
                uint64_t v57 = (void *)MEMORY[0x186E3E5D8]();
                if (!v56 || (*(_BYTE *)(v56 + 16) & 1) != 0) {
                  uint64_t v58 = 0LL;
                }
                else {
                  uint64_t v58 = (void *)[*(id *)(*(void *)(v56 + 40) + 16) _storeInfo1];
                }
                if (-[NSEntityDescription _hasUniqueProperties]([v58 entityDescription]))
                {
                  uint64_t v59 = -[NSSQLSaveChangesRequestContext originalRowForObjectID:]( (uint64_t)self,  (const void *)[(id)v56 objectID]);
                }

                -[NSSQLiteConnection updateRow:forRequestContext:](v35, v56, (uint64_t)self);
                objc_autoreleasePoolPop(v57);
              }

              uint64_t v53 = [v52 countByEnumeratingWithState:&v226 objects:&v255 count:16];
            }

            while (v53);
          }

          if (v200) {
            uint64_t v60 = (void *)[*(id *)(v200 + 56) mutableCopy];
          }
          else {
            uint64_t v60 = 0LL;
          }
          __int128 v224 = 0u;
          __int128 v225 = 0u;
          __int128 v222 = 0u;
          __int128 v223 = 0u;
          uint64_t v61 = [v60 countByEnumeratingWithState:&v222 objects:&v251 count:16];
          if (v61)
          {
            uint64_t v62 = *(void *)v223;
            do
            {
              for (uint64_t m = 0LL; m != v61; ++m)
              {
                if (*(void *)v223 != v62) {
                  objc_enumerationMutation(v60);
                }
                uint64_t v64 = *(void *)(*((void *)&v222 + 1) + 8 * m);
                uint64_t v65 = (void *)MEMORY[0x186E3E5D8]();
                if (!v64 || (*(_BYTE *)(v64 + 16) & 1) != 0) {
                  uint64_t v66 = 0LL;
                }
                else {
                  uint64_t v66 = (void *)[*(id *)(*(void *)(v64 + 40) + 16) _storeInfo1];
                }
                if (-[NSEntityDescription _hasUniqueProperties]([v66 entityDescription]))
                {
                  uint64_t v67 = -[NSSQLSaveChangesRequestContext originalRowForObjectID:]( (uint64_t)self,  (const void *)[(id)v64 objectID]);
                }

                -[NSSQLiteConnection updateRow:forRequestContext:](v35, v64, (uint64_t)self);
                objc_autoreleasePoolPop(v65);
              }

              uint64_t v61 = [v60 countByEnumeratingWithState:&v222 objects:&v251 count:16];
            }

            while (v61);
          }

          __int128 v220 = 0u;
          __int128 v221 = 0u;
          __int128 v218 = 0u;
          __int128 v219 = 0u;
          uint64_t v68 = [v211 countByEnumeratingWithState:&v218 objects:&v244 count:16];
          if (v68)
          {
            uint64_t v69 = *(void *)v219;
            do
            {
              for (uint64_t n = 0LL; n != v68; ++n)
              {
                if (*(void *)v219 != v69) {
                  objc_enumerationMutation(v211);
                }
                uint64_t v71 = *(void *)(*((void *)&v218 + 1) + 8 * n);
                __int128 v72 = (void *)MEMORY[0x186E3E5D8]();
                -[NSSQLiteConnection updateConstrainedValuesForRow:](v35, v71);
                objc_autoreleasePoolPop(v72);
              }

              uint64_t v68 = [v211 countByEnumeratingWithState:&v218 objects:&v244 count:16];
            }

            while (v68);
          }

          if ([v198 count])
          {
            uint64_t v242 = @"_NSCoreDataOptimisticLockingFailureConflictsKey";
            v243 = v198;
            uint64_t v195 = [MEMORY[0x189603F68] dictionaryWithObjects:&v243 forKeys:&v242 count:1];
            objc_exception_throw( +[_NSCoreDataConstraintViolationException exceptionWithName:reason:userInfo:]( &OBJC_CLASS____NSCoreDataConstraintViolationException,  "exceptionWithName:reason:userInfo:",  *MEMORY[0x189603A60],  @"Constraint violation",  v195));
            goto LABEL_293;
          }

          uint64_t v73 = (void *)-[NSSQLSavePlan newCorrelationTableUpdates](v200);
          __int128 v216 = 0u;
          __int128 v217 = 0u;
          __int128 v214 = 0u;
          __int128 v215 = 0u;
          uint64_t v74 = [v73 countByEnumeratingWithState:&v214 objects:&v238 count:16];
          if (v74)
          {
            uint64_t v75 = *(void *)v215;
            do
            {
              for (iuint64_t i = 0LL; ii != v74; ++ii)
              {
                if (*(void *)v215 != v75) {
                  objc_enumerationMutation(v73);
                }
                uint64_t v77 = *(void *)(*((void *)&v214 + 1) + 8 * ii);
                id v78 = (void *)MEMORY[0x186E3E5D8]();
                -[NSSQLiteConnection writeCorrelationChangesFromTracker:](v35, v77);
                objc_autoreleasePoolPop(v78);
              }

              uint64_t v74 = [v73 countByEnumeratingWithState:&v214 objects:&v238 count:16];
            }

            while (v74);
          }
        }
      }

      goto LABEL_117;
    }
  }

  sqlCore = v2->super._sqlCore;
  if (sqlCore) {
    -[_PFMutex lock](sqlCore->_writerSerializationMutex, "lock");
  }
  uint64_t v5 = self->_fetchRequest;
  if (v5 && (affectedStores = v5->super._affectedStores) != 0LL) {
    uint64_t v7 = -[NSArray persistentStoreRequest](affectedStores, "persistentStoreRequest");
  }
  else {
    uint64_t v7 = 0LL;
  }
  uint64_t v8 = (uint64_t)self->super._connection;
  if (v8)
  {
    if (*(_BYTE *)(v8 + 40))
    {
      v192 = (void *)MEMORY[0x189603F70];
      uint64_t v193 = objc_msgSend( NSString,  "stringWithFormat:",  @"SaveChanges: NSSQLCore: %p Transactions cannot be nested\n",  self->super._sqlCore);
      objc_exception_throw((id)[v192 exceptionWithName:*MEMORY[0x189603A58] reason:v193 userInfo:0]);
      goto LABEL_293;
    }

    -[NSSQLiteConnection beginTransaction](v8);
  }

  else
  {
    -[NSSQLiteConnection beginTransaction](0LL);
  }

  uint64_t v9 = self->super._sqlCore;
  id v10 = (void *)MEMORY[0x189607950];
  uint64_t v11 = (void *)MEMORY[0x189603F68];
  uint64_t v12 = [MEMORY[0x189607968] numberWithInt:1];
  if (v5)
  {
    uint64_t v13 = atomic_load((unsigned int *)&v5[1]._additionalPrivateIvars);
    uint64_t v14 = [MEMORY[0x189607968] numberWithInt:v13];
    isa = v5->super._affectedStores;
    if (isa) {
      isa = (NSArray *)isa[4].super.isa;
    }
  }

  else
  {
    uint64_t v14 = [MEMORY[0x189607968] numberWithInt:0];
    isa = 0LL;
  }

  uint64_t v16 = objc_msgSend( v10,  "notificationWithName:object:userInfo:",  @"_NSSQLCoreTransactionStateChangeNotification",  v9,  objc_msgSend( v11,  "dictionaryWithObjectsAndKeys:",  v12,  @"_NSSQLCoreTransactionType",  v14,  @"_NSSQLCoreTransientSequenceNumber",  v7,  @"_NSSQLCoreActiveSaveRequest",  isa,  @"_NSSQLCoreActiveSavingContext",  self,  @"requestContext",  0));
  objc_msgSend((id)objc_msgSend(MEMORY[0x189607958], "defaultCenter"), "postNotification:", v16);
  uint64_t v3 = self->_fetchRequest;
  objectID = (__CFString *)self->_objectID;
  if (objectID) {
    -[NSSQLiteConnection saveMetadata:](&self->super._connection->super.isa, objectID);
  }
  int v204 = 1;
  if (v3) {
    goto LABEL_23;
  }
LABEL_117:
  __int128 v79 = fetchRequest;
  if (fetchRequest)
  {
    Class v80 = fetchRequest[1].super.super.isa;
    if (v80)
    {
      uint64_t v81 = (void *)[MEMORY[0x189603FA8] array];
      __int128 v258 = 0u;
      __int128 v257 = 0u;
      __int128 v256 = 0u;
      __int128 v255 = 0u;
      uint64_t v82 = -[objc_class countByEnumeratingWithState:objects:count:]( v80,  "countByEnumeratingWithState:objects:count:",  &v255,  buf,  16LL);
      if (v82)
      {
        uint64_t v83 = *(void *)v256;
        do
        {
          for (juint64_t j = 0LL; jj != v82; ++jj)
          {
            if (*(void *)v256 != v83) {
              objc_enumerationMutation(v80);
            }
            [*(id *)(*((void *)&v255 + 1) + 8 * jj) _copyToInterimLocation];
          }

          uint64_t v82 = -[objc_class countByEnumeratingWithState:objects:count:]( v80,  "countByEnumeratingWithState:objects:count:",  &v255,  buf,  16LL);
        }

        while (v82);
      }

      __int128 v253 = 0u;
      __int128 v254 = 0u;
      __int128 v251 = 0u;
      __int128 v252 = 0u;
      uint64_t v85 = -[objc_class countByEnumeratingWithState:objects:count:]( v80,  "countByEnumeratingWithState:objects:count:",  &v251,  v259,  16LL);
      if (v85)
      {
        uint64_t v86 = *(void *)v252;
        do
        {
          for (kuint64_t k = 0LL; kk != v85; ++kk)
          {
            if (*(void *)v252 != v86) {
              objc_enumerationMutation(v80);
            }
            __int128 v88 = *(void **)(*((void *)&v251 + 1) + 8 * kk);
            [v88 _moveToPermanentLocation];
            [v81 addObject:v88];
          }

          uint64_t v85 = -[objc_class countByEnumeratingWithState:objects:count:]( v80,  "countByEnumeratingWithState:objects:count:",  &v251,  v259,  16LL);
        }

        while (v85);
      }

      __int128 v79 = fetchRequest;
    }

    relationshipKeyPathsForPrefetching = v79->_relationshipKeyPathsForPrefetching;
    if (relationshipKeyPathsForPrefetching)
    {
      int v90 = (void *)[MEMORY[0x189603FA8] array];
      __int128 v258 = 0u;
      __int128 v257 = 0u;
      __int128 v256 = 0u;
      __int128 v255 = 0u;
      uint64_t v91 = -[NSArray countByEnumeratingWithState:objects:count:]( relationshipKeyPathsForPrefetching,  "countByEnumeratingWithState:objects:count:",  &v255,  buf,  16LL);
      if (v91)
      {
        uint64_t v92 = *(void *)v256;
        do
        {
          for (muint64_t m = 0LL; mm != v91; ++mm)
          {
            if (*(void *)v256 != v92) {
              objc_enumerationMutation(relationshipKeyPathsForPrefetching);
            }
            [*(id *)(*((void *)&v255 + 1) + 8 * mm) _writeExternalReferenceToInterimLocation];
          }

          uint64_t v91 = -[NSArray countByEnumeratingWithState:objects:count:]( relationshipKeyPathsForPrefetching,  "countByEnumeratingWithState:objects:count:",  &v255,  buf,  16LL);
        }

        while (v91);
      }

      __int128 v253 = 0u;
      __int128 v254 = 0u;
      __int128 v251 = 0u;
      __int128 v252 = 0u;
      uint64_t v94 = -[NSArray countByEnumeratingWithState:objects:count:]( relationshipKeyPathsForPrefetching,  "countByEnumeratingWithState:objects:count:",  &v251,  v259,  16LL);
      if (v94)
      {
        uint64_t v95 = *(void *)v252;
        do
        {
          for (nuint64_t n = 0LL; nn != v94; ++nn)
          {
            if (*(void *)v252 != v95) {
              objc_enumerationMutation(relationshipKeyPathsForPrefetching);
            }
            v97 = *(void **)(*((void *)&v251 + 1) + 8 * nn);
            [v97 _moveExternalReferenceToPermanentLocation];
            [v90 addObject:v97];
          }

          uint64_t v94 = -[NSArray countByEnumeratingWithState:objects:count:]( relationshipKeyPathsForPrefetching,  "countByEnumeratingWithState:objects:count:",  &v251,  v259,  16LL);
        }

        while (v94);
      }
    }
  }

  uint64_t v98 = self->super._sqlCore;
  if (v98 && (*((_BYTE *)&v98->_sqlCoreFlags + 1) & 4) != 0)
  {
    sqlite3_int64 v100 = (sqlite3_int64)self->super._connection;
    if (!v100 || !*(_BYTE *)(v100 + 40))
    {
      id v194 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)&OBJC_CLASS____NSCoreDataException,  *MEMORY[0x189603A58],  134030LL,  (uint64_t)@"Missing transaction scope for change tracking of changes.",  0LL);
      objc_exception_throw(v194);
      goto LABEL_293;
    }

    -[NSSQLiteConnection processSaveRequest:](v100, (uint64_t)self);
    uint64_t v99 = self;
    objb = self->super._transactionID;
  }

  else
  {
    objb = 0LL;
    uint64_t v99 = self;
  }

  int v101 = v99->_fetchRequest;
  if (v101) {
    havingPredicate = v101[1]._havingPredicate;
  }
  else {
    havingPredicate = 0LL;
  }
  if (-[NSPredicate count](havingPredicate, "count")) {
    +[NSSQLiteIndexTrackingModel updateIndexStatistics:usingConnection:model:]( (uint64_t)NSSQLiteIndexTrackingModel,  havingPredicate,  (uint64_t)self->super._connection,  (void *)objc_msgSend( -[NSSQLCore ancillarySQLModels](self->super._sqlCore, "ancillarySQLModels"),  "objectForKey:",  @"NSPersistentStoreTrackIndexUseOptionKey"));
  }
  uint64_t v103 = self->super._connection;
  uint64_t v104 = self->_fetchRequest;
  uint64_t v105 = -[NSSQLStoreRequestContext rowCache](self, "rowCache");
  if (!v103 || !v103->_transactionIsOpen)
  {
    id v191 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)&OBJC_CLASS____NSCoreDataException,  *MEMORY[0x189603A58],  134030LL,  (uint64_t)@"Missing transaction scope for commit changes.",  0LL);
    objc_exception_throw(v191);
LABEL_293:
    __break(1u);
    return;
  }

  uint64_t v106 = v105;
  CFArrayRef theArraya = (CFArrayRef)self[1].super._transactionID;
  uint64_t v107 = self->_fetchRequest;
  if (v107 && (uint64_t v108 = v107->super._affectedStores) != 0LL) {
    id v212 = (id)-[NSArray persistentStoreRequest](v108, "persistentStoreRequest");
  }
  else {
    id v212 = 0LL;
  }
  uint64_t v109 = self->super._sqlCore;
  uint64_t v110 = (void *)MEMORY[0x189607950];
  uint64_t v111 = (void *)MEMORY[0x189603F68];
  uint64_t v112 = [MEMORY[0x189607968] numberWithInt:2];
  if (v107)
  {
    uint64_t v113 = atomic_load((unsigned int *)&v107[1]._additionalPrivateIvars);
    uint64_t v114 = [MEMORY[0x189607968] numberWithInt:v113];
    uint64_t v115 = v107->super._affectedStores;
    if (v115) {
      uint64_t v115 = (NSArray *)v115[4].super.isa;
    }
    uint64_t v116 = *(void *)&v107->_flags;
  }

  else
  {
    uint64_t v114 = [MEMORY[0x189607968] numberWithInt:0];
    uint64_t v115 = 0LL;
    uint64_t v116 = 0LL;
  }

  uint64_t v117 = objc_msgSend( v110,  "notificationWithName:object:userInfo:",  @"_NSSQLCoreTransactionStateChangeNotification",  v109,  objc_msgSend( v111,  "dictionaryWithObjectsAndKeys:",  v112,  @"_NSSQLCoreTransactionType",  v114,  @"_NSSQLCoreTransientSequenceNumber",  v212,  @"_NSSQLCoreActiveSaveRequest",  v115,  @"_NSSQLCoreActiveSavingContext",  v116,  @"_NSSQLCoreTransactionExternalDataReferencesToDelete",  self,  @"requestContext",  0));
  objc_msgSend((id)objc_msgSend(MEMORY[0x189607958], "defaultCenter"), "postNotification:", v117);
  uint64_t v118 = self->super._connection;
  if (v118)
  {
    if (v118->_transactionIsOpen)
    {
      -[NSSQLiteConnection commitTransaction]((uint64_t)self->super._connection);
      __int128 v119 = self->super._sqlCore;
      if (v119)
      {
        if (atomic_load((unint64_t *)&v119->_queryGenerationTrackingConnection))
        {
          uint64_t v121 = -[NSSQLiteConnection registerCurrentQueryGenerationWithStore:]( v118,  "registerCurrentQueryGenerationWithStore:",  self->super._sqlCore);
          if ((_DWORD)v121)
          {
            uint64_t v122 = [NSString stringWithUTF8String:"Save changes failed to generate a post transaction query generation with error %d"];
            _NSCoreDataLog(17LL, v122, v123, v124, v125, v126, v127, v128, v121);
            __int128 v129 = (os_log_s *)__pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 67109120;
              int v261 = v121;
              _os_log_fault_impl( &dword_186681000,  v129,  OS_LOG_TYPE_FAULT,  "CoreData: Save changes failed to generate a post transaction query generation with error %d",  buf,  8u);
            }
          }
        }
      }
    }
  }

  __int128 v130 = self->super._sqlCore;
  uint64_t v131 = (void *)MEMORY[0x189607950];
  v132 = (void *)MEMORY[0x189603F68];
  uint64_t v133 = [MEMORY[0x189607968] numberWithInt:3];
  if (v107)
  {
    uint64_t v134 = atomic_load((unsigned int *)&v107[1]._additionalPrivateIvars);
    uint64_t v135 = [MEMORY[0x189607968] numberWithInt:v134];
    v136 = v107->super._affectedStores;
    if (v136) {
      v136 = (NSArray *)v136[4].super.isa;
    }
    uint64_t v137 = *(void *)&v107->_flags;
  }

  else
  {
    uint64_t v135 = [MEMORY[0x189607968] numberWithInt:0];
    v136 = 0LL;
    uint64_t v137 = 0LL;
  }

  uint64_t v138 = objc_msgSend( v131,  "notificationWithName:object:userInfo:",  @"_NSSQLCoreTransactionStateChangeNotification",  v130,  objc_msgSend( v132,  "dictionaryWithObjectsAndKeys:",  v133,  @"_NSSQLCoreTransactionType",  v135,  @"_NSSQLCoreTransientSequenceNumber",  v212,  @"_NSSQLCoreActiveSaveRequest",  v136,  @"_NSSQLCoreActiveSavingContext",  v137,  @"_NSSQLCoreTransactionExternalDataReferencesToDelete",  self,  @"requestContext",  0));
  objc_msgSend((id)objc_msgSend(MEMORY[0x189607958], "defaultCenter"), "postNotification:", v138);
  if (v104) {
    id v139 = v104->_valuesToFetch;
  }
  else {
    id v139 = 0LL;
  }
  __int128 v246 = 0u;
  __int128 v247 = 0u;
  __int128 v244 = 0u;
  __int128 v245 = 0u;
  uint64_t v140 = -[NSArray countByEnumeratingWithState:objects:count:]( v139,  "countByEnumeratingWithState:objects:count:",  &v244,  buf,  16LL);
  if (v140)
  {
    uint64_t v141 = *(void *)v245;
    do
    {
      for (uint64_t i1 = 0LL; i1 != v140; ++i1)
      {
        if (*(void *)v245 != v141) {
          objc_enumerationMutation(v139);
        }
        -[NSPersistentStoreCache forgetRowForObjectID:]( v106,  (const void *)[*(id *)(*((void *)&v244 + 1) + 8 * i1) objectID]);
      }

      uint64_t v140 = -[NSArray countByEnumeratingWithState:objects:count:]( v139,  "countByEnumeratingWithState:objects:count:",  &v244,  buf,  16LL);
    }

    while (v140);
  }

  if (v104) {
    uint64_t v143 = v104->_sortDescriptors;
  }
  else {
    uint64_t v143 = 0LL;
  }
  __int128 v240 = 0u;
  __int128 v241 = 0u;
  __int128 v238 = 0u;
  __int128 v239 = 0u;
  uint64_t v144 = -[NSArray countByEnumeratingWithState:objects:count:]( v143,  "countByEnumeratingWithState:objects:count:",  &v238,  v259,  16LL);
  if (v144)
  {
    uint64_t v145 = *(void *)v239;
    BOOL v147 = (CFArrayRef)v106 == theArraya || theArraya == 0LL;
    do
    {
      for (uint64_t i2 = 0LL; i2 != v144; ++i2)
      {
        if (*(void *)v239 != v145) {
          objc_enumerationMutation(v143);
        }
        v149 = *(void **)(*((void *)&v238 + 1) + 8 * i2);
        v150 = (void *)[v149 objectID];
        if (v147) {
          -[NSPersistentStoreCache registerRow:forObjectID:options:](v106, (unsigned int *)v149, v150, 4);
        }
        else {
          -[NSPersistentStoreCache forgetRowForObjectID:](v106, v150);
        }
      }

      uint64_t v144 = -[NSArray countByEnumeratingWithState:objects:count:]( v143,  "countByEnumeratingWithState:objects:count:",  &v238,  v259,  16LL);
    }

    while (v144);
  }

  if (v104) {
    id v151 = (id)v104->_batchSize;
  }
  else {
    id v151 = 0LL;
  }
  __int128 v236 = 0u;
  __int128 v237 = 0u;
  __int128 v234 = 0u;
  __int128 v235 = 0u;
  uint64_t v152 = [v151 countByEnumeratingWithState:&v234 objects:&v255 count:16];
  if (v152)
  {
    uint64_t v153 = *(void *)v235;
    do
    {
      for (uint64_t i3 = 0LL; i3 != v152; ++i3)
      {
        if (*(void *)v235 != v153) {
          objc_enumerationMutation(v151);
        }
        -[NSPersistentStoreCache forgetRowForObjectID:](v106, *(const void **)(*((void *)&v234 + 1) + 8 * i3));
      }

      uint64_t v152 = [v151 countByEnumeratingWithState:&v234 objects:&v255 count:16];
    }

    while (v152);
  }

  if (v104) {
    uint64_t v155 = (void *)-[NSPredicate mutableCopy](v104->_predicate, "mutableCopy");
  }
  else {
    uint64_t v155 = 0LL;
  }
  if ([v155 count]) {
    id v156 = objc_alloc_init(MEMORY[0x189603FA8]);
  }
  else {
    id v156 = 0LL;
  }
  __int128 v232 = 0u;
  __int128 v233 = 0u;
  __int128 v230 = 0u;
  __int128 v231 = 0u;
  uint64_t v157 = [v155 countByEnumeratingWithState:&v230 objects:&v251 count:16];
  if (v157)
  {
    uint64_t v158 = *(void *)v231;
    BOOL v160 = (CFArrayRef)v106 == theArraya || theArraya == 0LL;
    do
    {
      for (uint64_t i4 = 0LL; i4 != v157; ++i4)
      {
        if (*(void *)v231 != v158) {
          objc_enumerationMutation(v155);
        }
        id v162 = *(void **)(*((void *)&v230 + 1) + 8 * i4);
        id v163 = (void *)[v162 objectID];
        if (v160) {
          -[NSPersistentStoreCache registerRow:forObjectID:options:](v106, (unsigned int *)v162, v163, 4);
        }
        else {
          -[NSPersistentStoreCache forgetRowForObjectID:](v106, v163);
        }
        objc_msgSend(v156, "addObject:", objc_msgSend(v162, "objectID"));
      }

      uint64_t v157 = [v155 countByEnumeratingWithState:&v230 objects:&v251 count:16];
    }

    while (v157);
  }

  if (v156)
  {
    if (v104 && (v164 = v104->super._affectedStores) != 0LL) {
      Class v165 = v164[4].super.isa;
    }
    else {
      Class v165 = 0LL;
    }
    -[NSManagedObjectContext _persistentStoreDidUpdateAdditionalRows:](v165, v156);
  }

  v166 = self->_fetchRequest;
  if (v166)
  {
    unint64_t fetchLimit = v166->_fetchLimit;
    unint64_t allocationSize = v166->_allocationSize;
  }

  else
  {
    unint64_t fetchLimit = 0LL;
    unint64_t allocationSize = 0LL;
  }

  if (fetchLimit | allocationSize)
  {
    id v169 = objc_alloc_init(MEMORY[0x189603FC8]);
    v170 = v169;
    if (fetchLimit) {
      [v169 setObject:fetchLimit forKey:@"addedOrUpdated"];
    }
    if (allocationSize) {
      [v170 setObject:allocationSize forKey:@"deleted"];
    }
    uint64_t v171 = [MEMORY[0x189607950] notificationWithName:@"NSPersistentStoreOrderKeyUpdateNotification" object:self->super._sqlCore userInfo:v170];

    objc_msgSend((id)objc_msgSend(MEMORY[0x189607958], "defaultCenter"), "postNotification:", v171);
  }

  -[NSSQLiteConnection _performPostSaveTasks:andForceFullVacuum:]( (uint64_t)self->super._connection,  -[NSPersistentStoreRequest _secureOperation]( -[NSSQLStoreRequestContext persistentStoreRequest](self, "persistentStoreRequest"),  "_secureOperation"),  0);
  int v172 = v204;
  if (v204)
  {
    id v173 = self->super._sqlCore;
    if (v173) {
      -[_PFMutex unlock](v173->_writerSerializationMutex, "unlock");
    }
    int v172 = 0;
  }

  if (fetchRequest)
  {
    id v174 = *(void **)&fetchRequest->_flags;
    if (v174) {
      _deleteExternalDataReferences(v174);
    }
    uint64_t v175 = fetchRequest[1].super._affectedStores;
    if (v175) {
      _deleteFileBackedFutures(v175);
    }
  }

  -[NSSQLCore _postChangeNotificationWithTransactionID:]((uint64_t)self->super._sqlCore, objb);
  if (v172)
  {
    uint64_t v176 = self->super._sqlCore;
    if (v176) {
      -[_PFMutex unlock](v176->_writerSerializationMutex, "unlock");
    }
  }

  uint64_t v177 = (uint64_t)self->super._connection;
  -[NSSQLiteConnection endFetchAndRecycleStatement:](v177, 0);
  if (v202) {
    -[NSSQLiteConnection setSecureDeleteMode:](v177, 0);
  }
  -[NSSQLiteConnection _clearSaveGeneratedCachedStatements](v177);
  if (v177)
  {

    *(void *)(v177 + 192) = 0LL;
  }

  [v201 drain];
}

void sub_1868B77D0(uint64_t a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x1868B74D8LL);
  }

  JUMPOUT(0x1868B7484LL);
}

void *stripEmptyStringsFromArray(void *a1)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  uint64_t v2 = (void *)[MEMORY[0x189603FA8] array];
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  uint64_t v3 = [a1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0LL; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(a1);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([v7 length]) {
          [v2 addObject:v7];
        }
      }

      uint64_t v4 = [a1 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v4);
  }

  return v2;
}

id _newObjectIDSetsForRequest(void *a1, void *a2, uint64_t a3)
{
  uint64_t v76 = *MEMORY[0x1895F89C0];
  if (a1) {
    uint64_t v6 = a1[3];
  }
  else {
    uint64_t v6 = 0LL;
  }
  uint64_t v71 = v6;
  uint64_t v7 = (void *)[a1 fetchStatement];
  uint64_t v72 = a3;
  uint64_t v62 = a1;
  uint64_t v65 = [v7 entity];
  if (a1) {
    uint64_t v61 = a1[14];
  }
  else {
    uint64_t v61 = 0LL;
  }
  uint64_t v8 = (void *)[a2 sortedArrayUsingFunction:compareObjectIDsByPKs context:0];
  __int128 v9 = _rawSQLForToManyFaultStatement(v7, 1, 1);
  __int128 v10 = (void *)[MEMORY[0x189607940] string];
  uint64_t v11 = [v9 rangeOfString:@" FROM " options:6];
  uint64_t v12 = [v9 rangeOfString:@" WHERE " options:6];
  id v70 = v13;
  uint64_t v14 = stripEmptyStringsFromArray((void *)objc_msgSend( (id)objc_msgSend(v9, "substringToIndex:", v11),  "componentsSeparatedByString:",  @" "));
  uint64_t v15 = stripEmptyStringsFromArray((void *)objc_msgSend( (id)objc_msgSend(v9, "substringFromIndex:", v12),  "componentsSeparatedByString:",  @" "));
  uint64_t v16 = (void *)objc_msgSend( (id)objc_msgSend(v15, "objectAtIndex:", 1),  "stringByReplacingOccurrencesOfString:withString:",  @"("),  &stru_189EAC2E8;
  unint64_t v17 = [v14 count];
  objc_msgSend(v10, "appendString:", objc_msgSend(v14, "objectAtIndex:", 0));
  [v10 appendFormat:@" %@, %@", objc_msgSend( (id)objc_msgSend(v14, "objectAtIndex:", 1), "stringByReplacingOccurrencesOfString:withString:", @",", &stru_189EAC2E8), v16];
  if (v17 >= 3) {
    [v10 appendFormat:@", %@", objc_msgSend(v14, "objectAtIndex:", 2)];
  }
  uint64_t v18 = v72;
  if (v72) {
    [v10 appendFormat:@", %@.%@", objc_msgSend((id)objc_msgSend(v16, "componentsSeparatedByString:", @"."), "objectAtIndex:", 0), v72];
  }
  objc_msgSend(v10, "appendString:", objc_msgSend(v9, "substringWithRange:", v11, &v70[v12 - v11]));
  objc_msgSend(v10, "appendFormat:", @"%@ IN("), v16;
  uint64_t v19 = [v8 count];
  uint64_t v20 = v19 - 1;
  if (v19 != 1)
  {
    uint64_t v21 = 0LL;
    do
      objc_msgSend( v10,  "appendFormat:",  @"%qu, ",  objc_msgSend((id)objc_msgSend(v8, "objectAtIndex:", v21++), "_referenceData64"));
    while (v20 != v21);
  }

  [v10 appendFormat:@"%qu "],  objc_msgSend((id)objc_msgSend(v8, "objectAtIndex:", v20), "_referenceData64"));
  unint64_t v22 = [v15 count];
  if (v22 >= 5)
  {
    unint64_t v23 = v22;
    [v10 appendString:@"AND "];
    if (v23 >= 6)
    {
      for (uint64_t i = 5LL; i != v23; ++i)
      {
        objc_msgSend(v10, "appendString:", objc_msgSend(v15, "objectAtIndex:", i));
        [v10 appendString:@" "];
      }
    }
  }

  uint64_t v25 = -[NSSQLiteConnection copyRawIntegerRowsForSQL:](v71, v10);
  uint64_t v26 = v65;
  -[NSSQLiteConnection endFetchAndRecycleStatement:](v71, 0);
  if (v65)
  {
    CFIndex v27 = *(void **)(v65 + 152);
    unsigned int v28 = 2;
    if (v27)
    {
      uint64_t v29 = [v27 count];
      BOOL v30 = v29 != 0;
      if (v29) {
        unsigned int v28 = 3;
      }
      else {
        unsigned int v28 = 2;
      }
    }

    else
    {
      BOOL v30 = 0;
    }
  }

  else
  {
    BOOL v30 = 0;
    unsigned int v28 = 2;
  }

  BOOL v73 = v30;
  BOOL v74 = v72 != 0;
  char v75 = v28;
  if (v25)
  {
    unint64_t Count = CFArrayGetCount(v25);
    if (Count < 2)
    {
      id v67 = (id)NSArray_EmptyArray;
LABEL_66:
      CFRelease(v25);
      return v67;
    }

    BOOL v66 = v30;
    v58[1] = v58;
    unint64_t v32 = MEMORY[0x1895F8858](Count);
    uint64_t v35 = (char *)v58 - v33;
    unint64_t v59 = v32;
    CFArrayRef v60 = v25;
    CFIndex v69 = v34;
    if (v32 >= 0x202)
    {
      uint64_t v36 = (void *)NSAllocateScannedUncollectable();
    }

    else
    {
      bzero((char *)v58 - v33, 8 * v34);
      uint64_t v36 = v35;
    }

    BOOL v37 = v18 != 0;
    v77.locatiouint64_t n = 1LL;
    v77.length = v69;
    uint64_t v68 = v36;
    CFArrayGetValues(v60, v77, (const void **)v36);
    CFMergeSortArray();
    id v38 = objc_alloc(MEMORY[0x189603FA8]);
    uint64_t v39 = [v8 count];
    uint64_t v40 = 2LL;
    if (v18) {
      uint64_t v40 = 3LL;
    }
    id v67 = (id)[v38 initWithCapacity:v39 * v40];
    id v41 = objc_alloc_init(MEMORY[0x189603FA8]);
    if (v37) {
      id v70 = (char *)objc_alloc_init(MEMORY[0x189603FA8]);
    }
    else {
      id v70 = 0LL;
    }
    if (v62)
    {
      uint64_t v42 = (objc_class *)[(id)v62[1] objectIDFactoryForSQLEntity:v26];
      if (v26)
      {
LABEL_38:
        uint64_t v64 = *(unsigned int *)(v26 + 184);
        goto LABEL_39;
      }
    }

    else
    {
      uint64_t v42 = 0LL;
      if (v26) {
        goto LABEL_38;
      }
    }

    uint64_t v64 = 0LL;
LABEL_39:
    uint64_t v65 = 0LL;
    uint64_t v43 = 0LL;
    uint64_t v44 = 0LL;
    uint64_t v71 = 0LL;
    uint64_t v45 = -1LL;
    uint64_t v63 = 8LL * v28;
    do
    {
      uint64_t v46 = (void *)v68[v44];
      if (v66)
      {
        uint64_t v47 = v46[2];
        if (v64 != v47)
        {
          BOOL v48 = v62 == 0LL;
          uint64_t v49 = _sqlEntityForEntityID(v61, v46[2]);
          if (v48) {
            uint64_t v42 = 0LL;
          }
          else {
            uint64_t v42 = (objc_class *)[(id)v62[1] objectIDFactoryForSQLEntity:v49];
          }
          uint64_t v64 = v47;
        }
      }

      uint64_t v50 = (void *)[[v42 alloc] initWithPK64:*v46];
      uint64_t v51 = v46[1];
      uint64_t v52 = v45;
      if (v51 != v71)
      {
        uint64_t v52 = v45;
        do
          uint64_t v43 = (void *)[v8 objectAtIndex:++v52];
        while (v51 != [v43 _referenceData64]);
        uint64_t v71 = v51;
      }

      if (v45 != v52)
      {
        if ([v41 count])
        {
          BOOL v53 = v72 != 0;
          [v67 addObject:v65];
          [v67 addObject:v41];
          if (v53)
          {
            [v67 addObject:v70];

            id v70 = (char *)objc_alloc_init(MEMORY[0x189603FA8]);
          }

          id v41 = objc_alloc_init(MEMORY[0x189603FA8]);
        }

        uint64_t v65 = (uint64_t)v43;
      }

      BOOL v54 = v72 != 0;
      [v41 addObject:v50];
      if (v54)
      {
        uint64_t v55 = [MEMORY[0x189607968] numberWithUnsignedInteger:LODWORD(v46[(unint64_t)v63 / 8])];
        [v70 addObject:v55];
      }

      ++v44;
      uint64_t v45 = v52;
    }

    while (v44 != v69);
    if ([v41 count])
    {
      BOOL v56 = v72 != 0;
      [v67 addObject:v65];
      [v67 addObject:v41];

      if (v56)
      {
        [v67 addObject:v70];
      }
    }

    if (v59 >= 0x202) {
      NSZoneFree(0LL, v68);
    }
    uint64_t v25 = v60;
    goto LABEL_66;
  }

  return 0LL;
}

void sub_1868B8134(uint64_t a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x1868B810CLL);
  }

  JUMPOUT(0x1868B8148LL);
}

uint64_t compareObjectIDsByPKs(void *a1, void *a2)
{
  uint64_t v3 = [a1 _referenceData64];
  uint64_t v4 = [a2 _referenceData64];
  uint64_t v5 = -1LL;
  if (v3 >= v4) {
    uint64_t v5 = 1LL;
  }
  if (v3 == v4) {
    return 0LL;
  }
  else {
    return v5;
  }
}

uint64_t sortRawRowsForPrefetching(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(*(void *)a1 + 8LL);
  uint64_t v4 = *(void *)(*(void *)a2 + 8LL);
  if (v3 > v4) {
    return 1LL;
  }
  if (v3 < v4) {
    return -1LL;
  }
  if (!*(_BYTE *)(a3 + 1)) {
    return 0LL;
  }
  uint64_t v6 = *(unsigned __int8 *)(a3 + 2);
  uint64_t v7 = *(void *)(*(void *)a1 + 8 * v6);
  uint64_t v8 = *(void *)(*(void *)a2 + 8 * v6);
  if (v7 > v8) {
    return 1LL;
  }
  if (v7 >= v8) {
    return 0LL;
  }
  else {
    return -1LL;
  }
}

id _prefetchForFetchRequest(void *a1, void *a2, void *a3)
{
  uint64_t v322 = *MEMORY[0x1895F89C0];
  id result = (id)[a1 count];
  if (result)
  {
    uint64_t v6 = (void *)[a3 request];
    id result = (id)[v6 relationshipKeyPathsForPrefetching];
    if (a2
      || (id v203 = result) != 0LL
      && (id result = (id)[result count]) != 0
      && (id result = +[_PFRoutines _coalescedPrefetchKeypaths:]((uint64_t)&OBJC_CLASS____PFRoutines, v203),
          (a2 = result) != 0LL))
    {
      uint64_t v253 = (uint64_t)a3;
      id v204 = objc_alloc_init(MEMORY[0x1896077E8]);
      __int128 v214 = (void *)[v6 entity];
      __int128 v277 = 0u;
      __int128 v278 = 0u;
      __int128 v279 = 0u;
      __int128 v280 = 0u;
      obuint64_t j = a2;
      uint64_t v207 = [a2 countByEnumeratingWithState:&v277 objects:v308 count:16];
      if (!v207) {
        return (id)[v204 drain];
      }
      uint64_t v205 = *(void *)v278;
LABEL_5:
      uint64_t v209 = 0LL;
      while (1)
      {
        if (*(void *)v278 != v205) {
          objc_enumerationMutation(obj);
        }
        uint64_t v219 = *(void *)(*((void *)&v277 + 1) + 8 * v209);
        __int128 v206 = (void *)MEMORY[0x186E3E5D8]();
        uint64_t v7 = (void *)[obj objectForKey:v219];
        uint64_t v8 = [v7 count] ? v7 : 0;
        id v210 = v8;
        id v220 = (id)[MEMORY[0x189603FC8] dictionary];
        if (objc_msgSend((id)objc_msgSend(v214, "relationshipsByName"), "objectForKey:", v219)) {
          break;
        }
        if (objc_msgSend((id)objc_msgSend(v214, "subentitiesByName"), "count"))
        {
          id v255 = (id)objc_msgSend((id)objc_msgSend(v214, "subentities"), "mutableCopy");
          id v258 = (id)[MEMORY[0x189603FA8] array];
          while ([v255 count])
          {
            __int128 v9 = (void *)[v255 objectAtIndex:0];
            [v255 removeObjectAtIndex:0];
            if (objc_msgSend((id)objc_msgSend(v9, "relationshipsByName"), "objectForKey:", v219))
            {
              [v258 addObject:v9];
            }

            else if (objc_msgSend((id)objc_msgSend(v9, "subentitiesByName"), "count"))
            {
              objc_msgSend(v255, "addObjectsFromArray:", objc_msgSend(v9, "subentities"));
            }
          }

          if ([v258 count])
          {
            __int128 v275 = 0u;
            __int128 v276 = 0u;
            __int128 v273 = 0u;
            __int128 v274 = 0u;
            uint64_t v263 = [v258 countByEnumeratingWithState:&v273 objects:v307 count:16];
            if (v263)
            {
              __int128 v10 = 0LL;
              uint64_t v260 = *(void *)v274;
              do
              {
                for (uint64_t i = 0LL; i != v263; ++i)
                {
                  if (*(void *)v274 != v260) {
                    objc_enumerationMutation(v258);
                  }
                  uint64_t v12 = *(void **)(*((void *)&v273 + 1) + 8 * i);
                  id v13 = objc_alloc_init(MEMORY[0x189603FA8]);
                  __int128 v271 = 0u;
                  __int128 v272 = 0u;
                  __int128 v269 = 0u;
                  __int128 v270 = 0u;
                  uint64_t v14 = [a1 countByEnumeratingWithState:&v269 objects:v306 count:16];
                  if (v14)
                  {
                    uint64_t v15 = *(void *)v270;
                    do
                    {
                      for (uint64_t j = 0LL; j != v14; ++j)
                      {
                        if (*(void *)v270 != v15) {
                          objc_enumerationMutation(a1);
                        }
                        unint64_t v17 = *(void **)(*((void *)&v269 + 1) + 8 * j);
                        uint64_t v18 = (void *)[v17 entity];
                        uint64_t v19 = v18;
                        BOOL v20 = v18 == v12 || v18 == v10;
                        if (v20 || [v18 isKindOfEntity:v12])
                        {
                          [v13 addObject:v17];
                          if (v19 != v12) {
                            __int128 v10 = v19;
                          }
                        }
                      }

                      uint64_t v14 = [a1 countByEnumeratingWithState:&v269 objects:v306 count:16];
                    }

                    while (v14);
                  }

                  if ([v13 count]) {
                    objc_msgSend(v220, "setObject:forKey:", v13, objc_msgSend(v12, "name"));
                  }
                }

                uint64_t v263 = [v258 countByEnumeratingWithState:&v273 objects:v307 count:16];
              }

              while (v263);
            }
          }

LABEL_45:
          if ([v220 count])
          {
            __int128 v267 = 0u;
            __int128 v268 = 0u;
            __int128 v265 = 0u;
            __int128 v266 = 0u;
            uint64_t v213 = [v220 countByEnumeratingWithState:&v265 objects:v305 count:16];
            if (v213)
            {
              uint64_t v211 = *(void *)v266;
              do
              {
                uint64_t v223 = 0LL;
                do
                {
                  if (*(void *)v266 != v211) {
                    objc_enumerationMutation(v220);
                  }
                  uint64_t v21 = *(void *)(*((void *)&v265 + 1) + 8 * v223);
                  __int128 v237 = (void *)objc_msgSend( (id)objc_msgSend((id)objc_msgSend(v214, "managedObjectModel"), "entitiesByName"),  "objectForKey:",  v21);
                  id v247 = (id)[v220 objectForKey:v21];
                  if (v253)
                  {
                    unint64_t v22 = *(void **)(v253 + 32);
                    unint64_t v23 = *(void **)(v253 + 8);
                  }

                  else
                  {
                    unint64_t v22 = 0LL;
                    unint64_t v23 = 0LL;
                  }

                  __int128 v233 = (id *)_sqlCoreLookupSQLEntityForEntityDescription(v23, v237);
                  if (!v233) {
                    goto LABEL_357;
                  }
                  __int128 v256 = (unsigned __int8 *)[v233[5] objectForKey:v219];
                  if (!v256) {
                    goto LABEL_357;
                  }
                  if (v253) {
                    id v259 = *(id *)(v253 + 128);
                  }
                  else {
                    id v259 = 0LL;
                  }
                  id v261 = -[NSEntityDescription _relationshipNamed:](v237, v219);
                  int v231 = [v256 isToMany];
                  int v254 = [v261 isOrdered];
                  uint64_t v229 = *((void *)v256 + 7);
                  if (objc_msgSend((id)objc_msgSend((id)v253, "request"), "resultType")) {
                    int v264 = 0;
                  }
                  else {
                    int v264 = objc_msgSend((id)objc_msgSend((id)v253, "request"), "returnsObjectsAsFaults") ^ 1;
                  }
                  int v212 = *(_DWORD *)(*(void *)(v253 + 136) + 72LL);
                  __int128 v226 = (void *)[MEMORY[0x189603FE0] set];
                  if (![v261 inverseRelationship]
                    && [v261 isToMany]
                    && (objc_msgSend((id)objc_msgSend(v233, "entityDescription"), "superentity")
                     || objc_msgSend( (id)objc_msgSend((id)objc_msgSend(v233, "entityDescription"), "subentities"),  "count")))
                  {
                    id v247 = (id)[v247 sortedArrayUsingComparator:&__block_literal_global_234];
                    int v217 = 1;
                  }

                  else
                  {
                    int v217 = 0;
                  }

                  double Current = CFAbsoluteTimeGetCurrent();
                  if ((v231 & 1) != 0 || v256[24] == 9) {
                    [v226 addObjectsFromArray:v247];
                  }
                  if (v229 && *(_BYTE *)(v229 + 24) == 7)
                  {
                    unsigned int v221 = objc_msgSend((id)objc_msgSend((id)v229, "foreignKey"), "slot");
                    if ((v231 & v254) == 1) {
                      unsigned int v227 = [*(id *)(v229 + 80) slot];
                    }
                    else {
                      unsigned int v227 = -1;
                    }
                    uint64_t v216 = [(id)v253 inverseIsToOnePrefetchRequestForRelationshipNamed:v219 onEntity:v237];
                    *(void *)&__int128 v318 = @"destinations";
                    v317[0] = [MEMORY[0x189607878] expressionForConstantValue:v247];
                    CFIndex v34 = (void *)[MEMORY[0x189603F68] dictionaryWithObjects:v317 forKeys:&v318 count:1];
                    goto LABEL_132;
                  }

                  int v25 = v256[24];
                  if (v25 != 7)
                  {
                    if (v25 != 9) {
                      goto LABEL_357;
                    }
                    uint64_t v26 = [v247 objectAtIndex:0];
                    CFIndex v27 = (void *)objc_msgSend( objc_alloc(MEMORY[0x1896078E8]),  "initWithObject:",  objc_msgSend(*((id *)v256 + 7), "name"));
                    unsigned int v28 = (void *)[objc_alloc(MEMORY[0x1896078E0]) initWithKeyPath:v27];

                    uint64_t v29 = (void *)[objc_alloc(MEMORY[0x189607830]) initWithObject:v26];
                    BOOL v30 = (void *)[objc_alloc(MEMORY[0x189607818]) initWithLeftExpression:v29 rightExpression:v28 modifier:0 type:10 options:0];

                    uint64_t v31 = objc_alloc_init(&OBJC_CLASS___NSFetchRequest);
                    -[NSFetchRequest setEntity:]( v31,  "setEntity:",  objc_msgSend((id)objc_msgSend(v256, "destinationEntity"), "entityDescription"));
                    -[NSFetchRequest setPredicate:](v31, "setPredicate:", v30);

                    unint64_t v32 = v31;
                    if (v254)
                    {
                      else {
                        uint64_t v33 = -[NSSQLManyToMany inverseOrderColumnName]((__CFString *)v256);
                      }
                    }

                    else
                    {
                      uint64_t v33 = 0LL;
                    }

                    uint64_t v51 = (void *)[(id)v253 createChildContextForNestedFetchRequest:v31];
                    -[NSSQLStoreRequestContext setConnection:]((uint64_t)v51, *(void **)(v253 + 24));
                    id v251 = _newObjectIDSetsForRequest(v51, v247, (uint64_t)v33);
                    -[NSSQLStoreRequestContext setConnection:]((uint64_t)v51, 0LL);

                    if ((int)-[NSSQLStoreRequestContext debugLogLevel](v253) < 2)
                    {
                      if ((int)-[NSSQLStoreRequestContext debugLogLevel](v253) >= 1)
                      {
                        uint64_t v59 = [v256 name];
                        [v251 count];
                        _NSCoreDataLog( 4LL,  (uint64_t)@"Prefetching from join table for many-to-many relationship %@ from database.  Got %lu rows",  v60,  v61,  v62,  v63,  v64,  v65,  v59);
                      }
                    }

                    else
                    {
                      uint64_t v52 = [v256 name];
                      [v251 count];
                      _NSCoreDataLog( 4LL,  (uint64_t)@"Prefetching from join table for many-to-many relationship %@ from database.  Got %lu rows with values: %@",  v53,  v54,  v55,  v56,  v57,  v58,  v52);
                    }

                    __int128 v239 = (char *)[v251 count];
                    v243 = (void *)[objc_alloc(MEMORY[0x189603FE0]) initWithCapacity:v239 + 256];
                    double Current = CFAbsoluteTimeGetCurrent();
                    if (v239)
                    {
                      uint64_t v66 = 0LL;
                      do
                      {
                        context = (void *)MEMORY[0x186E3E5D8]();
                        id v67 = (void *)[v251 objectAtIndex:v66];
                        uint64_t v68 = v66 + 1;
                        CFIndex v69 = (void *)[v251 objectAtIndex:v66 + 1];
                        id v70 = v69;
                        if (v254)
                        {
                          uint64_t v68 = v66 + 2;
                          uint64_t v71 = (void *)[v251 objectAtIndex:v66 + 2];
                        }

                        else
                        {
                          uint64_t v71 = 0LL;
                        }

                        uint64_t v72 = [(id)v253 rowCache];
                        if (v72) {
                          -[NSPersistentStoreCache registerToMany:withOrderKeys:forSourceObjectID:forProperty:options:andTimestamp:]( v72,  v70,  v71,  v67,  v261,  Current);
                        }
                        [v226 removeObject:v67];
                        if (v22) {
                          BOOL v73 = (unsigned int *)_PFRetainedObjectIDCore((uint64_t)v22, v67, 0LL, 1);
                        }
                        else {
                          BOOL v73 = 0LL;
                        }
                        BOOL v74 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603FA8]),  "initWithCapacity:",  objc_msgSend(v70, "count"));
                        __int128 v320 = 0u;
                        __int128 v321 = 0u;
                        __int128 v318 = 0u;
                        __int128 v319 = 0u;
                        uint64_t v75 = [v70 countByEnumeratingWithState:&v318 objects:v317 count:16];
                        if (v75)
                        {
                          uint64_t v76 = *(void *)v319;
                          do
                          {
                            uint64_t v77 = 0LL;
                            do
                            {
                              if (*(void *)v319 != v76) {
                                objc_enumerationMutation(v70);
                              }
                              if (v22) {
                                id v78 = _PFRetainedObjectIDCore( (uint64_t)v22,  *(void **)(*((void *)&v318 + 1) + 8 * v77),  0LL,  1);
                              }
                              else {
                                id v78 = 0LL;
                              }
                              [v74 addObject:v78];

                              ++v77;
                            }

                            while (v75 != v77);
                            uint64_t v79 = [v70 countByEnumeratingWithState:&v318 objects:v317 count:16];
                            uint64_t v75 = v79;
                          }

                          while (v79);
                        }

                        Class v80 = off_189EA56C0;
                        if (!v254) {
                          Class v80 = off_189EA56C8;
                        }
                        uint64_t v81 = (void *)[objc_alloc(*v80) initWithSource:v73 destinations:v74 forRelationship:v261 inContext:v22];
                        _PFFaultHandlerPreconnectRelationship((int)v259, v73, v261, v81);

                        [v243 addObjectsFromArray:v69];
                        objc_autoreleasePoolPop(context);
                        uint64_t v66 = v68 + 1;
                      }

                      while (v68 + 1 < (unint64_t)v239);
                    }

                    if (![v243 count])
                    {
LABEL_359:

                      goto LABEL_357;
                    }

                    uint64_t v216 = [(id)v253 manyToManyPrefetchRequestsForRelationshipNamed:v219 onEntity:v237];
                    v315 = @"mtmObjects";
                    uint64_t v316 = [MEMORY[0x189607878] expressionForConstantValue:v243];
                    CFIndex v34 = (void *)[MEMORY[0x189603F68] dictionaryWithObjects:&v316 forKeys:&v315 count:1];

                    goto LABEL_131;
                  }

                  uint64_t v35 = [v247 count];
                  v243 = (void *)[objc_alloc(MEMORY[0x189603FE0]) initWithCapacity:v35];
                  unsigned int v36 = [v256 slot];
                  if (v35)
                  {
                    uint64_t v37 = 0LL;
                    unint64_t v38 = (unint64_t)v233[24] + v36;
                    while (1)
                    {
                      uint64_t v39 = (void *)MEMORY[0x186E3E5D8]();
                      uint64_t v40 = (void *)[v247 objectAtIndex:v37];
                      id v41 = (void *)[v40 entity];
                      unint64_t v42 = v38;
                      if (v41 != v237) {
                        unint64_t v42 = [v41 _offsetRelationshipIndex:v38 fromSuperEntity:v237 andIsToMany:0];
                      }
                      uint64_t v43 = (os_unfair_lock_s *)[(id)v253 rowCache];
                      if (!v43) {
                        break;
                      }
                      uint64_t v44 = -[NSPersistentStoreCache rowForObjectID:afterTimestamp:]( v43,  v40,  *(double *)&NSSQLDistantPastTimeInterval);
                      uint64_t v45 = v44;
                      if (!v44) {
                        break;
                      }
                      -[os_unfair_lock_s knownKeyValuesPointer](v44, "knownKeyValuesPointer");
                      uint64_t v46 = (char *)-[os_unfair_lock_s _snapshot](v45, "_snapshot");
                      Class Class = object_getClass(v46);
LABEL_95:
                      objc_autoreleasePoolPop(v39);
                      if (v35 == ++v37) {
                        goto LABEL_96;
                      }
                    }

                    if ((*(_DWORD *)(*(void *)(v253 + 136) + 72LL) & 0x1C) != 0x14) {
                      goto LABEL_95;
                    }
                    BOOL v48 = (unsigned int *)[*(id *)(v253 + 32) objectRegisteredForID:v40];
                    if (!v48) {
                      goto LABEL_95;
                    }
                    v317[0] = 0LL;
                    int v49 = _PF_InternalToOneRelationshipForeignKeyCache(v48, v42, v317);
                    int v50 = v317[0] ? v49 : 0;
                    if (v50 != 1) {
                      goto LABEL_95;
                    }
LABEL_94:
                    objc_msgSend(v243, "addObject:");
                    goto LABEL_95;
                  }

LABEL_284:
                      objc_autoreleasePoolPop(v234);
                      break;
                    }

                    if (v145)
                    {
                      if (v217)
                      {
                        do
                        {
                          Class v165 = (void *)[v247 objectAtIndex:v245];
                          if ([v165 _referenceData64] == v145)
                          {
                            id v166 = v165;
                          }

                          else
                          {
                            id v166 = 0LL;
                            ++v245;
                          }
                        }

                        while (!v166);
                      }

                      else
                      {
                        id v166 = (id)[v146 newObjectIDForToOne:v229];
                      }

                      __int128 v246 = v166;
                      uint64_t v167 = [(id)v253 rowCache];
                      if (v167) {
                        -[NSPersistentStoreCache registerToMany:withOrderKeys:forSourceObjectID:forProperty:options:andTimestamp:]( v167,  v257,  v224,  v246,  v261,  Current);
                      }
                      [v226 removeObject:v246];
                      if (v22) {
                        uint64_t v242 = (unsigned int *)_PFRetainedObjectIDCore((uint64_t)v22, v246, 0LL, 1);
                      }
                      else {
                        uint64_t v242 = 0LL;
                      }
                      id v168 = objc_alloc_init(MEMORY[0x189603FA8]);
                      id v169 = objc_alloc_init(MEMORY[0x189603FA8]);
                      id v170 = objc_alloc_init(MEMORY[0x189603FA8]);
                      __int128 v287 = 0u;
                      __int128 v288 = 0u;
                      __int128 v285 = 0u;
                      __int128 v286 = 0u;
                      uint64_t v171 = [v257 countByEnumeratingWithState:&v285 objects:v310 count:16];
                      if (v171)
                      {
                        uint64_t v172 = *(void *)v286;
                        do
                        {
                          uint64_t v173 = 0LL;
                          do
                          {
                            if (*(void *)v286 != v172) {
                              objc_enumerationMutation(v257);
                            }
                            id v174 = *(void **)(*((void *)&v285 + 1) + 8 * v173);
                            uint64_t v176 = (void *)MEMORY[0x186E3E5D8]();
                            if (v22) {
                              uint64_t v177 = _PFRetainedObjectIDCore((uint64_t)v22, v174, 0LL, 1);
                            }
                            else {
                              uint64_t v177 = 0LL;
                            }
                            if (v264)
                            {
                              if ([v177 isFault])
                              {
                                uint64_t v175 = (void *)[contextb objectForKey:v174];
                                if (v175)
                                {
                                  _PFFaultHandlerFulfillFault((uint64_t)v259, (uint64_t)v177, (uint64_t)v22, v175, 0);
                                  [v170 addObject:v177];
                                }
                              }
                            }

                            if (v177)
                            {
                              int v178 = v177[4];
                              if ((v178 & 0x200) != 0) {
                                goto LABEL_315;
                              }
                              v177[4] = v178 | 0x200;
                            }

                            objc_msgSend(v169, "addObject:", v174, v175);
LABEL_315:
                            objc_msgSend(v168, "addObject:", v177, v175);

                            objc_autoreleasePoolPop(v176);
                            ++v173;
                          }

                          while (v171 != v173);
                          uint64_t v179 = [v257 countByEnumeratingWithState:&v285 objects:v310 count:16];
                          uint64_t v171 = v179;
                        }

                        while (v179);
                      }

                      -[NSSQLFetchRequestContext addObjectIDsToRegister:](v253, (uint64_t)v169);
                      -[NSSQLFetchRequestContext addObjectsToAwaken:](v253, (uint64_t)v170);

                      uint64_t v180 = off_189EA56C0;
                      if (!v254) {
                        uint64_t v180 = off_189EA56C8;
                      }
                      uint64_t v181 = (void *)[objc_alloc(*v180) initWithSource:v242 destinations:v168 forRelationship:v261 inContext:v22];

                      _PFFaultHandlerPreconnectRelationship((int)v259, v242, v261, v181);
                      [v218 addObject:v246];
                    }
                  }

                  if ([v226 count])
                  {
                    uint64_t v182 = (void *)[v226 allObjects];
                    uint64_t v183 = [v182 count];
                    if (v183)
                    {
                      for (uint64_t m = 0LL; m != v183; ++m)
                      {
                        uint64_t v185 = (void *)[v182 objectAtIndex:m];
                        uint64_t v186 = [(id)v253 rowCache];
                        if (v186)
                        {
                          if (v254) {
                            uint64_t v187 = (void *)NSArray_EmptyArray;
                          }
                          else {
                            uint64_t v187 = 0LL;
                          }
                          -[NSPersistentStoreCache registerToMany:withOrderKeys:forSourceObjectID:forProperty:options:andTimestamp:]( v186,  (void *)NSArray_EmptyArray,  v187,  v185,  v261,  Current);
                        }
                      }
                    }
                  }

                  if ([v218 count]) {
                    BOOL v188 = (v212 & 0x1C) != 20;
                  }
                  else {
                    BOOL v188 = 1;
                  }
                  if (!v188)
                  {
                    uint64_t v189 = (void *)[v247 arrayByExcludingObjectsInArray:v218];
                    __int128 v283 = 0u;
                    __int128 v284 = 0u;
                    __int128 v281 = 0u;
                    __int128 v282 = 0u;
                    uint64_t v190 = [v189 countByEnumeratingWithState:&v281 objects:v309 count:16];
                    if (v190)
                    {
                      uint64_t v191 = *(void *)v282;
                      do
                      {
                        uint64_t v192 = 0LL;
                        do
                        {
                          if (*(void *)v282 != v191) {
                            objc_enumerationMutation(v189);
                          }
                          if (v22) {
                            uint64_t v193 = (unsigned int *)_PFRetainedObjectIDCore( (uint64_t)v22,  *(void **)(*((void *)&v281 + 1) + 8 * v192),  0LL,  1);
                          }
                          else {
                            uint64_t v193 = 0LL;
                          }
                          id v194 = off_189EA56C0;
                          if (!v254) {
                            id v194 = off_189EA56C8;
                          }
                          id v195 = objc_alloc(*v194);
                          v196 = &NSOrderedSet_EmptyOrderedSet;
                          if (!v254) {
                            v196 = &NSSet_EmptySet;
                          }
                          id v197 = (void *)[v195 initWithSource:v193 destinations:*v196 forRelationship:v261 inContext:v22];
                          _PFFaultHandlerPreconnectRelationship((int)v259, v193, v261, v197);

                          ++v192;
                        }

                        while (v190 != v192);
                        uint64_t v198 = [v189 countByEnumeratingWithState:&v281 objects:v309 count:16];
                        uint64_t v190 = v198;
                      }

                      while (v198);
                    }
                  }

                  if (v224) {
                  uint64_t v199 = (id *)[(id)v253 createChildContextForNestedFetchRequest:v216];
                  }
                  -[NSSQLStoreRequestContext setConnection:]((uint64_t)v199, *(void **)(v253 + 24));
                  _prefetchForFetchRequest(v230, v210, v199);
                  if (v199) {
                    uint64_t v200 = [v199[19] allObjects];
                  }
                  else {
                    uint64_t v200 = 0LL;
                  }
                  -[NSSQLFetchRequestContext addObjectIDsToRegister:](v253, v200);
                  if (v199) {
                    uint64_t v201 = [v199[20] allObjects];
                  }
                  else {
                    uint64_t v201 = 0LL;
                  }
                  -[NSSQLFetchRequestContext addObjectsToAwaken:](v253, v201);
                  -[NSSQLStoreRequestContext setConnection:]((uint64_t)v199, 0LL);

LABEL_357:
                  ++v223;
                }

                while (v223 != v213);
                uint64_t v202 = [v220 countByEnumeratingWithState:&v265 objects:v305 count:16];
                uint64_t v213 = v202;
              }

              while (v202);
            }
          }
        }

        objc_autoreleasePoolPop(v206);
        if (++v209 == v207)
        {
          uint64_t v207 = [obj countByEnumeratingWithState:&v277 objects:v308 count:16];
          if (!v207) {
            return (id)[v204 drain];
          }
          goto LABEL_5;
        }
      }

      objc_msgSend(v220, "setObject:forKey:", a1, objc_msgSend(v214, "name"));
      goto LABEL_45;
    }
  }

  return result;
}

void sub_1868BA268(_Unwind_Exception *a1)
{
}

void sub_1868BA280(_Unwind_Exception *a1)
{
}

void sub_1868BA2A0(_Unwind_Exception *a1)
{
  if (v1) {
    JUMPOUT(0x1868BA2A8LL);
  }
  _Unwind_Resume(a1);
}

void sub_1868BA2B0(uint64_t a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  JUMPOUT(0x1868BA2BCLL);
}

uint64_t ___prefetchRelationshipKeys_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = [a2 _referenceData64];
  if (v4 < [a3 _referenceData64]) {
    return -1LL;
  }
  else {
    return 1LL;
  }
}

uint64_t _prepareLargeDictionaryResults(unsigned int *a1, uint64_t a2, int a3)
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *a1;
  uint64_t v8 = (void *)[*(id *)(*(void *)(a2 + 136) + 8) propertiesToFetch];
  int v34 = a3;
  if (![v8 count])
  {
    __int128 v9 = (void *)MEMORY[0x189603F18];
    uint64_t v10 = *(void *)(*(void *)(a2 + 136) + 40LL);
    uint64_t v11 = v10 ? *(void **)(v10 + 240) : 0LL;
    uint64_t v12 = [v11 keys];
    uint64_t v13 = *(void *)(*(void *)(a2 + 136) + 40LL);
    uint64_t v14 = v13 ? *(void **)(v13 + 240) : 0LL;
    uint64_t v15 = (void *)objc_msgSend(v9, "arrayWithObjects:count:", v12, objc_msgSend(v14, "length"));
    uint64_t v8 = (void *)objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", objc_msgSend(v15, "count"));
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v36;
      do
      {
        for (uint64_t i = 0LL; i != v17; ++i)
        {
          if (*(void *)v36 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*(void *)(a2 + 136) + 40LL);
          if (v20)
          {
            uint64_t v21 = (void *)[*(id *)(v20 + 40) objectForKey:*(void *)(*((void *)&v35 + 1) + 8 * i)];
            if (v21) {
              objc_msgSend(v8, "addObject:", objc_msgSend(v21, "propertyDescription"));
            }
          }
        }

        uint64_t v17 = [v15 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }

      while (v17);
    }
  }

  unint64_t v22 = [v8 count];
  unint64_t v23 = MEMORY[0x1895F8858](v22);
  uint64_t v26 = &v33[-v25];
  if (v23 > 0x200) {
    uint64_t v26 = (_BYTE *)NSAllocateScannedUncollectable();
  }
  else {
    bzero(&v33[-v25], 8 * v24);
  }
  if ([v8 count])
  {
    unint64_t v27 = 0LL;
    do
    {
      *(void *)&v26[8 * v27] = [v8 objectAtIndexedSubscript:v27];
      ++v27;
    }

    while ([v8 count] > v27);
  }

  unsigned int v28 = objc_alloc(&OBJC_CLASS___NSKnownKeysDictionary);
  uint64_t v29 = *(void *)(*(void *)(a2 + 136) + 40LL);
  if (v29) {
    uint64_t v30 = *(void *)(v29 + 240);
  }
  else {
    uint64_t v30 = 0LL;
  }
  uint64_t v31 = -[NSKnownKeysDictionary initWithSearchStrategy:](v28, "initWithSearchStrategy:", v30);
  -[NSKnownKeysDictionary setValues:](v31, "setValues:", v26);
  if (v22 >= 0x201) {
    NSZoneFree(0LL, v26);
  }
  if (v34) {
    bufferResultSetPack((uint64_t)a1);
  }
  uint64_t v4 = -[_PFResultArray initWithObjects:count:store:metadata:]( objc_alloc(&OBJC_CLASS____PFResultArray),  "initWithObjects:count:store:metadata:",  a1,  v3,  *(void *)(a2 + 8),  v31);

  return (uint64_t)v4;
}

uint64_t _prepareBufferedDictionaryResult(void *a1, uint64_t a2)
{
  uint64_t v54 = *MEMORY[0x1895F89C0];
  if (![a1 count]) {
    return NSArray_EmptyArray;
  }
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  uint64_t v4 = [a1 countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (!v4) {
    return NSArray_EmptyArray;
  }
  uint64_t v5 = v4;
  unsigned int v6 = 0;
  unsigned int v7 = 0;
  uint64_t v8 = *(void *)v49;
  unint64_t v9 = 0x18C68F000uLL;
  do
  {
    for (uint64_t i = 0LL; i != v5; ++i)
    {
      if (*(void *)v49 != v8) {
        objc_enumerationMutation(a1);
      }
      uint64_t v11 = *(void *)(*(void *)(*((void *)&v48 + 1) + 8 * i) + 24LL);
      uint64_t v12 = *(unsigned int *)(v11 + 32);
      if (!(_DWORD)v12) {
        goto LABEL_14;
      }
      uint64_t v13 = *(_DWORD ***)(v11 + 48);
      uint64_t v14 = *(unsigned int *)(v11 + 32);
      do
      {
        uint64_t v15 = *v13++;
        v7 += *v15;
        --v14;
      }

      while (v14);
      if (v11)
      {
        int v16 = 0;
        uint64_t v17 = *(uint64_t **)(v11 + 48);
        do
        {
          uint64_t v18 = *v17++;
          int v16 = v16 + *(_DWORD *)(v18 + 4) - 8;
          --v12;
        }

        while (v12);
      }

      else
      {
LABEL_14:
        int v16 = 0;
      }

      v6 += v16;
    }

    uint64_t v5 = [a1 countByEnumeratingWithState:&v48 objects:v53 count:16];
  }

  while (v5);
  if (!v7) {
    return NSArray_EmptyArray;
  }
  unint64_t v19 = v6 + 8LL + 4LL * v7;
  if (v19 <= 0x400) {
    unint64_t v19 = 1024LL;
  }
  uint64_t v39 = (v19 + 7) & 0xFFFFFFFF8LL;
  uint64_t v40 = a2;
  uint64_t v20 = PF_CALLOC_SCANNED_BYTES(v39);
  _DWORD *v20 = v7;
  v20[1] = v6 + 8;
  uint64_t v41 = (uint64_t)v20;
  obuint64_t j = a1;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  uint64_t v21 = [a1 countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    unint64_t v23 = (char *)(v41 + 8);
    uint64_t v24 = (_DWORD *)(v41 + v6 + 8);
    uint64_t v43 = *(void *)v45;
    do
    {
      uint64_t v25 = 0LL;
      do
      {
        if (*(void *)v45 != v43) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = *(void *)(*((void *)&v44 + 1) + 8 * v25);
        if (v26) {
          uint64_t v27 = *(void *)(v26 + *(int *)(v9 + 1256));
        }
        else {
          uint64_t v27 = 0LL;
        }
        unint64_t v28 = v9;
        if (*(_DWORD *)(v27 + 32))
        {
          unint64_t v29 = 0LL;
          do
          {
            uint64_t v30 = *(int **)(*(void *)(v27 + 48) + 8 * v29);
            int v31 = *v30;
            size_t v32 = (v30[1] - 8);
            uint64_t v33 = v30 + 2;
            memcpy(v23, v30 + 2, v32);
            if (v31 == 1)
            {
              *uint64_t v24 = v32;
              size_t v34 = 4LL;
            }

            else
            {
              __int128 v35 = (char *)v33 + v32;
              size_t v34 = (4 * v31);
              memcpy(v24, v35, v34);
            }

            v23 += v32;
            uint64_t v24 = (_DWORD *)((char *)v24 + v34);
            ++v29;
          }

          while (v29 < *(unsigned int *)(v27 + 32));
        }

        ++v25;
        unint64_t v9 = v28;
      }

      while (v25 != v22);
      uint64_t v36 = [obj countByEnumeratingWithState:&v44 objects:v52 count:16];
      uint64_t v22 = v36;
    }

    while (v36);
  }

  __int128 v37 = (unsigned int *)bufferResultSetAllocateWithBuffer(v39, v41);
  return _prepareLargeDictionaryResults(v37, v40, 0);
}

void setMultiColumnValueDictionary_0(char *a1, id *a2, uint64_t a3)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  uint64_t v6 = *(unsigned int *)a2;
  Class Class = object_getClass(a1);
  uint64_t v8 = *(NSKnownKeysDictionary **)&a1[*((unsigned int *)object_getIndexedIvars(Class) + v6 + 19)];
  unint64_t v9 = v8;
  uint64_t v10 = (__CFString *)[a2[2] propertyDescription];
  if (!v8)
  {
    uint64_t v11 = (void *)objc_msgSend((id)objc_msgSend(a2[2], "propertyDescription"), "superCompositeAttribute");
    uint64_t v20 = a3;
    if (v11)
    {
      do
      {
        uint64_t v12 = v11;
        uint64_t v11 = (void *)[v11 superCompositeAttribute];
      }

      while (v11);
    }

    else
    {
      uint64_t v12 = 0LL;
    }

    id v13 = -[NSKnownKeysMappingStrategy initForKeys:]( [NSKnownKeysMappingStrategy alloc],  "initForKeys:",  objc_msgSend((id)objc_msgSend(v12, "elements"), "valueForKeyPath:", @"name"));
    uint64_t v8 = -[NSKnownKeysDictionary initWithSearchStrategy:]( objc_alloc(&OBJC_CLASS___NSKnownKeysDictionary),  "initWithSearchStrategy:",  v13);

    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    uint64_t v14 = (void *)[v12 elements];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v22;
      do
      {
        uint64_t v18 = 0LL;
        do
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v14);
          }
          unint64_t v19 = *(__CFString **)(*((void *)&v21 + 1) + 8 * v18);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0) {
            _createKnownKeysDictionaryForMultiColumnValue(v19, v8);
          }
          ++v18;
        }

        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }

      while (v16);
    }

    a3 = v20;
  }

  -[NSKnownKeysDictionary setValue:forKeyPath:]( v8,  "setValue:forKeyPath:",  a3,  -[NSPropertyDescription _elementPath](v10));
  snapshot_set_object(a1, *(_DWORD *)a2, (uint64_t)v8);
}

id _rawRowDataForXPCRequest(uint64_t a1)
{
  v99[1] = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc_init(MEMORY[0x189603FB8]);
  if ([*(id *)(*(void *)(a1 + 136) + 8) allocationType] != 3
    && [*(id *)(*(void *)(a1 + 136) + 8) allocationType])
  {
    *(_DWORD *)(*(void *)(a1 + 136) + 72LL) |= 0x20u;
    uint64_t v3 = [(id)a1 request];
    if (*(void *)(a1 + 120))
    {
      uint64_t v4 = v3;
      uint64_t v5 = [(id)a1 fetchStatement];
      if (v5 && !*(_BYTE *)(v5 + 40))
      {
        uint64_t v60 = (void *)[(id)a1 fetchStatement];
        int v61 = *(unsigned __int8 *)(a1 + 202);
        uint64_t v62 = *(void *)(a1 + 136);
        uint64_t v63 = *(void **)(a1 + 24);
        if (+[NSSQLCore debugDefault](&OBJC_CLASS___NSSQLCore, "debugDefault") > 0
          || +[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault"))
        {
          double Current = CFAbsoluteTimeGetCurrent();
          int v65 = 1;
        }

        else
        {
          int v65 = 0;
          double Current = 0.0;
        }

        id v66 = objc_alloc_init(MEMORY[0x1896077E8]);
        if (v65)
        {
          uint64_t v67 = [v60 sqlString];
          _NSCoreDataLog(8LL, (uint64_t)@"sql connection fetch statement: '%@'", v68, v69, v70, v71, v72, v73, v67);
        }

        -[NSSQLiteConnection selectRowsWithStatement:cached:](v63, v60, v61 != 0);
        double v74 = CFAbsoluteTimeGetCurrent();
        uint64_t v93 = v66;
        Initialize = 0LL;
        unint64_t v76 = 0LL;
        if (v65) {
          double v77 = v74 - Current;
        }
        else {
          double v77 = 0.0;
        }
        do
        {
          if (!Initialize)
          {
            Initialize = (double *)bufferResultSetAllocateInitialize(v76, v62);
            Initialize[1] = v74;
            *(_DWORD *)Initialize = 0;
            *((_DWORD *)Initialize + 10) |= 2u;
          }

          *(_DWORD *)(v62 + 16) = 0x7FFFFFFF;
          double v78 = 0.0;
          if (v65) {
            double v78 = CFAbsoluteTimeGetCurrent();
          }
          -[NSSQLiteConnection fetchBufferResultSet:usingFetchPlan:]((uint64_t)v63, (uint64_t)Initialize, v62);
          uint64_t v79 = *((unsigned int *)Initialize + 8);
          if ((_DWORD)v79)
          {
            Class v80 = (unsigned int **)*((void *)Initialize + 6);
            unint64_t v76 = 80LL;
            do
            {
              uint64_t v81 = *v80++;
              v76 += v81[1] + 4LL * *v81;
              --v79;
            }

            while (v79);
          }

          else
          {
            unint64_t v76 = 80LL;
          }

          int v82 = *((_DWORD *)Initialize + 10);
          if (v65) {
            double v77 = v77 + CFAbsoluteTimeGetCurrent() - v78;
          }
        }

        while ((v82 & 1) == 0);
        -[NSSQLiteConnection endFetchAndRecycleStatement:]((uint64_t)v63, v61 != 0);
        uint64_t v83 = (void *)_prepareLargeDictionaryResults((unsigned int *)Initialize, a1, 1);
        v99[0] = v83;
        uint64_t v84 = _prepareBufferedDictionaryResult( (void *)[MEMORY[0x189603F18] arrayWithObjects:v99 count:1],  a1);

        uint64_t v12 = (void *)v84;
        if (v65) {
          _NSCoreDataLog( 8LL,  (uint64_t)@"sql connection fetch time: %.4fs",  v85,  v86,  v87,  v88,  v89,  v90,  *(uint64_t *)&v77);
        }
        [v93 drain];
        [0 drain];
        goto LABEL_9;
      }

      if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault")) {
        _NSCoreDataLog( 8LL,  (uint64_t)@"logically false fetch request %@ short circuits.",  v6,  v7,  v8,  v9,  v10,  v11,  v4);
      }
    }

    uint64_t v12 = 0LL;
LABEL_9:
    uint64_t v95 = 1LL;
    [v2 appendBytes:&v95 length:8];
    uint64_t v13 = 0LL;
    if ([v12 count] && v12) {
      uint64_t v13 = v12[3];
    }
    v99[0] = 0LL;
    unint64_t v97 = 2882400171LL;
    [v2 appendBytes:&v97 length:8];
    if (v13 && *(_DWORD *)v13)
    {
      [v2 appendBytes:v13 length:4];
      [v2 appendBytes:v99 length:4];
      uint64_t v96 = *(void *)(v13 + 16);
      [v2 appendBytes:&v96 length:8];
      [v2 appendBytes:**(void **)(v13 + 48) length:v96];
    }

    else
    {
      [v2 appendBytes:v99 length:4];
    }

    if (v12) {

    }
    return v2;
  }

  *(_DWORD *)(*(void *)(a1 + 136) + 72LL) |= 0x20u;
  uint64_t v14 = [(id)a1 request];
  if (*(void *)(a1 + 120))
  {
    uint64_t v15 = v14;
    uint64_t v16 = [(id)a1 fetchStatement];
    if (v16 && !*(_BYTE *)(v16 + 40))
    {
      size_t v34 = (void *)[(id)a1 fetchStatement];
      int v35 = *(unsigned __int8 *)(a1 + 202);
      uint64_t v36 = *(void *)(a1 + 136);
      __int128 v37 = *(void **)(a1 + 24);
      if (+[NSSQLCore debugDefault](&OBJC_CLASS___NSSQLCore, "debugDefault") > 0
        || +[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault"))
      {
        double v38 = CFAbsoluteTimeGetCurrent();
        int v39 = 1;
      }

      else
      {
        int v39 = 0;
        double v38 = 0.0;
      }

      id v92 = objc_alloc_init(MEMORY[0x1896077E8]);
      if (v39)
      {
        uint64_t v40 = [v34 sqlString];
        _NSCoreDataLog(8LL, (uint64_t)@"sql connection fetch statement: '%@'", v41, v42, v43, v44, v45, v46, v40);
      }

      -[NSSQLiteConnection selectRowsWithStatement:cached:](v37, v34, v35 != 0);
      double v47 = CFAbsoluteTimeGetCurrent();
      int v91 = v35;
      __int128 v23 = 0LL;
      unsigned int v48 = 0;
      if (v39) {
        double v49 = v47 - v38;
      }
      else {
        double v49 = 0.0;
      }
      do
      {
        if (v23) {
          fetchResultSetDeallocate((uint64_t)v23);
        }
        __int128 v23 = fetchResultSetAllocateInitialize(v48, (*(_DWORD *)(v36 + 72) >> 5) & 1);
        *((double *)v23 + 1) = v47;
        _DWORD *v23 = 0;
        *(_DWORD *)(v36 + 16) = 0x7FFFFFFF;
        double v50 = 0.0;
        if (v39) {
          double v50 = CFAbsoluteTimeGetCurrent();
        }
        -[NSSQLiteConnection fetchResultSet:usingFetchPlan:]((uint64_t)v37, (uint64_t)v23, v36);
        int v51 = v23[12];
        int v53 = v23[4];
        int v52 = v23[5];
        if (v39) {
          double v49 = v49 + CFAbsoluteTimeGetCurrent() - v50;
        }
        unsigned int v48 = v52 * v53;
      }

      while ((v51 & 1) == 0);
      -[NSSQLiteConnection endFetchAndRecycleStatement:]((uint64_t)v37, v91 != 0);
      if (v39) {
        _NSCoreDataLog( 8LL,  (uint64_t)@"sql connection fetch time: %.4fs",  v54,  v55,  v56,  v57,  v58,  v59,  *(uint64_t *)&v49);
      }
      [v92 drain];
      [0 drain];
      goto LABEL_21;
    }

    if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault")) {
      _NSCoreDataLog( 8LL,  (uint64_t)@"logically false fetch request %@ short circuits.",  v17,  v18,  v19,  v20,  v21,  v22,  v15);
    }
  }

  __int128 v23 = 0LL;
LABEL_21:
  uint64_t v94 = 1LL;
  [v2 appendBytes:&v94 length:8];
  v99[0] = 0LL;
  uint64_t v96 = 2882400171LL;
  [v2 appendBytes:&v96 length:8];
  if (v23 && *v23)
  {
    [v2 appendBytes:v23 length:4];
    __int128 v24 = v23 + 5;
    [v2 appendBytes:v23 + 5 length:4];
    [v2 appendBytes:&v96 length:8];
    int v98 = *v23;
    [v2 appendBytes:&v98 length:4];
    int v98 = v23[1];
    [v2 appendBytes:&v98 length:4];
    unint64_t v97 = (unint64_t)*((double *)v23 + 1);
    [v2 appendBytes:&v97 length:8];
    int v98 = v23[4];
    [v2 appendBytes:&v98 length:4];
    int v98 = v23[5];
    [v2 appendBytes:&v98 length:4];
    int v98 = v23[6];
    [v2 appendBytes:&v98 length:4];
    int v98 = v23[7];
    [v2 appendBytes:&v98 length:4];
    unint64_t v97 = *((void *)v23 + 4);
    [v2 appendBytes:&v97 length:8];
    unint64_t v97 = *((void *)v23 + 5);
    [v2 appendBytes:&v97 length:8];
    int v98 = v23[12];
    [v2 appendBytes:&v98 length:4];
    [v2 appendBytes:v99 length:4];
    [v2 appendBytes:v99 length:8];
    [v2 appendBytes:v99 length:8];
    [v2 appendBytes:v99 length:8];
    [v2 appendBytes:v99 length:8];
    [v2 appendBytes:v99 length:8];
    int v25 = [v2 length];
    uint64_t v26 = *v24;
    if ((_DWORD)v26)
    {
      int v27 = *v24;
      do
      {
        [v2 appendBytes:v99 length:8];
        --v27;
      }

      while (v27);
      [v2 appendBytes:&v96 length:8];
      uint64_t v28 = 0LL;
      uint64_t v29 = 8 * v26;
      do
      {
        uint64_t v95 = *(void *)(*((void *)v23 + 9) + v28);
        [v2 appendBytes:&v95 length:8];
        v28 += 8LL;
      }

      while (v29 != v28);
      uint64_t v30 = [v2 length];
      do
      {
        [v2 appendBytes:v99 length:8];
        LODWORD(v26) = v26 - 1;
      }

      while ((_DWORD)v26);
      uint64_t v31 = 0LL;
      do
      {
        int v32 = [v2 length];
        uint64_t v95 = [v2 length];
        objc_msgSend(v2, "replaceBytesInRange:withBytes:", v30 + v31, 8, &v95);
        [v2 appendBytes:*(void *)(*((void *)v23 + 8) + v31) length:*(void *)(*((void *)v23 + 9) + v31)];
        v31 += 8LL;
      }

      while (v29 != v31);
    }

    else
    {
      [v2 appendBytes:&v96 length:8];
      [v2 length];
    }
  }

  else
  {
    [v2 appendBytes:v99 length:4];
  }

  if (v23) {
    fetchResultSetDeallocate((uint64_t)v23);
  }
  return v2;
}

void sub_1868BB768(uint64_t a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x1868BB730LL);
  }

  JUMPOUT(0x1868BB628LL);
}

void sub_1868BB908(uint64_t a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x1868BB928LL);
  }

  JUMPOUT(0x1868BB628LL);
}

void _executeGenerateObjectIDRequest(void *a1)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    uint64_t v2 = a1[3];
    uint64_t v3 = (void *)a1[11];
  }

  else
  {
    uint64_t v2 = 0LL;
    uint64_t v3 = 0LL;
  }

  CFIndex v4 = [v3 count];
  Mutable = CFDictionaryCreateMutable(0LL, v4, MEMORY[0x189605240], MEMORY[0x189605250]);
  if (a1)
  {
    uint64_t v6 = a1[1];
    if (v6) {
      [*(id *)(v6 + 216) lock];
    }
  }

  -[NSSQLiteConnection beginTransaction](v2);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  uint64_t v7 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = *(const void **)(*((void *)&v16 + 1) + 8 * i);
        -[NSSQLiteConnection generatePrimaryKeysForEntity:batch:]( v2,  (uint64_t)v10,  objc_msgSend((id)objc_msgSend(v3, "objectForKey:", v10), "unsignedIntegerValue"));
        if (!v11)
        {
          id v15 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)&OBJC_CLASS____NSCoreDataException,  *MEMORY[0x189603A58],  134030LL,  (uint64_t)@"unable to generate primary keys",  0LL);
          objc_exception_throw(v15);
          __break(1u);
          return;
        }

        CFDictionarySetValue(Mutable, v10, (const void *)[MEMORY[0x189607968] numberWithLongLong:v11]);
      }

      uint64_t v7 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  -[NSSQLiteConnection commitTransaction](v2);
  if (a1)
  {
    uint64_t v12 = a1[1];
    if (v12) {
      [*(id *)(v12 + 216) unlock];
    }
  }

  -[NSSQLiteConnection endFetchAndRecycleStatement:](v2, 0);
  if (Mutable)
  {
    uint64_t v13 = Mutable;
    CFRelease(Mutable);
  }

  uint64_t v14 = Mutable;
}

void sub_1868BBD08(uint64_t a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x1868BBCE0LL);
  }

  JUMPOUT(0x1868BBC78LL);
}

void __LoadCloudKit_block_invoke()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  _MergedGlobals_85 = (uint64_t)dlopen("/System/Library/Frameworks/CloudKit.framework/CloudKit", 2);
  if (!_MergedGlobals_85 && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT))
  {
    int v0 = 136315138;
    int v1 = dlerror();
    _os_log_fault_impl( &dword_186681000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_FAULT,  "### Failed to Soft Link: /System/Library/Frameworks/CloudKit.framework/CloudKit\n%s",  (uint8_t *)&v0,  0xCu);
  }

Class initCloudKitCKContainer()
{
  if (qword_18C4ABB28 != -1) {
    dispatch_once(&qword_18C4ABB28, &__block_literal_global_31);
  }
  Class result = objc_getClass("CKContainer");
  qword_18C4ABB30 = (uint64_t)result;
  getCloudKitCKContainerClass Class = CloudKitCKContainerFunction;
  return result;
}

Class initCloudKitCKContainerOptions()
{
  if (qword_18C4ABB28 != -1) {
    dispatch_once(&qword_18C4ABB28, &__block_literal_global_31);
  }
  Class result = objc_getClass("CKContainerOptions");
  qword_18C4ABB38 = (uint64_t)result;
  getCloudKitCKContainerOptionsClass[0] = CloudKitCKContainerOptionsFunction;
  return result;
}

Class initCloudKitCKRecordZone()
{
  if (qword_18C4ABB28 != -1) {
    dispatch_once(&qword_18C4ABB28, &__block_literal_global_31);
  }
  Class result = objc_getClass("CKRecordZone");
  qword_18C4ABB40 = (uint64_t)result;
  getCloudKitCKRecordZoneClass Class = CloudKitCKRecordZoneFunction;
  return result;
}

Class initCloudKitCKRecordZoneID()
{
  if (qword_18C4ABB28 != -1) {
    dispatch_once(&qword_18C4ABB28, &__block_literal_global_31);
  }
  Class result = objc_getClass("CKRecordZoneID");
  qword_18C4ABB48 = (uint64_t)result;
  getCloudKitCKRecordZoneIDClass Class = CloudKitCKRecordZoneIDFunction;
  return result;
}

Class initCloudKitCKRecord()
{
  if (qword_18C4ABB28 != -1) {
    dispatch_once(&qword_18C4ABB28, &__block_literal_global_31);
  }
  Class result = objc_getClass("CKRecord");
  qword_18C4ABB50 = (uint64_t)result;
  getCloudKitCKRecordClass Class = CloudKitCKRecordFunction;
  return result;
}

Class initCloudKitCKRecordID()
{
  if (qword_18C4ABB28 != -1) {
    dispatch_once(&qword_18C4ABB28, &__block_literal_global_31);
  }
  Class result = objc_getClass("CKRecordID");
  qword_18C4ABB58 = (uint64_t)result;
  getCloudKitCKRecordIDClass Class = CloudKitCKRecordIDFunction;
  return result;
}

Class initCloudKitCKAcceptSharesOperation()
{
  if (qword_18C4ABB28 != -1) {
    dispatch_once(&qword_18C4ABB28, &__block_literal_global_31);
  }
  Class result = objc_getClass("CKAcceptSharesOperation");
  qword_18C4ABB60 = (uint64_t)result;
  getCloudKitCKAcceptSharesOperationClass[0] = CloudKitCKAcceptSharesOperationFunction;
  return result;
}

Class initCloudKitCKFetchDatabaseChangesOperation()
{
  if (qword_18C4ABB28 != -1) {
    dispatch_once(&qword_18C4ABB28, &__block_literal_global_31);
  }
  Class result = objc_getClass("CKFetchDatabaseChangesOperation");
  qword_18C4ABB68 = (uint64_t)result;
  getCloudKitCKFetchDatabaseChangesOperationClass[0] = CloudKitCKFetchDatabaseChangesOperationFunction;
  return result;
}

Class initCloudKitCKModifyRecordZonesOperation()
{
  if (qword_18C4ABB28 != -1) {
    dispatch_once(&qword_18C4ABB28, &__block_literal_global_31);
  }
  Class result = objc_getClass("CKModifyRecordZonesOperation");
  qword_18C4ABB70 = (uint64_t)result;
  getCloudKitCKModifyRecordZonesOperationClass[0] = CloudKitCKModifyRecordZonesOperationFunction;
  return result;
}

Class initCloudKitCKModifyRecordsOperation()
{
  if (qword_18C4ABB28 != -1) {
    dispatch_once(&qword_18C4ABB28, &__block_literal_global_31);
  }
  Class result = objc_getClass("CKModifyRecordsOperation");
  qword_18C4ABB78 = (uint64_t)result;
  getCloudKitCKModifyRecordsOperationClass[0] = CloudKitCKModifyRecordsOperationFunction;
  return result;
}

Class initCloudKitCKFetchRecordZonesOperation()
{
  if (qword_18C4ABB28 != -1) {
    dispatch_once(&qword_18C4ABB28, &__block_literal_global_31);
  }
  Class result = objc_getClass("CKFetchRecordZonesOperation");
  qword_18C4ABB80 = (uint64_t)result;
  getCloudKitCKFetchRecordZonesOperationClass[0] = CloudKitCKFetchRecordZonesOperationFunction;
  return result;
}

Class initCloudKitCKFetchRecordsOperation()
{
  if (qword_18C4ABB28 != -1) {
    dispatch_once(&qword_18C4ABB28, &__block_literal_global_31);
  }
  Class result = objc_getClass("CKFetchRecordsOperation");
  qword_18C4ABB88 = (uint64_t)result;
  getCloudKitCKFetchRecordsOperationClass[0] = CloudKitCKFetchRecordsOperationFunction;
  return result;
}

Class initCloudKitCKDatabaseSubscription()
{
  if (qword_18C4ABB28 != -1) {
    dispatch_once(&qword_18C4ABB28, &__block_literal_global_31);
  }
  Class result = objc_getClass("CKDatabaseSubscription");
  qword_18C4ABB90 = (uint64_t)result;
  getCloudKitCKDatabaseSubscriptionClass Class = CloudKitCKDatabaseSubscriptionFunction;
  return result;
}

Class initCloudKitCKModifySubscriptionsOperation()
{
  if (qword_18C4ABB28 != -1) {
    dispatch_once(&qword_18C4ABB28, &__block_literal_global_31);
  }
  Class result = objc_getClass("CKModifySubscriptionsOperation");
  qword_18C4ABB98 = (uint64_t)result;
  getCloudKitCKModifySubscriptionsOperationClass[0] = CloudKitCKModifySubscriptionsOperationFunction;
  return result;
}

Class initCloudKitCKAsset()
{
  if (qword_18C4ABB28 != -1) {
    dispatch_once(&qword_18C4ABB28, &__block_literal_global_31);
  }
  Class result = objc_getClass("CKAsset");
  qword_18C4ABBA0 = (uint64_t)result;
  getCloudKitCKAssetClass[0] = CloudKitCKAssetFunction;
  return result;
}

Class initCloudKitCKFetchRecordZoneChangesConfiguration()
{
  if (qword_18C4ABB28 != -1) {
    dispatch_once(&qword_18C4ABB28, &__block_literal_global_31);
  }
  Class result = objc_getClass("CKFetchRecordZoneChangesConfiguration");
  qword_18C4ABBB0 = (uint64_t)result;
  getCloudKitCKFetchRecordZoneChangesConfigurationClass[0] = CloudKitCKFetchRecordZoneChangesConfigurationFunction;
  return result;
}

Class initCloudKitCKFetchRecordZoneChangesOperation()
{
  if (qword_18C4ABB28 != -1) {
    dispatch_once(&qword_18C4ABB28, &__block_literal_global_31);
  }
  Class result = objc_getClass("CKFetchRecordZoneChangesOperation");
  qword_18C4ABBB8 = (uint64_t)result;
  getCloudKitCKFetchRecordZoneChangesOperationClass Class = CloudKitCKFetchRecordZoneChangesOperationFunction;
  return result;
}

Class initCloudKitCKServerChangeToken()
{
  if (qword_18C4ABB28 != -1) {
    dispatch_once(&qword_18C4ABB28, &__block_literal_global_31);
  }
  Class result = objc_getClass("CKServerChangeToken");
  qword_18C4ABBC0 = (uint64_t)result;
  getCloudKitCKServerChangeTokenClass Class = CloudKitCKServerChangeTokenFunction;
  return result;
}

Class initCloudKitCKNotificationInfo()
{
  if (qword_18C4ABB28 != -1) {
    dispatch_once(&qword_18C4ABB28, &__block_literal_global_31);
  }
  Class result = objc_getClass("CKNotificationInfo");
  qword_18C4ABBC8 = (uint64_t)result;
  getCloudKitCKNotificationInfoClass Class = CloudKitCKNotificationInfoFunction;
  return result;
}

Class initCloudKitCKEncryptedData()
{
  if (qword_18C4ABB28 != -1) {
    dispatch_once(&qword_18C4ABB28, &__block_literal_global_31);
  }
  Class result = objc_getClass("CKEncryptedData");
  qword_18C4ABBD0 = (uint64_t)result;
  getCloudKitCKEncryptedDataClass[0] = CloudKitCKEncryptedDataFunction;
  return result;
}

Class initCloudKitCKOperationConfiguration()
{
  if (qword_18C4ABB28 != -1) {
    dispatch_once(&qword_18C4ABB28, &__block_literal_global_31);
  }
  Class result = objc_getClass("CKOperationConfiguration");
  qword_18C4ABBD8 = (uint64_t)result;
  getCloudKitCKOperationConfigurationClass Class = CloudKitCKOperationConfigurationFunction;
  return result;
}

Class initCloudKitCKScheduler()
{
  if (qword_18C4ABB28 != -1) {
    dispatch_once(&qword_18C4ABB28, &__block_literal_global_31);
  }
  Class result = objc_getClass("CKScheduler");
  qword_18C4ABBE0 = (uint64_t)result;
  getCloudKitCKSchedulerClass Class = CloudKitCKSchedulerFunction;
  return result;
}

Class initCloudKitCKSchedulerActivity()
{
  if (qword_18C4ABB28 != -1) {
    dispatch_once(&qword_18C4ABB28, &__block_literal_global_31);
  }
  Class result = objc_getClass("CKSchedulerActivity");
  qword_18C4ABBE8 = (uint64_t)result;
  getCloudKitCKSchedulerActivityClass[0] = CloudKitCKSchedulerActivityFunction;
  return result;
}

Class initCloudKitCKNotificationListener()
{
  if (qword_18C4ABB28 != -1) {
    dispatch_once(&qword_18C4ABB28, &__block_literal_global_31);
  }
  Class result = objc_getClass("CKNotificationListener");
  qword_18C4ABBF0 = (uint64_t)result;
  getCloudKitCKNotificationListenerClass Class = CloudKitCKNotificationListenerFunction;
  return result;
}

Class initCloudKitCKShare()
{
  if (qword_18C4ABB28 != -1) {
    dispatch_once(&qword_18C4ABB28, &__block_literal_global_31);
  }
  Class result = objc_getClass("CKShare");
  qword_18C4ABBF8 = (uint64_t)result;
  getCloudKitCKShareClass Class = CloudKitCKShareFunction;
  return result;
}

Class initCloudKitCKFetchShareParticipantsOperation()
{
  if (qword_18C4ABB28 != -1) {
    dispatch_once(&qword_18C4ABB28, &__block_literal_global_31);
  }
  Class result = objc_getClass("CKFetchShareParticipantsOperation");
  qword_18C4ABC00 = (uint64_t)result;
  getCloudKitCKFetchShareParticipantsOperationClass[0] = CloudKitCKFetchShareParticipantsOperationFunction;
  return result;
}

Class initCloudKitCKFetchShareMetadataOperation()
{
  if (qword_18C4ABB28 != -1) {
    dispatch_once(&qword_18C4ABB28, &__block_literal_global_31);
  }
  Class result = objc_getClass("CKFetchShareMetadataOperation");
  qword_18C4ABC08 = (uint64_t)result;
  getCloudKitCKFetchShareMetadataOperationClass[0] = CloudKitCKFetchShareMetadataOperationFunction;
  return result;
}

Class initCloudKitCKQueryOperation()
{
  if (qword_18C4ABB28 != -1) {
    dispatch_once(&qword_18C4ABB28, &__block_literal_global_31);
  }
  Class result = objc_getClass("CKQueryOperation");
  qword_18C4ABC10 = (uint64_t)result;
  getCloudKitCKQueryOperationClass[0] = CloudKitCKQueryOperationFunction;
  return result;
}

Class initCloudKitCKQuery()
{
  if (qword_18C4ABB28 != -1) {
    dispatch_once(&qword_18C4ABB28, &__block_literal_global_31);
  }
  Class result = objc_getClass("CKQuery");
  qword_18C4ABC18 = (uint64_t)result;
  getCloudKitCKQueryClass[0] = CloudKitCKQueryFunction;
  return result;
}

Class initCloudKitCKQueryCursor()
{
  if (qword_18C4ABB28 != -1) {
    dispatch_once(&qword_18C4ABB28, &__block_literal_global_31);
  }
  Class result = objc_getClass("CKQueryCursor");
  qword_18C4ABC20 = (uint64_t)result;
  getCloudKitCKQueryCursorClass Class = CloudKitCKQueryCursorFunction;
  return result;
}

uint64_t initCloudKitCKCurrentUserDefaultName()
{
  if (qword_18C4ABB28 != -1) {
    dispatch_once(&qword_18C4ABB28, &__block_literal_global_31);
  }
  uint64_t result = *(void *)dlsym((void *)_MergedGlobals_85, "CKCurrentUserDefaultName");
  qword_18C4ABC28 = result;
  getCloudKitCKCurrentUserDefaultName = CKCurrentUserDefaultNameCloudKitFunction;
  return result;
}

uint64_t initCloudKitCKErrorDomain()
{
  if (qword_18C4ABB28 != -1) {
    dispatch_once(&qword_18C4ABB28, &__block_literal_global_31);
  }
  uint64_t result = *(void *)dlsym((void *)_MergedGlobals_85, "CKErrorDomain");
  qword_18C4ABC30 = result;
  getCloudKitCKErrorDomaiuint64_t n = CKErrorDomainCloudKitFunction;
  return result;
}

uint64_t initCloudKitCKPartialErrorsByItemIDKey()
{
  if (qword_18C4ABB28 != -1) {
    dispatch_once(&qword_18C4ABB28, &__block_literal_global_31);
  }
  uint64_t result = *(void *)dlsym((void *)_MergedGlobals_85, "CKPartialErrorsByItemIDKey");
  qword_18C4ABC38 = result;
  getCloudKitCKPartialErrorsByItemIDKey[0] = CKPartialErrorsByItemIDKeyCloudKitFunction;
  return result;
}

uint64_t initCloudKitCKRecordChangedErrorServerRecordKey()
{
  if (qword_18C4ABB28 != -1) {
    dispatch_once(&qword_18C4ABB28, &__block_literal_global_31);
  }
  uint64_t result = *(void *)dlsym((void *)_MergedGlobals_85, "CKRecordChangedErrorServerRecordKey");
  qword_18C4ABC40 = result;
  getCloudKitCKRecordChangedErrorServerRecordKey[0] = CKRecordChangedErrorServerRecordKeyCloudKitFunction;
  return result;
}

uint64_t initCloudKitCKAccountChangedNotification()
{
  if (qword_18C4ABB28 != -1) {
    dispatch_once(&qword_18C4ABB28, &__block_literal_global_31);
  }
  uint64_t result = *(void *)dlsym((void *)_MergedGlobals_85, "CKAccountChangedNotification");
  qword_18C4ABC48 = result;
  getCloudKitCKAccountChangedNotificatiouint64_t n = CKAccountChangedNotificationCloudKitFunction;
  return result;
}

uint64_t initCloudKitCKIdentityUpdateNotification()
{
  if (qword_18C4ABB28 != -1) {
    dispatch_once(&qword_18C4ABB28, &__block_literal_global_31);
  }
  uint64_t result = *(void *)dlsym((void *)_MergedGlobals_85, "CKIdentityUpdateNotification");
  qword_18C4ABC50 = result;
  getCloudKitCKIdentityUpdateNotificatiouint64_t n = CKIdentityUpdateNotificationCloudKitFunction;
  return result;
}

uint64_t initCloudKitCKErrorRetryAfterKey()
{
  if (qword_18C4ABB28 != -1) {
    dispatch_once(&qword_18C4ABB28, &__block_literal_global_31);
  }
  uint64_t result = *(void *)dlsym((void *)_MergedGlobals_85, "CKErrorRetryAfterKey");
  qword_18C4ABC58 = result;
  getCloudKitCKErrorRetryAfterKey[0] = CKErrorRetryAfterKeyCloudKitFunction;
  return result;
}

uint64_t initCloudKitCKRecordZoneDefaultName()
{
  if (qword_18C4ABB28 != -1) {
    dispatch_once(&qword_18C4ABB28, &__block_literal_global_31);
  }
  uint64_t result = *(void *)dlsym((void *)_MergedGlobals_85, "CKRecordZoneDefaultName");
  qword_18C4ABC60 = result;
  getCloudKitCKRecordZoneDefaultName = CKRecordZoneDefaultNameCloudKitFunction;
  return result;
}

uint64_t initCloudKitCKRecordTypeShare()
{
  if (qword_18C4ABB28 != -1) {
    dispatch_once(&qword_18C4ABB28, &__block_literal_global_31);
  }
  uint64_t result = *(void *)dlsym((void *)_MergedGlobals_85, "CKRecordTypeShare");
  qword_18C4ABC68 = result;
  getCloudKitCKRecordTypeShare[0] = CKRecordTypeShareCloudKitFunction;
  return result;
}

uint64_t initCloudKitCKRecordNameZoneWideShare()
{
  if (qword_18C4ABB28 != -1) {
    dispatch_once(&qword_18C4ABB28, &__block_literal_global_31);
  }
  uint64_t result = *(void *)dlsym((void *)_MergedGlobals_85, "CKRecordNameZoneWideShare");
  qword_18C4ABC70 = result;
  getCloudKitCKRecordNameZoneWideShare[0] = CKRecordNameZoneWideShareCloudKitFunction;
  return result;
}

uint64_t initCloudKitCKErrorUserDidResetEncryptedDataKey()
{
  if (qword_18C4ABB28 != -1) {
    dispatch_once(&qword_18C4ABB28, &__block_literal_global_31);
  }
  uint64_t result = *(void *)dlsym((void *)_MergedGlobals_85, "CKErrorUserDidResetEncryptedDataKey");
  qword_18C4ABC78 = result;
  getCloudKitCKErrorUserDidResetEncryptedDataKey = CKErrorUserDidResetEncryptedDataKeyCloudKitFunction;
  return result;
}

uint64_t initCKDatabaseScopeString(uint64_t a1)
{
  if (qword_18C4ABB28 != -1) {
    dispatch_once(&qword_18C4ABB28, &__block_literal_global_31);
  }
  softLinkCKDatabaseScopeString = (uint64_t (*)())dlsym((void *)_MergedGlobals_85, "CKDatabaseScopeString");
  return ((uint64_t (*)(uint64_t))softLinkCKDatabaseScopeString)(a1);
}

uint64_t CloudKitCKContainerFunction()
{
  return qword_18C4ABB30;
}

uint64_t CloudKitCKContainerOptionsFunction()
{
  return qword_18C4ABB38;
}

uint64_t CloudKitCKRecordZoneFunction()
{
  return qword_18C4ABB40;
}

uint64_t CloudKitCKRecordZoneIDFunction()
{
  return qword_18C4ABB48;
}

uint64_t CloudKitCKRecordFunction()
{
  return qword_18C4ABB50;
}

uint64_t CloudKitCKRecordIDFunction()
{
  return qword_18C4ABB58;
}

uint64_t CloudKitCKAcceptSharesOperationFunction()
{
  return qword_18C4ABB60;
}

uint64_t CloudKitCKFetchDatabaseChangesOperationFunction()
{
  return qword_18C4ABB68;
}

uint64_t CloudKitCKModifyRecordZonesOperationFunction()
{
  return qword_18C4ABB70;
}

uint64_t CloudKitCKModifyRecordsOperationFunction()
{
  return qword_18C4ABB78;
}

uint64_t CloudKitCKFetchRecordZonesOperationFunction()
{
  return qword_18C4ABB80;
}

uint64_t CloudKitCKFetchRecordsOperationFunction()
{
  return qword_18C4ABB88;
}

uint64_t CloudKitCKDatabaseSubscriptionFunction()
{
  return qword_18C4ABB90;
}

uint64_t CloudKitCKModifySubscriptionsOperationFunction()
{
  return qword_18C4ABB98;
}

uint64_t CloudKitCKAssetFunction()
{
  return qword_18C4ABBA0;
}

uint64_t CloudKitCKFetchRecordZoneChangesConfigurationFunction()
{
  return qword_18C4ABBB0;
}

uint64_t CloudKitCKFetchRecordZoneChangesOperationFunction()
{
  return qword_18C4ABBB8;
}

uint64_t CloudKitCKServerChangeTokenFunction()
{
  return qword_18C4ABBC0;
}

uint64_t CloudKitCKNotificationInfoFunction()
{
  return qword_18C4ABBC8;
}

uint64_t CloudKitCKEncryptedDataFunction()
{
  return qword_18C4ABBD0;
}

uint64_t CloudKitCKOperationConfigurationFunction()
{
  return qword_18C4ABBD8;
}

uint64_t CloudKitCKSchedulerFunction()
{
  return qword_18C4ABBE0;
}

uint64_t CloudKitCKSchedulerActivityFunction()
{
  return qword_18C4ABBE8;
}

uint64_t CloudKitCKNotificationListenerFunction()
{
  return qword_18C4ABBF0;
}

uint64_t CloudKitCKShareFunction()
{
  return qword_18C4ABBF8;
}

uint64_t CloudKitCKFetchShareParticipantsOperationFunction()
{
  return qword_18C4ABC00;
}

uint64_t CloudKitCKFetchShareMetadataOperationFunction()
{
  return qword_18C4ABC08;
}

uint64_t CloudKitCKQueryOperationFunction()
{
  return qword_18C4ABC10;
}

uint64_t CloudKitCKQueryFunction()
{
  return qword_18C4ABC18;
}

uint64_t CloudKitCKQueryCursorFunction()
{
  return qword_18C4ABC20;
}

uint64_t CKCurrentUserDefaultNameCloudKitFunction()
{
  return qword_18C4ABC28;
}

uint64_t CKErrorDomainCloudKitFunction()
{
  return qword_18C4ABC30;
}

uint64_t CKPartialErrorsByItemIDKeyCloudKitFunction()
{
  return qword_18C4ABC38;
}

uint64_t CKRecordChangedErrorServerRecordKeyCloudKitFunction()
{
  return qword_18C4ABC40;
}

uint64_t CKAccountChangedNotificationCloudKitFunction()
{
  return qword_18C4ABC48;
}

uint64_t CKIdentityUpdateNotificationCloudKitFunction()
{
  return qword_18C4ABC50;
}

uint64_t CKErrorRetryAfterKeyCloudKitFunction()
{
  return qword_18C4ABC58;
}

uint64_t CKRecordZoneDefaultNameCloudKitFunction()
{
  return qword_18C4ABC60;
}

uint64_t CKRecordTypeShareCloudKitFunction()
{
  return qword_18C4ABC68;
}

uint64_t CKRecordNameZoneWideShareCloudKitFunction()
{
  return qword_18C4ABC70;
}

uint64_t CKErrorUserDidResetEncryptedDataKeyCloudKitFunction()
{
  return qword_18C4ABC78;
}

void sub_1868BDEA8( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    JUMPOUT(0x1868BDAC4LL);
  }

  _Unwind_Resume(exception_object);
}

void __Block_byref_object_copy__50(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__50(uint64_t a1)
{
}

void sub_1868BE528( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1868BF028()
{
}

uint64_t _readCompositeAttributeIntoShellFromBytes( uint64_t a1, uint64_t a2, unint64_t *a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unint64_t *a9)
{
  uint64_t AttributeIntoShellFromBytes = _readAttributeIntoShellFromBytes(a1, a2, a3, a4, a5, a6, a7, a8, a9);
  if ((_DWORD)AttributeIntoShellFromBytes)
  {
    unint64_t v15 = *a3;
    unint64_t v16 = (*a3 + 3) & 0xFFFFFFFFFFFFFFFCLL;
    unint64_t v17 = v16 + 4;
    if (v16 + 4 <= a4)
    {
      unsigned int v18 = *(_DWORD *)(a2 + v16);
      if (v18)
      {
        uint64_t v25 = *(void *)(a7 + 8LL * bswap32(v18));
        __int128 v19 = (void *)MEMORY[0x189604010];
        uint64_t v20 = objc_opt_class();
        uint64_t v21 = objc_opt_class();
        uint64_t v22 = objc_opt_class();
        uint64_t v23 = objc_msgSend(v19, "setWithObjects:", v20, v21, v22, objc_opt_class(), 0);
        *(void *)(a5 + 120) = (id)+[_PFRoutines unarchiveCylicGraphObjectOfClasses:fromData:error:]( (uint64_t)&OBJC_CLASS____PFRoutines,  v23,  v25,  (uint64_t)a9);
      }

      unint64_t v15 = v17;
    }

    *a3 = v15;
  }

  return AttributeIntoShellFromBytes;
}

void sub_1868C044C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

void __Block_byref_object_copy__51(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__51(uint64_t a1)
{
}

void sub_1868C0864(_Unwind_Exception *a1)
{
}

void sub_1868C0970(uint64_t a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x1868C097CLL);
  }

  JUMPOUT(0x1868C08A8LL);
}

void sub_1868C1228(_Unwind_Exception *exception_object, int a2)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  if (a2 == 2)
  {
    id v2 = objc_begin_catch(exception_object);
    objc_end_catch();
  }

  else
  {
    objc_begin_catch(exception_object);
  }

  JUMPOUT(0x1868C1060LL);
}

void sub_1868C23B0(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    JUMPOUT(0x1868C2328LL);
  }

  _Unwind_Resume(exception_object);
}

void sub_1868C36F0(_Unwind_Exception *a1)
{
  if (v1) {
    objc_end_catch();
  }
  _Unwind_Resume(a1);
}

void sub_1868C3714(uint64_t a1, int a2)
{
  if (!a2) {
    JUMPOUT(0x1868C371CLL);
  }
  objc_terminate();
  -[NSCloudKitMirroringDelegatePreJazzkonMetadata .cxx_destruct](v2, v3);
}

void sub_1868C4BBC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, void (*a12)(char *))
{
}

void sub_1868C4D30(void *a1)
{
}

void sub_1868C4D44(_Unwind_Exception *a1)
{
}

void sub_1868C4DD0(void *a1)
{
}

void sub_1868C4DE4(_Unwind_Exception *a1)
{
}

uint64_t CocoaError.Code.init(rawValue:)()
{
  return MEMORY[0x189605F50]();
}

uint64_t type metadata accessor for CocoaError()
{
  return MEMORY[0x189605F70]();
}

uint64_t _BridgedStoredNSError.userInfo.getter()
{
  return MEMORY[0x189606900]();
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x189606940]();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x189606A48]();
}

Swift::Void __swiftcall ObservableObjectPublisher.send()()
{
}

uint64_t ObservableObjectPublisher.init()()
{
  return MEMORY[0x189602308]();
}

uint64_t type metadata accessor for ObservableObjectPublisher()
{
  return MEMORY[0x189602310]();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x189607050]();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x189607078]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x1896070D8]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x189607100]();
}

uint64_t static String._uncheckedFromUTF8(_:)()
{
  return MEMORY[0x189617D80]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x189617DD8]();
}

uint64_t String.UTF8View._foreignIndex(after:)()
{
  return MEMORY[0x189617EB8]();
}

uint64_t String.UTF8View._foreignIndex(_:offsetBy:)()
{
  return MEMORY[0x189617ED0]();
}

uint64_t String.UTF8View._foreignDistance(from:to:)()
{
  return MEMORY[0x189617ED8]();
}

uint64_t String.UTF8View._foreignSubscript(position:)()
{
  return MEMORY[0x189617EE0]();
}

uint64_t String.UTF16View.index(_:offsetBy:)()
{
  return MEMORY[0x189617F48]();
}

uint64_t String.subscript.getter()
{
  return MEMORY[0x189618078]();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x1896071D0]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1896071E0]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x189618AC0]();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return MEMORY[0x189618EE0]();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x189619300]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x189619440]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x1896198A8]();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x189619930]();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return MEMORY[0x189619A40](cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t _bridgeAnythingToObjectiveC<A>(_:)()
{
  return MEMORY[0x18961A040]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x18961A050]();
}

uint64_t print(_:separator:terminator:)()
{
  return MEMORY[0x18961A668]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x18961A680]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x18961A6C0]();
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1895F82D8](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1895F82E0](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1895F82E8](c, data, *(void *)&len);
}

int CC_SHA512_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x1895F8318](md, c);
}

int CC_SHA512_Init(CC_SHA512_CTX *c)
{
  return MEMORY[0x1895F8320](c);
}

int CC_SHA512_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1895F8328](c, data, *(void *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return result;
}

CFAllocatorRef CFAllocatorCreate(CFAllocatorRef allocator, CFAllocatorContext *context)
{
  return (CFAllocatorRef)MEMORY[0x1896025E0](allocator, context);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFArrayRef CFArrayCreate( CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x189602638](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x189602648](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x189602660](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x189602678](theArray, range.location, range.length, value);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x189602698](theArray, idx);
}

void CFArrayGetValues(CFArrayRef theArray, CFRange range, const void **values)
{
}

void CFArrayInsertValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

void CFArrayReplaceValues(CFMutableArrayRef theArray, CFRange range, const void **newValues, CFIndex newCount)
{
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

Boolean CFBitVectorContainsBit(CFBitVectorRef bv, CFRange range, CFBit value)
{
  return MEMORY[0x1896027A0](bv, range.location, range.length, *(void *)&value);
}

CFBitVectorRef CFBitVectorCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex numBits)
{
  return (CFBitVectorRef)MEMORY[0x1896027A8](allocator, bytes, numBits);
}

CFBit CFBitVectorGetBitAtIndex(CFBitVectorRef bv, CFIndex idx)
{
  return MEMORY[0x1896027B0](bv, idx);
}

void CFBitVectorGetBits(CFBitVectorRef bv, CFRange range, UInt8 *bytes)
{
}

CFIndex CFBitVectorGetCount(CFBitVectorRef bv)
{
  return MEMORY[0x1896027C0](bv);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x189602A58](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x189602A98](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x189602AB0](theData);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x189602AF0](allocator, at);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x189602B90](theDict, key);
}

CFDictionaryRef CFDictionaryCreate( CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x189602BA8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x189602BB8](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy( CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x189602BC8](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x189602BD0](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x189602C00](theDict, key);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x189602C38](cf1, cf2);
}

CFIndex CFGetRetainCount(CFTypeRef cf)
{
  return MEMORY[0x189602D20](cf);
}

uint64_t CFHashBytes()
{
  return MEMORY[0x189602D58]();
}

uint64_t CFMergeSortArray()
{
  return MEMORY[0x189602E00]();
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x189602EA0](allocator, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1896030F0](cf);
}

void CFRunLoopAddObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x189603140]();
}

CFRunLoopObserverRef CFRunLoopObserverCreate( CFAllocatorRef allocator, CFOptionFlags activities, Boolean repeats, CFIndex order, CFRunLoopObserverCallBack callout, CFRunLoopObserverContext *context)
{
  return (CFRunLoopObserverRef)MEMORY[0x189603158](allocator, activities, repeats, order, callout, context);
}

void CFRunLoopObserverInvalidate(CFRunLoopObserverRef observer)
{
}

void CFRunLoopRemoveObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x189603248](theSet, value);
}

CFSetRef CFSetCreate( CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFSetCallBacks *callBacks)
{
  return (CFSetRef)MEMORY[0x189603250](allocator, values, numValues, callBacks);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x189603260](allocator, capacity, callBacks);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x189603270](theSet);
}

const void *__cdecl CFSetGetValue(CFSetRef theSet, const void *value)
{
  return (const void *)MEMORY[0x189603280](theSet, value);
}

void CFSetGetValues(CFSetRef theSet, const void **values)
{
}

void CFSetRemoveAllValues(CFMutableSetRef theSet)
{
}

void CFSetRemoveValue(CFMutableSetRef theSet, const void *value)
{
}

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFComparisonResult CFStringCompareWithOptions( CFStringRef theString1, CFStringRef theString2, CFRange rangeToCompare, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1896033C8](theString1, theString2, rangeToCompare.location, rangeToCompare.length, compareOptions);
}

CFComparisonResult CFStringCompareWithOptionsAndLocale( CFStringRef theString1, CFStringRef theString2, CFRange rangeToCompare, CFStringCompareFlags compareOptions, CFLocaleRef locale)
{
  return MEMORY[0x1896033D0]( theString1,  theString2,  rangeToCompare.location,  rangeToCompare.length,  compareOptions,  locale);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings( CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return (CFArrayRef)MEMORY[0x189603400](alloc, theString, separatorString);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x189603418](alloc, theString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x189603430](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableWithExternalCharactersNoCopy( CFAllocatorRef alloc, UniChar *chars, CFIndex numChars, CFIndex capacity, CFAllocatorRef externalCharactersAllocator)
{
  return (CFMutableStringRef)MEMORY[0x189603440](alloc, chars, numChars, capacity, externalCharactersAllocator);
}

CFStringRef CFStringCreateWithBytesNoCopy( CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x189603458]( alloc,  bytes,  numBytes,  *(void *)&encoding,  isExternalRepresentation,  contentsDeallocator);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x189603468](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithCStringNoCopy( CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x189603470](alloc, cStr, *(void *)&encoding, contentsDeallocator);
}

CFStringRef CFStringCreateWithCharacters(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars)
{
  return (CFStringRef)MEMORY[0x189603478](alloc, chars, numChars);
}

CFStringRef CFStringCreateWithCharactersNoCopy( CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x189603480](alloc, chars, numChars, contentsDeallocator);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x1896034A8](alloc, str, range.location, range.length);
}

uint64_t CFStringEncodingUnicodeToBytes()
{
  return MEMORY[0x1896034B8]();
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3 = MEMORY[0x1896034C0](theString, stringToFind, compareOptions);
  result.length = v4;
  result.locatiouint64_t n = v3;
  return result;
}

Boolean CFStringFindWithOptions( CFStringRef theString, CFStringRef stringToFind, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x1896034D8]( theString,  stringToFind,  rangeToSearch.location,  rangeToSearch.length,  searchOptions,  result);
}

Boolean CFStringFindWithOptionsAndLocale( CFStringRef theString, CFStringRef stringToFind, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFLocaleRef locale, CFRange *result)
{
  return MEMORY[0x1896034E0]( theString,  stringToFind,  rangeToSearch.location,  rangeToSearch.length,  searchOptions,  locale,  result);
}

CFIndex CFStringGetBytes( CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1896034F0]( theString,  range.location,  range.length,  *(void *)&encoding,  lossByte,  isExternalRepresentation,  buffer,  maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1896034F8](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x189603500](theString, *(void *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x189603510](theString, idx);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x189603520](theString);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x189603540](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x189603548](theString);
}

CFStringEncoding CFStringGetSystemEncoding(void)
{
  return MEMORY[0x189603588]();
}

uint64_t CFStringHashCString()
{
  return MEMORY[0x1896035B0]();
}

void CFStringLowercase(CFMutableStringRef theString, CFLocaleRef locale)
{
}

void CFStringUppercase(CFMutableStringRef theString, CFLocaleRef locale)
{
}

CFURLRef CFURLCreateAbsoluteURLWithBytes( CFAllocatorRef alloc, const UInt8 *relativeURLBytes, CFIndex length, CFStringEncoding encoding, CFURLRef baseURL, Boolean useCompatibilityMode)
{
  return (CFURLRef)MEMORY[0x189603730]( alloc,  relativeURLBytes,  length,  *(void *)&encoding,  baseURL,  useCompatibilityMode);
}

CFIndex CFURLGetBytes(CFURLRef url, UInt8 *buffer, CFIndex bufferLength)
{
  return MEMORY[0x189603810](url, buffer, bufferLength);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x189603870](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x189603888](alloc, uuid);
}

id NSAllocateObject(Class aClass, NSUInteger extraBytes, NSZone *zone)
{
  return (id)MEMORY[0x189607448](aClass, extraBytes, zone);
}

uint64_t NSAllocateScannedUncollectable()
{
  return MEMORY[0x189607450]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x189607458](aClassName);
}

void NSDeallocateObject(id object)
{
}

BOOL NSDecrementExtraRefCountWasZero(id object)
{
  return MEMORY[0x189607498](object);
}

void NSIncrementExtraRefCount(id object)
{
}

void NSLog(NSString *format, ...)
{
}

void *__cdecl NSMapGet(NSMapTable *table, const void *key)
{
  return (void *)MEMORY[0x189607638](table, key);
}

void NSMapInsert(NSMapTable *table, const void *key, const void *value)
{
}

void NSMapRemove(NSMapTable *table, const void *key)
{
}

uint64_t NSRecordAllocationEvent()
{
  return MEMORY[0x1896076B8]();
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x1896076C8]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains( NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1896076E0](directory, domainMask, expandTilde);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1896076F0](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x189607700](aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x189607708](proto);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x189607718](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x189607720]();
}

void NSZoneFree(NSZone *zone, void *ptr)
{
}

CFStringRef SecCopyErrorMessageString(OSStatus status, void *reserved)
{
  return (CFStringRef)MEMORY[0x18960B370](*(void *)&status, reserved);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x18960B400](query, result);
}

CFDictionaryRef SecTaskCopyValuesForEntitlements(SecTaskRef task, CFArrayRef entitlements, CFErrorRef *error)
{
  return (CFDictionaryRef)MEMORY[0x18960B648](task, entitlements, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x18960B668](allocator, token);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1895F8720](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFDictionarySetCapacity()
{
  return MEMORY[0x189604278]();
}

uint64_t _CFExecutableLinkedOnOrAfter()
{
  return MEMORY[0x1896042D8]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x189604828]();
}

uint64_t _NSGetUsingKeyValueGetter()
{
  return MEMORY[0x189607B78]();
}

uint64_t _NSKeyValueCreateImplicitObservationInfo()
{
  return MEMORY[0x189607B80]();
}

uint64_t _NSKeyValueGetterForClassAndKey()
{
  return MEMORY[0x189607B88]();
}

uint64_t _NSKeyValueMutableSetGetterForClassAndKey()
{
  return MEMORY[0x189607B90]();
}

uint64_t _NSKeyValuePrimitiveGetterForClassAndKey()
{
  return MEMORY[0x189607B98]();
}

uint64_t _NSKeyValuePrimitiveSetterForClassAndKey()
{
  return MEMORY[0x189607BA0]();
}

uint64_t _NSKeyValueSetterForClassAndKey()
{
  return MEMORY[0x189607BA8]();
}

uint64_t _NSMethodExceptionProem()
{
  return MEMORY[0x189607BB0]();
}

uint64_t _NSSetUsingKeyValueSetter()
{
  return MEMORY[0x189607BC0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __CFSetLastAllocationEventName()
{
  return MEMORY[0x1896049C0]();
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1895F8918](*(void *)&a1, a2);
}

uint64_t __memmove_chk()
{
  return MEMORY[0x1895F8938]();
}

int __snprintf_chk(char *a1, size_t a2, int a3, size_t a4, const char *a5, ...)
{
  return MEMORY[0x1895F8998](a1, a2, *(void *)&a3, a4, a5);
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x1895F8A00]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1895F8A08]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1895F8A28](*(void *)&a1);
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1895F8A30](*(void *)&a1);
}

const mach_header *__cdecl _dyld_get_image_header(uint32_t image_index)
{
  return (const mach_header *)MEMORY[0x1895F8C00](*(void *)&image_index);
}

const char *__cdecl _dyld_get_image_name(uint32_t image_index)
{
  return (const char *)MEMORY[0x1895F8C08](*(void *)&image_index);
}

uint32_t _dyld_image_count(void)
{
  return MEMORY[0x1895F8C58]();
}

uint64_t _objc_registerTaggedPointerClass()
{
  return MEMORY[0x1896163D8]();
}

void _os_log_error_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl( void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sqlite3_db_clone()
{
  return MEMORY[0x1896170A8]();
}

void abort(void)
{
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1895F9328](a1, *(void *)&a2);
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1895F9540](a1, a2);
}

void *__cdecl bsearch_b(const void *__key, const void *__base, size_t __nel, size_t __width, void *__compar)
{
  return (void *)MEMORY[0x1895F9658](__key, __base, __nel, __width, __compar);
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

BOOL class_addIvar(Class cls, const char *name, size_t size, uint8_t alignment, const char *types)
{
  return MEMORY[0x189616458](cls, name, size, alignment, types);
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x189616460](cls, name, imp, types);
}

BOOL class_conformsToProtocol(Class cls, Protocol *protocol)
{
  return MEMORY[0x189616470](cls, protocol);
}

Protocol **__cdecl class_copyProtocolList(Class cls, unsigned int *outCount)
{
  return (Protocol **)MEMORY[0x189616490](cls, outCount);
}

Method class_getClassMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1896164A0](cls, name);
}

const char *__cdecl class_getImageName(Class cls)
{
  return (const char *)MEMORY[0x1896164A8](cls);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1896164B0](cls, name);
}

size_t class_getInstanceSize(Class cls)
{
  return MEMORY[0x1896164B8](cls);
}

Ivar class_getInstanceVariable(Class cls, const char *name)
{
  return (Ivar)MEMORY[0x1896164C0](cls, name);
}

IMP class_getMethodImplementation(Class cls, SEL name)
{
  return (IMP)MEMORY[0x1896164C8](cls, name);
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x1896164D0](cls);
}

objc_property_t class_getProperty(Class cls, const char *name)
{
  return (objc_property_t)MEMORY[0x1896164D8](cls, name);
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x1896164E0](cls);
}

BOOL class_isMetaClass(Class cls)
{
  return MEMORY[0x1896164F0](cls);
}

BOOL class_respondsToSelector(Class cls, SEL sel)
{
  return MEMORY[0x189616500](cls, sel);
}

int close(int a1)
{
  return MEMORY[0x1895FA590](*(void *)&a1);
}

compression_status compression_stream_destroy(compression_stream *stream)
{
  return MEMORY[0x1896149B8](stream);
}

compression_status compression_stream_init( compression_stream *stream, compression_stream_operation operation, compression_algorithm algorithm)
{
  return MEMORY[0x1896149D0](stream, *(void *)&operation, *(void *)&algorithm);
}

compression_status compression_stream_process(compression_stream *stream, int flags)
{
  return MEMORY[0x1896149E0](stream, *(void *)&flags);
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return MEMORY[0x1895FAA60](from, to, state, *(void *)&flags);
}

copyfile_state_t copyfile_state_alloc(void)
{
  return (copyfile_state_t)MEMORY[0x1895FAA68]();
}

int copyfile_state_free(copyfile_state_t a1)
{
  return MEMORY[0x1895FAA70](a1);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_block_cancel(dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1895FABB0](flags, block);
}

void *__cdecl dispatch_get_context(dispatch_object_t object)
{
  return (void *)MEMORY[0x1895FAC30](object);
}

dispatch_queue_t dispatch_get_current_queue(void)
{
  return (dispatch_queue_t)MEMORY[0x1895FAC38]();
}

dispatch_queue_global_t dispatch_get_global_queue(uint64_t identifier, unint64_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1895FAC40](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x1895FAC48](key);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1895FAC60]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

uint64_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1895FAC80](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency( dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1895FAD68](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class( dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1895FAD78](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD80](label, attr);
}

void *__cdecl dispatch_queue_get_specific(dispatch_queue_t queue, const void *key)
{
  return (void *)MEMORY[0x1895FADA8](queue, key);
}

void dispatch_queue_set_specific( dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(uint64_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1895FADF0](value);
}

uint64_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1895FAE00](dsema);
}

uint64_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1895FAE08](dsema, timeout);
}

void dispatch_set_context(dispatch_object_t object, void *context)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create( dispatch_source_type_t type, uintptr_t handle, unint64_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1895FAE50](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_sync_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1895FAEE8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1895FAF58]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1895FAF60](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1895FAF78](__handle, __symbol);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1895FB088]();
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1895FB210](*(void *)&a1, *(void *)&a2);
}

int flsl(uint64_t a1)
{
  return MEMORY[0x1895FB308](a1);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1895FB360](a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x1895FB378](a1, a2);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1895FB448](*(void *)&a1, a2);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1895FB480](*(void *)&a1, a2);
}

uid_t geteuid(void)
{
  return MEMORY[0x1895FB540]();
}

int getpagesize(void)
{
  return MEMORY[0x1895FB608]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1895FB638]();
}

IMP imp_implementationWithBlock(id block)
{
  return (IMP)MEMORY[0x189616518](block);
}

BOOL imp_removeBlock(IMP anImp)
{
  return MEMORY[0x189616520](anImp);
}

ptrdiff_t ivar_getOffset(Ivar v)
{
  return MEMORY[0x189616538](v);
}

const char *__cdecl ivar_getTypeEncoding(Ivar v)
{
  return (const char *)MEMORY[0x189616540](v);
}

uint64_t kdebug_is_enabled()
{
  return MEMORY[0x1895FB8B0]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1895FB8C0]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

malloc_zone_t *malloc_default_zone(void)
{
  return (malloc_zone_t *)MEMORY[0x1895FBCA0]();
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1895FBCE0](ptr);
}

void malloc_zone_batch_free(malloc_zone_t *zone, void **to_be_freed, unsigned int num)
{
}

unsigned int malloc_zone_batch_malloc( malloc_zone_t *zone, size_t size, void **results, unsigned int num_requested)
{
  return MEMORY[0x1895FBD08](zone, size, results, *(void *)&num_requested);
}

void *__cdecl malloc_zone_calloc(malloc_zone_t *zone, size_t num_items, size_t size)
{
  return (void *)MEMORY[0x1895FBD10](zone, num_items, size);
}

void malloc_zone_free(malloc_zone_t *zone, void *ptr)
{
}

void *__cdecl malloc_zone_malloc(malloc_zone_t *zone, size_t size)
{
  return (void *)MEMORY[0x1895FBD30](zone, size);
}

void *__cdecl malloc_zone_realloc(malloc_zone_t *zone, void *ptr, size_t size)
{
  return (void *)MEMORY[0x1895FBD48](zone, ptr, size);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1895FBE08](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1895FBE30](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1895FBE48](__b, *(void *)&__c, __len);
}

void memset_pattern8(void *__b, const void *__pattern8, size_t __len)
{
}

void method_getArgumentType(Method m, unsigned int index, char *dst, size_t dst_len)
{
}

objc_method_description *__cdecl method_getDescription(Method m)
{
  return (objc_method_description *)MEMORY[0x189616568](m);
}

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x189616570](m);
}

unsigned int method_getNumberOfArguments(Method m)
{
  return MEMORY[0x189616580](m);
}

void method_getReturnType(Method m, char *dst, size_t dst_len)
{
}

const char *__cdecl method_getTypeEncoding(Method m)
{
  return (const char *)MEMORY[0x189616590](m);
}

id method_invoke(id receiver, Method m, ...)
{
  return (id)MEMORY[0x189616598](receiver, m);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1895FBF70](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int mprotect(void *a1, size_t a2, int a3)
{
  return MEMORY[0x1895FBF80](a1, a2, *(void *)&a3);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1895FBF98](a1, a2);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1895FC188](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1895FC198](*(void *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1895FC1B0](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1895FC1B8](name, out_token);
}

uint32_t notify_register_dispatch( const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1895FC1C0](name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1895FC1E8](*(void *)&token, state64);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1896165B8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1896165C0]();
}

Class objc_allocateClassPair(Class superclass, const char *name, size_t extraBytes)
{
  return (Class)MEMORY[0x1896165C8](superclass, name, extraBytes);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1896165D8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1896165E8]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1896165F0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1896165F8](exc_buf);
}

id objc_constructInstance(Class cls, void *bytes)
{
  return (id)MEMORY[0x189616608](cls, bytes);
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void *__cdecl objc_destructInstance(id obj)
{
  return (void *)MEMORY[0x189616668](obj);
}

void objc_disposeClassPair(Class cls)
{
}

Class objc_duplicateClass(Class original, const char *name, size_t extraBytes)
{
  return (Class)MEMORY[0x189616678](original, name, extraBytes);
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1896166A8](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1896166B8](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1896166C8](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1896166D8](location, val);
}

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x1896166F8](location);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x189616700](location);
}

Class objc_lookUpClass(const char *name)
{
  return (Class)MEMORY[0x189616708](name);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616718](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616728](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x189616730]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x189616738]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x189616740]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x189616748]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x189616750]();
}

void objc_registerClassPair(Class cls)
{
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x189616818](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x189616830](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x189616968](location, obj);
}

id objc_storeWeakOrNil(id *location, id obj)
{
  return (id)MEMORY[0x189616970](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x189616978](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x189616980](obj);
}

void objc_terminate(void)
{
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x1896169A8](a1);
}

const char *__cdecl object_getClassName(id a1)
{
  return (const char *)MEMORY[0x1896169B0](a1);
}

void *__cdecl object_getIndexedIvars(id a1)
{
  return (void *)MEMORY[0x1896169B8](a1);
}

id object_getIvar(id a1, Ivar a2)
{
  return (id)MEMORY[0x1896169C0](a1, a2);
}

uint64_t object_getMethodImplementation()
{
  return MEMORY[0x1896169C8]();
}

Class object_setClass(id a1, Class a2)
{
  return (Class)MEMORY[0x1896169D8](a1, a2);
}

Ivar object_setInstanceVariableWithStrongDefault(id obj, const char *name, void *value)
{
  return (Ivar)MEMORY[0x1896169E0](obj, name, value);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1895FC248](a1, *(void *)&a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x1895FC250](a1, *(void *)&a2, *(void *)&a3, *(void *)&a4);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1895FC440](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1895FC600](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1895FC608](log);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1895FC640]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x1895FC668]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1895FC6C0]();
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1895FC880](*(void *)&__fd, __buf, __nbyte, a4);
}

const char *__cdecl property_getAttributes(objc_property_t property)
{
  return (const char *)MEMORY[0x1896169F8](property);
}

objc_method_description protocol_getMethodDescription( Protocol *p, SEL aSel, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
  CFIndex v4 = (const char *)MEMORY[0x189616A38](p, aSel, isRequiredMethod, isInstanceMethod);
  result.types = v5;
  result.name = v4;
  return result;
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x1895FC998](a1);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x1895FC9A0](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x1895FC9A8](a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x1895FC9B0](a1);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x1895FC9C8](a1, a2);
}

uint64_t pthread_key_init_np()
{
  return MEMORY[0x1895FCA68]();
}

int pthread_main_np(void)
{
  return MEMORY[0x1895FCA78]();
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCA88](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1895FCA90](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCA98](a1);
}

int pthread_mutex_trylock(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCAA0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCAA8](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x1895FCAB8](a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x1895FCAC0](a1, *(void *)&a2);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1895FCB20]();
}

void pthread_yield_np(void)
{
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1895FCBA0](*(void *)&__fd, __buf, __nbyte, a4);
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1895FCC38](*(void *)&a1, a2, a3);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1895FCC80](a1, a2);
}

int rename(const char *__old, const char *__new)
{
  return MEMORY[0x1895FCD50](__old, __new);
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x189616A48](sel);
}

uint64_t sel_lookUpByName()
{
  return MEMORY[0x189616A60]();
}

SEL sel_registerName(const char *str)
{
  return (SEL)MEMORY[0x189616A68](str);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1895FCF88](*(void *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FCF90](__str, __size, __format);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1896170C0](a1, *(void *)&a2, a3, *(void *)&n, a5);
}

uint64_t sqlite3_bind_blob_b()
{
  return MEMORY[0x1896170D0]();
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x1896170D8](a1, *(void *)&a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x1896170E0](a1, *(void *)&a2, *(void *)&a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x1896170E8](a1, *(void *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x1896170F0](a1, *(void *)&a2);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1896170F8](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int sqlite3_busy_timeout(sqlite3 *a1, int ms)
{
  return MEMORY[0x189617108](a1, *(void *)&ms);
}

int sqlite3_changes(sqlite3 *a1)
{
  return MEMORY[0x189617110](a1);
}

int sqlite3_clear_bindings(sqlite3_stmt *a1)
{
  return MEMORY[0x189617118](a1);
}

int sqlite3_close_v2(sqlite3 *a1)
{
  return MEMORY[0x189617128](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x189617130](a1, *(void *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x189617138](a1, *(void *)&iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x189617140](pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  return result;
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x189617150](a1, *(void *)&iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x189617158](a1, *(void *)&iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x189617178](a1, *(void *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x189617180](a1, *(void *)&iCol);
}

int sqlite3_create_collation( sqlite3 *a1, const char *zName, int eTextRep, void *pArg, int (__cdecl *xCompare)(void *, int, const void *, int, const void *))
{
  return MEMORY[0x189617190](a1, zName, *(void *)&eTextRep, pArg, xCompare);
}

int sqlite3_create_function( sqlite3 *db, const char *zFunctionName, int nArg, int eTextRep, void *pApp, void (__cdecl *xFunc)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xStep)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xFinal)(sqlite3_context *))
{
  return MEMORY[0x189617198](db, zFunctionName, *(void *)&nArg, *(void *)&eTextRep, pApp, xFunc, xStep, xFinal);
}

int sqlite3_db_config(sqlite3 *a1, int op, ...)
{
  return MEMORY[0x1896171A8](a1, *(void *)&op);
}

int sqlite3_db_status(sqlite3 *a1, int op, int *pCur, int *pHiwtr, int resetFlg)
{
  return MEMORY[0x1896171B8](a1, *(void *)&op, pCur, pHiwtr, *(void *)&resetFlg);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x1896171C8](a1);
}

const char *__cdecl sqlite3_errstr(int a1)
{
  return (const char *)MEMORY[0x1896171D0](*(void *)&a1);
}

int sqlite3_exec( sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1896171D8](a1, sql, callback, a4, errmsg);
}

uint64_t sqlite3_exec_b()
{
  return MEMORY[0x1896171E0]();
}

int sqlite3_extended_result_codes(sqlite3 *a1, int onoff)
{
  return MEMORY[0x1896171F0](a1, *(void *)&onoff);
}

int sqlite3_file_control(sqlite3 *a1, const char *zDbName, int op, void *a4)
{
  return MEMORY[0x1896171F8](a1, zDbName, *(void *)&op, a4);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x189617200](pStmt);
}

void sqlite3_free(void *a1)
{
}

uint64_t sqlite3_intarray_bind()
{
  return MEMORY[0x189617220]();
}

uint64_t sqlite3_intarray_create()
{
  return MEMORY[0x189617228]();
}

uint64_t sqlite3_key_v2()
{
  return MEMORY[0x189617230]();
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return MEMORY[0x189617238](a1);
}

void *__cdecl sqlite3_malloc(int a1)
{
  return (void *)MEMORY[0x189617240](*(void *)&a1);
}

char *sqlite3_mprintf(const char *a1, ...)
{
  return (char *)MEMORY[0x189617248](a1);
}

sqlite3_stmt *__cdecl sqlite3_next_stmt(sqlite3 *pDb, sqlite3_stmt *pStmt)
{
  return (sqlite3_stmt *)MEMORY[0x189617250](pDb, pStmt);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x189617260](filename, ppDb, *(void *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x189617270](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

int sqlite3_prepare_v3( sqlite3 *db, const char *zSql, int nByte, unsigned int prepFlags, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x189617278](db, zSql, *(void *)&nByte, *(void *)&prepFlags, ppStmt, pzTail);
}

uint64_t sqlite3_rekey_v2()
{
  return MEMORY[0x189617280]();
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x189617288](pStmt);
}

void sqlite3_result_blob(sqlite3_context *a1, const void *a2, int a3, void (__cdecl *a4)(void *))
{
}

void sqlite3_result_double(sqlite3_context *a1, double a2)
{
}

void sqlite3_result_error(sqlite3_context *a1, const char *a2, int a3)
{
}

void sqlite3_result_int(sqlite3_context *a1, int a2)
{
}

void sqlite3_result_null(sqlite3_context *a1)
{
}

void sqlite3_result_text(sqlite3_context *a1, const char *a2, int a3, void (__cdecl *a4)(void *))
{
}

int sqlite3_snapshot_cmp(sqlite3_snapshot *p1, sqlite3_snapshot *p2)
{
  return MEMORY[0x1896172C8](p1, p2);
}

void sqlite3_snapshot_free(sqlite3_snapshot *a1)
{
}

int sqlite3_snapshot_get(sqlite3 *db, const char *zSchema, sqlite3_snapshot **ppSnapshot)
{
  return MEMORY[0x1896172D8](db, zSchema, ppSnapshot);
}

int sqlite3_snapshot_open(sqlite3 *db, const char *zSchema, sqlite3_snapshot *pSnapshot)
{
  return MEMORY[0x1896172E0](db, zSchema, pSnapshot);
}

int sqlite3_snapshot_recover(sqlite3 *db, const char *zDb)
{
  return MEMORY[0x1896172E8](db, zDb);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x189617300](a1);
}

int sqlite3_stmt_status(sqlite3_stmt *a1, int op, int resetFlg)
{
  return MEMORY[0x189617310](a1, *(void *)&op, *(void *)&resetFlg);
}

void *__cdecl sqlite3_user_data(sqlite3_context *a1)
{
  return (void *)MEMORY[0x189617330](a1);
}

const void *__cdecl sqlite3_value_blob(sqlite3_value *a1)
{
  return (const void *)MEMORY[0x189617338](a1);
}

int sqlite3_value_bytes(sqlite3_value *a1)
{
  return MEMORY[0x189617340](a1);
}

double sqlite3_value_double(sqlite3_value *a1)
{
  return result;
}

int sqlite3_value_int(sqlite3_value *a1)
{
  return MEMORY[0x189617360](a1);
}

sqlite3_int64 sqlite3_value_int64(sqlite3_value *a1)
{
  return MEMORY[0x189617368](a1);
}

const unsigned __int8 *__cdecl sqlite3_value_text(sqlite3_value *a1)
{
  return (const unsigned __int8 *)MEMORY[0x189617370](a1);
}

int sqlite3_value_type(sqlite3_value *a1)
{
  return MEMORY[0x189617378](a1);
}

int sqlite3_wal_checkpoint_v2(sqlite3 *db, const char *zDb, int eMode, int *pnLog, int *pnCkpt)
{
  return MEMORY[0x189617380](db, zDb, *(void *)&eMode, pnLog, pnCkpt);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1895FCFD0](a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1895FD010](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1895FD018](a1, a2);
}

char *__cdecl strchr(const char *__s, int __c)
{
  return (char *)MEMORY[0x1895FD048](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1895FD050](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1895FD078](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1895FD080](*(void *)&__errnum);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1895FD0A0](__dst, __source, __size);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1895FD0B0](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

char *__cdecl strncat(char *__s1, const char *__s2, size_t __n)
{
  return (char *)MEMORY[0x1895FD0E0](__s1, __s2, __n);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1895FD0E8](__s1, __s2, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1895FD100](__s1, __n);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return (char *)MEMORY[0x1895FD108](__big, __little, __len);
}

char *__cdecl strsep(char **__stringp, const char *__delim)
{
  return (char *)MEMORY[0x1895FD128](__stringp, __delim);
}

char *__cdecl strstr(const char *__big, const char *__little)
{
  return (char *)MEMORY[0x1895FD148](__big, __little);
}

unint64_t strtouq(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FD1E0](__str, __endptr, *(void *)&__base);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x18961B0A0]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x18961B0A8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x18961B0B0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x18961B0E0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x18961B0F8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x18961B108]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x18961B118]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x18961BFB8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x18961BFC0]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x18961BFD0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x18961BFD8]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x18961B158]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x18961B180]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x18961B1B0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x18961B1E8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x18961B1F0]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x18961B270]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x18961B2A8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x18961B2B8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x18961B310]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x18961B328]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x18961B368]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x18961B390]();
}

uint64_t swift_once()
{
  return MEMORY[0x18961B3B8]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x18961B3C0]();
}

uint64_t swift_release()
{
  return MEMORY[0x18961B3C8]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x18961B3D0]();
}

uint64_t swift_retain()
{
  return MEMORY[0x18961B3E0]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x18961B3E8]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x18961C008]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x18961C018]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x18961C038]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x18961B458]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x18961B468]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x18961B518]();
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1895FD2B8](a1, a2, a3, a4, a5);
}

int unlink(const char *a1)
{
  return MEMORY[0x1895FD468](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1895FD490](*(void *)&a1);
}

void uuid_generate_random(uuid_t out)
{
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x1895FD4E8](in, uu);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x1895FD548](*(void *)&target_task, address, size, *(void *)&flags);
}

kern_return_t vm_copy( vm_map_t target_task, vm_address_t source_address, vm_size_t size, vm_address_t dest_address)
{
  return MEMORY[0x1895FD550](*(void *)&target_task, source_address, size, dest_address);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1895FD558](*(void *)&target_task, address, size);
}

kern_return_t vm_purgable_control( vm_map_t target_task, vm_address_t address, vm_purgable_t control, int *state)
{
  return MEMORY[0x1895FD5A0](*(void *)&target_task, address, *(void *)&control, state);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x1895FD8C0](xBOOL);
}

uint64_t xpc_copy_entitlement_for_self()
{
  return MEMORY[0x1895FDAA8]();
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x1895FDEB0](value);
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1895FE050](string);
}

void xpc_transaction_begin(void)
{
}

void xpc_transaction_end(void)
{
}

uint64_t objc_msgSend__newOrderedRelationshipInformationForRelationship_forObjectWithID_withContext_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__newOrderedRelationshipInformationForRelationship_forObjectWithID_withContext_error_);
}

uint64_t objc_msgSend__replacePersistentStoreAtURL_destinationOptions_withPersistentStoreFromURL_sourceOptions_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__replacePersistentStoreAtURL_destinationOptions_withPersistentStoreFromURL_sourceOptions_error_);
}

uint64_t objc_msgSend__replacePersistentStoreAtURL_destinationOptions_withPersistentStoreFromURL_sourceOptions_storeType_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__replacePersistentStoreAtURL_destinationOptions_withPersistentStoreFromURL_sourceOptions_storeType_error_);
}

uint64_t objc_msgSend__shouldAttemptStagedMigrationWithStoreModelVersionChecksum_coordinatorModelVersionChecksum_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__shouldAttemptStagedMigrationWithStoreModelVersionChecksum_coordinatorModelVersionChecksum_error_);
}

uint64_t objc_msgSend__updateLocationsOfObjectsToLocationByOrderKey_inRelationshipWithName_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__updateLocationsOfObjectsToLocationByOrderKey_inRelationshipWithName_error_);
}

uint64_t objc_msgSend__writeIntoData_propertiesDict_uniquedPropertyNames_uniquedStrings_uniquedData_entitiesSlots_fetchRequests_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__writeIntoData_propertiesDict_uniquedPropertyNames_uniquedStrings_uniquedData_entitiesSlots_fetchRequests_);
}

uint64_t objc_msgSend__writeIntoData_propertiesDict_uniquedPropertyNames_uniquedStrings_uniquedData_uniquedMappings_entities_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__writeIntoData_propertiesDict_uniquedPropertyNames_uniquedStrings_uniquedData_uniquedMappings_entities_);
}

uint64_t objc_msgSend_applyAccumulatedChangesToStore_inManagedObjectContext_withStoreMonitor_madeChanges_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_applyAccumulatedChangesToStore_inManagedObjectContext_withStoreMonitor_madeChanges_error_);
}

uint64_t objc_msgSend_checkForObjectsNeedingExportInStore_andReturnCount_withManagedObjectContext_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_checkForObjectsNeedingExportInStore_andReturnCount_withManagedObjectContext_error_);
}

uint64_t objc_msgSend_checkIfContentsOfStore_matchContentsOfStore_onlyCompareSharedZones_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_checkIfContentsOfStore_matchContentsOfStore_onlyCompareSharedZones_error_);
}

uint64_t objc_msgSend_compareRelationshipsOfRecordID_withStoreObject_andOtherObject_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_compareRelationshipsOfRecordID_withStoreObject_andOtherObject_error_);
}

uint64_t objc_msgSend_countMoveReceiptsInStore_matchingPredicate_withManagedObjectContext_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_countMoveReceiptsInStore_matchingPredicate_withManagedObjectContext_error_);
}

uint64_t objc_msgSend_createDestinationInstancesForSourceInstance_entityMapping_manager_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_createDestinationInstancesForSourceInstance_entityMapping_manager_error_);
}

uint64_t objc_msgSend_createMirroringResultForRequest_storeIdentifier_success_madeChanges_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_createMirroringResultForRequest_storeIdentifier_success_madeChanges_error_);
}

uint64_t objc_msgSend_createRelationshipsForDestinationInstance_entityMapping_manager_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_createRelationshipsForDestinationInstance_entityMapping_manager_error_);
}

uint64_t objc_msgSend_destinationURLForMigrationSourceURL_createDocumentReplacementDirectory_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_destinationURLForMigrationSourceURL_createDocumentReplacementDirectory_error_);
}

uint64_t objc_msgSend_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_executeImportOperationsAndAccumulateRecordsWithManagedObjectContext_completion_);
}

uint64_t objc_msgSend_fetchRequestForSourceEntityNamed_predicateString_includesSubentities_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_fetchRequestForSourceEntityNamed_predicateString_includesSubentities_);
}

uint64_t objc_msgSend_getBytes_maxLength_usedLength_encoding_options_range_remainingRange_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_getBytes_maxLength_usedLength_encoding_options_range_remainingRange_);
}

uint64_t objc_msgSend_initWithConstraint_databaseObject_databaseSnapshot_conflictingObjects_conflictingSnapshots_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithConstraint_databaseObject_databaseSnapshot_conflictingObjects_conflictingSnapshots_);
}

uint64_t objc_msgSend_initWithInsertedObjects_updatedObjects_deletedObjects_lockedObjects_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initWithInsertedObjects_updatedObjects_deletedObjects_lockedObjects_);
}

uint64_t objc_msgSend_initWithLabel_forEventsOfType_withConfiguration_affectingObjectsMatching_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initWithLabel_forEventsOfType_withConfiguration_affectingObjectsMatching_);
}

uint64_t objc_msgSend_initWithManagedObject_withRecordName_relatedToRecordWithRecordName_byRelationship_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initWithManagedObject_withRecordName_relatedToRecordWithRecordName_byRelationship_);
}

uint64_t objc_msgSend_initWithRecordID_forRecordWithID_relatedToRecordWithID_byRelationship_withInverse_andType_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithRecordID_forRecordWithID_relatedToRecordWithID_byRelationship_withInverse_andType_);
}

uint64_t objc_msgSend_initWithRequest_storeIdentifier_acceptedShares_acceptedShareMetadatas_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initWithRequest_storeIdentifier_acceptedShares_acceptedShareMetadatas_error_);
}

uint64_t objc_msgSend_initWithRequest_storeIdentifier_success_madeChanges_updatedObjectIDs_failedObjectIDToError_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithRequest_storeIdentifier_success_madeChanges_updatedObjectIDs_failedObjectIDToError_error_);
}

uint64_t objc_msgSend_initWithSource_newVersion_oldVersion_cachedSnapshot_persistedSnapshot_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initWithSource_newVersion_oldVersion_cachedSnapshot_persistedSnapshot_);
}

uint64_t objc_msgSend_initWithStoreBytes_length_externalLocation_safeguardLocation_protectionLevel_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initWithStoreBytes_length_externalLocation_safeguardLocation_protectionLevel_);
}

uint64_t objc_msgSend_initWithUpdatedRecords_deletedRecordTypeToRecordIDs_options_fileBackedFuturesDirectory_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithUpdatedRecords_deletedRecordTypeToRecordIDs_options_fileBackedFuturesDirectory_);
}

uint64_t objc_msgSend_insertMetadataForObject_setRecordName_inZoneWithID_recordNamePrefix_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_insertMetadataForObject_setRecordName_inZoneWithID_recordNamePrefix_error_);
}

uint64_t objc_msgSend_managedObjectContext_didExecuteFetchRequest_withSQLString_bindVariables_rowCount_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_managedObjectContext_didExecuteFetchRequest_withSQLString_bindVariables_rowCount_);
}

uint64_t objc_msgSend_mergeToManyRelationshipForSourceObject_withOldSnapshot_newSnapshot_andAncestor_andLegacyPath_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_mergeToManyRelationshipForSourceObject_withOldSnapshot_newSnapshot_andAncestor_andLegacyPath_);
}

uint64_t objc_msgSend_migrateStoreFromURL_type_options_withMappingModel_toDestinationURL_destinationType_destinationOptions_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_migrateStoreFromURL_type_options_withMappingModel_toDestinationURL_destinationType_destinationOptions_error_);
}

uint64_t objc_msgSend_moveReceiptsMatchingRecordIDs_inManagedObjectContext_persistentStore_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_moveReceiptsMatchingRecordIDs_inManagedObjectContext_persistentStore_error_);
}

uint64_t objc_msgSend_newBatchRowAllocation_count_forSQLEntity_withOwnedObjectIDs_andTimestamp_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_newBatchRowAllocation_count_forSQLEntity_withOwnedObjectIDs_andTimestamp_);
}

uint64_t objc_msgSend_persistentStoreCoordinator_didSuccessfullyAddPersistentStore_withDescription_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_persistentStoreCoordinator_didSuccessfullyAddPersistentStore_withDescription_);
}

uint64_t objc_msgSend_processFaultForRelationshipWithName_onObjectWithID_fromClientWithContext_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_processFaultForRelationshipWithName_onObjectWithID_fromClientWithContext_error_);
}

uint64_t objc_msgSend_replacePersistentStoreAtURL_destinationOptions_withPersistentStoreFromURL_sourceOptions_storeType_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_replacePersistentStoreAtURL_destinationOptions_withPersistentStoreFromURL_sourceOptions_storeType_error_);
}

uint64_t objc_msgSend_updateRelationshipValueUsingImportContext_andManagedObjectContext_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_updateRelationshipValueUsingImportContext_andManagedObjectContext_error_);
}