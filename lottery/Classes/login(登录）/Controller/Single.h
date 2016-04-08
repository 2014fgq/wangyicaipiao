//
//  header.h
//  lottery
//
//  Created by IMAC on 16/4/5.
//  Copyright © 2016年 FZQ. All rights reserved.
//

#ifndef header_h
#define header_h

#if 1
#define SINGLE_H(name) +(instancetype)share##name;

//arc
#if __has_feature(objc_arc)
#define SINGLE_M(name) static id _instance;\
+(instancetype)allocWithZone:(struct _NSZone *)zone\
{\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
_instance = [[super allocWithZone:zone]init];\
});\
\
return _instance;\
}\
+(instancetype)share##name\
{\
    return [[self alloc]init];\
}\
\
-(nonnull id)copy\
{\
    return _instance;\
}\
\
-(nonnull id)mutableCopy\
{\
    return _instance;\
}

//mrc
#else
#define SINGLE_M(name) static id _instance;\
+(instancetype)allocWithZone:(struct _NSZone *)zone\
{\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
_instance = [[super allocWithZone:zone]init];\
});\
\
return _instance;\
}\
\
+(instancetype)shareLoginViewController\
{\
    return [[self alloc]init];\
}\
\
-(nonnull id)copy\
{\
    return _instance;\
}\
\
-(nonnull id)mutableCopy\
{\
    return _instance;\
}\
\
-(oneway void)release{}\
\
-(instancetype)retain\
{\
    return _instance;\
}\
\
-(NSInteger)retainCount\
{\
    return MAXFLOAT;\
}
#endif

#endif


#endif /* header_h */
